inherited frmCadMOVCAIXA: TfrmCadMOVCAIXA
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
          ExplicitTop = 24
          ExplicitWidth = 924
          ExplicitHeight = 484
          inherited paBaseRegSearch: TUniContainerPanel
            ExplicitHeight = 484
          end
        end
        inherited tabRegister: TUniTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 924
          ExplicitHeight = 484
          inherited paBaseRegData1: TUniContainerPanel
            Height = 484
            ExplicitHeight = 484
            ScrollHeight = 965
            ScrollWidth = 1361
            object rcBlock10: TUniContainerPanel
              Tag = 1
              Left = 16
              Top = 21
              Width = 176
              Height = 48
              Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
              ParentColor = False
              TabOrder = 0
              DesignSize = (
                176
                48)
              object UniLabel5: TUniLabel
                Left = 0
                Top = 0
                Width = 77
                Height = 15
                Hint = ''
                Caption = 'Data Abertura'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object UniDBDateTimePicker1: TUniDBDateTimePicker
                Left = 0
                Top = 18
                Width = 175
                Height = 28
                Hint = '[['#13#10'mask:date'#13#10']]'
                DataField = 'DATA'
                DataSource = dsMaster
                DateTime = 43596.000000000000000000
                DateFormat = 'dd/MM/yyyy'
                TimeFormat = 'HH:mm:ss'
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
              end
            end
            object rcBlock20: TUniContainerPanel
              Tag = 1
              Left = 13
              Top = 89
              Width = 176
              Height = 48
              Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
              ParentColor = False
              TabOrder = 1
              DesignSize = (
                176
                48)
              object UniLabel6: TUniLabel
                Left = 0
                Top = 0
                Width = 46
                Height = 15
                Hint = ''
                Caption = 'ID Caixa'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object UniDBEdit1: TUniDBEdit
                Left = 0
                Top = 18
                Width = 175
                Height = 28
                Hint = ''
                DataField = 'CAIXA_ID'
                DataSource = dsMaster
                CharCase = ecUpperCase
                Alignment = taRightJustify
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 2
              end
            end
            object rcBlock30: TUniContainerPanel
              Tag = 1
              Left = 220
              Top = 89
              Width = 176
              Height = 48
              Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
              ParentColor = False
              TabOrder = 2
              DesignSize = (
                176
                48)
              object UniLabel10: TUniLabel
                Left = 0
                Top = 0
                Width = 29
                Height = 15
                Hint = ''
                Caption = 'Valor'
                ParentFont = False
                Font.Height = -13
                Font.Name = 'Calibri'
                TabOrder = 1
              end
              object UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit
                Left = 0
                Top = 18
                Width = 175
                Height = 28
                Hint = ''
                DataField = 'SALDO_INI'
                DataSource = dsMaster
                Alignment = taRightJustify
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                DecimalSeparator = ','
                ThousandSeparator = '.'
              end
            end
            object rcBlock15: TUniContainerPanel
              Tag = 1
              Left = 227
              Top = 17
              Width = 230
              Height = 47
              Hint = '[['#13#10'cols:xs-12 sm-12 md-10 |'#13#10'hide:mobile'#13#10']]'
              ParentColor = False
              TabOrder = 4
            end
          end
        end
      end
      inherited paSearchFilters: TUniPanel
        ExplicitHeight = 484
        inherited UniScrollBox1: TUniScrollBox
          ExplicitHeight = 484
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
    end
  end
  inherited ed_FormOrigin: TUniEdit
    TabOrder = 7
  end
  inherited ed_FormOrigin_Tab: TUniEdit
    TabOrder = 8
  end
  inherited ed_Table_Status: TUniEdit
    TabOrder = 6
  end
  inherited ed_Order_Search: TUniEdit
    TabOrder = 3
  end
  inherited ed_Where_Search: TUniEdit
    TabOrder = 4
  end
  inherited ed_CodMaster: TUniEdit
    TabOrder = 5
  end
  inherited sqlMaster: TFDQuery
    SQL.Strings = (
      'select * from movcaixa')
  end
end
