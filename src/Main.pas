unit Main;

interface

uses
  Data.DB,
  System.Classes,
  System.SysUtils,
  System.Variants,
  Vcl.Buttons,
  Vcl.Controls,
  Vcl.DBCtrls,
  Vcl.DBGrids,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Grids,
  Vcl.Mask,
  Vcl.StdCtrls,
  Winapi.Messages,
  Winapi.Windows;

type
  TFormMain = class( TForm )
    BitBtnCancelOrder : TBitBtn;
    BitBtnLoadOrders : TBitBtn;
    BitBtnSaveItem : TBitBtn;
    BitBtnSaveOrder : TBitBtn;
    DBGridItem : TDBGrid;
    DBTextCOD_CLIENTE : TDBText;
    DBTextCOD_UF : TDBText;
    DBTextDAT_EMISSAO : TDBText;
    DBTextID_PEDIDO_VENDA : TDBText;
    DBTextNOM_CIDADE : TDBText;
    DBTextNOM_CLIENTE : TDBText;
    DBTextNOM_CLIENTE_ : TDBText;
    DBTextNOM_PRODUTO : TDBText;
    DBTextVAL_TOTAL : TDBText;
    EditCOD_CLIENTE : TEdit;
    EditCOD_PRODUTO : TEdit;
    EditQTD_ITEM : TEdit;
    EditVAL_PRECO_VENDA : TEdit;
    GroupBoxCliente : TGroupBox;
    GroupBoxItem : TGroupBox;
    GroupBoxPedido : TGroupBox;
    GroupBoxProduto : TGroupBox;
    LabelCliente_1 : TLabel;
    LabelCliente_2 : TLabel;
    LabelCliente_3 : TLabel;
    LabelCliente_4 : TLabel;
    LabelPedido_0 : TLabel;
    LabelPedido_1 : TLabel;
    LabelPedido_2 : TLabel;
    LabelPedido_3 : TLabel;
    LabelPedido_4 : TLabel;
    LabelProduto_1 : TLabel;
    LabelProduto_2 : TLabel;
    LabelProduto_3 : TLabel;
    LabelProduto_4 : TLabel;
    Panel1 : TPanel;
    PanelBotton : TPanel;
    PanelCliente : TPanel;
    PanelCliente_1 : TPanel;
    PanelCliente_2 : TPanel;
    PanelCliente_3 : TPanel;
    PanelCliente_4 : TPanel;
    PanelPedido : TPanel;
    PanelPedido_1 : TPanel;
    PanelPedido_2 : TPanel;
    PanelPedido_3 : TPanel;
    PanelPedido_4 : TPanel;
    PanelProduto : TPanel;
    PanelProduto_1 : TPanel;
    PanelProduto_2 : TPanel;
    PanelProduto_3 : TPanel;
    PanelProduto_4 : TPanel;
    procedure FormShow( Sender : TObject );
    procedure EditCOD_CLIENTEKeyDown(
      Sender  : TObject;
      var Key : Word;
      Shift   : TShiftState );
    procedure EditCOD_PRODUTOKeyDown(
      Sender  : TObject;
      var Key : Word;
      Shift   : TShiftState );
    procedure FormKeyDown(
      Sender  : TObject;
      var Key : Word;
      Shift   : TShiftState );
    procedure BitBtnSaveItemClick( Sender : TObject );
    procedure BitBtnSaveOrderClick( Sender : TObject );
    procedure DBGridItemKeyDown(
      Sender  : TObject;
      var Key : Word;
      Shift   : TShiftState );
    procedure BitBtnLoadOrdersClick( Sender : TObject );
    procedure BitBtnCancelOrderClick( Sender : TObject );
    private
      FID_PEDIDO_VENDA : Int64;
      procedure StartOrder;
      procedure SetDataTable;
      procedure SeachClient;
      procedure SeachProduct( ACOD_PRODUTO : string );
      procedure InsertOrder;
      procedure GetIDOrder;
      procedure InsertOrderItem;
      procedure SaveOrderItem;
      procedure SaveOrder;
      procedure ClearProductSelect;
      procedure UpdateOrder;
      procedure UpdateOrderItemStep_1;
      procedure UpdateOrderItemStep_2;
      procedure DeleteOrderItemStep_1;
      procedure DeleteOrderItemStep_2;
      procedure DeleteOrderItem;
      procedure DeleteOrder;
      procedure CancelOrder;
      procedure SetID_PEDIDO_VENDA( const Value : Int64 );
    public
      procedure GetOrder;
      procedure GetOrderItem;
    published
      property ID_PEDIDO_VENDA : Int64
        read FID_PEDIDO_VENDA
        write SetID_PEDIDO_VENDA;
  end;

