object Form4: TForm4
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1086#1073#1083#1086#1078#1082#1080
  ClientHeight = 491
  ClientWidth = 604
  Color = clBtnFace
  Constraints.MinHeight = 530
  Constraints.MinWidth = 620
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  ScreenSnap = True
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 13
  object TabControlButtons: TTabControl
    Left = 0
    Top = 456
    Width = 604
    Height = 35
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      604
      35)
    object ButtonEdit: TButton
      Left = 304
      Top = 6
      Width = 95
      Height = 25
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = #1054#1073#1088#1077#1079#1072#1090#1100
      Font.Charset = OEM_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = ButtonEditClick
    end
    object ButtonSave: TButton
      Left = 404
      Top = 6
      Width = 95
      Height = 25
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Font.Charset = OEM_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = ButtonSaveClick
    end
    object WidthImage: TNumberBox
      Left = 6
      Top = 8
      Width = 65
      Height = 21
      Alignment = taCenter
      ReadOnly = True
      TabOrder = 3
    end
    object HeightImage: TNumberBox
      Left = 77
      Top = 8
      Width = 65
      Height = 21
      Alignment = taCenter
      ReadOnly = True
      TabOrder = 4
    end
    object ButtonClose: TButton
      Left = 505
      Top = 6
      Width = 95
      Height = 25
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Font.Charset = OEM_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = ButtonCloseClick
    end
  end
  object TabControlBody: TTabControl
    Left = 0
    Top = 0
    Width = 604
    Height = 456
    Align = alClient
    TabOrder = 0
    object ImageTagEditor: TImage
      Left = 4
      Top = 6
      Width = 596
      Height = 446
      Align = alClient
      Center = True
      Proportional = True
      Stretch = True
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 105
      ExplicitHeight = 105
    end
  end
end
