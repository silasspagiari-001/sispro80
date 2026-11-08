object frmCARDASSINATURART: TfrmCARDASSINATURART
  Left = 0
  Top = 0
  Width = 315
  Height = 122
  TabOrder = 0
  object rcBlock10: TUniContainerPanel
    Tag = 4
    Left = 0
    Top = 0
    Width = 315
    Height = 122
    Hint = 
      '[['#13#10'cols:xs-12 sm-12 md-6 | '#13#10'round:no | '#13#10'cls:card-info-box-whi' +
      'te'#13#10']]'#13#10
    ParentColor = False
    Color = 5396975
    Align = alClient
    ParentAlignmentControl = False
    TabOrder = 0
    DesignSize = (
      315
      122)
    object labNUMEROSOLICITACAO: TUniLabel
      Left = 2
      Top = 3
      Width = 180
      Height = 21
      Hint = ''
      AutoSize = False
      Caption = '00001'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TabOrder = 1
    end
    object labSERVICO: TUniLabel
      Left = 2
      Top = 103
      Width = 188
      Height = 21
      Hint = ''
      AutoSize = False
      Caption = 'PU TZ DOSN VE PMS'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TabOrder = 2
    end
    object labSTATUS: TUniLabel
      Left = 287
      Top = 6
      Width = 73
      Height = 21
      Hint = ''
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'STATUS'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TabOrder = 3
    end
    object btnCalcReg: TUniBitBtn
      AlignWithMargins = True
      Left = 282
      Top = 2
      Width = 30
      Height = 30
      Hint = 
        '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-calculator | '#13#10'cls-ico:font-blac' +
        'k'#13#10']]'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '<i class="fas fa-cog style="color:blue"></i>'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri'
      TabOrder = 4
      ScaleButton = False
      LayoutConfig.Padding = '0 2 0 0'
      OnClick = btnCalcRegClick
    end
    object UniLabelcodigo: TUniLabel
      Left = 254
      Top = 3
      Width = 27
      Height = 14
      Hint = ''
      Visible = False
      AutoSize = False
      Caption = 'codigo'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Calibri'
      TabOrder = 5
    end
    object labIcoSales380: TUniLabel
      AlignWithMargins = True
      Left = 237
      Top = 71
      Width = 75
      Height = 48
      Hint = '[['#13#10'ico:fa-flask 2x |'#13#10'hide:mobile-v'#13#10']]'
      Alignment = taRightJustify
      TextConversion = txtHTML
      AutoSize = False
      Caption = '<i class="fas fa-signature"></i>'
      Anchors = [akTop, akRight]
      ParentFont = False
      Font.Color = 12573632
      Font.Height = -37
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TabOrder = 6
    end
    object UniLabelassinado: TUniLabel
      Left = 254
      Top = 23
      Width = 27
      Height = 14
      Hint = ''
      Visible = False
      AutoSize = False
      Caption = 'assinado'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Calibri'
      TabOrder = 7
    end
    object labDATAHORA: TUniLabel
      Left = 2
      Top = 27
      Width = 180
      Height = 21
      Hint = ''
      AutoSize = False
      Caption = '01/01/2099 - 13:40:41'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TabOrder = 8
    end
    object labLABORATORIO: TUniLabel
      Left = 2
      Top = 54
      Width = 310
      Height = 21
      Hint = ''
      AutoSize = False
      Caption = 'Laborat'#243'rio de Analises de Sementes'
      ParentFont = False
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      TabOrder = 9
    end
  end
  object UniPopupMenuopcoes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 248
    Top = 4
    object H1: TUniMenuItem
      Caption = 'Visualizar DOC.'
      ImageIndex = 52
      OnClick = H1Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object A1: TUniMenuItem
      Caption = 'Assinar B.A.S.'
      ImageIndex = 27
    end
  end
end
