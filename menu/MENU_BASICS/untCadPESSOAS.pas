unit untCadPESSOAS; // 7.3.0.0
(*
[PT]edLkpCLIENTES demonstra o uso simultâneo de 2 pesquisas
[EN]edLkpCLIENTES demonstrates the simultaneous use of 2 searches


WebOptions.Paged deve estar TRUE
WebOptions.Paged must be TRUE
*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIApplication, uniGUIClasses, uniGUIFrame, untFrmCRUDproprio, Data.DB, uniBasicGrid, uniDBGrid,
  uniPanel, uniPageControl, uniGUIBaseClasses, uniScrollBox, uniDBEdit,
  uniMultiItem, uniComboBox, uniEdit, uniLabel, uniButton, uniBitBtn,
  uniDateTimePicker, uniDBDateTimePicker, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniCheckBox, uniFieldSet,
  uniDBComboBox, uniDBLookupComboBox, uniSpeedButton, uniDBCheckBox,
  uniMainMenu, uniHTMLFrame, Data.FMTBcd, Data.SqlExpr, uniSpinEdit, uniMemo, Vcl.Menus, uniSweetAlert, uniDBNavigator,
  untFrmBaseCRUD;

type
  TfrmCadPESSOAS = class(TfrmCRUDproprio)
    pgComplementData: TUniPageControl;
    tabComercial: TUniTabSheet;
    tabGeral: TUniTabSheet;
    Revisoes: TUniMenuItem;
    Veculos1: TUniMenuItem;
    sboxGridBlockTab1: TUniScrollBox;
    rcBlock515: TUniContainerPanel;
    rcBlock2: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    rcBlock15: TUniContainerPanel;
    UniLabel9: TUniLabel;
    rcBlock80: TUniContainerPanel;
    UniLabel6: TUniLabel;
    edCliName: TUniDBEdit;
    rcBlock90: TUniContainerPanel;
    UniLabel12: TUniLabel;
    edRazSoc: TUniDBEdit;
    rcBlock94: TUniContainerPanel;
    rcBlock95: TUniContainerPanel;
    UniLabel2: TUniLabel;
    labCollapseDefaultAddr: TUniLabel;
    rcBlock110: TUniContainerPanel;
    UniLabel4: TUniLabel;
    edAddress: TUniDBEdit;
    rcBlock120: TUniContainerPanel;
    UniLabel7: TUniLabel;
    edAddressNumber: TUniDBEdit;
    rcBlock140: TUniContainerPanel;
    UniLabel14: TUniLabel;
    edLkpCIDADES__PRINCIPAL: TUniDBEdit;
    rcBlock160: TUniContainerPanel;
    UniLabel15: TUniLabel;
    edbairro: TUniDBEdit;
    rcBlock100: TUniContainerPanel;
    UniLabel16: TUniLabel;
    edCep: TUniDBEdit;
    rcBlock150: TUniContainerPanel;
    UniLabel18: TUniLabel;
    edLkpCIDADES_SetDS_CODIIBGE: TUniDBEdit;
    rcBlock3: TUniContainerPanel;
    labRcCollapseGeneral: TUniLabel;
    UniLabel8: TUniLabel;
    UniContainerPanel2: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel53: TUniLabel;
    edSearchDTCADASTRO: TUniDateTimePicker;
    UniContainerPanel4: TUniContainerPanel;
    UniLabel54: TUniLabel;
    edSearchDTCADASTROFIM: TUniDateTimePicker;
    UniContainerPanel5: TUniContainerPanel;
    UniLabel55: TUniLabel;
    edSearchNOME: TUniEdit;
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel6: TUniContainerPanel;
    UniLabel56: TUniLabel;
    edSearchCNPJCPF: TUniEdit;
    UniContainerPanel7: TUniContainerPanel;
    UniLabel52: TUniLabel;
    edSearchVALOR_CONTRATO: TUniFormattedNumberEdit;
    UniContainerPanel9: TUniContainerPanel;
    UniContainerPanel8: TUniContainerPanel;
    UniLabel57: TUniLabel;
    edSearchCODIGO: TUniEdit;
    UniContainerPanel10: TUniContainerPanel;
    UniLabel58: TUniLabel;
    edSearchSTATUS: TUniComboBox;
    rcBlock130: TUniContainerPanel;
    UniLabel13: TUniLabel;
    edLkpUFS: TUniDBEdit;
    rcBlock20: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniLabel44: TUniLabel;
    UniDBComboBox5: TUniDBComboBox;
    rcBlock25: TUniContainerPanel;
    UniLabel5: TUniLabel;
    rcBlock30: TUniContainerPanel;
    UniLabel10: TUniLabel;
    rcBlock50: TUniContainerPanel;
    UniLabel11: TUniLabel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    rcBlock60: TUniContainerPanel;
    edIE_RG: TUniDBEdit;
    UniLabel17: TUniLabel;
    rcBlock65: TUniContainerPanel;
    UniLabel19: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    rcBlock70: TUniContainerPanel;
    UniLabel20: TUniLabel;
    UniDBEdit4: TUniDBEdit;
    rcBlock75: TUniContainerPanel;
    UniLabel21: TUniLabel;
    edLkpFUNCIONARIOS: TUniDBEdit;
    rcBlock210: TUniContainerPanel;
    edPhone: TUniDBEdit;
    UniLabel23: TUniLabel;
    rcBlock220: TUniContainerPanel;
    UniDBEdit12: TUniDBEdit;
    UniLabel24: TUniLabel;
    rcBlock230: TUniContainerPanel;
    UniDBEdit13: TUniDBEdit;
    UniLabel25: TUniLabel;
    rcBlock240: TUniContainerPanel;
    UniLabel26: TUniLabel;
    UniDBComboBoxregiao: TUniDBComboBox;
    rcBlock250: TUniContainerPanel;
    UniDBEdit14: TUniDBEdit;
    UniLabel27: TUniLabel;
    rcBlock260: TUniContainerPanel;
    UniDBEdit15: TUniDBEdit;
    UniLabel28: TUniLabel;
    UniScrollBox2: TUniScrollBox;
    rcBlock402: TUniContainerPanel;
    rcBlock500: TUniContainerPanel;
    UniLabel22: TUniLabel;
    rcBlock510: TUniContainerPanel;
    rcBlock403: TUniContainerPanel;
    UniLabel32: TUniLabel;
    UniLabel33: TUniLabel;
    rcBlock520: TUniContainerPanel;
    rcBlock530: TUniContainerPanel;
    rcBlock560: TUniContainerPanel;
    UniDBEdit8: TUniDBEdit;
    UniLabel39: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniDBEdit5: TUniDBEdit;
    UniLabel29: TUniLabel;
    UniDBEdit29: TUniDBEdit;
    UniLabel34: TUniLabel;
    UniDBEdit30: TUniDBEdit;
    UniLabel35: TUniLabel;
    rcBlock540: TUniContainerPanel;
    UniLabel36: TUniLabel;
    edLkpUFS__ENTREGA: TUniDBEdit;
    rcBlock550: TUniContainerPanel;
    UniLabel37: TUniLabel;
    edLkpCIDADES__ENTREGA: TUniDBEdit;
    rcBlock562: TUniContainerPanel;
    rcBlock570: TUniContainerPanel;
    UniLabel30: TUniLabel;
    UniDBEdit6: TUniDBEdit;
    rcBlock575: TUniContainerPanel;
    UniDBEdit7: TUniDBEdit;
    UniLabel31: TUniLabel;
    rcBlock563: TUniContainerPanel;
    UniLabel38: TUniLabel;
    UniLabel40: TUniLabel;
    rcBlock580: TUniContainerPanel;
    UniDBEdit9: TUniDBEdit;
    UniLabel41: TUniLabel;
    rcBlock585: TUniContainerPanel;
    UniDBEdit10: TUniDBEdit;
    UniLabel42: TUniLabel;
    rcBlock598: TUniContainerPanel;
    rcBlock590: TUniContainerPanel;
    UniLabel45: TUniLabel;
    edLkpUFS__COBRANCA: TUniDBEdit;
    rcBlock595: TUniContainerPanel;
    UniLabel46: TUniLabel;
    edLkpCIDADES__COBRANCA: TUniDBEdit;
    UniLabel43: TUniLabel;
    UniDBEdit25: TUniDBEdit;
    rcBlock600: TUniContainerPanel;
    UniLabel47: TUniLabel;
    edLkpUFS__EXPORTACAO: TUniDBEdit;
    UniDBLookupComboBox1: TUniDBLookupComboBox;
    UniDBLookupComboBox2: TUniDBLookupComboBox;
    rcBlock12: TUniContainerPanel;
    UniLabel48: TUniLabel;
    edTipoPessoa: TUniDBComboBox;
    edCnpjCpf: TUniDBEdit;
    procedure edTipoPessoaChange(Sender: TObject);
    procedure edCepExit(Sender: TObject);
    procedure Veculos1Click(Sender: TObject);
    //procedure edLkpCIDADESClick(Sender: TObject);
    procedure RevisoesClick(Sender: TObject);
    procedure edLkpCIDADES__ENTREGAClick(Sender: TObject);
    procedure edLkpCIDADES__COBRANCAClick(Sender: TObject);
    procedure dsMasterStateChange(Sender: TObject);
    procedure btnSendZapClick(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure edCepEntregaExit(Sender: TObject);
    procedure edCepCobrancaExit(Sender: TObject);
    procedure edLkpCLIENTESClick(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure edLkpUFS__PRINCIPALClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure edCepEnter(Sender: TObject);
    procedure edCnpjCpfExit(Sender: TObject);
    procedure btnSearchCRUDCustomClick(Sender: TObject);
    procedure edLkpCIDADES__PRINCIPALExit(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure UniDBEdit1Exit(Sender: TObject);
    procedure UniDBEdit6Exit(Sender: TObject);
    //REMOVER procedure dbgSearchCRUDDblClick(Sender: TObject);
  private
    { Private declarations }
    FCampoInvalido : TUniControl;
    function  FocarPrimeiroCampoInvalido : boolean;
    procedure rcSweetAlertFocoConfirm( Sender: TObject );
    procedure rcSweetAlertFocoDismiss( Sender: TObject; const Reason: TDismissType );
  public
    { Public declarations }

  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, untFrmLookUp, Main, //untDM_LOOKUPs,
  untFrmMessage, uconsts, uconsts_cfg,
  mkm_func_web, mkm_layout, mkm_restfuncs, mkm_crudfuncs; //7.3.0.0



procedure TfrmCadPESSOAS.edTipoPessoaChange(Sender: TObject);
begin
  inherited;
  dm_rc.rc_MaskAdjust( edCnpjCpf, varIIF( Copy( edTipoPessoa.Text, 1, 1 ) <> 'J', mt_CPF, mt_CNPJ ) ); //7.3.0.0
end;


// podemos criar críticas manuais para uso do lookup dinâmico ou usar o atributo "lkpfilter:"
// podemos usar o rc_LookUpSearchFilter para por filtros mais complexos e usá-lo com o lkpfilter dinâmico
//procedure TfrmCadCLIENTES.edLkpCIDADESClick(Sender: TObject);
//begin
//  inherited;
// exemplo de uso MANUAL de filtros para seleção do lookup edLkpCIDADES
// está comentado pois estamos usando neste exemplo o atributo dinâmico "lkpfilter" no HINT de edLKPCIDADES
//  if ( edLkpUFS.Text ) = '' then
//     dm_rc.rc_ShowMessage( 'Selecione uma UF' )
//  else
//  begin
//      dm_rc.rc_LookUpSearchFilter( Sender, 'uf = ' + QuotedStr( edLkpUFS.Text ), '', 'codiibge' );
//  end;
//end;

procedure TfrmCadPESSOAS.edLkpCIDADES__COBRANCAClick(Sender: TObject);
begin
  inherited;
  //7.3.0.0

end;

procedure TfrmCadPESSOAS.edLkpCIDADES__ENTREGAClick(Sender: TObject);
begin
  inherited;
  //7.3.0.0
end;
procedure TfrmCadPESSOAS.edLkpCIDADES__PRINCIPALExit(Sender: TObject);
begin
  inherited;
  sqlMaster.FieldByName( 'CODIIBGE' ).AsString := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'CODIIBGE' ) ;

end;

// 6.0.0.0
// este evento será transferido em RUNTIME ao botao de pesquisa que será criado
// this event will be transferred in RUNTIME to the search button that will be created
procedure TfrmCadPESSOAS.edLkpCLIENTESClick(Sender: TObject);
var
   sGridAttr : string;
begin
  inherited;
  //7.3.0.0
  if sqlMaster.State in [dsEdit, dsInsert] then
  begin
      sGridAttr := '[[' +
                   'fieldmasks: grid-resize|' +
                   'nome[[cls:{bloqueado=S,color-red-hover rc-font-bold,color-blue-hover rc-font-bold}]];' +
                   'bloqueado[[visible:false]];' +
                   'codibairro[[visible:false]];' +
                   'codicidade[[visible:false]];' +
                   'cgf_rg[[visible:false]];' +
                   ']]';


      dm_rc.rc_LookUpSearchFilter( Sender, 'tab.codigo <> ' + sqlMaster.FieldByName( 'codigo' ).AsString, '', 'email;fone1 as Telefone;bloqueado;codibairro;codicidade' , sGridAttr );
  end;
end;

procedure TfrmCadPESSOAS.edLkpUFS__PRINCIPALClick(Sender: TObject);
begin
  inherited; // #UF=SIGLA ds:dsMaster
  //7.3.0.0
{  if TUniDBEdit(sender).DataSource.DataSet.State in [dsEdit, dsInsert] then
  begin
     dm_rc.rc_LookUpSearchFilter( Sender, '', '', '', '[[fieldmasks:descricao[[title:DESCRIÇÃO]];' );
  end;}
end;

procedure TfrmCadPESSOAS.UniDBEdit1Exit(Sender: TObject);
begin
  inherited;
  dm_rc.rc_SearchPostalCodeCEP( sqlMaster.FieldByName( 'cepentrega' ).AsString, 'entrega',  Self.Name, TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ) );
end;

procedure TfrmCadPESSOAS.UniDBEdit6Exit(Sender: TObject);
begin
  inherited;
  dm_rc.rc_SearchPostalCodeCEP( sqlMaster.FieldByName( 'cepcobranca' ).AsString, 'cobranca',  Self.Name, TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ) );
end;

procedure TfrmCadPESSOAS.UniFrameCreate(Sender: TObject);
begin

  sqlMaster.SQL.Text := ' SELECT [[fields]]   ' +
                        '   FROM [[table]] tab ' +
                        ' [[pk-show]] ' +
                        '  WHERE tab.[[pk]] = :table_pk ' +  //[PT] Apenas cadastro MESTRE é necessário o WHERE
                        ' FROM  [[table]] tab ' ;

  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:'+
                        'grid-resize|'+
                        'model-crud:2|'+
                        //'model-search:column|' + //8.2.0.0
                        'grid-paginator:center|' +
                        ']]';


  dm_rc.FDQuerypessoasTipo.Open();
  dm_rc.FDpessoasSituacao.Open();

  inherited;

end;

procedure TfrmCadPESSOAS.btnDeleteRegClick(Sender: TObject);
begin
  // no frmBaseCRUD já tem a critica de MOVIMENTACAO pra o registro que
  // esta sendo deletado...
  //
  // dm_rc.rc_HasCodeRegistered
  //

  // criticas antes da exclusao
  //
   //[PT]
   // se vc precisa validar alguma informação antes de excluir o registro, você pode usar a global "mm.varB_OperationProcessed"
   // e condicionar a execução do "inherited"
   //[EN]
   // if you need to validate some information before delete the record, you can use the global "mm.varB_OperationProcessed"
   // and condition the execution of "inherited"
   (*
   if field = 'x' then
      mm.varB_OperationProcessed := false
   else
      mm.varB_OperationProcessed := true

   if mm.varB_OperationProcessed then
      inherited;
   *)

  inherited;

  //[PT]
  // se algum erro ocorreu no processo de execução do "inherited" você pode validar a global "mm.varB_OperationProcessed" para
  // processar mais alguma sequência de código após a exclusão do registro
  //[EN]
  // if an error occurred in the "inherited" execution process you can validate the global "mm.varB_OperationProcessed" to
  // process some more code sequence after deleting the record
  if mm.varB_OperationProcessed then //dbgSearchCRUD.Tag > 0 then
  begin

       // procedimentos pós-exclusao
       //

  end;
end;

procedure TfrmCadPESSOAS.btnNewRegClick(Sender: TObject);
begin
  inherited;
     sqlMaster.FieldByName('pessoa').AsString := 'F';
     dm_rc.rc_MaskAdjust( edCnpjCpf , mt_CPF ); //7.3.0.0


end;

procedure TfrmCadPESSOAS.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  dm_rc.rc_GridDrawCell( dbgSearchCRUD , ACol, ARow, Column, Attribs ) ;
end;

procedure TfrmCadPESSOAS.dsMasterStateChange(Sender: TObject);
begin
  inherited;
  dm_rc.rc_MaskAdjust( edCnpjCpf, varIIF( Copy( edTipoPessoa.Text, 1, 1 ) <> 'J', mt_CPF, mt_CNPJ ) ); //7.3.0.0
 // dm_rc.rc_MaskAdjust( edCnpjCpf, varIIF( sqlMaster.FieldByName('PESSOA').AsString = 'F', mt_CPF, mt_CNPJ ) );
 // dm_rc.rc_MaskAdjust( edCnpjCpf, varIIF( Copy( edTipoPessoa.Text, 1, 1 ) <> 'J', mt_CPF, mt_CNPJ ) ); //7.3.0.0

end;
procedure TfrmCadPESSOAS.edCepCobrancaExit(Sender: TObject);
begin
  inherited;
 // dm_rc.rc_SearchPostalCodeCEP( sqlMaster.FieldByName( 'cepcobranca' ).AsString, 'cobranca',  Self.Name, TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ) );
end;

procedure TfrmCadPESSOAS.edCepEnter(Sender: TObject);
begin
  inherited;
 // dm_rc.rc_ConsoleLog( 'labCollapseDefaultAddr.Hint:' +  labCollapseDefaultAddr.Hint );
//  dm_rc.rc_ConsoleLog( 'rcBlock94.Hint:' +  rcBlock94.Hint );
end;

procedure TfrmCadPESSOAS.edCepEntregaExit(Sender: TObject);
begin
  inherited;
 // dm_rc.rc_SearchPostalCodeCEP( sqlMaster.FieldByName( 'cepentrega' ).AsString, 'entrega',  Self.Name, TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ) );
end;

procedure TfrmCadPESSOAS.edCepExit(Sender: TObject);
begin
  inherited;
  dm_rc.rc_SearchPostalCodeCEP( sqlMaster.FieldByName( 'cep' ).AsString, '',  Self.Name, TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ) );
