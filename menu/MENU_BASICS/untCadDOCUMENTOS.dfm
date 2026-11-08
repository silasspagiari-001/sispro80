inherited frmCadDOCUMENTOS: TfrmCadDOCUMENTOS
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
        inherited tabSearch: TUniTabSheet
          inherited paBaseRegSearch: TUniContainerPanel
            inherited paGridOffset: TUniContainerPanel
              inherited dbgSearchCRUD: TUniDBGrid
                Columns = <
                  item
                    FieldName = 'KEY'
                    Title.Caption = 'KEY'
                    Width = 64
                    Visible = False
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'DOCUMENTO'
                    Title.Caption = 'DOCUMENTO'
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
                    FieldName = 'SERIE'
                    Title.Caption = 'SERIE'
                    Width = 64
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'NUMERO'
                    Title.Caption = 'NUMERO'
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
                  DesignSize = (
                    1305
                    933)
                  ScrollHeight = 300
                  ScrollWidth = 855
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
                    Width = 840
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
                      Width = 841
                      Height = 36
                      Hint = '[['#13#10'cols:12 |'#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                      ParentColor = False
                      Color = clSilver
                      TabOrder = 0
                      DesignSize = (
                        841
                        36)
                      object labRcCollapseGeneral: TUniLabel
                        Left = 807
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
                        Width = 148
                        Height = 19
                        Hint = ''
                        Caption = 'Dados do Documento'
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
                      Width = 130
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 1
                      DesignSize = (
                        130
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
                        Left = 0
                        Top = 21
                        Width = 130
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
                      Left = 156
                      Top = 45
                      Width = 65
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
                      Left = 227
                      Top = 45
                      Width = 390
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-6]]'
                      ParentColor = False
                      TabOrder = 3
                      DesignSize = (
                        390
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
                        Width = 390
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
                      Left = 623
                      Top = 45
                      Width = 195
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 4
                      DesignSize = (
                        195
                        60)
                      object UniLabel6: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 78
                        Height = 15
                        Hint = ''
                        Caption = 'N'#186' Documento'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBEdit2: TUniDBEdit
                        Tag = 1
                        Left = 0
                        Top = 21
                        Width = 195
                        Height = 32
                        Hint = ''
                        DataField = 'DOCUMENTO'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock50: TUniContainerPanel
                      Tag = 1
                      Left = 20
                      Top = 110
                      Width = 106
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 5
                      DesignSize = (
                        106
                        60)
                      object UniDBNumberEdit1: TUniDBNumberEdit
                        Tag = 1
                        Left = 0
                        Top = 21
                        Width = 104
                        Height = 32
                        Hint = ''
                        DataField = 'NUMERO'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                        DecimalSeparator = ','
                      end
                      object UniLabel7: TUniLabel
                        Left = 0
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
                    object rcBlock60: TUniContainerPanel
                      Tag = 1
                      Left = 132
                      Top = 104
                      Width = 133
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 6
                      DesignSize = (
                        133
                        60)
                      object UniDBEdit3: TUniDBEdit
                        Tag = 1
                        Left = 0
                        Top = 21
                        Width = 133
                        Height = 32
                        Hint = ''
                        DataField = 'SERIE'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                        ExplicitWidth = 195
                      end
                      object UniLabel8: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 27
                        Height = 15
                        Hint = ''
                        Caption = 'S'#233'rie'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock70: TUniContainerPanel
                      Tag = 1
                      Left = 279
                      Top = 104
                      Width = 138
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-4]]'
                      ParentColor = False
                      TabOrder = 7
                      DesignSize = (
                        138
                        60)
                      object UniLabel9: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 54
                        Height = 15
                        Hint = ''
                        Caption = 'Opera'#231#227'o'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edLkpOPERACOES: TUniDBEdit
                        Tag = 1
                        Left = 0
                        Top = 21
                        Width = 138
                        Height = 32
                        Hint = 
                          '[['#13#10'DESCRICAO OPERACAO @60 ! +modal searchall |'#13#10'lkpfilter-empty' +
                          ':Selecione uma Opera'#231#227'o<translate>|'#13#10'valid:blank'#13#10']]'
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
                        ExplicitWidth = 195
                      end
                    end
                    object rcBlock90: TUniContainerPanel
                      Tag = 1
                      Left = 441
                      Top = 104
                      Width = 260
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-4]]'
                      ParentColor = False
                      TabOrder = 8
                      DesignSize = (
                        260
                        60)
                      object UniLabel11: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 52
                        Height = 15
                        Hint = ''
                        Caption = 'Condi'#231#227'o'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edLkpCONDICOES: TUniDBEdit
                        Tag = 1
                        Left = 0
                        Top = 21
                        Width = 260
                        Height = 32
                        Hint = 
                          '[['#13#10'DESCRICAO CONDICAO @60 ! +modal searchall |'#13#10'lkpfilter-empty' +
                          ':Selecione uma Condi'#231#227'o<translate>|'#13#10'valid:blank'#13#10']]'
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        Color = clInfoBk
                        ReadOnly = True
                        InputType = 'text'
                        OnExit = edLkpCONDICOESExit
                      end
                    end
                  end
                  object UniDBEdit4: TUniDBEdit
                    Tag = 1
                    Left = 91
                    Top = 329
                    Width = 133
                    Height = 32
                    Hint = ''
                    Visible = False
                    DataField = 'KEY'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
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
      'select * from documentos')
    Left = 1241
    Top = 315
  end
  inherited sqlMaster: TFDQuery
    SQL.Strings = (
      'select * from documentos')
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
end
