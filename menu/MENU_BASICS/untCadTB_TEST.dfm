inherited FrmCadTB_TEST: TFrmCadTB_TEST
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
              Left = 10
              Top = 10
              Width = 111
              Height = 60
              Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
              ParentColor = False
              TabOrder = 1
              DesignSize = (
                111
                60)
              object rcLabel10: TUniLabel
                Left = 0
                Top = 0
                Width = 186
                Height = 18
                Hint = ''
                Caption = 'C'#243'd. Filial'
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object edIDFILIAL: TUniDBNumberEdit
                Left = 0
                Top = 21
                Width = 110
                Height = 38
                Hint = ''
                DataField = 'IDFILIAL'
                DataSource = dsMaster
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                TabOrder = 2
                DecimalSeparator = ','
              end
            end
            object rcBlock20: TUniContainerPanel
              Tag = 1
              Left = 130
              Top = 10
              Width = 111
              Height = 60
              Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
              ParentColor = False
              TabOrder = 2
              DesignSize = (
                111
                60)
              object rcLabel20: TUniLabel
                Left = 0
                Top = 0
                Width = 196
                Height = 18
                Hint = ''
                Caption = 'C'#243'd. Produto'
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object edIDPROD: TUniDBNumberEdit
                Left = 0
                Top = 21
                Width = 110
                Height = 38
                Hint = ''
                DataField = 'IDPROD'
                DataSource = dsMaster
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                TabOrder = 2
                DecimalSeparator = ','
              end
            end
            object rcBlock30: TUniContainerPanel
              Tag = 1
              Left = 250
              Top = 10
              Width = 111
              Height = 60
              Hint = '[['#13#10'cols:xs-12 sm-12 md-8'#13#10']]'
              ParentColor = False
              TabOrder = 3
              DesignSize = (
                111
                60)
              object rcLabel30: TUniLabel
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
              object edDESCRICAO: TUniDBEdit
                Left = 0
                Top = 21
                Width = 110
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
              end
            end
          end
        end
      end
      inherited paSearchFilters: TUniPanel
        inherited UniScrollBox1: TUniScrollBox
          ScrollHeight = 1066
          ScrollWidth = 164
          ScrollY = 320
          inherited labTitleSearch: TUniLabel
            Top = -310
            ExplicitTop = -310
          end
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
  inherited sqlMaster: TFDQuery
    SQL.Strings = (
      'select * from tb_test')
  end
end
