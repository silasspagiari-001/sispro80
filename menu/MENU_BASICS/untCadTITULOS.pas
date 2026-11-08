unit untCadTITULOS;

// =====================================================================
// untCadTITULOS — conversão 3.0 -> 8.0 (padrão GUIA_CONVERSAO.md)
// - TfrmBase -> TfrmBaseCRUD (untFrmBaseCRUD)
// - Renames: FDQryCad->sqlMaster, FDQryFiltro->sqlSearchMaster,
//   dscrud->dsMaster, dsfiltro->dsSearchMaster
// - Removidos (obsoletos 8.0): ativabusca, btnSearchClick, labExitClick,
//   rc_DefaultTitleForm
// - rc_ShowSweetAlert 4 args -> 3 args
// - Componentes da base 8.0 removidos da declaração (herdados):
//   barra/botoes, pgBaseCadControl/abas, paSearchFilters/UniScrollBox1,
//   edSearchCRUDDtIni/End, cbxSearchCRUDField2, btnSearchCRUD,
//   dbgSearchCRUD, dbgExport, popMenuOptions, labTitleForm, labExit,
//   ed_* helper, datasets sqlMaster/sqlSearchMaster/dsMaster/dsSearchMaster
// - inherited mantido só onde o ancestral 8.0 tem o handler:
//   cbxSearchCRUDField2Change, Excel1Click, dbgSearchCRUDDblClick,
//   btnCancelRegClick (por ultimo); removido nos handlers de componentes
//   proprios (UniButtonDbEdit*, G1, btnCloseForm - nao fecha mais a tela)
// - btnSaveRegClick full-override padrao 8.0 (Post+ApplyUpdates+Commit+
//   CommitUpdates / Rollback+Cancel+CancelUpdates)
// =====================================================================

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, uniEdit, uniDBEdit,
  uniLabel, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, UniButtonDbEdit,
  UniButtonEdit, uniBasicGrid, uniDBGrid, uniDateTimePicker, uniScrollBox,
  uniPageControl, uniButton, uniBitBtn, uniMultiItem, uniComboBox, clipbrd,
  Vcl.Menus, uniMainMenu, uniDBComboBox, uniSpeedButton, uniDBDateTimePicker,
  uniMemo, uniScreenMask, uniSweetAlert, uniCheckBox;

type

  TAcaoCrud = (tpIncluir, tpAlterar, tpExcluir, tpListaVazia,tpListacomRegistros);

  TfrmBaseTITULOS = class(TfrmBase)
    UniLabelTOTALTITULOS: TUniLabel;
    UniMemolog: TUniMemo;
    UniScreenMask1: TUniScreenMask;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure FDQryFiltroSITUACAOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure Excel1Click(Sender: TObject);
    procedure UniButtonDbEdit2Exit(Sender: TObject);
    procedure UniButtonDbEdit3Exit(Sender: TObject);
    procedure UniButtonDbEdit4Exit(Sender: TObject);
    procedure UniButtonDbEdit2ButtonClick(Sender: TObject);
    procedure UniButtonDbEdit3ButtonClick(Sender: TObject);
    procedure UniButtonDbEdit4ButtonClick(Sender: TObject);
    procedure UniButtonDbEdit1Exit(Sender: TObject);
    procedure UniButtonDbEdit1ButtonClick(Sender: TObject);
    procedure UniButtonEditpbancosButtonClick(Sender: TObject);
    procedure UniButtonEditppessoasButtonClick(Sender: TObject);
    procedure cbxSearchCRUDField2Change(Sender: TObject);
    procedure btnCloseFormClick(Sender: TObject);
    procedure G1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  iCurrentPage : integer;

  procedure SetBut(Acao:TAcaoCrud);
  function  CamposValidados :Boolean;
  procedure Exclui();
  procedure LimpaVars();
  procedure CarregaDados();
  procedure SomaTotal();
  procedure HabilitaCombobox(status:boolean);
  procedure MemoGravaLog();
  function  VerificaFinanceiro(const pacao:string;pfuncionario:integer):boolean;
  end;

