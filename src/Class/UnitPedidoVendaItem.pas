unit UnitPedidoVendaItem;

interface

uses
  UnitProduto;

type
  TPedidoVendaItem = class(TObject)
    constructor Create; overload;
    destructor Destroy; override;
    private
      FProduto : TProduto;
      FValorUnitario : Double;
      FID : Integer;
      FQuantidade : Double;
      FValorItem : Double;
      procedure SetID( const Value : Integer );
      procedure SetProduto( const Value : TProduto );
      procedure SetQuantidade( const Value : Double );
      procedure SetValorItem( const Value : Double );
      procedure SetValorUnitario( const Value : Double );
    published
      property ID : Integer
        read FID
        write SetID;
      property Quantidade : Double
        read FQuantidade
        write SetQuantidade;
      property ValorUnitario : Double
        read FValorUnitario
        write SetValorUnitario;
      property ValorItem : Double
        read FValorItem
        write SetValorItem;
      property Produto : TProduto
        read FProduto
        write SetProduto;
  end;

implementation

{ TPedidoVendaItem }

constructor TPedidoVendaItem.Create;
  begin
    inherited Create;
  end;

destructor TPedidoVendaItem.Destroy;
  begin
    inherited Destroy;
  end;

procedure TPedidoVendaItem.SetID( const Value : Integer );
  begin
    FID := Value;
  end;

procedure TPedidoVendaItem.SetProduto( const Value : TProduto );
  begin
    FProduto := Value;
  end;

procedure TPedidoVendaItem.SetQuantidade( const Value : Double );
  begin
    FQuantidade := Value;
  end;

procedure TPedidoVendaItem.SetValorItem( const Value : Double );
  begin
    FValorItem := Value;
  end;

procedure TPedidoVendaItem.SetValorUnitario( const Value : Double );
  begin
    FValorUnitario := Value;
  end;

end.
