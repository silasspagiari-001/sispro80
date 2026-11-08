inherited frmcadPRODUTOS: TfrmcadPRODUTOS
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 610
      ScrollWidth = 37
    end
    inherited pgBaseCadControl: TUniPageControl
      ActivePage = tabRegister
      inherited tabSearch: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 975
        ExplicitHeight = 582
        inherited paBaseRegSearch: TUniContainerPanel
          ExplicitHeight = 582
          inherited paSearchFilters: TUniPanel
            ExplicitHeight = 582
            inherited UniScrollBox1: TUniScrollBox
              ExplicitHeight = 582
              ScrollHeight = 270
              ScrollWidth = 262
            end
          end
          inherited dbgSearchCRUD: TUniDBGrid
            OnMouseDown = dbgSearchCRUDMouseDown
            Columns = <
              item
                FieldName = 'UNIDADE'
                Title.Caption = ' '
                Width = 30
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
              item
                FieldName = 'CODIGO'
                Title.Caption = 'CODIGO'
                Width = 70
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'DESCRICAO'
                Title.Caption = 'DESCRI'#199#195'O'
                Width = 300
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'CULTIVAR'
                Title.Caption = 'CULTIVAR'
                Width = 200
                Font.Name = 'Calibri'
              end>
          end
        end
      end
      inherited tabRegister: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 975
        ExplicitHeight = 582
        inherited paBaseRegData1: TUniContainerPanel
          ExplicitHeight = 582
          ScrollHeight = 582
          ScrollWidth = 975
          inherited UniPageControlcadastros: TUniPageControl
            inherited UniTabSheetCRUD: TUniTabSheet
              ExplicitLeft = 4
              ExplicitTop = 24
              ExplicitWidth = 967
              ExplicitHeight = 554
              inherited UniScrollBox2: TUniScrollBox
                ScrollHeight = 511
                ScrollWidth = 933
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
                  Width = 59
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 1
                  object UniLabel7: TUniLabel
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
                  Left = 372
                  Top = 3
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    150
                    48)
                  object UniDBComboBoxmedida: TUniDBComboBox
                    Tag = 1
                    Left = 2
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'UNIDADE'
                    DataSource = dscrud
                    Style = csDropDownList
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel4: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 91
                    Height = 15
                    Hint = ''
                    Caption = 'Unidade Medida'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock40: TUniContainerPanel
                  Tag = 1
                  Left = 542
                  Top = 3
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEditGRUPOS: TUniButtonDbEdit
                    Tag = 1
                    Left = 3
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    DataField = 'GRUPO'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    OnExit = UniButtonDbEditGRUPOSExit
                    OnButtonClick = UniButtonDbEditGRUPOSButtonClick
                    IconCls = 'search'
                  end
                  object UniLabel5: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 34
                    Height = 15
                    Hint = ''
                    Caption = 'Grupo'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock50: TUniContainerPanel
                  Tag = 1
                  Left = 705
                  Top = 3
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 4
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit6: TUniDBEdit
                    Left = 4
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'NOMEGRUPO'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel6: TUniLabel
                    Left = 4
                    Top = 0
                    Width = 109
                    Height = 15
                    Hint = ''
                    Caption = 'Descri'#231#227'o do Grupo'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock60: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 72
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    150
                    48)
                  object UniLabel8: TUniLabel
                    Left = 5
                    Top = 2
                    Width = 41
                    Height = 15
                    Hint = ''
                    Caption = 'Esp'#233'cie'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniButtonDbEditespecie: TUniButtonDbEdit
                    Tag = 1
                    Left = 3
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    DataField = 'CODIGO_ESPECIE'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    Color = clInfoBk
                    OnExit = UniButtonDbEditespecieExit
                    OnButtonClick = UniButtonDbEditespecieButtonClick
                    IconCls = 'search'
                  end
                end
                object rcBlock70: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 72
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 6
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit1: TUniDBEdit
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'SEMENTENOME'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel9: TUniLabel
                    Left = 3
                    Top = 2
                    Width = 99
                    Height = 15
                    Hint = ''
                    Caption = 'Descri'#231#227'o Esp'#233'cie'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock80: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 72
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 7
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEditcodigocultivar: TUniButtonDbEdit
                    Tag = 1
                    Left = 2
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    DataField = 'CODIGO_CULTIVAR'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    OnExit = UniButtonDbEditcodigocultivarExit
                    OnButtonClick = UniButtonDbEditcodigocultivarButtonClick
                    IconCls = 'search'
                  end
                  object UniLabel10: TUniLabel
                    Left = 2
                    Top = 2
                    Width = 43
                    Height = 15
                    Hint = ''
                    Caption = 'Cultivar'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock90: TUniContainerPanel
                  Tag = 1
                  Left = 558
                  Top = 71
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 8
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit2: TUniDBEdit
                    Left = 3
                    Top = 19
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'CULTIVAR'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel11: TUniLabel
                    Left = 3
                    Top = 3
                    Width = 101
                    Height = 15
                    Hint = ''
                    Caption = 'Descri'#231#227'o Cultivar'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock100: TUniContainerPanel
                  Left = 3
                  Top = 131
                  Width = 705
                  Height = 48
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  TabOrder = 9
                  DesignSize = (
                    705
                    48)
                  object UniDBEdit3: TUniDBEdit
                    Tag = 1
                    Left = 3
                    Top = 17
                    Width = 699
                    Height = 29
                    Hint = ''
                    DataField = 'DESCRICAO'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel12: TUniLabel
                    Left = 5
                    Top = 1
                    Width = 99
                    Height = 15
                    Hint = ''
                    Caption = 'Descri'#231#227'o do Item'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock110: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 187
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 10
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit4: TUniDBEdit
                    Tag = 1
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'NUMERONCM'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel13: TUniLabel
                    Left = 5
                    Top = 0
                    Width = 81
                    Height = 15
                    Hint = ''
                    Caption = 'Numero N.C.M.'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock120: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 187
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 11
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEditPERCIPI: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'ALIQUOTAIPI'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clRed
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel14: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 31
                    Height = 15
                    Hint = ''
                    Caption = '% I.P.I'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock130: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 187
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 12
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'PESOLIQUIDO'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clRed
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel15: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 70
                    Height = 15
                    Hint = ''
                    Caption = 'Peso Liquido'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock140: TUniContainerPanel
                  Tag = 1
                  Left = 558
                  Top = 186
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 13
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'PESOBRUTO'
                    DataSource = dscrud
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clRed
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel16: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 59
                    Height = 15
                    Hint = ''
                    Caption = 'Peso Bruto'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock150: TUniContainerPanel
                  Left = 3
                  Top = 248
                  Width = 852
                  Height = 25
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  Color = clSkyBlue
                  TabOrder = 14
                  object UniLabel18: TUniLabel
                    AlignWithMargins = True
                    Left = 6
                    Top = 4
                    Width = 251
                    Height = 19
                    Hint = '[[cols:12 | round:all]]'
                    Margins.Left = 6
                    Margins.Top = 6
                    Margins.Right = 6
                    Margins.Bottom = 6
                    AutoSize = False
                    Caption = 'DETALHES FISCAIS DO ITEM'
                    ParentFont = False
                    Font.Color = clGray
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                end
                object rcBlock160: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 280
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 15
                  DesignSize = (
                    150
                    48)
                  object UniDBComboBox1: TUniDBComboBox
                    Tag = 1
                    Left = 3
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'SITUACAOLOCAL'
                    DataSource = dscruddetails
                    Style = csDropDownList
                    Items.Strings = (
                      '0101'
                      '0102'
                      '0103'
                      '0202'
                      '0400'
                      '0500'
                      '0900'
                      '000'
                      '010'
                      '020'
                      '030'
                      '040'
                      '050'
                      '060'
                      '070'
                      '080'
                      '090')
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel17: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 110
                    Height = 15
                    Hint = ''
                    Caption = 'CST - DENTRO DO UF'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock170: TUniContainerPanel
                  Tag = 1
                  Left = 159
                  Top = 280
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 16
                  DesignSize = (
                    150
                    48)
                  object UniDBComboBox2: TUniDBComboBox
                    Tag = 1
                    Left = 3
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'SITUACAOOUTRAS'
                    DataSource = dscruddetails
                    Style = csDropDownList
                    Items.Strings = (
                      '0101'
                      '0102'
                      '0103'
                      '0202'
                      '0400'
                      '0500'
                      '0900'
                      '000'
                      '010'
                      '020'
                      '030'
                      '040'
                      '050'
                      '060'
                      '070'
                      '080'
                      '090')
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel19: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 95
                    Height = 15
                    Hint = ''
                    Caption = 'CST - FORA DO UF'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock180: TUniContainerPanel
                  Tag = 1
                  Left = 315
                  Top = 279
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 17
                  DesignSize = (
                    150
                    48)
                  object UniLabel20: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 17
                    Height = 15
                    Hint = ''
                    Caption = 'PIS'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBComboBox3: TUniDBComboBox
                    Tag = 1
                    Left = 3
                    Top = 18
                    Width = 145
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'PIS'
                    DataSource = dscruddetails
                    Style = csDropDownList
                    Items.Strings = (
                      '01'
                      '02'
                      '03'
                      '04'
                      '05'
                      '06'
                      '07'
                      '08'
                      '09'
                      '49'
                      '')
                    TabOrder = 2
                    IconItems = <>
                  end
                end
                object rcBlock190: TUniContainerPanel
                  Tag = 1
                  Left = 627
                  Top = 279
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 19
                  DesignSize = (
                    150
                    48)
                  object UniDBComboBox4: TUniDBComboBox
                    Tag = 1
                    Left = 3
                    Top = 19
                    Width = 145
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'COFINS'
                    DataSource = dscruddetails
                    Style = csDropDownList
                    Items.Strings = (
                      '06'
                      '50'
                      '51'
                      '52'
                      '53'
                      '54'
                      '55'
                      '56'
                      '60'
                      '61'
                      '62'
                      '63'
                      '64'
                      '65'
                      '66'
                      '67'
                      '70'
                      '71'
                      '72'
                      '73'
                      '74'
                      '75'
                      '98'
                      '99'
                      '')
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel21: TUniLabel
                    Left = 4
                    Top = 1
                    Width = 40
                    Height = 15
                    Hint = ''
                    Caption = 'COFINS'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock200: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 336
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 21
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 16
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'BASE0'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clRed
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel22: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 43
                    Height = 15
                    Hint = ''
                    Caption = 'BASE - 0'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock210: TUniContainerPanel
                  Tag = 1
                  Left = 159
                  Top = 337
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 22
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 16
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'ICMS0'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clRed
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel23: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 45
                    Height = 15
                    Hint = ''
                    Caption = 'ICMS - 0'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock185: TUniContainerPanel
                  Tag = 1
                  Left = 471
                  Top = 281
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 18
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 16
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'VLRPIS'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clRed
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel24: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 49
                    Height = 15
                    Hint = ''
                    Caption = 'Valor PIS'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock195: TUniContainerPanel
                  Tag = 1
                  Left = 783
                  Top = 279
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 20
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'VLRCOFINS'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clRed
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel25: TUniLabel
                    Left = 3
                    Top = 1
                    Width = 72
                    Height = 15
                    Hint = ''
                    Caption = 'Valor COFINS'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock220: TUniContainerPanel
                  Tag = 1
                  Left = 315
                  Top = 335
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 23
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'BASE1'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clRed
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel26: TUniLabel
                    Left = 3
                    Top = 2
                    Width = 43
                    Height = 15
                    Hint = ''
                    Caption = 'BASE - 1'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock230: TUniContainerPanel
                  Tag = 1
                  Left = 471
                  Top = 335
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 24
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'ICMS1'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clRed
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel27: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 45
                    Height = 15
                    Hint = ''
                    Caption = 'ICMS - 1'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock300: TUniContainerPanel
                  Tag = 1
                  Left = 14
                  Top = 463
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 31
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
                    DataField = 'CLASSTRIB'
                    DataSource = dscrud
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel30: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 92
                    Height = 15
                    Hint = ''
                    Caption = 'Class Tributa'#231#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock310: TUniContainerPanel
                  Tag = 1
                  Left = 170
                  Top = 463
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 32
                  DesignSize = (
                    150
                    48)
                  object UniDBComboBox5: TUniDBComboBox
                    Tag = 1
                    Left = 3
                    Top = 19
                    Width = 145
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'TIPOTRIB'
                    DataSource = dscrud
                    Style = csDropDownList
                    Items.Strings = (
                      ''
                      '200'
                      '400'
                      '000')
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel31: TUniLabel
                    Left = 3
                    Top = 1
                    Width = 86
                    Height = 15
                    Hint = ''
                    Caption = 'Tipo Tributa'#231#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock240: TUniContainerPanel
                  Tag = 1
                  Left = 627
                  Top = 333
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 25
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'BASE2'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clRed
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel28: TUniLabel
                    Left = 3
                    Top = 1
                    Width = 43
                    Height = 15
                    Hint = ''
                    Caption = 'BASE - 2'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock250: TUniContainerPanel
                  Tag = 1
                  Left = 783
                  Top = 331
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 26
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit10: TUniDBFormattedNumberEdit
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'ICMS2'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clRed
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel29: TUniLabel
                    Left = 3
                    Top = 1
                    Width = 45
                    Height = 15
                    Hint = ''
                    Caption = 'ICMS - 2'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock260: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 391
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 27
                  DesignSize = (
                    150
                    48)
                  object UniButtonDbEditcbnef: TUniButtonDbEdit
                    Left = 3
                    Top = 15
                    Width = 145
                    Height = 29
                    Hint = ''
                    DataField = 'BENEFICIOLC'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                    OnButtonClick = UniButtonDbEditcbnefButtonClick
                    IconCls = 'search'
                  end
                  object UniLabel32: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 86
                    Height = 15
                    Hint = ''
                    Caption = 'C'#243'd Benef Local'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock320: TUniContainerPanel
                  Tag = 1
                  Left = 326
                  Top = 463
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 33
                  DesignSize = (
                    150
                    48)
                  object UniDBComboBox6: TUniDBComboBox
                    Tag = 1
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'ORIGEM'
                    DataSource = dscrud
                    Style = csDropDownList
                    Items.Strings = (
                      'Nacional'
                      'Importacao'
                      'Interno')
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel33: TUniLabel
                    Left = 2
                    Top = 1
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
                object rcBlock270: TUniContainerPanel
                  Tag = 1
                  Left = 166
                  Top = 389
                  Width = 116
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 28
                  DesignSize = (
                    116
                    48)
                  object UniLabel34: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 104
                    Height = 15
                    Hint = ''
                    Caption = 'C'#243'd Benef Regi'#227'o 1'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniButtonDbEditcbnef1: TUniButtonDbEdit
                    Left = 3
                    Top = 17
                    Width = 111
                    Height = 29
                    Hint = ''
                    DataField = 'BENEFICIO01'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    Color = clInfoBk
                    OnButtonClick = UniButtonDbEditcbnef1ButtonClick
                    IconCls = 'search'
                  end
                end
                object rcBlock280: TUniContainerPanel
                  Tag = 1
                  Left = 296
                  Top = 389
                  Width = 116
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 29
                  DesignSize = (
                    116
                    48)
                  object UniLabel35: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 104
                    Height = 15
                    Hint = ''
                    Caption = 'C'#243'd Benef Regi'#227'o 2'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniButtonDbEditcbnef2: TUniButtonDbEdit
                    Left = 3
                    Top = 17
                    Width = 111
                    Height = 29
                    Hint = ''
                    DataField = 'BENEFICIO02'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    Color = clInfoBk
                    OnButtonClick = UniButtonDbEditcbnef2ButtonClick
                    IconCls = 'search'
                  end
                end
                object rcBlock290: TUniContainerPanel
                  Tag = 1
                  Left = 474
                  Top = 389
                  Width = 118
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 30
                  DesignSize = (
                    118
                    48)
                  object UniLabel36: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 93
                    Height = 15
                    Hint = ''
                    Caption = 'C'#243'd Benef CST 90'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniButtonDbEditcbnef90: TUniButtonDbEdit
                    Left = 3
                    Top = 17
                    Width = 111
                    Height = 29
                    Hint = ''
                    DataField = 'BENEFICIO90'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    Color = clInfoBk
                    OnButtonClick = UniButtonDbEditcbnef90ButtonClick
                    IconCls = 'search'
                  end
                end
                object rcBlock295: TUniContainerPanel
                  Tag = 1
                  Left = 631
                  Top = 387
                  Width = 118
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 34
                  DesignSize = (
                    118
                    48)
                  object UniLabel37: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 70
                    Height = 15
                    Hint = ''
                    Caption = 'C'#243'd Benef EX'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniButtonDbEdit1: TUniButtonDbEdit
                    Left = 3
                    Top = 17
                    Width = 111
                    Height = 29
                    Hint = ''
                    DataField = 'BENEFICIOEX'
                    DataSource = dscruddetails
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    Color = clInfoBk
                    OnButtonClick = UniButtonDbEdit1ButtonClick
                    IconCls = 'search'
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
    SQL.Strings = (
      'SELECT * FROM PRODUTOS')
    object FDQryFiltroCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object FDQryFiltroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object FDQryFiltroCULTIVAR: TStringField
      FieldName = 'CULTIVAR'
      Size = 200
    end
    object FDQryFiltroUNIDADE: TStringField
      FieldName = 'UNIDADE'
      OnGetText = FDQryFiltroUNIDADEGetText
    end
  end
  inherited FDQryCad: TFDQuery
    UpdateOptions.UpdateTableName = 'PRODUTOS'
    SQL.Strings = (
      'SELECT * FROM PRODUTOS WHERE CODIGO = :CODIGO')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  inherited FDQryCaddetails: TFDQuery
    UpdateOptions.UpdateTableName = 'SALDOS'
    SQL.Strings = (
      'SELECT * FROM SALDOS WHERE PRODUTO = :PRODUTO'
      'AND EMPRESA = :EMPRESA')
    ParamData = <
      item
        Name = 'PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object UniPopupMenudetalhesproduto: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 551
    Top = 6
    object UniMenuItem1: TUniMenuItem
      Caption = 'Kardex do Produto'
      ImageIndex = 112
      OnClick = UniMenuItem1Click
    end
  end
end
