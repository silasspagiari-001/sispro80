unit untFrmFICHAANALISTA;

//8.0.0.0 - conversao RadCORE 3.0 -> 8.0 (frameBASE -> modal 8.0)
// - TfrmFICHAANALISTA (Ficha de Analise, tabela SEMENTES_ANALISTA por :MESTRE_ID).
// - Receita modal 8.0 (a 3.0 nao tinha o Hint): Hint '[[modal:]]' + BorderStyle
//   bsSingle + rc_RenderLayout(Self,false,false,false) no OnCreate e (Self,true,true)
//   no BeforeShow; mm.varC_Form_Modal := nil no OnDestroy (padrao DETALHESBENEFICIAMENTO).
// - Lookups FUNCIONARIOS: UniButtonDbEditanalistai/ii/iii (Seta_Busca/UniFfrmPesquisa)
//   -> edLkpFUNCIONARIOS__I/II/III declarativos (convencao do dev: nome do controle =
//   tabela + '__qualificador', cf. edLkpCIDADES__ENTREGA) + OnExit gravando
//   ANALISTA_I/II/III via rc_GetLookUpField (padrao LOTEINTERNO/ESPECIE).
// - MediaGeral e os 3 OnExit de PESO_MEDIA_* preservados.
// - rc_ShowSweetAlert 4 -> 3 params (btnSaveReg).
// - PRESERVADO de proposito (bug 3.0): HabilitaCombobox casta TUniDBEdit para
//   TUniDBComboBox (no-op neste form: nao ha DBComboBox).
// - Impressao: mkm_impressao (IMPRESSAO_FichaSemente) + unReportImpressao -
//   unidades do projeto, manter na 8.0.

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniGUIBaseClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Menus, uniMainMenu, uniDBEdit,
  uniDateTimePicker, uniDBDateTimePicker, uniLabel, uniEdit, uniMemo, uniDBMemo,
  uniCheckBox, uniDBCheckBox;

type
  TAcaoCrud = (tpIncluir, tpAlterar, tpExcluir, tpListaVazia,tpListacomRegistros);
  TfrmFICHAANALISTA = class(TUniForm)
    paBaseButtons: TUniContainerPanel;
    paOF: TUniContainerPanel;
    btnCloseForm: TUniBitBtn;
    paP: TUniContainerPanel;
    paNAE: TUniContainerPanel;
    btnEditReg: TUniBitBtn;
    btnDeleteReg: TUniBitBtn;
    paGC: TUniContainerPanel;
    btnSaveReg: TUniBitBtn;
    btnCancelReg: TUniBitBtn;
    btnOptions: TUniBitBtn;
    UniPageControl: TUniPageControl;
    UniTabSheetFICHA: TUniTabSheet;
    UniPopupMenuImpressao: TUniPopupMenu;
    EntregadosItenss1: TUniMenuItem;
    N13: TUniMenuItem;
    dsfiltro: TDataSource;
    FDQryFiltro: TFDQuery;
    dscrud: TDataSource;
    FDQryCad: TFDQuery;
    UniContainerPanel1: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    UniContainerPanel5: TUniContainerPanel;
    UniContainerPanel6: TUniContainerPanel;
    UniContainerPanel7: TUniContainerPanel;
    UniContainerPanel8: TUniContainerPanel;
    UniContainerPanel9: TUniContainerPanel;
    UniContainerPanel10: TUniContainerPanel;
    UniContainerPanel11: TUniContainerPanel;
    UniContainerPanel12: TUniContainerPanel;
    UniContainerPanel13: TUniContainerPanel;
    UniContainerPanel14: TUniContainerPanel;
    UniContainerPanel15: TUniContainerPanel;
    UniContainerPanel16: TUniContainerPanel;
    UniContainerPanel17: TUniContainerPanel;
    UniContainerPanel18: TUniContainerPanel;
    UniContainerPanel19: TUniContainerPanel;
    UniContainerPanel20: TUniContainerPanel;
    UniEditlote: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;
    UniLabel7: TUniLabel;
    UniLabel14: TUniLabel;
    edLkpFUNCIONARIOS__I: TUniDBEdit;
    UniLabel8: TUniLabel;
    UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit;
    UniLabel9: TUniLabel;
    UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit;
    UniLabel10: TUniLabel;
    edLkpFUNCIONARIOS__II: TUniDBEdit;
    UniLabel11: TUniLabel;
    UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit;
    UniLabel12: TUniLabel;
    UniLabel13: TUniLabel;
    UniLabel15: TUniLabel;
    edLkpFUNCIONARIOS__III: TUniDBEdit;
    UniLabel16: TUniLabel;
    UniDBFormattedNumberEdit10: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit11: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit12: TUniDBFormattedNumberEdit;
    UniLabel17: TUniLabel;
    UniLabel18: TUniLabel;
    UniLabel19: TUniLabel;
    UniDBMemoobs: TUniDBMemo;
    rcBlock20: TUniContainerPanel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniDBCheckBox2: TUniDBCheckBox;
    UniDBCheckBox3: TUniDBCheckBox;
    UniDBCheckBox4: TUniDBCheckBox;
    UniContainerPanel21: TUniContainerPanel;
    UniLabel20: TUniLabel;
    UniDBFormattedNumberEdit13: TUniDBFormattedNumberEdit;
    UniContainerPanel22: TUniContainerPanel;
    UniLabel21: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniDBEdit2: TUniDBEdit;
    UniContainerPanel23: TUniContainerPanel;
    UniLabel22: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    procedure UniFormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure btnCloseFormClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure UniDBFormattedNumberEdit5Exit(Sender: TObject);
    procedure UniDBFormattedNumberEdit8Exit(Sender: TObject);
    procedure UniDBFormattedNumberEdit11Exit(Sender: TObject);
    procedure edLkpFUNCIONARIOS__IExit(Sender: TObject);
    procedure edLkpFUNCIONARIOS__IIExit(Sender: TObject);
    procedure edLkpFUNCIONARIOS__IIIExit(Sender: TObject);
    procedure EntregadosItenss1Click(Sender: TObject);
  private
    { Private declarations }
  status:string;
  public
    { Public declarations }
  procedure SetBut(Acao: TAcaoCrud);
  procedure HabilitaCombobox(status:boolean);
  procedure MediaGeral();

  end;

