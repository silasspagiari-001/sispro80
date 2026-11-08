object frmSEMENTEBAS: TfrmSEMENTEBAS
  Left = 0
  Top = 0
  ClientHeight = 410
  ClientWidth = 713
  Caption = 'Dados dos BAS'
  OnShow = UniFormShow
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object paBaseButtons: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 37
    Height = 410
    Hint = ''
    Margins.Left = 4
    Margins.Top = 2
    Margins.Right = 6
    ParentColor = False
    Color = clWhite
    Align = alLeft
    AlignmentControl = uniAlignmentClient
    ParentAlignmentControl = False
    AutoScroll = True
    TabOrder = 0
    ScrollHeight = 410
    ScrollWidth = 37
    object paOF: TUniContainerPanel
      AlignWithMargins = True
      Left = 0
      Top = 243
      Width = 37
      Height = 89
      Hint = ''
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 0
      Margins.Bottom = 0
      ParentColor = False
      Align = alTop
      TabOrder = 3
      object btnCloseForm: TUniBitBtn
        AlignWithMargins = True
        Left = 2
        Top = 56
        Width = 33
        Height = 32
        Hint = 
          '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-sign-out-alt rc-mirror-h | '#13#10'cls' +
          '-ico:font-black'#13#10']]'
        Margins.Left = 2
        Margins.Top = 20
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-sign-out-alt"></i>'
        Align = alTop
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 2
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnCloseFormClick
      end
      object btnOptions: TUniBitBtn
        AlignWithMargins = True
        Left = 2
        Top = 2
        Width = 33
        Height = 32
        Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-cog | '#13#10'cls-ico:font-black'#13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-broadcast-tower"></i>'
        Align = alTop
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 1
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
      end
    end
    object paNAE: TUniContainerPanel
      AlignWithMargins = True
      Left = 0
      Top = 20
      Width = 37
      Height = 110
      Hint = ''
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 0
      Margins.Bottom = 0
      ParentColor = False
      Align = alTop
      TabOrder = 1
      object btnNewReg: TUniBitBtn
        AlignWithMargins = True
        Left = 2
        Top = 2
        Width = 33
        Height = 32
        Hint = '[['#13#10'cls:ButtonWhite |'#13#10'ico:fas-plus | '#13#10'cls-ico:font-black'#13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-plus"></i>'
        Align = alTop
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 1
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnNewRegClick
      end
      object btnEditReg: TUniBitBtn
        AlignWithMargins = True
        Left = 2
        Top = 38
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
        Align = alTop
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 2
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnEditRegClick
      end
      object btnDeleteReg: TUniBitBtn
        AlignWithMargins = True
        Left = 2
        Top = 74
        Width = 33
        Height = 32
        Hint = 
          '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-trash-alt | '#13#10'cls-ico:font-black' +
          #13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 0
        Caption = '<i class="fas fa-trash-alt"></i>'
        Align = alTop
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 3
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnDeleteRegClick
      end
    end
    object paGC: TUniContainerPanel
      AlignWithMargins = True
      Left = 0
      Top = 150
      Width = 37
      Height = 73
      Hint = ''
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 0
      Margins.Bottom = 0
      ParentColor = False
      Align = alTop
      TabOrder = 2
      object btnSaveReg: TUniBitBtn
        AlignWithMargins = True
        Left = 2
        Top = 2
        Width = 33
        Height = 32
        Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-save | '#13#10'cls-ico:font-black'#13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-save"></i>'
        Align = alTop
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 1
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnSaveRegClick
      end
      object btnCancelReg: TUniBitBtn
        AlignWithMargins = True
        Left = 2
        Top = 38
        Width = 33
        Height = 32
        Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fa-ban | '#13#10'cls-ico:font-black'#13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-ban"></i>'
        Align = alTop
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 2
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnCancelRegClick
      end
    end
  end
  object UniContainerPanel1: TUniContainerPanel
    Left = 37
    Top = 0
    Width = 676
    Height = 410
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 1
    object UniPageControl: TUniPageControl
      Left = 0
      Top = 0
      Width = 676
      Height = 410
      Hint = ''
      ActivePage = UniTabSheetdadosbas
      Align = alClient
      TabOrder = 1
      object UniTabSheetdadosbas: TUniTabSheet
        Hint = ''
        Caption = 'Dados do Bas'
        object RCprin: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 668
          Height = 382
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 0
          object RC1: TUniContainerPanel
            Left = 0
            Top = 0
            Width = 97
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 1
            DesignSize = (
              97
              48)
            object edCodigo: TUniDBEdit
              Left = 1
              Top = 18
              Width = 93
              Height = 29
              Hint = ''
              DataField = 'CODIGO'
              DataSource = dscrud
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clWhite
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold]
              TabOrder = 1
              Color = clGray
              ReadOnly = True
            end
            object UniLabel3: TUniLabel
              Left = 0
              Top = 0
              Width = 38
              Height = 15
              Hint = ''
              Caption = 'C'#243'digo'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock20: TUniContainerPanel
            Left = 1
            Top = 53
            Width = 664
            Height = 28
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            Color = clSkyBlue
            TabOrder = 23
            object UniLabel18: TUniLabel
              AlignWithMargins = True
              Left = 2
              Top = 4
              Width = 251
              Height = 19
              Hint = '[[cols:12 | round:all]]'
              Margins.Left = 6
              Margins.Top = 6
              Margins.Right = 6
              Margins.Bottom = 6
              AutoSize = False
              Caption = 'DADOS DA GERMINA'#199#195'O'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -15
              Font.Name = 'Calibri'
              TabOrder = 1
            end
          end
          object RC5: TUniContainerPanel
            Left = 1
            Top = 85
            Width = 130
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 5
            DesignSize = (
              130
              48)
            object UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit
              AlignWithMargins = True
              Left = 0
              Top = 17
              Width = 127
              Height = 29
              Hint = ''
              DataField = 'GERMINACAO'
              DataSource = dscrud
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold, fsItalic]
              TabOrder = 1
              DecimalPrecision = 0
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel1: TUniLabel
              Left = 0
              Top = 0
              Width = 67
              Height = 15
              Hint = ''
              Caption = 'Germina'#231#227'o'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object RC6: TUniContainerPanel
            Tag = 1
            Left = 134
            Top = 85
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2]]'
            ParentColor = False
            TabOrder = 6
            DesignSize = (
              150
              48)
            object UniDBDateTimePicker1: TUniDBDateTimePicker
              AlignWithMargins = True
              Left = 3
              Top = 16
              Width = 145
              Height = 29
              Hint = ''
              DataField = 'GERMINACAO_DATAFINAL'
              DataSource = dscrud
              DateTime = 44561.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object UniLabel4: TUniLabel
              Left = 0
              Top = 0
              Width = 145
              Height = 15
              Hint = ''
              Caption = 'Conclus'#227'o da Germina'#231#227'o'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object RC7: TUniContainerPanel
            Left = 1
            Top = 136
            Width = 130
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 7
            DesignSize = (
              130
              48)
            object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
              AlignWithMargins = True
              Left = 0
              Top = 17
              Width = 127
              Height = 29
              Hint = ''
              DataField = 'GERMINACAO_PN'
              DataSource = dscrud
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold, fsItalic]
              TabOrder = 1
              DecimalPrecision = 0
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel2: TUniLabel
              Left = 0
              Top = 0
              Width = 103
              Height = 15
              Hint = ''
              Caption = 'Pl'#226'ntulas Normais'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object RC8: TUniContainerPanel
            Left = 134
            Top = 136
            Width = 130
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 8
            DesignSize = (
              130
              48)
            object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
              AlignWithMargins = True
              Left = 0
              Top = 17
              Width = 127
              Height = 29
              Hint = ''
              DataField = 'GERMINACAO_AN'
              DataSource = dscrud
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold, fsItalic]
              TabOrder = 1
              DecimalPrecision = 0
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel5: TUniLabel
              Left = 0
              Top = 0
              Width = 109
              Height = 15
              Hint = ''
              Caption = 'Pl'#226'ntulas Anormais'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object RC9: TUniContainerPanel
            Left = 267
            Top = 136
            Width = 130
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 9
            DesignSize = (
              130
              48)
            object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
              AlignWithMargins = True
              Left = 0
              Top = 17
              Width = 127
              Height = 29
              Hint = ''
              DataField = 'GERMINACAO_SDUR'
              DataSource = dscrud
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold, fsItalic]
              TabOrder = 1
              DecimalPrecision = 0
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel6: TUniLabel
              Left = 0
              Top = 0
              Width = 87
              Height = 15
              Hint = ''
              Caption = 'Sementes Duras'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object RC10: TUniContainerPanel
            Left = 401
            Top = 136
            Width = 130
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 10
            DesignSize = (
              130
              48)
            object UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit
              AlignWithMargins = True
              Left = 0
              Top = 17
              Width = 127
              Height = 29
              Hint = ''
              DataField = 'GERMINACAO_SDOR'
              DataSource = dscrud
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold, fsItalic]
              TabOrder = 1
              DecimalPrecision = 0
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel7: TUniLabel
              Left = 0
              Top = 0
              Width = 113
              Height = 15
              Hint = ''
              Caption = 'Sementes Dormentes'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object RC11: TUniContainerPanel
            Left = 535
            Top = 136
            Width = 130
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 11
            DesignSize = (
              130
              48)
            object UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit
              AlignWithMargins = True
              Left = 0
              Top = 17
              Width = 127
              Height = 29
              Hint = ''
              DataField = 'GERMINACAO_MORTAS'
              DataSource = dscrud
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold, fsItalic]
              TabOrder = 1
              DecimalPrecision = 0
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel8: TUniLabel
              Left = 0
              Top = 0
              Width = 94
              Height = 15
              Hint = ''
              Caption = 'Sementes Mortas'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object UniContainerPanel9: TUniContainerPanel
            Left = 2
            Top = 188
            Width = 664
            Height = 28
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            Color = clSkyBlue
            TabOrder = 24
            object UniLabel9: TUniLabel
              AlignWithMargins = True
              Left = 1
              Top = 4
              Width = 251
              Height = 19
              Hint = '[[cols:12 | round:all]]'
              Margins.Left = 6
              Margins.Top = 6
              Margins.Right = 6
              Margins.Bottom = 6
              AutoSize = False
              Caption = 'PUREZA'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -15
              Font.Name = 'Calibri'
              TabOrder = 1
            end
          end
          object RC12: TUniContainerPanel
            Left = 1
            Top = 220
            Width = 100
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 12
            DesignSize = (
              100
              48)
            object UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit
              AlignWithMargins = True
              Left = 0
              Top = 17
              Width = 97
              Height = 29
              Hint = ''
              DataField = 'PUREZA'
              DataSource = dscrud
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold, fsItalic]
              TabOrder = 1
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel10: TUniLabel
              Left = 0
              Top = 0
              Width = 37
              Height = 15
              Hint = ''
              Caption = 'Pureza'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object RC15: TUniContainerPanel
            Left = 299
            Top = 222
            Width = 100
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 15
            DesignSize = (
              100
              48)
            object UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit
              AlignWithMargins = True
              Left = 0
              Top = 17
              Width = 97
              Height = 29
              Hint = ''
              DataField = 'PMS'
              DataSource = dscrud
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold, fsItalic]
              TabOrder = 1
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel11: TUniLabel
              Left = 0
              Top = 0
              Width = 31
              Height = 15
              Hint = ''
              Caption = 'P.M.S.'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object RC16: TUniContainerPanel
            Left = 401
            Top = 222
            Width = 130
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 16
            DesignSize = (
              130
              48)
            object UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit
              AlignWithMargins = True
              Left = 0
              Top = 17
              Width = 127
              Height = 29
              Hint = ''
              DataField = 'VE'
              DataSource = dscrud
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold, fsItalic]
              TabOrder = 1
              DecimalPrecision = 0
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel12: TUniLabel
              Left = 0
              Top = 0
              Width = 18
              Height = 15
              Hint = ''
              Caption = 'V.E.'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object RC17: TUniContainerPanel
            Left = 535
            Top = 222
            Width = 130
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 17
            DesignSize = (
              130
              48)
            object UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit
              AlignWithMargins = True
              Left = 0
              Top = 17
              Width = 127
              Height = 29
              Hint = ''
              DataField = 'VIABILIDADE'
              DataSource = dscrud
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold, fsItalic]
              TabOrder = 1
              DecimalPrecision = 0
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel13: TUniLabel
              Left = 0
              Top = 0
              Width = 64
              Height = 15
              Hint = ''
              Caption = 'Viabilidade'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object RC13: TUniContainerPanel
            Left = 103
            Top = 221
            Width = 100
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 13
            DesignSize = (
              100
              48)
            object UniDBFormattedNumberEdit10: TUniDBFormattedNumberEdit
              AlignWithMargins = True
              Left = 0
              Top = 17
              Width = 97
              Height = 29
              Hint = ''
              DataField = 'INERTE'
              DataSource = dscrud
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold, fsItalic]
              TabOrder = 1
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel14: TUniLabel
              Left = 0
              Top = 0
              Width = 32
              Height = 15
              Hint = ''
              Caption = 'Inerte'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object RC14: TUniContainerPanel
            Left = 205
            Top = 221
            Width = 91
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 14
            DesignSize = (
              91
              48)
            object UniDBFormattedNumberEdit11: TUniDBFormattedNumberEdit
              AlignWithMargins = True
              Left = 0
              Top = 17
              Width = 88
              Height = 29
              Hint = ''
              DataField = 'OUTS'
              DataSource = dscrud
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold, fsItalic]
              TabOrder = 1
              DecimalPrecision = 0
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel15: TUniLabel
              Left = 0
              Top = 0
              Width = 92
              Height = 15
              Hint = ''
              Caption = 'Outras Sementes'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object UniContainerPanel16: TUniContainerPanel
            Left = 1
            Top = 309
            Width = 160
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 18
            DesignSize = (
              160
              48)
            object UniDBFormattedNumberEdit12: TUniDBFormattedNumberEdit
              AlignWithMargins = True
              Left = 0
              Top = 17
              Width = 157
              Height = 29
              Hint = ''
              DataField = 'OSN_OEC'
              DataSource = dscrud
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold, fsItalic]
              TabOrder = 1
              DecimalPrecision = 0
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel16: TUniLabel
              Left = 0
              Top = 0
              Width = 149
              Height = 15
              Hint = ''
              Caption = 'Outras Esp'#233'cies Cultivadas'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object UniContainerPanel17: TUniContainerPanel
            Left = 167
            Top = 309
            Width = 162
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 19
            DesignSize = (
              162
              48)
            object UniDBFormattedNumberEdit13: TUniDBFormattedNumberEdit
              AlignWithMargins = True
              Left = 0
              Top = 17
              Width = 159
              Height = 29
              Hint = ''
              DataField = 'OSN_SS'
              DataSource = dscrud
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold, fsItalic]
              TabOrder = 1
              DecimalPrecision = 0
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel17: TUniLabel
              Left = 0
              Top = 0
              Width = 107
              Height = 15
              Hint = ''
              Caption = 'Sementes Silvestres'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object UniContainerPanel18: TUniContainerPanel
            Left = 334
            Top = 309
            Width = 162
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 20
            DesignSize = (
              162
              48)
            object UniDBFormattedNumberEdit14: TUniDBFormattedNumberEdit
              AlignWithMargins = True
              Left = 0
              Top = 17
              Width = 159
              Height = 29
              Hint = ''
              DataField = 'OSN_TO'
              DataSource = dscrud
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold, fsItalic]
              TabOrder = 1
              DecimalPrecision = 0
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel19: TUniLabel
              Left = 0
              Top = 0
              Width = 54
              Height = 15
              Hint = ''
              Caption = 'Toleradas'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object UniContainerPanel19: TUniContainerPanel
            Left = 500
            Top = 309
            Width = 162
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 21
            DesignSize = (
              162
              48)
            object UniDBFormattedNumberEdit15: TUniDBFormattedNumberEdit
              AlignWithMargins = True
              Left = 0
              Top = 17
              Width = 159
              Height = 29
              Hint = ''
              DataField = 'OSN_PR'
              DataSource = dscrud
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clBlue
              Font.Height = -13
              Font.Name = 'Calibri'
              Font.Style = [fsBold, fsItalic]
              TabOrder = 1
              DecimalPrecision = 0
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
            object UniLabel20: TUniLabel
              Left = 0
              Top = 0
              Width = 54
              Height = 15
              Hint = ''
              Caption = 'Proibidas'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object UniContainerPanel20: TUniContainerPanel
            Left = 1
            Top = 273
            Width = 664
            Height = 28
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            Color = clSkyBlue
            TabOrder = 22
            object UniLabel21: TUniLabel
              AlignWithMargins = True
              Left = 1
              Top = 4
              Width = 251
              Height = 19
              Hint = '[[cols:12 | round:all]]'
              Margins.Left = 6
              Margins.Top = 6
              Margins.Right = 6
              Margins.Bottom = 6
              AutoSize = False
              Caption = 'OUTRAS SEMENTES POR NUMERO'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -15
              Font.Name = 'Calibri'
              TabOrder = 1
            end
          end
          object RC2: TUniContainerPanel
            Tag = 1
            Left = 100
            Top = 0
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2]]'
            ParentColor = False
            TabOrder = 2
            DesignSize = (
              150
              48)
            object UniDBDateTimePicker2: TUniDBDateTimePicker
              AlignWithMargins = True
              Left = 3
              Top = 18
              Width = 145
              Height = 29
              Hint = ''
              DataField = 'EMISSAO'
              DataSource = dscrud
              DateTime = 44561.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object UniLabel22: TUniLabel
              Left = 0
              Top = 0
              Width = 72
              Height = 15
              Hint = ''
              Caption = 'Data Sistema'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object RC3: TUniContainerPanel
            Left = 253
            Top = 0
            Width = 259
            Height = 48
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            TabOrder = 3
            DesignSize = (
              259
              48)
            object UniDBEdit12: TUniDBEdit
              Left = 2
              Top = 18
              Width = 254
              Height = 29
              Hint = ''
              DataField = 'AMOSTRA'
              DataSource = dscrud
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object UniLabel24: TUniLabel
              Left = 0
              Top = 0
              Width = 52
              Height = 15
              Hint = ''
              Caption = 'Amostras'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object RC4: TUniContainerPanel
            Tag = 1
            Left = 515
            Top = 0
            Width = 150
            Height = 48
            Hint = '[[cols:xs-12 sm-12 md-2]]'
            ParentColor = False
            TabOrder = 4
            DesignSize = (
              150
              48)
            object UniDBDateTimePicker3: TUniDBDateTimePicker
              AlignWithMargins = True
              Left = 3
              Top = 18
              Width = 145
              Height = 29
              Hint = ''
              DataField = 'RECEBIMENTO_DATA'
              DataSource = dscrud
              DateTime = 44561.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object UniLabel23: TUniLabel
              Left = 0
              Top = 0
              Width = 115
              Height = 15
              Hint = ''
              Caption = 'Data de Recebimento'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
        end
      end
      object UniTabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'Observa'#231#227'o'
        object UniContainerPanel23: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 668
          Height = 382
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 0
          object UniDBMemoobs: TUniDBMemo
            AlignWithMargins = True
            Left = 3
            Top = 44
            Width = 662
            Height = 313
            Hint = ''
            DataField = 'OBSERVACOES'
            DataSource = dscrud
            TabOrder = 1
            Color = clInfoBk
          end
          object UniContainerPanel4: TUniContainerPanel
            Left = 4
            Top = 10
            Width = 664
            Height = 28
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            Color = clSkyBlue
            TabOrder = 2
            object UniLabel25: TUniLabel
              AlignWithMargins = True
              Left = 4
              Top = 3
              Width = 251
              Height = 19
              Hint = '[[cols:12 | round:all]]'
              Margins.Left = 6
              Margins.Top = 6
              Margins.Right = 6
              Margins.Bottom = 6
              AutoSize = False
              Caption = 'OBSERVA'#199#195'O'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -15
              Font.Name = 'Calibri'
              TabOrder = 1
            end
          end
        end
      end
      object UniTabSheetinfestantes: TUniTabSheet
        Hint = ''
        Caption = 'Infestantes'
        object UniContainerPanel24: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 668
          Height = 382
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 0
          object UniDBMemo1: TUniDBMemo
            AlignWithMargins = True
            Left = 3
            Top = 38
            Width = 662
            Height = 170
            Hint = ''
            DataField = 'OBS_NOCIVAS'
            DataSource = dscrud
            TabOrder = 1
            Color = clInfoBk
          end
          object UniDBMemo2: TUniDBMemo
            AlignWithMargins = True
            Left = 3
            Top = 258
            Width = 662
            Height = 100
            Hint = ''
            DataField = 'OBS_MATERIALINERTE'
            DataSource = dscrud
            TabOrder = 2
            Color = clInfoBk
          end
          object UniContainerPanel2: TUniContainerPanel
            Left = 3
            Top = 219
            Width = 664
            Height = 28
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            Color = clSkyBlue
            TabOrder = 3
            object UniLabel27: TUniLabel
              AlignWithMargins = True
              Left = 4
              Top = 4
              Width = 251
              Height = 19
              Hint = '[[cols:12 | round:all]]'
              Margins.Left = 6
              Margins.Top = 6
              Margins.Right = 6
              Margins.Bottom = 6
              AutoSize = False
              Caption = 'MATERIAL INERTE'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -15
              Font.Name = 'Calibri'
              TabOrder = 1
            end
          end
          object UniContainerPanel3: TUniContainerPanel
            Left = 3
            Top = 2
            Width = 664
            Height = 28
            Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
            ParentColor = False
            Color = clSkyBlue
            TabOrder = 4
            object UniLabel26: TUniLabel
              AlignWithMargins = True
              Left = 4
              Top = 3
              Width = 251
              Height = 19
              Hint = '[[cols:12 | round:all]]'
              Margins.Left = 6
              Margins.Top = 6
              Margins.Right = 6
              Margins.Bottom = 6
              AutoSize = False
              Caption = 'DESCRI'#199#195'O DA INFESTANTE'
              ParentFont = False
              Font.Color = clGray
              Font.Height = -15
              Font.Name = 'Calibri'
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  object FDQryFiltro: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'SELECT * FROM SEMENTES_BAS')
    Left = 575
    Top = 374
  end
  object dsfiltro: TDataSource
    AutoEdit = False
    DataSet = FDQryFiltro
    Left = 607
    Top = 375
  end
  object dscrud: TDataSource
    AutoEdit = False
    DataSet = FDQryCad
    Left = 639
    Top = 374
  end
  object FDQryCad: TFDQuery
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    UpdateOptions.UpdateTableName = 'SEMENTES_BAS'
    SQL.Strings = (
      'SELECT * FROM SEMENTES_BAS WHERE CODIGO = :CODIGO')
    Left = 671
    Top = 374
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
