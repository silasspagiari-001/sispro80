unit untfrmSEFAZMANIFESTO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, Vcl.Menus, uniMainMenu, uniMemo, uniLabel,
  uniPanel, uniPageControl, uniButton, uniBitBtn, uniScrollBox,
  uniGUIBaseClasses, uniScreenMask;

type
  TfrmSEFAZMANIFESTO = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniScrollBox1: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    btnENVIA: TUniBitBtn;
    btnSTATUS: TUniBitBtn;
    btnCONSULTA: TUniBitBtn;
    btnOPCOES: TUniBitBtn;
    rcBlock20: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    UniPageControlprincipal: TUniPageControl;
    UniTabSheetresposta: TUniTabSheet;
    rcBlock30: TUniContainerPanel;
    UniLabel20: TUniLabel;
    UniMemorespostaTXT: TUniMemo;
    rcBlock40: TUniContainerPanel;
    UniMemorespostaXML: TUniMemo;
    UniTabSheetencerrar: TUniTabSheet;
    UniContainerPanel2: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniBitBtn2: TUniBitBtn;
    rcBlock70: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniMemoresposta: TUniMemo;
    UniPopupMenudetalhessefaz: TUniPopupMenu;
    danfeinpressao: TUniMenuItem;
    N1: TUniMenuItem;
    cancelamentoeletronico: TUniMenuItem;
    N3: TUniMenuItem;
    i2: TUniMenuItem;
    UniPopupMenuencerramento: TUniPopupMenu;
    UniMenuItem1: TUniMenuItem;
    N4: TUniMenuItem;
    I1: TUniMenuItem;
    UniScreenMask1: TUniScreenMask;
    procedure UniBitBtn2Click(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure btnOPCOESClick(Sender: TObject);
    procedure btnSTATUSClick(Sender: TObject);
    procedure btnCONSULTAClick(Sender: TObject);
    procedure danfeinpressaoClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnENVIAClick(Sender: TObject);
    procedure UniMenuItem1Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure cancelamentoeletronicoClick(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   cFormModal         : TUniForm;
   procedure ConfiguraAcbr(aempresa:integer);
   procedure CarregaXML(pempresa, pcontrole: integer);
   procedure HabilitaBotoes();
   procedure AtualizaManifesto(const tcancelada:string);
   procedure MontaXML(pcontrole:integer);
   function  trocanomearquivo(caminho,arq:string) :string;
  end;

function frmSEFAZMANIFESTO: TfrmSEFAZMANIFESTO;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_procedures, mkm_funcoes, untDM_RC,
  ACBrDFeSSL, pcnConversao, blcksock, uconsts, unReportImpressao, mkm_func_web,
   Vcl.Clipbrd, pmdfeConversaoMDFe;

var
  M_ARQUIVOPDF : string;
  M_ARQUIVOXML : string;

function frmSEFAZMANIFESTO: TfrmSEFAZMANIFESTO;
begin
  Result := TfrmSEFAZMANIFESTO(mm.GetFormInstance(TfrmSEFAZMANIFESTO));
end;

procedure TfrmSEFAZMANIFESTO.AtualizaManifesto(const tcancelada:string);
begin
  TabelaMfmestre(' select * from mfmestre where codigo    = ' + IntToStr(mm.varI_Code_Documento_Controle));
  TabelaEmpresas(' select * from empresas where codigo    = ' + IntToStr(MM.varI_Code_Company));

  dm_rc.FDQryMfmestre.Edit;
  if tcancelada = 'A' then
    begin
      dm_rc.FDQryMfmestre.FindField('CODIGOBARRAS').AsString := dm_rc.ACBrMDFe.Manifestos[0].MDFe.procMDFe.chDFe;
      dm_rc.FDQryMfmestre.FindField('PROTOCOLO').AsString    := dm_rc.ACBrMDFe.Manifestos[0].MDFe.procMDFe.nProt;
    end;

  dm_rc.FDQryMfmestre.FindField('CANCELADA').AsString    := tcancelada;

  if tcancelada = 'A' then
    dm_rc.FDQryMfmestre.FindField('LOGENVIO').AsString     := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time)
  else
  if tcancelada = 'C' then
    dm_rc.FDQryMfmestre.FindField('LOGCANCELA').AsString   := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time)
  else
  if tcancelada = 'E' then
    dm_rc.FDQryMfmestre.FindField('LOGENCERRA').AsString   := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);


  dm_rc.FDQryMfmestre.Post;


end;

