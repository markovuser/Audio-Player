Unit Unit_TagEditor;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ID3v1Library, ID3v2Library, Dialogs, StdCtrls, ExtCtrls, JPEG, PNGImage,
  GIFImg, ComCtrls, IniFiles, Vcl.Menus, Vcl.ExtDlgs, Bass, Bassmod, ClipBrd,
  Winapi.ShellAPI, APEv2Library, TagsLibrary, System.ImageList, Vcl.ImgList,
  System.UITypes, Vcl.Buttons, bassaac, bassac3, bassalac, bassape, bassmpc,
  bassofr, bassspx, basstta, basswv, bassflac, basswma, BASSOPUS, BASSADX,
  BASSAIX, BassDSD, basswebm, FileInfoUtils;

Type
  TWmMoving = Record
    Msg: Cardinal;
    fwSide: Cardinal;
    lpRect: PRect;
    Result: Integer;
  End;

Type
  TForm7 = Class(TForm)
    PopupMenuID3v2Tag: TPopupMenu;
    OpenPictureDialog1: TOpenPictureDialog;
    SaveAsID3v2TagMenu: TMenuItem;
    PopupMenuRegisterLetters: TPopupMenu;
    WordsCapitalLettersMenu: TMenuItem;
    AllCapitalLettersMenu: TMenuItem;
    AllSmallLettersMenu: TMenuItem;
    BrowseID3v2TagMenu: TMenuItem;
    DeleteID3v2TagMenu: TMenuItem;
    N3: TMenuItem;
    N6: TMenuItem;
    SavePictureDialog1: TSavePictureDialog;
    PageControlTags: TPageControl;
    PageID3v2Tag: TTabSheet;
    PageOtherTag: TTabSheet;
    SerchYandexID3v2TagMenu: TMenuItem;
    SerchGoogleID3v2TagMenu: TMenuItem;
    SearchID3v2TagMenu: TMenuItem;
    TabControlBody: TTabControl;
    EditFilePathTag: TEdit;
    TabControlButtons: TTabControl;
    ButtonClose: TButton;
    ButtonDeleteTags: TButton;
    ButtonCopyTag: TSpeedButton;
    ButtonCase: TSpeedButton;
    ButtonAutoTag: TSpeedButton;
    ButtonBrowseFile: TSpeedButton;
    PageAPETag: TTabSheet;
    PopupMenuAPETag: TPopupMenu;
    APEBrowseMenu: TMenuItem;
    APESearchMenu: TMenuItem;
    APESearchYandexMenu: TMenuItem;
    APESearchGoogleMenu: TMenuItem;
    MenuItem5: TMenuItem;
    APESaveAsMenu: TMenuItem;
    MenuItem7: TMenuItem;
    APEDeleteMenu: TMenuItem;
    CopyID3v2TagMenu: TMenuItem;
    PasteID3v2TagMenu: TMenuItem;
    APECopyMenu: TMenuItem;
    APEPasteMenu: TMenuItem;
    PopupMenuAutoTag: TPopupMenu;
    AutoArtistTitleMenu: TMenuItem;
    PopupMenu_CopyTo: TPopupMenu;
    ID3v2APE1: TMenuItem;
    ID3v2APE2: TMenuItem;
    ImageListTags: TImageList;
    TabControlID3v2Tag: TTabControl;
    EditAlbumID3v2Tag: TEdit;
    EditArtistID3v2Tag: TEdit;
    MemoCommentID3v2Tag: TMemo;
    ComboboxGenreID3v2Tag: TComboBox;
    EditTitleID3v2Tag: TEdit;
    EditTrackID3v2Tag: TEdit;
    EditURLID3v2Tag: TEdit;
    EditYearID3v2Tag: TEdit;
    LabelArtistID3v2Tag: TLabel;
    LabelAlbumID3v2Tag: TLabel;
    LabelYearID3v2Tag: TLabel;
    LabelURLID3v2Tag: TLabel;
    LabelGenreID3v2Tag: TLabel;
    LabelTrackID3v2Tag: TLabel;
    LabelCommentID3v2Tag: TLabel;
    LabelTitleID3v2Tag: TLabel;
    TabControlOtherTag: TTabControl;
    LabelTitleOtherTag: TLabel;
    LabelTrackOtherTag: TLabel;
    LabelGenreOtherTag: TLabel;
    LabelYearOtherTag: TLabel;
    LabelAlbumOtherTag: TLabel;
    LabelArtistOtherTag: TLabel;
    LabelCommentOtherTag: TLabel;
    LabelURLOtherTag: TLabel;
    EditAlbumOtherTag: TEdit;
    EditArtistOtherTag: TEdit;
    MemoCommentOtherTag: TMemo;
    ComboboxGenreOtherTag: TComboBox;
    EditTitleOtherTag: TEdit;
    EditTrackOtherTag: TEdit;
    EditURLOtherTag: TEdit;
    EditYearOtherTag: TEdit;
    TabControlAPETag: TTabControl;
    EditAlbumAPETag: TEdit;
    EditArtistAPETag: TEdit;
    MemoCommentAPETag: TMemo;
    ComboboxGenreAPETag: TComboBox;
    EditTitleAPETag: TEdit;
    EditTrackAPETag: TEdit;
    EditURLAPETag: TEdit;
    EditYearAPETag: TEdit;
    LabelCommentAPETag: TLabel;
    LabelURLAPETag: TLabel;
    LabelTrackAPETag: TLabel;
    LabelTitleAPETag: TLabel;
    LabelArtistAPETag: TLabel;
    LabelAlbumAPETag: TLabel;
    LabelYearAPETag: TLabel;
    LabelGenreAPETag: TLabel;
    TabControlOtherImageTag: TTabControl;
    TabControlOtherImageTag1: TTabControl;
    ImageOtherTag: TImage;
    TabControlID3v2ImageTag: TTabControl;
    TabControlID3v2ImageTag1: TTabControl;
    ImageSubstrateID3v2Tag: TImage;
    ImageID3v2Tag: TImage;
    LabelSizeID3v2Tag: TLabel;
    TabControlAPEImageTag: TTabControl;
    TabControlAPEImageTAG1: TTabControl;
    ImageAPETag1: TImage;
    ImageAPETag: TImage;
    LabelSizeAPETag: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    ResizeID3v2TagMenu: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    APEResizeMenu: TMenuItem;
    ButtonSaveTag: TButton;
    Procedure FormCreate(Sender: TObject);
    Procedure FormShow(Sender: TObject);
    Procedure SaveAsID3v2TagMenuClick(Sender: TObject);
    Function PROPER(S: String): String;
    Procedure ButtonCaseClick(Sender: TObject);
    Procedure WordsCapitalLettersMenuClick(Sender: TObject);
    Procedure AllCapitalLettersMenuClick(Sender: TObject);
    Procedure AllSmallLettersMenuClick(Sender: TObject);
    Procedure BrowseID3v2TagMenuClick(Sender: TObject);
    Procedure DeleteID3v2TagMenuClick(Sender: TObject);
    Procedure ClearDataID3v2;
    Procedure ClearDataAPE;
    Procedure ClearDataAllTag;
    Function LoadAPIC(Index: Integer): Boolean;
    Procedure getTag3v2;
    Procedure LoadNastr;
    Procedure SaveNastr;
    Procedure SafeSetCoverFromImageEditor;
    Procedure AddAPECoverFromImageEditor;
    Procedure SaveID3v2TagPic;
    Procedure getID3v1Tag;
    Procedure BrowseID3v2TagPic;
    Procedure AllTag;
    Procedure GetAPE;
    Procedure BrowseAPETagPic;
    Procedure ListCoverArtsAPE;
    Procedure SaveAPETagPic;
    Procedure SaveTAGS;
    Procedure SaveAllTAGS;
    Procedure DeleteTags;
    Procedure DeleteAllTags;
    Procedure addMedia;
    Procedure ID3v1_TabShow(Sender: TObject);
    Procedure FormClick(Sender: TObject);
    Procedure MenuItem14Click(Sender: TObject);
    Procedure MenuItem19Click(Sender: TObject);
    Procedure PageID3v2TagShow(Sender: TObject);
    Procedure PageOtherTagShow(Sender: TObject);
    Procedure ButtonCloseClick(Sender: TObject);
    Procedure SerchYandexID3v2TagMenuClick(Sender: TObject);
    Procedure SerchGoogleID3v2TagMenuClick(Sender: TObject);
    Procedure ButtonAutoTagClick(Sender: TObject);
    Procedure ButtonCopyTagClick(Sender: TObject);
    Procedure ButtonBrowseFileClick(Sender: TObject);
    Procedure ButtonSaveTagClick(Sender: TObject);
    Procedure APEBrowseMenuClick(Sender: TObject);
    Procedure APESaveAsMenuClick(Sender: TObject);
    Procedure ID3v2APE1Click(Sender: TObject);
    Procedure ID3v2APE2Click(Sender: TObject);
    Procedure PageAPETagShow(Sender: TObject);
    Procedure BrowseID3v2TagPicStream;
    Procedure APESearchYandexMenuClick(Sender: TObject);
    Procedure APESearchGoogleMenuClick(Sender: TObject);
    Procedure APEDeleteMenuClick(Sender: TObject);
    Procedure PopupMenuID3v2TagPopup(Sender: TObject);
    Procedure CopyID3v2TagMenuClick(Sender: TObject);
    Procedure PasteID3v2TagMenuClick(Sender: TObject);
    Procedure APECopyMenuClick(Sender: TObject);
    Procedure PopupMenuAPETagPopup(Sender: TObject);
    Procedure APEPasteMenuClick(Sender: TObject);
    Procedure AutoArtistTitleMenuClick(Sender: TObject);
    Procedure GroupBox_ID3v2Click(Sender: TObject);
    Procedure GroupBox_ID3v1Click(Sender: TObject);
    Procedure GroupBox_TagsClick(Sender: TObject);
    Procedure GroupBox_APEClick(Sender: TObject);
    Procedure PageControlTagsChange(Sender: TObject);
    Procedure ButtonDeleteTagsClick(Sender: TObject);
    Procedure FormKeyPress(Sender: TObject; Var Key: Char);
    Procedure ID3v1_URLKeyPress(Sender: TObject; Var Key: Char);
    Procedure ResizeID3v2TagMenuClick(Sender: TObject);
    Procedure APEResizeMenuClick(Sender: TObject);
    Procedure FormDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; Var Accept: Boolean);
    Procedure FormDestroy(Sender: TObject);
    Procedure FormActivate(Sender: TObject);
  Private
    Procedure WMDropFiles(Var Msg: TWMDropFiles); Message WM_DROPFILEs;

    { Private declarations }
  Public
    { Public declarations }
  Protected
    Procedure CreateParams(Var Params: TCreateParams); Override;

  End;

