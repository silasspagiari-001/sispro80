object frmDEMO_BADGES: TfrmDEMO_BADGES
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
    ScrollWidth = 770
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
    object rcBlock187: TUniContainerPanel
      Tag = 4
      Left = 41
      Top = 44
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
        Caption = 'Badges'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock188: TUniContainerPanel
      Tag = 1
      Left = 38
      Top = 96
      Width = 140
      Height = 68
      Hint = '[['#13#10'cols:xs-6 sm-6 md-3 |'#13#10'cls:card-info-box-white'#13#10']]'#13#10
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        140
        68)
      object UniLabel2: TUniLabel
        Left = 8
        Top = 6
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent x |'#13#10'badge:10 color:primary]]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Primary'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 1
      end
      object UniLabel5: TUniLabel
        Left = 8
        Top = 38
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent x |'#13#10'badge:10 color:secondary top'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Secondary'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        TabOrder = 2
      end
    end
    object rcBlock189: TUniContainerPanel
      Tag = 1
      Left = 184
      Top = 91
      Width = 140
      Height = 68
      Hint = '[['#13#10'cols:xs-6 sm-6 md-3 |'#13#10'cls:card-info-box-white'#13#10']]'#13#10
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        140
        68)
      object UniLabel3: TUniLabel
        Left = 8
        Top = 6
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent x |'#13#10'badge:10 color:success bottom'#13#10']]'#13#10
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Success'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 1
      end
      object UniLabel7: TUniLabel
        Left = 8
        Top = 38
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent x |'#13#10'badge:10 color:danger'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Danger'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 2
      end
    end
    object rcBlock192: TUniContainerPanel
      Tag = 1
      Left = 491
      Top = 91
      Width = 140
      Height = 68
      Hint = '[['#13#10'cols:xs-6 sm-6 md-3 |'#13#10'cls:card-info-box-white'#13#10']]'#13#10
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        140
        68)
      object UniLabel4: TUniLabel
        Left = 8
        Top = 6
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent x |'#13#10'badge:10 color:light'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Light'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 1
      end
      object UniLabel11: TUniLabel
        Left = 8
        Top = 38
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent x |'#13#10'badge:10 color:dark'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Dark'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 2
      end
    end
    object rcBlock190: TUniContainerPanel
      Tag = 1
      Left = 337
      Top = 110
      Width = 140
      Height = 68
      Hint = '[['#13#10'cols:xs-6 sm-6 md-3 |'#13#10'cls:card-info-box-white'#13#10']]'#13#10
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        140
        68)
      object UniLabel8: TUniLabel
        Left = 8
        Top = 6
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent x|'#13#10'badge:10 color:warning'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Warning'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 1
      end
      object UniLabel9: TUniLabel
        Left = 8
        Top = 38
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent x |'#13#10'badge:10 color:info'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Info'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 2
      end
    end
    object rcBlock200: TUniContainerPanel
      Tag = 1
      Left = 38
      Top = 206
      Width = 140
      Height = 68
      Hint = '[['#13#10'cols:xs-6 sm-6 md-3 |'#13#10'cls:card-info-box-white'#13#10']]'#13#10
      ParentColor = False
      TabOrder = 6
      DesignSize = (
        140
        68)
      object UniLabel2Clone: TUniLabel
        Left = 8
        Top = 6
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent x |'#13#10'badge:10 color:primary-lite'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Primary'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 1
      end
      object UniLabel5Clone: TUniLabel
        Left = 8
        Top = 38
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent x |'#13#10'badge:10 color:secondary-lite top'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Secondary'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 2
      end
    end
    object rcBlock210: TUniContainerPanel
      Tag = 1
      Left = 184
      Top = 201
      Width = 140
      Height = 68
      Hint = '[['#13#10'cols:xs-6 sm-6 md-3 |'#13#10'cls:card-info-box-white'#13#10']]'#13#10
      ParentColor = False
      TabOrder = 7
      DesignSize = (
        140
        68)
      object UniLabel3Clone: TUniLabel
        Left = 8
        Top = 6
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent x |'#13#10'badge:10 color:success-lite bottom'#13#10']]'#13#10
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Success'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 1
      end
      object UniLabel7Clone: TUniLabel
        Left = 8
        Top = 38
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent x |'#13#10'badge:10 color:danger-lite'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Danger'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 2
      end
    end
    object rcBlock230: TUniContainerPanel
      Tag = 1
      Left = 491
      Top = 201
      Width = 140
      Height = 68
      Hint = '[['#13#10'cols:xs-6 sm-6 md-3 |'#13#10'cls:card-info-box-white'#13#10']]'#13#10
      ParentColor = False
      TabOrder = 8
      DesignSize = (
        140
        68)
      object UniLabel4Clone: TUniLabel
        Left = 8
        Top = 6
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent x |'#13#10'badge:10 color:light-lite'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Light'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 1
      end
      object UniLabel11Clone: TUniLabel
        Left = 8
        Top = 38
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent x |'#13#10'badge:10 color:dark-lite'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Dark'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 2
      end
    end
    object rcBlock220: TUniContainerPanel
      Tag = 1
      Left = 337
      Top = 220
      Width = 140
      Height = 68
      Hint = '[['#13#10'cols:xs-6 sm-6 md-3 |'#13#10'cls:card-info-box-white'#13#10']]'#13#10
      ParentColor = False
      TabOrder = 9
      DesignSize = (
        140
        68)
      object UniLabel8Clone: TUniLabel
        Left = 8
        Top = 6
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent x|'#13#10'badge:10 color:warning-lite'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Warning'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 1
      end
      object UniLabel9Clone: TUniLabel
        Left = 8
        Top = 38
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent x |'#13#10'badge:10 color:info-lite'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Info'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 2
      end
    end
    object rcBlock240: TUniContainerPanel
      Tag = 1
      Left = 40
      Top = 304
      Width = 140
      Height = 68
      Hint = '[['#13#10'cols:xs-6 sm-6 md-3 |'#13#10'cls:card-info-box-white'#13#10']]'#13#10
      ParentColor = False
      TabOrder = 10
      DesignSize = (
        140
        68)
      object UniLabel2CloneClone: TUniLabel
        Left = 8
        Top = 6
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent x |'#13#10'badge:10 color:primary-lite-border'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Primary'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 1
      end
      object UniLabel5CloneClone: TUniLabel
        Left = 8
        Top = 38
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'center:parent x |'#13#10'badge:10 color:secondary-lite-border top'#13 +
          #10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Secondary'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 2
      end
    end
    object rcBlock250: TUniContainerPanel
      Tag = 1
      Left = 186
      Top = 299
      Width = 140
      Height = 68
      Hint = '[['#13#10'cols:xs-6 sm-6 md-3 |'#13#10'cls:card-info-box-white'#13#10']]'#13#10
      ParentColor = False
      TabOrder = 11
      DesignSize = (
        140
        68)
      object UniLabel3CloneClone: TUniLabel
        Left = 8
        Top = 6
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'center:parent x |'#13#10'badge:10 color:success-lite-border bottom' +
          #13#10']]'#13#10
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Success'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 1
      end
      object UniLabel7CloneClone: TUniLabel
        Left = 8
        Top = 38
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent x |'#13#10'badge:10 color:danger-lite-border'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Danger'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 2
      end
    end
    object rcBlock270: TUniContainerPanel
      Tag = 1
      Left = 493
      Top = 299
      Width = 140
      Height = 68
      Hint = '[['#13#10'cols:xs-6 sm-6 md-3 |'#13#10'cls:card-info-box-white'#13#10']]'#13#10
      ParentColor = False
      TabOrder = 12
      DesignSize = (
        140
        68)
      object UniLabel4CloneClone: TUniLabel
        Left = 8
        Top = 6
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent x |'#13#10'badge:10 color:light-lite-border'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Light'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 1
      end
      object UniLabel11CloneClone: TUniLabel
        Left = 8
        Top = 38
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent x |'#13#10'badge:10 color:dark-lite-border'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Dark'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 2
      end
    end
    object rcBlock260: TUniContainerPanel
      Tag = 1
      Left = 347
      Top = 305
      Width = 140
      Height = 68
      Hint = '[['#13#10'cols:xs-6 sm-6 md-3 |'#13#10'cls:card-info-box-white'#13#10']]'#13#10
      ParentColor = False
      TabOrder = 13
      DesignSize = (
        140
        68)
      object UniLabel8CloneClone: TUniLabel
        Left = 8
        Top = 6
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent x|'#13#10'badge:10 color:warning-lite-border'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Warning'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 1
      end
      object UniLabel9CloneClone: TUniLabel
        Left = 8
        Top = 38
        Width = 125
        Height = 21
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent x |'#13#10'badge:10 color:info-lite-border'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Info'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 2
      end
    end
    object rcBlock280: TUniContainerPanel
      Tag = 1
      Left = 41
      Top = 394
      Width = 140
      Height = 86
      Hint = '[['#13#10'cols:xs-6 sm-6 md-3 |'#13#10'cls:card-info-box-white'#13#10']]'#13#10
      ParentColor = False
      TabOrder = 14
      DesignSize = (
        140
        86)
      object UniLabel2CloneCloneClone: TUniLabel
        Left = 8
        Top = 6
        Width = 125
        Height = 30
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'center:parent x |'#13#10'badge:Primary color:primary-lite img:http' +
          's://github.com/mdo.png'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Primary'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 1
      end
      object UniLabel5CloneCloneClone: TUniLabel
        Left = 8
        Top = 44
        Width = 125
        Height = 30
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'center:parent x |'#13#10'badge:Secondary color:secondary-lite img:' +
          'https://github.com/mdo.png'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Secondary'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 2
      end
    end
    object rcBlock290: TUniContainerPanel
      Tag = 1
      Left = 187
      Top = 389
      Width = 140
      Height = 86
      Hint = '[['#13#10'cols:xs-6 sm-6 md-3 |'#13#10'cls:card-info-box-white'#13#10']]'#13#10
      ParentColor = False
      TabOrder = 15
      DesignSize = (
        140
        86)
      object UniLabel3CloneCloneClone: TUniLabel
        Left = 8
        Top = 6
        Width = 125
        Height = 30
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'center:parent x |'#13#10'badge:Success color:success-lite img:file' +
          's\images\avatars\avatar.png'#13#10']]'#13#10
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Success'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 1
      end
      object UniLabel7CloneCloneClone: TUniLabel
        Left = 8
        Top = 44
        Width = 125
        Height = 30
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'center:parent x |'#13#10'badge:Danger color:danger-lite img:files\' +
          'images\avatars\avatar2.png'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Danger'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 2
      end
    end
    object rcBlock310: TUniContainerPanel
      Tag = 1
      Left = 494
      Top = 389
      Width = 140
      Height = 86
      Hint = '[['#13#10'cols:xs-6 sm-6 md-3 |'#13#10'cls:card-info-box-white'#13#10']]'#13#10
      ParentColor = False
      TabOrder = 16
      DesignSize = (
        140
        86)
      object UniLabel4CloneCloneClone: TUniLabel
        Left = 8
        Top = 6
        Width = 125
        Height = 30
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'center:parent x |'#13#10'badge:Light color:light-lite img:files\im' +
          'ages\avatars\avatar_5.png'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Light'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 1
      end
      object UniLabel11CloneCloneClone: TUniLabel
        Left = 8
        Top = 44
        Width = 125
        Height = 30
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'center:parent x |'#13#10'badge:Dark color:dark-lite img:files\imag' +
          'es\avatars\avatar_6.png'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Dark'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 2
      end
    end
    object rcBlock300: TUniContainerPanel
      Tag = 1
      Left = 340
      Top = 408
      Width = 140
      Height = 86
      Hint = '[['#13#10'cols:xs-6 sm-6 md-3 |'#13#10'cls:card-info-box-white'#13#10']]'#13#10
      ParentColor = False
      TabOrder = 17
      DesignSize = (
        140
        86)
      object UniLabel8CloneCloneClone: TUniLabel
        Left = 8
        Top = 6
        Width = 125
        Height = 30
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'center:parent x|'#13#10'badge:Warning color:warning-lite img:files' +
          '\images\avatars\avatar_3.png'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Warning'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 1
      end
      object UniLabel9CloneCloneClone: TUniLabel
        Left = 8
        Top = 44
        Width = 125
        Height = 30
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'center:parent x |'#13#10'badge:Info color:info-lite img:files\imag' +
          'es\avatars\avatar_4.png'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Info'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        TabOrder = 2
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