procedure TfrmSEFAZMANIFESTO.btnCONSULTAClick(Sender: TObject);
begin
  ConfiguraAcbr(mm.varI_Code_Company);
  TabelaMfmestre('select * from mfmestre where codigo = ' + IntToStr(mm.varI_Code_Documento_Controle));

  UniMemorespostaTXT.Clear;
  UniMemorespostaXML.Clear;

  dm_rc.ACBrMDFe.Manifestos.Clear;
  dm_rc.ACBrMDFe.WebServices.Consulta.MDFeChave := dm_rc.FDQryMfmestre.FindField('codigobarras').AsString;
  dm_rc.ACBrMDFe.WebServices.Consulta.Executar;

  try

    UniMemorespostaXML.Lines.Text   := UTF8Encode(dm_rc.ACBrMDFe.WebServices.Consulta.RetornoWS);
    if (dm_rc.ACBrMDFe.WebServices.Consulta.xMotivo = 'Encerramento de MDF-e homologado') and (dm_rc.FDQryMfmestre.FindField('CANCELADA').AsString <> 'E') then
      begin
        dm_rc.FDQryMfmestre.Edit;
        dm_rc.FDQryMfmestre.FindField('LOGENCERRA').AsString   := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);
        dm_rc.FDQryMfmestre.FindField('CANCELADA').AsString    := 'E';        
        dm_rc.FDQryMfmestre.Post; 
      end;
    
    UniMemorespostaTXT.Lines.Add('Ambiente.....: ' + TpAmbToStr(dm_rc.ACBrMDFe.WebServices.Consulta.TpAmb));
    UniMemorespostaTXT.Lines.Add('cStat........: ' + IntToStr(dm_rc.ACBrMDFe.WebServices.Consulta.cUF));
    UniMemorespostaTXT.Lines.Add('Motivo.......: ' + dm_rc.ACBrMDFe.WebServices.Consulta.xMotivo);
    UniMemorespostaTXT.Lines.Add('Chave........: ' + dm_rc.ACBrMDFe.WebServices.Consulta.MDFeChave);
    UniMemorespostaTXT.Lines.Add('Protocolo....: ' + dm_rc.ACBrMDFe.WebServices.Consulta.Protocolo);
    UniMemorespostaTXT.Lines.Add('dhRecbto.....: ' + DateTimeToStr(dm_rc.ACBrMDFe.WebServices.Consulta.DhRecbto));
  except
    UniMemorespostaTXT.Lines.Add('Motivo.......: ' + dm_rc.ACBrMDFe.WebServices.Consulta.xMotivo);
    UniMemorespostaTXT.Lines.Add('SEM CONEXÃO COM A SEFAZ - TENTE MAIS TARDE');
  end;
end;

procedure TfrmSEFAZMANIFESTO.btnENVIAClick(Sender: TObject);
begin
  UniMemorespostaTXT.Clear;
  UniMemorespostaXML.Clear;

  ConfiguraAcbr(mm.varI_Code_Company);
  MontaXML(mm.varI_Code_Documento_Controle);

  try
    dm_rc.ACBrMDFe.Configuracoes.Arquivos.PathSalvar    := Validacaminho(mm.varI_Code_Company,mm.M_PATHXML,dm_rc.tbempresas.FindField('cnpj').AsString,'MDFe',dm_rc.FDQryMfmestre.FindField('EMISSAO').AsString,'');

    dm_rc.ACBrMDFe.Manifestos.GerarMDFe;
    dm_rc.ACBrMDFe.Manifestos.Assinar;
    dm_rc.ACBrMDFe.Manifestos.Validar;

    dm_rc.ACBrMDFe.Enviar (0,False,True);
    dm_rc.ACBrMDFe.Manifestos.Items[0].GravarXML;

    UniMemorespostaXML.Lines.Text   := UTF8Encode(dm_rc.ACBrMDFe.WebServices.Enviar.RetornoWS);

    if StrContains('100#136#135#104',IntToStr(dm_rc.ACBrMDFe.WebServices.Enviar.cStat))then
      begin
        UniMemorespostaTXT.Lines.Add('MANIFESTO ELETRÔNICO ENVIADO COM SUCESSO!');
        UniMemorespostaTXT.Lines.Add('Ambiente.....: ' + TpAmbToStr(dm_rc.ACBrMDFe.Manifestos[0].MDFe.procMDFe.tpAmb));
        UniMemorespostaTXT.Lines.Add('Chave........: ' + dm_rc.ACBrMDFe.Manifestos[0].MDFe.procMDFe.chDFe);
        UniMemorespostaTXT.Lines.Add('Protocolo....: ' + dm_rc.ACBrMDFe.Manifestos[0].MDFe.procMDFe.nProt);
        AtualizaManifesto('A');
        HabilitaBotoes();
      end;
  except
    on e: exception do
    begin
      gera_log(e.message);
      UniMemorespostaTXT.Lines.Add('Status.......: ' + IntToStr(dm_rc.ACBrMDFe.WebServices.Enviar.cStat));
      UniMemorespostaTXT.Lines.Add('Motivo.......: ' + dm_rc.ACBrMDFe.WebServices.Enviar.xMotivo);
      dm_rc.rc_ShowMessage(e.message);
    end;
  end;
end;

procedure TfrmSEFAZMANIFESTO.btnOPCOESClick(Sender: TObject);
begin
  UniPopupMenudetalhessefaz.PopupBy( TUniButton( sender ) );
end;

