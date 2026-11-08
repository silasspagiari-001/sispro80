unit untCadCOMPRAS; // v. 3.2.0.0
(*
Ocorreram mudanças na query: COMPRAS_PRODUTOS( propriedades do FIREDAC para relacionamento MESTRE x DETALHE )
Changes occurred in the query: COMPRAS_PRODUTOS (properties of FIREDAC for MASTER x DETAIL relationship)

DetailFields
FetchOption->DetailCascade
MasterFields
MasterSource
SchemaAdapter
*)
interface

uses untDM_RC, Vcl.Menus, uniMainMenu, uniSweetAlert, uniDateTimePicker,
 
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, untfrmBaseCRUD, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniEdit,
  uniCheckBox, uniMultiItem, uniComboBox, uniBasicGrid,
  uniDBGrid, uniPanel, uniPageControl, uniButton, uniBitBtn, uniLabel,
  uniGUIBaseClasses, uniDBComboBox, uniDBDateTimePicker, uniDBEdit,
  uniDBCheckBox, uniSpeedButton, Datasnap.DBClient, uniDBLookupComboBox,
  uniScrollBox, uniHTMLFrame;

type
  TfrmCadCOMPRAS = class(TfrmBaseCRUD)
    pgComplementData: TUniPageControl;
    dsMemTipoOS: TDataSource;
    memTipoOS: TFDMemTable;
    tabGeral: TUniTabSheet;
    sboxTab1: TUniScrollBox;
    COMPRAS_PRODUTOS: TFDQuery;
    dsCOMPRAS_PRODUTOS: TDataSource;
    UniDBEdit5: TUniDBEdit;
    rcBlock10: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    rcBlock20: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    rcBlock50: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    UniLabel12: TUniLabel;
    edLkpFORNECEDORES: TUniDBEdit;
    rcBlock100: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    UniLabel14: TUniLabel;
    edQtde: TUniDBFormattedNumberEdit;
    UniLabel15: TUniLabel;
    edLkpPRODUTOS: TUniDBEdit;
    UniLabel16: TUniLabel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniLabel17: TUniLabel;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    rcBlock70: TUniContainerPanel;
    UniLabel18: TUniLabel;
    rcBlock130: TUniContainerPanel;
    btnOk: TUniBitBtn;
    btnDel: TUniBitBtn;
    rcBlock460: TUniContainerPanel;
    dbgProdutos: TUniDBGrid;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure dsMasterStateChange(Sender: TObject);
    procedure sqlMasterAfterOpen(DataSet: TDataSet);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure dbgProdutosDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure btnDelClick(Sender: TObject);
    procedure dsCOMPRAS_PRODUTOSStateChange(Sender: TObject);
    procedure COMPRAS_PRODUTOSBeforePost(DataSet: TDataSet);
    procedure dbgProdutosCellClick(Column: TUniDBGridColumn);
    procedure edQtdeEnter(Sender: TObject);
    procedure edLkpPRODUTOSClick(Sender: TObject);
    procedure FDSchemaAdapter1AfterApplyUpdate(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

implementation

{$R *.dfm}

uses MainModule, untFrmLookUp, //untDM_LOOKUPs,
  Main;


procedure TfrmCadCOMPRAS.btnDeleteRegClick(Sender: TObject);
begin
  inherited;
  // no frmBaseCRUD já tem a critica de MOVIMENTACAO pra o registro que
  // esta sendo deletado...
  //
  // dm_rc.rc_HasCodeRegistered
  //

  // criticas antes da exclusao
  //

  inherited;

  if mm.varB_OperationProcessed then
  begin
       // procedimentos pós-exclusao
       //
  end;
end;

procedure TfrmCadCOMPRAS.btnDelClick(Sender: TObject);
begin
  inherited;

  if not ( dsCOMPRAS_PRODUTOS.State in [dsEdit, dsInsert ] ) then
  begin
     COMPRAS_PRODUTOS.Delete;
     COMPRAS_PRODUTOS.ApplyUpdates();
     dm_rc.rc_OpenQuery( COMPRAS_PRODUTOS );
  end
  else
     COMPRAS_PRODUTOS.Cancel;
end;

procedure TfrmCadCOMPRAS.btnOkClick(Sender: TObject);
begin
  inherited;
  COMPRAS_PRODUTOS.Post;

  if ( ed_Table_Status.Text = 'E' ) then
  begin
     mm.varI_ApplyUpdateErrors := COMPRAS_PRODUTOS.ApplyUpdates(-1);

     if mm.varI_ApplyUpdateErrors > 0 then
     begin
        dm_rc.rc_ApplyUpdatesError( sqlMaster, mm.varI_ApplyUpdateErrors, mm.MSG_BUGERROR_POST ); 
     end;

     dm_rc.rc_OpenQuery( COMPRAS_PRODUTOS );
  end;
end;

procedure TfrmCadCOMPRAS.btnSaveRegClick(Sender: TObject);
begin
  inherited;
  // como não uso campo autoincremento, atualizo o codigo do MASTER nos respectivos registros DETAIL após a gravação
  dm_rc.rc_UpdateDetailField( mm.varI_ApplyUpdateErrors,
                              ed_Table_Status_OLD.Text,
                              COMPRAS_PRODUTOS,
                              'codicompra',
                              sqlMaster.FieldByName('codigo').AsInteger );
end;

procedure TfrmCadCOMPRAS.COMPRAS_PRODUTOSBeforePost(DataSet: TDataSet);
begin
  inherited;
  if COMPRAS_PRODUTOS.FieldByName('codiprod').AsInteger > 0 then
  begin
     COMPRAS_PRODUTOS.FieldByName('totalprod').AsCurrency := COMPRAS_PRODUTOS.FieldByName('qtde').AsFloat * COMPRAS_PRODUTOS.FieldByName('valorunit').AsCurrency;
  end
  else
     COMPRAS_PRODUTOS.Cancel;
end;

procedure TfrmCadCOMPRAS.dbgProdutosCellClick(Column: TUniDBGridColumn);
begin
  inherited;
  COMPRAS_PRODUTOS.Cancel;
  // atualizar todos os LOOKUPs dinamicamente
  dm_rc.rc_LookUpUpdateData(  self  );
end;

procedure TfrmCadCOMPRAS.dbgProdutosDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
   dm_rc.rc_GridDrawCell( TUniDBGrid( sender ) , ACol, ARow, Column, Attribs ) ;
end;

procedure TfrmCadCOMPRAS.dsCOMPRAS_PRODUTOSStateChange(Sender: TObject);
begin
  inherited;
  // caso utilize algum 'componente BS_COMPONENTS' utilize as instruções abaixo
  // para renderização correta de CRUDS
  if ( dsMaster.State <> dsInactive ) then
        dm_rc.rc_BootStrapRender( self, True );

  btnOk.Enabled  := ( dsCOMPRAS_PRODUTOS.State in [dsInsert, dsEdit] ) and ( sqlMaster.State in [dsInsert, dsEdit] );
end;

procedure TfrmCadCOMPRAS.dsMasterStateChange(Sender: TObject);
begin
  inherited;
  if not ( sqlMaster.State in [dsInsert, dsEdit] ) then
     COMPRAS_PRODUTOS.Cancel;

  btnOk.Enabled  := ( dsCOMPRAS_PRODUTOS.State in [dsInsert, dsEdit] ) and ( sqlMaster.State in [dsInsert, dsEdit] );
end;

procedure TfrmCadCOMPRAS.edLkpPRODUTOSClick(Sender: TObject);
begin
  inherited;
      dm_rc.rc_LookUpSearchFilter( Sender, '', '', 'valor_venda' );

      if ( sqlMaster.State in [ dsEdit, dsInsert ] ) then // and ( TUniComponent ( Sender ).Tag = 1 )then
      begin
           COMPRAS_PRODUTOS.FieldByName('valorunit').AsCurrency := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( sender ) , 'valor_venda' ) ;
           COMPRAS_PRODUTOS.FieldByName('produto').ReadOnly     := false;
           COMPRAS_PRODUTOS.FieldByName('produto').AsString     := edLkpPRODUTOS.Text;
      end;
