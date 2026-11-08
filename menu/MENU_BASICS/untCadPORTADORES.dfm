inherited frmCADPORTADORES: TfrmCADPORTADORES
  Font.Height = -15
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
          ExplicitTop = 24
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
                    FieldName = 'CODIGO'
                    Title.Caption = 'CODIGO'
                    Width = 64
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'DESCRICAO'
                    Title.Caption = 'DESCRI'#199#195'O'
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
            object pgComplementData: TUniPageControl
              Left = 0
              Top = 0
              Width = 1315
              Height = 965
              Hint = ''
              ActivePage = tabGeral
              Align = alClient
              TabOrder = 1
              object tabGeral: TUniTabSheet
                Hint = ''
                Caption = 'Dados Gerais'
                object sboxGridBlockTab1: TUniScrollBox
                  Left = 0
                  Top = 0
                  Width = 1307
                  Height = 935
                  Hint = ''
                  Align = alClient
                  TabOrder = 0
                  ScrollHeight = 473
                  ScrollWidth = 855
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
                    object UniLabel3: TUniLabel
                      Left = 1
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
                      Left = 1
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'CODIGO'
                      DataSource = dsMaster
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
                    Width = 46
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-1]]'
                    ParentColor = False
                    TabOrder = 1
                    object UniLabel4: TUniLabel
                      Left = 8
                      Top = 0
                      Width = 27
                      Height = 15
                      Hint = ''
                      Caption = 'Ativo'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBCheckBox1: TUniDBCheckBox
                      Left = 19
                      Top = 24
                      Width = 14
                      Height = 17
                      Hint = ''
                      DataField = 'ATIVO'
                      DataSource = dsMaster
                      ValueChecked = 'T'
                      ValueUnchecked = 'F'
                      Caption = ''
                      TabOrder = 2
                      ParentColor = False
                      Color = clBtnFace
                    end
                  end
                  object rcBlock30: TUniContainerPanel
                    Tag = 1
                    Left = 372
                    Top = 3
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-9]]'
                    ParentColor = False
                    TabOrder = 2
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit1: TUniDBEdit
                      Left = 2
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'DESCRICAO'
                      DataSource = dsMaster
                      CharCase = ecUpperCase
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel5: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 55
                      Height = 15
                      Hint = ''
                      Caption = 'Descri'#231#227'o'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock40: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = 56
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 3
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit2: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'BANCO'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel6: TUniLabel
                      Left = 1
                      Top = 1
                      Width = 34
                      Height = 15
                      Hint = ''
                      Caption = 'Banco'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock50: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = 56
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 4
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit3: TUniDBEdit
                      Left = 3
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'AGENCIA'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel7: TUniLabel
                      Left = 1
                      Top = 1
                      Width = 43
                      Height = 15
                      Hint = ''
                      Caption = 'Ag'#234'ncia'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock60: TUniContainerPanel
                    Tag = 1
                    Left = 372
                    Top = 56
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 5
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit4: TUniDBEdit
                      Left = 2
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'DIGITO'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel8: TUniLabel
                      Left = 1
                      Top = 1
                      Width = 33
                      Height = 15
                      Hint = ''
                      Caption = 'Digito'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock70: TUniContainerPanel
                    Tag = 1
                    Left = 542
                    Top = 56
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-4]]'
                    ParentColor = False
                    TabOrder = 6
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit5: TUniDBEdit
                      Left = 1
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'CONTA'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel9: TUniLabel
                      Left = 1
                      Top = 1
                      Width = 82
                      Height = 15
                      Hint = ''
                      Caption = 'Conta Corrente'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock80: TUniContainerPanel
                    Tag = 1
                    Left = 705
                    Top = 56
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 7
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit6: TUniDBEdit
                      Left = 1
                      Top = 18
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'DIGITOCONTA'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel10: TUniLabel
                      Left = 1
                      Top = 1
                      Width = 55
                      Height = 15
                      Hint = ''
                      Caption = 'Digito C\C'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock90: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = 118
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 8
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit
                      Left = 3
                      Top = 19
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'TAXA'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clBlack
                      Font.Height = -13
                      TabOrder = 1
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel11: TUniLabel
                      Left = 1
                      Top = 1
                      Width = 33
                      Height = 15
                      Hint = ''
                      Caption = 'Multa'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock100: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = 118
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 9
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                      Left = 3
                      Top = 19
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'JUROS'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clBlack
                      Font.Height = -13
                      TabOrder = 1
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel12: TUniLabel
                      Left = 1
                      Top = 1
                      Width = 29
                      Height = 15
                      Hint = ''
                      Caption = 'Juros'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock110: TUniContainerPanel
                    Tag = 1
                    Left = 382
                    Top = 118
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 10
                    DesignSize = (
                      150
                      48)
                    object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
                      Left = 3
                      Top = 19
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'REMESSA'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clBlack
                      Font.Height = -13
                      TabOrder = 1
                      DecimalPrecision = 0
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                    object UniLabel13: TUniLabel
                      Left = 3
                      Top = 1
                      Width = 73
                      Height = 15
                      Hint = ''
                      Caption = 'Seq. Remessa'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock120: TUniContainerPanel
                    Tag = 1
                    Left = 558
                    Top = 117
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 11
                    DesignSize = (
                      150
                      48)
                    object UniLabel14: TUniLabel
                      Left = 3
                      Top = 2
                      Width = 33
                      Height = 15
                      Hint = ''
                      Caption = 'Limite'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
                      Left = 3
                      Top = 19
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'LIMITE'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      ParentFont = False
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clBlack
                      Font.Height = -13
                      TabOrder = 2
                      ReadOnly = True
                      DecimalSeparator = ','
                      ThousandSeparator = '.'
                    end
                  end
                  object rcBlock130: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = 178
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 12
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit7: TUniDBEdit
                      Left = 3
                      Top = 16
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'CARTEIRA'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel15: TUniLabel
                      Left = 1
                      Top = 1
                      Width = 45
                      Height = 15
                      Hint = ''
                      Caption = 'Carteira'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock140: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = 178
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 13
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit8: TUniDBEdit
                      Left = 3
                      Top = 16
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'CONVENIO'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel16: TUniLabel
                      Left = 1
                      Top = 1
                      Width = 51
                      Height = 15
                      Hint = ''
                      Caption = 'Conv'#234'nio'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock150: TUniContainerPanel
                    Tag = 1
                    Left = 372
                    Top = 178
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-2]]'
                    ParentColor = False
                    TabOrder = 14
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit9: TUniDBEdit
                      Left = 3
                      Top = 16
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'PROTESTO'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel17: TUniLabel
                      Left = 1
                      Top = 1
                      Width = 46
                      Height = 15
                      Hint = ''
                      Caption = 'Protesto'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock160: TUniContainerPanel
                    Tag = 1
                    Left = 542
                    Top = 178
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 15
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit10: TUniDBEdit
                      Left = 3
                      Top = 16
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'CODIGOTRANSMISSAO'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel18: TUniLabel
                      Left = 1
                      Top = 1
                      Width = 111
                      Height = 15
                      Hint = ''
                      Caption = 'Codigo Transmissao'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock170: TUniContainerPanel
                    Tag = 1
                    Left = 705
                    Top = 178
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-3]]'
                    ParentColor = False
                    TabOrder = 16
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit11: TUniDBEdit
                      Left = 3
                      Top = 16
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'NOSSONUMERO'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel19: TUniLabel
                      Left = 1
                      Top = 1
                      Width = 80
                      Height = 15
                      Hint = ''
                      Caption = 'Nosso Numero'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock180: TUniContainerPanel
                    Tag = 1
                    Left = 3
                    Top = 249
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-4]]'
                    ParentColor = False
                    TabOrder = 17
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit12: TUniDBEdit
                      Left = 3
                      Top = 16
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'DIRREMESSA'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel20: TUniLabel
                      Left = 1
                      Top = 1
                      Width = 239
                      Height = 15
                      Hint = ''
                      Caption = 'Caminho Remessa: Ex: \Bancoazul\Remessa'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock190: TUniContainerPanel
                    Tag = 1
                    Left = 196
                    Top = 249
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-4]]'
                    ParentColor = False
                    TabOrder = 18
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit13: TUniDBEdit
                      Left = 3
                      Top = 16
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'DIRRETORNO'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel21: TUniLabel
                      Left = 3
                      Top = 1
                      Width = 229
                      Height = 15
                      Hint = ''
                      Caption = 'Caminho Retorno: Ex: \Bancoazul\Retorno'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock200: TUniContainerPanel
                    Tag = 1
                    Left = 382
                    Top = 249
                    Width = 150
                    Height = 48
                    Hint = '[[cols:xs-12 sm-12 md-4]]'
                    ParentColor = False
                    TabOrder = 19
                    DesignSize = (
                      150
                      48)
                    object UniDBEdit14: TUniDBEdit
                      Left = 3
                      Top = 16
                      Width = 144
                      Height = 29
                      Hint = ''
                      DataField = 'DIRBOLETO'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel22: TUniLabel
                      Left = 3
                      Top = 1
                      Width = 232
                      Height = 15
                      Hint = ''
                      Caption = 'Caminho Remessa: Ex: \Bancoazul\Boletos'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock210: TUniContainerPanel
                    Left = 3
                    Top = 305
                    Width = 529
                    Height = 48
                    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                    ParentColor = False
                    TabOrder = 20
                    DesignSize = (
                      529
                      48)
                    object UniDBEdit15: TUniDBEdit
                      Left = 1
                      Top = 16
                      Width = 551
                      Height = 29
                      Hint = ''
                      DataField = 'LOCALPAGAMENTO'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel23: TUniLabel
                      Left = 3
                      Top = 1
                      Width = 110
                      Height = 15
                      Hint = ''
                      Caption = 'Local do Pagamento'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 2
                    end
                  end
                  object rcBlock220: TUniContainerPanel
                    Left = 3
                    Top = 363
                    Width = 529
                    Height = 110
                    Hint = '[['#13#10'cols:xs-12 sm-12 md-12'#13#10']]'
                    ParentColor = False
                    TabOrder = 21
                    DesignSize = (
                      529
                      110)
                    object UniDBMemo1: TUniDBMemo
                      Left = 1
                      Top = 18
                      Width = 528
                      Height = 89
                      Hint = ''
                      DataField = 'INSTRUCAO'
                      DataSource = dsMaster
                      Anchors = [akLeft, akTop, akRight]
                      TabOrder = 1
                    end
                    object UniLabel24: TUniLabel
                      Left = 3
                      Top = 1
                      Width = 53
                      Height = 15
                      Hint = ''
                      Caption = 'Instru'#231#227'o'
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
  inherited dsSearchMaster: TDataSource
    Left = 684
    Top = 567
  end
  inherited sqlSearchMaster: TFDQuery
    SQL.Strings = (
      'SELECT * FROM PORTADORES')
    Left = 767
    Top = 577
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'PORTADORES'
    SQL.Strings = (
      'SELECT * FROM PORTADORES')
  end
  inherited popMenuOptions: TUniPopupMenu
    Left = 1210
    Top = 586
  end
  inherited FDQryCad: TFDQuery
    UpdateOptions.UpdateTableName = 'PORTADORES'
    SQL.Strings = (
      'SELECT * FROM PORTADORES WHERE CODIGO = :CODIGO')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  inherited FDQryFiltro: TFDQuery
    SQL.Strings = (
      'SELECT * FROM PORTADORES')
  end
  inherited FDQryCaddetails: TFDQuery
    Left = 809
    Top = 23
  end
  inherited dscruddetails: TDataSource
    Left = 907
    Top = 31
  end
end
