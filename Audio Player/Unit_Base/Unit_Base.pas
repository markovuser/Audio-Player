Unit Unit_Base;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, commctrl,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ShellAPI, ShlObj, Menus, ComCtrls, IniFiles,
  SHDocVw, FileCtrl, JPEG, PNGImage, ID3v1Library, ID3v2Library, APEv2Library,
  System.ImageList, Vcl.ImgList, GIFImg, System.Actions, Vcl.ActnList, TagsLibrary, Bass,
  ClipBrd, themes, Styles, Math, Vcl.ToolWin, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnPopup, Winapi.ActiveX, ComObj, MMDeviceAPI, Vcl.AppEvnts, Vcl.WinXCtrls,
  Vcl.Samples.Gauges, WinInet, StrUtils, System.Win.TaskbarCore, Vcl.Taskbar,
  Vcl.WinXPickers, WindowsDarkMode, bassaac, bassac3, bassalac, bassape, bassmpc, bassofr,
  bassspx, basstta, basswv, bassflac, basswma, BASSOPUS, BASSADX, BASSAIX, BASSMOD,
  basswebm, BassDSD, uSpectrum, FreeImage, FreeImageLoader, Vcl.JumpList, Vcl.Grids,
  KnownFolders, Translation, Masks, DateUtils, FileInfoUtils, System.UITypes;

Type
  TStringGrid = Class(Vcl.Grids.TStringGrid)
  Protected
    Procedure Resize; Override;
  End;

Type
  TWmMoving = Record
    Msg: Cardinal;
    fwSide: Cardinal;
    lpRect: PRect;
    Result: Integer;
  End;

Type
  TTrackBar = Class(ComCtrls.TTrackBar)
  Protected
    Procedure MouseDown(Button: TMouseButton; Shift: TShiftState; x, y: Integer); Override;
    Function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint): Boolean; Override;
    Procedure CreateParams(Var Params: TCreateParams); Override;
  End;

Type
  TChannelType = (ctUnknown, ctStream, ctMusic, ctSample);

Type
  TPlayerMode = (Stop, Play, Pause);

Type
  TRunMode = (rmNone, rmLeft, rmTopLeft, rmRightLeft, rmBottomLeft);

Type
  ClearDUBThread = Class(TThread) // Поток удаления дубликатов.
  Private
  Protected
    Procedure Execute; Override;
  End;

Type
  AddFolderThread = Class(TThread) // Поток добавления папок.
  Private
  Protected
    Procedure Execute; Override;
  End;

Type
  AddFolderThreadLoad = Class(TThread) // Поток добавления папок.
  Private
  Protected
    Procedure Execute; Override;
  End;

Type
  AddMediaThread = Class(TThread) // Поток установки медиа данных
  Private
  Protected
    Procedure Execute; Override;
  End;

Type
  TMyGrid = Class(TCustomGrid);

Type
  TForm1 = Class(TForm)
    Timer_Play: TTimer;
    OpenDialogPlaylist: TOpenDialog;
    OpenDialogFile: TOpenDialog;
    MemoOption: TMemo;
    PopupMenuDelete: TPopupMenu;
    DeleteNonExistentMenu: TMenuItem;
    ClearlistMenu: TMenuItem;
    DeleteDuplicatesMenu: TMenuItem;
    PopupMenuAdd: TPopupMenu;
    AddFileMenu1: TMenuItem;
    AddFolderMenu1: TMenuItem;
    MemoPlayHistory: TMemo;
    MemoRandomSong: TMemo;
    Timer_TaskTrackGo: TTimer;
    Timer_Radio: TTimer;
    AddURLMenu1: TMenuItem;
    TabProgress: TTabControl;
    barSeek: TTrackBar;
    TabMusicName: TTabControl;
    ClearHistoryMenu: TMenuItem;
    TabPlayList: TTabControl;
    Timer_Draw: TTimer;
    TabApp: TTabControl;
    TabControlCoverArt: TTabControl;
    ImageTAG: TImage;
    ImageSubstrate: TImage;
    PopupMenuPlayList: TPopupMenu;
    PlayMenu: TMenuItem;
    N6: TMenuItem;
    AddFileMenu: TMenuItem;
    AddFolderMenu: TMenuItem;
    AddURLMenu: TMenuItem;
    N40: TMenuItem;
    FileLocationMenu: TMenuItem;
    FileInfoPLMenu: TMenuItem;
    N2: TMenuItem;
    CopyToMenu: TMenuItem;
    CopyToClipboardMenu: TMenuItem;
    N1: TMenuItem;
    DeleteFileFromListMenu: TMenuItem;
    TabControlSound: TTabControl;
    TrayIcon1: TTrayIcon;
    PopupMenuTray: TPopupMenu;
    ShowMainWindowTryMenu: TMenuItem;
    OptionTryMenu: TMenuItem;
    Separator7: TMenuItem;
    PlayTryMenu: TMenuItem;
    PauseTryMenu: TMenuItem;
    StopTryMenu: TMenuItem;
    NextTryMenu: TMenuItem;
    PrevTryMenu: TMenuItem;
    Separator16: TMenuItem;
    AddMenu: TMenuItem;
    N87: TMenuItem;
    TabControl_Volume: TTabControl;
    barVolume: TTrackBar;
    barVolumeSys: TTrackBar;
    TabControlVisual: TTabControl;
    TabControl3: TTabControl;
    Image3: TImage;
    pb1: TPaintBox;
    TabControl4: TTabControl;
    HzCaption: TLabel;
    kbpsCaption: TLabel;
    SizeCaption: TLabel;
    TabControl_Balance: TTabControl;
    balanceBar: TTrackBar;
    Label1: TLabel;
    Label2: TLabel;
    ImageList_Menu: TImageList;
    Label_Stereo: TLabel;
    ImageListButtons: TImageList;
    TabControlToolBar: TTabControl;
    TabControl_Time: TTabControl;
    TabControlButton: TTabControl;
    NextButton: TSpeedButton;
    PauseButton: TSpeedButton;
    PrevButton: TSpeedButton;
    StopButton: TSpeedButton;
    PlayButton: TSpeedButton;
    StatusBarTime: TStatusBar;
    TabControlPLButton: TTabControl;
    TabControlForPL: TTabControl;
    SpeedButtonAddToPL: TSpeedButton;
    SpeedButtonDelFromPL: TSpeedButton;
    SearchBox1: TSearchBox;
    Label_ScrollText: TLabel;
    N12: TMenuItem;
    DeleteFileFromDiskMenu: TMenuItem;
    TabControlTagInfo: TTabControl;
    Label_Year: TLabel;
    Label_Title: TLabel;
    Label_Artist: TLabel;
    TabControlTools: TTabControl;
    RandomButton: TSpeedButton;
    RepeatButton: TSpeedButton;
    SoundButton: TSpeedButton;
    ComboBox_Playlist: TComboBox;
    OptionButton: TSpeedButton;
    SpeedButtonSortPL: TSpeedButton;
    PopupMenuPLSort: TPopupMenu;
    SortbyNameMenu: TMenuItem;
    SortbyDurationMenu: TMenuItem;
    SpeedButtonOther: TSpeedButton;
    PopupMenuOther: TPopupMenu;
    MenuItemUpdateTags: TMenuItem;
    SortRandomlyMenu: TMenuItem;
    TabControlStatus: TTabControl;
    StatusBarInfo: TStatusBar;
    LabelImageTag: TLabel;
    SpeedButton_GeneralMenu: TSpeedButton;
    PopupMenu_General: TPopupMenu;
    ThemeMenu: TMenuItem;
    ThemeAuto: TMenuItem;
    ThemeLight: TMenuItem;
    ThemeDark: TMenuItem;
    Separator1: TMenuItem;
    AboutMenu: TMenuItem;
    ThemeLuna: TMenuItem;
    OptionMenu: TMenuItem;
    FileInfoMenu: TMenuItem;
    Separator3: TMenuItem;
    N4: TMenuItem;
    SpeedButtonControlPL: TSpeedButton;
    PopupMenuPL: TPopupMenu;
    AddPLMenu: TMenuItem;
    OpenPLMenu: TMenuItem;
    UpdateListPLMenu: TMenuItem;
    DelPLMenu: TMenuItem;
    SavePLMenu: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    ThemeSky: TMenuItem;
    PopupMenuLanguage: TPopupMenu;
    LangQuestionDelFile: TMenuItem;
    LangQuestionCleanStori: TMenuItem;
    LangQuestionDelPL: TMenuItem;
    LangQuestionDelFilePL: TMenuItem;
    LangQuestionCleanList: TMenuItem;
    LangQuestionCleanDup: TMenuItem;
    LangQuestionDelNotFile: TMenuItem;
    LangAddFolder: TMenuItem;
    LangAddPL: TMenuItem;
    LangNamePL: TMenuItem;
    LangQuestionRepCod: TMenuItem;
    LangAttention: TMenuItem;
    LangNoBASSDLL: TMenuItem;
    LanrErrorAudio: TMenuItem;
    LangDirectX8: TMenuItem;
    LangSelectFolder: TMenuItem;
    LangErrorWritingFile: TMenuItem;
    LangReplaceFile: TMenuItem;
    LangError: TMenuItem;
    LangNoStationName: TMenuItem;
    LangPasteURL: TMenuItem;
    LangConfirmation: TMenuItem;
    LangQuestionDelTag: TMenuItem;
    LangErrorDelData: TMenuItem;
    LangErrorSaveData: TMenuItem;
    ImageListTryIcon: TImageList;
    ExitTryMenu: TMenuItem;
    N5: TMenuItem;
    Taskbar1: TTaskbar;
    ActionList1: TActionList;
    MusicPlay: TAction;
    MusicStop: TAction;
    MusicPause: TAction;
    MusicPrev: TAction;
    MusicNext: TAction;
    ImageOverlayPlay: TImage;
    ImageOverlayPause: TImage;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    LangOpenInAudioPlayer: TMenuItem;
    LangAddInAudioPlayer: TMenuItem;
    ManagerPLMenu: TMenuItem;
    N3: TMenuItem;
    LangQuestionDelAllPL: TMenuItem;
    CheckUpdateMenu: TMenuItem;
    LangOnlyWindows: TMenuItem;
    N7: TMenuItem;
    Version: TMenuItem;
    LanguageMenu: TMenuItem;

    Procedure FormCreate(Sender: TObject);
    Procedure Timer_PlayTimer(Sender: TObject);
    Procedure audioPlay;
    Procedure LoadNastr;
    Procedure SaveNastr;
    Procedure LoadLanguage;
    Procedure SaveList(SaveFile: String);
    Procedure barVolumeChange(Sender: TObject);
    Procedure Error(Const ErrMsg: String);
    Procedure FileLocationMenuClick(Sender: TObject);
    Procedure FileInfoPLMenuClick(Sender: TObject);
    Procedure barSeekChange(Sender: TObject);
    Procedure balanceBarChange(Sender: TObject);
    Procedure PlayButtonClick(Sender: TObject);
    Procedure PauseButtonClick(Sender: TObject);
    Procedure StopButtonClick(Sender: TObject);
    Procedure PrevButtonClick(Sender: TObject);
    Procedure NextButtonClick(Sender: TObject);
    Procedure AddFileMenu1Click(Sender: TObject);
    Procedure AddFolderMenu1Click(Sender: TObject);
    Procedure SpeedButtonAddToPLClick(Sender: TObject);
    Procedure OpenPlayListButtonClick(Sender: TObject);
    Procedure DeleteNonExistentMenuClick(Sender: TObject);
    Procedure ClearlistMenuClick(Sender: TObject);
    Procedure DeleteDuplicatesMenuClick(Sender: TObject);
    Procedure Timer_DrawTimer(Sender: TObject);
    Procedure DeleteFileFromListMenuClick(Sender: TObject);
    Procedure AddFileMenuClick(Sender: TObject);
    Procedure AddFolderMenuClick(Sender: TObject);
    Procedure CopyToMenuClick(Sender: TObject);
    Procedure ComboBox_PlaylistChange(Sender: TObject);
    Procedure DelPlayListButtonClick(Sender: TObject);
    Procedure AddPlayListButtonClick(Sender: TObject);
    Procedure SearchBox1Change(Sender: TObject);
    Procedure ClearHistoryClick(Sender: TObject);
    Procedure SavePlayListButtonClick(Sender: TObject);
    Procedure Timer_RadioTimer(Sender: TObject);
    Procedure ListFileDir(Path, Ext: String; aCombobox: TComboBox; HideExt: Boolean);
    Procedure AddURLMenuClick(Sender: TObject);
    Procedure AddURLMenu1Click(Sender: TObject);
    Procedure PaintBox1Click(Sender: TObject);
    Procedure ClearHistoryMenuClick(Sender: TObject);
    Procedure SpeedButtonDelFromPLClick(Sender: TObject);
    Procedure AllButtonUP;
    Procedure AllButtonDown;
    Procedure GlobLoad;
    Procedure FontApply;
    Procedure CleanTranslationsLikeGlobload;
    Procedure GlobLoadNastr;
    Procedure AddPlaylist;
    Procedure DeletePlayList;
    Procedure UpdatePlayList;
    Procedure OpenPlayList;
    Procedure DeleteDuplicate;
    Procedure PlayMusicSG;
    Procedure PauseMusic;
    Procedure StopMusic;
    Procedure Radio;
    Procedure ContinuePlayback;
   // Procedure MetaDataRadio;
    Procedure MenuAddFolderPlayList;
    Function GenerateUniqueM3UFileName(Const TargetDirectory: String): String;
    Procedure deleteTrack;
    Procedure SaveSong;
    Procedure SaveSongRandom;
    Procedure LoadSong;
    Procedure LoadSongRandom;
    Procedure deleteDublikateTrack;
    Procedure addfolder;
    Procedure FormShortCut(Var Msg: TWMKey; Var Handled: Boolean);
    Procedure TrimWorkingSet;
    Procedure addMedia;
    Procedure ListCoverArts;
    Procedure PreviousFile;
    Procedure FileInformation;
    Procedure GetFileTagInfo;
    Procedure saveTemp;
    Procedure UnCheckTheme;
    Procedure DeleteEmptyRow;
    Procedure DeleteEmptyRowTrak;
    Procedure SizeTrackSG;
    Procedure longTimeSG;
    Procedure TracksNumberSG;
    Procedure SongNumberSG;
    Procedure RandomSongSG;
    Procedure NextFileSG;
    Procedure MenuPlaySG;
    Procedure addfileSG;
    Procedure ClearPlayListSG;
    Procedure DeleteFileSG;
    Procedure RandomStringGrid;
    Procedure CopyStringGrid;
    Procedure addfolderLoad;
    Procedure ClearGrid;
    Procedure M3UToStringGridAdvanced(Const FileName: String; StringGrid: TStringGrid);
    Procedure SearchFilesAndAddToStringGrid(Const StartDir: String; Const Masks: Array Of String; StringGrid: TStringGrid; IncludeSubDirs: Boolean = True);
    Procedure LoadGrid(G: TStringGrid; SL: TStringList);
    Procedure ColumnWidthAlign(aSg: TStringGrid; aColNum: Integer; aDefaultColWidth: Integer = -1);
    Procedure SortStringGrid(Var GenStrGrid: TStringGrid; ThatCol: Integer);
    Procedure DeleteRow(ARowIndex: Integer; AGrid: TStringGrid);
    Function ExtractOnlyFileName(Const FileName: String): String;
    Procedure ShowMainWindowTryMenuClick(Sender: TObject);
    Procedure PlayMenuClick(Sender: TObject);
    Procedure CopyToClipboardMenuClick(Sender: TObject);
    Procedure ImageTAGClick(Sender: TObject);
    Procedure TrayIcon1DblClick(Sender: TObject);
    Procedure ApplicationEvents1SettingChange(Sender: TObject; Flag: Integer; Const Section: String; Var Result: Integer);
    Procedure OptionTryMenuClick(Sender: TObject);
    Procedure PlayTryMenuClick(Sender: TObject);
    Procedure PauseTryMenuClick(Sender: TObject);
    Procedure StopTryMenuClick(Sender: TObject);
    Procedure NextTryMenuClick(Sender: TObject);
    Procedure PrevTryMenuClick(Sender: TObject);
    Procedure barVolumeSysChange(Sender: TObject);
    Procedure StatusBarTimeClick(Sender: TObject);
    Procedure Label_ScrollTextClick(Sender: TObject);
    Procedure DeleteFileFromDiskMenuClick(Sender: TObject);
    Procedure MusicPlayExecute(Sender: TObject);
    Procedure MusicStopExecute(Sender: TObject);
    Procedure MusicPauseExecute(Sender: TObject);
    Procedure RandomButtonClick(Sender: TObject);
    Procedure RepeatButtonClick(Sender: TObject);
    Procedure SoundButtonClick(Sender: TObject);
    Procedure OptionButtonClick(Sender: TObject);
    Procedure SortRandomlyMenuClick(Sender: TObject);
    Procedure SortbyNameMenuClick(Sender: TObject);
    Procedure SortbyDurationMenuClick(Sender: TObject);
    Procedure SpeedButtonSortPLClick(Sender: TObject);
    Procedure SpeedButtonOtherClick(Sender: TObject);
    Procedure MenuItemUpdateTagsClick(Sender: TObject);
    Procedure ThemeLightClick(Sender: TObject);
    Procedure ThemeDarkClick(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure SpeedButton_GeneralMenuClick(Sender: TObject);
    Procedure ThemeLunaClick(Sender: TObject);
    Procedure OptionMenuClick(Sender: TObject);
    Procedure FileInfoMenuClick(Sender: TObject);
    Procedure AboutMenuClick(Sender: TObject);
    Procedure AddPLMenuClick(Sender: TObject);
    Procedure OpenPLMenuClick(Sender: TObject);
    Procedure UpdateListPLMenuClick(Sender: TObject);
    Procedure DelPLMenuClick(Sender: TObject);
    Procedure SavePLMenuClick(Sender: TObject);
    Procedure ThemeAutoClick(Sender: TObject);
    Procedure SpeedButtonControlPLClick(Sender: TObject);
    Procedure ThemeSkyClick(Sender: TObject);
    Procedure FormDestroy(Sender: TObject);
    Procedure ExitTryMenuClick(Sender: TObject);
    Procedure MusicPrevExecute(Sender: TObject);
    Procedure MusicNextExecute(Sender: TObject);
    Procedure StringGrid1MouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; Var Handled: Boolean);
    Procedure StringGrid1MouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; Var Handled: Boolean);
    Procedure FormResize(Sender: TObject);
    Procedure StringGrid1DblClick(Sender: TObject);
    Procedure StringGrid1Click(Sender: TObject);
    Procedure FormDragOver(Sender, Source: TObject; x, y: Integer; State: TDragState; Var Accept: Boolean);
    Procedure FormActivate(Sender: TObject);
    Procedure ManagerPLMenuClick(Sender: TObject);
    Procedure CheckUpdateMenuClick(Sender: TObject);
    Function IsWindows10Or11: Boolean;
    Function PortablePath: String;
    Function PortablePathMusic: String;
    Function PortablePathM3U: String;
  Private
    FMMDev: IMMDevice;
    FMMDevEnum: IMMDeviceEnumerator;
    FEndpoint: IAudioEndpointVolume;
    FVolumeUpdating: Boolean;
    ChannelType: TChannelType;
    Procedure WMMouseMove(Var Message: TWMMouseMove); Message WM_MOUSEMOVE;
    Procedure WMDropFiles(Var Msg: TWMDropFiles); Message WM_DROPFILES;
    Procedure InitMasterVolume;
    Procedure UpdateMasterVolume;
    Procedure WMSettingChange(Var Message: TWMSettingChange); Message WM_SETTINGCHANGE;
    Procedure LanguageMenuItemClick(Sender: TObject);
    Procedure ClearSoundEffectHandles;
    Function BASS_PlaySoundFile(Const FileName: String): Boolean;
    Function BASS_GetMode: DWORD;
    Function BASS_GetLength: DWORD;
    Function BASS_GetPosition: DWORD;
    Procedure BASS_SetPosition(Const Value: DWORD);
    Function GetStreamFrequency(Channel: DWORD): String;
    Function GetRadioBitrate(Channel: DWORD): String;
    //Function GetRealPathFromShortcut(ShortcutPath: String; Out RealPath: String): Boolean;
    Function IsAudioFile(FilePath: String): Boolean;
    Function IsPlaylistFile(FilePath: String): Boolean;
  Public
    Property VolumeUpdating: Boolean Read FVolumeUpdating Write FVolumeUpdating;
  End;

  TMyEndpointVolumeCallback = Class(TInterfacedObject, IAudioEndpointVolumeCallback)
  Public
    Function OnNotify(pNotify: PAUDIO_VOLUME_NOTIFICATION_DATA): HRESULT; Stdcall;
  End;

Var
  Form1: TForm1;
  floatable: DWORD;
  put, Fglob, Fglob1, Fglob2, FileName: String;
  Mode: TPlayerMode;
  Channel: DWORD;
  DIRECTX_80_NOT_INSTALLED: Boolean = False;
  EAX_SUPPORTED: Boolean = False;
  CHANGE_POS: Boolean = True;
  CHANGE_PRESET: Boolean = False;
  XPos, XPos2, XWidth, YPos: Integer;
  FMDown, FRght: Boolean;
  FMode: TRunMode;
  Temp: Array Of String;
  Sort: Integer = 1;
  ValLen, TrackLen: Double;
  TrackPos, ValPos, Times, ValPos1, T: Double;
  PD: Single;
  ChannelInfo: BASS_CHANNELINFO;
  SpecHeight: Integer = 0;
  BassInfo: BASS_INFO;
  Ini, IniM3U: TMemIniFile;
  ganre, album, year, Artist, Title, FILESTR: String;
  x: Integer = 0;
  PanelIndex: Integer = 0;
  rotpos: Single;
  rotdsp: HDSP = 0;
  I1, I2, L1, L2, ZF, L3, NFS, W: Integer;
  DuplicateThread: ClearDUBThread;
  FolderThread: AddFolderThread;
  FolderThreadLoad: AddFolderThreadLoad;
  MediaThread: AddMediaThread;
  ThreadId: Cardinal;
  song: PansiChar;
  songs: String;
  metaURL: PansiChar;
  pURL: Integer;
  icyURL: PansiChar;
  LenURL, bitrateURL: Word;
  Msg: Integer;
  FShowHoriz: Boolean;
  FShowVert: Boolean;
  FontName: String;
  dX: Integer = 10;
  nVolSys, nVol: Integer;
  fn, Targetplaylist, fnLoad: String;
  portable: Boolean;
  LangCode: String;
  LangLocal: String;

Const
  MDIA_MASKS: Array[0..25] Of String = ('*.mp3', '*.mp2', '*.mp1', '*.wav', '*.ogg', '*.mo3', '*.it', '*.xm', '*.s3m', '*.mtm', '*.mod', '*.umx', '*.wma', '*.wm', '*.ofr', '*.ofs', '*.flac', '*.wv', '*.aac', '*.mp4', '*.ac3', '*.alac', '*.ape', '*.mpc', '*.spx', '*.tta');

Const
  ServerName = 'Audio-Player';
  ApiGithub = 'https://api.github.com/repos/markovuser/' + ServerName + '/releases/latest';

Const
  option: String = 'Option';

Implementation

Uses
  Unit_About, Unit_CopyFile, Unit_Settings, Unit_URL, Unit_TrayNotify, Unit_TagEditor,
  Unit_ImageEdit, Unit_PlayListManager, Unit_Update;

{$R *.dfm}

Function TForm1.IsWindows10Or11: Boolean;
Begin
  Result := (TOSVersion.Major = 10) And (TOSVersion.Build >= 10240);
End;

Procedure TStringGrid.Resize;
Begin
  Inherited Resize;
  ShowScrollBar(Handle, SB_VERT, True);
End;

// Удаление строк
Procedure TForm1.DeleteRow(ARowIndex: Integer; AGrid: TStringGrid);
Var
  i, j: Integer;
Begin
  With AGrid Do
  Begin
    If (ARowIndex = RowCount) Then
      RowCount := RowCount - 1
    Else
    Begin
      For i := ARowIndex To RowCount Do
        For j := 0 To ColCount Do
          Cells[j, i] := Cells[j, i + 1];

      RowCount := RowCount - 1;
    End;
  End;
End;

Procedure TForm1.DeleteEmptyRow;
Var
  i, j: Integer;
Begin
  StringGrid1.BeginUpdate;
  Try
    i := 1; // Начинаем с 1 (пропускаем заголовки)
    While i < StringGrid1.RowCount Do // Используем < вместо <=
    Begin
      // Проверяем ВРУЧНУЮ, а не через Rows[i].Text
      // Rows[i].Text возвращает текст с табуляциями между ячейками
      If (Trim(StringGrid1.Cells[0, i]) = '') And (Trim(StringGrid1.Cells[1, i]) = '') And (Trim(StringGrid1.Cells[2, i]) = '') And (Trim(StringGrid1.Cells[3, i]) = '') Then
      Begin
        // Удаляем строку, сдвигая остальные вверх
        For j := i To StringGrid1.RowCount - 2 Do
        Begin
          StringGrid1.Rows[j].Assign(StringGrid1.Rows[j + 1]);
        End;

        StringGrid1.RowCount := StringGrid1.RowCount - 1;
        // Не увеличиваем i, так как следующая строка сдвинулась на место удаленной
      End
      Else
      Begin
        Inc(i);
      End;
    End;

    // Удаляем первую строку только если она пустая
    If StringGrid1.RowCount > 0 Then
    Begin
      If (Trim(StringGrid1.Cells[0, 0]) = '') And (Trim(StringGrid1.Cells[1, 0]) = '') And (Trim(StringGrid1.Cells[2, 0]) = '') And (Trim(StringGrid1.Cells[3, 0]) = '') Then
      Begin
        DeleteRow(0, StringGrid1);
      End;
    End;
  Finally
    StringGrid1.EndUpdate;
  End;
End;

// Очистка StringGrid2
Procedure ClearGrid2;
Var
  i, j: Integer;
Begin
  Try
    For i := 0 To Form1.StringGrid2.RowCount - 1 Do
      For j := 0 To Form1.StringGrid2.ColCount - 1 Do
        Form1.StringGrid2.Cells[j, i] := '';
    application.ProcessMessages;
    Form1.StringGrid2.RowCount := 1;
    application.ProcessMessages;
  Except
  End;
End;

// Копия  StringGrid1 в StringGrid2
Procedure TForm1.CopyStringGrid;
Var
  c, r: Integer;
Begin
  ClearGrid2;
  StringGrid2.ColCount := StringGrid1.ColCount;
  StringGrid2.RowCount := StringGrid1.RowCount;
  For r := 0 To StringGrid1.RowCount - 1 Do
  Begin
    For c := 0 To StringGrid1.ColCount - 1 Do
    Begin
      StringGrid2.Cells[c, r] := StringGrid1.Cells[c, r];
      application.ProcessMessages;
    End;
  End;
End;