var
  frmBaseTITULOS: TfrmBaseTITULOS;
  state           : string;

implementation

{$R *.dfm}

uses untDM_RC, MainModule, mkm_func_web, untFrmLookUp_Lite, mkm_layout,
  mkm_procedures, mkm_funcoes, System.TypInfo, uconsts, untFrmPesquisa,
  untfrmImpressaoFinanceiro, untFrmTELAGENERICA, mkm_impressao,
  unReportImpressao;

procedure TfrmBaseTITULOS.btnCancelRegClick(Sender: TObject);
begin
  sqlMaster.Cancel;
  sqlMaster.CancelUpdates;

  if mm.FDTransaction.Active then
    mm.FDTransaction.Rollback;

  if  sqlSearchMaster.IsEmpty then
      SetBut(tpListaVazia)
  else
      SetBut(tpListacomRegistros);

   sqlMaster.Close ;
   LimpaVars;
  // The base may close a modal frame; do not access Self after inherited.
  inherited;
end;

procedure TfrmBaseTITULOS.btnCloseFormClick(Sender: TObject);
begin
  // 3.0: o "fechar" deste cadastro abre o popup de opcoes (nao fecha a tela)
//  popMenuOptions.PopupBy( TUniButton( sender ) );
end;

procedure TfrmBaseTITULOS.btnDeleteRegClick(Sender: TObject);
var i : integer; Cmp:String;
begin
  mm.varS_SenhaExclusaoNota_permitido   := 'T';
  if mm.varS_SenhaExclusaoNota_permitido = 'T' then
    begin
      mm.varTTIPO_SUP_SENHA               := '';
      mm.varS_SenhaExclusaoNota_permitido := '';
      Exclui();
    end
  else
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Operação cancelada pelo USUÁRIO!' , 'warning' );
      Abort
    end;
end;

procedure TfrmBaseTITULOS.btnEditRegClick(Sender: TObject);
var i : integer; Cmp:String;
begin
  if sqlSearchMaster.IsEmpty then Exit;

  pgBaseCadControl.ActivePage := tabRegister;

  SetBut(tpAlterar);
  if not mm.FDTransaction.Active then
    mm.FDTransaction.StartTransaction;

  HabilitaCombobox(False);

  Try
    sqlMaster.Close;
   for i := 0 to  sqlMaster.Params.Count - 1 do
   begin
      Cmp :=  sqlMaster.Params[i].Name;
      sqlMaster.Params[i].Value :=  sqlSearchMaster.FieldbyName(Cmp).Value;
   end;
    sqlMaster.Open;

    sqlMaster.Edit;
  Except
   Abort ;
  End ;

end;

procedure TfrmBaseTITULOS.btnNewRegClick(Sender: TObject);
  var i : integer; Cmp:String;
begin
  pgBaseCadControl.ActivePage := tabRegister;

  SetBut(tpIncluir);
  if not mm.FDTransaction.Active then
    mm.FDTransaction.StartTransaction;

  try
    sqlMaster.Close ;
    for i := 0 to  sqlMaster.Params.Count - 1 do
    begin
      Cmp :=  sqlMaster.Params[i].Name;
       sqlMaster.Params[i].Value :=  sqlSearchMaster.FieldbyName(Cmp).Value;
    end;
     sqlMaster.Open;
  Except
     sqlMaster.Params[0].AsInteger := -1 ;
     sqlMaster.Open;
  End;

  LimpaVars;

  HabilitaCombobox(False);

  if not( sqlMaster.Active) then
      sqlMaster.Open;

   sqlMaster.Insert ;
   sqlMaster.FindField('CODIGO').AsInteger      := 0;
   sqlMaster.FindField('SEQUENCIA').AsInteger   := 1;
   sqlMaster.FindField('PORTADOR').AsInteger    := 0;
   sqlMaster.FindField('CARTEIRA').AsInteger    := 0;
   sqlMaster.FindField('DOCUMENTO').AsInteger   := 30;
   sqlMaster.FindField('PLANOCONTAS').AsInteger := 0;
   sqlMaster.FindField('VALORDESCONTOS').AsFloat:= 0;
   sqlMaster.FindField('VALORTAXAS').AsFloat    := 0;
   sqlMaster.FindField('VALORJUROS').AsFloat    := 0;
   sqlMaster.FindField('VALORATUAL').AsFloat    := 0;
   sqlMaster.FindField('VALORORIGINAL').AsFloat := 0;
   sqlMaster.FindField('FUNCIONARIO').AsInteger := mm.varI_User;
   sqlMaster.FindField('EMPRESA').AsInteger     := mm.varI_Code_Company;
   sqlMaster.FindField('SITUACAO').AsString     := 'Aberto';
   sqlMaster.FindField('SERIE').AsString        := 'DUP';
   sqlMaster.FindField('EMISSAO').AsDateTime    := Date;
   sqlMaster.FindField('FINANCEIRO').AsInteger  := varIIF(sqlMaster.UpdateOptions.UpdateTableName = 'PAGAR',0,1);
  UniButtonDbEdit4.OnExit(Self);

