inherited frmCadOPERACOES: TfrmCadOPERACOES
  Font.Height = -15
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseTop: TUniContainerPanel
      inherited paBaseTopTitle: TUniContainerPanel
        inherited labCancel: TUniLabel [0]
        end
        inherited labTitleForm: TUniLabel [1]
          Top = 8
          Hint = '[['#13#10'caption-dots:mobile-v-16 |'#13#10'caption-id'#13#10']]'#13#10#13#10
          ExplicitTop = 8
        end
        inherited labExit: TUniLabel [2]
        end
        inherited labSave: TUniLabel [3]
        end
        inherited btnQuickSearch: TUniBitBtn [4]
          ScreenMask.Target = Owner
        end
        inherited labState: TUniLabel [5]
        end
        inherited labOptions: TUniLabel [6]
        end
        inherited edQuickSearch: TUniEdit [7]
        end
        inherited labEdit: TUniLabel [8]
        end
        inherited labDelete: TUniLabel [9]
        end
        inherited labNew: TUniLabel [10]
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
          inherited paBaseRegSearch: TUniContainerPanel
            inherited paGridOffset: TUniContainerPanel
              inherited dbgSearchCRUD: TUniDBGrid
                Columns = <
                  item
                    FieldName = 'KEY'
                    Title.Caption = 'KEY'
                    Width = 64
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'CODIGO'
                    Title.Caption = 'CODIGO'
                    Width = 64
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'DESCRICAO'
                    Title.Caption = 'DESCRI'#199#195'O'
                    Width = 300
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'REFERENCIA'
                    Title.Caption = 'REFER'#202'NCIA'
                    Width = 250
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'SUBSTITUICAO'
                    Title.Caption = 'SUBSTITUICAO'
                    Width = 64
                    Font.Name = 'Calibri'
                  end>
              end
              inherited paNotFound_dbgSearchCRUD: TUniContainerPanel
                inherited imgNoRecords_dbgSearchCRUD: TUniLabel
                  Anchors = [akLeft, akTop, akBottom]
                end
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
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              ActivePage = tabGeral
              Align = alClient
              TabOrder = 1
              object tabGeral: TUniTabSheet
                Hint = ''
                Caption = 'Geral'
                object sboxGridBlockTab1: TUniScrollBox
                  Left = 0
                  Top = 0
                  Width = 1307
                  Height = 935
                  Hint = ''
                  Align = alClient
                  TabOrder = 0
                  ScrollHeight = 527
                  ScrollWidth = 956
                  object rcBlock515: TUniContainerPanel
                    Tag = 4
                    Left = 84
                    Top = 505
                    Width = 729
                    Height = 22
                    Hint = '[[cols:12 | round:all]]'
                    ParentColor = False
                    TabOrder = 0
                  end
                  object rcBlock2: TUniContainerPanel
                    Tag = 1
                    AlignWithMargins = True
                    Left = 43
                    Top = -1
                    Width = 913
                    Height = 468
                    Hint = 
                      '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'hr-childs:xs-exp sm-exp md-exp |'#13 +
                      #10'round:no | '#13#10'cls:card-info-box-white |'#13#10']]'
                    Margins.Left = 15
                    Margins.Top = 15
                    Margins.Right = 15
                    Margins.Bottom = 10
                    ParentColor = False
                    TabOrder = 1
                    object rcBlock3: TUniContainerPanel
                      Left = -1
                      Top = 0
                      Width = 914
                      Height = 36
                      Hint = '[['#13#10'cols:12 |'#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                      ParentColor = False
                      Color = clSilver
                      TabOrder = 0
                      DesignSize = (
                        914
                        36)
                      object labRcCollapseGeneral: TUniLabel
                        Left = 880
                        Top = 8
                        Width = 10
                        Height = 26
                        Hint = '[['#13#10'collapse:rcBlock2 off-42 '#13#10']]'#13#10
                        TextConversion = txtHTML
                        Caption = '^'
                        Anchors = [akTop, akRight]
                        ParentFont = False
                        Font.Height = -21
                        Font.Name = 'Calibri'
                        ParentColor = False
                        Color = clBlack
                        TabOrder = 1
                      end
                      object labTitleCardGeral: TUniLabel
                        Left = 8
                        Top = 8
                        Width = 133
                        Height = 19
                        Hint = ''
                        Caption = 'Dados da Opera'#231#227'o'
                        ParentFont = False
                        Font.Height = -16
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold]
                        TabOrder = 2
                      end
                    end
                    object rcBlock10: TUniContainerPanel
                      Tag = 1
                      Left = 20
                      Top = 45
                      Width = 140
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 1
                      DesignSize = (
                        140
                        60)
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
                        Tag = 1
                        Left = 0
                        Top = 21
                        Width = 140
                        Height = 32
                        Hint = 
                          '[['#13#10'state-font-color:i-[[EDIT_COLOR_READONLY]] e-[[EDIT_FONT_COL' +
                          'OR]] b-[[EDIT_FONT_COLOR]] '#13#10']]'
                        DataField = 'CODIGO'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Color = clWhite
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold]
                        TabOrder = 2
                        Color = clGray
                        ReadOnly = True
                      end
                    end
                    object rcBlock20: TUniContainerPanel
                      Tag = 1
                      Left = 166
                      Top = 45
                      Width = 70
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-1]]'
                      ParentColor = False
                      TabOrder = 2
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
                        Left = 14
                        Top = 28
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
                      Left = 242
                      Top = 45
                      Width = 350
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-5]]'
                      ParentColor = False
                      TabOrder = 3
                      DesignSize = (
                        350
                        60)
                      object UniLabel5: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 55
                        Height = 15
                        Hint = ''
                        Caption = 'Descri'#231#227'o'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBEdit1: TUniDBEdit
                        Tag = 1
                        Left = 0
                        Top = 21
                        Width = 350
                        Height = 32
                        Hint = ''
                        DataField = 'DESCRICAO'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock40: TUniContainerPanel
                      Tag = 1
                      Left = 598
                      Top = 45
                      Width = 280
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-4]]'
                      ParentColor = False
                      TabOrder = 4
                      DesignSize = (
                        280
                        60)
                      object UniDBEdit2: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 280
                        Height = 32
                        Hint = ''
                        DataField = 'REFERENCIA'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniLabel6: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 58
                        Height = 15
                        Hint = ''
                        Caption = 'Refer'#234'ncia'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock50: TUniContainerPanel
                      Tag = 1
                      Left = 20
                      Top = 110
                      Width = 210
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 5
                      DesignSize = (
                        210
                        60)
                      object UniDBComboBox1: TUniDBComboBox
                        Tag = 1
                        Left = 0
                        Top = 21
                        Width = 210
                        Height = 32
                        Hint = ''
                        Anchors = [akLeft, akTop, akRight]
                        DataField = 'TIPO'
                        DataSource = dsMaster
                        Style = csDropDownList
                        Items.Strings = (
                          'Normal'
                          'Ajuste'
                          'Complementar'
                          'Devolucao')
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                        IconItems = <>
                      end
                      object UniLabel7: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 24
                        Height = 15
                        Hint = ''
                        Caption = 'Tipo'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock60: TUniContainerPanel
                      Tag = 1
                      Left = 236
                      Top = 110
                      Width = 210
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 6
                      DesignSize = (
                        210
                        60)
                      object UniDBComboBox2: TUniDBComboBox
                        Tag = 1
                        Left = 0
                        Top = 21
                        Width = 210
                        Height = 32
                        Hint = ''
                        Anchors = [akLeft, akTop, akRight]
                        DataField = 'OPERACAO_OP'
                        DataSource = dsMaster
                        Style = csDropDownList
                        Items.Strings = (
                          'Vendas'
                          'Bonificacao'
                          'Devolucao'
                          'Troca'
                          'Amostra'
                          'Venda EF'
                          'Estoque'
                          'Outros')
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                        IconItems = <>
                      end
                      object UniLabel8: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 97
                        Height = 15
                        Hint = ''
                        Caption = 'Tipo de Opera'#231#227'o'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock70: TUniContainerPanel
                      Tag = 1
                      Left = 452
                      Top = 110
                      Width = 210
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 7
                      DesignSize = (
                        210
                        60)
                      object UniLabel9: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 100
                        Height = 15
                        Hint = ''
                        Caption = 'CFOP Substitui'#231#227'o'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edLkpOPERACOES: TUniDBEdit
                        Tag = 1
                        Left = 0
                        Top = 21
                        Width = 210
                        Height = 32
                        Hint = 
                          '[['#13#10'DESCRICAO SUBSTITUICAO @60 ! +modal searchall |'#13#10'lkpfilter-e' +
                          'mpty:Selecione uma Opera'#231#227'o<translate>|'#13#10'valid:blank'#13#10']]'
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        Color = clInfoBk
                        ReadOnly = True
                        InputType = 'text'
                        OnExit = edLkpOPERACOESExit
                      end
                    end
                    object rcBlock80: TUniContainerPanel
                      Tag = 1
                      Left = 668
                      Top = 111
                      Width = 210
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 8
                      DesignSize = (
                        210
                        60)
                      object UniLabel10: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 57
                        Height = 15
                        Hint = ''
                        Caption = 'Conv'#234'nios'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edLkpESCRITAS: TUniDBEdit
                        Tag = 1
                        Left = 0
                        Top = 21
                        Width = 210
                        Height = 32
                        Hint = 
                          '[['#13#10'DESCRICAO ESCRITA @60 ! +modal searchall |'#13#10'lkpfilter-empty:' +
                          'Selecione uma Escrita<translate>|'#13#10'valid:blank'#13#10']]'
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        Color = clInfoBk
                        ReadOnly = True
                        InputType = 'text'
                        OnExit = edLkpESCRITASExit
                      end
                    end
                    object rcBlock90: TUniContainerPanel
                      Tag = 1
                      Left = 20
                      Top = 162
                      Width = 210
                      Height = 150
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 9
                      object UniDBRadioGroup1: TUniDBRadioGroup
                        Left = 0
                        Top = 0
                        Width = 208
                        Height = 145
                        Hint = ''
                        DataField = 'ENTRADA_SAIDA'
                        DataSource = dsMaster
                        Caption = 'Entrada/Saida'
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                        Items.Strings = (
                          'Entrada'
                          'Saida')
                        Values.Strings = (
                          '0'
                          '1')
                      end
                    end
                    object rcBlock100: TUniContainerPanel
                      Tag = 1
                      Left = 236
                      Top = 157
                      Width = 210
                      Height = 150
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 10
                      object UniDBRadioGroup2: TUniDBRadioGroup
                        Left = 0
                        Top = 0
                        Width = 208
                        Height = 145
                        Hint = ''
                        DataField = 'ESTOQUE'
                        DataSource = dsMaster
                        Caption = 'Estoque'
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                        Items.Strings = (
                          'Credita'
                          'Debita'
                          'Nulo')
                        Values.Strings = (
                          '0'
                          '1'
                          '2')
                      end
                    end
                    object rcBlock110: TUniContainerPanel
                      Tag = 1
                      Left = 468
                      Top = 169
                      Width = 210
                      Height = 150
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 11
                      object UniDBRadioGroup3: TUniDBRadioGroup
                        Left = 5
                        Top = 2
                        Width = 208
                        Height = 145
                        Hint = ''
                        DataField = 'FINANCEIRO'
                        DataSource = dsMaster
                        Caption = 'Financeiro'
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                        Items.Strings = (
                          'Pagar'
                          'Receber'
                          'Nulo')
                        Values.Strings = (
                          '0'
                          '1'
                          '2')
                      end
                    end
                    object rcBlock120: TUniContainerPanel
                      Tag = 1
                      Left = 687
                      Top = 170
                      Width = 194
                      Height = 132
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 12
                      object UniLabel11: TUniLabel
                        Left = 147
                        Top = 2
                        Width = 33
                        Height = 24
                        Hint = '[[bsswt:0 field:CALCULA_ICMS]]'
                        TextConversion = txtHTML
                        AutoSize = False
                        Caption = 'Opt2'
                        ParentFont = False
                        Font.Height = -16
                        Font.Name = 'Calibri'
                        Font.Style = [fsUnderline]
                        ParentColor = False
                        Color = clBtnFace
                        TabOrder = 1
                      end
                      object UniLabel1: TUniLabel
                        Left = 147
                        Top = 23
                        Width = 33
                        Height = 24
                        Hint = '[[bsswt:0 field:UNICA]]'
                        TextConversion = txtHTML
                        AutoSize = False
                        Caption = 'Opt2'
                        ParentFont = False
                        Font.Height = -16
                        Font.Name = 'Calibri'
                        Font.Style = [fsUnderline]
                        ParentColor = False
                        Color = clBtnFace
                        TabOrder = 2
                      end
                      object UniLabel2: TUniLabel
                        Left = 146
                        Top = 45
                        Width = 33
                        Height = 24
                        Hint = '[[bsswt:0 field:CALCULA_IPI]]'
                        TextConversion = txtHTML
                        AutoSize = False
                        Caption = 'Opt2'
                        ParentFont = False
                        Font.Height = -16
                        Font.Name = 'Calibri'
                        Font.Style = [fsUnderline]
                        ParentColor = False
                        Color = clBtnFace
                        TabOrder = 3
                      end
                      object UniLabel12: TUniLabel
                        Left = 147
                        Top = 67
                        Width = 33
                        Height = 24
                        Hint = '[[bsswt:0 field:CALCULA_ICMS_SOBRE_NOTA]]'
                        TextConversion = txtHTML
                        AutoSize = False
                        Caption = 'Opt2'
                        ParentFont = False
                        Font.Height = -16
                        Font.Name = 'Calibri'
                        Font.Style = [fsUnderline]
                        ParentColor = False
                        Color = clBtnFace
                        TabOrder = 4
                      end
                      object UniLabel13: TUniLabel
                        Left = 147
                        Top = 91
                        Width = 33
                        Height = 24
                        Hint = '[[bsswt:0 field:GERA_SPED]]'
                        TextConversion = txtHTML
                        AutoSize = False
                        Caption = 'Opt2'
                        ParentFont = False
                        Font.Height = -16
                        Font.Name = 'Calibri'
                        Font.Style = [fsUnderline]
                        ParentColor = False
                        Color = clBtnFace
                        TabOrder = 5
                      end
                      object UniLabel14: TUniLabel
                        Left = 61
                        Top = 7
                        Width = 67
                        Height = 15
                        Hint = ''
                        Caption = 'Calcula ICMS'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold]
                        TabOrder = 6
                      end
                      object UniLabel15: TUniLabel
                        Left = 45
                        Top = 28
                        Width = 84
                        Height = 15
                        Hint = ''
                        Caption = 'Opera'#231#227'o Unica'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold]
                        TabOrder = 7
                      end
                      object UniLabel16: TUniLabel
                        Left = 67
                        Top = 50
                        Width = 61
                        Height = 15
                        Hint = ''
                        Caption = 'Calcula I.P.I.'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold]
                        TabOrder = 8
                      end
                      object UniLabel17: TUniLabel
                        Left = 33
                        Top = 72
                        Width = 95
                        Height = 15
                        Hint = ''
                        Caption = 'ICMS sobre NOTA'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold]
                        TabOrder = 9
                      end
                      object UniLabel18: TUniLabel
                        Left = 14
                        Top = 96
                        Width = 114
                        Height = 15
                        Hint = ''
                        Caption = 'Opera'#231#227'o GERA SPED'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold]
                        TabOrder = 10
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
  inherited rcSweetAlert: TUniSweetAlert
    Left = 960
    Top = 26
  end
  inherited dsMaster: TDataSource
    Left = 1186
    Top = 251
  end
  inherited dsSearchMaster: TDataSource
    Left = 1210
    Top = 413
  end
  inherited sqlSearchMaster: TFDQuery
    SQL.Strings = (
      'select * from operacoes')
    Left = 1241
    Top = 315
  end
  inherited sqlMaster: TFDQuery
    SQL.Strings = (
      'select * from operacoes')
    Left = 1115
    Top = 249
  end
  inherited popMenuOptions: TUniPopupMenu
    Left = 418
    Top = 16
  end
  inherited FDSchemaAdapter1: TFDSchemaAdapter
    Left = 1110
    Top = 406
  end
  inherited FDQryCad: TFDQuery
    Left = 1193
    Top = 166
  end
  inherited dscrud: TDataSource
    Left = 1115
    Top = 174
  end
  inherited FDQryFiltro: TFDQuery
    Left = 1121
    Top = 326
  end
  inherited FDQryCaddetails: TFDQuery
    Left = 785
    Top = 31
  end
  inherited dscruddetails: TDataSource
    Left = 883
    Top = 23
  end
  inherited tbdetalhes: TFDMemTable
    Left = 1141
    Top = 604
  end
  inherited dsdetalhes: TDataSource
    Left = 1253
    Top = 628
  end
end
