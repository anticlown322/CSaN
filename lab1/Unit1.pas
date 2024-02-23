Unit Unit1;

Interface

Uses
    Windows,
    WinSock,
    Classes;

Type
    Ip_option_information = Packed Record // Информация заголовка IP (Наполнение
        // этой структуры и формат полей описан в RFC791.
        Ttl: Byte; // Время жизни (используется traceroute-ом)
        Tos: Byte; // Тип обслуживания, обычно 0
        Flags: Byte; // Флаги заголовка IP, обычно 0
        OptionsSize: Byte; // Размер данных в заголовке, обычно 0, максимум 40
        OptionsData: Pointer; // Указатель на данные
    End;

    Icmp_echo_reply = Packed Record
        Address: U_long; // Адрес отвечающего
        Status: U_long; // IP_STATUS (см. ниже)
        RTTime: U_long; // Время между эхо-запросом и эхо-ответом
        // в миллисекундах
        DataSize: U_short; // Размер возвращенных данных
        Reserved: U_short; // Зарезервировано
        Data: Pointer; // Указатель на возвращенные данные
        Options: Ip_option_information; // Информация из заголовка IP
    End;

    PIPINFO = ^Ip_option_information;
    PVOID = Pointer;

Function IcmpCreateFile(): THandle; Stdcall; External 'ICMP.DLL' Name 'IcmpCreateFile';
Function IcmpCloseHandle(IcmpHandle: THandle): BOOL; Stdcall; External 'ICMP.DLL' Name 'IcmpCloseHandle';
Function IcmpSendEcho(IcmpHandle: THandle; // handle, возвращенный IcmpCreateFile()
    DestAddress: U_long; // Адрес получателя (в сетевом порядке)
    RequestData: PVOID; // Указатель на посылаемые данные
    RequestSize: Word; // Размер посылаемых данных
    RequestOptns: PIPINFO; // Указатель на посылаемую структуру
    // ip_option_information (может быть nil)
    ReplyBuffer: PVOID; // Указатель на буфер, содержащий ответы.
    ReplySize: DWORD; // Размер буфера ответов
    Timeout: DWORD// Время ожидания ответа в миллисекундах
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
    // // Создаем handle
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
    // // Посылаем ping-пакет
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
    // // Смотрим некоторые из вернувшихся данных
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