Var
  Form7: TForm7;
  ID3v1Tag: TID3v1Tag = Nil;
  ID3v2Tag: TID3v2Tag = Nil;
  APEv2Tag: TAPEv2Tag;
  OtherTag, OtherTag2: TTags;
  CurrentAPICIndex: Integer = -1;
  LanguageID: TLanguageID;
  Channel2: DWORD;

Implementation

{$R *.dfm}

Uses
  Unit_Base, Unit_Settings, FreeImage, FreeImageLoader, Unit_ImageEdit;

Procedure TForm7.CreateParams(Var Params: TCreateParams);
Begin
  Inherited CreateParams(Params);
  Params.ExStyle := Params.ExStyle Or WS_EX_APPWINDOW;
  Params.WndParent := GetDesktopWindow;
End;

Procedure TForm7.LoadNastr;
Var
  Ini: TMemIniFile;
Begin
  Try
    Ini := TMemIniFile.Create(Form1.PortablePath);
    Form7.top := Ini.ReadInteger(Option, 'FormTagTop', Form7.top);
    Form7.left := Ini.ReadInteger(Option, 'FormTagLeft', Form7.left);
    Ini.Free;
  Except
  End;
End;

Procedure TForm7.SaveNastr;
Var
  Ini: TMemIniFile;
Begin
  Try
    Ini := TMemIniFile.Create(Form1.PortablePath);
    Ini.WriteInteger(Option, 'FormTagTop', Form7.top);
    Ini.WriteInteger(Option, 'FormTagLeft', Form7.left);
    Ini.UpdateFile;
    Ini.Free;

  Except
  End;

End;

Procedure TForm7.ButtonAutoTagClick(Sender: TObject);
Begin
  If (Form7.ButtonAutoTag.AllowAllUp) Then
  Begin
    Form7.ButtonAutoTag.AllowAllUp := False;
    Form7.ButtonAutoTag.Down := True;
    With Form7.PopupMenuAutoTag, TButton(Sender).ClientOrigin Do
    Begin
      TrackPopupMenu(Handle, TPM_LEFTALIGN Or TPM_TOPALIGN, X, Y + 23, 0, PopupList.Window, Nil);
    End;
  End
  Else
  Begin
    Form7.ButtonAutoTag.AllowAllUp := True;
    Form7.ButtonAutoTag.Down := False;
    Form7.PopupMenuAutoTag.CloseMenu;
  End;
End;

Procedure TForm7.ButtonBrowseFileClick(Sender: TObject);
Begin
  If EditFilePathTag.Text = '' Then
    exit;
  ShellExecute(Application.Handle, 'OPEN', 'EXPLORER', pchar('/select, ' + pwideChar(EditFilePathTag.Text)), '', SW_NORMAL);
  Application.ProcessMessages;
End;

Procedure TForm7.ButtonCopyTagClick(Sender: TObject);
Begin
  If (Form7.ButtonCopyTag.AllowAllUp) Then
  Begin
    Form7.ButtonCopyTag.AllowAllUp := False;
    Form7.ButtonCopyTag.Down := True;
    With Form7.PopupMenu_CopyTo, TButton(Sender).ClientOrigin Do
    Begin
      TrackPopupMenu(Handle, TPM_LEFTALIGN Or TPM_TOPALIGN, X, Y + 23, 0, PopupList.Window, Nil);
    End;
  End
  Else
  Begin
    Form7.ButtonCopyTag.AllowAllUp := True;
    Form7.ButtonCopyTag.Down := False;
    Form7.PopupMenu_CopyTo.CloseMenu;
  End;
End;

Procedure TForm7.ButtonDeleteTagsClick(Sender: TObject);
Begin
  DeleteAllTags;
  SaveTAGS;
  //Close;
  Application.ProcessMessages;
End;

Procedure TForm7.ButtonCaseClick(Sender: TObject);
Begin
  If (Form7.ButtonCase.AllowAllUp) Then
  Begin
    Form7.ButtonCase.AllowAllUp := False;
    Form7.ButtonCase.Down := True;
    With Form7.PopupMenuRegisterLetters, TButton(Sender).ClientOrigin Do
    Begin
      TrackPopupMenu(Handle, TPM_LEFTALIGN Or TPM_TOPALIGN, X, Y + 23, 0, PopupList.Window, Nil);
    End;
  End
  Else
  Begin
    Form7.ButtonCase.AllowAllUp := True;
    Form7.ButtonCase.Down := False;
    Form7.PopupMenuRegisterLetters.CloseMenu;
  End;
End;

Procedure SetSecond(stream: Cardinal; Const Value: double);
Begin
  BASS_ChannelSetPosition(stream, BASS_ChannelSeconds2Bytes(stream, Value), BASS_POS_BYTE);
End;

Function ReadSecond(stream: Cardinal): double;
Begin
  Result := BASS_ChannelBytes2Seconds(stream, BASS_ChannelGetPosition(stream, BASS_POS_BYTE));
End;

Procedure TForm7.SafeSetCoverFromImageEditor;
Var
  MemoryStream: TMemoryStream;
  JPEGImage: TJPEGImage;
Begin
  // Проверка наличия изображения
  If (Form4 = Nil) Or (Form4.ImageTagEditor = Nil) Or (Form4.ImageTagEditor.Picture.Graphic = Nil) Or Form4.ImageTagEditor.Picture.Graphic.Empty Then
  Begin
   // ID3v2Tag.DeleteAllCoverArts;
    Exit;
  End;

  MemoryStream := TMemoryStream.Create;
  JPEGImage := TJPEGImage.Create;
  Try
    // Конвертируем в JPEG
    JPEGImage.Assign(Form4.ImageTagEditor.Picture.Graphic);
    JPEGImage.CompressionQuality := 85;

    // Сохраняем в поток
    JPEGImage.SaveToStream(MemoryStream);
    MemoryStream.Position := 0;

    // Устанавливаем обложку
    ID3v2Tag.DeleteAllCoverArts;
    ID3v2Tag.SetCoverPictureFromStream('APIC', '', MemoryStream, 'image/jpeg', 3);

  Finally
    JPEGImage.Free;
    MemoryStream.Free;
    Application.ProcessMessages;
  End;
End;

Procedure TForm7.AddAPECoverFromImageEditor;
Var
  MemoryStream: TMemoryStream;
  JPEGImage: TJPEGImage;
Begin
  // Проверка наличия изображения
  If (Form4 = Nil) Or (Form4.ImageTagEditor = Nil) Or (Form4.ImageTagEditor.Picture.Graphic = Nil) Or Form4.ImageTagEditor.Picture.Graphic.Empty Then
  Begin
    // Нет изображения - удаляем обложки
   // APEv2Tag.DeleteFrameByName('Cover Art (Front)');
   // APEv2Tag.DeleteFrameByName('Cover Art (Back)');
    Exit;
  End;

  MemoryStream := TMemoryStream.Create;
  JPEGImage := TJPEGImage.Create;
  Try
      // Конвертируем в JPEG
    JPEGImage.Assign(Form4.ImageTagEditor.Picture.Graphic);
    JPEGImage.CompressionQuality := 85;

      // Сохраняем в поток
    JPEGImage.SaveToStream(MemoryStream);
    MemoryStream.Position := 0;

      // Удаляем старые обложки
    APEv2Tag.DeleteFrameByName('Cover Art (Front)');
    APEv2Tag.DeleteFrameByName('Cover Art (Back)');

      // Добавляем новую обложку
    APEv2Tag.AddCoverArtFrame('Cover Art (Front)', MemoryStream, '');

  Finally
    JPEGImage.Free;
    MemoryStream.Free;
  End;
End;

Procedure TForm7.SaveAllTAGS;
Var
  ErrorCodeID3v1, ErrorCodeID3v2, ErrorTag, ErrorAPETag: Integer;
