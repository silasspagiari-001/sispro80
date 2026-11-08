inherited frmPEDIDOS: TfrmPEDIDOS
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 610
      ScrollWidth = 37
      inherited paOF: TUniContainerPanel
        Top = 357
        ExplicitTop = 357
      end
      inherited paGC: TUniContainerPanel
        Height = 148
        ExplicitHeight = 148
      end
    end
    inherited pgBaseCadControl: TUniPageControl
      inherited tabSearch: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 975
        ExplicitHeight = 582
        inherited paBaseRegSearch: TUniContainerPanel
          ExplicitHeight = 582
          inherited paSearchFilters: TUniPanel
            ExplicitHeight = 582
            inherited UniScrollBox1: TUniScrollBox
              ExplicitHeight = 582
              ScrollHeight = 389
              ScrollWidth = 254
            end
          end
        end
      end
      inherited paBaseRegData1: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 975
        ExplicitHeight = 582
        inherited UniScrollBox2: TUniScrollBox
          ExplicitHeight = 576
          ScrollHeight = 830
          ScrollWidth = 946
          inherited rcBlock500: TUniContainerPanel
            Top = 207
            ExplicitTop = 207
          end
          inherited rcBlock490: TUniContainerPanel
            Top = 207
            ExplicitTop = 207
          end
          inherited rcBlock480: TUniContainerPanel
            Top = 207
            ExplicitTop = 207
          end
          inherited rcBlock470: TUniContainerPanel
            Top = 207
            ExplicitTop = 207
          end
          inherited rcBlock510: TUniContainerPanel
            Top = 261
            ExplicitTop = 261
          end
          inherited rcBlock520: TUniContainerPanel
            Top = 261
            ExplicitTop = 261
          end
          inherited rcBlock530: TUniContainerPanel
            Top = 261
            ExplicitTop = 261
          end
          inherited rcBlock540: TUniContainerPanel
            Top = 260
            ExplicitTop = 260
          end
          inherited rcBlock590: TUniContainerPanel
            Top = 619
            ExplicitTop = 619
          end
          inherited rcBlock580: TUniContainerPanel
            Top = 453
            ExplicitTop = 453
          end
          inherited rcBlock550: TUniContainerPanel
            Top = 327
            ExplicitTop = 327
          end
          inherited rcBlock560: TUniContainerPanel
            Top = 327
            ExplicitTop = 327
          end
          inherited rcBlock570: TUniContainerPanel
            Top = 327
            ExplicitTop = 327
          end
          inherited rcBlock630: TUniContainerPanel
            Top = 677
            ExplicitTop = 677
          end
          inherited rcBlock640: TUniContainerPanel
            Top = 677
            ExplicitTop = 677
          end
          inherited rcBlock650: TUniContainerPanel
            Top = 677
            ExplicitTop = 677
          end
          inherited rcBlock660: TUniContainerPanel
            Top = 676
            ExplicitTop = 676
          end
        end
      end
    end
  end
  inherited UniPopupMenudetalhes: TUniPopupMenu
    Images = dm_rc.imgl20
    object D1: TUniMenuItem
      Caption = 'Documentos Opcionais'
      ImageIndex = 70
      object ContratodeTransporte1: TUniMenuItem
        Caption = 'Contrato de Transporte'
        ImageIndex = 52
        OnClick = ContratodeTransporte1Click
      end
      object N9: TUniMenuItem
        Caption = '-'
      end
      object ControledeEtiqueta1: TUniMenuItem
        Caption = 'Controle de Etiqueta'
        ImageIndex = 36
        OnClick = ControledeEtiqueta1Click
      end
      object N10: TUniMenuItem
        Caption = '-'
      end
      object RecibodeRetiradaVolumes1: TUniMenuItem
        Caption = 'Recibo de Retirada - Volumes'
        ImageIndex = 139
        OnClick = RecibodeRetiradaVolumes1Click
      end
      object N3: TUniMenuItem
        Caption = '-'
      end
      object RecibodeRetirada1: TUniMenuItem
        Caption = 'Recibo de Retirada - Valores'
        ImageIndex = 139
        OnClick = RecibodeRetirada1Click
      end
      object N11: TUniMenuItem
        Caption = '-'
      end
      object DeclaraodeRetirada1: TUniMenuItem
        Caption = 'Declara'#231#227'o de Retirada'
        ImageIndex = 168
        OnClick = DeclaraodeRetirada1Click
      end
    end
    object E1: TUniMenuItem
      Caption = 'Entrega do(s) Itens(s)'
      ImageIndex = 94
      Visible = False
      OnClick = E1Click
    end
    object F1: TUniMenuItem
      Caption = 'Financeiro Documento'
      ImageIndex = 99
      OnClick = F1Click
    end
    object A1: TUniMenuItem
      Caption = 'Anexar Cheque(s)'
      ImageIndex = 60
      Visible = False
      OnClick = A1Click
    end
    object I3: TUniMenuItem
      Caption = 'Indicativo de Vendas'
      ImageIndex = 118
      Visible = False
      OnClick = I3Click
    end
    object N7: TUniMenuItem
      Caption = '-'
    end
    object F2: TUniMenuItem
      Caption = 'Fatura Pedido'
      ImageIndex = 14
      OnClick = F2Click
    end
    object e2: TUniMenuItem
      Caption = 'Controle de Etiqueta'
      ImageIndex = 36
      OnClick = e2Click
    end
  end
  inherited UniScreenMask: TUniScreenMask
    Top = 18
  end
end
