unit untDEMO_DYNAMIC_BIND;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  uniGUIBaseClasses, uniSweetAlert, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniButton, uniBitBtn, uniPanel, uniDBEdit, uniEdit, uniBasicGrid, uniDBGrid, uniPageControl, uniLabel,
  uniScrollBox, uniHTMLFrame, uniDateTimePicker, uniCheckBox, uniRadioGroup, uniMultiItem, uniComboBox;

type
  TfrmDEMO_DYNAMIC_BIND = class(TUniFrame)
    sqlDataQuery: TFDQuery;
    dsDataQuery: TDataSource;
    rcSweetAlert: TUniSweetAlert;
    UniScrollBox1: TUniScrollBox;
    rcBlock16: TUniContainerPanel;
    btSair: TUniLabel;
    rcBlock180: TUniContainerPanel;
    pgData: TUniPageControl;
    tabSearch: TUniTabSheet;
    tabEdit: TUniTabSheet;
    UniScrollBox3: TUniScrollBox;
    rcBlock200: TUniContainerPanel;
    rcLabel200: TUniLabel;
    rcEdit200: TUniEdit;
    rcBlock210: TUniContainerPanel;
    rcLabel210: TUniLabel;
    rcEdit210: TUniEdit;
    UniScrollBox2: TUniScrollBox;
    rcBlock190: TUniContainerPanel;
    dbgActions: TUniDBGrid;
    UniLabel2: TUniLabel;
    UniFormattedNumberEdit1: TUniFormattedNumberEdit;
    rcBlock220: TUniContainerPanel;
    rcBlock230: TUniContainerPanel;
    rcLabel300: TUniLabel;
    rcDateTimePicker300: TUniDateTimePicker;
    UniLabel3: TUniLabel;
    Inactive: TUniCheckBox;
    rcBlock240: TUniContainerPanel;
    UniRadioGroup1: TUniRadioGroup;
    rcBlock250: TUniContainerPanel;
    rcBlock260: TUniContainerPanel;
    rcLabel260: TUniLabel;
    rcComboBox260: TUniComboBox;
    rcBlock270: TUniContainerPanel;
    UniLabel1Clone: TUniLabel;
    edLkpEMPRESAS: TUniDBEdit;
    UniLabel1: TUniLabel;
    btnEdit: TUniBitBtn;
    btnSave: TUniBitBtn;
    hpMaster: TUniHiddenPanel;
    memLkpClients: TFDMemTable;
    dsLkpClients: TDataSource;
    procedure UniFrameBeforeReady(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure dbgActionsDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure dsDataQueryStateChange(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure dbgActionsColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

implementation

{$R *.dfm}

uses untDM_RC, mkm_layout, mkm_dbfuncs, MainModule, untModalFrameForm, mkm_func_web, uconsts_cfg;

procedure TfrmDEMO_DYNAMIC_BIND.btnEditClick(Sender: TObject);
begin
     pgData.ActivePage := tabEdit;
     rc_DynamicBindLoad( self );

     //     edLkpUFS.Tag := sqlDataQuery.FieldByName( 'codiuf' ).AsInteger;
   //  dm_rc.rc_LookUpUpdateData(  self  );
//     // atualizar todos os LOOKUPs dinamicamente
//     dm_rc.rc_LookUpUpdateData( self, nil, true );  onlysearch
end;

procedure TfrmDEMO_DYNAMIC_BIND.btnSaveClick(Sender: TObject);
begin
     rc_DynamicBindSave( self );
     mm.varI_ApplyUpdateErrors := sqlDataQuery.ApplyUpdates(-1);
     if mm.varI_ApplyUpdateErrors > 0 then
     begin
        dm_rc.rc_ApplyUpdatesError( sqlDataQuery, mm.varI_ApplyUpdateErrors, mm.MSG_BUGERROR_POST );
     end
     else
     begin
        sqlDataQuery.CommitUpdates;
     end;
     sqlDataQuery.Close;
     pgData.ActivePage := tabSearch;
     sqlDataQuery.Open;
end;

procedure TfrmDEMO_DYNAMIC_BIND.btSairClick(Sender: TObject);
begin
  if pgData.ActivePage = tabEdit then
     pgData.ActivePage := tabSearch
  else
  if Pos( 'frmModalFrameForm', self.Owner.Name ) = 0 then
  begin
     dm_rc.rc_CloseQuerys( Self , False, False );
     //[PT] este exemplo é chamado a partir do MENU PRINCIPAL( como MODAL ) e pelo frmDEMO_FORMs( não MODAL )
     //[EN] this example is called from the MAIN MENU ( as MODAL ) and by frmDEMO_FORMs ( not MODAL )
     if ( mm.oPgGeneral <> nil ) then
        mm.oPgGeneral.ActivePage.Close
  end
  else
     TfrmModalFrameForm( self.Owner ).CloseForm;
end;

procedure TfrmDEMO_DYNAMIC_BIND.dbgActionsColumnFilter(Sender: TUniDBGrid; const Column: TUniDBGridColumn; const Value: Variant);
begin
  rc_GridColumnFilter( self, Sender, Column, Value ); //8.0.0.0 grid
end;

procedure TfrmDEMO_DYNAMIC_BIND.dbgActionsDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
     dm_rc.rc_GridDrawCell( TUniDBGrid( sender ) , ACol, ARow, Column, Attribs ) ;
end;
//[PT] "state-visible:": quando não há registros, as colunas não são renderizadas deixando um layout indesejável
//[EN] "state-visible:": When there are no records, the columns are not rendered leaving an undesirable layout
procedure TfrmDEMO_DYNAMIC_BIND.dsDataQueryStateChange(Sender: TObject);
begin
  inherited;
  if TDataSource( sender ).State in [ dsInsert, dsEdit, dsBrowse ] then
     rc_DSReactiveCheck( self , TDataSource( sender ) );
end;

procedure TfrmDEMO_DYNAMIC_BIND.UniFrameBeforeReady(Sender: TObject);
begin
   // dm_rc.rc_ResizeBlocks( Self, false, false );
end;
// RC_CORE
// Doc Link [PT] https://radcore.pro.br/web/help/pt/RenderizandooLayout.html
//          [EN] https://radcore.pro.br/web/help/en/LayoutRender.html
procedure TfrmDEMO_DYNAMIC_BIND.UniFrameCreate(Sender: TObject);
var
 cTagString : string;
begin

   pgData.TabBarVisible := false;

   dbgActions.Hint :=
   '[[' +
   'anchor: |' +
   'fieldmasks:' +
 //  'fieldmasks:table-cidades;' +
   'grid-resize|' +
   'model-search:column|' + //8.0.0.0 grid
 //  'no-paged|' +
 //  'grid-header:translate()|'+
   //'grid-noforcefit|' +
   'grid-paginator:center|' + // Note: grid must have Fecth All = TRUE to show PAGINATOR pages
   'state-visible:empty-false ds:dsDataQuery|' +  // check "dsActionsStateChange"
//   ']]' ;

   'Codigo[['+
   '    width:10% mobile-v:15% mobile-v:15%]];' +  //8.2.0.0

   'codiemp[['+
   '    visible:false ]];' +

   'nome[['+
   '    width:50% mobile-v:50% mobile-v:50%]];' +

   'dtcadastro[['+
   '    width:20% mobile-v:25% mobile-v:25%]];' +

   'valor_contrato[['+
   '    width:20% mobile-v:25% mobile-v:25%]];' +

   'ativo[['+
   '    visible:false ]];' +

   'pessoa[['+
   '    visible:false ]];' +

   'codiuf[['+
   '    visible:false ]];' +

   '|showpk' +  //8.2.0.0

   ']]';

   pgData.ActivePage := tabSearch;

//   // configurar lookups...mascaras...etc.. preparar query [[fields]]...
//   // adjust the lookup tables according to the query name
//   dm_rc.rc_RenderLookUpControls( Self );
//   // atualizar todos os LOOKUPs dinamicamente
//   mm.varC_Lookup_Code := '';
//   //dm_rc.rc_LookUpUpdateData(  self  );

   sqlDataQuery.SQL.Text :=
     ' select ' +

     //rc_DynamicBindFields +as "Código"
     ' codigo, codiemp, nome, dtcadastro, valor_contrato, ativo, pessoa, codiuf ' +

     ' from ' + dm_rc.rc_DBSchema + 'clientes ' + //6.1.0.0

//     ' where codigo <= 1' +

     ' order by codigo ';

//  dm_rc.rc_OpenQuery( sqlDataQuery );
//
//  //rc_GridColumnSearchRender( self, dbgActions, HpMaster );
//
//   // contar quantos campos tem pra ativar ou nao o FORCEFIT
//   // FORCEFIT fica melhor com poucos campos, mas nao funciona bem quando o LOCKED está ativo
//   dm_rc.rc_DBGridUpdateAll( Self , false, false, false );
//
(*
MemTable.Indexes.Add.IndexName := 'MyIndex';
MemTable.Indexes.Find('MyIndex').Fields := 'FieldName';
MemTable.Indexes.Find('MyIndex').Active := True;
*)


//   // para frames, não precisa efetuar o ResizeBlocks | for frames, no need to perform ResizeBlocks
   rc_RenderLayout( Self, false, false, true, false );

//   // configurar lookups...mascaras...etc.. preparar query [[fields]]...
//   // adjust the lookup tables according to the query name
   dm_rc.rc_RenderLookUpControls( Self );

//   // atualizar todos os LOOKUPs dinamicamente
//   mm.varC_Lookup_Code := '';
//   //dm_rc.rc_LookUpUpdateData(  self  );

//   // 6.0.0.0
//   // tag-form ?
//   cTagString := dm_rc.rc_GetTagFormAttr( Self, true );
//   if cTagString.ToUpper = 'E' then
//      btnEditClick( self );

end;

procedure TfrmDEMO_DYNAMIC_BIND.UniFrameReady(Sender: TObject);
var
   cTagString : string;
begin
   // adjust edit masks
   dm_rc.rc_ApplyEditMasks( Self );
   dm_rc.rc_ResizeBlocks( Self, true, true );

   dm_rc.rc_OpenQuery( sqlDataQuery );

   // contar quantos campos tem pra ativar ou nao o FORCEFIT
   // FORCEFIT fica melhor com poucos campos, mas nao funciona bem quando o LOCKED está ativo
   dm_rc.rc_DBGridUpdateAll( Self , false, false, true);

   //8.0.0.0 grid
   rc_GridColumnSearchRender( self, dbgActions, hpMaster );


   // 6.0.0.0
   // tag-form ?
   cTagString := dm_rc.rc_GetTagFormAttr( Self, false );
   if cTagString.ToUpper = 'E' then
      btnEditClick( self );
end;
// -------------------------------------------------------------------------
initialization
   RegisterClass( TfrmDEMO_DYNAMIC_BIND );

end.


