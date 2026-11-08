inherited frmCadFORNECEDORES: TfrmCadFORNECEDORES
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 538
      ScrollWidth = 37
      inherited paP: TUniContainerPanel
        inherited btnSearch: TUniBitBtn
          Top = 1
          ExplicitTop = 1
        end
      end
    end
    inherited paBaseCadControl: TUniContainerPanel
      inherited pgBaseCadControl: TUniPageControl
        ActivePage = tabRegister
        inherited tabRegister: TUniTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 935
          ExplicitHeight = 515
          inherited paBaseRegData1: TUniContainerPanel
            ScrollHeight = 515
            ScrollWidth = 935
            object pgComplementData: TUniPageControl
              Left = 0
              Top = 0
              Width = 935
              Height = 515
              Hint = ''
              Margins.Left = 10
              Margins.Top = 10
              Margins.Right = 10
              Margins.Bottom = 10
              ActivePage = tabGeral
              Align = alClient
              TabOrder = 1
              object tabGeral: TUniTabSheet
                Hint = ''
                Caption = 'Geral'
                object sboxTab1: TUniScrollBox
                  Left = 0
                  Top = 0
                  Width = 927
                  Height = 485
                  Hint = ''
                  Align = alClient
                  TabOrder = 0
                  ScrollHeight = 70
                  ScrollWidth = 522
                  object rcBlock10: TUniContainerPanel
                    Tag = 1
                    Left = 11
                    Top = 10
                    Width = 100
                    Height = 60
                    Hint = '[[cols:xs-6 sm-6 md-2 lg-2 xl-2]]'
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
                    object UniLabel1: TUniLabel
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
                  object rcBlock80: TUniContainerPanel
                    Tag = 1
                    Left = 146
                    Top = 10
                    Width = 376
                    Height = 60
                    Hint = '[[cols:xs-12 sm-12 md-8]]'
                    ParentColor = False
                    TabOrder = 1
                    DesignSize = (
                      376
                      60)
                    object UniLabel3: TUniLabel
                      Left = 0
                      Top = 0
                      Width = 104
                      Height = 15
                      Hint = ''
                      Caption = 'Nome'
                      ParentFont = False
                      Font.Height = -13
                      Font.Name = 'Calibri'
                      TabOrder = 1
                    end
                    object UniDBEdit1: TUniDBEdit
                      Left = 0
                      Top = 21
                      Width = 375
                      Height = 38
                      Hint = '[[valid:blank=Nome]]'
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
              end
            end
          end
        end
      end
      inherited paSearchFilters: TUniPanel
        Height = 484
        ExplicitHeight = 484
        inherited UniScrollBox1: TUniScrollBox
          Height = 484
          ExplicitHeight = 484
          DesignSize = (
            306
            482)
          ScrollHeight = 798
          ScrollWidth = 164
          ScrollY = 316
          inherited paSearchFilterDate: TUniContainerPanel
            Top = 251
            ExplicitTop = 251
          end
          inherited paSearchFilter1: TUniContainerPanel
            Top = -267
            ExplicitTop = -267
          end
          inherited paSearchContent1: TUniContainerPanel
            Top = -147
            ExplicitTop = -147
          end
          inherited paSearchFilter2: TUniContainerPanel
            Top = 11
            ExplicitTop = 11
          end
          inherited paSearchContent2: TUniContainerPanel
            Top = 132
            ExplicitTop = 132
          end
          inherited paSearchFilterAndOr: TUniContainerPanel
            Top = -49
            ExplicitTop = -49
          end
          inherited labTitleSearch: TUniLabel
            Top = -306
            ExplicitTop = -306
          end
          inherited paSearchFilterPeriod: TUniContainerPanel
            Top = 193
            ExplicitTop = 193
          end
          inherited paSearchFilterPeriodSelect: TUniContainerPanel
            Top = 314
            ExplicitTop = 314
          end
          inherited paSearchBtn: TUniContainerPanel
            Top = 446
            ExplicitTop = 446
          end
        end
      end
    end
  end
  inherited hpForActionBtns: TUniHiddenPanel
    object edHiddenCompanyID: TUniDBEdit
      Left = 9
      Top = 18
      Width = 15
      Height = 22
      Hint = ''
      Visible = False
      DataField = 'codiemp'
      DataSource = dsMaster
      CharCase = ecUpperCase
      ParentFont = False
      Font.Height = -13
      Font.Name = 'Calibri'
      TabOrder = 1
      ReadOnly = True
      InputType = 'search'
    end
  end
  inherited sqlMaster: TFDQuery
    SQL.Strings = (
      'SELECT'
      ''
      'tab.* '
      ''
      'FROM  fornecedores  tab'
      '')
  end
end
