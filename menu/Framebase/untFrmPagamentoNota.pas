unit untFrmPagamentoNota;

interface

uses System.SysUtils, System.Classes, Data.DB, Vcl.Controls, Vcl.Forms,
  FireDAC.Comp.Client, FireDAC.Stan.Param, uniGUIBaseClasses, uniGUIClasses,
  uniGUIForm, uniGUIApplication, uniGUIDialogs, uniGUITypes, uniLabel, uniEdit, uniButton, uniDBGrid,
  uniBasicGrid;

type
  TfrmPagamentoNota = class(TUniForm)
    lblNota: TUniLabel;
    lblResumo: TUniLabel;
    lblEntrada: TUniLabel;
    lblAviso: TUniLabel;
    grdHistorico: TUniDBGrid;
    btnFinanceiro: TUniButton;
    btnBoleto: TUniButton;
    btnEmail: TUniButton;
    btnGravar: TUniButton;
    btnReceber: TUniButton;
    btnSair: TUniButton;
    procedure FormCreate(Sender: TObject);
    procedure ValorChange(Sender: TObject);
    procedure GravarClick(Sender: TObject);
    procedure ReceberClick(Sender: TObject);
    procedure FinanceiroClick(Sender: TObject);
    procedure EmailClick(Sender: TObject);
    procedure SairClick(Sender: TObject);
  private
    FConn: TFDConnection;
    FHistorico: TFDQuery;
    FSource: TDataSource;
    FEdits: array[0..11] of TUniFormattedNumberEdit;
    FEmpresa, FNota, FCaixa, FUsuario: Integer;
    FNumero: Integer;
    FSerie: string;
    FTotal, FRecebido, FPendente: Currency;
    FCarregando, FGravando: Boolean;
    FGrupo: string;
    FFinanceiro, FEmail: TNotifyEvent;
    function NovaQuery(const SQL: string): TFDQuery;
    procedure LerNota(Travar: Boolean);
    procedure LerTotais;
    procedure Atualizar;
    procedure Calcular(out Informado, Troco: Currency);
    procedure LimparValores;
  public
    property NotaCodigo: Integer read FNota;
    property Empresa: Integer read FEmpresa;
    property Numero: Integer read FNumero;
    property Serie: string read FSerie;
    procedure Preparar(AConexao: TFDConnection; AEmpresa, ANota, ACaixa,
      AUsuario: Integer);
  end;

procedure AbrirPagamentoNota(AConexao: TFDConnection; AEmpresa, ANota,
  ACaixa, AUsuario: Integer; AFinanceiro: TNotifyEvent = nil; AEmail: TNotifyEvent = nil);

implementation

{$R *.dfm}

uses MainModule, System.UITypes;

const
  Formas: array[0..11] of string = ('Dinheiro','Cheque','Cartao credito',
    'Cartao debito','Cartao loja','Vale alimentacao','Vale refeicao',
    'Vale presente','Vale combustivel','Duplicata','Transferencia/Pix','Outro');

function NovoID: string;
var G: TGUID;
begin
  if CreateGUID(G) <> 0 then
    raise Exception.Create('Nao foi possivel gerar o identificador do recebimento.');
  Result := GUIDToString(G);
end;

function Dinheiro(V: Currency): string;
begin
  Result := FormatCurr('R$ #,##0.00', V);
end;

procedure AbrirPagamentoNota(AConexao: TFDConnection; AEmpresa, ANota,
  ACaixa, AUsuario: Integer; AFinanceiro, AEmail: TNotifyEvent);
var F: TfrmPagamentoNota;
begin
  F := TfrmPagamentoNota(mm.GetFormInstance(TfrmPagamentoNota));
  F.Preparar(AConexao, AEmpresa, ANota, ACaixa, AUsuario);
  F.FFinanceiro := AFinanceiro; F.FEmail := AEmail;
  F.btnFinanceiro.Enabled := Assigned(AFinanceiro);
  F.btnEmail.Enabled := Assigned(AEmail);
  F.ShowModal;
end;

