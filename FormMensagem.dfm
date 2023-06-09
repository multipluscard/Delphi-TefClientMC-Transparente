object FormMens: TFormMens
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  ClientHeight = 242
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lMensagem: TLabel
    Left = 8
    Top = 8
    Width = 51
    Height = 13
    Caption = 'Mensagem'
  end
  object eResposta: TEdit
    Left = 8
    Top = 213
    Width = 417
    Height = 21
    TabOrder = 0
  end
  object bOK: TButton
    Left = 336
    Top = 19
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = bOKClick
  end
  object bCancelar: TButton
    Left = 336
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = bCancelarClick
  end
end
