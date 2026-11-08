inherited frmNOTAENTRADA: TfrmNOTAENTRADA
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
        Top = 6
        Width = 37
        Height = 26
        Hint = '[['#13#10'caption-dots:mobile-v-16 '#13#10']]'#13#10#13#10
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        Caption = 'Title'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clBtnFace
        TabOrder = 2
      end
      object UniMemolog: TUniMemo
        Left = 978
        Top = 13
        Width = 29
        Height = 22
        Hint = ''
        Visible = False
        Lines.Strings = (
          'UniMemolog')
        TabOrder = 3
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
        Top = 317
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
          Visible = False
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
            'hint:Abre para Pesquisas t:Busca(s) w:200 d:10000 c:rc-bg-info'#13#10 +
            ']]'#13#10
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
        object btnNewReg: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 33
          Height = 32
          Hint = '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '+'
          Align = alTop
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnNewRegClick
        end
        object btnEditReg: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 38
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
            #13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '!'
          Align = alTop
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 2
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnEditRegClick
        end
        object btnDeleteReg: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 74
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-trash-alt | '#13#10'cls-ico:font-black' +
            #13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 0
          Caption = '#'
          Align = alTop
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 3
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnDeleteRegClick
        end
      end
      object paGC: TUniContainerPanel
        AlignWithMargins = True
        Left = 0
        Top = 189
        Width = 37
        Height = 108
        Hint = ''
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 0
        ParentColor = False
        Align = alTop
        TabOrder = 3
        object btnSaveReg: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 38
          Width = 33
          Height = 32
          Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-save | '#13#10'cls-ico:font-black'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'V'
          Align = alTop
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnSaveRegClick
        end
        object btnCancelReg: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 74
          Width = 33
          Height = 32
          Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fa-ban | '#13#10'cls-ico:font-black'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'X'
          Align = alTop
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 2
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnCancelRegClick
        end
        object btnCalcReg: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-calculator | '#13#10'cls-ico:font-blac' +
            'k'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'C'
          Align = alTop
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 3
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnCalcRegClick
        end
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
      ActivePage = paBaseRegData1
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
              ScrollHeight = 389
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
                Left = 12
                Top = 353
                Width = 235
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
              object paSearchFilter1: TUniContainerPanel
                AlignWithMargins = True
                Left = 4
                Top = 49
                Width = 250
                Height = 294
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
                  object UniButtonEditpessoas: TUniButtonEdit
                    AlignWithMargins = True
                    Left = 2
                    Top = 26
                    Width = 246
                    Height = 26
                    Hint = ''
                    Text = '0'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
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
                  object UniButtonEditnumero: TUniButtonEdit
                    AlignWithMargins = True
                    Left = 3
                    Top = 26
                    Width = 246
                    Height = 26
                    Hint = ''
                    Text = '0'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    IconCls = 'search'
                  end
                  object UniLabel1: TUniLabel
                    AlignWithMargins = True
                    Left = 4
                    Top = 6
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
                    object UniLabel2: TUniLabel
                      AlignWithMargins = True
                      Left = 3
                      Top = 7
                      Width = 37
                      Height = 15
                      Hint = ''
                      Margins.Top = 1
                      Margins.Bottom = 2
                      Caption = 'Ordem'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object cbxSearchCRUDFieldordem: TUniComboBox
                      AlignWithMargins = True
                      Left = 1
                      Top = 28
                      Width = 250
                      Height = 29
                      Hint = ''
                      Margins.Right = 5
                      Style = csDropDownList
                      Text = 'Emiss'#227'o'
                      Items.Strings = (
                        'Emiss'#227'o'
                        'Numero'
                        'Pessoa')
                      ItemIndex = 0
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                      IconItems = <>
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
                  object UniLabel3: TUniLabel
                    AlignWithMargins = True
                    Left = 3
                    Top = 7
                    Width = 34
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Status'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object cbxSearchCRUDFieldstatus: TUniComboBox
                    AlignWithMargins = True
                    Left = 0
                    Top = 28
                    Width = 250
                    Height = 29
                    Hint = ''
                    Margins.Right = 5
                    Style = csDropDownList
                    Text = 'Todos'
                    Items.Strings = (
                      'Enviada'
                      'Cancelada'
                      'Todos')
                    ItemIndex = 2
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    IconItems = <>
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
            Columns = <
              item
                FieldName = 'opcoes'
                Title.Caption = ' '
                Width = 30
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
              item
                FieldName = 'NUMERO'
                Title.Caption = 'NUMERO'
                Width = 100
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'EMISSAO'
                Title.Caption = 'EMISSAO'
                Width = 120
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'PESSOA'
                Title.Caption = 'PESSOA'
                Width = 100
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'NOME'
                Title.Caption = 'NOME'
                Width = 250
                Font.Name = 'Calibri'
                ReadOnly = True
              end
              item
                FieldName = 'CIDADE'
                Title.Caption = 'CIDADE'
                Width = 250
                Font.Name = 'Calibri'
                ReadOnly = True
              end
              item
                FieldName = 'ESTADO'
                Title.Caption = 'U.F.'
                Width = 50
                Font.Name = 'Calibri'
                ReadOnly = True
              end
              item
                FieldName = 'VLRTOTAL'
                Title.Caption = 'TOTAL'
                Width = 150
                Font.Name = 'Calibri'
              end>
          end
        end
      end
      object paBaseRegData1: TUniTabSheet
        Hint = ''
        Caption = 'Movimento'
        object UniScrollBox2: TUniScrollBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 969
          Height = 574
          Hint = ''
          Align = alClient
          TabOrder = 0
          object UniPageControlcadastros: TUniPageControl
            Left = 0
            Top = 0
            Width = 967
            Height = 572
            Hint = ''
            ActivePage = UniTabSheetCRUD
            Align = alClient
            TabOrder = 0
            object UniTabSheetCRUD: TUniTabSheet
              Hint = ''
              Caption = 'Geral'
              object UniScrollBox3: TUniScrollBox
                Left = 0
                Top = 0
                Width = 959
                Height = 544
                Hint = ''
                Align = alClient
                TabOrder = 0
                object UniScrollBox4: TUniScrollBox
                  Left = 0
                  Top = 0
                  Width = 957
                  Height = 542
                  Hint = ''
                  Align = alClient
                  TabOrder = 0
                  ScrollHeight = 1195
                  ScrollWidth = 860
                  ScrollY = 534
                  object rcBlock10: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = -531
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 0
                    DesignSize = (
                      150
                      48)
                    object UniLabel71: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 38
                      Height = 15
                      Hint = ''
                      Caption = 'C'#243'digo'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdit22: TUniDBEdit
                      AlignWithMargins = True
                      Left = 0
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'CODIGO'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      ReadOnly = True
                    end
                  end
                  object rcBlock20: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = -531
                    Width = 77
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 1
                    DesignSize = (
                      77
                      48)
                    object UniDBEdit2: TUniDBEdit
                      AlignWithMargins = True
                      Left = 2
                      Top = 17
                      Width = 72
                      Height = 29
                      Hint = ''
                      DataField = 'SERIE'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel4: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 27
                      Height = 15
                      Hint = ''
                      Caption = 'S'#233'rie'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock30: TUniContainerPanel
                    Tag = 1
                    Left = 372
                    Top = -531
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 2
                    DesignSize = (
                      150
                      48)
                    object UniDBDateTimePickeremissaonota: TUniDBDateTimePicker
                      AlignWithMargins = True
                      Left = 3
                      Top = 16
                      Width = 145
                      Height = 29
                      Hint = ''
                      DataField = 'EMISSAO'
                      DataSource = dsMaster
                      DateTime = 44561.000000000000000000
                      DateFormat = 'dd/MM/yyyy'
                      TimeFormat = 'HH:mm:ss'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel5: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 46
                      Height = 15
                      Hint = ''
                      Caption = 'Emiss'#227'o'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock40: TUniContainerPanel
                    Tag = 1
                    Left = 542
                    Top = -531
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 3
                    DesignSize = (
                      150
                      48)
                    object UniDBDateTimePicker2: TUniDBDateTimePicker
                      AlignWithMargins = True
                      Left = 3
                      Top = 16
                      Width = 145
                      Height = 29
                      Hint = ''
                      DataField = 'RECEPCAODESPACHO'
                      DataSource = dsMaster
                      DateTime = 44561.000000000000000000
                      DateFormat = 'dd/MM/yyyy'
                      TimeFormat = 'HH:mm:ss'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel6: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 50
                      Height = 15
                      Hint = ''
                      Caption = 'Recebido'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock50: TUniContainerPanel
                    Tag = 1
                    Left = 710
                    Top = -531
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 4
                    DesignSize = (
                      150
                      48)
                    object UniDBEditNUMERONOTA: TUniDBEdit
                      Tag = 1
                      AlignWithMargins = True
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'NUMERO'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Color = clRed
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      Font.Style = [fsBold]
                      TabOrder = 1
                    end
                    object UniLabel7: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 92
                      Height = 15
                      Hint = ''
                      Caption = 'Numero da NOTA'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock60: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = -477
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 5
                    DesignSize = (
                      150
                      48)
                    object UniLabel9: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 54
                      Height = 15
                      Hint = ''
                      Caption = 'Opera'#231#227'o'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniButtonDbEditcodigooperacaomestre: TUniButtonDbEdit
                      Tag = 1
                      AlignWithMargins = True
                      Left = 0
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'OPERACAO'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      Color = clInfoBk
                      OnExit = UniButtonDbEditcodigooperacaomestreExit
                      OnButtonClick = UniButtonDbEditcodigooperacaomestreButtonClick
                      IconCls = 'search'
                    end
                  end
                  object rcBlock70: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = -477
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-5]]'
                    ParentColor = False
                    TabOrder = 6
                    DesignSize = (
                      150
                      48)
                    object UniLabel10: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 112
                      Height = 15
                      Hint = ''
                      Caption = 'Descri'#231#227'o Opera'#231#227'o'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniEditdescricaooperacao: TUniEdit
                      AlignWithMargins = True
                      Left = 3
                      Top = 17
                      Width = 145
                      Height = 29
                      Hint = ''
                      Margins.Right = 5
                      CharCase = ecUpperCase
                      Text = ''
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      ReadOnly = True
                    end
                  end
                  object rcBlock80: TUniContainerPanel
                    Tag = 1
                    Left = 382
                    Top = -477
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 7
                    DesignSize = (
                      150
                      48)
                    object UniButtonDbEditcodigofuncionariomestre: TUniButtonDbEdit
                      Tag = 1
                      AlignWithMargins = True
                      Left = 2
                      Top = 17
                      Width = 146
                      Height = 29
                      Hint = ''
                      DataField = 'CONDICAO'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      Color = clInfoBk
                      OnExit = UniButtonDbEditcodigofuncionariomestreExit
                      OnButtonClick = UniButtonDbEditcodigofuncionariomestreButtonClick
                      IconCls = 'search'
                    end
                    object UniLabel8: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 79
                      Height = 15
                      Hint = ''
                      Caption = 'Condi'#231#227'o Pgto'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock90: TUniContainerPanel
                    Tag = 1
                    Left = 558
                    Top = -478
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 8
                    DesignSize = (
                      150
                      48)
                    object UniEditdescricaocondicao: TUniEdit
                      AlignWithMargins = True
                      Left = 2
                      Top = 18
                      Width = 145
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
                    object UniLabel11: TUniLabel
                      Left = 0
                      Top = 1
                      Width = 110
                      Height = 15
                      Hint = ''
                      Caption = 'Descri'#231#227'o Condi'#231#227'o'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock100: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = -425
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 9
                    DesignSize = (
                      150
                      48)
                    object UniLabel12: TUniLabel
                      Left = 0
                      Top = 1
                      Width = 45
                      Height = 15
                      Hint = ''
                      Caption = 'Pessoas'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniButtonDbEditPESSOAS: TUniButtonDbEdit
                      Tag = 1
                      AlignWithMargins = True
                      Left = 1
                      Top = 17
                      Width = 143
                      Height = 29
                      Hint = ''
                      DataField = 'PESSOA'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      Color = clInfoBk
                      OnExit = UniButtonDbEditPESSOASExit
                      OnButtonClick = UniButtonDbEditPESSOASButtonClick
                      IconCls = 'search'
                    end
                  end
                  object rcBlock110: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = -425
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-5]]'
                    ParentColor = False
                    TabOrder = 10
                    DesignSize = (
                      150
                      48)
                    object UniEditnome: TUniEdit
                      AlignWithMargins = True
                      Left = 2
                      Top = 17
                      Width = 145
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
                    object UniLabel15: TUniLabel
                      Left = 2
                      Top = 1
                      Width = 73
                      Height = 15
                      Hint = ''
                      Caption = 'Nome pessoa'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock120: TUniContainerPanel
                    Tag = 1
                    Left = 382
                    Top = -425
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 11
                    DesignSize = (
                      150
                      48)
                    object UniEditcidade: TUniEdit
                      AlignWithMargins = True
                      Left = 3
                      Top = 17
                      Width = 145
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
                    object UniLabel13: TUniLabel
                      Left = 3
                      Top = 1
                      Width = 38
                      Height = 15
                      Hint = ''
                      Caption = 'Cidade'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock130: TUniContainerPanel
                    Tag = 1
                    Left = 558
                    Top = -426
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 12
                    DesignSize = (
                      150
                      48)
                    object UniEditestado: TUniEdit
                      AlignWithMargins = True
                      Left = 2
                      Top = 18
                      Width = 145
                      Height = 29
                      Hint = ''
                      Margins.Right = 5
                      CharCase = ecUpperCase
                      Alignment = taCenter
                      Text = ''
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      ReadOnly = True
                    end
                    object UniLabel14: TUniLabel
                      Left = 3
                      Top = 1
                      Width = 19
                      Height = 15
                      Hint = ''
                      Caption = 'U.F.'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock140: TUniContainerPanel
                    Left = 3
                    Top = -371
                    Width = 705
                    Height = 174
                    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                    ParentColor = False
                    TabOrder = 13
                    object dbgTITULOS: TUniDBGrid
                      AlignWithMargins = True
                      Left = 3
                      Top = 3
                      Width = 699
                      Height = 168
                      Hint = ''
                      ClientEvents.UniEvents.Strings = (
                        
                          'store.afterCreate=function store.afterCreate(sender)'#13#10'{'#13#10'  sende' +
                          'r.setRemoteSort(false);'#13#10'}')
                      TitleFont.Name = 'Calibri'
                      TitleFont.Style = [fsBold]
                      DataSource = dstitulos
                      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
                      WebOptions.Paged = False
                      LoadMask.Message = 'Loading data...'
                      ForceFit = True
                      BorderStyle = ubsNone
                      Align = alClient
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      ParentFont = False
                      TabOrder = 1
                      ParentColor = False
                      Color = 15395562
                      TabKeyBehavior = tkNextComponent
                      Columns = <
                        item
                          FieldName = 'PARCELA'
                          Title.Caption = 'Seq.'
                          Width = 30
                          Font.Name = 'Calibri'
                        end
                        item
                          FieldName = 'VENCIMENTO'
                          Title.Caption = 'VENCIMENTO'
                          Width = 130
                          Font.Name = 'Calibri'
                        end
                        item
                          FieldName = 'VALOR'
                          Title.Caption = 'VALOR'
                          Width = 100
                          Font.Name = 'Calibri'
                        end>
                    end
                  end
                  object rcBlock150: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = -155
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 14
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
                      Left = 3
                      Top = 17
                      Width = 143
                      Height = 29
                      Hint = ''
                      DataField = 'VLRBASEICMS'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      ReadOnly = True
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel22: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 57
                      Height = 15
                      Hint = ''
                      Caption = 'Base ICMS'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock160: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = -155
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 15
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
                      Left = 3
                      Top = 17
                      Width = 145
                      Height = 29
                      Hint = ''
                      DataField = 'VLRICMS'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      ReadOnly = True
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel16: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 60
                      Height = 15
                      Hint = ''
                      Caption = 'Valor ICMS'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock170: TUniContainerPanel
                    Tag = 1
                    Left = 382
                    Top = -155
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 16
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit
                      Left = 2
                      Top = 17
                      Width = 145
                      Height = 29
                      Hint = ''
                      DataField = 'VLRDSPNTRIBUTADA'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel17: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 27
                      Height = 15
                      Hint = ''
                      Caption = 'Frete'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock180: TUniContainerPanel
                    Tag = 1
                    Left = 558
                    Top = -156
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 17
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit
                      Left = 2
                      Top = 18
                      Width = 145
                      Height = 29
                      Hint = ''
                      DataField = 'VLRDSPTRIBUTADA'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel18: TUniLabel
                      Left = 3
                      Top = 1
                      Width = 37
                      Height = 15
                      Hint = ''
                      Caption = 'Seguro'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock190: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = -103
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 18
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEditdescontos: TUniDBFormattedNumberEdit
                      Left = 3
                      Top = 18
                      Width = 143
                      Height = 29
                      Hint = ''
                      DataField = 'VLRDESCONTOS'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Color = clRed
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                      OnExit = UniDBFormattedNumberEditdescontosExit
                    end
                    object UniLabel19: TUniLabel
                      Left = 2
                      Top = 2
                      Width = 70
                      Height = 15
                      Hint = ''
                      Caption = 'Vlr Desconto'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock200: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = -103
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 19
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEditvlrdespesas: TUniDBFormattedNumberEdit
                      AlignWithMargins = True
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'VLRDESPESAS'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                      OnExit = UniDBFormattedNumberEditvlrdespesasExit
                    end
                    object UniLabel20: TUniLabel
                      Left = 5
                      Top = 2
                      Width = 65
                      Height = 15
                      Hint = ''
                      Caption = 'Vlr Depesas'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock210: TUniContainerPanel
                    Tag = 1
                    Left = 382
                    Top = -103
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 20
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEditvlrprodutos: TUniDBFormattedNumberEdit
                      AlignWithMargins = True
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'VLRPRODUTOS'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      ReadOnly = True
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel21: TUniLabel
                      Left = 3
                      Top = 2
                      Width = 69
                      Height = 15
                      Hint = ''
                      Caption = 'Vlr Produtos'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock220: TUniContainerPanel
                    Tag = 1
                    Left = 558
                    Top = -103
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 21
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit
                      AlignWithMargins = True
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'VLRTOTAL'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      ReadOnly = True
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel23: TUniLabel
                      Left = 3
                      Top = 2
                      Width = 46
                      Height = 15
                      Hint = ''
                      Caption = 'Vlr Total'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock230: TUniContainerPanel
                    Left = 3
                    Top = -49
                    Width = 705
                    Height = 48
                    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                    ParentColor = False
                    TabOrder = 22
                    DesignSize = (
                      705
                      48)
                    object UniDBEditchaveacesso: TUniDBEdit
                      AlignWithMargins = True
                      Left = 3
                      Top = 17
                      Width = 699
                      Height = 29
                      Hint = ''
                      DataField = 'CODIGOBARRAS'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel24: TUniLabel
                      Left = 2
                      Top = 1
                      Width = 90
                      Height = 15
                      Hint = ''
                      Caption = 'Chave de Acesso'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock240: TUniContainerPanel
                    Left = 3
                    Top = 5
                    Width = 705
                    Height = 500
                    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                    ParentColor = False
                    TabOrder = 23
                    object UniDBGridprodutos: TUniDBGrid
                      Left = 0
                      Top = 0
                      Width = 705
                      Height = 500
                      Hint = ''
                      DataSource = dsprodutos
                      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
                      WebOptions.Paged = False
                      LoadMask.Message = 'Carregando Item(s)...'
                      ForceFit = True
                      Align = alClient
                      Font.Color = clBlack
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      ParentFont = False
                      TabOrder = 1
                      Summary.Enabled = True
                      OnCellClick = UniDBGridprodutosCellClick
                      Columns = <
                        item
                          FieldName = 'opcoes'
                          Title.Caption = ' '
                          Width = 30
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                          Alignment = taCenter
                        end
                        item
                          FieldName = 'PRODUTO'
                          Title.Caption = 'Produtos'
                          Width = 100
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                        end
                        item
                          FieldName = 'buscaproduto'
                          Title.Caption = ' '
                          Width = 50
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                          Alignment = taCenter
                        end
                        item
                          FieldName = 'DESCRICAO'
                          Title.Caption = 'Descri'#231#227'o do Item'
                          Width = 300
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                        end
                        item
                          FieldName = 'buscalote'
                          Title.Caption = ' '
                          Width = 50
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                          Alignment = taCenter
                        end
                        item
                          FieldName = 'buscaentrada'
                          Title.Caption = ' '
                          Width = 30
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                          Alignment = taCenter
                        end
                        item
                          FieldName = 'QUANTIDADE'
                          Title.Caption = 'Qtde'
                          Width = 74
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                        end
                        item
                          FieldName = 'PRECO'
                          Title.Caption = 'Pre'#231'o R$'
                          Width = 100
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                        end
                        item
                          FieldName = 'PERCICMS'
                          Title.Caption = 'PERCICMS'
                          Width = 74
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                          ReadOnly = True
                        end
                        item
                          FieldName = 'BASEICMS'
                          Title.Caption = 'BASEICMS'
                          Width = 74
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                          ReadOnly = True
                        end
                        item
                          FieldName = 'VALORICMS'
                          Title.Caption = 'VALORICMS'
                          Width = 74
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                          ReadOnly = True
                        end
                        item
                          FieldName = 'TOTAL'
                          Title.Caption = 'R$ Total'
                          Width = 100
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                          ReadOnly = True
                        end
                        item
                          FieldName = 'exclui'
                          Title.Caption = ' '
                          Width = 50
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                          Alignment = taCenter
                        end>
                    end
                  end
                  object rcBlock250: TUniContainerPanel
                    Left = 3
                    Top = 511
                    Width = 705
                    Height = 150
                    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                    ParentColor = False
                    TabOrder = 24
                    DesignSize = (
                      705
                      150)
                    object UniLabel25: TUniLabel
                      Left = 3
                      Top = 8
                      Width = 66
                      Height = 15
                      Hint = ''
                      Caption = 'Observa'#231#227'o'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBMemoobservacao: TUniDBMemo
                      AlignWithMargins = True
                      Left = 3
                      Top = 29
                      Width = 699
                      Height = 118
                      Hint = ''
                      DataField = 'OBSERVACOES'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      Color = clInfoBk
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  object dscrud: TDataSource
    AutoEdit = False
    DataSet = sqlMaster
    Left = 891
    Top = 7
  end
  object sqlMaster: TFDQuery
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    UpdateOptions.UpdateTableName = 'MVMESTRE'
    SQL.Strings = (
      'SELECT * FROM mvmestre where codigo = :codigo')
    Left = 921
    Top = 7
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object sqlSearchMaster: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      
        ' SELECT           M.CODIGO, M.NUMERO,M.EMISSAO,M.SERIE,M.CANCELA' +
        'DA,M.PESSOA,P.CIDADE,P.ESTADO,P.NOME, M.CODIGOBARRAS, M.CHAVEACE' +
        'SSO, M.VLRTOTAL  FROM'
      ' MVMESTRE  M INNER JOIN PESSOAS P ON (M.PESSOA = P.CODIGO)')
    Left = 849
    Top = 7
    object sqlSearchMasterCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
    object sqlSearchMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object sqlSearchMasterSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 3
    end
    object sqlSearchMasterCANCELADA: TStringField
      FieldName = 'CANCELADA'
      Origin = 'CANCELADA'
      Size = 1
    end
    object sqlSearchMasterPESSOA: TIntegerField
      FieldName = 'PESSOA'
      Origin = 'PESSOA'
    end
    object sqlSearchMasterCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object sqlSearchMasterESTADO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
    object sqlSearchMasterCODIGOBARRAS: TStringField
      FieldName = 'CODIGOBARRAS'
      Origin = 'CODIGOBARRAS'
      Size = 45
    end
    object sqlSearchMasterNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object sqlSearchMasterVLRTOTAL: TFMTBCDField
      FieldName = 'VLRTOTAL'
      Origin = 'VLRTOTAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object sqlSearchMasterstatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'status'
      Calculated = True
    end
    object sqlSearchMasteropcoes: TStringField
      FieldKind = fkCalculated
      FieldName = 'opcoes'
      OnGetText = sqlSearchMasteropcoesGetText
      Calculated = True
    end
    object sqlSearchMasterEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object sqlSearchMasterCHAVEACESSO: TBlobField
      FieldName = 'CHAVEACESSO'
      Size = 16535
    end
  end
  object dsfiltro: TDataSource
    AutoEdit = False
    DataSet = sqlSearchMaster
    Left = 819
    Top = 7
  end
  object memprodutos: TFDMemTable
    BeforePost = memprodutosBeforePost
    AfterPost = memprodutosAfterPost
    BeforeDelete = memprodutosBeforeDelete
    AfterDelete = memprodutosAfterDelete
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 712
    Top = 7
    object IntegerField1: TIntegerField
      FieldName = 'PRODUTO'
    end
    object StringField1: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object memprodutosPRECO: TFloatField
      FieldName = 'PRECO'
      DisplayFormat = '##,###,##0.0000'
      EditFormat = '##,###,##0.0000'
      currency = True
    end
    object memprodutosTOTAL: TFloatField
      FieldName = 'TOTAL'
      DisplayFormat = '##,###,##0.00'
      EditFormat = '##,###,##0.00'
      currency = True
    end
    object memprodutosQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object memprodutosBASEICMS: TFloatField
      FieldName = 'BASEICMS'
      currency = True
    end
    object memprodutosVALORICMS: TFloatField
      FieldName = 'VALORICMS'
      currency = True
    end
    object memprodutosPERCICMS: TFloatField
      FieldName = 'PERCICMS'
    end
    object memprodutosCST: TStringField
      FieldName = 'CST'
    end
    object memprodutosUNIDADE: TStringField
      FieldName = 'UNIDADE'
    end
    object memprodutosPIS: TStringField
      FieldName = 'PIS'
    end
    object memprodutosCOFINS: TStringField
      FieldName = 'COFINS'
    end
    object memprodutosICM0: TFloatField
      FieldName = 'ICM0'
    end
    object memprodutosICM1: TFloatField
      FieldName = 'ICM1'
    end
    object memprodutosICM2: TFloatField
      FieldName = 'ICM2'
    end
    object memprodutosBAS0: TFloatField
      FieldName = 'BAS0'
    end
    object memprodutosBAS1: TFloatField
      FieldName = 'BAS1'
    end
    object memprodutosBAS2: TFloatField
      FieldName = 'BAS2'
    end
    object memprodutosSITUACAOLOCAL: TStringField
      FieldName = 'SITUACAOLOCAL'
    end
    object memprodutosSITUACAOOUTRAS: TStringField
      FieldName = 'SITUACAOOUTRAS'
    end
    object memprodutosDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object memprodutosDESPESAS: TFloatField
      FieldName = 'DESPESAS'
    end
    object memprodutosNUMERONCM: TStringField
      FieldName = 'NUMERONCM'
      Size = 0
    end
    object memprodutosSERIE: TStringField
      FieldName = 'SERIE'
    end
    object memprodutosSAFRA: TIntegerField
      FieldName = 'SAFRA'
    end
    object memprodutosNUMERO: TIntegerField
      FieldName = 'NUMERO'
    end
    object memprodutosEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object memprodutosSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
    end
    object memprodutosUF: TStringField
      FieldName = 'UF'
    end
    object memprodutosPESSOA: TIntegerField
      FieldName = 'PESSOA'
    end
    object memprodutosMARGEM: TFloatField
      FieldName = 'MARGEM'
    end
    object memprodutosCOMPRA: TFloatField
      FieldName = 'COMPRA'
    end
    object memprodutosNCM: TStringField
      FieldName = 'NCM'
    end
    object memprodutosGRUPO: TIntegerField
      FieldName = 'GRUPO'
    end
    object memprodutosPERCIPI: TFloatField
      FieldName = 'PERCIPI'
    end
    object memprodutosLIQUIDO: TFloatField
      FieldName = 'LIQUIDO'
    end
    object memprodutosVALORIPI: TFloatField
      FieldName = 'VALORIPI'
    end
    object memprodutosOPERACAO: TIntegerField
      FieldName = 'OPERACAO'
    end
    object memprodutosPUREZA: TFloatField
      FieldName = 'PUREZA'
    end
    object memprodutosSALDOPONTO: TFloatField
      FieldName = 'SALDOPONTO'
    end
    object memprodutosTERMOSEMENTE: TStringField
      FieldName = 'TERMOSEMENTE'
    end
    object memprodutosBOLETIMSEMENTE: TStringField
      FieldName = 'BOLETIMSEMENTE'
    end
    object memprodutosVALORCULTURAL: TFloatField
      FieldName = 'VALORCULTURAL'
    end
    object memprodutosLOTESEMENTE: TStringField
      FieldName = 'LOTESEMENTE'
    end
    object memprodutosLOTEORIGEM: TStringField
      FieldName = 'LOTEORIGEM'
    end
    object memprodutosSAFRACAMPO: TStringField
      FieldName = 'SAFRACAMPO'
    end
    object memprodutosCAMPO: TStringField
      FieldName = 'CAMPO'
    end
    object memprodutosCOOPERANTE: TIntegerField
      FieldName = 'COOPERANTE'
    end
    object memprodutosGERMINACAO: TFloatField
      FieldName = 'GERMINACAO'
    end
    object memprodutosSAFRAVALIDA: TStringField
      FieldName = 'SAFRAVALIDA'
    end
    object memprodutosLOTEENTRADA: TStringField
      FieldName = 'LOTEENTRADA'
    end
    object memprodutosCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
    end
    object memprodutosCUSTOPONTO: TFloatField
      FieldName = 'CUSTOPONTO'
    end
    object memprodutosTOTALPONTO: TFloatField
      FieldName = 'TOTALPONTO'
    end
    object memprodutosPERCREDUCAO: TFloatField
      FieldName = 'PERCREDUCAO'
    end
    object memprodutosexclui: TStringField
      FieldName = 'exclui'
      OnGetText = memprodutosexcluiGetText
    end
    object memprodutosbuscaproduto: TStringField
      FieldName = 'buscaproduto'
      OnGetText = memprodutosbuscaprodutoGetText
    end
    object memprodutosbuscalote: TStringField
      FieldName = 'buscalote'
      OnGetText = memprodutosbuscaloteGetText
    end
    object memprodutosDESCRICAO_NOTA: TStringField
      FieldName = 'DESCRICAO_NOTA'
      Size = 150
    end
    object memprodutosCULTIVAR: TStringField
      FieldName = 'CULTIVAR'
      Size = 50
    end
    object memprodutosCANCELADA: TStringField
      FieldName = 'CANCELADA'
    end
    object memprodutosESTADO: TStringField
      FieldName = 'ESTADO'
    end
    object memprodutosCONTRATO: TIntegerField
      FieldName = 'CONTRATO'
    end
    object memprodutosDOCUMENTO: TIntegerField
      FieldName = 'DOCUMENTO'
    end
    object memprodutosFRETE: TFloatField
      FieldName = 'FRETE'
    end
    object memprodutosPESOLIQUIDO: TFloatField
      FieldName = 'PESOLIQUIDO'
    end
    object memprodutosPESOBRUTO: TFloatField
      FieldName = 'PESOBRUTO'
    end
    object memprodutosEMISSAO: TStringField
      FieldName = 'EMISSAO'
      Size = 15
    end
    object memprodutosCUSTO: TFloatField
      FieldName = 'CUSTO'
    end
    object memprodutosPESOSACO: TFloatField
      FieldName = 'PESOSACO'
    end
    object memprodutosVALIDADE: TStringField
      FieldName = 'VALIDADE'
      Size = 10
    end
    object memprodutosTOTALPIS: TFloatField
      FieldName = 'TOTALPIS'
    end
    object memprodutosTOTALCOFINS: TFloatField
      FieldName = 'TOTALCOFINS'
    end
    object memprodutosVLRPIS: TFloatField
      FieldName = 'VLRPIS'
    end
    object memprodutosVLRCOFINS: TFloatField
      FieldName = 'VLRCOFINS'
    end
    object memprodutosPERCCOMISSAO: TFloatField
      FieldName = 'PERCCOMISSAO'
    end
    object memprodutosSEGURO: TFloatField
      FieldName = 'SEGURO'
    end
    object memprodutosDESPESA: TFloatField
      FieldName = 'DESPESA'
    end
    object memprodutoserro: TStringField
      Alignment = taCenter
      FieldName = 'erro'
    end
    object memprodutosopcoes: TStringField
      FieldName = 'opcoes'
      OnGetText = memprodutosopcoesGetText
    end
    object memprodutosENTREGUE: TFloatField
      FieldName = 'ENTREGUE'
    end
    object memprodutosSEMENTENOME: TStringField
      FieldName = 'SEMENTENOME'
      Size = 100
    end
    object memprodutosPERCCOFINS: TFloatField
      FieldName = 'PERCCOFINS'
    end
    object memprodutosPERCPIS: TFloatField
      FieldName = 'PERCPIS'
    end
    object memprodutosPEDIDOOR: TStringField
      FieldName = 'PEDIDOOR'
    end
    object memprodutosPEDIDOITEMOR: TStringField
      FieldName = 'PEDIDOITEMOR'
    end
    object memprodutosVALORST: TFloatField
      FieldName = 'VALORST'
    end
    object memprodutosBASEST: TFloatField
      FieldName = 'BASEST'
    end
    object memprodutosCFOPENTRADA: TStringField
      FieldName = 'CFOPENTRADA'
    end
    object memprodutosFORNECEDORCODIGO: TStringField
      FieldName = 'FORNECEDORCODIGO'
    end
    object memprodutosbuscaentrada: TStringField
      FieldName = 'buscaentrada'
      OnGetText = memprodutosbuscaentradaGetText
      Size = 1
    end
    object memprodutosPUREZAENTRADA: TFloatField
      FieldName = 'PUREZAENTRADA'
    end
    object memprodutosVCENTRADA: TFloatField
      FieldName = 'VCENTRADA'
    end
    object memprodutosGERMINACAOENTRADA: TFloatField
      FieldName = 'GERMINACAOENTRADA'
    end
    object memprodutosCODIGOFORNECEDOR: TStringField
      FieldName = 'CODIGOFORNECEDOR'
    end
  end
  object dsprodutos: TDataSource
    DataSet = memprodutos
    Left = 740
    Top = 7
  end
  object tbtitulos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 673
    Top = 7
    object tbtitulosPARCELA: TIntegerField
      FieldName = 'PARCELA'
    end
    object tbtitulosVALOR: TFloatField
      FieldName = 'VALOR'
      currency = True
    end
    object tbtitulosVENCIMENTO: TDateTimeField
      FieldName = 'VENCIMENTO'
    end
  end
  object dstitulos: TDataSource
    AutoEdit = False
    DataSet = tbtitulos
    Left = 643
    Top = 7
  end
  object UniPopupMenuopcoes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 567
    Top = 6
    object I2: TUniMenuItem
      Caption = 'Imposto Diferenciado'
      ImageIndex = 26
      OnClick = I2Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object E1: TUniMenuItem
      Caption = 'Importar via txt -  XML'
      ImageIndex = 115
      OnClick = E1Click
    end
  end
  object UniPopupMenudetalhes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 535
    Top = 6
    object UniMenuItem5: TUniMenuItem
      Caption = 'Impress'#227'o DANFE Original'
      ImageIndex = 98
      OnClick = i1Click
    end
  end
end
