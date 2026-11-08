unit untCadCLIENTES; //8.0.0.0( checkbox colors )
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
  uniGUIApplication, uniGUIClasses, uniGUIFrame, untfrmBaseCRUD, Data.DB, uniBasicGrid, uniDBGrid,
  uniPanel, uniPageControl, uniGUIBaseClasses, uniScrollBox, uniDBEdit,
  uniMultiItem, uniComboBox, uniEdit, uniLabel, uniButton, uniBitBtn,
  uniDateTimePicker, uniDBDateTimePicker, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniCheckBox, uniFieldSet,
  uniDBComboBox, uniDBLookupComboBox, uniSpeedButton, uniDBCheckBox,
  uniMainMenu, uniHTMLFrame, Data.FMTBcd, Data.SqlExpr, uniSpinEdit, uniMemo, Vcl.Menus, uniSweetAlert, uniDBNavigator;

type
  TfrmCadCLIENTES = class(TfrmBaseCRUD)
    pgComplementData: TUniPageControl;
    tabComercial: TUniTabSheet;
    tabLicences: TUniTabSheet;
    tabGeral: TUniTabSheet;
    sboxTab4: TUniScrollBox;
    sboxTab5: TUniScrollBox;
    Revisoes: TUniMenuItem;
    Veculos1: TUniMenuItem;
    rcBlock650: TUniContainerPanel;
    UniLabel1: TUniLabel;
    rcBlock660: TUniContainerPanel;
    UniLabel32: TUniLabel;
    rcBlock670: TUniContainerPanel;
    UniLabel33: TUniLabel;
    rcBlock680: TUniContainerPanel;
    UniLabel34: TUniLabel;
    rcBlock690: TUniContainerPanel;
    UniLabel36: TUniLabel;
    UniDBDateTimePicker3: TUniDBDateTimePicker;
    UniDBDateTimePicker4: TUniDBDateTimePicker;
    UniDBEdit31: TUniDBEdit;
    edMonthValue: TUniDBFormattedNumberEdit;
    rcBlock710: TUniContainerPanel;
    UniLabel38: TUniLabel;
    rcBlock720: TUniContainerPanel;
    UniLabel39: TUniLabel;
    UniDBCheckBox10: TUniDBCheckBox;
    UniDBCheckBox11: TUniDBCheckBox;
    UniDBCheckBox12: TUniDBCheckBox;
    UniDBCheckBox21: TUniDBCheckBox;
    UniDBCheckBox22: TUniDBCheckBox;
    UniDBCheckBox2: TUniDBCheckBox;
    UniDBCheckBox7: TUniDBCheckBox;
    rcBlock520: TUniContainerPanel;
    UniLabel25: TUniLabel;
    rcBlock525: TUniContainerPanel;
    UniLabel26: TUniLabel;
    edLkpCLIENTES: TUniDBEdit;
    ed_lkp_Email: TUniEdit;
    rcBlock530: TUniContainerPanel;
    UniLabel41: TUniLabel;
    rcBlock535: TUniContainerPanel;
    UniLabel43: TUniLabel;
    ed_lkp_fone: TUniEdit;
    ed_lkp_block: TUniEdit;
    rcBlock540: TUniContainerPanel;
    labAlert: TUniLabel;
    btnPayment: TUniSpeedButton;
    sboxGridBlockTab1: TUniScrollBox;
    rcBlock515: TUniContainerPanel;
    rcBlock2: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    rcBlock20: TUniContainerPanel;
    labDtCad: TUniLabel;
    edDtCad: TUniDBDateTimePicker;
    rcBlock30: TUniContainerPanel;
    UniLabel5: TUniLabel;
    dtAni: TUniDBDateTimePicker;
    rcBlock50: TUniContainerPanel;
    UniLabel9: TUniLabel;
    edCnpjCpf: TUniDBEdit;
    rcBlock40: TUniContainerPanel;
    UniLabel10: TUniLabel;
    edTipoPessoa: TUniDBComboBox;
    rcBlock60: TUniContainerPanel;
    UniLabel11: TUniLabel;
    edIE_RG: TUniDBEdit;
    rcBlock80: TUniContainerPanel;
    labName: TUniLabel;
    edCliName: TUniDBEdit;
    rcBlock90: TUniContainerPanel;
    UniLabel12: TUniLabel;
    edRazSoc: TUniDBEdit;
    rcBlock165: TUniContainerPanel;
    rcBlock166: TUniContainerPanel;
    UniLabel21: TUniLabel;
    labCollapseDeliveryAddr: TUniLabel;
    rcBlock180: TUniContainerPanel;
    UniLabel27: TUniLabel;
    UniDBEdit7: TUniDBEdit;
    rcBlock190: TUniContainerPanel;
    UniLabel37: TUniLabel;
    UniDBEdit8: TUniDBEdit;
    rcBlock200: TUniContainerPanel;
    UniLabel42: TUniLabel;
    edLkpUFS__ENTREGA: TUniDBEdit;
    rcBlock210: TUniContainerPanel;
    UniLabel44: TUniLabel;
    edLkpFERIADOS: TUniDBEdit;
    rcBlock220: TUniContainerPanel;
    UniLabel45: TUniLabel;
    UniDBEdit9: TUniDBEdit;
    rcBlock170: TUniContainerPanel;
    UniLabel46: TUniLabel;
    edCepEntrega: TUniDBEdit;
    rcBlock285: TUniContainerPanel;
    rcBlock286: TUniContainerPanel;
    UniLabel17: TUniLabel;
    labCollapseContact: TUniLabel;
    rcBlock290: TUniContainerPanel;
    UniLabel35: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    rcBlock300: TUniContainerPanel;
    UniLabel47: TUniLabel;
    UniDBEdit13: TUniDBEdit;
    rcBlock310: TUniContainerPanel;
    UniLabel19: TUniLabel;
    edPhone: TUniDBEdit;
    UniDBEdit14: TUniDBEdit;
    UniLabel40: TUniLabel;
    rcBlock320: TUniContainerPanel;
    UniLabel20: TUniLabel;
    UniDBEdit15: TUniDBEdit;
    UniDBEdit16: TUniDBEdit;
    UniLabel31: TUniLabel;
    rcBLock330: TUniContainerPanel;
    UniLabel49: TUniLabel;
    UniDBEdit17: TUniDBEdit;
    UniDBEdit18: TUniDBEdit;
    UniLabel50: TUniLabel;
    rcBlock305: TUniContainerPanel;
    UniLabel51: TUniLabel;
    rcBlock225: TUniContainerPanel;
    rcBlock226: TUniContainerPanel;
    labCollapseInvoiceAddr: TUniLabel;
    rcBlock240: TUniContainerPanel;
    UniLabel23: TUniLabel;
    UniDBEdit10: TUniDBEdit;
    rcBlock250: TUniContainerPanel;
    UniLabel24: TUniLabel;
    UniDBEdit11: TUniDBEdit;
    rcBlock260: TUniContainerPanel;
    UniLabel28: TUniLabel;
    edLkpUFS__COBRANCA: TUniDBEdit;
    rcBlock270: TUniContainerPanel;
    UniLabel29: TUniLabel;
    edLkpCIDADES__COBRANCA: TUniDBEdit;
    rcBlock280: TUniContainerPanel;
    UniLabel30: TUniLabel;
    UniDBEdit12: TUniDBEdit;
    rcBlock230: TUniContainerPanel;
    UniLabel22: TUniLabel;
    edCepCobranca: TUniDBEdit;
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
    rcBlock130: TUniContainerPanel;
    UniLabel13: TUniLabel;
    edLkpUFS: TUniDBEdit;
    rcBlock140: TUniContainerPanel;
    UniLabel14: TUniLabel;
    edLkpCIDADES: TUniDBEdit;
    rcBlock160: TUniContainerPanel;
    UniLabel15: TUniLabel;
    edNeighborhood: TUniDBEdit;
    rcBlock100: TUniContainerPanel;
    UniLabel16: TUniLabel;
    edCep: TUniDBEdit;
    rcBlock150: TUniContainerPanel;
    UniLabel18: TUniLabel;
    edLkpCIDADES_SetDS_CODIIBGE: TUniDBEdit;
    rcBlock3: TUniContainerPanel;
    labRcCollapseGeneral: TUniLabel;
    edHiddenCompanyID: TUniDBEdit;
    UniLabel8: TUniLabel;
    UniLabel48: TUniLabel;
    btnSendZap: TUniSpeedButton;
    edPhoneZap: TUniDBEdit;
    rcBlock695: TUniContainerPanel;
    UniDBEdit1: TUniDBEdit;
    procedure UniFrameCreate(Sender: TObject);
    procedure edTipoPessoaChange(Sender: TObject);
    procedure edCepExit(Sender: TObject);
    procedure UniDBEdit2Exit(Sender: TObject);
    procedure Veculos1Click(Sender: TObject);
    //procedure edLkpCIDADESClick(Sender: TObject);
    procedure RevisoesClick(Sender: TObject);
    procedure edLkpFERIADOSClick(Sender: TObject);
    procedure edLkpCIDADES__COBRANCAClick(Sender: TObject);
    procedure dsMasterStateChange(Sender: TObject);
    procedure btnSendZapClick(Sender: TObject);
    procedure pgComplementDataChange(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure edCepEntregaExit(Sender: TObject);
    procedure edCepCobrancaExit(Sender: TObject);
    procedure edLkpCLIENTESClick(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure edLkpUFSClick(Sender: TObject);
    procedure edLkpCLIENTESEnter(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure edCepEnter(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure edCnpjCpfExit(Sender: TObject);
    procedure edLkpFERIADOSEnter(Sender: TObject);
    //REMOVER procedure dbgSearchCRUDDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, untFrmLookUp, Main, //untDM_LOOKUPs,
  untFrmMessage, untCadCLIENTES_REVISOES, untCadCLIENTES_VEICULOS, uconsts, uconsts_cfg,
  mkm_func_web, mkm_layout, mkm_restfuncs;

procedure TfrmCadCLIENTES.edTipoPessoaChange(Sender: TObject);
begin
  inherited;
  dm_rc.rc_MaskAdjust( edCnpjCpf, varIIF( Copy( edTipoPessoa.Text, 1, 1 ) <> 'J', mt_CPF, mt_CNPJ ) ); //7.3.0.0
end;

procedure TfrmCadCLIENTES.pgComplementDataChange(Sender: TObject);
var
   bPermission : boolean;
begin
  inherited;
    
    if pgComplementData.ActivePage = tabLicences then
    begin
       bPermission := dm_rc.rc_PermissionVerify( ed_FormOrigin_Tab.Text ,
                                                 Trim( ed_Table_ItemSel.Text ) ,
                                                 5, dm_rc.memUsers.FieldByName('master').AsString = '1', false );//7.4.0.0
       If not bPermission then
       begin
          //Fechar_Tela;
          pgComplementData.ActivePage := tabGeral;
          dm_rc.rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_USER_DO_NOT_HAVE_ACCESS + '( Licence Tab )' , 'warning' );
          Abort;
       end;
    end;
    
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

procedure TfrmCadCLIENTES.edLkpCIDADES__COBRANCAClick(Sender: TObject);
begin
  inherited;
  //7.3.0.0
  if sqlMaster.State in [dsEdit, dsInsert] then
  begin
     if ( edLkpUFS__COBRANCA.Text ) = '' then
        dm_rc.rc_ShowMessage( 'Selecione uma UF' )
     else
     begin
         dm_rc.rc_LookUpSearchFilter( Sender, 'tab.uf = ' + QuotedStr( edLkpUFS__COBRANCA.Text ), '', '' );
     end;
  end;
end;

procedure TfrmCadCLIENTES.edLkpFERIADOSClick(Sender: TObject);
begin
  inherited;
  //7.3.0.0
  if sqlMaster.State in [dsEdit, dsInsert] then
  begin
     if ( edLkpUFS__ENTREGA.Text ) = '' then
        dm_rc.rc_ShowMessage( 'Selecione uma UF' )
     else
     begin
         dm_rc.rc_LookUpSearchFilter( Sender, 'tab.uf = ' + QuotedStr( edLkpUFS__ENTREGA.Text ), '', '' );
     end;
  end;
end;
procedure TfrmCadCLIENTES.edLkpFERIADOSEnter(Sender: TObject);
begin
  inherited;
      if ( sqlMaster.State in [ dsEdit, dsInsert ] ) then
      begin
//           edDtCad.DateTime := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'data' )  ;
           sqlMaster.FieldByName('dtaniversario').AsDateTime := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'data' );
           // se o retorno de um lookup for para preencher um outro lookup vc pode atribuir o campo de retorno e em seguida
           // if the return of a lookup is to fill another lookup you can assign the return field and then
           //sqlMaster.FieldByName( 'codibairro' ).AsInteger := StrToIntDef( dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'codibairro' ), 0 ) ;
           // atualizar todos os LOOKUPs dinamicamente
           // update all LOOKUPs dynamically
           //dm_rc.rc_LookUpUpdateData(  self, nil );
      end;
end;

// 6.0.0.0
// este evento será transferido em RUNTIME ao botao de pesquisa que será criado
// this event will be transferred in RUNTIME to the search button that will be created
procedure TfrmCadCLIENTES.edLkpCLIENTESClick(Sender: TObject);
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
                   'codicidade[[visible:true]];' +
                   'cgf_rg[[visible:false]];' +
                   ']]';
      //7.3.0.2
      dm_rc.rc_LookUpSearchFilter( Sender, 'tab.codigo <> ' + sqlMaster.FieldByName( 'codigo' ).AsString +
                                           ' and tab.codiemp = ' + mm.varI_Code_Company.ToString,
                                           '', 'email;fone1 as Telefone;bloqueado;codibairro;codicidade' , sGridAttr );
  end;
end;

procedure TfrmCadCLIENTES.edLkpCLIENTESEnter(Sender: TObject);
begin
  inherited;
      if ( sqlMaster.State in [ dsEdit, dsInsert ] ) then
      begin
           ed_lkp_Email.Text  := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'email' )  ;
           ed_lkp_fone.Text   := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'fone1'  )  ;
           ed_lkp_block.Text  := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'bloqueado' ) ;

           // se o retorno de um lookup for para preencher um outro lookup vc pode atribuir o campo de retorno e em seguida
           // if the return of a lookup is to fill another lookup you can assign the return field and then
           //sqlMaster.FieldByName( 'codibairro' ).AsInteger := StrToIntDef( dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'codibairro' ), 0 ) ;
           // atualizar todos os LOOKUPs dinamicamente
           // update all LOOKUPs dynamically
           //dm_rc.rc_LookUpUpdateData(  self, nil );
      end;
