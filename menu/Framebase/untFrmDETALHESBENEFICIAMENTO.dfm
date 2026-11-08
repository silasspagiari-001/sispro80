object frmDETALHESBENEFICIAMENTO: TfrmDETALHESBENEFICIAMENTO
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal:'#13#10']]'
  ClientHeight = 346
  ClientWidth = 613
  Caption = 'Detalhes Beneficiamento'
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
      Left = 8
      Top = 8
      Width = 105
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        105
        48)
      object UniLabel3: TUniLabel
        Left = 4
        Top = -1
        Width = 42
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = 'N'#186' Nota'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 1
      end
      object UniButtonDbEditcodigopessoas: TUniButtonDbEdit
        Tag = 1
        AlignWithMargins = True
        Left = 2
        Top = 16
        Width = 100
        Height = 29
        Hint = ''
        DataField = 'NOTA'
        DataSource = dm_rc.dsdetalhes
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 2
        Color = clGray
        ReadOnly = True
        IconCls = 'search'
      end
    end
    object rcBlock20: TUniContainerPanel
      Left = 115
      Top = 8
      Width = 54
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        54
        48)
      object UniDBEdit17: TUniDBEdit
        Left = 4
        Top = 16
        Width = 47
        Height = 29
        Hint = ''
        DataField = 'SERIE'
        DataSource = dm_rc.dsdetalhes
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 1
        Color = clGray
        ReadOnly = True
      end
      object UniLabel1: TUniLabel
        Left = 4
        Top = -1
        Width = 27
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = 'Serie'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object UniContainerPanel2: TUniContainerPanel
      Left = 171
      Top = 8
      Width = 46
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        46
        48)
      object UniDBEdit1: TUniDBEdit
        Left = 4
        Top = 16
        Width = 39
        Height = 29
        Hint = ''
        DataField = 'SEQITENS'
        DataSource = dm_rc.dsdetalhes
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 1
        Color = clGray
        ReadOnly = True
      end
      object UniLabel2: TUniLabel
        Left = 4
        Top = -1
        Width = 22
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = 'Seq.'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object UniContainerPanel3: TUniContainerPanel
      Left = 220
      Top = 8
      Width = 77
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        77
        48)
      object UniLabel4: TUniLabel
        Left = 4
        Top = -1
        Width = 44
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = 'Produto'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 1
      end
      object UniButtonDbEdit1: TUniButtonDbEdit
        Tag = 1
        AlignWithMargins = True
        Left = 2
        Top = 16
        Width = 72
        Height = 29
        Hint = ''
        DataField = 'PRODUTO'
        DataSource = dm_rc.dsdetalhes
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 2
        Color = clGray
        ReadOnly = True
        IconCls = 'search'
      end
    end
    object UniContainerPanel4: TUniContainerPanel
      Left = 300
      Top = 8
      Width = 310
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 5
      DesignSize = (
        310
        48)
      object UniDBEdit2: TUniDBEdit
        Left = 4
        Top = 16
        Width = 303
        Height = 29
        Hint = ''
        DataField = 'DESCRICAO'
        DataSource = dm_rc.dsdetalhes
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 1
        Color = clGray
        ReadOnly = True
      end
      object UniLabel5: TUniLabel
        Left = 4
        Top = -1
        Width = 55
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = 'Descri'#231#227'o'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object UniContainerPanel5: TUniContainerPanel
      Left = 8
      Top = 58
      Width = 138
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 6
      object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
        Left = 2
        Top = 17
        Width = 133
        Height = 29
        Hint = ''
        DataField = 'QTENOTA'
        DataSource = dm_rc.dsdetalhes
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 1
        Color = clGray
        ReadOnly = True
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel6: TUniLabel
        Left = 4
        Top = 1
        Width = 48
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = 'Qte Nota'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object UniContainerPanel6: TUniContainerPanel
      Left = 148
      Top = 58
      Width = 140
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 7
      object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
        Left = 2
        Top = 17
        Width = 136
        Height = 29
        Hint = ''
        DataField = 'DISPONIVEL'
        DataSource = dm_rc.dsdetalhes
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 1
        Color = clGray
        ReadOnly = True
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel7: TUniLabel
        Left = 4
        Top = 1
        Width = 79
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = 'Sld Disponivel'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object UniContainerPanel7: TUniContainerPanel
      Left = 290
      Top = 58
      Width = 105
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 8
      object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
        Left = 2
        Top = 17
        Width = 100
        Height = 29
        Hint = ''
        DataField = 'GERNOTA'
        DataSource = dm_rc.dsdetalhes
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 1
        Color = clGray
        ReadOnly = True
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel8: TUniLabel
        Left = 4
        Top = 1
        Width = 62
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = '% Ger. Nota'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object UniContainerPanel8: TUniContainerPanel
      Left = 397
      Top = 58
      Width = 105
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 9
      object UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit
        Left = 2
        Top = 17
        Width = 100
        Height = 29
        Hint = ''
        DataField = 'PUREZANOTA'
        DataSource = dm_rc.dsdetalhes
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 1
        Color = clGray
        ReadOnly = True
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel9: TUniLabel
        Left = 4
        Top = 1
        Width = 78
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = '% Pureza Nota'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object UniContainerPanel9: TUniContainerPanel
      Left = 505
      Top = 58
      Width = 105
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 10
      object UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit
        Left = 2
        Top = 17
        Width = 100
        Height = 29
        Hint = ''
        DataField = 'VCNOTA'
        DataSource = dm_rc.dsdetalhes
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 1
        Color = clGray
        ReadOnly = True
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel10: TUniLabel
        Left = 4
        Top = 1
        Width = 31
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = '% V.C.'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object UniContainerPanel10: TUniContainerPanel
      Left = 8
      Top = 109
      Width = 138
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 11
      DesignSize = (
        138
        48)
      object UniLabel11: TUniLabel
        Left = 4
        Top = -1
        Width = 66
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = 'Lote Destino'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 1
      end
      object UniButtonDbEdit2: TUniButtonDbEdit
        Tag = 1
        AlignWithMargins = True
        Left = 2
        Top = 16
        Width = 133
        Height = 29
        Hint = ''
        DataField = 'LOTEDESTINO'
        DataSource = dm_rc.dsdetalhes
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        Color = clInfoBk
        OnButtonClick = UniButtonDbEdit2ButtonClick
        IconCls = 'search'
      end
    end
    object UniContainerPanel11: TUniContainerPanel
      Left = 148
      Top = 109
      Width = 138
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 12
      DesignSize = (
        138
        48)
      object UniLabel12: TUniLabel
        Left = 4
        Top = -1
        Width = 85
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = 'Boletim Destino'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 1
      end
      object UniDBEdit3: TUniDBEdit
        Left = 4
        Top = 16
        Width = 133
        Height = 29
        Hint = ''
        DataField = 'BOLETIMDESTINO'
        DataSource = dm_rc.dsdetalhes
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
      end
    end
    object UniContainerPanel12: TUniContainerPanel
      Left = 290
      Top = 109
      Width = 105
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 13
      object UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit
        Left = 2
        Top = 17
        Width = 100
        Height = 29
        Hint = ''
        DataField = 'GERMINACAO'
        DataSource = dm_rc.dsdetalhes
        TabOrder = 1
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel13: TUniLabel
        Left = 4
        Top = 1
        Width = 58
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = '% Ger. Lote'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object UniContainerPanel13: TUniContainerPanel
      Left = 397
      Top = 109
      Width = 105
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 14
      object UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit
        Left = 2
        Top = 17
        Width = 100
        Height = 29
        Hint = ''
        DataField = 'PUREZA'
        DataSource = dm_rc.dsdetalhes
        TabOrder = 1
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel14: TUniLabel
        Left = 4
        Top = 1
        Width = 74
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = '% Pureza Lote'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object UniContainerPanel14: TUniContainerPanel
      Left = 505
      Top = 109
      Width = 105
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 15
      object UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit
        Left = 2
        Top = 17
        Width = 100
        Height = 29
        Hint = ''
        DataField = 'VALORCULTURAL'
        DataSource = dm_rc.dsdetalhes
        TabOrder = 1
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel15: TUniLabel
        Left = 4
        Top = 1
        Width = 56
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = '% V.C. Lote'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object UniContainerPanel15: TUniContainerPanel
      Left = 8
      Top = 161
      Width = 602
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 16
      object UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit
        Left = 2
        Top = 17
        Width = 597
        Height = 29
        Hint = ''
        DataField = 'QUANTIDADE'
        DataSource = dm_rc.dsdetalhes
        ParentFont = False
        Font.Color = clBlack
        TabOrder = 1
        DecimalSeparator = ','
        ThousandSeparator = '.'
        OnExit = UniDBFormattedNumberEdit9Exit
      end
      object UniLabel16: TUniLabel
        Left = 4
        Top = 1
        Width = 89
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = 'Quantidade Lote'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object UniContainerPanel16: TUniContainerPanel
      Left = 8
      Top = 214
      Width = 602
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 17
      object UniDBFormattedNumberEdit10: TUniDBFormattedNumberEdit
        Left = 2
        Top = 17
        Width = 597
        Height = 29
        Hint = ''
        DataField = 'DESCARTE'
        DataSource = dm_rc.dsdetalhes
        ParentFont = False
        Font.Color = clBlack
        TabOrder = 1
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel17: TUniLabel
        Left = 4
        Top = 1
        Width = 48
        Height = 15
        Hint = ''
        Margins.Left = 10
        Margins.Top = 15
        Caption = 'Descarte'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        Transparent = False
        TabOrder = 2
      end
    end
    object rcBlock360: TUniContainerPanel
      Tag = 1
      Left = 8
      Top = 295
      Width = 121
      Height = 48
      Hint = '[[cols:xs-12 sm-12 md-3]]'
      ParentColor = False
      TabOrder = 18
      object btnSaida: TUniBitBtn
        AlignWithMargins = True
        Left = 82
        Top = 10
        Width = 33
        Height = 32
        Hint = 
          '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
          #13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-door-closed"></i>'
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 1
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnSaidaClick
      end
      object btnEditReg: TUniBitBtn
        AlignWithMargins = True
        Left = 5
        Top = 10
        Width = 33
        Height = 32
        Hint = 
          '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
          #13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-pencil-alt"></i>'
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 2
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnEditRegClick
      end
      object btnsalvar: TUniBitBtn
        AlignWithMargins = True
        Left = 43
        Top = 10
        Width = 33
        Height = 32
        Hint = 
          '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-pencil-alt | '#13#10'cls-ico:font-black' +
          #13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Enabled = False
        Caption = '<i class="fas fa-save"></i>'
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 3
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnsalvarClick
      end
    end
  end
end