end;
//7.3.0.0
procedure TfrmCadPESSOAS.edCnpjCpfExit(Sender: TObject);
begin
  inherited;

  if not (sqlMaster.State in [dsInsert]) then
    exit;

  if edCnpjCpf.Text <> '' then
  begin
       //pegadadosreceita;

       rc_GetCompanyData( self,
                          edCnpjCpf.Text,
                          edRazSoc,
                          edCliName,
                          edIE_RG,
                          edPhone,
                          edAddress,
                          edAddressNumber,
                          nil,
                          nil,
                          nil,
                          nil,
                          edCep);

        if edCep.Text <> '' then
           edCepExit( edCep );
  end;
end;

procedure TfrmCadPESSOAS.btnSaveRegClick(Sender: TObject);
begin
   //[PT]
   // se vc precisa validar alguma informação antes de gravar o registro, você pode usar a global "mm.varB_OperationProcessed"
   // e condicionar a execução do "inherited"
   //[EN]
   // if you need to validate some information before writing the record, you can use the global "mm.varB_OperationProcessed"
   // and condition the execution of "inherited"
   (*
   if field = 'x' then
      mm.varB_OperationProcessed := false
   else
      mm.varB_OperationProcessed := true

   if mm.varB_OperationProcessed then
      inherited;
   *)

  //[PT] o rc_FormValidate da base dá Abort quando há campo obrigatório pendente;
  //     nesse caso muda para a aba do primeiro campo inválido e põe o cursor nele
  try
    inherited;
  except
    on EAbort do
    begin
      FocarPrimeiroCampoInvalido;
      raise;
    end;
  end;

  //[PT]
  // se algum erro ocorreu no processo de execução do "inherited" você pode validar a global "mm.varB_OperationProcessed" para
  // processar mais alguma sequência de código após a gravação do registro
  //[EN]
  // if an error occurred in the "inherited" execution process you can validate the global "mm.varB_OperationProcessed" to
  // process some more code sequence after recording the record
  if mm.varB_OperationProcessed then //dbgSearchCRUD.Tag > 0 then
  begin

       // procedimentos pós-exclusao
       //

  end;
