object frmCADCHEQUESMOVIMENTO: TfrmCADCHEQUESMOVIMENTO
  Left = 0
  Top = 0
  ClientHeight = 410
  ClientWidth = 713
  Caption = 'Lan'#231'amento de Cheques'
  OnShow = UniFormShow
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  TextHeight = 15
  object rcBlock10: TUniContainerPanel
    Left = 0
    Top = 376
    Width = 713
    Height = 34
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 0
    object btnLkpClear: TUniBitBtn
      Left = 618
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
      OnClick = btnLkpClearClick
    end
    object btnNewReg: TUniBitBtn
      AlignWithMargins = True
      Left = 2
      Top = 1
      Width = 33
      Height = 32
      Hint = '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black'#13#10']]'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '<i class="fas fa-plus"></i>'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri'
      TabOrder = 2
      ScaleButton = False
      ScreenMask.Target = Owner
      LayoutConfig.Padding = '0 2 0 0'
      OnClick = btnNewRegClick
    end
    object UniBitBtnedit: TUniBitBtn
      AlignWithMargins = True
      Left = 39
      Top = 1
      Width = 33
      Height = 32
      Hint = 
        '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
        #13#10']]'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '<i class="fas fa-pencil-alt"></i>'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri'
      TabOrder = 3
      ScaleButton = False
      ScreenMask.Target = Owner
      LayoutConfig.Padding = '0 2 0 0'
      OnClick = UniBitBtneditClick
    end
    object UniBitBtncancel: TUniBitBtn
      AlignWithMargins = True
      Left = 116
      Top = 1
      Width = 33
      Height = 32
      Hint = 
        '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
        #13#10']]'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '<i class="fas fa-ban"></i>'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri'
      TabOrder = 4
      ScaleButton = False
      ScreenMask.Target = Owner
      LayoutConfig.Padding = '0 2 0 0'
      OnClick = UniBitBtncancelClick
    end
    object UniBitBtnsave: TUniBitBtn
      AlignWithMargins = True
      Left = 153
      Top = 1
      Width = 33
      Height = 32
      Hint = 
        '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
        #13#10']]'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '<i class="fas fa-save"></i>'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri'
      TabOrder = 5
      ScaleButton = False
      ScreenMask.Target = Owner
      LayoutConfig.Padding = '0 2 0 0'
      OnClick = UniBitBtnsaveClick
    end
    object UniBitBtnexclui: TUniBitBtn
      AlignWithMargins = True
      Left = 77
      Top = 1
      Width = 33
      Height = 32
      Hint = 
        '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
        #13#10']]'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '<i class="fas fa-trash-alt"></i>'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri'
      TabOrder = 6
      ScaleButton = False
      ScreenMask.Target = Owner
      LayoutConfig.Padding = '0 2 0 0'
      OnClick = UniBitBtnexcluiClick
    end
  end
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 713
    Height = 217
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 1
    object UniDBGridEntrega: TUniDBGrid
      Left = 0
      Top = 0
      Width = 713
      Height = 217
      Hint = ''
      DataSource = dsfiltro
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
      WebOptions.Paged = False
      LoadMask.Message = 'Carregando Item(s)...'
      ForceFit = True
      Align = alClient
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Calibri'
      ParentFont = False
      TabOrder = 1
      Summary.Enabled = True
      OnCellClick = UniDBGridEntregaCellClick
      Columns = <
        item
          FieldName = 'STATUS'
          Title.Caption = ' '
          Width = 70
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Alignment = taCenter
        end
        item
          FieldName = 'PARCELA'
          Title.Caption = 'PARC'
          Width = 64
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Alignment = taCenter
        end
        item
          FieldName = 'EMISSAO'
          Title.Caption = 'EMISSAO'
          Width = 90
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'VENCIMENTO'
          Title.Caption = 'VENCIMENTO'
          Width = 90
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'BAIXA'
          Title.Caption = 'PAGAMENTO'
          Width = 90
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'VALOR'
          Title.Caption = 'VALOR'
          Width = 120
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end>
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 0
    Top = 219
    Width = 713
    Height = 157
    Hint = ''
    ParentColor = False
    TabOrder = 2
    object rcBlock20: TUniContainerPanel
      Left = 105
      Top = 4
      Width = 122
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        122
        48)
      object UniButtonDbEdit: TUniButtonDbEdit
        Tag = 1
        Left = 2
        Top = 16
        Width = 118
        Height = 29
        Hint = ''
        DataField = 'AGENCIA'
        DataSource = dscrud
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Color = clInfoBk
        IconCls = 'search'
      end
      object UniLabel7: TUniLabel
        Left = 3
        Top = 1
        Width = 43
        Height = 15
        Hint = ''
        Caption = 'Ag'#234'ncia'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel3: TUniContainerPanel
      Left = 230
      Top = 4
      Width = 122
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        122
        48)
      object UniDBEdit8: TUniDBEdit
        Tag = 1
        Left = 3
        Top = 16
        Width = 116
        Height = 29
        Hint = ''
        DataField = 'CONTA'
        DataSource = dscrud
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object UniLabel1: TUniLabel
        Left = 3
        Top = 1
        Width = 32
        Height = 15
        Hint = ''
        Caption = 'Conta'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel4: TUniContainerPanel
      Left = 354
      Top = 4
      Width = 122
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        122
        48)
      object UniDBEdit1: TUniDBEdit
        Left = 3
        Top = 16
        Width = 114
        Height = 29
        Hint = ''
        DataField = 'NUMERO_CHQ'
        DataSource = dscrud
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object UniLabel2: TUniLabel
        Left = 3
        Top = 1
        Width = 87
        Height = 15
        Hint = ''
        Caption = 'Numero do CHQ'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel5: TUniContainerPanel
      Left = 478
      Top = 4
      Width = 41
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        41
        48)
      object UniDBEdit2: TUniDBEdit
        Left = 4
        Top = 16
        Width = 33
        Height = 29
        Hint = ''
        DataField = 'PARCELA'
        DataSource = dscrud
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object UniLabel3: TUniLabel
        Left = 4
        Top = 1
        Width = 28
        Height = 15
        Hint = ''
        Caption = 'Parc.'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel6: TUniContainerPanel
      Left = 521
      Top = 4
      Width = 190
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        190
        48)
      object UniDBFormattedNumberEdit: TUniDBFormattedNumberEdit
        AlignWithMargins = True
        Left = 4
        Top = 16
        Width = 183
        Height = 29
        Hint = ''
        DataField = 'VALOR'
        DataSource = dscrud
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold, fsItalic]
        TabOrder = 1
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel4: TUniLabel
        Left = 3
        Top = 1
        Width = 73
        Height = 15
        Hint = ''
        Caption = 'Valor do CHQ'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel7: TUniContainerPanel
      Left = 3
      Top = 54
      Width = 122
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 6
      DesignSize = (
        122
        48)
      object UniDBDateTimePicker2: TUniDBDateTimePicker
        Left = 2
        Top = 16
        Width = 118
        Height = 29
        Hint = ''
        DataField = 'EMISSAO'
        DataSource = dscrud
        DateTime = 44561.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ClientEvents.ExtEvents.Strings = (
          
            'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
            '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
            '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
            ':"  /  /   "});'#13#10'}')
      end
      object UniLabel5: TUniLabel
        Left = 3
        Top = 1
        Width = 46
        Height = 15
        Hint = ''
        Caption = 'Emiss'#227'o'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel8: TUniContainerPanel
      Left = 128
      Top = 54
      Width = 122
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 7
      DesignSize = (
        122
        48)
      object UniDBDateTimePicker1: TUniDBDateTimePicker
        Left = 4
        Top = 16
        Width = 115
        Height = 29
        Hint = ''
        DataField = 'VENCIMENTO'
        DataSource = dscrud
        DateTime = 44561.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ClientEvents.ExtEvents.Strings = (
          
            'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
            '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
            '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
            ':"  /  /   "});'#13#10'}')
      end
      object UniLabel6: TUniLabel
        Left = 3
        Top = 1
        Width = 63
        Height = 15
        Hint = ''
        Caption = 'Vencimento'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel9: TUniContainerPanel
      Left = 252
      Top = 54
      Width = 266
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 8
      DesignSize = (
        266
        48)
      object UniDBEdit3: TUniDBEdit
        Tag = 1
        Left = 4
        Top = 16
        Width = 258
        Height = 29
        Hint = ''
        DataField = 'CORRENTISTA'
        DataSource = dscrud
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object UniLabel8: TUniLabel
        Left = 3
        Top = 1
        Width = 61
        Height = 15
        Hint = ''
        Caption = 'Correntista'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel10: TUniContainerPanel
      Left = 520
      Top = 54
      Width = 190
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 9
      DesignSize = (
        190
        48)
      object UniDBEdit4: TUniDBEdit
        Tag = 1
        Left = 4
        Top = 16
        Width = 184
        Height = 29
        Hint = ''
        DataField = 'CPFCNPJ'
        DataSource = dscrud
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
      object UniLabel9: TUniLabel
        Left = 3
        Top = 1
        Width = 112
        Height = 15
        Hint = ''
        Caption = 'Cpf/Cnpj Correntista'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel11: TUniContainerPanel
      Left = 2
      Top = 4
      Width = 100
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 10
      DesignSize = (
        100
        48)
      object UniButtonDbEdit1: TUniButtonDbEdit
        Tag = 1
        Left = 2
        Top = 16
        Width = 96
        Height = 29
        Hint = ''
        DataField = 'BANCO'
        DataSource = dscrud
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        Color = clInfoBk
        IconCls = 'search'
      end
      object UniLabel10: TUniLabel
        Left = 3
        Top = 1
        Width = 34
        Height = 15
        Hint = ''
        Caption = 'Banco'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock30: TUniContainerPanel
      Left = 3
      Top = 105
      Width = 707
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 11
      object UniDBMemo1: TUniDBMemo
        Left = 0
        Top = 0
        Width = 707
        Height = 48
        Hint = ''
        DataField = 'OBSERVACAO'
        DataSource = dscrud
        Align = alClient
        TabOrder = 1
        ClearButton = True
      end
    end
  end
  object dsfiltro: TDataSource
    AutoEdit = False
    DataSet = FDQryFiltro
    Left = 677
    Top = 14
  end
  object FDQryFiltro: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'SELECT * FROM CHEQUES')
    Left = 677
    Top = 46
  end
  object dscrud: TDataSource
    AutoEdit = False
    DataSet = FDQryCad
    Left = 677
    Top = 78
  end
  object FDQryCad: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    UpdateOptions.UpdateTableName = 'CHEQUES'
    SQL.Strings = (
      'SELECT * FROM CHEQUES WHERE CODIGO = :CODIGO')
    Left = 677
    Top = 110
    ParamData = <
      item
        Name = 'CODIGO'
        ParamType = ptInput
      end>
  end
end
