unit untCadBATIDAMESTRE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmCRUDproprio, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniEdit, uniLabel,
  uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn, uniGUIClasses,
  uniMemo, uniGUIBaseClasses, uniDBEdit, UniButtonDbEdit, uniDateTimePicker,
  uniDBDateTimePicker, uniDBComboBox, Vcl.Menus, uniMainMenu, uniScreenMask;

type
  TfrmCADBATIDAMESTRE = class(TfrmCRUDPROPRIO)
    FDQryFiltroFINALIZADO: TStringField;
    FDQryFiltroCODIGO: TIntegerField;
    FDQryFiltroNUMERO: TIntegerField;
    FDQryFiltroPRODUTO: TIntegerField;
    FDQryFiltroEMISSAO: TDateField;
    FDQryFiltroLOTE: TStringField;
    FDQryFiltroDESCRICAO: TStringField;
    UniContainerPanel3: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    UniLabel4: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniLabel15: TUniLabel;
    UniButtonDbEditPRODUTODESTINO: TUniButtonDbEdit;
    UniLabel6: TUniLabel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    UniLabel13: TUniLabel;
    UniDBEditDESCRICAOPRODUTO: TUniDBEdit;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    UniLabel25: TUniLabel;
    UniDBFormattedNumberEditpureza: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEditquantidade: TUniDBFormattedNumberEdit;
    UniLabel5: TUniLabel;
    UniLabel26: TUniLabel;
    UniDBComboBoxsacos: TUniDBComboBox;
    rcBlock90: TUniContainerPanel;
    rcBlock100: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniButtonDbEditLOTEDESTINO: TUniButtonDbEdit;
    UniLabel8: TUniLabel;
    UniDBEditboletim: TUniDBEdit;
    UniLabel9: TUniLabel;
    UniDBEdittermo: TUniDBEdit;
    UniLabel10: TUniLabel;
    UniDBEditsafra: TUniDBEdit;
    rcBlock140: TUniContainerPanel;
    UniDBGridbatidaitens: TUniDBGrid;
    tbdetalhesPRODUTO: TIntegerField;
    tbdetalhesDESCRICAO: TStringField;
    tbdetalhesQUANTIDADE: TFloatField;
    tbdetalhesEQUIVALENTE: TFloatField;
    tbdetalhesTIPO: TStringField;
    tbdetalhesSEQUENCIA: TIntegerField;
    tbdetalhesexclui: TStringField;
    tbdetalhesbuscaproduto: TStringField;
    tbdetalhesCUSTO_UNITARIO: TFloatField;
    UniPopupMenuopcoes: TUniPopupMenu;
    I1: TUniMenuItem;
    N1: TUniMenuItem;
    E1: TUniMenuItem;
    UniPopupMenuimpressao: TUniPopupMenu;
    UniMenuItem1: TUniMenuItem;
    procedure FDQryFiltroFINALIZADOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure tbdetalhesexcluiGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure tbdetalhesbuscaprodutoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure UniDBGridbatidaitensCellClick(Column: TUniDBGridColumn);
    procedure btnSaveRegClick(Sender: TObject);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure UniButtonDbEditPRODUTODESTINOButtonClick(Sender: TObject);
    procedure UniButtonDbEditPRODUTODESTINOExit(Sender: TObject);
    procedure UniButtonDbEditLOTEDESTINOExit(Sender: TObject);
    procedure UniButtonDbEditLOTEDESTINOButtonClick(Sender: TObject);
    procedure FDQryFiltroCODIGOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure I1Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
  private
    { Private declarations }
  posicao_x, posicao_y    : Integer;
  public
    { Public declarations }
  procedure carregaprodutos(p_codigo:string);
  end;

var
  frmCADBATIDAMESTRE: TfrmCADBATIDAMESTRE;

implementation

