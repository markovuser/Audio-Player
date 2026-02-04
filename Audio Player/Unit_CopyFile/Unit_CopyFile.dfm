object Form5: TForm5
  Left = 374
  Top = 223
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1092#1072#1081#1083#1072
  ClientHeight = 231
  ClientWidth = 379
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 395
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
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 13
  object TabControlButtons: TTabControl
    Left = 0
    Top = 196
    Width = 379
    Height = 35
    Align = alBottom
    TabOrder = 1
    object ButtonCopyFile: TButton
      Left = 4
      Top = 6
      Width = 371
      Height = 25
      Cursor = crHandPoint
      Align = alClient
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      Font.Charset = OEM_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = ButtonCopyFileClick
    end
  end
  object TabControlBody: TTabControl
    Left = 0
    Top = 0
    Width = 379
    Height = 196
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 10
      Width = 40
      Height = 13
      AutoSize = False
      Caption = #1060#1072#1081#1083':'
    end
    object Label2: TLabel
      Left = 10
      Top = 60
      Width = 40
      Height = 13
      AutoSize = False
      Caption = #1055#1072#1087#1082#1072':'
    end
    object CheckBoxClearPathCopy: TCheckBox
      Left = 10
      Top = 102
      Width = 225
      Height = 17
      Cursor = crHandPoint
      Caption = #1057#1090#1080#1088#1072#1090#1100' '#1087#1091#1090#1100' '#1082' '#1087#1072#1087#1082#1077' '#1087#1088#1080' '#1079#1072#1074#1077#1088#1096#1077#1085#1080#1080
      TabOrder = 2
    end
    object EditFilePath: TEdit
      Left = 10
      Top = 25
      Width = 360
      Height = 21
      Color = clBtnFace
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 0
    end
    object EditFolderPath: TEdit
      Left = 10
      Top = 75
      Width = 360
      Height = 21
      Cursor = crHandPoint
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      TextHint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1072#1087#1082#1091' '#1076#1083#1103' '#1082#1086#1087#1080#1088#1086#1074#1072#1085#1080#1103
      OnClick = EditFolderPathClick
      OnKeyPress = EditFolderPathKeyPress
    end
    object CheckBoxCloseFormCopy: TCheckBox
      Left = 10
      Top = 125
      Width = 225
      Height = 17
      Cursor = crHandPoint
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086' '#1087#1088#1080' '#1079#1072#1074#1077#1088#1096#1077#1085#1080#1080
      TabOrder = 3
    end
    object TabControl4: TTabControl
      Left = 4
      Top = 153
      Width = 371
      Height = 22
      Align = alBottom
      TabOrder = 4
      object LabelSizeCopy: TLabel
        Left = 163
        Top = 5
        Width = 56
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1056#1072#1079#1084#1077#1088':'
      end
      object LabelProcessCopy: TLabel
        Left = 44
        Top = 5
        Width = 55
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1055#1088#1086#1094#1077#1089#1089':'
      end
      object LabelSizeCopy1: TLabel
        Left = 225
        Top = 5
        Width = 52
        Height = 13
        AutoSize = False
        Caption = '0'
      end
      object LabelProcessCopy1: TLabel
        Left = 105
        Top = 5
        Width = 52
        Height = 13
        AutoSize = False
        Caption = '0'
      end
    end
    object ProgressBarCopy: TProgressBar
      Left = 4
      Top = 175
      Width = 371
      Height = 17
      Align = alBottom
      TabOrder = 5
      StyleName = 'Luna'
    end
  end
end
