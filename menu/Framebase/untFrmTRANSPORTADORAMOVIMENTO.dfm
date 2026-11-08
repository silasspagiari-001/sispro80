object frmTRANPORTADORAMOVIMENTO: TfrmTRANPORTADORAMOVIMENTO
  Left = 0
  Top = 0
  ClientHeight = 346
  ClientWidth = 613
  Caption = 'Transportadora/Entrega'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 613
    Height = 346
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    object rcBlock10: TUniContainerPanel
      Left = 0
      Top = 296
      Width = 613
      Height = 50
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alBottom
      TabOrder = 1
      object rcBlock20: TUniContainerPanel
        Left = 0
        Top = 1
        Width = 152
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          152
          48)
        object btnimpressao: TUniBitBtn
          Left = 9
          Top = 13
          Width = 119
          Height = 29
          Hint = '[[cls:ButtonThemeCrud]]'
          Margins.Top = 28
          Margins.Bottom = 12
          Caption = '<i class="fas fa-save">  Gravar/Fechar</i>'
          Anchors = [akLeft, akRight, akBottom]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnimpressaoClick
        end
      end
    end
    object rcBlock30: TUniContainerPanel
      Left = 4
      Top = 3
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        150
        48)
      object UniButtonEditcodtransportadora: TUniButtonEdit
        AlignWithMargins = True
        Left = 0
        Top = 17
        Width = 148
        Height = 29
        Hint = ''
        Text = '0'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnExit = UniButtonEditcodtransportadoraExit
        OnButtonClick = UniButtonEditcodtransportadoraButtonClick
        IconCls = 'search'
      end
      object UniLabelc1: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 1
        Width = 86
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Transportadora'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock40: TUniContainerPanel
      Left = 160
      Top = 3
      Width = 450
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        450
        48)
      object UniEditdescricaotransportadora: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 17
        Width = 287
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
      end
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 1
        Width = 137
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Nome da Transportadora'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
      object UniComboBoxtipoemitente: TUniComboBox
        AlignWithMargins = True
        Left = 300
        Top = 17
        Width = 147
        Height = 29
        Hint = ''
        Margins.Right = 5
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'Livre'
          'Emitente'
          'Destinatario'
          'Outras'
          '')
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
        IconItems = <>
      end
      object UniLabel9: TUniLabel
        AlignWithMargins = True
        Left = 300
        Top = 1
        Width = 74
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Tipo Emitente'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 4
      end
    end
    object rcBlock50: TUniContainerPanel
      Left = 4
      Top = 57
      Width = 336
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        336
        48)
      object UniButtonEditcepentrega: TUniButtonEdit
        AlignWithMargins = True
        Left = 0
        Top = 17
        Width = 330
        Height = 29
        Hint = ''
        Text = '0'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnButtonClick = UniButtonEditcepentregaButtonClick
        IconCls = 'search'
      end
      object UniLabel2: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 1
        Width = 64
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Cep Entrega'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock60: TUniContainerPanel
      Left = 344
      Top = 57
      Width = 266
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        266
        48)
      object UniButtonEditibgeentrega: TUniButtonEdit
        AlignWithMargins = True
        Left = 3
        Top = 17
        Width = 260
        Height = 29
        Hint = ''
        Text = '0'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        IconCls = 'search'
      end
      object UniLabel3: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 1
        Width = 69
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'IBGE Entrega'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock70: TUniContainerPanel
      Left = 4
      Top = 111
      Width = 450
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 6
      DesignSize = (
        450
        48)
      object UniEditenderecoentrega: TUniEdit
        AlignWithMargins = True
        Left = 0
        Top = 17
        Width = 446
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
      end
      object UniLabel4: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 1
        Width = 110
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Endere'#231'o de Entrega'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock80: TUniContainerPanel
      Left = 460
      Top = 111
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 7
      DesignSize = (
        150
        48)
      object UniEditnumeroresidencia: TUniEdit
        AlignWithMargins = True
        Left = 2
        Top = 17
        Width = 145
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
      end
      object UniLabel5: TUniLabel
        AlignWithMargins = True
        Left = 2
        Top = 1
        Width = 106
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Numero Residencia'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock90: TUniContainerPanel
      Tag = 1
      Left = 4
      Top = 165
      Width = 158
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 8
      DesignSize = (
        158
        48)
      object UniEditbairroentrega: TUniEdit
        AlignWithMargins = True
        Left = 0
        Top = 16
        Width = 155
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
      end
      object UniLabel6: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 1
        Width = 79
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Bairro Entrega'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock100: TUniContainerPanel
      Tag = 1
      Left = 168
      Top = 165
      Width = 286
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 9
      DesignSize = (
        286
        48)
      object UniEditcidadeentrega: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 16
        Width = 279
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
      end
      object UniLabel7: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 1
        Width = 85
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Cidade  Entrega'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock110: TUniContainerPanel
      Tag = 1
      Left = 460
      Top = 165
      Width = 147
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 10
      DesignSize = (
        147
        48)
      object cbxufentrega: TUniComboBox
        AlignWithMargins = True
        Left = 2
        Top = 16
        Width = 144
        Height = 29
        Hint = ''
        Margins.Right = 5
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'SP'
          'PR'
          'MT'
          'MS'
          'SC'
          'RJ'
          'TO'
          'PA'
          'AM'
          'AC'
          'PB'
          'RN'
          'SE'
          'PE'
          'MG'
          'ES'
          'RO'
          'AP'
          'AL'
          'CE'
          'BA'
          'DF'
          'GO'
          'MA'
          'NO'
          'RS'
          'PI'
          'RR'
          'EX'
          'BR'
          ''
          '')
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
        IconItems = <>
      end
      object UniLabel8: TUniLabel
        AlignWithMargins = True
        Left = 2
        Top = 1
        Width = 66
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'U.F.  Entrega'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock120: TUniContainerPanel
      Left = 0
      Top = 216
      Width = 610
      Height = 79
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 11
    end
  end
end
