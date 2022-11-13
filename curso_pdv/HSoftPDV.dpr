program HSoftPDV;

uses
  Vcl.Forms,
  hsoftpdv.view.main in 'source\view\hsoftpdv.view.main.pas' {Main};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tmain, Main);
  Application.Run;
end.
