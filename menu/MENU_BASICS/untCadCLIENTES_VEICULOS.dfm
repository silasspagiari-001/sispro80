inherited frmCadCLIENTES_VEICULOS: TfrmCadCLIENTES_VEICULOS
  Caption = 'frmCadCLIENTES_VEICULOS'
  PixelsPerInch = 96
  TextHeight = 15
  inherited uniScrollBox1: TUniScrollBox
    inherited paBaseBackGround: TUniContainerPanel
      ScrollHeight = 648
      ScrollWidth = 958
      inherited pgBaseCadControl: TUniPageControl
        ActivePage = tabRegisterDetail
        inherited tabSearchDetail: TUniTabSheet
          inherited UniScrollBox2: TUniScrollBox
            ScrollHeight = 271
            ScrollWidth = 637
          end
        end
        inherited tabRegisterDetail: TUniTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 896
          ExplicitHeight = 465
          inherited paBaseCrudDetail: TUniContainerPanel
            inherited paDataDetail: TUniPanel
              inherited sboxGridBlockTab1: TUniScrollBox
                ScrollHeight = 144
                ScrollWidth = 390
                object rcBlock10: TUniContainerPanel
                  Tag = 1
                  Left = 20
                  Top = 15
                  Width = 100
                  Height = 60
                  Hint = '[[cols:xs-4 sm-4 md-4]]'
                  ParentColor = False
                  TabOrder = 0
                  DesignSize = (
                    100
                    60)
                  object edID: TUniDBEdit
                    Left = 0
                    Top = 21
                    Width = 100
                    Height = 38
                    Hint = ''
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
                  object UniLabel4: TUniLabel
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
                object rcBlock30: TUniContainerPanel
                  Tag = 1
                  Left = 109
                  Top = 84
                  Width = 100
                  Height = 60
                  Hint = '[[cols:xs-12 sm-12 md-6]]'
                  ParentColor = False
                  TabOrder = 1
                  DesignSize = (
                    100
                    60)
                  object UniLabel6: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 120
                    Height = 15
                    Hint = ''
                    Caption = 'Ve'#237'culo'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object edLkpCARROS: TUniDBEdit
                    Left = 0
                    Top = 21
                    Width = 100
                    Height = 38
                    Hint = '[[DESCRICAO CODICARRO ! ]]'
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    Color = clInfoBk
                    ReadOnly = True
                    InputType = 'text'
                  end
                end
                object rcBlock20: TUniContainerPanel
                  Tag = 1
                  Left = 139
                  Top = 14
                  Width = 100
                  Height = 60
                  Hint = '[[cols:xs-5 sm-5 md-4]]'
                  ParentColor = False
                  TabOrder = 2
                  DesignSize = (
                    100
                    60)
                  object UniLabel5: TUniLabel
                    Left = 0
                    Top = 0
                    Width = 101
                    Height = 15
                    Hint = ''
                    Caption = 'Placa'
                    ParentFont = False
                    Font.Height = -13
                    Font.Name = 'Calibri'
                    TabOrder = 1
                  end
                  object UniDBEdit1: TUniDBEdit
                    Left = 0
                    Top = 21
                    Width = 100
                    Height = 38
                    Hint = ''
                    DataField = 'PLACA'
                    DataSource = dsMaster
                    CharCase = ecUpperCase
                    Anchors = [akLeft, akTop, akRight]
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    TabOrder = 2
                    InputType = 'search'
                  end
                end
                object rcBlock25: TUniContainerPanel
                  Left = 268
                  Top = 15
                  Width = 122
                  Height = 60
                  Hint = '[[cols:xs-3 sm-3 md-4]]'
                  ParentColor = False
                  TabOrder = 3
                  DesignSize = (
                    122
                    60)
                  object UniDBCheckBox10: TUniDBCheckBox
                    Left = 1
                    Top = 30
                    Width = 122
                    Height = 24
                    Hint = ''
                    DataField = 'ATIVO'
                    DataSource = dsMaster
                    ValueChecked = 'S'
                    ValueUnchecked = 'N'
                    Caption = 'Ativo'
                    ParentFont = False
                    Font.Height = -15
                    Font.Name = 'Calibri'
                    Anchors = [akLeft, akTop, akRight]
                    TabOrder = 0
                    ParentColor = False
                    Color = clBtnFace
                  end
                end
              end
            end
          end
        end
      end
      inherited paBaseButtons: TUniContainerPanel
        ScrollHeight = 485
        ScrollWidth = 37
      end
    end
  end
  inherited sqlMaster: TFDQuery
    SQL.Strings = (
      'select * from clientes_veiculos')
  end
end
