Unit uHostsScanner;

Interface

Uses
    Windows,
    SysUtils,
    CommCtrl,
    Classes,
    WinSock;

Const
    IPHLPAPI = 'IPHLPAPI.DLL';
    MAX_ADAPTER_ADDRESS_LENGTH = 8;

Type
    TMacAddress = Array [0 .. MAX_ADAPTER_ADDRESS_LENGTH - 1] Of Byte;
    PMibIPNetRow = ^TMibIPNetRow;

    TMibIPNetRow = Packed Record
        DwIndex: DWORD;
        DwPhysAddrLen: DWORD;
        BPhysAddr: TMACAddress;
        DwAddr: DWORD;
        DwType: DWORD;
    End;

    PMibIPNetTable = ^TMibIPNetTable;

    TMibIPNetTable = Packed Record
        DwNumEntries: DWORD;
        Table: PMibIPNetRow;
    End;

    // exported
Function GetIpNetTable(PIpNetTable: PMibIPNetTable; PdwSize: PULONG; BOrder: Boolean): DWORD; Stdcall;
    External IPHLPAPI;
Function SendARP(DestIp: DWORD; SrcIP: DWORD; PMacAddr: Pointer; PhyAddrLen: Pointer): DWORD; Stdcall;
    External 'iphlpapi.dll';

// my
Procedure ScanDevicesARP(Answer: TStringList);
Procedure ScanDevicesPing(Answer: TStringList);

Implementation

{ Devices - ARP }

Function GetMAC(Const Value: TMacAddress; Const Length: DWORD): String;
Begin
    If Length = 0 Then
        Result := '00-00-00-00-00-00'
    Else
    Begin
        Result := '';
        For Var I := 0 To Length - 2 Do
            Result := Result + IntToHex(Value[I], 2) + '-';
        Result := Result + IntToHex(Value[Length - 1], 2);
    End;
End;

Function GetDottedIPFromInAddr(Const InAddr: Int64): String;
Begin
    Result := '';
    Result := IntToStr(FOURTH_IPADDRESS(InAddr));
    Result := Result + '.' + IntToStr(THIRD_IPADDRESS(InAddr));
    Result := Result + '.' + IntToStr(SECOND_IPADDRESS(InAddr));
    Result := Result + '.' + IntToStr(FIRST_IPADDRESS(InAddr));
End;

Function GetType(Const DwType: DWORD): String;
Begin
    Case DwType Of
        1:
            Result := 'Other';
        2:
            Result := 'Invalid';
        3:
            Result := 'Dynamic';
        4:
            Result := 'Static';
    End;
End;

Procedure ScanDevicesARP(Answer: TStringList);
Var
    MibIPNetTable: PMibIPNetTable;
    MibIPNetRow: PMibIPNetRow;
    PdwSize: ULONG;
    I, NumberOfEntries: Integer;
    InternetAddress, PhysicalAddress, AType: String;
Begin
    If GetIpNetTable(Nil, @PdwSize, False) = ERROR_INSUFFICIENT_BUFFER Then
    Begin
        GetMem(MibIPNetTable, PdwSize);
        Try
            If GetIpNetTable(MibIPNetTable, @PdwSize, False) = NO_ERROR Then
            Begin
                Answer.Add('Internet Address |  Physical Address  |  Type');
                Answer.Add('----------------------------------------------');

                MibIPNetRow := Pointer(DWORD(MibIPNetTable) + SizeOf(DWORD));
                NumberOfEntries := MibIPNetTable^.DwNumEntries;
                For I := 1 To NumberOfEntries Do
                Begin
                    InternetAddress := GetDottedIPFromInAddr(MibIPNetRow^.DwAddr);
                    PhysicalAddress := GetMAC(MibIPNetRow^.BPhysAddr, MibIPNetRow^.DwPhysAddrLen);
                    AType := GetType(MibIPNetRow^.DwType);
                    Answer.Add(Format('%-16s | %-18s | %-10s', [InternetAddress, PhysicalAddress, AType]));
                    Inc(MibIPNetRow);
                End;
            End;
        Finally
            FreeMem(MibIPNetTable);
        End;
    End;
End;

{ Devices - Ping }

Procedure ScanDevicesPing(Answer: TStringList);
Begin
    //
End;

End.
