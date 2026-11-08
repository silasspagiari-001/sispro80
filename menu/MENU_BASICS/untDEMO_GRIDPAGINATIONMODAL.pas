unit untDEMO_GRIDPAGINATIONMODAL; //8.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, untGenericModalForm, uniSweetAlert, uniGUIBaseClasses, uniTimer, uniEdit, uniDBEdit, uniLabel, uniPanel, uniScrollBox, uniButton, uniBitBtn, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniBasicGrid, uniDBGrid, uniPageControl, uniMultiItem, uniComboBox;

type
  TfrmDEMO_GRIDPAGINATIONMODAL = class(TfrmGenericModalForm)
    UniScrollBox1: TUniScrollBox;
    sqlActions: TFDQuery;
    dsActions: TDataSource;
    rcBlock2: TUniContainerPanel;
    BlockTitle: TUniContainerPanel;
    btSair: TUniLabel;
    UniLabel2: TUniLabel;
    paPanelOptions: TUniContainerPanel;
    rcBlock2000: TUniContainerPanel;
    UniLabel9: TUniLabel;
    labClosePanelOptions: TUniLabel;
    btnOk: TUniBitBtn;
    edIniSpin: TUniNumberEdit;
    paEdit: TUniContainerPanel;
    rcBlock3: TUniContainerPanel;
    edPage: TUniEdit;
    edTotPages: TUniEdit;
    rcBlock8: TUniContainerPanel;
    cbxItemsPerPage: TUniComboBox;
    rcBlock6: TUniContainerPanel;
    lab_rc_Recs: TUniLabel;
    cbxRecs: TUniComboBox;
    rcBlock4: TUniContainerPanel;
    BlockBtns: TUniContainerPanel;
    btn_rc_First_pg: TUniBitBtn;
    btn_rc_Previous_pg: TUniBitBtn;
    btn_rc_pg_1: TUniBitBtn;
    btn_rc_pg_2: TUniBitBtn;
    btn_rc_pg_3: TUniBitBtn;
    btn_rc_Next_pg: TUniBitBtn;
    btn_rc_Last_pg: TUniBitBtn;
    procedure btSairClick(Sender: TObject);
    procedure dbgActionsModalCellClick(Column: TUniDBGridColumn);
    procedure UniFormCreate(Sender: TObject);
    procedure dbgActionsModalDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure UniFormAfterShow(Sender: TObject);
    procedure cbxItemsPerPageChange(Sender: TObject);
    procedure btn_rc_First_pgClick(Sender: TObject);
    procedure btn_rc_Last_pgClick(Sender: TObject);
    procedure btn_rc_Previous_pgClick(Sender: TObject);
    procedure btn_rc_Next_pgClick(Sender: TObject);
    procedure btn_rc_pg_1Click(Sender: TObject);
    procedure cbxItemsPerPageClick(Sender: TObject);
    procedure cbxRecsClick(Sender: TObject);
    procedure labClosePanelOptionsClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    iTotPage, iPage : integer;

    FNextBlc            : integer;

  public
    { Public declarations }
    procedure rc_QueryPaginate( pTable : string; pQuery : TFDQuery; pPage : integer = 1 );
    procedure rc_RefreshListView;
    procedure rc_ListViewEdit( sender : TObject );
    procedure rc_ListViewDel( sender : TObject );

    function  GetNextBlc:integer;
  end;

function frmDEMO_GRIDPAGINATIONMODAL: TfrmDEMO_GRIDPAGINATIONMODAL;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, uconsts, uconsts_cfg, Main, untDM_RC, mkm_layout, mkm_dbfuncs, mkm_createcomponents, str_func, mkm_func_web;

function frmDEMO_GRIDPAGINATIONMODAL: TfrmDEMO_GRIDPAGINATIONMODAL;
begin
  Result := TfrmDEMO_GRIDPAGINATIONMODAL(mm.GetFormInstance(TfrmDEMO_GRIDPAGINATIONMODAL));
end;

procedure TfrmDEMO_GRIDPAGINATIONMODAL.btnOkClick(Sender: TObject);
begin
  inherited;
  btn_rc_pg_3.Caption := intToStr( Trunc(edIniSpin.Value) );
  btn_rc_pg_1Click( btn_rc_pg_3 );
  labClosePanelOptionsClick(self);
end;

procedure TfrmDEMO_GRIDPAGINATIONMODAL.btn_rc_First_pgClick(Sender: TObject);
begin
  inherited;
  iPage := 1;
  edPage.Text := iPage.ToString;
  rc_QueryPaginate( 'clientes', sqlActions, iPage );
end;

