unit UnitProduto;

interface

type

  TProduto = class( TObject )
    constructor Create; overload;
    destructor Destroy; override;
    private
      FID : Integer;
      FCodigo : string;
      FPrecoVenda : Double;
      FNome : string;
      procedure SetID( const Value : Integer );
      procedure SetCodigo( const Value : string );
      procedure SetNome( const Value : string );
      procedure SetPrecoVenda( const Value : Double );
    published
      property ID : Integer
        read FID
        write SetID;
      property Codigo : string
        read FCodigo
        write SetCodigo;
      property Nome : string
        read FNome
        write SetNome;
      property PrecoVenda : Double
        read FPrecoVenda
        write SetPrecoVenda;
  end;

implementation

{ TProduto }

constructor TProduto.Create;
  begin
    inherited Create;
  end;

destructor TProduto.Destroy;
  begin
    inherited Destroy;
  end;

procedure TProduto.SetCodigo( const Value : string );
  begin
    FCodigo := Value;
  end;

procedure TProduto.SetID( const Value : Integer );
  begin
    FID := Value;
  end;

procedure TProduto.SetNome( const Value : string );
  begin
    FNome := Value;
  end;

procedure TProduto.SetPrecoVenda( const Value : Double );
  begin
    FPrecoVenda := Value;
  end;

end.
