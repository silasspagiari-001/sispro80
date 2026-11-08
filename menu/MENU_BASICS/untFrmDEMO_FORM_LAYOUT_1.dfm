object frmDEMO_FORM_LAYOUT_1: TfrmDEMO_FORM_LAYOUT_1
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
    ExplicitLeft = 3
    ExplicitTop = -34
    ScrollHeight = 627
    ScrollWidth = 915
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
        Caption = 'Form Layout #1'
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
      Tag = 1
      Left = 15
      Top = 184
      Width = 900
      Height = 317
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'hr:parent-top off:92 off-mobile-v-0' +
        ' off-mobile-h-0 |'#13#10'min-height:250|'#13#10'max-height:mobile-v-300 |'#13#10']' +
        ']'#13#10#13#10#13#10
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        900
        317)
      object UniDBGrid1: TUniDBGrid
        Left = 3
        Top = 3
        Width = 894
        Height = 311
        Hint = ''
        LoadMask.Message = 'Loading data...'
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
      end
    end
    object rcBlock40: TUniContainerPanel
      Tag = 1
      Left = 150
      Top = 567
      Width = 150
      Height = 60
      Hint = '[[cols:xs-6 sm-6 md-3]]'
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        150
        60)
      object UniLabel2: TUniLabel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 20
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Qtd'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edQuantNotas: TUniEdit
        Left = 0
        Top = 21
        Width = 149
        Height = 38
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Alignment = taCenter
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        TabStop = False
        ReadOnly = True
      end
    end
    object rcBlock50: TUniContainerPanel
      Tag = 1
      Left = 313
      Top = 567
      Width = 150
      Height = 60
      Hint = '[[cols:xs-6 sm-6 md-3]]'
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        150
        60)
      object UniLabel3: TUniLabel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 27
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Total'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edValorNotas: TUniEdit
        Left = 0
        Top = 21
        Width = 149
        Height = 38
        Hint = #13#10
        Margins.Right = 5
        CharCase = ecUpperCase
        Alignment = taRightJustify
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        TabStop = False
        ReadOnly = True
      end
    end
    object rcBlock60: TUniContainerPanel
      Tag = 1
      Left = 495
      Top = 567
      Width = 150
      Height = 60
      Hint = '[[cols:xs-6 sm-6 md-3]]'
      ParentColor = False
      TabOrder = 6
      DesignSize = (
        150
        60)
      object UniLabel4: TUniLabel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 20
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Qtd'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edQuantAutorizadas: TUniEdit
        Left = 0
        Top = 21
        Width = 149
        Height = 38
        Hint = #13#10
        Margins.Right = 5
        CharCase = ecUpperCase
        Alignment = taCenter
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        TabStop = False
        ReadOnly = True
      end
    end
    object rcBlock70: TUniContainerPanel
      Tag = 1
      Left = 659
      Top = 567
      Width = 150
      Height = 60
      Hint = '[[cols:xs-6 sm-6 md-3]]'
      ParentColor = False
      TabOrder = 7
      DesignSize = (
        150
        60)
      object UniLabel5: TUniLabel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 27
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Total'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edValorAutorizadas: TUniEdit
        Left = 0
        Top = 21
        Width = 149
        Height = 38
        Hint = #13#10
        Margins.Right = 5
        CharCase = ecUpperCase
        Alignment = taRightJustify
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        TabStop = False
        ReadOnly = True
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
