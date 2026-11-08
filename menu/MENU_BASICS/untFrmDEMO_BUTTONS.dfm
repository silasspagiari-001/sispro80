object frmDEMO_BUTTONS: TfrmDEMO_BUTTONS
  Left = 0
  Top = 0
  Width = 1000
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
    Width = 1000
    Height = 677
    Cursor = crHandPoint
    Hint = ''
    Align = alClient
    Color = 15395562
    TabOrder = 0
    ScrollHeight = 1117
    ScrollWidth = 895
    ScrollY = 442
    object rcBlock10: TUniContainerPanel
      Tag = 4
      Left = 25
      Top = -423
      Width = 600
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 0
      DesignSize = (
        600
        43)
      object UniLabel35: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 588
        Height = 31
        Hint = '[[bsh5:|cls:left-center]]'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = 'Buttons'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniBitBtn1: TUniBitBtn
        AlignWithMargins = True
        Left = 564
        Top = 7
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
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = UniBitBtn1Click
      end
    end
    object rcBlock2000: TUniContainerPanel
      Tag = 4
      Left = 67
      Top = 630
      Width = 553
      Height = 45
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 1
    end
    object rcBlock19: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 13
      Top = -350
      Width = 278
      Height = 240
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'hr-childs:xs-exp sm-exp md-fix | '#13 +
        #10'cls:card-info-box-white |'#13#10'round:no | '#13#10']]'#13#10
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      AutoScroll = True
      TabOrder = 2
      ScrollHeight = 240
      ScrollWidth = 278
      object rcBlock20: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 251
        Height = 42
        Hint = '[['#13#10'cols:12 | '#13#10'noborder-all | '#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
        ParentColor = False
        Color = 14802398
        TabOrder = 1
        object UniLabel1: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 6
          Width = 102
          Height = 19
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'Buttons Default'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock21: TUniContainerPanel
        Left = 24
        Top = 60
        Width = 75
        Height = 40
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          75
          40)
        object btnClose: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 38
          Hint = '[['#13#10'cls:ButtonDark |'#13#10'badge:3 color:warning|'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Dark'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock22: TUniContainerPanel
        Left = 103
        Top = 60
        Width = 75
        Height = 40
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          75
          40)
        object btnRed: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 1
          Width = 73
          Height = 38
          Hint = '[[cls:ButtonRed ]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Red'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock23: TUniContainerPanel
        Left = 187
        Top = 62
        Width = 75
        Height = 40
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          75
          40)
        object btnGreen: TUniBitBtn
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
          Caption = 'Green'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock27: TUniContainerPanel
        Left = 19
        Top = 162
        Width = 75
        Height = 40
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          75
          40)
        object btnGray: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 38
          Hint = '[[cls:ButtonGray ButtonRoundest]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Gray'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock28: TUniContainerPanel
        Left = 105
        Top = 162
        Width = 75
        Height = 40
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 6
        DesignSize = (
          75
          40)
        object btnSilver: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 38
          Hint = '[[cls:ButtonSilver ButtonRoundest btn-font-black]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Silver'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock29: TUniContainerPanel
        Left = 185
        Top = 162
        Width = 75
        Height = 40
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 7
        DesignSize = (
          75
          40)
        object btnCrud: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 38
          Hint = '[[cls:ButtonThemeCrud ButtonRoundest]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Themed'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock24: TUniContainerPanel
        Left = 19
        Top = 112
        Width = 75
        Height = 40
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 8
        DesignSize = (
          75
          40)
        object btnOrange: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 38
          Hint = '[[cls:ButtonOrange ButtonRounded ]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Orange'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock25: TUniContainerPanel
        Left = 105
        Top = 112
        Width = 75
        Height = 40
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 9
        DesignSize = (
          75
          40)
        object btnBlue: TUniBitBtn
          AlignWithMargins = True
          Left = 0
          Top = 1
          Width = 73
          Height = 38
          Hint = '[['#13#10'cls:ButtonBlue ButtonRounded |'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Blue'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock26: TUniContainerPanel
        Left = 185
        Top = 112
        Width = 75
        Height = 40
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 10
        DesignSize = (
          75
          40)
        object btnDark: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 73
          Height = 38
          Hint = '[[cls:ButtonBlueDark ButtonRounded ]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'BlueDark'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
    end
    object rcBlock50: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 26
      Top = -106
      Width = 325
      Height = 231
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'round:no | '#13#10'cls:card-info-box-whi' +
        'te |'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 3
      object UniScrollBox3Clone: TUniScrollBox
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 325
        Height = 225
        Hint = ''
        Margins.Left = 0
        Margins.Right = 0
        Align = alClient
        TabOrder = 1
        ScrollHeight = 189
        ScrollWidth = 311
        object UniContainerPanel1: TUniContainerPanel
          Left = 9
          Top = 55
          Width = 302
          Height = 134
          Hint = '[['#13#10'center:parent x'#13#10']]'
          ParentColor = False
          TabOrder = 0
          object btnLink: TUniBitBtn
            AlignWithMargins = True
            Left = 2
            Top = 2
            Width = 297
            Height = 85
            Hint = 
              '[['#13#10'ico:fas-link 2x | '#13#10'ico-pos:up |'#13#10'cls:ButtonOutline ButtonOu' +
              'tlineRed ButtonRound| '#13#10'append'#13#10']]'#13#10' '
            Margins.Left = 6
            Margins.Top = 4
            Margins.Right = 6
            Margins.Bottom = 4
            Caption = 'Show Query Field<br>on frmCadCLIENTES'
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -15
            Font.Name = 'Calibri'
            TabOrder = 1
            OnClick = btnLinkClick
          end
          object btnPaste: TUniBitBtn
            AlignWithMargins = True
            Left = 2
            Top = 95
            Width = 144
            Height = 38
            Hint = '[['#13#10'ico:far-paste | '#13#10'cls:ButtonRed | '#13#10'append '#13#10']]'
            Margins.Left = 6
            Margins.Top = 4
            Margins.Right = 6
            Margins.Bottom = 4
            Caption = 'Show edCliName'
            ParentFont = False
            Font.Height = -15
            Font.Name = 'Calibri'
            TabOrder = 2
            OnClick = btnPasteClick
          end
          object btnCopy: TUniBitBtn
            AlignWithMargins = True
            Left = 155
            Top = 94
            Width = 144
            Height = 38
            Hint = '[['#13#10'ico:far-copy | '#13#10'cls:ButtonGreen | '#13#10'append'#13#10']]'
            Margins.Left = 6
            Margins.Top = 4
            Margins.Right = 6
            Margins.Bottom = 4
            Caption = 'rc_ChangeCls'
            ParentFont = False
            Font.Height = -15
            Font.Name = 'Calibri'
            TabOrder = 3
            OnClick = btnCopyClick
          end
        end
        object rcBlock51: TUniContainerPanel
          Left = 3
          Top = 2
          Width = 271
          Height = 42
          Hint = '[['#13#10'cols:12|'#13#10'noborder-all | '#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
          ParentColor = False
          Color = 14802398
          TabOrder = 1
          object labBtnWithIcon: TUniLabel
            AlignWithMargins = True
            Left = 6
            Top = 6
            Width = 116
            Height = 18
            Hint = 
              '[['#13#10'cls:rc-label-clear |'#13#10'center:parent y|'#13#10'pos-l:10|'#13#10'append'#13#10']' +
              ']'
            Margins.Left = 6
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Caption = 'Buttons With Icons'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -15
            Font.Name = 'Calibri'
            ParentColor = False
            Color = 14802398
            TabOrder = 1
          end
        end
      end
    end
    object UniBitBtn2: TUniBitBtn
      Left = 678
      Top = -340
      Width = 95
      Height = 89
      Hint = 
        '[['#13#10'cls:ButtonOutline ButtonOutlineGreen btn-font-green | '#13#10'ico-' +
        'img:files/images/avatars/avatar_9.png|'#13#10'append'#13#10']]'#13#10#13#10#13#10#13#10
      Visible = False
      Caption = 'Show'
      TabOrder = 5
    end
    object UniBitBtn3: TUniBitBtn
      Left = 800
      Top = -342
      Width = 95
      Height = 89
      Hint = 
        '[['#13#10'cls:ButtonOutline ButtonOutlineGreen btn-font-green | '#13#10'appe' +
        'nd'#13#10']]'
      Visible = False
      Caption = 
        '<img id="userimg" class="avatar" style="height:42px;width:42px;"' +
        ' src="files/images/avatars/avatar_9.png" alt="User Img"><br><spa' +
        'n class="">Show</span>'#13#10
      TabOrder = 6
    end
    object rcBlock70: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 366
      Top = -109
      Width = 407
      Height = 231
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'hr-childs:xs-exp sm-exp md-fix | '#13 +
        #10'cls:card-info-box-white |'#13#10'round:no | '#13#10']]'#13#10
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      AutoScroll = True
      TabOrder = 7
      ScrollHeight = 231
      ScrollWidth = 407
      object rcBlock75: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 251
        Height = 42
        Hint = '[['#13#10'cols:12 | '#13#10'noborder-all | '#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
        ParentColor = False
        Color = 14802398
        TabOrder = 1
        object UniLabel1Clone: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 6
          Width = 74
          Height = 19
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'Button Spin'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock80: TUniContainerPanel
        Left = 14
        Top = 54
        Width = 80
        Height = 40
        Hint = '[[cols:xs-12 sm-12 md-3]]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          80
          40)
        object btnSpin: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 78
          Height = 38
          Hint = '[['#13#10'ico:fas-sync-alt|'#13#10'cls:ButtonGreen |'#13#10'append'#13#10']]'
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
          OnClick = btnSpinClick
        end
      end
      object rcBlock81: TUniContainerPanel
        Left = 106
        Top = 54
        Width = 80
        Height = 40
        Hint = '[[cols:xs-12 sm-12 md-3]]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          80
          40)
        object UniBitBtn4: TUniBitBtn
          Tag = 1
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 78
          Height = 38
          Hint = '[['#13#10'ico:fas-heart|'#13#10'cls:ButtonGreen |'#13#10'append'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Beat'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnSpinClick
        end
      end
      object rcBlock82: TUniContainerPanel
        Left = 193
        Top = 52
        Width = 80
        Height = 40
        Hint = '[[cols:xs-12 sm-12 md-3]]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          80
          40)
        object UniBitBtn5: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 78
          Height = 38
          Hint = '[['#13#10'ico:fas-heart|'#13#10'cls:ButtonGreen |'#13#10'append'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Beat-Fade'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnSpinClick
        end
      end
      object rcBlock83: TUniContainerPanel
        Left = 286
        Top = 54
        Width = 80
        Height = 40
        Hint = '[[cols:xs-12 sm-12 md-3]]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          80
          40)
        object UniBitBtn6: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 78
          Height = 38
          Hint = '[['#13#10'ico:fas-ghost|'#13#10'cls:ButtonGreen |'#13#10'append'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Bounce'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnSpinClick
        end
      end
      object rcBlock84: TUniContainerPanel
        Left = 14
        Top = 102
        Width = 80
        Height = 40
        Hint = '[[cols:xs-12 sm-12 md-3]]'
        ParentColor = False
        TabOrder = 6
        DesignSize = (
          80
          40)
        object UniBitBtn7: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 78
          Height = 38
          Hint = '[['#13#10'ico:fas-download|'#13#10'cls:ButtonGreen |'#13#10'append'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Fade'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnSpinClick
        end
      end
      object rcBlock85: TUniContainerPanel
        Left = 101
        Top = 100
        Width = 80
        Height = 40
        Hint = '[[cols:xs-12 sm-12 md-3]]'
        ParentColor = False
        TabOrder = 7
        DesignSize = (
          80
          40)
        object UniBitBtn8: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 78
          Height = 38
          Hint = '[['#13#10'ico:fas-star|'#13#10'cls:ButtonGreen |'#13#10'append'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Flip'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnSpinClick
        end
      end
      object rcBlock86: TUniContainerPanel
        Left = 196
        Top = 102
        Width = 80
        Height = 40
        Hint = '[[cols:xs-12 sm-12 md-3]]'
        ParentColor = False
        TabOrder = 8
        DesignSize = (
          80
          40)
        object UniBitBtn9: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 78
          Height = 38
          Hint = '[['#13#10'ico:fas-envelope|'#13#10'cls:ButtonGreen |'#13#10'append'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Shake'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnSpinClick
        end
      end
      object rcBlock88: TUniContainerPanel
        Left = 284
        Top = 100
        Width = 80
        Height = 40
        Hint = '[[cols:xs-12 sm-12 md-3]]'
        Enabled = False
        Visible = False
        ParentColor = False
        TabOrder = 9
        DesignSize = (
          80
          40)
        object UniBitBtn11: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 78
          Height = 38
          Hint = '[['#13#10'ico:fas-sync-alt|'#13#10'cls:ButtonGreen |'#13#10'append'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Spin-Reverse'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnSpinClick
        end
      end
    end
    object rcBlock100: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 25
      Top = 135
      Width = 278
      Height = 200
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'round:no | '#13#10'cls:card-info-box-whi' +
        'te |'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 4
      object UniScrollBox3CloneClone: TUniScrollBox
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 278
        Height = 194
        Hint = ''
        Margins.Left = 0
        Margins.Right = 0
        Align = alClient
        TabOrder = 1
        ScrollHeight = 177
        ScrollWidth = 274
        object UniContainerPanel1Clone: TUniContainerPanel
          Left = 9
          Top = 60
          Width = 264
          Height = 117
          Hint = '[['#13#10'center:parent x'#13#10']]'
          ParentColor = False
          TabOrder = 0
          object Block1: TUniContainerPanel
            Left = 8
            Top = 10
            Width = 112
            Height = 100
            Hint = '[[cls:ButtonSilver]]'
            ParentColor = False
            TabOrder = 1
            DesignSize = (
              112
              100)
            object labEdit: TUniLabel
              Left = 0
              Top = 76
              Width = 112
              Height = 24
              Cursor = crHandPoint
              Hint = ''
              Margins.Left = 8
              Margins.Top = 8
              Margins.Right = 0
              Margins.Bottom = 4
              Alignment = taCenter
              TextConversion = txtHTML
              AutoSize = False
              Caption = 'Pessoas'
              Anchors = [akLeft, akTop, akRight, akBottom]
              ParentFont = False
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Calibri Light'
              ParentColor = False
              Color = clSilver
              TabOrder = 1
            end
            object UniLabel3: TUniLabel
              Left = 24
              Top = 9
              Width = 48
              Height = 48
              Cursor = crHandPoint
              Hint = '[['#13#10'center:parent x'#13#10']]'
              Margins.Left = 8
              Margins.Top = 8
              Margins.Right = 0
              Margins.Bottom = 4
              Alignment = taCenter
              TextConversion = txtHTML
              AutoSize = False
              Caption = 
                '<img id="userimg" class="" style="height:42px;width:42px;" src="' +
                'files/images/avatars/avatar_9.png" alt="User Img">'
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clBlack
              Font.Height = -19
              Font.Name = 'Calibri Light'
              ParentColor = False
              Color = clSilver
              TabOrder = 2
            end
            object paFrontBtn: TUniContainerPanel
              Left = 83
              Top = 56
              Width = 26
              Height = 31
              Hint = '[['#13#10'anchor:'#13#10']]'
              ParentColor = False
              TabOrder = 3
              OnClick = paFrontBtnClick
            end
          end
          object Block2: TUniContainerPanel
            Left = 144
            Top = 10
            Width = 112
            Height = 100
            Hint = '[[cls:ButtonWhite]]'
            ParentColor = False
            TabOrder = 2
            DesignSize = (
              112
              100)
            object UniLabel4: TUniLabel
              Left = 0
              Top = 74
              Width = 112
              Height = 24
              Cursor = crHandPoint
              Hint = ''
              Margins.Left = 8
              Margins.Top = 8
              Margins.Right = 0
              Margins.Bottom = 4
              Alignment = taCenter
              TextConversion = txtHTML
              AutoSize = False
              Caption = 'Inadimplente'
              Anchors = [akLeft, akTop, akRight, akBottom]
              ParentFont = False
              Font.Color = clBlack
              Font.Height = -15
              Font.Name = 'Calibri Light'
              ParentColor = False
              Color = clSilver
              TabOrder = 1
            end
            object UniLabel5: TUniLabel
              Left = 24
              Top = 9
              Width = 50
              Height = 50
              Hint = 
                '[['#13#10'ico-stack:fas-hand-holding-usd cls:color-green size:1x|'#13#10'cen' +
                'ter:parent x'#13#10']]'#13#10#13#10#13#10#13#10
              Alignment = taCenter
              TextConversion = txtHTML
              AutoSize = False
              Caption = 'Icon'
              Anchors = [akLeft, akTop, akRight, akBottom]
              ParentFont = False
              Font.Color = clBlack
              Font.Height = -21
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              TabOrder = 3
            end
            object paFrontBtn2: TUniContainerPanel
              Left = 83
              Top = 56
              Width = 26
              Height = 31
              Hint = '[['#13#10'anchor:'#13#10']]'
              ParentColor = False
              TabOrder = 2
              OnClick = paFrontBtnClick
            end
          end
        end
        object rcBlock110: TUniContainerPanel
          Left = 3
          Top = 2
          Width = 271
          Height = 42
          Hint = '[['#13#10'cols:12|'#13#10'noborder-all | '#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
          ParentColor = False
          Color = 14802398
          TabOrder = 1
          object UniLabel42CloneClone: TUniLabel
            AlignWithMargins = True
            Left = 6
            Top = 6
            Width = 102
            Height = 18
            Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
            Margins.Left = 6
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Caption = 'Desined Buttons'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -15
            Font.Name = 'Calibri'
            ParentColor = False
            Color = 14802398
            TabOrder = 1
          end
        end
      end
    end
    object rcBlock1010: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 411
      Top = 134
      Width = 484
      Height = 201
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'hr-childs:xs-exp sm-exp md-fix | '#13 +
        #10'cls:card-info-box-white |'#13#10'round:no | '#13#10']]'#13#10
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      AutoScroll = True
      TabOrder = 8
      ScrollHeight = 201
      ScrollWidth = 484
      object rcBlock1020: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 251
        Height = 42
        Hint = '[['#13#10'cols:12 | '#13#10'noborder-all | '#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
        ParentColor = False
        Color = 14802398
        TabOrder = 1
        object UniLabel1CloneClone: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 6
          Width = 336
          Height = 19
          Hint = 
            '[['#13#10'caption-dots:mobile-v-35|'#13#10'cls:rc-label-clear|'#13#10'center:paren' +
            't y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'FontAwesome 6 - (Light, Duotone, Thin only 6 PRO )'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock1030: TUniContainerPanel
        Left = 14
        Top = 54
        Width = 80
        Height = 40
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          80
          40)
        object btnSpinClone: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 78
          Height = 38
          Hint = 
            '[['#13#10'ico:fas-pen-to-square|'#13#10'cls:ButtonOutline ButtonOutlineGray ' +
            'ButtonRoundest|'#13#10'append'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Solid'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock1040: TUniContainerPanel
        Left = 106
        Top = 54
        Width = 80
        Height = 40
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          80
          40)
        object UniBitBtn4Clone: TUniBitBtn
          Tag = 1
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 78
          Height = 38
          Hint = 
            '[['#13#10'ico:far-pen-to-square|'#13#10'cls:ButtonOutline ButtonOutlineGray ' +
            'ButtonRoundest|'#13#10'append'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Regular'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock1050: TUniContainerPanel
        Left = 193
        Top = 52
        Width = 80
        Height = 40
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          80
          40)
        object UniBitBtn5Clone: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 78
          Height = 38
          Hint = 
            '[['#13#10'ico:fal-pen-to-square|'#13#10'cls:ButtonOutline ButtonOutlineGray ' +
            'ButtonRoundest|'#13#10'append'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Light'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock1060: TUniContainerPanel
        Left = 14
        Top = 116
        Width = 80
        Height = 40
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          80
          40)
        object UniBitBtn6Clone: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 78
          Height = 38
          Hint = 
            '[['#13#10'ico:fad-pen-to-square|'#13#10'cls:ButtonOutline ButtonOutlineGray ' +
            'ButtonRoundest|'#13#10'append'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Duotone'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock1070: TUniContainerPanel
        Left = 102
        Top = 116
        Width = 80
        Height = 40
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 6
        DesignSize = (
          80
          40)
        object UniBitBtn7Clone: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 78
          Height = 38
          Hint = 
            '[['#13#10'ico:fat-pen-to-square|'#13#10'cls:ButtonOutline ButtonOutlineGray ' +
            'ButtonRoundest|'#13#10'append'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Thin'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock1080: TUniContainerPanel
        Left = 196
        Top = 116
        Width = 80
        Height = 40
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 7
        DesignSize = (
          80
          40)
        object UniBitBtn10: TUniBitBtn
          AlignWithMargins = True
          Left = 1
          Top = 1
          Width = 78
          Height = 38
          Hint = 
            '[['#13#10'ico:fasl-house|'#13#10'cls:ButtonOutline ButtonOutlineGray ButtonR' +
            'oundest|'#13#10'append'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Sharp'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
    end
    object rcBlock1200: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 59
      Top = 368
      Width = 333
      Height = 201
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'hr-childs:xs-exp sm-exp md-fix | '#13 +
        #10'cls:card-info-box-white |'#13#10'round:no | '#13#10']]'#13#10
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      AutoScroll = True
      TabOrder = 9
      ScrollHeight = 201
      ScrollWidth = 333
      object rcBlock1210: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 251
        Height = 42
        Hint = '[['#13#10'cols:12 | '#13#10'noborder-all | '#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
        ParentColor = False
        Color = 14802398
        TabOrder = 1
        object UniLabel1CloneCloneClone: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 6
          Width = 174
          Height = 19
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'Button Group ( Horizontal )'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock1220: TUniContainerPanel
        Left = 22
        Top = 98
        Width = 270
        Height = 39
        Hint = '[['#13#10'cols:xs-12 sm-12 md-6'#13#10']]'
        ParentColor = False
        TabOrder = 2
        object btn1: TUniBitBtn
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 90
          Height = 39
          Hint = 
            '[['#13#10'cls:ButtonGreen button-no-border-right|'#13#10'scale:parent w:33.3' +
            '3%'#13#10']]'
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 1
          Margins.Bottom = 0
          Caption = 'btn1'
          Align = alLeft
          TabOrder = 1
          ExplicitTop = -24
        end
        object btn2: TUniBitBtn
          AlignWithMargins = True
          Left = 91
          Top = 0
          Width = 90
          Height = 39
          Hint = 
            '[['#13#10'cls:ButtonGreen button-no-border-left-right|'#13#10'scale:parent w' +
            ':33.34%|'#13#10'no-focus:|'#13#10'/*align:btn1CloneClone t:0 r:0*/'#13#10']]'#13#10#13#10
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 1
          Margins.Bottom = 0
          Caption = 'btn2'
          Align = alLeft
          TabOrder = 2
          ExplicitTop = -16
        end
        object btn3: TUniBitBtn
          AlignWithMargins = True
          Left = 182
          Top = 0
          Width = 88
          Height = 39
          Hint = 
            '[['#13#10'cls:ButtonGreen button-no-border-left|'#13#10'scale:parent w:33.33' +
            '%|'#13#10'/*align:btn2CloneClone t:0 r:0*/'#13#10']]'
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'btn3'
          Align = alClient
          TabOrder = 3
          ExplicitTop = -24
        end
      end
      object rcBlock1320: TUniContainerPanel
        Left = 24
        Top = 145
        Width = 93
        Height = 39
        Hint = '[['#13#10'cols:xs-12 sm-12 md-6|'#13#10'round:all'#13#10']]'
        ParentColor = False
        Color = 4210688
        TabOrder = 3
        object btnGroupOpt: TUniBitBtn
          Left = 0
          Top = -2
          Width = 93
          Height = 38
          Hint = 
            '[['#13#10'btn-group:fas-envelope cls:ButtonGreen /*focus:off*/|'#13#10'btn-g' +
            'roup:fas-check cls:ButtonGreen /*focus:off*/|'#13#10'btn-group:fas-bar' +
            's cls:ButtonGreen /*focus:off*/|'#13#10']]'#13#10
          Caption = 'btnGroupOpt'
          TabStop = False
          TabOrder = 1
          OnClick = btnGroupOptClick
        end
      end
    end
    object rcBlock1230: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 457
      Top = 364
      Width = 354
      Height = 201
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'hr-childs:xs-exp sm-exp md-fix | '#13 +
        #10'cls:card-info-box-white |'#13#10'round:no | '#13#10']]'#13#10
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      AutoScroll = True
      TabOrder = 10
      ScrollHeight = 201
      ScrollWidth = 354
      object rcBlock1240: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 251
        Height = 42
        Hint = '[['#13#10'cols:12 | '#13#10'noborder-all | '#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
        ParentColor = False
        Color = 14802398
        TabOrder = 1
        object UniLabel1CloneCloneCloneClone: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 6
          Width = 157
          Height = 19
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'Button Group ( Vertical )'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object rcBlock1250: TUniContainerPanel
        Left = 8
        Top = 62
        Width = 147
        Height = 116
        Hint = '[['#13#10'cols:xs-12 sm-12 md-6'#13#10']]'
        ParentColor = False
        TabOrder = 2
        object btn1Down: TUniBitBtn
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 147
          Height = 38
          Hint = 
            '[['#13#10'cls:ButtonGreen button-no-border-bottom|'#13#10'pos-l:0|'#13#10'pos-t:0'#13 +
            #10']]'
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 1
          Caption = 'btn1'
          Align = alTop
          TabOrder = 1
        end
        object btn2Down: TUniBitBtn
          AlignWithMargins = True
          Left = 0
          Top = 39
          Width = 147
          Height = 38
          Hint = 
            '[['#13#10'cls:ButtonGreen button-no-border-top-bottom|'#13#10'no-focus:|'#13#10'al' +
            'ign:btn1Down b:0 r:0'#13#10']]'#13#10#13#10
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 1
          Caption = 'btn2'
          Align = alTop
          TabOrder = 2
        end
        object btn3Down: TUniBitBtn
          AlignWithMargins = True
          Left = 0
          Top = 78
          Width = 147
          Height = 38
          Hint = 
            '[['#13#10'cls:ButtonGreen button-no-border-top|'#13#10'align:btn2Down b:0 r:' +
            '0'#13#10']]'
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'btn3'
          Align = alClient
          TabOrder = 3
          ExplicitLeft = 40
        end
      end
      object rcBlock1260: TUniContainerPanel
        Left = 184
        Top = 60
        Width = 147
        Height = 40
        Hint = '[['#13#10'cols:xs-12 sm-12 md-6|'#13#10'round:all'#13#10']]'
        ParentColor = False
        Color = 4210688
        TabOrder = 3
        object btnGroupOptDown: TUniBitBtn
          Left = 0
          Top = 0
          Width = 147
          Height = 38
          Hint = 
            '[['#13#10'btn-group:fas-envelope cls:ButtonGreen caption:Option 1 dir:' +
            'down focus:off|'#13#10'btn-group:fas-check cls:ButtonGreen caption:Opt' +
            'ion 2 dir:down focus:off|'#13#10'btn-group:fas-bars cls:ButtonGreen ca' +
            'ption:Option 3 dir:down focus:off|'#13#10']]'#13#10
          Caption = 'btnGroupOptDown'
          TabStop = False
          TabOrder = 1
          OnClick = btnGroupOptDownClick
        end
      end
    end
    object rcBlock30: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 289
      Top = -368
      Width = 340
      Height = 240
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'round:no | '#13#10'cls:card-info-box-whi' +
        'te |'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 11
      object UniScrollBox1: TUniScrollBox
        AlignWithMargins = True
        Left = 0
        Top = 3
        Width = 340
        Height = 234
        Hint = ''
        Margins.Left = 0
        Margins.Right = 0
        Align = alClient
        TabOrder = 1
        ScrollHeight = 213
        ScrollWidth = 337
        object btnRedOutL: TUniBitBtn
          AlignWithMargins = True
          Left = 12
          Top = 51
          Width = 90
          Height = 38
          Hint = 
            '[['#13#10'/*cls:ButtonOutline ButtonOutlineRed btn-font-red| */'#13#10'btn:r' +
            'ed outline |'#13#10'align:rcBlock31 b:10 r:5 | '#13#10'scale:parent w:32% | ' +
            #13#10'pos-l:2%'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Red OL'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 0
        end
        object btnGreenOutL: TUniBitBtn
          AlignWithMargins = True
          Left = 107
          Top = 55
          Width = 90
          Height = 38
          Hint = 
            '[['#13#10'cls:ButtonOutline ButtonOutlineGreen btn-font-green| '#13#10'align' +
            ':btnRedOutL t:0 r:5 | '#13#10'scale:parent w:32%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Green OL'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object btnBlueOutL: TUniBitBtn
          AlignWithMargins = True
          Left = 201
          Top = 55
          Width = 90
          Height = 38
          Hint = 
            '[['#13#10'cls:ButtonOutline ButtonOutlineBlue btn-font-blue| '#13#10'align:b' +
            'tnGreenOutL t:0 r:5 | '#13#10'scale:parent w:31%'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Blue OL'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 2
        end
        object btnRedRound: TUniBitBtn
          AlignWithMargins = True
          Left = 12
          Top = 135
          Width = 90
          Height = 38
          Hint = 
            '[['#13#10'/*cls:ButtonOutline ButtonOutlineRed ButtonRounded | */'#13#10'btn' +
            ':red outline rounded |'#13#10'scale:parent w:32% | '#13#10'pos-l:2%'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Red'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 3
        end
        object btnGreenRound: TUniBitBtn
          AlignWithMargins = True
          Left = 107
          Top = 135
          Width = 90
          Height = 38
          Hint = 
            '[[cls:ButtonOutline ButtonOutlineGreen ButtonRounded | align:btn' +
            'RedRound t:0 r:5 | scale:parent w:32%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Green'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 4
        end
        object btnRound: TUniBitBtn
          AlignWithMargins = True
          Left = 201
          Top = 135
          Width = 90
          Height = 38
          Hint = 
            '[['#13#10'cls:ButtonOutline ButtonOutlineBlue ButtonRounded | align:bt' +
            'nGreenRound t:0 r:5 | '#13#10'scale:parent w:31%'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Blue'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 5
        end
        object btnOrangeOutL: TUniBitBtn
          AlignWithMargins = True
          Left = 12
          Top = 95
          Width = 90
          Height = 38
          Hint = 
            '[['#13#10'/*cls:ButtonOutline ButtonOutlineOrange ButtonRound btn-font' +
            '-orange| */'#13#10'btn:orange outline round |'#13#10'scale:parent w:32% | '#13#10 +
            'pos-l:2%'#13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Orange OL'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 6
          OnClick = btnOrangeOutLClick
        end
        object btnGrayOutL: TUniBitBtn
          AlignWithMargins = True
          Left = 106
          Top = 95
          Width = 90
          Height = 38
          Hint = 
            '[[cls:ButtonOutline ButtonOutlineGray ButtonRound btn-font-gray|' +
            ' align:btnOrangeOutL t:0 r:5 | scale:parent w:32%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Gray OL'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 7
        end
        object btnOrangeRound: TUniBitBtn
          AlignWithMargins = True
          Left = 12
          Top = 175
          Width = 90
          Height = 38
          Hint = 
            '[['#13#10'/*cls:ButtonOutline ButtonOutlineOrange ButtonRoundest | */'#13 +
            #10'btn:orange outline roundest |'#13#10'scale:parent w:32% | '#13#10'pos-l:2%|' +
            #13#10']]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Orange'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 8
        end
        object btnSilverOutL: TUniBitBtn
          AlignWithMargins = True
          Left = 201
          Top = 95
          Width = 90
          Height = 38
          Hint = 
            '[[cls:ButtonOutline ButtonOutlineSilver ButtonRound btn-font-sil' +
            'ver| align:btnGrayOutL t:0 r:5 | scale:parent w:31%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Silver OL'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 9
        end
        object btnGrayRound: TUniBitBtn
          AlignWithMargins = True
          Left = 106
          Top = 175
          Width = 90
          Height = 38
          Hint = 
            '[['#13#10'cls:ButtonOutline ButtonOutlineGray ButtonRoundest| '#13#10'align:' +
            'btnOrangeRound t:0 r:5 | scale:parent w:32%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Gray'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 10
        end
        object btnSilverRound: TUniBitBtn
          AlignWithMargins = True
          Left = 201
          Top = 175
          Width = 90
          Height = 38
          Hint = 
            '[[cls:ButtonOutline ButtonOutlineSilver ButtonRoundest| align:bt' +
            'nGrayRound t:0 r:5 | scale:parent w:31%]]'
          Margins.Left = 6
          Margins.Top = 4
          Margins.Right = 6
          Margins.Bottom = 4
          Caption = 'Silver'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 11
          OnClick = btnSilverRoundClick
        end
        object rcBlock31: TUniContainerPanel
          Left = 1
          Top = 1
          Width = 336
          Height = 42
          Hint = '[['#13#10'cols:12|'#13#10'noborder-all | '#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
          ParentColor = False
          Color = 14802398
          TabOrder = 12
          object UniLabel2: TUniLabel
            AlignWithMargins = True
            Left = 6
            Top = 6
            Width = 166
            Height = 18
            Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
            Margins.Left = 6
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Caption = 'Buttons Outline / Rounded'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -15
            Font.Name = 'Calibri'
            ParentColor = False
            Color = 14802398
            TabOrder = 1
          end
        end
      end
    end
  end
  object rcSweetAlert: TUniSweetAlert
    Title = 'Title'
    ConfirmButtonText = 'OK'
    CancelButtonText = 'Cancel'
    ImageIndex = 0
    Padding = 20
    FocusCancel = True
    Left = 894
    Top = 46
  end
end
