unit Util;

interface
uses
  System.SysUtils,System.Classes,Vcl.Forms,Winapi.Windows,Dialogs;
type

  TRetUtil = class
  private
    procedure CriarArquivo (sNomeArquivo, strMsg, strStackTrace : string);
    procedure  VerificaArquivo (sNomeArquivo : string);
  public
    procedure AdicionaLog (strMsg, strStackTrace : string);
    function  ArquivoEmUso (caminhoArquivo : string) : Boolean;
  end;

implementation
var
arq : TextFile;

procedure TRetUtil.VerificaArquivo(sNomeArquivo: string);
var
  Tamanho : Integer;
  existe : Boolean;
begin
      Append(arq);
      Tamanho := FileSize(arq);

      existe := FileExists(ExpandFileName(GetCurrentDir + '\..\..\') + sNomeArquivo + '.log');
      if existe = True and (Tamanho >= 314572800) then
      begin
           try
              DeleteFile(PChar(ExpandFileName(GetCurrentDir + '\..\..\') + sNomeArquivo + '_old.log'));
              MoveFile(PChar(ExpandFileName(GetCurrentDir + '\..\..\') + sNomeArquivo + '.log'),PChar(ExpandFileName(GetCurrentDir + '\..\..\') + sNomeArquivo + '_old.log'));
           except

           end;
      end;
end;

procedure TRetUtil.AdicionaLog (strMsg, strStackTrace : string);
begin
  CriarArquivo('tef',strMsg,strStackTrace);
end;

procedure TRetUtil.CriarArquivo(sNomeArquivo: string; strMsg: string; strStackTrace: string);
var
mydata: TDateTime;
caminho : string;
Version,Dummy : DWORD;
PVersionData: pointer;
PFixedFileInfo: PVSFixedFileInfo;
FixedFileInfoLength: UINT;
Major, Minor, Release, Build: Integer;
VersionFinal : string;
begin
    mydata := Now;

    if string.IsNullOrEmpty(strMsg) and string.IsNullOrEmpty(strStackTrace)then
    begin
    Exit;
    end;

    If FileExists(ExpandFileName(GetCurrentDir + '\..\..\')+'nlog.txt') then
    begin
    Exit;
    end;

    If string.IsNullOrEmpty(sNomeArquivo) then
    begin
    Exit;
    end;

    if ArquivoEmUso(ExpandFileName(GetCurrentDir + '\..\..\') + sNomeArquivo + '.log')THEN
    begin
    Exit;
    end;

    try
      caminho := Application.ExeName;
      Version := GetFileVersionInfoSize(pChar(caminho),Dummy);
      if Version = 0 then
       exit;
      PVersionData := AllocMem(Version);
      try
      if GetFileVersionInfo(pChar(caminho), 0, Version, PVersionData) = False then
         exit;
        // raise Exception.Create('Não pude recuperar informação sobre versão');
      if VerQueryValue(PVersionData, '', pointer(PFixedFileInfo), FixedFileInfoLength) = False then
         exit;
      Major := PFixedFileInfo^.dwFileVersionMS shr 16;
      Minor := PFixedFileInfo^.dwFileVersionMS and $FFFF;
      Release := PFixedFileInfo^.dwFileVersionLS shr 16;
      Build := PFixedFileInfo^.dwFileVersionLS and $FFFF;
      finally
        FreeMem(PVersionData);
      end;
      if (Major or Minor or Release or Build) <> 0 then
          VersionFinal := IntToStr(Major) + '.' + IntToStr(Minor) + '.' + IntToStr(Release) + '.' + IntToStr(Build);

      VerificaArquivo(sNomeArquivo);

      if strMsg <> '' then
      begin
        Append(arq);
        Writeln(arq,PChar(FormatDateTime('dd/MM/yyyy tt', mydata)+ ' v.' + VersionFinal + ' :: ' + strMsg));
      end;

      if (not string.IsNullOrEmpty(strStackTrace)) then
      begin
        Append(arq);
        Writeln(arq,PChar(FormatDateTime('dd/MM/yyyy tt', mydata)+ ' v.' + VersionFinal + ' :: ' + strStackTrace));
      end;

      Close(arq);

    except
    end;

end;

function TRetUtil.ArquivoEmUso(caminhoArquivo: string): Boolean;
begin
    try
        AssignFile(arq,caminhoArquivo);
        if FileExists(caminhoArquivo) then
        begin
            Append(arq);
        end
        else
        begin
          Rewrite ( arq );
        end;
        CloseFile(arq);
        Result := False;
    except
        Result := True;
    end;
end;


end.
