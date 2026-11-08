unit untFormCRUDPROPRIO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniBasicGrid, uniDBGrid,
  uniMultiItem, uniComboBox, uniGUIClasses, uniEdit, uniLabel, uniScrollBox,
  uniPanel, uniPageControl, uniButton, uniBitBtn, uniHTMLFrame,
  uniGUIBaseClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniMemo, uniScreenMask;

type
  TAcaoCrud = (tpIncluir, tpAlterar, tpExcluir, tpListaVazia,tpListacomRegistros);

  TfrmCRUDPROPRIO = class(TfrmBase)
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
    paSearchField1: TUniContainerPanel;
    UniLabelc1: TUniLabel;
    edSearchCRUDconteudo: TUniEdit;
    paSearchOp1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    cbxSearchCRUDordem: TUniComboBox;
    UniLabel1: TUniLabel;
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel5: TUniContainerPanel;
    UniComboBoxCRUDordem: TUniComboBox;
    UniLabel2: TUniLabel;
    labTitleSearch: TUniLabel;
    paSearchBtn: TUniContainerPanel;
    btnSearchCRUD: TUniBitBtn;
    btnSearchMoreFilters: TUniBitBtn;
    dbgSearchCRUD: TUniDBGrid;
    tabRegister: TUniTabSheet;
    paBaseRegData1: TUniContainerPanel;
    UniPageControlcadastros: TUniPageControl;
    UniTabSheetCRUD: TUniTabSheet;
    UniScrollBox2: TUniScrollBox;
    dsfiltro: TDataSource;
    FDQryFiltro: TFDQuery;
    dscrud: TDataSource;
    FDQryCad: TFDQuery;
    dscruddetails: TDataSource;
    FDQryCaddetails: TFDQuery;
    UniMemolog: TUniMemo;
    tbdetalhes: TFDMemTable;
    dsdetalhes: TDataSource;
    UniScreenMask: TUniScreenMask;
    UniContainerPanel3: TUniContainerPanel;
    UniComboBoxtipo: TUniComboBox;
    UniLabeltipoordemfiltro: TUniLabel;
    labTitleForm: TUniLabel;
    labIMG: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure labIMGClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure ativabusca();
  procedure SetBut(Acao:TAcaoCrud);
  function  CamposValidados :Boolean;
  procedure Exclui();
  procedure HabilitaCombobox(status:boolean);

  procedure MemoGravaLog();

  procedure GravaBatidaitens     (const f_mestre:integer);
  procedure CarregaBatidaitens   (const f_mestre:integer);

  procedure carregabeneficiamento(const f_mestre:integer);
  procedure gravabeneficiamento  (const f_mestre:integer);

  procedure gravasolicitacao     (const f_mestre:integer);
  procedure carregasolicitacao   (const f_mestre:integer);

  procedure gravacampoitens      (const f_mestre:integer);
  procedure carregacampoitens    (const f_mestre:integer);

  procedure gravaproducaoitens   (const f_mestre:integer);
  procedure carregaproducaoitens (const f_mestre:integer);

  procedure carregacustoloteinterno(const f_mestre:integer);
  procedure gravacustoloteinterno  (const f_mestre:integer);


  procedure gravaromaneio        (const f_mestre:integer);
  procedure carregaromaneio      (const f_mestre:integer);



  procedure carregadados         (const f_mestre:integer);

  procedure VerificaEdicao();
  end;

var
  frmCRUDPROPRIO  : TfrmCRUDPROPRIO;
  state           : string;

implementation

{$R *.dfm}

uses mkm_func_web, MainModule, System.TypInfo, untDM_RC, uniDBEdit,
  mkm_procedures, mkm_funcoes, Vcl.StdCtrls, Vcl.Clipbrd, uniDBComboBox;

{ TfrmCRUDPROPRIO }

procedure TfrmCRUDPROPRIO.ativabusca;
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