Procedure TForm1.WMSettingChange(Var Message: TWMSettingChange);
Begin
  Try
    form2.CheckBoxColorTrayIconClick(self);
  Except
  End;
  application.ProcessMessages;
End;

Function CheckUrl(url: String): Boolean;
Var
  hSession, hfile: HINTERNET;
  dwindex, dwcodelen: DWORD;
  dwcode: Array[0..19] Of Char;
  statusCode: String;
  timeout: DWORD; // Добавляем переменную для таймаута
Begin
  Result := False; // Инициализация по умолчанию

  Try
    // Используем системные настройки прокси
    hSession := InternetOpen('InetURL:/1.0', INTERNET_OPEN_TYPE_PRECONFIG,
      // Используем системные настройки
      Nil, Nil, 0);
    application.ProcessMessages;

    If Not assigned(hSession) Then
    Begin
      // Попробуем альтернативный вариант
      hSession := InternetOpen('InetURL:/1.0', INTERNET_OPEN_TYPE_PRECONFIG_WITH_NO_AUTOPROXY,
        // Используем системные настройки без автопрокси
        Nil, Nil, 0);
      application.ProcessMessages;

      If Not assigned(hSession) Then
        Exit; // Не удалось открыть сессию
    End;

    Try
      // Устанавливаем таймауты для лучшей работы через прокси
      timeout := 15000; // 15 секунд
      InternetSetOption(hSession, INTERNET_OPTION_CONNECT_TIMEOUT, @timeout, SizeOf(timeout));
      InternetSetOption(hSession, INTERNET_OPTION_RECEIVE_TIMEOUT, @timeout, SizeOf(timeout));
      InternetSetOption(hSession, INTERNET_OPTION_SEND_TIMEOUT, @timeout, SizeOf(timeout));

      // Также можно установить другие таймауты
      timeout := 30000; // 30 секунд для получения данных
      InternetSetOption(hSession, INTERNET_OPTION_DATA_RECEIVE_TIMEOUT, @timeout, SizeOf(timeout));

      // Флаги для работы через прокси
      hfile := InternetOpenUrl(hSession, pchar(url), Nil, 0, INTERNET_FLAG_RELOAD Or INTERNET_FLAG_KEEP_CONNECTION Or // Поддержка keep-alive для прокси
        INTERNET_FLAG_NO_CACHE_WRITE Or // Не кэшировать
        INTERNET_FLAG_PRAGMA_NOCACHE, // Всегда запрашивать с сервера
        0);
      application.ProcessMessages;

      If Not assigned(hfile) Then
      Begin
        Exit; // Не удалось открыть URL
      End;

      Try
        dwindex := 0;
        dwcodelen := SizeOf(dwcode);

        // Инициализируем буфер
        FillChar(dwcode, SizeOf(dwcode), 0);

        If HttpQueryInfo(hfile, HTTP_QUERY_STATUS_CODE, @dwcode, dwcodelen, dwindex) Then
        Begin
          statusCode := StrPas(dwcode); // Преобразуем в строку Pascal

            // Принимаем также 301 (Moved Permanently) и 307/308 (Temporary/ Permanent Redirect)
          Result := (statusCode = '200') Or (statusCode = '301') Or (statusCode = '302') Or (statusCode = '307') Or (statusCode = '308');
        End
        Else
        Begin

        End;

        application.ProcessMessages;
      Finally
        If assigned(hfile) Then
          InternetCloseHandle(hfile);
      End;

      application.ProcessMessages;
    Finally
      If assigned(hSession) Then
        InternetCloseHandle(hSession);
    End;

    application.ProcessMessages;
  Except
    On E: Exception Do
    Begin
      // Можно добавить логирование ошибки
      // ShowMessage('Ошибка при проверке URL: ' + E.Message);
      Result := False;
    End;
  End;
End;

// Удаление в корзину
Function DeleteFileWithUndo(sFileName: String): Boolean;
Var
  fos: TSHFileOpStruct;
Begin
  sFileName := sFileName + #0;
  FillChar(fos, SizeOf(fos), 0);
  With fos Do
  Begin
    wFunc := FO_DELETE;
    pFrom := pchar(sFileName);
    fFlags := FOF_ALLOWUNDO Or FOF_NOCONFIRMATION Or FOF_SILENT;
  End;
  Result := (0 = ShFileOperation(fos));
End;

Procedure TForm1.InitMasterVolume;
Var
  PropVar: ^tag_inner_PROPVARIANT;
  MyEndpointVolumeCallback: IAudioEndpointVolumeCallback;
Begin
  PropVar := Nil;
  CoCreateInstance(CLASS_MMDeviceEnumerator, Nil, CLSCTX_ALL, IID_IMMDeviceEnumerator, FMMDevEnum);
  FMMDevEnum.GetDefaultAudioEndpoint(eRender, eMultimedia, FMMDev);
  FMMDev.Activate(IID_IAudioEndpointVolume, CLSCTX_ALL, PropVar^, pointer(FEndpoint));
  // Volume changes handler.
  MyEndpointVolumeCallback := TMyEndpointVolumeCallback.Create;
  FEndpoint.RegisterControlChangeNotify(MyEndpointVolumeCallback);
  UpdateMasterVolume;
End;

Procedure TForm1.UpdateListPLMenuClick(Sender: TObject);
Begin
  AllButtonUP;
  UpdatePlayList;
End;

Procedure TForm1.UpdateMasterVolume;
Var
  VolLevel: Single;
Begin
  FEndpoint.GetMasterVolumeLevelScalar(VolLevel);
  barVolumeSys.Position := Round(VolLevel * 100);
End;

Function TMyEndpointVolumeCallback.OnNotify(pNotify: PAUDIO_VOLUME_NOTIFICATION_DATA): HRESULT;
Begin
  Result := S_OK;

  Form1.VolumeUpdating := True;
  Try
    Form1.barVolumeSys.Position := Round(pNotify.fMasterVolume * 100);
  Finally
    Form1.VolumeUpdating := False;
  End;
End;

Procedure TForm1.WMMouseMove(Var Message: TWMMouseMove);
Begin
  AllButtonUP;
End;

Procedure TTrackBar.CreateParams(Var Params: TCreateParams);
Begin
  Inherited;
  Params.Style := Params.Style;
End;

Function TTrackBar.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint): Boolean;
Begin
  Position := Position + WheelDelta Div 120;
  Result := True;
End;

Procedure TTrackBar.MouseDown(Button: TMouseButton; Shift: TShiftState; x, y: Integer);
Var
  GlobalPos, LocalPos: TPoint;
  isMute: Boolean;
Begin
  If self.Name = 'barSeek' Then
  Begin
    If Button = mbLeft Then
    Begin
      Form1.Timer_Play.Enabled := False;
      GetCursorPos(GlobalPos);
      LocalPos := Form1.barSeek.ScreenToClient(GlobalPos);
      Form1.barSeek.Position := Round((Form1.barSeek.Max / (Form1.barSeek.Width - 28)) * (LocalPos.x - 14));
      { Form1.barSeek.Position :=
        Round((Max - Min) / Width *
        ScreenToClient(Mouse.CursorPos).x) + Min; }
      Form1.Timer_Play.Enabled := True;
    End;
  End;

  If self.Name = 'barVolume' Then
  Begin
    If Button = mbLeft Then
    Begin
      GetCursorPos(GlobalPos);
      LocalPos := Form1.barVolume.ScreenToClient(GlobalPos);
      Form1.barVolume.Position := Round((Form1.barVolume.Max / (Form1.barVolume.Width - 28)) * (LocalPos.x - 14));
      nVol := Round((Form1.barVolume.Max / (Form1.barVolume.Width - 28)) * (LocalPos.x - 14));
      { Form1.barVolume.Position :=
        Round((Max - Min) / Width *
        ScreenToClient(Mouse.CursorPos).x) + Min;
        application.ProcessMessages; }
    End;
  End;

  If self.Name = 'balanceBar' Then
  Begin
    If Button = mbRight Then
    Begin
      Form1.balanceBar.Position := 0;
    End;
    If Button = mbLeft Then
    Begin
      Form1.balanceBar.Position := Round((Form1.balanceBar.Max - Form1.balanceBar.Min) / Form1.balanceBar.Width * ScreenToClient(Mouse.CursorPos).x) + Min;
    End;
  End;

  If self.Name = 'barVolumeSys' Then
  Begin
    If Button = mbLeft Then
    Begin
      GetCursorPos(GlobalPos);
      LocalPos := Form1.barVolumeSys.ScreenToClient(GlobalPos);
      Form1.barVolumeSys.Position := Round((Form1.barVolumeSys.Max / (Form1.barVolumeSys.Width - 28)) * (LocalPos.x - 14));
      nVolSys := Round((Form1.barVolume.Max / (Form1.barVolume.Width - 28)) * (LocalPos.x - 14));
      { Form1.barVolumeSys.Position :=
        Round((Max - Min) / Width *
        ScreenToClient(Mouse.CursorPos).x) + Min;
        application.ProcessMessages; }
    End;
    If Button = mbRight Then
    Begin
      i := Form1.FEndpoint.GetMute(isMute);
      // Узнаём текущее состояние
      Form1.FEndpoint.SetMute(Not isMute, Nil);
      // Выставляем противоположное
    End;
  End;
End;

Procedure TForm1.Error(Const ErrMsg: String);
Begin
  MessageBox(Handle, pchar(ErrMsg), pchar(application.Title), MB_ICONWARNING Or MB_SYSTEMMODAL);
End;

Procedure TForm1.ExitTryMenuClick(Sender: TObject);
Begin
  close;
End;

// Извлечение имени файла
Function TForm1.ExtractOnlyFileName(Const FileName: String): String;
Begin
  Try
    Result := StringReplace(ExtractFileName(FileName), ExtractFileExt(FileName), '', []);
  Except
  End;
End;

// Удаление пробелов
Function DelSpaces(Str: String): String;
Var
  i: Integer;
Begin
  If Length(Str) = 0 Then
  Begin
    DelSpaces := Str;
    Exit;
  End;
  For i := 1 To Length(Str) Do
  Begin
    If pos(' ', Str) = 1 Then
      delete(Str, 1, 1)
    Else
    Begin
      DelSpaces := Str;
      Break;
    End;
  End;
End;

// Освобождение оперативной памяти
Procedure TForm1.TrimWorkingSet;
Var
  MainHandle: THandle;
Begin
  MainHandle := OpenProcess(PROCESS_ALL_ACCESS, False, GetCurrentProcessID);
  SetProcessWorkingSetSize(MainHandle, DWORD(-1), DWORD(-1));
  CloseHandle(MainHandle);
End;

Procedure TForm1.AddURLMenuClick(Sender: TObject);
Begin
  AllButtonUP;
  If ComboBox_Playlist.Text = '' Then
  Begin
    MenuAddFolderPlayList;
  End;
  Form6.EditURLPath.Text := '';
  Form6.EditURLTitle.Text := '';
  Form6.ButtonEditURL.Visible := False;
  Form6.ButtonAddURL.Visible := True;
  Form6.Show;
End;

Procedure TForm1.AddURLMenu1Click(Sender: TObject);
Begin
  AddURLMenuClick(Sender);
End;

Function BASS_GetMode: DWORD;
Begin
  Result := BASS_ChannelIsActive(Channel);
End;

// Поиск и добавление файлов в  StringGrid

Procedure TForm1.SearchFilesAndAddToStringGrid(Const StartDir: String; Const Masks: Array Of String; StringGrid: TStringGrid; IncludeSubDirs: Boolean = True);
Var
  CurrentRow: Integer;

  // Функция проверки по маске

  Function MatchesAnyMask(Const FileName: String): Boolean;
  Var
    I: Integer;
  Begin
    Result := False;
    For I := 0 To High(Masks) Do
    Begin
      If MatchesMask(FileName, Masks[I]) Then
      Begin
        Result := True;
        Exit;
      End;
    End;
  End;

  // Рекурсивная процедура поиска
  Procedure ProcessDirectory(Const Dir: String);
  Var
    SearchRec: TSearchRec;
    FindResult: Integer;
    SubSearchRec: TSearchRec;
    SubFindResult: Integer;
  Begin
    // Поиск всех файлов в текущей директории
    FindResult := FindFirst(IncludeTrailingPathDelimiter(Dir) + '*.*', faAnyFile And Not faDirectory, SearchRec);

    // Проверяем успешность поиска
    If FindResult = 0 Then
    Begin
      Try
        // Обновляем статус ПЕРЕД циклом
        If SearchRec.Name <> '' Then
          Form1.StatusBarInfo.Panels[3].Text := IncludeTrailingPathDelimiter(Dir) + SearchRec.Name;

        While FindResult = 0 Do
        Begin
          // Проверяем соответствие любой из масок
          If MatchesAnyMask(SearchRec.Name) Then
          Begin
            If CurrentRow >= StringGrid.RowCount Then
              StringGrid.RowCount := StringGrid.RowCount + 100;

            StringGrid.Cells[0, CurrentRow] := Format('%.4u', [CurrentRow]);
            StringGrid.Cells[1, CurrentRow] := Form1.ExtractOnlyFileName(SearchRec.Name); // Убрал pwideChar
            StringGrid.Cells[2, CurrentRow] := '0:00';
            StringGrid.Cells[3, CurrentRow] := IncludeTrailingPathDelimiter(Dir) + SearchRec.Name;

            Inc(CurrentRow);
          End;

          FindResult := FindNext(SearchRec);
        End;
      Finally
        FindClose(SearchRec);
      End;
    End;

    // Рекурсивный поиск в поддиректориях
    If IncludeSubDirs Then
    Begin
      SubFindResult := FindFirst(IncludeTrailingPathDelimiter(Dir) + '*.*', faDirectory, SubSearchRec);

      // Проверяем успешность поиска
      If SubFindResult = 0 Then
      Begin
        Try
          While SubFindResult = 0 Do
          Begin
            If (SubSearchRec.Name <> '.') And (SubSearchRec.Name <> '..') Then
            Begin
              // Обновляем статус для поддиректории
              Form1.StatusBarInfo.Panels[3].Text := IncludeTrailingPathDelimiter(Dir) + SubSearchRec.Name;
              ProcessDirectory(IncludeTrailingPathDelimiter(Dir) + SubSearchRec.Name);
            End;
            SubFindResult := FindNext(SubSearchRec);
          End;
        Finally
          FindClose(SubSearchRec);
        End;
      End;
    End;
  End;

Begin
  CurrentRow := StringGrid.RowCount;
  StringGrid.BeginUpdate;
  Try
    ProcessDirectory(StartDir);

    // Устанавливаем актуальное количество строк
    If CurrentRow < StringGrid.RowCount Then
      StringGrid.RowCount := CurrentRow;

  Finally
    StringGrid.EndUpdate;
    // Очищаем статус после завершения
    Form1.StatusBarInfo.Panels[3].Text := '';
  End;
End;

Function GetFileNamefromLink(LinkFileName: String): String;
Var
  MyObject: IUnknown;
  MySLink: IShellLink;
  MyPFile: IPersistFile;
  FileInfo: TWin32FINDDATA;
  WidePath: Array[0..MAX_PATH] Of WideChar;
  Buff: Array[0..MAX_PATH] Of char;
Begin
  Result := '';
  If (fileexists(LinkFileName) = False) Then
    Exit;
  MyObject := CreateComObject(CLSID_ShellLink);
  MyPFile := MyObject As IPersistFile;
  MySLink := MyObject As IShellLink;
  StringToWideChar(LinkFileName, WidePath, SizeOf(WidePath));
  MyPFile.Load(WidePath, STGM_READ);
  MySLink.GetPath(Buff, MAX_PATH, FileInfo, SLGP_UNCPRIORITY);
  Result := Buff;
  application.ProcessMessages;
End;

// Drag&Drop файлов

Procedure TForm1.WMDropFiles(Var Msg: TWMDropFiles);
Const
  MAX_PATH_LENGTH = 260;
Var
  FileCount: Integer;
  FileName: Array[0..MAX_PATH_LENGTH] Of Char;
  I: Integer;
  FileExt, FullPath: String;
  lastRow: Integer;
  PlaylistFileName: String;
  PlaylistProcessed: Boolean;
  RealPath: String;
  IsLnkFile: Boolean;
