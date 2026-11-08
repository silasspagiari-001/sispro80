inherited frmcadEMPRESAS: TfrmcadEMPRESAS
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
                    Width = 60
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'NOME'
                    Title.Caption = 'NOME'
                    Width = 300
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'FANTASIA'
                    Title.Caption = 'FANTASIA'
                    Width = 200
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'CIDADE'
                    Title.Caption = 'CIDADE'
                    Width = 200
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'ESTADO'
                    Title.Caption = 'ESTADO'
                    Width = 50
                    Font.Name = 'Calibri'
                  end>
              end
            end
          end
        end
        inherited tabRegister: TUniTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 1315
          ExplicitHeight = 965
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
                  ScrollHeight = 409
                  ScrollWidth = 857
                  object rcBlock10: TUniContainerPanel
                    Tag = 1
                    Left = 5
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
                    Left = 198
                    Top = 3
                    Width = 57
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
                    Left = 374
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
                      Width = 24
                      Height = 15
                      Hint = ''
                      Caption = 'Tipo'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBComboBox1: TUniDBComboBox
                      Tag = 1
                      Left = 2
                      Top = 18
                      Width = 145
                      Height = 29
                      Hint = ''
                      Anchors = [akLeft, akTop, akRight]
                      DataField = 'TIPO'
                      DataSource = dsMaster
                      Style = csDropDownList
                      Items.Strings = (
                        'Simples Nacional'
                        'Lucro Real/Presumido'
                        '')
                      TabOrder = 2
                      IconItems = <>
                    end
                  end
                  object rcBlock40: TUniContainerPanel
                    Tag = 1
                    Left = 544
                    Top = 3
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 3
                    DesignSize = (
                      150
                      48)
                    object UniLabel9: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 45
                      Height = 15
                      Hint = ''
                      Caption = 'CPFCNPJ'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdit2: TUniDBEdit
                      Left = 2
                      Top = 18
                      Width = 145
                      Height = 29
                      Hint = ''
                      DataField = 'CNPJ'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock50: TUniContainerPanel
                    Tag = 1
                    Left = 707
                    Top = 3
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 4
                    DesignSize = (
                      150
                      48)
                    object UniLabel5: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 52
                      Height = 15
                      Hint = ''
                      Caption = 'Inscri'#231#227'o'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdit1: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 142
                      Height = 29
                      Hint = ''
                      DataField = 'INSCRICAO'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock60: TUniContainerPanel
                    Left = 5
                    Top = 68
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-6]]'
                    ParentColor = False
                    TabOrder = 5
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit3: TUniDBEdit
                      Left = 3
                      Top = 17
                      Width = 142
                      Height = 29
                      Hint = ''
                      DataField = 'NOME'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel6: TUniLabel
                      Left = 3
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
                    Left = 198
                    Top = 68
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-6]]'
                    ParentColor = False
                    TabOrder = 6
                    DesignSize = (
                      150
                      48)
                    object UniLabel8: TUniLabel
                      Left = 3
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
                    object UniDBEdit4: TUniDBEdit
                      Left = 3
                      Top = 17
                      Width = 142
                      Height = 29
                      Hint = ''
                      DataField = 'FANTASIA'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock80: TUniContainerPanel
                    Tag = 1
                    Left = 5
                    Top = 129
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 7
                    DesignSize = (
                      150
                      48)
                    object edCep: TUniDBEdit
                      Tag = 1
                      Left = 3
                      Top = 16
                      Width = 145
                      Height = 29
                      Hint = '[[mask:cep]]'
                      DataField = 'CEP'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                      Color = clInfoBk
                      OnExit = edCepExit
                    end
                    object UniLabel15: TUniLabel
                      Left = 3
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
                  object rcBlock90: TUniContainerPanel
                    Tag = 1
                    Left = 198
                    Top = 129
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 8
                    DesignSize = (
                      150
                      48)
                    object UniLabel16: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 50
                      Height = 15
                      Hint = ''
                      Caption = 'Endere'#231'o'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdit7: TUniDBEdit
                      Left = 3
                      Top = 16
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'ENDERECO'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock100: TUniContainerPanel
                    Tag = 1
                    Left = 374
                    Top = 129
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-1]]'
                    ParentColor = False
                    TabOrder = 9
                    DesignSize = (
                      150
                      48)
                    object UniLabel17: TUniLabel
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
                    object UniDBEdit8: TUniDBEdit
                      Left = 3
                      Top = 16
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'NUMERO'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock110: TUniContainerPanel
                    Tag = 1
                    Left = 544
                    Top = 129
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 10
                    DesignSize = (
                      150
                      48)
                    object UniLabel18: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 35
                      Height = 15
                      Hint = ''
                      Caption = 'Bairro'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdit9: TUniDBEdit
                      Left = 3
                      Top = 16
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'BAIRRO'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock120: TUniContainerPanel
                    Tag = 1
                    Left = 707
                    Top = 129
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 11
                    DesignSize = (
                      150
                      48)
                    object UniLabel19: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 38
                      Height = 15
                      Hint = ''
                      Caption = 'Cidade'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdit10: TUniDBEdit
                      Left = 3
                      Top = 16
                      Width = 142
                      Height = 29
                      Hint = ''
                      DataField = 'CIDADE'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock130: TUniContainerPanel
                    Tag = 1
                    Left = 5
                    Top = 184
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 12
                    DesignSize = (
                      150
                      48)
                    object UniLabel20: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 37
                      Height = 15
                      Hint = ''
                      Caption = 'Estado'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBComboBoxestado: TUniDBComboBox
                      Left = 3
                      Top = 18
                      Width = 145
                      Height = 29
                      Hint = ''
                      Anchors = [akLeft, akTop, akRight]
                      DataField = 'ESTADO'
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
                  object rcBlock140: TUniContainerPanel
                    Tag = 1
                    Left = 198
                    Top = 184
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 13
                    DesignSize = (
                      150
                      48)
                    object UniLabel21: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 54
                      Height = 15
                      Hint = ''
                      Caption = 'Sigla Pais'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object edIBGEEntrega: TUniDBEdit
                      Tag = 1
                      Left = 3
                      Top = 18
                      Width = 145
                      Height = 29
                      Hint = ''
                      DataField = 'IBGEENTREGA'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      Color = clInfoBk
                    end
                  end
                  object rcBlock150: TUniContainerPanel
                    Tag = 1
                    Left = 374
                    Top = 184
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 14
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit5: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'PAIS'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel10: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 24
                      Height = 15
                      Hint = ''
                      Caption = 'Pais'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock160: TUniContainerPanel
                    Tag = 1
                    Left = 544
                    Top = 184
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 15
                    DesignSize = (
                      150
                      48)
                    object UniLabel22: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 34
                      Height = 15
                      Hint = ''
                      Caption = 'I.B.G.E'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object edLkpCIDADES__IBGE: TUniDBEdit
                      Tag = 1
                      Left = 3
                      Top = 18
                      Width = 145
                      Height = 29
                      Hint = 
                        '[[CODIIBGE IBGE @60 getpk:CODIIBGE ! |lkpfilter-searchfields:des' +
                        'cricao;uf |]]'
                      DataField = 'IBGE'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      Color = clInfoBk
                    end
                  end
                  object rcBlock170: TUniContainerPanel
                    Tag = 1
                    Left = 707
                    Top = 184
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 16
                  end
                  object rcBlock180: TUniContainerPanel
                    Tag = 1
                    Left = 5
                    Top = 241
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 17
                    DesignSize = (
                      150
                      48)
                    object UniLabel11: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 45
                      Height = 15
                      Hint = ''
                      Caption = 'Telefone'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdit6: TUniDBEdit
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'TELEFONE'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock190: TUniContainerPanel
                    Tag = 1
                    Left = 198
                    Top = 241
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 18
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit11: TUniDBEdit
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
                    object UniLabel12: TUniLabel
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
                  object rcBlock200: TUniContainerPanel
                    Tag = 1
                    Left = 384
                    Top = 241
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 19
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit12: TUniDBEdit
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'EMAIL'
                      DataSource = dsMaster
                      CharCase = ecLowerCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel13: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 31
                      Height = 15
                      Hint = ''
                      Caption = 'Email'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock210: TUniContainerPanel
                    Tag = 1
                    Left = 560
                    Top = 240
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 20
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit13: TUniDBEdit
                      Left = 1
                      Top = 18
                      Width = 146
                      Height = 29
                      Hint = ''
                      DataField = 'SITE'
                      DataSource = dsMaster
                      CharCase = ecLowerCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel14: TUniLabel
                      Left = 1
                      Top = 1
                      Width = 20
                      Height = 15
                      Hint = ''
                      Caption = 'Site'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock220: TUniContainerPanel
                    Left = 5
                    Top = 297
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-6]]'
                    ParentColor = False
                    TabOrder = 21
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit14: TUniDBEdit
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'CIOT'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel23: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 26
                      Height = 15
                      Hint = ''
                      Caption = 'CIOT'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock230: TUniContainerPanel
                    Left = 198
                    Top = 297
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-6]]'
                    ParentColor = False
                    TabOrder = 22
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit15: TUniDBEdit
                      Left = 3
                      Top = 17
                      Width = 142
                      Height = 29
                      Hint = ''
                      DataField = 'RNTCR'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel24: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 35
                      Height = 15
                      Hint = ''
                      Caption = 'RNTCR'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock240: TUniContainerPanel
                    Tag = 1
                    Left = 5
                    Top = 349
                    Width = 150
                    Height = 60
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 23
                    DesignSize = (
                      150
                      60)
                    object UniLabel25: TUniLabel
                      Left = 3
                      Top = 2
                      Width = 51
                      Height = 15
                      Hint = ''
                      Caption = 'RENASEM'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdit16: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'RENASEM'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock250: TUniContainerPanel
                    Tag = 1
                    Left = 198
                    Top = 349
                    Width = 150
                    Height = 60
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 24
                  end
                  object rcBlock260: TUniContainerPanel
                    Tag = 1
                    Left = 384
                    Top = 349
                    Width = 150
                    Height = 60
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 25
                  end
                  object rcBlock270: TUniContainerPanel
                    Tag = 1
                    Left = 560
                    Top = 348
                    Width = 150
                    Height = 60
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 26
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
  object edIBGERetorno: TUniDBEdit [26]
    Left = 0
    Top = 0
    Width = 1
    Height = 1
    Hint = ''
    Visible = False
    DataField = 'IBGE'
    DataSource = dsMaster
    TabOrder = 26
    TabStop = False
  end
  inherited dsMaster: TDataSource
    Left = 364
    Top = 439
  end
  inherited dsSearchMaster: TDataSource
    Left = 260
    Top = 239
  end
  inherited sqlSearchMaster: TFDQuery
    SQL.Strings = (
      'SELECT * FROM EMPRESAS')
    Left = 271
    Top = 305
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'EMPRESAS'
    SQL.Strings = (
      'SELECT * FROM EMPRESAS')
  end
  inherited popMenuOptions: TUniPopupMenu
    object HistricodeMovimentaoEstoque1: TUniMenuItem
      Caption = 'Configura'#231#227'o Nota Eletr'#244'nica'
      ImageIndex = 27
      OnClick = HistricodeMovimentaoEstoque1Click
    end
  end
  inherited FDQryCad: TFDQuery
    UpdateOptions.UpdateTableName = 'EMPRESAS'
    SQL.Strings = (
      'SELECT * FROM EMPRESAS WHERE CODIGO = :CODIGO')
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
      'SELECT * FROM EMPRESAS')
  end
  inherited dsdetalhes: TDataSource
    Left = 653
    Top = 476
  end
end