Begin
  // Сохранить тег версии ID3v2
  If PageID3v2Tag.Showing = True Then
  Begin
    ID3v1Tag.Title := EditTitleID3v2Tag.Text;
    ID3v1Tag.Artist := EditArtistID3v2Tag.Text;
    ID3v1Tag.Album := EditAlbumID3v2Tag.Text;
    ID3v1Tag.Year := EditYearID3v2Tag.Text;
    ID3v1Tag.Comment := MemoCommentID3v2Tag.Text;
    ID3v1Tag.Track := StrToIntDef(EditTrackID3v2Tag.Text, 0);
    ID3v1Tag.Genre := ComboboxGenreID3v2Tag.Text;
    ErrorCodeID3v1 := ID3v1Tag.SaveToFile(EditFilePathTag.Text);

    If ErrorCodeID3v1 <> ID3V1LIBRARY_SUCCESS Then
    Begin
      MessageDlg(TagsLibraryErrorCode2String(ErrorCodeID3v1) + ' ' + PageID3v2Tag.Caption, mtWarning, [mbOk], 0);
    End;
    If Edit1.Text <> '' Then
    Begin
      BrowseID3v2TagPic;
    End
    Else
    Begin
      SafeSetCoverFromImageEditor;
    End;

    ID3v2Tag.SetText('TIT2', EditTitleID3v2Tag.Text);
    ID3v2Tag.SetText('TPE1', EditArtistID3v2Tag.Text);
    ID3v2Tag.SetText('TALB', EditAlbumID3v2Tag.Text);
    ID3v2Tag.SetText('TYER', EditYearID3v2Tag.Text);
    ID3v2Tag.SetText('TCON', ComboboxGenreID3v2Tag.Text);
    ID3v2Tag.SetText('TRCK', EditTrackID3v2Tag.Text);
    ID3v2Tag.SetUserDefinedURLLink('WXXX', EditURLID3v2Tag.Text, EditURLID3v2Tag.Text);
    StringToLanguageID('', LanguageID);
    ID3v2Tag.SetComment('COMM', MemoCommentID3v2Tag.Text, LanguageID, '');

    ErrorCodeID3v2 := ID3v2Tag.SaveToFile(EditFilePathTag.Text);
    Application.ProcessMessages;
    addMedia;
    Application.ProcessMessages;

    If ErrorCodeID3v2 <> ID3V2LIBRARY_SUCCESS Then
    Begin
      MessageDlg(TagsLibraryErrorCode2String(ErrorCodeID3v2) + ' ' + PageID3v2Tag.Caption, mtWarning, [mbOk], 0);
    End;

    Edit1.Clear;
  End;



  // Сохранить тег
  If PageOtherTag.Showing = True Then
  Begin
    OtherTag.SetText('ARTIST', EditArtistOtherTag.Text);
    OtherTag.SetText('TITLE', EditTitleOtherTag.Text);
    OtherTag.SetText('ALBUM', EditAlbumOtherTag.Text);
    OtherTag.SetText('YEAR', EditYearOtherTag.Text);
    OtherTag.SetText('TRACK', EditTrackOtherTag.Text);
    OtherTag.SetText('GENRE', ComboboxGenreOtherTag.Text);
    OtherTag.SetText('COMMENT', MemoCommentOtherTag.Text);
    OtherTag.SetText('WWW', EditURLOtherTag.Text);
    ErrorTag := OtherTag.SaveToFile(EditFilePathTag.Text);
    If ErrorTag <> TAGSLIBRARY_SUCCESS Then
    Begin
      MessageDlg(TagsLibraryErrorCode2String(ErrorTag) + ' ' + PageOtherTag.Caption, mtWarning, [mbOk], 0);
    End;
  End;

  // Сохранить APE тег
  If PageAPETag.Showing = True Then
  Begin
    If Edit2.Text <> '' Then
    Begin
      BrowseAPETagPic;
    End
    Else
    Begin
      AddAPECoverFromImageEditor;
    End;
    APEv2Tag.SetText('Title', Form7.EditTitleAPETag.Text);
    APEv2Tag.SetText('Artist', Form7.EditArtistAPETag.Text);
    APEv2Tag.SetText('Album', Form7.EditAlbumAPETag.Text);
    APEv2Tag.SetText('Year', Form7.EditYearAPETag.Text);
    APEv2Tag.SetText('Track', Form7.EditTrackAPETag.Text);
    APEv2Tag.SetText('Genre', Form7.ComboboxGenreAPETag.Text);
    APEv2Tag.SetText('Comment', Form7.MemoCommentAPETag.Text);
    ErrorAPETag := APEv2Tag.SaveToFile(EditFilePathTag.Text);
    ListCoverArtsAPE;
    Application.ProcessMessages;
    addMedia;
    Application.ProcessMessages;
    If ErrorAPETag <> APEV2LIBRARY_SUCCESS Then
    Begin
      MessageDlg(TagsLibraryErrorCode2String(ErrorAPETag) + ' ' + PageAPETag.Caption, mtWarning, [mbOk], 0);
    End;
    Edit2.Clear;
  End;

  If (AnsiUpperCase(ExtractFileExt(EditFilePathTag.Text)) = AnsiUpperCase('.mp3')) Then
  Begin
    ClearDataID3v2;
    ClearDataAPE;
    getID3v1Tag;
    getTag3v2;
    GetAPE;
    addMedia;
    Application.ProcessMessages;
  End;

  If (AnsiUpperCase(ExtractFileExt(EditFilePathTag.Text)) <> AnsiUpperCase('.mp3')) Then
  Begin
    ClearDataAllTag;
    AllTag;
  End;
End;

// Сохранение данных
Procedure TForm7.SaveTAGS;
Begin
  // Если трек запущен
  If EditFilePathTag.Text = FileName Then
  Begin
    If Mode = Play Then
    Begin
      Form1.StopMusic;
      Form1.TabPlayList.Enabled := False;
      SaveAllTAGS;
      Form1.TabPlayList.Enabled := True;
      Form1.MenuPlaySG;
    End;
    If Mode = stop Then
    Begin
      Form1.TabPlayList.Enabled := False;
      SaveAllTAGS;
      Form1.TabPlayList.Enabled := True;
    End;
  End;
  // Если трек не запущен
  If EditFilePathTag.Text <> FileName Then
  Begin
    Form1.TabPlayList.Enabled := False;
    SaveAllTAGS;
    Form1.TabPlayList.Enabled := True;
  End;
End;

Procedure TForm7.ButtonSaveTagClick(Sender: TObject);
Begin
  SaveTAGS;
End;

Procedure TForm7.ID3v1_TabShow(Sender: TObject);
Begin
  Form7.ButtonCopyTag.Visible := True;
End;

Procedure TForm7.PageID3v2TagShow(Sender: TObject);
Begin
  Form7.ButtonCopyTag.Visible := True;
End;

Procedure TForm7.PageOtherTagShow(Sender: TObject);
Begin
  Form7.ButtonCopyTag.Visible := False;
End;

Procedure TForm7.WordsCapitalLettersMenuClick(Sender: TObject);
Begin
  If PageOtherTag.Showing = True Then
  Begin
    EditAlbumOtherTag.Text := PROPER(EditAlbumOtherTag.Text);
    EditArtistOtherTag.Text := PROPER(EditArtistOtherTag.Text);
    EditTitleOtherTag.Text := PROPER(EditTitleOtherTag.Text);
    Form7.ButtonCase.AllowAllUp := True;
    Form7.ButtonCase.Down := True;
  End;
  If PageID3v2Tag.Showing = True Then
  Begin
    EditTitleID3v2Tag.Text := PROPER(EditTitleID3v2Tag.Text);
    EditArtistID3v2Tag.Text := PROPER(EditArtistID3v2Tag.Text);
    EditAlbumID3v2Tag.Text := PROPER(EditAlbumID3v2Tag.Text);
    MemoCommentID3v2Tag.Text := PROPER(MemoCommentID3v2Tag.Text);
    Form7.ButtonCase.AllowAllUp := True;
    Form7.ButtonCase.Down := True;
  End;
  If PageAPETag.Showing = True Then
  Begin
    EditTitleAPETag.Text := PROPER(EditTitleAPETag.Text);
    EditArtistAPETag.Text := PROPER(EditArtistAPETag.Text);
    EditAlbumAPETag.Text := PROPER(EditAlbumAPETag.Text);
    MemoCommentAPETag.Text := PROPER(MemoCommentAPETag.Text);
    Form7.ButtonCase.AllowAllUp := True;
    Form7.ButtonCase.Down := True;
  End;
End;

Procedure TForm7.AllCapitalLettersMenuClick(Sender: TObject);
Begin
  If PageOtherTag.Showing = True Then
  Begin
    EditAlbumOtherTag.Text := AnsiUpperCase(EditAlbumOtherTag.Text);
    EditArtistOtherTag.Text := AnsiUpperCase(EditArtistOtherTag.Text);
    EditTitleOtherTag.Text := AnsiUpperCase(EditTitleOtherTag.Text);
    Form7.ButtonCase.AllowAllUp := True;
    Form7.ButtonCase.Down := False;
  End;
  If PageID3v2Tag.Showing = True Then
  Begin
    EditTitleID3v2Tag.Text := AnsiUpperCase(EditTitleID3v2Tag.Text);
    EditArtistID3v2Tag.Text := AnsiUpperCase(EditArtistID3v2Tag.Text);
    EditAlbumID3v2Tag.Text := AnsiUpperCase(EditAlbumID3v2Tag.Text);
    MemoCommentID3v2Tag.Text := AnsiUpperCase(MemoCommentID3v2Tag.Text);
    Form7.ButtonCase.AllowAllUp := True;
    Form7.ButtonCase.Down := False;
  End;
  If PageAPETag.Showing = True Then
  Begin
    EditTitleAPETag.Text := AnsiUpperCase(EditTitleAPETag.Text);
    EditArtistAPETag.Text := AnsiUpperCase(EditArtistAPETag.Text);
    EditAlbumAPETag.Text := AnsiUpperCase(EditAlbumAPETag.Text);
    MemoCommentAPETag.Text := AnsiUpperCase(MemoCommentAPETag.Text);
    Form7.ButtonCase.AllowAllUp := True;
    Form7.ButtonCase.Down := False;
  End;
End;

Procedure TForm7.AllSmallLettersMenuClick(Sender: TObject);
Begin
  If PageOtherTag.Showing = True Then
  Begin
    EditAlbumOtherTag.Text := AnsiLowerCase(EditAlbumOtherTag.Text);
    EditArtistOtherTag.Text := AnsiLowerCase(EditArtistOtherTag.Text);
    EditTitleOtherTag.Text := AnsiLowerCase(EditTitleOtherTag.Text);
    Form7.ButtonCase.AllowAllUp := True;
    Form7.ButtonCase.Down := False;
  End;
  If PageID3v2Tag.Showing = True Then
  Begin
    EditTitleID3v2Tag.Text := AnsiLowerCase(EditTitleID3v2Tag.Text);
    EditArtistID3v2Tag.Text := AnsiLowerCase(EditArtistID3v2Tag.Text);
    EditAlbumID3v2Tag.Text := AnsiLowerCase(EditAlbumID3v2Tag.Text);
    MemoCommentID3v2Tag.Text := AnsiLowerCase(MemoCommentID3v2Tag.Text);
    Form7.ButtonCase.AllowAllUp := True;
    Form7.ButtonCase.Down := False;
  End;
  If PageAPETag.Showing = True Then
  Begin
    EditTitleAPETag.Text := AnsiLowerCase(EditTitleAPETag.Text);
    EditArtistAPETag.Text := AnsiLowerCase(EditArtistAPETag.Text);
    EditAlbumAPETag.Text := AnsiLowerCase(EditAlbumAPETag.Text);
    MemoCommentAPETag.Text := AnsiLowerCase(MemoCommentAPETag.Text);
    Form7.ButtonCase.AllowAllUp := True;
    Form7.ButtonCase.Down := False;
  End;
End;

Procedure TForm7.MenuItem14Click(Sender: TObject);
Begin
  OtherTag.DeleteAllCoverArts;
  Application.ProcessMessages;
End;

Procedure TForm7.MenuItem19Click(Sender: TObject);
Begin
  OtherTag.DeleteAllCoverArts;
  Application.ProcessMessages;
End;

Procedure TForm7.APEBrowseMenuClick(Sender: TObject);
Begin
  SetWindowPos(Handle, HWND_NOTOPMOST, Left, Top, Width, Height, SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE);
  If OpenPictureDialog1.Execute(Form7.Handle) Then
  Begin
    Edit1.Text := '';
    ImageAPETag.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    Application.ProcessMessages;
    Edit2.Text := OpenPictureDialog1.FileName;
    Application.ProcessMessages;
  End;
  SetWindowPos(Handle, HWND_TOPMOST, Left, Top, Width, Height, SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE);
