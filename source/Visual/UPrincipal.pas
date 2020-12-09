unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Data.DB, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TFrmPrincipal = class(TForm)
    DSPessoa: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridPessoa: TDBGrid;
    Panel3: TPanel;
    Label5: TLabel;
    BtnConsulta: TButton;
    Label6: TLabel;
    Tipo: TRadioGroup;
    RBttTpPessoaJuridicaConsulta: TRadioButton;
    RBttTpPessoaFisicaConsulta: TRadioButton;
    paginaControle: TPageControl;
    abaTelefone: TTabSheet;
    abaEmail: TTabSheet;
    Label1: TLabel;
    EdtId: TDBEdit;
    RadioGroup1: TRadioGroup;
    RBttTpPessoaFisica: TRadioButton;
    RBttTpPessoaJuridica: TRadioButton;
    NavCidade: TDBNavigator;
    EdtNome: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    EdtDoc: TDBEdit;
    BtnNovo: TButton;
    BtnAlterar: TButton;
    BtnExcluir: TButton;
    BtnSalvar: TButton;
    BtnCancelar: TButton;
    DBGridTelefone: TDBGrid;
    DBGridEmail: TDBGrid;
    EdtTelefone: TDBEdit;
    BtnSalvarTelefone: TButton;
    EdtEmail: TDBEdit;
    BtnSalvarEmail: TButton;
    DSTelefone: TDataSource;
    DSEmail: TDataSource;
    EdtNomeConsulta: TEdit;
    EdtDocConsulta: TEdit;
    procedure BtnNovoClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure DSPessoaDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure BtnConsultaClick(Sender: TObject);
    procedure EdtIdChange(Sender: TObject);
  private
    { Private declarations }
    function ValidaDados:Boolean;
    procedure CarregaDados;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses
  DataModule;

procedure TFrmPrincipal.BtnAlterarClick(Sender: TObject);
begin
  DSPessoa.DataSet.Edit;
  EdtNome.SetFocus;
end;

procedure TFrmPrincipal.BtnCancelarClick(Sender: TObject);
begin
  DSPessoa.DataSet.Cancel;
end;

procedure TFrmPrincipal.BtnExcluirClick(Sender: TObject);
begin
  if (Application.MessageBox('Deseja realmente excluir este registro?',
  'Confirmação', MB_ICONQUESTION + MB_USEGLYPHCHARS) = mrYes) then
    DSPessoa.DataSet.Delete;
end;

procedure TFrmPrincipal.BtnNovoClick(Sender: TObject);
begin
  DSPessoa.DataSet.Append;
  EdtNome.SetFocus;
end;

procedure TFrmPrincipal.BtnSalvarClick(Sender: TObject);
var vTipo:integer;
begin
   try
      if not ValidaDados then
      begin
        Exit;
      end;
   except
      On e: Exception do
      begin
        Exit;
      end;
   end;


  if (RBttTpPessoaJuridica.Checked) then
  begin
    vTipo:=1;
  end
  else if (RBttTpPessoaFisica.Checked) then
  begin
    vTipo:=2;
  end;

  DSPessoa.DataSet.FieldByName('Tipo').AsInteger := vTipo;

  DSPessoa.DataSet.Post;
end;

procedure TFrmPrincipal.BtnConsultaClick(Sender: TObject);
begin
  CarregaDados;
end;

procedure TFrmPrincipal.DSPessoaDataChange(Sender: TObject; Field: TField);
begin
  EdtNome.Enabled := DSPessoa.DataSet.State in [dsInsert, dsEdit];
  EdtDoc.Enabled := DSPessoa.DataSet.State in [dsInsert, dsEdit];

  BtnNovo.Enabled := not (DSPessoa.DataSet.State in [dsInsert, dsEdit]);

  BtnAlterar.Enabled := ((not (DSPessoa.DataSet.State in [dsInsert, dsEdit])) and
  (not (DSPessoa.DataSet.IsEmpty)));

  BtnExcluir.Enabled := ((not (DSPessoa.DataSet.State in [dsInsert, dsEdit])) and
  (not (DSPessoa.DataSet.IsEmpty)));

  BtnSalvar.Enabled := DSPessoa.DataSet.State in [dsInsert, dsEdit];
  BtnCancelar.Enabled := DSPessoa.DataSet.State in [dsInsert, dsEdit];

  CarregaDados;
end;

procedure TFrmPrincipal.EdtIdChange(Sender: TObject);
var Vint:integer;
begin
  Vint := strtoint(EdtId.Text);
  if Vint < 0 then
  begin
    EdtId.Visible:=false;
  end else begin
    EdtId.Visible:=true;
  end;

end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  if not (DSPessoa.DataSet.Active) then
    DSPessoa.DataSet.Open;
end;


function TFrmPrincipal.ValidaDados:Boolean;
begin
   if Trim(EdtNome.Text) = '' then
   begin
        Application.MessageBox('Nome em branco !','Atenção',MB_ICONEXCLAMATION);
        Result := false;
        Abort;
   end;

   if Trim(EdtDoc.Text) = '' then
   begin
        Application.MessageBox('Informar o número do documento (CNPJ/CPF) !', 'Atenção', MB_ICONINFORMATION);
        Result := false;
        Abort;
   end;

   if (not RBttTpPessoaFisica.Checked and not RBttTpPessoaJuridica.Checked) then
   begin
        Application.MessageBox('Informar o tipo de pessoa: Física ou Jurídica !', 'Atenção', MB_ICONINFORMATION);
        Result := false;
        Abort;
   end;

   Result := true;
end;


procedure TFrmPrincipal.CarregaDados;
var vTipo:integer;
begin

  DataModule.Dtm.QryPessoa.ParamByName('Nome').AsString := EdtNomeConsulta.Text;
  DataModule.Dtm.QryPessoa.ParamByName('Doc').AsString := EdtDocConsulta.Text;


  if (RBttTpPessoaJuridicaConsulta.Checked) then
  begin
    vTipo:=1;
  end
  else if (RBttTpPessoaFisicaConsulta.Checked) then
  begin
    vTipo:=2;
  end;

  DataModule.Dtm.QryPessoa.ParamByName('Tipo').AsInteger := vTipo;

end;

end.
