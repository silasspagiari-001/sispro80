inherited frmCADSEMENTES: TfrmCADSEMENTES
  Font.Height = -15
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseTop: TUniContainerPanel
      inherited paBaseTopTitle: TUniContainerPanel
        inherited labTitleForm: TUniLabel
          Width = 189
          Caption = 'Cadastro de Sementes'
          ExplicitWidth = 189
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
        ActivePage = tabRegister
        inherited tabSearch: TUniTabSheet
          inherited paBaseRegSearch: TUniContainerPanel
            inherited paGridOffset: TUniContainerPanel
              inherited dbgSearchCRUD: TUniDBGrid
                Columns = <
                  item
                    FieldName = 'CODIGO'
                    Title.Caption = 'C'#211'DIGO'
                    Width = 80
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'TIPO'
                    Title.Caption = 'TIPO'
                    Width = 100
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'PRODUTO'
                    Title.Caption = 'PRODUTO'
                    Width = 90
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'CULTIVAR'
                    Title.Caption = 'CULTIVAR'
                    Width = 200
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'LOTE'
                    Title.Caption = 'LOTE'
                    Width = 120
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'BOLETIM'
                    Title.Caption = 'BOLETIM'
                    Width = 120
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'TERMO'
                    Title.Caption = 'TERMO'
                    Width = 120
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'CATEGORIA'
                    Title.Caption = 'CATEGORIA'
                    Width = 100
                    Font.Name = 'Calibri'
                  end
                  item
                    FieldName = 'DISPONIVEL'
                    Title.Caption = 'ESTOQUE'
                    Width = 120
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
              ScrollHeight = 733
              ScrollWidth = 979
              object UniDBDateTimePicker3: TUniDBDateTimePicker
                Left = 157
                Top = 685
                Width = 150
                Height = 32
                Hint = ''
                Visible = False
                DataField = 'VENCIMENTO'
                DataSource = dsMaster
                DateTime = 46290.000000000000000000
                DateFormat = 'dd/MM/yyyy'
                TimeFormat = 'HH:mm:ss'
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 0
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
              end
              object rcBlock2: TUniContainerPanel
                Tag = 1
                AlignWithMargins = True
                Left = 10
                Top = -33
                Width = 954
                Height = 266
                Hint = 
                  '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'round:no | '#13#10'cls:card-info-box-wh' +
                  'ite |'#13#10'/*noborder-left:mobile|*/'#13#10'/*noborder-right:mobile|*/'#13#10']]' +
                  #13#10#13#10#13#10#13#10
                Margins.Left = 15
                Margins.Top = 15
                Margins.Right = 15
                Margins.Bottom = 10
                ParentColor = False
                TabOrder = 1
                object rcBlock3: TUniContainerPanel
                  Left = -1
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
                    Hint = '[['#13#10'collapse:rcBlock2 off-50 '#13#10']]'#13#10
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
                    Width = 88
                    Height = 19
                    Hint = '[['#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
                    Margins.Left = 6
                    Margins.Top = 0
                    Margins.Right = 0
                    Margins.Bottom = 0
                    Caption = 'Dados Gerais'
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
                  Left = 6
                  Top = 55
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
                object rcBlock30: TUniContainerPanel
                  Tag = 1
                  Left = 120
                  Top = 55
                  Width = 169
                  Height = 60
                  Hint = '[[cols:xs-12 sm-6 md-2]]'
                  ParentColor = False
                  TabOrder = 3
                  object UniLabel5: TUniLabel
                    Left = 56
                    Top = 4
                    Width = 77
                    Height = 15
                    Hint = ''
                    Caption = 'Reembalada ?'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBCheckBox2: TUniDBCheckBox
                    Left = 53
                    Top = 25
                    Width = 20
                    Height = 20
                    Hint = ''
                    DataField = 'REEMBALADA'
                    DataSource = dsMaster
                    ValueChecked = 'T'
                    ValueUnchecked = 'F'
                    Caption = ''
                    TabOrder = 2
                    ParentColor = False
                    Color = clBtnFace
                  end
                  object UniLabel4: TUniLabel
                    Left = 8
                    Top = 5
                    Width = 27
                    Height = 15
                    Hint = ''
                    Caption = 'Ativo'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 3
                  end
                  object UniDBCheckBox1: TUniDBCheckBox
                    Left = 8
                    Top = 25
                    Width = 20
                    Height = 20
                    Hint = ''
                    DataField = 'ATIVO'
                    DataSource = dsMaster
                    ValueChecked = 'T'
                    ValueUnchecked = 'F'
                    Caption = ''
                    TabOrder = 4
                    ParentColor = False
                    Color = clBtnFace
                  end
                end
                object rcBlock40: TUniContainerPanel
                  Tag = 1
                  Left = 295
                  Top = 55
                  Width = 200
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-9]]'
                  ParentColor = False
                  TabOrder = 4
                  DesignSize = (
                    200
                    60)
                  object UniLabel10: TUniLabel
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
                      '[['#13#10'SEMENTENOME PRODUTO |'#13#10'lkpfilter-empty:Selecione um Remetent' +
                      'e<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-gridattr: |'#13#10'valid:' +
                      'blank |'#13#10'valid-required:top-in |'#13#10']]'
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
                object rcBlock60: TUniContainerPanel
                  Tag = 1
                  Left = -1
                  Top = 131
                  Width = 150
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    150
                    60)
                  object UniLabel6: TUniLabel
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
                  object UniDBComboBoxcultivar: TUniDBComboBox
                    Tag = 1
                    Left = 0
                    Top = 21
                    Width = 150
                    Height = 32
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'CULTIVAR'
                    DataSource = dsMaster
                    Style = csDropDownList
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    IconItems = <>
                  end
                end
                object rcBlock70: TUniContainerPanel
                  Tag = 1
                  Left = 164
                  Top = 131
                  Width = 150
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 6
                  DesignSize = (
                    150
                    60)
                  object UniLabel7: TUniLabel
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
                object rcBlock80: TUniContainerPanel
                  Tag = 1
                  Left = 329
                  Top = 131
                  Width = 150
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 7
                  DesignSize = (
                    150
                    60)
                  object UniLabel8: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 66
                    Height = 15
                    Hint = ''
                    Caption = 'Tipo do Lote'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBComboBox2: TUniDBComboBox
                    Tag = 1
                    Left = 0
                    Top = 21
                    Width = 150
                    Height = 32
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'TIPO'
                    DataSource = dsMaster
                    Style = csDropDownList
                    Items.Strings = (
                      'Aguarde'
                      'Entrada'
                      'Saida'
                      'Fiscal'
                      'Estoque')
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    IconItems = <>
                  end
                end
                object rcBlock90: TUniContainerPanel
                  Tag = 1
                  Left = 494
                  Top = 131
                  Width = 180
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 8
                  DesignSize = (
                    180
                    60)
                  object UniLabel9: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 56
                    Height = 15
                    Hint = ''
                    Caption = 'Remetente'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edLkpEMPRESAS: TUniDBEdit
                    Left = 0
                    Top = 21
                    Width = 180
                    Height = 32
                    Hint = 
                      '[['#13#10'RAZSOC REMETENTE |'#13#10'lkpfilter-empty:Selecione um Remetente<t' +
                      'ranslate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-gridattr: |'#13#10'valid:bla' +
                      'nk |'#13#10'valid-required:top-in |'#13#10']]'#13#10
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    Color = clInfoBk
                    ReadOnly = True
                  end
                end
                object rcBlock100: TUniContainerPanel
                  Tag = 1
                  Left = 684
                  Top = 131
                  Width = 180
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 9
                  DesignSize = (
                    180
                    60)
                  object UniLabel12: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 73
                    Height = 15
                    Hint = ''
                    Caption = 'Resp. T'#233'cnico'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edLkpRESPONSAVEL: TUniDBEdit
                    Left = 0
                    Top = 21
                    Width = 180
                    Height = 32
                    Hint = 
                      '[['#13#10'NOME RESPONSAVEL |'#13#10'lkpfilter-empty:Selecione um Respons'#225'vel' +
                      '<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-gridattr: |'#13#10'valid:b' +
                      'lank |'#13#10'valid-required:top-in |'#13#10']]'
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    Color = clInfoBk
                    ReadOnly = True
                  end
                end
                object rcBlock110: TUniContainerPanel
                  Tag = 1
                  Left = -1
                  Top = 201
                  Width = 180
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-12]]'
                  ParentColor = False
                  TabOrder = 10
                  DesignSize = (
                    180
                    60)
                  object UniLabel13: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 65
                    Height = 15
                    Hint = ''
                    Caption = 'Laborat'#243'rio'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edLkpLABORATORIO: TUniDBEdit
                    Left = 0
                    Top = 21
                    Width = 180
                    Height = 32
                    Hint = 
                      '[['#13#10'NOME LABORATORIO |'#13#10'lkpfilter-empty:Selecione um Laborat'#243'rio' +
                      '<translate>|'#13#10'lkpfilter-order: |'#13#10'lkpfilter-gridattr: |'#13#10'valid:b' +
                      'lank |'#13#10'valid-required:top-in |'#13#10']]'
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    Color = clInfoBk
                    ReadOnly = True
                    OnExit = edLkpLABORATORIOExit
                  end
                end
              end
              object rcBlock5: TUniContainerPanel
                Tag = 1
                AlignWithMargins = True
                Left = 15
                Top = 239
                Width = 964
                Height = 494
                Hint = 
                  '[['#13#10'cols:xs-12 sm-12 md-12 | '#13#10'round:no | '#13#10'cls:card-info-box-wh' +
                  'ite |'#13#10'/*noborder-left:mobile|*/'#13#10'/*noborder-right:mobile|*/'#13#10']]' +
                  #13#10#13#10#13#10#13#10
                Margins.Left = 15
                Margins.Top = 15
                Margins.Right = 15
                Margins.Bottom = 10
                ParentColor = False
                TabOrder = 2
                object rcBlock6: TUniContainerPanel
                  Left = -1
                  Top = 0
                  Width = 962
                  Height = 36
                  Hint = '[['#13#10'cols:12 |'#13#10'round:t | '#13#10'cls:card-light |'#13#10']]'
                  ParentColor = False
                  Color = clSilver
                  TabOrder = 1
                  DesignSize = (
                    962
                    36)
                  object UniLabel2: TUniLabel
                    Left = 928
                    Top = 8
                    Width = 10
                    Height = 26
                    Hint = '[['#13#10'collapse:rcBlock5 off-50 '#13#10']]'#13#10
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
                    Width = 188
                    Height = 19
                    Hint = '[['#13#10'center:parent y|'#13#10'pos-l:10'#13#10']]'
                    Margins.Left = 6
                    Margins.Top = 0
                    Margins.Right = 0
                    Margins.Bottom = 0
                    Caption = 'DADOS DO LOTE / BOLETIM'
                    ParentFont = False
                    Font.Color = clGray
                    Font.Height = -16
                    Font.Name = 'Calibri'
                    Font.Style = [fsBold]
                    TabOrder = 2
                  end
                end
                object rcBlock140: TUniContainerPanel
                  Tag = 1
                  Left = 24
                  Top = 66
                  Width = 150
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    150
                    60)
                  object UniLabel15: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 87
                    Height = 15
                    Hint = ''
                    Caption = 'Lote da Semente'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit3: TUniDBEdit
                    Left = 0
                    Top = 21
                    Width = 150
                    Height = 32
                    Hint = ''
                    DataField = 'LOTE'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock150: TUniContainerPanel
                  Tag = 1
                  Left = 189
                  Top = 66
                  Width = 150
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    150
                    60)
                  object UniLabel16: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 74
                    Height = 15
                    Hint = ''
                    Caption = 'N'#186' do Boletim'
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
                object rcBlock160: TUniContainerPanel
                  Tag = 1
                  Left = 354
                  Top = 66
                  Width = 180
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 4
                  DesignSize = (
                    180
                    60)
                  object UniLabel17: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 66
                    Height = 15
                    Hint = ''
                    Caption = 'N'#186' do Termo'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit5: TUniDBEdit
                    Left = 0
                    Top = 21
                    Width = 140
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
                  object Ubtngeratseqtermo: TUniButton
                    Left = 145
                    Top = 21
                    Width = 32
                    Height = 32
                    Hint = ''
                    Caption = '<i class="fas fa-cog"></i>'
                    Anchors = [akTop, akRight]
                    TabOrder = 3
                    OnClick = UbtngeratseqtermoClick
                  end
                end
                object rcBlock170: TUniContainerPanel
                  Tag = 1
                  Left = 544
                  Top = 66
                  Width = 150
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 5
                  DesignSize = (
                    150
                    60)
                  object UniLabel19: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 75
                    Height = 15
                    Hint = ''
                    Caption = 'Safra do LOTE'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit6: TUniDBEdit
                    Left = 0
                    Top = 21
                    Width = 150
                    Height = 32
                    Hint = ''
                    DataField = 'SAFRAVALIDA'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock180: TUniContainerPanel
                  Tag = 1
                  Left = 24
                  Top = 148
                  Width = 150
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 6
                  DesignSize = (
                    150
                    60)
                  object UniLabel20: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 79
                    Height = 15
                    Hint = ''
                    Caption = 'N'#186' da Amostra'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit7: TUniDBEdit
                    Left = 0
                    Top = 21
                    Width = 150
                    Height = 32
                    Hint = ''
                    DataField = 'AMOSTRA'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                end
                object rcBlock190: TUniContainerPanel
                  Tag = 1
                  Left = 189
                  Top = 148
                  Width = 150
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 7
                  DesignSize = (
                    150
                    60)
                  object UniLabel21: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 50
                    Height = 15
                    Hint = ''
                    Caption = 'Recebida'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBDateTimePicker1: TUniDBDateTimePicker
                    Left = 0
                    Top = 21
                    Width = 150
                    Height = 32
                    Hint = ''
                    DataField = 'RECEBIDA'
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
                object rcBlock200: TUniContainerPanel
                  Tag = 1
                  Left = 354
                  Top = 148
                  Width = 150
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 8
                  DesignSize = (
                    150
                    60)
                  object UniLabel22: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 48
                    Height = 15
                    Hint = ''
                    Caption = 'Validade'
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
                    DataField = 'VALIDADE'
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
                object rcBlock210: TUniContainerPanel
                  Tag = 1
                  Left = 18
                  Top = 227
                  Width = 120
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 9
                  DesignSize = (
                    120
                    60)
                  object UniLabel23: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 49
                    Height = 15
                    Hint = ''
                    Caption = 'Pureza %'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEditpureza: TUniDBFormattedNumberEdit
                    Left = 0
                    Top = 21
                    Width = 120
                    Height = 32
                    Hint = ''
                    DataField = 'ANALISEPURA'
                    DataSource = dsMaster
                    Alignment = taCenter
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock220: TUniContainerPanel
                  Tag = 1
                  Left = 172
                  Top = 227
                  Width = 120
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 10
                  DesignSize = (
                    120
                    60)
                  object UniLabel24: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 83
                    Height = 15
                    Hint = ''
                    Caption = 'Material Inerte'
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
                    DataField = 'MATINERTES'
                    DataSource = dsMaster
                    Alignment = taCenter
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock255: TUniContainerPanel
                  Tag = 1
                  Left = 51
                  Top = 308
                  Width = 120
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 11
                  DesignSize = (
                    120
                    60)
                  object UniLabel25: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 92
                    Height = 15
                    Hint = ''
                    Caption = 'Peso Embalagem'
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
                    DataField = 'PESOEMBALAGEM'
                    DataSource = dsMaster
                    Alignment = taCenter
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock205: TUniContainerPanel
                  Tag = 1
                  Left = 522
                  Top = 147
                  Width = 120
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 12
                  DesignSize = (
                    120
                    60)
                  object UniLabel26: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 42
                    Height = 15
                    Hint = ''
                    Caption = 'Peneira'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBComboBoxpeneira: TUniDBComboBox
                    Tag = 1
                    Left = 0
                    Top = 21
                    Width = 120
                    Height = 32
                    Hint = ''
                    Anchors = [akLeft, akTop, akRight]
                    DataField = 'PENEIRA'
                    DataSource = dsMaster
                    Style = csDropDownList
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    IconItems = <>
                  end
                end
                object rcBlock225: TUniContainerPanel
                  Tag = 1
                  Left = 331
                  Top = 227
                  Width = 120
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 13
                  DesignSize = (
                    120
                    60)
                  object UniLabel27: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 31
                    Height = 15
                    Hint = ''
                    Caption = 'V.C. %'
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
                    DataField = 'VALORCULTURAL'
                    DataSource = dsMaster
                    Alignment = taCenter
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock235: TUniContainerPanel
                  Tag = 1
                  Left = 464
                  Top = 227
                  Width = 120
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 14
                  DesignSize = (
                    120
                    60)
                  object UniLabel28: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 79
                    Height = 15
                    Hint = ''
                    Caption = 'Germina'#231#227'o %'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEditgerminacao: TUniDBFormattedNumberEdit
                    Left = 0
                    Top = 21
                    Width = 120
                    Height = 32
                    Hint = ''
                    DataField = 'GERNORMAIS'
                    DataSource = dsMaster
                    Alignment = taCenter
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                    OnExit = UniDBFormattedNumberEditgerminacaoExit
                  end
                end
                object rcBlock245: TUniContainerPanel
                  Tag = 1
                  Left = 614
                  Top = 227
                  Width = 120
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-2]]'
                  ParentColor = False
                  TabOrder = 15
                  DesignSize = (
                    120
                    60)
                  object UniLabel29: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 66
                    Height = 15
                    Hint = ''
                    Caption = 'Tetraz'#243'lio %'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit
                    Left = 0
                    Top = 21
                    Width = 120
                    Height = 32
                    Hint = ''
                    DataField = 'TETRAZOLIO'
                    DataSource = dsMaster
                    Alignment = taCenter
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                    OnExit = UniDBFormattedNumberEdit5Exit
                  end
                end
                object rcBlock265: TUniContainerPanel
                  Tag = 1
                  Left = 177
                  Top = 308
                  Width = 120
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 16
                  DesignSize = (
                    120
                    60)
                  object UniLabel30: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 48
                    Height = 15
                    Hint = ''
                    Caption = 'N'#186' Sacos'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit
                    Left = 0
                    Top = 21
                    Width = 115
                    Height = 32
                    Hint = ''
                    DataField = 'NSACOS'
                    DataSource = dsMaster
                    Alignment = taCenter
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock285: TUniContainerPanel
                  Tag = 1
                  Left = 419
                  Top = 308
                  Width = 120
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 17
                  DesignSize = (
                    120
                    60)
                  object UniLabel31: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 43
                    Height = 15
                    Hint = ''
                    Caption = 'Estoque'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit
                    Left = 0
                    Top = 21
                    Width = 120
                    Height = 32
                    Hint = ''
                    DataField = 'DISPONIVEL'
                    DataSource = dsMaster
                    Alignment = taCenter
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    ReadOnly = True
                    DecimalSeparator = ','
                    ThousandSeparator = '.'
                  end
                end
                object rcBlock300: TUniContainerPanel
                  Tag = 1
                  Left = 15
                  Top = 374
                  Width = 865
                  Height = 100
                  Hint = '[[cols:xs-12 sm-12 md-12]]'
                  ParentColor = False
                  TabOrder = 18
                  DesignSize = (
                    865
                    100)
                  object UniBitBtn6: TUniBitBtn
                    Left = 2
                    Top = 37
                    Width = 32
                    Height = 32
                    Hint = ''
                    Caption = '<i class="fas fa-pencil-alt"></i>'
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 1
                    OnClick = UniBitBtn6Click
                  end
                  object UniLabel32: TUniLabel
                    Left = 40
                    Top = 0
                    Width = 71
                    Height = 15
                    Hint = ''
                    Caption = 'Observa'#231#245'es'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 2
                  end
                  object UniDBMemo1: TUniDBMemo
                    Left = 40
                    Top = 21
                    Width = 825
                    Height = 70
                    Hint = ''
                    DataField = 'OBSERVACOES'
                    DataSource = dsMaster
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 3
                  end
                end
                object rcBlock275: TUniContainerPanel
                  Tag = 1
                  Left = 298
                  Top = 308
                  Width = 118
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-3]]'
                  ParentColor = False
                  TabOrder = 19
                  DesignSize = (
                    118
                    60)
                  object UniLabel18: TUniLabel
                    Left = 5
                    Top = 0
                    Width = 42
                    Height = 15
                    Hint = ''
                    Caption = 'N'#186' Nota'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit1: TUniDBEdit
                    Left = 1
                    Top = 21
                    Width = 114
                    Height = 32
                    Hint = ''
                    DataField = 'NOTA'
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
  inherited rcSweetAlert: TUniSweetAlert
    Left = 940
    Top = 12
  end
  inherited dsMaster: TDataSource
    Left = 908
    Top = 415
  end
  inherited dsSearchMaster: TDataSource
    Left = 1268
    Top = 111
  end
  inherited sqlSearchMaster: TFDQuery
    Left = 999
    Top = 265
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'SEMENTES'
    Left = 1001
    Top = 407
  end
  inherited popMenuOptions: TUniPopupMenu
    Left = 1170
    Top = 18
  end
  inherited FDSchemaAdapter1: TFDSchemaAdapter
    Left = 990
    Top = 478
  end
  inherited FDQryCad: TFDQuery
    Left = 1001
    Top = 334
  end
  inherited dscrud: TDataSource
    Left = 1003
    Top = 30
  end
  inherited FDQryFiltro: TFDQuery
    Left = 1009
    Top = 134
  end
  inherited FDQryCaddetails: TFDQuery
    Left = 1001
    Top = 199
  end
  inherited dscruddetails: TDataSource
    Left = 771
    Top = 7
  end
  inherited tbdetalhes: TFDMemTable
    Left = 997
    Top = 548
  end
  inherited dsdetalhes: TDataSource
    Left = 1245
    Top = 332
  end
  object UniPopupMenuopcoes: TUniPopupMenu
    Left = 847
    Top = 6
    object A1: TUniMenuItem
      Caption = 'Manuten'#231#227'o do Saldo Lote/BAS'
      OnClick = A1Click
    end
    object H1: TUniMenuItem
      Caption = 'Kardex do LOTE'
      OnClick = H1Click
    end
    object N3: TUniMenuItem
      Caption = '-'
    end
    object t2: TUniMenuItem
      Caption = 'Informar Termo Aditivo'
      OnClick = t2Click
    end
    object N6: TUniMenuItem
      Caption = '-'
    end
    object I3: TUniMenuItem
      Caption = 'Informa'#231#227'o Detalhada BAS'
      OnClick = I3Click
    end
    object N5: TUniMenuItem
      Caption = '-'
    end
    object R1: TUniMenuItem
      Caption = 'Recalcular Estoque'
      OnClick = R1Click
    end
    object N2: TUniMenuItem
      Caption = '-'
    end
    object I1: TUniMenuItem
      Caption = 'Impress'#227'o do Termo'
      object T1: TUniMenuItem
        Caption = 'Termo de Conformidade'
        OnClick = T1Click
      end
      object N4: TUniMenuItem
        Caption = '-'
      end
      object I2: TUniMenuItem
        Caption = 'Impress'#227'o do Termo Aditivo'
        OnClick = I2Click
      end
    end
  end
end
