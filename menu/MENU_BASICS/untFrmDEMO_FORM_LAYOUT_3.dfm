object frmDEMO_FORM_LAYOUT_3: TfrmDEMO_FORM_LAYOUT_3
  Left = 0
  Top = 0
  Width = 953
  Height = 715
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  object sboxSale: TUniScrollBox
    Left = 0
    Top = 0
    Width = 953
    Height = 715
    Hint = ''
    Align = alClient
    TabOrder = 0
    ScrollHeight = 694
    ScrollWidth = 920
    object rcBlock105: TUniContainerPanel
      Left = 9
      Top = 36
      Width = 909
      Height = 60
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'cls:card-padrao-grsoft |'#13#10'round:al' +
        'l'#13#10']]'
      ParentColor = False
      Color = clSilver
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      TabOrder = 0
      DesignSize = (
        909
        60)
      object labProduct: TUniLabel
        Left = 8
        Top = 13
        Width = 894
        Height = 34
        Hint = '[['#13#10'cls:rc-label-clear'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'NIKE AIR'
        Anchors = [akLeft, akRight]
        ParentFont = False
        Font.Color = 4276545
        Font.Height = -29
        Font.Name = 'Outfit'
        ParentColor = False
        Color = clBtnFace
        TabOrder = 1
      end
    end
    object rcBlock350: TUniContainerPanel
      Left = 533
      Top = 513
      Width = 158
      Height = 41
      Hint = '[['#13#10'cols:3 | '#13#10'round:all |'#13#10']]'
      Margins.Top = 0
      Margins.Bottom = 0
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        158
        41)
      object btnFinish: TUniBitBtn
        Left = 0
        Top = 1
        Width = 158
        Height = 38
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineGreen ButtonRound btn-font-gr' +
          'een|'#13#10'ico:fas-check |'#13#10'caption-hide:mobile |'#13#10'append |'#13#10'center:p' +
          'arent y'#13#10']]'#13#10
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Finish selling'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        TabOrder = 1
        ScreenMask.Enabled = True
        ScreenMask.WaitData = True
        OnClick = btnFinishClick
      end
    end
    object rcBlock410: TUniContainerPanel
      Left = 9
      Top = 627
      Width = 909
      Height = 67
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10'round:b|'#13#10'noborder-top |'#13#10']]'#13#10
      ParentColor = False
      Color = 4276545
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      TabOrder = 2
      object labOperator: TUniLabel
        Left = 11
        Top = 9
        Width = 80
        Height = 22
        Hint = '[['#13#10'cls:rc-label-clear'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Operator: '
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Calibri'
        ParentColor = False
        Color = clBtnFace
        TabOrder = 1
      end
      object labOperatorName: TUniLabel
        Left = 96
        Top = 8
        Width = 85
        Height = 22
        Hint = '[['#13#10'cls:rc-label-clear'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'GUSTAVO'
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Outfit'
        ParentColor = False
        Color = clBtnFace
        TabOrder = 2
      end
      object labTerminalDescription: TUniLabel
        Left = 96
        Top = 35
        Width = 85
        Height = 22
        Hint = '[['#13#10'cls:rc-label-clear'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        AutoSize = False
        Caption = '999'
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Outfit'
        ParentColor = False
        Color = clBtnFace
        TabOrder = 3
      end
      object labTerminal: TUniLabel
        Left = 11
        Top = 35
        Width = 80
        Height = 22
        Hint = '[['#13#10'cls:rc-label-clear'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Terminal:'
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Calibri'
        ParentColor = False
        Color = clBtnFace
        TabOrder = 4
      end
    end
    object rcBlock320: TUniContainerPanel
      Left = 13
      Top = 513
      Width = 158
      Height = 41
      Hint = '[['#13#10'cols:3 | '#13#10'round:all |'#13#10']]'
      Margins.Top = 0
      Margins.Bottom = 0
      ParentColor = False
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      TabOrder = 3
      DesignSize = (
        158
        41)
      object btnPreOrder: TUniBitBtn
        Left = 0
        Top = 1
        Width = 158
        Height = 38
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineOrange ButtonRound btn-font-o' +
          'range|'#13#10'ico:fas-file-import |'#13#10'caption-hide:mobile |'#13#10'append |'#13#10 +
          'center:parent y'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Import Pre-order'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        TabOrder = 1
        ScreenMask.Enabled = True
        ScreenMask.WaitData = True
      end
    end
    object rcBlock330: TUniContainerPanel
      Left = 183
      Top = 513
      Width = 158
      Height = 41
      Hint = '[['#13#10'cols:3 | '#13#10'round:all |'#13#10']]'
      Margins.Top = 0
      Margins.Bottom = 0
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        158
        41)
      object btnCancel: TUniBitBtn
        Left = 0
        Top = 1
        Width = 158
        Height = 38
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineRed ButtonRound btn-font-red|' +
          #13#10'ico:fas-times |'#13#10'caption-hide:mobile |'#13#10'append |'#13#10'center:paren' +
          't y'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Cancel Sale'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        TabOrder = 1
        ScreenMask.Enabled = True
        ScreenMask.WaitData = True
      end
    end
    object rcBlock340: TUniContainerPanel
      Left = 359
      Top = 513
      Width = 158
      Height = 41
      Hint = '[['#13#10'cols:3 | '#13#10'round:all |'#13#10']]'
      Margins.Top = 0
      Margins.Bottom = 0
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        158
        41)
      object btnSearch: TUniBitBtn
        Left = 0
        Top = 1
        Width = 158
        Height = 38
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineBlue ButtonRound btn-font-blu' +
          'e|'#13#10'ico:fas-search |'#13#10'caption-hide:mobile |'#13#10'append |'#13#10'center:pa' +
          'rent y'#13#10']]'
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Search for product'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Calibri'
        TabOrder = 1
        ScreenMask.Enabled = True
        ScreenMask.WaitData = True
      end
    end
    object rcBlock400: TUniContainerPanel
      Left = 13
      Top = 580
      Width = 907
      Height = 43
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'round:t |'#13#10'noborder-bottom'#13#10']]'
      Margins.Top = 0
      Margins.Bottom = 0
      ParentColor = False
      Color = clMoneyGreen
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      TabOrder = 6
      DesignSize = (
        907
        43)
      object labStatus: TUniLabel
        Left = 375
        Top = 7
        Width = 117
        Height = 29
        Hint = '[['#13#10'cls:rc-label-clear'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        Caption = 'Open Sale'
        Anchors = []
        ParentFont = False
        Font.Color = 16384
        Font.Height = -24
        Font.Name = 'Outfit'
        Font.Style = [fsBold]
        ParentColor = False
        Color = clBtnFace
        TabOrder = 1
      end
    end
    object rcBlock290: TUniContainerPanel
      Left = 562
      Top = 110
      Width = 337
      Height = 364
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-5 |'#13#10'round:no |'#13#10'cls:card-info-box-white' +
        ' |'#13#10'hr:parent-top off:200 mobile-off|'#13#10'min-height:mobile-220| '#13#10 +
        'max-height:mobile-220 |'#13#10']]'
      ParentColor = False
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      TabOrder = 7
      DesignSize = (
        337
        364)
      object gridItems: TUniDBGrid
        Left = 0
        Top = 0
        Width = 337
        Height = 363
        Hint = ''
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgAutoRefreshRow]
        WebOptions.Paged = False
        WebOptions.FetchAll = True
        LoadMask.Message = 'Loading data...'
        ForceFit = True
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 1
        Exporter.Enabled = True
      end
    end
    object rcBlock220: TUniContainerPanel
      Left = 9
      Top = 109
      Width = 356
      Height = 364
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-4 |'#13#10'round:no |'#13#10'hr:parent-top off:200 m' +
        'obile-off |'#13#10'min-height:mobile-505|'#13#10'max-height:mobile-505'#13#10']]'#13#10 +
        #13#10
      ParentColor = False
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      TabOrder = 8
      object rcBlock270: TUniContainerPanel
        Left = 187
        Top = 195
        Width = 160
        Height = 84
        Hint = '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'round:all |'#13#10']]'
        Margins.Top = 0
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          160
          84)
        object UniLabel1: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 35
          Height = 15
          Hint = ''
          Margins.Top = 1
          Margins.Bottom = 2
          Caption = 'To Pay'
          Anchors = [akLeft, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object labToPay: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 22
          Width = 151
          Height = 60
          Hint = 
            '[['#13#10'cls:rc-label-clear bg-gray clsRoundPanel rc-padding-lr-4 rc-' +
            'padding-tb-4'#13#10']]'
          Margins.Top = 1
          Margins.Bottom = 2
          Alignment = taRightJustify
          AutoSize = False
          Caption = '10,00'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -40
          Font.Name = 'Outfit'
          TabOrder = 2
        end
      end
      object rcBlock245: TUniContainerPanel
        Left = 14
        Top = 101
        Width = 160
        Height = 84
        Hint = '[['#13#10'cols:xs-12 sm-12 md-6 |'#13#10'round:all |'#13#10']]'
        Margins.Top = 0
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          160
          84)
        object UniLabel2: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 60
          Height = 15
          Hint = ''
          Margins.Top = 1
          Margins.Bottom = 2
          Caption = 'Unity Price'
          Anchors = [akLeft, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object labUnityPrice: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 22
          Width = 152
          Height = 60
          Hint = 
            '[['#13#10'cls:rc-label-clear bg-silver clsRoundPanel rc-padding-lr-4 r' +
            'c-padding-tb-4'#13#10']]'
          Margins.Top = 1
          Margins.Bottom = 2
          Alignment = taRightJustify
          AutoSize = False
          Caption = '0,00'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -40
          Font.Name = 'Outfit'
          TabOrder = 2
        end
      end
      object rcBlock250: TUniContainerPanel
        Left = 186
        Top = 101
        Width = 160
        Height = 84
        Hint = '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'round:all |'#13#10']]'
        Margins.Top = 0
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          160
          84)
        object UniLabel3: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 58
          Height = 15
          Hint = ''
          Margins.Top = 1
          Margins.Bottom = 2
          Caption = 'Total Price'
          Anchors = [akLeft, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object labTotalPrice: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 23
          Width = 150
          Height = 60
          Hint = 
            '[['#13#10'cls:rc-label-clear bg-silver clsRoundPanel rc-padding-lr-4 r' +
            'c-padding-tb-4'#13#10']]'
          Margins.Top = 1
          Margins.Bottom = 2
          Alignment = taRightJustify
          AutoSize = False
          Caption = '10,00'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -40
          Font.Name = 'Outfit'
          TabOrder = 2
        end
      end
      object rcBlock230: TUniContainerPanel
        Left = 14
        Top = 13
        Width = 160
        Height = 80
        Hint = '[['#13#10'cols:xs-6 sm-6 md-6 | '#13#10'round:all |'#13#10']]'
        Margins.Top = 0
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          160
          80)
        object UniLabel4: TUniLabel
          AlignWithMargins = True
          Left = 2
          Top = 0
          Width = 11
          Height = 15
          Hint = ''
          Margins.Top = 1
          Margins.Bottom = 2
          Caption = 'Id'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edId: TUniEdit
          Left = 0
          Top = 25
          Width = 159
          Height = 52
          Hint = ''
          Margins.Right = 5
          CharCase = ecUpperCase
          Alignment = taCenter
          Text = ''
          ParentFont = False
          Font.Height = -32
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          TabStop = False
          SelectOnFocus = True
        end
      end
      object rcBlock235: TUniContainerPanel
        Left = 186
        Top = 13
        Width = 160
        Height = 80
        Hint = '[['#13#10'cols:xs-6 sm-6 md-6 | '#13#10'round:all |'#13#10']]'
        Margins.Top = 0
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          160
          80)
        object UniLabel5: TUniLabel
          AlignWithMargins = True
          Left = 2
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
        object edQtd: TUniEdit
          Left = 0
          Top = 25
          Width = 159
          Height = 52
          Hint = #13#10
          Margins.Right = 5
          CharCase = ecUpperCase
          Alignment = taRightJustify
          Text = '1'
          ParentFont = False
          Font.Height = -32
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          TabStop = False
          SelectOnFocus = True
        end
      end
      object rcBlock260: TUniContainerPanel
        Left = 13
        Top = 195
        Width = 160
        Height = 84
        Hint = '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'round:all |'#13#10']]'
        Margins.Top = 0
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 6
        DesignSize = (
          160
          84)
        object UniLabel6: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 0
          Width = 30
          Height = 15
          Hint = ''
          Margins.Top = 1
          Margins.Bottom = 2
          Caption = 'Items'
          Anchors = [akLeft, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object labItems: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = 22
          Width = 151
          Height = 60
          Hint = 
            '[['#13#10'cls:rc-label-clear bg-silver clsRoundPanel rc-padding-lr-4 r' +
            'c-padding-tb-4'#13#10']]'
          Margins.Top = 1
          Margins.Bottom = 2
          Alignment = taRightJustify
          AutoSize = False
          Caption = '999'
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -40
          Font.Name = 'Outfit'
          TabOrder = 2
        end
      end
    end
    object rcBlock275: TUniContainerPanel
      Left = 377
      Top = 110
      Width = 179
      Height = 364
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-3|'#13#10'cls:rc-dashed-block|'#13#10'round:all|'#13#10'hr' +
        ':parent-top off:200 mobile-off|'#13#10'min-height:mobile-220 |'#13#10'max-he' +
        'ight:mobile-220 |'#13#10#13#10']]'#13#10#13#10
      ParentColor = False
      TabOrder = 9
      object rcBlock277: TUniContainerPanel
        Left = 3
        Top = 0
        Width = 173
        Height = 220
        Hint = 
          '[['#13#10'cols:12 |'#13#10'cls:clsRoundPanel |'#13#10'center:parent xy  | '#13#10'img:fi' +
          'les/images/sample-products/nikeair.png   |'#13#10'img-cls:rc-img-cente' +
          'r-zoom'#13#10']]'#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10
        ParentColor = False
        TabOrder = 1
      end
    end
  end
end
