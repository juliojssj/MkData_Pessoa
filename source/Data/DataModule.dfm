object Dtm: TDtm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 450
  Width = 555
  object Base: TFDConnection
    Params.Strings = (
      'Database=C:\Users\julio\Desktop\MkData_Pessoa\db\MKDATA.FDB'
      'ConnectionDef=FB')
    LoginPrompt = False
    Left = 32
    Top = 8
  end
  object QryPessoa: TFDQuery
    Connection = Base
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_Pessoa_ID'
    UpdateOptions.UpdateTableName = 'TbPessoa'
    UpdateOptions.KeyFields = 'Id'
    UpdateOptions.AutoIncFields = 'Id'
    SQL.Strings = (
      'select '
      'p.Id, p.Nome, p.Documento, p.Tipo, tp.TipoPessoa'
      'from TbPessoa p'
      'inner join TbTipoPessoa tp'
      'on Tp.Id = p.Tipo '
      'where (p.nome = :Nome or :Nome = '#39#39')'
      'and (p.Documento = :Doc or :Doc = '#39#39')'
      'and (p.tipo = :tipo or :tipo = 0)')
    Left = 32
    Top = 56
    ParamData = <
      item
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        Name = 'DOC'
        ParamType = ptInput
      end
      item
        Name = 'TIPO'
        DataType = ftInteger
        ParamType = ptInput
        Value = 0
      end>
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files (x86)\Firebird\Firebird_3_0\fbclient.dll'
    Left = 32
    Top = 104
  end
  object QryTelefone: TFDQuery
    Connection = Base
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_Pessoa_ID'
    UpdateOptions.UpdateTableName = 'TbPessoa'
    UpdateOptions.KeyFields = 'Id'
    UpdateOptions.AutoIncFields = 'Id'
    SQL.Strings = (
      'select * from TbTelefone'
      'where PessoaId = :PessoaId')
    Left = 96
    Top = 56
    ParamData = <
      item
        Name = 'PESSOAID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object QryEmail: TFDQuery
    Connection = Base
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_Pessoa_ID'
    UpdateOptions.UpdateTableName = 'TbPessoa'
    UpdateOptions.KeyFields = 'Id'
    UpdateOptions.AutoIncFields = 'Id'
    SQL.Strings = (
      'select * from TbEmail'
      'where PessoaId = :PessoaId')
    Left = 160
    Top = 56
    ParamData = <
      item
        Name = 'PESSOAID'
        DataType = ftWord
        ParamType = ptInput
        Value = Null
      end>
  end
end
