inherited frmCADTOLERANCIA: TfrmCADTOLERANCIA
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 605
      ScrollWidth = 37
    end
    inherited pgBaseCadControl: TUniPageControl
      ActivePage = tabRegister
      inherited tabSearch: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 954
        ExplicitHeight = 572
        inherited paBaseRegSearch: TUniContainerPanel
          ExplicitHeight = 572
          inherited paSearchFilters: TUniPanel
            ExplicitHeight = 572
            inherited UniScrollBox1: TUniScrollBox
              ExplicitHeight = 572
              ScrollHeight = 270
              ScrollWidth = 262
            end
          end
          inherited dbgSearchCRUD: TUniDBGrid
            Columns = <
              item
                FieldName = 'ESPECIE_DESCRICAO'
                Title.Caption = 'ESPECIE_DESCRICAO'
                Width = 300
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'AMOSTRA_MEDIA'
                Title.Caption = 'AMOSTRA_MEDIA'
                Width = 100
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'REFERENCIA'
                Title.Caption = 'REFER'#202'NCIA'
                Width = 120
                Font.Name = 'Calibri'
              end>
          end
        end
      end
      inherited tabRegister: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 954
        ExplicitHeight = 572
        inherited paBaseRegData1: TUniContainerPanel
          ExplicitHeight = 572
          ScrollHeight = 572
          ScrollWidth = 954
          inherited UniPageControlcadastros: TUniPageControl
            inherited UniTabSheetCRUD: TUniTabSheet
              ExplicitLeft = 4
              ExplicitTop = 24
              ExplicitWidth = 946
              ExplicitHeight = 544
              inherited UniScrollBox2: TUniScrollBox
                ScrollHeight = 228
                ScrollWidth = 708
                object rcBlock10: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 3
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 0
                  DesignSize = (
                    150
                    48)
                  object UniLabel3: TUniLabel
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
                  object edCodigo: TUniDBEdit
                    Left = 1
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
                  Width = 47
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-1]]'
                  ParentColor = False
                  TabOrder = 1
                  object UniDBCheckBox1: TUniDBCheckBox
                    Left = 19
                    Top = 25
                    Width = 14
                    Height = 17
                    Hint = ''
                    DataField = 'ATIVO'
                    DataSource = dsMaster
                    ValueChecked = 'T'
                    ValueUnchecked = 'F'
                    Caption = ''
                    TabOrder = 1
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object UniLabel4: TUniLabel
                    Left = 8
                    Top = 0
                    Width = 27
                    Height = 15
                    Hint = ''
                    Caption = 'Ativo'
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
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEditESPECIE: TUniButtonDbEdit
                    Tag = 1
                    Left = 3
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    DataField = 'ESPECIE'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    OnExit = UniButtonDbEditESPECIEExit
                    OnButtonClick = UniButtonDbEditESPECIEButtonClick
                    IconCls = 'search'
                  end
                  object UniLabel5: TUniLabel
                    Left = 0
                    Top = 0
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
                object rcBlock40: TUniContainerPanel
                  Tag = 1
                  Left = 558
                  Top = 2
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-7]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit1: TUniDBEdit
                    Tag = 1
                    Left = 2
                    Top = 19
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'ESPECIE_DESCRICAO'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    ReadOnly = True
                  end
                  object UniLabel6: TUniLabel
                    Left = 0
                    Top = 1
                    Width = 116
                    Height = 15
                    Hint = ''
                    Caption = 'Descri'#231#227'o da Esp'#233'cie'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock50: TUniContainerPanel
                  Left = 3
                  Top = 63
                  Width = 705
                  Height = 25
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  Color = clSkyBlue
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 4
                  object UniLabel18: TUniLabel
                    AlignWithMargins = True
                    Left = 2
                    Top = 4
                    Width = 251
                    Height = 19
                    Hint = '[[cols:12 | round:all]]'
                    Margins.Left = 6
                    Margins.Top = 6
                    Margins.Right = 6
                    Margins.Bottom = 6
                    AutoSize = False
                    Caption = 'AMOSTRA DE TRABALHO DOSN (g)'
                    ParentFont = False
                    Font.Color = clGray
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                end
                object rcBlock60: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 95
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'AMOSTRA_MEDIA'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    DecimalPrecision = 0
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel7: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 46
                    Height = 15
                    Hint = ''
                    Caption = 'Amostra'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock70: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 95
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 6
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'AMOSTRA_DOSN_MIN'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    DecimalPrecision = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel8: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 71
                    Height = 15
                    Hint = ''
                    Caption = 'Peso M'#237'nimo'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock80: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 95
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 7
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'AMOSTRA_DOSN_MAX'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel9: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 101
                    Height = 15
                    Hint = ''
                    Caption = 'Peso M'#225'ximo (3%)'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock90: TUniContainerPanel
                  Left = 3
                  Top = 150
                  Width = 705
                  Height = 24
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  Color = clSkyBlue
                  TabOrder = 8
                  object UniLabel10: TUniLabel
                    AlignWithMargins = True
                    Left = 2
                    Top = 2
                    Width = 251
                    Height = 19
                    Hint = '[[cols:12 | round:all]]'
                    Margins.Left = 6
                    Margins.Top = 6
                    Margins.Right = 6
                    Margins.Bottom = 6
                    AutoSize = False
                    Caption = 'AMOSTRA DE TRABALHO PUREZA'
                    ParentFont = False
                    Font.Color = clGray
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                end
                object rcBlock100: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 180
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 9
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'AMOSTRA_PUREZA_MIN'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel11: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 71
                    Height = 15
                    Hint = ''
                    Caption = 'Peso M'#237'nimo'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock110: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 180
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 10
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 19
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'AMOSTRA_PUREZA_MAX'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel12: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 101
                    Height = 15
                    Hint = ''
                    Caption = 'Peso M'#225'ximo (3%)'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock120: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 180
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 11
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit2: TUniDBEdit
                    Tag = 1
                    Left = 2
                    Top = 19
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'REFERENCIA'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel13: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 58
                    Height = 15
                    Hint = ''
                    Caption = 'Refer'#234'ncia'
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
  inherited sqlSearchMaster: TFDQuery
    SQL.Strings = (
      'SELECT * FROM TOLERANCIA')
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'TOLERANCIA'
    SQL.Strings = (
      'SELECT * FROM TOLERANCIA WHERE CODIGO = :table_pk')
  end
end
