unit untFrmCADCHEQUEMOVIMENTO; // 8.0.0.0
(*
[PT] Conversão RADCore 3.0 -> 8.0 — formulário modal auxiliar (lançamento de cheques do movimento)
     - Form standalone (TUniForm): não herda do frame CRUD; datasets locais mantidos
       (FDQryCad/dscrud e FDQryFiltro/dsfiltro)
     - rc_ShowSweetAlert 4 args -> 3 args
     - FDQryCad agora CachedUpdates: gravação/exclusão passam a usar mm.FDTransaction +
       ApplyUpdates(-1) + CommitUpdates, com rollback e restauração de valores no except
       (mesmo padrão do btnSaveRegClick da nota 8.0)
     - layout modal 8.0 (doc LayoutRender): rc_RenderLayout em OnBeforeShow + rc_ResizeBlocks em OnReady (3.0)
     - botões de ação ganham ScreenMask.Target = Owner no DFM
     - TAcaoCrud local mantido (tipo espelho do da base; não há uconsts neste escopo)
     - CamposValidados preservado fielmente (já não era chamado pelo save na 3.0)
[EN] RADCore 3.0 -> 8.0 conversion
*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniPanel, uniEdit, uniDBEdit, UniButtonDbEdit, uniLabel,
  uniDateTimePicker, uniDBDateTimePicker, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniMemo, uniDBMemo;

type
  TAcaoCrud = (tpIncluir, tpAlterar, tpExcluir, tpListaVazia,tpListacomRegistros);

  TfrmCADCHEQUESMOVIMENTO = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    btnLkpClear: TUniBitBtn;
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniDBGridEntrega: TUniDBGrid;
    rcBlock20: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    UniContainerPanel5: TUniContainerPanel;
    UniContainerPanel6: TUniContainerPanel;
    UniContainerPanel7: TUniContainerPanel;
    UniContainerPanel8: TUniContainerPanel;
    UniContainerPanel9: TUniContainerPanel;
    UniContainerPanel10: TUniContainerPanel;
    btnNewReg: TUniBitBtn;
    UniBitBtnedit: TUniBitBtn;
    UniBitBtncancel: TUniBitBtn;
    UniButtonDbEdit: TUniButtonDbEdit;
    UniDBEdit8: TUniDBEdit;
    UniDBEdit1: TUniDBEdit;
    UniDBEdit2: TUniDBEdit;
    UniDBFormattedNumberEdit: TUniDBFormattedNumberEdit;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    UniDBEdit3: TUniDBEdit;
    UniDBEdit4: TUniDBEdit;
    UniLabel7: TUniLabel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    UniBitBtnsave: TUniBitBtn;
    dsfiltro: TDataSource;
    FDQryFiltro: TFDQuery;
    dscrud: TDataSource;
    FDQryCad: TFDQuery;
    UniBitBtnexclui: TUniBitBtn;
    UniContainerPanel11: TUniContainerPanel;
    UniButtonDbEdit1: TUniButtonDbEdit;
    UniLabel10: TUniLabel;
    rcBlock30: TUniContainerPanel;
    UniDBMemo1: TUniDBMemo;
    procedure btnNewRegClick(Sender: TObject);
    procedure UniBitBtneditClick(Sender: TObject);
    procedure UniBitBtncancelClick(Sender: TObject);
    procedure UniBitBtnsaveClick(Sender: TObject);
    procedure UniBitBtnexcluiClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure btnLkpClearClick(Sender: TObject);
    procedure UniDBGridEntregaCellClick(Column: TUniDBGridColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    cMSG_BUGERROR_RECORDS_SELECTION,
    cMSG_RECORDS_FOUND : string ;
    cFormModal         : TUniForm;

    procedure Busca(empresa,numero,documento,pessoa:integer);
    procedure SetBut(Acao: TAcaoCrud);
    function  CamposValidados :Boolean;
  end;

function frmCADCHEQUESMOVIMENTO: TfrmCADCHEQUESMOVIMENTO;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, mkm_procedures, mkm_funcoes,mkm_layout,
  System.TypInfo;

function frmCADCHEQUESMOVIMENTO: TfrmCADCHEQUESMOVIMENTO;
begin
  Result := TfrmCADCHEQUESMOVIMENTO(MM.GetFormInstance(TfrmCADCHEQUESMOVIMENTO));
end;

{ TfrmCADCHEQUESMOVIMENTO }

procedure TfrmCADCHEQUESMOVIMENTO.btnLkpClearClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmCADCHEQUESMOVIMENTO.btnNewRegClick(Sender: TObject);
begin
  SetBut(tpIncluir);

  if not( FDQryCad.Active) then
      dm_rc.rc_OpenQuery(FDQryCad);

  FDQryCad.Insert;
  FDQryCad.FindField('EMPRESA').AsInteger       := mm.varI_Code_Company;
  FDQryCad.FindField('PARCELA').AsInteger       := 1;
  FDQryCad.FindField('EMISSAO').AsDateTime      := Date;
  FDQryCad.FindField('VENCIMENTO').AsDateTime   := Date;
  FDQryCad.FindField('VALOR').AsFloat           := 0.00;
  FDQryCad.FindField('PESSOA').AsInteger        := MM.varI_Code_pessoa_cheque;
  FDQryCad.FindField('NOME_PESSOA').AsString    := Acha_Item('PESSOAS',FDQryCad.FindField('PESSOA').AsString);
  FDQryCad.FindField('NUMERO_DOC').AsInteger    := MM.varI_Code_Numero_Documento;
  FDQryCad.FindField('DOCUMENTO_DOC').AsInteger := MM.varI_Code_Documento_Documento;
  FDQryCad.FindField('SERIE_DOC').AsString      := MM.varI_Code_documento_serie;
  FDQryCad.FindField('STATUS').AsString         := 'Aberto';

  UniButtonDbEdit1.SetFocus;
end;

procedure TfrmCADCHEQUESMOVIMENTO.Busca(empresa, numero, documento,pessoa: integer);
var
  sql : string;
    i : integer; Cmp:String;
begin
  sql := ' select * from cheques where empresa = ' + IntToStr(empresa)  +
         ' and                      numero_doc = ' + IntToStr(numero)   +
         ' and                   documento_doc = ' + IntToStr(documento)+
         ' order by parcela';

  FDQryFiltro.Close;
  FDQryFiltro.SQL.Text := sql;
  dm_rc.rc_OpenQuery(FDQryFiltro);

end;

function TfrmCADCHEQUESMOVIMENTO.CamposValidados: Boolean;
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
           FDQryCad.Fields[e].FocusControl ;
           result := false ;
        end
     Else
       result := true;

  finally
    Campos.Free;
  end;
end;

procedure TfrmCADCHEQUESMOVIMENTO.SetBut(Acao: TAcaoCrud);
var s:string ;
begin
  s := GetEnumName(TypeInfo(TAcaoCrud),integer(Acao));

  if acao in [tpIncluir,tpAlterar,tpExcluir] then
     begin
       btnNewReg.Visible        := false;
       UniBitBtnedit.Visible    := false;
       UniBitBtnexclui.Visible  := false;
       UniBitBtncancel.Visible  := true;
       UniBitBtnsave.Visible    := true;
     end
   else if acao in [tpListaVazia] then
      begin
        btnNewReg.Visible        := true;
        UniBitBtnedit.Visible    := false;
        UniBitBtnexclui.Visible  := false;
        UniBitBtncancel.Visible  := false;
        UniBitBtnsave.Visible    := false;
      end
    else if acao in [tpListacomRegistros] then
      begin
        btnNewReg.Visible        := true;
        UniBitBtnedit.Visible    := true;
        UniBitBtnexclui.Visible  := true;
        UniBitBtncancel.Visible  := false;
        UniBitBtnsave.Visible    := false;
       end;
end;

procedure TfrmCADCHEQUESMOVIMENTO.UniBitBtnsaveClick(Sender: TObject);
var
  I            : Integer;
  FoiInclusao  : Boolean;
  ValoresAntes : array of Variant;
begin
  if not (FDQryCad.State in [dsInsert, dsEdit]) then Exit;

  FoiInclusao := FDQryCad.State = dsInsert;
  SetLength(ValoresAntes, FDQryCad.FieldCount);
  for I := 0 to FDQryCad.FieldCount - 1 do
    ValoresAntes[I] := FDQryCad.Fields[I].Value;

  if not mm.FDTransaction.Active then
    mm.FDTransaction.StartTransaction;
  try
    if FDQryCad.State in [dsInsert] then
      begin
        FDQryCad.FindField('LOGINCLUSAO').AsString  := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);
        FDQryCad.FindField('CODIGO').AsInteger      := Ultimo_Codigo(FDQryCad.UpdateOptions.UpdateTableName,'CODIGO',True);
        FDQryCad.FindField('KEY').AsString          := Gera_Guid;
      end
    else
      FDQryCad.FindField('LOGALTERACAO').AsString   := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);

    FDQryCad.Post;

    mm.varI_ApplyUpdateErrors := FDQryCad.ApplyUpdates(-1);
    if mm.varI_ApplyUpdateErrors > 0 then
      raise Exception.Create('Falha ao gravar o cheque.');

    if mm.FDTransaction.Active then mm.FDTransaction.Commit;
    FDQryCad.CommitUpdates;

    if  FDQryFiltro.Active then
      FDQryFiltro.Refresh;

    if  FDQryFiltro.IsEmpty then
     SetBut(tpListaVazia)
    Else
     SetBut(tpListacomRegistros);

    dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Gravados com SUCESSO!' , 'success' );

    Busca(mm.varI_Code_Company,
          mm.varI_Code_Numero_Documento,
          mm.varI_Code_Documento_Documento,
          mm.varI_Code_pessoa_cheque);

  except
    on E: Exception do
    begin
      if mm.FDTransaction.Active then mm.FDTransaction.Rollback;
      FDQryCad.Cancel;
      FDQryCad.CancelUpdates;
      if FoiInclusao then FDQryCad.Insert else FDQryCad.Edit;
      for I := 0 to FDQryCad.FieldCount - 1 do
        if (FDQryCad.Fields[I].FieldKind = fkData) and
           not FDQryCad.Fields[I].ReadOnly then
          FDQryCad.Fields[I].Value := ValoresAntes[I];
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui gravar, chame o SUPORTE! ' + E.Message , 'error' );
    end;
  end;
