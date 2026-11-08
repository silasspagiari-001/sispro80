inherited frmCadCLIENTES: TfrmCadCLIENTES
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
          inherited paBaseRegSearch: TUniContainerPanel
            inherited paGridOffset: TUniContainerPanel
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
            ScrollWidth = 1361
            object pgComplementData: TUniPageControl
              Left = 0
              Top = 0
              Width = 1361
              Height = 965
              Hint = ''
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              ActivePage = tabGeral
              Align = alClient
              TabOrder = 1
              OnChange = pgComplementDataChange
              object tabGeral: TUniTabSheet
                Hint = ''
                Caption = 'Geral'
                object sboxGridBlockTab1: TUniScrollBox
                  Left = 0
                  Top = 0
                  Width = 1353
                  Height = 935
                  Hint = ''
                  Align = alClient
                  TabOrder = 0
                  ScrollHeight = 1068
                  ScrollWidth = 912
                  ScrollY = 135
                  object rcBlock515: TUniContainerPanel
                    Tag = 4
                    Left = 81
                    Top = 911
                    Width = 729
                    Height = 22
                    Hint = '[[cols:12 | round:all]]'
                    ParentColor = False
                    TabOrder = 0
                  end
                  object rcBlock2: TUniContainerPanel
                    Tag = 1
                    AlignWithMargins = True
                    Left = 28
                    Top = -128
                    Width = 884
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
                    TabOrder = 1
                    object rcBlock10: TUniContainerPanel
                      Tag = 1
                      Left = 11
                      Top = 53
                      Width = 100
                      Height = 60
                      Hint = '[['#13#10'cols:xs-6 sm-6 md-2 lg-2 xl-2 |'#13#10']]'#13#10#13#10#13#10
                      ParentColor = False
                      TabOrder = 1
                      DesignSize = (
                        100
                        60)
                      object edCodigo: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 100
                        Height = 30
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
                    object rcBlock20: TUniContainerPanel
                      Tag = 1
                      Left = 148
                      Top = 52
                      Width = 100
                      Height = 60
                      Hint = 
                        '[['#13#10'cols:xs-6 sm-6 md-2 |'#13#10'/*state-color:i-clinfobk e-clskyblue ' +
                        'b-clbtnface |*/'#13#10']]'#13#10
                      ParentColor = False
                      TabOrder = 2
                      DesignSize = (
                        100
                        60)
                      object labDtCad: TUniLabel
                        Left = 2
                        Top = 0
                        Width = 79
                        Height = 15
                        Hint = 
                          '[['#13#10'state-font-color:i-clred e-clsilver b-clblack |'#13#10'state-capti' +
                          'on:i-Data Cadastro e-Data Edi'#231#227'o b-Data |'#13#10']]'#13#10#13#10
                        Caption = 'Data Cadastro'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edDtCad: TUniDBDateTimePicker
                        Left = 0
                        Top = 21
                        Width = 100
                        Height = 30
                        Hint = '[['#13#10'mask:date |'#13#10'valid:date notblank|'#13#10']]'#13#10#13#10#13#10
                        DataField = 'dtcadastro'
                        DataSource = dsMaster
                        DateTime = 44279.000000000000000000
                        DateFormat = 'dd/MM/yyyy'
                        TimeFormat = 'HH:mm:ss'
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                      end
                    end
                    object rcBlock30: TUniContainerPanel
                      Tag = 1
                      Left = 288
                      Top = 53
                      Width = 100
                      Height = 60
                      Hint = 
                        '[['#13#10'cols:xs-6 sm-6 md-2 lg-2 xl-2 |'#13#10'state-cls:i-rc-obj-float ]]' +
                        #13#10
                      ParentColor = False
                      TabOrder = 3
                      DesignSize = (
                        100
                        60)
                      object UniLabel5: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 93
                        Height = 15
                        Hint = ''
                        Caption = 'Data Anivers'#225'rio'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object dtAni: TUniDBDateTimePicker
                        Left = 0
                        Top = 21
                        Width = 100
                        Height = 30
                        Hint = '[['#13#10'mask:date |'#13#10'state-enable:i-true e-true b-true |'#13#10']]'
                        DataField = 'DTANIVERSARIO'
                        DataSource = dsMaster
                        DateTime = 44279.000000000000000000
                        DateFormat = 'dd/MM/yyyy'
                        TimeFormat = 'HH:mm:ss'
                        Anchors = [akLeft, akTop, akRight]
                        TabOrder = 2
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                      end
                    end
                    object rcBlock50: TUniContainerPanel
                      Tag = 1
                      Left = 568
                      Top = 52
                      Width = 100
                      Height = 60
                      Hint = '[[cols:xs-6 sm-6 md-2 lg-2 xl-2]]'
                      ParentColor = False
                      TabOrder = 4
                      DesignSize = (
                        100
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
                        Left = 0
                        Top = 21
                        Width = 100
                        Height = 30
                        Hint = '[['#13#10'valid:cpfcnpj &edTipoPessoa="F J" |'#13#10'mask:cnpj'#13#10']]'
                        DataField = 'CNPJ_CPF'
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
                    object rcBlock40: TUniContainerPanel
                      Tag = 1
                      Left = 428
                      Top = 52
                      Width = 100
                      Height = 60
                      Hint = '[[cols:xs-6 sm-6 md-2 lg-2 xl-2]]'
                      ParentColor = False
                      TabOrder = 5
                      DesignSize = (
                        100
                        60)
                      object UniLabel10: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 43
                        Height = 15
                        Hint = ''
                        Caption = 'PF ou PJ'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edTipoPessoa: TUniDBComboBox
                        Left = 0
                        Top = 21
                        Width = 100
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
                    object rcBlock60: TUniContainerPanel
                      Tag = 1
                      Left = 708
                      Top = 52
                      Width = 100
                      Height = 60
                      Hint = '[[cols:xs-6 sm-6 md-2 lg-2 xl-2]]'
                      ParentColor = False
                      TabOrder = 6
                      DesignSize = (
                        100
                        60)
                      object UniLabel11: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 42
                        Height = 15
                        Hint = ''
                        Caption = 'RG / I.E.'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edIE_RG: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 100
                        Height = 30
                        Hint = ''
                        DataField = 'CGF_RG'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock80: TUniContainerPanel
                      Tag = 1
                      Left = 36
                      Top = 124
                      Width = 376
                      Height = 60
                      Hint = '[['#13#10'cols:xs-12 sm-12 md-6|'#13#10']]'
                      ParentColor = False
                      TabOrder = 7
                      DesignSize = (
                        376
                        60)
                      object labName: TUniLabel
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
                        Height = 30
                        Hint = '[['#13#10'valid:blank=Nome Cliente|'#13#10'valid-required:labName'#13#10']]'
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
                      Left = 455
                      Top = 121
                      Width = 376
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-6]]'
                      ParentColor = False
                      TabOrder = 8
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
                        Height = 30
                        Hint = ''
                        DataField = 'RAZSOC'
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
                      Left = 0
                      Top = 0
                      Width = 884
                      Height = 30
                      Hint = 
                        '[['#13#10'cols:12 |'#13#10'noborder-top | '#13#10'noborder-left | '#13#10'noborder-right' +
                        ' | '#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                      ParentColor = False
                      Color = clSilver
                      TabOrder = 9
                      DesignSize = (
                        884
                        30)
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
                        Width = 87
                        Height = 19
                        Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
                        Margins.Left = 6
                        Margins.Top = 0
                        Margins.Right = 0
                        Margins.Bottom = 0
                        Caption = 'Dados Gerais'
                        ParentFont = False
                        Font.Color = clGray
                        Font.Height = -16
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                  end
                  object rcBlock165: TUniContainerPanel
                    Tag = 1
                    AlignWithMargins = True
                    Left = 19
                    Top = 270
                    Width = 884
                    Height = 192
                    Hint = 
                      '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'hr-childs:xs-exp sm-exp md-exp | ' +
                      #13#10'round:no | '#13#10'cls:card-info-box-white |'#13#10']]'#13#10#13#10
                    Margins.Left = 15
                    Margins.Top = 15
                    Margins.Right = 15
                    Margins.Bottom = 10
                    ParentColor = False
                    TabOrder = 3
                    object rcBlock166: TUniContainerPanel
                      Left = -1
                      Top = -2
                      Width = 884
                      Height = 30
                      Hint = 
                        '[['#13#10'cols:12 |'#13#10'noborder-top | '#13#10'noborder-left | '#13#10'noborder-right' +
                        ' | '#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                      ParentColor = False
                      Color = clSilver
                      TabOrder = 1
                      DesignSize = (
                        884
                        30)
                      object UniLabel21: TUniLabel
                        AlignWithMargins = True
                        Left = 6
                        Top = 6
                        Width = 114
                        Height = 19
                        Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
                        Margins.Left = 6
                        Margins.Top = 0
                        Margins.Right = 0
                        Margins.Bottom = 0
                        Caption = 'Endere'#231'o Entrega'
                        ParentFont = False
                        Font.Color = clGray
                        Font.Height = -16
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object labCollapseDeliveryAddr: TUniLabel
                        Left = 850
                        Top = 8
                        Width = 10
                        Height = 26
                        Hint = '[['#13#10'collapse:rcBlock165 off-42 '#13#10']]'#13#10
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
                    object rcBlock180: TUniContainerPanel
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
                      object UniLabel27: TUniLabel
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
                      object UniDBEdit7: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 325
                        Height = 30
                        Hint = ''
                        DataField = 'ENDERECOENTREGA'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock190: TUniContainerPanel
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
                      object UniLabel37: TUniLabel
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
                      object UniDBEdit8: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 100
                        Height = 30
                        Hint = ''
                        DataField = 'NUMEROENTREGA'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock200: TUniContainerPanel
                      Tag = 1
                      Left = 12
                      Top = 125
                      Width = 100
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
                      ParentColor = False
                      TabOrder = 4
                      DesignSize = (
                        100
                        60)
                      object UniLabel42: TUniLabel
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
                        Height = 30
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
                    object rcBlock210: TUniContainerPanel
                      Tag = 1
                      Left = 133
                      Top = 124
                      Width = 326
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-4 lg-4 xl-4]]'
                      ParentColor = False
                      TabOrder = 5
                      DesignSize = (
                        326
                        60)
                      object UniLabel44: TUniLabel
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
                      object edLkpFERIADOS: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 325
                        Height = 30
                        Hint = 
                          '[['#13#10'DESCRICAO CODIUF ! |'#13#10'lkpfilter-order: |'#13#10'lkpfilter-searchfi' +
                          'elds:data |'#13#10'lkpfilter-gridattr: |'#13#10']]'
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        Color = clInfoBk
                        ReadOnly = True
                        InputType = 'text'
                        OnEnter = edLkpFERIADOSEnter
                      end
                    end
                    object rcBlock220: TUniContainerPanel
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
                      object UniLabel45: TUniLabel
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
                      object UniDBEdit9: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 229
                        Height = 30
                        Hint = ''
                        DataField = 'BAIRROENTREGA'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock170: TUniContainerPanel
                      Tag = 1
                      Left = 12
                      Top = 61
                      Width = 100
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
                      ParentColor = False
                      TabOrder = 7
                      DesignSize = (
                        100
                        60)
                      object UniLabel46: TUniLabel
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
                      object edCepEntrega: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 100
                        Height = 30
                        Hint = '[[mask:cep]]'
                        DataField = 'CEPENTREGA'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        OnExit = edCepEntregaExit
                      end
                    end
                  end
                  object rcBlock285: TUniContainerPanel
                    Tag = 1
                    AlignWithMargins = True
                    Left = 12
                    Top = 681
                    Width = 884
                    Height = 195
                    Hint = 
                      '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'hr-childs:xs-exp sm-exp md-exp | ' +
                      #13#10'round:no | '#13#10'cls:card-info-box-white |'#13#10']]'#13#10#13#10
                    Margins.Left = 15
                    Margins.Top = 15
                    Margins.Right = 15
                    Margins.Bottom = 10
                    ParentColor = False
                    TabOrder = 4
                    object rcBlock286: TUniContainerPanel
                      Left = 0
                      Top = 0
                      Width = 884
                      Height = 30
                      Hint = 
                        '[['#13#10'cols:12 |'#13#10'noborder-top | '#13#10'noborder-left | '#13#10'noborder-right' +
                        ' | '#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                      ParentColor = False
                      Color = clSilver
                      TabOrder = 1
                      DesignSize = (
                        884
                        30)
                      object UniLabel17: TUniLabel
                        AlignWithMargins = True
                        Left = 6
                        Top = 6
                        Width = 129
                        Height = 19
                        Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
                        Margins.Left = 6
                        Margins.Top = 0
                        Margins.Right = 0
                        Margins.Bottom = 0
                        Caption = 'Dados para Contato'
                        ParentFont = False
                        Font.Color = clGray
                        Font.Height = -16
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object labCollapseContact: TUniLabel
                        Left = 850
                        Top = 8
                        Width = 10
                        Height = 26
                        Hint = '[['#13#10'collapse:rcBlock285 off-42 '#13#10']]'#13#10
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
                    object rcBlock290: TUniContainerPanel
                      Tag = 1
                      Left = 16
                      Top = 60
                      Width = 209
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-4]]'
                      ParentColor = False
                      TabOrder = 2
                      DesignSize = (
                        209
                        60)
                      object UniLabel35: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 20
                        Height = 15
                        Hint = ''
                        Caption = 'Site'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBEdit3: TUniDBEdit
                        Left = 1
                        Top = 21
                        Width = 209
                        Height = 30
                        Hint = '[['#13#10'link: |'#13#10'valid:blank=Site'#13#10']]'#13#10
                        DataField = 'SITE'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock300: TUniContainerPanel
                      Tag = 1
                      Left = 272
                      Top = 59
                      Width = 285
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-4]]'
                      ParentColor = False
                      TabOrder = 3
                      DesignSize = (
                        285
                        60)
                      object UniLabel47: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 90
                        Height = 15
                        Hint = ''
                        Caption = 'Email Comercial'
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBEdit13: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 285
                        Height = 30
                        Hint = '[['#13#10'valid:email notblank |'#13#10'keyboard:off'#13#10']]'
                        DataField = 'EMAIL'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock310: TUniContainerPanel
                      Tag = 1
                      Left = 16
                      Top = 125
                      Width = 200
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-4]]'
                      ParentColor = False
                      TabOrder = 4
                      DesignSize = (
                        200
                        60)
                      object UniLabel19: TUniLabel
                        Left = 0
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
                      object edPhone: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 85
                        Height = 38
                        Hint = '[['#13#10'mask:phoneddd'#13#10']]'#13#10
                        DataField = 'FONE1'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                      object UniDBEdit14: TUniDBEdit
                        Left = 94
                        Top = 21
                        Width = 105
                        Height = 38
                        Hint = ''
                        DataField = 'DESCRIFONE1'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 3
                      end
                      object UniLabel40: TUniLabel
                        Left = 94
                        Top = 0
                        Width = 55
                        Height = 15
                        Hint = ''
                        Caption = 'Descri'#231#227'o'
                        Anchors = [akTop, akRight]
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 4
                      end
                    end
                    object rcBlock320: TUniContainerPanel
                      Tag = 1
                      Left = 225
                      Top = 125
                      Width = 200
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-4]]'
                      ParentColor = False
                      TabOrder = 5
                      DesignSize = (
                        200
                        60)
                      object UniLabel20: TUniLabel
                        Left = 0
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
                      object UniDBEdit15: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 85
                        Height = 38
                        Hint = '[['#13#10'mask:phoneddd'#13#10']]'
                        DataField = 'FONE2'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                      object UniDBEdit16: TUniDBEdit
                        Left = 94
                        Top = 21
                        Width = 105
                        Height = 38
                        Hint = ''
                        DataField = 'DESCRIFONE2'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 3
                      end
                      object UniLabel31: TUniLabel
                        Left = 94
                        Top = 0
                        Width = 55
                        Height = 15
                        Hint = ''
                        Caption = 'Descri'#231#227'o'
                        Anchors = [akTop, akRight]
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 4
                      end
                    end
                    object rcBLock330: TUniContainerPanel
                      Tag = 1
                      Left = 431
                      Top = 125
                      Width = 200
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-4]]'
                      ParentColor = False
                      TabOrder = 6
                      DesignSize = (
                        200
                        60)
                      object UniLabel49: TUniLabel
                        Left = 0
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
                      object UniDBEdit17: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 85
                        Height = 38
                        Hint = '[[mask:phoneddd]]'
                        DataField = 'FONE3'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                      object UniDBEdit18: TUniDBEdit
                        Left = 94
                        Top = 21
                        Width = 105
                        Height = 38
                        Hint = ''
                        DataField = 'DESCRIFONE3'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 3
                      end
                      object UniLabel50: TUniLabel
                        Left = 94
                        Top = 0
                        Width = 55
                        Height = 15
                        Hint = ''
                        Caption = 'Descri'#231#227'o'
                        Anchors = [akTop, akRight]
                        ParentFont = False
                        Font.Height = -13
                        Font.Name = 'Calibri'
                        TabOrder = 4
                      end
                    end
                    object rcBlock305: TUniContainerPanel
                      Tag = 1
                      Left = 589
                      Top = 59
                      Width = 200
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-4]]'
                      ParentColor = False
                      TabOrder = 7
                      DesignSize = (
                        200
                        60)
                      object UniLabel51: TUniLabel
                        Left = 0
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
                      object btnSendZap: TUniSpeedButton
                        Left = 106
                        Top = 21
                        Width = 92
                        Height = 38
                        Hint = '[['#13#10'cls:ButtonThemeCrud | '#13#10'ico:fas-paper-plane |'#13#10'append'#13#10']]'#13#10
                        Caption = 'Send'
                        Anchors = [akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        ParentColor = False
                        TabOrder = 2
                        OnClick = btnSendZapClick
                      end
                      object edPhoneZap: TUniDBEdit
                        Left = 2
                        Top = 21
                        Width = 103
                        Height = 30
                        Hint = ''
                        DataField = 'FONE4'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 3
                      end
                    end
                  end
                  object rcBlock225: TUniContainerPanel
                    Tag = 1
                    AlignWithMargins = True
                    Left = 12
                    Top = 473
                    Width = 884
                    Height = 192
                    Hint = 
                      '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'hr-childs:xs-exp sm-exp md-exp | ' +
                      #13#10'round:no | '#13#10'cls:card-info-box-white |'#13#10']]'#13#10#13#10
                    Margins.Left = 15
                    Margins.Top = 15
                    Margins.Right = 15
                    Margins.Bottom = 10
                    ParentColor = False
                    TabOrder = 5
                    object rcBlock226: TUniContainerPanel
                      Left = 0
                      Top = -1
                      Width = 884
                      Height = 30
                      Hint = 
                        '[['#13#10'cols:12 |'#13#10'noborder-top | '#13#10'noborder-left |'#13#10'noborder-right ' +
                        '|  '#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                      ParentColor = False
                      Color = clSilver
                      TabOrder = 1
                      DesignSize = (
                        884
                        30)
                      object labCollapseInvoiceAddr: TUniLabel
                        Left = 850
                        Top = 8
                        Width = 10
                        Height = 26
                        Hint = '[['#13#10'collapse:rcBlock225 off-42 '#13#10']]'#13#10
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
                      object UniLabel48: TUniLabel
                        AlignWithMargins = True
                        Left = 8
                        Top = 8
                        Width = 145
                        Height = 19
                        Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
                        Margins.Left = 6
                        Margins.Top = 0
                        Margins.Right = 0
                        Margins.Bottom = 0
                        Caption = 'Endere'#231'o de Cobran'#231'a'
                        ParentFont = False
                        Font.Color = clGray
                        Font.Height = -16
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock240: TUniContainerPanel
                      Tag = 1
                      Left = 140
                      Top = 63
                      Width = 326
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-8]]'
                      ParentColor = False
                      TabOrder = 2
                      DesignSize = (
                        326
                        60)
                      object UniLabel23: TUniLabel
                        Left = 0
                        Top = -2
                        Width = 44
                        Height = 13
                        Hint = ''
                        Caption = 'Endere'#231'o'
                        ParentFont = False
                        Font.Height = -12
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBEdit10: TUniDBEdit
                        Left = 1
                        Top = 21
                        Width = 325
                        Height = 30
                        Hint = ''
                        DataField = 'ENDERECOCOBRANCA'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock250: TUniContainerPanel
                      Tag = 1
                      Left = 491
                      Top = 63
                      Width = 100
                      Height = 60
                      Hint = '[[cols:xs-6 sm-6 md-2 lg-2 xl-2]]'
                      ParentColor = False
                      TabOrder = 3
                      DesignSize = (
                        100
                        60)
                      object UniLabel24: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 38
                        Height = 13
                        Hint = ''
                        Caption = 'N'#250'mero'
                        ParentFont = False
                        Font.Height = -12
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBEdit11: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 100
                        Height = 30
                        Hint = ''
                        DataField = 'NUMEROCOBRANCA'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock260: TUniContainerPanel
                      Tag = 1
                      Left = 19
                      Top = 127
                      Width = 100
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
                      ParentColor = False
                      TabOrder = 4
                      DesignSize = (
                        100
                        60)
                      object UniLabel28: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 12
                        Height = 13
                        Hint = ''
                        Caption = 'UF'
                        ParentFont = False
                        Font.Height = -12
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edLkpUFS__COBRANCA: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 100
                        Height = 30
                        Hint = '[[DESCRICAO CODIUFCOBRANCA ! ]]'
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
                    object rcBlock270: TUniContainerPanel
                      Tag = 1
                      Left = 140
                      Top = 127
                      Width = 326
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-4 lg-4 xl-4]]'
                      ParentColor = False
                      TabOrder = 5
                      DesignSize = (
                        326
                        60)
                      object UniLabel29: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 33
                        Height = 13
                        Hint = ''
                        Caption = 'Cidade'
                        ParentFont = False
                        Font.Height = -12
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edLkpCIDADES__COBRANCA: TUniDBEdit
                        Left = 1
                        Top = 21
                        Width = 325
                        Height = 30
                        Hint = '[[DESCRICAO CODICIDADECOBRANCA @60 ! +]]'
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        Color = clInfoBk
                        ReadOnly = True
                        InputType = 'text'
                        OnClick = edLkpCIDADES__COBRANCAClick
                      end
                    end
                    object rcBlock280: TUniContainerPanel
                      Tag = 1
                      Left = 620
                      Top = 125
                      Width = 229
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-4 lg-4 xl-4]]'
                      ParentColor = False
                      TabOrder = 6
                      DesignSize = (
                        229
                        60)
                      object UniLabel30: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 29
                        Height = 13
                        Hint = ''
                        Caption = 'Bairro'
                        ParentFont = False
                        Font.Height = -12
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object UniDBEdit12: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 229
                        Height = 30
                        Hint = ''
                        DataField = 'BAIRROCOBRANCA'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                      end
                    end
                    object rcBlock230: TUniContainerPanel
                      Tag = 1
                      Left = 19
                      Top = 63
                      Width = 100
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
                      ParentColor = False
                      TabOrder = 7
                      DesignSize = (
                        100
                        60)
                      object UniLabel22: TUniLabel
                        Left = 0
                        Top = 0
                        Width = 18
                        Height = 13
                        Hint = ''
                        Caption = 'Cep'
                        ParentFont = False
                        Font.Height = -12
                        Font.Name = 'Calibri'
                        TabOrder = 1
                      end
                      object edCepCobranca: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 100
                        Height = 30
                        Hint = '[[mask:cep]]'
                        DataField = 'CEPCOBRANCA'
                        DataSource = dsMaster
                        CharCase = ecUpperCase
                        Anchors = [akLeft, akTop, akRight]
                        ParentFont = False
                        Font.Height = -15
                        Font.Name = 'Calibri'
                        TabOrder = 2
                        OnExit = edCepCobrancaExit
                      end
                    end
                  end
                  object rcBlock94: TUniContainerPanel
                    Tag = 1
                    AlignWithMargins = True
                    Left = 14
                    Top = 63
                    Width = 884
                    Height = 192
                    Hint = 
                      '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'hr-childs:xs-exp sm-exp md-exp | ' +
                      #13#10'round:no | '#13#10'cls:card-info-box-white |'#13#10']]'#13#10#13#10
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
                      Height = 30
                      Hint = 
                        '[['#13#10'cols:12 |'#13#10'noborder-top | '#13#10'noborder-left | '#13#10'noborder-right' +
                        ' | '#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                      ParentColor = False
                      Color = clSilver
                      TabOrder = 8
                      DesignSize = (
                        884
                        30)
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
                        Hint = '[['#13#10'collapse:rcBlock94 off-42 '#13#10']]'#13#10
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
                        Height = 30
                        Hint = ''
                        DataField = 'ENDERECO'
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
                        Height = 30
                        Hint = ''
                        DataField = 'NUMERO'
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
                      Left = 19
                      Top = 125
                      Width = 100
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-2 lg-2 xl-2]]'
                      ParentColor = False
                      TabOrder = 4
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
                        Height = 30
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
                        OnClick = edLkpUFSClick
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
                      TabOrder = 5
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
                      object edLkpCIDADES: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 325
                        Height = 30
                        Hint = 
                          '[['#13#10'DESCRICAO CODICIDADE @80 ! +modal searchall |'#13#10'lkpfilter:quo' +
                          'ted(uf=edLkpUFS<text>) | /* uf='#39'CE'#39' */'#13#10'lkpfilter-empty:Selecion' +
                          'e uma UF<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-searchfields' +
                          ':codiibge |'#13#10'lkpfilter-gridattr: |'#13#10'valid:blank |'#13#10'valid-require' +
                          'd:top-in |'#13#10#13#10']]'#13#10
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
                    object rcBlock160: TUniContainerPanel
                      Tag = 1
                      Left = 613
                      Top = 123
                      Width = 229
                      Height = 60
                      Hint = '[[cols:xs-12 sm-12 md-4 lg-4 xl-4]]'
                      ParentColor = False
                      TabOrder = 7
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
                      object edNeighborhood: TUniDBEdit
                        Left = 0
                        Top = 21
                        Width = 229
                        Height = 30
                        Hint = ''
                        DataField = 'BAIRRO'
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
                        Height = 30
                        Hint = '[[mask:cep]]'
                        DataField = 'CEP'
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
                      TabOrder = 6
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
                        Height = 30
                        Hint = '[[ saveto: ]]'
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
              object tabComercial: TUniTabSheet
                Hint = ''
                Caption = 'Comercial'
                object sboxTab4: TUniScrollBox
                  Left = 0
                  Top = 0
                  Width = 1353
                  Height = 935
                  Hint = ''
                  Align = alClient
                  TabOrder = 0
                  ScrollHeight = 373
                  ScrollWidth = 605
                  object rcBlock520: TUniContainerPanel
                    Tag = 1
                    Left = 14
                    Top = 44
                    Width = 127
                    Height = 60
                    Hint = '[['#13#10'cols:xs-12 sm-12 md-4'#13#10']]'
                    ParentColor = False
                    TabOrder = 0
                    DesignSize = (
                      127
                      60)
                    object UniLabel25: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 131
                      Height = 15
                      Hint = ''
                      Caption = 'Respons'#225'vel Financeiro'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object edLkpCLIENTES: TUniDBEdit
                      Left = 2
                      Top = 21
                      Width = 125
                      Height = 38
                      Hint = '[['#13#10'NOME+FONE1 CODICLIPAI @40 #90CGF_RG  |'#13#10']]'#13#10
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 2
                      Color = clInfoBk
                      ReadOnly = True
                      InputType = 'text'
                      OnClick = edLkpCLIENTESClick
                      OnEnter = edLkpCLIENTESEnter
                    end
                  end
                  object rcBlock525: TUniContainerPanel
                    Tag = 1
                    Left = 174
                    Top = 49
                    Width = 120
                    Height = 60
                    Hint = '[['#13#10'cols:xs-12 sm-12 md-4'#13#10']]'
                    ParentColor = False
                    TabOrder = 1
                    DesignSize = (
                      120
                      60)
                    object UniLabel26: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 31
                      Height = 15
                      Hint = ''
                      Caption = 'Email'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object ed_lkp_Email: TUniEdit
                      Left = 0
                      Top = 21
                      Width = 118
                      Height = 38
                      Hint = ''
                      Text = ''
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock530: TUniContainerPanel
                    Tag = 1
                    Left = 344
                    Top = 28
                    Width = 120
                    Height = 60
                    Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
                    ParentColor = False
                    TabOrder = 2
                    DesignSize = (
                      120
                      60)
                    object UniLabel41: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 26
                      Height = 15
                      Hint = ''
                      Caption = 'Fone'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object ed_lkp_fone: TUniEdit
                      Left = 0
                      Top = 21
                      Width = 120
                      Height = 38
                      Hint = ''
                      Text = ''
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock535: TUniContainerPanel
                    Tag = 1
                    Left = 485
                    Top = 28
                    Width = 120
                    Height = 60
                    Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
                    ParentColor = False
                    TabOrder = 3
                    DesignSize = (
                      120
                      60)
                    object UniLabel43: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 59
                      Height = 15
                      Hint = ''
                      Caption = 'Bloqueado'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object ed_lkp_block: TUniEdit
                      Left = 0
                      Top = 21
                      Width = 120
                      Height = 38
                      Hint = ''
                      Text = ''
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                    end
                  end
                  object rcBlock540: TUniContainerPanel
                    Tag = 1
                    Left = 32
                    Top = 256
                    Width = 493
                    Height = 117
                    Hint = 
                      '[['#13#10'cols:xs-12 sm-12 md-6 |'#13#10'hr:80 mobile-v-125 mobile-h-80 |'#13#10']' +
                      ']'#13#10
                    ParentColor = False
                    TabOrder = 4
                    object labAlert: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 493
                      Height = 117
                      Hint = '[[ bsalert:info ]]'
                      Alignment = taCenter
                      TextConversion = txtHTML
                      AutoSize = False
                      Caption = 
                        'Os campos EMAIL, FONE, BLOQUEADO est'#227'o sendo usados para fins di' +
                        't'#225'ticos. Apenas para demonstrar a pesquisa LOOKUP com retorno de' +
                        ' v'#225'rios campos.'
                      Align = alClient
                      ParentFont = False
                      Font.Height = -12
                      Font.Style = [fsBold]
                      TabOrder = 1
                    end
                  end
                end
              end
              object tabLicences: TUniTabSheet
                Hint = ''
                Caption = 'Licen'#231'as'
                object sboxTab5: TUniScrollBox
                  Left = 0
                  Top = 0
                  Width = 1353
                  Height = 935
                  Hint = ''
                  Align = alClient
                  TabOrder = 0
                  ScrollHeight = 265
                  ScrollWidth = 853
                  object rcBlock650: TUniContainerPanel
                    Tag = 1
                    Left = 16
                    Top = 18
                    Width = 120
                    Height = 60
                    Hint = '[[cols:xs-6 sm-6 md-2]]'
                    ParentColor = False
                    TabOrder = 0
                    DesignSize = (
                      120
                      60)
                    object UniLabel1: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 60
                      Height = 15
                      Hint = ''
                      Caption = 'Data In'#237'cio'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBDateTimePicker3: TUniDBDateTimePicker
                      Left = 0
                      Top = 21
                      Width = 120
                      Height = 38
                      Hint = '[['#13#10'mask:date |'#13#10']]'
                      DataField = 'dtcadastro'
                      DataSource = dsMaster
                      DateTime = 43596.000000000000000000
                      DateFormat = 'dd/MM/yyyy'
                      TimeFormat = 'HH:mm:ss'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                    end
                  end
                  object rcBlock660: TUniContainerPanel
                    Tag = 1
                    Left = 157
                    Top = 18
                    Width = 120
                    Height = 60
                    Hint = '[[cols:xs-6 sm-6 md-2]]'
                    ParentColor = False
                    TabOrder = 1
                    DesignSize = (
                      120
                      60)
                    object UniLabel32: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 57
                      Height = 15
                      Hint = ''
                      Caption = 'Data Final'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBDateTimePicker4: TUniDBDateTimePicker
                      Left = 0
                      Top = 21
                      Width = 120
                      Height = 38
                      Hint = '[['#13#10'mask:date |'#13#10'valid:>05/02/2022'#13#10']]'#13#10
                      DataField = 'DTANIVERSARIO'
                      DataSource = dsMaster
                      DateTime = 43596.000000000000000000
                      DateFormat = 'dd/MM/yyyy'
                      TimeFormat = 'HH:mm:ss'
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 2
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                    end
                  end
                  object rcBlock670: TUniContainerPanel
                    Tag = 1
                    Left = 296
                    Top = 18
                    Width = 120
                    Height = 60
                    Hint = '[[cols:xs-6 sm-6 md-2]]'
                    ParentColor = False
                    TabOrder = 2
                    DesignSize = (
                      120
                      60)
                    object UniLabel33: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 85
                      Height = 15
                      Hint = ''
                      Caption = 'Dia Vencimento'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdit31: TUniDBEdit
                      Left = 0
                      Top = 21
                      Width = 119
                      Height = 38
                      Hint = '[['#13#10'valid:=20 or >25<int>'#13#10']]'
                      DataField = 'DIA_COBRANCA'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Alignment = taRightJustify
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 2
                      InputMask.RemoveWhiteSpace = True
                    end
                  end
                  object rcBlock680: TUniContainerPanel
                    Tag = 1
                    Left = 433
                    Top = 18
                    Width = 120
                    Height = 60
                    Hint = '[[cols:xs-6 sm-6 md-2]]'
                    ParentColor = False
                    TabOrder = 3
                    DesignSize = (
                      120
                      60)
                    object UniLabel34: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 68
                      Height = 15
                      Hint = ''
                      Caption = 'No. Licen'#231'as'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdit1: TUniDBEdit
                      Left = 0
                      Top = 22
                      Width = 120
                      Height = 38
                      Hint = '[['#13#10'cls:rc-edit-number|'#13#10'valid:>=1 and <=9 |'#13#10']]'
                      DataField = 'LICENCAS'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Alignment = taRightJustify
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 2
                      InputMask.RemoveWhiteSpace = True
                      InputType = 'number'
                    end
                  end
                  object rcBlock690: TUniContainerPanel
                    Tag = 1
                    Left = 574
                    Top = 18
                    Width = 120
                    Height = 60
                    Hint = '[[cols:xs-6 sm-6 md-2]]'
                    ParentColor = False
                    TabOrder = 4
                    DesignSize = (
                      120
                      60)
                    object UniLabel36: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 73
                      Height = 15
                      Hint = ''
                      Caption = 'Valor Mensal'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object edMonthValue: TUniDBFormattedNumberEdit
                      Left = 0
                      Top = 21
                      Width = 87
                      Height = 38
                      Hint = '[['#13#10'valid:>99.99 and <=500 |'#13#10']]'
                      DataField = 'VALOR_CONTRATO'
                      DataSource = dsMaster
                      Alignment = taRightJustify
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 2
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object btnPayment: TUniSpeedButton
                      Left = 87
                      Top = 21
                      Width = 32
                      Height = 38
                      Hint = 
                        '[['#13#10'field-cls:bloqueado value-S:ButtonRed value-N:ButtonGreen ds' +
                        ':dsMaster| '#13#10'field-ico:bloqueado value-S:fas-hand-holding-usd va' +
                        'lue-N:fas-piggy-bank ds:dsMaster|'#13#10'field-cls-ico:bloqueado value' +
                        '-S:rc-btn-font-white value-N:rc-btn-font-black ds:dsMaster|'#13#10']]'#13 +
                        #10#13#10
                      Caption = 'A'
                      Anchors = [akTop, akRight]
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      ParentColor = False
                      TabOrder = 3
                    end
                  end
                  object rcBlock710: TUniContainerPanel
                    Tag = 1
                    Left = 20
                    Top = 120
                    Width = 141
                    Height = 145
                    Hint = '[[cols:xs-12 sm-12 md-6]]'
                    ParentColor = False
                    TabOrder = 5
                    object UniLabel38: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 37
                      Height = 15
                      Hint = ''
                      Caption = 'STATUS'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBCheckBox10: TUniDBCheckBox
                      Left = 3
                      Top = 23
                      Width = 120
                      Height = 17
                      Hint = '[['#13#10'cls:rc-form-cb-checked-color-success'#13#10']]'
                      DataField = 'ATIVO'
                      DataSource = dsMaster
                      ValueChecked = 'S'
                      ValueUnchecked = 'N'
                      Caption = 'Ativo'
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 2
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox11: TUniDBCheckBox
                      Left = 3
                      Top = 46
                      Width = 120
                      Height = 17
                      Hint = '[['#13#10'cls:rc-form-cb-checked-color-danger'#13#10']]'
                      DataField = 'BLOQUEADO'
                      DataSource = dsMaster
                      ValueChecked = 'S'
                      ValueUnchecked = 'N'
                      Caption = 'Bloqueado'
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 3
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox12: TUniDBCheckBox
                      Left = 3
                      Top = 70
                      Width = 120
                      Height = 17
                      Hint = '[['#13#10'cls:rc-form-cb-checked-color-warning'#13#10']]'
                      DataField = 'TRAVADO'
                      DataSource = dsMaster
                      ValueChecked = 'S'
                      ValueUnchecked = 'N'
                      Caption = 'Travado'
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 4
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox21: TUniDBCheckBox
                      Left = 3
                      Top = 94
                      Width = 120
                      Height = 17
                      Hint = ''
                      DataField = 'INADIMPLENTE'
                      DataSource = dsMaster
                      ValueChecked = 'S'
                      ValueUnchecked = 'N'
                      Caption = 'Inadimplente'
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 5
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox22: TUniDBCheckBox
                      Left = 3
                      Top = 117
                      Width = 120
                      Height = 17
                      Hint = '[['#13#10'cls:rc-form-cb-checked-color-info'#13#10']]'
                      DataField = 'ESPECIAL'
                      DataSource = dsMaster
                      ValueChecked = 'S'
                      ValueUnchecked = 'N'
                      Caption = 'Especial'
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 6
                      ParentColor = False
                      Color = clBtnFace
                    end
                  end
                  object rcBlock720: TUniContainerPanel
                    Tag = 1
                    Left = 171
                    Top = 120
                    Width = 256
                    Height = 145
                    Hint = '[[cols:xs-12 sm-12 md-6]]'
                    ParentColor = False
                    TabOrder = 6
                    object UniLabel39: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 118
                      Height = 15
                      Hint = ''
                      Caption = 'M'#211'DULOS LIBERADOS'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBCheckBox2: TUniDBCheckBox
                      Left = 3
                      Top = 23
                      Width = 120
                      Height = 17
                      Hint = ''
                      DataField = 'NFE'
                      DataSource = dsMaster
                      ValueChecked = 'S'
                      ValueUnchecked = 'N'
                      Caption = 'NFe'
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 2
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox7: TUniDBCheckBox
                      Left = 3
                      Top = 47
                      Width = 120
                      Height = 17
                      Hint = ''
                      DataField = 'BOLETOS'
                      DataSource = dsMaster
                      ValueChecked = 'S'
                      ValueUnchecked = 'N'
                      Caption = 'Boletos'
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 3
                      ParentColor = False
                      Color = clBtnFace
                    end
                  end
                  object rcBlock695: TUniContainerPanel
                    Left = 731
                    Top = 18
                    Width = 122
                    Height = 60
                    Hint = '[['#13#10'cols:xs-12 sm-12 md-2|'#13#10'hide:mobile disable'#13#10']]'
                    ParentColor = False
                    TabOrder = 7
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
          Height = 505
          ExplicitHeight = 505
          DesignSize = (
            306
            503)
          ScrollHeight = 1582
          ScrollY = 995
          inherited paSearchFilterDate: TUniContainerPanel
            Top = 249
            ExplicitTop = 249
          end
          inherited paSearchFilter1: TUniContainerPanel
            Top = -232
            ExplicitTop = -232
            inherited paSearchField1: TUniContainerPanel
              inherited cbxSearchCRUDField1: TUniComboBox
                Left = 5
                ExplicitLeft = 5
              end
            end
          end
          inherited paSearchContent1: TUniContainerPanel
            Top = -112
            ExplicitTop = -112
          end
          inherited paSearchFilter2: TUniContainerPanel
            Top = 8
            ExplicitTop = 8
          end
          inherited paSearchContent2: TUniContainerPanel
            Top = 129
            ExplicitTop = 129
          end
          inherited paSearchFilterAndOr: TUniContainerPanel
            Top = -52
            ExplicitTop = -52
          end
          inherited labTitleSearch: TUniLabel
            Top = -985
            ExplicitTop = -985
          end
          inherited paSearchFilterPeriod: TUniContainerPanel
            Top = 189
            ExplicitTop = 189
          end
          inherited paSearchFilterPeriodSelect: TUniContainerPanel
            Top = 47
            ExplicitTop = 47
          end
          inherited paSearchBtn: TUniContainerPanel
            Top = 551
            Anchors = [akLeft, akTop, akRight]
            ExplicitTop = 551
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
  inherited hpForActionBtns: TUniHiddenPanel
    object edHiddenCompanyID: TUniDBEdit
      Left = 3
      Top = 3
      Width = 22
      Height = 22
      Hint = ''
      Visible = False
      DataField = 'codiemp'
      DataSource = dsMaster
      CharCase = ecUpperCase
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      ReadOnly = True
      InputType = 'search'
    end
  end
  inherited rcSweetAlert: TUniSweetAlert
    Left = 816
    Top = 250
  end
  inherited dsMaster: TDataSource
    Left = 890
    Top = 363
  end
  inherited dsSearchMaster: TDataSource
    Left = 930
    Top = 541
  end
  inherited sqlSearchMaster: TFDQuery
    Left = 913
    Top = 451
  end
  inherited sqlMaster: TFDQuery
    SQL.Strings = (
      'select * from clientes')
    Left = 891
    Top = 297
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
    Left = 854
    Top = 70
  end
end
