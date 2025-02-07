object DataService: TDataService
  OnCreate = DataModuleCreate
  Height = 328
  Width = 588
  object FDConnection: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'Password=As@151273'
      'User_Name=root'
      'Database=WK'
      'Port=3306'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 80
  end
  object FDPhysMySQLDriverLink: TFDPhysMySQLDriverLink
    DriverID = 'MySQL'
    VendorHome = 'C:\WK'
    Left = 200
  end
  object FDQuerytb_cliente: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT tb_cliente.ID_CLIENTE,'
      '    tb_cliente.COD_CLIENTE,'
      '    tb_cliente.NOM_CLIENTE,'
      '    tb_cliente.NOM_CIDADE,'
      '    tb_cliente.COD_UF'
      'FROM wk.tb_cliente'
      'WHERE COD_CLIENTE = :COD_CLIENTE')
    Left = 80
    Top = 56
    ParamData = <
      item
        Name = 'COD_CLIENTE'
        DataType = ftString
        ParamType = ptInput
        Size = 10
        Value = ''
      end>
    object FDQuerytb_clienteID_CLIENTE: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object FDQuerytb_clienteCOD_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COD_CLIENTE'
      Origin = 'COD_CLIENTE'
      Size = 10
    end
    object FDQuerytb_clienteNOM_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOM_CLIENTE'
      Origin = 'NOM_CLIENTE'
      Size = 100
    end
    object FDQuerytb_clienteNOM_CIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOM_CIDADE'
      Origin = 'NOM_CIDADE'
      Size = 100
    end
    object FDQuerytb_clienteCOD_UF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COD_UF'
      Origin = 'COD_UF'
      Size = 2
    end
  end
  object DataSourcetb_cliente: TDataSource
    AutoEdit = False
    DataSet = FDQuerytb_cliente
    Left = 80
    Top = 112
  end
  object FDQuerytb_produto: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT tb_produto.ID_PRODUTO,'
      '    tb_produto.COD_PRODUTO,'
      '    tb_produto.NOM_PRODUTO,'
      '    tb_produto.VAL_PRECO_VENDA'
      'FROM wk.tb_produto'
      'WHERE COD_PRODUTO = :COD_PRODUTO')
    Left = 80
    Top = 168
    ParamData = <
      item
        Name = 'COD_PRODUTO'
        DataType = ftString
        ParamType = ptInput
        Size = 10
        Value = ''
      end>
    object FDQuerytb_produtoID_PRODUTO: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object FDQuerytb_produtoCOD_PRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
      Size = 10
    end
    object FDQuerytb_produtoNOM_PRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOM_PRODUTO'
      Origin = 'NOM_PRODUTO'
      Size = 100
    end
    object FDQuerytb_produtoVAL_PRECO_VENDA: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VAL_PRECO_VENDA'
      Origin = 'VAL_PRECO_VENDA'
      DisplayFormat = ',0.00'
    end
  end
  object DataSourcetb_produto: TDataSource
    AutoEdit = False
    DataSet = FDQuerytb_produto
    Left = 80
    Top = 224
  end
  object FDQueryvw_pedido_venda: TFDQuery
    Connection = FDConnection
    FetchOptions.AssignedValues = [evDetailCascade]
    SQL.Strings = (
      'SELECT vw_pedido_venda.ID_PEDIDO_VENDA,'
      '    vw_pedido_venda.ID_CLIENTE,'
      '    vw_pedido_venda.DAT_EMISSAO,'
      '    vw_pedido_venda.VAL_TOTAL,'
      '    vw_pedido_venda.COD_CLIENTE,'
      '    vw_pedido_venda.NOM_CLIENTE'
      'FROM wk.vw_pedido_venda'
      'WHERE ID_PEDIDO_VENDA = :ID_PEDIDO_VENDA')
    Left = 248
    Top = 56
    ParamData = <
      item
        Name = 'ID_PEDIDO_VENDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryvw_pedido_vendaID_PEDIDO_VENDA: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_PEDIDO_VENDA'
      Origin = 'ID_PEDIDO_VENDA'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '0000000'
    end
    object FDQueryvw_pedido_vendaID_CLIENTE: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object FDQueryvw_pedido_vendaDAT_EMISSAO: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DAT_EMISSAO'
      Origin = 'DAT_EMISSAO'
    end
    object FDQueryvw_pedido_vendaVAL_TOTAL: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VAL_TOTAL'
      Origin = 'VAL_TOTAL'
      DisplayFormat = 'R$ ,0.00'
      currency = True
    end
    object FDQueryvw_pedido_vendaCOD_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COD_CLIENTE'
      Origin = 'COD_CLIENTE'
      Size = 10
    end
    object FDQueryvw_pedido_vendaNOM_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOM_CLIENTE'
      Origin = 'NOM_CLIENTE'
      Size = 100
    end
  end
  object DataSourcevw_pedido_venda: TDataSource
    AutoEdit = False
    DataSet = FDQueryvw_pedido_venda
    Left = 248
    Top = 112
  end
  object FDQueryvw_pedido_venda_item: TFDQuery
    Connection = FDConnection
    FetchOptions.AssignedValues = [evDetailCascade]
    SQL.Strings = (
      'SELECT vw_pedido_venda_item.ID_PEDIDO_VENDA_ITEM,'
      '    vw_pedido_venda_item.ID_PEDIDO_VENDA,'
      '    vw_pedido_venda_item.ID_PRODUTO,'
      '    vw_pedido_venda_item.QTD_ITEM,'
      '    vw_pedido_venda_item.VAL_UNITARIO,'
      '    vw_pedido_venda_item.VAL_ITEM,'
      '    vw_pedido_venda_item.COD_PRODUTO,'
      '    vw_pedido_venda_item.NOM_PRODUTO'
      'FROM wk.vw_pedido_venda_item'
      'WHERE ID_PEDIDO_VENDA = :ID_PEDIDO_VENDA')
    Left = 248
    Top = 168
    ParamData = <
      item
        Name = 'ID_PEDIDO_VENDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryvw_pedido_venda_itemID_PEDIDO_VENDA_ITEM: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_PEDIDO_VENDA_ITEM'
      Origin = 'ID_PEDIDO_VENDA_ITEM'
      ProviderFlags = [pfInWhere]
    end
    object FDQueryvw_pedido_venda_itemID_PEDIDO_VENDA: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'ID_PEDIDO_VENDA'
      Origin = 'ID_PEDIDO_VENDA'
    end
    object FDQueryvw_pedido_venda_itemID_PRODUTO: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
    end
    object FDQueryvw_pedido_venda_itemQTD_ITEM: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'QTD_ITEM'
      Origin = 'QTD_ITEM'
    end
    object FDQueryvw_pedido_venda_itemVAL_UNITARIO: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VAL_UNITARIO'
      Origin = 'VAL_UNITARIO'
      currency = True
    end
    object FDQueryvw_pedido_venda_itemVAL_ITEM: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VAL_ITEM'
      Origin = 'VAL_ITEM'
      currency = True
    end
    object FDQueryvw_pedido_venda_itemCOD_PRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COD_PRODUTO'
      Origin = 'COD_PRODUTO'
      Size = 10
    end
    object FDQueryvw_pedido_venda_itemNOM_PRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOM_PRODUTO'
      Origin = 'NOM_PRODUTO'
      Size = 100
    end
  end
  object DataSourcevw_pedido_venda_item: TDataSource
    AutoEdit = False
    DataSet = FDQueryvw_pedido_venda_item
    Left = 248
    Top = 224
  end
  object FDCommand: TFDCommand
    Connection = FDConnection
    Left = 448
    Top = 168
  end
  object FDQueryID_PEDIDO_VENDA: TFDQuery
    Connection = FDConnection
    FetchOptions.AssignedValues = [evDetailCascade]
    SQL.Strings = (
      'SELECT LAST_INSERT_ID() ID')
    Left = 448
    Top = 224
    object FDQueryID_PEDIDO_VENDAID: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object FDQueryvw_pedido_venda_all: TFDQuery
    Connection = FDConnection
    FetchOptions.AssignedValues = [evDetailCascade]
    SQL.Strings = (
      'SELECT vw_pedido_venda.ID_PEDIDO_VENDA,'
      '    vw_pedido_venda.ID_CLIENTE,'
      '    vw_pedido_venda.DAT_EMISSAO,'
      '    vw_pedido_venda.VAL_TOTAL,'
      '    vw_pedido_venda.COD_CLIENTE,'
      '    vw_pedido_venda.NOM_CLIENTE'
      'FROM wk.vw_pedido_venda'
      'WHERE ID_CLIENTE = :ID_CLIENTE')
    Left = 448
    Top = 56
    ParamData = <
      item
        Name = 'ID_CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryvw_pedido_venda_allID_PEDIDO_VENDA: TLargeintField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_PEDIDO_VENDA'
      Origin = 'ID_PEDIDO_VENDA'
      ProviderFlags = [pfInWhere]
      DisplayFormat = '0000000'
    end
    object FDQueryvw_pedido_venda_allID_CLIENTE: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
    end
    object FDQueryvw_pedido_venda_allDAT_EMISSAO: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DAT_EMISSAO'
      Origin = 'DAT_EMISSAO'
    end
    object FDQueryvw_pedido_venda_allVAL_TOTAL: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'VAL_TOTAL'
      Origin = 'VAL_TOTAL'
      DisplayFormat = 'R$ ,0.00'
      currency = True
    end
    object FDQueryvw_pedido_venda_allCOD_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COD_CLIENTE'
      Origin = 'COD_CLIENTE'
      Size = 10
    end
    object FDQueryvw_pedido_venda_allNOM_CLIENTE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOM_CLIENTE'
      Origin = 'NOM_CLIENTE'
      Size = 100
    end
  end
  object DataSourcevw_pedido_venda_all: TDataSource
    AutoEdit = False
    DataSet = FDQueryvw_pedido_venda_all
    Left = 448
    Top = 112
  end
end
