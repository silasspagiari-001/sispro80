unit untCadPARAMETROSOPERACAO; // 8.0.0.0
(*
[PT] Conversão RADCore 3.0 -> 8.0
     - UniButtonDbEditcodigocondicaomestre (busca 'OPERACOES' -> campo OP_INTERNA)
       -> lookup declarativo edLkpOPERACOES__INTERNA + edLkpOPERACOES_SetDS_OP_INTERNA
     - UniButtonDbEdit1 (busca 'OPERACOES' -> campo OP_EXTERNA)
       -> lookup declarativo edLkpOPERACOES__EXTERNA + edLkpOPERACOES_SetDS_OP_EXTERNA
     - dois contextos de lookup na mesma tabela OPERACOES (padrão __CONTEXTO da
       referência PESSOAS, que usa edLkpCIDADES__PRINCIPAL/__ENTREGA/__COBRANCA)
     - FDQryCad.Edit/FindField -> sqlMaster.FieldByName
     - estrutura final (card/collapse) fecha com a conversão do DFM
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
  untFrmBaseCRUD, uniDateTimePicker;

type
  TfrmCadPARAMETROSOPERACAO = class(TfrmCRUDproprio)
    pgComplementData: TUniPageControl;
    tabGeral: TUniTabSheet;
    sboxGridBlockTab1: TUniScrollBox;
    rcBlock515: TUniContainerPanel;
    rcBlock2: TUniContainerPanel;
    rcBlock3: TUniContainerPanel;
    labRcCollapseGeneral: TUniLabel;
    labTitleCardGeral: TUniLabel;
    rcBlock10: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    rcBlock20: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    rcBlock30: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock40: TUniContainerPanel;
    UniLabel6: TUniLabel;
    edLkpOPERACOES__INTERNA: TUniDBEdit;
    rcBlock50: TUniContainerPanel;
    UniLabel7: TUniLabel;
    edLkpOPERACOES__EXTERNA: TUniDBEdit;
    UniDBEdit2: TUniDBEdit;
    procedure edLkpOPERACOES__INTERNAExit(Sender: TObject);
    procedure edLkpOPERACOES__EXTERNAExit(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure UniFrameCreate(Sender: TObject);
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

procedure TfrmCadPARAMETROSOPERACAO.UniFrameCreate(Sender: TObject);
begin

  sqlMaster.SQL.Text := ' SELECT [[fields]]   ' +
                        ' FROM [[table]] tab ' +
                        ' [[pk-show]] ' +
                        ' WHERE tab.[[pk]] = :table_pk ' +  //[PT] Apenas cadastro MESTRE é necessário o WHERE
                        ' FROM  [[table]] tab ' ;


  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:'+
                        'grid-resize|'+
                        'model-crud:0(btns-cls:colorful)|'+
                        'grid-paginator:center|' +
                        ']]';

  inherited;

end;

procedure TfrmCadPARAMETROSOPERACAO.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  dm_rc.rc_GridDrawCell( dbgSearchCRUD , ACol, ARow, Column, Attribs ) ;
end;

//8.0.0.0
// 3.0: UniButtonDbEditcodigocondicaomestreButtonClick fazia mm.Seta_Busca('OPERACOES')
//      e gravava FDQryCad.FindField('OP_INTERNA') com o codigo escolhido
// 8.0: lookup declarativo; no Exit gravamos o codigo selecionado em OP_INTERNA
procedure TfrmCadPARAMETROSOPERACAO.edLkpOPERACOES__INTERNAExit(Sender: TObject);
begin
  inherited;
  if sqlMaster.State in [dsEdit, dsInsert] then
     sqlMaster.FieldByName( 'OP_INTERNA' ).AsString := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'CODIGO' );
end;

//8.0.0.0
// 3.0: UniButtonDbEdit1ButtonClick fazia mm.Seta_Busca('OPERACOES')
//      e gravava FDQryCad.FindField('OP_EXTERNA') com o codigo escolhido
// 8.0: lookup declarativo; no Exit gravamos o codigo selecionado em OP_EXTERNA
procedure TfrmCadPARAMETROSOPERACAO.edLkpOPERACOES__EXTERNAExit(Sender: TObject);
begin
  inherited;
  if sqlMaster.State in [dsEdit, dsInsert] then
     sqlMaster.FieldByName( 'OP_EXTERNA' ).AsString := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'CODIGO' );
end;

initialization
  RegisterClass(TfrmCadPARAMETROSOPERACAO);

end.