End;

Procedure TForm7.APESearchYandexMenuClick(Sender: TObject);
Begin
  If EditArtistAPETag.Text + EditTitleAPETag.Text <> '' Then
  Begin
    ShellExecute(Handle, 'open', pwideChar('https://yandex.ru/images/search?from=tabbar&text=' + EditArtistAPETag.Text + ' - ' + EditTitleAPETag.Text), Nil, Nil, SW_SHOWNORMAL);
    Application.ProcessMessages;
  End;

  If EditArtistAPETag.Text + EditTitleAPETag.Text = '' Then
  Begin
    ShellExecute(Handle, 'open', pwideChar('https://yandex.ru/images/search?from=tabbar&text=' + Form1.ExtractOnlyFileName(EditFilePathTag.Text)), Nil, Nil, SW_SHOWNORMAL);
    Application.ProcessMessages;
  End;
End;

Procedure TForm7.APESearchGoogleMenuClick(Sender: TObject);
Begin
  If EditArtistAPETag.Text + EditTitleAPETag.Text <> '' Then
  Begin
    ShellExecute(Handle, 'open', pwideChar('https://www.google.com/search?q=' + EditArtistAPETag.Text + ' - ' + EditTitleAPETag.Text), Nil, Nil, SW_SHOWNORMAL);
    Application.ProcessMessages;
  End;

  If EditArtistAPETag.Text + EditTitleAPETag.Text = '' Then
  Begin
    ShellExecute(Handle, 'open', pwideChar('https://www.google.com/search?q=' + Form1.ExtractOnlyFileName(EditFilePathTag.Text)), Nil, Nil, SW_SHOWNORMAL);
    Application.ProcessMessages;
  End;
End;

Procedure TForm7.APESaveAsMenuClick(Sender: TObject);
Begin
  SetWindowPos(Handle, HWND_NOTOPMOST, Left, Top, Width, Height, SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE);
  SaveAPETagPic;
  SetWindowPos(Handle, HWND_TOPMOST, Left, Top, Width, Height, SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE);
End;

Procedure TForm7.APEDeleteMenuClick(Sender: TObject);
Begin
  ImageAPETag.Picture := Nil;
  Edit2.Text := 'DEL';
End;

Procedure TForm7.APEPasteMenuClick(Sender: TObject);
Var
  Description: String;
  ms: TMemoryStream;
  jpg: TJPEGImage;
Begin
  ms := TMemoryStream.Create;
  ImageAPETag.Picture := Nil;
  ImageAPETag.Picture.Assign(Clipboard);
  If ImageAPETag.Picture.Graphic = Nil Then
    exit;
  If ImageAPETag.Picture.Graphic Is TJPEGImage Then
    exit;
  jpg := TJPEGImage.Create();
  Try
    jpg.Assign(ImageAPETag.Picture.Graphic);
    jpg.CompressionQuality := 85;
    jpg.Compress();
    ImageAPETag.Picture.Graphic := jpg;
  Finally
    jpg.Free;
  End;
  ImageAPETag.Picture.Graphic.SaveToStream(ms);
  APEv2Tag.DeleteFrameByName('Cover Art (Front)');
  APEv2Tag.DeleteFrameByName('Cover Art (Back)');
  APEv2Tag.DeleteAllFrames;
  APEv2Tag.DeleteAllCoverArts;
  Description := '';
  APEv2Tag.AddCoverArtFrame('Cover Art (Front)', ms, Description);
  ms.Free;
  APEv2Tag.SaveToFile(EditFilePathTag.Text);
  Form7.ListCoverArtsAPE;
  SaveTAGS;
End;

Procedure TForm7.ResizeID3v2TagMenuClick(Sender: TObject);
Begin
  SetWindowPos(Form4.Handle, HWND_TOPMOST, Left, Top, Width, Height, SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE);
  Form4.Show;
End;

Procedure TForm7.APEResizeMenuClick(Sender: TObject);
Begin
  SetWindowPos(Handle, HWND_NOTOPMOST, Left, Top, Width, Height, SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE);
  Form4.Show;
End;

Procedure TForm7.DeleteID3v2TagMenuClick(Sender: TObject);
Begin
  ImageID3v2Tag.Picture := Nil;
  Edit1.Text := 'DEL';
End;

Procedure TForm7.SerchYandexID3v2TagMenuClick(Sender: TObject);
Begin
  If EditArtistID3v2Tag.Text + EditTitleID3v2Tag.Text <> '' Then
  Begin
    ShellExecute(Handle, 'open', pwideChar('https://yandex.ru/images/search?from=tabbar&text=' + EditArtistID3v2Tag.Text + ' - ' + EditTitleID3v2Tag.Text), Nil, Nil, SW_SHOWNORMAL);
    Application.ProcessMessages;
  End;

  If EditArtistID3v2Tag.Text + EditTitleID3v2Tag.Text = '' Then
  Begin
    ShellExecute(Handle, 'open', pwideChar('https://yandex.ru/images/search?from=tabbar&text=' + Form1.ExtractOnlyFileName(EditFilePathTag.Text)), Nil, Nil, SW_SHOWNORMAL);
    Application.ProcessMessages;
  End;
End;

Procedure TForm7.PageControlTagsChange(Sender: TObject);
Begin
  Form7.PopupMenuID3v2Tag.CloseMenu;
  Form7.PopupMenuAPETag.CloseMenu;
  Form7.ButtonCopyTag.AllowAllUp := True;
  Form7.ButtonCopyTag.Down := False;
  Form7.PopupMenu_CopyTo.CloseMenu;
  Form7.ButtonCase.AllowAllUp := True;
  Form7.ButtonCase.Down := False;
  Form7.PopupMenuRegisterLetters.CloseMenu;
  Form7.ButtonAutoTag.AllowAllUp := True;
  Form7.ButtonAutoTag.Down := False;
  Form7.PopupMenuAutoTag.CloseMenu;
End;

Procedure TForm7.PopupMenuAPETagPopup(Sender: TObject);
Begin
  If ImageAPETag.Picture.Graphic = Nil Then
  Begin
    APEDeleteMenu.Enabled := False;
  End;
  If ImageAPETag.Picture.Graphic <> Nil Then
  Begin
    APEDeleteMenu.Enabled := True;
  End;
  If ImageAPETag.Picture.Graphic = Nil Then
  Begin
    APESaveAsMenu.Enabled := False;
  End;
  If ImageAPETag.Picture.Graphic <> Nil Then
  Begin
    APESaveAsMenu.Enabled := True;
  End;
  If ImageAPETag.Picture.Graphic = Nil Then
  Begin
    APEResizeMenu.Enabled := False;
  End;
  If ImageAPETag.Picture.Graphic <> Nil Then
  Begin
    APEResizeMenu.Enabled := True;
  End;

  If Clipboard.HasFormat(CF_PICTURE) = False Then
  Begin
    APECopyMenu.Enabled := False;
  End;
  If Clipboard.HasFormat(CF_PICTURE) Then
  Begin
    APECopyMenu.Enabled := True;
  End;

  { if ImageAPETag.Picture.Graphic = nil then
    begin
    MenuItem6.Enabled := False;
    end;
    if ImageAPETag.Picture.Graphic <> nil then
    begin
    MenuItem6.Enabled := True;
    end; }

End;

Procedure TForm7.PageAPETagShow(Sender: TObject);
Begin
  Form7.ButtonCopyTag.Visible := True;
End;

Procedure TForm7.AutoArtistTitleMenuClick(Sender: TObject);
Begin
  // ID3v2Tag
  If PageID3v2Tag.Showing = True Then
  Begin
    If Pos(' - ', Form1.ExtractOnlyFileName(EditFilePathTag.Text)) = 0 Then
      exit;
    If Pos(' - ', Form1.ExtractOnlyFileName(EditFilePathTag.Text)) <> 0 Then
    Begin
      EditArtistID3v2Tag.Text := Copy(Form1.ExtractOnlyFileName(EditFilePathTag.Text), 0, Pos(' - ', Form1.ExtractOnlyFileName(EditFilePathTag.Text)) - 1);
      // Artist
      EditTitleID3v2Tag.Text := Copy(Form1.ExtractOnlyFileName(EditFilePathTag.Text), Pos(' - ', Form1.ExtractOnlyFileName(EditFilePathTag.Text)) + 3, Length(Form1.ExtractOnlyFileName(EditFilePathTag.Text)));
      // Title
    End;
  End;
  // Другой тег
  If PageOtherTag.Showing = True Then
  Begin
    If Pos(' - ', Form1.ExtractOnlyFileName(EditFilePathTag.Text)) = 0 Then
      exit;
    If Pos(' - ', Form1.ExtractOnlyFileName(EditFilePathTag.Text)) <> 0 Then
    Begin
      EditArtistOtherTag.Text := Copy(Form1.ExtractOnlyFileName(EditFilePathTag.Text), 0, Pos(' - ', Form1.ExtractOnlyFileName(EditFilePathTag.Text)) - 1);
      // Artist
      EditTitleOtherTag.Text := Copy(Form1.ExtractOnlyFileName(EditFilePathTag.Text), Pos(' - ', Form1.ExtractOnlyFileName(EditFilePathTag.Text)) + 3, Length(Form1.ExtractOnlyFileName(EditFilePathTag.Text)));
      // Title
    End;
  End;
  // APE
  If PageAPETag.Showing = True Then
  Begin
    If Pos(' - ', Form1.ExtractOnlyFileName(EditFilePathTag.Text)) = 0 Then
      exit;
    If Pos(' - ', Form1.ExtractOnlyFileName(EditFilePathTag.Text)) <> 0 Then
    Begin
      EditArtistAPETag.Text := Copy(Form1.ExtractOnlyFileName(EditFilePathTag.Text), 0, Pos(' - ', Form1.ExtractOnlyFileName(EditFilePathTag.Text)) - 1);
      // Artist
      EditTitleAPETag.Text := Copy(Form1.ExtractOnlyFileName(EditFilePathTag.Text), Pos(' - ', Form1.ExtractOnlyFileName(EditFilePathTag.Text)) + 3, Length(Form1.ExtractOnlyFileName(EditFilePathTag.Text)));
      // Title
    End;
  End;
End;

Procedure TForm7.BrowseAPETagPic;
Var
  Description: String;
  FileStream: TFileStream;