end;
//7.4.0.0
procedure TfrmCadCLIENTES.edLkpUFSClick(Sender: TObject);
begin
  inherited; // #UF=SIGLA ds:dsMaster
  if dsMaster.State in [dsEdit, dsInsert] then
     dm_rc.rc_LookUpSearchFilter( Sender, '', '', '', '[[fieldmasks:descricao[[title:DESCRIÇÃO]];]]' );//8.1.0.0
end;

procedure TfrmCadCLIENTES.UniDBEdit2Exit(Sender: TObject);
begin
  inherited;
  dm_rc.rc_SearchPostalCodeCEP( sqlMaster.FieldByName( 'cepentrega' ).AsString, 'entrega',  Self.Name, TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ) );
end;

procedure TfrmCadCLIENTES.btnDeleteRegClick(Sender: TObject);
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

procedure TfrmCadCLIENTES.btnNewRegClick(Sender: TObject);
begin
  inherited;
     sqlMaster.FieldByName('pessoa').AsString := 'F';
     dm_rc.rc_MaskAdjust( edCnpjCpf , mt_CPF ); //7.3.0.0
end;

procedure TfrmCadCLIENTES.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  dm_rc.rc_GridDrawCell( dbgSearchCRUD , ACol, ARow, Column, Attribs ) ;
end;

