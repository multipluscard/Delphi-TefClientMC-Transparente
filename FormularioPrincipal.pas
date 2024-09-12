unit FormularioPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.Buttons, System.StrUtils, FormMensagem, FormularioAtributos,
  RetCupom, System.Generics.Collections, Dialogs, Util;

type
  TTransVC = class
  public
    exibir: string;
    valor: string;
  end;

type
  TFormPrincipal = class(TForm)
    panelAtributos: TPanel;
    panelTransacoes: TPanel;
    tabTipo: TPageControl;
    tabCartao: TTabSheet;
    tabAdm: TTabSheet;
    tabQR: TTabSheet;
    tabSubCartoes: TPageControl;
    tabCredito: TTabSheet;
    tabDebito: TTabSheet;
    tabFrota: TTabSheet;
    tabVoucher: TTabSheet;
    btnCredito: TButton;
    btnCreditoAVista: TButton;
    btnCreditoParceladoLoja: TButton;
    btnAtributos: TBitBtn;
    btnLimpaLog: TBitBtn;
    lbValor: TLabel;
    lbParcela: TLabel;
    lbCupom: TLabel;
    lbNSU: TLabel;
    txbParcela: TEdit;
    txbCupom: TEdit;
    txbNsu: TEdit;
    checkBoxMultiplosCartoes: TCheckBox;
    btnConfirma: TButton;
    btnDesfaz: TButton;
    checkBoxTodas: TCheckBox;
    lbTransacoes: TLabel;
    txbValor: TEdit;
    btnDebitoAVista: TButton;
    btnDebito: TButton;
    btnFrota: TButton;
    btnVoucher: TButton;
    btnCreditoParceladoAdm: TButton;
    btnConsulta: TButton;
    btnCancelar: TButton;
    btnPreAutorizacao: TButton;
    btnConfPreAutorizacao: TButton;
    btnCancPreAutorizacao: TButton;
    btnConsultaDebito: TButton;
    btnExcluirBins: TButton;
    btnReimpressao: TButton;
    btnColetaCpf: TButton;
    btnMenuPSP: TButton;
    btnPSPClient: TButton;
    btnMercadoPago: TButton;
    btnPicPay: TButton;
    btnCancelarEstorno: TButton;
    btnStatusTransacao: TButton;
    lbLog: TMemo;
    transacoespendentes: TListBox;
    Label1: TLabel;
    procedure btnAtributosClick(Sender: TObject);
    procedure checkBoxMultiplosCartoesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCreditoClick(Sender: TObject);
    procedure btnCreditoAVistaClick(Sender: TObject);
    procedure btnCreditoParceladoLojaClick(Sender: TObject);
    procedure btnCreditoParceladoAdmClick(Sender: TObject);
    procedure btnDebitoAVistaClick(Sender: TObject);
    procedure btnDebitoClick(Sender: TObject);
    procedure btnFrotaClick(Sender: TObject);
    procedure btnVoucherClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConsultaClick(Sender: TObject);
    procedure btnConfPreAutorizacaoClick(Sender: TObject);
    procedure btnCancPreAutorizacaoClick(Sender: TObject);
    procedure btnPreAutorizacaoClick(Sender: TObject);
    procedure btnConsultaDebitoClick(Sender: TObject);
    procedure btnExcluirBinsClick(Sender: TObject);
    procedure btnColetaCpfClick(Sender: TObject);
    procedure btnReimpressaoClick(Sender: TObject);
    procedure btnLimpaLogClick(Sender: TObject);
    procedure btnMenuPSPClick(Sender: TObject);
    procedure btnPSPClientClick(Sender: TObject);
    procedure btnMercadoPagoClick(Sender: TObject);
    procedure btnPicPayClick(Sender: TObject);
    procedure btnStatusTransacaoClick(Sender: TObject);
    procedure btnCancelarEstornoClick(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure btnDesfazClick(Sender: TObject);

  private
    { Private declarations }
    operacao: Integer;
    function Transacionar(operacao: Integer): Boolean;
    function GetParametros(): Boolean;
    function ExibirTelaQrCode(QrCode: String; Origem: String;
      valor: String): Boolean;
    function RetornaErro(): Boolean;

  public

  end;
  // DLL

function IniciaFuncaoMCInterativo(iComando: Integer; sCnpjCliente: PAnsiChar;
  iParcela: Integer; sCupom: PAnsiChar; sValor: PAnsiChar; sNsu: PAnsiChar;
  sData: PAnsiChar; sNumeroPDV: PAnsiChar; sCodigoLoja: PAnsiChar;
  sTipoComunicacao: Integer; sParametro: PAnsiChar): Integer; stdcall;
  external 'TefClientmc.dll';

function AguardaFuncaoMCInterativo(): PAnsiChar; stdcall;
  external 'TefClientmc.dll';

function ContinuaFuncaoMCInterativo(sInformacao: PAnsiChar): Integer; stdcall;
  external 'TefClientmc.dll';

function FinalizaFuncaoMCInterativo(iComando: Integer; sCnpjCliente: PAnsiChar;
  iParcela: Integer; sCupom: PAnsiChar; sValor: PAnsiChar; sNsu: PAnsiChar;
  sData: PAnsiChar; sNumeroPDV: PAnsiChar; sCodigoLoja: PAnsiChar;
  sTipoComunicacao: Integer; sParametro: PAnsiChar): Integer; stdcall;
  external 'TefClientmc.dll';

function CancelarFluxoMCInterativo(): Integer; stdcall;
  external 'TefClientmc.dll';

var
  mydata: TDateTime;
  FAtributos: TFormAtributos;
  FormPrincipal: TFormPrincipal;
  fMensagem: TFormMens;

  NovaVenda: Boolean;
  InsereNovoCartao: Boolean;

  Retorno: Integer;
  cnpj_A: string;
  pdv_A: string;
  codloja_A: string;
  data_A: string;

  valor: string;
  cupom: string;
  nsu: string;
  parcela: Integer;
  comunicacao: Integer;

  lstCupons: TObjectList<TRetCupom>;
  lstExibicao: TList<TTransVC>;
  dadosCupom: TRetCupom;
  Util: TRetUtil;

implementation

{$R *.dfm}

function LerArquivoAtributos(): Boolean;
var
  Arqsrc: TextFile;
  caminho: string;
  arr: TArray<String>;
  slinha: string;
begin
  try
    caminho := ExpandFileName(GetCurrentDir + '\..\..\') +
      '\ArqCarregaDados.txt';
    AssignFile(Arqsrc, caminho);

{$I-}
    Reset(Arqsrc);
{$I+}
    if (IOResult <> 0) then
      ShowMessage('Não conseguiu ler')
    else
    begin

      while not eof(Arqsrc) do
      begin

        readln(Arqsrc, slinha);
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

function TFormPrincipal.RetornaErro: Boolean;
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

function TFormPrincipal.GetParametros(): Boolean;
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
    cupom := txbCupom.Text;
    nsu := txbNsu.Text;
    valor := txbValor.Text;
    parcela := StrToInt(txbParcela.Text);

    Result := True;
  end

end;

function TFormPrincipal.Transacionar(operacao: Integer): Boolean;
var
  vMsg: TStringList;
  retFim: Integer;
  arrMsg: TArray<string>;
  respFMsg: PAnsiChar;
  strRetAguardaFMCInt: PAnsiChar;
  confirmar: Boolean;
var
  TarrMsg: Integer;
begin
  Util := TRetUtil.Create;
  if GetParametros() = True then
  begin
    Retorno := IniciaFuncaoMCInterativo(operacao, PAnsiChar(AnsiString(cnpj_A)),
      parcela, PAnsiChar(AnsiString(cupom)), PAnsiChar(AnsiString(valor)),
      PAnsiChar(AnsiString(nsu)), PAnsiChar(AnsiString(data_A)),
      PAnsiChar(AnsiString(pdv_A)), PAnsiChar(AnsiString(codloja_A)),
      comunicacao, '');

    mydata := Now;
    lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) +
      '- IniciaFuncaoMCInterativo()');

    Util.AdicionaLog('IniciaFuncaoMCInterativo()', '');

    if (Retorno = 0) then
    begin

      var
        retMsg: PAnsiChar := '';
      var
        strComprovante: string := '';
      var
        nsuRet: string := '';
      var
        strCupom: string := '';

      confirmar := True;
      vMsg := TStringList.Create;

      while (retMsg <> '[ERROABORTAR]') and (retMsg <> '[RETORNO]') and
        (retMsg <> '[ERRODISPLAY]') do
      begin
        strRetAguardaFMCInt := AguardaFuncaoMCInterativo();
        Util.AdicionaLog(strRetAguardaFMCInt, '');

        if strRetAguardaFMCInt <> '' then
        begin
          lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) + '-' +
            strRetAguardaFMCInt);
          arrMsg := SplitString(strRetAguardaFMCInt, '#');
          retMsg := PAnsiChar(AnsiString(arrMsg[0]));
        end
        else
        begin
          arrMsg := nil;
          retMsg := '';
        end;

        TarrMsg := Length(arrMsg);

        if retMsg = '[MENU]' then
        begin
          if TarrMsg > 2 then
          begin
            fMensagem := TFormMens.Create(Application);
            fMensagem.lMensagem.Caption := arrMsg[2].Replace('|', sLineBreak);
          end
          else
          begin
            fMensagem := TFormMens.Create(nil);
            fMensagem.Caption := arrMsg[0];
            fMensagem.lMensagem.Caption := arrMsg[1].Replace('|', sLineBreak);
          end;

          fMensagem.ShowModal;

          if fMensagem.Cancelar = True then
          begin
            CancelarFluxoMCInterativo();
            Util.AdicionaLog('CancelarFluxoMCInterativo()', '');
            ShowMessage('Fluxo Cancelado');
            retMsg := '[ERROABORTAR]';
            lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) +
              ' - Fluxo Cancelado');
            Util.AdicionaLog('Fluxo Cancelado', '');
          end
          else
          begin
            respFMsg := PAnsiChar(AnsiString(fMensagem.eResposta.Text));
            ContinuaFuncaoMCInterativo(respFMsg);
          end;
        end;

        if retMsg = '[PERGUNTA]' then
        begin
          fMensagem := TFormMens.Create(nil);
          fMensagem.Caption := arrMsg[1];
          fMensagem.lMensagem.Caption := arrMsg[2].Replace('|', sLineBreak);
          fMensagem.ShowModal;

          if fMensagem.Cancelar = True then
          begin
            CancelarFluxoMCInterativo();
            Util.AdicionaLog('CancelarFluxoMCInterativo()', '');
            ShowMessage('Fluxo Cancelado');
            retMsg := '[ERROABORTAR]';
            lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) +
              ' - Fluxo Cancelado');
            Util.AdicionaLog('Fluxo Cancelado', '');
          end
          else
          begin
            respFMsg := PAnsiChar(AnsiString(fMensagem.eResposta.Text));
            ContinuaFuncaoMCInterativo(respFMsg);
          end
        end;

        if retMsg = '[MSG]' then
        begin
          if TarrMsg >= 2 then
          begin
            if arrMsg[1].Contains('SALDO') and (not arrMsg[1].Contains('RETIRE'))
            then
            begin
              fMensagem := TFormMens.Create(nil);
              fMensagem.Caption := arrMsg[0];
              fMensagem.lMensagem.Caption := arrMsg[1].Replace('|', sLineBreak);
              fMensagem.ShowModal;
            end;
          end;
        end;

        if retMsg = '[ERRODISPLAY]' then
        begin
          fMensagem := TFormMens.Create(nil);
          fMensagem.Caption := arrMsg[0];
          fMensagem.lMensagem.Caption := arrMsg[1].Replace('|', sLineBreak);
          fMensagem.ShowModal;

          if fMensagem.Cancelar = True then
          begin
            CancelarFluxoMCInterativo();
            Util.AdicionaLog('CancelarFluxoMCInterativo()', '');
            ShowMessage('Fluxo Cancelado');
            retMsg := '[ERROABORTAR]';
            lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) +
              ' - Fluxo Cancelado');
            Util.AdicionaLog('Fluxo Cancelado', '');
          end
          else
          begin
            respFMsg := PAnsiChar(AnsiString(fMensagem.eResposta.Text));
            ContinuaFuncaoMCInterativo(respFMsg);
          end;
        end;
        Sleep(500);

        vMsg := nil;
        vMsg := TStringList.Create;
        respFMsg := nil;
      end;

      if retMsg = '[ERROABORTAR]' then
      begin
        ShowMessage(retMsg);
      end;

      if retMsg = '[RETORNO]' then
      begin

        var
          auxUltimoRet: string := AguardaFuncaoMCInterativo();
        lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) + auxUltimoRet);

        Sleep(500);

        if TarrMsg > 2 then
        begin
          if (operacao > 50) and (operacao < 60) then
          begin
            try
              FileCreate(Application.ExeName + 'concluiupix.txt');
            except
              on E: Exception do
                Util.AdicionaLog('Erro - ' + E.Message, '');
            end;
          end;

          strCupom := String(arrMsg[15].Replace('CAMPO122=', '').Replace('|', sLineBreak)
            .Replace('CORTAR', '-------------------------------'));

          var
          auxCupom := strCupom + '-------------------------------' + sLineBreak
            + sLineBreak + strCupom;
          nsuRet := String(arrMsg[5].Replace('CAMPO0133=', ''));

        end;

        if TarrMsg = 2 then
        begin
          if arrMsg[1].Contains('CPF') then
          begin
            var
            aux := arrMsg[1].Split(['=']);
            strCupom := 'CPF Coletado: ' + aux[1];
          end
          else
          begin
            var
            aux := arrMsg[1].Replace('RETORNO', '').Replace('|', sLineBreak);
            strCupom := aux;
          end;
        end;

        ShowMessage(strCupom);
        ShowMessage(System.String.Join(sLineBreak, arrMsg));
        retFim := 0;

        if (operacao <> 98) and (operacao <> 99) then
        begin
          if confirmar then
          begin
            retFim := FinalizaFuncaoMCInterativo(98,
              PAnsiChar(AnsiString(cnpj_A)), parcela,
              PAnsiChar(AnsiString(cupom)), PAnsiChar(AnsiString(valor)),
              PAnsiChar(AnsiString(nsuRet)), PAnsiChar(AnsiString(data_A)),
              PAnsiChar(AnsiString(pdv_A)), PAnsiChar(AnsiString(codloja_A)),
              comunicacao, '');

          end
          else
          begin
            retFim := FinalizaFuncaoMCInterativo(99,
              PAnsiChar(AnsiString(cnpj_A)), parcela,
              PAnsiChar(AnsiString(cupom)), PAnsiChar(AnsiString(valor)),
              PAnsiChar(AnsiString(nsuRet)), PAnsiChar(AnsiString(data_A)),
              PAnsiChar(AnsiString(pdv_A)), PAnsiChar(AnsiString(codloja_A)),
              comunicacao, '');
          end;

          Util.AdicionaLog('FinalizaFuncaoMCInterativo()', '');

          var
            strAguardaFMCInt: string := AguardaFuncaoMCInterativo();

          var
            count: Integer := 0;

          while (not strAguardaFMCInt.Contains('RETORNO')) and (count < 15) do
          begin
            lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) +
              strAguardaFMCInt);
            strAguardaFMCInt := AguardaFuncaoMCInterativo();
            count := count + 1;
          end;

          lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) +
            strAguardaFMCInt);

        end

        else
        begin
          retFim := 0;
        end;

        if retFim = 0 then
        begin
          lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) +
            ' - FIM DA TRANSAÇÃO');
        end
        else
        begin
          lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) + ' - ERRO: ');
        end;
      end;

    end
    else
    begin
      RetornaErro();
      ShowMessage('Erro - IniciaFuncaoMCInterativo - Codigo do Erro: ' +
        Retorno.ToString());
      Util.AdicionaLog('Erro - IniciaFuncaoMCInterativo', '');
    end
  end
