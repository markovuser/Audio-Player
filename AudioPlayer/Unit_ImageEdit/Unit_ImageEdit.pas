Unit Unit_ImageEdit;

Interface

Uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.NumberBox, Vcl.ComCtrls, TagsLibrary,
  APEv2Library, ID3v2Library, JPEG, PNGImage, GIFImg, FreeImageLoader, FreeImage;

Type
  TForm4 = Class(TForm)
    TabControlButtons: TTabControl;
    ButtonEdit: TButton;
    ButtonSave: TButton;
    WidthImage: TNumberBox;
    HeightImage: TNumberBox;
    TabControlBody: TTabControl;
    ImageTagEditor: TImage;
    ButtonClose: TButton;
    Procedure ListCoverArts;
    Procedure ListCoverArtsAPE;
    Function LoadAPIC(Index: Integer): Boolean;
    Procedure FormShow(Sender: TObject);
    Procedure ButtonEditClick(Sender: TObject);
    Procedure ButtonCloseClick(Sender: TObject);
    Procedure ButtonSaveClick(Sender: TObject);
    Procedure FormClose(Sender: TObject; Var Action: TCloseAction);

  Private
    { Private declarations }

  Public
    { Public declarations }
  Protected
    Procedure CreateParams(Var Params: TCreateParams); Override;
  End;

Var
  Form4: TForm4;

Implementation

{$R *.dfm}

Uses
  Unit_Base, Unit_TagEditor;

Procedure TForm4.CreateParams(Var Params: TCreateParams);
Begin
  Inherited CreateParams(Params);
  Params.ExStyle := Params.ExStyle Or WS_EX_APPWINDOW;
  Params.WndParent := GetDesktopWindow;
End;

Procedure CropBitmap(InBitmap: TBitmap; X, Y, W, H: Integer);
Begin
  BitBlt(InBitmap.Canvas.Handle, 0, 0, W, H, InBitmap.Canvas.Handle, X, Y, SRCCOPY);
  InBitmap.Width := W;
  InBitmap.Height := H;
End;

Procedure TForm4.ButtonCloseClick(Sender: TObject);
Begin
  Form4.Close;
End;

Procedure TForm4.ButtonEditClick(Sender: TObject);
Var
  Bmp: TBitmap;
  sourceAspectRatio: int64;
  newWidth: int64;
Begin
  sourceAspectRatio := ImageTagEditor.Picture.Width - ImageTagEditor.Picture.Height;
  If (sourceAspectRatio = 0) Then
    exit;

  If (sourceAspectRatio > 0) Then
  Begin
    newWidth := Trunc((ImageTagEditor.Picture.Width - ImageTagEditor.Picture.Height) / 2);
    Bmp := ImageTagEditor.Picture.Bitmap;
    CropBitmap(Bmp, newWidth, 0, ImageTagEditor.Picture.Height, ImageTagEditor.Picture.Height);
    ImageTagEditor.Picture.Assign(Bmp);
  End;

  If (sourceAspectRatio < 0) Then
  Begin
    newWidth := Trunc((ImageTagEditor.Picture.Height - ImageTagEditor.Picture.Width) / 2);
    Bmp := ImageTagEditor.Picture.Bitmap;
    CropBitmap(Bmp, 0, newWidth, ImageTagEditor.Picture.Width, ImageTagEditor.Picture.Width);
    ImageTagEditor.Picture.Assign(Bmp);
  End;
  HeightImage.Value := ImageTagEditor.Picture.Height;
  WidthImage.Value := ImageTagEditor.Picture.Width;
End;

Procedure TForm4.ButtonSaveClick(Sender: TObject);
Begin
  Form4.Close;
  Form7.SaveTAGS;
End;

Procedure TForm4.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
  SetWindowPos(Form7.Handle, HWND_TOPMOST, Left, Top, Width, Height, SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE);
End;

Procedure TForm4.FormShow(Sender: TObject);
Begin
 // SetWindowPos(Handle, HWND_TOPMOST, Left, Top, Width, Height, SWP_NOACTIVATE Or SWP_NOMOVE Or SWP_NOSIZE);
  // ListCoverArts;
  ImageTagEditor.Picture := Nil;
  If Form7.PageID3v2Tag.Showing = true Then
  Begin
    Form4.LoadAPIC(0);
  End;
  If Form7.PageAPETag.Showing = true Then
  Begin
    ListCoverArtsAPE;
  End;

  HeightImage.Value := ImageTagEditor.Picture.Height;
  WidthImage.Value := ImageTagEditor.Picture.Width;
End;

Procedure TForm4.ListCoverArts;
Var
  i: Integer;
  ImageJPEG: TJPEGImage;
  ImagePNG: TPNGImage;
  ImageGIF: TGIFImage;
  Bitmap: TBitmap;
  BitmapHandle: hBitmap;