Begin
  Inherited;
  PlaylistProcessed := False;

  Try
    FileCount := DragQueryFile(Msg.Drop, $FFFFFFFF, Nil, 0);
    If FileCount > 0 Then
    Begin
      For I := 0 To FileCount - 1 Do
      Begin
        DragQueryFile(Msg.Drop, I, @FileName, SizeOf(FileName));
        FullPath := String(FileName);
        RealPath := FullPath;
        IsLnkFile := (LowerCase(ExtractFileExt(FullPath)) = '.lnk');

        If IsLnkFile Then
        Begin
          RealPath := GetFileNamefromLink(FullPath);
          If (RealPath = '') Or ((Not FileExists(RealPath)) And (Not SysUtils.DirectoryExists(RealPath))) Then
          Begin
            RealPath := FullPath;
            FileExt := LowerCase(ExtractFileExt(FullPath));
          End
          Else
          Begin
            FileExt := LowerCase(ExtractFileExt(RealPath));
          End;
        End
        Else
        Begin
          FileExt := LowerCase(ExtractFileExt(FullPath));
        End;

        If SysUtils.DirectoryExists(RealPath) Then
        Begin
          SysUtils.ForceDirectories(Form1.PortablePathM3U);
          If Not FileExists(IncludeTrailingPathDelimiter(Form1.PortablePathM3U) + 'default.m3u') Then
            Form1.MenuAddFolderPlayList;
          Form1.UpdatePlayList;
          Form1.ComboBox_Playlist.ItemIndex := 0;
          SearchFilesAndAddToStringGrid(RealPath + '\', MDIA_MASKS, StringGrid1);
          DeleteEmptyRowTrak;
          Application.ProcessMessages;
        End
        Else If FileExists(RealPath) Or IsLnkFile Then
        Begin
          // Сначала проверяем плейлисты (это должно быть отдельное условие)
          If (Not PlaylistProcessed) And ((FileExt = '.m3u') Or (FileExt = '.m3u8') Or (IsLnkFile And IsPlaylistFile(RealPath))) Then
          Begin
            PlaylistProcessed := True;

            If Not SysUtils.DirectoryExists(PortablePathM3U) Then
              SysUtils.ForceDirectories(PortablePathM3U);

            PlaylistFileName := PortablePathM3U + ExtractFileName(FullPath);

            If Not SameText(ExtractFilePath(FullPath), PortablePathM3U) Then
            Begin
              If IsLnkFile Then
                CopyFile(PChar(FullPath), PChar(PlaylistFileName), False)
              Else
                CopyFile(PChar(RealPath), PChar(PlaylistFileName), False);
            End;

            ComboBox_Playlist.Items.Add(ExtractOnlyFileName(PlaylistFileName));
            ComboBox_Playlist.ItemIndex := ComboBox_Playlist.Items.Count - 1;

            M3UToStringGridAdvanced(RealPath, StringGrid1);

            SaveList(PChar(PortablePathM3U + ComboBox_Playlist.Text + '.m3u'));

            Application.ProcessMessages;
          End
          // Затем проверяем аудиофайлы
          Else If (FileExt = '.mp3') Or (FileExt = '.mp2') Or (FileExt = '.mp1') Or (FileExt = '.wav') Or (FileExt = '.ogg') Or (FileExt = '.mo3') Or (FileExt = '.it') Or (FileExt = '.xm') Or (FileExt = '.s3m') Or (FileExt = '.mtm') Or (FileExt = '.mod') Or (FileExt = '.umx') Or (FileExt = '.wma') Or (FileExt = '.wm') Or (FileExt = '.ofr') Or (FileExt = '.ofs') Or (FileExt = '.flac') Or (FileExt = '.wv') Or (FileExt = '.aac') Or (FileExt = '.mp4') Or (FileExt = '.ac3') Or (FileExt = '.alac') Or (FileExt = '.ape') Or (FileExt = '.mpc') Or (FileExt = '.spx') Or (FileExt = '.tta') Then
          Begin
            SysUtils.ForceDirectories(Form1.PortablePathM3U);
            If Not FileExists(IncludeTrailingPathDelimiter(Form1.PortablePathM3U) + 'default.m3u') Then
              Form1.MenuAddFolderPlayList;
            Form1.UpdatePlayList;
            Form1.ComboBox_Playlist.ItemIndex := 0;

            If IsLnkFile And Not IsAudioFile(RealPath) Then
              Continue;

            StringGrid1.RowCount := StringGrid1.RowCount + 1;
            lastRow := StringGrid1.RowCount - 1;

            If IsLnkFile Then
            Begin
              StringGrid1.Cells[1, lastRow] := ExtractOnlyFileName(FullPath);
              StringGrid1.Cells[3, lastRow] := RealPath;
            End
            Else
            Begin
              StringGrid1.Cells[1, lastRow] := ExtractOnlyFileName(FullPath);
              StringGrid1.Cells[3, lastRow] := FullPath;
            End;

            StringGrid1.Cells[2, lastRow] := '0:00';
            Application.ProcessMessages;
          End;
        End;
      End;

      DeleteEmptyRow;

      If StringGrid1.RowCount > 0 Then
      Begin
        MediaThread := AddMediaThread.Create(False);
        MediaThread.FreeOnTerminate := True;
        MediaThread.Priority := tpNormal;
        CopyStringGrid;
      End;
      SaveList(PChar(PortablePathM3U + ComboBox_Playlist.Text + '.m3u'));
    End;
  Finally
    DragFinish(Msg.Drop);
  End;
End;

// Функция для получения реального пути из ярлыка
{Function TForm1.GetRealPathFromShortcut(ShortcutPath: String; Out RealPath: String): Boolean;
Var
  ShellLink: IShellLink;
  PersistFile: IPersistFile;
  TargetPath: Array[0..MAX_PATH] Of Char;
  FindData: TWin32FindData;
Begin
  Result := False;
  RealPath := '';

  Try
    // Создаем объект IShellLink
    OleCheck(CoCreateInstance(CLSID_ShellLink, Nil, CLSCTX_INPROC_SERVER, IShellLink, ShellLink));

    // Получаем интерфейс IPersistFile
    PersistFile := ShellLink As IPersistFile;

    // Загружаем ярлык
    If Succeeded(PersistFile.Load(PWideChar(WideString(ShortcutPath)), STGM_READ)) Then
    Begin
      // Получаем путь к цели
      FillChar(TargetPath, SizeOf(TargetPath), 0);
      If Succeeded(ShellLink.GetPath(TargetPath, MAX_PATH, FindData, SLGP_SHORTPATH)) Then
      Begin
        RealPath := String(TargetPath);
        Result := FileExists(RealPath) Or SysUtils.DirectoryExists(RealPath);
      End;
    End;
  Except
    // В случае ошибки просто возвращаем False
    Result := False;
  End;
End; }

// Функция для проверки, является ли файл аудиофайлом
Function TForm1.IsAudioFile(FilePath: String): Boolean;
Var
  FileExt: String;
Begin
  FileExt := LowerCase(ExtractFileExt(FilePath));
  Result := (FileExt = '.mp3') Or (FileExt = '.mp2') Or (FileExt = '.mp1') Or (FileExt = '.wav') Or (FileExt = '.ogg') Or (FileExt = '.mo3') Or (FileExt = '.it') Or (FileExt = '.xm') Or (FileExt = '.s3m') Or (FileExt = '.mtm') Or (FileExt = '.mod') Or (FileExt = '.umx') Or (FileExt = '.wma') Or (FileExt = '.wm') Or (FileExt = '.ofr') Or (FileExt = '.ofs') Or (FileExt = '.flac') Or (FileExt = '.wv') Or (FileExt = '.aac') Or (FileExt = '.mp4') Or (FileExt = '.ac3') Or (FileExt = '.alac') Or (FileExt = '.ape') Or (FileExt = '.mpc') Or (FileExt = '.spx') Or (FileExt = '.tta');
End;

// Функция для проверки, является ли файл плейлистом
Function TForm1.IsPlaylistFile(FilePath: String): Boolean;
Var
  FileExt: String;
Begin
  FileExt := LowerCase(ExtractFileExt(FilePath));
  Result := (FileExt = '.m3u') Or (FileExt = '.m3u8');
End;

Procedure BASS_SetDefaultSoundEffect(Const SNDEffects: TSNDEffects);
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
  End;

  If seEcho In SNDEffects Then
  Begin
    With EchoParam Do
    Begin
      fWetDryMix := 0;
      fFeedback := 0;
      fLeftDelay := 333;
      fRightDelay := 333;
      lPanDelay := False;
    End;
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
  End;

  If seEqualizer In SNDEffects Then
  Begin
    EQParam.fBandwidth := 2.5; // 9
  End;
End;

Function TForm1.GenerateUniqueM3UFileName(Const TargetDirectory: String): String;
Var
  Counter: Integer;
  BaseName, NewFileName, FullPath: String;
Begin
  BaseName := 'default';
  Counter := 1;
  If Not FileExists(IncludeTrailingPathDelimiter(TargetDirectory) + 'default.m3u') Then
  Begin
    Result := 'default.m3u';
    Exit;
  End;
  While True Do
  Begin
    NewFileName := Format('%s(%d).m3u', [BaseName, Counter]);
    FullPath := IncludeTrailingPathDelimiter(TargetDirectory) + NewFileName;
    If Not FileExists(FullPath) Then
    Begin
      Result := NewFileName;
      Exit;
    End;
    Inc(Counter);
    If Counter > 1000 Then
    Begin
      Result := Format('%s_%s.m3u', [BaseName, FormatDateTime('yyyymmdd_hhnnss', Now)]);
      Exit;
    End;
  End;
End;

Procedure TForm1.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  Try
    SearchBox1.Text := '';
    Form1.SaveNastr;
    form2.SaveNastr2;
    application.ProcessMessages;
    Form1.SaveSong;
    Form1.SaveSongRandom;
    Form1.SaveList(pchar(PortablePathM3U + Form1.ComboBox_Playlist.Text) + '.m3u');
    Spectrum.Free;
    application.ProcessMessages;
    Bass_Stop();
    BASS_StreamFree(Channel);
    BASS_MusicFree(Channel);
    BASS_Free;
    application.ProcessMessages;
    FreeAndNil(ID3v1Tag);
    FreeAndNil(ID3v2Tag);
    FreeAndNil(APEv2Tag);
    FreeAndNil(OtherTag);
    FreeAndNil(OtherTag2);
    application.ProcessMessages;
  Except
  End;
End;

Function getAbsoluteX(cntrl: TControl; LastControl: TControl): Integer;
Begin
  Result := cntrl.Left;
  If Integer(cntrl.Parent) <> Integer(LastControl) Then
    Result := Result + getAbsoluteX(cntrl.Parent, LastControl);
End;

Function getAbsoluteY(cntrl: TControl; LastControl: TControl): Integer;
Begin
  Result := cntrl.Top;
  If Integer(cntrl.Parent) <> Integer(LastControl) Then
    Result := Result + getAbsoluteX(cntrl.Parent, LastControl);
End;

Procedure TForm1.ColumnWidthAlign(aSg: TStringGrid; aColNum: Integer; aDefaultColWidth: Integer = -1);
Var
  RowNum: Integer;
  ColWidth: Integer;
  MaxColWidth: Integer;
Begin
  // Убрано сравнение с 0, так как Longword всегда >= 0
  If aColNum > Pred(aSg.ColCount) Then
    Exit;

  If aDefaultColWidth < 0 Then
    MaxColWidth := aSg.DefaultColWidth
  Else
    MaxColWidth := aDefaultColWidth;

  For RowNum := 0 To Pred(aSg.RowCount) Do
  Begin
    ColWidth := aSg.Canvas.TextWidth(aSg.Cells[aColNum, RowNum]);
    If MaxColWidth < ColWidth Then
      MaxColWidth := ColWidth;
  End;
  // +5 - потому что иногда текст всё же немного не умещается по ширине. :-)
  aSg.ColWidths[aColNum] := MaxColWidth + 5;
End;

Function GetSpecialPath(CSIDL: Word): String;
Var
  S: String;
Begin
  SetLength(S, MAX_PATH);
  If Not SHGetSpecialFolderPath(0, pchar(S), CSIDL, True) Then
    S := '';
  Result := pchar(S);
End;

Function GetKnownFolderPath(Const folder: KNOWNFOLDERID): String;
Var
  Path: LPWSTR;
Begin
  If SUCCEEDED(SHGetKnownFolderPath(folder, 0, 0, Path)) Then
  Begin
    Try
      Result := Path;
    Finally
      CoTaskMemFree(Path);
    End;
  End
  Else
    Result := '';
End;

Function SetComboBoxItemByText(ComboBox: TComboBox; Const Text: String): Boolean;
Var
  i: Integer;
Begin
  Result := False;
  For i := 0 To ComboBox.Items.Count - 1 Do
  Begin
    If SameText(ComboBox.Items[i], Text) Then
    Begin
      ComboBox.ItemIndex := i;
      Result := True;
      Exit;
    End;
  End;
End;

// Меню добавить в новый плелйист
Procedure TForm1.MenuAddFolderPlayList;
Var
  TargetDir: String;
Begin
  TargetDir := PortablePathM3U;
  Targetplaylist := GenerateUniqueM3UFileName(TargetDir);
  SaveList(pchar(PortablePathM3U + Targetplaylist));
  UpdatePlayList;
  SetComboBoxItemByText(ComboBox_Playlist, ExtractOnlyFileName(Targetplaylist));
  application.ProcessMessages;
End;

Procedure TForm1.FormActivate(Sender: TObject);
Var
  i: Integer;
  Param: String;
Begin
  DragAcceptFiles(Form1.Handle, true);
  For i := 1 To ParamCount Do
  Begin
    Param := Paramstr(i);
    If (i = 1) And (pos('/', Param) = 0) And (pos('-', Param) = 0) Then
    Begin
      fnLoad := Param;
      Continue;
    End;
    If SameText(Param, '/Add') Then
    Begin
      MenuAddFolderPlayList;
      addfolderLoad;
      Break;
    End
    Else If SameText(Param, '/Open') Then
    Begin
      addfolderLoad;
      Break;
    End;
  End;
End;

Procedure TForm1.LoadLanguage;
Var
  Ini: TMemIniFile;
  LangFiles: TStringList;
  i: Integer;
  MenuItem: TMenuItem;
  FileName, DisplayName, MenuCaption: String;
  SearchRec: TSearchRec;
Begin
  Ini := TMemIniFile.Create(PortablePath);
  While LanguageMenu.Count > 0 Do
    LanguageMenu.Items[0].Free;
  LangLocal := Ini.ReadString('Language', 'Language', '');
  Ini.Free;

  LangFiles := TStringList.Create;
  Try
    If FindFirst(ExtractFilePath(ParamStr(0)) + 'Language\*.ini', faAnyFile, SearchRec) = 0 Then
    Begin
      Repeat
        If (SearchRec.Name <> '.') And (SearchRec.Name <> '..') Then
          LangFiles.Add(SearchRec.Name);
      Until FindNext(SearchRec) <> 0;
      FindClose(SearchRec);
    End;
    LangFiles.Sort;
    For i := 0 To LangFiles.Count - 1 Do
    Begin
      FileName := LangFiles[i];
      LangCode := ChangeFileExt(FileName, '');
      DisplayName := LangCode;
      Try
        Ini := TMemIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Language\' + FileName);
        Try
          DisplayName := Ini.ReadString('Language information', 'LANGNAME', LangCode);
        Finally
          Ini.Free;
        End;
      Except
      End;
      MenuCaption := LangCode + #9 + #9 + DisplayName;
      MenuItem := TMenuItem.Create(LanguageMenu);
      MenuItem.RadioItem := true;
      MenuItem.Caption := MenuCaption;
      MenuItem.AutoHotkeys := maManual;
      MenuItem.AutoCheck := True;
      If (LangCode = LangLocal) Or (SameText(LangCode, LangLocal)) Or (LangCode + '.ini' = LangLocal) Then
        MenuItem.Checked := True;
      MenuItem.OnClick := LanguageMenuItemClick;
      LanguageMenu.Add(MenuItem);
    End;

  Finally
    LangFiles.Free;
  End;
End;

Procedure TForm1.LanguageMenuItemClick(Sender: TObject);
Var
  MenuItem: TMenuItem;
  Ini: TMemIniFile;
  i: Integer;
Begin
  If Sender Is TMenuItem Then
  Begin
    MenuItem := TMenuItem(Sender);
    LangCode := Copy(MenuItem.Caption, 1, Pos(#9, MenuItem.Caption) - 1);
    LangLocal := LangCode;
    For i := 0 To LanguageMenu.Count - 1 Do
      LanguageMenu.Items[i].Checked := False;
    MenuItem.Checked := True;
    Ini := TMemIniFile.Create(PortablePath);
    Try
      Ini.WriteString('Language', 'Language', LangLocal);
      Ini.UpdateFile;
    Finally
      Ini.Free;
    End;
    LoadLanguage;
    Form1.Globload;
    If Form2.CheckBoxFolderMenu.Checked Then
    Begin
      Form2.RegisterContextMenu;
      SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, Nil, Nil);
    End;
  End;
End;

Procedure TForm1.CleanTranslationsLikeGlobload;
Var
  i, j, k, m: Integer;
  Ini: TMemIniFile;
  Sections, Keys: TStringList;
  SearchRec: TSearchRec;
  FindResult: Integer;
  CompPath, FormName, CompName, PropName: String;
  FirstDot, SecondDot: Integer;
  FormExists, CompExists: Boolean;
  CurrentForm: TForm;
  CurrentComponent: TComponent;
  Modified: Boolean;
  IsDuplicate: Boolean;
  n: Integer;
  CompareKey, CompareFormName: String;
  CompareDotPos: Integer;
Begin
  // Создаем все формы проекта (если нужно)
  // CreateAllProjectForms;

  FindResult := FindFirst(ExtractFilePath(ParamStr(0)) + 'Language\*.ini', faAnyFile, SearchRec);
  If FindResult = 0 Then
  Begin
    Repeat
      If (SearchRec.Name <> '.') And (SearchRec.Name <> '..') Then
      Begin
        Ini := TMemIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Language\' + SearchRec.Name);
        Sections := TStringList.Create;
        Keys := TStringList.Create;
        Modified := False;

        Try
          Ini.ReadSections(Sections);

          For i := 0 To Sections.Count - 1 Do
          Begin
            // ========== ИСКЛЮЧАЕМ ЭТИ СЕКЦИИ ИЗ ОБРАБОТКИ ==========
            If SameText(Sections[i], 'Language information') Or SameText(Sections[i], 'DestDir') Then
              Continue; // Пропускаем эти секции полностью

            Ini.ReadSection(Sections[i], Keys);

            // Проходим по всем ключам в обратном порядке
            For j := Keys.Count - 1 Downto 0 Do
            Begin
              CompPath := Keys[j];
              FirstDot := Pos('.', CompPath);

              If FirstDot > 0 Then
              Begin
                FormName := Copy(CompPath, 1, FirstDot - 1);
                FormExists := False;
                CompExists := False;

                  // ==================== ПРОВЕРКА СУЩЕСТВОВАНИЯ КОМПОНЕНТА ====================
                // Проверяем ВСЕ формы в Screen
                For k := 0 To Screen.FormCount - 1 Do
                Begin
                  If SameText(Screen.Forms[k].Name, FormName) Then
                  Begin
                    FormExists := True;
                    CurrentForm := Screen.Forms[k];

                    // Извлекаем остаток пути после имени формы
                    CompName := Copy(CompPath, FirstDot + 1, Length(CompPath));
                    SecondDot := Pos('.', CompName);

                    If SecondDot > 0 Then
                    Begin
                      // Есть вложенный компонент: Form1.TrayIcon1.Hint
                      PropName := Copy(CompName, SecondDot + 1, Length(CompName));
                      CompName := Copy(CompName, 1, SecondDot - 1);

                      // Ищем компонент на форме
                      CurrentComponent := CurrentForm.FindComponent(CompName);

                      // Если не нашли через FindComponent, ищем вручную
                      If CurrentComponent = Nil Then
                      Begin
                        For m := 0 To CurrentForm.ComponentCount - 1 Do
                        Begin
                          If SameText(CurrentForm.Components[m].Name, CompName) Then
                          Begin
                            CurrentComponent := CurrentForm.Components[m];
                            Break;
                          End;
                        End;
                      End;

                      CompExists := (CurrentComponent <> Nil);
                    End
                    Else
                    Begin
                      // Нет второй точки - это свойство формы (Form1.Caption)
                      CompExists := True;
                    End;

                    Break; // Форма найдена, выходим из цикла
                  End;
                End;

                // ==================== ПРОВЕРКА ДУБЛИКАТОВ ====================
                IsDuplicate := False;
                // Проверяем предыдущие ключи на дубликаты (только внутри той же формы)
                For n := 0 To j - 1 Do
                Begin
                  CompareKey := Keys[n];
                  CompareDotPos := Pos('.', CompareKey);

                  If CompareDotPos > 0 Then
                  Begin
                    CompareFormName := Copy(CompareKey, 1, CompareDotPos - 1);

                    // Дубликатом считаем только если:
                    // 1. Имя формы совпадает
                    // 2. Полный путь совпадает (регистронезависимо)
                    If (SameText(FormName, CompareFormName)) And (SameText(CompPath, CompareKey)) Then
                    Begin
                      IsDuplicate := True;
                      Break;
                    End;
                  End;
                End;

                // ==================== УДАЛЕНИЕ КЛЮЧА ====================
                // Удаляем если:
                // 1. Форма или компонент не существуют ИЛИ
                // 2. Найден дубликат в той же форме
                If (Not (FormExists And CompExists)) Or IsDuplicate Then
                Begin
                  Ini.DeleteKey(Sections[i], Keys[j]);
                  Modified := True;
                End;
              End
              Else
              Begin
                // Некорректный формат - удаляем
                Ini.DeleteKey(Sections[i], Keys[j]);
                Modified := True;
              End;
            End;

            // Проверяем, не пустая ли секция после удаления
            // (кроме исключенных секций)
            If Not (SameText(Sections[i], 'Language information') Or SameText(Sections[i], 'DestDir')) Then
            Begin
              Ini.ReadSection(Sections[i], Keys);
              If Keys.Count = 0 Then
              Begin
                Ini.EraseSection(Sections[i]);
                Modified := True;
              End;
            End;
          End;

          If Modified Then
            Ini.UpdateFile;

        Finally
          Keys.Free;
          Sections.Free;
          Ini.Free;
        End;
      End;
    Until FindNext(SearchRec) <> 0;
    FindClose(SearchRec);
  End;
End;

Function LoadResourceFontByName(Const ResourceName: String; ResType: PChar): Boolean;
Var
  ResStream: TResourceStream;
  FontsCount: DWORD;
Begin
  ResStream := TResourceStream.Create(hInstance, ResourceName, ResType);
  Try
    Result := (AddFontMemResourceEx(ResStream.Memory, ResStream.Size, Nil, @FontsCount) <> 0);
  Finally
    ResStream.Free;
  End;
End;

Function LoadResourceFontByID(ResourceID: Integer; ResType: PChar): Boolean;
Var
  ResStream: TResourceStream;
  FontsCount: DWORD;
Begin
  ResStream := TResourceStream.CreateFromID(hInstance, ResourceID, ResType);
  Try
    Result := (AddFontMemResourceEx(ResStream.Memory, ResStream.Size, Nil, @FontsCount) <> 0);
  Finally
    ResStream.Free;
  End;
End;

Procedure TForm1.FontApply;
Begin
  If LoadResourceFontByID(1, RT_FONT) Then
    Form1.StatusBarTime.Font.Name := 'Digital Display Regular';
End;

Function GetApplicationBitness: String;
Begin
  {$IFDEF WIN64}
  Result := '(64-bit)';
  {$ELSE}
  Result := '(32-bit)';
  {$ENDIF}
End;

Procedure TForm1.FormCreate(Sender: TObject);
Var
  S: TGridRect;
  AppVersion: String;
Begin
  portable := fileExists(ExtractFilePath(ParamStr(0)) + 'portable.ini');
  Form1.Caption := Form1.Caption + ' ' + GetFileVersion(ParamStr(0)) + ' ' + GetApplicationBitness;
  If portable Then
    Form1.Caption := Form1.Caption + ' Portable';
  DragAcceptFiles(Handle, True);

  InitMasterVolume;
  If StringGrid1.RowCount = 1 Then
    StringGrid1.Selection := S;

  Try
    Taskbar1.OverlayIcon := Nil;
  Except
  End;
  Application.ProcessMessages;
  ImageTAG.Picture := Nil;

  AppVersion := GetFileVersion(Paramstr(0)) + ' ' + GetApplicationBitness;

  Label_Artist.Caption := '';
  Label_Title.Caption := '';
  Label_Year.Caption := '';
  Label_Stereo.Caption := '';
  Label_ScrollText.Caption := Caption;
  Version.Caption := AppVersion;
  Spectrum := TSpectrum.Create(pb1.Width, pb1.Height);
  ID3v1Tag := TID3v1Tag.Create;
  ID3v2Tag := TID3v2Tag.Create;
  APEv2Tag := TAPEv2Tag.Create;
  OtherTag := TTags.Create;
  OtherTag2 := TTags.Create;
  Application.ProcessMessages;
  FontApply;
  StatusBarTime.Font.size := 12;
  StatusBarTime.Font.Style := [fsBold];
  Application.ProcessMessages;
  SysUtils.ForceDirectories(PortablePathM3U);
  If Not FileExists(IncludeTrailingPathDelimiter(PortablePathM3U) + 'default.m3u') Then
    MenuAddFolderPlayList;
  Form1.UpdatePlayList;
  Form1.ComboBox_Playlist.ItemIndex := 0;
  Application.ProcessMessages;
  TrimWorkingSet;
End;

Procedure TForm1.FormDestroy(Sender: TObject);
Begin
  DragAcceptFiles(Handle, False);
End;

Procedure TForm1.FormDragOver(Sender, Source: TObject; x, y: Integer; State: TDragState; Var Accept: Boolean);
Begin
  Accept := True;
End;

Procedure TForm1.FormResize(Sender: TObject);
Begin
  Form1.StringGrid1.ColWidths[1] := Form1.StringGrid1.Width - Form1.StringGrid1.ColWidths[0] - Form1.StringGrid1.ColWidths[2] - 20;
End;

Procedure TForm1.FormShortCut(Var Msg: TWMKey; Var Handled: Boolean);
Var
  CurrentRow: Integer;
  CurrentCell: String;
  IsURL: Boolean;
Begin
  // Если открыта Form7 - игнорируем все горячие клавиши
  If Form7.Showing Then
    Exit;

  // Получаем текущую строку один раз
  CurrentRow := StringGrid1.Row;
  CurrentCell := StringGrid1.Cells[3, CurrentRow];
  IsURL := CheckUrl(CurrentCell);

  // Проверка горячих клавиш с оптимизированными условиями

  // Следующий трек
  If Msg.CharCode = form2.HotKey_Next.HotKey Then
  Begin
    NextFileSG;
    Handled := True;
    Exit;
  End;

  // Предыдущий трек
  If Msg.CharCode = form2.HotKey_Prev.HotKey Then
  Begin
    PreviousFile;
    Handled := True;
    Exit;
  End;

  // Пауза/Продолжить воспроизведение
  If Msg.CharCode = form2.HotKey_Start.HotKey Then
  Begin
    If PlayButton.AllowAllUp Then
    Begin
      // Переход в режим паузы
      PlayButton.AllowAllUp := False;
      PlayButton.Down := True;
      PauseButton.AllowAllUp := True;
      PauseButton.Down := False;
      PauseMusic;
      Mode := Pause;
    End
    Else
    Begin
      // Возобновление воспроизведения
      PlayButton.AllowAllUp := True;
      PlayButton.Down := False;
      PauseButton.AllowAllUp := False;
      PauseButton.Down := True;
      MenuPlaySG;
      Mode := Play;
    End;
    Handled := True;
    Exit;
  End;

  // Перемотка вперед (стрелка вправо) - VK_RIGHT это константа
  If Msg.CharCode = VK_RIGHT Then
  Begin
    If Not IsURL Then
    Begin
      If BASS_GetMode <> BASS_ACTIVE_PAUSED Then
        BASS_ChannelPause(Channel);

      BASS_ChannelSlideAttribute(Channel, BASS_ATTRIB_VOL, 0, 1000);
      Timer_Play.Enabled := False;
      barSeek.Position := barSeek.Position + 1;
      Timer_Play.Enabled := True;
      audioPlay;
    End;
    Handled := True;
    Exit;
  End;

  // Перемотка назад (стрелка влево) - VK_LEFT это константа
  If Msg.CharCode = VK_LEFT Then
  Begin
    // Более эффективная проверка на URL
    If (pos('http', lowercase(CurrentCell)) = 0) Then
    Begin
      If BASS_GetMode <> BASS_ACTIVE_PAUSED Then
        BASS_ChannelPause(Channel);

      BASS_ChannelSlideAttribute(Channel, BASS_ATTRIB_VOL, 0, 1000);
      Timer_Play.Enabled := False;
      barSeek.Position := barSeek.Position - 1;
      Timer_Play.Enabled := True;
      audioPlay;
    End;
    Handled := True;
    Exit;
  End;
End;

{Function GetKBPS(Channel: DWORD): Integer;
Var
  FloatLen: Double;
  Length: Int64;
  Len: Int64;
Begin
  Length := BASS_ChannelGetLength(Channel, BASS_POS_BYTE);
  If Length <= 0 Then
  Begin
    Result := 0;
    Exit;
  End;

  FloatLen := BASS_ChannelBytes2Seconds(Channel, Length);
  If FloatLen <= 0 Then
  Begin
    Result := 0;
    Exit;
  End;

  Len := BASS_StreamGetFilePosition(Channel, BASS_FILEPOS_END);
  If Len <= 0 Then
  Begin
    Result := 0;
    Exit;
  End;

  Result := Trunc((Len / FloatLen) / 125);
End;  }

Function GetKBPS(Channel: DWORD): Integer;
Var
  FloatLen: FLOAT;
  Length: Int64;
  Len: DWORD;
Begin
  Length := BASS_ChannelGetLength(Channel, BASS_POS_BYTE);
  If Length < 0 Then
    Length := 0;
  FloatLen := BASS_ChannelBytes2Seconds(Channel, Length);
  Len := BASS_StreamGetFilePosition(Channel, BASS_FILEPOS_END);
  Result := Trunc(Len / (125 * FloatLen) + 0.5);
  application.ProcessMessages;
End;

Procedure TForm1.Label_ScrollTextClick(Sender: TObject);
Begin
  Clipboard.AsText := ExtractOnlyFileName(FileName);
  application.ProcessMessages;
End;

Procedure TForm1.ListCoverArts;
Var
  i: Integer;
  ImageJPEG: TJPEGImage;
  ImagePNG: TPNGImage;
  ImageGIF: TGIFImage;
  Bitmap: TBitmap;
  BitmapHandle: hBitmap;
Begin
  Form1.ImageTAG.Picture := Nil;
  Form3.ImageTAGTray.Picture := Nil;
  If FileExists(FileName) = False Then
    Exit;
  OtherTag.LoadFromFile(FileName);
  application.ProcessMessages;
  Form1.ImageTAG.Picture := Nil;
  Form3.ImageTAGTray.Picture := Nil;
  application.ProcessMessages;
  For i := 0 To OtherTag.CoverArtCount - 1 Do
  Begin
    application.ProcessMessages;
    Bitmap := TBitmap.Create;
    Try
      With OtherTag.CoverArts[i] Do
      Begin
        Stream.Seek(0, soBeginning);
        Case PictureFormat Of
          tpfJPEG:
            Begin
              ImageJPEG := TJPEGImage.Create;
              application.ProcessMessages;
              Try
                ImageJPEG.LoadFromStream(Stream);
                Bitmap.Assign(ImageJPEG);
                application.ProcessMessages;
              Except
                FreeAndNil(ImageJPEG);
              End;
            End;
          tpfPNG:
            Begin
              ImagePNG := TPNGImage.Create;
              Try
                ImagePNG.LoadFromStream(Stream);
                Bitmap.Assign(ImagePNG);
                application.ProcessMessages;
              Except
                FreeAndNil(ImagePNG);
              End;
            End;
          tpfGIF:
            Begin
              ImageGIF := TGIFImage.Create;
              Try
                ImageGIF.LoadFromStream(Stream);
                Bitmap.Assign(ImageGIF);
                application.ProcessMessages;
              Except
                FreeAndNil(ImageGIF);
              End;
            End;
          tpfBMP:
            Begin
              Bitmap.LoadFromStream(Stream);
              application.ProcessMessages;
            End;
        End;
        Stream.Seek(0, soFromBeginning);
        application.ProcessMessages;
        LabelImageTag.Caption := '';
        LabelImageTag.Caption := GetNormalSize(Stream.size) + ', ' + Format('%d x %d', [Bitmap.Width, Bitmap.Height]);
        If FreeImageLoadImageFromMemoryBitmapHandleWithRescale((Stream As TMemoryStream).Memory, Stream.size, BitmapHandle, Form1.ImageTAG.Width, Form1.ImageTAG.Height, FILTER_LANCZOS3, True, Handle) Then
        Begin
          Bitmap.Handle := BitmapHandle;
          Form1.ImageTAG.Picture.Bitmap := Bitmap;
          application.ProcessMessages;
        End;

        If FreeImageLoadImageFromMemoryBitmapHandleWithRescale((Stream As TMemoryStream).Memory, Stream.size, BitmapHandle, Form3.ImageTAGTray.Width, Form3.ImageTAGTray.Height, FILTER_LANCZOS3, True, Handle) Then
        Begin
          Bitmap.Handle := BitmapHandle;
          Form3.ImageTAGTray.Picture.Bitmap := Bitmap;
          application.ProcessMessages;
        End;

      End;
    Except
      FreeAndNil(Bitmap);
    End;
  End;

End;

Procedure TForm1.FileInfoMenuClick(Sender: TObject);
Begin
  AllButtonUP;
  FileInformation;
  application.ProcessMessages;
End;

Procedure TForm1.MenuItemUpdateTagsClick(Sender: TObject);
Var
  i: Integer;
Begin
  For i := 0 To Form1.StringGrid1.RowCount - 1 Do
  // for i := 1 to Form1.StringGrid1.RowCount - 1 do
  Begin
    Form1.StringGrid1.Cells[1, i] := '';
  End;
  AllButtonUP;
  MediaThread := AddMediaThread.Create(False);
  MediaThread.FreeOnTerminate := True;
  MediaThread.Priority := tpNormal;
  SaveList(pchar(PortablePathM3U + Form1.ComboBox_Playlist.Text) + '.m3u');
End;

Procedure TForm1.UnCheckTheme;
Var
  i: Integer;
Begin
  For i := 0 To ThemeMenu.Count - 1 Do
  Begin
    ThemeMenu.Items[i].Checked := False;
  End;
End;

Procedure TForm1.MenuPlaySG;
Begin
  Try
    If (CheckUrl(Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row]) = True) And (FileExists(Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row]) = False) Then
    Begin
      Form1.barSeek.Position := 0;
     // StopMusic;
      Radio;
      Form1.MemoPlayHistory.Lines.Add(inttostr(Form1.StringGrid1.Row + 1));
      application.ProcessMessages;
      If form2.RandomTrack.Checked = False Then
      Begin
        NextButton.Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row + 1];
        Taskbar1.TaskBarButtons.Items[4].Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row + 1];
      End;

      If form2.RandomTrack.Checked = True Then
      Begin
        NextButton.Hint := Form1.StringGrid1.Cells[1, strtoint(MemoRandomSong.Lines[1])];
        Taskbar1.TaskBarButtons.Items[4].Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row + 1];
      End;
      application.ProcessMessages;
      If form2.BaloonWindow.Checked = True Then
      Begin
        Form3.close;
        Form3.Show;
      End;
    End
    Else
    Begin
      Form1.barSeek.Enabled := True;
      //form2.TaskTrackGoClick(self);
      application.ProcessMessages;
      If (BASS_GetMode = BASS_ACTIVE_PAUSED) Then
      Begin
        FileName := Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row];
        Form1.audioPlay;
        Form1.MemoPlayHistory.Lines.Add(inttostr(Form1.StringGrid1.Row + 1));
        If form2.RandomTrack.Checked = False Then
        Begin
          NextButton.Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row + 1];
          Taskbar1.TaskBarButtons.Items[4].Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row + 1];
        End;

        If form2.RandomTrack.Checked = True Then
        Begin
          NextButton.Hint := Form1.StringGrid1.Cells[1, strtoint(MemoRandomSong.Lines[1])];
          Taskbar1.TaskBarButtons.Items[4].Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row + 1];
        End;
        application.ProcessMessages;
        If form2.BaloonWindow.Checked = True Then
        Begin
          Form3.close;
          Form3.Show;
        End;
      End;

      If (BASS_GetMode = BASS_ACTIVE_STOPPED) And (BASS_GetMode <> BASS_ACTIVE_PAUSED) Then
      Begin
        FileName := Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row];
        Form1.ImageTAG.Picture := Nil;
        Form1.audioPlay;
        Form1.MemoPlayHistory.Lines.Add(inttostr(Form1.StringGrid1.Row + 1));
        If form2.RandomTrack.Checked = False Then
        Begin
          NextButton.Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row + 1];
          Taskbar1.TaskBarButtons.Items[4].Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row + 1];
        End;

        If form2.RandomTrack.Checked = True Then
        Begin
          NextButton.Hint := Form1.StringGrid1.Cells[1, strtoint(MemoRandomSong.Lines[1])];
          Taskbar1.TaskBarButtons.Items[4].Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row + 1];
        End;
        application.ProcessMessages;
        If form2.BaloonWindow.Checked = True Then
        Begin
          Form3.close;
          Form3.Show;
        End;
      End;

      Form1.ImageTAG.Picture := Nil;

      If form2.ShowCoverArts.Checked = True Then
      Begin
        Form1.ListCoverArts;
        application.ProcessMessages;
      End;
      If form2.ShowCoverArts.Checked = False Then
      Begin
        Form1.ImageTAG.Picture := Nil;
        application.ProcessMessages;
      End;
    End;
    TrimWorkingSet;
  Except
  End;