procedure TfrmDEMO_GRIDPAGINATIONMODAL.btn_rc_Last_pgClick(Sender: TObject);
begin
  inherited;
  iTotPage := StrToIntDef( edTotPages.Text , 500 );
  edPage.Text := iTotPage.ToString;
  rc_QueryPaginate( 'clientes', sqlActions, iTotPage );
end;

procedure TfrmDEMO_GRIDPAGINATIONMODAL.btn_rc_Next_pgClick(Sender: TObject);
begin
  inherited;
  Inc( iPage );
  if iPage > iTotPage then
     iPage := iTotPage;
  edPage.Text := iPage.ToString;
  rc_QueryPaginate( 'clientes', sqlActions, iPage );
end;

procedure TfrmDEMO_GRIDPAGINATIONMODAL.btn_rc_pg_1Click(Sender: TObject);
begin
  inherited;
  iPage := StrToIntDef( TUniControl(sender).Caption, 1 );
  edPage.Text := iPage.ToString;
  rc_QueryPaginate( 'clientes', sqlActions, iPage );
end;

procedure TfrmDEMO_GRIDPAGINATIONMODAL.btn_rc_Previous_pgClick(Sender: TObject);
begin
  inherited;
  Dec( iPage );
  if iPage < 1 then
     iPage := 1;
  edPage.Text := iPage.ToString;
  rc_QueryPaginate( 'clientes', sqlActions, iPage );
end;

procedure TfrmDEMO_GRIDPAGINATIONMODAL.btSairClick(Sender: TObject);
begin
  inherited;
  dm_rc.rc_CloseQuerys( Self , False, False );
  Close;
end;

procedure TfrmDEMO_GRIDPAGINATIONMODAL.cbxItemsPerPageChange(Sender: TObject);
begin
  inherited;
  rc_QueryPaginate( 'clientes', sqlActions, StrToIntDef( edPage.Text, 1 ) );
end;

procedure TfrmDEMO_GRIDPAGINATIONMODAL.cbxItemsPerPageClick(Sender: TObject);
begin
  inherited;
  if cbxItemsPerPage.ItemIndex + 1 < cbxItemsPerPage.Items.Count then
     cbxItemsPerPage.ItemIndex := cbxItemsPerPage.ItemIndex + 1
  else
     cbxItemsPerPage.ItemIndex := 0;
  rc_QueryPaginate( 'clientes', sqlActions );
end;
//7.0.0.0
procedure TfrmDEMO_GRIDPAGINATIONMODAL.cbxRecsClick(Sender: TObject);
begin
  inherited;
    dm_rc.rc_AddToInputBoxCustom( true , ibcNumber, '[[valid:>0|input-addon:spin min:0 max:100 step:1]]' , 'Page Number' , '', 0, 0 );
    dm_rc.rc_ShowInputBoxCustom( 'Select a Page' , true, '' , '', '', '', false, true, '[[frm-anim:bt | frm-align:bottom off-bottom:40 ]]' );
    // se nao clicou em cancelar | if do not click on cancel button
    if not mm.varB_No then
    begin
       btn_rc_pg_3.Caption := IntToStr( dm_rc.rc_GetInputBoxCustomValue );
       btn_rc_pg_1Click( btn_rc_pg_3 );
    end;

    exit;

    dm_rc.rc_ShowHideObject(
      self,
      paPanelOptions,
      0,
      0,
      1,
      false,
      ( paPanelOptions.Tag = 0 ),
      true );
end;

procedure TfrmDEMO_GRIDPAGINATIONMODAL.dbgActionsModalCellClick(Column: TUniDBGridColumn);
begin
  inherited;
  dm_rc.rc_ActionBtnCellClick( self, Column.FieldName );
end;

procedure TfrmDEMO_GRIDPAGINATIONMODAL.dbgActionsModalDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
     dm_rc.rc_GridDrawCell( TUniDBGrid( sender ) , ACol, ARow, Column, Attribs ) ;
end;

function TfrmDEMO_GRIDPAGINATIONMODAL.GetNextBlc: integer;
begin
  inc(FNextBlc);
  result := FNextBlc;
end;

procedure TfrmDEMO_GRIDPAGINATIONMODAL.labClosePanelOptionsClick(Sender: TObject);
begin
  inherited;
   dm_rc.rc_ShowHideObject(
     self,
     paPanelOptions,
     0,
     0,
     1,
     false,
     ( paPanelOptions.Tag = 0 ),
     true );
end;
//8.0.0.0
procedure TfrmDEMO_GRIDPAGINATIONMODAL.rc_ListViewDel(sender: TObject);
var
   i    : integer;
   cObj : string;
   oObj : TUniControl;
begin
   i := TUniControl( sender ).Tag;
   cObj := 'labcustomer_name' + i.ToString;
   oObj := TUniLabel( FindComponent( cObj ) );

   if oObj = nil then
      dm_rc.rc_ShowYesNo( 'Confirm Delete ?' )
   else
      dm_rc.rc_ShowYesNo( 'Customer: ' + TUniLAbel( oObj ).Caption + '.<br>Confirm Delete ?' )
