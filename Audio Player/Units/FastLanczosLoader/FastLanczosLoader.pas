unit FastLanczosLoader;


interface

uses
  Windows, Classes, Graphics, ExtCtrls, Math;

// Ваша оригинальная функция
function LoadImageToTImage(Image: TImage; ResourceID: Integer;
  ResourceType: PChar = RT_RCDATA): Boolean;

// Новая функция с Lanczos фильтром
function LoadImageToTImageWithLanczos(Image: TImage; ResourceID: Integer;
  NewWidth, NewHeight: Integer; LanczosRadius: Single = 3.0;
  ResourceType: PChar = RT_RCDATA): Boolean;

// Вспомогательная функция для применения Lanczos к существующему изображению
procedure ApplyLanczosFilter(Source, Dest: TBitmap; LanczosRadius: Single = 3.0);

implementation

// Ваша оригинальная функция
function LoadImageToTImage(Image: TImage; ResourceID: Integer;
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
    Image.Picture := nil;
  end;
end;

// Ядро Lanczos
function LanczosKernel(x, radius: Single): Single;
var
  xpi: Single;
begin
  if x = 0 then
    Result := 1.0
  else if Abs(x) < radius then
  begin
    xpi := Pi * x;
    Result := radius * Sin(xpi) * Sin(xpi / radius) / (xpi * xpi);
  end
  else
    Result := 0.0;
end;

// Применение фильтра Lanczos
procedure ApplyLanczosFilter(Source, Dest: TBitmap; LanczosRadius: Single = 3.0);
var
  x, y, i, j, srcX, srcY: Integer;
  r, g, b, weight, totalWeight: Double;
  xScale, yScale: Double;
  kernelSize: Integer;
  xDiff, yDiff: Double;
  color: TColor;
begin
  // Устанавливаем размеры целевого изображения
  xScale := Source.Width / Dest.Width;
  yScale := Source.Height / Dest.Height;
  kernelSize := Ceil(LanczosRadius);

  // Устанавливаем формат пикселей
  Source.PixelFormat := pf24bit;
  Dest.PixelFormat := pf24bit;

  // Обрабатываем каждый пиксель целевого изображения
  for y := 0 to Dest.Height - 1 do
  begin
    srcY := Floor(y * yScale);

    for x := 0 to Dest.Width - 1 do
    begin
      srcX := Floor(x * xScale);

      r := 0; g := 0; b := 0;
      totalWeight := 0;

      // Применяем свертку с ядром Lanczos
      for j := Max(0, srcY - kernelSize) to Min(Source.Height - 1, srcY + kernelSize) do
      begin
        yDiff := (j - srcY) / yScale;
        weight := LanczosKernel(yDiff, LanczosRadius);

        if weight = 0 then Continue;

        for i := Max(0, srcX - kernelSize) to Min(Source.Width - 1, srcX + kernelSize) do
        begin
          xDiff := (i - srcX) / xScale;
          weight := weight * LanczosKernel(xDiff, LanczosRadius);

          if weight > 0 then
          begin
            color := Source.Canvas.Pixels[i, j];
            r := r + GetRValue(color) * weight;
            g := g + GetGValue(color) * weight;
            b := b + GetBValue(color) * weight;
            totalWeight := totalWeight + weight;
          end;
        end;
      end;

      // Нормализация и установка пикселя
      if totalWeight > 0 then
      begin
        Dest.Canvas.Pixels[x, y] := RGB(
          Round(Max(0, Min(255, r / totalWeight))),
          Round(Max(0, Min(255, g / totalWeight))),
          Round(Max(0, Min(255, b / totalWeight)))
        );
      end
      else
      begin
        // Используем ближайший пиксель
        Dest.Canvas.Pixels[x, y] := Source.Canvas.Pixels[srcX, srcY];
      end;
    end;
  end;
end;

// Основная функция загрузки с Lanczos
function LoadImageToTImageWithLanczos(Image: TImage; ResourceID: Integer;
  NewWidth, NewHeight: Integer; LanczosRadius: Single = 3.0;
  ResourceType: PChar = RT_RCDATA): Boolean;
var
  Stream: TResourceStream;
  SourceBitmap, DestBitmap: TBitmap;
begin
  Result := False;

  // Проверяем валидность размеров
  if (NewWidth <= 0) or (NewHeight <= 0) then
    Exit;

  try
    // Используем вашу оригинальную логику загрузки
    Stream := TResourceStream.CreateFromID(HInstance, ResourceID, ResourceType);
    try
      SourceBitmap := TBitmap.Create;
      try
        // Загружаем исходное изображение
        SourceBitmap.LoadFromStream(Stream);

        // Проверяем, нужно ли менять размер
        if (SourceBitmap.Width = NewWidth) and (SourceBitmap.Height = NewHeight) then
        begin
          // Размеры совпадают - просто копируем
          Image.Picture.Bitmap.Assign(SourceBitmap);
          Result := True;
        end
        else
        begin
          // Создаем целевое изображение
          DestBitmap := TBitmap.Create;
          try
            DestBitmap.Width := NewWidth;
            DestBitmap.Height := NewHeight;

            // Применяем фильтр Lanczos
            ApplyLanczosFilter(SourceBitmap, DestBitmap, LanczosRadius);

            // Копируем результат в TImage
            Image.Picture.Bitmap.Assign(DestBitmap);
            Result := True;
          finally
            DestBitmap.Free;
          end;
        end;
      finally
        SourceBitmap.Free;
      end;
    finally
      Stream.Free;
    end;
  except

      Image.Picture := nil;

  end;
end;

end.
