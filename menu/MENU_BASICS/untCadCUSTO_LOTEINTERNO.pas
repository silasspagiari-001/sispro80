unit untCadCUSTO_LOTEINTERNO; //8.0.0.0
(*
[PT] Conversão RADCore 3.0 -> 8.0
     - TfrmCadCUSTO_LOTEINTERNO = class(TfrmCRUDPROPRIO) -> class(TfrmCRUDproprio)
     - Scaffolding 8.0 herdado do untCadCATEGORIA (card/collapse, fieldmasks,
       rc_GridDrawCell); conteúdo próprio do 3.0 preservado:
       rcBlock10..50 (CODIGO/ATIVO/EMISSAO/DESCRICAO/TIPO) + rcBlock60 com o
       grid de detalhes UniDBGridcustoloteitens (dsdetalhes) editável por estado
       (dgEditing no New/Edit, off no Save) e trash de exclusão via tbdetalhes.
     - inherited tbdetalhes (base) mantido com os 5 persistent fields do 3.0
       (exclui/SEQUENCIA/DESCRICAO/CUSTO/PERC).
     - rc_ShowYesNo booleana (8.0) no CellClick do trash.
     - uses untFrmCUSTOPRODUCAO removido: unit ainda não convertida p/ 8.0 e SEM
       referência simbólica neste form — restaurar o uses ao converter o
       CUSTOPRODUCAO se houver uso futuro (ver GUIA).
[EN] RADCore 3.0 -> 8.0 conversion
*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIApplication, uniGUIClasses, uniGUIFrame, untFrmCRUDproprio, Data.DB, uniBasicGrid, uniDBGrid,
  uniPanel, uniPageControl, uniGUIBaseClasses, uniScrollBox, uniDBEdit,
  uniMultiItem, uniComboBox, uniEdit, uniLabel, uniButton, uniBitBtn,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniCheckBox, uniFieldSet,
  uniDBComboBox, uniDBLookupComboBox, uniSpeedButton, uniDBCheckBox,
  uniMainMenu, uniHTMLFrame, Data.FMTBcd, Data.SqlExpr, uniSpinEdit, uniMemo, Vcl.Menus, uniSweetAlert, uniDBNavigator,
  uniDateTimePicker, uniDBDateTimePicker,
  untFrmBaseCRUD;


type
  TfrmCadCUSTO_LOTEINTERNO = class(TfrmCRUDproprio)
    pgComplementData: TUniPageControl;
    tabGeral: TUniTabSheet;
    sboxGridBlockTab1: TUniScrollBox;
    rcBlock515: TUniContainerPanel;
    rcBlock2: TUniContainerPanel;
    rcBlock3: TUniContainerPanel;
    labRcCollapseGeneral: TUniLabel;
    labTitleCardGeral: TUniLabel;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniLabel22: TUniLabel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniLabel9: TUniLabel;
    UniDBComboBox3: TUniDBComboBox;
    rcBlock60: TUniContainerPanel;
    UniDBGridcustoloteitens: TUniDBGrid;
    tbdetalhesexclui: TStringField;
    tbdetalhesSEQUENCIA: TIntegerField;
    tbdetalhesDESCRICAO: TStringField;
    tbdetalhesCUSTO: TFloatField;
    tbdetalhesPERC: TFloatField;
    procedure UniFrameCreate(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure tbdetalhesexcluiGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure UniDBGridcustoloteitensCellClick(Column: TUniDBGridColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, untFrmLookUp, Main,
  untFrmMessage, uconsts, uconsts_cfg,
  mkm_func_web, mkm_layout, mkm_restfuncs, mkm_crudfuncs; //8.0.0.0

procedure TfrmCadCUSTO_LOTEINTERNO.UniFrameCreate(Sender: TObject);
begin

  sqlMaster.SQL.Text := ' SELECT [[fields]]   ' +
                        ' FROM [[table]] tab ' +
                        ' [[pk-show]] ' +
                        ' WHERE tab.[[pk]] = :table_pk ' +  //[PT] Apenas cadastro MESTRE é necessário o WHERE
                        ' FROM  [[table]] tab ' ;

  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:'+
                        'grid-resize|'+
                        'model-crud:2|'+
                        'grid-paginator:center|' +
                        ']]';

  inherited;

end;

procedure TfrmCadCUSTO_LOTEINTERNO.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  dm_rc.rc_GridDrawCell( dbgSearchCRUD , ACol, ARow, Column, Attribs ) ;
end;

procedure TfrmCadCUSTO_LOTEINTERNO.tbdetalhesexcluiGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Excluir" class="fa fa-lg fa-trash fa-lg" style="color:red; cursor:pointer;"></i>';
end;

procedure TfrmCadCUSTO_LOTEINTERNO.btnCancelRegClick(Sender: TObject);
begin
  inherited;
  tbdetalhes.Close;
end;

procedure TfrmCadCUSTO_LOTEINTERNO.btnEditRegClick(Sender: TObject);
begin
  inherited;
  UniDBGridcustoloteitens.Options          := UniDBGridcustoloteitens.Options - [dgRowSelect];
  UniDBGridcustoloteitens.Options          := UniDBGridcustoloteitens.Options + [dgEditing];
end;

procedure TfrmCadCUSTO_LOTEINTERNO.btnNewRegClick(Sender: TObject);
begin
  inherited;

  UniDBGridcustoloteitens.Options          := UniDBGridcustoloteitens.Options - [dgRowSelect];
  UniDBGridcustoloteitens.Options          := UniDBGridcustoloteitens.Options + [dgEditing];
end;

procedure TfrmCadCUSTO_LOTEINTERNO.btnSaveRegClick(Sender: TObject);
begin
  inherited;
  UniDBGridcustoloteitens.Options          := UniDBGridcustoloteitens.Options - [dgEditing];
end;

procedure TfrmCadCUSTO_LOTEINTERNO.UniDBGridcustoloteitensCellClick(
  Column: TUniDBGridColumn);
begin
  inherited;
  if FDQryCad.State in [dsInsert,dsEdit] then
    begin
      if Column.FieldName = 'exclui' then
        begin
          if dm_rc.rc_ShowYesNo( 'DESEJA REALMENTE EXCLUIR ESSE REGISTRO?' ) then
            begin
              tbdetalhes.Delete;
            end
        end;
    end;
end;

initialization
  RegisterClass(TfrmCadCUSTO_LOTEINTERNO);

end.
// fim do arquivo
