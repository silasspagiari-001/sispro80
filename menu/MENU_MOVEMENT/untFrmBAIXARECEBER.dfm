inherited frmBAIXARECEBER: TfrmBAIXARECEBER
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 610
      ScrollWidth = 37
    end
    inherited pgBaseCadControl: TUniPageControl
      inherited tabSearch: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 975
        ExplicitHeight = 582
        inherited paBaseRegSearch: TUniContainerPanel
          ExplicitHeight = 582
          inherited paSearchFilters: TUniPanel
            ExplicitHeight = 582
            inherited UniScrollBox1: TUniScrollBox
              ExplicitHeight = 582
              ScrollHeight = 446
              ScrollWidth = 262
            end
          end
        end
      end
    end
  end
  inherited sqlSearchMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'RECEBER'
  end
end
