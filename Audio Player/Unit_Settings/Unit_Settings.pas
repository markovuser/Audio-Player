Unit Unit_Settings;

Interface

Uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, IniFiles, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.StdCtrls, Bass, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Buttons, Menus, Vcl.Samples.Spin, MMDeviceAPI, ActiveX, System.ImageList,
  Vcl.ImgList, Shellapi, uSpectrum, FreeImageLoader, Vcl.CategoryButtons,
  Translation, WindowsDarkMode, System.Win.TaskbarCore, Vcl.Grids, Registry,
  ShlObj, CustomTrackBar,FileInfoUtils;

Type
  TWmMoving = Record
    Msg: Cardinal;
    fwSide: Cardinal;
    lpRect: PRect;
    Result: Integer;
  End;

Const
  EQCenter: Array[0..9] Of Integer = (80, 170, 310, 600, 1000, 3000, 6000, 10000, 12000, 16000);
  //EQGainBass: Array[0..2] Of Integer = (3, 2, 1);
 // EQGainBass: Array[0..2] Of Integer = (6, 5, 4);
  EQGainBass: Array[0..2] Of Integer = (4, 3, 2);

Type
  TEQArray = Array[0..9] Of-15..15;

Const
  EQGainDefault: TEQArray = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  EQGainFULLBT: TEQArray = (7, 8, 5, -6, -2, -1, 4, 6, 8, 9);
  EQGainRock: TEQArray = (0, 3, 3, 3, 2, 1, 4, 7, 7, 8);
  EQGainRap: TEQArray = (-2, 0, 1, 7, -2, -2, 0, 0, 7, 9);
  EQGainGrunge: TEQArray = (-5, 0, 0, -2, 0, 0, 2, 3, 0, -3);
  EQGainMetal: TEQArray = (-5, 0, 0, 0, 0, 0, 3, 0, 3, 2);
  EQGainTechno: TEQArray = (-7, 2, 4, -2, -2, -3, 0, 0, 5, 5);
  EQGainPop: TEQArray = (-1, 4, 5, 2, -1, -2, 0, 0, 4, 4);
  EQGainClassic: TEQArray = (0, 0, 0, 4, 5, 3, 7, 3, 0, 0);
  EQGainVoice: TEQArray = (-8, -6, -4, 1, 0, 0, 0, -4, -6, -8);
  EQGainJazz: TEQArray = (-2, 0, 2, 4, 2, 0, 2, 4, 5, 3);
  EQGainAcoustic: TEQArray = (0, 1, 3, 4, 2, 1, 2, 3, 5, 4);
  EQGainBassBoost: TEQArray = (8, 9, 5, 2, 0, -2, -3, -4, -4, -4);
  EQGainDetail: TEQArray = (-6, -4, -2, 0, 0, 0, 1, 3, 6, 8);
  EQGainSmallSpeakers: TEQArray = (6, 7, 4, 2, 0, 0, 1, 3, 5, 7);
  EQGainDance: TEQArray = (5, 6, 3, 0, -1, -1, 1, 3, 5, 6);
  EQGainHipHopOld: TEQArray = (8, 7, 2, 3, 1, -1, 0, 1, 4, 5);
  EQGainBlues: TEQArray = (1, 2, 3, 4, 3, 1, 2, 2, 3, 2);
  EQGainReggae: TEQArray = (6, 5, 2, 1, -1, -3, -1, 1, 3, 4);
  EQGainCinema: TEQArray = (-4, -2, 0, 2, 3, 4, 5, 4, 3, 2);

Type
  TSNDEffects = Set Of (seFlange, seChorus, seEcho, seReverb, seBass, seEqualizer);

Var
  FlangeHandle, ChorusHandle, EchoHandle, ReverbHandle: HFX;
  EQHandle: Array[0..9] Of HFX;
  FlangeParam: BASS_DX8_FLANGER;
  ChorusParam: BASS_DX8_CHORUS;
  EchoParam: BASS_DX8_ECHO;
  ReverbParam: BASS_DX8_REVERB;
  EQParam: BASS_DX8_PARAMEQ;
  SNDEffects: TSNDEffects;
  EQGainCurrent: Array[0..9] Of-15..15;
  FX: HFX; // handle добавляемого эффекта

Type
  TMyControl = Class(TControl);

Type
  TForm2 = Class(TForm)
    TabControlButtons: TTabControl;
    ButtonCancelSettings: TButton;
    ButtonOKSettings: TButton;
    TabControlBodyLeft: TTabControl;
    TreeViewMenu: TTreeView;
    LabelInfo: TLabel;
    TabControlBody: TTabControl;
    PageControlOptions: TPageControl;
    PageGeneral: TTabSheet;
    GroupBoxBasic: TGroupBox;
    ProgressBox: TCheckBox;
    TaskTrackGo: TCheckBox;
    ShowCoverArts: TCheckBox;
    CheckBox_ShowPL: TCheckBox;
    CheckBox_LinesPL: TCheckBox;
    GroupBoxWindowsPosition: TGroupBox;
    PlayerWindowCenter: TCheckBox;
    PageEQ: TTabSheet;
    GroupBoxEqualizerON: TGroupBox;
    boxEQSelect: TComboBox;
    chEqualizer: TCheckBox;
    GroupBoxEqualizer: TGroupBox;
    Label80Hz: TLabel;
    Label170Hz: TLabel;
    Label310Hz: TLabel;
    Label600Hz: TLabel;
    Label1000Hz: TLabel;
    Label3000Hz: TLabel;
    Label6000Hz: TLabel;
    Label10000Hz: TLabel;
    Label12000Hz: TLabel;
    Label16000Hz: TLabel;
    TrackBar6000Hz: TTrackBar;
    TrackBar10000Hz: TTrackBar;
    TrackBar12000Hz: TTrackBar;
    TrackBar16000Hz: TTrackBar;
    TrackBar80Hz: TTrackBar;
    TrackBar170Hz: TTrackBar;
    TrackBar310Hz: TTrackBar;
    TrackBar600Hz: TTrackBar;
    TrackBar1000Hz: TTrackBar;
    TrackBar3000Hz: TTrackBar;
    GroupBoxSoundEffects: TGroupBox;
    BassEF: TCheckBox;
    chChorus: TCheckBox;
    chEcho: TCheckBox;
    chFlange: TCheckBox;
    chReverb: TCheckBox;
    RotateEF: TCheckBox;
    PageHotKeys: TTabSheet;
    GroupBoxHOTKeys: TGroupBox;
    HotKey_Start: THotKey;
    HotKey_Prev: THotKey;
    HotKey_Next: THotKey;
    HotKey_Option: THotKey;
    HotKey_Play: THotKey;
    HotKey_FileInfo: THotKey;
    Button_Reset2: TButton;
    HotKey_AddPL: THotKey;
    HotKey_OpenPL: THotKey;
    HotKey_SavePL: THotKey;
    HotKey_ClearSpisok: THotKey;
    HotKey_ClearHistory: THotKey;
    HotKey_DelFile: THotKey;
    HotKey_NonEx: THotKey;
    HotKey_DuplFile: THotKey;
    HotKey_BrowseFile: THotKey;
    HotKey_AddFile: THotKey;
    HotKey_AddFolder: THotKey;
    HotKey_AddURL: THotKey;
    HotKey_DelFilePL: THotKey;
    HotKey_Sound: THotKey;
    HotKey_Repeat: THotKey;
    HotKey_Random: THotKey;
    PagePlugin: TTabSheet;
    StringGridPlug: TStringGrid;
    GroupBoxIntegration: TGroupBox;
    CheckBoxFolderMenu: TCheckBox;
    GroupBox1: TGroupBox;
    AutoNext: TCheckBox;
    RandomTrack: TCheckBox;
    RepeatSong: TCheckBox;
    GroupBoxVolume: TGroupBox;
    RadioButton_Player: TRadioButton;
    RadioButton_System: TRadioButton;
    GroupBoxTryNotification: TGroupBox;
    TrayIcon: TCheckBox;
    TrayIconMinimize: TCheckBox;
    BaloonWindow: TCheckBox;
    CheckBoxColorTrayIcon: TCheckBox;
    Procedure chEqualizerClick(Sender: TObject);
    Procedure boxEQSelectChange(Sender: TObject);
    Procedure chEchoClick(Sender: TObject);
    Procedure chChorusClick(Sender: TObject);
    Procedure chReverbClick(Sender: TObject);
    Procedure chFlangeClick(Sender: TObject);
    Procedure BassEFClick(Sender: TObject);
    Procedure RotateEFClick(Sender: TObject);
    Procedure TrackBar16000HzChange(Sender: TObject);
    Procedure HotKey_FileInfoChange(Sender: TObject);
    Procedure Button_Reset2Click(Sender: TObject);
    Procedure TrackBar80HzChange(Sender: TObject);
    Procedure TrackBar170HzChange(Sender: TObject);
    Procedure TrackBar310HzChange(Sender: TObject);
    Procedure TrackBar600HzChange(Sender: TObject);
    Procedure TrackBar1000HzChange(Sender: TObject);
    Procedure TrackBar3000HzChange(Sender: TObject);
    Procedure TrackBar6000HzChange(Sender: TObject);
    Procedure TrackBar10000HzChange(Sender: TObject);
    Procedure TrackBar12000HzChange(Sender: TObject);
    Procedure RandomTrackClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure Error(Const ErrMsg: String);
    Procedure LoadNastr2;
    Procedure CheckAndSetRegistryForFileTypes;
    Procedure SaveNastr2;
    Procedure RegisterContextMenu;
    Procedure UnregisterContextMenu;
    Procedure ListFileDir(Path, Ext: String; aCombobox: TComboBox);
    Procedure DeleteEmptyPlugRow;
    Procedure Find_Plugins(Path, Ext: String);
    Procedure ButtonCancelSettingsClick(Sender: TObject);
    Procedure ProgressBoxClick(Sender: TObject);
    Procedure HotKey_NextChange(Sender: TObject);
    Procedure HotKey_PrevChange(Sender: TObject);
    Procedure HotKey_StartChange(Sender: TObject);
    Procedure ButtonOKSettingsClick(Sender: TObject);
    Procedure FormShow(Sender: TObject);
    Procedure ShowCoverArtsClick(Sender: TObject);
    Procedure TrayIconClick(Sender: TObject);
    Procedure TrayIconMinimizeClick(Sender: TObject);
    Procedure TreeViewMenuClick(Sender: TObject);
    Procedure HotKey_PlayChange(Sender: TObject);
    Procedure FormKeyPress(Sender: TObject; Var Key: Char);
    Procedure HotKey_OptionChange(Sender: TObject);
    Procedure HotKey_AddPLChange(Sender: TObject);
    Procedure HotKey_OpenPLChange(Sender: TObject);
    Procedure HotKey_SavePLChange(Sender: TObject);
    Procedure HotKey_DelFileChange(Sender: TObject);
    Procedure HotKey_NonExChange(Sender: TObject);
    Procedure HotKey_ClearSpisokChange(Sender: TObject);
    Procedure HotKey_DuplFileChange(Sender: TObject);
    Procedure HotKey_ClearHistoryChange(Sender: TObject);
    Procedure HotKey_BrowseFileChange(Sender: TObject);
    Procedure HotKey_AddFileChange(Sender: TObject);
    Procedure HotKey_AddFolderChange(Sender: TObject);
    Procedure HotKey_AddURLChange(Sender: TObject);
    Procedure RadioButton_SystemClick(Sender: TObject);
    Procedure RadioButton_PlayerClick(Sender: TObject);
    Procedure CheckBox_LinesPLClick(Sender: TObject);
    Procedure HotKey_DelFilePLChange(Sender: TObject);
    Procedure RepeatSongClick(Sender: TObject);
    Procedure CheckBox_ShowPLClick(Sender: TObject);
    Procedure PlayerWindowCenterClick(Sender: TObject);
    Procedure AutoNextClick(Sender: TObject);
    Procedure CheckBoxColorTrayIconClick(Sender: TObject);
    Procedure CheckBoxFolderMenuClick(Sender: TObject);
    Procedure BASS_RestoreSoundEffect;
    Procedure BASS_SetDefaultSoundEffect(Const SNDEffects: TSNDEffects);
    Procedure BASS_SetSoundEffects(Const Value: TSNDEffects);
    Procedure SetEQValues(EQArray: TEQArray);

  Protected
    Procedure CreateParams(Var Params: TCreateParams); Override;
  Private
    FPrevEmbedMenuState: Boolean;
  Public
    Property Font;
  End;