Begin
  APEv2Tag.DeleteFrameByName('Cover Art (Front)');
  APEv2Tag.DeleteFrameByName('Cover Art (Back)');
  Form7.ImageAPETag.Picture := Nil;
  Description := '';
  FileStream := TFileStream.Create(Edit2.Text, fmOpenRead);
  Try
    APEv2Tag.AddCoverArtFrame('Cover Art (Front)', FileStream, Description);
  Finally
    FreeAndNil(FileStream);
  End;
End;

Procedure TForm7.BrowseID3v2TagPic;
Var
  Fext: String;
  MIMEType: String;
  FrameIndex: Integer;
  Description: String;
  PictureType: Integer;
Begin
  Form1.StopMusic;

  // Удаляем все существующие обложки
  ID3v2Tag.DeleteAllCoverArts;
  Form7.ImageID3v2Tag.Picture := Nil;

  Fext := UpperCase(ExtractFileExt(Edit1.Text));
  Application.ProcessMessages;

  // Определяем MIME-тип
  MIMEType := '';
  If (Fext = '.JPG') Or (Fext = '.JPEG') Then
  Begin
    MIMEType := 'image/jpeg';
  End
  Else If (Fext = '.PNG') Then
  Begin
    MIMEType := 'image/png';
  End
  Else If (Fext = '.BMP') Then
  Begin
    MIMEType := 'image/bmp';
  End
  Else If (Fext = '.GIF') Then
  Begin
    MIMEType := 'image/gif';
  End;

  If MIMEType <> '' Then
  Begin
    Description := '';
    PictureType := $03;
    FrameIndex := ID3v2Tag.AddFrame('APIC');
    ID3v2Tag.SetCoverPictureFromFile(FrameIndex, Description, Edit1.Text, MIMEType, PictureType);
  End;
End;

Procedure TForm7.BrowseID3v2TagPicStream;
Var
  JPEGImage: TJPEGImage;
  MemoryStream: TMemoryStream;
Begin
  If Form4.ImageTagEditor.Picture.Graphic.Empty Then
    Exit;

  MemoryStream := TMemoryStream.Create;
  JPEGImage := TJPEGImage.Create;
  Try
    Try
      // Конвертируем любое изображение в JPEG
      JPEGImage.Assign(Form4.ImageTagEditor.Picture.Graphic);
      JPEGImage.CompressionQuality := 85; // Хорошее качество
      JPEGImage.SaveToStream(MemoryStream);
      MemoryStream.Position := 0;

      // Очищаем старые обложки
      ID3v2Tag.DeleteAllCoverArts;

      // Добавляем обложку
      If ID3v2Tag.SetCoverPictureFromStream('APIC', 'Album Cover', MemoryStream, 'image/jpeg', 3) Then
      Begin
        //ShowMessage('Обложка успешно добавлена');
        // Обновляем превью если нужно
        // ID3v2Tag.GetCoverPicture(0, Form7.ImageID3v2Tag.Picture);
      End;

    Except
    End;
  Finally
    JPEGImage.Free;
    MemoryStream.Free;
  End;
End;

Procedure TForm7.BrowseID3v2TagMenuClick(Sender: TObject);
Begin
  SetWindowPos(Handle, HWND_NOTOPMOST, Left, Top, Width, Height, SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE);
  //BringToFront;
  If OpenPictureDialog1.Execute(Handle) Then
  Begin
    Edit1.Text := '';
    ImageID3v2Tag.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    Application.ProcessMessages;
    Edit1.Text := OpenPictureDialog1.FileName;
    Application.ProcessMessages;
  End;
  SetWindowPos(Handle, HWND_TOPMOST, Left, Top, Width, Height, SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE);
End;

Procedure TForm7.CopyID3v2TagMenuClick(Sender: TObject);
Begin
  If ImageID3v2Tag.Picture.Graphic = Nil Then
    exit;
  Clipboard.Assign(ImageID3v2Tag.Picture.Graphic);
End;

Procedure TForm7.PasteID3v2TagMenuClick(Sender: TObject);
Var
  FrameIndex: Integer;
  Description: String;
  PictureType: Integer;
  ms: TMemoryStream;
  jpg: TJPEGImage;
Begin
  ms := TMemoryStream.Create;
  Form7.ImageID3v2Tag.Picture := Nil;
  ImageID3v2Tag.Picture.Assign(Clipboard);
  If ImageID3v2Tag.Picture.Graphic = Nil Then
    exit;
  If ImageID3v2Tag.Picture.Graphic Is TJPEGImage Then
    exit;
  jpg := TJPEGImage.Create();
  Try
    jpg.Assign(ImageID3v2Tag.Picture.Graphic);
    jpg.CompressionQuality := 85;
    jpg.Compress();
    ImageID3v2Tag.Picture.Graphic := jpg;
  Finally
    jpg.Free;
  End;
  ImageID3v2Tag.Picture.Graphic.SaveToStream(ms);
  ID3v2Tag.DeleteAllFrames;
  ID3v2Tag.DeleteAllCoverArts;
  // Description := 'Cover Art';
  Description := '';
  PictureType := $03;
  FrameIndex := ID3v2Tag.AddFrame('APIC');
  ID3v2Tag.SetCoverPictureFromStream(FrameIndex, Description, ms, 'image/jpeg', PictureType);
  ms.Free;

  Form7.SaveTAGS;
  Form7.LoadAPIC(0);
End;

Procedure TForm7.APECopyMenuClick(Sender: TObject);
Begin
  If ImageAPETag.Picture.Graphic = Nil Then
    exit;
  Clipboard.Assign(ImageAPETag.Picture.Graphic);
End;

Procedure TForm7.FormActivate(Sender: TObject);
Begin
  DragAcceptFiles(Handle, true);
End;

Procedure TForm7.FormClick(Sender: TObject);
Begin
  Form7.PopupMenuID3v2Tag.CloseMenu;
  Form7.PopupMenuAPETag.CloseMenu;
  Form7.ButtonCopyTag.AllowAllUp := True;
  Form7.ButtonCopyTag.Down := False;
  Form7.PopupMenu_CopyTo.CloseMenu;
  Form7.ButtonCase.AllowAllUp := True;
  Form7.ButtonCase.Down := False;
  Form7.PopupMenuRegisterLetters.CloseMenu;
  Form7.ButtonAutoTag.AllowAllUp := True;
  Form7.ButtonAutoTag.Down := False;
  Form7.PopupMenuAutoTag.CloseMenu;
End;

Procedure TForm7.FormCreate(Sender: TObject);
Begin
  PageControlTags.ActivePage := PageID3v2Tag;
  ID3v1Tag := TID3v1Tag.Create;
  ID3v2Tag := TID3v2Tag.Create;
  OtherTag := TTags.Create;
  APEv2Tag := TAPEv2Tag.Create;
  DragAcceptFiles(Handle, True);
  Application.ProcessMessages;
  ImageOtherTag.Picture := ImageSubstrateID3v2Tag.Picture;
  ImageAPETag1.Picture := ImageSubstrateID3v2Tag.Picture;
End;

Procedure TForm7.FormDestroy(Sender: TObject);
Begin
  DragAcceptFiles(Handle, False);
End;

Procedure TForm7.FormDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; Var Accept: Boolean);
Begin
  Accept := True;
End;

Procedure TForm7.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key = #27 Then
  Begin
    Form7.Close;
  End;
End;

Procedure TForm7.AllTag;
Var
  i: Integer;
Begin
  OtherTag.LoadFromFile(EditFilePathTag.Text);
  If OtherTag.Loaded Then
  Begin
    EditArtistOtherTag.Text := OtherTag.GetText('ARTIST');
    EditTitleOtherTag.Text := OtherTag.GetText('TITLE');
    EditAlbumOtherTag.Text := OtherTag.GetText('ALBUM');
    EditYearOtherTag.Text := OtherTag.GetText('YEAR');
    EditTrackOtherTag.Text := OtherTag.GetText('TRACK');
    ComboboxGenreOtherTag.Text := OtherTag.GetText('GENRE');
    MemoCommentOtherTag.Text := OtherTag.GetText('COMMENT');
    For i := 0 To OtherTag.Count - 1 Do
    Begin
      If OtherTag.tags[i].Name = 'WWW' Then
      Begin
        EditURLOtherTag.Text := OtherTag.tags[i].Value;
        Application.ProcessMessages;
      End;
    End;
  End;
End;

Procedure TForm7.GetAPE;
Begin
  APEv2Tag.LoadFromFile(Form7.EditFilePathTag.Text);
  Form7.EditTitleAPETag.Text := APEv2Tag.GetText('Title');
  Form7.EditArtistAPETag.Text := APEv2Tag.GetText('Artist');
  Form7.EditAlbumAPETag.Text := APEv2Tag.GetText('Album');
  Form7.EditYearAPETag.Text := APEv2Tag.GetText('Year');
  Form7.EditTrackAPETag.Text := APEv2Tag.GetText('Track');
  Form7.ComboboxGenreAPETag.Text := APEv2Tag.GetText('Genre');
  Form7.MemoCommentAPETag.Text := APEv2Tag.GetText('Comment');
  Form7.ListCoverArtsAPE;
End;

Procedure TForm7.ID3v2APE1Click(Sender: TObject);
Begin
  EditTitleAPETag.Text := EditTitleID3v2Tag.Text;
  EditArtistAPETag.Text := EditArtistID3v2Tag.Text;
  EditAlbumAPETag.Text := EditAlbumID3v2Tag.Text;
  EditYearAPETag.Text := EditYearID3v2Tag.Text;
  EditTrackAPETag.Text := EditTrackID3v2Tag.Text;
  MemoCommentAPETag.Text := MemoCommentID3v2Tag.Text;
  ComboboxGenreAPETag.Text := ComboboxGenreID3v2Tag.Text;
  Form7.ButtonCopyTag.AllowAllUp := True;
  Form7.ButtonCopyTag.Down := True;
End;

Procedure TForm7.ID3v2APE2Click(Sender: TObject);
Begin
  EditTitleID3v2Tag.Text := EditTitleAPETag.Text;
  EditArtistID3v2Tag.Text := EditArtistAPETag.Text;
  EditAlbumID3v2Tag.Text := EditAlbumAPETag.Text;
  EditYearID3v2Tag.Text := EditYearAPETag.Text;
  EditTrackID3v2Tag.Text := EditTrackAPETag.Text;
  MemoCommentID3v2Tag.Text := MemoCommentAPETag.Text;
  ComboboxGenreID3v2Tag.Text := ComboboxGenreAPETag.Text;
  Form7.ButtonCopyTag.AllowAllUp := True;
  Form7.ButtonCopyTag.Down := True;
