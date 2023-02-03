program Importador;

uses
  Vcl.Forms,
  importador.view.main in 'importador.view.main.pas' {fMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
