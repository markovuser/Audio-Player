unit Unit_Settings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, IniFiles,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Bass,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons, Menus, Vcl.Samples.Spin,
  MMDeviceAPI, ActiveX, System.ImageList, Vcl.ImgList, Shellapi,
  uSpectrum, Unit_Win7Taskbar, FreeImageLoader, Vcl.CategoryButtons,
  Internationalization;

type
  TWmMoving = record
    Msg: Cardinal;
    fwSide: Cardinal;
    lpRect: PRect;
    Result: Integer;
  end;

const
  BassCount = 3;
  NumEQBands = 10;
  EQCount = NumEQBands - 1;
  { EQCenter: array [0 .. EQCount] of 31 .. 16000 = (80, 100, 125, 250, 500, 1000,
    2000, 4000, 8000, 16000); }
  EQCenter: array [0 .. EQCount] of 31 .. 16000 = (80, 170, 310, 600, 1000,
    3000, 6000, 10000, 12000, 16000);
  // EQGainBass: array [0 .. BassCount - 1] of - 15 .. 15 = (4, 3, 2);
  EQGainBass: array [0 .. BassCount - 1] of - 15 .. 15 = (6, 5, 4);

type
  TEQArray = array [0 .. EQCount] of - 15 .. 15;

const
  EQGainDefault: TEQArray = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  EQGainFULLBT: TEQArray = (9, 8, 5, -6, -2, -1, 4, 6, 8, 9);
  EQGainRock: TEQArray = (0, 1, 3, 1, -2, -1, 0, 3, 7, 8);
  EQGainRap: TEQArray = (-2, 0, 1, 7, -2, -2, 0, 0, 7, 9);
  EQGainGrunge: TEQArray = (-5, 0, 0, -2, 0, 0, 2, 3, 0, -3);
  EQGainMetal: TEQArray = (-5, 0, 0, 0, 0, 0, 3, 0, 3, 2);
  EQGainTechno: TEQArray = (-7, 2, 4, -2, -2, -3, 0, 0, 5, 5);
  EQGainPop: TEQArray = (-1, 4, 5, 2, -1, -2, 0, 0, 4, 4);
  EQGainClassic: TEQArray = (0, 0, 0, 4, 5, 3, 7, 3, 0, 0);
  EQGainVoice: TEQArray = (-8, -6, -4, 1, 0, 0, 0, -4, -6, -8);
  { EQGainDefault: TEQArray = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    EQGainRock: TEQArray = (-2, 1, 3, 7, -2, -2, 0, 0, 7, 7);
    EQGainRap: TEQArray = (-2, 0, 1, 7, -2, -2, 0, 0, 7, 9);
    EQGainGrunge: TEQArray = (-5, 0, 0, -2, 0, 0, 2, 3, 0, -3);
    EQGainMetal: TEQArray = (-5, 0, 0, 0, 0, 0, 3, 0, 3, 2);
    EQGainTechno: TEQArray = (-7, 2, 4, -2, -2, -3, 0, 0, 5, 5);
    EQGainPop: TEQArray = (-1, 4, 5, 2, -1, -2, 0, 0, 4, 4);
    EQGainClassic: TEQArray = (0, 0, 0, 4, 5, 3, 7, 3, 0, 0);
    EQGainVoice: TEQArray = (-8, -6, -4, 1, 0, 0, 0, -4, -6, -8); }

type
  TSNDEffects = set of (seFlange, seChorus, seEcho, seReverb, seBass,
    seEqualizer);

var
  FlangeHandle, ChorusHandle, EchoHandle, ReverbHandle: HFX;
  EQHandle: array [0 .. NumEQBands - 1] of HFX;
  FlangeParam: BASS_DX8_FLANGER;
  ChorusParam: BASS_DX8_CHORUS;
  EchoParam: BASS_DX8_ECHO;
  ReverbParam: BASS_DX8_REVERB;
  EQParam: BASS_DX8_PARAMEQ;
  SNDEffects: TSNDEffects;
  EQGainCurrent: array [0 .. EQCount] of - 15 .. 15;

type
  TMyControl = class(TControl);

