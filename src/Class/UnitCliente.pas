unit UnitCliente;

interface

type

  TCliente = class( TObject )
    constructor Create; overload;
    destructor Destroy; override;
    private
      FIDCliente : Integer;
      FNome : string;
      FCodigo : string;
      FCidade : string;
      FUF : string;
      procedure SetNome( const Value : string );
      procedure SetCodigo( const Value : string );
      procedure SetCidade( const Value : string );
      procedure SetUF( const Value : string );
    public
      function GetIDCliente : Integer;
      procedure SetIDCliente( const Value : Integer );
    published
      property IDCliente : Integer
        read GetIDCliente
        write SetIDCliente;
      property Codigo : string
        read FCodigo
        write SetCodigo;
      property Nome : string
        read FNome
        write SetNome;
      property Cidade : string
        read FCidade
        write SetCidade;
      property UF : string
        read FUF
        write SetUF;
  end;

implementation

{ TCliente }

constructor TCliente.Create;
  begin
    inherited Create;
  end;

destructor TCliente.Destroy;
  begin
    inherited Destroy;
  end;

function TCliente.GetIDCliente : Integer;
  begin
    result := IDCliente;
  end;

procedure TCliente.SetCidade( const Value : string );
  begin
    FCidade := Value;
  end;

procedure TCliente.SetCodigo( const Value : string );
  begin
    FCodigo := Value;
  end;

procedure TCliente.SetIDCliente( const Value : Integer );
  begin
    IDCliente := Value;
  end;

procedure TCliente.SetNome( const Value : string );
  begin
    FNome := Value;
  end;

procedure TCliente.SetUF( const Value : string );
  begin
    FUF := Value;
  end;

end.
