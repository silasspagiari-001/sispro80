inherited frmCadMARCAS_CRUD2: TfrmCadMARCAS_CRUD2
  inherited paBaseBackGround: TUniContainerPanel
    inherited sboxPg: TUniScrollBox
      ScrollHeight = 618
      ScrollWidth = 886
      inherited pgBaseCadControl: TUniPageControl
        inherited tabSearch: TUniTabSheet
          inherited sboxTabSearch: TUniScrollBox
            ScrollHeight = 1278
            ScrollWidth = 839
            ScrollY = 292
            inherited rcBlock5: TUniContainerPanel
              Top = 125
              ExplicitTop = 125
            end
            inherited rcBlock20: TUniContainerPanel
              Top = 125
              ExplicitTop = 125
            end
            inherited rcBlock30: TUniContainerPanel
              Top = 125
              ExplicitTop = 125
              inherited btnQuickSearch: TUniBitBtn
                ScreenMask.Target = Owner
              end
            end
            inherited rcBlock300: TUniContainerPanel
              Top = 317
              ExplicitTop = 317
            end
            inherited rcBlock310: TUniContainerPanel
              Top = 317
              ExplicitTop = 317
            end
            inherited rcBlock40: TUniContainerPanel
              Top = 184
              ExplicitTop = 184
              inherited rcBlock294: TUniContainerPanel
                Top = 71
                ExplicitTop = 71
                inherited btnSearchAdv: TUniBitBtn
                  ScreenMask.Target = Owner
                end
              end
              inherited rcBlock296: TUniContainerPanel
                Top = 72
                ExplicitTop = 72
              end
              inherited rcBlock297: TUniContainerPanel
                Top = 72
                ExplicitTop = 72
              end
              inherited rcBlock298: TUniContainerPanel
                TabOrder = 6
              end
              object rcBlock50: TUniContainerPanel
                Tag = 1
                Left = 9
                Top = 10
                Width = 120
                Height = 57
                Hint = '[['#13#10'cols:xs-12 sm-12 md-2'#13#10']]'
                ParentColor = False
                TabOrder = 4
                DesignSize = (
                  120
                  57)
                object rcLabel420: TUniLabel
                  Left = 0
                  Top = 0
                  Width = 33
                  Height = 13
                  Hint = ''
                  Caption = 'C'#243'digo'
                  ParentFont = False
                  TabOrder = 1
                end
                object edSearchID: TUniEdit
                  Left = 0
                  Top = 17
                  Width = 119
                  Height = 38
                  Hint = ''
                  CharCase = ecUpperCase
                  Text = ''
                  ParentFont = False
                  Font.Height = -15
                  Font.Name = 'Calibri'
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 2
                end
              end
              object rcBlock100: TUniContainerPanel
                Left = 683
                Top = 12
                Width = 120
                Height = 57
                Hint = '[['#13#10'cols:xs-12 sm-12 md-10|'#13#10'hide:mobile'#13#10']]'
                ParentColor = False
                TabOrder = 5
              end
            end
            inherited rcBlock420: TUniContainerPanel
              Top = 688
              ExplicitTop = 688
            end
            inherited rcBlock10: TUniContainerPanel
              Top = 125
              ExplicitTop = 125
              inherited btnEditRec: TUniBitBtn
                ScreenMask.Target = Owner
              end
            end
            inherited rcBlock15: TUniContainerPanel
              Top = 125
              ExplicitTop = 125
            end
          end
        end
        inherited tabRegister: TUniTabSheet
          inherited sboxTabReg: TUniScrollBox
            ScrollHeight = 188
            ScrollWidth = 412
            object rcBlock1000: TUniContainerPanel
              Tag = 1
              Left = 11
              Top = 53
              Width = 100
              Height = 60
              Hint = '[['#13#10'cols:xs-6 sm-6 md-2 lg-2 xl-2 |'#13#10']]'#13#10#13#10#13#10
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
                Hint = #13#10
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
              object UniLabel3Clone: TUniLabel
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
            object rcBlock1060: TUniContainerPanel
              Tag = 1
              Left = 36
              Top = 128
              Width = 376
              Height = 60
              Hint = '[['#13#10'cols:xs-12 sm-12 md-6|'#13#10']]'
              ParentColor = False
              TabOrder = 1
              DesignSize = (
                376
                60)
              object labNome: TUniLabel
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
              object edMarca: TUniDBEdit
                Left = 0
                Top = 21
                Width = 375
                Height = 38
                Hint = '[['#13#10'valid:blank=Marca|'#13#10'valid-required:labNome'#13#10']]'
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
          inherited paBaseSaveCancel: TUniContainerPanel
            inherited rcBlock430: TUniContainerPanel
              inherited btnSaveRec: TUniBitBtn
                ScreenMask.Target = Owner
              end
            end
            inherited rcBlock440: TUniContainerPanel
              inherited btnCancelRec: TUniBitBtn
                ScreenMask.Target = Owner
              end
            end
          end
        end
      end
    end
  end
end