var
  FormMain : TFormMain;
  ID_PEDIDO_VENDA_ITEM : Int64;
  StringList : TStringList;
  VAL_ITEM : Double;
  Add : Boolean;

implementation

{$R *.dfm}

uses
  DataService_Impl,
  OrderList;

procedure TFormMain.SaveOrderItem;
  begin
    case Add of
      True :
        begin
          if DataService.FDQueryvw_pedido_venda.IsEmpty
          then
          begin
            try
              DataService.FDConnection.StartTransaction;
              try
                StringList := TStringList.Create;
                InsertOrder;
                GetIDOrder;
                InsertOrderItem;
                UpdateOrder;
                DataService.FDConnection.Commit;
                GetOrder;
                GetOrderItem;
              finally
                ShowMessage( 'Produto adicionado.' );
                FreeAndNil( StringList );
                ClearProductSelect;
                FormMain.BitBtnCancelOrder.Enabled := True;
              end;
            except
              on E : Exception do
                DataService.FDConnection.Rollback;
            end;
          end
          else
          begin
            try
              DataService.FDConnection.StartTransaction;
              try
                StringList := TStringList.Create;
                InsertOrderItem;
                UpdateOrder;
                DataService.FDConnection.Commit;
                GetOrder;
                GetOrderItem;
              finally
                ShowMessage( 'Produto adicionado.' );
                FreeAndNil( StringList );
                ClearProductSelect;
              end;
            except
              on E : Exception do
                DataService.FDConnection.Rollback;
            end;
          end;
        end;
      False :
        begin
          try
            DataService.FDConnection.StartTransaction;
            try
              StringList := TStringList.Create;
              UpdateOrderItemStep_2;
              UpdateOrder;
              DataService.FDConnection.Commit;
              GetOrder;
              GetOrderItem;
            finally
              ShowMessage( 'Produto alterado.' );
              FreeAndNil( StringList );
              ClearProductSelect;
            end;
          except
            on E : Exception do
              DataService.FDConnection.Rollback;
          end;
        end;
    end;
  end;

procedure TFormMain.BitBtnSaveOrderClick( Sender : TObject );
  begin
    SaveOrder;
  end;

procedure TFormMain.BitBtnCancelOrderClick( Sender : TObject );
  begin
    CancelOrder;
  end;

procedure TFormMain.BitBtnLoadOrdersClick( Sender : TObject );
  begin
    try
      FormOrderList := TFormOrderList.Create( Self );
      FormOrderList.ShowModal;
    finally
      FreeAndNil( FormOrderList );
    end;
  end;

procedure TFormMain.BitBtnSaveItemClick( Sender : TObject );
  begin
    SaveOrderItem;
  end;

procedure TFormMain.CancelOrder;
  begin
    if MessageDlg( 'Deseja realmente cancelar o pedido? ',
      TMsgDlgType.mtConfirmation, [ TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo ],
      0 ) = IDYES
    then
    begin
      try
        DataService.FDConnection.StartTransaction;
        try
          StringList := TStringList.Create;
          ID_PEDIDO_VENDA := DataService.FDQueryvw_pedido_vendaID_PEDIDO_VENDA.
            AsLargeInt;
          DeleteOrderItem;
          DeleteOrder;
          DataService.FDConnection.Commit;
        finally
          ShowMessage( 'Pedido cancelado.' );
          FreeAndNil( StringList );
          SaveOrder;
        end;
      except
        on E : Exception do
          DataService.FDConnection.Rollback;
      end;
    end;
  end;

procedure TFormMain.ClearProductSelect;
  begin
    EditCOD_PRODUTO.Enabled := True;
    EditCOD_PRODUTO.SetFocus;
    EditCOD_PRODUTO.SelectAll;
    DataService.FDQuerytb_produto.Close;
    EditQTD_ITEM.Clear;
    EditVAL_PRECO_VENDA.Clear;
  end;

procedure TFormMain.DBGridItemKeyDown(
  Sender  : TObject;
  var Key : Word;
  Shift   : TShiftState );
  begin
    case Key of
      VK_RETURN :
        UpdateOrderItemStep_1;
      VK_DELETE :
        DeleteOrderItemStep_1;
    end;
  end;

