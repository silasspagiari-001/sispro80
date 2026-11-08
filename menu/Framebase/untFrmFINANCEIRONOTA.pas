unit untFrmFINANCEIRONOTA;

interface

uses
  System.SysUtils, System.Classes, System.Math, Data.DB, Vcl.Controls,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniLabel,
  uniTimer, uniButton, uniBasicGrid, uniDBGrid, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Vcl.Forms, uniScrollBox;

type
  TfrmFINANCEIRONOTA = class(TUniForm)
    memParcelas: TFDMemTable;
    dsParcelas: TDataSource;
    rcBlock40: TUniContainerPanel;
    UniScrollBox1: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    paCabecalho: TUniPanel;
    labTitulo: TUniLabel;
    labNota: TUniLabel;
    rcBlock20: TUniContainerPanel;
    paResumo: TUniPanel;
    labTituloValorNota: TUniLabel;
    labValorNota: TUniLabel;
    labTituloParcelas: TUniLabel;
    labParcelas: TUniLabel;
    labTituloDiferenca: TUniLabel;
    labDiferenca: TUniLabel;
    rcBlock480: TUniContainerPanel;
    gridParcelas: TUniDBGrid;
    rcBlock30: TUniContainerPanel;
    paAcoes: TUniPanel;
    btnIncluir: TUniButton;
    btnExcluir: TUniButton;
    btnConferir: TUniButton;
    paRodape: TUniPanel;
    labOrientacao: TUniLabel;
    btnCancelar: TUniButton;
    btnConfirmar: TUniButton;
    procedure ExibirParcelas(Sender: TObject);
    procedure IncluirClick(Sender: TObject);
    procedure ExcluirClick(Sender: TObject);
    procedure ConferirClick(Sender: TObject);
    procedure ConfirmarClick(Sender: TObject);
    procedure CancelarClick(Sender: TObject);
    procedure ParcelaBeforePost(DataSet: TDataSet);
    procedure ParcelasAlteradas(DataSet: TDataSet);
  private
    FTotalNota, FTotalParcelas: Currency;
    FCarregando: Boolean;
    procedure AtualizarResumo;
  public
    procedure Preparar(Origem: TDataSet; ValorNota: Currency;
      const Identificacao: string);
  end;

function frmFINANCEIRONOTA: TfrmFINANCEIRONOTA;

implementation

uses MainModule, untDM_RC, uniGUIDialogs, uniGUITypes;

{$R *.dfm}

function frmFINANCEIRONOTA: TfrmFINANCEIRONOTA;
begin
  Result:=TfrmFINANCEIRONOTA(mm.GetFormInstance(TfrmFINANCEIRONOTA));
end;

procedure TfrmFINANCEIRONOTA.Preparar(Origem: TDataSet;
  ValorNota: Currency; const Identificacao: string);
var B: TBookmark;
begin
  if Visible then raise Exception.Create('O financeiro da nota ja esta aberto.');
  if not Assigned(Origem) or not Origem.Active then
    raise Exception.Create('As parcelas da nota nao estao disponiveis.');
  if Origem.State in dsEditModes then
    raise Exception.Create('Conclua a edicao da parcela antes de abrir o financeiro.');
  Origem.FieldByName('PARCELA');
  Origem.FieldByName('VENCIMENTO');
  Origem.FieldByName('VALOR');
  FTotalNota:=ValorNota;
  ModalResult:=mrNone;
  labNota.Caption:=Identificacao;
  FCarregando:=True;
  B:=Origem.GetBookmark;
  Origem.DisableControls;
  try
    if not memParcelas.Active then
      memParcelas.CopyDataSet(Origem,[coStructure,coRestart,coAppend])
    else
    begin
      memParcelas.Cancel;
      memParcelas.DisableControls;
      try
        memParcelas.EmptyDataSet;
        memParcelas.CopyDataSet(Origem,[coRestart,coAppend]);
      finally memParcelas.EnableControls; end;
    end;
    TNumericField(memParcelas.FieldByName('VALOR')).DisplayFormat:='#,##0.00';
    TDateTimeField(memParcelas.FieldByName('VENCIMENTO')).DisplayFormat:='dd/mm/yyyy';
    memParcelas.First;
  finally
    if Origem.BookmarkValid(B) then Origem.GotoBookmark(B);
    Origem.FreeBookmark(B);
    Origem.EnableControls;
    FCarregando:=False;
    dsParcelas.DataSet:=memParcelas;
  end;
  AtualizarResumo;
end;

procedure TfrmFINANCEIRONOTA.ExibirParcelas(Sender: TObject);
begin
  if not memParcelas.Active then Exit;
  // Preparar carrega antes do ShowModal. Reenviar os dados com a janela visivel.
  if not (memParcelas.State in dsEditModes) then
  begin
    memParcelas.First;
    AtualizarResumo;
  end;
  gridParcelas.SetFocus;
end;


