object frmDEMO_TOUCH: TfrmDEMO_TOUCH
  Left = 0
  Top = 0
  Width = 954
  Height = 653
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  object UniScrollBox1: TUniScrollBox
    Left = 0
    Top = 0
    Width = 954
    Height = 653
    Hint = ''
    Align = alClient
    TabOrder = 0
    object rcBlock10: TUniContainerPanel
      Left = 82
      Top = 64
      Width = 647
      Height = 309
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'center:parent x|'#13#10'cls:rc-dashed-blo' +
        'ck |'#13#10'max-width:900'#13#10']]'
      ParentColor = False
      Color = clWhite
      TabOrder = 0
      object htmlSwipe: TUniHTMLFrame
        Left = 3
        Top = 0
        Width = 18
        Height = 17
        Hint = ''
        OnAjaxEvent = htmlSwipeAjaxEvent
      end
      object paSwipe: TUniContainerPanel
        Left = 238
        Top = 58
        Width = 187
        Height = 133
        Hint = '[['#13#10'center:parent xy |'#13#10'round:all'#13#10']]'
        ParentColor = False
        Color = clGray
        TabOrder = 2
      end
      object labLeft: TUniLabel
        AlignWithMargins = True
        Left = 141
        Top = 124
        Width = 10
        Height = 23
        Hint = 
          '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'align:paSwipe l:-w-12' +
          #13#10']]'
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Caption = '0'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 3
      end
      object labRight: TUniLabel
        AlignWithMargins = True
        Left = 465
        Top = 124
        Width = 10
        Height = 23
        Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'align:paSwipe r:12]]'
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Caption = '0'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 4
      end
      object labUp: TUniLabel
        AlignWithMargins = True
        Left = 333
        Top = 22
        Width = 10
        Height = 23
        Hint = 
          '[['#13#10'cls:rc-label-clear|'#13#10'center:parent x|'#13#10'align:paSwipe t:-h-8'#13 +
          #10']]'
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Caption = '0'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 5
      end
      object labDown: TUniLabel
        AlignWithMargins = True
        Left = 327
        Top = 204
        Width = 10
        Height = 23
        Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent x|'#13#10'align:paSwipe b:8]]'
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Caption = '0'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 6
      end
    end
    object rcBlock2: TUniContainerPanel
      Left = 3
      Top = 2
      Width = 674
      Height = 46
      Hint = 
        '[['#13#10'cols:12 |'#13#10'/* scale:parent w:100%| */'#13#10'/* noborder-all */ | ' +
        #13#10'round:t | '#13#10'cls:card-light |'#13#10']]'#13#10#13#10#13#10
      ParentColor = False
      TabOrder = 1
      object btSair: TUniLabel
        Left = 4
        Top = 1
        Width = 33
        Height = 26
        Cursor = crHandPoint
        Hint = '[['#13#10'center:parent y|'#13#10'ico:fas-sign-out-alt rc-mirror-h |'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = '<'
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSilver
        TabOrder = 1
      end
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 43
        Top = 4
        Width = 145
        Height = 23
        Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'align:btSair r:6'#13#10']]'
        Margins.Left = 6
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Caption = 'Touch Swipe Demo'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
  end
end
