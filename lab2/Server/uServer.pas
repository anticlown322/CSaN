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
    System.Win.ScktComp;

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
        MmLogs: TMemo;
        ActGoToGithub: TAction;
        LbTradeMark: TLabel;
        LbWelcomeTop: TLabel;
        LbWelcomeBottom: TLabel;
        PUserList: TPanel;
        PServerOptions: TPanel;
        LbTables: TLabel;
        SvrsctServer: TServerSocket;
        SpdbtnStart: TSpeedButton;
        SpdbtnStop: TSpeedButton;
        SpdbtnDisconnectAll: TSpeedButton;
        SpdbtnSendAll: TSpeedButton;
        ActServerStart: TAction;
        ActServerStop: TAction;
        ActDisconnectAll: TAction;
        ActSendAll: TAction;
        LstUsers: TListBox;
        Procedure Dragging(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); // custom
        Procedure ActCloseExecute(Sender: TObject);
        Procedure FormShow(Sender: TObject);
        Procedure ActChooseOptionExecute(Sender: TObject);
        Procedure FormCreate(Sender: TObject);
        Procedure ActGoToGithubExecute(Sender: TObject);
        Procedure ActServerStartExecute(Sender: TObject);
        Procedure ActServerStopExecute(Sender: TObject);
        Procedure SvrsctServerClientRead(Sender: TObject; Socket: TCustomWinSocket);
        Procedure SvrsctServerClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
        Procedure SvrsctServerClientConnect(Sender: TObject; Socket: TCustomWinSocket);
        Procedure ActDisconnectAllExecute(Sender: TObject);
        Procedure ActSendAllExecute(Sender: TObject);
    End;

Var
    FrmMain: TfrmMain;

Implementation

Uses
    UdtmdImages,
    UFormEnhances,
    ShellApi,
    Iphlpapi,
    IpTypes;

{$R *.dfm}
{ form methods }

Procedure TfrmMain.FormCreate(Sender: TObject);
Begin
    PgcSections.ActivePage := TsWelcome;
End;

Procedure TfrmMain.FormShow(Sender: TObject);
Const
    CAP_START = 'Включить' + #13#10 + 'сервер';
    CAP_STOP = 'Выключить' + #13#10 + 'сервер';
    CAP_SEND = 'Сообщение' + #13#10 + 'всем';
    CAP_DISCONNECT = 'Отключить' + #13#10 + 'всех';
Begin
    // rounding corners
    RoundFormCorners(Self, CtRoundedCornerDefault);
    RoundCornerOf(PAdmin, CtRoundedCornerDefault);
    RoundCornerOf(PUserList, CtRoundedCornerDefault);
    RoundCornerOf(PServerOptions, CtRoundedCornerDefault);
    // speedbuttons captions
    SpdbtnStart.Caption := CAP_START;
    SpdbtnStop.Caption := CAP_STOP;
    SpdbtnSendAll.Caption := CAP_SEND;
    SpdbtnDisconnectAll.Caption := CAP_DISCONNECT;
End;

Procedure TFrmMain.Dragging(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
    UFormEnhances.Dragging(Self);
End;

{ action manager - form }

Procedure TfrmMain.ActChooseOptionExecute(Sender: TObject);
Begin
    PgcSections.ActivePageIndex := (Sender As TAction).ActionComponent.Tag;
End;

Procedure TfrmMain.ActCloseExecute(Sender: TObject);
Begin
    ActServerStopExecute(Sender);
    Close;
End;

Procedure TfrmMain.ActGoToGithubExecute(Sender: TObject);
Begin
    ShellExecute(Handle, 'open', 'https://github.com/anticlown322', Nil, Nil, SW_NORMAL);
End;

{ action manager - server }

Procedure TfrmMain.ActServerStartExecute(Sender: TObject);
Var
    S: String;
Begin
    S := InputBox('Запуск чат-сервера', 'Введите порт:', '1001');
    If S = '' Then
        Exit;
    Try
        SvrsctServer.Port := StrToInt(S);
        SvrsctServer.Open;
        LstUsers.Items.Clear;
        MmLogs.Lines.Add('[' + TimeToStr(Time) + '] Сервер запущен');
    Except
        MessageBox(Handle, PChar('Некорректный номер порта либо порт занят!'), PChar('Ошибка'), MB_OK + MB_ICONERROR);
    End;
End;

Procedure TfrmMain.ActServerStopExecute(Sender: TObject);
Begin
    If SvrsctServer.Active Then
    Begin
        LstUsers.Items.Clear;
        SvrsctServer.Close;
        MmLogs.Lines.Add('[' + TimeToStr(Time) + '] Сервер выключен');
    End;
End;

Procedure TfrmMain.ActDisconnectAllExecute(Sender: TObject);
Begin
    For Var I := 0 To SvrsctServer.Socket.ActiveConnections - 1 Do
        SvrsctServer.Socket.Connections[I].Destroy;

    MmLogs.Lines.Add('[' + TimeToStr(Time) + '] Все клиенты отключены');
End;

Procedure TfrmMain.ActSendAllExecute(Sender: TObject);
Var
    S: AnsiString;
Begin
    S := '#M' + InputBox('Сообщение для всех пользователей', 'Введите сообщение', '');
    If S = '' Then
        Exit;
        MmLogs.Lines.Add('[' + TimeToStr(Time) + '] Сервер выключен');
    For Var I := 0 To SvrsctServer.Socket.ActiveConnections - 1 Do
        SvrsctServer.Socket.Connections[I].SendText(S);
End;

{ form components }

Procedure TfrmMain.SvrsctServerClientRead(Sender: TObject; Socket: TCustomWinSocket);
Var
    S: AnsiString;
Begin
    S := Socket.ReceiveText;
    If Copy(S, 1, 2) = '#N' Then
    Begin
        Delete(S, 1, 2);
        LstUsers.Items.Add(S);

        S := '#U';
        For Var I := 0 To LstUsers.Items.Count - 1 Do
            S := S + LstUsers.Items[I] + ';';

        For Var I := 0 To SvrsctServer.Socket.ActiveConnections - 1 Do
            SvrsctServer.Socket.Connections[I].SendText(S);
        Exit;
    End;

    If (Copy(S, 1, 2) = '#M') Then
    Begin
        For Var I := 0 To SvrsctServer.Socket.ActiveConnections - 1 Do
            SvrsctServer.Socket.Connections[I].SendText(S);

        Delete(S, 1, 2);
        MmLogs.Lines.Add('[' + TimeToStr(Time) + '] ' + Copy(S, 1, Pos(';', S) - 1) + ' > ' + Copy(S, Pos(';', S) + 1,
            Length(S) - Pos(';', S)));

        Exit;
    End;
End;

Procedure TfrmMain.SvrsctServerClientConnect(Sender: TObject; Socket: TCustomWinSocket);
Begin
    LstUsers.Items.Clear;
    For Var I := 0 To SvrsctServer.Socket.ActiveConnections - 1 Do
        SvrsctServer.Socket.Connections[I].SendText('#N');
    MmLogs.Lines.Add('[' + TimeToStr(Time) + '] Клиент подключился ');
End;

Procedure TfrmMain.SvrsctServerClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
Begin
    LstUsers.Items.Clear;
    For Var I := 0 To SvrsctServer.Socket.ActiveConnections - 1 Do
        SvrsctServer.Socket.Connections[I].SendText('#N');
    MmLogs.Lines.Add('[' + TimeToStr(Time) + '] Клиент отключился ');
End;

End.
