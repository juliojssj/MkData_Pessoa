unit DataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase;

type
  TDtm = class(TDataModule)
    Base: TFDConnection;
    QryPessoa: TFDQuery;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    QryTelefone: TFDQuery;
    QryEmail: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dtm: TDtm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  Forms;

procedure TDtm.DataModuleCreate(Sender: TObject);
var

  vName : String;
begin
  Base.Connected := False;

  vName := ExtractFilePath(Application.ExeName) + '..\..\db\MKDATA.FDB';
  Base.Params.Database := vName;
  Base.Params.UserName := 'SYSDBA';
  Base.Params.Password := 'masterkey';

  Base.Open;
end;

end.