procedure TfrmSEFAZMANIFESTO.btnSTATUSClick(Sender: TObject);
begin
  ConfiguraAcbr(mm.varI_Code_Company);
  UniMemorespostaTXT.Clear;
  UniMemorespostaXML.Clear;
  try
    dm_rc.ACBrMDFe.WebServices.StatusServico.Executar;
    UniMemorespostaXML.Lines.Text   := UTF8Encode(dm_rc.ACBrMDFe.WebServices.StatusServico.RetornoWS);

    UniMemorespostaTXT.Lines.Add('Status Serviço');
    UniMemorespostaTXT.Lines.Add('Ambiente.....: ' + TpAmbToStr(dm_rc.ACBrMDFe.WebServices.StatusServico.tpAmb));
    UniMemorespostaTXT.Lines.Add('cStat........: ' + IntToStr(dm_rc.ACBrMDFe.WebServices.StatusServico.cStat));
    UniMemorespostaTXT.Lines.Add('UF...........: ' + IntToStr(dm_rc.ACBrMDFe.WebServices.StatusServico.cUF));
    UniMemorespostaTXT.Lines.Add('Versão Aplic.: ' + dm_rc.ACBrMDFe.WebServices.StatusServico.verAplic);
    UniMemorespostaTXT.Lines.Add('Motivo.......: ' + dm_rc.ACBrMDFe.WebServices.StatusServico.xMotivo);
    UniMemorespostaTXT.Lines.Add('dhRecbto.....: ' + DateTimeToStr(dm_rc.ACBrMDFe.WebServices.StatusServico.dhRecbto));
  except
    UniMemorespostaTXT.Lines.Add('SEM CONEXÃO COM A SEFAZ - TENTE MAIS TARDE');
  end;
end;

procedure TfrmSEFAZMANIFESTO.cancelamentoeletronicoClick(Sender: TObject);
var
  NumeroLote      : Integer;
begin
  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(mm.varI_Code_Company));
  TabelaMFmestre('select * from mFmestre where codigo = ' + IntToStr(mm.varI_Code_Documento_Controle));

  ConfiguraAcbr(mm.varI_Code_Company);
  UniMemorespostaTXT.Clear;
  UniMemorespostaXML.Clear;

  NumeroLote                       := random(20);
  dm_rc.ACBrMDFe.EventoMDFe.idLote := NumeroLote;

  with dm_rc.ACBrMDFe.EventoMDFe.Evento.Add do
    begin
      infEvento.chMDFe          := dm_rc.FDQryMfmestre.FindField('CODIGOBARRAS').AsString;
      infEvento.CNPJCPF         := dm_rc.tbempresas.findfield('CNPJ').AsString;
      infEvento.dhEvento        := now;
      infEvento.tpEvento        := teCancelamento;
      infEvento.detEvento.xJust := 'Emissao indevida por valores ou dados inconsistentes';
      infEvento.detEvento.nProt := dm_rc.FDQryMfmestre.FindField('PROTOCOLO').AsString;
    end;

  try
    dm_rc.ACBrMDFe.EnviarEvento(NumeroLote) ;
    UniMemorespostaXML.Lines.Text             := UTF8Encode(dm_rc.ACBrMDFe.WebServices.EnvEvento.RetornoWS);

    UniMemorespostaTXT.Lines.Add('Ambiente.....: ' + TpAmbToStr(dm_rc.ACBrMDFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.tpAmb));
    UniMemorespostaTXT.Lines.Add('cStat........: ' + IntToStr(dm_rc.ACBrMDFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat));
    UniMemorespostaTXT.Lines.Add('Motivo.......: ' + dm_rc.ACBrMDFe.WebServices.EnvEvento.EventoRetorno.xMotivo);
    UniMemorespostaTXT.Lines.Add('Protocolo....: ' + dm_rc.ACBrMDFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt);
    UniMemorespostaTXT.Lines.Add('dhRecbto.....: ' + DateTimeToStr(dm_rc.ACBrMDFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento));

    EventoXmlAcbr(dm_rc.FDQryMfmestre.FindField('NUMERO').AsString,
                  dm_rc.FDQryMfmestre.FindField('DOCUMENTO').AsString,
                  dm_rc.FDQryMfmestre.FindField('EMPRESA').AsString,
                  'C');

    AtualizaManifesto('C');
    HabilitaBotoes();
  except
    UniMemorespostaTXT.Lines.Add('Ambiente.....: ' + TpAmbToStr(dm_rc.ACBrMDFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.tpAmb));
    UniMemorespostaTXT.Lines.Add('cStat........: ' + IntToStr(dm_rc.ACBrMDFe.WebServices.EnvEvento.EventoRetorno.cStat));
    UniMemorespostaTXT.Lines.Add('Motivo.......: ' + dm_rc.ACBrMDFe.WebServices.EnvEvento.EventoRetorno.xMotivo);
  end;
end;

procedure TfrmSEFAZMANIFESTO.CarregaXML(pempresa, pcontrole: integer);
begin
  dm_rc.ACBrMDFe.Manifestos.Clear;

  SqlPesquisa   (' select * from mfmestre where codigo = ' + IntToStr(pcontrole));
  TabelaEmpresas(' select * from empresas where codigo = ' + IntToStr(pempresa));

  M_ARQUIVOXML := Validacaminho(pempresa,
                                mm.M_PATHXML,
                                mm.varC_Doc_Customer,
                                'MDFe',
                                dm_rc.sqlBuscas.FindField('EMISSAO').AsString,
                                '') + dm_rc.sqlBuscas.FindField('CODIGOBARRAS').AsString + '-mdfe.xml';

  {
  if dm_rc.sqlBuscas.FindField('CANCELADA').AsString  = 'C' then
    dm_rc.ACBrMDFeDAMDFeRL.Cancelada := True
  else
  if (dm_rc.sqlBuscas.FindField('CANCELADA').AsString = 'A') or (dm_rc.sqlBuscas.FindField('CANCELADA').AsString = '') then
    dm_rc.ACBrMDFeDAMDFeRL.Cancelada := False
  else
  if dm_rc.sqlBuscas.FindField('CANCELADA').AsString  = 'E' then
    dm_rc.ACBrMDFeDAMDFeRL.Encerrado := True;
 }
  try
    dm_rc.ACBrMDFe.Manifestos.LoadFromFile(M_ARQUIVOXML);
    UniMemorespostaXML.Lines.Add(M_ARQUIVOXML);
  except
    on e: exception do
    begin
      gera_log(e.message);
      dm_rc.rc_ShowMessage(e.message);
    end;
  end;
