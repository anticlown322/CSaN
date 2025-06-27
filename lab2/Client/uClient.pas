Unit uClient;

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
        TsChat: TTabSheet;
        VimWelcomeBackground: TVirtualImage;
        PNav: TPanel;
        SpdbtnWelcome: TSpeedButton;
        SpdbtnInterfaces: TSpeedButton;
        SpdbtnExit: TSpeedButton;
        SpdbtnHelp: TSpeedButton;
        VilButtons48: TVirtualImageList;
        TsHelp: TTabSheet;
        ActmngActions: TActionManager;
        ActClose: TAction;
        ActChooseOption: TAction;
        LbHelp: TLabel;
        LbHelpTitle: TLabel;
        LbChatTitle: TLabel;
        ActGoToGithub: TAction;
        LbTradeMark: TLabel;
        GrdpChat: TGridPanel;
        EOutMessage: TEdit;
        SpdbtnFileSend: TSpeedButton;
        MmChat: TMemo;
        VilButtons32: TVirtualImageList;
        CltsctClient: TClientSocket;
        PServerOptions: TPanel;
        SpdbtnStart: TSpeedButton;
        SpdbtnStop: TSpeedButton;
        ActOpenConnection: TAction;
        ActCloseConnection: TAction;
        LbUserList: TLabel;
        LstUserList: TListBox;
        SpdbtnMessageSend: TSpeedButton;
        ActSendMessage: TAction;
        ActSendFile: TAction;
        Procedure Dragging(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); // custom
        Procedure ActCloseExecute(Sender: TObject);
        Procedure FormShow(Sender: TObject);
        Procedure ActChooseOptionExecute(Sender: TObject);
        Procedure FormCreate(Sender: TObject);
        Procedure ActGoToGithubExecute(Sender: TObject);
        Procedure ActCloseConnectionExecute(Sender: TObject);
        Procedure CltsctClientError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
            Var ErrorCode: Integer);
        Procedure CltsctClientConnecting(Sender: TObject; Socket: TCustomWinSocket);
        Procedure CltsctClientLookup(Sender: TObject; Socket: TCustomWinSocket);
        Procedure CltsctClientConnect(Sender: TObject; Socket: TCustomWinSocket);
        Procedure CltsctClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
        Procedure CltsctClientRead(Sender: TObject; Socket: TCustomWinSocket);
        Procedure ActOpenConnectionExecute(Sender: TObject);
        Procedure ActSendMessageExecute(Sender: TObject);
        Procedure EOutMessageKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
    Private
        Nickname: String;
    End;

Var
    FrmMain: TfrmMain;

Implementation

Uses
    UdtmdImages,
    UFormEnhances,
    ShellApi,
    Iphlpapi,
    IpTypes,
    UConnect;

{$R *.dfm}
{ form methods }

Procedure TfrmMain.FormCreate(Sender: TObject);
Begin
    PgcSections.ActivePage := TsWelcome;
End;

Procedure TfrmMain.FormShow(Sender: TObject);
Begin
    RoundFormCorners(Self, CtRoundedCornerDefault);
    RoundCornerOf(GrdpChat, CtRoundedCornerDefault);
End;

Procedure TFrmMain.Dragging(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
    UFormEnhances.Dragging(Self);
End;

{ form components }

Procedure TfrmMain.CltsctClientLookup(Sender: TObject; Socket: TCustomWinSocket);
Begin
    MmChat.Lines.Insert(0, 'Поиск сервера...');
End;

Procedure TfrmMain.CltsctClientConnecting(Sender: TObject; Socket: TCustomWinSocket);
Begin
    MmChat.Lines.Insert(0, 'Подключение...');
End;

Procedure TfrmMain.CltsctClientConnect(Sender: TObject; Socket: TCustomWinSocket);
Begin
    MmChat.Lines.Insert(0, 'Вы подключены!');
End;

Procedure TfrmMain.CltsctClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
Begin
    MmChat.Lines.Insert(0, 'Вы отключены');
End;

Procedure TfrmMain.CltsctClientError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
    Var ErrorCode: Integer);
Begin
    MmChat.Lines.Insert(0, 'Ошибка (' + IntToStr(ErrorCode) + ')');
End;

Procedure TfrmMain.CltsctClientRead(Sender: TObject; Socket: TCustomWinSocket);
Var
    S: AnsiString;
Begin
    S := Socket.ReceiveText;
    If Copy(S, 1, 2) = '#U' Then
    Begin
        Delete(S, 1, 2);
        LstUserList.Items.Clear;
        While Pos(';', S) > 0 Do
        Begin
            LstUserList.Items.Add(Copy(S, 1, Pos(';', S) - 1));
            Delete(S, 1, Pos(';', S));
        End;
        Exit;
    End;

    If Copy(S, 1, 2) = '#M' Then
    Begin
        Delete(S, 1, 2);
        MmChat.Lines.Insert(0, '[' + TimeToStr(Time) + '] ' + Copy(S, 1, Pos(';', S) - 1) + ' > ' + Copy(S, Pos(';', S) + 1, Length(S) - Pos(';', S)));
        Exit;
    End;

    If Copy(S, 1, 2) = '#N' Then
    Begin
        Socket.SendText('#N' + Nickname);
        Exit;
    End;
End;

Procedure TfrmMain.EOutMessageKeyDown(Sender: TObject; Var Key: Word; Shift: TShiftState);
Begin
    If Key = VK_RETURN Then
        ActSendMessageExecute(Sender);
End;

{ action manager - client }

Procedure TfrmMain.ActCloseConnectionExecute(Sender: TObject);
Begin
    If CltsctClient.Active Then
    Begin
        CltsctClient.Close;
        LstUserList.Items.Clear;
        MmChat.Lines.Clear;
    End;
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

Procedure TfrmMain.ActOpenConnectionExecute(Sender: TObject);
Var
    DoСonnect: Boolean;
    Host, Port: String;
Begin
    FrmConnect := TfrmConnect.Create(Application);
    DoСonnect := (FrmConnect.ShowModal = MrOk);

    Host := FrmConnect.eHost.Text;
    Port := FrmConnect.ePort.Text;
    Nickname := FrmConnect.eNick.Text;
    FrmConnect.Free;

    If Not DoСonnect Then
        Exit;
    If CltsctClient.Active Then
        CltsctClient.Close;
    Try
        CltsctClient.Host := Host;
        CltsctClient.Port := StrToInt(Port);
        CltsctClient.Open;
    Except
        MessageBox(Handle, PChar('Ошибка при подключении! Проверьте корректность данных и попробуйте еще раз!'),
            PChar('Ошибка'), MB_OK + MB_ICONERROR);
    End;
End;

Procedure TfrmMain.ActSendMessageExecute(Sender: TObject);
Var
    S: String;
Begin
    S := '#M';
    S := S + Nickname + ';' + EOutMessage.Text;
    CltsctClient.Socket.SendText(S);
    EOutMessage.Text := '';
    ActiveControl := EOutMessage;
End;

End.
