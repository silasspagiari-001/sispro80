object frmDEMO_DYNAMIC_BIND: TfrmDEMO_DYNAMIC_BIND
  Left = 0
  Top = 0
  Width = 705
  Height = 457
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  object UniScrollBox1: TUniScrollBox
    Left = 0
    Top = 0
    Width = 705
    Height = 457
    Hint = ''
    Align = alClient
    TabOrder = 0
    ScrollHeight = 423
    ScrollWidth = 681
    object rcBlock16: TUniContainerPanel
      Left = 3
      Top = 2
      Width = 674
      Height = 46
      Hint = 
        '[['#13#10'cols:12 |'#13#10'/* scale:parent w:100%| */'#13#10'/* noborder-all */ | ' +
        #13#10'round:t | '#13#10'cls:card-light |'#13#10']]'#13#10#13#10#13#10
      ParentColor = False
      TabOrder = 0
      DesignSize = (
        674
        46)
      object btSair: TUniLabel
        Left = 4
        Top = 1
        Width = 33
        Height = 26
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent y|'#13#10'ico:fas-sign-out-alt rc-mirror-h |'#13#10']]'
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
        TabOrder = 1
        OnClick = btSairClick
      end
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 41
        Top = 6
        Width = 111
        Height = 23
        Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'align:btSair r:6'#13#10']]'
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Caption = 'Dynamic BIND'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 2
      end
      object btnEdit: TUniBitBtn
        Left = 491
        Top = 6
        Width = 85
        Height = 34
        Hint = 
          '[['#13#10'ico:fas-pencil-alt|'#13#10'cls:ButtonBlue|'#13#10'center:parent y |'#13#10'app' +
          'end'#13#10']]'#13#10
        Caption = 'Edit'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -13
        TabOrder = 3
        OnClick = btnEditClick
      end
      object btnSave: TUniBitBtn
        Left = 582
        Top = 3
        Width = 85
        Height = 34
        Hint = 
          '[['#13#10'ico:fas-save |'#13#10'cls:ButtonBlue|'#13#10'center:parent y |'#13#10'append'#13#10 +
          ']]'#13#10
        Caption = 'Save'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -13
        TabOrder = 4
        OnClick = btnSaveClick
      end
    end
    object rcBlock180: TUniContainerPanel
      Tag = 1
      Left = 12
      Top = 54
      Width = 669
      Height = 369
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'scale:parent h:100%-top off:default' +
        '-offset |'#13#10'min-height:200 mobile-220| '#13#10'round:no|'#13#10'cls:card-info' +
        '-box-white |'#13#10'noborder-top'#13#10']]'
      ParentColor = False
      TabOrder = 1
      object pgData: TUniPageControl
        Left = 8
        Top = 10
        Width = 623
        Height = 315
        Hint = '[['#13#10'anchor:'#13#10']]'
        ActivePage = tabSearch
        TabOrder = 1
        object tabSearch: TUniTabSheet
          Hint = ''
          Caption = 'Search'
          object UniScrollBox2: TUniScrollBox
            Left = 0
            Top = 0
            Width = 615
            Height = 287
            Hint = ''
            Align = alClient
            TabOrder = 0
            ScrollHeight = 244
            ScrollWidth = 574
            object rcBlock190: TUniContainerPanel
              Left = 23
              Top = 29
              Width = 361
              Height = 215
              Hint = 
                '[['#13#10'cols:xs-12 sm-12 md-12 lg-12 xl-12 4k-12 8k-12 |'#13#10'scale:pare' +
                'nt h:100%-top off:0 |'#13#10'noborder-all'#13#10']]'#13#10
              ParentColor = False
              TabOrder = 0
              DesignSize = (
                361
                215)
              object dbgActions: TUniDBGrid
                Left = 3
                Top = 1
                Width = 355
                Height = 211
                Hint = '[['#13#10'anchor:'#13#10']]'
                DataSource = dsDataQuery
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow, dgDontReloadAfterEdit]
                WebOptions.FetchAll = True
                LoadMask.Message = 'Loading data...'
                BufferedStore.PageSize = 50
                Anchors = [akLeft, akTop, akRight, akBottom]
                TabOrder = 1
                OnDrawColumnCell = dbgActionsDrawColumnCell
                OnColumnFilter = dbgActionsColumnFilter
              end
            end
            object hpMaster: TUniHiddenPanel
              Left = 398
              Top = 92
              Width = 176
              Height = 39
              Hint = ''
              Visible = True
            end
          end
        end
        object tabEdit: TUniTabSheet
          Hint = ''
          Caption = 'Edit'
          object UniScrollBox3: TUniScrollBox
            Left = 0
            Top = 0
            Width = 615
            Height = 287
            Hint = ''
            Align = alClient
            TabOrder = 0
            ScrollHeight = 231
            ScrollWidth = 599
            object rcBlock200: TUniContainerPanel
              Tag = 1
              Left = 10
              Top = 10
              Width = 111
              Height = 60
              Hint = '[['#13#10'cols:xs-4 sm-4 md-2'#13#10']]'
              ParentColor = False
              TabOrder = 0
              DesignSize = (
                111
                60)
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
                Top = 21
                Width = 110
                Height = 38
                Hint = 
                  '[['#13#10'bind:codigo ds:dsDataQuery'#13#10'/*   field      datasource  */'#13#10 +
                  ']]'#13#10
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
              Height = 60
              Hint = '[['#13#10'cols:xs-8 sm-8 md-4'#13#10']]'
              ParentColor = False
              TabOrder = 4
              DesignSize = (
                111
                60)
              object rcLabel210: TUniLabel
                Left = 0
                Top = 0
                Width = 27
                Height = 13
                Hint = ''
                Caption = 'Name'
                ParentFont = False
                TabOrder = 1
              end
              object rcEdit210: TUniEdit
                Left = 0
                Top = 21
                Width = 110
                Height = 38
                Hint = '[['#13#10'bind:nome ds:dsDataQuery'#13#10']]'
                CharCase = ecUpperCase
                Text = ''
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
              end
            end
            object rcBlock220: TUniContainerPanel
              Left = 272
              Top = 14
              Width = 122
              Height = 60
              Hint = '[[cols:xs-6 sm-6 md-3 lg-3 xl-3 4k-3 8k-3 ]]'
              ParentColor = False
              TabOrder = 3
              DesignSize = (
                122
                60)
              object UniLabel2: TUniLabel
                Left = 0
                Top = 0
                Width = 71
                Height = 13
                Hint = ''
                Caption = 'Contract Value'
                ParentFont = False
                TabOrder = 1
              end
              object UniFormattedNumberEdit1: TUniFormattedNumberEdit
                Left = 0
                Top = 21
                Width = 122
                Height = 38
                Hint = '[['#13#10'bind:valor_contrato ds:dsDataQuery'#13#10']]'
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                DecimalSeparator = ','
                ThousandSeparator = '.'
              end
            end
            object rcBlock230: TUniContainerPanel
              Tag = 1
              Left = 414
              Top = 9
              Width = 111
              Height = 60
              Hint = '[[cols:xs-6 sm-6 md-3 lg-3 xl-3 4k-3 8k-3 ]]'
              ParentColor = False
              TabOrder = 5
              DesignSize = (
                111
                60)
              object rcLabel300: TUniLabel
                Left = 0
                Top = 0
                Width = 68
                Height = 13
                Hint = ''
                Caption = 'Contract Date'
                ParentFont = False
                TabOrder = 1
              end
              object rcDateTimePicker300: TUniDateTimePicker
                Left = 0
                Top = 21
                Width = 110
                Height = 38
                Hint = '[['#13#10'bind:dtcadastro ds:dsDataQuery'#13#10']]'
                DateTime = 45161.000000000000000000
                DateFormat = 'dd/MM/yyyy'
                TimeFormat = 'HH:mm:ss'
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                DisabledDates = <>
              end
            end
            object rcBlock240: TUniContainerPanel
              Left = 18
              Top = 126
              Width = 122
              Height = 60
              Hint = '[[cols:xs-12 sm-12 md-2 ]]'
              ParentColor = False
              TabOrder = 2
              DesignSize = (
                122
                60)
              object UniLabel3: TUniLabel
                Left = 0
                Top = 0
                Width = 31
                Height = 13
                Hint = ''
                Caption = 'Status'
                ParentFont = False
                TabOrder = 1
              end
              object Inactive: TUniCheckBox
                Left = 1
                Top = 26
                Width = 115
                Height = 29
                Hint = '[['#13#10'bind:ativo ds:dsDataQuery y:S n:N'#13#10']]'#13#10
                Caption = 'Active'
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
              end
            end
            object rcBlock250: TUniContainerPanel
              Left = 174
              Top = 140
              Width = 122
              Height = 91
              Hint = '[[cols:xs-12 sm-12 md-2 ]]'
              ParentColor = False
              TabOrder = 1
              DesignSize = (
                122
                91)
              object UniRadioGroup1: TUniRadioGroup
                Left = 2
                Top = 2
                Width = 119
                Height = 87
                Hint = '[['#13#10'bind:pessoa ds:dsDataQuery values:F,J'#13#10']]'#13#10#13#10#13#10
                Items.Strings = (
                  'F'#237'sica'
                  'Jur'#237'dica')
                Anchors = [akLeft, akTop, akRight, akBottom]
                Caption = 'Person'
                TabOrder = 1
              end
            end
            object rcBlock260: TUniContainerPanel
              Tag = 1
              Left = 328
              Top = 92
              Width = 111
              Height = 60
              Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
              ParentColor = False
              TabOrder = 6
              DesignSize = (
                111
                60)
              object rcLabel260: TUniLabel
                Left = 0
                Top = 0
                Width = 64
                Height = 13
                Hint = ''
                Caption = 'Person( cbx )'
                ParentFont = False
                TabOrder = 1
              end
              object rcComboBox260: TUniComboBox
                Left = 0
                Top = 21
                Width = 110
                Height = 38
                Hint = '[['#13#10'bind:pessoa ds:dsDataQuery values:F,J'#13#10']]'
                Text = ''
                Items.Strings = (
                  'F'#237'sica'
                  'Jur'#237'dica')
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                IconItems = <>
              end
            end
            object rcBlock270: TUniContainerPanel
              Tag = 1
              Left = 456
              Top = 92
              Width = 143
              Height = 60
              Hint = '[[cols:xs-12 sm-12 md-6]]'
              ParentColor = False
              TabOrder = 7
              DesignSize = (
                143
                60)
              object UniLabel1Clone: TUniLabel
                Left = 0
                Top = -3
                Width = 51
                Height = 15
                Hint = '[['#13#10'pos-l:0|'#13#10'pos-t:0'#13#10']]'
                Caption = 'Company'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object edLkpEMPRESAS: TUniDBEdit
                Left = 0
                Top = 21
                Width = 142
                Height = 38
                Hint = 
                  '[['#13#10'DESCRICAO searchonly ! searchall |'#13#10'bind:codiemp ds:dsDataQu' +
                  'ery '#13#10']]'#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10
                CharCase = ecUpperCase
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                Color = clInfoBk
                ReadOnly = True
                InputType = 'text'
              end
            end
          end
        end
      end
    end
  end
  object sqlDataQuery: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'select * '
      'from clientes'
      'where 1<>1'
      '')
    Left = 576
    Top = 36
  end
  object dsDataQuery: TDataSource
    AutoEdit = False
    DataSet = sqlDataQuery
    OnStateChange = dsDataQueryStateChange
    Left = 576
    Top = 84
  end
  object rcSweetAlert: TUniSweetAlert
    Title = 'Title'
    ConfirmButtonText = 'OK'
    CancelButtonText = 'Cancel'
    ImageIndex = 0
    Padding = 20
    FocusCancel = True
    Left = 232
    Top = 28
  end
  object memLkpClients: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 554
    Top = 258
  end
  object dsLkpClients: TDataSource
    AutoEdit = False
    DataSet = memLkpClients
    Left = 556
    Top = 312
  end
end