end;

procedure TfrmCadCOMPRAS.edQtdeEnter(Sender: TObject);
begin
  inherited;
  if ( sqlMaster.State in [dsInsert, dsEdit] ) and not ( dsCOMPRAS_PRODUTOS.State in [dsInsert, dsEdit] ) then
  begin
     COMPRAS_PRODUTOS.Insert;
     COMPRAS_PRODUTOS.FieldByName('codicompra').AsInteger := sqlMaster.FieldByName('codigo').AsInteger;
     //COMPRAS_PRODUTOS.FieldByName('codigo').AsInteger     := dm_rc.rc_GetNextID( mm.varB_Use_FireDac, 'COMPRAS_PRODUTOS', 'codigo' ,'' );
     COMPRAS_PRODUTOS.FieldByName('qtde').AsFloat         := 1;
  end;
end;

procedure TfrmCadCOMPRAS.FDSchemaAdapter1AfterApplyUpdate(Sender: TObject);
begin
  inherited;
  //COMPRAS_PRODUTOS.CommitUpdates; // v. 3.2.0.0
end;

procedure TfrmCadCOMPRAS.sqlMasterAfterOpen(DataSet: TDataSet);
begin
  inherited;
  COMPRAS_PRODUTOS.close;
  COMPRAS_PRODUTOS.ParamByName('codicompra').AsInteger := sqlMaster.FieldByName( 'codigo' ).AsInteger;
  dm_rc.rc_OpenQuery( COMPRAS_PRODUTOS );