End;

// Добавить медиа данные в плейлист
Procedure TForm7.addMedia;
Var
  FileName2: String;
Begin
  FileName2 := EditFilePathTag.Text;
  If FileExists(FileName2) = False Then
    exit;
  OtherTag2.LoadFromFile(FileName2);
  If (OtherTag2.Loaded = False) Or (OtherTag2.GetText('ARTIST') + OtherTag2.GetText('TITLE') = '') Then
    exit;
  If (OtherTag2.Loaded <> False) Or (OtherTag2.GetText('ARTIST') + OtherTag2.GetText('TITLE') <> '') Then
  Begin
    Form1.StringGrid1.Cells[1, Form1.StringGrid1.Row] := OtherTag2.GetText('ARTIST') + ' - ' + OtherTag2.GetText('TITLE');
    Application.ProcessMessages;
  End;
End;

Procedure TForm7.FormShow(Sender: TObject);
Begin
  SetWindowPos(Handle, HWND_TOPMOST, Left, Top, Width, Height, SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE);

  // EditFilePathTag.Text := form1.ListView1.Selected.SubItems.Strings[2];
  Try
    EditFilePathTag.Text := Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row];
  Except
  End;
  Edit1.Clear;
  Edit2.Clear;
  If ((FileExists(EditFilePathTag.Text)) = True) Then
  Begin
    If ((AnsiUpperCase(ExtractFileExt(EditFilePathTag.Text)) = AnsiUpperCase('.mp3'))) And (((AnsiUpperCase(ExtractFileExt(EditFilePathTag.Text)) <> AnsiUpperCase('.ape')))) Then
    Begin
      ClearDataID3v2;
      ClearDataAPE;
      getID3v1Tag;
      getTag3v2;
      GetAPE;
      addMedia;
      If Form7.PageID3v2Tag.Showing = true Then
      Begin
        Form4.LoadAPIC(0);
      End;
      If Form7.PageAPETag.Showing = true Then
      Begin
        ListCoverArtsAPE;
      End;
      PageControlTags.ActivePage := PageID3v2Tag;
      PageID3v2Tag.TabVisible := True;
      PageAPETag.TabVisible := True;
      PageOtherTag.TabVisible := False;
      Application.ProcessMessages;
    End;

    If ((AnsiUpperCase(ExtractFileExt(EditFilePathTag.Text)) = AnsiUpperCase('.ape'))) And ((AnsiUpperCase(ExtractFileExt(EditFilePathTag.Text)) <> AnsiUpperCase('.mp3'))) Then
    Begin
      ClearDataAPE;
      GetAPE;
      If Form7.PageID3v2Tag.Showing = true Then
      Begin
        Form4.LoadAPIC(0);
      End;
      If Form7.PageAPETag.Showing = true Then
      Begin
        ListCoverArtsAPE;
      End;
      PageControlTags.ActivePage := PageAPETag;
      PageAPETag.TabVisible := True;
      PageOtherTag.TabVisible := False;
      PageID3v2Tag.TabVisible := False;
      Application.ProcessMessages;
    End;

    If ((AnsiUpperCase(ExtractFileExt(EditFilePathTag.Text)) <> AnsiUpperCase('.mp3'))) And ((AnsiUpperCase(ExtractFileExt(EditFilePathTag.Text)) <> AnsiUpperCase('.ape'))) Then
    Begin
      ClearDataAllTag;
      AllTag;
      Application.ProcessMessages;
      PageControlTags.ActivePage := PageOtherTag;
      PageOtherTag.TabVisible := True;
      PageID3v2Tag.TabVisible := False;
      PageAPETag.TabVisible := False;
      Application.ProcessMessages;
    End;
  End;
End;

Procedure TForm7.getID3v1Tag;
Begin
  ID3v1Tag.LoadFromFile(EditFilePathTag.Text);
  EditTitleID3v2Tag.Text := ID3v1Tag.Title;
  EditArtistID3v2Tag.Text := ID3v1Tag.Artist;
  EditAlbumID3v2Tag.Text := ID3v1Tag.Album;
  EditYearID3v2Tag.Text := ID3v1Tag.Year;
  MemoCommentID3v2Tag.Text := ID3v1Tag.Comment;
  EditTrackID3v2Tag.Text := IntToStr(ID3v1Tag.Track);
  ComboboxGenreID3v2Tag.Text := ID3v1Tag.Genre;
  Application.ProcessMessages;
End;

Procedure TForm7.getTag3v2;
Var
  LanguageID: TLanguageID;
  Description: String;
  Index: Integer;
Begin
  ID3v2Tag.BeginningSearchLength := 128;
  ID3v2Tag.LoadFromFile(EditFilePathTag.Text);
  EditTitleID3v2Tag.Text := ID3v2Tag.GetText('TIT2');
  EditArtistID3v2Tag.Text := ID3v2Tag.GetText('TPE1');
  EditAlbumID3v2Tag.Text := ID3v2Tag.GetText('TALB');
  EditYearID3v2Tag.Text := ID3v2Tag.GetText('TYER');
  EditTrackID3v2Tag.Text := ID3v2Tag.GetText('TRCK');
  ComboboxGenreID3v2Tag.Text := ID3v2DecodeGenre(ID3v2Tag.GetText('TCON'));
  Index := ID3v2Tag.FrameExists('WXXX');
  EditURLID3v2Tag.Text := ID3v2Tag.GetUserDefinedURLLink(Index, Description);
  MemoCommentID3v2Tag.Text := ID3v2Tag.GetComment('COMM', LanguageID, Description);
  LoadAPIC(0);
  Application.ProcessMessages;
End;

Procedure TForm7.SerchGoogleID3v2TagMenuClick(Sender: TObject);
Begin
  If EditArtistID3v2Tag.Text + EditTitleID3v2Tag.Text <> '' Then
  Begin
    ShellExecute(Handle, 'open', pwideChar('https://www.google.com/search?q=' + EditArtistID3v2Tag.Text + ' - ' + EditTitleID3v2Tag.Text), Nil, Nil, SW_SHOWNORMAL);
    Application.ProcessMessages;
  End;

  If EditArtistID3v2Tag.Text + EditTitleID3v2Tag.Text = '' Then
  Begin
    ShellExecute(Handle, 'open', pwideChar('https://www.google.com/search?q=' + Form1.ExtractOnlyFileName(EditFilePathTag.Text)), Nil, Nil, SW_SHOWNORMAL);
    Application.ProcessMessages;
  End;
End;

Procedure TForm7.GroupBox_APEClick(Sender: TObject);
Begin
  Form7.PopupMenuID3v2Tag.CloseMenu;
  Form7.PopupMenuAPETag.CloseMenu;
  Form7.ButtonCopyTag.AllowAllUp := True;
  Form7.ButtonCopyTag.Down := False;
  Form7.PopupMenu_CopyTo.CloseMenu;
  Form7.ButtonCase.AllowAllUp := True;
  Form7.ButtonCase.Down := False;
  Form7.PopupMenuRegisterLetters.CloseMenu;
  Form7.ButtonAutoTag.AllowAllUp := True;
  Form7.ButtonAutoTag.Down := False;
  Form7.PopupMenuAutoTag.CloseMenu;
  Application.ProcessMessages;
End;

Procedure TForm7.GroupBox_ID3v1Click(Sender: TObject);
Begin
  Form7.PopupMenuID3v2Tag.CloseMenu;
  Form7.PopupMenuAPETag.CloseMenu;
  Form7.ButtonCopyTag.AllowAllUp := True;
  Form7.ButtonCopyTag.Down := False;
  Form7.PopupMenu_CopyTo.CloseMenu;
  Form7.ButtonCase.AllowAllUp := True;
  Form7.ButtonCase.Down := False;
  Form7.PopupMenuRegisterLetters.CloseMenu;
  Form7.ButtonAutoTag.AllowAllUp := True;
  Form7.ButtonAutoTag.Down := False;
  Form7.PopupMenuAutoTag.CloseMenu;
  Application.ProcessMessages;
End;

Procedure TForm7.GroupBox_ID3v2Click(Sender: TObject);
Begin
  Form7.PopupMenuID3v2Tag.CloseMenu;
  Form7.PopupMenuAPETag.CloseMenu;
  Form7.ButtonCopyTag.AllowAllUp := True;
  Form7.ButtonCopyTag.Down := False;
  Form7.PopupMenu_CopyTo.CloseMenu;
  Form7.ButtonCase.AllowAllUp := True;
  Form7.ButtonCase.Down := False;
  Form7.PopupMenuRegisterLetters.CloseMenu;
  Form7.ButtonAutoTag.AllowAllUp := True;
  Form7.ButtonAutoTag.Down := False;
  Form7.PopupMenuAutoTag.CloseMenu;
  Application.ProcessMessages;
End;

Procedure TForm7.GroupBox_TagsClick(Sender: TObject);
Begin
  Form7.PopupMenuID3v2Tag.CloseMenu;
  Form7.PopupMenuAPETag.CloseMenu;
  Form7.ButtonCopyTag.AllowAllUp := True;
  Form7.ButtonCopyTag.Down := False;
  Form7.PopupMenu_CopyTo.CloseMenu;
  Form7.ButtonCase.AllowAllUp := True;
  Form7.ButtonCase.Down := False;
  Form7.PopupMenuRegisterLetters.CloseMenu;
  Form7.ButtonAutoTag.AllowAllUp := True;
  Form7.ButtonAutoTag.Down := False;
  Form7.PopupMenuAutoTag.CloseMenu;
  Application.ProcessMessages;
End;

Procedure TForm7.DeleteAllTags;
Var
  buttonSelected: Integer;
  ModeLocal: TPlayerMode;
