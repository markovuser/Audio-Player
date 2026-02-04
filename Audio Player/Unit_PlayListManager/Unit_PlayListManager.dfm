object Form9: TForm9
  Left = 0
  Top = 0
  Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1087#1083#1077#1081#1083#1080#1089#1090#1072#1084#1080
  ClientHeight = 361
  ClientWidth = 434
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 450
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poDesktopCenter
  ScreenSnap = True
  OnShow = FormShow
  TextHeight = 15
  object ListViewPLManager: TListView
    Left = 0
    Top = 0
    Width = 434
    Height = 326
    Align = alClient
    Columns = <
      item
        Caption = #1048#1084#1103
        MinWidth = 150
        Width = 150
      end
      item
        Alignment = taRightJustify
        Caption = #1056#1072#1079#1084#1077#1088
        MaxWidth = 70
        Width = 70
      end
      item
        Caption = #1044#1072#1090#1072
        MinWidth = 120
        Width = 120
      end
      item
        AutoSize = True
        Caption = #1060#1072#1081#1083
        MinWidth = 100
      end>
    ReadOnly = True
    RowSelect = True
    PopupMenu = PopupMenuPLManager
    TabOrder = 0
    ViewStyle = vsReport
  end
  object TabControlButtons: TTabControl
    Left = 0
    Top = 326
    Width = 434
    Height = 35
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 4
      Top = 6
      Width = 426
      Height = 25
      Cursor = crHandPoint
      Align = alClient
      Caption = '&Ok'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object PopupMenuPLManager: TPopupMenu
    Images = Form1.ImageList_Menu
    Left = 273
    Top = 200
    object MenuPLUpdate: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 30
      ShortCut = 116
      OnClick = MenuPLUpdateClick
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object MenuPLSave: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ShortCut = 16467
      OnClick = MenuPLSaveClick
    end
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object MenuPLDelAll: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1089#1077
      ImageIndex = 23
      ShortCut = 8238
      OnClick = MenuPLDelAllClick
    end
    object MenuPLDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ShortCut = 46
      OnClick = MenuPLDelClick
    end
  end
end
