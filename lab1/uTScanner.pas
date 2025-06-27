Unit uTScanner;

Interface

Uses
    Windows,
    Winsock,
    Classes,
    SysUtils,
    Iphlpapi,
    IpTypes;

Procedure ScanNetwork(Answer: TStringList);

Implementation

{ network scanner }

Procedure ScanNetwork(Answer: TStringList);
Var
    PAdapterInfo: PIP_ADAPTER_INFO;
    PAdapter: PIP_ADAPTER_INFO;
    BufLen: DWORD;
    Status: DWORD;
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
                    Answer.Add('GetAdaptersInfo �� �������������� ������ ������������ ��������.');
                ERROR_NO_DATA:
                    Answer.Add('������ ��������� �� ����� ������� �����������.');
            Else
                Answer.Add('������ GetAdaptersInfo: ' + IntToStr(Status));
            End;

            Exit;
        End;

        PAdapter := PAdapterInfo;

        While (PAdapter <> Nil) Do
        Begin
            Answer.Add('');
            Answer.Add('��������: ' + PAdapter^.Description);
            Answer.Add('���: ' + PAdapter^.AdapterName);

            StrMAC := '';
            For Var I := 0 To PAdapter^.AddressLength - 1 Do
                StrMAC := StrMAC + '-' + IntToHex(PAdapter^.Address[I], 2);

            Delete(StrMAC, 1, 1);
            Answer.Add('MAC-�����: ' + StrMAC);
            Answer.Add('IP-�����: ' + PAdapter^.IpAddressList.IpAddress.S);
            Answer.Add('����� �������: ' + PAdapter^.IpAddressList.IpMask.S);
            Answer.Add('����� ����: ' + PAdapter^.GatewayList.IpAddress.S);

            PAdapter := PAdapter^.Next;
        End;
    Finally
        FreeMem(PAdapterInfo);
    End;
End;

End.
