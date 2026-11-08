unit untFrmFICHA;

//8.0.0.0 - conversao RadCORE 3.0 -> 8.0 (frameBASE -> modal 8.0)
// - TfrmFICHA (Ficha Tecnica de Controle de Estoque, tabela FICHA por :MESTRE_ID).
// - Receita modal 8.0: Hint '[[modal:]]' (ja existia na 3.0) + BorderStyle bsSingle +
//   rc_RenderLayout(Self,false,false,false) no OnCreate e (Self,true,true) no
//   BeforeShow; mm.varC_Form_Modal := nil no OnDestroy; OnReady mantem centralizacao
//   + rc_ResizeBlocks (padrao DETALHESBENEFICIAMENTO/CHEQUEMOVIMENTO).
// - Lookup PESSOAS: UniButtonDbEdit1 (Seta_Busca/UniFfrmPesquisa) -> edLkpPESSOAS
//   declarativo (hint NOME CODIGO; nome do controle = tabela lookup) + OnExit
//   gravando PESSOA e NOME_PESSOA via rc_GetLookUpField (padrao LOTEINTERNO/ESPECIE).
// - rc_ShowSweetAlert 4 -> 3 params (btnSaveReg).
// - PRESERVADO de proposito (bug 3.0, precedente MANIFESTO): HabilitaCombobox
//   casta TUniDBEdit(Components[i]) para TUniDBComboBox.
// - Impressao: mkm_impressao (IMPRESSAO_FichaControle/FichaBatida) +
//   unReportImpressao (unfImpressao) sao unidades do projeto - manter na 8.0.

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel,
  uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,uniHTMLFrame, uniEdit, uniDateTimePicker,
  uniDBDateTimePicker, uniLabel, uniDBEdit, uniMultiItem, uniComboBox,
  uniDBComboBox, Vcl.Menus, uniMainMenu;