Var
  Form2: TForm2;
  i: Int64;
  OrigWidth: integer;

Implementation

Uses
  Unit_Base, Unit_CopyFile, Unit_TrayNotify;
{$R *.dfm}

Procedure TForm2.CreateParams(Var Params: TCreateParams);
Begin
  Inherited CreateParams(Params);
  Params.ExStyle := Params.ExStyle Or WS_EX_APPWINDOW;
  Params.WndParent := GetDesktopWindow;
End;

Procedure TForm2.BASS_RestoreSoundEffect;
Var
  i: Integer;
Begin
  If FlangeHandle <> 0 Then
    If BASS_ChannelRemoveFX(Channel, FlangeHandle) Then
      FlangeHandle := 0;
  If ChorusHandle <> 0 Then
    If BASS_ChannelRemoveFX(Channel, ChorusHandle) Then
      ChorusHandle := 0;
  If EchoHandle <> 0 Then
    If BASS_ChannelRemoveFX(Channel, EchoHandle) Then
      EchoHandle := 0;
  If ReverbHandle <> 0 Then
    If BASS_ChannelRemoveFX(Channel, ReverbHandle) Then
      ReverbHandle := 0;

  For i := 0 To (9) Do
  Begin
    If EQHandle[i] <> 0 Then
      If BASS_ChannelRemoveFX(Channel, EQHandle[i]) Then
        EQHandle[i] := 0;
  End;
End;

Procedure TForm2.BASS_SetSoundEffects(Const Value: TSNDEffects);
Var
  i: 0..9;
Begin
  BASS_RestoreSoundEffect;
  // ------------------------
  If seFlange In Value Then
  Begin
    If FlangeHandle = 0 Then
      FlangeHandle := BASS_ChannelSetFX(Channel, BASS_FX_DX8_FLANGER, 1);
    If FlangeHandle <> 0 Then
    Begin
      If BASS_FXGetParameters(FlangeHandle, @FlangeParam) Then
        BASS_FXSetParameters(FlangeHandle, @FlangeParam)
    End;
  End;
  // ------------------------
  If seChorus In Value Then
  Begin
    If ChorusHandle = 0 Then
      ChorusHandle := BASS_ChannelSetFX(Channel, BASS_FX_DX8_CHORUS, 1);
    If ChorusHandle <> 0 Then
    Begin
      If BASS_FXGetParameters(ChorusHandle, @ChorusParam) Then
        BASS_FXSetParameters(ChorusHandle, @ChorusParam)
    End;
  End;
  // ------------------------
  If seEcho In Value Then
  Begin
    If EchoHandle = 0 Then
      EchoHandle := BASS_ChannelSetFX(Channel, BASS_FX_DX8_ECHO, 1);
    If EchoHandle <> 0 Then
    Begin
      If BASS_FXGetParameters(EchoHandle, @EchoParam) Then
        BASS_FXSetParameters(EchoHandle, @EchoParam)
    End;
  End;
  // ------------------------
  If seReverb In Value Then
  Begin
    If ReverbHandle = 0 Then
      ReverbHandle := BASS_ChannelSetFX(Channel, BASS_FX_DX8_REVERB, 1);
    If ReverbHandle <> 0 Then
    Begin
      If BASS_FXGetParameters(ReverbHandle, @ReverbParam) Then
        BASS_FXSetParameters(ReverbHandle, @ReverbParam)
    End;
  End;
  // ------------------------
  If seEqualizer In Value Then
  Begin
    For i := 0 To 9 Do
    Begin
      If EQHandle[i] = 0 Then
        EQHandle[i] := BASS_ChannelSetFX(Channel, BASS_FX_DX8_PARAMEQ, 1);
      EQParam.fCenter := EQCenter[i];
      If (seBass In Value) And (i <= 2) Then
        EQParam.fGain := EQGainBass[i]
      Else
        EQParam.fGain := EQGainCurrent[i];
      BASS_FXSetParameters(EQHandle[i], @EQParam);
    End;
  End
  Else
  Begin
    If seBass In Value Then
    Begin
      For i := 0 To 2 Do
      Begin
        If EQHandle[i] = 0 Then
          EQHandle[i] := BASS_ChannelSetFX(Channel, BASS_FX_DX8_PARAMEQ, 1);
        EQParam.fCenter := EQCenter[i];
        EQParam.fGain := EQGainBass[i];
        BASS_FXSetParameters(EQHandle[i], @EQParam);
      End;
    End;
  End;
End;

Procedure TForm2.AutoNextClick(Sender: TObject);
Begin
  // Form2.SaveNastr2;
  application.ProcessMessages;
End;

Procedure TForm2.BassEFClick(Sender: TObject);
Begin
  If BassEF.Checked Then
    Include(SNDEffects, seBass)
  Else
    Exclude(SNDEffects, seBass);
  BASS_SetSoundEffects(SNDEffects);
  application.ProcessMessages;
End;

Procedure TForm2.SetEQValues(EQArray: TEQArray);
Begin
  Form2.TrackBar80Hz.Position := -EQArray[0];
  Form2.TrackBar170Hz.Position := -EQArray[1];
  Form2.TrackBar310Hz.Position := -EQArray[2];
  Form2.TrackBar600Hz.Position := -EQArray[3];
  Form2.TrackBar1000Hz.Position := -EQArray[4];
  Form2.TrackBar3000Hz.Position := -EQArray[5];
  Form2.TrackBar6000Hz.Position := -EQArray[6];
  Form2.TrackBar10000Hz.Position := -EQArray[7];
  Form2.TrackBar12000Hz.Position := -EQArray[8];
  Form2.TrackBar16000Hz.Position := -EQArray[9];
  application.ProcessMessages;
End;

Procedure TForm2.ShowCoverArtsClick(Sender: TObject);
Begin
  If ShowCoverArts.Checked = true Then
  Begin
    form1.Constraints.MinHeight := 600;
    form1.ImageTAG.Picture := Nil;
    form1.ListCoverArts;
    form1.TabControlCoverArt.Visible := true;
    application.ProcessMessages;
  End;
  If Form2.ShowCoverArts.Checked = false Then
  Begin
    form1.Constraints.MinHeight := 330;
    form1.ImageTAG.Picture := Nil;
    form1.TabControlCoverArt.Visible := false;
    application.ProcessMessages;
  End;
End;

Procedure TForm2.boxEQSelectChange(Sender: TObject);
Var
  i: Integer;
