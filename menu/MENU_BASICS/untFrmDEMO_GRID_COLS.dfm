object frmDEMO_GRID_COLS: TfrmDEMO_GRID_COLS
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
    ScrollHeight = 473
    ScrollWidth = 777
    object rcBlock2510: TUniContainerPanel
      Left = 27
      Top = 121
      Width = 80
      Height = 40
      Hint = '[['#13#10'|'#13#10'cols:xs-12 sm-12 md-3|'#13#10']]'
      ParentColor = False
      Color = clMoneyGreen
      TabOrder = 0
    end
    object rcBlock2520: TUniContainerPanel
      Left = 116
      Top = 121
      Width = 80
      Height = 40
      Hint = '[['#13#10'|'#13#10'cols:xs-12 sm-12 md-3|'#13#10']]'
      ParentColor = False
      Color = clMoneyGreen
      TabOrder = 1
    end
    object rcBlock2550: TUniContainerPanel
      Left = 23
      Top = 231
      Width = 80
      Height = 40
      Hint = '[['#13#10'|'#13#10'cols-grid:16|'#13#10'cols:xs-16 sm-16 md-2|'#13#10']]'
      ParentColor = False
      Color = clMoneyGreen
      TabOrder = 2
    end
    object rcBlock2560: TUniContainerPanel
      Left = 112
      Top = 231
      Width = 80
      Height = 40
      Hint = '[['#13#10'|'#13#10'cols-grid:16|'#13#10'cols:xs-16 sm-16 md-2|'#13#10']]'
      ParentColor = False
      Color = clMoneyGreen
      TabOrder = 3
    end
    object rcBlock2570: TUniContainerPanel
      Left = 198
      Top = 231
      Width = 80
      Height = 40
      Hint = '[['#13#10'|'#13#10'cols-grid:16|'#13#10'cols:xs-16 sm-16 md-2|'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 4
    end
    object rcBlock2590: TUniContainerPanel
      Left = 476
      Top = 231
      Width = 80
      Height = 40
      Hint = '[['#13#10'|'#13#10'cols-grid:16|'#13#10'cols:xs-16 sm-16 md-2|'#13#10']]'
      ParentColor = False
      Color = clMoneyGreen
      TabOrder = 5
    end
    object rcBlock2610: TUniContainerPanel
      Left = 562
      Top = 231
      Width = 80
      Height = 40
      Hint = '[['#13#10'|'#13#10'cols-grid:16|'#13#10'cols:xs-16 sm-16 md-2|'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 6
    end
    object rcBlock2620: TUniContainerPanel
      Left = 387
      Top = 231
      Width = 80
      Height = 40
      Hint = '[['#13#10'|'#13#10'cols-grid:16|'#13#10'cols:xs-16 sm-16 md-2|'#13#10']]'
      ParentColor = False
      Color = clMoneyGreen
      TabOrder = 7
    end
    object rcBlock2540: TUniContainerPanel
      Left = 302
      Top = 121
      Width = 80
      Height = 40
      Hint = '[['#13#10'|'#13#10'cols:xs-12 sm-12 md-3|'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 8
    end
    object rcBlock2580: TUniContainerPanel
      Left = 288
      Top = 231
      Width = 80
      Height = 40
      Hint = '[['#13#10'|'#13#10'cols-grid:16|'#13#10'cols:xs-16 sm-16 md-2|'#13#10']]'
      ParentColor = False
      Color = clMaroon
      TabOrder = 9
    end
    object rcBlock2530: TUniContainerPanel
      Left = 202
      Top = 121
      Width = 80
      Height = 40
      Hint = '[['#13#10'|'#13#10'cols:xs-12 sm-12 md-3|'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 10
    end
    object rcBlock2600: TUniContainerPanel
      Left = 652
      Top = 231
      Width = 80
      Height = 40
      Hint = '[['#13#10'|'#13#10'cols-grid:16|'#13#10'cols:xs-16 sm-16 md-2|'#13#10']]'
      ParentColor = False
      Color = clMaroon
      TabOrder = 11
    end
    object rcBlock2500: TUniContainerPanel
      Tag = 4
      Left = 31
      Top = 47
      Width = 746
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 12
      DesignSize = (
        746
        43)
      object UniLabel35Clone: TUniLabel
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
        Caption = '12 columns Sample ( default )'
        Align = alLeft
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniBitBtn1Clone: TUniBitBtn
        AlignWithMargins = True
        Left = 711
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
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
        OnClick = UniBitBtn1CloneClick
      end
    end
    object rcBlock2545: TUniContainerPanel
      Tag = 4
      Left = 22
      Top = 175
      Width = 746
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 13
      object UniLabel35CloneClone: TUniLabel
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
        Caption = '16 columns Sample'
        Align = alLeft
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock2630: TUniContainerPanel
      Tag = 4
      Left = 17
      Top = 337
      Width = 746
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 14
      object UniLabel1: TUniLabel
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
        Caption = '20 columns Sample '
        Align = alLeft
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock2640: TUniContainerPanel
      Left = 17
      Top = 433
      Width = 80
      Height = 40
      Hint = '[['#13#10'|'#13#10'cols-grid:20|'#13#10'cols:xs-20 sm-20 md-4|'#13#10']]'
      ParentColor = False
      Color = clMoneyGreen
      TabOrder = 15
    end
    object rcBlock2650: TUniContainerPanel
      Left = 106
      Top = 433
      Width = 80
      Height = 40
      Hint = '[['#13#10'|'#13#10'cols-grid:20|'#13#10'cols:xs-20 sm-20 md-4|'#13#10']]'
      ParentColor = False
      Color = clMoneyGreen
      TabOrder = 16
    end
    object rcBlock2660: TUniContainerPanel
      Left = 192
      Top = 433
      Width = 80
      Height = 40
      Hint = '[['#13#10'|'#13#10'cols-grid:20|'#13#10'cols:xs-20 sm-20 md-4|'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 17
    end
    object rcBlock2670: TUniContainerPanel
      Left = 374
      Top = 431
      Width = 80
      Height = 40
      Hint = '[['#13#10'|'#13#10'cols-grid:20|'#13#10'cols:xs-20 sm-20 md-4|'#13#10']]'
      ParentColor = False
      Color = clSkyBlue
      TabOrder = 18
    end
    object rcBlock2680: TUniContainerPanel
      Left = 288
      Top = 433
      Width = 80
      Height = 40
      Hint = '[['#13#10'|'#13#10'cols-grid:20|'#13#10'cols:xs-20 sm-20 md-4|'#13#10']]'
      ParentColor = False
      Color = clMaroon
      TabOrder = 19
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
