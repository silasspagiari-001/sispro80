unit untFrmPesquisaloteinterno;

//8.0.0.0 - conversao RadCORE 3.0 -> 8.0 (TUniForm -> modal 8.0 TfrmGenericModalForm)
// - Picker de LOTEINTERNO (chamadores 3.0: PRODUCAOINTERNA, MOVIMENTOMESTRE,
//   MANUTENCAOLOTE_INTERNO, ENTREGALOTE): DblClick no grid grava
//   mm.varC_codigo_busca_lote + ModalResult mrOK; caller entao chama
//   BuscaLoteinterno/carregalote/carregaloteProducao.
// - Receita modal 8.0 (padrao CUSTOPRODUCAO homologado): class(TfrmGenericModalForm)
//   + Hint '[[modal:]]' + bsSingle; centralizacao da 3.0 (OnReady) fica por conta da
//   base/poScreenCenter (regra 40b); OnReady vazio e nao ligado no dfm.
// - CONTEUDO DENTRO DE UniScrollBox1 (regra 43c): UniScrollBox1 > UniContainerPanel14
//   > rcBlocks de filtro + grid; labTotReg fixo alBottom SEM hint (regra 43a).
// - rcBlocks RENUMERADOS em ordem visual, passo 10 (regras 39/43a): 10=Conteudo,
//   20=Busca Por, 30=Estoque, 40=Status (era UniContainerPanel1), 50=Tipo (era
//   UniContainerPanel2), 60=botao buscar (era rcBlock40), 70=grid (era rcBlock50).
//   Container com hint cols => nome rcBlock<N>.
// - Animacoes slide 3.0 PRESERVADAS (mkm_anim.rc_MoveAnimationForm - existe na 8.0:
//   untFrmPesquisaItensestoque/untfrmImpressaoFinanceiro ja usam): entra deslizando
//   do topo no OnShow; sai por cima no DblClick (timerClose 700ms RunOnce mantido).
// - Badges do TIPO -> regra 41b: badge badge-* -> badge text-bg-*.
// - cFormModal/cMSG_* removidos (atribuidos e nunca lidos - mesmo criterio aplicado
//   no CUSTOPRODUCAO homologado). Presets varBPI_TIPOBUSCA ('BPA') e
//   varCD_PRODUTOENTREGA (auto-busca por Cod. Prod) preservados - vars confirmadas
//   no MainModule 8.0 (l.654/655/869).
// - Filtro dinamico sobre LOTEINTERNO via dm_rc.sqlPesquisa (dm_rc l.89) ->
//   tblote (TFDMemTable, 10 fields). Itens "stale" dos combos no dfm sao
//   intencionais (reconstruidos no UniFormCreate, como na 3.0). Opcoes do
//   "Busca Por" = CODIGO/LOTE/PRODUTO/DESCRICAO (Explode de mkm_funcoes, ja usada
//   nos converts MOVIMENTOMESTRE/NOTAELETRONICA).

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, uniGUIBaseClasses, uniTimer, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniButton, uniBitBtn, uniMultiItem, uniComboBox, uniEdit,
  uniLabel, uniBasicGrid, uniDBGrid, uniPanel, uniScrollBox,
  untGenericModalForm;

type
  TFrmPesquisaloteinterno = class(TfrmGenericModalForm)
    tblote: TFDMemTable;
    dslote: TDataSource;
    timerClose: TUniTimer;
    UniScrollBox1: TUniScrollBox;
    UniContainerPanel14: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    UniLabelv1: TUniLabel;
    edSearchCRUDconteudo: TUniEdit;
    rcBlock20: TUniContainerPanel;
    UniLabel1: TUniLabel;
    cbxSearchCRUDFieldordem: TUniComboBox;
    rcBlock30: TUniContainerPanel;
    UniLabel2: TUniLabel;
    UniComboBoxestoque: TUniComboBox;
    rcBlock40: TUniContainerPanel;
    UniLabel3: TUniLabel;
    UniComboBoxstatus: TUniComboBox;
    rcBlock50: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniComboBoxtipo: TUniComboBox;
    rcBlock60: TUniContainerPanel;
    btnLkpSearch: TUniBitBtn;
    rcBlock70: TUniContainerPanel;
    UniDBGridLOTE: TUniDBGrid;
    labTotReg: TUniLabel;
    tbloteLOTE: TStringField;
    tbloteCODIGO: TIntegerField;
    tblotePRODUTO: TIntegerField;
    tbloteDESCRICAO: TStringField;
    tblotePUREZA: TFloatField;
    tbloteDISPONIVEL: TFloatField;
    tbloteTOTALPONTOS: TFloatField;
    tbloteBARRACAO: TStringField;
    tbloteTIPO: TStringField;
    tbloteCODIGOP: TStringField;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure btnLkpSearchClick(Sender: TObject);
    procedure UniDBGridLOTEDblClick(Sender: TObject);
    procedure tbloteTIPOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FrmPesquisaloteinterno: TFrmPesquisaloteinterno;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, mkm_anim, mkm_funcoes, mkm_func_web;