procedure TFormMain.DeleteOrder;
  begin
    StringList.Add( 'DELETE FROM TB_PEDIDO_VENDA' );
    StringList.Add( 'WHERE ID_PEDIDO_VENDA = ' + ID_PEDIDO_VENDA.ToString );
    DataService.FDCommand.CommandText := StringList;
    DataService.FDCommand.Execute;
    StringList.Clear;
  end;

procedure TFormMain.DeleteOrderItem;
  begin
    StringList.Add( 'DELETE FROM TB_PEDIDO_VENDA_ITEM' );
    StringList.Add( 'WHERE ID_PEDIDO_VENDA = ' + ID_PEDIDO_VENDA.ToString );
    DataService.FDCommand.CommandText := StringList;
    DataService.FDCommand.Execute;
    StringList.Clear;
  end;

procedure TFormMain.DeleteOrderItemStep_1;
  begin
    ID_PEDIDO_VENDA_ITEM :=
      DataService.FDQueryvw_pedido_venda_itemID_PEDIDO_VENDA_ITEM.AsLargeInt;
    try
      DataService.FDConnection.StartTransaction;
      try
        StringList := TStringList.Create;
        DeleteOrderItemStep_2;
        UpdateOrder;
        DataService.FDConnection.Commit;
        GetOrder;
        GetOrderItem;
      finally
        ShowMessage( 'Produto retirado.' );
        FreeAndNil( StringList );
        ClearProductSelect;
      end;
    except
      on E : Exception do
        DataService.FDConnection.Rollback;
    end;
  end;

procedure TFormMain.DeleteOrderItemStep_2;
  begin
    StringList.Add( 'DELETE FROM TB_PEDIDO_VENDA_ITEM' );
    StringList.Add( 'WHERE ID_PEDIDO_VENDA_ITEM = ' +
      ID_PEDIDO_VENDA_ITEM.ToString );
    DataService.FDCommand.CommandText := StringList;
    DataService.FDCommand.Execute;
    StringList.Clear;
  end;

procedure TFormMain.EditCOD_CLIENTEKeyDown(
  Sender  : TObject;
  var Key : Word;
  Shift   : TShiftState );
  begin
    if ( Key = VK_RETURN ) or ( Key = VK_TAB )
    then
      SeachClient;
  end;

procedure TFormMain.EditCOD_PRODUTOKeyDown(
  Sender  : TObject;
  var Key : Word;
  Shift   : TShiftState );
  begin
    if ( Key = VK_RETURN ) or ( Key = VK_TAB )
    then
    begin
      Add := True;
      SeachProduct( Trim( EditCOD_PRODUTO.Text ) );
    end;
  end;

procedure TFormMain.FormKeyDown(
  Sender  : TObject;
  var Key : Word;
  Shift   : TShiftState );
  begin
    if Key = VK_ESCAPE
    then
      Self.Close;
  end;

procedure TFormMain.FormShow( Sender : TObject );
  begin
    SetDataTable;
  end;

procedure TFormMain.GetIDOrder;
  begin
    DataService.FDQueryID_PEDIDO_VENDA.Close;
    DataService.FDQueryID_PEDIDO_VENDA.Open;
    ID_PEDIDO_VENDA := DataService.FDQueryID_PEDIDO_VENDAID.AsLargeInt;
  end;

procedure TFormMain.GetOrder;
  begin
    DataService.FDQueryvw_pedido_venda.Close;
    DataService.FDQueryvw_pedido_venda.Params[ 0 ].AsInteger := ID_PEDIDO_VENDA;
    DataService.FDQueryvw_pedido_venda.Open;
  end;

procedure TFormMain.GetOrderItem;
  begin
    DataService.FDQueryvw_pedido_venda_item.Close;
    DataService.FDQueryvw_pedido_venda_item.Params[ 0 ].AsInteger :=
      ID_PEDIDO_VENDA;
    DataService.FDQueryvw_pedido_venda_item.Open;
  end;

procedure TFormMain.InsertOrder;
  begin
    StringList.Add
      ( 'INSERT INTO TB_PEDIDO_VENDA(ID_CLIENTE, DAT_EMISSAO) VALUES(' );
    StringList.Add( DataService.FDQuerytb_clienteID_CLIENTE.AsString + ',' );
    StringList.Add( 'NOW()' );
    StringList.Add( ');' );
    DataService.FDCommand.CommandText := StringList;
    DataService.FDCommand.Execute;
    StringList.Clear;
  end;

