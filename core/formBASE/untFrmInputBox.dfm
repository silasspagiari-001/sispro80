inherited frmInputBox: TfrmInputBox
  Caption = 'frmInputBox'
  PixelsPerInch = 96
  TextHeight = 13
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
    ScrollWidth = 334
    object rcBlock6: TUniContainerPanel
      Tag = 1
      Left = 14
      Top = 160
      Width = 320
      Height = 146
      Hint = '[[cols:xs-12 sm-12 md-12|noborder-top]]'
      ParentColor = False
      TabOrder = 0
      DesignSize = (
        320
        146)
      object lab1: TUniLabel
        AlignWithMargins = True
        Left = 10
        Top = 19
        Width = 297
        Height = 17
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        AutoSize = False
        Caption = 'Label 1'
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object ed2: TUniEdit
        Left = 10
        Top = 105
        Width = 297
        Height = 34
        Hint = ''
        Margins.Left = 10
        Visible = False
        PasswordChar = '*'
        Text = ''
        ParentFont = False
        Font.Height = -13
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        EmptyText = 'senha'
        ClearButton = True
      end
      object ed1: TUniEdit
        Left = 10
        Top = 40
        Width = 297
        Height = 34
        Hint = ''
        Margins.Left = 10
        Text = ''
        ParentFont = False
        Font.Height = -13
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        EmptyText = 'usu'#225'rio'
        ClearButton = True
      end
      object lab2: TUniLabel
        AlignWithMargins = True
        Left = 10
        Top = 84
        Width = 297
        Height = 17
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        AutoSize = False
        Caption = 'Label 2'
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        TabOrder = 4
      end
      object ed1_dt: TUniDateTimePicker
        Left = 78
        Top = 40
        Width = 297
        Height = 34
        Hint = ''
        DateTime = 44869.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 5
        ParentFont = False
        Font.Height = -13
      end
      object ed2_dt: TUniDateTimePicker
        Left = 78
        Top = 105
        Width = 297
        Height = 34
        Hint = ''
        DateTime = 44869.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 6
        ParentFont = False
        Font.Height = -13
      end
    end
    object btnNo: TUniBitBtn
      AlignWithMargins = True
      Left = 163
      Top = 315
      Width = 88
      Height = 34
      Hint = '[[cls:ButtonRed]]'
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Cancelar'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.Height = -16
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = btnNoClick
    end
    object btnOk: TUniBitBtn
      AlignWithMargins = True
      Left = 262
      Top = 315
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
      TabOrder = 2
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
      TabOrder = 3
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
    object rcBlock4: TUniContainerPanel
      Tag = 1
      Left = 16
      Top = 109
      Width = 294
      Height = 51
      Hint = '[[cols:xs-12 sm-12 md-12|noborder-top]]'
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        294
        51)
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
  end
end