end;

procedure TfrmCADCHEQUESMOVIMENTO.UniDBGridEntregaCellClick(
  Column: TUniDBGridColumn);
var i:integer; Cmp : string;

begin
  if FDQryFiltro.RecordCount > 0 then
    begin
      try
        FDQryCad.Close ;
        for i := 0 to  FDQryCad.Params.Count - 1 do
        begin
          Cmp                       :=  FDQryCad.Params[i].Name;
           FDQryCad.Params[i].Value :=  FDQryFiltro.FieldbyName(Cmp).Value;
        end;
         FDQryCad.Open;
      Except
         FDQryCad.Params[0].AsInteger := -1 ;
         FDQryCad.Open;
      End;
    end;
end;

procedure TfrmCADCHEQUESMOVIMENTO.UniFormCreate(Sender: TObject);
begin
  cFormModal := mm.varC_Form_Modal;
end;

procedure TfrmCADCHEQUESMOVIMENTO.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TfrmCADCHEQUESMOVIMENTO.UniFormBeforeShow(Sender: TObject);
begin
  //[PT] padrao oficial RADCore 8.0 p/ FORMS modais (doc LayoutRender): render no BEFORE SHOW
  rc_RenderLayout( Self, true, true, true );
end;

procedure TfrmCADCHEQUESMOVIMENTO.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
  dm_rc.rc_ResizeBlocks( Self, true, true ); //fiel a 3.0