function frmFICHAANALISTA: TfrmFICHAANALISTA;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, System.TypInfo, uniDBComboBox,
  untDM_RC, mkm_layout, mkm_procedures, mkm_funcoes, mkm_impressao,
  unReportImpressao;

function frmFICHAANALISTA: TfrmFICHAANALISTA;
begin
  Result := TfrmFICHAANALISTA(mm.GetFormInstance(TfrmFICHAANALISTA));
end;

{ TfrmFICHAANALISTA }

//8.0.0.0 receita modal (padrao DETALHESBENEFICIAMENTO)
procedure TfrmFICHAANALISTA.UniFormCreate(Sender: TObject);
begin
  rc_RenderLayout( Self, false, false, false );
end;

procedure TfrmFICHAANALISTA.UniFormBeforeShow(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true );
end;

procedure TfrmFICHAANALISTA.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
  FDQryCad.Close;
  FDQryFiltro.Close;
end;

procedure TfrmFICHAANALISTA.edLkpFUNCIONARIOS__IExit(Sender: TObject);
begin
  //8.0.0.0 lookup declarativo FUNCIONARIOS (substitui Seta_Busca/UniFfrmPesquisa)
  if ( FDQryCad.State in [dsEdit, dsInsert] ) and
     ( edLkpFUNCIONARIOS__I.Text <> '' ) and ( edLkpFUNCIONARIOS__I.Text <> '0' ) then
    FDQryCad.FieldByName('ANALISTA_I').AsInteger := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'CODIGO' );
end;

procedure TfrmFICHAANALISTA.edLkpFUNCIONARIOS__IIExit(Sender: TObject);
begin
  //8.0.0.0 lookup declarativo FUNCIONARIOS (substitui Seta_Busca/UniFfrmPesquisa)
  if ( FDQryCad.State in [dsEdit, dsInsert] ) and
     ( edLkpFUNCIONARIOS__II.Text <> '' ) and ( edLkpFUNCIONARIOS__II.Text <> '0' ) then
    FDQryCad.FieldByName('ANALISTA_II').AsInteger := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'CODIGO' );
end;

procedure TfrmFICHAANALISTA.edLkpFUNCIONARIOS__IIIExit(Sender: TObject);
begin
  //8.0.0.0 lookup declarativo FUNCIONARIOS (substitui Seta_Busca/UniFfrmPesquisa)
  if ( FDQryCad.State in [dsEdit, dsInsert] ) and
     ( edLkpFUNCIONARIOS__III.Text <> '' ) and ( edLkpFUNCIONARIOS__III.Text <> '0' ) then
    FDQryCad.FieldByName('ANALISTA_III').AsInteger := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'CODIGO' );
