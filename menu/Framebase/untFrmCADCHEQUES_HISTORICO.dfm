object frmcadcheques_historico: Tfrmcadcheques_historico
  Left = 0
  Top = 0
  ClientHeight = 343
  ClientWidth = 557
  Caption = 'Hist'#243'rico do Cheque'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 557
    Height = 177
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 0
    object UniDBGridEntrega: TUniDBGrid
      Left = 0
      Top = 0
      Width = 557
      Height = 177
      Hint = ''
      DataSource = dm_rc.dshistoricocheque
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
      WebOptions.Paged = False
      LoadMask.Message = 'Carregando Item(s)...'
      ForceFit = True
      Align = alClient
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Calibri'
      ParentFont = False
      TabOrder = 1
      Summary.Enabled = True
      OnCellClick = UniDBGridEntregaCellClick
      Columns = <
        item
          FieldName = 'STATUS'
          Title.Caption = ' '
          Width = 80
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Alignment = taCenter
        end
        item
          FieldName = 'SEQUENCIA'
          Title.Caption = ' '
          Width = 30
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Alignment = taCenter
        end
        item
          FieldName = 'DATA'
          Title.Caption = 'DATA'
          Width = 100
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'OBSERVACAO'
          Title.Caption = 'OBSERVA'#199#195'O'
          Width = 250
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'VALOR'
          Title.Caption = 'R$'
          Width = 74
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'exclui'
          Title.Caption = ' '
          Width = 30
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Alignment = taCenter
        end>
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 0
    Top = 183
    Width = 557
    Height = 50
    Hint = ''
    ParentColor = False
    TabOrder = 1
    DesignSize = (
      557
      50)
    object UniEditobs: TUniEdit
      AlignWithMargins = True
      Left = 3
      Top = 19
      Width = 554
      Height = 29
      Hint = ''
      Margins.Right = 5
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      ClearButton = True
    end
    object UniLabel108: TUniLabel
      AlignWithMargins = True
      Left = 3
      Top = 2
      Width = 116
      Height = 16
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
  object rcBlock10: TUniContainerPanel
    Left = 0
    Top = 298
    Width = 557
    Height = 45
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 2
    object UniContainerPanel3: TUniContainerPanel
      Left = 396
      Top = 5
      Width = 150
      Height = 38
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        150
        38)
      object UniBitBtn1: TUniBitBtn
        Left = 17
        Top = 3
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
    Left = 0
    Top = 239
    Width = 129
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-4]]'
    ParentColor = False
    TabOrder = 3
    object UniLabel1: TUniLabel
      AlignWithMargins = True
      Left = 3
      Top = 1
      Width = 116
      Height = 16
      Hint = ''
      Margins.Left = 10
      Margins.Top = 15
      AutoSize = False
      Caption = 'Data'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
    end
    object UniDateTimePickedata: TUniDateTimePicker
      AlignWithMargins = True
      Left = 3
      Top = 17
      Width = 123
      Height = 29
      Hint = ''
      Margins.Right = 5
      DateTime = 43232.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
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
  object rcBlock30: TUniContainerPanel
    Tag = 1
    Left = 262
    Top = 239
    Width = 228
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-4]]'
    ParentColor = False
    TabOrder = 4
    DesignSize = (
      228
      48)
    object cbxSearchCRUDField2: TUniComboBox
      AlignWithMargins = True
      Left = 3
      Top = 17
      Width = 222
      Height = 29
      Hint = ''
      Margins.Right = 5
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'Aberto'
        'Devolvido'
        'Compensado'
        '')
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      IconItems = <>
    end
    object UniLabel2: TUniLabel
      AlignWithMargins = True
      Left = 3
      Top = 1
      Width = 116
      Height = 16
      Hint = ''
      Margins.Left = 10
      Margins.Top = 15
      AutoSize = False
      Caption = 'Status'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object rcBlock40: TUniContainerPanel
    Tag = 1
    Left = 493
    Top = 239
    Width = 60
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-4]]'
    ParentColor = False
    TabOrder = 5
    object UniBitBtn12: TUniBitBtn
      AlignWithMargins = True
      Left = 11
      Top = 14
      Width = 33
      Height = 32
      Hint = 
        '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
        #13#10']]'
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = '<i class="fas fa-save"></i>'
      ParentFont = False
      Font.Height = -19
      Font.Name = 'Calibri'
      TabOrder = 1
      ScaleButton = False
      LayoutConfig.Padding = '0 2 0 0'
      OnClick = UniBitBtn12Click
    end
  end
  object UniContainerPanel4: TUniContainerPanel
    Tag = 1
    Left = 131
    Top = 239
    Width = 129
    Height = 48
    Hint = '[[cols:xs-12 sm-12 md-4]]'
    ParentColor = False
    TabOrder = 6
    DesignSize = (
      129
      48)
    object UniLabel3: TUniLabel
      AlignWithMargins = True
      Left = 3
      Top = 1
      Width = 116
      Height = 16
      Hint = ''
      Margins.Left = 10
      Margins.Top = 15
      AutoSize = False
      Caption = 'Valor'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
    end
    object UniFormattedNumberEditvlr: TUniFormattedNumberEdit
      Left = 3
      Top = 17
      Width = 120
      Height = 29
      Hint = ''
      Alignment = taRightJustify
      ParentFont = False
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Calibri'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DecimalSeparator = ','
      ThousandSeparator = '.'
    end
  end
end
