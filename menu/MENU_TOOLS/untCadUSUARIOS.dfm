inherited frmCadUSUARIOS: TfrmCadUSUARIOS
  Width = 1061
  ExplicitWidth = 1061
  inherited paBaseBackGround: TUniContainerPanel
    Width = 1031
    ExplicitWidth = 1031
    inherited paBaseTop: TUniContainerPanel
      Width = 1031
      ExplicitWidth = 1031
      inherited paBaseTopTitle: TUniContainerPanel
        Width = 1031
        ExplicitWidth = 1031
        DesignSize = (
          1031
          90)
        inherited labSave: TUniLabel [0]
          Left = 907
          ExplicitLeft = 907
        end
        inherited edQuickSearch: TUniEdit [1]
        end
        inherited labEdit: TUniLabel [2]
          Left = 956
          ExplicitLeft = 956
        end
        inherited labDelete: TUniLabel [3]
          Left = 923
          ExplicitLeft = 923
        end
        inherited btnQuickSearch: TUniBitBtn [4]
          ScreenMask.Target = Owner
        end
        inherited labNew: TUniLabel [5]
          Left = 991
          ExplicitLeft = 991
        end
        inherited labTitleForm: TUniLabel [6]
        end
        inherited labOptions: TUniLabel [7]
          Left = 890
          ExplicitLeft = 890
        end
        inherited labState: TUniLabel [8]
          Left = 901
          ExplicitLeft = 901
        end
        inherited labExit: TUniLabel [9]
        end
        inherited labCancel: TUniLabel [10]
          Left = 940
          ExplicitLeft = 940
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
      Width = 984
      ExplicitWidth = 984
      inherited pgBaseCadControl: TUniPageControl
        Width = 984
        ActivePage = tabRegister
        ExplicitWidth = 984
        inherited tabSearch: TUniTabSheet
          ExplicitWidth = 976
          inherited paBaseRegSearch: TUniContainerPanel
            Width = 976
            ExplicitWidth = 976
            inherited paGridOffset: TUniContainerPanel
              Width = 970
              ExplicitWidth = 970
              inherited dbgSearchCRUD: TUniDBGrid
                Width = 970
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
          ExplicitWidth = 976
          inherited paBaseRegData1: TUniContainerPanel
            Width = 976
            ExplicitWidth = 976
            ScrollHeight = 965
            ScrollWidth = 976
            object pgComplementData: TUniPageControl
              Left = 0
              Top = 0
              Width = 976
              Height = 965
              Hint = ''
              Margins.Left = 10
              Margins.Top = 10
              Margins.Right = 10
              Margins.Bottom = 10
              ActivePage = Tab2
              Align = alClient
              TabOrder = 1
              object tabGeral: TUniTabSheet
                Hint = ''
                Caption = 'Geral'
                object sboxTab1: TUniScrollBox
                  Left = 0
                  Top = 0
                  Width = 968
                  Height = 935
                  Hint = ''
                  Align = alClient
                  TabOrder = 0
                  ScrollHeight = 662
                  ScrollWidth = 757
                  object rcBlock120: TUniContainerPanel
                    Tag = 4
                    Left = 28
                    Top = 640
                    Width = 729
                    Height = 22
                    Hint = '[[cols:12 | round:all]]'
                    ParentColor = False
                    TabOrder = 0
                  end
                  object rcBlock10: TUniContainerPanel
                    Tag = 4
                    Left = 12
                    Top = 11
                    Width = 123
                    Height = 60
                    Hint = '[[cols:xs-4 sm-4 md-2 lg-2 xl-2 | round:all]]'
                    ParentColor = False
                    TabOrder = 1
                    object edCodigo: TUniDBEdit
                      Left = 0
                      Top = 22
                      Width = 123
                      Height = 38
                      Hint = ''
                      DataField = 'codigo'
                      DataSource = dsMaster
                      Align = alBottom
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
                      Align = alTop
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock20: TUniContainerPanel
                    Tag = 4
                    Left = 154
                    Top = 9
                    Width = 123
                    Height = 60
                    Hint = '[[cols:xs-4 sm-4 md-2 lg-2 xl-2 | round:all]]'
                    ParentColor = False
                    TabOrder = 2
                    object UniDBCheckBox1: TUniDBCheckBox
                      Left = 0
                      Top = 9
                      Width = 120
                      Height = 17
                      Hint = ''
                      Visible = False
                      DataField = 'MASTER'
                      DataSource = dsMaster
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                      Caption = 'Master'
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 1
                      ParentColor = False
                      Color = clBtnFace
                    end
                    object UniDBCheckBox2: TUniDBCheckBox
                      Left = 0
                      Top = 35
                      Width = 120
                      Height = 17
                      Hint = ''
                      DataField = 'USER_ACTIVE'
                      DataSource = dsMaster
                      ValueChecked = '1'
                      ValueUnchecked = '0'
                      Caption = 'Inativo'
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 2
                      ParentColor = False
                      Color = clBtnFace
                    end
                  end
                  object rcBlock60: TUniContainerPanel
                    Tag = 4
                    Left = 14
                    Top = 166
                    Width = 249
                    Height = 60
                    Hint = '[[cols:xs-12 sm-12 md-6 lg-6 xl-6 | round:all]]'
                    ParentColor = False
                    TabOrder = 3
                    object UniLabel33: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 33
                      Height = 15
                      Hint = ''
                      Caption = 'Senha'
                      Align = alTop
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object edPassword: TUniDBEdit
                      Left = 0
                      Top = 22
                      Width = 249
                      Height = 38
                      Hint = ''
                      Enabled = False
                      DataField = 'SENHA'
                      DataSource = dsMaster
                      PasswordChar = '*'
                      Align = alBottom
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock30: TUniContainerPanel
                    Tag = 4
                    Left = 13
                    Top = 69
                    Width = 662
                    Height = 23
                    Hint = '[['#13#10'cols:12 | '#13#10'border:b color-silver-light'#13#10']]'
                    ParentColor = False
                    TabOrder = 4
                    object UniLabel36: TUniLabel
                      Left = 6
                      Top = 2
                      Width = 101
                      Height = 15
                      Hint = ''
                      Caption = 'DADOS DE ACESSO'
                      ParentFont = False
                      Font.Color = clSilver
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      Font.Style = [fsBold]
                      TabOrder = 1
                    end
                  end
                  object rcBlock80: TUniContainerPanel
                    Tag = 4
                    Left = 9
                    Top = 227
                    Width = 662
                    Height = 23
                    Hint = '[['#13#10'cols:12 | '#13#10'border:b color-silver-light'#13#10']]'
                    ParentColor = False
                    TabOrder = 5
                    object UniLabel56: TUniLabel
                      Left = 6
                      Top = 2
                      Width = 157
                      Height = 15
                      Hint = ''
                      Caption = 'V'#205'NCULO com FUNCION'#193'RIO'
                      ParentFont = False
                      Font.Color = clSilver
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      Font.Style = [fsBold]
                      TabOrder = 1
                    end
                  end
                  object rcBlock110: TUniContainerPanel
                    Tag = 4
                    Left = 14
                    Top = 530
                    Width = 467
                    Height = 100
                    Hint = 
                      '[['#13#10'cols:12 | '#13#10'/* hr:xs-350 sm-350 md-200 */'#13#10'hr:85 mobile-v-22' +
                      '5 mobile-h-95'#13#10']]'#13#10#13#10#13#10
                    ParentColor = False
                    TabOrder = 6
                    DesignSize = (
                      467
                      100)
                    object labAlert: TUniLabel
                      Left = 6
                      Top = 6
                      Width = 455
                      Height = 67
                      Hint = '[[ '#13#10'rcalert:info alert-ico:fas-exclamation-circle '#13#10']]'
                      TextConversion = txtHTML
                      AutoSize = False
                      Caption = 
                        'Na aba PERMISS'#213'ES, o bot'#227'o MASTER foi criado com intuito de dar ' +
                        'pemiss'#227'o de acesso a todas as empresas cadastradas durante o LOG' +
                        'IN. O bot'#227'o PERMISS'#195'O TOTAL dar'#225' o acesso total. Se o usu'#225'rio n'#227 +
                        'o for MASTER, ser'#225' solicitado senha superior. Lembre sempre que ' +
                        'o RADCORE n'#227'o '#233' o PRODUTO FINAL, cada um vai complementar de aco' +
                        'rdo com suas necessidades.'
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      ParentFont = False
                      Font.Style = [fsBold]
                      TabOrder = 1
                    end
                  end
                  object rcBlock40: TUniContainerPanel
                    Tag = 4
                    Left = 15
                    Top = 102
                    Width = 249
                    Height = 60
                    Hint = '[[cols:xs-12 sm-12 md-6 lg-6 xl-6 | round:all]]'
                    ParentColor = False
                    TabOrder = 7
                    object UniLabel4: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 42
                      Height = 15
                      Hint = ''
                      Caption = 'Apelido'
                      Align = alTop
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object edLogin: TUniDBEdit
                      Left = 0
                      Top = 22
                      Width = 249
                      Height = 38
                      Hint = '[[valid:blank=Login]]'
                      DataField = 'NOME'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Align = alBottom
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock90: TUniContainerPanel
                    Tag = 4
                    Left = 16
                    Top = 266
                    Width = 249
                    Height = 90
                    Hint = '[[cols:xs-12 sm-12 md-6 lg-6 xl-6 | round:all]]'
                    ParentColor = False
                    TabOrder = 8
                    DesignSize = (
                      249
                      90)
                    object UniLabel51: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 63
                      Height = 15
                      Hint = ''
                      Caption = 'Funcion'#225'rio'
                      Align = alTop
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      Font.Style = [fsBold]
                      TabOrder = 1
                    end
                    object edLkpFUNCIONARIOS: TUniDBEdit
                      Left = 0
                      Top = 21
                      Width = 249
                      Height = 38
                      Hint = '[[NOME CODIFUNC !]]'
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 2
                      ReadOnly = True
                      InputType = 'text'
                      OnClick = edLkpFUNCIONARIOSClick
                      OnChangeValue = edLkpFUNCIONARIOSChangeValue
                    end
                    object chkSalesMan: TUniDBCheckBox
                      Left = 0
                      Top = 68
                      Width = 189
                      Height = 17
                      Hint = ''
                      DataField = 'EXTERNO'
                      DataSource = dsMaster
                      ValueChecked = 'S'
                      ValueUnchecked = 'N'
                      Caption = 'Vendedor ?'
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 3
                      ParentColor = False
                      Color = clBtnFace
                    end
                  end
                  object rcBlock50: TUniContainerPanel
                    Tag = 4
                    Left = 313
                    Top = 102
                    Width = 249
                    Height = 60
                    Hint = '[[cols:xs-12 sm-12 md-6 lg-6 xl-6 | round:all]]'
                    ParentColor = False
                    TabOrder = 9
                    object UniLabel20: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 74
                      Height = 15
                      Hint = ''
                      Caption = 'Email( Login )'
                      Align = alTop
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object edEmail: TUniDBEdit
                      Left = 0
                      Top = 22
                      Width = 249
                      Height = 38
                      Hint = '[[valid:email]]'
                      DataField = 'EMAIL'
                      DataSource = dsMaster
                      CharCase = ecLowerCase
                      Align = alBottom
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock70: TUniContainerPanel
                    Tag = 4
                    Left = 306
                    Top = 166
                    Width = 249
                    Height = 60
                    Hint = '[[cols:xs-12 sm-12 md-6 lg-6 xl-6 | round:all]]'
                    ParentColor = False
                    TabOrder = 10
                    object UniLabel34: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 64
                      Height = 15
                      Hint = ''
                      Caption = 'Nova Senha'
                      Align = alTop
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object edNewPassword: TUniEdit
                      Left = 0
                      Top = 22
                      Width = 249
                      Height = 38
                      Hint = '[[valid:pass]]'
                      PasswordChar = '*'
                      Text = ''
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      Align = alBottom
                      TabOrder = 2
                    end
                  end
                  object rcBlock100: TUniContainerPanel
                    Tag = 4
                    Left = 297
                    Top = 266
                    Width = 123
                    Height = 90
                    Hint = '[[cols:xs-0 sm-0 md-6 lg-6 xl-6 | round:all]]'
                    ParentColor = False
                    TabOrder = 11
                  end
                  object rcBlock105: TUniContainerPanel
                    Tag = 4
                    Left = 16
                    Top = 357
                    Width = 136
                    Height = 149
                    Hint = '[[cols:xs-12 sm-12 md-4 lg-4 xl-4 | round:all]]'
                    ParentColor = False
                    TabOrder = 12
                    object UniContainerPanel4: TUniContainerPanel
                      Left = 1
                      Top = 1
                      Width = 134
                      Height = 147
                      Hint = '[[round:no | cls:card-info-box-white]]'
                      ParentColor = False
                      Color = clWhite
                      TabOrder = 1
                      object imgUser: TUniImage
                        AlignWithMargins = True
                        Left = 11
                        Top = 11
                        Width = 112
                        Height = 94
                        Hint = ''
                        Center = True
                      end
                      object btnLoadImg: TUniBitBtn
                        AlignWithMargins = True
                        Left = 11
                        Top = 112
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
                  object rcBlock25: TUniContainerPanel
                    Tag = 4
                    Left = 306
                    Top = 8
                    Width = 123
                    Height = 60
                    Hint = '[[cols:xs-4 sm-4 md-8 | round:all]]'
                    Visible = False
                    ParentColor = False
                    TabOrder = 13
                    object cbLanguage: TUniComboBox
                      Left = 0
                      Top = 17
                      Width = 67
                      Height = 30
                      Hint = ''
                      Visible = False
                      Text = ''
                      ParentFont = False
                      Font.Color = clWhite
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                      IconItems = <>
                    end
                    object paFlag: TUniContainerPanel
                      Left = 1
                      Top = 17
                      Width = 39
                      Height = 28
                      Hint = '[[round:l]]'
                      Visible = False
                      ParentColor = False
                      Color = clWhite
                      TabOrder = 2
                    end
                  end
                  object rcBlock106: TUniContainerPanel
                    Tag = 4
                    Left = 220
                    Top = 357
                    Width = 123
                    Height = 149
                    Hint = '[[cols:xs-0 sm-0 md-8  | round:all]]'
                    ParentColor = False
                    TabOrder = 14
                  end
                end
              end
              object Tab2: TUniTabSheet
                Hint = ''
                Caption = 'Permiss'#245'es'
                object sboxTab2: TUniScrollBox
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 962
                  Height = 929
                  Hint = ''
                  Align = alClient
                  TabOrder = 0
                  DesignSize = (
                    960
                    927)
                  ScrollHeight = 68
                  ScrollWidth = 905
                  object rcBlock190: TUniContainerPanel
                    Tag = 4
                    Left = 7
                    Top = 8
                    Width = 189
                    Height = 60
                    Hint = '[[cols:xs-12 sm-12 md-4 lg-4 xl-4 | round:all]]'
                    ParentColor = False
                    TabOrder = 0
                    DesignSize = (
                      189
                      60)
                    object UniLabel35: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 113
                      Height = 15
                      Hint = ''
                      Caption = 'Vincular Permiss'#245'es'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object edLkpUSUARIOS: TUniDBEdit
                      Left = 0
                      Top = 21
                      Width = 189
                      Height = 38
                      Hint = '[[NOME ID_GRUPO !]]'
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 2
                      ReadOnly = True
                      InputType = 'text'
                      OnClick = edLkpUSUARIOSClick
                      OnChangeValue = edLkpUSUARIOSChangeValue
                    end
                  end
                  object rcBlock200: TUniContainerPanel
                    Tag = 4
                    Left = 211
                    Top = 8
                    Width = 120
                    Height = 60
                    Hint = 
                      '[['#13#10'cols:xs-3 sm-3 md-2 lg-2 xl-2 | '#13#10'round:all|'#13#10'hr:xs-(btnUnCh' +
                      'eck+1) sm-(btnUnCheck+1) md-rcBlock190 '#13#10']]'
                    ParentColor = False
                    TabOrder = 1
                    DesignSize = (
                      120
                      60)
                    object btnUncheck: TUniBitBtn
                      AlignWithMargins = True
                      Left = 0
                      Top = 21
                      Width = 120
                      Height = 38
                      Hint = 
                        '[['#13#10'caption-hide:mobile|'#13#10'ico:fas-times | '#13#10'cls:ButtonRed | '#13#10'ap' +
                        'pend '#13#10']]'#13#10
                      Margins.Left = 4
                      Margins.Top = 4
                      Margins.Right = 4
                      Margins.Bottom = 4
                      Enabled = False
                      Caption = 'DESMARCAR'
                      Anchors = [akLeft, akRight, akBottom]
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 1
                      OnClick = btnUncheckClick
                    end
                  end
                  object rcBlock210: TUniContainerPanel
                    Tag = 4
                    Left = 362
                    Top = 8
                    Width = 120
                    Height = 60
                    Hint = 
                      '[['#13#10'cols:xs-3 sm-3 md-2 lg-2 xl-2 | '#13#10'round:all|'#13#10'hr:xs-(btnUnCh' +
                      'eck+1) sm-(btnUnCheck+1) md-rcBlock190 '#13#10']]'
                    ParentColor = False
                    TabOrder = 2
                    DesignSize = (
                      120
                      60)
                    object btnTotal: TUniBitBtn
                      AlignWithMargins = True
                      Left = 0
                      Top = 21
                      Width = 120
                      Height = 38
                      Hint = 
                        '[['#13#10'caption-hide:mobile|'#13#10'ico:fas-unlock-alt | '#13#10'cls:ButtonGreen' +
                        ' | '#13#10'append '#13#10']]'
                      Margins.Left = 4
                      Margins.Top = 4
                      Margins.Right = 4
                      Margins.Bottom = 4
                      Enabled = False
                      Caption = 'PERMISS'#195'O TOTAL'
                      Anchors = [akLeft, akRight, akBottom]
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 1
                      OnClick = btnTotalClick
                    end
                  end
                  object rcBlock220: TUniContainerPanel
                    Tag = 4
                    Left = 510
                    Top = 8
                    Width = 120
                    Height = 60
                    Hint = 
                      '[['#13#10'cols:xs-3 sm-3 md-2 lg-2 xl-2 | '#13#10'round:all|'#13#10'hr:xs-(btnUnCh' +
                      'eck+1) sm-(btnUnCheck+1) md-rcBlock190 '#13#10']]'
                    ParentColor = False
                    TabOrder = 3
                    DesignSize = (
                      120
                      60)
                    object btnBasic: TUniBitBtn
                      AlignWithMargins = True
                      Left = 0
                      Top = 20
                      Width = 120
                      Height = 38
                      Hint = 
                        '[['#13#10'caption-hide:mobile|'#13#10'ico:fas-key | '#13#10'cls:ButtonBlueDark | '#13 +
                        #10'append '#13#10']]'
                      Margins.Left = 4
                      Margins.Top = 4
                      Margins.Right = 4
                      Margins.Bottom = 4
                      Enabled = False
                      Caption = 'PERMISS'#195'O B'#193'SICA'
                      Anchors = [akLeft, akRight, akBottom]
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 1
                      OnClick = btnBasicClick
                    end
                  end
                  object rcBlock230: TUniContainerPanel
                    Tag = 4
                    Left = 654
                    Top = 8
                    Width = 120
                    Height = 60
                    Hint = 
                      '[['#13#10'cols:xs-3 sm-3 md-2 lg-2 xl-2 | '#13#10'round:all|'#13#10'hr:xs-(btnUnCh' +
                      'eck+1) sm-(btnUnCheck+1) md-rcBlock190 '#13#10']]'
                    ParentColor = False
                    TabOrder = 4
                    DesignSize = (
                      120
                      60)
                    object btnMaster: TUniBitBtn
                      AlignWithMargins = True
                      Left = 0
                      Top = 21
                      Width = 120
                      Height = 38
                      Hint = 
                        '[['#13#10'caption-hide:mobile|'#13#10'ico:fas-fingerprint | '#13#10'cls:ButtonBlue' +
                        'Dark | '#13#10'append '#13#10']]'
                      Margins.Left = 4
                      Margins.Top = 4
                      Margins.Right = 4
                      Margins.Bottom = 4
                      Enabled = False
                      Caption = 'USU'#193'RIO MASTER'
                      Anchors = [akLeft, akRight, akBottom]
                      ParentFont = False
                      Font.Height = -15
                      Font.Name = 'Calibri'
                      TabOrder = 1
                      OnClick = btnMasterClick
                    end
                  end
                  object rcBlock240: TUniContainerPanel
                    Tag = 4
                    Left = 5
                    Top = 71
                    Width = 900
                    Height = 214
                    Hint = 
                      '[['#13#10'cols:12 | round:no | cls:card-info-box-white|'#13#10'scale:parent ' +
                      'h:100%-top off:15 |'#13#10#13#10']]'
                    ParentColor = False
                    Anchors = [akLeft, akTop, akBottom]
                    TabOrder = 5
                    DesignSize = (
                      900
                      214)
                    object UniPageControl1: TUniPageControl
                      Left = 1
                      Top = 2
                      Width = 898
                      Height = 210
                      Hint = ''
                      ActivePage = tabPermissions
                      Anchors = [akLeft, akTop, akRight, akBottom]
                      TabOrder = 1
                      object tabEmpresas: TUniTabSheet
                        Hint = ''
                        Caption = 'Empresas'
                        object sboxTab7: TUniScrollBox
                          AlignWithMargins = True
                          Left = 3
                          Top = 3
                          Width = 884
                          Height = 176
                          Hint = ''
                          Align = alClient
                          TabOrder = 0
                          DesignSize = (
                            865
                            157)
                          ScrollHeight = 197
                          ScrollWidth = 874
                          object rcBlock310: TUniContainerPanel
                            Tag = 4
                            Left = 405
                            Top = 153
                            Width = 120
                            Height = 44
                            Hint = '[[cols:xs-12 sm-12 md-4 | round:all]]'
                            ParentColor = False
                            TabOrder = 0
                            DesignSize = (
                              120
                              44)
                            object btnAddCompany: TUniButton
                              Left = 1
                              Top = -1
                              Width = 45
                              Height = 42
                              Hint = '[['#13#10'cls:ButtonTheme | '#13#10'ico:fas-angle-left 2x'#13#10']]'
                              Caption = '<'
                              TabOrder = 1
                              OnClick = btnAddCompanyClick
                            end
                            object btnDelCompany: TUniButton
                              Left = 74
                              Top = 0
                              Width = 45
                              Height = 42
                              Hint = '[['#13#10'cls:ButtonTheme | '#13#10'ico:fas-angle-right 2x'#13#10']]'
                              Caption = '>'
                              Anchors = [akTop, akRight]
                              TabOrder = 2
                              OnClick = btnDelCompanyClick
                            end
                          end
                          object rcBlock308: TUniContainerPanel
                            Tag = 4
                            Left = 17
                            Top = 19
                            Width = 309
                            Height = 134
                            Hint = '[[cols:xs-12 sm-12 md-4 | round:no | cls:card-info-box-white]]'
                            ParentColor = False
                            Anchors = [akLeft, akTop, akBottom]
                            TabOrder = 1
                            DesignSize = (
                              309
                              134)
                            object dbgUsersCompany_Access: TUniDBGrid
                              AlignWithMargins = True
                              Left = 1
                              Top = 1
                              Width = 306
                              Height = 131
                              Hint = ''
                              TitleFont.Name = 'Calibri'
                              DataSource = dsUSUARIOS_EMPRESA
                              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgAutoRefreshRow]
                              WebOptions.FetchAll = True
                              LoadMask.WaitData = True
                              LoadMask.Message = 'Loading data...'
                              BorderStyle = ubsNone
                              Anchors = [akLeft, akTop, akRight, akBottom]
                              Font.Height = -13
                              Font.Name = 'Calibri'
                              ParentFont = False
                              TabOrder = 1
                              ParentColor = False
                              Color = 15395562
                              TabKeyBehavior = tkNextComponent
                              OnDrawColumnCell = dbgUsersCompany_AccessDrawColumnCell
                              Columns = <
                                item
                                  FieldName = 'EMPRESA'
                                  Title.Caption = 'ACESSO PERMITIDO'
                                  Width = 278
                                  Font.Name = 'Calibri'
                                end>
                            end
                          end
                          object rcBlock318: TUniContainerPanel
                            Tag = 4
                            Left = 565
                            Top = 20
                            Width = 309
                            Height = 131
                            Hint = '[[cols:xs-12 sm-12 md-4 | round:no | cls:card-info-box-white]]'#13#10
                            ParentColor = False
                            Anchors = [akLeft, akTop, akBottom]
                            TabOrder = 2
                            DesignSize = (
                              309
                              131)
                            object dbgCompanies: TUniDBGrid
                              AlignWithMargins = True
                              Left = 1
                              Top = 1
                              Width = 306
                              Height = 128
                              Hint = ''
                              TitleFont.Name = 'Calibri'
                              DataSource = dsEMPRESAS
                              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgAutoRefreshRow]
                              WebOptions.FetchAll = True
                              LoadMask.WaitData = True
                              LoadMask.Message = 'Loading data...'
                              BorderStyle = ubsNone
                              Anchors = [akLeft, akTop, akRight, akBottom]
                              Font.Height = -13
                              Font.Name = 'Calibri'
                              ParentFont = False
                              TabOrder = 1
                              ParentColor = False
                              Color = 15395562
                              TabKeyBehavior = tkNextComponent
                              OnDrawColumnCell = dbgCompaniesDrawColumnCell
                              Columns = <
                                item
                                  FieldName = 'EMPRESA'
                                  Title.Caption = 'EMPRESAS'
                                  Width = 354
                                  Font.Name = 'Calibri'
                                end>
                            end
                          end
                        end
                      end
                      object tabPermissions: TUniTabSheet
                        Hint = ''
                        Caption = 'Lista de Permiss'#245'es'
                        object sboxPermissions: TUniScrollBox
                          Left = 0
                          Top = 0
                          Width = 890
                          Height = 182
                          Hint = ''
                          Align = alClient
                          TabOrder = 0
                        end
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
        Height = 484
        ExplicitHeight = 484
        inherited UniScrollBox1: TUniScrollBox
          Height = 484
          ExplicitHeight = 484
          DesignSize = (
            306
            482)
          ScrollHeight = 1230
          ScrollWidth = 164
          ScrollY = 482
          inherited paSearchFilterDate: TUniContainerPanel
            Top = 303
            ExplicitTop = 303
            inherited cbxSearchCRUDFieldDate: TUniComboBox
              Width = 300
              ExplicitWidth = 300
            end
          end
          inherited paSearchFilter1: TUniContainerPanel
            Top = -215
            ExplicitTop = -215
          end
          inherited paSearchContent1: TUniContainerPanel
            Top = -95
            ExplicitTop = -95
          end
          inherited paSearchFilter2: TUniContainerPanel
            Top = 63
            ExplicitTop = 63
          end
          inherited paSearchContent2: TUniContainerPanel
            Top = 184
            ExplicitTop = 184
          end
          inherited paSearchFilterAndOr: TUniContainerPanel
            Top = 3
            ExplicitTop = 3
          end
          inherited labTitleSearch: TUniLabel
            Top = -472
            ExplicitTop = -472
          end
          inherited paSearchFilterPeriod: TUniContainerPanel
            Top = 245
            ExplicitTop = 245
          end
          inherited paSearchFilterPeriodSelect: TUniContainerPanel
            Top = 366
            ExplicitTop = 366
          end
          inherited paSearchBtn: TUniContainerPanel
            Top = 712
            ExplicitTop = 712
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
    object UniDBEdit1: TUniDBEdit
      Left = 24
      Top = 5
      Width = 55
      Height = 23
      Hint = ''
      Visible = False
      DataField = 'AVATAR'
      DataSource = dsMaster
      CharCase = ecLowerCase
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
    end
    object UniDBEdit2: TUniDBEdit
      Left = 3
      Top = 8
      Width = 15
      Height = 22
      Hint = ''
      Visible = False
      DataField = 'codiemp'
      DataSource = dsMaster
      CharCase = ecUpperCase
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
      ReadOnly = True
      InputType = 'search'
    end
  end
  inherited sqlSearchMaster: TFDQuery
    Top = 451
  end
  inherited sqlMaster: TFDQuery
    AfterOpen = sqlMasterAfterOpen
    Constraints = <
      item
        FromDictionary = False
      end>
    SQL.Strings = (
      'SELECT'
      ''
      'tab.* '
      ''
      'FROM  usuarios  tab'
      '')
  end
  inherited FDSchemaAdapter1: TFDSchemaAdapter
    UpdateOptions.AssignedValues = [uvUpdateNonBaseFields]
    UpdateOptions.UpdateNonBaseFields = True
    Left = 928
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
    Messages.BrowseText = 'Selecionar'
    Messages.UploadTimeout = 'Tempo Limite Excedido...'
    Messages.MaxSizeError = 'Arquivo '#195#169' maior que o m'#195#161'ximo permitido'
    Messages.MaxFilesError = 'Voc'#195#170' pode enviar no m'#195#161'ximo %d arquivos.'
    TargetFolder = 'uploads'
    Overwrite = True
    OnCompleted = uniFileUpCompleted
    Left = 990
    Top = 107
  end
  object USUARIOS_EMPRESA: TFDQuery
    CachedUpdates = True
    MasterSource = dsMaster
    MasterFields = 'CODIGO'
    DetailFields = 'CODIUSER'
    Connection = mm.SQLConn
    SchemaAdapter = FDSchemaAdapter1
    FetchOptions.AssignedValues = [evDetailCascade]
    FetchOptions.DetailCascade = True
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    FormatOptions.StrsTrim2Len = True
    SQL.Strings = (
      'select'
      ''
      '  ue.codiuser, ue.codiemp, e.fantasia as Empresa'
      ''
      'from usuarios_empresa ue'
      ''
      'left join empresas e'
      'on e.codigo = ue.codiemp'
      ''
      'where ue.codiuser = :codiuser'
      ''
      'order by ue.codiuser, ue.codiemp')
    Left = 779
    Top = 445
    ParamData = <
      item
        Name = 'CODIUSER'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object dsUSUARIOS_EMPRESA: TDataSource
    AutoEdit = False
    DataSet = USUARIOS_EMPRESA
    Left = 778
    Top = 491
  end
  object EMPRESAS: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    FormatOptions.StrsTrim2Len = True
    SQL.Strings = (
      'select   codigo, fantasia as Empresa'
      'from empresas')
    Left = 377
    Top = 445
  end
  object dsEMPRESAS: TDataSource
    AutoEdit = False
    DataSet = EMPRESAS
    Left = 690
    Top = 443
  end
end
