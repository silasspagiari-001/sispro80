object frmProtocoloopcoes: TfrmProtocoloopcoes
  Left = 0
  Top = 0
  ClientHeight = 289
  ClientWidth = 731
  Caption = 'Op'#231#245'es do Protocolo'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object rcBlock10: TUniContainerPanel
    Tag = 1
    Left = 8
    Top = 8
    Width = 150
    Height = 62
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 0
    DesignSize = (
      150
      62)
    object UniSpeedButton1: TUniSpeedButton
      Left = 7
      Top = 8
      Width = 140
      Height = 51
      Hint = ''
      Caption = 'Emiss'#227'o Boletim'
      Anchors = [akLeft, akTop, akRight]
      ParentColor = False
      Images = dm_rc.UniNativeImageList32x32
      ImageIndex = 57
      TabOrder = 1
      OnClick = UniSpeedButton1Click
    end
  end
  object rcBlock20: TUniContainerPanel
    Tag = 1
    Left = 201
    Top = 8
    Width = 150
    Height = 62
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 1
    DesignSize = (
      150
      62)
    object UniSpeedButton2: TUniSpeedButton
      Left = 3
      Top = 8
      Width = 140
      Height = 51
      Hint = ''
      Caption = 'Ficha de Analise'
      Anchors = [akLeft, akTop, akRight]
      ParentColor = False
      Images = dm_rc.UniNativeImageList32x32
      ImageIndex = 85
      TabOrder = 1
      OnClick = UniSpeedButton2Click
    end
  end
  object rcBlock30: TUniContainerPanel
    Tag = 1
    Left = 387
    Top = 8
    Width = 150
    Height = 62
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 2
    DesignSize = (
      150
      62)
    object UniSpeedButton3: TUniSpeedButton
      Left = 3
      Top = 8
      Width = 140
      Height = 51
      Hint = ''
      Caption = 'Informativo'
      Anchors = [akLeft, akTop, akRight]
      ParentColor = False
      Images = dm_rc.UniNativeImageList32x32
      ImageIndex = 59
      TabOrder = 1
      OnClick = UniSpeedButton3Click
    end
  end
  object rcBlock40: TUniContainerPanel
    Tag = 1
    Left = 578
    Top = 8
    Width = 150
    Height = 62
    Hint = '[[cols:xs-12 sm-12 md-3]]'
    ParentColor = False
    TabOrder = 3
    DesignSize = (
      150
      62)
    object UniSpeedButton4: TUniSpeedButton
      Left = 7
      Top = 8
      Width = 140
      Height = 51
      Hint = ''
      Caption = 'Germina'#231#227'o'
      Anchors = [akLeft, akTop, akRight]
      ParentColor = False
      Images = dm_rc.UniNativeImageList32x32
      ImageIndex = 107
      TabOrder = 1
      OnClick = UniSpeedButton4Click
    end
  end
  object rcBlock50: TUniContainerPanel
    Left = 0
    Top = 248
    Width = 731
    Height = 41
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alBottom
    TabOrder = 4
    object btnLkpClear: TUniBitBtn
      Left = 633
      Top = 7
      Width = 95
      Height = 29
      Hint = '[[cls:ButtonThemeCrud]]'
      Margins.Top = 28
      Margins.Bottom = 12
      Caption = 'Fechar'
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      OnClick = btnLkpClearClick
    end
  end
  object UniPopupMenuBOLETIM: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 31
    Top = 94
    object B4: TUniMenuItem
      Caption = 'Boletim 1'#186'  CLIENTE'
      ImageIndex = 94
      OnClick = B4Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object B5: TUniMenuItem
      Caption = 'Boletim 2'#186' LAS'
      ImageIndex = 94
      OnClick = B5Click
    end
    object N4: TUniMenuItem
      Caption = '-'
    end
    object b6: TUniMenuItem
      Caption = 'Boletim 3'#186' LASO'
      ImageIndex = 94
      OnClick = b6Click
    end
    object N5: TUniMenuItem
      Caption = '-'
    end
    object b7: TUniMenuItem
      Caption = 'Boletim 4'#186' Adicional'
      ImageIndex = 94
      OnClick = b7Click
    end
  end
  object UniPopupMenuFICHAANALISE: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 208
    Top = 96
    object f1: TUniMenuItem
      Caption = 'Impress'#227'o Ficha de Analise'
      ImageIndex = 101
      OnClick = f1Click
    end
  end
  object UniPopupMenuINFORMATIVO: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 384
    Top = 104
    object UniMenuItem1: TUniMenuItem
      Caption = 'Impress'#227'o INFORMATIVO - (I.R.)'
      ImageIndex = 109
      OnClick = UniMenuItem1Click
    end
  end
  object UniPopupMenuGERMINACAO: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 584
    Top = 104
    object UniMenuItem4: TUniMenuItem
      Caption = 'Impress'#227'o GERMINA'#199#195'O'
      ImageIndex = 134
    end
  end
end