Begin
  CHANGE_PRESET := true;
  Case boxEQSelect.ItemIndex Of
    0, 20: // Default и Custom (последний индекс)
      Begin
        For i := 0 To 9 Do
          EQGainCurrent[i] := EQGainDefault[i];
        SetEQValues(EQGainDefault);
      End;
    1:
      Begin
        For i := 0 To 9 Do
          EQGainCurrent[i] := EQGainFULLBT[i];
        SetEQValues(EQGainFULLBT);
      End;
    2:
      Begin
        For i := 0 To 9 Do
          EQGainCurrent[i] := EQGainRock[i];
        SetEQValues(EQGainRock);
      End;
    3:
      Begin
        For i := 0 To 9 Do
          EQGainCurrent[i] := EQGainRap[i];
        SetEQValues(EQGainRap);
      End;
    4:
      Begin
        For i := 0 To 9 Do
          EQGainCurrent[i] := EQGainGrunge[i];
        SetEQValues(EQGainGrunge);
      End;
    5:
      Begin
        For i := 0 To 9 Do
          EQGainCurrent[i] := EQGainMetal[i];
        SetEQValues(EQGainMetal);
      End;
    6:
      Begin
        For i := 0 To 9 Do
          EQGainCurrent[i] := EQGainTechno[i];
        SetEQValues(EQGainTechno);
      End;
    7:
      Begin
        For i := 0 To 9 Do
          EQGainCurrent[i] := EQGainPop[i];
        SetEQValues(EQGainPop);
      End;
    8:
      Begin
        For i := 0 To 9 Do
          EQGainCurrent[i] := EQGainClassic[i];
        SetEQValues(EQGainClassic);
      End;
    9:
      Begin
        For i := 0 To 9 Do
          EQGainCurrent[i] := EQGainVoice[i];
        SetEQValues(EQGainVoice);
      End;
    10:
      Begin
        For i := 0 To 9 Do
          EQGainCurrent[i] := EQGainJazz[i];
        SetEQValues(EQGainJazz);
      End;
    11:
      Begin
        For i := 0 To 9 Do
          EQGainCurrent[i] := EQGainAcoustic[i];
        SetEQValues(EQGainAcoustic);
      End;
    12:
      Begin
        For i := 0 To 9 Do
          EQGainCurrent[i] := EQGainBassBoost[i];
        SetEQValues(EQGainBassBoost);
      End;
    13:
      Begin
        For i := 0 To 9 Do
          EQGainCurrent[i] := EQGainDetail[i];
        SetEQValues(EQGainDetail);
      End;
    14:
      Begin
        For i := 0 To 9 Do
          EQGainCurrent[i] := EQGainSmallSpeakers[i];
        SetEQValues(EQGainSmallSpeakers);
      End;
    15:
      Begin
        For i := 0 To 9 Do
          EQGainCurrent[i] := EQGainDance[i];
        SetEQValues(EQGainDance);
      End;
    16:
      Begin
        For i := 0 To 9 Do
          EQGainCurrent[i] := EQGainHipHopOld[i];
        SetEQValues(EQGainHipHopOld);
      End;
    17:
      Begin
        For i := 0 To 9 Do
          EQGainCurrent[i] := EQGainBlues[i];
        SetEQValues(EQGainBlues);
      End;
    18:
      Begin
        For i := 0 To 9 Do
          EQGainCurrent[i] := EQGainReggae[i];
        SetEQValues(EQGainReggae);
      End;
    19:
      Begin
        For i := 0 To 9 Do
          EQGainCurrent[i] := EQGainCinema[i];
        SetEQValues(EQGainCinema);
      End;
    21: // BASS_RestoreSoundEffect теперь на 21 позиции
      Begin
        BASS_RestoreSoundEffect;
      End;
  End;
  CHANGE_PRESET := false;
  application.ProcessMessages;
End;

Procedure TForm2.Button_Reset2Click(Sender: TObject);
Begin
  HotKey_FileInfo.HotKey := VK_F4;
  HotKey_Next.HotKey := VK_F2;
  HotKey_Prev.HotKey := VK_F1;
  HotKey_Start.HotKey := VK_SPACE;
  HotKey_Play.HotKey := vk_return;
  HotKey_Option.HotKey := 16464;
  HotKey_AddPL.HotKey := 16452;
  HotKey_OpenPL.HotKey := 16463;
  HotKey_SavePL.HotKey := 16467;
  HotKey_ClearSpisok.HotKey := 8259;
  HotKey_ClearHistory.HotKey := 8264;
  HotKey_DelFile.HotKey := 8260;
  HotKey_NonEx.HotKey := 8261;
  HotKey_DuplFile.HotKey := 8274;
  HotKey_BrowseFile.HotKey := 32847;
  HotKey_AddFile.HotKey := 8268;
  HotKey_AddFolder.HotKey := 16460;
  HotKey_AddURL.HotKey := 16469;
  { HotKey_Sound.HotKey := 86;
    HotKey_Repeat.HotKey := 82;
    HotKey_Random.HotKey := 83; }
  // Form2.SaveNastr2;
  application.ProcessMessages;
End;

Procedure SetFontByComponent(comp: TComponent; Font: String);
Var
  i: Integer;
Begin
  For i := 0 To form1.ComponentCount - 1 Do
    If form1.Components[i].Name <> 'StatusBar2' Then
      If form1.Components[i] Is TControl Then
        (TMyControl(form1.Components[i])).Font.Name := Font;
End;

Procedure TForm2.ButtonCancelSettingsClick(Sender: TObject);
Begin
  Form2.Close;
  LoadNastr2;
  application.ProcessMessages;
End;

Procedure TForm2.ButtonOKSettingsClick(Sender: TObject);
Begin
  Form2.Close;
  application.ProcessMessages;
  Form2.SaveNastr2;
  form1.SaveNastr;
  application.ProcessMessages;
End;

Procedure TForm2.chChorusClick(Sender: TObject);
Begin
  If Form2.chChorus.Checked = true Then
  Begin
    Include(SNDEffects, seChorus);
    Form2.BASS_SetSoundEffects(SNDEffects);
    application.ProcessMessages;
  End;
  If Form2.chChorus.Checked = false Then
  Begin
    Exclude(SNDEffects, seChorus);
    Form2.BASS_SetSoundEffects(SNDEffects);
    application.ProcessMessages;
  End;
  // Form2.SaveNastr2;
  application.ProcessMessages;
End;

Procedure TForm2.chEchoClick(Sender: TObject);
Begin
  If chEcho.Checked = true Then
  Begin
    Include(SNDEffects, seEcho);
    BASS_SetSoundEffects(SNDEffects);
    application.ProcessMessages;
  End;
  If chEcho.Checked = false Then
  Begin
    Exclude(SNDEffects, seEcho);
    BASS_SetSoundEffects(SNDEffects);
    application.ProcessMessages;
  End;
  // Form2.SaveNastr2;
  application.ProcessMessages;
End;

Procedure TForm2.CheckBoxColorTrayIconClick(Sender: TObject);
Begin
  Try
    If Form2.CheckBoxColorTrayIcon.Checked = true Then
    Begin
      form1.TrayIcon1.IconIndex := 2;
      application.ProcessMessages;
    End;

    If Form2.CheckBoxColorTrayIcon.Checked = false Then
    Begin
      If AppsUseLightTheme = false Then
      Begin
        If SystemUsesLightTheme = false Then
          form1.TrayIcon1.IconIndex := 1;
        If SystemUsesLightTheme = true Then
          application.ProcessMessages;
      End;

      If AppsUseLightTheme = true Then
      Begin
        If SystemUsesLightTheme = true Then
          form1.TrayIcon1.IconIndex := 0;
        If SystemUsesLightTheme = false Then
          form1.TrayIcon1.IconIndex := 1;
        application.ProcessMessages;
      End;
    End;

  Except
  End;
  application.ProcessMessages;
End;

Procedure TForm2.RegisterContextMenu;
Var
  Reg: TRegistry;
Begin
  Reg := TRegistry.Create;
  Try
    Reg.RootKey := HKEY_CURRENT_USER;

    // Для папок текущий плейлист
    If Reg.OpenKey('Software\Classes\Directory\shell\AudioPlayer.Play', true) Then
    Begin
      Reg.WriteString('', form1.LangOpenInAudioPlayer.Caption);
      Reg.WriteString('Icon', ParamStr(0));
      Reg.CloseKey;

      If Reg.OpenKey('Software\Classes\Directory\shell\AudioPlayer.Play\command', true) Then
      Begin
        Reg.WriteString('', '"' + ParamStr(0) + '" "%1" /Open');
        Reg.CloseKey;
      End;
    End;
    // Для папок новый плейлист
    If Reg.OpenKey('Software\Classes\Directory\shell\AudioPlayer.Add', true) Then
    Begin
      Reg.WriteString('', form1.LangAddInAudioPlayer.Caption);
      Reg.WriteString('Icon', ParamStr(0));
      Reg.CloseKey;

      If Reg.OpenKey('Software\Classes\Directory\shell\AudioPlayer.Add\command', true) Then
      Begin
        Reg.WriteString('', '"' + ParamStr(0) + '" "%1" /Add');
        Reg.CloseKey;
      End;
    End;

  Finally
    Reg.Free;
  End;
End;

Procedure TForm2.UnregisterContextMenu;
Var
  Reg: TRegistry;
Begin
  Reg := TRegistry.Create;
  Try
    Reg.RootKey := HKEY_CURRENT_USER;

    Reg.DeleteKey('Software\Classes\Directory\shell\AudioPlayer.Play\command');
    Reg.DeleteKey('Software\Classes\Directory\shell\AudioPlayer.Play');

    Reg.DeleteKey('Software\Classes\Directory\shell\AudioPlayer.Add\command');
    Reg.DeleteKey('Software\Classes\Directory\shell\AudioPlayer.Add');
  Finally
    Reg.Free;
  End;