end;

procedure TfrmSEFAZMANIFESTO.ConfiguraAcbr(aempresa: integer);
begin
  TabelaEmpresas('SELECT * FROM EMPRESAS WHERE CODIGO = ' + IntToStr(aempresa));

  M_ARQUIVOPDF := Gera_Guid()+'.pdf';

  dm_rc.ACBrMDFe.Configuracoes.WebServices.UF            :=  dm_rc.tbempresas.FindField('ESTADO').AsString;
  dm_rc.ACBrMDFe.Configuracoes.Arquivos.PathSchemas      :=  'C:\Arquivos\Schemas\MDFe\';
  dm_rc.ACBrMDFe.Configuracoes.Arquivos.PathSalvar       :=  'C:\Arquivos\temp\';

  if dm_rc.tbempresas.FindField('TIPO_AMBIENTE').AsString = 'Produção' then
    dm_rc.ACBrMDFe.Configuracoes.WebServices.Ambiente    :=  taProducao
  else
    dm_rc.ACBrMDFe.Configuracoes.WebServices.Ambiente    :=  taHomologacao;

  dm_rc.ACBrMDFe.SSL.SSLType                                        :=  TSSLType(LT_TLSv1_2);
  dm_rc.ACBrMDFe.Configuracoes.Geral.SSLLib                         :=  libWinCrypt;
  dm_rc.ACBrMDFe.Configuracoes.Geral.SSLCryptLib                    :=  cryWinCrypt;
  dm_rc.ACBrMDFe.Configuracoes.Geral.SSLHttpLib                     :=  httpWinHttp;
  dm_rc.ACBrMDFe.Configuracoes.Geral.SSLXmlSignLib                  :=  xsLibXml2;
  dm_rc.ACBrMDFe.Configuracoes.WebServices.AjustaAguardaConsultaRet := True;

  dm_rc.ACBrMDFe.Configuracoes.Geral.VersaoDF            := ve300;
  dm_rc.ACBrMDFe.Configuracoes.Geral.ExibirErroSchema    := true;


  dm_rc.ACBrMDFe.Configuracoes.Certificados.NumeroSerie  := dm_rc.tbempresas.FindField('CERTIFICADO_CHAVE').AsString;
  dm_rc.ACBrMDFe.Configuracoes.Certificados.Senha        := dm_rc.tbempresas.FindField('CERTIFICADO_SENHA').AsString;

  //*************************************************************************
  //IMPRESSAO
  //*************************************************************************
  dm_rc.ACBrMDFeDAMDFeRL.NomeDocumento                   :=  M_ARQUIVOPDF;
  dm_rc.ACBrMDFeDAMDFeRL.Sistema                         := 'Sisgrãos - Sistema de gerenciamento de sementeiras - www.sisgraos.com.br';
  dm_rc.ACBrMDFeDAMDFeRL.Logo                            := dm_rc.tbempresas.FindField('caminho_logo').AsString;
  dm_rc.ACBrMDFeDAMDFeRL.PathPDF                         := dm_rc.tbempresas.FindField('caminho_impressao').AsString;

  dm_rc.ACBrMDFeDAMDFeRL.MostraPreview                   := False;
  dm_rc.ACBrMDFeDAMDFeRL.MostraSetup                     := False;
  dm_rc.ACBrMDFeDAMDFeRL.MostraStatus                    := False;
end;

procedure TfrmSEFAZMANIFESTO.danfeinpressaoClick(Sender: TObject);
begin
  try
    ConfiguraAcbr(mm.varI_Code_Company);
    TabelaMfmestre('select * from mfmestre where codigo = ' + IntToStr(mm.varI_Code_Documento_Controle));
    if (dm_rc.FDQryMfmestre.FindField('CANCELADA').AsString = 'A') or
       (dm_rc.FDQryMfmestre.FindField('CANCELADA').AsString = 'C') or
       (dm_rc.FDQryMfmestre.FindField('CANCELADA').AsString = 'E') then
      CarregaXML(mm.varI_Code_Company,mm.varI_Code_Documento_Controle)
    else
      begin
        MontaXML(mm.varI_Code_Documento_Controle);
        dm_rc.ACBrMDFe.Manifestos.GerarMDFe;
      end;

    dm_rc.ACBrMDFE.Manifestos.ImprimirPDF;
    M_ARQUIVOPDF       := trocanomearquivo(mm.M_PATHIMPRESSAO,Copy(dm_rc.ACBrMDFe.Manifestos.Items[0].MDFe.infMDFe.Id,5,45)+'-mdfe.pdf');
    mm.varC_caminhopdf := M_ARQUIVOPDF;

    unfImpressao.ShowModal();

  except
    on e: exception do
    begin
      gera_log(e.message);
    end;
  end;
end;

