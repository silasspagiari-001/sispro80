object frmDEMO_PANELS: TfrmDEMO_PANELS
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
    Hint = '[['#13#10#13#10'/*scrollbar-color:#c0c0c0 #fff*/'#13#10']]'
    Align = alClient
    Color = 15395562
    TabOrder = 0
    ScrollHeight = 1887
    ScrollWidth = 975
    object rcBlock10: TUniContainerPanel
      Tag = 4
      Left = 11
      Top = 26
      Width = 729
      Height = 30
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 0
      DesignSize = (
        729
        30)
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 717
        Height = 18
        Hint = '[[bsh5:|cls:left-center]]'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = 'Panels '
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniBitBtn1: TUniBitBtn
        AlignWithMargins = True
        Left = 698
        Top = 1
        Width = 28
        Height = 28
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
    object rcBlock172: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 25
      Top = 596
      Width = 170
      Height = 280
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 lg-3 xl-3 | '#13#10'/*round:no | cls:card-in' +
        'fo-box-white*/'#13#10']]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        170
        280)
      object UniContainerPanel11: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 170
        Height = 42
        Hint = '[['#13#10'/*round:t | cls:card-green*/'#13#10'card:green'#13#10']]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel12: TUniLabel
          Left = 8
          Top = 2
          Width = 108
          Height = 19
          Hint = '[['#13#10'bsh6:|'#13#10'center:parent y|'#13#10'pos-l:14'#13#10']][['
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'RadCORE DEMO'
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object labAlert: TUniLabel
        Left = 8
        Top = 59
        Width = 153
        Height = 79
        Hint = '[[ bsalert:success ]]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 2
      end
      object labAlert2: TUniLabel
        Left = 8
        Top = 155
        Width = 153
        Height = 79
        Hint = '[['#13#10'rcalert:success title:Success Sample'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 3
      end
      object btnChangeAlert1: TUniBitBtn
        Left = 6
        Top = 244
        Width = 101
        Height = 29
        Hint = '[['#13#10'cls:ButtonBlue ButtonRounded | '#13#10'center:parent x'#13#10']]'#13#10
        Caption = 'Change Alert'
        Anchors = [akLeft, akBottom]
        TabOrder = 4
        OnClick = btnChangeAlert1Click
      end
    end
    object rcBlock170: TUniContainerPanel
      Tag = 4
      Left = 27
      Top = 543
      Width = 729
      Height = 30
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 2
      object UniLabel14: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 717
        Height = 18
        Hint = '[[bsh5:|cls:left-center]]'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = 'Cards and Alerts'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock174: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 210
      Top = 596
      Width = 170
      Height = 280
      Hint = 
        '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 | round:no | cls:card-info-box' +
        '-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        170
        280)
      object UniContainerPanel12: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 170
        Height = 42
        Hint = '[[round:t | cls:card-red]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel15: TUniLabel
          Left = 6
          Top = 0
          Width = 108
          Height = 19
          Hint = '[['#13#10'bsh6:|'#13#10'center:parent y|'#13#10'pos-l:14'#13#10']][['
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'RadCORE DEMO'
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniLabel16: TUniLabel
        Left = 10
        Top = 59
        Width = 153
        Height = 79
        Hint = '[[ bsalert:danger ]]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 2
      end
      object UniLabel17: TUniLabel
        Left = 10
        Top = 153
        Width = 153
        Height = 79
        Hint = '[['#13#10'rcalert:danger title:Danger Sample'#13#10']]'#13#10
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 3
      end
    end
    object rcBlock178: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 583
      Top = 596
      Width = 170
      Height = 280
      Hint = 
        '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 | round:no | cls:card-info-box' +
        '-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        170
        280)
      object UniContainerPanel13: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 170
        Height = 42
        Hint = '[[round:t | cls:card-orange]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel18: TUniLabel
          Left = 6
          Top = 0
          Width = 108
          Height = 19
          Hint = '[['#13#10'bsh6:|'#13#10'center:parent y|'#13#10'pos-l:14'#13#10']][['
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'RadCORE DEMO'
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniLabel19: TUniLabel
        Left = 10
        Top = 59
        Width = 153
        Height = 79
        Hint = '[[ bsalert:warning ]]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 2
      end
      object UniLabel20: TUniLabel
        Left = 10
        Top = 155
        Width = 153
        Height = 79
        Hint = '[['#13#10'rcalert:warning title:Warning Sample'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 3
      end
    end
    object rcBlock176: TUniContainerPanel
      Tag = 1
      AlignWithMargins = True
      Left = 402
      Top = 596
      Width = 170
      Height = 280
      Hint = 
        '[[cols:xs-12 sm-12 md-6 lg-3 xl-3 | round:no | cls:card-info-box' +
        '-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        170
        280)
      object UniContainerPanel14: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 170
        Height = 42
        Hint = '[[round:t | cls:card-blue]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel21: TUniLabel
          Left = 6
          Top = 0
          Width = 108
          Height = 19
          Hint = '[['#13#10'bsh6:|'#13#10'center:parent y|'#13#10'pos-l:14'#13#10']][['
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'RadCORE DEMO'
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object UniLabel22: TUniLabel
        Left = 10
        Top = 59
        Width = 153
        Height = 79
        Hint = '[[ bsalert:info ]]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 2
      end
      object UniLabel23: TUniLabel
        Left = 10
        Top = 155
        Width = 153
        Height = 79
        Hint = '[['#13#10'rcalert:info title:Info Sample'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Exemplo Alerta'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 3
      end
    end
    object rcBlock180: TUniContainerPanel
      Tag = 4
      Left = 23
      Top = 883
      Width = 729
      Height = 30
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 6
      object UniLabel24: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 717
        Height = 18
        Hint = '[[bsh5:|cls:left-center]]'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = 'Features Tiles'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock182: TUniContainerPanel
      Tag = 1
      Left = 21
      Top = 937
      Width = 222
      Height = 110
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 lg-3 xl-3 |'#13#10'hr:110 mobile-v-92 mobile' +
        '-h-92'#13#10']]'
      ParentColor = False
      TabOrder = 7
      object UniLabel25: TUniLabel
        Left = 0
        Top = 0
        Width = 222
        Height = 110
        Cursor = crHandPoint
        Hint = '[['#13#10'rcfeature:fas-filter title:rcFeature Sample |'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'RC-Feature Tile can bu used to describe anything you want.'
        Align = alClient
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object rcBlock183: TUniContainerPanel
      Tag = 1
      Left = 270
      Top = 932
      Width = 220
      Height = 110
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 lg-3 xl-3 |'#13#10'hr:110 mobile-v-90 mobile' +
        '-h-90'#13#10']]'
      ParentColor = False
      TabOrder = 8
      object UniLabel26: TUniLabel
        Left = 0
        Top = 0
        Width = 220
        Height = 110
        Hint = '[['#13#10'rcfeature:fas-print title:rcFeature Sample'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'RC-Feature Tile can bu used to describe anything you want.'
        Align = alClient
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object rcBlock184: TUniContainerPanel
      Tag = 1
      Left = 503
      Top = 932
      Width = 220
      Height = 110
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 lg-3 xl-3 |'#13#10'hr:110 mobile-v-90 mobile' +
        '-h-90'#13#10']]'
      ParentColor = False
      TabOrder = 9
      object UniLabel27: TUniLabel
        Left = 0
        Top = 0
        Width = 220
        Height = 110
        Hint = '[['#13#10'rcfeature:fas-cogs title:rcFeature Sample'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'RC-Feature Tile can bu used to describe anything you want.'
        Align = alClient
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object rcBlock185: TUniContainerPanel
      Tag = 1
      Left = 731
      Top = 930
      Width = 220
      Height = 110
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 lg-3 xl-3 |'#13#10'hr:110 mobile-v-90 mobile' +
        '-h-90'#13#10' ]]'
      ParentColor = False
      TabOrder = 10
      object UniLabel28: TUniLabel
        Left = 0
        Top = 0
        Width = 220
        Height = 110
        Hint = '[['#13#10'rcfeature:fas-download title:rcFeature Sample'#13#10']]'
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'RC-Feature Tile can bu used to describe anything you want.'
        Align = alClient
        ParentFont = False
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
    object rcBlock40: TUniContainerPanel
      Tag = 4
      AlignWithMargins = True
      Left = 37
      Top = 293
      Width = 680
      Height = 210
      Hint = 
        '[['#13#10'cols:12 | '#13#10'round:no | '#13#10'cls:card-info-box-white '#13#10'/* rc-no-' +
        'scrollbar-maincontainer */'#13#10']]'#13#10
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 11
      object rcBlock50: TUniContainerPanel
        Left = 0
        Top = 2
        Width = 680
        Height = 42
        Hint = '[['#13#10'cols:12 |'#13#10'noborder-all|'#13#10'round:t | cls:card-light'#13#10']]'
        ParentColor = False
        Color = clSilver
        TabOrder = 1
        DesignSize = (
          680
          42)
        object btnGenerate: TUniButton
          Left = 647
          Top = 7
          Width = 30
          Height = 30
          Hint = '[['#13#10'ico:fas-plus | '#13#10'cls:ButtonOutline ButtonOutlineRed | '#13#10']]'#13#10
          Caption = '+'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = clBlack
          TabOrder = 1
          OnClick = btnGenerateClick
        end
        object UniLabel2: TUniLabel
          AlignWithMargins = True
          Left = 8
          Top = 5
          Width = 227
          Height = 23
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'Panels with scroll( RUNTIME )'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -19
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
    end
    object rcBlock2000: TUniContainerPanel
      Tag = 4
      Left = 73
      Top = 1840
      Width = 729
      Height = 47
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 12
    end
    object rcBlock200: TUniContainerPanel
      Tag = 1
      Left = 17
      Top = 1143
      Width = 150
      Height = 150
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      Color = clWhite
      TabOrder = 13
      object UniContainerPanel1Clone: TUniContainerPanel
        Left = 16
        Top = 38
        Width = 109
        Height = 80
        Hint = '[['#13#10'anchor:off-t-10'#13#10']]'
        ParentColor = False
        Color = clMoneyGreen
        TabOrder = 1
      end
    end
    object rcBlock210: TUniContainerPanel
      Tag = 1
      Left = 188
      Top = 1142
      Width = 150
      Height = 150
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      Color = clWhite
      TabOrder = 14
      object UniContainerPanel2Clone: TUniContainerPanel
        Left = 46
        Top = 40
        Width = 80
        Height = 80
        Hint = '[['#13#10'anchor:off-l-10'#13#10']]'
        ParentColor = False
        Color = clMoneyGreen
        TabOrder = 1
      end
    end
    object rcBlock220: TUniContainerPanel
      Tag = 1
      Left = 362
      Top = 1142
      Width = 150
      Height = 150
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      Color = clWhite
      TabOrder = 15
      object UniContainerPanel3Clone: TUniContainerPanel
        Left = 48
        Top = 42
        Width = 80
        Height = 80
        Hint = '[['#13#10'anchor:off-r-10'#13#10']]'
        ParentColor = False
        Color = clMoneyGreen
        TabOrder = 1
      end
    end
    object rcBlock230: TUniContainerPanel
      Tag = 1
      Left = 537
      Top = 1142
      Width = 150
      Height = 150
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      Color = clWhite
      TabOrder = 16
      object UniContainerPanel4Clone: TUniContainerPanel
        Left = 50
        Top = 44
        Width = 80
        Height = 80
        Hint = '[['#13#10'anchor:off-b-10'#13#10']]'
        ParentColor = False
        Color = clMoneyGreen
        TabOrder = 1
      end
    end
    object rcBlock190: TUniContainerPanel
      Tag = 4
      Left = 20
      Top = 1078
      Width = 729
      Height = 30
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 17
      object UniLabel29: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 717
        Height = 18
        Hint = '[[bsh5:|cls:left-center]]'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = '"anchor:"'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock250: TUniContainerPanel
      Left = 17
      Top = 1305
      Width = 321
      Height = 180
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 |'#13#10'round:no | '#13#10'cls:card-info-box-whit' +
        'e |'#13#10']]'
      ParentColor = False
      TabOrder = 18
      object Block260: TUniContainerPanel
        Left = 28
        Top = 33
        Width = 253
        Height = 110
        Hint = '[['#13#10#13#10'anchor:off-6'#13#10']]'
        ParentColor = False
        Color = clMoneyGreen
        TabOrder = 1
      end
    end
    object rcBlock310: TUniContainerPanel
      Left = 362
      Top = 1305
      Width = 321
      Height = 180
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-6 |'#13#10'round:no | '#13#10'cls:card-info-box-whit' +
        'e |'#13#10']]'
      ParentColor = False
      TabOrder = 19
      object Block320: TUniContainerPanel
        Left = 28
        Top = 33
        Width = 253
        Height = 110
        Hint = '[['#13#10#13#10'anchor:off-t-30 off-l-5 off-r-5 off-b-5|'#13#10']]'
        ParentColor = False
        Color = clMoneyGreen
        TabOrder = 1
      end
    end
    object rcBlock360: TUniContainerPanel
      Tag = 1
      Left = 25
      Top = 1536
      Width = 344
      Height = 80
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      Color = clInfoBk
      TabOrder = 20
      object Block350CloneClone: TUniContainerPanel
        Tag = 1
        Left = 0
        Top = 0
        Width = 50
        Height = 80
        Hint = '[['#13#10'scale:parent w:50% off:0 |'#13#10']]'
        ParentColor = False
        Color = clMoneyGreen
        Align = alLeft
        TabOrder = 1
      end
      object Block360CloneClone: TUniContainerPanel
        Tag = 1
        Left = 50
        Top = 0
        Width = 50
        Height = 80
        Hint = '[['#13#10'scale:parent w:50% off:0 |'#13#10']]'
        ParentColor = False
        Color = clSkyBlue
        Align = alLeft
        TabOrder = 2
      end
    end
    object rcBlock370: TUniContainerPanel
      Tag = 1
      Left = 396
      Top = 1536
      Width = 344
      Height = 80
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      Color = clInfoBk
      TabOrder = 21
      object Block350CloneCloneClone: TUniContainerPanel
        Tag = 1
        Left = 0
        Top = 0
        Width = 50
        Height = 80
        Hint = '[['#13#10'scale:parent w:33.33% off:0 |'#13#10']]'
        ParentColor = False
        Color = clMoneyGreen
        Align = alLeft
        TabOrder = 1
      end
      object UniContainerPanel1CloneCloneClone: TUniContainerPanel
        Tag = 1
        Left = 294
        Top = 0
        Width = 50
        Height = 80
        Hint = '[['#13#10'scale:parent w:33.33% off:0 |'#13#10']]'
        ParentColor = False
        Color = clInfoBk
        Align = alRight
        TabOrder = 2
      end
      object Block360CloneCloneClone: TUniContainerPanel
        Tag = 1
        Left = 50
        Top = 0
        Width = 50
        Height = 80
        Hint = '[['#13#10'scale:parent w:33.34% off:0 |'#13#10']]'
        ParentColor = False
        Color = clSkyBlue
        Align = alLeft
        TabOrder = 3
      end
    end
    object rcBlock350: TUniContainerPanel
      Tag = 4
      Left = 9
      Top = 1501
      Width = 729
      Height = 30
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 22
      object UniLabel30: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 717
        Height = 18
        Hint = '[[bsh5:|cls:left-center]]'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = 'PANELS inside a BLOCK ( same width )'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock390: TUniContainerPanel
      Tag = 4
      Left = 11
      Top = 1641
      Width = 729
      Height = 30
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 23
      object UniLabel31: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 717
        Height = 18
        Hint = '[[bsh5:|cls:left-center]]'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = 'BLOCKs with NOBORDER and "hr-childs:" "fit"'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock400: TUniContainerPanel
      Tag = 1
      Left = 17
      Top = 1673
      Width = 334
      Height = 143
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-2|'#13#10'hr-childs:xs-exp sm-exp md-exp fit |' +
        #13#10#13#10']]'
      ParentColor = False
      Color = clInfoBk
      TabOrder = 24
      object rcBlock410: TUniContainerPanel
        Left = 18
        Top = 18
        Width = 122
        Height = 25
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'noborder-all'#13#10']]'
        ParentColor = False
        Color = clTeal
        TabOrder = 1
      end
      object rcBlock420: TUniContainerPanel
        Tag = 1
        Left = 26
        Top = 48
        Width = 50
        Height = 40
        Hint = '[['#13#10'cols:6|'#13#10'noborder-all'#13#10']]'
        ParentColor = False
        Color = clSkyBlue
        TabOrder = 2
      end
      object rcBlock430: TUniContainerPanel
        Tag = 1
        Left = 88
        Top = 49
        Width = 50
        Height = 40
        Hint = '[['#13#10'cols:6|'#13#10'noborder-all'#13#10']]'
        ParentColor = False
        Color = clMoneyGreen
        TabOrder = 3
      end
      object rcBlock440: TUniContainerPanel
        Tag = 1
        Left = 92
        Top = 97
        Width = 50
        Height = 40
        Hint = '[['#13#10'cols:4|'#13#10'noborder-all'#13#10']]'
        ParentColor = False
        Color = 16711808
        TabOrder = 4
      end
      object rcBlock450: TUniContainerPanel
        Tag = 1
        Left = 160
        Top = 97
        Width = 50
        Height = 40
        Hint = '[['#13#10'cols:4|'#13#10'noborder-all'#13#10']]'
        ParentColor = False
        Color = 4194432
        TabOrder = 5
      end
      object rcBlock460: TUniContainerPanel
        Left = 26
        Top = 97
        Width = 50
        Height = 40
        Hint = '[['#13#10'cols:4|'#13#10'noborder-all'#13#10']]'
        ParentColor = False
        Color = clPurple
        TabOrder = 6
      end
    end
    object rcBlock20: TUniContainerPanel
      Tag = 4
      AlignWithMargins = True
      Left = 37
      Top = 78
      Width = 938
      Height = 190
      Hint = '[[cols:12 | round:no | cls:card-info-box-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 25
      DesignSize = (
        938
        190)
      object UniScrollBox1: TUniScrollBox
        Left = 2
        Top = 45
        Width = 934
        Height = 143
        Hint = '[['#13#10'scrollbar:show-h'#13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        ScrollHeight = 127
        ScrollWidth = 885
        object UniContainerPanel1: TUniContainerPanel
          Left = 14
          Top = 14
          Width = 163
          Height = 55
          Hint = '[[round:all]]'
          ParentColor = False
          Color = 13078040
          TabOrder = 0
          DesignSize = (
            163
            55)
          object UniLabel9: TUniLabel
            Left = 6
            Top = 22
            Width = 150
            Height = 15
            Hint = ''
            Alignment = taCenter
            AutoSize = False
            Caption = 'All Rounded'
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel4: TUniContainerPanel
          Left = 290
          Top = 14
          Width = 90
          Height = 55
          Hint = '[[ round:t l ]]'
          ParentColor = False
          Color = 8421440
          TabOrder = 1
          object UniLabel3: TUniLabel
            Left = 6
            Top = 5
            Width = 113
            Height = 38
            Hint = ''
            AutoSize = False
            Caption = 'top left'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel6: TUniContainerPanel
          Left = 290
          Top = 72
          Width = 90
          Height = 55
          Hint = '[[ round:b l ]]'
          ParentColor = False
          Color = 8421440
          TabOrder = 2
          object UniLabel4: TUniLabel
            Left = 6
            Top = 34
            Width = 113
            Height = 15
            Hint = ''
            AutoSize = False
            Caption = 'bottom left'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel2: TUniContainerPanel
          Left = 14
          Top = 72
          Width = 80
          Height = 55
          Hint = '[[round:l]]'
          ParentColor = False
          Color = 4539862
          TabOrder = 3
          object UniLabel8: TUniLabel
            Left = 3
            Top = 34
            Width = 71
            Height = 17
            Hint = ''
            AutoSize = False
            Caption = 'left '
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel3: TUniContainerPanel
          Left = 97
          Top = 72
          Width = 80
          Height = 55
          Hint = '[[round:r]]'
          ParentColor = False
          Color = 4539862
          TabOrder = 4
          object UniLabel7: TUniLabel
            Left = 4
            Top = 34
            Width = 68
            Height = 17
            Hint = ''
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'right'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel7: TUniContainerPanel
          Left = 384
          Top = 72
          Width = 90
          Height = 55
          Hint = '[[ round:b r ]]'
          ParentColor = False
          Color = 8421440
          TabOrder = 5
          object UniLabel5: TUniLabel
            Left = 2
            Top = 34
            Width = 80
            Height = 15
            Hint = ''
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'bottom right'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel5: TUniContainerPanel
          Left = 384
          Top = 14
          Width = 90
          Height = 55
          Hint = '[[ round:t r ]]'
          ParentColor = False
          Color = 8421440
          TabOrder = 6
          object UniLabel6: TUniLabel
            Left = 2
            Top = 5
            Width = 80
            Height = 38
            Hint = ''
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'top right'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel8: TUniContainerPanel
          Left = 188
          Top = 14
          Width = 90
          Height = 55
          Hint = '[[round:t]]'
          ParentColor = False
          Color = 6727914
          TabOrder = 7
          DesignSize = (
            90
            55)
          object UniLabel10: TUniLabel
            Left = 6
            Top = 5
            Width = 77
            Height = 15
            Hint = ''
            Alignment = taCenter
            AutoSize = False
            Caption = 'Top'
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel9: TUniContainerPanel
          Left = 188
          Top = 72
          Width = 90
          Height = 55
          Hint = '[[ round:b ]]'
          ParentColor = False
          Color = 6727914
          TabOrder = 8
          DesignSize = (
            90
            55)
          object UniLabel11: TUniLabel
            Left = 6
            Top = 34
            Width = 77
            Height = 15
            Hint = ''
            Alignment = taCenter
            AutoSize = False
            Caption = 'Bottom'
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel10: TUniContainerPanel
          Left = 499
          Top = 14
          Width = 90
          Height = 55
          Hint = '[[ rounder:t l ]]'
          ParentColor = False
          Color = clMaroon
          TabOrder = 9
          object UniLabel32: TUniLabel
            Left = 6
            Top = 5
            Width = 113
            Height = 38
            Hint = ''
            AutoSize = False
            Caption = 'top left'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel15: TUniContainerPanel
          Left = 499
          Top = 72
          Width = 90
          Height = 55
          Hint = '[[ rounder:b l ]]'
          ParentColor = False
          Color = clMaroon
          TabOrder = 10
          object UniLabel33: TUniLabel
            Left = 6
            Top = 34
            Width = 113
            Height = 15
            Hint = ''
            AutoSize = False
            Caption = 'bottom left'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel16: TUniContainerPanel
          Left = 593
          Top = 72
          Width = 90
          Height = 55
          Hint = '[[ rounder:b r ]]'
          ParentColor = False
          Color = clMaroon
          TabOrder = 11
          object UniLabel34: TUniLabel
            Left = 2
            Top = 34
            Width = 80
            Height = 15
            Hint = ''
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'bottom right'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel17: TUniContainerPanel
          Left = 593
          Top = 14
          Width = 90
          Height = 55
          Hint = '[[ rounder:t r ]]'
          ParentColor = False
          Color = clMaroon
          TabOrder = 12
          object UniLabel35: TUniLabel
            Left = 2
            Top = 5
            Width = 80
            Height = 38
            Hint = ''
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'top right'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel18: TUniContainerPanel
          Left = 701
          Top = 14
          Width = 90
          Height = 55
          Hint = '[[ roundest:t l ]]'
          ParentColor = False
          Color = 16512
          TabOrder = 13
          object UniLabel36: TUniLabel
            Left = 6
            Top = 5
            Width = 113
            Height = 38
            Hint = ''
            AutoSize = False
            Caption = 'top left'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel19: TUniContainerPanel
          Left = 701
          Top = 72
          Width = 90
          Height = 55
          Hint = '[[ roundest:b l ]]'
          ParentColor = False
          Color = 16512
          TabOrder = 14
          object UniLabel37: TUniLabel
            Left = 6
            Top = 34
            Width = 113
            Height = 15
            Hint = ''
            AutoSize = False
            Caption = 'bottom left'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel20: TUniContainerPanel
          Left = 795
          Top = 72
          Width = 90
          Height = 55
          Hint = '[[ roundest:b r ]]'
          ParentColor = False
          Color = 16512
          TabOrder = 15
          object UniLabel38: TUniLabel
            Left = 2
            Top = 34
            Width = 80
            Height = 15
            Hint = ''
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'bottom right'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
        object UniContainerPanel21: TUniContainerPanel
          Left = 795
          Top = 14
          Width = 90
          Height = 55
          Hint = '[[ roundest:t r ]]'
          ParentColor = False
          Color = 16512
          TabOrder = 16
          object UniLabel39: TUniLabel
            Left = 2
            Top = 5
            Width = 80
            Height = 38
            Hint = ''
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'top right'
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -12
            Font.Name = 'Calibri'
            Font.Style = [fsBold]
            TabOrder = 1
          end
        end
      end
      object rcBlock30: TUniContainerPanel
        Left = 0
        Top = 2
        Width = 680
        Height = 42
        Hint = '[['#13#10'cols:12 |'#13#10'noborder-all|'#13#10'round:t | cls:card-light'#13#10']]'
        ParentColor = False
        Color = clSilver
        TabOrder = 2
        object UniLabel13: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 3
          Width = 206
          Height = 23
          Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Caption = 'Rounded Panels with scroll'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -19
          Font.Name = 'Calibri'
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
