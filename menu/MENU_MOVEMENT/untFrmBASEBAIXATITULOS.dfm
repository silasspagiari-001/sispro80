inherited frmBASEBAIXATITULOS: TfrmBASEBAIXATITULOS
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseTop: TUniContainerPanel
      object labExit: TUniLabel
        Left = 8
        Top = 8
        Width = 33
        Height = 26
        Cursor = crHandPoint
        Hint = '[['#13#10'ico:fas-sign-out-alt rc-mirror-h'#13#10']]'
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
      end
      object UniLabelTOTALTITULOS: TUniLabel
        Left = 49
        Top = 8
        Width = 54
        Height = 26
        Hint = '[['#13#10'caption-dots:mobile-v-16 '#13#10']]'#13#10#13#10
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        Caption = 'SOMA'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSkyBlue
        TabOrder = 2
      end
    end
    object paBaseButtons: TUniContainerPanel
      Left = 0
      Top = 40
      Width = 37
      Height = 610
      Hint = ''
      Margins.Left = 4
      Margins.Top = 2
      Margins.Right = 6
      ParentColor = False
      Color = clWhite
      Align = alLeft
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      AutoScroll = True
      TabOrder = 2
      ScrollHeight = 610
      ScrollWidth = 37
      object paOF: TUniContainerPanel
        AlignWithMargins = True
        Left = 0
        Top = 282
        Width = 37
        Height = 89
        Hint = ''
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 0
        ParentColor = False
        Align = alTop
        TabOrder = 4
        object btnCloseForm: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 20
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-sign-out-alt rc-mirror-h | '#13#10'cls' +
            '-ico:font-black'#13#10']]'
          Margins.Left = 2
          Margins.Top = 20
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '<'
          Align = alTop
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
        end
      end
      object paP: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 37
        Height = 39
        Hint = ''
        Margins.Top = 6
        ParentColor = False
        Align = alTop
        TabOrder = 0
        object btnSearch: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 0
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-search | '#13#10'cls-ico:font-black |'#13#10 +
            'hint:Abre para Pesquisas t:Search w:200 d:10000 c:rc-bg-info'#13#10']]' +
            #13#10
          Margins.Left = 2
          Margins.Top = 0
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '@'
          Align = alTop
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnSearchClick
        end
      end
      object paNAE: TUniContainerPanel
        AlignWithMargins = True
        Left = 0
        Top = 59
        Width = 37
        Height = 110
        Hint = ''
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 0
        ParentColor = False
        Align = alTop
        TabOrder = 2
        object btnOptions: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 33
          Height = 32
          Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-cog | '#13#10'cls-ico:font-black'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '='
          Align = alTop
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnOptionsClick
        end
      end
      object paGC: TUniContainerPanel
        AlignWithMargins = True
        Left = 0
        Top = 189
        Width = 37
        Height = 73
        Hint = ''
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 0
        ParentColor = False
        Align = alTop
        TabOrder = 3
      end
    end
    object pgBaseCadControl: TUniPageControl
      Left = 37
      Top = 40
      Width = 983
      Height = 610
      Hint = ''
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 9
      Margins.Bottom = 8
      ActivePage = tabSearch
      Align = alClient
      TabOrder = 3
      object tabSearch: TUniTabSheet
        Hint = ''
        Caption = 'Pesquisa'
        Font.Height = -13
        Font.Name = 'Calibri'
        ParentFont = False
        object paBaseRegSearch: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 975
          Height = 580
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 0
          object paSearchFilters: TUniPanel
            Left = 0
            Top = 0
            Width = 266
            Height = 580
            Hint = ''
            Margins.Top = 0
            Margins.Right = 0
            Align = alLeft
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 0
            BorderStyle = ubsNone
            Title = 'Filtros da Pesquisa'
            Caption = ''
            CollapseDirection = cdLeft
            object UniScrollBox1: TUniScrollBox
              Left = 0
              Top = 0
              Width = 266
              Height = 580
              Hint = ''
              Margins.Left = 0
              Margins.Right = 0
              Align = alClient
              Color = 15724527
              TabOrder = 1
              ScrollHeight = 446
              ScrollWidth = 262
              object paSearchFilter1: TUniContainerPanel
                AlignWithMargins = True
                Left = 12
                Top = 49
                Width = 250
                Height = 178
                Hint = ''
                Margins.Left = 10
                Margins.Top = 6
                Margins.Right = 0
                Margins.Bottom = 0
                ParentColor = False
                Color = 15724527
                TabOrder = 1
                object paSearchField1: TUniContainerPanel
                  AlignWithMargins = True
                  Left = 0
                  Top = 0
                  Width = 249
                  Height = 60
                  Hint = ''
                  Margins.Top = 0
                  Margins.Right = 0
                  Margins.Bottom = 0
                  ParentColor = False
                  TabOrder = 0
                  DesignSize = (
                    249
                    60)
                  object UniLabelc1: TUniLabel
                    AlignWithMargins = True
                    Left = 3
                    Top = 1
                    Width = 40
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Bancos'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniButtonEditpbancos: TUniButtonEdit
                    AlignWithMargins = True
                    Left = 2
                    Top = 26
                    Width = 246
                    Height = 26
                    Hint = ''
                    Text = '0'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    OnButtonClick = UniButtonEditpbancosButtonClick
                    IconCls = 'search'
                  end
                end
                object paSearchOp1: TUniContainerPanel
                  AlignWithMargins = True
                  Left = 0
                  Top = 59
                  Width = 250
                  Height = 60
                  Hint = ''
                  Margins.Left = 0
                  Margins.Top = 8
                  Margins.Bottom = 0
                  ParentColor = False
                  TabOrder = 2
                  object UniContainerPanel2: TUniContainerPanel
                    AlignWithMargins = True
                    Left = 0
                    Top = 0
                    Width = 250
                    Height = 60
                    Hint = ''
                    Margins.Left = 0
                    Margins.Top = 8
                    Margins.Bottom = 0
                    ParentColor = False
                    TabOrder = 1
                    DesignSize = (
                      250
                      60)
                    object UniButtonEditppessoas: TUniButtonEdit
                      AlignWithMargins = True
                      Left = 3
                      Top = 30
                      Width = 246
                      Height = 26
                      Hint = ''
                      Text = '0'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      OnButtonClick = UniButtonEditppessoasButtonClick
                      IconCls = 'search'
                    end
                    object UniLabel1: TUniLabel
                      AlignWithMargins = True
                      Left = 4
                      Top = 5
                      Width = 45
                      Height = 15
                      Hint = ''
                      Margins.Top = 1
                      Margins.Bottom = 2
                      Caption = 'Pessoas'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                end
                object UniContainerPanel1: TUniContainerPanel
                  AlignWithMargins = True
                  Left = 0
                  Top = 118
                  Width = 250
                  Height = 60
                  Hint = ''
                  Margins.Left = 0
                  Margins.Top = 8
                  Margins.Bottom = 0
                  ParentColor = False
                  TabOrder = 3
                  object UniContainerPanel5: TUniContainerPanel
                    AlignWithMargins = True
                    Left = 0
                    Top = 0
                    Width = 250
                    Height = 60
                    Hint = ''
                    Margins.Left = 0
                    Margins.Top = 8
                    Margins.Bottom = 0
                    ParentColor = False
                    TabOrder = 1
                    DesignSize = (
                      250
                      60)
                    object UniButtonEditpnumero: TUniButtonEdit
                      AlignWithMargins = True
                      Left = 3
                      Top = 30
                      Width = 246
                      Height = 26
                      Hint = ''
                      Text = '0'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      IconCls = 'search'
                    end
                    object UniLabel2: TUniLabel
                      AlignWithMargins = True
                      Left = 4
                      Top = 5
                      Width = 43
                      Height = 15
                      Hint = ''
                      Margins.Top = 1
                      Margins.Bottom = 2
                      Caption = 'Numero'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                end
              end
              object labTitleSearch: TUniLabel
                AlignWithMargins = True
                Left = 10
                Top = 10
                Width = 158
                Height = 23
                Hint = ''
                Margins.Left = 10
                Margins.Top = 10
                Margins.Right = 0
                Margins.Bottom = 10
                TextConversion = txtHTML
                Caption = 'Pesquisar Registro(s)'
                Align = alTop
                ParentFont = False
                Font.Color = clGray
                Font.Height = -19
                Font.Name = 'Calibri Light'
                ParentColor = False
                Color = clSilver
                TabOrder = 0
              end
              object paSearchFilterPeriodSelect: TUniContainerPanel
                AlignWithMargins = True
                Left = 11
                Top = 226
                Width = 251
                Height = 179
                Hint = ''
                Margins.Left = 10
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 0
                ParentColor = False
                Color = 15724527
                AlignmentControl = uniAlignmentClient
                ParentAlignmentControl = False
                TabOrder = 2
                object paSearchFilterDtIni: TUniContainerPanel
                  AlignWithMargins = True
                  Left = 3
                  Top = 0
                  Width = 118
                  Height = 60
                  Hint = ''
                  Margins.Top = 0
                  Margins.Bottom = 0
                  ParentColor = False
                  TabOrder = 1
                  object UniLabelDtIni: TUniLabel
                    AlignWithMargins = True
                    Left = 0
                    Top = 1
                    Width = 65
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Data Inicial'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edSearchCRUDDtIni: TUniDateTimePicker
                    AlignWithMargins = True
                    Left = 0
                    Top = 20
                    Width = 110
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
                object paSearchFilterDtEnd: TUniContainerPanel
                  AlignWithMargins = True
                  Left = 133
                  Top = 0
                  Width = 118
                  Height = 60
                  Hint = ''
                  Margins.Top = 0
                  Margins.Bottom = 0
                  ParentColor = False
                  TabOrder = 2
                  object UniLabelDtEnd: TUniLabel
                    AlignWithMargins = True
                    Left = 3
                    Top = 1
                    Width = 57
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Data Final'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edSearchCRUDDtEnd: TUniDateTimePicker
                    AlignWithMargins = True
                    Left = 3
                    Top = 20
                    Width = 110
                    Height = 29
                    Hint = ''
                    Margins.Right = 5
                    DateTime = 43597.000000000000000000
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
                  AlignWithMargins = True
                  Left = 0
                  Top = 60
                  Width = 250
                  Height = 60
                  Hint = ''
                  Margins.Left = 0
                  Margins.Top = 8
                  Margins.Bottom = 0
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    250
                    60)
                  object UniLabel4: TUniLabel
                    AlignWithMargins = True
                    Left = 4
                    Top = 5
                    Width = 76
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Tipo de Busca'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object cbxSearchCRUDField2: TUniComboBox
                    AlignWithMargins = True
                    Left = 3
                    Top = 28
                    Width = 229
                    Height = 29
                    Hint = ''
                    Margins.Right = 5
                    Style = csDropDownList
                    Text = ''
                    Items.Strings = (
                      'Emiss'#227'o'
                      'Vencimento'
                      'Pagamento')
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    IconItems = <>
                  end
                end
                object UniContainerPanel4: TUniContainerPanel
                  AlignWithMargins = True
                  Left = 0
                  Top = 119
                  Width = 250
                  Height = 60
                  Hint = ''
                  Margins.Left = 0
                  Margins.Top = 8
                  Margins.Bottom = 0
                  ParentColor = False
                  TabOrder = 4
                  DesignSize = (
                    250
                    60)
                  object UniLabel5: TUniLabel
                    AlignWithMargins = True
                    Left = 4
                    Top = 5
                    Width = 24
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Tipo'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniComboBoxSTATUS: TUniComboBox
                    AlignWithMargins = True
                    Left = 3
                    Top = 28
                    Width = 229
                    Height = 29
                    Hint = ''
                    Margins.Right = 5
                    Style = csDropDownList
                    Text = ''
                    Items.Strings = (
                      'Aberto'
                      'Pago')
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    IconItems = <>
                  end
                end
              end
              object paSearchBtn: TUniContainerPanel
                AlignWithMargins = True
                Left = 12
                Top = 410
                Width = 235
                Height = 36
                Hint = ''
                Margins.Left = 10
                Margins.Top = 12
                Margins.Right = 0
                Margins.Bottom = 0
                ParentColor = False
                Color = 15724527
                TabOrder = 3
                object btnSearchCRUD: TUniBitBtn
                  AlignWithMargins = True
                  Left = 120
                  Top = 2
                  Width = 114
                  Height = 30
                  Hint = '[['#13#10'cls:ButtonThemeCrud-no-border-left |'#13#10'ico:fas-search |'#13#10']]'
                  Margins.Left = 6
                  Margins.Top = 4
                  Margins.Right = 6
                  Margins.Bottom = 4
                  Caption = '@'
                  ParentFont = False
                  Font.Height = -16
                  Font.Name = 'Calibri'
                  TabOrder = 2
                  OnClick = btnSearchCRUDClick
                end
                object btnSearchMoreFilters: TUniBitBtn
                  AlignWithMargins = True
                  Left = 4
                  Top = 2
                  Width = 115
                  Height = 30
                  Hint = '[['#13#10'ico:fas-filter |'#13#10'cls:ButtonThemeCrud-no-border-right'#13#10']]'
                  Margins.Left = 6
                  Margins.Top = 4
                  Margins.Right = 6
                  Margins.Bottom = 4
                  Caption = '+ ...'
                  ParentFont = False
                  Font.Height = -16
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
              end
            end
          end
          object dbgSearchCRUD: TUniDBGrid
            Left = 266
            Top = 0
            Width = 709
            Height = 580
            Hint = ''
            DataSource = dspesquisa
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgAutoRefreshRow]
            WebOptions.Paged = False
            WebOptions.FetchAll = True
            LoadMask.Message = 'Loading data...'
            ForceFit = True
            Align = alClient
            Font.Height = -13
            Font.Name = 'Calibri'
            ParentFont = False
            TabOrder = 2
            Exporter.Enabled = True
            OnMouseDown = dbgSearchCRUDMouseDown
            OnCellClick = dbgSearchCRUDCellClick
            OnDblClick = dbgSearchCRUDDblClick
            OnDrawColumnCell = dbgSearchCRUDDrawColumnCell
            Columns = <
              item
                FieldName = 'SITUACAO'
                Title.Caption = 'Situa'#231#227'o'
                Width = 74
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'marcador'
                Title.Caption = ' '
                Width = 30
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'CODIGO'
                Title.Caption = 'CODIGO'
                Width = 74
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'NUMERO'
                Title.Caption = 'Numero'
                Width = 74
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'SERIE'
                Title.Caption = 'Ser.'
                Width = 25
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'SEQUENCIA'
                Title.Caption = 'Seq.'
                Width = 30
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'PESSOA'
                Title.Caption = 'Pessoa'
                Width = 74
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'NOME'
                Title.Caption = 'Nome'
                Width = 300
                Font.Name = 'Calibri'
                ReadOnly = True
              end
              item
                FieldName = 'EMISSAO'
                Title.Caption = 'Emiss'#227'o'
                Width = 75
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'VENCIMENTO'
                Title.Caption = 'Vencimento'
                Width = 75
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'PAGAMENTO'
                Title.Caption = 'Pagamento'
                Width = 75
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'VALORATUAL'
                Title.Caption = 'Valor Atual'
                Width = 100
                Font.Name = 'Calibri'
              end>
          end
        end
      end
    end
  end
  object UniPopupMenuopcoes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 559
    Top = 6
    object L1: TUniMenuItem
      Caption = 'Limpa'
      ImageIndex = 72
      OnClick = L1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object T1: TUniMenuItem
      Caption = 'Todos'
      ImageIndex = 14
      OnClick = T1Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object I1: TUniMenuItem
      Caption = 'Baixar'
      ImageIndex = 125
      OnClick = I1Click
    end
  end
  object sqlSearchMaster: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'select * from receber ')
    Left = 169
    Top = 7
    object sqlSearchMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
    end
    object sqlSearchMasterSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Required = True
      Size = 3
    end
    object sqlSearchMasterSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
    end
    object sqlSearchMasterPESSOA: TIntegerField
      FieldName = 'PESSOA'
      Origin = 'PESSOA'
    end
    object sqlSearchMasterNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object sqlSearchMasterEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object sqlSearchMasterVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      Origin = 'VENCIMENTO'
    end
    object sqlSearchMasterPAGAMENTO: TDateField
      FieldName = 'PAGAMENTO'
      Origin = 'PAGAMENTO'
    end
    object sqlSearchMasterVALORATUAL: TFMTBCDField
      FieldName = 'VALORATUAL'
      Origin = 'VALORATUAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object sqlSearchMasterSITUACAO: TStringField
      Alignment = taCenter
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      Size = 10
    end
    object sqlSearchMasterCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
  end
  object dsfiltro: TDataSource
    AutoEdit = False
    DataSet = sqlSearchMaster
    Left = 139
    Top = 7
  end
  object mempesquisa: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 269
    Top = 4
    object mempesquisaNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object mempesquisaSERIE: TStringField
      FieldName = 'SERIE'
      Size = 5
    end
    object mempesquisaPESSOA: TIntegerField
      FieldName = 'PESSOA'
    end
    object mempesquisaSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
    end
    object mempesquisaNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object mempesquisaEMISSAO: TDateTimeField
      FieldName = 'EMISSAO'
    end
    object mempesquisaVENCIMENTO: TDateTimeField
      FieldName = 'VENCIMENTO'
    end
    object mempesquisaPAGAMENTO: TDateTimeField
      FieldName = 'PAGAMENTO'
    end
    object mempesquisaVALORATUAL: TFloatField
      FieldName = 'VALORATUAL'
      currency = True
    end
    object mempesquisaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      OnGetText = mempesquisaSITUACAOGetText
    end
    object mempesquisaCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object mempesquisamarcador: TStringField
      Alignment = taCenter
      FieldName = 'marcador'
      OnGetText = mempesquisamarcadorGetText
    end
  end
  object dspesquisa: TDataSource
    AutoEdit = False
    DataSet = mempesquisa
    Left = 299
    Top = 4
  end
  object TB_MEMBAI: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 269
    Top = 34
    object TB_MEMBAIBAITDC: TIntegerField
      FieldName = 'BAITDC'
    end
    object TB_MEMBAIBAINDC: TFloatField
      FieldName = 'BAINDC'
    end
    object TB_MEMBAIBAISDC: TStringField
      FieldName = 'BAISDC'
    end
    object TB_MEMBAIBAIODC: TIntegerField
      FieldName = 'BAIODC'
    end
    object TB_MEMBAIBAICLF: TIntegerField
      FieldName = 'BAICLF'
    end
    object TB_MEMBAIBAINOM: TStringField
      FieldName = 'BAINOM'
      Size = 100
    end
    object TB_MEMBAIBAIAPL: TIntegerField
      FieldName = 'BAIAPL'
    end
    object TB_MEMBAIBAIPOR: TIntegerField
      FieldName = 'BAIPOR'
    end
    object TB_MEMBAIBAIBAN: TStringField
      FieldName = 'BAIBAN'
      Size = 60
    end
    object TB_MEMBAIBAIDTE: TDateField
      FieldName = 'BAIDTE'
    end
    object TB_MEMBAIBAIVCT: TDateField
      FieldName = 'BAIVCT'
    end
    object TB_MEMBAIBAIVLA: TFloatField
      FieldName = 'BAIVLA'
      EditFormat = '##,###,##0.00'
      currency = True
    end
    object TB_MEMBAIBAICOM: TFloatField
      FieldName = 'BAICOM'
      currency = True
    end
    object TB_MEMBAIBAICAR: TIntegerField
      FieldName = 'BAICAR'
    end
    object TB_MEMBAIBAIVEN: TIntegerField
      FieldName = 'BAIVEN'
    end
    object TB_MEMBAIBAIPED: TStringField
      FieldName = 'BAIPED'
    end
    object TB_MEMBAIBAIOB1: TStringField
      FieldName = 'BAIOB1'
      Size = 600
    end
    object TB_MEMBAIBAIPER: TFloatField
      FieldName = 'BAIPER'
      currency = True
    end
    object TB_MEMBAIBAICOMP: TDateField
      FieldName = 'BAICOMP'
    end
    object TB_MEMBAIBAIJUR: TFloatField
      FieldName = 'BAIJUR'
      currency = True
    end
    object TB_MEMBAIBAITAX: TFloatField
      FieldName = 'BAITAX'
      currency = True
    end
    object TB_MEMBAIBAIDSC: TFloatField
      FieldName = 'BAIDSC'
      currency = True
    end
    object TB_MEMBAIBAIVLP: TFloatField
      FieldName = 'BAIVLP'
      EditFormat = '##,###,##0.00'
      currency = True
    end
    object TB_MEMBAIBAIPAR: TFloatField
      FieldName = 'BAIPAR'
      EditFormat = '##,###,##0.00'
      currency = True
    end
    object TB_MEMBAIBAICONT: TIntegerField
      FieldName = 'BAICONT'
    end
    object TB_MEMBAIBAIPRZ: TIntegerField
      FieldName = 'BAIPRZ'
    end
    object TB_MEMBAIBAIPLA: TStringField
      FieldName = 'BAIPLA'
    end
    object TB_MEMBAIexclui: TStringField
      FieldName = 'exclui'
      OnGetText = TB_MEMBAIexcluiGetText
    end
    object TB_MEMBAIPES_PORTADOR: TStringField
      FieldName = 'PES_PORTADOR'
      OnGetText = TB_MEMBAIPES_PORTADORGetText
    end
    object TB_MEMBAIPES_PLANOCONTAS: TStringField
      FieldName = 'PES_PLANOCONTAS'
      OnGetText = TB_MEMBAIPES_PLANOCONTASGetText
    end
    object TB_MEMBAIBAIANEXO: TStringField
      FieldName = 'BAIANEXO'
    end
    object TB_MEMBAIdetalhesanexo: TStringField
      FieldName = 'detalhesanexo'
    end
    object TB_MEMBAITABELA: TStringField
      FieldName = 'TABELA'
    end
  end
  object DS_MEMBAI: TDataSource
    DataSet = TB_MEMBAI
    Left = 297
    Top = 34
  end
  object FDQryTitulos: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'select * from receber ')
    Left = 201
    Top = 7
  end
  object UniPopupMenudetalhes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 663
    Top = 6
    object V1: TUniMenuItem
      Caption = 'Voltar em Aberto'
      ImageIndex = 57
      OnClick = V1Click
    end
  end
end
