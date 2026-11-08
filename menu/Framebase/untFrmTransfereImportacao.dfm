object frmTransfereImportacao: TfrmTransfereImportacao
  Left = 0
  Top = 0
  ClientHeight = 527
  ClientWidth = 722
  Caption = 'Importar documento de origem'
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
    Width = 129
    Height = 50
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 0
    DesignSize = (
      129
      50)
    object cbxSearchCRUDFieldordem: TUniComboBox
      AlignWithMargins = True
      Left = 3
      Top = 19
      Width = 116
      Height = 30
      Hint = ''
      Margins.Right = 5
      Style = csDropDownList
      Text = 'Pedido'
      Items.Strings = (
        'Pedido'
        'Or'#231'amento'
        'Nota')
      ItemIndex = 0
      Anchors = [akLeft, akRight, akBottom]
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      IconItems = <>
    end
    object UniLabelv1: TUniLabel
      AlignWithMargins = True
      Left = 3
      Top = 1
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
  object rcBlock20: TUniContainerPanel
    Tag = 1
    Left = 141
    Top = 8
    Width = 113
    Height = 50
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 1
    DesignSize = (
      113
      50)
    object edSearchCRUDconteudo: TUniEdit
      AlignWithMargins = True
      Left = 4
      Top = 19
      Width = 106
      Height = 30
      Hint = ''
      Margins.Left = 10
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      EmptyText = 'N'#195#186'mero'
      ClearButton = True
    end
    object UniLabel1: TUniLabel
      AlignWithMargins = True
      Left = 4
      Top = 1
      Width = 70
      Height = 15
      Hint = ''
      Margins.Left = 10
      Margins.Top = 15
      Caption = 'Numero Doc.'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object rcBlock30: TUniContainerPanel
    Tag = 1
    Left = 259
    Top = 8
    Width = 150
    Height = 50
    Hint = '[[cols:xs-12 sm-12 md-2]]'
    ParentColor = False
    TabOrder = 2
    DesignSize = (
      150
      50)
    object edSearchCRUDDtIni: TUniDateTimePicker
      AlignWithMargins = True
      Left = 6
      Top = 18
      Width = 139
      Height = 30
      Hint = ''
      Margins.Right = 5
      DateTime = 43232.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      ClientEvents.ExtEvents.Strings = (
        
          'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
          '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
          '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
          ':"  /  /   "});'#13#10'}')
    end
    object UniLabel2: TUniLabel
      AlignWithMargins = True
      Left = 6
      Top = 1
      Width = 49
      Height = 15
      Hint = ''
      Margins.Left = 10
      Margins.Top = 15
      Caption = 'Emiss'#227'o '
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object rcBlock40: TUniContainerPanel
    Tag = 1
    Left = 416
    Top = 8
    Width = 150
    Height = 50
    Hint = '[[cols:xs-12 sm-12 md-2]]'
    ParentColor = False
    TabOrder = 3
    DesignSize = (
      150
      50)
    object edSearchCRUDDtEnd: TUniDateTimePicker
      AlignWithMargins = True
      Left = 3
      Top = 18
      Width = 142
      Height = 30
      Hint = ''
      Margins.Right = 5
      DateTime = 43232.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      ClientEvents.ExtEvents.Strings = (
        
          'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
          '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
          '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
          ':"  /  /   "});'#13#10'}')
    end
    object UniLabel3: TUniLabel
      AlignWithMargins = True
      Left = 6
      Top = 1
      Width = 17
      Height = 15
      Hint = ''
      Margins.Left = 10
      Margins.Top = 15
      Caption = 'At'#233
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object rcBlock50: TUniContainerPanel
    Tag = 1
    Left = 572
    Top = 8
    Width = 150
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-2]]'
    ParentColor = False
    TabOrder = 4
    DesignSize = (
      150
      48)
    object btnLkpSearch: TUniBitBtn
      Left = 12
      Top = 18
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
  object UniContainerPanel1: TUniContainerPanel
    Left = 14
    Top = 74
    Width = 691
    Height = 435
    Hint = '[[cols:12 | scale:parent h:100%-top off:60]]'
    ParentColor = False
    TabOrder = 5
    DesignSize = (
      691
      435)
    object dbgSearchCRUD: TUniDBGrid
      Left = 3
      Top = 2
      Width = 687
      Height = 406
      Hint = ''
      TitleFont.Name = 'Calibri'
      DataSource = dm_rc.dsSqlPesquisa
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
      TabOrder = 1
      OnDblClick = dbgSearchCRUDDblClick
    end
    object paTotreg: TUniContainerPanel
      Left = 0
      Top = 405
      Width = 691
      Height = 30
      Hint = ''
      ParentColor = False
      Align = alBottom
      TabOrder = 2
      DesignSize = (
        691
        30)
      object labTotReg: TUniLabel
        Left = 1
        Top = 10
        Width = 687
        Height = 19
        Hint = ''
        Margins.Top = 10
        Alignment = taCenter
        AutoSize = False
        Caption = '0 registro(s)'
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
  end
end
