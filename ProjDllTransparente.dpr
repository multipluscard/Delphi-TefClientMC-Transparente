program ProjDllTransparente;

uses
  Vcl.Forms,
  FormularioPrincipal in 'FormularioPrincipal.pas' {FormPrincipal},
  FormMensagem in 'FormMensagem.pas' {FormMens},
  FormularioAtributos in 'FormularioAtributos.pas' {FormAtributos},
  RetCupom in 'RetCupom.pas',
  Util in 'Util.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  //Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