end;
//[PT] Procura o primeiro campo marcado pelo rc_FormValidate ( hint "invalidate:true" ),
//     percorrendo as abas na ordem ( Dados Gerais -> Dados Adicionais ).
//     Ativa a aba do campo e agenda o foco para quando o usuário fechar o alerta.
function TfrmCadPESSOAS.FocarPrimeiroCampoInvalido: boolean;
var
   iPag, iComp : integer;
   oCtrl : TUniControl;
   oPai  : TWinControl;
begin
  FCampoInvalido := nil;

  // iPag = PageCount -> fallback: campo inválido fora das abas
  for iPag := 0 to pgComplementData.PageCount do
  begin
    for iComp := 0 to ComponentCount - 1 do
    begin
      if not ( Components[iComp] is TUniControl ) then
         Continue;

      oCtrl := TUniControl( Components[iComp] );
      if ( Pos( 'invalidate:true', oCtrl.Hint ) = 0 ) or ( not oCtrl.Visible ) then
         Continue;

      if iPag < pgComplementData.PageCount then
      begin
         oPai := oCtrl.Parent;
         while ( oPai <> nil ) and ( oPai <> pgComplementData.Pages[iPag] ) do
           oPai := oPai.Parent;
         if oPai = nil then
            Continue;
      end;

      FCampoInvalido := oCtrl;
      Break;
    end;

    if FCampoInvalido <> nil then
    begin
      if iPag < pgComplementData.PageCount then
         pgComplementData.ActivePage := pgComplementData.Pages[iPag];
      Break;
    end;
  end;

  Result := FCampoInvalido <> nil;
  if Result then
  begin
    // o alerta de validação usa o rcSweetAlert do frame; ao fechar, o foco vai para o campo
    rcSweetAlert.OnConfirm := rcSweetAlertFocoConfirm;
    rcSweetAlert.OnDismiss := rcSweetAlertFocoDismiss;
    dm_rc.rc_SetFocus( FCampoInvalido );
  end;
