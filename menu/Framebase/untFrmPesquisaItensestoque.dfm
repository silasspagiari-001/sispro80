object frmpesquisaitensestoque: Tfrmpesquisaitensestoque
  Left = 0
  Top = 0
  ClientHeight = 517
  ClientWidth = 722
  Caption = 'Pesquisa Estoque Produto(s)'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnBeforeShow = UniFormBeforeShow
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  TextHeight = 15
  object rcBlock10: TUniContainerPanel
    Tag = 1
    Left = 8
    Top = 8
    Width = 108
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 0
    DesignSize = (
      108
      48)
    object UniLabelv1: TUniLabel
      AlignWithMargins = True
      Left = 1
      Top = 0
      Width = 72
      Height = 15
      Hint = ''
      Margins.Left = 10
      Margins.Top = 15
      Caption = 'Numero Nota'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
    end
    object ednumero: TUniEdit
      Left = 1
      Top = 17
      Width = 104
      Height = 29
      Hint = ''
      Margins.Left = 10
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      Anchors = [akLeft, akBottom]
      TabOrder = 2
      ClearButton = True
    end
  end
  object UniContainerPanel1: TUniContainerPanel
    Tag = 1
    Left = 117
    Top = 8
    Width = 92
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 1
    DesignSize = (
      92
      48)
    object UniLabel1: TUniLabel
      AlignWithMargins = True
      Left = 1
      Top = 0
      Width = 44
      Height = 15
      Hint = ''
      Margins.Left = 10
      Margins.Top = 15
      Caption = 'Produto'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
    end
    object edbproduto: TUniButtonEdit
      AlignWithMargins = True
      Left = 0
      Top = 17
      Width = 89
      Height = 29
      Hint = ''
      Alignment = taRightJustify
      Text = '0'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      IconCls = 'search'
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Tag = 1
    Left = 210
    Top = 8
    Width = 125
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 2
    object UniLabel2: TUniLabel
      AlignWithMargins = True
      Left = 1
      Top = 0
      Width = 46
      Height = 15
      Hint = ''
      Margins.Left = 10
      Margins.Top = 15
      Caption = 'Emiss'#227'o'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
    end
    object edSearchCRUDDtIni: TUniDateTimePicker
      AlignWithMargins = True
      Left = 1
      Top = 17
      Width = 121
      Height = 29
      Hint = ''
      Margins.Right = 5
      DateTime = 43831.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 2
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      ClientEvents.ExtEvents.Strings = (
        
          'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
          '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
          '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
          ':"  /  /   "});'#13#10'}')
    end
  end
  object UniContainerPanel3: TUniContainerPanel
    Tag = 1
    Left = 336
    Top = 8
    Width = 125
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 3
    object UniLabel3: TUniLabel
      AlignWithMargins = True
      Left = 1
      Top = 0
      Width = 17
      Height = 15
      Hint = ''
      Margins.Left = 10
      Margins.Top = 15
      Caption = 'at'#233
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
    end
    object edSearchCRUDDtfin: TUniDateTimePicker
      AlignWithMargins = True
      Left = 1
      Top = 17
      Width = 121
      Height = 29
      Hint = ''
      Margins.Right = 5
      DateTime = 43232.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 2
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      ClientEvents.ExtEvents.Strings = (
        
          'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
          '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
          '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
          ':"  /  /   "});'#13#10'}')
    end
  end
  object UniContainerPanel4: TUniContainerPanel
    Tag = 1
    Left = 463
    Top = 8
    Width = 125
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 4
    DesignSize = (
      125
      48)
    object UniLabel4: TUniLabel
      AlignWithMargins = True
      Left = 1
      Top = 0
      Width = 37
      Height = 15
      Hint = ''
      Margins.Left = 10
      Margins.Top = 15
      Caption = 'Ordem'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
    end
    object cbxSearchCRUDFieldordem: TUniComboBox
      AlignWithMargins = True
      Left = 2
      Top = 17
      Width = 120
      Height = 31
      Hint = ''
      Margins.Right = 5
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'NOC'
        'NFE'
        'PED'
        'ORC')
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
      IconItems = <>
    end
  end
  object UniContainerPanel5: TUniContainerPanel
    Tag = 1
    Left = 589
    Top = 8
    Width = 68
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 5
    DesignSize = (
      68
      48)
    object btnLkpSearch: TUniBitBtn
      Left = 3
      Top = 17
      Width = 62
      Height = 29
      Hint = '[[cls:ButtonThemeCrud]]'
      Margins.Top = 28
      Margins.Bottom = 12
      Caption = 'Pesquisa'
      Anchors = [akLeft, akRight, akBottom]
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = btnLkpSearchClick
    end
  end
  object rcBlock50: TUniContainerPanel
    Left = 8
    Top = 62
    Width = 706
    Height = 428
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    TabOrder = 6
    object UniDBGrid: TUniDBGrid
      Left = 0
      Top = 0
      Width = 706
      Height = 428
      Hint = ''
      TitleFont.Name = 'Calibri'
      DataSource = dsdisp
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.FetchAll = True
      LoadMask.WaitData = True
      LoadMask.Message = 'Loading data...'
      ForceFit = True
      BorderStyle = ubsNone
      Align = alClient
      Font.Height = -13
      Font.Name = 'Calibri'
      ParentFont = False
      TabOrder = 1
      OnDblClick = UniDBGridDblClick
      OnDrawColumnCell = UniDBGridDrawColumnCell
      Columns = <
        item
          FieldName = 'NUMERO'
          Title.Caption = 'NUMERO'
          Width = 100
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'SERIE'
          Title.Caption = 'SERIE'
          Width = 50
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'EMISSAO'
          Title.Caption = 'EMISSAO'
          Width = 100
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'SEQUENCIA'
          Title.Caption = 'SEQ.'
          Width = 30
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'PRODUTO'
          Title.Caption = 'PRODUTO'
          Width = 74
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'DESCRICAO'
          Title.Caption = 'DESCRICAO'
          Width = 150
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'QUANTIDADE'
          Title.Caption = 'QTDE'
          Width = 74
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'DISPONIVEL'
          Title.Caption = 'DISPONIVEL'
          Width = 80
          Font.Name = 'Calibri'
        end>
    end
  end
  object labTotReg: TUniLabel
    Left = 0
    Top = 498
    Width = 722
    Height = 19
    Hint = ''
    Margins.Top = 10
    Alignment = taCenter
    AutoSize = False
    Caption = '0 registro(s)'
    Align = alBottom
    ParentFont = False
    Font.Height = -13
    Font.Name = 'Calibri'
    TabOrder = 7
  end
  object UniContainerPanel6: TUniContainerPanel
    Tag = 1
    Left = 659
    Top = 8
    Width = 60
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 8
    DesignSize = (
      60
      48)
    object UniBitBtn1: TUniBitBtn
      Left = 3
      Top = 17
      Width = 54
      Height = 29
      Hint = '[[cls:ButtonThemeCrud]]'
      Margins.Top = 28
      Margins.Bottom = 12
      Caption = '<i class="fas fa-exchange-alt"></i>'
      Anchors = [akLeft, akRight, akBottom]
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = UniBitBtn1Click
    end
  end
  object tbdisp: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 616
    Top = 110
    object tbdispNUMERO: TStringField
      FieldName = 'NUMERO'
    end
    object tbdispSERIE: TStringField
      FieldName = 'SERIE'
    end
    object tbdispEMISSAO: TDateField
      FieldName = 'EMISSAO'
    end
    object tbdispPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
    end
    object tbdispSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
    end
    object tbdispDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object tbdispQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object tbdispDISPONIVEL: TFloatField
      FieldName = 'DISPONIVEL'
    end
    object tbdispCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object tbdispmarcado: TStringField
      FieldName = 'marcado'
      Size = 1
    end
  end
  object dsdisp: TDataSource
    DataSet = tbdisp
    Left = 648
    Top = 110
  end
  object timerClose: TUniTimer
    Interval = 700
    Enabled = False
    RunOnce = True
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = timerCloseTimer
    Left = 673
    Top = 109
  end
end
