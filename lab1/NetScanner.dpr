Program NetScanner;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  udtmdImages in 'udtmdImages.pas' {dtmdImages: TDataModule},
  uTScanner in 'uTScanner.pas',
  uFormEnhances in 'uFormEnhances.pas';

{$R *.res}

Begin
    Application.Initialize;
    Application.MainFormOnTaskbar := False;

    Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TDtmdImages, DtmdImages);
  Application.Run;

End.
