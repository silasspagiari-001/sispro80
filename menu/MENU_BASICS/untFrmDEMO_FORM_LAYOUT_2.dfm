object frmDEMO_FORM_LAYOUT_2: TfrmDEMO_FORM_LAYOUT_2
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
    ScrollHeight = 486
    ScrollWidth = 933
    object rcBlock2: TUniContainerPanel
      Tag = 4
      Left = 19
      Top = 32
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 0
      object UniLabel1: TUniLabel
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
        Caption = 'Form Layout #2'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock10: TUniContainerPanel
      Tag = 1
      Left = 34
      Top = 78
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-12]]'
      ParentColor = False
      Color = clMoneyGreen
      TabOrder = 1
    end
    object rcBlock20: TUniContainerPanel
      Tag = 1
      Left = 63
      Top = 132
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-12]]'
      ParentColor = False
      Color = clMoneyGreen
      TabOrder = 2
    end
    object rcBlock30: TUniContainerPanel
      Left = 43
      Top = 220
      Width = 890
      Height = 266
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'hr:parent-top off:default-offset mo' +
        'bile-h-off|'#13#10'min-height:425 /* 6.0.0.0 */'#13#10']]'
      ParentColor = False
      Color = clInfoBk
      TabOrder = 3
      object rcBlock40: TUniContainerPanel
        Left = 19
        Top = 22
        Width = 217
        Height = 220
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-2 |'#13#10'hr:xs-150 sm-150 md-(parent:100%) |' +
          #13#10'noborder-left|'#13#10'noborder-right:mobile|'#13#10'noborder-top|'#13#10'noborde' +
          'r-bottom:desktop|'#13#10']]'#13#10
        ParentColor = False
        Color = clMoneyGreen
        TabOrder = 1
        DesignSize = (
          217
          220)
        object UniDBGrid1Clone: TUniDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 2
          Width = 211
          Height = 216
          Hint = ''
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
          ReadOnly = True
          LoadMask.Message = 'Loading data...'
          Anchors = [akLeft, akTop, akRight, akBottom]
          TabOrder = 1
        end
      end
      object rcBlock50: TUniContainerPanel
        Left = 260
        Top = 23
        Width = 593
        Height = 220
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-10 |'#13#10'hr:parent-top  |'#13#10'noborder-left:mo' +
          'bile|'#13#10'noborder-right|'#13#10'noborder-top:desktop|'#13#10'noborder-bottom|'#13 +
          #10']]'#13#10#13#10#13#10
        ParentColor = False
        Color = clMoneyGreen
        TabOrder = 2
        DesignSize = (
          593
          220)
        object UniDBGrid2Clone: TUniDBGrid
          AlignWithMargins = True
          Left = 3
          Top = 1
          Width = 587
          Height = 217
          Hint = ''
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
          ReadOnly = True
          LoadMask.Message = 'Loading data...'
          Anchors = [akLeft, akTop, akRight, akBottom]
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
