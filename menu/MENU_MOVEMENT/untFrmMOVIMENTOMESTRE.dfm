inherited frmMOVIMENTOMESTRE: TfrmMOVIMENTOMESTRE
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
      inherited paOF: TUniContainerPanel
        AlignWithMargins = False
        TabOrder = 4
        inherited btnCloseForm: TUniBitBtn
          Visible = False
          Align = alTop
          TabOrder = 2
          LayoutConfig.Padding = '0 2 0 0'
        end
        inherited btnOptions: TUniBitBtn
          Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-cog | '#13#10'cls-ico:font-black'#13#10']]'
          Align = alTop
          TabOrder = 1
          LayoutConfig.Padding = '0 2 0 0'
        end
      end
      inherited paP: TUniContainerPanel
        TabOrder = 0
        inherited btnSearch: TUniBitBtn
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-search | '#13#10'cls-ico:font-black |'#13#10 +
            'hint:Abre para Pesquisas t:Busca(s) w:200 d:10000 c:rc-bg-info'#13#10 +
            ']]'#13#10
          Align = alTop
          LayoutConfig.Padding = '0 2 0 0'
        end
      end
      inherited paNAE: TUniContainerPanel
        TabOrder = 2
        inherited btnNewReg: TUniBitBtn
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black|'#13#10'hin' +
            't:Inclui t:Inclui w:200 d:10000 c:rc-bg-info'#13#10']]'
          Align = alTop
          ScreenMask.Target = Owner
          LayoutConfig.Padding = '0 2 0 0'
        end
        inherited btnEditReg: TUniBitBtn
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
            '|'#13#10'hint:Altera t:Altera w:200 d:10000 c:rc-bg-info'#13#10']]'
          Align = alTop
          ScreenMask.Target = Owner
          LayoutConfig.Padding = '0 2 0 0'
        end
        inherited btnDeleteReg: TUniBitBtn
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-trash-alt | '#13#10'cls-ico:font-black' +
            '|'#13#10'hint:Exclui t:Exclui w:200 d:10000 c:rc-bg-info'#13#10']]'
        end
      end
      inherited paGC: TUniContainerPanel
        TabOrder = 3
        inherited btnSaveReg: TUniBitBtn
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fa-save | '#13#10'cls-ico:font-black|'#13#10'hin' +
            't:Salva t:Salva w:200 d:10000 c:rc-bg-info'#13#10']]'
          ScreenMask.Target = Owner
        end
        inherited btnCancelReg: TUniBitBtn
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-times | '#13#10'cls-ico:font-black|'#13#10'h' +
            'int:Cancela t:Cancela w:200 d:10000 c:rc-bg-info'#13#10']]'
          ScreenMask.Target = Owner
          LayoutConfig.Padding = '0 2 0 0'
        end
      end
      inherited paAcoesNota: TUniContainerPanel
        inherited btnCalcReg: TUniBitBtn
          Hint = 
            '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-calculator | '#13#10'cls-ico:font-blac' +
            'k|'#13#10'hint:Calcula t:Calcula w:200 d:10000 c:rc-bg-info'#13#10']]'
          OnClick = btnCalcRegClick
        end
      end
    end
    inherited paBaseCadControl: TUniContainerPanel
      inherited pgBaseCadControl: TUniPageControl
        inherited tabSearch: TUniTabSheet
          inherited paBaseRegSearch: TUniContainerPanel
            inherited paGridOffset: TUniContainerPanel
              inherited dbgSearchCRUD: TUniDBGrid
                ForceFit = True
                Font.Height = -13
                Columns = <
                  item
                    Flex = 50
                    FieldName = 'opcoes'
                    Title.Caption = ' '
                    Width = 50
                    Font.Name = 'Calibri'
                    Alignment = taCenter
                  end
                  item
                    Flex = 100
                    FieldName = 'status'
                    Title.Caption = ' '
                    Width = 117
                    Font.Name = 'Calibri'
                    Alignment = taCenter
                  end
                  item
                    Flex = 90
                    FieldName = 'DOCUMENTO'
                    Title.Caption = 'TIPO'
                    Width = 90
                    Font.Name = 'Calibri'
                  end
                  item
                    Flex = 100
                    FieldName = 'NUMERO'
                    Title.Caption = 'NUMERO'
                    Width = 100
                    Font.Name = 'Calibri'
                  end
                  item
                    Flex = 120
                    FieldName = 'EMISSAO'
                    Title.Caption = 'EMISSAO'
                    Width = 120
                    Font.Name = 'Calibri'
                  end
                  item
                    Flex = 100
                    FieldName = 'PESSOA'
                    Title.Caption = 'PESSOA'
                    Width = 100
                    Font.Name = 'Calibri'
                  end
                  item
                    Flex = 800
                    FieldName = 'NOME'
                    Title.Caption = 'NOME'
                    Width = 250
                    Font.Name = 'Calibri'
                    ReadOnly = True
                  end
                  item
                    Flex = 800
                    FieldName = 'CIDADE'
                    Title.Caption = 'CIDADE'
                    Width = 250
                    Font.Name = 'Calibri'
                    ReadOnly = True
                  end
                  item
                    Flex = 50
                    FieldName = 'ESTADO'
                    Title.Caption = 'U.F.'
                    Width = 50
                    Font.Name = 'Calibri'
                    ReadOnly = True
                  end
                  item
                    Flex = 200
                    FieldName = 'VLRTOTAL'
                    Title.Caption = 'TOTAL'
                    Width = 150
                    Font.Name = 'Calibri'
                  end>
              end
            end
          end
        end
        inherited tabRegister: TUniTabSheet
          inherited paBaseRegData1: TUniContainerPanel
            AutoScroll = False
            object UniScrollBox2: TUniScrollBox
              AlignWithMargins = True
              Left = 15
              Top = 3
              Width = 1331
              Height = 959
              Hint = ''
              Margins.Left = 15
              Margins.Right = 15
              Align = alClient
              TabOrder = 0
              DesignSize = (
                1329
                957)
              ScrollHeight = 714
              ScrollWidth = 976
              object rcBlock510: TUniContainerPanel
                Tag = 1
                Left = 3
                Top = 58
                Width = 187
                Height = 48
                Hint = '[[cols:xs-12 sm-12 md-5]]'
                ParentColor = False
                TabOrder = 0
                TabStop = False
                DesignSize = (
                  187
                  48)
                object UniEditcidade: TUniEdit
                  AlignWithMargins = True
                  Left = 7
                  Top = 18
                  Width = 178
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
                  TabStop = False
                  ReadOnly = True
                end
                object UniLabel7: TUniLabel
                  Left = 0
                  Top = 0
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
              object rcBlock520: TUniContainerPanel
                Tag = 1
                Left = 196
                Top = 58
                Width = 172
                Height = 48
                Hint = '[[cols:xs-12 sm-12 md-2]]'
                ParentColor = False
                TabOrder = 1
                TabStop = False
                DesignSize = (
                  172
                  48)
                object UniEditestado: TUniEdit
                  AlignWithMargins = True
                  Left = 3
                  Top = 18
                  Width = 167
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
                  TabStop = False
                  ReadOnly = True
                end
                object UniLabel9: TUniLabel
                  Left = 0
                  Top = 0
                  Width = 37
                  Height = 15
                  Hint = ''
                  Caption = 'Estado'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                end
              end
              object rcBlock540: TUniContainerPanel
                Tag = 1
                Left = 374
                Top = 56
                Width = 267
                Height = 48
                Hint = '[[cols:xs-12 sm-12 md-5]]'
                ParentColor = False
                TabOrder = 4
                DesignSize = (
                  267
                  48)
                object UniLabel11: TUniLabel
                  Left = 3
                  Top = 1
                  Width = 132
                  Height = 15
                  Hint = ''
                  Caption = 'Condi'#231#227'o de Pagamento'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
                object edLkpCONDICOES: TUniDBEdit
                  Left = 2
                  Top = 19
                  Width = 263
                  Height = 29
                  Hint = 
                    '[['#13#10'DESCRICAO CONDICAO @60 |'#13#10'lkpfilter-empty:Selecione um Pagam' +
                    'ento<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-gridattr: |'#13#10'val' +
                    'id:blank |'#13#10'valid-required:top-in |'#13#10']]'#13#10#13#10
                  CharCase = ecUpperCase
                  Anchors = [akLeft, akTop, akRight]
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                  Color = clInfoBk
                  ReadOnly = True
                  InputType = 'text'
                  OnClick = edLkpCONDICOESClick
                end
              end
              object rcBlock590: TUniContainerPanel
                Left = 0
                Top = 416
                Width = 946
                Height = 211
                Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                ParentColor = False
                TabOrder = 5
                object UniDBGridprodutos: TUniDBGrid
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 940
                  Height = 205
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
                  OnMouseDown = UniDBGridprodutosMouseDown
                  OnCellClick = UniDBGridprodutosCellClick
                  Columns = <
                    item
                      FieldName = 'PRODUTO'
                      Title.Caption = 'Produtos'
                      Width = 80
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
                      FieldName = 'buscalote'
                      Title.Caption = ' '
                      Width = 50
                      Font.Color = clBlack
                      Font.Name = 'Calibri'
                      Alignment = taCenter
                    end
                    item
                      FieldName = 'LOTESEMENTE'
                      Title.Caption = 'LOTE'
                      Width = 144
                      Font.Color = clBlack
                      Font.Name = 'Calibri'
                    end
                    item
                      FieldName = 'PESOSACO'
                      Title.Caption = 'KG SACO'
                      Width = 74
                      Font.Color = clBlack
                      Font.Name = 'Calibri'
                    end
                    item
                      FieldName = 'PEDIDOOR'
                      Title.Caption = 'N'#186' Pedido'
                      Width = 80
                      Font.Color = clBlack
                      Font.Name = 'Calibri'
                    end
                    item
                      FieldName = 'PEDIDOITEMOR'
                      Title.Caption = 'N'#186' Item Ped.'
                      Width = 80
                      Font.Color = clBlack
                      Font.Name = 'Calibri'
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
              object rcBlock580: TUniContainerPanel
                Left = 3
                Top = 251
                Width = 940
                Height = 160
                Hint = '[[cols:xs-12 sm-12 md-12]]'
                ParentColor = False
                TabOrder = 2
                object rcBlock600: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 5
                  Width = 188
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 0
                  DesignSize = (
                    188
                    48)
                  object UniButtonDbEditvendedor: TUniButtonDbEdit
                    Tag = 1
                    AlignWithMargins = True
                    Left = 3
                    Top = 18
                    Width = 182
                    Height = 29
                    Hint = ''
                    DataField = 'FUNCIONARIO'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 0
                    Color = clInfoBk
                    OnExit = UniButtonDbEditvendedorExit
                    OnButtonClick = UniButtonDbEditvendedorButtonClick
                    IconCls = 'search'
                  end
                  object UniLabel17: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 51
                    Height = 15
                    Hint = ''
                    Caption = 'Vendedor'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock610: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 5
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 1
                  DesignSize = (
                    150
                    48)
                  object UniLabel19: TUniLabel
                    Left = 3
                    Top = -1
                    Width = 102
                    Height = 15
                    Hint = ''
                    Caption = 'Nome do Vendedor'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                  object UniEditnomevendedor: TUniEdit
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
                end
                object rcBlock620: TUniContainerPanel
                  Tag = 1
                  Left = 372
                  Top = 4
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    150
                    48)
                  object UniLabel20: TUniLabel
                    Left = 3
                    Top = 0
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
                    AlignWithMargins = True
                    Left = 3
                    Top = 18
                    Width = 147
                    Height = 29
                    Hint = ''
                    DataField = 'COMISSAOFUNCIONARIO'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock670: TUniContainerPanel
                  Left = 3
                  Top = 57
                  Width = 934
                  Height = 98
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    934
                    98)
                  object UniDBMemo1: TUniDBMemo
                    AlignWithMargins = True
                    Left = 3
                    Top = 19
                    Width = 928
                    Height = 62
                    Hint = ''
                    DataField = 'OBSPEDIDO'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 0
                    Color = clInfoBk
                    ClientEvents.ExtEvents.Strings = (
                      
                        'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' sender.body' +
                        'El.dom.addEventListener('#13#10'        '#39'keydown'#39', '#13#10'        function(' +
                        'e) {if (e.key=='#39'Enter'#39') {e.stopPropagation()}}'#13#10'    ); '#13#10'}')
                  end
                  object UniLabel26: TUniLabel
                    Left = 3
                    Top = 2
                    Width = 111
                    Height = 15
                    Hint = ''
                    Caption = 'Observa'#231#227'o PEDIDO'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
              end
              object rcBlock570: TUniContainerPanel
                Tag = 1
                Left = 720
                Top = 124
                Width = 223
                Height = 120
                Hint = '[[cols:xs-12 sm-12 md-4]]'
                ParentColor = False
                TabOrder = 3
                DesignSize = (
                  223
                  120)
                object UniDBFormattedNumberEditdescontos: TUniDBFormattedNumberEdit
                  Left = 11
                  Top = 18
                  Width = 110
                  Height = 29
                  Hint = ''
                  DataField = 'VLRDESCONTOS'
                  DataSource = dsMaster
                  ParentFont = False
                  Font.Color = clRed
                  TabOrder = 1
                  DecimalSeparator = ','
                  ThousandSeparator = '.'
                  OnExit = UniDBFormattedNumberEditdescontosExit
                end
                object UniDBFormattedNumberEditvlrprodutos: TUniDBFormattedNumberEdit
                  AlignWithMargins = True
                  Left = 159
                  Top = 18
                  Width = 55
                  Height = 23
                  Hint = ''
                  DataField = 'VLRPRODUTOS'
                  DataSource = dsMaster
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  TabOrder = 2
                  ReadOnly = True
                  DecimalSeparator = ','
                  ThousandSeparator = '.'
                end
                object UniDBFormattedNumberEditvlrdespesas: TUniDBFormattedNumberEdit
                  Left = 11
                  Top = 90
                  Width = 110
                  Height = 29
                  Hint = ''
                  DataField = 'VLRDESPESAS'
                  DataSource = dsMaster
                  TabOrder = 3
                  DecimalSeparator = ','
                  ThousandSeparator = '.'
                  OnExit = UniDBFormattedNumberEditvlrdespesasExit
                end
                object UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit
                  AlignWithMargins = True
                  Left = 159
                  Top = 90
                  Width = 55
                  Height = 23
                  Hint = ''
                  DataField = 'VLRTOTAL'
                  DataSource = dsMaster
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  ParentFont = False
                  Font.Color = clBlue
                  Font.Height = -13
                  Font.Style = [fsBold, fsItalic]
                  TabOrder = 4
                  ReadOnly = True
                  DecimalSeparator = ','
                  ThousandSeparator = '.'
                end
                object UniLabel12: TUniLabel
                  Left = 11
                  Top = 1
                  Width = 57
                  Height = 15
                  Hint = ''
                  Caption = 'Descontos'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 5
                end
                object UniLabel13: TUniLabel
                  Left = 159
                  Top = 1
                  Width = 69
                  Height = 15
                  Hint = ''
                  Caption = 'Vlr Produtos'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 6
                end
                object UniLabel14: TUniLabel
                  Left = 11
                  Top = 69
                  Width = 52
                  Height = 15
                  Hint = ''
                  Caption = 'Despesas'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 7
                end
                object UniLabel16: TUniLabel
                  Left = 159
                  Top = 69
                  Width = 46
                  Height = 15
                  Hint = ''
                  Caption = 'Vlr Total'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 8
                end
              end
              object rcBlock630: TUniContainerPanel
                Tag = 1
                Left = 1
                Top = 634
                Width = 150
                Height = 80
                Hint = '[[cols:xs-12 sm-12 md-3]]'
                ParentColor = False
                TabOrder = 6
                DesignSize = (
                  150
                  80)
                object UniDBFormattedNumberEditquantidade: TUniDBFormattedNumberEdit
                  AlignWithMargins = True
                  Left = 3
                  Top = 25
                  Width = 145
                  Height = 29
                  Hint = ''
                  DataField = 'TRAQUANTIDADE'
                  DataSource = dsMaster
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                  DecimalSeparator = ','
                  ThousandSeparator = '.'
                end
                object UniLabel22: TUniLabel
                  Left = 3
                  Top = 6
                  Width = 64
                  Height = 15
                  Hint = ''
                  Caption = 'Quantidade'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                end
              end
              object rcBlock640: TUniContainerPanel
                Tag = 1
                Left = 161
                Top = 634
                Width = 150
                Height = 80
                Hint = '[[cols:xs-12 sm-12 md-3]]'
                ParentColor = False
                TabOrder = 7
                DesignSize = (
                  150
                  80)
                object UniLabel23: TUniLabel
                  Left = 3
                  Top = 6
                  Width = 59
                  Height = 15
                  Hint = ''
                  Caption = 'Peso Bruto'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
                object UniDBFormattedNumberEditPESOBRUTO: TUniDBFormattedNumberEdit
                  AlignWithMargins = True
                  Left = 3
                  Top = 25
                  Width = 145
                  Height = 29
                  Hint = ''
                  DataField = 'TRAPESOBRUTO'
                  DataSource = dsMaster
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                  DecimalSeparator = ','
                  ThousandSeparator = '.'
                end
              end
              object rcBlock650: TUniContainerPanel
                Tag = 1
                Left = 320
                Top = 634
                Width = 150
                Height = 80
                Hint = '[[cols:xs-12 sm-12 md-3]]'
                ParentColor = False
                TabOrder = 8
                DesignSize = (
                  150
                  80)
                object UniDBEditinscricao: TUniDBEdit
                  Left = 2
                  Top = 27
                  Width = 146
                  Height = 29
                  Hint = ''
                  DataField = 'TRAESPECIE'
                  DataSource = dsMaster
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                end
                object UniLabel24: TUniLabel
                  Left = 2
                  Top = 6
                  Width = 41
                  Height = 15
                  Hint = ''
                  Caption = 'Esp'#233'cie'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                end
              end
              object rcBlock660: TUniContainerPanel
                Tag = 1
                Left = 480
                Top = 633
                Width = 134
                Height = 80
                Hint = '[[cols:xs-12 sm-12 md-3]]'
                ParentColor = False
                TabOrder = 9
                DesignSize = (
                  134
                  80)
                object UniDBComboBoxMARCA: TUniDBComboBox
                  Tag = 1
                  AlignWithMargins = True
                  Left = 3
                  Top = 24
                  Width = 128
                  Height = 29
                  Hint = ''
                  Anchors = [akLeft, akTop, akRight]
                  DataField = 'TRAMARCA'
                  DataSource = dsMaster
                  Style = csDropDownList
                  Items.Strings = (
                    ''
                    'SACO(s)'
                    'KILO(s)'
                    'PE'#199'A(s)'
                    'UNIDADE(s)'
                    'VOLUME(s)'
                    'CAIXA(s)')
                  TabOrder = 1
                  IconItems = <>
                end
                object UniLabel25: TUniLabel
                  Left = 5
                  Top = 7
                  Width = 36
                  Height = 15
                  Hint = ''
                  Caption = 'Marca'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                end
              end
              object rcBlock680: TUniContainerPanel
                Tag = 1
                Left = 625
                Top = 630
                Width = 134
                Height = 80
                Hint = '[[cols:xs-12 sm-12 md-3]]'
                ParentColor = False
                TabOrder = 10
                DesignSize = (
                  134
                  80)
                object UniLabel18: TUniLabel
                  Left = 7
                  Top = 10
                  Width = 76
                  Height = 15
                  Hint = ''
                  Caption = 'Numero Tal'#227'o'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
                object UniDBEditNUMEROPEDIDO: TUniDBEdit
                  Left = 5
                  Top = 29
                  Width = 123
                  Height = 29
                  Hint = ''
                  DataField = 'NUMEROPEDIDO'
                  DataSource = dsMaster
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                end
              end
              object UniButtonDbEditcodigopessoas: TUniEdit
                AlignWithMargins = True
                Left = 949
                Top = 258
                Width = 55
                Height = 29
                Hint = ''
                Margins.Right = 5
                Visible = False
                CharCase = ecUpperCase
                Text = ''
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 11
                ReadOnly = True
              end
              object rcBlock550: TUniContainerPanel
                Tag = 1
                Left = 16
                Top = 125
                Width = 661
                Height = 120
                Hint = '[[cols:xs-12 sm-12 md-8]]'
                ParentColor = False
                TabOrder = 12
                object UniDBMemoobservacao: TUniDBMemo
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 655
                  Height = 114
                  Hint = ''
                  DataField = 'OBSERVACOES'
                  DataSource = dsMaster
                  Align = alClient
                  TabOrder = 1
                  ClientEvents.ExtEvents.Strings = (
                    
                      'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' sender.body' +
                      'El.dom.addEventListener('#13#10'        '#39'keydown'#39', '#13#10'        function(' +
                      'e) {if (e.key=='#39'Enter'#39') {e.stopPropagation()}}'#13#10'    ); '#13#10'}')
                end
              end
              object rcBlock450: TUniContainerPanel
                Left = 20
                Top = -4
                Width = 956
                Height = 63
                Hint = '[[cols:xs-12 sm-12 md-12]]'
                Margins.Right = 100
                ParentColor = False
                TabOrder = 13
                DesignSize = (
                  956
                  63)
                object rcBlock465: TUniContainerPanel
                  Left = 27
                  Top = 8
                  Width = 212
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  Visible = False
                  ParentColor = False
                  TabOrder = 1
                  DesignSize = (
                    212
                    48)
                  object UniLabelTipoDocumento: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 105
                    Height = 15
                    Hint = ''
                    Caption = 'Tipo de Documento'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 0
                  end
                  object UniComboTipoDocumento: TUniComboBox
                    Left = 0
                    Top = 18
                    Width = 212
                    Height = 29
                    Hint = ''
                    Style = csDropDownList
                    Text = ''
                    Items.Strings = (
                      'Or'#231'amento'
                      'Venda'
                      'Nota')
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    IconItems = <>
                    OnChange = UniComboTipoDocumentoChange
                    ExplicitWidth = 300
                  end
                end
                object rcBlock475: TUniContainerPanel
                  Tag = 1
                  Left = 264
                  Top = 8
                  Width = 241
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-5]]'
                  ParentColor = False
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                  DesignSize = (
                    241
                    48)
                  object UniLabel5: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 39
                    Height = 15
                    Hint = ''
                    Caption = 'Pessoa'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edLkpPESSOAS: TUniDBEdit
                    Left = 1
                    Top = 18
                    Width = 236
                    Height = 29
                    Hint = 
                      '[['#13#10'NOME PESSOA @60 |'#13#10'lkpfilter-empty:Selecione uma Pessoa<tran' +
                      'slate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-gridattr: |'#13#10'valid:blank ' +
                      '|'#13#10'valid-required:top-in |'#13#10']]'#13#10#13#10
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    Color = clInfoBk
                    ReadOnly = True
                    InputType = 'text'
                    OnClick = edLkpPESSOASClick
                    OnExit = edLkpPESSOASExit
                  end
                end
                object rcBlock480: TUniContainerPanel
                  Tag = 1
                  Left = 511
                  Top = 7
                  Width = 116
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    116
                    48)
                  object UniLabel4: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 46
                    Height = 15
                    Hint = ''
                    Caption = 'Emiss'#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBDateTimePickeremissao: TUniDBDateTimePicker
                    AlignWithMargins = True
                    Left = 3
                    Top = 18
                    Width = 103
                    Height = 29
                    Hint = ''
                    DataField = 'EMISSAO'
                    DataSource = dsMaster
                    DateTime = 44560.000000000000000000
                    DateFormat = 'dd/MM/yyyy'
                    TimeFormat = 'HH:mm:ss'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    ClientEvents.ExtEvents.Strings = (
                      
                        'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
                        '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
                        '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
                        ':"  /  /   "});'#13#10'}')
                  end
                end
                object rcBlock485: TUniContainerPanel
                  Tag = 1
                  Left = 657
                  Top = 8
                  Width = 148
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  Margins.Right = 15
                  ParentColor = False
                  TabOrder = 4
                  TabStop = False
                  DesignSize = (
                    148
                    48)
                  object UniLabel8: TUniLabel
                    Left = 3
                    Top = 0
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
                    Left = 3
                    Top = 18
                    Width = 137
                    Height = 29
                    Hint = ''
                    Margins.Right = 15
                    DataField = 'NUMERO'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clWhite
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    TabOrder = 2
                    TabStop = False
                    Color = clGray
                    ReadOnly = True
                  end
                end
              end
            end
          end
        end
      end
      inherited paSearchFilters: TUniPanel
        Top = -2
        Height = 475
        ExplicitTop = -2
        ExplicitHeight = 475
        inherited UniScrollBox1: TUniScrollBox
          Top = 42
          ExplicitTop = 42
          ScrollHeight = 815
          ScrollWidth = 164
          inherited paSearchFilter1: TUniContainerPanel
            Height = 177
            ExplicitHeight = 177
            DesignSize = (
              275
              177)
            inherited paSearchOp1: TUniContainerPanel
              Top = 108
              ExplicitTop = 108
            end
            inherited paSearchField1: TUniContainerPanel
              Top = 32
              Height = 68
              ExplicitTop = 32
              ExplicitHeight = 68
              DesignSize = (
                275
                68)
              inherited cbxSearchCRUDField1_Fields: TUniComboBox
                Left = 164
                Top = 3
                ExplicitLeft = 164
                ExplicitTop = 3
              end
            end
          end
          inherited paSearchContent1: TUniContainerPanel
            Left = 10
            Top = 224
            ExplicitLeft = 10
            ExplicitTop = 224
          end
          inherited paSearchFilter2: TUniContainerPanel
            inherited paSearchField2: TUniContainerPanel
              inherited cbxSearchCRUDField2_Fields: TUniComboBox
                Left = 201
                Top = -7
                ExplicitLeft = 201
                ExplicitTop = -7
              end
            end
          end
          inherited paSearchBtn: TUniContainerPanel
            inherited btnSearchCRUD: TUniBitBtn
              ScreenMask.Target = Owner
            end
          end
          object pnlFiltroTipoDocumento: TUniContainerPanel
            Left = 10
            Top = 760
            Width = 275
            Height = 55
            Hint = ''
            ParentColor = False
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 10
            DesignSize = (
              275
              55)
            object lblFiltroTipoDocumento: TUniLabel
              Left = 0
              Top = 0
              Width = 105
              Height = 15
              Hint = ''
              Caption = 'Tipo de Documento'
              TabOrder = 0
            end
            object cbFiltroTipoDocumento: TUniComboBox
              Left = 0
              Top = 19
              Width = 275
              Height = 29
              Hint = ''
              Style = csDropDownList
              Text = 'Todos'
              Items.Strings = (
                'Todos'
                'Or'#231'amento'
                'Venda'
                'Nota')
              ItemIndex = 0
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              IconItems = <>
              OnChange = cbFiltroTipoDocumentoChange
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
  inherited rcSweetAlert: TUniSweetAlert
    Left = 1068
    Top = 28
  end
  inherited dsMaster: TDataSource
    Left = 1252
    Top = 23
  end
  inherited dsSearchMaster: TDataSource
    Left = 964
    Top = 15
  end
  inherited sqlSearchMaster: TFDQuery
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      
        ' SELECT           M.CODIGO, M.NUMERO,M.EMISSAO,M.SERIE,M.CANCELA' +
        'DA,M.PESSOA,P.CIDADE,P.ESTADO,P.NOME,M.FECHAMENTO_STATUS,M.VLRTO' +
        'TAL  FROM'
      ' MVMESTRE  M INNER JOIN PESSOAS P ON (M.PESSOA = P.CODIGO)')
    Left = 1303
    Top = 25
    object FDQryFiltroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
    object FDQryFiltroNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object FDQryFiltroEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object FDQryFiltroSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 3
    end
    object FDQryFiltroCANCELADA: TStringField
      FieldName = 'CANCELADA'
      Origin = 'CANCELADA'
      Size = 1
    end
    object FDQryFiltroPESSOA: TIntegerField
      FieldName = 'PESSOA'
      Origin = 'PESSOA'
    end
    object FDQryFiltroCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 30
    end
    object FDQryFiltroESTADO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
    object FDQryFiltroNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object FDQryFiltroVLRTOTAL: TFMTBCDField
      FieldName = 'VLRTOTAL'
      Origin = 'VLRTOTAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object FDQryFiltrostatus: TStringField
      FieldKind = fkCalculated
      FieldName = 'status'
      OnGetText = FDQryFiltrostatusGetText
      Calculated = True
    end
    object FDQryFiltroopcoes: TStringField
      FieldKind = fkCalculated
      FieldName = 'opcoes'
      OnGetText = FDQryFiltroopcoesGetText
      Calculated = True
    end
    object FDQryFiltroDOCUMENTO: TIntegerField
      FieldName = 'DOCUMENTO'
    end
    object FDQryFiltroFECHAMENTO_STATUS: TStringField
      DisplayWidth = 15
      FieldName = 'FECHAMENTO_STATUS'
      Origin = 'FECHAMENTO_STATUS'
      Size = 15
    end
    object sqlSearchMasterKEY: TStringField
      FieldName = 'KEY'
      Origin = '"KEY"'
      Size = 38
    end
    object sqlSearchMasterEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
    end
  end
  inherited sqlMaster: TFDQuery
    AfterOpen = sqlMasterAfterOpen
    UpdateOptions.UpdateTableName = 'MVMESTRE'
    UpdateOptions.KeyFields = 'CODIGO'
    SQL.Strings = (
      'SELECT * FROM MVMESTRE WHERE CODIGO = :table_pk')
    Left = 1193
    Top = 23
    ParamData = <
      item
        Name = 'TABLE_PK'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  inherited popMenuOptions: TUniPopupMenu
    Left = 1122
    Top = 34
  end
  inherited FDSchemaAdapter1: TFDSchemaAdapter
    Left = 910
    Top = 22
  end
  object UniPopupMenudetalhes: TUniPopupMenu
    Left = 735
    Top = 6
  end
  object dstitulos: TDataSource
    AutoEdit = False
    DataSet = tbtitulos
    Left = 435
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
    Left = 465
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
    object tbtitulosexclui: TStringField
      FieldName = 'exclui'
      Size = 1
    end
    object tbtitulosSTATUS: TStringField
      FieldName = 'STATUS'
      OnGetText = tbtitulosSTATUSGetText
    end
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
    Left = 498
    Top = 9
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
      DisplayWidth = 20
      FieldName = 'NUMERONCM'
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
    end
    object memprodutosENTREGUE: TFloatField
      FieldName = 'ENTREGUE'
    end
    object memprodutosPEDIDOOR: TStringField
      FieldName = 'PEDIDOOR'
    end
    object memprodutosPEDIDOITEMOR: TStringField
      FieldName = 'PEDIDOITEMOR'
    end
    object memprodutosSEMENTENOME: TStringField
      FieldName = 'SEMENTENOME'
      Size = 100
    end
    object memprodutosTETRAZOLIO: TFloatField
      FieldName = 'TETRAZOLIO'
    end
    object memprodutosTIPOLOTE: TStringField
      FieldName = 'TIPOLOTE'
      Size = 1
    end
  end
  object dsprodutos: TDataSource
    DataSet = memprodutos
    Left = 526
    Top = 9
  end
  object UniPopupMenuopcoes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 764
    Top = 6
    object I4: TUniMenuItem
      Caption = 'Importar Documento'
      ImageIndex = 112
      OnClick = I4Click
    end
    object N5: TUniMenuItem
      Caption = '-'
    end
    object I1: TUniMenuItem
      Caption = 'Importar Documento'
      ImageIndex = 61
      Visible = False
      OnClick = I1Click
    end
    object i2: TUniMenuItem
      Caption = 'Impress'#227'o do Documento'
      ImageIndex = 52
      OnClick = i2Click
    end
  end
  object UniScreenMask: TUniScreenMask
    AttachedControl = btnNewReg
    Enabled = True
    Left = 561
    Top = 10
  end
  object UniPopupMenulote: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 793
    Top = 6
    object L1: TUniMenuItem
      Caption = 'Lote de Venda - Nota'
      ImageIndex = 36
      OnClick = L1Click
    end
    object N6: TUniMenuItem
      Caption = '-'
    end
    object L2: TUniMenuItem
      Caption = 'Lote de Produ'#231#227'o Acabada'
      ImageIndex = 55
      OnClick = L2Click
    end
  end
end
