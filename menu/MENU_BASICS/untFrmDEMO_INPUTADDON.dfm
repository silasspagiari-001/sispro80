object frmDEMO_INPUTADDON: TfrmDEMO_INPUTADDON
  Left = 0
  Top = 0
  Width = 954
  Height = 653
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  object UniScrollBox1: TUniScrollBox
    Left = 0
    Top = 0
    Width = 954
    Height = 653
    Hint = ''
    Align = alClient
    TabOrder = 0
    ScrollHeight = 713
    ScrollWidth = 752
    ScrollY = 62
    object rcBlock60: TUniContainerPanel
      Tag = 1
      Left = 582
      Top = 6
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 0
      DesignSize = (
        90
        60)
      object rcLabel60CloneClone: TUniLabel
        Left = 0
        Top = 0
        Width = 30
        Height = 15
        Hint = ''
        Caption = 'Items'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object rcEdit60CloneClone: TUniEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:spin step:1 min:0 max:10 '#13#10']]'#13#10
        CharCase = ecUpperCase
        Text = '5'
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock50: TUniContainerPanel
      Tag = 1
      Left = 430
      Top = 5
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        90
        60)
      object rcLabel60Clone: TUniLabel
        Left = 0
        Top = 0
        Width = 26
        Height = 15
        Hint = ''
        Caption = 'Time'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object rcEdit60Clone: TUniEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:time '#13#10']]'
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock40: TUniContainerPanel
      Tag = 1
      Left = 327
      Top = 5
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        90
        60)
      object rcLabel50Clone: TUniLabel
        Left = 0
        Top = 0
        Width = 25
        Height = 15
        Hint = ''
        Caption = 'Date'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edHoursClone: TUniEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:date |'#13#10']]'
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock30: TUniContainerPanel
      Tag = 1
      Left = 225
      Top = 6
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        90
        60)
      object rcLabel40Clone: TUniLabel
        Left = 0
        Top = 0
        Width = 39
        Height = 15
        Hint = ''
        Caption = 'Weight'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object rcEdit40Clone: TUniEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:Kg side:right '#13#10']]'
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock20: TUniContainerPanel
      Tag = 1
      Left = 126
      Top = 7
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        90
        60)
      object rcLabel70Clone: TUniLabel
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
      object rcEdit70Clone: TUniEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:far-envelope side:left '#13#10']]'
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock10: TUniContainerPanel
      Tag = 1
      Left = 29
      Top = 8
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        90
        60)
      object rcLabel30Clone: TUniLabel
        Left = 0
        Top = 0
        Width = 28
        Height = 15
        Hint = ''
        Caption = 'Price'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object Price: TUniFormattedNumberEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:R$ side:left '#13#10']]'
        Alignment = taRightJustify
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
    end
    object rcBlock70: TUniContainerPanel
      Tag = 1
      Left = 31
      Top = 129
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 6
      DesignSize = (
        90
        60)
      object rcLabel30CloneClone: TUniLabel
        Left = 0
        Top = 0
        Width = 28
        Height = 15
        Hint = ''
        Caption = 'Price'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniFormattedNumberEdit1: TUniFormattedNumberEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:R$ side:left type:theme'#13#10']]'
        Alignment = taRightJustify
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
    end
    object rcBlock80: TUniContainerPanel
      Tag = 1
      Left = 129
      Top = 123
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 7
      DesignSize = (
        90
        60)
      object rcLabel40CloneClone: TUniLabel
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
      object rcEdit40CloneClone: TUniEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:far-envelope type:theme'#13#10']]'
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock90: TUniContainerPanel
      Tag = 1
      Left = 219
      Top = 126
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 8
      DesignSize = (
        90
        60)
      object rcLabel50CloneClone: TUniLabel
        Left = 0
        Top = 0
        Width = 39
        Height = 15
        Hint = ''
        Caption = 'Weight'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edHoursCloneClone: TUniEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:Kg side:right type:theme'#13#10']]'
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock100: TUniContainerPanel
      Tag = 1
      Left = 330
      Top = 126
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 9
      DesignSize = (
        90
        60)
      object UniLabel8: TUniLabel
        Left = 0
        Top = 0
        Width = 25
        Height = 15
        Hint = ''
        Caption = 'Date'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniEdit1: TUniEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:date type:theme'#13#10']]'
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock110: TUniContainerPanel
      Tag = 1
      Left = 430
      Top = 128
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 10
      DesignSize = (
        90
        60)
      object rcLabel70CloneClone: TUniLabel
        Left = 0
        Top = 0
        Width = 26
        Height = 15
        Hint = ''
        Caption = 'Time'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object rcEdit70CloneClone: TUniEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:time type:theme'#13#10']]'
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock120: TUniContainerPanel
      Tag = 1
      Left = 532
      Top = 125
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 11
      DesignSize = (
        90
        60)
      object rcLabel60CloneCloneClone: TUniLabel
        Left = 0
        Top = 0
        Width = 30
        Height = 15
        Hint = ''
        Caption = 'Items'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object rcEdit60CloneCloneClone: TUniEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:spin step:1 min:0 max:10 type:theme'#13#10']]'#13#10
        CharCase = ecUpperCase
        Text = '5'
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock130: TUniContainerPanel
      Tag = 1
      Left = 37
      Top = 301
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 12
      DesignSize = (
        90
        60)
      object UniLabel7: TUniLabel
        Left = 0
        Top = 0
        Width = 28
        Height = 15
        Hint = ''
        Caption = 'Price'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniFormattedNumberEdit1Clone: TUniFormattedNumberEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:R$ side:left type:outline'#13#10']]'
        Alignment = taRightJustify
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
    end
    object rcBlock140: TUniContainerPanel
      Tag = 1
      Left = 135
      Top = 295
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 13
      DesignSize = (
        90
        60)
      object rcLabel40CloneCloneClone: TUniLabel
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
      object rcEdit40CloneCloneClone: TUniEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:far-envelope side:left type:outline'#13#10']]'
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock150: TUniContainerPanel
      Tag = 1
      Left = 225
      Top = 298
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 14
      DesignSize = (
        90
        60)
      object rcLabel50CloneCloneClone: TUniLabel
        Left = 0
        Top = 0
        Width = 39
        Height = 15
        Hint = ''
        Caption = 'Weight'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edHoursCloneCloneClone: TUniEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:Kg side:right type:outline'#13#10']]'
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock160: TUniContainerPanel
      Tag = 1
      Left = 336
      Top = 298
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 15
      DesignSize = (
        90
        60)
      object UniLabel8Clone: TUniLabel
        Left = 0
        Top = 0
        Width = 25
        Height = 15
        Hint = ''
        Caption = 'Date'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniEdit1Clone: TUniEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:date type:outline'#13#10']]'
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock170: TUniContainerPanel
      Tag = 1
      Left = 436
      Top = 300
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 16
      DesignSize = (
        90
        60)
      object rcLabel70CloneCloneClone: TUniLabel
        Left = 0
        Top = 0
        Width = 26
        Height = 15
        Hint = ''
        Caption = 'Time'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object rcEdit70CloneCloneClone: TUniEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:time type:outline'#13#10']]'
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock180: TUniContainerPanel
      Tag = 1
      Left = 538
      Top = 297
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 17
      DesignSize = (
        90
        60)
      object rcLabel60CloneCloneCloneClone: TUniLabel
        Left = 0
        Top = 0
        Width = 30
        Height = 15
        Hint = ''
        Caption = 'Items'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object rcEdit60CloneCloneCloneClone: TUniEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:spin step:1 min:0 max:10 type:outline'#13#10']]'#13#10
        CharCase = ecUpperCase
        Text = '5'
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock5: TUniContainerPanel
      Tag = 4
      Left = 11
      Top = -55
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 18
      object UniLabel3Clone: TUniLabel
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
        Caption = 'Input-AddOn Default'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock65: TUniContainerPanel
      Tag = 4
      Left = 11
      Top = 79
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 19
      object UniLabel3CloneClone: TUniLabel
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
        Caption = 'Input-AddOn Color Theme '
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock125: TUniContainerPanel
      Tag = 4
      Left = 17
      Top = 233
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 20
      object UniLabel3CloneCloneClone: TUniLabel
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
        Caption = 'Input-AddOn Color Theme OutLine'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock470: TUniContainerPanel
      Tag = 1
      Left = 31
      Top = 591
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 21
      DesignSize = (
        90
        60)
      object UniLabel1: TUniLabel
        Left = 0
        Top = 0
        Width = 30
        Height = 15
        Hint = ''
        Caption = 'Color'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edColorInputClone: TUniEdit
        Left = -2
        Top = 22
        Width = 89
        Height = 38
        Hint = 
          '[['#13#10'input-addon:color side:left color:#df1414|'#13#10'/*cls-bg:rc-edit' +
          '-inputtype-color*/'#13#10']]'
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        InputType = 'color'
      end
    end
    object rcBlock480: TUniContainerPanel
      Tag = 1
      Left = 135
      Top = 591
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 22
      DesignSize = (
        90
        60)
      object UniLabel2: TUniLabel
        Left = 0
        Top = 0
        Width = 30
        Height = 15
        Hint = ''
        Caption = 'Color'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniEdit2: TUniEdit
        Left = 0
        Top = 22
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:color side:left type:theme'#13#10']]'
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        InputType = 'color'
      end
    end
    object rcBlock500: TUniContainerPanel
      Tag = 1
      Left = 529
      Top = 585
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-6'#13#10']]'
      ParentColor = False
      TabOrder = 23
    end
    object rcBlock320: TUniContainerPanel
      Tag = 1
      Left = 37
      Top = 445
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 24
      DesignSize = (
        90
        60)
      object UniLabel7Clone: TUniLabel
        Left = 0
        Top = 0
        Width = 28
        Height = 15
        Hint = ''
        Caption = 'Price'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniFormattedNumberEdit1CloneClone: TUniFormattedNumberEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:R$ side:left type:white'#13#10']]'
        Alignment = taRightJustify
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
    end
    object rcBlock330: TUniContainerPanel
      Tag = 1
      Left = 135
      Top = 439
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 25
      DesignSize = (
        90
        60)
      object rcLabel40CloneCloneCloneClone: TUniLabel
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
      object rcEdit40CloneCloneCloneClone: TUniEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:far-envelope side:left type:white'#13#10']]'
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock340: TUniContainerPanel
      Tag = 1
      Left = 225
      Top = 442
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 26
      DesignSize = (
        90
        60)
      object rcLabel50CloneCloneCloneClone: TUniLabel
        Left = 0
        Top = 0
        Width = 39
        Height = 15
        Hint = ''
        Caption = 'Weight'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edHoursCloneCloneCloneClone: TUniEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:Kg side:right type:white'#13#10']]'
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock350: TUniContainerPanel
      Tag = 1
      Left = 336
      Top = 442
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 27
      DesignSize = (
        90
        60)
      object UniLabel8CloneClone: TUniLabel
        Left = 0
        Top = 0
        Width = 25
        Height = 15
        Hint = ''
        Caption = 'Date'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniEdit1CloneClone: TUniEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:date type:white'#13#10']]'
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock360: TUniContainerPanel
      Tag = 1
      Left = 436
      Top = 444
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 28
      DesignSize = (
        90
        60)
      object rcLabel70CloneCloneCloneClone: TUniLabel
        Left = 0
        Top = 0
        Width = 26
        Height = 15
        Hint = ''
        Caption = 'Time'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object rcEdit70CloneCloneCloneClone: TUniEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:time type:white'#13#10']]'
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock370: TUniContainerPanel
      Tag = 1
      Left = 538
      Top = 441
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 29
      DesignSize = (
        90
        60)
      object rcLabel60CloneCloneCloneCloneClone: TUniLabel
        Left = 0
        Top = 0
        Width = 30
        Height = 15
        Hint = ''
        Caption = 'Items'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object rcEdit60CloneCloneCloneCloneClone: TUniEdit
        Left = 0
        Top = 21
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:spin step:1 min:0 max:10 type:white'#13#10']]'#13#10
        CharCase = ecUpperCase
        Text = '5'
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock300: TUniContainerPanel
      Tag = 4
      Left = 17
      Top = 377
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 30
      object UniLabel3: TUniLabel
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
        Caption = 'Input-AddOn Color White'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock450: TUniContainerPanel
      Tag = 4
      Left = 23
      Top = 519
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 31
      object UniLabel3CloneCloneCloneCloneClone: TUniLabel
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
        Caption = 'Input-AddOn Color Select'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock490: TUniContainerPanel
      Tag = 1
      Left = 247
      Top = 591
      Width = 90
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 32
      DesignSize = (
        90
        60)
      object rcLabel30CloneCloneCloneCloneCloneClone: TUniLabel
        Left = 0
        Top = 0
        Width = 30
        Height = 15
        Hint = ''
        Caption = 'Color'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniEdit1CloneCloneCloneCloneCloneClone: TUniEdit
        Left = 0
        Top = 22
        Width = 89
        Height = 38
        Hint = '[['#13#10'input-addon:color side:left type:white'#13#10']]'
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        InputType = 'color'
      end
    end
  end
end
