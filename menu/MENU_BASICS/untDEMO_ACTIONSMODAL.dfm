inherited frmDEMO_ACTIONSMODAL: TfrmDEMO_ACTIONSMODAL
  ClientHeight = 442
  ClientWidth = 704
  Caption = 'frmDEMO_ACTIONSMODAL'
  OnAfterShow = UniFormAfterShow
  ExplicitWidth = 704
  ExplicitHeight = 442
  PixelsPerInch = 96
  TextHeight = 13
  object UniScrollBox1: TUniScrollBox [0]
    Left = 0
    Top = 0
    Width = 704
    Height = 442
    Hint = ''
    Align = alClient
    TabOrder = 0
    object rcBlock16: TUniContainerPanel
      Left = 3
      Top = 3
      Width = 268
      Height = 38
      Hint = 
        '[['#13#10'cols:12 |'#13#10'scale:parent w:100%|'#13#10'noborder-all | '#13#10'round:t | ' +
        #13#10'cls:card-light |'#13#10']]'
      ParentColor = False
      TabOrder = 0
      object UniLabel3: TUniLabel
        Left = 45
        Top = 7
        Width = 218
        Height = 20
        Hint = '[['#13#10'bsh5:|'#13#10'cls:rc-label-clear |'#13#10'center:parent y'#13#10']]'
        AutoSize = False
        Caption = 'Actions Sample'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object btSair: TUniLabel
        Left = 4
        Top = 3
        Width = 33
        Height = 26
        Cursor = crHandPoint
        Hint = '[['#13#10'ico:fas-sign-out-alt rc-mirror-h |'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = '<'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSilver
        TabOrder = 2
        OnClick = btSairClick
      end
    end
    object rcBlock180: TUniContainerPanel
      Tag = 1
      Left = 12
      Top = 54
      Width = 669
      Height = 369
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'round:no | '#13#10'cls:card-info-box-whit' +
        'e|'#13#10'scale:parent h:100%-top off:20 |'#13#10'min-height:200 mobile-220|' +
        ' '#13#10']]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        669
        369)
      object dbgActionsModal: TUniDBGrid
        Left = 24
        Top = 39
        Width = 357
        Height = 211
        Hint = ''
        DataSource = dsActions
        WebOptions.FetchAll = True
        LoadMask.Message = 'Loading data...'
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        OnCellClick = dbgActionsModalCellClick
        OnDrawColumnCell = dbgActionsModalDrawColumnCell
      end
    end
    object hpForActionBtns: TUniHiddenPanel
      Left = 16
      Top = 310
      Width = 176
      Height = 82
      Hint = ''
      Visible = True
      object btnPrint: TUniBitBtn
        Left = 3
        Top = 3
        Width = 64
        Height = 25
        Hint = ''
        Caption = 'btnPrint'
        TabOrder = 1
        OnClick = btnPrintClick
      end
      object btnEdit: TUniBitBtn
        Left = 79
        Top = 3
        Width = 64
        Height = 25
        Hint = ''
        Caption = 'btnEdit'
        TabOrder = 2
        OnClick = btnEditClick
      end
      object btnDelete: TUniBitBtn
        Left = 3
        Top = 34
        Width = 64
        Height = 25
        Hint = ''
        Caption = 'btnDelete'
        TabOrder = 3
        OnClick = btnDeleteClick
      end
      object btnOptions: TUniBitBtn
        Left = 79
        Top = 34
        Width = 64
        Height = 25
        Hint = ''
        Caption = 'btnOptions'
        TabOrder = 4
        OnClick = btnOptionsClick
      end
    end
  end
  object sqlActions: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'select * '
      'from cidades'
      'order by codigo')
    Left = 310
    Top = 132
  end
  object dsActions: TDataSource
    AutoEdit = False
    DataSet = sqlActions
    OnStateChange = dsActionsStateChange
    Left = 312
    Top = 180
  end
end
