inherited frmCadCOMPRAS: TfrmCadCOMPRAS
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseTop: TUniContainerPanel
      inherited paBaseTopTitle: TUniContainerPanel
        inherited btnQuickSearch: TUniBitBtn
          ScreenMask.Target = Owner
        end
      end
    end
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 988
      ScrollWidth = 37
      inherited paNAE: TUniContainerPanel
        inherited btnEditReg: TUniBitBtn
          ScreenMask.Target = Owner
        end
      end
      inherited paGC: TUniContainerPanel
        inherited btnSaveReg: TUniBitBtn
          ScreenMask.Target = Owner
        end
        inherited btnCancelReg: TUniBitBtn
          ScreenMask.Target = Owner
        end
      end
    end
    inherited paBaseCadControl: TUniContainerPanel
      inherited pgBaseCadControl: TUniPageControl
        ActivePage = tabRegister
        inherited tabSearch: TUniTabSheet
          ExplicitTop = 24
          ExplicitHeight = 965
          inherited paBaseRegSearch: TUniContainerPanel
            Height = 965
            ExplicitHeight = 965
            inherited paGridOffset: TUniContainerPanel
              Height = 957
              ExplicitHeight = 957
              inherited dbgSearchCRUD: TUniDBGrid
                Height = 957
              end
            end
          end
        end
        inherited tabRegister: TUniTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 1361
          ExplicitHeight = 965
          inherited paBaseRegData1: TUniContainerPanel
            ScrollHeight = 965
            ScrollWidth = 1361
            object pgComplementData: TUniPageControl
              Left = 0
              Top = 0
              Width = 1361
              Height = 965
              Hint = ''
              Margins.Left = 10
              Margins.Top = 10
              Margins.Right = 10
              Margins.Bottom = 10
              ActivePage = tabGeral
              Align = alClient
              TabOrder = 1
              object tabGeral: TUniTabSheet
                Hint = ''
                Caption = 'Geral'
                object sboxTab1: TUniScrollBox
                  Left = 0
                  Top = 0
                  Width = 1353
                  Height = 935
                  Hint = ''
                  Align = alClient
                  TabOrder = 0
                  ScrollHeight = 367
                  ScrollWidth = 871
                  object UniDBEdit5: TUniDBEdit
                    Left = 835
                    Top = 16
                    Width = 15
                    Height = 22
                    Hint = ''
                    Visible = False
                    DataField = 'CODIEMP'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 0
                    ReadOnly = True
                    InputType = 'search'
                  end
                  object rcBlock10: TUniContainerPanel
                    Tag = 1
                    Left = 20
                    Top = 16
                    Width = 100
                    Height = 48
                    Hint = '[[cols:xs-6 sm-6 md-2]]'
                    ParentColor = False
                    TabOrder = 1
                    DesignSize = (
                      100
                      48)
                    object edCodigo: TUniDBEdit
                      Left = 0
                      Top = 18
                      Width = 100
                      Height = 29
                      Hint = ''
                      DataField = 'codigo'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Color = clWhite
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      Font.Style = [fsBold]
                      TabOrder = 1
                      Color = clGray
                      ReadOnly = True
                    end
                    object UniLabel3: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 38
                      Height = 15
                      Hint = ''
                      Caption = 'C'#243'digo'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock20: TUniContainerPanel
                    Tag = 1
                    Left = 131
                    Top = 8
                    Width = 142
                    Height = 48
                    Hint = '[[cols:xs-6 sm-6 md-3]]'
                    ParentColor = False
                    TabOrder = 2
                    DesignSize = (
                      142
                      48)
                    object UniLabel5: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 79
                      Height = 15
                      Hint = ''
                      Caption = 'Data Cadastro'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBDateTimePicker1: TUniDBDateTimePicker
                      Left = 0
                      Top = 19
                      Width = 142
                      Height = 29
                      Hint = ''
                      DataField = 'DTCADASTRO'
                      DataSource = dsMaster
                      DateTime = 43596.000000000000000000
                      DateFormat = 'dd/MM/yyyy'
                      TimeFormat = 'HH:mm:ss'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                    end
                  end
                  object rcBlock50: TUniContainerPanel
                    Tag = 1
                    Left = 289
                    Top = 10
                    Width = 256
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-7]]'
                    ParentColor = False
                    TabOrder = 3
                    DesignSize = (
                      256
                      48)
                    object UniLabel12: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 62
                      Height = 15
                      Hint = ''
                      Caption = 'Fornecedor'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object edLkpFORNECEDORES: TUniDBEdit
                      Left = 0
                      Top = 19
                      Width = 255
                      Height = 29
                      Hint = '[[nome CodiForn +]]'
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                      Color = clInfoBk
                      ReadOnly = True
                      InputType = 'text'
                    end
                  end
                  object rcBlock90: TUniContainerPanel
                    Tag = 1
                    Left = 15
                    Top = 145
                    Width = 142
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 4
                    DesignSize = (
                      142
                      48)
                    object UniLabel14: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 26
                      Height = 15
                      Hint = ''
                      Caption = 'Qtde'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object edQtde: TUniDBFormattedNumberEdit
                      Left = 0
                      Top = 19
                      Width = 142
                      Height = 29
                      Hint = ''
                      DataField = 'QTDE'
                      DataSource = dsCOMPRAS_PRODUTOS
                      Alignment = taRightJustify
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                      OnEnter = edQtdeEnter
                    end
                  end
                  object rcBlock100: TUniContainerPanel
                    Tag = 1
                    Left = 184
                    Top = 150
                    Width = 286
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-4]]'
                    ParentColor = False
                    TabOrder = 5
                    DesignSize = (
                      286
                      48)
                    object UniLabel15: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 44
                      Height = 15
                      Hint = ''
                      Caption = 'Produto'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object edLkpPRODUTOS: TUniDBEdit
                      Left = 0
                      Top = 18
                      Width = 286
                      Height = 29
                      Hint = '[['#13#10'DESCRICAO CodiProd @ ds:dsCOMPRAS_PRODUTOS !'#13#10']]'
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                      Color = clInfoBk
                      ReadOnly = True
                      InputType = 'text'
                      OnClick = edLkpPRODUTOSClick
                    end
                  end
                  object rcBlock110: TUniContainerPanel
                    Tag = 1
                    Left = 492
                    Top = 150
                    Width = 142
                    Height = 48
                    Hint = '[[cols:xs-6 sm-6 md-2]]'
                    ParentColor = False
                    TabOrder = 6
                    DesignSize = (
                      142
                      48)
                    object UniLabel16: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 29
                      Height = 15
                      Hint = ''
                      Caption = 'Valor'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                      Left = 0
                      Top = 19
                      Width = 142
                      Height = 29
                      Hint = ''
                      DataField = 'VALORUNIT'
                      DataSource = dsCOMPRAS_PRODUTOS
                      Alignment = taRightJustify
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                  end
                  object rcBlock120: TUniContainerPanel
                    Tag = 1
                    Left = 640
                    Top = 152
                    Width = 142
                    Height = 48
                    Hint = '[[cols:xs-6 sm-6 md-2]]'
                    ParentColor = False
                    TabOrder = 7
                    DesignSize = (
                      142
                      48)
                    object UniLabel17: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 27
                      Height = 15
                      Hint = ''
                      Caption = 'Total'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
                      Left = 0
                      Top = 19
                      Width = 142
                      Height = 29
                      Hint = ''
                      Enabled = False
                      DataField = 'TOTALPROD'
                      DataSource = dsCOMPRAS_PRODUTOS
                      Alignment = taRightJustify
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                  end
                  object rcBlock70: TUniContainerPanel
                    Tag = 4
                    Left = 15
                    Top = 90
                    Width = 317
                    Height = 30
                    Hint = '[[cols:12 | round:all]]'
                    ParentColor = False
                    TabOrder = 8
                    object UniLabel18: TUniLabel
                      AlignWithMargins = True
                      Left = 0
                      Top = 5
                      Width = 251
                      Height = 19
                      Hint = '[[cols:12 | round:all]]'
                      Margins.Left = 6
                      Margins.Top = 6
                      Margins.Right = 6
                      Margins.Bottom = 6
                      AutoSize = False
                      Caption = 'PRODUTOS'
                      ParentFont = False
                      Font.Color = clGray
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                  end
                  object rcBlock130: TUniContainerPanel
                    Tag = 1
                    Left = 796
                    Top = 147
                    Width = 70
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 9
                    object btnOk: TUniBitBtn
                      AlignWithMargins = True
                      Left = 1
                      Top = 18
                      Width = 32
                      Height = 29
                      Hint = '[[cls:ButtonThemeCrud | ico:fa-check 1x]]'
                      Margins.Left = 7
                      Margins.Top = 0
                      Margins.Right = 0
                      Caption = 'V'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      Font.Style = [fsBold]
                      TabOrder = 1
                      ScaleButton = False
                      LayoutConfig.Padding = '0 2 0 0'
                      OnClick = btnOkClick
                    end
                    object btnDel: TUniBitBtn
                      AlignWithMargins = True
                      Left = 35
                      Top = 18
                      Width = 32
                      Height = 29
                      Hint = '[[cls:ButtonThemeCrud | ico:fa-trash-alt ]]'
                      Margins.Left = 2
                      Margins.Top = 0
                      Caption = 'X'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      Font.Style = [fsBold]
                      TabOrder = 2
                      ScaleButton = False
                      LayoutConfig.Padding = '0 2 0 0'
                      OnClick = btnDelClick
                    end
                  end
                  object rcBlock460: TUniContainerPanel
                    Left = 10
                    Top = 203
                    Width = 861
                    Height = 164
                    Hint = 
                      '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'round:no | '#13#10'cls:card-info-box-wh' +
                      'ite |'#13#10'scale:parent h:100%-top off:15 | '#13#10']]'#13#10
                    ParentColor = False
                    TabOrder = 10
                    DesignSize = (
                      861
                      164)
                    object dbgProdutos: TUniDBGrid
                      AlignWithMargins = True
                      Left = 1
                      Top = 0
                      Width = 865
                      Height = 166
                      Hint = ''
                      ClientEvents.UniEvents.Strings = (
                        
                          'store.afterCreate=function store.afterCreate(sender)'#13#10'{'#13#10'  sende' +
                          'r.setRemoteSort(false);'#13#10'}')
                      TitleFont.Name = 'Calibri'
                      TitleFont.Style = [fsBold]
                      DataSource = dsCOMPRAS_PRODUTOS
                      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
                      WebOptions.Paged = False
                      LoadMask.Message = 'Loading data...'
                      BorderStyle = ubsNone
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      ParentFont = False
                      TabOrder = 1
                      ParentColor = False
                      Color = 15395562
                      TabKeyBehavior = tkNextComponent
                      OnCellClick = dbgProdutosCellClick
                      OnDrawColumnCell = dbgProdutosDrawColumnCell
                    end
                  end
                end
              end
            end
          end
        end
      end
      inherited paSearchFilters: TUniPanel
        inherited UniScrollBox1: TUniScrollBox
          ScrollHeight = 926
          ScrollWidth = 164
          ScrollY = 226
          inherited paSearchFilterDate: TUniContainerPanel
            Top = 528
            ExplicitTop = 528
          end
          inherited paSearchFilter1: TUniContainerPanel
            Top = 47
            ExplicitTop = 47
          end
          inherited paSearchContent1: TUniContainerPanel
            Top = 167
            ExplicitTop = 167
          end
          inherited paSearchFilter2: TUniContainerPanel
            Top = 287
            ExplicitTop = 287
          end
          inherited paSearchContent2: TUniContainerPanel
            Top = 408
            ExplicitTop = 408
          end
          inherited paSearchFilterAndOr: TUniContainerPanel
            Top = 227
            ExplicitTop = 227
          end
          inherited labTitleSearch: TUniLabel
            Top = -216
          end
          inherited paSearchFilterPeriod: TUniContainerPanel
            Top = 468
            ExplicitTop = 468
          end
          inherited paSearchFilterPeriodSelect: TUniContainerPanel
            Top = 588
            ExplicitTop = 588
          end
          inherited paSearchBtn: TUniContainerPanel
            Top = 664
            ExplicitTop = 664
            inherited btnSearchCRUD: TUniBitBtn
              ScreenMask.Target = Owner
            end
          end
        end
      end
      inherited paSearchFiltersCustom: TUniPanel
        inherited sboxSearchFiltersCustom: TUniScrollBox
          ScrollHeight = 33
        end
      end
    end
  end
  inherited dsMaster: TDataSource
    Left = 942
  end
  inherited sqlSearchMaster: TFDQuery
    Left = 959
  end
  inherited sqlMaster: TFDQuery
    AfterOpen = sqlMasterAfterOpen
    SQL.Strings = (
      'SELECT'
      ''
      'tab.* '
      ''
      'FROM  compras tab'
      '')
    Left = 941
  end
  inherited FDSchemaAdapter1: TFDSchemaAdapter
    Left = 916
    Top = 548
  end
  object dsMemTipoOS: TDataSource
    DataSet = memTipoOS
    Left = 758
    Top = 434
  end
  object memTipoOS: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 756
    Top = 393
  end
  object COMPRAS_PRODUTOS: TFDQuery
    BeforePost = COMPRAS_PRODUTOSBeforePost
    CachedUpdates = True
    MasterSource = dsMaster
    MasterFields = 'CODIGO'
    DetailFields = 'CODICOMPRA'
    Connection = mm.SQLConn
    SchemaAdapter = FDSchemaAdapter1
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    FormatOptions.StrsTrim2Len = True
    SQL.Strings = (
      'select'
      ''
      
        '  cp.codicompra, cp.codiprod, p.descricao as produto, cp.qtde, c' +
        'p.valorunit, cp.totalprod'
      ''
      'from compras_produtos cp'
      ''
      'left join produtos p on p.codigo = cp.codiprod'
      ''
      'where cp.codicompra = :codicompra')
    Left = 765
    Top = 489
    ParamData = <
      item
        Name = 'CODICOMPRA'
        ParamType = ptInput
      end>
  end
  object dsCOMPRAS_PRODUTOS: TDataSource
    DataSet = COMPRAS_PRODUTOS
    OnStateChange = dsCOMPRAS_PRODUTOSStateChange
    Left = 760
    Top = 535
  end
end
