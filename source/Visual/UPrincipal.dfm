object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 574
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 401
    Top = 0
    Width = 453
    Height = 574
    Align = alClient
    TabOrder = 0
    object paginaControle: TPageControl
      Left = 1
      Top = 129
      Width = 451
      Height = 444
      ActivePage = abaTelefone
      Align = alClient
      TabOrder = 0
      ExplicitTop = 177
      ExplicitHeight = 396
      object abaTelefone: TTabSheet
        Caption = 'Telefone'
        ExplicitHeight = 368
        object DBGridTelefone: TDBGrid
          Left = 0
          Top = 30
          Width = 443
          Height = 386
          Align = alClient
          DataSource = DSTelefone
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONE'
              Title.Caption = 'Telefone'
              Width = 231
              Visible = True
            end>
        end
        object TPanel
          Left = 0
          Top = 0
          Width = 443
          Height = 30
          Align = alTop
          TabOrder = 1
          object EdtTelefone: TDBEdit
            Left = 1
            Top = 5
            Width = 151
            Height = 21
            DataField = 'UF'
            DataSource = DSTelefone
            TabOrder = 0
          end
          object BtnSalvarTelefone: TButton
            Left = 158
            Top = 2
            Width = 75
            Height = 25
            Caption = 'Incluir'
            TabOrder = 1
            OnClick = BtnNovoClick
          end
        end
      end
      object abaEmail: TTabSheet
        Caption = 'E-mail'
        ImageIndex = 1
        ExplicitHeight = 368
        object TPanel
          Left = 0
          Top = 0
          Width = 443
          Height = 30
          Align = alTop
          TabOrder = 0
          object EdtEmail: TDBEdit
            Left = 1
            Top = 5
            Width = 151
            Height = 21
            DataField = 'EMAIL'
            DataSource = DSEmail
            TabOrder = 0
          end
          object BtnSalvarEmail: TButton
            Left = 158
            Top = 2
            Width = 75
            Height = 25
            Caption = 'Incluir'
            TabOrder = 1
            OnClick = BtnNovoClick
          end
        end
        object DBGridEmail: TDBGrid
          Left = 0
          Top = 30
          Width = 443
          Height = 386
          Align = alClient
          DataSource = DSEmail
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'Id'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMAIL'
              Title.Caption = 'E-mail'
              Width = 231
              Visible = True
            end>
        end
      end
    end
    object TPanel
      Left = 1
      Top = 1
      Width = 451
      Height = 128
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 6
        Top = 8
        Width = 10
        Height = 13
        Caption = 'Id'
      end
      object Label2: TLabel
        Left = 6
        Top = 49
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object Label3: TLabel
        Left = 271
        Top = 49
        Width = 117
        Height = 13
        Caption = 'Documento (CNPJ/CPF):'
      end
      object EdtId: TDBEdit
        Left = 5
        Top = 22
        Width = 67
        Height = 21
        DataField = 'ID'
        DataSource = DSPessoa
        Enabled = False
        TabOrder = 0
      end
      object RadioGroup1: TRadioGroup
        Left = 90
        Top = 8
        Width = 153
        Height = 35
        Caption = 'Tipo de Pessoa'
        TabOrder = 1
      end
      object RBttTpPessoaFisica: TRadioButton
        Left = 97
        Top = 23
        Width = 65
        Height = 17
        Caption = 'F'#237'sica'
        TabOrder = 2
      end
      object RBttTpPessoaJuridica: TRadioButton
        Left = 168
        Top = 23
        Width = 65
        Height = 17
        Caption = 'Jur'#237'dica'
        TabOrder = 3
      end
      object NavCidade: TDBNavigator
        Left = 265
        Top = 18
        Width = 140
        Height = 25
        DataSource = DSPessoa
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        TabOrder = 4
      end
      object EdtNome: TDBEdit
        Left = 5
        Top = 64
        Width = 260
        Height = 21
        DataField = 'NOME'
        DataSource = DSPessoa
        TabOrder = 5
      end
      object EdtDoc: TDBEdit
        Left = 271
        Top = 64
        Width = 130
        Height = 21
        DataField = 'DOCUMENTO'
        DataSource = DSPessoa
        TabOrder = 6
      end
      object BtnNovo: TButton
        Left = 5
        Top = 91
        Width = 75
        Height = 25
        Caption = 'Novo'
        TabOrder = 7
        OnClick = BtnNovoClick
      end
      object BtnAlterar: TButton
        Left = 86
        Top = 91
        Width = 75
        Height = 25
        Caption = 'Alterar'
        TabOrder = 8
        OnClick = BtnAlterarClick
      end
      object BtnExcluir: TButton
        Left = 167
        Top = 91
        Width = 75
        Height = 25
        Caption = 'Excluir'
        TabOrder = 9
        OnClick = BtnExcluirClick
      end
      object BtnSalvar: TButton
        Left = 248
        Top = 91
        Width = 75
        Height = 25
        Caption = 'Salvar'
        TabOrder = 10
        OnClick = BtnSalvarClick
      end
      object BtnCancelar: TButton
        Left = 329
        Top = 91
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 11
        OnClick = BtnCancelarClick
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 401
    Height = 574
    Align = alLeft
    TabOrder = 1
    object DBGridPessoa: TDBGrid
      Left = 1
      Top = 102
      Width = 399
      Height = 471
      Align = alClient
      DataSource = DSPessoa
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Id'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPOPESSOA'
          Title.Caption = 'Tipo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 135
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOCUMENTO'
          Title.Caption = 'Documento'
          Width = 111
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 399
      Height = 101
      Align = alTop
      TabOrder = 1
      object Label5: TLabel
        Left = 9
        Top = 48
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object Label6: TLabel
        Left = 9
        Top = 5
        Width = 117
        Height = 13
        Caption = 'Documento (CNPJ/CPF):'
      end
      object EdtNomeConsulta: TEdit
        Left = 9
        Top = 64
        Width = 218
        Height = 21
        TabOrder = 0
      end
      object EdtDocConsulta: TEdit
        Left = 9
        Top = 24
        Width = 121
        Height = 21
        TabOrder = 1
      end
    end
    object BtnConsulta: TButton
      Left = 234
      Top = 63
      Width = 75
      Height = 25
      Caption = 'Consulta'
      TabOrder = 2
      OnClick = BtnConsultaClick
    end
    object Tipo: TRadioGroup
      Left = 155
      Top = 11
      Width = 153
      Height = 35
      Caption = 'Tipo de Pessoa'
      TabOrder = 3
    end
    object RBttTpPessoaJuridicaConsulta: TRadioButton
      Left = 234
      Top = 24
      Width = 65
      Height = 17
      Caption = 'Jur'#237'dica'
      TabOrder = 4
    end
    object RBttTpPessoaFisicaConsulta: TRadioButton
      Left = 163
      Top = 24
      Width = 65
      Height = 17
      Caption = 'F'#237'sica'
      TabOrder = 5
    end
  end
  object DSPessoa: TDataSource
    DataSet = Dtm.QryPessoa
    OnDataChange = DSPessoaDataChange
    Left = 24
    Top = 200
  end
  object DSTelefone: TDataSource
    DataSet = Dtm.QryTelefone
    OnDataChange = DSPessoaDataChange
    Left = 448
    Top = 272
  end
  object DSEmail: TDataSource
    DataSet = Dtm.QryEmail
    OnDataChange = DSPessoaDataChange
    Left = 480
    Top = 272
  end
end
