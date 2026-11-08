unit untCadPRODUTOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFormCRUDPROPRIO, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniGUIClasses, uniEdit,
  uniLabel, uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniCheckBox, uniDBCheckBox, uniDBEdit, UniButtonDbEdit,
  uniDBComboBox, uniMemo, uniScreenMask, Vcl.Menus, uniMainMenu;

type
  TfrmcadPRODUTOS = class(TfrmCRUDPROPRIO)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    UniLabel7: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniDBComboBoxmedida: TUniDBComboBox;
    UniLabel4: TUniLabel;
    UniButtonDbEditGRUPOS: TUniButtonDbEdit;
    UniLabel5: TUniLabel;
    UniDBEdit6: TUniDBEdit;
    UniLabel6: TUniLabel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    UniLabel8: TUniLabel;
    UniButtonDbEditespecie: TUniButtonDbEdit;
    UniDBEdit1: TUniDBEdit;
    UniLabel9: TUniLabel;
    UniButtonDbEditcodigocultivar: TUniButtonDbEdit;
    UniLabel10: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel11: TUniLabel;
    rcBlock100: TUniContainerPanel;
    UniDBEdit3: TUniDBEdit;
    UniLabel12: TUniLabel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    rcBlock130: TUniContainerPanel;
    rcBlock140: TUniContainerPanel;
    UniDBEdit4: TUniDBEdit;
    UniLabel13: TUniLabel;
    UniDBFormattedNumberEditPERCIPI: TUniDBFormattedNumberEdit;
    UniLabel14: TUniLabel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniLabel15: TUniLabel;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    UniLabel16: TUniLabel;
    rcBlock150: TUniContainerPanel;
    UniLabel18: TUniLabel;
    rcBlock160: TUniContainerPanel;
    rcBlock170: TUniContainerPanel;
    rcBlock180: TUniContainerPanel;
    rcBlock190: TUniContainerPanel;
    UniDBComboBox1: TUniDBComboBox;
    UniLabel17: TUniLabel;
    UniDBComboBox2: TUniDBComboBox;
    UniLabel19: TUniLabel;
    UniLabel20: TUniLabel;
    UniDBComboBox3: TUniDBComboBox;
    UniDBComboBox4: TUniDBComboBox;
    UniLabel21: TUniLabel;
    rcBlock200: TUniContainerPanel;
    rcBlock210: TUniContainerPanel;
    rcBlock185: TUniContainerPanel;
    rcBlock195: TUniContainerPanel;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;
    UniLabel22: TUniLabel;
    UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit;
    UniLabel23: TUniLabel;
    UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit;
    UniLabel24: TUniLabel;
    UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit;
    UniLabel25: TUniLabel;
    rcBlock220: TUniContainerPanel;
    rcBlock230: TUniContainerPanel;
    rcBlock300: TUniContainerPanel;
    rcBlock310: TUniContainerPanel;
    UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit;
    UniLabel26: TUniLabel;
    UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit;
    UniLabel27: TUniLabel;
    rcBlock240: TUniContainerPanel;
    rcBlock250: TUniContainerPanel;
    rcBlock260: TUniContainerPanel;
    rcBlock320: TUniContainerPanel;
    UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit;
    UniLabel28: TUniLabel;
    UniDBFormattedNumberEdit10: TUniDBFormattedNumberEdit;
    UniLabel29: TUniLabel;
    FDQryFiltroCODIGO: TIntegerField;
    FDQryFiltroDESCRICAO: TStringField;
    FDQryFiltroCULTIVAR: TStringField;
    FDQryFiltroUNIDADE: TStringField;
    UniPopupMenudetalhesproduto: TUniPopupMenu;
    UniMenuItem1: TUniMenuItem;
    UniDBEdit5: TUniDBEdit;
    UniLabel30: TUniLabel;
    UniDBComboBox5: TUniDBComboBox;
    UniLabel31: TUniLabel;
    UniButtonDbEditcbnef: TUniButtonDbEdit;
    UniDBComboBox6: TUniDBComboBox;
    UniLabel32: TUniLabel;
    UniLabel33: TUniLabel;
    rcBlock270: TUniContainerPanel;
    UniLabel34: TUniLabel;
    UniButtonDbEditcbnef1: TUniButtonDbEdit;
    rcBlock280: TUniContainerPanel;
    UniLabel35: TUniLabel;
    UniButtonDbEditcbnef2: TUniButtonDbEdit;
    rcBlock290: TUniContainerPanel;
    UniLabel36: TUniLabel;
    UniButtonDbEditcbnef90: TUniButtonDbEdit;
    rcBlock295: TUniContainerPanel;
    UniLabel37: TUniLabel;
    UniButtonDbEdit1: TUniButtonDbEdit;
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure UniButtonDbEditGRUPOSButtonClick(Sender: TObject);
    procedure UniButtonDbEditGRUPOSExit(Sender: TObject);
    procedure UniButtonDbEditespecieButtonClick(Sender: TObject);
    procedure UniButtonDbEditcodigocultivarButtonClick(Sender: TObject);
    procedure UniButtonDbEditespecieExit(Sender: TObject);
    procedure UniButtonDbEditcodigocultivarExit(Sender: TObject);
    procedure FDQryFiltroUNIDADEGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure UniMenuItem1Click(Sender: TObject);
    procedure dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure UniButtonDbEditcbnefButtonClick(Sender: TObject);
    procedure UniButtonDbEditcbnef1ButtonClick(Sender: TObject);
    procedure UniButtonDbEditcbnef2ButtonClick(Sender: TObject);
    procedure UniButtonDbEditcbnef90ButtonClick(Sender: TObject);
    procedure UniButtonDbEdit1ButtonClick(Sender: TObject);
  private
    { Private declarations }
  posicao_x, posicao_y    : Integer;
  public
    { Public declarations }
    procedure carregamedida();
  end;