procedure TfrmCadCLIENTES.dsMasterStateChange(Sender: TObject);
begin
  inherited;
  //dm_rc.rc_MaskAdjust( edCnpjCpf, varIIF( sqlMaster.FieldByName('PESSOA').AsString = 'F', mt_CPF, mt_CNPJ ) );
  dm_rc.rc_MaskAdjust( edCnpjCpf, varIIF( Copy( edTipoPessoa.Text, 1, 1 ) <> 'J', mt_CPF, mt_CNPJ ) ); //7.3.0.0

  if sqlMaster.State in [dsInsert, dsEdit] then
  begin
     ed_lkp_Email.Text := '';
     ed_lkp_fone.Text  := '';
     ed_lkp_block.Text := '';
  end;
end;
procedure TfrmCadCLIENTES.edCepCobrancaExit(Sender: TObject);
begin
  inherited;
  dm_rc.rc_SearchPostalCodeCEP( sqlMaster.FieldByName( 'cepcobranca' ).AsString, 'cobranca',  Self.Name, TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ) );
end;

procedure TfrmCadCLIENTES.edCepEnter(Sender: TObject);
begin
  inherited;
//  dm_rc.rc_ConsoleLog( 'labCollapseDefaultAddr.Hint:' +  labCollapseDefaultAddr.Hint );
//  dm_rc.rc_ConsoleLog( 'rcBlock94.Hint:' +  rcBlock94.Hint );
end;

