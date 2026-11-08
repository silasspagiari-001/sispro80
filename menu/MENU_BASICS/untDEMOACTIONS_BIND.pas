unit untDEMOACTIONS_BIND;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  uniGUIBaseClasses, uniSweetAlert, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniButton, uniBitBtn, uniPanel, uniDBEdit, uniEdit, uniBasicGrid, uniDBGrid, uniPageControl, uniLabel,
  uniScrollBox;

type
  TfrmDEMOACTIONS_BIND = class(TUniFrame)
    sqlActions: TFDQuery;
    dsActions: TDataSource;
    rcSweetAlert: TUniSweetAlert;
    UniScrollBox1: TUniScrollBox;
    rcBlock16: TUniContainerPanel;
    UniLabel1: TUniLabel;
    btSair: TUniLabel;
    rcBlock180: TUniContainerPanel;
    pgData: TUniPageControl;
    tabSearch: TUniTabSheet;
    UniScrollBox2: TUniScrollBox;
    rcBlock190: TUniContainerPanel;
    dbgActions: TUniDBGrid;
    tabEdit: TUniTabSheet;
    UniScrollBox3: TUniScrollBox;
    rcBlock200: TUniContainerPanel;
    rcLabel200: TUniLabel;
    rcEdit200: TUniEdit;
    rcBlock210: TUniContainerPanel;
    rcLabel210: TUniLabel;
    rcEdit210: TUniEdit;
    paPillSample: TUniContainerPanel;
    labPills: TUniLabel;
    hpForActionBtns: TUniHiddenPanel;
    btnPrint: TUniBitBtn;
    btnEdit: TUniBitBtn;
    btnDelete: TUniBitBtn;
    btnOptions: TUniBitBtn;
    rcBlock220: TUniContainerPanel;
    rcLabel220: TUniLabel;
    edLkpUFS: TUniDBEdit;
    procedure UniFrameBeforeReady(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure dbgActionsDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure dsActionsStateChange(Sender: TObject);
    procedure dbgActionsCellClick(Column: TUniDBGridColumn);
    procedure btSairClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses untDM_RC, mkm_layout, mkm_dbfuncs, MainModule, untModalFrameForm, mkm_func_web, uconsts_cfg;
// RC_CORE
// [PT] Descomente. O uso do "scale:" ou "hr:" em blocos responsivos "dentro de frames" precisa desse processo adicionar para renderizar corretamente
// [EN] Uncomment. The use of "scale:" or "hr:"  in responsive blocks "within frames" needs this process added to render correctly
procedure TfrmDEMOACTIONS_BIND.btnEditClick(Sender: TObject);
begin
  //DM_RC.rc_ShowSweetAlert('Info!','Editing...', 'info' ); 
  pgData.ActivePage := tabEdit;
  rc_DynamicBindLoad( self );
//  edLkpUFS.Tag := sqlActions.FieldByName( 'codiuf' ).AsInteger;
//  dm_rc.rc_LookUpUpdateData(  self  );
  // atualizar todos os LOOKUPs dinamicamente
  dm_rc.rc_LookUpUpdateData( self, nil, true ); //  onlysearch
end;

procedure TfrmDEMOACTIONS_BIND.btSairClick(Sender: TObject);
begin
  if Pos( 'frmModalFrameForm', self.Owner.Name ) = 0 then
  begin
     dm_rc.rc_CloseQuerys( Self , False, False );
     // [PT] este exemplo é chamado a partir do MENU PRINCIPAL( como MODAL ) e pelo frmDEMO_FORMs( não MODAL )
     // [EN] this example is called from the MAIN MENU ( as MODAL ) and by frmDEMO_FORMs ( not MODAL )
     if ( mm.oPgGeneral <> nil ) then
        mm.oPgGeneral.ActivePage.Close
  end
  else
     TfrmModalFrameForm( self.Owner ).CloseForm;
end;

procedure TfrmDEMOACTIONS_BIND.dbgActionsCellClick(Column: TUniDBGridColumn);
begin
   dm_rc.rc_ActionBtnCellClick( self, Column.FieldName );
end;

procedure TfrmDEMOACTIONS_BIND.dbgActionsDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
     dm_rc.rc_GridDrawCell( TUniDBGrid( sender ) , ACol, ARow, Column, Attribs ) ;
end;
//[PT] "state-visible:": quando não há registros, as colunas não são renderizadas deixando um layout indesejável
//[EN] "state-visible:": When there are no records, the columns are not rendered leaving an undesirable layout
procedure TfrmDEMOACTIONS_BIND.dsActionsStateChange(Sender: TObject);
begin
  inherited;
  if TDataSource( sender ).State in [ dsInsert, dsEdit, dsBrowse ] then
     rc_DSReactiveCheck( self , TDataSource( sender ) );
end;

procedure TfrmDEMOACTIONS_BIND.UniFrameBeforeReady(Sender: TObject);
begin
//   // dm_rc.rc_ResizeBlocks( Self, false, false );
//   // configurar lookups...mascaras...etc.. preparar query [[fields]]...
//   // adjust the lookup tables according to the query name
//   dm_rc.rc_RenderLookUpControls( Self );
//   // atualizar todos os LOOKUPs dinamicamente
//   mm.varC_Lookup_Code := '';
//   //dm_rc.rc_LookUpUpdateData(  self  );

end;
// RC_CORE
// Doc Link [PT] https://radcore.pro.br/web/help/pt/RenderizandooLayout.html
//          [EN] https://radcore.pro.br/web/help/en/LayoutRender.html
procedure TfrmDEMOACTIONS_BIND.UniFrameCreate(Sender: TObject);
begin
//   // para frames, não precisa efetuar o ResizeBlocks
//   rc_RenderLayout( Self, false, false, true, false );

   dbgActions.Hint :=
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
   '    width:10% mobile-h-10% mobile-v-10%|' +
   '    visible:false mobile-v]];' +       // visible=false ON MOBILE PORTRAIT

   'uf[[visible:false mobile-v|' +
   '    width:10% mobile-h-10% mobile-v-10%|' +
   ' ]];' +

   'descricao[['+
   '    title:City|'+
   '    width:52% mobile-h-45% mobile-v-40%]];' +
   ']]' ;

//   'rcAction_Actions[['+
//   '    title: |' +
//   '    width:28% mobile-h-40% mobile-v-40%]];' +
//   ']]';

   pgData.ActivePage := tabSearch;

   sqlActions.SQL.Text :=
     ' select ' +

     ' codigo, descricao,uf, ' +
     // by defaul 4 action btns has 20% width
     ' [[grid-btn:btnEdit|ico:fas-pencil-alt|cls:ButtonGreenNoBg]] ' +
     ' [[grid-btn:btnDelete|ico:fas-trash-alt|cls:ButtonRedNoBg]] ' +
     ' [[grid-btn:btnOptions|ico:fas-bars|cls:ButtonGrayNoBg]] ' +
     ' [[grid-btn:btnPrint|ico:fas-print|cls:ButtonBlueNoBg]] ' +

     ' from ' + dm_rc.rc_DBSchema + 'cidades ' + //6.1.0.0

//     ' where codigo <= 1' +

     ' order by codigo ';

   dm_rc.rc_ActionBtnsRender( Self, dbgActions );

  // dm_rc.rc_OpenQuery( sqlActions );

//   // configurar lookups...mascaras...etc.. preparar query [[fields]]...
//   // adjust the lookup tables according to the query name
//   dm_rc.rc_RenderLookUpControls( Self );
//   // atualizar todos os LOOKUPs dinamicamente
//   mm.varC_Lookup_Code := '';
//   //dm_rc.rc_LookUpUpdateData(  self  );

//   // para frames, não precisa efetuar o ResizeBlocks
   rc_RenderLayout( Self, false, false, false, false, true ); // v. 4.0.0.4
   // contar quantos campos tem pra ativar ou nao o FORCEFIT
   // FORCEFIT fica melhor com poucos campos, mas nao funciona bem quando o LOCKED está ativo
   dm_rc.rc_DBGridUpdateAll( Self , false, false, false ); // 



   // configurar lookups...mascaras...etc.. preparar query [[fields]]...
   // adjust the lookup tables according to the query name
   dm_rc.rc_RenderLookUpControls( Self );
   // atualizar todos os LOOKUPs dinamicamente
   mm.varC_Lookup_Code := '';
   //dm_rc.rc_LookUpUpdateData(  self  );
end;

procedure TfrmDEMOACTIONS_BIND.UniFrameReady(Sender: TObject);
var
   cTagString : string;
begin
   // adjust edit masks
   dm_rc.rc_ApplyEditMasks( Self );
   dm_rc.rc_ResizeBlocks( Self, true, true );

   dm_rc.rc_OpenQuery( sqlActions );

   // contar quantos campos tem pra ativar ou nao o FORCEFIT
   // FORCEFIT fica melhor com poucos campos, mas nao funciona bem quando o LOCKED está ativo
   //dm_rc.rc_DBGridUpdateAll( Self , false); // v. 3.3.3.0
   dm_rc.rc_DBGridUpdateAll( Self , false, false, true); // 
   // 6.0.0.0
   // tag-string ?
   cTagString := rc_GetHintAttr( 'tag-form:', Self.Hint );
   if cTagString.ToUpper = 'E' then
      btnEditClick( self );
end;
// -------------------------------------------------------------------------
initialization
   RegisterClass( TfrmDEMOACTIONS_BIND );

end.