End;

Function IsRegistryKeyExists(): Boolean;
Var
  Reg: TRegistry;
Begin
  Reg := TRegistry.Create(KEY_QUERY_VALUE);
  Try
    Reg.RootKey := HKEY_CURRENT_USER;
    Result := Reg.KeyExists('Software\Classes\Directory\shell\AudioPlayer.Play');
  Finally
    FreeAndNil(Reg);
  End;
End;

Procedure TForm2.CheckBoxFolderMenuClick(Sender: TObject);
Begin
  If CheckBoxFolderMenu.Checked Then
  Begin
    RegisterContextMenu;
  End
  Else
  Begin
    UnregisterContextMenu;
  End;
  SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, Nil, Nil);
  FPrevEmbedMenuState := CheckBoxFolderMenu.Checked;
  application.ProcessMessages;
End;

Procedure TForm2.CheckBox_LinesPLClick(Sender: TObject);
Begin
  If CheckBox_LinesPL.Checked = true Then
  Begin
    form1.StringGrid1.GridLineWidth := 1;
  End;
  If CheckBox_LinesPL.Checked = false Then
  Begin
    form1.StringGrid1.GridLineWidth := 0;
  End;
  // Form2.SaveNastr2;
  application.ProcessMessages;
End;

Procedure TForm2.CheckBox_ShowPLClick(Sender: TObject);
Begin
  If Form2.CheckBox_ShowPL.Checked = false Then
  Begin
    //form1.TabPlayList.Width := 0;
    form1.Constraints.MinHeight := 600;
    form1.Constraints.MaxWidth := 240;
    form1.Constraints.MinWidth := 240;
    form1.Width := 240;
  End;
  If Form2.CheckBox_ShowPL.Checked = true Then
  Begin
    form1.Constraints.MinHeight := 600;
    form1.Constraints.MaxWidth := 0;
    form1.Constraints.MinWidth := 240;
    form1.Width := OrigWidth;
  End;

  application.ProcessMessages;
End;

Procedure TForm2.TrayIconClick(Sender: TObject);
Begin
  form1.TrayIcon1.Visible := TrayIcon.Checked;
  Form2.TrayIconMinimize.Enabled := TrayIcon.Checked;

  If Form2.TrayIcon.Checked = false Then
  Begin
    Form2.TrayIconMinimize.Checked := false;
  End;
  // Form2.SaveNastr2;
  application.ProcessMessages;
End;

Procedure TForm2.TrayIconMinimizeClick(Sender: TObject);
Begin
  // Form2.SaveNastr2;
  application.ProcessMessages;
End;

Procedure TForm2.chEqualizerClick(Sender: TObject);
Begin
  boxEQSelect.Enabled := chEqualizer.Checked;
  TrackBar80Hz.Enabled := chEqualizer.Checked;
  TrackBar170Hz.Enabled := chEqualizer.Checked;
  TrackBar310Hz.Enabled := chEqualizer.Checked;
  TrackBar600Hz.Enabled := chEqualizer.Checked;
  TrackBar1000Hz.Enabled := chEqualizer.Checked;
  TrackBar3000Hz.Enabled := chEqualizer.Checked;
  TrackBar6000Hz.Enabled := chEqualizer.Checked;
  TrackBar10000Hz.Enabled := chEqualizer.Checked;
  TrackBar12000Hz.Enabled := chEqualizer.Checked;
  TrackBar16000Hz.Enabled := chEqualizer.Checked;
  application.ProcessMessages;
  If chEqualizer.Checked = true Then
  Begin
    Include(SNDEffects, seEqualizer);
    application.ProcessMessages;
  End;
  If chEqualizer.Checked = false Then
  Begin
    Exclude(SNDEffects, seEqualizer);
    application.ProcessMessages;
  End;
  BASS_SetSoundEffects(SNDEffects);
  application.ProcessMessages;
End;

Procedure TForm2.chFlangeClick(Sender: TObject);
Begin
  If chFlange.Checked = true Then
  Begin
    Include(SNDEffects, seFlange);
    BASS_SetSoundEffects(SNDEffects);
    application.ProcessMessages;
  End;
  If chFlange.Checked = false Then
  Begin
    Exclude(SNDEffects, seFlange);
    BASS_SetSoundEffects(SNDEffects);
    application.ProcessMessages;
  End;
  // Form2.SaveNastr2;
  application.ProcessMessages;
End;

Procedure TForm2.chReverbClick(Sender: TObject);
Begin
  If chReverb.Checked = true Then
  Begin
    Include(SNDEffects, seReverb);
    BASS_SetSoundEffects(SNDEffects);
    application.ProcessMessages;
  End;
  If chReverb.Checked = false Then
  Begin
    Exclude(SNDEffects, seReverb);
    BASS_SetSoundEffects(SNDEffects);
    application.ProcessMessages;
  End;
  // Form2.SaveNastr2;
  application.ProcessMessages;
End;

Function ExtractOnlyFileName(Const FileName: String): String;
Begin
  Try
    Result := StringReplace(ExtractFileName(FileName), ExtractFileExt(FileName), '', []);
  Except
  End;
End;

Procedure TForm2.ListFileDir(Path, Ext: String; aCombobox: TComboBox);
Var
  SR: TSearchRec;
  Ini: TMemIniFile;
  LangName: String;
Begin
  If FindFirst(Path + Ext, faAnyFile, SR) = 0 Then
  Begin
    Repeat
      If (SR.Attr <> faDirectory) Then
      Begin
        Ini := TMemIniFile.Create(Path + SR.Name);
        LangName := Ini.ReadString('Language information', 'LANGNAME', '');
        // FormattedText :=Format('%-35s%s', [ '[ '+LangName+ ' ]',ExtractOnlyFileName(SR.Name)]) ;
        // aCombobox.Items.Add(FormattedText);
        aCombobox.Items.Add(ExtractOnlyFileName(SR.Name) + ' (' + LangName + ')');
        application.ProcessMessages;
        Ini.Free;
      End;
    Until FindNext(SR) <> 0;
    FindClose(SR);
    application.ProcessMessages;

  End;
End;

Procedure TForm2.Error(Const ErrMsg: String);
Begin
  MessageBox(Handle, pchar(ErrMsg), pchar(application.Title), MB_ICONWARNING Or MB_SYSTEMMODAL);
End;

Procedure TForm2.BASS_SetDefaultSoundEffect(Const SNDEffects: TSNDEffects);
Begin
  If seFlange In SNDEffects Then
  Begin
    With FlangeParam Do
    Begin
      fWetDryMix := 0;
      fDepth := 25;
      fFeedback := 0;
      fFrequency := 0;
      lWaveform := 1;
      fDelay := 0;
      lPhase := 0;
    End;
    application.ProcessMessages;
  End;

  If seChorus In SNDEffects Then
  Begin
    With ChorusParam Do
    Begin
      fWetDryMix := 0;
      fDepth := 25;
      fFeedback := 0;
      fFrequency := 0;
      lWaveform := 1;
      fDelay := 0;
      lPhase := 0;
    End;
    application.ProcessMessages;
  End;

  If seEcho In SNDEffects Then
  Begin
    With EchoParam Do
    Begin
      fWetDryMix := 0;
      fFeedback := 0;
      fLeftDelay := 333;
      fRightDelay := 333;
      lPanDelay := false;
    End;
    application.ProcessMessages;
  End;

  If seReverb In SNDEffects Then
  Begin
    With ReverbParam Do
    Begin
      fInGain := 0;
      fReverbMix := 0;
      fReverbTime := 1000;
      fHighFreqRTRatio := 0.001;
    End;
    application.ProcessMessages;
  End;

  If seEqualizer In SNDEffects Then
  Begin
    EQParam.fBandwidth := 2.5; // 2.5; // 5
    application.ProcessMessages;
  End;
End;

Procedure TForm2.CheckAndSetRegistryForFileTypes;
Var
  Reg: TRegistry;
Begin
  Reg := TRegistry.Create;
  Try
    Reg.RootKey := HKEY_CURRENT_USER;

    // Просто проверяем, существует ли ключ
    If Reg.KeyExists('Software\Classes\Directory\shell\AudioPlayer.Play') Then
    Begin
      CheckBoxFolderMenu.Checked := True;
      FPrevEmbedMenuState := True;
      FPrevEmbedMenuState := CheckBoxFolderMenu.Checked;
    End
    Else
    Begin
      CheckBoxFolderMenu.Checked := False;
      FPrevEmbedMenuState := False;
      FPrevEmbedMenuState := CheckBoxFolderMenu.Checked;
    End;
  Finally
    Reg.Free;
  End;
End;

Procedure TForm2.LoadNastr2;
Var
  Ini: TMemIniFile;
  i: Integer;
  Reg: TRegistry;
