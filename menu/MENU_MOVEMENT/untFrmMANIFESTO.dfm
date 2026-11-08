inherited frmMANIFESTO: TfrmMANIFESTO
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseTop: TUniContainerPanel
      inherited paBaseTopTitle: TUniContainerPanel
        inherited btnQuickSearch: TUniBitBtn
          ScreenMask.Target = Owner
        end
      end
    end
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 988
      ScrollWidth = 37
      inherited paNAE: TUniContainerPanel
        inherited btnEditReg: TUniBitBtn
          ScreenMask.Target = Owner
        end
      end
      inherited paGC: TUniContainerPanel
        inherited btnSaveReg: TUniBitBtn
          ScreenMask.Target = Owner
        end
        inherited btnCancelReg: TUniBitBtn
          ScreenMask.Target = Owner
        end
      end
    end
    inherited paBaseCadControl: TUniContainerPanel
      inherited pgBaseCadControl: TUniPageControl
        inherited tabSearch: TUniTabSheet
          ExplicitLeft = 0
          ExplicitTop = 24
          ExplicitWidth = 256
          ExplicitHeight = 965
          inherited paBaseRegSearch: TUniContainerPanel
            Height = 965
            ExplicitHeight = 965
            inherited paGridOffset: TUniContainerPanel
              Height = 957
              ExplicitHeight = 957
              inherited dbgSearchCRUD: TUniDBGrid
                Height = 957
                Columns = <
                  item
                    FieldName = 'opcoes'
                    Title.Caption = ' '
                    Width = 30
                    Font.Name = 'Calibri'
                    Alignment = taCenter
                  end
                  item
                    FieldName = 'status'
                    Title.Caption = ' '
                    Width = 70
                    Font.Name = 'Calibri'
                    Alignment = taCenter
                  end
                  item
                    FieldName = 'NUMERO'
                    Title.Caption = 'NUMERO'
                    Width = 74
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'EMISSAO'
                    Title.Caption = 'EMISSAO'
                    Width = 74
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'TRANSPORTADORA'
                    Title.Caption = 'TRANSPORTADORA'
                    Width = 100
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'NOME'
                    Title.Caption = 'NOME'
                    Width = 250
                    Font.Name = 'Calibri'
                    ReadOnly = True
                  end
                  item
                    FieldName = 'CPFCNPJ'
                    Title.Caption = 'CPFCNPJ'
                    Width = 100
                    Font.Name = 'Calibri'
                    ReadOnly = True
                  end>
              end
            end
          end
        end
        inherited tabRegister: TUniTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 1361
          ExplicitHeight = 965
          inherited paBaseRegData1: TUniContainerPanel
            Height = 963
            ScrollHeight = 963
            ScrollWidth = 1361
            object UniPageControlcadastros: TUniPageControl
              Left = 0
              Top = 0
              Width = 1361
              Height = 963
              Hint = ''
              ActivePage = UniTabSheetCRUD
              Align = alClient
              TabOrder = 1
              ExplicitHeight = 965
              object UniTabSheetCRUD: TUniTabSheet
                Hint = ''
                Caption = 'Geral'
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 256
                ExplicitHeight = 128
                object UniScrollBox2: TUniScrollBox
                  Left = 0
                  Top = 0
                  Width = 1353
                  Height = 933
                  Hint = ''
                  Align = alClient
                  TabOrder = 0
                  ExplicitHeight = 935
                  object UniContainerPanel2: TUniContainerPanel
                    Left = 0
                    Top = 0
                    Width = 1351
                    Height = 931
                    Hint = ''
                    ParentColor = False
                    Align = alClient
                    TabOrder = 0
                    ExplicitHeight = 933
                    object UniScrollBox3: TUniScrollBox
                      Left = 0
                      Top = 0
                      Width = 1351
                      Height = 931
                      Hint = ''
                      Align = alClient
                      TabOrder = 1
                      ExplicitHeight = 933
                      ScrollHeight = 535
                      ScrollWidth = 939
                      object rcBlock10: TUniContainerPanel
                        Tag = 1
                        Left = 3
                        Top = 3
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-2]]'
                        ParentColor = False
                        TabOrder = 0
                        DesignSize = (
                          150
                          48)
                        object UniLabel35: TUniLabel
                          Left = 4
                          Top = 0
                          Width = 40
                          Height = 15
                          Hint = ''
                          Caption = 'Transp.'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 1
                        end
                        object UniButtonDbEditTRANSPORTADORA: TUniButtonDbEdit
                          Tag = 1
                          Left = 2
                          Top = 16
                          Width = 145
                          Height = 29
                          Hint = ''
                          DataField = 'TRANSPORTADORA'
                          DataSource = dsMaster
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 2
                          Color = clInfoBk
                          OnExit = UniButtonDbEditTRANSPORTADORAExit
                          OnButtonClick = UniButtonDbEditTRANSPORTADORAButtonClick
                          IconCls = 'search'
                        end
                      end
                      object rcBlock20: TUniContainerPanel
                        Tag = 1
                        Left = 196
                        Top = 3
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-4]]'
                        ParentColor = False
                        TabOrder = 1
                        DesignSize = (
                          150
                          48)
                        object UniDBEditTRANSPORTADORA: TUniDBEdit
                          Tag = 1
                          Left = 2
                          Top = 16
                          Width = 146
                          Height = 29
                          Hint = ''
                          DataField = 'NOMETRANSPORTADORA'
                          DataSource = dsMaster
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 1
                        end
                        object UniLabel36: TUniLabel
                          Left = 2
                          Top = 0
                          Width = 120
                          Height = 15
                          Hint = ''
                          Caption = 'Nome Transportadora'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 2
                        end
                      end
                      object rcBlock30: TUniContainerPanel
                        Tag = 1
                        Left = 372
                        Top = 3
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-2]]'
                        ParentColor = False
                        TabOrder = 2
                        DesignSize = (
                          150
                          48)
                        object UniLabel4: TUniLabel
                          Left = -1
                          Top = 0
                          Width = 48
                          Height = 15
                          Hint = ''
                          Caption = 'Cpf/Cnpj'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 1
                        end
                        object UniDBEditcpfcnpj: TUniDBEdit
                          Tag = 1
                          Left = 2
                          Top = 16
                          Width = 146
                          Height = 29
                          Hint = ''
                          DataField = 'CPFCNPJ'
                          DataSource = dsMaster
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 2
                          OnExit = UniDBEditcpfcnpjExit
                        end
                      end
                      object rcBlock40: TUniContainerPanel
                        Tag = 1
                        Left = 542
                        Top = 3
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-2]]'
                        ParentColor = False
                        TabOrder = 3
                        DesignSize = (
                          150
                          48)
                        object UniLabel5: TUniLabel
                          Left = 0
                          Top = 0
                          Width = 31
                          Height = 15
                          Hint = ''
                          Caption = 'Saida'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 1
                        end
                        object UniDBDateTimePicker2: TUniDBDateTimePicker
                          Left = 3
                          Top = 16
                          Width = 144
                          Height = 29
                          Hint = ''
                          DataField = 'EMISSAO'
                          DataSource = dsMaster
                          DateTime = 44561.000000000000000000
                          DateFormat = 'dd/MM/yyyy'
                          TimeFormat = 'HH:mm:ss'
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 2
                        end
                      end
                      object rcBlock50: TUniContainerPanel
                        Tag = 1
                        Left = 703
                        Top = 3
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-2]]'
                        ParentColor = False
                        TabOrder = 4
                        DesignSize = (
                          150
                          48)
                        object edCodigo: TUniDBEdit
                          Tag = 1
                          Left = 2
                          Top = 16
                          Width = 145
                          Height = 29
                          Hint = ''
                          DataField = 'NUMERO'
                          DataSource = dsMaster
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
                        object UniLabel7: TUniLabel
                          Left = 2
                          Top = 0
                          Width = 72
                          Height = 15
                          Hint = ''
                          Caption = 'Numero Nota'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 2
                        end
                      end
                      object rcBlock60: TUniContainerPanel
                        Tag = 1
                        Left = 3
                        Top = 57
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-3]]'
                        ParentColor = False
                        TabOrder = 5
                        DesignSize = (
                          150
                          48)
                        object UniLabel6: TUniLabel
                          Left = 2
                          Top = 0
                          Width = 26
                          Height = 15
                          Hint = ''
                          Caption = 'CIOT'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 1
                        end
                        object UniDBEdit2: TUniDBEdit
                          Left = 3
                          Top = 17
                          Width = 146
                          Height = 29
                          Hint = ''
                          DataField = 'CIOT'
                          DataSource = dsMaster
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 2
                        end
                      end
                      object rcBlock70: TUniContainerPanel
                        Tag = 1
                        Left = 196
                        Top = 57
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-3]]'
                        ParentColor = False
                        TabOrder = 6
                        DesignSize = (
                          150
                          48)
                        object UniDBEdit4: TUniDBEdit
                          Left = 2
                          Top = 17
                          Width = 146
                          Height = 29
                          Hint = ''
                          DataField = 'RNTC'
                          DataSource = dsMaster
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 1
                        end
                        object UniLabel8: TUniLabel
                          Left = 2
                          Top = 0
                          Width = 28
                          Height = 15
                          Hint = ''
                          Caption = 'RNTC'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 2
                        end
                      end
                      object rcBlock80: TUniContainerPanel
                        Tag = 1
                        Left = 382
                        Top = 57
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-3]]'
                        ParentColor = False
                        TabOrder = 7
                        DesignSize = (
                          150
                          48)
                        object UniDBEdit5: TUniDBEdit
                          Left = 2
                          Top = 17
                          Width = 146
                          Height = 29
                          Hint = ''
                          DataField = 'RENAVAM'
                          DataSource = dsMaster
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 1
                        end
                        object UniLabel9: TUniLabel
                          Left = 2
                          Top = 0
                          Width = 51
                          Height = 15
                          Hint = ''
                          Caption = 'RENAVAM'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 2
                        end
                      end
                      object rcBlock90: TUniContainerPanel
                        Tag = 1
                        Left = 558
                        Top = 56
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-3]]'
                        ParentColor = False
                        TabOrder = 8
                        DesignSize = (
                          150
                          48)
                        object UniLabel47: TUniLabel
                          Left = 2
                          Top = 1
                          Width = 43
                          Height = 15
                          Hint = ''
                          Caption = 'CIF-FOB'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 1
                        end
                        object UniComboBoxtrafrete: TUniComboBox
                          Left = 3
                          Top = 18
                          Width = 145
                          Height = 29
                          Hint = ''
                          Style = csDropDownList
                          Text = ''
                          Items.Strings = (
                            'Emitente'
                            'Destinatario'
                            '')
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 2
                          IconItems = <>
                        end
                      end
                      object rcBlock100: TUniContainerPanel
                        Tag = 1
                        Left = 3
                        Top = 111
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-3]]'
                        ParentColor = False
                        TabOrder = 9
                        DesignSize = (
                          150
                          48)
                        object UniLabel10: TUniLabel
                          Left = 2
                          Top = 1
                          Width = 59
                          Height = 15
                          Hint = ''
                          Caption = 'Tipo Carga'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 1
                        end
                        object UniComboBoxtipocarga: TUniComboBox
                          Left = 3
                          Top = 18
                          Width = 145
                          Height = 29
                          Hint = ''
                          Style = csDropDownList
                          Text = ''
                          Items.Strings = (
                            'SACOS'
                            'BAGS'
                            'KILOS'
                            'PECAS')
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 2
                          IconItems = <>
                        end
                      end
                      object rcBlock110: TUniContainerPanel
                        Tag = 1
                        Left = 196
                        Top = 111
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-3]]'
                        ParentColor = False
                        TabOrder = 10
                        DesignSize = (
                          150
                          48)
                        object UniLabel11: TUniLabel
                          Left = 2
                          Top = 1
                          Width = 24
                          Height = 15
                          Hint = ''
                          Caption = 'Tipo'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 1
                        end
                        object UniComboBoxtipoveiculo: TUniComboBox
                          Left = 2
                          Top = 18
                          Width = 145
                          Height = 29
                          Hint = ''
                          Style = csDropDownList
                          Text = ''
                          Items.Strings = (
                            'Truck'
                            'Toco'
                            'CavaloMecanico'
                            'VAN'
                            'Utilitario'
                            'Outros')
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 2
                          IconItems = <>
                        end
                      end
                      object rcBlock120: TUniContainerPanel
                        Tag = 1
                        Left = 382
                        Top = 111
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-3]]'
                        ParentColor = False
                        TabOrder = 11
                        DesignSize = (
                          150
                          48)
                        object UniComboBoxtipocarroceria: TUniComboBox
                          Left = 3
                          Top = 18
                          Width = 145
                          Height = 29
                          Hint = ''
                          Style = csDropDownList
                          Text = ''
                          Items.Strings = (
                            'Aberta'
                            'Fechada'
                            'Graneleira'
                            'PortaContainer'
                            'Sider')
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 1
                          IconItems = <>
                        end
                        object UniLabel12: TUniLabel
                          Left = 2
                          Top = 1
                          Width = 59
                          Height = 15
                          Hint = ''
                          Caption = 'Carroceria'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 2
                        end
                      end
                      object rcBlock130: TUniContainerPanel
                        Tag = 1
                        Left = 558
                        Top = 111
                        Width = 150
                        Height = 48
                        Hint = '[[cols:xs-12 sm-12 md-3]]'
                        ParentColor = False
                        TabOrder = 12
                        DesignSize = (
                          150
                          48)
                        object UniComboBoxtipoemitente: TUniComboBox
                          Left = 3
                          Top = 18
                          Width = 145
                          Height = 29
                          Hint = ''
                          Style = csDropDownList
                          Text = ''
                          Items.Strings = (
                            'Prestador de Servi'#231'o'
                            'N'#227'o Prestador de Servi'#231'o')
                          Anchors = [akLeft, akTop, akRight]
                          TabOrder = 1
                          IconItems = <>
                        end
                        object UniLabel13: TUniLabel
                          Left = 3
                          Top = 2
                          Width = 74
                          Height = 15
                          Hint = ''
                          Caption = 'Tipo Emitente'
                          ParentFont = False
                          Font.Height = -13
                          Font.Name = 'Calibri'
                          TabOrder = 2
                        end
                      end
                      object rcBlock140: TUniContainerPanel
                        Left = 3
                        Top = 165
                        Width = 936
                        Height = 370
                        Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                        ParentColor = False
                        TabOrder = 13
                        object UniPageControlmanifesto: TUniPageControl
                          Left = 0
                          Top = 0
                          Width = 936
                          Height = 370
                          Hint = ''
                          ActivePage = UniTabSheetnotasconhecimento
                          Align = alClient
                          TabOrder = 1
                          object UniTabSheetcarregamentodestino: TUniTabSheet
                            Hint = ''
                            Caption = 'Carregamento/Destino'
                            ExplicitLeft = 0
                            ExplicitTop = 0
                            ExplicitWidth = 256
                            ExplicitHeight = 128
                            object UniContainerPanel4: TUniContainerPanel
                              Left = 0
                              Top = 0
                              Width = 928
                              Height = 340
                              Hint = ''
                              ParentColor = False
                              Align = alClient
                              TabOrder = 0
                              ExplicitHeight = 342
                              object rcBlock150: TUniContainerPanel
                                Tag = 1
                                Left = 3
                                Top = 3
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-4]]'
                                ParentColor = False
                                TabOrder = 1
                                DesignSize = (
                                  150
                                  48)
                                object UniLabel22: TUniLabel
                                  Left = 4
                                  Top = 0
                                  Width = 125
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Carregamento ORIGEM'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 1
                                end
                                object UniButtonDbEditibgecarregamento: TUniButtonDbEdit
                                  Tag = 1
                                  Left = 2
                                  Top = 18
                                  Width = 145
                                  Height = 29
                                  Hint = ''
                                  DataField = 'IBGECARREGAMENTO'
                                  DataSource = dsMaster
                                  Anchors = [akLeft, akTop, akRight]
                                  TabOrder = 2
                                  Color = clInfoBk
                                  OnButtonClick = UniButtonDbEditibgecarregamentoButtonClick
                                  IconCls = 'search'
                                end
                              end
                              object rcBlock160: TUniContainerPanel
                                Tag = 1
                                Left = 196
                                Top = 3
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-4]]'
                                ParentColor = False
                                TabOrder = 2
                                DesignSize = (
                                  150
                                  48)
                                object UniLabel19: TUniLabel
                                  Left = 3
                                  Top = 0
                                  Width = 38
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Cidade'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 1
                                end
                                object UniDBEdit10: TUniDBEdit
                                  Left = 3
                                  Top = 18
                                  Width = 144
                                  Height = 29
                                  Hint = ''
                                  DataField = 'CIDADECARREGAMENTO'
                                  DataSource = dsMaster
                                  CharCase = ecUpperCase
                                  Anchors = [akLeft, akTop, akRight]
                                  TabOrder = 2
                                end
                              end
                              object rcBlock170: TUniContainerPanel
                                Tag = 1
                                Left = 382
                                Top = 3
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-4]]'
                                ParentColor = False
                                TabOrder = 3
                                DesignSize = (
                                  150
                                  48)
                                object UniLabel20: TUniLabel
                                  Left = 2
                                  Top = 0
                                  Width = 37
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Estado'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 1
                                end
                                object UniDBComboBoxestado: TUniDBComboBox
                                  Tag = 1
                                  Left = 2
                                  Top = 18
                                  Width = 145
                                  Height = 29
                                  Hint = ''
                                  Anchors = [akLeft, akTop, akRight]
                                  DataField = 'UFCARRREGAMENTO'
                                  DataSource = dsMaster
                                  Style = csDropDownList
                                  Items.Strings = (
                                    'SP'
                                    'PR'
                                    'MT'
                                    'MS'
                                    'SC'
                                    'RJ'
                                    'TO'
                                    'PA'
                                    'AM'
                                    'AC'
                                    'PB'
                                    'RN'
                                    'SE'
                                    'PE'
                                    'MG'
                                    'ES'
                                    'RO'
                                    'AP'
                                    'AL'
                                    'CE'
                                    'BA'
                                    'DF'
                                    'GO'
                                    'MA'
                                    'NO'
                                    'RS'
                                    'PI'
                                    'RR'
                                    'EX'
                                    'BR'
                                    '')
                                  ItemIndex = 0
                                  TabOrder = 2
                                  IconItems = <>
                                end
                              end
                              object rcBlock180: TUniContainerPanel
                                Left = 3
                                Top = 57
                                Width = 150
                                Height = 48
                                Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                                ParentColor = False
                                TabOrder = 4
                                DesignSize = (
                                  150
                                  48)
                                object UniDBEdit6: TUniDBEdit
                                  Left = 2
                                  Top = 17
                                  Width = 142
                                  Height = 29
                                  Hint = ''
                                  DataField = 'PERCURSO'
                                  DataSource = dsMaster
                                  CharCase = ecUpperCase
                                  Anchors = [akLeft, akTop, akRight]
                                  TabOrder = 1
                                end
                                object UniLabel14: TUniLabel
                                  Left = 4
                                  Top = 1
                                  Width = 49
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Percurso'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock190: TUniContainerPanel
                                Left = 3
                                Top = 113
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-6]]'
                                ParentColor = False
                                TabOrder = 5
                                DesignSize = (
                                  150
                                  48)
                                object UniDBComboBox1: TUniDBComboBox
                                  Tag = 1
                                  Left = 2
                                  Top = 17
                                  Width = 145
                                  Height = 29
                                  Hint = ''
                                  Anchors = [akLeft, akTop, akRight]
                                  DataField = 'ESTADOINI'
                                  DataSource = dsMaster
                                  Style = csDropDownList
                                  Items.Strings = (
                                    'SP'
                                    'PR'
                                    'MT'
                                    'MS'
                                    'SC'
                                    'RJ'
                                    'TO'
                                    'PA'
                                    'AM'
                                    'AC'
                                    'PB'
                                    'RN'
                                    'SE'
                                    'PE'
                                    'MG'
                                    'ES'
                                    'RO'
                                    'AP'
                                    'AL'
                                    'CE'
                                    'BA'
                                    'DF'
                                    'GO'
                                    'MA'
                                    'NO'
                                    'RS'
                                    'PI'
                                    'RR'
                                    'EX'
                                    'BR'
                                    '')
                                  ItemIndex = 0
                                  TabOrder = 1
                                  IconItems = <>
                                end
                                object UniLabel15: TUniLabel
                                  Left = 2
                                  Top = 0
                                  Width = 79
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Estado INICIAL'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock200: TUniContainerPanel
                                Left = 196
                                Top = 113
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-6]]'
                                ParentColor = False
                                TabOrder = 6
                                DesignSize = (
                                  150
                                  48)
                                object UniDBComboBox2: TUniDBComboBox
                                  Tag = 1
                                  Left = 2
                                  Top = 17
                                  Width = 145
                                  Height = 29
                                  Hint = ''
                                  Anchors = [akLeft, akTop, akRight]
                                  DataField = 'ESTADOFIN'
                                  DataSource = dsMaster
                                  Style = csDropDownList
                                  Items.Strings = (
                                    'SP'
                                    'PR'
                                    'MT'
                                    'MS'
                                    'SC'
                                    'RJ'
                                    'TO'
                                    'PA'
                                    'AM'
                                    'AC'
                                    'PB'
                                    'RN'
                                    'SE'
                                    'PE'
                                    'MG'
                                    'ES'
                                    'RO'
                                    'AP'
                                    'AL'
                                    'CE'
                                    'BA'
                                    'DF'
                                    'GO'
                                    'MA'
                                    'NO'
                                    'RS'
                                    'PI'
                                    'RR'
                                    'EX'
                                    'BR'
                                    '')
                                  ItemIndex = 0
                                  TabOrder = 1
                                  IconItems = <>
                                end
                                object UniLabel16: TUniLabel
                                  Left = 2
                                  Top = 0
                                  Width = 70
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Estado FINAL'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock480: TUniContainerPanel
                                Tag = 1
                                Left = 3
                                Top = 167
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-4]]'
                                ParentColor = False
                                TabOrder = 7
                                DesignSize = (
                                  150
                                  48)
                                object UniLabel49: TUniLabel
                                  Left = 4
                                  Top = 0
                                  Width = 149
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Descarregamento  DESTINO'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 1
                                end
                                object UniButtonDbEdit1: TUniButtonDbEdit
                                  Tag = 1
                                  Left = 2
                                  Top = 17
                                  Width = 145
                                  Height = 29
                                  Hint = ''
                                  DataField = 'IBGEDESCARREGAMENTO'
                                  DataSource = dsMaster
                                  Anchors = [akLeft, akTop, akRight]
                                  TabOrder = 2
                                  Color = clInfoBk
                                  OnButtonClick = UniButtonDbEdit1ButtonClick
                                  IconCls = 'search'
                                end
                              end
                              object rcBlock490: TUniContainerPanel
                                Tag = 1
                                Left = 196
                                Top = 167
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-4]]'
                                ParentColor = False
                                TabOrder = 8
                                DesignSize = (
                                  150
                                  48)
                                object UniLabel50: TUniLabel
                                  Left = 3
                                  Top = 0
                                  Width = 88
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Cidade DESTINO'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 1
                                end
                                object UniDBEdit3: TUniDBEdit
                                  Left = 3
                                  Top = 17
                                  Width = 144
                                  Height = 29
                                  Hint = ''
                                  DataField = 'CIDADEDESCARREGAMENTO'
                                  DataSource = dsMaster
                                  CharCase = ecUpperCase
                                  Anchors = [akLeft, akTop, akRight]
                                  TabOrder = 2
                                end
                              end
                              object rcBlock500: TUniContainerPanel
                                Tag = 1
                                Left = 382
                                Top = 167
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-4]]'
                                ParentColor = False
                                TabOrder = 9
                                DesignSize = (
                                  150
                                  48)
                                object UniLabel51: TUniLabel
                                  Left = 2
                                  Top = 0
                                  Width = 87
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Estado DESTINO'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 1
                                end
                                object UniDBComboBox6: TUniDBComboBox
                                  Left = 2
                                  Top = 17
                                  Width = 145
                                  Height = 29
                                  Hint = ''
                                  Anchors = [akLeft, akTop, akRight]
                                  DataField = 'UFDESCARREGAMENTO'
                                  DataSource = dsMaster
                                  Style = csDropDownList
                                  Items.Strings = (
                                    'SP'
                                    'PR'
                                    'MT'
                                    'MS'
                                    'SC'
                                    'RJ'
                                    'TO'
                                    'PA'
                                    'AM'
                                    'AC'
                                    'PB'
                                    'RN'
                                    'SE'
                                    'PE'
                                    'MG'
                                    'ES'
                                    'RO'
                                    'AP'
                                    'AL'
                                    'CE'
                                    'BA'
                                    'DF'
                                    'GO'
                                    'MA'
                                    'NO'
                                    'RS'
                                    'PI'
                                    'RR'
                                    'EX'
                                    'BR'
                                    '')
                                  ItemIndex = 0
                                  TabOrder = 2
                                  IconItems = <>
                                end
                              end
                            end
                          end
                          object UniTabSheetnotasconhecimento: TUniTabSheet
                            Hint = ''
                            Caption = 'Notas/Conhecimento'
                            ExplicitLeft = 0
                            ExplicitTop = 0
                            ExplicitWidth = 256
                            ExplicitHeight = 128
                            object UniContainerPanel7: TUniContainerPanel
                              Left = 0
                              Top = 0
                              Width = 928
                              Height = 342
                              Hint = ''
                              ParentColor = False
                              Align = alClient
                              TabOrder = 0
                              object rcBlock400: TUniContainerPanel
                                Tag = 1
                                Left = 3
                                Top = 3
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-4]]'
                                ParentColor = False
                                TabOrder = 1
                                DesignSize = (
                                  150
                                  48)
                                object UniDBEdit15: TUniDBEdit
                                  Left = 4
                                  Top = 17
                                  Width = 146
                                  Height = 29
                                  Hint = ''
                                  DataField = 'CODIGOBARRAS'
                                  DataSource = dsMaster
                                  Anchors = [akLeft, akTop, akRight]
                                  TabOrder = 1
                                  ReadOnly = True
                                end
                                object UniLabel41: TUniLabel
                                  Left = 2
                                  Top = 1
                                  Width = 90
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Chave de Acesso'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock410: TUniContainerPanel
                                Tag = 1
                                Left = 196
                                Top = 3
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-4]]'
                                ParentColor = False
                                TabOrder = 2
                                DesignSize = (
                                  150
                                  48)
                                object UniDBEdit16: TUniDBEdit
                                  Left = 3
                                  Top = 17
                                  Width = 146
                                  Height = 29
                                  Hint = ''
                                  DataField = 'PROTOCOLO'
                                  DataSource = dsMaster
                                  Anchors = [akLeft, akTop, akRight]
                                  TabOrder = 1
                                  ReadOnly = True
                                end
                                object UniLabel42: TUniLabel
                                  Left = 2
                                  Top = 1
                                  Width = 54
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Protocolo'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock420: TUniContainerPanel
                                Tag = 1
                                Left = 382
                                Top = 3
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-4]]'
                                ParentColor = False
                                TabOrder = 3
                                DesignSize = (
                                  150
                                  48)
                                object UniDBEdit17: TUniDBEdit
                                  Left = 3
                                  Top = 17
                                  Width = 146
                                  Height = 29
                                  Hint = ''
                                  DataField = 'CANCELADA'
                                  DataSource = dsMaster
                                  Anchors = [akLeft, akTop, akRight]
                                  TabOrder = 1
                                  ReadOnly = True
                                end
                                object UniLabel43: TUniLabel
                                  Left = 2
                                  Top = 1
                                  Width = 48
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Situa'#231#227'o'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock430: TUniContainerPanel
                                Tag = 1
                                Left = 3
                                Top = 59
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-3]]'
                                ParentColor = False
                                TabOrder = 4
                                DesignSize = (
                                  150
                                  48)
                                object UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit
                                  Left = 3
                                  Top = 16
                                  Width = 147
                                  Height = 29
                                  Hint = ''
                                  DataField = 'NOTA'
                                  DataSource = dsMaster
                                  Alignment = taCenter
                                  Anchors = [akLeft, akTop, akRight]
                                  ParentFont = False
                                  Font.Color = clBlue
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  Font.Style = [fsBold, fsItalic]
                                  TabOrder = 1
                                  ReadOnly = True
                                  DecimalPrecision = 0
                                  DecimalSeparator = ','
                                  ThousandSeparator = '.'
                                end
                                object UniLabel44: TUniLabel
                                  Left = 2
                                  Top = 1
                                  Width = 36
                                  Height = 15
                                  Hint = ''
                                  Caption = 'NFE-@'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock440: TUniContainerPanel
                                Tag = 1
                                Left = 196
                                Top = 59
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-3]]'
                                ParentColor = False
                                TabOrder = 5
                                DesignSize = (
                                  150
                                  48)
                                object UniDBFormattedNumberEdit10: TUniDBFormattedNumberEdit
                                  Left = 3
                                  Top = 16
                                  Width = 146
                                  Height = 29
                                  Hint = ''
                                  DataField = 'CONHECIMENTO'
                                  DataSource = dsMaster
                                  Alignment = taCenter
                                  Anchors = [akLeft, akTop, akRight]
                                  ParentFont = False
                                  Font.Color = clBlue
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  Font.Style = [fsBold, fsItalic]
                                  TabOrder = 1
                                  ReadOnly = True
                                  DecimalPrecision = 0
                                  DecimalSeparator = ','
                                  ThousandSeparator = '.'
                                end
                                object UniLabel45: TUniLabel
                                  Left = 2
                                  Top = 1
                                  Width = 35
                                  Height = 15
                                  Hint = ''
                                  Caption = 'CTE-@'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock450: TUniContainerPanel
                                Tag = 1
                                Left = 382
                                Top = 59
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-3]]'
                                ParentColor = False
                                TabOrder = 6
                                DesignSize = (
                                  150
                                  48)
                                object UniDBFormattedNumberEdit11: TUniDBFormattedNumberEdit
                                  Tag = 1
                                  Left = 2
                                  Top = 16
                                  Width = 147
                                  Height = 29
                                  Hint = ''
                                  DataField = 'PESOBRUTO'
                                  DataSource = dsMaster
                                  Anchors = [akLeft, akTop, akRight]
                                  ParentFont = False
                                  Font.Color = clBlue
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  Font.Style = [fsBold, fsItalic]
                                  TabOrder = 1
                                  ReadOnly = True
                                  DecimalPrecision = 3
                                  DecimalSeparator = ','
                                  ThousandSeparator = '.'
                                end
                                object UniLabel46: TUniLabel
                                  Left = 2
                                  Top = 1
                                  Width = 59
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Peso Bruto'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock460: TUniContainerPanel
                                Tag = 1
                                Left = 558
                                Top = 58
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-3]]'
                                ParentColor = False
                                TabOrder = 7
                                DesignSize = (
                                  150
                                  48)
                                object UniDBFormattedNumberEdit12: TUniDBFormattedNumberEdit
                                  Tag = 1
                                  Left = 3
                                  Top = 16
                                  Width = 144
                                  Height = 29
                                  Hint = ''
                                  DataField = 'TOTAL'
                                  DataSource = dsMaster
                                  Anchors = [akLeft, akTop, akRight]
                                  ParentFont = False
                                  Font.Color = clBlue
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  Font.Style = [fsBold, fsItalic]
                                  TabOrder = 1
                                  ReadOnly = True
                                  DecimalSeparator = ','
                                  ThousandSeparator = '.'
                                end
                                object UniLabel48: TUniLabel
                                  Left = 2
                                  Top = 0
                                  Width = 46
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Vlr Total'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock470: TUniContainerPanel
                                Left = 3
                                Top = 111
                                Width = 922
                                Height = 184
                                Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                                ParentColor = False
                                TabOrder = 8
                                object UniDBGridmanifestos: TUniDBGrid
                                  Left = 0
                                  Top = 0
                                  Width = 922
                                  Height = 184
                                  Hint = ''
                                  Margins.Left = 10
                                  Margins.Right = 20
                                  Margins.Bottom = 10
                                  DataSource = DS_MANIFESTO
                                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
                                  WebOptions.Paged = False
                                  LoadMask.Message = 'Carregando Item(s)...'
                                  ForceFit = True
                                  Align = alClient
                                  TabOrder = 1
                                  Summary.Enabled = True
                                  OnCellClick = UniDBGridmanifestosCellClick
                                  Columns = <
                                    item
                                      FieldName = 'TIPO'
                                      Title.Caption = 'Tipo'
                                      Width = 80
                                      PickList.Strings = (
                                        'NFE'
                                        'CFE')
                                    end
                                    item
                                      ActionColumn.Enabled = True
                                      ActionColumn.Buttons = <
                                        item
                                          ButtonId = 0
                                          UI = 'normal'
                                          Hint = 'Procura Documento'
                                          IconCls = 'search'
                                        end>
                                      FieldName = 'buscanota'
                                      Title.Caption = ' '
                                      Width = 30
                                      Alignment = taCenter
                                      ReadOnly = True
                                    end
                                    item
                                      FieldName = 'NUMERO'
                                      Title.Caption = 'Numero'
                                      Width = 60
                                    end
                                    item
                                      FieldName = 'CHAVE'
                                      Title.Caption = 'Chave de Acesso'
                                      Width = 390
                                    end
                                    item
                                      FieldName = 'ESTADO'
                                      Title.Caption = 'U.F.'
                                      Width = 50
                                    end
                                    item
                                      FieldName = 'PESOBRUTO'
                                      Title.Caption = 'Peso Bruto'
                                      Width = 100
                                    end
                                    item
                                      FieldName = 'PESOLIQUIDO'
                                      Title.Caption = 'Peso Liquido'
                                      Width = 72
                                    end
                                    item
                                      FieldName = 'TOTAL'
                                      Title.Caption = 'Total'
                                      Width = 80
                                    end
                                    item
                                      ActionColumn.Enabled = True
                                      ActionColumn.Buttons = <
                                        item
                                          ButtonId = 2
                                          UI = 'normal'
                                          Hint = 'Excluir Documento'
                                          IconCls = 'trash'
                                        end>
                                      FieldName = 'excluinota'
                                      Title.Caption = ' '
                                      Width = 30
                                      Alignment = taCenter
                                      ReadOnly = True
                                    end>
                                end
                              end
                            end
                          end
                          object UniTabSheetveiculos: TUniTabSheet
                            Hint = ''
                            Caption = 'Ve'#237'culos'
                            ExplicitLeft = 0
                            ExplicitTop = 0
                            ExplicitWidth = 256
                            ExplicitHeight = 128
                            object UniContainerPanel5: TUniContainerPanel
                              Left = 0
                              Top = 0
                              Width = 928
                              Height = 340
                              Hint = ''
                              ParentColor = False
                              Align = alClient
                              TabOrder = 0
                              ExplicitHeight = 342
                              object rcBlock210: TUniContainerPanel
                                Tag = 1
                                Left = 3
                                Top = 12
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-2]]'
                                ParentColor = False
                                TabOrder = 1
                                DesignSize = (
                                  150
                                  48)
                                object UniDBEdit7: TUniDBEdit
                                  Tag = 1
                                  Left = 4
                                  Top = 17
                                  Width = 146
                                  Height = 29
                                  Hint = ''
                                  DataField = 'PLACATRATOR'
                                  DataSource = dsMaster
                                  Anchors = [akLeft, akTop, akRight]
                                  TabOrder = 1
                                end
                                object UniLabel17: TUniLabel
                                  Left = 2
                                  Top = 1
                                  Width = 76
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Veiculo Trator'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock220: TUniContainerPanel
                                Tag = 1
                                Left = 159
                                Top = 12
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-2]]'
                                ParentColor = False
                                TabOrder = 2
                                DesignSize = (
                                  150
                                  48)
                                object UniDBComboBox3: TUniDBComboBox
                                  Tag = 1
                                  Left = 1
                                  Top = 17
                                  Width = 145
                                  Height = 29
                                  Hint = ''
                                  Anchors = [akLeft, akTop, akRight]
                                  DataField = 'ESTADOTRATOR'
                                  DataSource = dsMaster
                                  Style = csDropDownList
                                  Items.Strings = (
                                    'SP'
                                    'PR'
                                    'MT'
                                    'MS'
                                    'SC'
                                    'RJ'
                                    'TO'
                                    'PA'
                                    'AM'
                                    'AC'
                                    'PB'
                                    'RN'
                                    'SE'
                                    'PE'
                                    'MG'
                                    'ES'
                                    'RO'
                                    'AP'
                                    'AL'
                                    'CE'
                                    'BA'
                                    'DF'
                                    'GO'
                                    'MA'
                                    'NO'
                                    'RS'
                                    'PI'
                                    'RR'
                                    'EX'
                                    'BR'
                                    '')
                                  ItemIndex = 0
                                  TabOrder = 1
                                  IconItems = <>
                                end
                                object UniLabel23: TUniLabel
                                  Left = 2
                                  Top = 1
                                  Width = 37
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Estado'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock230: TUniContainerPanel
                                Tag = 1
                                Left = 315
                                Top = 12
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-2]]'
                                ParentColor = False
                                TabOrder = 3
                                DesignSize = (
                                  150
                                  48)
                                object UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit
                                  Left = 3
                                  Top = 17
                                  Width = 144
                                  Height = 29
                                  Hint = ''
                                  DataField = 'TRATORTARA'
                                  DataSource = dsMaster
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
                                object UniLabel26: TUniLabel
                                  Left = 2
                                  Top = 1
                                  Width = 24
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Tara'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock240: TUniContainerPanel
                                Tag = 1
                                Left = 471
                                Top = 12
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-3]]'
                                ParentColor = False
                                TabOrder = 4
                                DesignSize = (
                                  150
                                  48)
                                object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
                                  Left = 3
                                  Top = 17
                                  Width = 144
                                  Height = 29
                                  Hint = ''
                                  DataField = 'TRATORKG'
                                  DataSource = dsMaster
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
                                object UniLabel29: TUniLabel
                                  Left = 3
                                  Top = 1
                                  Width = 13
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Kg'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock250: TUniContainerPanel
                                Tag = 1
                                Left = 627
                                Top = 12
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-3]]'
                                ParentColor = False
                                TabOrder = 5
                                DesignSize = (
                                  150
                                  48)
                                object UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit
                                  Left = 3
                                  Top = 17
                                  Width = 144
                                  Height = 29
                                  Hint = ''
                                  DataField = 'TRATORM3'
                                  DataSource = dsMaster
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
                                object UniLabel32: TUniLabel
                                  Left = 3
                                  Top = 1
                                  Width = 18
                                  Height = 15
                                  Hint = ''
                                  Caption = 'M3'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock260: TUniContainerPanel
                                Tag = 1
                                Left = 3
                                Top = 73
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-2]]'
                                ParentColor = False
                                TabOrder = 6
                                DesignSize = (
                                  150
                                  48)
                                object UniDBEdit8: TUniDBEdit
                                  Left = 4
                                  Top = 16
                                  Width = 146
                                  Height = 29
                                  Hint = ''
                                  DataField = 'PLACACARRETA'
                                  DataSource = dsMaster
                                  Anchors = [akLeft, akTop, akRight]
                                  TabOrder = 1
                                end
                                object UniLabel18: TUniLabel
                                  Left = 2
                                  Top = 1
                                  Width = 41
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Carreta'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock270: TUniContainerPanel
                                Tag = 1
                                Left = 159
                                Top = 73
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-2]]'
                                ParentColor = False
                                TabOrder = 7
                                DesignSize = (
                                  150
                                  48)
                                object UniDBComboBox4: TUniDBComboBox
                                  Left = 1
                                  Top = 16
                                  Width = 145
                                  Height = 29
                                  Hint = ''
                                  Anchors = [akLeft, akTop, akRight]
                                  DataField = 'ESTADOCARRETA'
                                  DataSource = dsMaster
                                  Style = csDropDownList
                                  Items.Strings = (
                                    'SP'
                                    'PR'
                                    'MT'
                                    'MS'
                                    'SC'
                                    'RJ'
                                    'TO'
                                    'PA'
                                    'AM'
                                    'AC'
                                    'PB'
                                    'RN'
                                    'SE'
                                    'PE'
                                    'MG'
                                    'ES'
                                    'RO'
                                    'AP'
                                    'AL'
                                    'CE'
                                    'BA'
                                    'DF'
                                    'GO'
                                    'MA'
                                    'NO'
                                    'RS'
                                    'PI'
                                    'RR'
                                    'EX'
                                    'BR'
                                    '')
                                  ItemIndex = 0
                                  TabOrder = 1
                                  IconItems = <>
                                end
                                object UniLabel24: TUniLabel
                                  Left = 2
                                  Top = 1
                                  Width = 37
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Estado'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock280: TUniContainerPanel
                                Tag = 1
                                Left = 315
                                Top = 73
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-2]]'
                                ParentColor = False
                                TabOrder = 8
                                DesignSize = (
                                  150
                                  48)
                                object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                                  Left = 3
                                  Top = 16
                                  Width = 144
                                  Height = 29
                                  Hint = ''
                                  DataField = 'CARRETATARA'
                                  DataSource = dsMaster
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
                                object UniLabel27: TUniLabel
                                  Left = 2
                                  Top = 1
                                  Width = 24
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Tara'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock290: TUniContainerPanel
                                Tag = 1
                                Left = 471
                                Top = 73
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-3]]'
                                ParentColor = False
                                TabOrder = 9
                                DesignSize = (
                                  150
                                  48)
                                object UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit
                                  Left = 3
                                  Top = 16
                                  Width = 144
                                  Height = 29
                                  Hint = ''
                                  DataField = 'CARRETAKG'
                                  DataSource = dsMaster
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
                                object UniLabel30: TUniLabel
                                  Left = 3
                                  Top = 1
                                  Width = 13
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Kg'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock300: TUniContainerPanel
                                Tag = 1
                                Left = 627
                                Top = 73
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-3]]'
                                ParentColor = False
                                TabOrder = 10
                                DesignSize = (
                                  150
                                  48)
                                object UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit
                                  Left = 3
                                  Top = 16
                                  Width = 144
                                  Height = 29
                                  Hint = ''
                                  DataField = 'CARRETAM3'
                                  DataSource = dsMaster
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
                                object UniLabel33: TUniLabel
                                  Left = 3
                                  Top = 1
                                  Width = 18
                                  Height = 15
                                  Hint = ''
                                  Caption = 'M3'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock310: TUniContainerPanel
                                Tag = 1
                                Left = 3
                                Top = 134
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-2]]'
                                ParentColor = False
                                TabOrder = 11
                                DesignSize = (
                                  150
                                  48)
                                object UniDBEdit9: TUniDBEdit
                                  Left = 4
                                  Top = 16
                                  Width = 146
                                  Height = 29
                                  Hint = ''
                                  DataField = 'PLACAREBOQUE'
                                  DataSource = dsMaster
                                  Anchors = [akLeft, akTop, akRight]
                                  TabOrder = 1
                                end
                                object UniLabel21: TUniLabel
                                  Left = 2
                                  Top = 1
                                  Width = 47
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Reboque'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock320: TUniContainerPanel
                                Tag = 1
                                Left = 159
                                Top = 134
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-2]]'
                                ParentColor = False
                                TabOrder = 12
                                DesignSize = (
                                  150
                                  48)
                                object UniDBComboBox5: TUniDBComboBox
                                  Left = 1
                                  Top = 16
                                  Width = 145
                                  Height = 29
                                  Hint = ''
                                  Anchors = [akLeft, akTop, akRight]
                                  DataField = 'ESTADOREBOQUE'
                                  DataSource = dsMaster
                                  Style = csDropDownList
                                  Items.Strings = (
                                    'SP'
                                    'PR'
                                    'MT'
                                    'MS'
                                    'SC'
                                    'RJ'
                                    'TO'
                                    'PA'
                                    'AM'
                                    'AC'
                                    'PB'
                                    'RN'
                                    'SE'
                                    'PE'
                                    'MG'
                                    'ES'
                                    'RO'
                                    'AP'
                                    'AL'
                                    'CE'
                                    'BA'
                                    'DF'
                                    'GO'
                                    'MA'
                                    'NO'
                                    'RS'
                                    'PI'
                                    'RR'
                                    'EX'
                                    'BR'
                                    '')
                                  ItemIndex = 0
                                  TabOrder = 1
                                  IconItems = <>
                                end
                                object UniLabel25: TUniLabel
                                  Left = 2
                                  Top = 1
                                  Width = 37
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Estado'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock330: TUniContainerPanel
                                Tag = 1
                                Left = 315
                                Top = 134
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-2]]'
                                ParentColor = False
                                TabOrder = 13
                                DesignSize = (
                                  150
                                  48)
                                object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
                                  Left = 3
                                  Top = 16
                                  Width = 144
                                  Height = 29
                                  Hint = ''
                                  DataField = 'REBOQUETARA'
                                  DataSource = dsMaster
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
                                object UniLabel28: TUniLabel
                                  Left = 2
                                  Top = 1
                                  Width = 37
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Estado'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock340: TUniContainerPanel
                                Tag = 1
                                Left = 471
                                Top = 134
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-3]]'
                                ParentColor = False
                                TabOrder = 14
                                DesignSize = (
                                  150
                                  48)
                                object UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit
                                  Left = 3
                                  Top = 16
                                  Width = 144
                                  Height = 29
                                  Hint = ''
                                  DataField = 'REBOQUEKG'
                                  DataSource = dsMaster
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
                                object UniLabel31: TUniLabel
                                  Left = 3
                                  Top = 1
                                  Width = 13
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Kg'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock350: TUniContainerPanel
                                Tag = 1
                                Left = 627
                                Top = 134
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-3]]'
                                ParentColor = False
                                TabOrder = 15
                                DesignSize = (
                                  150
                                  48)
                                object UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit
                                  Left = 3
                                  Top = 16
                                  Width = 144
                                  Height = 29
                                  Hint = ''
                                  DataField = 'REBOQUEM3'
                                  DataSource = dsMaster
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
                                object UniLabel34: TUniLabel
                                  Left = 3
                                  Top = 1
                                  Width = 18
                                  Height = 15
                                  Hint = ''
                                  Caption = 'M3'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                            end
                          end
                          object UniTabSheetsegurador: TUniTabSheet
                            Hint = ''
                            Caption = 'Seguradora'
                            ExplicitLeft = 0
                            ExplicitTop = 0
                            ExplicitWidth = 256
                            ExplicitHeight = 128
                            object UniContainerPanel6: TUniContainerPanel
                              Left = 0
                              Top = 0
                              Width = 928
                              Height = 342
                              Hint = ''
                              ParentColor = False
                              Align = alClient
                              TabOrder = 0
                              object rcBlock360: TUniContainerPanel
                                Left = 3
                                Top = 12
                                Width = 150
                                Height = 48
                                Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                                ParentColor = False
                                TabOrder = 1
                                DesignSize = (
                                  150
                                  48)
                                object UniDBEdit11: TUniDBEdit
                                  Left = 2
                                  Top = 17
                                  Width = 147
                                  Height = 29
                                  Hint = ''
                                  DataField = 'NOMESEGURADORA'
                                  DataSource = dsMaster
                                  Anchors = [akLeft, akTop, akRight]
                                  TabOrder = 1
                                end
                                object UniLabel37: TUniLabel
                                  Left = 3
                                  Top = 1
                                  Width = 97
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Nome Seguradora'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock370: TUniContainerPanel
                                Tag = 1
                                Left = 4
                                Top = 76
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-4]]'
                                ParentColor = False
                                TabOrder = 2
                                DesignSize = (
                                  150
                                  48)
                                object UniDBEdit12: TUniDBEdit
                                  Left = 2
                                  Top = 17
                                  Width = 147
                                  Height = 29
                                  Hint = ''
                                  DataField = 'APOLICE'
                                  DataSource = dsMaster
                                  Anchors = [akLeft, akTop, akRight]
                                  TabOrder = 1
                                end
                                object UniLabel38: TUniLabel
                                  Left = 3
                                  Top = 1
                                  Width = 41
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Ap'#243'lice'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock380: TUniContainerPanel
                                Tag = 1
                                Left = 197
                                Top = 76
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-4]]'
                                ParentColor = False
                                TabOrder = 3
                                DesignSize = (
                                  150
                                  48)
                                object UniDBEdit13: TUniDBEdit
                                  Left = 2
                                  Top = 17
                                  Width = 147
                                  Height = 29
                                  Hint = ''
                                  DataField = 'CNPJSEGURADORA'
                                  DataSource = dsMaster
                                  Anchors = [akLeft, akTop, akRight]
                                  TabOrder = 1
                                end
                                object UniLabel39: TUniLabel
                                  Left = 3
                                  Top = 1
                                  Width = 25
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Cnpj'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                              object rcBlock390: TUniContainerPanel
                                Tag = 1
                                Left = 383
                                Top = 76
                                Width = 150
                                Height = 48
                                Hint = '[[cols:xs-12 sm-12 md-4]]'
                                ParentColor = False
                                TabOrder = 4
                                DesignSize = (
                                  150
                                  48)
                                object UniDBEdit14: TUniDBEdit
                                  Left = 2
                                  Top = 17
                                  Width = 147
                                  Height = 29
                                  Hint = ''
                                  DataField = 'AVERBACAO'
                                  DataSource = dsMaster
                                  Anchors = [akLeft, akTop, akRight]
                                  TabOrder = 1
                                end
                                object UniLabel40: TUniLabel
                                  Left = 3
                                  Top = 1
                                  Width = 58
                                  Height = 15
                                  Hint = ''
                                  Caption = 'Averba'#231#227'o'
                                  ParentFont = False
                                  Font.Height = -13
                                  Font.Name = 'Calibri'
                                  TabOrder = 2
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      inherited paSearchFilters: TUniPanel
        inherited UniScrollBox1: TUniScrollBox
          ScrollHeight = 746
          ScrollWidth = 164
          inherited paSearchBtn: TUniContainerPanel
            inherited btnSearchCRUD: TUniBitBtn
              ScreenMask.Target = Owner
            end
          end
        end
      end
    end
  end
  inherited ed_FormOrigin: TUniEdit
    TabOrder = 21
  end
  object UniMemolog: TUniMemo [26]
    Left = 988
    Top = 3
    Width = 29
    Height = 22
    Hint = ''
    Visible = False
    Lines.Strings = (
      'UniMemolog')
    TabOrder = 3
  end
  inherited sqlSearchMaster: TFDQuery
    AfterOpen = PesquisaAfterOpen
  end
  inherited sqlMaster: TFDQuery
    AfterOpen = MasterAfterOpen
    BeforeEdit = MasterBeforeEdit
  end
  object TB_MANIFESTO: TFDMemTable
    BeforeInsert = ItensBeforeEdit
    BeforeEdit = ItensBeforeEdit
    BeforePost = ItensBeforePost
    AfterPost = TB_MANIFESTOAfterPost
    BeforeDelete = ItensBeforeEdit
    AfterDelete = TB_MANIFESTOAfterDelete
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 727
    Top = 6
    object TB_MANIFESTONUMERO: TStringField
      FieldName = 'NUMERO'
    end
    object TB_MANIFESTOCHAVE: TStringField
      FieldName = 'CHAVE'
      Size = 50
    end
    object TB_MANIFESTOIBGE: TIntegerField
      FieldName = 'IBGE'
    end
    object TB_MANIFESTOCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object TB_MANIFESTOESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object TB_MANIFESTOPESOLIQUIDO: TFloatField
      FieldName = 'PESOLIQUIDO'
      DisplayFormat = '##,###,##0.00'
      EditFormat = '### ### ##0.00;-### ### ##0.00;0'
    end
    object TB_MANIFESTOPESOBRUTO: TFloatField
      FieldName = 'PESOBRUTO'
      DisplayFormat = '##,###,##0.00'
      EditFormat = '### ### ##0.00;-### ### ##0.00;0'
    end
    object TB_MANIFESTOTIPO: TStringField
      FieldName = 'TIPO'
      Size = 15
    end
    object TB_MANIFESTOSTATUS: TStringField
      FieldName = 'STATUS'
    end
    object TB_MANIFESTOTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object TB_MANIFESTOCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
    end
    object TB_MANIFESTObuscanota: TStringField
      FieldName = 'buscanota'
      ReadOnly = True
      OnGetText = TB_MANIFESTObuscanotaGetText
    end
    object TB_MANIFESTOexcluinota: TStringField
      FieldName = 'excluinota'
      ReadOnly = True
      OnGetText = TB_MANIFESTOexcluinotaGetText
    end
    object TB_MANIFESTObuscaentrega: TStringField
      FieldName = 'buscaentrega'
      ReadOnly = True
    end
  end
  object DS_MANIFESTO: TDataSource
    DataSet = TB_MANIFESTO
    Left = 812
    Top = 534
  end
  object UniPopupMenudetalhes: TUniPopupMenu
    Left = 663
    Top = 6
    object L1: TUniMenuItem
      Caption = 'Log do Movimento'
      ImageIndex = 27
      OnClick = L1Click
    end
  end
  object UniPopupMenuopcoes: TUniPopupMenu
    Left = 695
    Top = 6
    object E1: TUniMenuItem
      Caption = 'Envio Eletr'#244'nico'
      ImageIndex = 24
      OnClick = E1Click
    end
    object E2: TUniMenuItem
      Caption = 'Encerra Manifesto de Terceiros'
      ImageIndex = 68
      OnClick = E2Click
    end
  end
  object UniScreenMask1: TUniScreenMask
    AttachedControl = btnNewReg
    Enabled = True
    Left = 592
  end
end
