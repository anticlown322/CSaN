Program NetScanner;

Uses
    Vcl.Forms,
    UMain In 'uMain.pas' {frmMain} ,
    UdtmdImages In 'udtmdImages.pas' {dtmdImages: TDataModule} ,
    UTScanner In 'uTScanner.pas',
    UFormEnhances In 'uFormEnhances.pas';

{$R *.res}

Begin
    Application.Initialize;
    // Application.MainFormOnTaskbar := True;
    Application.CreateForm(TfrmMain, FrmMain);
    Application.CreateForm(TdtmdImages, DtmdImages);
    Application.Run;

End.
