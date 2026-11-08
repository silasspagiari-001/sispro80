inherited frmCadTB_COMPOUNDPK: TfrmCadTB_COMPOUNDPK
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
          inherited paBaseRegData1: TUniContainerPanel
            ScrollHeight = 965
            ScrollWidth = 1315
            object rcBlock10: TUniContainerPanel
              Tag = 1
              Left = 173
              Top = 13
              Width = 176
              Height = 60
              Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
              ParentColor = False
              TabOrder = 0
              DesignSize = (
                176
                60)
              object UniLabel5: TUniLabel
                Left = 0
                Top = 0
                Width = 96
                Height = 15
                Hint = ''
                Caption = 'Data '
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object UniDBDateTimePicker1: TUniDBDateTimePicker
                Left = 0
                Top = 21
                Width = 175
                Height = 38
                Hint = '[['#13#10'mask:date'#13#10']]'
                DataField = 'ITEMDATE'
                DataSource = dsMaster
                DateTime = 43596.000000000000000000
                DateFormat = 'dd/MM/yyyy'
                TimeFormat = 'HH:mm:ss'
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                DisabledDates = <>
              end
            end
            object rcBlock20: TUniContainerPanel
              Tag = 1
              Left = 13
              Top = 89
              Width = 176
              Height = 60
              Hint = '[['#13#10'cols:xs-12 sm-12 md-6'#13#10']]'
              ParentColor = False
              TabOrder = 1
              DesignSize = (
                176
                60)
              object UniLabel6: TUniLabel
                Left = 0
                Top = 0
                Width = 160
                Height = 15
                Hint = ''
                Caption = 'Descri'#231#227'o'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object UniDBEdit1: TUniDBEdit
                Left = 0
                Top = 21
                Width = 175
                Height = 38
                Hint = ''
                DataField = 'DESCRIPTION'
                DataSource = dsMaster
                CharCase = ecUpperCase
                Alignment = taRightJustify
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Height = -15
                Font.Name = 'Calibri'
                TabOrder = 2
              end
            end
            object rcBlock15: TUniContainerPanel
              Tag = 1
              Left = 448
              Top = 14
              Width = 230
              Height = 60
              Hint = '[['#13#10'cols:xs-12 sm-12 md-8 |'#13#10'hide:mobile'#13#10']]'
              ParentColor = False
              TabOrder = 3
            end
            object rcBlock5: TUniContainerPanel
              Tag = 1
              Left = 16
              Top = 19
              Width = 100
              Height = 60
              Hint = '[[cols:xs-6 sm-6 md-2 lg-2 xl-2]]'
              ParentColor = False
              TabOrder = 4
              DesignSize = (
                100
                60)
              object edCodigo: TUniDBEdit
                Left = 0
                Top = 21
                Width = 100
                Height = 38
                Hint = ''
                DataField = 'ID'
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
              object UniLabel3: TUniLabel
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
          end
        end
      end
      inherited paSearchFilters: TUniPanel
        inherited UniScrollBox1: TUniScrollBox
          ScrollHeight = 966
          ScrollWidth = 164
          ScrollY = 220
          inherited labTitleSearch: TUniLabel
            Top = -210
            ExplicitTop = -210
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
  inherited ed_Table_Status: TUniEdit
    TabOrder = 6
  end
  inherited ed_Order_Search: TUniEdit
    TabOrder = 8
  end
  inherited ed_Where_Search: TUniEdit
    TabOrder = 5
  end
  inherited ed_CodMaster: TUniEdit
    TabOrder = 7
  end
  inherited sqlMaster: TFDQuery
    SQL.Strings = (
      'select * from tb_compoundpk')
  end
end