End;

Function KhzToStr: String;
Var
  h: Extended;
  bi: BASS_CHANNELINFO;
Begin
  BASS_ChannelGetInfo(Channel, bi);
  h := bi.freq;
  Result := floattostr(Round(h) / 1000) + ' kHz';
  application.ProcessMessages;
End;

// Частота
Function kHz(Stream: Cardinal): Integer;
Var
  CHANINFO: BASS_CHANNELINFO;
Begin
  BASS_ChannelGetInfo(Stream, CHANINFO);
  Result := Round(CHANINFO.freq);
  application.ProcessMessages;
End;

// Количество каналов > 1 => стерео иначе моно
Function Channels(Stream: Cardinal): Integer;
Var
  CHANINFO: BASS_CHANNELINFO;
Begin
  BASS_ChannelGetInfo(Stream, CHANINFO);
  Result := Round(CHANINFO.chans);
  application.ProcessMessages;
End;

Procedure TForm1.audioPlay;
Begin
  Timer_Radio.Enabled := False;

  If FileExists(FileName) = False Then
    Exit;

  OtherTag.OggVorbisAndOpusTag.ParsePlayTime := True;
  OtherTag.LoadFromFile(FileName);
  application.ProcessMessages;

  If (FileName <> '') And (BASS_GetMode <> BASS_ACTIVE_PLAYING) Then
  Begin
    If (BASS_GetMode <> BASS_ACTIVE_PAUSED) Then
    Begin
      If Not BASS_PlaySoundFile(FileName) Then
        Exit;

      // Дополнительная проверка - если эквалайзер был включен в интерфейсе
      If Assigned(Form2) And Form2.chEqualizer.Checked Then
      Begin
        If Form2.chEqualizer.Checked = true Then
        Begin
          Form2.BASS_RestoreSoundEffect;
          Include(SNDEffects, seEqualizer);
          Form2.BASS_SetSoundEffects(SNDEffects);
          application.ProcessMessages;
        End;
        If Form2.chEqualizer.Checked = false Then
        Begin
          Form2.BASS_RestoreSoundEffect;
          Exclude(SNDEffects, seEqualizer);
          Form2.BASS_SetSoundEffects(SNDEffects);
          application.ProcessMessages;
        End;
      End;
    End
    Else
    Begin
      // ClearSoundEffectHandles;
      BASS_ChannelPlay(Channel, False);
    End;
  End;

  BASS_ChannelSetAttribute(Channel, BASS_ATTRIB_VOL, barVolume.Position / 100);
  BASS_ChannelSlideAttribute(Channel, BASS_ATTRIB_VOL, barVolume.Position / 100, 1000);
  BASS_ChannelSetAttribute(Channel, BASS_ATTRIB_PAN, balanceBar.Position / 50);
  BASS_ChannelSetAttribute(Channel, BASS_ATTRIB_BUFFER, 10000);

  FMode := rmLeft;
  XPos := Width;
  Form1.Timer_Play.Enabled := True;
  Mode := Play;

  application.ProcessMessages;

  Taskbar1.ProgressState := TTaskBarProgressState.None;
  Taskbar1.OverlayIcon := Nil;
  application.ProcessMessages;

  kbpsCaption.Caption := inttostr(GetKBPS(Channel)) + ' kbps';
  HzCaption.Caption := KhzToStr;
  SizeCaption.Caption := GetNormalSize(GetMyFileSize(FileName));

  If Channels(Channel) > 1 Then
    Label_Stereo.Caption := 'Stereo'
  Else
    Label_Stereo.Caption := 'Mono';

  {If Assigned(form2) Then
    form2.TaskTrackGoClick(self); }

  application.ProcessMessages;
End;

// Random
Function Unic(Var Flag: Array Of Boolean; range: Integer): Integer;
Begin
  Result := random(range);
  While Flag[Result] Do
    Result := random(range);
  Flag[Result] := True;
End;

Procedure MassRand(range: Integer; Var inputMass: Array Of Integer);
Var
  i: Integer;
  bm: Array Of Boolean;
Begin
  SetLength(bm, Length(inputMass));
  application.ProcessMessages;
  For i := 0 To Length(inputMass) - 1 Do
  Begin
    inputMass[i] := Unic(bm, range) + 1;
    application.ProcessMessages;
  End;
  SetLength(bm, 0);
  application.ProcessMessages;
End;

Procedure TForm1.RandomSongSG; // Случайный трек
Var
  i: Integer;
  mass: Array Of Integer;
Begin
  If form2.RandomTrack.Checked = False Then
    Exit;
  Try
    If form2.RandomTrack.Checked = True Then
    Begin
      Form1.MemoRandomSong.Lines.Clear;
      application.ProcessMessages;
      SetLength(mass, Form1.StringGrid1.RowCount - 1);
      application.ProcessMessages;
      MassRand(Form1.StringGrid1.RowCount - 1, mass);
      application.ProcessMessages;
      For i := 0 To Length(mass) - 1 Do
      Begin
        Form1.MemoRandomSong.Lines.Add(inttostr(mass[i]));
        application.ProcessMessages;
      End;
      Form1.SaveSongRandom;
      application.ProcessMessages;
    End;
    SetLength(mass, 0);
    application.ProcessMessages;
  Except
  End;
End;

Function fmod(a, B: Single): Single;
Begin
  Result := a - (B * Trunc(a / B));
  application.ProcessMessages;
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

Procedure TForm1.ClearSoundEffectHandles;
Var
  i: Integer;
Begin
  FlangeHandle := 0;
  ChorusHandle := 0;
  EchoHandle := 0;
  ReverbHandle := 0;
  For i := 0 To (9) Do
  Begin
    EQHandle[i] := 0;
  End;
End;

Procedure TForm1.GetFileTagInfo;
Begin
  If OtherTag.Loaded Then
  Begin
    Form1.Label_Artist.Caption := '';
    Form1.Label_Title.Caption := '';
    Form1.Label_Year.Caption := '';
    Label_Stereo.Caption := '';
    Artist := '';
    Title := '';
    album := '';
    year := '';
    Artist := OtherTag.GetText('ARTIST');
    Title := OtherTag.GetText('TITLE');
    album := OtherTag.GetText('ALBUM');
    year := OtherTag.GetText('YEAR');
    ganre := OtherTag.GetText('GENRE');

    Fglob := '*** :: ' + Artist + ' - ' + Title + ' :: ' + album + ' :: ' + ganre + ' :: ' + year + ' :: ' + GetNormalSize(GetMyFileSize(FileName)) + ', ' + KhzToStr + ', ' + inttostr(GetKBPS(Channel)) + ' kbps' + ' :: ***';
    application.ProcessMessages;
    Label_Artist.Caption := Artist;
    Label_Title.Caption := Title;
    Label_Year.Caption := year;
    TrayIcon1.Hint := Artist + ' - ' + Title;
    Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row] := OtherTag.GetText('ARTIST') + ' - ' + OtherTag.GetText('TITLE');
    application.ProcessMessages;
  End;

  If (OtherTag.Loaded = False) Or (Artist + Title = '') Then
  Begin
    Label_Artist.Caption := '';
    Label_Title.Caption := '';
    Label_Year.Caption := '';
    Label_Stereo.Caption := '';
    Artist := '';
    Title := '';
    album := '';
    year := '';
    Fglob := '*** :: ' + ExtractOnlyFileName(FileName) + ' :: ' + GetNormalSize(GetMyFileSize(FileName)) + ', ' + KhzToStr + ', ' + inttostr(GetKBPS(Channel)) + ' kbps' + ' :: ***';
    application.ProcessMessages;
    Label_Artist.Caption := ExtractOnlyFileName(FileName);
    TrayIcon1.Hint := ExtractOnlyFileName(FileName);
    Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row] := ExtractOnlyFileName(FileName);
    application.ProcessMessages;
  End;
End;

Function FormatDuration(Seconds: Integer): String;
Var
  Mins, Secs: Integer;
Begin
  If Seconds < 0 Then
  Begin
    Result := '0:00';
    Exit;
  End;

  Mins := Seconds Div 60;
  Secs := Seconds Mod 60;
  Result := Format('%d:%.2d', [Mins, Secs]);
End;

Procedure TForm1.M3UToStringGridAdvanced(Const FileName: String; StringGrid: TStringGrid);
Var
  SL: TStringList;
  i, Row: Integer;
  Line, Duration, TrackName: String;
  IsExtInf: Boolean;
  CommaPos: Integer;
  FileStream: TFileStream;
  Buffer: TBytes;
Begin
  SL := TStringList.Create;
  Try
    // Определяем кодировку файла
    FileStream := TFileStream.Create(FileName, fmOpenRead Or fmShareDenyWrite);
    Try
      SetLength(Buffer, 3);
      If FileStream.Size >= 3 Then
      Begin
        FileStream.Read(Buffer[0], 3);
        FileStream.Position := 0; // Возвращаемся к началу файла

        // Проверяем BOM (Byte Order Mark)
        If (Buffer[0] = $EF) And (Buffer[1] = $BB) And (Buffer[2] = $BF) Then
        Begin
          // UTF-8 с BOM
          SL.LoadFromStream(FileStream, TEncoding.UTF8);
        End
        Else If (Buffer[0] = $FF) And (Buffer[1] = $FE) Then
        Begin
          // UTF-16 LE (Unicode)
          SL.LoadFromStream(FileStream, TEncoding.Unicode);
        End
        Else If (Buffer[0] = $FE) And (Buffer[1] = $FF) Then
        Begin
          // UTF-16 BE
          SL.LoadFromStream(FileStream, TEncoding.BigEndianUnicode);
        End
        Else
        Begin
          // Пытаемся определить кодировку по содержимому
          Try
            // Сначала пробуем UTF-8 без BOM
            SL.LoadFromStream(FileStream, TEncoding.UTF8);
          Except
            // Если не получается, пробуем ANSI
            FileStream.Position := 0;
            SL.LoadFromStream(FileStream, TEncoding.ANSI);
          End;
        End;
      End
      Else
      Begin
        // Маленький файл, пробуем UTF-8, потом ANSI
        Try
          SL.LoadFromStream(FileStream, TEncoding.UTF8);
        Except
          FileStream.Position := 0;
          SL.LoadFromStream(FileStream, TEncoding.ANSI);
        End;
      End;
    Finally
      FileStream.Free;
    End;

    StringGrid.BeginUpdate;
    Try
      // Очищаем таблицу, оставляя только заголовок
      While StringGrid.RowCount > 1 Do
        StringGrid.RowCount := StringGrid.RowCount - 1;

      IsExtInf := False;
      Row := 1; // Начинаем с первой строки данных

      For i := 0 To SL.Count - 1 Do
      Begin
        Line := Trim(SL[i]);

        // Пропускаем пустые строки
        If Line = '' Then
          Continue;

        // Пропускаем служебные строки
        If (Line = '#EXTM3U') Or (Pos('#PLAYLIST:', Line) = 1) Then
          Continue;

        // Обрабатываем EXTINF
        If Pos('#EXTINF:', Line) = 1 Then
        Begin
          IsExtInf := True;
          // Парсим EXTINF строку
          Delete(Line, 1, 8); // Удаляем '#EXTINF:'
          CommaPos := Pos(',', Line);
          If CommaPos > 0 Then
          Begin
            Duration := Trim(Copy(Line, 1, CommaPos - 1));
            TrackName := Trim(Copy(Line, CommaPos + 1, Length(Line)));

            // Убираем возможные кавычки
            If (TrackName <> '') And (TrackName[1] = '"') Then
              Delete(TrackName, 1, 1);
            If (TrackName <> '') And (TrackName[Length(TrackName)] = '"') Then
              Delete(TrackName, Length(TrackName), 1);
          End
          Else
          Begin
            Duration := Line;
            TrackName := '';
          End;
          Continue;
        End;

        // Проверяем, не комментарий ли это
        If (Line <> '') And (Line[1] = '#') Then
          Continue;

        // Если это путь к файлу после EXTINF
        If IsExtInf And (Line <> '') Then
        Begin
          // Добавляем новую строку
          StringGrid.RowCount := StringGrid.RowCount + 1;
          StringGrid.Cells[0, Row] := Format('%.4u', [Row]); // Нумерация

          // Если TrackName пустое, используем имя файла
          If TrackName = '' Then
            TrackName := ExtractFileName(Line);

          StringGrid.Cells[1, Row] := TrackName; // Название трека

          // Преобразуем длительность из секунд в MM:SS
          If (Duration <> '') And (Duration <> '-1') Then
          Begin
            Try
              StringGrid.Cells[2, Row] := FormatDuration(StrToInt(Duration));
            Except
              StringGrid.Cells[2, Row] := Duration;
            End;
          End
          Else
          Begin
            StringGrid.Cells[2, Row] := '0:00';
          End;

          StringGrid.Cells[3, Row] := Line; // Путь к файлу
          Inc(Row);
          IsExtInf := False;
        End
        Else If (Line <> '') And Not IsExtInf Then
        Begin
          // Простой M3U без EXTINF
          StringGrid.RowCount := StringGrid.RowCount + 1;
          StringGrid.Cells[0, Row] := Format('%.4u', [Row]);
          StringGrid.Cells[1, Row] := ExtractFileName(Line);
          StringGrid.Cells[2, Row] := '0:00';
          StringGrid.Cells[3, Row] := Line;
          Inc(Row);
        End;
      End;

      // Устанавливаем правильное количество строк
      If Row > 1 Then
        StringGrid.RowCount := Row;

    Finally
      StringGrid.EndUpdate;
    End;
  Finally
    SL.Free;
  End;
End;

Procedure TForm1.ManagerPLMenuClick(Sender: TObject);
Begin
  Form9.ShowModal;
  application.ProcessMessages;
End;

Procedure TForm1.ComboBox_PlaylistChange(Sender: TObject);
Begin
  Try
    Form1.ComboBox_Playlist.Enabled := False;
    Form1.TabPlayList.Enabled := False;
    If FileExists(PortablePathM3U + Form1.ComboBox_Playlist.Text + '.m3u') Then
    Begin
      ClearGrid;
      Form1.StringGrid1.RowCount := 0;
      DeleteEmptyRowTrak;
      M3UToStringGridAdvanced(PortablePathM3U + Form1.ComboBox_Playlist.Text + '.m3u', StringGrid1);
      DeleteEmptyRowTrak;
      application.ProcessMessages;
      Form1.SongNumberSG;
      application.ProcessMessages;
      Form1.SizeTrackSG;
      application.ProcessMessages;
      Form1.longTimeSG;
      application.ProcessMessages;
      Form1.RandomSongSG;
      application.ProcessMessages;
      Form1.CopyStringGrid;
      application.ProcessMessages;
      Form1.ComboBox_Playlist.Enabled := True;
      Form1.TabPlayList.Enabled := True;
      application.ProcessMessages;
    End;
    Form1.ComboBox_Playlist.Enabled := True;
    Form1.TabPlayList.Enabled := True;

    Form1.TrimWorkingSet;
    If form2.RandomTrack.Checked = False Then
    Begin
      NextButton.Hint := Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row + 1];
      Taskbar1.TaskBarButtons.Items[4].Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row + 1];
      application.ProcessMessages;
    End;
    If form2.RandomTrack.Checked = True Then
    Begin
      NextButton.Hint := Form1.StringGrid1.Cells[3, strtoint(MemoRandomSong.Lines[1])];
      Taskbar1.TaskBarButtons.Items[4].Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row];
      application.ProcessMessages;
    End;
    application.ProcessMessages;

  Except
  End;
End;

Function TForm1.BASS_PlaySoundFile(Const FileName: String): Boolean;
Var
  Win: hwnd;
Const
  WM_INFO_UPDATE = WM_USER + 101;
Begin
  Result := False;
  Win := 0;

  // Освобождаем предыдущий канал
  Case ChannelType Of
    ctMusic:
      BASS_MusicFree(Channel);
    ctStream:
      BASS_StreamFree(Channel);
    ctSample:
      BASS_SampleFree(Channel);
  End;

  SendMessage(Win, WM_INFO_UPDATE, 0, 0);

  // Пытаемся создать канал для разных форматов
  Channel := BASS_StreamCreateFile(0, pchar(FileName), 0, 0, 0{$IFDEF UNICODE} Or BASS_UNICODE{$ENDIF});
  application.ProcessMessages;

  If (Channel <> 0) Then
    ChannelType := ctStream
  Else
  Begin
    Channel := BASS_WMA_StreamCreateFile(0, pchar(FileName), 0, 0, 0{$IFDEF UNICODE} Or BASS_UNICODE{$ENDIF});
    application.ProcessMessages;
    If (Channel <> 0) Then
      ChannelType := ctStream
    Else
    Begin
      Channel := BASS_FLAC_StreamCreateFile(0, pchar(FileName), 0, 0, 0{$IFDEF UNICODE}
        Or BASS_UNICODE{$ENDIF});
      application.ProcessMessages;
      If (Channel <> 0) Then
        ChannelType := ctStream
      Else
      Begin
        Channel := BASS_WV_StreamCreateFile(0, pchar(FileName), 0, 0, 0{$IFDEF UNICODE}
          Or BASS_UNICODE{$ENDIF});
        application.ProcessMessages;
        If (Channel <> 0) Then
          ChannelType := ctStream
        Else
        Begin
          Channel := BASS_OFR_StreamCreateFile(0, pchar(FileName), 0, 0, 0{$IFDEF UNICODE}
            Or BASS_UNICODE{$ENDIF});
          application.ProcessMessages;
          If (Channel <> 0) Then
            ChannelType := ctStream
          Else
          Begin
            Channel := BASS_AAC_StreamCreateFile(0, pchar(FileName), 0, 0, 0
              {$IFDEF UNICODE} Or BASS_UNICODE{$ENDIF});
            application.ProcessMessages;
            If (Channel <> 0) Then
              ChannelType := ctStream
            Else
            Begin
              Channel := BASS_AIX_StreamCreateFile(0, pchar(FileName), 0, 0, 0
                {$IFDEF UNICODE} Or BASS_UNICODE{$ENDIF});
              application.ProcessMessages;
              If (Channel <> 0) Then
                ChannelType := ctStream
              Else
              Begin
                Channel := BASS_ADX_StreamCreateFile(0, pchar(FileName), 0, 0, 0
                  {$IFDEF UNICODE} Or BASS_UNICODE{$ENDIF});
                application.ProcessMessages;
                If (Channel <> 0) Then
                  ChannelType := ctStream
                Else

                Begin
                  Channel := BASS_OPUS_StreamCreateFile(0, pchar(FileName), 0, 0, 0
                    {$IFDEF UNICODE} Or BASS_UNICODE{$ENDIF});
                  application.ProcessMessages;
                  If (Channel <> 0) Then
                    ChannelType := ctStream
                  Else
                  Begin
                    Channel := BASS_AC3_StreamCreateFile(0, pchar(FileName), 0, 0, 0
                      {$IFDEF UNICODE} Or BASS_UNICODE{$ENDIF});
                    application.ProcessMessages;
                    If (Channel <> 0) Then
                      ChannelType := ctStream
                    Else
                    Begin
                      Channel := BASS_ALAC_StreamCreateFile(0, pchar(FileName), 0, 0, 0
                        {$IFDEF UNICODE} Or BASS_UNICODE{$ENDIF});
                      application.ProcessMessages;
                      If (Channel <> 0) Then
                        ChannelType := ctStream
                      Else
                      Begin
                        Channel := BASS_APE_StreamCreateFile(0, pchar(FileName), 0, 0, 0
                          {$IFDEF UNICODE} Or BASS_UNICODE{$ENDIF});
                        application.ProcessMessages;
                        If (Channel <> 0) Then
                          ChannelType := ctStream
                        Else
                        Begin
                          Channel := BASS_MPC_StreamCreateFile(0, pchar(FileName), 0, 0, 0
                            {$IFDEF UNICODE} Or BASS_UNICODE{$ENDIF});
                          application.ProcessMessages;
                          If (Channel <> 0) Then
                            ChannelType := ctStream
                          Else
                          Begin
                            Channel := BASS_SPX_StreamCreateFile(0, pchar(FileName), 0, 0, 0{$IFDEF UNICODE} Or BASS_UNICODE{$ENDIF});
                            application.ProcessMessages;
                            If (Channel <> 0) Then
                              ChannelType := ctStream
                            Else
                            Begin
                              Channel := BASS_TTA_StreamCreateFile(0, pchar(FileName), 0, 0, 0{$IFDEF UNICODE} Or BASS_UNICODE{$ENDIF});
                              application.ProcessMessages;
                              If (Channel <> 0) Then
                                ChannelType := ctStream
                              Else
                              Begin
                                Channel := BASS_DSD_StreamCreateFile(0, PChar(FileName), 0, 0, BASS_DSD_RAW{$IFDEF UNICODE} Or BASS_UNICODE{$ENDIF}, 0);
                                application.ProcessMessages;
                                If (Channel <> 0) Then
                                  ChannelType := ctStream
                                Else
                                Begin
                                  Channel := BASS_WEBM_StreamCreateFile(0, PChar(FileName), 0, 0, BASS_DSD_RAW{$IFDEF UNICODE} Or BASS_UNICODE
                                    {$ENDIF}, 0);
                                  application.ProcessMessages;
                                  If (Channel <> 0) Then
                                    ChannelType := ctStream
                                  Else

                                  Begin
                                    BASSMOD_MusicFree;
                                    Channel := BASS_MusicLoad(0, pchar(FileName), 0, 0, BASS_MUSIC_RAMPS Or BASS_MUSIC_POSRESET Or BASS_MUSIC_PRESCAN
                              {$IFDEF UNICODE} Or BASS_UNICODE {$ENDIF}, 1);
                                    application.ProcessMessages;
                                    If (Channel <> 0) Then
                                      ChannelType := ctMusic;
                                    application.ProcessMessages;
                                    BASSMOD_MusicPlay;
                                    application.ProcessMessages;
                                  End;
                                End;
                              End;
                            End;
                          End;
                        End;
                      End;
                    End;
                  End;
                End;
              End;
            End;
          End;
        End;
      End;
    End;
  End;

  If BASS_StreamGetFilePosition(Channel, BASS_FILEPOS_BUFFERING) > 0 Then
    SendMessage(Win, WM_INFO_UPDATE, 2, (100 - (Integer(BASS_StreamGetFilePosition(Channel, BASS_FILEPOS_BUFFERING)))));

  If Channel = 0 Then
    Exit;
    // Проверяем информацию о канале
  BASS_ChannelGetInfo(Channel, ChannelInfo);
  application.ProcessMessages;

  // Проверка на 8-битный звук (неподдерживаемый формат)
  If (ChannelInfo.flags And BASS_SAMPLE_8BITS) > 0 Then
  Begin
    BASS_MusicFree(Channel);
    application.ProcessMessages;
    BASS_StreamFree(Channel);
    application.ProcessMessages;
    Exit;
  End;

  // Загружаем теги
  OtherTag.LoadFromFile(FileName);
  application.ProcessMessages;
  GetFileTagInfo;
  application.ProcessMessages;
  Label_ScrollText.Caption := Fglob;
  application.ProcessMessages;

  If (Channel <> 0) Then
  Begin
    ClearSoundEffectHandles;
    BASS_ChannelPlay(Channel, False);
    Form2.BASS_SetSoundEffects(SNDEffects);
    // Устанавливаем громкость и баланс
    BASS_ChannelSetAttribute(Channel, BASS_ATTRIB_VOL, barVolume.Position / 100);
    application.ProcessMessages;
    BASS_ChannelSlideAttribute(Channel, BASS_ATTRIB_VOL, barVolume.Position / 100, 1000);
    application.ProcessMessages;
    BASS_ChannelSetAttribute(Channel, BASS_ATTRIB_PAN, balanceBar.Position / 50);
    application.ProcessMessages;

  End;

  Result := Channel <> 0;
  application.ProcessMessages;
End;

Function TForm1.BASS_GetMode: DWORD;
Begin
  Result := BASS_ChannelIsActive(Channel);
  application.ProcessMessages;
End;

Function TForm1.BASS_GetLength: DWORD;
Var
  SongLength: Int64;
  FloatLen: FLOAT;
Begin
  Result := 0;
  SongLength := 0;
  Case ChannelType Of
    ctUnknown:
      Exit;
    ctStream, ctMusic, ctSample:
      SongLength := BASS_ChannelGetLength(Channel, 0);
  End;
  If SongLength < 0 Then
    SongLength := 0;
  FloatLen := BASS_ChannelBytes2Seconds(Channel, SongLength);
  Result := Round(1000 * FloatLen);
  application.ProcessMessages;
End;

// Определение положения трека
Function TForm1.BASS_GetPosition: DWORD;
Var
  SongPos: Int64;
  FloatPos: FLOAT;
Begin
  Result := 0;
  Case ChannelType Of
    ctUnknown:
      Exit;
    ctStream:
      Begin
        SongPos := BASS_ChannelGetPosition(Channel, 0);
        If SongPos < 0 Then
          SongPos := 0;
        FloatPos := BASS_ChannelBytes2Seconds(Channel, SongPos);
        Result := Round(1000 * FloatPos);
        application.ProcessMessages;
      End;

    ctMusic:
      Begin
        SongPos := BASS_ChannelGetPosition(Channel, 0);
        If SongPos < 0 Then
          SongPos := 0;
        FloatPos := BASS_ChannelBytes2Seconds(Channel, SongPos);
        Result := Round(1000 * FloatPos);
        application.ProcessMessages;
      End;

    ctSample:
      Begin
        SongPos := BASS_ChannelGetPosition(Channel, 0);
        If SongPos < 0 Then
          SongPos := 0;
        FloatPos := BASS_ChannelBytes2Seconds(Channel, SongPos);
        Result := Round(1000 * FloatPos);
        application.ProcessMessages;
      End;
  End;
End;

// Установка положения трека
Procedure TForm1.BASS_SetPosition(Const Value: DWORD);
Var
  SongPos: Int64;
Begin
  If ChannelType = ctUnknown Then
    Exit;
  If Value > BASS_GetLength Then
    Exit;
  If (BASS_GetMode = BASS_ACTIVE_STOPPED) Then
    Exit;
  SongPos := BASS_ChannelSeconds2Bytes(Channel, Value / 1000);
  application.ProcessMessages;
  Case ChannelType Of
    ctUnknown:
      Exit;
    ctStream:
      BASS_ChannelSetPosition(Channel, SongPos, 0);
    ctMusic:
      BASS_ChannelSetPosition(Channel, SongPos, 0);
    ctSample:
      BASS_ChannelSetPosition(Channel, SongPos, 0);
  End;
End;

Function GridIsEmpty(G: TStringGrid): Boolean;
Begin
  Result := ((G.RowCount = 1) And (Length(Trim(G.Rows[G.RowCount - 1].CommaText)) = G.ColCount - 1));