procedure TfrmFINANCEIRONOTA.AtualizarResumo;
var B: TBookmark; Total: Currency;
begin
  if FCarregando or not memParcelas.Active then Exit;
  if memParcelas.State in dsEditModes then Exit;
  Total:=0;
  B:=memParcelas.GetBookmark;
  memParcelas.DisableControls;
  try
    memParcelas.First;
    while not memParcelas.Eof do
    begin
      Total:=Total+memParcelas.FieldByName('VALOR').AsCurrency;
      memParcelas.Next;
    end;
  finally
    if memParcelas.BookmarkValid(B) then memParcelas.GotoBookmark(B);
    memParcelas.FreeBookmark(B);
    memParcelas.EnableControls;
  end;
  FTotalParcelas:=Total;
  labValorNota.Caption:='R$ '+FormatFloat('#,##0.00',FTotalNota);
  labParcelas.Caption:='R$ '+FormatFloat('#,##0.00',Total);
  labDiferenca.Caption:='R$ '+FormatFloat('#,##0.00',FTotalNota-Total);
  if Abs(FTotalNota-Total)<0.005 then
    labDiferenca.Font.Color:=$00804715
  else labDiferenca.Font.Color:=$002020B0;
end;

procedure TfrmFINANCEIRONOTA.ParcelaBeforePost(DataSet: TDataSet);
begin
  if FCarregando then Exit;
  if DataSet.FieldByName('PARCELA').AsInteger<=0 then
    raise Exception.Create('Informe um numero de parcela maior que zero.');
  if DataSet.FieldByName('VENCIMENTO').IsNull then
    raise Exception.Create('Informe o vencimento da parcela.');
  if DataSet.FieldByName('VALOR').AsCurrency<=0 then
    raise Exception.Create('Informe um valor maior que zero.');
end;

procedure TfrmFINANCEIRONOTA.ParcelasAlteradas(DataSet: TDataSet);
begin
  AtualizarResumo;
end;

procedure TfrmFINANCEIRONOTA.IncluirClick(Sender: TObject);
var Proxima: Integer;
begin
  try
    memParcelas.CheckBrowseMode;
    Proxima:=0;
    memParcelas.First;
    while not memParcelas.Eof do
    begin
      Proxima:=Max(Proxima,memParcelas.FieldByName('PARCELA').AsInteger);
      memParcelas.Next;
    end;
    memParcelas.Append;
    memParcelas.FieldByName('PARCELA').AsInteger:=Proxima+1;
    memParcelas.FieldByName('VENCIMENTO').AsDateTime:=Date;
    memParcelas.FieldByName('VALOR').AsCurrency:=Max(0,FTotalNota-FTotalParcelas);
    gridParcelas.SetFocus;
  except on E: Exception do uniGUIDialogs.ShowMessage(E.Message); end;
end;

procedure TfrmFINANCEIRONOTA.ExcluirClick(Sender: TObject);
begin
  if memParcelas.IsEmpty then Exit;
  if memParcelas.State=dsInsert then begin memParcelas.Cancel; AtualizarResumo; Exit; end;
  uniGUIDialogs.MessageDlg('Excluir a parcela selecionada?', mtConfirmation, [mbYes,mbNo],
    procedure(Sender: TComponent; AResult: Integer)
    begin
      if AResult<>mrYes then Exit;
      if not memParcelas.Active or memParcelas.IsEmpty then Exit;
      try
        memParcelas.Cancel;
        memParcelas.Delete;
      except on E: Exception do uniGUIDialogs.ShowMessage(E.Message); end;
    end);
end;

procedure TfrmFINANCEIRONOTA.ConferirClick(Sender: TObject);
begin
  try
    memParcelas.CheckBrowseMode;
    AtualizarResumo;
  except on E: Exception do uniGUIDialogs.ShowMessage(E.Message); end;
end;

procedure TfrmFINANCEIRONOTA.ConfirmarClick(Sender: TObject);
var Numeros: TStringList;
begin
  try
    memParcelas.CheckBrowseMode;
    Numeros:=TStringList.Create;
    try
      memParcelas.First;
      while not memParcelas.Eof do
      begin
        ParcelaBeforePost(memParcelas);
        if Numeros.IndexOf(memParcelas.FieldByName('PARCELA').AsString)>=0 then
          raise Exception.Create('Existem numeros de parcela repetidos.');
        Numeros.Add(memParcelas.FieldByName('PARCELA').AsString);
        memParcelas.Next;
      end;
      memParcelas.First;
    finally Numeros.Free; end;
    AtualizarResumo;
    if Abs(FTotalNota-FTotalParcelas)>=0.005 then
    begin
      uniGUIDialogs.MessageDlg(
        'O total das parcelas difere do valor da nota. Confirmar mesmo assim?',
        mtConfirmation, [mbYes,mbNo],
        procedure(Sender: TComponent; AResult: Integer)
        begin
          if AResult=mrYes then ModalResult:=mrOK;
        end);
      Exit; // Aguardar a resposta; nao confirmar antes do callback.
    end;
    ModalResult:=mrOK;
  except on E: Exception do uniGUIDialogs.ShowMessage(E.Message); end;
end;

procedure TfrmFINANCEIRONOTA.CancelarClick(Sender: TObject);
begin
  memParcelas.Cancel;
  ModalResult:=mrCancel;
end;

end.
