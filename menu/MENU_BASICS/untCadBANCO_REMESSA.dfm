inherited frmCADBANCO_REMESSA: TfrmCADBANCO_REMESSA
  inherited paBaseBackGround: TUniContainerPanel
    inherited paBaseButtons: TUniContainerPanel
      ScrollHeight = 610
      ScrollWidth = 37
      inherited paNAE: TUniContainerPanel
        inherited btnDeleteReg: TUniBitBtn
          ExplicitLeft = 3
        end
      end
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
              ScrollHeight = 270
              ScrollWidth = 262
            end
          end
          inherited dbgSearchCRUD: TUniDBGrid
            Columns = <
              item
                FieldName = 'KEY'
                Title.Caption = '...'
                Width = 50
                Font.Name = 'Calibri'
                Alignment = taCenter
              end
              item
                FieldName = 'CODIGO'
                Title.Caption = 'CODIGO'
                Width = 74
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'PORTADOR'
                Title.Caption = 'BANCO'
                Width = 74
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'EMISSAO'
                Title.Caption = 'EMISS'#195'O'
                Width = 74
                Font.Name = 'Calibri'
              end
              item
                FieldName = 'HORA'
                Title.Caption = 'HORA'
                Width = 74
                Font.Name = 'Calibri'
              end>
          end
        end
      end
      inherited tabRegister: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 975
        ExplicitHeight = 582
        inherited paBaseRegData1: TUniContainerPanel
          ExplicitHeight = 582
          ScrollHeight = 582
          ScrollWidth = 975
          inherited UniPageControlcadastros: TUniPageControl
            inherited UniTabSheetCRUD: TUniTabSheet
              ExplicitLeft = 4
              ExplicitTop = 24
              ExplicitWidth = 967
              ExplicitHeight = 554
              inherited UniScrollBox2: TUniScrollBox
                ExplicitLeft = 1
              end
            end
          end
        end
      end
    end
  end
  inherited sqlSearchMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'BANCO_REMESSA'
    SQL.Strings = (
      'select * from BANCO_REMESSA')
    object sqlSearchMasterKEY: TStringField
      FieldName = 'KEY'
      Origin = '"KEY"'
      OnGetText = sqlSearchMasterKEYGetText
      Size = 38
    end
    object sqlSearchMasterCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Required = True
    end
    object sqlSearchMasterEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
    end
    object sqlSearchMasterPORTADOR: TIntegerField
      FieldName = 'PORTADOR'
      Origin = 'PORTADOR'
    end
    object sqlSearchMasterEMISSAO: TDateField
      FieldName = 'EMISSAO'
      Origin = 'EMISSAO'
    end
    object sqlSearchMasterHORA: TTimeField
      FieldName = 'HORA'
      Origin = 'HORA'
    end
    object sqlSearchMasterCONTEUDO: TStringField
      FieldName = 'CONTEUDO'
      Origin = 'CONTEUDO'
      Size = 300
    end
  end
  inherited sqlMaster: TFDQuery
    UpdateOptions.UpdateTableName = 'BANCO_REMESSA'
    SQL.Strings = (
      'select * from BANCO_REMESSA where codigo = :codigo')
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
