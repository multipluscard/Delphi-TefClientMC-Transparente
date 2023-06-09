object FormAtributos: TFormAtributos
  Left = 0
  Top = 0
  ClientHeight = 398
  ClientWidth = 253
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PanelAtributosAParte: TPanel
    Left = 8
    Top = 8
    Width = 237
    Height = 382
    BorderStyle = bsSingle
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object lbComunicacao: TLabel
      Left = 32
      Top = 32
      Width = 97
      Height = 20
      Caption = 'COMUNICA'#199#195'O'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
    end
    object lbCnpj: TLabel
      Left = 32
      Top = 98
      Width = 34
      Height = 20
      Caption = 'CNPJ'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
    end
    object lbCodLoja: TLabel
      Left = 32
      Top = 161
      Width = 65
      Height = 20
      Caption = 'COD LOJA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
    end
    object lbData: TLabel
      Left = 32
      Top = 232
      Width = 34
      Height = 20
      Caption = 'DATA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
    end
    object lbPdv: TLabel
      Left = 32
      Top = 296
      Width = 27
      Height = 20
      Caption = 'PDV'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
    end
    object txbComunicacao: TEdit
      Left = 32
      Top = 58
      Width = 169
      Height = 28
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object txbCnpj: TEdit
      Left = 32
      Top = 124
      Width = 169
      Height = 28
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object txbCodLoja: TEdit
      Left = 32
      Top = 187
      Width = 169
      Height = 28
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object txbPdv: TEdit
      Left = 32
      Top = 322
      Width = 169
      Height = 28
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object dtDate: TEdit
      Left = 32
      Top = 258
      Width = 169
      Height = 28
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
  end
end
