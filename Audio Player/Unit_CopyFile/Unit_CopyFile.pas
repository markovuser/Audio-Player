Unit Unit_CopyFile;

Interface

Uses
  Winapi.Windows, Winapi.Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, IniFiles,
  Dialogs, StdCtrls, Vcl.ComCtrls, ShlObj, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Samples.Gauges,
  FileCtrl, SHFolder, ActiveX,FileInfoUtils;

Type
  TWmMoving = Record
    Msg: Cardinal;
    fwSide: Cardinal;
    lpRect: PRect;
    Result: Integer;
  End;

Type
  TCopyFile = Class(TThread)
  Protected
    Procedure Execute; Override;
  End;

Type
  TForm5 = Class(TForm)
    TabControlButtons: TTabControl;
    ButtonCopyFile: TButton;
    TabControlBody: TTabControl;
    CheckBoxClearPathCopy: TCheckBox;
    EditFilePath: TEdit;
    EditFolderPath: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    CheckBoxCloseFormCopy: TCheckBox;
    TabControl4: TTabControl;
    LabelSizeCopy: TLabel;
    LabelProcessCopy: TLabel;
    LabelSizeCopy1: TLabel;
    LabelProcessCopy1: TLabel;
    ProgressBarCopy: TProgressBar;
    Procedure ButtonCopyFileClick(Sender: TObject);
    Procedure FormShow(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure FormKeyPress(Sender: TObject; Var Key: Char);
    Procedure EditFolderPathClick(Sender: TObject);
    Procedure EditFolderPathKeyPress(Sender: TObject; Var Key: Char);

  Private
    { Private declarations }
    Canceled: Boolean;

  Public
    { Public declarations }
  Protected
    Procedure CreateParams(Var Params: TCreateParams); Override;
  End;

Var
  Form5: TForm5;

Implementation

Uses
  Unit_Base, Unit_Settings;

{$R *.dfm}

Procedure TForm5.CreateParams(Var Params: TCreateParams);
Begin
  Inherited CreateParams(Params);
  Params.ExStyle := Params.ExStyle Or WS_EX_APPWINDOW;
  Params.WndParent := GetDesktopWindow;
End;

Procedure TCopyFile.Execute;
Var
  SrcFile, DestFile: File;
  BytesRead, BytesWritten, TotalRead: Integer;
  // Buffer: array [1 .. 65536] of byte;
  Buffer: Array[0..4096] Of Char;
  FSize, Msg: Integer;
Begin
  Form5.Canceled := False;
  If FileExists(Form5.EditFilePath.Text + ExtractFileName(Form5.EditFilePath.Text)) Then
  Begin
    Msg := messagebox(application.MainForm.Handle, PChar(Form1.LangReplaceFile.Caption + ' ' + ExtractFileName(Form5.EditFilePath.Text) + '?'), PChar(Form1.LangAttention.Caption), mb_iconquestion Or mb_yesno);
    If Msg = idyes Then
    Begin
      SetFileAttributes(PChar(Form5.EditFolderPath.Text + ExtractFileName(Form5.EditFilePath.Text)), FILE_ATTRIBUTE_NORMAL);
      DeleteFile(Form5.EditFolderPath.Text + ExtractFileName(Form5.EditFilePath.Text));
      AssignFile(SrcFile, Form5.EditFilePath.Text);
      AssignFile(DestFile, Form5.EditFolderPath.Text + ExtractFileName(Form5.EditFilePath.Text));
      Reset(SrcFile, 1);
      Try
        Rewrite(DestFile, 1);
        Try
          Try
            TotalRead := 0;
            FSize := FileSize(SrcFile);
            Form5.ProgressBarCopy.Position := 0;
            Form5.ProgressBarCopy.Max := FSize;
            Form5.LabelSizeCopy1.Caption := GetNormalSize(FSize);
            Repeat
              BlockRead(SrcFile, Buffer, SizeOf(Buffer), BytesRead);
              If BytesRead > 0 Then
              Begin
                BlockWrite(DestFile, Buffer, BytesRead, BytesWritten);
                If BytesRead <> BytesWritten Then
                  Raise Exception.Create(Form1.LangErrorWritingFile.Caption)
                Else
                Begin
                  TotalRead := TotalRead + BytesRead;
                  Form5.LabelProcessCopy1.Caption := GetNormalSize(TotalRead);
                  Form5.ProgressBarCopy.Position := Form5.ProgressBarCopy.Position + BytesRead;
                End;
              End
            Until BytesRead = 0;
          Except
            Erase(DestFile);
            Raise;
          End;
        Finally
          CloseFile(DestFile);
        End;
      Finally
        CloseFile(SrcFile);
      End;
    End;
    Form5.ButtonCopyFile.Enabled := true;
    If Form5.ProgressBarCopy.Position = Form5.ProgressBarCopy.Max Then
    Begin
      If Form5.CheckBoxCloseFormCopy.Checked = true Then
      Begin
        Form5.Close;
      End;
    End;
  End;

    /// /
  If FileExists(Form5.EditFolderPath.Text + ExtractFileName(Form5.EditFilePath.Text)) = False Then
  Begin
    AssignFile(SrcFile, Form5.EditFilePath.Text);
    AssignFile(DestFile, Form5.EditFolderPath.Text + ExtractFileName(Form5.EditFilePath.Text));
    Reset(SrcFile, 1);
    Try
      Rewrite(DestFile, 1);
      Try
        Try
          TotalRead := 0;
          FSize := FileSize(SrcFile);
          Form5.ProgressBarCopy.Position := 0;
          Form5.ProgressBarCopy.Max := FSize;
          Form5.LabelSizeCopy1.Caption := GetNormalSize(FSize);
          Repeat
            BlockRead(SrcFile, Buffer, SizeOf(Buffer), BytesRead);
            If BytesRead > 0 Then
            Begin
              BlockWrite(DestFile, Buffer, BytesRead, BytesWritten);
              If BytesRead <> BytesWritten Then
                Raise Exception.Create(Form1.LangErrorWritingFile.Caption)
              Else
              Begin
                TotalRead := TotalRead + BytesRead;
                Form5.LabelProcessCopy1.Caption := GetNormalSize(TotalRead);
                Form5.ProgressBarCopy.Position := Form5.ProgressBarCopy.Position + BytesRead;
              End;
            End
          Until BytesRead = 0;
        Except
          Erase(DestFile);
          Raise;
        End;
      Finally
        CloseFile(DestFile);
      End;
    Finally
      CloseFile(SrcFile);
    End;
    Form5.ButtonCopyFile.Enabled := true;
    If Form5.ProgressBarCopy.Position = Form5.ProgressBarCopy.Max Then
    Begin
      If Form5.CheckBoxCloseFormCopy.Checked = true Then
      Begin
        Form5.Close;
      End;
    End;
  End;
End;

Function BrowseCallbackProc(hwnd: hwnd; uMsg: UINT; lParam: lParam; lpData: lParam): Integer; Stdcall;
Begin
  If (uMsg = BFFM_INITIALIZED) Then
    SendMessage(hwnd, BFFM_SETSELECTION, 1, lpData);
  BrowseCallbackProc := 0;
End;

Function GetSpecialFolderPath(folder: Integer): String;
Const
  SHGFP_TYPE_CURRENT = 0;
Var
  Path: Array[0..MAX_PATH] Of Char;
Begin
  If SUCCEEDED(SHGetFolderPath(0, folder, 0, SHGFP_TYPE_CURRENT, @Path[0])) Then
    Result := Path
  Else
    Result := '';
End;

Procedure TForm5.EditFolderPathClick(Sender: TObject);
Var
  put: String;
Begin
  EditFolderPath.Text := '';
  SelectDirectory(Form1.LangSelectFolder.Caption, '', put, [sdNewFolder, sdNewUI, sdShowEdit, sdValidateDir, sdShowShares], Self);
  If put = '' Then
    Exit;
  application.ProcessMessages;
  If put <> '' Then
  Begin
    EditFolderPath.Text := IncludeTrailingPathDelimiter(put);
    application.ProcessMessages;
    If (EditFilePath.Text = '') Or (EditFolderPath.Text = '') Then
    Begin
      ButtonCopyFile.Enabled := False;
      Self.ActiveControl := Nil;
    End;
    If (EditFilePath.Text <> '') And (EditFolderPath.Text <> '') Then
    Begin
      ButtonCopyFile.Enabled := true;
      Self.ActiveControl := Nil;
    End;
  End;
End;

Procedure TForm5.EditFolderPathKeyPress(Sender: TObject; Var Key: Char);
Begin
  Key := Chr(0);
End;

Procedure TForm5.ButtonCopyFileClick(Sender: TObject);
Begin
  If (EditFolderPath.Text = '') Or (EditFilePath.Text = '') Then
    Exit;
  ButtonCopyFile.Enabled := False;
  TCopyFile.Create(False);
End;

Procedure TForm5.FormShow(Sender: TObject);
Begin
  SetWindowPos(Handle, HWND_TOPMOST, Left, Top, Width, Height, SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE);
  EditFilePath.Text := Form1.StringGrid1.Cells[3, Form1.StringGrid1.Row];
  If (EditFilePath.Text = '') Or (EditFolderPath.Text = '') Then
  Begin
    ButtonCopyFile.Enabled := False;
  End;
  If (EditFilePath.Text <> '') And (EditFolderPath.Text <> '') Then
  Begin
    ButtonCopyFile.Enabled := true;
  End;
  ProgressBarCopy.Position := 0;
  LabelSizeCopy1.Caption := GetNormalSize(GetMyFileSize(Form5.EditFilePath.Text));
  LabelProcessCopy1.Caption := '0';
End;

Procedure TForm5.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  Canceled := true;
  ButtonCopyFile.Enabled := true;
  EditFilePath.Clear;
  If CheckBoxClearPathCopy.Checked Then
  Begin
    EditFolderPath.Clear;
  End;
  application.ProcessMessages;
  Form1.Focused;
  Form1.TrimWorkingSet;
  application.ProcessMessages;
End;

Procedure TForm5.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key = #13 Then
  Begin
    ButtonCopyFile.Click;
  End;
  If Key = #27 Then
  Begin
    Close;
  End;
End;

End.

