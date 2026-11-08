object frmTERMOCOLETA: TfrmTERMOCOLETA
  Left = 0
  Top = 0
  ClientHeight = 333
  ClientWidth = 547
  Caption = 'Termo de Coleta'
  OnShow = UniFormShow
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
    Height = 333
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alClient
    TabOrder = 0
    object UniContainerPanel1: TUniContainerPanel
      Left = 0
      Top = 288
      Width = 547
      Height = 45
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
      Left = 2
      Top = 2
      Width = 151
      Height = 48
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      TabOrder = 2
      DesignSize = (
        151
        48)
      object Ubtngeratseqtermo: TUniButton
        Left = 2
        Top = 17
        Width = 30
        Height = 29
        Hint = ''
        Caption = '<i class="fas fa-user-cog"></i>'
        TabOrder = 1
        OnClick = UbtngeratseqtermoClick
      end
      object UniEdittermocoleta: TUniEdit
        AlignWithMargins = True
        Left = 34
        Top = 17
        Width = 114
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
      object UniLabel6: TUniLabel
        AlignWithMargins = True
        Left = 34
        Top = 1
        Width = 66
        Height = 15
        Hint = ''
        Margins.Top = 1
        Margins.Bottom = 2
        Caption = 'N'#186' do Termo'
        ParentFont = False
        Font.Height = -13
        Font.Name = 'Calibri'
        TabOrder = 3
      end
    end
    object rcBlock30: TUniContainerPanel
      Tag = 1
      Left = 0
      Top = 54
      Width = 153
      Height = 99
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 3
      object uchcertificador: TUniCheckBox
        Left = 3
        Top = 4
        Width = 97
        Height = 17
        Hint = ''
        Caption = 'CERTIFICADOR'
        TabOrder = 1
      end
      object uchprodutor: TUniCheckBox
        Left = 3
        Top = 35
        Width = 97
        Height = 17
        Hint = ''
        Caption = 'PRODUTOR'
        TabOrder = 2
      end
      object uchreembalador: TUniCheckBox
        Left = 3
        Top = 66
        Width = 97
        Height = 17
        Hint = ''
        Caption = 'REEMBALADOR'
        TabOrder = 3
      end
    end
    object UniContainerPanel2: TUniContainerPanel
      Tag = 1
      Left = 158
      Top = 54
      Width = 153
      Height = 99
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 4
      object uchpureza: TUniCheckBox
        Left = 3
        Top = 4
        Width = 97
        Height = 17
        Hint = ''
        Caption = 'PUREZA'
        TabOrder = 1
      end
      object uchgerminacao: TUniCheckBox
        Left = 3
        Top = 27
        Width = 97
        Height = 17
        Hint = ''
        Caption = 'GERMINA'#199#195'O'
        TabOrder = 2
      end
      object uchviabilidade: TUniCheckBox
        Left = 3
        Top = 50
        Width = 97
        Height = 17
        Hint = ''
        Caption = 'VIABILIDADE'
        TabOrder = 3
      end
      object uchpercpeneira: TUniCheckBox
        Left = 3
        Top = 74
        Width = 147
        Height = 17
        Hint = ''
        Caption = 'PERC % RET. PENEIRA'
        TabOrder = 4
      end
    end
    object UniContainerPanel4: TUniContainerPanel
      Tag = 1
      Left = 316
      Top = 54
      Width = 230
      Height = 99
      Hint = '[[cols:xs-12 sm-12 md-4]]'
      ParentColor = False
      TabOrder = 5
      object uchpms: TUniCheckBox
        Left = 3
        Top = 4
        Width = 97
        Height = 17
        Hint = ''
        Caption = 'PMS'
        TabOrder = 1
      end
      object uchgerenveprecoce: TUniCheckBox
        Left = 3
        Top = 27
        Width = 224
        Height = 17
        Hint = ''
        Caption = 'GERMINA'#199#195'O P/ ENVELHECIMENTO'
        TabOrder = 2
      end
      object uchnocivas: TUniCheckBox
        Left = 3
        Top = 50
        Width = 224
        Height = 17
        Hint = ''
        Caption = 'NOCIVAS'
        TabOrder = 3
      end
    end
    object rcBlock550: TUniContainerPanel
      Left = 0
      Top = 247
      Width = 547
      Height = 41
      Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
      ParentColor = False
      Align = alBottom
      TabOrder = 6
      object ubtnEXCLUI: TUniBitBtn
        AlignWithMargins = True
        Left = 77
        Top = 4
        Width = 33
        Height = 32
        Hint = '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-trash | '#13#10'cls-ico:font-black'#13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-trash-alt"></i>'
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 1
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = ubtnEXCLUIClick
      end
      object ubtnINCLUI: TUniBitBtn
        AlignWithMargins = True
        Left = 3
        Top = 4
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
        OnClick = ubtnINCLUIClick
      end
      object ubtnGRAVA: TUniBitBtn
        AlignWithMargins = True
        Left = 40
        Top = 4
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
        TabOrder = 3
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = UniBitBtn5Click
      end
    end
  end
end
