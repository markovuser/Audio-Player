Unit Unit_PlayListManager;

Interface

Uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus,
  Winapi.ShellAPI, Winapi.CommCtrl, Vcl.StdCtrls, Vcl.ExtCtrls, System.UITypes,
  FileInfoUtils;

Type
  TForm9 = Class(TForm)
    ListViewPLManager: TListView;
    PopupMenuPLManager: TPopupMenu;
    MenuPLUpdate: TMenuItem;
    N11: TMenuItem;
    MenuPLSave: TMenuItem;
    MenuItem2: TMenuItem;
    MenuPLDelAll: TMenuItem;
    MenuPLDel: TMenuItem;
    TabControlButtons: TTabControl;
    Button1: TButton;
    Procedure MenuPLUpdateClick(Sender: TObject);
    Function FindFileCopy(Dir: String): boolean;
    Procedure MenuPLDelClick(Sender: TObject);
    Procedure DeleteFileSelected;
    Procedure DeleteAll;
    Procedure MenuPLDelAllClick(Sender: TObject);
    Procedure MenuPLSaveClick(Sender: TObject);
    Procedure FormShow(Sender: TObject);
    Procedure Button1Click(Sender: TObject);
  Private
    { Private declarations }
  Public
    { Public declarations }
  Protected
    Procedure CreateParams(Var Params: TCreateParams); Override;
  End;

Var
  Form9: TForm9;

Implementation

{$R *.dfm}

Uses
  Unit_Base;

Procedure TForm9.CreateParams(Var Params: TCreateParams);
Begin
  Inherited CreateParams(Params);
  Params.ExStyle := Params.ExStyle Or WS_EX_APPWINDOW;
  Params.WndParent := GetDesktopWindow;
End;

Function GetFileDateTime(Const FileName: String): TDateTime;
Var
  FileDateTime: TDateTime;
Begin
  Result := 0;
  Try
    If FileExists(FileName) Then
    Begin
      If FileAge(FileName, FileDateTime) Then
        Result := FileDateTime
      Else
        Result := 0;
    End;
  Except
    Result := 0;
  End;
End;

Function TForm9.FindFileCopy(Dir: String): boolean;
Var
  SR: TSearchRec;
  FindRes: Integer;
  ShInfo: TSHFileInfo;
  ListItem: TListItem;
  i: Integer;
  puti: String;
  bSuccess: Boolean; // Добавляем переменную для отслеживания успеха
