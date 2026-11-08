object frmRELATORIO_IMPOSTOCONTABILIDADE: TfrmRELATORIO_IMPOSTOCONTABILIDADE
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal:'#13#10']]'
  ActiveControl = btnimpressao
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Al'#237'quota de ICMS'
  ClientHeight = 236
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  OnResize = UniFormResize
  OnShow = UniFormShow
  TextHeight = 15
  object paTitulo: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 693
    Height = 56
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 820
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
        '<i class="fas fa-file-invoice-dollar" style="color:#2f6fd0;"></i' +
        '>  Al'#237'quota de ICMS'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri Light'
      TabOrder = 1
    end
    object labSubtitulo: TUniLabel
      AlignWithMargins = True
      Left = 20
      Top = 34
      Width = 311
      Height = 13
      Hint = ''
      Margins.Left = 20
      Caption = 'Per'#237'odo de emiss'#227'o para o relat'#243'rio de impostos da contabilidade'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object paBotoes: TUniContainerPanel
    Left = 0
    Top = 174
    Width = 693
    Height = 62
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 318
    ExplicitWidth = 820
    object btnimpressao: TUniBitBtn
      AlignWithMargins = True
      Left = 12
      Top = 12
      Width = 173
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
      Left = 191
      Top = 12
      Width = 119
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
      Left = 326
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
    Width = 693
    Height = 118
    Hint = ''
    Align = alClient
    TabOrder = 0
    ScrollHeight = 65
    ScrollWidth = 545
    object rcBlock10: TUniContainerPanel
      Left = 3
      Top = 3
      Width = 270
      Height = 62
      Hint = '[[cols:xs-12 sm-6 md-6]]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        270
        62)
      object UniLabelDtIni: TUniLabel
        AlignWithMargins = True
        Left = 2
        Top = 2
        Width = 80
        Height = 15
        Hint = ''
        Margins.Left = 2
        Margins.Top = 2
        Margins.Bottom = 2
        Caption = 'Emiss'#227'o In'#237'cio'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edSearchDATAINI: TUniDateTimePicker
        AlignWithMargins = True
        Left = 2
        Top = 22
        Width = 262
        Height = 29
        Hint = ''
        Margins.Left = 2
        Margins.Right = 6
        DateTime = 43232.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        ClientEvents.ExtEvents.Strings = (
          
            'afterrender=function afterrender(sender, eOpts) { $("#"+sender.i' +
            'nputEl.id).inputmask("99/99/9999",{placeholder:"  /  /   "}); }')
        OnExit = edSearchDATAINIExit
        ExplicitWidth = 378
      end
    end
    object rcBlock20: TUniContainerPanel
      Left = 286
      Top = 3
      Width = 259
      Height = 62
      Hint = '[[cols:xs-12 sm-6 md-6]]'
      ParentColor = False
      TabOrder = 0
      DesignSize = (
        259
        62)
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 2
        Top = 2
        Width = 77
        Height = 15
        Hint = ''
        Margins.Left = 2
        Margins.Top = 2
        Margins.Bottom = 2
        Caption = 'Emiss'#227'o Final'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object edSearchDATAFIN: TUniDateTimePicker
        AlignWithMargins = True
        Left = 2
        Top = 22
        Width = 251
        Height = 29
        Hint = ''
        Margins.Left = 2
        Margins.Right = 6
        DateTime = 43232.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        ClientEvents.ExtEvents.Strings = (
          
            'afterrender=function afterrender(sender, eOpts) { $("#"+sender.i' +
            'nputEl.id).inputmask("99/99/9999",{placeholder:"  /  /   "}); }')
        ExplicitWidth = 378
      end
    end
  end
end
