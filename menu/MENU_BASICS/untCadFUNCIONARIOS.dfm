inherited frmcadFUNCIONARIOS: TfrmcadFUNCIONARIOS
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
                    FieldName = 'TIPO'
                    Title.Caption = 'TIPO'
                    Width = 80
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'DEPARTAMENTO'
                    Title.Caption = 'DEP.'
                    Width = 80
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'NOME'
                    Title.Caption = 'NOME'
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
                  ScrollHeight = 490
                  ScrollWidth = 708
                  object rcBlock10: TUniContainerPanel
                    Tag = 1
                    Left = 2
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
                      TabOrder = 1
                      Color = clGray
                      ReadOnly = True
                    end
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
                      TabOrder = 2
                    end
                  end
                  object rcBlock20: TUniContainerPanel
                    Tag = 1
                    Left = 195
                    Top = 3
                    Width = 336
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-4]]'
                    ParentColor = False
                    TabOrder = 1
                    DesignSize = (
                      336
                      48)
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
                    object UniDBComboBox1: TUniDBComboBox
                      Tag = 1
                      Left = 48
                      Top = 18
                      Width = 129
                      Height = 29
                      Hint = ''
                      Anchors = [akTop, akRight]
                      DataField = 'TIPO'
                      DataSource = dsMaster
                      Style = csDropDownList
                      Items.Strings = (
                        'Funcionario'
                        'Revenda'
                        'Representante'
                        'Ambos')
                      TabOrder = 3
                      IconItems = <>
                    end
                    object UniDBComboBox2: TUniDBComboBox
                      Tag = 1
                      Left = 206
                      Top = 18
                      Width = 129
                      Height = 29
                      Hint = ''
                      Anchors = [akTop, akRight]
                      DataField = 'DEPARTAMENTO'
                      DataSource = dsMaster
                      Style = csDropDownList
                      Items.Strings = (
                        'Diretoria'
                        'Contador'
                        'Financeiro'
                        'Faturamento'
                        'Estoque'
                        'Produ'#231#227'o'
                        'Laborat'#243'rio'
                        'Limpeza'
                        'Vendas'
                        'Informatica')
                      TabOrder = 4
                      IconItems = <>
                    end
                    object UniLabel21: TUniLabel
                      Left = 48
                      Top = 0
                      Width = 24
                      Height = 15
                      Hint = ''
                      Caption = 'Tipo'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 5
                    end
                    object UniLabel22: TUniLabel
                      Left = 206
                      Top = 0
                      Width = 127
                      Height = 15
                      Hint = ''
                      Alignment = taRightJustify
                      AutoSize = False
                      Caption = 'Departamento'
                      Anchors = [akTop, akRight]
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 6
                    end
                  end
                  object rcBlock30: TUniContainerPanel
                    Tag = 1
                    Left = 557
                    Top = 3
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-6]]'
                    ParentColor = False
                    TabOrder = 2
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
                      Top = 18
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
                  object rcBlock40: TUniContainerPanel
                    Tag = 1
                    Left = 2
                    Top = 63
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 3
                    DesignSize = (
                      150
                      48)
                    object UniDBDateTimePicker2: TUniDBDateTimePicker
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'CADASTRO'
                      DataSource = dsMaster
                      DateTime = 44561.000000000000000000
                      DateFormat = 'dd/MM/yyyy'
                      TimeFormat = 'HH:mm:ss'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel4: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 50
                      Height = 15
                      Hint = ''
                      Caption = 'Cadastro'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock50: TUniContainerPanel
                    Tag = 1
                    Left = 195
                    Top = 63
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 4
                    DesignSize = (
                      150
                      48)
                    object UniDBDateTimePicker1: TUniDBDateTimePicker
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'ANIVERSARIO'
                      DataSource = dsMaster
                      DateTime = 44561.000000000000000000
                      DateFormat = 'dd/MM/yyyy'
                      TimeFormat = 'HH:mm:ss'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel5: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 64
                      Height = 15
                      Hint = ''
                      Caption = 'Anivers'#225'rio'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock60: TUniContainerPanel
                    Tag = 1
                    Left = 381
                    Top = 63
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 5
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit1: TUniDBEdit
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'CPFCNPJ'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel6: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 48
                      Height = 15
                      Hint = ''
                      Caption = 'Cpf/Cnpj'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock70: TUniContainerPanel
                    Tag = 1
                    Left = 557
                    Top = 62
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 6
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
                    object UniLabel8: TUniLabel
                      Left = 3
                      Top = 1
                      Width = 70
                      Height = 15
                      Hint = ''
                      Caption = 'Inscri'#231#227'o/Rg'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock80: TUniContainerPanel
                    Tag = 1
                    Left = 2
                    Top = 123
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-4]]'
                    ParentColor = False
                    TabOrder = 7
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit3: TUniDBEdit
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
                  object rcBlock90: TUniContainerPanel
                    Tag = 1
                    Left = 195
                    Top = 123
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-4]]'
                    ParentColor = False
                    TabOrder = 8
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit4: TUniDBEdit
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
                  object rcBlock100: TUniContainerPanel
                    Tag = 1
                    Left = 381
                    Top = 123
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-4]]'
                    ParentColor = False
                    TabOrder = 9
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEditdescontos: TUniDBFormattedNumberEdit
                      Left = 3
                      Top = 17
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'COMISSAO'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Color = clRed
                      TabOrder = 1
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel11: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 66
                      Height = 15
                      Hint = ''
                      Caption = '% Comiss'#227'o'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock110: TUniContainerPanel
                    Tag = 1
                    Left = 2
                    Top = 186
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 10
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
                  object rcBlock120: TUniContainerPanel
                    Tag = 1
                    Left = 195
                    Top = 186
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-5]]'
                    ParentColor = False
                    TabOrder = 11
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit7: TUniDBEdit
                      Left = 3
                      Top = 16
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'ENDERECO'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      CheckChangeDelay = 200
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
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
                      TabOrder = 2
                    end
                  end
                  object rcBlock130: TUniContainerPanel
                    Tag = 1
                    Left = 381
                    Top = 186
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 12
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
                      Width = 147
                      Height = 29
                      Hint = ''
                      DataField = 'NUMERO'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock140: TUniContainerPanel
                    Tag = 1
                    Left = 557
                    Top = 185
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 13
                    DesignSize = (
                      150
                      48)
                    object UniLabel18: TUniLabel
                      Left = 8
                      Top = 1
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
                      Top = 18
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
                  object rcBlock150: TUniContainerPanel
                    Left = 2
                    Top = 243
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-10]]'
                    ParentColor = False
                    TabOrder = 14
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit10: TUniDBEdit
                      Left = 1
                      Top = 18
                      Width = 147
                      Height = 29
                      Hint = ''
                      DataField = 'CIDADE'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel19: TUniLabel
                      Left = 3
                      Top = 1
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
                  object rcBlock160: TUniContainerPanel
                    Left = 195
                    Top = 243
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 15
                    DesignSize = (
                      150
                      48)
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
                  object rcBlock170: TUniContainerPanel
                    Left = 2
                    Top = 301
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-6]]'
                    ParentColor = False
                    TabOrder = 16
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit6: TUniDBEdit
                      Left = 1
                      Top = 17
                      Width = 147
                      Height = 29
                      Hint = ''
                      DataField = 'EMAIL'
                      DataSource = dsMaster
                      CharCase = ecLowerCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel12: TUniLabel
                      Left = 3
                      Top = 1
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
                  object rcBlock180: TUniContainerPanel
                    Left = 195
                    Top = 301
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-6]]'
                    ParentColor = False
                    TabOrder = 17
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit11: TUniDBEdit
                      Left = 3
                      Top = 17
                      Width = 147
                      Height = 29
                      Hint = ''
                      DataField = 'PIX'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel14: TUniLabel
                      Left = 3
                      Top = 1
                      Width = 18
                      Height = 15
                      Hint = ''
                      Caption = 'PIX'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock210: TUniContainerPanel
                    Left = 3
                    Top = 353
                    Width = 705
                    Height = 137
                    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                    ParentColor = False
                    TabOrder = 18
                    object UniDBMemo1: TUniDBMemo
                      Left = 0
                      Top = 0
                      Width = 705
                      Height = 137
                      Hint = ''
                      DataField = 'OBSERVACAO'
                      DataSource = dsMaster
                      Align = alClient
                      TabOrder = 1
                      Color = clInfoBk
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
  inherited sqlSearchMaster: TFDQuery
    SQL.Strings = (
      'SELECT * FROM FUNCIONARIOS')
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'FUNCIONARIOS'
    SQL.Strings = (
      'SELECT * FROM FUNCIONARIOS')
  end
  inherited popMenuOptions: TUniPopupMenu
    object L1: TUniMenuItem
      Caption = 'Imprimir Listagem'
      ImageIndex = 52
      OnClick = L1Click
    end
  end
  inherited FDQryCad: TFDQuery
    UpdateOptions.UpdateTableName = 'FUNCIONARIOS'
    SQL.Strings = (
      'SELECT * FROM FUNCIONARIOS WHERE CODIGO = :CODIGO')
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
      'SELECT * FROM FUNCIONARIOS')
  end
  inherited dscruddetails: TDataSource
    Left = 723
    Top = 31
  end
end
