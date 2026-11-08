object frmDEMO_HTMLEDITOR: TfrmDEMO_HTMLEDITOR
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
    ScrollHeight = 367
    ScrollWidth = 587
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
      DesignSize = (
        533
        43)
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 521
        Height = 31
        Hint = '[[bsh5:|cls:left-center]]'
        Margins.Left = 6
        Margins.Top = 6
        Margins.Right = 6
        Margins.Bottom = 6
        AutoSize = False
        Caption = 'HTML Editor'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniBitBtn1: TUniBitBtn
        Left = 490
        Top = 6
        Width = 37
        Height = 33
        Hint = '[['#13#10'ico:fas-print|'#13#10'cls:ButtonCrud|'#13#10'center:parent y'#13#10']]'
        Caption = 'UniBitBtn1'
        Anchors = [akTop, akRight]
        TabOrder = 2
        OnClick = UniBitBtn1Click
      end
    end
    object rcBlock30: TUniContainerPanel
      Left = 14
      Top = 91
      Width = 573
      Height = 276
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'max-width:900|'#13#10'center:parent x |'#13#10 +
        'scale:parent h:100%-top off:default-offset|'#13#10'cls:card-info-box-w' +
        'hite |'#13#10']]'#13#10
      ParentColor = False
      TabOrder = 1
      object htmlMemo: TUniHTMLMemo
        Left = 18
        Top = 44
        Width = 515
        Height = 157
        Hint = '[['#13#10'anchor:off-10'#13#10']]'
        ScrollBars = ssVertical
        Color = clWindow
        TabOrder = 1
      end
    end
  end
end
