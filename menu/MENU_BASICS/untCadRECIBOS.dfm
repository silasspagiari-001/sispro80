inherited frmCADRECIBOS: TfrmCADRECIBOS
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 610
      ScrollWidth = 37
    end
    inherited pgBaseCadControl: TUniPageControl
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
            Columns = <
              item
                FieldName = 'KEY'
                Title.Caption = '...'
                Width = 50
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
              item
                FieldName = 'CODIGO'
                Title.Caption = 'CODIGO'
                Width = 74
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'PAGAMENTO'
                Title.Caption = 'PAGAMENTO'
                Width = 80
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'NOME'
                Title.Caption = 'NOME'
                Width = 150
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'VALOR'
                Title.Caption = 'VALOR'
                Width = 137
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
                ScrollHeight = 280
                ScrollWidth = 708
                object rcBlock10: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 12
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
                    Left = 0
                    Top = 17
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
                  Top = 12
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 1
                  DesignSize = (
                    150
                    48)
                  object UniLabel4: TUniLabel
                    Left = 2
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
                  object UniDBEdit2: TUniDBEdit
                    Tag = 1
                    AlignWithMargins = True
                    Left = 2
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'NUMERO'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlack
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    TabOrder = 2
                  end
                end
                object rcBlock30: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 12
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit1: TUniDBEdit
                    AlignWithMargins = True
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'SEQUENCIA'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clBlack
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    TabOrder = 1
                  end
                  object UniLabel5: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 56
                    Height = 15
                    Hint = ''
                    Caption = 'Sequencia'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock40: TUniContainerPanel
                  Tag = 1
                  Left = 558
                  Top = 11
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    150
                    48)
                  object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                    Tag = 1
                    AlignWithMargins = True
                    Left = 3
                    Top = 18
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'VALOR'
                    DataSource = dsMaster
                    Alignment = taRightJustify
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                  object UniLabel6: TUniLabel
                    Left = 3
                    Top = 1
                    Width = 29
                    Height = 15
                    Hint = ''
                    Caption = 'Valor'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock50: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 66
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 4
                  object UniLabel9: TUniLabel
                    Left = 3
                    Top = 19
                    Width = 134
                    Height = 19
                    Hint = ''
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = 'Recebi(emos) de ...:'
                    ParentFont = False
                    Font.Color = clBlue
                    Font.Height = -16
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                end
                object rcBlock60: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 66
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-4]]'
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    150
                    48)
                  object UniLabel7: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 61
                    Height = 15
                    Hint = ''
                    Caption = 'Pagamento'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBDateTimePickerPAGAMENTO: TUniDBDateTimePicker
                    Tag = 1
                    AlignWithMargins = True
                    Left = 3
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'PAGAMENTO'
                    DataSource = dsMaster
                    DateTime = 44554.000000000000000000
                    DateFormat = 'dd/MM/yyyy'
                    TimeFormat = 'HH:mm:ss'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    ClientEvents.ExtEvents.Strings = (
                      
                        'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
                        '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
                        '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
                        ':"  /  /   "});'#13#10'}')
                  end
                end
                object rcBlock70: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 66
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 6
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit3: TUniDBEdit
                    Left = 2
                    Top = 17
                    Width = 144
                    Height = 29
                    Hint = ''
                    DataField = 'RECEBI_DE'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel8: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 73
                    Height = 15
                    Hint = ''
                    Caption = 'Recebi(emos)'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock80: TUniContainerPanel
                  Left = 3
                  Top = 120
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 7
                  object UniLabel10: TUniLabel
                    Left = 3
                    Top = 19
                    Width = 134
                    Height = 19
                    Hint = ''
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = 'Referente a ...:'
                    ParentFont = False
                    Font.Color = clBlue
                    Font.Height = -16
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                end
                object rcBlock90: TUniContainerPanel
                  Left = 196
                  Top = 120
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-10]]'
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
                    DataField = 'REFERENTE'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel11: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 51
                    Height = 15
                    Hint = ''
                    Caption = 'Referente'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock100: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 178
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 9
                  object UniLabel12: TUniLabel
                    Left = 3
                    Top = 16
                    Width = 134
                    Height = 19
                    Hint = ''
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = 'Cidade/Estado ...:'
                    ParentFont = False
                    Font.Color = clBlue
                    Font.Height = -16
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                end
                object rcBlock110: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 178
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-8]]'
                  ParentColor = False
                  TabOrder = 10
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit10: TUniDBEdit
                    Left = 2
                    Top = 17
                    Width = 147
                    Height = 29
                    Hint = ''
                    DataField = 'CIDADE'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel13: TUniLabel
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
                object rcBlock120: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 178
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 11
                  DesignSize = (
                    150
                    48)
                  object UniDBComboBoxestado: TUniDBComboBox
                    Left = 5
                    Top = 17
                    Width = 143
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
                    TabOrder = 1
                    IconItems = <>
                  end
                  object UniLabel14: TUniLabel
                    Left = 5
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
                object rcBlock130: TUniContainerPanel
                  Tag = 1
                  Left = 3
                  Top = 232
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 12
                  object UniLabel15: TUniLabel
                    Left = 3
                    Top = 17
                    Width = 134
                    Height = 19
                    Hint = ''
                    Alignment = taRightJustify
                    AutoSize = False
                    Caption = 'Nome/CPFCNPJ ...:'
                    ParentFont = False
                    Font.Color = clBlue
                    Font.Height = -16
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                end
                object rcBlock140: TUniContainerPanel
                  Tag = 1
                  Left = 196
                  Top = 232
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-8]]'
                  ParentColor = False
                  TabOrder = 13
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit5: TUniDBEdit
                    Left = 3
                    Top = 17
                    Width = 147
                    Height = 29
                    Hint = ''
                    DataField = 'NOME'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel16: TUniLabel
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
                object rcBlock150: TUniContainerPanel
                  Tag = 1
                  Left = 382
                  Top = 232
                  Width = 150
                  Height = 48
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 14
                  DesignSize = (
                    150
                    48)
                  object UniDBEdit6: TUniDBEdit
                    Left = 3
                    Top = 17
                    Width = 147
                    Height = 29
                    Hint = ''
                    DataField = 'CPFCNPJ'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                  end
                  object UniLabel17: TUniLabel
                    Left = 2
                    Top = 0
                    Width = 53
                    Height = 15
                    Hint = ''
                    Caption = 'CPF/CNPJ:'
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
    UpdateOptions.UpdateTableName = 'RECIBOS'
    SQL.Strings = (
      'SELECT * FROM RECIBOS')
    object sqlSearchMasterKEY: TStringField
      FieldName = 'KEY'
      Origin = '"KEY"'
      OnGetText = sqlSearchMasterKEYGetText
      Size = 38
    end
    object sqlSearchMasterCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
    object sqlSearchMasterEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
    end
    object sqlSearchMasterPAGAMENTO: TDateField
      FieldName = 'PAGAMENTO'
      Origin = 'PAGAMENTO'
    end
    object sqlSearchMasterVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      currency = True
      Precision = 18
      Size = 2
    end
    object sqlSearchMasterRECEBI_DE: TStringField
      FieldName = 'RECEBI_DE'
      Origin = 'RECEBI_DE'
      Size = 100
    end
    object sqlSearchMasterNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 100
    end
    object sqlSearchMasterCPFCNPJ: TStringField
      FieldName = 'CPFCNPJ'
      Origin = 'CPFCNPJ'
    end
    object sqlSearchMasterCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 60
    end
    object sqlSearchMasterESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO'
      Size = 2
    end
    object sqlSearchMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object sqlSearchMasterSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
    end
    object sqlSearchMasterREFERENTE: TStringField
      FieldName = 'REFERENTE'
      Origin = 'REFERENTE'
      Size = 100
    end
    object sqlSearchMasterATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      FixedChar = True
      Size = 1
    end
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'RECIBOS'
    SQL.Strings = (
      'SELECT * FROM RECIBOS WHERE CODIGO = :table_pk')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
end