end;

procedure TfrmDEMO_GRIDPAGINATIONMODAL.rc_ListViewEdit(sender: TObject);
begin
     dm_rc.rc_ShowSweetAlertSuccess( 'Item Editing...' );
end;

procedure TfrmDEMO_GRIDPAGINATIONMODAL.rc_QueryPaginate( pTable : string; pQuery: TFDQuery; pPage: integer);
var
   cSql : string;
   iPos : integer;
begin
  try
     if ( mm.CONFIG_DATABASE = 'SQLSERVER' ) or ( mm.CONFIG_DATABASE = 'ORACLE' ) then
        iPos := Pos( ' ROWS FETCH NEXT', pQuery.SQL.Text ) - 1
     else
     if ( mm.CONFIG_DATABASE = 'MYSQL' ) or ( mm.CONFIG_DATABASE = 'PGSQL' ) or ( mm.CONFIG_DATABASE = 'SQLITE' ) then
        iPos := Pos( ' LIMIT ', pQuery.SQL.Text ) - 1
     else
     if ( mm.CONFIG_DATABASE = 'FIREBIRD' ) then
        iPos := Pos( ' ROWS ', pQuery.SQL.Text ) - 1;

     if iPos > 0 then
        cSql := Copy( pQuery.SQL.Text, 1, iPos )
     else
        cSql := pQuery.SQL.Text;

     pQuery.SQL.Text := cSql + ' ' +
                        dm_rc.rc_GetSQL( mm.CONFIG_DATABASE , 'cmd_paginate',
                        StrToIntDef( edPage.Text, 1 ), StrToIntDef( ReturnNumbers( cbxItemsPerPage.Text ), 10 )  ) + ' ';
     dm_rc.rc_OpenQuery( sqlActions );

     lab_rc_Recs.Tag := dm_rc.rc_GetTotRecords( mm.varB_IsNot_API, pTable );

     iPage    := StrToIntDef( edPage.Text , 1);
     iTotPage := ( lab_rc_Recs.Tag div StrToIntDef( ReturnNumbers( cbxItemsPerPage.Text ), 10 ) );
     edTotPages.Text := IntToStr( iTotPage );

     cbxRecs.Text        := iPage.ToString + ' of ' + iTotPage.ToString ;//lab_rc_Recs.Tag.ToString;
     //lab_rc_Recs.Caption := lab_rc_Recs.Tag.ToString;
     btn_rc_pg_1.Caption := iPage.tostring;
     btn_rc_pg_2.Caption := ( iPage+1 ).tostring;
     btn_rc_pg_3.Caption := ( iPage+2 ).tostring;
     btn_rc_pg_1.Enabled := iPage <> iTotPage ;
     btn_rc_pg_2.Enabled := btn_rc_pg_1.Enabled;
     btn_rc_pg_3.Enabled := btn_rc_pg_1.Enabled;

     rc_RefreshListView;
  finally
     Self.HideMask;
  end;
end;

procedure TfrmDEMO_GRIDPAGINATIONMODAL.rc_RefreshListView;
var
   w, i, c : integer;
   oPg, oBlock, oBlock2 : TUniContainerPanel;
   sboxHorizontalScroll : TUniScrollBox;
   oLabel : TUniLabel;
   oBtnEdit, oBtnDelete : TUniBitBtn;
