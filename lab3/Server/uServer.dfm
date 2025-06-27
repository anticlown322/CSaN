object frmMain: TfrmMain
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 250
  BorderStyle = bsNone
  Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1089#1077#1088#1074#1077#1088#1086#1084
  ClientHeight = 694
  ClientWidth = 795
  Color = 3548700
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWhite
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 23
  object pgcSections: TPageControl
    Left = 185
    Top = 0
    Width = 610
    Height = 694
    ActivePage = tsAdministration
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object tsWelcome: TTabSheet
      Caption = 'tsWelcome'
      TabVisible = False
      object vimWelcomeBackground: TVirtualImage
        AlignWithMargins = True
        Left = 10
        Top = 10
        Width = 582
        Height = 664
        Margins.Left = 10
        Margins.Top = 10
        Margins.Right = 10
        Margins.Bottom = 10
        Align = alClient
        ImageCollection = dtmdImages.imgclcPictures
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 1
        ImageName = 'continents'
        OnMouseDown = Dragging
        ExplicitLeft = 248
        ExplicitTop = 296
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
      object lbWelcomeTop: TLabel
        Left = 24
        Top = 58
        Width = 551
        Height = 91
        AutoSize = False
        Caption = 
          #1045#1089#1090#1100' '#1083#1102#1076#1080', '#1082#1086#1090#1086#1088#1099#1077' '#1074#1089#1077' '#1077#1097#1077' '#1074#1077#1088#1103#1090', '#1095#1090#1086' '#13#10#9#9#1086#1085#1080' '#1091#1087#1088#1072#1074#1083#1103#1102#1090' '#1089#1074#1086#1080#1084#1080' '#1078 +
          #1080#1079#1085#1103#1084#1080'.'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clMaroon
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        OnMouseDown = Dragging
      end
      object lbWelcomeBottom: TLabel
        Left = 152
        Top = 574
        Width = 296
        Height = 30
        Caption = #1052#1099' '#1079#1072' '#1101#1090#1080#1084' '#1087#1088#1086#1089#1083#1077#1076#1080#1084
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clMaroon
        Font.Height = -25
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnMouseDown = Dragging
      end
    end
    object tsAdministration: TTabSheet
      Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077
      ImageIndex = 1
      TabVisible = False
      OnMouseDown = Dragging
      object lbAdminTitle: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 596
        Height = 35
        Align = alTop
        Alignment = taCenter
        Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clGray
        Font.Height = -29
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnMouseDown = Dragging
        ExplicitWidth = 182
      end
      object pAdmin: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 44
        Width = 596
        Height = 550
        Align = alClient
        BevelOuter = bvNone
        Color = 6574152
        Padding.Left = 10
        Padding.Right = 10
        ParentBackground = False
        ShowCaption = False
        TabOrder = 0
        object mmLogs: TMemo
          AlignWithMargins = True
          Left = 13
          Top = 10
          Width = 570
          Height = 530
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 6574152
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object pServerOptions: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 600
        Width = 596
        Height = 81
        Align = alBottom
        BevelOuter = bvNone
        Color = 6574152
        Padding.Left = 8
        Padding.Top = 10
        Padding.Right = 8
        Padding.Bottom = 10
        ParentBackground = False
        ShowCaption = False
        TabOrder = 1
        object spdbtnServerStart: TSpeedButton
          Tag = 1
          AlignWithMargins = True
          Left = 18
          Top = 10
          Width = 200
          Height = 61
          Margins.Left = 10
          Margins.Top = 0
          Margins.Right = 10
          Margins.Bottom = 0
          Action = actStartServer
          Align = alLeft
          Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100
          Images = vilButtons48
          Flat = True
          ExplicitLeft = 13
        end
        object spdbtnServerStop: TSpeedButton
          Tag = 2
          AlignWithMargins = True
          Left = 378
          Top = 10
          Width = 200
          Height = 61
          Margins.Left = 10
          Margins.Top = 0
          Margins.Right = 10
          Margins.Bottom = 0
          Action = actStopServer
          Align = alRight
          Caption = #1054#1089#1090#1072#1085#1086#1074#1080#1090#1100
          Images = vilButtons48
          Flat = True
          ExplicitLeft = 233
        end
      end
    end
    object tsHelp: TTabSheet
      Caption = 'tsHelp'
      ImageIndex = 2
      TabVisible = False
      object lbHelp: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 46
        Width = 582
        Height = 606
        Margins.Left = 10
        Margins.Right = 10
        Align = alClient
        Caption = 
          #1044#1072#1085#1085#1072#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1072' '#1103#1074#1083#1103#1077#1090#1089#1103' '#1089#1083#1091#1078#1073#1086#1081', '#1088#1077#1072#1083#1080#1079#1091#1102#1097#1077#1081' '#1091#1076#1072#1083#1105#1085#1085#1086#1077' '#1092#1072#1081#1083#1086#1074#1086 +
          #1077' '#1093#1088#1072#1085#1080#1083#1080#1097#1077' '#1087#1086' '#1087#1088#1086#1090#1086#1082#1086#1083#1091' HTTP REST. '#13#10#9#9'   '#13#10#9#9#1054#1089#1086#1073#1077#1085#1085#1089#1090#1080' '#1088#1072#1073#1086#1090#1099 +
          ' '#1087#1088#1086#1075#1088#1072#1084#1084#1099#13#10#1055#1086#1076#1076#1077#1088#1078#1072#1090#1100' '#1084#1077#1090#1086#1076#1099' HTTP '#1089#1086' '#1089#1083#1077#1076#1091#1102#1097#1077#1081' '#1089#1077#1084#1072#1085#1090#1080#1082#1086#1081': '#13#10#8226' ' +
          'GET - '#1095#1090#1077#1085#1080#1077' '#1092#1072#1081#1083#1072', '#13#10#8226' PUT - '#1087#1077#1088#1077#1079#1072#1087#1080#1089#1100' '#1092#1072#1081#1083#1072', '#13#10#8226' POST - '#1076#1086#1073#1072#1074 +
          #1083#1077#1085#1080#1077' '#1074' '#1082#1086#1085#1077#1094' '#1092#1072#1081#1083#1072', '#13#10#8226' DELETE - '#1091#1076#1072#1083#1077#1085#1080#1077' '#1092#1072#1081#1083#1072', '#13#10#8226' COPY - '#1082#1086#1087 +
          #1080#1088#1086#1074#1072#1085#1080#1077' '#1092#1072#1081#1083#1072', '#13#10#8226' MOVE - '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077' '#1092#1072#1081#1083#1072'. '#13#10#13#10#1058#1072#1082#1078#1077' '#1089#1091#1097#1077#1089#1090#1074#1091 +
          #1077#1090' '#1087#1088#1086#1075#1088#1072#1084#1084#1072' '#1082#1083#1080#1077#1085#1090#1072', '#1076#1077#1084#1086#1085#1089#1090#1088#1080#1088#1091#1102#1097#1091#1102' '#1088#1072#1073#1086#1090#1091' '#1089#1083#1091#1078#1073#1099'.'
        WordWrap = True
        OnMouseDown = Dragging
        ExplicitWidth = 580
        ExplicitHeight = 322
      end
      object lbHelpTitle: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 596
        Height = 33
        Margins.Top = 5
        Margins.Bottom = 5
        Align = alTop
        Alignment = taCenter
        Caption = #1057#1087#1088#1072#1074#1082#1072
        Color = clGray
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWhite
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        OnMouseDown = Dragging
        ExplicitWidth = 116
      end
      object lbTradeMark: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 658
        Width = 596
        Height = 23
        Align = alBottom
        Alignment = taRightJustify
        Caption = 'Anticlown'#8482
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = 8421631
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = actGoToGithubExecute
        ExplicitLeft = 502
        ExplicitWidth = 97
      end
    end
  end
  object pNav: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 694
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'pNav'
    Color = 4928301
    Padding.Top = 5
    Padding.Bottom = 5
    ParentBackground = False
    ShowCaption = False
    TabOrder = 1
    OnMouseDown = Dragging
    object spdbtnWelcome: TSpeedButton
      AlignWithMargins = True
      Left = 3
      Top = 8
      Width = 179
      Height = 50
      Action = actChooseOption
      Align = alTop
      Caption = #1053#1072#1095#1072#1083#1086
      ImageIndex = 5
      ImageName = 'logo_button'
      Images = vilButtons48
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16481792
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Margin = 10
      ParentFont = False
      Spacing = 15
      ExplicitLeft = 0
    end
    object spdbtnAdmin: TSpeedButton
      Tag = 1
      AlignWithMargins = True
      Left = 3
      Top = 64
      Width = 179
      Height = 50
      Action = actChooseOption
      Align = alTop
      Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077
      ImageIndex = 7
      ImageName = 'control_panel_80px'
      Images = vilButtons48
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16481792
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Margin = 10
      ParentFont = False
      Spacing = 15
      ExplicitLeft = 4
    end
    object spdbtnExit: TSpeedButton
      AlignWithMargins = True
      Left = 3
      Top = 636
      Width = 179
      Height = 50
      Action = actClose
      Align = alBottom
      Caption = #1042#1099#1093#1086#1076
      ImageIndex = 0
      ImageName = 'exit_48'
      Images = vilButtons48
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16481792
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Margin = 10
      ParentFont = False
      Spacing = 15
      ExplicitLeft = 4
    end
    object spdbtnHelp: TSpeedButton
      Tag = 2
      AlignWithMargins = True
      Left = 3
      Top = 580
      Width = 179
      Height = 50
      Action = actChooseOption
      Align = alBottom
      Caption = #1057#1087#1088#1072#1074#1082#1072
      ImageIndex = 1
      ImageName = 'help_48'
      Images = vilButtons48
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16481792
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Margin = 10
      ParentFont = False
      Spacing = 15
      ExplicitLeft = 4
      ExplicitTop = 587
    end
  end
  object vilButtons48: TVirtualImageList
    Images = <
      item
        CollectionIndex = 0
        CollectionName = 'exit_48'
        Name = 'exit_48'
      end
      item
        CollectionIndex = 1
        CollectionName = 'help_48'
        Name = 'help_48'
      end
      item
        CollectionIndex = 2
        CollectionName = 'load_file'
        Name = 'load_file'
      end
      item
        CollectionIndex = 3
        CollectionName = 'logo_button'
        Name = 'play_48px'
      end
      item
        CollectionIndex = 4
        CollectionName = 'chat_80px'
        Name = 'front_gate_open_40px'
      end
      item
        CollectionIndex = 3
        CollectionName = 'logo_button'
        Name = 'logo_button'
      end
      item
        CollectionIndex = 6
        Name = 'radar'
      end
      item
        CollectionIndex = 7
        Name = 'control_panel_80px'
      end>
    ImageCollection = dtmdImages.imgclcButtons
    Width = 48
    Height = 48
    Left = 40
    Top = 24
  end
  object actmngActions: TActionManager
    Left = 40
    Top = 80
    StyleName = 'Platform Default'
    object actClose: TAction
      Category = 'Form'
      OnExecute = actCloseExecute
    end
    object actChooseOption: TAction
      Category = 'Form'
      OnExecute = actChooseOptionExecute
    end
    object actGoToGithub: TAction
      Category = 'Form'
      OnExecute = actGoToGithubExecute
    end
    object actStartServer: TAction
      Category = 'Server'
      OnExecute = actStartServerExecute
    end
    object actStopServer: TAction
      Category = 'Server'
      OnExecute = actStopServerExecute
    end
  end
  object htpsvrServer: TIdHTTPServer
    Bindings = <>
    DefaultPort = 1488
    OnCommandOther = htpsvrServerCommandOther
    OnCommandGet = htpsvrServerCommandGet
    Left = 40
    Top = 152
  end
end