Begin
  Try
    CheckAndSetRegistryForFileTypes;
    Ini := TMemIniFile.Create(form1.PortablePath);
    // Основные
    CHANGE_PRESET := true;
    PlayerWindowCenter.Checked := Ini.ReadBool(option, PlayerWindowCenter.Name, false);
    If PlayerWindowCenter.Checked = true Then
    Begin
      PlayerWindowCenterClick(self);
      application.ProcessMessages;
    End;

    ProgressBox.Checked := Ini.ReadBool(option, ProgressBox.Name, false);
    RandomTrack.Checked := Ini.ReadBool(option, RandomTrack.Name, false);

    // TopTrackGo.Checked := Ini.ReadBool('option', TopTrackGo.Name, False);
    TaskTrackGo.Checked := Ini.ReadBool(option, TaskTrackGo.Name, false);
    AutoNext.Checked := Ini.ReadBool(option, AutoNext.Name, false);
    BaloonWindow.Checked := Ini.ReadBool(option, BaloonWindow.Name, false);
    TrayIcon.Checked := Ini.ReadBool(option, TrayIcon.Name, false);
    TrayIconMinimize.Checked := Ini.ReadBool(option, TrayIconMinimize.Name, false);

    CheckBox_LinesPL.Checked := Ini.ReadBool(option, CheckBox_LinesPL.Name, false);

    CheckBox_ShowPL.Checked := Ini.ReadBool(option, CheckBox_ShowPL.Name, false);
    If CheckBox_ShowPL.Checked = true Then
    Begin
      OrigWidth := Ini.ReadInteger(option, 'Width', Form1.Width);
    End;
    If CheckBox_ShowPL.Checked = false Then
    Begin
      OrigWidth := 600;
    End;

    CheckBoxColorTrayIcon.Checked := Ini.ReadBool(option, CheckBoxColorTrayIcon.Name, false);

    // обложка файла
    ShowCoverArts.Checked := Ini.ReadBool(option, ShowCoverArts.Name, false);

    application.ProcessMessages;
    // Звук
    RadioButton_Player.Checked := Ini.ReadBool(option, RadioButton_Player.Name, false);
    RadioButton_System.Checked := Ini.ReadBool(option, RadioButton_System.Name, false);
    application.ProcessMessages;

    // Эквалайзер

    chEqualizer.Checked := Ini.ReadBool(option, chEqualizer.Name, false);
    boxEQSelect.ItemIndex := Ini.ReadInteger(option, boxEQSelect.Name, boxEQSelect.ItemIndex);
    TrackBar80Hz.Position := Ini.ReadInteger(option, TrackBar80Hz.Name, TrackBar80Hz.Position);
    TrackBar170Hz.Position := Ini.ReadInteger(option, TrackBar170Hz.Name, TrackBar170Hz.Position);
    TrackBar310Hz.Position := Ini.ReadInteger(option, TrackBar310Hz.Name, TrackBar310Hz.Position);
    TrackBar600Hz.Position := Ini.ReadInteger(option, TrackBar600Hz.Name, TrackBar600Hz.Position);
    TrackBar1000Hz.Position := Ini.ReadInteger(option, TrackBar1000Hz.Name, TrackBar1000Hz.Position);
    TrackBar3000Hz.Position := Ini.ReadInteger(option, TrackBar3000Hz.Name, TrackBar3000Hz.Position);
    TrackBar6000Hz.Position := Ini.ReadInteger(option, TrackBar6000Hz.Name, TrackBar6000Hz.Position);
    TrackBar10000Hz.Position := Ini.ReadInteger(option, TrackBar10000Hz.Name, TrackBar10000Hz.Position);
    TrackBar12000Hz.Position := Ini.ReadInteger(option, TrackBar12000Hz.Name, TrackBar12000Hz.Position);
    TrackBar16000Hz.Position := Ini.ReadInteger(option, TrackBar16000Hz.Name, TrackBar16000Hz.Position);

    RepeatSong.Checked := Ini.ReadBool(option, RepeatSong.Name, false);

    application.ProcessMessages;
    chFlange.Checked := Ini.ReadBool(option, chFlange.Name, false);
    chChorus.Checked := Ini.ReadBool(option, chChorus.Name, false);
    chEcho.Checked := Ini.ReadBool(option, chEcho.Name, false);
    chReverb.Checked := Ini.ReadBool(option, chReverb.Name, false);
    BassEF.Checked := Ini.ReadBool(option, BassEF.Name, false);
    RotateEF.Checked := Ini.ReadBool(option, RotateEF.Name, false);

    chEqualizerClick(self);
    boxEQSelectChange(self);
    application.ProcessMessages;
    // общие     HotKey
    HotKey_Next.HotKey := Ini.ReadInteger(option, HotKey_Next.Name, HotKey_Next.HotKey);
    HotKey_NextChange(self);
    HotKey_Prev.HotKey := Ini.ReadInteger(option, HotKey_Prev.Name, HotKey_Prev.HotKey);
    HotKey_PrevChange(self);
    HotKey_Start.HotKey := Ini.ReadInteger(option, HotKey_Start.Name, HotKey_Start.HotKey);
    HotKey_StartChange(self);
    HotKey_FileInfo.HotKey := Ini.ReadInteger(option, HotKey_FileInfo.Name, HotKey_FileInfo.HotKey);
    HotKey_FileInfoChange(self);
    HotKey_Play.HotKey := Ini.ReadInteger(option, HotKey_Play.Name, HotKey_Play.HotKey);
    HotKey_PlayChange(self);
    HotKey_Option.HotKey := Ini.ReadInteger(option, HotKey_Option.Name, HotKey_Option.HotKey);
    HotKey_OptionChange(self);
    application.ProcessMessages;
    // Плейлист
    HotKey_AddPL.HotKey := Ini.ReadInteger(option, HotKey_AddPL.Name, HotKey_AddPL.HotKey);
    HotKey_AddPLChange(self);
    HotKey_OpenPL.HotKey := Ini.ReadInteger(option, HotKey_OpenPL.Name, HotKey_OpenPL.HotKey);
    HotKey_OpenPLChange(self);
    HotKey_SavePL.HotKey := Ini.ReadInteger(option, HotKey_SavePL.Name, HotKey_SavePL.HotKey);
    HotKey_SavePLChange(self);
    HotKey_ClearSpisok.HotKey := Ini.ReadInteger(option, HotKey_ClearSpisok.Name, HotKey_ClearSpisok.HotKey);
    HotKey_ClearSpisokChange(self);
    HotKey_ClearHistory.HotKey := Ini.ReadInteger(option, HotKey_ClearHistory.Name, HotKey_ClearHistory.HotKey);
    HotKey_ClearHistoryChange(self);
    application.ProcessMessages;
    // файлы
    HotKey_DelFile.HotKey := Ini.ReadInteger(option, HotKey_DelFile.Name, HotKey_DelFile.HotKey);
    HotKey_DelFileChange(self);
    HotKey_DelFilePL.HotKey := Ini.ReadInteger(option, HotKey_DelFilePL.Name, HotKey_DelFilePL.HotKey);
    HotKey_DelFilePLChange(self);
    HotKey_DuplFile.HotKey := Ini.ReadInteger(option, HotKey_DuplFile.Name, HotKey_DuplFile.HotKey);
    HotKey_DuplFileChange(self);
    HotKey_NonEx.HotKey := Ini.ReadInteger(option, HotKey_NonEx.Name, HotKey_NonEx.HotKey);
    HotKey_NonExChange(self);
    HotKey_BrowseFile.HotKey := Ini.ReadInteger(option, HotKey_BrowseFile.Name, HotKey_BrowseFile.HotKey);
    HotKey_BrowseFileChange(self);
    application.ProcessMessages;
    // **
    HotKey_AddFile.HotKey := Ini.ReadInteger(option, HotKey_AddFile.Name, HotKey_AddFile.HotKey);
    HotKey_AddFileChange(self);
    HotKey_AddFolder.HotKey := Ini.ReadInteger(option, HotKey_AddFolder.Name, HotKey_AddFolder.HotKey);
    HotKey_AddFolderChange(self);
    HotKey_AddURL.HotKey := Ini.ReadInteger(option, HotKey_AddURL.Name, HotKey_AddURL.HotKey);
    HotKey_AddURLChange(self);

    { HotKey_Sound.HotKey := Ini.ReadInteger('option', HotKey_Sound.Name,
      HotKey_Sound.HotKey);
      HotKey_SoundChange(self);
      HotKey_Repeat.HotKey := Ini.ReadInteger('option', HotKey_Repeat.Name,
      HotKey_Repeat.HotKey);
      HotKey_RepeatChange(self);
      HotKey_Random.HotKey := Ini.ReadInteger('option', HotKey_Random.Name,
      HotKey_Random.HotKey);
      HotKey_RandomChange(self); }

    // ***

    form1.Timer_TaskTrackGo.Enabled := false;

    Form5.CheckBoxClearPathCopy.Checked := Ini.ReadBool(option, Form5.CheckBoxClearPathCopy.Name, false);
    Form5.CheckBoxCloseFormCopy.Checked := Ini.ReadBool(option, Form5.CheckBoxCloseFormCopy.Name, false);

    application.ProcessMessages;
    RandomTrackClick(self);
    TrayIconClick(self);
    CheckBoxColorTrayIconClick(self);
    CheckBox_LinesPLClick(self);
    CheckBox_ShowPLClick(self);
    CheckBoxColorTrayIconClick(self);
    ShowCoverArtsClick(self);
    RepeatSongClick(self);

    If RadioButton_Player.Checked = true Then
    Begin
      RadioButton_PlayerClick(self);
    End;
    If RadioButton_System.Checked = true Then
    Begin
      RadioButton_SystemClick(self);
    End;
    Ini.Free;
  Except
  End;

End;

Procedure TForm2.PlayerWindowCenterClick(Sender: TObject);
Begin
  Try
    If PlayerWindowCenter.Checked = true Then
    Begin
      form1.Position := poDesktopCenter;
    End;
    If PlayerWindowCenter.Checked = false Then
    Begin
      form1.Position := poDesigned;
    End;
    // Form2.SaveNastr2;
    application.ProcessMessages;
  Except
  End;
