object frmtelaproducaogenerica: Tfrmtelaproducaogenerica
  Left = 0
  Top = 0
  ClientHeight = 346
  ClientWidth = 692
  Caption = 'Confirma'#231#227'o da Produ'#231#227'o'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 692
    Height = 346
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    object rcBlock10: TUniContainerPanel
      Left = 3
      Top = 3
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        150
        48)
      object UniLabel4: TUniLabel
        Left = 3
        Top = 0
        Width = 43
        Height = 15
        Hint = ''
        Caption = 'Numero'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniDBEdit1: TUniDBEdit
        Left = 3
        Top = 18
        Width = 144
        Height = 29
        Hint = ''
        DataField = 'NUMERO'
        DataSource = dm_rc.dsbatidamestre
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        TabOrder = 2
        ReadOnly = True
      end
    end
    object rcBlock20: TUniContainerPanel
      Left = 172
      Top = 3
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        150
        48)
      object UniLabel6: TUniLabel
        Left = 3
        Top = 0
        Width = 46
        Height = 15
        Hint = ''
        Caption = 'Emiss'#227'o'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniDBDateTimePicker2: TUniDBDateTimePicker
        Tag = 1
        Left = 3
        Top = 18
        Width = 144
        Height = 29
        Hint = ''
        DataField = 'EMISSAO'
        DataSource = dm_rc.dsbatidamestre
        DateTime = 44561.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        ReadOnly = True
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock30: TUniContainerPanel
      Tag = 1
      Left = 3
      Top = 57
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        150
        48)
      object UniLabel25: TUniLabel
        Left = 3
        Top = 1
        Width = 91
        Height = 15
        Hint = ''
        Caption = 'Pureza Desejada'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniDBFormattedNumberEditpureza: TUniDBFormattedNumberEdit
        Left = 3
        Top = 18
        Width = 144
        Height = 29
        Hint = ''
        DataField = 'PU'
        DataSource = dm_rc.dsbatidamestre
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ReadOnly = True
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
    end
    object rcBlock40: TUniContainerPanel
      Tag = 1
      Left = 172
      Top = 56
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        150
        48)
      object UniLabel5: TUniLabel
        Left = 3
        Top = 1
        Width = 64
        Height = 15
        Hint = ''
        Caption = 'Quantidade'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniDBFormattedNumberEditquantidade: TUniDBFormattedNumberEdit
        Tag = 1
        Left = 2
        Top = 19
        Width = 144
        Height = 29
        Hint = ''
        DataField = 'QUANTIDADE'
        DataSource = dm_rc.dsbatidamestre
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ReadOnly = True
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
    end
    object rcBlock50: TUniContainerPanel
      Tag = 1
      Left = 350
      Top = 57
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        150
        48)
      object UniLabel26: TUniLabel
        Left = 3
        Top = 1
        Width = 60
        Height = 15
        Hint = ''
        Caption = 'Sacos de ...'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniDBComboBoxsacos: TUniDBComboBox
        Tag = 1
        Left = 2
        Top = 18
        Width = 145
        Height = 29
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SACOS'
        DataSource = dm_rc.dsbatidamestre
        Style = csDropDownList
        Items.Strings = (
          '1'
          '2'
          '5'
          '10'
          '15'
          '20'
          '25')
        TabOrder = 2
        ReadOnly = True
        IconItems = <>
      end
    end
    object rcBlock60: TUniContainerPanel
      Tag = 1
      Left = 3
      Top = 110
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 6
      DesignSize = (
        150
        48)
      object UniLabel7: TUniLabel
        Left = 0
        Top = 1
        Width = 66
        Height = 15
        Hint = ''
        Caption = 'Lote Destino'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniButtonDbEditLOTEDESTINO: TUniButtonDbEdit
        Left = 3
        Top = 17
        Width = 144
        Height = 29
        Hint = ''
        DataField = 'LOTE'
        DataSource = dm_rc.dsbatidamestre
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clInfoBk
        ReadOnly = True
        IconCls = 'search'
      end
    end
    object rcBlock70: TUniContainerPanel
      Tag = 1
      Left = 172
      Top = 110
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 7
      DesignSize = (
        150
        48)
      object UniLabel8: TUniLabel
        Left = 3
        Top = 1
        Width = 41
        Height = 15
        Hint = ''
        Caption = 'Boletim'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniDBEditboletim: TUniDBEdit
        Left = 1
        Top = 17
        Width = 144
        Height = 29
        Hint = ''
        DataField = 'BOLETIM'
        DataSource = dm_rc.dsbatidamestre
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ReadOnly = True
      end
    end
    object rcBlock80: TUniContainerPanel
      Tag = 1
      Left = 350
      Top = 110
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 8
      DesignSize = (
        150
        48)
      object UniLabel9: TUniLabel
        Left = 3
        Top = 1
        Width = 33
        Height = 15
        Hint = ''
        Caption = 'Termo'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniDBEdittermo: TUniDBEdit
        Left = 3
        Top = 17
        Width = 144
        Height = 29
        Hint = ''
        DataField = 'TERMO'
        DataSource = dm_rc.dsbatidamestre
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ReadOnly = True
      end
    end
    object rcBlock90: TUniContainerPanel
      Tag = 1
      Left = 523
      Top = 110
      Width = 166
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 9
      DesignSize = (
        166
        48)
      object UniDBEditsafra: TUniDBEdit
        Left = 3
        Top = 17
        Width = 160
        Height = 29
        Hint = ''
        DataField = 'SAFRAVALIDA'
        DataSource = dm_rc.dsbatidamestre
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
      end
      object UniLabel1: TUniLabel
        Left = 3
        Top = 1
        Width = 67
        Height = 15
        Hint = ''
        Caption = 'Safra V'#225'lida'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock100: TUniContainerPanel
      Left = 3
      Top = 294
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 10
      DesignSize = (
        150
        48)
      object btnLkpSearch: TUniBitBtn
        Left = 11
        Top = 13
        Width = 119
        Height = 29
        Hint = '[[cls:ButtonThemeCrud]]'
        Margins.Top = 28
        Margins.Bottom = 12
        Caption = '<i class="fas fa-bezier-curve">     Gerar Estoque</i>'
        Anchors = [akLeft, akRight, akBottom]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
        OnClick = btnLkpSearchClick
      end
    end
    object rcBlock110: TUniContainerPanel
      Left = 172
      Top = 294
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 11
      DesignSize = (
        150
        48)
      object UniBitBtn1: TUniBitBtn
        Left = 13
        Top = 13
        Width = 119
        Height = 29
        Hint = '[[cls:ButtonThemeCrud]]'
        Margins.Top = 28
        Margins.Bottom = 12
        Caption = 'Sair'
        Anchors = [akLeft, akRight, akBottom]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
        OnClick = UniBitBtn1Click
      end
    end
  end
end