Begin
  If FileExists(Form7.EditFilePathTag.Text) = False Then
    exit;
  OtherTag2.LoadFromFile(Form7.EditFilePathTag.Text);
  Application.ProcessMessages;
  Form4.ImageTagEditor.Picture := Nil;
  Application.ProcessMessages;
  For i := 0 To OtherTag2.CoverArtCount - 1 Do
  Begin
    Application.ProcessMessages;
    Bitmap := TBitmap.Create;
    Try
      With OtherTag2.CoverArts[i] Do
      Begin
        stream.Seek(0, soBeginning);
        Case PictureFormat Of
          tpfJPEG:
            Begin
              ImageJPEG := TJPEGImage.Create;
              Application.ProcessMessages;
              Try
                ImageJPEG.LoadFromStream(stream);
                Bitmap.Assign(ImageJPEG);
                Application.ProcessMessages;
              Except
                FreeAndNil(ImageJPEG);
              End;
            End;
          tpfPNG:
            Begin
              ImagePNG := TPNGImage.Create;
              Try
                ImagePNG.LoadFromStream(stream);
                Bitmap.Assign(ImagePNG);
                Application.ProcessMessages;
              Except
                FreeAndNil(ImagePNG);
              End;
            End;
          tpfGIF:
            Begin
              ImageGIF := TGIFImage.Create;
              Try
                ImageGIF.LoadFromStream(stream);
                Bitmap.Assign(ImageGIF);
                Application.ProcessMessages;
              Except
                FreeAndNil(ImageGIF);
              End;
            End;
          tpfBMP:
            Begin
              Bitmap.LoadFromStream(stream);
              Application.ProcessMessages;
            End;
        End;
        stream.Seek(0, soFromBeginning);
        Application.ProcessMessages;

        If FreeImageLoadImageFromMemoryBitmapHandleWithRescale((stream As TMemoryStream).Memory, stream.size, BitmapHandle, Bitmap.Width, Bitmap.Height, FILTER_LANCZOS3, true, Handle) Then
        Begin
          Bitmap.Handle := BitmapHandle;
          Form4.ImageTagEditor.Picture.Bitmap := Bitmap;
          Application.ProcessMessages;
        End;

      End;
    Except
      FreeAndNil(Bitmap);
    End;
  End;

End;

Procedure TForm4.ListCoverArtsAPE;
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
  Try
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
            Form4.ImageTagEditor.Picture.Assign(ImageJPEG);
            FreeAndNil(ImageJPEG);
          End;
        pfGIF:
          Begin
            ImageGIF := TGIFImage.Create;
            ImageGIF.LoadFromStream(PictureStream);
            Form4.ImageTagEditor.Picture.Assign(ImageGIF);
            FreeAndNil(ImageGIF);
          End;
        pfPNG:
          Begin
            ImagePNG := TPNGImage.Create;
            ImagePNG.LoadFromStream(PictureStream);
            Form4.ImageTagEditor.Picture.Assign(ImagePNG);
            FreeAndNil(ImagePNG);
          End;
        pfBMP:
          Begin
            Form4.ImageTagEditor.Picture.Bitmap.LoadFromStream(PictureStream);
          End;
      End;
      If FreeImageLoadImageFromMemoryBitmapHandleWithRescale((PictureStream As TMemoryStream).Memory, PictureStream.size, BitmapHandle, Bitmap.Width, Bitmap.Height, FILTER_LANCZOS3, true, Handle) Then
      Begin
        Bitmap.Handle := BitmapHandle;
        Form4.ImageTagEditor.Picture.Bitmap := Bitmap;
      End;
    End;
  Except
    FreeAndNil(PictureStream);
    FreeAndNil(Bitmap);
  End;
End;

Function TForm4.LoadAPIC(Index: Integer): Boolean;
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

  Result := False;
  Try
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
      If (MIMEType = 'image/jpeg') Or (MIMEType = 'image/jpg') Then
      Begin
        JPEGPicture := TJPEGImage.Create;
        JPEGPicture.LoadFromStream(PictureStream);
        JPEGPicture.DIBNeeded;
        Form4.ImageTagEditor.Picture.Assign(JPEGPicture);
        JPEGPicture.Free;
      End;
      If MIMEType = 'image/png' Then
      Begin
        PNGPicture := TPNGImage.Create;
        PNGPicture.LoadFromStream(PictureStream);
        Form4.ImageTagEditor.Picture.Assign(PNGPicture);
        PNGPicture.Free;
      End;
      If MIMEType = 'image/gif' Then
      Begin
        GIFPicture := TGIFImage.Create;
        GIFPicture.LoadFromStream(PictureStream);
        Form4.ImageTagEditor.Picture.Assign(GIFPicture);
        GIFPicture.Free;
      End;
      If MIMEType = 'image/bmp' Then
      Begin
        Form4.ImageTagEditor.Picture.Bitmap.LoadFromStream(PictureStream);
      End;
      PictureStream.Seek(0, soFromBeginning);
      If FreeImageLoadImageFromMemoryBitmapHandleWithRescale((PictureStream As TMemoryStream).Memory, PictureStream.size, BitmapHandle, Bitmap.Width, Bitmap.Height, FILTER_LANCZOS3, true, Handle) Then
      Begin
        Bitmap.Handle := BitmapHandle;
        Form4.ImageTagEditor.Picture.Bitmap := Bitmap;
      End;
      Result := true;
    Finally
      PictureStream.Free;
      FreeAndNil(Bitmap);
    End;
  Except
  End;
End;

End.

