program menu;

uses
  Vcl.Forms,
  DeleteBaseInfo in 'DeleteBaseInfo.pas' {Form3},
  uJobFieldBlob in 'uJobFieldBlob.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