procedure TfrmSEFAZMANIFESTO.HabilitaBotoes;
begin
  SqlPesquisa('select * from mfmestre where codigo = ' + IntToStr(mm.varI_Code_Documento_Controle));
  dm_rc.ACBrMDFe.Manifestos.Clear;

  if (dm_rc.sqlBuscas.FindField('CANCELADA').AsString = 'A') or (dm_rc.sqlBuscas.FindField('CANCELADA').AsString = 'E') then
    begin
      CarregaXML(mm.varI_Code_Company,mm.varI_Code_Documento_Controle);
      btnENVIA.Enabled               := False;
      btnCONSULTA.Enabled            := True;
      cancelamentoeletronico.Enabled := true;
      danfeinpressao.Enabled         := True;
      i2.Enabled                     := False;
    end
  else
  if dm_rc.sqlBuscas.FindField('CANCELADA').AsString = 'C' then
    begin
      CarregaXML(mm.varI_Code_Company,mm.varI_Code_Documento_Controle);
      btnENVIA.Enabled               := False;
      btnCONSULTA.Enabled            := True;
      cancelamentoeletronico.Enabled := False;
      danfeinpressao.Enabled         := True;
      i2.Enabled                     := True;
    end
  else
    begin
      btnENVIA.Enabled               := True;
      btnCONSULTA.Enabled            := False;
      cancelamentoeletronico.Enabled := False;
      danfeinpressao.Enabled         := True;
      i2.Enabled                     := False;
    end;
end;

procedure TfrmSEFAZMANIFESTO.I1Click(Sender: TObject);
var
  NumeroLote : integer;
begin
  NumeroLote := 1;
  ConfiguraAcbr(mm.varI_Code_Company);
  TabelaMfmestre('select * from mfmestre where codigo  = ' + IntToStr(mm.varI_Code_Documento_Controle));
  TabelaEmpresas('select * from empresas  where codigo = ' + IntToStr(mm.varI_Code_Company));

  UniMemoresposta.Clear;
  UniMemorespostaXML.Clear;

  try
    dm_rc.ACBrMDFe.Manifestos.Clear;
    dm_rc.ACBrMDFe.EventoMDFe.idLote       := NumeroLote;
    CarregaXML(mm.varI_Code_Company,mm.varI_Code_Documento_Controle);
    dm_rc.ACBrMDFe.EventoMDFe.Evento.Clear;

    with dm_rc.ACBrMDFe.EventoMDFe.Evento.Add do
      begin
        infEvento.chMDFe          := dm_rc.FDQryMfmestre.FindField('CODIGOBARRAS').AsString;
        infEvento.CNPJCPF         := dm_rc.tbempresas.FindField('CNPJ').AsString;
        infEvento.dhEvento        := now;
        infEvento.tpEvento        := teEncerramento;
        infEvento.nSeqEvento      := 1;
        infEvento.detEvento.nProt := dm_rc.FDQryMfmestre.FindField('PROTOCOLO').AsString;
        infEvento.detEvento.dtEnc := Date;
        infEvento.detEvento.cUF   := StrToInt(Copy(IntToStr(dm_rc.ACBrMDFe.Manifestos.Items[0].MDFe.infDoc.infMunDescarga.Items[0].cMunDescarga),1,2));
        infEvento.detEvento.cMun  := dm_rc.ACBrMDFe.Manifestos.Items[0].MDFe.infDoc.infMunDescarga.Items[0].cMunDescarga;
      end;

    dm_rc.ACBrMDFe.EnviarEvento(NumeroLote);
    UniMemorespostaXML.Lines.Text   := UTF8Encode(dm_rc.ACBrMDFe.WebServices.EnvEvento.RetornoWS);

    AtualizaManifesto('E');
    UniMemoresposta.Lines.Add('Motivo.......: ' + dm_rc.ACBrMDFe.WebServices.EnvEvento.EventoRetorno.xMotivo);
  except
    UniMemoresposta.Lines.Add('Motivo.......: ' + dm_rc.ACBrMDFe.WebServices.EnvEvento.EventoRetorno.xMotivo);
    UniMemoresposta.Lines.Add('SEM CONEXÃO COM A SEFAZ - TENTE MAIS TARDE');
  end;
end;

procedure TfrmSEFAZMANIFESTO.MontaXML(pcontrole: integer);
var
  M_PARCELA             : TStringList;
  I, nota, conhecimento : Integer;
  M_TIPOCARGA           : string;
