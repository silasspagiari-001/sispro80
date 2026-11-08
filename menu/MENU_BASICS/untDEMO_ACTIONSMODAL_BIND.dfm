inherited frmDEMO_ACTIONSMODAL_BIND: TfrmDEMO_ACTIONSMODAL_BIND
  ClientHeight = 442
  ClientWidth = 704
  Caption = 'frmDEMO_ACTIONSMODAL_BIND'
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
    ScrollHeight = 423
    ScrollWidth = 681
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
        Top = 1
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
      object pgData: TUniPageControl
        Left = 0
        Top = 54
        Width = 669
        Height = 315
        Hint = '[['#13#10'anchor:'#13#10']]'
        ActivePage = tabEdit
        Align = alClient
        TabOrder = 1
        object tabSearch: TUniTabSheet
          Hint = ''
          Caption = 'Search'
          object UniScrollBox2: TUniScrollBox
            Left = 0
            Top = 0
            Width = 661
            Height = 287
            Hint = ''
            Align = alClient
            TabOrder = 0
            ScrollHeight = 279
            ScrollWidth = 373
            object rcBlock190: TUniContainerPanel
              Left = 12
              Top = 64
              Width = 361
              Height = 215
              Hint = 
                '[['#13#10'cols:xs-12 sm-12 md-12 lg-12 xl-12 4k-12 8k-12 |'#13#10'scale:pare' +
                'nt h:100%-top off:0 |'#13#10'noborder-all'#13#10' ]]'
              ParentColor = False
              TabOrder = 0
              DesignSize = (
                361
                215)
              object dbgActions: TUniDBGrid
                Left = 2
                Top = 2
                Width = 357
                Height = 211
                Hint = ''
                DataSource = dsActions
                WebOptions.FetchAll = True
                LoadMask.Message = 'Loading data...'
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                OnCellClick = dbgActionsCellClick
                OnDrawColumnCell = dbgActionsDrawColumnCell
              end
            end
          end
        end
        object tabEdit: TUniTabSheet
          Hint = ''
          Caption = 'Edit'
          object UniScrollBox3: TUniScrollBox
            Left = 0
            Top = 0
            Width = 661
            Height = 287
            Hint = ''
            Align = alClient
            TabOrder = 0
            ScrollHeight = 58
            ScrollWidth = 373
            object rcBlock200: TUniContainerPanel
              Tag = 1
              Left = 10
              Top = 10
              Width = 111
              Height = 48
              Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
              ParentColor = False
              TabOrder = 0
              DesignSize = (
                111
                48)
              object rcLabel200: TUniLabel
                Left = 0
                Top = 0
                Width = 10
                Height = 13
                Hint = ''
                Caption = 'Id'
                ParentFont = False
                TabOrder = 1
              end
              object rcEdit200: TUniEdit
                Left = 0
                Top = 19
                Width = 110
                Height = 29
                Hint = '[['#13#10'bind:codigo dsActions'#13#10']]'
                CharCase = ecUpperCase
                Text = ''
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
              end
            end
            object rcBlock210: TUniContainerPanel
              Tag = 1
              Left = 138
              Top = 10
              Width = 111
              Height = 48
              Hint = '[['#13#10'cols:xs-12 sm-12 md-7'#13#10']]'
              ParentColor = False
              TabOrder = 1
              DesignSize = (
                111
                48)
              object rcLabel210: TUniLabel
                Left = 0
                Top = 0
                Width = 53
                Height = 13
                Hint = ''
                Caption = 'Description'
                ParentFont = False
                TabOrder = 1
              end
              object rcEdit210: TUniEdit
                Left = 0
                Top = 18
                Width = 110
                Height = 29
                Hint = '[['#13#10'bind:descricao dsActions'#13#10']]'
                CharCase = ecUpperCase
                Text = ''
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
              end
            end
            object rcBlock220: TUniContainerPanel
              Tag = 1
              Left = 262
              Top = 10
              Width = 111
              Height = 48
              Hint = '[['#13#10'cols:xs-12 sm-12 md-3'#13#10']]'
              ParentColor = False
              TabOrder = 2
              DesignSize = (
                111
                48)
              object rcLabel220: TUniLabel
                Left = 0
                Top = 0
                Width = 26
                Height = 13
                Hint = ''
                Caption = 'State'
                ParentFont = False
                TabOrder = 1
              end
              object edLkpUFS: TUniDBEdit
                Left = 0
                Top = 18
                Width = 110
                Height = 29
                Hint = '[['#13#10'DESCRICAO searchonly'#13#10']]'
                CharCase = ecUpperCase
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
              end
            end
          end
        end
      end
      object paPillSample: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 669
        Height = 54
        Hint = ''
        ParentColor = False
        Align = alTop
        TabOrder = 2
        object labPills: TUniLabel
          AlignWithMargins = True
          Left = 8
          Top = 10
          Width = 653
          Height = 34
          Hint = '[['#13#10'bspills:light cls:btn-sm pgc:pgData closeall:off '#13#10']]'#13#10
          Margins.Left = 8
          Margins.Top = 10
          Margins.Right = 8
          Margins.Bottom = 10
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'bsPills'
          Align = alClient
          ParentFont = False
          Font.Height = -16
          ParentColor = False
          Color = clBtnFace
          TabOrder = 1
        end
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
    Left = 646
    Top = 18
  end
  object dsActions: TDataSource
    AutoEdit = False
    DataSet = sqlActions
    OnStateChange = dsActionsStateChange
    Left = 648
    Top = 66
  end
end
