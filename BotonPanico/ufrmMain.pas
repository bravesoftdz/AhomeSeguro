unit ufrmMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, System.Sensors,
  System.Sensors.Components, FMX.Objects;

type
  TfrmMain = class(TForm)
    LocationSensor: TLocationSensor;
    Image1: TImage;
    procedure LocationSensorLocationChanged(Sender: TObject; const OldLocation,
      NewLocation: TLocationCoord2D);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

uses udmData;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  LocationSensor.Active:= True;
end;

procedure TfrmMain.LocationSensorLocationChanged(Sender: TObject;
  const OldLocation, NewLocation: TLocationCoord2D);
begin
  dmData.Alerta('Emergencia', NewLocation.Latitude, NewLocation.Longitude);
  Close;
end;

end.