procedure TfrmCRUDPROPRIO.btnCancelRegClick(Sender: TObject);
begin
  inherited;
  if  FDQryFiltro.IsEmpty then
      SetBut(tpListaVazia)
  else
      SetBut(tpListacomRegistros);

   FDQryCad.Close ;

  if StrContains('BENEFICIAMENTO#CAMPO#ROMANEIO#SOLICITACAO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      tbdetalhes.Close;
    end;
end;

procedure TfrmCRUDPROPRIO.btnDeleteRegClick(Sender: TObject);
var i : integer; Cmp:String;
begin
  dm_rc.rc_ShowYesNo( 'DESEJA REALMENTE EXCLUIR ESSE REGISTRO?' );
  if mm.varB_Yes then
    begin
      Exclui();
    end
  else
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Operação cancelada pelo USUÁRIO!' , 'warning' , false );
      Abort
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
end;

procedure TfrmCRUDPROPRIO.btnEditRegClick(Sender: TObject);
var i : integer; Cmp:String;
    S, R: Integer;
begin
  inherited;

  pgBaseCadControl.ActivePage := tabRegister;

  SetBut(tpAlterar);
  mm.FDTransaction.StartTransaction;
  Try
  {
    FDQryCad.Close;
   for i := 0 to  FDQryCad.Params.Count - 1 do
   begin
      Cmp :=  FDQryCad.Params[i].Name;
      FDQryCad.Params[i].Value :=  FDQryFiltro.FieldbyName(Cmp).Value;
   end;
    FDQryCad.Open;
  }
    FDQryCad.Edit;

    UniPageControlcadastros.ActivePage := UniTabSheetCRUD;
  Except
   Abort ;
  End ;

  HabilitaCombobox(False);

  if StrContains('PRODUTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCaddetails.Close;
      FDQryCaddetails.Params[0].AsInteger := FDQryCad.FindField('CODIGO').AsInteger;
      FDQryCaddetails.Params[1].AsInteger := MM.varI_Code_Company;
      FDQryCaddetails.Open ;
      FDQryCaddetails.Edit ;
    end;

  if StrContains('SOLICITACAO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      if tbdetalhes.RecordCount > 0 then
        begin
          tbdetalhes.First;
        end
      else
        begin
          tbdetalhes.Close;
          tbdetalhes.Open;
        end;

      S := tbdetalhes.RecordCount + 10;

      for R := S to S + 25 do
      begin
        tbdetalhes.Append;
        tbdetalhes.Post;
      end;
      tbdetalhes.First;
    end;

  if StrContains('BATIDAMESTRE',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      if tbdetalhes.RecordCount > 0 then
        begin
          tbdetalhes.First;
        end
      else
        begin
          tbdetalhes.Close;
          tbdetalhes.Open;
        end;

      S := tbdetalhes.RecordCount + 10;

      for R := S to S + 25 do
      begin
        tbdetalhes.Append;
        tbdetalhes.Post;
      end;
      tbdetalhes.First;
    end;

  if StrContains('BENEFICIAMENTO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      if tbdetalhes.RecordCount > 0 then
        begin
          tbdetalhes.First;
        end
      else
        begin
          tbdetalhes.Close;
          tbdetalhes.Open;
        end;

      S := tbdetalhes.RecordCount + 10;

      for R := S to S + 25 do
      begin
        tbdetalhes.Append;
        tbdetalhes.Post;
      end;
      tbdetalhes.First;
    end;

  if StrContains('CAMPO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      if tbdetalhes.RecordCount > 0 then
        begin
          tbdetalhes.First;
        end
      else
        begin
          tbdetalhes.Close;
          tbdetalhes.Open;
        end;

      S := tbdetalhes.RecordCount + 10;

      for R := S to S + 25 do
      begin
        tbdetalhes.Append;
        tbdetalhes.Post;
      end;
      tbdetalhes.First;
    end;

  if StrContains('ROMANEIO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      if tbdetalhes.RecordCount > 0 then
        begin
          tbdetalhes.First;
        end
      else
        begin
          tbdetalhes.Close;
          tbdetalhes.Open;
        end;

      S := tbdetalhes.RecordCount + 10;

      for R := S to S + 100 do
      begin
        tbdetalhes.Append;
        tbdetalhes.Post;
      end;
      tbdetalhes.First;
    end;

  if StrContains('PRODUCAOINTERNA',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      if tbdetalhes.RecordCount > 0 then
        begin
          tbdetalhes.First;
        end
      else
        begin
          tbdetalhes.Close;
          tbdetalhes.Open;
        end;

      S := tbdetalhes.RecordCount + 10;

      for R := S to S + 100 do
      begin
        tbdetalhes.Append;
        tbdetalhes.Post;
      end;
      tbdetalhes.First;
    end;

  if FDQryCad.UpdateOptions.UpdateTableName = 'CUSTO_LOTEINTERNO' then
    begin
      if tbdetalhes.RecordCount > 0 then
        begin
          tbdetalhes.First;
        end
      else
        begin
          tbdetalhes.Close;
          tbdetalhes.Open;
        end;

      S := tbdetalhes.RecordCount + 10;

      for R := S to S + 100 do
      begin
        tbdetalhes.Append;
        tbdetalhes.Post;
      end;
      tbdetalhes.First;
    end;
end;

procedure TfrmCRUDPROPRIO.btnNewRegClick(Sender: TObject);
  var i : integer; Cmp:String;
    S, R: Integer;
begin
  inherited;

  pgBaseCadControl.ActivePage := tabRegister;

  SetBut(tpIncluir);
  mm.FDTransaction.StartTransaction;
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

  if StrContains('PRODUTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCaddetails.Close;
      FDQryCaddetails.Params[0].AsInteger := FDQryCad.FindField('CODIGO').AsInteger;
      FDQryCaddetails.Params[1].AsInteger := MM.varI_Code_Company;
      FDQryCaddetails.Open ;
    end;

  UniPageControlcadastros.ActivePage := UniTabSheetCRUD;

  if not( FDQryCad.Active) then
      FDQryCad.Open;

  HabilitaCombobox(False);

  FDQryCad.Insert;
  FDQryCad.FindField('CODIGO').AsInteger := 0;
  if not StrContains('PONTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    FDQryCad.FindField('ATIVO').AsString   := 'T';
  //************************************************************************//
  if StrContains('HISTORICO',FDQryCad.UpdateOptions.UpdateTableName) then
    FDQryCad.FindField('TIPO').AsString := 'Entrada';
  //************************************************************************//
  //************************************************************************//
  if StrContains('CONDICOES',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('ENTRADA_SAIDA').AsInteger := 0;
      FDQryCad.FindField('FORMAPGTO').AsString      := 'Simples';
      FDQryCad.FindField('BASECALCULO').AsFloat     := 0.0000;
    end;
  //************************************************************************//
  //************************************************************************//
  if StrContains('ESCRITAS',FDQryCad.UpdateOptions.UpdateTableName) then
    FDQryCad.FindField('TIPO').AsString := 'DENTRO';
  //************************************************************************//
  //************************************************************************//
  if StrContains('CENTROCUSTO',FDQryCad.UpdateOptions.UpdateTableName) then
    FDQryCad.FindField('SITUACAO').AsString := 'Entrada';
  //************************************************************************//
  //************************************************************************//
  if StrContains('PLANOCONTAS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('TIPO').AsString         := 'Entrada';
      FDQryCad.FindField('DESTINO').AsString      := 'Contabil';
      FDQryCad.FindField('CUSTO').AsString        := 'Fixo';
      FDQryCad.FindField('CENTROCUSTO').AsInteger := 0;
      FDQryCad.FindField('PLANO').AsInteger       := Ultimo_CodigoPlanoContas();
    end;
  //************************************************************************//
  //************************************************************************//
  if StrContains('DOCUMENTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('NUMERO').AsInteger      := 0;
      FDQryCad.FindField('DOCUMENTO').AsInteger   := 0;
      FDQryCad.FindField('OPERACAO').AsInteger    := 0;
      FDQryCad.FindField('PESSOA').AsInteger      := 0;
      FDQryCad.FindField('CONDICAO').AsInteger    := 0;
      FDQryCad.FindField('EMPRESA').AsInteger     := mm.varI_Code_Company;
    end;
  //************************************************************************//
  //************************************************************************//
  if StrContains('APLICACAO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('SITUACAO').AsString      := 'Receita';
    end;
  //************************************************************************//
  //************************************************************************//
  if StrContains('OPERACOES',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('ESCRITA').AsInteger       := 0;
      FDQryCad.FindField('SUBSTITUICAO').AsInteger  := 0;
      FDQryCad.FindField('TIPO').AsString           := 'Normal';
      FDQryCad.FindField('OPERACAO_OP').AsString    := 'Vendas';
      FDQryCad.FindField('ENTRADA_SAIDA').AsInteger := 0;
      FDQryCad.FindField('FINANCEIRO').AsInteger    := 0;
      FDQryCad.FindField('ESTOQUE').AsInteger       := 0;
      FDQryCad.FindField('UNICA').AsInteger         := 0;
    end;
  //************************************************************************//
  //************************************************************************//
  if StrContains('TOLERANCIA',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('AMOSTRA_MEDIA').AsFloat        := 0;
      FDQryCad.FindField('AMOSTRA_DOSN_MIN').AsFloat     := 0.0;
      FDQryCad.FindField('AMOSTRA_DOSN_MAX').AsFloat     := 0.00;
      FDQryCad.FindField('AMOSTRA_PUREZA_MIN').AsFloat   := 0.00;
      FDQryCad.FindField('AMOSTRA_PUREZA_MAX').AsFloat   := 0.00;
      FDQryCad.FindField('ESPECIE').AsInteger            := 0;
    end;
  //************************************************************************//
  //************************************************************************//
  if StrContains('ESPECIE',FDQryCad.UpdateOptions.UpdateTableName) then
    FDQryCad.FindField('GRUPO').AsInteger := 0;
  //************************************************************************//
  //************************************************************************//
  if StrContains('RECIBOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('EMPRESA').AsInteger    := MM.varI_Code_Company;
      FDQryCad.FindField('SEQUENCIA').AsInteger  := 1;
      FDQryCad.FindField('PAGAMENTO').AsDateTime := Date;
      FDQryCad.FindField('VALOR').AsFloat        := 0.00;
    end;
  //************************************************************************//
  if StrContains('PESSOAS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('CADASTRO').AsDateTime    := Date;
      FDQryCad.FindField('FUNCIONARIO').AsInteger  := MM.varI_User;
    end;
  //************************************************************************//
  if StrContains('FUNCIONARIOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('EMPRESA').AsInteger    := mm.varI_Code_Company;
    end;
  //************************************************************************//
  if StrContains('PRODUTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('CODIGO_ESPECIE').AsInteger     := 0;
      FDQryCad.FindField('CODIGO_CULTIVAR').AsInteger    := 0;
      FDQryCad.FindField('PESOBRUTO').AsFloat            := 0;
      FDQryCad.FindField('PESOLIQUIDO').AsFloat          := 0;
      FDQryCad.FindField('ALIQUOTAIPI').AsFloat          := 0;
      FDQryCad.FindField('GRUPO').AsInteger              := 0;
      FDQryCad.FindField('UNIDADE').AsString             := 'KG';

      FDQryCaddetails.Insert;
      FDQryCaddetails.FindField('SITUACAOLOCAL').AsString    := '040';
      FDQryCaddetails.FindField('SITUACAOOUTRAS').AsString   := '020';

      FDQryCaddetails.FindField('BASE0').AsFloat             := 0.00;
      FDQryCaddetails.FindField('BASE1').AsFloat             := 40.0;
      FDQryCaddetails.FindField('BASE2').AsFloat             := 40.0;

      FDQryCaddetails.FindField('ICMS0').AsFloat             := 18;
      FDQryCaddetails.FindField('ICMS1').AsFloat             := 7;
      FDQryCaddetails.FindField('ICMS2').AsFloat             := 12;

      FDQryCaddetails.FindField('PIS').asstring              := '06';
      FDQryCaddetails.FindField('COFINS').asstring           := '06';
      FDQryCaddetails.FindField('VLRPIS').AsFloat            := 0.00;
      FDQryCaddetails.FindField('VLRCOFINS').AsFloat         := 0.00;

    end;
  //************************************************************************//
  //************************************************************************//
  if StrContains('EMPRESAS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('IBGE').AsString        := '1050';
      FDQryCad.FindField('PAIS').AsString        := 'BRASIL';
      FDQryCad.FindField('SERIE').AsInteger      := 1;
    end;
  //************************************************************************//
  if StrContains('PONTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('DATA').AsDateTime      := Date;
      FDQryCad.FindField('EMPRESA').AsInteger    := MM.varI_Code_Company;
      FDQryCad.FindField('SERIE').AsString       := 'PTS';
      FDQryCad.FindField('CANCELADA').AsString   := 'A';
      FDQryCad.FindField('SEQUENCIA').AsInteger  := 1;
      FDQryCad.FindField('DOCUMENTO').AsInteger  := 30;
      FDQryCad.FindField('PESSOA').AsInteger     := 99999;
      FDQryCad.FindField('NUMERO').AsInteger     := Ultimo_Codigo(FDQryCad.UpdateOptions.UpdateTableName,'CODIGO',false);
    end;
  //************************************************************************//
  if StrContains('SEMENTES',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('EMPRESA').AsInteger      := MM.varI_Code_Company;
      FDQryCad.FindField('LABORATORIO').AsInteger  := 1;
      FDQryCad.FindField('REMETENTE').AsInteger    := 1;
      FDQryCad.FindField('RESPONSAVEL').AsInteger  := 1;
      FDQryCad.FindField('TIPO').AsString          := 'Fiscal';

      FDQryCad.FindField('ANALISEPURA').AsFloat    := 0.00;
      FDQryCad.FindField('MATINERTES').AsFloat     := 0.00;
      FDQryCad.FindField('PESOEMBALAGEM').AsFloat  := 0;
      FDQryCad.FindField('DISPONIVEL').AsFloat     := 0;
    end;
  //************************************************************************//
  if StrContains('BATIDAMESTRE',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('EMISSAO').AsDateTime     := Date;
      FDQryCad.FindField('EMPRESA').AsInteger      := MM.varI_Code_Company;
      FDQryCad.FindField('NUMERO').AsInteger       := 0;
      FDQryCad.FindField('PU').AsFloat             := 0.00;
      FDQryCad.FindField('QUANTIDADE').AsFloat     := 0.00;

      if FDQryCad.State in [dsInsert] then
      begin
        S := 1;

        tbdetalhes.Close;
        tbdetalhes.Open;
      end
      else
        S := tbdetalhes.RecordCount + 10;

      for R := S to S + 25 do
      begin
        tbdetalhes.Append;
        tbdetalhes.Post;
      end;
      tbdetalhes.First;
    end;
  //************************************************************************//
  if StrContains('BENEFICIAMENTO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('EMISSAO').AsDateTime  := Date;
      FDQryCad.FindField('EMPRESA').AsInteger   := MM.varI_Code_Company;
      FDQryCad.FindField('SERIE').AsString      := 'BEN';
      FDQryCad.FindField('LOGIN').AsString      := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);

      if FDQryCad.State in [dsInsert] then
      begin
        S := 1;

        tbdetalhes.Close;
        tbdetalhes.Open;
      end
      else
        S := tbdetalhes.RecordCount + 10;

      for R := S to S + 25 do
      begin
        tbdetalhes.Append;
        tbdetalhes.Post;
      end;
      tbdetalhes.First;
    end;
  //************************************************************************//
  if StrContains('CAMPO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('DATA').AsDateTime      := Date;

      if FDQryCad.State in [dsInsert] then
      begin
        S := 1;

        tbdetalhes.Close;
        tbdetalhes.Open;
      end
      else
        S := tbdetalhes.RecordCount + 10;

      for R := S to S + 25 do
      begin
        tbdetalhes.Append;
        tbdetalhes.Post;
      end;
      tbdetalhes.First;
    end;
  //************************************************************************//
  if StrContains('ROMANEIO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('EMISSAO').AsDateTime    := Date;
      FDQryCad.FindField('EMPRESA').AsInteger     := MM.varI_Code_Company;
      FDQryCad.FindField('MOTORISTA').AsInteger   := 0;
      FDQryCad.FindField('VALORFRETE').AsFloat    := 0;
      FDQryCad.FindField('PAGO').AsFloat          := 0;

      if FDQryCad.State in [dsInsert] then
      begin
        S := 1;

        tbdetalhes.Close;
        tbdetalhes.Open;
      end
      else
        S := tbdetalhes.RecordCount + 10;

      for R := S to S + 100 do
      begin
        tbdetalhes.Append;
        tbdetalhes.Post;
      end;
      tbdetalhes.First;
    end;
  //************************************************************************//
  if StrContains('PRODUCAOINTERNA',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('EMPRESA').AsInteger   := MM.varI_Code_Company;
      FDQryCad.FindField('DOCUMENTO').AsInteger := 70;
      FDQryCad.FindField('EMISSAO').AsDateTime  := Date;
      FDQryCad.FindField('STATUS').AsString     := 'Andamento';

      if FDQryCad.State in [dsInsert] then
      begin
        S := 1;

        tbdetalhes.Close;
        tbdetalhes.Open;
      end
      else
        S := tbdetalhes.RecordCount + 10;

      for R := S to S + 25 do
      begin
        tbdetalhes.Append;
        tbdetalhes.Post;
      end;
      tbdetalhes.First;
    end;
  //************************************************************************//
  if StrContains('SOLICITACAO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('EMISSAO').AsDateTime   := Date;
      FDQryCad.FindField('EMPRESA').AsInteger    := mm.varI_Code_Company;
      FDQryCad.FindField('REMETENTE').AsInteger  := mm.varI_Code_Company;
      FDQryCad.FindField('AMOSTRADOR').AsInteger := 0;
      FDQryCad.FindField('TRATADA').AsString     := 'Não';
      FDQryCad.FindField('REVESTIDAS').AsString  := 'Não';
      FDQryCad.FindField('FINALIDADE').AsString  := 'BAS';
      FDQryCad.FindField('ASSINADO').AsString    := 'N';
      FDQryCad.FindField('STATUS').AsString      := 'Andamento';

      if FDQryCad.State in [dsInsert] then
      begin
        S := 1;

        tbdetalhes.Close;
        tbdetalhes.Open;
      end
      else
        S := tbdetalhes.RecordCount + 10;

      for R := S to S + 30 do
      begin
        tbdetalhes.Append;
        tbdetalhes.Post;
      end;
      tbdetalhes.First;
    end;
  //************************************************************************//
  if StrContains('ROMANEIO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('EMPRESA').AsInteger      := MM.varI_Code_Company;
    end;
  //************************************************************************//
  if StrContains('LOTEINTERNO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('EMPRESA').AsInteger   := MM.varI_Code_Company;
      FDQryCad.FindField('TIPO').AsString       := 'Insumos';
      FDQryCad.FindField('DISPONIVEL').AsFloat  := 0;
      FDQryCad.FindField('TOTALPONTOS').AsFloat := 0;
      FDQryCad.FindField('PUREZA').AsFloat      := 0;
      FDQryCad.FindField('GERMINACAO').AsFloat  := 0;
      FDQryCad.FindField('TETRAZOLIO').AsFloat  := 0;
      FDQryCad.FindField('CUSTO_PONTO').AsFloat := 0;
    end;
  //************************************************************************//
  if StrContains('MANUTENCAOLOTE_INTERNO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCad.FindField('EMPRESA').AsInteger          := MM.varI_Code_Company;
      FDQryCad.FindField('TIPO').AsString              := 'SAIDA';
      FDQryCad.FindField('EMISSAO').AsDateTime         := Date;
      FDQryCad.FindField('DOCUMENTO').AsInteger        := 70;
      FDQryCad.FindField('SEQUENCIA').AsInteger        := 1;
      FDQryCad.FindField('NUMERO').AsInteger           := 0;
      FDQryCad.FindField('MESTRE_PRODUCAO').AsInteger  := 0;
      FDQryCad.FindField('TOTALPONTOS').AsFloat        := 0;
      FDQryCad.FindField('PUREZA').AsFloat             := 0;
      FDQryCad.FindField('QUANTIDADE').AsFloat         := 0;
    end;
  //************************************************************************//
  //************************************************************************//
  if FDQryCad.UpdateOptions.UpdateTableName = 'CUSTO_LOTEINTERNO' then
    begin
      FDQryCad.FindField('EMISSAO').AsDateTime := Date;

      if FDQryCad.State in [dsInsert] then
      begin
        S := 1;

        tbdetalhes.Close;
        tbdetalhes.Open;
      end
      else
        S := tbdetalhes.RecordCount + 10;

      for R := S to S + 30 do
      begin
        tbdetalhes.Append;
        tbdetalhes.Post;
      end;
      tbdetalhes.First;
    end;
  //************************************************************************//

end;

procedure TfrmCRUDPROPRIO.btnSaveRegClick(Sender: TObject);
var
  codigo : integer;
begin
  inherited;
  if not (CamposValidados) then
     Abort
  else
    if FDQryCad.State in [dsInsert,dsEdit] then
     Begin
       codigo := 0;
       if FDQryCad.State in [dsInsert] then
         begin
           if StrContains('BATIDAMESTRE',FDQryCad.UpdateOptions.UpdateTableName) then
             FDQryCad.FindField('NUMERO').AsInteger := Ultimo_Numero(mm.varI_Code_Company,300,'GRAVAR');

           if StrContains('PRODUCAOINTERNA',FDQryCad.UpdateOptions.UpdateTableName) then
             FDQryCad.FindField('NUMERO').AsInteger := Ultimo_Numero(mm.varI_Code_Company,FDQryCad.FindField('DOCUMENTO').AsInteger,'GRAVAR');

           if StrContains('MANUTENCAOLOTE_INTERNO',FDQryCad.UpdateOptions.UpdateTableName) then
             FDQryCad.FindField('NUMERO').AsInteger := Ultimo_Numero(mm.varI_Code_Company,FDQryCad.FindField('DOCUMENTO').AsInteger,'GRAVAR');

           if not StrContains('OPERACOES',FDQryCad.UpdateOptions.UpdateTableName) then
             FDQryCad.FindField('CODIGO').AsInteger := Ultimo_Codigo(FDQryCad.UpdateOptions.UpdateTableName,'CODIGO',True);

           FDQryCad.FindField('KEY').AsString     := Gera_Guid;
         end;

       if not StrContains('OPERACOES',FDQryCad.UpdateOptions.UpdateTableName) then
         codigo := FDQryCad.FindField('CODIGO').AsInteger;


       state := Retornastatustable(FDQryCad);
       FDQryCad.Post;

       if StrContains('BENEFICIAMENTO',FDQryCad.UpdateOptions.UpdateTableName) then
         begin
           gravabeneficiamento(FDQryCad.FindField('CODIGO').AsInteger);
         end;

       if StrContains('ROMANEIO',FDQryCad.UpdateOptions.UpdateTableName) then
         begin
           gravaromaneio(FDQryCad.FindField('CODIGO').AsInteger);
         end;

       if StrContains('CAMPO',FDQryCad.UpdateOptions.UpdateTableName) then
         begin
           gravacampoitens(FDQryCad.FindField('CODIGO').AsInteger);
         end;

       if StrContains('PRODUCAOINTERNA',FDQryCad.UpdateOptions.UpdateTableName) then
         begin
           gravaproducaoitens(FDQryCad.FindField('CODIGO').AsInteger);
         end;

       if StrContains('SOLICITACAO',FDQryCad.UpdateOptions.UpdateTableName) then
         begin
           gravasolicitacao(FDQryCad.FindField('CODIGO').AsInteger);
         end;

       if FDQryCad.UpdateOptions.UpdateTableName = 'CUSTO_LOTEINTERNO' then
         begin
           gravacustoloteinterno(FDQryCad.FindField('CODIGO').AsInteger);
         end;

       if StrContains('MANUTENCAOLOTE_INTERNO',FDQryCad.UpdateOptions.UpdateTableName) then
         begin
           CalculaLoteInterno (mm.varI_Code_Company,
                               FDQryCad.FindField('PRODUTO').AsInteger,
                               FDQryCad.Findfield('LOTE').AsString);
         end;


       if StrContains('PRODUCAOINTERNA',FDQryCad.UpdateOptions.UpdateTableName) then
         begin
           executasql(' UPDATE LOTEINTERNO SET CODIGOP = ' + QuotedStr(FDQryCad.FindField('PADRAO').AsString) +
                      ' WHERE                     LOTE = ' + QuotedStr(FDQryCad.FindField('LOTE').AsString)   +
                      ' AND                    PRODUTO = ' + IntToStr (FDQryCad.FindField('PRODUTO').AsInteger));
         end;

       if StrContains('PONTOS',FDQryCad.UpdateOptions.UpdateTableName) then
         begin
           if FDQryCad.FindField('LOTESEMENTE').AsString <> '' then
             begin
               Calcula_Lote(mm.varI_Code_Company,FDQryCad.FindField('PRODUTO').AsInteger,
                            FDQryCad.FindField('LOTESEMENTE').AsString,
                            FDQryCad.FindField('BOLETIM').AsString,
                            FDQryCad.FindField('TERMO').AsString,
                            mm.M_TIPOPESO);
             end;
         end;

       mm.FDTransaction.Commit;

       if StrContains('PRODUTOS',FDQryCad.UpdateOptions.UpdateTableName) then
         begin
           if FDQryCaddetails.State in [dsInsert] then
             begin
               FDQryCaddetails.FindField('KEY').AsString      := Gera_Guid;
               FDQryCaddetails.FindField('EMPRESA').AsInteger := MM.varI_Code_Company;
               FDQryCaddetails.FindField('PRODUTO').AsInteger := FDQryCad.FindField('CODIGO').AsInteger;
             end;
           FDQryCaddetails.Post;
         end;

       try
         MemoGravaLog();
         GravaLog(mm.varI_Code_Company,
                  mm.varI_User,
                  FDQryCad.FindField('CODIGO').AsInteger,
                  mm.vUserName,
                  state,
                  FDQryCad.UpdateOptions.UpdateTableName,
                  '',
                  UniMemolog.Text);

         dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Gravados com SUCESSO!' , 'success' , false );
       except
         dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui gravar, chame o SUPORTE!' , 'error' , false );
       end;

     End;

  if  FDQryFiltro.Active then
    FDQryFiltro.Refresh;

  if  FDQryFiltro.IsEmpty then
   SetBut(tpListaVazia)
  Else
   SetBut(tpListacomRegistros);

   // carrega dados
   carregadados(codigo);

  HabilitaCombobox(True);

end;

procedure TfrmCRUDPROPRIO.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmCRUDPROPRIO.btnSearchCRUDClick(Sender: TObject);
var i                 : integer;
  select,where, ativo : string;
  M_STR,
  M_STRSITUACAO   : TStringList;
begin
  inherited;
  VerificaEdicao();

  if StrContains('BANCO_REMESSA',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;PORTADOR',';');
    end;

  if StrContains('RECIBOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;RECEBI_DE;NOME;VALOR;REFERENTE',';');
    end;

  if FDQryCad.UpdateOptions.UpdateTableName = 'CUSTO_LOTEINTERNO' then
    begin
      M_STR := Explode('CODIGO;DESCRICAO',';');
    end;

  if StrContains('SOLICITACAO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;LABORATORIO;REQUERENTE',';');
    end;

  if StrContains('CIDADES',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;DESCRICAO;CODIIBGE',';');
    end;

  if StrContains('PRODUCAOINTERNA#MANUTENCAOLOTE_INTERNO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;LOTE;NUMERO;PRODUTO;DESCRICAO',';');
    end;

  if StrContains('LOTEINTERNO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;LOTE;POSICAO;PRODUTO;DESCRICAO',';');
    end;

  if StrContains('ROMANEIO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;NOME;PLACA',';');
    end;

  if StrContains('TABELAICMS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;ORIGEM;DESTINO;PORCENTAGEM',';')
    end;

  if StrContains('CAMPO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;COOPERANTE;NOME;DESCRICAOSAFRA',';')
    end;

  if StrContains('BATIDAMESTRE',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;NUMERO;PRODUTO;LOTE',';')
    end;

  if StrContains('PRODUTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;DESCRICAO;SEMENTENOME;CULTIVAR',';')
    end;

  if StrContains('SEMENTES',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;LOTE;BOLETIM;TERMO;CULTIVAR;PRODUTO;SAFRAVALIDA',';')
    end;

  if StrContains('PESSOAS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;NOME;FANTASIA;CPFCNPJ;ENDERECO;CIDADE;ESTADO;FUNCIONARIO',';')
    end;


  if StrContains('TRANSPORTES#EMPRESAS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;NOME;FANTASIA;CPFCNPJ;ENDERECO;CIDADE;ESTADO',';')
    end;

  if StrContains('FUNCIONARIOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;NOME;TIPO;DEPARTAMENTO',';')
    end;

  if StrContains('LABORATORIO#RESPONSAVEL',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;NOME;CIDADE;ESTADO',';')
    end;


  if StrContains('CATEGORIA#PENEIRA#PRAGAS#BALANCAS#HISTORICO#CARTEIRA#CONDICOES#ESCRITAS#PARAMETROSOPERACAO#PORTADORES#REGIAO#MEDIDAS#'+
                 'CENTROCUSTO#DOCUMENTOS#APLICACAO#GRUPOS#GERMINADOR#GRUPOSESPECIE#BARRACAO#MARCA',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;DESCRICAO',';')
    end;

  if StrContains('PROBABILIDADE',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;BASE;MEDIA',';')
    end;

  if StrContains('TOLERANCIA',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;ESPECIE_DESCRICAO',';')
    end;


  if StrContains('OPERACOES',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;DESCRICAO;REFERENCIA',';')
    end;


  if StrContains('ESPECIE',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;SEMENTENOME;POPULAR',';')
    end;

  if StrContains('PLANOCONTAS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;PLANO;DESCRICAO',';')
    end;

  if StrContains('CULTIVAR',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;CULTIVAR',';')
    end;

  if StrContains('PONTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;NUMERO;LOTESEMENTE;TERMO;BOLETIM;PRODUTO;DESCRICAO',';')
    end;

  if StrContains('BENEFICIAMENTO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;EMISSAO',';')
    end;

  if StrContains('MENUSISTEMA',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      M_STR := Explode('CODIGO;MENU;TABELA',';')
    end;

  FDQryFiltro.Close;

  case UniComboBoxCRUDordem.ItemIndex of
    0 : ativo := ' and ativo = ' + QuotedStr('T');
    1 : ativo := ' and ativo = ' + QuotedStr('F');
    2 : ativo := '';
  end;

  if StrContains('BANCO_REMESSA',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      select := ' select * from                      ' + FDQryCad.UpdateOptions.UpdateTableName;
      where  := ' where                              ' + M_STR[cbxSearchCRUDordem.ItemIndex]             +
                ' like                               ' + QuotedStr('%'+edSearchCRUDconteudo.Text+'%')    +
                ' order by  EMISSAO DESC,            ' + M_STR[cbxSearchCRUDordem.ItemIndex];
    end
  else
  if StrContains('SEMENTES',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      select := ' select * from                      ' + FDQryCad.UpdateOptions.UpdateTableName;
      where  := ' where                       upper( ' + M_STR[cbxSearchCRUDordem.ItemIndex]           + ')' +
                ' like                        upper( ' + QuotedStr('%'+edSearchCRUDconteudo.Text+'%')  + ')' +  ativo +
                variif(StrContains('PRODUTO#LOTE',M_STR[cbxSearchCRUDordem.ItemIndex]),
                ' order by '+M_STR[cbxSearchCRUDordem.ItemIndex]+', disponivel ',
                ' order by  codigo desc,                         ' + M_STR[cbxSearchCRUDordem.ItemIndex]);
    end
  else
  if StrContains('PONTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      select := ' select * from                      ' + FDQryCad.UpdateOptions.UpdateTableName;
      where  := ' where                              ' + M_STR[cbxSearchCRUDordem.ItemIndex]         +
                ' like                               ' + QuotedStr(edSearchCRUDconteudo.Text+'%')    +
                ' order by                           ' + M_STR[cbxSearchCRUDordem.ItemIndex];
    end
  else
  if StrContains('BENEFICIAMENTO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      select := ' select * from                      ' + FDQryCad.UpdateOptions.UpdateTableName;
      where  := ' where                              ' + M_STR[cbxSearchCRUDordem.ItemIndex]         +
                ' like                               ' + QuotedStr(edSearchCRUDconteudo.Text +'%')   +
                ' order by                           ' + M_STR[cbxSearchCRUDordem.ItemIndex] + ' desc';
    end
  else
  if StrContains('LOTEINTERNO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      select := ' select * from                      ' + FDQryCad.UpdateOptions.UpdateTableName;
      where  := ' where                              ' + M_STR[cbxSearchCRUDordem.ItemIndex]         +
                ' like                               ' + QuotedStr(edSearchCRUDconteudo.Text +'%')   +
                ' and tipo                         = ' + QuotedStr(UniComboBoxtipo.Text)             +
                ' and empresa                      = ' + IntToStr(mm.varI_Code_Company)              +
                ' order by                           ' + ' disponivel desc, '+M_STR[cbxSearchCRUDordem.ItemIndex] + ' desc';
    end
  else
  if StrContains('FUNCIONARIOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      select := ' select * from                      ' + FDQryCad.UpdateOptions.UpdateTableName;
      where  := ' where                       upper( ' + M_STR[cbxSearchCRUDordem.ItemIndex]           + ')' +
                ' like                        upper( ' + QuotedStr('%'+edSearchCRUDconteudo.Text+'%')  + ')' +  ativo +
                ' order by                           ' + M_STR[cbxSearchCRUDordem.ItemIndex];
    end
  else
  if StrContains('RECIBOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      select := ' select * from                      ' + FDQryCad.UpdateOptions.UpdateTableName;
      where  := ' where                              ' + M_STR[cbxSearchCRUDordem.ItemIndex]             +
                ' like                               ' + QuotedStr('%'+edSearchCRUDconteudo.Text+'%')    + ativo +
                ' order by                           ' + M_STR[cbxSearchCRUDordem.ItemIndex] + ' desc';
    end
  else
  if StrContains('PRODUCAOINTERNA#MANUTENCAOLOTE_INTERNO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      select := ' select * from                      ' + FDQryCad.UpdateOptions.UpdateTableName;
      where  := ' where                              ' + M_STR[cbxSearchCRUDordem.ItemIndex]         +
                ' like                               ' + QuotedStr('%'+edSearchCRUDconteudo.Text+'%')    + ativo +
                ' and empresa                      = ' + IntToStr(mm.varI_Code_Company)              +
                ' order by                           ' + M_STR[cbxSearchCRUDordem.ItemIndex];
    end
  else
    begin
      select := ' select * from                      ' + FDQryCad.UpdateOptions.UpdateTableName;
      where  := ' where                              ' + M_STR[cbxSearchCRUDordem.ItemIndex]         +
                ' like                               ' + QuotedStr('%'+edSearchCRUDconteudo.Text+'%')    + ativo +
                ' order by                           ' + M_STR[cbxSearchCRUDordem.ItemIndex];
    end;


  FDQryFiltro.SQL.Clear;
  FDQryFiltro.SQL.Text := select+where;
  FDQryFiltro.Open();

  if FDQryFiltro.RecordCount > 0 then
    SetBut(tpListacomRegistros)
  else
    SetBut(tpListaVazia);
end;

function TfrmCRUDPROPRIO.CamposValidados: Boolean;
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
           dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', Campos.Text, 'warning' , false );
           FDQryCad.Fields[e].FocusControl ;
           result := false ;
        end
     Else
       result := true;

  finally
    Campos.Free;
  end;
end;

procedure TfrmCRUDPROPRIO.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
begin
  inherited;
  if FDQryFiltro.RecordCount > 0 then
    begin
       if StrContains('ROMANEIO',FDQryCad.UpdateOptions.UpdateTableName) then
         dbgSearchCRUDDblClick(Self);
    end;
end;

procedure TfrmCRUDPROPRIO.dbgSearchCRUDDblClick(Sender: TObject);
  var i : integer; Cmp:String;
begin
  inherited;
  VerificaEdicao();

  pgBaseCadControl.ActivePage := tabRegister;

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

  if StrContains('PRODUTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCaddetails.Close;
      FDQryCaddetails.Params[0].AsInteger := FDQryCad.FindField('CODIGO').AsInteger;
      FDQryCaddetails.Params[1].AsInteger := MM.varI_Code_Company;
      FDQryCaddetails.Open ;
    end;

  if StrContains('BENEFICIAMENTO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      carregabeneficiamento(FDQryCad.FindField('CODIGO').AsInteger);
    end;

  if StrContains('CAMPO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      carregacampoitens(FDQryCad.FindField('CODIGO').AsInteger);
    end;

  if StrContains('ROMANEIO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      carregaromaneio(FDQryCad.FindField('CODIGO').AsInteger);
    end;

  if StrContains('SOLICITACAO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      carregasolicitacao(FDQryCad.FindField('CODIGO').AsInteger);
    end;

  if StrContains('PRODUCAOINTERNA',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      carregaproducaoitens(FDQryCad.FindField('CODIGO').AsInteger);
    end;

  if FDQryCad.UpdateOptions.UpdateTableName = 'CUSTO_LOTEINTERNO' then
    begin
      carregacustoloteinterno(FDQryCad.FindField('CODIGO').AsInteger);
    end;


  if not( FDQryCad.Active) then
    begin
      FDQryCad.Open;
    end;

  pgBaseCadControl.ActivePage        := tabRegister;
  UniPageControlcadastros.ActivePage := UniTabSheetCRUD;

end;

Procedure TfrmCRUDPROPRIO.Exclui;
var
  codigotable, pproduto : integer;
  batpro,
  batlote,
  batboletim,
  battermo              :string;
begin
  MemoGravaLog();
  codigotable := FDQryCad.FindField('CODIGO').AsInteger;

  if StrContains('BATIDAMESTRE',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      batpro     := FDQryCad.FindField('PRODUTO').AsString;
      batlote    := FDQryCad.FindField('LOTE').AsString;
      batboletim := FDQryCad.FindField('BOLETIM').AsString;
      battermo   := FDQryCad.FindField('TERMO').AsString;

      executasql(' delete from pontos where numero = ' + IntToStr(FDQryCad.FindField('NUMERO').AsInteger) +
                 ' and documento                   = ' + IntToStr(300)    +
                 ' and serie                       = ' + QuotedStr('PRD') +
                 ' and empresa                     = ' + IntToStr(mm.varI_Code_Company));
    end;

  if StrContains('PONTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      batpro     := FDQryCad.FindField('PRODUTO').AsString;
      batlote    := FDQryCad.FindField('LOTESEMENTE').AsString;
      batboletim := FDQryCad.FindField('BOLETIM').AsString;
      battermo   := FDQryCad.FindField('TERMO').AsString;
    end;

  if StrContains('MANUTENCAOLOTE_INTERNO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      batlote  := FDQryCad.Findfield('LOTE').AsString;
      pproduto := FDQryCad.Findfield('PRODUTO').AsInteger;

      CalculaLoteInterno (mm.varI_Code_Company,
                                      pproduto,
                                      batlote);
    end;

  if StrContains('PRODUCAOINTERNA',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      TabelaProducaoItens('SELECT * FROM PRODUCAOINTERNA_ITENS  where mestre_id       = ' + IntToStr(FDQryCad.FindField('CODIGO').AsInteger));
      executasql         ('delete   from PRODUCAOINTERNA_ITENS  where mestre_id       = ' + IntToStr(FDQryCad.FindField('CODIGO').AsInteger));
      executasql         ('delete   from CUSTO_PRODUCAO         where mestre_id       = ' + IntToStr(FDQryCad.FindField('CODIGO').AsInteger));
      executasql         ('delete   from MANUTENCAOLOTE_INTERNO where MESTRE_PRODUCAO = ' + IntToStr(FDQryCad.FindField('CODIGO').AsInteger));
      executasql         ('delete   from CUSTO_PRODUCAO where mestre_id               = ' + IntToStr(FDQryCad.FindField('CODIGO').AsInteger));

      CalculaLoteInterno (mm.varI_Code_Company,
                          FDQryCad.FindField('PRODUTO').AsInteger,
                          FDQryCad.Findfield('LOTE').AsString);

      dm_rc.fdqryproducaointernaitens.First;
      while not dm_rc.fdqryproducaointernaitens.Eof do
        begin
          CalculaLoteInterno (mm.varI_Code_Company,
                              dm_rc.fdqryproducaointernaitens.FindField('PRODUTO').AsInteger,
                              dm_rc.fdqryproducaointernaitens.Findfield('LOTE').AsString);

          dm_rc.fdqryproducaointernaitens.Next;
        end;
    end;

  if StrContains('SOLICITACAO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      try
        DeleteFile(FDQryCad.FindField('CAMINHO').AsString);
      except
      end;

      executasql('delete from SOLICITACAO_ITENS      where MESTRE_ID   = ' + IntToStr(codigotable));
      executasql('delete from responsavel_assinatura where solicitacao = ' + IntToStr(codigotable));
    end;

  if FDQryCad.UpdateOptions.UpdateTableName = 'CUSTO_LOTEINTERNO' then
    begin
      try
        executasql('delete from CUSTO_LOTEINTERNOITENS      where MESTRE_ID   = ' + IntToStr(codigotable));
      except
      end;
    end;

  FDQryCad.Delete;

  try
    if  FDQryFiltro.Active then
      FDQryFiltro.Refresh;

    if StrContains('BATIDAMESTRE',FDQryCad.UpdateOptions.UpdateTableName) then
      begin
        executasql('delete from batidaitens where mestre = ' + IntToStr(codigotable));
        Calcula_Lote(mm.varI_Code_Company, StrToInt(batpro),
                    batlote, batboletim,battermo,
                    mm.M_TIPOPESO);
      end;

    if StrContains('PONTOS',FDQryCad.UpdateOptions.UpdateTableName) then
      begin
        Calcula_Lote(mm.varI_Code_Company, StrToInt(batpro),
                    batlote, batboletim,battermo,
                    mm.M_TIPOPESO);
      end;

    if StrContains('BENEFICIAMENTO',FDQryCad.UpdateOptions.UpdateTableName) then
      begin
        Exclui_Movimento('BENEFICIAMENTO','BEN',MM.varI_Code_Company,0,codigotable);
      end;

    if StrContains('CAMPO',FDQryCad.UpdateOptions.UpdateTableName) then
      begin
        executasql('delete from campoitens where numero = ' + IntToStr(codigotable));
      end;

    if StrContains('ROMANEIO',FDQryCad.UpdateOptions.UpdateTableName) then
      begin
        executasql('delete from ROMANEIOITENS where MESTRE_ID = ' + IntToStr(codigotable));
      end;

   GravaLog(mm.varI_Code_Company,
            mm.varI_User,
            codigotable,
            mm.vUserName,
            'dsDelete',
            FDQryCad.UpdateOptions.UpdateTableName,
            '',
            UniMemolog.Text);

    Lixeira(mm.varI_Code_Company,
            mm.vUserName,
            FDQryCad.UpdateOptions.UpdateTableName,
            UniMemolog.Text);

    dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Excluido com SUCESSO!' , 'success' , false );
    pgBaseCadControl.ActivePage := tabSearch;
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui DELETAR, chame o SUPORTE!' , 'error' , false );
  end;

  if StrContains('PRODUTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      FDQryCaddetails.Delete;
    end;

end;

procedure TfrmCRUDPROPRIO.GravaBatidaitens(const f_mestre: integer);
var
  mEQV : Real;
  tot  : Real;
begin
  executasql       ('delete from batidaitens where mestre   = ' + IntToStr(f_mestre));
  TabelaBatidaItens('select * from batidaitens where mestre = ' + IntToStr(f_mestre));

  tot := 0;

  tbdetalhes.First;
  while not tbdetalhes.Eof do
    begin
      if tbdetalhes.FindField('PRODUTO').AsInteger > 0 then
        begin
          mEQV                                        := 0;
          mEQV                                        := ((tbdetalhes.FindField('QUANTIDADE').AsFloat / FDQryCad.FindField('QUANTIDADE').AsFloat)* 100);

          tbdetalhes.edit;
          tbdetalhes.FindField('EQUIVALENTE').AsFloat :=  MRound(mEQV,2);
          tbdetalhes.post;

          tot := tot + tbdetalhes.FindField('QUANTIDADE').AsFloat;
        end;

      tbdetalhes.Next
    end;

  tbdetalhes.First;
  tbdetalhes.Insert;
  tbdetalhes.FindField('PRODUTO').AsInteger   := FDQryCad.FindField('PRODUTO').AsInteger;
  tbdetalhes.FindField('DESCRICAO').AsString  := FDQryCad.FindField('DESCRICAO').AsString;
  tbdetalhes.FindField('QUANTIDADE').AsFloat  := FDQryCad.FindField('QUANTIDADE').AsFloat  - tot;
  tbdetalhes.FindField('EQUIVALENTE').AsFloat := MRound((tbdetalhes.FindField('QUANTIDADE').AsFloat/FDQryCad.FindField('QUANTIDADE').AsFloat * 100),2);
  tbdetalhes.FindField('TIPO').AsString       := 'Sementes';
  tbdetalhes.post;

  tbdetalhes.First;
  while not tbdetalhes.Eof do
    begin
      if tbdetalhes.FindField('PRODUTO').AsInteger > 0 then
        begin
          dm_rc.fdqrybatidaitens.Append;
          dm_rc.fdqrybatidaitens.FindField('CODIGO').AsInteger       := Ultimo_Codigo('BATIDAITENS','CODIGO',True);
          dm_rc.fdqrybatidaitens.FindField('SEQUENCIA').AsInteger    := tbdetalhes.FindField('SEQUENCIA').AsInteger;
          dm_rc.fdqrybatidaitens.FindField('PRODUTO').AsInteger      := tbdetalhes.FindField('PRODUTO').AsInteger;
          dm_rc.fdqrybatidaitens.FindField('DESCRICAO').AsString     := tbdetalhes.FindField('DESCRICAO').AsString;
          dm_rc.fdqrybatidaitens.FindField('QUANTIDADE').AsFloat     := tbdetalhes.FindField('QUANTIDADE').AsFloat;
          dm_rc.fdqrybatidaitens.FindField('EQUIVALENCIA').AsFloat   := tbdetalhes.FindField('EQUIVALENTE').AsFloat;
          dm_rc.fdqrybatidaitens.FindField('CUSTO_UNITARIO').AsFloat := tbdetalhes.FindField('CUSTO_UNITARIO').AsFloat;
          dm_rc.fdqrybatidaitens.FindField('TIPO').AsString          := tbdetalhes.FindField('TIPO').AsString;
          dm_rc.fdqrybatidaitens.FindField('MESTRE').AsInteger       := f_mestre;
          dm_rc.fdqrybatidaitens.FindField('KEY').AsString           := Gera_Guid();
          dm_rc.fdqrybatidaitens.Post;
        end;

      tbdetalhes.Next;
    end;

end;
procedure TfrmCRUDPROPRIO.gravabeneficiamento(const f_mestre: integer);
begin

  Tabelabeneitens ('select * from beneitens where numero   = 0');
  TabelaPontos    ('select * from pontos    where numero   = 0');
  Exclui_Movimento('BENEFICIAMENTO',
                    fdqrycad.findfield('SERIE').asstring,
                    mm.varI_Code_Company,100,
                    fdqrycad.findfield('CODIGO').AsInteger);

  tbdetalhes.First;
  while not tbdetalhes.Eof do
    begin
      if tbdetalhes.findfield('PRODUTO').AsInteger > 0 then
        begin
          dm_rc.fdqrybeneitens.Append;
          dm_rc.fdqrybeneitens.FindField('NUMERO').AsInteger        := FDQryCad.FindField('CODIGO').AsInteger;
          dm_rc.fdqrybeneitens.FindField('EMISSAO').AsDateTime      := FDQryCad.FindField('EMISSAO').AsDateTime;
          dm_rc.fdqrybeneitens.FindField('EMPRESA').AsInteger       := MM.varI_Code_Company;
          dm_rc.fdqrybeneitens.FindField('SERIEBE').AsString        := 'BEN';
          dm_rc.fdqrybeneitens.FindField('NOTA').AsInteger          := tbdetalhes.findfield('NOTA').AsInteger;
          dm_rc.fdqrybeneitens.FindField('PESSOA').AsInteger        := tbdetalhes.findfield('PESSOA').AsInteger;
          dm_rc.fdqrybeneitens.FindField('SERIE').AsString          := tbdetalhes.findfield('SERIE').AsString;
          dm_rc.fdqrybeneitens.FindField('PRODUTO').AsInteger       := tbdetalhes.findfield('PRODUTO').AsInteger;
          dm_rc.fdqrybeneitens.FindField('SEQUENCIA').AsInteger     := tbdetalhes.FindField('SEQITENS').AsInteger;
          dm_rc.fdqrybeneitens.FindField('DESCRICAO').AsString      := tbdetalhes.findfield('DESCRICAO').AsString;
          dm_rc.fdqrybeneitens.FindField('LOTEORIGEM').AsString     := tbdetalhes.findfield('LOTE').AsString;
          dm_rc.fdqrybeneitens.FindField('QTENOTA').AsFloat         := tbdetalhes.findfield('QTENOTA').AsFloat;
          dm_rc.fdqrybeneitens.FindField('GERNOTA').AsFloat         := tbdetalhes.findfield('GERNOTA').AsFloat;
          dm_rc.fdqrybeneitens.FindField('PUREZANOTA').AsFloat      := tbdetalhes.findfield('PUREZANOTA').AsFloat;
          dm_rc.fdqrybeneitens.FindField('QUANTIDADE').AsFloat      := tbdetalhes.findfield('QUANTIDADE').AsFloat;
          dm_rc.fdqrybeneitens.FindField('VCNOTA').AsFloat          := tbdetalhes.findfield('VCNOTA').AsFloat;
          dm_rc.fdqrybeneitens.FindField('VALORCULTURAL').AsFloat   := tbdetalhes.findfield('VALORCULTURAL').AsFloat;

          dm_rc.fdqrybeneitens.FindField('GERMINACAO').AsFloat      := tbdetalhes.findfield('GERMINACAO').AsFloat;
          dm_rc.fdqrybeneitens.FindField('PUREZA').AsFloat          := tbdetalhes.findfield('PUREZA').AsFloat;
          dm_rc.fdqrybeneitens.FindField('LOTEDESTINO').AsString    := tbdetalhes.findfield('LOTEDESTINO').AsString;
          dm_rc.fdqrybeneitens.FindField('BOLETIMDESTINO').AsString := tbdetalhes.findfield('BOLETIMDESTINO').AsString;
          dm_rc.fdqrybeneitens.FindField('DESCARTE').AsFloat        := tbdetalhes.findfield('DESCARTE').AsFloat;
          dm_rc.fdqrybeneitens.FindField('PONTOS').AsFloat          := tbdetalhes.findfield('PONTOS').AsFloat;
          dm_rc.fdqrybeneitens.FindField('SEQITENS').AsInteger      := tbdetalhes.findfield('SEQITENS').AsInteger;
          dm_rc.fdqrybeneitens.FindField('DISPONIVEL').AsFloat      := tbdetalhes.findfield('DISPONIVEL').AsFloat;
          dm_rc.fdqrybeneitens.FindField('TERMO').AsString          := tbdetalhes.findfield('TERMO').AsString;
          dm_rc.fdqrybeneitens.FindField('SALDO').AsFloat           := tbdetalhes.findfield('DISPONIVEL').AsFloat - tbdetalhes.findfield('QUANTIDADE').AsFloat - tbdetalhes.findfield('DESCARTE').AsFloat;
          dm_rc.fdqrybeneitens.FindField('VALORCULTURAL').AsFloat   := tbdetalhes.findfield('VALORCULTURAL').AsFloat;

          dm_rc.fdqrybeneitens.FindField('COOPERANTE').AsInteger    := tbdetalhes.findfield('COOPERANTE').AsInteger;
          dm_rc.fdqrybeneitens.FindField('CAMPO').AsString          := tbdetalhes.findfield('CAMPO').AsString;
          dm_rc.fdqrybeneitens.FindField('SAFRACAMPO').AsString     := tbdetalhes.findfield('SAFRACAMPO').AsString;
          dm_rc.fdqrybeneitens.FindField('KEY').AsString            := Gera_Guid();

          dm_rc.fdqrybeneitens.FindField('CODIGO').AsInteger        := Ultimo_Codigo('BENEITENS','CODIGO',True);
          dm_rc.fdqrybeneitens.Post;

          if tbdetalhes.findfield('CAMPO').AsString <> '' then
            begin
              if TabelaSementes(' select * from sementes where lote = ' + QuotedStr(tbdetalhes.findfield('LOTEDESTINO').AsString) +
                                ' and produto                       = ' + IntToStr(tbdetalhes.findfield('PRODUTO').AsInteger)     +
                                ' and boletim                       = ' + QuotedStr(tbdetalhes.findfield('BOLETIMDESTINO').AsString)) then
              begin
                dm_rc.fdqrysementes.edit;
                dm_rc.fdqrysementes.FindField('CAMPO').AsString      := tbdetalhes.findfield('CAMPO').AsString;
                dm_rc.fdqrysementes.FindField('SAFRACAMPO').AsString := tbdetalhes.findfield('SAFRACAMPO').AsString;
                dm_rc.fdqrysementes.FindField('COOPERANTE').AsInteger:= tbdetalhes.findfield('COOPERANTE').AsInteger;
                dm_rc.fdqrysementes.Post;
              end;

            end;

          //********************************************************************************************************//
          dm_rc.fdqrypontos.Append;
          dm_rc.fdqrypontos.FindField('EMPRESA').AsInteger     := mm.varI_Code_Company;
          dm_rc.fdqrypontos.FindField('SEQUENCIA').AsInteger   := tbdetalhes.RecordCount;
          dm_rc.fdqrypontos.FindField('NUMERO').AsInteger      := FDQryCad.FindField('CODIGO').AsInteger;
          dm_rc.fdqrypontos.FindField('DATA').AsDateTime       := FDQryCad.FindField('EMISSAO').AsDateTime;
          dm_rc.fdqrypontos.FindField('TIPO').AsString         := 'ENTRADA';
          dm_rc.fdqrypontos.FindField('SERIE').AsString        := 'BEN';
          dm_rc.fdqrypontos.FindField('CANCELADA').AsString    := 'A';

          dm_rc.fdqrypontos.FindField('DOCUMENTO').AsInteger   := 100;
          dm_rc.fdqrypontos.FindField('PESSOA').AsInteger      := 99999;
          dm_rc.fdqrypontos.FindField('OPERACAO').AsInteger    := 8888;

          dm_rc.fdqrypontos.FindField('PRODUTO').AsInteger     := tbdetalhes.FindField('PRODUTO').AsInteger;
          dm_rc.fdqrypontos.FindField('DESCRICAO').AsString    := tbdetalhes.FindField('DESCRICAO').AsString;
          dm_rc.fdqrypontos.FindField('SAFRACAMPO').AsString   := tbdetalhes.FindField('SAFRACAMPO').AsString;
          dm_rc.fdqrypontos.FindField('BOLETIM').AsString      := tbdetalhes.FindField('BOLETIMDESTINO').AsString;
          dm_rc.fdqrypontos.FindField('TERMO').AsString        := tbdetalhes.FindField('TERMO').AsString;
          dm_rc.fdqrypontos.FindField('CATEGORIA').AsString    := tbdetalhes.FindField('CATEGORIA').AsString;
          dm_rc.fdqrypontos.FindField('COOPERANTE').AsInteger  := tbdetalhes.FindField('COOPERANTE').AsInteger;
          dm_rc.fdqrypontos.FindField('QUANTIDADE').AsFloat    := tbdetalhes.FindField('QUANTIDADE').AsFloat;
          dm_rc.fdqrypontos.FindField('GERMINACAO').AsFloat    := tbdetalhes.FindField('GERMINACAO').AsFloat;
          dm_rc.fdqrypontos.FindField('DESCARTE').AsFloat      := tbdetalhes.FindField('DESCARTE').AsFloat;
          dm_rc.fdqrypontos.FindField('PUREZA').AsFloat        := tbdetalhes.FindField('PUREZA').AsFloat;
          dm_rc.fdqrypontos.FindField('SEQLOTE').AsInteger     := Sequencia_Lote(tbdetalhes.FindField('LOTEDESTINO').AsString,
                                                                                 tbdetalhes.FindField('BOLETIMDESTINO').AsString,
                                                                                 tbdetalhes.FindField('PRODUTO').AsInteger,mm.varI_Code_Company);
          dm_rc.fdqrypontos.FindField('LOTESEMENTE').AsString  := tbdetalhes.FindField('LOTEDESTINO').AsString;
          dm_rc.fdqrypontos.FindField('VALORCULTURAL').AsFloat := tbdetalhes.findfield('VALORCULTURAL').AsFloat;
          dm_rc.fdqrypontos.FindField('KEY').AsString          := Gera_Guid();
          dm_rc.fdqrypontos.FindField('CODIGO').AsInteger      := Ultimo_Codigo('PONTOS','CODIGO',True);
          dm_rc.fdqrypontos.Post;

          if tbdetalhes.FindField('DESCARTE').AsFloat > 0  then
            begin
              dm_rc.fdqrypontos.Append;
              dm_rc.fdqrypontos.FindField('EMPRESA').AsInteger     := mm.varI_Code_Company;
              dm_rc.fdqrypontos.FindField('SEQUENCIA').AsInteger   := tbdetalhes.RecordCount;
              dm_rc.fdqrypontos.FindField('NUMERO').AsInteger      := FDQryCad.FindField('CODIGO').AsInteger;
              dm_rc.fdqrypontos.FindField('DATA').AsDateTime       := FDQryCad.FindField('EMISSAO').AsDateTime;
              dm_rc.fdqrypontos.FindField('TIPO').AsString         := 'SAIDA';
              dm_rc.fdqrypontos.FindField('SERIE').AsString        := 'BEN';
              dm_rc.fdqrypontos.FindField('CANCELADA').AsString    := 'A';

              dm_rc.fdqrypontos.FindField('DOCUMENTO').AsInteger   := 100;
              dm_rc.fdqrypontos.FindField('PESSOA').AsInteger      := 99999;
              dm_rc.fdqrypontos.FindField('OPERACAO').AsInteger    := 8881;

              dm_rc.fdqrypontos.FindField('PRODUTO').AsInteger     := tbdetalhes.FindField('PRODUTO').AsInteger;
              dm_rc.fdqrypontos.FindField('DESCRICAO').AsString    := tbdetalhes.FindField('DESCRICAO').AsString;
              dm_rc.fdqrypontos.FindField('SAFRACAMPO').AsString   := tbdetalhes.FindField('SAFRACAMPO').AsString;

//              dm_rc.fdqrypontos.FindField('BOLETIM').AsString      := tbdetalhes.FindField('BOLETIMDESTINO').AsString;
//              dm_rc.fdqrypontos.FindField('TERMO').AsString        := tbdetalhes.FindField('TERMO').AsString;
//              dm_rc.fdqrypontos.FindField('LOTESEMENTE').AsString  := tbdetalhes.FindField('LOTEDESTINO').AsString;
//              dm_rc.fdqrypontos.FindField('GERMINACAO').AsFloat    := tbdetalhes.FindField('GERMINACAO').AsFloat;
//              dm_rc.fdqrypontos.FindField('VALORCULTURAL').AsFloat := tbdetalhes.findfield('VALORCULTURAL').AsFloat;
//              dm_rc.fdqrypontos.FindField('PUREZA').AsFloat        := tbdetalhes.FindField('PUREZA').AsFloat;

              dm_rc.fdqrypontos.FindField('CATEGORIA').AsString    := tbdetalhes.FindField('CATEGORIA').AsString;
              dm_rc.fdqrypontos.FindField('COOPERANTE').AsInteger  := tbdetalhes.FindField('COOPERANTE').AsInteger;
              dm_rc.fdqrypontos.FindField('QUANTIDADE').AsFloat    := tbdetalhes.FindField('DESCARTE').AsFloat;
              dm_rc.fdqrypontos.FindField('SEQLOTE').AsInteger     := 0;
              dm_rc.fdqrypontos.FindField('KEY').AsString          := Gera_Guid();
              dm_rc.fdqrypontos.FindField('CODIGO').AsInteger      := Ultimo_Codigo('PONTOS','CODIGO',True);
              dm_rc.fdqrypontos.Post;
            end;
          //********************************************************************************************************//

          //********************************************************************************************************//
          // CALCULOS DO SISTEMA
          //********************************************************************************************************//
          Calcula_Lote(mm.varI_Code_Company,
                       dm_rc.fdqrybeneitens.FindField('PRODUTO').AsInteger,
                       dm_rc.fdqrybeneitens.FindField('LOTEDESTINO').AsString,
                       dm_rc.fdqrybeneitens.FindField('BOLETIMDESTINO').AsString,
                       dm_rc.fdqrybeneitens.FindField('TERMO').AsString,
                       '');

          Saldo_Beneficiamento('GRAVA',
                               dm_rc.fdqrybeneitens.FindField('SERIE').AsString,
                               dm_rc.fdqrybeneitens.FindField('NOTA').AsInteger,
                               dm_rc.fdqrybeneitens.FindField('PRODUTO').AsInteger,
                               dm_rc.fdqrybeneitens.FindField('SEQUENCIA').AsInteger,
                               mm.varI_Code_Company);

        end;
      tbdetalhes.Next;
    end;
end;

procedure TfrmCRUDPROPRIO.gravacampoitens(const f_mestre: integer);
begin
  executasql      ('delete   from campoitens where numero =  ' + IntToStr(f_mestre));
  TabelaCampoitens('select * from campoitens where codigo = 0');

  tbdetalhes.First;
  while not tbdetalhes.Eof do
    begin
      if tbdetalhes.FindField('PRODUTO').AsInteger > 0 then
        begin
          dm_rc.fdqrycampoitens.Append;
          dm_rc.fdqrycampoitens.FindField('KEY').AsString           := Gera_Guid;
          dm_rc.fdqrycampoitens.FindField('CODIGO').AsInteger       := Ultimo_Codigo('CAMPOITENS','CODIGO',True);
          dm_rc.fdqrycampoitens.FindField('NUMERO').AsInteger       := f_mestre;
          dm_rc.fdqrycampoitens.FindField('SEQUENCIA').AsInteger    := tbdetalhes.RecNo;
          dm_rc.fdqrycampoitens.FindField('PRODUTO').AsInteger      := tbdetalhes.FindField('PRODUTO').AsInteger;
          dm_rc.fdqrycampoitens.FindField('CULTIVAR').AsString      := tbdetalhes.FindField('CULTIVAR').AsString;
          dm_rc.fdqrycampoitens.FindField('COOPERANTE').AsInteger   := tbdetalhes.FindField('COOPERANTE').AsInteger;
          dm_rc.fdqrycampoitens.FindField('DATA').AsDateTime        := tbdetalhes.FindField('DATA').AsDateTime;
          dm_rc.fdqrycampoitens.FindField('LONGITUDE').AsString     := tbdetalhes.FindField('LONGITUDE').AsString;
          dm_rc.fdqrycampoitens.FindField('LATITUDE').AsString      := tbdetalhes.FindField('LATITUDE').AsString;
          dm_rc.fdqrycampoitens.FindField('AREA').AsFloat           := tbdetalhes.FindField('AREA').AsFloat;
          dm_rc.fdqrycampoitens.FindField('PRODUCAO').AsFloat       := tbdetalhes.FindField('PRODUCAO').AsFloat;
          dm_rc.fdqrycampoitens.FindField('SAFRACAMPO').AsString    := tbdetalhes.FindField('SAFRACAMPO').AsString;
          dm_rc.fdqrycampoitens.Post;
        end;
      tbdetalhes.Next;
    end;
end;

procedure TfrmCRUDPROPRIO.gravacustoloteinterno(const f_mestre: integer);
begin
  executasql                 ('delete   from CUSTO_LOTEINTERNOITENS where MESTRE_ID =  ' + IntToStr(f_mestre));
  TabelaCustoLoteinternoItens('select * from CUSTO_LOTEINTERNOITENS where codigo    = 0');

  tbdetalhes.First;
  while not tbdetalhes.Eof do
    begin
      if tbdetalhes.FindField('DESCRICAO').AsString <> '' then
        begin
          dm_rc.fdqrycustoloteinternoitens.Append;
          dm_rc.fdqrycustoloteinternoitens.FindField('MESTRE_ID').AsInteger    := f_mestre;
          dm_rc.fdqrycustoloteinternoitens.FindField('SEQUENCIA').AsInteger    := tbdetalhes.RecNo;
          dm_rc.fdqrycustoloteinternoitens.FindField('DESCRICAO').AsString     := UpperCase(tbdetalhes.FindField('DESCRICAO').AsString);
          dm_rc.fdqrycustoloteinternoitens.FindField('CUSTO').AsCurrency       := tbdetalhes.FindField('CUSTO').AsCurrency;
          dm_rc.fdqrycustoloteinternoitens.FindField('PERC').AsCurrency        := tbdetalhes.FindField('PERC').AsCurrency;
          dm_rc.fdqrycustoloteinternoitens.FindField('KEY').AsString           := Gera_Guid;
          dm_rc.fdqrycustoloteinternoitens.FindField('CODIGO').AsInteger       := Ultimo_Codigo('CUSTO_LOTEINTERNOITENS','CODIGO',True);
          dm_rc.fdqrycustoloteinternoitens.Post;
        end;
      tbdetalhes.Next;
    end;
  tbdetalhes.First;
end;

procedure TfrmCRUDPROPRIO.gravaproducaoitens(const f_mestre: integer);
begin
  executasql                  ('delete   from MANUTENCAOLOTE_INTERNO where MESTRE_PRODUCAO =  ' + IntToStr(f_mestre));
  executasql                  ('delete   from PRODUCAOINTERNA_ITENS  where mestre_id       =  ' + IntToStr(f_mestre));

  TabelaProducaoItens         ('select * from PRODUCAOINTERNA_ITENS  where codigo    = 0');
  TabelaManutencaoLoteProducao('select * from MANUTENCAOLOTE_INTERNO where codigo    = 0');

  tbdetalhes.DisableControls;
  tbdetalhes.First;
  while not tbdetalhes.Eof do
    begin
      if tbdetalhes.findfield('LOTE').AsString <> '' then
        begin
          dm_rc.fdqryproducaointernaitens.Append;
          dm_rc.fdqryproducaointernaitens.Findfield('MESTRE_ID').AsInteger      := f_mestre;
          dm_rc.fdqryproducaointernaitens.Findfield('KEY').AsString             := Gera_Guid();
          dm_rc.fdqryproducaointernaitens.Findfield('EMPRESA').AsInteger        := MM.varI_Code_Company;
          dm_rc.fdqryproducaointernaitens.Findfield('SEQUENCIA').AsInteger      := tbdetalhes.RecNo;
          dm_rc.fdqryproducaointernaitens.Findfield('DOCUMENTO').AsInteger      := 70;
          dm_rc.fdqryproducaointernaitens.Findfield('CODIGO').AsInteger         := Ultimo_Codigo('PRODUCAOINTERNA_ITENS','CODIGO',False);
          dm_rc.fdqryproducaointernaitens.Findfield('PRODUTO').AsInteger        := tbdetalhes.FindField('PRODUTO').AsInteger;
          dm_rc.fdqryproducaointernaitens.Findfield('DESCRICAO').AsString       := tbdetalhes.FindField('DESCRICAO').AsString;
          dm_rc.fdqryproducaointernaitens.Findfield('QUANTIDADE').AsFloat       := tbdetalhes.FindField('QUANTIDADE').AsFloat;
          dm_rc.fdqryproducaointernaitens.FindField('LOTE').AsString            := tbdetalhes.Findfield('LOTE').AsString;
          dm_rc.fdqryproducaointernaitens.Findfield('EMISSAO').AsDateTime       := FDQryCad.FindField('EMISSAO').AsDateTime;
          dm_rc.fdqryproducaointernaitens.Findfield('CUSTO_UNITARIO').AsCurrency:= tbdetalhes.FindField('CUSTO_UNITARIO').AsCurrency;
          dm_rc.fdqryproducaointernaitens.Findfield('TOTAL_CUSTO').AsCurrency   := tbdetalhes.FindField('TOTAL_CUSTO').AsCurrency;
          dm_rc.fdqryproducaointernaitens.Findfield('CUSTO_PONTO').AsCurrency   := tbdetalhes.FindField('CUSTO_PONTO').AsCurrency;
          dm_rc.fdqryproducaointernaitens.Findfield('TOTAL_PONTO').AsCurrency   := tbdetalhes.FindField('TOTAL_PONTO').AsCurrency;
          dm_rc.fdqryproducaointernaitens.Findfield('PONTOS').AsFloat           := tbdetalhes.FindField('PONTOS').AsFloat;
          dm_rc.fdqryproducaointernaitens.Findfield('PUREZA').AsFloat           := tbdetalhes.FindField('PUREZA').AsFloat;
          dm_rc.fdqryproducaointernaitens.Findfield('PERC').AsFloat             := StrToFloat(tbdetalhes.FindField('PERC').AsString);
          dm_rc.fdqryproducaointernaitens.Post;

          dm_rc.FDQuerymanutencaolote_interno.Append;
          dm_rc.FDQuerymanutencaolote_interno.Findfield('MESTRE_PRODUCAO').AsInteger := f_mestre;
          dm_rc.FDQuerymanutencaolote_interno.Findfield('KEY').AsString              := Gera_Guid();
          dm_rc.FDQuerymanutencaolote_interno.Findfield('EMPRESA').AsInteger         := MM.varI_Code_Company;
          dm_rc.FDQuerymanutencaolote_interno.Findfield('SEQUENCIA').AsInteger       := tbdetalhes.RecNo;
          dm_rc.FDQuerymanutencaolote_interno.Findfield('ATIVO').AsString            := 'T';
          dm_rc.FDQuerymanutencaolote_interno.Findfield('EMISSAO').AsDateTime        := FDQryCad.FindField('EMISSAO').AsDateTime;
          dm_rc.FDQuerymanutencaolote_interno.Findfield('DOCUMENTO').AsInteger       := 70;
          dm_rc.FDQuerymanutencaolote_interno.Findfield('NUMERO').AsInteger          := FDQryCad.FindField('NUMERO').AsInteger;
          dm_rc.FDQuerymanutencaolote_interno.Findfield('PESOSACO').AsFloat          := FDQryCad.FindField('PESOSACO').AsFloat;
          dm_rc.FDQuerymanutencaolote_interno.Findfield('CODIGO').AsInteger          := Ultimo_Codigo('MANUTENCAOLOTE_INTERNO','CODIGO',False);
          dm_rc.FDQuerymanutencaolote_interno.Findfield('PRODUTO').AsInteger         := tbdetalhes.FindField('PRODUTO').AsInteger;
          dm_rc.FDQuerymanutencaolote_interno.Findfield('DESCRICAO').AsString        := tbdetalhes.FindField('DESCRICAO').AsString;
          dm_rc.FDQuerymanutencaolote_interno.Findfield('TIPO').AsString             := 'SAIDA';
          dm_rc.FDQuerymanutencaolote_interno.Findfield('QUANTIDADE').AsFloat        := tbdetalhes.FindField('QUANTIDADE').AsFloat;
          dm_rc.FDQuerymanutencaolote_interno.Findfield('PUREZA').AsFloat            := tbdetalhes.FindField('PUREZA').AsFloat;
          dm_rc.FDQuerymanutencaolote_interno.Findfield('TOTALPONTOS').AsFloat       := tbdetalhes.FindField('PONTOS').AsFloat;
          dm_rc.FDQuerymanutencaolote_interno.Findfield('CUSTO_UNITARIO').AsCurrency := tbdetalhes.FindField('CUSTO_UNITARIO').AsCurrency;
          dm_rc.FDQuerymanutencaolote_interno.Findfield('TOTAL_CUSTO').AsCurrency    := tbdetalhes.FindField('TOTAL_CUSTO').AsCurrency;
          dm_rc.FDQuerymanutencaolote_interno.Findfield('CUSTO_PONTO').AsCurrency    := tbdetalhes.FindField('CUSTO_PONTO').AsCurrency;
          dm_rc.FDQuerymanutencaolote_interno.Findfield('TOTAL_PONTO').AsCurrency    := tbdetalhes.FindField('TOTAL_PONTO').AsCurrency;
          dm_rc.FDQuerymanutencaolote_interno.FindField('LOTE').AsString             := tbdetalhes.Findfield('LOTE').AsString;
          dm_rc.FDQuerymanutencaolote_interno.Post;

          CalculaLoteInterno (mm.varI_Code_Company,
                              tbdetalhes.FindField('PRODUTO').AsInteger,
                              tbdetalhes.Findfield('LOTE').AsString);
        end;
      tbdetalhes.Next;
    end;

   if FDQryCad.FindField('STATUS').AsString = 'Concluido' then
     begin
       //***********************************************************************
       //regista a entrada
       //***********************************************************************
       dm_rc.FDQuerymanutencaolote_interno.Append;
       dm_rc.FDQuerymanutencaolote_interno.Findfield('MESTRE_PRODUCAO').AsInteger := f_mestre;
       dm_rc.FDQuerymanutencaolote_interno.Findfield('KEY').AsString              := Gera_Guid();
       dm_rc.FDQuerymanutencaolote_interno.Findfield('EMPRESA').AsInteger         := MM.varI_Code_Company;
       dm_rc.FDQuerymanutencaolote_interno.Findfield('ATIVO').AsString            := 'T';
       dm_rc.FDQuerymanutencaolote_interno.Findfield('SEQUENCIA').AsInteger       := 1;
       dm_rc.FDQuerymanutencaolote_interno.Findfield('DOCUMENTO').AsInteger       := 70;
       dm_rc.FDQuerymanutencaolote_interno.Findfield('EMISSAO').AsDateTime        := FDQryCad.FindField('EMISSAO').AsDateTime;
       dm_rc.FDQuerymanutencaolote_interno.Findfield('TIPO').AsString             := 'ENTRADA';
       dm_rc.FDQuerymanutencaolote_interno.Findfield('CODIGO').AsInteger          := Ultimo_Codigo('MANUTENCAOLOTE_INTERNO','CODIGO',False);
       dm_rc.FDQuerymanutencaolote_interno.Findfield('NUMERO').AsInteger          := FDQryCad.FindField('NUMERO').AsInteger;
       dm_rc.FDQuerymanutencaolote_interno.Findfield('PRODUTO').AsInteger         := FDQryCad.FindField('PRODUTO').AsInteger;
       dm_rc.FDQuerymanutencaolote_interno.Findfield('DESCRICAO').AsString        := FDQryCad.FindField('DESCRICAO').AsString;
       dm_rc.FDQuerymanutencaolote_interno.FindField('LOTE').AsString             := FDQryCad.Findfield('LOTE').AsString;
       dm_rc.FDQuerymanutencaolote_interno.Findfield('PUREZA').AsFloat            := FDQryCad.FindField('PUREZA').AsFloat;
       dm_rc.FDQuerymanutencaolote_interno.Findfield('QUANTIDADE').AsFloat        := FDQryCad.FindField('TOTALKG').AsFloat;
       dm_rc.FDQuerymanutencaolote_interno.Findfield('TOTALPONTOS').AsFloat       := FDQryCad.FindField('TOTALPONTOS').AsFloat;
       dm_rc.FDQuerymanutencaolote_interno.Post;

       CalculaLoteInterno (mm.varI_Code_Company,
                           FDQryCad.FindField('PRODUTO').AsInteger,
                           FDQryCad.Findfield('LOTE').AsString);
       //***********************************************************************
     end;

  tbdetalhes.First;
  tbdetalhes.EnableControls;
  tbdetalhes.First;
end;

procedure TfrmCRUDPROPRIO.gravaromaneio(const f_mestre: integer);
begin
  executasql          ('delete   from romaneioitens where mestre_id =  ' + IntToStr(f_mestre));
  TabelaRomaneioItens ('select * from romaneioitens where codigo    = 0');

  tbdetalhes.DisableControls;
  tbdetalhes.First;
  while not tbdetalhes.Eof do
    begin
      if tbdetalhes.findfield('NUMERO').AsInteger > 0 then
        begin
          dm_rc.fdqryromaneioitens.Append;
          dm_rc.fdqryromaneioitens.Findfield('MESTRE_ID').AsInteger := f_mestre;
          dm_rc.fdqryromaneioitens.Findfield('KEY').AsString        := Gera_Guid();
          dm_rc.fdqryromaneioitens.Findfield('EMPRESA').AsInteger   := MM.varI_Code_Company;
          dm_rc.fdqryromaneioitens.Findfield('CODIGO').AsInteger    := Ultimo_Codigo('ROMANEIOITENS','CODIGO',False);
          dm_rc.fdqryromaneioitens.Findfield('NUMERO').AsInteger    := tbdetalhes.FindField('NUMERO').AsInteger;
          dm_rc.fdqryromaneioitens.Findfield('PESSOA').AsInteger    := tbdetalhes.FindField('PESSOA').AsInteger;
          dm_rc.fdqryromaneioitens.Findfield('PRODUTO').AsInteger   := tbdetalhes.FindField('PRODUTO').AsInteger;
          dm_rc.fdqryromaneioitens.Findfield('DESCRICAO').AsString  := tbdetalhes.FindField('DESCRICAO').AsString;
          dm_rc.fdqryromaneioitens.Findfield('SERIE').AsString      := tbdetalhes.FindField('SERIE').AsString;
          dm_rc.fdqryromaneioitens.Findfield('SEQUENCIA').AsInteger := tbdetalhes.FindField('SEQUENCIA').AsInteger;
          dm_rc.fdqryromaneioitens.Findfield('DOCUMENTO').AsInteger := tbdetalhes.FindField('DOCUMENTO').AsInteger;
          dm_rc.fdqryromaneioitens.Findfield('SACOS').AsFloat       := tbdetalhes.FindField('SACOS').AsFloat;
          dm_rc.fdqryromaneioitens.Findfield('QUANTIDADE').AsFloat  := tbdetalhes.FindField('QUANTIDADE').AsFloat;
          dm_rc.fdqryromaneioitens.FindField('NOME').AsString       := tbdetalhes.Findfield('NOME').AsString;
          dm_rc.fdqryromaneioitens.Post;
        end;
      tbdetalhes.Next;
    end;

  tbdetalhes.First;
  tbdetalhes.EnableControls;
  tbdetalhes.First;
end;

procedure TfrmCRUDPROPRIO.gravasolicitacao(const f_mestre: integer);
var
  i:integer;
begin
  TabelaSolicitacaoItens ('select * from SOLICITACAO_ITENS where CODIGO   = 0');
  executasql             ('DELETE FROM SOLICITACAO_ITENS WHERE MESTRE_ID  = ' + IntToStr(f_mestre));
  i:= 0;
  tbdetalhes.First;
  while not tbdetalhes.Eof do
    begin
      if tbdetalhes.findfield('LOTE').AsString <> '' then
        begin
          Inc(i);
          dm_rc.fdqrysolicitacaoitens.Append;
          dm_rc.fdqrysolicitacaoitens.FindField('KEY').AsString                 := Gera_Guid();
          dm_rc.fdqrysolicitacaoitens.FindField('CODIGO').AsInteger             := Ultimo_Codigo('SOLICITACAO_ITENS','CODIGO',True);
          dm_rc.fdqrysolicitacaoitens.FindField('EMPRESA').AsInteger            := MM.varI_Code_Company;
          dm_rc.fdqrysolicitacaoitens.FindField('MESTRE_ID').AsInteger          := f_mestre;
          dm_rc.fdqrysolicitacaoitens.FindField('SEQUENCIA').AsInteger          := i;
          dm_rc.fdqrysolicitacaoitens.FindField('ESPECIE').AsString             := tbdetalhes.FindField('ESPECIE').AsString;
          dm_rc.fdqrysolicitacaoitens.FindField('CULTIVAR').AsString            := tbdetalhes.FindField('CULTIVAR').AsString;
          dm_rc.fdqrysolicitacaoitens.FindField('SAFRA').AsString               := tbdetalhes.FindField('SAFRA').AsString;
          dm_rc.fdqrysolicitacaoitens.FindField('CODIGO_LOTE').AsInteger        := tbdetalhes.FindField('CODIGO_LOTE').AsInteger;
          dm_rc.fdqrysolicitacaoitens.FindField('LOTE').AsString                := tbdetalhes.FindField('LOTE').AsString;
          dm_rc.fdqrysolicitacaoitens.FindField('CATEGORIA').AsString           := tbdetalhes.FindField('CATEGORIA').AsString;
          dm_rc.fdqrysolicitacaoitens.FindField('REPRESENTATIVIDADE').AsString  := tbdetalhes.FindField('REPRESENTATIVIDADE').AsString;
          dm_rc.fdqrysolicitacaoitens.FindField('IBGE').AsInteger               := tbdetalhes.FindField('IBGE').AsInteger;
          dm_rc.fdqrysolicitacaoitens.FindField('PROCEDENCIA').AsString         := tbdetalhes.FindField('PROCEDENCIA').AsString;
          dm_rc.fdqrysolicitacaoitens.FindField('ESTADO').AsString              := tbdetalhes.FindField('ESTADO').AsString;
          dm_rc.fdqrysolicitacaoitens.FindField('PENEIRA').AsString             := tbdetalhes.FindField('PENEIRA').AsString;
          dm_rc.fdqrysolicitacaoitens.FindField('DATA_AMOSTRAGEM').AsDateTime   := tbdetalhes.FindField('DATA_AMOSTRAGEM').AsDateTime;
          dm_rc.fdqrysolicitacaoitens.FindField('PESOAMOSTRA').AsFloat          := tbdetalhes.FindField('PESOAMOSTRA').AsFloat;
          dm_rc.fdqrysolicitacaoitens.Post;
        end;
      tbdetalhes.Next;
    end;
  tbdetalhes.First;
end;

procedure TfrmCRUDPROPRIO.HabilitaCombobox(status: boolean);
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

procedure TfrmCRUDPROPRIO.labIMGClick(Sender: TObject);
begin
  inherited;
  if mm.oPgGeneral <> nil then
    mm.oPgGeneral.ActivePage.Close;
end;

procedure TfrmCRUDPROPRIO.CarregaBatidaitens(const f_mestre: integer);
begin
  if TabelaBatidaItens('select * from batidaitens where mestre = ' + IntToStr(f_mestre) + ' order by sequencia') then
    begin
      tbdetalhes.Close;
      tbdetalhes.Open;

      dm_rc.fdqrybatidaitens.First;
      while not dm_rc.fdqrybatidaitens.Eof do
        begin
          tbdetalhes.Append;
          tbdetalhes.FindField('PRODUTO').AsInteger        := dm_rc.fdqrybatidaitens.FindField('PRODUTO').AsInteger;
          tbdetalhes.FindField('DESCRICAO').AsString       := dm_rc.fdqrybatidaitens.FindField('DESCRICAO').AsString;
          tbdetalhes.FindField('SEQUENCIA').AsInteger      := dm_rc.fdqrybatidaitens.FindField('SEQUENCIA').AsInteger;
          tbdetalhes.FindField('QUANTIDADE').AsFloat       := dm_rc.fdqrybatidaitens.FindField('QUANTIDADE').AsFloat;
          tbdetalhes.FindField('EQUIVALENTE').AsFloat      := dm_rc.fdqrybatidaitens.FindField('EQUIVALENCIA').AsFloat;
          tbdetalhes.FindField('CUSTO_UNITARIO').AsFloat   := dm_rc.fdqrybatidaitens.FindField('CUSTO_UNITARIO').AsFloat;
          tbdetalhes.FindField('TIPO').AsString            := dm_rc.fdqrybatidaitens.FindField('TIPO').AsString;
          tbdetalhes.Post;
          dm_rc.fdqrybatidaitens.Next;
        end;
      tbdetalhes.First;
    end;

end;
procedure TfrmCRUDPROPRIO.carregabeneficiamento(const f_mestre:integer);
begin
  tbdetalhes.Close;
  tbdetalhes.open;
  SqlPesquisa('SELECT * FROM BENEITENS WHERE NUMERO = ' + IntToStr(f_mestre));
  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      tbdetalhes.Append;
      tbdetalhes.findfield('NOTA').AsInteger         := dm_rc.sqlBuscas.FindField('NOTA').AsInteger;
      tbdetalhes.findfield('PESSOA').AsInteger       := dm_rc.sqlBuscas.FindField('PESSOA').AsInteger;
      tbdetalhes.findfield('SERIE').AsString         := dm_rc.sqlBuscas.FindField('SERIE').AsString;
      tbdetalhes.findfield('MAQUINA').AsInteger      := dm_rc.sqlBuscas.FindField('MAQUINA').AsInteger;
      tbdetalhes.findfield('PRODUTO').AsInteger      := dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
      tbdetalhes.findfield('DESCRICAO').AsString     := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
      tbdetalhes.findfield('LOTE').AsString          := dm_rc.sqlBuscas.FindField('LOTEORIGEM').AsString;
      tbdetalhes.findfield('TERMO').AsString         := dm_rc.sqlBuscas.FindField('TERMO').AsString;
      tbdetalhes.findfield('QTENOTA').AsFloat        := dm_rc.sqlBuscas.FindField('QTENOTA').AsFloat;
      tbdetalhes.findfield('GERNOTA').AsFloat        := dm_rc.sqlBuscas.FindField('GERNOTA').AsFloat;
      tbdetalhes.findfield('PUREZANOTA').AsFloat     := dm_rc.sqlBuscas.FindField('PUREZANOTA').AsFloat;
      tbdetalhes.findfield('QUANTIDADE').AsFloat     := dm_rc.sqlBuscas.FindField('QUANTIDADE').AsFloat;
      tbdetalhes.findfield('GERMINACAO').AsFloat     := dm_rc.sqlBuscas.FindField('GERMINACAO').AsFloat;
      tbdetalhes.findfield('PUREZA').AsFloat         := dm_rc.sqlBuscas.FindField('PUREZA').AsFloat;
      tbdetalhes.findfield('DESCARTE').AsFloat       := dm_rc.sqlBuscas.FindField('DESCARTE').AsFloat;
      tbdetalhes.findfield('PONTOS').AsFloat         := dm_rc.sqlBuscas.FindField('PONTOS').AsFloat;
      tbdetalhes.findfield('SEQITENS').AsInteger     := dm_rc.sqlBuscas.FindField('SEQITENS').AsInteger;
      tbdetalhes.findfield('DISPONIVEL').AsFloat     := dm_rc.sqlBuscas.FindField('DISPONIVEL').AsFloat;
      tbdetalhes.findfield('LOTEDESTINO').AsString   := dm_rc.sqlBuscas.FindField('LOTEDESTINO').AsString;
      tbdetalhes.findfield('BOLETIMDESTINO').AsString:= dm_rc.sqlBuscas.FindField('BOLETIMDESTINO').AsString;
      tbdetalhes.findfield('LOTE').AsString          := dm_rc.sqlBuscas.FindField('LOTEORIGEM').AsString;
      tbdetalhes.findfield('VALORCULTURAL').AsFloat  := dm_rc.sqlBuscas.FindField('VALORCULTURAL').AsFloat;
      tbdetalhes.findfield('VCNOTA').AsFloat         := dm_rc.sqlBuscas.FindField('VCNOTA').AsFloat;
      tbdetalhes.findfield('COOPERANTE').AsInteger   := dm_rc.sqlBuscas.FindField('COOPERANTE').AsInteger;
      tbdetalhes.findfield('CAMPO').AsString         := dm_rc.sqlBuscas.FindField('CAMPO').AsString;
      tbdetalhes.findfield('SAFRACAMPO').AsString    := dm_rc.sqlBuscas.FindField('SAFRACAMPO').AsString;
//      tbdetalhes.findfield('CATEGORIA').AsString     := dm_rc.sqlBuscas.FindField('CATEGORIA').AsString;
      tbdetalhes.Post;

      dm_rc.sqlBuscas.Next;
    end;
  tbdetalhes.First;
end;

procedure TfrmCRUDPROPRIO.carregacampoitens(const f_mestre: integer);
begin
  tbdetalhes.Close;
  tbdetalhes.open;
  SqlPesquisa('SELECT * FROM CAMPOITENS WHERE NUMERO = ' + IntToStr(f_mestre) + ' order by sequencia');
  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin

      tbdetalhes.Append;
      tbdetalhes.findfield('CAMPO').AsString         := dm_rc.sqlBuscas.FindField('CAMPO').AsString;
      tbdetalhes.findfield('CULTIVAR').AsString      := dm_rc.sqlBuscas.FindField('CULTIVAR').AsString;
      tbdetalhes.findfield('PRODUTO').AsInteger      := dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
      tbdetalhes.findfield('COOPERANTE').AsInteger   := dm_rc.sqlBuscas.FindField('COOPERANTE').AsInteger;
      tbdetalhes.findfield('DATA').AsString          := dm_rc.sqlBuscas.FindField('DATA').AsString;
      tbdetalhes.findfield('LATITUDE').AsString      := dm_rc.sqlBuscas.FindField('LATITUDE').AsString;
      tbdetalhes.findfield('LONGITUDE').AsString     := dm_rc.sqlBuscas.FindField('LONGITUDE').AsString;
      tbdetalhes.findfield('AREA').AsFloat           := dm_rc.sqlBuscas.FindField('AREA').AsFloat;
      tbdetalhes.findfield('PRODUCAO').AsFloat       := dm_rc.sqlBuscas.FindField('PRODUCAO').AsFloat;
      tbdetalhes.findfield('SAFRACAMPO').AsString    := dm_rc.sqlBuscas.FindField('SAFRACAMPO').AsString;
      tbdetalhes.Post;

      dm_rc.sqlBuscas.Next;
    end;
  tbdetalhes.First;
end;

procedure TfrmCRUDPROPRIO.carregacustoloteinterno(const f_mestre: integer);
begin
  tbdetalhes.Close;
  tbdetalhes.open;
  SqlPesquisa('SELECT * FROM CUSTO_LOTEINTERNOITENS WHERE MESTRE_ID = ' + IntToStr(f_mestre) + ' order by sequencia');
  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin

      tbdetalhes.Append;
      tbdetalhes.findfield('DESCRICAO').AsString     := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
      tbdetalhes.findfield('CUSTO').AsCurrency       := dm_rc.sqlBuscas.FindField('CUSTO').AsCurrency;
      tbdetalhes.findfield('PERC').AsCurrency        := dm_rc.sqlBuscas.FindField('PERC').AsCurrency;
      tbdetalhes.Post;

      dm_rc.sqlBuscas.Next;
    end;
  tbdetalhes.First;
end;

procedure TfrmCRUDPROPRIO.carregadados(const f_mestre: integer);
var
  i   : integer;
  Cmp : string;
begin
  FDQryCad.Close;
  for i := 0 to  FDQryCad.Params.Count - 1 do
  begin
    Cmp :=  FDQryCad.Params[i].Name;
    FDQryCad.Params[i].Value :=  f_mestre;
  end;
  FDQryCad.Open;
end;

procedure TfrmCRUDPROPRIO.carregaproducaoitens(const f_mestre: integer);
begin
  tbdetalhes.Close;
  tbdetalhes.open;
  tbdetalhes.DisableControls;
  SqlPesquisa('SELECT * FROM PRODUCAOINTERNA_ITENS WHERE MESTRE_ID = ' + IntToStr(f_mestre) + ' order by sequencia');

  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      SqlPesquisaPrimeira(' SELECT * FROM LOTEINTERNO WHERE LOTE = ' + QuotedStr(dm_rc.sqlBuscas.Findfield('LOTE').AsString) +
                          ' AND PRODUTO                          = ' + IntToStr(dm_rc.sqlBuscas.Findfield('PRODUTO').AsInteger));

      tbdetalhes.Append;
      tbdetalhes.FindField('LOTE').AsString            := dm_rc.sqlBuscas.Findfield('LOTE').AsString;
      tbdetalhes.FindField('PRODUTO').AsInteger        := dm_rc.sqlBuscas.Findfield('PRODUTO').AsInteger;
      tbdetalhes.FindField('DESCRICAO').AsString       := dm_rc.sqlBuscas.Findfield('DESCRICAO').AsString;
      tbdetalhes.FindField('SEQUENCIA').AsInteger      := dm_rc.sqlBuscas.Findfield('SEQUENCIA').AsInteger;
      tbdetalhes.FindField('QUANTIDADE').AsFloat       := dm_rc.sqlBuscas.Findfield('QUANTIDADE').AsFloat;
      tbdetalhes.FindField('CUSTO_UNITARIO').AsCurrency:= dm_rc.sqlBuscas.Findfield('CUSTO_UNITARIO').AsCurrency;
      tbdetalhes.FindField('TOTAL_CUSTO').AsCurrency   := dm_rc.sqlBuscas.Findfield('TOTAL_CUSTO').AsCurrency;
      tbdetalhes.FindField('TOTAL_PONTO').AsCurrency   := dm_rc.sqlBuscas.Findfield('TOTAL_PONTO').AsCurrency;
      tbdetalhes.FindField('CUSTO_PONTO').AsCurrency   := dm_rc.sqlBuscas.Findfield('CUSTO_PONTO').AsCurrency;
      tbdetalhes.FindField('PUREZA').AsFloat           := dm_rc.sqlBuscas.Findfield('PUREZA').AsFloat;
      tbdetalhes.FindField('PONTOS').AsFloat           := dm_rc.sqlBuscas.Findfield('PONTOS').AsFloat;
      tbdetalhes.FindField('TIPO').AsString            := dm_rc.sqlpesquisaprimaria.Findfield('TIPO').AsString;
      tbdetalhes.FindField('PERC').AsString            := FloatToStr(dm_rc.sqlBuscas.Findfield('PERC').AsFloat);
      tbdetalhes.Post;

      dm_rc.sqlBuscas.Next;
    end;

  tbdetalhes.First;
  tbdetalhes.EnableControls;
  tbdetalhes.First;
end;

procedure TfrmCRUDPROPRIO.carregaromaneio(const f_mestre: integer);
begin
  tbdetalhes.Close;
  tbdetalhes.open;
  tbdetalhes.DisableControls;
  SqlPesquisa('SELECT * FROM ROMANEIOITENS WHERE MESTRE_ID = ' + IntToStr(f_mestre));

  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      tbdetalhes.Append;
      tbdetalhes.FindField('NUMERO').AsInteger    := dm_rc.sqlBuscas.Findfield('NUMERO').AsInteger;
      tbdetalhes.FindField('PESSOA').AsInteger    := dm_rc.sqlBuscas.Findfield('PESSOA').AsInteger;
      tbdetalhes.FindField('PRODUTO').AsInteger   := dm_rc.sqlBuscas.Findfield('PRODUTO').AsInteger;
      tbdetalhes.FindField('DESCRICAO').AsString  := dm_rc.sqlBuscas.Findfield('DESCRICAO').AsString;
      tbdetalhes.FindField('SERIE').AsString      := dm_rc.sqlBuscas.Findfield('SERIE').AsString;
      tbdetalhes.FindField('SEQUENCIA').AsInteger := dm_rc.sqlBuscas.Findfield('SEQUENCIA').AsInteger;
      tbdetalhes.FindField('DOCUMENTO').AsInteger := dm_rc.sqlBuscas.Findfield('DOCUMENTO').AsInteger;
      tbdetalhes.FindField('SACOS').AsFloat       := dm_rc.sqlBuscas.Findfield('SACOS').AsFloat;
      tbdetalhes.FindField('QUANTIDADE').AsFloat  := dm_rc.sqlBuscas.Findfield('QUANTIDADE').AsFloat;
      tbdetalhes.Findfield('NOME').AsString       := dm_rc.sqlBuscas.FindField('NOME').AsString;
      tbdetalhes.Post;

      dm_rc.sqlBuscas.Next;
    end;

  tbdetalhes.First;
  tbdetalhes.EnableControls;
  tbdetalhes.First;
end;

procedure TfrmCRUDPROPRIO.carregasolicitacao(const f_mestre: integer);
begin
  tbdetalhes.Close;
  tbdetalhes.open;
  SqlPesquisa('SELECT * FROM SOLICITACAO_ITENS WHERE MESTRE_ID = ' + IntToStr(f_mestre) + ' ORDER BY SEQUENCIA');
  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      tbdetalhes.Append;
      tbdetalhes.findfield('ESPECIE').AsString              := dm_rc.sqlBuscas.FindField('ESPECIE').AsString;
      tbdetalhes.findfield('CULTIVAR').AsString             := dm_rc.sqlBuscas.FindField('CULTIVAR').AsString;
      tbdetalhes.findfield('SAFRA').AsString                := dm_rc.sqlBuscas.FindField('SAFRA').AsString;
      tbdetalhes.findfield('CODIGO_LOTE').AsInteger         := dm_rc.sqlBuscas.FindField('CODIGO_LOTE').AsInteger;
      tbdetalhes.findfield('LOTE').AsString                 := dm_rc.sqlBuscas.FindField('LOTE').AsString;
      tbdetalhes.findfield('CATEGORIA').AsString            := dm_rc.sqlBuscas.FindField('CATEGORIA').AsString;
      tbdetalhes.findfield('REPRESENTATIVIDADE').AsString   := dm_rc.sqlBuscas.FindField('REPRESENTATIVIDADE').AsString;
      tbdetalhes.findfield('IBGE').AsInteger                := dm_rc.sqlBuscas.FindField('IBGE').AsInteger;
      tbdetalhes.findfield('PROCEDENCIA').AsString          := dm_rc.sqlBuscas.FindField('PROCEDENCIA').AsString;
      tbdetalhes.findfield('ESTADO').AsString               := dm_rc.sqlBuscas.FindField('ESTADO').AsString;
      tbdetalhes.findfield('DATA_AMOSTRAGEM').AsDateTime    := dm_rc.sqlBuscas.FindField('DATA_AMOSTRAGEM').AsDateTime;
      tbdetalhes.findfield('PESOAMOSTRA').AsFloat           := dm_rc.sqlBuscas.FindField('PESOAMOSTRA').AsFloat;
      tbdetalhes.Post;

      dm_rc.sqlBuscas.Next;
    end;
end;

procedure TfrmCRUDPROPRIO.MemoGravaLog;
var
  i         : integer;
begin
  UniMemolog.Clear;
  UniMemolog.Lines.Add(DataSetToJsonTXT(FDQryCad));
{
  UniMemolog.Clear;
  for i := 0 to (FDQryCad.FieldCount - 1) do
    UniMemolog.Lines.Add(FDQryCad.Fields[i].DisplayName + ':' + FDQryCad.Fields[i].DisplayText);
    }
end;

procedure TfrmCRUDPROPRIO.SetBut(Acao: TAcaoCrud);
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

procedure TfrmCRUDPROPRIO.UniFrameCreate(Sender: TObject);
begin
  inherited;
  labTitleForm.Caption := '';
  labTitleForm.Caption := FDQryCad.UpdateOptions.UpdateTableName;

  cbxSearchCRUDordem.Clear;
  UniComboBoxCRUDordem.Clear;
  UniComboBoxCRUDordem.Items.Add('Ativo');
  UniComboBoxCRUDordem.Items.Add('Inativo');
  UniComboBoxCRUDordem.Items.Add('Todos');
  UniComboBoxCRUDordem.ItemIndex := 0;

  if FDQryCad.UpdateOptions.UpdateTableName = 'BANCO_REMESSA' then
    begin
      cbxSearchCRUDordem.Items.Add('CODIGO');
      cbxSearchCRUDordem.Items.Add('BANCOS');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;

  if FDQryCad.UpdateOptions.UpdateTableName = 'RECIBOS' then
    begin
      cbxSearchCRUDordem.Items.Add('CODIGO');
      cbxSearchCRUDordem.Items.Add('RECEBI(EMOS)');
      cbxSearchCRUDordem.Items.Add('NOME');
      cbxSearchCRUDordem.Items.Add('VALOR');
      cbxSearchCRUDordem.Items.Add('REFERENTE');
      cbxSearchCRUDordem.ItemIndex := 0;
    end;


  if FDQryCad.UpdateOptions.UpdateTableName = 'CUSTO_LOTEINTERNO' then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('DESCRIÇÃO');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;

  if StrContains('SOLICITACAO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('LABORATORIO');
      cbxSearchCRUDordem.Items.Add('REQUERENTE');
      cbxSearchCRUDordem.ItemIndex := 0;
    end;

  if StrContains('PRODUCAOINTERNA#MANUTENCAOLOTE_INTERNO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('LOTE');
      cbxSearchCRUDordem.Items.Add('NUMERO');
      cbxSearchCRUDordem.Items.Add('PRODUTO');
      cbxSearchCRUDordem.Items.Add('PROD DESCRIÇÃO');
      cbxSearchCRUDordem.ItemIndex := 2;
    end;

  if StrContains('LOTEINTERNO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('LOTE');
      cbxSearchCRUDordem.Items.Add('POSIÇÃO');
      cbxSearchCRUDordem.Items.Add('PRODUTO');
      cbxSearchCRUDordem.Items.Add('PROD DESCRIÇÃO');
      cbxSearchCRUDordem.ItemIndex := 1;
      UniComboBoxtipo.ItemIndex    := 1;
    end;

  if StrContains('CIDADES',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('DESCRIÇÃO');
      cbxSearchCRUDordem.Items.Add('IBGE');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;

  if StrContains('MARCA',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('DESCRIÇÃO');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;

  if StrContains('BARRACAO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('DESCRIÇÃO');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;

  if StrContains('ROMANEIO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('NOME');
      cbxSearchCRUDordem.Items.Add('PLACA');
      cbxSearchCRUDordem.ItemIndex := 0;
    end;

  if StrContains('TABELAICMS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('ORIGEM');
      cbxSearchCRUDordem.Items.Add('DESTINO');
      cbxSearchCRUDordem.Items.Add('PORCENTAGEM');
      cbxSearchCRUDordem.ItemIndex := 2;
    end;

  if StrContains('CAMPO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('COOPERANTE');
      cbxSearchCRUDordem.Items.Add('NOME');
      cbxSearchCRUDordem.Items.Add('SAFRA');
      cbxSearchCRUDordem.ItemIndex := 2;
    end;

  if StrContains('BATIDAMESTRE',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('NUMERO');
      cbxSearchCRUDordem.Items.Add('PRODUTO');
      cbxSearchCRUDordem.Items.Add('LOTE');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;

  if StrContains('PESSOAS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('NOME');
      cbxSearchCRUDordem.Items.Add('FANTASIA');
      cbxSearchCRUDordem.Items.Add('CPF/CNPJ');
      cbxSearchCRUDordem.Items.Add('ENDEREÇO');
      cbxSearchCRUDordem.Items.Add('CIDADE');
      cbxSearchCRUDordem.Items.Add('ESTADO');
      cbxSearchCRUDordem.Items.Add('VENDEDOR');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;


  if StrContains('TRANSPORTES#EMPRESAS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('NOME');
      cbxSearchCRUDordem.Items.Add('FANTASIA');
      cbxSearchCRUDordem.Items.Add('CPF/CNPJ');
      cbxSearchCRUDordem.Items.Add('ENDEREÇO');
      cbxSearchCRUDordem.Items.Add('CIDADE');
      cbxSearchCRUDordem.Items.Add('ESTADO');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;

  if StrContains('FUNCIONARIOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('NOME');
      cbxSearchCRUDordem.Items.Add('TIPO');
      cbxSearchCRUDordem.Items.Add('DEPARTAMENTO');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;

  if StrContains('PRODUTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('DESCRIÇÃO');
      cbxSearchCRUDordem.Items.Add('NOME ESPÉCIE');
      cbxSearchCRUDordem.Items.Add('CULTIVAR');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;


  if StrContains('SEMENTES',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CODIGO');
      cbxSearchCRUDordem.Items.Add('LOTE');
      cbxSearchCRUDordem.Items.Add('BOLETIM');
      cbxSearchCRUDordem.Items.Add('TERMO');
      cbxSearchCRUDordem.Items.Add('CULTIVAR');
      cbxSearchCRUDordem.Items.Add('PRODUTO');
      cbxSearchCRUDordem.Items.Add('SAFRA');

      cbxSearchCRUDordem.ItemIndex := 0;
    end;


  if StrContains('LABORATORIO#RESPONSAVEL',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('NOME');
      cbxSearchCRUDordem.Items.Add('CIDADE');
      cbxSearchCRUDordem.Items.Add('ESTADO');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;


  if StrContains('TOLERANCIA',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('ESPECIE');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;

  if StrContains('PROBABILIDADE',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('BASE');
      cbxSearchCRUDordem.Items.Add('MEDIA');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;


  if StrContains('OPERACOES',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('DESCRIÇÃO');
      cbxSearchCRUDordem.Items.Add('REFERÊNCIA');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;


  if StrContains('PLANOCONTAS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('PLANO');
      cbxSearchCRUDordem.Items.Add('DESCRIÇÃO');
      cbxSearchCRUDordem.ItemIndex := 2;
    end;


  if StrContains('CATEGORIA#PENEIRA#PRAGAS#BALANCAS#HISTORICO#CARTEIRA#CONDICOES#ESCRITAS#PARAMETROSOPERACAO#PORTADORES#REGIAO#MEDIDAS#CENTROCUSTO#'+
                 'DOCUMENTOS#APLICACAO#GRUPOS#GERMINADOR#GRUPOSESPECIE',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('DESCRIÇÃO');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;

  if StrContains('ESPECIE',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('NOME ESPECIE');
      cbxSearchCRUDordem.Items.Add('POPULAR');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;

  if StrContains('CULTIVAR',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('CULTIVAR');
      cbxSearchCRUDordem.ItemIndex := 1;
    end;

  if StrContains('PONTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('NUMERO');
      cbxSearchCRUDordem.Items.Add('LOTE');
      cbxSearchCRUDordem.Items.Add('TERMO');
      cbxSearchCRUDordem.Items.Add('BOLETIM');
      cbxSearchCRUDordem.Items.Add('PRODUTO');
      cbxSearchCRUDordem.Items.Add('DESCRIÇÃO PRODUTO');
      cbxSearchCRUDordem.ItemIndex := 2;
    end;

  if StrContains('PONTOS',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CÓDIGO');
      cbxSearchCRUDordem.Items.Add('NUMERO');
      cbxSearchCRUDordem.Items.Add('LOTE');
      cbxSearchCRUDordem.Items.Add('TERMO');
      cbxSearchCRUDordem.Items.Add('BOLETIM');
      cbxSearchCRUDordem.Items.Add('PRODUTO');
      cbxSearchCRUDordem.Items.Add('DESCRIÇÃO PRODUTO');
      cbxSearchCRUDordem.ItemIndex := 2;
    end;

  if StrContains('BENEFICIAMENTO',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('NUMERO');
      cbxSearchCRUDordem.Items.Add('EMISSÃO');
      cbxSearchCRUDordem.ItemIndex := 0;
    end;

  if StrContains('MENUSISTEMA',FDQryCad.UpdateOptions.UpdateTableName) then
    begin
      cbxSearchCRUDordem.Items.Add('CODIGO');
      cbxSearchCRUDordem.Items.Add('MENU');
      cbxSearchCRUDordem.Items.Add('TABELA');
      cbxSearchCRUDordem.ItemIndex := 2;
    end;

  HabilitaCombobox(True);
  ativabusca();
  btnSearchCRUD.OnClick(Self);
end;

procedure TfrmCRUDPROPRIO.VerificaEdicao;
begin
  if  FDQryCad.State in [dsEdit,dsInsert] then
     begin
       dm_rc.rc_ShowSweetAlert('ATENÇÃO','REGISTRO AINDA ESTA EM ABERTO - CANCELE OU SALVE', 'error' , false );
       pgBaseCadControl.ActivePage := tabRegister;
       abort ;
     end;
end;

end.