end;

function TFormPrincipal.ExibirTelaQrCode(QrCode: String; Origem: String;
  valor: String): Boolean;
begin
  ContinuaFuncaoMCInterativo('1');
end;

procedure TFormPrincipal.btnAtributosClick(Sender: TObject);
begin
  if FAtributos = nil then
  begin
    FAtributos := TFormAtributos.Create(comunicacao, cnpj_A, codloja_A,
      data_A, pdv_A);
    FAtributos.ShowModal;
    if Assigned(FAtributos) then
    begin
      cnpj_A := FAtributos.GetCnpj();
      codloja_A := FAtributos.GetCodLoja();
      pdv_A := FAtributos.GetPdv();
      comunicacao := FAtributos.GetComunicao();
      FAtributos := TFormAtributos.Create(comunicacao, cnpj_A, codloja_A,
        data_A, pdv_A);
    end;
  end
  else
  begin
    cnpj_A := FAtributos.GetCnpj();
    codloja_A := FAtributos.GetCodLoja();
    pdv_A := FAtributos.GetPdv();
    comunicacao := FAtributos.GetComunicao();
    FAtributos := TFormAtributos.Create(comunicacao, cnpj_A, codloja_A,
      data_A, pdv_A);
    FAtributos.ShowModal;
  end;