procedure TfrmPagamentoNota.FormCreate(Sender: TObject);
var I: Integer;
begin
  FConn := TFDConnection.Create(Self);
  FConn.LoginPrompt := False;
  FHistorico := TFDQuery.Create(Self);
  FHistorico.Connection := FConn;
  FSource := TDataSource.Create(Self);
  FSource.DataSet := FHistorico;
  grdHistorico.DataSource := FSource;
  for I := 0 to 11 do
    FEdits[I] := TUniFormattedNumberEdit(FindComponent('edValor' + IntToStr(I)));
end;

function TfrmPagamentoNota.NovaQuery(const SQL: string): TFDQuery;
begin
  Result := TFDQuery.Create(nil);
  Result.Connection := FConn;
  Result.SQL.Text := SQL;
end;

procedure TfrmPagamentoNota.Preparar(AConexao: TFDConnection;
  AEmpresa, ANota, ACaixa, AUsuario: Integer);
begin
  if (AConexao = nil) or (AEmpresa <= 0) or (ANota <= 0) or
    (ACaixa <= 0) or (AUsuario <= 0) then
    raise Exception.Create('Informe conexao, empresa, nota salva, caixa e usuario validos.');
  FHistorico.Close;
  FConn.Connected := False;
  FConn.Params.Assign(AConexao.Params);
  FConn.Connected := True;
  FEmpresa := AEmpresa; FNota := ANota; FCaixa := ACaixa; FUsuario := AUsuario;
  FGrupo := NovoID;
  FGravando := False;
  LimparValores;
  Atualizar;
end;

procedure TfrmPagamentoNota.LerNota(Travar: Boolean);
var Q: TFDQuery; S: string;
begin
  S := 'select CODIGO, NUMERO, SERIE, VLRTOTAL, CANCELADA from MVMESTRE ' +
    'where CODIGO = :N and EMPRESA = :E';
  if Travar then S := S + ' with lock';
  Q := NovaQuery(S);
  try
    Q.ParamByName('N').AsInteger := FNota;
    Q.ParamByName('E').AsInteger := FEmpresa;
    Q.Open;
    if Q.IsEmpty then raise Exception.Create('Nota nao encontrada nesta empresa.');
    if (Q.FieldByName('CANCELADA').AsString = 'C') or
       (Q.FieldByName('CANCELADA').AsString = 'D') or
       (Q.FieldByName('CANCELADA').AsString = 'I') then
      raise Exception.Create('Nota cancelada, denegada ou inutilizada nao pode receber pagamentos.');
    FTotal := Q.FieldByName('VLRTOTAL').AsCurrency;
    if FTotal <= 0 then raise Exception.Create('A nota precisa ter valor maior que zero.');
    FNumero := Q.FieldByName('NUMERO').AsInteger;
    FSerie := Q.FieldByName('SERIE').AsString;
  finally Q.Free; end;
end;

procedure TfrmPagamentoNota.LerTotais;
var Q: TFDQuery;
begin
  Q := NovaQuery('select SITUACAO, sum(VALOR) TOTAL from MOVCAIXA ' +
    'where NOTA_CODIGO = :N and EMPRESA = :E group by SITUACAO');
  try
    Q.ParamByName('N').AsInteger := FNota; Q.ParamByName('E').AsInteger := FEmpresa;
    Q.Open; FRecebido := 0; FPendente := 0;
    while not Q.Eof do begin
      if Q.FieldByName('SITUACAO').AsString = 'R' then
        FRecebido := Q.FieldByName('TOTAL').AsCurrency;
      if Q.FieldByName('SITUACAO').AsString = 'P' then
        FPendente := Q.FieldByName('TOTAL').AsCurrency;
      Q.Next;
    end;
  finally Q.Free; end;
end;

