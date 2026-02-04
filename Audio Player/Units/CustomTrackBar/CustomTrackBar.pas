unit CustomTrackBar;

interface

uses
  Classes, Controls, ComCtrls, Messages, Windows, Forms;

type
  TTrackBar = class(ComCtrls.TTrackBar)
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; x, y: Integer); override;
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint): Boolean; override;
    procedure CreateParams(var Params: TCreateParams); override;
  end;

implementation

{ TTrackBar }

procedure TTrackBar.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style := Params.Style;
  // Можно добавить дополнительные настройки стиля если нужно
end;

function TTrackBar.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
  MousePos: TPoint): Boolean;
begin
  // Просто меняем знак
  Position := Position - (WheelDelta Div 120);
  Result := True;
end;

procedure TTrackBar.MouseDown(Button: TMouseButton; Shift: TShiftState;
  x, y: Integer);
begin
  inherited;

  If Button = mbLeft Then
  Begin
    if Self.Orientation = trVertical then
    begin
      // Вертикальный: используем Y
      if Height > 0 then
        Position := Min + Round((y / Height) * (Max - Min));
    end
    else
    begin
      // Горизонтальный: используем X
      if Width > 0 then
        Position := Min + Round((x / Width) * (Max - Min));
    end;
  End;
end;

end.