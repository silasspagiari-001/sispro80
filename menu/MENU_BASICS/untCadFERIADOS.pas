unit untCadFERIADOS; // 6.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, untfrmBaseCRUD, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Vcl.Menus, uniMainMenu, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame, uniButton, uniBitBtn, uniDateTimePicker, uniCheckBox, uniEdit, uniMultiItem, uniComboBox,
  uniScrollBox, uniPanel, uniBasicGrid, uniDBGrid, uniPageControl, uniLabel, uniGUIBaseClasses, uniDBDateTimePicker, uniDBEdit,
  uniDBCheckBox, uniRadioGroup, uniSweetAlert;

type
  TfrmCadFERIADOS = class(TfrmBaseCRUD)
    rcBlock10: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    rcBlock20: TUniContainerPanel;
    edDataCad: TUniDBDateTimePicker;
    UniLabel5: TUniLabel;
    rcBlock30: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock40: TUniContainerPanel;
    labFeriados: TUniLabel;
    UniLabel54: TUniLabel;
    UniLabel1: TUniLabel;
    rcBlock50: TUniContainerPanel;
    labRcCollapseSwt: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel11: TUniLabel;
    UniLabel14: TUniLabel;
    UniLabel10: TUniLabel;
    UniLabel12: TUniLabel;
    UniLabel15: TUniLabel;
    rcBlock60: TUniContainerPanel;
    UniLabel18: TUniLabel;
    bsrgpTipo01_M_db: TUniLabel;
    UniLabel17: TUniLabel;
    bsrgpTipo02_E_db: TUniLabel;
    UniLabel19: TUniLabel;
    bsrgpTipo03_F_db: TUniLabel;
    UniLabel21: TUniLabel;
    rcBlock35: TUniContainerPanel;
    labRcCollapse01: TUniLabel;
    labRcCollapse02: TUniLabel;
    labRcCollapse03: TUniLabel;
    btnPrint: TUniBitBtn;
    procedure UniFrameCreate(Sender: TObject);
    procedure bsrgpTipo01_M_dbClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses untdm_rc, mkm_layout;

procedure TfrmCadFERIADOS.bsrgpTipo01_M_dbClick(Sender: TObject);
begin
  inherited;

  //dm_rc.rc_ShowMessage( 'Selected ItemIndex = ' + dm_rc.rc_GetItemIndexFromRgp( TUniLAbel( sender ) ).ToString );

end;

procedure TfrmCadFERIADOS.btnPrintClick(Sender: TObject);
begin
  inherited;
  DM_RC.rc_ShowSweetAlert('Info!','Printing...', 'info' ); //  remover

end;

procedure TfrmCadFERIADOS.btnSaveRegClick(Sender: TObject);
var
   vTipo : integer;
begin
  inherited;
  vTipo := StrToIntDef( DM_RC.rc_GetItemIndexFromRgp( bsrgpTipo03_F_db ).ToString, 0 );
  if ( vTipo = 0 )  then
  begin
    DM_RC.rc_ShowSweetAlert('Atenção!','Habilite um Tipo de Feriado', 'warning' );
    Abort;
  end;
end;

procedure TfrmCadFERIADOS.UniFrameCreate(Sender: TObject);
begin

  sqlMaster.close;
  sqlMaster.SQL.Text := ' SELECT [[fields]] ' +
                        '   FROM [[table]] tab ' +
                        '  WHERE tab.[[pk]] = :table_pk ' +

                        '[grid]' +
                        //8.5.0.0
                        ' SELECT ' +
                        //action buttons: primeira coluna do grid
