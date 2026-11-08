inherited frmCADGRUPOSESPECIE: TfrmCADGRUPOSESPECIE
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 605
      ScrollWidth = 37
    end
    inherited pgBaseCadControl: TUniPageControl
      inherited tabSearch: TUniTabSheet
        ExplicitTop = 24
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
                FieldName = 'CODIGO'
                Title.Caption = 'CODIGO'
                Width = 64
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'DESCRICAO'
                Title.Caption = 'DESCRI'#199#195'O'
                Width = 300
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'TIPO'
                Title.Caption = 'TIPO'
                Width = 100
                Font.Name = 'Calibri'
              end>
          end
        end
      end
      inherited tabRegister: TUniTabSheet
        ExplicitTop = 24
        ExplicitHeight = 572
        inherited paBaseRegData1: TUniContainerPanel
          ExplicitHeight = 572
          ScrollHeight = 572
          ScrollWidth = 954
          inherited UniPageControlcadastros: TUniPageControl
            inherited UniTabSheetCRUD: TUniTabSheet
              inherited UniScrollBox2: TUniScrollBox
                ScrollHeight = 51
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
                  object edCodigo: TUniDBEdit
                    Left = 1
                    Top = 18
                    Width = 121
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
                    Left = 0
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
                  Left = 196
                  Top = 3
                  Width = 46
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-1]]'
                  ParentColor = False
                  TabOrder = 1
                  object UniDBCheckBox1: TUniDBCheckBox
                    Left = 15
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
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit1: TUniDBEdit
                    Left = 2
                    Top = 18
                    Width = 121
                    Height = 29
                    Hint = ''
                    DataField = 'DESCRICAO'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
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
                    TabOrder = 2
                  end
                end
                object rcBlock40: TUniContainerPanel
                  Tag = 1
                  Left = 558
                  Top = 2
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    150
                    48)
                  object UniDBComboBox1: TUniDBComboBox
                    Tag = 1
                    Left = 0
                    Top = 19
                    Width = 145
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'TIPO'
                    DataSource = dsMaster
                    Style = csDropDownList
                    Items.Strings = (
                      'Outros'
                      'Aveia preta'
                      'Aveia branca'
                      'Feijao'
                      'Milho'
                      'Soja'
                      'Amendoim'
                      'Forrageira'
                      '')
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel6: TUniLabel
                    Left = 0
                    Top = 1
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
              end
            end
          end
        end
      end
    end
  end
  inherited sqlSearchMaster: TFDQuery
    SQL.Strings = (
      'SELECT * FROM GRUPOSESPECIE')
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'GRUPOSESPECIE'
    SQL.Strings = (
      'SELECT * FROM GRUPOSESPECIE WHERE CODIGO = :table_pk')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
