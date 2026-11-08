inherited frmCadCLIENTES_CRUD2: TfrmCadCLIENTES_CRUD2
  inherited paBaseBackGround: TUniContainerPanel
    inherited sboxPg: TUniScrollBox
      ScrollHeight = 618
      ScrollWidth = 886
      inherited pgBaseCadControl: TUniPageControl
        inherited tabSearch: TUniTabSheet
          inherited sboxTabSearch: TUniScrollBox
            ScrollHeight = 943
            ScrollWidth = 839
            inherited rcBlock30: TUniContainerPanel
              inherited edQuickSearch: TUniEdit
                Hint = 
                  '[['#13#10'pos-l:0|'#13#10'pos-t:0|'#13#10'cls:rc-edit-no-border-right rc-clear-btn' +
                  '-no-border-right|'#13#10']]'#13#10#13#10
              end
              inherited btnQuickSearch: TUniBitBtn
                ScreenMask.Target = Owner
              end
            end
            inherited rcBlock300: TUniContainerPanel
              Top = 274
              ExplicitTop = 274
            end
            inherited rcBlock310: TUniContainerPanel
              Top = 274
              ExplicitTop = 274
            end
            inherited rcBlock40: TUniContainerPanel
              Left = 9
              Top = 67
              Height = 193
              ExplicitLeft = 9
              ExplicitTop = 67
              ExplicitHeight = 193
              inherited rcBlock294: TUniContainerPanel
                Top = 149
                ExplicitTop = 149
                inherited btnSearchAdv: TUniBitBtn
                  ScreenMask.Target = Owner
                end
              end
              inherited rcBlock296: TUniContainerPanel
                Top = 150
                ExplicitTop = 150
              end
              inherited rcBlock297: TUniContainerPanel
                Top = 150
                ExplicitTop = 150
              end
              inherited rcBlock298: TUniContainerPanel
                Top = 150
                TabOrder = 9
                ExplicitTop = 150
              end
              object rcBlock50: TUniContainerPanel
                Tag = 1
                Left = 9
                Top = 10
                Width = 120
                Height = 60
                Hint = '[['#13#10'cols:xs-12 sm-12 md-3'#13#10']]'
                ParentColor = False
                TabOrder = 4
                object rcLabel420: TUniLabel
                  Left = 0
                  Top = 0
                  Width = 145
                  Height = 13
                  Hint = ''
                  Caption = 'Cpf/Cnpj'
                  Align = alTop
                  ParentFont = False
                  TabOrder = 1
                end
                object edSearchCNPJCPF: TUniEdit
                  Left = 0
                  Top = 22
                  Width = 120
                  Height = 38
                  Hint = ''
                  CharCase = ecUpperCase
                  Text = ''
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  Align = alBottom
                  TabOrder = 2
                end
              end
              object rcBlock60: TUniContainerPanel
                Tag = 1
                Left = 139
                Top = 12
                Width = 120
                Height = 60
                Hint = '[['#13#10'cols:xs-12 sm-12 md-3'#13#10']]'
                ParentColor = False
                TabOrder = 5
                object rcLabel430: TUniLabel
                  Left = 0
                  Top = 0
                  Width = 110
                  Height = 13
                  Hint = ''
                  Caption = 'Combo'
                  Align = alTop
                  ParentFont = False
                  TabOrder = 1
                end
                object edSearchSTATUS: TUniComboBox
                  Left = 0
                  Top = 22
                  Width = 120
                  Height = 38
                  Hint = ''
                  Text = ''
                  Items.Strings = (
                    'Todos'
                    'Ativos'
                    'Inativos')
                  ItemIndex = 0
                  Align = alBottom
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  TabOrder = 2
                  IconItems = <>
                end
              end
              object rcBlock70: TUniContainerPanel
                Tag = 1
                Left = 277
                Top = 12
                Width = 120
                Height = 60
                Hint = '[['#13#10'cols:xs-12 sm-12 md-3'#13#10']]'
                ParentColor = False
                TabOrder = 6
                object rcLabel440: TUniLabel
                  Left = 0
                  Top = 0
                  Width = 136
                  Height = 13
                  Hint = ''
                  Caption = 'Data Ini.'
                  Align = alTop
                  ParentFont = False
                  TabOrder = 1
                end
                object edSearchDTCADASTRO: TUniDateTimePicker
                  Left = 0
                  Top = 22
                  Width = 120
                  Height = 38
                  Hint = ''
                  DateTime = 45171.000000000000000000
                  DateFormat = 'dd/MM/yyyy'
                  TimeFormat = 'HH:mm:ss'
                  Align = alBottom
                  TabOrder = 2
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  DisabledDates = <>
                end
              end
              object rcBlock80: TUniContainerPanel
                Tag = 1
                Left = 11
                Top = 84
                Width = 120
                Height = 60
                Hint = '[['#13#10'cols:xs-12 sm-12 md-3'#13#10']]'
                ParentColor = False
                TabOrder = 7
                object rcLabel450: TUniLabel
                  Left = 0
                  Top = 0
                  Width = 87
                  Height = 13
                  Hint = ''
                  Caption = 'C'#243'digo'
                  Align = alTop
                  ParentFont = False
                  TabOrder = 1
                end
                object edSearchCODIGO: TUniNumberEdit
                  Left = 0
                  Top = 22
                  Width = 120
                  Height = 38
                  Hint = ''
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  Align = alBottom
                  TabOrder = 2
                  DecimalSeparator = ','
                end
              end
              object rcBlock90: TUniContainerPanel
                Tag = 1
                Left = 151
                Top = 81
                Width = 120
                Height = 60
                Hint = '[['#13#10'cols:xs-12 sm-12 md-3'#13#10']]'
                ParentColor = False
                TabOrder = 8
                object rcLabel460: TUniLabel
                  Left = 0
                  Top = 0
                  Width = 171
                  Height = 13
                  Hint = ''
                  Caption = 'Valor Mensal'
                  Align = alTop
                  ParentFont = False
                  TabOrder = 1
                end
                object edSearchVALOR_CONTRATO: TUniFormattedNumberEdit
                  Left = 0
                  Top = 22
                  Width = 120
                  Height = 38
                  Hint = ''
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  Align = alBottom
                  TabOrder = 2
                  DecimalSeparator = ','
                  ThousandSeparator = '.'
                end
              end
              object rcBlock75: TUniContainerPanel
                Tag = 1
                Left = 415
                Top = 10
                Width = 120
                Height = 60
                Hint = '[['#13#10'cols:xs-12 sm-12 md-3'#13#10']]'
                ParentColor = False
                TabOrder = 10
                object UniLabel1: TUniLabel
                  Left = 0
                  Top = 0
                  Width = 136
                  Height = 13
                  Hint = ''
                  Caption = 'Data Final'
                  Align = alTop
                  ParentFont = False
                  TabOrder = 1
                end
                object edSearchDTCADASTROFIM: TUniDateTimePicker
                  Left = 0
                  Top = 22
                  Width = 120
                  Height = 38
                  Hint = ''
                  DateTime = 45171.000000000000000000
                  DateFormat = 'dd/MM/yyyy'
                  TimeFormat = 'HH:mm:ss'
                  Align = alBottom
                  TabOrder = 2
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  DisabledDates = <>
                end
              end
              object rcBlock100: TUniContainerPanel
                Left = 282
                Top = 81
                Width = 120
                Height = 60
                Hint = '[['#13#10'cols:xs-12 sm-12 md-2]]'
                ParentColor = False
                TabOrder = 11
                object edSearchCIDADE: TUniEdit
                  Left = 0
                  Top = 22
                  Width = 120
                  Height = 38
                  Hint = ''
                  CharCase = ecUpperCase
                  Text = ''
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  Align = alBottom
                  TabOrder = 1
                end
                object UniLabel2: TUniLabel
                  Left = 0
                  Top = 0
                  Width = 96
                  Height = 13
                  Hint = ''
                  Caption = 'Cidade'
                  Align = alTop
                  ParentFont = False
                  TabOrder = 2
                end
              end
              object rcBlock110: TUniContainerPanel
                Left = 420
                Top = 84
                Width = 120
                Height = 60
                Hint = '[['#13#10'cols:xs-12 sm-12 md-4|'#13#10'hide:mobile'#13#10']]'
                ParentColor = False
                TabOrder = 12
              end
            end
            inherited rcBlock420: TUniContainerPanel
              Top = 645
              ExplicitTop = 645
            end
            inherited rcBlock10: TUniContainerPanel
              inherited btnEditRec: TUniBitBtn
                ScreenMask.Target = Owner
              end
            end
          end
        end
        inherited tabRegister: TUniTabSheet
          inherited sboxTabReg: TUniScrollBox
            ScrollHeight = 188
            ScrollWidth = 412
            object rcBlock1000: TUniContainerPanel
              Tag = 1
              Left = 11
              Top = 53
              Width = 100
              Height = 60
              Hint = '[['#13#10'cols:xs-12 sm-12 md-4 |'#13#10']]'#13#10#13#10#13#10
              ParentColor = False
              TabOrder = 0
              DesignSize = (
                100
                60)
              object edCodigo: TUniDBEdit
                Left = 0
                Top = 21
                Width = 100
                Height = 38
                Hint = #13#10
                DataField = 'codigo'
                DataSource = dsMaster
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'Calibri'
                Font.Style = [fsBold]
                TabOrder = 1
                Color = clGray
                ReadOnly = True
              end
              object UniLabel3Clone: TUniLabel
                Left = 0
                Top = 0
                Width = 91
                Height = 15
                Hint = ''
                Caption = 'C'#243'digo'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 2
              end
            end
            object rcBlock1010: TUniContainerPanel
              Tag = 1
              Left = 148
              Top = 52
              Width = 100
              Height = 60
              Hint = '[['#13#10'cols:xs-12 sm-12 md-4 |'#13#10']]'#13#10#13#10#13#10
              ParentColor = False
              TabOrder = 1
              DesignSize = (
                100
                60)
              object labDtCadClone: TUniLabel
                Left = 2
                Top = 0
                Width = 193
                Height = 15
                Hint = ''
                Caption = 'Data Cadastro'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object edDtCad: TUniDBDateTimePicker
                Left = 0
                Top = 21
                Width = 100
                Height = 38
                Hint = '[['#13#10'mask:date |'#13#10'valid:date notblank|'#13#10']]'#13#10#13#10#13#10
                DataField = 'dtcadastro'
                DataSource = dsMaster
                DateTime = 44279.000000000000000000
                DateFormat = 'dd/MM/yyyy'
                TimeFormat = 'HH:mm:ss'
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                DisabledDates = <>
              end
            end
            object rcBlock1020: TUniContainerPanel
              Tag = 1
              Left = 288
              Top = 53
              Width = 100
              Height = 60
              Hint = '[['#13#10'cols:xs-12 sm-12 md-4 |'#13#10']]'#13#10#13#10#13#10
              ParentColor = False
              TabOrder = 2
              DesignSize = (
                100
                60)
              object UniLabel5Clone: TUniLabel
                Left = 0
                Top = 0
                Width = 182
                Height = 15
                Hint = ''
                Caption = 'Data Anivers'#225'rio'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object UniDBDateTimePicker1: TUniDBDateTimePicker
                Left = 0
                Top = 21
                Width = 100
                Height = 38
                Hint = '[['#13#10'mask:date |'#13#10']]'
                DataField = 'DTANIVERSARIO'
                DataSource = dsMaster
                DateTime = 44279.000000000000000000
                DateFormat = 'dd/MM/yyyy'
                TimeFormat = 'HH:mm:ss'
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                DisabledDates = <>
              end
            end
            object rcBlock1060: TUniContainerPanel
              Tag = 1
              Left = 36
              Top = 128
              Width = 376
              Height = 60
              Hint = '[['#13#10'cols:xs-12 sm-12 md-6|'#13#10']]'
              ParentColor = False
              TabOrder = 3
              DesignSize = (
                376
                60)
              object labNome: TUniLabel
                Left = 0
                Top = 0
                Width = 163
                Height = 15
                Hint = ''
                Caption = 'Nome / Fantasia'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object edCliName: TUniDBEdit
                Left = 0
                Top = 21
                Width = 375
                Height = 38
                Hint = '[['#13#10'valid:blank=Nome Cliente|'#13#10'valid-required:labNome'#13#10']]'
                DataField = 'NOME'
                DataSource = dsMaster
                CharCase = ecUpperCase
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                TabOrder = 2
              end
            end
          end
          inherited paBaseSaveCancel: TUniContainerPanel
            inherited rcBlock430: TUniContainerPanel
              inherited btnSaveRec: TUniBitBtn
                ScreenMask.Target = Owner
              end
            end
            inherited rcBlock440: TUniContainerPanel
              inherited btnCancelRec: TUniBitBtn
                ScreenMask.Target = Owner
              end
            end
          end
        end
      end
    end
  end
  inherited hpForActionBtns: TUniHiddenPanel
    object edHiddenCompanyID: TUniDBEdit
      Left = 6
      Top = 133
      Width = 22
      Height = 22
      Hint = ''
      Visible = False
      DataField = 'codiemp'
      DataSource = dsMaster
      CharCase = ecUpperCase
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 10
      ReadOnly = True
      InputType = 'search'
    end
  end
end