end;

procedure TFormPrincipal.btnCancelarClick(Sender: TObject);
begin
  Transacionar(5);
end;

procedure TFormPrincipal.btnCancelarEstornoClick(Sender: TObject);
begin
  Transacionar(54);
end;

procedure TFormPrincipal.btnCancPreAutorizacaoClick(Sender: TObject);
begin
  Transacionar(17);
end;

procedure TFormPrincipal.btnColetaCpfClick(Sender: TObject);
begin
  Transacionar(200);
end;

procedure TFormPrincipal.btnConfirmaClick(Sender: TObject);
var
  parc: Integer;
  iTrans: Integer;
  paramConfConfi: Integer;
  sNsu: string;
  nsuConf: string;

begin
  paramConfConfi := 98;
  nsuConf := '';

  if (checkBoxTodas.Checked = True) then
  begin

    for var itens in lstCupons do
    begin
      var
      auxParc := StrToInt(itens.GetParcelas);

      if auxParc = 0 then
      begin
        parc := 1;
      end
      else
      begin
        parc := auxParc;
      end;

      sNsu := itens.GetNsu;

      if itens <> lstCupons.Last then
        sNsu := sNsu + '*';

      var
      retFim := FinalizaFuncaoMCInterativo(paramConfConfi,
        PAnsiChar(AnsiString(cnpj_A)), parcela, PAnsiChar(AnsiString(cupom)),
        PAnsiChar(AnsiString(valor)), PAnsiChar(AnsiString(sNsu)),
        PAnsiChar(AnsiString(data_A)), PAnsiChar(AnsiString(pdv_A)),
        PAnsiChar(AnsiString(codloja_A)), comunicacao, '');

      var
      strings := ' - Retorno Confirmação/Desfazimento - (%d)';
      strings := strings + ' : (%d)';
      var
      strings2 := ' - (%d) (%s) (%d) (%s) (%s) (%s) (%s) (%s) (%s) (%d)';

      Util.AdicionaLog(Format(strings2, [paramConfConfi, cnpj_A, parc,
        PAnsiChar(itens.GetCupom), PAnsiChar(itens.GetValor), PAnsiChar(sNsu),
        data_A, pdv_A, codloja_A, comunicacao]), '');

      Util.AdicionaLog(Format(strings, [paramConfConfi, retFim]), '');

      lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) + Format(strings,
        [paramConfConfi, retFim]));

      lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) + Format(strings2,
        [paramConfConfi, cnpj_A, parc, PAnsiChar(itens.GetCupom),
        PAnsiChar(itens.GetValor), PAnsiChar(sNsu), data_A, pdv_A, codloja_A,
        comunicacao]));

      nsuConf := itens.GetNsu;

      var
        strAguardaFMCInt: string := AguardaFuncaoMCInterativo();

      var
        count: Integer := 0;

      while (not strAguardaFMCInt.Contains('RETORNO')) and (count < 15) do
      begin
        lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) +
          strAguardaFMCInt);
        strAguardaFMCInt := AguardaFuncaoMCInterativo();
        count := count + 1;
      end;

      lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) + strAguardaFMCInt);

    end;

    for var itens in lstCupons do
    begin

      var
      auxCupom := itens.GetComprovante + '-------------------------------' +
        sLineBreak + sLineBreak + itens.GetComprovante;
      ShowMessage(itens.GetComprovante);

    end;

    transacoespendentes.Items.Clear;
    lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) +
      ' - FIM DA TRANSAÇÃO');
    lbLog.Refresh;
    checkBoxMultiplosCartoes.Checked := False;
  end
  else
  begin
    if transacoespendentes.ItemIndex = -1 then
    begin
      iTrans := 0;
    end
    else
    begin
      iTrans := transacoespendentes.ItemIndex;
    end;

    var
    transacao := lstCupons[iTrans];
    ShowMessage(transacao.GetComprovante);

    var
    auxParc := StrToInt(transacao.GetParcelas);

    if auxParc = 0 then
    begin
      parc := 1;
    end
    else
    begin
      parc := auxParc;
    end;

    sNsu := transacao.GetNsu;

    if lstCupons.count > 1 then
      sNsu := sNsu + '*';

    var
    retFim := FinalizaFuncaoMCInterativo(paramConfConfi,
      PAnsiChar(AnsiString(cnpj_A)), parcela, PAnsiChar(AnsiString(cupom)),
      PAnsiChar(AnsiString(valor)), PAnsiChar(AnsiString(sNsu)),
      PAnsiChar(AnsiString(data_A)), PAnsiChar(AnsiString(pdv_A)),
      PAnsiChar(AnsiString(codloja_A)), comunicacao, '');

    var
    strings := ' - Retorno Confirmação/Desfazimento - (%d)';
    strings := strings + ' : (%d)';
    var
    strings2 := ' - (%d) (%s) (%d) (%s) (%s) (%s) (%s) (%s) (%s) (%d)';

    Util.AdicionaLog(Format(strings2, [paramConfConfi, cnpj_A, parc,
      PAnsiChar(transacao.GetCupom), PAnsiChar(transacao.GetValor),
      PAnsiChar(transacao.GetNsu), data_A, pdv_A, codloja_A, comunicacao]), '');

    Util.AdicionaLog(Format(strings, [paramConfConfi, retFim]), '');

    lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) + Format(strings,
      [paramConfConfi, retFim]));
    lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) + Format(strings2,
      [paramConfConfi, cnpj_A, parc, PAnsiChar(transacao.GetCupom),
      PAnsiChar(transacao.GetValor), PAnsiChar(transacao.GetNsu), data_A, pdv_A,
      codloja_A, comunicacao]));

    lstCupons.Delete(iTrans);

    transacoespendentes.Items.Delete(iTrans);
    transacoespendentes.Refresh;

    if lstCupons.count = 0 then
    begin
      lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) +
        '- FIM DA TRANSAÇÃO');
      lbLog.Refresh;
      checkBoxMultiplosCartoes.Checked := False;
    end;

  end;
