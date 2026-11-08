inherited frmEXTRATOFINANCEIROPESSOA: TfrmEXTRATOFINANCEIROPESSOA
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
      object labTitleForm: TUniLabel
        Left = 49
        Top = 8
        Width = 256
        Height = 26
        Hint = '[['#13#10'caption-dots:mobile-v-16 '#13#10']]'#13#10#13#10
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        Caption = 'EXTRATO FINANCEIRO PESSOA'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clBtnFace
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
          Top = 56
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
          TabOrder = 2
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
        end
        object btnOptions: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-file-pdf | '#13#10'cls-ico:font-black'#13 +
            #10']]'
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
              ScrollHeight = 445
              ScrollWidth = 254
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
              object paSearchBtn: TUniContainerPanel
                AlignWithMargins = True
                Left = 4
                Top = 409
                Width = 250
                Height = 36
                Hint = ''
                Margins.Left = 10
                Margins.Top = 12
                Margins.Right = 0
                Margins.Bottom = 0
                ParentColor = False
                Color = 15724527
                TabOrder = 1
                object btnSearchCRUD: TUniBitBtn
                  AlignWithMargins = True
                  Left = 124
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
              object paSearchFilter1: TUniContainerPanel
                AlignWithMargins = True
                Left = 4
                Top = 49
                Width = 250
                Height = 354
                Hint = ''
                Margins.Left = 10
                Margins.Top = 6
                Margins.Right = 0
                Margins.Bottom = 0
                ParentColor = False
                Color = 15724527
                TabOrder = 2
                object paSearchField1: TUniContainerPanel
                  AlignWithMargins = True
                  Left = 1
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
                    Width = 39
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Pessoa'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniButtonEditpessoa: TUniButtonEdit
                    AlignWithMargins = True
                    Left = 2
                    Top = 26
                    Width = 246
                    Height = 26
                    Hint = ''
                    Text = '0'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    OnExit = UniButtonEditpessoaExit
                    OnButtonClick = UniButtonEditpessoaButtonClick
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
                  DesignSize = (
                    250
                    60)
                  object UniEditdescricaobanco: TUniEdit
                    AlignWithMargins = True
                    Left = 3
                    Top = 23
                    Width = 245
                    Height = 29
                    Hint = ''
                    Margins.Right = 5
                    CharCase = ecUpperCase
                    Text = ''
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel1: TUniLabel
                    AlignWithMargins = True
                    Left = 3
                    Top = 5
                    Width = 90
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Nome da Pessoa'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object paSearchFilterPeriodSelect: TUniContainerPanel
                  AlignWithMargins = True
                  Left = -1
                  Top = 114
                  Width = 251
                  Height = 121
                  Hint = ''
                  Margins.Left = 10
                  Margins.Top = 0
                  Margins.Right = 0
                  Margins.Bottom = 0
                  ParentColor = False
                  Color = 15724527
                  AlignmentControl = uniAlignmentClient
                  ParentAlignmentControl = False
                  TabOrder = 3
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
                    object UniLabel3: TUniLabel
                      AlignWithMargins = True
                      Left = 2
                      Top = 14
                      Width = 50
                      Height = 15
                      Hint = ''
                      Margins.Top = 1
                      Margins.Bottom = 2
                      Caption = 'Faturado'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniFormattedNumberEditDEBITO: TUniFormattedNumberEdit
                      Left = 1
                      Top = 31
                      Width = 247
                      Height = 29
                      Hint = ''
                      Alignment = taRightJustify
                      ParentFont = False
                      Font.Color = clRed
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      ReadOnly = True
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                  end
                end
                object UniContainerPanel1: TUniContainerPanel
                  AlignWithMargins = True
                  Left = 0
                  Top = 234
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
                  object UniLabel2: TUniLabel
                    AlignWithMargins = True
                    Left = 2
                    Top = 12
                    Width = 27
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Pago'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniFormattedNumberEditcCREDITO: TUniFormattedNumberEdit
                    Left = 0
                    Top = 28
                    Width = 247
                    Height = 29
                    Hint = ''
                    Alignment = taRightJustify
                    ParentFont = False
                    Font.Color = clBlue
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    ReadOnly = True
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object UniContainerPanel2: TUniContainerPanel
                  AlignWithMargins = True
                  Left = 0
                  Top = 294
                  Width = 250
                  Height = 60
                  Hint = ''
                  Margins.Left = 0
                  Margins.Top = 8
                  Margins.Bottom = 0
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    250
                    60)
                  object UniFormattedNumberEditSALDO: TUniFormattedNumberEdit
                    Left = 1
                    Top = 30
                    Width = 247
                    Height = 29
                    Hint = ''
                    Alignment = taRightJustify
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel4: TUniLabel
                    AlignWithMargins = True
                    Left = 3
                    Top = 7
                    Width = 79
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Saldo Devedor'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
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
            DataSource = dsfiltro
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
            OnDrawColumnCell = dbgSearchCRUDDrawColumnCell
            Columns = <
              item
                FieldName = 'NUMERO'
                Title.Caption = 'NUMERO'
                Width = 74
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'SERIE'
                Title.Caption = 'SER'
                Width = 40
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
              item
                FieldName = 'SEQUENCIA'
                Title.Caption = 'PAR'
                Width = 40
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
              item
                FieldName = 'EMISSAO'
                Title.Caption = 'EMISS'#195'O'
                Width = 144
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'VENCIMENTO'
                Title.Caption = 'VENCIMENTO'
                Width = 144
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'PAGAMENTO'
                Title.Caption = 'PAGAMENTO'
                Width = 144
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'TOTAL'
                Title.Caption = 'TOTAL'
                Width = 74
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'ABERTO'
                Title.Caption = 'FATURADO'
                Width = 74
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'PAGO'
                Title.Caption = 'PAGO'
                Width = 74
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'SALDO'
                Title.Caption = 'SALDO'
                Width = 74
                Font.Name = 'Calibri'
              end>
          end
        end
      end
    end
  end
  object dsfiltro: TDataSource
    AutoEdit = False
    DataSet = tbbusca
    Left = 315
    Top = 7
  end
  object tbbusca: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 344
    Top = 7
    object tbbuscaEMISSAO: TStringField
      FieldName = 'EMISSAO'
    end
    object tbbuscaNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object tbbuscaSERIE: TStringField
      FieldName = 'SERIE'
      Size = 5
    end
    object tbbuscaVENCIMENTO: TStringField
      FieldName = 'VENCIMENTO'
    end
    object tbbuscaPAGAMENTO: TStringField
      FieldName = 'PAGAMENTO'
    end
    object tbbuscaTOTAL: TCurrencyField
      FieldName = 'TOTAL'
    end
    object tbbuscaABERTO: TCurrencyField
      FieldName = 'ABERTO'
    end
    object tbbuscaPAGO: TCurrencyField
      FieldName = 'PAGO'
    end
    object tbbuscaSALDO: TCurrencyField
      FieldName = 'SALDO'
    end
    object tbbuscaSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
    end
  end
end