procedure TFormMain.InsertOrderItem;
  begin
    StringList.Add
      ( 'INSERT INTO tb_pedido_venda_item(ID_PEDIDO_VENDA, ID_PRODUTO, QTD_ITEM, VAL_UNITARIO, VAL_ITEM) VALUES(' );
    StringList.Add( ID_PEDIDO_VENDA.ToString + ',' );
    StringList.Add( DataService.FDQuerytb_produtoID_PRODUTO.AsString + ',' );
    StringList.Add( Trim( EditQTD_ITEM.Text ) + ',' );
    StringList.Add( Trim( StringReplace( EditVAL_PRECO_VENDA.Text, ',', '.',
      [ rfReplaceAll ] ) ) + ',' );
    VAL_ITEM := StrToFloat( EditQTD_ITEM.Text ) *
      StrToFloat( EditVAL_PRECO_VENDA.Text );
    StringList.Add( VAL_ITEM.ToString );
    StringList.Add( ');' );
    DataService.FDCommand.CommandText := StringList;
    DataService.FDCommand.Execute;
    StringList.Clear;
  end;

procedure TFormMain.SaveOrder;
  begin
    ID_PEDIDO_VENDA := 0;
    VAL_ITEM := 0;
    DataService.FDQuerytb_cliente.Close;
    ClearProductSelect;
    StartOrder;
    EditCOD_CLIENTE.Clear;
    EditCOD_PRODUTO.Clear;
    EditCOD_CLIENTE.SetFocus;
    EditCOD_CLIENTE.SelectAll;
    FormMain.BitBtnCancelOrder.Enabled := False;
  end;

procedure TFormMain.SeachClient;
  begin
    DataService.FDQuerytb_cliente.Close;
    DataService.FDQuerytb_cliente.Params[ 0 ].AsString :=
      Trim( EditCOD_CLIENTE.Text );
    DataService.FDQuerytb_cliente.Open;
    if DataService.FDQuerytb_cliente.IsEmpty
    then
    begin
      ShowMessage( 'Cliente n�o encontrado.' );
      EditCOD_CLIENTE.SetFocus;
      EditCOD_CLIENTE.SelectAll;
      Exit;
    end
    else
    begin
      DataService.FDQueryvw_pedido_venda_all.Close;
      DataService.FDQueryvw_pedido_venda_all.Params[ 0 ].AsInteger :=
        DataService.FDQuerytb_clienteID_CLIENTE.AsInteger;
      DataService.FDQueryvw_pedido_venda_all.Open;
      BitBtnLoadOrders.Enabled :=
        ( not DataService.FDQueryvw_pedido_venda_all.IsEmpty );
    end;
  end;

procedure TFormMain.SeachProduct( ACOD_PRODUTO : string );
  begin
    DataService.FDQuerytb_produto.Close;
    DataService.FDQuerytb_produto.Params[ 0 ].AsString := ACOD_PRODUTO;
    DataService.FDQuerytb_produto.Open;
    if DataService.FDQuerytb_produto.IsEmpty
    then
    begin
      ShowMessage( 'Produto n�o encontrado.' );
      EditCOD_PRODUTO.SetFocus;
      EditCOD_PRODUTO.SelectAll;
      Exit;
    end
    else
      EditVAL_PRECO_VENDA.Text := FormatCurr( ',0.00',
        DataService.FDQuerytb_produtoVAL_PRECO_VENDA.AsFloat );
  end;

procedure TFormMain.SetDataTable;
  begin
    StartOrder;
    // ----------------------------------------------------------------
    DBGridItem.DataSource := DataService.DataSourcevw_pedido_venda_item;
    // ----------------------------------------------------------------
    DBTextID_PEDIDO_VENDA.DataField := 'ID_PEDIDO_VENDA';
    DBTextID_PEDIDO_VENDA.DataSource := DataService.DataSourcevw_pedido_venda;
    // ----------------------------------------------------------------
    DBTextCOD_CLIENTE.DataField := 'COD_CLIENTE';
    DBTextCOD_CLIENTE.DataSource := DataService.DataSourcevw_pedido_venda;
    // ----------------------------------------------------------------
    DBTextNOM_CLIENTE_.DataField := 'NOM_CLIENTE';
    DBTextNOM_CLIENTE_.DataSource := DataService.DataSourcevw_pedido_venda;
    // ----------------------------------------------------------------
    DBTextDAT_EMISSAO.DataField := 'DAT_EMISSAO';
    DBTextDAT_EMISSAO.DataSource := DataService.DataSourcevw_pedido_venda;
    // ----------------------------------------------------------------
    DBTextVAL_TOTAL.DataField := 'VAL_TOTAL';
    DBTextVAL_TOTAL.DataSource := DataService.DataSourcevw_pedido_venda;
    // ----------------------------------------------------------------
    DBTextNOM_CLIENTE.DataField := 'NOM_CLIENTE';
    DBTextNOM_CLIENTE.DataSource := DataService.DataSourcetb_cliente;
    // ----------------------------------------------------------------
    DBTextNOM_CIDADE.DataField := 'NOM_CIDADE';
    DBTextNOM_CIDADE.DataSource := DataService.DataSourcetb_cliente;
    // ----------------------------------------------------------------
    DBTextCOD_UF.DataField := 'COD_UF';
    DBTextCOD_UF.DataSource := DataService.DataSourcetb_cliente;
    // ----------------------------------------------------------------
    DBTextNOM_PRODUTO.DataField := 'NOM_PRODUTO';
    DBTextNOM_PRODUTO.DataSource := DataService.DataSourcetb_produto;
    // ----------------------------------------------------------------
  end;

