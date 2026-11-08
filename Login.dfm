object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Hint = 
    '[['#13#10'cls:transparent-form-bg|'#13#10'/* comment 1 */'#13#10'width:max|'#13#10'heigh' +
    't:max| /* comment2 */'#13#10']]'#13#10#13#10
  ClientHeight = 670
  ClientWidth = 1074
  Caption = 'frmLogin'
  BorderStyle = bsNone
  OldCreateOrder = False
  KeyPreview = True
  NavigateKeys.Enabled = True
  NavigateKeys.Next.Key = 13
  MonitoredKeys.Keys = <>
  PageMode = True
  AlignmentControl = uniAlignmentClient
  Font.Height = -16
  Font.Name = 'Calibri'
  ScreenMask.Enabled = True
  ScreenMask.WaitData = True
  LayoutConfig.BodyCls = 'transparent-form-bg'
  OnReady = UniLoginFormReady
  OnCreate = UniLoginFormCreate
  OnScreenResize = UniLoginFormScreenResize
  TextHeight = 19
  object paBG_LoginForm: TUniContainerPanel
    AlignWithMargins = True
    Left = 2
    Top = 3
    Width = 1072
    Height = 667
    Hint = '[['#13#10#13#10'cls:transparent-form-bg'#13#10']]'
    Margins.Left = 2
    Margins.Right = 0
    Margins.Bottom = 0
    ParentColor = False
    Align = alClient
    TabOrder = 0
    object paImgBG_LoginForm: TUniContainerPanel
      Left = 388
      Top = 478
      Width = 325
      Height = 175
      Hint = ''
      ParentColor = False
      TabOrder = 2
    end
    object paLogo: TUniContainerPanel
      Left = 500
      Top = 19
      Width = 413
      Height = 432
      Hint = ''
      ParentColor = False
      Color = clGray
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      TabOrder = 1
      object htmlFrame: TUniHTMLFrame
        Left = 266
        Top = 20
        Width = 34
        Height = 28
        Hint = ''
        Visible = False
        OnAjaxEvent = htmlFrameAjaxEvent
      end
      object paWelcomeBox: TUniContainerPanel
        Left = 34
        Top = 67
        Width = 327
        Height = 164
        Hint = '[['#13#10'cls:rc-form-shadow'#13#10']]'
        ParentColor = False
        Color = clBlack
        TabOrder = 2
        object htmlLabel: TUniHTMLFrame
          AlignWithMargins = True
          Left = 3
          Top = 118
          Width = 321
          Height = 43
          Hint = ''
          HTML.Strings = (
            '<style>'
            '/*  body {'
            '    margin: 0 auto;'
            '    text-align: center;'
            '    font-family: sans-serif;'
            '    font-weight: 600;'
            '    color: #ffffff;'
            '    overflow: hidden;'
            '    background: #000000;'
            '  }'
            '  */'
            '.rc-rolling-label  header {'
            '    margin: 6.25em auto;'
            '    height: 2.6em;'
            '    overflow: hidden;'
            '    width: 100%;'
            '  }'
            '  '
            '.rc-rolling-label ul,'
            '.rc-rolling-label li {'
            '    height: 13.5em;'
            '    margin: 0px;'
            '    padding: 0px;'
            '    width: 100%;'
            '  }'
            '  '
            '.rc-rolling-label li {'
            '    list-style-type: none;'
            '    margin: 0px 0 1px 0;'
            '    height: 1em !important;'
            '    padding: 0px 0 0px 0;'
            '    font-size: 3em;'
            '    font-weight:500;'
            '    text-transform: uppercase;'
            '    width: 100%;'
            '    text-align:center;'
            '    color: #ff7600;'
            '    text-shadow: 0 0 3vw #000;'
            '  }'
            '  '
            '  .t {'
            '    animation-name: titleflip;'
            '    animation: titleflip 5s ease-in-out infinite;'
            '    }'
            '  '
            '  @-webkit-keyframes titleflip {'
            '    0%, 20% {'
            '    transform: translate(0px, -12.50em);'
            '    }'
            '    20%,'
            '    40% {'
            '   transform: translate(0px, -9.375em);'
            '    }'
            '    40%,'
            '    60% {'
            '      -webkit-transform: translate(0px, -6.44em);'
            '    }'
            '    60%,'
            '    80% {'
            '    transform: translate(0px, -3.44em);'
            '    }'
            '    80%,'
            '    100% {'
            '    transform: translate(0px, -0.315em);'
            '    }'
            '    100%,'
            '    0% {'
            '      transform: translate(0px, -12.50em);'
            '    }'
            '  }'
            '</style>'
            '<header class="rc-rolling-label">'
            '<ul class="rc-rolling-label t">'
            '  <li class="rc-rolling-label">[[msg3]]</li>'
            '  <li class="rc-rolling-label">[[msg2]]</li>'
            '  <li class="rc-rolling-label">[[msg1]]</li>'
            '</ul>'
            '</header>')
          Align = alBottom
        end
        object labAppName: TUniLabel
          AlignWithMargins = True
          Left = 15
          Top = 69
          Width = 297
          Height = 40
          Cursor = crHandPoint
          Hint = ''
          Margins.Top = 10
          Margins.Bottom = 0
          Alignment = taCenter
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'RadCORE WEB'
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -27
          ParentColor = False
          Color = 2763306
          TabOrder = 1
        end
        object paWelcomeLabel: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 327
          Height = 53
          Hint = '[['#13#10'border:b color-silver-light'#13#10']]'
          ParentColor = False
          Color = clWhite
          Align = alTop
          TabOrder = 3
          object labWelcome: TUniLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 321
            Height = 52
            Cursor = crHandPoint
            Hint = '[['#13'translate:'#13']]'
            Alignment = taCenter
            AutoSize = False
            Caption = 'Bem vindo'
            Align = alTop
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -32
            ParentColor = False
            Color = 2763306
            TabOrder = 1
          end
        end
      end
      object paImgBG: TUniContainerPanel
        Left = 36
        Top = 258
        Width = 325
        Height = 147
        Hint = ''
        ParentColor = False
        TabOrder = 3
      end
    end
    object paLoginForm: TUniContainerPanel
      Left = 11
      Top = 17
      Width = 355
      Height = 532
      Hint = '[[cls:card-info-box-white]]'
      ParentColor = False
      Color = clWhite
      TabOrder = 3
      object paBackground: TUniContainerPanel
        AlignWithMargins = True
        Left = 0
        Top = 75
        Width = 355
        Height = 360
        Hint = ''
        ParentColor = False
        TabOrder = 1
        object paBackgroundLogin: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 355
          Height = 360
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 1
          DesignSize = (
            355
            360)
          object pgLogin: TUniPageControl
            Left = 3
            Top = 0
            Width = 348
            Height = 353
            Hint = '[[center:parent x]]'
            ActivePage = tabLogin
            TabBarVisible = False
            TabOrder = 2
            object tabLogin: TUniTabSheet
              Hint = ''
              Caption = 'tabLogin'
              DesignSize = (
                340
                325)
              object edUserName: TUniEdit
                Left = 18
                Top = 80
                Width = 310
                Height = 38
                Hint = 
                  '[['#13#10'inputico:fas-envelope | '#13#10'focus-color:off |'#13#10'translate:excep' +
                  't-text |'#13#10'valid-required:top-in|'#13#10'center:parent x'#13#10']]'#13#10
                ParentRTL = False
                BodyRTL = False
                InputRTL = False
                CharCase = ecLowerCase
                Text = ''
                ParentFont = False
                Font.Height = -16
                Font.Name = 'Calibri'
                TabOrder = 0
                EmptyText = 'Email de Usu'#225'rio'
                FieldLabelWidth = 20
                FieldLabelSeparator = ' '
                FieldLabelFont.Name = 'Calibri'
              end
              object edPassword: TUniEdit
                Left = 20
                Top = 136
                Width = 308
                Height = 38
                Hint = 
                  '[['#13#10'inputico:fas-unlock | '#13#10'focus-color:off |'#13#10'translate:except-' +
                  'text |'#13#10'valid-required:bottom-in|'#13#10'center:parent x'#13#10']]'
                PasswordChar = '*'
                Text = ''
                ParentFont = False
                Font.Height = -16
                Font.Name = 'Calibri'
                TabOrder = 1
                EmptyText = 'Senha de Acesso'
                FieldLabelWidth = 20
                FieldLabelSeparator = ' '
                FieldLabelFont.Name = 'Calibri'
              end
              object btnLog_In: TUniBitBtn
                Left = 20
                Top = 188
                Width = 308
                Height = 38
                Hint = '[['#13#10'cls:ButtonThemeCrud |'#13#10'translate: |'#13#10'center:parent x'#13#10']]'#13#10
                Caption = 'Login'
                ModalResult = 1
                ParentFont = False
                Font.Color = clWhite
                Font.Height = -16
                Font.Name = 'Calibri'
                TabOrder = 2
                IconPosition = ipButtonEdge
                ScreenMask.Enabled = True
                OnClick = btnLog_InClick
              end
              object labRegister: TUniLabel
                Left = 226
                Top = 237
                Width = 102
                Height = 18
                Cursor = crHandPoint
                Hint = '[['#13#10'translate: |'#13#10'align:btnLog_in r:-w b:4 |'#13#10']]'
                ParentRTL = False
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Cadastrar'
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -15
                Font.Name = 'Calibri'
                ParentColor = False
                Color = 2763306
                TabOrder = 3
                OnClick = labRegisterClick
              end
              object labReset: TUniLabel
                Left = 12
                Top = 237
                Width = 115
                Height = 18
                Cursor = crHandPoint
                Hint = '[['#13#10'align:btnLog_in l:0 b:4 |'#13#10'translate:|'#13#10']]'#13#10
                ParentRTL = False
                AutoSize = False
                Caption = 'Resetar Senha'
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -15
                Font.Name = 'Calibri'
                ParentColor = False
                Color = 2763306
                TabOrder = 4
                OnClick = labResetClick
              end
              object paSelectLanguage: TUniContainerPanel
                Left = 146
                Top = 265
                Width = 71
                Height = 34
                Hint = '[['#13#10'center:parent x'#13#10']]'
                ParentColor = False
                TabOrder = 5
                object cbLanguage: TUniComboBox
                  Left = 1
                  Top = 2
                  Width = 67
                  Height = 30
                  Hint = ''
                  Text = ''
                  ParentFont = False
                  Font.Color = clWhite
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 1
                  IconItems = <>
                  OnChange = cbLanguageChange
                end
                object paFlag: TUniContainerPanel
                  Left = 2
                  Top = 3
                  Width = 39
                  Height = 28
                  Hint = '[[round:l]]'
                  ParentColor = False
                  Color = clWhite
                  TabOrder = 2
                  object labFlag: TUniLabel
                    Left = -4
                    Top = 0
                    Width = 46
                    Height = 31
                    Hint = '[[translate:]]'
                    Margins.Bottom = 0
                    TextConversion = txtHTML
                    AutoSize = False
                    Caption = ''
                    ParentFont = False
                    Font.Color = 15658734
                    Font.Height = -16
                    Font.Name = 'Calibri'
                    ParentColor = False
                    Color = clGray
                    TabOrder = 1
                  end
                end
              end
              object labLogin: TUniLabel
                Left = 73
                Top = 2
                Width = 251
                Height = 81
                Cursor = crHandPoint
                Hint = '[['#13#10'ico:fas-user-circle 3x| '#13#10'cls:rc-obj-float'#13#10']]'
                Visible = False
                Alignment = taCenter
                TextConversion = txtHTML
                AutoSize = False
                Caption = 'Login'
                Anchors = [akTop, akRight]
                ParentFont = False
                Font.Color = 14802398
                Font.Height = -29
                Font.Name = 'Calibri'
                ParentColor = False
                Color = 2763306
                TabOrder = 6
              end
              object imgLogo: TUniImage
                AlignWithMargins = True
                Left = 20
                Top = 10
                Width = 308
                Height = 63
                Cursor = crHandPoint
                Hint = '[['#13#10'center:parent x'#13#10']]'
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 0
                Margins.Bottom = 12
                Center = True
                Url = 'files/images/logo_login.png'
                Transparent = True
                LayoutConfig.Region = 'center'
                OnClick = imgLogoClick
              end
              object paAppVersion: TUniContainerPanel
                Left = -4
                Top = 288
                Width = 356
                Height = 44
                Hint = '[['#13#10'align:parent b:-h'#13#10']]'
                ParentColor = False
                TabOrder = 8
                object labCopyright: TUniLabel
                  AlignWithMargins = True
                  Left = 3
                  Top = 0
                  Width = 350
                  Height = 27
                  Hint = ''
                  Margins.Top = 0
                  Margins.Bottom = 0
                  Alignment = taCenter
                  AutoSize = False
                  Caption = '(C) 2019-2020 by Fl'#225'vio Motta'
                  Align = alTop
                  ParentFont = False
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'Calibri'
                  ParentColor = False
                  Color = clBtnFace
                  TabOrder = 1
                end
                object labAppVersion: TUniLabel
                  AlignWithMargins = True
                  Left = 3
                  Top = 17
                  Width = 350
                  Height = 24
                  Hint = ''
                  Alignment = taCenter
                  AutoSize = False
                  Caption = '3.2.0.0'
                  Align = alBottom
                  ParentFont = False
                  Font.Color = clBlack
                  Font.Height = -12
                  Font.Name = 'Calibri'
                  ParentColor = False
                  Color = clBtnFace
                  TabOrder = 2
                end
              end
              object UniEdit1: TUniEdit
                Left = 18
                Top = 40
                Width = 310
                Height = 38
                Hint = 
                  '[['#13#10'ltr:|'#13#10'inputico:fas-envelope | '#13#10'focus-color:off |'#13#10'translat' +
                  'e:except-text |'#13#10'valid-required:top-in|'#13#10'center:parent x'#13#10']]'#13#10
                ParentRTL = False
                Visible = False
                BodyRTL = False
                InputRTL = False
                CharCase = ecLowerCase
                Text = ''
                ParentFont = False
                Font.Height = -16
                Font.Name = 'Calibri'
                TabOrder = 9
                EmptyText = 'Email de Usu'#225'rio'
                FieldLabelWidth = 20
                FieldLabelSeparator = ' '
                FieldLabelFont.Name = 'Calibri'
              end
              object UniEdit2: TUniEdit
                Left = 18
                Top = 1
                Width = 310
                Height = 38
                Hint = '[['#13#10'center:parent x'#13#10']]'#13#10
                ParentRTL = False
                Visible = False
                BodyRTL = False
                InputRTL = False
                CharCase = ecLowerCase
                Text = ''
                ParentFont = False
                Font.Height = -16
                Font.Name = 'Calibri'
                TabOrder = 10
                EmptyText = 'Email de Usu'#225'rio'
                FieldLabelWidth = 20
                FieldLabelSeparator = ' '
                FieldLabelFont.Name = 'Calibri'
              end
            end
            object tabCompanies: TUniTabSheet
              Hint = ''
              Caption = 'tabCompanies'
              object paBtns: TUniContainerPanel
                AlignWithMargins = True
                Left = 3
                Top = 266
                Width = 334
                Height = 49
                Hint = ''
                Margins.Bottom = 10
                ParentColor = False
                Align = alBottom
                TabOrder = 0
                object btnEnter: TUniBitBtn
                  AlignWithMargins = True
                  Left = 204
                  Top = 9
                  Width = 115
                  Height = 31
                  Hint = '[['#13#10'cls:ButtonThemeCrud |'#13#10'translate:'#13#10']]'
                  Margins.Left = 15
                  Margins.Top = 9
                  Margins.Right = 15
                  Margins.Bottom = 9
                  Caption = 'Entrar'
                  Align = alRight
                  ParentFont = False
                  Font.Color = clWhite
                  Font.Height = -16
                  Font.Name = 'Calibri'
                  TabOrder = 1
                  IconPosition = ipButtonEdge
                  ScreenMask.Enabled = True
                  OnClick = btnEnterClick
                end
                object btnLogin: TUniBitBtn
                  AlignWithMargins = True
                  Left = 15
                  Top = 9
                  Width = 31
                  Height = 31
                  Hint = '[['#13#10'cls:ButtonThemeCrud |'#13#10'ico:fas-reply 1x rtl:rc-mirror-h'#13#10']]'
                  Margins.Left = 15
                  Margins.Top = 9
                  Margins.Right = 15
                  Margins.Bottom = 9
                  Caption = '<'
                  Align = alLeft
                  ParentFont = False
                  Font.Color = clWhite
                  Font.Height = -16
                  Font.Name = 'Calibri'
                  TabOrder = 2
                  IconPosition = ipButtonEdge
                  OnClick = btnLoginClick
                end
              end
              object rcBlock10: TUniContainerPanel
                Left = 3
                Top = 4
                Width = 336
                Height = 257
                Hint = '[[cols:12|noborder-all]]'
                ParentColor = False
                TabOrder = 1
                object paTitleSelectCompanyTitle: TUniContainerPanel
                  AlignWithMargins = True
                  Left = 3
                  Top = 3
                  Width = 330
                  Height = 35
                  Hint = '[[round:t]]'
                  ParentColor = False
                  Color = clGray
                  Align = alTop
                  TabOrder = 1
                  DesignSize = (
                    330
                    35)
                  object btnSearch: TUniLabel
                    AlignWithMargins = True
                    Left = 298
                    Top = 7
                    Width = 25
                    Height = 23
                    Cursor = crHandPoint
                    Hint = '[['#13#10'ico:fas-search 1x |'#13#10'cls:rc-hover-zoom-1-2'#13#10']]'
                    Margins.Top = 8
                    Margins.Right = 12
                    CreateOrder = 1
                    Alignment = taCenter
                    TextConversion = txtHTML
                    AutoSize = False
                    Caption = 'Search'
                    Anchors = [akTop, akRight]
                    ParentFont = False
                    Font.Color = 15724527
                    Font.Height = -16
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    OnClick = btnSearchClick
                  end
                  object labSelectCompanyTitle: TUniLabel
                    Left = 9
                    Top = 7
                    Width = 254
                    Height = 19
                    Hint = '[[translate:]]'
                    AutoSize = False
                    Caption = 'Selecione uma Empresa'
                    ParentFont = False
                    Font.Color = clWhite
                    Font.Height = -16
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    TabOrder = 1
                  end
                end
                object dbgCompanies: TUniDBGrid
                  AlignWithMargins = True
                  Left = 3
                  Top = 39
                  Width = 330
                  Height = 215
                  Hint = '[[cls:bringtofront|fieldmasks:grid-resize|]]'
                  DataSource = dm_rc.dsSqlCompanies
                  Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
                  ReadOnly = True
                  WebOptions.Paged = False
                  LoadMask.Message = 'Loading data...'
                  ForceFit = True
                  BorderStyle = ubsNone
                  Align = alBottom
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  ParentFont = False
                  TabOrder = 2
                  ParentColor = False
                  Color = clWhite
                  OnKeyDown = dbgCompaniesKeyDown
                  OnDblClick = dbgCompaniesDblClick
                  OnDrawColumnCell = dbgCompaniesDrawColumnCell
                  Columns = <
                    item
                      FieldName = 'FANTASIA'
                      Title.Alignment = taCenter
                      Title.Caption = 'Selecione a Empresa'
                      Width = 64
                      Font.Name = 'Calibri'
                      ReadOnly = True
                    end
                    item
                      FieldName = 'CODIGO'
                      Title.Caption = 'CODIGO'
                      Width = 64
                      Visible = False
                      Font.Name = 'Calibri'
                      ReadOnly = True
                    end>
                end
                object edSearchCompany: TUniEdit
                  Left = 8
                  Top = 44
                  Width = 301
                  Height = 31
                  Hint = 
                    '[['#13#10'/*align:paTitleSelectCompanyTitle b:3 l:3|*/'#13#10'translate:exce' +
                    'pt-text |'#13#10']]'
                  ParentRTL = False
                  BodyRTL = False
                  InputRTL = False
                  CharCase = ecLowerCase
                  Text = ''
                  ParentFont = False
                  Font.Height = -16
                  Font.Name = 'Calibri'
                  TabOrder = 3
                  EmptyText = 'Pesquisar Empresa'
                  FieldLabelWidth = 20
                  FieldLabelSeparator = ' '
                  FieldLabelFont.Name = 'Calibri'
                end
                object btnSearchCompany: TUniBitBtn
                  Left = 309
                  Top = 44
                  Width = 29
                  Height = 31
                  Hint = 
                    '[['#13#10'cls:ButtonThemeCrud |'#13#10'ico:fas-search 1x rtl:rc-mirror-h|'#13#10'/' +
                    '*align:edSearchCompany r:3 t:0*/'#13#10']]'
                  Margins.Left = 15
                  Margins.Top = 9
                  Margins.Right = 15
                  Margins.Bottom = 9
                  Caption = '<'
                  ParentFont = False
                  Font.Color = clWhite
                  Font.Height = -16
                  Font.Name = 'Calibri'
                  TabOrder = 4
                  IconPosition = ipButtonEdge
                  OnClick = btnSearchCompanyClick
                end
              end
            end
            object tabRegister: TUniTabSheet
              Hint = ''
              Caption = 'tabRegister'
              object paNewRegister: TUniPanel
                Left = 3
                Top = 0
                Width = 360
                Height = 360
                Hint = ''
                TabOrder = 0
                ScreenMask.Enabled = True
                ScreenMask.WaitData = True
                ScreenMask.Target = Owner
                BorderStyle = ubsNone
                Caption = ''
                object edUserNameReg: TUniEdit
                  Left = 16
                  Top = 75
                  Width = 308
                  Height = 38
                  Hint = '[['#13#10'inputico:fas-envelope|'#13#10'valid:email|'#13#10']]'
                  CharCase = ecLowerCase
                  Text = ''
                  ParentFont = False
                  Font.Height = -16
                  Font.Name = 'Calibri'
                  TabOrder = 1
                  EmptyText = 'Email de Usu'#225'rio'
                  FieldLabelWidth = 20
                  FieldLabelSeparator = ' '
                end
                object edPasswordReg: TUniEdit
                  Left = 16
                  Top = 129
                  Width = 308
                  Height = 38
                  Hint = '[['#13#10'inputico:fas-unlock|'#13#10'valid:blank|'#13#10']]'
                  PasswordChar = '*'
                  Text = ''
                  ParentFont = False
                  Font.Height = -16
                  Font.Name = 'Calibri'
                  TabOrder = 2
                  EmptyText = 'Senha de Acesso'
                  FieldLabelWidth = 20
                  FieldLabelSeparator = ' '
                  OnChange = edPasswordRegChange
                end
                object edNameReg: TUniEdit
                  Left = 16
                  Top = 20
                  Width = 308
                  Height = 38
                  Hint = '[['#13#10'inputico:fas-user|'#13#10'valid:blank|'#13#10#13#10']]'
                  CharCase = ecUpperCase
                  Text = ''
                  ParentFont = False
                  Font.Height = -16
                  Font.Name = 'Calibri'
                  TabOrder = 0
                  EmptyText = 'Nome de Usu'#225'rio'
                  FieldLabelWidth = 20
                  FieldLabelSeparator = ' '
                end
                object UniLabel1: TUniLabel
                  Left = -22
                  Top = 90
                  Width = 31
                  Height = 15
                  Hint = ''
                  Visible = False
                  TextConversion = txtHTML
                  Caption = 'Email'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 4
                end
                object UniLabel2: TUniLabel
                  Left = -22
                  Top = 161
                  Width = 90
                  Height = 15
                  Hint = ''
                  Visible = False
                  TextConversion = txtHTML
                  Caption = 'Senha de Acesso'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 5
                end
                object UniLabel3: TUniLabel
                  Left = -22
                  Top = 20
                  Width = 31
                  Height = 15
                  Hint = ''
                  Visible = False
                  TextConversion = txtHTML
                  Caption = 'Nome'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 6
                end
                object paBtnsNewRegister: TUniContainerPanel
                  AlignWithMargins = True
                  Left = 3
                  Top = 290
                  Width = 354
                  Height = 67
                  Hint = ''
                  ParentColor = False
                  Align = alBottom
                  TabOrder = 7
                  object btnRegisterUser: TUniBitBtn
                    AlignWithMargins = True
                    Left = 12
                    Top = 13
                    Width = 147
                    Height = 31
                    Hint = '[['#13#10'cls:ButtonThemeCrud |'#13#10'translate:'#13#10']]'
                    Margins.Left = 18
                    Margins.Top = 9
                    Margins.Right = 15
                    Margins.Bottom = 9
                    Caption = 'Solicitar Cadastro'
                    ModalResult = 7
                    ParentFont = False
                    Font.Color = clWhite
                    Font.Height = -16
                    Font.Name = 'Calibri'
                    TabOrder = 0
                    IconPosition = ipButtonEdge
                    ScreenMask.Enabled = True
                    ScreenMask.WaitData = True
                    ScreenMask.Target = Owner
                    OnClick = btnRegisterUserClick
                  end
                  object btnBack: TUniBitBtn
                    AlignWithMargins = True
                    Left = 228
                    Top = 13
                    Width = 100
                    Height = 31
                    Hint = '[['#13#10'cls:ButtonThemeCrud |'#13#10'ico:fas-share 1x rtl:rc-mirror-h'#13#10']]'
                    Margins.Left = 15
                    Margins.Top = 9
                    Margins.Right = 20
                    Margins.Bottom = 9
                    Caption = '>'
                    ParentFont = False
                    Font.Color = clWhite
                    Font.Height = -16
                    Font.Name = 'Calibri'
                    TabOrder = 3
                    IconPosition = ipButtonEdge
                    OnClick = btnBackClick
                  end
                  object btnConfirmEmail: TUniBitBtn
                    AlignWithMargins = True
                    Left = 8
                    Top = 13
                    Width = 160
                    Height = 31
                    Hint = '[['#13#10'cls:ButtonThemeCrud |'#13#10'translate:'#13#10']]'
                    Margins.Left = 18
                    Margins.Top = 9
                    Margins.Right = 15
                    Margins.Bottom = 9
                    Caption = 'Confirmar EMAIL'
                    ParentFont = False
                    Font.Color = clWhite
                    Font.Height = -16
                    Font.Name = 'Calibri'
                    TabOrder = 1
                    IconPosition = ipButtonEdge
                    ScreenMask.Enabled = True
                    ScreenMask.WaitData = True
                    ScreenMask.Target = Owner
                    OnClick = btnConfirmEmailClick
                  end
                end
                object paKeyBoard: TUniContainerPanel
                  AlignWithMargins = True
                  Left = 1
                  Top = 202
                  Width = 330
                  Height = 82
                  Hint = '[['#13#10'center:parent x |'#13#10']]'
                  Visible = False
                  ParentColor = False
                  TabOrder = 8
                  object btnRecPassword1: TUniBitBtn
                    Left = 67
                    Top = 1
                    Width = 38
                    Height = 38
                    Hint = '[[cls:ButtonThemeCrud]]'
                    Caption = '0'
                    ModalResult = 10
                    ParentFont = False
                    Font.Color = clWhite
                    Font.Height = -21
                    Font.Name = 'Calibri'
                    TabOrder = 1
                    IconPosition = ipButtonEdge
                    ScreenMask.WaitData = True
                    ScreenMask.Target = paNewRegister
                    OnClick = btnRecPassword1Click
                  end
                  object btnRecPassword2: TUniBitBtn
                    Left = 107
                    Top = 1
                    Width = 38
                    Height = 38
                    Hint = '[[cls:ButtonThemeCrud]]'
                    Caption = '0'
                    ModalResult = 10
                    ParentFont = False
                    Font.Color = clWhite
                    Font.Height = -21
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    IconPosition = ipButtonEdge
                    ScreenMask.WaitData = True
                    ScreenMask.Target = Owner
                    OnClick = btnRecPassword1Click
                  end
                  object btnRecPassword3: TUniBitBtn
                    Left = 147
                    Top = 1
                    Width = 38
                    Height = 38
                    Hint = '[[cls:ButtonThemeCrud]]'
                    Caption = '0'
                    ModalResult = 10
                    ParentFont = False
                    Font.Color = clWhite
                    Font.Height = -21
                    Font.Name = 'Calibri'
                    TabOrder = 3
                    IconPosition = ipButtonEdge
                    ScreenMask.WaitData = True
                    ScreenMask.Target = Owner
                    OnClick = btnRecPassword1Click
                  end
                  object btnRecPassword5: TUniBitBtn
                    Left = 227
                    Top = 1
                    Width = 38
                    Height = 38
                    Hint = '[[cls:ButtonThemeCrud]]'
                    Caption = '0'
                    ModalResult = 10
                    ParentFont = False
                    Font.Color = clWhite
                    Font.Height = -21
                    Font.Name = 'Calibri'
                    TabOrder = 4
                    IconPosition = ipButtonEdge
                    ScreenMask.WaitData = True
                    ScreenMask.Target = Owner
                    OnClick = btnRecPassword1Click
                  end
                  object btnRecPassword4: TUniBitBtn
                    Left = 187
                    Top = 1
                    Width = 38
                    Height = 38
                    Hint = '[[cls:ButtonThemeCrud]]'
                    Caption = '0'
                    ModalResult = 10
                    ParentFont = False
                    Font.Color = clWhite
                    Font.Height = -21
                    Font.Name = 'Calibri'
                    TabOrder = 5
                    IconPosition = ipButtonEdge
                    ScreenMask.WaitData = True
                    ScreenMask.Target = Owner
                    OnClick = btnRecPassword1Click
                  end
                  object btnRecPassword6: TUniBitBtn
                    Left = 67
                    Top = 41
                    Width = 38
                    Height = 38
                    Hint = '[[cls:ButtonThemeCrud]]'
                    Caption = '0'
                    ModalResult = 10
                    ParentFont = False
                    Font.Color = clWhite
                    Font.Height = -21
                    Font.Name = 'Calibri'
                    TabOrder = 6
                    IconPosition = ipButtonEdge
                    ScreenMask.WaitData = True
                    ScreenMask.Target = Owner
                    OnClick = btnRecPassword1Click
                  end
                  object btnRecPassword7: TUniBitBtn
                    Left = 107
                    Top = 41
                    Width = 38
                    Height = 38
                    Hint = '[[cls:ButtonThemeCrud]]'
                    Caption = '0'
                    ModalResult = 10
                    ParentFont = False
                    Font.Color = clWhite
                    Font.Height = -21
                    Font.Name = 'Calibri'
                    TabOrder = 7
                    IconPosition = ipButtonEdge
                    ScreenMask.WaitData = True
                    ScreenMask.Target = Owner
                    OnClick = btnRecPassword1Click
                  end
                  object btnRecPassword8: TUniBitBtn
                    Left = 147
                    Top = 41
                    Width = 38
                    Height = 38
                    Hint = '[[cls:ButtonThemeCrud]]'
                    Caption = '0'
                    ModalResult = 10
                    ParentFont = False
                    Font.Color = clWhite
                    Font.Height = -21
                    Font.Name = 'Calibri'
                    TabOrder = 8
                    IconPosition = ipButtonEdge
                    ScreenMask.WaitData = True
                    ScreenMask.Target = Owner
                    OnClick = btnRecPassword1Click
                  end
                  object btnRecPassword9: TUniBitBtn
                    Left = 187
                    Top = 41
                    Width = 38
                    Height = 38
                    Hint = '[[cls:ButtonThemeCrud]]'
                    Caption = '0'
                    ModalResult = 10
                    ParentFont = False
                    Font.Color = clWhite
                    Font.Height = -21
                    Font.Name = 'Calibri'
                    TabOrder = 9
                    IconPosition = ipButtonEdge
                    ScreenMask.WaitData = True
                    ScreenMask.Target = Owner
                    OnClick = btnRecPassword1Click
                  end
                  object btnRecPassword0: TUniBitBtn
                    Left = 227
                    Top = 41
                    Width = 38
                    Height = 38
                    Hint = '[[cls:ButtonThemeCrud]]'
                    Caption = '0'
                    ModalResult = 10
                    ParentFont = False
                    Font.Color = clWhite
                    Font.Height = -21
                    Font.Name = 'Calibri'
                    TabOrder = 10
                    IconPosition = ipButtonEdge
                    ScreenMask.WaitData = True
                    ScreenMask.Target = Owner
                    OnClick = btnRecPassword1Click
                  end
                end
              end
            end
          end
          object cbRemember: TUniCheckBox
            Left = 169
            Top = 309
            Width = 135
            Height = 17
            Hint = ''
            Visible = False
            Checked = True
            Caption = 'Lembrar de mim'
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Calibri'
            Anchors = [akTop, akRight]
            TabOrder = 1
          end
        end
      end
    end
  end
  object imgLoginThemed: TUniImage
    AlignWithMargins = True
    Left = 561
    Top = 553
    Width = 328
    Height = 350
    Cursor = crHandPoint
    Hint = '[['#13#10'align:paWelcomeBox b:-h l:100'#13#10']]'
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 12
    Center = True
    Proportional = True
    Transparent = True
    LayoutConfig.Region = 'center'
  end
  object rcSweetAlert: TUniSweetAlert
    Title = 'Title'
    ConfirmButtonText = 'OK'
    CancelButtonText = 'Cancel'
    ImageIndex = 0
    Padding = 20
    FocusCancel = True
    Left = 950
    Top = 52
  end
end
