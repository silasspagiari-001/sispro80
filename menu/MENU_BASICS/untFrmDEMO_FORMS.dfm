object frmDEMO_FORMS: TfrmDEMO_FORMS
  Left = 0
  Top = 0
  Width = 1004
  Height = 677
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  ParentColor = False
  ParentBackground = False
  object sboxGridBlock: TUniScrollBox
    Left = 0
    Top = 0
    Width = 1004
    Height = 677
    Hint = ''
    Align = alClient
    Color = 15395562
    TabOrder = 0
    ScrollHeight = 1243
    ScrollWidth = 941
    object rcBlock10: TUniContainerPanel
      Tag = 4
      Left = 25
      Top = 19
      Width = 746
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 0
      DesignSize = (
        746
        43)
      object UniLabel35: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 655
        Height = 31
        Hint = '[[bsh5:|cls:left-center]]'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = 'Forms and Elements'
        Align = alLeft
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniBitBtn1: TUniBitBtn
        AlignWithMargins = True
        Left = 711
        Top = 4
        Width = 30
        Height = 30
        Hint = 
          '[['#13#10'ico:far-times-circle | '#13#10'cls:ButtonOutline ButtonOutlineRed ' +
          '| '#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'x'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = UniBitBtn1Click
      end
    end
    object rcBlock1200: TUniContainerPanel
      Tag = 4
      Left = 153
      Top = 1200
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 1
    end
    object rcBlock40: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 18
      Top = 70
      Width = 235
      Height = 327
      Hint = 
        '[['#13#10'cols:xs-12 sm-6 md-3| '#13#10'round:no | '#13#10'cls:card-info-box-white' +
        #13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        235
        327)
      object rcBlock41: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 235
        Height = 42
        Hint = '[['#13#10'cols:12 |'#13#10'noborder-all|'#13#10'round:t | cls:card-light'#13#10']]'
        ParentColor = False
        Color = clSilver
        TabOrder = 1
        object UniLabel1: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 71
          Height = 19
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'Input Icons'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object edUserName: TUniEdit
        Left = 16
        Top = 90
        Width = 203
        Height = 38
        Hint = 
          '[['#13#10'inputico:fas-envelope |'#13#10'focus-color:off |'#13#10'cls:border-botto' +
          'm-edit'#13#10']]'#13#10
        CharCase = ecLowerCase
        Text = ''
        ParentFont = False
        Font.Height = -17
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        EmptyText = 'User Email'
        FieldLabelWidth = 20
        FieldLabelSeparator = ' '
        FieldLabelFont.Name = 'Calibri'
      end
      object labRepitaNova: TUniLabel
        Left = 17
        Top = 66
        Width = 59
        Height = 15
        Hint = ''
        Caption = 'User Email'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
      end
      object UniLabel2: TUniLabel
        Left = 16
        Top = 147
        Width = 82
        Height = 15
        Hint = ''
        Caption = 'User Password'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 4
      end
      object edPassword: TUniEdit
        Left = 17
        Top = 170
        Width = 203
        Height = 38
        Hint = '[['#13#10'inputico:fas-unlock |'#13#10'focus-color:off |'#13#10']]'#13#10
        PasswordChar = '*'
        Text = ''
        ParentFont = False
        Font.Height = -17
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 5
        EmptyText = 'Senha de Acesso'
        FieldLabelWidth = 20
        FieldLabelSeparator = ' '
        FieldLabelFont.Name = 'Calibri'
      end
      object btnLink: TUniBitBtn
        AlignWithMargins = True
        Left = 17
        Top = 229
        Width = 202
        Height = 58
        Hint = 
          '[['#13#10'ico:fas-link 2x | '#13#10'ico-pos:up |'#13#10'cls:ButtonOutline ButtonOu' +
          'tlineGreen | '#13#10'align:edPassword r:-w b:20 | '#13#10'link:https://radco' +
          're.pro.br/web/atualizacoes/ |'#13#10'append'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Open Link'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 6
      end
    end
    object rcBlock42: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 289
      Top = 43
      Width = 280
      Height = 320
      Hint = 
        '[['#13#10'cols:xs-12 sm-6 md-4 | '#13#10'round:no | '#13#10'cls:card-info-box-whit' +
        'e'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 3
      object rcBlock43: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 280
        Height = 42
        Hint = '[['#13#10'cols:12 |'#13#10'noborder-all|'#13#10'round:t | cls:card-light'#13#10']]'
        ParentColor = False
        Color = clSilver
        TabOrder = 1
        object UniLabel3: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 91
          Height = 19
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'Floating Label'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock44: TUniContainerPanel
        Left = 28
        Top = 55
        Width = 122
        Height = 36
        Hint = '[[cols:xs-12 sm-12 md-12 ]]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          122
          36)
        object UniEdit1: TUniEdit
          Left = 0
          Top = 6
          Width = 122
          Height = 29
          Hint = 
            '[['#13#10'float-label:top-in Label |'#13#10'float-label-color:#7e7e7e |'#13#10'flo' +
            'at-label-bg:#ffffff |'#13#10'cls:border-bottom-edit |'#13#10'focus-color:off' +
            '|'#13#10']]'
          Text = ''
          ParentFont = False
          Font.Height = -16
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
      object btnCopy: TUniBitBtn
        AlignWithMargins = True
        Left = 70
        Top = 235
        Width = 162
        Height = 36
        Hint = 
          '[['#13#10'ico:far-copy | '#13#10'cls:ButtonGreen | '#13#10'align:rcBlock45 r:-w b:' +
          '15 | '#13#10'append'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Copy ClipBoard'
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = btnCopyClick
      end
      object btnPaste: TUniBitBtn
        AlignWithMargins = True
        Left = 26
        Top = 237
        Width = 77
        Height = 36
        Hint = 
          '[['#13#10'ico:far-paste | '#13#10'cls:ButtonRed | '#13#10'align:btncopy t:0 l:-w-1' +
          '0 | '#13#10'append '#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Visible = False
        Caption = 'Paste'
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 4
        OnClick = btnPasteClick
      end
      object rcBlock45: TUniContainerPanel
        Left = 23
        Top = 101
        Width = 205
        Height = 121
        Hint = '[[cols:xs-12 sm-12 md-12 ]]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          205
          121)
        object memo: TUniMemo
          Left = 0
          Top = 16
          Width = 205
          Height = 103
          Hint = 
            '[['#13#10'float-label:top Memo |'#13#10'float-label-bg:#ffffff |'#13#10'float-labe' +
            'l-color:#7e7e7e |'#13#10'focus-color:off |'#13#10']]'
          ParentFont = False
          Font.Height = -16
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
          LayoutConfig.Cls = 'toupper'
        end
      end
    end
    object rcBlock72: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 300
      Top = 405
      Width = 184
      Height = 290
      Hint = 
        '[['#13#10'cols:xs-12 sm-6 md-4| '#13#10'round:no | '#13#10'cls:card-info-box-white' +
        #13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 4
      object UniScrollBox1: TUniScrollBox
        Left = 0
        Top = 0
        Width = 184
        Height = 290
        Hint = ''
        Align = alClient
        TabOrder = 1
        DesignSize = (
          182
          288)
        ScrollHeight = 42
        ScrollWidth = 182
        object UniContainerPanel3: TUniContainerPanel
          Left = 18
          Top = 70
          Width = 147
          Height = 189
          Hint = ''
          ParentColor = False
          Anchors = []
          TabOrder = 0
          object UniLabel9: TUniLabel
            Left = 81
            Top = 13
            Width = 33
            Height = 24
            Hint = '[[bsswt:1]]'
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Opt1'
            ParentFont = False
            Font.Height = -20
            Font.Name = 'Calibri'
            Font.Style = [fsUnderline]
            ParentColor = False
            Color = clBtnFace
            TabOrder = 1
          end
          object UniLabel10: TUniLabel
            Left = 10
            Top = 18
            Width = 48
            Height = 15
            Hint = ''
            Caption = 'Option 1'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 2
          end
          object UniLabel11: TUniLabel
            Left = 81
            Top = 44
            Width = 33
            Height = 24
            Hint = '[[bsswt:0]]'
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Opt2'
            ParentFont = False
            Font.Height = -20
            Font.Name = 'Calibri'
            Font.Style = [fsUnderline]
            ParentColor = False
            Color = clBtnFace
            TabOrder = 3
          end
          object UniLabel12: TUniLabel
            Left = 10
            Top = 50
            Width = 48
            Height = 15
            Hint = ''
            Caption = 'Option 2'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 4
          end
          object UniLabel13: TUniLabel
            Left = 81
            Top = 72
            Width = 33
            Height = 24
            Hint = '[[bsswt:0 *]]'
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Opt3'
            ParentFont = False
            Font.Height = -20
            Font.Name = 'Calibri'
            Font.Style = [fsUnderline]
            ParentColor = False
            Color = clBtnFace
            TabOrder = 5
          end
          object UniLabel14: TUniLabel
            Left = 12
            Top = 78
            Width = 48
            Height = 15
            Hint = ''
            Caption = 'Option 3'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 6
          end
          object UniLabel15: TUniLabel
            Left = 10
            Top = 124
            Width = 20
            Height = 24
            Hint = '[[bschk:1]]'
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Active'
            ParentFont = False
            Font.Height = -20
            Font.Name = 'Calibri'
            Font.Style = [fsUnderline]
            ParentColor = False
            Color = clBtnFace
            TabOrder = 7
          end
          object UniLabel16: TUniLabel
            Left = 36
            Top = 131
            Width = 34
            Height = 15
            Hint = ''
            Caption = 'Active'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 8
          end
          object UniLabel17: TUniLabel
            Left = 10
            Top = 150
            Width = 20
            Height = 24
            Hint = '[[bschk:0]]'
            TextConversion = txtHTML
            AutoSize = False
            Caption = 'Active'
            ParentFont = False
            Font.Height = -20
            Font.Name = 'Calibri'
            Font.Style = [fsUnderline]
            ParentColor = False
            Color = clBtnFace
            TabOrder = 9
          end
          object UniLabel18: TUniLabel
            Left = 38
            Top = 156
            Width = 42
            Height = 15
            Hint = ''
            Caption = 'Inactive'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 10
          end
        end
        object rcBlock73: TUniContainerPanel
          Left = -2
          Top = 0
          Width = 184
          Height = 42
          Hint = '[['#13#10'cols:12|'#13#10'noborder-all | '#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
          ParentColor = False
          Color = clSilver
          TabOrder = 1
          object UniLabel8: TUniLabel
            AlignWithMargins = True
            Left = 6
            Top = 0
            Width = 93
            Height = 19
            Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
            Margins.Left = 6
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Caption = 'bsswt  / bschk'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -16
            Font.Name = 'Calibri'
            TabOrder = 1
          end
        end
      end
    end
    object rcBlock70: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 30
      Top = 405
      Width = 231
      Height = 290
      Hint = 
        '[['#13#10'cols:xs-12 sm-6 md-4| '#13#10'round:no | '#13#10'cls:card-info-box-white' +
        #13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      ParentAlignmentControl = False
      TabOrder = 5
      DesignSize = (
        231
        290)
      object rcBlock71: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 184
        Height = 42
        Hint = '[['#13#10'cols:12 |'#13#10'noborder-all|'#13#10'round:t | cls:card-light'#13#10']]'
        ParentColor = False
        Color = clSilver
        AlignmentControl = uniAlignmentClient
        ParentAlignmentControl = False
        TabOrder = 1
        object UniLabel19: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 36
          Height = 19
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'bsrgp'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniContainerPanel5: TUniContainerPanel
        Left = 11
        Top = 91
        Width = 194
        Height = 171
        Hint = ''
        ParentColor = False
        Anchors = []
        TabOrder = 2
        DesignSize = (
          194
          171)
        object bsrgpTipo01_M: TUniLabel
          Tag = 1
          Left = 27
          Top = 10
          Width = 20
          Height = 24
          Hint = ''
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Opt1'
          ParentFont = False
          Font.Height = -20
          Font.Name = 'Calibri'
          Font.Style = [fsUnderline]
          ParentColor = False
          Color = clBtnFace
          TabOrder = 1
        end
        object UniLabel20: TUniLabel
          Left = 57
          Top = 16
          Width = 105
          Height = 15
          Hint = ''
          Caption = 'Option 1( value M )'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 2
        end
        object bsrgpTipo02_E: TUniLabel
          Left = 27
          Top = 41
          Width = 20
          Height = 24
          Hint = ''
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Opt2'
          ParentFont = False
          Font.Height = -20
          Font.Name = 'Calibri'
          Font.Style = [fsUnderline]
          ParentColor = False
          Color = clBtnFace
          TabOrder = 3
        end
        object UniLabel21: TUniLabel
          Left = 57
          Top = 47
          Width = 100
          Height = 15
          Hint = ''
          Caption = 'Option 2( value E )'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 4
        end
        object bsrgpTipo03_F: TUniLabel
          Left = 27
          Top = 73
          Width = 20
          Height = 24
          Hint = ''
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Opt3'
          ParentFont = False
          Font.Height = -20
          Font.Name = 'Calibri'
          Font.Style = [fsUnderline]
          ParentColor = False
          Color = clBtnFace
          TabOrder = 5
        end
        object UniLabel22: TUniLabel
          Left = 57
          Top = 79
          Width = 100
          Height = 15
          Hint = ''
          Caption = 'Option 3( value F )'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 6
        end
        object btnGetIndex: TUniBitBtn
          AlignWithMargins = True
          Left = 5
          Top = 123
          Width = 85
          Height = 38
          Hint = '[['#13#10'cls:ButtonThemeCrud | '#13#10'pos-l:10 | '#13#10'pos-b:46'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Get Index'
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 7
          OnClick = btnGetIndexClick
        end
        object btnGetValue: TUniBitBtn
          AlignWithMargins = True
          Left = 99
          Top = 127
          Width = 85
          Height = 38
          Hint = '[['#13#10'cls:ButtonThemeCrud | '#13#10'align:btnGetIndex t:0 r:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Get Value'
          Anchors = []
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 8
          OnClick = btnGetValueClick
        end
      end
    end
    object rcBlock46: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 592
      Top = 65
      Width = 349
      Height = 290
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-5 | '#13#10'hr-childs:xs-exp sm-exp md-exp | '#13 +
        #10'h-replicate:rcBlock40 rcBlock42 mobile-v-off |'#13#10'round:no | '#13#10'cl' +
        's:card-info-box-white |'#13#10']]'#13#10#13#10
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 6
      object rcBlock48: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 349
        Height = 42
        Hint = '[['#13#10'cols:12 |'#13#10'noborder-all | '#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
        ParentColor = False
        Color = clSilver
        TabOrder = 1
        object UniLabel4: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 169
          Height = 19
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = '"In Line" Form Responsive'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock50: TUniContainerPanel
        Tag = 1
        Left = 12
        Top = 51
        Width = 91
        Height = 40
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'noborder-bottom |'#13#10'/*noborder-top:m' +
          'obile |*/'#13#10']]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          91
          40)
        object rcLabel3600: TUniLabel
          Left = 1
          Top = 14
          Width = 30
          Height = 14
          Hint = 
            '[['#13#10'scale:parent w:100% off:4 mobile-off |'#13#10'alignment:right mobi' +
            'le-left '#13#10']]'#13#10
          AutoSize = False
          Caption = 'Date'
          Anchors = [akLeft, akBottom]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock52: TUniContainerPanel
        Tag = 1
        Left = 114
        Top = 51
        Width = 111
        Height = 40
        Hint = '[['#13#10'cols:xs-12 sm-12 md-10 |'#13#10'noborder-top:mobile |'#13#10']]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          111
          40)
        object edDate: TUniDateTimePicker
          Left = 0
          Top = 1
          Width = 110
          Height = 38
          Hint = '[['#13#10'valid:date notblank|'#13#10'mask:date|'#13#10'date:mobile'#13#10']]'
          DateTime = 44922.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          ShowBlankDate = False
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
        end
      end
      object rcBlock58: TUniContainerPanel
        Tag = 1
        Left = 14
        Top = 139
        Width = 91
        Height = 40
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'noborder-bottom |'#13#10'noborder-top:mob' +
          'ile |'#13#10']]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          91
          40)
        object UniLabel5: TUniLabel
          Left = 1
          Top = 14
          Width = 30
          Height = 14
          Hint = 
            '[['#13#10'scale:parent w:100% off:4 mobile-off |'#13#10'alignment:right mobi' +
            'le-left '#13#10']]'#13#10
          AutoSize = False
          Caption = 'Id'
          Anchors = [akLeft, akBottom]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock60: TUniContainerPanel
        Tag = 1
        Left = 116
        Top = 139
        Width = 155
        Height = 40
        Hint = '[['#13#10'cols:xs-12 sm-12 md-10 |'#13#10'noborder-top:mobile |'#13#10']]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          155
          40)
        object edID: TUniEdit
          Left = 0
          Top = 1
          Width = 154
          Height = 38
          Hint = '[['#13#10'mask:99.99 |'#13#10'valid:min-4|'#13#10'clipboard:'#13#10']]'
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
      object rcBlock65: TUniContainerPanel
        Tag = 1
        Left = 14
        Top = 227
        Width = 91
        Height = 40
        Hint = '[['#13#10'cols:xs-0 sm-0 md-2 |'#13#10#13#10']]'#13#10#13#10#13#10
        ParentColor = False
        TabOrder = 6
      end
      object rcBlock67: TUniContainerPanel
        Tag = 1
        Left = 116
        Top = 227
        Width = 111
        Height = 40
        Hint = '[['#13#10'cols:xs-6 sm-6 md-5 |'#13#10']]'
        ParentColor = False
        TabOrder = 7
        DesignSize = (
          111
          40)
        object btnCancelForm: TUniBitBtn
          AlignWithMargins = True
          Left = 0
          Top = 1
          Width = 110
          Height = 38
          Hint = 
            '[['#13#10'pos-l:0|'#13#10'pos-t:0|'#13#10'ico:fas-times | '#13#10'cls:ButtonRed | '#13#10'appe' +
            'nd '#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Remove Mask'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnCancelFormClick
        end
      end
      object rcBlock69: TUniContainerPanel
        Tag = 1
        Left = 233
        Top = 227
        Width = 111
        Height = 40
        Hint = '[['#13#10'cols:xs-6 sm-6 md-5 |'#13#10']]'
        ParentColor = False
        TabOrder = 8
        DesignSize = (
          111
          40)
        object btnSaveFormValidate: TUniBitBtn
          AlignWithMargins = True
          Left = 0
          Top = 1
          Width = 110
          Height = 38
          Hint = 
            '[['#13#10'pos-l:0|'#13#10'pos-t:0|'#13#10'ico:fas-save | '#13#10'cls:ButtonGreen | '#13#10'app' +
            'end'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Save'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
          ClientEvents.UniEvents.Strings = (
            'ajaxRequest=function ajaxRequest(sender, url, data)'#13#10'{'#13#10#13#10'}')
          OnClick = btnSaveFormValidateClick
        end
      end
      object rcBlock54: TUniContainerPanel
        Tag = 1
        Left = 12
        Top = 93
        Width = 91
        Height = 40
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'noborder-bottom |'#13#10'noborder-top:mob' +
          'ile |'#13#10']]'
        ParentColor = False
        TabOrder = 9
        DesignSize = (
          91
          40)
        object UniLabel6: TUniLabel
          Left = 1
          Top = 14
          Width = 30
          Height = 14
          Hint = 
            '[['#13#10'scale:parent w:100% off:4 mobile-off |'#13#10'alignment:right mobi' +
            'le-left '#13#10']]'#13#10
          AutoSize = False
          Caption = 'Phone'
          Anchors = [akLeft, akBottom]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock56: TUniContainerPanel
        Tag = 1
        Left = 114
        Top = 93
        Width = 111
        Height = 40
        Hint = '[['#13#10'cols:xs-12 sm-12 md-10 |'#13#10'noborder-top:mobile |'#13#10']]'
        ParentColor = False
        TabOrder = 10
        DesignSize = (
          111
          40)
        object UniEdit2: TUniEdit
          Left = 0
          Top = 1
          Width = 110
          Height = 38
          Hint = '[['#13#10'mask:phoneddd |'#13#10'dial:'#13#10']]'
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
      object rcBlock63: TUniContainerPanel
        Tag = 1
        Left = 14
        Top = 181
        Width = 91
        Height = 40
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'noborder-bottom |'#13#10'noborder-top:mob' +
          'ile |'#13#10']]'
        ParentColor = False
        TabOrder = 11
        DesignSize = (
          91
          40)
        object UniLabel7: TUniLabel
          Left = 1
          Top = 14
          Width = 30
          Height = 14
          Hint = 
            '[['#13#10'scale:parent w:100% off:4 mobile-off |'#13#10'alignment:right mobi' +
            'le-left '#13#10']]'#13#10
          AutoSize = False
          Caption = 'Site'
          Anchors = [akLeft, akBottom]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock64: TUniContainerPanel
        Tag = 1
        Left = 116
        Top = 181
        Width = 111
        Height = 40
        Hint = '[['#13#10'cols:xs-12 sm-12 md-10 |'#13#10'noborder-top:mobile |'#13#10']]'
        ParentColor = False
        TabOrder = 12
        DesignSize = (
          111
          40)
        object edSite: TUniEdit
          Left = 0
          Top = 1
          Width = 110
          Height = 38
          Hint = 
            '[['#13#10'valid:blank=Site |'#13#10'valid-required:bottom-in |'#13#10'link: |'#13#10']]'#13 +
            #10#13#10
          Text = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
    end
    object rcBlock76: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 615
      Top = 403
      Width = 310
      Height = 290
      Hint = 
        '[['#13#10'cols:xs-12 sm-6 md-4 | '#13#10'round:no | '#13#10'cls:card-info-box-whit' +
        'e'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 7
      object rcBlock77: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 310
        Height = 42
        Hint = '[['#13#10'cols:12 |'#13#10'noborder-all|'#13#10'round:t | cls:card-light'#13#10']]'
        ParentColor = False
        Color = clSilver
        TabOrder = 1
        object UniLabel23: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 154
          Height = 19
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'Open Form Dynamically'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object btnInsertNew: TUniBitBtn
        AlignWithMargins = True
        Left = 164
        Top = 97
        Width = 120
        Height = 38
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineRed | '#13#10'center:parent x:122 y' +
          ':-15]]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Insert New'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = btnInsertNewClick
      end
      object btnShowFishFact: TUniBitBtn
        AlignWithMargins = True
        Left = 34
        Top = 53
        Width = 120
        Height = 38
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineGreen | '#13#10'center:parent x:-12' +
          '2 y:-95'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'FISHFACTS'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = btnShowFishFactClick
      end
      object btnShowCustomer: TUniBitBtn
        AlignWithMargins = True
        Left = 156
        Top = 53
        Width = 120
        Height = 38
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue | '#13#10'center:parent x:122 ' +
          'y:-95'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Show "569"'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 4
        OnClick = btnShowCustomerClick
      end
      object btnEditCustomer: TUniBitBtn
        AlignWithMargins = True
        Left = 38
        Top = 105
        Width = 120
        Height = 38
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineOrange | '#13#10'center:parent x:-1' +
          '22 y:-15'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Edit "569"'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 5
        OnClick = btnEditCustomerClick
      end
      object btnInsideBlock: TUniBitBtn
        AlignWithMargins = True
        Left = 38
        Top = 148
        Width = 120
        Height = 60
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineOrange | '#13#10'center:parent x:-1' +
          '22 y:88'#13#10']]'#13#10
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'FRAME<br>inside a BLOCK'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 6
        OnClick = btnInsideBlockClick
      end
      object btnCallWithTag: TUniBitBtn
        AlignWithMargins = True
        Left = 164
        Top = 148
        Width = 120
        Height = 60
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineOrange | '#13#10'center:parent x:12' +
          '2 y:88'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'CALL<br>with "tag-form"'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 7
        OnClick = btnCallWithTagClick
      end
      object UniBitBtn2: TUniBitBtn
        AlignWithMargins = True
        Left = 38
        Top = 216
        Width = 242
        Height = 38
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineGreen | '#13#10'align:btnInsideBloc' +
          'k l:0 b:2|'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Open FRAME as MODAL'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 8
        OnClick = UniBitBtn2Click
      end
    end
    object rcBlock80: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 24
      Top = 730
      Width = 194
      Height = 409
      Hint = 
        '[['#13#10'cols:xs-12 sm-6 md-6 | '#13#10'hr-childs:xs-exp sm-exp md-exp | '#13#10 +
        'round:no | '#13#10'cls:card-info-box-white'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      AutoScroll = True
      TabOrder = 8
      DesignSize = (
        194
        409)
      ScrollHeight = 409
      ScrollWidth = 194
      object rcBlock90: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 193
        Height = 42
        Hint = 
          '[['#13#10'cols:12 | '#13#10'noborder-top|'#13#10'noborder-left|'#13#10'noborder-right|'#13#10 +
          'round:t | '#13#10'cls:card-light'#13#10']]'
        ParentColor = False
        Color = 14802398
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        object UniLabel2Clone: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 10
          Width = 242
          Height = 25
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Form Field'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock100: TUniContainerPanel
        Tag = 1
        Left = 20
        Top = 74
        Width = 111
        Height = 60
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          111
          60)
        object UniEdit1Clone: TUniEdit
          Left = 0
          Top = 21
          Width = 110
          Height = 38
          Hint = '[['#13#10'label:100 left center align-right Teste Label'#13#10']]'
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
      object rcBlock110: TUniContainerPanel
        Tag = 1
        Left = 24
        Top = 160
        Width = 111
        Height = 60
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          111
          60)
        object UniEdit2CloneCloneClone: TUniEdit
          Left = 0
          Top = 21
          Width = 110
          Height = 38
          Hint = '[['#13#10'label:100 left center align-right Teste Label'#13#10']]'
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
      object rcBlock120: TUniContainerPanel
        Tag = 1
        Left = 16
        Top = 226
        Width = 111
        Height = 60
        Hint = '[['#13#10'cols:xs-12 sm-6 md-6'#13#10']]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          111
          60)
        object UniEdit3CloneCloneClone: TUniEdit
          Left = 0
          Top = 21
          Width = 110
          Height = 38
          Hint = '[['#13#10'label:100 left center align-right Teste Label'#13#10']]'
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Color = clWhite
        end
      end
      object rcBlock130: TUniContainerPanel
        Tag = 1
        Left = 20
        Top = 312
        Width = 111
        Height = 60
        Hint = '[['#13#10'cols:xs-12 sm-6 md-6'#13#10']]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          111
          60)
        object UniEdit4CloneCloneClone: TUniEdit
          Left = 0
          Top = 21
          Width = 110
          Height = 38
          Hint = '[['#13#10'label:100 left center align-right Teste Label'#13#10']]'
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
    end
    object rcBlock140: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 238
      Top = 725
      Width = 194
      Height = 409
      Hint = 
        '[['#13#10'cols:xs-12 sm-6 md-6 | '#13#10'hr-childs:xs-exp sm-exp md-exp | '#13#10 +
        'round:no | '#13#10'cls:card-info-box-white'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      AutoScroll = True
      TabOrder = 9
      DesignSize = (
        194
        409)
      ScrollHeight = 409
      ScrollWidth = 194
      object rcBlock150: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 193
        Height = 42
        Hint = 
          '[['#13#10'cols:12 | '#13#10'noborder-top|'#13#10'noborder-left|'#13#10'noborder-right|'#13#10 +
          'round:t | '#13#10'cls:card-light'#13#10']]'
        ParentColor = False
        Color = 14802398
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        object UniLabel1CloneCloneClone: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 10
          Width = 242
          Height = 25
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Form Field'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock160: TUniContainerPanel
        Tag = 1
        Left = 25
        Top = 78
        Width = 111
        Height = 60
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          111
          60)
        object rcEdit11CloneCloneClone: TUniEdit
          Left = 0
          Top = 21
          Width = 110
          Height = 38
          Hint = '[['#13#10'label:top Teste Label'#13#10']]'
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
      object rcBlock170: TUniContainerPanel
        Tag = 1
        Left = 29
        Top = 164
        Width = 111
        Height = 60
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          111
          60)
        object rcEdit11CloneCloneCloneClone: TUniEdit
          Left = 0
          Top = 21
          Width = 110
          Height = 38
          Hint = '[['#13#10'label:150 left center align-right Teste Label'#13#10']]'
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
      object rcBlock180: TUniContainerPanel
        Tag = 1
        Left = 21
        Top = 230
        Width = 111
        Height = 60
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          111
          60)
        object UniEdit1CloneCloneClone: TUniEdit
          Left = 0
          Top = 21
          Width = 110
          Height = 38
          Hint = '[['#13#10'label:bottom Teste Label|'#13#10']]'
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Color = clWhite
        end
      end
      object rcBlock190: TUniContainerPanel
        Tag = 1
        Left = 25
        Top = 316
        Width = 111
        Height = 60
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          111
          60)
        object rcEdit11CloneCloneCloneCloneClone: TUniEdit
          Left = 0
          Top = 21
          Width = 110
          Height = 38
          Hint = '[['#13#10'label:150 right align-left Teste Label'#13#10']]'
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
    end
    object rcBlock200: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 517
      Top = 711
      Width = 194
      Height = 409
      Hint = 
        '[['#13#10'cols:xs-12 sm-6 md-6 | '#13#10'hr-childs:xs-exp sm-exp md-exp | '#13#10 +
        'round:no | '#13#10'cls:card-info-box-white'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      AutoScroll = True
      TabOrder = 10
      DesignSize = (
        194
        409)
      ScrollHeight = 409
      ScrollWidth = 194
      object rcBlock210: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 193
        Height = 42
        Hint = 
          '[['#13#10'cols:12 | '#13#10'noborder-top|'#13#10'noborder-left|'#13#10'noborder-right|'#13#10 +
          'round:t | '#13#10'cls:card-light'#13#10']]'
        ParentColor = False
        Color = 14802398
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        object UniLabel2CloneCloneCloneCloneClone: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 10
          Width = 242
          Height = 25
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Form Field'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock220: TUniContainerPanel
        Tag = 1
        Left = 20
        Top = 60
        Width = 111
        Height = 60
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'cols-offset:10'#13#10']]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          111
          60)
        object UniEdit2CloneCloneCloneCloneClone: TUniEdit
          Left = 0
          Top = 21
          Width = 110
          Height = 38
          Hint = 
            '[['#13#10'label:bottom Teste Label|'#13#10'label-size:11 |'#13#10'label-attr:(ico:' +
            'fas-magnifying-glass|append)|/*cls:rc-label-clear|*/'#13#10'label-colo' +
            'r:#dddddd |'#13#10'/*label-bg:#ffffff |*/'#13#10#13#10'focus-color:off |'#13#10'cls:bo' +
            'rder-bottom-edit'#13#10']]'#13#10
          Text = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
      object rcBlock230: TUniContainerPanel
        Tag = 1
        Left = 24
        Top = 146
        Width = 111
        Height = 60
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'cols-offset:10'#13#10']]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          111
          60)
        object UniEdit3CloneCloneCloneCloneClone: TUniEdit
          Left = 0
          Top = 21
          Width = 110
          Height = 38
          Hint = 
            '[['#13#10'label:bottom Teste Label|'#13#10'focus-color:off |'#13#10'cls:border-bot' +
            'tom-edit'#13#10']]'
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
      object rcBlock240: TUniContainerPanel
        Tag = 1
        Left = 16
        Top = 212
        Width = 111
        Height = 60
        Hint = '[['#13#10'cols:xs-12 sm-12 md-6|'#13#10'cols-offset:10'#13#10']]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          111
          60)
        object UniDateTimePicker1CloneCloneCloneCloneClone: TUniDateTimePicker
          Left = 0
          Top = 21
          Width = 110
          Height = 38
          Hint = 
            '[['#13#10'label:bottom Teste Label|'#13#10'focus-color:off |'#13#10'/*cls:border-b' +
            'ottom-edit*/'#13#10'/*check LayoutConfig>cls = border-bottom-edit*/'#13#10']' +
            ']'
          DateTime = 45400.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          LayoutConfig.Cls = 'border-bottom-edit'
        end
      end
      object rcBlock250: TUniContainerPanel
        Left = 26
        Top = 320
        Width = 122
        Height = 60
        Hint = '[['#13#10'cols:xs-12 sm-12 md-6|'#13#10'cols-offset:10'#13#10']]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          122
          60)
        object UniComboBox1CloneCloneCloneCloneClone: TUniComboBox
          Left = 0
          Top = 21
          Width = 122
          Height = 38
          Hint = 
            '[['#13#10'label:bottom Teste Label|'#13#10'focus-color:off |'#13#10'cls:border-bot' +
            'tom-edit'#13#10']]'
          Text = 'UniComboBox1CloneCloneCloneCloneClone'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
          IconItems = <>
        end
      end
    end
    object rcBlock260: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 735
      Top = 715
      Width = 194
      Height = 409
      Hint = 
        '[['#13#10'cols:xs-12 sm-6 md-6 | '#13#10'hr-childs:xs-exp sm-exp md-exp | '#13#10 +
        'round:no | '#13#10'cls:card-info-box-white'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      AutoScroll = True
      TabOrder = 11
      DesignSize = (
        194
        409)
      ScrollHeight = 409
      ScrollWidth = 194
      object rcBlock270: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 193
        Height = 42
        Hint = 
          '[['#13#10'cols:12 | '#13#10'noborder-top|'#13#10'noborder-left|'#13#10'noborder-right|'#13#10 +
          'round:t | '#13#10'cls:card-light'#13#10']]'
        ParentColor = False
        Color = 14802398
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        DesignSize = (
          193
          42)
        object UniLabel4CloneCloneCloneClone: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 10
          Width = 242
          Height = 25
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Form Field'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object labRcCollapse6CloneCloneClone: TUniLabel
          Left = 163
          Top = 8
          Width = 10
          Height = 26
          Hint = '[['#13#10'collapse:rcBlock260 off-parent'#13#10']]'#13#10
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
      object rcBlock280: TUniContainerPanel
        Tag = 1
        Left = 20
        Top = 70
        Width = 111
        Height = 60
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          111
          60)
        object UniEdit4CloneCloneCloneCloneClone: TUniEdit
          Left = 0
          Top = 21
          Width = 110
          Height = 38
          Hint = '[['#13#10'label:200 left center Teste Label'#13#10']]'
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
      object rcBlock290: TUniContainerPanel
        Tag = 1
        Left = 24
        Top = 156
        Width = 111
        Height = 60
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          111
          60)
        object UniEdit5CloneCloneCloneCloneClone: TUniEdit
          Left = 0
          Top = 21
          Width = 110
          Height = 38
          Hint = '[['#13#10'label:200 left center Teste Label'#13#10']]'
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
      object rcBlock300: TUniContainerPanel
        Tag = 1
        Left = 16
        Top = 222
        Width = 111
        Height = 60
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          111
          60)
        object UniEdit6CloneCloneCloneCloneClone: TUniEdit
          Left = 0
          Top = 21
          Width = 110
          Height = 38
          Hint = '[['#13#10'label:200 left center Teste Label'#13#10']]'
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Color = clWhite
        end
      end
      object rcBlock310: TUniContainerPanel
        Tag = 1
        Left = 20
        Top = 308
        Width = 111
        Height = 60
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          111
          60)
        object UniEdit7CloneCloneCloneCloneClone: TUniEdit
          Left = 0
          Top = 21
          Width = 110
          Height = 38
          Hint = '[['#13#10'label:200 left center Teste Label'#13#10']]'
          CharCase = ecUpperCase
          Text = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
    end
    object rcBlock390: TUniContainerPanel
      Tag = 4
      Left = 44
      Top = 1147
      Width = 362
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 12
    end
  end
  object rcSweetAlert: TUniSweetAlert
    Title = 'Title'
    ConfirmButtonText = 'OK'
    CancelButtonText = 'Cancel'
    ImageIndex = 0
    Padding = 20
    FocusCancel = True
    Left = 934
    Top = 10
  end
end