Begin
  // Удаление ID3v2Tag
  ModeLocal := Mode;
  If PageID3v2Tag.Showing Then
  Begin
    buttonSelected := Application.MessageBox(pchar(Form1.LangQuestionDelTag.Caption + ' ' + PageID3v2Tag.Caption + '?'), pchar(Form1.LangConfirmation.Caption), MB_YESNO + MB_ICONQUESTION);
    If (EditFilePathTag.Text = FileName) Then
    Begin
      Form1.StopMusic;
    End;
    If (EditFilePathTag.Text = FileName) And (Mode = Play) Then
    Begin
      Form1.StopMusic;
    End;
    If buttonSelected = mrYes Then
    Begin
      // 1. Удаление ID3v1 тега
      RemoveID3v1TagFromFile(EditFilePathTag.Text);
      ID3v1Tag.Clear;
      ID3v2Tag.RemoveUnsynchronisationOnAllFrames;
      ID3v2Tag.DeleteAllFrames;
      ID3v2Tag.DeleteAllCoverArts; // Удаляем все обложки
      ID3v2Tag.Clear;
      RemoveID3v2TagFromFile(EditFilePathTag.Text);
      ID3v1Tag.SaveToFile(EditFilePathTag.Text);
      ID3v2Tag.SaveToFile(EditFilePathTag.Text);
      getID3v1Tag;
      getTag3v2;
      addMedia;
      Application.ProcessMessages;
    End;
    ImageID3v2Tag.Picture := Nil;
    Form4.ImageTagEditor.Picture := Nil;
    Edit1.Text := 'DEL';
    If buttonSelected = mrNo Then
      Exit;
  End;

  // Удаление других тегов
  If PageOtherTag.Showing Then
  Begin
    buttonSelected := Application.MessageBox(pchar(Form1.LangQuestionDelTag.Caption + ' ' + PageOtherTag.Caption + '?'), pchar(Form1.LangConfirmation.Caption), MB_YESNO + MB_ICONQUESTION);
    If (EditFilePathTag.Text = FileName) And (Mode = Stop) Then
    Begin
      Form1.StopMusic;
    End;
    If (EditFilePathTag.Text = FileName) And (Mode = Play) Then
    Begin
      Form1.StopMusic;
      Form1.PlayMusicSG;
    End;
    If buttonSelected = mrYes Then
    Begin
      OtherTag.RemoveEmptyTags;
      OtherTag.DeleteAllCoverArts; // Удаляем все обложки
      OtherTag.DeleteAllTags;
      RemoveTagsFromFile(EditFilePathTag.Text);
      OtherTag.SaveToFile(EditFilePathTag.Text);
      ImageOtherTag.Picture := Nil;
      Form4.ImageTagEditor.Picture := Nil;
    End;
    If buttonSelected = mrNo Then
      Exit;
  End;

  // Удаление APE тегов
  If PageAPETag.Showing Then
  Begin
    buttonSelected := Application.MessageBox(pchar(Form1.LangQuestionDelTag.Caption + ' ' + PageAPETag.Caption + '?'), pchar(Form1.LangConfirmation.Caption), MB_YESNO + MB_ICONQUESTION);
    If (EditFilePathTag.Text = FileName) And (Mode = Play) Then
    Begin
      Form1.StopMusic;
    End;
    If buttonSelected = mrYes Then
    Begin
      APEv2Tag.DeleteAllFrames;
      APEv2Tag.DeleteAllCoverArts; // Удаляем все обложки
      APEv2Tag.Clear;
      RemoveAPEv2FromFile(EditFilePathTag.Text);
      APEv2Tag.SaveToFile(EditFilePathTag.Text);
      addMedia;
      Application.ProcessMessages;
    End;
    ImageAPETag.Picture := Nil;
    Form4.ImageTagEditor.Picture := Nil;
    Edit2.Text := 'DEL';
    If buttonSelected = mrNo Then
      Exit;
  End;

  // Обновление интерфейса для всех файлов
  If (AnsiUpperCase(ExtractFileExt(EditFilePathTag.Text)) = AnsiUpperCase('.mp3')) Then
  Begin
    ClearDataID3v2;
    ClearDataAPE;
    getID3v1Tag;
    getTag3v2;
    GetAPE;
    addMedia;
    Application.ProcessMessages;
  End;

  If (AnsiUpperCase(ExtractFileExt(EditFilePathTag.Text)) <> AnsiUpperCase('.mp3')) Then
  Begin
    ClearDataAllTag;
    AllTag;
  End;

  If ModeLocal = Play Then
  Begin
    Form1.PlayMusicSG;
  End;
End;


// Удаление тегов
Procedure TForm7.DeleteTags;
Begin
  // Если трек запущен
  If EditFilePathTag.Text = FileName Then
  Begin
    DeleteAllTags;
  End;
  // Если трек не запущен
  If EditFilePathTag.Text <> FileName Then
  Begin
    DeleteAllTags;
  End;
End;

Procedure TForm7.ID3v1_URLKeyPress(Sender: TObject; Var Key: Char);
Begin
  Key := Chr(0);
End;

Procedure TForm7.ButtonCloseClick(Sender: TObject);
Begin
  Close;
End;

Procedure TForm7.ListCoverArtsAPE;
Var
  PictureStream: TMemoryStream;
  PictureFormat: TAPEv2PictureFormat;
  Description: String;
  ImageGIF: TGIFImage;
  ImageJPEG: TJPEGImage;
  ImagePNG: TPNGImage;
  Bitmap: TBitmap;
  BitmapHandle: hBitmap;
Begin
  LabelSizeAPETag.Caption := '';
  APEv2Tag.LoadFromFile(Form7.EditFilePathTag.Text);
  PictureStream := TMemoryStream.Create;
  Bitmap := TBitmap.Create;
  If APEv2Tag.GetCoverArtFromFrame(0, PictureStream, PictureFormat, Description) Then
  Begin
    Case PictureFormat Of
      pfJPEG:
        Begin
          ImageJPEG := TJPEGImage.Create;
          ImageJPEG.LoadFromStream(PictureStream);
          ImageAPETag.Picture.Assign(ImageJPEG);
          FreeAndNil(ImageJPEG);
          LabelSizeAPETag.Caption := 'JPG: ' + GetNormalSize(PictureStream.size) + ', ' + Format('%d x %d', [ImageAPETag.Picture.Width, ImageAPETag.Picture.Height]);
        End;
      pfGIF:
        Begin
          ImageGIF := TGIFImage.Create;
          ImageGIF.LoadFromStream(PictureStream);
          ImageAPETag.Picture.Assign(ImageGIF);
          FreeAndNil(ImageGIF);
          LabelSizeAPETag.Caption := 'GIF: ' + GetNormalSize(PictureStream.size) + ', ' + Format('%d x %d', [ImageAPETag.Picture.Width, ImageAPETag.Picture.Height]);
        End;
      pfPNG:
        Begin
          ImagePNG := TPNGImage.Create;
          ImagePNG.LoadFromStream(PictureStream);
          ImageAPETag.Picture.Assign(ImagePNG);
          FreeAndNil(ImagePNG);
          LabelSizeAPETag.Caption := 'PNG: ' + GetNormalSize(PictureStream.size) + ', ' + Format('%d x %d', [ImageAPETag.Picture.Width, ImageAPETag.Picture.Height]);
        End;
      pfBMP:
        Begin
          ImageAPETag.Picture.Bitmap.LoadFromStream(PictureStream);
          LabelSizeAPETag.Caption := 'BMP: ' + GetNormalSize(PictureStream.size) + ', ' + Format('%d x %d', [ImageAPETag.Picture.Width, ImageAPETag.Picture.Height]);
        End;
    End;
    If FreeImageLoadImageFromMemoryBitmapHandleWithRescale((PictureStream As TMemoryStream).Memory, PictureStream.size, BitmapHandle, ImageAPETag.Width, ImageAPETag.Height, FILTER_LANCZOS3, True, Handle) Then
    Begin
      Bitmap.Handle := BitmapHandle;
      { form1.ResizeBitmap(Bitmap, ImageAPETag.Width, ImageAPETag.Height,
        clBackground); }
      ImageAPETag.Picture.Bitmap := Bitmap;
    End;
  End;
  FreeAndNil(PictureStream);
  FreeAndNil(Bitmap);
End;

Function TForm7.LoadAPIC(Index: Integer): Boolean;
Var
  PictureType: Integer;
  PictureStream: TStream;
  JPEGPicture: TJPEGImage;
  PNGPicture: TPNGImage;
  GIFPicture: TGIFImage;
  Success: Boolean;
  MIMEType: String;
  Description: String;
  i: Integer;
  BitmapHandle: hBitmap;
  Bitmap: TBitmap;
Begin
  LabelSizeID3v2Tag.Caption := '';
  Result := False;

  PictureStream := TMemoryStream.Create;
  Bitmap := TBitmap.Create;
  Try
    If Index = 0 Then
    Begin
      Index := ID3v2Tag.FrameExists('APIC');
    End;
    If Index < 0 Then
    Begin
      exit;
    End;

    Success := ID3v2Tag.GetCoverPictureStream(Index, PictureStream, MIMEType, Description, PictureType);
    // * No APIC pitcure found, exit
    If (PictureStream.size = 0) Or (Not Success) Then
    Begin
      exit;
    End;

    // * Get first APIC index
    If Index = 0 Then
    Begin
      For i := 0 To ID3v2Tag.FrameCount - 1 Do
      Begin
        If IsSameFrameID(ID3v2Tag.Frames[i].ID, 'APIC') Then
        Begin
          CurrentAPICIndex := i;
          Break;
        End;
      End;
    End
    Else
    Begin
      CurrentAPICIndex := Index;
    End;

    PictureStream.Seek(0, soFromBeginning);
    MIMEType := LowerCase(MIMEType);
    // * If JPG
    If (MIMEType = 'image/jpeg') Or (MIMEType = 'image/jpg') Then
    Begin
      JPEGPicture := TJPEGImage.Create;
      JPEGPicture.LoadFromStream(PictureStream);
      JPEGPicture.DIBNeeded;
      Form7.ImageID3v2Tag.Picture.Assign(JPEGPicture);
      JPEGPicture.Free;
      LabelSizeID3v2Tag.Caption := 'JPG: ' + GetNormalSize(PictureStream.size) + ', ' + Format('%d x %d', [Form7.ImageID3v2Tag.Picture.Width, Form7.ImageID3v2Tag.Picture.Height]);
    End;
    // * If PNG
    If MIMEType = 'image/png' Then
    Begin
      PNGPicture := TPNGImage.Create;
      PNGPicture.LoadFromStream(PictureStream);
      Form7.ImageID3v2Tag.Picture.Assign(PNGPicture);
      PNGPicture.Free;
      LabelSizeID3v2Tag.Caption := 'PNG: ' + GetNormalSize(PictureStream.size) + ', ' + Format('%d x %d', [Form7.ImageID3v2Tag.Picture.Width, Form7.ImageID3v2Tag.Picture.Height]);
    End;
    // * If gif
    If MIMEType = 'image/gif' Then
    Begin
      GIFPicture := TGIFImage.Create;
      GIFPicture.LoadFromStream(PictureStream);
      Form7.ImageID3v2Tag.Picture.Assign(GIFPicture);
      GIFPicture.Free;
      LabelSizeID3v2Tag.Caption := 'GIF: ' + GetNormalSize(PictureStream.size) + ', ' + Format('%d x %d', [Form7.ImageID3v2Tag.Picture.Width, Form7.ImageID3v2Tag.Picture.Height]);
    End;
    // * If BMP
    If MIMEType = 'image/bmp' Then
    Begin
      // PictureStream.Seek(0, soFromBeginning);
      Form7.ImageID3v2Tag.Picture.Bitmap.LoadFromStream(PictureStream);
      LabelSizeID3v2Tag.Caption := 'BMP: ' + GetNormalSize(PictureStream.size) + ', ' + Format('%d x %d', [Form7.ImageID3v2Tag.Picture.Width, ImageID3v2Tag.Picture.Height]);
    End;
    PictureStream.Seek(0, soFromBeginning);
    If FreeImageLoadImageFromMemoryBitmapHandleWithRescale((PictureStream As TMemoryStream).Memory, PictureStream.size, BitmapHandle, ImageID3v2Tag.Width, ImageID3v2Tag.Height, FILTER_LANCZOS3, True, Handle) Then
    Begin
      Bitmap.Handle := BitmapHandle;
      ImageID3v2Tag.Picture.Bitmap := Bitmap;
    End;
    Result := True;
  Finally
    PictureStream.Free;
    FreeAndNil(Bitmap);
  End;
