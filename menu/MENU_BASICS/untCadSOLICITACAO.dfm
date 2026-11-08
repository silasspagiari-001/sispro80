inherited frmCadSOLICITACAO: TfrmCadSOLICITACAO
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
          inherited paBaseRegSearch: TUniContainerPanel
            inherited paGridOffset: TUniContainerPanel
              inherited dbgSearchCRUD: TUniDBGrid
                Columns = <
                  item
                    FieldName = 'KEY'
                    Title.Caption = ' '
                    Width = 30
                    Font.Name = 'Calibri'
                    Alignment = taCenter
                  end
                  item
                    FieldName = 'STATUS'
                    Title.Caption = 'STATUS ENVIO'
                    Width = 80
                    Font.Name = 'Calibri'
                    Alignment = taCenter
                  end
                  item
                    FieldName = 'ASSINADO'
                    Title.Caption = 'ASS'
                    Width = 60
                    Font.Name = 'Calibri'
                    Alignment = taCenter
                  end
                  item
                    FieldName = 'FINALIDADE'
                    Title.Caption = 'TIPO'
                    Width = 70
                    Font.Name = 'Calibri'
                    Alignment = taCenter
                  end
                  item
                    FieldName = 'EMISSAO'
                    Title.Caption = 'EMISS'#195'O'
                    Width = 80
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'CODIGO'
                    Title.Caption = 'NUMERO SOL.'
                    Width = 80
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'LABORATORIO'
                    Title.Caption = 'LAB'
                    Width = 55
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'NOME_LABORATORIO'
                    Title.Caption = 'NOME LABORAT'#211'RIO'
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
            object UniPageControlcadastros: TUniPageControl
              Left = 0
              Top = 0
              Width = 1315
              Height = 965
              Hint = ''
              ActivePage = UniTabSheetCRUD
              Align = alClient
              TabOrder = 0
              object UniTabSheetCRUD: TUniTabSheet
                Hint = ''
                Caption = 'Cadastro'
                object UniScrollBox2: TUniScrollBox
                  Left = 0
                  Top = 0
                  Width = 1307
                  Height = 935
                  Hint = ''
                  Align = alClient
                  TabOrder = 0
                  ScrollHeight = 549
                  ScrollWidth = 860
                  object rcBlock10: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = 3
                    Width = 179
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 0
                    DesignSize = (
                      179
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
                      Width = 176
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
                  object rcBlock30: TUniContainerPanel
                    Tag = 1
                    Left = 372
                    Top = 3
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 1
                    object UniDBDateTimePicker1: TUniDBDateTimePicker
                      Tag = 1
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'EMISSAO'
                      DataSource = dscrud
                      DateTime = 44554.000000000000000000
                      DateFormat = 'dd/MM/yyyy'
                      TimeFormat = 'HH:mm:ss'
                      TabOrder = 1
                      ClientEvents.ExtEvents.Strings = (
                        
                          'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
                          '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
                          '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
                          ':"  /  /   "});'#13#10'}')
                    end
                    object UniLabel13: TUniLabel
                      Left = 3
                      Top = 1
                      Width = 46
                      Height = 15
                      Hint = ''
                      Caption = 'Emiss'#227'o'
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
                    Width = 299
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-7]]'
                    ParentColor = False
                    TabOrder = 2
                    DesignSize = (
                      299
                      48)
                    object UniLabel5: TUniLabel
                      Left = 2
                      Top = 0
                      Width = 65
                      Height = 15
                      Hint = ''
                      Caption = 'Laborat'#243'rio'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object edLkpLABORATORIO: TUniDBEdit
                      Left = 2
                      Top = 17
                      Width = 296
                      Height = 29
                      Hint = 
                        '[['#13#10'NOME LABORATORIO |'#13#10'lkpfilter-empty:Selecione um Laboratorio' +
                        '<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-gridattr: |'#13#10'valid:b' +
                        'lank |'#13#10'valid-required:top-in |'#13#10']]'#13#10#13#10
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                      Color = clInfoBk
                      ReadOnly = True
                      InputType = 'text'
                    end
                  end
                  object rcBlock100: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = 61
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 3
                    DesignSize = (
                      150
                      48)
                    object UniLabel10: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 56
                      Height = 15
                      Hint = ''
                      Caption = 'Remetente'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniButtonDbEdit3: TUniButtonDbEdit
                      Tag = 1
                      AlignWithMargins = True
                      Left = 3
                      Top = 17
                      Width = 70
                      Height = 29
                      Hint = ''
                      DataField = 'REMETENTE'
                      DataSource = dscrud
                      TabOrder = 2
                      Color = clInfoBk
                      OnButtonClick = UniButtonDbEdit3ButtonClick
                      IconCls = 'search'
                    end
                    object UniButtonDbEdit2: TUniButtonDbEdit
                      Tag = 1
                      AlignWithMargins = True
                      Left = 84
                      Top = 17
                      Width = 66
                      Height = 29
                      Hint = ''
                      DataField = 'AMOSTRADOR'
                      DataSource = dscrud
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 3
                      Color = clInfoBk
                      OnButtonClick = UniButtonDbEdit2ButtonClick
                      IconCls = 'search'
                    end
                    object UniLabel7: TUniLabel
                      Left = 84
                      Top = 0
                      Width = 65
                      Height = 15
                      Hint = ''
                      Caption = 'Amostrador'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 4
                    end
                  end
                  object rcBlock110: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = 61
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 4
                    DesignSize = (
                      150
                      48)
                    object UniLabel11: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 89
                      Height = 15
                      Hint = ''
                      Caption = 'Respons'#225'vel R.T.'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniButtonDbEdit4: TUniButtonDbEdit
                      Tag = 1
                      AlignWithMargins = True
                      Left = 3
                      Top = 17
                      Width = 139
                      Height = 29
                      Hint = ''
                      DataField = 'RESPONSAVEL'
                      DataSource = dscrud
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      Color = clInfoBk
                      OnButtonClick = UniButtonDbEdit4ButtonClick
                      IconCls = 'search'
                    end
                  end
                  object rcBlock120: TUniContainerPanel
                    Tag = 1
                    Left = 372
                    Top = 61
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 5
                    DesignSize = (
                      150
                      48)
                    object UniLabel12: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 59
                      Height = 15
                      Hint = ''
                      Caption = 'Finalidade'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBComboBox2: TUniDBComboBox
                      Tag = 1
                      Left = 3
                      Top = 17
                      Width = 139
                      Height = 29
                      Hint = ''
                      Anchors = [akLeft, akTop, akRight]
                      DataField = 'FINALIDADE'
                      DataSource = dscrud
                      Style = csDropDownList
                      Items.Strings = (
                        'BAS'
                        'IR')
                      TabOrder = 2
                      IconItems = <>
                    end
                  end
                  object rcBlock130: TUniContainerPanel
                    Tag = 1
                    Left = 542
                    Top = 61
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 6
                    DesignSize = (
                      150
                      48)
                    object UniDBComboBox3: TUniDBComboBox
                      Tag = 1
                      Left = 3
                      Top = 17
                      Width = 139
                      Height = 29
                      Hint = ''
                      Anchors = [akLeft, akTop, akRight]
                      DataField = 'REVESTIDAS'
                      DataSource = dscrud
                      Style = csDropDownList
                      Items.Strings = (
                        'Sim'
                        'N'#227'o')
                      TabOrder = 1
                      IconItems = <>
                    end
                    object UniLabel14: TUniLabel
                      Left = 3
                      Top = 0
                      Width = 52
                      Height = 15
                      Hint = ''
                      Caption = 'Revestida'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock140: TUniContainerPanel
                    Tag = 1
                    Left = 710
                    Top = 61
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 7
                    DesignSize = (
                      150
                      48)
                    object UniDBComboBox4: TUniDBComboBox
                      Tag = 1
                      Left = 4
                      Top = 17
                      Width = 139
                      Height = 29
                      Hint = ''
                      Anchors = [akLeft, akTop, akRight]
                      DataField = 'TRATADA'
                      DataSource = dscrud
                      Style = csDropDownList
                      Items.Strings = (
                        'Sim'
                        'N'#227'o')
                      TabOrder = 1
                      IconItems = <>
                    end
                    object UniLabel15: TUniLabel
                      Left = 4
                      Top = 0
                      Width = 48
                      Height = 15
                      Hint = ''
                      Caption = 'Tratadas'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock150: TUniContainerPanel
                    Left = 3
                    Top = 115
                    Width = 857
                    Height = 51
                    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                    ParentColor = False
                    TabOrder = 8
                    object UniDBCheckBox2: TUniDBCheckBox
                      Left = 3
                      Top = 4
                      Width = 97
                      Height = 17
                      Hint = ''
                      DataField = 'ANA_PUREZA'
                      DataSource = dscrud
                      ValueChecked = 'T'
                      ValueUnchecked = 'F'
                      Caption = 'PUREZA'
                      TabOrder = 1
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox3: TUniDBCheckBox
                      Left = 3
                      Top = 27
                      Width = 97
                      Height = 17
                      Hint = ''
                      DataField = 'ANA_DSON'
                      DataSource = dscrud
                      ValueChecked = 'T'
                      ValueUnchecked = 'F'
                      Caption = 'DOSN'
                      TabOrder = 2
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox4: TUniDBCheckBox
                      Left = 106
                      Top = 4
                      Width = 97
                      Height = 17
                      Hint = ''
                      DataField = 'ANA_TZ'
                      DataSource = dscrud
                      ValueChecked = 'T'
                      ValueUnchecked = 'F'
                      Caption = 'TETRAZ'#211'LIO'
                      TabOrder = 3
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox5: TUniDBCheckBox
                      Left = 106
                      Top = 27
                      Width = 97
                      Height = 17
                      Hint = ''
                      DataField = 'ANA_GER'
                      DataSource = dscrud
                      ValueChecked = 'T'
                      ValueUnchecked = 'F'
                      Caption = 'GERMINA'#199#195'O'
                      TabOrder = 4
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox6: TUniDBCheckBox
                      Left = 209
                      Top = 4
                      Width = 97
                      Height = 17
                      Hint = ''
                      DataField = 'ANA_PMS'
                      DataSource = dscrud
                      ValueChecked = 'T'
                      ValueUnchecked = 'F'
                      Caption = 'P.M.S.'
                      TabOrder = 5
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox7: TUniDBCheckBox
                      Left = 209
                      Top = 27
                      Width = 134
                      Height = 17
                      Hint = ''
                      DataField = 'ANA_VE'
                      DataSource = dscrud
                      ValueChecked = 'T'
                      ValueUnchecked = 'F'
                      Caption = 'VERIFICA'#199#195'O ESP'#201'CIE'
                      TabOrder = 6
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox8: TUniDBCheckBox
                      Left = 365
                      Top = 4
                      Width = 69
                      Height = 17
                      Hint = ''
                      DataField = 'ANA_VIGOR'
                      DataSource = dscrud
                      ValueChecked = 'T'
                      ValueUnchecked = 'F'
                      Caption = 'VIGOR'
                      TabOrder = 7
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox9: TUniDBCheckBox
                      Left = 365
                      Top = 27
                      Width = 69
                      Height = 17
                      Hint = ''
                      DataField = 'ANA_VOC'
                      DataSource = dscrud
                      ValueChecked = 'T'
                      ValueUnchecked = 'F'
                      Caption = 'V.O.C.'
                      TabOrder = 8
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox11: TUniDBCheckBox
                      Left = 453
                      Top = 4
                      Width = 97
                      Height = 17
                      Hint = ''
                      DataField = 'ANA_UMI'
                      DataSource = dscrud
                      ValueChecked = 'T'
                      ValueUnchecked = 'F'
                      Caption = 'UMIDADE'
                      TabOrder = 9
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox10: TUniDBCheckBox
                      Left = 453
                      Top = 27
                      Width = 69
                      Height = 17
                      Hint = ''
                      DataField = 'ANA_SI'
                      DataSource = dscrud
                      ValueChecked = 'T'
                      ValueUnchecked = 'F'
                      Caption = 'S.I.'
                      TabOrder = 10
                      ParentColor = False
                      Color = clBtnFace
                    end
                  end
                  object rcBlock160: TUniContainerPanel
                    Left = 0
                    Top = 172
                    Width = 860
                    Height = 377
                    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                    ParentColor = False
                    TabOrder = 9
                    object UniDBGridsolicitacao: TUniDBGrid
                      Left = 0
                      Top = 0
                      Width = 860
                      Height = 377
                      Hint = ''
                      DataSource = dsdetalhes
                      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
                      WebOptions.Paged = False
                      LoadMask.Message = 'Carregando Item(s)...'
                      Align = alClient
                      Font.Color = clBlack
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      ParentFont = False
                      TabOrder = 1
                      Summary.Enabled = True
                      OnCellClick = UniDBGridsolicitacaoCellClick
                      Columns = <
                        item
                          FieldName = 'exclui'
                          Title.Caption = ' '
                          Width = 30
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                          Alignment = taCenter
                        end
                        item
                          FieldName = 'busca_lote'
                          Title.Caption = ' '
                          Width = 30
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                          Alignment = taCenter
                        end
                        item
                          FieldName = 'LOTE'
                          Title.Caption = 'LOTE'
                          Width = 150
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                        end
                        item
                          FieldName = 'ESPECIE'
                          Title.Caption = 'ESPECIE'
                          Width = 200
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                        end
                        item
                          FieldName = 'CULTIVAR'
                          Title.Caption = 'CULTIVAR'
                          Width = 200
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                        end
                        item
                          FieldName = 'SAFRA'
                          Title.Caption = 'SAFRA'
                          Width = 109
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                        end
                        item
                          FieldName = 'CATEGORIA'
                          Title.Caption = 'CAT'
                          Width = 80
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                          Alignment = taCenter
                        end
                        item
                          FieldName = 'REPRESENTATIVIDADE'
                          Title.Caption = 'REPRESE.'
                          Width = 100
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                        end
                        item
                          FieldName = 'PENEIRA'
                          Title.Caption = 'PENEIRA'
                          Width = 80
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                          Alignment = taCenter
                        end
                        item
                          FieldName = 'busca_cidade'
                          Title.Caption = ' '
                          Width = 30
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                          Alignment = taCenter
                        end
                        item
                          FieldName = 'PROCEDENCIA'
                          Title.Caption = 'PROCEDENCIA'
                          Width = 200
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                          ReadOnly = True
                        end
                        item
                          FieldName = 'ESTADO'
                          Title.Caption = 'U.F.'
                          Width = 50
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                          ReadOnly = True
                        end
                        item
                          FieldName = 'DATA_AMOSTRAGEM'
                          Title.Caption = 'DATA AM.'
                          Width = 100
                          Font.Color = clBlack
                          Font.Name = 'Calibri'
                          CheckBoxField.DisplayValues = 'DD/MM/YYYY'
                        end>
                    end
                  end
                  object rcBlock15: TUniContainerPanel
                    Tag = 1
                    Left = 235
                    Top = 7
                    Width = 53
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-1]]'
                    ParentColor = False
                    TabOrder = 10
                    object UniLabel4: TUniLabel
                      Left = 11
                      Top = 3
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
                      Left = 20
                      Top = 27
                      Width = 18
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
    Left = 116
    Top = 263
  end
  inherited sqlSearchMaster: TFDQuery
    SQL.Strings = (
      'select * from SOLICITACAO'
      '')
    Left = 207
    object sqlSearchMasterKEY: TStringField
      FieldName = 'KEY'
      Origin = '"KEY"'
      OnGetText = sqlSearchMasterKEYGetText
      Size = 38
    end
    object sqlSearchMasterCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlSearchMasterLABORATORIO: TIntegerField
      FieldName = 'LABORATORIO'
      Origin = 'LABORATORIO'
    end
    object sqlSearchMasterNOME_LABORATORIO: TStringField
      FieldName = 'NOME_LABORATORIO'
      Origin = 'NOME_LABORATORIO'
      Size = 100
    end
    object sqlSearchMasterFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Origin = 'FINALIDADE'
      OnGetText = sqlSearchMasterFINALIDADEGetText
      Size = 4
    end
    object sqlSearchMasterASSINADO: TStringField
      FieldName = 'ASSINADO'
      Origin = 'ASSINADO'
      OnGetText = sqlSearchMasterASSINADOGetText
      FixedChar = True
      Size = 1
    end
    object sqlSearchMasterSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      OnGetText = sqlSearchMasterSTATUSGetText
      Size = 10
    end
    object sqlSearchMasterEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object sqlSearchMasterNUMERO_TERMO: TStringField
      FieldName = 'NUMERO_TERMO'
      Origin = 'NUMERO_TERMO'
      Size = 15
    end
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'SOLICITACAO'
  end
  inherited FDQryCad: TFDQuery
    UpdateOptions.UpdateTableName = 'SOLICITACAO'
    SQL.Strings = (
      'select * from SOLICITACAO where codigo = :CODIGO')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  inherited dscrud: TDataSource
    Left = 187
    Top = 398
  end
  inherited FDQryFiltro: TFDQuery
    SQL.Strings = (
      'select * from SOLICITACAO')
    object FDQryFiltroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
    object FDQryFiltroEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
    end
    object FDQryFiltroLABORATORIO: TIntegerField
      FieldName = 'LABORATORIO'
      Origin = 'LABORATORIO'
    end
    object FDQryFiltroNOME_LABORATORIO: TStringField
      FieldName = 'NOME_LABORATORIO'
      Origin = 'NOME_LABORATORIO'
      Size = 100
    end
    object FDQryFiltroFINALIDADE: TStringField
      FieldName = 'FINALIDADE'
      Origin = 'FINALIDADE'
      OnGetText = FDQryFiltroFINALIDADEGetText
      Size = 4
    end
    object FDQryFiltroASSINADO: TStringField
      FieldName = 'ASSINADO'
      Origin = 'ASSINADO'
      OnGetText = FDQryFiltroASSINADOGetText
      FixedChar = True
      Size = 1
    end
    object FDQryFiltroCAMINHO: TStringField
      DisplayWidth = 300
      FieldName = 'CAMINHO'
      Origin = 'CAMINHO'
      Size = 300
    end
    object FDQryFiltroKEY: TStringField
      FieldName = 'KEY'
      Origin = '"KEY"'
      OnGetText = FDQryFiltroKEYGetText
      Size = 38
    end
    object FDQryFiltroSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      OnGetText = FDQryFiltroSTATUSGetText
      Size = 10
    end
    object FDQryFiltroRESPONSAVEL: TIntegerField
      FieldName = 'RESPONSAVEL'
      Origin = 'RESPONSAVEL'
    end
    object FDQryFiltroEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object FDQryFiltroNUMERO_TERMO: TStringField
      FieldName = 'NUMERO_TERMO'
      Size = 15
    end
  end
  inherited FDQryCaddetails: TFDQuery
    Left = 313
    Top = 271
  end
  inherited dscruddetails: TDataSource
    Left = 235
    Top = 207
  end
  inherited tbdetalhes: TFDMemTable
    AfterPost = tbdetalhesAfterPost
    object tbdetalhesESPECIE: TStringField
      FieldName = 'ESPECIE'
      Size = 80
    end
    object tbdetalhesCULTIVAR: TStringField
      FieldName = 'CULTIVAR'
      Size = 80
    end
    object tbdetalhesSAFRA: TStringField
      FieldName = 'SAFRA'
      Size = 15
    end
    object tbdetalhesCODIGO_LOTE: TIntegerField
      FieldName = 'CODIGO_LOTE'
    end
    object tbdetalhesLOTE: TStringField
      FieldName = 'LOTE'
      Size = 80
    end
    object tbdetalhesCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      Size = 10
    end
    object tbdetalhesREPRESENTATIVIDADE: TStringField
      FieldName = 'REPRESENTATIVIDADE'
    end
    object tbdetalhesIBGE: TIntegerField
      FieldName = 'IBGE'
    end
    object tbdetalhesPROCEDENCIA: TStringField
      FieldName = 'PROCEDENCIA'
      Size = 80
    end
    object tbdetalhesESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object tbdetalhesDATA_AMOSTRAGEM: TDateField
      FieldName = 'DATA_AMOSTRAGEM'
      EditMask = '99/99/9999'
    end
    object tbdetalhesPESOAMOSTRA: TFloatField
      FieldName = 'PESOAMOSTRA'
    end
    object tbdetalhesAMOSTRA: TStringField
      FieldName = 'AMOSTRA'
    end
    object tbdetalhesexclui: TStringField
      FieldName = 'exclui'
      OnGetText = tbdetalhesexcluiGetText
    end
    object tbdetalhesbusca_cidade: TStringField
      FieldName = 'busca_cidade'
      OnGetText = tbdetalhesbusca_cidadeGetText
      Size = 1
    end
    object tbdetalhesbusca_lote: TStringField
      FieldName = 'busca_lote'
      OnGetText = tbdetalhesbusca_loteGetText
    end
    object tbdetalhesPENEIRA: TStringField
      FieldName = 'PENEIRA'
    end
  end
  inherited dsdetalhes: TDataSource
    Left = 565
    Top = 500
  end
  object UniPopupMenudetalhes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 631
    Top = 6
    object O2: TUniMenuItem
      Caption = 'Op'#231#227'o Respons'#225'vel'
      ImageIndex = 127
      object I1: TUniMenuItem
        Caption = 'Impress'#227'o da Solicita'#231#227'o'
        ImageIndex = 52
        OnClick = I1Click
      end
      object N7: TUniMenuItem
        Caption = '-'
      end
      object G1: TUniMenuItem
        Caption = 'Gerar Assinatura Autom'#225'tica'
        ImageIndex = 128
        OnClick = G1Click
      end
      object N1_detalhes: TUniMenuItem
        Caption = '-'
      end
      object S1: TUniMenuItem
        Caption = 'Solicitar Assinatura  do R.T.'
        ImageIndex = 61
        OnClick = S1Click
      end
      object N6: TUniMenuItem
        Caption = '-'
      end
      object C3: TUniMenuItem
        Caption = 'Cancelar Solicita'#231#227'o do R.T.'
        ImageIndex = 57
        OnClick = C3Click
      end
    end
    object N3: TUniMenuItem
      Caption = '-'
      Visible = False
    end
    object O1: TUniMenuItem
      Caption = 'Op'#231#227'o Labotat'#243'rio'
      ImageIndex = 134
      Visible = False
      object C1: TUniMenuItem
        Caption = 'Enviar Solicita'#231#227'o - LABORAT'#211'RIO'
        ImageIndex = 32
      end
      object N2: TUniMenuItem
        Caption = '-'
      end
      object c2: TUniMenuItem
        Caption = 'Cancelar Solicita'#231#227'o - LABORAT'#211'RIO'
        ImageIndex = 29
      end
    end
    object N5: TUniMenuItem
      Caption = '-'
    end
    object d1: TUniMenuItem
      Caption = 'Termo de Coleta'
      ImageIndex = 37
      object L1: TUniMenuItem
        Caption = 'Lan'#231'amento da Informa'#231#227'o'
        ImageIndex = 62
        OnClick = L1Click
      end
      object N4: TUniMenuItem
        Caption = '-'
      end
      object I2: TUniMenuItem
        Caption = 'Impress'#227'o do Termo de Coleta'
        ImageIndex = 36
        OnClick = I2Click
      end
    end
  end
end
