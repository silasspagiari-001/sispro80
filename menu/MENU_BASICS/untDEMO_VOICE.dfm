object frmDEMO_VOICE: TfrmDEMO_VOICE
  Left = 0
  Top = 0
  Width = 728
  Height = 518
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  object UniScrollBox1: TUniScrollBox
    Left = 0
    Top = 0
    Width = 728
    Height = 518
    Hint = ''
    Align = alClient
    TabOrder = 0
    DesignSize = (
      726
      516)
    ScrollHeight = 395
    ScrollWidth = 547
    object rcBlock10: TUniContainerPanel
      Tag = 4
      Left = 14
      Top = 21
      Width = 533
      Height = 43
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'max-width:900|'#13#10'center:parent x |'#13#10 +
        ']]'
      ParentColor = False
      TabOrder = 0
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 521
        Height = 31
        Hint = '[[bsh5:|pos-l:8|center:parent y]]'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = 'Responsive Voice DEMO'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock100: TUniContainerPanel
      Left = 20
      Top = 335
      Width = 437
      Height = 60
      Hint = '[[cols:xs-12 sm-12 md-12]]'
      ParentColor = False
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      DesignSize = (
        437
        60)
      object edVoice: TUniEdit
        Left = 0
        Top = 22
        Width = 397
        Height = 38
        Hint = '[['#13#10'cls:border-bottom-edit |'#13#10']]'
        Text = 'UNIGUI Powered by RadCORE'
        ParentFont = False
        Font.Height = -15
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ClearButton = True
      end
      object UniBitBtn1: TUniBitBtn
        Left = 398
        Top = 22
        Width = 37
        Height = 38
        Hint = '[['#13#10'ico:fas-play|'#13#10'cls:ButtonCrud|'#13#10']]'
        Caption = 'UniBitBtn1'
        Anchors = [akTop, akRight]
        TabOrder = 2
        OnClick = UniBitBtn1Click
      end
      object UniLabel5: TUniLabel
        Left = 0
        Top = 0
        Width = 76
        Height = 15
        Hint = ''
        Caption = 'Text to Speech'
        Align = alTop
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
      end
    end
    object rcBlock30: TUniContainerPanel
      Tag = 1
      Left = 162
      Top = 92
      Width = 245
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-4'#13#10']]'
      ParentColor = False
      TabOrder = 2
      object rcLabel20: TUniLabel
        Left = 0
        Top = 0
        Width = 83
        Height = 15
        Hint = ''
        Caption = 'Selecione a Voz'
        Align = alTop
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object cbxVoices: TUniComboBox
        Left = 0
        Top = 22
        Width = 245
        Height = 38
        Hint = ''
        Text = ''
        Align = alBottom
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 2
        IconItems = <>
      end
    end
    object rcBlock20: TUniContainerPanel
      Tag = 1
      Left = 34
      Top = 92
      Width = 111
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 3
      object rcLabel30: TUniLabel
        Left = 0
        Top = 0
        Width = 19
        Height = 15
        Hint = ''
        Caption = 'Key'
        Align = alTop
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object rcEdit30: TUniEdit
        Left = 0
        Top = 22
        Width = 111
        Height = 38
        Hint = ''
        PasswordChar = '*'
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Align = alBottom
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object rcBlock40: TUniContainerPanel
      Tag = 1
      Left = 56
      Top = 204
      Width = 111
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 4
      object UniLabel2: TUniLabel
        Left = 0
        Top = 0
        Width = 28
        Height = 15
        Hint = ''
        Caption = 'Pitch'
        Align = alTop
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object cbxPitch: TUniComboBox
        Left = 0
        Top = 22
        Width = 111
        Height = 38
        Hint = ''
        Text = ''
        Items.Strings = (
          '0'
          '1'
          '2')
        ItemIndex = 1
        Align = alBottom
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 2
        IconItems = <>
      end
    end
    object rcBlock50: TUniContainerPanel
      Tag = 1
      Left = 182
      Top = 204
      Width = 111
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 5
      object UniLabel3: TUniLabel
        Left = 0
        Top = 0
        Width = 24
        Height = 15
        Hint = ''
        Caption = 'Rate'
        Align = alTop
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object cbxRate: TUniComboBox
        Left = 0
        Top = 22
        Width = 111
        Height = 38
        Hint = ''
        Text = ''
        Items.Strings = (
          '0.0'
          '0.5'
          '1.0'
          '1.5')
        ItemIndex = 2
        Align = alBottom
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 2
        IconItems = <>
      end
    end
    object rcBlock60: TUniContainerPanel
      Tag = 1
      Left = 324
      Top = 204
      Width = 111
      Height = 60
      Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
      ParentColor = False
      TabOrder = 6
      object UniLabel4: TUniLabel
        Left = 0
        Top = 0
        Width = 40
        Height = 15
        Hint = ''
        Caption = 'Volume'
        Align = alTop
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object cbxVolume: TUniComboBox
        Left = 0
        Top = 22
        Width = 111
        Height = 38
        Hint = ''
        Text = ''
        Items.Strings = (
          '0'
          '1')
        ItemIndex = 1
        Align = alBottom
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 2
        IconItems = <>
      end
    end
  end
end
