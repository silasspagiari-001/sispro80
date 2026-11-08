object frmDEMO_MESSAGES: TfrmDEMO_MESSAGES
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
    Cursor = crHandPoint
    Hint = ''
    Align = alClient
    Color = 15395562
    TabOrder = 0
    ScrollHeight = 807
    ScrollWidth = 970
    ScrollY = 65
    object rcBlock10: TUniContainerPanel
      Tag = 4
      Left = 25
      Top = -46
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 0
      object UniLabel35: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 717
        Height = 31
        Hint = '[[bsh6:|cls:left-center]]'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = 'Messages and Dinamic Objects Alignment'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock1000: TUniContainerPanel
      Tag = 4
      Left = 62
      Top = 699
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 1
    end
    object rcBlock128: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 740
      Top = 13
      Width = 230
      Height = 215
      Hint = 
        '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 | round:no | cls:card-info-box' +
        '-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 2
      object UniContainerPanel1: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 230
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel18: TUniLabel
          AlignWithMargins = True
          Left = 12
          Top = 9
          Width = 199
          Height = 23
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'rc_ShowInputBox / YesNo'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniContainerPanel4: TUniContainerPanel
        Left = 10
        Top = 52
        Width = 193
        Height = 39
        Hint = '[['#13#10'center:parent x'#13#10']]'
        ParentColor = False
        TabOrder = 2
        object chkPassword: TUniLabel
          Left = 6
          Top = 8
          Width = 20
          Height = 20
          Hint = '[[bschk:0]]'
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'x'
          ParentFont = False
          Font.Height = -20
          Font.Name = 'Calibri'
          Font.Style = [fsUnderline]
          ParentColor = False
          Color = clBtnFace
          TabOrder = 1
        end
        object UniLabel2: TUniLabel
          Left = 32
          Top = 10
          Width = 59
          Height = 18
          Hint = '[['#13#10'align:chkPassword t:5 l:23'#13#10']]'
          Caption = 'Password'
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 2
        end
        object chkPeriod: TUniLabel
          Left = 108
          Top = 9
          Width = 20
          Height = 20
          Hint = '[[bschk:0]]'
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'x'
          ParentFont = False
          Font.Height = -20
          Font.Name = 'Calibri'
          Font.Style = [fsUnderline]
          ParentColor = False
          Color = clBtnFace
          TabOrder = 3
        end
        object Period: TUniLabel
          Left = 134
          Top = 11
          Width = 41
          Height = 18
          Hint = '[['#13#10'align:chkPeriod t:5 l:23'#13#10']]'
          Caption = 'Period'
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 4
        end
      end
      object btnQuestionInput: TUniBitBtn
        AlignWithMargins = True
        Left = 41
        Top = 105
        Width = 80
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue ButtonRoundest | '#13#10'cente' +
          'r:parent x:-74 y:55'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Question'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = btnQuestionInputClick
      end
      object btnInputShow: TUniBitBtn
        AlignWithMargins = True
        Left = 117
        Top = 115
        Width = 80
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue ButtonRoundest | '#13#10'cente' +
          'r:parent x:74 y:55'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Input'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 4
        OnClick = btnInputShowClick
      end
      object UniBitBtn11: TUniBitBtn
        AlignWithMargins = True
        Left = 42
        Top = 149
        Width = 155
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue ButtonRoundest | '#13#10'align' +
          ':btnQuestionInput l:0 b:4|'#13#10'no-focus:'#13#10']]'#13#10
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Proccess'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 5
        OnClick = UniBitBtn11Click
      end
    end
    object rcBlock126: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 496
      Top = 11
      Width = 230
      Height = 215
      Hint = 
        '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 | round:no | cls:card-info-box' +
        '-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 3
      object UniContainerPanel2: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 230
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel17: TUniLabel
          AlignWithMargins = True
          Left = 10
          Top = 7
          Width = 123
          Height = 23
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'rc_ShowToaster'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object btnToastSucces: TUniBitBtn
        AlignWithMargins = True
        Left = 15
        Top = 42
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineGreen ButtonRounded| '#13#10'pos-l:' +
          '10 | '#13#10'pos-t:52'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Success'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = btnToastSuccesClick
      end
      object btnToastWarning: TUniBitBtn
        AlignWithMargins = True
        Left = 6
        Top = 146
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineOrange ButtonRounded| '#13#10'pos-l' +
          ':10 | '#13#10'pos-b:44'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Warning'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = btnToastWarningClick
      end
      object btnToastError: TUniBitBtn
        AlignWithMargins = True
        Left = 133
        Top = 139
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineRed ButtonRounded| '#13#10'pos-r:80' +
          ' | '#13#10'pos-b:44'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Error'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 4
        OnClick = btnToastErrorClick
      end
      object btnToastInfo: TUniBitBtn
        AlignWithMargins = True
        Left = 141
        Top = 54
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue ButtonRounded| '#13#10'pos-r:8' +
          '0 | '#13#10'pos-t:52'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Info'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 5
        OnClick = btnToastInfoClick
      end
      object chkSound: TUniLabel
        Left = 74
        Top = 107
        Width = 20
        Height = 20
        Hint = '[[bschk:0 | center:parent x:-24 y:42]]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'x'
        ParentFont = False
        Font.Height = -20
        Font.Name = 'Calibri'
        Font.Style = [fsUnderline]
        ParentColor = False
        Color = clBtnFace
        TabOrder = 6
      end
      object UniLabel4: TUniLabel
        Left = 104
        Top = 110
        Width = 49
        Height = 20
        Hint = '[['#13#10'align:chkSound t:5 l:23'#13#10'/*center:parent x:32 y:50*/'#13#10']]'
        AutoSize = False
        Caption = 'Sound'
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        TabOrder = 7
      end
    end
    object rcBlock124: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 251
      Top = 15
      Width = 230
      Height = 215
      Hint = 
        '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 | round:no | cls:card-info-box' +
        '-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 4
      object paSweetHeader: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 230
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel16: TUniLabel
          AlignWithMargins = True
          Left = 9
          Top = 4
          Width = 151
          Height = 23
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'rc_ShowSweetAlert'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object btnSweetSuccess: TUniBitBtn
        AlignWithMargins = True
        Left = 13
        Top = 59
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineGreen | '#13#10'scale:parent w:45% ' +
          '| '#13#10'pos-l:5%'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Success'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = btnSweetSuccessClick
      end
      object btnSweetWarning: TUniBitBtn
        AlignWithMargins = True
        Left = 26
        Top = 99
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineOrange | '#13#10'align:btnSweetSucc' +
          'ess t:h+5 l:0 | '#13#10'scale:parent w:45%'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Warning'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = btnSweetWarningClick
      end
      object btnSweetError: TUniBitBtn
        AlignWithMargins = True
        Left = 157
        Top = 107
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineRed | '#13#10'align:btnSweetWarning' +
          ' t:0 r:5 | '#13#10'scale:parent w:45%'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Error'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 4
        OnClick = btnSweetErrorClick
      end
      object btnSweetInfo: TUniBitBtn
        AlignWithMargins = True
        Left = 148
        Top = 49
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue | '#13#10'align:btnSweetSucces' +
          's t:0 r:5 | '#13#10'scale:parent w:45%'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Info'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 5
        OnClick = btnSweetInfoClick
      end
      object btnSweetQuestion: TUniBitBtn
        AlignWithMargins = True
        Left = 26
        Top = 137
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineOrange | '#13#10'align:btnSweetWarn' +
          'ing t:h+5 l:0 | '#13#10'scale:parent w:45%'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Question'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 6
        OnClick = btnSweetQuestionClick
      end
    end
    object rcBlock122: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 9
      Top = 15
      Width = 230
      Height = 215
      Hint = 
        '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 | round:no | cls:card-info-box' +
        '-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        230
        215)
      object UniContainerPanel3: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 230
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel15: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 7
          Width = 135
          Height = 23
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'rc_ShowMessage'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniBitBtn1: TUniBitBtn
        AlignWithMargins = True
        Left = 88
        Top = 94
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineRed ButtonRounded| '#13#10'center:p' +
          'arent x:74 y:35'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Error'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = UniBitBtn1Click
      end
      object btnSuccess1: TUniBitBtn
        AlignWithMargins = True
        Left = 6
        Top = 52
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineGreen ButtonRounded| '#13#10'center' +
          ':parent x:-74 y:-42'#13#10']]'#13#10
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Success'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = btnSuccess1Click
      end
      object btnShowMsgInfo: TUniBitBtn
        AlignWithMargins = True
        Left = 88
        Top = 49
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue ButtonRounded| '#13#10'center:' +
          'parent x:74 y:-42'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Info'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 4
        OnClick = btnShowMsgInfoClick
      end
      object btnShowWarning: TUniBitBtn
        AlignWithMargins = True
        Left = 6
        Top = 96
        Width = 70
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineOrange ButtonRounded| '#13#10'cente' +
          'r:parent x:-74 y:35'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Warning'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 5
        OnClick = btnShowWarningClick
      end
      object paLottie: TUniContainerPanel
        Left = 16
        Top = 157
        Width = 121
        Height = 49
        Hint = '[['#13#10'center:parent x |'#13#10#13#10']]'
        ParentColor = False
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
        object swtAnims: TUniLabel
          Left = 65
          Top = 13
          Width = 33
          Height = 24
          Hint = '[[bsswt:0]]'
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
        object UniLabel1: TUniLabel
          Left = 10
          Top = 18
          Width = 32
          Height = 15
          Hint = ''
          Caption = 'Lottie'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 2
        end
      end
      object edLottieFile: TUniEdit
        Left = 172
        Top = 167
        Width = 47
        Height = 38
        Hint = ''
        Enabled = False
        Visible = False
        Text = ''
        ParentFont = False
        Font.Height = -15
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 7
        ClearButton = True
      end
    end
    object rcBlock200: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 535
      Top = 503
      Width = 390
      Height = 190
      Hint = '[[cols:xs-12 sm-12 md-6 | round:no | cls:card-info-box-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 6
      object UniContainerPanel3Clone: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 390
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel22: TUniLabel
          AlignWithMargins = True
          Left = 14
          Top = 7
          Width = 218
          Height = 23
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'rc_ShowMessage With Align'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniBitBtn1Clone: TUniBitBtn
        AlignWithMargins = True
        Left = 173
        Top = 97
        Width = 160
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineRed ButtonRounded| '#13#10'center:p' +
          'arent x:164 y:90'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Error: Align Bottom'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = UniBitBtn1CloneClick
      end
      object btnSuccess1Clone: TUniBitBtn
        AlignWithMargins = True
        Left = 6
        Top = 52
        Width = 160
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineGreen ButtonRounded| '#13#10'center' +
          ':parent x:-164 y:8'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Success: Align Top'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = btnSuccess1CloneClick
      end
      object btnShowMsgInfoClone: TUniBitBtn
        AlignWithMargins = True
        Left = 173
        Top = 52
        Width = 160
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue ButtonRounded| '#13#10'center:' +
          'parent x:164 y:8'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Info: Align Right'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 4
        OnClick = btnShowMsgInfoCloneClick
      end
      object btnShowWarningClone: TUniBitBtn
        AlignWithMargins = True
        Left = 6
        Top = 96
        Width = 160
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineOrange ButtonRounded| '#13#10'cente' +
          'r:parent x:-164 y:90'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Warning: Align Left'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 5
        OnClick = btnShowWarningCloneClick
      end
    end
    object rcBlock195: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 40
      Top = 503
      Width = 230
      Height = 190
      Hint = '[[cols:xs-12 sm-12 md-6  | round:no | cls:card-info-box-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 7
      object UniContainerPanel6: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 230
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel21: TUniLabel
          AlignWithMargins = True
          Left = 18
          Top = 15
          Width = 75
          Height = 23
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'rc_iGrowl'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniBitBtn2: TUniBitBtn
        AlignWithMargins = True
        Left = 29
        Top = 67
        Width = 80
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineGreen ButtonRounded| '#13#10'pos-l:' +
          '20 | '#13#10'pos-t:52'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Sample 1'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = UniBitBtn2Click
      end
      object UniBitBtn3: TUniBitBtn
        AlignWithMargins = True
        Left = 6
        Top = 96
        Width = 80
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineOrange ButtonRounded| '#13#10'pos-l' +
          ':20 | '#13#10'pos-b:60'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Sample 3'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = UniBitBtn3Click
      end
      object UniBitBtn4: TUniBitBtn
        AlignWithMargins = True
        Left = 121
        Top = 107
        Width = 80
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineRed ButtonRounded| '#13#10'pos-r:10' +
          '0 | '#13#10'pos-b:60'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Sample 4'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 4
        OnClick = UniBitBtn4Click
      end
      object UniBitBtn5: TUniBitBtn
        AlignWithMargins = True
        Left = 141
        Top = 54
        Width = 80
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue ButtonRounded| '#13#10'pos-r:1' +
          '00 | '#13#10'pos-t:52'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Sample 2'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 5
        OnClick = UniBitBtn5Click
      end
    end
    object rcBlock150: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 16
      Top = 239
      Width = 563
      Height = 249
      Hint = '[[cols:xs-12 sm-12 md-8 | round:no | cls:card-info-box-white]]'#13#10
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 8
      object rcBlock151: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 563
        Height = 42
        Hint = '[['#13#10'cols:12|'#13#10'round:t | '#13#10'cls:card-light|'#13#10'noborder-all'#13#10']]'
        ParentColor = False
        Color = clSilver
        TabOrder = 1
        object UniLabel20: TUniLabel
          AlignWithMargins = True
          Left = 16
          Top = 13
          Width = 196
          Height = 23
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'rc_ShowInputBoxCustom'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock152: TUniContainerPanel
        Left = 24
        Top = 54
        Width = 75
        Height = 40
        Hint = '[[cols:3]]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          75
          40)
        object btnCloseClone: TUniBitBtn
          AlignWithMargins = True
          Left = 0
          Top = 1
          Width = 73
          Height = 38
          Hint = '[[cls:ButtonDark ]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Edit'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnCloseCloneClick
        end
      end
      object rcBlock153: TUniContainerPanel
        Left = 103
        Top = 54
        Width = 75
        Height = 40
        Hint = '[[cols:3]]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          75
          40)
        object btnRedClone: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 38
          Hint = '[[cls:ButtonRed ]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Pass'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnRedCloneClick
        end
      end
      object rcBlock154: TUniContainerPanel
        Left = 187
        Top = 56
        Width = 75
        Height = 40
        Hint = '[[cols:3]]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          75
          40)
        object btnGreenClone: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 38
          Hint = '[[cls:ButtonGreen]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Date'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnGreenCloneClick
        end
      end
      object rcBlock184: TUniContainerPanel
        Left = 19
        Top = 148
        Width = 75
        Height = 40
        Hint = '[[cols:3]]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          75
          40)
        object btnGrayClone: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 38
          Hint = '[[cls:ButtonGray ]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'RadioBtn'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnGrayCloneClick
        end
      end
      object rcBlock186: TUniContainerPanel
        Left = 105
        Top = 148
        Width = 75
        Height = 40
        Hint = '[[cols:3]]'
        ParentColor = False
        TabOrder = 6
        DesignSize = (
          75
          40)
        object btnSilverClone: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 38
          Hint = '[[cls:ButtonSilver]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Number'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnSilverCloneClick
        end
      end
      object rcBlock188: TUniContainerPanel
        Left = 185
        Top = 148
        Width = 75
        Height = 40
        Hint = '[[cols:3]]'
        ParentColor = False
        TabOrder = 7
        DesignSize = (
          75
          40)
        object btnCrudClone: TUniBitBtn
          AlignWithMargins = True
          Left = -1
          Top = 1
          Width = 73
          Height = 38
          Hint = '[[cls:ButtonThemeCrud ]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'F.Number'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnCrudCloneClick
        end
      end
      object rcBlock164: TUniContainerPanel
        Left = 19
        Top = 106
        Width = 75
        Height = 40
        Hint = '[[cols:3]]'
        ParentColor = False
        TabOrder = 8
        DesignSize = (
          75
          40)
        object btnOrangeClone: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 38
          Hint = '[[cls:ButtonOrange]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Spin'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnOrangeCloneClick
        end
      end
      object rcBlock168: TUniContainerPanel
        Left = 105
        Top = 106
        Width = 75
        Height = 40
        Hint = '[[cols:3]]'
        ParentColor = False
        TabOrder = 9
        DesignSize = (
          75
          40)
        object btnBlueClone: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 38
          Hint = '[['#13#10'cls:ButtonBlue |'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Memo'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnBlueCloneClick
        end
      end
      object rcBlock170: TUniContainerPanel
        Left = 185
        Top = 106
        Width = 75
        Height = 40
        Hint = '[[cols:3]]'
        ParentColor = False
        TabOrder = 10
        DesignSize = (
          75
          40)
        object btnDarkClone: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 38
          Hint = '[[cls:ButtonBlueDark ]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'CheckBx'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnDarkCloneClick
        end
      end
      object rcBlock172: TUniContainerPanel
        Left = 269
        Top = 98
        Width = 75
        Height = 40
        Hint = '[[cols:3]]'
        ParentColor = False
        TabOrder = 11
        DesignSize = (
          75
          40)
        object UniBitBtn6: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 1
          Width = 73
          Height = 38
          Hint = '[[cls:ButtonDark ]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'RC FORMS'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = UniBitBtn6Click
        end
      end
      object rcBloc: TUniContainerPanel
        Left = 266
        Top = 179
        Width = 75
        Height = 40
        Hint = ''
        Enabled = False
        Visible = False
        ParentColor = False
        TabOrder = 12
        DesignSize = (
          75
          40)
        object btnComboBox: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 38
          Hint = '[[cls:ButtonDark ]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'ComboBox'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnComboBoxClick
        end
      end
      object rcBlock156: TUniContainerPanel
        Left = 268
        Top = 56
        Width = 75
        Height = 40
        Hint = '[[cols:3]]'
        ParentColor = False
        TabOrder = 13
        DesignSize = (
          75
          40)
        object UniBitBtn8: TUniBitBtn
          AlignWithMargins = True
          Left = 3
          Top = 1
          Width = 73
          Height = 38
          Hint = '[[cls:ButtonDark ]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'RadioOK'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = UniBitBtn8Click
        end
      end
    end
    object rcBlock175: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 621
      Top = 240
      Width = 230
      Height = 249
      Hint = '[[cols:xs-12 sm-12 md-4 | round:no | cls:card-info-box-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 9
      object UniContainerPanel8: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 230
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel19: TUniLabel
          AlignWithMargins = True
          Left = 14
          Top = 11
          Width = 150
          Height = 23
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'ShowHide Function'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniBitBtn7: TUniBitBtn
        AlignWithMargins = True
        Left = 39
        Top = 105
        Width = 80
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue ButtonRoundest | '#13#10'cente' +
          'r:parent x:-74 y:65'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Center'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = UniBitBtn7Click
      end
      object btnObject: TUniBitBtn
        AlignWithMargins = True
        Left = 123
        Top = 103
        Width = 80
        Height = 36
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue ButtonRoundest | '#13#10'cente' +
          'r:parent x:74 y:65'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Object'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 3
        OnClick = btnObjectClick
      end
    end
  end
  object paPanelOptions: TUniContainerPanel
    Left = 864
    Top = 183
    Width = 259
    Height = 253
    Hint = '[['#13#10'round:no | '#13#10'cls:card-info-box-white |'#13#10']]'
    Visible = False
    ParentColor = False
    Color = clWhite
    TabOrder = 1
    DesignSize = (
      259
      253)
    object rcBlock2000: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 259
      Height = 42
      Hint = '[[cols:12|noborder-all|round:t | cls:card-light]]'#13#10#13#10
      ParentColor = False
      Color = clSilver
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        259
        42)
      object UniLabel9: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 0
        Width = 253
        Height = 42
        Hint = '[[bsh6:|cls:left-center]]'
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        AutoSize = False
        Caption = 'ShowHide Function'
        Align = alClient
        ParentFont = False
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object labClosePanelOptions: TUniLabel
        Left = 220
        Top = 8
        Width = 33
        Height = 26
        Cursor = crHandPoint
        Hint = '[['#13#10'ico:fas-times |'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = '<'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSilver
        TabOrder = 2
        OnClick = labClosePanelOptionsClick
      end
    end
    object Label5: TUniLabel
      Left = 67
      Top = 86
      Width = 29
      Height = 18
      Hint = ''
      Caption = 'Start'
      ParentFont = False
      Font.Height = -15
      Font.Name = 'Calibri'
      TabOrder = 2
    end
    object UniLabel10: TUniLabel
      Left = 67
      Top = 128
      Width = 23
      Height = 18
      Hint = ''
      Caption = 'End'
      ParentFont = False
      Font.Height = -15
      Font.Name = 'Calibri'
      TabOrder = 3
    end
    object btnOk: TUniBitBtn
      Left = 15
      Top = 200
      Width = 100
      Height = 36
      Hint = ''
      Caption = 'Run'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Height = -15
      Font.Name = 'Calibri'
      TabOrder = 4
      OnClick = btnOkClick
    end
    object btnCancel: TUniBitBtn
      Left = 141
      Top = 200
      Width = 100
      Height = 36
      Hint = 'Cancel'
      Caption = 'Desbloquear'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.Height = -15
      Font.Name = 'Calibri'
      TabOrder = 5
    end
    object edIni: TUniNumberEdit
      Left = 127
      Top = 81
      Width = 74
      Height = 29
      Hint = '[['#13#10'valid:>0'#13#10']]'
      ParentFont = False
      Font.Height = -15
      Font.Name = 'Calibri'
      TabOrder = 6
      DecimalSeparator = ','
    end
    object edEnd: TUniNumberEdit
      Left = 127
      Top = 116
      Width = 74
      Height = 29
      Hint = '[['#13#10'valid:>0'#13#10']]'
      ParentFont = False
      Font.Height = -15
      Font.Name = 'Calibri'
      TabOrder = 7
      DecimalSeparator = ','
    end
  end
  object paPanelOpt2: TUniContainerPanel
    Left = 935
    Top = 359
    Width = 285
    Height = 245
    Hint = '[['#13#10'round:no | '#13#10'cls:card-info-box-white |'#13#10']]'
    Visible = False
    ParentColor = False
    Color = clWhite
    TabOrder = 2
    DesignSize = (
      285
      245)
    object rcBlock2200: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 285
      Height = 42
      Hint = '[[cols:12|noborder-all|round:t | cls:card-light]]'
      ParentColor = False
      Color = clSilver
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        285
        42)
      object UniLabel12: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 0
        Width = 279
        Height = 42
        Hint = '[[bsh6:|cls:left-center]]'
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        AutoSize = False
        Caption = 'ShowHide Function'
        Align = alClient
        ParentFont = False
        Font.Color = clGray
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniLabel13: TUniLabel
        Left = 246
        Top = 8
        Width = 33
        Height = 26
        Cursor = crHandPoint
        Hint = '[['#13#10'ico:fas-times |'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = '<'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSilver
        TabOrder = 2
        OnClick = UniLabel13Click
      end
    end
    object UniLabel14: TUniLabel
      Left = 71
      Top = 105
      Width = 29
      Height = 18
      Hint = ''
      Caption = 'Start'
      ParentFont = False
      Font.Height = -15
      Font.Name = 'Calibri'
      TabOrder = 2
    end
    object UniBitBtn9: TUniBitBtn
      Left = 15
      Top = 191
      Width = 111
      Height = 36
      Hint = ''
      Caption = 'Run'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Height = -15
      Font.Name = 'Calibri'
      TabOrder = 3
      OnClick = UniBitBtn9Click
    end
    object UniBitBtn10: TUniBitBtn
      Left = 156
      Top = 192
      Width = 111
      Height = 36
      Hint = 'Cancel'
      Caption = 'Desbloquear'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.Height = -15
      Font.Name = 'Calibri'
      TabOrder = 4
    end
    object UniNumberEdit1: TUniNumberEdit
      Left = 131
      Top = 100
      Width = 74
      Height = 29
      Hint = '[['#13#10'valid:>0'#13#10']]'
      ParentFont = False
      Font.Height = -15
      Font.Name = 'Calibri'
      TabOrder = 5
      DecimalSeparator = ','
    end
  end
  object rcSweetAlert: TUniSweetAlert
    Title = 'Title'
    ConfirmButtonText = 'OK'
    CancelButtonText = 'Cancel'
    ImageIndex = 0
    Padding = 20
    FocusCancel = True
    Left = 952
    Top = 20
  end
end
