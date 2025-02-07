unit DataService_Impl;

interface

uses
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Phys,
  FireDAC.Phys.Intf,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Async,
  FireDAC.Stan.Def,
  FireDAC.Stan.Error,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Pool,
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait,
  IniFiles,
  IOUtils,
  System.Classes,
  System.SysUtils,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDataService = class( TDataModule )
    FDConnection : TFDConnection;
    FDPhysMySQLDriverLink : TFDPhysMySQLDriverLink;
    FDQuerytb_cliente : TFDQuery;
    FDQuerytb_clienteID_CLIENTE : TLargeintField;
    FDQuerytb_clienteCOD_CLIENTE : TStringField;
    FDQuerytb_clienteNOM_CLIENTE : TStringField;
    FDQuerytb_clienteNOM_CIDADE : TStringField;
    FDQuerytb_clienteCOD_UF : TStringField;
    DataSourcetb_cliente : TDataSource;
    FDQuerytb_produto : TFDQuery;
    DataSourcetb_produto : TDataSource;
    FDQuerytb_produtoID_PRODUTO : TLargeintField;
    FDQuerytb_produtoCOD_PRODUTO : TStringField;
    FDQuerytb_produtoNOM_PRODUTO : TStringField;
    FDQuerytb_produtoVAL_PRECO_VENDA : TFloatField;
    FDQueryvw_pedido_venda : TFDQuery;
    DataSourcevw_pedido_venda : TDataSource;
    FDQueryvw_pedido_vendaID_PEDIDO_VENDA : TLargeintField;
    FDQueryvw_pedido_vendaID_CLIENTE : TLargeintField;
    FDQueryvw_pedido_vendaDAT_EMISSAO : TDateField;
    FDQueryvw_pedido_vendaVAL_TOTAL : TFloatField;
    FDQueryvw_pedido_vendaNOM_CLIENTE : TStringField;
    FDQueryvw_pedido_venda_item : TFDQuery;
    DataSourcevw_pedido_venda_item : TDataSource;
    FDCommand : TFDCommand;
    FDQueryvw_pedido_vendaCOD_CLIENTE : TStringField;
    FDQueryID_PEDIDO_VENDA : TFDQuery;
    FDQueryID_PEDIDO_VENDAID : TLargeintField;
    FDQueryvw_pedido_venda_itemID_PEDIDO_VENDA_ITEM : TLargeintField;
    FDQueryvw_pedido_venda_itemID_PEDIDO_VENDA : TLargeintField;
    FDQueryvw_pedido_venda_itemID_PRODUTO : TLargeintField;
    FDQueryvw_pedido_venda_itemQTD_ITEM : TFloatField;
    FDQueryvw_pedido_venda_itemVAL_UNITARIO : TFloatField;
    FDQueryvw_pedido_venda_itemVAL_ITEM : TFloatField;
    FDQueryvw_pedido_venda_itemCOD_PRODUTO : TStringField;
    FDQueryvw_pedido_venda_itemNOM_PRODUTO : TStringField;
    FDQueryvw_pedido_venda_all : TFDQuery;
    DataSourcevw_pedido_venda_all : TDataSource;
    FDQueryvw_pedido_venda_allID_PEDIDO_VENDA : TLargeintField;
    FDQueryvw_pedido_venda_allID_CLIENTE : TLargeintField;
    FDQueryvw_pedido_venda_allDAT_EMISSAO : TDateField;
    FDQueryvw_pedido_venda_allVAL_TOTAL : TFloatField;
    FDQueryvw_pedido_venda_allCOD_CLIENTE : TStringField;
    FDQueryvw_pedido_venda_allNOM_CLIENTE : TStringField;
    procedure DataModuleCreate( Sender : TObject );
    private
      procedure Start;
  end;

var
  DataService : TDataService;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDataService.DataModuleCreate( Sender : TObject );
  begin
    Start;
  end;

procedure TDataService.Start;
  begin
    FDConnection.Close;
    with TIniFile.Create( 'C:\WK\bin\wk_config.ini' ) do
    begin
      FDPhysMySQLDriverLink.VendorHome := ReadString( 'Config', 'PathLib',
        'C:\WK' );
      FDConnection.Params.Clear;
      FDConnection.Params.AddPair( 'DriverID', ReadString( 'Config', 'DriverID',
        'MySQL' ) );
      FDConnection.Params.AddPair( 'Server', ReadString( 'Config', 'Server',
        'localhost' ) );
      FDConnection.Params.AddPair( 'Password', ReadString( 'Config', 'Password',
        'As@151273' ) );
      FDConnection.Params.AddPair( 'User_Name',
        ReadString( 'Config', 'User_Name', 'root' ) );
      FDConnection.Params.AddPair( 'Database',
        ReadString( 'Config', 'Database', 'WK' ) );
      FDConnection.Params.AddPair( 'Port', ReadString( 'Config', 'Port',
        '3306' ) );
    end;
    FDConnection.Open;
  end;

end.
