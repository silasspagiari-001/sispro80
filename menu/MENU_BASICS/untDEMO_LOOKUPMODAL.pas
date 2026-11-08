unit untDEMO_LOOKUPMODAL; // 6.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, untGenericModalForm, uniSweetAlert, uniGUIBaseClasses, uniTimer, uniEdit, uniDBEdit, uniLabel, uniPanel, uniScrollBox, uniButton, uniBitBtn, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmDEMO_LOOKUPMODAL = class(TfrmGenericModalForm)
    UniScrollBox1: TUniScrollBox;
    rcBlock5: TUniContainerPanel;
    btSair: TUniLabel;
    rcBlock20: TUniContainerPanel;
    UniLabel1Clone: TUniLabel;
    edLkpCLIENTES: TUniDBEdit;
    rcBlock30: TUniContainerPanel;
    UniLabel2Clone: TUniLabel;
    ed_lkp_client: TUniEdit;
    sqlLookUp: TFDQuery;
    dsLookUp: TDataSource;
    rcBlock7: TUniContainerPanel;
    UniLabel1: TUniLabel;
    edLkpTB_BIGINT: TUniDBEdit;
    rcBlock9: TUniContainerPanel;
    UniLabel5Clone: TUniLabel;
    ed_lkp_test_bigint: TUniEdit;
    rcBlock12: TUniContainerPanel;
    UniLabel2: TUniLabel;
    edLkpT040001: TUniDBEdit;
    rcBlock15: TUniContainerPanel;
    UniLabel5CloneClone: TUniLabel;
    ed_lkp_test_string: TUniEdit;
    rcBlock80: TUniContainerPanel;
    UniLabel4: TUniLabel;
    edLkpMOVCAIXA: TUniDBEdit;
    rcBlock90: TUniContainerPanel;
    UniLabel5CloneCloneClone: TUniLabel;
    ed_lkp_test_date: TUniEdit;
    rcBlock100: TUniContainerPanel;
    UniLabel4Clone: TUniLabel;
    edLkpTB_TEST: TUniDBEdit;
    rcBlock110: TUniContainerPanel;
    UniLabel5CloneCloneCloneClone: TUniLabel;
    ed_lkp_test_getpk: TUniEdit;
    edIDFILIAL: TUniEdit;
    UniLabel5: TUniLabel;
    procedure UniFormCreate(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure edLkpTB_BIGINTEnter(Sender: TObject);
    procedure edLkpT040001Enter(Sender: TObject);
    procedure edLkpMOVCAIXAEnter(Sender: TObject);
    procedure ed_lkp_clientEnter(Sender: TObject);
    procedure edLkpCLIENTESClick(Sender: TObject);
    procedure edLkpCLIENTESEnter(Sender: TObject);
    procedure edLkpTB_TESTEnter(Sender: TObject);
    procedure edLkpTB_TESTClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmDEMO_LOOKUPMODAL: TfrmDEMO_LOOKUPMODAL;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, uconsts, uconsts_cfg, Main, untDM_RC, mkm_layout, mkm_func_web;

function frmDEMO_LOOKUPMODAL: TfrmDEMO_LOOKUPMODAL;
begin
  Result := TfrmDEMO_LOOKUPMODAL(mm.GetFormInstance(TfrmDEMO_LOOKUPMODAL));
end;

procedure TfrmDEMO_LOOKUPMODAL.btSairClick(Sender: TObject);
begin
  inherited;
  sqlLookUp.Cancel;
  Close;
end;

procedure TfrmDEMO_LOOKUPMODAL.edLkpCLIENTESClick(Sender: TObject);
var
   sGridAttr : string;
begin
  inherited;

//  sGridAttr := '[[' +
//               'fieldmasks: grid-resize|' +
//               'nome[[cls:{bloqueado=S,color-red-hover rc-font-bold,color-blue-hover rc-font-bold}]];' +
//               'bloqueado[[visible:false]];' +
//               'codigo[[visible:false]];' +
//               'cnpj_cpf[[visible:false]];' +
//               'fone1[[visible:false]];' +
//               ']]';
  dm_rc.rc_LookUpSearchFilter( Sender, '', '', 'bloqueado;cnpj_cpf;fone1', sGridAttr );
end;

procedure TfrmDEMO_LOOKUPMODAL.edLkpCLIENTESEnter(Sender: TObject);
var
   i : Integer;
begin
  inherited;
  if ( sqlLookUp.State in [ dsEdit, dsInsert ] ) then
  begin
       if edLkpCLIENTES.Text <> '' then
       begin
         i := dm_rc.rc_GetLookUpTag( edLkpCLIENTES );
         ed_lkp_client.Text := 'Pk=' + i.ToString + ' (' + edLkpCLIENTES.Text + ')' ;// rc_GetHintAttr( 'lkp-tag:', edLkpCLIENTES.Hint ) //edLkpUFS.Tag.ToString
       end
       else
          ed_lkp_client.Text := '';
  end;
end;

procedure TfrmDEMO_LOOKUPMODAL.edLkpMOVCAIXAEnter(Sender: TObject);
var
   d : TDateTime;
begin
  inherited;
  if edLkpMOVCAIXA.Text <> '' then
  begin
     d := dm_rc.rc_GetLookUpTag( edLkpMOVCAIXA , lktDateTime );
     ed_lkp_test_date.Text := 'Pk=' + DateTimeToStr( d ) + ' (' + Trim(edLkpMOVCAIXA.Text ) + ')';
  end
  else
     ed_lkp_test_date.Text := '';
end;

procedure TfrmDEMO_LOOKUPMODAL.edLkpT040001Enter(Sender: TObject);
begin
  inherited;

  if edLkpT040001.Text <> '' then
     ed_lkp_test_string.Text := 'Pk=' + dm_rc.rc_GetLookUpTag( edLkpT040001, lktString ) + ' (' + edLkpT040001.Text  + ')'// rc_GetHintAttr( 'lkp-tag:', edLkpT040001.Hint ) //edLkpUFS.Tag.ToString
  else
     ed_lkp_test_string.Text := '';
end;

procedure TfrmDEMO_LOOKUPMODAL.edLkpTB_BIGINTEnter(Sender: TObject);
var
   i : Largeint;
begin
  inherited;
  if edLkpTB_BIGINT.Text <> '' then
  begin
     i := dm_rc.rc_GetLookUpTag( edLkpTB_BIGINT, lktInt64 );
     ed_lkp_test_bigint.Text := 'Pk=' + i.ToString + '(' + edLkpTB_BIGINT.Text + ')';  // rc_GetHintAttr( 'lkp-tag:', edLkpTB_BIGINT.Hint ) //edLkpUFS.Tag.ToString
  end
  else
     ed_lkp_test_bigint.Text := '';
end;

procedure TfrmDEMO_LOOKUPMODAL.edLkpTB_TESTClick(Sender: TObject);
begin
  inherited;
  dm_rc.rc_LookUpSearchFilter( Sender, 'IDFILIAL=' + edIDFILIAL.Text, '', '', '' );
end;

procedure TfrmDEMO_LOOKUPMODAL.edLkpTB_TESTEnter(Sender: TObject);
var
   i : Integer;
begin
  inherited;

  if edLkpTB_TEST.Text <> '' then
  begin
    i := dm_rc.rc_GetLookUpTag( edLkpTB_TEST );
    ed_lkp_test_getpk.Text := 'Pk=' + i.ToString + ' (' + edLkpTB_TEST.Text + ')' ;// rc_GetHintAttr( 'lkp-tag:', edLkpCLIENTES.Hint ) //edLkpUFS.Tag.ToString
  end
  else
     ed_lkp_test_getpk.Text := '';

end;

procedure TfrmDEMO_LOOKUPMODAL.ed_lkp_clientEnter(Sender: TObject);
var
   i : Integer;
begin
  inherited;
//  if ( sqlLookUp.State in [ dsEdit, dsInsert ] ) then
//  begin
//     i := dm_rc.rc_GetLookUpTag( edLkpCLIENTES );
//     ed_lkp_client.Text := edLkpCLIENTES.Text + ' Pk=' + i.ToString ;// rc_GetHintAttr( 'lkp-tag:', edLkpCLIENTES.Hint ) //edLkpUFS.Tag.ToString
//
////       if edLkpCLIENTES.Text <> '' then
////       begin
////          i := dm_rc.rc_GetLookUpTag( edLkpCLIENTES );
////          ed_lkp_client.Text := edLkpCLIENTES.Text + ' Pk=' + i.ToString ;// rc_GetHintAttr( 'lkp-tag:', edLkpCLIENTES.Hint ) //edLkpUFS.Tag.ToString
////          // or you can use...
////          //ed_lkp_client.Text := dm_rc.rc_GetLookUpField( Self, edLkpCLIENTES , 'nome' ) + ' | PK=' + IntToStr( dm_rc.rc_GetLookUpField( Self, edLkpCLIENTES , 'codigo' ) );
////       end
////       else
////          ed_lkp_client.Text := '';
//  end;
end;

procedure TfrmDEMO_LOOKUPMODAL.UniFormCreate(Sender: TObject);
begin
  inherited;
     // configurar lookups...mascaras...etc.. preparar query [[fields]]...
     // adjust the lookup tables according to the query name
     dm_rc.rc_RenderLookUpControls( Self );

     sqlLookUp.Tag := Random(100000) + Random(50000);
     sqlLookUp.close;
     sqlLookUp.SQL.Text := 'select * from ' + dm_rc.rc_DBSchema + 'tb_reports where codigo = :table_pk'; //6.1.0.0
     sqlLookUp.ParamByName( 'table_pk' ).AsInteger := sqlLookUp.Tag;
     dm_rc.rc_OpenQuery( sqlLookUp );
     //[PT] o uso da tab. tb_reports é exclusivamente para reaproveitar a geração de LOOKUps dinamicos
     //      que serão usados como FILTROS para os relatórios
     //
     //      Nenhum registro será EFETIVAMENTE inserido..ao sair desta tela, existe um CANCEL padrão
     //[EN] the use of tab. tb_reports is exclusively for reusing the generation of dynamic LOOKUps
     //      which will be used as FILTERS for the reports
     //
     //      No records will EFFECTIVELY be inserted.. when exiting this screen, there is a default CANCEL
     sqlLookUp.Insert;
     sqlLookUp.FieldByName( 'codigo' ).AsInteger := sqlLookUp.Tag;

     //[PT] atualizar todos os LOOKUPs dinamicamente
     //[EN] update all LOOKUPs dynamically
     mm.varC_Lookup_Code := '';
     dm_rc.rc_LookUpUpdateData(  self  );
end;

initialization
   RegisterClass( TfrmDEMO_LOOKUPMODAL ) ;

end.
