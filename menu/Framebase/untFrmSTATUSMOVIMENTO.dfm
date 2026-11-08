object frmSTATUSMOVIMENTO: TfrmSTATUSMOVIMENTO
  Left = 0
  Top = 0
  ClientHeight = 333
  ClientWidth = 547
  Caption = 'Status Movimento'
  OnShow = UniFormShow
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 547
    Height = 333
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    object rcBlock10: TUniContainerPanel
      Left = 0
      Top = 285
      Width = 547
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alBottom
      TabOrder = 1
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
          Top = 6
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
      Top = 230
      Width = 547
      Height = 55
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alBottom
      TabOrder = 2
      object rcBlock40: TUniContainerPanel
        Tag = 1
        Left = 1
        Top = 3
        Width = 208
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 1
        object cbxstatus: TUniComboBox
          Left = 0
          Top = 19
          Width = 205
          Height = 29
          Hint = ''
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            ''
            'Andamento'
            'Aguardando'
            'Finalizado'
            'N'#227'o Concluida')
          ItemIndex = 0
          TabOrder = 1
          IconItems = <>
        end
        object UniLabel1: TUniLabel
          AlignWithMargins = True
          Left = 0
          Top = 2
          Width = 34
          Height = 15
          Hint = ''
          Margins.Top = 1
          Margins.Bottom = 2
          Caption = 'Status'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock50: TUniContainerPanel
        Tag = 1
        Left = 225
        Top = 3
        Width = 168
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 2
        object edSearchCRUDDfechamento: TUniDateTimePicker
          AlignWithMargins = True
          Left = 0
          Top = 19
          Width = 163
          Height = 29
          Hint = ''
          Margins.Right = 5
          DateTime = 43232.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
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
        object UniLabelDtIni: TUniLabel
          AlignWithMargins = True
          Left = 0
          Top = 2
          Width = 95
          Height = 15
          Hint = ''
          Margins.Top = 1
          Margins.Bottom = 2
          Caption = 'Data Fechamento'
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 2
        end
      end
      object rcBlock60: TUniContainerPanel
        Tag = 1
        Left = 428
        Top = 3
        Width = 61
        Height = 48
        Hint = '[[cols:xs-12 sm-12 md-4]]'
        ParentColor = False
        TabOrder = 3
        DesignSize = (
          61
          48)
        object UniBitBtn2: TUniBitBtn
          Left = 1
          Top = 19
          Width = 58
          Height = 29
          Hint = '[[cls:ButtonThemeCrud]]'
          Margins.Top = 28
          Margins.Bottom = 12
          Caption = '<i class="fas fa-save"></i>'
          Anchors = [akLeft, akRight, akBottom]
          ParentFont = False
          Font.Height = -13
          Font.Name = 'Calibri'
          TabOrder = 1
          OnClick = UniBitBtn2Click
        end
      end
    end
    object rcBlock30: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 547
      Height = 230
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alClient
      TabOrder = 3
      object UniLabel2: TUniLabel
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 81
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'Observa'#231#227'o ...:'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 1
      end
      object UniMemoobs: TUniMemo
        Left = 3
        Top = 25
        Width = 541
        Height = 199
        Hint = ''
        Color = clInfoBk
        TabOrder = 2
        ClientEvents.ExtEvents.Strings = (
          
            'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' sender.body' +
            'El.dom.addEventListener('#13#10'        '#39'keydown'#39', '#13#10'        function(' +
            'e) {if (e.key=='#39'Enter'#39') {e.stopPropagation()}}'#13#10'    );'#13#10'}')
      end
    end
  end
end
