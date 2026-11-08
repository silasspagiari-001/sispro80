inherited frmCADRESPONSAVEL: TfrmCADRESPONSAVEL
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
                    Width = 64
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
                  ScrollHeight = 449
                  ScrollWidth = 905
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
                      Width = 146
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
                    object UniLabel6: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 72
                      Height = 15
                      Hint = ''
                      Caption = 'Inscri'#231#227'o/RG'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdit2: TUniDBEdit
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
                    object UniLabel7: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 51
                      Height = 15
                      Hint = ''
                      Caption = 'RENASEM'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdit3: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'CREDENCIAL'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock60: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = 72
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-5]]'
                    ParentColor = False
                    TabOrder = 5
                    DesignSize = (
                      150
                      48)
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
                      TabOrder = 1
                    end
                    object UniDBEdit4: TUniDBEdit
                      Tag = 1
                      Left = 2
                      Top = 17
                      Width = 145
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
                    Tag = 1
                    Left = 196
                    Top = 72
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 6
                    DesignSize = (
                      150
                      48)
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
                      TabOrder = 1
                    end
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
                      TabOrder = 1
                    end
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
                      TabOrder = 2
                    end
                  end
                  object rcBlock90: TUniContainerPanel
                    Tag = 1
                    Left = 558
                    Top = 71
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 8
                    DesignSize = (
                      150
                      48)
                    object UniLabel11: TUniLabel
                      Left = 3
                      Top = 1
                      Width = 83
                      Height = 15
                      Hint = ''
                      Caption = 'CREA\RENASEM'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdit7: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'CREA'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock100: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = 140
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 9
                    DesignSize = (
                      150
                      48)
                    object edCep: TUniDBEdit
                      Tag = 1
                      Left = 2
                      Top = 16
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
                    object UniLabel12: TUniLabel
                      Left = 0
                      Top = -2
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
                  object rcBlock110: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = 140
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 10
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit8: TUniDBEdit
                      Left = 3
                      Top = 16
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'ENDERECO'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel13: TUniLabel
                      Left = 2
                      Top = -2
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
                  object rcBlock120: TUniContainerPanel
                    Tag = 1
                    Left = 372
                    Top = 140
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
                      Top = 16
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'NUMERO'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel14: TUniLabel
                      Left = 4
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
                  object rcBlock130: TUniContainerPanel
                    Tag = 1
                    Left = 542
                    Top = 140
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 12
                    DesignSize = (
                      150
                      48)
                    object UniLabel15: TUniLabel
                      Left = 2
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
                    object UniDBEdit10: TUniDBEdit
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
                  object rcBlock140: TUniContainerPanel
                    Tag = 1
                    Left = 705
                    Top = 140
                    Width = 200
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 13
                    DesignSize = (
                      200
                      48)
                    object UniLabel16: TUniLabel
                      Left = 1
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
                    object UniDBEdit11: TUniDBEdit
                      Left = 2
                      Top = 16
                      Width = 135
                      Height = 29
                      Hint = ''
                      DataField = 'CIDADE'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      TabOrder = 2
                    end
                    object UniLabel17: TUniLabel
                      Left = 144
                      Top = 0
                      Width = 37
                      Height = 15
                      Hint = ''
                      Caption = 'Estado'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 3
                    end
                    object UniDBComboBox4: TUniDBComboBox
                      Left = 144
                      Top = 16
                      Width = 50
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
                      TabOrder = 4
                      IconItems = <>
                    end
                  end
                  object rcBlock150: TUniContainerPanel
                    Left = 3
                    Top = 194
                    Width = 902
                    Height = 48
                    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                    ParentColor = False
                    TabOrder = 14
                    DesignSize = (
                      902
                      48)
                    object UniDBEdit12: TUniDBEdit
                      Left = 3
                      Top = 17
                      Width = 896
                      Height = 29
                      Hint = ''
                      DataField = 'ASSINATURA'
                      DataSource = dsMaster
                      CharCase = ecLowerCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel18: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 128
                      Height = 15
                      Hint = ''
                      Caption = 'Caminho Assinatura RT'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock160: TUniContainerPanel
                    Left = 3
                    Top = 249
                    Width = 343
                    Height = 200
                    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                    ParentColor = False
                    TabOrder = 15
                    object UniContainerPanel4: TUniContainerPanel
                      Left = 1
                      Top = 0
                      Width = 339
                      Height = 197
                      Hint = '[[round:no | cls:card-info-box-white]]'
                      ParentColor = False
                      Color = clWhite
                      TabOrder = 1
                      object imgUser: TUniImage
                        AlignWithMargins = True
                        Left = 3
                        Top = 11
                        Width = 333
                        Height = 146
                        Hint = ''
                        Center = True
                      end
                      object btnLoadImg: TUniBitBtn
                        AlignWithMargins = True
                        Left = 113
                        Top = 164
                        Width = 112
                        Height = 29
                        Hint = '[['#13#10'cls:ButtonThemeCrud |'#13#10']]'#13#10
                        Margins.Left = 4
                        Margins.Top = 4
                        Margins.Right = 4
                        Margins.Bottom = 4
                        Caption = 'Upload'
                        ParentFont = False
                        Font.Height = -16
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        OnClick = btnLoadImgClick
                      end
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
      'SELECT * FROM RESPONSAVEL')
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'RESPONSAVEL'
    SQL.Strings = (
      'SELECT * FROM RESPONSAVEL')
  end
  inherited FDQryCad: TFDQuery
    UpdateOptions.UpdateTableName = 'RESPONSAVEL'
    SQL.Strings = (
      'SELECT * FROM RESPONSAVEL WHERE CODIGO = :CODIGO')
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
      'SELECT * FROM RESPONSAVEL')
  end
  object uniFileUp: TUniFileUpload
    Title = 'Upload'
    Messages.Uploading = 'Enviando...'
    Messages.PleaseWait = 'Aguarde...'
    Messages.Cancel = 'Cancelar'
    Messages.Processing = 'Processando...'
    Messages.UploadError = 'Erro no Envio'
    Messages.Upload = 'Upload'
    Messages.NoFileError = 'Selecione um arquivo'
    Messages.BrowseText = 'Browse...'
    Messages.UploadTimeout = 'Timeout occurred...'
    Messages.MaxSizeError = 'File is bigger than maximum allowed size'
    Messages.MaxFilesError = 'You can upload maximum %d files.'
    TargetFolder = 'uploads'
    Overwrite = True
    OnCompleted = uniFileUpCompleted
    Left = 838
    Top = 7
  end
end
