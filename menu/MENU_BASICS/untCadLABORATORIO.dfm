inherited frmCADLABORATORIO: TfrmCADLABORATORIO
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
            inherited paGridOffset: TUniContainerPanel
              Height = 957
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
                    FieldName = 'NOME'
                    Title.Caption = 'NOME'
                    Width = 300
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'CIDADE'
                    Title.Caption = 'CIDADE'
                    Width = 150
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'ESTADO'
                    Title.Caption = 'U.F.'
                    Width = 50
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
                  ScrollHeight = 255
                  ScrollWidth = 863
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
                    object UniLabel5: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 50
                      Height = 15
                      Hint = ''
                      Caption = 'CPF/CNPJ'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdit1: TUniDBEdit
                      Tag = 1
                      Left = 2
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'CPFCNPJ'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
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
                    TabOrder = 3
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit2: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'INSCRICAO'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel6: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 72
                      Height = 15
                      Hint = ''
                      Caption = 'Inscri'#231#227'o/RG'
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
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 4
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit3: TUniDBEdit
                      Left = 2
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'CREDENCIAL'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel7: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 51
                      Height = 15
                      Hint = ''
                      Caption = 'RENASEM'
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
                    Hint = '[[cols:xs-12 sm-12 md-6]]'
                    ParentColor = False
                    TabOrder = 5
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit4: TUniDBEdit
                      Tag = 1
                      Left = 2
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'NOME'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel8: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 31
                      Height = 15
                      Hint = ''
                      Caption = 'Nome'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock70: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = 72
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 6
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit5: TUniDBEdit
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'TELEFONE'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel9: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 45
                      Height = 15
                      Hint = ''
                      Caption = 'Telefone'
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
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 7
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit6: TUniDBEdit
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'CELULAR'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel10: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 40
                      Height = 15
                      Hint = ''
                      Caption = 'Celular'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock90: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = 142
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 8
                    DesignSize = (
                      150
                      48)
                    object edCep: TUniDBEdit
                      Tag = 1
                      Left = 1
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = '[[mask:cep]]'
                      DataField = 'CEP'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      Color = clInfoBk
                      OnExit = edCepExit
                    end
                    object UniLabel11: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 20
                      Height = 15
                      Hint = ''
                      Caption = 'Cep'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock100: TUniContainerPanel
                    Tag = 1
                    Left = 159
                    Top = 142
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 9
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit7: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'ENDERECO'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel12: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 50
                      Height = 15
                      Hint = ''
                      Caption = 'Endere'#231'o'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock110: TUniContainerPanel
                    Tag = 1
                    Left = 315
                    Top = 142
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-1]]'
                    ParentColor = False
                    TabOrder = 10
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit8: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'NUMERO'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel13: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 43
                      Height = 15
                      Hint = ''
                      Caption = 'Numero'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock120: TUniContainerPanel
                    Tag = 1
                    Left = 471
                    Top = 142
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 11
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit9: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'BAIRRO'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel14: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 35
                      Height = 15
                      Hint = ''
                      Caption = 'Bairro'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock130: TUniContainerPanel
                    Tag = 1
                    Left = 627
                    Top = 142
                    Width = 142
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 12
                    DesignSize = (
                      142
                      48)
                    object UniDBEdit10: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 136
                      Height = 29
                      Hint = ''
                      DataField = 'CIDADE'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      ExplicitWidth = 194
                    end
                    object UniLabel15: TUniLabel
                      Left = 2
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
                  object rcBlock140: TUniContainerPanel
                    Left = 3
                    Top = 207
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-6]]'
                    ParentColor = False
                    TabOrder = 13
                    DesignSize = (
                      150
                      48)
                    object UniLabel17: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 48
                      Height = 15
                      Hint = ''
                      Caption = 'Fantasia'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdit12: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'FANTASIA'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock150: TUniContainerPanel
                    Left = 196
                    Top = 207
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-6]]'
                    ParentColor = False
                    TabOrder = 14
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit13: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'EMAIL'
                      DataSource = dsMaster
                      CharCase = ecLowerCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel18: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 47
                      Height = 15
                      Hint = ''
                      Caption = 'Email-@'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock135: TUniContainerPanel
                    Tag = 1
                    Left = 775
                    Top = 142
                    Width = 88
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 15
                    DesignSize = (
                      88
                      48)
                    object UniDBEdit15: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 83
                      Height = 29
                      Hint = ''
                      DataField = 'ESTADO'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel2: TUniLabel
                      Left = 7
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
      'SELECT * FROM LABORATORIO')
    Left = 767
    Top = 577
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'LABORATORIO'
    SQL.Strings = (
      'SELECT * FROM LABORATORIO')
  end
  inherited popMenuOptions: TUniPopupMenu
    Left = 1210
    Top = 586
  end
  inherited FDQryCad: TFDQuery
    UpdateOptions.UpdateTableName = 'LABORATORIO'
    SQL.Strings = (
      'SELECT * FROM LABORATORIO WHERE CODIGO = :CODIGO')
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
      'SELECT * FROM LABORATORIO')
  end
end
