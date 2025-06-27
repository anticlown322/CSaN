Unit uConnect;

Interface

Uses
    Windows,
    Messages,
    SysUtils,
    Classes,
    Graphics,
    Controls,
    Forms,
    Dialogs,
    StdCtrls;

Type
    TfrmConnect = Class(TForm)
    lbTitle: TLabel;
    lbHostRequirement: TLabel;
    eHost: TEdit;
    lbPortRequirement: TLabel;
    ePort: TEdit;
    lbNickRequirement: TLabel;
    eNick: TEdit;
    btnConnect: TButton;
    btnCancel: TButton;
    End;

Var
    frmConnect: TfrmConnect;

Implementation

{$R *.DFM}

End.
