inherited frmcadTRANSPORTES: TfrmcadTRANSPORTES
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
                    Width = 70
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'NOME'
                    Title.Caption = 'NOME'
                    Width = 300
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'CPFCNPJ'
                    Title.Caption = 'CPFCNPJ'
                    Width = 100
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'TELEFONE'
                    Title.Caption = 'TELEFONE'
                    Width = 100
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'CELULAR'
                    Title.Caption = 'CELULAR'
                    Width = 100
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
              ActivePage = UniTabSheetveiculos
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
                  ScrollHeight = 473
                  ScrollWidth = 941
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
                      Width = 100
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
                    object UniLabel8: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 48
                      Height = 15
                      Hint = ''
                      Caption = 'Cpf/Cnpj'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdit1: TUniDBEdit
                      Left = 3
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
                    object UniLabel9: TUniLabel
                      Left = 4
                      Top = 0
                      Width = 70
                      Height = 15
                      Hint = ''
                      Caption = 'Rg/Inscri'#231#227'o'
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
                      DataField = 'INSCRICAO'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
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
                    object UniLabel4: TUniLabel
                      Left = 5
                      Top = 0
                      Width = 32
                      Height = 15
                      Hint = ''
                      Caption = 'C.N.H.'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdit3: TUniDBEdit
                      Left = 5
                      Top = 18
                      Width = 142
                      Height = 29
                      Hint = ''
                      DataField = 'CNH'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock60: TUniContainerPanel
                    Left = 104
                    Top = 61
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-6]]'
                    ParentColor = False
                    TabOrder = 5
                    DesignSize = (
                      150
                      48)
                    object UniLabel13: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 31
                      Height = 15
                      Hint = ''
                      Caption = 'Nome'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdit5: TUniDBEdit
                      Tag = 1
                      Left = 3
                      Top = 16
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'NOME'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock70: TUniContainerPanel
                    Left = 297
                    Top = 61
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-6]]'
                    ParentColor = False
                    TabOrder = 6
                    DesignSize = (
                      150
                      48)
                    object UniLabel14: TUniLabel
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
                    object UniDBEdit6: TUniDBEdit
                      Left = 3
                      Top = 16
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
                  object rcBlock80: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = 118
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
                      Top = 17
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
                    Left = 196
                    Top = 118
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
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
                      Top = 17
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
                    Left = 372
                    Top = 118
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
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
                      Top = 17
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
                    Left = 542
                    Top = 118
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 10
                    DesignSize = (
                      150
                      48)
                    object UniLabel18: TUniLabel
                      Left = 5
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
                      Left = 5
                      Top = 17
                      Width = 142
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
                    Left = 705
                    Top = 118
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 11
                    DesignSize = (
                      150
                      48)
                    object UniLabel5: TUniLabel
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
                    object UniDBEdit4: TUniDBEdit
                      Left = 3
                      Top = 17
                      Width = 144
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
                    Left = 3
                    Top = 178
                    Width = 150
                    Height = 50
                    Hint = '[[cols:xs-12 sm-12 md-4]]'
                    ParentColor = False
                    TabOrder = 12
                    DesignSize = (
                      150
                      50)
                    object UniLabel20: TUniLabel
                      Left = 3
                      Top = 1
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
                      Top = 17
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
                    Left = 196
                    Top = 178
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-4]]'
                    ParentColor = False
                    TabOrder = 13
                    DesignSize = (
                      150
                      48)
                    object UniLabel23: TUniLabel
                      Left = 3
                      Top = 1
                      Width = 45
                      Height = 15
                      Hint = ''
                      Caption = 'Telefone'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdit11: TUniDBEdit
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
                  object rcBlock150: TUniContainerPanel
                    Tag = 1
                    Left = 382
                    Top = 178
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-4]]'
                    ParentColor = False
                    TabOrder = 14
                    DesignSize = (
                      150
                      48)
                    object UniLabel6: TUniLabel
                      Left = 3
                      Top = 1
                      Width = 40
                      Height = 15
                      Hint = ''
                      Caption = 'Celular'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdit10: TUniDBEdit
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'CELULAR'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock160: TUniContainerPanel
                    Left = 3
                    Top = 249
                    Width = 938
                    Height = 224
                    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                    ParentColor = False
                    TabOrder = 15
                    DesignSize = (
                      938
                      224)
                    object UniDBMemo1: TUniDBMemo
                      Left = 3
                      Top = 30
                      Width = 932
                      Height = 190
                      Hint = ''
                      DataField = 'OBSERVACOES'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel10: TUniLabel
                      Left = 3
                      Top = 9
                      Width = 71
                      Height = 15
                      Hint = ''
                      Caption = 'Observa'#231'oes'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                end
              end
              object UniTabSheetveiculos: TUniTabSheet
                Hint = ''
                Caption = 'Ve'#237'culos'
                object UniScrollBox3: TUniScrollBox
                  Left = 0
                  Top = 0
                  Width = 1307
                  Height = 935
                  Hint = ''
                  Align = alClient
                  TabOrder = 0
                  ExplicitLeft = 3
                  ExplicitTop = 3
                  ScrollHeight = 291
                  ScrollWidth = 855
                  object rcBlock170: TUniContainerPanel
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
                    object UniLabel11: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 51
                      Height = 15
                      Hint = ''
                      Caption = 'RENAVAM'
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
                      DataField = 'RENAVAM'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock180: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = 3
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-4]]'
                    ParentColor = False
                    TabOrder = 1
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit13: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'CIOT'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel12: TUniLabel
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
                  object rcBlock190: TUniContainerPanel
                    Tag = 1
                    Left = 382
                    Top = 3
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-4]]'
                    ParentColor = False
                    TabOrder = 2
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit14: TUniDBEdit
                      Left = 5
                      Top = 18
                      Width = 142
                      Height = 29
                      Hint = ''
                      DataField = 'RNTC'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel19: TUniLabel
                      Left = 5
                      Top = 0
                      Width = 28
                      Height = 15
                      Hint = ''
                      Caption = 'RNTC'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock200: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = 64
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 3
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit15: TUniDBEdit
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'PLACA'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel21: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 112
                      Height = 15
                      Hint = ''
                      Caption = 'Veiculo Trator PLACA'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock210: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = 64
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 4
                    DesignSize = (
                      150
                      48)
                    object UniDBComboBox1: TUniDBComboBox
                      Left = 3
                      Top = 17
                      Width = 145
                      Height = 29
                      Hint = ''
                      Anchors = [akLeft, akTop, akRight]
                      DataField = 'PLACAESTADO'
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
                    object UniLabel22: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 14
                      Height = 15
                      Hint = ''
                      Caption = 'UF'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock220: TUniContainerPanel
                    Tag = 1
                    Left = 372
                    Top = 64
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 5
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEditvlrprodutos: TUniDBFormattedNumberEdit
                      Left = 3
                      Top = 17
                      Width = 142
                      Height = 29
                      Hint = ''
                      DataField = 'TRATORTARA'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      TabOrder = 1
                      DecimalPrecision = 4
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel24: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 26
                      Height = 15
                      Hint = ''
                      Caption = 'TARA'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock230: TUniContainerPanel
                    Tag = 1
                    Left = 542
                    Top = 64
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 6
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'TRATORKG'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      TabOrder = 1
                      DecimalPrecision = 4
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel25: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 14
                      Height = 15
                      Hint = ''
                      Caption = 'KG'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock240: TUniContainerPanel
                    Tag = 1
                    Left = 705
                    Top = 64
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 7
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
                      Left = 4
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'TRATORM3'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      TabOrder = 1
                      DecimalPrecision = 4
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel26: TUniLabel
                      Left = 4
                      Top = 0
                      Width = 18
                      Height = 15
                      Hint = ''
                      Caption = 'M3'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock250: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = 125
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 8
                    DesignSize = (
                      150
                      48)
                    object UniLabel27: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 95
                      Height = 15
                      Hint = ''
                      Caption = 'Veiculos CARRETA'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdit16: TUniDBEdit
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'PLACACARRETA'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock260: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = 125
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 9
                    DesignSize = (
                      150
                      48)
                    object UniDBComboBox2: TUniDBComboBox
                      Left = 3
                      Top = 17
                      Width = 145
                      Height = 29
                      Hint = ''
                      Anchors = [akLeft, akTop, akRight]
                      DataField = 'ESTADOCARRETA'
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
                    object UniLabel28: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 14
                      Height = 15
                      Hint = ''
                      Caption = 'UF'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock270: TUniContainerPanel
                    Tag = 1
                    Left = 372
                    Top = 125
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 10
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'CARRETATARA'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      TabOrder = 1
                      DecimalPrecision = 4
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel29: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 26
                      Height = 15
                      Hint = ''
                      Caption = 'TARA'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock280: TUniContainerPanel
                    Tag = 1
                    Left = 542
                    Top = 125
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 11
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'CARRETAKG'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      TabOrder = 1
                      DecimalPrecision = 4
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel30: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 14
                      Height = 15
                      Hint = ''
                      Caption = 'KG'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock290: TUniContainerPanel
                    Tag = 1
                    Left = 705
                    Top = 125
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 12
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit
                      Left = 4
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'CARRETAM3'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      TabOrder = 1
                      DecimalPrecision = 4
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel31: TUniLabel
                      Left = 4
                      Top = 0
                      Width = 18
                      Height = 15
                      Hint = ''
                      Caption = 'M3'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock300: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = 185
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 13
                    DesignSize = (
                      150
                      48)
                    object UniLabel32: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 94
                      Height = 15
                      Hint = ''
                      Caption = 'Ve'#237'culo REBOQUE'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdit17: TUniDBEdit
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'PLACAREBOQUE'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock310: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = 185
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 14
                    DesignSize = (
                      150
                      48)
                    object UniDBComboBox3: TUniDBComboBox
                      Left = 3
                      Top = 17
                      Width = 145
                      Height = 29
                      Hint = ''
                      Anchors = [akLeft, akTop, akRight]
                      DataField = 'ESTADOREBOQUE'
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
                    object UniLabel33: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 14
                      Height = 15
                      Hint = ''
                      Caption = 'UF'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock320: TUniContainerPanel
                    Tag = 1
                    Left = 372
                    Top = 185
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 15
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'REBOQUETARA'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      TabOrder = 1
                      DecimalPrecision = 4
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel34: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 26
                      Height = 15
                      Hint = ''
                      Caption = 'TARA'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock330: TUniContainerPanel
                    Tag = 1
                    Left = 542
                    Top = 185
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 16
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'REBOQUEKG'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      TabOrder = 1
                      DecimalPrecision = 4
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel35: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 14
                      Height = 15
                      Hint = ''
                      Caption = 'KG'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock340: TUniContainerPanel
                    Tag = 1
                    Left = 705
                    Top = 185
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 17
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit
                      Left = 4
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'REBOQUEM3'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      TabOrder = 1
                      DecimalPrecision = 4
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel36: TUniLabel
                      Left = 4
                      Top = 0
                      Width = 18
                      Height = 15
                      Hint = ''
                      Caption = 'M3'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock350: TUniContainerPanel
                    Left = 3
                    Top = 243
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-6]]'
                    ParentColor = False
                    TabOrder = 18
                    DesignSize = (
                      150
                      48)
                    object UniDBComboBox4: TUniDBComboBox
                      Left = 3
                      Top = 17
                      Width = 145
                      Height = 29
                      Hint = ''
                      Anchors = [akLeft, akTop, akRight]
                      DataField = 'TIPOTRATOR'
                      DataSource = dsMaster
                      Style = csDropDownList
                      Items.Strings = (
                        'Truck'
                        'Toco'
                        'CavaloMecanico'
                        'VAN'
                        'Utilitario'
                        'Outros')
                      TabOrder = 1
                      IconItems = <>
                    end
                    object UniLabel37: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 83
                      Height = 15
                      Hint = ''
                      Caption = 'Tipo do Ve'#237'culo'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock360: TUniContainerPanel
                    Left = 196
                    Top = 243
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-6]]'
                    ParentColor = False
                    TabOrder = 19
                    DesignSize = (
                      150
                      48)
                    object UniDBComboBox5: TUniDBComboBox
                      Left = 3
                      Top = 17
                      Width = 145
                      Height = 29
                      Hint = ''
                      Anchors = [akLeft, akTop, akRight]
                      DataField = 'TIPOCARRETA'
                      DataSource = dsMaster
                      Style = csDropDownList
                      Items.Strings = (
                        'Aberta'
                        'Fechada'
                        'Graneleira'
                        'PortaContainer'
                        'Sider')
                      TabOrder = 1
                      IconItems = <>
                    end
                    object UniLabel38: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 59
                      Height = 15
                      Hint = ''
                      Caption = 'Carroceria'
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
  inherited rcSweetAlert: TUniSweetAlert
    Left = 1028
    Top = 28
  end
  inherited dsMaster: TDataSource
    Left = 1164
    Top = 751
  end
  inherited dsSearchMaster: TDataSource
    Left = 1300
    Top = 727
  end
  inherited sqlSearchMaster: TFDQuery
    SQL.Strings = (
      'SELECT * FROM TRANSPORTES')
    Left = 1255
    Top = 721
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'TRANSPORTES'
    SQL.Strings = (
      'SELECT * FROM TRANSPORTES')
    Left = 1129
    Top = 751
  end
  inherited popMenuOptions: TUniPopupMenu
    Left = 1098
    Top = 18
  end
  inherited FDSchemaAdapter1: TFDSchemaAdapter
    Left = 1158
    Top = 598
  end
  inherited FDQryCad: TFDQuery
    UpdateOptions.UpdateTableName = 'TRANSPORTES'
    SQL.Strings = (
      'SELECT * FROM TRANSPORTES WHERE CODIGO = :CODIGO')
    Left = 1265
    Top = 630
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  inherited dscrud: TDataSource
    Left = 1307
    Top = 630
  end
  inherited FDQryFiltro: TFDQuery
    SQL.Strings = (
      'SELECT * FROM TRANSPORTES')
    Left = 1105
    Top = 606
  end
  inherited FDQryCaddetails: TFDQuery
    Left = 865
    Top = 39
  end
  inherited dscruddetails: TDataSource
    Left = 947
    Top = 31
  end
  inherited tbdetalhes: TFDMemTable
    Left = 1141
    Top = 684
  end
  inherited dsdetalhes: TDataSource
    Left = 1093
    Top = 684
  end
end
