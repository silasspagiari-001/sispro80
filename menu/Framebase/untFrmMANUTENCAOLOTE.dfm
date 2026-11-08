object frmMANUTENCAOLOTE: TfrmMANUTENCAOLOTE
  Left = 0
  Top = 0
  ClientHeight = 346
  ClientWidth = 613
  Caption = 'Manuten'#231#227'o do Lote/BAS'
  OnShow = UniFormShow
  OnResize = UniFormResize
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  ActiveControl = btnimpressao
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  TextHeight = 15
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 613
    Height = 346
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    object rcBlock10: TUniContainerPanel
      Left = 0
      Top = 289
      Width = 613
      Height = 57
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alBottom
      TabOrder = 1
      object UniContainerPanel2: TUniContainerPanel
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
          Caption = '<i class="fas fa-bezier-curve">     Gerar Estoque</i>'
          Anchors = [akLeft, akRight, akBottom]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = btnimpressaoClick
        end
      end
      object UniContainerPanel3: TUniContainerPanel
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
    object rcBlock20: TUniContainerPanel
      Tag = 1
      Left = 3
      Top = 3
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        150
        48)
      object UniButtonEditlote: TUniButtonEdit
        Left = 3
        Top = 17
        Width = 144
        Height = 29
        Hint = ''
        Text = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
        IconCls = 'search'
      end
      object UniLabelv1: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 0
        Width = 80
        Height = 17
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        AutoSize = False
        Caption = 'Lote'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock30: TUniContainerPanel
      Tag = 1
      Left = 155
      Top = 3
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        150
        48)
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 0
        Width = 80
        Height = 17
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        AutoSize = False
        Caption = 'PUREZA %'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniFormattedNumberEditpureza: TUniFormattedNumberEdit
        Left = 3
        Top = 17
        Width = 145
        Height = 29
        Hint = ''
        Alignment = taRightJustify
        ParentFont = False
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ReadOnly = True
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
    end
    object rcBlock40: TUniContainerPanel
      Tag = 1
      Left = 307
      Top = 3
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        150
        48)
      object UniLabel5: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 0
        Width = 80
        Height = 17
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        AutoSize = False
        Caption = 'Boletim'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniEditboletim: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 17
        Width = 147
        Height = 29
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ReadOnly = True
      end
    end
    object rcBlock50: TUniContainerPanel
      Tag = 1
      Left = 459
      Top = 3
      Width = 150
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        150
        48)
      object UniLabel4: TUniLabel
        AlignWithMargins = True
        Left = 1
        Top = 0
        Width = 80
        Height = 17
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        AutoSize = False
        Caption = 'Termo'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniEdittermo: TUniEdit
        AlignWithMargins = True
        Left = 1
        Top = 17
        Width = 149
        Height = 29
        Hint = ''
        Margins.Right = 5
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ReadOnly = True
      end
    end
    object rcBlock60: TUniContainerPanel
      Left = 3
      Top = 55
      Width = 302
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 6
      DesignSize = (
        302
        48)
      object cbxtipo: TUniComboBox
        AlignWithMargins = True
        Left = 0
        Top = 18
        Width = 300
        Height = 29
        Hint = ''
        Margins.Right = 5
        Style = csDropDownList
        Text = 'ENTRADA'
        Items.Strings = (
          'ENTRADA'
          'SAIDA')
        ItemIndex = 0
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
        IconItems = <>
      end
    end
    object rcBlock70: TUniContainerPanel
      Left = 307
      Top = 55
      Width = 302
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 7
      DesignSize = (
        302
        48)
      object UniFormattedNumberEditqtde: TUniFormattedNumberEdit
        Left = 3
        Top = 18
        Width = 299
        Height = 29
        Hint = ''
        Alignment = taRightJustify
        ParentFont = False
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel2: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 0
        Width = 80
        Height = 17
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        AutoSize = False
        Caption = 'Quantidade'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock80: TUniContainerPanel
      Left = 0
      Top = 107
      Width = 609
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 8
      DesignSize = (
        609
        48)
      object eddataemissao: TUniDateTimePicker
        AlignWithMargins = True
        Left = 3
        Top = 17
        Width = 601
        Height = 29
        Hint = ''
        Margins.Right = 5
        DateTime = 43232.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        ClientEvents.ExtEvents.Strings = (
          
            'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
            '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
            '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
            ':"  /  /   "});'#13#10'}')
      end
      object UniLabel3: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 0
        Width = 80
        Height = 17
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        AutoSize = False
        Caption = 'Emiss'#227'o'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object rcBlock90: TUniContainerPanel
      Left = 2
      Top = 161
      Width = 607
      Height = 127
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 9
      object UniMemoobs: TUniMemo
        Left = 3
        Top = 26
        Width = 601
        Height = 98
        Hint = ''
        TabOrder = 1
        ClearButton = True
      end
      object UniLabel6: TUniLabel
        AlignWithMargins = True
        Left = 4
        Top = 5
        Width = 80
        Height = 17
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        AutoSize = False
        Caption = 'Observa'#231#227'o'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
  end
end
