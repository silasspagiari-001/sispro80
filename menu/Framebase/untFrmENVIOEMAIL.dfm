object FrmENVIOEMAIL: TFrmENVIOEMAIL
  Left = 0
  Top = 0
  ClientHeight = 333
  ClientWidth = 547
  Caption = 'Envio de Email/Nota'
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
    Top = 0
    Width = 547
    Height = 45
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alTop
    TabOrder = 0
    object UniContainerPanel1: TUniContainerPanel
      Left = 2
      Top = 5
      Width = 113
      Height = 38
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 1
      DesignSize = (
        113
        38)
      object ubtnenvio: TUniBitBtn
        Left = 3
        Top = 3
        Width = 107
        Height = 29
        Hint = '[[cls:ButtonThemeCrud]]'
        Margins.Top = 28
        Margins.Bottom = 12
        Caption = '<i class="fas fa-paper-plane">  Enviar</i>'
        Anchors = [akLeft, akRight, akBottom]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
        ScreenMask.Target = Owner
        OnClick = ubtnenvioClick
      end
    end
    object UniContainerPanel2: TUniContainerPanel
      Left = 117
      Top = 5
      Width = 113
      Height = 38
      Hint = '[[cols:xs-12 sm-12 md-6]]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        113
        38)
      object ubtnsair: TUniBitBtn
        Left = 3
        Top = 3
        Width = 107
        Height = 29
        Hint = '[[cls:ButtonThemeCrud]]'
        Margins.Top = 28
        Margins.Bottom = 12
        Caption = '<i class="fas fa-times-circle">  Sair</i>'
        Anchors = [akLeft, akRight, akBottom]
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
        OnClick = ubtnsairClick
      end
    end
  end
  object rcBlock20: TUniContainerPanel
    Left = 0
    Top = 45
    Width = 547
    Height = 48
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alTop
    TabOrder = 1
    object paSearchFilterDtIni: TUniContainerPanel
      AlignWithMargins = True
      Left = 2
      Top = -12
      Width = 118
      Height = 60
      Hint = ''
      Margins.Top = 0
      Margins.Bottom = 0
      ParentColor = False
      TabOrder = 1
      object edSearchCRUDDtIni: TUniDateTimePicker
        AlignWithMargins = True
        Left = 0
        Top = 28
        Width = 113
        Height = 29
        Hint = ''
        Margins.Right = 5
        DateTime = 43232.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        ReadOnly = True
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
      object UniLabel1: TUniLabel
        AlignWithMargins = True
        Left = 0
        Top = 11
        Width = 46
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Emiss'#227'o'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel3: TUniContainerPanel
      AlignWithMargins = True
      Left = 122
      Top = -1
      Width = 108
      Height = 46
      Hint = ''
      Margins.Left = 0
      Margins.Top = 8
      Margins.Bottom = 0
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        108
        46)
      object UniFormattedNumberEditcBASEICMS: TUniFormattedNumberEdit
        Left = 1
        Top = 17
        Width = 104
        Height = 29
        Hint = ''
        Alignment = taRightJustify
        ParentFont = False
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel2: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 0
        Width = 74
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Vlr Base Icms'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel4: TUniContainerPanel
      AlignWithMargins = True
      Left = 231
      Top = -1
      Width = 108
      Height = 46
      Hint = ''
      Margins.Left = 0
      Margins.Top = 8
      Margins.Bottom = 0
      ParentColor = False
      TabOrder = 3
      DesignSize = (
        108
        46)
      object UniFormattedNumberEditVLRICMS: TUniFormattedNumberEdit
        Left = 1
        Top = 17
        Width = 104
        Height = 29
        Hint = ''
        Alignment = taRightJustify
        ParentFont = False
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel3: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 0
        Width = 45
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Vlr Icms'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
    object UniContainerPanel5: TUniContainerPanel
      AlignWithMargins = True
      Left = 340
      Top = -1
      Width = 207
      Height = 46
      Hint = ''
      Margins.Left = 0
      Margins.Top = 8
      Margins.Bottom = 0
      ParentColor = False
      TabOrder = 4
      DesignSize = (
        207
        46)
      object UniFormattedNumberEditVLRTOTAL: TUniFormattedNumberEdit
        Left = 1
        Top = 17
        Width = 203
        Height = 29
        Hint = ''
        Alignment = taRightJustify
        ParentFont = False
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Calibri'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        ReadOnly = True
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel4: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 0
        Width = 46
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Vlr Total'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 2
      end
    end
  end
  object rcBlock30: TUniContainerPanel
    Left = 0
    Top = 93
    Width = 547
    Height = 48
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alTop
    TabOrder = 2
    DesignSize = (
      547
      48)
    object UniEditdemail: TUniEdit
      AlignWithMargins = True
      Left = 3
      Top = 17
      Width = 541
      Height = 29
      Hint = ''
      Margins.Right = 5
      CharCase = ecLowerCase
      Text = ''
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
    end
    object UniLabel5: TUniLabel
      AlignWithMargins = True
      Left = 3
      Top = 1
      Width = 108
      Height = 15
      Hint = ''
      Margins.Top = 1
      Margins.Bottom = 2
      Caption = 'Email para envio ... '
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 2
    end
  end
  object rcBlock40: TUniContainerPanel
    Left = 0
    Top = 141
    Width = 547
    Height = 192
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alClient
    TabOrder = 3
    object UniMemorespostaTXT: TUniMemo
      Left = 0
      Top = 25
      Width = 547
      Height = 167
      Hint = ''
      ParentFont = False
      Font.Color = clRed
      Font.Height = -13
      Font.Style = [fsBold]
      Align = alClient
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 1
    end
    object rcBlock50: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 547
      Height = 25
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alTop
      TabOrder = 2
      object UniLabel6: TUniLabel
        AlignWithMargins = True
        Left = 3
        Top = 4
        Width = 221
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Resposta do Servidor referente ao envio'
        ParentFont = False
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        TabOrder = 1
      end
    end
  end
end