End;

Procedure TForm7.PopupMenuID3v2TagPopup(Sender: TObject);
Begin
  If ImageID3v2Tag.Picture.Graphic = Nil Then
  Begin
    CopyID3v2TagMenu.Enabled := False;
  End;
  If ImageID3v2Tag.Picture.Graphic <> Nil Then
  Begin
    CopyID3v2TagMenu.Enabled := True;
  End;
  If ImageID3v2Tag.Picture.Graphic = Nil Then
  Begin
    ResizeID3v2TagMenu.Enabled := False;
  End;
  If ImageID3v2Tag.Picture.Graphic <> Nil Then
  Begin
    ResizeID3v2TagMenu.Enabled := True;
  End;
  If ImageID3v2Tag.Picture.Graphic = Nil Then
  Begin
    DeleteID3v2TagMenu.Enabled := False;
  End;
  If ImageID3v2Tag.Picture.Graphic <> Nil Then
  Begin
    DeleteID3v2TagMenu.Enabled := True;
  End;
  If Clipboard.HasFormat(CF_PICTURE) = False Then
  Begin
    PasteID3v2TagMenu.Enabled := False;
  End;
  If Clipboard.HasFormat(CF_PICTURE) Then
  Begin
    PasteID3v2TagMenu.Enabled := True;
  End;
  If ImageID3v2Tag.Picture.Graphic = Nil Then
  Begin
    SaveAsID3v2TagMenu.Enabled := False;
  End;
  If ImageID3v2Tag.Picture.Graphic <> Nil Then
  Begin
    SaveAsID3v2TagMenu.Enabled := True;
  End;

End;

Function TForm7.PROPER(S: String): String;
Const
  Symbols = ' _;.,1234567890()[]';
Var
  X: Integer;
Begin
  Result := '';
  If Length(S) = 0 Then
    exit;
  S[1] := WideUpperCase(S[1])[1];
  For X := 1 To Length(S) Do
    If Pos(S[X], Symbols) <> 0 Then
    Begin
      If X <> Length(S) Then
        S[X + 1] := WideUpperCase(S[X + 1])[1];
    End
    Else
      S[X + 1] := AnsiLowerCase(S[X + 1])[1];
  Result := S;
End;

Procedure TForm7.ClearDataID3v2;
Begin
  // * Очистка элементов ID3v2
  EditTitleID3v2Tag.Text := '';
  EditArtistID3v2Tag.Text := '';
  EditAlbumID3v2Tag.Text := '';
  EditYearID3v2Tag.Text := '';
  EditTrackID3v2Tag.Text := '';
  ComboboxGenreID3v2Tag.Text := '';
  EditURLID3v2Tag.Text := '';
  MemoCommentID3v2Tag.Text := '';
  LabelSizeID3v2Tag.Caption := '';
  ImageID3v2Tag.Picture := Nil;
  CurrentAPICIndex := -1;
End;

Procedure TForm7.ClearDataAPE;
Begin
  // * Очистка элементов ID3v2
  EditTitleAPETag.Text := '';
  EditArtistAPETag.Text := '';
  EditAlbumAPETag.Text := '';
  EditYearAPETag.Text := '';
  EditTrackAPETag.Text := '';
  ComboboxGenreAPETag.Text := '';
  EditURLAPETag.Text := '';
  MemoCommentAPETag.Text := '';
  LabelSizeAPETag.Caption := '';
  ImageAPETag.Picture := Nil;
End;

Procedure TForm7.ClearDataAllTag;
Begin
  // * Очистка элементов Tags
  EditTitleOtherTag.Text := '';
  EditArtistOtherTag.Text := '';
  EditAlbumOtherTag.Text := '';
  EditYearOtherTag.Text := '';
  ComboboxGenreOtherTag.Text := '';
  EditURLOtherTag.Text := '';
  MemoCommentOtherTag.Text := '';
End;

Function ExtractOnlyFileName(Const FileName: String): String;
Begin
  Result := StringReplace(ExtractFileName(FileName), ExtractFileExt(FileName), '', []);
End;

Procedure TForm7.SaveID3v2TagPic;
Var
  PictureType: Integer;
  PictureStream: TStream;
  Success: Boolean;
  MIMEType: String;
  Description: String;
Begin
  If ImageID3v2Tag.Picture.Graphic = Nil Then
    exit;
  SavePictureDialog1.FileName := 'Image_' + DateToStr(Now) + FormatDateTime('_hh-mm-ss', Now);
  If SavePictureDialog1.Execute Then
  Begin
    PictureStream := TMemoryStream.Create;
    Try
      Success := ID3v2Tag.GetCoverPictureStream(ID3v2Tag.FrameExists('APIC'), PictureStream, MIMEType, Description, PictureType);
      If Not Success Then
      Begin
        exit;
      End;
      // * Set file format
      If (MIMEType = 'image/jpeg') Or (MIMEType = 'image/jpg') Then
      Begin
        SavePictureDialog1.FileName := SavePictureDialog1.FileName + '.jpg';
      End;
      If MIMEType = 'image/png' Then
      Begin
        SavePictureDialog1.FileName := SavePictureDialog1.FileName + '.png';
      End;
      If MIMEType = 'image/gif' Then
      Begin
        SavePictureDialog1.FileName := SavePictureDialog1.FileName + '.gif';
      End;
      If MIMEType = 'image/bmp' Then
      Begin
        SavePictureDialog1.FileName := SavePictureDialog1.FileName + '.bmp';
      End;

      // * Save the stream to file
      TMemoryStream(PictureStream).SaveToFile(SavePictureDialog1.FileName);
    Finally
      PictureStream.Free;
    End;
  End;
End;

Procedure TForm7.SaveAPETagPic;
Var
  PictureStream: TStream;
  Success: Boolean;
  Description: String;
  PictureFormat: TAPEv2PictureFormat;
Begin
  If ImageAPETag.Picture.Graphic = Nil Then
    exit;
  SavePictureDialog1.FileName := 'Image_' + DateToStr(Now) + FormatDateTime('_hh-mm-ss', Now);
  If SavePictureDialog1.Execute Then
  Begin
    PictureStream := TMemoryStream.Create;
    Try
      Success := APEv2Tag.GetCoverArtFromFrame(0, PictureStream, PictureFormat, Description);
      If Not Success Then
      Begin
        exit;
      End;

      Case PictureFormat Of
        pfJPEG:
          Begin
            SavePictureDialog1.FileName := SavePictureDialog1.FileName + '.jpg';
          End;
        pfGIF:
          Begin
            SavePictureDialog1.FileName := SavePictureDialog1.FileName + '.gif';
          End;
        pfPNG:
          Begin
            SavePictureDialog1.FileName := SavePictureDialog1.FileName + '.png';
          End;
        pfBMP:
          Begin
            SavePictureDialog1.FileName := SavePictureDialog1.FileName + '.bmp';
          End;
      End;
      // * Save the stream to file
      TMemoryStream(PictureStream).SaveToFile(SavePictureDialog1.FileName);
    Finally
      PictureStream.Free;
    End;
  End;
End;

Procedure TForm7.SaveAsID3v2TagMenuClick(Sender: TObject);
Begin
  SetWindowPos(Handle, HWND_NOTOPMOST, Left, Top, Width, Height, SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE);
  SaveID3v2TagPic;
  SetWindowPos(Handle, HWND_TOPMOST, Left, Top, Width, Height, SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE);
End;

Procedure TForm7.WMDropFiles(Var Msg: TWMDropFiles);
Const
  MAX_PATH_LENGTH = 260;
Var
  FileCount: Integer;
  FileName: Array[0..MAX_PATH_LENGTH] Of Char;
  I: Integer;
  FileExt, FullPath: String;
Begin
  Inherited;
  Try
    FileCount := DragQueryFile(Msg.Drop, $FFFFFFFF, Nil, 0);
    If FileCount > 0 Then
    Begin
      For I := 0 To FileCount - 1 Do
      Begin
        // Получаем имя файла
        DragQueryFile(Msg.Drop, I, @FileName, SizeOf(FileName));
        FullPath := String(FileName);

        If FileExists(FullPath) Then
        Begin
          // Получаем расширение файла
          FileExt := LowerCase(ExtractFileExt(FullPath));

          // Проверяем поддерживаемые форматы изображений
          If (FileExt = '.gif') Or (FileExt = '.bmp') Or (FileExt = '.jpg') Or (FileExt = '.jpeg') Or (FileExt = '.png') Then
          Begin
            // Загружаем изображение
            ImageID3v2Tag.Picture.LoadFromFile(FullPath);
            Application.ProcessMessages;
          End;
        End;
      End;
    End;
  Finally
    DragFinish(Msg.Drop);
  End;
End;

End.

