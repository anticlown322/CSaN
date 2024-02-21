Unit uTScanner;

Interface

Uses
    Windows,
    Winsock;

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
        ComputerName: String;
        AddrIP: String;
        SubnetMask: String;
        AddrNet: String;
        IsInterfaceUp: Boolean;
        BroadcastSupport: Boolean;
        IsLoopback: Boolean;
    End;

    TNetworkInterfaceList = Array Of TNetworkInterface;

Function WSAIoctl(ASocket: TSocket; ACommand: DWord; LpInBuffer: Pointer; DwInBufferLen: DWord; LpOutBuffer: Pointer;
    DwOutBufferLen: DWord; LpdwOutBytesReturned: LPDWord; LpOverLapped: Pointer; LpOverLappedRoutine: Pointer): Integer;
    Stdcall; External 'WS2_32.DLL';

Function GetNetworkInterfaces(Var NetworkInterfaceList: TNetworkInterfaceList): Boolean;

Implementation

{ network }

Function GetNetworkInterfaces(Var NetworkInterfaceList: TNetworkInterfaceList): Boolean;
Var
    ASocket: TSocket;
    AWSADataRecord: WSAData;
    NumOfInterfaces: Integer;
    NumOfBytesReturned: U_Long;
    NameLength: DWord;
    PAddrIP: SockAddr_In;
    PAddrSubnetMask: SockAddr_In;
    NetAddrDummy: In_Addr;
    Buffer: Array [0 .. 30] Of InterfaceInfo;
Begin
    WSAStartup(MAKEWORD(2, 0), AWSADataRecord);
    ASocket := Socket(AF_INET, SOCK_STREAM, 0);

    Result := False;
    If (ASocket = INVALID_SOCKET) Then
        Exit
    Else
        Result := True;

    Try
        If WSAIoCtl(ASocket, SIO_GET_INTERFACE_LIST, NIL, 0, @Buffer, 1024, @NumOfBytesReturned, NIL, NIL) <>
            SOCKET_ERROR Then
        Begin
            NumOfInterfaces := NumOfBytesReturned Div SizeOf(InterfaceInfo);
            SetLength(NetworkInterfaceList, NumOfInterfaces);

            For Var I := Low(NetworkInterfaceList) To High(NetworkInterfaceList) Do
                With NetworkInterfaceList[I] Do
                Begin
                    // Get the name of the machine
                    NameLength := MAX_COMPUTERNAME_LENGTH + 1;
                    SetLength(ComputerName, NameLength);
                    If Not GetComputerName(PChar(Computername), NameLength) Then
                        ComputerName := '';

                    // Get the IP address
                    PAddrIP := Buffer[I].IiAddress.AddressIn;
                    AddrIP := String(Inet_ntoa(PAddrIP.Sin_Addr));

                    // Get the subnet mask
                    PAddrSubnetMask := Buffer[I].IiNetMask.AddressIn;
                    SubnetMask := String(Inet_ntoa(PAddrSubnetMask.Sin_Addr));

                    // Calculate the net
                    NetAddrDummy.S_addr := Buffer[I].IiAddress.AddressIn.Sin_Addr.S_Addr;
                    NetAddrDummy.S_addr := NetAddrDummy.S_addr And Buffer[I].IiNetMask.AddressIn.Sin_Addr.S_Addr;

                    AddrNet := String(Inet_ntoa((NetAddrDummy)));
                End;
        End;
    Except
        Result := False;
    End;

    CloseSocket(ASocket);
    WSACleanUp;
End;

End.
