unit untCadEXTRATO_COMISSAO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, uniScreenMask, Vcl.Menus,
  uniMainMenu, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniDBDateTimePicker, uniDBEdit, UniButtonDbEdit, uniDBComboBox,
  uniDateTimePicker, uniMultiItem, uniComboBox, UniButtonEdit, uniScrollBox,
  uniPageControl, uniButton, uniBitBtn, uniMemo, uniBasicGrid, uniDBGrid,
  uniEdit, uniLabel, uniDBMemo;

type
  TAcaoCrud = (tpIncluir, tpAlterar, tpExcluir, tpListaVazia,tpListacomRegistros);
  TfrmCadEXTRATO_COMISSAO = class(TfrmBase)
    UniContainerPanel1: TUniContainerPanel;
    paBaseButtons: TUniContainerPanel;
    paOF: TUniContainerPanel;
    btnCloseForm: TUniBitBtn;
    btnOptions: TUniBitBtn;
    paP: TUniContainerPanel;
    btnSearch: TUniBitBtn;
    paNAE: TUniContainerPanel;
    btnNewReg: TUniBitBtn;
    btnEditReg: TUniBitBtn;
    btnDeleteReg: TUniBitBtn;
    paGC: TUniContainerPanel;
    btnSaveReg: TUniBitBtn;
    btnCancelReg: TUniBitBtn;
    pgBaseCadControl: TUniPageControl;
    tabSearch: TUniTabSheet;
    paBaseRegSearch: TUniContainerPanel;
    paSearchFilters: TUniPanel;
    UniScrollBox1: TUniScrollBox;
    paSearchFilter1: TUniContainerPanel;
    paSearchOp1: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniButtonEditppessoas: TUniButtonEdit;
    UniLabel1: TUniLabel;
    UniContainerPanel4: TUniContainerPanel;
    UniContainerPanel5: TUniContainerPanel;
    UniButtonEditpnumero: TUniButtonEdit;
    UniLabel2: TUniLabel;
    labTitleSearch: TUniLabel;
    paSearchFilterPeriodSelect: TUniContainerPanel;
    paSearchFilterDtIni: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchCRUDDtIni: TUniDateTimePicker;
    paSearchFilterDtEnd: TUniContainerPanel;
    UniLabelDtEnd: TUniLabel;
    edSearchCRUDDtEnd: TUniDateTimePicker;
    paSearchBtn: TUniContainerPanel;
    btnSearchCRUD: TUniBitBtn;
    btnSearchMoreFilters: TUniBitBtn;
    dbgSearchCRUD: TUniDBGrid;
    tabRegister: TUniTabSheet;
    paBaseRegData1: TUniContainerPanel;
    dsfiltro: TDataSource;
    FDQryFiltro: TFDQuery;
    dscrud: TDataSource;
    FDQryCad: TFDQuery;
    popMenuOptions: TUniPopupMenu;
    G1: TUniMenuItem;
    UniScreenMask1: TUniScreenMask;
    UniContainerPanel8: TUniContainerPanel;
    UniFormattedNumberEditSALDO: TUniFormattedNumberEdit;
    UniLabel28: TUniLabel;
    labExit: TUniLabel;
    labTitleForm: TUniLabel;
    UniMemolog: TUniMemo;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    UniLabel13: TUniLabel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    UniLabel6: TUniLabel;
    UniDBDateTimePicker3: TUniDBDateTimePicker;
    UniLabel7: TUniLabel;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    UniDBEditnumero: TUniDBEdit;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    rcDBComboBox50: TUniDBComboBox;
    UniLabel27: TUniLabel;
    UniDBEditsequencia: TUniDBEdit;
    UniDBEdit5: TUniDBEdit;
    UniDBComboBox1: TUniDBComboBox;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    rcBlock100: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    rcBlock130: TUniContainerPanel;
    UniLabel18: TUniLabel;
    UniButtonDbEdit2: TUniButtonDbEdit;
    UniDBEdit1: TUniDBEdit;
    UniLabel12: TUniLabel;
    UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniLabel14: TUniLabel;
    UniLabel15: TUniLabel;
    rcBlock140: TUniContainerPanel;
    UniLabel16: TUniLabel;
    UniDBMemo1: TUniDBMemo;
    ed_Table_ItemSel: TUniEdit;
    ed_FormOrigin: TUniEdit;
    ed_FormOrigin_Tab: TUniEdit;
    ed_Table_Status: TUniEdit;
    ed_Order_Search: TUniEdit;
    ed_Where_Search: TUniEdit;
    ed_CodMaster: TUniEdit;
    ed_PK: TUniEdit;
    ed_FieldMasks: TUniEdit;
    ed_OldPKValue: TUniEdit;
    ed_Table_Status_OLD: TUniEdit;
    ed_GenNextID_OnNew: TUniEdit;
    ed_AskNewRec_AfterPost: TUniEdit;
    dbgExport: TUniDBGrid;
    ed_PKS: TUniEdit;
    ed_OLDPKS: TUniEdit;
    FDQryFiltroCODIGO: TIntegerField;
    FDQryFiltroNUMERO: TIntegerField;
    FDQryFiltroSERIE: TStringField;
    FDQryFiltroPAGAMENTO: TDateField;
    FDQryFiltroHISTORICO: TStringField;
    FDQryFiltroTIPO: TStringField;
    FDQryFiltroPARCELA: TIntegerField;
    FDQryFiltroVALOR: TFMTBCDField;
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure UniButtonEditppessoasButtonClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure FDQryFiltroTIPOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure UniButtonDbEdit2ButtonClick(Sender: TObject);
    procedure UniButtonDbEdit2Exit(Sender: TObject);
    procedure UniDBDateTimePicker3Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure LimpaVars();
  procedure HabilitaCombobox(status:boolean);
  procedure SetBut(Acao:TAcaoCrud);
  procedure MemoGravaLog();
  procedure Exclui();
  function  CamposValidados :Boolean;
  procedure ativabusca();

  end;

