Program Client;

Uses
    Vcl.Forms,
    UClient In 'uClient.pas' {frmMain} ,
    UdtmdImages In 'udtmdImages.pas' {dtmdImages: TDataModule} ,
    UFormEnhances In 'uFormEnhances.pas';

{$R *.res}

Begin
    Application.Initialize;
    Application.MainFormOnTaskbar := False;

    Application.CreateForm(TFrmMain, FrmMain);
    Application.CreateForm(TDtmdImages, DtmdImages);
    Application.Run;

End.
