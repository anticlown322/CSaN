Unit uInterfacesScanner;

Interface

Uses
    Windows,
    Winsock,
    Classes,
    Sysutils,
    Iphlpapi,
    IpTypes;

Const
    SIO_GET_INTERFACE_LIST = $4004747F;
    IFF_UP = $00000001;
    IFF_BROADCAST = $00000002;
    IFF_LOOPBACK = $00000004;
    IFF_POINTTOPOINT = $00000008;
    IFF_MULTICAST = $00000010;

Type
    SockAddrGen = Packed Record
        AddressIn: SockAddr_In;
        Padding: Packed Array [0 .. 7] Of Byte;
    End;

    InterfaceInfo = Record
        IiFlags: U_Long;
        IiAddress: SockAddrGen;
        IiBroadcastAddress: SockAddrGen;
        IiNetmask: SockAddrGen;
    End;

    TNetworkInterface = Record
        Name: String;
        AddrIP: String;
        AddrMAC: String;
        SubnetMask: String;
        AddrNet: String;
    End;

    TNetworkInterfaceList = Array Of TNetworkInterface;

    // exported
Function WSAIoctl(ASocket: TSocket; ACommand: DWord; LpInBuffer: Pointer; DwInBufferLen: DWord; LpOutBuffer: Pointer;
    DwOutBufferLen: DWord; LpdwOutBytesReturned: LPDWord; LpOverLapped: Pointer; LpOverLappedRoutine: Pointer): Integer;
    Stdcall; External 'WS2_32.DLL';
Function SendArp(DestIP, SrcIP: ULONG; PMacAddr: Pointer; PhyAddrLen: Pointer): DWord; StdCall;
    External 'iphlpapi.dll' Name 'SendARP';

// my
Procedure ScanNetworkWinAPI(Answer: TStringList);
Procedure ScanNetworkIphlpAPI(Answer: TStringList);

Implementation

{ Interfaces - IphlpAPI }

Procedure ScanNetworkIphlpAPI(Answer: TStringList);
Var
    PAdapterInfo, PAdapter: PIP_ADAPTER_INFO;
    BufLen, Status: DWORD;
    StrMAC: String;
Begin
    GetAdaptersInfo(Nil, BufLen);
    PAdapterInfo := AllocMem(BufLen);
    Try
        Status := GetAdaptersInfo(PAdapterInfo, BufLen);

        If (Status <> ERROR_SUCCESS) Then
        Begin
            Case Status Of
                ERROR_NOT_SUPPORTED:
                    Answer.Add('GetAdaptersInfo не поддерживается данной операционной системой');
                ERROR_NO_DATA:
                    Answer.Add('Не найдено сетевых адаптеров.');
            Else
                Answer.Add('Ошибка GetAdaptersInfo: ' + IntToStr(Status));
            End;

            Exit;
        End;

        PAdapter := PAdapterInfo;

        While (PAdapter <> Nil) Do
        Begin
            Answer.Add('');
            Answer.Add('Описание: ' + PAdapter^.Description);
            Answer.Add('Имя: ' + PAdapter^.AdapterName);

            StrMAC := '';
            For Var I := 0 To PAdapter^.AddressLength - 1 Do
                StrMAC := StrMAC + '-' + IntToHex(PAdapter^.Address[I], 2);

            Delete(StrMAC, 1, 1);
            Answer.Add('MAC-адрес: ' + StrMAC);
            Answer.Add('IP-адреc: ' + PAdapter^.IpAddressList.IpAddress.S);
            Answer.Add('Маска сети: ' + PAdapter^.IpAddressList.IpMask.S);
            Answer.Add('Номер сети: ' + PAdapter^.GatewayList.IpAddress.S);

            PAdapter := PAdapter^.Next;
        End;
    Finally
        FreeMem(PAdapterInfo);
    End;
End;

{ Interfaces - WinAPI }

Function GetMacAddr(Const IPAddress: String; Var ErrCode: DWORD): String;
Var
    MacAddr: Array [0 .. 5] Of Byte;
    DestIP: ULONG;
    PhyAddrLen: ULONG;
    WSAData: TWSAData;
