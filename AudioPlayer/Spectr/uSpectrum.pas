unit uSpectrum;

interface

uses
  Windows, Graphics, SysUtils, Classes, Forms;

type
  DWORD = Cardinal;

type
  // TWaveData = array [0 .. 2048] of DWORD;
  // TWaveData = array [0 .. 1024] of DWORD;
  TFFTData = array [0 .. 512] of Single;

type
  TSpectrum = class(TObject)
  private
    VisBuff: TBitmap;
    BackBmp: TBitmap;
    BkColor: TColor;
    SpecHeight: Integer;
    PenColor: TColor;
    PenMask: TColor;
    PeakColor: TColor;
    FPenSolid: Boolean;
    DrawType: Integer;
    DrawRes: Integer;
    FrmClear: Boolean;
    UseBkg: Boolean;
    PeakFall: Integer;
    LineFall: Integer;
    ColWidth: Integer;
    ShowPeak: Boolean;
    ShowBlock: Boolean;
    FFTPeacks: array [0 .. 128] of Integer;
    FFTFallOff: array [0 .. 128] of Integer;
  public
    constructor Create(Width, Height: Integer);
    procedure Draw(HWND: THandle; FFTData: TFFTData; X, Y: Integer;
      PauseStop: Boolean = FALSE);
    procedure SetBackground(Active: Boolean; BkCanvas: TGraphic);
    property BackColor: TColor read BkColor write BkColor;
    property Height: Integer read SpecHeight write SpecHeight;
    property Width: Integer read ColWidth write ColWidth;
    property Pen: TColor read PenColor write PenColor;
    property Mask: TColor read PenMask write PenMask;
    property Peak: TColor read PeakColor write PeakColor;
    property PenSolid: Boolean read FPenSolid write FPenSolid;
    property Mode: Integer read DrawType write DrawType;
    property Res: Integer read DrawRes write DrawRes;
    property FrameClear: Boolean read FrmClear write FrmClear;
    property PeakFallOff: Integer read PeakFall write PeakFall;
    property LineFallOff: Integer read LineFall write LineFall;
    property DrawPeak: Boolean read ShowPeak write ShowPeak;
    property DrawBlock: Boolean read ShowBlock write ShowBlock;
  end;

var
  Spectrum: TSpectrum;

implementation

uses Unit_Base;

constructor TSpectrum.Create(Width, Height: Integer);
begin
  VisBuff := TBitmap.Create;
  BackBmp := TBitmap.Create;
  VisBuff.Width := Width;
  VisBuff.Height := Height;
  BackBmp.Width := Width;
  BackBmp.Height := Height;
  SpecHeight := 60;
  BkColor := clBtnFace;
  PenColor := clBlack;
  PeakColor := clRed;
  PeakFall := 1;
  LineFall := 2;
  ColWidth := 3;
  DrawType := 0;
  FrmClear := True;
  UseBkg := FALSE;
  ShowPeak := True;
  ShowBlock := True;
end;

procedure TSpectrum.SetBackground(Active: Boolean; BkCanvas: TGraphic);
begin
  UseBkg := Active;
  BackBmp.Canvas.Draw(0, 0, BkCanvas);
end;

procedure TSpectrum.Draw(HWND: THandle; FFTData: TFFTData; X, Y: Integer;
  PauseStop: Boolean = FALSE);
var
  i, YPos, dy: LongInt;
  YVal: Single;
  e: Integer;
begin
  try
    // 1. Очищаем буфер только если это необходимо
    if FrmClear then
    begin
      VisBuff.Canvas.Brush.Color := BkColor;
      VisBuff.Canvas.FillRect(Rect(0, 0, VisBuff.Width, VisBuff.Height));
    end;

    // 2. НИКОГДА не обнуляем FFTData при паузе/стопе!
    // Это убивает плавное затухание
    // УБРАТЬ этот блок:
    // if PauseStop then
    // begin
    //   for e := 0 to 127 do
    //     FFTData[e] := 0;
    // end;

    // 3. Вместо обнуления данных - обрабатываем затухание
    if PauseStop then
    begin
      // Затухаем существующие пики, но не обнуляем данные
      for e := 0 to 127 do
      begin
        if FFTFallOff[e] > 0 then
          FFTFallOff[e] := FFTFallOff[e] - LineFall;

        if FFTPeacks[e] > 0 then
          FFTPeacks[e] := FFTPeacks[e] - PeakFall;

        if FFTFallOff[e] < 0 then FFTFallOff[e] := 0;
        if FFTPeacks[e] < 0 then FFTPeacks[e] := 0;
      end;
    end
    else
    begin
      // Нормальная обработка при воспроизведении
      for i := 0 to 127 do
      begin
        YVal := Abs(FFTData[i]);
        YPos := Trunc(YVal * 500);

        if YPos > VisBuff.Height then
          YPos := VisBuff.Height;

        if YPos >= FFTPeacks[i] then
          FFTPeacks[i] := YPos
        else
          FFTPeacks[i] := FFTPeacks[i] - PeakFall;

        if YPos >= FFTFallOff[i] then
          FFTFallOff[i] := YPos
        else
          FFTFallOff[i] := FFTFallOff[i] - LineFall;

        // Ограничиваем значения
        if FFTPeacks[i] < 0 then FFTPeacks[i] := 0;
        if FFTFallOff[i] < 0 then FFTFallOff[i] := 0;
      end;
    end;

    // 4. Отрисовка (работает для обоих случаев)
    for i := 0 to 127 do
    begin
      // рисование пика
      if ShowPeak and (FFTPeacks[i] > 0) then
      begin
        VisBuff.Canvas.Pen.Color := PeakColor;
        VisBuff.Canvas.MoveTo(X + i * (ColWidth + 1),
                              Y + VisBuff.Height - FFTPeacks[i]);
        VisBuff.Canvas.LineTo(X + i * (ColWidth + 1) + ColWidth,
                              Y + VisBuff.Height - FFTPeacks[i]);
      end;

      // рисование столбика
      if FFTFallOff[i] > 0 then
      begin
        VisBuff.Canvas.Pen.Color := PenColor;
        VisBuff.Canvas.Brush.Color := PenColor;
        VisBuff.Canvas.Rectangle(
          X + i * (ColWidth + 1),
          Y + VisBuff.Height - FFTFallOff[i],
          X + i * (ColWidth + 1) + ColWidth,
          Y + VisBuff.Height
        );
      end;
    end;

    // 5. Эффект блоков (если нужен)
    if ShowBlock then
    begin
      VisBuff.Canvas.Pen.Color := BkColor;
      for dy := 0 to VisBuff.Height do
      begin
        if (dy mod ColWidth = 0) then
        begin
          VisBuff.Canvas.MoveTo(0, dy);
          VisBuff.Canvas.LineTo(VisBuff.Width, dy);
        end;
      end;
    end;

    // 6. Копируем на экран
    BitBlt(HWND, 0, 0, VisBuff.Width, VisBuff.Height,
           VisBuff.Canvas.Handle, 0, 0, SRCCOPY);

  except
    // Лучше добавить логирование ошибок
  end;
end;

end.