var
  M_STR   : TStringList;

function FrmPesquisaloteinterno: TFrmPesquisaloteinterno;
begin
  Result := TFrmPesquisaloteinterno(mm.GetFormInstance(TFrmPesquisaloteinterno));
end;

procedure TFrmPesquisaloteinterno.btnLkpSearchClick(Sender: TObject);
var
  M_SQL, M_ESTOQUE,M_ATIVO, M_TIPO : string;
begin
  M_STR  := Explode('CODIGO;LOTE;PRODUTO;DESCRICAO',';');
  M_TIPO := ' AND TIPO = ' + QuotedStr(UniComboBoxtipo.Text);

  case UniComboBoxstatus.ItemIndex of
    0 : M_ATIVO := ' AND ATIVO = ' + QuotedStr('T');
    1 : M_ATIVO := ' AND ATIVO = ' + QuotedStr('F');
    2 : M_ATIVO := '';
  end;

  case UniComboBoxestoque.ItemIndex of
    0: M_ESTOQUE := ' AND DISPONIVEL > 0 ';  //positivo
    1: M_ESTOQUE := ' AND DISPONIVEL < 0 ';  //negativo
    2: M_ESTOQUE := ' AND DISPONIVEL = 0 ';  //zerado
    3: M_ESTOQUE := '';                      //todos
  end;


  M_SQL:=' SELECT                              ' +
         ' *                                   ' +
         ' FROM                                ' + 'LOTEINTERNO'                              +
         ' WHERE                               ' + M_STR[cbxSearchCRUDFieldordem.ItemIndex]   +
         ' like                                ' + QuotedStr('%'+edSearchCRUDconteudo.Text+'%')       +  M_ESTOQUE + M_TIPO +  M_ATIVO +
         ' ORDER BY                            ' + M_STR[cbxSearchCRUDFieldordem.ItemIndex];


  dm_rc.sqlPesquisa.Close;
  dm_rc.sqlPesquisa.SQL.Clear;
  dm_rc.sqlPesquisa.sql.add(M_SQL);
  dm_rc.sqlPesquisa.Open;

  tblote.Close;
  tblote.Open;
  if dm_rc.sqlpesquisa.RecordCount > 0 then
    begin
      dm_rc.sqlpesquisa.First;
      while not dm_rc.sqlpesquisa.Eof do
        begin
          tblote.Append;
          tbloteCODIGO.AsInteger      := dm_rc.sqlpesquisa.FindField('CODIGO').AsInteger;
          tbloteTIPO.AsString         := dm_rc.sqlpesquisa.FindField('TIPO').AsString;
          tblotePRODUTO.AsInteger     := dm_rc.sqlpesquisa.FindField('PRODUTO').AsInteger;
          tbloteLOTE.AsString         := dm_rc.sqlpesquisa.FindField('LOTE').AsString;
          tbloteBARRACAO.AsString     := dm_rc.sqlpesquisa.FindField('BARRACAO').AsString;
          tbloteDESCRICAO.AsString    := dm_rc.sqlpesquisa.FindField('DESCRICAO').AsString;
          tbloteDISPONIVEL.AsFloat    := dm_rc.sqlpesquisa.FindField('DISPONIVEL').AsFloat;
          tbloteTOTALPONTOS.AsFloat   := dm_rc.sqlpesquisa.FindField('TOTALPONTOS').AsFloat;
          tbloteCODIGOP.AsString      := dm_rc.sqlpesquisa.FindField('CODIGOP').AsString;
          tblote.Post;

          dm_rc.sqlpesquisa.Next;
        end;
      tblote.First;
    end;

  labTotReg.Caption := IntToStr(dm_rc.sqlpesquisa.RecordCount) + ' Registro(s) Encontrado(s).'
end;

