object frmSEFAZNOTA: TfrmSEFAZNOTA
  Left = 0
  Top = 0
  ClientHeight = 420
  ClientWidth = 723
  Caption = 'Nota Fiscal Eletr'#244'nica'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  TextHeight = 15
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 723
    Height = 420
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    object UniScrollBox1: TUniScrollBox
      Left = 0
      Top = 0
      Width = 723
      Height = 420
      Hint = ''
      Align = alClient
      TabOrder = 1
      ScrollHeight = 412
      object rcBlock10: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 721
        Height = 41
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alTop
        TabOrder = 0
        object btnENVIA: TUniBitBtn
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 120
          Height = 37
          Hint = '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '<i class="fas fa-paper-plane"> Enviar</i>'
          Align = alLeft
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnENVIAClick
        end
        object btnSTATUS: TUniBitBtn
          AlignWithMargins = True
          Left = 126
          Top = 2
          Width = 120
          Height = 37
          Hint = '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '<i class="fas fa-globe"> Status</i>'
          Align = alLeft
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnSTATUSClick
        end
        object btnCONSULTA: TUniBitBtn
          AlignWithMargins = True
          Left = 250
          Top = 2
          Width = 120
          Height = 37
          Hint = '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '<i class="fas fa-search"> Consulta</i>'
          Align = alLeft
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 3
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnCONSULTAClick
        end
        object btnOPCOES: TUniBitBtn
          AlignWithMargins = True
          Left = 498
          Top = 2
          Width = 120
          Height = 37
          Hint = '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '<i class="fas fa-list"> Op'#231#245'es</i>'
          Align = alLeft
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 4
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = btnOPCOESClick
        end
        object UniBitBtnimpressao: TUniBitBtn
          AlignWithMargins = True
          Left = 374
          Top = 2
          Width = 120
          Height = 37
          Hint = 
            '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas fa-print | '#13#10'cls-ico:font-black'#13#10 +
            ']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '<i class="fas fa-print"> Impress'#227'o</i>'
          Align = alLeft
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 5
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = UniBitBtnimpressaoClick
        end
      end
      object rcBlock20: TUniContainerPanel
        Left = 0
        Top = 377
        Width = 721
        Height = 41
        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
        ParentColor = False
        Align = alBottom
        TabOrder = 1
        object UniBitBtn1: TUniBitBtn
          AlignWithMargins = True
          Left = 619
          Top = 2
          Width = 100
          Height = 37
          Hint = '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black'#13#10']]'
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = '<i class="fas fa-door-open"></i>'
          Align = alRight
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
          ScaleButton = False
          LayoutConfig.Padding = '0 2 0 0'
          OnClick = UniBitBtn1Click
        end
      end
      object UniPageControlprincipal: TUniPageControl
        Left = 0
        Top = 47
        Width = 721
        Height = 330
        Hint = ''
        ActivePage = UniTabSheetresposta
        Align = alBottom
        TabOrder = 2
        object UniTabSheetresposta: TUniTabSheet
          Hint = ''
          Caption = 'Resposta'
          object rcBlock30: TUniContainerPanel
            Left = 0
            Top = 0
            Width = 713
            Height = 164
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            Align = alTop
            TabOrder = 0
            object UniLabel20: TUniLabel
              Left = 4
              Top = 2
              Width = 72
              Height = 15
              Hint = ''
              Caption = 'Resposta TXT'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniMemorespostaTXT: TUniMemo
              Left = 4
              Top = 17
              Width = 707
              Height = 139
              Hint = ''
              ParentFont = False
              Font.Color = clRed
              Font.Height = -13
              Font.Style = [fsBold]
              ReadOnly = True
              Color = clInfoBk
              TabOrder = 2
            end
          end
          object rcBlock40: TUniContainerPanel
            Left = 0
            Top = 172
            Width = 713
            Height = 130
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            Align = alBottom
            TabOrder = 1
            object UniMemorespostaXML: TUniMemo
              Left = 3
              Top = 4
              Width = 707
              Height = 113
              Hint = ''
              ReadOnly = True
              Color = clSkyBlue
              TabOrder = 1
            end
          end
        end
        object UniTabSheetcartacorrecao: TUniTabSheet
          Hint = ''
          Caption = 'CCE-@'
          object UniContainerPanel2: TUniContainerPanel
            Left = 0
            Top = 0
            Width = 713
            Height = 302
            Hint = ''
            ParentColor = False
            Align = alClient
            TabOrder = 0
            object rcBlock50: TUniContainerPanel
              Left = 3
              Top = 3
              Width = 150
              Height = 41
              Hint = '[[cols:xs-12 sm-12 md-6]]'
              ParentColor = False
              TabOrder = 1
              object UniBitBtn2: TUniBitBtn
                AlignWithMargins = True
                Left = 2
                Top = 2
                Width = 120
                Height = 37
                Hint = '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black'#13#10']]'
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 2
                Margins.Bottom = 2
                Caption = '<i class="fas fa-list"> Corre'#231#227'o</i>'
                Align = alLeft
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
                ScaleButton = False
                LayoutConfig.Padding = '0 2 0 0'
                OnClick = UniBitBtn2Click
              end
            end
            object rcBlock70: TUniContainerPanel
              Left = 3
              Top = 50
              Width = 707
              Height = 120
              Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
              ParentColor = False
              TabOrder = 2
              object UniLabel1: TUniLabel
                Left = 4
                Top = 3
                Width = 125
                Height = 15
                Hint = ''
                Caption = 'Descri'#231#227'o da Corre'#231#227'o'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object UniMemocartacorrecao: TUniMemo
                Left = 3
                Top = 24
                Width = 703
                Height = 89
                Hint = ''
                ParentFont = False
                Font.Color = clBlack
                Font.Height = -13
                Font.Style = [fsBold]
                Color = clInfoBk
                TabOrder = 2
                ClearButton = True
              end
            end
            object rcBlock80: TUniContainerPanel
              Left = 3
              Top = 176
              Width = 707
              Height = 123
              Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
              ParentColor = False
              TabOrder = 3
              object UniMemorespostacartaXML: TUniMemo
                Left = 3
                Top = 3
                Width = 703
                Height = 117
                Hint = ''
                ReadOnly = True
                Color = clSkyBlue
                TabOrder = 1
              end
            end
          end
        end
      end
    end
  end
  object UniPopupMenudetalhessefaz: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 671
    Top = 6
    object danfeinpressao: TUniMenuItem
      Caption = 'Impress'#227'o DANFE'
      ImageIndex = 112
      OnClick = danfeinpressaoClick
    end
    object N1: TUniMenuItem
      Caption = '-'
    end
    object enviaremail: TUniMenuItem
      Caption = 'Enviar Email'
      ImageIndex = 61
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object cancelamentoeletronico: TUniMenuItem
      Caption = 'Cancelamento Eletr'#244'nico'
      ImageIndex = 29
      OnClick = cancelamentoeletronicoClick
    end
    object N3: TUniMenuItem
      Caption = '-'
    end
    object i2: TUniMenuItem
      Caption = 'Imprimir Cancelamento'
      ImageIndex = 36
      OnClick = i2Click
    end
    object N5: TUniMenuItem
      Caption = '-'
    end
    object n6: TUniMenuItem
      Caption = 'NSU'
      Visible = False
      OnClick = n6Click
    end
  end
  object UniPopupMenucartacorrecao: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 639
    Top = 6
    object E1: TUniMenuItem
      Caption = 'Envio da Corre'#231#227'o Corre'#231#227'o'
      ImageIndex = 61
      OnClick = E1Click
    end
    object N4: TUniMenuItem
      Caption = '-'
    end
    object I1: TUniMenuItem
      Caption = 'Impress'#227'o Carta Corre'#231#227'o'
      ImageIndex = 52
      OnClick = I1Click
    end
  end
  object UniPopupMenumodoimpressao: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 639
    Top = 38
    object I5: TUniMenuItem
      Caption = 'Impress'#227'o modo A4'
      ImageIndex = 36
      OnClick = I5Click
    end
    object N9: TUniMenuItem
      Caption = '-'
    end
    object i6: TUniMenuItem
      Caption = 'Impress'#227'o simplificada para entregas'
      ImageIndex = 52
      OnClick = i6Click
    end
  end
end
