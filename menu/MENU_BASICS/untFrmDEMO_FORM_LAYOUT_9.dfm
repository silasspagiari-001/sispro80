object frmDEMO_FORM_LAYOUT_10: TfrmDEMO_FORM_LAYOUT_10
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
    ScrollHeight = 707
    ScrollWidth = 771
    object rcBlock1: TUniContainerPanel
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
        Caption = 'No Borders Sample '
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
    object rcBlock2070: TUniContainerPanel
      Tag = 1
      Left = 48
      Top = 129
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'cols:xs-12 sm-4 md-5'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 1
    end
    object rcBlock2080: TUniContainerPanel
      Tag = 1
      Left = 168
      Top = 129
      Width = 100
      Height = 46
      Hint = 
        '[['#13#10'cols-debug:|'#13#10'noborder-left|'#13#10'noborder-right|'#13#10'cols:xs-12 sm' +
        '-4 md-2'#13#10']]'
      ParentColor = False
      Color = clMoneyGreen
      TabOrder = 2
      DesignSize = (
        100
        46)
      object UniLabel1: TUniLabel
        Left = 20
        Top = 4
        Width = 56
        Height = 15
        Hint = ''
        Visible = False
        Alignment = taRightJustify
        Caption = 'left e right'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock2090: TUniContainerPanel
      Tag = 1
      Left = 316
      Top = 129
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'cols:xs-12 sm-4 md-5'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 3
    end
    object rcBlock2100: TUniContainerPanel
      Tag = 1
      Left = 54
      Top = 179
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'noborder-left|'#13#10'cols:xs-12 sm-4 md-5'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 4
      DesignSize = (
        100
        46)
      object UniLabel2: TUniLabel
        Left = 22
        Top = 6
        Width = 18
        Height = 15
        Hint = ''
        Visible = False
        Alignment = taRightJustify
        Caption = 'left'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock2110: TUniContainerPanel
      Tag = 1
      Left = 174
      Top = 179
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'cols:xs-12 sm-4 md-2'#13#10']]'
      ParentColor = False
      Color = clMoneyGreen
      TabOrder = 5
    end
    object rcBlock2120: TUniContainerPanel
      Tag = 1
      Left = 322
      Top = 179
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'noborder-right|'#13#10'cols:xs-12 sm-4 md-5'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 6
      DesignSize = (
        100
        46)
      object UniLabel3: TUniLabel
        Left = 24
        Top = 8
        Width = 26
        Height = 15
        Hint = ''
        Visible = False
        Alignment = taRightJustify
        Caption = 'right'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock2130: TUniContainerPanel
      Tag = 1
      Left = 48
      Top = 227
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|noborder-right|'#13#10'cols:xs-12 sm-4 md-5'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 7
      DesignSize = (
        100
        46)
      object UniLabel4: TUniLabel
        Left = 26
        Top = 10
        Width = 26
        Height = 15
        Hint = ''
        Visible = False
        Alignment = taRightJustify
        Caption = 'right'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock2140: TUniContainerPanel
      Tag = 1
      Left = 168
      Top = 227
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10#13#10'cols:xs-12 sm-4 md-2'#13#10']]'
      ParentColor = False
      Color = clMoneyGreen
      TabOrder = 8
    end
    object rcBlock2150: TUniContainerPanel
      Tag = 1
      Left = 322
      Top = 227
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|noborder-left|'#13#10'cols:xs-12 sm-4 md-5'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 9
      DesignSize = (
        100
        46)
      object UniLabel5: TUniLabel
        Left = 28
        Top = 8
        Width = 21
        Height = 15
        Hint = ''
        Visible = False
        Alignment = taRightJustify
        Caption = 'left '
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock2160: TUniContainerPanel
      Tag = 1
      Left = 50
      Top = 275
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'cols:xs-12 sm-4 md-5'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 10
      DesignSize = (
        100
        46)
      object UniLabel6: TUniLabel
        Left = 26
        Top = 3
        Width = 26
        Height = 15
        Hint = ''
        Visible = False
        Alignment = taRightJustify
        Caption = 'right'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock2170: TUniContainerPanel
      Tag = 1
      Left = 170
      Top = 275
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'noborder-left|'#13#10#13#10'cols:xs-12 sm-4 md-2'#13#10']]'
      ParentColor = False
      Color = clMoneyGreen
      TabOrder = 11
      DesignSize = (
        100
        46)
      object UniLabel7: TUniLabel
        Left = 26
        Top = 6
        Width = 18
        Height = 15
        Hint = ''
        Visible = False
        Alignment = taRightJustify
        Caption = 'left'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock2180: TUniContainerPanel
      Tag = 1
      Left = 318
      Top = 275
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'cols:xs-12 sm-4 md-5'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 12
    end
    object rcBlock2040: TUniContainerPanel
      Tag = 1
      Left = 48
      Top = 81
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'cols:xs-12 sm-4 md-5'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 13
    end
    object rcBlock2050: TUniContainerPanel
      Tag = 1
      Left = 166
      Top = 81
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'cols:xs-12 sm-4 md-2'#13#10']]'
      ParentColor = False
      Color = clMoneyGreen
      TabOrder = 14
    end
    object rcBlock2060: TUniContainerPanel
      Tag = 1
      Left = 314
      Top = 81
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'cols:xs-12 sm-4 md-5'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 15
    end
    object rcBlock2190: TUniContainerPanel
      Tag = 1
      Left = 48
      Top = 323
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'noborder-left|cols:xs-12 sm-4 md-5'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 16
      DesignSize = (
        100
        46)
      object UniLabel8: TUniLabel
        Left = 30
        Top = 10
        Width = 18
        Height = 15
        Hint = ''
        Visible = False
        Alignment = taRightJustify
        Caption = 'left'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock2200: TUniContainerPanel
      Tag = 1
      Left = 168
      Top = 323
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'noborder-right|'#13#10#13#10'cols:xs-12 sm-4 md-2'#13#10']]'
      ParentColor = False
      Color = clMoneyGreen
      TabOrder = 17
      DesignSize = (
        100
        46)
      object UniLabel6Clone: TUniLabel
        Left = 26
        Top = 6
        Width = 26
        Height = 15
        Hint = ''
        Visible = False
        Alignment = taRightJustify
        Caption = 'right'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock2210: TUniContainerPanel
      Tag = 1
      Left = 316
      Top = 323
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'cols:xs-12 sm-4 md-5'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 18
    end
    object rcBlock2220: TUniContainerPanel
      Tag = 1
      Left = 50
      Top = 371
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'cols:xs-12 sm-4 md-5'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 19
    end
    object rcBlock2230: TUniContainerPanel
      Tag = 1
      Left = 170
      Top = 371
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'noborder-right|'#13#10#13#10'cols:xs-12 sm-4 md-2'#13#10']]'
      ParentColor = False
      Color = clMoneyGreen
      TabOrder = 20
      DesignSize = (
        100
        46)
      object UniLabel7Clone: TUniLabel
        Left = 26
        Top = 6
        Width = 26
        Height = 15
        Hint = ''
        Visible = False
        Alignment = taRightJustify
        Caption = 'right'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock2240: TUniContainerPanel
      Tag = 1
      Left = 318
      Top = 371
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'noborder-right|'#13#10'cols:xs-12 sm-4 md-5'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 21
      DesignSize = (
        100
        46)
      object UniLabel9: TUniLabel
        Left = 24
        Top = 0
        Width = 26
        Height = 15
        Hint = ''
        Visible = False
        Alignment = taRightJustify
        Caption = 'right'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock2250: TUniContainerPanel
      Tag = 1
      Left = 50
      Top = 467
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'cols:xs-12 sm-4 md-5'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 22
    end
    object rcBlock2260: TUniContainerPanel
      Tag = 1
      Left = 170
      Top = 467
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'noborder-all|'#13#10#13#10'cols:xs-12 sm-4 md-2'#13#10']]'
      ParentColor = False
      Color = clMoneyGreen
      TabOrder = 23
      DesignSize = (
        100
        46)
      object UniLabel7CloneClone: TUniLabel
        Left = 26
        Top = 6
        Width = 15
        Height = 15
        Hint = ''
        Visible = False
        Alignment = taRightJustify
        Caption = 'all'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock2270: TUniContainerPanel
      Tag = 1
      Left = 318
      Top = 467
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10#13#10'cols:xs-12 sm-4 md-5'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 24
    end
    object rcBlock2280: TUniContainerPanel
      Tag = 1
      Left = 50
      Top = 515
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'cols:xs-12 sm-4 md-5'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 25
    end
    object rcBlock2290: TUniContainerPanel
      Tag = 1
      Left = 170
      Top = 515
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'noborder-all|'#13#10#13#10'cols:xs-12 sm-4 md-2'#13#10']]'
      ParentColor = False
      Color = clMoneyGreen
      TabOrder = 26
      DesignSize = (
        100
        46)
      object UniLabel7CloneCloneClone: TUniLabel
        Left = 26
        Top = 6
        Width = 15
        Height = 15
        Hint = ''
        Visible = False
        Alignment = taRightJustify
        Caption = 'all'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock2300: TUniContainerPanel
      Tag = 1
      Left = 318
      Top = 515
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|noborder-right|'#13#10#13#10'cols:xs-12 sm-4 md-5'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 27
      DesignSize = (
        100
        46)
      object UniLabel10: TUniLabel
        Left = 26
        Top = 2
        Width = 26
        Height = 15
        Hint = ''
        Visible = False
        Alignment = taRightJustify
        Caption = 'right'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock2310: TUniContainerPanel
      Tag = 1
      Left = 50
      Top = 563
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'cols:xs-12 sm-4 md-5'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 28
    end
    object rcBlock2320: TUniContainerPanel
      Tag = 1
      Left = 170
      Top = 563
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'noborder-all|'#13#10#13#10'cols:xs-12 sm-4 md-2'#13#10']]'
      ParentColor = False
      Color = clMoneyGreen
      TabOrder = 29
      DesignSize = (
        100
        46)
      object UniLabel7CloneCloneCloneClone: TUniLabel
        Left = 26
        Top = 6
        Width = 15
        Height = 15
        Hint = ''
        Visible = False
        Alignment = taRightJustify
        Caption = 'all'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock2330: TUniContainerPanel
      Tag = 1
      Left = 318
      Top = 563
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|noborder-left|'#13#10#13#10'cols:xs-12 sm-4 md-5'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 30
      DesignSize = (
        100
        46)
      object UniLabel1Clone: TUniLabel
        Left = 26
        Top = 2
        Width = 18
        Height = 15
        Hint = ''
        Visible = False
        Alignment = taRightJustify
        Caption = 'left'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock2249: TUniContainerPanel
      Left = 50
      Top = 440
      Width = 364
      Height = 25
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 31
      object UniLabel11: TUniLabel
        Left = 3
        Top = 5
        Width = 194
        Height = 15
        Hint = ''
        Caption = 'samples noborder all and left/right'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock2340: TUniContainerPanel
      Tag = 1
      Left = 50
      Top = 595
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'noborder-left|'#13#10'cols:xs-12 sm-4 md-5'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 32
      DesignSize = (
        100
        46)
      object UniLabel1CloneClone: TUniLabel
        Left = 28
        Top = 4
        Width = 18
        Height = 15
        Hint = ''
        Visible = False
        Alignment = taRightJustify
        Caption = 'left'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock2350: TUniContainerPanel
      Tag = 1
      Left = 170
      Top = 595
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10'noborder-all|'#13#10#13#10'cols:xs-12 sm-4 md-2'#13#10']]'
      ParentColor = False
      Color = clMoneyGreen
      TabOrder = 33
      DesignSize = (
        100
        46)
      object UniLabel7CloneCloneCloneCloneClone: TUniLabel
        Left = 26
        Top = 6
        Width = 15
        Height = 15
        Hint = ''
        Visible = False
        Alignment = taRightJustify
        Caption = 'all'
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock2360: TUniContainerPanel
      Tag = 1
      Left = 318
      Top = 595
      Width = 100
      Height = 46
      Hint = '[['#13#10'cols-debug:|'#13#10#13#10'cols:xs-12 sm-4 md-5'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 34
    end
    object rcBlock2370: TUniContainerPanel
      Left = 282
      Top = 647
      Width = 122
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 35
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