procedure TFrmPesquisaloteinterno.tbloteTIPOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if DisplayText then
    begin
      if tbloteTIPO.AsString = 'Produto Acabado' then
        Text := '<span class="badge text-bg-success">'+tbloteTIPO.AsString+'</span>'
      else
      if tbloteTIPO.AsString = 'Sementes' then
        Text := '<span class="badge text-bg-warning">'+tbloteTIPO.AsString+'</span>'
      else
      if tbloteTIPO.AsString = 'Insumos' then
        Text := '<span class="badge text-bg-info">'+tbloteTIPO.AsString+'</span>'
      else
      if tbloteTIPO.AsString = 'Sacaria' then
        Text := '<span class="badge text-bg-dark">'+tbloteTIPO.AsString+'</span>'
    end;
end;

procedure TFrmPesquisaloteinterno.UniDBGridLOTEDblClick(Sender: TObject);
begin
  mm.varC_codigo_busca_lote := tblote.FindField('CODIGO').AsString;

  ModalResult := mrOK;

  dm_rc.sqlpesquisa.Close;
  timerClose.Enabled := true;
  rc_MoveAnimationForm( self,
                       self.left,
                       self.left,
                       self.top,
                       -self.Height,
                       400,
                       0 ) ;
end;

procedure TFrmPesquisaloteinterno.UniFormCreate(Sender: TObject);
begin
  cbxSearchCRUDFieldordem.Clear;
  cbxSearchCRUDFieldordem.Items.Add('Codigo');
  cbxSearchCRUDFieldordem.Items.Add('Lote');
  cbxSearchCRUDFieldordem.Items.Add('Cod. Prod');
  cbxSearchCRUDFieldordem.Items.Add('Descrição');
  cbxSearchCRUDFieldordem.ItemIndex := 1;

  UniComboBoxestoque.Clear;
  UniComboBoxestoque.Items.Add('Positivo');
  UniComboBoxestoque.Items.Add('Negativo');
  UniComboBoxestoque.Items.Add('Zerado');
  UniComboBoxestoque.Items.Add('Todos');
  UniComboBoxestoque.ItemIndex := 3;

  UniComboBoxstatus.Clear;
  UniComboBoxstatus.Items.Add('Ativo');
  UniComboBoxstatus.Items.Add('Inativo');
  UniComboBoxstatus.Items.Add('Todos');
  UniComboBoxstatus.ItemIndex := 0;

  UniComboBoxtipo.Clear;
  UniComboBoxtipo.Items.Add('Produto Acabado');
  UniComboBoxtipo.Items.Add('Sementes');
  UniComboBoxtipo.Items.Add('Insumos');
  UniComboBoxtipo.Items.Add('Sacaria');

  if MM.varBPI_TIPOBUSCA = 'BPA' then
    UniComboBoxtipo.ItemIndex := 0
  else
    UniComboBoxtipo.ItemIndex := 1;

  if mm.varCD_PRODUTOENTREGA <> 0 then
    begin
      cbxSearchCRUDFieldordem.ItemIndex := 2;
      edSearchCRUDconteudo.Text         := IntToStr(mm.varCD_PRODUTOENTREGA);
      btnLkpSearch.OnClick(self);
    end;


end;

procedure TFrmPesquisaloteinterno.UniFormDestroy(Sender: TObject);
begin
  dm_rc.sqlPesquisa.Close;
  mm.varC_Form_Modal := nil;
end;

procedure TFrmPesquisaloteinterno.UniFormReady(Sender: TObject);
begin
  // reservado p/ ajuste fino de geometria (padrao modal RC)
end;

//8.0.0.0 sem Constraints (regra 40b)
procedure TFrmPesquisaloteinterno.UniFormResize(Sender: TObject);
begin
  FrmPesquisaloteinterno.Height   := 517;
  FrmPesquisaloteinterno.Width    := 722;
  FrmPesquisaloteinterno.Position := poScreenCenter;
end;

procedure TFrmPesquisaloteinterno.UniFormShow(Sender: TObject);
begin
  if Self.Tag = 0 then
  begin
      Self.Visible := True;
      Self.Top  := 0;

      rc_MoveAnimationForm( self,
                            self.left,
                            self.left,
                            self.top,
                            ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  ),
                            400,
                            1 ) ;
  end
  else
  begin
    Self.Visible := False;
    Self.Top  := -1000;
  end;
  Self.Visible := True;
end;

end.
