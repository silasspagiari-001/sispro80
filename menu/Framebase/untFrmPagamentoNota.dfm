object frmPagamentoNota: TfrmPagamentoNota
  Left = 0
  Top = 0
  ClientHeight = 650
  ClientWidth = 840
  Caption = 'Pagamento da nota | Caixa'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Font.Height = -13
  OnCreate = FormCreate
  TextHeight = 17
  object btnFinanceiro: TUniButton
    Left = 20
    Top = 18
    Width = 120
    Height = 36
    Hint = ''
    Caption = 'Financeiro'
    TabOrder = 0
    OnClick = FinanceiroClick
  end
  object btnBoleto: TUniButton
    Left = 150
    Top = 18
    Width = 100
    Height = 36
    Hint = 'Integracao com a emissao de boletos ainda nao configurada'
    Enabled = False
    ShowHint = True
    ParentShowHint = False
    Caption = 'Boleto'
    TabOrder = 1
  end
  object btnEmail: TUniButton
    Left = 260
    Top = 18
    Width = 100
    Height = 36
    Hint = ''
    Caption = 'E-mail'
    TabOrder = 2
    OnClick = EmailClick
  end
  object btnSair: TUniButton
    Left = 720
    Top = 18
    Width = 100
    Height = 36
    Hint = ''
    Caption = 'Sair'
    TabOrder = 3
    OnClick = SairClick
  end
  object lblNota: TUniLabel
    Left = 20
    Top = 67
    Width = 800
    Height = 22
    Hint = ''
    AutoSize = False
    Caption = 'Nota'
    TabOrder = 16
  end
  object lblForma0: TUniLabel
    Left = 20
    Top = 105
    Width = 49
    Height = 17
    Hint = ''
    Caption = 'Dinheiro'
    TabOrder = 17
  end
  object edValor0: TUniFormattedNumberEdit
    Left = 20
    Top = 129
    Width = 190
    Height = 34
    Hint = ''
    Alignment = taRightJustify
    TabOrder = 4
    DecimalSeparator = ','
    ThousandSeparator = '.'
    OnChange = ValorChange
  end
  object lblForma1: TUniLabel
    Left = 222
    Top = 105
    Width = 44
    Height = 17
    Hint = ''
    Caption = 'Cheque'
    TabOrder = 18
  end
  object edValor1: TUniFormattedNumberEdit
    Left = 222
    Top = 129
    Width = 190
    Height = 34
    Hint = ''
    Alignment = taRightJustify
    TabOrder = 5
    DecimalSeparator = ','
    ThousandSeparator = '.'
    OnChange = ValorChange
  end
  object lblForma2: TUniLabel
    Left = 424
    Top = 105
    Width = 84
    Height = 17
    Hint = ''
    Caption = 'Cartao credito'
    TabOrder = 20
  end
  object edValor2: TUniFormattedNumberEdit
    Left = 424
    Top = 129
    Width = 190
    Height = 34
    Hint = ''
    Alignment = taRightJustify
    TabOrder = 6
    DecimalSeparator = ','
    ThousandSeparator = '.'
    OnChange = ValorChange
  end
  object lblForma3: TUniLabel
    Left = 626
    Top = 105
    Width = 81
    Height = 17
    Hint = ''
    Caption = 'Cartao debito'
    TabOrder = 21
  end
  object edValor3: TUniFormattedNumberEdit
    Left = 626
    Top = 129
    Width = 190
    Height = 34
    Hint = ''
    Alignment = taRightJustify
    TabOrder = 7
    DecimalSeparator = ','
    ThousandSeparator = '.'
    OnChange = ValorChange
  end
  object lblForma4: TUniLabel
    Left = 20
    Top = 180
    Width = 64
    Height = 17
    Hint = ''
    Caption = 'Cartao loja'
    TabOrder = 22
  end
  object edValor4: TUniFormattedNumberEdit
    Left = 20
    Top = 204
    Width = 190
    Height = 34
    Hint = ''
    Alignment = taRightJustify
    TabOrder = 8
    DecimalSeparator = ','
    ThousandSeparator = '.'
    OnChange = ValorChange
  end
  object lblForma5: TUniLabel
    Left = 222
    Top = 180
    Width = 98
    Height = 17
    Hint = ''
    Caption = 'Vale alimentacao'
    TabOrder = 23
  end
  object edValor5: TUniFormattedNumberEdit
    Left = 222
    Top = 204
    Width = 190
    Height = 34
    Hint = ''
    Alignment = taRightJustify
    TabOrder = 9
    DecimalSeparator = ','
    ThousandSeparator = '.'
    OnChange = ValorChange
  end
  object lblForma6: TUniLabel
    Left = 424
    Top = 180
    Width = 75
    Height = 17
    Hint = ''
    Caption = 'Vale refeicao'
    TabOrder = 24
  end
  object edValor6: TUniFormattedNumberEdit
    Left = 424
    Top = 204
    Width = 190
    Height = 34
    Hint = ''
    Alignment = taRightJustify
    TabOrder = 10
    DecimalSeparator = ','
    ThousandSeparator = '.'
    OnChange = ValorChange
  end
  object lblForma7: TUniLabel
    Left = 626
    Top = 180
    Width = 79
    Height = 17
    Hint = ''
    Caption = 'Vale presente'
    TabOrder = 25
  end
  object edValor7: TUniFormattedNumberEdit
    Left = 626
    Top = 204
    Width = 190
    Height = 34
    Hint = ''
    Alignment = taRightJustify
    TabOrder = 11
    DecimalSeparator = ','
    ThousandSeparator = '.'
    OnChange = ValorChange
  end
  object lblForma8: TUniLabel
    Left = 20
    Top = 255
    Width = 97
    Height = 17
    Hint = ''
    Caption = 'Vale combustivel'
    TabOrder = 26
  end
  object edValor8: TUniFormattedNumberEdit
    Left = 20
    Top = 279
    Width = 190
    Height = 34
    Hint = ''
    Alignment = taRightJustify
    TabOrder = 12
    DecimalSeparator = ','
    ThousandSeparator = '.'
    OnChange = ValorChange
  end
  object lblForma9: TUniLabel
    Left = 222
    Top = 255
    Width = 54
    Height = 17
    Hint = ''
    Caption = 'Duplicata'
    TabOrder = 27
  end
  object edValor9: TUniFormattedNumberEdit
    Left = 222
    Top = 279
    Width = 190
    Height = 34
    Hint = ''
    Alignment = taRightJustify
    TabOrder = 13
    DecimalSeparator = ','
    ThousandSeparator = '.'
    OnChange = ValorChange
  end
  object lblForma10: TUniLabel
    Left = 424
    Top = 255
    Width = 106
    Height = 17
    Hint = ''
    Caption = 'Transferencia / Pix'
    TabOrder = 28
  end
  object edValor10: TUniFormattedNumberEdit
    Left = 424
    Top = 279
    Width = 190
    Height = 34
    Hint = ''
    Alignment = taRightJustify
    TabOrder = 14
    DecimalSeparator = ','
    ThousandSeparator = '.'
    OnChange = ValorChange
  end
  object lblForma11: TUniLabel
    Left = 626
    Top = 255
    Width = 34
    Height = 17
    Hint = ''
    Caption = 'Outro'
    TabOrder = 29
  end
  object edValor11: TUniFormattedNumberEdit
    Left = 626
    Top = 279
    Width = 190
    Height = 34
    Hint = ''
    Alignment = taRightJustify
    TabOrder = 15
    DecimalSeparator = ','
    ThousandSeparator = '.'
    OnChange = ValorChange
  end
  object lblResumo: TUniLabel
    Left = 20
    Top = 336
    Width = 800
    Height = 24
    Hint = ''
    AutoSize = False
    Caption = 'Resumo'
    TabOrder = 30
  end
  object lblEntrada: TUniLabel
    Left = 20
    Top = 368
    Width = 800
    Height = 24
    Hint = ''
    AutoSize = False
    Caption = 'Valores'
    TabOrder = 31
  end
  object btnGravar: TUniButton
    Left = 20
    Top = 405
    Width = 230
    Height = 38
    Hint = ''
    Caption = 'Gravar novo pagamento'
    TabOrder = 32
    OnClick = GravarClick
  end
  object btnReceber: TUniButton
    Left = 265
    Top = 405
    Width = 300
    Height = 38
    Hint = ''
    Caption = 'Confirmar recebimento do selecionado'
    TabOrder = 33
    OnClick = ReceberClick
  end
  object grdHistorico: TUniDBGrid
    Left = 20
    Top = 458
    Width = 800
    Height = 133
    Hint = ''
    ReadOnly = True
    LoadMask.Message = 'Loading data...'
    TabOrder = 19
  end
  object lblAviso: TUniLabel
    Left = 20
    Top = 603
    Width = 800
    Height = 40
    Hint = ''
    AutoSize = False
    Caption = 
      'Dinheiro e Pix: recebidos. Demais formas: pendentes. Boleto: int' +
      'egracao pendente.'
    TabOrder = 34
  end
end