procedure TfrmCadCLIENTES.edCepEntregaExit(Sender: TObject);
begin
  inherited;
  dm_rc.rc_SearchPostalCodeCEP( sqlMaster.FieldByName( 'cepentrega' ).AsString, 'entrega',  Self.Name, TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ) );
end;

procedure TfrmCadCLIENTES.edCepExit(Sender: TObject);
begin
  inherited;
  dm_rc.rc_SearchPostalCodeCEP( sqlMaster.FieldByName( 'cep' ).AsString, '',  Self.Name, TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ) );
  //7.3.0.0
  //[PT] Abaixo vc poderá ter o retorno da pesquisa diretamente em campos especificos da sua tabela
  //     e caso nao informe o parâmetro 'pQry' os componentes serão preenchidos
  //[EN] Below you can have the search results directly in specific fields of your table
  //     and if you do not enter the 'pQry' parameter, the components will be filled
//  dm_rc.rc_SearchPostalCodeCEP( sqlMaster.FieldByName( 'cep' ).AsString,
//                                Self.Name,
//                                TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ),
//                                edtestado,
//                                edtcidade,
//                                edtbairro,
//                                edtendereco );
end;
//7.3.0.0
procedure TfrmCadCLIENTES.edCnpjCpfExit(Sender: TObject);
begin
  inherited;
  if ( edCnpjCpf.Text <> '' ) and ( Copy( edTipoPessoa.Text, 1, 1 ) = 'J' ) then //7.3.0.2
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
                          edCep
        );
        if edCep.Text <> '' then
           edCepExit( edCep );
  end;