procedure TfrmPagamentoNota.Atualizar;
begin
  LerNota(False); LerTotais;
  lblNota.Caption := Format('Nota %d / %s   |   Codigo %d   |   Caixa %d',
    [FNumero,FSerie,FNota,FCaixa]);
  lblResumo.Caption := 'Nota: '+Dinheiro(FTotal)+'    Recebido: '+Dinheiro(FRecebido)+
    '    Pendente: '+Dinheiro(FPendente);
  FHistorico.Close;
  FHistorico.SQL.Text := 'select CODIGO, DATA, FORMA, SITUACAO, VALOR, TROCO, ' +
    'DATA_RECEBIMENTO from MOVCAIXA where NOTA_CODIGO = :N and EMPRESA = :E order by DATA, CODIGO';
  FHistorico.ParamByName('N').AsInteger := FNota;
  FHistorico.ParamByName('E').AsInteger := FEmpresa;
  FHistorico.Open;
  FHistorico.FieldByName('CODIGO').Visible := False;
  FHistorico.FieldByName('FORMA').DisplayLabel := 'Forma de pagamento';
  FHistorico.FieldByName('SITUACAO').DisplayLabel := 'R=Recebido / P=Pendente';
  FHistorico.FieldByName('DATA_RECEBIMENTO').DisplayLabel := 'Recebido em';
  TNumericField(FHistorico.FieldByName('VALOR')).DisplayFormat := '#,##0.00';
  TNumericField(FHistorico.FieldByName('TROCO')).DisplayFormat := '#,##0.00';
  ValorChange(nil);
end;

procedure TfrmPagamentoNota.Calcular(out Informado, Troco: Currency);
var I: Integer; V, Saldo: Currency;
begin
  Informado := 0;
  for I := 0 to 11 do begin
    V := FEdits[I].Value;
    if V < 0 then raise Exception.Create('Nao informe valores negativos.');
    if Abs(V - Currency(Round(V * 100) / 100)) > 0.00001 then
      raise Exception.Create('Use no maximo duas casas decimais.');
    Informado := Informado + V;
  end;
  Saldo := FTotal - FRecebido - FPendente;
  Troco := 0;
  if Informado > Saldo then Troco := Informado - Saldo;
  if Troco > FEdits[0].Value then
    raise Exception.Create('Valor excedente: o troco so pode sair do dinheiro informado.');
end;

procedure TfrmPagamentoNota.ValorChange(Sender: TObject);
var V,T: Currency;
begin
  if FCarregando then Exit;
  try
    Calcular(V,T);
    lblEntrada.Caption := 'A distribuir: '+Dinheiro(FTotal-FRecebido-FPendente)+
      '    Novo: '+Dinheiro(V-T)+'    Troco: '+Dinheiro(T);
    btnGravar.Enabled := (V-T > 0) and not FGravando;
  except
    on E: Exception do begin lblEntrada.Caption := E.Message; btnGravar.Enabled := False; end;
  end;
end;

procedure TfrmPagamentoNota.LimparValores;
var I: Integer;
begin
  FCarregando := True;
  try for I := 0 to 11 do FEdits[I].Value := 0;
  finally FCarregando := False; end;
end;

