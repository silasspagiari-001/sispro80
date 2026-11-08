object frmDEMO_CALLOUT: TfrmDEMO_CALLOUT
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
    ScrollHeight = 629
    ScrollWidth = 769
    object rcBlock1000: TUniContainerPanel
      Tag = 4
      Left = 40
      Top = 586
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 0
    end
    object rcBlock10: TUniContainerPanel
      Tag = 4
      Left = 29
      Top = 62
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 1
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 717
        Height = 31
        Hint = '[[bsh5:|cls:left-center]]'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = 'Call Out'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock188: TUniContainerPanel
      Tag = 1
      Left = 266
      Top = 163
      Width = 433
      Height = 238
      Hint = 
        '[['#13#10'cols:12 |'#13#10'round:no | '#13#10'cls:card-info-box-white rc-dashed-bl' +
        'ock|'#13#10']]'
      ParentColor = False
      TabOrder = 2
      object rcBlock20: TUniContainerPanel
        Tag = 1
        Left = 22
        Top = 23
        Width = 99
        Height = 60
        Hint = '[[cols:4]]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          99
          60)
        object rcLabel60: TUniLabel
          Left = 0
          Top = 0
          Width = 35
          Height = 15
          Hint = ''
          Caption = 'Theme'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object cbxTheme: TUniComboBox
          Left = 1
          Top = 21
          Width = 98
          Height = 38
          Hint = ''
          Text = ''
          Items.Strings = (
            'ctDefault'
            'ctCartoon'
            'ctFancyBlue'
            'ctGray'
            'ctYellow'
            'ctDanger'
            'ctWarning'
            'ctSuccess'
            'ctInfo')
          ItemIndex = 0
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 2
          IconItems = <>
          ExplicitWidth = 242
        end
      end
      object btnTopLeft: TUniBitBtn
        Left = 171
        Top = 190
        Width = 92
        Height = 37
        Hint = '[['#13#10'center:parent x'#13#10']]'
        Caption = 'Show'
        TabOrder = 2
        OnClick = btnTopLeftClick
      end
      object rcBlock30: TUniContainerPanel
        Tag = 1
        Left = 138
        Top = 23
        Width = 99
        Height = 60
        Hint = '[[cols:4]]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          99
          60)
        object UniLabel2: TUniLabel
          Left = 0
          Top = 0
          Width = 33
          Height = 15
          Hint = ''
          Caption = 'Arrow'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object cbxArrow: TUniComboBox
          Left = 1
          Top = 21
          Width = 98
          Height = 38
          Hint = ''
          Text = ''
          Items.Strings = (
            'carTop'
            'carBottom'
            'carRight'
            'carRight_Top'
            'carRight_Bottom'
            'carLeft'
            'carLeft_Top'
            'carLeft_Bottom'
            'carBottom_Right'
            'carBottom_Left'
            'carTop_Right'
            'carTop_Left')
          ItemIndex = 0
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 2
          IconItems = <>
        end
      end
      object rcBlock40: TUniContainerPanel
        Tag = 1
        Left = 254
        Top = 23
        Width = 99
        Height = 60
        Hint = '[[cols:4]]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          99
          60)
        object UniLabel3: TUniLabel
          Left = 0
          Top = 0
          Width = 66
          Height = 15
          Hint = ''
          Caption = 'Relative Pos'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object cbxRelPos: TUniComboBox
          Left = 1
          Top = 21
          Width = 98
          Height = 38
          Hint = ''
          Text = ''
          Items.Strings = (
            'crpC_C'
            'crpT_B'
            'crpB_T'
            'crpL_R'
            'crpR_L'
            'crpT_T'
            'crpB_B'
            'crpL_L'
            'crpR_R'
            'crpTR_BL'
            'crpTL_BR'
            'crpBL_TR'
            'crpBR_TL')
          ItemIndex = 0
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          TabOrder = 2
          IconItems = <>
        end
      end
      object rcBlock50: TUniContainerPanel
        Tag = 1
        Left = 30
        Top = 104
        Width = 40
        Height = 60
        Hint = '[['#13#10'cols:2'#13#10']]'
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          40
          60)
        object rcLabel1010: TUniLabel
          Left = 0
          Top = 0
          Width = 7
          Height = 15
          Hint = ''
          Caption = 'X'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object RelPosX: TUniNumberEdit
          Left = 0
          Top = 21
          Width = 39
          Height = 38
          Hint = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          DecimalSeparator = ','
          ExplicitWidth = 110
        end
      end
      object rcBlock60: TUniContainerPanel
        Tag = 1
        Left = 86
        Top = 104
        Width = 40
        Height = 60
        Hint = '[['#13#10'cols:2'#13#10']]'
        ParentColor = False
        TabOrder = 6
        DesignSize = (
          40
          60)
        object rcLabel1020: TUniLabel
          Left = 0
          Top = 0
          Width = 6
          Height = 15
          Hint = ''
          Caption = 'Y'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object RelPosY: TUniNumberEdit
          Left = 0
          Top = 21
          Width = 39
          Height = 38
          Hint = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          DecimalSeparator = ','
          ExplicitWidth = 110
        end
      end
      object rcBlock70: TUniContainerPanel
        Tag = 1
        Left = 148
        Top = 104
        Width = 60
        Height = 60
        Hint = '[['#13#10'cols:2'#13#10']]'
        ParentColor = False
        TabOrder = 7
        DesignSize = (
          60
          60)
        object rcLabel1010Clone: TUniLabel
          Left = 0
          Top = 0
          Width = 40
          Height = 15
          Hint = ''
          Caption = 'Fade In'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object FadeIn: TUniNumberEdit
          Left = 1
          Top = 21
          Width = 59
          Height = 38
          Hint = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Value = 200.000000000000000000
          DecimalSeparator = ','
        end
      end
      object rcBlock80: TUniContainerPanel
        Tag = 1
        Left = 214
        Top = 104
        Width = 60
        Height = 60
        Hint = '[['#13#10'cols:2'#13#10']]'
        ParentColor = False
        TabOrder = 8
        DesignSize = (
          60
          60)
        object rcLabel1020Clone: TUniLabel
          Left = 0
          Top = 0
          Width = 49
          Height = 15
          Hint = ''
          Caption = 'Fade Out'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object FadeOut: TUniNumberEdit
          Left = 0
          Top = 21
          Width = 59
          Height = 38
          Hint = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Value = 200.000000000000000000
          DecimalSeparator = ','
          ExplicitWidth = 39
        end
      end
      object rcBlock90: TUniContainerPanel
        Tag = 1
        Left = 284
        Top = 102
        Width = 60
        Height = 60
        Hint = '[['#13#10'cols:2'#13#10']]'
        ParentColor = False
        TabOrder = 9
        DesignSize = (
          60
          60)
        object rcLabel1010CloneClone: TUniLabel
          Left = 0
          Top = 0
          Width = 44
          Height = 15
          Hint = ''
          Caption = 'Dismiss'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object Dismiss: TUniNumberEdit
          Left = 0
          Top = 21
          Width = 59
          Height = 38
          Hint = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Value = 5000.000000000000000000
          DecimalSeparator = ','
          ExplicitWidth = 39
        end
      end
      object rcBlock100: TUniContainerPanel
        Tag = 1
        Left = 348
        Top = 102
        Width = 60
        Height = 60
        Hint = '[['#13#10'cols:2'#13#10']]'
        ParentColor = False
        TabOrder = 10
        DesignSize = (
          60
          60)
        object rcLabel1020CloneClone: TUniLabel
          Left = 0
          Top = 0
          Width = 34
          Height = 15
          Hint = ''
          Caption = 'Width'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object Width: TUniNumberEdit
          Left = 0
          Top = 21
          Width = 59
          Height = 38
          Hint = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          Value = 200.000000000000000000
          DecimalSeparator = ','
          ExplicitWidth = 39
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