Begin
    Result := '';
    WSAStartup($0101, WSAData);
    Try
        ZeroMemory(@MacAddr, SizeOf(MacAddr));
        DestIP := Inet_addr(PAnsiChar(AnsiString(IPAddress)));
        PhyAddrLen := SizeOf(MacAddr);
        ErrCode := SendArp(DestIP, 0, @MacAddr, @PhyAddrLen);
        If ErrCode = S_OK Then
            Result := Format('%2.2x-%2.2x-%2.2x-%2.2x-%2.2x-%2.2x', [MacAddr[0], MacAddr[1], MacAddr[2], MacAddr[3],
                MacAddr[4], MacAddr[5]])
    Finally
        WSACleanup;
    End;
End;

Procedure ScanNetworkWinAPI(Answer: TStringList);
Var
    NetworkInterfaceList: TNetworkInterfaceList;
    ASocket: TSocket;
    AWSADataRecord: WSAData;
    NumOfBytesReturned: U_Long;
    NameLength: DWord;
    PAddrIP, PAddrSubnetMask: SockAddr_In;
    NetAddrDummy: In_Addr;
    Buffer: Array [0 .. 30] Of InterfaceInfo;
    ComputerName: Array [0 .. 256] Of Char;
    Size: DWORD;
    I, NumOfInterfaces: Integer;
    ErrCode: Cardinal;
Begin
    WSAStartup(MAKEWORD(2, 0), AWSADataRecord);
    ASocket := Socket(AF_INET, SOCK_STREAM, 0);

    If (ASocket = INVALID_SOCKET) Then
    Begin
        Answer.Add('Ошибка при попытке открыть сокет!');
        Exit;
    End;

    Try
        If WSAIoCtl(ASocket, SIO_GET_INTERFACE_LIST, NIL, 0, @Buffer, 1024, @NumOfBytesReturned, NIL, NIL) <>
            SOCKET_ERROR Then
        Begin
            NumOfInterfaces := NumOfBytesReturned Div SizeOf(InterfaceInfo);
            SetLength(NetworkInterfaceList, NumOfInterfaces);

            For I := Low(NetworkInterfaceList) To High(NetworkInterfaceList) Do
                With NetworkInterfaceList[I] Do
                Begin
                    // name
                    NameLength := MAX_COMPUTERNAME_LENGTH + 1;
                    SetLength(Name, NameLength);

                    Name := '';

                    // IP address
                    PAddrIP := Buffer[I].IiAddress.AddressIn;
                    AddrIP := String(Inet_ntoa(PAddrIP.Sin_Addr));

                    // MAC address
                    AddrMAC := GetMacAddr(AddrIP, ErrCode);

                    // subnet mask
                    PAddrSubnetMask := Buffer[I].IiNetMask.AddressIn;
                    SubnetMask := String(Inet_ntoa(PAddrSubnetMask.Sin_Addr));

                    GetComputerName(ComputerName, Size);
                    Name := ComputerName;

                    // net
                    NetAddrDummy.S_addr := Buffer[I].IiAddress.AddressIn.Sin_Addr.S_Addr;
                    NetAddrDummy.S_addr := NetAddrDummy.S_addr And Buffer[I].IiNetMask.AddressIn.Sin_Addr.S_Addr;
                    AddrNet := String(Inet_ntoa((NetAddrDummy)));
                End;

            For I := Low(NetworkInterfaceList) To High(NetworkInterfaceList) Do
            Begin
                Answer.Add('№' + Inttostr(I));
                Answer.Add('Имя: ' + NetworkInterfaceList[I].Name);
                Answer.Add('IP-адрес: ' + NetworkInterfaceList[I].AddrIP);
                Answer.Add('MAC-адрес: ' + NetworkInterfaceList[I].AddrMAC);
                Answer.Add('Маска сети: ' + NetworkInterfaceList[I].SubnetMask);
                Answer.Add('Номер сети: ' + NetworkInterfaceList[I].AddrNet);
                Answer.Add('--------------------------------------');
            End;
        End;
    Except
        Answer.Add('');
        Answer.Add('Ошибка при сборе информации об адаптерах!');
        Answer.Add('Остановка сканирования');
    End;

    CloseSocket(ASocket);
    WSACleanUp;
End;

End.
