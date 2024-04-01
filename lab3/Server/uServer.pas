Unit uServer;

Interface

Uses
    Winapi.Windows,
    Winapi.Messages,
    System.SysUtils,
    System.Variants,
    System.Classes,
    Vcl.Graphics,
    Vcl.Controls,
    Vcl.Forms,
    Vcl.Dialogs,
    Vcl.Buttons,
    Vcl.StdCtrls,
    Vcl.VirtualImage,
    Vcl.ComCtrls,
    Vcl.ExtCtrls,
    System.Actions,
    Vcl.ActnList,
    Vcl.PlatformDefaultStyleActnCtrls,
    Vcl.ActnMan,
    System.ImageList,
    Vcl.ImgList,
    Vcl.VirtualImageList,
    IdBaseComponent,
    IdComponent,
    IdRawBase,
    IdRawClient,
    IdIcmpClient,
    System.Win.ScktComp,
    IdCustomTCPServer,
    IdCustomHTTPServer,
    IdHTTPServer,
    IdContext;

Type

    TfrmMain = Class(TForm)
        PgcSections: TPageControl;
        TsWelcome: TTabSheet;
        TsAdministration: TTabSheet;
        VimWelcomeBackground: TVirtualImage;
        PNav: TPanel;
        SpdbtnWelcome: TSpeedButton;
        SpdbtnAdmin: TSpeedButton;
        SpdbtnExit: TSpeedButton;
        SpdbtnHelp: TSpeedButton;
        VilButtons48: TVirtualImageList;
        TsHelp: TTabSheet;
        ActmngActions: TActionManager;
        ActClose: TAction;
        ActChooseOption: TAction;
        LbHelp: TLabel;
        LbHelpTitle: TLabel;
        LbAdminTitle: TLabel;
        PAdmin: TPanel;
        ActGoToGithub: TAction;
        LbTradeMark: TLabel;
        LbWelcomeTop: TLabel;
        LbWelcomeBottom: TLabel;
        HtpsvrServer: TIdHTTPServer;
        MmLogs: TMemo;
        PServerOptions: TPanel;
        SpdbtnServerStart: TSpeedButton;
        SpdbtnServerStop: TSpeedButton;
        ActStartServer: TAction;
        ActStopServer: TAction;
        Procedure Dragging(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); // custom
        Procedure ActCloseExecute(Sender: TObject);
        Procedure FormShow(Sender: TObject);
        Procedure ActChooseOptionExecute(Sender: TObject);
        Procedure FormCreate(Sender: TObject);
        Procedure ActGoToGithubExecute(Sender: TObject);
        Procedure ActStartServerExecute(Sender: TObject);
        Procedure ActStopServerExecute(Sender: TObject);
        Procedure HtpsvrServerCommandGet(AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo;
            AResponseInfo: TIdHTTPResponseInfo);
        Procedure HtpsvrServerCommandOther(AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo;
            AResponseInfo: TIdHTTPResponseInfo);
    Private
        Procedure WriteLog(Const Msg: String);
    End;

Const
    BASE_FOLDER = 'D:\test_ksis';

Var
    FrmMain: TfrmMain;

Implementation

Uses
    UdtmdImages,
    UFormEnhances,
    ShellApi,
    System.IOUtils;

{$R *.dfm}
{ form methods }

Procedure TfrmMain.FormCreate(Sender: TObject);
Begin
    PgcSections.ActivePage := TsWelcome;
End;

Procedure TfrmMain.FormShow(Sender: TObject);
Begin
    RoundFormCorners(Self, CtRoundedCornerDefault);
    RoundCornerOf(PAdmin, CtRoundedCornerDefault);
    RoundCornerOf(PServerOptions, CtRoundedCornerDefault);
End;