end;

procedure TfrmBaseTITULOS.btnOptionsClick(Sender: TObject);
begin
  dm_rc.tbgenerico.Close;
  dm_rc.tbgenerico.CopyDataSet(sqlSearchMaster,[coStructure, coRestart, coAppend]);

  mm.varSR_Dataini := edSearchCRUDDtIni.Text;
  mm.varSR_Datafin := edSearchCRUDDtEnd.Text;
  mm.varSR_tipo    := variif(sqlMaster.UpdateOptions.UpdateTableName = 'RECEBER','1','0');

  if StrContains('05668334000151',mm.varC_Doc_Customer) then //germiforma
    begin
      if dm_rc.tbgenerico.RecordCount > 0 then
        begin
          mm.varC_caminhopdf :=  IMPRESSAO_Financeiro(
                                 MM.varSR_tipo,
                                 mm.varSR_Dataini,
                                 mm.varSR_Datafin,
                                 mm.varI_Code_Company,
                                 cbxSearchCRUDField2.ItemIndex,
                                 dm_rc.tbgenerico);

          unfImpressao.ShowModal();
        end
      else
        dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Busque Alguma Informação antes de IMPRIMIR!' , 'warning' );
    end
  else
    frmimpressaofinanceiro.ShowModal();

  btnSearchCRUD.OnClick(Self);

end;

procedure TfrmBaseTITULOS.btnSaveRegClick(Sender: TObject);
begin
  if sqlMaster.FindField('PLANOCONTAS').AsInteger = 0 then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'PLANO DE CONTAS NAO PODE SER "0"!' , 'error' );
      abort
    end;

  if not (CamposValidados) then
     Abort
  else
    if sqlMaster.State in [dsInsert,dsEdit] then
     Begin
       if sqlMaster.State in [dsInsert] then
         begin
           sqlMaster.FindField('LOGINCLUSAO').AsString  := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);
           sqlMaster.FindField('CODIGO').AsInteger      := Ultimo_Codigo(sqlMaster.UpdateOptions.UpdateTableName,'CODIGO',True);
           sqlMaster.FindField('KEY').AsString          := Gera_Guid;
         end
       else
         sqlMaster.FindField('LOGALTERACAO').AsString  := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);

       state := Retornastatustable(sqlMaster);
       try
         if not mm.FDTransaction.Active then
           mm.FDTransaction.StartTransaction;
         sqlMaster.Post;
         sqlMaster.ApplyUpdates(-1);
         mm.FDTransaction.Commit;
         sqlMaster.CommitUpdates;

         MemoGravaLog();
         GravaLog(mm.varI_Code_Company,
                  mm.varI_User,
                  sqlMaster.FindField('CODIGO').AsInteger,
                  mm.vUserName,
                  state,
                  sqlMaster.UpdateOptions.UpdateTableName,
                  '',
                  UniMemolog.Text);

         dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Gravados com SUCESSO!' , 'success' );
       except
         mm.FDTransaction.Rollback;
         sqlMaster.Cancel;
         sqlMaster.CancelUpdates;
         dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui gravar, chame o SUPORTE!' , 'error' );
         Exit;
       end;
     End;

  HabilitaCombobox(True);

  if  sqlSearchMaster.Active then
    sqlSearchMaster.Refresh;

  if  sqlSearchMaster.IsEmpty then
   SetBut(tpListaVazia)
  Else
   SetBut(tpListacomRegistros);