//                        '        [[grid-btn-align:center]]' + //8.5.0.0
//                        '        [[grid-btn:edit]] '    + // create default action button: EDIT
//                        '        [[grid-btn:delete]] '  + // create default action button: DELETE
//                        '        [[grid-btn:options]] ' + // create default action button: OPTIONS
//                        '        [[grid-btn:btnPrint|ico:fas-print|cls:ButtonGreen]], ' +  //8.0.0.0 "NoBg" will be added if "(btns:nobg)" was defined


                        '        tab.[[pk]] as "CÓDIGO" , tab.data,' +
                        '        tab.descricao as "DESCRIÇÃO", ' +
                        '        tab.facultativo, ' +
                        //8.0.0.0 bug fix mysql thanks for Ebnezer Junior
                        '        cast( ' +
                        '          case coalesce( tab.tipo, '''' ) ' +
                        '          when ''M'' then ' + QuotedStr( rc_SpanText( 'badge bg-info'    , 'municipal' ) ) +
                        '          when ''E'' then ' + QuotedStr( rc_SpanText( 'badge bg-success' , 'estadual' ) ) +
                        '          when ''F'' then ' + QuotedStr( rc_SpanText( 'badge bg-warning' , 'federal' ) ) +
                        '          end as char(200) ' +
                        '        ) as Tipo, ' +
                        '        [[allpks]], ' +

                        // New Dynamic Actions COLUMNS
                        //
                        // Essas configurações são apenas para demonstrar o recurso do RadCORE
                        // E não somente para executar acções de CRUD..vc pode criar qualquer tipo de ACTION BUTTON
                        // apenas lembre de adicionar o EVENTO respectivo em [gridname]CellClick do seu formulário
                        //
                        // These settings are just to demonstrate the RadCORE feature
                        // And not only do CRUD..vc actions, you can create any type of ACTION BUTTON
                        // just remember to add the respective EVENT in [gridname] CellClick of your form
                        //
                        // Abaixo ( grid-btn:( new ) também é para demonstrar que podemos configurar a classe CSS e o ícone da action
                        // O recurso de action buttons poderá ainda ser melhorado
                        //
                        // Below (grid-btn :( new) is also to demonstrate that we can configure the CSS class and the action icon
                        // The action buttons feature can still be improved
                        //

//                      '        [[grid-btn:edo]] '    + // create default action buttons: EDIT DELETE OPTIONS
                        '        [[grid-btn:edit]] '    + // create default action button: EDIT
                        '        [[grid-btn:delete]] '  + // create default action button: DELETE
                        '        [[grid-btn:options]] ' + // create default action button: OPTIONS

                        // create additional action button: PRINT
                        //
                        // btnPrint has a "onClick" event
                        // dbgSearchCRUD inherits a OnCellClick event
//                        '        [[grid-btn:btnPrint|ico:fas-print|cls:ButtonGreenNoBg]] ' +
                        '        [[grid-btn:btnPrint|ico:fas-print|cls:ButtonGreen]] ' +  //8.0.0.0 "NoBg" will be added if "(btns:nobg)" was defined

//                        '        [[grid-btn:edit|cls:ButtonGreenNoBg]] '   + // you can add "ico:" attribute too
//                        '        [[grid-btn:delete|cls:ButtonRedNoBg]] '   + // you can add "ico:" attribute too
//                        '        [[grid-btn:options|cls:ButtonGrayNoBg]] ' + // you can add "ico:" attribute too

                        ' FROM [[table]] tab ';


  // in design time

  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:' +
                        'grid-resize|' +
                        //'model-crud:3(search:full)|'+ //only for model-crud-3
                        'model-crud:3(btns:nobg)|'+   //only for model-crud-3
                        //'model-crud:3|'+ //actions
                        'grid-paginator:center|'+
                        'grid-menu:off|' + //7.0.0.0 grid-menu:off
                        //'grid-forcefit:5 mobile-v-4 mobile-h-8|' +
                        //'grid-noforcefit|' +
                        'código[[' +
                        '    align:c|' +
                        '    width:12% mobile-h:12% mobile-v:15%|' +
                        '    visible:false mobile-v]];' +       // visible=false ON MOBILE PORTRAIT

                        'data[['+
                        '    width:18% mobile-h:18% mobile-v:22%|' +
                        '    visible:false mobile-v]];' +         // visible=false ON MOBILE PORTRAIT

                        'descrição[['+
                        '    width:30% mobile-h:35% mobile-v:65%]];' +

                        'tipo[[' +
                        '    width:10% mobile-h:10% mobile-v:12%|' +
                        '    align:c|' +
                        '    visible:false mobile-v]];' +           // visible=false ON MOBILE

                        'facultativo[[' +
                        '    width:10% mobile-h:10% mobile-v:12%|' +
                        //'    checkbox:S;N dv:Sim;Não|' + // dv = display values
                        '    checkbox:S;N|' + // dv = display values
                        '    titlealign:c|' +
                        '    align:c|' +
                        '    visible:false mobile]];' +           // visible=false ON MOBILE

                        ']]';


  ed_Where_Search.Text := '' ;
  ed_Order_Search.Text := 'tab.descricao';

  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDFieldDate.name, 'tab.data' , 'DATA' );

  inherited;

  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.' + ed_PK.Text + ' as "CÓDIGO"' , 'CÓDIGO' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.descricao as "DESCRIÇÃO"'       , 'DESCRIÇÃO' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.data'                           , 'DATA' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.tipo'                           , 'TIPO' );

end;

initialization
  RegisterClass(TfrmCadFERIADOS);

end.
