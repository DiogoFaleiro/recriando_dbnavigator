object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Exemplo'
  ClientHeight = 546
  ClientWidth = 686
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btPrimeiro: TButton
    Left = 17
    Top = 192
    Width = 82
    Height = 49
    Caption = '<<'
    TabOrder = 0
    OnClick = btPrimeiroClick
  end
  object btGravar: TButton
    Left = 503
    Top = 192
    Width = 82
    Height = 49
    Caption = 'Gravar'
    Enabled = False
    TabOrder = 1
    OnClick = btGravarClick
  end
  object btDeletar: TButton
    Left = 422
    Top = 192
    Width = 82
    Height = 49
    Caption = 'Deletar'
    TabOrder = 2
    OnClick = btDeletarClick
  end
  object btInserir: TButton
    Left = 341
    Top = 192
    Width = 82
    Height = 49
    Caption = 'Inserir'
    TabOrder = 3
    OnClick = btInserirClick
  end
  object Button5: TButton
    Left = 458
    Top = 104
    Width = 96
    Height = 49
    Caption = 'Abrir Tabela'
    TabOrder = 4
    OnClick = Button5Click
  end
  object btUltimo: TButton
    Left = 260
    Top = 192
    Width = 82
    Height = 49
    Caption = '>>'
    TabOrder = 5
    OnClick = btUltimoClick
  end
  object btProximo: TButton
    Left = 179
    Top = 192
    Width = 82
    Height = 49
    Caption = '>'
    TabOrder = 6
    OnClick = btProximoClick
  end
  object btAnterior: TButton
    Left = 98
    Top = 192
    Width = 82
    Height = 49
    Caption = '<'
    TabOrder = 7
    OnClick = btAnteriorClick
  end
  object btCancelar: TButton
    Left = 584
    Top = 192
    Width = 82
    Height = 49
    Caption = 'Cancelar'
    Enabled = False
    TabOrder = 8
    OnClick = btCancelarClick
  end
  object Button10: TButton
    Left = 560
    Top = 104
    Width = 96
    Height = 49
    Caption = 'Fechar Tabela'
    TabOrder = 9
    OnClick = Button10Click
  end
  object DBNavigator1: TDBNavigator
    Left = 24
    Top = 256
    Width = 632
    Height = 49
    DataSource = dsUsuarios
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
    TabOrder = 10
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 328
    Width = 640
    Height = 193
    DataSource = dsUsuarios
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=recriadbnavigator'
      'User_Name=root'
      'Password=tche1045734728'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 24
  end
  object tbUsuarios: TFDTable
    Active = True
    AfterScroll = tbUsuariosAfterScroll
    IndexFieldNames = 'id'
    Connection = Conexao
    UpdateOptions.UpdateTableName = 'recriadbnavigator.usuarios'
    TableName = 'recriadbnavigator.usuarios'
    Left = 128
    Top = 24
    object tbUsuariosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
    end
    object tbUsuariosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 40
    end
    object tbUsuarioslogin: TStringField
      FieldName = 'login'
      Origin = 'login'
      Required = True
      Size = 16
    end
    object tbUsuariossenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Required = True
      Size = 32
    end
  end
  object dsUsuarios: TDataSource
    DataSet = tbUsuarios
    Left = 128
    Top = 96
  end
end
