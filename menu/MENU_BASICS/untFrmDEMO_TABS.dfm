object frmDEMO_TABS: TfrmDEMO_TABS
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
    ScrollHeight = 997
    ScrollWidth = 924
    ScrollY = 322
    object rcBlock1000: TUniContainerPanel
      Tag = 4
      Left = 108
      Top = 632
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 0
    end
    object rcBlock250: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 512
      Top = -248
      Width = 412
      Height = 316
      Hint = '[[cols:xs-12 sm-12 md-6 | round:no | cls:card-info-box-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 1
      object UniContainerPanel2: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 412
        Height = 42
        Hint = '[['#13#10'round:t | '#13#10'cls:card-light'#13#10']]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel2: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 406
          Height = 42
          Hint = '[['#13#10'bsh5: | '#13#10'cls:left-center'#13#10']]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'bsPILLS'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object pgCardTab: TUniPageControl
        Left = 0
        Top = 96
        Width = 412
        Height = 220
        Hint = ''
        ActivePage = UniTabSheet1
        Align = alClient
        TabOrder = 2
        object UniTabSheet1: TUniTabSheet
          Hint = '[[closebtn:true]]'
          Caption = 'Ex. 1'
          object UniPanel1: TUniPanel
            Left = 0
            Top = 0
            Width = 404
            Height = 192
            Hint = ''
            Align = alClient
            TabOrder = 0
            Caption = ''
            ParentAlignmentControl = False
            object UniMemo4: TUniMemo
              AlignWithMargins = True
              Left = 4
              Top = 4
              Width = 396
              Height = 184
              Hint = ''
              BorderStyle = ubsNone
              Lines.Strings = (
                
                  'Lorem Ipsum is simply dummy text of the printing and typesetting' +
                  ' industry. Lorem Ipsum has been the industry'#39's standard dummy te' +
                  'xt ever since the 1500s, when an unknown printer took a galley o' +
                  'f type and scrambled it to make a type specimen book. ')
              Align = alClient
              TabOrder = 1
            end
          end
        end
        object UniTabSheet2: TUniTabSheet
          Hint = '[[closebtn:true]]'
          Caption = 'Ex. 2'
          object UniMemo5: TUniMemo
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 398
            Height = 186
            Hint = ''
            BorderStyle = ubsNone
            Lines.Strings = (
              
                'It is a long established fact that a reader will be distracted b' +
                'y the readable content of a page when looking at its layout.')
            Align = alClient
            TabOrder = 0
          end
        end
        object UniTabSheet3: TUniTabSheet
          Hint = '[[closebtn:true]]'
          Caption = 'Ex. 3'
          object UniMemo6: TUniMemo
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 398
            Height = 186
            Hint = ''
            BorderStyle = ubsNone
            Lines.Strings = (
              
                'There are many variations of passages of Lorem Ipsum available, ' +
                'but the majority have suffered alteration in some form, by injec' +
                'ted humour, or randomised words which don'#39't look even slightly b' +
                'elievable. ')
            Align = alClient
            TabOrder = 0
          end
        end
      end
      object paPillSample: TUniContainerPanel
        Left = 0
        Top = 42
        Width = 412
        Height = 54
        Hint = ''
        ParentColor = False
        Align = alTop
        TabOrder = 3
        object labPills: TUniLabel
          AlignWithMargins = True
          Left = 8
          Top = 10
          Width = 396
          Height = 34
          Hint = 
            '[['#13#10'bspills:light cls:btn-sm pgc:pgCardTab closeall:off cls-tab1' +
            '-active:ButtonTabPurple cls-tab2-active:ButtonTabGreen '#13#10']]'#13#10
          Margins.Left = 8
          Margins.Top = 10
          Margins.Right = 8
          Margins.Bottom = 10
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'bsPills'
          Align = alClient
          ParentFont = False
          Font.Height = -16
          ParentColor = False
          Color = clBtnFace
          TabOrder = 1
        end
      end
    end
    object rcBlock230: TUniContainerPanel
      Tag = 4
      Left = 25
      Top = -301
      Width = 729
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 2
      object UniLabel3: TUniLabel
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
        Caption = 'Tabs and Pills'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock240: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 25
      Top = -248
      Width = 412
      Height = 316
      Hint = '[[cols:xs-12 sm-12 md-6 | round:no | cls:card-info-box-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 3
      object UniContainerPanel1: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 412
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object UniLabel1: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 406
          Height = 42
          Hint = '[[bsh6:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'bsTABS'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object pgTabSample: TUniPageControl
        Left = 0
        Top = 103
        Width = 412
        Height = 213
        Hint = ''
        ActivePage = tabEx1
        Align = alClient
        TabOrder = 2
        object tabEx1: TUniTabSheet
          Hint = ''
          Caption = 'Exemplo 1'
          object pa1: TUniPanel
            Left = 0
            Top = 0
            Width = 404
            Height = 185
            Hint = ''
            Align = alClient
            TabOrder = 0
            Caption = ''
            ParentAlignmentControl = False
            object UniMemo1: TUniMemo
              AlignWithMargins = True
              Left = 4
              Top = 4
              Width = 396
              Height = 177
              Hint = ''
              BorderStyle = ubsNone
              Lines.Strings = (
                
                  'Lorem Ipsum is simply dummy text of the printing and typesetting' +
                  ' industry. Lorem Ipsum has been the industry'#39's standard dummy te' +
                  'xt ever since the 1500s, when an unknown printer took a galley o' +
                  'f type and scrambled it to make a type specimen book. ')
              Align = alClient
              TabOrder = 1
            end
          end
        end
        object tabEx2: TUniTabSheet
          Hint = ''
          Caption = 'Exemplo 2'
          object UniMemo2: TUniMemo
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 398
            Height = 179
            Hint = ''
            BorderStyle = ubsNone
            Lines.Strings = (
              
                'It is a long established fact that a reader will be distracted b' +
                'y the readable content of a page when looking at its layout.')
            Align = alClient
            TabOrder = 0
          end
        end
        object tabEx3: TUniTabSheet
          Hint = ''
          Caption = 'Exemplo 3'
          object UniMemo3: TUniMemo
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 398
            Height = 179
            Hint = ''
            BorderStyle = ubsNone
            Lines.Strings = (
              
                'There are many variations of passages of Lorem Ipsum available, ' +
                'but the majority have suffered alteration in some form, by injec' +
                'ted humour, or randomised words which don'#39't look even slightly b' +
                'elievable. ')
            Align = alClient
            TabOrder = 0
          end
        end
      end
      object paTabSample: TUniContainerPanel
        Left = 0
        Top = 42
        Width = 412
        Height = 61
        Hint = ''
        ParentColor = False
        Align = alTop
        TabOrder = 3
        object labTabs: TUniLabel
          AlignWithMargins = True
          Left = 8
          Top = 10
          Width = 396
          Height = 49
          Hint = 
            '[['#13#10'bstabs:light cls:btn-sm pgc:pgTabSample sbox:sboxGridBlock'#13#10 +
            ']]'
          Margins.Left = 8
          Margins.Top = 10
          Margins.Right = 8
          Margins.Bottom = 2
          Alignment = taCenter
          TextConversion = txtHTML
          AutoSize = False
          Caption = 'bsTabs'
          Align = alClient
          ParentFont = False
          Font.Height = -16
          ParentColor = False
          Color = clBtnFace
          TabOrder = 1
        end
      end
    end
    object rcBlock350: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 457
      Top = 79
      Width = 412
      Height = 260
      Hint = '[[cols:xs-12 sm-12 md-6 | round:no | cls:card-info-box-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 4
      object patitleTabClone: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 412
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object labTitleTabClone: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 406
          Height = 42
          Hint = '[[bsh6:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'rcTAB Slide'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object pgSampleSlide: TUniPageControl
        Left = 0
        Top = 92
        Width = 412
        Height = 168
        Hint = ''
        ActivePage = rctabSlideEx3
        Align = alClient
        TabOrder = 2
        object rctabSlideEx1: TUniTabSheet
          Hint = '[['#13#10'ico:far-heart|'#13#10'/*cls:align-btn-caption|*/'#13#10'append'#13#10']]'
          Caption = 'Vendas 1o. Semestre'
          object UniScrollBox1: TUniScrollBox
            Left = 0
            Top = 0
            Width = 404
            Height = 140
            Hint = ''
            Align = alClient
            TabOrder = 0
            ScrollHeight = 138
            ScrollWidth = 402
            object rcBlock355: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 402
              Height = 138
              Hint = '[['#13#10'anchor:off-5|'#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
              ParentColor = False
              Color = clMaroon
              TabOrder = 0
            end
          end
        end
        object rctabSlideEx2: TUniTabSheet
          Hint = '[[ico:far-bell]]'
          Caption = 'Curva ABC'
          object UniScrollBox2: TUniScrollBox
            Left = 0
            Top = 0
            Width = 404
            Height = 140
            Hint = ''
            Align = alClient
            TabOrder = 0
            ScrollHeight = 138
            ScrollWidth = 402
            object rcBlock356: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 402
              Height = 138
              Hint = '[['#13#10'anchor:off-5|'#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
              ParentColor = False
              Color = clMoneyGreen
              TabOrder = 0
            end
          end
        end
        object rctabSlideEx3: TUniTabSheet
          Hint = '[[ico:far-file]]'
          Caption = 'Produto mais Vendido'
          object UniScrollBox3: TUniScrollBox
            Left = 0
            Top = 0
            Width = 404
            Height = 140
            Hint = ''
            Align = alClient
            TabOrder = 0
            ScrollHeight = 138
            ScrollWidth = 402
            object rcBlock357: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 402
              Height = 138
              Hint = '[['#13#10'anchor:off-5|'#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
              ParentColor = False
              Color = clSkyBlue
              TabOrder = 0
            end
          end
        end
      end
      object paSampleCarousel: TUniContainerPanel
        AlignWithMargins = True
        Left = 2
        Top = 42
        Width = 408
        Height = 50
        Hint = '[['#13#10'rctabslide:pgSampleSlide transition:slide'#13#10']]'
        Margins.Left = 2
        Margins.Top = 0
        Margins.Right = 2
        Margins.Bottom = 0
        ParentColor = False
        Align = alTop
        TabOrder = 3
      end
    end
    object rcBlock360: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 18
      Top = 358
      Width = 412
      Height = 260
      Hint = '[[cols:xs-12 sm-12 md-6 | round:no | cls:card-info-box-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      TabOrder = 5
      object patitleTabDrop: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 412
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object labTitleTabCloneClone: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 406
          Height = 42
          Hint = '[[bsh6:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'rcTAB Slide'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object pgSampleSlideDrop: TUniPageControl
        Left = 0
        Top = 92
        Width = 412
        Height = 168
        Hint = ''
        ActivePage = rctabSlideDropEx1
        Align = alClient
        TabOrder = 2
        object rctabSlideDropEx1: TUniTabSheet
          Hint = '[['#13#10'ico:far-heart|'#13#10'/*cls:align-btn-caption|*/'#13#10'append'#13#10']]'
          Caption = 'Exemplo 1'
          object UniScrollBox1Clone: TUniScrollBox
            Left = 0
            Top = 0
            Width = 404
            Height = 140
            Hint = ''
            Align = alClient
            TabOrder = 0
            ScrollHeight = 138
            ScrollWidth = 402
            object rcBlock362: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 402
              Height = 138
              Hint = '[['#13#10'anchor:off-5|'#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
              ParentColor = False
              Color = clMaroon
              TabOrder = 0
            end
          end
        end
        object rctabSlideDropEx2: TUniTabSheet
          Hint = '[[ico:far-bell]]'
          Caption = 'Exemplo 2'
          object UniScrollBox2Clone: TUniScrollBox
            Left = 0
            Top = 0
            Width = 404
            Height = 140
            Hint = ''
            Align = alClient
            TabOrder = 0
            ScrollHeight = 138
            ScrollWidth = 402
            object rcBlock364: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 402
              Height = 138
              Hint = '[['#13#10'anchor:off-5|'#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
              ParentColor = False
              Color = clMoneyGreen
              TabOrder = 0
            end
          end
        end
        object rctabSlideDropEx3: TUniTabSheet
          Hint = '[[ico:far-file]]'
          Caption = 'Exemplo 3'
          object UniScrollBox3Clone: TUniScrollBox
            Left = 0
            Top = 0
            Width = 404
            Height = 140
            Hint = ''
            Align = alClient
            TabOrder = 0
            ScrollHeight = 138
            ScrollWidth = 402
            object rcBlock366: TUniContainerPanel
              Left = 0
              Top = 0
              Width = 402
              Height = 138
              Hint = '[['#13#10'anchor:off-5|'#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
              ParentColor = False
              Color = clSkyBlue
              TabOrder = 0
            end
          end
        end
      end
      object paSampleSlideDrop: TUniContainerPanel
        AlignWithMargins = True
        Left = 2
        Top = 42
        Width = 408
        Height = 50
        Hint = '[['#13#10'rctabslide:pgSampleSlideDrop transition:drop'#13#10']]'
        Margins.Left = 2
        Margins.Top = 0
        Margins.Right = 2
        Margins.Bottom = 0
        ParentColor = False
        Align = alTop
        TabOrder = 3
      end
    end
    object rcBlock300: TUniContainerPanel
      Tag = 2
      AlignWithMargins = True
      Left = 15
      Top = 77
      Width = 412
      Height = 260
      Hint = '[[cols:xs-12 sm-12 md-6 | round:no | cls:card-info-box-white]]'
      Margins.Left = 15
      Margins.Top = 15
      Margins.Right = 15
      Margins.Bottom = 10
      ParentColor = False
      Color = clMoneyGreen
      TabOrder = 6
      object patitleTab: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 412
        Height = 42
        Hint = '[[round:t | cls:card-light]]'
        ParentColor = False
        Color = clSilver
        Align = alTop
        TabOrder = 1
        object labTitleTab: TUniLabel
          AlignWithMargins = True
          Left = 6
          Top = 0
          Width = 406
          Height = 42
          Hint = '[[bsh6:|cls:left-center]]'
          Margins.Left = 6
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          AutoSize = False
          Caption = 'rcTABS'
          Align = alClient
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
      end
      object paRcTabSample: TUniContainerPanel
        Left = 0
        Top = 42
        Width = 412
        Height = 50
        Hint = '[['#13#10'rctabs:pgRcTabSample'#13#10']]'
        ParentColor = False
        Align = alTop
        TabOrder = 2
      end
      object pgRcTabSample: TUniPageControl
        Left = 0
        Top = 92
        Width = 412
        Height = 168
        Hint = ''
        ActivePage = rctabEx1
        Align = alClient
        TabOrder = 3
        object rctabEx1: TUniTabSheet
          Hint = '[['#13#10'ico:far-heart|'#13#10'/*cls:align-btn-caption|*/'#13#10'append'#13#10']]'
          Caption = 'Exemplo 1'
          object UniMemoTab1: TUniMemo
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 398
            Height = 134
            Hint = ''
            BorderStyle = ubsNone
            Lines.Strings = (
              
                'Lorem Ipsum is simply dummy text of the printing and typesetting' +
                ' industry. Lorem Ipsum has been the industry'#39's standard dummy te' +
                'xt ever since the 1500s, when an unknown printer took a galley o' +
                'f type and scrambled it to make a type specimen book. ')
            Align = alClient
            TabOrder = 0
          end
        end
        object rctabEx2: TUniTabSheet
          Hint = '[[ico:far-bell]]'
          Caption = 'Exemplo 2'
          object UniMemoTab2: TUniMemo
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 398
            Height = 134
            Hint = ''
            BorderStyle = ubsNone
            Lines.Strings = (
              
                'It is a long established fact that a reader will be distracted b' +
                'y the readable content of a page when looking at its layout.')
            Align = alClient
            TabOrder = 0
          end
        end
        object rctabEx3: TUniTabSheet
          Hint = '[[ico:far-file]]'
          Caption = 'Exemplo 3'
          object UniMemoTab3: TUniMemo
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 398
            Height = 134
            Hint = ''
            BorderStyle = ubsNone
            Lines.Strings = (
              
                'There are many variations of passages of Lorem Ipsum available, ' +
                'but the majority have suffered alteration in some form, by injec' +
                'ted humour, or randomised words which don'#39't look even slightly b' +
                'elievable. ')
            Align = alClient
            TabOrder = 0
          end
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
