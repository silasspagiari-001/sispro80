object frmDEMO_BAR_RATING: TfrmDEMO_BAR_RATING
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
    ScrollHeight = 657
    ScrollWidth = 769
    object rcBlock1000: TUniContainerPanel
      Tag = 4
      Left = 40
      Top = 614
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 0
    end
    object rcBlock10: TUniContainerPanel
      Tag = 4
      Left = 29
      Top = 32
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
        Caption = 'Bar Rating'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock20: TUniContainerPanel
      Tag = 1
      Left = 32
      Top = 89
      Width = 220
      Height = 150
      Hint = 
        '[['#13#10'cols:4 |'#13#10'round:no | '#13#10'cls:card-info-box-white rc-dashed-blo' +
        'ck '#13#10']]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        220
        150)
      object UniLabel2: TUniLabel
        Left = 0
        Top = 3
        Width = 130
        Height = 23
        Cursor = crHandPoint
        Hint = '[['#13#10'pos-t:6|'#13#10'center:parent x |'#13#10']]'
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = '1 / 10 Rating'
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object paRating1to10: TUniContainerPanel
        Left = 11
        Top = 42
        Width = 190
        Height = 60
        Hint = 
          '[['#13#10'bar-rating:1to10 '#13#10'0,1,2,3*,4,5,6,7,8,9|'#13#10'pos-l:0|'#13#10'scale:pa' +
          'rent w:100%|'#13#10'max-width:252|'#13#10'center:parent x'#13#10']]'
        ParentColor = False
        TabOrder = 2
      end
      object btnGetSelected: TUniButton
        Left = 11
        Top = 105
        Width = 119
        Height = 29
        Hint = '[['#13#10'center:parent x|'#13#10'cls:ButtonCrud'#13#10']]'
        Margins.Bottom = 42
        Caption = 'Show Selected'
        Anchors = [akTop, akRight]
        TabOrder = 3
        OnClick = btnGetSelectedClick
      end
    end
    object rcBlock40: TUniContainerPanel
      Tag = 1
      Left = 496
      Top = 99
      Width = 220
      Height = 150
      Hint = 
        '[['#13#10'cols:4 |'#13#10'round:no | '#13#10'cls:card-info-box-white rc-dashed-blo' +
        'ck '#13#10']]'
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        220
        150)
      object UniLabel4: TUniLabel
        Left = 0
        Top = 4
        Width = 130
        Height = 23
        Cursor = crHandPoint
        Hint = '[['#13#10'pos-t:6|'#13#10'center:parent x |'#13#10']]'
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Square Rating'
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object paRatingSquare: TUniContainerPanel
        Left = 15
        Top = 42
        Width = 190
        Height = 60
        Hint = 
          '[['#13#10'bar-rating:square 1,2,3,4,5|'#13#10'pos-l:0|'#13#10'scale:parent w:100%|' +
          #13#10'max-width:252|'#13#10'center:parent x'#13#10']]'
        ParentColor = False
        TabOrder = 2
      end
      object UniButton2: TUniButton
        Left = 15
        Top = 105
        Width = 119
        Height = 29
        Hint = '[['#13#10'center:parent x|'#13#10'cls:ButtonCrud'#13#10']]'
        Margins.Bottom = 42
        Caption = 'Show Selected'
        Anchors = [akTop, akRight]
        TabOrder = 3
        OnClick = UniButton2Click
      end
    end
    object rcBlock50: TUniContainerPanel
      Tag = 1
      Left = 32
      Top = 255
      Width = 220
      Height = 150
      Hint = 
        '[['#13#10'cols:4 |'#13#10'round:no | '#13#10'cls:card-info-box-white rc-dashed-blo' +
        'ck '#13#10']]'
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        220
        150)
      object UniLabel6: TUniLabel
        Left = 0
        Top = 4
        Width = 130
        Height = 23
        Cursor = crHandPoint
        Hint = '[['#13#10'pos-t:6|'#13#10'center:parent x |'#13#10']]'
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Pill Rating'
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object paRatingPill: TUniContainerPanel
        Left = 11
        Top = 42
        Width = 190
        Height = 60
        Hint = 
          '[['#13#10'bar-rating:pill A,B,C,D,E,F|'#13#10'pos-l:0|'#13#10'scale:parent w:100%|' +
          #13#10'max-width:252|'#13#10'center:parent x'#13#10']]'
        ParentColor = False
        TabOrder = 2
      end
      object UniButton3: TUniButton
        Left = 17
        Top = 105
        Width = 119
        Height = 29
        Hint = '[['#13#10'center:parent x|'#13#10'cls:ButtonCrud'#13#10']]'
        Margins.Bottom = 42
        Caption = 'Show Selected'
        Anchors = [akTop, akRight]
        TabOrder = 3
        OnClick = UniButton3Click
      end
    end
    object rcBlock30: TUniContainerPanel
      Tag = 1
      Left = 256
      Top = 95
      Width = 220
      Height = 150
      Hint = 
        '[['#13#10'cols:4 |'#13#10'round:no | '#13#10'cls:card-info-box-white rc-dashed-blo' +
        'ck '#13#10']]'
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        220
        150)
      object UniLabel8: TUniLabel
        Left = 0
        Top = 4
        Width = 130
        Height = 23
        Cursor = crHandPoint
        Hint = '[['#13#10'pos-t:6|'#13#10'center:parent x |'#13#10']]'
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Movie Rating'
        ParentFont = False
        Font.Height = -13
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object paRatingMovie: TUniContainerPanel
        Left = 11
        Top = 42
        Width = 190
        Height = 60
        Hint = 
          '[['#13#10'bar-rating:movie'#13#10'bad,'#13#10'mediocre,'#13#10'good,'#13#10'awesome|'#13#10'pos-l:0|' +
          #13#10'scale:parent w:100%|'#13#10'max-width:252|'#13#10'center:parent x'#13#10']]'
        ParentColor = False
        TabOrder = 2
      end
      object UniButton1: TUniButton
        Left = 13
        Top = 105
        Width = 119
        Height = 29
        Hint = '[['#13#10'center:parent x|'#13#10'cls:ButtonCrud'#13#10']]'
        Margins.Bottom = 42
        Caption = 'Show Selected'
        Anchors = [akTop, akRight]
        TabOrder = 3
        OnClick = UniButton1Click
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
