inherited frmCADBENEFICIAMENTO: TfrmCADBENEFICIAMENTO
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
          inherited paBaseRegSearch: TUniContainerPanel
            inherited paGridOffset: TUniContainerPanel
              inherited dbgSearchCRUD: TUniDBGrid
                Columns = <
                  item
                    FieldName = 'CODIGO'
                    Title.Caption = 'CODIGO'
                    Width = 60
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'SERIE'
                    Title.Caption = 'SERIE'
                    Width = 60
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'LOGIN'
                    Title.Caption = 'LOGIN'
                    Width = 300
                    Font.Name = 'Calibri'
                  end>
              end
            end
          end
        end
        inherited tabRegister: TUniTabSheet
          inherited paBaseRegData1: TUniContainerPanel
            ScrollHeight = 965
            ScrollWidth = 1315
            object UniScrollBox2: TUniScrollBox
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 1309
              Height = 959
              Hint = ''
              Align = alClient
              TabOrder = 0
              ScrollHeight = 441
              ScrollWidth = 962
              object rcBlock10: TUniContainerPanel
                Tag = 1
                Left = 3
                Top = 3
                Width = 150
                Height = 48
                Hint = '[[cols:xs-12 sm-12 md-3]]'
                ParentColor = False
                TabOrder = 0
                DesignSize = (
                  150
                  48)
                object UniLabel3: TUniLabel
                  Left = 3
                  Top = 0
                  Width = 38
                  Height = 15
                  Hint = ''
                  Caption = 'C'#243'digo'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
                object edCodigo: TUniDBEdit
                  Left = 3
                  Top = 18
                  Width = 144
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
                  TabOrder = 2
                  Color = clGray
                  ReadOnly = True
                end
              end
              object rcBlock20: TUniContainerPanel
                Tag = 1
                Left = 196
                Top = 3
                Width = 150
                Height = 48
                Hint = '[[cols:xs-12 sm-12 md-3]]'
                ParentColor = False
                TabOrder = 1
                DesignSize = (
                  150
                  48)
                object UniDBEditDESCRICAOPRODUTO: TUniDBEdit
                  Left = 1
                  Top = 18
                  Width = 144
                  Height = 29
                  Hint = ''
                  DataField = 'SERIE'
                  DataSource = dscrud
                  CharCase = ecUpperCase
                  Anchors = [akLeft, akTop, akRight]
                  ParentFont = False
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWhite
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  Font.Style = [fsBold]
                  TabOrder = 1
                  Color = clGray
                  ReadOnly = True
                end
                object UniLabel13: TUniLabel
                  Left = 1
                  Top = 0
                  Width = 27
                  Height = 15
                  Hint = ''
                  Caption = 'Serie'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                end
              end
              object rcBlock30: TUniContainerPanel
                Tag = 1
                Left = 382
                Top = 3
                Width = 150
                Height = 48
                Hint = '[[cols:xs-12 sm-12 md-3]]'
                ParentColor = False
                TabOrder = 2
                DesignSize = (
                  150
                  48)
                object UniLabel6: TUniLabel
                  Left = 1
                  Top = 0
                  Width = 46
                  Height = 15
                  Hint = ''
                  Caption = 'Emiss'#227'o'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 1
                end
                object UniDBDateTimePicker2: TUniDBDateTimePicker
                  Tag = 1
                  Left = 1
                  Top = 18
                  Width = 144
                  Height = 29
                  Hint = ''
                  DataField = 'EMISSAO'
                  DataSource = dscrud
                  DateTime = 44561.000000000000000000
                  DateFormat = 'dd/MM/yyyy'
                  TimeFormat = 'HH:mm:ss'
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                end
              end
              object rcBlock40: TUniContainerPanel
                Tag = 1
                Left = 558
                Top = 2
                Width = 150
                Height = 48
                Hint = '[[cols:xs-12 sm-12 md-3]]'
                ParentColor = False
                TabOrder = 3
                DesignSize = (
                  150
                  48)
                object UniDBEdit1: TUniDBEdit
                  Left = 3
                  Top = 19
                  Width = 144
                  Height = 29
                  Hint = ''
                  DataField = 'LOGIN'
                  DataSource = dscrud
                  CharCase = ecUpperCase
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 1
                  ReadOnly = True
                end
                object UniLabel4: TUniLabel
                  Left = 3
                  Top = 1
                  Width = 44
                  Height = 15
                  Hint = ''
                  Caption = 'Usu'#225'rio'
                  ParentFont = False
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  TabOrder = 2
                end
              end
              object rcBlock50: TUniContainerPanel
                Left = 3
                Top = 61
                Width = 959
                Height = 380
                Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                ParentColor = False
                TabOrder = 4
                object UniDBGridbeneficiamento: TUniDBGrid
                  Left = 0
                  Top = 0
                  Width = 959
                  Height = 380
                  Hint = ''
                  DataSource = dsdetalhes
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgTabs, dgAutoRefreshRow]
                  WebOptions.Paged = False
                  LoadMask.Message = 'Carregando Item(s)...'
                  ForceFit = True
                  Align = alClient
                  Font.Color = clBlack
                  Font.Height = -13
                  Font.Name = 'Calibri'
                  ParentFont = False
                  TabOrder = 1
                  Summary.Enabled = True
                  OnCellClick = UniDBGridbeneficiamentoCellClick
                  Columns = <
                    item
                      FieldName = 'buscanota'
                      Title.Caption = ' '
                      Width = 30
                      Font.Color = clBlack
                      Font.Name = 'Calibri'
                      Alignment = taCenter
                    end
                    item
                      FieldName = 'NOTA'
                      Title.Caption = 'NOTA'
                      Width = 60
                      Font.Color = clBlack
                      Font.Name = 'Calibri'
                      Alignment = taCenter
                    end
                    item
                      FieldName = 'SERIE'
                      Title.Caption = 'SERIE'
                      Width = 50
                      Font.Color = clBlack
                      Font.Name = 'Calibri'
                      Alignment = taCenter
                    end
                    item
                      FieldName = 'SEQITENS'
                      Title.Caption = 'SEQ'
                      Width = 30
                      Font.Color = clBlack
                      Font.Name = 'Calibri'
                      Alignment = taCenter
                    end
                    item
                      FieldName = 'PRODUTO'
                      Title.Caption = 'PRODUTO'
                      Width = 60
                      Font.Color = clBlack
                      Font.Name = 'Calibri'
                    end
                    item
                      FieldName = 'DESCRICAO'
                      Title.Caption = 'DESCRICAO'
                      Width = 100
                      Font.Color = clBlack
                      Font.Name = 'Calibri'
                    end
                    item
                      FieldName = 'QTENOTA'
                      Title.Caption = 'QTE NOTA'
                      Width = 74
                      Font.Color = clBlack
                      Font.Name = 'Calibri'
                    end
                    item
                      FieldName = 'montagem'
                      Title.Caption = ' '
                      Width = 30
                      Font.Color = clBlack
                      Font.Name = 'Calibri'
                      Alignment = taCenter
                    end
                    item
                      FieldName = 'LOTEDESTINO'
                      Title.Caption = 'LOTE'
                      Width = 144
                      Font.Color = clBlack
                      Font.Name = 'Calibri'
                    end
                    item
                      FieldName = 'BOLETIMDESTINO'
                      Title.Caption = 'BOLETIM'
                      Width = 144
                      Font.Color = clBlack
                      Font.Name = 'Calibri'
                    end
                    item
                      FieldName = 'QUANTIDADE'
                      Title.Caption = 'LAN'#199'ADO'
                      Width = 74
                      Font.Color = clBlack
                      Font.Name = 'Calibri'
                    end
                    item
                      FieldName = 'exclui'
                      Title.Caption = ' '
                      Width = 30
                      Font.Color = clBlack
                      Font.Name = 'Calibri'
                      Alignment = taCenter
                    end>
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
      inherited paSearchFiltersCustom: TUniPanel
        inherited sboxSearchFiltersCustom: TUniScrollBox
          ScrollHeight = 33
        end
      end
    end
  end
  inherited sqlSearchMaster: TFDQuery
    SQL.Strings = (
      'select * from beneficiamento'
      '')
  end
  inherited sqlMaster: TFDQuery
    SQL.Strings = (
      'select * from beneficiamento where codigo = :codigo'
      '')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  inherited FDQryCad: TFDQuery
    UpdateOptions.UpdateTableName = 'BENEFICIAMENTO'
    SQL.Strings = (
      'select * from beneficiamento where codigo = :codigo')
    ParamData = <
      item
        Name = 'CODIGO'
        ParamType = ptInput
        Value = Null
      end>
  end
  inherited FDQryFiltro: TFDQuery
    SQL.Strings = (
      'select * from beneficiamento')
  end
  inherited dscruddetails: TDataSource
    Left = 251
    Top = 167
  end
  inherited tbdetalhes: TFDMemTable
    object tbdetalhesNOTA: TIntegerField
      FieldName = 'NOTA'
    end
    object tbdetalhesPESSOA: TIntegerField
      FieldName = 'PESSOA'
    end
    object tbdetalhesSERIE: TStringField
      FieldName = 'SERIE'
    end
    object tbdetalhesPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
    end
    object tbdetalhesSEQITENS: TIntegerField
      FieldName = 'SEQITENS'
    end
    object tbdetalhesDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object tbdetalhesLOTE: TStringField
      FieldName = 'LOTE'
    end
    object tbdetalhesQTENOTA: TFloatField
      FieldName = 'QTENOTA'
    end
    object tbdetalhesGERNOTA: TFloatField
      FieldName = 'GERNOTA'
    end
    object tbdetalhesPUREZANOTA: TFloatField
      FieldName = 'PUREZANOTA'
    end
    object tbdetalhesQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object tbdetalhesVCNOTA: TFloatField
      FieldName = 'VCNOTA'
    end
    object tbdetalhesVALORCULTURAL: TFloatField
      FieldName = 'VALORCULTURAL'
    end
    object tbdetalhesGERMINACAO: TFloatField
      FieldName = 'GERMINACAO'
    end
    object tbdetalhesPUREZA: TFloatField
      FieldName = 'PUREZA'
    end
    object tbdetalhesLOTEDESTINO: TStringField
      FieldName = 'LOTEDESTINO'
    end
    object tbdetalhesBOLETIMDESTINO: TStringField
      FieldName = 'BOLETIMDESTINO'
    end
    object tbdetalhesDESCARTE: TFloatField
      FieldName = 'DESCARTE'
    end
    object tbdetalhesPONTOS: TFloatField
      FieldName = 'PONTOS'
    end
    object tbdetalhesDISPONIVEL: TFloatField
      FieldName = 'DISPONIVEL'
    end
    object tbdetalhesTERMO: TStringField
      FieldName = 'TERMO'
    end
    object tbdetalhesCOOPERANTE: TIntegerField
      FieldName = 'COOPERANTE'
    end
    object tbdetalhesCAMPO: TStringField
      FieldName = 'CAMPO'
    end
    object tbdetalhesSAFRACAMPO: TStringField
      FieldName = 'SAFRACAMPO'
    end
    object tbdetalhesbuscanota: TStringField
      FieldName = 'buscanota'
      OnGetText = tbdetalhesbuscanotaGetText
      Size = 1
    end
    object tbdetalhesdetalhesnota: TStringField
      FieldName = 'detalhesnota'
      Size = 1
    end
    object tbdetalhesbuscalote: TStringField
      FieldName = 'buscalote'
      OnGetText = tbdetalhesbuscaloteGetText
      Size = 1
    end
    object tbdetalhesexclui: TStringField
      FieldName = 'exclui'
      OnGetText = tbdetalhesexcluiGetText
      Size = 1
    end
    object tbdetalhesMAQUINA: TIntegerField
      FieldName = 'MAQUINA'
    end
    object tbdetalhesmontagem: TStringField
      FieldName = 'montagem'
      OnGetText = tbdetalhesmontagemGetText
      Size = 1
    end
    object tbdetalhesCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
    end
  end
end
