program CadPessoa;

uses
  Vcl.Forms,
  UPrincipal in 'Visual\UPrincipal.pas' {FrmPrincipal},
  DataModule in 'Data\DataModule.pas' {Dtm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDtm, Dtm);
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
