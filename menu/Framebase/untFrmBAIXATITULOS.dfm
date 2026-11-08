object frmBAIXATITULO: TfrmBAIXATITULO
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal:'#13#10']]'
  ClientHeight = 414
  ClientWidth = 703
  Caption = ''
  OnResize = UniFormResize
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  Font.Height = -13
  OnReady = UniFormReady
  OnBeforeShow = UniFormBeforeShow
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  TextHeight = 17
  object UniScrollBox1: TUniScrollBox
    Left = 0
    Top = 0
    Width = 703
    Height = 414
    Hint = ''
    Align = alClient
    TabOrder = 0
    DesignSize = (
      701
      412)
    ScrollHeight = 373
    ScrollWidth = 693
    object rcBlock10: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 701
      Height = 35
      Hint = '[[cols:12]]'
      ParentColor = False
      Align = alTop
      TabOrder = 0
      object paCabecalho: TUniPanel
        Left = 0
        Top = 0
        Width = 701
        Height = 34
        Hint = ''
        Align = alTop
        Anchors = [akTop]
        TabOrder = 1
        BorderStyle = ubsNone
        Caption = ''
        Color = 2364689
        object labTitulo: TUniLabel
          Left = 24
          Top = -1
          Width = 830
          Height = 28
          Hint = ''
          AutoSize = False
          Caption = 'Baixa Titulos'
          ParentFont = False
          Font.Color = clWhite
          Font.Height = -23
          TabOrder = 1
        end
      end
    end
    object memObs: TUniDBMemo
      Left = 8
      Top = 185
      Width = 422
      Height = 116
      Hint = ''
      DataField = 'OBSERVACOES'
      DataSource = dsMaster
      TabOrder = 1
    end
    object rcB2: TUniContainerPanel
      Left = 453
      Top = 100
      Width = 240
      Height = 273
      Hint = ''
      ParentColor = False
      Color = clWhite
      TabOrder = 2
      DesignSize = (
        240
        273)
      object UniLabel6: TUniLabel
        Left = 12
        Top = 8
        Width = 88
        Height = 13
        Hint = ''
        Caption = 'Data Pagamento:'
        TabOrder = 1
      end
      object dtpPagamento: TUniDateTimePicker
        Left = 12
        Top = 24
        Width = 216
        Height = 29
        Hint = ''
        DateTime = 45900.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        ClientEvents.ExtEvents.Strings = (
          
            'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
            '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
            '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
            ':  /  /   "});'#13#10'}')
      end
      object UniLabel7: TUniLabel
        Left = 12
        Top = 64
        Width = 56
        Height = 13
        Hint = ''
        Caption = 'Data Baixa:'
        TabOrder = 3
      end
      object dtpBaixa: TUniDateTimePicker
        Left = 12
        Top = 80
        Width = 216
        Height = 29
        Hint = ''
        DateTime = 45900.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        ClientEvents.ExtEvents.Strings = (
          
            'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
            '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
            '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
            ':  /  /   "});'#13#10'}')
      end
      object UniLabel8: TUniLabel
        Left = 12
        Top = 120
        Width = 30
        Height = 13
        Hint = ''
        Caption = 'Juros:'
        TabOrder = 5
      end
      object edJuros: TUniFormattedNumberEdit
        Left = 12
        Top = 136
        Width = 216
        Height = 29
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 6
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel9: TUniLabel
        Left = 12
        Top = 166
        Width = 45
        Height = 13
        Hint = ''
        Caption = '(%)Taxas:'
        TabOrder = 7
      end
      object edPercTaxas: TUniFormattedNumberEdit
        Left = 12
        Top = 182
        Width = 104
        Height = 29
        Hint = ''
        TabOrder = 8
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel10: TUniLabel
        Left = 132
        Top = 166
        Width = 30
        Height = 13
        Hint = ''
        Caption = 'Taxas:'
        TabOrder = 9
      end
      object edTaxas: TUniFormattedNumberEdit
        Left = 132
        Top = 182
        Width = 96
        Height = 29
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 10
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel11: TUniLabel
        Left = 12
        Top = 214
        Width = 52
        Height = 13
        Hint = ''
        Caption = 'Desconto:'
        TabOrder = 11
      end
      object edDesconto: TUniFormattedNumberEdit
        Left = 12
        Top = 230
        Width = 216
        Height = 29
        Hint = ''
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 12
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
    end
    object rcBlab: TUniContainerPanel
      Tag = 1
      Left = 5
      Top = 100
      Width = 132
      Height = 53
      Hint = ''
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        132
        53)
      object UniLabel2: TUniLabel
        Left = 3
        Top = 5
        Width = 65
        Height = 13
        Hint = ''
        Caption = 'Total/Parcial:'
        Anchors = [akLeft]
        TabOrder = 1
      end
      object cbxTotalParcial: TUniComboBox
        Left = 3
        Top = 22
        Width = 125
        Height = 29
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'Total'
          'Parcial')
        Anchors = [akLeft]
        TabOrder = 2
        IconItems = <>
      end
    end
    object UniContainerPanel1: TUniContainerPanel
      Tag = 1
      Left = 154
      Top = 100
      Width = 132
      Height = 53
      Hint = ''
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        132
        53)
      object UniLabel3: TUniLabel
        Left = 3
        Top = 2
        Width = 26
        Height = 13
        Hint = ''
        Caption = 'Tipo:'
        Anchors = [akLeft]
        TabOrder = 1
      end
      object cbxTipo: TUniComboBox
        Left = 3
        Top = 21
        Width = 124
        Height = 29
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'D'#233'bito'
          'Cr'#233'dito')
        Anchors = [akLeft]
        TabOrder = 2
        IconItems = <>
      end
    end
    object UniContainerPanel2: TUniContainerPanel
      Tag = 1
      Left = 298
      Top = 102
      Width = 132
      Height = 51
      Hint = ''
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        132
        51)
      object UniLabel4: TUniLabel
        Left = 8
        Top = 3
        Width = 29
        Height = 13
        Hint = ''
        Caption = 'Valor:'
        Anchors = [akLeft]
        TabOrder = 1
      end
      object edValor: TUniFormattedNumberEdit
        Left = 3
        Top = 20
        Width = 124
        Height = 29
        Hint = ''
        Alignment = taRightJustify
        ParentFont = False
        Font.Height = -15
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
    end
    object btnSair: TUniButton
      Left = 134
      Top = 330
      Width = 135
      Height = 36
      Hint = ''
      Caption = 'Sair'
      TabOrder = 6
      OnClick = btnSairClick
    end
    object btnGravar: TUniButton
      Left = 285
      Top = 330
      Width = 145
      Height = 36
      Hint = ''
      Caption = 'Gravar'
      TabOrder = 7
      OnClick = btnGravarClick
    end
    object UniLabel1: TUniLabel
      Left = 16
      Top = 40
      Width = 55
      Height = 17
      Hint = ''
      Caption = 'Portador:'
      TabOrder = 8
    end
    object edLkpPORTADORES: TUniDBEdit
      Left = 9
      Top = 60
      Width = 684
      Height = 29
      Hint = 
        '[['#13#10'DESCRICAO PORTADOR|'#13#10'lkpfilter-empty:Selecione um Portador<t' +
        'ranslate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-gridattr: |'#13#10'valid:bla' +
        'nk |'#13#10'valid-required:top-in |'#13#10']]'
      CharCase = ecUpperCase
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 9
      Color = clInfoBk
      ReadOnly = True
      InputType = 'text'
    end
  end
  object memParcelas: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 992
    Top = 48
  end
  object dsParcelas: TDataSource
    DataSet = memParcelas
    Left = 992
    Top = 128
  end
  object dsMaster: TDataSource
    DataSet = sqlMaster
    Left = 80
    Top = 328
  end
  object sqlMaster: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    SQL.Strings = (
      'SELECT * FROM RECEBER WHERE CODIGO = :CODIGO')
    Left = 152
    Top = 320
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object rcSweetAlert: TUniSweetAlert
    Title = 'Title'
    ConfirmButtonText = 'OK'
    CancelButtonText = 'Cancel'
    ImageIndex = 0
    Padding = 20
    FocusCancel = True
    Left = 443
    Top = 4
  end
end
