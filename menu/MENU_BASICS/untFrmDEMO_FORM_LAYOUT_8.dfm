object frmDEMO_FORM_LAYOUT_8: TfrmDEMO_FORM_LAYOUT_8
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
    ScrollHeight = 170
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
        Caption = '5 columns Sample without rcBlocks'
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
    object rcBlock5: TUniContainerPanel
      Tag = 1
      Left = 38
      Top = 90
      Width = 648
      Height = 80
      Hint = '[['#13#10'cols-offset:0|'#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 1
      object b1: TUniContainerPanel
        Tag = 1
        Left = 0
        Top = 0
        Width = 80
        Height = 80
        Hint = '[['#13#10'scale:parent w:20% off:0|'#13#10']]'
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        ParentColor = False
        Align = alLeft
        TabOrder = 1
        object Block10: TUniContainerPanel
          Left = 18
          Top = 18
          Width = 39
          Height = 40
          Hint = 
            '[['#13#10'pos-l:10|'#13#10'center:parent y|'#13#10'scale:parent w:100%-left off:10' +
            ' |'#13#10']]'
          ParentColor = False
          Color = clGray
          TabOrder = 1
        end
      end
      object b5: TUniContainerPanel
        Tag = 1
        Left = 568
        Top = 0
        Width = 80
        Height = 80
        Hint = '[['#13#10'scale:parent w:20% off:0|'#13#10']]'
        Margins.Left = 10
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        ParentColor = False
        Align = alRight
        TabOrder = 2
        object Block50: TUniContainerPanel
          Left = 26
          Top = 26
          Width = 39
          Height = 40
          Hint = 
            '[['#13#10'pos-l:10|'#13#10'center:parent y|'#13#10'scale:parent w:100%-left off:10' +
            ' |'#13#10']]'
          ParentColor = False
          Color = clGray
          TabOrder = 1
        end
      end
      object b2: TUniContainerPanel
        Tag = 1
        Left = 80
        Top = 0
        Width = 80
        Height = 80
        Hint = '[['#13#10'scale:parent w:20% off:0|'#13#10']]'
        Margins.Left = 10
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        ParentColor = False
        Align = alLeft
        TabOrder = 3
        object Block20: TUniContainerPanel
          Left = 20
          Top = 20
          Width = 39
          Height = 40
          Hint = 
            '[['#13#10'pos-l:10|'#13#10'center:parent y|'#13#10'scale:parent w:100%-left off:10' +
            ' |'#13#10']]'
          ParentColor = False
          Color = clGray
          TabOrder = 1
        end
      end
      object b4: TUniContainerPanel
        Tag = 1
        Left = 240
        Top = 0
        Width = 80
        Height = 80
        Hint = '[['#13#10'scale:parent w:20% off:0|'#13#10']]'
        Margins.Left = 10
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        ParentColor = False
        Align = alLeft
        TabOrder = 4
        object Block40: TUniContainerPanel
          Left = 24
          Top = 24
          Width = 39
          Height = 40
          Hint = 
            '[['#13#10'pos-l:10|'#13#10'center:parent y|'#13#10'scale:parent w:100%-left off:10' +
            ' |'#13#10']]'
          ParentColor = False
          Color = clGray
          TabOrder = 1
        end
      end
      object b3: TUniContainerPanel
        Tag = 1
        Left = 160
        Top = 0
        Width = 80
        Height = 80
        Hint = '[['#13#10'scale:parent w:20% off:0|'#13#10']]'
        Margins.Left = 10
        Margins.Top = 0
        Margins.Right = 10
        Margins.Bottom = 0
        ParentColor = False
        Align = alLeft
        TabOrder = 5
        object Block30: TUniContainerPanel
          Left = 22
          Top = 22
          Width = 39
          Height = 40
          Hint = 
            '[['#13#10'pos-l:10|'#13#10'center:parent y|'#13#10'scale:parent w:100%-left off:10' +
            ' |'#13#10']]'
          ParentColor = False
          Color = clGray
          TabOrder = 1
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