type
  TAcaoCrud = (tpIncluir, tpAlterar, tpExcluir, tpListaVazia,tpListacomRegistros);

  TfrmFICHA = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    UniPageControl: TUniPageControl;
    UniTabSheetFICHA: TUniTabSheet;
    rcBlock2: TUniContainerPanel;
    dsfiltro: TDataSource;
    FDQryFiltro: TFDQuery;
    dscrud: TDataSource;
    FDQryCad: TFDQuery;
    rcBlock20: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    rcBlock30: TUniContainerPanel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    UniLabel14: TUniLabel;
    rcBlock40: TUniContainerPanel;
    UniLabel2: TUniLabel;
    rcBlock50: TUniContainerPanel;
    UniLabel8: TUniLabel;
    edLkpPESSOAS: TUniDBEdit;
    rcBlock60: TUniContainerPanel;
    UniLabel9: TUniLabel;
    rcBlock70: TUniContainerPanel;
    UniLabel4: TUniLabel;
    rcBlock80: TUniContainerPanel;
    UniLabel5: TUniLabel;
    rcBlock90: TUniContainerPanel;
    UniLabel6: TUniLabel;
    rcBlock100: TUniContainerPanel;
    UniLabel7: TUniLabel;
    rcBlock110: TUniContainerPanel;
    UniLabel10: TUniLabel;
    rcBlock130: TUniContainerPanel;
    UniLabel12: TUniLabel;
    rcBlock140: TUniContainerPanel;
    UniLabel13: TUniLabel;
    rcBlock150: TUniContainerPanel;
    UniLabel15: TUniLabel;
    rcBlock160: TUniContainerPanel;
    UniLabel16: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    rcBlock120: TUniContainerPanel;
    UniLabel11: TUniLabel;
    UniDBEdit19: TUniDBEdit;
    UniDBEdit1: TUniDBEdit;
    UniDBEdit2: TUniDBEdit;
    UniDBEdit3: TUniDBEdit;
    UniDBEdit4: TUniDBEdit;
    UniDBEdit5: TUniDBEdit;
    UniDBEdit6: TUniDBEdit;
    UniDBComboBoxcategoria: TUniDBComboBox;
    UniDBEdit7: TUniDBEdit;
    UniDBEdit8: TUniDBEdit;
    UniDBComboBox1: TUniDBComboBox;
    UniPopupMenuImpressao: TUniPopupMenu;
    EntregadosItenss1: TUniMenuItem;
    N13: TUniMenuItem;
    I1: TUniMenuItem;
    paFooter: TUniContainerPanel;
    btnEditReg: TUniBitBtn;
    btnDeleteReg: TUniBitBtn;
    btnCancelReg: TUniBitBtn;
    btnSaveReg: TUniBitBtn;
    btnOptions: TUniBitBtn;
    btnCloseForm: TUniBitBtn;
    rcBlock180: TUniContainerPanel;
    UniLabel1: TUniLabel;
    rcBlock190: TUniContainerPanel;
    UniLabel20: TUniLabel;
    rcBlock200: TUniContainerPanel;
    UniLabel17: TUniLabel;
    rcBlock210: TUniContainerPanel;
    UniLabel18: TUniLabel;
    UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit;
    rcBlock220: TUniContainerPanel;
    UniLabel19: TUniLabel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    rcBlock230: TUniContainerPanel;
    UniLabel21: TUniLabel;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    rcBlock240: TUniContainerPanel;
    UniLabel22: TUniLabel;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;
    rcBlock250: TUniContainerPanel;
    UniLabel23: TUniLabel;
    UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit;
    procedure btnCloseFormClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure edLkpPESSOASExit(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure EntregadosItenss1Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
  private
    { Private declarations }
  status:string;
  public
    { Public declarations }
  procedure SetBut(Acao: TAcaoCrud);
  procedure HabilitaCombobox(status:boolean);
  end;

function frmFICHA: TfrmFICHA;


implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untFrmBase, untDM_RC, mkm_layout, mkm_func_web,
  System.TypInfo, mkm_procedures, mkm_funcoes, mkm_impressao,
  unReportImpressao;

function frmFICHA: TfrmFICHA;
begin
  Result := TfrmFICHA(mm.GetFormInstance(TfrmFICHA));
end;

//8.0.0.0 receita modal (padrao DETALHESBENEFICIAMENTO)
procedure TfrmFICHA.UniFormCreate(Sender: TObject);
begin

  rc_RenderLayout( Self, false, false, false );

        btnEditReg.Hint :=
            '[['+
            'cls: ButtonOrange |'+
            'caption-hide:mobile|'+
            'width:85 mobile-v-32 mobile-h-32|'+ //7.0.0.0 landscape
            'force-render|' + //7.0.0.0 para quando o botao estiver desabilitado | for when the button is disabled
            'append |' +
            ']]';
             //[PT] se desejar que, em MOBILE HORIZONTAL, seja exibito o captio como em DESKTOP comente a configuração acima e descomente a inferior

        btnDeleteReg.Hint :=
            '[['+
            'cls: ButtonRed  |'+
            'caption-hide:mobile|'+
            'width:85 mobile-v-32 mobile-h-32|'+ //7.0.0.0 landscape
            'force-render|' + //7.0.0.0 para quando o botao estiver desabilitado | for when the button is disabled
            'append |' +
            ']]';

        btnSaveReg.Hint :=
            '[['+
            'cls: ButtonGreen  |'+
            'caption-hide:mobile|'+
            'width:75 mobile-v-32 mobile-h-32|'+ //7.0.0.0 landscape
            'force-render|' + //7.0.0.0 para quando o botao estiver desabilitado | for when the button is disabled
            'append |' +
            ']]';

         btnCancelReg.Hint :=
            '[['+
            'cls: ButtonRed  |'+
            'caption-hide:mobile|'+
            'width:75 mobile-v-32 mobile-h-32|'+ //7.0.0.0 landscape
            'force-render|' + //7.0.0.0 para quando o botao estiver desabilitado | for when the button is disabled
            'append |' +
            ']]';

        btnOptions.Hint :=
            '[['+
            'cls: ButtonGray  |'+
            'caption-hide:mobile|'+
            'width:75 mobile-v-32 mobile-h-32|'+ //7.0.0.0 landscape
            'force-render|' + //7.0.0.0 para quando o botao estiver desabilitado | for when the button is disabled
            'append |' +
            ']]';

end;

procedure TfrmFICHA.UniFormBeforeShow(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true );
end;

procedure TfrmFICHA.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
  FDQryCad.Close;
  FDQryFiltro.Close;
end;

procedure TfrmFICHA.btnCancelRegClick(Sender: TObject);
begin
  FDQryCad.Cancel ;

  HabilitaCombobox(True);
  SetBut(tpListacomRegistros);
end;

procedure TfrmFICHA.btnCloseFormClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmFICHA.btnDeleteRegClick(Sender: TObject);
begin
  FDQryCad.Delete;
  HabilitaCombobox(True);
end;

procedure TfrmFICHA.btnEditRegClick(Sender: TObject);
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
      FDQryCad.FindField('MESTRE_ID').AsInteger          := mm.varM_CODIGOMESTRE;
      FDQryCad.FindField('PESSOA').AsInteger             := 0;
      FDQryCad.FindField('EMPRESA').AsInteger            := 0;
      FDQryCad.FindField('PESOENTRADA').AsFloat          := 0;
      FDQryCad.FindField('VIABILIDADE_FOR').AsFloat      := 0;
      FDQryCad.FindField('PUREZA_FOR').AsFloat           := 0;
      FDQryCad.FindField('PUREZA_INTERNA').AsFloat       := 0;
      FDQryCad.FindField('VIABILIDADE_INTERNA').AsFloat  := 0;

      SqlPesquisa('select * from loteinterno where codigo = ' + IntToStr(mm.varM_CODIGOMESTRE));
        FDQryCad.FindField('MESTRE_LOTE').AsString         := dm_rc.sqlBuscas.FindField('LOTE').AsString;
        FDQryCad.FindField('SAFRA').AsString               := dm_rc.sqlBuscas.FindField('SAFRAVALIDA').AsString;
        FDQryCad.FindField('PUREZA_FOR').AsFloat           := dm_rc.sqlBuscas.FindField('PUREZA').AsFloat;
        FDQryCad.FindField('VIABILIDADE_FOR').AsFloat      := dm_rc.sqlBuscas.FindField('TETRAZOLIO').AsFloat;

      SqlPesquisa('select p.cultivar,p.sementenome from  loteinterno li inner join produtos p on (li.produto = p.codigo) where li.codigo = ' + IntToStr(mm.varM_CODIGOMESTRE));
        FDQryCad.FindField('ESPECIE').AsString             := dm_rc.sqlBuscas.FindField('SEMENTENOME').AsString;
        FDQryCad.FindField('CULTIVAR').AsString            := dm_rc.sqlBuscas.FindField('CULTIVAR').AsString;


      UniDBComboBox1.ItemIndex                             := 0;
      dm_rc.sqlBuscas.Close;
    end
  else
    FDQryCad.Edit;

  HabilitaCombobox(False);
  SetBut(tpAlterar);
end;

procedure TfrmFICHA.btnOptionsClick(Sender: TObject);
begin
  UniPopupMenuImpressao.PopupBy( TUniButton( sender ) );
end;

procedure TfrmFICHA.btnSaveRegClick(Sender: TObject);
begin
  if FDQryCad.State in [dsInsert] then
   begin
     FDQryCad.FindField('KEY').AsString          := Gera_Guid;
     FDQryCad.FindField('CODIGO').AsInteger      := Ultimo_Codigo('FICHA','CODIGO',True);
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

procedure TfrmFICHA.EntregadosItenss1Click(Sender: TObject);
begin
  mm.varC_caminhopdf :=  IMPRESSAO_FichaControle(mm.varI_Code_Company,
                                                 mm.varM_CODIGOMESTRE);

  unfImpressao.ShowModal();
end;

procedure TfrmFICHA.HabilitaCombobox(status: boolean);
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

procedure TfrmFICHA.I1Click(Sender: TObject);
begin
  mm.varC_caminhopdf :=  IMPRESSAO_FichaBatida(mm.varI_Code_Company,
                                               mm.varM_CODIGOMESTRE);

  unfImpressao.ShowModal();
end;

procedure TfrmFICHA.SetBut(Acao: TAcaoCrud);
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

procedure TfrmFICHA.edLkpPESSOASExit(Sender: TObject);
begin
  //8.0.0.0 lookup declarativo: grava PESSOA + NOME_PESSOA (rc_GetLookUpField;
  // substitui Acha_Item da 3.0 - mesmo retorno: PESSOAS.NOME)
  if ( FDQryCad.State in [dsEdit, dsInsert] ) and
     ( edLkpPESSOAS.Text <> '' ) and ( edLkpPESSOAS.Text <> '0' ) then
    begin
      FDQryCad.FieldByName('PESSOA').AsInteger     := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'CODIGO' );
      FDQryCad.FieldByName('NOME_PESSOA').AsString := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'NOME' );
    end;
end;

procedure TfrmFICHA.UniFormReady(Sender: TObject);
begin
  //8.0.0.0 rc_ResizeBlocks nao se aplica ao motor novo (padrao DETALHESBENEFICIAMENTO:
  // OnReady vazio); centralizacao garantida pelo poScreenCenter
end;

procedure TfrmFICHA.UniFormResize(Sender: TObject);
begin
  //8.0.0.0 modal maior (blocos mais altos no motor novo) e SEM os Constraints
  // fixos da 3.0 - eles cortavam o layout re-fluido e escondiam o paBaseButtons
  frmFICHA.Height   := 700;
  frmFICHA.Width    := 1300;
  frmFICHA.Position := poScreenCenter;
end;

procedure TfrmFICHA.UniFormShow(Sender: TObject);
  var i : integer; Cmp:String;
begin
  FDQryFiltro.Close;
  FDQryFiltro.SQL.Clear;
  FDQryFiltro.SQL.Text := 'select * from ficha where mestre_id = ' + IntToStr(mm.varM_CODIGOMESTRE);
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

  SetBut(tpListacomRegistros);
  HabilitaCombobox(True);
end;

end.
