unit RetCupom;

interface

type

  TRetCupom = class
  private
    Cupom: String;
    Valor: String;
    CodBandeira: string;
    CodRede: string;
    CodAutorizacao: string;
    Nsu: string;
    Parcelas: string;
    TxServico: string;
    BinCartao: string;
    UltimosDigitos: string;
    Cnpj: string;
    Cliente: string;
    NsuRede: string;
    VenctoCartao: string;
    Comprovante: string;
  public
    function GetCupom: string;
    procedure SetCupom(value: string);

    function GetValor: string;
    procedure SetValor(value: string);

    function GetCodBandeira: string;
    procedure SetCodBandeira(value: string);

    function GetCodRede: string;
    procedure SetCodRede(value: string);

    function GetCodAutorizacao: string;
    procedure SetCodAutorizacao(value: string);

    function GetNsu: string;
    procedure SetNsu(value: string);

    function GetParcelas: string;
    procedure SetParcelas(value: string);

    function GetTxServico: string;
    procedure SetTxServico(value: string);

    function GetBinCartao: string;
    procedure SetBinCartao(value: string);

    function GetUltimosDigitos: string;
    procedure SetUltimosDigitos(value: string);

    function GetCnpj: string;
    procedure SetCnpj(value: string);

    function GetCliente: string;
    procedure SetCliente(value: string);

    function GetNsuRede: string;
    procedure SetNsuRede(value: string);

    function GetVenctoCartao: string;
    procedure SetVenctoCartao(value: string);

    function GetComprovante: string;
    procedure SetComprovante(value: string);

    procedure New(Sender: TObject);
    // public Cupom read getCupom  write setCupom ;
  end;

implementation

function TRetCupom.GetCupom: string;
begin
  Result := Cupom;
end;

procedure TRetCupom.SetCupom(value: string);
begin
  Cupom := value;
end;

function TRetCupom.GetValor: string;
begin
  Result := Valor;
end;

procedure TRetCupom.SetValor(value: string);
begin
  Valor := value;
end;

function TRetCupom.GetCodBandeira: string;
begin
  Result := CodBandeira;
end;

procedure TRetCupom.SetCodBandeira(value: string);
begin
  CodBandeira := value;
end;

function TRetCupom.GetCodRede: string;
begin
  Result := CodRede;
end;

procedure TRetCupom.SetCodRede(value: string);
begin
  CodRede := value;
end;

function TRetCupom.GetCodAutorizacao: string;
begin
  Result := CodAutorizacao;
end;

procedure TRetCupom.SetCodAutorizacao(value: string);
begin
  CodAutorizacao := value;
end;

function TRetCupom.GetNsu: string;
begin
  Result := Nsu;
end;

procedure TRetCupom.SetNsu(value: string);
begin
  Nsu := value;
end;

function TRetCupom.GetParcelas: string;
begin
  Result := Parcelas;
end;

procedure TRetCupom.SetParcelas(value: string);
begin
  Parcelas := value;
end;

function TRetCupom.GetTxServico: string;
begin
  Result := TxServico;
end;

procedure TRetCupom.SetTxServico(value: string);
begin
  TxServico := value;
end;

function TRetCupom.GetBinCartao: string;
begin
  Result := BinCartao;
end;

procedure TRetCupom.SetBinCartao(value: string);
begin
  BinCartao := value;
end;

function TRetCupom.GetUltimosDigitos: string;
begin
  Result := UltimosDigitos;
end;

procedure TRetCupom.SetUltimosDigitos(value: string);
begin
  UltimosDigitos := value;
end;

function TRetCupom.GetCnpj: string;
begin
  Result := Cnpj;
end;

procedure TRetCupom.SetCnpj(value: string);
begin
  Cnpj := value;
end;

function TRetCupom.GetCliente: string;
begin
  Result := Cliente;
end;

procedure TRetCupom.SetCliente(value: string);
begin
  Cliente := value;
end;

function TRetCupom.GetNsuRede: string;
begin
  Result := NsuRede;
end;

procedure TRetCupom.SetNsuRede(value: string);
begin
  NsuRede := value;
end;

function TRetCupom.GetVenctoCartao: string;
begin
  Result := VenctoCartao;
end;

procedure TRetCupom.SetVenctoCartao(value: string);
begin
  VenctoCartao := value;
end;

function TRetCupom.GetComprovante: string;
begin
  Result := Comprovante;
end;

procedure TRetCupom.SetComprovante(value: string);
begin
  Comprovante := value;
end;

procedure TRetCupom.New(Sender: TObject);
begin
  //var
  // Cupom: string;
  //var
  // VenctoCartao: string;
end;

end.
