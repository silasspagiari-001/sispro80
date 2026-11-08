inherited frmCadPESSOAS: TfrmCadPESSOAS
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
            't|'#13#10#13#10']]'
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
                    FieldName = 'KEY'
                    Title.Caption = 'KEY'
                    Width = 64
                    Visible = False
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'STATUS'
                    Title.Caption = 'STATUS'
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
                    FieldName = 'CPFCNPJ'
                    Title.Caption = 'CPFCNPJ'
                    Width = 64
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'NOME'
                    Title.Caption = 'NOME'
                    Width = 64
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'CIDADE'
                    Title.Caption = 'CIDADE'
                    Width = 64
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'ESTADO'
                    Title.Caption = 'ESTADO'
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
                  ScrollHeight = 1068
                  ScrollWidth = 899
                  object rcBlock515: TUniContainerPanel
                    Tag = 4
                    Left = 81
                    Top = 1046
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
                    Height = 237
                    Hint = 
                      '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'round:no | '#13#10'cls:card-info-box-wh' +
                      'ite |'#13#10'/*noborder-left:mobile|*/'#13#10'/*noborder-right:mobile|*/'#13#10']]' +
                      #13#10#13#10#13#10#13#10
                    Margins.Left = 15
                    Margins.Top = 15
                    Margins.Right = 15
                    Margins.Bottom = 10
                    ParentColor = False
                    TabOrder = 1
                    object rcBlock10: TUniContainerPanel
                      Tag = 1
                      Left = 20
                      Top = 37
                      Width = 100
                      Height = 60
                      Hint = '[['#13#10'cols:xs-12 sm-12 md-1|'#13#10']]'
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
                          'OR]] b-[[EDIT_FONT_COLOR]] '#13#10']]'#13#10#13#10#13#10
                        DataField = 'codigo'
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
                    object rcBlock15: TUniContainerPanel
                      Tag = 1
                      Left = 266
                      Top = 37
                      Width = 115
                      Height = 60
                      Hint = '[['#13#10'cols:xs-12 sm-12 md-2|'#13#10']]'
                      ParentColor = False
                      TabOrder = 2
                      DesignSize = (
                        115
                        60)
                      object UniLabel9: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 57
                        Height = 15
                        Hint = ''
                        Caption = 'Cpf  / Cnpj'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edCnpjCpf: TUniDBEdit
                        Left = 2
                        Top = 24
                        Width = 110
                        Height = 30
                        Hint = '[['#13#10'valid:cpfcnpj &edTipoPessoa="F J" |'#13#10'mask:cnpj'#13#10']]'
                        DataField = 'CPFCNPJ'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        OnExit = edCnpjCpfExit
                      end
                    end
                    object rcBlock80: TUniContainerPanel
                      Tag = 1
                      Left = 14
                      Top = 149
                      Width = 376
                      Height = 60
                      Hint = '[['#13#10'cols:xs-12 sm-12 md-6|'#13#10']]'
                      ParentColor = False
                      TabOrder = 3
                      DesignSize = (
                        376
                        60)
                      object UniLabel6: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 90
                        Height = 15
                        Hint = ''
                        Caption = 'Nome / Fantasia'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edCliName: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 375
                        Height = 32
                        Hint = '[['#13#10'valid:blank=Nome Cliente|'#13#10'valid-required:top-in'#13#10']]'
                        DataField = 'NOME'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock90: TUniContainerPanel
                      Tag = 1
                      Left = 447
                      Top = 149
                      Width = 376
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-6]]'
                      ParentColor = False
                      TabOrder = 4
                      DesignSize = (
                        376
                        60)
                      object UniLabel12: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 70
                        Height = 15
                        Hint = ''
                        Caption = 'Raz'#227'o Social'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edRazSoc: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 375
                        Height = 32
                        Hint = ''
                        DataField = 'FANTASIA'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock3: TUniContainerPanel
                      Left = -1
                      Top = 0
                      Width = 884
                      Height = 36
                      Hint = '[['#13#10'cols:12 |'#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                      ParentColor = False
                      Color = clSilver
                      TabOrder = 5
                      DesignSize = (
                        884
                        36)
                      object labRcCollapseGeneral: TUniLabel
                        Left = 850
                        Top = 8
                        Width = 10
                        Height = 26
                        Hint = '[['#13#10'collapse:rcBlock2 off-50 '#13#10']]'#13#10
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
                    object rcBlock20: TUniContainerPanel
                      Tag = 1
                      Left = 384
                      Top = 37
                      Width = 149
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 6
                      DesignSize = (
                        149
                        60)
                      object UniLabel1: TUniLabel
                        Left = 3
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
                        Left = 17
                        Top = 24
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
                      object UniLabel44: TUniLabel
                        Left = 51
                        Top = 0
                        Width = 76
                        Height = 15
                        Hint = ''
                        Caption = 'Status Pessoa'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 3
                      end
                      object UniDBComboBox5: TUniDBComboBox
                        Tag = 1
                        Left = 51
                        Top = 21
                        Width = 92
                        Height = 32
                        Hint = ''
                        Anchors = [akLeft, akTop, akRight]
                        DataField = 'STATUS'
                        DataSource = dsMaster
                        Style = csDropDownList
                        Items.Strings = (
                          ''
                          'Livre'
                          'Analise'
                          'Block'
                          'Somente A Vista')
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 4
                        IconItems = <>
                      end
                    end
                    object rcBlock25: TUniContainerPanel
                      Tag = 1
                      Left = 539
                      Top = 36
                      Width = 115
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 7
                      DesignSize = (
                        115
                        60)
                      object UniLabel5: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 82
                        Height = 15
                        Hint = ''
                        Caption = 'Tipo de Pessoa'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBLookupComboBox1: TUniDBLookupComboBox
                        Left = 2
                        Top = 21
                        Width = 110
                        Height = 32
                        Hint = ''
                        ListField = 'DESCRICAO'
                        ListSource = dm_rc.DSpessoasTipo
                        KeyField = 'CODIGO'
                        ListFieldIndex = 1
                        DataField = 'TIPO_CODIGO'
                        DataSource = dsMaster
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                        Color = clWindow
                      end
                    end
                    object rcBlock30: TUniContainerPanel
                      Tag = 1
                      Left = 660
                      Top = 37
                      Width = 105
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 8
                      DesignSize = (
                        105
                        60)
                      object UniLabel10: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 48
                        Height = 15
                        Hint = ''
                        Caption = 'Situa'#231#227'o'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBLookupComboBox2: TUniDBLookupComboBox
                        Left = 2
                        Top = 21
                        Width = 100
                        Height = 32
                        Hint = ''
                        ListField = 'DESCRICAO'
                        ListSource = dm_rc.DSpessoasSituacao
                        KeyField = 'CODIGO'
                        ListFieldIndex = 1
                        DataField = 'SITUACAO_CODIGO'
                        DataSource = dsMaster
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                        Color = clWindow
                      end
                    end
                    object rcBlock50: TUniContainerPanel
                      Tag = 1
                      Left = 768
                      Top = 37
                      Width = 111
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 9
                      DesignSize = (
                        111
                        60)
                      object UniLabel11: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 50
                        Height = 15
                        Hint = ''
                        Caption = 'Cadastro'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBDateTimePicker2: TUniDBDateTimePicker
                        Left = 3
                        Top = 21
                        Width = 105
                        Height = 32
                        Hint = ''
                        DataField = 'CADASTRO'
                        DataSource = dsMaster
                        DateTime = 44561.000000000000000000
                        DateFormat = 'dd/MM/yyyy'
                        TimeFormat = 'HH:mm:ss'
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                      end
                    end
                    object rcBlock60: TUniContainerPanel
                      Tag = 1
                      Left = 20
                      Top = 95
                      Width = 150
                      Height = 50
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 10
                      DesignSize = (
                        150
                        50)
                      object edIE_RG: TUniDBEdit
                        Left = 2
                        Top = 17
                        Width = 145
                        Height = 32
                        Hint = ''
                        DataField = 'INSCRICAO'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniLabel17: TUniLabel
                        Left = 4
                        Top = 0
                        Width = 121
                        Height = 15
                        Hint = ''
                        Caption = 'Rg/Inscri'#231#227'o Estadual'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock65: TUniContainerPanel
                      Tag = 1
                      Left = 176
                      Top = 103
                      Width = 150
                      Height = 51
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 11
                      DesignSize = (
                        150
                        51)
                      object UniLabel19: TUniLabel
                        Left = 5
                        Top = 0
                        Width = 94
                        Height = 15
                        Hint = ''
                        Caption = 'Insc. de Produtor'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBEdit3: TUniDBEdit
                        Left = 2
                        Top = 17
                        Width = 145
                        Height = 32
                        Hint = ''
                        DataField = 'PRODUTOR'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock70: TUniContainerPanel
                      Tag = 1
                      Left = 332
                      Top = 103
                      Width = 150
                      Height = 51
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 12
                      DesignSize = (
                        150
                        51)
                      object UniLabel20: TUniLabel
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
                      object UniDBEdit4: TUniDBEdit
                        Left = 3
                        Top = 17
                        Width = 144
                        Height = 32
                        Hint = ''
                        DataField = 'RENASEM'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock75: TUniContainerPanel
                      Tag = 1
                      Left = 516
                      Top = 93
                      Width = 326
                      Height = 52
                      Hint = '[[cols:xs-12 sm-12 md-3 lg-3 xl-3]]'
                      ParentColor = False
                      TabOrder = 13
                      DesignSize = (
                        326
                        52)
                      object UniLabel21: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 67
                        Height = 15
                        Hint = ''
                        Caption = 'Funcionario'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edLkpFUNCIONARIOS: TUniDBEdit
                        Left = 0
                        Top = 17
                        Width = 325
                        Height = 32
                        Hint = 
                          '[['#13#10'NOME FUNCIONARIO @60 ! +modal searchall |'#13#10'lkpfilter-empty:S' +
                          'elecione um Funcionario<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilt' +
                          'er-gridattr: |'#13#10'valid:blank |'#13#10'valid-required:top-in |'#13#10#13#10']]'
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        Color = clInfoBk
                        ReadOnly = True
                        InputType = 'text'
                      end
                    end
                    object rcBlock12: TUniContainerPanel
                      Tag = 1
                      Left = 126
                      Top = 37
                      Width = 115
                      Height = 60
                      Hint = '[['#13#10'cols:xs-12 sm-12 md-1|'#13#10']]'
                      ParentColor = False
                      TabOrder = 14
                      DesignSize = (
                        115
                        60)
                      object UniLabel48: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 42
                        Height = 15
                        Hint = ''
                        Caption = 'Pessoa '
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edTipoPessoa: TUniDBComboBox
                        Left = 3
                        Top = 24
                        Width = 107
                        Height = 30
                        Hint = ''
                        Anchors = [akLeft, akTop, akRight]
                        DataField = 'PESSOA'
                        DataSource = dsMaster
                        Items.Strings = (
                          'F'#237'sica|F'
                          'Jur'#237'dica|J')
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        IconItems = <>
                        OnChange = edTipoPessoaChange
                      end
                    end
                  end
                  object rcBlock94: TUniContainerPanel
                    Tag = 1
                    AlignWithMargins = True
                    Left = 15
                    Top = 252
                    Width = 884
                    Height = 318
                    Hint = 
                      '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'round:no | '#13#10'cls:card-info-box-wh' +
                      'ite |'#13#10']]'#13#10#13#10
                    Margins.Left = 15
                    Margins.Top = 15
                    Margins.Right = 15
                    Margins.Bottom = 10
                    ParentColor = False
                    TabOrder = 2
                    object rcBlock95: TUniContainerPanel
                      Left = 0
                      Top = 0
                      Width = 884
                      Height = 34
                      Hint = '[['#13#10'cols:12 |'#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                      ParentColor = False
                      Color = clSilver
                      TabOrder = 7
                      DesignSize = (
                        884
                        34)
                      object UniLabel2: TUniLabel
                        AlignWithMargins = True
                        Left = 6
                        Top = 6
                        Width = 60
                        Height = 19
                        Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
                        Margins.Left = 6
                        Margins.Top = 0
                        Margins.Right = 0
                        Margins.Bottom = 0
                        Caption = 'Endere'#231'o'
                        ParentFont = False
                        Font.Color = clGray
                        Font.Height = -16
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object labCollapseDefaultAddr: TUniLabel
                        Left = 850
                        Top = 8
                        Width = 10
                        Height = 26
                        Hint = '[['#13#10'collapse:rcBlock94 off-50 '#13#10']]'#13#10
                        TextConversion = txtHTML
                        Caption = '^'
                        Anchors = [akTop, akRight]
                        ParentFont = False
                        Font.Height = -21
                        Font.Name = 'Calibri'
                        ParentColor = False
                        Color = clBlack
                        TabOrder = 2
                      end
                    end
                    object rcBlock110: TUniContainerPanel
                      Tag = 1
                      Left = 133
                      Top = 61
                      Width = 326
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-8]]'
                      ParentColor = False
                      TabOrder = 2
                      DesignSize = (
                        326
                        60)
                      object UniLabel4: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 50
                        Height = 15
                        Hint = ''
                        Caption = 'Endere'#231'o'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edAddress: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 325
                        Height = 32
                        Hint = ''
                        DataField = 'ENDERECO'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock120: TUniContainerPanel
                      Tag = 1
                      Left = 484
                      Top = 61
                      Width = 100
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
                      ParentColor = False
                      TabOrder = 3
                      DesignSize = (
                        100
                        60)
                      object UniLabel7: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 43
                        Height = 15
                        Hint = ''
                        Caption = 'N'#250'mero'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edAddressNumber: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 100
                        Height = 32
                        Hint = ''
                        DataField = 'NUMERO'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock140: TUniContainerPanel
                      Tag = 1
                      Left = 140
                      Top = 124
                      Width = 326
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-4 lg-4 xl-4]]'
                      ParentColor = False
                      TabOrder = 4
                      DesignSize = (
                        326
                        60)
                      object UniLabel14: TUniLabel
                        Left = 0
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
                      object edLkpCIDADES__PRINCIPAL: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 325
                        Height = 32
                        Hint = 
                          '[['#13#10'DESCRICAO CODICIDADE @60 ! +modal searchall |'#13#10'lkpfilter:quo' +
                          'ted(uf=edLkpUFS<text>) | /* uf='#39'CE'#39' */'#13#10'lkpfilter-empty:Selecion' +
                          'e uma UF<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-searchfields' +
                          ':codiibge |'#13#10'lkpfilter-gridattr: |'#13#10'valid:blank |'#13#10'valid-require' +
                          'd:top-in |'#13#10#13#10']]'
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        Color = clInfoBk
                        ReadOnly = True
                        InputType = 'text'
                        OnExit = edLkpCIDADES__PRINCIPALExit
                      end
                    end
                    object rcBlock160: TUniContainerPanel
                      Tag = 1
                      Left = 613
                      Top = 123
                      Width = 229
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-4 lg-4 xl-4]]'
                      ParentColor = False
                      TabOrder = 6
                      DesignSize = (
                        229
                        60)
                      object UniLabel15: TUniLabel
                        Left = 0
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
                      object edbairro: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 229
                        Height = 32
                        Hint = ''
                        DataField = 'BAIRRO'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock100: TUniContainerPanel
                      Tag = 1
                      Left = 12
                      Top = 61
                      Width = 100
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
                      ParentColor = False
                      TabOrder = 1
                      DesignSize = (
                        100
                        60)
                      object UniLabel16: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 20
                        Height = 15
                        Hint = ''
                        Caption = 'Cep'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edCep: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 100
                        Height = 32
                        Hint = '[[mask:cep]]'
                        DataField = 'CEP'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Color = clBlack
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        OnExit = edCepExit
                        OnEnter = edCepEnter
                      end
                    end
                    object rcBlock150: TUniContainerPanel
                      Tag = 1
                      Left = 495
                      Top = 125
                      Width = 100
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
                      ParentColor = False
                      TabOrder = 5
                      DesignSize = (
                        100
                        60)
                      object UniLabel18: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 52
                        Height = 15
                        Hint = ''
                        Caption = 'C'#243'd. IBGE'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edLkpCIDADES_SetDS_CODIIBGE: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 100
                        Height = 32
                        Hint = ''
                        DataField = 'CODIIBGE'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock130: TUniContainerPanel
                      Tag = 1
                      Left = 20
                      Top = 125
                      Width = 100
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
                      ParentColor = False
                      TabOrder = 8
                      DesignSize = (
                        100
                        60)
                      object UniLabel13: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 14
                        Height = 15
                        Hint = ''
                        Caption = 'UF'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edLkpUFS: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 100
                        Height = 32
                        Hint = '[[DESCRICAO CODIUF !]]'
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        Color = clInfoBk
                        ReadOnly = True
                        InputType = 'text'
                      end
                    end
                    object rcBlock210: TUniContainerPanel
                      Tag = 1
                      Left = 12
                      Top = 191
                      Width = 150
                      Height = 50
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 9
                      DesignSize = (
                        150
                        50)
                      object edPhone: TUniDBEdit
                        Left = 3
                        Top = 17
                        Width = 145
                        Height = 31
                        Hint = ''
                        DataField = 'TELEFONE'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniLabel23: TUniLabel
                        Left = 3
                        Top = 1
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
                    object rcBlock220: TUniContainerPanel
                      Tag = 1
                      Left = 178
                      Top = 190
                      Width = 150
                      Height = 50
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 10
                      DesignSize = (
                        150
                        50)
                      object UniDBEdit12: TUniDBEdit
                        Left = 4
                        Top = 17
                        Width = 143
                        Height = 31
                        Hint = ''
                        DataField = 'CELULAR'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniLabel24: TUniLabel
                        Left = 3
                        Top = 1
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
                    object rcBlock230: TUniContainerPanel
                      Tag = 1
                      Left = 339
                      Top = 191
                      Width = 150
                      Height = 50
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 11
                      DesignSize = (
                        150
                        50)
                      object UniDBEdit13: TUniDBEdit
                        Left = 5
                        Top = 17
                        Width = 145
                        Height = 31
                        Hint = ''
                        DataField = 'CONTATOENTREGA'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniLabel25: TUniLabel
                        Left = 5
                        Top = 1
                        Width = 43
                        Height = 15
                        Hint = ''
                        Caption = 'Contato'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock240: TUniContainerPanel
                      Tag = 1
                      Left = 708
                      Top = 189
                      Width = 150
                      Height = 51
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 12
                      DesignSize = (
                        150
                        51)
                      object UniLabel26: TUniLabel
                        Left = 5
                        Top = 2
                        Width = 37
                        Height = 15
                        Hint = ''
                        Caption = 'Regi'#227'o'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBComboBoxregiao: TUniDBComboBox
                        Tag = 1
                        Left = 2
                        Top = 18
                        Width = 145
                        Height = 31
                        Hint = ''
                        Anchors = [akLeft, akTop, akRight]
                        DataField = 'REGIAO'
                        DataSource = dsMaster
                        Style = csDropDownList
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        IconItems = <>
                      end
                    end
                    object rcBlock250: TUniContainerPanel
                      Left = 20
                      Top = 247
                      Width = 150
                      Height = 52
                      Hint = '[[cols:xs-12 sm-12 md-6]]'
                      ParentColor = False
                      TabOrder = 13
                      DesignSize = (
                        150
                        52)
                      object UniDBEdit14: TUniDBEdit
                        Left = 1
                        Top = 17
                        Width = 146
                        Height = 31
                        Hint = ''
                        DataField = 'EMAIL'
                        DataSource = dsMaster
                        CharCase = ecLowerCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniLabel27: TUniLabel
                        Left = 1
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
                    object rcBlock260: TUniContainerPanel
                      Left = 176
                      Top = 246
                      Width = 150
                      Height = 52
                      Hint = '[[cols:xs-12 sm-12 md-6]]'
                      ParentColor = False
                      TabOrder = 14
                      DesignSize = (
                        150
                        52)
                      object UniDBEdit15: TUniDBEdit
                        Left = 2
                        Top = 17
                        Width = 144
                        Height = 31
                        Hint = ''
                        DataField = 'URL'
                        DataSource = dsMaster
                        CharCase = ecLowerCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniLabel28: TUniLabel
                        Left = 1
                        Top = 1
                        Width = 20
                        Height = 15
                        Hint = ''
                        Caption = 'Site'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                  end
                end
              end
              object tabComercial: TUniTabSheet
                Hint = ''
                Caption = 'Dados Adicionais'
                object UniScrollBox2: TUniScrollBox
                  Left = 0
                  Top = 0
                  Width = 1307
                  Height = 935
                  Hint = ''
                  Align = alClient
                  TabOrder = 0
                  ScrollHeight = 503
                  ScrollWidth = 898
                  object rcBlock402: TUniContainerPanel
                    Tag = 1
                    AlignWithMargins = True
                    Left = 15
                    Top = 5
                    Width = 883
                    Height = 186
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
                    object rcBlock500: TUniContainerPanel
                      Tag = 1
                      Left = 20
                      Top = 37
                      Width = 100
                      Height = 60
                      Hint = '[['#13#10'cols:xs-12 sm-12 md-2|'#13#10']]'
                      ParentColor = False
                      TabOrder = 1
                      DesignSize = (
                        100
                        60)
                      object UniLabel22: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 20
                        Height = 15
                        Hint = ''
                        Caption = 'CEP'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBEdit1: TUniDBEdit
                        Left = 0
                        Top = 20
                        Width = 100
                        Height = 32
                        Hint = '[[mask:cep]]'
                        DataField = 'CEPENTREGA'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Color = clBlack
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        OnExit = UniDBEdit1Exit
                      end
                    end
                    object rcBlock510: TUniContainerPanel
                      Tag = 1
                      Left = 126
                      Top = 37
                      Width = 248
                      Height = 60
                      Hint = '[['#13#10'cols:xs-12 sm-12 md-5|'#13#10']]'
                      ParentColor = False
                      TabOrder = 2
                      DesignSize = (
                        248
                        60)
                      object UniDBEdit5: TUniDBEdit
                        Left = 3
                        Top = 21
                        Width = 242
                        Height = 32
                        Hint = ''
                        DataField = 'ENDERECOENTREGA'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniLabel29: TUniLabel
                        Left = 8
                        Top = 2
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
                    object rcBlock403: TUniContainerPanel
                      Left = -1
                      Top = 0
                      Width = 884
                      Height = 36
                      Hint = '[['#13#10'cols:12 |'#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                      ParentColor = False
                      Color = clSilver
                      TabOrder = 3
                      DesignSize = (
                        884
                        36)
                      object UniLabel32: TUniLabel
                        Left = 850
                        Top = 8
                        Width = 10
                        Height = 26
                        Hint = '[['#13#10'collapse:rcBlock402 off-42 '#13#10']]'#13#10
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
                      object UniLabel33: TUniLabel
                        AlignWithMargins = True
                        Left = 6
                        Top = 6
                        Width = 99
                        Height = 19
                        Hint = '[['#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
                        Margins.Left = 6
                        Margins.Top = 0
                        Margins.Right = 0
                        Margins.Bottom = 0
                        Caption = 'Dados Entrega'
                        ParentFont = False
                        Font.Color = clGray
                        Font.Height = -16
                        Font.Name = 'Calibri'
                        Font.Style = [fsBold]
                        TabOrder = 2
                      end
                    end
                    object rcBlock520: TUniContainerPanel
                      Tag = 1
                      Left = 394
                      Top = 37
                      Width = 133
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 4
                      DesignSize = (
                        133
                        60)
                      object UniDBEdit29: TUniDBEdit
                        Left = 2
                        Top = 21
                        Width = 127
                        Height = 32
                        Hint = ''
                        DataField = 'NUMEROENTREGA'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniLabel34: TUniLabel
                        Left = 8
                        Top = 4
                        Width = 43
                        Height = 15
                        Hint = ''
                        Caption = 'N'#250'mero'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock530: TUniContainerPanel
                      Tag = 1
                      Left = 558
                      Top = 43
                      Width = 259
                      Height = 54
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 5
                      DesignSize = (
                        259
                        54)
                      object UniDBEdit30: TUniDBEdit
                        Left = 2
                        Top = 15
                        Width = 256
                        Height = 32
                        Hint = ''
                        DataField = 'BAIRROENTREGA'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniLabel35: TUniLabel
                        Left = 1
                        Top = 0
                        Width = 35
                        Height = 15
                        Hint = ''
                        Caption = 'Bairro'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock560: TUniContainerPanel
                      Tag = 1
                      Left = 523
                      Top = 96
                      Width = 150
                      Height = 58
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 6
                      DesignSize = (
                        150
                        58)
                      object UniDBEdit8: TUniDBEdit
                        Left = 2
                        Top = 20
                        Width = 145
                        Height = 32
                        Hint = ''
                        DataField = 'INSCRICAOENTREGA'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniLabel39: TUniLabel
                        Left = 4
                        Top = 0
                        Width = 121
                        Height = 15
                        Hint = ''
                        Caption = 'Rg/Inscri'#231#227'o Estadual'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock540: TUniContainerPanel
                      Tag = 1
                      Left = 20
                      Top = 95
                      Width = 100
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-3 lg-3 xl-3]]'
                      ParentColor = False
                      TabOrder = 7
                      DesignSize = (
                        100
                        60)
                      object UniLabel36: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 14
                        Height = 15
                        Hint = ''
                        Caption = 'UF'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edLkpUFS__ENTREGA: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 100
                        Height = 32
                        Hint = '[[DESCRICAO CODIUFENTREGA !]]'
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        Color = clInfoBk
                        ReadOnly = True
                        InputType = 'text'
                      end
                    end
                    object rcBlock550: TUniContainerPanel
                      Tag = 1
                      Left = 136
                      Top = 96
                      Width = 326
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-6 lg-6 xl-6]]'
                      ParentColor = False
                      TabOrder = 8
                      DesignSize = (
                        326
                        60)
                      object UniLabel37: TUniLabel
                        Left = 0
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
                      object edLkpCIDADES__ENTREGA: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 325
                        Height = 32
                        Hint = 
                          '[['#13#10'DESCRICAO CODICIDADEENTREGA @60 ! +modal searchall |'#13#10'lkpfil' +
                          'ter:quoted(uf=edLkpUFS<text>) | /* uf='#39'CE'#39' */'#13#10'lkpfilter-empty:S' +
                          'elecione uma UF<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-searc' +
                          'hfields:codiibge |'#13#10'lkpfilter-gridattr: |'#13#10'valid:blank |'#13#10'valid-' +
                          'required:top-in |'#13#10#13#10']]'
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        Color = clInfoBk
                        ReadOnly = True
                        InputType = 'text'
                      end
                    end
                  end
                  object rcBlock562: TUniContainerPanel
                    Tag = 1
                    AlignWithMargins = True
                    Left = 15
                    Top = 266
                    Width = 883
                    Height = 237
                    Hint = 
                      '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'hr-childs:xs-exp sm-exp md-exp |'#13 +
                      #10'round:no | '#13#10'cls:card-info-box-white |'#13#10'/*noborder-left:mobile|' +
                      '*/'#13#10'/*noborder-right:mobile|*/'#13#10']]'#13#10#13#10#13#10#13#10
                    Margins.Left = 15
                    Margins.Top = 15
                    Margins.Right = 15
                    Margins.Bottom = 10
                    ParentColor = False
                    TabOrder = 1
                    object rcBlock570: TUniContainerPanel
                      Tag = 1
                      Left = 20
                      Top = 37
                      Width = 100
                      Height = 60
                      Hint = '[['#13#10'cols:xs-12 sm-12 md-2|'#13#10']]'
                      ParentColor = False
                      TabOrder = 1
                      DesignSize = (
                        100
                        60)
                      object UniLabel30: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 20
                        Height = 15
                        Hint = ''
                        Caption = 'CEP'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBEdit6: TUniDBEdit
                        Left = 0
                        Top = 20
                        Width = 100
                        Height = 32
                        Hint = '[[mask:cep]]'
                        DataField = 'CEPCOBRANCA'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Color = clBlack
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        OnExit = UniDBEdit6Exit
                      end
                    end
                    object rcBlock575: TUniContainerPanel
                      Tag = 1
                      Left = 126
                      Top = 37
                      Width = 248
                      Height = 60
                      Hint = '[['#13#10'cols:xs-12 sm-12 md-5|'#13#10']]'
                      ParentColor = False
                      TabOrder = 2
                      DesignSize = (
                        248
                        60)
                      object UniDBEdit7: TUniDBEdit
                        Left = 3
                        Top = 21
                        Width = 242
                        Height = 32
                        Hint = ''
                        DataField = 'ENDERECOCOBRANCA'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniLabel31: TUniLabel
                        Left = 8
                        Top = 2
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
                    object rcBlock563: TUniContainerPanel
                      Left = -1
                      Top = 0
                      Width = 884
                      Height = 36
                      Hint = '[['#13#10'cols:12 |'#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                      ParentColor = False
                      Color = clSilver
                      TabOrder = 3
                      DesignSize = (
                        884
                        36)
                      object UniLabel38: TUniLabel
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
                    object rcBlock580: TUniContainerPanel
                      Tag = 1
                      Left = 394
                      Top = 37
                      Width = 133
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 4
                      DesignSize = (
                        133
                        60)
                      object UniDBEdit9: TUniDBEdit
                        Left = 2
                        Top = 21
                        Width = 127
                        Height = 32
                        Hint = ''
                        DataField = 'NUMEROCOBRANCA'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniLabel41: TUniLabel
                        Left = 8
                        Top = 4
                        Width = 43
                        Height = 15
                        Hint = ''
                        Caption = 'N'#250'mero'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock585: TUniContainerPanel
                      Tag = 1
                      Left = 558
                      Top = 43
                      Width = 259
                      Height = 54
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 5
                      DesignSize = (
                        259
                        54)
                      object UniDBEdit10: TUniDBEdit
                        Left = 2
                        Top = 15
                        Width = 256
                        Height = 32
                        Hint = ''
                        DataField = 'BAIRROCOBRANCA'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniLabel42: TUniLabel
                        Left = 1
                        Top = 0
                        Width = 35
                        Height = 15
                        Hint = ''
                        Caption = 'Bairro'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock598: TUniContainerPanel
                      Tag = 1
                      Left = 484
                      Top = 96
                      Width = 150
                      Height = 58
                      Hint = '[[cols:xs-12 sm-12 md-3]]'
                      ParentColor = False
                      TabOrder = 6
                      DesignSize = (
                        150
                        58)
                      object UniLabel43: TUniLabel
                        Left = 12
                        Top = 0
                        Width = 110
                        Height = 15
                        Hint = ''
                        Caption = 'Local de Exporta'#231#227'o'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBEdit25: TUniDBEdit
                        Left = 6
                        Top = 21
                        Width = 144
                        Height = 32
                        Hint = ''
                        DataField = 'LOCALEXPORTACAO'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                      end
                    end
                    object rcBlock590: TUniContainerPanel
                      Tag = 1
                      Left = 20
                      Top = 95
                      Width = 100
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
                      ParentColor = False
                      TabOrder = 7
                      DesignSize = (
                        100
                        60)
                      object UniLabel45: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 14
                        Height = 15
                        Hint = ''
                        Caption = 'UF'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edLkpUFS__COBRANCA: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 100
                        Height = 32
                        Hint = '[[DESCRICAO CODIUFCOBRANCA !]]'
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        Color = clInfoBk
                        ReadOnly = True
                        InputType = 'text'
                      end
                    end
                    object rcBlock595: TUniContainerPanel
                      Tag = 1
                      Left = 136
                      Top = 96
                      Width = 326
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-5 lg-5 xl-5]]'
                      ParentColor = False
                      TabOrder = 8
                      DesignSize = (
                        326
                        60)
                      object UniLabel46: TUniLabel
                        Left = 0
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
                      object edLkpCIDADES__COBRANCA: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 325
                        Height = 32
                        Hint = 
                          '[['#13#10'DESCRICAO CODICIDADECOBRANCA @60 ! +modal searchall |'#13#10'lkpfi' +
                          'lter:quoted(uf=edLkpUFS<text>) | /* uf='#39'CE'#39' */'#13#10'lkpfilter-empty:' +
                          'Selecione uma UF<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-sear' +
                          'chfields:codiibge |'#13#10'lkpfilter-gridattr: |'#13#10'valid:blank |'#13#10'valid' +
                          '-required:top-in |'#13#10#13#10']]'
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        Color = clInfoBk
                        ReadOnly = True
                        InputType = 'text'
                      end
                    end
                    object rcBlock600: TUniContainerPanel
                      Tag = 1
                      Left = 654
                      Top = 96
                      Width = 150
                      Height = 58
                      Hint = '[[cols:xs-12 sm-12 md-2]]'
                      ParentColor = False
                      TabOrder = 9
                      DesignSize = (
                        150
                        58)
                      object UniLabel47: TUniLabel
                        Left = 8
                        Top = 0
                        Width = 14
                        Height = 15
                        Hint = ''
                        Caption = 'UF'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edLkpUFS__EXPORTACAO: TUniDBEdit
                        Left = 3
                        Top = 20
                        Width = 100
                        Height = 32
                        Hint = '[[DESCRICAO CODIUFEXPORTACAO !]]'
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        Color = clInfoBk
                        ReadOnly = True
                        InputType = 'text'
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
        Height = 505
        ExplicitHeight = 505
        inherited UniScrollBox1: TUniScrollBox
          Top = 3
          Height = 505
          ExplicitTop = 3
          ExplicitHeight = 505
          DesignSize = (
            306
            503)
          ScrollHeight = 1897
          ScrollY = 960
          inherited paSearchFilterDate: TUniContainerPanel
            Top = 599
            ExplicitTop = 599
          end
          inherited paSearchFilter1: TUniContainerPanel
            Top = 118
            ExplicitTop = 118
            inherited paSearchField1: TUniContainerPanel
              inherited cbxSearchCRUDField1: TUniComboBox
                Left = 5
                ExplicitLeft = 5
              end
            end
          end
          inherited paSearchContent1: TUniContainerPanel
            Top = 238
            ExplicitTop = 238
          end
          inherited paSearchFilter2: TUniContainerPanel
            Top = 358
            ExplicitTop = 358
          end
          inherited paSearchContent2: TUniContainerPanel
            Top = 479
            ExplicitTop = 479
          end
          inherited paSearchFilterAndOr: TUniContainerPanel
            Top = 298
            ExplicitTop = 298
          end
          inherited labTitleSearch: TUniLabel
            Top = -950
            ExplicitTop = -950
          end
          inherited paSearchFilterPeriod: TUniContainerPanel
            Top = 539
            ExplicitTop = 539
          end
          inherited paSearchFilterPeriodSelect: TUniContainerPanel
            Top = 397
            ExplicitTop = 397
          end
          inherited paSearchBtn: TUniContainerPanel
            Top = 901
            Anchors = [akLeft, akTop, akRight]
            ExplicitTop = 901
            inherited btnSearchCRUD: TUniBitBtn
              ScreenMask.Target = Owner
            end
          end
        end
      end
      inherited paSearchFiltersCustom: TUniPanel
        inherited sboxSearchFiltersCustom: TUniScrollBox
          ScrollHeight = 283
          object UniContainerPanel2: TUniContainerPanel
            AlignWithMargins = True
            Left = 10
            Top = 103
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
            AlignmentControl = uniAlignmentClient
            ParentAlignmentControl = False
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
                AlignWithMargins = True
                Left = 0
                Top = 1
                Width = 65
                Height = 15
                Hint = ''
                Margins.Top = 1
                Margins.Bottom = 2
                Caption = 'Data Inicial'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object edSearchDTCADASTRO: TUniDateTimePicker
                AlignWithMargins = True
                Left = 0
                Top = 21
                Width = 135
                Height = 29
                Hint = ''
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 10
                DateTime = 43597.000000000000000000
                DateFormat = 'dd/MM/yyyy'
                TimeFormat = 'HH:mm:ss'
                Align = alBottom
                TabOrder = 2
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
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
                AlignWithMargins = True
                Left = 3
                Top = 1
                Width = 57
                Height = 15
                Hint = ''
                Margins.Top = 1
                Margins.Bottom = 2
                Caption = 'Data Final'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object edSearchDTCADASTROFIM: TUniDateTimePicker
                AlignWithMargins = True
                Left = 0
                Top = 21
                Width = 135
                Height = 29
                Hint = ''
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 10
                DateTime = 43597.000000000000000000
                DateFormat = 'dd/MM/yyyy'
                TimeFormat = 'HH:mm:ss'
                Align = alBottom
                TabOrder = 2
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
              end
            end
          end
          object UniContainerPanel5: TUniContainerPanel
            AlignWithMargins = True
            Left = 10
            Top = 163
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
              AlignWithMargins = True
              Left = 3
              Top = 1
              Width = 31
              Height = 15
              Hint = ''
              Margins.Top = 1
              Margins.Bottom = 2
              Caption = 'Nome'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object edSearchNOME: TUniEdit
              AlignWithMargins = True
              Left = 0
              Top = 21
              Width = 287
              Height = 29
              Hint = ''
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 10
              CharCase = ecUpperCase
              Text = ''
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              Align = alBottom
              TabOrder = 2
              ClearButton = True
            end
          end
          object UniContainerPanel1: TUniContainerPanel
            AlignWithMargins = True
            Left = 10
            Top = 223
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
            object UniContainerPanel6: TUniContainerPanel
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
              object UniLabel56: TUniLabel
                AlignWithMargins = True
                Left = 0
                Top = 1
                Width = 54
                Height = 15
                Hint = ''
                Margins.Top = 1
                Margins.Bottom = 2
                Caption = 'Cnpj / Cpf'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object edSearchCNPJCPF: TUniEdit
                AlignWithMargins = True
                Left = 0
                Top = 21
                Width = 135
                Height = 29
                Hint = ''
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 10
                CharCase = ecUpperCase
                Text = ''
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                Align = alBottom
                TabOrder = 2
              end
            end
            object UniContainerPanel7: TUniContainerPanel
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
              object UniLabel52: TUniLabel
                AlignWithMargins = True
                Left = 0
                Top = 1
                Width = 80
                Height = 15
                Hint = ''
                Margins.Top = 1
                Margins.Bottom = 2
                Caption = 'Valor Contrato'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object edSearchVALOR_CONTRATO: TUniFormattedNumberEdit
                AlignWithMargins = True
                Left = 0
                Top = 21
                Width = 135
                Height = 29
                Hint = ''
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 10
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                Align = alBottom
                TabOrder = 2
                DecimalSeparator = ','
                ThousandSeparator = '.'
              end
            end
          end
          object UniContainerPanel9: TUniContainerPanel
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
            TabOrder = 4
            object UniContainerPanel8: TUniContainerPanel
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
              object UniLabel57: TUniLabel
                AlignWithMargins = True
                Left = 0
                Top = 1
                Width = 11
                Height = 15
                Hint = ''
                Margins.Top = 1
                Margins.Bottom = 2
                Caption = 'Id'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object edSearchCODIGO: TUniEdit
                AlignWithMargins = True
                Left = 0
                Top = 21
                Width = 135
                Height = 29
                Hint = ''
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 10
                CharCase = ecUpperCase
                Text = ''
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                Align = alBottom
                TabOrder = 2
              end
            end
            object UniContainerPanel10: TUniContainerPanel
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
              object UniLabel58: TUniLabel
                AlignWithMargins = True
                Left = 0
                Top = 1
                Width = 34
                Height = 15
                Hint = ''
                Margins.Top = 1
                Margins.Bottom = 2
                Caption = 'Status'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object edSearchSTATUS: TUniComboBox
                AlignWithMargins = True
                Left = 0
                Top = 21
                Width = 135
                Height = 29
                Hint = ''
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 10
                Text = ''
                Items.Strings = (
                  'Todos'
                  'Ativos'
                  'Inativos')
                Align = alBottom
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                TabOrder = 2
                IconItems = <>
              end
            end
          end
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
    Top = 131
  end
  inherited dsSearchMaster: TDataSource
    Left = 1234
    Top = 109
  end
  inherited sqlSearchMaster: TFDQuery
    SQL.Strings = (
      'select * from pessoas')
    Left = 1305
    Top = 99
  end
  inherited sqlMaster: TFDQuery
    SQL.Strings = (
      'select * from pessoas')
    Left = 1123
    Top = 121
  end
  inherited popMenuOptions: TUniPopupMenu
    Left = 418
    Top = 16
    object Revisoes: TUniMenuItem
      Caption = 'Revis'#245'es'
      OnClick = RevisoesClick
    end
    object Veculos1: TUniMenuItem
      Caption = 'Ve'#237'culos'
      OnClick = Veculos1Click
    end
  end
  inherited FDSchemaAdapter1: TFDSchemaAdapter
    Left = 1254
    Top = 22
  end
  inherited FDQryCad: TFDQuery
    Left = 1145
    Top = 22
  end
  inherited dscrud: TDataSource
    Left = 1091
    Top = 22
  end
  inherited FDQryFiltro: TFDQuery
    Left = 1041
    Top = 30
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
    Left = 669
    Top = 36
  end
  inherited dsdetalhes: TDataSource
    Left = 717
    Top = 28
  end
end
