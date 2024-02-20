unit udtmdImages;

interface

uses
  System.SysUtils, System.Classes, Vcl.BaseImageCollection, Vcl.ImageCollection;

type
  TdtmdImages = class(TDataModule)
    imgclcButtons: TImageCollection;
    imgclcPictures: TImageCollection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmdImages: TdtmdImages;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
