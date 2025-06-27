program Server;

uses
  Vcl.Forms,
  udtmdImages in 'udtmdImages.pas' {dtmdImages: TDataModule},
  uFormEnhances in 'uFormEnhances.pas',
  uServer in 'uServer.pas' {frmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdtmdImages, dtmdImages);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
