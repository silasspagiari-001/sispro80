object frmRELACAOENTREGAS: TfrmRELACAOENTREGAS
  Left = 0
  Top = 0
  ClientHeight = 336
  ClientWidth = 597
  Caption = 'Rela'#231#227'o de Entrega(s)'
  OnShow = UniFormShow
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object rcBlock40: TUniContainerPanel
    Left = 3
    Top = 3
    Width = 150
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-6]]'
    ParentColor = False
    TabOrder = 0
    DesignSize = (
      150
      48)
    object UniLabelDtIni: TUniLabel
      AlignWithMargins = True
      Left = 1
      Top = 0
      Width = 65
      Height = 15
      Hint = ''
      Margins.Top = 1
      Margins.Bottom = 2
      Caption = 'Data Inicial'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
    end
    object edSearchDATAINIVEN: TUniDateTimePicker
      AlignWithMargins = True
      Left = 1
      Top = 18
      Width = 149
      Height = 29
      Hint = ''
      Margins.Right = 5
      DateTime = 43232.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      ClientEvents.ExtEvents.Strings = (
        
          'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
          '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
          '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
          ':"  /  /   "});'#13#10'}')
    end
  end
  object rcBlock50: TUniContainerPanel
    Left = 160
    Top = 3
    Width = 150
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-6]]'
    ParentColor = False
    TabOrder = 1
    DesignSize = (
      150
      48)
    object UniLabel1: TUniLabel
      AlignWithMargins = True
      Left = 2
      Top = 0
      Width = 17
      Height = 15
      Hint = ''
      Margins.Top = 1
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
      Top = 18
      Width = 148
      Height = 29
      Hint = ''
      Margins.Right = 5
      DateTime = 43232.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      ClientEvents.ExtEvents.Strings = (
        
          'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
          '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
          '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
          ':"  /  /   "});'#13#10'}')
    end
  end
  object rcBlock60: TUniContainerPanel
    Left = 3
    Top = 57
    Width = 150
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-6]]'
    ParentColor = False
    TabOrder = 2
    DesignSize = (
      150
      48)
    object UniLabel2: TUniLabel
      AlignWithMargins = True
      Left = 1
      Top = 1
      Width = 84
      Height = 15
      Hint = ''
      Margins.Top = 1
      Margins.Bottom = 2
      Caption = 'Pessoas Inicial'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
    end
    object edSearchPESSOAINIVEN: TUniButtonEdit
      AlignWithMargins = True
      Left = 1
      Top = 21
      Width = 149
      Height = 26
      Hint = ''
      Text = '00001'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      OnButtonClick = edSearchPESSOAINIVENButtonClick
      IconCls = 'search'
    end
  end
  object rcBlock70: TUniContainerPanel
    Left = 160
    Top = 57
    Width = 150
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-6]]'
    ParentColor = False
    TabOrder = 3
    DesignSize = (
      150
      48)
    object UniLabel3: TUniLabel
      AlignWithMargins = True
      Left = 2
      Top = 1
      Width = 17
      Height = 15
      Hint = ''
      Margins.Top = 1
      Margins.Bottom = 2
      Caption = 'at'#233
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
    end
    object edSearchPESSOAFINVEN: TUniButtonEdit
      AlignWithMargins = True
      Left = 2
      Top = 21
      Width = 148
      Height = 26
      Hint = ''
      Text = '9999999'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      OnButtonClick = edSearchPESSOAFINVENButtonClick
      IconCls = 'search'
    end
  end
  object rcBlock10: TUniContainerPanel
    Left = 0
    Top = 277
    Width = 597
    Height = 59
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 4
    object rcBlock20: TUniContainerPanel
      Left = 3
      Top = 5
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        150
        48)
      object btnimpressao: TUniBitBtn
        Left = 11
        Top = 13
        Width = 119
        Height = 29
        Hint = '[[cls:ButtonThemeCrud]]'
        Margins.Top = 28
        Margins.Bottom = 12
        Caption = '<i class="fas fa-file-pdf"> Impress'#227'o</i>'
        Anchors = [akLeft, akRight, akBottom]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
        OnClick = btnimpressaoClick
      end
    end
    object rcBlock30: TUniContainerPanel
      Left = 196
      Top = 5
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        150
        48)
      object UniBitBtn1: TUniBitBtn
        Left = 17
        Top = 13
        Width = 119
        Height = 29
        Hint = '[[cls:ButtonThemeCrud]]'
        Margins.Top = 28
        Margins.Bottom = 12
        Caption = 'Sair'
        Anchors = [akLeft, akRight, akBottom]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
        OnClick = UniBitBtn1Click
      end
    end
  end
  object rcBlock80: TUniContainerPanel
    Left = 1
    Top = 163
    Width = 150
    Height = 48
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    TabOrder = 5
    DesignSize = (
      150
      48)
    object cbxtipodoc: TUniComboBox
      AlignWithMargins = True
      Left = 1
      Top = 18
      Width = 147
      Height = 30
      Hint = ''
      Margins.Right = 5
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'Notas'
        'Pedidos')
      Anchors = [akLeft, akRight, akBottom]
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      IconItems = <>
    end
    object UniLabel4: TUniLabel
      AlignWithMargins = True
      Left = 1
      Top = 1
      Width = 67
      Height = 15
      Hint = ''
      Margins.Top = 1
      Margins.Bottom = 2
      Caption = 'Tipo de Doc.'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object UniContainerPanel1: TUniContainerPanel
    Left = 160
    Top = 163
    Width = 150
    Height = 48
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    TabOrder = 6
    DesignSize = (
      150
      48)
    object cbxtipoentrega: TUniComboBox
      AlignWithMargins = True
      Left = 1
      Top = 18
      Width = 147
      Height = 30
      Hint = ''
      Margins.Right = 5
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'Entrege'
        'Disponivel'
        'Todos')
      Anchors = [akLeft, akRight, akBottom]
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      IconItems = <>
    end
    object UniLabel5: TUniLabel
      AlignWithMargins = True
      Left = 1
      Top = 1
      Width = 84
      Height = 15
      Hint = ''
      Margins.Top = 1
      Margins.Bottom = 2
      Caption = 'Tipo de Entrega'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 3
    Top = 110
    Width = 150
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-6]]'
    ParentColor = False
    TabOrder = 7
    DesignSize = (
      150
      48)
    object UniLabel6: TUniLabel
      AlignWithMargins = True
      Left = 1
      Top = 1
      Width = 83
      Height = 15
      Hint = ''
      Margins.Top = 1
      Margins.Bottom = 2
      Caption = 'Produto Inicial'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
    end
    object UniButtonEditPRODUTOENTINI: TUniButtonEdit
      AlignWithMargins = True
      Left = 1
      Top = 21
      Width = 149
      Height = 26
      Hint = ''
      Text = '00001'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      OnButtonClick = UniButtonEditPRODUTOENTINIButtonClick
      IconCls = 'search'
    end
  end
  object UniContainerPanel3: TUniContainerPanel
    Left = 160
    Top = 110
    Width = 150
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-6]]'
    ParentColor = False
    TabOrder = 8
    DesignSize = (
      150
      48)
    object UniLabel7: TUniLabel
      AlignWithMargins = True
      Left = 2
      Top = 1
      Width = 17
      Height = 15
      Hint = ''
      Margins.Top = 1
      Margins.Bottom = 2
      Caption = 'at'#233
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
    end
    object UniButtonEditPRODUTOENTFIN: TUniButtonEdit
      AlignWithMargins = True
      Left = 2
      Top = 21
      Width = 148
      Height = 26
      Hint = ''
      Text = '9999999'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      OnButtonClick = UniButtonEditPRODUTOENTFINButtonClick
      IconCls = 'search'
    end
  end
  object UniContainerPanel4: TUniContainerPanel
    Left = 315
    Top = 163
    Width = 150
    Height = 48
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    TabOrder = 9
    DesignSize = (
      150
      48)
    object UniComboBoxUF: TUniComboBox
      AlignWithMargins = True
      Left = 1
      Top = 18
      Width = 147
      Height = 30
      Hint = ''
      Margins.Right = 5
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'SP'
        'PR'
        'MT'
        'MS'
        'SC'
        'RJ'
        'TO'
        'PA'
        'AM'
        'AC'
        'PB'
        'RN'
        'SE'
        'PE'
        'MG'
        'ES'
        'RO'
        'AP'
        'AL'
        'CE'
        'BA'
        'DF'
        'GO'
        'MA'
        'NO'
        'RS'
        'PI'
        'RR'
        'EX'
        'BR'
        'TODOS')
      Anchors = [akLeft, akRight, akBottom]
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      IconItems = <>
    end
    object UniLabel8: TUniLabel
      AlignWithMargins = True
      Left = 1
      Top = 1
      Width = 14
      Height = 15
      Hint = ''
      Margins.Top = 1
      Margins.Bottom = 2
      Caption = 'UF'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
end
