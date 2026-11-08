object FrmCRESCIMENTOFATEMPRESA: TFrmCRESCIMENTOFATEMPRESA
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal:'#13#10']]'
  ActiveControl = btnimpressao
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Crescimento Empresarial'
  ClientHeight = 312
  ClientWidth = 820
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = UniFormCreate
  OnResize = UniFormResize
  OnShow = UniFormShow
  TextHeight = 15
  object paTitulo: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 820
    Height = 56
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 2
    object labTitulo: TUniLabel
      AlignWithMargins = True
      Left = 16
      Top = 6
      Width = 601
      Height = 23
      Hint = ''
      Margins.Left = 16
      Margins.Top = 6
      TextConversion = txtHTML
      Caption = 
        '<i class="fas fa-chart-line" style="color:#2f8a4c;"></i>  Cresci' +
        'mento Empresarial'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri Light'
      TabOrder = 1
    end
    object labSubtitulo: TUniLabel
      AlignWithMargins = True
      Left = 20
      Top = 34
      Width = 320
      Height = 13
      Hint = ''
      Margins.Left = 20
      Caption = 
        'Tipo e documentos a incluir no relat'#243'rio de crescimento e tend'#234'n' +
        'cia'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object paBotoes: TUniContainerPanel
    Left = 0
    Top = 250
    Width = 820
    Height = 62
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 1
    object btnimpressao: TUniBitBtn
      AlignWithMargins = True
      Left = 12
      Top = 12
      Width = 200
      Height = 38
      Hint = '[[cls:ButtonThemeCrud]]'
      Margins.Left = 12
      Margins.Top = 12
      Caption = '<i class="fas fa-file-pdf"></i>  Impress'#227'o (PDF)'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = btnimpressaoClick
    end
    object UniBitBtn1: TUniBitBtn
      AlignWithMargins = True
      Left = 226
      Top = 12
      Width = 150
      Height = 38
      Hint = '[[cls:ButtonThemeCrud]]'
      Margins.Top = 12
      Caption = '<i class="fas fa-sign-out-alt"></i>  Sair'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
      OnClick = UniBitBtn1Click
    end
    object labRodape: TUniLabel
      Left = 396
      Top = 23
      Width = 277
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      Caption = 'O relat'#243'rio '#233' gerado em PDF e aberto na tela de impress'#227'o.'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Calibri'
      TabOrder = 3
    end
  end
  object UniScrollBox1: TUniScrollBox
    Left = 0
    Top = 56
    Width = 820
    Height = 194
    Hint = ''
    TabOrder = 0
    ScrollHeight = 134
    ScrollWidth = 788
    object rcBlock30: TUniContainerPanel
      Left = 3
      Top = 3
      Width = 253
      Height = 62
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        253
        62)
      object UniLabelFd1: TUniLabel
        AlignWithMargins = True
        Left = 2
        Top = 2
        Width = 24
        Height = 15
        Hint = ''
        Margins.Left = 2
        Margins.Top = 2
        Margins.Bottom = 2
        Caption = 'Tipo'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object cbxtipo: TUniComboBox
        AlignWithMargins = True
        Left = 2
        Top = 22
        Width = 245
        Height = 29
        Hint = ''
        Margins.Left = 2
        Margins.Right = 6
        Text = 'Nota'
        Items.Strings = (
          'Nota'
          'Pedidos')
        ItemIndex = 0
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
        IconItems = <>
      end
    end
    object rcBlock80: TUniContainerPanel
      Left = 3
      Top = 72
      Width = 785
      Height = 62
      Hint = '[[cols:xs-12 sm-12 md-12]]'
      ParentColor = False
      TabOrder = 0
      object UniCheckBoxVENDAS: TUniCheckBox
        Left = 2
        Top = 22
        Width = 120
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Vendas'
        TabOrder = 1
      end
      object UniCheckBoxDEVOLUCAO: TUniCheckBox
        Left = 132
        Top = 22
        Width = 120
        Height = 17
        Hint = ''
        Caption = 'Devolu'#231#227'o'
        TabOrder = 2
      end
      object UniCheckBoxVENDASEF: TUniCheckBox
        Left = 262
        Top = 22
        Width = 120
        Height = 17
        Hint = ''
        Checked = True
        Caption = 'Venda E.F.'
        TabOrder = 3
      end
      object UniCheckBoxBONIFICACAO: TUniCheckBox
        Left = 392
        Top = 22
        Width = 120
        Height = 17
        Hint = ''
        Caption = 'Bonifica'#231#227'o'
        TabOrder = 4
      end
      object UniCheckBoxTROCA: TUniCheckBox
        Left = 522
        Top = 22
        Width = 120
        Height = 17
        Hint = ''
        Caption = 'Troca'
        TabOrder = 5
      end
      object UniCheckBoxOUTROS: TUniCheckBox
        Left = 652
        Top = 22
        Width = 120
        Height = 17
        Hint = ''
        Caption = 'Outros'
        TabOrder = 6
      end
    end
  end
  object UniScreenMask1: TUniScreenMask
    Enabled = True
    Left = 400
    Top = 150
  end
end