end;

procedure TfrmCadCLIENTES.UniFrameCreate(Sender: TObject);
begin
  //[PT]
  //
  // O 'coringa' [[fields]] será substituído pela sequência de todos os DATAFIELD existentes
  // no seu formulário. Os campos que não serão acessíveis/visíveis para o usuário devem ser
  // adicionados como um "HIDDNE FIELD" no form ou simplesmente, adicione após o coringa [[field]]
  //
  // Ex: SELECT [[fields]], tab.field1, tab.field2 etc como um select normal
  //
  // O 'coringa' [[table]] será substituido no frmBaseCRUD pela respectiva tabela que foi vinculada no click do menu principal
  //
  // O 'coringa' [[pk]] será substituido no frmBaseCRUD pela respectiva chave primaria da tabela
  // atual que foi vinculada no click do menu principal, por padrão ele não é exibido, para que a chave primária seja exibida
  // substitua [[pk]] por [[pk-show]]
  //
  // haverá situações que precisarão de alteraçao, adicionando JOINS etc.., mas seguindo a estrutura proposta,
  // a maioria dos forms terá pouquíssima mudança
  //
  //[EN]
  //
  // The 'wildcard' [[fields]] will be replaced by the string of all existing DATAFIELDs
  // in your form. Fields that will not be accessible/visible to the user must be
  // added as a "HIDDNE FIELD" in the form or simply add it after the wildcard [[field]]
  //
  // Ex: SELECT [[fields]], tab.field1, tab.field2 etc like a normal select
  //
  // The 'wildcard' [[table]] will be replaced in frmBaseCRUD by the respective table that was linked in the main menu click
  //
  // The 'wildcard' [[pk]] will be replaced in frmBaseCRUD by the respective primary key of the table
  // current one that was linked on the main menu click, by default it is not displayed, so the primary key is displayed
  // replace [[pk]] with [[pk-show]]
  //
  // there will be situations that will need to be changed, adding JOINS etc.., but following the proposed structure,
  // most forms will have very little change
  sqlMaster.close;
  sqlMaster.SQL.Text := ' SELECT [[fields]]   ' +
                        '   FROM [[table]] tab ' +
                        '  WHERE tab.[[pk]] = :table_pk ' +  //[PT] Apenas cadastro MESTRE é necessário o WHERE
                                                             //[EN] Only MASTER registration is necessary the WHERE
                        ' [grid] ' + //[PT] este 'coringa' indica ao RadCORE o início da query usada na pesquisa padrão
                                     //[EN] this 'wildcard' indicates to RadCORE the beginning of the query used in the standard search
                        ' SELECT ' +

                        //' [[firstshow:20]] ' +
                        '   tab.[[pk]] as "CÓDIGO", tab.nome, tab.cnpj_cpf ,' +
