inherited frmCadPLANOCONTAS: TfrmCadPLANOCONTAS
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
                    FieldName = 'PLANO'
                    Title.Caption = 'PLANO'
                    Width = 60
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'DESCRICAO'
                    Title.Caption = 'DESCRI'#199#195'O'
                    Width = 300
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'TIPO'
                    Title.Caption = 'TIPO'
                    Width = 70
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'DESTINO'
                    Title.Caption = 'DESTINO'
                    Width = 70
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'CUSTO'
                    Title.Caption = 'CUSTO'
                    Width = 70
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
                  ScrollHeight = 300
                  ScrollWidth = 898
                  object rcBlock515: TUniContainerPanel
                    Tag = 4
                    Left = 81
                    Top = 278
                    Width = 729
                    Height = 22
                    Hint = '[[cols:12 | round:all]]'
                    ParentColor = False
                    TabOrder = 0
                  end
                  object rcBlock2: TUniContainerPanel
                    Tag = 1
                    AlignWithMargins = True
                    Left = 15
                    Top = 5
                    Width = 883
                    Height = 250
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
                      Width = 884
                      Height = 36
                      Hint = '[['#13#10'cols:12 |'#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                      ParentColor = False
                      Color = clSilver
                      TabOrder = 0
                      DesignSize = (
                        884
                        36)
                      object labRcCollapseGeneral: TUniLabel
                        Left = 850
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
                        Width = 107
                        Height = 19
                        Hint = ''
                        Caption = 'Dados da Conta'
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
                      Width = 100
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 1
                      DesignSize = (
                        100
                        60)
                      object edCodigo: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 100
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
                        TabOrder = 1
                        Color = clGray
                        ReadOnly = True
                      end
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
                        TabOrder = 2
                      end
                    end
                    object rcBlock20: TUniContainerPanel
                      Tag = 1
                      Left = 126
                      Top = 45
                      Width = 60
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
                      Left = 192
                      Top = 45
                      Width = 670
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-9]]'
                      ParentColor = False
                      TabOrder = 3
                      DesignSize = (
                        670
                        60)
                      object UniLabel6: TUniLabel
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
                      object UniDBEdit2: TUniDBEdit
                        Tag = 1
                        Left = 0
                        Top = 21
                        Width = 670
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
                      Left = 20
                      Top = 110
                      Width = 210
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 4
                      DesignSize = (
                        210
                        60)
                      object UniDBEdit1: TUniDBEdit
                        Tag = 1
                        Left = 0
                        Top = 21
                        Width = 210
                        Height = 32
                        Hint = ''
                        DataField = 'PLANO'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniLabel5: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 89
                        Height = 15
                        Hint = ''
                        Caption = 'Plano de Contas'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock50: TUniContainerPanel
                      Tag = 1
                      Left = 236
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
                          'Entrada'
                          'Saida')
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
                      Left = 452
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
                        DataField = 'CUSTO'
                        DataSource = dsMaster
                        Style = csDropDownList
                        Items.Strings = (
                          'Variavel'
                          'Fixo')
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                        IconItems = <>
                      end
                      object UniLabel8: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 31
                        Height = 15
                        Hint = ''
                        Caption = 'Custo'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock70: TUniContainerPanel
                      Tag = 1
                      Left = 668
                      Top = 110
                      Width = 210
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 7
                      DesignSize = (
                        210
                        60)
                      object UniDBComboBox3: TUniDBComboBox
                        Tag = 1
                        Left = 0
                        Top = 21
                        Width = 210
                        Height = 32
                        Hint = ''
                        Anchors = [akLeft, akTop, akRight]
                        DataField = 'DESTINO'
                        DataSource = dsMaster
                        Style = csDropDownList
                        Items.Strings = (
                          'Contabil'
                          'Financeiro'
                          'Administrativo'
                          'Laboratorio')
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                        IconItems = <>
                      end
                      object UniLabel9: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 41
                        Height = 15
                        Hint = ''
                        Caption = 'Destino'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock80: TUniContainerPanel
                      Tag = 1
                      Left = 20
                      Top = 175
                      Width = 420
                      Height = 60
                      Hint = '[[cols:xs-6 sm-6 md-6]]'
                      ParentColor = False
                      TabOrder = 8
                      DesignSize = (
                        420
                        60)
                      object UniLabel10: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 70
                        Height = 15
                        Hint = ''
                        Caption = 'Centro Custo'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edLkpCENTROCUSTO: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 420
                        Height = 32
                        Hint = 
                          '[['#13#10'DESCRICAO CENTROCUSTO @60 ! +modal searchall |'#13#10'lkpfilter-em' +
                          'pty:Selecione um Centro de Custo<translate>|'#13#10'valid:blank'#13#10']]'
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        Color = clInfoBk
                        ReadOnly = True
                        InputType = 'text'
                        OnExit = edLkpCENTROCUSTOExit
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
      'select * from planocontas')
    Left = 1241
    Top = 315
  end
  inherited sqlMaster: TFDQuery
    SQL.Strings = (
      'select * from planocontas')
    Left = 1115
    Top = 249
  end
  inherited popMenuOptions: TUniPopupMenu
    Left = 418
    Top = 16
    object SubPlanos1: TUniMenuItem
      Caption = 'Sub Plano de Contas'
      OnClick = SubPlanos1Click
    end
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
end
