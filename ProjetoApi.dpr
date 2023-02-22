program ProjetoApi;

uses
  System.StartUpCopy,
  FMX.Forms,
  ufrmprincipal in 'ufrmprincipal.pas' {Form1},
  AnonThread in 'Units\AnonThread.pas',
  FMX.BitmapHelper in 'Units\FMX.BitmapHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
