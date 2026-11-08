inherited frmHISTORICOBENENOTA: TfrmHISTORICOBENENOTA
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseTop: TUniContainerPanel
      object labTitleForm: TUniLabel
        Left = 49
        Top = 8
        Width = 355
        Height = 26
        Hint = '[['#13#10'caption-dots:mobile-v-16 '#13#10']]'#13#10#13#10
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        Caption = 'HIST'#211'RICO DE BENEFICIAMENTO DE NOTA'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clBtnFace
        TabOrder = 1
      end
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
              ScrollHeight = 327
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
                Top = 291
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
                Height = 237
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
                    Width = 72
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Numero Nota'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniButtonEditpnota: TUniButtonEdit
                    AlignWithMargins = True
                    Left = 2
                    Top = 26
                    Width = 246
                    Height = 26
                    Hint = ''
                    Text = '0'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    OnButtonClick = UniButtonEditpnotaButtonClick
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
                  object UniEditserie: TUniEdit
                    AlignWithMargins = True
                    Left = 3
                    Top = 23
                    Width = 246
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
                    Width = 27
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Serie'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object UniContainerPanel2: TUniContainerPanel
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
                  DesignSize = (
                    250
                    60)
                  object UniLabel4: TUniLabel
                    AlignWithMargins = True
                    Left = 3
                    Top = 7
                    Width = 56
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Sequencia'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniEditsequencia: TUniEdit
                    AlignWithMargins = True
                    Left = 3
                    Top = 29
                    Width = 246
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
                object UniContainerPanel1: TUniContainerPanel
                  AlignWithMargins = True
                  Left = 0
                  Top = 177
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
                    Left = 3
                    Top = 7
                    Width = 44
                    Height = 15
                    Hint = ''
                    Margins.Top = 1
                    Margins.Bottom = 2
                    Caption = 'Produto'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniEditproduto: TUniEdit
                    AlignWithMargins = True
                    Left = 4
                    Top = 29
                    Width = 246
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
              end
            end
          end
          object dbgSearchCRUD: TUniDBGrid
            Left = 266
            Top = 0
            Width = 709
            Height = 580
            Hint = ''
            DataSource = dsbenenota
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
            OnCellClick = dbgSearchCRUDCellClick
            Columns = <
              item
                FieldName = 'detalhes'
                Title.Caption = ' '
                Width = 30
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'NUMERO'
                Title.Caption = 'NUMERO'
                Width = 144
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'SERIE'
                Title.Caption = 'SERIE'
                Width = 144
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'SEQUENCIA'
                Title.Caption = 'S'
                Width = 30
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
              item
                FieldName = 'EMISSAO'
                Title.Caption = 'EMISSAO'
                Width = 120
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'DESCRICAO'
                Title.Caption = 'DESCRICAO'
                Width = 300
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'QUANTIDADE'
                Title.Caption = 'Qtde'
                Width = 80
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'DESCARTE'
                Title.Caption = 'DESCARTE'
                Width = 74
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'PUREZA'
                Title.Caption = 'PU%'
                Width = 70
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'GERMINACAO'
                Title.Caption = 'GE%'
                Width = 70
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'VALORCULTURAL'
                Title.Caption = 'VC%'
                Width = 70
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'LOTEDESTINO'
                Title.Caption = 'LOTE'
                Width = 144
                Font.Name = 'Calibri'
              end>
          end
        end
      end
    end
  end
  object tbbenenota: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 664
    Top = 8
    object tbbenenotaNUMERO: TStringField
      FieldName = 'NUMERO'
    end
    object tbbenenotaSERIE: TStringField
      FieldName = 'SERIE'
    end
    object tbbenenotaSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
    end
    object tbbenenotaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object tbbenenotaQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object tbbenenotaPUREZA: TFloatField
      FieldName = 'PUREZA'
    end
    object tbbenenotaGERMINACAO: TFloatField
      FieldName = 'GERMINACAO'
    end
    object tbbenenotaVALORCULTURAL: TFloatField
      FieldName = 'VALORCULTURAL'
    end
    object tbbenenotaDESCARTE: TFloatField
      FieldName = 'DESCARTE'
    end
    object tbbenenotaLOTEDESTINO: TStringField
      FieldName = 'LOTEDESTINO'
    end
    object tbbenenotaBOLETIMDESTINO: TStringField
      FieldName = 'BOLETIMDESTINO'
    end
    object tbbenenotaEMISSAO: TDateField
      FieldName = 'EMISSAO'
    end
    object tbbenenotadetalhes: TStringField
      FieldName = 'detalhes'
      OnGetText = tbbenenotadetalhesGetText
      Size = 1
    end
    object tbbenenotaPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
    end
  end
  object dsbenenota: TDataSource
    DataSet = tbbenenota
    Left = 693
    Top = 8
  end
  object UniScreenMask: TUniScreenMask
    Enabled = True
    DisplayMessage = 'Aguarde ...'
    Left = 729
    Top = 10
  end
end