uses
  uniGUITypes, untDM_RC, MainModule, untFrmPesquisa, mkm_funcoes, mkm_func_web,
  mkm_procedures, untfrmPesquisalote, Vcl.Grids, untfrmTelaproducaogenerica,
  untFrmTELAGENERICA;

{$R *.dfm}

procedure TfrmCADBATIDAMESTRE.btnEditRegClick(Sender: TObject);
begin
  inherited;
  UniDBGridbatidaitens.Options                 := UniDBGridbatidaitens.Options - [dgRowSelect];
  UniDBGridbatidaitens.Options                 := UniDBGridbatidaitens.Options + [dgEditing];
  sqlMaster.FindField('LOGALTERACAO').AsString  := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);
end;

procedure TfrmCADBATIDAMESTRE.btnNewRegClick(Sender: TObject);
begin
  inherited;
  UniDBGridbatidaitens.Options                := UniDBGridbatidaitens.Options - [dgRowSelect];
  UniDBGridbatidaitens.Options                := UniDBGridbatidaitens.Options + [dgEditing];
  sqlMaster.FindField('LOGINCLUSAO').AsString  := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);
end;

procedure TfrmCADBATIDAMESTRE.btnOptionsClick(Sender: TObject);
begin
  inherited;
  UniPopupMenuimpressao.PopupBy( TUniButton( sender ) );
end;

procedure TfrmCADBATIDAMESTRE.btnSaveRegClick(Sender: TObject);
begin
  inherited;
  GravaBatidaitens(sqlMaster.FindField('CODIGO').AsInteger);
end;

procedure TfrmCADBATIDAMESTRE.carregaprodutos(p_codigo: string);
begin
  tbdetalhes.Edit;
  tbdetalhes.FindField('PRODUTO').AsInteger  := StrToInt(p_codigo);
  tbdetalhes.FindField('DESCRICAO').AsString := Acha_Item('PRODUTOS',tbdetalhes.FindField('PRODUTO').AsString);
  tbdetalhes.FindField('TIPO').AsString      := 'Materia Prima';
end;

procedure TfrmCADBATIDAMESTRE.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
  var Linha, Coluna : Integer;
begin
  inherited;
   Linha  := TStringGrid(dbgSearchCRUD).Row;
   Coluna := dbgSearchCRUD.CurrCol;

  if Column.FieldName = 'CODIGO' then
    begin
      UniPopupMenuopcoes.Popup(posicao_x-160,posicao_y, dbgSearchCRUD);
    end;
end;

procedure TfrmCADBATIDAMESTRE.dbgSearchCRUDDblClick(Sender: TObject);
begin
  inherited;
  CarregaBatidaitens(sqlMaster.FindField('CODIGO').AsInteger);
end;

procedure TfrmCADBATIDAMESTRE.dbgSearchCRUDMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  posicao_x := X;
  posicao_y := Y;
end;

procedure TfrmCADBATIDAMESTRE.E1Click(Sender: TObject);
begin
  inherited;
  TabelaBatidaMestre('select * from BATIDAMESTRE where codigo = ' + IntToStr(sqlSearchMaster.FindField('CODIGO').AsInteger));
  mm.VarC_Atelagenerica := 'LOGBATIDAMESTRE';
  frmTELAGENERICA.ShowModal();

  dm_rc.fdqrybatidamestre.Close;
end;

procedure TfrmCADBATIDAMESTRE.FDQryFiltroCODIGOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
      '<i title="detalhes" class="fa fa-lg fas fa-cog fa-lg"; style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmCADBATIDAMESTRE.FDQryFiltroFINALIZADOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if FDQryFiltroFINALIZADO.AsString = 'T' then
        Text := '<span class="badge badge-success">Finalizado</span>'
      else
        Text := '<span class="badge badge-warning">Em Andamento</span>';
    end;
end;