end;

procedure TfrmFICHAANALISTA.btnCancelRegClick(Sender: TObject);
begin
  FDQryCad.Cancel ;

  HabilitaCombobox(True);
  SetBut(tpListacomRegistros);
end;

procedure TfrmFICHAANALISTA.btnCloseFormClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmFICHAANALISTA.btnDeleteRegClick(Sender: TObject);
begin
  FDQryCad.Delete;
  HabilitaCombobox(True);
end;

procedure TfrmFICHAANALISTA.btnEditRegClick(Sender: TObject);
var
  i : integer; Cmp:String;
begin

  if FDQryFiltro.RecordCount > 0 then
    status := 'altera'
  else
    status := 'inclui';

  try
    FDQryCad.Close ;
    for i := 0 to  FDQryCad.Params.Count - 1 do
    begin
      Cmp :=  FDQryCad.Params[i].Name;
       FDQryCad.Params[i].Value :=  FDQryFiltro.FieldbyName(Cmp).Value;
    end;
     FDQryCad.Open;
  Except
     FDQryCad.Params[0].AsInteger := -1 ;
     FDQryCad.Open;
  End;

  if status = 'inclui' then
    begin
      FDQryCad.Append;
      FDQryCad.FindField('MESTRE_ID').AsInteger    := mm.varM_CODIGOMESTRE;
      FDQryCad.FindField('EMPRESA').AsInteger      := MM.varI_Code_Company;

      FDQryCad.FindField('ANALISTA_I').AsInteger   := 0;
      FDQryCad.FindField('ANALISTA_II').AsInteger  := 0;
      FDQryCad.FindField('ANALISTA_III').AsFloat   := 0;

      FDQryCad.FindField('PESO_INI_I').AsFloat     := 0;
      FDQryCad.FindField('PESO_INI_II').AsFloat    := 0;
      FDQryCad.FindField('PESO_INI_III').AsFloat   := 0;

      FDQryCad.FindField('PESO_FIN_I').AsFloat     := 0;
      FDQryCad.FindField('PESO_FIN_II').AsFloat    := 0;
      FDQryCad.FindField('PESO_FIN_III').AsFloat   := 0;

      FDQryCad.FindField('PESO_MEDIA_I').AsFloat   := 0;
      FDQryCad.FindField('PESO_MEDIA_II').AsFloat  := 0;
      FDQryCad.FindField('PESO_MEDIA_III').AsFloat := 0;

      dm_rc.sqlBuscas.Close;
    end
  else
    FDQryCad.Edit;

  HabilitaCombobox(False);
  SetBut(tpAlterar);
end;

procedure TfrmFICHAANALISTA.btnOptionsClick(Sender: TObject);
begin
  UniPopupMenuImpressao.PopupBy( TUniButton( sender ) );
end;

procedure TfrmFICHAANALISTA.btnSaveRegClick(Sender: TObject);
begin
  if FDQryCad.State in [dsInsert] then
   begin
     FDQryCad.FindField('KEY').AsString          := Gera_Guid;
     FDQryCad.FindField('CODIGO').AsInteger      := Ultimo_Codigo('SEMENTES_ANALISTA','CODIGO',True);
   end;

  try
    FDQryCad.Post;
    HabilitaCombobox(True);
    SetBut(tpListacomRegistros);
    dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Gravados com SUCESSO!' , 'success' );
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui gravar, chame o SUPORTE!' , 'error' );
  end;
end;

procedure TfrmFICHAANALISTA.EntregadosItenss1Click(Sender: TObject);
begin
  mm.varC_caminhopdf :=  IMPRESSAO_FichaSemente(mm.varI_Code_Company,
                                                mm.varM_CODIGOMESTRE);

  unfImpressao.ShowModal();
end;

procedure TfrmFICHAANALISTA.HabilitaCombobox(status: boolean);
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

procedure TfrmFICHAANALISTA.MediaGeral;
var
  m_total : Real;
