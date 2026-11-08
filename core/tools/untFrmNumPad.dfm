inherited frmNumPad: TfrmNumPad
  Hint = '[['#13#10'height:385|'#13#10'width:fix|'#13#10'modal:]]'#13#10#13#10#13#10#13#10
  ClientHeight = 385
  ClientWidth = 320
  Caption = 'frmNumPad'
  OnKeyUp = UniFormKeyUp
  ExplicitWidth = 320
  ExplicitHeight = 385
  TextHeight = 15
  object paNumPad: TUniContainerPanel [0]
    Left = 5
    Top = 5
    Width = 309
    Height = 371
    Hint = ''
    ParentColor = False
    TabOrder = 0
    object btnPay7: TUniBitBtn
      Tag = 7
      AlignWithMargins = True
      Left = 12
      Top = 93
      Width = 60
      Height = 60
      Hint = 
        '[['#13#10'cls:ButtonOutline ButtonOutlineGray btn-font-gray ButtonRoun' +
        'd | '#13#10']]'
      Margins.Left = 6
      Margins.Top = 4
      Margins.Right = 6
      Margins.Bottom = 4
      Caption = '7'
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = btnPay7Click
    end
    object btnPay8: TUniBitBtn
      Tag = 8
      AlignWithMargins = True
      Left = 79
      Top = 93
      Width = 60
      Height = 60
      Hint = 
        '[['#13#10'cls:ButtonOutline ButtonOutlineGray btn-font-gray ButtonRoun' +
        'd | '#13#10']]'
      Margins.Left = 6
      Margins.Top = 4
      Margins.Right = 6
      Margins.Bottom = 4
      Caption = '8'
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Calibri'
      TabOrder = 2
      OnClick = btnPay7Click
    end
    object btnPay9: TUniBitBtn
      Tag = 9
      AlignWithMargins = True
      Left = 147
      Top = 93
      Width = 60
      Height = 60
      Hint = 
        '[['#13#10'cls:ButtonOutline ButtonOutlineGray btn-font-gray ButtonRoun' +
        'd | '#13#10']]'
      Margins.Left = 6
      Margins.Top = 4
      Margins.Right = 6
      Margins.Bottom = 4
      Caption = '9'
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Calibri'
      TabOrder = 3
      OnClick = btnPay7Click
    end
    object btnPay1: TUniBitBtn
      Tag = 1
      AlignWithMargins = True
      Left = 12
      Top = 229
      Width = 60
      Height = 60
      Hint = 
        '[['#13#10'cls:ButtonOutline ButtonOutlineGray btn-font-gray ButtonRoun' +
        'd | '#13#10']]'
      Margins.Left = 6
      Margins.Top = 4
      Margins.Right = 6
      Margins.Bottom = 4
      Caption = '1'
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Calibri'
      TabOrder = 4
      OnClick = btnPay7Click
    end
    object btnPay2: TUniBitBtn
      Tag = 2
      AlignWithMargins = True
      Left = 79
      Top = 229
      Width = 60
      Height = 60
      Hint = 
        '[['#13#10'cls:ButtonOutline ButtonOutlineGray btn-font-gray ButtonRoun' +
        'd | '#13#10']]'
      Margins.Left = 6
      Margins.Top = 4
      Margins.Right = 6
      Margins.Bottom = 4
      Caption = '2'
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Calibri'
      TabOrder = 5
      OnClick = btnPay7Click
    end
    object btnPay3: TUniBitBtn
      Tag = 3
      AlignWithMargins = True
      Left = 147
      Top = 229
      Width = 60
      Height = 60
      Hint = 
        '[['#13#10'cls:ButtonOutline ButtonOutlineGray btn-font-gray ButtonRoun' +
        'd | '#13#10#13#10']]'
      Margins.Left = 6
      Margins.Top = 4
      Margins.Right = 6
      Margins.Bottom = 4
      Caption = '3'
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Calibri'
      TabOrder = 6
      OnClick = btnPay7Click
    end
    object btnPay4: TUniBitBtn
      Tag = 4
      AlignWithMargins = True
      Left = 12
      Top = 161
      Width = 60
      Height = 60
      Hint = 
        '[['#13#10'cls:ButtonOutline ButtonOutlineGray btn-font-gray ButtonRoun' +
        'd | '#13#10']]'
      Margins.Left = 6
      Margins.Top = 4
      Margins.Right = 6
      Margins.Bottom = 4
      Caption = '4'
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Calibri'
      TabOrder = 7
      OnClick = btnPay7Click
    end
    object btnPay5: TUniBitBtn
      Tag = 5
      AlignWithMargins = True
      Left = 78
      Top = 161
      Width = 60
      Height = 60
      Hint = 
        '[['#13#10'cls:ButtonOutline ButtonOutlineGray btn-font-gray ButtonRoun' +
        'd | '#13#10']]'
      Margins.Left = 6
      Margins.Top = 4
      Margins.Right = 6
      Margins.Bottom = 4
      Caption = '5'
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Calibri'
      TabOrder = 8
      OnClick = btnPay7Click
    end
    object btnPay0: TUniBitBtn
      Tag = 1
      AlignWithMargins = True
      Left = 12
      Top = 297
      Width = 127
      Height = 60
      Hint = 
        '[['#13#10'cls:ButtonOutline ButtonOutlineGray btn-font-gray ButtonRoun' +
        'd | '#13#10']]'#13#10#13#10#13#10
      Margins.Left = 6
      Margins.Top = 4
      Margins.Right = 6
      Margins.Bottom = 4
      Caption = '0'
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Calibri'
      TabOrder = 9
      OnClick = btnPay7Click
    end
    object btnPay6: TUniBitBtn
      Tag = 6
      AlignWithMargins = True
      Left = 147
      Top = 161
      Width = 60
      Height = 60
      Hint = 
        '[['#13#10'cls:ButtonOutline ButtonOutlineGray btn-font-gray ButtonRoun' +
        'd | '#13#10']]'
      Margins.Left = 6
      Margins.Top = 4
      Margins.Right = 6
      Margins.Bottom = 4
      Caption = '6'
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Calibri'
      TabOrder = 10
      OnClick = btnPay7Click
    end
    object btnPayComma: TUniBitBtn
      Tag = 20
      AlignWithMargins = True
      Left = 147
      Top = 297
      Width = 60
      Height = 60
      Hint = 
        '[['#13#10'cls:ButtonOutline ButtonOutlineGray btn-font-gray ButtonRoun' +
        'd | '#13#10']]'
      Margins.Left = 6
      Margins.Top = 4
      Margins.Right = 6
      Margins.Bottom = 4
      Caption = ','
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Calibri'
      TabOrder = 11
      OnClick = btnPay7Click
    end
    object paDisplay: TUniContainerPanel
      Left = 12
      Top = 14
      Width = 283
      Height = 60
      Hint = ''
      ParentColor = False
      TabOrder = 12
      DesignSize = (
        283
        60)
      object labPayDisplay: TUniLabel
        AlignWithMargins = True
        Left = 0
        Top = 5
        Width = 283
        Height = 39
        Hint = 
          '[['#13#10'cls:rc-label-clear bg-gray clsRoundPanel rc-padding-lr-4 rc-' +
          'padding-tb-4'#13#10']]'
        Margins.Top = 1
        Margins.Bottom = 2
        Alignment = taRightJustify
        AutoSize = False
        Caption = ''
        Anchors = [akLeft, akTop, akRight, akBottom]
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -37
        Font.Name = 'DS-Digital'
        ParentColor = False
        Color = clGray
        TabOrder = 1
      end
      object edNumberTyped: TUniFormattedNumberEdit
        Left = 0
        Top = 0
        Width = 283
        Height = 60
        Hint = ''
        Alignment = taRightJustify
        ParentFont = False
        Font.Height = -32
        Font.Name = 'Calibri'
        Align = alClient
        TabOrder = 2
        ReadOnly = True
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
    end
    object btnPayClear: TUniBitBtn
      Tag = 50
      AlignWithMargins = True
      Left = 215
      Top = 93
      Width = 80
      Height = 60
      Hint = 
        '[['#13#10'ico:fas-backspace | '#13#10'append |'#13#10'caption-hide:mobile|'#13#10'cls:Bu' +
        'ttonOrange btn-font-white | '#13#10']]'
      Margins.Left = 6
      Margins.Top = 4
      Margins.Right = 6
      Margins.Bottom = 4
      Caption = 'Clear'
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 13
      OnClick = btnPay7Click
    end
    object btnPayCancel: TUniBitBtn
      Tag = 40
      AlignWithMargins = True
      Left = 215
      Top = 161
      Width = 80
      Height = 60
      Hint = 
        '[['#13#10'ico:fas-window-close | '#13#10'append |'#13#10'caption-hide:mobile|'#13#10'cls' +
        ':ButtonRed btn-font-white|'#13#10']]'
      Margins.Left = 6
      Margins.Top = 4
      Margins.Right = 6
      Margins.Bottom = 4
      Caption = 'Cancel'
      ModalResult = 2
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 14
      OnClick = btnPay7Click
    end
    object btnPayEnter: TUniBitBtn
      Tag = 30
      AlignWithMargins = True
      Left = 215
      Top = 229
      Width = 80
      Height = 128
      Hint = 
        '[['#13#10'ico:fas-check | '#13#10'append |'#13#10'caption-hide:mobile|'#13#10'cls:Button' +
        'Green btn-font-white| '#13#10']]'
      Margins.Left = 6
      Margins.Top = 4
      Margins.Right = 6
      Margins.Bottom = 4
      Caption = 'Enter'
      ModalResult = 1
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 15
      OnClick = btnPay7Click
    end
  end
end
