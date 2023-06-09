unit FormularioAtributos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFormAtributos = class(TForm)
    PanelAtributosAParte: TPanel;
    lbComunicacao: TLabel;
    lbCnpj: TLabel;
    lbCodLoja: TLabel;
    lbData: TLabel;
    lbPdv: TLabel;
    txbComunicacao: TEdit;
    txbCnpj: TEdit;
    txbCodLoja: TEdit;
    txbPdv: TEdit;
    dtDate: TEdit;
    //procedure txbComunicacaoClick(Sender: TObject);
    //procedure txbCnpjChange(Sender: TObject);
    //procedure FormCreate(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
     Constructor Create(comunicacao : Integer; cnpj: string; codloja: string; data: string; pdv : string); overload;
     function GetCnpj(): string;
     function GetComunicao(): Integer;
     function GetCodLoja(): string;
     function GetPdv(): string;
  end;

var FormAtributos: TFormAtributos;


implementation

{$R *.dfm}

constructor TFormAtributos.Create(comunicacao : Integer; cnpj: string; codloja: string; data: string; pdv : string);
begin
  inherited Create(txbComunicacao);
  //(txbComunicacao; txbCnpj; txbCodLoja; dtDate; txbpdv;);
  txbComunicacao.Text := comunicacao.ToString;
  txbCnpj.Text := cnpj;
  txbCodLoja.Text := codloja;
  dtDate.Text := data;
  txbpdv.Text := pdv;

end;

function TFormAtributos.GetCnpj: string;
begin
     Result := txbCnpj.Text;
end;

function TFormAtributos.GetComunicao: Integer;
begin
    Result := StrToInt(txbComunicacao.Text);
end;

function TFormAtributos.GetCodLoja: string;
begin
    Result := txbCodLoja.Text;
end;

function TFormAtributos.GetPdv: string;
begin
    Result := txbPdv.Text;
end;

end.