end;

procedure TfrmBaseTITULOS.btnSearchCRUDClick(Sender: TObject);
var
  SQL,WHERE,SITUACAO,M_AND,M_ORDEM,M_SITUACAO,CAMPOS : string;
begin
  if UniButtonEditpbancos.Text = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'Atenção', 'Preencher o campo de Bancos ou deixa "0"', 'warning' ) ;
      UniButtonEditpbancos.SetFocus;
      abort
    end;

  if UniButtonEditppessoas.Text = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'Atenção', 'Preencher o campo de Pessoas ou deixa "0"', 'warning' ) ;
      UniButtonEditppessoas.SetFocus;
      abort;
    end;

  if UniButtonEditpnumero.Text = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'Atenção', 'Preencher o campo de Numero ou deixa "0"', 'warning' ) ;
      UniButtonEditpnumero.SetFocus;
      abort;
    end;


  CAMPOS := ' T.KEY, T.CODIGO, T.NUMERO, T.DOCUMENTO, T.CARTEIRA, T.EMPRESA, T.SERIE, T.SEQUENCIA, T.PESSOA, P.NOME, T.EMISSAO, T.VENCIMENTO, T.PAGAMENTO, T.VALORATUAL, T.VALORORIGINAL, T.VALORPAGO, T.OBSERVACOES, T.SITUACAO ';

  case UniComboBoxSTATUS.ItemIndex of
    0 : M_SITUACAO := ' AND T.situacao = ' + QuotedStr('Aberto');
    1 : M_SITUACAO := ' AND T.situacao = ' + QuotedStr('Pago');
    2 : M_SITUACAO := '';
  end;


  case cbxSearchCRUDField2.ItemIndex of
    0: M_ORDEM := ' ORDER BY T.EMISSAO    asc';
    1: M_ORDEM := ' ORDER BY T.VENCIMENTO asc';
    2: M_ORDEM := ' ORDER BY T.PAGAMENTO  asc';
  end;

  ed_Order_Search.Text := 't.emissao';

  case cbxSearchCRUDField2.ItemIndex of
    0: M_AND   := ' AND T.EMISSAO BETWEEN                ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
    1: M_AND   := ' AND T.VENCIMENTO BETWEEN             ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
    2: M_AND   := ' AND T.PAGAMENTO BETWEEN              ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
  end;


  SQL :=    ' SELECT ' + CAMPOS +
            ' FROM   ' + sqlMaster.UpdateOptions.UpdateTableName        +
            ' T INNER JOIN PESSOAS P ON (T.PESSOA = P.CODIGO)        ' +
            ' AND T.FINANCEIRO                            =          ' + varIIF(sqlMaster.UpdateOptions.UpdateTableName = 'PAGAR',QuotedStr('0'),QuotedStr('1')) +
            variif(UniButtonEditppessoas.Text             = '0'    ,'','AND T.PESSOA      = ' + QuotedStr(UniButtonEditppessoas.Text))      +
            variif(UniButtonEditpbancos.Text              = '0'    ,'','AND T.PORTADOR    = ' + QuotedStr(UniButtonEditpbancos.Text))       +
            variif(UniButtonEditpnumero.Text              = '0'    ,'','AND T.NUMERO      = ' + QuotedStr(UniButtonEditpnumero.Text))       +
            variif(UniComboBoxtiposerie.Text              = 'TODOS','','AND T.SERIE       = ' + QuotedStr(UniComboBoxtiposerie.Text))       +
            ' AND T.EMPRESA                               = ' + IntToStr(mm.varI_Code_Company);

  sqlSearchMaster.Close;
  sqlSearchMaster.SQL.Clear;
  sqlSearchMaster.SQL.Text  := SQL + M_AND + M_SITUACAO; //  + M_ORDEM;
  sqlSearchMaster.Open();


  SomaTotal();
  if sqlSearchMaster.RecordCount > 0 then
    SetBut(tpListacomRegistros)
  else
    SetBut(tpListaVazia);