end;

procedure TFormPrincipal.btnConfPreAutorizacaoClick(Sender: TObject);
begin
  Transacionar(16);
end;

procedure TFormPrincipal.btnConsultaClick(Sender: TObject);
begin
  Transacionar(9);
end;

procedure TFormPrincipal.btnConsultaDebitoClick(Sender: TObject);
begin
  Transacionar(10);
end;

procedure TFormPrincipal.btnCreditoAVistaClick(Sender: TObject);
begin
  Transacionar(0);
end;

procedure TFormPrincipal.btnCreditoClick(Sender: TObject);
begin
  Transacionar(1);
end;

procedure TFormPrincipal.btnCreditoParceladoAdmClick(Sender: TObject);
begin
  Transacionar(3);
end;

procedure TFormPrincipal.btnCreditoParceladoLojaClick(Sender: TObject);
begin
  Transacionar(2);
end;

procedure TFormPrincipal.btnDebitoAVistaClick(Sender: TObject);
begin
  Transacionar(20);
end;

procedure TFormPrincipal.btnDebitoClick(Sender: TObject);
begin
  Transacionar(4);
end;

procedure TFormPrincipal.btnDesfazClick(Sender: TObject);
begin
  var
  paramConfConfi := 99;
  var
  nsuConf := '';
  if (checkBoxTodas.Checked = True) then
  begin
    for var itens in lstCupons do
    begin
      var
        parc: Integer;
      var
      auxParc := StrToInt(itens.GetParcelas);
      if auxParc = 0 then
      begin
        parc := 1;
      end
      else
      begin
        parc := auxParc;
      end;

      var
      sNsu := itens.GetNsu;

      if itens <> lstCupons.Last then
        sNsu := sNsu + '*';

      var
      retFim := FinalizaFuncaoMCInterativo(paramConfConfi,
        PAnsiChar(AnsiString(cnpj_A)), parcela, PAnsiChar(AnsiString(cupom)),
        PAnsiChar(AnsiString(valor)), PAnsiChar(AnsiString(nsu)),
        PAnsiChar(AnsiString(data_A)), PAnsiChar(AnsiString(pdv_A)),
        PAnsiChar(AnsiString(codloja_A)), comunicacao, '');
      var
      strings := ' - Retorno Confirmação/Desfazimento - (%d)';
      strings := strings + ' : (%d)';
      var
      strings2 := ' - (%d) (%s) (%d) (%s) (%s) (%s) (%s) (%s) (%s) (%d)';

      Util.AdicionaLog(Format(strings2, [paramConfConfi, cnpj_A, parc,
        PAnsiChar(itens.GetCupom), PAnsiChar(itens.GetValor), PAnsiChar(sNsu),
        data_A, pdv_A, codloja_A, comunicacao]), '');
      Util.AdicionaLog(Format(strings, [paramConfConfi, retFim]), '');

      lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) + Format(strings,
        [paramConfConfi, retFim]));
      lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) + Format(strings2,
        [paramConfConfi, cnpj_A, parc, PAnsiChar(itens.GetCupom),
        PAnsiChar(itens.GetValor), PAnsiChar(sNsu), data_A, pdv_A, codloja_A,
        comunicacao]));

      nsuConf := itens.GetNsu;
      var
        strAguardaFMCInt: string := AguardaFuncaoMCInterativo();

      var
        count: Integer := 0;

      while (not strAguardaFMCInt.Contains('RETORNO')) and (count < 15) do
      begin
        lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) +
          strAguardaFMCInt);
        strAguardaFMCInt := AguardaFuncaoMCInterativo();
        count := count + 1;
      end;

      lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) + strAguardaFMCInt);

    end;

    for var itens in lstCupons do
    begin
      var
      auxCupom := itens.GetComprovante + '-------------------------------' +
        sLineBreak + sLineBreak + itens.GetComprovante;
      ShowMessage(itens.GetComprovante);
    end;

    transacoespendentes.Items.Clear;
    lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) +
      ' - FIM DA TRANSAÇÃO');
    lbLog.Refresh;
    checkBoxMultiplosCartoes.Checked := False;
  end
  else
  begin
    var
      iTrans: Integer;
    var
      auxParc: Integer;
    var
      parc: Integer;
    if transacoespendentes.ItemIndex = -1 then
    begin
      iTrans := 0;
    end
    else
    begin
      iTrans := transacoespendentes.ItemIndex;
    end;

    var
    transacao := lstCupons[iTrans];
    ShowMessage(transacao.GetComprovante);

    auxParc := StrToInt(transacao.GetParcelas);

    if auxParc = 0 then
    begin
      parc := 1;
    end
    else
    begin
      parc := auxParc;
    end;

    var
    sNsu := transacao.GetNsu;

    if lstCupons.count > 1 then
      sNsu := sNsu + '*';

    var
    retFim := FinalizaFuncaoMCInterativo(paramConfConfi,
      PAnsiChar(AnsiString(cnpj_A)), parcela, PAnsiChar(AnsiString(cupom)),
      PAnsiChar(AnsiString(valor)), PAnsiChar(AnsiString(nsu)),
      PAnsiChar(AnsiString(data_A)), PAnsiChar(AnsiString(pdv_A)),
      PAnsiChar(AnsiString(codloja_A)), comunicacao, '');

    var
    strings := ' - Retorno Confirmação/Desfazimento - (%d)';
    strings := strings + ' : (%d)';
    var
    strings2 := ' - (%d) (%s) (%d) (%s) (%s) (%s) (%s) (%s) (%s) (%d)';

    Util.AdicionaLog(Format(strings, [paramConfConfi, retFim]), '');
    Util.AdicionaLog(Format(strings2, [paramConfConfi, cnpj_A, parc,
      PAnsiChar(transacao.GetCupom), PAnsiChar(transacao.GetValor),
      PAnsiChar(transacao.GetNsu), data_A, pdv_A, codloja_A, comunicacao]), '');
    lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) + Format(strings,
      [paramConfConfi, retFim]));
    lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) + Format(strings2,
      [paramConfConfi, cnpj_A, parc, PAnsiChar(transacao.GetCupom),
      PAnsiChar(transacao.GetValor), PAnsiChar(transacao.GetNsu), data_A, pdv_A,
      codloja_A, comunicacao]));

    lstCupons.Delete(iTrans);

    transacoespendentes.Items.Delete(iTrans);
    transacoespendentes.Refresh;
    if lstCupons.count = 0 then
    begin
      lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) +
        '- FIM DA TRANSAÇÃO');
      checkBoxMultiplosCartoes.Checked := False;
    end;

  end;