begin
  TabelaMfmestre  (' select * from mfmestre where codigo      = ' + IntToStr(pcontrole));
  TabelaEmpresas  (' select * from empresas where codigo      = ' + IntToStr(dm_rc.fdqrymfmestre.FindField('EMPRESA').AsInteger));
  TabelaMvitens   (' select * from mfitens  where numero      = ' + IntToStr(dm_rc.FDQryMFmestre.FindField('NUMERO').AsInteger)    +
                   ' and                         documento    = ' + IntToStr(dm_rc.FDQryMFmestre.FindField('DOCUMENTO').AsInteger) +
                   ' and                         empresa      = ' + IntToStr(mm.varI_Code_Company)                                 +
                   ' order by sequencia                         ');

  dm_rc.ACBrMDFe.Manifestos.Clear;
  with dm_rc.ACBrMDFe.Manifestos.Add.MDFe do
    begin
       Emit.CNPJCPF           := dm_rc.tbempresas.FindField('CNPJ').AsString;
       Emit.IE                := dm_rc.tbempresas.FindField('INSCRICAO').AsString;
       Emit.xNome             := dm_rc.tbempresas.FindField('NOME').AsString;
       Emit.xFant             := dm_rc.tbempresas.FindField('FANTASIA').AsString;
       Emit.EnderEmit.xLgr    := dm_rc.tbempresas.FindField('ENDERECO').AsString;
       Emit.EnderEmit.nro     := dm_rc.tbempresas.FindField('NUMERO').AsString;
       Emit.EnderEmit.xCpl    := '';
       Emit.EnderEmit.xBairro := dm_rc.tbempresas.FindField('BAIRRO').AsString;
       Emit.EnderEmit.cMun    := dm_rc.tbempresas.FindField('IBGE').AsInteger;
       Emit.EnderEmit.xMun    := dm_rc.tbempresas.FindField('CIDADE').AsString;
       Emit.EnderEmit.CEP     := StrToIntDef(dm_rc.tbempresas.FindField('CEP').AsString, 0);
       Emit.EnderEmit.UF      := dm_rc.tbempresas.FindField('ESTADO').AsString;
       Emit.EnderEmit.fone    := dm_rc.tbempresas.FindField('TELEFONE').AsString;
       Emit.enderEmit.email   := dm_rc.tbempresas.FindField('EMAIL').AsString;

       Ide.tpEmit             := variif(dm_rc.fdqrymfmestre.FindField('TIPOEMITENTE').AsString = '0',
                                        teTransportadora,teTranspCargaPropria);
       Ide.modelo             := '58';
       Ide.serie              := 1;

       Ide.nMDF    := dm_rc.fdqrymfmestre.FindField('NUMERO').AsInteger;
       Ide.cMDF    := 1;
       Ide.dhEmi   := Now;
       Ide.tpEmis  := teNormal;
       Ide.procEmi := peAplicativoContribuinte;
       Ide.modal   := moRodoviario;
       Ide.verProc := '1.0';
       Ide.UFIni   := dm_rc.fdqrymfmestre.FindField('ESTADOINI').AsString;
       Ide.UFFim   := dm_rc.fdqrymfmestre.FindField('ESTADOFIN').AsString;
       Ide.cUF     := StrToInt(copy(dm_rc.tbempresas.findfield('IBGE').AsString,1,2));

      with seg.Add do
        begin
         if dm_rc.fdqrymfmestre.FindField('TIPOEMITENTE').AsInteger = 1 then
           begin
             respSeg := rsEmitente;
             xSeg    := '';
             nApol   := '';
             with aver.Add do
               nAver := '';
           end
         else
           begin
             respSeg        := rsEmitente;
             CNPJCPF        := dm_rc.tbempresas.FindField('CNPJ').AsString;
             xSeg           := dm_rc.fdqrymfmestre.FindField('NOMESEGURADORA').AsString;
             nApol          := dm_rc.fdqrymfmestre.FindField('APOLICE').AsString;
             CNPJ           := dm_rc.fdqrymfmestre.FindField('CNPJSEGURADORA').AsString;

             with aver.Add do
               begin
                 nAver := dm_rc.fdqrymfmestre.FindField('AVERBACAO').AsString;
               end;

             with rodo.infANTT do
               begin
                  with infContratante.Add do
                    begin
                      CNPJCPF := dm_rc.fdqrymfmestre.FindField('CPFCONDUTOR').AsString;
                    end;
               end;
            end;
        end;

       with Ide.infMunCarrega.Add do
         begin
           cMunCarrega := StrToInt(dm_rc.fdqrymfmestre.FindField('IBGECARREGAMENTO').AsString);
           xMunCarrega := dm_rc.fdqrymfmestre.FindField('CIDADECARREGAMENTO').AsString;
         end;

      if dm_rc.fdqrymfmestre.FindField('PERCURSO').AsString <> '' then
        begin
          M_PARCELA := Explode(dm_rc.fdqrymfmestre.FindField('PERCURSO').AsString,',');
          for I := 0 to M_PARCELA.Count - 1 do
            begin
              with Ide.infPercurso.Add do
                begin
                  UFPer := M_PARCELA[I];
                end;
            end;
        end;

       rodo.CIOT               := varIIF(dm_rc.fdqrymfmestre.FindField('CIOT').AsString = '','000000000000',
                                         dm_rc.fdqrymfmestre.FindField('CIOT').AsString);
       rodo.RNTRC              := dm_rc.fdqrymfmestre.FindField('RNTC').AsString;

       if dm_rc.fdqrymfmestre.FindField('PLACATRATOR').AsString <> '' then
         begin
           rodo.veicTracao.cInt    := '001';
           rodo.veicTracao.placa   := dm_rc.fdqrymfmestre.FindField('PLACATRATOR').AsString;
           rodo.veicTracao.RENAVAM := dm_rc.fdqrymfmestre.FindField('RENAVAM').AsString;
           rodo.veicTracao.tara    := dm_rc.fdqrymfmestre.FindField('TRATORTARA').AsInteger;
           rodo.veicTracao.capKG   := dm_rc.fdqrymfmestre.FindField('TRATORKG').AsInteger;
           rodo.veicTracao.capM3   := dm_rc.fdqrymfmestre.FindField('TRATORM3').AsInteger;
           rodo.veicTracao.UF      := dm_rc.fdqrymfmestre.FindField('ESTADOTRATOR').AsString;
         end;

       with rodo.veicTracao.condutor.Add do
        begin
          xNome := dm_rc.fdqrymfmestre.FindField('NOMETRANSPORTADORA').AsString;
          CPF   := RemoverEspeciais(dm_rc.fdqrymfmestre.FindField('CPFCNPJ').AsString);
        end;

       if dm_rc.fdqrymfmestre.FindField('PLACACARRETA').AsString <> '' then
         begin
           with rodo.veicReboque.Add do
            begin
              cInt    := '002';
              placa   := dm_rc.fdqrymfmestre.FindField('PLACACARRETA').AsString;
              RENAVAM := dm_rc.fdqrymfmestre.FindField('RENAVAM').AsString;
              tara    := dm_rc.fdqrymfmestre.FindField('CARRETATARA').AsInteger;
              capKG   := dm_rc.fdqrymfmestre.FindField('CARRETAKG').AsInteger;
              capM3   := dm_rc.fdqrymfmestre.FindField('CARRETAM3').AsInteger;
              UF      := dm_rc.fdqrymfmestre.FindField('ESTADOCARRETA').AsString;
              tpCar   := tcFechada;
            end;
         end;

       if dm_rc.fdqrymfmestre.FindField('PLACAREBOQUE').AsString <> '' then
         begin
           with rodo.veicReboque.Add do
            begin
              cInt    := '003';
              placa   := dm_rc.fdqrymfmestre.FindField('PLACAREBOQUE').AsString;
              RENAVAM := dm_rc.fdqrymfmestre.FindField('RENAVAM').AsString;
              tara    := dm_rc.fdqrymfmestre.FindField('REBOQUETARA').AsInteger;
              capKG   := dm_rc.fdqrymfmestre.FindField('REBOQUEKG').AsInteger;
              capM3   := dm_rc.fdqrymfmestre.FindField('REBOQUEM3').AsInteger;
              UF      := dm_rc.fdqrymfmestre.FindField('ESTADOREBOQUE').AsString;
              tpCar   := tcFechada;
            end;
         end;


       case dm_rc.fdqrymfmestre.FindField('TIPOVEICULO').AsInteger of
         0: rodo.veicTracao.tpRod := trTruck;
         1: rodo.veicTracao.tpRod := trToco;
         2: rodo.veicTracao.tpRod := trCavaloMecanico;
         3: rodo.veicTracao.tpRod := trVAN;
         4: rodo.veicTracao.tpRod := trUtilitario;
         5: rodo.veicTracao.tpRod := trOutros;
       end;

       case dm_rc.fdqrymfmestre.FindField('TIPOCARROCERIA').AsInteger of
         0: rodo.veicTracao.tpCar := tcAberta;
         1: rodo.veicTracao.tpCar := tcFechada;
         2: rodo.veicTracao.tpCar := tcGraneleira;
         3: rodo.veicTracao.tpCar := tcPortaContainer;
         4: rodo.veicTracao.tpCar := tcSider;
       end;

       case dm_rc.fdqrymfmestre.FindField('TIPOCARGA').AsInteger of
         0: M_TIPOCARGA := 'SACOS';
         1: M_TIPOCARGA := 'BAGS';
         2: M_TIPOCARGA := 'GRAOS';
         3: M_TIPOCARGA := 'PECAS';
       end;

       nota         := 0;
       conhecimento := 0;

       with infDoc.infMunDescarga.New do
         begin
           dm_rc.fdqrymfitens.First;
           while not dm_rc.fdqrymfitens.Eof do
            begin
              if dm_rc.fdqrymfmestre.FindField('IBGEDESCARREGAMENTO').AsString <> '' then
                begin
                  cMunDescarga := dm_rc.fdqrymfmestre.FindField('IBGEDESCARREGAMENTO').AsInteger;
                  xMunDescarga := dm_rc.fdqrymfmestre.FindField('CIDADEDESCARREGAMENTO').AsString;
                end
              else
                begin
                  cMunDescarga := dm_rc.fdqrymfitens.FindField('IBGE').AsInteger;
                  xMunDescarga := dm_rc.fdqrymfitens.FindField('CIDADE').AsString;
                end;

              if dm_rc.fdqrymfitens.findfield('TIPO').AsString = 'NFE' then
                begin
                 Inc(nota);
                 with infNFe.New do
                   begin
                     chNFe    := dm_rc.fdqrymfitens.findfield('CODIGOBARRAS').AsString;
                     with infUnidTransp.new do
                      begin
                         tpUnidTransp := utRodoTracao;
                         idUnidTransp := dm_rc.fdqrymfmestre.findfield('PLACATRATOR').AsString;

                        with lacUnidTransp.Add do
                         begin
                           nLacre := '123';
                         end;

                        with infUnidCarga.Add do
                         begin
                           tpUnidCarga := ucOutros;
                           idUnidCarga := M_TIPOCARGA;
                           with lacUnidCarga.Add do
                            begin
                             nLacre := '123';
                            end;
                           qtdRat := 1.0;
                         end;
                         qtdRat := 1.0;
                      end;
                   end;
                end;

              if dm_rc.fdqrymfitens.findfield('TIPO').AsString = 'CTE' then
                begin
                  Inc(conhecimento);
                  with infCTe.New  do
                    begin
                      chCTe    := dm_rc.fdqrymfitens.findfield('CODIGOBARRAS').AsString;
                      with infUnidTransp.New do
                       begin
                          tpUnidTransp := utRodoTracao;
                          idUnidTransp := M_TIPOCARGA;

                         with lacUnidTransp.Add do
                           begin
                            nLacre := '123';
                           end;

                         with infUnidCarga.Add do
                          begin
                            tpUnidCarga := ucOutros;
                            idUnidCarga := dm_rc.fdqrymfmestre.findfield('TIPOCARGA').AsString;
                            with lacUnidCarga.Add do
                             begin
                              nLacre := '123';
                             end;
                            qtdRat := 1.0;
                          end;
                          qtdRat := 1.0;
                       end;
                    end;
                end;
              dm_rc.fdqrymfitens.Next;
            end;

          if dm_rc.fdqrymfmestre.FindField('TIPOEMITENTE').AsInteger = 0  then
             begin
              prodPred.tpCarga := tcGranelSolido;
              prodPred.xProd   := dm_rc.fdqrymfmestre.findfield('TIPOCARGA').AsString;
              prodPred.NCM     := '12092900';
              prodPred.cEAN    := '78910180000105';
            end;

          tot.qCTe   := conhecimento;
          tot.qNFe   := nota;
          tot.qCarga := dm_rc.fdqrymfmestre.findfield('PESOBRUTO').AsFloat;
          tot.vCarga := dm_rc.fdqrymfmestre.findfield('TOTAL').AsFloat;
          tot.cUnid  := uKG;

          with lacres.Add do
            begin
              nLacre := '123';
            end;

          infAdic.infCpl     := '';
          infAdic.infAdFisco := '';
        end;
    end;