procedure TfrmPagamentoNota.GravarClick(Sender: TObject);
var Q: TFDQuery; I: Integer; V,T,ItemTroco: Currency; JaGravado: Boolean;
begin
  if FGravando then Exit;
  FGravando := True; btnGravar.Enabled := False;
  try
    try
      FHistorico.Close;
      FConn.StartTransaction;
      try
        LerNota(True);
        Q := NovaQuery('select count(*) N from MOVCAIXA where GRUPO = :G');
        try Q.ParamByName('G').AsString := FGrupo; Q.Open;
          JaGravado := Q.FieldByName('N').AsInteger > 0;
        finally Q.Free; end;
        if not JaGravado then begin
          LerTotais; Calcular(V,T);
          if V-T <= 0 then raise Exception.Create('Nao ha novo valor a registrar.');
          Q := NovaQuery('insert into MOVCAIXA (CODIGO, GRUPO, DATA, CAIXA_ID, EMPRESA, '+
            'NOTA_CODIGO, USUARIO, FORMA, SITUACAO, VALOR_INFORMADO, TROCO, VALOR, '+
            'DATA_RECEBIMENTO, USUARIO_RECEBIMENTO) values (:ID,:G,current_timestamp,:C,:E,:N,:U,:F,:S,:V,:T,:L,:DR,:UR)');
          try
            for I := 0 to 11 do if FEdits[I].Value > 0 then begin
              ItemTroco := 0; if I=0 then ItemTroco := T;
              Q.ParamByName('ID').AsString := NovoID;
              Q.ParamByName('G').AsString := FGrupo;
              Q.ParamByName('C').AsInteger := FCaixa; Q.ParamByName('E').AsInteger := FEmpresa;
              Q.ParamByName('N').AsInteger := FNota; Q.ParamByName('U').AsInteger := FUsuario;
              Q.ParamByName('F').AsString := Formas[I];
              Q.ParamByName('S').AsString := 'P';
              Q.ParamByName('DR').DataType := ftDateTime; Q.ParamByName('DR').Clear;
              Q.ParamByName('UR').DataType := ftInteger; Q.ParamByName('UR').Clear;
              if (I=0) or (I=10) then begin
                Q.ParamByName('S').AsString := 'R';
                Q.ParamByName('DR').AsDateTime := Now;
                Q.ParamByName('UR').AsInteger := FUsuario;
              end;
              Q.ParamByName('V').AsCurrency := FEdits[I].Value;
              Q.ParamByName('T').AsCurrency := ItemTroco;
              Q.ParamByName('L').AsCurrency := FEdits[I].Value-ItemTroco;
              Q.ExecSQL;
            end;
          finally Q.Free; end;
        end;
        FConn.Commit;
      except
        if FConn.InTransaction then FConn.Rollback;
        raise;
      end;
      LimparValores;
      FGrupo := NovoID;
      lblAviso.Caption := 'Lancamento gravado. R = recebido; P = pendente de recebimento.';
    except on E: Exception do lblAviso.Caption := 'Nao concluido: '+E.Message; end;
    try Atualizar; except on E: Exception do lblAviso.Caption := lblAviso.Caption+' / '+E.Message; end;
  finally FGravando := False; ValorChange(nil); end;
end;

procedure TfrmPagamentoNota.ReceberClick(Sender: TObject);
var ID: string; Q: TFDQuery;
begin
  if FHistorico.IsEmpty then Exit;
  if FHistorico.FieldByName('SITUACAO').AsString <> 'P' then begin
    lblAviso.Caption := 'Selecione um lancamento pendente.'; Exit;
  end;
  ID := FHistorico.FieldByName('CODIGO').AsString;
  MessageDlg('Confirmar o recebimento efetivo de '+
    Dinheiro(FHistorico.FieldByName('VALOR').AsCurrency)+'?',mtConfirmation,[mbYes,mbNo],
    procedure(Sender: TComponent; Res: Integer)
    begin
      if Res <> mrYes then Exit;
      try
        FHistorico.Close;
        FConn.StartTransaction;
        try
          LerNota(True);
          Q := NovaQuery('update MOVCAIXA set SITUACAO = ''R'', DATA_RECEBIMENTO = current_timestamp, '+
            'USUARIO_RECEBIMENTO = :U where CODIGO = :ID and EMPRESA = :E and NOTA_CODIGO = :N and SITUACAO = ''P''');
          try
            Q.ParamByName('U').AsInteger := FUsuario;
            Q.ParamByName('ID').AsString := ID;
            Q.ParamByName('E').AsInteger := FEmpresa; Q.ParamByName('N').AsInteger := FNota;
            Q.ExecSQL;
            if Q.RowsAffected <> 1 then raise Exception.Create('Lancamento ja recebido ou alterado. Atualize a tela.');
          finally Q.Free; end;
          FConn.Commit;
          lblAviso.Caption := 'Recebimento confirmado. Titulos financeiros nao foram baixados automaticamente.';
        except if FConn.InTransaction then FConn.Rollback; raise; end;
      except on E: Exception do lblAviso.Caption := E.Message; end;
      Atualizar;
    end);
end;

procedure TfrmPagamentoNota.FinanceiroClick(Sender: TObject);
begin
  if Assigned(FFinanceiro) then FFinanceiro(Self);
end;

procedure TfrmPagamentoNota.EmailClick(Sender: TObject);
begin
  if Assigned(FEmail) then FEmail(Self);
end;

procedure TfrmPagamentoNota.SairClick(Sender: TObject);
begin
  Close;
end;

end.
