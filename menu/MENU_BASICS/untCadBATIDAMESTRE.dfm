inherited frmCADBATIDAMESTRE: TfrmCADBATIDAMESTRE
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 610
      ScrollWidth = 37
      inherited paOF: TUniContainerPanel
        inherited btnOptions: TUniBitBtn
          OnClick = btnOptionsClick
        end
      end
    end
    inherited pgBaseCadControl: TUniPageControl
      ActivePage = tabRegister
      inherited tabSearch: TUniTabSheet
        ExplicitTop = 24
        ExplicitHeight = 582
        inherited paBaseRegSearch: TUniContainerPanel
          Height = 582
          ExplicitHeight = 582
          inherited paSearchFilters: TUniPanel
            Height = 582
            ExplicitHeight = 582
            inherited UniScrollBox1: TUniScrollBox
              Height = 582
              ExplicitHeight = 582
              ScrollHeight = 270
              ScrollWidth = 262
            end
          end
          inherited dbgSearchCRUD: TUniDBGrid
            Height = 582
            OnMouseDown = dbgSearchCRUDMouseDown
            OnCellClick = dbgSearchCRUDCellClick
            Columns = <
              item
                FieldName = 'CODIGO'
                Title.Caption = ' '
                Width = 30
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
              item
                FieldName = 'FINALIZADO'
                Title.Caption = ' '
                Width = 100
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
              item
                FieldName = 'NUMERO'
                Title.Caption = 'NUMERO'
                Width = 80
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'EMISSAO'
                Title.Caption = 'EMISSAO'
                Width = 100
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'PRODUTO'
                Title.Caption = 'PRODUTO'
                Width = 80
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'DESCRICAO'
                Title.Caption = 'DESCRICAO'
                Width = 250
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'LOTE'
                Title.Caption = 'LOTE'
                Width = 250
                Font.Name = 'Calibri'
              end>
          end
        end
      end
      inherited tabRegister: TUniTabSheet
        ExplicitTop = 24
        ExplicitHeight = 582
        inherited paBaseRegData1: TUniContainerPanel
          Height = 582
          ExplicitHeight = 582
          ScrollHeight = 582
          ScrollWidth = 975
          inherited UniPageControlcadastros: TUniPageControl
            inherited UniTabSheetCRUD: TUniTabSheet
              inherited UniScrollBox2: TUniScrollBox
                object UniContainerPanel3: TUniContainerPanel
                  Left = 0
                  Top = 0
                  Width = 965
                  Height = 552
                  Hint = ''
                  ParentColor = False
                  Align = alClient
                  TabOrder = 0
                  object rcBlock10: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = 3
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
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
                      Top = 18
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
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 2
                    DesignSize = (
                      150
                      48)
                    object UniLabel4: TUniLabel
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
                    object UniDBEdit1: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'NUMERO'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Color = clWhite
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      Font.Style = [fsBold]
                      TabOrder = 2
                      Color = clSilver
                      ReadOnly = True
                    end
                  end
                  object rcBlock30: TUniContainerPanel
                    Tag = 1
                    Left = 372
                    Top = 3
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 3
                    DesignSize = (
                      150
                      48)
                    object UniLabel6: TUniLabel
                      Left = 3
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
                    object UniDBDateTimePicker2: TUniDBDateTimePicker
                      Tag = 1
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'EMISSAO'
                      DataSource = dsMaster
                      DateTime = 44561.000000000000000000
                      DateFormat = 'dd/MM/yyyy'
                      TimeFormat = 'HH:mm:ss'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock40: TUniContainerPanel
                    Tag = 1
                    Left = 542
                    Top = 3
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 4
                    DesignSize = (
                      150
                      48)
                    object UniLabel15: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 73
                      Height = 15
                      Hint = ''
                      Caption = 'Prod. Destino'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniButtonDbEditPRODUTODESTINO: TUniButtonDbEdit
                      Tag = 1
                      Left = 3
                      Top = 18
                      Width = 145
                      Height = 29
                      Hint = ''
                      DataField = 'PRODUTO'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      Color = clInfoBk
                      OnExit = UniButtonDbEditPRODUTODESTINOExit
                      OnButtonClick = UniButtonDbEditPRODUTODESTINOButtonClick
                      IconCls = 'search'
                    end
                  end
                  object rcBlock50: TUniContainerPanel
                    Tag = 1
                    Left = 698
                    Top = 3
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 5
                    DesignSize = (
                      150
                      48)
                    object UniLabel13: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 119
                      Height = 15
                      Hint = ''
                      Caption = 'Descri'#231#227'o do Produto'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEditDESCRICAOPRODUTO: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'DESCRICAO'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      ReadOnly = True
                    end
                  end
                  object rcBlock60: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = 56
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-4]]'
                    ParentColor = False
                    TabOrder = 6
                    DesignSize = (
                      150
                      48)
                    object UniLabel25: TUniLabel
                      Left = 3
                      Top = 1
                      Width = 91
                      Height = 15
                      Hint = ''
                      Caption = 'Pureza Desejada'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBFormattedNumberEditpureza: TUniDBFormattedNumberEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'PU'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                  end
                  object rcBlock70: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = 56
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-4]]'
                    ParentColor = False
                    TabOrder = 7
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEditquantidade: TUniDBFormattedNumberEdit
                      Tag = 1
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'QUANTIDADE'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel5: TUniLabel
                      Left = 3
                      Top = 1
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
                  object rcBlock80: TUniContainerPanel
                    Tag = 1
                    Left = 372
                    Top = 56
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-4]]'
                    ParentColor = False
                    TabOrder = 8
                    DesignSize = (
                      150
                      48)
                    object UniLabel26: TUniLabel
                      Left = 3
                      Top = 1
                      Width = 60
                      Height = 15
                      Hint = ''
                      Caption = 'Sacos de ...'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBComboBoxsacos: TUniDBComboBox
                      Tag = 1
                      Left = 2
                      Top = 18
                      Width = 145
                      Height = 29
                      Hint = ''
                      Anchors = [akLeft, akTop, akRight]
                      DataField = 'SACOS'
                      DataSource = dsMaster
                      Style = csDropDownList
                      Items.Strings = (
                        '1'
                        '2'
                        '5'
                        '10'
                        '15'
                        '20'
                        '25')
                      TabOrder = 2
                      IconItems = <>
                    end
                  end
                  object rcBlock90: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = 110
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 9
                    DesignSize = (
                      150
                      48)
                    object UniLabel7: TUniLabel
                      Left = 3
                      Top = 1
                      Width = 66
                      Height = 15
                      Hint = ''
                      Caption = 'Lote Destino'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniButtonDbEditLOTEDESTINO: TUniButtonDbEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'LOTE'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      Color = clInfoBk
                      OnExit = UniButtonDbEditLOTEDESTINOExit
                      OnButtonClick = UniButtonDbEditLOTEDESTINOButtonClick
                      IconCls = 'search'
                    end
                  end
                  object rcBlock100: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = 110
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 10
                    DesignSize = (
                      150
                      48)
                    object UniLabel8: TUniLabel
                      Left = 3
                      Top = 1
                      Width = 41
                      Height = 15
                      Hint = ''
                      Caption = 'Boletim'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEditboletim: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'BOLETIM'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      ReadOnly = True
                    end
                  end
                  object rcBlock110: TUniContainerPanel
                    Tag = 1
                    Left = 372
                    Top = 110
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 11
                    DesignSize = (
                      150
                      48)
                    object UniLabel9: TUniLabel
                      Left = 3
                      Top = 1
                      Width = 33
                      Height = 15
                      Hint = ''
                      Caption = 'Termo'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdittermo: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'TERMO'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      ReadOnly = True
                    end
                  end
                  object rcBlock120: TUniContainerPanel
                    Tag = 1
                    Left = 558
                    Top = 109
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 12
                    DesignSize = (
                      150
                      48)
                    object UniLabel10: TUniLabel
                      Left = 3
                      Top = 2
                      Width = 29
                      Height = 15
                      Hint = ''
                      Caption = 'Safra'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEditsafra: TUniDBEdit
                      Left = 3
                      Top = 19
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'SAFRAVALIDA'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      ReadOnly = True
                    end
                  end
                  object rcBlock140: TUniContainerPanel
                    Left = 0
                    Top = 207
                    Width = 944
                    Height = 227
                    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                    ParentColor = False
                    TabOrder = 13
                    object UniDBGridbatidaitens: TUniDBGrid
                      Left = 0
                      Top = 0
                      Width = 944
                      Height = 227
                      Hint = ''
                      DataSource = dsdetalhes
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
                      OnCellClick = UniDBGridbatidaitensCellClick
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
                          FieldName = 'EQUIVALENTE'
                          Title.Caption = 'Eqv %'
                          Width = 74
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                        end
                        item
                          FieldName = 'TIPO'
                          Title.Caption = 'Tipo'
                          Width = 144
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                          PickList.Strings = (
                            'Materia Prima'
                            'Sacaria'
                            'Mao de Obra'
                            'Imposto/Demais'
                            'Sementes')
                        end
                        item
                          FieldName = 'exclui'
                          Title.Caption = ' '
                          Width = 30
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                          Alignment = taCenter
                        end>
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
  inherited sqlSearchMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'BATIDAMESTRE'
    SQL.Strings = (
      'SELECT * FROM BATIDAMESTRE')
    object sqlSearchMasterFINALIZADO: TStringField
      FieldName = 'FINALIZADO'
      Origin = 'FINALIZADO'
      OnGetText = sqlSearchMasterFINALIZADOGetText
      Size = 1
    end
    object sqlSearchMasterCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      OnGetText = sqlSearchMasterCODIGOGetText
    end
    object sqlSearchMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object sqlSearchMasterPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
    end
    object sqlSearchMasterEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object sqlSearchMasterLOTE: TStringField
      FieldName = 'LOTE'
      Origin = 'LOTE'
      Size = 50
    end
    object sqlSearchMasterDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 60
    end
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'BATIDAMESTRE'
    SQL.Strings = (
      'SELECT * FROM BATIDAMESTRE WHERE CODIGO = :table_pk')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  inherited tbdetalhes: TFDMemTable
    object tbdetalhesPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
    end
    object tbdetalhesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 80
    end
    object tbdetalhesQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object tbdetalhesEQUIVALENTE: TFloatField
      FieldName = 'EQUIVALENTE'
    end
    object tbdetalhesTIPO: TStringField
      FieldName = 'TIPO'
    end
    object tbdetalhesSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
    end
    object tbdetalhesexclui: TStringField
      FieldName = 'exclui'
      OnGetText = tbdetalhesexcluiGetText
      Size = 1
    end
    object tbdetalhesbuscaproduto: TStringField
      FieldName = 'buscaproduto'
      OnGetText = tbdetalhesbuscaprodutoGetText
      Size = 1
    end
    object tbdetalhesCUSTO_UNITARIO: TFloatField
      FieldName = 'CUSTO_UNITARIO'
    end
  end
  object UniPopupMenuopcoes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 735
    Top = 6
    object I1: TUniMenuItem
      Caption = 'Finalizar Produ'#231#227'o'
      ImageIndex = 94
      OnClick = I1Click
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object E1: TUniMenuItem
      Caption = 'Log da Produ'#231#227'o'
      ImageIndex = 31
      OnClick = E1Click
    end
  end
  object UniPopupMenuimpressao: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 767
    Top = 6
    object UniMenuItem1: TUniMenuItem
      Caption = 'Impress'#227'o'
      ImageIndex = 36
    end
  end
end
