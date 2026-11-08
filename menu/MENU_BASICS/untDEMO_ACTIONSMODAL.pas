unit untDEMO_ACTIONSMODAL; // 5.1.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, untGenericModalForm, uniSweetAlert, uniGUIBaseClasses, uniTimer, uniEdit, uniDBEdit, uniLabel, uniPanel, uniScrollBox, uniButton, uniBitBtn, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniBasicGrid, uniDBGrid, uniPageControl;

type
  TfrmDEMO_ACTIONSMODAL = class(TfrmGenericModalForm)
    UniScrollBox1: TUniScrollBox;
    rcBlock16: TUniContainerPanel;
    UniLabel3: TUniLabel;
    btSair: TUniLabel;
    sqlActions: TFDQuery;
    dsActions: TDataSource;
    rcBlock180: TUniContainerPanel;
    hpForActionBtns: TUniHiddenPanel;
    btnPrint: TUniBitBtn;
    btnEdit: TUniBitBtn;
    btnDelete: TUniBitBtn;
    btnOptions: TUniBitBtn;
    dbgActionsModal: TUniDBGrid;
    procedure btSairClick(Sender: TObject);
    procedure dbgActionsModalCellClick(Column: TUniDBGridColumn);
    procedure UniFormCreate(Sender: TObject);
    procedure dbgActionsModalDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure btnPrintClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure dsActionsStateChange(Sender: TObject);
    procedure UniFormAfterShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmDEMO_ACTIONSMODAL: TfrmDEMO_ACTIONSMODAL;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, uconsts, uconsts_cfg, Main, untDM_RC, mkm_layout, mkm_dbfuncs, mkm_func_web;

function frmDEMO_ACTIONSMODAL: TfrmDEMO_ACTIONSMODAL;
begin
  Result := TfrmDEMO_ACTIONSMODAL(mm.GetFormInstance(TfrmDEMO_ACTIONSMODAL));
end;

procedure TfrmDEMO_ACTIONSMODAL.btnDeleteClick(Sender: TObject);
begin
  inherited;
  DM_RC.rc_ShowSweetAlert('Info!','Deleting...', 'info' );
end;

procedure TfrmDEMO_ACTIONSMODAL.btnEditClick(Sender: TObject);
begin
  inherited;
  DM_RC.rc_ShowSweetAlert('Info!','Editing...', 'info' );
end;

procedure TfrmDEMO_ACTIONSMODAL.btnOptionsClick(Sender: TObject);
begin
  inherited;
  DM_RC.rc_ShowSweetAlert('Info!','Showing Options...', 'info' );
end;

procedure TfrmDEMO_ACTIONSMODAL.btnPrintClick(Sender: TObject);
begin
  inherited;
  DM_RC.rc_ShowSweetAlert('Info!','Printing...', 'info' );
end;

procedure TfrmDEMO_ACTIONSMODAL.btSairClick(Sender: TObject);
begin
  inherited;
  dm_rc.rc_CloseQuerys( Self , False, False );
  Close;
end;

procedure TfrmDEMO_ACTIONSMODAL.dbgActionsModalCellClick(Column: TUniDBGridColumn);
begin
  inherited;
  dm_rc.rc_ActionBtnCellClick( self, Column.FieldName );
end;

procedure TfrmDEMO_ACTIONSMODAL.dbgActionsModalDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
     dm_rc.rc_GridDrawCell( TUniDBGrid( sender ) , ACol, ARow, Column, Attribs ) ;
end;
//[PT] "state-visible:": quando não há registros, as colunas não são renderizadas deixando um layout indesejável
//[EN] "state-visible:": When there are no records, the columns are not rendered leaving an undesirable layout
procedure TfrmDEMO_ACTIONSMODAL.dsActionsStateChange(Sender: TObject);
begin
  inherited;
  if TDataSource( sender ).State in [ dsInsert, dsEdit, dsBrowse ] then
     rc_DSReactiveCheck( self , TDataSource( sender ) );
end;

procedure TfrmDEMO_ACTIONSMODAL.UniFormAfterShow(Sender: TObject);
begin
  inherited;
   // contar quantos campos tem pra ativar ou nao o FORCEFIT
   // FORCEFIT fica melhor com poucos campos, mas nao funciona bem quando o LOCKED está ativo
   dm_rc.rc_DBGridUpdateAll( Self , true, false, false ); //

   // para frames, não precisa efetuar o ResizeBlocks
   rc_RenderLayout( Self, true, true, true );
end;

procedure TfrmDEMO_ACTIONSMODAL.UniFormCreate(Sender: TObject);
var
   cTagString : string;
begin

  dbgActionsModal.Hint :=
  '[[' +
  'anchor: |' +
  'fieldmasks:' +
//  'fieldmasks:table-cidades;' +
  'grid-resize|' +
//  'no-paged|' +        // v. 3.3.0.0
//  'grid-header:translate()|'+ // v. 3.3.0.0
  //'grid-noforcefit|' +
  'grid-paginator:center|' + // Note: grid must have Fecth All = TRUE to show PAGINATOR pages
  'state-visible:empty-false ds:dsACTIONS|' +  // check "dsActionsStateChange"
  'codigo[[' +
//  '    locked:|' +
  '    title:Id|'+
//  '    titlealign:c|'+
//  '    align:c|' + // [PT] Existe um bug no uso do "align:" com ACTION BUTTONS ainda não resolvido.
                     // [EN] There is a bug in the use of "align:" with action buttons not yet resolved.
  '    width:15% mobile-h-15% mobile-v-20%|' +
  '    visible:false mobile-v]];' +       // visible=false ON MOBILE PORTRAIT

  'descricao[['+
  '    title:City|'+
  '    width:65% mobile-h-65% mobile-v-63%]];' +
  ']]' ;

  inherited;

  sqlActions.SQL.Text :=
    ' select ' +

    ' codigo, descricao, ' +
    // by defaul 4 action btns has 20% width
    ' [[grid-btn:btnEdit|ico:fas-pencil-alt|cls:ButtonGreenNoBg]] ' +
    ' [[grid-btn:btnDelete|ico:fas-trash-alt|cls:ButtonRedNoBg]] ' +
    ' [[grid-btn:btnOptions|ico:fas-bars|cls:ButtonGrayNoBg]] ' +
    ' [[grid-btn:btnPrint|ico:fas-print|cls:ButtonBlueNoBg]] ' +

    ' from ' + dm_rc.rc_DBSchema + 'cidades ' + //6.1.0.0

//    ' where codigo <= 1' +

    ' order by codigo ';

  dm_rc.rc_ActionBtnsRender( Self, dbgActionsModal );

  dm_rc.rc_OpenQuery( sqlActions );

  // tag-string ?
  cTagString := rc_GetHintAttr( 'tag-string:', Self.Hint );
  if cTagString = 'E' then

   // configurar lookups...mascaras...etc.. preparar query [[fields]]...
   // adjust the lookup tables according to the query name
   dm_rc.rc_RenderLookUpControls( Self );
   // atualizar todos os LOOKUPs dinamicamente
   mm.varC_Lookup_Code := '';
   //dm_rc.rc_LookUpUpdateData(  self  );

   // contar quantos campos tem pra ativar ou nao o FORCEFIT
   // FORCEFIT fica melhor com poucos campos, mas nao funciona bem quando o LOCKED está ativo
   dm_rc.rc_DBGridUpdateAll( Self , false, false, false ); //

   // para frames, não precisa efetuar o ResizeBlocks
   rc_RenderLayout( Self, false, false, true, false );

end;

initialization
   RegisterClass( TfrmDEMO_ACTIONSMODAL ) ;

end.