Begin
  bSuccess := True; // Предполагаем успех по умолчанию

  Try
    ListViewPLManager.Clear;
    application.ProcessMessages;
    FindRes := FindFirst(Dir + '*.*', faAnyFile, SR);

    While FindRes = 0 Do
    Begin
      If ((SR.Attr And faDirectory) = faDirectory) And ((SR.Name = '.') Or (SR.Name = '..')) Then
      Begin
        FindRes := FindNext(SR);
        continue;
      End;

      If ((SR.Attr And faDirectory) = faDirectory) Then
      Begin
        // Рекурсивный вызов и проверка его результата
        If Not FindFileCopy(Dir + SR.Name + '\') Then
          bSuccess := False;

        FindRes := FindNext(SR);
        continue;
      End;

      ListItem := ListViewPLManager.Items.Add;
      puti := Dir + SR.Name;
      SHGetFileInfo(pchar(puti), 0, ShInfo, SizeOf(ShInfo), SHGFI_TYPENAME Or SHGFI_SYSICONINDEX);

      With ListItem Do
      Begin
        application.ProcessMessages;
        ListItem.MakeVisible(true);
        ImageIndex := ShInfo.iIcon;
        Caption := SR.Name;
        SubItems.Add(GetNormalSize(GetMyFileSize(pchar(puti))));
        SubItems.Add(FormatDateTime('dd.mm.yy hh:mm', GetFileDateTime(puti)));
        SubItems.Add(Dir + SR.Name);
      End;

      FindRes := FindNext(SR);
    End;

    FindClose(SR);

    For i := 0 To ListViewPLManager.Columns.Count - 1 Do
    Begin
      ListView_SetColumnWidth(ListViewPLManager.Handle, i, LVSCW_AUTOSIZE_USEHEADER);
    End;

  Except
    bSuccess := False; // Если было исключение, возвращаем False
  End;

  Result := bSuccess; // Явное возвращение значения
End;

Procedure TForm9.FormShow(Sender: TObject);
Begin
  Try
    FindFileCopy(Form1.PortablePathM3U);
  Except
  End;
End;

Function DeleteFileWithUndo(sFileName: String): boolean;
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

Procedure TForm9.DeleteFileSelected;
Begin
  If (ListViewPLManager.Selected <> Nil) And (ListViewPLManager.Selected.Caption <> '') And (ListViewPLManager.Items.Count > 1) Then
  Begin
    DeleteFileWithUndo(ListViewPLManager.Selected.SubItems.Strings[2]);
    // DeleteFile(ListViewPLManager.Selected.SubItems.Strings[2]);
    application.ProcessMessages;
  End;
End;

Procedure TForm9.Button1Click(Sender: TObject);
Begin
  Close;
End;

Procedure TForm9.DeleteAll;
Begin
  Try
    While ListViewPLManager.Items.Count > 0 Do
    Begin
      { if ListViewPLManager.Items[0].Checked = true then
        begin }
      ListViewPLManager.Items.Item[0].MakeVisible(true);
      // DeleteFile(ListViewPLManager.Items[0].SubItems.Strings[2]);
      DeleteFileWithUndo(ListViewPLManager.Items[0].SubItems.Strings[2]);
      ListViewPLManager.Items[0].Delete;
      application.ProcessMessages;
      // end;
    End;
  Except
  End;
End;

Procedure TForm9.MenuPLDelAllClick(Sender: TObject);
Begin
  Msg := Application.MessageBox(pchar(Form1.LangQuestionDelAllPL.Caption + ' ?'), pchar(Form1.LangAttention.Caption), MB_ICONQUESTION Or mb_yesno);
  If Msg = idyes Then
  Begin
    Try
      DeleteAll;
      ForceDirectories(Form1.PortablePathM3U);
      If Not FileExists(IncludeTrailingPathDelimiter(Form1.PortablePathM3U) + 'default.m3u') Then
        Form1.MenuAddFolderPlayList;
      FindFileCopy(Form1.PortablePathM3U);
      Form1.UpdatePlayList;
      Form1.ComboBox_Playlist.ItemIndex := 0;
      If FileExists(Form1.PortablePathM3U + Form1.ComboBox_Playlist.Text + '.m3u') Then
      Begin
        Form1.M3UToStringGridAdvanced(Form1.PortablePathM3U + Form1.ComboBox_Playlist.Text + '.m3u', Form1.StringGrid1);
      End;
    Except
    End;
  End;
End;

Procedure TForm9.MenuPLDelClick(Sender: TObject);
Begin
  If ListViewPLManager.ItemIndex = -1 Then
    Exit;

  // Используем MessageDlg вместо MessageBox
  Msg := Application.MessageBox(Pchar(Form1.LangQuestionDelPL.Caption + ' ' + ListViewPLManager.Selected.Caption + '?'), pchar(Form1.LangAttention.Caption), MB_ICONQUESTION Or mb_yesno);
  Begin
    Try
      If (ListViewPLManager.Selected <> Nil) And (ListViewPLManager.Selected.Caption <> '') Then
      Begin
        DeleteFileWithUndo(ListViewPLManager.Selected.SubItems.Strings[2]);
        ForceDirectories(Form1.PortablePathM3U);
        If Not FileExists(IncludeTrailingPathDelimiter(Form1.PortablePathM3U) + 'default.m3u') Then
          Form1.MenuAddFolderPlayList;
        FindFileCopy(Form1.PortablePathM3U);
        Form1.UpdatePlayList;
        Form1.ComboBox_Playlist.ItemIndex := 0;
        If FileExists(Form1.PortablePathM3U + Form1.ComboBox_Playlist.Text + '.m3u') Then
        Begin
          Form1.M3UToStringGridAdvanced(Form1.PortablePathM3U + Form1.ComboBox_Playlist.Text + '.m3u', Form1.StringGrid1);
        End;
      End;
    Except
    End;
  End;
End;

Procedure TForm9.MenuPLUpdateClick(Sender: TObject);
Begin
  Try
    FindFileCopy(Form1.PortablePathM3U);
  Except
  End;
End;

Procedure TForm9.MenuPLSaveClick(Sender: TObject);
Begin
  Try
    Form1.SaveList(ListViewPLManager.Selected.SubItems.Strings[2]);
    FindFileCopy(Form1.PortablePathM3U);
  Except
  End;
End;

End.

