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
    System.Win.ScktComp,
    REST.Types,
    REST.Response.Adapter,
    REST.Client,
    Data.Bind.Components,
    Data.Bind.ObjectScope,
    System.Net.URLClient,
    System.Net.HttpClient,
    System.Net.HttpClientComponent;

Type
    TfrmMain = Class(TForm)
        PgcSections: TPageControl;
        TsWelcome: TTabSheet;
        TsStorage: TTabSheet;
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
        LbStorageTitle: TLabel;
        ActGoToGithub: TAction;
        LbTradeMark: TLabel;
        VilButtons32: TVirtualImageList;
        PFileOptions: TPanel;
        SpdbtnGET: TSpeedButton;
        SpdbtnPUT: TSpeedButton;
        SpdbtnDELETE: TSpeedButton;
        SpdbtnMOVE: TSpeedButton;
        SpdbtnPOST: TSpeedButton;
        SpdbtnCOPY: TSpeedButton;
        ActChooseRESTMethod: TAction;
        HttpcltClient: TNetHTTPClient;
        HttprqtReq: TNetHTTPRequest;
        PLogs: TPanel;
        MmLogs: TMemo;
        Procedure Dragging(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer); // custom
        Procedure ActCloseExecute(Sender: TObject);
        Procedure FormShow(Sender: TObject);
        Procedure ActChooseOptionExecute(Sender: TObject);
        Procedure FormCreate(Sender: TObject);
        Procedure ActGoToGithubExecute(Sender: TObject);
        Procedure ActChooseRESTMethodExecute(Sender: TObject);
    Private
        Procedure SendGETRequest(Const FilePath: String);
        Procedure SendPUTRequest(Const OldFilePath, NewFilePath: String);
        Procedure SendCOPYRequest(Const FileToSavePath, WhereToSavePath: String);
        Procedure SendMOVERequest(Const FileToMovePath, WhereToMovePath: String);
        Procedure SendPOSTRequest(Const FileToEditPath, FileToUsePath: String);
        Procedure SendDELETERequest(Const FilePath: String);
    End;

Const
    MY_URL = 'http://localhost:1488/';

Var
    FrmMain: TfrmMain;

Implementation

Uses
    UdtmdImages,
    UFormEnhances,
    ShellApi;

{$R *.dfm}
{ form methods }

Procedure TfrmMain.FormCreate(Sender: TObject);
Begin
    PgcSections.ActivePage := TsWelcome;
End;

Procedure TfrmMain.FormShow(Sender: TObject);
Begin
    RoundFormCorners(Self, CtRoundedCornerDefault);
    RoundCornerOf(PFileOptions, CtRoundedCornerDefault);
    RoundCornerOf(PLogs, CtRoundedCornerDefault);
End;

Procedure TfrmMain.SendGETRequest(Const FilePath: String);
Var
    MemStream: TMemoryStream;
    Content: TStringList;
Begin
    MemStream := TMemoryStream.Create;
    HttprqtReq.ContentStream := MemStream;
    HttprqtReq.MethodString := 'get';
    HttprqtReq.URL := MY_URL + FilePath;
    HttprqtReq.Execute();

    Content := TStringList.Create;
    Try
        Content.LoadFromStream(HttprqtReq.ContentStream);
        MmLogs.Lines.Add('Содержимое файла ' + FilePath + ':');
        MmLogs.Lines.Add(Content.Text);
    Finally
        FreeAndNil(MemStream);
        FreeAndNil(Content);
    End;
End;

Procedure TfrmMain.SendPUTRequest(Const OldFilePath, NewFilePath: String);
Var
    MemStream: TMemoryStream;
Begin
    MemStream := TMemoryStream.Create;
    HttprqtReq.ContentStream := MemStream;
    HttprqtReq.MethodString := 'put';
    HttprqtReq.URL := MY_URL + OldFilePath;
    HttprqtReq.CustomHeaders['NewFile'] := NewFilePath;
    HttprqtReq.Execute();
End;