end;

procedure TfrmCADCHEQUESMOVIMENTO.UniFormShow(Sender: TObject);
begin
  Busca(mm.varI_Code_Company,
        mm.varI_Code_Numero_Documento,
        mm.varI_Code_Documento_Documento,
        mm.varI_Code_pessoa_cheque);

  if FDQryFiltro.RecordCount > 0 then
    SetBut(tpListacomRegistros)
  else
    SetBut(tpListaVazia);
end;

procedure TfrmCADCHEQUESMOVIMENTO.UniBitBtncancelClick(Sender: TObject);
begin
  FDQryCad.Cancel;
  FDQryCad.CancelUpdates;

  if  FDQryFiltro.IsEmpty then
      SetBut(tpListaVazia)
  else
      SetBut(tpListacomRegistros);
end;

procedure TfrmCADCHEQUESMOVIMENTO.UniBitBtneditClick(Sender: TObject);
begin
  if FDQryFiltro.FindField('STATUS').AsString = 'Compensado' then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NÃO PODE ALTERAR UM CHEQUE COMPENSADO!' , 'error' );
      abort;
    end;
  SetBut(tpAlterar);
  FDQryCad.Edit;
end;

procedure TfrmCADCHEQUESMOVIMENTO.UniBitBtnexcluiClick(Sender: TObject);
var i : integer; Cmp:String;
begin
  dm_rc.rc_ShowYesNo( 'DESEJA REALMENTE EXCLUIR ESSE CHEQUE?' );
  if not mm.varB_Yes then Exit;

  if not mm.FDTransaction.Active then
    mm.FDTransaction.StartTransaction;
  try
    FDQryCad.Delete;

    mm.varI_ApplyUpdateErrors := FDQryCad.ApplyUpdates(-1);
    if mm.varI_ApplyUpdateErrors > 0 then
      raise Exception.Create('Falha ao excluir o cheque.');

    if mm.FDTransaction.Active then mm.FDTransaction.Commit;
    FDQryCad.CommitUpdates;
  except
    on E: Exception do
    begin
      if mm.FDTransaction.Active then mm.FDTransaction.Rollback;
      FDQryCad.CancelUpdates;
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui excluir, chame o SUPORTE! ' + E.Message , 'error' );
      Exit;
    end;
  end;

  Try
     FDQryCad.Close;

    for i := 0 to  FDQryCad.Params.Count - 1 do
    begin
      Cmp :=  FDQryCad.Params[i].Name;
       FDQryCad.Params[i].Value :=  FDQryFiltro.FieldByName(Cmp).Value ;
    end;
     FDQryCad.Open;
  Except
    abort;
  End;

  if  FDQryFiltro.Active then
    FDQryFiltro.Refresh;

  if  FDQryFiltro.IsEmpty then
   SetBut(tpListaVazia)
  Else
   SetBut(tpListacomRegistros);
end;

end.

