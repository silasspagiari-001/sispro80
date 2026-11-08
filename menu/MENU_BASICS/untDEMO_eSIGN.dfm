object frmDEMO_eSIGN: TfrmDEMO_eSIGN
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
    ScrollHeight = 469
    ScrollWidth = 547
    object rcBlock10: TUniContainerPanel
      Tag = 4
      Left = 14
      Top = 21
      Width = 533
      Height = 43
      Hint = '[[cols:12 | round:all]]'
      ParentColor = False
      TabOrder = 0
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
        Caption = 'E-Signature'
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
    end
    object rcBlock30: TUniContainerPanel
      Left = 24
      Top = 70
      Width = 387
      Height = 399
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'max-width:900|'#13#10'center:parent x |'#13#10 +
        ']]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        387
        399)
      object paSign: TUniContainerPanel
        Left = 9
        Top = 3
        Width = 300
        Height = 150
        Hint = 
          '[['#13#10'pos-l:4 |'#13#10'pos-t:4|'#13#10'center:parent x |'#13#10#13#10'cls:rc-dashed-bloc' +
          'k '#13#10']]'
        ParentColor = False
        TabOrder = 1
        object UniCanvas: TUniCanvas
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 294
          Height = 144
          Hint = ''
          Editable = True
          Align = alClient
          Color = clWhite
          AfterSubmit = UniCanvasAfterSubmit
        end
      end
      object btnClear: TUniButton
        Left = 110
        Top = 171
        Width = 94
        Height = 29
        Hint = '[['#13#10'align:paSign b:10 l:0|'#13#10'cls:ButtonCrud'#13#10']]'
        Margins.Bottom = 42
        Caption = 'Clear'
        Anchors = [akTop, akRight]
        TabOrder = 2
        OnClick = btnClearClick
      end
      object btnSave: TUniButton
        Left = 210
        Top = 171
        Width = 94
        Height = 29
        Hint = '[['#13#10'align:paSign b:10 r:-w|'#13#10'cls:ButtonCrud'#13#10']]'
        Caption = 'Save'
        Anchors = [akTop, akRight]
        TabOrder = 3
        OnClick = btnSaveClick
      end
      object paImg: TUniContainerPanel
        Left = 14
        Top = 214
        Width = 300
        Height = 150
        Hint = '[['#13#10'align:btnClear b:20 l:0|'#13#10'cls:rc-dashed-block '#13#10']]'
        ParentColor = False
        Anchors = [akTop, akRight]
        TabOrder = 4
        object uniImg: TUniImage
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 294
          Height = 144
          Hint = '[['#13#10'center:parent x |'#13#10']]'
          Align = alClient
        end
      end
    end
  end
  object cdsSign: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 500
    Top = 94
    object cdsSignimg_date: TDateTimeField
      FieldName = 'img_date'
    end
    object cdsSignimg: TBlobField
      FieldName = 'img'
    end
  end
  object dsSign: TDataSource
    DataSet = cdsSign
    Left = 500
    Top = 150
  end
end
