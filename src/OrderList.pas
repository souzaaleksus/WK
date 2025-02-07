unit OrderList;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.DBCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.Buttons;

type
  TFormOrderList = class( TForm )
    BitBtnSelectOrder : TBitBtn;
    DBGridOrder : TDBGrid;
    DBTextCOD_CLIENTE : TDBText;
    DBTextCOD_UF : TDBText;
    DBTextNOM_CIDADE : TDBText;
    DBTextNOM_CLIENTE : TDBText;
    GroupBoxCliente : TGroupBox;
    LabelCliente_1 : TLabel;
    LabelCliente_2 : TLabel;
    LabelCliente_3 : TLabel;
    LabelCliente_4 : TLabel;
    PanelBotton : TPanel;
    PanelCliente : TPanel;
    PanelCliente_1 : TPanel;
    PanelCliente_2 : TPanel;
    PanelCliente_3 : TPanel;
    PanelCliente_4 : TPanel;
    procedure FormKeyDown(
      Sender  : TObject;
      var Key : Word;
      Shift   : TShiftState );
    procedure FormShow( Sender : TObject );
    procedure BitBtnSelectOrderClick( Sender : TObject );
    private
      procedure SetDataTable;
      procedure SelectOrder;
  end;

var
  FormOrderList : TFormOrderList;

implementation

{$R *.dfm}

uses
  DataService_Impl,
  Main;

{ TFormOrderList }

procedure TFormOrderList.BitBtnSelectOrderClick( Sender : TObject );
  begin
    SelectOrder;
  end;

procedure TFormOrderList.FormKeyDown(
  Sender  : TObject;
  var Key : Word;
  Shift   : TShiftState );
  begin
    if Key = VK_ESCAPE
    then
      Self.Close;
  end;

procedure TFormOrderList.FormShow( Sender : TObject );
  begin
    SetDataTable;
  end;

procedure TFormOrderList.SelectOrder;
  begin
    FormMain.ID_PEDIDO_VENDA :=
      DataService.FDQueryvw_pedido_venda_allID_PEDIDO_VENDA.AsLargeInt;
    FormMain.GetOrder;
    FormMain.GetOrderItem;
    FormMain.DBGridItem.SetFocus;
    FormMain.BitBtnCancelOrder.Enabled := True;
  end;

procedure TFormOrderList.SetDataTable;
  begin
    DataService.FDQueryvw_pedido_venda_all.Close;
    DataService.FDQueryvw_pedido_venda_all.Params[ 0 ].AsInteger :=
      DataService.FDQuerytb_clienteID_CLIENTE.AsInteger;
    DataService.FDQueryvw_pedido_venda_all.Open;
    // -------------------------------------------------------------------
    DBGridOrder.DataSource := DataService.DataSourcevw_pedido_venda_all;
    DBGridOrder.SetFocus;
    // -------------------------------------------------------------------
    DBTextCOD_CLIENTE.DataField := 'COD_CLIENTE';
    DBTextCOD_CLIENTE.DataSource := DataService.DataSourcetb_cliente;
    // -------------------------------------------------------------------
    DBTextNOM_CLIENTE.DataField := 'NOM_CLIENTE';
    DBTextNOM_CLIENTE.DataSource := DataService.DataSourcetb_cliente;
    // -------------------------------------------------------------------
    DBTextNOM_CIDADE.DataField := 'NOM_CIDADE';
    DBTextNOM_CIDADE.DataSource := DataService.DataSourcetb_cliente;
    // -------------------------------------------------------------------
    DBTextCOD_UF.DataField := 'COD_UF';
    DBTextCOD_UF.DataSource := DataService.DataSourcetb_cliente;
    // -------------------------------------------------------------------
  end;

end.