end;

function TfrmSEFAZMANIFESTO.trocanomearquivo(caminho,arq:string) :string;
var
  nomearq:string;
begin
  nomearq := ExtractFileName(arq);
  RenameFile(mm.M_PATHIMPRESSAO + nomearq, mm.M_PATHIMPRESSAO+M_ARQUIVOPDF);

  Result := M_ARQUIVOPDF;
end;

procedure TfrmSEFAZMANIFESTO.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmSEFAZMANIFESTO.UniBitBtn2Click(Sender: TObject);
begin
  UniPopupMenuencerramento.PopupBy( TUniButton( sender ) );
end;

procedure TfrmSEFAZMANIFESTO.UniFormCreate(Sender: TObject);
begin
  cFormModal   := mm.varC_Form_Modal;
end;

procedure TfrmSEFAZMANIFESTO.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TfrmSEFAZMANIFESTO.UniFormResize(Sender: TObject);
begin
  frmSEFAZMANIFESTO.Height   := 449;
  frmSEFAZMANIFESTO.Width    := 729;

  with frmSEFAZMANIFESTO.Constraints do
    begin
      MaxWidth  := 729;
      MinWidth  := 729;
      MaxHeight := 449;
      MinHeight := 449;
    end;

  frmSEFAZMANIFESTO.Position := poScreenCenter;
