inherited frmCadCLIENTES_CRUD2_ACTIONS: TfrmCadCLIENTES_CRUD2_ACTIONS
  inherited paBaseBackGround: TUniContainerPanel
    inherited sboxPg: TUniScrollBox
      ScrollHeight = 618
      ScrollWidth = 886
      inherited pgBaseCadControl: TUniPageControl
        ActivePage = tabSearch
        inherited tabSearch: TUniTabSheet
          inherited sboxTabSearch: TUniScrollBox
            ScrollHeight = 1165
            ScrollWidth = 839
            inherited rcBlock5: TUniContainerPanel
              Top = 304
              ExplicitTop = 304
            end
            inherited rcBlock20: TUniContainerPanel
              Top = 304
              ExplicitTop = 304
            end
            inherited rcBlock30: TUniContainerPanel
              Top = 304
              ExplicitTop = 304
              inherited btnQuickSearch: TUniBitBtn
                ScreenMask.Target = Owner
              end
            end
            inherited rcBlock300: TUniContainerPanel
              Top = 496
              Hint = 
                '[['#13#10'cols:xs-12 sm-12 md-2|'#13#10'state-visible:empty-true ds:dsSearch' +
                'Master|'#13#10']]'
              ExplicitTop = 496
              DesignSize = (
                252
                359)
              inherited rcBlock301: TUniContainerPanel
                Anchors = [akLeft, akTop, akRight]
              end
            end
            inherited rcBlock310: TUniContainerPanel
              Top = 496
              ExplicitTop = 496
            end
            inherited rcBlock40: TUniContainerPanel
              Top = 363
              ExplicitTop = 363
              inherited rcBlock294: TUniContainerPanel
                inherited btnSearchAdv: TUniBitBtn
                  ScreenMask.Target = Owner
                end
              end
              inherited rcBlock298: TUniContainerPanel
                TabOrder = 10
              end
              object rcBlock50: TUniContainerPanel
                Tag = 1
                Left = 9
                Top = 10
                Width = 120
                Height = 57
                Hint = '[['#13#10'cols:xs-12 sm-12 md-3'#13#10']]'
                ParentColor = False
                TabOrder = 4
                DesignSize = (
                  120
                  57)
                object rcLabel420: TUniLabel
                  Left = 0
                  Top = 0
                  Width = 52
                  Height = 13
                  Hint = ''
                  Caption = 'Cnpj / Cpf'
                  ParentFont = False
                  TabOrder = 1
                end
                object edSearchCNPJCPF: TUniEdit
                  Left = 0
                  Top = 18
                  Width = 119
                  Height = 38
                  Hint = ''
                  CharCase = ecUpperCase
                  Text = ''
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                end
              end
              object rcBlock60: TUniContainerPanel
                Tag = 1
                Left = 139
                Top = 12
                Width = 120
                Height = 57
                Hint = '[['#13#10'cols:xs-12 sm-12 md-3'#13#10']]'
                ParentColor = False
                TabOrder = 5
                DesignSize = (
                  120
                  57)
                object rcLabel430: TUniLabel
                  Left = 0
                  Top = 0
                  Width = 93
                  Height = 13
                  Hint = ''
                  Caption = 'Search Combobox'
                  ParentFont = False
                  TabOrder = 1
                end
                object rcComboBox430: TUniComboBox
                  Left = 0
                  Top = 18
                  Width = 119
                  Height = 38
                  Hint = ''
                  Text = ''
                  Anchors = [akLeft, akTop, akRight]
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
                Height = 57
                Hint = '[['#13#10'cols:xs-12 sm-12 md-3'#13#10']]'
                ParentColor = False
                TabOrder = 6
                DesignSize = (
                  120
                  57)
                object rcLabel440: TUniLabel
                  Left = 0
                  Top = 0
                  Width = 61
                  Height = 13
                  Hint = ''
                  Caption = 'Search Date'
                  ParentFont = False
                  TabOrder = 1
                end
                object edSearchDTCADASTRO: TUniDateTimePicker
                  Left = 0
                  Top = 18
                  Width = 119
                  Height = 38
                  Hint = ''
                  DateTime = 45171.000000000000000000
                  DateFormat = 'dd/MM/yyyy'
                  TimeFormat = 'HH:mm:ss'
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                end
              end
              object rcBlock80: TUniContainerPanel
                Tag = 1
                Left = 412
                Top = 14
                Width = 120
                Height = 57
                Hint = '[['#13#10'cols:xs-12 sm-12 md-3'#13#10']]'
                ParentColor = False
                TabOrder = 7
                DesignSize = (
                  120
                  57)
                object rcLabel450: TUniLabel
                  Left = 0
                  Top = 0
                  Width = 78
                  Height = 13
                  Hint = ''
                  Caption = 'Search Number'
                  ParentFont = False
                  TabOrder = 1
                end
                object rcNumberEdit450: TUniNumberEdit
                  Left = 0
                  Top = 18
                  Width = 119
                  Height = 38
                  Hint = ''
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                  DecimalSeparator = ','
                end
              end
              object rcBlock90: TUniContainerPanel
                Tag = 1
                Left = 552
                Top = 11
                Width = 120
                Height = 57
                Hint = '[['#13#10'cols:xs-12 sm-12 md-3'#13#10']]'
                ParentColor = False
                TabOrder = 8
                DesignSize = (
                  120
                  57)
                object rcLabel460: TUniLabel
                  Left = 0
                  Top = 0
                  Width = 65
                  Height = 13
                  Hint = ''
                  Caption = 'Search Value'
                  ParentFont = False
                  TabOrder = 1
                end
                object edSearchVALOR_CONTRATO: TUniFormattedNumberEdit
                  Left = 0
                  Top = 18
                  Width = 119
                  Height = 38
                  Hint = ''
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                  DecimalSeparator = ','
                  ThousandSeparator = '.'
                end
              end
              object rcBlock100: TUniContainerPanel
                Left = 683
                Top = 12
                Width = 120
                Height = 57
                Hint = '[['#13#10'cols:xs-12 sm-12 md-9|'#13#10'hide:mobile'#13#10']]'
                ParentColor = False
                TabOrder = 9
              end
            end
            inherited rcBlock420: TUniContainerPanel
              Top = 867
              ExplicitTop = 867
            end
            inherited rcBlock10: TUniContainerPanel
              Top = 304
              ExplicitTop = 304
              inherited btnEditRec: TUniBitBtn
                ScreenMask.Target = Owner
              end
            end
            inherited rcBlock15: TUniContainerPanel
              Top = 304
              ExplicitTop = 304
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
                Width = 79
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
                Width = 93
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
                Width = 90
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
      Left = 7
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