Procedure TFrmMain.Dragging(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
    UFormEnhances.Dragging(Self);
End;

Procedure TFrmMain.WriteLog(Const Msg: String);
Begin
    MmLogs.Lines.Add('[' + TimeToStr(Time) + ']: ' + Msg);
End;

{ action manager - form }

Procedure TfrmMain.ActChooseOptionExecute(Sender: TObject);
Begin
    PgcSections.ActivePageIndex := (Sender As TAction).ActionComponent.Tag;
End;

Procedure TfrmMain.ActCloseExecute(Sender: TObject);
Begin
    Close;
End;

Procedure TfrmMain.ActGoToGithubExecute(Sender: TObject);
Begin
    ShellExecute(Handle, 'open', 'https://github.com/anticlown322', Nil, Nil, SW_NORMAL);
End;

{ action manager - server }

Procedure TfrmMain.ActStartServerExecute(Sender: TObject);
Begin
    Try
        HtpsvrServer.Active := True;
        WriteLog('Сервер успешно запущен!');
    Except
        WriteLog('При запуске сервера произошла ошибка! Порт, заданный по умолчанию, занят.');
    End;
End;

Procedure TfrmMain.ActStopServerExecute(Sender: TObject);
Begin
    HtpsvrServer.Active := False;
    WriteLog('Сервер остановлен!');
End;

{ form components }

// local func for paths
Function NormalFileName(FName: String): String;
Var
    S: String;
Begin
    S := BASE_FOLDER + FName;
    S := StringReplace(S, '/', '\', [RfReplaceAll]);
    Result := S;
End;

// for get and post requests
Procedure TfrmMain.HtpsvrServerCommandGet(AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo;
    AResponseInfo: TIdHTTPResponseInfo);
Var
    LogRecord: String;
    OldFile, UsedFile: File Of Byte;
    Buff: TBytes;
    Count: Integer;
Begin
    LogRecord := #13#10 + '*******************************' + #13#10;
    LogRecord := LogRecord + 'Входящий запрос от: ' + ARequestInfo.RemoteIP + #13#10;

    LogRecord := LogRecord + (Format('Клиент %s:%d пытается сделать "%s" запрос к документу "%s"',
        [AContext.Binding.PeerIP, AContext.Binding.PeerPort, ARequestInfo.Command, ARequestInfo.Document])) + #13#10;

    LogRecord := LogRecord + '*******************************';
    WriteLog(LogRecord);

    If ARequestInfo.Command = 'GET' Then
    Begin
        Var
        FileName := NormalFileName(ARequestInfo.Document);
        If FileExists(FileName) Then
        Begin
            AResponseInfo.ResponseNo := 200;
            AResponseInfo.ContentStream := TFileStream.Create(FileName, FmOpenRead);
        End
        Else
            AResponseInfo.ResponseNo := 404;
    End;

    If ARequestInfo.Command = 'POST' Then
    Begin
        Var
        OriginalFilePath := NormalFileName(ARequestInfo.Document);
        Var
        FileToUsePath := NormalFileName('\' + ARequestInfo.RawHeaders.Values['FileToUse']);

        If FileExists(OriginalFilePath) And FileExists(FileToUsePath) Then
        Begin
            AssignFile(OldFile, OriginalFilePath);
            AssignFile(UsedFile, FileToUsePath);
            Try
                Try
                    Reset(UsedFile);
                    Reset(OldFile);

                    Var
                    Temp := Filesize(OldFile);
                    Setlength(Buff, Temp);
                    While Not Eof(OldFile) Do
                        BlockRead(OldFile, Buff[0], Temp, Count);

                    Temp := Filesize(UsedFile);
                    Setlength(Buff, Length(Buff) + Temp);
                    While Not Eof(UsedFile) Do
                        BlockRead(UsedFile, Buff[Count], Temp);

                    CloseFile(OldFile);

                    TFile.WriteAllBytes(OriginalFilePath, Buff);

                    WriteLog(OriginalFilePath + ' успешно дописан файлом ' + FileToUsePath);
                Except
                    On E: Exception Do
                        WriteLog('При дозаписывании файла' + OriginalFilePath + ' произошла ошибка: ' + E.ToString);
                End;
            Finally
                CloseFile(OldFile);
                CloseFile(UsedFile);
            End;

            AResponseInfo.ResponseNo := 200;
        End
        Else
            AResponseInfo.ResponseNo := 404;

        AResponseInfo.ResponseNo := 200;
        Exit;
    End;

    WriteLog('Был сделан запрос, тип которого неизвестен');
    AResponseInfo.ResponseNo := 501;
End;

// for other requests
Procedure TfrmMain.HtpsvrServerCommandOther(AContext: TIdContext; ARequestInfo: TIdHTTPRequestInfo;
    AResponseInfo: TIdHTTPResponseInfo);
Var
    LogRecord: String;
    OldFile, UsedFile: File Of Byte;
    Buff: Array Of Byte;
    Count: Integer;
Begin
    LogRecord := #13#10 + '*******************************' + #13#10;
    LogRecord := LogRecord + 'Входящий запрос от: ' + ARequestInfo.RemoteIP + #13#10;

    LogRecord := LogRecord + (Format('Клиент %s:%d пытается сделать "%s" запрос к документу "%s"',
        [AContext.Binding.PeerIP, AContext.Binding.PeerPort, ARequestInfo.Command, ARequestInfo.Document])) + #13#10;

    LogRecord := LogRecord + '*******************************';
    WriteLog(LogRecord);

    // for some may be used ARequestInfo.CommandType
    If ARequestInfo.Command = 'PUT' Then
    Begin
        Var
        OldFilePath := NormalFileName(ARequestInfo.Document);
        Var
        FileToUsePath := NormalFileName('\' + ARequestInfo.RawHeaders.Values['NewFile']);

        If FileExists(OldFilePath) And FileExists(FileToUsePath) Then
        Begin
            AssignFile(OldFile, OldFilePath);
            AssignFile(UsedFile, FileToUsePath);
            Try
                Try
                    Reset(UsedFile);
                    Rewrite(OldFile);
                    Var
                    Temp := Filesize(UsedFile);
                    Setlength(Buff, Temp);

                    While Not Eof(UsedFile) Do
                    Begin
                        BlockRead(UsedFile, Buff[0], Temp, Count);
                        BlockWrite(OldFile, Buff[0], Count);
                    End;

                    WriteLog(OldFilePath + ' успешно переписан файлом ' + FileToUsePath);
                Except
                    On E: Exception Do
                        WriteLog('При перезаписи файла' + OldFilePath + ' произошла ошибка: ' + E.ToString);
                End;
            Finally
                CloseFile(OldFile);
                CloseFile(UsedFile);
            End;

            AResponseInfo.ResponseNo := 200;
        End
        Else
            AResponseInfo.ResponseNo := 404;

        AResponseInfo.ResponseNo := 200;
        Exit;
    End;

    If ARequestInfo.Command = 'COPY' Then
    Begin
        Var
        FilePath := NormalFileName(ARequestInfo.Document);
        Var
        WhereToSavePath := NormalFileName('\' + ARequestInfo.RawHeaders.Values['WhereToSave']) + '\' +
            Copy(ARequestInfo.Document, 2, Length(ARequestInfo.Document) - 1);

        If FileExists(FilePath) Then
        Begin
            AResponseInfo.ResponseNo := 200;
            Try
                TFile.Copy(FilePath, WhereToSavePath);
                WriteLog(FilePath + ' успешно скопирован в ' + WhereToSavePath);
            Except
                On E: Exception Do
                    WriteLog(FilePath + ' скопирован перемещен в ' + WhereToSavePath + ',  ошибка: ' + E.ToString);
            End;
        End
        Else
            AResponseInfo.ResponseNo := 404;

        AResponseInfo.ResponseNo := 200;
        Exit;
    End;

    If ARequestInfo.Command = 'MOVE' Then
    Begin
        Var
        FilePath := NormalFileName(ARequestInfo.Document);
        Var
        WhereToMovePath := NormalFileName('\' + ARequestInfo.RawHeaders.Values['WhereToMove']) + '\' +
            Copy(ARequestInfo.Document, 2, Length(ARequestInfo.Document) - 1);

        If FileExists(FilePath) Then
        Begin
            AResponseInfo.ResponseNo := 200;
            Try
                TFile.Move(FilePath, WhereToMovePath);
                WriteLog(FilePath + ' успешно перемещен в ' + WhereToMovePath);
            Except
                On E: Exception Do
                    WriteLog(FilePath + ' не перемещен в ' + WhereToMovePath + ',  ошибка: ' + E.ToString);
            End;
        End
        Else
            AResponseInfo.ResponseNo := 404;

        Exit;
    End;

    If ARequestInfo.Command = 'DELETE' Then
    Begin
        Var
        FileName := NormalFileName(ARequestInfo.Document);
        If DeleteFile(FileName) Then
            WriteLog(FileName + ' удален')
        Else
            WriteLog(FileName + ' не удалён, ошибка: ' + IntToStr(GetLastError));

        AResponseInfo.ResponseNo := 200;
        Exit;
    End;

    WriteLog('Был сделан запрос, тип которого неизвестен');
    AResponseInfo.ResponseNo := 501;
End;

End.