var
  frmcadPRODUTOS: TfrmcadPRODUTOS;

implementation

{$R *.dfm}

uses mkm_procedures, untDM_RC, MainModule, untFrmPesquisa, Vcl.Grids,
  untFrmTELAGENERICA;
{ TfrmcadPRODUTOS }

procedure TfrmcadPRODUTOS.btnEditRegClick(Sender: TObject);
begin
  carregamedida();
  inherited;
end;

procedure TfrmcadPRODUTOS.btnNewRegClick(Sender: TObject);
begin
  carregamedida();
  inherited;
end;

procedure TfrmcadPRODUTOS.carregamedida;
begin
  UniDBComboBoxmedida.Clear;
  TabelaMedidas('SELECT sigla FROM medidas WHERE ATIVO = ' + QuotedStr('T') + ' ORDER BY codigo');
  dm_rc.fdqrymedidas.first;
  while not dm_rc.fdqrymedidas.Eof do
    begin
      UniDBComboBoxmedida.Items.Add(dm_rc.fdqrymedidas.FindField('SIGLA').AsString);
      dm_rc.fdqrymedidas.Next;
    end;
end;

procedure TfrmcadPRODUTOS.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
  var Linha, Coluna : Integer;
begin
  inherited;
   Linha  := TStringGrid(dbgSearchCRUD).Row;
   Coluna := dbgSearchCRUD.CurrCol;
{
  if Column.FieldName = 'UNIDADE' then
    begin
      UniPopupMenudetalhesproduto.Popup(posicao_x-25,posicao_y, dbgSearchCRUD);
    end;
    }
end;

procedure TfrmcadPRODUTOS.dbgSearchCRUDDblClick(Sender: TObject);
begin
  carregamedida();
  inherited;
end;

procedure TfrmcadPRODUTOS.dbgSearchCRUDMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  posicao_x := X;
  posicao_y := Y;
end;

procedure TfrmcadPRODUTOS.FDQryFiltroUNIDADEGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  Text :=
    '<i title="detalhes" class="fa fa-lg fas fa-cog fa-lg"; style="color:blue; cursor:pointer;"></i>';

