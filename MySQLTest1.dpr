program MySQLTest1;

uses
  Forms,
  uMain1 in 'uMain1.pas' {Form1},
  commonUtils in '..\COMM\commonUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
