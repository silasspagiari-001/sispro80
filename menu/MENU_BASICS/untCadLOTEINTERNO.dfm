inherited frmCadLOTEINTERNO: TfrmCadLOTEINTERNO
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
                    FieldName = 'opcao'
                    Title.Caption = ' '
                    Width = 30
                    Font.Name = 'Calibri'
                    Alignment = taCenter
                  end
                  item
                    FieldName = 'TIPO'
                    Title.Caption = ' '
                    Width = 80
                    Font.Name = 'Calibri'
                    Alignment = taCenter
                  end
                  item
                    FieldName = 'BARRACAO'
                    Title.Caption = 'BARRAC'#195'O'
                    Width = 100
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'POSICAO'
                    Title.Caption = 'POSI'#199#195'O'
                    Width = 100
                    Font.Name = 'Calibri'
                    Alignment = taCenter
                  end
                  item
                    FieldName = 'LOTE'
                    Title.Caption = 'LOTE'
                    Width = 80
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'DESCRICAO'
                    Title.Caption = 'DESCRICAO'
                    Width = 300
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'DISPONIVEL'
                    Title.Caption = 'DISPONIVEL'
                    Width = 90
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'TOTALPONTOS'
                    Title.Caption = 'PONTOS'
                    Width = 100
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
                  ScrollHeight = 505
                  ScrollWidth = 898
                  object rcBlock515: TUniContainerPanel
                    Tag = 4
                    Left = 81
                    Top = 178
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
                    Height = 500
                    Hint = 
                      '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'round:no | '#13#10'cls:card-info-box-wh' +
                      'ite |'#13#10']]'
                    Margins.Left = 15
                    Margins.Top = 15
                    Margins.Right = 15
                    Margins.Bottom = 10
                    ParentColor = False
                    TabOrder = 1
                    DesignSize = (
                      883
                      500)
                    object rcBlock3: TUniContainerPanel
                      Left = -1
                      Top = 0
                      Width = 884
                      Height = 36
                      Hint = '[['#13#10'cols:12 |'#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                      ParentColor = False
                      Color = clSilver
                      TabOrder = 18
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
                        Width = 153
                        Height = 19
                        Hint = ''
                        Caption = 'Dados do Lote Interno'
                        ParentFont = False
                        Font.Height = -16
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold]
                        TabOrder = 2
                      end
                    end
                    object rcBlock10: TUniContainerPanel
                      Tag = 1
                      Left = 3
                      Top = 3
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
                        Left = 1
                        Top = 18
                        Width = 147
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
                      Hint = '[[cols:xs-12 sm-12 md-1]]'
                      ParentColor = False
                      TabOrder = 1
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
                        TabOrder = 1
                        ParentColor = False
                        Color = clBtnFace
                      end
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
                        TabOrder = 2
                      end
                    end
                    object rcBlock30: TUniContainerPanel
                      Tag = 1
                      Left = 382
                      Top = 3
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 2
                      DesignSize = (
                        150
                        48)
                      object UniLabel5: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 44
                        Height = 15
                        Hint = ''
                        Caption = 'Posi'#231#227'o'
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
                        DataField = 'POSICAO'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                      end
                    end
                    object rcBlock40: TUniContainerPanel
                      Tag = 1
                      Left = 558
                      Top = 2
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-5]]'
                      ParentColor = False
                      TabOrder = 3
                      DesignSize = (
                        150
                        48)
                      object UniDBComboBoxbarracao: TUniDBComboBox
                        Tag = 1
                        Left = 4
                        Top = 19
                        Width = 142
                        Height = 29
                        Hint = ''
                        Anchors = [akLeft, akTop, akRight]
                        DataField = 'BARRACAO'
                        DataSource = dsMaster
                        Style = csDropDownList
                        Items.Strings = (
                          'Contabil'
                          'Financeiro'
                          'Administrativo'
                          'Laboratorio')
                        TabOrder = 1
                        IconItems = <>
                      end
                      object UniLabel6: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 51
                        Height = 15
                        Hint = ''
                        Caption = 'Barrac'#227'o'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock50: TUniContainerPanel
                      Left = 3
                      Top = 59
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-4]]'
                      ParentColor = False
                      TabOrder = 4
                      DesignSize = (
                        150
                        48)
                      object edLkpPRODUTOS: TUniDBEdit
                        Tag = 1
                        Left = 3
                        Top = 18
                        Width = 144
                        Height = 29
                        Hint = 
                          '[['#13#10'DESCRICAO PRODUTO @60 ! +modal searchall |'#13#10'lkpfilter-empty:' +
                          'Selecione um Produto<translate>|'#13#10'valid:blank'#13#10']]'
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        ReadOnly = True
                        InputType = 'text'
                        OnExit = edLkpPRODUTOSExit
                      end
                      object UniLabel10: TUniLabel
                        AlignWithMargins = True
                        Left = 3
                        Top = 0
                        Width = 44
                        Height = 15
                        Hint = ''
                        Margins.Top = 1
                        Margins.Bottom = 2
                        Caption = 'Produto'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock60: TUniContainerPanel
                      Left = 196
                      Top = 59
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-8]]'
                      ParentColor = False
                      TabOrder = 5
                      DesignSize = (
                        150
                        48)
                      object UniDBEdit2: TUniDBEdit
                        Left = 2
                        Top = 18
                        Width = 145
                        Height = 29
                        Hint = '[[valid:blank=Nome]]'
                        DataField = 'DESCRICAO'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        ReadOnly = True
                      end
                      object UniLabel11: TUniLabel
                        AlignWithMargins = True
                        Left = 2
                        Top = 0
                        Width = 119
                        Height = 15
                        Hint = ''
                        Margins.Top = 1
                        Margins.Bottom = 2
                        Caption = 'Descri'#231#227'o do Produto'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock70: TUniContainerPanel
                      Tag = 1
                      Left = 3
                      Top = 118
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 6
                      DesignSize = (
                        150
                        48)
                      object UniLabel7: TUniLabel
                        AlignWithMargins = True
                        Left = 3
                        Top = 0
                        Width = 22
                        Height = 15
                        Hint = ''
                        Margins.Top = 1
                        Margins.Bottom = 2
                        Caption = 'Lote'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBEdit3: TUniDBEdit
                        Tag = 1
                        Left = 3
                        Top = 17
                        Width = 145
                        Height = 29
                        Hint = '[[valid:blank=Nome]]'
                        DataField = 'LOTE'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                      end
                    end
                    object rcBlock80: TUniContainerPanel
                      Tag = 1
                      Left = 196
                      Top = 118
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 7
                      DesignSize = (
                        150
                        48)
                      object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
                        Tag = 1
                        Left = 2
                        Top = 17
                        Width = 145
                        Height = 29
                        Hint = ''
                        DataField = 'PUREZA'
                        DataSource = dsMaster
                        Alignment = taCenter
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Color = clBlue
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold, fsItalic]
                        TabOrder = 1
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel25: TUniLabel
                        AlignWithMargins = True
                        Left = 2
                        Top = 0
                        Width = 49
                        Height = 15
                        Hint = ''
                        Margins.Top = 1
                        Margins.Bottom = 2
                        Caption = '% Pureza'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock90: TUniContainerPanel
                      Tag = 1
                      Left = 372
                      Top = 118
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 8
                      DesignSize = (
                        150
                        48)
                      object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                        Tag = 1
                        Left = 3
                        Top = 17
                        Width = 144
                        Height = 29
                        Hint = ''
                        DataField = 'GERMINACAO'
                        DataSource = dsMaster
                        Alignment = taCenter
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Color = clBlue
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold, fsItalic]
                        TabOrder = 1
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel8: TUniLabel
                        AlignWithMargins = True
                        Left = 2
                        Top = 0
                        Width = 79
                        Height = 15
                        Hint = ''
                        Margins.Top = 1
                        Margins.Bottom = 2
                        Caption = '% Germina'#231#227'o'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock100: TUniContainerPanel
                      Tag = 1
                      Left = 542
                      Top = 118
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 9
                      DesignSize = (
                        150
                        48)
                      object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
                        Tag = 1
                        Left = 3
                        Top = 17
                        Width = 144
                        Height = 29
                        Hint = ''
                        DataField = 'TETRAZOLIO'
                        DataSource = dsMaster
                        Alignment = taCenter
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Color = clBlue
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold, fsItalic]
                        TabOrder = 1
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel9: TUniLabel
                        AlignWithMargins = True
                        Left = 3
                        Top = 0
                        Width = 66
                        Height = 15
                        Hint = ''
                        Margins.Top = 1
                        Margins.Bottom = 2
                        Caption = '% Tetraz'#243'lio'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock110: TUniContainerPanel
                      Tag = 1
                      Left = 710
                      Top = 118
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 10
                      DesignSize = (
                        150
                        48)
                      object UniDBEdit4: TUniDBEdit
                        Left = 2
                        Top = 17
                        Width = 145
                        Height = 29
                        Hint = '[[valid:blank=Nome]]'
                        DataField = 'SAFRAVALIDA'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                      end
                      object UniLabel12: TUniLabel
                        AlignWithMargins = True
                        Left = 3
                        Top = 0
                        Width = 67
                        Height = 15
                        Hint = ''
                        Margins.Top = 1
                        Margins.Bottom = 2
                        Caption = 'Safra V'#225'lida'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock120: TUniContainerPanel
                      Tag = 1
                      Left = 3
                      Top = 172
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-4]]'
                      ParentColor = False
                      TabOrder = 11
                      DesignSize = (
                        150
                        48)
                      object UniLabel13: TUniLabel
                        Left = 3
                        Top = 1
                        Width = 42
                        Height = 15
                        Hint = ''
                        Caption = 'Peso SC'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit
                        Tag = 1
                        Left = 1
                        Top = 17
                        Width = 146
                        Height = 29
                        Hint = ''
                        DataField = 'PESOEMBALAGEM'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                    end
                    object rcBlock130: TUniContainerPanel
                      Tag = 1
                      Left = 196
                      Top = 172
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-4]]'
                      ParentColor = False
                      TabOrder = 12
                      DesignSize = (
                        150
                        48)
                      object UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit
                        Tag = 1
                        Left = 2
                        Top = 17
                        Width = 144
                        Height = 29
                        Hint = ''
                        DataField = 'DISPONIVEL'
                        DataSource = dsMaster
                        Alignment = taCenter
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Color = clBlue
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold, fsItalic]
                        TabOrder = 1
                        ReadOnly = True
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel14: TUniLabel
                        Left = 3
                        Top = 1
                        Width = 48
                        Height = 15
                        Hint = ''
                        Caption = 'Saldo KG'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock140: TUniContainerPanel
                      Tag = 1
                      Left = 372
                      Top = 172
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-4]]'
                      ParentColor = False
                      TabOrder = 13
                      DesignSize = (
                        150
                        48)
                      object UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit
                        Tag = 1
                        Left = 3
                        Top = 17
                        Width = 144
                        Height = 29
                        Hint = ''
                        DataField = 'TOTALPONTOS'
                        DataSource = dsMaster
                        Alignment = taCenter
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Color = clBlue
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold, fsItalic]
                        TabOrder = 1
                        ReadOnly = True
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel15: TUniLabel
                        Left = 3
                        Top = 1
                        Width = 72
                        Height = 15
                        Hint = ''
                        Caption = 'Saldo Pontos'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock150: TUniContainerPanel
                      Left = 3
                      Top = 226
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-6]]'
                      ParentColor = False
                      TabOrder = 14
                      DesignSize = (
                        150
                        48)
                      object UniDBComboBox2: TUniDBComboBox
                        Tag = 1
                        Left = 3
                        Top = 18
                        Width = 142
                        Height = 29
                        Hint = ''
                        Anchors = [akLeft, akTop, akRight]
                        DataField = 'TIPO'
                        DataSource = dsMaster
                        Style = csDropDownList
                        Items.Strings = (
                          'Produto Acabado'
                          'Sementes'
                          'Insumos'
                          'Sacaria')
                        TabOrder = 1
                        IconItems = <>
                      end
                      object UniLabel16: TUniLabel
                        Left = 3
                        Top = 1
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
                    object rcBlock160: TUniContainerPanel
                      Left = 196
                      Top = 226
                      Width = 326
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-6]]'
                      ParentColor = False
                      TabOrder = 15
                      DesignSize = (
                        326
                        48)
                      object UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit
                        Tag = 1
                        Left = 179
                        Top = 18
                        Width = 144
                        Height = 29
                        Hint = ''
                        DataField = 'CUSTO_UNITARIO'
                        DataSource = dsMaster
                        Alignment = taCenter
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Color = clBlue
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold, fsItalic]
                        TabOrder = 1
                        DecimalPrecision = 4
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel17: TUniLabel
                        Left = 179
                        Top = 1
                        Width = 69
                        Height = 15
                        Hint = ''
                        Caption = 'Custo por Kg'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                      object UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit
                        Tag = 1
                        Left = 3
                        Top = 18
                        Width = 170
                        Height = 29
                        Hint = ''
                        DataField = 'CUSTO_PONTO'
                        DataSource = dsMaster
                        Alignment = taCenter
                        ParentFont = False
                        Font.Color = clBlue
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold, fsItalic]
                        TabOrder = 3
                        DecimalPrecision = 4
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel18: TUniLabel
                        Left = 3
                        Top = 1
                        Width = 88
                        Height = 15
                        Hint = ''
                        Caption = 'Custo por Ponto'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 4
                      end
                    end
                    object rcBlock170: TUniContainerPanel
                      Left = 3
                      Top = 280
                      Width = 150
                      Height = 48
                      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                      ParentColor = False
                      TabOrder = 16
                      DesignSize = (
                        150
                        48)
                      object UniLabel19: TUniLabel
                        Left = 5
                        Top = 2
                        Width = 65
                        Height = 15
                        Hint = ''
                        Caption = 'C'#243'digo - "P"'
                        ParentFont = False
                        Font.Color = clBlue
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBEdit5: TUniDBEdit
                        Left = 3
                        Top = 17
                        Width = 145
                        Height = 29
                        Hint = ''
                        DataField = 'CODIGOP'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                        ReadOnly = True
                      end
                    end
                    object UniDBEdit6: TUniDBEdit
                      Left = 46
                      Top = 418
                      Width = 147
                      Height = 29
                      Hint = ''
                      Visible = False
                      DataField = 'PRODUTO'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Color = clWhite
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      Font.Style = [fsBold]
                      TabOrder = 19
                      Color = clGray
                      ReadOnly = True
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
    Left = 730
    Top = 371
  end
  inherited dsSearchMaster: TDataSource
    Left = 690
    Top = 557
  end
  inherited sqlSearchMaster: TFDQuery
    SQL.Strings = (
      'SELECT * FROM LOTEINTERNO')
    Left = 367
    Top = 569
    object FDQryFiltroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
    object FDQryFiltroLOTE: TStringField
      FieldName = 'LOTE'
      Origin = 'LOTE'
      Size = 60
    end
    object FDQryFiltroPOSICAO: TStringField
      FieldName = 'POSICAO'
      Origin = 'POSICAO'
      Size = 10
    end
    object FDQryFiltroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object FDQryFiltroDISPONIVEL: TFMTBCDField
      FieldName = 'DISPONIVEL'
      Origin = 'DISPONIVEL'
      Precision = 18
      Size = 2
    end
    object FDQryFiltroTOTALPONTOS: TFMTBCDField
      FieldName = 'TOTALPONTOS'
      Origin = 'TOTALPONTOS'
      Precision = 18
      Size = 2
    end
    object FDQryFiltroBARRACAO: TStringField
      FieldName = 'BARRACAO'
      Origin = 'BARRACAO'
      Size = 60
    end
    object FDQryFiltroopcao: TStringField
      FieldKind = fkCalculated
      FieldName = 'opcao'
      OnGetText = FDQryFiltroopcaoGetText
      Size = 1
      Calculated = True
    end
    object FDQryFiltroTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      OnGetText = FDQryFiltroTIPOGetText
      Size = 15
    end
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'LOTEINTERNO'
    SQL.Strings = (
      'select * from loteinterno')
  end
  inherited popMenuOptions: TUniPopupMenu
    Left = 418
    Top = 16
    object G1: TUniMenuItem
      Caption = 'Ficha T'#233'cnica - Controle de Estoque         '
      ImageIndex = 62
      OnClick = G1Click
    end
    object N1MENU: TUniMenuItem
      Caption = '-'
    end
    object R1: TUniMenuItem
      Caption = 'Recalcula Lote Interno'
      ImageIndex = 55
      OnClick = R1Click
    end
  end
  inherited FDSchemaAdapter1: TFDSchemaAdapter
    Left = 798
    Top = 446
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
    Left = 891
    Top = 343
  end
end
