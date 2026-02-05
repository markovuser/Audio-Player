Program AudioPlayer;



{$R *.dres}

uses
  Forms,
  Windows,
  IniFiles,
  Vcl.Themes,
  SysUtils,
  Vcl.Styles,
  Unit_Base in 'Unit_Base\Unit_Base.pas' {Form1},
  Unit_Settings in 'Unit_Settings\Unit_Settings.pas' {Form2},
  Unit_TrayNotify in 'Unit_TrayNotify\Unit_TrayNotify.pas' {Form3},
  Unit_ImageEdit in 'Unit_ImageEdit\Unit_ImageEdit.pas' {Form4},
  Unit_CopyFile in 'Unit_CopyFile\Unit_CopyFile.pas' {Form5},
  Unit_URL in 'Unit_URL\Unit_URL.pas' {Form6},
  Unit_TagEditor in 'Unit_TagEditor\Unit_TagEditor.pas' {Form7},
  Unit_About in 'Unit_About\Unit_About.pas' {Form8},
  Unit_PlayListManager in 'Unit_PlayListManager\Unit_PlayListManager.pas' {Form9},
  Unit_Update in 'Unit_Update\Unit_Update.pas' {Form10},
  bass in 'Units\Bass\bass.pas',
  basscd in 'Units\Bass\basscd.pas',
  BASSMOD in 'Units\Bass\BASSMOD.pas',
  uSpectrum in 'Units\Spectr\uSpectrum.pas',
  APEv2Library in 'Units\TagsLibrary\APEv2Library.pas',
  BufferedStream in 'Units\TagsLibrary\BufferedStream.pas',
  FlacTagLibrary in 'Units\TagsLibrary\FlacTagLibrary.pas',
  FreeImage in 'Units\TagsLibrary\FreeImage.pas',
  FreeImageLoader in 'Units\TagsLibrary\FreeImageLoader.pas',
  ID3v1Library in 'Units\TagsLibrary\ID3v1Library.pas',
  ID3v2Library in 'Units\TagsLibrary\ID3v2Library.pas',
  MP4TagLibrary in 'Units\TagsLibrary\MP4TagLibrary.pas',
  Musepack in 'Units\TagsLibrary\Musepack.pas',
  OggVorbisAndOpusTagLibrary in 'Units\TagsLibrary\OggVorbisAndOpusTagLibrary.pas',
  ReadMemoryStream in 'Units\TagsLibrary\ReadMemoryStream.pas',
  TagsLibrary in 'Units\TagsLibrary\TagsLibrary.pas',
  TagsLibraryDefs in 'Units\TagsLibrary\TagsLibraryDefs.pas',
  uTExtendedX87 in 'Units\TagsLibrary\uTExtendedX87.pas',
  WAVPackfile in 'Units\TagsLibrary\WAVPackfile.pas',
  WAVTagLibrary in 'Units\TagsLibrary\WAVTagLibrary.pas',
  WMATagLibrary in 'Units\TagsLibrary\WMATagLibrary.pas',
  MMDeviceAPI in 'Units\MMDeviceAPI\MMDeviceAPI.pas',
  Monkey in 'Units\TagsLibrary\Monkey.pas',
  WindowsDarkMode in 'Units\WindowsDarkMode\WindowsDarkMode.pas',
  Translation in 'Units\Translation\Translation.pas',
  CustomTrackBar in 'Units\CustomTrackBar\CustomTrackBar.pas',
  basswma in 'Units\Bass\basswma.pas',
  bassalac in 'Units\Bass\bassalac.pas',
  bassflac in 'Units\Bass\bassflac.pas',
  basswv in 'Units\Bass\basswv.pas',
  bassaac in 'Units\Bass\bassaac.pas',
  bassac3 in 'Units\Bass\bassac3.pas',
  bassopus in 'Units\Bass\bassopus.pas',
  bassape in 'Units\Bass\bassape.pas',
  bassmpc in 'Units\Bass\bassmpc.pas',
  basstta in 'Units\Bass\basstta.pas',
  bassspx in 'Units\Bass\bassspx.pas',
  bassofr in 'Units\Bass\bassofr.pas',
  bassadx in 'Units\Bass\bassadx.pas',
  bassaix in 'Units\Bass\bassaix.pas',
  bassmidi in 'Units\Bass\bassmidi.pas',
  bassdsd in 'Units\Bass\bassdsd.pas',
  basswebm in 'Units\Bass\basswebm.pas',
  FileInfoUtils in 'Units\FileInfoUtils\FileInfoUtils.pas';

{$R *.res}

Var
  HM: THandle;

Function Check: boolean;
Begin
  HM := OpenMutex(MUTEX_ALL_ACCESS, false, 'Audio Player');
  Result := (HM <> 0);
  If HM = 0 Then
    HM := CreateMutex(Nil, false, 'Audio Player');
End;

Begin
  // Проверка на запуск второй копии программы
  If Check Then
    exit;
  SetThreadLocale(1049);
  Application.Initialize;
  Application.Title := 'Audio Player';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm10, Form10);
  Form1.GlobLoadNastr;
  Form1.LoadLanguage;
  Form1.CleanTranslationsLikeGlobload;
  Form1.Globload;
  If Not Form1.IsWindows10Or11 Then
  Begin
    MessageBox(0, Pchar(Form1.LangOnlyWindows.Caption), Pchar(Form1.LangError.Caption), MB_ICONERROR);
    exit;
  End;
  Application.Run;

End.

