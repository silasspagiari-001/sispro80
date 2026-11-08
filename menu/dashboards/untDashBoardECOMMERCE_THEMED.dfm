object frmDashboardECOMMERCE_THEMED: TfrmDashboardECOMMERCE_THEMED
  Left = 0
  Top = 0
  Width = 854
  Height = 602
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  object sboxEcommerce: TUniScrollBox
    Left = 0
    Top = 0
    Width = 854
    Height = 602
    Hint = ''
    Align = alClient
    Color = 15395562
    TabOrder = 0
    ScrollHeight = 1460
    ScrollWidth = 823
    object rcBlock150: TUniContainerPanel
      Tag = 4
      Left = 8
      Top = 1445
      Width = 729
      Height = 15
      Hint = '[[cols:sm-8 md-8 lg-8 xl-8 | round:all]]'
      ParentColor = False
      TabOrder = 0
    end
    object rcBlock40: TUniContainerPanel
      Tag = 6
      Left = 469
      Top = 86
      Width = 354
      Height = 360
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12 lg-6 xl-6 4k-6 8k-6 | '#13#10'noborder-top|' +
        #13#10'/*noborder-left:desktop|*/'#13#10'noborder-bottom|'#13#10'/*noborder-all|*' +
        '/'#13#10']]'
      ParentColor = False
      TabOrder = 1
      object rcBlock50: TUniContainerPanel
        Left = 34
        Top = 42
        Width = 281
        Height = 277
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'noborder-left/*:desktop mobile-h*/|' +
          #13#10'noborder-right/*:desktop mobile-h*/|'#13#10'noborder-top:mobile-v|'#13#10 +
          'cls:card-info-box-white|'#13#10'round:no |'#13#10'scale:parent h:100%-top of' +
          'f:default-offset |'#13#10']]'
        ParentColor = False
        TabOrder = 1
        object htmlSales: TUniHTMLFrame
          Left = 34
          Top = 45
          Width = 195
          Height = 182
          Hint = '[['#13#10'anchor:off-8|'#13#10'html-reload:'#13#10']]'
        end
      end
    end
    object rcBlock10: TUniContainerPanel
      Tag = 2
      Left = 26
      Top = 86
      Width = 419
      Height = 360
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12 lg-6 xl-6 4k-6 8k-6 | '#13#10'round:all|'#13#10'n' +
        'oborder-all|'#13#10'hr-childs:xs-exp sm-exp md-exp |'#13#10'h-replicate:rcBl' +
        'ock40 mobile-v-off'#13#10']]'#13#10
      ParentColor = False
      TabOrder = 2
      object rcBlock20: TUniContainerPanel
        Tag = 2
        Left = 210
        Top = 9
        Width = 170
        Height = 170
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-6 lg-6 xl-6 4k-6 8k-6 |'#13#10'cls:card-info-b' +
          'ox-white rc-shadow-hover|'#13#10'round:no | '#13#10']]'#13#10#13#10
        CreateOrder = 1
        ParentColor = False
        Color = clWhite
        TabOrder = 1
        DesignSize = (
          170
          170)
        object labIcoNewCustomers: TUniLabel
          AlignWithMargins = True
          Left = 70
          Top = 8
          Width = 91
          Height = 75
          Hint = 
            '[['#13#10'ico:fas-user 2x | '#13#10'/*hide:mobile-v|*/'#13#10'cls:color-themecrud-' +
            'light trans-obj-3'#13#10']]'
          Alignment = taRightJustify
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'USer'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = 15258267
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 5
        end
        object labNewCustomersTotal: TUniLabel
          Left = 16
          Top = 74
          Width = 28
          Height = 33
          Hint = '[['#13#10'center:parent y'#13#10']]'
          Caption = '32'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Calibri'
          TabOrder = 3
        end
        object labDashCustomers: TUniLabel
          Left = 16
          Top = 28
          Width = 175
          Height = 19
          Hint = ''
          Caption = 'Clientes'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 2
        end
        object labDashNew: TUniLabel
          Left = 16
          Top = 7
          Width = 122
          Height = 19
          Hint = ''
          Caption = 'Novos'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 4
        end
        object paCustomerChart: TUniContainerPanel
          Left = 34
          Top = 71
          Width = 136
          Height = 85
          Hint = ''
          ParentColor = False
          Color = clWhite
          Anchors = [akTop, akRight]
          TabOrder = 1
          DesignSize = (
            136
            85)
          object htmlNewCustomers: TUniHTMLFrame
            Left = 2
            Top = 2
            Width = 119
            Height = 81
            Hint = ''
            Anchors = [akLeft, akTop, akRight, akBottom]
          end
        end
        object labCustomers: TUniLabel
          Left = 16
          Top = 140
          Width = 128
          Height = 15
          Hint = ''
          Caption = '+6.6% Since Last Month'
          ParentFont = False
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 6
        end
      end
      object rcBlock15: TUniContainerPanel
        Tag = 2
        Left = 26
        Top = 9
        Width = 170
        Height = 170
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-6 lg-6 xl-6 4k-6 8k-6 |'#13#10'cls:card-info-b' +
          'ox-white rc-shadow-hover|'#13#10'round:no | '#13#10']]'#13#10#13#10
        ParentColor = False
        Color = clWhite
        TabOrder = 2
        DesignSize = (
          170
          170)
        object labIcoSales: TUniLabel
          AlignWithMargins = True
          Left = 70
          Top = 8
          Width = 91
          Height = 75
          Hint = 
            '[['#13#10'ico:fas-shopping-cart 2x |'#13#10'/*hide:mobile-v|*/'#13#10'cls:color-th' +
            'emecrud-light trans-obj-3'#13#10']]'
          Alignment = taRightJustify
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Shop'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = 15258267
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 3
        end
        object labSalesTotal: TUniLabel
          Left = 16
          Top = 74
          Width = 118
          Height = 33
          Hint = '[['#13#10'center:parent y'#13#10']]'
          Caption = '$ 3.456,00'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object labDashSales: TUniLabel
          Left = 16
          Top = 10
          Width = 134
          Height = 19
          Hint = '[[translate:]]'
          Caption = 'Vendas'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 2
        end
        object labSales: TUniLabel
          Left = 16
          Top = 140
          Width = 133
          Height = 15
          Hint = ''
          TextConversion = txtHTML
          Caption = '-4.25% Since Last Month'
          ParentFont = False
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 4
        end
      end
      object rcBlock25: TUniContainerPanel
        Tag = 2
        Left = 21
        Top = 185
        Width = 170
        Height = 170
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-6 lg-6 xl-6 4k-6 8k-6 |'#13#10'cls:card-info-b' +
          'ox-white rc-shadow-hover|'#13#10'round:no | '#13#10']]'#13#10#13#10
        ParentColor = False
        Color = clWhite
        TabOrder = 3
        DesignSize = (
          170
          170)
        object labIcoInService: TUniLabel
          AlignWithMargins = True
          Left = 70
          Top = 8
          Width = 91
          Height = 75
          Hint = 
            '[['#13#10'ico:fas-wrench 2x | '#13#10'/*hide:mobile-v|*/'#13#10'cls:color-themecru' +
            'd-light trans-obj-3'#13#10']]'
          Alignment = taRightJustify
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Wrench'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = 15258267
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          ParentColor = False
          Color = 3640803
          TabOrder = 3
        end
        object labDashInService: TUniLabel
          Left = 16
          Top = 10
          Width = 185
          Height = 19
          Hint = ''
          Caption = 'Em Servi'#231'o'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object labInServiceTotal: TUniLabel
          Left = 16
          Top = 74
          Width = 28
          Height = 33
          Hint = '[['#13#10'center:parent y'#13#10']]'
          Caption = '18'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Calibri'
          TabOrder = 2
        end
        object labInService: TUniLabel
          Left = 16
          Top = 140
          Width = 244
          Height = 15
          Hint = ''
          Caption = '0.0% No '#218'ltimo M'#234's'
          ParentFont = False
          Font.Color = 33023
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 4
        end
      end
      object rcBlock30: TUniContainerPanel
        Tag = 2
        Left = 201
        Top = 185
        Width = 172
        Height = 170
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-6 lg-6 xl-6 4k-6 8k-6 |'#13#10'cls:card-info-b' +
          'ox-white rc-shadow-hover|'#13#10'round:no |]]'#13#10#13#10
        ParentColor = False
        Color = clWhite
        TabOrder = 4
        DesignSize = (
          172
          170)
        object labIcoGiveUp: TUniLabel
          AlignWithMargins = True
          Left = 70
          Top = 8
          Width = 91
          Height = 75
          Hint = 
            '[['#13#10'ico:fas-times 2x | '#13#10'/*hide:mobile-v|*/'#13#10'cls:color-themecrud' +
            '-light trans-obj-3'#13#10']]'
          Alignment = taRightJustify
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'Times'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Color = 15258267
          Font.Height = -19
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          TabOrder = 3
        end
        object labDashGiveUp: TUniLabel
          Left = 16
          Top = 10
          Width = 174
          Height = 19
          Hint = ''
          Caption = 'Desistiram'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -16
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object labGiveUpTotal: TUniLabel
          Left = 16
          Top = 74
          Width = 14
          Height = 33
          Hint = '[['#13#10'center:parent y'#13#10']]'
          Caption = '0'
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Calibri'
          TabOrder = 2
        end
        object labGiveUP: TUniLabel
          Left = 16
          Top = 140
          Width = 273
          Height = 15
          Hint = ''
          Caption = '0.0% 0.0% No '#218'ltimo M'#234's'
          ParentFont = False
          Font.Color = clGreen
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 4
        end
      end
    end
    object UniHiddenPanel1: TUniHiddenPanel
      Left = 8
      Top = 3
      Width = 101
      Height = 43
      Hint = ''
      Visible = True
      object btnClickOnRecall: TUniButton
        Left = 11
        Top = 2
        Width = 87
        Height = 38
        Hint = ''
        Caption = 'Click On ReCall'
        TabOrder = 1
        OnClick = btnClickOnRecallClick
      end
    end
    object rcBlock60: TUniContainerPanel
      Left = 27
      Top = 459
      Width = 472
      Height = 401
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'cls:card-info-box-white |'#13#10'round:no' +
        ' |'#13#10'noborder-top'#13#10']]'
      ParentColor = False
      Color = clWhite
      TabOrder = 4
      object rcBlock70: TUniContainerPanel
        Left = 5
        Top = 8
        Width = 335
        Height = 46
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'noborder-top|'#13#10'border:b color-silv' +
          'er-light'#13#10']]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          335
          46)
        object labGraphTitle: TUniLabel
          AlignWithMargins = True
          Left = 5
          Top = 8
          Width = 303
          Height = 27
          Hint = '[['#13#10'cls:rc-label-clear left-center'#13#10']]'#13#10#13#10#13#10
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'Vendas 1o. Semestre'
          ParentFont = False
          Font.Color = clGray
          Font.Height = -24
          Font.Name = 'Calibri'
          ParentColor = False
          Color = clBtnFace
          TabOrder = 1
        end
        object labRcCollapse60: TUniLabel
          Left = 318
          Top = 10
          Width = 15
          Height = 25
          Hint = 
            '[['#13#10'collapse:rcBlock60 off-parent icons:fas-plus fas-minus icons' +
            '-color:color-green |'#13#10']]'#13#10#13#10#13#10#13#10#13#10#13#10
          TextConversion = txtHTML
          Caption = '^'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Height = -21
          ParentColor = False
          Color = clBlack
          TabOrder = 2
        end
      end
      object rcBlock80: TUniContainerPanel
        Left = 26
        Top = 88
        Width = 312
        Height = 304
        Hint = '[[cols:xs-12 sm-12 md-12 ]]'
        ParentColor = False
        TabOrder = 2
        object htmlOthers: TUniHTMLFrame
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 306
          Height = 298
          Hint = ''
          Align = alClient
        end
      end
    end
  end
  object UniTimer1: TUniTimer
    Interval = 100
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = UniTimer1Timer
    Left = 760
    Top = 148
  end
end
