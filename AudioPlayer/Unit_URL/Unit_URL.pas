Unit Unit_URL;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, StdCtrls, ComCtrls,
  Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

Type
  TWmMoving = Record
    Msg: Cardinal;
    fwSide: Cardinal;
    lpRect: PRect;
    Result: Integer;
  End;

Type
  TForm6 = Class(TForm)
    TabControlBody: TTabControl;
    EditURLPath: TEdit;
    EditURLTitle: TEdit;
    TabControlButtons: TTabControl;
    ButtonEditURL: TButton;
    ButtonAddURL: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Procedure ButtonAddURLClick(Sender: TObject);
    Procedure ButtonEditURLClick(Sender: TObject);
    Procedure FormKeyPress(Sender: TObject; Var Key: Char);
    Procedure FormShow(Sender: TObject);

  Private
  Public
    { Public declarations }
  Protected
    Procedure CreateParams(Var Params: TCreateParams); Override;
  End;

Var
  Form6: TForm6;

Implementation

Uses
  Unit_Base;
{$R *.dfm}

Procedure TForm6.CreateParams(Var Params: TCreateParams);
Begin
  Inherited CreateParams(Params);
  Params.ExStyle := Params.ExStyle Or WS_EX_APPWINDOW;
  Params.WndParent := GetDesktopWindow;
End;

Procedure TForm6.ButtonAddURLClick(Sender: TObject);
Var
  lastRow: Integer;
Begin
  If EditURLPath.Text = '' Then
  Begin
    Application.Messagebox(Pchar(form1.LangPasteURL.Caption), Pchar(form1.LangError.Caption), mb_iconerror Or mb_ok);
    Exit;
  End;
  If EditURLTitle.Text = '' Then
  Begin
    Application.Messagebox(Pchar(form1.LangNoStationName.Caption), Pchar(form1.LangError.Caption), mb_iconerror Or mb_ok);
    Exit;
  End;
  form1.TabPlayList.Enabled := false;
  form1.StringGrid1.RowCount := form1.StringGrid1.RowCount + 1;
  lastRow := form1.StringGrid1.RowCount - 1;
  // form1.StringGrid1.Cells[0, lastRow] := Format('%.4u', [lastRow]);
  form1.StringGrid1.Cells[1, lastRow] := pwideChar(form1.ExtractOnlyFileName(form1.OpenDialogFile.files[lastRow]));
  form1.StringGrid1.Cells[2, lastRow] := '0:00';
  form1.StringGrid1.Cells[3, lastRow] := pwideChar(form1.OpenDialogFile.files[lastRow]);
  form1.DeleteEmptyRow;
  Application.ProcessMessages;
  form1.TabPlayList.Enabled := true;
  Form6.EditURLPath.Text := '';
  Form6.EditURLTitle.Text := '';
  Close;
  MediaThread := AddMediaThread.Create(false);
  MediaThread.FreeOnTerminate := true;
  MediaThread.Priority := tpNormal;
  form1.CopyStringGrid;
  form1.SaveList(Pchar(ExtractFilePath(Paramstr(0)) + 'Playlist\' + form1.ComboBox_Playlist.Text) + '.m3u');
End;

Procedure TForm6.ButtonEditURLClick(Sender: TObject);
Begin
  If EditURLPath.Text = '' Then
  Begin
    // messagebox(0, 'Выберите папку для установки иконки', 'Ошибка!', 0);
    Application.Messagebox(Pchar(form1.LangPasteURL.Caption), Pchar(form1.LangError.Caption), mb_iconerror Or mb_ok);
    Exit;
  End;
  If EditURLTitle.Text = '' Then
  Begin
    // messagebox(0, 'Выберите папку для установки иконки', 'Ошибка!', 0);
    Application.Messagebox(Pchar(form1.LangNoStationName.Caption), Pchar(form1.LangError.Caption), mb_iconerror Or mb_ok);
    Exit;
  End;
  form1.StringGrid1.Cells[3, form1.StringGrid1.Row] := pwideChar(Form6.EditURLPath.Text);
  form1.StringGrid1.Cells[1, form1.StringGrid1.Row] := pwideChar(Form6.EditURLTitle.Text);
  form1.StringGrid1.Cells[2, form1.StringGrid1.Row] := '0:-01';
  form1.DeleteEmptyRow;

  Application.ProcessMessages;
  Form6.EditURLPath.Text := '';
  Form6.EditURLTitle.Text := '';
  Form6.Close;
  MediaThread := AddMediaThread.Create(false);
  MediaThread.FreeOnTerminate := true;
  MediaThread.Priority := tpNormal;
  form1.CopyStringGrid;
  form1.SaveList(Pchar(ExtractFilePath(Paramstr(0)) + 'Playlist\' + form1.ComboBox_Playlist.Text) + '.m3u');
End;

Procedure TForm6.FormKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Key = #13 Then
  Begin
    If ButtonAddURL.Visible = true Then
    Begin
      ButtonAddURL.Click;
    End;
    If ButtonEditURL.Visible = true Then
    Begin
      ButtonEditURL.Click;
    End;
  End;
  If Key = #27 Then
  Begin
    Form6.Close;
  End;
End;

Procedure TForm6.FormShow(Sender: TObject);
Begin
  SetWindowPos(Handle, HWND_TOPMOST, Left, Top, Width, Height, SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE);
End;

End.

