object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 431
  ClientWidth = 479
  Color = clBtnFace
  Constraints.MinHeight = 470
  Constraints.MinWidth = 495
  DoubleBuffered = True
  Font.Charset = OEM_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poDesktopCenter
  ScreenSnap = True
  SnapBuffer = 0
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 13
  object LabelInfo: TLabel
    Left = 0
    Top = 0
    Width = 479
    Height = 20
    Align = alTop
    Alignment = taRightJustify
    Caption = '##########'
    Font.Charset = OEM_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ExplicitLeft = 389
    ExplicitWidth = 90
  end
  object TabControlButtons: TTabControl
    Left = 0
    Top = 396
    Width = 479
    Height = 35
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 392
    DesignSize = (
      479
      35)
    object ButtonCancelSettings: TButton
      Left = 376
      Top = 6
      Width = 95
      Height = 25
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      Font.Charset = OEM_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = ButtonCancelSettingsClick
    end
    object ButtonOKSettings: TButton
      Left = 275
      Top = 6
      Width = 95
      Height = 25
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Ok'
      Font.Charset = OEM_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = ButtonOKSettingsClick
    end
  end
  object TabControlBodyLeft: TTabControl
    Left = 0
    Top = 20
    Width = 130
    Height = 376
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 372
    object TreeViewMenu: TTreeView
      Left = 4
      Top = 6
      Width = 122
      Height = 366
      Align = alClient
      Constraints.MinHeight = 169
      Font.Charset = OEM_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      HideSelection = False
      HotTrack = True
      Indent = 19
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      RowSelect = True
      ShowHint = False
      ShowLines = False
      ShowRoot = False
      TabOrder = 0
      OnClick = TreeViewMenuClick
      Items.NodeData = {
        070400000009540054007200650065004E006F00640065002F00000000000000
        00000000FFFFFFFFFFFFFFFF0000000000000000000000000001081E0441043D
        043E0432043D044B0435040000330000000000000000000000FFFFFFFFFFFFFF
        FF00000000000000000000000000010A2D043A04320430043B04300439043704
        3504400400003D0000000000000000000000FFFFFFFFFFFFFFFF000000000000
        00000000000000010F13043E0440044F0447043804350420003A043B04300432
        0438044804380400002D0000000000000000000000FFFFFFFFFFFFFFFF000000
        0000000000000000000001071F043B043004330438043D044B04}
      ExplicitHeight = 362
    end
  end
  object TabControlBody: TTabControl
    Left = 130
    Top = 20
    Width = 349
    Height = 376
    Align = alClient
    TabOrder = 1
    ExplicitHeight = 372
    object PageControlOptions: TPageControl
      Left = 4
      Top = 6
      Width = 341
      Height = 366
      Cursor = crHandPoint
      ActivePage = PageGeneral
      Align = alClient
      MultiLine = True
      TabHeight = 20
      TabOrder = 0
      TabPosition = tpBottom
      TabWidth = 20
      ExplicitHeight = 362
      object PageGeneral: TTabSheet
        Caption = '0'
        ImageIndex = -1
        object GroupBoxBasic: TGroupBox
          Left = 0
          Top = 0
          Width = 333
          Height = 98
          Align = alTop
          Caption = #1054#1089#1085#1086#1074#1085#1099#1077
          TabOrder = 0
          object ProgressBox: TCheckBox
            Left = 10
            Top = 55
            Width = 300
            Height = 17
            Cursor = crHandPoint
            Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1087#1088#1086#1075#1088#1077#1089#1089' '#1085#1072' '#1087#1072#1085#1077#1083#1080' '#1079#1072#1076#1072#1095
            TabOrder = 3
            OnClick = ProgressBoxClick
          end
          object TaskTrackGo: TCheckBox
            Left = 82
            Top = 123
            Width = 300
            Height = 17
            Cursor = crHandPoint
            Caption = #1041#1077#1075#1091#1097#1072#1103' '#1089#1090#1088#1086#1082#1072
            TabOrder = 2
            Visible = False
          end
          object ShowCoverArts: TCheckBox
            Left = 10
            Top = 16
            Width = 300
            Height = 17
            Cursor = crHandPoint
            Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1086#1073#1083#1086#1078#1082#1091' '#1092#1072#1081#1083#1072
            TabOrder = 0
            OnClick = ShowCoverArtsClick
          end
          object CheckBox_ShowPL: TCheckBox
            Left = 10
            Top = 35
            Width = 300
            Height = 17
            Cursor = crHandPoint
            Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1083#1077#1081#1083#1080#1089#1090
            TabOrder = 1
            OnClick = CheckBox_ShowPLClick
          end
          object CheckBox_LinesPL: TCheckBox
            Left = 10
            Top = 75
            Width = 300
            Height = 17
            Cursor = crHandPoint
            Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1089#1077#1090#1082#1091' '#1087#1083#1077#1081#1083#1080#1089#1090#1072
            TabOrder = 4
            OnClick = CheckBox_LinesPLClick
          end
        end
        object GroupBoxWindowsPosition: TGroupBox
          Left = 0
          Top = 319
          Width = 333
          Height = 40
          Align = alTop
          Caption = #1055#1086#1079#1080#1094#1080#1103' '#1086#1082#1085#1072
          TabOrder = 2
          ExplicitTop = 312
          object PlayerWindowCenter: TCheckBox
            Left = 10
            Top = 16
            Width = 300
            Height = 17
            Cursor = crHandPoint
            Caption = #1054#1082#1085#1086' '#1087#1083#1077#1077#1088#1072' '#1087#1086' '#1094#1077#1085#1090#1088#1091
            TabOrder = 0
            OnClick = PlayerWindowCenterClick
          end
        end
        object GroupBoxIntegration: TGroupBox
          Left = 0
          Top = 279
          Width = 333
          Height = 40
          Align = alTop
          Caption = #1048#1085#1090#1077#1075#1088#1072#1094#1080#1103
          TabOrder = 1
          ExplicitTop = 272
          object CheckBoxFolderMenu: TCheckBox
            Left = 10
            Top = 16
            Width = 313
            Height = 17
            Cursor = crHandPoint
            Caption = #1048#1085#1090#1077#1075#1088#1072#1094#1080#1103' '#1074' '#1084#1077#1085#1102' '#1087#1072#1087#1086#1082
            TabOrder = 0
            OnClick = CheckBoxFolderMenuClick
          end
        end
        object GroupBox1: TGroupBox
          Left = 0
          Top = 98
          Width = 333
          Height = 80
          Align = alTop
          Caption = #1040#1074#1090#1086#1084#1072#1090#1080#1082#1072
          TabOrder = 3
          object AutoNext: TCheckBox
            Left = 10
            Top = 16
            Width = 300
            Height = 17
            Cursor = crHandPoint
            Caption = #1040#1074#1090#1086' '#1087#1077#1088#1077#1093#1086#1076' '#1085#1072' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1090#1088#1077#1082
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            OnClick = AutoNextClick
          end
          object RandomTrack: TCheckBox
            Left = 10
            Top = 35
            Width = 300
            Height = 17
            Cursor = crHandPoint
            Caption = #1057#1083#1091#1095#1072#1081#1085#1099#1081' '#1090#1088#1077#1082' '#1074' '#1087#1083#1077#1081#1083#1080#1089#1090#1077
            Font.Charset = OEM_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 1
            OnClick = RandomTrackClick
          end
          object RepeatSong: TCheckBox
            Left = 10
            Top = 55
            Width = 300
            Height = 17
            Cursor = crHandPoint
            Caption = #1055#1086#1074#1090#1086#1088' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1090#1088#1077#1082#1072
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
            OnClick = RepeatSongClick
          end
        end
        object GroupBoxTryNotification: TGroupBox
          Left = 0
          Top = 178
          Width = 333
          Height = 101
          Align = alTop
          Caption = #1054#1073#1083#1072#1089#1090#1100' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081
          TabOrder = 4
          object TrayIcon: TCheckBox
            Left = 10
            Top = 16
            Width = 300
            Height = 17
            Cursor = crHandPoint
            Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1079#1085#1072#1095#1086#1082' '#1074' '#1086#1073#1083#1072#1089#1090#1080' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081
            TabOrder = 0
            OnClick = TrayIconClick
          end
          object TrayIconMinimize: TCheckBox
            Left = 10
            Top = 35
            Width = 300
            Height = 17
            Cursor = crHandPoint
            Caption = #1057#1074#1086#1088#1072#1095#1080#1074#1072#1090#1100' '#1074' '#1086#1073#1083#1072#1089#1090#1100' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081
            TabOrder = 1
            OnClick = TrayIconMinimizeClick
          end
          object BaloonWindow: TCheckBox
            Left = 10
            Top = 55
            Width = 300
            Height = 17
            Cursor = crHandPoint
            Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1074#1089#1087#1083#1099#1074#1072#1102#1097#1077#1077' '#1086#1082#1085#1086' '#1089' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1077#1081
            TabOrder = 2
          end
          object CheckBoxColorTrayIcon: TCheckBox
            Left = 10
            Top = 75
            Width = 300
            Height = 17
            Cursor = crHandPoint
            Caption = #1062#1074#1077#1090#1085#1072#1103' '#1080#1082#1086#1085#1082#1072' '#1074' '#1090#1088#1077#1077
            TabOrder = 3
            OnClick = CheckBoxColorTrayIconClick
          end
        end
      end
      object PageEQ: TTabSheet
        Caption = '3'
        ImageIndex = -1
        object GroupBoxEqualizerON: TGroupBox
          Left = 0
          Top = 60
          Width = 333
          Height = 45
          Align = alTop
          Caption = #1069#1082#1074#1072#1083#1072#1081#1079#1077#1088
          TabOrder = 0
          object boxEQSelect: TComboBox
            Left = 12
            Top = 16
            Width = 192
            Height = 21
            Cursor = crHandPoint
            Style = csDropDownList
            Color = clBtnFace
            Font.Charset = OEM_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = boxEQSelectChange
            Items.Strings = (
              'Default'
              'FULLBT'
              'Rock'
              'Rap'
              'Grunge'
              'Metal'
              'Techno'
              'Pop'
              'Classic'
              'Voice'
              'Jazz'
              'Acoustic'
              'BassBoost'
              'Detail'
              'SmallSpeakers'
              'Dance'
              'HipHopOld'
              'Blues'
              'Reggae'
              'Cinema'
              'Custom')
          end
          object chEqualizer: TCheckBox
            Left = 220
            Top = 18
            Width = 77
            Height = 17
            Cursor = crHandPoint
            Hint = #1042#1082#1083#1102#1095#1080#1090#1100'/'#1042#1099#1082#1083#1102#1095#1080#1090#1100' '#1101#1082#1074#1072#1083#1072#1081#1079#1077#1088
            Caption = '('#1042#1082#1083'/'#1042#1099#1082#1083')'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = chEqualizerClick
          end
        end
        object GroupBoxEqualizer: TGroupBox
          Left = 0
          Top = 105
          Width = 333
          Height = 161
          Align = alTop
          Caption = #1059#1088#1086#1074#1085#1080
          TabOrder = 1
          object Label80Hz: TLabel
            Left = 12
            Top = 24
            Width = 12
            Height = 13
            Caption = '80'
          end
          object Label170Hz: TLabel
            Left = 39
            Top = 137
            Width = 18
            Height = 13
            Caption = '170'
          end
          object Label310Hz: TLabel
            Left = 69
            Top = 24
            Width = 18
            Height = 13
            Caption = '310'
          end
          object Label600Hz: TLabel
            Left = 99
            Top = 137
            Width = 18
            Height = 13
            Caption = '600'
          end
          object Label1000Hz: TLabel
            Left = 131
            Top = 24
            Width = 15
            Height = 13
            Caption = '1 k'
          end
          object Label3000Hz: TLabel
            Left = 163
            Top = 137
            Width = 15
            Height = 13
            Caption = '3 k'
          end
          object Label6000Hz: TLabel
            Left = 190
            Top = 24
            Width = 15
            Height = 13
            Caption = '6 k'
          end
          object Label10000Hz: TLabel
            Left = 219
            Top = 137
            Width = 21
            Height = 13
            Caption = '10 k'
          end
          object Label12000Hz: TLabel
            Left = 247
            Top = 24
            Width = 21
            Height = 13
            Caption = '12 k'
          end
          object Label16000Hz: TLabel
            Left = 279
            Top = 137
            Width = 21
            Height = 13
            Caption = '16 k'
          end
          object TrackBar6000Hz: TTrackBar
            Left = 183
            Top = 40
            Width = 30
            Height = 91
            Cursor = crHandPoint
            Max = 15
            Min = -15
            Orientation = trVertical
            ParentShowHint = False
            ShowHint = False
            ShowSelRange = False
            TabOrder = 6
            ThumbLength = 12
            TickMarks = tmBoth
            TickStyle = tsManual
            OnChange = TrackBar6000HzChange
          end
          object TrackBar10000Hz: TTrackBar
            Left = 213
            Top = 40
            Width = 30
            Height = 91
            Cursor = crHandPoint
            Max = 15
            Min = -15
            Orientation = trVertical
            ParentShowHint = False
            ShowHint = False
            ShowSelRange = False
            TabOrder = 7
            ThumbLength = 12
            TickMarks = tmBoth
            TickStyle = tsManual
            OnChange = TrackBar10000HzChange
          end
          object TrackBar12000Hz: TTrackBar
            Left = 243
            Top = 40
            Width = 30
            Height = 91
            Cursor = crHandPoint
            Max = 15
            Min = -15
            Orientation = trVertical
            ParentShowHint = False
            ShowHint = False
            ShowSelRange = False
            TabOrder = 8
            ThumbLength = 12
            TickMarks = tmBoth
            TickStyle = tsManual
            OnChange = TrackBar12000HzChange
          end
          object TrackBar16000Hz: TTrackBar
            Left = 273
            Top = 40
            Width = 30
            Height = 91
            Cursor = crHandPoint
            Max = 15
            Min = -15
            Orientation = trVertical
            ParentShowHint = False
            ShowHint = False
            ShowSelRange = False
            TabOrder = 9
            ThumbLength = 12
            TickMarks = tmBoth
            TickStyle = tsManual
            OnChange = TrackBar16000HzChange
          end
          object TrackBar80Hz: TTrackBar
            Left = 3
            Top = 40
            Width = 30
            Height = 91
            Cursor = crHandPoint
            Max = 15
            Min = -15
            Orientation = trVertical
            ParentShowHint = False
            ShowHint = False
            ShowSelRange = False
            TabOrder = 0
            ThumbLength = 12
            TickMarks = tmBoth
            TickStyle = tsManual
            OnChange = TrackBar80HzChange
          end
          object TrackBar170Hz: TTrackBar
            Left = 33
            Top = 40
            Width = 30
            Height = 91
            Cursor = crHandPoint
            Max = 15
            Min = -15
            Orientation = trVertical
            ParentShowHint = False
            ShowHint = False
            ShowSelRange = False
            TabOrder = 1
            ThumbLength = 12
            TickMarks = tmBoth
            TickStyle = tsManual
            OnChange = TrackBar170HzChange
          end
          object TrackBar310Hz: TTrackBar
            Left = 63
            Top = 40
            Width = 30
            Height = 91
            Cursor = crHandPoint
            Max = 15
            Min = -15
            Orientation = trVertical
            ParentShowHint = False
            ShowHint = False
            ShowSelRange = False
            TabOrder = 2
            ThumbLength = 12
            TickMarks = tmBoth
            TickStyle = tsManual
            OnChange = TrackBar310HzChange
          end
          object TrackBar600Hz: TTrackBar
            Left = 93
            Top = 40
            Width = 30
            Height = 91
            Cursor = crHandPoint
            Max = 15
            Min = -15
            Orientation = trVertical
            ParentShowHint = False
            ShowHint = False
            ShowSelRange = False
            TabOrder = 3
            ThumbLength = 12
            TickMarks = tmBoth
            TickStyle = tsManual
            OnChange = TrackBar600HzChange
          end
          object TrackBar1000Hz: TTrackBar
            Left = 123
            Top = 40
            Width = 30
            Height = 91
            Cursor = crHandPoint
            Max = 15
            Min = -15
            Orientation = trVertical
            ParentShowHint = False
            ShowHint = False
            ShowSelRange = False
            TabOrder = 4
            ThumbLength = 12
            TickMarks = tmBoth
            TickStyle = tsManual
            OnChange = TrackBar1000HzChange
          end
          object TrackBar3000Hz: TTrackBar
            Left = 153
            Top = 40
            Width = 30
            Height = 91
            Cursor = crHandPoint
            Max = 15
            Min = -15
            Orientation = trVertical
            ParentShowHint = False
            ShowHint = False
            ShowSelRange = False
            TabOrder = 5
            ThumbLength = 12
            TickMarks = tmBoth
            TickStyle = tsManual
            OnChange = TrackBar3000HzChange
          end
        end
        object GroupBoxSoundEffects: TGroupBox
          Left = 0
          Top = 266
          Width = 333
          Height = 65
          Align = alTop
          Caption = #1069#1092#1092#1077#1082#1090#1099
          TabOrder = 2
          object BassEF: TCheckBox
            Left = 10
            Top = 35
            Width = 90
            Height = 17
            Cursor = crHandPoint
            BiDiMode = bdLeftToRight
            Caption = 'Bass'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentBiDiMode = False
            ParentFont = False
            TabOrder = 4
            OnClick = BassEFClick
          end
          object chChorus: TCheckBox
            Left = 210
            Top = 35
            Width = 90
            Height = 17
            Cursor = crHandPoint
            Caption = 'Chorus'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnClick = chChorusClick
          end
          object chEcho: TCheckBox
            Left = 106
            Top = 16
            Width = 90
            Height = 17
            Cursor = crHandPoint
            Caption = 'Echo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = chEchoClick
          end
          object chFlange: TCheckBox
            Left = 10
            Top = 16
            Width = 90
            Height = 17
            Cursor = crHandPoint
            Caption = 'Flange'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = chFlangeClick
          end
          object chReverb: TCheckBox
            Left = 106
            Top = 35
            Width = 90
            Height = 17
            Cursor = crHandPoint
            Caption = 'Reverberate'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnClick = chReverbClick
          end
          object RotateEF: TCheckBox
            Left = 210
            Top = 16
            Width = 90
            Height = 17
            Cursor = crHandPoint
            Caption = 'Rotate'
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = RotateEFClick
          end
        end
        object GroupBoxVolume: TGroupBox
          Left = 0
          Top = 0
          Width = 333
          Height = 60
          Align = alTop
          Caption = #1043#1088#1086#1084#1082#1086#1089#1090#1100
          TabOrder = 3
          object RadioButton_Player: TRadioButton
            Left = 10
            Top = 16
            Width = 143
            Height = 17
            Cursor = crHandPoint
            Caption = #1042#1089#1090#1088#1086#1077#1085#1085#1099#1081' '#1088#1077#1075#1091#1083#1103#1090#1086#1088
            Checked = True
            TabOrder = 0
            TabStop = True
            OnClick = RadioButton_PlayerClick
          end
          object RadioButton_System: TRadioButton
            Left = 10
            Top = 35
            Width = 146
            Height = 17
            Cursor = crHandPoint
            Caption = #1057#1080#1089#1090#1077#1084#1085#1099#1081' '#1088#1077#1075#1091#1083#1103#1090#1086#1088
            TabOrder = 1
            OnClick = RadioButton_SystemClick
          end
        end
      end
      object PageHotKeys: TTabSheet
        Caption = '4'
        ImageIndex = -1
        object GroupBoxHOTKeys: TGroupBox
          Left = 0
          Top = 0
          Width = 333
          Height = 338
          Align = alClient
          Caption = #1043#1086#1088#1103#1095#1080#1077' '#1082#1083#1072#1074#1080#1096#1080
          TabOrder = 0
          ExplicitHeight = 334
          object HotKey_Start: THotKey
            Left = 10
            Top = 70
            Width = 95
            Height = 21
            Cursor = crHandPoint
            Hint = #1057#1090#1072#1088#1090'/'#1055#1072#1091#1079#1072
            HotKey = 32
            Modifiers = []
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            OnChange = HotKey_StartChange
          end
          object HotKey_Prev: THotKey
            Left = 10
            Top = 45
            Width = 95
            Height = 21
            Cursor = crHandPoint
            Hint = #1055#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1092#1072#1081#1083
            HotKey = 112
            Modifiers = []
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnChange = HotKey_PrevChange
          end
          object HotKey_Next: THotKey
            Left = 10
            Top = 20
            Width = 95
            Height = 21
            Cursor = crHandPoint
            Hint = #1057#1083#1077#1076#1091#1102#1097#1080#1081' '#1092#1072#1081#1083
            HotKey = 113
            Modifiers = []
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnChange = HotKey_NextChange
          end
          object HotKey_Option: THotKey
            Left = 10
            Top = 145
            Width = 95
            Height = 21
            Cursor = crHandPoint
            Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1080
            HotKey = 16464
            Modifiers = [hkCtrl]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 15
            OnChange = HotKey_OptionChange
          end
          object HotKey_Play: THotKey
            Left = 10
            Top = 120
            Width = 95
            Height = 21
            Cursor = crHandPoint
            Hint = #1042#1086#1089#1087#1088#1086#1080#1079#1074#1077#1076#1077#1085#1080#1077
            HotKey = 13
            Modifiers = []
            ParentShowHint = False
            ShowHint = True
            TabOrder = 12
            OnChange = HotKey_PlayChange
          end
          object HotKey_FileInfo: THotKey
            Left = 10
            Top = 95
            Width = 95
            Height = 21
            Cursor = crHandPoint
            Hint = #1056#1077#1076#1072#1082#1090#1086#1088' '#1090#1077#1075#1086#1074
            HotKey = 115
            Modifiers = []
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            OnChange = HotKey_FileInfoChange
          end
          object Button_Reset2: TButton
            Left = 214
            Top = 230
            Width = 95
            Height = 25
            Cursor = crHandPoint
            Hint = #1059#1089#1090#1072#1085#1086#1074#1082#1072' '#1075#1086#1088#1103#1095#1080#1093' '#1082#1083#1072#1074#1080#1096' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
            Caption = #1057#1073#1088#1086#1089
            ParentShowHint = False
            ShowHint = True
            TabOrder = 22
            OnClick = Button_Reset2Click
          end
          object HotKey_AddPL: THotKey
            Left = 112
            Top = 20
            Width = 95
            Height = 21
            Cursor = crHandPoint
            Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1083#1077#1081#1083#1080#1089#1090
            HotKey = 16452
            Modifiers = [hkCtrl]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnChange = HotKey_AddPLChange
          end
          object HotKey_OpenPL: THotKey
            Left = 112
            Top = 45
            Width = 95
            Height = 21
            Cursor = crHandPoint
            Hint = #1054#1090#1082#1088#1099#1090#1100' '#1087#1083#1077#1081#1083#1080#1089#1090
            HotKey = 16463
            Modifiers = [hkCtrl]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnChange = HotKey_OpenPLChange
          end
          object HotKey_SavePL: THotKey
            Left = 112
            Top = 70
            Width = 95
            Height = 21
            Cursor = crHandPoint
            Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1083#1077#1081#1083#1080#1089#1090
            HotKey = 16467
            Modifiers = [hkCtrl]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            OnChange = HotKey_SavePLChange
          end
          object HotKey_ClearSpisok: THotKey
            Left = 112
            Top = 95
            Width = 95
            Height = 21
            Cursor = crHandPoint
            Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1089#1087#1080#1089#1086#1082
            HotKey = 8259
            Modifiers = [hkShift]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 10
            OnChange = HotKey_ClearSpisokChange
          end
          object HotKey_ClearHistory: THotKey
            Left = 112
            Top = 120
            Width = 95
            Height = 21
            Cursor = crHandPoint
            Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1080#1089#1090#1086#1088#1080#1102
            HotKey = 8264
            Modifiers = [hkShift]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 13
            OnChange = HotKey_ClearHistoryChange
          end
          object HotKey_DelFile: THotKey
            Left = 214
            Top = 20
            Width = 95
            Height = 21
            Cursor = crHandPoint
            Hint = #1059#1076#1072#1083#1080#1090#1100' '#1092#1072#1081#1083' '#1089' '#1076#1080#1089#1082#1072
            HotKey = 8238
            InvalidKeys = [hcNone, hcCtrl, hcAlt, hcShiftCtrl, hcShiftAlt, hcCtrlAlt, hcShiftCtrlAlt]
            Modifiers = [hkShift, hkExt]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnChange = HotKey_DelFileChange
          end
          object HotKey_NonEx: THotKey
            Left = 214
            Top = 70
            Width = 95
            Height = 21
            Cursor = crHandPoint
            Hint = #1059#1076#1072#1083#1080#1090#1100' '#1085#1077#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1080#1077
            HotKey = 8261
            Modifiers = [hkShift]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
            OnChange = HotKey_NonExChange
          end
          object HotKey_DuplFile: THotKey
            Left = 214
            Top = 95
            Width = 95
            Height = 21
            Cursor = crHandPoint
            Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1091#1073#1083#1080#1082#1072#1090#1099
            HotKey = 8274
            Modifiers = [hkShift]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 11
            OnChange = HotKey_DuplFileChange
          end
          object HotKey_BrowseFile: THotKey
            Left = 214
            Top = 120
            Width = 95
            Height = 21
            Cursor = crHandPoint
            Hint = #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077' '#1092#1072#1081#1083#1072
            HotKey = 32847
            ParentShowHint = False
            ShowHint = True
            TabOrder = 14
            OnChange = HotKey_BrowseFileChange
          end
          object HotKey_AddFile: THotKey
            Left = 214
            Top = 145
            Width = 95
            Height = 21
            Cursor = crHandPoint
            Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1072#1081#1083#1099
            HotKey = 8268
            Modifiers = [hkShift]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 16
            OnChange = HotKey_AddFileChange
          end
          object HotKey_AddFolder: THotKey
            Left = 214
            Top = 170
            Width = 95
            Height = 21
            Cursor = crHandPoint
            Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1072#1087#1082#1091
            HotKey = 16460
            Modifiers = [hkCtrl]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 18
            OnChange = HotKey_AddFolderChange
          end
          object HotKey_AddURL: THotKey
            Left = 214
            Top = 195
            Width = 95
            Height = 21
            Cursor = crHandPoint
            Hint = #1044#1086#1073#1072#1074#1080#1090#1100' URL'
            HotKey = 16469
            Modifiers = [hkCtrl]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 20
            OnChange = HotKey_AddURLChange
          end
          object HotKey_DelFilePL: THotKey
            Left = 214
            Top = 45
            Width = 95
            Height = 21
            Cursor = crHandPoint
            Hint = #1059#1076#1072#1083#1080#1090#1100' '#1092#1072#1081#1083' '#1080#1079' '#1089#1087#1080#1089#1082#1072
            HotKey = 46
            InvalidKeys = [hcNone, hcCtrl, hcAlt, hcShiftCtrl, hcShiftAlt, hcCtrlAlt, hcShiftCtrlAlt]
            Modifiers = []
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            OnChange = HotKey_DelFilePLChange
          end
          object HotKey_Sound: THotKey
            Left = 10
            Top = 170
            Width = 95
            Height = 21
            Cursor = crHandPoint
            Hint = #1047#1074#1091#1082' ('#1042#1082#1083'/'#1074#1099#1082#1083')'
            Enabled = False
            HotKey = 0
            Modifiers = []
            ParentShowHint = False
            ShowHint = True
            TabOrder = 17
          end
          object HotKey_Repeat: THotKey
            Left = 10
            Top = 195
            Width = 95
            Height = 21
            Cursor = crHandPoint
            Hint = #1055#1086#1074#1090#1086#1088' ('#1042#1082#1083'/'#1074#1099#1082#1083')'
            Enabled = False
            HotKey = 0
            Modifiers = []
            ParentShowHint = False
            ShowHint = True
            TabOrder = 19
          end
          object HotKey_Random: THotKey
            Left = 10
            Top = 220
            Width = 95
            Height = 21
            Cursor = crHandPoint
            Hint = #1057#1083#1091#1095#1072#1081#1085#1099#1081' '#1087#1086#1088#1103#1076#1086#1082' ('#1042#1082#1083'/'#1074#1099#1082#1083')'
            Enabled = False
            HotKey = 0
            Modifiers = []
            ParentShowHint = False
            ShowHint = True
            TabOrder = 21
          end
        end
      end
      object PagePlugin: TTabSheet
        Caption = '5'
        ImageIndex = 10
        object StringGridPlug: TStringGrid
          Left = 0
          Top = 0
          Width = 333
          Height = 338
          Align = alClient
          BorderStyle = bsNone
          ColCount = 4
          DefaultColWidth = 40
          DefaultRowHeight = 17
          DoubleBuffered = True
          FixedCols = 0
          RowCount = 1
          FixedRows = 0
          Options = [goVertLine, goHorzLine, goRangeSelect, goEditing, goRowSelect, goThumbTracking]
          ParentDoubleBuffered = False
          ScrollBars = ssVertical
          TabOrder = 0
          ExplicitHeight = 334
        end
      end
    end
  end
end