End;


{function LoadImageToTImage(Image: TImage; ResourceID: Integer;
  ResourceType: PChar = RT_RCDATA): Boolean;
var
  Stream: TResourceStream;
begin
  Result := False;
  try
    Stream := TResourceStream.CreateFromID(HInstance, ResourceID, ResourceType);
    try
      Image.Picture.LoadFromStream(Stream);
      Result := True;
    finally
      Stream.Free;
    end;
  except
    // Обработка ошибок загрузки
    Image.Picture := nil;
  end;
end;  }

Function GetImageDimensionsFromMemory(Location: Pointer; MemorySize: Int64; Var Width, Height: Integer): Boolean;
Var
  dib: PFIBITMAP;
  t: FREE_IMAGE_FORMAT;
  MemoryHandle: PFIMEMORY;
  Flags: Integer;
Begin
  Result := False;
  Width := 0;
  Height := 0;

  If Not FreeImageDLLLoaded Then
    Exit;

  Try
    MemoryHandle := FIL_FreeImage_OpenMemory(Location, MemorySize);
    Try
      t := FIL_FreeImage_GetFileTypeFromMemory(MemoryHandle, 0);

      If t = FIF_UNKNOWN Then
        Exit;

      Flags := 0;
      If t = FIF_JPEG Then
        Flags := JPEG_ACCURATE;

      dib := FIL_FreeImage_LoadFromMemory(t, MemoryHandle, Flags);
      If Assigned(dib) Then
      Begin
        Try
          Width := FIL_FreeImage_GetWidth(dib);
          Height := FIL_FreeImage_GetHeight(dib);
          Result := (Width > 0) And (Height > 0);
        Finally
          FIL_FreeImage_Unload(dib);
        End;
      End;
    Finally
      FIL_FreeImage_CloseMemory(MemoryHandle);
    End;
  Except
    // Игнорируем ошибки
  End;
End;

Function LoadImageFromResourceToTImageWithLanczos(Image: TImage; ResourceID: Integer; ResourceType: PChar = RT_RCDATA; FitToControl: Boolean = True): Boolean;
Var
  Stream: TResourceStream;
  MemoryStream: TMemoryStream;
  Bitmap: TBitmap;
  OriginalWidth, OriginalHeight: Integer;
  Scale: Double;
  NewWidth, NewHeight: Integer;
Begin
  Result := False;

  If Not FreeImageDLLLoaded Then
    If Not InitFreeImageLibrary Then
      Exit;

  Try
    Stream := TResourceStream.CreateFromID(HInstance, ResourceID, ResourceType);
    Try
      MemoryStream := TMemoryStream.Create;
      Try
        MemoryStream.CopyFrom(Stream, 0);
        MemoryStream.Position := 0;

        Bitmap := TBitmap.Create;
        Try
          // Получаем размеры изображения
          If GetImageDimensionsFromMemory(MemoryStream.Memory, MemoryStream.Size, OriginalWidth, OriginalHeight) Then
          Begin
            If FitToControl And (Image.Width > 0) And (Image.Height > 0) Then
            Begin
              // Рассчитываем размеры для вписывания в контрол
              Scale := Min(Image.Width / OriginalWidth, Image.Height / OriginalHeight);
              NewWidth := Trunc(OriginalWidth * Scale);
              NewHeight := Trunc(OriginalHeight * Scale);

              // Всегда используем FILTER_LANCZOS3 для наилучшего качества
              Result := FreeImageLoadImageFromMemoryWithRescaleTBitmap(MemoryStream.Memory, MemoryStream.Size, Bitmap, NewWidth, NewHeight, FILTER_LANCZOS3,
                // Явно указываем высококачественный фильтр
                True,             // Сохранять пропорции
                0);
            End
            Else
            Begin
              // Загрузка без масштабирования
              Result := FreeImageLoadImageFromMemoryTBitmap(MemoryStream.Memory, MemoryStream.Size, Bitmap, 0);
            End;
          End;

          If Result Then
          Begin
            // Настраиваем TImage
            Image.AutoSize := False;
            Image.Stretch := True;
            Image.Proportional := True;
            Image.Center := True;
            Image.Picture.Bitmap.Assign(Bitmap);
          End;
        Finally
          Bitmap.Free;
        End;
      Finally
        MemoryStream.Free;
      End;
    Finally
      Stream.Free;
    End;
  Except
    Image.Picture := Nil;
    Result := False;
  End;
End;


// Включить радио
Procedure TForm1.Radio;
Const
  WM_INFO_UPDATE = WM_USER + 101;
Begin
  LoadImageFromResourceToTImageWithLanczos(ImageTAG, 101, RT_RCDATA, True);
  LoadImageFromResourceToTImageWithLanczos(Form3.ImageTAGTray, 101, RT_RCDATA, True);
  // Останавливаем предыдущий поток
  If Channel <> 0 Then
  Begin
    BASS_ChannelStop(Channel);
    // Немедленное освобождение (в основном потоке, т.к. уже остановлено)
    BASS_StreamFree(Channel);
    Channel := 0;
  End;

  Taskbar1.ProgressState := TTaskBarProgressState.None;
  Taskbar1.OverlayIcon := Nil;

  application.ProcessMessages;

  t := Now;
  song := PansiChar(AnsiString(Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row]));

  // Устанавливаем таймаут для BASS (в миллисекундах)
  BASS_SetConfig(BASS_CONFIG_NET_TIMEOUT, 10000); // 10 секунд
  BASS_SetConfig(BASS_CONFIG_NET_READTIMEOUT, 10000); // 10 секунд на чтение

  // Визуальная индикация

  Taskbar1.ProgressState := TTaskBarProgressState.Indeterminate;
  application.ProcessMessages;

  // Пытаемся создать поток (остаемся в основном потоке, но с таймаутом)
  Channel := BASS_StreamCreateURL(PChar(song), 0, BASS_STREAM_BLOCK Or BASS_STREAM_STATUS Or BASS_STREAM_AUTOFREE Or BASS_STREAM_RESTRATE Or BASS_ASYNCFILE, Nil, Nil);

  If Channel = 0 Then
  Begin

    Taskbar1.ProgressState := TTaskBarProgressState.Error;
    Exit;
  End;

  // Если соединение успешно, продолжаем воспроизведение
  ContinuePlayback;
End;

Procedure TForm1.ContinuePlayback;
Begin
  // Воспроизведение
  If Not BASS_ChannelPlay(Channel, False) Then
  Begin
    ShowMessage('Playback error: ' + IntToStr(BASS_ErrorGetCode));
    BASS_StreamFree(Channel);
    Channel := 0;
    Exit;
  End;

  // Настройки аудио
  BASS_ChannelSetAttribute(Channel, BASS_ATTRIB_VOL, barVolume.Position / 100);
  BASS_ChannelSlideAttribute(Channel, BASS_ATTRIB_VOL, barVolume.Position / 100, 1000);
  BASS_ChannelSetAttribute(Channel, BASS_ATTRIB_PAN, balanceBar.Position / 50);
  BASS_ChannelSetAttribute(Channel, BASS_ATTRIB_BUFFER, 10000);

  // Настройка эквалайзера
  If Assigned(Form2) Then
  Begin
    If Form2.chEqualizer.Checked Then
    Begin
      Form2.BASS_RestoreSoundEffect;
      Include(SNDEffects, seEqualizer);
      Form2.BASS_SetSoundEffects(SNDEffects);
    End
    Else
    Begin
      Form2.BASS_RestoreSoundEffect;
      Exclude(SNDEffects, seEqualizer);
      Form2.BASS_SetSoundEffects(SNDEffects);
    End;
  End;

  // Обновление интерфейса

  Taskbar1.ProgressState := TTaskBarProgressState.Normal;
  Timer_Radio.Enabled := True;

  // Проверка формата аудио
  BASS_ChannelGetInfo(Channel, ChannelInfo);

  If (ChannelInfo.flags And BASS_SAMPLE_8BITS) > 0 Then
  Begin
    BASS_StreamFree(Channel);
    Channel := 0;
    Exit;
  End;

  // Определение стерео/моно
  If Channels(Channel) > 1 Then
    Label_Stereo.Caption := 'Stereo'
  Else
    Label_Stereo.Caption := 'Mono';

 { If Assigned(form2) Then
    form2.TaskTrackGoClick(self); }
End;

Procedure TForm1.LoadGrid(G: TStringGrid; SL: TStringList);
Var
  i: Integer;
Begin
  G.RowCount := G.FixedRows + SL.Count;
  For i := 0 To SL.Count - 1 Do
    G.Rows[G.FixedRows + i].CommaText := SL.Strings[i];
End;

Procedure TForm1.SearchBox1Change(Sender: TObject);
Var
  r, c: Integer;
  i: Integer;
  T: TStringList;
  B: Boolean;
Begin
  If GridIsEmpty(StringGrid2) Then
  Begin
    Exit;
  End;
  If SearchBox1.Text <> '' Then
  Begin
    ClearGrid;
    T := TStringList.Create;
    For i := 0 To StringGrid2.RowCount - 1 Do
    Begin
      B := pos(SearchBox1.Text, StringGrid2.Cells[1, i]) > 0;
      If B Then
        T.Add(StringGrid2.Rows[i].CommaText);
    End;
    If T.Count > 0 Then
      LoadGrid(StringGrid1, T);
    T.Free;
    // DeleteEmptyRow;
    SongNumberSG;
    RandomSongSG;
    application.ProcessMessages;
  End;

  If SearchBox1.Text = '' Then
  Begin
    ClearGrid;
    StringGrid1.ColCount := StringGrid2.ColCount;
    StringGrid1.RowCount := StringGrid2.RowCount;
    For r := 0 To StringGrid2.RowCount - 1 Do
    Begin
      For c := 0 To StringGrid2.ColCount - 1 Do
      Begin
        StringGrid1.Cells[c, r] := StringGrid2.Cells[c, r];
      End;
    End;
    // DeleteEmptyRow;
    SongNumberSG;
    RandomSongSG;
    application.ProcessMessages;
  End;
End;

Procedure TForm1.Timer_PlayTimer(Sender: TObject);
Var
  TrackLen, TrackPos: Double;
  ValPos: Double;
  Times: Double;
Begin
  If Mode <> Play Then
    Exit;
  If (BASS_ChannelGetPosition(Channel, 0) = BASS_ChannelGetLength(Channel, 0)) Or (BASS_ChannelIsActive(Channel) = 0) Then
  Begin
    If form2.RepeatSong.Checked = False Then
    Begin
      If form2.AutoNext.Checked = True Then
      Begin
        NextFileSG;
        // Следующая песня
      End;
      If form2.AutoNext.Checked = False Then
      Begin
        StopMusic; // Стоп
      End;
    End;

    If form2.RepeatSong.Checked = True Then
    Begin
      If (BASS_GetMode <> BASS_ACTIVE_STOPPED) Or (Mode <> Stop) Then
        BASS_ChannelSlideAttribute(Channel, BASS_ATTRIB_VOL, 0, 1000);
      BASS_ChannelStop(Channel);
      BASS_ChannelFlags(Channel, BASS_SAMPLE_LOOP, BASS_SAMPLE_LOOP);
      Mode := Play;
      Form1.barSeek.Enabled := True;
      FileName := FileName;
      Form1.audioPlay;
      Form1.MemoPlayHistory.Lines.Add(inttostr(Form1.StringGrid1.Row + 1));
      application.ProcessMessages;
      If form2.BaloonWindow.Checked = True Then
      Begin
        Form3.close;
        Form3.Show;
        application.ProcessMessages;
      End;
    End;
  End;

  If (BASS_GetMode <> BASS_ACTIVE_STOPPED) Then
  Begin
    If Not barSeek.Enabled Then
      barSeek.Enabled := True;
    CHANGE_POS := False;
    barSeek.Position := (BASS_GetPosition * DWORD(barSeek.Max)) Div BASS_GetLength;
    If form2.ProgressBox.Checked = True Then
    Begin
      Taskbar1.OverlayIcon := ImageOverlayPlay.Picture.Icon;
      Taskbar1.ProgressState := TTaskBarProgressState.Normal;
      Taskbar1.ProgressValue := Form1.barSeek.Position;
      application.ProcessMessages;
    End;
    If form2.ProgressBox.Checked = False Then
    Begin
      Taskbar1.ProgressState := TTaskBarProgressState.None;
      Taskbar1.OverlayIcon := Nil;
      application.ProcessMessages;
    End;
    CHANGE_POS := True;
  End;

  TrackPos := BASS_ChannelBytes2Seconds(Channel, BASS_ChannelGetPosition(Channel, 0));
  TrackLen := BASS_ChannelBytes2Seconds(Channel, BASS_ChannelGetLength(Channel, 0));
  ValPos := TrackPos / (24 * 3600);
  Times := TrackLen - TrackPos;
  application.ProcessMessages;
  kbpsCaption.Caption := inttostr(GetKBPS(Channel)) + ' kbps';
  HzCaption.Caption := KhzToStr;
  SizeCaption.Caption := GetNormalSize(GetMyFileSize(FileName));
  If Channels(Channel) > 1 Then
    Label_Stereo.Caption := 'Stereo'
  Else
    Label_Stereo.Caption := 'Mono';
  application.ProcessMessages;
  If StatusBarTime.Tag = 1 Then
  Begin
    StatusBarTime.Panels[0].Text := ' ' + FormatDateTime('hh:mm:ss', ValPos);
    application.ProcessMessages;
  End;

  If StatusBarTime.Tag = 0 Then
  Begin
    StatusBarTime.Panels[0].Text := '-' + FormatDateTime('hh:mm:ss', Times / (24 * 3600));
    application.ProcessMessages;
  End;

  Form1.barSeek.Hint := FormatDateTime('hh:mm:ss', ValPos);
  application.ActivateHint(Mouse.CursorPos);
  application.ProcessMessages;
End;

Function MinToSec(tim: String): String;
Var
  n: Integer;
  a: String;
Begin
  Try
    n := 1;
    a := '';
    Repeat
      a := a + tim[n];
      Inc(n);
    Until tim[n] = ':';
    delete(tim, 1, Length(a) + 1);
    Result := inttostr((strtoint(a) * 60) + strtoint(tim));
  Except
  End;
End;

// Функция для преобразования строки времени в секунды
Function TimeStrToSeconds(TimeStr: String): Integer;
Var
  Parts: TStringList;
  Mins, Secs: Integer;
  ColonPos: Integer;
Begin
  Result := -1; // По умолчанию - ошибка

  TimeStr := Trim(TimeStr);
  If TimeStr = '' Then
    Exit;

  // Если строка уже содержит только цифры (уже в секундах)
  If TryStrToInt(TimeStr, Result) Then
    Exit;

  // Ищем двоеточие
  ColonPos := Pos(':', TimeStr);

  If ColonPos > 0 Then
  Begin
    // Формат MM:SS или H:MM:SS
    Parts := TStringList.Create;
    Try
      Parts.Delimiter := ':';
      Parts.StrictDelimiter := True;
      Parts.DelimitedText := TimeStr;

      If Parts.Count = 2 Then
      Begin
        // Формат MM:SS
        If TryStrToInt(Parts[0], Mins) And TryStrToInt(Parts[1], Secs) Then
          Result := Mins * 60 + Secs;
      End
      Else If Parts.Count = 3 Then
      Begin
        // Формат H:MM:SS
        If TryStrToInt(Parts[0], Mins) And TryStrToInt(Parts[1], Secs) Then
        Begin
          Result := Mins * 3600 + StrToInt(Parts[1]) * 60 + StrToInt(Parts[2]);
        End;
      End;
    Finally
      Parts.Free;
    End;
  End
  Else
  Begin
    Try
      Result := Round(StrToFloat(TimeStr) * 60);
    Except
      Result := -1;
    End;
  End;
End;

// Сохранение плейлиста
Procedure TForm1.SaveList(SaveFile: String);
Var
  List: TStringList;
  i: Integer;
  DurationStr, TrackName, FilePath: String;
  DurationSec: Integer;
Begin
  Try
    List := TStringList.Create;
    List.Add('#EXTM3U');
    For i := 0 To Form1.StringGrid1.RowCount - 1 Do // Начинаем с 1, если 0 - заголовки
    Begin
      TrackName := Trim(StringGrid1.Cells[1, i]);
      FilePath := Trim(StringGrid1.Cells[3, i]);
      If (TrackName = '') Or (FilePath = '') Then
        Continue;
      DurationStr := Trim(StringGrid1.Cells[2, i]);
      DurationSec := TimeStrToSeconds(DurationStr);
      If DurationSec < 0 Then
        DurationSec := -1;
      List.Add('#EXTINF:' + IntToStr(DurationSec) + ',' + TrackName);
      List.Add(FilePath);
      Application.ProcessMessages;
    End;
    List.SaveToFile(SaveFile, TEncoding.UTF8);
    List.Free;
    Application.ProcessMessages;

  Except
  End;
End;



// Добавить медиа данные в плейлист
Procedure TForm1.addMedia;
Var
  i, step: Integer;
  TrackLen2: Double;
  Channel2: DWORD;
  ChannelType2: TChannelType;
  FileName2: String;
  TempStr: String; // Временная переменная для безопасного преобразования
Begin
  Try
    step := 0;
    Channel2 := 0;
    TrackLen2 := 0;
    ChannelType2 := ctUnknown;

    For i := 0 To Form1.StringGrid1.RowCount - 1 Do
    Begin
      // Освобождаем предыдущий канал
      If Channel2 <> 0 Then
      Begin
        Case ChannelType2 Of
          ctMusic:
            BASS_MusicFree(Channel2);
          ctStream:
            BASS_StreamFree(Channel2);
          ctSample:
            BASS_SampleFree(Channel2); // если используете сэмплы
        End;
        Channel2 := 0;
        ChannelType2 := ctUnknown;
      End;

      FileName2 := Form1.StringGrid1.Cells[3, i];

      // Проверяем существование файла
      If Not FileExists(FileName2) Then
        Continue;

      // Обновляем статус
      //Form1.StatusBarInfo.Panels[3].Text := Form1.StringGrid1.Cells[1, i];
      Application.ProcessMessages;

      // Пытаемся загрузить файл разными способами
      Channel2 := BASS_StreamCreateFile(0, PChar(FileName2), 0, 0, BASS_SAMPLE_FLOAT
        {$IFDEF UNICODE} Or BASS_UNICODE{$ENDIF});

      If Channel2 <> 0 Then
        ChannelType2 := ctStream
      Else
      Begin
        Channel2 := BASS_MusicLoad(0, PChar(FileName2), 0, 0, BASS_MUSIC_RAMPS Or BASS_MUSIC_POSRESET Or BASS_MUSIC_PRESCAN
                   {$IFDEF UNICODE} Or BASS_UNICODE{$ENDIF}, 1);
        If Channel2 <> 0 Then
          ChannelType2 := ctMusic;
      End;

      // Получаем длину трека
      If Channel2 <> 0 Then
      Begin
        Try
          TrackLen2 := BASS_ChannelBytes2Seconds(Channel2, BASS_ChannelGetLength(Channel2, BASS_POS_BYTE));
          If TrackLen2 < 0 Then
            TrackLen2 := 0;
        Except
          TrackLen2 := 0;
        End;
      End
      Else
      Begin
        TrackLen2 := 0;
      End;

      // Обновляем прогресс
      step := step + 1;
      If Form1.StringGrid1.RowCount > 1 Then
        Form1.StatusBarInfo.Panels[3].Text := FloatToStr(Round(step / (Form1.StringGrid1.RowCount - 1) * 100)) + ' %';
      Application.ProcessMessages;

      // Форматируем и устанавливаем время
      Try
        If TrackLen2 > 0 Then
          Form1.StringGrid1.Cells[2, i] := Format('%d:%.2d', [Trunc(TrackLen2) Div 60, Trunc(TrackLen2) Mod 60])
        Else
          Form1.StringGrid1.Cells[2, i] := '0:00';
      Except
        Form1.StringGrid1.Cells[2, i] := '0:00';
      End;

      // Загружаем теги
      Try
        OtherTag2.LoadFromFile(FileName2);
      Except
        OtherTag2.Loaded := False;
      End;

      // Если теги не загружены или пустые, используем имя файла
      If (Not OtherTag2.Loaded) Or (Trim(OtherTag2.GetText('ARTIST') + OtherTag2.GetText('TITLE')) = '') Then
      Begin
        // БЕЗОПАСНОЕ преобразование - используем временную переменную
        TempStr := Form1.ExtractOnlyFileName(Form1.StringGrid1.Cells[3, i]);
        Form1.StringGrid1.Cells[1, i] := TempStr;
      End
      Else
      Begin
        // Используем теги
        TempStr := Trim(OtherTag2.GetText('ARTIST'));
        If TempStr <> '' Then
          TempStr := TempStr + ' - ' + Trim(OtherTag2.GetText('TITLE'))
        Else
          TempStr := Trim(OtherTag2.GetText('TITLE'));

        Form1.StringGrid1.Cells[1, i] := TempStr;
      End;

      Application.ProcessMessages;
    End; // конец цикла for

  Finally
    // Освобождаем последний канал
    If Channel2 <> 0 Then
    Begin
      Case ChannelType2 Of
        ctMusic:
          BASS_MusicFree(Channel2);
        ctStream:
          BASS_StreamFree(Channel2);
        ctSample:
          BASS_SampleFree(Channel2);
      End;
      Channel2 := 0;
    End;

    // Очищаем статус
    Form1.StatusBarInfo.Panels[3].Text := '';
    Application.ProcessMessages;
  End;
End;

// Громкость
Procedure TForm1.barVolumeChange(Sender: TObject);
Begin
  BASS_ChannelSetAttribute(Channel, BASS_ATTRIB_VOL, Form1.barVolume.Position / 100);
  If barVolume.Visible = True Then
  Begin
    Form1.barVolume.Hint := inttostr(barVolume.Position) + '%';
    application.ActivateHint(Mouse.CursorPos);
    If barVolume.Position <> 0 Then
    Begin
      SoundButton.ImageIndex := 10;
      SoundButton.Tag := 0;
    End;
    If barVolume.Position = 0 Then
    Begin
      SoundButton.ImageIndex := 9;
      SoundButton.Tag := 1;
    End;
  End;
  self.ActiveControl := Nil;
End;

// Системная громкость
Procedure TForm1.barVolumeSysChange(Sender: TObject);
Begin
  If Not FVolumeUpdating Then
    FEndpoint.SetMasterVolumeLevelScalar(barVolumeSys.Position / 100, Nil);
  If barVolumeSys.Visible = True Then
  Begin
    Form1.barVolumeSys.Hint := inttostr(barVolumeSys.Position) + '%';
    application.ActivateHint(Mouse.CursorPos);
    nVolSys := barVolumeSys.Position;
    If barVolumeSys.Position <> 0 Then
    Begin
      SoundButton.ImageIndex := 10;
      SoundButton.Tag := 0;
    End;
    If barVolumeSys.Position = 0 Then
    Begin
      SoundButton.ImageIndex := 9;
      SoundButton.Tag := 1;
    End;
  End;
  self.ActiveControl := Nil;
End;

// Список плейлистов
Procedure TForm1.ListFileDir(Path, Ext: String; aCombobox: TComboBox; HideExt: Boolean);
Var
  SR: TSearchRec;
Begin
  If FindFirst(Path + Ext, faAnyFile, SR) = 0 Then
  Begin
    Repeat
      If (SR.Attr <> faDirectory) Then
        If HideExt Then
        Begin
          // удаляем расширение
          delete(SR.Name, Length(SR.Name) - 3, 4);
          If ExtractFileName(SR.Name) <> '' Then
          Begin

            aCombobox.Items.Add(SR.Name);
            application.ProcessMessages;
          End;
        End
        Else If ExtractFileName(SR.Name) <> '' Then
        Begin
          aCombobox.Items.Add(SR.Name);
          application.ProcessMessages;
        End;
    Until FindNext(SR) <> 0;
    FindClose(SR);
    application.ProcessMessages;
  End;
End;

// Глобальная предзагрузка
Procedure TForm1.Globload;
Var
  i: Integer;
  Internat: TTranslation;
  Ini: TMemIniFile;
  lang, lang_file: String;
Begin
  For i := 0 To Screen.FormCount - 1 Do
  Begin
    Ini := TMemIniFile.Create(Form1.PortablePath);
    lang := Ini.ReadString('Language', 'Language', '');
    lang_file := ExtractFilePath(ParamStr(0)) + 'Language\' + lang + '.ini';
    Ini.Free;
    Ini := TMemIniFile.Create(lang_file);
    If Ini.SectionExists('Audio Player') Then // Используем конкретную секцию
    Begin
      Internat.Execute(Screen.Forms[i], 'Audio Player'); // Передаем имя секции
      Application.ProcessMessages;
    End;
    Ini.Free;
  End;
End;

Procedure TForm1.GlobLoadNastr;
Begin

  If FileExists(Form1.PortablePath) = False Then
  Begin
    Form1.MemoOption.Lines.SaveToFile(Form1.PortablePath, TEncoding.Unicode);
    Form1.LoadNastr;
    form2.LoadNastr2;
  End
  Else
  Begin
    Form1.LoadNastr;
    form2.LoadNastr2;
  End;
End;

Function GetTempDir(): String;
Var
  Buf: String;
  Len: UINT;
Begin
  SetLength(Buf, MAX_PATH + 1);
  Len := GetTempPath(MAX_PATH, pchar(Buf));
  SetLength(Buf, Len);
  GetTempDir := Buf;
  application.ProcessMessages;
End;

Procedure TForm1.saveTemp;
Var
  i: Integer;
  ImageJPEG: TJPEGImage;
  ImagePNG: TPNGImage;
  ImageGIF: TGIFImage;
  Bitmap: TBitmap;
  FileNameImage: String;
  FileSong: String;