//                        '   tab.[[pk-show]] , tab.nome, tab.cnpj_cpf ,' +
                        '   tab.Fone1 , ' +
                        // se você quiser concatenar conteúdo de campos e manter compatibilidade sem recorrer ao FireDac pode usar a função abaixo:
                        // if you want to concatenate field content and maintain compatibility without resorting to FireDac you can use the function below:
                        //'   ( ' + dm_rc.rc_GetSQL( mm.CONFIG_DATABASE, 'cmd_concat',0,0,'tab.ddd1,tab.fone1:15' ) + ' ) as Fone1 , tab.descrifone1 , ' +
                        //'   tab.email , ' +
                        '   tab.cep , ' +
                        '   tab.endereco , tab.numero , tab.complemento , ' +
                        '   cidades.descricao as cidade , ' +
                        '   ufs.descricao as uf , ' +
                        '   tab.valor_contrato, ' +  //,
                        '        [[allpks]] ' + //[PT] só é necessário o [[allpks]] aqui se estiver usando ALIAS em um campo CHAVE PRIMARIA
                                                //[EN] you only need [[allpks]] here if you are using ALIAS in a PRIMARY KEY field
                        ' , tab.dtcadastro ' +     //( If need to search by date only not a period )
                        ' , tab.dtaniversario ' +  //( If need to search by date only not a period )

                        ' FROM  [[table]] tab ' +

                        ' LEFT JOIN ' + dm_rc.rc_DBSchema + 'ufs ufs ON ufs.codigo = tab.codiuf ' + //6.1.0.0
                        ' LEFT JOIN ' + dm_rc.rc_DBSchema + 'cidades cidades ON cidades.codigo = tab.codicidade ' ; //6.1.0.0

  //[PT] se esta global estiver preenchida, ao clicar em EXCLUIR , o registro não será excluído fisicamente do banco de dados.
  //      o RadCORE já oferece alguma codificação para este recurso mas dependendo da sua aplicação poderá ser necessário a sua intervenção no código
  //      para adicionar mais controles.
  //[EN] if this global is filled, when clicking on DELETE , the record will not be physically deleted from the database
  //     RadCORE already offers some coding for this resource but depending on your application it may be necessary for you to intervene in the code
  //     to add more controls.
  ed_Table_Deleted_Field.Text := ''; // Ex: ed_Table_Deleted_Field.Text := 'rec_deleted';

  //[PT] as definições abaixo serão usadas na formação da query da pesquisa dinâmica do grid( sqlSearchMaster )
  //      você pode usar para criar filtros multiempresa, registro excluido logicamente etc.
  //[EN] definitions below will be used in the formation of the dynamic grid search query ( sqlSearchMaster )
  //      you can use to create multi-company filters, logically excluded record, etc.
  ed_Where_Search.Text   := ''; // ' tab.codiemp = ' + IntToStr( mm.varI_Code_Company ) ; // Ex: ed_Where_Search.Text := ' tab.' + ed_Table_Deleted_Field.Text + ' = ''N''';
  ed_GroupBy_Search.Text := '';
  ed_Having_Search.Text  := '';
  ed_Order_Search.Text   := '';


  // pre-defined grid columns attributes
  //
  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:' +
                        //'no-paged|' +
                        //'grid-noforcefit|' +
                        'grid-forcefit:10 mobile-v-2 mobile-h-8|' +
                        'model-crud:1|' +
                        'grid-resize|' +
                        //'firstshow:5|'+
                        'grid-paginator:center|' +
                        'código[[' +
                        //'   locked|' +
                        '   title:translate(codigo)|' +
                        '   titlealign:c|' +
                        '   align:c|' +
                        '   width:135 mobile:90]];' +

                        //[PT]
                        // alguns campos com strings muito grandes são interpretados pelo unigui como MEMO e não
                        // sao exibidos, este atributo força a exibição do texto
                        //[EN]
                        // some fields with very large strings are interpreted by unigui as MEMO and not
                        // are displayed, this attribute forces the text to be displayed
                        //'memotest[[' +
                        //'   displaymemo|]];' +

                        'nome[[' +
                        '   cls:{valor_contrato<130,color-red rc-font-bold,color-black rc-font-bold}|'+   // 6.0.0.0
                        '   title:translate(nome)]];' +

                        'email[[' +
                        '     visible:false mobile]];' +

                        'endereco[[' +
                        '     visible:false mobile]];' +

                        'numero[[' +
                        '   visible:false mobile|' +
                        '   align:r]];' +

                        'complemento[[' +
                        '     visible:false]];' +

                        'cidade[[' +
                        '     visible:false mobile]];' +

                        'uf[[' +
                        '     visible:false mobile]];' +

                        'fone1[[' +
                        '     visible:false mobile]];' +

                        'cnpj_cpf[[' +
                        '     visible:false mobile]];' +

                        'dtcadastro[[' +
                        '     visible:false]];' +
                        'dtaniversario[[' +
                        '     visible:false]];' +

                        'cep[['+
                        '   visible:false mobile|' +
                        '   align:c|'+
                        '   mask:' + mm.varC_Mask_cep + ']];' +
                        //6.1.0.0
                        'valor_contrato[[' +
                        '   visible:false mobile|' +
                        '   cls:{<130,color-red rc-font-bold,color-black rc-font-bold}|'+
                        '   mask:' + PFmtSettings.CurrencyString + ' ' + mm.varC_Mask_float + ']]; ' +
                        ']]';

  //[PT] se a tabela atual permitir pesquisas por intervalo de datas...
  //      parametros de pesquisa especifica por datas( pesq. por periodo )  - ANTES DO INHERITED
  //      os periodos de pesq. de data só serão exibidos se houver algum campo adicionado
  //[EN] if the current table allows searches by date range...
  //      specific search parameters by dates (search by period) - BEFORE THE INHERITED
  //      the search periods. of date will only be displayed if there is any field added
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDFieldDate.name, 'tab.dtcadastro'    , 'CADASTRO' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDFieldDate.name, 'tab.dtaniversario' , 'NASCIMENTO' );

  inherited;

  //[PT] Exemplo de recurso exclusivo da sua software house, vinculado ao seu CNPJ( no. de registro da sua empresa )
  //[EN] Example of an exclusive feature of your software house, linked to your CNPJ ( your company registration number )
  //tabLicences.TabVisible := ( mm.varC_Doc_Customer = SOFTWAREHOUSE_CNPJ );  //se o sistema rodando atual for da sua software house

  //[PT] parametros de pesquisa padrao - DEPOIS DO INHERITED | default search parameters - AFTER INHERITED
  //      caso no SELECT do GRID acima...vc use ALIAS e este campo for usado pra pesquisa, coloque o alias TAMBÉM abaixo
  //      sempre use o ' as ' pra definir o ALIAS Ex: tab.nome as CLIENTE -> NÃO use: (tab.nome)CLIENTE
  //[EN] standard search parameters - AFTER INHERITED
  //      if in the SELECT of the GRID above... you use ALIAS and this field is used for the search, place the alias ALSO below
  //      always use ' as ' to define the ALIAS Ex: tab.name as CUSTOMER -> DO NOT use: (tab.name)CLIENTE
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.' + ed_PK.Text + ' as "CÓDIGO"', 'CÓDIGO' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.nome'          , 'NOME ou FANTASIA' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'cidade'          , 'CIDADE' );  //7.3.0.0
  //dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.razsoc as "RAZÃO SOCIAL"'        , 'RAZÃO SOCIAL' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.cnpj_cpf'      , 'CNPJ ou CPF' );

  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.dtcadastro'    , 'DATA CADASTRO' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.dtaniversario'    , 'DATA NASCIMENTO' );

  //[PT] parametros de pesquisa complementar( opcional )
  //[EN] additional search parameters (optional)
  //
  // dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField2.name   , '' , '' );
  //
  //
  //[PT] adicione aqui codificação específica para este form, caso seja necessário
  //[EN] add here specific coding for this form if needed
  //
