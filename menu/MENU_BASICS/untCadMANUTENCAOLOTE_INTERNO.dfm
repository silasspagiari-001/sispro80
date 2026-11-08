inherited frmCadMANUTENCAOLOTE_INTERNO: TfrmCadMANUTENCAOLOTE_INTERNO
  Font.Height = -15
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseTop: TUniContainerPanel
      inherited paBaseTopTitle: TUniContainerPanel
        inherited labCancel: TUniLabel [0]
        end
        inherited labTitleForm: TUniLabel [1]
          Top = 8
          Hint = '[['#13#10'caption-dots:mobile-v-16 |'#13#10'caption-id'#13#10']]'#13#10#13#10
          ExplicitTop = 8
        end
        inherited labExit: TUniLabel [2]
        end
        inherited labSave: TUniLabel [3]
        end
        inherited btnQuickSearch: TUniBitBtn [4]
          ScreenMask.Target = Owner
        end
        inherited labState: TUniLabel [5]
        end
        inherited labOptions: TUniLabel [6]
          OnClick = btnOptionsClick
        end
        inherited edQuickSearch: TUniEdit [7]
        end
        inherited labEdit: TUniLabel [8]
        end
        inherited labDelete: TUniLabel [9]
        end
        inherited labNew: TUniLabel [10]
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
                Columns = <
                  item
                    FieldName = 'CODIGO'
                    Title.Caption = 'CODIGO'
                    Width = 74
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'NUMERO'
                    Title.Caption = 'NUMERO'
                    Width = 74
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'LOTE'
                    Title.Caption = 'LOTE'
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
                    Title.Caption = 'DESCRICAO'
                    Width = 300
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'QUANTIDADE'
                    Title.Caption = 'QTDE'
                    Width = 137
                    Font.Name = 'Calibri'
                  end>
              end
              inherited paNotFound_dbgSearchCRUD: TUniContainerPanel
                inherited imgNoRecords_dbgSearchCRUD: TUniLabel
                  Anchors = [akLeft, akTop, akBottom]
                end
              end
            end
          end
        end
        inherited tabRegister: TUniTabSheet
          inherited paBaseRegData1: TUniContainerPanel
            ScrollHeight = 965
            ScrollWidth = 1315
            object pgComplementData: TUniPageControl
              Left = 0
              Top = 0
              Width = 1315
              Height = 965
              Hint = ''
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              ActivePage = tabGeral
              Align = alClient
              TabOrder = 1
              object tabGeral: TUniTabSheet
                Hint = ''
                Caption = 'Geral'
                object sboxGridBlockTab1: TUniScrollBox
                  Left = 0
                  Top = 0
                  Width = 1307
                  Height = 935
                  Hint = ''
                  Align = alClient
                  TabOrder = 0
                  ScrollHeight = 268
                  ScrollWidth = 898
                  object rcBlock515: TUniContainerPanel
                    Tag = 4
                    Left = 81
                    Top = 246
                    Width = 729
                    Height = 22
                    Hint = '[[cols:12 | round:all]]'
                    ParentColor = False
                    TabOrder = 0
                  end
                  object rcBlock2: TUniContainerPanel
                    Tag = 1
                    AlignWithMargins = True
                    Left = 15
                    Top = 5
                    Width = 883
                    Height = 238
                    Hint = 
                      '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'round:no | '#13#10'cls:card-info-box-wh' +
                      'ite |'#13#10']]'
                    Margins.Left = 15
                    Margins.Top = 15
                    Margins.Right = 15
                    Margins.Bottom = 10
                    ParentColor = False
                    TabOrder = 1
                    object rcBlock3: TUniContainerPanel
                      Left = -1
                      Top = 0
                      Width = 884
                      Height = 36
                      Hint = '[['#13#10'cols:12 |'#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                      ParentColor = False
                      Color = clSilver
                      TabOrder = 0
                      DesignSize = (
                        884
                        36)
                      object labRcCollapseGeneral: TUniLabel
                        Left = 850
                        Top = 8
                        Width = 10
                        Height = 26
                        Hint = '[['#13#10'collapse:rcBlock2 off-42 '#13#10']]'#13#10
                        TextConversion = txtHTML
                        Caption = '^'
                        Anchors = [akTop, akRight]
                        ParentFont = False
                        Font.Height = -21
                        Font.Name = 'Calibri'
                        ParentColor = False
                        Color = clBlack
                        TabOrder = 1
                      end
                      object labTitleCardGeral: TUniLabel
                        Left = 8
                        Top = 8
                        Width = 197
                        Height = 19
                        Hint = ''
                        Caption = 'Manuten'#231#227'o de Lote Interno'
                        ParentFont = False
                        Font.Height = -16
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold]
                        TabOrder = 2
                      end
                    end
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
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 2
                      DesignSize = (
                        150
                        48)
                      object UniLabel5: TUniLabel
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
                        Tag = 1
                        Left = 3
                        Top = 18
                        Width = 144
                        Height = 29
                        Hint = ''
                        DataField = 'NUMERO'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                        ReadOnly = True
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
                      object UniLabel6: TUniLabel
                        Left = 2
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
                        Left = 2
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
                      object UniDBComboBox1: TUniDBComboBox
                        Tag = 1
                        Left = 2
                        Top = 19
                        Width = 145
                        Height = 29
                        Hint = ''
                        Anchors = [akLeft, akTop, akRight]
                        DataField = 'TIPO'
                        DataSource = dsMaster
                        Style = csDropDownList
                        Items.Strings = (
                          'ENTRADA'
                          'SAIDA')
                        TabOrder = 1
                        IconItems = <>
                      end
                      object UniLabel9: TUniLabel
                        Left = 7
                        Top = 1
                        Width = 45
                        Height = 15
                        Hint = ''
                        Caption = 'Atualiza'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock50: TUniContainerPanel
                      Tag = 1
                      Left = 3
                      Top = 61
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-4]]'
                      ParentColor = False
                      TabOrder = 5
                      DesignSize = (
                        150
                        48)
                      object UniLabel10: TUniLabel
                        Left = 3
                        Top = 0
                        Width = 22
                        Height = 15
                        Hint = ''
                        Caption = 'Lote'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniButtonDbEditLOTE: TUniButtonDbEdit
                        Left = 3
                        Top = 18
                        Width = 145
                        Height = 29
                        Hint = ''
                        DataField = 'LOTE'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                        Color = clInfoBk
                        OnButtonClick = UniButtonDbEditLOTEButtonClick
                        IconCls = 'search'
                      end
                    end
                    object rcBlock60: TUniContainerPanel
                      Tag = 1
                      Left = 196
                      Top = 61
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 6
                      DesignSize = (
                        150
                        48)
                      object UniLabel4: TUniLabel
                        Left = 2
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
                      object UniDBEditPRODUTO: TUniDBEdit
                        Left = 2
                        Top = 18
                        Width = 145
                        Height = 29
                        Hint = ''
                        DataField = 'PRODUTO'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                        Color = clInfoBk
                        ReadOnly = True
                      end
                    end
                    object rcBlock70: TUniContainerPanel
                      Tag = 1
                      Left = 382
                      Top = 61
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-6]]'
                      ParentColor = False
                      TabOrder = 7
                      DesignSize = (
                        150
                        48)
                      object UniDBEdit2: TUniDBEdit
                        Left = 3
                        Top = 18
                        Width = 144
                        Height = 29
                        Hint = ''
                        DataField = 'DESCRICAO'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        ReadOnly = True
                      end
                      object UniLabel7: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 55
                        Height = 15
                        Hint = ''
                        Caption = 'Descri'#231#227'o'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock80: TUniContainerPanel
                      Tag = 1
                      Left = 3
                      Top = 126
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-4]]'
                      ParentColor = False
                      TabOrder = 8
                      DesignSize = (
                        150
                        48)
                      object UniLabel14: TUniLabel
                        Left = 3
                        Top = 0
                        Width = 64
                        Height = 15
                        Hint = ''
                        Caption = 'Quantidade'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBFormattedNumberEditdescontos: TUniDBFormattedNumberEdit
                        Left = 3
                        Top = 17
                        Width = 144
                        Height = 29
                        Hint = ''
                        DataField = 'QUANTIDADE'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Color = clRed
                        TabOrder = 2
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                    end
                    object rcBlock90: TUniContainerPanel
                      Tag = 1
                      Left = 196
                      Top = 126
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-4]]'
                      ParentColor = False
                      TabOrder = 9
                      DesignSize = (
                        150
                        48)
                      object UniLabel8: TUniLabel
                        Left = 3
                        Top = 0
                        Width = 49
                        Height = 15
                        Hint = ''
                        Caption = '% Pureza'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                        Left = 3
                        Top = 17
                        Width = 144
                        Height = 29
                        Hint = ''
                        DataField = 'PUREZA'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Color = clRed
                        TabOrder = 2
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                        OnExit = UniDBFormattedNumberEdit1Exit
                      end
                    end
                    object rcBlock100: TUniContainerPanel
                      Tag = 1
                      Left = 382
                      Top = 126
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-4]]'
                      ParentColor = False
                      TabOrder = 10
                      DesignSize = (
                        150
                        48)
                      object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
                        Left = 3
                        Top = 17
                        Width = 144
                        Height = 29
                        Hint = ''
                        DataField = 'TOTALPONTOS'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Color = clRed
                        TabOrder = 1
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel11: TUniLabel
                        Left = 3
                        Top = 0
                        Width = 68
                        Height = 15
                        Hint = ''
                        Caption = 'Total Pontos'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
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
          ScrollHeight = 746
          ScrollWidth = 164
          inherited paSearchBtn: TUniContainerPanel
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
  inherited rcSweetAlert: TUniSweetAlert
    Left = 960
    Top = 26
  end
  inherited dsMaster: TDataSource
    Left = 938
    Top = 251
  end
  inherited dsSearchMaster: TDataSource
    Left = 1210
    Top = 413
  end
  inherited sqlSearchMaster: TFDQuery
    SQL.Strings = (
      'select * from MANUTENCAOLOTE_INTERNO')
    Left = 921
    Top = 355
    object FDQryFiltroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
    object FDQryFiltroNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object FDQryFiltroLOTE: TStringField
      FieldName = 'LOTE'
      Origin = 'LOTE'
      Size = 30
    end
    object FDQryFiltroPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
    end
    object FDQryFiltroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object FDQryFiltroQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Precision = 18
    end
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'MANUTENCAOLOTE_INTERNO'
    SQL.Strings = (
      'select * from MANUTENCAOLOTE_INTERNO where codigo = :codigo')
    Left = 835
    Top = 257
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  inherited popMenuOptions: TUniPopupMenu
    Left = 418
    Top = 16
  end
  inherited FDSchemaAdapter1: TFDSchemaAdapter
    Left = 822
    Top = 390
  end
  inherited FDQryCad: TFDQuery
    Left = 1193
    Top = 166
  end
  inherited dscrud: TDataSource
    Left = 1115
    Top = 174
  end
  inherited FDQryFiltro: TFDQuery
    Left = 1121
    Top = 326
  end
  inherited FDQryCaddetails: TFDQuery
    Left = 785
    Top = 31
  end
  inherited dscruddetails: TDataSource
    Left = 883
    Top = 23
  end
end
