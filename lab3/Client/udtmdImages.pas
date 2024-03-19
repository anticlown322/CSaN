Unit udtmdImages;

Interface

Uses
    System.SysUtils,
    System.Classes,
    Vcl.BaseImageCollection,
    Vcl.ImageCollection;

Type
    TdtmdImages = Class(TDataModule)
        ImgclcButtons: TImageCollection;
        ImgclcPictures: TImageCollection;
    End;

Var
    DtmdImages: TdtmdImages;

Implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

End.
