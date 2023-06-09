unit FormMensagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormMens = class(TForm)
    lMensagem: TLabel;
    eResposta: TEdit;
    bOK: TButton;
    bCancelar: TButton;
    procedure bCancelarClick(Sender: TObject);
    procedure bOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    var Cancelar : Boolean;
    var retornoMsg : PAnsiChar;
  end;

var
  FormMens: TFormMens;

implementation

{$R *.dfm}

procedure TFormMens.bCancelarClick(Sender: TObject);
begin
  Cancelar := True;
  Close;
end;

procedure TFormMens.bOKClick(Sender: TObject);
begin
  retornoMsg :=  PAnsiChar(AnsiString(eResposta.Text));
  Cancelar := False;
  Close;
end;

end.
