object frmConnect: TfrmConnect
  Left = 192
  Top = 103
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077
  ClientHeight = 224
  ClientWidth = 274
  Color = 6574152
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object lbTitle: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 268
    Height = 78
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1093#1086#1089#1090' '#1080' '#1087#1086#1088#1090', '#1082' '#1082#1086#1090#1086#1088#1086#1084#1091' '#1093#1086#1090#1080#1090#1077' '#1087#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103':'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clHighlightText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object lbHostRequirement: TLabel
    Left = 10
    Top = 88
    Width = 39
    Height = 19
    Caption = #1061#1086#1089#1090':'
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clHighlightText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lbPortRequirement: TLabel
    Left = 10
    Top = 120
    Width = 43
    Height = 19
    Caption = #1055#1086#1088#1090':'
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clHighlightText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lbNickRequirement: TLabel
    Left = 10
    Top = 152
    Width = 34
    Height = 19
    Caption = #1053#1080#1082':'
    Color = clWhite
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clHighlightText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object eHost: TEdit
    Left = 65
    Top = 87
    Width = 200
    Height = 21
    BorderStyle = bsNone
    Color = 4928301
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object ePort: TEdit
    Left = 66
    Top = 123
    Width = 200
    Height = 21
    BorderStyle = bsNone
    Color = 4928301
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object eNick: TEdit
    Left = 65
    Top = 150
    Width = 200
    Height = 21
    BorderStyle = bsNone
    Color = 4928301
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object btnConnect: TButton
    Left = 8
    Top = 184
    Width = 136
    Height = 33
    Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 3
  end
  object btnCancel: TButton
    Left = 170
    Top = 184
    Width = 99
    Height = 33
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 4
  end
end