procedure TFormMain.SetID_PEDIDO_VENDA( const Value : Int64 );
  begin
    FID_PEDIDO_VENDA := Value;
  end;

procedure TFormMain.StartOrder;
  begin
    DataService.FDQueryvw_pedido_venda.Close;
    DataService.FDQueryvw_pedido_venda.Params[ 0 ].AsInteger := - 1;
    DataService.FDQueryvw_pedido_venda.Open;
    // ----------------------------------------------------------------
    DataService.FDQueryvw_pedido_venda_item.Close;
    DataService.FDQueryvw_pedido_venda_item.Params[ 0 ].AsInteger := - 1;
    DataService.FDQueryvw_pedido_venda_item.Open;
  end;

procedure TFormMain.UpdateOrder;
  var
    Total : Double;
  begin
    DataService.FDQueryvw_pedido_venda_item.Close;
    DataService.FDQueryvw_pedido_venda_item.Params[ 0 ].AsInteger :=
      ID_PEDIDO_VENDA;
    DataService.FDQueryvw_pedido_venda_item.Open;
    Total := 0;
    DataService.FDQueryvw_pedido_venda_item.First;
    while not DataService.FDQueryvw_pedido_venda_item.Eof do
    begin
      Total := ( Total +
        DataService.FDQueryvw_pedido_venda_itemVAL_ITEM.AsFloat );
      DataService.FDQueryvw_pedido_venda_item.Next;
    end;
    DataService.FDCommand.CommandText.Clear;
    DataService.FDCommand.CommandText.Add
      ( 'UPDATE TB_PEDIDO_VENDA SET VAL_TOTAL = ' + Total.ToString );
    DataService.FDCommand.CommandText.Add( 'WHERE ID_PEDIDO_VENDA = ' +
      ID_PEDIDO_VENDA.ToString );
    DataService.FDCommand.Execute;
  end;

procedure TFormMain.UpdateOrderItemStep_1;
  begin
    Add := False;
    ID_PEDIDO_VENDA_ITEM :=
      DataService.FDQueryvw_pedido_venda_itemID_PEDIDO_VENDA_ITEM.AsLargeInt;
    SeachProduct( DataService.FDQueryvw_pedido_venda_itemCOD_PRODUTO.AsString );
    EditVAL_PRECO_VENDA.SetFocus;
    EditVAL_PRECO_VENDA.SelectAll;
    EditCOD_PRODUTO.Enabled := False;
  end;

procedure TFormMain.UpdateOrderItemStep_2;
  begin
    StringList.Add( 'UPDATE TB_PEDIDO_VENDA_ITEM SET' );
    StringList.Add( 'QTD_ITEM = ' + Trim( EditQTD_ITEM.Text ) + ',' );
    StringList.Add( 'VAL_UNITARIO = ' +
      Trim( StringReplace( EditVAL_PRECO_VENDA.Text, ',', '.', [ rfReplaceAll ]
      ) ) + ',' );
    VAL_ITEM := StrToFloat( EditQTD_ITEM.Text ) *
      StrToFloat( EditVAL_PRECO_VENDA.Text );
    StringList.Add( 'VAL_ITEM = ' + VAL_ITEM.ToString );
    StringList.Add( 'WHERE ID_PEDIDO_VENDA_ITEM = ' +
      ID_PEDIDO_VENDA_ITEM.ToString );
    DataService.FDCommand.CommandText := StringList;
    DataService.FDCommand.Execute;
    StringList.Clear;
  end;

end.
