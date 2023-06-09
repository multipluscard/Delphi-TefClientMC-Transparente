unit ClassPrincipal;

interface

uses
  System.SysUtils, Dialogs;

type
  TClassPrincipal = class
      private
        cnpj: PAnsiChar;
        pdv: PAnsiChar;
        codloja: PAnsiChar;
        data: PAnsiChar;

        valor:PAnsiChar;
        cupom: PAnsiChar;
        comunicacao: Integer;
        nsu: PAnsiChar;
      public
          function GetCnpj: PAnsiChar;
          procedure SetCnpj(value: PAnsiChar);
  end;

implementation

//Metodos Gets e Sets
function TClassPrincipal.GetCnpj: PAnsiChar;
begin
  Result := cnpj;
end;

procedure TClassPrincipal.SetCnpj(value: PAnsiChar);
begin
  cnpj := value;
end;


var
  operacao: Integer;
  Retorno: Integer;


  cnpj_A: string;
  pdv_A: string;
  codloja_A: string;
  data_A: string;


function Transacionar(operacao: Integer): Boolean;
begin

end;

function GetParametros(): Boolean;
begin
  if cnpj_A.IsEmpty or pdv_A.IsEmpty or codloja_A.IsEmpty or
    (txbValor.Text = '') or (txbParcela.Text = '') or (txbCupom.Text = '') or
    (txbNsu.Text = '') then
  begin
    ShowMessage('Reveja os Dados enviados');
    Result := False;
  end
  else
  begin
    cnpjnovo := PAnsiChar(AnsiString(cnpj_A));

    cnpj := PAnsiChar(AnsiString(cnpj_A));
    pdv := PAnsiChar(AnsiString(pdv_A));
    codloja := PAnsiChar(AnsiString(codloja_A));
    data := PAnsiChar(AnsiString(data_A));

    cupom := PAnsiChar(AnsiString(txbCupom.Text));
    nsu := PAnsiChar(AnsiString(txbNsu.Text));
    Valor := PAnsiChar(AnsiString(txbValor.Text));
    parcela := StrToInt(txbParcela.Text);
    Result := True;
  end
end;

function ExibirTelaQrCode(QrCode: String; Origem: String;
  Valor: String): Boolean;
begin

end;

function RetornaErro(): Boolean;
begin
  if Retorno = 1 then
  begin
    ShowMessage('Erro genérico na execução');
  end;
  if Retorno = 30 then
  begin
    ShowMessage('Não foi encontrado o caminho do ClientD.exe');
  end;
  if Retorno = 31 then
  begin
    ShowMessage('ConfigMC.ini está vazio');
  end;
  if Retorno = 32 then
  begin
    ShowMessage('ClientD.exe não encontrado');
  end;
  if Retorno = 33 then
  begin
    ShowMessage('ClientD.exe não está em execução');
  end;
  if Retorno = 34 then
  begin
    ShowMessage('Erro ao iniciar ClientD.exe');
  end;
  if Retorno = 35 then
  begin
    ShowMessage('Não foi possível criar o arquivo de resposta');
  end;
  if Retorno = 36 then
  begin
    ShowMessage('Erro na manipulação do arquivo de resposta');
  end;
  if Retorno = 37 then
  begin
    ShowMessage('Erro na leitura do arquivo ConfigMC.ini');
  end;
  if Retorno = 38 then
  begin
    ShowMessage('Valor da transação com formato incorreto');
  end;
  if Retorno = 39 then
  begin
    ShowMessage('Executável de envio de transações não encontrado');
  end;
  if Retorno = 40 then
  begin
    ShowMessage('CNPJ Inválido ou no formato incorreto');
  end;
  if Retorno = 41 then
  begin
    ShowMessage('ClientD.exe está em processo de atualização');
  end;
  if Retorno = 42 then
  begin
    ShowMessage('A automação não está sendo executada no modo administrador');
  end;
end;

function LerArquivoAtributos(): Boolean;
var
  caminho: string;
  Arqsrc: TextFile;
  slinha: string;
  mydata: TDateTime;
  comunicacao: Integer;

begin
  try
    var
      arr: TArray<String>;

    caminho := ExpandFileName(GetCurrentDir + '\..\..\') +
      '\ArqCarregaDados.txt';
    AssignFile(Arqsrc, caminho);

{$I-}
    Reset(Arqsrc);
{$I+}
    if (IOResult <> 0) // verifica o resultado da operação de abertura
    then
      ShowMessage('Não conseguiu ler')
    else
    begin

      while not eof(Arqsrc) do
      begin

        readln(Arqsrc, slinha); // ler linha a linha
        arr := slinha.Split(['=']);
        if arr[0].Length < 2 then
          Continue;

        if arr[0] = 'CNPJ' then
          cnpj_A := arr[1];
        if arr[0] = 'PDV' then
          pdv_A := arr[1];
        if arr[0] = 'CODIGO_LOJA' then
          codloja_A := arr[1];

      end;

      mydata := Now;
      data_A := FormatDateTime('yyyyMMdd', mydata);
      comunicacao := 0;
    end;
    CloseFile(Arqsrc);

  except
    ShowMessage('Erro na atribuição dos dados do arquivo .txt');
  end;

end;

end.