end;

procedure TfrmCadPESSOAS.rcSweetAlertFocoConfirm(Sender: TObject);
begin
  if FCampoInvalido <> nil then
     dm_rc.rc_SetFocus( FCampoInvalido );
end;

procedure TfrmCadPESSOAS.rcSweetAlertFocoDismiss(Sender: TObject; const Reason: TDismissType);
begin
  rcSweetAlertFocoConfirm( Sender );
end;

//[PT] Cada campo adicionado na pesquisa customizada tem que estar na lista abaixo e deve ter o prefixo: "edSearch"
//     Aplique o tipo de filtro de acordo com o tipo de cada campo utilizado para pesquisar.
//[EN] Each field added to the custom search must be in the list below and must have the prefix: "edSearch"
//     Apply the filter type according to the type of each field used to search.
procedure TfrmCadPESSOAS.btnSearchCRUDCustomClick(
  Sender: TObject);
var
   cAndOr, cFilters : string;
begin
  cFilters := '';
  cAndOr   := rc_GetHintAttr( '_swt_txt:' , labAndOrSearch.Hint );
  edSearchFilter.Text := '';//7.3.0.0
  //int
  if StrToIntDef( trim( edSearchCODIGO.Text ), 0 ) > 0 then
     cFilters := cFilters + varIIF( cFilters <> '', cAndOr , '' ) +
                 ' ( tab.codigo = ' + edSearchCODIGO.Text + ' )' ;
  //str //7.5.0.1
  if trim( edSearchNOME.Text ) <> '' then
     cFilters := cFilters + varIIF( cFilters <> '', cAndOr, '' ) +
                 ' ( tab.nome like ' + QuotedStr( '%' + edSearchNOME.Text +'%' ) + ' )' ;
  if trim( edSearchCNPJCPF.Text ) <> '' then
     cFilters := cFilters + varIIF( cFilters <> '', cAndOr, '' ) +
                 ' ( tab.cnpj_cpf = ' + QuotedStr( edSearchCNPJCPF.Text ) + ' )' ;
  //date //7.3.0.0
  if ( edSearchDTCADASTRO.Text <> '30/12/1899' ) then
     if edSearchDTCADASTROFIM.Text <> '30/12/1899' then
        cFilters := cFilters + varIIF( cFilters <> '', cAndOr, '' ) +
                    '( ( tab.dtcadastro >= ' + QuotedStr( FormatDateTime( 'dd.mm.yyyy', StrToDateDef( edSearchDTCADASTRO.Text , 0 ) ) ) + ' ) and ' +
                    '  ( tab.dtcadastro <= ' + QuotedStr( FormatDateTime( 'dd.mm.yyyy', StrToDateDef( edSearchDTCADASTROFIM.Text , 0 ) ) ) + ' ) )'
     else
        cFilters := cFilters + varIIF( cFilters <> '', cAndOr, '' ) +
                    '( tab.dtcadastro >= ' + QuotedStr( FormatDateTime( 'dd.mm.yyyy', StrToDateDef( edSearchDTCADASTRO.Text , 0 ) ) ) + ' )';

  //float
  if edSearchVALOR_CONTRATO.Value > 0 then
     cFilters := cFilters + varIIF( cFilters <> '', cAndOr, '' ) +
                 ' ( ( tab.valor_contrato >= ' + FloatToStr( Trunc( StrToFloat( edSearchVALOR_CONTRATO.text ) ) ) + ' ) and ' +
                 '   ( tab.valor_contrato < ' +  FloatToStr( Trunc( StrToFloat( edSearchVALOR_CONTRATO.text ) ) + 1 ) + ' ) )';
  //combobox
  case edSearchSTATUS.ItemIndex of
     1 : begin
            cFilters := cFilters + varIIF( cFilters <> '', cAndOr, '' ) +
                        ' ( coalesce( tab.ativo, ''S'' ) = ''S'' )' ;
         end;
     2 : begin
            cFilters := cFilters + varIIF( cFilters <> '', cAndOr, '' ) +
                        ' ( coalesce( tab.ativo, ''S'' ) = ''N'' )' ;
         end;
  end;
  rc_SearchFilterExecute( self, cFilters );

  inherited;

end;
//8.4.0.0
procedure TfrmCadPESSOAS.btnSendZapClick(Sender: TObject);
begin
  inherited;
//  rc_SendZapMsg( edPhoneZap.Text, 'Hello ' + edCliName.Text + '. I am using RadCORE WEB!' );
end;

procedure TfrmCadPESSOAS.Veculos1Click(Sender: TObject);
begin
  inherited;
  //                             FORM     DETAIL                DETAIL         DETAIL
  //                             MASTER   TABLE NAME            MASTER FIELD   FORM TITLE

end;

procedure TfrmCadPESSOAS.RevisoesClick(Sender: TObject);
begin
  inherited;

 //                              MASTER  DETAIL TABLE          MASTER FIELD   DETAIL FORM TITLE

end;

initialization
  RegisterClass(TfrmCadPESSOAS);

end.
