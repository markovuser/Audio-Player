#define MyAppName "Audio Player"
#define MyAppNameSafe StringChange(MyAppName, " ", "-")
#define MyAppVersion "6.7.26.204"
#define MyAppPublisher "Nikolay Markov"
#define MyAppURL "https://sites.google.com/view/simpleutilities/index"
#define MyAppExeName "AudioPlayer.exe"
#define MyAppSource "D:\Delphi Programs\" + MyAppName + "\Application\" + MyAppName

[Setup]
AppId={{CE9550B3-00D5-4B04-8953-45BD7861E600}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}

VersionInfoVersion={#MyAppVersion}
VersionInfoDescription={#MyAppName}
VersionInfoTextVersion={#MyAppVersion}
VersionInfoProductName={#MyAppName}
VersionInfoProductVersion={#MyAppVersion}
VersionInfoCompany={#MyAppPublisher}
VersionInfoCopyright={#MyAppPublisher}

DisableWelcomePage=no
DisableReadyPage=yes
DisableDirPage=auto
DisableProgramGroupPage=auto
DefaultDirName={commonpf32}\{#MyAppPublisher}\{#MyAppName}
DefaultGroupName={#MyAppName}

OutputDir=D:\Software\My Projects
OutputBaseFilename={#MyAppNameSafe}-setup
SetupIconFile={image}\{#MyAppName}.ico
UninstallDisplayIcon={app}\{#MyAppExeName}
UninstallDisplayName={#MyAppName} {#MyAppVersion}

Compression=lzma/Max
SolidCompression=yes  

ChangesAssociations=True
ShowTasksTreeLines=true
DirExistsWarning=no
CloseApplications=no
RestartApplications=False
WizardStyle=modern windows11 dynamic includetitlebar excludelightbuttons   
MinVersion=10.0 

[Languages]
Name: "Russian"; MessagesFile: "compiler:Languages\Russian.isl";LicenseFile: "{#MyAppSource}\Doc\License-EN.txt";
Name: "English"; MessagesFile: "compiler:Default.isl";LicenseFile: "{#MyAppSource}\Doc\License-EN.txt";
Name: "French"; MessagesFile: "compiler:Languages\french.isl";LicenseFile: "{#MyAppSource}\Doc\License-EN.txt";
Name: "German"; MessagesFile: "compiler:Languages\german.isl";LicenseFile: "{#MyAppSource}\Doc\License-RU.txt";

[Messages]
BeveledLabel= {#MyAppName} {#MyAppVersion}
SetupWindowTitle={#MyAppName} {#MyAppVersion}
FinishedHeadingLabel={#MyAppName} {#MyAppVersion}
WelcomeLabel1 ={#MyAppName} {#MyAppVersion}

Russian.WelcomeLabel1=Мастер установки {#MyAppName}
Russian.InstallingLabel=Пожалуйста, подождите, идет установка {#MyAppName} {#MyAppVersion}
Russian.FinishedHeadingLabel=Завершение установки
Russian.FinishedLabelNoIcons=Установка {#MyAppName} {#MyAppVersion} завершена

English.WelcomeLabel1={#MyAppName} Setup Wizard
English.InstallingLabel=Please wait, installation {#MyAppName} {#MyAppVersion} is in progress
English.FinishedHeadingLabel=Completing the Setup
English.FinishedLabelNoIcons=Installation of {#MyAppName} {#MyAppVersion} is complete

French.WelcomeLabel1=Assistant d'installation de {#MyAppName}
French.InstallingLabel=Veuillez patienter, l'installation de {#MyAppName} {#MyAppVersion} est en cours
French.FinishedHeadingLabel=Finition de l'installation
French.FinishedLabelNoIcons=L'installation de {#MyAppName} {#MyAppVersion} est terminГ©e

German.WelcomeLabel1={#MyAppName}-Setup-Assistent
German.InstallingLabel=Bitte warten, die Installation von {#MyAppName} {#MyAppVersion} lГ¤uft
German.FinishedHeadingLabel=Setup wird abgeschlossen
German.FinishedLabelNoIcons=Die Installation von {#MyAppName} {#MyAppVersion} ist abgeschlossen

[CustomMessages]
Russian.UninstallProgram=Удалить {#MyAppName}
Russian.ProgramOnTheWeb=Сайт {#MyAppName}
Russian.License=Лицензия
Russian.integrationContextmenuGroup=Интеграция:
Russian.integrationContextmenu=Встроить в контекстное меню папок
Russian.OpenInAudioPlayer=Открыть в {#MyAppName}
Russian.AddToAudioPlayer=Добавить в {#MyAppName}

English.UninstallProgram=Uninstall {#MyAppName}
English.ProgramOnTheWeb=Website {#MyAppName}
English.License=License
English.integrationContextmenuGroup=Integration:
English.integrationContextmenu=Embed in folder context menu
English.OpenInAudioPlayer=Open in {#MyAppName}
English.AddToAudioPlayer=Add to {#MyAppName}

German.UninstallProgram={#MyAppName} deinstallieren
German.ProgramOnTheWeb=Website {#MyAppName}
German.License=Lizenz
German.integrationContextmenuGroup=Integration:
German.integrationContextmenu=In Ordner-Kontextmenü einbetten
German.OpenInAudioPlayer=Öffnen in {#MyAppName}
German.AddToAudioPlayer=Zu {#MyAppName} hinzufügen

French.UninstallProgram=Désinstaller {#MyAppName}
French.ProgramOnTheWeb=Site Web {#MyAppName}
French.License=Licence
French.integrationContextmenuGroup=Intégration:
French.integrationContextmenu=Intégrer dans le menu contextuel du dossier
French.OpenInAudioPlayer=Ouvrir dans {#MyAppName}
French.AddToAudioPlayer=Ajouter à {#MyAppName}

[Files]
Source: "{#MyAppSource}\{#MyAppExeName}"; DestDir: "{app}\"; Flags: ignoreversion overwritereadonly;BeforeInstall: TaskKill('{#MyAppExeName}');
Source: "{#MyAppSource}\libeay32.dll"; DestDir: "{app}\"; Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\ssleay32.dll"; DestDir: "{app}\"; Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Config\Option.ini"; DestDir: "{userappdata}\{#MyAppPublisher}\{#MyAppName}\Config\"; Flags: ignoreversion onlyifdoesntexist;
Source: "{#MyAppSource}\Doc\license-EN.txt"; DestDir: "{app}\Doc"; Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Doc\license-RU.txt"; DestDir: "{app}\Doc"; Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Language\English.ini"; DestDir: "{app}\Language"; Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Language\French.ini"; DestDir: "{app}\Language"; Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Language\German.ini"; DestDir: "{app}\Language"; Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Language\Russian.ini"; DestDir: "{app}\Language"; Flags: ignoreversion overwritereadonly;


Source: "{#MyAppSource}\Plugins\bassaac.dll"; DestDir: "{app}\Plugins";Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Plugins\bassac3.dll"; DestDir: "{app}\Plugins";Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Plugins\bassadx.dll"; DestDir: "{app}\Plugins";Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Plugins\bassaix.dll"; DestDir: "{app}\Plugins";Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Plugins\bassalac.dll"; DestDir: "{app}\Plugins";Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Plugins\bassape.dll"; DestDir: "{app}\Plugins";Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Plugins\bassdsd.dll"; DestDir: "{app}\Plugins";Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Plugins\bassflac.dll"; DestDir: "{app}\Plugins";Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Plugins\basshls.dll"; DestDir: "{app}\Plugins";Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Plugins\bassmidi.dll"; DestDir: "{app}\Plugins";Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Plugins\BASSMOD.dll"; DestDir: "{app}\Plugins";Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Plugins\bassmpc.dll"; DestDir: "{app}\Plugins";Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Plugins\bassofr.dll"; DestDir: "{app}\Plugins";Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Plugins\bassopus.dll"; DestDir: "{app}\Plugins";Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Plugins\bassspx.dll"; DestDir: "{app}\Plugins";Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Plugins\basstta.dll"; DestDir: "{app}\Plugins";Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Plugins\basswebm.dll"; DestDir: "{app}\Plugins";Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Plugins\basswma.dll"; DestDir: "{app}\Plugins";Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Plugins\basswv.dll"; DestDir: "{app}\Plugins";Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Plugins\FreeImage.dll"; DestDir: "{app}\Plugins";Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\Plugins\TagsLib.dll"; DestDir: "{app}\Plugins";Flags: ignoreversion overwritereadonly;

Source: "{#MyAppSource}\bass.dll"; DestDir: "{app}\"; Flags: ignoreversion overwritereadonly;
Source: "{#MyAppSource}\OptimFROG.dll"; DestDir: "{app}\"; Flags: ignoreversion overwritereadonly;

[Registry]
Root: HKCU; SubKey: Software\Classes\Directory\shell\AudioPlayer.Add; \
ValueType: string; ValueData: {cm:AddToAudioPlayer}; \
Flags: uninsdeletevalue uninsdeletekeyifempty; \
Check: ShouldCreateRegistryEntry ; \
Tasks: integrationContextmenu;

Root: HKCU; SubKey: Software\Classes\Directory\shell\AudioPlayer.Add; \
ValueType: string; ValueName: Icon; ValueData: {app}\{#MyAppExeName}; \
Flags: uninsdeletevalue uninsdeletekeyifempty; \
Check: ShouldCreateRegistryEntry ; \
Tasks: integrationContextmenu;

Root: HKCU; SubKey: Software\Classes\Directory\shell\AudioPlayer.Add\command; \
ValueType: string; ValueData: """{app}\{#MyAppExeName}"" ""%1"" /Add"; \
Flags: uninsdeletevalue uninsdeletekeyifempty; \
Check: ShouldCreateRegistryEntry; \
Tasks: integrationContextmenu;

Root: HKCU; SubKey: Software\Classes\Directory\shell\AudioPlayer.Play; \
ValueType: string; ValueData: {cm:OpenInAudioPlayer}; \
Flags: uninsdeletevalue uninsdeletekeyifempty; \
Check: ShouldCreateRegistryEntry ; \
Tasks: integrationContextmenu;

Root: HKCU; SubKey: Software\Classes\Directory\shell\AudioPlayer.Play; \
ValueType: string; ValueName: Icon; ValueData: {app}\{#MyAppExeName}; \
Flags: uninsdeletevalue uninsdeletekeyifempty ; \
Check: ShouldCreateRegistryEntry ; \
Tasks: integrationContextmenu;

Root: HKCU; SubKey: Software\Classes\Directory\shell\AudioPlayer.Play\command; \
ValueType: string; ValueData: """{app}\{#MyAppExeName}"" ""%1"" /Open"; \
Flags: uninsdeletevalue uninsdeletekeyifempty; \
Check: ShouldCreateRegistryEntry ; \
Tasks: integrationContextmenu;

[INI]
FileName: "{userappdata}\{#MyAppPublisher}\{#MyAppName}\Config\Option.ini"; Section: "Language"; Key: "Language"; String: "English";Languages:english;
FileName: "{userappdata}\{#MyAppPublisher}\{#MyAppName}\Config\Option.ini"; Section: "Language"; Key: "Language"; String: "Russian";Languages:russian;
FileName: "{userappdata}\{#MyAppPublisher}\{#MyAppName}\Config\Option.ini"; Section: "Language"; Key: "Language"; String: "German";Languages:German;
FileName: "{userappdata}\{#MyAppPublisher}\{#MyAppName}\Config\Option.ini"; Section: "Language"; Key: "Language"; String: "French";Languages:French;

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}";
Name: "integrationContextmenu"; Description: "{cm:integrationContextmenu}"; GroupDescription: "{cm:integrationContextmenuGroup}";  

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall shellexec;

[InstallDelete] 
Type: filesandordirs; Name: "{group}\*"
Type: filesandordirs; Name: "{app}\Language\*"
Type: filesandordirs; Name: "{userprograms}\{#MyAppName}\*"
Type: dirifempty; Name: "{userprograms}\{#MyAppName}"
Type: filesandordirs; Name: "{commonprograms}\{#MyAppName}\*"
Type: dirifempty; Name: "{commonprograms}\{#MyAppName}"  
Type: files; Name: "{commondesktop}\{#MyAppName}.lnk"
Type: files; Name: "{userdesktop}\{#MyAppName}.lnk"

[UninstallDelete] 
Type: filesandordirs; Name: "{app}\*"
Type: filesandordirs; Name: "{group}\*"
Type: filesandordirs; Name: "{userappdata}\{#MyAppPublisher}\{#MyAppName}\*"
Type: dirifempty; Name: "{userappdata}\{#MyAppPublisher}\"
Type: filesandordirs; Name: "{userprograms}\{#MyAppName}\*"
Type: dirifempty; Name: "{userprograms}\{#MyAppName}"
Type: filesandordirs; Name: "{commonprograms}\{#MyAppName}\*"
Type: dirifempty; Name: "{commonprograms}\{#MyAppName}" 

//Pascal
[Code]
function ShouldCreateRegistryEntry(): Boolean;
begin
  Result := not WizardSilent();
end;

procedure TaskKill(FileName: String);
var
ResultCode: Integer;
begin
  Exec('taskkill.exe', '/f /im ' + '"' + FileName + '"', '', SW_HIDE,
  ewWaitUntilTerminated, ResultCode);
end;

function InitializeUninstall(): Boolean;
begin
  TaskKill('{#MyAppExeName}');
  Result := True;
end;

const
GWL_WNDPROC = -4;
SB_VERT = 1;
SB_BOTTOM = 7;
WM_VSCROLL = $0115;
WM_ERASEBKGND = $0014;

type
WPARAM = UINT_PTR;
LPARAM = LongInt;
LRESULT = LongInt;

var
OldStatusLabelWndProc: LongInt;
OldFilenameLabelWndProc: LongInt;
OldProgressListBoxWndProc: LongInt;
ProgressListBox: TNewListBox;
PrevStatus: string;
PrevFileName: string;

function CallWindowProc(
lpPrevWndFunc: LongInt; hWnd: HWND; Msg: UINT; wParam: WPARAM;
lParam: LPARAM): LRESULT; external 'CallWindowProcW@user32.dll stdcall';
function SetWindowLong(hWnd: HWND; nIndex: Integer; dwNewLong: LongInt): LongInt;
external 'SetWindowLongW@user32.dll stdcall';

procedure AddProgress(S: string);
begin
  if S <> '' then
  begin
    ProgressListBox.Items.Add(S);
    ProgressListBox.ItemIndex := ProgressListBox.Items.Count;
    SendMessage(ProgressListBox.Handle, WM_VSCROLL, SB_BOTTOM, 0);
  end;
end;

function StatusLabelWndProc(
hwnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT;
begin
  Result := CallWindowProc(OldStatusLabelWndProc, hwnd, uMsg, wParam, lParam);
  if PrevStatus <> WizardForm.StatusLabel.Caption then
  begin
    AddProgress(WizardForm.StatusLabel.Caption);
    PrevStatus := WizardForm.StatusLabel.Caption;
  end;
end;

function FilenameLabelWndProc(
hwnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT;
begin
  Result := CallWindowProc(OldFilenameLabelWndProc, hwnd, uMsg, wParam, lParam);
  if PrevFileName <> WizardForm.FilenameLabel.Caption then
  begin
    AddProgress(WizardForm.FilenameLabel.Caption);
    PrevFileName := WizardForm.FilenameLabel.Caption;
  end;
end;

function ProgressListBoxWndProc(
hwnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT;
begin
  if uMsg = WM_ERASEBKGND then
  begin
    Result := 1;
  end
  else
  begin
    Result := CallWindowProc(OldProgressListBoxWndProc, hwnd, uMsg, wParam, lParam);
  end;
end;

procedure InitializeWizard;
begin
  WizardForm.LicenseAcceptedRadio.Checked := True;
  WizardForm.LicenseAcceptedRadio.Visible := False;
  WizardForm.LicenseNotAcceptedRadio.Visible := False;
  WizardForm.LicenseMemo.Height :=
  WizardForm.LicenseNotAcceptedRadio.Top +
  WizardForm.LicenseNotAcceptedRadio.Height -
  WizardForm.LicenseMemo.Top - ScaleY(5);

  OldStatusLabelWndProc :=
  SetWindowLong(WizardForm.StatusLabel.Handle, GWL_WNDPROC,
  CreateCallback(@StatusLabelWndProc));
  OldFilenameLabelWndProc :=
  SetWindowLong(WizardForm.FilenameLabel.Handle, GWL_WNDPROC,
  CreateCallback(@FilenameLabelWndProc));
  WizardForm.ProgressGauge.Top := WizardForm.FilenameLabel.Top;
  ProgressListBox := TNewListBox.Create(WizardForm);
  ProgressListBox.Parent := WizardForm.ProgressGauge.Parent;
  ProgressListBox.Top :=
  WizardForm.ProgressGauge.Top + WizardForm.ProgressGauge.Height + ScaleY(8);
  ProgressListBox.Width := WizardForm.FilenameLabel.Width;
  ProgressListBox.Height :=
  ProgressListBox.Parent.ClientHeight - ProgressListBox.Top - ScaleY(16);
  ProgressListBox.Anchors := [akLeft, akTop, akRight, akBottom];
  OldProgressListBoxWndProc :=
  SetWindowLong(ProgressListBox.Handle, GWL_WNDPROC,
  CreateCallback(@ProgressListBoxWndProc));
  WizardForm.StatusLabel.Width := WizardForm.StatusLabel.Width - ScaleY(24);
  WizardForm.FilenameLabel.Width := WizardForm.FilenameLabel.Width - ScaleY(24);
end;

procedure DeinitializeSetup();
begin
  SetWindowLong(WizardForm.StatusLabel.Handle, GWL_WNDPROC, OldStatusLabelWndProc);
  SetWindowLong(WizardForm.FilenameLabel.Handle, GWL_WNDPROC, OldFilenameLabelWndProc);
  SetWindowLong(ProgressListBox.Handle, GWL_WNDPROC, OldProgressListBoxWndProc);
end;