Begin
  If FileExists(FileName) = False Then
    Exit;
  OtherTag.LoadFromFile(FileName);
  FileSong := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row];
  application.ProcessMessages;
  For i := 0 To OtherTag.CoverArtCount - 1 Do
  Begin
    application.ProcessMessages;
    Bitmap := TBitmap.Create;
    Try
      With OtherTag.CoverArts[i] Do
      Begin
        Stream.Seek(0, soBeginning);
        Case PictureFormat Of
          tpfJPEG:
            Begin
              ImageJPEG := TJPEGImage.Create;
              application.ProcessMessages;
              Try
                ImageJPEG.LoadFromStream(Stream);
                FileNameImage := FileSong + '.jpg';
                ImageJPEG.SaveToFile(GetTempDir + FileNameImage);
                ShellExecute(Handle, 'open', pchar(GetTempDir + FileNameImage), Nil, Nil, SW_SHOW);
                // Bitmap.Assign(ImageJPEG);
                application.ProcessMessages;
              Except
                FreeAndNil(ImageJPEG);
              End;
            End;
          tpfPNG:
            Begin
              ImagePNG := TPNGImage.Create;
              Try
                ImagePNG.LoadFromStream(Stream);
                FileNameImage := FileSong + '.png';
                ImagePNG.SaveToFile(GetTempDir + FileNameImage);
                ShellExecute(Handle, 'open', pchar(GetTempDir + FileNameImage), Nil, Nil, SW_SHOW);
                // Bitmap.Assign(ImagePNG);
                application.ProcessMessages;
              Except
                FreeAndNil(ImagePNG);
              End;
            End;
          tpfGIF:
            Begin
              ImageGIF := TGIFImage.Create;
              Try
                ImageGIF.LoadFromStream(Stream);
                FileNameImage := FileSong + '.gif';
                ImageGIF.SaveToFile(GetTempDir + FileNameImage);
                ShellExecute(Handle, 'open', pchar(GetTempDir + FileNameImage), Nil, Nil, SW_SHOW);
                // Bitmap.Assign(ImageGIF);
                application.ProcessMessages;
              Except
                FreeAndNil(ImageGIF);
              End;
            End;
          tpfBMP:
            Begin
              Bitmap.LoadFromStream(Stream);
              FileNameImage := FileSong + '.bmp';
              Bitmap.SaveToFile(GetTempDir + FileNameImage);
              ShellExecute(Handle, 'open', pchar(GetTempDir + FileNameImage), Nil, Nil, SW_SHOW);
              application.ProcessMessages;
            End;
        End;
        Stream.Seek(0, soFromBeginning);
        application.ProcessMessages;
      End;
    Except
      FreeAndNil(Bitmap);
    End;
  End;

End;

Procedure TForm1.ImageTAGClick(Sender: TObject);
Begin
  saveTemp;
End;

// Загрузка настроек
Procedure TForm1.LoadNastr;
Var
  i, TargetRow: Integer;
Begin
  Ini := TMemIniFile.Create(Form1.PortablePath);

  For i := 0 To ThemeMenu.Count - 1 Do
  Begin
    ThemeMenu.Items[i].Checked := Ini.ReadBool(option, ThemeMenu.Items[i].Name, False);
    If ThemeMenu.Items[i].Checked = True Then
    Begin
      ThemeMenu.Items[i].Click;
    End;
  End;

  If Ini.ReadString(option, 'Window', '') = 'wsMaximized' Then
  Begin
    Form1.WindowState := wsMaximized;
  End;

  If Ini.ReadString(option, 'Window', '') = 'wsNormal' Then
  Begin
    Form1.Top := Ini.ReadInteger(option, 'Top', Form1.Top);
    Form1.Left := Ini.ReadInteger(option, 'Left', Form1.Left);
    Form1.Height := Ini.ReadInteger(option, 'Height', Form1.Height);
    Form1.Width := Ini.ReadInteger(option, 'Width', Form1.Width);
    Form1.Constraints.MinWidth := Ini.ReadInteger(option, 'MinWidth', 240);
    Form1.Constraints.MinHeight := Ini.ReadInteger(option, 'MinHeight', 600);
  End;

  Form1.ComboBox_Playlist.Items.Clear;
  ListFileDir(PortablePathM3U, '*.m3u', ComboBox_Playlist, True);
  Form1.ComboBox_Playlist.ItemIndex := Form1.ComboBox_Playlist.Items.IndexOf(Ini.ReadString(option, 'Playlist', ''));
  ComboBox_PlaylistChange(self);

  TargetRow := Ini.ReadInteger(option, 'Song', 0);
  If (TargetRow >= 0) And (TargetRow < StringGrid1.RowCount) Then
  Begin
    Try
      StringGrid1.Row := TargetRow;
      StringGrid1.TopRow := Max(0, TargetRow - (StringGrid1.VisibleRowCount Div 2));
    Except
    End;
    Try
      If StringGrid1.CanFocus Then
        StringGrid1.SetFocus;
    Except
    End;
  End;

  Form1.StringGrid1.ColAlignments[2] := taRightJustify;
  ColumnWidthAlign(StringGrid1, 0);
  ColumnWidthAlign(StringGrid1, 2);
  Form1.StringGrid1.ColWidths[1] := Form1.StringGrid1.Width - Form1.StringGrid1.ColWidths[0] - Form1.StringGrid1.ColWidths[2] - 20;
  If FileExists(PortablePathMusic + 'song.ini') Then
  Begin
    Form1.LoadSong
  End
  Else
  Begin
    MemoPlayHistory.Lines.SaveToFile(PortablePathMusic + 'song.ini', TEncoding.Unicode);
    Form1.LoadSong;
  End;

  If (FileExists(PortablePathMusic + 'randomsong.ini')) And (form2.RandomTrack.Checked = True) Then
  Begin
    Form1.LoadSongRandom;
  End;

  Form1.StatusBarTime.Tag := Ini.ReadInteger(option, 'StartTime', StatusBarTime.Tag);
  Form1.barVolume.Position := Ini.ReadInteger(option, 'Volume', 100);
  nVol := barVolume.Position;
  nVolSys := barVolumeSys.Position;

  Form1.balanceBar.Position := Ini.ReadInteger(option, 'Balans', 0);

  Ini.Free;
End;

Function GetAppDataRoamingPath: String;
Var
  Path: Array[0..MAX_PATH] Of Char;
Begin
  If SUCCEEDED(SHGetFolderPath(0, CSIDL_APPDATA, 0, 0, @Path[0])) Then
    Result := IncludeTrailingPathDelimiter(Path)
  Else
    Result := '';
End;

Function TForm1.PortablePath: String;
Begin
  If portable Then
    Result := ExtractFilePath(Paramstr(0)) + 'Config\Option.ini'
  Else
    Result := IncludeTrailingPathDelimiter(GetAppDataRoamingPath) + IncludeTrailingPathDelimiter(getCompanyName(Paramstr(0))) + 'Audio Player\Config\Option.ini';
    //Result := ExtractFilePath(Paramstr(0)) + 'Config\Option.ini';
  // Создаем папку для конфига
  SysUtils.ForceDirectories(ExtractFilePath(Result));
End;

Function TForm1.PortablePathMusic: String;
Begin
  If portable Then
    Result := ExtractFilePath(Paramstr(0)) + 'Config\'
  Else
    Result := IncludeTrailingPathDelimiter(GetAppDataRoamingPath) + IncludeTrailingPathDelimiter(getCompanyName(Paramstr(0))) + 'Audio Player\Config\';
    //Result := ExtractFilePath(Paramstr(0)) + 'Config\';
  // Создаем папку для конфига
  SysUtils.ForceDirectories(Result);
End;

Function TForm1.PortablePathM3U: String;
Begin
  If portable Then
    Result := ExtractFilePath(Paramstr(0)) + 'Playlist\'
  Else
    Result := IncludeTrailingPathDelimiter(GetAppDataRoamingPath) + IncludeTrailingPathDelimiter(getCompanyName(Paramstr(0))) + 'Audio Player\Playlist\';
      //Result := ExtractFilePath(Paramstr(0)) + 'Playlist\';
  // Создаем папку для конфига
  SysUtils.ForceDirectories(Result);
End;

// Сохранение настроек
Procedure TForm1.SaveNastr;
Var
  Ini: TMemIniFile;
  i: Integer;
Begin
  Ini := TMemIniFile.Create(Form1.PortablePath);
  Try
    Ini.WriteInteger(option, 'StartTime', Form1.StatusBarTime.Tag);
    Ini.WriteInteger(option, 'Volume', Form1.barVolume.Position);
    Ini.WriteInteger(option, 'Balans', Form1.balanceBar.Position);
    Ini.WriteString(option, 'Playlist', Form1.ComboBox_Playlist.Text);
    Ini.WriteInteger(option, 'Song', Form1.StringGrid1.Row);

    Ini.WriteBool('Option', Form10.CheckBoxQuickUpdate.Name, Form10.CheckBoxQuickUpdate.Checked);

    For i := 0 To ThemeMenu.Count - 1 Do
    Begin
      Ini.WriteBool(option, ThemeMenu.Items[i].Name, ThemeMenu.Items[i].Checked);
    End;

    SaveList(pchar(PortablePathM3U + Form1.ComboBox_Playlist.Text) + '.m3u');

    If Form1.WindowState = wsMaximized Then
    Begin
      Ini.WriteString(option, 'Window', 'wsMaximized');
    End;
    If Form1.WindowState <> wsMaximized Then
    Begin
      Ini.WriteString(option, 'Window', 'wsNormal');
      Ini.WriteInteger(option, 'Top', Form1.Top);
      Ini.WriteInteger(option, 'Left', Form1.Left);
      Ini.WriteInteger(option, 'Height', Form1.Height - 4);
      Ini.WriteInteger(option, 'Width', Form1.Width - 4);
      Ini.WriteInteger(option, 'MinWidth', Form1.Constraints.MinWidth);
      Ini.WriteInteger(option, 'MinHeight', Form1.Constraints.MinHeight);
    End;
    Ini.UpdateFile;
  Finally
    Ini.Free;
  End;

End;

Procedure TForm1.ShowMainWindowTryMenuClick(Sender: TObject);
Begin
  application.Restore;
  SetForegroundWindow(application.Handle);
End;

Procedure TForm1.ClearHistoryMenuClick(Sender: TObject);
Begin
  AllButtonUP;
  Msg := MessageBox(application.MainForm.Handle, pchar(LangQuestionCleanStori.Caption), pchar(LangAttention.Caption), MB_ICONQUESTION Or mb_yesno);

  If Msg = idyes Then
  Begin
    Form1.MemoPlayHistory.Clear;
    Form1.SaveSong;
    Form1.SaveSongRandom;
    application.ProcessMessages;
  End;
End;

Procedure TForm1.FileLocationMenuClick(Sender: TObject);
Begin
  If FileExists(Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row]) = False Then
    Exit;
  ShellExecute(application.Handle, 'OPEN', 'EXPLORER', pchar('/select, ' + pwideChar(Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row])), '', SW_NORMAL);
  application.ProcessMessages;
End;

Procedure TForm1.FileInformation;
Begin
  If pos(lowercase('http'), Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row]) > 0 Then
  Begin
    Form6.EditURLPath.Text := '';
    Form6.EditURLTitle.Text := '';
    Form6.EditURLPath.Text := Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row];
    Form6.EditURLTitle.Text := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row];
    Form6.ButtonEditURL.Visible := True;
    Form6.ButtonAddURL.Visible := False;
    Form6.ShowModal;
    application.ProcessMessages;
  End;

  If (Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row] = '') Or (FileExists(Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row])) = False Then
    Exit;
  If (Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row] <> '') And (FileExists(Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row])) = True Then
  Begin
    Form7.Show;
    application.ProcessMessages;
  End;
End;

Procedure TForm1.FileInfoPLMenuClick(Sender: TObject);
Begin
  AllButtonUP;
  FileInformation;
  application.ProcessMessages;
End;

// Переход на любой момоент времени в файле
Procedure TForm1.barSeekChange(Sender: TObject);
Begin
  If CHANGE_POS Then
  Begin
    BASS_ChannelPause(Channel);
    BASS_ChannelSlideAttribute(Channel, BASS_ATTRIB_VOL, 0, 1000);
    PD := BASS_GetLength / barSeek.Max;
    Form1.Timer_Play.Enabled := False;
    BASS_SetPosition(Round(barSeek.Position * PD));
    If form2.ProgressBox.Checked = True Then
    Begin
      Taskbar1.OverlayIcon := ImageOverlayPlay.Picture.Icon;
      Taskbar1.ProgressMaxValue := barSeek.Max;
      Taskbar1.ProgressState := TTaskBarProgressState.Normal;
      Taskbar1.ProgressValue := Form1.barSeek.Position;
      application.ProcessMessages;
    End;
    If form2.ProgressBox.Checked = False Then
    Begin
      Taskbar1.ProgressState := TTaskBarProgressState.None;
      Taskbar1.OverlayIcon := Nil;
      application.ProcessMessages;
    End;

    Form1.audioPlay;
    application.ProcessMessages;
  End;
End;

// Баланс звука
Procedure TForm1.balanceBarChange(Sender: TObject);
Begin
  BASS_ChannelSetAttribute(Channel, BASS_ATTRIB_PAN, balanceBar.Position / 50);
  Form1.balanceBar.Hint := inttostr(balanceBar.Position) + '%';
  application.ActivateHint(Mouse.CursorPos);
  self.ActiveControl := Nil;
  application.ProcessMessages;
End;

Procedure TForm1.DelPlayListButtonClick(Sender: TObject);
Begin
  Msg := MessageBox(application.MainForm.Handle, pchar(LangQuestionDelPL.Caption + ' ' + ExtractOnlyFileName(Form1.ComboBox_Playlist.Text) + '?'), pchar(LangAttention.Caption), MB_ICONQUESTION Or mb_yesno);

  If Msg = idyes Then
  Begin
    If FileExists(PortablePathM3U + Form1.ComboBox_Playlist.Text) Then
    Begin
      DeleteFile(PortablePathM3U + Form1.ComboBox_Playlist.Text);
      Form1.ComboBox_Playlist.Clear;
      ListFileDir(PortablePathM3U, '*' + '.m3u', ComboBox_Playlist, True);
      Form1.ComboBox_Playlist.ItemIndex := 0;
      Form1.ComboBox_PlaylistChange(self);
      application.ProcessMessages;
    End;
  End;
End;

Procedure TForm1.DelPLMenuClick(Sender: TObject);
Begin
  AllButtonUP;
  DeletePlayList;
End;

Procedure TForm1.SavePlayListButtonClick(Sender: TObject);
Begin
  SaveList(pchar(PortablePathM3U + Form1.ComboBox_Playlist.Text) + '.m3u');
  application.ProcessMessages;
End;

Procedure TForm1.SavePLMenuClick(Sender: TObject);
Begin
  AllButtonUP;
  SaveList(pchar(PortablePathM3U + Form1.ComboBox_Playlist.Text) + '.m3u');
  application.ProcessMessages;
End;

Procedure TForm1.ClearHistoryClick(Sender: TObject);
Begin
  Form1.MemoPlayHistory.Clear;
  Form1.SaveSong;
  application.ProcessMessages;
End;

Procedure TForm1.PlayButtonClick(Sender: TObject);
Begin
  MenuPlaySG;
  application.ProcessMessages;
End;

Procedure TForm1.PaintBox1Click(Sender: TObject);
Begin
  Clipboard.AsText := ExtractOnlyFileName(FileName);
  application.ProcessMessages;
End;

// Пауза воспроизведения
Procedure TForm1.PauseMusic;
Begin
  If (pos(lowercase('http'), Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row]) > 0) Then
  Begin
    Exit;
  End
  Else
  Begin
    If form2.ProgressBox.Checked Then
    Begin
      Taskbar1.OverlayIcon := ImageOverlayPause.Picture.Icon;
      Taskbar1.ProgressState := TTaskBarProgressState.Paused;
      Taskbar1.ProgressValue := Form1.barSeek.Position;
      application.ProcessMessages;
    End;
    If form2.ProgressBox.Checked = False Then
    Begin
      Taskbar1.OverlayIcon := Nil;
      Taskbar1.ProgressState := TTaskBarProgressState.Indeterminate;
      application.ProcessMessages;
    End;

    BASS_ChannelPause(Channel);
    BASS_ChannelSlideAttribute(Channel, BASS_ATTRIB_VOL, 0, 1000);
    Mode := Pause;
    Form1.Timer_Play.Enabled := False;
    Form1.Timer_Radio.Enabled := False;
    self.ActiveControl := Nil;
    application.ProcessMessages;
  End;
End;

Procedure TForm1.PauseButtonClick(Sender: TObject);
Begin
  PauseMusic;
  application.ProcessMessages;
End;

Procedure TForm1.StatusBarTimeClick(Sender: TObject);
Begin
  Case StatusBarTime.Tag Of
    0:
      Begin
        StatusBarTime.Tag := 1;
        Fontapply;
      End;
    1:
      Begin
        StatusBarTime.Tag := 0;
        Fontapply;
      End;
  End;
End;

Procedure TForm1.StopMusic;
Begin
  CHANGE_POS := False;
  Form1.Timer_Play.Enabled := False;
  Form1.Timer_TaskTrackGo.Enabled := False;
  Form1.Timer_Radio.Enabled := False;

  // Сначала сбрасываем все эффекты
  If Assigned(Form2) Then
    Form2.BASS_RestoreSoundEffect;

  BASS_ChannelSlideAttribute(Channel, BASS_ATTRIB_VOL, 0, 1000);
  BASS_ChannelStop(Channel);
  BASS_StreamFree(Channel);
  BASS_MusicFree(Channel);

  Channel := 0; // Важно обнулить канал
  Mode := Stop;

  Form1.barSeek.Position := 0;
  Form1.barSeek.Enabled := False;
  StatusBarTime.Panels[0].Text := ' 00:00:00';
  Form1.barSeek.Hint := StatusBarTime.Panels[0].Text;
  application.ActivateHint(Mouse.CursorPos);
  Form1.kbpsCaption.Caption := '0 kbps';
  Form1.HzCaption.Caption := '0 kHz';
  Form1.SizeCaption.Caption := '0 b';
  Form1.Label_Artist.Caption := '';
  Form1.Label_Title.Caption := '';
  Form1.Label_Year.Caption := '';
  Label_Stereo.Caption := '';
  LabelImageTag.Caption := '';
  Artist := '';
  Title := '';
  album := '';
  year := '';
  Fglob1 := '';
  Fglob2 := '';
  Label_ScrollText.Caption := '';
  self.ActiveControl := Nil;
  Form1.ImageTAG.Picture := Nil;
  Form3.ImageTAGTray.Picture := Nil;
  Label_ScrollText.Caption := Caption;
  application.ProcessMessages;

  If form2.ProgressBox.Checked Then
  Begin
    Taskbar1.OverlayIcon := Nil;
    Taskbar1.ProgressState := TTaskBarProgressState.None;
    application.ProcessMessages;
  End;

  If form2.ProgressBox.Checked = False Then
  Begin
    Taskbar1.OverlayIcon := Nil;
    Taskbar1.ProgressState := TTaskBarProgressState.None;
    application.ProcessMessages;
  End;

  Form1.TrayIcon1.Hint := Form1.Caption;
  Form3.close;
  application.ProcessMessages;
End;

Procedure TForm1.StopButtonClick(Sender: TObject);
Begin
  StopMusic;
End;

// Предыдущий файл для воспроизведения
Procedure TForm1.PreviousFile;
Begin
  If Form1.StringGrid1.RowCount = 1 Then
  Begin
    Form1.StringGrid1.Row := 0;
    application.ProcessMessages;
    NextButton.Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row];
    Taskbar1.TaskBarButtons.Items[4].Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row];
    PlayMusicSG;
    application.ProcessMessages;
  End;
  If Form1.StringGrid1.RowCount <> 1 Then
  Begin
    Form1.barSeek.Position := 0;
    Form1.Timer_Play.Enabled := False;
    BASS_ChannelSlideAttribute(Channel, BASS_ATTRIB_VOL, 0, 1000);
    BASS_ChannelStop(Channel);
    Form1.MemoPlayHistory.Lines.delete(MemoPlayHistory.Lines.Count - 1);
    Form1.StringGrid1.Row := strtoint(Form1.MemoPlayHistory.Lines[Form1.MemoPlayHistory.Lines.Count - 1]) - 1;
    If Form1.MemoRandomSong.Lines.Count <> 0 Then
    Begin
      Form1.MemoRandomSong.Lines.Insert(0, Form1.MemoPlayHistory.Lines[Form1.MemoPlayHistory.Lines.Count - 1]);
    End;
    PlayMusicSG;
    application.ProcessMessages;
    TrimWorkingSet;
  End;
End;

Procedure TForm1.PrevButtonClick(Sender: TObject);
Begin
  PreviousFile;
End;

Procedure TForm1.SaveSong;
Begin
  Form1.MemoPlayHistory.Lines.SaveToFile(PortablePathMusic + 'song.ini', TEncoding.Unicode);
  application.ProcessMessages;
End;

Procedure TForm1.SaveSongRandom;
Begin
  Form1.MemoRandomSong.Lines.SaveToFile(PortablePathMusic + 'randomsong.ini', TEncoding.Unicode);
  application.ProcessMessages;
End;

Procedure TForm1.LoadSongRandom;
Begin
  Form1.MemoRandomSong.Lines.LoadFromFile(PortablePathMusic + 'randomsong.ini');
  application.ProcessMessages;
End;

Procedure TForm1.LoadSong;
Begin
  Form1.MemoPlayHistory.Lines.LoadFromFile(PortablePathMusic + 'song.ini');
  application.ProcessMessages;
End;

// Следующий файл для воспроизведения
Procedure TForm1.NextFileSG;
Begin
  Form1.Timer_Play.Enabled := False;
  Form1.barSeek.Position := 0;
  If (BASS_GetMode <> BASS_ACTIVE_STOPPED) Or (Mode <> Stop) Then
    BASS_ChannelSlideAttribute(Channel, BASS_ATTRIB_VOL, 0, 1000);
  BASS_ChannelStop(Channel);
  application.ProcessMessages;
  If form2.RandomTrack.Checked = False Then
  Begin
    If Form1.StringGrid1.Row <> Form1.StringGrid1.RowCount Then
    Begin
      Form1.StringGrid1.Row := Form1.StringGrid1.Row + 1;
      NextButton.Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row + 1];
      Taskbar1.TaskBarButtons.Items[4].Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row + 1];
      PlayMusicSG;
      application.ProcessMessages;
    End;

    If Form1.StringGrid1.Row = Form1.StringGrid1.RowCount Then
    Begin
      Form1.StringGrid1.Row := 0;
      NextButton.Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row];
      Taskbar1.TaskBarButtons.Items[4].Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row];
      PlayMusicSG;
      application.ProcessMessages;
    End;
  End;

  Try
    If form2.RandomTrack.Checked = True Then
    Begin
      If Form1.MemoRandomSong.Lines.Count = -1 Then
        Exit;

      If Form1.StringGrid1.RowCount = 1 Then
      Begin
        Form1.StringGrid1.Row := 0;
        NextButton.Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row];
        Taskbar1.TaskBarButtons.Items[4].Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row];
        PlayMusicSG;
        application.ProcessMessages;
      End
      Else
      Begin
        Form1.MemoRandomSong.Lines.delete(0);
        Form1.StringGrid1.Row := strtoint(MemoRandomSong.Lines[0]);
        NextButton.Hint := Form1.StringGrid1.Cells[1, strtoint(MemoRandomSong.Lines[1]) - 1];
        Taskbar1.TaskBarButtons.Items[4].Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row + 1];
        PlayMusicSG;
        application.ProcessMessages;
      End;
    End;
    TrimWorkingSet;
  Except
  End;
End;

Procedure TForm1.NextButtonClick(Sender: TObject);
Begin
  NextFileSG;
End;

// Удалить трек
Procedure TForm1.deleteTrack;
Var
  mm2, mm4: Integer;
Begin
  For mm2 := 0 To Form1.MemoPlayHistory.Lines.Count - 1 Do
  Begin
    If Form1.MemoPlayHistory.Lines.Strings[mm2] = inttostr(Form1.StringGrid1.Row) Then
    Begin
      Form1.MemoPlayHistory.Lines.delete(mm2);
      application.ProcessMessages;
    End;
  End;

  For mm4 := 0 To Form1.MemoRandomSong.Lines.Count - 1 Do
  Begin
    If Form1.MemoRandomSong.Lines.Strings[mm4] = inttostr(Form1.StringGrid1.Row) Then
    Begin
      Form1.MemoRandomSong.Lines.delete(mm4);
      application.ProcessMessages;
    End;
  End;
  DeleteRow(Form1.StringGrid1.Row, Form1.StringGrid1);
  Form1.StringGrid1.Row := Form1.StringGrid1.Row + 1;
End;

// Добавить файл в плейлист
Procedure TForm1.AboutMenuClick(Sender: TObject);
Begin
  AllButtonUP;
  Form8.ShowModal;
End;

Procedure TForm1.MusicPlayExecute(Sender: TObject);
Begin
  MenuPlaySG;
End;

Procedure TForm1.MusicStopExecute(Sender: TObject);
Begin
  StopMusic;
End;

Procedure TForm1.MusicPauseExecute(Sender: TObject);
Begin
  PauseMusic;
End;

Procedure TForm1.MusicPrevExecute(Sender: TObject);
Begin
  PrevButtonClick(Sender);
End;

Procedure TForm1.MusicNextExecute(Sender: TObject);
Begin
  NextButtonClick(Sender);
End;

Procedure TForm1.addfileSG;
Var
  j, lastRow: Integer;
Begin

  // lastRow := 0;
  If OpenDialogFile.Execute Then
  Begin
    For j := 0 To Form1.OpenDialogFile.files.Count - 1 Do
    Begin
      Try
        StringGrid1.RowCount := StringGrid1.RowCount + 1;
        lastRow := StringGrid1.RowCount - 1;
        // Form1.StringGrid1.Cells[0, lastRow] := Format('%.4u', [j]);
        Form1.StringGrid1.Cells[1, lastRow] := pwideChar(ExtractOnlyFileName(Form1.OpenDialogFile.files[j]));
        Form1.StringGrid1.Cells[2, lastRow] := '0:00';
        Form1.StringGrid1.Cells[3, lastRow] := pwideChar(Form1.OpenDialogFile.files[j]);
      Except
      End;
    End;
    DeleteEmptyRow;
    MediaThread := AddMediaThread.Create(False);
    MediaThread.FreeOnTerminate := True;
    MediaThread.Priority := tpNormal;
    application.ProcessMessages;
  End;
End;

Procedure TForm1.AddFileMenu1Click(Sender: TObject);
Begin
  Form1.AddFileMenuClick(Sender);
End;

// Размер файлов
Procedure TForm1.SizeTrackSG;
Var
  full: Int64;
  i: Integer;
  rowCount: Integer;
  fileName: String;
  fileSize: Int64;
Begin
  full := 0;
  rowCount := Form1.StringGrid1.RowCount;

  For i := 0 To rowCount - 1 Do
  Begin
    fileName := Trim(StringGrid1.Cells[3, i]);
    If (fileName <> '') And FileExists(fileName) Then
    Begin
      Try
        fileSize := GetMyFileSize(fileName);
        If fileSize >= 0 Then
        Begin
          // Защита от переполнения
          If full <= High(Int64) - fileSize Then
            full := full + fileSize
          Else
            full := High(Int64);
        End;
      Except
        Continue;
      End;
    End;
  End;

  // Теперь этот вызов должен работать
  Form1.StatusBarInfo.Panels[1].Text := GetNormalSize(full);
End;

// Длительность всех треков
Procedure TForm1.longTimeSG;
Var
  i, Songtime: Integer;
  d, h, M, S: Integer;
  cellValue: String;
Begin
  Songtime := 0;
  For i := 0 To Form1.StringGrid1.RowCount - 1 Do
  Begin
    cellValue := StringGrid1.Cells[2, i];
    If (cellValue <> '') And FileExists(StringGrid1.Cells[3, i]) Then
    Begin
      Try
        Songtime := Songtime + StrToInt(MinToSec(cellValue));
      Except
        Continue;
      End;
    End;
  End;
  d := Songtime Div 86400;
  h := (Songtime Mod 86400) Div 3600;
  M := (Songtime Mod 3600) Div 60;
  S := Songtime Mod 60;

  Form1.StatusBarInfo.Panels[2].Text := Format('%.2d:%.2d:%.2d:%.2d', [d, h, M, S]);