end;

function TfrmBaseTITULOS.CamposValidados: Boolean;
var
  i,e :Integer;
  Campos :TStrings;
begin
  Try
    Campos := TStringList.Create;
    Campos.Clear ;
    e := 0 ;
    for I:= 0 to ComponentCount -1 do
       begin
         if ( Components[I] is TUniDBEdit )  then
            begin

               If ( TUniDBEdit(Components[i]).Tag = 1 ) then
                 Begin
                   if TUniDBEdit(Components[i]).Text = '' then
                      begin
                        Campos.Add('-' + TUniDBEdit(Components[i]).Field.DisplayName ) ;
                        inc(e) ;
                      end;
                 End;
            end;
       end;

     if e = 0  then
        result := true ;

     If e > 0 then
        Begin
           Campos.Insert(0,'Preencha os campos obrigatórios:');
           dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', Campos.Text, 'warning' );
           sqlMaster.Fields[e].FocusControl ;
           result := false ;
        end
     Else
       result := true;

  finally
    Campos.Free;
  end;

end;

procedure TfrmBaseTITULOS.CarregaDados;
begin
  if SqlPesquisa('SELECT CODIGO, NOME,CPFCNPJ,TELEFONE FROM PESSOAS WHERE CODIGO = ' + QuotedStr(sqlMaster.FindField('PESSOA').AsString)) then
    begin
      edSearchCRUD2.Text := dm_rc.sqlBuscas.FindField('NOME').AsString;
      UniEdit1.Text      := dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString;
      UniEdit2.Text      := dm_rc.sqlBuscas.FindField('TELEFONE').AsString;
    end;

  UniEditportadordescricao.Text := Acha_Item('PORTADORES'  ,sqlMaster.FindField('PORTADOR').AsString);
  UniEditplanodescricao.Text    := Acha_Item('PLANOCONTAS' ,sqlMaster.FindField('PLANOCONTAS').AsString);
  UniEditCarteiradescricao.Text := Acha_Item('CARTEIRA'    ,sqlMaster.FindField('CARTEIRA').AsString);
  UniEditnomevendedor.Text      := Acha_Item('FUNCIONARIOS',sqlMaster.FindField('FUNCIONARIO').AsString);

end;

procedure TfrmBaseTITULOS.cbxSearchCRUDField2Change(Sender: TObject);
begin
  inherited;
  if cbxSearchCRUDField2.ItemIndex = 2 then
    UniComboBoxSTATUS.ItemIndex := 1;
end;

procedure TfrmBaseTITULOS.dbgSearchCRUDDblClick(Sender: TObject);
  var i : integer; Cmp:String;
begin
  if sqlSearchMaster.IsEmpty then Exit;

  inherited;
  pgBaseCadControl.ActivePage := tabRegister;
  LimpaVars();

  try
    sqlMaster.Close ;
    for i := 0 to  sqlMaster.Params.Count - 1 do
    begin
      Cmp :=  sqlMaster.Params[i].Name;
       sqlMaster.Params[i].Value :=  sqlSearchMaster.FieldbyName(Cmp).Value;
    end;
     sqlMaster.Open;
  Except
     sqlMaster.Params[0].AsInteger := -1 ;
     sqlMaster.Open;
  End;

  if not( sqlMaster.Active) then
    begin
      sqlMaster.Open;
    end;

  if sqlMaster.RecordCount > 0 then
    begin
      CarregaDados();
    end;

  pgBaseCadControl.ActivePage := tabRegister;
end;

procedure TfrmBaseTITULOS.Excel1Click(Sender: TObject);
var url, filename, reportname : String;
    //exportExcel: TDataSetToExcel;
    i: integer;
begin
  inherited;
  dm_rc.rc_DBGridExport( dbgExport, etExcel );
end;

procedure TfrmBaseTITULOS.Exclui;
var
  codigotable : integer;