End;

Procedure TForm2.ProgressBoxClick(Sender: TObject);
Begin
  If Form2.ProgressBox.Checked = true Then
  Begin
    form1.Taskbar1.ProgressState := TTaskBarProgressState.Normal;
    form1.Taskbar1.ProgressMaxValue := form1.barSeek.Max;
    form1.Taskbar1.ProgressValue := form1.barSeek.Position;
    application.ProcessMessages;
  End;
  If Form2.ProgressBox.Checked = false Then
  Begin
    form1.Taskbar1.ProgressState := TTaskBarProgressState.None;
    form1.Taskbar1.OverlayIcon := Nil;
    application.ProcessMessages;
  End;
  application.ProcessMessages;
End;

Procedure TForm2.SaveNastr2;
Var
  Ini: TMemIniFile;
Begin
  If FPrevEmbedMenuState <> CheckBoxFolderMenu.Checked Then
  Begin
    If CheckBoxFolderMenu.Checked Then
    Begin
      RegisterContextMenu;
    End
    Else
    Begin
      UnregisterContextMenu;
    End;
    SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, Nil, Nil);
    application.ProcessMessages;
    // Обновляем сохраненное состояние
    FPrevEmbedMenuState := CheckBoxFolderMenu.Checked;
  End;

  Ini := TMemIniFile.Create(form1.PortablePath);
  Try

    Ini.WriteBool(option, PlayerWindowCenter.Name, PlayerWindowCenter.Checked);

    Ini.WriteBool(option, ProgressBox.Name, ProgressBox.Checked);
    Ini.WriteBool(option, RandomTrack.Name, RandomTrack.Checked);
    // Ini.WriteBool('option', TopTrackGo.Name, TopTrackGo.Checked);
    Ini.WriteBool(option, TaskTrackGo.Name, TaskTrackGo.Checked);
    Ini.WriteBool(option, AutoNext.Name, AutoNext.Checked);
    Ini.WriteBool(option, chEqualizer.Name, chEqualizer.Checked);
    Ini.WriteBool(option, RepeatSong.Name, RepeatSong.Checked);
    Ini.WriteBool(option, ShowCoverArts.Name, ShowCoverArts.Checked);
    Ini.WriteBool(option, BaloonWindow.Name, BaloonWindow.Checked);
    Ini.WriteBool(option, TrayIcon.Name, TrayIcon.Checked);
    Ini.WriteBool(option, TrayIconMinimize.Name, TrayIconMinimize.Checked);
    Ini.WriteBool(option, CheckBox_LinesPL.Name, CheckBox_LinesPL.Checked);
    Ini.WriteBool(option, CheckBox_ShowPL.Name, CheckBox_ShowPL.Checked);
    Ini.WriteBool(option, CheckBoxColorTrayIcon.Name, CheckBoxColorTrayIcon.Checked);

    Ini.WriteBool(option, RadioButton_Player.Name, RadioButton_Player.Checked);
    Ini.WriteBool(option, RadioButton_System.Name, RadioButton_System.Checked);
    // Звук и эквалайзер
    Ini.WriteBool(option, chFlange.Name, chFlange.Checked);
    Ini.WriteBool(option, chChorus.Name, chChorus.Checked);
    Ini.WriteBool(option, chEcho.Name, chEcho.Checked);
    Ini.WriteBool(option, chReverb.Name, chReverb.Checked);
    Ini.WriteBool(option, BassEF.Name, BassEF.Checked);
    Ini.WriteBool(option, RotateEF.Name, RotateEF.Checked);
    Ini.WriteInteger(option, boxEQSelect.Name, boxEQSelect.ItemIndex);
    Ini.WriteInteger(option, TrackBar80Hz.Name, TrackBar80Hz.Position);
    Ini.WriteInteger(option, TrackBar170Hz.Name, TrackBar170Hz.Position);
    Ini.WriteInteger(option, TrackBar310Hz.Name, TrackBar310Hz.Position);
    Ini.WriteInteger(option, TrackBar600Hz.Name, TrackBar600Hz.Position);
    Ini.WriteInteger(option, TrackBar1000Hz.Name, TrackBar1000Hz.Position);
    Ini.WriteInteger(option, TrackBar3000Hz.Name, TrackBar3000Hz.Position);
    Ini.WriteInteger(option, TrackBar6000Hz.Name, TrackBar6000Hz.Position);
    Ini.WriteInteger(option, TrackBar10000Hz.Name, TrackBar10000Hz.Position);
    Ini.WriteInteger(option, TrackBar12000Hz.Name, TrackBar12000Hz.Position);
    Ini.WriteInteger(option, TrackBar16000Hz.Name, TrackBar16000Hz.Position);

    // Общее HotKey
    Ini.WriteInteger(option, HotKey_Next.Name, HotKey_Next.HotKey);
    Ini.WriteInteger(option, HotKey_Prev.Name, HotKey_Prev.HotKey);
    Ini.WriteInteger(option, HotKey_Start.Name, HotKey_Start.HotKey);
    Ini.WriteInteger(option, HotKey_FileInfo.Name, Form2.HotKey_FileInfo.HotKey);
    Ini.WriteInteger(option, Form2.HotKey_Play.Name, Form2.HotKey_Play.HotKey);
    Ini.WriteInteger(option, HotKey_Option.Name, HotKey_Option.HotKey);
    // Плейлист
    Ini.WriteInteger(option, HotKey_AddPL.Name, HotKey_AddPL.HotKey);
    Ini.WriteInteger(option, HotKey_OpenPL.Name, HotKey_OpenPL.HotKey);
    Ini.WriteInteger(option, HotKey_SavePL.Name, HotKey_SavePL.HotKey);
    Ini.WriteInteger(option, HotKey_ClearSpisok.Name, HotKey_ClearSpisok.HotKey);
    Ini.WriteInteger(option, HotKey_ClearHistory.Name, HotKey_ClearHistory.HotKey);
    // файлы
    Ini.WriteInteger(option, HotKey_DelFile.Name, HotKey_DelFile.HotKey);
    Ini.WriteInteger(option, HotKey_DelFilePL.Name, HotKey_DelFilePL.HotKey);
    Ini.WriteInteger(option, HotKey_NonEx.Name, HotKey_NonEx.HotKey);
    Ini.WriteInteger(option, HotKey_DuplFile.Name, HotKey_DuplFile.HotKey);
    Ini.WriteInteger(option, HotKey_BrowseFile.Name, HotKey_BrowseFile.HotKey);
    // **
    Ini.WriteInteger(option, HotKey_AddFile.Name, HotKey_AddFile.HotKey);
    Ini.WriteInteger(option, HotKey_AddFolder.Name, HotKey_AddFolder.HotKey);
    Ini.WriteInteger(option, HotKey_AddURL.Name, HotKey_AddURL.HotKey);

    { Ini.WriteInteger(option, HotKey_Sound.Name, HotKey_Sound.HotKey);
      Ini.WriteInteger(option, HotKey_Repeat.Name, HotKey_Repeat.HotKey);
      Ini.WriteInteger(option, HotKey_Random.Name, HotKey_Random.HotKey); }

    Ini.WriteBool(option, Form5.CheckBoxClearPathCopy.Name, Form5.CheckBoxClearPathCopy.Checked);
    Ini.WriteBool(option, Form5.CheckBoxCloseFormCopy.Name, Form5.CheckBoxCloseFormCopy.Checked);
    Ini.UpdateFile;
  Finally
    Ini.Free;
  End;
End;

Procedure TForm2.DeleteEmptyPlugRow;
Var
  i, j: Integer;
Begin
  Try
    i := 0;
    While i <= StringGridPlug.RowCount - 1 Do
    Begin
      If Trim(StringGridPlug.Rows[i].Text) = '' Then
      Begin
        For j := i To StringGridPlug.RowCount - 1 Do
          StringGridPlug.Rows[j] := StringGridPlug.Rows[j + 1];
        StringGridPlug.RowCount := StringGridPlug.RowCount - 1;
      End
      Else
        Inc(i);
    End;
  Except
  End;
End;