End;

// Всего песен
Procedure TForm1.SongNumberSG;
Begin
  Try
    Form1.StatusBarInfo.Panels[0].Text := inttostr(Form1.StringGrid1.RowCount);
    application.ProcessMessages;
  Except
  End;
End;

// Нумерация треков
Procedure TForm1.TracksNumberSG;
Var
  column: Integer;
  rowCount: Integer;
Begin
  rowCount := StringGrid1.RowCount;
  StringGrid1.BeginUpdate;
  Try
    For column := 0 To rowCount - 1 Do
    Begin
      StringGrid1.Cells[0, column] := IntToStr(column + 1);
      While Length(StringGrid1.Cells[0, column]) < 4 Do
        StringGrid1.Cells[0, column] := '0' + StringGrid1.Cells[0, column];
    End;
  Finally
    StringGrid1.EndUpdate;
  End;
End;

//Добавление папки
Procedure TForm1.addfolder;
Var
  FileOpenDialog: IFileOpenDialog;
  ShellItem: IShellItem;
  FilePath: PWideChar;
  wsTemp: WideString;
Begin
  fn := '';
  FileOpenDialog := Nil;
  ShellItem := Nil;
  FilePath := Nil;

  CoInitialize(Nil);
  Try
    If Failed(CoCreateInstance(CLSID_FileOpenDialog, Nil, CLSCTX_INPROC_SERVER, IID_IFileOpenDialog, FileOpenDialog)) Then
      Exit;
    FileOpenDialog.SetTitle(PWideChar(WideString(LangAddFolder.Caption)));
    FileOpenDialog.SetOptions(FOS_PICKFOLDERS Or FOS_FORCEFILESYSTEM);
    If Failed(FileOpenDialog.Show(Handle)) Then
      Exit;
    If Failed(FileOpenDialog.GetResult(ShellItem)) Then
      Exit;
    If Failed(ShellItem.GetDisplayName(SIGDN_FILESYSPATH, FilePath)) Then
      Exit;

    Try
      wsTemp := FilePath;
      fn := wsTemp;
    Finally
      CoTaskMemFree(FilePath);
      FilePath := Nil;
    End;

  Finally
    ShellItem := Nil;
    FileOpenDialog := Nil;
    CoUninitialize;
  End;

  If fn <> '' Then
  Begin
    Form1.ComboBox_Playlist.Enabled := False;
    Form1.TabPlayList.Enabled := False;
    DeleteEmptyRowTrak;
    SearchFilesAndAddToStringGrid(StringReplace(fn + '\', '\\', '\', [rfReplaceAll]), MDIA_MASKS, StringGrid1);
    DeleteEmptyRowTrak;
    application.ProcessMessages;
    Form1.SongNumberSG;
    application.ProcessMessages;
    Form1.TracksNumberSG;
    application.ProcessMessages;
    Form1.SizeTrackSG;
    application.ProcessMessages;
    Form1.addMedia;
    application.ProcessMessages;
    Form1.longTimeSG;
    application.ProcessMessages;
    Form1.RandomSongSG;
    application.ProcessMessages;
    Form1.CopyStringGrid;
    application.ProcessMessages;
    Form1.TrimWorkingSet;

    Form1.ComboBox_Playlist.Enabled := True;
    Form1.TabPlayList.Enabled := True;

    CopyStringGrid;
    ColumnWidthAlign(StringGrid1, 0);
    ColumnWidthAlign(StringGrid1, 2);
    application.ProcessMessages;
    Form1.SaveList(pchar(PortablePathM3U + Form1.ComboBox_Playlist.Text) + '.m3u');
    application.ProcessMessages;
  End;
End;

// Добавить папку через контекстное меню
Procedure TForm1.addfolderLoad;
Begin
  Form1.ComboBox_Playlist.Enabled := False;
  Form1.TabPlayList.Enabled := False;
  DeleteEmptyRowTrak;
  SearchFilesAndAddToStringGrid(StringReplace(fnLoad + '\', '\\', '\', [rfReplaceAll]), MDIA_MASKS, StringGrid1);
  DeleteEmptyRowTrak;
  Form1.SongNumberSG;
  application.ProcessMessages;
  Form1.TracksNumberSG;
  application.ProcessMessages;
  Form1.SizeTrackSG;
  application.ProcessMessages;
  Form1.addMedia;
  application.ProcessMessages;
  Form1.longTimeSG;
  application.ProcessMessages;
  Form1.RandomSongSG;
  application.ProcessMessages;
  Form1.CopyStringGrid;
  application.ProcessMessages;
  Form1.TrimWorkingSet;
  Form1.ComboBox_Playlist.Enabled := True;
  Form1.TabPlayList.Enabled := True;
  ColumnWidthAlign(StringGrid1, 0);
  ColumnWidthAlign(StringGrid1, 2);
  application.ProcessMessages;
  Form1.SaveList(pchar(PortablePathM3U + Form1.ComboBox_Playlist.Text) + '.m3u');
  application.ProcessMessages;
End;

// Поток добавления папок
Procedure AddFolderThread.Execute;
Begin
  Form1.addfolder;
End;
// Поток добавления папок через контекстное меню

Procedure AddFolderThreadLoad.Execute;
Begin
  Form1.addfolderLoad;
End;

// Поток получения медиа данных
Procedure AddMediaThread.Execute;
Begin
  FreeOnTerminate := True;

  // Группируем вызовы в один Synchronize для производительности
  Synchronize(
    Procedure
    Begin
      Form1.SongNumberSG;
      Form1.TracksNumberSG;
      Form1.SizeTrackSG;
      Form1.addMedia;
      Form1.longTimeSG;
      Form1.RandomSongSG;
      Form1.CopyStringGrid;
    End);

  // TrimWorkingSet если не работает с VCL
  Form1.TrimWorkingSet;
End;

Procedure TForm1.AddFolderMenu1Click(Sender: TObject);
Begin
  AddFolderMenuClick(Sender);
End;

Procedure TForm1.SortRandomlyMenuClick(Sender: TObject);
Begin
  AllButtonUP;
  RandomStringGrid;
  Form1.TrimWorkingSet;
  SaveList(pchar(PortablePathM3U + Form1.ComboBox_Playlist.Text) + '.m3u');
  application.ProcessMessages;
End;

// Копировать в буфер обмена
Procedure CopyFilesToClipboard(FileList: String);
Var
  DropFiles: PDropFiles;
  hGlobal: THandle;
  iLen: Integer;
Begin
  iLen := Length(FileList);
  hGlobal := GlobalAlloc(GMEM_SHARE Or GMEM_MOVEABLE Or GMEM_ZEROINIT, SizeOf(TDropFiles) + ((iLen + 2) * SizeOf(Char)));
  If (hGlobal = 0) Then
    Raise Exception.Create('Could not allocate memory.');
  Try
    DropFiles := GlobalLock(hGlobal);
    If (DropFiles = Nil) Then
      Raise Exception.Create('Could not access allocated memory.');
    Try
      DropFiles^.pFiles := SizeOf(TDropFiles);
      DropFiles^.fWide := True;
      If FileList <> '' Then
        Move(FileList[1], (PByte(DropFiles) + SizeOf(TDropFiles))^, iLen * SizeOf(Char));
    Finally
      GlobalUnlock(hGlobal);
    End;
    Clipboard.SetAsHandle(CF_HDROP, hGlobal);
  Except
    GlobalFree(hGlobal);
  End;
End;

Procedure TForm1.CopyToClipboardMenuClick(Sender: TObject);
Begin
  If (Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row] = '') Or (FileExists(Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row])) = False Then
    Exit;
  CopyFilesToClipboard(pchar(Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row]));
End;

Procedure TForm1.AllButtonUP;
Begin
  SpeedButton_GeneralMenu.AllowAllUp := True;
  SpeedButton_GeneralMenu.Down := False;
  SpeedButtonOther.AllowAllUp := True;
  SpeedButtonOther.Down := False;
  SpeedButtonControlPL.AllowAllUp := True;
  SpeedButtonControlPL.Down := False;
  SpeedButtonDelFromPL.AllowAllUp := True;
  SpeedButtonDelFromPL.Down := False;
  SpeedButtonAddToPL.AllowAllUp := True;
  SpeedButtonAddToPL.Down := False;
  SpeedButtonSortPL.AllowAllUp := True;
  SpeedButtonSortPL.Down := False;
  application.ProcessMessages;
End;

Procedure TForm1.AllButtonDown;
Begin
  SpeedButton_GeneralMenu.AllowAllUp := False;
  SpeedButton_GeneralMenu.Down := True;
  SpeedButtonOther.AllowAllUp := False;
  SpeedButtonOther.Down := True;
  SpeedButtonControlPL.AllowAllUp := False;
  SpeedButtonControlPL.Down := True;
  SpeedButtonDelFromPL.AllowAllUp := False;
  SpeedButtonDelFromPL.Down := True;
  SpeedButtonAddToPL.AllowAllUp := False;
  SpeedButtonAddToPL.Down := True;
  SpeedButtonSortPL.AllowAllUp := False;
  SpeedButtonSortPL.Down := True;
  application.ProcessMessages;
End;

Procedure TForm1.ApplicationEvents1SettingChange(Sender: TObject; Flag: Integer; Const Section: String; Var Result: Integer);
Begin
  application.Restore;
  application.BringToFront;
  SetForegroundWindow(application.Handle);
End;

Procedure TForm1.RandomButtonClick(Sender: TObject);
Begin
  If form2.RandomTrack.Checked = True Then
  Begin
    form2.RandomTrack.Checked := False;
    RandomButton.ImageIndex := 11;
  End
  Else
  Begin
    form2.RandomTrack.Checked := True;
    RandomButton.ImageIndex := 7;
  End;
  application.ProcessMessages;
End;

Procedure TForm1.RepeatButtonClick(Sender: TObject);
Begin
  If form2.RepeatSong.Checked = True Then
  Begin
    form2.RepeatSong.Checked := False;
    RepeatButton.ImageIndex := 12;
  End
  Else
  Begin
    form2.RepeatSong.Checked := True;
    RepeatButton.ImageIndex := 8;
  End;
  application.ProcessMessages;
End;

Procedure TForm1.SoundButtonClick(Sender: TObject);
Begin

  If form2.RadioButton_Player.Checked = True Then
  Begin
    If SoundButton.Tag = 0 Then
    Begin
      SoundButton.ImageIndex := 9;
      nVol := barVolume.Position;
      barVolume.Position := 0;
      SoundButton.Tag := 1;
    End
    Else
    Begin
      SoundButton.ImageIndex := 10;
      barVolume.Position := nVol;
      SoundButton.Tag := 0;
    End;
  End;

  If form2.RadioButton_System.Checked = True Then
  Begin
    If SoundButton.Tag = 0 Then
    Begin
      SoundButton.ImageIndex := 9;
      nVolSys := barVolume.Position;
      barVolumeSys.Position := 0;
      SoundButton.Tag := 1;
    End
    Else
    Begin
      SoundButton.ImageIndex := 10;
      barVolumeSys.Position := nVolSys;
      SoundButton.Tag := 0;
    End;
  End;
End;

Procedure TForm1.SpeedButtonControlPLClick(Sender: TObject);
Begin
  If (SpeedButtonControlPL.AllowAllUp) Then
  Begin
    AllButtonDown;
    application.ProcessMessages;
    With PopupMenuPL, TButton(Sender).ClientOrigin Do
    Begin
      TrackPopupMenu(Handle, TPM_LEFTALIGN Or TPM_BOTTOMALIGN, x, y - 5, 0, PopupList.Window, Nil);
    End;
  End
  Else
  Begin
    SpeedButtonControlPL.AllowAllUp := True;
    SpeedButtonControlPL.Down := False;
    PopupMenuPL.CloseMenu;
    application.ProcessMessages;
  End;
End;

Procedure TForm1.SpeedButtonAddToPLClick(Sender: TObject);
Begin
  If (SpeedButtonAddToPL.AllowAllUp) Then
  Begin
    AllButtonDown;
    application.ProcessMessages;
    With PopupMenuAdd, TButton(Sender).ClientOrigin Do
    Begin
      TrackPopupMenu(Handle, TPM_LEFTALIGN Or TPM_BOTTOMALIGN, x, y - 5, 0, PopupList.Window, Nil);
    End;
  End
  Else
  Begin
    SpeedButtonAddToPL.AllowAllUp := True;
    SpeedButtonAddToPL.Down := False;
    PopupMenuAdd.CloseMenu;
    application.ProcessMessages;
  End;
End;

Procedure TForm1.SpeedButtonDelFromPLClick(Sender: TObject);
Begin
  If (SpeedButtonDelFromPL.AllowAllUp) Then
  Begin
    AllButtonDown;
    application.ProcessMessages;
    With PopupMenuDelete, TButton(Sender).ClientOrigin Do
    Begin
      TrackPopupMenu(Handle, TPM_LEFTALIGN Or TPM_BOTTOMALIGN, x, y - 5, 0, PopupList.Window, Nil);
    End;
  End
  Else
  Begin
    SpeedButtonDelFromPL.AllowAllUp := True;
    SpeedButtonDelFromPL.Down := False;
    PopupMenuDelete.CloseMenu;
    application.ProcessMessages;
  End;
End;

Procedure TForm1.SpeedButtonSortPLClick(Sender: TObject);
Begin
  If (SpeedButtonSortPL.AllowAllUp) Then
  Begin
    AllButtonDown;
    application.ProcessMessages;
    With PopupMenuPLSort, TButton(Sender).ClientOrigin Do
    Begin
      TrackPopupMenu(Handle, TPM_LEFTALIGN Or TPM_BOTTOMALIGN, x, y - 5, 0, PopupList.Window, Nil);
    End;
  End
  Else
  Begin
    SpeedButtonSortPL.AllowAllUp := True;
    SpeedButtonSortPL.Down := False;
    PopupMenuPLSort.CloseMenu;
    application.ProcessMessages;
  End;
End;

Procedure TForm1.SpeedButtonOtherClick(Sender: TObject);
Begin
  If (SpeedButtonOther.AllowAllUp) Then
  Begin
    AllButtonDown;
    application.ProcessMessages;
    With PopupMenuOther, TButton(Sender).ClientOrigin Do
    Begin
      TrackPopupMenu(Handle, TPM_LEFTALIGN Or TPM_BOTTOMALIGN, x, y - 5, 0, PopupList.Window, Nil);
    End;
  End
  Else
  Begin
    SpeedButtonOther.AllowAllUp := True;
    SpeedButtonOther.Down := False;
    PopupMenuOther.CloseMenu;
    application.ProcessMessages;
  End;
End;

Procedure TForm1.SpeedButton_GeneralMenuClick(Sender: TObject);
Var
  ButtonRight: TPoint;
Begin

  If (SpeedButton_GeneralMenu.AllowAllUp) Then
  Begin
    AllButtonDown;
    application.ProcessMessages;
    If Sender Is TControl Then
    Begin
      ButtonRight.x := SpeedButton_GeneralMenu.Left;
      ButtonRight.y := SpeedButton_GeneralMenu.Top;
      ButtonRight := ClientToScreen(ButtonRight);
      PopupMenu_General.Popup(ButtonRight.x + SpeedButton_GeneralMenu.Width, ButtonRight.y + SpeedButton_GeneralMenu.Height);
    End;
  End
  Else
  Begin
    SpeedButton_GeneralMenu.AllowAllUp := True;
    SpeedButton_GeneralMenu.Down := False;
    PopupMenu_General.CloseMenu;
    application.ProcessMessages;
  End;
End;

Procedure TForm1.OpenPlayListButtonClick(Sender: TObject);
Begin
  If OpenDialogPlaylist.Execute Then
  Begin
    M3UToStringGridAdvanced(OpenDialogPlaylist.FileName, StringGrid1);
    If FileExists(PortablePathM3U + ExtractFileName(Form1.OpenDialogPlaylist.FileName)) Then
      Exit;
    Form1.SaveList(PortablePathM3U + ExtractFileName(Form1.OpenDialogPlaylist.FileName));
    Form1.ComboBox_Playlist.Clear;
    ListFileDir(PortablePathM3U, '*' + '.m3u', ComboBox_Playlist, True);
    Form1.ComboBox_Playlist.ItemIndex := Form1.ComboBox_Playlist.Items.IndexOf(ExtractFileName(Form1.OpenDialogPlaylist.FileName));
    Form1.ComboBox_PlaylistChange(self);
    Form1.TracksNumberSG;
    application.ProcessMessages;
    Form1.SizeTrackSG;
    application.ProcessMessages;
    Form1.longTimeSG;
    application.ProcessMessages;
    Form1.SongNumberSG;
    application.ProcessMessages;
    Form1.MemoPlayHistory.Clear;
    application.ProcessMessages;
    Form1.SaveSong;
    application.ProcessMessages;
    Form1.RandomSongSG;
    application.ProcessMessages;
    CopyStringGrid;
    ColumnWidthAlign(StringGrid1, 0);
    ColumnWidthAlign(StringGrid1, 2);
    Form1.TrimWorkingSet;
  End
  Else
    Exit;
End;

Procedure TForm1.OpenPLMenuClick(Sender: TObject);
Begin
  AllButtonUP;
  OpenPlayList;
End;

Procedure TForm1.OptionButtonClick(Sender: TObject);
Begin
  form2.Show;
End;

Procedure TForm1.AddPlayListButtonClick(Sender: TObject);
Var
  playlist: String;
Begin
  playlist := InputBox(LangAddPL.Caption, LangNamePL.Caption, '');
  If playlist = '' Then
    Exit;
  If playlist <> '' Then
  Begin
    ClearPlayListSG;
    If FileExists(PortablePathM3U + playlist + '.m3u') Then
      Exit;
    Form1.SaveList(PortablePathM3U + playlist + '.m3u');
    Form1.ComboBox_Playlist.Clear;
    ListFileDir(PortablePathM3U, '*' + '.m3u', ComboBox_Playlist, True);
    Form1.ComboBox_Playlist.ItemIndex := Form1.ComboBox_Playlist.Items.IndexOf(playlist + '.m3u');
    Form1.ComboBox_PlaylistChange(self);
    application.ProcessMessages;
  End;
End;

Procedure TForm1.AddPLMenuClick(Sender: TObject);
Begin
  AllButtonUP;
  AddPlaylist;
End;

// Удалить строку StrigGrid
Procedure SGDeleteRow(SG: TStringGrid; RowToDelete: Integer);
Var
  i: Integer;
Begin
  Try
    With SG Do
    Begin
      If (RowToDelete >= 0) And (RowToDelete < rowCount) Then
      Begin
        For i := RowToDelete To rowCount - 2 Do
          Rows[i].Assign(Rows[i + 1]);
        rowCount := rowCount - 1;
      End;
    End;
  Except
  End;
End;

// Удалить пустые строки Striggrid
Procedure TForm1.DeleteEmptyRowTrak;
Var
  i: Integer;
  FilePath: String;
Begin
  StringGrid1.BeginUpdate;
  Try
    For i := StringGrid1.RowCount - 1 Downto 0 Do
    Begin
      FilePath := StringGrid1.Cells[3, i];
      If SameText(Copy(FilePath, 1, 4), 'http') Then
        Continue;
      If Not FileExists(FilePath) Then
      Begin
        SGDeleteRow(StringGrid1, i);
        Form1.StatusBarInfo.Panels[3].Text := StringGrid1.Cells[1, i];
        application.ProcessMessages;
      End;
    End;
    Form1.StatusBarInfo.Panels[3].Text := '';
  Finally
    StringGrid1.EndUpdate;
  End;
End;

Procedure TForm1.DeleteFileFromDiskMenuClick(Sender: TObject);
Begin
  AllButtonUP;
  DeleteFileSG;
  application.ProcessMessages;
  Form1.TracksNumberSG;
  Form1.SongNumberSG;
  Form1.SizeTrackSG;
  Form1.addMedia;
  Form1.longTimeSG;
  Form1.RandomSongSG;
  application.ProcessMessages;
  CopyStringGrid;
End;

Procedure TForm1.DeleteFileSG;
Begin
  If FileExists(Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row]) = False Then
    Exit;
  Msg := MessageBox(application.MainForm.Handle, pchar(LangQuestionDelFile.Caption + #13 + #10 + Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row]), pchar(LangAttention.Caption), MB_ICONQUESTION Or mb_yesno);

  If Msg = idyes Then
  Begin
    If (Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row] = FileName) And ((BASS_ChannelIsActive(Channel) = BASS_ACTIVE_PLAYING) Or (BASS_ChannelIsActive(Channel) = BASS_ACTIVE_PAUSED)) Then
    Begin
      Form1.StopMusic;
      DeleteFileWithUndo(Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row]);
      DeleteRow(Form1.StringGrid1.Row, Form1.StringGrid1);
      deleteTrack;
      NextFileSG;
      SaveList(pchar(PortablePathM3U + Form1.ComboBox_Playlist.Text) + '.m3u');
    End;

    If (Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row] <> FileName) Then
    Begin
      DeleteFileWithUndo(Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row]);
      deleteTrack;
      DeleteRow(Form1.StringGrid1.Row, Form1.StringGrid1);
      SaveList(pchar(PortablePathM3U + Form1.ComboBox_Playlist.Text) + '.m3u');
    End;

  End;
End;

Procedure TForm1.DeleteNonExistentMenuClick(Sender: TObject);
Begin
  AllButtonUP;
  Msg := MessageBox(application.MainForm.Handle, pchar(LangQuestionDelNotFile.Caption), pchar(LangAttention.Caption), MB_ICONQUESTION Or mb_yesno);

  If Msg = idyes Then
  Begin
    Form1.TabPlayList.Enabled := False;
    DeleteEmptyRowTrak;
    Form1.TabPlayList.Enabled := True;
    Form1.TracksNumberSG;
    application.ProcessMessages;
    Form1.SizeTrackSG;
    application.ProcessMessages;
    Form1.longTimeSG;
    application.ProcessMessages;
    Form1.SongNumberSG;
    application.ProcessMessages;
    Form1.MemoPlayHistory.Clear;
    application.ProcessMessages;
    Form1.SaveSong;
    application.ProcessMessages;
    Form1.RandomSongSG;
    CopyStringGrid;
    application.ProcessMessages;
    Form1.TrimWorkingSet;
    SaveList(pchar(PortablePathM3U + Form1.ComboBox_Playlist.Text) + '.m3u');
    application.ProcessMessages;
  End;
End;

Procedure TForm1.ClearlistMenuClick(Sender: TObject);
Begin
  AllButtonUP;
  ClearPlayListSG;
  CopyStringGrid;
End;

// Очистить StrigGrid
Procedure TForm1.CheckUpdateMenuClick(Sender: TObject);
Begin
  AllButtonUP;
  Form10.ShowModal;
End;

Procedure TForm1.ClearGrid;
Var
  i, j: Integer;
Begin
  Try
    // for i := 0 to StringGrid1.RowCount - 1 do
    // for j := 0 to StringGrid1.ColCount - 1 do
    For i := 0 To StringGrid1.RowCount - 1 Do
      For j := 0 To StringGrid1.ColCount - 1 Do
        StringGrid1.Cells[j, i] := '';
    StringGrid1.RowCount := 1;
  Except
  End;
End;

// Очистить плейлист
Procedure TForm1.ClearPlayListSG;
Begin
  Msg := MessageBox(application.MainForm.Handle, pchar(LangQuestionCleanList.Caption), pchar(LangAttention.Caption), MB_ICONQUESTION Or mb_yesno);

  If Msg = idyes Then
  Begin
    ClearGrid;
    DeleteRow(0, StringGrid1);
    Form1.StringGrid1.Refresh;
    SaveList(pchar(PortablePathM3U + Form1.ComboBox_Playlist.Text) + '.m3u');
    Form1.MemoPlayHistory.Clear;
    Form1.MemoRandomSong.Clear;
    Form1.SaveSong;
    Form1.SaveSongRandom;
    Form1.StatusBarInfo.Panels[0].Text := '0';
    Form1.StatusBarInfo.Panels[2].Text := '00:00:00:00';
    Form1.StatusBarInfo.Panels[1].Text := '0 b';
    application.ProcessMessages;
  End;
End;

Function Inmas(S: String): Boolean;
Var
  dub: Integer;
Begin
  Result := False;
  For dub := 0 To Length(Temp) - 1 Do
  Begin
    application.ProcessMessages;
    If Temp[dub] = S Then
    Begin
      Result := True;
      Break;
    End;
  End;
End;

// Удаление дубликатов
Procedure TForm1.deleteDublikateTrack;
Var
  i: Integer;
  UniqueList: TStringList;
  CellValue: String;
Begin
  UniqueList := TStringList.Create;
  Try
    UniqueList.Sorted := True;
    UniqueList.Duplicates := dupError;
    StringGrid1.BeginUpdate;
    Try
      For i := StringGrid1.RowCount - 1 Downto 0 Do
      Begin
        CellValue := StringGrid1.Cells[3, i];
        Try
          UniqueList.Add(CellValue);
        Except
          On EStringListError Do
          Begin
            SGDeleteRow(StringGrid1, i);
            StatusBarInfo.Panels[3].Text := Format('%d', [StringGrid1.RowCount - i]);
            application.ProcessMessages;
          End;
        End;
      End;
    Finally
      StringGrid1.EndUpdate;
    End;
    SetLength(Temp, 0);
    StatusBarInfo.Panels[3].Text := '';
    MemoPlayHistory.Clear;
    RandomSongSG;
  Finally
    UniqueList.Free;
  End;
End;

// Поток удаления дубликатов
Procedure ClearDUBThread.Execute;
Begin
  DuplicateThread.FreeOnTerminate := True;
  Form1.deleteDublikateTrack;
End;

// Удалить дубликаты в списке
Procedure TForm1.DeleteDuplicate;
Begin
  DuplicateThread := ClearDUBThread.Create(False);
  DuplicateThread.FreeOnTerminate := True;
  DuplicateThread.Priority := tpNormal;
End;

Procedure TForm1.DeleteDuplicatesMenuClick(Sender: TObject);
Begin
  AllButtonUP;
  Msg := MessageBox(application.MainForm.Handle, pchar(LangQuestionCleanDup.Caption), pchar(LangAttention.Caption), MB_ICONQUESTION Or mb_yesno);

  If Msg = idyes Then
  Begin
    // DeleteDuplicate;
    Form1.TabPlayList.Enabled := False;
    Form1.deleteDublikateTrack;
    Form1.TabPlayList.Enabled := True;
    Form1.TracksNumberSG;
    application.ProcessMessages;
    Form1.SizeTrackSG;
    application.ProcessMessages;
    Form1.longTimeSG;
    application.ProcessMessages;
    Form1.SongNumberSG;
    application.ProcessMessages;
    Form1.MemoPlayHistory.Clear;
    application.ProcessMessages;
    Form1.SaveSong;
    application.ProcessMessages;
    Form1.RandomSongSG;
    CopyStringGrid;
    application.ProcessMessages;
    Form1.TrimWorkingSet;
    SaveList(pchar(PortablePathM3U + Form1.ComboBox_Playlist.Text) + '.m3u');
    application.ProcessMessages;
  End;
