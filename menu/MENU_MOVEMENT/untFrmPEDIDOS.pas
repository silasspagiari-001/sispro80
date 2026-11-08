unit untFrmPEDIDOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmMOVIMENTOMESTRE,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.Client, Vcl.Menus,
  uniMainMenu, FireDAC.Comp.DataSet, uniHTMLFrame, uniDBEdit, uniMemo,
  uniDBMemo, uniDBDateTimePicker, UniButtonDbEdit, uniMultiItem, uniComboBox,
  uniDateTimePicker, UniButtonEdit, uniScrollBox, uniPanel, uniPageControl,
  uniButton, uniBitBtn, uniBasicGrid, uniDBGrid, uniGUIClasses, uniEdit,
  uniLabel, uniGUIBaseClasses, uniScreenMask, uniDBComboBox;

type
  TfrmPEDIDOS = class(TfrmMOVIMENTOMESTRE)
    E1: TUniMenuItem;
    F1: TUniMenuItem;
    A1: TUniMenuItem;
    I3: TUniMenuItem;
    N7: TUniMenuItem;
    F2: TUniMenuItem;
    e2: TUniMenuItem;
    D1: TUniMenuItem;
    ContratodeTransporte1: TUniMenuItem;
    N9: TUniMenuItem;
    ControledeEtiqueta1: TUniMenuItem;
    N10: TUniMenuItem;
    RecibodeRetirada1: TUniMenuItem;
    N11: TUniMenuItem;
    DeclaraodeRetirada1: TUniMenuItem;
    RecibodeRetiradaVolumes1: TUniMenuItem;
    N3: TUniMenuItem;
    procedure UniFrameCreate(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure F1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure I3Click(Sender: TObject);
    procedure F2Click(Sender: TObject);
    procedure e2Click(Sender: TObject);
    procedure ContratodeTransporte1Click(Sender: TObject);
    procedure ControledeEtiqueta1Click(Sender: TObject);
    procedure RecibodeRetirada1Click(Sender: TObject);
    procedure DeclaraodeRetirada1Click(Sender: TObject);
    procedure RecibodeRetiradaVolumes1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPEDIDOS: TfrmPEDIDOS;

implementation

{$R *.dfm}

uses MainModule, untDM_RC, untFrmTELAGENERICA, untFrmCADCHEQUEMOVIMENTO,
  untFrmSTATUSMOVIMENTO, mkm_impressao, unReportImpressao,
  untfrmDeclaracaoretirada;
procedure TfrmPEDIDOS.A1Click(Sender: TObject);
begin
  inherited;
  mm.varI_Code_Numero_Documento     :=  sqlSearchMaster.FindField('NUMERO').AsInteger;
  mm.varI_Code_Documento_Documento  :=  4;
  mm.varI_Code_documento_serie      :=  sqlSearchMaster.FindField('SERIE').AsString;
  mm.varI_Code_pessoa_cheque        :=  sqlSearchMaster.FindField('PESSOA').AsInteger;

  frmCADCHEQUESMOVIMENTO.ShowModal();
end;

procedure TfrmPEDIDOS.ContratodeTransporte1Click(Sender: TObject);
begin
  inherited;
    mm.varC_caminhopdf :=  NOTA_ContratoTranporte(
                           MM.varI_Code_Company,
                           FDQryFiltroNUMERO.AsInteger,
                           4);
  unfImpressao.ShowModal();
end;

procedure TfrmPEDIDOS.ControledeEtiqueta1Click(Sender: TObject);
begin
  inherited;
    mm.varC_caminhopdf :=  NOTA_ControleEtiqueta(
                           MM.varI_Code_Company,
                           FDQryFiltroNUMERO.AsInteger,
                           4);
  unfImpressao.ShowModal();
end;

procedure TfrmPEDIDOS.DeclaraodeRetirada1Click(Sender: TObject);
begin
  inherited;
  mm.varI_Code_Documento_Controle := sqlSearchMaster.FindField('CODIGO').AsInteger;
  frmdeclaracaoretirada.ShowModal();
end;

procedure TfrmPEDIDOS.E1Click(Sender: TObject);
begin
  inherited;

  mm.var_ENTREGA_NUMERO        :=  sqlSearchMaster.FindField('NUMERO').AsInteger;
  mm.var_ENTREGA_EMISSAO       :=  sqlSearchMaster.FindField('EMISSAO').AsDateTime;
  mm.var_ENTREGA_NOMEFORNECEDOR:=  sqlSearchMaster.FindField('NOME').AsString;
  mm.var_ENTREGA_VALORTOTAL    :=  sqlSearchMaster.FindField('VLRTOTAL').AsFloat;

  mm.varE_numero_entrega       :=  sqlSearchMaster.FindField('NUMERO').AsInteger;
  mm.varE_documento_entrega    :=  sqlSearchMaster.FindField('DOCUMENTO').AsInteger;

  UniScreenMask.Enabled        :=  True;
  mm.VarC_Atelagenerica        :=  'LISTAENTREGA';

  frmTELAGENERICA.ShowModal();
end;

procedure TfrmPEDIDOS.e2Click(Sender: TObject);
begin
  inherited;
  mm.varC_caminhopdf :=  NOTA_ControleEtiqueta(
                         MM.varI_Code_Company,
                         FDQryFiltroNUMERO.AsInteger,
                         4);

  unfImpressao.ShowModal();
end;

procedure TfrmPEDIDOS.F1Click(Sender: TObject);
begin
  inherited;

  mm.varI_Code_Numero_Documento    := sqlSearchMaster.FindField('NUMERO').AsInteger;
  mm.varI_Code_documento_serie     := sqlSearchMaster.FindField('SERIE').AsString;
  mm.varI_Code_codigo_Documento    := sqlSearchMaster.FindField('CODIGO').AsInteger;

  mm.VarC_Atelagenerica            :=  'FINANCEIRODOC';
  frmTELAGENERICA.ShowModal();

end;

procedure TfrmPEDIDOS.F2Click(Sender: TObject);
var
  FDQryPedidos : TFDQuery;
  FDQryReceber : TFDQuery;
begin
  inherited;
  if sqlSearchMaster.FindField('FECHAMENTO_STATUS').AsString = 'Finalizado' then
    begin
      dm_rc.rc_ShowSweetAlert( 'Ok', 'DOCUMENTO JÁ ESTA FINALIZADO' , 'error' , false );
      abort
    end;


  FDQryPedidos                               := TFDQuery.Create(nil);
  FDQryPedidos.Connection                    := mm.SQLConn;
  FDQryPedidos.UpdateOptions.UpdateTableName := 'MVMESTRE';

  FDQryReceber                               := TFDQuery.Create(nil);
  FDQryReceber.Connection                    := mm.SQLConn;
  FDQryReceber.UpdateOptions.UpdateTableName := 'RECEBER';

  try
    FDQryPedidos.Close;
    FDQryPedidos.SQL.Clear;
    FDQryPedidos.SQL.Text  := ' select * from mvmestre where codigo = ' + IntToStr(sqlSearchMaster.FindField('CODIGO').AsInteger) + ' and ' +
                                                           'empresa = ' + IntToStr(MM.varI_Code_Company);
    FDQryPedidos.Open();

    if not FDQryPedidos.IsEmpty then
      begin
        FDQryPedidos.Edit;
        FDQryPedidos.FindField('FECHAMENTO_DATA').AsDateTime := Date;
        FDQryPedidos.FindField('FECHAMENTO_OBS').AsString    := 'Pedido Faturado.';
        FDQryPedidos.FindField('FECHAMENTO_STATUS').AsString := 'Finalizado';
        FDQryPedidos.Post;
      end;

    FDQryReceber.Close;
    FDQryReceber.SQL.Clear;
    FDQryReceber.SQL.Text  := ' select * from receber where numero = ' + IntToStr(sqlSearchMaster.FindField('NUMERO').AsInteger) + ' and ' +
                                                           ' serie = ' + QuotedStr(sqlSearchMaster.FindField('SERIE').AsString)  + ' and ' +
                                                          'empresa = ' + IntToStr(MM.varI_Code_Company);
    FDQryReceber.Open();

    if not FDQryReceber.IsEmpty then
      begin
        FDQryReceber.Edit;
        FDQryReceber.FindField('FINANCEIRO').AsInteger   := 1;
        FDQryReceber.Post;
      end;

    sqlSearchMaster.Refresh;
  finally
    FreeAndNil(FDQryPedidos);
    FreeAndNil(FDQryReceber);
  end;
end;

procedure TfrmPEDIDOS.I3Click(Sender: TObject);
begin
  inherited;
  mm.varE_numero_entrega       :=  sqlSearchMaster.FindField('NUMERO').AsInteger;
  mm.varE_documento_entrega    :=  sqlSearchMaster.FindField('DOCUMENTO').AsInteger;
  frmSTATUSMOVIMENTO.ShowModal();

  sqlSearchMaster.Refresh;
end;

procedure TfrmPEDIDOS.RecibodeRetirada1Click(Sender: TObject);
begin
  inherited;
  mm.varC_caminhopdf :=  IMPRESSAO_recibonota(mm.varI_Code_Company,
                                              sqlSearchMaster.FindField('CODIGO').AsInteger);
  unfImpressao.ShowModal();
end;

procedure TfrmPEDIDOS.RecibodeRetiradaVolumes1Click(Sender: TObject);
begin
  inherited;
  mm.varC_caminhopdf :=  IMPRESSAO_recibonotaVolume(mm.varI_Code_Company,
                                                    sqlSearchMaster.FindField('CODIGO').AsInteger);
  unfImpressao.ShowModal();
end;

procedure TfrmPEDIDOS.UniFrameCreate(Sender: TObject);
begin
  labTitleForm.Caption        := 'PEDIDOS';
  varC_Documento_Mvmestre     := 4;
  inherited;
end;

initialization
  RegisterClass(TfrmPEDIDOS);
end.
