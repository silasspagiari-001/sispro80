object FrmSUBPLANOCONTAS: TFrmSUBPLANOCONTAS
  Left = 0
  Top = 0
  Hint = '[[modal:]]'
  ClientHeight = 343
  ClientWidth = 557
  Caption = 'Sub Plano de Contas'
  OnShow = UniFormShow
  OnResize = UniFormResize
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object rcBlock10: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 557
    Height = 241
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alTop
    TabOrder = 0
    object UniDBGridEntrega: TUniDBGrid
      Left = 0
      Top = 0
      Width = 557
      Height = 241
      Hint = ''
      DataSource = dm_rc.dssubplanocontas
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
          FieldName = 'CODIGO'
          Title.Caption = 'CODIGO'
          Width = 74
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'SEQUENCIA'
          Title.Caption = 'SEQ.'
          Width = 74
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'DESCRICAO'
          Title.Caption = 'DESCRICAO'
          Width = 400
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
  object rcBlock20: TUniContainerPanel
    Left = 0
    Top = 241
    Width = 557
    Height = 48
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alTop
    TabOrder = 1
    DesignSize = (
      557
      48)
    object UniLabel1: TUniLabel
      AlignWithMargins = True
      Left = 3
      Top = 1
      Width = 174
      Height = 16
      Hint = ''
      Margins.Left = 10
      Margins.Top = 15
      AutoSize = False
      Caption = 'Descri'#231#227'o do SubGrupo'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
    end
    object UniContainerPanel5: TUniContainerPanel
      Left = 497
      Top = 0
      Width = 55
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 2
      object UniBitBtn12: TUniBitBtn
        AlignWithMargins = True
        Left = 11
        Top = 14
        Width = 33
        Height = 32
        Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fa-save | '#13#10'cls-ico:font-black|'#13#10']]'
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
        ScreenMask.Target = Owner
        OnClick = UniBitBtn12Click
      end
    end
    object edSearchCRUDconteudo: TUniEdit
      AlignWithMargins = True
      Left = 3
      Top = 18
      Width = 493
      Height = 29
      Hint = ''
      Margins.Right = 5
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      ClearButton = True
    end
  end
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 295
    Width = 557
    Height = 48
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 2
    object UniContainerPanel3: TUniContainerPanel
      Left = 404
      Top = 5
      Width = 148
      Height = 38
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 0
      DesignSize = (
        148
        38)
      object btnfechar: TUniBitBtn
        Left = 17
        Top = 7
        Width = 117
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
        ScreenMask.Target = Owner
        OnClick = btnfecharClick
      end
    end
  end
end
