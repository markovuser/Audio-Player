object Form6: TForm6
  Left = 312
  Top = 167
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' URL'
  ClientHeight = 151
  ClientWidth = 379
  Color = clBtnFace
  Constraints.MinHeight = 190
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 13
  object TabControlBody: TTabControl
    Left = 0
    Top = 0
    Width = 379
    Height = 116
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitTop = 60
    ExplicitHeight = 131
    object Label1: TLabel
      Left = 10
      Top = 10
      Width = 55
      Height = 13
      AutoSize = False
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 10
      Top = 60
      Width = 55
      Height = 13
      AutoSize = False
      Caption = 'URL:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object EditURLPath: TEdit
      Left = 10
      Top = 75
      Width = 360
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TextHint = 'URL-'#1040#1076#1088#1077#1089' '#1089#1089#1099#1083#1082#1080
    end
    object EditURLTitle: TEdit
      Left = 10
      Top = 25
      Width = 360
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TextHint = #1053#1072#1079#1074#1072#1085#1080#1077
    end
  end
  object TabControlButtons: TTabControl
    Left = 0
    Top = 116
    Width = 379
    Height = 35
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 191
    object ButtonEditURL: TButton
      Left = 4
      Top = 6
      Width = 371
      Height = 25
      Cursor = crHandPoint
      Align = alClient
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Font.Charset = OEM_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Visible = False
      OnClick = ButtonEditURLClick
    end
    object ButtonAddURL: TButton
      Left = 4
      Top = 6
      Width = 371
      Height = 25
      Cursor = crHandPoint
      Align = alClient
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Font.Charset = OEM_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = ButtonAddURLClick
    end
  end
end