End;

// Прорисовка визуализация музыки
Procedure TForm1.Timer_DrawTimer(Sender: TObject);
Var
  FFTData: TFFTData;
  ChannelActive: Cardinal;
  DataAvailable: DWORD;
Begin
  Try
    If Channel = 0 Then
    Begin
      Spectrum.Draw(Form1.pb1.Canvas.Handle, Default(TFFTData), 0, 0, True);
      Exit;
    End;
    ChannelActive := BASS_ChannelIsActive(Channel);
    If ChannelActive <> BASS_ACTIVE_PLAYING Then
    Begin
      Spectrum.Draw(Form1.pb1.Canvas.Handle, Default(TFFTData), 0, 0, True);
      Exit;
    End;
    DataAvailable := BASS_ChannelGetData(Channel, @FFTData, BASS_DATA_FFT1024);
    If DataAvailable = DWORD(-1) Then
    Begin
      If BASS_ErrorGetCode = BASS_ERROR_HANDLE Then
      Begin
        Channel := 0;
        Spectrum.Draw(Form1.pb1.Canvas.Handle, Default(TFFTData), 0, 0, True);
      End;
      Exit;
    End;
    If DataAvailable > 0 Then
    Begin
      Spectrum.Draw(Form1.pb1.Canvas.Handle, FFTData, 0, 0, False);
    End
    Else
    Begin
      Spectrum.Draw(Form1.pb1.Canvas.Handle, Default(TFFTData), 0, 0, False);
    End;

  Except
    On E: Exception Do
    Begin
      Timer_Draw.Enabled := False;
      Spectrum.Draw(Form1.pb1.Canvas.Handle, Default(TFFTData), 0, 0, True);
    End;
  End;
End;

Procedure TForm1.Timer_RadioTimer(Sender: TObject);
Var
  i: Integer;
  br: String;
  metaStr: String;
Begin
  // Получаем метаданные потока (название трека)
  metaURL := PansiChar(BASS_ChannelGetTags(Channel, BASS_TAG_META));
  If (metaURL <> Nil) Then
  Begin
    metaStr := String(PansiChar(metaURL));
    pURL := pos('StreamTitle=', metaStr);
    If (pURL > 0) Then
    Begin
      pURL := pURL + 13;
      metaURL := PansiChar(AnsiString(Copy(metaStr, pURL, pos(';', metaStr) - pURL - 1)));
      Fglob1 := UTF8ToUnicodeString(metaURL);
      application.ProcessMessages;
    End;
  End;

  // Получаем информацию о радиостанции (ICY теги)
  icyURL := BASS_ChannelGetTags(Channel, BASS_TAG_ICY);
  If (icyURL = Nil) Then
    icyURL := BASS_ChannelGetTags(Channel, BASS_TAG_HTTP);

  br := ''; // Переменная для хранения битрейта
  Fglob2 := ''; // Сбрасываем название станции

  If (icyURL <> Nil) Then
  Begin
    While (icyURL^ <> #0) Do
    Begin
      If (Copy(icyURL, 1, 9) = 'icy-name:') Then
      Begin
        Fglob2 := UTF8ToUnicodeString(PansiChar(Copy(icyURL, 10, MaxInt)))
      End
      Else If (Copy(icyURL, 1, 7) = 'icy-br:') Then
      Begin
        br := UTF8ToUnicodeString(PAnsiChar(UTF8Encode(Copy(icyURL, 8, MaxInt))));
      End;
      icyURL := icyURL + Length(icyURL) + 1;
      application.ProcessMessages;
    End;
  End;

  // Если битрейт не получен из метаданных или равен 0, определяем его
  If (br = '') Or (br = '0') Then
  Begin
    br := GetRadioBitrate(Channel);
  End;

  // Обновляем информацию на форме
  Form1.kbpsCaption.Caption := br + ' kbps';
  Form1.HzCaption.Caption := GetStreamFrequency(Channel);
  Form1.SizeCaption.Caption := 'Radio';

  // Формируем полную информацию для отображения
  Fglob := Fglob1;
  If Fglob2 <> '' Then
    Fglob := Fglob1 + ' | ' + Fglob2;

  Label_ScrollText.Caption := Fglob;
  FileName := Fglob;

  // Обновляем время воспроизведения
  ValPos1 := Now - t;
  StatusBarTime.Panels[0].Text := ' ' + FormatDateTime('hh:mm:ss', ValPos1);
  application.ProcessMessages;

  // Парсим название трека на исполнителя и название
  i := pos(' - ', Fglob1);
  If i > 0 Then
  Begin
    Label_Artist.Caption := Trim(Copy(Fglob1, 1, i - 1));
    Artist := Trim(Copy(Fglob1, 1, i - 1));
    Label_Title.Caption := Trim(Copy(Fglob1, i + 3, Length(Fglob1)));
    Title := Trim(Copy(Fglob1, i + 3, Length(Fglob1)));
    Label_Year.Caption := Fglob2;

    // Обновляем всплывающую подсказку в трее
    TrayIcon1.Hint := Artist + ' - ' + Title;
    If Fglob2 <> '' Then
      TrayIcon1.Hint := TrayIcon1.Hint + ' (' + Fglob2 + ')';

    application.ProcessMessages;
  End
  Else
  Begin
    // Если формат не "Исполнитель - Трек", отображаем как есть
    Label_Artist.Caption := Fglob1;
    Label_Title.Caption := Fglob2;
    Artist := Fglob1;
    Title := Fglob2;
    TrayIcon1.Hint := Fglob1;
    If Fglob2 <> '' Then
      TrayIcon1.Hint := TrayIcon1.Hint + ' | ' + Fglob2;
  End;
End;

// Функция для определения битрейта радио-потока
Function TForm1.GetRadioBitrate(Channel: DWORD): String;
Var
  Info: BASS_CHANNELINFO;
  Bitrate: Single;
  Freq: DWORD;
Begin
  Result := '128'; // Значение по умолчанию для интернет-радио

  // Пытаемся получить битрейт через атрибут BASS
  If BASS_ChannelGetAttribute(Channel, BASS_ATTRIB_BITRATE, Bitrate) Then
  Begin
    // Bitrate уже в kbps
    Result := IntToStr(Round(Bitrate));
  End
  Else
  Begin
    // Если не удалось, оцениваем по частоте дискретизации
    If BASS_ChannelGetInfo(Channel, Info) Then
    Begin
      Freq := Info.freq;

      // Эмпирическая оценка для интернет-радио
      If Freq >= 48000 Then
        Result := '192'
      Else If Freq >= 44100 Then
        Result := '128'
      Else If Freq >= 32000 Then
        Result := '96'
      Else If Freq >= 22050 Then
        Result := '64'
      Else If Freq >= 11025 Then
        Result := '32'
      Else
        Result := '128';
    End;
  End;

  // Проверяем на разумные пределы
  If (Result = '0') Or (Result = '') Then
    Result := '128';
End;

// Функция для получения частоты потока
Function TForm1.GetStreamFrequency(Channel: DWORD): String;
Var
  Info: BASS_CHANNELINFO;
Begin
  Result := '44.1 kHz'; // Значение по умолчанию

  If BASS_ChannelGetInfo(Channel, Info) Then
  Begin
    If Info.freq >= 1000 Then
      Result := FormatFloat('0.0', Info.freq / 1000) + ' kHz'
    Else
      Result := IntToStr(Info.freq) + ' Hz';
  End;
End;

Procedure TForm1.TrayIcon1DblClick(Sender: TObject);
Begin
  application.Restore;
  // SetForegroundWindow(Form1.Handle);
  SetForegroundWindow(application.Handle);
End;

Procedure TForm1.DeleteFileFromListMenuClick(Sender: TObject);
Begin
  AllButtonUP;
  Msg := MessageBox(application.MainForm.Handle, pchar(LangQuestionDelFilePL.Caption + #13 + #10 + Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row]), pchar(LangAttention.Caption), MB_ICONQUESTION Or mb_yesno);

  If Msg = idyes Then
  Begin
    Form1.deleteTrack;
    SaveList(pchar(PortablePathM3U + Form1.ComboBox_Playlist.Text) + '.m3u');
    application.ProcessMessages;
    Form1.TracksNumberSG;
    Form1.SongNumberSG;
    Form1.SizeTrackSG;
    Form1.addMedia;
    Form1.longTimeSG;
    Form1.RandomSongSG;
    application.ProcessMessages;
    CopyStringGrid;
  End;

End;

Procedure TForm1.AddFileMenuClick(Sender: TObject);
Begin
  AllButtonUP;
  If ComboBox_Playlist.Text = '' Then
  Begin
    MenuAddFolderPlayList;
  End;
  Form1.ComboBox_Playlist.Enabled := False;
  Form1.TabPlayList.Enabled := False;
  DeleteEmptyRowTrak;
  addfileSG;
  CopyStringGrid;
  ColumnWidthAlign(StringGrid1, 0);
  ColumnWidthAlign(StringGrid1, 2);
  application.ProcessMessages;
  Form1.ComboBox_Playlist.Enabled := True;
  Form1.TabPlayList.Enabled := True;
End;

Procedure TForm1.AddFolderMenuClick(Sender: TObject);
Begin
  AllButtonUP;
  If ComboBox_Playlist.Text = '' Then
  Begin
    MenuAddFolderPlayList;
  End;
  FolderThread := AddFolderThread.Create(False);
  FolderThread.FreeOnTerminate := True;
  FolderThread.Priority := tpNormal;
  SaveList(pchar(PortablePathM3U + Form1.ComboBox_Playlist.Text) + '.m3u');
End;

Procedure TForm1.CopyToMenuClick(Sender: TObject);
Begin
  If (pos(lowercase('http'), lowercase(Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row])) > 0) Then
    Exit;
  If FileExists(Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row]) = False Then
    Exit;
  Form5.Show;
  application.ProcessMessages;
End;

// Добавить плейлист
Procedure TForm1.AddPlaylist;
Var
  playlist: String;
  ind: Integer;
Begin
  playlist := InputBox(LangAddPL.Caption, LangNamePL.Caption, '');
  If playlist = '' Then
    Exit;
  If playlist <> '' Then
  Begin
    If FileExists(PortablePathM3U + playlist + '.m3u') Then
      Exit;
    ComboBox_Playlist.Items.Add(playlist);
    ind := SendMessage(ComboBox_Playlist.Handle, CB_FINDSTRING, -1, Integer(pchar(playlist)));
    ComboBox_Playlist.ItemIndex := ind;
    application.ProcessMessages;
    ClearGrid;
    DeleteRow(0, StringGrid1);
    Form1.StringGrid1.Refresh;
    Form1.MemoPlayHistory.Clear;
    Form1.MemoRandomSong.Clear;
    Form1.SaveSong;
    Form1.SaveSongRandom;
    Form1.StatusBarInfo.Panels[0].Text := '0';
    Form1.StatusBarInfo.Panels[2].Text := '00:00:00:00';
    Form1.StatusBarInfo.Panels[1].Text := '0 b';
    application.ProcessMessages;
    StringGrid1.RowCount := 0;

    Form1.SaveList(PortablePathM3U + Form1.ComboBox_Playlist.Text + '.m3u');
    M3UToStringGridAdvanced(PortablePathM3U + Form1.ComboBox_Playlist.Text + '.m3u', StringGrid1);
    application.ProcessMessages;
  End;
End;

// Обновить список плейлистов
Procedure TForm1.UpdatePlayList;
Var
  Ini: TMemIniFile;
Begin
  Ini := TMemIniFile.Create(Form1.PortablePath);
  Form1.ComboBox_Playlist.Items.Clear;
  ListFileDir(PortablePathM3U, '*.m3u', ComboBox_Playlist, True);
  Form1.ComboBox_Playlist.ItemIndex := Form1.ComboBox_Playlist.Items.IndexOf(Ini.ReadString(option, 'Playlist', ''));
  Ini.Free;
  application.ProcessMessages;
End;

Procedure TForm1.OpenPlayList;
Var
  playlist: String;
  ind: Integer;
Begin
  If OpenDialogPlaylist.Execute Then
  Begin
    SaveList(pchar(PortablePathM3U + Form1.ComboBox_Playlist.Text) + '.m3u');

    Form1.ComboBox_Playlist.Enabled := False;
    Form1.TabPlayList.Enabled := False;
    playlist := PortablePathM3U + ExtractFileName(Form1.OpenDialogPlaylist.FileName);
    CopyFile(PChar(OpenDialogPlaylist.FileName), PChar(playlist), False);
    UpdatePlayList;
    ind := SendMessage(ComboBox_Playlist.Handle, CB_FINDSTRING, -1, Integer(pchar(ExtractOnlyFileName(playlist))));
    ComboBox_Playlist.ItemIndex := ind;
    DeleteEmptyRowTrak;
    M3UToStringGridAdvanced(playlist, StringGrid1);
    DeleteEmptyRowTrak;
    SaveList(pchar(playlist));

    application.ProcessMessages;
    Form1.SongNumberSG;
    application.ProcessMessages;
    Form1.SizeTrackSG;
    application.ProcessMessages;
    Form1.longTimeSG;
    application.ProcessMessages;
    Form1.RandomSongSG;
    application.ProcessMessages;
    Form1.CopyStringGrid;
    application.ProcessMessages;
    Form1.TrimWorkingSet;
    application.ProcessMessages;
    Form1.ComboBox_Playlist.Enabled := True;
    Form1.TabPlayList.Enabled := True;
  End;
End;

Procedure TForm1.OptionMenuClick(Sender: TObject);
Begin
  AllButtonUP;
  form2.ShowModal;
  application.ProcessMessages;
  form2.PageControlOptions.ActivePageIndex := 0;
  form2.TreeViewMenu.Selected := form2.TreeViewMenu.Items[form2.PageControlOptions.ActivePageIndex];
  application.ProcessMessages;
End;

Procedure TForm1.ThemeAutoClick(Sender: TObject);
Begin
  AllButtonUP;
  form2.close;
  Form3.close;
  form4.close;
  Form5.close;
  Form6.close;
  Form7.close;
  Form8.close;
  UnCheckTheme;
  ThemeAuto.Checked := True;
  If AppsUseLightTheme = False Then
  Begin
    SetSpecificThemeMode(True, 'Windows11 Modern Dark', 'Windows11 Modern Light');
    application.ProcessMessages;
    Try
      Spectrum.Pen := clWhite;
      Spectrum.BackColor := $303030;
      Spectrum.Peak := clWhite;
      application.ProcessMessages;
    Except
    End;
  End;

  If AppsUseLightTheme = True Then
  Begin
    SetSpecificThemeMode(True, 'Windows11 Modern Light', 'Windows11 Modern Dark');
    application.ProcessMessages;
    Try
      Spectrum.Pen := clBlack;
      Spectrum.BackColor := clWhite;
      Spectrum.Peak := clBlack;
      application.ProcessMessages;
    Except
    End;
  End;

End;

Procedure TForm1.ThemeLightClick(Sender: TObject);
Begin
  AllButtonUP;
  form2.close;
  Form3.close;
  form4.close;
  Form5.close;
  Form6.close;
  Form7.close;
  Form8.close;
  UnCheckTheme;
  ThemeLight.Checked := True;
  SetSpecificThemeMode(True, 'Windows11 Modern Light', 'Windows11 Modern Dark');
  application.ProcessMessages;
  Try
    Spectrum.Pen := clBlack;
    Spectrum.BackColor := clWhite;
    Spectrum.Peak := clBlack;
    application.ProcessMessages;
  Except
  End;
End;

Procedure TForm1.ThemeLunaClick(Sender: TObject);
Begin
  AllButtonUP;
  form2.close;
  Form3.close;
  form4.close;
  Form5.close;
  Form6.close;
  Form7.close;
  Form8.close;
  UnCheckTheme;
  ThemeLuna.Checked := True;
  SetSpecificThemeMode(True, 'Luna', 'Windows');
  application.ProcessMessages;
  Try
    Spectrum.Pen := clBlack;
    Spectrum.BackColor := clWhite;
    Spectrum.Peak := clBlack;
    application.ProcessMessages;
  Except
  End;
End;

Procedure TForm1.ThemeSkyClick(Sender: TObject);
Begin
  AllButtonUP;
  form2.close;
  Form3.close;
  form4.close;
  Form5.close;
  Form6.close;
  Form7.close;
  Form8.close;
  UnCheckTheme;
  ThemeSky.Checked := True;
  SetSpecificThemeMode(True, 'Sky 2', 'Windows');
  application.ProcessMessages;
  Try
    Spectrum.Pen := clBlack;
    Spectrum.BackColor := clWhite;
    Spectrum.Peak := clBlack;
    application.ProcessMessages;
  Except
  End;
End;

Procedure TForm1.ThemeDarkClick(Sender: TObject);
Begin
  AllButtonUP;
  form2.close;
  Form3.close;
  form4.close;
  Form5.close;
  Form6.close;
  Form7.close;
  Form8.close;
  UnCheckTheme;
  ThemeDark.Checked := True;
  SetSpecificThemeMode(True, 'Windows11 Modern Dark', 'Windows11 Modern Light');
  application.ProcessMessages;
  Try
    Spectrum.Pen := clWhite;
    Spectrum.BackColor := $303030;
    Spectrum.Peak := clWhite;
    application.ProcessMessages;
  Except
  End;
End;

Procedure TForm1.DeletePlayList;
Var
  ind: Integer;
Begin
  If Form1.ComboBox_Playlist.Items.Count = 1 Then
    Exit;

  Msg := MessageBox(application.MainForm.Handle, pchar(LangQuestionDelPL.Caption + ' ' + ExtractOnlyFileName(Form1.ComboBox_Playlist.Text) + '?'), pchar(LangAttention.Caption), MB_ICONQUESTION Or mb_yesno);

  If Msg = idyes Then
  Begin
    If FileExists(PortablePathM3U + Form1.ComboBox_Playlist.Text + '.m3u') Then
    Begin
      DeleteFile(PortablePathM3U + Form1.ComboBox_Playlist.Text + '.m3u');
      // ClearPlayListSG;
      ind := SendMessage(ComboBox_Playlist.Handle, CB_FINDSTRING, -1, Integer(Form1.ComboBox_Playlist.Text));
      Form1.ComboBox_Playlist.Items.delete(ind);
      Form1.ComboBox_Playlist.ItemIndex := 0;
      If FileExists(PortablePathM3U + Form1.ComboBox_Playlist.Text + '.m3u') Then
      Begin
        M3UToStringGridAdvanced(PortablePathM3U + Form1.ComboBox_Playlist.Text + '.m3u', StringGrid1);
      End;
    End;
    application.ProcessMessages;
    Form1.SongNumberSG;
    application.ProcessMessages;
    Form1.TracksNumberSG;
    application.ProcessMessages;
    Form1.SizeTrackSG;
    application.ProcessMessages;
    Form1.longTimeSG;
    application.ProcessMessages;
    Form1.RandomSongSG;
    application.ProcessMessages;
    Form1.CopyStringGrid;
    Form1.TrimWorkingSet;
    application.ProcessMessages;
    SaveNastr;
  End;
End;

Procedure TForm1.SortStringGrid(Var GenStrGrid: TStringGrid; ThatCol: Integer);
Const
  TheSeparator = '@';
Var
  CountItem, i, j, k, ThePosition: Integer;
  MyList: TStringList;
  MyString, TempString: String;
Begin
  CountItem := GenStrGrid.RowCount;
  MyList := TStringList.Create;
  MyList.Sorted := False;
  Try
    Begin
      For i := 0 To (CountItem - 1) Do
        // for i := 1 to (CountItem - 1) do
        MyList.Add(GenStrGrid.Rows[i].Strings[ThatCol] + TheSeparator + GenStrGrid.Rows[i].Text);
      MyList.Sort;
      For k := 1 To MyList.Count - 1 Do
      Begin
        MyString := MyList.Strings[(k)];
        ThePosition := pos(TheSeparator, MyString);
        TempString := '';
        TempString := Copy(MyString, (ThePosition + 1), Length(MyString));
        MyList.Strings[(k - 1)] := '';
        MyList.Strings[(k - 1)] := TempString;
      End;
      For j := 1 To (CountItem - 1) Do
        GenStrGrid.Rows[j].Text := MyList.Strings[(j - 1)];
    End;
  Finally
    MyList.Free;
  End;
End;

Procedure SgSort(aSg: TStringGrid; Const aCol: Integer);
Var
  SlSort, SlRow: TStringList;
  i, j: Integer;
Begin
  SlSort := TStringList.Create;
  For i := aSg.FixedRows To aSg.RowCount - 1 Do
  Begin
    SlRow := TStringList.Create;
    SlRow.Assign(aSg.Rows[i]);
    SlSort.AddObject(aSg.Cells[aCol, i], SlRow);
  End;
  SlSort.Sort;
  j := 0;
  For i := aSg.FixedRows To aSg.RowCount - 1 Do
  Begin
    SlRow := pointer(SlSort.Objects[j]);
    aSg.Rows[i].Assign(SlRow);
    SlRow.Free;
    Inc(j);
  End;
  SlSort.Free;
End;

Procedure TForm1.RandomStringGrid;
Var
  ts: TStringList;
  i, k, n: Integer;
Begin
  Randomize;
  ts := TStringList.Create;
  n := StringGrid1.RowCount;
  For i := 0 To n - 1 Do
  Begin
    k := random(n - i) + i;
    If k <> i Then
    Begin
      ts.Text := StringGrid1.Rows[i].Text;
      StringGrid1.Rows[i] := StringGrid1.Rows[k];
      StringGrid1.Rows[k] := ts
    End;
  End;
  FreeAndNil(ts);
End;

Procedure TForm1.SortbyNameMenuClick(Sender: TObject);
Begin
  AllButtonUP;
  SgSort(Form1.StringGrid1, 1);
  TracksNumberSG;
  application.ProcessMessages;
  Form1.TrimWorkingSet;
  application.ProcessMessages;
End;

Procedure TForm1.OptionTryMenuClick(Sender: TObject);
Begin
  form2.Show;
End;

Procedure TForm1.PlayTryMenuClick(Sender: TObject);
Begin
  PlayMusicSG;
End;

Procedure TForm1.PauseTryMenuClick(Sender: TObject);
Begin
  PauseMusic;
End;

Procedure TForm1.PlayMusicSG;
Begin
  Try

    StopMusic;

    If (CheckUrl(Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row]) = True) And (FileExists(Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row]) = False) Then
    Begin
      Form1.barSeek.Position := 0;
     // StopMusic;
      Radio;
      Form1.MemoPlayHistory.Lines.Add(inttostr(Form1.StringGrid1.Row + 1));
      application.ProcessMessages;
      NextButton.Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row + 1];
      Taskbar1.TaskBarButtons.Items[4].Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row + 1];
      application.ProcessMessages;

      If form2.BaloonWindow.Checked = True Then
      Begin
        Form3.close;
        Form3.Show;
      End;
    End
    Else
    Begin
      Form1.Timer_Play.Enabled := False;
      Form1.barSeek.Enabled := True;

     { If (BASS_GetMode <> BASS_ACTIVE_STOPPED) Or (Mode <> Stop) Then
        BASS_ChannelSlideAttribute(Channel, BASS_ATTRIB_VOL, 0, 1000);
      BASS_ChannelStop(Channel);  }

      Mode := Play;
      Form1.barSeek.Enabled := True;
      FileName := Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row];
      Form1.audioPlay;
      Form1.MemoPlayHistory.Lines.Add(inttostr(Form1.StringGrid1.Row + 1));

      // ВАЖНО: После создания нового канала применяем эффекты
      If Assigned(Form2) Then
      Begin
        If Form2.chEqualizer.Checked = true Then
        Begin
          Form2.BASS_RestoreSoundEffect;
          Include(SNDEffects, seEqualizer);
          Form2.BASS_SetSoundEffects(SNDEffects);
          application.ProcessMessages;
        End;
        If Form2.chEqualizer.Checked = false Then
        Begin
          Form2.BASS_RestoreSoundEffect;
          Exclude(SNDEffects, seEqualizer);
          Form2.BASS_SetSoundEffects(SNDEffects);
          application.ProcessMessages;
        End;
      End;

      If form2.ShowCoverArts.Checked = True Then
      Begin
        Form1.ImageTAG.Picture := Nil;
        Form1.ListCoverArts;
        application.ProcessMessages;
      End;

      If form2.ShowCoverArts.Checked = False Then
      Begin
        Form1.ImageTAG.Picture := Nil;
        application.ProcessMessages;
      End;

      If form2.RandomTrack.Checked = False Then
      Begin
        NextButton.Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row + 1];
        Taskbar1.TaskBarButtons.Items[4].Hint := Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row + 1];
      End;

      If form2.RandomTrack.Checked = True Then
      Begin
        NextButton.Hint := Form1.StringGrid1.Cells[1, strtoint(MemoRandomSong.Lines[1])];
        Taskbar1.TaskBarButtons.Items[4].Hint := Form1.StringGrid1.Cells[1, strtoint(MemoRandomSong.Lines[1])];
      End;

      application.ProcessMessages;

      If form2.BaloonWindow.Checked = True Then
      Begin
        Form3.close;
        Form3.Show;
      End;
    End;
    TrimWorkingSet;
  Except
  End;
End;

Procedure TForm1.StopTryMenuClick(Sender: TObject);
Begin
  StopMusic;
End;

Procedure TForm1.StringGrid1Click(Sender: TObject);
Begin
  AllButtonUP;

  If (BASS_GetMode = BASS_ACTIVE_STOPPED) And (BASS_GetMode <> BASS_ACTIVE_PAUSED) Then
  Begin
    FileName := Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row];
  End;
End;

Procedure TForm1.StringGrid1DblClick(Sender: TObject);
Begin
  PlayMusicSG;
End;

Procedure TForm1.StringGrid1MouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; Var Handled: Boolean);
Begin
  StringGrid1.Perform(WM_VSCROLL, 1, 0);
  Handled := True;
End;

Procedure TForm1.StringGrid1MouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; Var Handled: Boolean);
Begin
  StringGrid1.Perform(WM_VSCROLL, 0, 0);
  Handled := True;
End;

Procedure TForm1.NextTryMenuClick(Sender: TObject);
Begin
  NextFileSG;
End;

Procedure TForm1.PrevTryMenuClick(Sender: TObject);
Begin
  PreviousFile;
End;

Procedure TForm1.SortbyDurationMenuClick(Sender: TObject);
Begin
  AllButtonUP;
  SgSort(Form1.StringGrid1, 2);
  TracksNumberSG;
  application.ProcessMessages;
  Form1.TrimWorkingSet;
  application.ProcessMessages;
End;

Procedure TForm1.PlayMenuClick(Sender: TObject);
Begin
  PlayMusicSG;
End;

End.

