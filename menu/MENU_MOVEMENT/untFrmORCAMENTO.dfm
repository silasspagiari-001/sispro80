inherited frmORCAMENTO: TfrmORCAMENTO
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
        inherited btnNewReg: TUniBitBtn
          ScreenMask.Target = Owner
        end
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
          ExplicitHeight = 965
          inherited paBaseRegSearch: TUniContainerPanel
            Height = 965
            ExplicitHeight = 965
            inherited paGridOffset: TUniContainerPanel
              Height = 957
              ExplicitHeight = 957
              inherited dbgSearchCRUD: TUniDBGrid
                Height = 957
              end
            end
          end
        end
        inherited tabRegister: TUniTabSheet
          inherited paBaseRegData1: TUniContainerPanel
            Height = 965
            ScrollHeight = 965
            ScrollWidth = 1361
            inherited UniScrollBox2: TUniScrollBox
              Height = 959
              ScrollHeight = 827
              ScrollWidth = 946
              inherited rcBlock475: TUniContainerPanel
                Top = 116
                ExplicitTop = 116
              end
              inherited rcBlock480: TUniContainerPanel
                Top = 117
                ExplicitTop = 117
              end
              inherited rcBlock470: TUniContainerPanel
                Top = 117
                ExplicitTop = 117
              end
              inherited rcBlock510: TUniContainerPanel
                Top = 171
                ExplicitTop = 171
              end
              inherited rcBlock520: TUniContainerPanel
                Top = 171
                ExplicitTop = 171
              end
              inherited rcBlock530: TUniContainerPanel
                Top = 171
                ExplicitTop = 171
              end
              inherited rcBlock540: TUniContainerPanel
                Top = 170
                ExplicitTop = 170
              end
              inherited rcBlock590: TUniContainerPanel
                Top = 529
                ExplicitTop = 529
              end
              inherited rcBlock580: TUniContainerPanel
                Top = 364
                ExplicitTop = 364
              end
              inherited rcBlock570: TUniContainerPanel
                Top = 237
                ExplicitTop = 237
              end
              inherited rcBlock630: TUniContainerPanel
                Top = 747
                ExplicitTop = 747
              end
              inherited rcBlock640: TUniContainerPanel
                Top = 747
                ExplicitTop = 747
              end
              inherited rcBlock650: TUniContainerPanel
                Top = 747
                ExplicitTop = 747
              end
              inherited rcBlock660: TUniContainerPanel
                Top = 746
                ExplicitTop = 746
              end
              inherited rcBlock680: TUniContainerPanel
                Top = 743
                ExplicitTop = 743
              end
              inherited rcBlock550: TUniContainerPanel
                Left = 7
                Top = 226
                Width = 589
                Height = 132
                ExplicitLeft = 7
                ExplicitTop = 226
                ExplicitWidth = 589
                ExplicitHeight = 132
                inherited UniDBMemoobservacao: TUniDBMemo
                  Width = 583
                  Height = 126
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
  inherited UniPopupMenuopcoes: TUniPopupMenu
    object N2: TUniMenuItem
      Caption = '-'
    end
    object i3: TUniMenuItem
      Caption = 'Impress'#227'o ORC Futuro'
      ImageIndex = 52
    end
  end
end