end;

procedure TfrmcadPRODUTOS.UniButtonDbEdit1ButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('CBNEF');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCaddetails.Edit;
       FDQryCaddetails.FindField('BENEFICIOEX').AsString := MM.varC_codigo_busca;
     end;
   end);

end;

procedure TfrmcadPRODUTOS.UniButtonDbEditcbnef1ButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('CBNEF');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCaddetails.Edit;
       FDQryCaddetails.FindField('BENEFICIO01').AsString := MM.varC_codigo_busca;
     end;
   end);

end;

procedure TfrmcadPRODUTOS.UniButtonDbEditcbnef2ButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('CBNEF');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCaddetails.Edit;
       FDQryCaddetails.FindField('BENEFICIO02').AsString := MM.varC_codigo_busca;
     end;
   end);

end;

procedure TfrmcadPRODUTOS.UniButtonDbEditcbnef90ButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('CBNEF');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCaddetails.Edit;
       FDQryCaddetails.FindField('BENEFICIO90').AsString := MM.varC_codigo_busca;
     end;
   end);

end;

procedure TfrmcadPRODUTOS.UniButtonDbEditcbnefButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('CBNEF');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCaddetails.Edit;
       FDQryCaddetails.FindField('BENEFICIOLC').AsString := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmcadPRODUTOS.UniButtonDbEditcodigocultivarButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('CULTIVAR');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('CODIGO_CULTIVAR').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmcadPRODUTOS.UniButtonDbEditcodigocultivarExit(Sender: TObject);
begin
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    begin
      if (UniButtonDbEditcodigocultivar.Text <> '') and (UniButtonDbEditcodigocultivar.Text <> '0') then
        begin
          SqlPesquisa('select cultivar from cultivar where codigo = ' + IntToStr(FDQryCad.FindField('CODIGO_CULTIVAR').AsInteger));
            FDQryCad.FindField('CULTIVAR').AsString := dm_rc.sqlBuscas.FindField('CULTIVAR').AsString
        end;
    end;
end;

procedure TfrmcadPRODUTOS.UniButtonDbEditespecieButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('ESPECIE');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.Edit;
       FDQryCad.FindField('CODIGO_ESPECIE').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmcadPRODUTOS.UniButtonDbEditespecieExit(Sender: TObject);
begin
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    begin
      if (UniButtonDbEditespecie.Text <> '') and (UniButtonDbEditespecie.Text <> '0') then
        begin
          SqlPesquisa('select sementenome from especie where codigo = ' + IntToStr(FDQryCad.FindField('CODIGO_ESPECIE').AsInteger));
            FDQryCad.FindField('SEMENTENOME').AsString := dm_rc.sqlBuscas.FindField('SEMENTENOME').AsString
        end;
    end;
end;

procedure TfrmcadPRODUTOS.UniButtonDbEditGRUPOSButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('GRUPOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       FDQryCad.FindField('GRUPO').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmcadPRODUTOS.UniButtonDbEditGRUPOSExit(Sender: TObject);
begin
  if ( dscrud.State in [dsEdit, dsInsert ] ) then
    begin
      if (UniButtonDbEditGRUPOS.Text <> '') and (UniButtonDbEditGRUPOS.Text <> '0') then
        begin
          if SqlPesquisa('SELECT * FROM GRUPOS WHERE CODIGO = ' + IntToStr(FDQryCad.FindField('GRUPO').AsInteger)) then
            FDQryCad.FindField('NOMEGRUPO').AsString  := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
        end;
    end;
end;

procedure TfrmcadPRODUTOS.UniMenuItem1Click(Sender: TObject);
begin
  inherited;
  mm.varC_referencia_produto := FDQryFiltroCODIGO.AsString;
  mm.VarC_Atelagenerica      := 'KARDEXPRODUTO';
  frmTELAGENERICA.ShowModal();
end;

initialization
  RegisterClass(TfrmcadPRODUTOS);
end.
