inherited frmCadPRODUTOS: TfrmCadPRODUTOS
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
          Hint = 
            '[['#13#10'cls:ButtonThemeCrud-no-border-left |'#13#10'ico:fas-search |'#13#10'guid' +
            'e-tour:PESQUISA R'#193'PIDA|'#13#10'guide-tour-theme:defined|'#13#10'guide-tour-o' +
            'ffset-x:1|'#13#10'guide-tour-offset-y:1|'#13#10'guide-tour-text:Lista os reg' +
            'istros filtrando pelo conte'#250'do informado.|'#13#10'guide-tour-arrow:lef' +
            't|'#13#10']]'
          ScreenMask.Target = Owner
        end
        inherited labState: TUniLabel [5]
        end
        inherited labOptions: TUniLabel [6]
          Hint = 
            '[['#13#10'ico:fas-bars|'#13#10'guide-tour:BOT'#213'ES DE COMANDO|'#13#10'guide-tour-the' +
            'me:default|'#13#10'guide-tour-offset-x:6|'#13#10'guide-tour-offset-y:1|'#13#10'gui' +
            'de-tour-text:Bot'#245'es para cadasto, altera'#231#227'o, exclus'#227'o etc.|'#13#10'gui' +
            'de-tour-arrow:right|'#13#10']]'
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
                    FieldName = 'UNIDADE'
                    Title.Caption = ' '
                    Width = 30
                    Font.Name = 'Calibri'
                    Alignment = taCenter
                  end
                  item
                    FieldName = 'CODIGO'
                    Title.Caption = 'CODIGO'
                    Width = 70
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'DESCRICAO'
                    Title.Caption = 'DESCRI'#199#195'O'
                    Width = 300
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'CULTIVAR'
                    Title.Caption = 'CULTIVAR'
                    Width = 200
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
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
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
                  ScrollHeight = 257
                  ScrollWidth = 898
                  object rcBlock2: TUniContainerPanel
                    Tag = 1
                    AlignWithMargins = True
                    Left = 15
                    Top = 12
                    Width = 883
                    Height = 245
                    Hint = 
                      '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'hr-childs:xs-exp sm-exp md-exp |'#13 +
                      #10'round:no | '#13#10'cls:card-info-box-white |'#13#10'/*noborder-left:mobile|' +
                      '*/'#13#10'/*noborder-right:mobile|*/'#13#10']]'#13#10#13#10#13#10#13#10
                    Margins.Left = 15
                    Margins.Top = 15
                    Margins.Right = 15
                    Margins.Bottom = 10
                    ParentColor = False
                    TabOrder = 0
                    object rcBlock3: TUniContainerPanel
                      Left = -1
                      Top = 0
                      Width = 884
                      Height = 36
                      Hint = 
                        '[['#13#10'cols:12 |'#13#10'noborder-top | '#13#10'noborder-left | '#13#10'noborder-right' +
                        ' | '#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                      ParentColor = False
                      Color = clSilver
                      TabOrder = 1
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
                      object UniLabel8: TUniLabel
                        AlignWithMargins = True
                        Left = 6
                        Top = 6
                        Width = 88
                        Height = 19
                        Hint = '[['#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
                        Margins.Left = 6
                        Margins.Top = 0
                        Margins.Right = 0
                        Margins.Bottom = 0
                        Caption = 'Dados Gerais'
                        ParentFont = False
                        Font.Color = clGray
                        Font.Height = -16
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold]
                        TabOrder = 2
                      end
                    end
                    object rcBlock10: TUniContainerPanel
                      Tag = 1
                      Left = 15
                      Top = 41
                      Width = 150
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 2
                      object UniLabel3: TUniLabel
                        Left = 3
                        Top = 0
                        Width = 38
                        Height = 13
                        Hint = ''
                        Caption = 'C'#243'digo'
                        TabOrder = 1
                      end
                      object edCodigo: TUniDBEdit
                        Left = 3
                        Top = 21
                        Width = 144
                        Height = 32
                        Hint = ''
                        DataField = 'CODIGO'
                        DataSource = dsMaster
                        TabOrder = 2
                        Color = clGray
                        ReadOnly = True
                      end
                    end
                    object rcBlock20: TUniContainerPanel
                      Tag = 1
                      Left = 180
                      Top = 41
                      Width = 66
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 3
                      object UniLabel1: TUniLabel
                        Left = 8
                        Top = 0
                        Width = 26
                        Height = 13
                        Hint = ''
                        Caption = 'Ativo'
                        TabOrder = 1
                      end
                      object UniDBCheckBox1: TUniDBCheckBox
                        Left = 19
                        Top = 28
                        Width = 97
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
                    object rcBlock40: TUniContainerPanel
                      Tag = 1
                      Left = 648
                      Top = 42
                      Width = 150
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-4]]'
                      ParentColor = False
                      TabOrder = 4
                      DesignSize = (
                        150
                        60)
                      object edLkpGRUPOS: TUniDBEdit
                        Tag = 1
                        Left = 3
                        Top = 21
                        Width = 145
                        Height = 32
                        Hint = 
                          '[['#13#10'DESCRICAO GRUPO @60 |'#13#10'lkpfilter-empty:Selecione um Grupo<tr' +
                          'anslate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-gridattr: |'#13#10'valid:blan' +
                          'k |'#13#10'valid-required:top-in |'#13#10']]'
                        DataField = 'GRUPO'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        Color = clInfoBk
                        ReadOnly = True
                      end
                      object UniLabel6: TUniLabel
                        Left = 3
                        Top = 0
                        Width = 33
                        Height = 13
                        Hint = ''
                        Caption = 'Grupo'
                        TabOrder = 2
                      end
                    end
                    object rcBlock80: TUniContainerPanel
                      Tag = 1
                      Left = 435
                      Top = 111
                      Width = 150
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-6]]'
                      ParentColor = False
                      TabOrder = 5
                      DesignSize = (
                        150
                        60)
                      object edLkpCULTIVAR: TUniDBEdit
                        Tag = 1
                        Left = 2
                        Top = 21
                        Width = 145
                        Height = 32
                        Hint = 
                          '[['#13#10'CULTIVAR CODIGO_CULTIVAR @60 |'#13#10'lkpfilter-empty:Selecione um' +
                          ' Cultivar<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-gridattr: |' +
                          #13#10'valid:blank |'#13#10'valid-required:top-in |'#13#10']]'
                        DataField = 'CODIGO_CULTIVAR'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        Color = clInfoBk
                        ReadOnly = True
                      end
                      object UniLabel10: TUniLabel
                        Left = 2
                        Top = 2
                        Width = 39
                        Height = 13
                        Hint = ''
                        Caption = 'Cultivar'
                        TabOrder = 2
                      end
                    end
                    object rcBlock60: TUniContainerPanel
                      Tag = 1
                      Left = 15
                      Top = 111
                      Width = 150
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-6]]'
                      ParentColor = False
                      TabOrder = 6
                      DesignSize = (
                        150
                        60)
                      object UniLabel2: TUniLabel
                        Left = 5
                        Top = 2
                        Width = 38
                        Height = 13
                        Hint = ''
                        Caption = 'Esp'#233'cie'
                        TabOrder = 1
                      end
                      object edLkpESPECIE: TUniDBEdit
                        Tag = 1
                        Left = 3
                        Top = 21
                        Width = 145
                        Height = 32
                        Hint = 
                          '[['#13#10'SEMENTENOME CODIGO_ESPECIE @60 |'#13#10'lkpfilter-empty:Selecione ' +
                          'uma Esp'#233'cie<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-gridattr:' +
                          ' |'#13#10'valid:blank |'#13#10'valid-required:top-in |'#13#10']]'
                        DataField = 'CODIGO_ESPECIE'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                        Color = clInfoBk
                        ReadOnly = True
                      end
                    end
                    object rcBlock100: TUniContainerPanel
                      Left = 15
                      Top = 179
                      Width = 850
                      Height = 60
                      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                      ParentColor = False
                      TabOrder = 7
                      object UniDBEdit16: TUniDBEdit
                        Tag = 1
                        Left = 3
                        Top = 21
                        Width = 844
                        Height = 32
                        Hint = ''
                        DataField = 'DESCRICAO'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        TabOrder = 1
                      end
                      object UniLabel4: TUniLabel
                        Left = 5
                        Top = 1
                        Width = 91
                        Height = 13
                        Hint = ''
                        Caption = 'Descri'#231#227'o do Item'
                        TabOrder = 2
                      end
                    end
                    object rcBlock30: TUniContainerPanel
                      Tag = 1
                      Left = 252
                      Top = 36
                      Width = 150
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-4]]'
                      ParentColor = False
                      TabOrder = 8
                      DesignSize = (
                        150
                        60)
                      object edLkpMEDIDAS: TUniDBEdit
                        Tag = 1
                        Left = 3
                        Top = 21
                        Width = 145
                        Height = 32
                        Hint = 
                          '[['#13#10'DESCRICAO CODIGOUNIDADE @60 |'#13#10'lkpfilter-empty:Selecione a U' +
                          'nidade<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-gridattr: |'#13#10'v' +
                          'alid:blank |'#13#10'valid-required:top-in |'#13#10']]'
                        DataField = 'UNIDADE'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        Color = clInfoBk
                        ReadOnly = True
                      end
                      object UniLabel7: TUniLabel
                        Left = 3
                        Top = 0
                        Width = 86
                        Height = 13
                        Hint = ''
                        Caption = 'Unidade Medida'
                        TabOrder = 2
                      end
                    end
                  end
                end
              end
              object tabFiscal: TUniTabSheet
                Hint = ''
                Caption = 'Detalhes Fiscais'
                object sboxGridBlockTab2: TUniScrollBox
                  Left = 0
                  Top = 0
                  Width = 1307
                  Height = 935
                  Hint = ''
                  Align = alClient
                  TabOrder = 0
                  ScrollHeight = 573
                  ScrollWidth = 961
                  object rcBlock107: TUniContainerPanel
                    Tag = 1
                    AlignWithMargins = True
                    Left = 15
                    Top = 31
                    Width = 946
                    Height = 138
                    Hint = 
                      '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'hr-childs:xs-exp sm-exp md-exp |'#13 +
                      #10'round:no | '#13#10'cls:card-info-box-white |'#13#10'/*noborder-left:mobile|' +
                      '*/'#13#10'/*noborder-right:mobile|*/'#13#10']]'#13#10#13#10#13#10#13#10
                    Margins.Left = 15
                    Margins.Top = 15
                    Margins.Right = 15
                    Margins.Bottom = 10
                    ParentColor = False
                    TabOrder = 0
                    object rcBlock108: TUniContainerPanel
                      Left = 0
                      Top = -1
                      Width = 945
                      Height = 36
                      Hint = 
                        '[['#13#10'cols:12 |'#13#10'noborder-top | '#13#10'noborder-left | '#13#10'noborder-right' +
                        ' | '#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                      ParentColor = False
                      Color = clSilver
                      TabOrder = 1
                      DesignSize = (
                        945
                        36)
                      object labRcCollapse01: TUniLabel
                        Left = 911
                        Top = 8
                        Width = 10
                        Height = 26
                        Hint = '[['#13#10'collapse:rcBlock107 off-42'#13#10' ]]'#13#10
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
                      object UniLabel35: TUniLabel
                        AlignWithMargins = True
                        Left = 6
                        Top = 6
                        Width = 135
                        Height = 19
                        Hint = '[['#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
                        Margins.Left = 6
                        Margins.Top = 0
                        Margins.Right = 0
                        Margins.Bottom = 0
                        Caption = 'Dados Faturamento'
                        ParentFont = False
                        Font.Color = clGray
                        Font.Height = -16
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold]
                        TabOrder = 2
                      end
                    end
                    object rcBlock110: TUniContainerPanel
                      Tag = 1
                      Left = 15
                      Top = 60
                      Width = 150
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 2
                      DesignSize = (
                        150
                        60)
                      object UniDBEdit4: TUniDBEdit
                        Tag = 1
                        Left = 3
                        Top = 21
                        Width = 144
                        Height = 32
                        Hint = ''
                        DataField = 'NUMERONCM'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                      end
                      object UniLabel13: TUniLabel
                        Left = 5
                        Top = 0
                        Width = 78
                        Height = 13
                        Hint = ''
                        Caption = 'Numero N.C.M.'
                        TabOrder = 2
                      end
                    end
                    object rcBlock120: TUniContainerPanel
                      Tag = 1
                      Left = 180
                      Top = 60
                      Width = 150
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 3
                      DesignSize = (
                        150
                        60)
                      object UniDBFormattedNumberEditPERCIPI: TUniDBFormattedNumberEdit
                        Left = 3
                        Top = 21
                        Width = 144
                        Height = 32
                        Hint = ''
                        DataField = 'ALIQUOTAIPI'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel14: TUniLabel
                        Left = 3
                        Top = 0
                        Width = 30
                        Height = 13
                        Hint = ''
                        Caption = '% I.P.I'
                        TabOrder = 2
                      end
                    end
                    object rcBlock130: TUniContainerPanel
                      Tag = 1
                      Left = 345
                      Top = 60
                      Width = 150
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 4
                      DesignSize = (
                        150
                        60)
                      object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                        Left = 3
                        Top = 21
                        Width = 144
                        Height = 32
                        Hint = ''
                        DataField = 'PESOLIQUIDO'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel15: TUniLabel
                        Left = 3
                        Top = 0
                        Width = 66
                        Height = 13
                        Hint = ''
                        Caption = 'Peso Liquido'
                        TabOrder = 2
                      end
                    end
                    object rcBlock140: TUniContainerPanel
                      Tag = 1
                      Left = 510
                      Top = 60
                      Width = 150
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 5
                      DesignSize = (
                        150
                        60)
                      object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
                        Left = 3
                        Top = 21
                        Width = 144
                        Height = 32
                        Hint = ''
                        DataField = 'PESOBRUTO'
                        DataSource = dsMaster
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel16: TUniLabel
                        Left = 3
                        Top = 0
                        Width = 55
                        Height = 13
                        Hint = ''
                        Caption = 'Peso Bruto'
                        TabOrder = 2
                      end
                    end
                  end
                  object rcBlock132: TUniContainerPanel
                    Tag = 1
                    AlignWithMargins = True
                    Left = 15
                    Top = 223
                    Width = 946
                    Height = 350
                    Hint = 
                      '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'hr-childs:xs-exp sm-exp md-exp | ' +
                      #13#10'round:no | '#13#10'cls:card-info-box-white |'#13#10']]'#13#10
                    Margins.Left = 15
                    Margins.Top = 15
                    Margins.Right = 15
                    Margins.Bottom = 10
                    ParentColor = False
                    TabOrder = 1
                    object rcBlock133: TUniContainerPanel
                      Left = 0
                      Top = -1
                      Width = 945
                      Height = 36
                      Hint = 
                        '[['#13#10'cols:12 |'#13#10'noborder-top | '#13#10'noborder-left | '#13#10'noborder-right' +
                        ' | '#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                      ParentColor = False
                      Color = clSilver
                      TabOrder = 1
                      DesignSize = (
                        945
                        36)
                      object labCollapseDefaultAddr: TUniLabel
                        Left = 911
                        Top = 8
                        Width = 10
                        Height = 26
                        Hint = '[['#13#10'collapse:rcBlock132 off-42 '#13#10']]'#13#10
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
                      object UniLabel37: TUniLabel
                        AlignWithMargins = True
                        Left = 6
                        Top = 6
                        Width = 135
                        Height = 19
                        Hint = '[['#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
                        Margins.Left = 6
                        Margins.Top = 0
                        Margins.Right = 0
                        Margins.Bottom = 0
                        Caption = 'Dados Faturamento'
                        ParentFont = False
                        Font.Color = clGray
                        Font.Height = -16
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold]
                        TabOrder = 2
                      end
                    end
                    object rcBlock160: TUniContainerPanel
                      Tag = 1
                      Left = 23
                      Top = 62
                      Width = 150
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 2
                      DesignSize = (
                        150
                        60)
                      object UniDBComboBox1: TUniDBComboBox
                        Tag = 1
                        Left = 0
                        Top = 21
                        Width = 150
                        Height = 32
                        Hint = ''
                        CustomAttribs.Strings = (
                          '0101'
                          '0102'
                          '0103'
                          '0202'
                          '0400'
                          '0500'
                          '0900'
                          '000'
                          '010'
                          '020'
                          '030'
                          '040'
                          '050'
                          '060'
                          '070'
                          '080'
                          '090'
                          '')
                        Anchors = [akLeft, akTop, akRight]
                        DataField = 'SITUACAOLOCAL'
                        DataSource = dscruddetails
                        Style = csDropDownList
                        Items.Strings = (
                          '0101'
                          '0102'
                          '0103'
                          '0202'
                          '0400'
                          '0500'
                          '0900'
                          '000'
                          '010'
                          '020'
                          '030'
                          '040'
                          '050'
                          '060'
                          '070'
                          '080'
                          '090')
                        TabOrder = 1
                        IconItems = <>
                      end
                      object UniLabel17: TUniLabel
                        Left = 3
                        Top = 0
                        Width = 110
                        Height = 13
                        Hint = ''
                        Caption = 'CST - DENTRO DO UF'
                        TabOrder = 2
                      end
                    end
                    object rcBlock170: TUniContainerPanel
                      Tag = 1
                      Left = 179
                      Top = 62
                      Width = 125
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 3
                      DesignSize = (
                        125
                        60)
                      object UniDBComboBox2: TUniDBComboBox
                        Tag = 1
                        Left = 0
                        Top = 21
                        Width = 121
                        Height = 32
                        Hint = ''
                        CustomAttribs.Strings = (
                          '0101'
                          '0102'
                          '0103'
                          '0202'
                          '0400'
                          '0500'
                          '0900'
                          '000'
                          '010'
                          '020'
                          '030'
                          '040'
                          '050'
                          '060'
                          '070'
                          '080'
                          '090'
                          '')
                        Anchors = [akLeft, akTop, akRight]
                        DataField = 'SITUACAOOUTRAS'
                        DataSource = dscruddetails
                        Style = csDropDownList
                        Items.Strings = (
                          '0101'
                          '0102'
                          '0103'
                          '0202'
                          '0400'
                          '0500'
                          '0900'
                          '000'
                          '010'
                          '020'
                          '030'
                          '040'
                          '050'
                          '060'
                          '070'
                          '080'
                          '090')
                        TabOrder = 1
                        IconItems = <>
                      end
                      object UniLabel19: TUniLabel
                        Left = 3
                        Top = 0
                        Width = 95
                        Height = 13
                        Hint = ''
                        Caption = 'CST - FORA DO UF'
                        TabOrder = 2
                      end
                    end
                    object rcBlock180: TUniContainerPanel
                      Tag = 1
                      Left = 321
                      Top = 62
                      Width = 118
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 4
                      DesignSize = (
                        118
                        60)
                      object UniLabel20: TUniLabel
                        Left = 3
                        Top = 0
                        Width = 15
                        Height = 13
                        Hint = ''
                        Caption = 'PIS'
                        TabOrder = 1
                      end
                      object UniDBComboBox3: TUniDBComboBox
                        Tag = 1
                        Left = 0
                        Top = 21
                        Width = 115
                        Height = 32
                        Hint = ''
                        Anchors = [akLeft, akTop, akRight]
                        DataField = 'PIS'
                        DataSource = dscruddetails
                        Style = csDropDownList
                        Items.Strings = (
                          '01'
                          '02'
                          '03'
                          '04'
                          '05'
                          '06'
                          '07'
                          '08'
                          '09'
                          '49'
                          '')
                        TabOrder = 2
                        IconItems = <>
                      end
                    end
                    object rcBlock185: TUniContainerPanel
                      Tag = 1
                      Left = 455
                      Top = 62
                      Width = 122
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 5
                      DesignSize = (
                        122
                        60)
                      object UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit
                        Left = 1
                        Top = 21
                        Width = 121
                        Height = 32
                        Hint = ''
                        DataField = 'VLRPIS'
                        DataSource = dscruddetails
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel24: TUniLabel
                        Left = 3
                        Top = 0
                        Width = 44
                        Height = 13
                        Hint = ''
                        Caption = 'Valor PIS'
                        TabOrder = 2
                      end
                    end
                    object rcBlock190: TUniContainerPanel
                      Tag = 1
                      Left = 583
                      Top = 62
                      Width = 106
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 6
                      DesignSize = (
                        106
                        60)
                      object UniDBComboBox4: TUniDBComboBox
                        Tag = 1
                        Left = 1
                        Top = 21
                        Width = 104
                        Height = 32
                        Hint = ''
                        Anchors = [akLeft, akTop, akRight]
                        DataField = 'COFINS'
                        DataSource = dscruddetails
                        Style = csDropDownList
                        Items.Strings = (
                          '06'
                          '50'
                          '51'
                          '52'
                          '53'
                          '54'
                          '55'
                          '56'
                          '60'
                          '61'
                          '62'
                          '63'
                          '64'
                          '65'
                          '66'
                          '67'
                          '70'
                          '71'
                          '72'
                          '73'
                          '74'
                          '75'
                          '98'
                          '99'
                          '')
                        TabOrder = 1
                        IconItems = <>
                      end
                      object UniLabel21: TUniLabel
                        Left = 4
                        Top = 1
                        Width = 39
                        Height = 13
                        Hint = ''
                        Caption = 'COFINS'
                        TabOrder = 2
                      end
                    end
                    object rcBlock195: TUniContainerPanel
                      Tag = 1
                      Left = 695
                      Top = 66
                      Width = 150
                      Height = 56
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 7
                      DesignSize = (
                        150
                        56)
                      object UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit
                        Left = 3
                        Top = 17
                        Width = 144
                        Height = 32
                        Hint = ''
                        DataField = 'VLRCOFINS'
                        DataSource = dscruddetails
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Color = clBlack
                        TabOrder = 1
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel25: TUniLabel
                        Left = 3
                        Top = 1
                        Width = 72
                        Height = 15
                        Hint = ''
                        Caption = 'Valor COFINS'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock200: TUniContainerPanel
                      Tag = 1
                      Left = 15
                      Top = 200
                      Width = 141
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 8
                      DesignSize = (
                        141
                        60)
                      object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
                        Left = 3
                        Top = 21
                        Width = 136
                        Height = 32
                        Hint = ''
                        DataField = 'BASE0'
                        DataSource = dscruddetails
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel22: TUniLabel
                        Left = 3
                        Top = 0
                        Width = 41
                        Height = 13
                        Hint = ''
                        Caption = 'BASE - 0'
                        TabOrder = 2
                      end
                    end
                    object rcBlock210: TUniContainerPanel
                      Tag = 1
                      Left = 168
                      Top = 196
                      Width = 117
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 9
                      DesignSize = (
                        117
                        60)
                      object UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit
                        Left = 3
                        Top = 21
                        Width = 112
                        Height = 32
                        Hint = ''
                        DataField = 'ICMS0'
                        DataSource = dscruddetails
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel23: TUniLabel
                        Left = 3
                        Top = 0
                        Width = 42
                        Height = 13
                        Hint = ''
                        Caption = 'ICMS - 0'
                        TabOrder = 2
                      end
                    end
                    object rcBlock220: TUniContainerPanel
                      Tag = 1
                      Left = 302
                      Top = 196
                      Width = 118
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 10
                      DesignSize = (
                        118
                        60)
                      object UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit
                        Left = 3
                        Top = 21
                        Width = 115
                        Height = 32
                        Hint = ''
                        DataField = 'BASE1'
                        DataSource = dscruddetails
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel26: TUniLabel
                        Left = 3
                        Top = 2
                        Width = 41
                        Height = 13
                        Hint = ''
                        Caption = 'BASE - 1'
                        TabOrder = 2
                      end
                    end
                    object rcBlock230: TUniContainerPanel
                      Tag = 1
                      Left = 437
                      Top = 196
                      Width = 116
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 11
                      DesignSize = (
                        116
                        60)
                      object UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit
                        Left = 3
                        Top = 21
                        Width = 113
                        Height = 32
                        Hint = ''
                        DataField = 'ICMS1'
                        DataSource = dscruddetails
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel27: TUniLabel
                        Left = 3
                        Top = 0
                        Width = 42
                        Height = 13
                        Hint = ''
                        Caption = 'ICMS - 1'
                        TabOrder = 2
                      end
                    end
                    object rcBlock240: TUniContainerPanel
                      Tag = 1
                      Left = 575
                      Top = 196
                      Width = 106
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 12
                      DesignSize = (
                        106
                        60)
                      object UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit
                        Left = 3
                        Top = 21
                        Width = 102
                        Height = 32
                        Hint = ''
                        DataField = 'BASE2'
                        DataSource = dscruddetails
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel28: TUniLabel
                        Left = 3
                        Top = 1
                        Width = 41
                        Height = 13
                        Hint = ''
                        Caption = 'BASE - 2'
                        TabOrder = 2
                      end
                    end
                    object rcBlock250: TUniContainerPanel
                      Tag = 1
                      Left = 702
                      Top = 189
                      Width = 99
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 13
                      DesignSize = (
                        99
                        60)
                      object UniDBFormattedNumberEdit10: TUniDBFormattedNumberEdit
                        Left = 3
                        Top = 21
                        Width = 94
                        Height = 32
                        Hint = ''
                        DataField = 'ICMS2'
                        DataSource = dscruddetails
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                        DecimalSeparator = ','
                        ThousandSeparator = '.'
                      end
                      object UniLabel29: TUniLabel
                        Left = 3
                        Top = 1
                        Width = 42
                        Height = 13
                        Hint = ''
                        Caption = 'ICMS - 2'
                        TabOrder = 2
                      end
                    end
                    object rcBlock300: TUniContainerPanel
                      Tag = 1
                      Left = 15
                      Top = 270
                      Width = 150
                      Height = 60
                      Hint = '[[cols:xs-6 sm-6 md-2]]'
                      ParentColor = False
                      TabOrder = 14
                      DesignSize = (
                        150
                        60)
                      object UniDBEdit5: TUniDBEdit
                        Tag = 1
                        Left = 3
                        Top = 21
                        Width = 144
                        Height = 32
                        Hint = ''
                        DataField = 'CLASSTRIB'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 1
                      end
                      object UniLabel30: TUniLabel
                        Left = 3
                        Top = 0
                        Width = 83
                        Height = 13
                        Hint = ''
                        Caption = 'Class Tributa'#231#227'o'
                        TabOrder = 2
                      end
                    end
                    object rcBlock310: TUniContainerPanel
                      Tag = 1
                      Left = 180
                      Top = 270
                      Width = 150
                      Height = 60
                      Hint = '[[cols:xs-6 sm-6 md-2]]'
                      ParentColor = False
                      TabOrder = 15
                      DesignSize = (
                        150
                        60)
                      object UniDBComboBox5: TUniDBComboBox
                        Tag = 1
                        Left = 3
                        Top = 21
                        Width = 145
                        Height = 32
                        Hint = ''
                        Anchors = [akLeft, akTop, akRight]
                        DataField = 'TIPOTRIB'
                        DataSource = dsMaster
                        Style = csDropDownList
                        Items.Strings = (
                          ''
                          '200'
                          '400'
                          '000')
                        TabOrder = 1
                        IconItems = <>
                      end
                      object UniLabel31: TUniLabel
                        Left = 3
                        Top = 1
                        Width = 80
                        Height = 13
                        Hint = ''
                        Caption = 'Tipo Tributa'#231#227'o'
                        TabOrder = 2
                      end
                    end
                    object rcBlock320: TUniContainerPanel
                      Tag = 1
                      Left = 345
                      Top = 270
                      Width = 150
                      Height = 60
                      Hint = '[[cols:xs-6 sm-6 md-2]]'
                      ParentColor = False
                      TabOrder = 16
                      DesignSize = (
                        150
                        60)
                      object UniDBComboBox6: TUniDBComboBox
                        Tag = 1
                        Left = 3
                        Top = 21
                        Width = 144
                        Height = 32
                        Hint = ''
                        Anchors = [akLeft, akTop, akRight]
                        DataField = 'ORIGEM'
                        DataSource = dsMaster
                        Style = csDropDownList
                        Items.Strings = (
                          'Nacional'
                          'Importacao'
                          'Interno')
                        TabOrder = 1
                        IconItems = <>
                      end
                      object UniLabel33: TUniLabel
                        Left = 2
                        Top = 1
                        Width = 38
                        Height = 13
                        Hint = ''
                        Caption = 'Origem'
                        TabOrder = 2
                      end
                    end
                  end
                end
              end
              object tabBeneficios: TUniTabSheet
                Hint = ''
                Caption = 'Benef'#237'cios (CBNEF)'
                object sboxGridBlockTab3: TUniScrollBox
                  Left = 0
                  Top = 0
                  Width = 1307
                  Height = 935
                  Hint = ''
                  Align = alClient
                  TabOrder = 0
                  ScrollHeight = 633
                  ScrollWidth = 936
                  object rcBlock562: TUniContainerPanel
                    Tag = 1
                    AlignWithMargins = True
                    Left = 53
                    Top = 15
                    Width = 883
                    Height = 618
                    Hint = 
                      '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'hr-childs:xs-exp sm-exp md-exp | ' +
                      #13#10'round:no | '#13#10'cls:card-info-box-white |'#13#10']]'#13#10
                    Margins.Left = 15
                    Margins.Top = 15
                    Margins.Right = 15
                    Margins.Bottom = 10
                    ParentColor = False
                    TabOrder = 0
                    object rcBlock563: TUniContainerPanel
                      Left = -1
                      Top = 0
                      Width = 884
                      Height = 36
                      Hint = 
                        '[['#13#10'cols:12 |'#13#10'noborder-top | '#13#10'noborder-left | '#13#10'noborder-right' +
                        ' | '#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                      ParentColor = False
                      Color = clSilver
                      TabOrder = 1
                      DesignSize = (
                        884
                        36)
                      object UniLabel11: TUniLabel
                        Left = 850
                        Top = 8
                        Width = 10
                        Height = 26
                        Hint = '[['#13#10'collapse:rcBlock562 off-42 '#13#10']]'#13#10
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
                      object UniLabel40: TUniLabel
                        AlignWithMargins = True
                        Left = 6
                        Top = 6
                        Width = 135
                        Height = 19
                        Hint = '[['#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
                        Margins.Left = 6
                        Margins.Top = 0
                        Margins.Right = 0
                        Margins.Bottom = 0
                        Caption = 'Dados Faturamento'
                        ParentFont = False
                        Font.Color = clGray
                        Font.Height = -16
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold]
                        TabOrder = 2
                      end
                    end
                    object rcBlock590: TUniContainerPanel
                      Tag = 1
                      Left = 20
                      Top = 95
                      Width = 154
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-3 lg-3 xl-3]]'
                      ParentColor = False
                      TabOrder = 2
                      DesignSize = (
                        154
                        60)
                      object UniLabel45: TUniLabel
                        Left = 5
                        Top = 0
                        Width = 86
                        Height = 15
                        Hint = ''
                        Caption = 'C'#243'd Benef Local'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edLkpCBNEF__LC: TUniDBEdit
                        Left = 3
                        Top = 21
                        Width = 147
                        Height = 32
                        Hint = 
                          '[['#13#10'CODCBNEF CODIGOBENEFICIOLC @ ds:dscruddetails |'#13#10'lkpfilter-e' +
                          'mpty:Selecione um Beneficio<translate>|'#13#10'lkpfilter-order: |'#13#10'lkp' +
                          'filter-gridattr: |'#13#10'valid:blank |'#13#10'valid-required:top-in |'#13#10']]'#13#10 +
                          #13#10
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        Color = clInfoBk
                        ReadOnly = True
                        InputType = 'text'
                        OnEnter = edLkpCBNEF__LCEnter
                      end
                    end
                    object rcBlock595: TUniContainerPanel
                      Tag = 1
                      Left = 210
                      Top = 94
                      Width = 142
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
                      ParentColor = False
                      TabOrder = 3
                      DesignSize = (
                        142
                        60)
                      object UniLabel5: TUniLabel
                        Left = 4
                        Top = 0
                        Width = 86
                        Height = 15
                        Hint = ''
                        Caption = 'C'#243'd Benef Local'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edLkpCBNEF__01: TUniDBEdit
                        Left = 3
                        Top = 21
                        Width = 136
                        Height = 32
                        Hint = 
                          '[['#13#10'CODCBNEF CODIGOBENEFICIO01 @ ds:dscruddetails |'#13#10'lkpfilter-e' +
                          'mpty:Selecione um Beneficio<translate>|'#13#10'lkpfilter-order: |'#13#10'lkp' +
                          'filter-gridattr: |'#13#10'valid:blank |'#13#10'valid-required:top-in |'#13#10']]'#13#10 +
                          #13#10#13#10
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        Color = clInfoBk
                        ReadOnly = True
                        InputType = 'text'
                        OnEnter = edLkpCBNEF__01Enter
                      end
                    end
                    object rcBlock600: TUniContainerPanel
                      Tag = 1
                      Left = 376
                      Top = 94
                      Width = 100
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
                      ParentColor = False
                      TabOrder = 4
                      DesignSize = (
                        100
                        60)
                      object UniLabel9: TUniLabel
                        Left = 6
                        Top = 0
                        Width = 86
                        Height = 15
                        Hint = ''
                        Caption = 'C'#243'd Benef Local'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edLkpCBNEF__02: TUniDBEdit
                        Left = 4
                        Top = 21
                        Width = 92
                        Height = 32
                        Hint = 
                          '[['#13#10'CODCBNEF CODIGOBENEFICIO02 @ ds:dscruddetails |'#13#10'lkpfilter-e' +
                          'mpty:Selecione um Beneficio<translate>|'#13#10'lkpfilter-order: |'#13#10'lkp' +
                          'filter-gridattr: |'#13#10'valid:blank |'#13#10'valid-required:top-in |'#13#10']]'#13#10 +
                          #13#10
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        Color = clInfoBk
                        ReadOnly = True
                        InputType = 'text'
                        OnEnter = edLkpCBNEF__02Enter
                      end
                    end
                    object rcBlock605: TUniContainerPanel
                      Tag = 1
                      Left = 520
                      Top = 95
                      Width = 100
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
                      ParentColor = False
                      TabOrder = 5
                      DesignSize = (
                        100
                        60)
                      object UniLabel12: TUniLabel
                        Left = 6
                        Top = 0
                        Width = 86
                        Height = 15
                        Hint = ''
                        Caption = 'C'#243'd Benef Local'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edLkpCBNEF__90: TUniDBEdit
                        Left = 4
                        Top = 21
                        Width = 94
                        Height = 32
                        Hint = 
                          '[['#13#10'CODCBNEF CODIGOBENEFICIO90 @ ds:dscruddetails |'#13#10'lkpfilter-e' +
                          'mpty:Selecione um Beneficio<translate>|'#13#10'lkpfilter-order: |'#13#10'lkp' +
                          'filter-gridattr: |'#13#10'valid:blank |'#13#10'valid-required:top-in |'#13#10']]'#13#10 +
                          #13#10
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        Color = clInfoBk
                        ReadOnly = True
                        InputType = 'text'
                        OnEnter = edLkpCBNEF__90Enter
                      end
                    end
                    object rcBlock610: TUniContainerPanel
                      Tag = 1
                      Left = 651
                      Top = 93
                      Width = 100
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-3 lg-3 xl-3]]'
                      ParentColor = False
                      TabOrder = 6
                      DesignSize = (
                        100
                        60)
                      object UniLabel32: TUniLabel
                        Left = 4
                        Top = 0
                        Width = 86
                        Height = 15
                        Hint = ''
                        Caption = 'C'#243'd Benef Local'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edLkpCBNEF__EX: TUniDBEdit
                        Left = 3
                        Top = 21
                        Width = 94
                        Height = 32
                        Hint = 
                          '[['#13#10'CODCBNEF CODIGOBENEFICIOEX @ ds:dscruddetails |'#13#10'lkpfilter-e' +
                          'mpty:Selecione um Beneficio<translate>|'#13#10'lkpfilter-order: |'#13#10'lkp' +
                          'filter-gridattr: |'#13#10'valid:blank |'#13#10'valid-required:top-in |'#13#10']]'#13#10 +
                          #13#10
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        Color = clInfoBk
                        ReadOnly = True
                        InputType = 'text'
                        OnEnter = edLkpCBNEF__EXEnter
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
          inherited paSearchFilter1: TUniContainerPanel
            inherited paSearchField1: TUniContainerPanel
              inherited cbxSearchCRUDField1: TUniComboBox
                Top = 21
                ExplicitTop = 21
              end
            end
          end
          inherited paSearchBtn: TUniContainerPanel
            inherited btnSearchCRUD: TUniBitBtn
              ScreenMask.Target = Owner
            end
          end
        end
      end
      inherited paSearchFiltersCustom: TUniPanel
        inherited sboxSearchFiltersCustom: TUniScrollBox
          ScrollHeight = 223
          object UniContainerPanel2: TUniContainerPanel
            AlignWithMargins = True
            Left = 10
            Top = 43
            Width = 313
            Height = 60
            Hint = ''
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            ParentColor = False
            Color = 15724527
            Align = alTop
            TabOrder = 1
            object UniContainerPanel3: TUniContainerPanel
              AlignWithMargins = True
              Left = 0
              Top = 0
              Width = 135
              Height = 60
              Hint = ''
              Margins.Left = 0
              Margins.Top = 0
              Margins.Bottom = 0
              ParentColor = False
              Align = alLeft
              TabOrder = 1
              object UniLabel53: TUniLabel
                Left = 0
                Top = 1
                Width = 38
                Height = 13
                Hint = ''
                Caption = 'C'#243'digo'
                TabOrder = 1
              end
              object edSearchCODIGO: TUniEdit
                Left = 0
                Top = 31
                Width = 135
                Height = 29
                Hint = ''
                CharCase = ecUpperCase
                Text = ''
                Align = alBottom
                TabOrder = 2
              end
            end
            object UniContainerPanel4: TUniContainerPanel
              AlignWithMargins = True
              Left = 152
              Top = 0
              Width = 135
              Height = 60
              Hint = ''
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 26
              Margins.Bottom = 0
              ParentColor = False
              Align = alRight
              TabOrder = 2
              object UniLabel54: TUniLabel
                Left = 3
                Top = 1
                Width = 49
                Height = 13
                Hint = ''
                Caption = 'Descri'#231#227'o'
                TabOrder = 1
              end
              object edSearchDESCRICAO: TUniEdit
                Left = 0
                Top = 31
                Width = 135
                Height = 29
                Hint = ''
                CharCase = ecUpperCase
                Text = ''
                Align = alBottom
                TabOrder = 2
              end
            end
          end
          object UniContainerPanel5: TUniContainerPanel
            AlignWithMargins = True
            Left = 10
            Top = 103
            Width = 287
            Height = 60
            Hint = ''
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 26
            Margins.Bottom = 0
            ParentColor = False
            Color = 15724527
            Align = alTop
            TabOrder = 2
            object UniLabel55: TUniLabel
              Left = 3
              Top = 1
              Width = 43
              Height = 15
              Hint = ''
              Caption = 'Cultivar'
              TabOrder = 1
            end
            object edSearchCULTIVAR: TUniEdit
              Left = 0
              Top = 31
              Width = 287
              Height = 29
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              Align = alBottom
              TabOrder = 2
            end
          end
          object UniContainerPanel6: TUniContainerPanel
            AlignWithMargins = True
            Left = 10
            Top = 163
            Width = 313
            Height = 60
            Hint = ''
            Margins.Left = 10
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            ParentColor = False
            Color = 15724527
            Align = alTop
            TabOrder = 3
            object UniLabel56: TUniLabel
              Left = 0
              Top = 1
              Width = 46
              Height = 15
              Hint = ''
              Caption = 'Unidade'
              TabOrder = 1
            end
            object edSearchUNIDADE: TUniComboBox
              Left = 0
              Top = 31
              Width = 313
              Height = 29
              Hint = ''
              Text = ''
              Items.Strings = (
                ''
                'UN'
                'KG'
                'L'
                'M'
                'CX'
                'PC'
                'SC')
              Align = alBottom
              TabOrder = 2
              IconItems = <>
            end
          end
        end
      end
    end
  end
  inherited ed_Order_Search: TUniEdit
    Text = 'DESCRICAO'
  end
  inherited rcSweetAlert: TUniSweetAlert
    Left = 960
    Top = 26
  end
  inherited dsMaster: TDataSource
    Left = 802
    Top = 27
  end
  inherited dsSearchMaster: TDataSource
    Left = 514
    Top = 285
  end
  inherited sqlSearchMaster: TFDQuery
    SQL.Strings = (
      'SELECT * FROM PRODUTOS')
    Left = 601
    Top = 315
  end
  inherited sqlMaster: TFDQuery
    AfterOpen = sqlMasterAfterOpen
    UpdateOptions.UpdateTableName = 'PRODUTOS'
    SQL.Strings = (
      'SELECT * FROM PRODUTOS')
    Left = 1219
    Top = 9
  end
  inherited popMenuOptions: TUniPopupMenu
    Left = 418
    Top = 16
  end
  inherited FDSchemaAdapter1: TFDSchemaAdapter
    Left = 966
    Top = 118
  end
  inherited FDQryCad: TFDQuery
    UpdateOptions.UpdateTableName = 'PRODUTOS'
    SQL.Strings = (
      'SELECT * FROM PRODUTOS WHERE CODIGO = :CODIGO')
    Left = 857
    Top = 22
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  inherited dscrud: TDataSource
    Left = 1275
    Top = 6
  end
  inherited FDQryFiltro: TFDQuery
    SQL.Strings = (
      'SELECT * FROM PRODUTOS')
    Left = 1105
    Top = 14
    object FDQryFiltroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
    object FDQryFiltroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object FDQryFiltroCULTIVAR: TStringField
      FieldName = 'CULTIVAR'
      Origin = 'CULTIVAR'
      Size = 60
    end
    object FDQryFiltroUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 3
    end
  end
  inherited FDQryCaddetails: TFDQuery
    UpdateOptions.UpdateTableName = 'SALDOS'
    SQL.Strings = (
      'SELECT * FROM SALDOS WHERE PRODUTO = :PRODUTO'
      'AND EMPRESA = :EMPRESA'
      '')
    Left = 841
    Top = 271
    ParamData = <
      item
        Name = 'PRODUTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EMPRESA'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  inherited dscruddetails: TDataSource
    OnStateChange = DetalhesStateChange
    Left = 835
    Top = 215
  end
  inherited tbdetalhes: TFDMemTable
    Left = 1029
    Top = 20
  end
  inherited dsdetalhes: TDataSource
    Left = 1133
    Top = 92
  end
  object UniPopupMenudetalhesproduto: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 551
    Top = 6
    object UniMenuItem1: TUniMenuItem
      Caption = 'Kardex do Produto'
      ImageIndex = 112
      OnClick = UniMenuItem1Click
    end
  end
end
