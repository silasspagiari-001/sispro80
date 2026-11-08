object frmTELAMOVIMENTOBOLETOS: TfrmTELAMOVIMENTOBOLETOS
  Left = 0
  Top = 0
  ClientHeight = 343
  ClientWidth = 541
  Caption = 'Emiss'#227'o de Boletos'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = []
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnDestroy = UniFormDestroy
  TextHeight = 15
  object rcBlock10: TUniContainerPanel
    Left = 0
    Top = 298
    Width = 541
    Height = 45
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 0
    ExplicitWidth = 557
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
    Left = 0
    Top = 242
    Width = 541
    Height = 56
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 1
    ExplicitWidth = 557
    object paSearchField1: TUniContainerPanel
      AlignWithMargins = True
      Left = 3
      Top = 1
      Width = 102
      Height = 60
      Hint = ''
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        102
        60)
      object UniLabelc1: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 1
        Width = 40
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Bancos'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniButtonEditpbancos: TUniButtonEdit
        AlignWithMargins = True
        Left = 2
        Top = 23
        Width = 99
        Height = 29
        Hint = ''
        Text = '0'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 2
        OnExit = UniButtonEditpbancosExit
        OnButtonClick = UniButtonEditpbancosButtonClick
        IconCls = 'search'
      end
    end
    object paSearchOp1: TUniContainerPanel
      AlignWithMargins = True
      Left = 106
      Top = 1
      Width = 335
      Height = 55
      Hint = ''
      Margins.Left = 0
      Margins.Top = 8
      Margins.Bottom = 0
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        335
        55)
      object UniEditdescricaobanco: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 23
        Width = 330
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
        ReadOnly = True
      end
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 92
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Descri'#231#227'o Banco'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel5: TUniContainerPanel
      Left = 443
      Top = 3
      Width = 55
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 3
      object btngerar: TUniBitBtn
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
        Caption = '<i class="fas fa-cogs"></i>'
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 1
        ScaleButton = False
        ScreenMask.Target = Owner
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btngerarClick
      end
    end
    object UniContainerPanel1: TUniContainerPanel
      Left = 500
      Top = 3
      Width = 55
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 4
      object btnimprimir: TUniBitBtn
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
        Enabled = False
        Caption = '<i class="fas fa-file-pdf"></i>'
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 1
        ScaleButton = False
        ScreenMask.Target = Owner
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnimprimirClick
      end
    end
  end
  object rcBlock30: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 541
    Height = 242
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 557
    object UniDBGridEntrega: TUniDBGrid
      Left = 0
      Top = 0
      Width = 541
      Height = 242
      Hint = ''
      DataSource = dm_rc.dsboletos
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
      OnDblClick = UniDBGridEntregaDblClick
      Columns = <
        item
          FieldName = 'NUMERO'
          Title.Caption = 'NUMERO'
          Width = 74
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'SERIE'
          Title.Caption = 'SERIE'
          Width = 60
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'NOME'
          Title.Caption = 'NOME'
          Width = 230
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'VENCIMENTO'
          Title.Caption = 'VENCIMENTO'
          Width = 90
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'VALOR'
          Title.Caption = 'VALOR'
          Width = 74
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end>
    end
  end
end
