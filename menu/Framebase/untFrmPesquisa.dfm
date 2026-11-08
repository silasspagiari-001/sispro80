object frmPesquisa: TfrmPesquisa
  Left = 0
  Top = 0
  ClientHeight = 517
  ClientWidth = 722
  Caption = 'Pesquisas'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  DesignSize = (
    722
    517)
  TextHeight = 15
  object rcBlock10: TUniContainerPanel
    Left = 12
    Top = 6
    Width = 437
    Height = 54
    Hint = '[[cols:xs-12 sm-12 md-6]]'
    ParentColor = False
    TabOrder = 0
    DesignSize = (
      437
      54)
    object edSearchCRUDconteudo: TUniEdit
      Left = 0
      Top = 24
      Width = 290
      Height = 29
      Hint = ''
      Margins.Left = 10
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      Anchors = [akLeft, akBottom]
      TabOrder = 1
      EmptyText = 'digite o conte'#250'do a ser pesquisado'
      ClearButton = True
    end
    object UniLabelv1: TUniLabel
      AlignWithMargins = True
      Left = 0
      Top = 0
      Width = 193
      Height = 17
      Hint = ''
      Margins.Left = 10
      Margins.Top = 15
      AutoSize = False
      Caption = 'Conte'#250'do da Pesquisa'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
    end
    object cbxSearchCRUDFieldordem: TUniComboBox
      AlignWithMargins = True
      Left = 296
      Top = 24
      Width = 137
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
      TabOrder = 3
      IconItems = <>
    end
  end
  object rcBlock40: TUniContainerPanel
    Left = 14
    Top = 74
    Width = 691
    Height = 435
    Hint = '[[cols:12 | scale:parent h:100%-top off:60]]'
    ParentColor = False
    Anchors = [akLeft, akTop, akBottom]
    TabOrder = 1
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
      TabOrder = 1
      OnDblClick = dbgSearchCRUDDblClick
      OnDrawColumnCell = dbgSearchCRUDDrawColumnCell
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
  object rcBlock20: TUniContainerPanel
    Left = 472
    Top = 8
    Width = 119
    Height = 52
    Hint = 
      '[['#13#10'cols:xs-6 sm-6 md-3 |'#13#10'hr:xs-(btnLkpClear+1) sm-(btnLkpClear' +
      '+1) md-rcBlock10  ]]'
    ParentColor = False
    TabOrder = 2
    DesignSize = (
      119
      52)
    object btnLkpSearch: TUniBitBtn
      Left = 0
      Top = 22
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
  object rcBlock30: TUniContainerPanel
    Left = 610
    Top = 10
    Width = 95
    Height = 52
    Hint = 
      '[['#13#10'cols:xs-6 sm-6 md-3 | '#13#10'hr:xs-(btnLkpClear+1) sm-(btnLkpClea' +
      'r+1) md-rcBlock10 '#13#10']]'
    ParentColor = False
    TabOrder = 3
    DesignSize = (
      95
      52)
    object btnLkpClear: TUniBitBtn
      Left = 0
      Top = 22
      Width = 95
      Height = 29
      Hint = '[[cls:ButtonThemeCrud]]'
      Margins.Top = 28
      Margins.Bottom = 12
      Caption = 'Transfere'
      Anchors = [akLeft, akRight, akBottom]
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = btnLkpClearClick
    end
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
