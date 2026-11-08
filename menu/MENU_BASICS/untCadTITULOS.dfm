inherited frmBaseTITULOS: TfrmBaseTITULOS
  inherited paBaseBackGround: TUniContainerPanel
    ExplicitTop = -3
    inherited paBaseTop: TUniContainerPanel
      object UniLabelTOTALTITULOS: TUniLabel
        Left = 49
        Top = 8
        Width = 54
        Height = 26
        Hint = '[['#13#10'caption-dots:mobile-v-16 '#13#10']]'#13#10#13#10
        Margins.Left = 8
        Margins.Top = 8
        Margins.Right = 0
        Margins.Bottom = 4
        TextConversion = txtHTML
        Caption = 'SOMA'
        ParentFont = False
        Font.Color = clGray
        Font.Height = -21
        Font.Name = 'Calibri Light'
        ParentColor = False
        Color = clSkyBlue
        TabOrder = 2
      end
      object UniMemolog: TUniMemo
        Left = 882
        Top = 3
        Width = 29
        Height = 22
        Hint = ''
        Visible = False
        Lines.Strings = (
          'UniMemolog')
        TabOrder = 1
      end
    end
  end
  object UniScreenMask1: TUniScreenMask
    Enabled = True
    DisplayMessage = 'Aguarde ...'
    Left = 349
    Top = 12
  end
end
