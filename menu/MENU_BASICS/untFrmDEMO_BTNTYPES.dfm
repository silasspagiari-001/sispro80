object frmDEMO_BTNTYPES: TfrmDEMO_BTNTYPES
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
    ScrollWidth = 876
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
      Left = 25
      Top = 34
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
        Caption = 'Button Types'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock100: TUniContainerPanel
      Tag = 1
      Left = 32
      Top = 96
      Width = 120
      Height = 60
      Hint = '[[cols-grid:18|cols:xs-18 sm-9 md-3]]'
      ParentColor = False
      TabOrder = 2
      object UniLabel2: TUniLabel
        Left = 0
        Top = 0
        Width = 40
        Height = 15
        Hint = ''
        Caption = 'Default'
        Align = alTop
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniEdit1: TUniEdit
        Left = 0
        Top = 22
        Width = 120
        Height = 38
        Hint = '[['#13#10'link: |'#13#10'valid:blank=Site'#13#10']]'
        Text = ''
        Align = alBottom
        TabOrder = 2
      end
    end
    object rcBlock150: TUniContainerPanel
      Tag = 1
      Left = 31
      Top = 177
      Width = 120
      Height = 60
      Hint = '[[cols-grid:18|cols:xs-18 sm-9 md-3]]'
      ParentColor = False
      TabOrder = 3
      object UniLabel3: TUniLabel
        Left = 0
        Top = 0
        Width = 40
        Height = 15
        Hint = ''
        Caption = 'Default'
        Align = alTop
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edClip: TUniEdit
        Left = 0
        Top = 22
        Width = 120
        Height = 38
        Hint = '[['#13#10'clipboard: |'#13#10'valid:email notblank |'#13#10'keyboard:off'#13#10']]'
        Text = ''
        Align = alBottom
        TabOrder = 2
      end
    end
    object rcBlock120: TUniContainerPanel
      Tag = 1
      Left = 338
      Top = 93
      Width = 120
      Height = 60
      Hint = '[[cols-grid:18|cols:xs-18 sm-9 md-3]]'
      ParentColor = False
      TabOrder = 4
      object UniLabel4: TUniLabel
        Left = 0
        Top = 0
        Width = 42
        Height = 15
        Hint = ''
        Caption = 'OutLine'
        Align = alTop
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniEdit2: TUniEdit
        Left = 0
        Top = 22
        Width = 120
        Height = 38
        Hint = '[['#13#10'link: |'#13#10'btntype:theme outline|'#13#10'valid:blank=Site'#13#10']]'
        Text = ''
        Align = alBottom
        TabOrder = 2
      end
    end
    object rcBlock130: TUniContainerPanel
      Tag = 1
      Left = 476
      Top = 87
      Width = 120
      Height = 60
      Hint = '[[cols-grid:18|cols:xs-18 sm-9 md-3]]'
      ParentColor = False
      TabOrder = 5
      object UniLabel5: TUniLabel
        Left = 0
        Top = 0
        Width = 26
        Height = 15
        Hint = ''
        Caption = 'Gray'
        Align = alTop
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniEdit4: TUniEdit
        Left = 0
        Top = 22
        Width = 120
        Height = 38
        Hint = '[['#13#10'link: |btntype:gray|'#13#10'valid:blank=Site'#13#10']]'
        Text = ''
        Align = alBottom
        TabOrder = 2
      end
    end
    object rcBlock140: TUniContainerPanel
      Tag = 1
      Left = 608
      Top = 101
      Width = 120
      Height = 60
      Hint = '[[cols-grid:18|cols:xs-18 sm-9 md-3]]'
      ParentColor = False
      TabOrder = 6
      object UniLabel6: TUniLabel
        Left = 0
        Top = 0
        Width = 33
        Height = 15
        Hint = ''
        Caption = 'White'
        Align = alTop
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniEdit6: TUniEdit
        Left = 0
        Top = 22
        Width = 120
        Height = 38
        Hint = '[['#13#10'link: |btntype:white|'#13#10'valid:blank=Site'#13#10']]'
        Text = ''
        Align = alBottom
        TabOrder = 2
      end
    end
    object rcBlock170: TUniContainerPanel
      Tag = 1
      Left = 339
      Top = 177
      Width = 120
      Height = 60
      Hint = '[[cols-grid:18|cols:xs-18 sm-9 md-3]]'
      ParentColor = False
      TabOrder = 7
      object UniLabel7: TUniLabel
        Left = 0
        Top = 0
        Width = 42
        Height = 15
        Hint = ''
        Caption = 'OutLine'
        Align = alTop
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniEdit7: TUniEdit
        Left = 0
        Top = 22
        Width = 120
        Height = 38
        Hint = 
          '[['#13#10'clipboard: | btntype:theme outline |'#13#10'valid:email notblank |' +
          #13#10'keyboard:off'#13#10']]'
        Text = ''
        Align = alBottom
        TabOrder = 2
      end
    end
    object rcBlock180: TUniContainerPanel
      Tag = 1
      Left = 472
      Top = 178
      Width = 120
      Height = 60
      Hint = '[[cols-grid:18|cols:xs-18 sm-9 md-3]]'
      ParentColor = False
      TabOrder = 8
      object UniLabel8: TUniLabel
        Left = 0
        Top = 0
        Width = 26
        Height = 15
        Hint = ''
        Caption = 'Gray'
        Align = alTop
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniEdit8: TUniEdit
        Left = 0
        Top = 22
        Width = 120
        Height = 38
        Hint = 
          '[['#13#10'clipboard: | btntype:gray |'#13#10'valid:email notblank |'#13#10'keyboar' +
          'd:off'#13#10']]'
        Text = ''
        Align = alBottom
        TabOrder = 2
      end
    end
    object rcBlock190: TUniContainerPanel
      Tag = 1
      Left = 603
      Top = 177
      Width = 120
      Height = 60
      Hint = '[[cols-grid:18|cols:xs-18 sm-9 md-3]]'
      ParentColor = False
      TabOrder = 9
      object UniLabel9: TUniLabel
        Left = 0
        Top = 0
        Width = 33
        Height = 15
        Hint = ''
        Caption = 'White'
        Align = alTop
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniEdit9: TUniEdit
        Left = 0
        Top = 22
        Width = 120
        Height = 38
        Hint = 
          '[['#13#10'clipboard: | btntype:white |'#13#10'valid:email notblank |'#13#10'keyboa' +
          'rd:off'#13#10']]'
        Text = ''
        Align = alBottom
        TabOrder = 2
      end
    end
    object rcBlock110: TUniContainerPanel
      Tag = 1
      Left = 176
      Top = 93
      Width = 120
      Height = 60
      Hint = '[[cols-grid:18|cols:xs-18 sm-9 md-3]]'
      ParentColor = False
      TabOrder = 10
      object UniLabel10: TUniLabel
        Left = 0
        Top = 0
        Width = 42
        Height = 15
        Hint = ''
        Caption = 'Themed'
        Align = alTop
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniEdit5: TUniEdit
        Left = 0
        Top = 22
        Width = 120
        Height = 38
        Hint = '[['#13#10'link: |'#13#10'btntype:theme |'#13#10'valid:blank=Site'#13#10']]'
        Text = ''
        Align = alBottom
        TabOrder = 2
      end
    end
    object rcBlock160: TUniContainerPanel
      Tag = 1
      Left = 177
      Top = 177
      Width = 120
      Height = 60
      Hint = '[[cols-grid:18|cols:xs-18 sm-9 md-3]]'
      ParentColor = False
      TabOrder = 11
      object UniLabel11: TUniLabel
        Left = 0
        Top = 0
        Width = 42
        Height = 15
        Hint = ''
        Caption = 'Themed'
        Align = alTop
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniEdit3: TUniEdit
        Left = 0
        Top = 22
        Width = 120
        Height = 38
        Hint = 
          '[['#13#10'clipboard: | btntype:theme |'#13#10'valid:email notblank |'#13#10'keyboa' +
          'rd:off'#13#10']]'
        Text = ''
        Align = alBottom
        TabOrder = 2
      end
    end
    object rcBlock400: TUniContainerPanel
      Tag = 1
      Left = 29
      Top = 400
      Width = 120
      Height = 60
      Hint = '[[cols-grid:18|cols:xs-18 sm-9 md-3]]'
      ParentColor = False
      TabOrder = 12
      DesignSize = (
        120
        60)
      object UniLabel12: TUniLabel
        Left = 0
        Top = -3
        Width = 94
        Height = 15
        Hint = '[['#13#10'pos-l:0|'#13#10'pos-t:0'#13#10']]'
        Caption = 'LookUp( Default )'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edLkpFUNCIONARIOS: TUniDBEdit
        Left = 0
        Top = 21
        Width = 120
        Height = 38
        Hint = '[['#13#10'NOME searchonly !|'#13#10']]'#13#10#13#10
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clInfoBk
        ReadOnly = True
        InputType = 'text'
      end
    end
    object rcBlock410: TUniContainerPanel
      Tag = 1
      Left = 175
      Top = 390
      Width = 120
      Height = 60
      Hint = '[[cols-grid:18|cols:xs-18 sm-9 md-3]]'
      ParentColor = False
      TabOrder = 13
      DesignSize = (
        120
        60)
      object UniLabel13: TUniLabel
        Left = 0
        Top = -3
        Width = 96
        Height = 15
        Hint = '[['#13#10'pos-l:0|'#13#10'pos-t:0'#13#10']]'
        Caption = 'LookUp( Themed )'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edLkpFUNCIONARIOS__THEME: TUniDBEdit
        Left = 0
        Top = 21
        Width = 120
        Height = 38
        Hint = '[['#13#10'NOME searchonly !|'#13#10'btntype:theme|'#13#10']]'#13#10#13#10
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clInfoBk
        ReadOnly = True
        InputType = 'text'
      end
    end
    object rcBlock420: TUniContainerPanel
      Tag = 1
      Left = 327
      Top = 389
      Width = 120
      Height = 60
      Hint = '[[cols-grid:18|cols:xs-18 sm-9 md-3]]'
      ParentColor = False
      TabOrder = 14
      DesignSize = (
        120
        60)
      object UniLabel14: TUniLabel
        Left = 0
        Top = -3
        Width = 96
        Height = 15
        Hint = '[['#13#10'pos-l:0|'#13#10'pos-t:0'#13#10']]'
        Caption = 'LookUp( OutLine )'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edLkpFUNCIONARIOS__OUTLINE: TUniDBEdit
        Left = 0
        Top = 21
        Width = 120
        Height = 38
        Hint = '[['#13#10'NOME searchonly !|'#13#10'btntype:theme outline|'#13#10']]'#13#10#13#10
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clInfoBk
        ReadOnly = True
        InputType = 'text'
      end
    end
    object rcBlock430: TUniContainerPanel
      Tag = 1
      Left = 467
      Top = 386
      Width = 120
      Height = 60
      Hint = '[[cols-grid:18|cols:xs-18 sm-9 md-3]]'
      ParentColor = False
      TabOrder = 15
      DesignSize = (
        120
        60)
      object UniLabel15: TUniLabel
        Left = 0
        Top = -3
        Width = 80
        Height = 15
        Hint = '[['#13#10'pos-l:0|'#13#10'pos-t:0'#13#10']]'
        Caption = 'LookUp( Gray )'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edLkpFUNCIONARIOS__GRAY: TUniDBEdit
        Left = 0
        Top = 21
        Width = 120
        Height = 38
        Hint = '[['#13#10'NOME searchonly !|'#13#10'btntype:gray |'#13#10']]'#13#10#13#10
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clInfoBk
        ReadOnly = True
        InputType = 'text'
      end
    end
    object rcBlock440: TUniContainerPanel
      Tag = 1
      Left = 605
      Top = 383
      Width = 120
      Height = 60
      Hint = '[[cols-grid:18|cols:xs-18 sm-9 md-3]]'
      ParentColor = False
      TabOrder = 16
      DesignSize = (
        120
        60)
      object UniLabel16: TUniLabel
        Left = 0
        Top = -3
        Width = 87
        Height = 15
        Hint = '[['#13#10'pos-l:0|'#13#10'pos-t:0'#13#10']]'
        Caption = 'LookUp( White )'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edLkpFUNCIONARIOS__WHITE: TUniDBEdit
        Left = 0
        Top = 21
        Width = 120
        Height = 38
        Hint = '[['#13#10'NOME searchonly !|'#13#10'btntype:white'#13#10']]'#13#10#13#10
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clInfoBk
        ReadOnly = True
        InputType = 'text'
      end
    end
    object rcBlock192: TUniContainerPanel
      Tag = 1
      Left = 749
      Top = 177
      Width = 120
      Height = 60
      Hint = '[[cols-grid:18|cols:xs-18 sm-9 md-3]]'
      ParentColor = False
      TabOrder = 17
      object UniLabel17: TUniLabel
        Left = 0
        Top = 0
        Width = 37
        Height = 15
        Hint = ''
        Caption = 'Trigger'
        Align = alTop
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniEdit10: TUniEdit
        Left = 0
        Top = 22
        Width = 120
        Height = 38
        Hint = 
          '[['#13#10'clipboard: | btntype:trigger |'#13#10'valid:email notblank |'#13#10'keyb' +
          'oard:off'#13#10']]'
        Text = ''
        Align = alBottom
        TabOrder = 2
      end
    end
    object rcBlock142: TUniContainerPanel
      Tag = 1
      Left = 756
      Top = 101
      Width = 120
      Height = 60
      Hint = '[[cols-grid:18|cols:xs-18 sm-9 md-3]]'
      ParentColor = False
      TabOrder = 18
      object UniLabel18: TUniLabel
        Left = 0
        Top = 0
        Width = 37
        Height = 15
        Hint = ''
        Caption = 'Trigger'
        Align = alTop
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniEdit11: TUniEdit
        Left = 0
        Top = 22
        Width = 120
        Height = 38
        Hint = '[['#13#10'link: |btntype:trigger|'#13#10'valid:blank=Site'#13#10']]'
        Text = ''
        Align = alBottom
        TabOrder = 2
      end
    end
    object rcBlock442: TUniContainerPanel
      Tag = 1
      Left = 741
      Top = 373
      Width = 120
      Height = 60
      Hint = '[[cols-grid:18|cols:xs-18 sm-9 md-3]]'
      ParentColor = False
      TabOrder = 19
      DesignSize = (
        120
        60)
      object UniLabel19: TUniLabel
        Left = 0
        Top = -3
        Width = 91
        Height = 15
        Hint = '[['#13#10'pos-l:0|'#13#10'pos-t:0'#13#10']]'
        Caption = 'LookUp( Trigger )'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edLkpFUNCIONARIOS__TRIGGER: TUniDBEdit
        Left = 0
        Top = 21
        Width = 120
        Height = 38
        Hint = '[['#13#10'NOME searchonly !|'#13#10'btntype:trigger'#13#10']]'#13#10#13#10
        CharCase = ecUpperCase
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clInfoBk
        ReadOnly = True
        InputType = 'text'
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