{Procedure TForm2.Find_Plugins(Path, Ext: String);
Var
  SR: TSearchRec;
  PUTI: String;
  lastRow: Integer;
Begin
  Try
    If FindFirst(Path + Ext, faAnyFile, SR) = 0 Then
    Begin
      Repeat
        If (SR.Attr <> faDirectory) Then
          Path := StringReplace(Path + '\', '\\', '\', [rfReplaceAll]);
        PUTI := Path + SR.Name;
        StringGridPlug.RowCount := StringGridPlug.RowCount + 1;
        lastRow := StringGridPlug.RowCount - 1;
        Form2.StringGridPlug.Cells[0, lastRow] := SR.Name;
        Form2.StringGridPlug.Cells[1, lastRow] := form1.getFileDescription(PUTI);
        Form2.StringGridPlug.Cells[2, lastRow] := form1.GetFileVersion(PUTI);
        Form2.StringGridPlug.Cells[3, lastRow] := PUTI;
        DeleteEmptyPlugRow;
        application.ProcessMessages;
      Until FindNext(SR) <> 0;
      FindClose(SR);
    End;
  Except
  End;
End;  }

Procedure TForm2.Find_Plugins(Path, Ext: String);
Var
  SR: TSearchRec;
  PUTI: String;
  lastRow: Integer;
  Handle: HPLUGIN;
Begin
  Try
    If FindFirst(Path + Ext, faAnyFile, SR) = 0 Then
    Begin
      Repeat
        If (SR.Attr <> faDirectory) Then
          Path := StringReplace(Path + '\', '\\', '\', [rfReplaceAll]);
        PUTI := Path + SR.Name;

        // Внедряем BASS_PluginLoad с использованием ExtractFilePath(ParamStr(0))
        Handle := BASS_PluginLoad(PChar(ExtractFilePath(ParamStr(0)) + 'Plugins\' + SR.Name), BASS_UNICODE);

        // Проверяем успешность загрузки
       { If Handle = 0 Then
        Begin
          // Пробуем загрузить без флага UNICODE (для совместимости)
          Handle := BASS_PluginLoad(PChar(ExtractFilePath(ParamStr(0)) + 'Plugins\' + SR.Name), 0);

          If Handle = 0 Then
          Begin
            // Пропускаем файл если не удалось загрузить как плагин
            Continue;
          End;
        End;  }

        StringGridPlug.RowCount := StringGridPlug.RowCount + 1;
        lastRow := StringGridPlug.RowCount - 1;
        Form2.StringGridPlug.Cells[0, lastRow] := SR.Name;
        Form2.StringGridPlug.Cells[1, lastRow] := getFileDescription(PUTI);
        Form2.StringGridPlug.Cells[2, lastRow] := GetFileVersion(PUTI);
        Form2.StringGridPlug.Cells[3, lastRow] := PUTI;
        // Добавляем хэндл плагина в таблицу
        Form2.StringGridPlug.Cells[4, lastRow] := IntToStr(Handle);

        DeleteEmptyPlugRow;
        application.ProcessMessages;
      Until FindNext(SR) <> 0;
      FindClose(SR);
    End;
  Except
    // Если ошибка - пропустить
  End;
End;

Procedure TForm2.FormCreate(Sender: TObject);
Var
  AppPath, PluginsPath: String;
  BassVerCheck: Boolean;
Begin
  FPrevEmbedMenuState := false;
  TreeViewMenu.FullExpand;
  Application.ProcessMessages;
  StringGridPlug.ColWidths[3] := 0;

  AppPath := ExtractFilePath(ParamStr(0)) + 'Plugins\';
  PluginsPath := AppPath + 'Plugins\';

  BassVerCheck := (HiWord(Bass_GetVersion) <> BASSVERSION);
  If BassVerCheck Then
  Begin
    MessageBox(0, PChar(form1.LangNoBASSDLL.Caption), Nil, MB_ICONERROR);
    Halt;
  End;

  BASS_SetConfig(BASS_CONFIG_FLOATDSP, 1);
  If Not BASS_Init(-1, 44100, BASS_UNICODE, Handle, Nil) Then
  Begin
    MessageBox(0, PChar(form1.LanrErrorAudio.Caption), Nil, MB_ICONERROR);
    Halt;
  End
  Else
    BASS_Start;

 { BASS_PluginLoad(PChar(ExtractFilePath(ParamStr(0)) + 'Plugins\basswma.dll'), BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(ParamStr(0)) + 'Plugins\basswv.dll'), BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(ParamStr(0)) + 'Plugins\bassaac.dll'), BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(ParamStr(0)) + 'Plugins\bassac3.dll'), BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(ParamStr(0)) + 'Plugins\bassadx.dll'), BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(ParamStr(0)) + 'Plugins\bassaix.dll'), BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(ParamStr(0)) + 'Plugins\bassalac.dll'), BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(ParamStr(0)) + 'Plugins\bassape.dll'), BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(ParamStr(0)) + 'Plugins\bassdsd.dll'), BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(ParamStr(0)) + 'Plugins\bassflac.dll'), BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(ParamStr(0)) + 'Plugins\basshls.dll'), BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(ParamStr(0)) + 'Plugins\bassmidi.dll'), BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(ParamStr(0)) + 'Plugins\BASSMOD.dll'), BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(ParamStr(0)) + 'Plugins\bassmpc.dll'), BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(ParamStr(0)) + 'Plugins\bassofr.dll'), BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(ParamStr(0)) + 'Plugins\bassopus.dll'), BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(ParamStr(0)) + 'Plugins\bassspx.dll'), BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(ParamStr(0)) + 'Plugins\basstta.dll'), BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(ParamStr(0)) + 'Plugins\basswebm.dll'), BASS_UNICODE);}
  Application.ProcessMessages;
  Channel := 0;
  BASS_GetInfo(BassInfo);

  DIRECTX_80_NOT_INSTALLED := BassInfo.dsver < 8;
  If DIRECTX_80_NOT_INSTALLED Then
  Begin
    Error(form1.LangDirectX8.Caption);
    Application.ProcessMessages;
  End;

  BASS_GetInfo(BassInfo);

  // Проверяем поддержку эффектов
  If (BassInfo.flags And BASS_DEVICE_DSOUND) <> 0 Then
    EAX_SUPPORTED := True
  Else
    EAX_SUPPORTED := False;

  BASS_SetDefaultSoundEffect([seFlange, seChorus, seEcho, seReverb, seEqualizer]);
  BASS_SetConfig(BASS_CONFIG_NET_PLAYLIST, 1);
  BASS_SetConfig(BASS_CONFIG_NET_PREBUF, 1000);
  BASS_SetConfig(BASS_CONFIG_NET_BUFFER, 1000);
  BASS_SetConfig(BASS_CONFIG_NET_TIMEOUT, 5000);
  BASS_SetConfig(BASS_CONFIG_BUFFER, 1000);

  Application.ProcessMessages;
  Find_Plugins(PluginsPath, '*.dll');
  Application.ProcessMessages;
  Find_Plugins(AppPath, '*.dll');

  StringGridPlug.ColWidths[0] := 90;
  StringGridPlug.ColWidths[2] := 70;
  StringGridPlug.ColWidths[1] := StringGridPlug.Width - StringGridPlug.ColWidths[0] - StringGridPlug.ColWidths[2] - 10;
  Application.ProcessMessages;

  LoadNastr2;
  Application.ProcessMessages;

  PageGeneral.TabVisible := False;
  PageEQ.TabVisible := False;
  PageHotKeys.TabVisible := False;
  PagePlugin.TabVisible := False;

  PageControlOptions.ActivePageIndex := 0;
  TreeViewMenu.Selected := TreeViewMenu.Items[PageControlOptions.ActivePageIndex];
  LabelInfo.Caption := TreeViewMenu.Selected.Text;

  Try
    TreeViewMenu.SetFocus;
  Except
  End;

  Application.ProcessMessages;
End;

Procedure TForm2.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key = #13 Then
  Begin
    Form2.HotKey_Play.HotKey := vk_return;
  End;
  If Key = #27 Then
  Begin
    Form2.Close;
  End;
End;

Procedure TForm2.FormShow(Sender: TObject);
Begin
  Try
    SetWindowPos(Handle, HWND_TOPMOST, left, top, Width, Height, SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE);
    form1.Globload;
    application.ProcessMessages;
    Form2.TreeViewMenu.SetFocus;
    TreeViewMenuClick(Sender);
    application.ProcessMessages;
  Except
  End;
End;

Procedure TForm2.HotKey_NextChange(Sender: TObject);
Begin
  form1.NextTryMenu.ShortCut := HotKey_Next.HotKey;
  application.ProcessMessages;
End;

Procedure TForm2.HotKey_NonExChange(Sender: TObject);
Begin
  form1.DeleteNonExistentMenu.ShortCut := HotKey_NonEx.HotKey;
  application.ProcessMessages;
End;

Procedure TForm2.HotKey_OpenPLChange(Sender: TObject);
Begin
  form1.OpenPLMenu.ShortCut := HotKey_OpenPL.HotKey;
  application.ProcessMessages;
End;

Procedure TForm2.HotKey_OptionChange(Sender: TObject);
Begin
  form1.OptionMenu.ShortCut := HotKey_Option.HotKey;
  form1.OptionTryMenu.ShortCut := HotKey_Option.HotKey;
  application.ProcessMessages;
End;

Procedure TForm2.HotKey_PrevChange(Sender: TObject);
Begin
  form1.PrevTryMenu.ShortCut := HotKey_Prev.HotKey;
  application.ProcessMessages;
End;

Procedure TForm2.HotKey_SavePLChange(Sender: TObject);
Begin
  form1.SavePLMenu.ShortCut := HotKey_SavePL.HotKey;
  application.ProcessMessages;
End;

Procedure TForm2.HotKey_StartChange(Sender: TObject);
Begin
  form1.PlayTryMenu.ShortCut := HotKey_Start.HotKey;
  application.ProcessMessages;
End;

Procedure TForm2.HotKey_AddFileChange(Sender: TObject);
Begin
  form1.AddFileMenu1.ShortCut := HotKey_AddFile.HotKey;
  form1.AddFileMenu.ShortCut := HotKey_AddFile.HotKey;
  application.ProcessMessages;
End;

Procedure TForm2.HotKey_AddFolderChange(Sender: TObject);
Begin
  form1.AddFolderMenu1.ShortCut := HotKey_AddFolder.HotKey;
  form1.AddFolderMenu.ShortCut := HotKey_AddFolder.HotKey;
  application.ProcessMessages;
End;

Procedure TForm2.HotKey_AddPLChange(Sender: TObject);
Begin
  form1.AddPLMenu.ShortCut := HotKey_AddPL.HotKey;
  application.ProcessMessages;
End;

Procedure TForm2.HotKey_AddURLChange(Sender: TObject);
Begin
  form1.AddURLMenu1.ShortCut := HotKey_AddURL.HotKey;
  form1.AddURLMenu.ShortCut := HotKey_AddURL.HotKey;
  application.ProcessMessages;
End;