begin
  MemoGravaLog();
  codigotable := sqlMaster.FindField('CODIGO').AsInteger;
  sqlMaster.Delete;
  sqlMaster.ApplyUpdates(-1);
  sqlMaster.CommitUpdates;

  try
    if  sqlSearchMaster.Active then
      sqlSearchMaster.Refresh;

   GravaLog(mm.varI_Code_Company,
            mm.varI_User,
            codigotable,
            mm.vUserName,
            'dsDelete',
            sqlMaster.UpdateOptions.UpdateTableName,
            '',
            UniMemolog.Text);

    Lixeira(mm.varI_Code_Company,
            mm.vUserName,
            sqlMaster.UpdateOptions.UpdateTableName,
            UniMemolog.Text);

    dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Excluido com SUCESSO!' , 'success' );
    pgBaseCadControl.ActivePage := tabSearch;
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui DELETAR, chame o SUPORTE!' , 'error' );
  end;
  SomaTotal();
end;

procedure TfrmBaseTITULOS.FDQryFiltroSITUACAOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
    begin
      if FDQryFiltroSITUACAO.AsString = 'Aberto' then
        Text := '<span class="badge badge-warning">Aberto</span>'
      else
      if FDQryFiltroSITUACAO.AsString = 'Pago' then
        Text := '<span class="badge badge-success">Pago</span>';

      if FDQryFiltroSITUACAO.AsString = 'Aberto' then
        begin
          if Date > FDQryFiltroVENCIMENTO.AsDateTime then
            Text := '<span class="badge badge-danger">Atrasado</span>';
        end;
    end;
end;

procedure TfrmBaseTITULOS.G1Click(Sender: TObject);
begin
  mm.VarC_Atelagenerica := 'PARCELATITULOS';
  frmTELAGENERICA.ShowModal();
end;

procedure TfrmBaseTITULOS.HabilitaCombobox(status: boolean);
var
  e,i:integer;
begin
  e := 0 ;
  for I:= 0 to ComponentCount -1 do
     begin
       if ( Components[I] is TUniDBComboBox )  then
         begin
           TUniDBEdit(Components[i]).ReadOnly := status;
         end;
     end;
end;

procedure TfrmBaseTITULOS.LimpaVars;
begin
  edSearchCRUD2.Text            := '';
  UniEdit1.Text                 := '';
  UniEdit2.Text                 := '';
  UniEditportadordescricao.Text := '';
  UniEditplanodescricao.Text    := '';
  UniEditnomevendedor.Text      := '';
end;

procedure TfrmBaseTITULOS.MemoGravaLog;
var
  i         : integer;
begin
  UniMemolog.Clear;
  for i := 0 to (sqlMaster.FieldCount - 1) do
    UniMemolog.Lines.Add(sqlMaster.Fields[i].DisplayName + ':' + sqlMaster.Fields[i].DisplayText);
end;

procedure TfrmBaseTITULOS.SetBut(Acao: TAcaoCrud);
var s:string ;
begin
  s := GetEnumName(TypeInfo(TAcaoCrud),integer(Acao));

  // Controle dos botoes
  if acao in [tpIncluir,tpAlterar,tpExcluir] then
     begin
       btnNewReg.Visible     := false;
       btnEditReg.Visible    := false;
       btnDeleteReg.Visible  := false;
       btnCancelReg.Visible  := true;
       btnSaveReg.Visible    := true;
     end
   else if acao in [tpListaVazia] then
      begin
        btnNewReg.Visible     := true;
        btnEditReg.Visible    := false;
        btnDeleteReg.Visible  := false;
        btnCancelReg.Visible  := false;
        btnSaveReg.Visible    := false;
      end
    else if acao in [tpListacomRegistros] then
      begin
        btnNewReg.Visible     := true;
        btnEditReg.Visible    := true;
        btnDeleteReg.Visible  := true;
        btnCancelReg.Visible  := false;
        btnSaveReg.Visible    := false;
       end;
end;

procedure TfrmBaseTITULOS.SomaTotal;
var
  sumvalue : Real;
