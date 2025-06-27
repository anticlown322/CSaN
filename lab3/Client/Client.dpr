Program Client;

uses
  Vcl.Forms,
  uClient in 'uClient.pas' {frmMain},
  udtmdImages in 'udtmdImages.pas' {dtmdImages: TDataModule},
  uFormEnhances in 'uFormEnhances.pas';

{$R *.res}

Begin
    Application.Initialize;
    Application.MainFormOnTaskbar := False;

    Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TDtmdImages, DtmdImages);
  Application.Run;

End.
