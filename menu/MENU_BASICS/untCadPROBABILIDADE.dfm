inherited frmCADPROBABILIDADE: TfrmCADPROBABILIDADE
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 605
      ScrollWidth = 37
    end
    inherited pgBaseCadControl: TUniPageControl
      ActivePage = tabRegister
      inherited tabSearch: TUniTabSheet
        ExplicitTop = 24
        ExplicitHeight = 572
        inherited paBaseRegSearch: TUniContainerPanel
          Height = 572
          inherited paSearchFilters: TUniPanel
            Height = 572
            inherited UniScrollBox1: TUniScrollBox
              Height = 572
              ScrollHeight = 270
              ScrollWidth = 262
            end
          end
          inherited dbgSearchCRUD: TUniDBGrid
            Height = 572
            Columns = <
              item
                FieldName = 'CODIGO'
                Title.Caption = 'CODIGO'
                Width = 64
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'BASE'
                Title.Caption = 'BASE'
                Width = 120
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'MEDIA'
                Title.Caption = 'M'#201'DIA'
                Width = 120
                Font.Name = 'Calibri'
              end>
          end
        end
      end
      inherited tabRegister: TUniTabSheet
        ExplicitTop = 24
        ExplicitHeight = 572
        inherited paBaseRegData1: TUniContainerPanel
          Height = 572
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
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
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
                  Width = 47
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
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
                    DataSource = dsMaster
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
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    150
                    48)
                  object UniLabel5: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 26
                    Height = 15
                    Hint = ''
                    Caption = 'BASE'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 18
                    Width = 121
                    Height = 29
                    Hint = ''
                    DataField = 'BASE'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    DecimalPrecision = 0
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
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
                  TabOrder = 3
                  DesignSize = (
                    150
                    48)
                  object UniLabel6: TUniLabel
                    Left = 2
                    Top = 1
                    Width = 36
                    Height = 15
                    Hint = ''
                    Caption = 'M'#201'DIA'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
                    Left = 2
                    Top = 19
                    Width = 121
                    Height = 29
                    Hint = ''
                    DataField = 'MEDIA'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    DecimalPrecision = 0
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
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
      'SELECT * FROM PROBABILIDADE')
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'PROBABILIDADE'
    SQL.Strings = (
      'SELECT * FROM PROBABILIDADE WHERE CODIGO = :table_pk')
  end
end