procedure TfrmCADBATIDAMESTRE.I1Click(Sender: TObject);
begin
  inherited;

  if sqlSearchMaster.FindField('FINALIZADO').AsString = 'T' then
    begin
      dm_rc.rc_ShowYesNo( 'PRODUÇÃO JA FINALIZADA, DESEJA CONTINUAR?' );
      if mm.varB_No then
        abort
    end;

  TabelaBatidaMestre('select * from BATIDAMESTRE where codigo = ' + IntToStr(sqlSearchMaster.FindField('CODIGO').AsInteger));
  frmtelaproducaogenerica.showmodal();

  sqlSearchMaster.Refresh;

  if sqlMaster.RecordCount > 0 then
    sqlMaster.Refresh;
end;

procedure TfrmCADBATIDAMESTRE.tbdetalhesbuscaprodutoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Produtos" class="fa fa-lg fas fa-search-plus fa-lg" style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmCADBATIDAMESTRE.tbdetalhesexcluiGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Excluir" class="fa fa-lg fa-trash fa-lg" style="color:red; cursor:pointer;"></i>';
end;

procedure TfrmCADBATIDAMESTRE.UniButtonDbEditLOTEDESTINOButtonClick(
  Sender: TObject);
begin
  inherited;
  MM.varC_referencia_produto := UniButtonDbEditPRODUTODESTINO.Text;

  MM.Seta_Busca('BUSCALOTE');
  frmpesquisalote.showmodal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       sqlMaster.Edit;
       sqlMaster.FindField('LOTE').AsString     :=  mm.varC_codigo_busca_lote;
     end;
   end);

end;

procedure TfrmCADBATIDAMESTRE.UniButtonDbEditLOTEDESTINOExit(Sender: TObject);
begin
  inherited;

  if SqlPesquisa(' select * from sementes where produto = ' + QuotedStr(MM.varC_referencia_produto) +
                 ' and lote                             = ' + QuotedStr(UniButtonDbEditLOTEDESTINO.Text)) then
  begin
    sqlMaster.Edit;
    sqlMaster.FindField('BOLETIM').AsString     :=  dm_rc.sqlBuscas.FindField('BOLETIM').AsString;
    sqlMaster.FindField('TERMO').AsString       :=  dm_rc.sqlBuscas.FindField('TERMO').AsString;
    sqlMaster.FindField('SAFRAVALIDA').AsString :=  dm_rc.sqlBuscas.FindField('SAFRAVALIDA').AsString;
  end;
end;

procedure TfrmCADBATIDAMESTRE.UniButtonDbEditPRODUTODESTINOButtonClick(
  Sender: TObject);
begin
  inherited;
  MM.Seta_Busca('PRODUTOS');
  UniFfrmPesquisa.showmodal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       fdqrycad.Edit;
       fdqrycad.FindField('PRODUTO').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmCADBATIDAMESTRE.UniButtonDbEditPRODUTODESTINOExit(
  Sender: TObject);
begin
  inherited;
  fdqrycad.Edit;
  fdqrycad.FindField('DESCRICAO').AsString := Acha_Item('PRODUTOS',sqlMaster.FindField('PRODUTO').AsString);
end;

procedure TfrmCADBATIDAMESTRE.UniDBGridbatidaitensCellClick(
  Column: TUniDBGridColumn);
begin
  inherited;
  if sqlMaster.State in [dsInsert,dsEdit] then
    begin
      if Column.FieldName = 'exclui' then
        begin
          dm_rc.rc_ShowYesNo( 'DESEJA REALMENTE EXCLUIR ESSE REGISTRO?' );
          if mm.varB_Yes then
            begin
              tbdetalhes.Delete;
            end
        end;

      if Column.FieldName = 'buscaproduto' then
        begin
          MM.Seta_Busca('PRODUTOS');
          UniFfrmPesquisa.showmodal(
          procedure(Sender: TComponent; AResult: Integer)
           begin
             if AResult = mrOK then
             begin
               tbdetalhes.Edit;
               carregaprodutos(MM.varC_codigo_busca);
             end;
           end);
        end;
    end;
end;

initialization
  RegisterClass(TfrmCADBATIDAMESTRE);
end.
