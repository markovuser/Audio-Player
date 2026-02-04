Unit Unit_TrayNotify;

Interface

Uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

Type
  TForm3 = Class(TForm)
    Timer1: TTimer;
    TabControlImageTray: TTabControl;
    ImageTAGTray: TImage;
    TabControlInfoTray: TTabControl;
    TabControlInfoTray1: TTabControl;
    LabelYearTray: TLabel;
    LabelTitleTray: TLabel;
    LabelArtistTray: TLabel;
    TabControlInfoTray2: TTabControl;
    LabelHzTray: TLabel;
    LabelkbpsTray: TLabel;
    LabelSizeTray: TLabel;
    LabelStereoTray: TLabel;
    Timer2: TTimer;
    ImageSubstrate: TImage;
    Procedure FormShow(Sender: TObject);
    Procedure Timer1Timer(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    Procedure Timer2Timer(Sender: TObject);
  Protected
  Private
  Public
    Procedure CMMouseEnter(Var message: TMessage); Message CM_MOUSEENTER;
    Procedure CMMouseLeave(Var message: TMessage); Message CM_MOUSELEAVE;

  End;

Var
  Form3: TForm3;

Implementation

{$R *.dfm}

Uses
  Unit_Base, Unit_Settings, FreeImage, FreeImageLoader;


Procedure TForm3.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  Try
    ParentWindow := GetDesktopWindow;
    LabelArtistTray.Caption := '';
    LabelTitleTray.Caption := '';
    LabelYearTray.Caption := '';
    LabelStereoTray.Caption := '';
    LabelSizeTray.Caption := '';
    LabelHzTray.Caption := '';
    LabelkbpsTray.Caption := '';
    Timer1.Enabled := false;
  Except
  End;
End;

Procedure TForm3.FormShow(Sender: TObject);
Begin
  Try
    SetWindowPos(Handle, HWND_TOPMOST, left, top, Width, Height, SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE);
    Timer1.Enabled := true;
    LabelArtistTray.Caption := '';
    LabelTitleTray.Caption := '';
    LabelYearTray.Caption := '';
    LabelStereoTray.Caption := '';
    LabelSizeTray.Caption := '';
    LabelHzTray.Caption := '';
    LabelkbpsTray.Caption := '';
    left := Screen.Width - Width - 10;
    top := Screen.Height - Height - 50;
    application.ProcessMessages;
    LabelArtistTray.Caption := form1.Label_Artist.Caption;
    application.ProcessMessages;
    LabelTitleTray.Caption := form1.Label_Title.Caption;
    application.ProcessMessages;
    LabelYearTray.Caption := form1.Label_Year.Caption;
    application.ProcessMessages;
    LabelStereoTray.Caption := form1.Label_Stereo.Caption;
    application.ProcessMessages;
    LabelSizeTray.Caption := form1.SizeCaption.Caption;
    application.ProcessMessages;
    LabelHzTray.Caption := form1.HzCaption.Caption;
    application.ProcessMessages;
    LabelkbpsTray.Caption := form1.kbpsCaption.Caption;
    application.ProcessMessages;
    SetWindowPos(Handle, HWND_TOP, 0, 0, 0, 0,
                 SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE);
  Except
  End;
End;

Procedure TForm3.Timer1Timer(Sender: TObject);
Begin
  Form3.Close;
End;

Procedure TForm3.Timer2Timer(Sender: TObject);
Begin
  Try
    LabelArtistTray.Caption := form1.Label_Artist.Caption;
    application.ProcessMessages;
    LabelTitleTray.Caption := form1.Label_Title.Caption;
    application.ProcessMessages;
    LabelYearTray.Caption := form1.Label_Year.Caption;
    application.ProcessMessages;
    LabelStereoTray.Caption := form1.Label_Stereo.Caption;
    application.ProcessMessages;
    LabelSizeTray.Caption := form1.SizeCaption.Caption;
    application.ProcessMessages;
    LabelHzTray.Caption := form1.HzCaption.Caption;
    application.ProcessMessages;
    LabelkbpsTray.Caption := form1.kbpsCaption.Caption;
    application.ProcessMessages;
  Except
  End;
End;

Procedure TForm3.CMMouseEnter(Var message: TMessage);
Begin
  // Form3.Caption:='Мышь на форме';
  Try
    Timer1.Enabled := false;
    Form3.AlphaBlendValue := 255;
  Except
  End;
End;

Procedure TForm3.CMMouseLeave(Var message: TMessage);
Begin
  Try
    // Form3.Caption:='Мышь вне формы';
    Timer1.Enabled := true;
    Form3.AlphaBlendValue := 210;
  Except
  End;
End;

End.

