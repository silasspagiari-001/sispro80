inherited frmcadPONTOS: TfrmcadPONTOS
  Font.Height = -15
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseTop: TUniContainerPanel
      inherited paBaseTopTitle: TUniContainerPanel
        inherited labTitleForm: TUniLabel
          Width = 208
          Caption = 'Lan'#195#167'amento de Pontos'
          ExplicitWidth = 208
        end
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
                    Width = 74
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'TIPO'
                    Title.Caption = 'TIPO'
                    Width = 60
                    Font.Name = 'Calibri'
                    Alignment = taCenter
                  end
                  item
                    FieldName = 'DATA'
                    Title.Caption = 'Emiss'#227'o'
                    Width = 74
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'NUMERO'
                    Title.Caption = 'NUMERO'
                    Width = 70
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'SERIE'
                    Title.Caption = 'SERIE'
                    Width = 60
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'LOTESEMENTE'
                    Title.Caption = 'LOTE'
                    Width = 70
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'BOLETIM'
                    Title.Caption = 'BOLETIM'
                    Width = 100
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'TERMO'
                    Title.Caption = 'TERMO'
                    Width = 100
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'PUREZA'
                    Title.Caption = 'PUREZA'
                    Width = 100
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'PRODUTO'
                    Title.Caption = 'PRODUTO'
                    Width = 60
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'QUANTIDADE'
                    Title.Caption = 'QUANTIDADE'
                    Width = 70
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
              Left = 0
              Top = 0
              Width = 1315
              Height = 965
              Hint = ''
              Align = alClient
              TabOrder = 0
              DesignSize = (
                1313
                963)
              ScrollHeight = 570
              ScrollWidth = 969
              object rcBlock2: TUniContainerPanel
                Tag = 1
                AlignWithMargins = True
                Left = 15
                Top = 15
                Width = 954
                Height = 210
                Hint = 
                  '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'round:no | '#13#10'cls:card-info-box-wh' +
                  'ite |'#13#10']]'
                Margins.Left = 15
                Margins.Top = 15
                Margins.Right = 15
                Margins.Bottom = 10
                ParentColor = False
                TabOrder = 0
                object rcBlock3: TUniContainerPanel
                  Left = 0
                  Top = 0
                  Width = 954
                  Height = 36
                  Hint = '[['#13#10'cols:12 |'#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                  ParentColor = False
                  Color = clSilver
                  TabOrder = 1
                  DesignSize = (
                    954
                    36)
                  object labRcCollapseGeneral: TUniLabel
                    Left = 920
                    Top = 8
                    Width = 10
                    Height = 26
                    Hint = '[['#13#10'collapse:rcBlock2 off-50 '#13#10']]'
                    TextConversion = txtHTML
                    Caption = '^'
                    Anchors = [akTop, akRight]
                    ParentFont = False
                    Font.Height = -21
                    Font.Name = 'Calibri'
                    ParentColor = False
                    Color = clBlack
                    TabOrder = 1
                  end
                  object UniLabel1: TUniLabel
                    AlignWithMargins = True
                    Left = 6
                    Top = 6
                    Width = 154
                    Height = 19
                    Hint = '[['#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
                    Caption = 'Dados da Opera'#195#167#195#163'o'
                    ParentFont = False
                    Font.Color = clGray
                    Font.Height = -16
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    TabOrder = 2
                  end
                end
                object rcBlock10: TUniContainerPanel
                  Tag = 1
                  Left = 10
                  Top = 50
                  Width = 100
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-1]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    100
                    60)
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
                    TabOrder = 1
                  end
                  object edCodigo: TUniDBEdit
                    Left = 0
                    Top = 21
                    Width = 100
                    Height = 32
                    Hint = ''
                    DataField = 'CODIGO'
                    DataSource = dsMaster
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clWhite
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    TabOrder = 2
                    Color = clGray
                    ReadOnly = True
                  end
                end
                object rcBlock20: TUniContainerPanel
                  Tag = 1
                  Left = 120
                  Top = 50
                  Width = 200
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-8]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    200
                    60)
                  object UniLabel15: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 44
                    Height = 15
                    Hint = ''
                    Caption = 'Produto'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edLkpPRODUTOS: TUniDBEdit
                    Left = 0
                    Top = 21
                    Width = 200
                    Height = 32
                    Hint = 
                      '[['#13#10'DESCRICAO PRODUTO |'#13#10'lkpfilter-empty:Selecione uma Opera'#231#227'o<' +
                      'translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-gridattr: |'#13#10'valid:bl' +
                      'ank |'#13#10'valid-required:top-in |'#13#10']]'#13#10#13#10#13#10
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    Color = clInfoBk
                    ReadOnly = True
                    OnExit = edLkpPRODUTOSExit
                  end
                end
                object rcBlock40: TUniContainerPanel
                  Tag = 1
                  Left = 690
                  Top = 50
                  Width = 150
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 4
                  DesignSize = (
                    150
                    60)
                  object UniLabel6: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 50
                    Height = 15
                    Hint = ''
                    Caption = 'Cadastro'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBDateTimePicker2: TUniDBDateTimePicker
                    Left = 0
                    Top = 21
                    Width = 150
                    Height = 32
                    Hint = ''
                    DataField = 'DATA'
                    DataSource = dsMaster
                    DateTime = 46290.000000000000000000
                    DateFormat = 'dd/MM/yyyy'
                    TimeFormat = 'HH:mm:ss'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                  end
                end
                object rcBlock50: TUniContainerPanel
                  Tag = 1
                  Left = 10
                  Top = 120
                  Width = 180
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    180
                    60)
                  object UniLabel4: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 54
                    Height = 15
                    Hint = ''
                    Caption = 'Opera'#231#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edLkpOPERACOES: TUniDBEdit
                    Left = 0
                    Top = 21
                    Width = 180
                    Height = 32
                    Hint = 
                      '[['#13#10'DESCRICAO OPERACAO |'#13#10'lkpfilter-empty:Selecione uma Opera'#231#227'o' +
                      '<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-gridattr: |'#13#10'valid:b' +
                      'lank |'#13#10'valid-required:top-in |'#13#10']]'#13#10#13#10
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    Color = clInfoBk
                    ReadOnly = True
                    OnExit = edLkpOPERACOESExit
                  end
                end
                object rcBlock60: TUniContainerPanel
                  Tag = 1
                  Left = 200
                  Top = 120
                  Width = 150
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 6
                  DesignSize = (
                    150
                    60)
                  object UniLabel5: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 43
                    Height = 15
                    Hint = ''
                    Caption = 'Numero'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit1: TUniDBEdit
                    Tag = 1
                    Left = 0
                    Top = 21
                    Width = 150
                    Height = 32
                    Hint = ''
                    DataField = 'NUMERO'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock70: TUniContainerPanel
                  Tag = 1
                  Left = 360
                  Top = 120
                  Width = 120
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 7
                  DesignSize = (
                    120
                    60)
                  object UniLabel7: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 27
                    Height = 15
                    Hint = ''
                    Caption = 'Serie'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBComboBox2: TUniDBComboBox
                    Tag = 1
                    Left = 0
                    Top = 21
                    Width = 120
                    Height = 32
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'SERIE'
                    DataSource = dsMaster
                    Style = csDropDownList
                    Items.Strings = (
                      'PTS'
                      'PED'
                      'ORC'
                      'NOC'
                      'NFE'
                      'PRD')
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    IconItems = <>
                  end
                end
                object rcBlock80: TUniContainerPanel
                  Tag = 1
                  Left = 490
                  Top = 120
                  Width = 120
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 8
                  DesignSize = (
                    120
                    60)
                  object UniLabel8: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 22
                    Height = 15
                    Hint = ''
                    Caption = 'Seq.'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit3: TUniDBEdit
                    Left = 0
                    Top = 21
                    Width = 120
                    Height = 32
                    Hint = ''
                    DataField = 'SEQUENCIA'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock90: TUniContainerPanel
                  Tag = 1
                  Left = 620
                  Top = 120
                  Width = 130
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 9
                  DesignSize = (
                    130
                    60)
                  object UniLabel9: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 45
                    Height = 15
                    Hint = ''
                    Caption = 'Atualiza'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBComboBox1: TUniDBComboBox
                    Tag = 1
                    Left = 0
                    Top = 21
                    Width = 130
                    Height = 32
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'TIPO'
                    DataSource = dsMaster
                    Style = csDropDownList
                    Items.Strings = (
                      'ENTRADA'
                      'SAIDA')
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    IconItems = <>
                  end
                end
              end
              object rcBlock5: TUniContainerPanel
                Tag = 1
                AlignWithMargins = True
                Left = 15
                Top = 240
                Width = 954
                Height = 330
                Hint = 
                  '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'round:no | '#13#10'cls:card-info-box-wh' +
                  'ite |'#13#10']]'
                Margins.Left = 15
                Margins.Top = 15
                Margins.Right = 15
                Margins.Bottom = 10
                ParentColor = False
                TabOrder = 1
                DesignSize = (
                  954
                  330)
                object rcBlock6: TUniContainerPanel
                  Left = 0
                  Top = 0
                  Width = 954
                  Height = 36
                  Hint = '[['#13#10'cols:12 |'#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                  ParentColor = False
                  Color = clSilver
                  TabOrder = 1
                  DesignSize = (
                    954
                    36)
                  object UniLabel2: TUniLabel
                    Left = 920
                    Top = 8
                    Width = 10
                    Height = 26
                    Hint = '[['#13#10'collapse:rcBlock5 off-50 '#13#10']]'
                    TextConversion = txtHTML
                    Caption = '^'
                    Anchors = [akTop, akRight]
                    ParentFont = False
                    Font.Height = -21
                    Font.Name = 'Calibri'
                    ParentColor = False
                    Color = clBlack
                    TabOrder = 1
                  end
                  object UniLabel11: TUniLabel
                    AlignWithMargins = True
                    Left = 6
                    Top = 6
                    Width = 186
                    Height = 19
                    Hint = '[['#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
                    Caption = 'DADOS DO LOTE E PONTOS'
                    ParentFont = False
                    Font.Color = clGray
                    Font.Height = -16
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    TabOrder = 2
                  end
                end
                object rcBlock100: TUniContainerPanel
                  Tag = 1
                  Left = 10
                  Top = 50
                  Width = 180
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    180
                    60)
                  object UniLabel10: TUniLabel
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
                  object edLkpSEMENTES: TUniDBEdit
                    Left = 0
                    Top = 21
                    Width = 180
                    Height = 32
                    Hint = 
                      '[['#13#10'LOTE searchonly |'#13#10'getsearchfield:NOME |'#13#10'lkpfilter-empty:Se' +
                      'lecione um lote<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-grida' +
                      'ttr: |'#13#10'valid:blank |'#13#10'valid-required:top-in |'#13#10']]'#13#10#13#10#13#10
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    Color = clInfoBk
                    ReadOnly = True
                    OnClick = edLkpSEMENTESClick
                    OnExit = edLkpSEMENTESExit
                  end
                end
                object rcBlock110: TUniContainerPanel
                  Tag = 1
                  Left = 200
                  Top = 50
                  Width = 150
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    150
                    60)
                  object UniLabel111: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 41
                    Height = 15
                    Hint = ''
                    Caption = 'Boletim'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit2: TUniDBEdit
                    Left = 0
                    Top = 21
                    Width = 150
                    Height = 32
                    Hint = ''
                    DataField = 'BOLETIM'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock120: TUniContainerPanel
                  Tag = 1
                  Left = 360
                  Top = 50
                  Width = 150
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 4
                  DesignSize = (
                    150
                    60)
                  object UniLabel12: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 33
                    Height = 15
                    Hint = ''
                    Caption = 'Termo'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit4: TUniDBEdit
                    Left = 0
                    Top = 21
                    Width = 150
                    Height = 32
                    Hint = ''
                    DataField = 'TERMO'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock130: TUniContainerPanel
                  Tag = 1
                  Left = 520
                  Top = 50
                  Width = 150
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    150
                    60)
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
                    Left = 0
                    Top = 21
                    Width = 150
                    Height = 32
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'CATEGORIA'
                    DataSource = dsMaster
                    Style = csDropDownList
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    IconItems = <>
                  end
                end
                object rcBlock140: TUniContainerPanel
                  Tag = 1
                  Left = 10
                  Top = 120
                  Width = 120
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 6
                  DesignSize = (
                    120
                    60)
                  object UniLabel14: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 64
                    Height = 15
                    Hint = ''
                    Caption = 'Quantidade'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEditdescontos: TUniDBFormattedNumberEdit
                    Left = 0
                    Top = 21
                    Width = 120
                    Height = 32
                    Hint = ''
                    DataField = 'QUANTIDADE'
                    DataSource = dsMaster
                    Alignment = taCenter
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clRed
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock150: TUniContainerPanel
                  Tag = 1
                  Left = 140
                  Top = 120
                  Width = 120
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 7
                  DesignSize = (
                    120
                    60)
                  object UniLabel17: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 49
                    Height = 15
                    Hint = ''
                    Caption = '% Pureza'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                    Left = 0
                    Top = 21
                    Width = 120
                    Height = 32
                    Hint = ''
                    DataField = 'PUREZA'
                    DataSource = dsMaster
                    Alignment = taCenter
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clRed
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                    OnExit = UniDBFormattedNumberEdit1Exit
                  end
                end
                object rcBlock160: TUniContainerPanel
                  Tag = 1
                  Left = 270
                  Top = 120
                  Width = 120
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 8
                  DesignSize = (
                    120
                    60)
                  object UniLabel18: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 26
                    Height = 15
                    Hint = ''
                    Caption = '% VC'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit
                    Left = 0
                    Top = 21
                    Width = 120
                    Height = 32
                    Hint = ''
                    DataField = 'VALORCULTURAL'
                    DataSource = dsMaster
                    Alignment = taCenter
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clRed
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock170: TUniContainerPanel
                  Tag = 1
                  Left = 400
                  Top = 120
                  Width = 120
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 9
                  DesignSize = (
                    120
                    60)
                  object UniLabel19: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 67
                    Height = 15
                    Hint = ''
                    Caption = 'Germina'#231#227'o'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit
                    Left = 0
                    Top = 21
                    Width = 120
                    Height = 32
                    Hint = ''
                    DataField = 'GERMINACAO'
                    DataSource = dsMaster
                    Alignment = taCenter
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clRed
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock180: TUniContainerPanel
                  Tag = 1
                  Left = 530
                  Top = 120
                  Width = 120
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 10
                  DesignSize = (
                    120
                    60)
                  object UniLabel20: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 38
                    Height = 15
                    Hint = ''
                    Caption = 'Pontos'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit
                    Left = 0
                    Top = 21
                    Width = 120
                    Height = 32
                    Hint = ''
                    DataField = 'PONTOS'
                    DataSource = dsMaster
                    Alignment = taCenter
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Color = clRed
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock260: TUniContainerPanel
                  Tag = 1
                  Left = 10
                  Top = 190
                  Width = 850
                  Height = 110
                  Hint = '[[cols:xs-12 sm-12 md-12]]'
                  ParentColor = False
                  TabOrder = 11
                  DesignSize = (
                    850
                    110)
                  object UniLabel28: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 71
                    Height = 15
                    Hint = ''
                    Caption = 'Observa'#231#245'es'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBMemo1: TUniDBMemo
                    Left = 0
                    Top = 21
                    Width = 850
                    Height = 80
                    Hint = ''
                    DataField = 'OBSERVACOES'
                    DataSource = dsMaster
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 2
                  end
                end
              end
              object UniDBEditLOTESEMENTE: TUniDBEdit
                Left = 135
                Top = 633
                Width = 150
                Height = 32
                Hint = ''
                Visible = False
                DataField = 'LOTESEMENTE'
                DataSource = dsMaster
                CharCase = ecUpperCase
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                TabOrder = 2
              end
              object UniDBEditDESCRICAO: TUniDBEdit
                Left = 303
                Top = 636
                Width = 150
                Height = 32
                Hint = ''
                Visible = False
                DataField = 'DESCRICAO'
                DataSource = dsMaster
                CharCase = ecUpperCase
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                TabOrder = 3
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
  inherited dsMaster: TDataSource
    Left = 876
    Top = 415
  end
  inherited sqlSearchMaster: TFDQuery
    Left = 247
    Top = 297
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'PONTOS'
  end
  inherited FDQryCad: TFDQuery
    Left = 297
    Top = 598
  end
  inherited dscrud: TDataSource
    Left = 219
    Top = 558
  end
  inherited FDQryFiltro: TFDQuery
    SQL.Strings = (
      'SELECT * FROM PONTOS'
      '')
    object FDQryFiltroKEY: TStringField
      FieldName = 'KEY'
      Origin = '"KEY"'
      Required = True
      Size = 38
    end
    object FDQryFiltroCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
    end
    object FDQryFiltroDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object FDQryFiltroCANCELADA: TStringField
      FieldName = 'CANCELADA'
      Origin = 'CANCELADA'
      Size = 1
    end
    object FDQryFiltroEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      Required = True
    end
    object FDQryFiltroDOCUMENTO: TIntegerField
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
      Required = True
    end
    object FDQryFiltroNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Required = True
    end
    object FDQryFiltroSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      Required = True
      Size = 3
    end
    object FDQryFiltroSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Origin = 'SEQUENCIA'
      Required = True
    end
    object FDQryFiltroOPERACAO: TIntegerField
      FieldName = 'OPERACAO'
      Origin = 'OPERACAO'
      Required = True
    end
    object FDQryFiltroMATERIAPRIMA: TStringField
      FieldName = 'MATERIAPRIMA'
      Origin = 'MATERIAPRIMA'
      Size = 2
    end
    object FDQryFiltroCOMPOSICAO: TStringField
      FieldName = 'COMPOSICAO'
      Origin = 'COMPOSICAO'
      Size = 1
    end
    object FDQryFiltroTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      OnGetText = FDQryFiltroTIPOGetText
      Size = 10
    end
    object FDQryFiltroPRODUTO: TIntegerField
      FieldName = 'PRODUTO'
      Origin = 'PRODUTO'
      Required = True
    end
    object FDQryFiltroDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 80
    end
    object FDQryFiltroPESSOA: TIntegerField
      FieldName = 'PESSOA'
      Origin = 'PESSOA'
    end
    object FDQryFiltroQUANTIDADE: TFMTBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Precision = 18
      Size = 3
    end
    object FDQryFiltroDESCARTE: TFMTBCDField
      FieldName = 'DESCARTE'
      Origin = 'DESCARTE'
      Precision = 18
      Size = 2
    end
    object FDQryFiltroPUREZA: TFMTBCDField
      FieldName = 'PUREZA'
      Origin = 'PUREZA'
      Precision = 18
      Size = 3
    end
    object FDQryFiltroGERMINACAO: TFMTBCDField
      FieldName = 'GERMINACAO'
      Origin = 'GERMINACAO'
      Precision = 18
      Size = 2
    end
    object FDQryFiltroPONTOS: TFMTBCDField
      FieldName = 'PONTOS'
      Origin = 'PONTOS'
      Precision = 18
      Size = 2
    end
    object FDQryFiltroVALORCULTURAL: TFMTBCDField
      FieldName = 'VALORCULTURAL'
      Origin = 'VALORCULTURAL'
      Precision = 18
      Size = 2
    end
    object FDQryFiltroFICHA: TIntegerField
      FieldName = 'FICHA'
      Origin = 'FICHA'
    end
    object FDQryFiltroOBSERVACOES: TStringField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      Size = 50
    end
    object FDQryFiltroMAQUINA: TStringField
      FieldName = 'MAQUINA'
      Origin = 'MAQUINA'
      Size = 10
    end
    object FDQryFiltroSAFRA: TIntegerField
      FieldName = 'SAFRA'
      Origin = 'SAFRA'
    end
    object FDQryFiltroSEQLOTE: TIntegerField
      FieldName = 'SEQLOTE'
      Origin = 'SEQLOTE'
    end
    object FDQryFiltroLOTESEMENTE: TStringField
      FieldName = 'LOTESEMENTE'
      Origin = 'LOTESEMENTE'
    end
    object FDQryFiltroBOLETIM: TStringField
      FieldName = 'BOLETIM'
      Origin = 'BOLETIM'
    end
    object FDQryFiltroTERMO: TStringField
      FieldName = 'TERMO'
      Origin = 'TERMO'
      Size = 10
    end
    object FDQryFiltroCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      Origin = 'CATEGORIA'
      Size = 10
    end
    object FDQryFiltroCAMPO: TStringField
      FieldName = 'CAMPO'
      Origin = 'CAMPO'
      Size = 10
    end
    object FDQryFiltroCOOPERANTE: TIntegerField
      FieldName = 'COOPERANTE'
      Origin = 'COOPERANTE'
    end
    object FDQryFiltroSAFRACAMPO: TStringField
      FieldName = 'SAFRACAMPO'
      Origin = 'SAFRACAMPO'
      Size = 10
    end
    object FDQryFiltroUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object FDQryFiltroLOTEENTRADA: TStringField
      FieldName = 'LOTEENTRADA'
      Origin = 'LOTEENTRADA'
    end
    object FDQryFiltroPROPORCAO: TFMTBCDField
      FieldName = 'PROPORCAO'
      Origin = 'PROPORCAO'
      Precision = 18
      Size = 2
    end
    object FDQryFiltroPESOSACO: TFMTBCDField
      FieldName = 'PESOSACO'
      Origin = 'PESOSACO'
      Precision = 18
      Size = 2
    end
    object FDQryFiltroSAFRAVALIDA: TStringField
      FieldName = 'SAFRAVALIDA'
      Origin = 'SAFRAVALIDA'
      Size = 10
    end
    object FDQryFiltroVALOR_PONTO: TFMTBCDField
      FieldName = 'VALOR_PONTO'
      Origin = 'VALOR_PONTO'
      Precision = 18
      Size = 5
    end
    object FDQryFiltroBATIDA: TStringField
      FieldName = 'BATIDA'
      Origin = 'BATIDA'
      Size = 10
    end
    object FDQryFiltroPENEIRA: TStringField
      FieldName = 'PENEIRA'
      Origin = 'PENEIRA'
      Size = 10
    end
    object FDQryFiltroQTEPESO: TFMTBCDField
      FieldName = 'QTEPESO'
      Origin = 'QTEPESO'
      Precision = 18
      Size = 2
    end
    object FDQryFiltroPUREZAENTRADA: TFMTBCDField
      FieldName = 'PUREZAENTRADA'
      Origin = 'PUREZAENTRADA'
      Precision = 18
      Size = 2
    end
    object FDQryFiltroVCENTRADA: TFMTBCDField
      FieldName = 'VCENTRADA'
      Origin = 'VCENTRADA'
      Precision = 18
      Size = 2
    end
    object FDQryFiltroGERMINACAOENTRADA: TFMTBCDField
      FieldName = 'GERMINACAOENTRADA'
      Origin = 'GERMINACAOENTRADA'
      Precision = 18
      Size = 2
    end
  end
  inherited FDQryCaddetails: TFDQuery
    Left = 361
    Top = 103
  end
  inherited dscruddetails: TDataSource
    Left = 195
    Top = 55
  end
end
