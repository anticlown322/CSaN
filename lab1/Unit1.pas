Unit Unit1;

Interface

Uses
    Windows,
    WinSock,
    Classes;

Type
    Ip_option_information = Packed Record // ���������� ��������� IP (����������
        // ���� ��������� � ������ ����� ������ � RFC791.
        Ttl: Byte; // ����� ����� (������������ traceroute-��)
        Tos: Byte; // ��� ������������, ������ 0
        Flags: Byte; // ����� ��������� IP, ������ 0
        OptionsSize: Byte; // ������ ������ � ���������, ������ 0, �������� 40
        OptionsData: Pointer; // ��������� �� ������
    End;

    Icmp_echo_reply = Packed Record
        Address: U_long; // ����� �����������
        Status: U_long; // IP_STATUS (��. ����)
        RTTime: U_long; // ����� ����� ���-�������� � ���-�������
        // � �������������
        DataSize: U_short; // ������ ������������ ������
        Reserved: U_short; // ���������������
        Data: Pointer; // ��������� �� ������������ ������
        Options: Ip_option_information; // ���������� �� ��������� IP
    End;

    PIPINFO = ^Ip_option_information;
    PVOID = Pointer;

Function IcmpCreateFile(): THandle; Stdcall; External 'ICMP.DLL' Name 'IcmpCreateFile';
Function IcmpCloseHandle(IcmpHandle: THandle): BOOL; Stdcall; External 'ICMP.DLL' Name 'IcmpCloseHandle';
Function IcmpSendEcho(IcmpHandle: THandle; // handle, ������������ IcmpCreateFile()
    DestAddress: U_long; // ����� ���������� (� ������� �������)
    RequestData: PVOID; // ��������� �� ���������� ������
    RequestSize: Word; // ������ ���������� ������
    RequestOptns: PIPINFO; // ��������� �� ���������� ���������
    // ip_option_information (����� ���� nil)
    ReplyBuffer: PVOID; // ��������� �� �����, ���������� ������.
    ReplySize: DWORD; // ������ ������ �������
    Timeout: DWORD// ����� �������� ������ � �������������
    ): DWORD; Stdcall; External 'ICMP.DLL' Name 'IcmpSendEcho';

Implementation

Procedure Ping();
Var
    HIP: THandle;
    PingBuffer: Array [0 .. 31] Of Char;
    PIpe: ^Icmp_echo_reply;
    PHostEn: PHostEnt;
    WVersionRequested: WORD;
    LwsaData: WSAData;
    Error: DWORD;
    DestAddress: In_Addr;
Begin
    //
    // // ������� handle
    // HIP := IcmpCreateFile();
    //
    // GetMem(PIpe, Sizeof(Icmp_echo_reply) + Sizeof(PingBuffer));
    // PIpe.Data := @PingBuffer;
    // PIpe.DataSize := Sizeof(PingBuffer);
    //
    // WVersionRequested := MakeWord(1, 1);
    // Error := WSAStartup(WVersionRequested, LwsaData);
    // If (Error <> 0) Then
    // Begin
    // Memo1.SetTextBuf('Error in call to ' + 'WSAStartup().');
    // Memo1.Lines.Add('Error code: ' + IntToStr(Error));
    // Exit;
    // End;
    //
    // PHostEn := Gethostbyname('172.16.10.1');
    // Error := GetLastError();
    // If (Error <> 0) Then
    // Begin
    // Memo1.SetTextBuf('Error in call to' + 'gethostbyname().');
    // Memo1.Lines.Add('Error code: ' + IntToStr(Error));
    // Exit;
    // End;
    //
    // DestAddress := PInAddr(PHostEn^.H_addr_list^)^;
    //
    // // �������� ping-�����
    // Memo1.Lines.Add('Pinging ' + PHostEn^.H_name + ' [' + Inet_ntoa(DestAddress) + '] ' + ' with ' +
    // IntToStr(Sizeof(PingBuffer)) + ' bytes of data:');
    //
    // IcmpSendEcho(HIP, DestAddress.S_addr, @PingBuffer, Sizeof(PingBuffer), Nil, PIpe,
    // Sizeof(Icmp_echo_reply) + Sizeof(PingBuffer), 5000);
    //
    // Error := GetLastError();
    // If (Error <> 0) Then
    // Begin
    // Memo1.SetTextBuf('Error in call to ' + 'IcmpSendEcho()');
    // Memo1.Lines.Add('Error code: ' + IntToStr(Error));
    // Exit;
    // End;
    //
    // // ������� ��������� �� ����������� ������
    // Memo1.Lines.Add('Reply from ' + IntToStr(LoByte(LoWord(PIpe^.Address))) + '.' +
    // IntToStr(HiByte(LoWord(PIpe^.Address))) + '.' + IntToStr(LoByte(HiWord(PIpe^.Address))) + '.' +
    // IntToStr(HiByte(HiWord(PIpe^.Address))));
    // Memo1.Lines.Add('Reply time: ' + IntToStr(PIpe.RTTime) + ' ms');
    //
    // IcmpCloseHandle(HIP);
    // WSACleanup();
    // FreeMem(PIpe);
End;

End.