begin
  m_total := FDQryCad.FindField('PESO_MEDIA_I').AsFloat  +
             FDQryCad.FindField('PESO_MEDIA_II').AsFloat +
             FDQryCad.FindField('PESO_MEDIA_III').AsFloat;

  if FDQryCad.FindField('PESO_MEDIA_II').AsFloat > 0 then
    FDQryCad.FindField('MEDIA_GERAL').AsFloat := m_total / 2
  else
  if FDQryCad.FindField('PESO_MEDIA_III').AsFloat > 0 then
    FDQryCad.FindField('MEDIA_GERAL').AsFloat := m_total / 3
  else
    FDQryCad.FindField('MEDIA_GERAL').AsFloat := m_total;
end;

procedure TfrmFICHAANALISTA.SetBut(Acao: TAcaoCrud);
var s:string ;
begin
  s := GetEnumName(TypeInfo(TAcaoCrud),integer(Acao));

  // Controle dos botoes
  if acao in [tpIncluir,tpAlterar,tpExcluir] then
   begin
     btnEditReg.Visible    := false;
     btnDeleteReg.Visible  := false;
     btnCancelReg.Visible  := true;
     btnSaveReg.Visible    := true;
     btnOptions.Visible    := False;
   end
  else if acao in [tpListacomRegistros] then
    begin
      btnEditReg.Visible    := true;
      btnDeleteReg.Visible  := true;
      btnCancelReg.Visible  := false;
      btnSaveReg.Visible    := false;
      btnOptions.Visible    := true;
    end;
end;

procedure TfrmFICHAANALISTA.UniDBFormattedNumberEdit11Exit(Sender: TObject);
begin
  FDQryCad.FindField('PESO_MEDIA_III').AsFloat := (FDQryCad.FindField('PESO_FIN_III').AsFloat / FDQryCad.FindField('PESO_INI_III').AsFloat)  * 100;
  MediaGeral();

end;

procedure TfrmFICHAANALISTA.UniDBFormattedNumberEdit5Exit(Sender: TObject);
begin
  FDQryCad.FindField('PESO_MEDIA_I').AsFloat := (FDQryCad.FindField('PESO_FIN_I').AsFloat / FDQryCad.FindField('PESO_INI_I').AsFloat)  * 100;
  MediaGeral();
end;

procedure TfrmFICHAANALISTA.UniDBFormattedNumberEdit8Exit(Sender: TObject);
begin
  FDQryCad.FindField('PESO_MEDIA_II').AsFloat := (FDQryCad.FindField('PESO_FIN_II').AsFloat / FDQryCad.FindField('PESO_INI_II').AsFloat)  * 100;
  MediaGeral();

end;

procedure TfrmFICHAANALISTA.UniFormReady(Sender: TObject);
begin
  //8.0.0.0 rc_ResizeBlocks nao se aplica ao motor novo (padrao DETALHESBENEFICIAMENTO:
  // OnReady vazio); centralizacao garantida pelo poScreenCenter
end;

procedure TfrmFICHAANALISTA.UniFormResize(Sender: TObject);
begin
  //8.0.0.0 modal maior (blocos mais altos no motor novo) e SEM os Constraints
  // fixos da 3.0 - eles cortavam o layout re-fluido e escondiam o paBaseButtons
  frmFICHAANALISTA.Height   := 560;
  frmFICHAANALISTA.Width    := 820;
  frmFICHAANALISTA.Position := poScreenCenter;
end;

procedure TfrmFICHAANALISTA.UniFormShow(Sender: TObject);
  var i : integer; Cmp:String;
begin
  UniEditlote.Text    :=  '';

  FDQryFiltro.Close;
  FDQryFiltro.SQL.Clear;
  FDQryFiltro.SQL.Text := 'select * from SEMENTES_ANALISTA where mestre_id = ' + IntToStr(mm.varM_CODIGOMESTRE);
  FDQryFiltro.Open();

  try
    FDQryCad.Close ;
    for i := 0 to FDQryCad.Params.Count - 1 do
    begin
      Cmp                       :=  FDQryCad.Params[i].Name;
       FDQryCad.Params[i].Value :=  FDQryFiltro.FieldbyName(Cmp).Value;
    end;
     FDQryCad.Open;
  Except
     FDQryCad.Params[0].AsInteger := -1 ;
     FDQryCad.Open;
  End;

  SqlPesquisa('select * from LOTEINTERNO where codigo = '+IntToStr(mm.varM_CODIGOMESTRE));
  UniEditlote.Text    :=  dm_rc.sqlBuscas.FindField('LOTE').AsString;

  SetBut(tpListacomRegistros);
  HabilitaCombobox(True);
end;

end.
