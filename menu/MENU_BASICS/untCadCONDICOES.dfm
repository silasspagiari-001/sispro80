inherited frmCADCONDICOES: TfrmCADCONDICOES
  Font.Height = -15
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
                    Width = 64
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'FORMAPGTO'
                    Title.Caption = 'Tipo'
                    Width = 64
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
              ActivePage = tabGeral
              Align = alClient
              TabOrder = 1
              object tabGeral: TUniTabSheet
                Hint = ''
                Caption = 'Dados Gerais'
                object sboxGridBlockTab1: TUniScrollBox
                  Left = 0
                  Top = 0
                  Width = 1307
                  Height = 935
                  Hint = ''
                  Align = alClient
                  TabOrder = 0
                  ScrollHeight = 254
                  ScrollWidth = 855
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
                    Hint = '[[cols:xs-12 sm-12 md-4]]'
                    ParentColor = False
                    TabOrder = 2
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit1: TUniDBEdit
                      Tag = 1
                      Left = 2
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'DESCRICAO'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel5: TUniLabel
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
                  object rcBlock40: TUniContainerPanel
                    Tag = 1
                    Left = 542
                    Top = 3
                    Width = 150
                    Height = 67
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 3
                    DesignSize = (
                      150
                      67)
                    object UniDBRadioGroup1: TUniDBRadioGroup
                      Left = 0
                      Top = 0
                      Width = 146
                      Height = 66
                      Hint = ''
                      DataField = 'ENTRADA_SAIDA'
                      DataSource = dsMaster
                      Caption = 'Tipo'
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      TabOrder = 1
                      Items.Strings = (
                        'Entrada'
                        'Saida')
                      Columns = 2
                      Values.Strings = (
                        '0'
                        '1')
                    end
                  end
                  object rcBlock50: TUniContainerPanel
                    Tag = 1
                    Left = 705
                    Top = 3
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 4
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'PARCELAS'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      DecimalPrecision = 0
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel6: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 42
                      Height = 15
                      Hint = ''
                      Caption = 'Parcela'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock60: TUniContainerPanel
                    Left = 3
                    Top = 72
                    Width = 208
                    Height = 113
                    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                    ParentColor = False
                    TabOrder = 5
                    DesignSize = (
                      208
                      113)
                    object UniLabel7: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 64
                      Height = 15
                      Hint = ''
                      Caption = 'Parametros'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBMemo1: TUniDBMemo
                      Left = 3
                      Top = 21
                      Width = 202
                      Height = 89
                      Hint = ''
                      DataField = 'OBSERVACOES'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock70: TUniContainerPanel
                    Left = 3
                    Top = 206
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-6]]'
                    ParentColor = False
                    TabOrder = 6
                    DesignSize = (
                      150
                      48)
                    object UniDBComboBox4: TUniDBComboBox
                      Left = 1
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      DataField = 'FORMAPGTO'
                      DataSource = dsMaster
                      Style = csDropDownList
                      Items.Strings = (
                        'Simples'
                        'Cart'#227'o'
                        'Boleto')
                      TabOrder = 1
                      IconItems = <>
                    end
                    object UniLabel8: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 67
                      Height = 15
                      Hint = ''
                      Caption = 'Tipo de Pgto'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock80: TUniContainerPanel
                    Left = 196
                    Top = 206
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-6]]'
                    ParentColor = False
                    TabOrder = 7
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit
                      AlignWithMargins = True
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'BASECALCULO'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      ParentFont = False
                      Font.Color = clBlue
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      Font.Style = [fsBold, fsItalic]
                      TabOrder = 1
                      DecimalPrecision = 4
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel9: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 87
                      Height = 15
                      Hint = ''
                      Caption = 'Base de Calculo'
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
  inherited dsSearchMaster: TDataSource
    Left = 684
    Top = 567
  end
  inherited sqlSearchMaster: TFDQuery
    SQL.Strings = (
      'SELECT * FROM CONDICOES')
    Left = 791
    Top = 473
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'CONDICOES'
    SQL.Strings = (
      'SELECT * FROM CONDICOES')
  end
  inherited popMenuOptions: TUniPopupMenu
    Left = 1210
    Top = 586
  end
  inherited FDQryCad: TFDQuery
    UpdateOptions.UpdateTableName = 'CONDICOES'
    SQL.Strings = (
      'SELECT * FROM CONDICOES WHERE CODIGO = :CODIGO')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  inherited FDQryFiltro: TFDQuery
    SQL.Strings = (
      'SELECT * FROM CONDICOES')
  end
  inherited FDQryCaddetails: TFDQuery
    Left = 737
    Top = 311
  end
  inherited dscruddetails: TDataSource
    Left = 659
    Top = 367
  end
end
