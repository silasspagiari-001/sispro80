inherited frmcadCBNEF: TfrmcadCBNEF
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 610
      ScrollWidth = 37
    end
    inherited pgBaseCadControl: TUniPageControl
      ActivePage = tabRegister
      inherited tabSearch: TUniTabSheet
        inherited paBaseRegSearch: TUniContainerPanel
          Height = 582
          inherited paSearchFilters: TUniPanel
            Height = 582
            inherited UniScrollBox1: TUniScrollBox
              Height = 582
              ScrollHeight = 270
              ScrollWidth = 262
            end
          end
          inherited dbgSearchCRUD: TUniDBGrid
            Height = 582
            Columns = <
              item
                FieldName = 'CODIGO'
                Title.Caption = 'CODIGO'
                Width = 64
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'CODCBNEF'
                Title.Caption = 'CBNEF-SP'
                Width = 80
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'DESCRICAO'
                Title.Caption = 'DESCRICAO'
                Width = 300
                Font.Name = 'Calibri'
              end>
          end
        end
      end
      inherited tabRegister: TUniTabSheet
        inherited paBaseRegData1: TUniContainerPanel
          Height = 582
          ScrollHeight = 580
          ScrollWidth = 975
          inherited UniPageControlcadastros: TUniPageControl
            inherited UniTabSheetCRUD: TUniTabSheet
              inherited UniScrollBox2: TUniScrollBox
                ScrollHeight = 344
                ScrollWidth = 532
                object rcBlock10: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 3
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
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
                    DataSource = dscrud
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
                  Width = 46
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-1]]'
                  ParentColor = False
                  TabOrder = 1
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
                    TabOrder = 1
                  end
                  object UniDBCheckBox1: TUniDBCheckBox
                    Left = 19
                    Top = 25
                    Width = 14
                    Height = 17
                    Hint = ''
                    DataField = 'ATIVO'
                    DataSource = dscrud
                    ValueChecked = 'T'
                    ValueUnchecked = 'F'
                    Caption = ''
                    TabOrder = 2
                    ParentColor = False
                    Color = clBtnFace
                  end
                end
                object rcBlock30: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 3
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-9]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    150
                    48)
                  object UniLabel5: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 55
                    Height = 15
                    Hint = ''
                    Caption = 'Descri'#231#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit1: TUniDBEdit
                    Left = 2
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'DESCRICAO'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock40: TUniContainerPanel
                  Left = 3
                  Top = 57
                  Width = 529
                  Height = 48
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    529
                    48)
                  object UniDBEdit2: TUniDBEdit
                    Left = 3
                    Top = 16
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'CODCBNEF'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel6: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 92
                    Height = 15
                    Hint = ''
                    Caption = 'Codigo CBNEF-SP'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock50: TUniContainerPanel
                  Left = 3
                  Top = 111
                  Width = 529
                  Height = 48
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  TabOrder = 4
                  DesignSize = (
                    529
                    48)
                  object UniDBEdit3: TUniDBEdit
                    Left = 3
                    Top = 16
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'DISPOSITIVO'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel7: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 62
                    Height = 15
                    Hint = ''
                    Caption = 'Dispositivo'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock60: TUniContainerPanel
                  Left = 3
                  Top = 162
                  Width = 529
                  Height = 128
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    529
                    128)
                  object UniLabel8: TUniLabel
                    Left = 1
                    Top = 3
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
                    Top = 24
                    Width = 523
                    Height = 101
                    Hint = ''
                    DataField = 'OBSERVACAO'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
                object rcBlock70: TUniContainerPanel
                  Left = 3
                  Top = 296
                  Width = 529
                  Height = 48
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  TabOrder = 6
                  DesignSize = (
                    529
                    48)
                  object UniLabel9: TUniLabel
                    Left = 5
                    Top = 0
                    Width = 92
                    Height = 15
                    Hint = ''
                    Caption = 'Codigo CBNEF-SP'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit4: TUniDBEdit
                    Left = 3
                    Top = 16
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'CST'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
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
  inherited FDQryFiltro: TFDQuery
    UpdateOptions.UpdateTableName = 'CBNEF'
    SQL.Strings = (
      'select * from CBNEF')
  end
  inherited FDQryCad: TFDQuery
    UpdateOptions.UpdateTableName = 'CBNEF'
    SQL.Strings = (
      'select * from CBNEF where codigo = :codigo')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
