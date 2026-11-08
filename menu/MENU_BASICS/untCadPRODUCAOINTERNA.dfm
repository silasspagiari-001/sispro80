inherited frmCadPRODUCAOINTERNA: TfrmCadPRODUCAOINTERNA
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
          OnClick = btnOptionsClick
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
                    FieldName = 'STATUS'
                    Title.Caption = ' '
                    Width = 70
                    Font.Name = 'Calibri'
                    Alignment = taCenter
                  end
                  item
                    FieldName = 'NUMERO'
                    Title.Caption = 'NUMERO'
                    Width = 74
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'EMISSAO'
                    Title.Caption = 'EMISS'#195'O'
                    Width = 100
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'LOTE'
                    Title.Caption = 'LOTE'
                    Width = 100
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'DESCRICAO'
                    Title.Caption = 'DESCRICAO'
                    Width = 300
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'TOTALKG'
                    Title.Caption = 'TOTALKG'
                    Width = 80
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'TOTALPONTOS'
                    Title.Caption = 'TOTALPONTOS'
                    Width = 80
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
                  ScrollHeight = 507
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
                    Top = 7
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
                      TabOrder = 13
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
                        Width = 120
                        Height = 19
                        Hint = ''
                        Caption = 'Produ'#231#227'o Interna'
                        ParentFont = False
                        Font.Height = -16
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold]
                        TabOrder = 2
                      end
                    end
                    object rcBlock10: TUniContainerPanel
                      Tag = 1
                      Left = 1
                      Top = 1
                      Width = 125
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 0
                      DesignSize = (
                        125
                        48)
                      object UniLabel3: TUniLabel
                        Left = 3
                        Top = 0
                        Width = 38
                        Height = 15
                        Hint = ''
                        Caption = 'C'#243'digo'
                        ParentFont = False
                        Font.Color = clBlack
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edCodigo: TUniDBEdit
                        Left = 3
                        Top = 18
                        Width = 119
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
                        ExplicitWidth = 144
                      end
                    end
                    object rcBlock20: TUniContainerPanel
                      Tag = 1
                      Left = 133
                      Top = 3
                      Width = 116
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 1
                      DesignSize = (
                        116
                        48)
                      object UniLabel4: TUniLabel
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
                      object UniDBEdit1: TUniDBEdit
                        Left = 3
                        Top = 18
                        Width = 110
                        Height = 29
                        Hint = ''
                        DataField = 'NUMERO'
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
                        ExplicitWidth = 144
                      end
                    end
                    object rcBlock30: TUniContainerPanel
                      Tag = 1
                      Left = 425
                      Top = 3
                      Width = 119
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 2
                      DesignSize = (
                        119
                        48)
                      object UniLabel6: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 46
                        Height = 15
                        Hint = ''
                        Caption = 'Emiss'#227'o'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBDateTimePicker2: TUniDBDateTimePicker
                        Tag = 1
                        Left = 2
                        Top = 18
                        Width = 113
                        Height = 29
                        Hint = ''
                        DataField = 'EMISSAO'
                        DataSource = dsMaster
                        DateTime = 44561.000000000000000000
                        DateFormat = 'dd/MM/yyyy'
                        TimeFormat = 'HH:mm:ss'
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                        ExplicitWidth = 144
                      end
                    end
                    object rcBlock28: TUniContainerPanel
                      Tag = 1
                      Left = 265
                      Top = 3
                      Width = 123
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 3
                      DesignSize = (
                        123
                        48)
                      object UniLabel5: TUniLabel
                        Left = 2
                        Top = 1
                        Width = 62
                        Height = 15
                        Hint = ''
                        Caption = 'Documento'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBEdit2: TUniDBEdit
                        Left = 2
                        Top = 19
                        Width = 117
                        Height = 29
                        Hint = ''
                        DataField = 'DOCUMENTO'
                        DataSource = dsMaster
                        Alignment = taRightJustify
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Color = clWhite
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold]
                        TabOrder = 2
                        Color = clGray
                        ReadOnly = True
                        ExplicitWidth = 144
                      end
                    end
                    object rcBlock50: TUniContainerPanel
                      Tag = 1
                      Left = 613
                      Top = 0
                      Width = 111
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 4
                      DesignSize = (
                        111
                        48)
                      object UniLabel7: TUniLabel
                        Left = 3
                        Top = 1
                        Width = 66
                        Height = 15
                        Hint = ''
                        Caption = 'Lote Destino'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniButtonDbEditLOTEDESTINO: TUniButtonDbEdit
                        Tag = 1
                        Left = 3
                        Top = 18
                        Width = 105
                        Height = 29
                        Hint = ''
                        DataField = 'LOTE'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                        Color = clInfoBk
                        OnButtonClick = UniButtonDbEditLOTEDESTINOButtonClick
                        IconCls = 'search'
                        ExplicitWidth = 144
                      end
                    end
                    object rcBlock60: TUniContainerPanel
                      Tag = 1
                      Left = 9
                      Top = 54
                      Width = 336
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-6]]'
                      ParentColor = False
                      TabOrder = 5
                      DesignSize = (
                        336
                        48)
                      object UniLabel15: TUniLabel
                        Left = 3
                        Top = 1
                        Width = 29
                        Height = 15
                        Hint = ''
                        Caption = 'Prod.'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                      object edLkpPRODUTOS: TUniDBEdit
                        Left = 2
                        Top = 18
                        Width = 331
                        Height = 29
                        Hint = 
                          '[['#13#10'DESCRICAO PRODUTO @60 |'#13#10'lkpfilter-empty:Selecione um Produt' +
                          'o<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-gridattr: |'#13#10'valid:' +
                          'blank |'#13#10'valid-required:top-in |'#13#10']]'
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        ReadOnly = True
                        InputType = 'text'
                        OnExit = edLkpPRODUTOSExit
                        ExplicitWidth = 145
                      end
                    end
                    object rcBlock68: TUniContainerPanel
                      Tag = 1
                      Left = 707
                      Top = 54
                      Width = 109
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 6
                      DesignSize = (
                        109
                        48)
                      object UniDBFormattedNumberEditquantidade: TUniDBFormattedNumberEdit
                        Tag = 1
                        Left = 2
                        Top = 19
                        Width = 106
                        Height = 29
                        Hint = ''
                        DataField = 'PUREZA'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                        OnExit = UniDBFormattedNumberEditquantidadeExit
                        ExplicitWidth = 147
                      end
                      object UniLabel8: TUniLabel
                        Left = 2
                        Top = 2
                        Width = 49
                        Height = 15
                        Hint = ''
                        Caption = '% Pureza'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock90: TUniContainerPanel
                      Left = 1
                      Top = 106
                      Width = 140
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 7
                      DesignSize = (
                        140
                        48)
                      object UniLabel11: TUniLabel
                        Left = 2
                        Top = 2
                        Width = 42
                        Height = 15
                        Hint = ''
                        Caption = 'Sacaria'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBComboBoxMARCA: TUniDBComboBox
                        Tag = 1
                        Left = 3
                        Top = 18
                        Width = 135
                        Height = 29
                        Hint = ''
                        Anchors = [akLeft, akTop, akRight]
                        DataField = 'SACARIA'
                        DataSource = dsMaster
                        Style = csDropDownList
                        Items.Strings = (
                          'Andamento'
                          'Concluido')
                        TabOrder = 2
                        IconItems = <>
                        ExplicitWidth = 370
                      end
                    end
                    object rcBlock108: TUniContainerPanel
                      Left = 323
                      Top = 106
                      Width = 139
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 8
                      DesignSize = (
                        139
                        48)
                      object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                        Tag = 1
                        Left = 2
                        Top = 18
                        Width = 135
                        Height = 29
                        Hint = ''
                        DataField = 'TOTALKG'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        ReadOnly = True
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel9: TUniLabel
                        Left = 2
                        Top = 2
                        Width = 44
                        Height = 15
                        Hint = ''
                        Caption = 'Total KG'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock57: TUniContainerPanel
                      Tag = 1
                      Left = 749
                      Top = 3
                      Width = 94
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 9
                      DesignSize = (
                        94
                        48)
                      object UniDBComboBox2: TUniDBComboBox
                        Tag = 1
                        Left = 2
                        Top = 19
                        Width = 89
                        Height = 29
                        Hint = ''
                        Anchors = [akLeft, akTop, akRight]
                        DataField = 'STATUS'
                        DataSource = dsMaster
                        Style = csDropDownList
                        Items.Strings = (
                          'Andamento'
                          'Concluido')
                        TabOrder = 1
                        IconItems = <>
                      end
                      object UniLabel12: TUniLabel
                        Left = 3
                        Top = 1
                        Width = 34
                        Height = 15
                        Hint = ''
                        Caption = 'Status'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock148: TUniContainerPanel
                      Tag = 1
                      Left = 695
                      Top = 105
                      Width = 150
                      Height = 48
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 10
                      DesignSize = (
                        150
                        48)
                      object UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit
                        AlignWithMargins = True
                        Left = 3
                        Top = 19
                        Width = 144
                        Height = 29
                        Hint = ''
                        DataField = 'TOTAL_CUSTO'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Color = clBlue
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold, fsItalic]
                        TabOrder = 1
                        ReadOnly = True
                        DecimalPrecision = 3
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel14: TUniLabel
                        Left = 3
                        Top = 3
                        Width = 144
                        Height = 15
                        Hint = ''
                        Caption = 'Total Custo Mat'#233'ria Prima'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock65: TUniContainerPanel
                      Left = 351
                      Top = 54
                      Width = 326
                      Height = 48
                      Hint = '[['#13#10'cols:xs-12 sm-12 md-4'#13#10']]'
                      ParentColor = False
                      TabOrder = 11
                      object UniDBCheckBox1: TUniDBCheckBox
                        Left = 67
                        Top = 16
                        Width = 62
                        Height = 17
                        Hint = ''
                        DataField = 'SACO_10KG'
                        DataSource = dsMaster
                        ValueChecked = 'T'
                        ValueUnchecked = 'F'
                        Caption = '10 Kg'
                        TabOrder = 1
                        ParentColor = False
                        Color = clBtnFace
                      end
                      object UniDBCheckBox2: TUniDBCheckBox
                        Left = 175
                        Top = 16
                        Width = 56
                        Height = 17
                        Hint = ''
                        DataField = 'SACO_15KG'
                        DataSource = dsMaster
                        ValueChecked = 'T'
                        ValueUnchecked = 'F'
                        Caption = '15 Kg'
                        TabOrder = 2
                        ParentColor = False
                        Color = clBtnFace
                      end
                      object UniDBCheckBox3: TUniDBCheckBox
                        Left = 253
                        Top = 16
                        Width = 60
                        Height = 17
                        Hint = ''
                        DataField = 'SACO_20KG'
                        DataSource = dsMaster
                        ValueChecked = 'T'
                        ValueUnchecked = 'F'
                        Caption = '20 Kg'
                        TabOrder = 3
                        ParentColor = False
                        Color = clBtnFace
                      end
                    end
                    object rcBlock160: TUniContainerPanel
                      Left = 3
                      Top = 175
                      Width = 689
                      Height = 285
                      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                      ParentColor = False
                      TabOrder = 14
                      object UniDBGridbatidaitens: TUniDBGrid
                        Left = 0
                        Top = 0
                        Width = 689
                        Height = 285
                        Hint = ''
                        DataSource = dsdetalhes
                        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
                        WebOptions.Paged = False
                        LoadMask.Message = 'Carregando Item(s)...'
                        ForceFit = True
                        Align = alClient
                        Font.Color = clBlack
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        ParentFont = False
                        TabOrder = 1
                        Summary.Enabled = True
                        OnCellClick = UniDBGridbatidaitensCellClick
                        Columns = <
                          item
                            FieldName = 'calculos'
                            Title.Caption = '...'
                            Width = 30
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                            Alignment = taCenter
                          end
                          item
                            FieldName = 'TIPO'
                            Title.Caption = ' '
                            Width = 80
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                            Alignment = taCenter
                          end
                          item
                            FieldName = 'buscalote'
                            Title.Caption = ' '
                            Width = 30
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                            Alignment = taCenter
                          end
                          item
                            FieldName = 'PERC'
                            Title.Caption = '%PERC'
                            Width = 60
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                            Alignment = taCenter
                            ReadOnly = True
                          end
                          item
                            FieldName = 'LOTE'
                            Title.Caption = 'LOTE'
                            Width = 150
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                          end
                          item
                            FieldName = 'PRODUTO'
                            Title.Caption = 'PROD'
                            Width = 74
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                          end
                          item
                            FieldName = 'DESCRICAO'
                            Title.Caption = 'DESCRICAO'
                            Width = 250
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                          end
                          item
                            FieldName = 'QUANTIDADE'
                            Title.Caption = 'QTDE'
                            Width = 74
                            Font.Color = clBlue
                            Font.Name = 'Calibri'
                          end
                          item
                            FieldName = 'PUREZA'
                            Title.Caption = '%PUR '
                            Width = 70
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                            Alignment = taCenter
                            ReadOnly = True
                          end
                          item
                            FieldName = 'CUSTO_UNITARIO'
                            Title.Caption = 'UNT. KG'
                            Width = 100
                            Visible = False
                            Font.Color = clRed
                            Font.Name = 'Calibri'
                          end
                          item
                            FieldName = 'TOTAL_CUSTO'
                            Title.Caption = 'R$ TOTAL'
                            Width = 100
                            Visible = False
                            Font.Color = clRed
                            Font.Name = 'Calibri'
                            ReadOnly = True
                          end
                          item
                            FieldName = 'PONTOS'
                            Title.Caption = 'PONTOS'
                            Width = 100
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                            ReadOnly = True
                          end
                          item
                            FieldName = 'exclui'
                            Title.Caption = ' '
                            Width = 30
                            Font.Color = clBlack
                            Font.Name = 'Calibri'
                            Alignment = taCenter
                          end>
                      end
                    end
                    object UniDBEdit4: TUniDBEdit
                      Left = 707
                      Top = 287
                      Width = 144
                      Height = 29
                      Hint = ''
                      Visible = False
                      DataField = 'DESCRICAO'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Color = clWhite
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      Font.Style = [fsBold]
                      TabOrder = 15
                      Color = clGray
                      ReadOnly = True
                    end
                    object rcBlock98: TUniContainerPanel
                      Left = 147
                      Top = 106
                      Width = 170
                      Height = 48
                      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
                      ParentColor = False
                      TabOrder = 16
                      DesignSize = (
                        170
                        48)
                      object UniLabel16: TUniLabel
                        Left = 3
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
                      object UniDBEdit3: TUniDBEdit
                        Tag = 1
                        Left = 3
                        Top = 18
                        Width = 164
                        Height = 29
                        Hint = ''
                        DataField = 'PADRAO'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                      end
                    end
                    object rcBlock128: TUniContainerPanel
                      Left = 478
                      Top = 105
                      Width = 115
                      Height = 48
                      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
                      ParentColor = False
                      TabOrder = 17
                      DesignSize = (
                        115
                        48)
                      object UniLabel10: TUniLabel
                        Left = 3
                        Top = 3
                        Width = 68
                        Height = 15
                        Hint = ''
                        Caption = 'Total Pontos'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
                        Tag = 1
                        Left = 3
                        Top = 19
                        Width = 111
                        Height = 29
                        Hint = ''
                        DataField = 'TOTALPONTOS'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                        ReadOnly = True
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
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
    Left = 1010
    Top = 315
  end
  inherited dsSearchMaster: TDataSource
    Left = 410
    Top = 445
  end
  inherited sqlSearchMaster: TFDQuery
    SQL.Strings = (
      'select * from PRODUCAOINTERNA')
    Left = 417
    Top = 531
    object FDQryFiltroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
    object FDQryFiltroEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object FDQryFiltroDOCUMENTO: TIntegerField
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
      Required = True
    end
    object FDQryFiltroLOTE: TStringField
      FieldName = 'LOTE'
      Origin = 'LOTE'
      Size = 30
    end
    object FDQryFiltroPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
    end
    object FDQryFiltroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object FDQryFiltroPUREZA: TFMTBCDField
      FieldName = 'PUREZA'
      Origin = 'PUREZA'
      Precision = 18
      Size = 2
    end
    object FDQryFiltroTOTALKG: TFMTBCDField
      FieldName = 'TOTALKG'
      Origin = 'TOTALKG'
      Precision = 18
      Size = 2
    end
    object FDQryFiltroTOTALPONTOS: TFMTBCDField
      FieldName = 'TOTALPONTOS'
      Origin = 'TOTALPONTOS'
      Precision = 18
      Size = 2
    end
    object FDQryFiltroSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      OnGetText = FDQryFiltroSTATUSGetText
      Size = 10
    end
    object FDQryFiltroTOTAL_CUSTO: TBCDField
      FieldName = 'TOTAL_CUSTO'
      Origin = 'TOTAL_CUSTO'
      Precision = 18
    end
    object sqlSearchMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
    end
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'PRODUCAOINTERNA'
    SQL.Strings = (
      'select * from producaointerna')
    Left = 1011
    Top = 417
  end
  inherited popMenuOptions: TUniPopupMenu
    Left = 418
    Top = 16
  end
  inherited FDSchemaAdapter1: TFDSchemaAdapter
    Left = 734
    Top = 6
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
    Left = 165
    Top = 468
    object tbdetalhesLOTE: TStringField
      FieldName = 'LOTE'
      Size = 30
    end
    object tbdetalhesPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
    end
    object tbdetalhesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object tbdetalhesSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
    end
    object tbdetalhesQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object tbdetalhesbuscalote: TStringField
      FieldName = 'buscalote'
      OnGetText = tbdetalhesbuscaloteGetText
      Size = 1
    end
    object tbdetalhesexclui: TStringField
      FieldName = 'exclui'
      OnGetText = tbdetalhesexcluiGetText
      Size = 1
    end
    object tbdetalhesTIPO: TStringField
      FieldName = 'TIPO'
      OnGetText = tbdetalhesTIPOGetText
      Size = 15
    end
    object tbdetalhesPUREZA: TFloatField
      FieldName = 'PUREZA'
    end
    object tbdetalhesPONTOS: TFloatField
      FieldName = 'PONTOS'
    end
    object tbdetalhesCUSTO_UNITARIO: TCurrencyField
      FieldName = 'CUSTO_UNITARIO'
    end
    object tbdetalhesTOTAL_CUSTO: TCurrencyField
      FieldName = 'TOTAL_CUSTO'
    end
    object tbdetalhesPERC: TStringField
      FieldName = 'PERC'
    end
    object tbdetalhesCUSTO_PONTO: TFloatField
      FieldName = 'CUSTO_PONTO'
    end
    object tbdetalhesTOTAL_PONTO: TFloatField
      FieldName = 'TOTAL_PONTO'
    end
    object tbdetalhescalculos: TStringField
      FieldName = 'calculos'
      OnGetText = tbdetalhescalculosGetText
    end
  end
  inherited dsdetalhes: TDataSource
    Left = 261
    Top = 460
  end
  object UniPopupMenudetalhes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 639
    Top = 6
    object I1: TUniMenuItem
      Caption = 'Duplicar Produ'#231#227'o'
      ImageIndex = 70
      OnClick = I1Click
    end
    object N1DUP: TUniMenuItem
      Caption = '-'
    end
    object EntregadosItenss1: TUniMenuItem
      Caption = 'Impress'#227'o da Produ'#231#227'o'
      ImageIndex = 94
      OnClick = EntregadosItenss1Click
    end
    object N13: TUniMenuItem
      Caption = '-'
    end
    object C1: TUniMenuItem
      Caption = 'Custo da Produ'#231#227'o - Montagem de Pre'#231'o'
      ImageIndex = 121
      OnClick = C1Click
    end
  end
end
