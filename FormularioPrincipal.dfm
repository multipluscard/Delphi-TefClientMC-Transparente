object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'Exemplo TefClientMC - Delphi'
  ClientHeight = 633
  ClientWidth = 893
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object panelAtributos: TPanel
    Left = 20
    Top = 55
    Width = 535
    Height = 97
    Color = 15987699
    ParentBackground = False
    TabOrder = 0
    object lbValor: TLabel
      Left = 23
      Top = 16
      Width = 44
      Height = 20
      Caption = 'VALOR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
    end
    object lbParcela: TLabel
      Left = 152
      Top = 16
      Width = 61
      Height = 20
      Caption = 'PARCELA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
    end
    object lbCupom: TLabel
      Left = 280
      Top = 16
      Width = 48
      Height = 20
      Caption = 'CUPOM'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
    end
    object lbNSU: TLabel
      Left = 408
      Top = 16
      Width = 27
      Height = 20
      Caption = 'NSU'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
    end
    object txbParcela: TEdit
      Left = 152
      Top = 42
      Width = 114
      Height = 21
      TabOrder = 0
    end
    object txbCupom: TEdit
      Left = 280
      Top = 42
      Width = 114
      Height = 21
      TabOrder = 1
    end
    object txbNsu: TEdit
      Left = 408
      Top = 42
      Width = 114
      Height = 21
      TabOrder = 2
    end
    object txbValor: TEdit
      Left = 25
      Top = 42
      Width = 121
      Height = 21
      TabOrder = 3
    end
  end
  object panelTransacoes: TPanel
    Left = 565
    Top = 424
    Width = 320
    Height = 201
    TabOrder = 1
    object lbTransacoes: TLabel
      Left = 8
      Top = 6
      Width = 84
      Height = 20
      Caption = 'TRANSA'#199#213'ES'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
    end
    object btnConfirma: TButton
      Left = 8
      Top = 160
      Width = 97
      Height = 33
      Caption = 'CONFIRMAR'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnConfirmaClick
    end
    object btnDesfaz: TButton
      Left = 111
      Top = 160
      Width = 97
      Height = 33
      Caption = 'DESFAZ'
      TabOrder = 1
      OnClick = btnDesfazClick
    end
    object checkBoxTodas: TCheckBox
      Left = 224
      Top = 168
      Width = 81
      Height = 17
      Caption = 'Todas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object transacoespendentes: TListBox
      Left = 8
      Top = 32
      Width = 297
      Height = 97
      ItemHeight = 13
      TabOrder = 3
    end
  end
  object tabTipo: TPageControl
    Left = 24
    Top = 192
    Width = 535
    Height = 433
    ActivePage = tabQR
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object tabCartao: TTabSheet
      Caption = 'CART'#195'O'
      object tabSubCartoes: TPageControl
        Left = 3
        Top = 0
        Width = 521
        Height = 305
        ActivePage = tabCredito
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object tabCredito: TTabSheet
          Caption = 'CREDITO'
          object btnCredito: TButton
            Left = 24
            Top = 32
            Width = 170
            Height = 46
            Caption = 'CREDITO'
            TabOrder = 0
            OnClick = btnCreditoClick
          end
          object btnCreditoAVista: TButton
            Left = 24
            Top = 84
            Width = 170
            Height = 46
            Caption = 'CREDITO A VISTA'
            TabOrder = 1
            OnClick = btnCreditoAVistaClick
          end
          object btnCreditoParceladoLoja: TButton
            Left = 24
            Top = 136
            Width = 170
            Height = 46
            Caption = 'CREDITO PARCELADO LOJA'
            TabOrder = 2
            OnClick = btnCreditoParceladoLojaClick
          end
          object btnCreditoParceladoAdm: TButton
            Left = 24
            Top = 188
            Width = 170
            Height = 46
            Caption = 'CREDITO PARCELADO ADM'
            TabOrder = 3
            OnClick = btnCreditoParceladoAdmClick
          end
          object btnConsulta: TButton
            Left = 0
            Top = 238
            Width = 81
            Height = 33
            Caption = 'CONSULTA'
            TabOrder = 4
            OnClick = btnConsultaClick
          end
          object btnPreAutorizacao: TButton
            Left = 87
            Top = 238
            Width = 115
            Height = 33
            Caption = 'PR'#201'-AUTORIZA'#199#195'O'
            TabOrder = 5
            OnClick = btnPreAutorizacaoClick
          end
          object btnConfPreAutorizacao: TButton
            Left = 208
            Top = 238
            Width = 145
            Height = 33
            Caption = 'CONF.PR'#201'-AUTORIZA'#199#195'O'
            TabOrder = 6
            OnClick = btnConfPreAutorizacaoClick
          end
          object btnCancPreAutorizacao: TButton
            Left = 359
            Top = 238
            Width = 145
            Height = 33
            Caption = 'CANC.PR'#201'-AUTORIZA'#199#195'O'
            TabOrder = 7
            OnClick = btnCancPreAutorizacaoClick
          end
        end
        object tabDebito: TTabSheet
          Caption = 'DEBITO'
          ImageIndex = 1
          object btnDebitoAVista: TButton
            Left = 32
            Top = 32
            Width = 170
            Height = 46
            Caption = 'DEBITO A VISTA'
            TabOrder = 0
            OnClick = btnDebitoAVistaClick
          end
          object btnDebito: TButton
            Left = 32
            Top = 84
            Width = 170
            Height = 46
            Caption = 'D'#201'BITO'
            TabOrder = 1
            OnClick = btnDebitoClick
          end
          object btnConsultaDebito: TButton
            Left = 0
            Top = 238
            Width = 81
            Height = 33
            Caption = 'CONSULTA'
            TabOrder = 2
            OnClick = btnConsultaDebitoClick
          end
        end
        object tabFrota: TTabSheet
          Caption = 'FROTA'
          ImageIndex = 2
          object btnFrota: TButton
            Left = 24
            Top = 32
            Width = 170
            Height = 46
            Caption = 'FROTA'
            TabOrder = 0
            OnClick = btnFrotaClick
          end
        end
        object tabVoucher: TTabSheet
          Caption = 'VOUCHER'
          ImageIndex = 3
          object btnVoucher: TButton
            Left = 24
            Top = 32
            Width = 170
            Height = 46
            Caption = 'VOUCHER'
            TabOrder = 0
            OnClick = btnVoucherClick
          end
        end
      end
      object btnCancelar: TButton
        Left = 3
        Top = 306
        Width = 103
        Height = 30
        Caption = 'CANCELAR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnCancelarClick
      end
    end
    object tabAdm: TTabSheet
      Caption = 'ADMINISTRA'#199#195'O'
      ImageIndex = 1
      object btnExcluirBins: TButton
        Left = 24
        Top = 32
        Width = 170
        Height = 46
        Caption = 'EXCLUIR BINS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnExcluirBinsClick
      end
      object btnReimpressao: TButton
        Left = 24
        Top = 84
        Width = 170
        Height = 46
        Caption = 'REIMPRESSAO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnReimpressaoClick
      end
      object btnColetaCpf: TButton
        Left = 24
        Top = 136
        Width = 170
        Height = 46
        Caption = 'COLETA DE CPF'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnColetaCpfClick
      end
    end
    object tabQR: TTabSheet
      Caption = 'QRMULTIPLUS'
      ImageIndex = 2
      object Label1: TLabel
        Left = 0
        Top = 368
        Width = 514
        Height = 16
        Caption = 
          'Obs: Para visualizar o QR Code utilizar o par'#226'metro ExibirQrCode' +
          '=2 no CliMC.ini'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnMenuPSP: TButton
        Left = 24
        Top = 32
        Width = 170
        Height = 46
        Caption = 'MENU OP'#199#213'ES PSP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnMenuPSPClick
      end
      object btnPSPClient: TButton
        Left = 24
        Top = 84
        Width = 170
        Height = 46
        Caption = 'PSP CLIENTE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnPSPClientClick
      end
      object btnMercadoPago: TButton
        Left = 24
        Top = 136
        Width = 170
        Height = 46
        Caption = 'MERCADO PAGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnMercadoPagoClick
      end
      object btnPicPay: TButton
        Left = 24
        Top = 188
        Width = 170
        Height = 46
        Caption = 'PICPAY'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnPicPayClick
      end
      object btnCancelarEstorno: TButton
        Left = 24
        Top = 288
        Width = 161
        Height = 33
        Caption = 'CANCELAR/ESTORNO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = btnCancelarEstornoClick
      end
      object btnStatusTransacao: TButton
        Left = 191
        Top = 288
        Width = 161
        Height = 33
        Caption = 'STATUS TRANSA'#199#195'O'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = btnStatusTransacaoClick
      end
    end
  end
  object btnAtributos: TBitBtn
    Left = 860
    Top = 24
    Width = 25
    Height = 25
    Hint = 'Configura'#231#245'es do PDV'
    Glyph.Data = {
      AE060000424DAE06000000000000360000002800000017000000170000000100
      1800000000007806000000000000000000000000000000000000FFFFFFECECEC
      4545452A2A2A3030303131313030303030303030303030303030302E302F2E32
      302E302F352F31342F313134320C0C0B555A56E0E4E3FFFFFFFBFBFDFFFCFF00
      0000ECECECB5B5B5ECECECF1F1F1EFEFEFF0F0F0F1F1F1F1F1F1F1F1F1F1F1F1
      F1F1F1EFF1F0F0F2F1EFEFEFEDE9EBF0EDF0F8F9F98A8D8C585A57666964EEEF
      EFFEFFFFF9FBFD000000D0D0D0A8A8A8DEDEDECECECED6D6D6D2D2D2D2D2D2D2
      D2D2D2D2D2D2D2D2D2D2D2D7D4D4D6D1D0DDD9D9DFDADDD3CED1D9D5D7AEB0B0
      5C5959625E5EC9C8C9FFFFFFF0F8FA000000CFCFCFC0C0C0FFFFFFFDFDFDFDFD
      FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFD4D3D3D1D0D0FF
      FFFFFFFFFFB4B4B4534D4C625555D0CBCDFFFFFFF4FCFD000000D4D4D4A8A8A8
      DADADAD1D1D1D0D0D0D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D4D3D4CCCDCCE4E5
      E38D8C8D121112C3CACDDEE6E8A1A3A5545051605656CDCACBFFFFFFFAFCFC00
      0000CECECEBEBEBEFFFFFFF8F8F8FCFCFCFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
      FEFEFEFBFBFBFFFFFFD3E0E0303E402F3B3DE4E8E9B0B9BA4A4A4B5B5353CDCB
      CBFFFFFFFDFEFE000000D4D4D4ABABABE4E4E4DADADADADADAD9D9D9DBDBDBDB
      DBDBDBDBDBDBDBDBDBDBDBD9D9D8E1E5E491AEACAECECE97CCCB3044468FA1A3
      5354555B5355C9CAC9FFFFFFF8FAFA000000CFCFCFBBBBBBFFFFFFF1F1F1F3F3
      F3F3F3F3F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F2F1F1F8FCFBAFC7C68CC1C099
      F7F4134644565E615A5D61535153C6CBCAFFFFFFF8FAF9000000D0D0D0B0B0B0
      F1F1F1E5E5E5E7E7E7E4E4E4E6E6E6E6E6E6E6E6E6E6E6E6E6E6E6E7E7E7DDE0
      E0E5F0F25F909099EBEA4DCDC50002014D494F54595AC4CDCCFFFFFFFDFDFD00
      0000D2D2D2B4B4B4F3F3F3E7E7E7E7E7E7E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E4E7E6E6E8E7EAEBECB9D7D866BAB97AF7F2114F4E494D4E535F5FC5C9
      C8FFFFFFFDFBFA000000CFCFCFB6B6B6FEFEFEEFEFEFF1F1F1F1F1F1F2F2F2F2
      F2F2F2F2F2F2F2F2F2F2F2ECF2F0EFF2F1F4EAF2DAEEF25494969FFCFC35A29D
      315651364143D2CFCFFFFFFFFDFDFA000000D2D2D2ADADADE5E5E5DBDBDBDBDB
      DBDBDBDBDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDBDEDADBDCD9E1DBE0D9E4E79F
      C5C670AAAC8BFFFF005752000000DBDEDCFFFFFFFDFCF8000000CFCFCFBDBDBD
      FFFFFFF6F6F6FAFAFAFBFBFBFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFDFBF9FBF9
      F8F7F9FCF7FBFAF0FEFB78ABAC74E0E255C4C400100FDDDADAFFFFFFFBFBFB00
      0000D3D3D3A6A6A6DEDEDED2D2D2D4D4D4D4D4D4D5D5D5D5D5D5D5D5D5D5D5D5
      D5D5D5D6D4D7D6D2D8D5D5D5CFD2CDD2E0DC95BEC073C4C781EEF3124F55969F
      A2FFFFFFF4F8FA000000CDCDCDBCBCBCFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFCFFFFF9F5FDF9F4FFFF609296
      9DFDFC30B0AB202F2EFDFFFFEFF8FB000000D3D3D3A4A4A4DBDBDBCDCDCDD0D0
      D0CFCFCFD0D0D0D0D0D0D0D0D0D0D0D0D0D0D0CFCED2D3D0D2D4D1CCD1D3C9C8
      CFC7C6D1D499BDB962B5AE8EFFF428724D7B7D7AFFFFFF000000CFCFCFC0C0C0
      FFFFFFFCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFEFFFFFDFEFEFFFFFFB6C7C02665436AE9A82D864C2C332AE6EEEB00
      0000D4D4D4A6A6A6DBDBDBD0D0D0D3D3D3D2D2D2D2D2D2D0D0D0D2D2D2D3D3D3
      D0D0D1D3D4CFD2D4CFD2D2D3CDD7C9CDD0C9DFCEE6B3B0BD041C1605474A0A24
      6F000029B4B2AE000000CECECEBBBBBBFFFFFFF6F6F6F9F9F9FAFAFAF7F7F7F6
      F6F6F8F8F8F9F9F9F9FAF9F8F8F7FBFAF8F8F9F9F4FBEEF4F7EFFFF9FFB4ACBA
      3E485950669900007229267DD7D9DE000000D0D0D0BEBEBEFFFFFFF6F6F6FCFC
      FCFCFCFCFDFDFDFEFEFEFCFCFCFFFFFFFDFEFDFEFCFEFAF6FEFEFEFDF7FEF9FC
      FDFDFFFFFFBBB3B64549505A647D6A6B8FCBC9DAFFFFFF000000CACACAC0C0C0
      535353FFFFFF505050F9F9F9747474D6D6D69C9C9CA6A6A5CBCBCC797979F3F3
      F3555655FFFFFF434544FFFFFF86807A4D4E515B5E62CBCAC9FFFFFFF2FBF300
      0000E9E9E9B5B5B58F8F8FCBCBCB8C8C8CCBCBCB959595BEBEBEA2A2A2B0B0B0
      B1B2B1A3A2A2C1C0BE939693C0C9C88B8C8ED1CACBBCB9B240433E66686CEAE8
      ECFEFFFFFAFEF9000000FFFFFFEFEFEF535353676767868686484848A0A0A031
      3131AEAEAE2B2B2BAFAFB034302EA6A39E424344848A935C5B6470656A91928F
      BBBFB9D9D8D8FFFFFFFCFAFDFFFCFE000000}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnAtributosClick
  end
  object btnLimpaLog: TBitBtn
    Left = 829
    Top = 24
    Width = 25
    Height = 25
    Hint = 'Limpar log de eventos na tela'
    Glyph.Data = {
      AE060000424DAE06000000000000360000002800000017000000170000000100
      1800000000007806000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
      0000FFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFDFFFFFEFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFDFFFF
      FDFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFE
      FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFEFFFFFDFFFFFFFFFEFFFFFEFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFEFEFEFDFDFDFDFDFDFCFDFDFCFDFDFBFDFDFBFDFCFBFD
      FDFCFDFDFCFDFDFDFCFDFDFDFDFEFEFEFEFEFEFEFFFFFFFFFFFFFFFFFFFFFF00
      0000FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFFFF
      FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFEFFFFFFFFF8F7F6CBC4BFB9
      B1ACB9B1ABB8B0ABB8B0ACB9B0ACB9B0ABB9B1ABB8B1ABBBB4AFD8D0CCFBF8F8
      FFFFFFFEFEFEFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFCFDFDF4F5F3FAF5
      EB8168588470617A67597B67597A68597B68597B68597B68597C6859806B5C6E
      5546795C4AECE0D9FFFFFFFDFDFDFFFFFFFFFFFFFFFFFF000000FEFEFEFFFFFF
      F3F4F4C9C5C3F2EDE39B8171FEEFE0F7EDE2F5EDE3F5EDE3F6EDE3F6EDE3F5ED
      E3F6EBE3FBF2EAE8D5C8714B36B8A69CFFFFFEFEFEFEFFFFFFFFFFFFFFFFFF00
      0000FFFFFFFFFFFFFDFEFEF7F6F4FFFFFDC9BFB6C3BDB3F2F8F6E5F1F2ECF5F8
      E9F1F4E8F1F4E8F1F4E8F0F3E5F1F5FAF8F49E80717E6A61FEF8F6FFFFFEFFFF
      FFFFFFFFFFFFFF000000FEFEFEFFFFFFF5F5F591918FDADADAD7D2CDAD9B8ED9
      DDDAA6B3B5DDE3E3F2F6F7F7FBFCF5F9FAF8FCFDDCE5E8FFFFFFB9A498634D41
      DED5CDFFFFFFFEFEFEFFFEFFFFFEFF000000FFFFFFFFFFFFFFFFFFFDFDFBFDFF
      FEFFFBF7C3AB9CD0D1CE909C9EA9AEACF4F7F7F5F7F7F4F6F6F7F9F9E5EAEBED
      F2F1E6E2DA6F5546B8A195FFFFFFFDFEFEFFFEFFFFFEFF000000FFFFFFFFFFFF
      F9F9F9BEBCBAA8A7A7F6F6F0B0A698C0BDB9ABB8BA869394979FA2949CA0939C
      A0959CA08F9A9DBCC9CDF8FFFF836757917261F9F3F1FFFFFFFEFEFEFFFEFF00
      0000FEFEFEFFFFFFFFFFFFFDFCFBF7F6F7FFFFFFE3DCD6C4BDB4F1F9F3E0ECEA
      DEE9EADFEAEADEEAE9E0EAEADDE9E9DEECECF6FFFDD3BDAD6A4B39CBC0BBFFFF
      FFFDFEFEFDFFFF000000FEFEFEFFFFFFFAFAF9CAC8C5BBBBB8BFBFBEFDFFF9A7
      835FD09B5FDCAC68DCAA68DCAA68DBAB67DDA967DCAC6DDCB175DAAD75D3A073
      6B3E22A18C7FFFFEFCFEFFFFFEFFFD000000FFFEFEFFFFFFFDFCFBEBE8E4E2E1
      DFDFDFDEFEFFFFE4BF97AA5F17B6660FB8640CB7650DB7650DB7630BB86914D3
      8737C57C32AC6A36885A3CCEBAADFFFFFFFDFEFEFFFFFE000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFFFFFFEDDCCCD4BCA3D9C0A7D8C0A6D8C0
      A5D8BEA6D7BFA5D4BEA4D5BEA6D2BDA9E9DBCEFFFDF9FFFFFFFFFFFFFFFFFF00
      0000FFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFFFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFDFDFDFCFCFDFCFCFDFCFCFDFCFCFDFCFCFDFCFBFDFCFBFDFCFCFDFCFC
      FEFDFDFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFEFDFFFFFFFEFFFFFEFFFFFFFF00
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFEFFFFFFFE
      FFFFFEFFFFFFFF000000FFFEFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
      FFFFFEFFFFFFFFFFFFFFFFFFFFFFFF000000}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnLimpaLogClick
  end
  object checkBoxMultiplosCartoes: TCheckBox
    Left = 398
    Top = 158
    Width = 169
    Height = 17
    Caption = 'M'#218'LTIPLOS CART'#213'ES'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = checkBoxMultiplosCartoesClick
  end
  object lbLog: TMemo
    Left = 573
    Top = 55
    Width = 312
    Height = 354
    Lines.Strings = (
      'lbLog')
    ScrollBars = ssBoth
    TabOrder = 6
  end
end
