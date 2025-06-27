Program NetScanner;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  udtmdImages in 'udtmdImages.pas' {dtmdImages: TDataModule},
  uInterfacesScanner in 'uInterfacesScanner.pas',
  uFormEnhances in 'uFormEnhances.pas',
  uHostsScannerARP in 'uHostsScannerARP.pas',
  uHostsScannerPing in 'uHostsScannerPing.pas';

{$R *.res}

Begin
    Application.Initialize;
    Application.MainFormOnTaskbar := False;

    Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TDtmdImages, DtmdImages);
  Application.Run;

End.
