object frmDEMO_PDV_MODAL: TfrmDEMO_PDV_MODAL
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal:|'#13#10'width:1024|'#13#10'height:768|'#13#10#13#10']]'
  HelpType = htKeyword
  ClientHeight = 680
  ClientWidth = 1116
  Caption = 'frmDEMO_PDV_MODAL'
  OnResize = UniFormResize
  BorderStyle = bsNone
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  NavigateKeys.Enabled = True
  NavigateKeys.Next.Key = 13
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  OnReady = UniFormReady
  OnBeforeShow = UniFormBeforeShow
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  TextHeight = 15
  object sboxSale: TUniScrollBox
    Left = 0
    Top = 0
    Width = 1116
    Height = 680
    Hint = ''
    Align = alClient
    TabOrder = 0
    ScrollHeight = 671
    ScrollWidth = 929
    object rcBlock105: TUniContainerPanel
      Left = 9
      Top = 12
      Width = 909
      Height = 54
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12 |'#13#10#13#10'round:all'#13#10']]'
      ParentColor = False
      Color = clSilver
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      TabOrder = 0
      DesignSize = (
        909
        54)
      object labProduct: TUniLabel
        Left = 8
        Top = 10
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
        Caption = '...'
        Anchors = [akLeft, akRight]
        ParentFont = False
        Font.Color = 4276545
        Font.Height = -29
        Font.Name = 'Outfit'
        Font.Style = [fsBold]
        ParentColor = False
        Color = clBtnFace
        TabOrder = 1
      end
      object lbSairPDV: TUniLabel
        Left = 2
        Top = 8
        Width = 49
        Height = 42
        Cursor = crHandPoint
        Hint = 
          '[['#13#10'ico:fa-arrow-left|'#13#10'guide-tour:Fechar o PDV<translate>|'#13#10'gui' +
          'de-tour-seq:0|'#13#10'guide-tour-theme:defined|'#13#10'guide-tour-offset-x:2' +
          '0|'#13#10'guide-tour-offset-y:05|'#13#10'guide-tour-text:Clique sair da tela' +
          ' do PDV<translate>|'#13#10'guide-tour-arrow:left'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = '<-'
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -29
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSilver
        TabOrder = 2
        OnClick = lbSairPDVClick
      end
    end
    object rcBlock1050: TUniContainerPanel
      Left = 368
      Top = 594
      Width = 550
      Height = 67
      Hint = '[['#13#10'cols:xs-12 sm-8 md-8 |'#13#10'round:all |'#13#10#13#10']]'#13#10
      ParentColor = False
      Color = 4276545
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      TabOrder = 1
      object labOperator: TUniLabel
        Left = 11
        Top = 9
        Width = 28
        Height = 22
        Hint = '[['#13#10'ico:far-id-badge|'#13#10'cls-ico:color-white|'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'S'
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Calibri'
        ParentColor = False
        Color = clBtnFace
        TabOrder = 1
      end
      object labTerminal: TUniLabel
        Left = 11
        Top = 35
        Width = 28
        Height = 22
        Hint = '[['#13#10'ico:fas-desktop|'#13#10'cls-ico:color-white|'#13#10#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'T'
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Calibri'
        ParentColor = False
        Color = clBtnFace
        TabOrder = 2
      end
      object UniLabel7: TUniLabel
        Left = 47
        Top = 35
        Width = 80
        Height = 22
        Hint = ''
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Terminal'
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Calibri'
        ParentColor = False
        Color = clBtnFace
        TabOrder = 3
      end
      object UniLabel8: TUniLabel
        Left = 47
        Top = 9
        Width = 80
        Height = 22
        Hint = ''
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Salesman'
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Calibri'
        ParentColor = False
        Color = clBtnFace
        TabOrder = 4
      end
    end
    object rcBlock1040: TUniContainerPanel
      Left = 13
      Top = 594
      Width = 346
      Height = 67
      Hint = '[['#13#10'cols:xs-12 sm-4 md-4 | '#13#10'round:all'#13#10']]'
      Margins.Top = 0
      Margins.Bottom = 0
      ParentColor = False
      Color = clMoneyGreen
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      TabOrder = 2
      object labStatus: TUniLabel
        Left = 0
        Top = 0
        Width = 346
        Height = 67
        Hint = 
          '[['#13#10'cls:rc-label-clear align-label-center-center rc-label-wrap |' +
          #13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Open Sale'
        Align = alClient
        ParentFont = False
        Font.Color = 16384
        Font.Height = -29
        Font.Name = 'Outfit'
        Font.Style = [fsBold]
        ParentColor = False
        Color = clBtnFace
        TabOrder = 1
      end
    end
    object rcBlock290: TUniContainerPanel
      Left = 426
      Top = 108
      Width = 503
      Height = 364
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-8 |'#13#10'hr:parent-top off:180 mobile-off|'#13#10 +
        'max-height:504 mobile-v-310 mobile-h-310|'#13#10'noborder-all|'#13#10']]'
      ParentColor = False
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      TabOrder = 3
      object rcBlock300: TUniContainerPanel
        Left = 42
        Top = 31
        Width = 229
        Height = 316
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-12 lg-12 xl-12 4k-12 8k-12|'#13#10'hr:parent-t' +
          'op off:1 |'#13#10'/*cls:card-info-box-white |*/'#13#10'round:all|'#13#10'border:al' +
          'l color-silver|'#13#10'noborder-left:desktop'#13#10']]'
        ParentColor = False
        TabOrder = 1
        object gridItems: TUniDBGrid
          Left = 14
          Top = 44
          Width = 199
          Height = 239
          Hint = '[[anchor:]]'
          Visible = False
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick, dgAutoRefreshRow]
          WebOptions.Paged = False
          WebOptions.FetchAll = True
          LoadMask.Message = 'Loading data...'
          ForceFit = True
          TabOrder = 1
          Exporter.Enabled = True
        end
      end
    end
    object rcBlock220: TUniContainerPanel
      Left = 9
      Top = 88
      Width = 356
      Height = 395
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-4 |'#13#10'round:no |'#13#10'hr-childs:xs-exp sm-exp' +
        ' md-exp |'#13#10'h-replicate:rcBlock290|'#13#10'noborder-top|'#13#10'noborder-left' +
        '|'#13#10'noborder-right|'#13#10'/*hr:parent-top off:200 mobile-off |*/'#13#10'/*mi' +
        'n-height:mobile-v-315 mobile-h-315|*/'#13#10'/*max-height:mobile-v-315' +
        ' mobile-v-315*/'#13#10']]'#13#10#13#10#13#10
      ParentColor = False
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      TabOrder = 4
      object rcBlock270: TUniContainerPanel
        Left = 187
        Top = 195
        Width = 159
        Height = 66
        Hint = '[['#13#10'cols:xs-12 sm-6 md-6 | '#13#10'round:all |'#13#10']]'
        Margins.Top = 0
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          159
          66)
        object UniLabel1: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = -2
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
        object paToPay: TUniContainerPanel
          Left = 0
          Top = 25
          Width = 159
          Height = 41
          Hint = '[['#13#10'cls:bg-silver clsRoundPanel '#13#10']]'
          ParentColor = False
          Align = alBottom
          TabOrder = 2
          object labToPay: TUniLabel
            AlignWithMargins = True
            Left = 6
            Top = 1
            Width = 147
            Height = 38
            Hint = '[['#13#10'cls:rc-label-clear '#13#10']]'
            Margins.Left = 6
            Margins.Top = 1
            Margins.Right = 6
            Margins.Bottom = 2
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0,00'
            Align = alClient
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -29
            Font.Name = 'Outfit'
            TabOrder = 1
          end
        end
      end
      object rcBlock245: TUniContainerPanel
        Left = 14
        Top = 101
        Width = 160
        Height = 66
        Hint = '[['#13#10'cols:xs-12 sm-6 md-6 | '#13#10'round:all |'#13#10']]'
        Margins.Top = 0
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          160
          66)
        object UniLabel2: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = -2
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
        object paUnityPrice: TUniContainerPanel
          Left = 0
          Top = 25
          Width = 160
          Height = 41
          Hint = '[['#13#10'cls:bg-silver clsRoundPanel '#13#10']]'
          ParentColor = False
          Align = alBottom
          TabOrder = 2
          object labUnityPrice: TUniLabel
            AlignWithMargins = True
            Left = 6
            Top = 1
            Width = 148
            Height = 38
            Hint = '[['#13#10'cls:rc-label-clear '#13#10']]'
            Margins.Left = 6
            Margins.Top = 1
            Margins.Right = 6
            Margins.Bottom = 2
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0,00'
            Align = alClient
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -29
            Font.Name = 'Outfit'
            TabOrder = 1
          end
        end
      end
      object rcBlock250: TUniContainerPanel
        Left = 186
        Top = 101
        Width = 160
        Height = 66
        Hint = '[['#13#10'cols:xs-12 sm-6 md-6 | '#13#10'round:all |'#13#10']]'
        Margins.Top = 0
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          160
          66)
        object UniLabel3: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = -2
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
        object paTotalPrice: TUniContainerPanel
          Left = 0
          Top = 25
          Width = 160
          Height = 41
          Hint = '[['#13#10'cls:bg-silver clsRoundPanel '#13#10']]'
          ParentColor = False
          Align = alBottom
          TabOrder = 2
          object labTotalPrice: TUniLabel
            AlignWithMargins = True
            Left = 6
            Top = 1
            Width = 148
            Height = 38
            Hint = '[['#13#10'cls:rc-label-clear '#13#10']]'
            Margins.Left = 6
            Margins.Top = 1
            Margins.Right = 6
            Margins.Bottom = 2
            Alignment = taRightJustify
            AutoSize = False
            Caption = '0,00'
            Align = alClient
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -29
            Font.Name = 'Outfit'
            TabOrder = 1
          end
        end
      end
      object rcBlock230: TUniContainerPanel
        Left = 14
        Top = 13
        Width = 160
        Height = 66
        Hint = 
          '[['#13#10'cols:xs-6 sm-6 md-6 | '#13#10'round:all |'#13#10'guide-tour:Quantidade<t' +
          'ranslate>|'#13#10'guide-tour-seq:0|'#13#10'guide-tour-theme:defined|'#13#10'guide-' +
          'tour-offset-x:20|'#13#10'guide-tour-offset-y:05|'#13#10'guide-tour-text:Quan' +
          'tidade de '#237'tens vendidos<translate>|'#13#10'guide-tour-arrow:left'#13#10']]'
        Margins.Top = 0
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 0
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
        object edQtd: TUniNumberEdit
          Left = 0
          Top = 25
          Width = 160
          Height = 41
          Hint = 
            #13#10'[['#13#10'input-addon:spin step:1 min:0 max:9999 cls-bg:color-silver' +
            ' bg-white cls-label:color-gray-light'#13#10']]'
          Alignment = taCenter
          ParentFont = False
          Font.Height = -29
          Font.Name = 'Calibri'
          Align = alBottom
          TabOrder = 2
          Value = 1.000000000000000000
          DecimalSeparator = ','
          OnExit = edProdIDExit
        end
      end
      object rcBlock235: TUniContainerPanel
        Left = 186
        Top = 13
        Width = 160
        Height = 66
        Hint = 
          '[['#13#10'cols:xs-6 sm-6 md-6 | '#13#10'round:all |'#13#10'guide-tour:Produto<tran' +
          'slate>|'#13#10'guide-tour-seq:0|'#13#10'guide-tour-theme:defined|'#13#10'guide-tou' +
          'r-offset-x:20|'#13#10'guide-tour-offset-y:05|'#13#10'guide-tour-text:Informe' +
          ' o c'#243'digo/c'#243'digo de barras do produto<translate>|'#13#10'guide-tour-ar' +
          'row:left'#13#10']]'
        Margins.Top = 0
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 1
        object UniLabel4: TUniLabel
          AlignWithMargins = True
          Left = 4
          Top = 2
          Width = 43
          Height = 15
          Hint = ''
          Margins.Top = 1
          Margins.Bottom = 2
          Caption = 'Product'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edProdID: TUniNumberEdit
          Left = 0
          Top = 25
          Width = 160
          Height = 41
          Hint = '[['#13#10'selectall:|'#13#10'cls:unselectable'#13#10']]'#13#10
          Alignment = taCenter
          ParentFont = False
          Font.Height = -29
          Font.Name = 'Calibri'
          Align = alBottom
          TabOrder = 2
          DecimalSeparator = ','
          OnExit = edProdIDExit
          ExplicitTop = 22
        end
      end
      object rcBlock260: TUniContainerPanel
        Left = 13
        Top = 195
        Width = 160
        Height = 66
        Hint = '[['#13#10'cols:xs-12 sm-6 md-6 | '#13#10'round:all |'#13#10']]'
        Margins.Top = 0
        Margins.Bottom = 0
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          160
          66)
        object UniLabel6: TUniLabel
          AlignWithMargins = True
          Left = 3
          Top = -2
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
        object paItems: TUniContainerPanel
          Left = 0
          Top = 25
          Width = 160
          Height = 41
          Hint = '[['#13#10'cls:bg-silver clsRoundPanel '#13#10']]'
          ParentColor = False
          Align = alBottom
          TabOrder = 2
          object labItems: TUniLabel
            AlignWithMargins = True
            Left = 6
            Top = 1
            Width = 148
            Height = 38
            Hint = '[['#13#10'cls:rc-label-clear '#13#10']]'
            Margins.Left = 6
            Margins.Top = 1
            Margins.Right = 6
            Margins.Bottom = 2
            Alignment = taRightJustify
            AutoSize = False
            Caption = '001'
            Align = alClient
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -29
            Font.Name = 'Outfit'
            TabOrder = 1
          end
        end
      end
      object rcBlock271: TUniContainerPanel
        Left = 25
        Top = 296
        Width = 315
        Height = 77
        Hint = 
          '[['#13#10'cols:12 |'#13#10'cls:clsRoundPanel rc-dashed-block|'#13#10'height:224 mo' +
          'bile-v-224 mobile-h-204|'#13#10'noborder-bottom|'#13#10'/*img:files/images/s' +
          'ample-products/nikeair.png   |*/'#13#10'img-cls:rc-img-center-zoom'#13#10']]' +
          #13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10
        ParentColor = False
        TabOrder = 7
      end
    end
    object rcBlock1030: TUniContainerPanel
      Left = 533
      Top = 529
      Width = 158
      Height = 47
      Hint = '[['#13#10'cols:3 | '#13#10'round:all |'#13#10']]'
      Margins.Top = 0
      Margins.Bottom = 0
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        158
        47)
      object btnFinish: TUniBitBtn
        Left = 0
        Top = 7
        Width = 158
        Height = 39
        Hint = 
          '[['#13#10'cls:ButtonOutline ButtonOutlineGreen ButtonRound btn-font-gr' +
          'een|'#13#10'ico:fas-money-check-dollar |'#13#10'caption-hide:mobile |'#13#10'appen' +
          'd |'#13#10'center:parent y'#13#10']]'#13#10
        Margins.Left = 6
        Margins.Top = 4
        Margins.Right = 6
        Margins.Bottom = 4
        Caption = 'Payment'
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
    object rcBlock1000: TUniContainerPanel
      Left = 11
      Top = 531
      Width = 158
      Height = 47
      Hint = '[['#13#10'cols:3 | '#13#10'round:all |'#13#10']]'
      Margins.Top = 0
      Margins.Bottom = 0
      ParentColor = False
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      TabOrder = 6
      DesignSize = (
        158
        47)
      object btnSearch: TUniBitBtn
        Left = 0
        Top = 7
        Width = 158
        Height = 39
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
    object rcBlock1010: TUniContainerPanel
      Left = 183
      Top = 529
      Width = 158
      Height = 47
      Hint = '[['#13#10'cols:3 | '#13#10'round:all |'#13#10']]'
      Margins.Top = 0
      Margins.Bottom = 0
      ParentColor = False
      TabOrder = 7
      DesignSize = (
        158
        47)
      object btnCancel: TUniBitBtn
        Left = 0
        Top = 7
        Width = 158
        Height = 39
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
    object rcBlock1020: TUniContainerPanel
      Left = 359
      Top = 529
      Width = 158
      Height = 47
      Hint = '[['#13#10'cols:3 | '#13#10'round:all |'#13#10']]'
      Margins.Top = 0
      Margins.Bottom = 0
      ParentColor = False
      TabOrder = 8
      DesignSize = (
        158
        47)
      object btnPreOrder: TUniBitBtn
        Left = 0
        Top = 4
        Width = 158
        Height = 39
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
    object rcBlock1100: TUniContainerPanel
      Left = 129
      Top = 668
      Width = 256
      Height = 3
      Hint = '[['#13#10'cols:xs-12 sm-12 md-0|'#13#10'hide:desktop'#13#10']]'
      ParentColor = False
      TabOrder = 9
    end
  end
  object memPRODS: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 964
    Top = 174
  end
  object dsPRODS: TDataSource
    AutoEdit = False
    DataSet = memPRODS
    Left = 964
    Top = 226
  end
  object memSALES: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 936
    Top = 34
  end
  object dsSALES: TDataSource
    AutoEdit = False
    DataSet = memSALES
    Left = 936
    Top = 86
  end
  object memITEMS: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 1008
    Top = 34
  end
  object dsITEMS: TDataSource
    AutoEdit = False
    DataSet = memITEMS
    Left = 1008
    Top = 86
  end
end