end;

procedure TfrmCadCOMPRAS.UniFrameCreate(Sender: TObject);
begin
  sqlMaster.close;
  sqlMaster.SQL.Text := ' SELECT [[fields]] ' +
                        '   FROM [[table]] tab ' +
                        '  WHERE tab.[[pk]] = :table_pk ' +  // Apenas cadastro MESTRE é necessário o WHERE( por enquanto )

                        ' [grid] ' + // este 'coringa' indica ao RadCORE o início da query usada na pesquisa padrão

                        ' SELECT ' +

                        '   tab.[[pk]] as "CÓDIGO", f.nome as Fornecedor, tab.dtcadastro, ' +
                        '        [[allpks]] ' +   // só é necessário o [[allpks]] aqui se estiver usando ALIAS em um campo CHAVE PRIMARIA

                        ' FROM  compras tab ' +

                        ' LEFT JOIN empresas e On e.Codigo = tab.CodiEmp  ' +
                        ' LEFT JOIN fornecedores f On f.Codigo = tab.CodiForn ' ;

  ed_Where_Search.Text := ' tab.codiemp = ' + IntToStr( mm.varI_Code_Company );
  ed_Order_Search.Text := '';

  // parametros de pesquisa especifica por datas( pesq. por periodo )  - ANTES DO INHERITED
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDFieldDate.name, 'tab.dtcadastro'    , 'CADASTRO' );

  dbgProdutos.Hint :=
  '[[' +
  'fieldmasks:' +
  'grid-resize|' +
  //'grid-noforcefit|' +
  'codicompra[[' +
  '  visible:false]];' +
  'codiprod[[' +
  '  visible:false]];' +
  ']]' ;

  inherited;
  // parametros de pesquisa padrao - DEPOIS DO INHERITED
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.' + ed_PK.Text + ' as "CÓDIGO"', 'CÓDIGO' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'f.nome as Fornecedor'        , 'FORNECEDOR' );
  // parametros de pesquisa complementar( opcional )

  // particularidades do form
  //
end;

initialization
  RegisterClass(TfrmCadCOMPRAS);

end.
