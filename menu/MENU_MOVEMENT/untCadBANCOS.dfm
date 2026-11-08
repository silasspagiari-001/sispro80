inherited frmcadBANCOS: TfrmcadBANCOS
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
        OnClick = labExitClick
      end
      object labTitleForm: TUniLabel
        Left = 49
        Top = 8
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
        Left = 882
        Top = 3
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
          Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-bars | '#13#10'cls-ico:font-black'#13#10']]'
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
        Height = 73
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
          Top = 2
          Width = 33
          Height = 32
          Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-check | '#13#10'cls-ico:font-black'#13#10']]'
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
          Top = 38
          Width = 33
          Height = 32
          Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-times | '#13#10'cls-ico:font-black'#13#10']]'
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
      ActivePage = tabRegister
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
              ScrollHeight = 331
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
                    Width = 117
                    Height = 26
                    Hint = ''
                    Text = '0'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    OnExit = UniButtonEditpbancosExit
                    OnButtonClick = UniButtonEditpbancosButtonClick
                    IconCls = 'search'
                  end
                  object UniLabel17: TUniLabel
                    AlignWithMargins = True
                    Left = 131
                    Top = 1
                    Width = 47
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Empresa'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 3
                  end
                  object UniButtonEditempresa: TUniButtonEdit
                    AlignWithMargins = True
                    Left = 131
                    Top = 26
                    Width = 117
                    Height = 26
                    Hint = ''
                    Text = '0'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 4
                    OnButtonClick = UniButtonEditempresaButtonClick
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
                    Top = 25
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
                    Width = 92
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Descri'#231#227'o Banco'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
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
                Top = 167
                Width = 251
                Height = 122
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
                  object UniFormattedNumberEditcsaldo: TUniFormattedNumberEdit
                    Left = 1
                    Top = 30
                    Width = 246
                    Height = 29
                    Hint = ''
                    Alignment = taRightJustify
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel2: TUniLabel
                    AlignWithMargins = True
                    Left = 3
                    Top = 7
                    Width = 63
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Saldo Atual'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
              end
              object paSearchBtn: TUniContainerPanel
                AlignWithMargins = True
                Left = 12
                Top = 295
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
            OnMouseDown = dbgSearchCRUDMouseDown
            OnCellClick = dbgSearchCRUDCellClick
            OnDblClick = dbgSearchCRUDDblClick
            OnDrawColumnCell = dbgSearchCRUDDrawColumnCell
            Columns = <
              item
                FieldName = 'KEY'
                Title.Caption = ' '
                Width = 30
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'EMPRESA'
                Title.Caption = 'EMP'
                Width = 70
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'TIPO'
                Title.Caption = 'TIPO'
                Width = 100
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
              item
                FieldName = 'PAGAMENTO'
                Title.Caption = 'PAGAMENTO'
                Width = 100
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'SERIE'
                Title.Caption = 'SERIE'
                Width = 50
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'SEQUENCIA'
                Title.Caption = 'SEQUENCIA'
                Width = 80
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'HISTORICO'
                Title.Caption = 'HISTORICO'
                Width = 350
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'VALORPAGO'
                Title.Caption = 'VALORPAGO'
                Width = 140
                Font.Name = 'Calibri'
              end>
          end
        end
      end
      object tabRegister: TUniTabSheet
        Hint = ''
        Caption = 'Cadastro'
        Font.Height = -13
        Font.Name = 'Calibri'
        ParentFont = False
        object paBaseRegData1: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 975
          Height = 580
          Hint = ''
          ParentColor = False
          Align = alClient
          AutoScroll = True
          TabOrder = 0
          ScrollHeight = 580
          ScrollWidth = 975
          object rcBlock10: TUniContainerPanel
            Tag = 1
            Left = 5
            Top = 17
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2]]'
            ParentColor = False
            TabOrder = 1
            DesignSize = (
              150
              48)
            object edCodigo: TUniDBEdit
              AlignWithMargins = True
              Left = 1
              Top = 19
              Width = 144
              Height = 29
              Hint = ''
              DataField = 'CODIGO'
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
              Left = 1
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
            Left = 198
            Top = 17
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2]]'
            ParentColor = False
            TabOrder = 2
            DesignSize = (
              150
              48)
            object rcDBComboBox50: TUniDBComboBox
              Tag = 1
              AlignWithMargins = True
              Left = 3
              Top = 19
              Width = 144
              Height = 29
              Hint = ''
              Anchors = [akLeft, akTop, akRight]
              DataField = 'SERIE'
              DataSource = dsMaster
              Style = csDropDownList
              Items.Strings = (
                'NFE'
                'PED'
                'NOC'
                'CAR'
                'DUP'
                'MVB'
                'CHE')
              TabOrder = 1
              IconItems = <>
            end
            object UniLabel7: TUniLabel
              Left = 3
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
            Left = 374
            Top = 17
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2]]'
            ParentColor = False
            TabOrder = 3
            DesignSize = (
              150
              48)
            object UniDBDateTimePickerPAGAMENTO: TUniDBDateTimePicker
              Tag = 1
              AlignWithMargins = True
              Left = 3
              Top = 19
              Width = 144
              Height = 29
              Hint = ''
              DataField = 'PAGAMENTO'
              DataSource = dsMaster
              DateTime = 44554.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              ClientEvents.ExtEvents.Strings = (
                
                  'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
                  '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
                  '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
                  ':"  /  /   "});'#13#10'}')
            end
            object UniLabel4: TUniLabel
              Left = 3
              Top = 0
              Width = 61
              Height = 15
              Hint = ''
              Caption = 'Pagamento'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock40: TUniContainerPanel
            Tag = 1
            Left = 544
            Top = 17
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 4
            DesignSize = (
              150
              48)
            object UniDBDateTimePicker2: TUniDBDateTimePicker
              Tag = 1
              AlignWithMargins = True
              Left = 3
              Top = 19
              Width = 144
              Height = 29
              Hint = ''
              DataField = 'COMPETENCIA'
              DataSource = dsMaster
              DateTime = 44554.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              ClientEvents.ExtEvents.Strings = (
                
                  'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
                  '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
                  '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
                  ':"  /  /   "});'#13#10'}')
            end
            object UniLabel5: TUniLabel
              Left = 3
              Top = 0
              Width = 71
              Height = 15
              Hint = ''
              Caption = 'Compet'#234'ncia'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock50: TUniContainerPanel
            Tag = 1
            Left = 712
            Top = 17
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 5
            DesignSize = (
              150
              48)
            object UniDBEdit1: TUniDBEdit
              AlignWithMargins = True
              Left = 3
              Top = 19
              Width = 144
              Height = 29
              Hint = ''
              DataField = 'SEQUENCIA'
              DataSource = dsMaster
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clBlack
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              TabOrder = 1
            end
            object UniLabel6: TUniLabel
              Left = 3
              Top = 0
              Width = 56
              Height = 15
              Hint = ''
              Caption = 'Sequ'#234'ncia'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock80: TUniContainerPanel
            Tag = 1
            Left = 35
            Top = 86
            Width = 376
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-6]]'
            ParentColor = False
            TabOrder = 6
            DesignSize = (
              376
              48)
            object UniLabel8: TUniLabel
              Left = 0
              Top = 0
              Width = 34
              Height = 15
              Hint = ''
              Caption = 'Banco'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 0
            end
            object UniButtonDbEditcodportador: TUniButtonDbEdit
              Tag = 1
              AlignWithMargins = True
              Left = 0
              Top = 18
              Width = 373
              Height = 29
              Hint = ''
              DataField = 'PORTADOR'
              DataSource = dsMaster
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              Color = clInfoBk
              OnExit = UniButtonDbEditcodportadorExit
              OnButtonClick = UniButtonDbEditcodportadorButtonClick
              IconCls = 'search'
            end
          end
          object rcBlock90: TUniContainerPanel
            Tag = 1
            Left = 515
            Top = 86
            Width = 376
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-6]]'
            ParentColor = False
            TabOrder = 7
            DesignSize = (
              376
              48)
            object UniLabel12: TUniLabel
              Left = 0
              Top = 0
              Width = 98
              Height = 15
              Hint = ''
              Caption = 'Descri'#231#227'o Bancos'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 0
            end
            object edRazSoc: TUniDBEdit
              AlignWithMargins = True
              Left = 0
              Top = 18
              Width = 373
              Height = 29
              Hint = ''
              DataField = 'DESCPORTADOR'
              DataSource = dsMaster
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              Color = clGray
              ReadOnly = True
            end
          end
          object rcBlock100: TUniContainerPanel
            Tag = 1
            Left = 35
            Top = 140
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-6]]'
            ParentColor = False
            TabOrder = 8
            DesignSize = (
              150
              48)
            object UniButtonDbEditplanocontas: TUniButtonDbEdit
              Tag = 1
              Left = 0
              Top = 19
              Width = 150
              Height = 29
              Hint = ''
              DataField = 'PLANOCONTAS'
              DataSource = dsMaster
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              Color = clInfoBk
              OnExit = UniButtonDbEditplanocontasExit
              OnButtonClick = UniButtonDbEditplanocontasButtonClick
              IconCls = 'search'
            end
            object UniLabel9: TUniLabel
              Left = 0
              Top = 0
              Width = 73
              Height = 15
              Hint = ''
              Caption = 'Plano Contas'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock110: TUniContainerPanel
            Tag = 1
            Left = 228
            Top = 140
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 9
            DesignSize = (
              150
              48)
            object UniDBEdit2: TUniDBEdit
              AlignWithMargins = True
              Left = 0
              Top = 19
              Width = 144
              Height = 29
              Hint = ''
              DataField = 'PLANODESCRICAO'
              DataSource = dsMaster
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              Color = clGray
              ReadOnly = True
            end
            object UniLabel10: TUniLabel
              Left = 0
              Top = 0
              Width = 90
              Height = 15
              Hint = ''
              Caption = 'Descri'#231#227'o Plano'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock120: TUniContainerPanel
            Tag = 1
            Left = 404
            Top = 140
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-3]]'
            ParentColor = False
            TabOrder = 10
            DesignSize = (
              150
              48)
            object UniDBComboBoxTIPO: TUniDBComboBox
              Tag = 1
              AlignWithMargins = True
              Left = 3
              Top = 19
              Width = 144
              Height = 29
              Hint = ''
              Anchors = [akLeft, akTop, akRight]
              DataField = 'TIPO'
              DataSource = dsMaster
              Style = csDropDownList
              Items.Strings = (
                'Entrada'
                'Saida'
                'Aguarde')
              TabOrder = 1
              IconItems = <>
            end
            object UniLabel11: TUniLabel
              Left = 8
              Top = 0
              Width = 24
              Height = 15
              Hint = ''
              Caption = 'Tipo'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock130: TUniContainerPanel
            Left = 35
            Top = 204
            Width = 376
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-6]]'
            ParentColor = False
            TabOrder = 11
            DesignSize = (
              376
              48)
            object UniButtonDbEditCODHISTORICO: TUniButtonDbEdit
              Tag = 1
              AlignWithMargins = True
              Left = 2
              Top = 19
              Width = 368
              Height = 29
              Hint = ''
              DataField = 'CODHISTORICO'
              DataSource = dsMaster
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              Color = clInfoBk
              OnExit = UniButtonDbEditCODHISTORICOExit
              OnButtonClick = UniButtonDbEditCODHISTORICOButtonClick
              IconCls = 'search'
            end
            object UniLabel13: TUniLabel
              Left = 0
              Top = 0
              Width = 51
              Height = 15
              Hint = ''
              Caption = 'Hist'#243'rico'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock140: TUniContainerPanel
            Left = 515
            Top = 204
            Width = 376
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-6]]'
            ParentColor = False
            TabOrder = 12
            DesignSize = (
              376
              48)
            object UniDBEdit3: TUniDBEdit
              AlignWithMargins = True
              Left = 1
              Top = 19
              Width = 372
              Height = 29
              Hint = ''
              DataField = 'HISTORICO'
              DataSource = dsMaster
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object UniLabel14: TUniLabel
              Left = 0
              Top = 0
              Width = 126
              Height = 15
              Hint = ''
              Caption = 'Descri'#231#227'o do Hist'#243'rico'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock150: TUniContainerPanel
            Left = 5
            Top = 272
            Width = 886
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 13
            DesignSize = (
              886
              48)
            object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
              Tag = 1
              AlignWithMargins = True
              Left = 186
              Top = 19
              Width = 696
              Height = 29
              Hint = ''
              DataField = 'VALORPAGO'
              DataSource = dsMaster
              Alignment = taRightJustify
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel15: TUniLabel
              Left = 186
              Top = 0
              Width = 78
              Height = 15
              Hint = ''
              Caption = 'Valor Lan'#231'ado'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
            object UniLabel16: TUniLabel
              Left = 3
              Top = 0
              Width = 47
              Height = 15
              Hint = ''
              Caption = 'Empresa'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 3
            end
            object UniButtonDbEdit1: TUniButtonDbEdit
              Tag = 1
              AlignWithMargins = True
              Left = 3
              Top = 19
              Width = 177
              Height = 29
              Hint = ''
              DataField = 'EMPRESA'
              DataSource = dsMaster
              TabOrder = 4
              Color = clInfoBk
              OnButtonClick = UniButtonDbEdit1ButtonClick
              IconCls = 'search'
            end
          end
          object rcBlock160: TUniContainerPanel
            Left = 5
            Top = 327
            Width = 886
            Height = 26
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            Color = clSkyBlue
            TabOrder = 14
            DesignSize = (
              886
              26)
            object UniLabel28: TUniLabel
              AlignWithMargins = True
              Left = 6
              Top = 4
              Width = 251
              Height = 19
              Hint = '[[cols:12 | round:all]]'
              Margins.Left = 6
              Margins.Top = 6
              Margins.Right = 6
              Margins.Bottom = 6
              AutoSize = False
              Caption = 'OBSERVA'#199#213'ES'
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clGray
              Font.Height = -15
              Font.Name = 'Calibri'
              TabOrder = 1
            end
          end
          object rcBlock170: TUniContainerPanel
            Left = 5
            Top = 358
            Width = 886
            Height = 123
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 15
            object UniDBMemoobs: TUniDBMemo
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 880
              Height = 117
              Hint = ''
              DataField = 'OBSERVACOES'
              DataSource = dsMaster
              Align = alClient
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  object dsfiltro: TDataSource
    AutoEdit = False
    DataSet = sqlSearchMaster
    Left = 403
    Top = 7
  end
  object sqlSearchMaster: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'select * from BANCOS')
    Left = 433
    Top = 7
    object sqlSearchMasterKEY: TStringField
      FieldName = 'KEY'
      Origin = '"KEY"'
      Required = True
      OnGetText = sqlSearchMasterKEYGetText
      Size = 38
    end
    object sqlSearchMasterCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
    object sqlSearchMasterTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      OnGetText = sqlSearchMasterTIPOGetText
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
    object sqlSearchMasterPESSOA: TIntegerField
      FieldName = 'PESSOA'
      Origin = 'PESSOA'
    end
    object sqlSearchMasterNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
    object sqlSearchMasterEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object sqlSearchMasterPAGAMENTO: TDateField
      FieldName = 'PAGAMENTO'
      Origin = 'PAGAMENTO'
    end
    object sqlSearchMasterVALORPAGO: TFMTBCDField
      FieldName = 'VALORPAGO'
      Origin = 'VALORPAGO'
      currency = True
      Precision = 18
      Size = 2
    end
    object sqlSearchMasterDATALANCAMENTO: TDateField
      FieldName = 'DATALANCAMENTO'
      Origin = 'DATALANCAMENTO'
    end
    object sqlSearchMasterPORTADOR: TIntegerField
      FieldName = 'PORTADOR'
      Origin = 'PORTADOR'
    end
    object sqlSearchMasterDESCPORTADOR: TStringField
      FieldName = 'DESCPORTADOR'
      Origin = 'DESCPORTADOR'
      Size = 60
    end
    object sqlSearchMasterAPLICACAO: TIntegerField
      FieldName = 'APLICACAO'
      Origin = 'APLICACAO'
    end
    object sqlSearchMasterDESCAPLICACAO: TStringField
      FieldName = 'DESCAPLICACAO'
      Origin = 'DESCAPLICACAO'
    end
    object sqlSearchMasterHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Size = 100
    end
    object sqlSearchMasterCODHISTORICO: TIntegerField
      FieldName = 'CODHISTORICO'
      Origin = 'CODHISTORICO'
    end
    object sqlSearchMasterEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
    end
    object sqlSearchMasterDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
    end
    object sqlSearchMasterSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
    end
    object sqlSearchMasterPLANOCONTAS: TFMTBCDField
      FieldName = 'PLANOCONTAS'
      Origin = 'PLANOCONTAS'
      Precision = 18
      Size = 5
    end
    object sqlSearchMasterPLANODESCRICAO: TStringField
      FieldName = 'PLANODESCRICAO'
      Origin = 'PLANODESCRICAO'
      Size = 60
    end
    object sqlSearchMasterCONCILIADA: TStringField
      FieldName = 'CONCILIADA'
      Origin = 'CONCILIADA'
      Size = 1
    end
    object sqlSearchMasterCOMPETENCIA: TDateField
      FieldName = 'COMPETENCIA'
      Origin = 'COMPETENCIA'
    end
  end
  object dscrud: TDataSource
    AutoEdit = False
    DataSet = sqlMaster
    Left = 339
    Top = 7
  end
  object sqlMaster: TFDQuery
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    UpdateOptions.UpdateTableName = 'BANCOS'
    SQL.Strings = (
      'SELECT * FROM bancos where codigo = :codigo')
    Left = 369
    Top = 7
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object UniPopupMenuopcoes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 879
    Top = 6
    object L1: TUniMenuItem
      Caption = 'Log do Lan'#231'amento'
      ImageIndex = 27
      OnClick = L1Click
    end
  end
end