type
  TForm2 = class(TForm)
    TabControl1: TTabControl;
    Image1: TImage;
    TabControl2: TTabControl;
    Button_Cancel: TButton;
    Button_OK: TButton;
    MSGBASS: TStaticText;
    MSGAudio: TStaticText;
    MSGDirectX: TStaticText;
    PageControl1: TPageControl;
    A1: TTabSheet;
    GroupBox5: TGroupBox;
    ProgressBox: TCheckBox;
    TaskTrackGo: TCheckBox;
    ShowCoverArts: TCheckBox;
    GroupBox6: TGroupBox;
    TrayIcon: TCheckBox;
    TrayIconMinimize: TCheckBox;
    A2: TTabSheet;
    GroupBox1: TGroupBox;
    AutoNext: TCheckBox;
    RandomTrack: TCheckBox;
    RepeatSong: TCheckBox;
    A3: TTabSheet;
    GroupBox9: TGroupBox;
    RadioButton_Player: TRadioButton;
    RadioButton_System: TRadioButton;
    B1: TTabSheet;
    GroupBox7: TGroupBox;
    boxEQSelect: TComboBox;
    chEqualizer: TCheckBox;
    GroupBox4: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    TrackBar10: TTrackBar;
    TrackBar11: TTrackBar;
    TrackBar12: TTrackBar;
    TrackBar13: TTrackBar;
    TrackBar4: TTrackBar;
    TrackBar5: TTrackBar;
    TrackBar6: TTrackBar;
    TrackBar7: TTrackBar;
    TrackBar8: TTrackBar;
    TrackBar9: TTrackBar;
    B2: TTabSheet;
    GroupBox3: TGroupBox;
    BassEF: TCheckBox;
    chChorus: TCheckBox;
    chEcho: TCheckBox;
    chFlange: TCheckBox;
    chReverb: TCheckBox;
    RotateEF: TCheckBox;
    A4: TTabSheet;
    A5: TTabSheet;
    GroupBox10: TGroupBox;
    CheckBox_SavePlaylist: TCheckBox;
    CheckBox_LinesPL: TCheckBox;
    A6: TTabSheet;
    TabControl3: TTabControl;
    Label19: TLabel;
    GroupBox15: TGroupBox;
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
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    ListView1: TListView;
    HotKey_DelFilePL: THotKey;
    A8: TTabSheet;
    ListView3: TListView;
    StaticText11: TStaticText;
    Label2: TLabel;
    HotKey_Sound: THotKey;
    HotKey_Repeat: THotKey;
    HotKey_Random: THotKey;
    BaloonWindow: TCheckBox;
    SpeedButton1: TButton;
    CheckBox_ShowPL: TCheckBox;
    TabControl4: TTabControl;
    TreeView1: TTreeView;
    procedure chEqualizerClick(Sender: TObject);
    procedure boxEQSelectChange(Sender: TObject);
    procedure chEchoClick(Sender: TObject);
    procedure chChorusClick(Sender: TObject);
    procedure chReverbClick(Sender: TObject);
    procedure chFlangeClick(Sender: TObject);
    procedure BassEFClick(Sender: TObject);
    procedure RotateEFClick(Sender: TObject);
    procedure TrackBar13Change(Sender: TObject);
    procedure SetEQValues(EQArray: TEQArray);
    procedure HotKey_FileInfoChange(Sender: TObject);
    procedure Button_Reset2Click(Sender: TObject);
    procedure TaskTrackGoClick(Sender: TObject);
    procedure TrackBar4Change(Sender: TObject);
    procedure TrackBar5Change(Sender: TObject);
    procedure TrackBar6Change(Sender: TObject);
    procedure TrackBar7Change(Sender: TObject);
    procedure TrackBar8Change(Sender: TObject);
    procedure TrackBar9Change(Sender: TObject);
    procedure TrackBar10Change(Sender: TObject);
    procedure TrackBar11Change(Sender: TObject);
    procedure TrackBar12Change(Sender: TObject);
    procedure RandomTrackClick(Sender: TObject);
    procedure BASS_SetSoundEffects(const Value: TSNDEffects);
    procedure BASS_RestoreSoundEffect;
    procedure FormCreate(Sender: TObject);
    procedure Error(const ErrMsg: string);
    procedure LoadNastr2;
    procedure SaveNastr2;
    procedure Language;
    procedure BASS_SetDefaultSoundEffect(const SNDEffects: TSNDEffects);
    // procedure Theme;
    // procedure GetTheme;
    procedure ListFileDir(Path, Ext: string; HideExt: Boolean);
    procedure createicon;
    procedure Find_Plugins(Path, Ext: string; HideExt: Boolean);
    procedure Button_CancelClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ProgressBoxClick(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TabOptionMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TabControl1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TabKeyMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TabControl12MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TabSheet3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TabSheet1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TabSheet4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure AutoNextClick(Sender: TObject);
    procedure HotKey_NextChange(Sender: TObject);
    procedure HotKey_PrevChange(Sender: TObject);
    procedure HotKey_StartChange(Sender: TObject);
    procedure Button_OKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ShowCoverArtsClick(Sender: TObject);
    procedure TrayIconClick(Sender: TObject);
    procedure TrayIconMinimizeClick(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure HotKey_PlayChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure HotKey6Change(Sender: TObject);
    procedure HotKey7Change(Sender: TObject);
    procedure HotKey_OptionChange(Sender: TObject);
    procedure HotKey_AddPLChange(Sender: TObject);
    procedure HotKey_OpenPLChange(Sender: TObject);
    procedure HotKey_SavePLChange(Sender: TObject);
    procedure HotKey_DelFileChange(Sender: TObject);
    procedure HotKey_NonExChange(Sender: TObject);
    procedure HotKey_ClearSpisokChange(Sender: TObject);
    procedure HotKey_DuplFileChange(Sender: TObject);
    procedure HotKey_ClearHistoryChange(Sender: TObject);
    procedure HotKey_BrowseFileChange(Sender: TObject);
    procedure HotKey_AddFileChange(Sender: TObject);
    procedure HotKey_AddFolderChange(Sender: TObject);
    procedure HotKey_AddURLChange(Sender: TObject);
    procedure RadioButton_SystemClick(Sender: TObject);
    procedure RadioButton_PlayerClick(Sender: TObject);
    procedure CheckBox_SavePlaylistClick(Sender: TObject);
    procedure CheckBox_LinesPLClick(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure TabSheet5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GroupBox4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ПлейлистMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TabSheet2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GroupBox6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GroupBox5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GroupBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GroupBox9MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GroupBox7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GroupBox3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GroupBox8MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure GroupBox10MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TabControl3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure HotKey_DelFilePLChange(Sender: TObject);
    procedure RepeatSongClick(Sender: TObject);
    procedure HotKey_SoundChange(Sender: TObject);
    procedure HotKey_RepeatChange(Sender: TObject);
    procedure HotKey_RandomChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CheckBox_ShowPLClick(Sender: TObject);
    { procedure ListView_ThemeSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean); }

  protected
    // procedure WMWindowPosChanged(var Message: TWMWindowPosChanged);
    // message WM_WINDOWPOSCHANGED;

  private
    FListViewWndProc: TWndMethod;
    procedure ListViewWndProc(var Msg: Tmessage);
  public
    property Font;
  end;

var
  Form2: TForm2;

implementation

uses Unit_Base, Unit_CopyFile;
{$R *.dfm}

procedure TForm2.ListViewWndProc(var Msg: Tmessage);
begin
  ShowScrollBar(ListView3.Handle, SB_HORZ, FShowHoriz);
  ShowScrollBar(ListView3.Handle, SB_VERT, FShowVert);
  FListViewWndProc(Msg); // process message
end;

{ procedure TForm2.WMWindowPosChanged(var Message: TWMWindowPosChanged);
  begin
  inherited;
  Form2.SaveNastr2;
  application.ProcessMessages;
  end; }

procedure TForm2.BASS_RestoreSoundEffect;
var
  i: Integer;
begin
  if FlangeHandle <> 0 then
    if BASS_ChannelRemoveFX(Channel, FlangeHandle) then
      FlangeHandle := 0;
  if ChorusHandle <> 0 then
    if BASS_ChannelRemoveFX(Channel, ChorusHandle) then
      ChorusHandle := 0;
  if EchoHandle <> 0 then
    if BASS_ChannelRemoveFX(Channel, EchoHandle) then
      EchoHandle := 0;
  if ReverbHandle <> 0 then
    if BASS_ChannelRemoveFX(Channel, ReverbHandle) then
      ReverbHandle := 0;

  for i := 0 to (NumEQBands - 1) do
  begin
    if EQHandle[i] <> 0 then
      if BASS_ChannelRemoveFX(Channel, EQHandle[i]) then
        EQHandle[i] := 0;
  end;
end;

procedure TForm2.BASS_SetSoundEffects(const Value: TSNDEffects);
var
  i: 0 .. NumEQBands - 1;
begin
  BASS_RestoreSoundEffect;
  // ------------------------
  if seFlange in Value then
  begin
    if FlangeHandle = 0 then
      FlangeHandle := BASS_ChannelSetFX(Channel, BASS_FX_DX8_FLANGER, 1);
    if FlangeHandle <> 0 then
    begin
      if BASS_FXGetParameters(FlangeHandle, @FlangeParam) then
        BASS_FXSetParameters(FlangeHandle, @FlangeParam)
    end;
  end;
  // ------------------------
  if seChorus in Value then
  begin
    if ChorusHandle = 0 then
      ChorusHandle := BASS_ChannelSetFX(Channel, BASS_FX_DX8_CHORUS, 1);
    if ChorusHandle <> 0 then
    begin
      if BASS_FXGetParameters(ChorusHandle, @ChorusParam) then
        BASS_FXSetParameters(ChorusHandle, @ChorusParam)
    end;
  end;
  // ------------------------
  if seEcho in Value then
  begin
    if EchoHandle = 0 then
      EchoHandle := BASS_ChannelSetFX(Channel, BASS_FX_DX8_ECHO, 1);
    if EchoHandle <> 0 then
    begin
      if BASS_FXGetParameters(EchoHandle, @EchoParam) then
        BASS_FXSetParameters(EchoHandle, @EchoParam)
    end;
  end;
  // ------------------------
  if seReverb in Value then
  begin
    if ReverbHandle = 0 then
      ReverbHandle := BASS_ChannelSetFX(Channel, BASS_FX_DX8_REVERB, 1);
    if ReverbHandle <> 0 then
    begin
      if BASS_FXGetParameters(ReverbHandle, @ReverbParam) then
        BASS_FXSetParameters(ReverbHandle, @ReverbParam)
    end;
  end;
  // ------------------------
  if seEqualizer in Value then
  begin
    for i := 0 to EQCount do
    begin
      if EQHandle[i] = 0 then
        EQHandle[i] := BASS_ChannelSetFX(Channel, BASS_FX_DX8_PARAMEQ, 1);
      EQParam.fCenter := EQCenter[i];
      if (seBass in Value) and (i <= BassCount - 1) then
        EQParam.fGain := EQGainBass[i]
      else
        EQParam.fGain := EQGainCurrent[i];
      BASS_FXSetParameters(EQHandle[i], @EQParam);
    end;
  end
  else
  begin
    if seBass in Value then
    begin
      for i := 0 to BassCount - 1 do
      begin
        if EQHandle[i] = 0 then
          EQHandle[i] := BASS_ChannelSetFX(Channel, BASS_FX_DX8_PARAMEQ, 1);
        EQParam.fCenter := EQCenter[i];
        EQParam.fGain := EQGainBass[i];
        BASS_FXSetParameters(EQHandle[i], @EQParam);
      end;
    end;
  end;
end;

procedure TForm2.AutoNextClick(Sender: TObject);
begin
  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.BassEFClick(Sender: TObject);
begin
  if BassEF.Checked = True then
  begin
    Include(SNDEffects, seBass);
    BASS_SetSoundEffects(SNDEffects);
    application.ProcessMessages;
  end;
  if BassEF.Checked = False then
  begin
    Exclude(SNDEffects, seBass);
    BASS_SetSoundEffects(SNDEffects);
    application.ProcessMessages;
  end;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.SetEQValues(EQArray: TEQArray);
begin
  Form2.TrackBar4.Position := -EQArray[0];
  Form2.TrackBar5.Position := -EQArray[1];
  Form2.TrackBar6.Position := -EQArray[2];
  Form2.TrackBar7.Position := -EQArray[3];
  Form2.TrackBar8.Position := -EQArray[4];
  Form2.TrackBar9.Position := -EQArray[5];
  Form2.TrackBar10.Position := -EQArray[6];
  Form2.TrackBar11.Position := -EQArray[7];
  Form2.TrackBar12.Position := -EQArray[8];
  Form2.TrackBar13.Position := -EQArray[9];
  application.ProcessMessages;
end;

procedure TForm2.ShowCoverArtsClick(Sender: TObject);
begin
  if ShowCoverArts.Checked = True then
  begin
    form1.Constraints.MinHeight := 600;
    form1.Image1.Picture := nil;
    form1.FileCoverMenu.Checked := True;
    form1.ListCoverArts;
    form1.TabControl_CoverArt.Visible := True;
    application.ProcessMessages;
  end;
  if Form2.ShowCoverArts.Checked = False then
  begin
    form1.Constraints.MinHeight := 330;
    form1.Image1.Picture := nil;
    form1.FileCoverMenu.Checked := False;
    form1.TabControl_CoverArt.Visible := False;
    application.ProcessMessages;
  end;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  application.ProcessMessages;
  Form2.SaveNastr2;
  form1.SaveNastr;
  application.ProcessMessages;
  LoadNastr2;
  application.ProcessMessages;
  SpeedButton1.Enabled := False;
  application.ProcessMessages;
end;

procedure TForm2.boxEQSelectChange(Sender: TObject);
var
  i: Integer;
begin
  CHANGE_PRESET := True;
  case boxEQSelect.ItemIndex of
    0, 10:
      begin
        for i := 0 to EQCount do
          EQGainCurrent[i] := EQGainDefault[i];
        SetEQValues(EQGainDefault);
      end;
    1:
      begin
        for i := 0 to EQCount do
          EQGainCurrent[i] := EQGainFULLBT[i];
        SetEQValues(EQGainFULLBT);
      end;
    2:
      begin
        for i := 0 to EQCount do
          EQGainCurrent[i] := EQGainRock[i];
        SetEQValues(EQGainRock);
      end;
    3:
      begin
        for i := 0 to EQCount do
          EQGainCurrent[i] := EQGainRap[i];
        SetEQValues(EQGainRap);
      end;
    4:
      begin
        for i := 0 to EQCount do
          EQGainCurrent[i] := EQGainGrunge[i];
        SetEQValues(EQGainGrunge);
      end;
    5:
      begin
        for i := 0 to EQCount do
          EQGainCurrent[i] := EQGainMetal[i];
        SetEQValues(EQGainMetal);
      end;
    6:
      begin
        for i := 0 to EQCount do
          EQGainCurrent[i] := EQGainTechno[i];
        SetEQValues(EQGainTechno);
      end;
    7:
      begin
        for i := 0 to EQCount do
          EQGainCurrent[i] := EQGainPop[i];
        SetEQValues(EQGainPop);
      end;
    8:
      begin
        for i := 0 to EQCount do
          EQGainCurrent[i] := EQGainClassic[i];
        SetEQValues(EQGainClassic);
      end;
    9:
      begin
        for i := 0 to EQCount do
          EQGainCurrent[i] := EQGainVoice[i];
        SetEQValues(EQGainVoice);
      end;

  end;
  CHANGE_PRESET := False;
  Include(SNDEffects, seEqualizer);
  BASS_SetSoundEffects(SNDEffects);

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.Button_Reset2Click(Sender: TObject);
begin
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

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

{ procedure TForm2.GetTheme;
  var
  ListItem: TListItem;
  i: Integer;
  begin
  try
  sm := TStyleManager.Create;
  for i := 0 to Length(sm.StyleNames) - 1 do
  begin
  application.ProcessMessages;
  ListItem := Form2.ListView_Theme.Items.Add;
  with ListItem do
  begin
  Caption := sm.StyleNames[i];
  end;
  end;
  except
  end;
  end; }

procedure SetFontByComponent(comp: TComponent; Font: string);
var
  i: Integer;
begin
  for i := 0 to form1.ComponentCount - 1 do
    if form1.Components[i].Name <> 'StatusBar2' then
      if form1.Components[i] is TControl then
        (TMyControl(form1.Components[i])).Font.Name := Font;
end;

procedure TForm2.Button_CancelClick(Sender: TObject);
begin
  Form2.Close;
  application.ProcessMessages;
  LoadNastr2;
  application.ProcessMessages;
end;

procedure TForm2.Button_OKClick(Sender: TObject);
begin
  Form2.Close;
  application.ProcessMessages;
  Form2.SaveNastr2;
  form1.SaveNastr;
  application.ProcessMessages;
  LoadNastr2;
  application.ProcessMessages;
end;

procedure TForm2.chChorusClick(Sender: TObject);
begin
  if Form2.chChorus.Checked = True then
  begin
    Include(SNDEffects, seChorus);
    Form2.BASS_SetSoundEffects(SNDEffects);
    application.ProcessMessages;
  end;
  if Form2.chChorus.Checked = False then
  begin
    Exclude(SNDEffects, seChorus);
    Form2.BASS_SetSoundEffects(SNDEffects);
    application.ProcessMessages;
  end;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.chEchoClick(Sender: TObject);
begin
  if chEcho.Checked = True then
  begin
    Include(SNDEffects, seEcho);
    BASS_SetSoundEffects(SNDEffects);
    application.ProcessMessages;
  end;
  if chEcho.Checked = False then
  begin
    Exclude(SNDEffects, seEcho);
    BASS_SetSoundEffects(SNDEffects);
    application.ProcessMessages;
  end;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.CheckBox_LinesPLClick(Sender: TObject);
begin
  form1.ListViewPlaylist.GridLines := CheckBox_LinesPL.Checked;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.CheckBox_SavePlaylistClick(Sender: TObject);
begin
  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.CheckBox_ShowPLClick(Sender: TObject);
begin
  if Form2.CheckBox_ShowPL.Checked = False then
  begin
    form1.TabPlayList.Width := 0;
    form1.Constraints.MinHeight := 600;
    form1.Constraints.MaxWidth := 240;
    form1.Constraints.MinWidth := 240;
    form1.ShowPLMenu.Checked := False;
    form1.Width := 240;
  end;
  if Form2.CheckBox_ShowPL.Checked = True then
  begin
    form1.Constraints.MinHeight := 600;
    form1.Constraints.MaxWidth := 0;
    form1.Constraints.MinWidth := 240;
    form1.ShowPLMenu.Checked := True;
    form1.Width := 570;
  end;
  SpeedButton1.Enabled := True;
  application.ProcessMessages;

end;

procedure TForm2.TrayIconClick(Sender: TObject);
begin
  form1.TrayIcon1.Visible := TrayIcon.Checked;
  Form2.TrayIconMinimize.Enabled := TrayIcon.Checked;

  if Form2.TrayIcon.Checked = False then
  begin
    Form2.TrayIconMinimize.Checked := False;
  end;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.TrayIconMinimizeClick(Sender: TObject);
begin
  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

{ procedure RemoveEQ;
  var
  i: Integer;
  begin
  for i := 0 to 9 do
  begin
  BASS_ChannelRemoveFX(Channel, Fx[i]);
  application.ProcessMessages;
  end;
  //EQEnable := False;
  end; }

procedure TForm2.chEqualizerClick(Sender: TObject);
begin
  boxEQSelect.Enabled := chEqualizer.Checked;
  TrackBar5.Enabled := chEqualizer.Checked;
  TrackBar4.Enabled := chEqualizer.Checked;
  TrackBar13.Enabled := chEqualizer.Checked;
  TrackBar6.Enabled := chEqualizer.Checked;
  TrackBar9.Enabled := chEqualizer.Checked;
  TrackBar8.Enabled := chEqualizer.Checked;
  TrackBar7.Enabled := chEqualizer.Checked;
  TrackBar12.Enabled := chEqualizer.Checked;
  TrackBar10.Enabled := chEqualizer.Checked;
  TrackBar11.Enabled := chEqualizer.Checked;
  application.ProcessMessages;
  if chEqualizer.Checked = True then
  begin
    BASS_RestoreSoundEffect;
    Include(SNDEffects, seEqualizer);
    BASS_SetSoundEffects(SNDEffects);
    application.ProcessMessages;
  end;
  if chEqualizer.Checked = False then
  begin
    BASS_RestoreSoundEffect;
    Exclude(SNDEffects, seEqualizer);
    BASS_SetSoundEffects(SNDEffects);
    // RemoveEQ;
    application.ProcessMessages;
  end;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.chFlangeClick(Sender: TObject);
begin
  if chFlange.Checked = True then
  begin
    Include(SNDEffects, seFlange);
    BASS_SetSoundEffects(SNDEffects);
    application.ProcessMessages;
  end;
  if chFlange.Checked = False then
  begin
    Exclude(SNDEffects, seFlange);
    BASS_SetSoundEffects(SNDEffects);
    application.ProcessMessages;
  end;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.chReverbClick(Sender: TObject);
begin
  if chReverb.Checked = True then
  begin
    Include(SNDEffects, seReverb);
    BASS_SetSoundEffects(SNDEffects);
    application.ProcessMessages;
  end;
  if chReverb.Checked = False then
  begin
    Exclude(SNDEffects, seReverb);
    BASS_SetSoundEffects(SNDEffects);
    application.ProcessMessages;
  end;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.Error(const ErrMsg: string);
begin
  MessageBox(Handle, PChar(ErrMsg), PChar(application.Title), MB_ICONWARNING or
    MB_SYSTEMMODAL);
end;

procedure TForm2.BASS_SetDefaultSoundEffect(const SNDEffects: TSNDEffects);
begin
  if seFlange in SNDEffects then
  begin
    with FlangeParam do
    begin
      fWetDryMix := 0;
      fDepth := 25;
      fFeedback := 0;
      fFrequency := 0;
      lWaveform := 1;
      fDelay := 0;
      lPhase := 0;
    end;
    application.ProcessMessages;
  end;

  if seChorus in SNDEffects then
  begin
    with ChorusParam do
    begin
      fWetDryMix := 0;
      fDepth := 25;
      fFeedback := 0;
      fFrequency := 0;
      lWaveform := 1;
      fDelay := 0;
      lPhase := 0;
    end;
    application.ProcessMessages;
  end;

  if seEcho in SNDEffects then
  begin
    with EchoParam do
    begin
      fWetDryMix := 0;
      fFeedback := 0;
      fLeftDelay := 333;
      fRightDelay := 333;
      lPanDelay := False;
    end;
    application.ProcessMessages;
  end;

  if seReverb in SNDEffects then
  begin
    with ReverbParam do
    begin
      fInGain := 0;
      fReverbMix := 0;
      fReverbTime := 1000;
      fHighFreqRTRatio := 0.001;
    end;
    application.ProcessMessages;
  end;

  if seEqualizer in SNDEffects then
  begin
    EQParam.fBandwidth := 5; // 2.5; // 5
    application.ProcessMessages;
  end;
end;

procedure TForm2.Language;
var
  Ini: TMemIniFile;
  lang: string;
  lvItem: TListItem;
begin
  try
    Ini := TMemIniFile.Create(ExtractFilePath(Paramstr(0)) +
      'Data\Audio Player.ini');
    lang := Ini.ReadString('Option2', 'Language', '');
    lvItem := Form2.ListView1.FindCaption(0, lang, True, True, False);
    if lvItem <> nil then
    begin
      Form2.ListView1.Selected := lvItem;
      lvItem.MakeVisible(True);
      lvItem.Selected := True;
      lvItem.Focused := True;
      application.ProcessMessages;
    end;
    Ini.Free;
  except
  end;
end;

{ procedure TForm2.Theme;
  var
  Ini: TMemIniFile;
  lvItem: TListItem;
  Theme: string;
  begin
  try
  Ini := TMemIniFile.Create(ExtractFilePath(Paramstr(0)) +
  'Data\Audio Player.ini');
  application.ProcessMessages;
  Theme := Ini.ReadString('Option2', 'Theme', '');
  application.ProcessMessages;
  lvItem := Form2.ListView_Theme.FindCaption(0, Theme, True, True, False);
  application.ProcessMessages;
  if lvItem <> nil then
  begin
  Form2.ListView_Theme.Selected := lvItem;
  lvItem.MakeVisible(True);
  lvItem.Selected := True;
  lvItem.Focused := True;
  application.ProcessMessages;
  end;
  Ini.Free;
  except
  end;
  end; }

procedure TForm2.LoadNastr2;
var
  Ini: TMemIniFile;
  i: Integer;
  Internat: TInternationalization;
begin
  try
    Ini := TMemIniFile.Create(ExtractFilePath(Paramstr(0)) +
      'Data\Audio Player.ini');
    // Основные
    Language;
    application.ProcessMessages;
    for i := 0 to Screen.FormCount - 1 do
      Internat.Execute(Screen.Forms[i]);
    application.ProcessMessages;
    form1.ThemeDark.Checked := Ini.ReadBool('Option',
      form1.ThemeDark.Name, False);
    if form1.ThemeDark.Checked = True then
    begin
      form1.ThemeDarkClick(self);
    end;
    form1.ThemeLight.Checked := Ini.ReadBool('Option',
      form1.ThemeLight.Name, False);
    if form1.ThemeLight.Checked = True then
    begin
      form1.ThemeLightClick(self);
    end;

    form1.ThemeLuna.Checked := Ini.ReadBool('Option',
      form1.ThemeLuna.Name, False);
    if form1.ThemeLuna.Checked = True then
    begin
      form1.Luna1Click(self);
    end;

    form1.ThemeAuto.Checked := Ini.ReadBool('Option',
      form1.ThemeAuto.Name, False);
    if form1.ThemeAuto.Checked = True then
    begin
      form1.ThemeAutoClick(self);
    end;

    { form1.N65.Checked := Ini.ReadBool('Option', form1.N65.Name, False);
      if form1.N65.Checked = True then
      begin
      form1.N65Click(self);
      end; }

    DragAcceptFiles(form1.Handle, True);
    Form2.top := Ini.ReadInteger('Option2', 'Top', Form2.top);
    Form2.left := Ini.ReadInteger('Option2', 'Left', Form2.left);
    ProgressBox.Checked := Ini.ReadBool('Option2', ProgressBox.Name, False);
    RandomTrack.Checked := Ini.ReadBool('Option2', RandomTrack.Name, False);
    // RandomTrackClick(self);
    // TopTrackGo.Checked := Ini.ReadBool('Option2', TopTrackGo.Name, False);
    TaskTrackGo.Checked := Ini.ReadBool('Option2', TaskTrackGo.Name, False);
    TaskTrackGoClick(self);
    AutoNext.Checked := Ini.ReadBool('Option2', AutoNext.Name, False);
    CheckBox_SavePlaylist.Checked := Ini.ReadBool('Option2',
      CheckBox_SavePlaylist.Name, False);

    BaloonWindow.Checked := Ini.ReadBool('Option2', BaloonWindow.Name, False);
    TrayIcon.Checked := Ini.ReadBool('Option2', TrayIcon.Name, False);
    TrayIconMinimize.Checked := Ini.ReadBool('Option2',
      TrayIconMinimize.Name, False);
    TrayIconClick(self);
    CheckBox_LinesPL.Checked := Ini.ReadBool('Option2',
      CheckBox_LinesPL.Name, False);
    CheckBox_LinesPLClick(self);
    CheckBox_ShowPL.Checked := Ini.ReadBool('Option2',
      CheckBox_ShowPL.Name, False);
    CheckBox_ShowPLClick(self);

    { PLPosition_Left.Checked := Ini.ReadBool('Option2',
      PLPosition_Left.Name, False);
      PLPosition_Right.Checked := Ini.ReadBool('Option2',
      PLPosition_Right.Name, False);
      PLPosition_Bottom.Checked := Ini.ReadBool('Option2',
      PLPosition_Bottom.Name, False);
      PLPosition_Top.Checked := Ini.ReadBool('Option2',
      PLPosition_Top.Name, False);
      if PLPosition_Right.Checked = True then
      begin
      PLPosition_RightClick(self);
      end;
      if PLPosition_Left.Checked = True then
      begin
      PLPosition_LeftClick(self);
      end;
      if PLPosition_Bottom.Checked = True then
      begin
      PLPosition_BottomClick(self);
      end;
      if PLPosition_Top.Checked = True then
      begin
      PLPosition_TopClick(self);
      end; }

    // обложка файла
    ShowCoverArts.Checked := Ini.ReadBool('Option2', ShowCoverArts.Name, False);
    ShowCoverArtsClick(self);
    application.ProcessMessages;
    // Звук
    RadioButton_Player.Checked := Ini.ReadBool('Option2',
      RadioButton_Player.Name, False);
    RadioButton_System.Checked := Ini.ReadBool('Option2',
      RadioButton_System.Name, False);
    application.ProcessMessages;
    if RadioButton_Player.Checked = True then
    begin
      RadioButton_PlayerClick(self);
    end;
    if RadioButton_System.Checked = True then
    begin
      RadioButton_SystemClick(self);
    end;
    // Эквалайзер
    BASS_SetDefaultSoundEffect([seFlange, seChorus, seEcho, seReverb,
      seEqualizer]);
    chEqualizer.Checked := Ini.ReadBool('Option2', chEqualizer.Name, False);
    chEqualizerClick(self);
    boxEQSelect.ItemIndex := Ini.ReadInteger('Option2', boxEQSelect.Name,
      boxEQSelect.ItemIndex);
    boxEQSelectChange(self);
    RepeatSong.Checked := Ini.ReadBool('Option2', RepeatSong.Name, False);
    RepeatSongClick(self);
    application.ProcessMessages;
    chFlange.Checked := Ini.ReadBool('Option2', chFlange.Name, False);
    chChorus.Checked := Ini.ReadBool('Option2', chChorus.Name, False);
    chEcho.Checked := Ini.ReadBool('Option2', chEcho.Name, False);
    chReverb.Checked := Ini.ReadBool('Option2', chReverb.Name, False);
    BassEF.Checked := Ini.ReadBool('Option2', BassEF.Name, False);
    RotateEF.Checked := Ini.ReadBool('Option2', RotateEF.Name, False);
    application.ProcessMessages;

    RepeatSong.Checked := Ini.ReadBool('Option2', RepeatSong.Name, False);
    RepeatSongClick(self);
    application.ProcessMessages;
    // цвет

    { CheckBox_ShowPeak.Checked := Ini.ReadBool('Option2',
      CheckBox_ShowPeak.Name, False);
      CheckBox_ShowPeakClick(self);
      CheckBox_ShowBlock.Checked := Ini.ReadBool('Option2',
      CheckBox_ShowBlock.Name, False);
      CheckBox_ShowBlockClick(self); }

    // общие     HotKey
    HotKey_Next.HotKey := Ini.ReadInteger('Option2', HotKey_Next.Name,
      HotKey_Next.HotKey);
    HotKey_NextChange(self);
    HotKey_Prev.HotKey := Ini.ReadInteger('Option2', HotKey_Prev.Name,
      HotKey_Prev.HotKey);
    HotKey_PrevChange(self);
    HotKey_Start.HotKey := Ini.ReadInteger('Option2', HotKey_Start.Name,
      HotKey_Start.HotKey);
    HotKey_StartChange(self);
    HotKey_FileInfo.HotKey := Ini.ReadInteger('Option2', HotKey_FileInfo.Name,
      HotKey_FileInfo.HotKey);
    HotKey_FileInfoChange(self);
    HotKey_Play.HotKey := Ini.ReadInteger('Option2', HotKey_Play.Name,
      HotKey_Play.HotKey);
    HotKey_PlayChange(self);
    HotKey_Option.HotKey := Ini.ReadInteger('Option2', HotKey_Option.Name,
      HotKey_Option.HotKey);
    HotKey_OptionChange(self);
    application.ProcessMessages;
    // Плейлист
    HotKey_AddPL.HotKey := Ini.ReadInteger('Option2', HotKey_AddPL.Name,
      HotKey_AddPL.HotKey);
    HotKey_AddPLChange(self);
    HotKey_OpenPL.HotKey := Ini.ReadInteger('Option2', HotKey_OpenPL.Name,
      HotKey_OpenPL.HotKey);
    HotKey_OpenPLChange(self);
    HotKey_SavePL.HotKey := Ini.ReadInteger('Option2', HotKey_SavePL.Name,
      HotKey_SavePL.HotKey);
    HotKey_SavePLChange(self);
    HotKey_ClearSpisok.HotKey := Ini.ReadInteger('Option2',
      HotKey_ClearSpisok.Name, HotKey_ClearSpisok.HotKey);
    HotKey_ClearSpisokChange(self);
    HotKey_ClearHistory.HotKey := Ini.ReadInteger('Option2',
      HotKey_ClearHistory.Name, HotKey_ClearHistory.HotKey);
    HotKey_ClearHistoryChange(self);
    application.ProcessMessages;
    // файлы
    HotKey_DelFile.HotKey := Ini.ReadInteger('Option2', HotKey_DelFile.Name,
      HotKey_DelFile.HotKey);
    HotKey_DelFileChange(self);
    HotKey_DelFilePL.HotKey := Ini.ReadInteger('Option2', HotKey_DelFilePL.Name,
      HotKey_DelFilePL.HotKey);
    HotKey_DelFilePLChange(self);
    HotKey_DuplFile.HotKey := Ini.ReadInteger('Option2', HotKey_DuplFile.Name,
      HotKey_DuplFile.HotKey);
    HotKey_DuplFileChange(self);
    HotKey_NonEx.HotKey := Ini.ReadInteger('Option2', HotKey_NonEx.Name,
      HotKey_NonEx.HotKey);
    HotKey_NonExChange(self);
    HotKey_BrowseFile.HotKey := Ini.ReadInteger('Option2',
      HotKey_BrowseFile.Name, HotKey_BrowseFile.HotKey);
    HotKey_BrowseFileChange(self);
    application.ProcessMessages;
    // **
    HotKey_AddFile.HotKey := Ini.ReadInteger('Option2', HotKey_AddFile.Name,
      HotKey_AddFile.HotKey);
    HotKey_AddFileChange(self);
    HotKey_AddFolder.HotKey := Ini.ReadInteger('Option2', HotKey_AddFolder.Name,
      HotKey_AddFolder.HotKey);
    HotKey_AddFolderChange(self);
    HotKey_AddURL.HotKey := Ini.ReadInteger('Option2', HotKey_AddURL.Name,
      HotKey_AddURL.HotKey);
    HotKey_AddURLChange(self);

    { HotKey_Sound.HotKey := Ini.ReadInteger('Option2', HotKey_Sound.Name,
      HotKey_Sound.HotKey);
      HotKey_SoundChange(self);
      HotKey_Repeat.HotKey := Ini.ReadInteger('Option2', HotKey_Repeat.Name,
      HotKey_Repeat.HotKey);
      HotKey_RepeatChange(self);
      HotKey_Random.HotKey := Ini.ReadInteger('Option2', HotKey_Random.Name,
      HotKey_Random.HotKey);
      HotKey_RandomChange(self); }

    // ***

    //form1.Timer_TaskTrackGo.Enabled := False;

    Form5.CheckBox_ClearPath.Checked := Ini.ReadBool('Option2',
      Form5.CheckBox_ClearPath.Name, False);
    Form5.CheckBox_CloseForm.Checked := Ini.ReadBool('Option2',
      Form5.CheckBox_CloseForm.Name, False);
    application.ProcessMessages;
    Ini.Free;
  except
  end;
end;

procedure TForm2.ProgressBoxClick(Sender: TObject);
begin
  if Form2.ProgressBox.Checked = True then
  begin
    Unit_Win7Taskbar.SetTaskbarProgressState(tbpsNormal);
    Unit_Win7Taskbar.SetTaskbarOverlayIcon(form1.ImageList2, 0, '');
    Unit_Win7Taskbar.SetTaskbarProgressValue(form1.barSeek.Position,
      form1.barSeek.Max);
    application.ProcessMessages;
  end;
  if Form2.ProgressBox.Checked = False then
  begin
    Unit_Win7Taskbar.SetTaskbarProgressState(tbpsNone);
    application.ProcessMessages;
  end;
  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.SaveNastr2;
var
  Ini: TMemIniFile;
begin
  try
    CreateDir(ExtractFilePath(Paramstr(0)) + 'Data');
    Ini := TMemIniFile.Create(ExtractFilePath(Paramstr(0)) +
      'Data\Audio Player.ini');
    application.ProcessMessages;
    Ini.WriteInteger('Option2', 'Top', Form2.top);
    Ini.WriteInteger('Option2', 'Left', Form2.left);

    Ini.WriteBool('Option2', ProgressBox.Name, ProgressBox.Checked);
    Ini.WriteBool('Option2', RandomTrack.Name, RandomTrack.Checked);
    // Ini.WriteBool('Option2', TopTrackGo.Name, TopTrackGo.Checked);
    Ini.WriteBool('Option2', TaskTrackGo.Name, TaskTrackGo.Checked);
    Ini.WriteBool('Option2', AutoNext.Name, AutoNext.Checked);
    Ini.WriteBool('Option2', chEqualizer.Name, chEqualizer.Checked);
    Ini.WriteBool('Option2', RepeatSong.Name, RepeatSong.Checked);
    Ini.WriteBool('Option2', CheckBox_SavePlaylist.Name,
      CheckBox_SavePlaylist.Checked);
    Ini.WriteBool('Option2', ShowCoverArts.Name, ShowCoverArts.Checked);
    Ini.WriteBool('Option2', BaloonWindow.Name, BaloonWindow.Checked);
    Ini.WriteBool('Option2', TrayIcon.Name, TrayIcon.Checked);
    Ini.WriteBool('Option2', TrayIconMinimize.Name, TrayIconMinimize.Checked);
    { Ini.WriteBool('Option2', PLPosition_Right.Name, PLPosition_Right.Checked);
      Ini.WriteBool('Option2', PLPosition_Left.Name, PLPosition_Left.Checked);
      Ini.WriteBool('Option2', PLPosition_Bottom.Name, PLPosition_Bottom.Checked);
      Ini.WriteBool('Option2', PLPosition_Top.Name, PLPosition_Top.Checked); }
    Ini.WriteBool('Option2', CheckBox_LinesPL.Name, CheckBox_LinesPL.Checked);
    Ini.WriteBool('Option2', CheckBox_ShowPL.Name, CheckBox_ShowPL.Checked);

    Ini.WriteBool('Option2', RadioButton_Player.Name,
      RadioButton_Player.Checked);
    Ini.WriteBool('Option2', RadioButton_System.Name,
      RadioButton_System.Checked);
    Ini.WriteBool('Option2', chFlange.Name, chFlange.Checked);
    Ini.WriteBool('Option2', chChorus.Name, chChorus.Checked);
    Ini.WriteBool('Option2', chEcho.Name, chEcho.Checked);
    Ini.WriteBool('Option2', chReverb.Name, chReverb.Checked);
    Ini.WriteBool('Option2', BassEF.Name, BassEF.Checked);
    Ini.WriteBool('Option2', RotateEF.Name, RotateEF.Checked);
    Ini.WriteInteger('Option2', boxEQSelect.Name, boxEQSelect.ItemIndex);
    // Визуализация звука
    // Ini.WriteBool('Option2', VisualBox.Name, VisualBox.Checked);
    // Ini.WriteBool('Option2', CheckBox_ShowPeak.Name, CheckBox_ShowPeak.Checked);
    { Ini.WriteBool('Option2', CheckBox_ShowBlock.Name,
      CheckBox_ShowBlock.Checked);
      Ini.WriteString('Option2', ColorBox_Line.Name,
      ColorToString(ColorBox_Line.Selected));
      Ini.WriteString('Option2', ColorBox_BackColor.Name,
      ColorToString(ColorBox_BackColor.Selected));
      Ini.WriteString('Option2', ColorBox_Peak.Name,
      ColorToString(ColorBox_Peak.Selected)); }
    // Общее HotKey
    Ini.WriteInteger('Option2', HotKey_Next.Name, HotKey_Next.HotKey);
    Ini.WriteInteger('Option2', HotKey_Prev.Name, HotKey_Prev.HotKey);
    Ini.WriteInteger('Option2', HotKey_Start.Name, HotKey_Start.HotKey);
    Ini.WriteInteger('Option2', HotKey_FileInfo.Name,
      Form2.HotKey_FileInfo.HotKey);
    Ini.WriteInteger('Option2', Form2.HotKey_Play.Name,
      Form2.HotKey_Play.HotKey);
    Ini.WriteInteger('Option2', HotKey_Option.Name, HotKey_Option.HotKey);
    // Плейлист
    Ini.WriteInteger('Option2', HotKey_AddPL.Name, HotKey_AddPL.HotKey);
    Ini.WriteInteger('Option2', HotKey_OpenPL.Name, HotKey_OpenPL.HotKey);
    Ini.WriteInteger('Option2', HotKey_SavePL.Name, HotKey_SavePL.HotKey);
    Ini.WriteInteger('Option2', HotKey_ClearSpisok.Name,
      HotKey_ClearSpisok.HotKey);
    Ini.WriteInteger('Option2', HotKey_ClearHistory.Name,
      HotKey_ClearHistory.HotKey);
    // файлы
    Ini.WriteInteger('Option2', HotKey_DelFile.Name, HotKey_DelFile.HotKey);
    Ini.WriteInteger('Option2', HotKey_DelFilePL.Name, HotKey_DelFilePL.HotKey);
    Ini.WriteInteger('Option2', HotKey_NonEx.Name, HotKey_NonEx.HotKey);
    Ini.WriteInteger('Option2', HotKey_DuplFile.Name, HotKey_DuplFile.HotKey);
    Ini.WriteInteger('Option2', HotKey_BrowseFile.Name,
      HotKey_BrowseFile.HotKey);
    // **
    Ini.WriteInteger('Option2', HotKey_AddFile.Name, HotKey_AddFile.HotKey);
    Ini.WriteInteger('Option2', HotKey_AddFolder.Name, HotKey_AddFolder.HotKey);
    Ini.WriteInteger('Option2', HotKey_AddURL.Name, HotKey_AddURL.HotKey);

    { Ini.WriteInteger('Option2', HotKey_Sound.Name, HotKey_Sound.HotKey);
      Ini.WriteInteger('Option2', HotKey_Repeat.Name, HotKey_Repeat.HotKey);
      Ini.WriteInteger('Option2', HotKey_Random.Name, HotKey_Random.HotKey); }

    Ini.WriteString('Option2', 'Language', Form2.ListView1.Selected.Caption);

    Ini.WriteBool('Option2', Form5.CheckBox_ClearPath.Name,
      Form5.CheckBox_ClearPath.Checked);
    Ini.WriteBool('Option2', Form5.CheckBox_CloseForm.Name,
      Form5.CheckBox_CloseForm.Checked);
    Ini.UpdateFile;
    Ini.Free;
  except
  end;
end;

procedure TForm2.ListFileDir(Path, Ext: string; HideExt: Boolean);
var
  SR: TSearchRec;
  ListItem: TListItem;
  ShInfo: TSHFileInfo;
begin
  if FindFirst(Path + Ext, faAnyFile, SR) = 0 then
  begin
    repeat
      if (SR.Attr <> faDirectory) then
        if HideExt then
        begin
          // удаляем расширение
          delete(SR.Name, Length(SR.Name) - 3, 4);
          application.ProcessMessages;
          ListItem := Form2.ListView1.Items.Add;
          application.ProcessMessages;
          Path := StringReplace(Path + '\', '\\', '\', [rfReplaceAll]);
          SHGetFileInfo(PChar(Path + 'icons\' + form1.ExtractOnlyFileName
            (SR.Name) + '.ico'), 0, ShInfo, sizeof(ShInfo), SHGFI_TYPENAME or
            SHGFI_SYSICONINDEX);
          with ListItem do
          begin
            Caption := form1.ExtractOnlyFileName(SR.Name);
            application.ProcessMessages;
            ImageIndex := ShInfo.iIcon;
          end;
        end
        else
          ListItem := Form2.ListView1.Items.Add;
      application.ProcessMessages;
      with ListItem do
      begin
        Caption := form1.ExtractOnlyFileName(SR.Name);
        application.ProcessMessages;
        ImageIndex := ShInfo.iIcon;
      end;

    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;

procedure TForm2.ListView1Click(Sender: TObject);
begin
  Label2.Caption := ListView1.Selected.Caption;
  application.ProcessMessages;
  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

{ procedure TForm2.ListView_ThemeSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
  begin
  try
  Form2.SaveNastr2;
  form2.SpeedButton1.Enabled := True;
  application.ProcessMessages;
  sm.TrySetStyle(form2.ListView_Theme.Selected.Caption, False);
  sm.Free;
  form1.TrimWorkingSet;
  application.ProcessMessages;
  DragAcceptFiles(form1.Handle, True);
  application.ProcessMessages;
  except
  end;
  end; }

procedure TForm2.createicon;
var
  SysImageList: UINT;
  SFI: TSHFileInfo;
begin
  ListView1.LargeImages := TImageList.Create(self);
  ListView1.SmallImages := TImageList.Create(self);
  application.ProcessMessages;
  SysImageList := SHGetFileInfo('', 0, SFI, sizeof(TSHFileInfo),
    SHGFI_SYSICONINDEX or SHGFI_LARGEICON);
  if SysImageList <> 0 then
  begin
    ListView1.LargeImages.Handle := SysImageList;
    ListView1.LargeImages.ShareImages := True;
    application.ProcessMessages;
  end;
  SysImageList := SHGetFileInfo('', 0, SFI, sizeof(TSHFileInfo),
    SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
  if SysImageList <> 0 then
  begin
    ListView1.SmallImages.Handle := SysImageList;
    ListView1.SmallImages.ShareImages := True;
    application.ProcessMessages;
  end;

  ListView3.LargeImages := TImageList.Create(self);
  ListView3.SmallImages := TImageList.Create(self);
  application.ProcessMessages;
  SysImageList := SHGetFileInfo('', 0, SFI, sizeof(TSHFileInfo),
    SHGFI_SYSICONINDEX or SHGFI_LARGEICON);
  if SysImageList <> 0 then
  begin
    ListView3.LargeImages.Handle := SysImageList;
    ListView3.LargeImages.ShareImages := True;
    application.ProcessMessages;
  end;
  SysImageList := SHGetFileInfo('', 0, SFI, sizeof(TSHFileInfo),
    SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
  if SysImageList <> 0 then
  begin
    ListView3.SmallImages.Handle := SysImageList;
    ListView3.SmallImages.ShareImages := True;
    application.ProcessMessages;
  end;
end;

function getFileDescription(FName: TFileName): string;
type
  TLangChrSet = array [0 .. 1] of word;
  PLangChrset = ^TLangChrSet;
var
  S: string;
  n, Len: Cardinal;
  Buf, Value: PChar;
  LangChrSet: PLangChrset;
begin
  Result := '';
  S := PChar(FName);
  n := GetFileVersionInfoSize(PChar(S), n);
  if n = 0 then
    Exit;
  Buf := AllocMem(n);
  GetFileVersionInfo(PChar(S), 0, n, Buf);
  VerQueryValue(Buf, PChar('VarFileInfo\Translation'),
    pointer(LangChrSet), Len);
  S := PChar(Format('%.4x%.4x', [LangChrSet^[0], LangChrSet^[1]]));
  if (S = '00000000') or (S = '040904E2') then
    S := '040904E4';
  if VerQueryValue(Buf, PChar('StringFileInfo\' + S + '\FileDescription'),
    pointer(Value), Len) then
    Result := Value;
  FreeMem(Buf, n);
end;

function getCompanyName(FName: TFileName): string;
type
  TLangChrSet = array [0 .. 1] of word;
  PLangChrset = ^TLangChrSet;
var
  S: string;
  n, Len: Cardinal;
  Buf, Value: PChar;
  LangChrSet: PLangChrset;
begin
  Result := '';
  S := PChar(FName);
  n := GetFileVersionInfoSize(PChar(S), n);
  if n = 0 then
    Exit;
  Buf := AllocMem(n);
  GetFileVersionInfo(PChar(S), 0, n, Buf);
  VerQueryValue(Buf, PChar('VarFileInfo\Translation'),
    pointer(LangChrSet), Len);
  S := PChar(Format('%.4x%.4x', [LangChrSet^[0], LangChrSet^[1]]));
  if (S = '00000000') or (S = '040904E2') then
    S := '040904E4';
  if VerQueryValue(Buf, PChar('StringFileInfo\' + S + '\CompanyName'),
    pointer(Value), Len) then
    Result := Value;
  FreeMem(Buf, n);
end;

function GetFileVersion(FName: TFileName): string;
type
  TLangChrSet = array [0 .. 1] of word;
  PLangChrset = ^TLangChrSet;
var
  S: string;
  n, Len: Cardinal;
  Buf, Value: PChar;
  LangChrSet: PLangChrset;
begin
  Result := '';
  S := PChar(FName);
  n := GetFileVersionInfoSize(PChar(S), n);
  if n = 0 then
    Exit;
  Buf := AllocMem(n);
  GetFileVersionInfo(PChar(S), 0, n, Buf);
  VerQueryValue(Buf, PChar('VarFileInfo\Translation'),
    pointer(LangChrSet), Len);
  S := PChar(Format('%.4x%.4x', [LangChrSet^[0], LangChrSet^[1]]));
  if (S = '00000000') or (S = '040904E2') then
    S := '040904E4';
  if VerQueryValue(Buf, PChar('StringFileInfo\' + S + '\FileVersion'),
    pointer(Value), Len) then
    Result := Value;
  FreeMem(Buf, n);
end;

procedure TForm2.Find_Plugins(Path, Ext: string; HideExt: Boolean);
var
  SR: TSearchRec;
  ListItem: TListItem;
  ShInfo: TSHFileInfo;
  PUTI: string;
begin
  try
    if FindFirst(Path + Ext, faAnyFile, SR) = 0 then
    begin
      repeat
        if (SR.Attr <> faDirectory) then
          ListItem := Form2.ListView3.Items.Add;
        application.ProcessMessages;
        Path := StringReplace(Path + '\', '\\', '\', [rfReplaceAll]);
        application.ProcessMessages;
        PUTI := Path + SR.Name;
        application.ProcessMessages;
        SHGetFileInfo(PChar(PUTI), 0, ShInfo, sizeof(ShInfo), SHGFI_TYPENAME or
          SHGFI_SYSICONINDEX);
        with ListItem do
        begin
          Caption := SR.Name;
          application.ProcessMessages;
          // Caption:=getFileDescription(PUTI);
          SubItems.Add(getFileDescription(PUTI));
          application.ProcessMessages;
          SubItems.Add(GetFileVersion(PUTI));
          application.ProcessMessages;
          ImageIndex := ShInfo.iIcon;
        end;
      until FindNext(SR) <> 0;
      FindClose(SR);
    end;
  except
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  TreeView1.FullExpand;
  // GetTheme;
  // application.ProcessMessages;
  Unit_Win7Taskbar.InitializeTaskbarAPI;
  application.ProcessMessages;

  if (HiWord(Bass_GetVersion) <> BASSVERSION) then
  begin
    MessageBox(0, PChar(MSGBASS.Caption), nil, MB_ICONERROR);
    Halt;
  end;
  BASS_SetConfig(BASS_CONFIG_FLOATDSP, 1);
  // Инициализация аудио - по умолчанию, 44100hz, stereo, 16 bits
  if not BASS_Init(-1, 44100, BASS_UNICODE, Handle, nil) then
  begin
    MessageBox(0, PChar(MSGAudio.Caption), nil, MB_ICONERROR);
    Halt;
  end
  else
    BASS_Start;
  BASS_PluginLoad(PChar(ExtractFilePath(Paramstr(0)) + 'bass.dll'),
    BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(Paramstr(0)) + 'Plugins\bass_aac.dll'),
    BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(Paramstr(0)) + 'Plugins\bass_ac3.dll'),
    BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(Paramstr(0)) + 'Plugins\bass_alac.dll'),
    BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(Paramstr(0)) + 'Plugins\bass_ape.dll'),
    BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(Paramstr(0)) + 'Plugins\bass_fx.dll'),
    BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(Paramstr(0)) + 'Plugins\bass_flac.dll'),
    BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(Paramstr(0)) + 'Plugins\bass_hls.dll'),
    BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(Paramstr(0)) + 'Plugins\bass_midi.dll'),
    BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(Paramstr(0)) + 'Plugins\bass_mpc.dll'),
    BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(Paramstr(0)) + 'Plugins\bass_ofr.dll'),
    BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(Paramstr(0)) + 'Plugins\bass_opus.dll'),
    BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(Paramstr(0)) + 'Plugins\bass_spx.dll'),
    BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(Paramstr(0)) + 'Plugins\bass_tta.dll'),
    BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(Paramstr(0)) + 'Plugins\BASSMOD.dll'),
    BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(Paramstr(0)) + 'Plugins\bass_wma.dll'),
    BASS_UNICODE);
  BASS_PluginLoad(PChar(ExtractFilePath(Paramstr(0)) + 'Plugins\bass_wv.dll'),
    BASS_UNICODE);
  application.ProcessMessages;

  Channel := 0;
  BASS_GetInfo(BassInfo);
  if BassInfo.dsver < 8 then
  begin
    Error(MSGDirectX.Caption);
    DIRECTX_80_NOT_INSTALLED := True;
    application.ProcessMessages;
  end;
  EAX_SUPPORTED := BassInfo.eax;
  { if EAX_SUPPORTED then
    BASS_SetEAXParameters(EAX_ENVIRONMENT_PSYCHOTIC, 1, 20, 2); }
  BASS_SetDefaultSoundEffect([seFlange, seChorus, seEcho, seReverb,
    seEqualizer]);
  BASS_SetConfig(BASS_CONFIG_NET_PLAYLIST, 1);
  BASS_SetConfig(BASS_CONFIG_NET_PREBUF, 1000);
  BASS_SetConfig(BASS_CONFIG_NET_BUFFER, 1000);
  BASS_SetConfig(BASS_CONFIG_NET_TIMEOUT, 5000);
  BASS_SetConfig(BASS_CONFIG_BUFFER, 1000);
  createicon;
  application.ProcessMessages;
  ListFileDir(ExtractFilePath(Paramstr(0)) + 'language\', '*.ini', True);
  application.ProcessMessages;
  Find_Plugins(ExtractFilePath(Paramstr(0)) + 'Plugins\', '*.dll', False);
  application.ProcessMessages;
  Find_Plugins(ExtractFilePath(Paramstr(0)), '*.dll', False);
  application.ProcessMessages;
  LoadNastr2;
  application.ProcessMessages;
  A1.TabVisible := False;
  A2.TabVisible := False;
  A3.TabVisible := False;
  A4.TabVisible := False;
  A5.TabVisible := False;
  A6.TabVisible := False;
  // A7.TabVisible := False;
  A8.TabVisible := False;
  B1.TabVisible := False;
  B2.TabVisible := False;
  PageControl1.ActivePageIndex := 0;
  TreeView1.Selected := TreeView1.Items[PageControl1.ActivePageIndex];
  try
    TreeView1.SetFocus;
  except
  end;
  application.ProcessMessages;
  if form1.ThemeDark.Checked then
  begin
    ListView1.GridLines := False;
    ListView3.GridLines := False;
  end;
  if form1.ThemeLight.Checked then
  begin
    ListView1.GridLines := True;
    ListView3.GridLines := True;
  end;

end;

procedure TForm2.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Form2.HotKey_Play.HotKey := vk_return;
  end;
  if Key = #27 then
  begin
    Form2.Close;
  end;
end;

procedure TForm2.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
  application.ProcessMessages;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  try
    SetWindowPos(Handle, HWND_TOPMOST, left, top, Width, Height,
      SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
    Form2.TreeView1.Selected := Form2.TreeView1.Items
      [Form2.PageControl1.ActivePageIndex];
    application.ProcessMessages;
    Form2.TreeView1.SetFocus;
    application.ProcessMessages;
    Form2.Language;
    application.ProcessMessages;
    // Form2.Theme;
    // application.ProcessMessages;
    { Form2.LoadNastr2;
      application.ProcessMessages; }
    // Form2.Label1.Caption := Form2.ListView_Theme.Selected.Caption;
    application.ProcessMessages;
    Form2.Label2.Caption := Form2.ListView1.Selected.Caption;
    application.ProcessMessages;
    Form2.SpeedButton1.Enabled := False;
    application.ProcessMessages;
  except
  end;
end;

procedure TForm2.GroupBox10MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
  application.ProcessMessages;
end;

procedure TForm2.GroupBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
  application.ProcessMessages;
end;

procedure TForm2.GroupBox3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
  application.ProcessMessages;
end;

procedure TForm2.GroupBox4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
  application.ProcessMessages;
end;

procedure TForm2.GroupBox5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
  application.ProcessMessages;
end;

procedure TForm2.GroupBox6MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
  application.ProcessMessages;
end;

procedure TForm2.GroupBox7MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
  application.ProcessMessages;
end;

procedure TForm2.GroupBox8MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
  application.ProcessMessages;
end;

procedure TForm2.GroupBox9MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
  application.ProcessMessages;
end;

procedure TForm2.HotKey_NextChange(Sender: TObject);
begin
  form1.NextTryMenu.ShortCut := HotKey_Next.HotKey;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.HotKey_NonExChange(Sender: TObject);
begin
  form1.N32.ShortCut := HotKey_NonEx.HotKey;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.HotKey_OpenPLChange(Sender: TObject);
begin
  form1.OpenPLMenu.ShortCut := HotKey_OpenPL.HotKey;
  form1.N52.ShortCut := HotKey_OpenPL.HotKey;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.HotKey_OptionChange(Sender: TObject);
begin
  form1.OptionMenu.ShortCut := HotKey_Option.HotKey;
  form1.OptionTryMenu.ShortCut := HotKey_Option.HotKey;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.HotKey_PrevChange(Sender: TObject);
begin
  form1.PrevTryMenu.ShortCut := HotKey_Prev.HotKey;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.HotKey_RandomChange(Sender: TObject);
begin
  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.HotKey_RepeatChange(Sender: TObject);
begin
  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.HotKey_SavePLChange(Sender: TObject);
begin
  form1.SavePLMenu.ShortCut := HotKey_SavePL.HotKey;
  form1.N60.ShortCut := HotKey_SavePL.HotKey;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.HotKey_SoundChange(Sender: TObject);
begin
  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.HotKey_StartChange(Sender: TObject);
begin
  form1.PlayTryMenu.ShortCut := HotKey_Start.HotKey;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.HotKey_AddFileChange(Sender: TObject);
begin
  form1.N35.ShortCut := HotKey_AddFile.HotKey;
  form1.N41.ShortCut := HotKey_AddFile.HotKey;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.HotKey_AddFolderChange(Sender: TObject);
begin
  form1.N36.ShortCut := HotKey_AddFolder.HotKey;
  form1.N42.ShortCut := HotKey_AddFolder.HotKey;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.HotKey_AddPLChange(Sender: TObject);
begin
  form1.AddPLMenu.ShortCut := HotKey_AddPL.HotKey;
  form1.N51.ShortCut := HotKey_AddPL.HotKey;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.HotKey_AddURLChange(Sender: TObject);
begin
  form1.URL2.ShortCut := HotKey_AddURL.HotKey;
  form1.URL1.ShortCut := HotKey_AddURL.HotKey;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.HotKey_ClearHistoryChange(Sender: TObject);
begin
  form1.N11.ShortCut := HotKey_ClearHistory.HotKey;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.HotKey_DelFileChange(Sender: TObject);
begin
  form1.N31.ShortCut := HotKey_DelFile.HotKey;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.HotKey_DuplFileChange(Sender: TObject);
begin
  form1.N34.ShortCut := HotKey_DuplFile.HotKey;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.HotKey_FileInfoChange(Sender: TObject);
begin
  form1.FileInfoMenu.ShortCut := Form2.HotKey_FileInfo.HotKey;
  form1.FileInfoPLMenu.ShortCut := Form2.HotKey_FileInfo.HotKey;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.HotKey_PlayChange(Sender: TObject);
var
  Key: Char;
begin
  if Key = #13 then
  begin
    Form2.HotKey_Play.HotKey := vk_return;
    form1.N7.ShortCut := Form2.HotKey_Play.HotKey;
  end;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.HotKey_ClearSpisokChange(Sender: TObject);
begin
  form1.N33.ShortCut := HotKey_ClearSpisok.HotKey;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.HotKey_BrowseFileChange(Sender: TObject);
begin
  form1.N15.ShortCut := HotKey_BrowseFile.HotKey;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.HotKey_DelFilePLChange(Sender: TObject);
begin
  form1.N21.ShortCut := HotKey_DelFilePL.HotKey;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.HotKey6Change(Sender: TObject);
begin
  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.HotKey7Change(Sender: TObject);
begin
  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
  application.ProcessMessages;
end;

procedure TForm2.Image2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
  application.ProcessMessages;
end;

function fmod(a, B: Single): Single;
begin
  Result := a - (B * Trunc(a / B));
end;

procedure Rotate(Handle: HDSP; Channel: DWORD; Buffer: pointer; Length: DWORD;
  user: pointer); stdcall;
var
  a: DWORD;
  d: PSingle;
begin
  d := Buffer;
  a := 0;
  while (a < (Length div 4)) do
  begin
    d^ := d^ * Abs(Sin(rotpos));
    inc(d);
    d^ := d^ * Abs(Cos(rotpos));
    rotpos := fmod(rotpos + 0.00003, Pi);
    inc(d);
    a := a + 2;
  end;
end;

procedure TForm2.RadioButton_PlayerClick(Sender: TObject);
begin
  form1.barVolume.Visible := True;
  form1.barVolumeSys.Visible := False;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.RadioButton_SystemClick(Sender: TObject);
begin
  form1.barVolume.Visible := False;
  form1.barVolumeSys.Visible := True;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.RandomTrackClick(Sender: TObject);
begin
  if RandomTrack.Checked = True then
  begin
    form1.RandomSong;
    form1.RandomButton.ImageIndex := 7;
    form1.nextButton.Hint := form1.ListViewPlaylist.Items
      [strtoint(form1.MemoRandomSong.Lines[1]) - 1].SubItems[0];
  end;
  if RandomTrack.Checked = False then
  begin
    form1.RandomButton.ImageIndex := 11;
    form1.nextButton.Hint := form1.ListViewPlaylist.Items
      [form1.ListViewPlaylist.Selected.Index + 1].SubItems[0];
  end;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.RepeatSongClick(Sender: TObject);
begin
  if RepeatSong.Checked = True then
  begin
    form1.RepeatButton.ImageIndex := 8;
  end;
  if RepeatSong.Checked = False then
  begin
    form1.RepeatButton.ImageIndex := 12;
  end;
end;

procedure TForm2.RotateEFClick(Sender: TObject);
begin
  if RotateEF.Checked = True then
  begin
    rotpos := 0.7853981;
    rotdsp := BASS_ChannelSetDSP(Channel, @Rotate, 0, 2);
  end;
  if RotateEF.Checked = False then
  begin
    BASS_ChannelRemoveDSP(Channel, rotdsp);
  end;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.TabControl12MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
  application.ProcessMessages;
end;

procedure TForm2.TabControl1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
  application.ProcessMessages;
end;

procedure TForm2.TabControl3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
  application.ProcessMessages;
end;

procedure TForm2.TabKeyMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
  application.ProcessMessages;
end;

procedure TForm2.TabOptionMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
  application.ProcessMessages;
end;

procedure TForm2.TabSheet1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
  application.ProcessMessages;
end;

procedure TForm2.TabSheet2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
  application.ProcessMessages;
end;

procedure TForm2.TabSheet3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
  application.ProcessMessages;
end;

procedure TForm2.TabSheet4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
  application.ProcessMessages;
end;

procedure TForm2.TabSheet5MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
  application.ProcessMessages;
end;

procedure TForm2.TaskTrackGoClick(Sender: TObject);
begin
  form1.Timer_TaskTrackGo.Enabled := TaskTrackGo.Checked;
  if Form2.TaskTrackGo.Checked = False then
  begin
    application.Title := #32 + '*** ' + form1.ExtractOnlyFileName
      (FileName) + ' ***';
  end;

  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.TrackBar4Change(Sender: TObject);
begin
  EQParam.fBandwidth := 5;
  EQParam.fCenter := 80;
  EQGainCurrent[0] := -Form2.TrackBar4.Position;
  if not CHANGE_PRESET then
    boxEQSelect.ItemIndex := 10;
  Include(SNDEffects, seEqualizer);
  BASS_SetSoundEffects(SNDEffects);
  application.ProcessMessages;
 { BASS_FXGetParameters(fx[1], @EQParam); // считываем параметры канала
  EQParam.fGain := 15 - TrackBar4.Position;
  EQParam.fCenter := 80;
  BASS_FXSetParameters(fx[1], @EQParam); // устанавливаем измененные параметры
  application.ProcessMessages;   }
end;

procedure TForm2.TrackBar5Change(Sender: TObject);
begin
  EQParam.fBandwidth := 5;
  EQParam.fCenter := 170;
  EQGainCurrent[1] := -Form2.TrackBar5.Position;
  if not CHANGE_PRESET then
    boxEQSelect.ItemIndex := 10;
  Include(SNDEffects, seEqualizer);
  BASS_SetSoundEffects(SNDEffects);
  application.ProcessMessages;
  {BASS_FXGetParameters(fx[2], @EQParam); // считываем параметры канала
  EQParam.fGain := 15 - TrackBar5.Position;
  // задаем усиление в зависимости от позиции TrackBar
  EQParam.fCenter := 170;
  BASS_FXSetParameters(fx[2], @EQParam); // устанавливаем измененные параметры
  application.ProcessMessages;}
end;

procedure TForm2.TrackBar6Change(Sender: TObject);
begin
  EQParam.fBandwidth := 5;
  EQParam.fCenter := 310;
  EQGainCurrent[2] := -Form2.TrackBar6.Position;
  if not CHANGE_PRESET then
    boxEQSelect.ItemIndex := 10;
  Include(SNDEffects, seEqualizer);
  BASS_SetSoundEffects(SNDEffects);
  application.ProcessMessages;
 { BASS_FXGetParameters(fx[3], @EQParam); // считываем параметры канала
  EQParam.fGain := 15 - TrackBar6.Position;
  // задаем усиление в зависимости от позиции TrackBar
  EQParam.fCenter := 310;
  BASS_FXSetParameters(fx[3], @EQParam); // устанавливаем измененные параметры
  application.ProcessMessages; }
end;

procedure TForm2.TrackBar7Change(Sender: TObject);
begin
  EQParam.fBandwidth := 5;
  EQParam.fCenter := 600;
  EQGainCurrent[3] := -Form2.TrackBar7.Position;
  if not CHANGE_PRESET then
    boxEQSelect.ItemIndex := 10;
  Include(SNDEffects, seEqualizer);
  BASS_SetSoundEffects(SNDEffects);
  application.ProcessMessages;
  {BASS_FXGetParameters(fx[4], @EQParam); // считываем параметры канала
  EQParam.fGain := 15 - TrackBar7.Position;
  // задаем усиление в зависимости от позиции TrackBar
  EQParam.fCenter := 600;
  BASS_FXSetParameters(fx[4], @EQParam); // устанавливаем измененные параметры
  application.ProcessMessages; }
end;

procedure TForm2.TrackBar8Change(Sender: TObject);
begin
  EQParam.fBandwidth := 5;
  EQParam.fCenter := 1000;
  EQGainCurrent[4] := -Form2.TrackBar8.Position;
  if not CHANGE_PRESET then
    boxEQSelect.ItemIndex := 10;
  Include(SNDEffects, seEqualizer);
  BASS_SetSoundEffects(SNDEffects);
  application.ProcessMessages;
  {BASS_FXGetParameters(fx[5], @EQParam); // считываем параметры канала
  EQParam.fGain := 15 - TrackBar8.Position;
  // задаем усиление в зависимости от позиции TrackBar
  EQParam.fCenter := 1000;
  BASS_FXSetParameters(fx[5], @EQParam); // устанавливаем измененные параметры
  application.ProcessMessages;}
end;

procedure TForm2.TrackBar9Change(Sender: TObject);
begin
  EQParam.fBandwidth := 5;
  EQParam.fCenter := 3000;
  EQGainCurrent[5] := -Form2.TrackBar9.Position;
  if not CHANGE_PRESET then
    boxEQSelect.ItemIndex := 10;
  Include(SNDEffects, seEqualizer);
  BASS_SetSoundEffects(SNDEffects);
  application.ProcessMessages;
  {BASS_FXGetParameters(fx[6], @EQParam); // считываем параметры канала
  EQParam.fGain := 15 - TrackBar9.Position;
  // задаем усиление в зависимости от позиции TrackBar
  EQParam.fCenter := 3000;
  BASS_FXSetParameters(fx[6], @EQParam); // устанавливаем измененные параметры
  application.ProcessMessages;}
end;

procedure TForm2.TrackBar10Change(Sender: TObject);
begin
  EQParam.fBandwidth := 5;
  EQParam.fCenter := 6000;
  EQGainCurrent[6] := -Form2.TrackBar10.Position;
  if not CHANGE_PRESET then
    boxEQSelect.ItemIndex := 10;
  Include(SNDEffects, seEqualizer);
  BASS_SetSoundEffects(SNDEffects);
  application.ProcessMessages;
  {BASS_FXGetParameters(fx[7], @EQParam); // считываем параметры канала
  EQParam.fGain := 15 - TrackBar10.Position;
  // задаем усиление в зависимости от позиции TrackBar
  EQParam.fCenter := 6000;
  BASS_FXSetParameters(fx[7], @EQParam); // устанавливаем измененные параметры
  application.ProcessMessages;}
end;

procedure TForm2.TrackBar11Change(Sender: TObject);
begin
  EQParam.fBandwidth := 5;
  EQParam.fCenter := 10000;
  EQGainCurrent[7] := -Form2.TrackBar11.Position;
  if not CHANGE_PRESET then
    boxEQSelect.ItemIndex := 10;
  Include(SNDEffects, seEqualizer);
  BASS_SetSoundEffects(SNDEffects);
  application.ProcessMessages;
 { BASS_FXGetParameters(fx[8], @EQParam); // считываем параметры канала
  EQParam.fGain := 15 - TrackBar11.Position;
  // задаем усиление в зависимости от позиции TrackBar
  EQParam.fCenter := 10000;
  BASS_FXSetParameters(fx[8], @EQParam); // устанавливаем измененные параметры
  application.ProcessMessages;}
end;

procedure TForm2.TrackBar12Change(Sender: TObject);
begin
  EQParam.fBandwidth := 5;
  EQParam.fCenter := 12000;
  EQGainCurrent[8] := -Form2.TrackBar12.Position;
  if not CHANGE_PRESET then
    boxEQSelect.ItemIndex := 10;
  Include(SNDEffects, seEqualizer);
  BASS_SetSoundEffects(SNDEffects);
  application.ProcessMessages;
 { BASS_FXGetParameters(fx[9], @EQParam); // считываем параметры канала
  EQParam.fGain := 15 - TrackBar12.Position;
  // задаем усиление в зависимости от позиции TrackBar
  EQParam.fCenter := 12000;
  BASS_FXSetParameters(fx[9], @EQParam); // устанавливаем измененные параметры
  application.ProcessMessages;}
end;

procedure TForm2.TrackBar13Change(Sender: TObject);
begin
  EQParam.fBandwidth := 5;
  EQParam.fCenter := 16000;
  EQGainCurrent[9] := -Form2.TrackBar13.Position;
  if not CHANGE_PRESET then
    boxEQSelect.ItemIndex := 10;
  Include(SNDEffects, seEqualizer);
  BASS_SetSoundEffects(SNDEffects);
  application.ProcessMessages;
 { BASS_FXGetParameters(fx[10], @EQParam); // считываем параметры канала
  EQParam.fGain := 15 - TrackBar13.Position;
  // задаем усиление в зависимости от позиции TrackBar
  EQParam.fCenter := 16000;
  BASS_FXSetParameters(fx[10], @EQParam); // устанавливаем измененные параметры
  application.ProcessMessages;}
end;

procedure TForm2.TreeView1Click(Sender: TObject);
begin
  PageControl1.ActivePageIndex := TreeView1.Selected.AbsoluteIndex;
  { application.ProcessMessages;
    LoadNastr2; }
  application.ProcessMessages;
  SpeedButton1.Enabled := True;
  application.ProcessMessages;
end;

procedure TForm2.ПлейлистMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(Wm_SysCommand, $F012, 0);
  application.ProcessMessages;
end;

end.