end;

procedure TfrmSEFAZMANIFESTO.UniFormShow(Sender: TObject);
begin
  HabilitaBotoes();
end;

procedure TfrmSEFAZMANIFESTO.UniMenuItem1Click(Sender: TObject);
var
  nPos              : Integer;
  M_LISTACHAVE, sql : string;
begin
  TabelaEmpresas(' select * from empresas where codigo    = ' + IntToStr(mm.varI_Code_Company));

  UniMemoresposta.Clear;
  UniMemorespostaXML.Clear;

  try
    dm_rc.ACBrMDFe.WebServices.ConsultaMDFeNaoEnc(dm_rc.tbempresas.FindField('CNPJ').AsString);
    UniMemorespostaXML.Lines.Text   := UTF8Encode(dm_rc.ACBrMDFe.WebServices.Consulta.RetornoWS);

    if dm_rc.ACBrMDFe.WebServices.ConsMDFeNaoEnc.cStat = 111 then
      begin
        for nPos := 0 to dm_rc.ACBrMDFe.WebServices.ConsMDFeNaoEnc.InfMDFe.Count - 1 do
          begin
            sql    := 'SELECT * FROM MFMESTRE WHERE CODIGOBARRAS   = ' + QuotedStr(dm_rc.ACBrMDFe.WebServices.ConsMDFeNaoEnc.InfMDFe[nPos].chMDFe);
            TabelaMfmestre(sql);
            UniMemoresposta.Lines.Add('Manifesto Nº ' + StrZeroS(dm_rc.fdqrymfmestre.FindField('NUMERO').AsString,5)  + ' Emissão : ' + dm_rc.fdqrymfmestre.FindField('EMISSAO').AsString + ' Chave : ' + dm_rc.fdqrymfmestre.FindField('CODIGOBARRAS').AsString);
          end;
      end;
    UniMemorespostaXML.Lines.Text   := UTF8Encode(dm_rc.ACBrMDFe.WebServices.ConsMDFeNaoEnc.RetornoWS);
  except
    UniMemoresposta.Lines.Add('Motivo.......: ' + dm_rc.ACBrMDFe.WebServices.Consulta.xMotivo);
    UniMemoresposta.Lines.Add('SEM CONEXÃO COM A SEFAZ - TENTE MAIS TARDE');
  end;
end;

end.
