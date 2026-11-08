object frmDEMO_FORM_LAYOUT_5: TfrmDEMO_FORM_LAYOUT_5
  Left = 0
  Top = 0
  Width = 930
  Height = 527
  OnCreate = UniFrameCreate
  OnReady = UniFrameReady
  ParentAlignmentControl = False
  AlignmentControl = uniAlignmentClient
  TabOrder = 0
  object sboxSale: TUniScrollBox
    Left = 0
    Top = 0
    Width = 930
    Height = 527
    Hint = ''
    Align = alClient
    TabOrder = 0
    ScrollHeight = 407
    ScrollWidth = 727
    object card: TUniContainerPanel
      Left = 3
      Top = 3
      Width = 724
      Height = 404
      Hint = '[['#13#10'cls:rc-bg-gradient-green |'#13#10'center:parent xy'#13#10']]'#13#10
      ParentColor = False
      AlignmentControl = uniAlignmentClient
      ParentAlignmentControl = False
      TabOrder = 0
      DesignSize = (
        724
        404)
      object memberPhoto: TUniContainerPanel
        Left = 508
        Top = 20
        Width = 196
        Height = 227
        Hint = '[['#13#10'round:all'#13#10']]'
        ParentColor = False
        Color = clMoneyGreen
        TabOrder = 1
        object rcBlock277: TUniContainerPanel
          Left = 3
          Top = 3
          Width = 190
          Height = 220
          Hint = 
            '[['#13#10'cols:12 |'#13#10'cls:clsRoundPanel |'#13#10'center:parent xy  | '#13#10'img:fi' +
            'les/images/avatar5.png width-170 height-150  |'#13#10'img-cls:img-resp' +
            'onsive-nocover'#13#10']]'#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10#13#10
          ParentColor = False
          TabOrder = 1
        end
      end
      object labStatus: TUniLabel
        Left = 61
        Top = 15
        Width = 272
        Height = 29
        Hint = '[['#13#10'cls:rc-label-clear'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        Caption = 'Federation Membership'
        Anchors = []
        ParentFont = False
        Font.Color = 16384
        Font.Height = -24
        Font.Name = 'Outfit'
        Font.Style = [fsBold]
        ParentColor = False
        Color = clBtnFace
        TabOrder = 2
      end
      object lbSairPDV: TUniLabel
        Left = 8
        Top = 8
        Width = 49
        Height = 42
        Cursor = crHandPoint
        Hint = '[['#13#10'ico:fas-yin-yang'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        Alignment = taCenter
        TextConversion = txtHTML
        AutoSize = False
        Caption = '<-'
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -29
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSilver
        TabOrder = 3
      end
      object labOperator: TUniLabel
        Left = 16
        Top = 91
        Width = 80
        Height = 22
        Hint = '[['#13#10'cls:rc-label-clear'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Operator: '
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Calibri'
        ParentColor = False
        Color = clBtnFace
        TabOrder = 4
      end
      object labOperatorName: TUniLabel
        Left = 101
        Top = 90
        Width = 85
        Height = 22
        Hint = '[['#13#10'cls:rc-label-clear'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'GUSTAVO'
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Outfit'
        ParentColor = False
        Color = clBtnFace
        TabOrder = 5
      end
      object labTerminal: TUniLabel
        Left = 16
        Top = 117
        Width = 80
        Height = 22
        Hint = '[['#13#10'cls:rc-label-clear'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        AutoSize = False
        Caption = 'Terminal:'
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Calibri'
        ParentColor = False
        Color = clBtnFace
        TabOrder = 6
      end
      object labTerminalDescription: TUniLabel
        Left = 101
        Top = 117
        Width = 85
        Height = 22
        Hint = '[['#13#10'cls:rc-label-clear'#13#10']]'
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        AutoSize = False
        Caption = '999'
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Outfit'
        ParentColor = False
        Color = clBtnFace
        TabOrder = 7
      end
    end
    object rcBlock105: TUniContainerPanel
      Tag = 4
      Left = 772
      Top = 339
      Width = 136
      Height = 149
      Hint = '[[cols:xs-12 sm-12 md-4 lg-4 xl-4 | round:all]]'
      Enabled = False
      Visible = False
      ParentColor = False
      TabOrder = 1
      object UniContainerPanel1: TUniContainerPanel
        Left = 1
        Top = 1
        Width = 134
        Height = 147
        Hint = '[[round:no | cls:card-info-box-white]]'
        ParentColor = False
        Color = clWhite
        TabOrder = 1
        object imgUser: TUniImage
          AlignWithMargins = True
          Left = 7
          Top = 7
          Width = 119
          Height = 132
          Hint = ''
          Center = True
        end
      end
    end
  end
end
