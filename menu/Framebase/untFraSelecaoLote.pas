unit untFraSelecaoLote;
interface
uses System.SysUtils, System.Classes, Vcl.Controls, Vcl.Forms,
  uniGUIBaseClasses, uniGUIClasses, uniGUIFrame, uniPanel, uniLabel,
  uniEdit, uniButton, FireDAC.Comp.Client, Data.DB;
type
  TfraSelecaoLote = class(TUniFrame)
    paConteudo: TUniContainerPanel;
    labTitulo: TUniLabel;
    labProduto: TUniLabel;
    labLote: TUniLabel;
    edLote: TUniEdit;
    btnPesquisar: TUniButton;
    labAnalise: TUniLabel;
    labPureza: TUniLabel;
    labGerminacao: TUniLabel;
    labVC: TUniLabel;
    edPureza: TUniEdit;
    edGerminacao: TUniEdit;
    edVC: TUniEdit;
    labTermo: TUniLabel;
    labBoletim: TUniLabel;
    edTermo: TUniEdit;
    edBoletim: TUniEdit;
    labMensagem: TUniLabel;
    paAcoes: TUniContainerPanel;
    btnCancelar: TUniButton;
    btnConfirmar: TUniButton;
    procedure PesquisarClick(Sender: TObject);
    procedure LoteExit(Sender: TObject);
    procedure ConfirmarClick(Sender: TObject);
    procedure CancelarClick(Sender: TObject);
  private
    FProduto: Integer;
    FConsulta: TFDQuery;
    FBuscando: Boolean;
    FOnConfirmar, FOnCancelar: TNotifyEvent;
    procedure LimparDetalhes;
    function CarregarLote: Boolean;
  public
    procedure Configurar(AConexao: TFDConnection; AProduto: Integer;
      const ALote: string);
    function LoteSelecionado: string;
    property OnConfirmar: TNotifyEvent read FOnConfirmar write FOnConfirmar;
    property OnCancelar: TNotifyEvent read FOnCancelar write FOnCancelar;
  end;
implementation
{$R *.dfm}
uses MainModule, untfrmPesquisalote;

procedure TfraSelecaoLote.Configurar(AConexao: TFDConnection;
  AProduto: Integer; const ALote: string);
begin
  FProduto := AProduto;
  FConsulta := TFDQuery.Create(Self);
  FConsulta.Connection := AConexao;
  labProduto.Caption := 'Produto ' + IntToStr(AProduto);
  edLote.Text := ALote;
  LimparDetalhes;
  if AProduto <= 0 then
  begin
    labMensagem.Caption := 'Selecione um produto antes de escolher o lote.';
    btnPesquisar.Enabled := False;
    btnConfirmar.Enabled := False;
  end
  else if Trim(ALote) <> '' then CarregarLote;
end;

procedure TfraSelecaoLote.LimparDetalhes;
begin
  edPureza.Clear;
  edGerminacao.Clear;
  edVC.Clear;
  edTermo.Clear;
  edBoletim.Clear;
  labMensagem.Caption := 'Pesquise ou digite o lote e confirme a selecao.';
end;

function TfraSelecaoLote.CarregarLote: Boolean;
begin
  Result := False;
  LimparDetalhes;
  if (FProduto <= 0) or (Trim(edLote.Text) = '') then Exit;
  FConsulta.Close;
  FConsulta.SQL.Text := 'SELECT TERMO, BOLETIM, VALORCULTURAL, ANALISEPURA, ' +
    'GERNORMAIS FROM SEMENTES WHERE PRODUTO = :PRODUTO AND LOTE = :LOTE';
  FConsulta.ParamByName('PRODUTO').AsInteger := FProduto;
  FConsulta.ParamByName('LOTE').AsString := Trim(edLote.Text);
  FConsulta.Open;
  if FConsulta.IsEmpty then
  begin
    labMensagem.Caption := 'Lote nao encontrado para este produto.';
    Exit;
  end;
  edTermo.Text := FConsulta.FieldByName('TERMO').AsString;
  edBoletim.Text := FConsulta.FieldByName('BOLETIM').AsString;
  edPureza.Text := FormatFloat('0.00', FConsulta.FieldByName('ANALISEPURA').AsFloat);
  edGerminacao.Text := FormatFloat('0.00', FConsulta.FieldByName('GERNORMAIS').AsFloat);
  edVC.Text := FormatFloat('0.00', FConsulta.FieldByName('VALORCULTURAL').AsFloat);
  labMensagem.Caption := 'Lote localizado. Confira os dados antes de confirmar.';
  Result := True;
end;

procedure TfraSelecaoLote.PesquisarClick(Sender: TObject);
var
  LoteAnterior, ReferenciaAnterior, BuscaAnterior: string;
begin
  if FBuscando or (FProduto <= 0) then Exit;
  FBuscando := True;
  LoteAnterior := mm.varC_codigo_busca_lote;
  ReferenciaAnterior := mm.varC_referencia_produto;
  BuscaAnterior := mm.varC_referencia_busca;
  mm.varC_referencia_produto := IntToStr(FProduto);
  mm.varC_codigo_busca_lote := edLote.Text;
  mm.Seta_Busca('BUSCALOTE');
  try
    frmpesquisalote.ShowModal(
      procedure(Sender: TComponent; AResult: Integer)
      var Escolhido: string;
      begin
        Escolhido := mm.varC_codigo_busca_lote;
        mm.varC_codigo_busca_lote := LoteAnterior;
        mm.varC_referencia_produto := ReferenciaAnterior;
        mm.varC_referencia_busca := BuscaAnterior;
        FBuscando := False;
        if AResult = mrOK then
        begin
          edLote.Text := Escolhido;
          CarregarLote;
        end;
      end);
  except
    FBuscando := False;
    mm.varC_codigo_busca_lote := LoteAnterior;
    mm.varC_referencia_produto := ReferenciaAnterior;
    mm.varC_referencia_busca := BuscaAnterior;
    raise;
  end;
end;

procedure TfraSelecaoLote.LoteExit(Sender: TObject);
begin
  if not FBuscando then CarregarLote;
end;

function TfraSelecaoLote.LoteSelecionado: string;
begin
  Result := Trim(edLote.Text);
end;

procedure TfraSelecaoLote.ConfirmarClick(Sender: TObject);
begin
  if not CarregarLote then
  begin
    if Trim(edLote.Text) = '' then labMensagem.Caption := 'Informe o lote para continuar.';
    edLote.SetFocus;
    Exit;
  end;
  if Assigned(FOnConfirmar) then FOnConfirmar(Self);
end;

procedure TfraSelecaoLote.CancelarClick(Sender: TObject);
begin
  if Assigned(FOnCancelar) then FOnCancelar(Self);
end;
end.