begin
    try
       dm_rc.memTemp.Close;
       dm_rc.memTemp.filtered := false;

       dm_rc.memTemp.Data := dm_rc.rc_GetRecord( mm.varB_IsNot_API ,
                                      True,
                                      ' select codigo,nome,avatar ' +
                                      ' from ' + dm_rc.rc_DBSchema + 'usuarios ' + //6.1.0.0
                                      ' order by codigo' );

       if mm.varC_LastErrorMsg <> '' then
       begin
           dm_rc.rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastErrorMsg, 'error' );
           Exit;
       end;

       i := 20;
       c := 0;
       sboxHorizontalScroll := rc_CreateScrollBox( Self, rcBlock2, 'sboxHorizontalScroll', rcBlock2.Width , rcBlock2.Height , 0 , 0, '[[scrollbar:show-v|scrollbar-color:#c0c0c0 #fff]]', true );//7.0.0.0
       sboxHorizontalScroll.ScrollDirection := sdBoth;
       sboxHorizontalScroll.Anchors := [ akLeft,akRight,akTop,akBottom ];
       dm_rc.memTemp.First;
       sqlActions.First;
       while not sqlActions.Eof do
       begin
            Inc(c);
            w := sqlActions.FieldByName('codigo').AsInteger;

            oBlock2 := rc_CreateBlock( Self, sboxHorizontalScroll, 10 + w, 140 , 80, '[[cols:12|cls:card-info-box-white]]', true );
              oLabel := rc_CreateLabel( Self, oBlock2, 'avatar' + i.ToString, 100, 30, 15, 15, '' ); //80 - ( i * 80 )
              oLabel.TextConversion :=  txtHTML;
              oLabel.Caption := '<img id="userimg" class="mini-avatar img-thumbnail" src="files/images/avatars/avatar_' + c.ToString + '.png" alt="User Img' + c.ToString + '">';

              oLabel := rc_CreateLabel( Self, oBlock2, 'labcustomer_id' + w.ToString, 50, 30, 80, 15, '', true, true ); //8.0.0.0
              oLabel.TextConversion :=  txtHTML;
              oLabel.Font.Color     := clGray;
              oLabel.Font.Size      := 12;
              oLabel.Caption        := '#' + sqlActions.FieldByName('codigo').AsString;

              oLabel := rc_CreateLabel( Self, oBlock2, 'labcustomer_name' + w.ToString, 100, 30, 80, 40, '', true, true ); //8.0.0.0
              oLabel.TextConversion :=  txtHTML;
              oLabel.Font.Size      := 10;
              oLabel.Caption        := Copy( sqlActions.FieldByName('nome').AsString, 1, 20 ) + varIIF( length(sqlActions.FieldByName('nome').AsString ) > 20,  '...', '' );

              oBtnEdit := rc_CreateBitBtn( Self, oBlock2, 'btncustomer_edit' + w.ToString, 30, 24, oBlock2.Width - 45, 14, '[[ico:fas-pencil-alt |cls:ButtonOutline ButtonOutlineBlue ButtonRound btn-font-blue | ]]', true, true ); //8.0.0.0
              oBtnEdit.Anchors := [akTop, akRight];
              oBtnEdit.Tag     := w;
              oBtnEdit.OnClick := rc_ListViewEdit;

              oBtnDelete := rc_CreateBitBtn( Self, oBlock2, 'btncustomer_del' + w.ToString, 30, 24, oBlock2.Width - 45, 42, '[[ico:fas-trash-alt |cls:ButtonOutline ButtonOutlineRed ButtonRound btn-font-red | ]]', true, true ); //8.0.0.0
              oBtnDelete.Anchors := [akTop, akRight];
              oBtnDelete.Tag       := w;
              oBtnDelete.OnClick := rc_ListViewDel;

            i := i + 140 + StrToIntDef( mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET, 20 );
            sqlActions.Next;
            if c>10 then c:= 0;

       end;
    finally
       oBlock2 := rc_CreateBlock( Self, sboxHorizontalScroll, 10 + w + 1, 140 , 10, '[[cols:12]]', true );
       rc_RenderLayout( Self, false, true );
       dm_rc.rc_ResizeBlocks( Self, true, true );
    end;
end;

procedure TfrmDEMO_GRIDPAGINATIONMODAL.UniFormAfterShow(Sender: TObject);
begin
  inherited;
   // para frames, não precisa efetuar o ResizeBlocks | for frames, no need to perform ResizeBlocks
   rc_RenderLayout( Self, true, true, true );
end;

procedure TfrmDEMO_GRIDPAGINATIONMODAL.UniFormCreate(Sender: TObject);
var
   cTagString : string;
begin

  inherited;

  cbxItemsPerPage.ItemIndex := 0;

  sqlActions.SQL.Text :=
    ' select ' +
    ' codigo, nome, valor_contrato ' +
    ' from ' + dm_rc.rc_DBSchema + 'clientes ' + //6.1.0.0
//    ' where codigo <= 1' +
    ' order by codigo ';

    rc_QueryPaginate( 'clientes', sqlActions );
//  sqlActions.SQL.Text := sqlActions.SQL.Text + ' ' +
//                         dm_rc.rc_GetSQL( mm.CONFIG_DATABASE , 'cmd_paginate',
//                         StrToIntDef( edPage.Text, 1 ), StrToIntDef( cbxItemsPerPage.Text, 10 )  ) + ' ';
//  dm_rc.rc_OpenQuery( sqlActions );
//
//  lab_rc_Recs.Caption := sqlActions.RecordCount.ToString;
   // 6.0.0.0
   // tag-form ?
   cTagString := dm_rc.rc_GetTagFormAttr( Self, true );
//   if cTagString.ToUpper = 'E' then

//  // para frames, não precisa efetuar o ResizeBlocks | for frames, no need to perform ResizeBlocks
//  rc_RenderLayout( Self, false, false, true, false );

end;

initialization
   RegisterClass( TfrmDEMO_GRIDPAGINATIONMODAL ) ;

end.