var
  frmCadEXTRATO_COMISSAO: TfrmCadEXTRATO_COMISSAO;
  state                 : string;

implementation

uses
  System.TypInfo, mkm_funcoes, untDM_RC, MainModule, mkm_procedures,
  mkm_func_web, untFrmPesquisa, System.DateUtils, Vcl.Clipbrd;

{$R *.dfm}

procedure TfrmCadEXTRATO_COMISSAO.ativabusca;
begin
  if not ( dsfiltro.State in [dsEdit, dsInsert ] ) then
  begin
     pgBaseCadControl.ActivePage := tabSearch;

     if mm.varB_Mobile_Screen_Portrait then
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, dbgSearchCRUD.Width, 0 )
     else
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, 266, 0 );
  end;
end;

procedure TfrmCadEXTRATO_COMISSAO.btnCancelRegClick(Sender: TObject);
begin
  inherited;
  if  sqlSearchMaster.IsEmpty then
      SetBut(tpListaVazia)
  else
      SetBut(tpListacomRegistros);

   sqlMaster.Close ;
   LimpaVars;
  HabilitaCombobox(True);
end;

procedure TfrmCadEXTRATO_COMISSAO.btnDeleteRegClick(Sender: TObject);
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
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Operação cancelada pelo USUÁRIO!' , 'warning' , false );
      Abort
    end;
end;

procedure TfrmCadEXTRATO_COMISSAO.btnEditRegClick(Sender: TObject);
var i : integer; Cmp:String;
begin
  inherited;

  pgBaseCadControl.ActivePage := tabRegister;

  SetBut(tpAlterar);
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
  HabilitaCombobox(False);
end;

procedure TfrmCadEXTRATO_COMISSAO.btnNewRegClick(Sender: TObject);
  var i : integer; Cmp:String;
begin
  inherited;

  pgBaseCadControl.ActivePage := tabRegister;

  SetBut(tpIncluir);
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

  HabilitaCombobox(False);

  sqlMaster.Append;
  sqlMaster.Findfield('CODIGO').AsInteger     := 0;
  sqlMaster.Findfield('NUMERO').AsInteger     := Ultimo_Codigo('EXTRATO_COMISSAO','CODIGO',True);
  sqlMaster.FindField('KEY').AsString         := Gera_Guid();
  sqlMaster.Findfield('EMPRESA').AsInteger    := mm.varI_Code_Company;
  sqlMaster.Findfield('EMISSAO').AsDateTime   := date;
  sqlMaster.Findfield('VENCIMENTO').AsDateTime:= date;
  sqlMaster.Findfield('PAGAMENTO').AsDateTime := date;

  sqlMaster.Findfield('SEQUENCIA').AsInteger  := 1;
  sqlMaster.Findfield('PARCELA').AsInteger    := 1;
  sqlMaster.Findfield('TIPO').AsString        := 'Entrada';
  sqlMaster.Findfield('HISTORICO').AsString   := 'ENTRADA/SAIDA DA COMISSAO';
  sqlMaster.Findfield('SERIE').AsString       := 'COM';
  sqlMaster.Findfield('VALOR').AsFloat        := 0;
  sqlMaster.Findfield('COMISSAO').AsFloat     := 0;
end;

procedure TfrmCadEXTRATO_COMISSAO.btnSaveRegClick(Sender: TObject);
begin
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

       state := Retornastatustable(FDQryCad);
       sqlMaster.Post;

       mm.FDTransaction.Commit;

       try
         MemoGravaLog();
         GravaLog(mm.varI_Code_Company,
                  mm.varI_User,
                  sqlMaster.FindField('CODIGO').AsInteger,
                  mm.vUserName,
                  state,
                  sqlMaster.UpdateOptions.UpdateTableName,
                  '',
                  UniMemolog.Text);

         dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Gravados com SUCESSO!' , 'success' , false );
       except
         dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui gravar, chame o SUPORTE!' , 'error' , false );
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

procedure TfrmCadEXTRATO_COMISSAO.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmCadEXTRATO_COMISSAO.btnSearchCRUDClick(Sender: TObject);
var
  sql : string;