end;

procedure TFormPrincipal.btnExcluirBinsClick(Sender: TObject);
begin
  try
    if GetParametros() = True then
    begin
      var
      ret := IniciaFuncaoMCInterativo(110, PAnsiChar(AnsiString(cnpj_A)),
        parcela, PAnsiChar(AnsiString(cupom)), PAnsiChar(AnsiString(valor)),
        PAnsiChar(AnsiString(nsu)), PAnsiChar(AnsiString(data_A)),
        PAnsiChar(AnsiString(pdv_A)), PAnsiChar(AnsiString(codloja_A)),
        comunicacao, '');
    end;
  except
    ShowMessage('Erro');
  end;
end;

procedure TFormPrincipal.btnFrotaClick(Sender: TObject);
begin
  Transacionar(11);
end;

procedure TFormPrincipal.btnLimpaLogClick(Sender: TObject);
begin
  lbLog.Clear;
end;

procedure TFormPrincipal.btnMenuPSPClick(Sender: TObject);
begin
  Transacionar(50);
end;

procedure TFormPrincipal.btnMercadoPagoClick(Sender: TObject);
begin
  Transacionar(52);
end;

procedure TFormPrincipal.btnPicPayClick(Sender: TObject);
begin
  Transacionar(53);
end;

procedure TFormPrincipal.btnPreAutorizacaoClick(Sender: TObject);
begin
  Transacionar(15);
