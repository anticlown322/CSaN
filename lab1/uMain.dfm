object frmMain: TfrmMain
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 250
  BorderStyle = bsNone
  Caption = #1057#1082#1072#1085#1077#1088' '#1089#1077#1090#1080
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
    ActivePage = tsInterfaces
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object tsWelcome: TTabSheet
      Caption = 'tsWelcome'
      TabVisible = False
      object vimWelcomeBackground: TVirtualImage
        Left = 0
        Top = 0
        Width = 602
        Height = 684
        Align = alClient
        ImageCollection = dtmdImages.imgclcPictures
        ImageWidth = 0
        ImageHeight = 0
        ImageIndex = 2
        ImageName = 'computers'
        OnMouseDown = Dragging
        ExplicitLeft = 248
        ExplicitTop = 296
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
    end
    object tsInterfaces: TTabSheet
      Caption = 'tsInterfaces'
      ImageIndex = 1
      TabVisible = False
      OnMouseDown = Dragging
      object lbInterfacesTitle: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 596
        Height = 35
        Align = alTop
        Alignment = taCenter
        Caption = #1057#1082#1072#1085#1077#1088' '#1080#1085#1090#1077#1088#1092#1077#1081#1089#1086#1074
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clGray
        Font.Height = -29
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnMouseDown = Dragging
        ExplicitWidth = 317
      end
      object shpInterfaces: TShape
        AlignWithMargins = True
        Left = 3
        Top = 44
        Width = 596
        Height = 66
        Align = alTop
        Brush.Color = 6574152
        Pen.Style = psClear
        Shape = stRoundRect
        OnMouseDown = Dragging
        ExplicitTop = 42
      end
      object spdbtnInterfacesIPHlp: TSpeedButton
        Tag = 1
        Left = 12
        Top = 51
        Width = 250
        Height = 50
        Action = actStartInterfaces
        Caption = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100'(IPhlpAPI)'
        Flat = True
      end
      object spdbtnInterfacesWinAPI: TSpeedButton
        Tag = 2
        Left = 336
        Top = 51
        Width = 250
        Height = 50
        Action = actStartInterfaces
        Caption = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100'(WinAPI)'
        Flat = True
      end
      object pInterfaces: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 116
        Width = 596
        Height = 565
        Align = alTop
        BevelOuter = bvNone
        Color = 6574152
        Padding.Left = 10
        Padding.Right = 10
        ParentBackground = False
        ShowCaption = False
        TabOrder = 0
        object mmInterfacesOutput: TMemo
          AlignWithMargins = True
          Left = 13
          Top = 10
          Width = 570
          Height = 545
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
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
    object tsDevices: TTabSheet
      Caption = 'tsDevices'
      ImageIndex = 3
      TabVisible = False
      OnMouseDown = Dragging
      object lbDevicesTtile: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 596
        Height = 35
        Align = alTop
        Alignment = taCenter
        Caption = #1057#1082#1072#1085#1077#1088' '#1093#1086#1089#1090#1086#1074
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clGray
        Font.Height = -29
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnMouseDown = Dragging
        ExplicitWidth = 218
      end
      object shpDevices: TShape
        AlignWithMargins = True
        Left = 3
        Top = 44
        Width = 596
        Height = 101
        Align = alTop
        Brush.Color = 6574152
        Pen.Style = psClear
        Shape = stRoundRect
        OnMouseDown = Dragging
      end
      object spdbtnStartDevicesARP: TSpeedButton
        Tag = 1
        Left = 15
        Top = 52
        Width = 250
        Height = 50
        Action = actStartDevices
        Caption = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100'(arp -a)'
        Flat = True
      end
      object spdbtnStartDevicesPing: TSpeedButton
        Tag = 2
        Left = 334
        Top = 52
        Width = 250
        Height = 50
        Action = actStartDevices
        Caption = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100'(Ping)'
        Flat = True
      end
      object pDevices: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 151
        Width = 596
        Height = 530
        Align = alTop
        BevelOuter = bvNone
        Color = 6574152
        Padding.Left = 10
        Padding.Right = 10
        ParentBackground = False
        ShowCaption = False
        TabOrder = 0
        object mmDevices: TMemo
          AlignWithMargins = True
          Left = 13
          Top = 10
          Width = 570
          Height = 510
          Margins.Top = 10
          Margins.Bottom = 10
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 6574152
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -15
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object cbbIP: TComboBox
        Left = 353
        Top = 105
        Width = 206
        Height = 31
        BevelInner = bvNone
        BevelOuter = bvNone
        Style = csDropDownList
        Color = 4928301
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Sorted = True
        TabOrder = 1
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
          #1044#1072#1085#1085#1072#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1072' '#1074#1099#1087#1086#1083#1085#1103#1077#1090' '#1089#1082#1072#1085#1080#1088#1086#1074#1072#1085#1080#1077' '#1083#1086#1082#1072#1083#1100#1085#1086#1081' '#1089#1077#1090#1080' '#1080' '#1086#1090#1086#1073#1088#1072#1078 +
          #1072#1077#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080' '#1086#1073' '#1080#1084#1077#1102#1097#1080#1093#1089#1103' '#1074' '#1085#1077#1081' '#1091#1079#1083#1072#1093'. '#13#10#1044#1083#1103' '#1082#1072#1078#1076#1086#1075#1086' '#1091#1079#1083#1072' '#1087#1088#1086#1075 +
          #1088#1072#1084#1084#1072' '#1076#1086#1083#1078#1085#1072' '#1086#1090#1086#1073#1088#1072#1078#1072#1077#1090#1089#1103':'#13#10#8226' MAC-'#1072#1076#1088#1077#1089' '#13#10#8226' '#1048#1084#1103' '#13#10#1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1076#1086#1083#1078 +
          #1085#1072' '#1090#1072#1082#1078#1077' '#1086#1090#1086#1073#1088#1072#1078#1072#1090#1100' MAC-'#1072#1076#1088#1077#1089' '#1080' '#1080#1084#1103' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1086#1075#1086' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072', '#1075#1076#1077 +
          ' '#1088#1072#1073#1086#1090#1072#1077#1090' '#1087#1088#1086#1075#1088#1072#1084#1084#1072'.'
        WordWrap = True
        OnMouseDown = Dragging
        ExplicitWidth = 563
        ExplicitHeight = 161
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
    object spdbtnInterfaces: TSpeedButton
      Tag = 1
      AlignWithMargins = True
      Left = 3
      Top = 64
      Width = 179
      Height = 50
      Action = actChooseOption
      Align = alTop
      Caption = #1048#1085#1090#1077#1088#1092#1077#1081#1089#1099
      ImageIndex = 6
      ImageName = 'radar'
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
      Tag = 3
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
    object spdbtnDevices: TSpeedButton
      Tag = 2
      AlignWithMargins = True
      Left = 3
      Top = 120
      Width = 179
      Height = 50
      Action = actChooseOption
      Align = alTop
      Caption = #1061#1086#1089#1090#1099
      ImageIndex = 6
      ImageName = 'radar'
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
      ExplicitTop = 136
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
        CollectionName = 'play_48px'
        Name = 'play_48px'
      end
      item
        CollectionIndex = 4
        CollectionName = 'front_gate_open_40px'
        Name = 'front_gate_open_40px'
      end
      item
        CollectionIndex = 5
        CollectionName = 'logo_button'
        Name = 'logo_button'
      end
      item
        CollectionIndex = 6
        CollectionName = 'radar'
        Name = 'radar'
      end>
    ImageCollection = dtmdImages.imgclcButtons
    Width = 48
    Height = 48
    Left = 40
    Top = 24
  end
  object actmngActions: TActionManager
    Left = 96
    Top = 24
    StyleName = 'Platform Default'
    object actClose: TAction
      Category = 'Form'
      OnExecute = actCloseExecute
    end
    object actChooseOption: TAction
      Category = 'Form'
      OnExecute = actChooseOptionExecute
    end
    object actStartInterfaces: TAction
      Category = 'Scaner'
      OnExecute = actStartInterfacesExecute
    end
    object actGoToGithub: TAction
      Category = 'Form'
      OnExecute = actGoToGithubExecute
    end
    object actStartDevices: TAction
      Category = 'Scaner'
      OnExecute = actStartDevicesExecute
    end
  end
  object tmrCheckInterfaces: TTimer
    Interval = 5000
    OnTimer = tmrCheckInterfacesTimer
    Left = 136
    Top = 24
  end
end
