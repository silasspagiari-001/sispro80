object frmDEMO_COLS_DEBUG: TfrmDEMO_COLS_DEBUG
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
    ScrollHeight = 404
    ScrollWidth = 980
    object rcBlock5: TUniContainerPanel
      Tag = 4
      Left = 27
      Top = 66
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
        Hint = '[[bsh5:|cls:left-center]]'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = '"cols-debug:" Demo'
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
      Left = 33
      Top = 148
      Width = 200
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-6|'#13#10'cols-debug:'#13#10']]'
      ParentColor = False
      TabOrder = 1
    end
    object rcBlock20: TUniContainerPanel
      Tag = 1
      Left = 280
      Top = 148
      Width = 200
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-6|'#13#10'cols-debug:'#13#10']]'
      ParentColor = False
      TabOrder = 2
    end
    object rcBlock30: TUniContainerPanel
      Tag = 1
      Left = 39
      Top = 250
      Width = 200
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-4|'#13#10'cols-debug:'#13#10']]'
      ParentColor = False
      TabOrder = 3
    end
    object rcBlock40: TUniContainerPanel
      Tag = 1
      Left = 280
      Top = 255
      Width = 200
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-4|'#13#10'cols-debug:'#13#10']]'
      ParentColor = False
      TabOrder = 4
    end
    object rcBlock50: TUniContainerPanel
      Tag = 1
      Left = 532
      Top = 255
      Width = 200
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-4|'#13#10'cols-debug:'#13#10']]'
      ParentColor = False
      TabOrder = 5
    end
    object rcBlock60: TUniContainerPanel
      Tag = 1
      Left = 39
      Top = 344
      Width = 200
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2|'#13#10'cols-debug:'#13#10']]'
      ParentColor = False
      TabOrder = 6
      DesignSize = (
        200
        60)
      object rcEdit100: TUniEdit
        Left = 0
        Top = 22
        Width = 200
        Height = 38
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
    end
    object rcBlock70: TUniContainerPanel
      Tag = 1
      Left = 286
      Top = 344
      Width = 200
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2|'#13#10'cols-debug:'#13#10']]'
      ParentColor = False
      TabOrder = 7
      DesignSize = (
        200
        60)
      object UniEdit1: TUniEdit
        Left = 0
        Top = 22
        Width = 200
        Height = 38
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
    end
    object rcBlock80: TUniContainerPanel
      Tag = 1
      Left = 529
      Top = 344
      Width = 200
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-3|'#13#10'cols-debug:'#13#10']]'
      ParentColor = False
      TabOrder = 8
      DesignSize = (
        200
        60)
      object UniEdit2: TUniEdit
        Left = 0
        Top = 22
        Width = 200
        Height = 38
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
    end
    object rcBlock90: TUniContainerPanel
      Tag = 1
      Left = 780
      Top = 344
      Width = 200
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-5|'#13#10'cols-debug:'#13#10']]'
      ParentColor = False
      TabOrder = 9
      DesignSize = (
        200
        60)
      object UniEdit3: TUniEdit
        Left = 0
        Top = 22
        Width = 200
        Height = 38
        Hint = ''
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
