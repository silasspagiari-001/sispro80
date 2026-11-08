object frmDETALHESITENSNOTA: TfrmDETALHESITENSNOTA
  Left = 0
  Top = 0
  ClientHeight = 346
  ClientWidth = 613
  Caption = 'Detalhes dos Itens'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  TextHeight = 15
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
      Tag = 1
      Left = 0
      Top = 3
      Width = 97
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        97
        48)
      object UniButtonDbEditcodigopessoas: TUniButtonDbEdit
        Tag = 1
        AlignWithMargins = True
        Left = 2
        Top = 16
        Width = 94
        Height = 29
        Hint = ''
        DataField = 'OPERACAO'
        DataSource = dm_rc.dsprodutos
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Color = clInfoBk
        IconCls = 'search'
      end
      object UniLabel3: TUniLabel
        Left = 4
        Top = -1
        Width = 54
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = 'Opera'#231#227'o'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object rcBlock20: TUniContainerPanel
      Tag = 1
      Left = 100
      Top = 3
      Width = 354
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        354
        48)
      object UniDBEdit17: TUniDBEdit
        Left = 3
        Top = 16
        Width = 348
        Height = 29
        Hint = ''
        DataField = 'DESCRICAO'
        DataSource = dm_rc.dsprodutos
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
      end
      object UniLabel1: TUniLabel
        Left = 3
        Top = -1
        Width = 150
        Height = 17
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        AutoSize = False
        Caption = 'Descri'#231#227'o Basica do Item'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object rcBlock30: TUniContainerPanel
      Tag = 1
      Left = 458
      Top = 2
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        150
        48)
      object UniDBComboBoxregiao: TUniDBComboBox
        Tag = 1
        Left = 3
        Top = 17
        Width = 145
        Height = 29
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        DataField = 'CST'
        DataSource = dm_rc.dsprodutos
        Style = csDropDownList
        Items.Strings = (
          '0101'
          '0102'
          '0103'
          '0202'
          '0400'
          '0500'
          '0900'
          '010'
          '020'
          '030'
          '040'
          '050'
          '060'
          '070'
          '080'
          '090'
          '')
        TabOrder = 1
        IconItems = <>
      end
      object UniLabel2: TUniLabel
        Left = 0
        Top = 0
        Width = 150
        Height = 17
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        AutoSize = False
        Caption = 'CST/CSOSN'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object rcBlock40: TUniContainerPanel
      Left = 0
      Top = 54
      Width = 608
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        608
        48)
      object UniDBEdit1: TUniDBEdit
        Left = 3
        Top = 16
        Width = 559
        Height = 29
        Hint = ''
        DataField = 'DESCRICAO_NOTA'
        DataSource = dm_rc.dsprodutos
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object UniLabel4: TUniLabel
        Left = 3
        Top = 0
        Width = 104
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = 'Descri'#231#227'o da NOTA'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
      object UniBitBtn1: TUniBitBtn
        Left = 568
        Top = 16
        Width = 38
        Height = 29
        Hint = '[[cls:ButtonThemeCrud]]'
        Margins.Top = 28
        Margins.Bottom = 12
        Caption = '<i class="fas fa-cogs"></i>'
        Anchors = [akLeft, akRight, akBottom]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = UniBitBtn1Click
      end
    end
    object rcBlock50: TUniContainerPanel
      Tag = 1
      Left = 0
      Top = 105
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        150
        48)
      object UniDBEdit2: TUniDBEdit
        Left = 3
        Top = 17
        Width = 144
        Height = 29
        Hint = ''
        DataField = 'LOTESEMENTE'
        DataSource = dm_rc.dsprodutos
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
      end
      object UniLabel5: TUniLabel
        Left = 3
        Top = 0
        Width = 22
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = 'Lote'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object rcBlock60: TUniContainerPanel
      Tag = 1
      Left = 153
      Top = 105
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 6
      DesignSize = (
        150
        48)
      object UniDBEdit3: TUniDBEdit
        Left = 3
        Top = 17
        Width = 145
        Height = 29
        Hint = ''
        DataField = 'BOLETIMSEMENTE'
        DataSource = dm_rc.dsprodutos
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
      end
      object UniLabel6: TUniLabel
        Left = 3
        Top = 0
        Width = 41
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = 'Boletim'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object rcBlock70: TUniContainerPanel
      Tag = 1
      Left = 305
      Top = 105
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 7
      DesignSize = (
        150
        48)
      object UniDBEdit4: TUniDBEdit
        Left = 3
        Top = 17
        Width = 145
        Height = 29
        Hint = ''
        DataField = 'TERMOSEMENTE'
        DataSource = dm_rc.dsprodutos
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
      end
      object UniLabel7: TUniLabel
        Left = 3
        Top = 0
        Width = 33
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = 'Termo'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object rcBlock80: TUniContainerPanel
      Tag = 1
      Left = 458
      Top = 105
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 8
      object UniDBFormattedNumberEditvlrdespesas: TUniDBFormattedNumberEdit
        Left = 3
        Top = 17
        Width = 145
        Height = 29
        Hint = ''
        DataField = 'PUREZA'
        DataSource = dm_rc.dsprodutos
        TabOrder = 1
        ReadOnly = True
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel8: TUniLabel
        Left = 3
        Top = 0
        Width = 49
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = '% Pureza'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object rcBlock90: TUniContainerPanel
      Tag = 1
      Left = 0
      Top = 157
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 9
      object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
        Left = 2
        Top = 17
        Width = 145
        Height = 29
        Hint = ''
        DataField = 'QUANTIDADE'
        DataSource = dm_rc.dsprodutos
        TabOrder = 1
        ReadOnly = True
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel9: TUniLabel
        Left = 3
        Top = 0
        Width = 64
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = 'Quantidade'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object rcBlock100: TUniContainerPanel
      Tag = 1
      Left = 153
      Top = 157
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 10
      object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
        Left = 3
        Top = 17
        Width = 145
        Height = 29
        Hint = ''
        DataField = 'PERCICMS'
        DataSource = dm_rc.dsprodutos
        TabOrder = 1
        ReadOnly = True
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel10: TUniLabel
        Left = 3
        Top = 0
        Width = 40
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = '% ICMS'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object rcBlock110: TUniContainerPanel
      Tag = 1
      Left = 305
      Top = 157
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 11
      object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
        Left = 3
        Top = 17
        Width = 145
        Height = 29
        Hint = ''
        DataField = 'BASEICMS'
        DataSource = dm_rc.dsprodutos
        TabOrder = 1
        ReadOnly = True
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel11: TUniLabel
        Left = 3
        Top = 0
        Width = 57
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = 'Base ICMS'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object rcBlock120: TUniContainerPanel
      Tag = 1
      Left = 458
      Top = 157
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 12
      object UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit
        Left = 3
        Top = 17
        Width = 145
        Height = 29
        Hint = ''
        DataField = 'VALORICMS'
        DataSource = dm_rc.dsprodutos
        TabOrder = 1
        ReadOnly = True
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel12: TUniLabel
        Left = 3
        Top = 0
        Width = 60
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = 'Valor ICMS'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object rcBlock150: TUniContainerPanel
      Tag = 1
      Left = 2
      Top = 208
      Width = 148
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 14
      object UniDBFormattedNumberEditFrete: TUniDBFormattedNumberEdit
        Left = 3
        Top = 17
        Width = 143
        Height = 29
        Hint = ''
        DataField = 'FRETE'
        DataSource = dm_rc.dsprodutos
        TabOrder = 1
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel13: TUniLabel
        Left = 3
        Top = 0
        Width = 57
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = 'Valor frete'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object rcBlock130: TUniContainerPanel
      Left = 0
      Top = 291
      Width = 613
      Height = 55
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alBottom
      TabOrder = 13
      object rcBlock140: TUniContainerPanel
        Left = 2
        Top = 5
        Width = 150
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-6]]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          150
          48)
        object btnimpressao: TUniBitBtn
          Left = 11
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
  end
end
