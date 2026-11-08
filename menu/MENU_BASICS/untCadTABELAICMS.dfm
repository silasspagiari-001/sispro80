inherited frmcadTABELAICMS: TfrmcadTABELAICMS
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 610
      ScrollWidth = 37
    end
    inherited pgBaseCadControl: TUniPageControl
      ActivePage = tabSearch
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
                Width = 50
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'ORIGEM'
                Title.Caption = 'ORIGEM'
                Width = 80
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'DESTINO'
                Title.Caption = 'DESTINO'
                Width = 80
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'PORCENTAGEM'
                Title.Caption = '% ALIQUOTA'
                Width = 100
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
                ScrollHeight = 50
                ScrollWidth = 858
                object rcBlock10: TUniContainerPanel
                  Tag = 1
                  Left = 1
                  Top = 2
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
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
                  Left = 194
                  Top = 2
                  Width = 52
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
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
                  Left = 370
                  Top = 2
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    150
                    48)
                  object UniDBComboBox4: TUniDBComboBox
                    Left = 5
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'ORIGEM'
                    DataSource = dsMaster
                    Style = csDropDownList
                    Items.Strings = (
                      'SP'
                      'PR'
                      'MT'
                      'MS'
                      'SC'
                      'RJ'
                      'TO'
                      'PA'
                      'AM'
                      'AC'
                      'PB'
                      'RN'
                      'SE'
                      'PE'
                      'MG'
                      'ES'
                      'RO'
                      'AP'
                      'AL'
                      'CE'
                      'BA'
                      'DF'
                      'GO'
                      'MA'
                      'NO'
                      'RS'
                      'PI'
                      'RR'
                      'EX'
                      'BR'
                      '')
                    ItemIndex = 0
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel5: TUniLabel
                    Left = 5
                    Top = 0
                    Width = 40
                    Height = 15
                    Hint = ''
                    Caption = 'Origem'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock40: TUniContainerPanel
                  Tag = 1
                  Left = 540
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
                    Left = 4
                    Top = 0
                    Width = 41
                    Height = 15
                    Hint = ''
                    Caption = 'Destino'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBComboBox1: TUniDBComboBox
                    Left = 4
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'DESTINO'
                    DataSource = dsMaster
                    Style = csDropDownList
                    Items.Strings = (
                      'SP'
                      'PR'
                      'MT'
                      'MS'
                      'SC'
                      'RJ'
                      'TO'
                      'PA'
                      'AM'
                      'AC'
                      'PB'
                      'RN'
                      'SE'
                      'PE'
                      'MG'
                      'ES'
                      'RO'
                      'AP'
                      'AL'
                      'CE'
                      'BA'
                      'DF'
                      'GO'
                      'MA'
                      'NO'
                      'RS'
                      'PI'
                      'RR'
                      'EX'
                      'BR'
                      '')
                    ItemIndex = 0
                    TabOrder = 2
                    IconItems = <>
                  end
                end
                object rcBlock50: TUniContainerPanel
                  Tag = 1
                  Left = 708
                  Top = 2
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 4
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit
                    AlignWithMargins = True
                    Left = 5
                    Top = 18
                    Width = 142
                    Height = 29
                    Hint = ''
                    DataField = 'PORCENTAGEM'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight, akBottom]
                    ParentFont = False
                    Font.Color = clBlue
                    Font.Height = -13
                    Font.Style = [fsBold, fsItalic]
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel7: TUniLabel
                    Left = 5
                    Top = 0
                    Width = 59
                    Height = 15
                    Hint = ''
                    Caption = '% Aliquota'
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
      'select * from tabelaicms')
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'TABELAICMS'
    SQL.Strings = (
      'select * from tabelaicms where codigo = :codigo')
    ParamData = <
      item
        Name = 'CODIGO'
        ParamType = ptInput
      end>
  end
end
