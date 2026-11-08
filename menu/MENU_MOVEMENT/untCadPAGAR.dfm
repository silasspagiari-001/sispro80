inherited frmcadPAGAR: TfrmcadPAGAR
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
        ActivePage = tabRegister
        inherited tabSearch: TUniTabSheet
          inherited paBaseRegSearch: TUniContainerPanel
            inherited paGridOffset: TUniContainerPanel
              inherited dbgSearchCRUD: TUniDBGrid
                WebOptions.Paged = False
                Columns = <
                  item
                    FieldName = 'KEY'
                    Title.Caption = ' '
                    Width = 30
                    Visible = False
                    Font.Name = 'Calibri'
                    Alignment = taCenter
                  end
                  item
                    FieldName = 'SITUACAO'
                    Title.Caption = 'Situa'#231#227'o'
                    Width = 74
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'CODIGO'
                    Title.Caption = 'CODIGO'
                    Width = 74
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'NUMERO'
                    Title.Caption = 'Numero'
                    Width = 74
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'SERIE'
                    Title.Caption = 'Ser.'
                    Width = 25
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'SEQUENCIA'
                    Title.Caption = 'Seq.'
                    Width = 30
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'PESSOA'
                    Title.Caption = 'Pessoa'
                    Width = 74
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'NOME'
                    Title.Caption = 'Nome'
                    Width = 300
                    Font.Name = 'Calibri'
                    ReadOnly = True
                  end
                  item
                    FieldName = 'EMISSAO'
                    Title.Caption = 'Emiss'#227'o'
                    Width = 75
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'VENCIMENTO'
                    Title.Caption = 'Vencimento'
                    Width = 75
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'PAGAMENTO'
                    Title.Caption = 'Pagamento'
                    Width = 75
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'VALORATUAL'
                    Title.Caption = 'Valor Atual'
                    Width = 100
                    Font.Name = 'Calibri'
                  end>
              end
            end
          end
        end
        inherited tabRegister: TUniTabSheet
          inherited paBaseRegData1: TUniContainerPanel
            ScrollHeight = 965
            ScrollWidth = 1361
            inherited rcBlock1: TUniContainerPanel
              inherited rcBlock2: TUniContainerPanel
                inherited rcBlock54: TUniContainerPanel
                  Left = 718
                  ExplicitLeft = 718
                end
                inherited rcBlock34: TUniContainerPanel
                  Left = 503
                  Width = 114
                  ExplicitLeft = 503
                  ExplicitWidth = 114
                  inherited UniDBEditnumero: TUniDBEdit
                    Width = 111
                    ExplicitWidth = 111
                  end
                end
                inherited rcBlock24: TUniContainerPanel
                  Width = 97
                  ExplicitWidth = 97
                  inherited UniEditFONE: TUniEdit
                    Width = 90
                    ExplicitWidth = 90
                  end
                end
                inherited rcBlock58: TUniContainerPanel
                  Left = 836
                  ExplicitLeft = 836
                  inherited ContainerSituacao: TUniContainerPanel
                    DesignSize = (
                      99
                      29)
                    inherited lbSituacao: TUniLabel
                      Left = 3
                      Width = 89
                      Anchors = [akLeft, akTop, akRight]
                      ExplicitLeft = 3
                      ExplicitWidth = 89
                    end
                  end
                end
                inherited rcBlock44: TUniContainerPanel
                  Left = 623
                  ExplicitLeft = 623
                end
                inherited rcBlock86: TUniContainerPanel
                  inherited UniLabel1: TUniLabel
                    Width = 21
                    Caption = '- 0 -'
                    ExplicitWidth = 21
                  end
                  inherited UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit
                    Enabled = False
                    DataField = ''
                    DataSource = nil
                  end
                end
                object rcBlock370: TUniContainerPanel
                  Left = 13
                  Top = 344
                  Width = 908
                  Height = 57
                  Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                  ParentColor = False
                  TabOrder = 21
                  DesignSize = (
                    908
                    57)
                  object UniDBEdit1: TUniDBEdit
                    Left = 3
                    Top = 21
                    Width = 902
                    Height = 29
                    Hint = ''
                    DataField = 'CODIGOBARRAS'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 1
                    Color = clInfoBk
                  end
                  object UniLabel28: TUniLabel
                    Left = 3
                    Top = 0
                    Width = 149
                    Height = 15
                    Hint = ''
                    Caption = 'Codigo de Barras do Boleto'
                    Anchors = [akLeft, akTop, akRight]
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
      inherited paSearchFilters: TUniPanel
        inherited UniScrollBox1: TUniScrollBox
          Top = 0
          ExplicitTop = 0
          ScrollHeight = 1061
          ScrollWidth = 164
          ScrollY = 315
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
  inherited dsMaster: TDataSource
    Left = 700
    Top = 495
  end
  inherited sqlSearchMaster: TFDQuery
    SQL.Strings = (
      'SELECT  T.KEY, T.CODIGO, T.NUMERO, T.DOCUMENTO, T.CARTEIRA, '
      'T.EMPRESA, T.SERIE, T.SEQUENCIA, T.PESSOA, P.NOME, '
      'T.EMISSAO, T.VENCIMENTO, T.PAGAMENTO, T.VALORATUAL, '
      'T.VALORORIGINAL, T.VALORPAGO, T.OBSERVACOES, T.SITUACAO '
      '  FROM PAGAR T INNER JOIN PESSOAS P ON (T.PESSOA = P.CODIGO)  '
      '')
    Left = 919
    Top = 409
    object sqlSearchMasterKEY: TStringField
      FieldName = 'KEY'
      Origin = '"KEY"'
      Size = 38
    end
    object sqlSearchMasterCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlSearchMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
    end
    object sqlSearchMasterCARTEIRA: TIntegerField
      FieldName = 'CARTEIRA'
      Origin = 'CARTEIRA'
    end
    object sqlSearchMasterSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Required = True
      Size = 3
    end
    object sqlSearchMasterSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
    end
    object sqlSearchMasterPESSOA: TIntegerField
      FieldName = 'PESSOA'
      Origin = 'PESSOA'
    end
    object sqlSearchMasterNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object sqlSearchMasterEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object sqlSearchMasterVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      Origin = 'VENCIMENTO'
    end
    object sqlSearchMasterPAGAMENTO: TDateField
      FieldName = 'PAGAMENTO'
      Origin = 'PAGAMENTO'
    end
    object sqlSearchMasterVALORATUAL: TFMTBCDField
      FieldName = 'VALORATUAL'
      Origin = 'VALORATUAL'
      Precision = 18
      Size = 2
    end
    object sqlSearchMasterVALORORIGINAL: TFMTBCDField
      FieldName = 'VALORORIGINAL'
      Origin = 'VALORORIGINAL'
      Precision = 18
      Size = 2
    end
    object sqlSearchMasterVALORPAGO: TFMTBCDField
      FieldName = 'VALORPAGO'
      Origin = 'VALORPAGO'
      Precision = 18
      Size = 2
    end
    object sqlSearchMasterOBSERVACOES: TStringField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      Size = 300
    end
    object sqlSearchMasterSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      OnGetText = sqlSearchMasterSITUACAOGetText
      Size = 10
    end
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'PAGAR'
    SQL.Strings = (
      'SELECT * FROM PAGAR WHERE CODIGO = :CODIGO')
    Left = 769
    Top = 519
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object sqlMasterKEY: TStringField
      FieldName = 'KEY'
      Origin = '"KEY"'
      Required = True
      Size = 38
    end
    object sqlMasterCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
    object sqlMasterEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
    end
    object sqlMasterFINANCEIRO: TIntegerField
      FieldName = 'FINANCEIRO'
      Origin = 'FINANCEIRO'
    end
    object sqlMasterDOCUMENTO: TIntegerField
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
    end
    object sqlMasterNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
    end
    object sqlMasterSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Size = 3
    end
    object sqlMasterSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
    end
    object sqlMasterPESSOA: TIntegerField
      FieldName = 'PESSOA'
      Origin = 'PESSOA'
    end
    object sqlMasterEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object sqlMasterVENCIMENTO: TDateField
      FieldName = 'VENCIMENTO'
      Origin = 'VENCIMENTO'
    end
    object sqlMasterPAGAMENTO: TDateField
      FieldName = 'PAGAMENTO'
      Origin = 'PAGAMENTO'
    end
    object sqlMasterVALORORIGINAL: TFMTBCDField
      FieldName = 'VALORORIGINAL'
      Origin = 'VALORORIGINAL'
      Precision = 18
      Size = 2
    end
    object sqlMasterVALORATUAL: TFMTBCDField
      FieldName = 'VALORATUAL'
      Origin = 'VALORATUAL'
      Precision = 18
      Size = 2
    end
    object sqlMasterVALORDESCONTOS: TFMTBCDField
      FieldName = 'VALORDESCONTOS'
      Origin = 'VALORDESCONTOS'
      Precision = 18
      Size = 2
    end
    object sqlMasterVALORJUROS: TFMTBCDField
      FieldName = 'VALORJUROS'
      Origin = 'VALORJUROS'
      Precision = 18
      Size = 2
    end
    object sqlMasterVALORTAXAS: TFMTBCDField
      FieldName = 'VALORTAXAS'
      Origin = 'VALORTAXAS'
      Precision = 18
      Size = 2
    end
    object sqlMasterVALORPAGO: TFMTBCDField
      FieldName = 'VALORPAGO'
      Origin = 'VALORPAGO'
      Precision = 18
      Size = 2
    end
    object sqlMasterFUNCIONARIO: TIntegerField
      FieldName = 'FUNCIONARIO'
      Origin = 'FUNCIONARIO'
    end
    object sqlMasterAPLICACAO: TIntegerField
      FieldName = 'APLICACAO'
      Origin = 'APLICACAO'
    end
    object sqlMasterPORTADOR: TIntegerField
      FieldName = 'PORTADOR'
      Origin = 'PORTADOR'
    end
    object sqlMasterCODIGOBARRAS: TStringField
      FieldName = 'CODIGOBARRAS'
      Origin = 'CODIGOBARRAS'
      Size = 45
    end
    object sqlMasterSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Origin = 'SITUACAO'
      OnGetText = sqlMasterSITUACAOGetText
      Size = 10
    end
    object sqlMasterCONFIRMABOLETO: TStringField
      FieldName = 'CONFIRMABOLETO'
      Origin = 'CONFIRMABOLETO'
      Size = 1
    end
    object sqlMasterDATABOLETO: TDateField
      FieldName = 'DATABOLETO'
      Origin = 'DATABOLETO'
    end
    object sqlMasterVALORDIVERSOS: TFMTBCDField
      FieldName = 'VALORDIVERSOS'
      Origin = 'VALORDIVERSOS'
      Precision = 18
      Size = 2
    end
    object sqlMasterFRETE: TFMTBCDField
      FieldName = 'FRETE'
      Origin = 'FRETE'
      Precision = 18
      Size = 2
    end
    object sqlMasterSAFRA: TIntegerField
      FieldName = 'SAFRA'
      Origin = 'SAFRA'
    end
    object sqlMasterLOGINCLUSAO: TStringField
      FieldName = 'LOGINCLUSAO'
      Origin = 'LOGINCLUSAO'
      Size = 60
    end
    object sqlMasterLOGALTERACAO: TStringField
      FieldName = 'LOGALTERACAO'
      Origin = 'LOGALTERACAO'
      Size = 60
    end
    object sqlMasterLOGBAIXA: TStringField
      FieldName = 'LOGBAIXA'
      Origin = 'LOGBAIXA'
      Size = 60
    end
    object sqlMasterLOGPARCIAL: TStringField
      FieldName = 'LOGPARCIAL'
      Origin = 'LOGPARCIAL'
      Size = 60
    end
    object sqlMasterCARTEIRA: TIntegerField
      FieldName = 'CARTEIRA'
      Origin = 'CARTEIRA'
    end
    object sqlMasterPEDIDO: TStringField
      FieldName = 'PEDIDO'
      Origin = 'PEDIDO'
      Size = 10
    end
    object sqlMasterCOMPETENCIA: TDateField
      FieldName = 'COMPETENCIA'
      Origin = 'COMPETENCIA'
    end
    object sqlMasterOBSERVACOES: TStringField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      Size = 300
    end
    object sqlMasterCOMISSAOFUNCIONARIO: TFMTBCDField
      FieldName = 'COMISSAOFUNCIONARIO'
      Origin = 'COMISSAOFUNCIONARIO'
      Precision = 18
      Size = 2
    end
    object sqlMasterPERCCOMISSAO: TFMTBCDField
      FieldName = 'PERCCOMISSAO'
      Origin = 'PERCCOMISSAO'
      Precision = 18
      Size = 2
    end
    object sqlMasterNUMEROBOLETO: TIntegerField
      FieldName = 'NUMEROBOLETO'
      Origin = 'NUMEROBOLETO'
    end
    object sqlMasterANEXO: TStringField
      FieldName = 'ANEXO'
      Origin = 'ANEXO'
      Size = 10
    end
    object sqlMasterPLANOCONTAS: TIntegerField
      FieldName = 'PLANOCONTAS'
      Origin = 'PLANOCONTAS'
    end
  end
  object UniPopupMenuopcoes: TUniPopupMenu
    Images = dm_rc.imgl20
    Left = 783
    Top = 6
    object H1: TUniMenuItem
      Caption = 'Duplicata Mercantil '
      ImageIndex = 10
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object D1: TUniMenuItem
      Caption = 'Detalhes do Documento Emissor'
      ImageIndex = 68
    end
    object N3: TUniMenuItem
      Caption = '-'
    end
    object L1: TUniMenuItem
      Caption = 'Log dos Titulos'
      ImageIndex = 27
    end
    object N4: TUniMenuItem
      Caption = '-'
    end
    object B1: TUniMenuItem
      Caption = 'Baixa Titulo'
      OnClick = B1Click
    end
  end
end
