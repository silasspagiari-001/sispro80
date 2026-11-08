object frmDEMO_UPLOAD: TfrmDEMO_UPLOAD
  Left = 0
  Top = 0
  Width = 954
  Height = 653
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  object BlockTitle: TUniContainerPanel
    Left = 34
    Top = 16
    Width = 683
    Height = 46
    Hint = 
      '[['#13#10'scale:parent w:100%  |'#13#10'max-width:960|'#13#10'center:parent x |'#13#10'r' +
      'ound:t | '#13#10'cls:card-light |'#13#10']]'#13#10
    ParentColor = False
    TabOrder = 0
    object btSair: TUniLabel
      Left = 2
      Top = 1
      Width = 33
      Height = 28
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
      OnClick = btSairClick
    end
    object UniLabel1: TUniLabel
      AlignWithMargins = True
      Left = 41
      Top = 6
      Width = 120
      Height = 23
      Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'align:btSair r:6'#13#10']]'
      Margins.Left = 6
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Caption = 'UPLOAD DEMO'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -19
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object UniScrollBox1: TUniScrollBox
    Left = 34
    Top = 66
    Width = 843
    Height = 587
    Hint = 
      '[['#13#10'max-width:960|'#13#10'align:BlockTitle b:0 l:0|'#13#10'scale:parent w:10' +
      '0% h:100%-top |'#13#10']]'
    TabOrder = 1
    ScrollHeight = 574
    ScrollWidth = 731
    object rcBlock3: TUniContainerPanel
      Left = 34
      Top = 30
      Width = 697
      Height = 544
      Hint = 
        '[['#13#10'cols:12|'#13#10'noborder-all|'#13#10'cls:card-info-box-white|'#13#10'round:b|'#13 +
        #10'round:l|'#13#10'round:r|'#13#10'scale:parent h:100%-top off:0 |'#13#10#13#10']]'
      ParentColor = False
      TabOrder = 0
      object rcBlock10: TUniContainerPanel
        Left = 44
        Top = 28
        Width = 329
        Height = 60
        Hint = '[[cols:xs-12 sm-12 md-12 lg-12 xl-12 4k-12 8k-12 ]]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          329
          60)
        object UniLabel2: TUniLabel
          Left = 0
          Top = 0
          Width = 62
          Height = 15
          Hint = ''
          Caption = 'Select a file'
          Align = alTop
          ParentFont = False
          Font.Color = clGray
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edSearchFile: TUniEdit
          Left = 0
          Top = 22
          Width = 187
          Height = 38
          Hint = ''
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 72
          Margins.Bottom = 0
          CharCase = ecLowerCase
          Alignment = taCenter
          Text = ''
          ParentFont = False
          Font.Height = -15
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          EmptyText = 'search for...'
          FieldLabelWidth = 20
          FieldLabelSeparator = ' '
          FieldLabelFont.Name = 'Calibri'
        end
        object btnSearch60: TUniBitBtn
          AlignWithMargins = True
          Left = 260
          Top = 22
          Width = 68
          Height = 38
          Hint = ''
          Margins.Left = 8
          Margins.Top = 6
          Margins.Right = 6
          Margins.Bottom = 6
          Caption = 'Select'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 3
          OnClick = btnSearch60Click
        end
        object UniBitBtn1: TUniBitBtn
          AlignWithMargins = True
          Left = 193
          Top = 22
          Width = 66
          Height = 38
          Hint = ''
          Margins.Left = 8
          Margins.Top = 6
          Margins.Right = 6
          Margins.Bottom = 6
          Caption = 'Clear'
          Anchors = [akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 4
          OnClick = UniBitBtn1Click
        end
      end
      object rcBlock20: TUniContainerPanel
        Tag = 2
        AlignWithMargins = True
        Left = 39
        Top = 113
        Width = 593
        Height = 393
        Hint = 
          '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'round:no | '#13#10'cls:card-info-box-wh' +
          'ite|'#13#10'scale:parent h:100%-top off:default-offset |'#13#10#13#10']]'
        Margins.Left = 15
        Margins.Top = 15
        Margins.Right = 15
        Margins.Bottom = 10
        ParentColor = False
        TabOrder = 2
        object rcBlock30: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 593
          Height = 42
          Hint = 
            '[['#13#10'cols:12 |'#13#10'noborder-top | '#13#10'noborder-left | '#13#10'round:t | '#13#10'cl' +
            's:card-light'#13#10']]'
          ParentColor = False
          Color = clSilver
          Align = alTop
          TabOrder = 1
          object labFileUploaded: TUniLabel
            AlignWithMargins = True
            Left = 10
            Top = 7
            Width = 31
            Height = 23
            Hint = '[['#13#10'cls:rc-label-clear|'#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
            Margins.Left = 6
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Caption = 'File:'
            ParentFont = False
            Font.Color = clGray
            Font.Height = -19
            Font.Name = 'Calibri'
            TabOrder = 1
          end
        end
        object rcBlock40: TUniContainerPanel
          Left = 71
          Top = 60
          Width = 460
          Height = 305
          Hint = 
            '[['#13#10'cols:12 |'#13#10'scale:parent h:100%-top off:default-offset | '#13#10']]' +
            #13#10
          ParentColor = False
          TabOrder = 2
        end
      end
    end
  end
end
