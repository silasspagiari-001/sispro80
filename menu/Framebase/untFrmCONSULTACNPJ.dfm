object frmCONSULTACNPJ: TfrmCONSULTACNPJ
  Left = 0
  Top = 0
  ClientHeight = 420
  ClientWidth = 723
  Caption = 'Consulta CNPJ SEFAZ'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object rcBlock10: TUniContainerPanel
    Left = 0
    Top = 389
    Width = 723
    Height = 31
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 0
    object btnLkpClear: TUniBitBtn
      Left = 625
      Top = 1
      Width = 95
      Height = 29
      Hint = '[[cls:ButtonThemeCrud]]'
      Margins.Top = 28
      Margins.Bottom = 12
      Caption = 'Fechar'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = Transferir
    end
    object UniBitBtn1: TUniBitBtn
      Left = 522
      Top = 1
      Width = 95
      Height = 29
      Hint = '[[cls:ButtonThemeCrud]]'
      Margins.Top = 28
      Margins.Bottom = 12
      Caption = '<i class="fas fa-exchange-alt"> Transferir</i>'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
      OnClick = UniBitBtn1Click
    end
  end
  object rcBlock20: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 723
    Height = 389
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alClient
    TabOrder = 1
    object unpcaptcha: TUniContainerPanel
      Left = 1
      Top = 1
      Width = 464
      Height = 152
      Hint = ''
      ParentColor = False
      Color = clWindow
      TabOrder = 1
      object UniImage1: TUniImage
        Left = 0
        Top = 0
        Width = 464
        Height = 126
        Hint = ''
        Center = True
        Stretch = True
        Proportional = True
        Align = alTop
        Transparent = True
      end
      object UniLabelCAPTCHA: TUniLabel
        Left = 0
        Top = 126
        Width = 464
        Height = 26
        Hint = ''
        Alignment = taCenter
        AutoSize = False
        Caption = 'Atualizar Captcha'
        Align = alClient
        ParentFont = False
        Font.Color = clBlue
        Font.Height = -16
        Font.Style = [fsBold]
        TabOrder = 2
        OnClick = UniLabelCAPTCHAClick
      end
    end
    object rcBlock30: TUniContainerPanel
      Left = 465
      Top = 1
      Width = 257
      Height = 56
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        257
        56)
      object UniEditcpfcnpj: TUniEdit
        AlignWithMargins = True
        Left = 2
        Top = 24
        Width = 253
        Height = 29
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Color = clInfoBk
      end
      object UniLabel15: TUniLabel
        Left = 2
        Top = 4
        Width = 73
        Height = 15
        Hint = ''
        Caption = 'Digite o CNPJ:'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock40: TUniContainerPanel
      Left = 465
      Top = 56
      Width = 257
      Height = 52
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        257
        52)
      object UniEditcaptcha: TUniEdit
        AlignWithMargins = True
        Left = 2
        Top = 19
        Width = 253
        Height = 29
        Hint = ''
        Margins.Right = 5
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Color = clInfoBk
      end
      object UniLabel2: TUniLabel
        Left = 2
        Top = 3
        Width = 93
        Height = 15
        Hint = ''
        Caption = 'Digite o Captcha:'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock50: TUniContainerPanel
      Left = 465
      Top = 107
      Width = 255
      Height = 46
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 4
      object unbtnbusca: TUniBitBtn
        Left = 82
        Top = 8
        Width = 95
        Height = 29
        Hint = '[[cls:ButtonThemeCrud]]'
        Margins.Top = 28
        Margins.Bottom = 12
        Caption = '<i class="fas fa-search"> Consultar</i>'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
        OnClick = unbtnbuscaClick
      end
    end
    object rcBlock60: TUniContainerPanel
      Left = 1
      Top = 152
      Width = 464
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        464
        48)
      object UniEditrazao: TUniEdit
        AlignWithMargins = True
        Left = 0
        Top = 18
        Width = 461
        Height = 29
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
      end
      object UniLabel3: TUniLabel
        Left = -1
        Top = 3
        Width = 70
        Height = 15
        Hint = ''
        Caption = 'Raz'#227'o Social'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock70: TUniContainerPanel
      Left = 465
      Top = 152
      Width = 255
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 6
      DesignSize = (
        255
        48)
      object UniEditfantasia: TUniEdit
        AlignWithMargins = True
        Left = 2
        Top = 18
        Width = 253
        Height = 29
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
      end
      object UniLabel4: TUniLabel
        Left = 2
        Top = 3
        Width = 48
        Height = 15
        Hint = ''
        Caption = 'Fantasia'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock80: TUniContainerPanel
      Left = 1
      Top = 199
      Width = 136
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 7
      DesignSize = (
        136
        48)
      object UniEditcep: TUniEdit
        AlignWithMargins = True
        Left = 0
        Top = 17
        Width = 126
        Height = 29
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
      end
      object UniLabel5: TUniLabel
        Left = -1
        Top = 2
        Width = 20
        Height = 15
        Hint = ''
        Caption = 'Cep'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel1: TUniContainerPanel
      Left = 129
      Top = 199
      Width = 488
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 8
      DesignSize = (
        488
        48)
      object UniEditendereco: TUniEdit
        AlignWithMargins = True
        Left = 1
        Top = 17
        Width = 484
        Height = 29
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
      end
      object UniLabel6: TUniLabel
        Left = 1
        Top = 2
        Width = 50
        Height = 15
        Hint = ''
        Caption = 'Endere'#231'o'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel2: TUniContainerPanel
      Left = 616
      Top = 199
      Width = 104
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 9
      DesignSize = (
        104
        48)
      object UniEditnumero: TUniEdit
        AlignWithMargins = True
        Left = 2
        Top = 17
        Width = 102
        Height = 29
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
      end
      object UniLabel7: TUniLabel
        Left = 1
        Top = 2
        Width = 43
        Height = 15
        Hint = ''
        Caption = 'Numero'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel3: TUniContainerPanel
      Left = 0
      Top = 246
      Width = 465
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 10
      DesignSize = (
        465
        48)
      object UniEditbairro: TUniEdit
        AlignWithMargins = True
        Left = 0
        Top = 17
        Width = 462
        Height = 29
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
      end
      object UniLabel8: TUniLabel
        Left = 1
        Top = 2
        Width = 35
        Height = 15
        Hint = ''
        Caption = 'Bairro'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel4: TUniContainerPanel
      Left = 465
      Top = 246
      Width = 255
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 11
      DesignSize = (
        255
        48)
      object UniEditcomplemento: TUniEdit
        AlignWithMargins = True
        Left = 2
        Top = 17
        Width = 253
        Height = 29
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
      end
      object UniLabel9: TUniLabel
        Left = 1
        Top = 2
        Width = 75
        Height = 15
        Hint = ''
        Caption = 'Complemento'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel5: TUniContainerPanel
      Left = 0
      Top = 293
      Width = 617
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 12
      DesignSize = (
        617
        48)
      object UniEditcidade: TUniEdit
        AlignWithMargins = True
        Left = 0
        Top = 18
        Width = 462
        Height = 29
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
      end
      object UniLabel10: TUniLabel
        Left = 1
        Top = 2
        Width = 38
        Height = 15
        Hint = ''
        Caption = 'Cidade'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
      object UniEditibge: TUniEdit
        AlignWithMargins = True
        Left = 466
        Top = 18
        Width = 148
        Height = 29
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        ReadOnly = True
      end
      object UniLabel1: TUniLabel
        Left = 465
        Top = 2
        Width = 25
        Height = 15
        Hint = ''
        Caption = 'IBGE'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 4
      end
    end
    object UniContainerPanel6: TUniContainerPanel
      Left = 616
      Top = 293
      Width = 104
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 13
      DesignSize = (
        104
        48)
      object UniEdituf: TUniEdit
        AlignWithMargins = True
        Left = 2
        Top = 18
        Width = 102
        Height = 29
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
      end
      object UniLabel11: TUniLabel
        Left = 1
        Top = 2
        Width = 14
        Height = 15
        Hint = ''
        Caption = 'UF'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock90: TUniContainerPanel
      Left = 0
      Top = 340
      Width = 720
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 14
      DesignSize = (
        720
        48)
      object UniEditemail: TUniEdit
        AlignWithMargins = True
        Left = 1
        Top = 19
        Width = 719
        Height = 29
        Hint = ''
        Margins.Right = 5
        CharCase = ecLowerCase
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
      end
      object UniLabel12: TUniLabel
        Left = 1
        Top = 2
        Width = 31
        Height = 15
        Hint = ''
        Caption = 'Email'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 432
    Top = 16
  end
  object UniScreenMask: TUniScreenMask
    AttachedControl = unbtnbusca
    Enabled = True
    DisplayMessage = 'Aguarde ...'
    Left = 401
    Top = 17
  end
end
