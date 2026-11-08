object frmFICHA: TfrmFICHA
  Left = 0
  Top = 0
  Hint = '[['#13#10'modal:'#13#10']]'
  ClientHeight = 390
  ClientWidth = 720
  Caption = 'FICHA T'#201'CNICA DE CONTROLE DE ESTOQUE'
  OnShow = UniFormShow
  OnResize = UniFormResize
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  OnReady = UniFormReady
  OnBeforeShow = UniFormBeforeShow
  OnCreate = UniFormCreate
  OnDestroy = UniFormDestroy
  TextHeight = 15
  object rcBlock10: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 720
    Height = 390
    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 37
    ExplicitWidth = 697
    ExplicitHeight = 393
    object UniPageControl: TUniPageControl
      Left = 0
      Top = 45
      Width = 720
      Height = 345
      Hint = ''
      ActivePage = UniTabSheetFICHA
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 3
      ExplicitTop = 62
      ExplicitWidth = 719
      ExplicitHeight = 552
      object UniTabSheetFICHA: TUniTabSheet
        Hint = ''
        Caption = 'Ficha de Estoque'
        ExplicitWidth = 689
        ExplicitHeight = 365
        object rcBlock2: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 712
          Height = 317
          Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
          ParentColor = False
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 705
          ExplicitHeight = 331
          object rcBlock20: TUniContainerPanel
            Tag = 1
            Left = 0
            Top = 0
            Width = 113
            Height = 48
            Hint = '[[ | cols-grid:20| cols:xs-20 sm-20 md-4| ]]'
            ParentColor = False
            TabOrder = 1
            DesignSize = (
              113
              48)
            object edCodigo: TUniDBEdit
              Left = 1
              Top = 18
              Width = 109
              Height = 29
              Hint = ''
              DataField = 'MESTRE_LOTE'
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
              Width = 42
              Height = 15
              Hint = ''
              Caption = 'N'#186' LOTE'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock30: TUniContainerPanel
            Tag = 1
            Left = 115
            Top = 0
            Width = 134
            Height = 48
            Hint = '[[ | cols-grid:20| cols:xs-20 sm-20 md-4| ]]'
            ParentColor = False
            TabOrder = 2
            DesignSize = (
              134
              48)
            object UniDBDateTimePicker2: TUniDBDateTimePicker
              AlignWithMargins = True
              Left = 5
              Top = 18
              Width = 126
              Height = 29
              Hint = ''
              DataField = 'DATAENTRADA'
              DataSource = dscrud
              DateTime = 44554.000000000000000000
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              ClientEvents.ExtEvents.Strings = (
                
                  'afterrender=function afterrender(sender, eOpts)'#13#10'{'#13#10' /* Mascara ' +
                  '"99/99/9999" para campo Data e cont'#233'udo vazio qdo n'#227'o tem data *' +
                  '/'#13#10' $("#"+sender.inputEl.id).inputmask("99/99/9999",{placeholder' +
                  ':"  /  /   "});'#13#10'}')
            end
            object UniLabel14: TUniLabel
              Left = 5
              Top = 0
              Width = 72
              Height = 15
              Hint = ''
              Caption = 'Data Entrada'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 2
            end
          end
          object rcBlock40: TUniContainerPanel
            Tag = 1
            Left = 251
            Top = 0
            Width = 110
            Height = 48
            Hint = '[[ | cols-grid:20| cols:xs-20 sm-20 md-4| ]]'
            ParentColor = False
            TabOrder = 3
            DesignSize = (
              110
              48)
            object UniLabel2: TUniLabel
              Left = 2
              Top = 0
              Width = 73
              Height = 15
              Hint = ''
              Caption = 'Hora Entrada'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBDateTimePicker1: TUniDBDateTimePicker
              Left = 2
              Top = 18
              Width = 106
              Height = 29
              Hint = ''
              DataField = 'HORAENTRADA'
              DataSource = dscrud
              DateTime = 0.733541666666666600
              DateFormat = 'dd/MM/yyyy'
              TimeFormat = 'HH:mm:ss'
              Kind = tUniTime
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              DateMode = dtmDateTime
            end
          end
          object rcBlock50: TUniContainerPanel
            Tag = 1
            Left = 363
            Top = 0
            Width = 94
            Height = 48
            Hint = '[[ | cols-grid:20| cols:xs-20 sm-20 md-4| ]]'
            ParentColor = False
            TabOrder = 4
            DesignSize = (
              94
              48)
            object UniLabel8: TUniLabel
              Left = 0
              Top = 0
              Width = 62
              Height = 15
              Hint = ''
              Caption = 'Fornecedor'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object edLkpPESSOAS: TUniDBEdit
              Tag = 1
              Left = 1
              Top = 18
              Width = 92
              Height = 29
              Hint = 
                '[['#13#10'NOME PESSOA @60 ! +modal searchall |'#13#10'lkpfilter-empty:Seleci' +
                'one uma Pessoa<translate>|'#13#10'valid:blank'#13#10']]'
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              Color = clInfoBk
              ReadOnly = True
              InputType = 'text'
              OnExit = edLkpPESSOASExit
            end
          end
          object rcBlock60: TUniContainerPanel
            Tag = 1
            Left = 458
            Top = 0
            Width = 231
            Height = 48
            Hint = '[[ | cols-grid:20| cols:xs-20 sm-20 md-4| ]]'
            ParentColor = False
            TabOrder = 5
            DesignSize = (
              231
              48)
            object UniLabel9: TUniLabel
              Left = 0
              Top = 0
              Width = 113
              Height = 15
              Hint = ''
              Caption = 'Nome do Fornecedor'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBEdit19: TUniDBEdit
              Left = 2
              Top = 18
              Width = 226
              Height = 29
              Hint = ''
              DataField = 'NOME_PESSOA'
              DataSource = dscrud
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              ReadOnly = True
            end
          end
          object rcBlock70: TUniContainerPanel
            Tag = 1
            Left = 0
            Top = 50
            Width = 177
            Height = 48
            Hint = '[[ | cols-grid:16| cols:xs-16 sm-16 md-4| ]]'
            ParentColor = False
            TabOrder = 6
            DesignSize = (
              177
              48)
            object UniLabel4: TUniLabel
              Left = 0
              Top = 0
              Width = 24
              Height = 15
              Hint = ''
              Caption = 'Tipo'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBComboBox1: TUniDBComboBox
              Tag = 1
              Left = 1
              Top = 16
              Width = 173
              Height = 29
              Hint = ''
              Anchors = [akLeft, akTop, akRight]
              DataField = 'TIPO'
              DataSource = dscrud
              Style = csDropDownList
              Items.Strings = (
                'REEMBALADOR'
                'TRANS. PRODUCAO')
              TabOrder = 2
              IconItems = <>
            end
          end
          object rcBlock80: TUniContainerPanel
            Tag = 1
            Left = 179
            Top = 50
            Width = 134
            Height = 48
            Hint = '[[ | cols-grid:16| cols:xs-16 sm-16 md-3| ]]'
            ParentColor = False
            TabOrder = 7
            DesignSize = (
              134
              48)
            object UniLabel5: TUniLabel
              Left = 0
              Top = 0
              Width = 97
              Height = 15
              Hint = ''
              Caption = 'Termo/Certificado'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBEdit1: TUniDBEdit
              Left = 0
              Top = 16
              Width = 131
              Height = 29
              Hint = ''
              DataField = 'TERMO'
              DataSource = dscrud
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock90: TUniContainerPanel
            Tag = 1
            Left = 315
            Top = 50
            Width = 110
            Height = 48
            Hint = '[[ | cols-grid:16| cols:xs-16 sm-16 md-3| ]]'
            ParentColor = False
            TabOrder = 8
            DesignSize = (
              110
              48)
            object UniLabel6: TUniLabel
              Left = 2
              Top = 0
              Width = 82
              Height = 15
              Hint = ''
              Caption = 'Boletim/Transf.'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBEdit2: TUniDBEdit
              Left = 2
              Top = 16
              Width = 106
              Height = 29
              Hint = ''
              DataField = 'BOLETIM'
              DataSource = dscrud
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock100: TUniContainerPanel
            Tag = 1
            Left = 427
            Top = 50
            Width = 150
            Height = 48
            Hint = '[[ | cols-grid:16| cols:xs-16 sm-16 md-3| ]]'
            ParentColor = False
            TabOrder = 9
            DesignSize = (
              150
              48)
            object UniLabel7: TUniLabel
              Left = 0
              Top = 0
              Width = 22
              Height = 15
              Hint = ''
              Caption = 'Lote'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBEdit3: TUniDBEdit
              Left = 2
              Top = 16
              Width = 145
              Height = 29
              Hint = ''
              DataField = 'LOTE'
              DataSource = dscrud
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock110: TUniContainerPanel
            Tag = 1
            Left = 578
            Top = 50
            Width = 111
            Height = 48
            Hint = '[[ | cols-grid:16| cols:xs-16 sm-16 md-3| ]]'
            ParentColor = False
            TabOrder = 10
            DesignSize = (
              111
              48)
            object UniLabel10: TUniLabel
              Left = 0
              Top = 0
              Width = 62
              Height = 15
              Hint = ''
              Caption = 'Nota Fiscal'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBEdit4: TUniDBEdit
              Left = 2
              Top = 16
              Width = 106
              Height = 29
              Hint = ''
              DataField = 'NOTAFISCAL'
              DataSource = dscrud
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock130: TUniContainerPanel
            Tag = 1
            Left = 178
            Top = 100
            Width = 151
            Height = 48
            Hint = '[[ | cols-grid:20| cols:xs-20 sm-20 md-4| ]]'
            ParentColor = False
            TabOrder = 11
            DesignSize = (
              151
              48)
            object UniLabel12: TUniLabel
              Left = 0
              Top = 0
              Width = 43
              Height = 15
              Hint = ''
              Caption = 'Cultivar'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBEdit6: TUniDBEdit
              Left = 3
              Top = 17
              Width = 145
              Height = 29
              Hint = ''
              DataField = 'CULTIVAR'
              DataSource = dscrud
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              ReadOnly = True
            end
          end
          object rcBlock140: TUniContainerPanel
            Tag = 1
            Left = 330
            Top = 100
            Width = 94
            Height = 48
            Hint = '[[ | cols-grid:20| cols:xs-20 sm-20 md-4| ]]'
            ParentColor = False
            TabOrder = 12
            DesignSize = (
              94
              48)
            object UniLabel13: TUniLabel
              Left = 0
              Top = 0
              Width = 53
              Height = 15
              Hint = ''
              Caption = 'Categoria'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBComboBoxcategoria: TUniDBComboBox
              Tag = 1
              Left = 2
              Top = 17
              Width = 88
              Height = 29
              Hint = ''
              Anchors = [akLeft, akTop, akRight]
              DataField = 'CATEGORIA'
              DataSource = dscrud
              Style = csDropDownList
              Items.Strings = (
                'S1'
                'S2'
                'C1'
                'C2'
                'Basica'
                'S2+S1'
                '')
              TabOrder = 2
              IconItems = <>
            end
          end
          object rcBlock150: TUniContainerPanel
            Tag = 1
            Left = 425
            Top = 100
            Width = 126
            Height = 48
            Hint = '[[ | cols-grid:20| cols:xs-20 sm-20 md-4| ]]'
            ParentColor = False
            TabOrder = 13
            DesignSize = (
              126
              48)
            object UniLabel15: TUniLabel
              Left = 0
              Top = 0
              Width = 29
              Height = 15
              Hint = ''
              Caption = 'Safra'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBEdit7: TUniDBEdit
              Left = 1
              Top = 17
              Width = 123
              Height = 29
              Hint = ''
              DataField = 'SAFRA'
              DataSource = dscrud
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock160: TUniContainerPanel
            Tag = 1
            Left = 552
            Top = 100
            Width = 137
            Height = 48
            Hint = '[[ | cols-grid:20| cols:xs-20 sm-20 md-4| ]]'
            ParentColor = False
            TabOrder = 14
            DesignSize = (
              137
              48)
            object UniLabel16: TUniLabel
              Left = 0
              Top = 0
              Width = 38
              Height = 15
              Hint = ''
              Caption = 'Campo'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBEdit8: TUniDBEdit
              Left = 1
              Top = 17
              Width = 133
              Height = 29
              Hint = ''
              DataField = 'CAMPO'
              DataSource = dscrud
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object rcBlock120: TUniContainerPanel
            Tag = 1
            Left = 0
            Top = 100
            Width = 177
            Height = 48
            Hint = '[[ | cols-grid:20| cols:xs-20 sm-20 md-4| ]]'
            ParentColor = False
            TabOrder = 15
            DesignSize = (
              177
              48)
            object UniLabel11: TUniLabel
              Left = 0
              Top = 0
              Width = 41
              Height = 15
              Hint = ''
              Caption = 'Esp'#233'cie'
              ParentFont = False
              Font.Height = -13
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBEdit5: TUniDBEdit
              Left = 1
              Top = 17
              Width = 174
              Height = 29
              Hint = ''
              DataField = 'ESPECIE'
              DataSource = dscrud
              CharCase = ecUpperCase
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              ReadOnly = True
            end
          end
          object rcBlock180: TUniContainerPanel
            Left = 3
            Top = 154
            Width = 198
            Height = 31
            Hint = '[[ | cols-grid:20| cols:xs-20 sm-20 md-8| ]]'
            ParentColor = False
            Color = clTeal
            TabOrder = 16
            Layout = 'fit'
            object UniLabel1: TUniLabel
              Left = 8
              Top = 4
              Width = 185
              Height = 23
              Hint = ''
              Alignment = taCenter
              AutoSize = False
              Caption = 'FORNECEDOR'
              ParentFont = False
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'Calibri'
              TabOrder = 1
            end
          end
          object rcBlock190: TUniContainerPanel
            Left = 207
            Top = 154
            Width = 192
            Height = 31
            Hint = '[[ | cols-grid:20| cols:xs-20 sm-20 md-8| ]]'
            ParentColor = False
            Color = clTeal
            TabOrder = 17
            Layout = 'fit'
            object UniLabel20: TUniLabel
              Left = -1
              Top = 4
              Width = 189
              Height = 26
              Hint = ''
              Alignment = taCenter
              AutoSize = False
              Caption = 'INTERNO'
              ParentFont = False
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'Calibri'
              TabOrder = 1
            end
          end
          object rcBlock200: TUniContainerPanel
            Left = 405
            Top = 154
            Width = 185
            Height = 31
            Hint = '[[ | cols-grid:20| cols:xs-20 sm-20 md-4| ]]'
            ParentColor = False
            Color = clTeal
            TabOrder = 18
            Layout = 'fit'
            object UniLabel17: TUniLabel
              Left = 28
              Top = 4
              Width = 130
              Height = 26
              Hint = ''
              Alignment = taCenter
              AutoSize = False
              Caption = 'PESO'
              ParentFont = False
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'Calibri'
              TabOrder = 1
            end
          end
          object rcBlock210: TUniContainerPanel
            Left = 14
            Top = 187
            Width = 139
            Height = 68
            Hint = '[[ | cols-grid:20| cols:xs-20 sm-20 md-4| ]]'
            ParentColor = False
            Color = clTeal
            TabOrder = 19
            DesignSize = (
              139
              68)
            object UniLabel18: TUniLabel
              Left = -3
              Top = 1
              Width = 127
              Height = 21
              Hint = ''
              Alignment = taCenter
              AutoSize = False
              Caption = 'PUREZA %'
              ParentFont = False
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'Calibri'
              TabOrder = 2
            end
            object UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit
              Left = 2
              Top = 28
              Width = 135
              Height = 36
              Hint = '[[ | cols-grid:20| cols:xs-20 sm-20 md-20| ]]'
              DataField = 'PUREZA_FOR'
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Height = -16
              Font.Style = [fsBold]
              TabOrder = 1
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
          end
          object rcBlock220: TUniContainerPanel
            Left = 159
            Top = 187
            Width = 118
            Height = 68
            Hint = '[[ | cols-grid:20| cols:xs-20 sm-20 md-4| ]]'
            ParentColor = False
            Color = clTeal
            TabOrder = 20
            DesignSize = (
              118
              68)
            object UniLabel19: TUniLabel
              Left = 0
              Top = 6
              Width = 140
              Height = 26
              Hint = ''
              Alignment = taCenter
              AutoSize = False
              Caption = 'VIABILIDADE %'
              ParentFont = False
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'Calibri'
              TabOrder = 2
            end
            object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
              Left = 2
              Top = 28
              Width = 113
              Height = 36
              Hint = ''
              DataField = 'VIABILIDADE_FOR'
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Height = -16
              Font.Style = [fsBold]
              TabOrder = 1
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
          end
          object rcBlock230: TUniContainerPanel
            Left = 280
            Top = 187
            Width = 140
            Height = 68
            Hint = '[[ | cols-grid:20| cols:xs-20 sm-20 md-4| ]]'
            ParentColor = False
            Color = clTeal
            TabOrder = 21
            DesignSize = (
              140
              68)
            object UniLabel21: TUniLabel
              Left = 0
              Top = 6
              Width = 140
              Height = 26
              Hint = ''
              Alignment = taCenter
              AutoSize = False
              Caption = 'PUREZA %'
              ParentFont = False
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'Calibri'
              TabOrder = 2
            end
            object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
              Left = 2
              Top = 28
              Width = 135
              Height = 36
              Hint = ''
              DataField = 'PUREZA_INTERNA'
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clBlue
              Font.Height = -16
              TabOrder = 1
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
          end
          object rcBlock240: TUniContainerPanel
            Left = 426
            Top = 187
            Width = 138
            Height = 68
            Hint = '[[ | cols-grid:20| cols:xs-20 sm-20 md-4| ]]'
            ParentColor = False
            Color = clTeal
            TabOrder = 22
            DesignSize = (
              138
              68)
            object UniLabel22: TUniLabel
              Left = 0
              Top = 6
              Width = 140
              Height = 26
              Hint = ''
              Alignment = taCenter
              AutoSize = False
              Caption = 'VIABILIDADE %'
              ParentFont = False
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'Calibri'
              TabOrder = 2
            end
            object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
              Left = 2
              Top = 28
              Width = 135
              Height = 36
              Hint = ''
              DataField = 'VIABILIDADE_INTERNA'
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clBlue
              Font.Height = -16
              TabOrder = 1
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
          end
          object rcBlock250: TUniContainerPanel
            Left = 572
            Top = 187
            Width = 127
            Height = 68
            Hint = '[[ | cols-grid:20| cols:xs-20 sm-20 md-4| ]]'
            ParentColor = False
            Color = clTeal
            TabOrder = 23
            DesignSize = (
              127
              68)
            object UniLabel23: TUniLabel
              Left = 0
              Top = 6
              Width = 142
              Height = 26
              Hint = '[[ | cols-grid:20| cols:xs-20 sm-20 md-20| ]]'
              Alignment = taCenter
              AutoSize = False
              Caption = 'ENTRADA'
              ParentFont = False
              Font.Color = clWhite
              Font.Height = -19
              Font.Name = 'Calibri'
              TabOrder = 1
            end
            object UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit
              Left = 3
              Top = 28
              Width = 122
              Height = 36
              Hint = ''
              DataField = 'PESOENTRADA'
              Alignment = taCenter
              Anchors = [akLeft, akTop, akRight]
              ParentFont = False
              Font.Color = clGreen
              Font.Height = -16
              Font.Style = [fsBold]
              TabOrder = 2
              DecimalSeparator = ','
              ThousandSeparator = '.'
            end
          end
        end
      end
    end
    object paFooter: TUniContainerPanel
      Tag = 1
      Left = 0
      Top = 0
      Width = 720
      Height = 45
      Hint = ''
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 12
      ParentColor = False
      Color = 15658734
      Align = alTop
      TabOrder = 2
      ExplicitWidth = 756
      object btnEditReg: TUniBitBtn
        AlignWithMargins = True
        Left = 2
        Top = 2
        Width = 48
        Height = 41
        Hint = ''
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-pencil-alt"></i>'
        Align = alLeft
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 1
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnEditRegClick
        ExplicitLeft = 17
        ExplicitTop = 25
        ExplicitHeight = 32
      end
      object btnDeleteReg: TUniBitBtn
        AlignWithMargins = True
        Left = 54
        Top = 2
        Width = 47
        Height = 41
        Hint = ''
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-trash-alt"></i>'
        Align = alLeft
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 2
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnDeleteRegClick
        ExplicitHeight = 57
      end
      object btnCancelReg: TUniBitBtn
        AlignWithMargins = True
        Left = 105
        Top = 2
        Width = 52
        Height = 41
        Hint = ''
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-ban"></i>'
        Align = alLeft
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 3
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnCancelRegClick
        ExplicitHeight = 55
      end
      object btnSaveReg: TUniBitBtn
        AlignWithMargins = True
        Left = 161
        Top = 2
        Width = 44
        Height = 41
        Hint = ''
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-save"></i>'
        Align = alLeft
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 4
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnSaveRegClick
        ExplicitHeight = 55
      end
      object btnOptions: TUniBitBtn
        AlignWithMargins = True
        Left = 209
        Top = 2
        Width = 50
        Height = 41
        Hint = ''
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-print"></i>'
        Align = alLeft
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 5
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnOptionsClick
        ExplicitHeight = 55
      end
      object btnCloseForm: TUniBitBtn
        AlignWithMargins = True
        Left = 263
        Top = 2
        Width = 50
        Height = 41
        Hint = 
          '[['#13#10'cls:ButtonWhite | '#13#10'ico:fas-sign-out-alt rc-mirror-h | '#13#10'cls' +
          '-ico:font-black'#13#10']]'
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = '<i class="fas fa-sign-out-alt"></i>'
        Align = alLeft
        ParentFont = False
        Font.Height = -19
        Font.Name = 'Calibri'
        TabOrder = 6
        ScaleButton = False
        LayoutConfig.Padding = '0 2 0 0'
        OnClick = btnCloseFormClick
        ExplicitHeight = 55
      end
    end
  end
  object dsfiltro: TDataSource
    AutoEdit = False
    DataSet = FDQryFiltro
    Left = 618
    Top = 65534
  end
  object FDQryFiltro: TFDQuery
    CachedUpdates = True
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    SQL.Strings = (
      'SELECT * FROM FICHA')
    Left = 650
    Top = 65526
  end
  object dscrud: TDataSource
    AutoEdit = False
    DataSet = FDQryCad
    Left = 690
    Top = 14
  end
  object FDQryCad: TFDQuery
    Connection = mm.SQLConn
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evDetailCascade, evDetailServerCascade]
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    UpdateOptions.UpdateTableName = 'FICHA'
    SQL.Strings = (
      'SELECT * FROM FICHA WHERE CODIGO = :CODIGO')
    Left = 690
    Top = 65534
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object UniPopupMenuImpressao: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 575
    Top = 65534
    object EntregadosItenss1: TUniMenuItem
      Caption = 'Impress'#227'o da Ficha de Estoque'
      ImageIndex = 61
      OnClick = EntregadosItenss1Click
    end
    object N13: TUniMenuItem
      Caption = '-'
    end
    object I1: TUniMenuItem
      Caption = 'Impress'#227'o Controle Batida'
      ImageIndex = 36
      OnClick = I1Click
    end
  end
end
