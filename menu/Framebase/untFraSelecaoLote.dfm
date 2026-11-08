object fraSelecaoLote: TfraSelecaoLote
  Left = 0
  Top = 0
  Width = 700
  Height = 390
  TabOrder = 0
  object paConteudo: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 700
    Height = 330
    Align = alClient
    Color = clWhite
    TabOrder = 0
    object labTitulo: TUniLabel
      Left = 24
      Top = 16
      Width = 500
      Height = 22
      AutoSize = False
      Caption = 'Selecione o lote'
      ParentFont = False
      Font.Name = 'Calibri'
      Font.Height = -22
    end
    object labProduto: TUniLabel
      Left = 24
      Top = 46
      Width = 600
      Height = 22
      AutoSize = False
      Caption = ''
      ParentFont = False
      Font.Name = 'Calibri'
      Font.Height = -14
    end
    object labLote: TUniLabel
      Left = 24
      Top = 78
      Width = 300
      Height = 22
      AutoSize = False
      Caption = 'Lote'
      ParentFont = False
      Font.Name = 'Calibri'
      Font.Height = -13
    end
    object edLote: TUniEdit
      Left = 24
      Top = 101
      Width = 476
      Height = 34
      Text = ''
      ParentFont = False
      Font.Name = 'Calibri'
      Font.Height = -16
      TabOrder = 0
      ReadOnly = False
      OnExit = LoteExit
    end
    object btnPesquisar: TUniButton
      Left = 512
      Top = 101
      Width = 164
      Height = 34
      Caption = 'Pesquisar lote'
      TabOrder = 1
      OnClick = PesquisarClick
    end
    object labAnalise: TUniLabel
      Left = 24
      Top = 153
      Width = 500
      Height = 22
      AutoSize = False
      Caption = 'DADOS DO LOTE'
      ParentFont = False
      Font.Name = 'Calibri'
      Font.Height = -13
    end
    object labPureza: TUniLabel
      Left = 24
      Top = 184
      Width = 208
      Height = 22
      AutoSize = False
      Caption = 'Pureza (%)'
      ParentFont = False
      Font.Name = 'Calibri'
      Font.Height = -13
    end
    object edPureza: TUniEdit
      Left = 24
      Top = 206
      Width = 208
      Height = 34
      Text = ''
      ParentFont = False
      Font.Name = 'Calibri'
      Font.Height = -16
      TabOrder = 2
      ReadOnly = True
      Color = clBtnFace
    end
    object labGerminacao: TUniLabel
      Left = 246
      Top = 184
      Width = 208
      Height = 22
      AutoSize = False
      Caption = 'Germinacao (%)'
      ParentFont = False
      Font.Name = 'Calibri'
      Font.Height = -13
    end
    object edGerminacao: TUniEdit
      Left = 246
      Top = 206
      Width = 208
      Height = 34
      Text = ''
      ParentFont = False
      Font.Name = 'Calibri'
      Font.Height = -16
      TabOrder = 2
      ReadOnly = True
      Color = clBtnFace
    end
    object labVC: TUniLabel
      Left = 468
      Top = 184
      Width = 208
      Height = 22
      AutoSize = False
      Caption = 'Valor cultural (%)'
      ParentFont = False
      Font.Name = 'Calibri'
      Font.Height = -13
    end
    object edVC: TUniEdit
      Left = 468
      Top = 206
      Width = 208
      Height = 34
      Text = ''
      ParentFont = False
      Font.Name = 'Calibri'
      Font.Height = -16
      TabOrder = 2
      ReadOnly = True
      Color = clBtnFace
    end
    object labTermo: TUniLabel
      Left = 24
      Top = 254
      Width = 320
      Height = 22
      AutoSize = False
      Caption = 'Termo'
      ParentFont = False
      Font.Name = 'Calibri'
      Font.Height = -13
    end
    object edTermo: TUniEdit
      Left = 24
      Top = 276
      Width = 320
      Height = 34
      Text = ''
      ParentFont = False
      Font.Name = 'Calibri'
      Font.Height = -16
      TabOrder = 3
      ReadOnly = True
      Color = clBtnFace
    end
    object labBoletim: TUniLabel
      Left = 356
      Top = 254
      Width = 320
      Height = 22
      AutoSize = False
      Caption = 'Boletim'
      ParentFont = False
      Font.Name = 'Calibri'
      Font.Height = -13
    end
    object edBoletim: TUniEdit
      Left = 356
      Top = 276
      Width = 320
      Height = 34
      Text = ''
      ParentFont = False
      Font.Name = 'Calibri'
      Font.Height = -16
      TabOrder = 3
      ReadOnly = True
      Color = clBtnFace
    end
  end
  object paAcoes: TUniContainerPanel
    Left = 0
    Top = 330
    Width = 700
    Height = 60
    Align = alBottom
    Color = clWhite
    TabOrder = 1
    object labMensagem: TUniLabel
      Left = 24
      Top = 8
      Width = 380
      Height = 44
      AutoSize = False
      Caption = ''
      ParentFont = False
      Font.Name = 'Calibri'
      Font.Height = -12
    end
    object btnCancelar: TUniButton
      Left = 412
      Top = 12
      Width = 120
      Height = 36
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = CancelarClick
    end
    object btnConfirmar: TUniButton
      Left = 544
      Top = 12
      Width = 132
      Height = 36
      Caption = 'Confirmar lote'
      TabOrder = 1
      OnClick = ConfirmarClick
    end
  end
end
