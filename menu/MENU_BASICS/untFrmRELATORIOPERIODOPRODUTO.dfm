object frmRELATORIOPERIODOPRODUTO: TfrmRELATORIOPERIODOPRODUTO
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal:'#13#10']]'
  ActiveControl = btnimpressao
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relatorio por Periodo de Produtos'
  ClientHeight = 410
  ClientWidth = 594
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
    Width = 594
    Height = 50
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 2
    object labTitulo: TUniLabel
      AlignWithMargins = True
      Left = 16
      Top = 6
      Width = 644
      Height = 23
      Hint = ''
      Margins.Left = 16
      Margins.Top = 6
      TextConversion = txtHTML
      Caption = 
        '<i class="fas fa-boxes" style="color:#2f8a4c;"></i>  Relatorio p' +
        'or Periodo de Produtos'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri Light'
      TabOrder = 1
    end
    object labSubtitulo: TUniLabel
      AlignWithMargins = True
      Left = 20
      Top = 34
      Width = 287
      Height = 13
      Hint = ''
      Margins.Left = 20
      Caption = 'Relat'#243'rio Vendas -'#128#148' per'#237'odo, produtos, tipo, ordem e situa'#231#245'es'
      ParentFont = False
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object paBotoes: TUniContainerPanel
    Left = 0
    Top = 348
    Width = 594
    Height = 62
    Hint = ''
    ParentColor = False
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      594
      62)
    object btnimpressao: TUniBitBtn
      AlignWithMargins = True
      Left = 12
      Top = 12
      Width = 149
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
      Left = 167
      Top = 12
      Width = 98
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
      Left = 271
      Top = 15
      Width = 277
      Height = 13
      Hint = ''
      Alignment = taRightJustify
      Caption = 'O relat'#243'rio '#233' gerado em PDF e aberto na tela de impress'#227'o.'
      Anchors = []
      ParentFont = False
      Font.Color = clGray
      Font.Height = -12
      Font.Name = 'Calibri'
      TabOrder = 3
    end
  end
  object UniScrollBox1: TUniScrollBox
    Left = 0
    Top = 50
    Width = 594
    Height = 298
    Hint = ''
    Align = alClient
    TabOrder = 0
    object rcBlock20: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 592
      Height = 296
      Hint = '[[cols:xs-12 sm-12 md-12]]'
      ParentColor = False
      Align = alClient
      TabOrder = 0
      object rcBlock25: TUniContainerPanel
        Left = 3
        Top = 3
        Width = 157
        Height = 62
        Hint = '[[cols:xs-12 sm-4 md-4]]'
        ParentColor = False
        TabOrder = 1
        DesignSize = (
          157
          62)
        object UniLabelDtIni: TUniLabel
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 65
          Height = 15
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Bottom = 2
          Caption = 'Data Inicial'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edSearchDATAINIVEN: TUniDateTimePicker
          AlignWithMargins = True
          Left = 2
          Top = 22
          Width = 149
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
          OnExit = edSearchDATAINIVENExit
        end
      end
      object rcBlock28: TUniContainerPanel
        Left = 175
        Top = 3
        Width = 152
        Height = 62
        Hint = '[[cols:xs-12 sm-4 md-4]]'
        ParentColor = False
        TabOrder = 2
        DesignSize = (
          152
          62)
        object UniLabel1: TUniLabel
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 17
          Height = 15
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Bottom = 2
          Caption = 'at'#233
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edSearchDATAFINVEN: TUniDateTimePicker
          AlignWithMargins = True
          Left = 2
          Top = 22
          Width = 144
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
        end
      end
      object rcBlock31: TUniContainerPanel
        Left = 347
        Top = 3
        Width = 150
        Height = 62
        Hint = '[[cols:xs-12 sm-4 md-4]]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          150
          62)
        object UniCheckBoxresumo: TUniCheckBox
          AlignWithMargins = True
          Left = 2
          Top = 22
          Width = 142
          Height = 17
          Hint = ''
          Margins.Left = 2
          Margins.Right = 6
          Caption = 'Resumo dos Produtos'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          OnChange = UniCheckBoxresumoChange
        end
      end
      object rcBlock34: TUniContainerPanel
        Left = 3
        Top = 72
        Width = 157
        Height = 62
        Hint = '[[cols:xs-12 sm-6 md-6]]'
        ParentColor = False
        TabOrder = 4
        DesignSize = (
          157
          62)
        object UniLabel2: TUniLabel
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 89
          Height = 15
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Bottom = 2
          Caption = 'Produtos Inicial'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edSearchPESSOAINIVEN: TUniButtonEdit
          AlignWithMargins = True
          Left = 2
          Top = 22
          Width = 149
          Height = 29
          Hint = ''
          Margins.Left = 2
          Margins.Right = 6
          Text = '00001'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          OnButtonClick = edSearchPESSOAINIVENButtonClick
          IconCls = 'search'
        end
      end
      object rcBlock36: TUniContainerPanel
        Left = 175
        Top = 72
        Width = 152
        Height = 62
        Hint = '[[cols:xs-12 sm-6 md-6]]'
        Visible = False
        ParentColor = False
        TabOrder = 5
        DesignSize = (
          152
          62)
        object UniLabel3: TUniLabel
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 81
          Height = 15
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Bottom = 2
          Caption = 'Produtos Final'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object edSearchPESSOAFINVEN: TUniButtonEdit
          AlignWithMargins = True
          Left = 2
          Top = 22
          Width = 144
          Height = 29
          Hint = ''
          Margins.Left = 2
          Margins.Right = 6
          Text = '99999'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          OnButtonClick = edSearchPESSOAFINVENButtonClick
          IconCls = 'search'
        end
      end
      object rcBlock40: TUniContainerPanel
        Left = 3
        Top = 141
        Width = 157
        Height = 62
        Hint = '[[cols:xs-12 sm-4 md-4]]'
        ParentColor = False
        TabOrder = 6
        DesignSize = (
          157
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
          Width = 149
          Height = 29
          Hint = ''
          Margins.Left = 2
          Margins.Right = 6
          Style = csDropDownList
          Text = 'Nota'
          Items.Strings = (
            'Nota')
          ItemIndex = 0
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
          IconItems = <>
        end
      end
      object rcBlock43: TUniContainerPanel
        Left = 175
        Top = 141
        Width = 152
        Height = 62
        Hint = '[[cols:xs-12 sm-4 md-4]]'
        ParentColor = False
        TabOrder = 7
        DesignSize = (
          152
          62)
        object UniLabel4: TUniLabel
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 37
          Height = 15
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Bottom = 2
          Caption = 'Ordem'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object cbxordem: TUniComboBox
          AlignWithMargins = True
          Left = 2
          Top = 22
          Width = 144
          Height = 29
          Hint = ''
          Margins.Left = 2
          Margins.Right = 6
          Style = csDropDownList
          Text = 'Produtos'
          Items.Strings = (
            'Numero'
            'Emiss'#227'o'
            'Produtos')
          ItemIndex = 2
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
          IconItems = <>
        end
      end
      object rcBlock46: TUniContainerPanel
        Left = 347
        Top = 141
        Width = 150
        Height = 62
        Hint = '[[cols:xs-12 sm-4 md-4]]'
        ParentColor = False
        TabOrder = 8
        DesignSize = (
          150
          62)
        object UniLabel5: TUniLabel
          AlignWithMargins = True
          Left = 2
          Top = 2
          Width = 34
          Height = 15
          Hint = ''
          Margins.Left = 2
          Margins.Top = 2
          Margins.Bottom = 2
          Caption = 'Status'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
        end
        object cbxstatus: TUniComboBox
          AlignWithMargins = True
          Left = 2
          Top = 22
          Width = 144
          Height = 29
          Hint = ''
          Margins.Left = 2
          Margins.Right = 6
          Style = csDropDownList
          Text = 'Autorizada'
          Items.Strings = (
            'Autorizada'
            'Cancelada')
          ItemIndex = 0
          Anchors = [akLeft, akTop, akRight]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
          IconItems = <>
        end
      end
      object rcBlock49: TUniContainerPanel
        Left = 3
        Top = 210
        Width = 588
        Height = 74
        Hint = '[[cols:xs-12 sm-12 md-12]]'
        ParentColor = False
        TabOrder = 9
        object UniCheckBoxVENDAS: TUniCheckBox
          Left = 0
          Top = 3
          Width = 97
          Height = 17
          Hint = ''
          Caption = 'Vendas '
          TabOrder = 1
        end
        object UniCheckBoxDEVOLUCAO: TUniCheckBox
          Left = 111
          Top = 3
          Width = 97
          Height = 17
          Hint = ''
          Caption = 'Devolu'#231#227'o'
          TabOrder = 2
        end
        object UniCheckBoxVENDASEF: TUniCheckBox
          Left = 214
          Top = 3
          Width = 97
          Height = 17
          Hint = ''
          Caption = 'Venda E.F.'
          TabOrder = 3
        end
        object UniCheckBoxBONIFICACAO: TUniCheckBox
          Left = 1
          Top = 37
          Width = 97
          Height = 17
          Hint = ''
          Caption = 'Bonifica'#231#227'o'
          TabOrder = 4
        end
        object UniCheckBoxTROCA: TUniCheckBox
          Left = 112
          Top = 37
          Width = 97
          Height = 17
          Hint = ''
          Caption = 'Troca'
          TabOrder = 5
        end
        object UniCheckBoxOUTROS: TUniCheckBox
          Left = 215
          Top = 37
          Width = 97
          Height = 17
          Hint = ''
          Caption = 'Outros'
          TabOrder = 6
        end
      end
    end
  end
end
