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
    ActivePage = tsStorage
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
    object tsStorage: TTabSheet
      Caption = 'tsStorage'
      ImageIndex = 1
      TabVisible = False
      OnMouseDown = Dragging
      object lbStorageTitle: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 596
        Height = 35
        Align = alTop
        Alignment = taCenter
        Caption = #1061#1088#1072#1085#1080#1083#1080#1097#1077
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clGray
        Font.Height = -29
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnMouseDown = Dragging
        ExplicitWidth = 175
      end
      object pFileOptions: TPanel
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
        TabOrder = 0
        object spdbtnGET: TSpeedButton
          Tag = 1
          AlignWithMargins = True
          Left = 18
          Top = 10
          Width = 75
          Height = 61
          Margins.Left = 10
          Margins.Top = 0
          Margins.Right = 10
          Margins.Bottom = 0
          Action = actChooseRESTMethod
          Align = alLeft
          Caption = 'GET'
          Images = vilButtons48
          Flat = True
        end
        object spdbtnPUT: TSpeedButton
          Tag = 2
          AlignWithMargins = True
          Left = 113
          Top = 10
          Width = 75
          Height = 61
          Margins.Left = 10
          Margins.Top = 0
          Margins.Right = 10
          Margins.Bottom = 0
          Action = actChooseRESTMethod
          Align = alLeft
          Caption = 'PUT'
          Images = vilButtons48
          Flat = True
        end
        object spdbtnDELETE: TSpeedButton
          Tag = 6
          AlignWithMargins = True
          Left = 493
          Top = 10
          Width = 75
          Height = 61
          Margins.Left = 10
          Margins.Top = 0
          Margins.Right = 10
          Margins.Bottom = 0
          Action = actChooseRESTMethod
          Align = alLeft
          Caption = 'DEL'
          Images = vilButtons48
          Flat = True
          ExplicitLeft = 303
        end
        object spdbtnMOVE: TSpeedButton
          Tag = 4
          AlignWithMargins = True
          Left = 303
          Top = 10
          Width = 75
          Height = 61
          Margins.Left = 10
          Margins.Top = 0
          Margins.Right = 10
          Margins.Bottom = 0
          Action = actChooseRESTMethod
          Align = alLeft
          Caption = 'MOVE'
          Images = vilButtons48
          Flat = True
          ExplicitLeft = 208
        end
        object spdbtnPOST: TSpeedButton
          Tag = 5
          AlignWithMargins = True
          Left = 398
          Top = 10
          Width = 75
          Height = 61
          Margins.Left = 10
          Margins.Top = 0
          Margins.Right = 10
          Margins.Bottom = 0
          Action = actChooseRESTMethod
          Align = alLeft
          Caption = 'POST'
          Images = vilButtons48
          Flat = True
          ExplicitLeft = 303
        end
        object spdbtnCOPY: TSpeedButton
          Tag = 3
          AlignWithMargins = True
          Left = 208
          Top = 10
          Width = 75
          Height = 61
          Margins.Left = 10
          Margins.Top = 0
          Margins.Right = 10
          Margins.Bottom = 0
          Action = actChooseRESTMethod
          Align = alLeft
          Caption = 'COPY'
          Images = vilButtons48
          Flat = True
        end
      end
      object pLogs: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 44
        Width = 596
        Height = 550
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pLogs'
        Color = 6574152
        Padding.Left = 10
        Padding.Right = 10
        ParentBackground = False
        ShowCaption = False
        TabOrder = 1
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
    end
    object tsHelp: TTabSheet
      Caption = 'tsHelp'
      ImageIndex = 2
      TabVisible = False
      object lbHelp: TLabel
        AlignWithMargins = True
        Left = 10
        Top = 46
        Width = 574
        Height = 253
        Margins.Left = 10
        Margins.Right = 10
        Align = alClient
        Caption = 
          #1044#1072#1085#1085#1072#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1072' '#1087#1086#1079#1074#1086#1083#1103#1077#1090' '#1080#1089#1086#1087#1083#1100#1079#1086#1074#1072#1090#1100' '#1086#1073#1083#1072#1095#1085#1086#1077' '#1092#1072#1081#1083#1086#1074#1086#1077' '#1093#1088#1072#1085#1080#1083 +
          #1080#1097#1077', '#1088#1072#1089#1087#1086#1083#1086#1078#1077#1085#1085#1086#1077' '#1085#1072' '#1083#1086#1082#1072#1083#1100#1085#1086#1084' '#1089#1077#1088#1074#1077#1088#1077'. '#13#10#9#9'   '#13#10#9#9#1054#1089#1086#1073#1077#1085#1085#1089#1090#1080' '#1088 +
          #1072#1073#1086#1090#1099' '#1087#1088#1086#1075#1088#1072#1084#1084#1099#13#10#1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1087#1086#1076#1076#1077#1088#1078#1080#1074#1072#1077#1090' '#1089#1083#1077#1076#1091#1102#1097#1080#1077' '#1092#1091#1085#1082#1094#1080#1080':'#13#10#8226' '#1063#1090 +
          #1077#1085#1080#1077' '#1092#1072#1081#1083#1086#1074' '#1080#1079' '#1093#1088#1072#1085#1080#1083#1080#1097#1072#13#10#8226' '#1055#1077#1088#1077#1079#1072#1087#1080#1089#1100' '#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1080#1093' '#1092#1072#1081#1083#1086#1074#13#10#8226' '#1044#1086 +
          #1073#1072#1074#1083#1077#1085#1080#1077' '#1085#1086#1074#1099#1093' '#1092#1072#1081#1083#1086#1074' '#1074' '#1093#1088#1072#1085#1080#1083#1080#1097#1077#13#10#8226' '#1059#1076#1072#1083#1077#1085#1080#1077' '#1092#1072#1081#1083#1072' '#1080#1079' '#1093#1088#1072#1085#1080#1083#1080#1097#1072 +
          #13#10#8226' '#1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1092#1072#1081#1083#1072' '#1080#1079' '#1093#1088#1072#1085#1080#1083#1080#1097#1072' '#13#10#8226' '#1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077' '#1092#1072#1081#1083#1072' '#1074' '#1088#1072#1084#1082#1072 +
          #1093' '#1093#1088#1072#1085#1080#1083#1080#1097#1072
        WordWrap = True
        OnMouseDown = Dragging
      end
      object lbHelpTitle: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 116
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
      end
      object lbTradeMark: TLabel
        AlignWithMargins = True
        Left = 502
        Top = 658
        Width = 97
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
      ImageIndex = 3
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
      Caption = #1061#1088#1072#1085#1080#1083#1080#1097#1077
      ImageIndex = 4
      ImageName = 'chat_80px'
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
        Name = 'logo_button'
      end
      item
        CollectionIndex = 4
        CollectionName = 'chat_80px'
        Name = 'chat_80px'
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
    object actGoToGithub: TAction
      Category = 'Form'
      OnExecute = actGoToGithubExecute
    end
    object actChooseRESTMethod: TAction
      Category = 'Client'
      OnExecute = actChooseRESTMethodExecute
    end
  end
  object vilButtons32: TVirtualImageList
    Images = <
      item
        CollectionIndex = 5
        CollectionName = 'attach_26px'
        Name = 'attach_26px'
      end
      item
        CollectionIndex = 6
        CollectionName = 'attach_30px'
        Name = 'attach_30px'
      end
      item
        CollectionIndex = 7
        CollectionName = 'sent_48px'
        Name = 'sent_48px'
      end>
    ImageCollection = dtmdImages.imgclcButtons
    Width = 32
    Height = 32
    Left = 40
    Top = 80
  end
  object httpcltClient: TNetHTTPClient
    UserAgent = 'Embarcadero URI Client/1.0'
    Left = 48
    Top = 200
  end
  object httprqtReq: TNetHTTPRequest
    URL = 'http://localhost:8080/'
    Client = httpcltClient
    Left = 48
    Top = 264
  end
end