end;
// 6.0.0.0 menu mask off sample
procedure TfrmCadCLIENTES.UniFrameReady(Sender: TObject);
begin
  inherited;
  // [PT] esse codigo deve estar no fim desse procedimento, após todo o processamento.
  //      é uma tentativa de criar um recurso para exibir a máscara de processamento até que o formulário esteja completamente carregado.
  // [EN] this code must be at the end of this procedure, after all processing.
  //      is an attempt to create a feature to display the processing mask until the form is completely loaded.
  if ed_HideMaskOff.Text = 'true' then
  begin
       mainform.rc_HideMenuMask( self );
  end;
end;

procedure TfrmCadCLIENTES.btnSaveRegClick(Sender: TObject);
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

  inherited;

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
//8.4.0.0
procedure TfrmCadCLIENTES.btnSendZapClick(Sender: TObject);
begin
  inherited;
  rc_SendZapMsg( edPhoneZap.Text, 'Hello ' + edCliName.Text + ',' + #10 + 'I am using RadCORE WEB!' );
end;

procedure TfrmCadCLIENTES.Veculos1Click(Sender: TObject);
begin
  inherited;
  //                             FORM     DETAIL                DETAIL         DETAIL
  //                             MASTER   TABLE NAME            MASTER FIELD   FORM TITLE
  if dm_rc.rc_PrepareDetailForm( Self   , 'clientes_veiculos' , 'codicli'    , labTitleForm.Caption + ' ( ' + TMenuItem(Sender).Caption + ' )' ) > 0 then
  begin
      frmCadCLIENTES_VEICULOS.ShowModal(
         procedure(Sender: TComponent; Result:Integer)
         begin
           //callback....nesse caso, não é necessário tratar o retorno

           //atualiza pesquisa pois os ToTAIS podem ter sido alterados
           //
           dm_rc.rc_OpenQuery( sqlSearchMaster );

         end );
  end;
end;
//8.0.0.0
procedure TfrmCadCLIENTES.RevisoesClick(Sender: TObject);
var
   iCurrentRec : integer;
begin
  inherited;

  //                              MASTER  DETAIL TABLE          MASTER FIELD   DETAIL FORM TITLE
  if dm_rc.rc_PrepareDetailForm( Self , 'clientes_revisoes' , 'codicli'   ,  labTitleForm.Caption + ' ( ' + TMenuItem(Sender).Caption + ' )' ) > 0 then
  begin
      frmCadCLIENTES_REVISOES.ShowModal(
         procedure(Sender: TComponent; Result:Integer)
         begin
           //callback....nesse caso, não é necessário tratar o retorno

           //atualiza pesquisa pois os ToTAIS podem ter sido alterados
           //
           dm_rc.rc_OpenQuery( sqlSearchMaster );
           //8.0.0.0
           dbgSearchCRUD.DataSource.DataSet.RecNo := iCurrentRec; //[pt] restaura posicao atual do registro no grid de pesquisa
                                                                  //[en] restores the current position of the record in the search grid
         end );
  end;
end;

initialization
  RegisterClass(TfrmCadCLIENTES);

end.
