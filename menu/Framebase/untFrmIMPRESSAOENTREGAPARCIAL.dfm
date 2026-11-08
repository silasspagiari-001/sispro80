object FrmIMPRESSAOENTREGAPARCIAL: TFrmIMPRESSAOENTREGAPARCIAL
  Left = 0
  Top = 0
  ClientHeight = 333
  ClientWidth = 547
  Caption = 'Impress'#227'o de Entrega Parcial'
  OnShow = UniFormShow
  OnResize = UniFormResize
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnDestroy = UniFormDestroy
  TextHeight = 15
  object rcBlock10: TUniContainerPanel
    Left = 0
    Top = 288
    Width = 547
    Height = 45
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 0
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
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 547
    Height = 288
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 1
    ExplicitTop = 8
    object UniDBGridEntrega: TUniDBGrid
      Left = 0
      Top = 0
      Width = 547
      Height = 288
      Hint = ''
      DataSource = dm_rc.dsrelacaoentrega
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
          FieldName = 'impressao'
          Title.Caption = ' '
          Width = 30
          Font.Color = clBlack
          Font.Name = 'Calibri'
          Alignment = taCenter
        end
        item
          FieldName = 'EMISSAO'
          Title.Caption = 'DATA DA ENTREGA'
          Width = 100
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end
        item
          FieldName = 'NUMERO'
          Title.Caption = 'NUMERO'
          Width = 80
          Font.Color = clBlack
          Font.Name = 'Calibri'
        end>
    end
  end
end