Procedure TForm2.HotKey_ClearHistoryChange(Sender: TObject);
Begin
  form1.ClearHistoryMenu.ShortCut := HotKey_ClearHistory.HotKey;
  application.ProcessMessages;
End;

Procedure TForm2.HotKey_DelFileChange(Sender: TObject);
Begin
  form1.DeleteFileFromDiskMenu.ShortCut := HotKey_DelFile.HotKey;
  application.ProcessMessages;
End;

Procedure TForm2.HotKey_DuplFileChange(Sender: TObject);
Begin
  form1.DeleteDuplicatesMenu.ShortCut := HotKey_DuplFile.HotKey;
  application.ProcessMessages;
End;

Procedure TForm2.HotKey_FileInfoChange(Sender: TObject);
Begin
  form1.FileInfoMenu.ShortCut := Form2.HotKey_FileInfo.HotKey;
  form1.FileInfoPLMenu.ShortCut := Form2.HotKey_FileInfo.HotKey;
  application.ProcessMessages;
End;

Procedure TForm2.HotKey_PlayChange(Sender: TObject);
Begin
  form1.PlayMenu.ShortCut := Form2.HotKey_Play.HotKey;
End;

Procedure TForm2.HotKey_ClearSpisokChange(Sender: TObject);
Begin
  form1.ClearlistMenu.ShortCut := HotKey_ClearSpisok.HotKey;
  application.ProcessMessages;
End;

Procedure TForm2.HotKey_BrowseFileChange(Sender: TObject);
Begin
  form1.FileLocationMenu.ShortCut := HotKey_BrowseFile.HotKey;
  application.ProcessMessages;
End;

Procedure TForm2.HotKey_DelFilePLChange(Sender: TObject);
Begin
  form1.DeleteFileFromListMenu.ShortCut := HotKey_DelFilePL.HotKey;
  application.ProcessMessages;
End;

Function fmod(a, B: Single): Single;
Begin
  Result := a - (B * Trunc(a / B));
End;

Procedure Rotate(Handle: HDSP; Channel: DWORD; Buffer: pointer; Length: DWORD; user: pointer); Stdcall;
Var
  a: DWORD;
  d: PSingle;
Begin
  d := Buffer;
  a := 0;
  While (a < (Length Div 4)) Do
  Begin
    d^ := d^ * Abs(Sin(rotpos));
    Inc(d);
    d^ := d^ * Abs(Cos(rotpos));
    rotpos := fmod(rotpos + 0.00003, Pi);
    Inc(d);
    a := a + 2;
  End;
End;

Procedure TForm2.RadioButton_PlayerClick(Sender: TObject);
Begin
  form1.barVolume.Visible := true;
  form1.barVolumeSys.Visible := false;
  application.ProcessMessages;
End;

Procedure TForm2.RadioButton_SystemClick(Sender: TObject);
Begin
  form1.barVolume.Visible := false;
  form1.barVolumeSys.Visible := true;
  application.ProcessMessages;
End;

Procedure TForm2.RandomTrackClick(Sender: TObject);
Begin
  Try
    If RandomTrack.Checked = true Then
    Begin
      form1.RandomSongSG;
      application.ProcessMessages;
      form1.RandomButton.ImageIndex := 7;
      form1.nextButton.Hint := form1.StringGrid1.Cells[1, strtoint(form1.MemoRandomSong.Lines[1]) - 1];
    End;
    If RandomTrack.Checked = false Then
    Begin
      form1.RandomButton.ImageIndex := 11;
      form1.nextButton.Hint := form1.StringGrid1.Cells[1, strtoint(form1.MemoRandomSong.Lines[1]) + 1];
    End;
  Except
  End;
  application.ProcessMessages;
End;

Procedure TForm2.RepeatSongClick(Sender: TObject);
Begin
  If RepeatSong.Checked = true Then
  Begin
    form1.RepeatButton.ImageIndex := 8;
  End;
  If RepeatSong.Checked = false Then
  Begin
    form1.RepeatButton.ImageIndex := 12;
  End;
  application.ProcessMessages;
End;

Procedure TForm2.RotateEFClick(Sender: TObject);
Begin
  If RotateEF.Checked = true Then
  Begin
    rotpos := 0.7853981;
    rotdsp := BASS_ChannelSetDSP(Channel, @Rotate, Nil, 2);
  End;
  If RotateEF.Checked = false Then
  Begin
    BASS_ChannelRemoveDSP(Channel, rotdsp);
  End;
  application.ProcessMessages;
End;

Procedure TForm2.TrackBar80HzChange(Sender: TObject);
Begin
  EQGainCurrent[0] := -Form2.TrackBar80Hz.Position;
  If Not CHANGE_PRESET Then
    boxEQSelect.ItemIndex := boxEQSelect.Items.Count - 1;
  Include(SNDEffects, seEqualizer);
  BASS_SetSoundEffects(SNDEffects);
  EQParam.fCenter := 80;
  EQParam.fBandwidth := 5;
End;

Procedure TForm2.TrackBar170HzChange(Sender: TObject);
Begin
  EQGainCurrent[1] := -Form2.TrackBar170Hz.Position;
  If Not CHANGE_PRESET Then
    boxEQSelect.ItemIndex := boxEQSelect.Items.Count - 1;
  Include(SNDEffects, seEqualizer);
  BASS_SetSoundEffects(SNDEffects);
  EQParam.fCenter := 170;
  EQParam.fBandwidth := 5;
End;

Procedure TForm2.TrackBar310HzChange(Sender: TObject);
Begin
  EQGainCurrent[2] := -Form2.TrackBar310Hz.Position;
  If Not CHANGE_PRESET Then
    boxEQSelect.ItemIndex := boxEQSelect.Items.Count - 1;
  Include(SNDEffects, seEqualizer);
  BASS_SetSoundEffects(SNDEffects);
  EQParam.fCenter := 310;
  EQParam.fBandwidth := 5;
End;

Procedure TForm2.TrackBar600HzChange(Sender: TObject);
Begin
  EQGainCurrent[3] := -Form2.TrackBar600Hz.Position;
  If Not CHANGE_PRESET Then
    boxEQSelect.ItemIndex := boxEQSelect.Items.Count - 1;
  Include(SNDEffects, seEqualizer);
  BASS_SetSoundEffects(SNDEffects);
  EQParam.fCenter := 600;
  EQParam.fBandwidth := 5;
End;

Procedure TForm2.TrackBar1000HzChange(Sender: TObject);
Begin
  EQGainCurrent[4] := -Form2.TrackBar1000Hz.Position;
  If Not CHANGE_PRESET Then
    boxEQSelect.ItemIndex := boxEQSelect.Items.Count - 1;
  Include(SNDEffects, seEqualizer);
  BASS_SetSoundEffects(SNDEffects);
  EQParam.fCenter := 1000;
  EQParam.fBandwidth := 5;
End;

Procedure TForm2.TrackBar3000HzChange(Sender: TObject);
Begin
  EQGainCurrent[5] := -Form2.TrackBar3000Hz.Position;
  If Not CHANGE_PRESET Then
    boxEQSelect.ItemIndex := boxEQSelect.Items.Count - 1;
  Include(SNDEffects, seEqualizer);
  BASS_SetSoundEffects(SNDEffects);
  EQParam.fCenter := 3000;
  EQParam.fBandwidth := 5;
End;

Procedure TForm2.TrackBar6000HzChange(Sender: TObject);
Begin
  EQGainCurrent[6] := -Form2.TrackBar6000Hz.Position;
  If Not CHANGE_PRESET Then
    boxEQSelect.ItemIndex := boxEQSelect.Items.Count - 1;
  Include(SNDEffects, seEqualizer);
  BASS_SetSoundEffects(SNDEffects);
  EQParam.fCenter := 6000;
End;

Procedure TForm2.TrackBar10000HzChange(Sender: TObject);
Begin
  EQGainCurrent[7] := -Form2.TrackBar10000Hz.Position;
  If Not CHANGE_PRESET Then
    boxEQSelect.ItemIndex := boxEQSelect.Items.Count - 1;
  Include(SNDEffects, seEqualizer);
  BASS_SetSoundEffects(SNDEffects);
  EQParam.fCenter := 10000;
  EQParam.fBandwidth := 5;
End;

Procedure TForm2.TrackBar12000HzChange(Sender: TObject);
Begin
  EQGainCurrent[8] := -Form2.TrackBar12000Hz.Position;
  If Not CHANGE_PRESET Then
    boxEQSelect.ItemIndex := boxEQSelect.Items.Count - 1;
  Include(SNDEffects, seEqualizer);
  BASS_SetSoundEffects(SNDEffects);
  EQParam.fCenter := 12000;
  EQParam.fBandwidth := 5;
End;

Procedure TForm2.TrackBar16000HzChange(Sender: TObject);
Begin
  EQGainCurrent[9] := -Form2.TrackBar16000Hz.Position;
  If Not CHANGE_PRESET Then
    boxEQSelect.ItemIndex := boxEQSelect.Items.Count - 1;
  Include(SNDEffects, seEqualizer);
  BASS_SetSoundEffects(SNDEffects);
  application.ProcessMessages;
  EQParam.fCenter := 16000;
  EQParam.fBandwidth := 5;
End;

Procedure TForm2.TreeViewMenuClick(Sender: TObject);
Begin
  PageControlOptions.ActivePageIndex := TreeViewMenu.Selected.AbsoluteIndex;
  LabelInfo.Caption := '';
  LabelInfo.Caption := TreeViewMenu.Selected.Text;
  application.ProcessMessages;
End;

End.

