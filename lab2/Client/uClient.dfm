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
    ActivePage = tsHelp
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
    object tsChat: TTabSheet
      Caption = 'tsChat'
      ImageIndex = 1
      TabVisible = False
      OnMouseDown = Dragging
      object lbChatTitle: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 596
        Height = 35
        Align = alTop
        Alignment = taCenter
        Caption = #1054#1073#1097#1080#1081' '#1095#1072#1090
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clGray
        Font.Height = -29
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        OnMouseDown = Dragging
        ExplicitWidth = 164
      end
      object grdpChat: TGridPanel
        Left = 0
        Top = 41
        Width = 602
        Height = 643
        Align = alClient
        BevelOuter = bvNone
        Color = 6574152
        ColumnCollection = <
          item
            SizeStyle = ssAbsolute
            Value = 45.000000000000000000
          end
          item
            Value = 100.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 150.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 50.000000000000000000
          end>
        ControlCollection = <
          item
            Column = 1
            ColumnSpan = 2
            Control = eOutMessage
            Row = 2
          end
          item
            Column = 0
            Control = spdbtnFileSend
            Row = 2
          end
          item
            Column = 0
            ColumnSpan = 2
            Control = mmChat
            Row = 1
          end
          item
            Column = 0
            ColumnSpan = 2
            Control = pServerOptions
            Row = 0
          end
          item
            Column = 2
            ColumnSpan = 2
            Control = lbUserList
            Row = 0
          end
          item
            Column = 2
            ColumnSpan = 2
            Control = lstUserList
            Row = 1
          end
          item
            Column = 3
            Control = spdbtnMessageSend
            Row = 2
          end>
        ParentBackground = False
        RowCollection = <
          item
            SizeStyle = ssAbsolute
            Value = 52.000000000000000000
          end
          item
            Value = 100.000000000000000000
          end
          item
            SizeStyle = ssAbsolute
            Value = 40.000000000000000000
          end
          item
            SizeStyle = ssAuto
          end>
        TabOrder = 0
        DesignSize = (
          602
          643)
        object eOutMessage: TEdit
          AlignWithMargins = True
          Left = 48
          Top = 606
          Width = 501
          Height = 34
          Align = alClient
          BevelEdges = [beBottom]
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = 6574152
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -22
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnKeyDown = eOutMessageKeyDown
        end
        object spdbtnFileSend: TSpeedButton
          AlignWithMargins = True
          Left = 8
          Top = 606
          Width = 34
          Height = 34
          Margins.Left = 8
          Action = actSendFile
          Align = alClient
          ImageIndex = 1
          ImageName = 'attach_30px'
          Images = vilButtons32
          Flat = True
          ExplicitLeft = 80
          ExplicitTop = 96
          ExplicitWidth = 23
          ExplicitHeight = 22
        end
        object mmChat: TMemo
          AlignWithMargins = True
          Left = 10
          Top = 62
          Width = 382
          Height = 531
          Margins.Left = 10
          Margins.Top = 10
          Margins.Right = 10
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
          TabOrder = 1
        end
        object pServerOptions: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 396
          Height = 54
          Align = alTop
          BevelOuter = bvNone
          Color = 6574152
          Padding.Left = 8
          Padding.Top = 10
          Padding.Right = 8
          Padding.Bottom = 10
          ParentBackground = False
          ShowCaption = False
          TabOrder = 2
          object spdbtnStart: TSpeedButton
            AlignWithMargins = True
            Left = 18
            Top = 10
            Width = 150
            Height = 34
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 10
            Margins.Bottom = 0
            Action = actOpenConnection
            Align = alLeft
            Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103
            Images = vilButtons48
            Flat = True
          end
          object spdbtnStop: TSpeedButton
            AlignWithMargins = True
            Left = 188
            Top = 10
            Width = 150
            Height = 34
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 10
            Margins.Bottom = 0
            Action = actCloseConnection
            Align = alLeft
            Caption = #1054#1090#1082#1083#1102#1095#1080#1090#1100#1089#1103
            Images = vilButtons48
            Flat = True
          end
        end
        object lbUserList: TLabel
          Left = 436
          Top = 3
          Width = 132
          Height = 46
          Alignment = taCenter
          Anchors = []
          Caption = #1057#1087#1080#1089#1086#1082#13#10#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081
          ExplicitLeft = 462
          ExplicitTop = 14
        end
        object lstUserList: TListBox
          AlignWithMargins = True
          Left = 405
          Top = 55
          Width = 194
          Height = 545
          Align = alClient
          BorderStyle = bsNone
          Color = 6574152
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 19
          ParentFont = False
          TabOrder = 3
        end
        object spdbtnMessageSend: TSpeedButton
          AlignWithMargins = True
          Left = 560
          Top = 606
          Width = 39
          Height = 34
          Margins.Left = 8
          Action = actSendMessage
          Align = alClient
          ImageIndex = 2
          ImageName = 'sent_48px'
          Images = vilButtons32
          Flat = True
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitLeft = 80
          ExplicitTop = 96
          ExplicitWidth = 23
          ExplicitHeight = 22
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
          #1044#1072#1085#1085#1072#1103' '#1087#1088#1086#1075#1088#1072#1084#1084#1072' '#1087#1086#1079#1074#1086#1083#1103#1077#1090' '#1086#1073#1084#1077#1085#1080#1074#1072#1090#1100#1089#1103' '#1090#1077#1082#1089#1090#1086#1074#1099#1084#1080' '#1089#1086#1086#1073#1097#1077#1085#1080#1103#1084#1080' '#1084 +
          #1077#1078#1076#1091' '#1076#1074#1091#1084#1103' '#1080' '#1073#1086#1083#1077#1077' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072#1084#1080' '#1089' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1077#1084' '#1087#1088#1086#1075#1088#1072#1084#1084#1085#1086#1075#1086' '#1080#1085 +
          #1090#1077#1088#1092#1077#1081#1089#1072' Socket API.'#13#10#9#9'   '#13#10#9#9#1054#1089#1086#1073#1077#1085#1085#1089#1090#1080' '#1088#1072#1073#1086#1090#1099' '#1087#1088#1086#1075#1088#1072#1084#1084#1099#13#10#8226' '#1055#1086 +
          #1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' '#1074#1074#1086#1076#1080#1090' IP, '#1087#1086#1088#1090' '#1080' '#1085#1080#1082#1085#1077#1081#1084' '#1089#1072#1084#1086#1089#1090#1086#1103#1090#1077#1083#1100#1085#1086'('#1076#1083#1103' '#1080#1079#1084#1077#1085#1077#1085#1080 +
          #1103' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1087#1077#1088#1077#1087#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103');'#13#10#8226' '#1055#1077#1088#1077#1076' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1077#1084' '#1087#1088#1086#1074#1077#1088#1103#1077 +
          #1090#1089#1103' '#1076#1086#1089#1090#1091#1087#1085#1086#1089#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1087#1086#1088#1090#1072'. '#1042' '#1089#1083#1091#1095#1072#1077', '#1077#1089#1083#1080' '#1087#1086#1088#1090' '#1079#1072#1085#1103#1090', '#1074#1089#1087 +
          #1083#1099#1074#1072#1077#1090' '#1086#1082#1085#1086', '#1086#1087#1086#1074#1077#1097#1072#1102#1097#1077#1077' '#1086#1073' '#1086#1096#1080#1073#1082#1077'.'#13#10#8226' '#1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' '#1084#1086#1078#1077#1090' '#1073#1099#1090#1100' '#1074 +
          ' '#1086#1076#1085#1086#1089#1090#1086#1088#1086#1085#1085#1077#1084' '#1087#1086#1088#1103#1076#1082#1077' '#1086#1090#1082#1083#1102#1095#1077#1085' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1086#1084' '#1089#1077#1088#1074#1077#1088#1072
        WordWrap = True
        OnMouseDown = Dragging
        ExplicitHeight = 276
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
      Caption = #1063#1072#1090
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
    object actOpenConnection: TAction
      Category = 'Client'
      Caption = 'actOpenConnection'
      OnExecute = actOpenConnectionExecute
    end
    object actCloseConnection: TAction
      Category = 'Client'
      OnExecute = actCloseConnectionExecute
    end
    object actSendMessage: TAction
      Category = 'Client'
      OnExecute = actSendMessageExecute
    end
    object actSendFile: TAction
      Category = 'Client'
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
  object cltsctClient: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnLookup = cltsctClientLookup
    OnConnecting = cltsctClientConnecting
    OnConnect = cltsctClientConnect
    OnDisconnect = cltsctClientDisconnect
    OnRead = cltsctClientRead
    OnError = cltsctClientError
    Left = 88
    Top = 80
  end
end
