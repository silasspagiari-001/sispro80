object frmFICHAANALISTA: TfrmFICHAANALISTA
  Left = 0
  Top = 0
  ClientHeight = 393
  ClientWidth = 734
  Hint = '[['#13#10'modal:'#13#10']]'
  Caption = 'Ficha de Analise'
  OnShow = UniFormShow
  OnResize = UniFormResize
  OldCreateOrder = False
  BorderStyle = bsSingle
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  OnReady = UniFormReady
  OnCreate = UniFormCreate
  OnBeforeShow = UniFormBeforeShow
  OnDestroy = UniFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object paBaseButtons: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 37
    Height = 393
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
    ScrollHeight = 393
    ScrollWidth = 37
    object paOF: TUniContainerPanel
      AlignWithMargins = True
      Left = 0
      Top = 294
      Width = 37
      Height = 59
      Hint = ''
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 0
      Margins.Bottom = 0
      ParentColor = False
      Align = alTop
      TabOrder = 4
      object btnCloseForm: TUniBitBtn
        AlignWithMargins = True
        Left = 2
        Top = 20
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
        TabOrder = 1
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnCloseFormClick
      end
    end
    object paP: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 37
      Height = 39
      Hint = ''
      Margins.Top = 6
      ParentColor = False
      Align = alTop
      TabOrder = 0
    end
    object paNAE: TUniContainerPanel
      AlignWithMargins = True
      Left = 0
      Top = 59
      Width = 37
      Height = 78
      Hint = ''
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 0
      Margins.Bottom = 0
      ParentColor = False
      Align = alTop
      TabOrder = 2
      object btnEditReg: TUniBitBtn
        AlignWithMargins = True
        Left = 2
        Top = 2
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
        TabOrder = 1
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnEditRegClick
      end
      object btnDeleteReg: TUniBitBtn
        AlignWithMargins = True
        Left = 2
        Top = 38
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
        TabOrder = 2
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnDeleteRegClick
      end
    end
    object paGC: TUniContainerPanel
      AlignWithMargins = True
      Left = 0
      Top = 157
      Width = 37
      Height = 117
      Hint = ''
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 0
      Margins.Bottom = 0
      ParentColor = False
      Align = alTop
      TabOrder = 3
      object btnSaveReg: TUniBitBtn
        AlignWithMargins = True
        Left = 2
        Top = 38
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
        Top = 2
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
      object btnOptions: TUniBitBtn
        AlignWithMargins = True
        Left = 2
        Top = 74
        Width = 33
        Height = 32
        Hint = '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-cog | '#13#10'cls-ico:font-black'#13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-print"></i>'
        Align = alTop
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 3
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnOptionsClick
      end
    end
  end
  object UniPageControl: TUniPageControl
    Left = 37
    Top = 0
    Width = 697
    Height = 393
    Hint = ''
    ActivePage = UniTabSheetFICHA
    Align = alClient
    TabOrder = 1
    object UniTabSheetFICHA: TUniTabSheet
      Hint = ''
      Caption = 'Analise'
      object UniContainerPanel1: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 689
        Height = 365
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 0
        object rcBlock10: TUniContainerPanel
          Left = 2
          Top = 2
          Width = 181
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 1
          DesignSize = (
            181
            48)
          object UniEditlote: TUniEdit
            AlignWithMargins = True
            Left = 2
            Top = 17
            Width = 179
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
            Left = 2
            Top = 1
            Width = 22
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Lote'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object UniContainerPanel2: TUniContainerPanel
          Left = 184
          Top = 2
          Width = 167
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 2
          DesignSize = (
            167
            48)
          object UniLabel2: TUniLabel
            AlignWithMargins = True
            Left = 1
            Top = 1
            Width = 41
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Boletim'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniDBEdit2: TUniDBEdit
            Left = 3
            Top = 17
            Width = 162
            Height = 29
            Hint = ''
            DataField = 'BOLETIM'
            DataSource = dscrud
            CharCase = ecUpperCase
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
          end
        end
        object UniContainerPanel3: TUniContainerPanel
          Left = 352
          Top = 2
          Width = 111
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 3
          DesignSize = (
            111
            48)
          object UniLabel3: TUniLabel
            AlignWithMargins = True
            Left = 1
            Top = 1
            Width = 49
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = '% Pureza'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit
            AlignWithMargins = True
            Left = 1
            Top = 17
            Width = 109
            Height = 29
            Hint = ''
            DataField = 'PU_ANALISE'
            DataSource = dscrud
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold, fsItalic]
            TabOrder = 2
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
        end
        object UniContainerPanel4: TUniContainerPanel
          Left = 464
          Top = 2
          Width = 111
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 4
          DesignSize = (
            111
            48)
          object UniLabel4: TUniLabel
            AlignWithMargins = True
            Left = 1
            Top = 1
            Width = 79
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = '% Germina'#231#227'o'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
            AlignWithMargins = True
            Left = 2
            Top = 17
            Width = 109
            Height = 29
            Hint = ''
            DataField = 'GE_ANALISE'
            DataSource = dscrud
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold, fsItalic]
            TabOrder = 2
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
        end
        object UniContainerPanel5: TUniContainerPanel
          Left = 576
          Top = 2
          Width = 111
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 5
          DesignSize = (
            111
            48)
          object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
            AlignWithMargins = True
            Left = 0
            Top = 17
            Width = 111
            Height = 29
            Hint = ''
            DataField = 'VC_ANALISE'
            DataSource = dscrud
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
          object UniLabel5: TUniLabel
            AlignWithMargins = True
            Left = 0
            Top = 1
            Width = 31
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = '% V.C.'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object UniContainerPanel6: TUniContainerPanel
          Left = 2
          Top = 53
          Width = 181
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 6
          DesignSize = (
            181
            48)
          object UniLabel6: TUniLabel
            Left = 2
            Top = 0
            Width = 85
            Height = 15
            Hint = ''
            Caption = 'Data Analisada'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniDBDateTimePicker1: TUniDBDateTimePicker
            AlignWithMargins = True
            Left = 2
            Top = 16
            Width = 179
            Height = 29
            Hint = ''
            DataField = 'DATA_ANALISE'
            DataSource = dscrud
            DateTime = 44561.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            ClientEvents.ExtEvents.Strings = (
              
                'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
                '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
                '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
                ':"  /  /   "});'#13#10'}')
          end
        end
        object UniContainerPanel7: TUniContainerPanel
          Left = 2
          Top = 104
          Width = 151
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 7
          DesignSize = (
            151
            48)
          object UniLabel14: TUniLabel
            Left = 0
            Top = 0
            Width = 56
            Height = 15
            Hint = ''
            Caption = 'Analista 1'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object edLkpFUNCIONARIOS__I: TUniDBEdit
            Tag = 1
            AlignWithMargins = True
            Left = 2
            Top = 18
            Width = 149
            Height = 29
            Hint = 
              '[['#13#10'NOME ANALISTA_I @60 ! +modal searchall |'#13#10'lkpfilter-empty:S' +
              'elecione um Funcionario<translate>|'#13#10'valid:blank'#13#10']]'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            ReadOnly = True
            InputType = 'text'
            Color = clInfoBk
            OnExit = edLkpFUNCIONARIOS__IExit
          end
        end
        object UniContainerPanel8: TUniContainerPanel
          Left = 156
          Top = 104
          Width = 130
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 8
          DesignSize = (
            130
            48)
          object UniLabel8: TUniLabel
            AlignWithMargins = True
            Left = 1
            Top = 0
            Width = 68
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Peso Inicia I'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit
            AlignWithMargins = True
            Left = 1
            Top = 18
            Width = 129
            Height = 29
            Hint = ''
            DataField = 'PESO_INI_I'
            DataSource = dscrud
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold, fsItalic]
            TabOrder = 2
            DecimalPrecision = 3
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
        end
        object UniContainerPanel9: TUniContainerPanel
          Left = 289
          Top = 104
          Width = 130
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 9
          DesignSize = (
            130
            48)
          object UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit
            AlignWithMargins = True
            Left = 1
            Top = 18
            Width = 129
            Height = 29
            Hint = ''
            DataField = 'PESO_FIN_I'
            DataSource = dscrud
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold, fsItalic]
            TabOrder = 1
            DecimalPrecision = 3
            DecimalSeparator = ','
            ThousandSeparator = '.'
            OnExit = UniDBFormattedNumberEdit5Exit
          end
          object UniLabel9: TUniLabel
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 64
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Peso Final I'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object UniContainerPanel10: TUniContainerPanel
          Left = 422
          Top = 104
          Width = 167
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 10
          DesignSize = (
            167
            48)
          object UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit
            AlignWithMargins = True
            Left = 1
            Top = 18
            Width = 166
            Height = 29
            Hint = ''
            DataField = 'PESO_MEDIA_I'
            DataSource = dscrud
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold, fsItalic]
            TabOrder = 1
            Color = clMedGray
            ReadOnly = True
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel10: TUniLabel
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 42
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'M'#233'dia I'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object UniContainerPanel11: TUniContainerPanel
          Left = 2
          Top = 155
          Width = 151
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 11
          DesignSize = (
            151
            48)
          object edLkpFUNCIONARIOS__II: TUniDBEdit
            Tag = 1
            AlignWithMargins = True
            Left = 2
            Top = 18
            Width = 149
            Height = 29
            Hint = 
              '[['#13#10'NOME ANALISTA_II @60 ! +modal searchall |'#13#10'lkpfilter-empty:S' +
              'elecione um Funcionario<translate>|'#13#10'valid:blank'#13#10']]'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            ReadOnly = True
            InputType = 'text'
            Color = clInfoBk
            OnExit = edLkpFUNCIONARIOS__IIExit
          end
          object UniLabel11: TUniLabel
            Left = 0
            Top = 0
            Width = 56
            Height = 15
            Hint = ''
            Caption = 'Analista 2'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object UniContainerPanel12: TUniContainerPanel
          Left = 156
          Top = 155
          Width = 130
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 12
          DesignSize = (
            130
            48)
          object UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit
            AlignWithMargins = True
            Left = 1
            Top = 18
            Width = 129
            Height = 29
            Hint = ''
            DataField = 'PESO_INI_II'
            DataSource = dscrud
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold, fsItalic]
            TabOrder = 1
            DecimalPrecision = 3
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel12: TUniLabel
            AlignWithMargins = True
            Left = 1
            Top = 0
            Width = 72
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Peso Inicia II'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object UniContainerPanel13: TUniContainerPanel
          Left = 289
          Top = 155
          Width = 130
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 13
          DesignSize = (
            130
            48)
          object UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit
            AlignWithMargins = True
            Left = 1
            Top = 18
            Width = 129
            Height = 29
            Hint = ''
            DataField = 'PESO_FIN_II'
            DataSource = dscrud
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold, fsItalic]
            TabOrder = 1
            DecimalPrecision = 3
            DecimalSeparator = ','
            ThousandSeparator = '.'
            OnExit = UniDBFormattedNumberEdit8Exit
          end
          object UniLabel13: TUniLabel
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 68
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Peso Final II'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object UniContainerPanel14: TUniContainerPanel
          Left = 422
          Top = 155
          Width = 167
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 14
          DesignSize = (
            167
            48)
          object UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit
            AlignWithMargins = True
            Left = 1
            Top = 18
            Width = 166
            Height = 29
            Hint = ''
            DataField = 'PESO_MEDIA_II'
            DataSource = dscrud
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold, fsItalic]
            TabOrder = 1
            Color = clMedGray
            ReadOnly = True
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel15: TUniLabel
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 46
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'M'#233'dia II'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object UniContainerPanel15: TUniContainerPanel
          Left = 2
          Top = 207
          Width = 151
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 15
          DesignSize = (
            151
            48)
          object edLkpFUNCIONARIOS__III: TUniDBEdit
            Tag = 1
            AlignWithMargins = True
            Left = 2
            Top = 17
            Width = 149
            Height = 29
            Hint = 
              '[['#13#10'NOME ANALISTA_III @60 ! +modal searchall |'#13#10'lkpfilter-empty:S' +
              'elecione um Funcionario<translate>|'#13#10'valid:blank'#13#10']]'
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            ReadOnly = True
            InputType = 'text'
            Color = clInfoBk
            OnExit = edLkpFUNCIONARIOS__IIIExit
          end
          object UniLabel16: TUniLabel
            Left = 0
            Top = 0
            Width = 56
            Height = 15
            Hint = ''
            Caption = 'Analista 3'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object UniContainerPanel16: TUniContainerPanel
          Left = 156
          Top = 207
          Width = 130
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 16
          DesignSize = (
            130
            48)
          object UniDBFormattedNumberEdit10: TUniDBFormattedNumberEdit
            AlignWithMargins = True
            Left = 1
            Top = 17
            Width = 129
            Height = 29
            Hint = ''
            DataField = 'PESO_INI_III'
            DataSource = dscrud
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold, fsItalic]
            TabOrder = 1
            DecimalPrecision = 3
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel17: TUniLabel
            AlignWithMargins = True
            Left = 1
            Top = 0
            Width = 76
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Peso Inicia III'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object UniContainerPanel17: TUniContainerPanel
          Left = 289
          Top = 207
          Width = 130
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 17
          DesignSize = (
            130
            48)
          object UniDBFormattedNumberEdit11: TUniDBFormattedNumberEdit
            AlignWithMargins = True
            Left = 1
            Top = 17
            Width = 129
            Height = 29
            Hint = ''
            DataField = 'PESO_FIN_III'
            DataSource = dscrud
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold, fsItalic]
            TabOrder = 1
            DecimalPrecision = 3
            DecimalSeparator = ','
            ThousandSeparator = '.'
            OnExit = UniDBFormattedNumberEdit11Exit
          end
          object UniLabel18: TUniLabel
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 72
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Peso Final III'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object UniContainerPanel18: TUniContainerPanel
          Left = 422
          Top = 207
          Width = 167
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 18
          DesignSize = (
            167
            48)
          object UniDBFormattedNumberEdit12: TUniDBFormattedNumberEdit
            AlignWithMargins = True
            Left = 1
            Top = 17
            Width = 166
            Height = 29
            Hint = ''
            DataField = 'PESO_MEDIA_III'
            DataSource = dscrud
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold, fsItalic]
            TabOrder = 1
            Color = clMedGray
            ReadOnly = True
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel19: TUniLabel
            AlignWithMargins = True
            Left = 0
            Top = 0
            Width = 50
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'M'#233'dia III'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object UniContainerPanel19: TUniContainerPanel
          Left = 591
          Top = 155
          Width = 95
          Height = 52
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 19
          DesignSize = (
            95
            52)
          object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
            AlignWithMargins = True
            Left = 1
            Top = 18
            Width = 94
            Height = 31
            Hint = ''
            DataField = 'MEDIA_GERAL'
            DataSource = dscrud
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clBlue
            Font.Height = -24
            Font.Name = 'Calibri'
            Font.Style = [fsBold, fsItalic]
            TabOrder = 1
            Color = clInactiveCaption
            ReadOnly = True
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
          object UniLabel7: TUniLabel
            AlignWithMargins = True
            Left = 1
            Top = 1
            Width = 68
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'M'#233'dia Geral'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 2
          end
        end
        object UniContainerPanel20: TUniContainerPanel
          Left = 2
          Top = 258
          Width = 685
          Height = 61
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 20
          object UniDBMemoobs: TUniDBMemo
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 679
            Height = 55
            Hint = ''
            DataField = 'OBSERVACAO'
            DataSource = dscrud
            Align = alClient
            TabOrder = 1
            ClientEvents.ExtEvents.Strings = (
              
                'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' sender.body' +
                'El.dom.addEventListener('#13#10'        '#39'keydown'#39', '#13#10'        function(' +
                'e) {if (e.key=='#39'Enter'#39') {e.stopPropagation()}}'#13#10'    ); '#13#10'}')
          end
        end
        object rcBlock20: TUniContainerPanel
          Left = 0
          Top = 335
          Width = 689
          Height = 30
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          Align = alBottom
          TabOrder = 21
          object UniDBCheckBox1: TUniDBCheckBox
            Left = 5
            Top = 6
            Width = 76
            Height = 17
            Hint = ''
            DataField = 'PU'
            DataSource = dscrud
            ValueChecked = 'T'
            ValueUnchecked = 'F'
            Caption = 'PU'
            TabOrder = 1
            ParentColor = False
            Color = clBtnFace
          end
          object UniDBCheckBox2: TUniDBCheckBox
            Left = 93
            Top = 6
            Width = 84
            Height = 17
            Hint = ''
            DataField = 'TZ'
            DataSource = dscrud
            ValueChecked = 'T'
            ValueUnchecked = 'F'
            Caption = 'TZ'
            TabOrder = 2
            ParentColor = False
            Color = clBtnFace
          end
          object UniDBCheckBox3: TUniDBCheckBox
            Left = 180
            Top = 6
            Width = 84
            Height = 17
            Hint = ''
            DataField = 'GE'
            DataSource = dscrud
            ValueChecked = 'T'
            ValueUnchecked = 'F'
            Caption = 'GE'
            TabOrder = 3
            ParentColor = False
            Color = clBtnFace
          end
          object UniDBCheckBox4: TUniDBCheckBox
            Left = 267
            Top = 6
            Width = 84
            Height = 17
            Hint = ''
            DataField = 'OS'
            DataSource = dscrud
            ValueChecked = 'T'
            ValueUnchecked = 'F'
            Caption = 'OS'
            TabOrder = 4
            ParentColor = False
            Color = clBtnFace
          end
        end
        object UniContainerPanel21: TUniContainerPanel
          Left = 184
          Top = 53
          Width = 167
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 22
          DesignSize = (
            167
            48)
          object UniLabel20: TUniLabel
            AlignWithMargins = True
            Left = 1
            Top = 0
            Width = 26
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Peso'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniDBFormattedNumberEdit13: TUniDBFormattedNumberEdit
            AlignWithMargins = True
            Left = 1
            Top = 16
            Width = 166
            Height = 29
            Hint = ''
            DataField = 'PESO'
            DataSource = dscrud
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Font.Color = clBlue
            Font.Height = -13
            Font.Name = 'Calibri'
            Font.Style = [fsBold, fsItalic]
            TabOrder = 2
            DecimalPrecision = 3
            DecimalSeparator = ','
            ThousandSeparator = '.'
          end
        end
        object UniContainerPanel22: TUniContainerPanel
          Left = 353
          Top = 53
          Width = 172
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 23
          DesignSize = (
            172
            48)
          object UniLabel21: TUniLabel
            AlignWithMargins = True
            Left = 1
            Top = 0
            Width = 42
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Sacaria'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniDBEdit1: TUniDBEdit
            Left = 2
            Top = 16
            Width = 167
            Height = 29
            Hint = ''
            DataField = 'SACARIA'
            DataSource = dscrud
            CharCase = ecUpperCase
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            ExplicitWidth = 162
          end
        end
        object UniContainerPanel23: TUniContainerPanel
          Left = 527
          Top = 53
          Width = 162
          Height = 48
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          TabOrder = 24
          DesignSize = (
            162
            48)
          object UniLabel22: TUniLabel
            AlignWithMargins = True
            Left = 1
            Top = 0
            Width = 40
            Height = 15
            Hint = ''
            Margins.Top = 1
            Margins.Bottom = 2
            Caption = 'Origem'
            ParentFont = False
            Font.Height = -13
            Font.Name = 'Calibri'
            TabOrder = 1
          end
          object UniDBEdit3: TUniDBEdit
            Left = 2
            Top = 16
            Width = 157
            Height = 29
            Hint = ''
            DataField = 'ORIGEM'
            DataSource = dscrud
            CharCase = ecUpperCase
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            ExplicitWidth = 155
          end
        end
      end
    end
  end
  object UniPopupMenuImpressao: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 695
    Top = 358
    object EntregadosItenss1: TUniMenuItem
      Caption = 'Impress'#227'o da Ficha de Semente'
      ImageIndex = 61
      OnClick = EntregadosItenss1Click
    end
    object N13: TUniMenuItem
      Caption = '-'
    end
  end
  object dsfiltro: TDataSource
    AutoEdit = False
    DataSet = FDQryFiltro
    Left = 666
    Top = 358
  end
  object FDQryFiltro: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'SELECT * FROM SEMENTES_ANALISTA')
    Left = 634
    Top = 358
  end
  object dscrud: TDataSource
    AutoEdit = False
    DataSet = FDQryCad
    Left = 602
    Top = 358
  end
  object FDQryCad: TFDQuery
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    UpdateOptions.UpdateTableName = 'SEMENTES_ANALISTA'
    SQL.Strings = (
      'SELECT * FROM SEMENTES_ANALISTA WHERE CODIGO = :CODIGO')
    Left = 570
    Top = 358
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
