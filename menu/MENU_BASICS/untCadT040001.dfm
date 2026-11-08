inherited frmCadT040001: TfrmCadT040001
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
        inherited tabRegister: TUniTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 1315
          ExplicitHeight = 965
          inherited paBaseRegData1: TUniContainerPanel
            ScrollHeight = 965
            ScrollWidth = 1315
            object rcBlock10: TUniContainerPanel
              Tag = 1
              Left = 20
              Top = 15
              Width = 100
              Height = 60
              Hint = '[[cols:xs-6 sm-6 md-2]]'
              ParentColor = False
              TabOrder = 1
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
                Width = 106
                Height = 18
                Hint = ''
                Caption = 'C'#243'digo'
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                TabOrder = 2
              end
            end
            object rcBlock20: TUniContainerPanel
              Tag = 1
              Left = 139
              Top = 14
              Width = 100
              Height = 60
              Hint = '[[cols:xs-6 sm-6 md-4]]'
              ParentColor = False
              TabOrder = 2
              DesignSize = (
                100
                60)
              object UniLabel5: TUniLabel
                Left = 0
                Top = 0
                Width = 180
                Height = 18
                Hint = ''
                Caption = 'Descri'#231#227'o'
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object UniDBEdit1: TUniDBEdit
                Left = 0
                Top = 21
                Width = 100
                Height = 38
                Hint = ''
                DataField = 'DESCRICAO'
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
          end
        end
      end
      inherited paSearchFilters: TUniPanel
        Height = 484
        ExplicitHeight = 484
        inherited UniScrollBox1: TUniScrollBox
          Height = 484
          ExplicitHeight = 484
          ScrollHeight = 702
          ScrollWidth = 164
          ScrollY = 133
          inherited paSearchFilterDate: TUniContainerPanel
            Top = 397
            ExplicitTop = 397
          end
          inherited paSearchFilter1: TUniContainerPanel
            Top = -84
            ExplicitTop = -84
          end
          inherited paSearchContent1: TUniContainerPanel
            Top = 36
            ExplicitTop = 36
          end
          inherited paSearchFilter2: TUniContainerPanel
            Top = 156
            ExplicitTop = 156
          end
          inherited paSearchContent2: TUniContainerPanel
            Top = 277
            ExplicitTop = 277
          end
          inherited paSearchFilterAndOr: TUniContainerPanel
            Top = 96
            ExplicitTop = 96
          end
          inherited labTitleSearch: TUniLabel
            Top = -123
            ExplicitTop = -123
          end
          inherited paSearchFilterPeriod: TUniContainerPanel
            Top = 337
            ExplicitTop = 337
          end
          inherited paSearchFilterPeriodSelect: TUniContainerPanel
            Top = 457
            ExplicitTop = 457
          end
          inherited paSearchBtn: TUniContainerPanel
            Top = 533
            ExplicitTop = 533
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
  inherited sqlMaster: TFDQuery
    SQL.Strings = (
      'select * from t040001')
  end
end
