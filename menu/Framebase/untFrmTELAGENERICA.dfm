object frmTELAGENERICA: TfrmTELAGENERICA
  Left = 0
  Top = 0
  ClientHeight = 420
  ClientWidth = 723
  Caption = 'Tela Generica'
  OnShow = UniFormShow
  OnResize = UniFormResize
  BorderStyle = bsSingle
  OldCreateOrder = False
  OnClose = FecharTela
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  TextHeight = 15
  object rcBlock10: TUniContainerPanel
    Left = 0
    Top = 389
    Width = 723
    Height = 31
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 0
    object btnLkpClear: TUniBitBtn
      Left = 625
      Top = 1
      Width = 95
      Height = 29
      Hint = '[[cls:ButtonThemeCrud]]'
      Margins.Top = 28
      Margins.Bottom = 12
      Caption = 'Fechar'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = btnLkpClearClick
    end
    object ubtnimpressao: TUniBitBtn
      Left = 515
      Top = 1
      Width = 95
      Height = 29
      Hint = '[[cls:ButtonThemeCrud]]'
      Margins.Top = 28
      Margins.Bottom = 12
      Visible = False
      Caption = '<i class="fas fa-file-pdf"> Impress'#227'o</i>'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
      OnClick = ubtnimpressaoClick
    end
  end
  object UniPageControltela: TUniPageControl
    Left = 0
    Top = 0
    Width = 723
    Height = 389
    Hint = ''
    ActivePage = UniTabSheetparcelaspgto
    Align = alClient
    TabOrder = 1
    object UniTabSheetcontrolepontos: TUniTabSheet
      Hint = ''
      Caption = 'Selecionar lote'
    end
    object UniTabSheethistoriconotasfaturada: TUniTabSheet
      Hint = ''
      Caption = 'Hist'#243'rico Pessoa'
      object rcBlock90: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alClient
        TabOrder = 0
        object dbgSearchCRUD: TUniDBGrid
          Left = 0
          Top = 0
          Width = 715
          Height = 361
          Hint = ''
          DataSource = dm_rc.dshistpessoas
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgAutoRefreshRow]
          WebOptions.FetchAll = True
          LoadMask.Message = 'Loading data...'
          ForceFit = True
          Align = alClient
          Font.Height = -13
          Font.Name = 'Calibri'
          ParentFont = False
          TabOrder = 1
          Exporter.Enabled = True
          Columns = <
            item
              FieldName = 'OPERACAO_OP'
              Title.Caption = 'TIPO'
              Width = 100
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'CANCELADA'
              Title.Caption = 'Situa'#231#227'o'
              Width = 100
              Font.Name = 'Calibri'
              Alignment = taCenter
            end
            item
              FieldName = 'PEDIDO'
              Title.Caption = 'PEDIDO'
              Width = 80
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'NUMERO'
              Title.Caption = 'Numero'
              Width = 74
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'VLRBASEICMS'
              Title.Caption = 'Base ICMS'
              Width = 90
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'VLRICMS'
              Title.Caption = 'Valor ICMS'
              Width = 90
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'VLRPRODUTOS'
              Title.Caption = 'Produtos'
              Width = 90
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'VLRTOTAL'
              Title.Caption = 'TOTAL'
              Width = 100
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'imp'
              Title.Caption = ' '
              Width = 30
              Font.Name = 'Calibri'
              Alignment = taCenter
            end>
        end
      end
    end
    object UniTabSheethistprodutopessoa: TUniTabSheet
      Hint = ''
      Caption = 'Compra de Produtos'
      object rcBlock100: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alClient
        TabOrder = 0
        object UniDBGrid1: TUniDBGrid
          Left = 0
          Top = 0
          Width = 715
          Height = 361
          Hint = ''
          DataSource = dm_rc.dshistoricoprodtos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgAutoRefreshRow]
          WebOptions.FetchAll = True
          LoadMask.Message = 'Loading data...'
          ForceFit = True
          Align = alClient
          Font.Height = -13
          Font.Name = 'Calibri'
          ParentFont = False
          TabOrder = 1
          Exporter.Enabled = True
          Columns = <
            item
              FieldName = 'OPERACAO_OP'
              Title.Caption = 'TIPO'
              Width = 100
              Font.Name = 'Calibri'
              Alignment = taCenter
            end
            item
              FieldName = 'PRODUTO'
              Title.Caption = 'PRODUTO'
              Width = 74
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'DESCRICAO'
              Title.Caption = 'DESCRI'#199#195'O DO ITEM'
              Width = 350
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'QUANTIDADE'
              Title.Caption = 'QTDE KG\SC'
              Width = 120
              Font.Name = 'Calibri'
            end>
        end
      end
    end
    object UniTabSheethistlotespessoa: TUniTabSheet
      Hint = ''
      Caption = 'Hist'#243'rico de Boletim'
      object rcBlock110: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alClient
        TabOrder = 0
        object UniDBGrid2: TUniDBGrid
          Left = 0
          Top = 0
          Width = 715
          Height = 361
          Hint = ''
          DataSource = dm_rc.dshistlote
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgAutoRefreshRow]
          WebOptions.Paged = False
          WebOptions.FetchAll = True
          LoadMask.Message = 'Loading data...'
          ForceFit = True
          Align = alClient
          Font.Height = -13
          Font.Name = 'Calibri'
          ParentFont = False
          TabOrder = 1
          Exporter.Enabled = True
          Columns = <
            item
              FieldName = 'NUMERO'
              Title.Caption = 'NUMERO'
              Width = 74
              Font.Name = 'Calibri'
              Alignment = taCenter
            end
            item
              FieldName = 'SERIE'
              Title.Caption = 'SERIE'
              Width = 50
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'PRODUTO'
              Title.Caption = 'PRODUTO'
              Width = 74
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'LOTESEMENTE'
              Title.Caption = 'LOTESEMENTE'
              Width = 144
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'TERMOSEMENTE'
              Title.Caption = 'TERMOSEMENTE'
              Width = 144
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'PUREZA'
              Title.Caption = 'PUREZA'
              Width = 60
              Font.Name = 'Calibri'
              Alignment = taCenter
            end
            item
              FieldName = 'QUANTIDADE'
              Title.Caption = 'QTDE'
              Width = 80
              Font.Name = 'Calibri'
            end>
        end
      end
    end
    object UniTabSheethistvendalote: TUniTabSheet
      Hint = ''
      Caption = 'Hist'#243'rico Vendas'
      object rcBlock120: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alClient
        TabOrder = 0
        object UniDBGrid3: TUniDBGrid
          Left = 0
          Top = 0
          Width = 715
          Height = 361
          Hint = ''
          DataSource = dm_rc.dshistlotevenda
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgAutoRefreshRow]
          WebOptions.Paged = False
          WebOptions.FetchAll = True
          LoadMask.Message = 'Loading data...'
          ForceFit = True
          Align = alClient
          Font.Height = -13
          Font.Name = 'Calibri'
          ParentFont = False
          TabOrder = 1
          Exporter.Enabled = True
          OnDrawColumnCell = UniDBGrid3DrawColumnCell
          Columns = <
            item
              FieldName = 'OPERACAO_OP'
              Title.Caption = 'TIPO'
              Width = 70
              Font.Name = 'Calibri'
              Alignment = taCenter
            end
            item
              FieldName = 'DATA'
              Title.Caption = 'EMISSAO'
              Width = 90
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'NUMERO'
              Title.Caption = 'NUMERO'
              Width = 70
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'PESSOA'
              Title.Caption = 'PESSOA'
              Width = 70
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'NOME'
              Title.Caption = 'NOME'
              Width = 200
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'ESTADO'
              Title.Caption = 'UF'
              Width = 40
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'ENTRADA'
              Title.Caption = 'ENTRADA'
              Width = 74
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'SAIDA'
              Title.Caption = 'SAIDA'
              Width = 74
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'SALDO'
              Title.Caption = 'SLD KG'
              Width = 74
              Font.Name = 'Calibri'
            end>
        end
      end
    end
    object UniTabSheettdetalhesemissor: TUniTabSheet
      Hint = ''
      Caption = 'Detalhes Emissor'
      object UniScrollBox1: TUniScrollBox
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = ''
        Align = alClient
        TabOrder = 0
        ScrollHeight = 353
        ScrollWidth = 713
        object rcBlock130: TUniContainerPanel
          Tag = 1
          Left = 3
          Top = 8
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 0
          DesignSize = (
            150
            48)
          object UniLabel7: TUniLabel
            Left = 2
            Top = 1
            Width = 43
            Height = 15
            Hint = ''
            Caption = 'Numero'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object edCodigo: TUniDBEdit
            Left = 2
            Top = 18
            Width = 145
            Height = 29
            Hint = ''
            DataField = 'NUMERO'
            DataSource = dm_rc.dsfdqrymvmestre
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
        object rcBlock170: TUniContainerPanel
          Tag = 1
          Left = 3
          Top = 62
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 1
          object UniLabel9: TUniLabel
            Left = 3
            Top = 2
            Width = 57
            Height = 15
            Hint = ''
            Caption = 'Base ICMS'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit
            Left = 2
            Top = 18
            Width = 145
            Height = 29
            Hint = ''
            DataField = 'VLRBASEICMS'
            DataSource = dm_rc.dsfdqrymvmestre
            TabOrder = 2
            ReadOnly = True
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
        end
        object rcBlock140: TUniContainerPanel
          Tag = 1
          Left = 196
          Top = 4
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            150
            48)
          object UniDBEdit1: TUniDBEdit
            Left = 2
            Top = 18
            Width = 145
            Height = 29
            Hint = ''
            DataField = 'SERIE'
            DataSource = dm_rc.dsfdqrymvmestre
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
            ReadOnly = True
          end
          object UniLabel8: TUniLabel
            Left = 2
            Top = 1
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
        object rcBlock180: TUniContainerPanel
          Tag = 1
          Left = 196
          Top = 62
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 3
          object UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit
            Left = 2
            Top = 18
            Width = 145
            Height = 29
            Hint = ''
            DataField = 'VLRICMS'
            DataSource = dm_rc.dsfdqrymvmestre
            TabOrder = 1
            ReadOnly = True
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel10: TUniLabel
            Left = 2
            Top = 2
            Width = 47
            Height = 15
            Hint = ''
            Caption = 'Vlr ICMS'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock150: TUniContainerPanel
          Tag = 1
          Left = 382
          Top = 4
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 4
          DesignSize = (
            150
            48)
          object UniLabel13: TUniLabel
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
          object UniButtonDbEditlaboratorio: TUniDBEdit
            Tag = 1
            Left = 3
            Top = 18
            Width = 145
            Height = 29
            Hint = ''
            DataField = 'PESSOA'
            DataSource = dm_rc.dsfdqrymvmestre
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            Color = clInfoBk
            ReadOnly = True
          end
        end
        object rcBlock190: TUniContainerPanel
          Tag = 1
          Left = 382
          Top = 62
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 5
          object UniLabel11: TUniLabel
            Left = 3
            Top = 2
            Width = 50
            Height = 15
            Hint = ''
            Caption = 'Produtos'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit
            Left = 2
            Top = 18
            Width = 145
            Height = 29
            Hint = ''
            DataField = 'VLRPRODUTOS'
            DataSource = dm_rc.dsfdqrymvmestre
            TabOrder = 2
            ReadOnly = True
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
        end
        object rcBlock160: TUniContainerPanel
          Tag = 1
          Left = 563
          Top = 3
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 6
          DesignSize = (
            150
            48)
          object UniLabel22: TUniLabel
            AlignWithMargins = True
            Left = 2
            Top = 2
            Width = 46
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Emiss'#227'o'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniDBDateTimePicker2: TUniDBDateTimePicker
            Left = 2
            Top = 19
            Width = 145
            Height = 29
            Hint = ''
            DataField = 'EMISSAO'
            DataSource = dm_rc.dsfdqrymvmestre
            DateTime = 44561.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            ReadOnly = True
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
        end
        object rcBlock200: TUniContainerPanel
          Tag = 1
          Left = 563
          Top = 62
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 7
          object UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit
            Left = 2
            Top = 18
            Width = 145
            Height = 29
            Hint = ''
            DataField = 'VLRTOTAL'
            DataSource = dm_rc.dsfdqrymvmestre
            TabOrder = 1
            ReadOnly = True
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel12: TUniLabel
            Left = 3
            Top = 2
            Width = 109
            Height = 15
            Hint = ''
            Caption = 'Total do Documento'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock210: TUniContainerPanel
          Left = 0
          Top = 110
          Width = 713
          Height = 243
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          Align = alBottom
          TabOrder = 8
          ExplicitTop = 116
          object UniDBGrid4: TUniDBGrid
            Left = 0
            Top = 23
            Width = 713
            Height = 220
            Hint = ''
            DataSource = dm_rc.dsfdqrymvitens
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgAutoRefreshRow]
            WebOptions.Paged = False
            WebOptions.FetchAll = True
            LoadMask.Message = 'Loading data...'
            ForceFit = True
            Align = alBottom
            Font.Height = -13
            Font.Name = 'Calibri'
            ParentFont = False
            TabOrder = 1
            Exporter.Enabled = True
          end
        end
      end
    end
    object UniTabSheetalteranotaeletronica: TUniTabSheet
      Hint = ''
      Caption = 'Altera Nota Eletr'#244'nica'
      object UniScrollBox2: TUniScrollBox
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = ''
        Align = alClient
        TabOrder = 0
        ScrollHeight = 148
        ScrollWidth = 710
        object rcBlock220: TUniContainerPanel
          Tag = 1
          Left = 3
          Top = 8
          Width = 187
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-2]]'
          ParentColor = False
          TabOrder = 0
          DesignSize = (
            187
            48)
          object UniLabel14: TUniLabel
            Left = 0
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
          object UniButtonDbEditcodigofuncionariomestre: TUniDBEdit
            Tag = 1
            Left = 2
            Top = 16
            Width = 150
            Height = 29
            Hint = ''
            DataField = 'FUNCIONARIO'
            DataSource = dm_rc.dsfdqrymvmestre
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            Color = clInfoBk
            OnExit = UniButtonDbEditcodigofuncionariomestreExit
          end
          object btnBusca_UniButtonDbEditcodigofuncionariomestre: TUniBitBtn
            Left = 154
            Top = 16
            Width = 30
            Height = 29
            Hint = '[[cls:ButtonThemeCrud |ico:fas-search |]]'
            Caption = ''
            Anchors = [akTop, akRight]
            TabOrder = 3
            OnClick = UniButtonDbEditcodigofuncionariomestreButtonClick
          end
        end
        object rcBlock230: TUniContainerPanel
          Tag = 1
          Left = 196
          Top = 8
          Width = 353
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-6]]'
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            353
            48)
          object UniLabel15: TUniLabel
            Left = 2
            Top = 0
            Width = 85
            Height = 15
            Hint = ''
            Caption = 'Nome Vendedor'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniEditnomevendedor: TUniEdit
            AlignWithMargins = True
            Left = 2
            Top = 18
            Width = 348
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
        object rcBlock240: TUniContainerPanel
          Tag = 1
          Left = 560
          Top = 8
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            150
            48)
          object UniLabel16: TUniLabel
            Left = 2
            Top = 1
            Width = 66
            Height = 15
            Hint = ''
            Caption = '% Comiss'#227'o'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniDBFormattedNumberEditperccomissao: TUniDBFormattedNumberEdit
            Left = 2
            Top = 18
            Width = 147
            Height = 29
            Hint = ''
            DataField = 'COMISSAOFUNCIONARIO'
            DataSource = dm_rc.dsfdqrymvmestre
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
        end
        object rcBlock250: TUniContainerPanel
          Tag = 1
          Left = 3
          Top = 62
          Width = 390
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-6]]'
          ParentColor = False
          TabOrder = 3
          DesignSize = (
            390
            48)
          object UniLabel17: TUniLabel
            Left = 2
            Top = 2
            Width = 70
            Height = 15
            Hint = ''
            Caption = 'N'#186' Protocolo'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniDBEditnotaprotocolo: TUniDBEdit
            Tag = 1
            Left = 3
            Top = 18
            Width = 384
            Height = 29
            Hint = ''
            DataField = 'PROTOCOLO'
            DataSource = dm_rc.dsfdqrymvmestre
            CharCase = ecUpperCase
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
        end
        object rcBlock260: TUniContainerPanel
          Tag = 1
          Left = 399
          Top = 62
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 4
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
            DataField = 'PEDIDO'
            DataSource = dm_rc.dsfdqrymvmestre
            CharCase = ecUpperCase
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object UniLabel18: TUniLabel
            Left = 2
            Top = 2
            Width = 38
            Height = 15
            Hint = ''
            Caption = 'Pedido'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock270: TUniContainerPanel
          Tag = 1
          Left = 560
          Top = 62
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-2]]'
          ParentColor = False
          TabOrder = 5
          DesignSize = (
            150
            48)
          object UniDBComboBoxtiponota: TUniDBComboBox
            Tag = 1
            Left = 2
            Top = 18
            Width = 145
            Height = 29
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            DataField = 'CANCELADA'
            DataSource = dm_rc.dsfdqrymvmestre
            Style = csDropDownList
            Items.Strings = (
              ''
              'A'
              'C')
            TabOrder = 1
            IconItems = <>
          end
          object UniLabel26: TUniLabel
            Left = 2
            Top = 2
            Width = 80
            Height = 15
            Hint = ''
            Caption = 'Status da Nota'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock280: TUniContainerPanel
          Left = 0
          Top = 321
          Width = 713
          Height = 38
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          Align = alBottom
          TabOrder = 6
          object UniBitBtn1: TUniBitBtn
            Left = 2
            Top = 5
            Width = 95
            Height = 29
            Hint = '[[cls:ButtonThemeCrud]]'
            Margins.Top = 28
            Margins.Bottom = 12
            Caption = 'Gravar'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
            OnClick = UniBitBtn1Click
          end
        end
      end
    end
    object UniTabSheetsenhaexclusaonota: TUniTabSheet
      Hint = ''
      Caption = 'Excluir'
      object rcBlock290: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 124
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alTop
        TabOrder = 0
        object UniImage1: TUniImage
          Left = 0
          Top = 0
          Width = 715
          Height = 75
          Hint = ''
          Center = True
          Picture.Data = {
            055449636F6E0000010001002020000001000800A80800001600000028000000
            2000000040000000010008000000000080040000000000000000000000010000
            0000000000000000000080000080000000808000800000008000800080800000
            C0C0C000C0DCC000F0CAA600CCFFFF0099FFFF0066FFFF0033FFFF00FFCCFF00
            CCCCFF0099CCFF0066CCFF0033CCFF0000CCFF00FF99FF00CC99FF009999FF00
            6699FF003399FF000099FF00FF66FF00CC66FF009966FF006666FF003366FF00
            0066FF00FF33FF00CC33FF009933FF006633FF003333FF000033FF00CC00FF00
            9900FF006600FF003300FF00FFFFCC00CCFFCC0099FFCC0066FFCC0066FFCC00
            33FFCC0000FFCC00FFCCCC00CCCCCC0099CCCC0066CCCC0033CCCC0000CCCC00
            FF99CC00CC99CC009999CC006699CC003399CC000099CC00FF66CC00CC66CC00
            9966CC006666CC003366CC000066CC00FF33CC00CC33CC009933CC006633CC00
            3333CC000033CC00FF00CC00CC00CC009900CC006600CC003300CC000000CC00
            FFFF9900CCFF990099FF990066FF990033FF990000FF9900FFCC9900CCCC9900
            99CC990066CC990033CC990000CC9900FF999900CC9999009999990066999900
            3399990000999900FF669900CC66990099669900666699003366990000669900
            FF339900CC33990099339900663399003333990000339900FF009900CC009900
            99009900660099003300990000009900FFFF6600CCFF660099FF660066FF6600
            33FF660000FF6600FFCC6600CCCC660099CC660066CC660033CC660000CC6600
            FF996600CC99660099996600669966003399660000996600FF666600CC666600
            99666600666666003366660000666600FF336600CC3366009933660066336600
            3333660000336600FF006600CC00660099006600660066003300660000006600
            FFFF3300CCFF330099FF330066FF330033FF330000FF3300FFCC3300CCCC3300
            99CC330066CC330033CC330000CC3300FF993300CC9933009999330066993300
            3399330000993300FF663300CC66330099663300666633003366330000663300
            FF333300CC33330099333300663333003333330000333300FF003300CC003300
            99003300660033003300330000003300CCFF000099FF000066FF000033FF0000
            FFCC0000CCCC000099CC000066CC000033CC000000CC0000FF990000CC990000
            99990000669900003399000000990000FF660000CC6600009966000066660000
            0066000033660000FF330000CC33000099330000663300003333000000330000
            CC0000009900000066000000330000000000DD000000BB000000AA0000008800
            0000770000005500000044000000220000DD000000BB000000AA000000880000
            00770000005500000044000000220000DDDDDD00555555007777770077777700
            44444400222222001111110077000000550000004400000022000000F0FBFF00
            A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
            FFFFFF0000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000DEDEDEDE000000000000000000
            0000000000000000000000000000000000DEDE7272DEDEDEDE00000000000000
            0000000000000000000000000000000000DE72DDDDDD72727200000000000000
            00000000000000000000000000000000DEDEDD4E4E4EDDDD72DE000000000000
            00000000000000000000000000000000DEDD4EDBDB4EDBDD72DE000000000000
            00000000000000000000000000000000DD4EF9F9F9DBDBDD72DE000000000000
            00000000000000000000000000000000DD4EF9FFF9DBDBDDDDDE000000000000
            0000000000000000000000000000000000DBF9F9F9DB4EDDDE00000000000000
            0000000000000000000000000000000000DDDBDBDBDDDEDEDE00000000000000
            000000000000000000000000000000000000000000DEDE000000000000000000
            0000000000000000000000000000000000000000DE0000000000000000000000
            00000000000000000000000000000000000000DBDEDE00000000000000000000
            00000000000000000000000000000000000000DBDEDEDE000000000000000000
            000000000000000000000000000000000000DBDBDEDEDE000000000000000000
            000000000000000000000000000000000000DBDBDBDEDE000000000000000000
            000000000000000000000000000000000000DBDBDBDEDEDE0000000000000000
            000000000000000000000000000000000000DBDBDBDEDEDE0000000000000000
            0000000000000000000000000000000000DBDBDBDBDBDEDE0000000000000000
            0000000000000000000000000000000000DBDBDBDBDBDEDEDE00000000000000
            0000000000000000000000000000000000DBDBDBDBDBDEDEDE00000000000000
            00000000000000000000000000000000DBDBDBDBDBDBDBDEDEDE000000000000
            00000000000000000000000000000000DBDBDBDBDB1D1D1DDEDE000000000000
            00000000000000000000000000000000DBDBDB1D1DDBDBDB1DDE000000000000
            00000000000000000000000000000000DB1D1DDBDBDBDBDBDB1DDE0000000000
            0000000000000000000000000000001D1DDBDBDBDBDBDBDBDBDB1D0000000000
            000000000000000000000000000000DBDBDBDBDBDBDBDBDBDBDBDB0000000000
            00000000000000000000000000000000DBDBDBDBDBDBDBDBDB00000000000000
            0000000000000000000000000000000000DBDBDBDBDBDB000000000000000000
            000000000000000000000000000000000000DBDBDB0000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000FFFFFFFFFFFE1FFFFFF807FFFFF003FFFFF003FFFFE001FFFFE001FF
            FFE001FFFFE001FFFFF003FFFFF003FFFFF807FFFFFE1FFFFFFC1FFFFFFC0FFF
            FFF80FFFFFF80FFFFFF807FFFFF807FFFFF007FFFFF003FFFFF003FFFFE001FF
            FFE001FFFFE001FFFFE000FFFFC000FFFFC000FFFFE001FFFFF007FFFFF81FFF
            FFFC7FFF}
          Align = alTop
        end
        object UniLabel106: TUniLabel
          Left = 1
          Top = 82
          Width = 711
          Height = 39
          Hint = ''
          Alignment = taCenter
          AutoSize = False
          Caption = 'Dirija-se ao Administrador da Empresa'
          ParentFont = False
          Font.Color = clBlue
          Font.Height = -19
          Font.Style = [fsBold]
          TabOrder = 2
        end
      end
      object rcBlock300: TUniContainerPanel
        Left = 0
        Top = 124
        Width = 715
        Height = 72
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alTop
        TabOrder = 1
        object UniLabelexclusaonota: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 709
          Height = 66
          Hint = ''
          Alignment = taCenter
          AutoSize = False
          Caption = '1552001'
          Align = alClient
          ParentFont = False
          Font.Height = -35
          Font.Style = [fsBold]
          TabOrder = 1
        end
      end
      object rcBlock310: TUniContainerPanel
        Left = 0
        Top = 196
        Width = 715
        Height = 78
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alTop
        TabOrder = 2
        DesignSize = (
          715
          78)
        object UniEditsenhaexcluinota: TUniEdit
          AlignWithMargins = True
          Left = 280
          Top = 34
          Width = 145
          Height = 29
          Hint = ''
          Margins.Right = 5
          PasswordChar = '#'
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ClearButton = True
        end
        object UniLabel19: TUniLabel
          Left = 280
          Top = 15
          Width = 145
          Height = 13
          Hint = ''
          Alignment = taCenter
          AutoSize = False
          Caption = 'Numero TOKEN'
          ParentFont = False
          Font.Color = clRed
          TabOrder = 2
        end
      end
      object rcBlock320: TUniContainerPanel
        Left = 0
        Top = 274
        Width = 715
        Height = 56
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alTop
        TabOrder = 3
        object UniBitBtnvalidasenhanota: TUniBitBtn
          Left = 308
          Top = 15
          Width = 95
          Height = 29
          Hint = '[[cls:ButtonThemeCrud]]'
          Margins.Top = 28
          Margins.Bottom = 12
          Caption = 'Validar'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = UniBitBtnvalidasenhanotaClick
        end
      end
    end
    object UniTabSheetparcelaspgto: TUniTabSheet
      Hint = ''
      Caption = 'Parcelas PGTO'
      object UniContainerPanel1: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 0
        object rcBlock370: TUniContainerPanel
          Tag = 1
          Left = 3
          Top = 66
          Width = 150
          Height = 56
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 1
          object UniNumberEditnparcela: TUniNumberEdit
            Left = 3
            Top = 18
            Width = 121
            Height = 29
            Hint = ''
            TabOrder = 1
            DecimalSeparator = ','
          end
          object UniLabel20: TUniLabel
            Left = 4
            Top = 2
            Width = 64
            Height = 15
            Hint = ''
            Caption = 'N'#186' Parcelas'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock360: TUniContainerPanel
          Tag = 1
          Left = 3
          Top = 3
          Width = 151
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 2
          object btnNewReg: TUniBitBtn
            AlignWithMargins = True
            Left = 7
            Top = 10
            Width = 33
            Height = 32
            Hint = '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '<i class="fas fa-plus"></i>'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
            LayoutConfig.Padding = '0 2 0 0'
            OnClick = btnNewRegClick
          end
          object UniBitBtn3: TUniBitBtn
            AlignWithMargins = True
            Left = 81
            Top = 10
            Width = 33
            Height = 32
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
              #13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '<i class="fas fa-cog"></i>'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 2
            ScaleButton = False
            LayoutConfig.Padding = '0 2 0 0'
            OnClick = UniBitBtn3Click
          end
          object UniBitBtn4: TUniBitBtn
            AlignWithMargins = True
            Left = 44
            Top = 10
            Width = 33
            Height = 32
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
              #13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '<i class="fas fa-save"></i>'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 3
            ScaleButton = False
            LayoutConfig.Padding = '0 2 0 0'
            OnClick = UniBitBtn4Click
          end
        end
        object rcBlock380: TUniContainerPanel
          Tag = 1
          Left = 196
          Top = 66
          Width = 150
          Height = 56
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 3
          object UniLabelDtIni: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 2
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
            Left = 3
            Top = 18
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
        object rcBlock390: TUniContainerPanel
          Tag = 1
          Left = 382
          Top = 66
          Width = 150
          Height = 56
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 4
          DesignSize = (
            150
            56)
          object UniFormattedNumberEditvalordocumento: TUniFormattedNumberEdit
            Left = 3
            Top = 18
            Width = 130
            Height = 29
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Calibri'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            ReadOnly = True
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel21: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 2
            Width = 109
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Total do Documento'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock400: TUniContainerPanel
          Left = 0
          Top = 125
          Width = 715
          Height = 183
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          Align = alBottom
          TabOrder = 5
          object UniDBGridtitulos: TUniDBGrid
            AlignWithMargins = True
            Left = 3
            Top = 8
            Width = 709
            Height = 170
            Hint = ''
            DataSource = dm_rc.dstitulos
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.Paged = False
            LoadMask.Message = 'Carregando Titulos'
            ForceFit = True
            Font.Color = clBlack
            Font.Height = -13
            ParentFont = False
            TabOrder = 1
            OnCellClick = UniDBGridtitulosCellClick
            Columns = <
              item
                FieldName = 'PARCELA'
                Title.Caption = 'Parcela'
                Width = 74
                Font.Color = clBlack
              end
              item
                FieldName = 'VENCIMENTO'
                Title.Caption = 'Vencimento'
                Width = 101
                Font.Color = clBlack
              end
              item
                FieldName = 'VALOR'
                Title.Caption = ' Titulos'
                Width = 100
                Font.Color = clBlack
              end
              item
                FieldName = 'exclui'
                Title.Caption = ' '
                Width = 25
                Font.Color = clBlack
                Alignment = taCenter
              end>
          end
        end
        object rcBlock410: TUniContainerPanel
          Left = 0
          Top = 308
          Width = 715
          Height = 53
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          Align = alBottom
          TabOrder = 6
          DesignSize = (
            715
            53)
          object UniFormattedNumberEdittotalduplicatas: TUniFormattedNumberEdit
            Left = 6
            Top = 21
            Width = 121
            Height = 29
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Calibri'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            ReadOnly = True
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel23: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 2
            Width = 113
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Total das Duplicatas'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
      end
    end
    object UniTabSheetlognota: TUniTabSheet
      Hint = ''
      Caption = 'LOG Nota Eletr'#244'nica'
      object rcBlock420: TUniContainerPanel
        Left = 3
        Top = 9
        Width = 709
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 0
        DesignSize = (
          709
          48)
        object UniDBEdit12: TUniDBEdit
          Left = 3
          Top = 17
          Width = 703
          Height = 29
          Hint = ''
          DataField = 'LOGINCLUSAO'
          DataSource = dm_rc.dsfdqrymvmestre
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clBlue
          Font.Style = [fsBold]
          TabOrder = 1
          ReadOnly = True
        end
        object UniLabel24: TUniLabel
          Left = 3
          Top = 1
          Width = 85
          Height = 15
          Hint = ''
          Caption = 'Log de Inclus'#227'o'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock430: TUniContainerPanel
        Left = 3
        Top = 62
        Width = 709
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          709
          48)
        object UniDBEdit2: TUniDBEdit
          Left = 3
          Top = 17
          Width = 703
          Height = 29
          Hint = ''
          DataField = 'LOGALTERACAO'
          DataSource = dm_rc.dsfdqrymvmestre
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clBlue
          Font.Style = [fsBold]
          TabOrder = 1
          ReadOnly = True
        end
        object UniLabel25: TUniLabel
          Left = 3
          Top = 1
          Width = 90
          Height = 15
          Hint = ''
          Caption = 'Log de Altera'#231#227'o'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock440: TUniContainerPanel
        Left = 3
        Top = 114
        Width = 709
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          709
          48)
        object UniDBEdit3: TUniDBEdit
          Left = 3
          Top = 16
          Width = 703
          Height = 29
          Hint = ''
          DataField = 'LOGENVIO'
          DataSource = dm_rc.dsfdqrymvmestre
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clBlue
          Font.Style = [fsBold]
          TabOrder = 1
          ReadOnly = True
        end
        object UniLabel27: TUniLabel
          Left = 3
          Top = 1
          Width = 147
          Height = 15
          Hint = ''
          Caption = 'Envio da NOTA ELETR'#212'NICA'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock450: TUniContainerPanel
        Left = 3
        Top = 165
        Width = 709
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          709
          48)
        object UniDBEdit4: TUniDBEdit
          Left = 3
          Top = 16
          Width = 703
          Height = 29
          Hint = ''
          DataField = 'LOGCANCELA'
          DataSource = dm_rc.dsfdqrymvmestre
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clRed
          Font.Style = [fsBold]
          TabOrder = 1
          ReadOnly = True
        end
        object UniLabel28: TUniLabel
          Left = 3
          Top = 1
          Width = 195
          Height = 15
          Hint = ''
          Caption = 'Cancelamento da NOTA ELETR'#212'NICA'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock460: TUniContainerPanel
        Left = 3
        Top = 217
        Width = 709
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          709
          48)
        object UniDBEdit6: TUniDBEdit
          Left = 3
          Top = 16
          Width = 703
          Height = 29
          Hint = ''
          DataField = 'LOGCARTA'
          DataSource = dm_rc.dsfdqrymvmestre
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 1
          ReadOnly = True
        end
        object UniLabel29: TUniLabel
          Left = 3
          Top = 0
          Width = 216
          Height = 15
          Hint = ''
          Caption = 'Carta de Corre'#231#227'o da NOTA ELETR'#212'NICA'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
    end
    object UniTabSheetConfiguranotaeletronica: TUniTabSheet
      Hint = ''
      Caption = 'Configura Empresa'
      object rcBlock465: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alClient
        TabOrder = 0
        object rcBlock470: TUniContainerPanel
          Left = 3
          Top = 8
          Width = 709
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            709
            48)
          object UniDBEdit7: TUniDBEdit
            Left = 1
            Top = 16
            Width = 705
            Height = 29
            Hint = ''
            DataField = 'CAMINHO_FASTREPORT'
            DataSource = dm_rc.dstbempresas
            CharCase = ecLowerCase
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object UniLabel30: TUniLabel
            Left = 0
            Top = 0
            Width = 85
            Height = 15
            Hint = ''
            Caption = 'Path Relat'#243'rios'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock480: TUniContainerPanel
          Left = 1
          Top = 62
          Width = 711
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            711
            48)
          object UniLabel31: TUniLabel
            Left = 3
            Top = 2
            Width = 86
            Height = 15
            Hint = ''
            Caption = 'Path Impress'#227'o'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniDBEdit8: TUniDBEdit
            Left = 3
            Top = 18
            Width = 705
            Height = 29
            Hint = ''
            DataField = 'CAMINHO_IMPRESSAO'
            DataSource = dm_rc.dstbempresas
            CharCase = ecLowerCase
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
        end
        object rcBlock490: TUniContainerPanel
          Left = 3
          Top = 115
          Width = 709
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 3
          DesignSize = (
            709
            48)
          object UniLabel32: TUniLabel
            Left = 0
            Top = -1
            Width = 99
            Height = 15
            Hint = ''
            Caption = 'Logo tipo Empresa'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniDBEdit9: TUniDBEdit
            Left = 1
            Top = 15
            Width = 668
            Height = 29
            Hint = ''
            DataField = 'CAMINHO_LOGO'
            DataSource = dm_rc.dstbempresas
            CharCase = ecLowerCase
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object UniBitBtn2: TUniBitBtn
            AlignWithMargins = True
            Left = 674
            Top = 15
            Width = 33
            Height = 32
            Hint = '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black'#13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '<i class="fas fa-folder"></i>'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 3
            ScaleButton = False
            LayoutConfig.Padding = '0 2 0 0'
            OnClick = UniBitBtn2Click
          end
        end
        object rcBlock500: TUniContainerPanel
          Left = 3
          Top = 163
          Width = 709
          Height = 55
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 4
          object UniDBCheckBox1: TUniDBCheckBox
            Left = 3
            Top = 4
            Width = 139
            Height = 17
            Hint = ''
            DataField = 'IMP_FANTASIA'
            DataSource = dm_rc.dstbempresas
            ValueChecked = 'T'
            ValueUnchecked = 'F'
            Caption = 'Imprime Fantasia'
            TabOrder = 1
            ParentColor = False
            Color = clBtnFace
          end
          object UniDBCheckBox2: TUniDBCheckBox
            Left = 277
            Top = 4
            Width = 127
            Height = 17
            Hint = ''
            DataField = 'IMP_EXIBEFATURA'
            DataSource = dm_rc.dstbempresas
            ValueChecked = 'T'
            ValueUnchecked = 'F'
            Caption = 'Exibe Campo Fatura'
            TabOrder = 2
            ParentColor = False
            Color = clBtnFace
          end
          object UniDBCheckBox3: TUniDBCheckBox
            Left = 420
            Top = 4
            Width = 136
            Height = 17
            Hint = ''
            DataField = 'IMP_DADOSREFERENCIADOS'
            DataSource = dm_rc.dstbempresas
            ValueChecked = 'T'
            ValueUnchecked = 'F'
            Caption = 'Exibe Dados Refer'#234'ncia'
            TabOrder = 3
            ParentColor = False
            Color = clBtnFace
          end
          object UniDBCheckBox4: TUniDBCheckBox
            Left = 128
            Top = 4
            Width = 97
            Height = 17
            Hint = ''
            DataField = 'IMP_LOGO'
            DataSource = dm_rc.dstbempresas
            ValueChecked = 'T'
            ValueUnchecked = 'F'
            Caption = 'Logo em Cima'
            TabOrder = 4
            ParentColor = False
            Color = clBtnFace
          end
          object UniDBCheckBox5: TUniDBCheckBox
            Left = 576
            Top = 3
            Width = 97
            Height = 17
            Hint = ''
            DataField = 'IMP_RESUMOCANHOTO'
            DataSource = dm_rc.dstbempresas
            ValueChecked = 'T'
            ValueUnchecked = 'F'
            Caption = 'Resumo Canhoto'
            TabOrder = 5
            ParentColor = False
            Color = clBtnFace
          end
          object UniDBCheckBox6: TUniDBCheckBox
            Left = 3
            Top = 29
            Width = 97
            Height = 17
            Hint = ''
            DataField = 'IMP_TRIBUTOSIMP'
            DataSource = dm_rc.dstbempresas
            ValueChecked = 'T'
            ValueUnchecked = 'F'
            Caption = 'Tributo do Item'
            TabOrder = 6
            ParentColor = False
            Color = clBtnFace
          end
          object UniDBCheckBox7: TUniDBCheckBox
            Left = 128
            Top = 29
            Width = 133
            Height = 17
            Hint = ''
            DataField = 'IMP_DADOSADICIONAIS'
            DataSource = dm_rc.dstbempresas
            ValueChecked = 'T'
            ValueUnchecked = 'F'
            Caption = 'Exibe Dados Adicionais'
            TabOrder = 7
            ParentColor = False
            Color = clBtnFace
          end
          object UniDBCheckBox8: TUniDBCheckBox
            Left = 277
            Top = 29
            Width = 143
            Height = 17
            Hint = ''
            DataField = 'ICMSDESONERADO'
            DataSource = dm_rc.dstbempresas
            ValueChecked = 'T'
            ValueUnchecked = 'F'
            Caption = 'Calcula ICMS Desonerado'
            TabOrder = 8
            ParentColor = False
            Color = clBtnFace
          end
        end
        object rcBlock510: TUniContainerPanel
          Tag = 1
          Left = 3
          Top = 223
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 5
          object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
            Left = 2
            Top = 17
            Width = 145
            Height = 29
            Hint = ''
            DataField = 'IMP_MARGEM_DIREITA'
            DataSource = dm_rc.dstbempresas
            TabOrder = 1
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel33: TUniLabel
            Left = 0
            Top = 0
            Width = 86
            Height = 15
            Hint = ''
            Caption = 'Margem Direita'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock520: TUniContainerPanel
          Tag = 1
          Left = 196
          Top = 223
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 6
          object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
            Left = 2
            Top = 17
            Width = 145
            Height = 29
            Hint = ''
            DataField = 'IMP_MARGEM_ESQUERDA'
            DataSource = dm_rc.dstbempresas
            TabOrder = 1
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel34: TUniLabel
            Left = 0
            Top = 0
            Width = 99
            Height = 15
            Hint = ''
            Caption = 'Margem Esquerda'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock530: TUniContainerPanel
          Tag = 1
          Left = 382
          Top = 223
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 7
          object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
            Left = 2
            Top = 17
            Width = 145
            Height = 29
            Hint = ''
            DataField = 'IMP_MARGEM_INFERIOR'
            DataSource = dm_rc.dstbempresas
            TabOrder = 1
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel35: TUniLabel
            Left = 3
            Top = 0
            Width = 90
            Height = 15
            Hint = ''
            Caption = 'Margem Inferior'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock540: TUniContainerPanel
          Tag = 1
          Left = 562
          Top = 223
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 8
          object UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit
            Left = 2
            Top = 17
            Width = 145
            Height = 29
            Hint = ''
            DataField = 'IMP_MARGEM_SUPERIOR'
            DataSource = dm_rc.dstbempresas
            TabOrder = 1
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel36: TUniLabel
            Left = 3
            Top = 0
            Width = 95
            Height = 15
            Hint = ''
            Caption = 'Margem Superior'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock550: TUniContainerPanel
          Left = 3
          Top = 275
          Width = 709
          Height = 41
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 9
          object btnempgrava: TUniBitBtn
            AlignWithMargins = True
            Left = 37
            Top = 4
            Width = 33
            Height = 32
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
              #13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '<i class="fas fa-save"></i>'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
            LayoutConfig.Padding = '0 2 0 0'
            OnClick = btnempgravaClick
          end
          object btnempinclui: TUniBitBtn
            AlignWithMargins = True
            Left = 3
            Top = 4
            Width = 33
            Height = 32
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
              #13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '<i class="fas fa-pencil-alt"></i>'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 2
            ScaleButton = False
            LayoutConfig.Padding = '0 2 0 0'
            OnClick = btnempincluiClick
          end
        end
      end
    end
    object UniTabSheetcalculaicms: TUniTabSheet
      Hint = ''
      Caption = 'Calcula ICMS Diferenciado'
      object rcBlock555: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alClient
        TabOrder = 0
        object rcBlock560: TUniContainerPanel
          Tag = 1
          Left = 3
          Top = 8
          Width = 190
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            190
            48)
          object UniFormattedNumberpercreducao: TUniFormattedNumberEdit
            Left = 1
            Top = 18
            Width = 186
            Height = 29
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Calibri'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel38: TUniLabel
            AlignWithMargins = True
            Left = 1
            Top = 1
            Width = 80
            Height = 17
            Hint = ''
            Margins.Left = 10
            Margins.Top = 15
            AutoSize = False
            Caption = '% Redu'#231#227'o'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock570: TUniContainerPanel
          Tag = 1
          Left = 196
          Top = 9
          Width = 174
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            174
            48)
          object UniFormattedNumberpercicms: TUniFormattedNumberEdit
            Left = 1
            Top = 17
            Width = 170
            Height = 29
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Calibri'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel39: TUniLabel
            AlignWithMargins = True
            Left = 1
            Top = 0
            Width = 80
            Height = 17
            Hint = ''
            Margins.Left = 10
            Margins.Top = 15
            AutoSize = False
            Caption = '% I.C.M.S.'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock580: TUniContainerPanel
          Tag = 1
          Left = 372
          Top = 9
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 3
          DesignSize = (
            150
            48)
          object UniFormattedNumberBASEICMS: TUniFormattedNumberEdit
            Left = 1
            Top = 17
            Width = 146
            Height = 29
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Calibri'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel40: TUniLabel
            AlignWithMargins = True
            Left = 1
            Top = 0
            Width = 80
            Height = 17
            Hint = ''
            Margins.Left = 10
            Margins.Top = 15
            AutoSize = False
            Caption = 'Base ICMS'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock590: TUniContainerPanel
          Tag = 1
          Left = 526
          Top = 8
          Width = 186
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 4
          DesignSize = (
            186
            48)
          object UniFormattedNumberVALORICMS: TUniFormattedNumberEdit
            Left = 1
            Top = 17
            Width = 182
            Height = 29
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Calibri'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel41: TUniLabel
            AlignWithMargins = True
            Left = 1
            Top = 0
            Width = 80
            Height = 17
            Hint = ''
            Margins.Left = 10
            Margins.Top = 15
            AutoSize = False
            Caption = 'Valor ICMS'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock600: TUniContainerPanel
          Left = 3
          Top = 60
          Width = 709
          Height = 247
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 5
          object UniDBGridprodutos: TUniDBGrid
            Left = 0
            Top = 0
            Width = 709
            Height = 247
            Hint = ''
            DataSource = dm_rc.dsprodutos
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
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
            Columns = <
              item
                FieldName = 'PRODUTO'
                Title.Caption = 'Produtos'
                Width = 80
                Font.Color = clBlack
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'DESCRICAO'
                Title.Caption = 'Descri'#231#227'o do Item'
                Width = 300
                Font.Color = clBlack
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'CST'
                Title.Caption = 'CST'
                Width = 60
                Font.Color = clBlack
                Font.Name = 'Calibri'
                PickList.Strings = (
                  '0101'
                  '0102'
                  '0103'
                  '0202'
                  '0400'
                  '0500'
                  '0900'
                  '010'
                  '020'
                  '030'
                  '040'
                  '050'
                  '060'
                  '070'
                  '080'
                  '090'
                  '')
              end
              item
                FieldName = 'PERCICMS'
                Title.Caption = '% ICMS'
                Width = 74
                Font.Color = clBlack
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'BASEICMS'
                Title.Caption = 'BASE ICMS'
                Width = 74
                Font.Color = clBlack
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'VALORICMS'
                Title.Caption = 'VALOR ICMS'
                Width = 74
                Font.Color = clBlack
                Font.Name = 'Calibri'
              end>
          end
        end
        object rcBlock610: TUniContainerPanel
          Left = 0
          Top = 313
          Width = 715
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          Align = alBottom
          TabOrder = 6
          object UniBitBtn7: TUniBitBtn
            AlignWithMargins = True
            Left = 39
            Top = 8
            Width = 33
            Height = 32
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
              #13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '<i class="fas fa-exchange-alt"></i>'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
            LayoutConfig.Padding = '0 2 0 0'
            OnClick = UniBitBtn7Click
          end
          object UniBitBtn8: TUniBitBtn
            AlignWithMargins = True
            Left = 2
            Top = 8
            Width = 33
            Height = 32
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
              #13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '<i class="fas fa-calculator"></i>'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 2
            ScaleButton = False
            LayoutConfig.Padding = '0 2 0 0'
            OnClick = UniBitBtn8Click
          end
        end
      end
    end
    object UniTabSheetDetalhesempresa: TUniTabSheet
      Hint = ''
      Caption = 'Detalhes'
      object rcBlock625: TUniContainerPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 709
        Height = 355
        Hint = '[[cols:xs-12 sm-12 md-12]]'
        ParentColor = False
        Align = alClient
        TabOrder = 0
        object rcBlock630: TUniContainerPanel
          Tag = 1
          Left = 3
          Top = 6
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 1
          object UniDBComboBox1: TUniDBComboBox
            Left = 3
            Top = 21
            Width = 144
            Hint = ''
            DataField = 'IMP_EXIBIINFOPRODUTO'
            DataSource = dm_rc.dstbempresas
            Style = csDropDownList
            Items.Strings = (
              'Nenhum'
              'Descri'#231#227'o '
              'Separadamente')
            ItemIndex = 0
            TabOrder = 1
            IconItems = <>
          end
          object UniLabel37: TUniLabel
            Left = 3
            Top = 3
            Width = 135
            Height = 15
            Hint = ''
            Caption = 'Exibir Informa'#231#227'o Adc ->'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock640: TUniContainerPanel
          Tag = 1
          Left = 196
          Top = 6
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 2
          object UniDBComboBox2: TUniDBComboBox
            Left = 3
            Top = 21
            Width = 144
            Hint = ''
            DataField = 'TIPO_AMBIENTE'
            DataSource = dm_rc.dstbempresas
            Style = csDropDownList
            Items.Strings = (
              'Homologa'#231#227'o'
              'Produ'#231#227'o')
            TabOrder = 1
            IconItems = <>
          end
          object UniLabel43: TUniLabel
            Left = 3
            Top = 0
            Width = 84
            Height = 15
            Hint = ''
            Caption = 'Ambiente SEFAZ'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock650: TUniContainerPanel
          Tag = 1
          Left = 382
          Top = 6
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 3
          object UniDBComboBox3: TUniDBComboBox
            Left = 3
            Top = 21
            Width = 144
            Hint = ''
            DataField = 'TRABALHOKGSC'
            DataSource = dm_rc.dstbempresas
            Style = csDropDownList
            Items.Strings = (
              'Kilo'
              'Saco')
            TabOrder = 1
            IconItems = <>
          end
          object UniLabel44: TUniLabel
            Left = 3
            Top = 2
            Width = 100
            Height = 15
            Hint = ''
            Caption = 'Modo de Trabalho'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock660: TUniContainerPanel
          Left = 3
          Top = 63
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 4
          DesignSize = (
            150
            48)
          object UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit
            Left = 3
            Top = 16
            Width = 144
            Height = 29
            Hint = ''
            DataField = 'MAXNSU'
            DataSource = dm_rc.dstbempresas
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold, fsItalic]
            TabOrder = 1
            DecimalPrecision = 0
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel45: TUniLabel
            Left = 3
            Top = 0
            Width = 70
            Height = 15
            Hint = ''
            Caption = 'NSU Maximo'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock670: TUniContainerPanel
          Left = 196
          Top = 63
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 5
          DesignSize = (
            150
            48)
          object UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit
            Left = 3
            Top = 16
            Width = 144
            Height = 29
            Hint = ''
            DataField = 'ULTIMONSU'
            DataSource = dm_rc.dstbempresas
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold, fsItalic]
            TabOrder = 1
            DecimalPrecision = 0
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel46: TUniLabel
            Left = 3
            Top = 0
            Width = 61
            Height = 15
            Hint = ''
            Caption = 'NSU Ultimo'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock1240: TUniContainerPanel
          Left = 3
          Top = 118
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 6
          DesignSize = (
            150
            48)
          object UniDBEdit25: TUniDBEdit
            Left = 3
            Top = 16
            Width = 144
            Height = 29
            Hint = ''
            DataField = 'CERTIFICADO_CHAVE'
            DataSource = dm_rc.dstbempresas
            CharCase = ecLowerCase
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object UniLabel104: TUniLabel
            Left = 3
            Top = 0
            Width = 111
            Height = 15
            Hint = ''
            Caption = 'Chave do certificado'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock1250: TUniContainerPanel
          Left = 196
          Top = 118
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 7
          DesignSize = (
            150
            48)
          object UniDBEdit26: TUniDBEdit
            Left = 3
            Top = 16
            Width = 144
            Height = 29
            Hint = ''
            DataField = 'CERTIFICADO_SENHA'
            DataSource = dm_rc.dstbempresas
            CharCase = ecLowerCase
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object UniLabel105: TUniLabel
            Left = 3
            Top = 0
            Width = 111
            Height = 15
            Hint = ''
            Caption = 'Senha do certificado'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock655: TUniContainerPanel
          Tag = 1
          Left = 539
          Top = 5
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 8
          DesignSize = (
            150
            48)
          object UniLabel113: TUniLabel
            Left = 3
            Top = 2
            Width = 56
            Height = 15
            Hint = ''
            Caption = 'Serie Nota'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniDBFormattedNumberEditSERIENOTA: TUniDBFormattedNumberEdit
            Left = 3
            Top = 18
            Width = 144
            Height = 29
            Hint = ''
            DataField = 'SERIE'
            DataSource = dm_rc.dstbempresas
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold, fsItalic]
            TabOrder = 2
            DecimalPrecision = 0
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
        end
        object rcBlock680: TUniContainerPanel
          Tag = 1
          Left = 380
          Top = 61
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 9
          object UniDBComboBoxPRODUTOR: TUniDBComboBox
            Left = 3
            Top = 21
            Width = 144
            Hint = ''
            DataField = 'PRODUTOR'
            DataSource = dm_rc.dstbempresas
            Style = csDropDownList
            Items.Strings = (
              'Retrato'
              'Paisagem')
            TabOrder = 1
            IconItems = <>
          end
          object UniLabel114: TUniLabel
            Left = 3
            Top = 2
            Width = 131
            Height = 15
            Hint = ''
            Caption = 'Modo Impress'#227'o DANFE'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock1255: TUniContainerPanel
          Tag = 1
          Left = 378
          Top = 118
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 10
          object UniDBComboBox4: TUniDBComboBox
            Left = 3
            Top = 21
            Width = 144
            Hint = ''
            DataField = 'ESTILO'
            DataSource = dm_rc.dstbempresas
            Style = csDropDownList
            Items.Strings = (
              'Fortesreport'
              'Fastreport')
            TabOrder = 1
            IconItems = <>
          end
          object UniLabel115: TUniLabel
            Left = 3
            Top = 2
            Width = 123
            Height = 15
            Hint = ''
            Caption = 'Tipo Impress'#227'o DANFE'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
      end
    end
    object UniTabSheetparcelasfinanceiro: TUniTabSheet
      Hint = ''
      Caption = 'Parcela(s)'
      object rcBlock875: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = '[[cols:xs-12 sm-12 md-12]]'
        ParentColor = False
        Align = alClient
        TabOrder = 0
        object rcBlock880: TUniContainerPanel
          Left = 3
          Top = 5
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-6]]'
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            150
            48)
          object UniButtonEditcodbancos: TUniEdit
            AlignWithMargins = True
            Left = 0
            Top = 17
            Width = 116
            Height = 29
            Hint = ''
            Text = '0'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            OnExit = UniButtonEditcodbancosExit
          end
          object btnBusca_UniButtonEditcodbancos: TUniBitBtn
            Left = 118
            Top = 17
            Width = 30
            Height = 29
            Hint = '[[cls:ButtonThemeCrud |ico:fas-search |]]'
            Caption = ''
            Anchors = [akTop, akRight]
            TabOrder = 3
            OnClick = UniButtonEditcodbancosButtonClick
          end
          object UniLabel42: TUniLabel
            AlignWithMargins = True
            Left = 1
            Top = -1
            Width = 34
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Banco'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock890: TUniContainerPanel
          Left = 156
          Top = 5
          Width = 556
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-6]]'
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            556
            48)
          object UniEditdesbancos: TUniEdit
            AlignWithMargins = True
            Left = 3
            Top = 17
            Width = 550
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
          object UniLabel47: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = -1
            Width = 98
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Descri'#231#227'o bancos'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock900: TUniContainerPanel
          Left = 3
          Top = 56
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-6]]'
          ParentColor = False
          TabOrder = 3
          DesignSize = (
            150
            48)
          object UniButtonEditcadplanocontas: TUniEdit
            AlignWithMargins = True
            Left = 0
            Top = 17
            Width = 116
            Height = 29
            Hint = ''
            Text = '0'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            OnExit = UniButtonEditcadplanocontasExit
          end
          object btnBusca_UniButtonEditcadplanocontas: TUniBitBtn
            Left = 118
            Top = 17
            Width = 30
            Height = 29
            Hint = '[[cls:ButtonThemeCrud |ico:fas-search |]]'
            Caption = ''
            Anchors = [akTop, akRight]
            TabOrder = 3
            OnClick = UniButtonEditcadplanocontasButtonClick
          end
          object UniLabel48: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 0
            Width = 73
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Plano Contas'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock910: TUniContainerPanel
          Left = 156
          Top = 56
          Width = 556
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-6]]'
          ParentColor = False
          TabOrder = 4
          DesignSize = (
            556
            48)
          object UniEditdesplanocontas: TUniEdit
            AlignWithMargins = True
            Left = 3
            Top = 17
            Width = 550
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
          object UniLabel49: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 0
            Width = 131
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Descri'#231#227'o Plano Contas'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock920: TUniContainerPanel
          Tag = 1
          Left = 3
          Top = 107
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 5
          DesignSize = (
            150
            48)
          object UniButtonEditcadpessoas: TUniEdit
            AlignWithMargins = True
            Left = 0
            Top = 16
            Width = 116
            Height = 29
            Hint = ''
            Text = '0'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            OnExit = UniButtonEditcadpessoasExit
          end
          object btnBusca_UniButtonEditcadpessoas: TUniBitBtn
            Left = 118
            Top = 16
            Width = 30
            Height = 29
            Hint = '[[cls:ButtonThemeCrud |ico:fas-search |]]'
            Caption = ''
            Anchors = [akTop, akRight]
            TabOrder = 3
            OnClick = UniButtonEditcadpessoasButtonClick
          end
          object UniLabel50: TUniLabel
            AlignWithMargins = True
            Left = 1
            Top = 0
            Width = 39
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Pessoa'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock930: TUniContainerPanel
          Tag = 1
          Left = 156
          Top = 107
          Width = 403
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 6
          DesignSize = (
            403
            48)
          object UniEditdesnomepessoa: TUniEdit
            AlignWithMargins = True
            Left = 3
            Top = 16
            Width = 399
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
          object UniLabel51: TUniLabel
            AlignWithMargins = True
            Left = 2
            Top = 0
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
        object rcBlock940: TUniContainerPanel
          Tag = 1
          Left = 561
          Top = 107
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 7
          DesignSize = (
            150
            48)
          object cbxserie: TUniComboBox
            AlignWithMargins = True
            Left = 3
            Top = 16
            Width = 143
            Height = 29
            Hint = ''
            Margins.Right = 5
            Style = csDropDownList
            Text = 'NFE'
            Items.Strings = (
              'NFE'
              'PED'
              'NOC'
              'CAR'
              'DUP'
              'PAG'
              'REC'
              'CHE'
              'ORC'
              'VAL')
            ItemIndex = 0
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
            IconItems = <>
          end
          object UniLabel52: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 0
            Width = 27
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'S'#233'rie'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock950: TUniContainerPanel
          Tag = 1
          Left = 3
          Top = 158
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 8
          object UniDateemissao: TUniDateTimePicker
            AlignWithMargins = True
            Left = 1
            Top = 17
            Width = 144
            Height = 29
            Hint = ''
            Margins.Right = 5
            DateTime = 43232.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 1
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            ClientEvents.ExtEvents.Strings = (
              
                'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
                '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
                '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
                ':"  /  /   "});'#13#10'}')
          end
          object UniLabel53: TUniLabel
            AlignWithMargins = True
            Left = 1
            Top = 2
            Width = 46
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Emiss'#227'o'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock960: TUniContainerPanel
          Tag = 1
          Left = 156
          Top = 158
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 9
          object UniDateTimevencimento: TUniDateTimePicker
            AlignWithMargins = True
            Left = 3
            Top = 17
            Width = 144
            Height = 29
            Hint = ''
            Margins.Right = 5
            DateTime = 43232.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 1
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            ClientEvents.ExtEvents.Strings = (
              
                'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
                '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
                '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
                ':"  /  /   "});'#13#10'}')
          end
          object UniLabel54: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 2
            Width = 94
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Prox. Vencimento'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock970: TUniContainerPanel
          Tag = 1
          Left = 309
          Top = 158
          Width = 249
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 10
          DesignSize = (
            249
            48)
          object UniFormattedNumberEditvlrtitulos: TUniFormattedNumberEdit
            Left = 3
            Top = 17
            Width = 243
            Height = 29
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Calibri'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel55: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 2
            Width = 91
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Valor da parcela'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock980: TUniContainerPanel
          Tag = 1
          Left = 561
          Top = 158
          Width = 150
          Height = 48
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 11
          DesignSize = (
            150
            48)
          object UniEditnumerodocumento: TUniEdit
            AlignWithMargins = True
            Left = 2
            Top = 17
            Width = 145
            Height = 29
            Hint = ''
            Margins.Right = 5
            CharCase = ecUpperCase
            Alignment = taCenter
            Text = '00000'
            ParentFont = False
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'Calibri'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object UniLabel66: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 2
            Width = 70
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Numero Doc.'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock990: TUniContainerPanel
          Left = 3
          Top = 209
          Width = 709
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 12
          DesignSize = (
            709
            48)
          object UniEditpgtoobs: TUniEdit
            AlignWithMargins = True
            Left = 3
            Top = 15
            Width = 701
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
          end
          object UniLabel67: TUniLabel
            AlignWithMargins = True
            Left = 1
            Top = 0
            Width = 66
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Observa'#231#227'o'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock1000: TUniContainerPanel
          Left = 4
          Top = 259
          Width = 150
          Height = 100
          Hint = '[[cols:xs-12 sm-12 md-6]]'
          ParentColor = False
          TabOrder = 13
          object UniBitBtn9: TUniBitBtn
            AlignWithMargins = True
            Left = 16
            Top = 4
            Width = 33
            Height = 32
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
              #13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Caption = '<i class="fas fa-cog"></i>'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
            ScaleButton = False
            LayoutConfig.Padding = '0 2 0 0'
            OnClick = UniBitBtn9Click
          end
          object UniBitBtn10: TUniBitBtn
            AlignWithMargins = True
            Left = 54
            Top = 4
            Width = 33
            Height = 32
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
              #13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Enabled = False
            Caption = '<i class="fas fa-broom"></i>'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 2
            ScaleButton = False
            LayoutConfig.Padding = '0 2 0 0'
            OnClick = UniBitBtn10Click
          end
          object UniBitBtn12: TUniBitBtn
            AlignWithMargins = True
            Left = 93
            Top = 4
            Width = 33
            Height = 32
            Hint = 
              '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
              #13#10']]'
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Enabled = False
            Caption = '<i class="fas fa-save"></i>'
            ParentFont = False
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 3
            ScaleButton = False
            LayoutConfig.Padding = '0 2 0 0'
            OnClick = UniBitBtn12Click
          end
          object UniNumberEditparcelatitulos: TUniNumberEdit
            Left = 16
            Top = 57
            Width = 110
            Hint = ''
            Alignment = taCenter
            ParentFont = False
            Font.Color = clRed
            TabOrder = 4
            DecimalSeparator = ','
          end
          object UniLabel68: TUniLabel
            AlignWithMargins = True
            Left = 48
            Top = 40
            Width = 48
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Parcelas'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 5
          end
        end
        object rcBlock1010: TUniContainerPanel
          Left = 155
          Top = 259
          Width = 557
          Height = 100
          Hint = '[[cols:xs-12 sm-12 md-6]]'
          ParentColor = False
          TabOrder = 14
          object UniDBGridparcelastitulos: TUniDBGrid
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 551
            Height = 94
            Hint = ''
            DataSource = dm_rc.dstitulos
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.Paged = False
            LoadMask.Message = 'Carregando Titulos'
            ForceFit = True
            Align = alClient
            Font.Color = clBlack
            Font.Height = -13
            ParentFont = False
            TabOrder = 1
            Columns = <
              item
                FieldName = 'PARCELA'
                Title.Caption = 'Parcela'
                Width = 74
                Font.Color = clBlack
              end
              item
                FieldName = 'VENCIMENTO'
                Title.Caption = 'Vencimento'
                Width = 101
                Font.Color = clBlack
              end
              item
                FieldName = 'VALOR'
                Title.Caption = ' Titulos'
                Width = 100
                Font.Color = clBlack
              end
              item
                FieldName = 'exclui'
                Title.Caption = ' '
                Width = 25
                Font.Color = clBlack
                Alignment = taCenter
              end>
          end
        end
      end
    end
    object UniTabSheetreceitalote: TUniTabSheet
      Hint = ''
      Caption = 'Log da Receita do Lote'
      object rcBlock795: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alClient
        TabOrder = 0
        object rcBlock800: TUniContainerPanel
          Left = 2
          Top = 6
          Width = 710
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            710
            48)
          object UniLabel56: TUniLabel
            Left = 4
            Top = 0
            Width = 85
            Height = 15
            Hint = ''
            Caption = 'Log de Inclus'#227'o'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniDBEdit10: TUniDBEdit
            Left = 4
            Top = 17
            Width = 703
            Height = 29
            Hint = ''
            DataField = 'LOGINCLUSAO'
            DataSource = dm_rc.dsbatidamestre
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clBlue
            Font.Style = [fsBold]
            TabOrder = 2
            ReadOnly = True
          end
        end
        object rcBlock810: TUniContainerPanel
          Left = 3
          Top = 59
          Width = 709
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            709
            48)
          object UniLabel57: TUniLabel
            Left = 3
            Top = 1
            Width = 90
            Height = 15
            Hint = ''
            Caption = 'Log de Altera'#231#227'o'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniDBEdit11: TUniDBEdit
            Left = 3
            Top = 17
            Width = 703
            Height = 29
            Hint = ''
            DataField = 'LOGALTERACAO'
            DataSource = dm_rc.dsbatidamestre
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clBlue
            Font.Style = [fsBold]
            TabOrder = 2
            ReadOnly = True
          end
        end
        object rcBlock820: TUniContainerPanel
          Left = 3
          Top = 111
          Width = 709
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 3
          DesignSize = (
            709
            48)
          object UniLabel58: TUniLabel
            Left = 3
            Top = 2
            Width = 90
            Height = 15
            Hint = ''
            Caption = 'Log de Produ'#231#227'o'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniDBEdit13: TUniDBEdit
            Left = 3
            Top = 18
            Width = 703
            Height = 29
            Hint = ''
            DataField = 'LOGPRODUCAO'
            DataSource = dm_rc.dsbatidamestre
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clRed
            Font.Style = [fsBold]
            TabOrder = 2
            ReadOnly = True
          end
        end
      end
    end
    object UniTabSheetlogmanifesto: TUniTabSheet
      Hint = ''
      Caption = 'Log Manifesto Eletr'#244'nico'
      object rcBlock830: TUniContainerPanel
        Left = 0
        Top = 5
        Width = 712
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 0
        DesignSize = (
          712
          48)
        object UniLabel59: TUniLabel
          Left = 2
          Top = 1
          Width = 85
          Height = 15
          Hint = ''
          Caption = 'Log de Inclus'#227'o'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniDBEdit14: TUniDBEdit
          Left = 2
          Top = 18
          Width = 709
          Height = 29
          Hint = ''
          DataField = 'LOGINCLUSAO'
          DataSource = dm_rc.dsmfmestre
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clBlue
          Font.Style = [fsBold]
          TabOrder = 2
          ReadOnly = True
        end
      end
      object rcBlock840: TUniContainerPanel
        Left = 0
        Top = 63
        Width = 712
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          712
          48)
        object UniDBEdit15: TUniDBEdit
          Left = 2
          Top = 18
          Width = 709
          Height = 29
          Hint = ''
          DataField = 'LOGALTERACAO'
          DataSource = dm_rc.dsmfmestre
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clBlue
          Font.Style = [fsBold]
          TabOrder = 1
          ReadOnly = True
        end
        object UniLabel60: TUniLabel
          Left = 2
          Top = 1
          Width = 90
          Height = 15
          Hint = ''
          Caption = 'Log de Altera'#231#227'o'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock850: TUniContainerPanel
        Left = 0
        Top = 117
        Width = 712
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          712
          48)
        object UniLabel61: TUniLabel
          Left = 2
          Top = 2
          Width = 166
          Height = 15
          Hint = ''
          Caption = 'Envio MANIFESTO ELETR'#212'NICO'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniDBEdit16: TUniDBEdit
          Left = 3
          Top = 18
          Width = 709
          Height = 29
          Hint = ''
          DataField = 'LOGENVIO'
          DataSource = dm_rc.dsmfmestre
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clBlue
          Font.Style = [fsBold]
          TabOrder = 2
          ReadOnly = True
        end
      end
      object rcBlock860: TUniContainerPanel
        Left = 2
        Top = 174
        Width = 710
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          710
          48)
        object UniLabel62: TUniLabel
          Left = 0
          Top = 0
          Width = 231
          Height = 15
          Hint = ''
          Caption = 'Cancelamento do MANIFESTO ELETR'#212'NICO'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniDBEdit17: TUniDBEdit
          Left = 1
          Top = 18
          Width = 708
          Height = 29
          Hint = ''
          DataField = 'LOGCANCELA'
          DataSource = dm_rc.dsmfmestre
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clRed
          Font.Style = [fsBold]
          TabOrder = 2
          ReadOnly = True
        end
      end
      object rcBlock870: TUniContainerPanel
        Left = 3
        Top = 230
        Width = 709
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          709
          48)
        object UniDBEdit18: TUniDBEdit
          Left = 1
          Top = 18
          Width = 708
          Height = 29
          Hint = ''
          DataField = 'LOGENCERRA'
          DataSource = dm_rc.dsmfmestre
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clBlack
          Font.Style = [fsBold]
          TabOrder = 1
          ReadOnly = True
        end
        object UniLabel63: TUniLabel
          Left = 0
          Top = 0
          Width = 229
          Height = 15
          Hint = ''
          Caption = 'Encerramento do MANIFESTO ELETR'#212'NICO'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
    end
    object UniTabSheettitulosnota: TUniTabSheet
      Hint = ''
      Caption = 'Financeiro NOTA'
      object rcBlock08: TUniContainerPanel
        Left = 0
        Top = 296
        Width = 715
        Height = 65
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alBottom
        TabOrder = 0
        DesignSize = (
          715
          65)
        object UniBitBtn11: TUniBitBtn
          AlignWithMargins = True
          Left = 3
          Top = 9
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
            #13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '<i class="fas fa-check-double"></i>'
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = UniBitBtn11Click
        end
        object UniLabel64: TUniLabel
          AlignWithMargins = True
          Left = 591
          Top = 4
          Width = 113
          Height = 15
          Hint = ''
          Margins.Top = 1
          Margins.Bottom = 2
          Caption = 'Total das Duplicatas'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
        object UniFormattedNumberEditTOTALNOTA: TUniFormattedNumberEdit
          Left = 591
          Top = 23
          Width = 122
          Height = 29
          Hint = ''
          Alignment = taRightJustify
          ParentFont = False
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          ReadOnly = True
          DecimalSeparator = ','
          ThousandSeparator = '.'
        end
        object UniLabel65: TUniLabel
          AlignWithMargins = True
          Left = 457
          Top = 4
          Width = 86
          Height = 15
          Hint = ''
          Margins.Top = 1
          Margins.Bottom = 2
          Caption = 'Total Calculado'
          ParentFont = False
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 4
        end
        object UniFormattedNumberEdittotalcalculado: TUniFormattedNumberEdit
          Left = 457
          Top = 23
          Width = 122
          Height = 29
          Hint = ''
          Alignment = taRightJustify
          ParentFont = False
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
          ReadOnly = True
          DecimalSeparator = ','
          ThousandSeparator = '.'
        end
      end
      object rcBlock06: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 296
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alClient
        TabOrder = 1
        object UniDBGridtitulosnota: TUniDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 709
          Height = 290
          Hint = ''
          DataSource = dm_rc.dstitulos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
          WebOptions.Paged = False
          LoadMask.Message = 'Carregando Titulos'
          ForceFit = True
          Align = alClient
          Font.Color = clBlack
          Font.Height = -13
          ParentFont = False
          TabOrder = 1
          OnCellClick = UniDBGridtitulosCellClick
          Columns = <
            item
              FieldName = 'PARCELA'
              Title.Caption = 'Parcela'
              Width = 74
              Font.Color = clBlack
            end
            item
              FieldName = 'VENCIMENTO'
              Title.Caption = 'Vencimento'
              Width = 101
              Font.Color = clBlack
            end
            item
              FieldName = 'VALOR'
              Title.Caption = ' Titulos'
              Width = 100
              Font.Color = clBlack
            end
            item
              FieldName = 'exclui'
              Title.Caption = ' '
              Width = 25
              Font.Color = clBlack
              Alignment = taCenter
            end>
        end
      end
    end
    object UniTabSheetlogtitulos: TUniTabSheet
      Hint = ''
      Caption = 'Log Financeiro'
      object rcBlock780: TUniContainerPanel
        Left = 6
        Top = 6
        Width = 709
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 0
        DesignSize = (
          709
          48)
        object UniDBEdit19: TUniDBEdit
          Left = 3
          Top = 17
          Width = 703
          Height = 29
          Hint = ''
          DataField = 'LOGINCLUSAO'
          DataSource = dm_rc.dsfdqrytitulos
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clBlue
          Font.Style = [fsBold]
          TabOrder = 1
          ReadOnly = True
        end
        object UniLabel69: TUniLabel
          Left = 3
          Top = 1
          Width = 85
          Height = 15
          Hint = ''
          Caption = 'Log de Inclus'#227'o'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock790: TUniContainerPanel
        Left = 6
        Top = 59
        Width = 709
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          709
          48)
        object UniDBEdit20: TUniDBEdit
          Left = 3
          Top = 17
          Width = 703
          Height = 29
          Hint = ''
          DataField = 'LOGALTERACAO'
          DataSource = dm_rc.dsfdqrytitulos
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clBlue
          Font.Style = [fsBold]
          TabOrder = 1
          ReadOnly = True
        end
        object UniLabel70: TUniLabel
          Left = 3
          Top = 1
          Width = 90
          Height = 15
          Hint = ''
          Caption = 'Log de Altera'#231#227'o'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock1500: TUniContainerPanel
        Left = 6
        Top = 111
        Width = 709
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          709
          48)
        object UniDBEdit21: TUniDBEdit
          Left = 3
          Top = 16
          Width = 703
          Height = 29
          Hint = ''
          DataField = 'LOGBAIXA'
          DataSource = dm_rc.dsfdqrytitulos
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clBlue
          Font.Style = [fsBold]
          TabOrder = 1
          ReadOnly = True
        end
        object UniLabel71: TUniLabel
          Left = 3
          Top = 1
          Width = 61
          Height = 15
          Hint = ''
          Caption = 'Log Parcial'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock1510: TUniContainerPanel
        Left = 6
        Top = 162
        Width = 709
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          709
          48)
        object UniDBEdit22: TUniDBEdit
          Left = 3
          Top = 16
          Width = 703
          Height = 29
          Hint = ''
          DataField = 'LOGPARCIAL'
          DataSource = dm_rc.dsfdqrytitulos
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clRed
          Font.Style = [fsBold]
          TabOrder = 1
          ReadOnly = True
        end
        object UniLabel72: TUniLabel
          Left = 3
          Top = 1
          Width = 52
          Height = 15
          Hint = ''
          Caption = 'Log Baixa'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
    end
    object UniTabSheetloglancamentobancario: TUniTabSheet
      Hint = ''
      Caption = 'Log Banc'#225'rio'
      object rcBlock1520: TUniContainerPanel
        Left = 6
        Top = 14
        Width = 709
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 0
        DesignSize = (
          709
          48)
        object UniDBEdit23: TUniDBEdit
          Left = 3
          Top = 17
          Width = 703
          Height = 29
          Hint = ''
          DataField = 'LOGINCLUSAO'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clBlue
          Font.Style = [fsBold]
          TabOrder = 1
          ReadOnly = True
        end
        object UniLabel73: TUniLabel
          Left = 3
          Top = 1
          Width = 85
          Height = 15
          Hint = ''
          Caption = 'Log de Inclus'#227'o'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock1530: TUniContainerPanel
        Left = 6
        Top = 67
        Width = 709
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          709
          48)
        object UniDBEdit24: TUniDBEdit
          Left = 3
          Top = 17
          Width = 703
          Height = 29
          Hint = ''
          DataField = 'LOGALTERACAO'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clBlue
          Font.Style = [fsBold]
          TabOrder = 1
          ReadOnly = True
        end
        object UniLabel74: TUniLabel
          Left = 3
          Top = 1
          Width = 90
          Height = 15
          Hint = ''
          Caption = 'Log de Altera'#231#227'o'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
    end
    object UniTabSheetexiberastreio: TUniTabSheet
      Hint = ''
      Caption = 'Exibe Dados'
      object UniContainerPanel15: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 0
        object UniDBVerticalGrid1: TUniDBVerticalGrid
          Left = 0
          Top = 0
          Width = 715
          Height = 361
          Hint = ''
          DataSource = dm_rc.dsfdqrymvitens
          VerticalColumns = <
            item
            end>
          Align = alClient
          TabOrder = 1
          LoadMask.Message = 'Loading data...'
          Columns = <
            item
              FieldName = 'KEY'
              Title.Caption = 'KEY'
              Width = 64
            end
            item
              FieldName = 'NUMERO'
              Title.Caption = 'NUMERO'
              Width = 64
            end
            item
              FieldName = 'SERIE'
              Title.Caption = 'SERIE'
              Width = 64
            end>
        end
      end
    end
    object UniTabSheetpermusuario: TUniTabSheet
      Hint = ''
      Caption = 'Permiss'#227'o Usu'#225'rio'
      object rcBlock1550: TUniContainerPanel
        Left = 0
        Top = 5
        Width = 147
        Height = 89
        Hint = '[[cols:xs-12 sm-12 md-6]]'
        ParentColor = False
        TabOrder = 0
        object btnaltera: TUniBitBtn
          AlignWithMargins = True
          Left = 29
          Top = 8
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
            #13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Enabled = False
          Caption = '<i class="fas fa-pencil-alt"></i>'
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnalteraClick
        end
        object btngrava: TUniBitBtn
          AlignWithMargins = True
          Left = 70
          Top = 8
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
            #13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Enabled = False
          Caption = '<i class="fas fa-save"></i>'
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 2
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btngravaClick
        end
        object btnpermitetudo: TUniBitBtn
          AlignWithMargins = True
          Left = 29
          Top = 54
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
            #13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Enabled = False
          Caption = '<i class="fas fa-check-double"></i>'
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 3
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnpermitetudoClick
        end
        object btndesmarcatudo: TUniBitBtn
          AlignWithMargins = True
          Left = 70
          Top = 54
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
            #13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Enabled = False
          Caption = '<i class="fas fa-history"></i>'
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 4
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btndesmarcatudoClick
        end
      end
      object rcBlock1570: TUniContainerPanel
        Left = 150
        Top = 4
        Width = 562
        Height = 90
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          562
          90)
        object btneditempresa: TUniEdit
          Left = 3
          Top = 16
          Width = 86
          Height = 29
          Hint = ''
          Text = ''
          ParentFont = False
          Font.Height = -16
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ReadOnly = True
        end
        object btnBusca_btneditempresa: TUniBitBtn
          Left = 91
          Top = 16
          Width = 30
          Height = 29
          Hint = '[[cls:ButtonThemeCrud |ico:fas-search |]]'
          Caption = ''
          Anchors = [akTop, akRight]
          TabOrder = 7
          OnClick = btneditempresaButtonClick
        end
        object UniLabel76: TUniLabel
          Left = 3
          Top = 1
          Width = 47
          Height = 15
          Hint = ''
          Caption = 'Empresa'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
        object btneditcopiafun: TUniEdit
          Left = 127
          Top = 16
          Width = 87
          Height = 29
          Hint = ''
          Text = '0'
          ParentFont = False
          Font.Height = -16
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          Color = clInfoBk
        end
        object btnBusca_btneditcopiafun: TUniBitBtn
          Left = 216
          Top = 16
          Width = 30
          Height = 29
          Hint = '[[cls:ButtonThemeCrud |ico:fas-search |]]'
          Caption = ''
          Anchors = [akTop, akRight]
          TabOrder = 8
          OnClick = btneditcopiafunButtonClick
        end
        object UniLabel77: TUniLabel
          Left = 127
          Top = 1
          Width = 106
          Height = 15
          Hint = ''
          Caption = 'Copiar acesso de ...'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 4
        end
        object btncopia: TUniBitBtn
          AlignWithMargins = True
          Left = 249
          Top = 13
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
            #13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Enabled = False
          Caption = '<i class="fas fa-copy"></i>'
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 5
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btncopiaClick
        end
        object editnomeusuario: TUniEdit
          AlignWithMargins = True
          Left = 3
          Top = 55
          Width = 558
          Height = 29
          Hint = ''
          Margins.Right = 5
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 6
          ReadOnly = True
          ClearButton = True
        end
      end
      object rcBlock1030: TUniContainerPanel
        Left = 0
        Top = 100
        Width = 712
        Height = 245
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 2
        object UniDBTreeGridpermissao: TUniDBTreeGrid
          Left = 0
          Top = 0
          Width = 712
          Height = 245
          Hint = ''
          DataSource = dm_rc.dspermissaousuario
          HeaderTitleAlign = taCenter
          Align = alClient
          TabOrder = 1
          LoadMask.Message = 'Loading data...'
          ForceFit = True
          IdParentField = 'ID_MENU'
          IdField = 'REGISTRO'
          Columns = <
            item
              FieldName = 'MENU'
              Title.Alignment = taCenter
              Title.Caption = 'Descri'#231#227'o'
              Width = 150
              Color = 15790320
              ReadOnly = True
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'ACESSAR'
              Title.Caption = 'Visualizar'
              Width = 50
              Alignment = taCenter
            end
            item
              FieldName = 'INCLUIR'
              Title.Caption = 'Incluir'
              Width = 50
              Alignment = taCenter
            end
            item
              FieldName = 'ALTERAR'
              Title.Caption = 'Alterar'
              Width = 50
              Alignment = taCenter
            end
            item
              FieldName = 'EXCLUIR'
              Title.Caption = 'Excluir'
              Width = 50
              Alignment = taCenter
            end>
        end
      end
    end
    object UniTabSheetcapturaXML: TUniTabSheet
      Hint = ''
      Caption = 'Importar txt XML'
      object rcBlock1580: TUniContainerPanel
        Left = 0
        Top = 5
        Width = 150
        Height = 45
        Hint = '[[cols:xs-12 sm-12 md-6]]'
        ParentColor = False
        TabOrder = 0
        object UniBitBtn13: TUniBitBtn
          AlignWithMargins = True
          Left = 16
          Top = 4
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
            #13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '<i class="fas fa-cog"></i>'
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = UniBitBtn13Click
        end
        object UniBitBtn14: TUniBitBtn
          AlignWithMargins = True
          Left = 54
          Top = 4
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
            #13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Enabled = False
          Caption = '<i class="fas fa-broom"></i>'
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 2
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = UniBitBtn14Click
        end
        object UniBitBtn15: TUniBitBtn
          AlignWithMargins = True
          Left = 96
          Top = 4
          Width = 33
          Height = 32
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
            #13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Enabled = False
          Caption = '<i class="fas fa-exchange-alt"></i>'
          ParentFont = False
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 3
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = UniBitBtn15Click
        end
      end
      object rcBlock1600: TUniContainerPanel
        Left = 0
        Top = 52
        Width = 712
        Height = 293
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 1
        object UniLabel75: TUniLabel
          Left = 5
          Top = 7
          Width = 107
          Height = 15
          Hint = ''
          Caption = 'Informa'#231#227'o do XML'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniMemodadosxml: TUniMemo
          Left = 6
          Top = 27
          Width = 703
          Height = 256
          Hint = ''
          Color = clInfoBk
          TabOrder = 2
        end
      end
    end
    object UniTabSheetdadosxmlentrada: TUniTabSheet
      Hint = ''
      Caption = 'Dados txt XML'
      object rcBlock1050: TUniContainerPanel
        Tag = 1
        Left = 3
        Top = 5
        Width = 181
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-3]]'
        ParentColor = False
        TabOrder = 0
        DesignSize = (
          181
          48)
        object UniFormattedNumberEditvlrbaseicms: TUniFormattedNumberEdit
          Left = 2
          Top = 16
          Width = 175
          Height = 29
          Hint = ''
          Alignment = taRightJustify
          ParentFont = False
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ReadOnly = True
          DecimalSeparator = ','
          ThousandSeparator = '.'
        end
        object UniLabel78: TUniLabel
          Left = 3
          Top = 1
          Width = 76
          Height = 15
          Hint = ''
          Caption = 'Vlr Base ICMS'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock1060: TUniContainerPanel
        Tag = 1
        Left = 186
        Top = 6
        Width = 184
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-3]]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          184
          48)
        object UniFormattedNumberEditvlricms: TUniFormattedNumberEdit
          Left = 3
          Top = 15
          Width = 178
          Height = 29
          Hint = ''
          Alignment = taRightJustify
          ParentFont = False
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ReadOnly = True
          DecimalSeparator = ','
          ThousandSeparator = '.'
        end
        object UniLabel79: TUniLabel
          Left = 3
          Top = 0
          Width = 50
          Height = 15
          Hint = ''
          Caption = 'Vlr  ICMS'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock1070: TUniContainerPanel
        Tag = 1
        Left = 372
        Top = 5
        Width = 176
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-3]]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          176
          48)
        object UniFormattedNumberEditvlrprodutos: TUniFormattedNumberEdit
          Left = 1
          Top = 16
          Width = 175
          Height = 29
          Hint = ''
          Alignment = taRightJustify
          ParentFont = False
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ReadOnly = True
          DecimalSeparator = ','
          ThousandSeparator = '.'
        end
        object UniLabel80: TUniLabel
          Left = 1
          Top = 0
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
      object rcBlock1080: TUniContainerPanel
        Tag = 1
        Left = 552
        Top = 5
        Width = 160
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-3]]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          160
          48)
        object UniFormattedNumberEditvlrtotal: TUniFormattedNumberEdit
          Left = 2
          Top = 16
          Width = 155
          Height = 29
          Hint = ''
          Alignment = taRightJustify
          ParentFont = False
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ReadOnly = True
          DecimalSeparator = ','
          ThousandSeparator = '.'
        end
        object UniLabel81: TUniLabel
          Left = 1
          Top = 0
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
      object rcBlock1090: TUniContainerPanel
        Tag = 1
        Left = 3
        Top = 58
        Width = 127
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-3]]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          127
          48)
        object UniEditxmlpessoa: TUniEdit
          Left = 3
          Top = 16
          Width = 120
          Height = 29
          Hint = ''
          Margins.Right = 5
          CharCase = ecUpperCase
          Alignment = taRightJustify
          Text = ''
          ParentFont = False
          Font.Color = clBlue
          Font.Height = -13
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ReadOnly = True
        end
        object UniLabel82: TUniLabel
          Left = 3
          Top = 1
          Width = 39
          Height = 15
          Hint = ''
          Caption = 'Pessoa'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock1100: TUniContainerPanel
        Tag = 1
        Left = 133
        Top = 58
        Width = 260
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-3]]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          260
          48)
        object UniEditxmlnomepessoa: TUniEdit
          Left = 3
          Top = 16
          Width = 256
          Height = 29
          Hint = ''
          Margins.Right = 5
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -13
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ReadOnly = True
        end
        object UniLabel83: TUniLabel
          Left = 3
          Top = 1
          Width = 90
          Height = 15
          Hint = ''
          Caption = 'Nome da Pessoa'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock1110: TUniContainerPanel
        Tag = 1
        Left = 396
        Top = 58
        Width = 204
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-3]]'
        ParentColor = False
        TabOrder = 6
        DesignSize = (
          204
          48)
        object UniEditxmlcidadepessoa: TUniEdit
          Left = 1
          Top = 16
          Width = 201
          Height = 29
          Hint = ''
          Margins.Right = 5
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -13
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ReadOnly = True
        end
        object UniLabel84: TUniLabel
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
      object rcBlock1120: TUniContainerPanel
        Tag = 1
        Left = 602
        Top = 58
        Width = 110
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-3]]'
        ParentColor = False
        TabOrder = 7
        DesignSize = (
          110
          48)
        object UniEditxmlufpessoa: TUniEdit
          Left = 2
          Top = 16
          Width = 105
          Height = 29
          Hint = ''
          Margins.Right = 5
          CharCase = ecUpperCase
          Alignment = taCenter
          Text = ''
          ParentFont = False
          Font.Height = -13
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ReadOnly = True
        end
        object UniLabel85: TUniLabel
          Left = 2
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
      object rcBlock1130: TUniContainerPanel
        Left = 3
        Top = 166
        Width = 709
        Height = 176
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 8
        object UniDBGridDADOSXML: TUniDBGrid
          Left = 0
          Top = 0
          Width = 709
          Height = 176
          Hint = ''
          DataSource = dm_rc.dsprodutos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
          WebOptions.Paged = False
          LoadMask.Message = 'Carregando Item(s)...'
          Align = alClient
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          ParentFont = False
          TabOrder = 1
          Summary.Enabled = True
          OnCellClick = UniDBGridDADOSXMLCellClick
          Columns = <
            item
              FieldName = 'buscaproduto'
              Title.Caption = ' '
              Width = 30
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Alignment = taCenter
            end
            item
              FieldName = 'PRODUTO'
              Title.Caption = 'Produtos'
              Width = 80
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'UNIDADE'
              Title.Caption = 'UN'
              Width = 50
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o do Item'
              Width = 300
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'CST'
              Title.Caption = 'CST'
              Width = 60
              Font.Color = clBlack
              Font.Name = 'Calibri'
              PickList.Strings = (
                '0101'
                '0102'
                '0103'
                '0202'
                '0400'
                '0500'
                '0900'
                '010'
                '020'
                '030'
                '040'
                '050'
                '060'
                '070'
                '080'
                '090'
                '')
            end
            item
              FieldName = 'PERCICMS'
              Title.Caption = '% ICMS'
              Width = 100
              Font.Color = clBlack
              Font.Name = 'Calibri'
              ReadOnly = True
            end
            item
              FieldName = 'BASEICMS'
              Title.Caption = 'BASE ICMS'
              Width = 100
              Font.Color = clBlack
              Font.Name = 'Calibri'
              ReadOnly = True
            end
            item
              FieldName = 'VALORICMS'
              Title.Caption = 'VALOR ICMS'
              Width = 100
              Font.Color = clBlack
              Font.Name = 'Calibri'
              ReadOnly = True
            end
            item
              FieldName = 'PIS'
              Title.Caption = 'PIS'
              Width = 60
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'COFINS'
              Title.Caption = 'COFINS'
              Width = 60
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'TOTAL'
              Title.Caption = 'TOTAL'
              Width = 74
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end>
        end
      end
      object rcBlock1140: TUniContainerPanel
        Tag = 1
        Left = 3
        Top = 111
        Width = 124
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 9
        DesignSize = (
          124
          48)
        object UniEditxmlnumeronota: TUniEdit
          Left = 3
          Top = 17
          Width = 118
          Height = 29
          Hint = ''
          Margins.Right = 5
          CharCase = ecUpperCase
          Alignment = taRightJustify
          Text = ''
          ParentFont = False
          Font.Color = clRed
          Font.Height = -13
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ReadOnly = True
        end
        object UniLabel86: TUniLabel
          Left = 3
          Top = 1
          Width = 72
          Height = 15
          Hint = ''
          Caption = 'Numero Nota'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock1150: TUniContainerPanel
        Tag = 1
        Left = 133
        Top = 111
        Width = 260
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 10
        object UniDateTimePickerxmlemissao: TUniDateTimePicker
          AlignWithMargins = True
          Left = 3
          Top = 16
          Width = 255
          Height = 29
          Hint = ''
          Margins.Right = 5
          DateTime = 43232.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          ReadOnly = True
          TabOrder = 1
          ParentFont = False
          Font.Height = -13
          ClientEvents.ExtEvents.Strings = (
            
              'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
              '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
              '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
              ':"  /  /   "});'#13#10'}')
        end
        object UniLabel87: TUniLabel
          Left = 3
          Top = 1
          Width = 92
          Height = 15
          Hint = ''
          Caption = 'Emiss'#227'o da Nota'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock1160: TUniContainerPanel
        Tag = 1
        Left = 396
        Top = 111
        Width = 315
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 11
        DesignSize = (
          315
          48)
        object UniEditxmlchaveacesso: TUniEdit
          Left = 3
          Top = 16
          Width = 310
          Height = 29
          Hint = ''
          Margins.Right = 5
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -13
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ReadOnly = True
        end
        object UniLabel88: TUniLabel
          Left = 3
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
    end
    object UniTabSheetfinanceiroxml: TUniTabSheet
      Hint = ''
      Caption = 'Financeiro txt XML'
      object rcBlock1170: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alClient
        TabOrder = 0
        object UniDBGrid5: TUniDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 709
          Height = 355
          Hint = ''
          DataSource = dm_rc.dstitulos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
          WebOptions.Paged = False
          LoadMask.Message = 'Carregando Titulos'
          ForceFit = True
          Align = alClient
          Font.Color = clBlack
          Font.Height = -13
          ParentFont = False
          TabOrder = 1
          OnCellClick = UniDBGrid5CellClick
          Columns = <
            item
              FieldName = 'PARCELA'
              Title.Caption = 'Parcela'
              Width = 74
              Font.Color = clBlack
            end
            item
              FieldName = 'VENCIMENTO'
              Title.Caption = 'Vencimento'
              Width = 101
              Font.Color = clBlack
            end
            item
              FieldName = 'VALOR'
              Title.Caption = ' Titulos'
              Width = 100
              Font.Color = clBlack
            end
            item
              FieldName = 'exclui'
              Title.Caption = ' '
              Width = 25
              Font.Color = clBlack
              Alignment = taCenter
            end>
        end
      end
    end
    object UniTabSheetentradasemente: TUniTabSheet
      Hint = ''
      Caption = 'Entrada Semente'
      object rcBlock1180: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alClient
        TabOrder = 0
        object rcBlock1700: TUniContainerPanel
          Tag = 1
          Left = 3
          Top = 3
          Width = 144
          Height = 58
          Hint = '[[cols:xs-12 sm-12 md-2]]'
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            144
            58)
          object UniLabel90: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 4
            Width = 80
            Height = 17
            Hint = ''
            Margins.Left = 10
            Margins.Top = 15
            AutoSize = False
            Caption = 'Cooperante'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniButtonEditcooperante: TUniEdit
            Left = 3
            Top = 23
            Width = 107
            Height = 29
            Hint = ''
            Text = ''
            ParentFont = False
            Font.Height = -16
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
          object btnBusca_UniButtonEditcooperante: TUniBitBtn
            Left = 112
            Top = 23
            Width = 30
            Height = 29
            Hint = '[[cls:ButtonThemeCrud |ico:fas-search |]]'
            Caption = ''
            Anchors = [akTop, akRight]
            TabOrder = 3
            OnClick = UniButtonEditcooperanteButtonClick
          end
        end
        object rcBlock1710: TUniContainerPanel
          Tag = 1
          Left = 149
          Top = 3
          Width = 276
          Height = 58
          Hint = '[[cols:xs-12 sm-12 md-5]]'
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            276
            58)
          object UniLabel91: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 6
            Width = 80
            Height = 17
            Hint = ''
            Margins.Left = 10
            Margins.Top = 15
            AutoSize = False
            Caption = 'Safra Campo'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniEditsafracampocooperante: TUniEdit
            Left = 3
            Top = 23
            Width = 271
            Height = 29
            Hint = ''
            Margins.Right = 5
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            Font.Height = -16
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
        end
        object rcBlock1720: TUniContainerPanel
          Tag = 1
          Left = 427
          Top = 3
          Width = 285
          Height = 58
          Hint = '[[cols:xs-12 sm-12 md-5]]'
          ParentColor = False
          TabOrder = 3
          DesignSize = (
            285
            58)
          object UniLabel92: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 6
            Width = 80
            Height = 17
            Hint = ''
            Margins.Left = 10
            Margins.Top = 15
            AutoSize = False
            Caption = 'Campo'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniEditcampocooperante: TUniEdit
            Left = 3
            Top = 23
            Width = 280
            Height = 29
            Hint = ''
            Margins.Right = 5
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            Font.Height = -16
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
        end
        object rcBlock1730: TUniContainerPanel
          Tag = 1
          Left = 3
          Top = 63
          Width = 254
          Height = 58
          Hint = '[[cols:xs-12 sm-12 md-4]]'
          ParentColor = False
          TabOrder = 4
          DesignSize = (
            254
            58)
          object UniLabel93: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 5
            Width = 147
            Height = 17
            Hint = ''
            Margins.Left = 10
            Margins.Top = 15
            AutoSize = False
            Caption = 'Lote de Entrada - (NOTA)'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniEditloteentrada: TUniEdit
            Left = 3
            Top = 24
            Width = 249
            Height = 29
            Hint = ''
            Margins.Right = 5
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            Font.Height = -16
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
        end
        object rcBlock1740: TUniContainerPanel
          Tag = 1
          Left = 259
          Top = 63
          Width = 150
          Height = 58
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 5
          DesignSize = (
            150
            58)
          object UniLabel89: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 4
            Width = 80
            Height = 17
            Hint = ''
            Margins.Left = 10
            Margins.Top = 15
            AutoSize = False
            Caption = 'PUREZA %'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniFormattedNumberEditpurezaentrada: TUniFormattedNumberEdit
            Left = 3
            Top = 24
            Width = 143
            Height = 29
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            Font.Height = -16
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
        end
        object rcBlock1760: TUniContainerPanel
          Tag = 1
          Left = 562
          Top = 63
          Width = 150
          Height = 58
          Hint = '[[cols:xs-12 sm-12 md-2]]'
          ParentColor = False
          TabOrder = 7
          DesignSize = (
            150
            58)
          object UniLabel94: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 4
            Width = 102
            Height = 17
            Hint = ''
            Margins.Left = 10
            Margins.Top = 15
            AutoSize = False
            Caption = 'GERMINA'#199#195'O %'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniFormattedNumberEditgerminacaoentrada: TUniFormattedNumberEdit
            Left = 3
            Top = 23
            Width = 145
            Height = 29
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            Font.Height = -16
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
        end
        object rcBlock1750: TUniContainerPanel
          Tag = 1
          Left = 411
          Top = 63
          Width = 150
          Height = 58
          Hint = '[[cols:xs-12 sm-12 md-3]]'
          ParentColor = False
          TabOrder = 6
          DesignSize = (
            150
            58)
          object UniLabel95: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 4
            Width = 80
            Height = 17
            Hint = ''
            Margins.Left = 10
            Margins.Top = 15
            AutoSize = False
            Caption = 'V.C. %'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniFormattedNumberEditvcentrada: TUniFormattedNumberEdit
            Left = 3
            Top = 24
            Width = 143
            Height = 29
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            Font.Height = -16
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
        end
        object btnentradatransf: TUniBitBtn
          Left = 621
          Top = 124
          Width = 95
          Height = 29
          Hint = '[[cls:ButtonThemeCrud]]'
          Margins.Top = 28
          Margins.Bottom = 12
          Caption = '<i class="fas fa-exchange-alt"> Transferir</i>'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 8
          OnClick = btnentradatransfClick
        end
      end
    end
    object UniTabSheettermonota: TUniTabSheet
      Hint = ''
      Caption = 'Termo de Conformidade'
      object rcBlock1190: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alClient
        TabOrder = 0
        object UniDBGrid6: TUniDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 709
          Height = 355
          Hint = ''
          DataSource = dm_rc.dstermonota
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
          WebOptions.Paged = False
          LoadMask.Message = 'Carregando Titulos'
          ForceFit = True
          Align = alClient
          Font.Color = clBlack
          Font.Height = -13
          ParentFont = False
          TabOrder = 1
          OnCellClick = UniDBGrid6CellClick
          Columns = <
            item
              FieldName = 'PRODUTO'
              Title.Caption = 'PRODUTO'
              Width = 70
              Font.Color = clBlack
            end
            item
              FieldName = 'DESCRICAO_NOTA'
              Title.Caption = 'DESCRI'#199#195'O NOTA'
              Width = 200
              Font.Color = clBlack
            end
            item
              FieldName = 'LOTE'
              Title.Caption = 'LOTE'
              Width = 100
              Font.Color = clBlack
            end
            item
              FieldName = 'BOLETIM'
              Title.Caption = 'BOLETIM'
              Width = 100
              Font.Color = clBlack
            end
            item
              FieldName = 'TERMO'
              Title.Caption = 'TERMO'
              Width = 100
              Font.Color = clBlack
            end
            item
              FieldName = 'COMUM'
              Title.Caption = ' '
              Width = 30
              Font.Color = clBlack
              Alignment = taCenter
            end
            item
              FieldName = 'ASSINADA'
              Title.Caption = ' '
              Width = 30
              Font.Color = clBlack
              Alignment = taCenter
            end>
        end
      end
    end
    object UniTabSheetKARDEXPRODUTO: TUniTabSheet
      Hint = ''
      Caption = 'Kardex Produto'
      object rcBlock1200: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alTop
        TabOrder = 0
        object UniLabel96: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 1
          Width = 46
          Height = 15
          Hint = ''
          Margins.Top = 1
          Margins.Bottom = 2
          Caption = 'Emiss'#227'o'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniLabel97: TUniLabel
          AlignWithMargins = True
          Left = 151
          Top = 1
          Width = 17
          Height = 15
          Hint = ''
          Margins.Top = 1
          Margins.Bottom = 2
          Caption = 'at'#233
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
        object UniBitBtnbuscakardexproduto: TUniBitBtn
          Left = 300
          Top = 18
          Width = 66
          Height = 29
          Hint = '[[cls:ButtonThemeCrud]]'
          Margins.Top = 28
          Margins.Bottom = 12
          Caption = '<i class="fas fa-search"></i>'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 3
          OnClick = UniBitBtnbuscakardexprodutoClick
        end
        object UniDateTimePickerkarproini: TUniDateTimePicker
          AlignWithMargins = True
          Left = 4
          Top = 17
          Width = 141
          Height = 29
          Hint = ''
          Margins.Right = 5
          DateTime = 43232.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 4
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          ClientEvents.ExtEvents.Strings = (
            
              'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
              '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
              '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
              ':"  /  /   "});'#13#10'}')
        end
        object UniDateTimePickerkarprofin: TUniDateTimePicker
          AlignWithMargins = True
          Left = 151
          Top = 17
          Width = 141
          Height = 29
          Hint = ''
          Margins.Right = 5
          DateTime = 43232.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 5
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
      object rcBlock1210: TUniContainerPanel
        Left = 0
        Top = 48
        Width = 715
        Height = 313
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alClient
        TabOrder = 1
        object UniDBGrid7: TUniDBGrid
          Left = 0
          Top = 0
          Width = 715
          Height = 313
          Hint = ''
          DataSource = dm_rc.dsmemkardexkproduto
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
          WebOptions.PageSize = 50
          LoadMask.Message = 'Carregando Item(s)...'
          ForceFit = True
          Align = alClient
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          ParentFont = False
          TabOrder = 1
          Summary.Enabled = True
          Columns = <
            item
              FieldName = 'OPERACAO_OP'
              Title.Caption = 'TIPO'
              Width = 80
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Alignment = taCenter
            end
            item
              FieldName = 'NUMERO'
              Title.Caption = 'NUMERO'
              Width = 74
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'SERIE'
              Title.Caption = 'SERIE'
              Width = 39
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'EMISSAO'
              Title.Caption = 'EMISS'#195'O'
              Width = 80
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'PESSOA'
              Title.Caption = 'PESSOA'
              Width = 70
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'NOME'
              Title.Caption = 'NOME'
              Width = 170
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'ENTRADA'
              Title.Caption = 'ENTRADA'
              Width = 74
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'SAIDA'
              Title.Caption = 'SAIDA'
              Width = 74
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'SALDO'
              Title.Caption = 'SALDO'
              Width = 74
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end>
        end
      end
    end
    object UniTabSheetHISTORICOLOTEPONTOBENE: TUniTabSheet
      Hint = ''
      Caption = 'Hist'#243'rico do Lote'
      object rcBlock1765: TUniContainerPanel
        Left = 3
        Top = 8
        Width = 88
        Height = 49
        Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
        ParentColor = False
        TabOrder = 0
        DesignSize = (
          88
          49)
        object UniEditBENEPRO: TUniEdit
          Left = 1
          Top = 19
          Width = 85
          Height = 29
          Hint = ''
          Margins.Right = 5
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -16
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ReadOnly = True
        end
        object UniLabel98: TUniLabel
          AlignWithMargins = True
          Left = 1
          Top = 3
          Width = 80
          Height = 16
          Hint = ''
          Margins.Left = 10
          Margins.Top = 15
          AutoSize = False
          Caption = 'Produto'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock1770: TUniContainerPanel
        Left = 93
        Top = 8
        Width = 178
        Height = 49
        Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          178
          49)
        object UniEditbenelotesemente: TUniEdit
          Left = 1
          Top = 19
          Width = 175
          Height = 29
          Hint = ''
          Margins.Right = 5
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -16
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ReadOnly = True
        end
        object UniLabel99: TUniLabel
          AlignWithMargins = True
          Left = 1
          Top = 3
          Width = 80
          Height = 16
          Hint = ''
          Margins.Left = 10
          Margins.Top = 15
          AutoSize = False
          Caption = 'Lote Semente'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock1780: TUniContainerPanel
        Left = 273
        Top = 7
        Width = 144
        Height = 49
        Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          144
          49)
        object UniEditbeneboletim: TUniEdit
          Left = 1
          Top = 19
          Width = 141
          Height = 29
          Hint = ''
          Margins.Right = 5
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -16
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ReadOnly = True
        end
        object UniLabel100: TUniLabel
          AlignWithMargins = True
          Left = 1
          Top = 3
          Width = 80
          Height = 16
          Hint = ''
          Margins.Left = 10
          Margins.Top = 15
          AutoSize = False
          Caption = 'Boletim'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock1790: TUniContainerPanel
        Left = 419
        Top = 7
        Width = 99
        Height = 49
        Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          99
          49)
        object UniLabel101: TUniLabel
          AlignWithMargins = True
          Left = 1
          Top = 3
          Width = 80
          Height = 16
          Hint = ''
          Margins.Left = 10
          Margins.Top = 15
          AutoSize = False
          Caption = 'Pureza %'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniFormattedNumberEditbenepureza: TUniFormattedNumberEdit
          Left = 1
          Top = 19
          Width = 95
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
      object rcBlock1870: TUniContainerPanel
        Left = 520
        Top = 6
        Width = 98
        Height = 50
        Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          98
          50)
        object UniLabel102: TUniLabel
          AlignWithMargins = True
          Left = 1
          Top = 3
          Width = 80
          Height = 16
          Hint = ''
          Margins.Left = 10
          Margins.Top = 15
          AutoSize = False
          Caption = 'Germ %'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniFormattedNumberEditbenegerminacao: TUniFormattedNumberEdit
          Left = 1
          Top = 20
          Width = 96
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
      object rcBlock1810: TUniContainerPanel
        Left = 621
        Top = 6
        Width = 93
        Height = 50
        Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          93
          50)
        object UniLabel103: TUniLabel
          AlignWithMargins = True
          Left = 1
          Top = 3
          Width = 80
          Height = 16
          Hint = ''
          Margins.Left = 10
          Margins.Top = 15
          AutoSize = False
          Caption = 'V.C. %'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniFormattedNumberEditbenevc: TUniFormattedNumberEdit
          Left = 0
          Top = 20
          Width = 92
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
      object rcBlock1230: TUniContainerPanel
        Left = 3
        Top = 59
        Width = 711
        Height = 300
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 6
        object UniDBGrid8: TUniDBGrid
          Left = 0
          Top = 0
          Width = 711
          Height = 300
          Hint = ''
          DataSource = dm_rc.dsbenepessoa
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
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
          Columns = <
            item
              FieldName = 'DATA'
              Title.Caption = 'DATA'
              Width = 100
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'NUMERO'
              Title.Caption = 'NUMERO'
              Width = 100
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'SERIE'
              Title.Caption = 'SER'
              Width = 40
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'PESSOA'
              Title.Caption = 'PESSOA'
              Width = 74
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'NOME'
              Title.Caption = 'NOME'
              Width = 200
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'UF'
              Title.Caption = 'UF'
              Width = 50
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Alignment = taCenter
            end
            item
              FieldName = 'QUANTIDADE'
              Title.Caption = 'QUANTIDADE'
              Width = 100
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end>
        end
      end
    end
    object UniTabSheetblocok200: TUniTabSheet
      Hint = ''
      Caption = 'Bloco K200'
      object UniContainerPanel30: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 0
        object UniDBGridBLOCOK200: TUniDBGrid
          Left = 0
          Top = 0
          Width = 715
          Height = 361
          Hint = ''
          DataSource = dm_rc.ds_blocok200
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
          Columns = <
            item
              FieldName = 'PRODUTO'
              Title.Caption = 'Produtos'
              Width = 80
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o do Item'
              Width = 300
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'UNIDADE'
              Title.Caption = 'UN.'
              Width = 50
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'CUSTO'
              Title.Caption = 'CUSTO'
              Width = 74
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'QUANTIDADE'
              Title.Caption = 'QUANTIDADE'
              Width = 74
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end>
        end
      end
    end
    object UniTabSheetmedidassped: TUniTabSheet
      Hint = ''
      Caption = 'Medidas'
      object UniDBGrid9: TUniDBGrid
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = ''
        DataSource = dm_rc.ds_medidas
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
        WebOptions.Paged = False
        LoadMask.Message = 'Carregando Item(s)...'
        ForceFit = True
        Align = alClient
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        ParentFont = False
        TabOrder = 0
        Summary.Enabled = True
        Columns = <
          item
            FieldName = 'UNIDADE'
            Title.Caption = 'UNIDADE'
            Width = 80
            Font.Color = clBlack
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'DESCRICAO'
            Title.Caption = 'DESCRICAO'
            Width = 600
            Font.Color = clBlack
            Font.Name = 'Calibri'
          end>
      end
    end
    object UniTabSheetoperacaosped: TUniTabSheet
      Hint = ''
      Caption = 'CFOP'
      object UniContainerPanel31: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 0
        object UniDBGrid10: TUniDBGrid
          Left = 0
          Top = 0
          Width = 715
          Height = 361
          Hint = ''
          DataSource = dm_rc.dsoperacaosped
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
          Columns = <
            item
              FieldName = 'CODIGO'
              Title.Caption = 'CODIGO'
              Width = 74
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'DESCRICAO'
              Title.Caption = 'DESCRICAO'
              Width = 600
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end>
        end
      end
    end
    object UniTabSheetpessoassped: TUniTabSheet
      Hint = ''
      Caption = 'Pessoas'
      object UniContainerPanel32: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 0
        object UniDBGrid11: TUniDBGrid
          Left = 0
          Top = 0
          Width = 715
          Height = 361
          Hint = ''
          DataSource = dm_rc.ds_pessoasped
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
          Columns = <
            item
              FieldName = 'CODIGO'
              Title.Caption = 'CODIGO'
              Width = 74
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'NOME'
              Title.Caption = 'DESCRICAO'
              Width = 600
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end>
        end
      end
    end
    object UniTabSheetcontroleentregas: TUniTabSheet
      Hint = ''
      Caption = 'Controle de Entrega(s)'
      object rcBlock1850: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 0
        object rcBlock1860: TUniContainerPanel
          Left = 3
          Top = 3
          Width = 109
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            109
            48)
          object UniEditentreganpedido: TUniEdit
            Left = 3
            Top = 17
            Width = 103
            Height = 29
            Hint = ''
            Margins.Right = 5
            CharCase = ecUpperCase
            Alignment = taCenter
            Text = ''
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Height = -13
            Font.Name = 'Calibri'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            ReadOnly = True
          end
          object UniLabel107: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 1
            Width = 102
            Height = 16
            Hint = ''
            Margins.Left = 10
            Margins.Top = 15
            Alignment = taCenter
            AutoSize = False
            Caption = 'Numero Pedido'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock1880: TUniContainerPanel
          Left = 114
          Top = 3
          Width = 109
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
          ParentColor = False
          TabOrder = 2
          object UniDateTimePickerentreganemissao: TUniDateTimePicker
            AlignWithMargins = True
            Left = 1
            Top = 17
            Width = 105
            Height = 29
            Hint = ''
            Margins.Right = 5
            DateTime = 43232.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            ReadOnly = True
            TabOrder = 1
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            ClientEvents.ExtEvents.Strings = (
              
                'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
                '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
                '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
                ':"  /  /   "});'#13#10'}')
          end
          object UniLabel108: TUniLabel
            AlignWithMargins = True
            Left = -1
            Top = 1
            Width = 102
            Height = 16
            Hint = ''
            Margins.Left = 10
            Margins.Top = 15
            Alignment = taCenter
            AutoSize = False
            Caption = 'Emitido'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock1890: TUniContainerPanel
          Left = 226
          Top = 4
          Width = 374
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-6'#13#10']]'
          ParentColor = False
          TabOrder = 3
          DesignSize = (
            374
            48)
          object UniEditentregapessoa: TUniEdit
            Left = 2
            Top = 17
            Width = 370
            Height = 29
            Hint = ''
            Margins.Right = 5
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Height = -13
            Font.Name = 'Calibri'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            ReadOnly = True
          end
          object UniLabel109: TUniLabel
            AlignWithMargins = True
            Left = 2
            Top = 1
            Width = 102
            Height = 16
            Hint = ''
            Margins.Left = 10
            Margins.Top = 15
            AutoSize = False
            Caption = 'Nome da Pessoa'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock2000: TUniContainerPanel
          Left = 603
          Top = 3
          Width = 109
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
          ParentColor = False
          TabOrder = 4
          DesignSize = (
            109
            48)
          object UniFormattedNumberEditentregatotaldoc: TUniFormattedNumberEdit
            Left = 2
            Top = 17
            Width = 106
            Height = 29
            Hint = ''
            Alignment = taRightJustify
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Height = -13
            Font.Name = 'Calibri'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            ReadOnly = True
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel110: TUniLabel
            AlignWithMargins = True
            Left = -1
            Top = 1
            Width = 102
            Height = 16
            Hint = ''
            Margins.Left = 10
            Margins.Top = 15
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Total Doc.'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object rcBlock1888: TUniContainerPanel
          Left = 3
          Top = 52
          Width = 709
          Height = 306
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 5
          object UniDBGridEntrega: TUniDBGrid
            Left = 0
            Top = 0
            Width = 709
            Height = 306
            Hint = ''
            DataSource = dm_rc.dsitensmoventrega
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
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
            OnMouseDown = UniDBGridEntregaMouseDown
            OnCellClick = UniDBGridEntregaCellClick
            Columns = <
              item
                FieldName = 'opcoes'
                Title.Caption = '...'
                Width = 30
                Font.Color = clBlack
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
              item
                FieldName = 'MSG'
                Title.Caption = ' '
                Width = 74
                Font.Color = clBlack
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
              item
                FieldName = 'NUMERO'
                Title.Caption = 'FISC'
                Width = 60
                Font.Color = clBlack
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'SEQUENCIA'
                Title.Caption = 'S'
                Width = 35
                Font.Color = clBlack
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'PRODUTO'
                Title.Caption = 'PROD'
                Width = 60
                Font.Color = clBlack
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'DESCRICAO'
                Title.Caption = 'DESCRI'#199#195'O DO ITEM'
                Width = 200
                Font.Color = clBlack
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'QUANTIDADE'
                Title.Caption = 'QTDE'
                Width = 80
                Font.Color = clBlack
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'ENTREGUE'
                Title.Caption = 'ENTREGUE'
                Width = 80
                Font.Color = clBlack
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'DISPONIVEL'
                Title.Caption = 'SLD KG'
                Width = 80
                Font.Color = clBlue
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'SALDOSACOS'
                Title.Caption = 'SC'
                Width = 74
                Font.Color = clBlue
                Font.Name = 'Calibri'
              end>
          end
          object rcBlock1270: TUniContainerPanel
            Left = 3
            Top = 213
            Width = 709
            Height = 57
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 2
            object rcBlock1280: TUniContainerPanel
              Left = 3
              Top = 1
              Width = 50
              Height = 48
              Hint = '[[cols:xs-12 sm-12 md-6]]'
              ParentColor = False
              TabOrder = 1
              object UniBitBtn16: TUniBitBtn
                AlignWithMargins = True
                Left = 9
                Top = 10
                Width = 33
                Height = 32
                Hint = 
                  '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
                  #13#10']]'
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = '<i class="fas fa-receipt"></i>'
                ParentFont = False
                Font.Height = -19
                Font.Name = 'Calibri'
                TabOrder = 1
                ScaleButton = False
                LayoutConfig.Padding = '0 2 0 0'
                OnClick = UniBitBtn16Click
              end
            end
            object rcBlock1290: TUniContainerPanel
              Left = 55
              Top = 1
              Width = 50
              Height = 48
              Hint = '[[cols:xs-12 sm-12 md-6]]'
              ParentColor = False
              TabOrder = 2
              object UniBitBtn17: TUniBitBtn
                AlignWithMargins = True
                Left = 7
                Top = 10
                Width = 33
                Height = 32
                Hint = 
                  '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
                  #13#10']]'
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = '<i class="fas fa-layer-group"></i>'
                ParentFont = False
                Font.Height = -19
                Font.Name = 'Calibri'
                TabOrder = 1
                ScaleButton = False
                LayoutConfig.Padding = '0 2 0 0'
                OnClick = UniBitBtn17Click
              end
            end
          end
        end
      end
    end
    object UniTabSheetfinanceirodoc: TUniTabSheet
      Hint = ''
      Caption = 'Financeiro do Documento'
      object UniContainerPanel36: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 0
        object UniDBGridfinanceirodoc: TUniDBGrid
          Left = 0
          Top = 0
          Width = 715
          Height = 361
          Hint = ''
          DataSource = dm_rc.dsextratomovimento
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
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
          OnDrawColumnCell = UniDBGridfinanceirodocDrawColumnCell
          Columns = <
            item
              FieldName = 'NUMERO'
              Title.Caption = 'NUMERO'
              Width = 74
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'SEQUENCIA'
              Title.Caption = 'PARC'
              Width = 45
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Alignment = taCenter
            end
            item
              FieldName = 'VENCIMENTO'
              Title.Caption = 'VENC.'
              Width = 80
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'PAGAMENTO'
              Title.Caption = 'PAG.'
              Width = 80
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'TOTAL'
              Title.Caption = 'TOTAL'
              Width = 80
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'ABERTO'
              Title.Caption = 'ABERTO'
              Width = 74
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'PAGO'
              Title.Caption = 'PAGO'
              Width = 80
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'SALDO'
              Title.Caption = 'SALDO'
              Width = 80
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end>
        end
      end
    end
    object UniTabSheetfinanceiropedido: TUniTabSheet
      Hint = ''
      Caption = 'Financeiro Pedido'
      object UniContainerPanel39: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 0
        object UniDBGrid12: TUniDBGrid
          Left = 0
          Top = 0
          Width = 715
          Height = 361
          Hint = ''
          DataSource = dm_rc.dshistoricofinanceirodoc
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
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
          OnMouseDown = UniDBGridEntregaMouseDown
          OnDrawColumnCell = UniDBGrid12DrawColumnCell
          Columns = <
            item
              FieldName = 'img'
              Title.Caption = ' '
              Width = 30
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'NUMERO'
              Title.Caption = 'NUMERO'
              Width = 74
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'SERIE'
              Title.Caption = 'SER'
              Width = 40
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'SEQUENCIA'
              Title.Caption = 'SEQ.'
              Width = 40
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'VENCIMENTO'
              Title.Caption = 'VENC.'
              Width = 80
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'VALORATUAL'
              Title.Caption = 'VLR ATUAL'
              Width = 74
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'PAGAMENTO'
              Title.Caption = 'PAGAMENTO'
              Width = 80
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'VALORPAGO'
              Title.Caption = 'VLR PAGO'
              Width = 74
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'SITUACAO'
              Title.Caption = 'SITUACAO'
              Width = 80
              Font.Color = clBlack
              Font.Name = 'Calibri'
              Alignment = taCenter
            end>
        end
      end
    end
    object UniTabSheetencerramanifesto: TUniTabSheet
      Hint = ''
      Caption = 'Encerra Manifesto de Terceiros'
      object rcBlock2010: TUniContainerPanel
        Left = 2
        Top = 100
        Width = 712
        Height = 258
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 0
        object UniMemorespostaTXT: TUniMemo
          Left = 5
          Top = 2
          Width = 707
          Height = 115
          Hint = ''
          ParentFont = False
          Font.Color = clRed
          Font.Height = -13
          Font.Style = [fsBold]
          ReadOnly = True
          Color = clInfoBk
          TabOrder = 1
        end
        object UniMemorespxml: TUniMemo
          Left = 5
          Top = 119
          Width = 707
          Height = 115
          Hint = ''
          ParentFont = False
          Font.Color = clRed
          Font.Height = -13
          Font.Style = [fsBold]
          ReadOnly = True
          Color = clInactiveCaption
          TabOrder = 2
        end
      end
      object rcBlock2040: TUniContainerPanel
        Left = 457
        Top = 50
        Width = 257
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-6]]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          257
          48)
        object UniLabel111: TUniLabel
          Left = 1
          Top = 2
          Width = 54
          Height = 15
          Hint = ''
          Caption = 'Protocolo'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniEditprotocoloacesso: TUniEdit
          Left = 1
          Top = 18
          Width = 252
          Height = 29
          Hint = ''
          Margins.Right = 5
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -13
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Color = clCream
        end
      end
      object rcBlock2030: TUniContainerPanel
        Left = 3
        Top = 50
        Width = 450
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-6]]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          450
          48)
        object UniLabel112: TUniLabel
          Left = 1
          Top = 2
          Width = 90
          Height = 15
          Hint = ''
          Caption = 'Chave de Acesso'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object UniEditchaveacesso: TUniEdit
          Left = 1
          Top = 18
          Width = 445
          Height = 29
          Hint = ''
          Margins.Right = 5
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -13
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Color = clCream
        end
      end
      object rcBlock2020: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 48
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alTop
        TabOrder = 3
        object btnENVIA: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 120
          Height = 44
          Hint = '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '<i class="fas fa-paper-plane"> Enviar</i>'
          Align = alLeft
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnENVIAClick
        end
        object btnSTATUS: TUniBitBtn
          AlignWithMargins = True
          Left = 126
          Top = 2
          Width = 120
          Height = 44
          Hint = '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '<i class="fas fa-globe"> Status</i>'
          Align = alLeft
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnSTATUSClick
        end
      end
    end
    object UniTabSheetentregafutura: TUniTabSheet
      Hint = ''
      Caption = 'Lista de Entregas Futuras da Pessoa'
      object rcBlock1300: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alClient
        TabOrder = 0
        object UniDBGrid13: TUniDBGrid
          Left = 0
          Top = 0
          Width = 715
          Height = 361
          Hint = ''
          DataSource = dm_rc.dsentregafutura
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
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
          OnDblClick = UniDBGrid13DblClick
          Columns = <
            item
              FieldName = 'EMISSAO'
              Title.Caption = 'EMISSAO'
              Width = 80
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'NUMERO'
              Title.Caption = 'NUMERO'
              Width = 74
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'SERIE'
              Title.Caption = 'SE'
              Width = 39
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'PRODUTO'
              Title.Caption = 'PROD'
              Width = 70
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'SEQUENCIA'
              Title.Caption = 'SEQ.'
              Width = 50
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'DESCRICAO'
              Title.Caption = 'DESCRICAO'
              Width = 230
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end
            item
              FieldName = 'SALDO'
              Title.Caption = 'DISPONIVEL'
              Width = 80
              Font.Color = clBlack
              Font.Name = 'Calibri'
            end>
        end
      end
    end
    object UniTabSheetkardexmanulote: TUniTabSheet
      Hint = ''
      Caption = 'Kardex Manuten'#231#227'o do Lote'
      object UniDBGrid14: TUniDBGrid
        Left = 0
        Top = 0
        Width = 715
        Height = 361
        Hint = ''
        DataSource = dm_rc.dskardexmanulote
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
        WebOptions.Paged = False
        LoadMask.Message = 'Carregando Item(s)...'
        ForceFit = True
        Align = alClient
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        ParentFont = False
        TabOrder = 0
        Summary.Enabled = True
        OnDrawColumnCell = UniDBGrid14DrawColumnCell
        Columns = <
          item
            FieldName = 'TIPO'
            Title.Caption = 'TIPO'
            Width = 80
            Font.Color = clBlack
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'EMISSAO'
            Title.Caption = 'EMISSAO'
            Width = 100
            Font.Color = clBlack
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'NUMERO'
            Title.Caption = 'NUMERO'
            Width = 74
            Font.Color = clBlack
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'LOTE'
            Title.Caption = 'LOTE'
            Width = 190
            Font.Color = clBlack
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'PUREZA'
            Title.Caption = 'PZ %'
            Width = 70
            Font.Color = clBlack
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'ENTRADA'
            Title.Caption = 'ENTRADA'
            Width = 74
            Font.Color = clBlack
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'SAIDA'
            Title.Caption = 'SAIDA'
            Width = 74
            Font.Color = clBlack
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'SALDO'
            Title.Caption = 'SALDO'
            Width = 74
            Font.Color = clBlack
            Font.Name = 'Calibri'
          end
          item
            FieldName = 'SALDOP'
            Title.Caption = 'PZ SLD'
            Width = 74
            Font.Color = clBlack
            Font.Name = 'Calibri'
          end>
      end
    end
  end
  object FDQryPesquisa: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'SELECT * FROM PESSOAS')
    Left = 47
    Top = 391
  end
  object uniFileUp: TUniFileUpload
    Title = 'Upload'
    Messages.Uploading = 'Enviando...'
    Messages.PleaseWait = 'Aguarde...'
    Messages.Cancel = 'Cancelar'
    Messages.Processing = 'Processando...'
    Messages.UploadError = 'Erro no Envio'
    Messages.Upload = 'Upload'
    Messages.NoFileError = 'Selecione um arquivo'
    Messages.BrowseText = 'Browse...'
    Messages.UploadTimeout = 'Timeout occurred...'
    Messages.MaxSizeError = 'File is bigger than maximum allowed size'
    Messages.MaxFilesError = 'You can upload maximum %d files.'
    TargetFolder = 'uploads'
    Overwrite = True
    OnCompleted = uniFileUpCompleted
    Left = 7
    Top = 391
  end
  object UniScreenMask: TUniScreenMask
    Enabled = True
    DisplayMessage = 'Aguarde ...'
    Left = 84
    Top = 392
  end
  object UniPopupMenuopcoesentregas: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 119
    Top = 390
    object L1: TUniMenuItem
      Caption = 'Lan'#231'amento de Entrega'
      ImageIndex = 36
      OnClick = L1Click
    end
  end
end
