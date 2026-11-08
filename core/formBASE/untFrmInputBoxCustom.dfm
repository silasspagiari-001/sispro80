inherited frmInputBoxCustom: TfrmInputBoxCustom
  Caption = 'frmInputBoxCustom'
  TextHeight = 15
  object UniScrollBox1: TUniScrollBox [0]
    Left = 0
    Top = 0
    Width = 360
    Height = 360
    Hint = ''
    Align = alClient
    TabOrder = 0
    DesignSize = (
      358
      358)
    ScrollHeight = 306
    ScrollWidth = 336
    object rcBlock4: TUniContainerPanel
      Tag = 1
      Left = 16
      Top = 109
      Width = 294
      Height = 30
      Hint = '[[cols:xs-12 sm-12 md-12|noborder-top]]'
      ParentColor = False
      TabOrder = 0
      DesignSize = (
        294
        30)
      object labTitleForm: TUniLabel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 294
        Height = 48
        Hint = '[['#13#10'cls:rc-label-wrap'#13#10']]'
        Margins.Left = 6
        Margins.Bottom = 8
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Title'
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = 4210752
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSilver
        TabOrder = 1
      end
    end
    object rcBlock6: TUniContainerPanel
      Tag = 1
      Left = 16
      Top = 140
      Width = 320
      Height = 166
      Hint = 
        '[['#13#10'cols:xs-12 sm-12 md-12|'#13#10'noborder-top|'#13#10'scale:parent h:100%-' +
        'top off:60 |'#13#10']]'
      ParentColor = False
      AutoScroll = True
      TabOrder = 1
      ScrollHeight = 166
      ScrollWidth = 320
      object sboxForm: TUniScrollBox
        Left = 14
        Top = 28
        Width = 256
        Height = 100
        Hint = '[['#13#10'anchor:'#13#10']]'
        TabOrder = 1
      end
    end
    object btnNo: TUniBitBtn
      AlignWithMargins = True
      Left = 163
      Top = 314
      Width = 88
      Height = 34
      Hint = '[[cls:ButtonRed]]'
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Visible = False
      Caption = 'Cancelar'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 2
      OnClick = btnNoClick
    end
    object btnOk: TUniBitBtn
      AlignWithMargins = True
      Left = 262
      Top = 314
      Width = 87
      Height = 34
      Hint = '[[cls:ButtonGreen]]'
      Margins.Top = 5
      Margins.Right = 9
      Margins.Bottom = 5
      Caption = 'Ok'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 3
      OnClick = btnOkClick
    end
    object rcBlock2: TUniContainerPanel
      Tag = 1
      Left = 16
      Top = 2
      Width = 294
      Height = 107
      Hint = '[[cols:xs-12 sm-12 md-12|noborder-all]]'
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        294
        107)
      object imgTipo: TUniImage
        Left = 2
        Top = 12
        Width = 289
        Height = 92
        Hint = ''
        Margins.Top = 6
        Margins.Bottom = 0
        Center = True
        Anchors = [akLeft, akTop, akRight, akBottom]
      end
    end
  end
end