begin
  sumvalue := 0;

  sqlSearchMaster.DisableControls;
  sqlSearchMaster.First;
  while not sqlSearchMaster.Eof do
    begin
      sumvalue := sumvalue + sqlSearchMaster.FindField('VALORATUAL').AsFloat;
      sqlSearchMaster.Next;
    end;
  sqlSearchMaster.First;
  sqlSearchMaster.EnableControls;

  UniLabelTOTALTITULOS.Text := FormatFloat('R$ #,0.00', sumvalue);
end;

procedure TfrmBaseTITULOS.UniButtonDbEdit1ButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PESSOAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       sqlMaster.Edit;
       sqlMaster.FindField('PESSOA').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmBaseTITULOS.UniButtonDbEdit1Exit(Sender: TObject);
begin
  if (UniButtonDbEdit1.Text <> '') and (UniButtonDbEdit1.Text <> '0') then
    if SqlPesquisa('SELECT NOME,CPFCNPJ,TELEFONE FROM PESSOAS WHERE CODIGO = ' + QuotedStr(UniButtonDbEdit1.Text)) then
      begin
        edSearchCRUD2.Text := dm_rc.sqlBuscas.FindField('NOME').AsString;
        UniEdit1.Text      := dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString;
        UniEdit2.Text      := dm_rc.sqlBuscas.FindField('TELEFONE').AsString;
      end;
end;

procedure TfrmBaseTITULOS.UniButtonDbEdit2ButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PORTADORES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       sqlMaster.Edit;
       sqlMaster.FindField('PORTADOR').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmBaseTITULOS.UniButtonDbEdit2Exit(Sender: TObject);
begin
  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    UniEditportadordescricao.Text := Acha_Item('PORTADORES'  ,sqlMaster.FindField('PORTADOR').AsString);
end;

procedure TfrmBaseTITULOS.UniButtonDbEdit3ButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PLANOCONTAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       sqlMaster.Edit;
       sqlMaster.FindField('PLANOCONTAS').AsString := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmBaseTITULOS.UniButtonDbEdit3Exit(Sender: TObject);
begin
  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    UniEditplanodescricao.Text    := Acha_Item('PLANOCONTAS' ,sqlMaster.FindField('PLANOCONTAS').AsString);
end;

procedure TfrmBaseTITULOS.UniButtonDbEdit4ButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('FUNCIONARIOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       sqlMaster.Edit;
       sqlMaster.FindField('FUNCIONARIO').AsString := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmBaseTITULOS.UniButtonDbEdit4Exit(Sender: TObject);
begin
  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    UniEditnomevendedor.Text      := Acha_Item('FUNCIONARIOS',sqlMaster.FindField('FUNCIONARIO').AsString);
end;

procedure TfrmBaseTITULOS.UniButtonEditpbancosButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PORTADORES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditpbancos.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmBaseTITULOS.UniButtonEditppessoasButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PESSOAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditppessoas.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmBaseTITULOS.UniFrameCreate(Sender: TObject);
begin
  mm.varC_Table_Search   := sqlMaster.UpdateOptions.UpdateTableName;
  mm.varC_PK_MasterTable := 'CODIGO';

  cbxSearchCRUDField2.ItemIndex  := 1;
  UniComboBoxSTATUS.ItemIndex    := 0;
  UniComboBoxtiposerie.ItemIndex := 6;

  edSearchCRUDDtIni.Text        := '01/01/2010';
  edSearchCRUDDtEnd.Text        := '31/12/2099';

  HabilitaCombobox(True);

  inherited;

  btnSearchCRUDClick(Self);
end;

function  TfrmBaseTITULOS.VerificaFinanceiro(const pacao:string;pfuncionario:integer):boolean;
begin
  if pacao = 'editar' then
    begin
      // SELEGRAM
      if StrContains('52070356000103',mm.varC_Doc_Customer) then
        begin
          if (sqlMaster.FindField('SITUACAO').AsString = 'Pago') or (sqlMaster.FindField('SITUACAO').AsString = 'Aberto') then
            begin
              Result := False;
            end
          else
            Result := True;
        end
      else
        Result := True;
    end;
end;

end.
