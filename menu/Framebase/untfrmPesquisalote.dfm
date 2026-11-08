object frmpesquisalote: Tfrmpesquisalote
  Left = 0
  Top = 0
  ClientHeight = 517
  ClientWidth = 722
  Caption = 'Pesquisa Lote\Boletim'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  TextHeight = 15
  object rcBlock10: TUniContainerPanel
    Tag = 1
    Left = 8
    Top = 8
    Width = 185
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 0
    DesignSize = (
      185
      48)
    object UniLabelv1: TUniLabel
      AlignWithMargins = True
      Left = 1
      Top = 0
      Width = 122
      Height = 15
      Hint = ''
      Margins.Left = 10
      Margins.Top = 15
      Caption = 'Conte'#250'do da Pesquisa'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
    end
    object edSearchCRUDconteudo: TUniEdit
      Left = 1
      Top = 17
      Width = 176
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
      EmptyText = 'digite o conte'#250'do a ser pesquisado'
      ClearButton = True
    end
  end
  object rcBlock20: TUniContainerPanel
    Tag = 1
    Left = 196
    Top = 8
    Width = 134
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 1
    DesignSize = (
      134
      48)
    object cbxSearchCRUDFieldordem: TUniComboBox
      AlignWithMargins = True
      Left = 3
      Top = 17
      Width = 126
      Height = 30
      Hint = ''
      Margins.Right = 5
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'Emiss'#227'o'
        'Vencimento'
        'Pagamento')
      Anchors = [akLeft, akRight, akBottom]
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      IconItems = <>
    end
    object UniLabel1: TUniLabel
      AlignWithMargins = True
      Left = 3
      Top = 0
      Width = 24
      Height = 15
      Hint = ''
      Margins.Left = 10
      Margins.Top = 15
      Caption = 'Tipo'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object rcBlock30: TUniContainerPanel
    Tag = 1
    Left = 336
    Top = 8
    Width = 113
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 2
    DesignSize = (
      113
      48)
    object UniComboBoxestoque: TUniComboBox
      AlignWithMargins = True
      Left = 3
      Top = 17
      Width = 107
      Height = 30
      Hint = ''
      Margins.Right = 5
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'Emiss'#227'o'
        'Vencimento'
        'Pagamento')
      Anchors = [akLeft, akRight, akBottom]
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      IconItems = <>
    end
    object UniLabel2: TUniLabel
      AlignWithMargins = True
      Left = 3
      Top = 0
      Width = 43
      Height = 15
      Hint = ''
      Margins.Left = 10
      Margins.Top = 15
      Caption = 'Estoque'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object rcBlock40: TUniContainerPanel
    Tag = 1
    Left = 564
    Top = 8
    Width = 150
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 3
    DesignSize = (
      150
      48)
    object btnLkpSearch: TUniBitBtn
      Left = 16
      Top = 17
      Width = 119
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
    TabOrder = 4
    object UniDBGridLOTE: TUniDBGrid
      Left = 0
      Top = 0
      Width = 706
      Height = 428
      Hint = ''
      TitleFont.Name = 'Calibri'
      DataSource = dslote
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
      OnDblClick = UniDBGridLOTEDblClick
      Columns = <
        item
          FieldName = 'PRODUTO'
          Title.Caption = 'PRODUTO'
          Width = 74
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'CULTIVAR'
          Title.Caption = 'CULTIVAR'
          Width = 130
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'LOTE'
          Title.Caption = 'LOTE'
          Width = 100
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'BOLETIM'
          Title.Caption = 'BOLETIM'
          Width = 100
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'PESOEMBALAGEM'
          Title.Caption = 'PESO EMB.'
          Width = 74
          Font.Name = 'Calibri'
          Alignment = taCenter
        end
        item
          FieldName = 'SACOSQTE'
          Title.Caption = 'EST. SACO'
          Width = 80
          Font.Name = 'Calibri'
          Alignment = taCenter
        end
        item
          FieldName = 'DISPONIVEL'
          Title.Caption = 'DISPONIVEL'
          Width = 100
          Font.Name = 'Calibri'
        end>
    end
  end
  object rcBlock60: TUniContainerPanel
    Left = 0
    Top = 496
    Width = 722
    Height = 21
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 5
    DesignSize = (
      722
      21)
    object labTotReg: TUniLabel
      Left = 0
      Top = 2
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
      TabOrder = 1
    end
    object dbgSearchCRUD: TUniDBGrid
      Left = 3
      Top = -388
      Width = 687
      Height = 406
      Hint = ''
      TitleFont.Name = 'Calibri'
      DataSource = dm_rc.dsLookUpSearch
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      WebOptions.FetchAll = True
      LoadMask.WaitData = True
      LoadMask.Message = 'Loading data...'
      ForceFit = True
      BorderStyle = ubsNone
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Height = -13
      Font.Name = 'Calibri'
      ParentFont = False
      TabOrder = 2
    end
  end
  object UniContainerPanel1: TUniContainerPanel
    Tag = 1
    Left = 454
    Top = 8
    Width = 107
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 6
    DesignSize = (
      107
      48)
    object UniComboBoxstatus: TUniComboBox
      AlignWithMargins = True
      Left = 3
      Top = 17
      Width = 101
      Height = 30
      Hint = ''
      Margins.Right = 5
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'Ativo'
        'Inativo'
        'Todos')
      Anchors = [akLeft, akRight, akBottom]
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      IconItems = <>
    end
    object UniLabel3: TUniLabel
      AlignWithMargins = True
      Left = 3
      Top = 0
      Width = 34
      Height = 15
      Hint = ''
      Margins.Left = 10
      Margins.Top = 15
      Caption = 'Status'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object tblote: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 616
    Top = 110
    object tblotePRODUTO: TIntegerField
      FieldName = 'PRODUTO'
    end
    object tbloteNOME: TStringField
      FieldName = 'NOME'
      Size = 80
    end
    object tbloteLOTE: TStringField
      FieldName = 'LOTE'
      Size = 60
    end
    object tbloteBOLETIM: TStringField
      FieldName = 'BOLETIM'
      Size = 60
    end
    object tbloteDISPONIVEL: TFloatField
      FieldName = 'DISPONIVEL'
      DisplayFormat = '0.##'
      EditFormat = '0.##'
    end
    object tbloteSACOSQTE: TFloatField
      FieldName = 'SACOSQTE'
    end
    object tbloteTERMO: TStringField
      FieldName = 'TERMO'
      Size = 60
    end
    object tbloteCULTIVAR: TStringField
      FieldName = 'CULTIVAR'
    end
    object tblotePESOEMBALAGEM: TFloatField
      FieldName = 'PESOEMBALAGEM'
    end
    object tbloteCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
  end
  object dslote: TDataSource
    DataSet = tblote
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
    Top = 13
  end
end