begin
  sql := ' select * from extrato_comissao ' +
         ' where empresa   =              ' + IntToStr(mm.varI_Code_Company) +
         variif(UniButtonEditppessoas.Text = '0','',' and funcionario = ' + QuotedStr(UniButtonEditppessoas.Text)) +
         variif(UniButtonEditpnumero.Text  = '0','',' and numero      = ' + QuotedStr(UniButtonEditpnumero.Text))  +
         ' and pagamento between             ' + QuotedStr(DataPonto(DateToStr(edSearchCRUDDtIni.DateTime))) +
         ' and                               ' + QuotedStr(DataPonto(DateToStr(edSearchCRUDDtEnd.DateTime))) +
         ' order by pagamento,sequencia      ';

  sqlSearchMaster.Close;
  sqlSearchMaster.SQL.Clear;
  sqlSearchMaster.SQL.Text  := SQL;
  sqlSearchMaster.Open();

  if sqlSearchMaster.RecordCount > 0 then
    begin
      SetBut(tpListacomRegistros);
      sqlSearchMaster.Last;
    end
  else
    SetBut(tpListaVazia);

  UniFormattedNumberEditSALDO.value := Calcula_SaldoExtrato(mm.varI_Code_Company,
                                                            StrToInt(UniButtonEditppessoas.Text),
                                                            edSearchCRUDDtEnd.DateTime);
end;

function TfrmCadEXTRATO_COMISSAO.CamposValidados: Boolean;
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
           dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', Campos.Text, 'error' , false );
           sqlMaster.Fields[e].FocusControl ;
           result := false ;
        end
     Else
       result := true;

  finally
    Campos.Free;
  end;
end;

procedure TfrmCadEXTRATO_COMISSAO.dbgSearchCRUDDblClick(Sender: TObject);
  var i : integer; Cmp:String;
begin
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

  pgBaseCadControl.ActivePage := tabRegister;
end;

procedure TfrmCadEXTRATO_COMISSAO.Exclui;
var
  codigotable : integer;
begin
  MemoGravaLog();
  codigotable := sqlMaster.FindField('CODIGO').AsInteger;
  sqlMaster.Delete;

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

    dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Excluido com SUCESSO!' , 'success' , false );
    pgBaseCadControl.ActivePage := tabSearch;
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui DELETAR, chame o SUPORTE!' , 'error' , false );
  end;
end;

procedure TfrmCadEXTRATO_COMISSAO.FDQryFiltroTIPOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if FDQryFiltroTIPO.AsString = 'Entrada' then
        Text := '<span class="badge badge-success">Entrada</span>'
      else
      if FDQryFiltroTIPO.AsString = 'Saida' then
        Text := '<span class="badge badge-danger">Saida</span>';
    end;
end;

procedure TfrmCadEXTRATO_COMISSAO.HabilitaCombobox(status: boolean);
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

procedure TfrmCadEXTRATO_COMISSAO.LimpaVars;
begin

end;

procedure TfrmCadEXTRATO_COMISSAO.MemoGravaLog;
var
  i         : integer;
begin
  UniMemolog.Clear;
  for i := 0 to (sqlMaster.FieldCount - 1) do
    UniMemolog.Lines.Add(sqlMaster.Fields[i].DisplayName + ':' + sqlMaster.Fields[i].DisplayText);
end;

procedure TfrmCadEXTRATO_COMISSAO.SetBut(Acao: TAcaoCrud);
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
procedure TfrmCadEXTRATO_COMISSAO.UniButtonDbEdit2ButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('FUNCIONARIOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       sqlMaster.FindField('FUNCIONARIO').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmCadEXTRATO_COMISSAO.UniButtonDbEdit2Exit(Sender: TObject);
begin
  inherited;
  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    sqlMaster.FindField('NOME_FUNCIONARIO').AsString    := Acha_Item('FUNCIONARIOS' ,sqlMaster.FindField('FUNCIONARIO').AsString);
end;

procedure TfrmCadEXTRATO_COMISSAO.UniButtonEditppessoasButtonClick(
  Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('FUNCIONARIOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditppessoas.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmCadEXTRATO_COMISSAO.UniDBDateTimePicker3Exit(Sender: TObject);
begin
  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    sqlMaster.FindField('SEQUENCIA').AsInteger       := SequenciapagamentoComissao(sqlMaster.FindField('PAGAMENTO').AsDateTime);
end;

procedure TfrmCadEXTRATO_COMISSAO.UniFrameCreate(Sender: TObject);
begin
  inherited;
  HabilitaCombobox(True);

  edSearchCRUDDtIni.Text             := DateToStr(StartOfTheMonth(date));
  edSearchCRUDDtEnd.Text             := DateToStr(EndOfMonth(StrToDate(edSearchCRUDDtIni.Text)));

  btnSearchCRUD.OnClick(Self);
  ativabusca();
end;

initialization
  RegisterClass(TfrmCadEXTRATO_COMISSAO);
end.
