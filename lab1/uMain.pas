Unit uMain;

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
    IdIcmpClient;

Type
    TfrmMain = Class(TForm)
        PgcSections: TPageControl;
        TsWelcome: TTabSheet;
        TsInterfaces: TTabSheet;
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
        ActStartInterfaces: TAction;
        LbHelp: TLabel;
        LbHelpTitle: TLabel;
        LbInterfacesTitle: TLabel;
        POutput: TPanel;
        MmInterfacesOutput: TMemo;
        ShpInterfaces: TShape;
        SpdbtnInterfacesIPHlp: TSpeedButton;
        ActGoToGithub: TAction;
        LbTradeMark: TLabel;
        SpdbtnInterfacesWinAPI: TSpeedButton;
        SpdbtnDevices: TSpeedButton;
        TsDevices: TTabSheet;
        LbDevicesTtile: TLabel;
        ShpDevices: TShape;
        PDevices: TPanel;
        MmDevices: TMemo;
        ActStartDevices: TAction;
        SpdbtnStartDevicesARP: TSpeedButton;
        SpdbtnStartDevicesPing: TSpeedButton;
        Procedure Dragging(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); // custom
        Procedure ActCloseExecute(Sender: TObject);
        Procedure FormShow(Sender: TObject);
        Procedure ActChooseOptionExecute(Sender: TObject);
        Procedure FormCreate(Sender: TObject);
        Procedure ActGoToGithubExecute(Sender: TObject);
        Procedure ActStartInterfacesExecute(Sender: TObject);
        Procedure ActStartDevicesExecute(Sender: TObject);
    End;

Var
    FrmMain: TfrmMain;

Implementation

Uses
    UdtmdImages,
    UFormEnhances,
    ShellApi,
    UHostsScanner,
    UInterfacesScanner;

{$R *.dfm}
{ form methods }

Procedure TfrmMain.FormCreate(Sender: TObject);
Begin
    PgcSections.ActivePage := TsWelcome;
End;

Procedure TfrmMain.FormShow(Sender: TObject);
Begin
    RoundFormCorners(Self, CtRoundedCornerDefault);
    RoundCornerOf(POutput, CtRoundedCornerDefault);
End;

Procedure TFrmMain.Dragging(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
    UFormEnhances.Dragging(Self);
End;

{ action manager - scaner }

Procedure TfrmMain.ActStartInterfacesExecute(Sender: TObject);
Var
    Answer: TStringlist;
Begin
    MmInterfacesOutput.Clear;
    Answer := Tstringlist.Create;
    Case (Sender As TAction).ActionComponent.Tag Of
        1:
            ScanNetworkIphlpAPI(Answer);
        2:
            ScanNetworkWinAPI(Answer);
    End;
    MmInterfacesOutput.Text := Answer.Text;
    Answer.Free;
End;

Procedure TfrmMain.ActStartDevicesExecute(Sender: TObject);
Var
    Answer: TStringlist;
Begin
    MmDevices.Clear;
    Answer := TStringlist.Create;

    Case (Sender As TAction).ActionComponent.Tag Of
        1:
            ScanDevicesARP(Answer);
        2:
            Begin
            End;
    End;

    MmDevices.Text := Answer.Text;
    Answer.Free;
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

End.
