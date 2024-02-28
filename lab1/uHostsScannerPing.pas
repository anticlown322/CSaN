Unit uHostsScannerPing;

Interface

Uses
    Classes,
    IdIcmpClient,
    Windows,
    Winsock,
    Iphlpapi;

Procedure ScanDevicesPing(Const IPAddr: String; Answer: TStrings);

Function SendArp(DestIP, SrcIP: ULONG; PMacAddr: Pointer; PhyAddrLen: Pointer): DWord; StdCall;
    External 'iphlpapi.dll' Name 'SendARP';

Implementation

Uses
    SySutils;

Const
    START_IND = 1;
    END_IND = 254;

{ Devices - Ping }

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

Function FindLastOccurence(Const FindS, SrcS: String): Integer;
    Function InvertS(Const S: String): String;
    Var
        I, Len: Integer;
    Begin
        Len := Length(S);
        SetLength(Result, Len);
        For I := 1 To Len Do
            Result[I] := S[Len - I + 1];
    End;

Var
    Positon: Integer;
Begin
    Positon := Pos(InvertS(FindS), InvertS(SrcS));

    If Positon <> 0 Then
        Result := Length(SrcS) - Length(FindS) - Positon + 2
    Else
        Result := 0;
End;

Procedure ScanDevicesPing(Const IPAddr: String; Answer: TStrings);
Var
    PingClient: TIdIcmpClient;
    Buffer, IPMask: String;
    ErrorCode: DWOrd;
Begin
    PingClient := TIdIcmpClient.Create();
    PingClient.ReceiveTimeout := 300;
    PingClient.PacketSize := 1024;

    IPMask := Copy(IPAddr, 1, FindLastOccurence('.', IPAddr));
    For Var I := START_IND To END_IND Do
    Begin
        PingClient.Host := IPMask + Inttostr(I);
        Answer.Add('пингуем ' + PingClient.Host);
        Buffer := PingClient.Host + StringOfChar(' ', 65536);

        Try
            PingClient.Ping(Buffer);
        Except
            On E: Exception Do
            Begin
                Answer.Add(#9#9 + 'Сканирование прервано из-за ошибки ');
                Answer.Add(#9#9#9 + E.Message);
                Exit;
            End;
        End;

        If PingClient.ReplyStatus.ReplyStatusType = RsEcho Then
        Begin
            Answer.Add('>>> ' + PingClient.Host + ' ответил!');
            Answer.Add('>>> ' + 'MAC-адрес: ' + GetMacAddr(PingClient.Host, ErrorCode));
        End;
    End;

    Answer.Add(#9#9 + 'Сканирование завершено');
    PingClient.Free;
End;

End.