Procedure TfrmMain.SendCOPYRequest(Const FileToSavePath, WhereToSavePath: String);
Var
    MemStream: TMemoryStream;
Begin
    MemStream := TMemoryStream.Create;
    HttprqtReq.ContentStream := MemStream;
    HttprqtReq.MethodString := 'copy';
    HttprqtReq.URL := MY_URL + FileToSavePath;
    HttprqtReq.CustomHeaders['WhereToSave'] := WhereToSavePath;
    HttprqtReq.Execute();
End;

Procedure TfrmMain.SendMOVERequest(Const FileToMovePath, WhereToMovePath: String);
Var
    MemStream: TMemoryStream;
Begin
    MemStream := TMemoryStream.Create;
    HttprqtReq.ContentStream := MemStream;
    HttprqtReq.MethodString := 'move';
    HttprqtReq.URL := MY_URL + FileToMovePath;
    HttprqtReq.CustomHeaders['WhereToMove'] := WhereToMovePath;
    HttprqtReq.Execute();
End;

Procedure TfrmMain.SendPOSTRequest(Const FileToEditPath, FileToUsePath: String);
Var
    MemStream: TMemoryStream;
Begin
    MemStream := TMemoryStream.Create;
    HttprqtReq.ContentStream := MemStream;
    HttprqtReq.MethodString := 'post';
    HttprqtReq.URL := MY_URL + FileToEditPath;
    HttprqtReq.CustomHeaders['FileToUse'] := FileToUsePath;
    HttprqtReq.Execute();
End;

Procedure TfrmMain.SendDELETERequest(Const FilePath: String);
Var
    MemStream: TMemoryStream;
Begin
    MemStream := TMemoryStream.Create;
    HttprqtReq.ContentStream := MemStream;
    HttprqtReq.MethodString := 'delete';
    HttprqtReq.URL := MY_URL + FilePath;
    HttprqtReq.Execute();
End;

Procedure TFrmMain.Dragging(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
Begin
    UFormEnhances.Dragging(Self);
End;

{ requests }

{ action manager - client }

Procedure TfrmMain.ActChooseRESTMethodExecute(Sender: TObject);
Var
    PathToFile1, PathToFile2: String;
Begin
    Case (Sender As TAction).ActionComponent.Tag Of
        1: // get
            Begin
                If InputQuery('GET Запрос', 'Укажите имя файла для чтения', PathToFile1) Then
                    SendGETRequest(PathToFile1);
            End;
        2: // put
            Begin
                If InputQuery('PUT Запрос', 'Укажите путь к файлу для перезаписи', PathToFile1) And
                    InputQuery('PUT Запрос', 'Укажите путь к файлу, которым перезаписывать', PathToFile2) Then
                    SendPUTRequest(PathToFile1, PathToFile2);
            End;
        3: // copy
            Begin
                If InputQuery('COPY Запрос', 'Укажите имя файла для копирования', PathToFile1) And
                    InputQuery('COPY Запрос', 'Укажите путь для сохранения', PathToFile2) Then
                    SendCOPYRequest(PathToFile1, PathToFile2);
            End;
        4: // move
            Begin
                If InputQuery('MOVE Запрос', 'Укажите имя файла для перемещения', PathToFile1) And
                    InputQuery('MOVE Запрос', 'Укажите путь для нового размещения', PathToFile2) Then
                    SendMOVERequest(PathToFile1, PathToFile2);
            End;
        5: // post
            Begin
                If InputQuery('POST Запрос', 'Укажите путь к файлу для дополнения', PathToFile1) And
                    InputQuery('POST Запрос', 'Укажите путь к файлу, которым дополнять', PathToFile2) Then
                    SendPOSTRequest(PathToFile1, PathToFile2);
            End;
        6: // delete
            Begin
                If InputQuery('DELETE Запрос', 'Укажите путь к файлу для удаления', PathToFile1) Then
                    SendDELETERequest(PathToFile1);
            End;
    Else
        MessageBox(Handle, PChar('Ошибка при обработке запроса!'), PChar('Был выбран несуществующий тип запросаа'),
            MB_ICONERROR);
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

End.
