unit UnitPedidoVenda;

interface

uses
  UnitCliente,
  UnitPedidoVendaItem,
  System.Generics.Collections;

type
  TPedidoVenda = class( TObject )
    constructor Create; overload;
    destructor Destroy; override;
    private
      FID : Integer;
      FValorTotal : Double;
      FDataEmissao : TDateTime;
      FCliente : TCliente;
      FItems : TList< TPedidoVendaItem >;
      procedure SetID( const Value : Integer );
      procedure SetDataEmissao( const Value : TDateTime );
      procedure SetValorTotal( const Value : Double );
      procedure SetCliente( const Value : TCliente );
      procedure SetItems( const Value : TList< TPedidoVendaItem > );
    published
      property ID : Integer
        read FID
        write SetID;
      property DataEmissao : TDateTime
        read FDataEmissao
        write SetDataEmissao;
      property ValorTotal : Double
        read FValorTotal
        write SetValorTotal;
      property Cliente : TCliente
        read FCliente
        write SetCliente;
      property Items : TList< TPedidoVendaItem >
        read FItems
        write SetItems;
  end;

implementation

{ TPedidoVenda }

constructor TPedidoVenda.Create;
  begin
    inherited Create;
  end;

destructor TPedidoVenda.Destroy;
  begin
    inherited Destroy;
  end;

procedure TPedidoVenda.SetCliente( const Value : TCliente );
  begin
    FCliente := Value;
  end;

procedure TPedidoVenda.SetDataEmissao( const Value : TDateTime );
  begin
    FDataEmissao := Value;
  end;

procedure TPedidoVenda.SetID( const Value : Integer );
  begin
    FID := Value;
  end;

procedure TPedidoVenda.SetItems( const Value : TList< TPedidoVendaItem > );
  begin
    FItems := Value;
  end;

procedure TPedidoVenda.SetValorTotal( const Value : Double );
  begin
    FValorTotal := Value;
  end;

end.