end;

procedure TFormPrincipal.btnPSPClientClick(Sender: TObject);
begin
  Transacionar(51);
end;

procedure TFormPrincipal.btnReimpressaoClick(Sender: TObject);
begin
  Transacionar(6);
end;

procedure TFormPrincipal.btnStatusTransacaoClick(Sender: TObject);
begin
  Transacionar(56);
end;

procedure TFormPrincipal.btnVoucherClick(Sender: TObject);
begin
  Transacionar(18);
end;

procedure TFormPrincipal.checkBoxMultiplosCartoesClick(Sender: TObject);
var
  strRetAguardaFMCInt: PAnsiChar;
  vMsg: TStringList;
  respFMsg: PAnsiChar;
  NovoValor: String;
  object1: TTransVC;
begin
  object1 := TTransVC.Create;
  vMsg := TStringList.Create;

  if (GetParametros()) and (checkBoxMultiplosCartoes.Checked) then
  begin

    NovaVenda := True;
    while NovaVenda = True do
    begin
      panelTransacoes.Visible := True;
      lbLog.Height := 362;

      if (not InsereNovoCartao = True) then
      begin
        lstCupons := TObjectList<TRetCupom>.Create();
        lstExibicao := TList<TTransVC>.Create();
      end;

      Retorno := IniciaFuncaoMCInterativo(operacao, PAnsiChar(AnsiString(cnpj_A)
        ), parcela, PAnsiChar(AnsiString(cupom)), PAnsiChar(AnsiString(valor)),
        PAnsiChar(AnsiString(nsu + '*')), PAnsiChar(AnsiString(data_A)),
        PAnsiChar(AnsiString(pdv_A)), PAnsiChar(AnsiString(codloja_A)),
        comunicacao, '');

      lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) +
        '- IniciaFuncaoMCInterativo()');
      lbLog.Refresh;

      Util.AdicionaLog('IniciaFuncaoMCInterativo()', '');

      if Retorno = 0 then
      begin

        var
          retMsg: PAnsiChar := '';
        var
          arrMsg: TArray<string>;

        while (retMsg <> '[ERROABORTAR]') and (retMsg <> '[RETORNO]') and
          (retMsg <> '[ERRODISPLAY]') do
        begin

          strRetAguardaFMCInt := AguardaFuncaoMCInterativo();
          Util.AdicionaLog(strRetAguardaFMCInt, '');

          if strRetAguardaFMCInt <> '' then
          begin
            lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) + '-' +
              strRetAguardaFMCInt);
            lbLog.Refresh;
            arrMsg := SplitString(strRetAguardaFMCInt, '#');
            retMsg := PAnsiChar(AnsiString(arrMsg[0]));
          end;

          var
          TarrMsg := Length(arrMsg);
          if retMsg = '[MENU]' then
          begin
            if TarrMsg > 2 then
            begin
              fMensagem := TFormMens.Create(Application);
              fMensagem.lMensagem.Caption := arrMsg[2].Replace('|', sLineBreak);
            end
            else
            begin
              fMensagem := TFormMens.Create(nil);
              fMensagem.Caption := arrMsg[0];
              fMensagem.lMensagem.Caption := arrMsg[1].Replace('|', sLineBreak);
            end;

            fMensagem.ShowModal;

            if fMensagem.Cancelar = True then
            begin
              CancelarFluxoMCInterativo();
              Util.AdicionaLog('CancelarFluxoMCInterativo()', '');
              ShowMessage('Fluxo Cancelado');
              retMsg := '[ERROABORTAR]';
              lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) +
                ' - Fluxo Cancelado');
              Util.AdicionaLog('Fluxo Cancelado', '');
              NovaVenda := False;
            end
            else
            begin
              respFMsg := PAnsiChar(AnsiString(fMensagem.eResposta.Text));
              ContinuaFuncaoMCInterativo(respFMsg);
            end;
          end;

          if retMsg = '[PERGUNTA]' then
          begin
            fMensagem := TFormMens.Create(nil);
            fMensagem.Caption := arrMsg[1];
            fMensagem.lMensagem.Caption := arrMsg[2].Replace('|', sLineBreak);
            fMensagem.ShowModal;

            if fMensagem.Cancelar = True then
            begin
              CancelarFluxoMCInterativo();
              Util.AdicionaLog('CancelarFluxoMCInterativo()', '');
              ShowMessage('Fluxo Cancelado');
              retMsg := '[ERROABORTAR]';
              lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) +
                ' - Fluxo Cancelado');
              Util.AdicionaLog('Fluxo Cancelado', '');
              NovaVenda := False;
            end
            else
            begin
              respFMsg := PAnsiChar(AnsiString(fMensagem.eResposta.Text));
              ContinuaFuncaoMCInterativo(respFMsg);
            end
          end;

          if retMsg = '[MSG]' then
          begin
            if TarrMsg >= 2 then
            begin
              if arrMsg[1].Contains('SALDO') and
                (not arrMsg[1].Contains('RETIRE')) then
              begin
                fMensagem := TFormMens.Create(nil);
                fMensagem.Caption := arrMsg[0];
                fMensagem.lMensagem.Caption :=
                  arrMsg[1].Replace('|', sLineBreak);
                fMensagem.ShowModal;
              end;
            end;
          end;

          if retMsg = '[ERRODISPLAY]' then
          begin
            fMensagem := TFormMens.Create(nil);
            fMensagem.Caption := arrMsg[0];
            fMensagem.lMensagem.Caption := arrMsg[1].Replace('|', sLineBreak);
            fMensagem.ShowModal;

            InsereNovoCartao := False;
            NovaVenda := False;

            if fMensagem.Cancelar = True then
            begin
              CancelarFluxoMCInterativo();
              Util.AdicionaLog('CancelarFluxoMCInterativo()', '');
              ShowMessage('Fluxo Cancelado');
              retMsg := '[ERROABORTAR]';
              lbLog.Lines.Add(FormatDateTime('dd/MM/yyyy', mydata) +
                ' - Fluxo Cancelado');
              Util.AdicionaLog('Fluxo Cancelado', '');
              NovaVenda := False;
            end
            else
            begin
              respFMsg := PAnsiChar(AnsiString(fMensagem.eResposta.Text));
              ContinuaFuncaoMCInterativo(respFMsg);
            end;
          end;

          Sleep(500);
        end;

        if retMsg = '[ERROABORTAR]' then
        begin
          ShowMessage(retMsg);
        end;

        if retMsg = '[RETORNO]' then
        begin
          Sleep(500);
          var
          strCupom := arrMsg[15].Replace('CAMPO=', '').Replace('|', sLineBreak)
            .Replace('CORTAR', '-------------------------------');

          var
          auxCupom := strCupom + '-------------------------------' + sLineBreak
            + sLineBreak + strCupom;

          dadosCupom := TRetCupom.Create;
          dadosCupom.SetComprovante(arrMsg[15].Replace('CAMPO122=', '')
            .Replace('|', sLineBreak).Replace('CORTAR',
            '-------------------------------'));
          dadosCupom.SetVenctoCartao(arrMsg[14].Replace('CAMPO0513=', ''));
          dadosCupom.SetNsuRede(arrMsg[13].Replace('CAMPO0134=', ''));
          dadosCupom.SetCliente(arrMsg[12].Replace('CAMPO1003=', ''));
          dadosCupom.SetCnpj(arrMsg[11].Replace('CAMPO0950=', ''));
          dadosCupom.SetUltimosDigitos(arrMsg[10].Replace('CAMPO1190=', ''));
          dadosCupom.SetBinCartao(arrMsg[9].Replace('CAMPO0136=', ''));
          dadosCupom.SetTxServico(arrMsg[8].Replace('CAMPO0504=', ''));
          dadosCupom.SetParcelas(arrMsg[7].Replace('CAMPO0505=', ''));
          dadosCupom.SetNsu(arrMsg[6].Replace('CAMPO0133=', ''));
          dadosCupom.SetCodAutorizacao(arrMsg[5].Replace('CAMPO0135=', ''));
          dadosCupom.SetCodRede(arrMsg[4].Replace('CAMPO0131=', ''));
          dadosCupom.SetCodBandeira(arrMsg[3].Replace('CAMPO0132=', ''));
          dadosCupom.SetValor(arrMsg[2].Replace('CAMPO0002=', ''));
          dadosCupom.SetCupom(arrMsg[1].Replace('CAMPO0160=', ''));

          lstCupons.Add(dadosCupom);

          var
          recebe := dadosCupom.GetComprovante.Replace(sLineBreak, '|');
          transacoespendentes.Items.Add(recebe);
          transacoespendentes.Refresh;

          object1.exibir := dadosCupom.GetComprovante;
          object1.valor := dadosCupom.GetValor;

          lstExibicao.Add(object1);
        end;
      end
      else
      begin
        ShowMessage('Erro - IniciaFuncaoMCInterativo');
        Util.AdicionaLog('Erro - IniciaFuncaoMCInterativo', '');
        NovaVenda := False;
      end;

      if (NovaVenda = True) then
      begin
        var
        RecebeNovaVenda := Application.MessageBox
          ('Deseja Pagar com mais de um cartão', 'Pagar com Multiplos Cartões',
          MB_ICONQUESTION or MB_YESNO);
        if RecebeNovaVenda = IDYES then
        begin
          InsereNovoCartao := True;
          NovoValor := Dialogs.InputBox('Digite o valor', 'Valor:', '');
          valor := NovoValor;
        end
        else
        begin
          InsereNovoCartao := False;
          NovaVenda := False;
        end;

      end
      else
      begin
        checkBoxMultiplosCartoes.Checked := False;
        panelTransacoes.Visible := False;
        lbLog.Height := 570;
      end;

    end;

  end
  else
  begin
    panelTransacoes.Visible := False;
    lbLog.Height := 570;
  end;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin

  if (checkBoxMultiplosCartoes.Checked = False) then
  begin
    panelTransacoes.Visible := False;
    lbLog.Height := 570;
  end;

  LerArquivoAtributos();

end;

end.
