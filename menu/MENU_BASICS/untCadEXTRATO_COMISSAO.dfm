inherited frmCadEXTRATO_COMISSAO: TfrmCadEXTRATO_COMISSAO
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
        Width = 174
        Height = 26
        Hint = '[['#13#10'caption-dots:mobile-v-16 '#13#10']]'#13#10#13#10
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        Caption = 'EXTRATO COMISS'#195'O'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clBtnFace
        TabOrder = 2
      end
      object UniMemolog: TUniMemo
        Left = 784
        Top = 15
        Width = 29
        Height = 22
        Hint = ''
        Visible = False
        Lines.Strings = (
          'UniMemolog')
        TabOrder = 3
      end
      object ed_Table_ItemSel: TUniEdit
        Left = 573
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 4
      end
      object ed_FormOrigin: TUniEdit
        Left = 593
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 5
      end
      object ed_FormOrigin_Tab: TUniEdit
        Left = 613
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 6
      end
      object ed_Table_Status: TUniEdit
        Left = 634
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 7
      end
      object ed_Order_Search: TUniEdit
        Left = 655
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 8
      end
      object ed_Where_Search: TUniEdit
        Left = 675
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 9
      end
      object ed_CodMaster: TUniEdit
        Left = 693
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 10
      end
      object ed_PK: TUniEdit
        Left = 711
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 11
      end
      object ed_FieldMasks: TUniEdit
        Left = 728
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 12
      end
      object ed_OldPKValue: TUniEdit
        Left = 747
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 13
      end
      object ed_Table_Status_OLD: TUniEdit
        Left = 764
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 14
      end
      object ed_GenNextID_OnNew: TUniEdit
        Left = 782
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 15
      end
      object ed_AskNewRec_AfterPost: TUniEdit
        Left = 799
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 16
      end
      object dbgExport: TUniDBGrid
        Left = 820
        Top = -10
        Width = 15
        Height = 22
        Hint = ''
        WebOptions.Paged = False
        WebOptions.PageSize = 10000
        WebOptions.FetchAll = True
        LoadMask.Message = 'Loading data...'
        TabOrder = 17
        Exporter.Enabled = True
      end
      object ed_PKS: TUniEdit
        Left = 843
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 18
      end
      object ed_OLDPKS: TUniEdit
        Left = 861
        Top = -10
        Width = 15
        Hint = ''
        Visible = False
        Text = ''
        TabOrder = 19
      end
    end
    object UniContainerPanel1: TUniContainerPanel
      Left = 0
      Top = 40
      Width = 1020
      Height = 610
      Hint = ''
      ParentColor = False
      Color = 15395562
      Align = alClient
      TabOrder = 2
      object paBaseButtons: TUniContainerPanel
        Left = 0
        Top = 0
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
        TabOrder = 1
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
              '[['#13#10'cls:ButtonWhite | '#13#10'ico:fa-dollar-sign | '#13#10'cls-ico:font-blac' +
              'k'#13#10']]'
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
              '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-file-pdf |'#13#10'cls-ico:font-black'#13#10 +
              ']]'
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
        Top = 0
        Width = 983
        Height = 610
        Hint = ''
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 9
        Margins.Bottom = 8
        ActivePage = tabSearch
        Align = alClient
        TabOrder = 2
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
            Height = 582
            Hint = ''
            ParentColor = False
            Align = alClient
            TabOrder = 0
            object paSearchFilters: TUniPanel
              Left = 0
              Top = 0
              Width = 266
              Height = 582
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
                Height = 582
                Hint = ''
                Margins.Left = 0
                Margins.Right = 0
                Align = alClient
                Color = 15724527
                TabOrder = 1
                ScrollHeight = 339
                ScrollWidth = 262
                object paSearchFilter1: TUniContainerPanel
                  AlignWithMargins = True
                  Left = 12
                  Top = 49
                  Width = 250
                  Height = 125
                  Hint = ''
                  Margins.Left = 10
                  Margins.Top = 6
                  Margins.Right = 0
                  Margins.Bottom = 0
                  ParentColor = False
                  Color = 15724527
                  TabOrder = 1
                  object paSearchOp1: TUniContainerPanel
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
                    object UniContainerPanel3: TUniContainerPanel
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
                        Width = 67
                        Height = 15
                        Hint = ''
                        Margins.Top = 1
                        Margins.Bottom = 2
                        Caption = 'Funcion'#225'rio'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                  end
                  object UniContainerPanel4: TUniContainerPanel
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
                  Top = 173
                  Width = 251
                  Height = 124
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
                  object UniContainerPanel8: TUniContainerPanel
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
                    TabOrder = 3
                    DesignSize = (
                      250
                      60)
                    object UniFormattedNumberEditSALDO: TUniFormattedNumberEdit
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
                    object UniLabel28: TUniLabel
                      AlignWithMargins = True
                      Left = 3
                      Top = 7
                      Width = 105
                      Height = 15
                      Hint = ''
                      Margins.Top = 1
                      Margins.Bottom = 2
                      Caption = 'Saldo da Comiss'#227'o'
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
                  Top = 303
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
              Height = 582
              Hint = ''
              DataSource = dsfiltro
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgAutoRefreshRow]
              WebOptions.PageSize = 50
              WebOptions.FetchAll = True
              LoadMask.Message = 'Loading data...'
              ForceFit = True
              Align = alClient
              Font.Height = -13
              Font.Name = 'Calibri'
              ParentFont = False
              TabOrder = 2
              Exporter.Enabled = True
              OnDblClick = dbgSearchCRUDDblClick
              Columns = <
                item
                  FieldName = 'TIPO'
                  Title.Caption = 'TIPO'
                  Width = 74
                  Font.Name = 'Calibri'
                  Alignment = taCenter
                end
                item
                  FieldName = 'NUMERO'
                  Title.Caption = 'Numero'
                  Width = 74
                  Font.Name = 'Calibri'
                end
                item
                  FieldName = 'SERIE'
                  Title.Caption = 'SER'
                  Width = 30
                  Font.Name = 'Calibri'
                end
                item
                  FieldName = 'PARCELA'
                  Title.Caption = 'PARC'
                  Width = 30
                  Font.Name = 'Calibri'
                  Alignment = taCenter
                end
                item
                  FieldName = 'HISTORICO'
                  Title.Caption = 'HISTORICO'
                  Width = 300
                  Font.Name = 'Calibri'
                end
                item
                  FieldName = 'PAGAMENTO'
                  Title.Caption = 'PAGAMENTO'
                  Width = 75
                  Font.Name = 'Calibri'
                  Alignment = taCenter
                end
                item
                  FieldName = 'VALOR'
                  Title.Caption = 'R$ VALOR'
                  Width = 100
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
            Height = 582
            Hint = ''
            ParentColor = False
            Align = alClient
            AutoScroll = True
            TabOrder = 0
            ScrollHeight = 582
            ScrollWidth = 975
            object rcBlock10: TUniContainerPanel
              Tag = 1
              Left = 3
              Top = 3
              Width = 150
              Height = 48
              Hint = '[[cols:xs-12 sm-12 md-3]]'
              ParentColor = False
              TabOrder = 1
              DesignSize = (
                150
                48)
              object UniLabel3: TUniLabel
                Left = 3
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
              object edCodigo: TUniDBEdit
                Left = 3
                Top = 17
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
                TabOrder = 2
                Color = clGray
                ReadOnly = True
              end
            end
            object rcBlock20: TUniContainerPanel
              Tag = 1
              Left = 196
              Top = 3
              Width = 150
              Height = 48
              Hint = '[[cols:xs-12 sm-12 md-3]]'
              ParentColor = False
              TabOrder = 2
              DesignSize = (
                150
                48)
              object UniDBDateTimePicker1: TUniDBDateTimePicker
                Tag = 1
                Left = 3
                Top = 17
                Width = 144
                Height = 29
                Hint = ''
                DataField = 'EMISSAO'
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
              object UniLabel13: TUniLabel
                Left = 2
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
            object rcBlock30: TUniContainerPanel
              Tag = 1
              Left = 382
              Top = 3
              Width = 150
              Height = 48
              Hint = '[[cols:xs-12 sm-12 md-3]]'
              ParentColor = False
              TabOrder = 3
              DesignSize = (
                150
                48)
              object UniDBDateTimePicker2: TUniDBDateTimePicker
                Tag = 1
                Left = 3
                Top = 17
                Width = 144
                Height = 29
                Hint = ''
                DataField = 'VENCIMENTO'
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
              object UniLabel6: TUniLabel
                Left = 3
                Top = 0
                Width = 63
                Height = 15
                Hint = ''
                Caption = 'Vencimento'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 2
              end
            end
            object rcBlock40: TUniContainerPanel
              Tag = 1
              Left = 558
              Top = 2
              Width = 150
              Height = 48
              Hint = '[[cols:xs-12 sm-12 md-3]]'
              ParentColor = False
              TabOrder = 4
              DesignSize = (
                150
                48)
              object UniDBDateTimePicker3: TUniDBDateTimePicker
                Tag = 1
                Left = 3
                Top = 18
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
                ParentFont = False
                Font.Color = clRed
                Font.Height = -13
                Font.Name = 'Calibri'
                ClientEvents.ExtEvents.Strings = (
                  
                    'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
                    '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
                    '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
                    ':"  /  /   "});'#13#10'}')
                OnExit = UniDBDateTimePicker3Exit
              end
              object UniLabel7: TUniLabel
                Left = 3
                Top = 1
                Width = 61
                Height = 15
                Hint = ''
                Caption = 'Pagamento'
                ParentFont = False
                Font.Color = clRed
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 2
              end
            end
            object rcBlock50: TUniContainerPanel
              Tag = 1
              Left = 6
              Top = 70
              Width = 150
              Height = 48
              Hint = '[[cols:xs-12 sm-12 md-2]]'
              ParentColor = False
              TabOrder = 5
              DesignSize = (
                150
                48)
              object UniDBEditnumero: TUniDBEdit
                Tag = 1
                Left = 2
                Top = 18
                Width = 145
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
                Color = clSkyBlue
              end
              object UniLabel8: TUniLabel
                Left = 2
                Top = 0
                Width = 70
                Height = 15
                Hint = ''
                Caption = 'Numero Doc.'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 2
              end
            end
            object rcBlock60: TUniContainerPanel
              Tag = 1
              Left = 199
              Top = 70
              Width = 150
              Height = 48
              Hint = '[[cols:xs-12 sm-12 md-2]]'
              ParentColor = False
              TabOrder = 6
              DesignSize = (
                150
                48)
              object UniLabel9: TUniLabel
                Left = -1
                Top = 0
                Width = 27
                Height = 15
                Hint = ''
                Caption = 'S'#233'rie'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object rcDBComboBox50: TUniDBComboBox
                Tag = 1
                Left = 3
                Top = 18
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
                  'PEC'
                  'COM')
                TabOrder = 2
                IconItems = <>
              end
            end
            object rcBlock70: TUniContainerPanel
              Tag = 1
              Left = 375
              Top = 70
              Width = 150
              Height = 48
              Hint = '[[cols:xs-12 sm-12 md-2]]'
              ParentColor = False
              TabOrder = 7
              DesignSize = (
                150
                48)
              object UniLabel27: TUniLabel
                Left = 3
                Top = 0
                Width = 28
                Height = 15
                Hint = ''
                Caption = 'Parc.'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object UniDBEditsequencia: TUniDBEdit
                Tag = 1
                Left = 3
                Top = 18
                Width = 144
                Height = 29
                Hint = ''
                DataField = 'PARCELA'
                DataSource = dsMaster
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Color = clRed
                Font.Height = -13
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                TabOrder = 2
                Color = clSkyBlue
              end
            end
            object rcBlock80: TUniContainerPanel
              Tag = 1
              Left = 545
              Top = 70
              Width = 150
              Height = 48
              Hint = '[[cols:xs-12 sm-12 md-4]]'
              ParentColor = False
              TabOrder = 8
              DesignSize = (
                150
                48)
              object UniDBEdit5: TUniDBEdit
                Tag = 1
                Left = 3
                Top = 18
                Width = 144
                Height = 29
                Hint = ''
                DataField = 'HISTORICO'
                DataSource = dsMaster
                CharCase = ecUpperCase
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
              end
              object UniLabel10: TUniLabel
                Left = 3
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
            object rcBlock90: TUniContainerPanel
              Tag = 1
              Left = 713
              Top = 70
              Width = 150
              Height = 48
              Hint = '[[cols:xs-12 sm-12 md-2]]'
              ParentColor = False
              TabOrder = 9
              DesignSize = (
                150
                48)
              object UniDBComboBox1: TUniDBComboBox
                Tag = 1
                Left = 3
                Top = 18
                Width = 144
                Height = 29
                Hint = ''
                Anchors = [akLeft, akTop, akRight]
                DataField = 'TIPO'
                DataSource = dsMaster
                Style = csDropDownList
                Items.Strings = (
                  'Entrada'
                  'Saida')
                TabOrder = 1
                IconItems = <>
              end
              object UniLabel11: TUniLabel
                Left = 3
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
            object rcBlock100: TUniContainerPanel
              Tag = 1
              Left = 6
              Top = 135
              Width = 150
              Height = 48
              Hint = '[[cols:xs-12 sm-12 md-2]]'
              ParentColor = False
              TabOrder = 10
              DesignSize = (
                150
                48)
              object UniLabel18: TUniLabel
                Left = 3
                Top = 1
                Width = 51
                Height = 15
                Hint = ''
                Caption = 'Vendedor'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object UniButtonDbEdit2: TUniButtonDbEdit
                Tag = 1
                Left = 3
                Top = 17
                Width = 144
                Height = 29
                Hint = ''
                DataField = 'FUNCIONARIO'
                DataSource = dsMaster
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                Color = clInfoBk
                OnExit = UniButtonDbEdit2Exit
                OnButtonClick = UniButtonDbEdit2ButtonClick
                IconCls = 'search'
              end
            end
            object rcBlock110: TUniContainerPanel
              Tag = 1
              Left = 199
              Top = 135
              Width = 150
              Height = 48
              Hint = '[[cols:xs-12 sm-12 md-5]]'
              ParentColor = False
              TabOrder = 11
              DesignSize = (
                150
                48)
              object UniDBEdit1: TUniDBEdit
                Tag = 1
                Left = 3
                Top = 17
                Width = 144
                Height = 29
                Hint = ''
                DataField = 'NOME_FUNCIONARIO'
                DataSource = dsMaster
                CharCase = ecUpperCase
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                ReadOnly = True
              end
              object UniLabel12: TUniLabel
                Left = 3
                Top = 1
                Width = 102
                Height = 15
                Hint = ''
                Caption = 'Nome do Vendedor'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 2
              end
            end
            object rcBlock120: TUniContainerPanel
              Tag = 1
              Left = 385
              Top = 135
              Width = 150
              Height = 48
              Hint = '[[cols:xs-12 sm-12 md-2]]'
              ParentColor = False
              TabOrder = 12
              DesignSize = (
                150
                48)
              object UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit
                Left = 1
                Top = 17
                Width = 146
                Height = 29
                Hint = ''
                DataField = 'COMISSAO'
                DataSource = dsMaster
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                DecimalSeparator = ','
                ThousandSeparator = '.'
              end
              object UniLabel14: TUniLabel
                Left = 1
                Top = 1
                Width = 66
                Height = 15
                Hint = ''
                Caption = '% Comiss'#227'o'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 2
              end
            end
            object rcBlock130: TUniContainerPanel
              Tag = 1
              Left = 561
              Top = 134
              Width = 150
              Height = 48
              Hint = '[[cols:xs-12 sm-12 md-3]]'
              ParentColor = False
              TabOrder = 13
              DesignSize = (
                150
                48)
              object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                Left = 2
                Top = 18
                Width = 145
                Height = 29
                Hint = ''
                DataField = 'VALOR'
                DataSource = dsMaster
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 1
                DecimalSeparator = ','
                ThousandSeparator = '.'
              end
              object UniLabel15: TUniLabel
                Left = 1
                Top = 2
                Width = 59
                Height = 15
                Hint = ''
                Caption = 'Valor Pago'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 2
              end
            end
            object rcBlock140: TUniContainerPanel
              Left = 6
              Top = 192
              Width = 857
              Height = 152
              Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
              ParentColor = False
              TabOrder = 14
              DesignSize = (
                857
                152)
              object UniLabel16: TUniLabel
                Left = 3
                Top = 6
                Width = 66
                Height = 15
                Hint = ''
                Caption = 'Observa'#231#227'o'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object UniDBMemo1: TUniDBMemo
                Left = 3
                Top = 27
                Width = 854
                Height = 122
                Hint = ''
                DataField = 'OBSERVACAO'
                DataSource = dsMaster
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                Color = clInactiveCaption
              end
            end
          end
        end
      end
    end
  end
  inherited htmlFrame: TUniHTMLFrame
    Left = 283
    Top = 3
    ExplicitLeft = 283
    ExplicitTop = 3
  end
  object dsfiltro: TDataSource
    AutoEdit = False
    DataSet = sqlSearchMaster
    Left = 411
    Top = 7
  end
  object sqlSearchMaster: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'SELECT * FROM EXTRATO_COMISSAO')
    Left = 441
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
    object sqlSearchMasterPAGAMENTO: TDateField
      FieldName = 'PAGAMENTO'
      Origin = 'PAGAMENTO'
    end
    object sqlSearchMasterHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Size = 150
    end
    object sqlSearchMasterTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      OnGetText = sqlSearchMasterTIPOGetText
      Size = 10
    end
    object sqlSearchMasterPARCELA: TIntegerField
      FieldName = 'PARCELA'
      Origin = 'PARCELA'
    end
    object sqlSearchMasterVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      currency = True
      Precision = 18
      Size = 2
    end
  end
  object dscrud: TDataSource
    AutoEdit = False
    DataSet = sqlMaster
    Left = 475
    Top = 7
  end
  object sqlMaster: TFDQuery
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    UpdateOptions.UpdateTableName = 'EXTRATO_COMISSAO'
    SQL.Strings = (
      'SELECT * FROM EXTRATO_COMISSAO WHERE CODIGO = :table_pk')
    Left = 505
    Top = 7
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object popMenuOptions: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 338
    Top = 10
    object G1: TUniMenuItem
      Caption = 'Gerar Parcelas'
      ImageIndex = 121
    end
  end
  object UniScreenMask1: TUniScreenMask
    AttachedControl = btnSaveReg
    Enabled = True
    DisplayMessage = 'Aguarde ...'
    Left = 373
    Top = 9
  end
end
