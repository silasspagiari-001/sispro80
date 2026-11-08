inherited frmMessage: TfrmMessage
  Hint = '[['#13#10'modal:|'#13#10']]'
  ClientHeight = 350
  Caption = 'frmMessage'
  ExplicitHeight = 350
  PixelsPerInch = 96
  TextHeight = 13
  inherited paBackground: TUniContainerPanel
    Top = 149
    Height = 156
    Color = clWhite
    ExplicitTop = 149
    ExplicitHeight = 156
    ScrollHeight = 156
    ScrollWidth = 356
    object memoMensagem: TUniHTMLFrame
      AlignWithMargins = True
      Left = 9
      Top = 5
      Width = 338
      Height = 440
      Hint = ''
      Margins.Left = 9
      Margins.Top = 5
      Margins.Right = 9
      Margins.Bottom = 10
      AutoScroll = True
      Align = alClient
      ScrollHeight = 440
      ScrollWidth = 338
    end
  end
  inherited paBaseTopTitle: TUniContainerPanel
    Top = 111
    Color = clWhite
    ExplicitTop = 111
    inherited labTitleForm: TUniLabel
      Width = 347
      Alignment = taCenter
      Align = alClient
      Font.Color = clGray
      ExplicitWidth = 347
    end
  end
  object paComandos: TUniContainerPanel [2]
    AlignWithMargins = True
    Left = 4
    Top = 305
    Width = 356
    Height = 40
    Hint = ''
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 5
    ParentColor = False
    Color = clWhite
    Align = alBottom
    TabOrder = 2
    object btnTicket: TUniBitBtn
      AlignWithMargins = True
      Left = 9
      Top = 5
      Width = 93
      Height = 30
      Hint = '[[cls:ButtonDark]]'
      Margins.Left = 9
      Margins.Top = 5
      Margins.Bottom = 5
      Caption = 'Suporte'
      Align = alLeft
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = btnEncerraClick
    end
    object btnNo: TUniBitBtn
      AlignWithMargins = True
      Left = 164
      Top = 5
      Width = 88
      Height = 30
      Hint = '[[cls:ButtonRed]]'
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Cancelar'
      Align = alRight
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 2
      OnClick = btnNoClick
    end
    object btnOk: TUniBitBtn
      AlignWithMargins = True
      Left = 260
      Top = 5
      Width = 87
      Height = 30
      Hint = '[[cls:ButtonGreen]]'
      Margins.Top = 5
      Margins.Right = 9
      Margins.Bottom = 5
      Caption = 'Ok'
      Align = alRight
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 3
      OnClick = btnOkClick
    end
  end
  object imgTipo: TUniImage [3]
    AlignWithMargins = True
    Left = 3
    Top = 10
    Width = 354
    Height = 92
    Hint = ''
    Margins.Top = 10
    Margins.Bottom = 5
    Center = True
    Align = alTop
  end
end
