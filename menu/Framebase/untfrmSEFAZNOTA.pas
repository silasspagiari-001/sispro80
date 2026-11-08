unit untfrmSEFAZNOTA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn,
  uniPageControl, uniLabel, uniEdit, uniDBEdit, UniButtonDbEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniBasicGrid, uniDBGrid, uniDateTimePicker,
  uniDBDateTimePicker, uniScrollBox, uniMultiItem, uniComboBox, uniDBComboBox,
  uniImage, uniMemo, Vcl.Menus, uniMainMenu, ACBrBase, ACBrDFe, ACBrNFe,
  ACBrDFeReport, ACBrDFeDANFeReport, ACBrNFeDANFEClass, ACBrNFeDANFEFR,ACBrDFeUtil,pcteConversaoCTe,ACBrUtil.Strings,uNFE;

type
  TfrmSEFAZNOTA = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniScrollBox1: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    btnENVIA: TUniBitBtn;
    btnSTATUS: TUniBitBtn;
    btnCONSULTA: TUniBitBtn;
    btnOPCOES: TUniBitBtn;
    UniBitBtnimpressao: TUniBitBtn;
    UniPopupMenudetalhessefaz: TUniPopupMenu;
    danfeinpressao: TUniMenuItem;
    enviaremail: TUniMenuItem;
    cancelamentoeletronico: TUniMenuItem;
    N1: TUniMenuItem;
    N2: TUniMenuItem;
    UniPageControlprincipal: TUniPageControl;
    UniTabSheetresposta: TUniTabSheet;
    rcBlock30: TUniContainerPanel;
    UniLabel20: TUniLabel;
    UniMemorespostaTXT: TUniMemo;
    rcBlock40: TUniContainerPanel;
    UniMemorespostaXML: TUniMemo;
    UniTabSheetcartacorrecao: TUniTabSheet;
    UniContainerPanel2: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniBitBtn2: TUniBitBtn;
    rcBlock70: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniMemocartacorrecao: TUniMemo;
    rcBlock80: TUniContainerPanel;
    UniMemorespostacartaXML: TUniMemo;
    UniPopupMenucartacorrecao: TUniPopupMenu;
    E1: TUniMenuItem;
    I1: TUniMenuItem;
    N4: TUniMenuItem;
    i2: TUniMenuItem;
    N3: TUniMenuItem;
    N5: TUniMenuItem;
    n6: TUniMenuItem;
    UniPopupMenumodoimpressao: TUniPopupMenu;
    I5: TUniMenuItem;
    N9: TUniMenuItem;
    i6: TUniMenuItem;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure btnOPCOESClick(Sender: TObject);
    procedure btnSTATUSClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnCONSULTAClick(Sender: TObject);
    procedure danfeinpressaoClick(Sender: TObject);
    procedure cancelamentoeletronicoClick(Sender: TObject);
    procedure btnENVIAClick(Sender: TObject);
    procedure UniBitBtn2Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure i2Click(Sender: TObject);
    procedure n6Click(Sender: TObject);
    procedure I5Click(Sender: TObject);
    procedure i6Click(Sender: TObject);
    procedure UniBitBtnimpressaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    { Public declarations }
    cMSG_BUGERROR_RECORDS_SELECTION,
    cMSG_RECORDS_FOUND : string ;
    cFormModal         : TUniForm;
   procedure ConfiguraAcbr(aempresa:integer);
   procedure HabilitaBotoes();
   procedure MontaXML(pcontrole:integer);
   procedure ValidaErros();
   procedure AtualizaNotas(tcancelada:string);
   procedure CarregaXML(pempresa,pcontrole:integer);
   procedure ModoImpressao;

  end;

function frmSEFAZNOTA: TfrmSEFAZNOTA;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, uconsts, untDM_RC, mkm_procedures,
  pcnConversao, blcksock, ACBrDFeSSL, untFrmTELAGENERICA, mkm_funcoes,
  pcnConversaoNFe, mkm_func_web, System.StrUtils, unReportImpressao,
  untFrmNOTAELETRONICA, Main, Vcl.Clipbrd;

var
  M_ARQUIVOPDF : string;
  M_ARQUIVOXML : string;

function frmSEFAZNOTA: TfrmSEFAZNOTA;
begin
  Result := TfrmSEFAZNOTA(mm.GetFormInstance(TfrmSEFAZNOTA));
end;

procedure TfrmSEFAZNOTA.AtualizaNotas(tcancelada: string);
begin
  TabelaMvmestre(' select * from mvmestre where codigo    = ' + IntToStr(mm.varI_Code_Documento_Controle));
  TabelaEmpresas(' select * from empresas where codigo    = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('EMPRESA').AsInteger));
  TabelaMvitens (' select * from mvitens  where numero    = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger)    +
                 ' and                          documento = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger) +
                 ' and                          empresa   = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('EMPRESA').AsInteger));
  TabelaPontos  (' select * from pontos   where numero    = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger)    +
                 ' and                          documento = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger) +
                 ' and                          empresa   = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('EMPRESA').AsInteger));

  dm_rc.FDQryMvmestre.Edit;
  if tcancelada = 'A' then
    begin
      dm_rc.FDQryMvmestre.FindField('CODIGOBARRAS').AsString := dm_rc.ACBrNFe.WebServices.Retorno.ChaveNFe;
      dm_rc.FDQryMvmestre.FindField('PROTOCOLO').AsString    := dm_rc.ACBrNFe.WebServices.Retorno.Protocolo;
    end;

  dm_rc.FDQryMvmestre.FindField('CANCELADA').AsString    := tcancelada;

  if tcancelada = 'A' then
    dm_rc.FDQryMvmestre.FindField('LOGENVIO').AsString     := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time)
  else
  if tcancelada = 'C' then
    begin
      dm_rc.FDQryMvmestre.FindField('LOGCANCELA').AsString   := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);

      executasql(' update receber set financeiro = ' + IntToStr(2) +
                 ' where numero                  = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger)   +
                 ' and documento                 = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger)+
                 ' and empresa                   = ' + IntToStr(mm.varI_Code_Company));
    end;

  dm_rc.FDQryMvmestre.Post;


  dm_rc.tbmvitens.First;
  while not dm_rc.tbmvitens.Eof do
    begin
      dm_rc.tbmvitens.Edit;
      dm_rc.tbmvitens.FindField('CANCELADA').AsString := tcancelada;
      dm_rc.tbmvitens.Post;

      dm_rc.tbmvitens.Next;
    end;

  dm_rc.fdqrypontos.First;
  while not dm_rc.fdqrypontos.Eof do
    begin
      dm_rc.fdqrypontos.Edit;
      dm_rc.fdqrypontos.FindField('CANCELADA').AsString := tcancelada;
      dm_rc.fdqrypontos.Post;
    {
      Calcula_Lote(mm.varI_Code_Company,
                   dm_rc.fdqrypontos.FindField('PRODUTO').AsInteger,
                   dm_rc.fdqrypontos.FindField('LOTESEMENTE').AsString);
    }
      dm_rc.fdqrypontos.Next;
    end;


  dm_rc.FDQryMvmestre.Refresh;
  dm_rc.tbmvitens.Refresh;
  dm_rc.fdqrypontos.Refresh;
end;

procedure TfrmSEFAZNOTA.btnCONSULTAClick(Sender: TObject);
begin
  ConfiguraAcbr(mm.varI_Code_Company);
  TabelaMvmestre('select * from mvmestre where codigo = ' + IntToStr(mm.varI_Code_Documento_Controle));

  UniMemorespostaTXT.Clear;
  UniMemorespostaXML.Clear;

  try
    dm_rc.ACBrNFe.NotasFiscais.Clear;
    dm_rc.ACBrNFe.WebServices.Consulta.NFeChave := dm_rc.FDQryMvmestre.FindField('codigobarras').AsString;
    dm_rc.ACBrNFe.WebServices.Consulta.Executar;

    UniMemorespostaXML.Lines.Text   := UTF8Encode(dm_rc.ACBrNFe.WebServices.Consulta.RetornoWS);

    UniMemorespostaTXT.Lines.Add('Ambiente.....: ' + TpAmbToStr(dm_rc.ACBrNFe.WebServices.Consulta.TpAmb));
    UniMemorespostaTXT.Lines.Add('cStat........: ' + IntToStr(dm_rc.ACBrNFe.WebServices.Consulta.cUF));
    UniMemorespostaTXT.Lines.Add('Motivo.......: ' + dm_rc.ACBrNFe.WebServices.Consulta.xMotivo);
    UniMemorespostaTXT.Lines.Add('Chave........: ' + dm_rc.ACBrNFe.WebServices.Consulta.NFeChave);
    UniMemorespostaTXT.Lines.Add('Protocolo....: ' + dm_rc.ACBrNFe.WebServices.Consulta.Protocolo);
    UniMemorespostaTXT.Lines.Add('dhRecbto.....: ' + DateTimeToStr(dm_rc.ACBrNFe.WebServices.Consulta.DhRecbto));
  except
    UniMemorespostaTXT.Lines.Add('Motivo.......: ' + dm_rc.ACBrNFe.WebServices.Consulta.xMotivo);
    UniMemorespostaTXT.Lines.Add('SEM CONEXÃO COM A SEFAZ - TENTE MAIS TARDE');
  end;
end;

procedure TfrmSEFAZNOTA.btnENVIAClick(Sender: TObject);
begin

  UniMemorespostaTXT.Clear;
  UniMemorespostaXML.Clear;

//  ConfiguraAcbr(mm.varI_Code_Company);
//  MontarXML(mm.varI_Code_Documento_Controle);

  try
    ConfiguraAcbr(mm.varI_Code_Company);
    MontarXML(mm.varI_Code_Documento_Controle);

    // Continua com GerarNFe, Assinar, Validar e Enviar...
  except
    on E: Exception do
    begin
      UniMemorespostaTXT.Lines.Add(E.Message);
    end;
  end;


  try
    dm_rc.ACBrNFe.Configuracoes.Geral.ExibirErroSchema := True;
    dm_rc.ACBrNFe.Configuracoes.Arquivos.PathSalvar :=
    Validacaminho(mm.varI_Code_Company,mm.M_PATHXML,dm_rc.tbempresas.FindField('cnpj').AsString,'NFe',dm_rc.FDQryMvmestre.FindField('EMISSAO').AsString,'');

    dm_rc.ACBrNFe.NotasFiscais.GerarNFe;
    dm_rc.ACBrNFe.NotasFiscais.Assinar;
    dm_rc.ACBrNFe.NotasFiscais.Validar;

    if dm_rc.ACBrNFe.Enviar(1, False, True, False) then
      dm_rc.ACBrNFe.NotasFiscais.Items[0].GravarXML();

    UniMemorespostaXML.Lines.Text   := UTF8Encode(dm_rc.ACBrNFe.WebServices.Retorno.RetornoWS);

    if StrContains('100#150#103',IntToStr(dm_rc.ACBrNFe.WebServices.retorno.cStat))then
      begin
        AtualizaNotas('A');
        UniMemorespostaTXT.Lines.Add('NOTA FISCAL ENVIADA COM SUCESSO!');
        UniMemorespostaTXT.Lines.Add('Motivo.......: ' + dm_rc.ACBrNFe.WebServices.Retorno.xMotivo);
        UniMemorespostaTXT.Lines.Add('Ambiente.....: ' + TpAmbToStr(dm_rc.ACBrNFe.WebServices.Retorno.TpAmb));
        UniMemorespostaTXT.Lines.Add('Chave........: ' + dm_rc.ACBrNFe.WebServices.Retorno.ChaveNFe);
        UniMemorespostaTXT.Lines.Add('Protocolo....: ' + dm_rc.ACBrNFe.WebServices.Retorno.Recibo);
        UniMemorespostaTXT.Lines.Add('Recibo.......: ' + dm_rc.ACBrNFe.WebServices.Retorno.Protocolo);
        HabilitaBotoes();
      end;
//    UniMemorespostaTXT.Lines.Add('Motivo.......: ' + dm_rc.ACBrNFe.WebServices.Retorno.xMotivo);
    except
      on E: Exception do
      begin
        UniMemorespostaTXT.Lines.Add(
          'Falha ao processar a nota fiscal:');
        UniMemorespostaTXT.Lines.Add(E.Message);
        dm_rc.rc_ShowSweetAlert(
          'Nota fiscal',
          'Não foi possível concluir a operação. Consulte a mensagem na aba Resposta.',
          'error');
      end;

  end;
end;

procedure TfrmSEFAZNOTA.btnOPCOESClick(Sender: TObject);
begin
  UniPopupMenudetalhessefaz.PopupBy( TUniButton( sender ) );
end;

procedure TfrmSEFAZNOTA.btnSTATUSClick(Sender: TObject);
begin
  UniMemorespostaTXT.Clear;
  UniMemorespostaXML.Clear;
  try
    ConfiguraAcbr(mm.varI_Code_Company);
    dm_rc.ACBrNFe.WebServices.StatusServico.Executar;
//    UniMemorespostaXML.Lines.Text := UTF8Encode(dm_rc.ACBrNFe.WebServices.StatusServico.RetornoWS);
//    UniMemorespostaXML.Lines.Text := dm_rc.ACBrNFe.WebServices.StatusServico.RetornoWS;

    UniMemorespostaXML.Lines.Text :=  UTF8ToNativeString( AnsiString( dm_rc.ACBrNFe.WebServices.StatusServico.RetornoWS ) );
    UniMemorespostaTXT.Lines.Add('Status Serviço');
    UniMemorespostaTXT.Lines.Add('Ambiente.....: ' + TpAmbToStr(dm_rc.ACBrNFe.WebServices.StatusServico.tpAmb));
    UniMemorespostaTXT.Lines.Add('cStat........: ' + IntToStr(dm_rc.ACBrNFe.WebServices.StatusServico.cStat));
    UniMemorespostaTXT.Lines.Add('UF...........: ' + IntToStr(dm_rc.ACBrNFe.WebServices.StatusServico.cUF));
    UniMemorespostaTXT.Lines.Add('Versão Aplic.: ' + dm_rc.ACBrNFe.WebServices.StatusServico.verAplic);
    UniMemorespostaTXT.Lines.Add('Motivo.......: ' + dm_rc.ACBrNFe.WebServices.StatusServico.xMotivo);
    UniMemorespostaTXT.Lines.Add('dhRecbto.....: ' + DateTimeToStr(dm_rc.ACBrNFe.WebServices.StatusServico.dhRecbto));
  except
    on E: Exception do
    begin
      UniMemorespostaTXT.Lines.Add('Falha ao consultar a SEFAZ:');
      UniMemorespostaTXT.Lines.Add(E.Message);
    end;
  end;
end;

procedure TfrmSEFAZNOTA.cancelamentoeletronicoClick(Sender: TObject);
var
  NumeroLote      : Integer;
begin
  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(mm.varI_Code_Company));
  TabelaMvmestre('select * from mvmestre where codigo = ' + IntToStr(mm.varI_Code_Documento_Controle));

  ConfiguraAcbr(mm.varI_Code_Company);
  UniMemorespostaTXT.Clear;
  UniMemorespostaXML.Clear;

  NumeroLote                     := random(20);
  dm_rc.ACBrNFe.EventoNFe.idLote := NumeroLote;

  with dm_rc.ACBrNFe.EventoNFe.Evento.New do
    begin
      infEvento.chNFe           := Copy(dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID,4,44);
      infEvento.CNPJ            := dm_rc.tbempresas.findfield('CNPJ').AsString;
      infEvento.dhEvento        := now;
      infEvento.tpEvento        := teCancelamento;
      infEvento.detEvento.xJust := 'Emissao indevida por valores ou dados inconsistentes';
      infEvento.detEvento.nProt := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.procNFe.nProt;
    end;


  try
    dm_rc.ACBrNFe.EnviarEvento(NumeroLote) ;
    UniMemorespostaXML.Lines.Text             := UTF8Encode(dm_rc.ACBrNFe.WebServices.EnvEvento.RetornoWS);

    UniMemorespostaTXT.Lines.Add('Ambiente.....: ' + TpAmbToStr(dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.tpAmb));
    UniMemorespostaTXT.Lines.Add('cStat........: ' + IntToStr(dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat));
    UniMemorespostaTXT.Lines.Add('Motivo.......: ' + dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.xMotivo);
    UniMemorespostaTXT.Lines.Add('Protocolo....: ' + dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt);
    UniMemorespostaTXT.Lines.Add('dhRecbto.....: ' + DateTimeToStr(dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento));

    EventoXmlAcbr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsString,
                  dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsString,
                  dm_rc.FDQryMvmestre.FindField('EMPRESA').AsString,
                  'C');

    AtualizaNotas('C');
    HabilitaBotoes();
  except
    UniMemorespostaTXT.Lines.Add('Motivo.......: ' + dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.xMotivo);
  end;
end;

procedure TfrmSEFAZNOTA.CarregaXML(pempresa, pcontrole: integer);
begin
  SqlPesquisa   (' select * from mvmestre where codigo = ' + IntToStr(pcontrole));
  TabelaEmpresas(' select * from empresas where codigo = ' + IntToStr(pempresa));

  M_ARQUIVOXML := Validacaminho(pempresa,mm.M_PATHXML,mm.varC_Doc_Customer,'NFe',dm_rc.sqlBuscas.FindField('EMISSAO').AsString,'') + dm_rc.sqlBuscas.FindField('CODIGOBARRAS').AsString + '-nfe.xml';

  if dm_rc.sqlBuscas.FindField('CANCELADA').AsString = 'C' then
    dm_rc.ACBrNFeDANFeRL.Cancelada := True
  else
  if (dm_rc.sqlBuscas.FindField('CANCELADA').AsString = 'A') or (dm_rc.sqlBuscas.FindField('CANCELADA').AsString = '') then
    dm_rc.ACBrNFeDANFeRL.Cancelada := False;


  try
//    clipboard.astext := M_ARQUIVOXML;
    dm_rc.ACBrNFe.NotasFiscais.Clear;
    dm_rc.ACBrNFe.NotasFiscais.LoadFromFile(M_ARQUIVOXML);
  except
  end;

end;

procedure TfrmSEFAZNOTA.ConfiguraAcbr(aempresa: integer);
begin
  TabelaEmpresas('SELECT * FROM EMPRESAS WHERE CODIGO = ' + IntToStr(aempresa));

  M_ARQUIVOPDF := Gera_Guid()+'.pdf';

  dm_rc.ACBrNFe.WebServices.Retorno.Clear;

  dm_rc.ACBrNFe.Configuracoes.WebServices.UF              :=  dm_rc.tbempresas.FindField('ESTADO').AsString;
  dm_rc.ACBrNFe.Configuracoes.Arquivos.PathSchemas        :=  'C:\Arquivos\Schemas\NFe\';
  dm_rc.ACBrNFe.Configuracoes.Arquivos.PathSalvar         :=  'C:\Arquivos\temp\';

  if dm_rc.tbempresas.FindField('TIPO_AMBIENTE').AsString = 'Produção' then
    dm_rc.ACBrNFe.Configuracoes.WebServices.Ambiente        :=  taProducao
  else
    dm_rc.ACBrNFe.Configuracoes.WebServices.Ambiente        :=  taHomologacao;

  //*************************************************************************
  dm_rc.AcbrNFE.Configuracoes.WebServices.IntervaloTentativas      :=  2000;
  dm_rc.AcbrNFE.Configuracoes.WebServices.TimeOut                  :=  4000;
  dm_rc.AcbrNFE.Configuracoes.WebServices.Tentativas               :=  5;
  dm_rc.AcbrNFE.Configuracoes.WebServices.AguardarConsultaRet      :=  3000;
  dm_rc.ACBrNFe.Configuracoes.WebServices.AjustaAguardaConsultaRet := True;

  dm_rc.ACBrNFe.Configuracoes.Geral.ExibirErroSchema               := False;
  dm_rc.ACBrNFe.Configuracoes.Geral.VersaoDF                       := ve400;
  //*************************************************************************
  dm_rc.ACBrNFe.SSL.SSLType                               :=  TSSLType(LT_TLSv1_2);
  dm_rc.ACBrNFe.Configuracoes.Geral.SSLLib                :=  libWinCrypt;
  dm_rc.ACBrNFe.Configuracoes.Geral.SSLCryptLib           :=  cryWinCrypt;
  dm_rc.ACBrNFe.Configuracoes.Geral.SSLHttpLib            :=  httpWinHttp;
  dm_rc.ACBrNFe.Configuracoes.Geral.SSLXmlSignLib         :=  xsLibXml2;
  dm_rc.ACBrNFe.Configuracoes.Geral.AtualizarXMLCancelado :=  True;

  dm_rc.AcbrNFE.Configuracoes.Certificados.NumeroSerie    :=  dm_rc.tbempresas.FindField('CERTIFICADO_CHAVE').AsString;
  dm_rc.ACBrNFe.Configuracoes.Certificados.Senha          :=  dm_rc.tbempresas.FindField('CERTIFICADO_SENHA').AsString;
  //*************************************************************************
  //IMPRESSAO
  //*************************************************************************
  dm_rc.ACBrNFeDANFeRL.NomeDocumento                      :=  M_ARQUIVOPDF;
  dm_rc.ACBrNFeDANFeRL.PathPDF                            :=  dm_rc.tbempresas.FindField('caminho_impressao').AsString;
  dm_rc.ACBrNFeDANFeRL.Logo                               :=  dm_rc.tbempresas.FindField('caminho_logo').AsString;
  dm_rc.ACBrNFeDANFeRL.Sistema                            :=  'Sisgrãos - Sistema de gerenciamento de Sementeiras e Laboratórios';
  dm_rc.ACBrNFeDANFeRL.Site                               :=  'www.sisgraos.com.br';

  dm_rc.ACBrNFeDANFeRL.ImprimeNomeFantasia                :=  variif(dm_rc.tbempresas.FindField('IMP_FANTASIA').AsString           = 'T',True,False);
  dm_rc.ACBrNFeDANFeRL.LogoemCima                         :=  variif(dm_rc.tbempresas.FindField('IMP_LOGO').AsString               = 'T',True,False);
  dm_rc.ACBrNFeDANFeRL.ExibeCampoFatura                   :=  variif(dm_rc.tbempresas.FindField('IMP_EXIBEFATURA').AsString        = 'T',True,False);
  dm_rc.ACBrNFeDANFeRL.ExibeDadosDocReferenciados         :=  variif(dm_rc.tbempresas.FindField('IMP_DADOSREFERENCIADOS').AsString = 'T',True,False);
  dm_rc.ACBrNFeDANFeRL.ExibeResumoCanhoto                 :=  variif(dm_rc.tbempresas.FindField('IMP_RESUMOCANHOTO').AsString      = 'T',True,False);
  dm_rc.ACBrNFeDANFeRL.ExibeTotalTributosItem             :=  variif(dm_rc.tbempresas.FindField('IMP_TRIBUTOSIMP').AsString        = 'T',True,False);
  dm_rc.ACBrNFeDANFeRL.ExpandirDadosAdicionaisAuto        :=  variif(dm_rc.tbempresas.FindField('IMP_DADOSADICIONAIS').AsString    = 'T',True,False);

  if dm_rc.tbempresas.FindField('IMP_EXIBIINFOPRODUTO').AsString  = 'Nenhum' then
    dm_rc.ACBrNFeDANFeRL.ExibeInforAdicProduto              :=  infNenhum;
  if dm_rc.tbempresas.FindField('IMP_EXIBIINFOPRODUTO').AsString  = 'Descrição' then
    dm_rc.ACBrNFeDANFeRL.ExibeInforAdicProduto              :=  infDescricao;
  if dm_rc.tbempresas.FindField('IMP_EXIBIINFOPRODUTO').AsString  = 'Separadamente' then
    dm_rc.ACBrNFeDANFeRL.ExibeInforAdicProduto              :=  infSeparadamente;


  dm_rc.ACBrNFeDANFeRL.MargemDireita                      :=  dm_rc.tbempresas.FindField('IMP_MARGEM_DIREITA').AsFloat;
  dm_rc.ACBrNFeDANFeRL.MargemEsquerda                     :=  dm_rc.tbempresas.FindField('IMP_MARGEM_ESQUERDA').AsFloat;
  dm_rc.ACBrNFeDANFeRL.MargemInferior                     :=  dm_rc.tbempresas.FindField('IMP_MARGEM_INFERIOR').AsFloat;
  dm_rc.ACBrNFeDANFeRL.MargemSuperior                     :=  dm_rc.tbempresas.FindField('IMP_MARGEM_SUPERIOR').AsFloat;

  dm_rc.ACBrNFeDANFeRL.MostraPreview                      :=  False;
  dm_rc.ACBrNFeDANFeRL.MostraSetup                        :=  False;
  dm_rc.ACBrNFeDANFeRL.MostraStatus                       :=  False;
  //*************************************************************************
end;

procedure TfrmSEFAZNOTA.danfeinpressaoClick(Sender: TObject);
begin
  ConfiguraAcbr(mm.varI_Code_Company);
  TabelaMvmestre('select * from mvmestre where codigo = ' + IntToStr(mm.varI_Code_Documento_Controle));
  if (dm_rc.FDQryMvmestre.FindField('CANCELADA').AsString = 'A') or (dm_rc.FDQryMvmestre.FindField('CANCELADA').AsString = 'C') then
    CarregaXML(mm.varI_Code_Company,mm.varI_Code_Documento_Controle)
  else
    begin
      MontaXML(mm.varI_Code_Documento_Controle);
      dm_rc.ACBrNFe.NotasFiscais.GerarNFe;
    end;

  dm_rc.ACBrNFe.NotasFiscais.ImprimirPDF;
  mm.varC_caminhopdf :=  M_ARQUIVOPDF;

  unfImpressao.ShowModal();
end;

procedure TfrmSEFAZNOTA.E1Click(Sender: TObject);
var
 Chave, idLote, CNPJ, nSeqEvento, coduso: string;
 I : Integer;
begin
  if Length(UniMemocartacorrecao.Text) < 15 then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'DESCRIÇÃO DA CARTA MENOR QUE 15 CARACTERES' , 'error');
      abort;
    end;

  ConfiguraAcbr(mm.varI_Code_Company);
  TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(mm.varI_Code_Company));
  TabelaMvmestre('select * from mvmestre where codigo = ' + IntToStr(mm.varI_Code_Documento_Controle));

  dm_rc.FDQryMvmestre.Edit;
  dm_rc.FDQryMvmestre.FindField('CARTACORRECAO').AsString := UniMemocartacorrecao.Text;
  dm_rc.FDQryMvmestre.Post;

  UniMemorespostaTXT.Clear;
  UniMemorespostaXML.Clear;
  UniMemorespostacartaXML.Clear;

  idLote     := IntToStr(Random(15));
  nSeqEvento := IntToStr(Random(15));

  with dm_rc.ACBrNFe.EventoNFe.Evento.New do
    begin
      infEvento.chNFe               := dm_rc.FDQryMvmestre.FindField('CODIGOBARRAS').AsString;
      infEvento.CNPJ                := dm_rc.tbempresas.FindField('CNPJ').AsString;
      InfEvento.cOrgao              := StrToInt(copy(dm_rc.tbempresas.findfield('IBGE').AsString,1,2));
      infEvento.dhEvento            := now;
      infEvento.tpEvento            := teCCe;
      infEvento.nSeqEvento          := StrToInt(nSeqEvento);
      infEvento.detEvento.xCorrecao := dm_rc.FDQryMvmestre.FindField('CARTACORRECAO').AsString;
    end;


  dm_rc.ACBrNFe.EnviarEvento(StrToInt(idLote));
  UniMemorespostaXML.Lines.Text             := UTF8Encode(dm_rc.ACBrNFe.WebServices.EnvEvento.RetornoWS);

  UniMemorespostacartaXML.Lines.Add('Ambiente.....: ' + TpAmbToStr(dm_rc.AcbrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.tpAmb));
  UniMemorespostacartaXML.Lines.Add('cStat........: ' + IntToStr(dm_rc.AcbrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.cStat));
  UniMemorespostacartaXML.Lines.Add('Motivo.......: ' + dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.xMotivo);
  UniMemorespostacartaXML.Lines.Add('Protocolo....: ' + dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt);
  UniMemorespostacartaXML.Lines.Add('dhRecbto.....: ' + DateTimeToStr(dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento));

  if StrContains('135#128#103', IntToStr(dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.cStat)) then
    begin

      dm_rc.FDQryMvmestre.Edit;
      dm_rc.FDQryMvmestre.FindField('DATACARTA').AsString         := DateToStr(Date);
      dm_rc.FDQryMvmestre.FindField('LOGCARTA').AsString          := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);
      dm_rc.FDQryMvmestre.FindField('BARRASCORRECAO').AsString    := dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.chNFe;
      dm_rc.FDQryMvmestre.FindField('PROTOCOLOCORRECAO').AsString := dm_rc.ACBrNFe.WebServices.EnvEvento.EventoRetorno.retEvento.Items[0].RetInfEvento.nProt;
      dm_rc.FDQryMvmestre.Post;

      EventoXmlAcbr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsString,
                    dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsString,
                    dm_rc.FDQryMvmestre.FindField('EMPRESA').AsString,
                    'CCE');
    end;

end;

procedure TfrmSEFAZNOTA.HabilitaBotoes;
begin
  SqlPesquisa('select codigobarras, protocolo, cancelada from mvmestre where codigo = ' + IntToStr(mm.varI_Code_Documento_Controle));

  if dm_rc.sqlBuscas.FindField('CANCELADA').AsString = 'A' then
    begin
      CarregaXML(mm.varI_Code_Company,mm.varI_Code_Documento_Controle);
      btnENVIA.Enabled               := False;
      btnCONSULTA.Enabled            := True;
      cancelamentoeletronico.Enabled := true;
      enviaremail.Enabled            := True;
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
      enviaremail.Enabled            := False;
      danfeinpressao.Enabled         := True;
      i2.Enabled                     := True;
    end
  else
    begin
      btnENVIA.Enabled               := True;
      btnCONSULTA.Enabled            := False;
      cancelamentoeletronico.Enabled := False;
      enviaremail.Enabled            := False;
      danfeinpressao.Enabled         := True;
      i2.Enabled                     := False;
    end;
end;

procedure TfrmSEFAZNOTA.I1Click(Sender: TObject);
begin
  ConfiguraAcbr(mm.varI_Code_Company);
  TabelaMvmestre (' select * from mvmestre   where codigo    = ' + IntToStr(mm.varI_Code_Documento_Controle));
  TabelaEventoXML(' select * from eventosxml where numero    = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger)    +
                  ' and                            documento = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger) +
                  ' and                            empresa   = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('EMPRESA').AsInteger)   +
                  ' and tipo                                 = ' + QuotedStr('CCE'));

  dm_rc.AcbrNFE.EventoNFe.LerXMLFromString(dm_rc.fdqryeventoxml.FindField('xml').AsString);
  dm_rc.AcbrNFE.ImprimirEventoPDF;

  mm.varC_caminhopdf :=  M_ARQUIVOPDF;

  unfImpressao.ShowModal();
end;

procedure TfrmSEFAZNOTA.i2Click(Sender: TObject);
begin
  ConfiguraAcbr(mm.varI_Code_Company);
  TabelaMvmestre (' select * from mvmestre   where codigo    = ' + IntToStr(mm.varI_Code_Documento_Controle));
  TabelaEventoXML(' select * from eventosxml where numero    = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger)    +
                  ' and                            documento = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger) +
                  ' and                            empresa   = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('EMPRESA').AsInteger) +
                  ' and tipo                                 = ' + QuotedStr('C'));

  dm_rc.AcbrNFE.EventoNFe.LerXMLFromString(dm_rc.fdqryeventoxml.FindField('xml').AsString);
  dm_rc.AcbrNFE.ImprimirEventoPDF;

  mm.varC_caminhopdf :=  M_ARQUIVOPDF;

  unfImpressao.ShowModal();
end;

procedure TfrmSEFAZNOTA.I5Click(Sender: TObject);
begin
  dm_rc.ACBrNFeDANFeRL.TipoDANFE := tiRetrato;
  ModoImpressao;
end;

procedure TfrmSEFAZNOTA.i6Click(Sender: TObject);
begin
  dm_rc.ACBrNFeDANFeRL.TipoDANFE := tiSimplificado;
  ModoImpressao;
end;

procedure TfrmSEFAZNOTA.ModoImpressao;
begin
  ConfiguraAcbr(mm.varI_Code_Company);
  TabelaMvmestre('select * from MVMESTRE where CODIGO = ' +
    IntToStr(mm.varI_Code_Documento_Controle));

  if StrContains('A#C', dm_rc.FDQryMvmestre.FindField('CANCELADA').AsString) then
    CarregaXML(mm.varI_Code_Company, mm.varI_Code_Documento_Controle)
  else
  begin
    MontaXML(mm.varI_Code_Documento_Controle);
    dm_rc.ACBrNFe.NotasFiscais.GerarNFe;
  end;

  dm_rc.ACBrNFe.NotasFiscais.ImprimirPDF;
  mm.varC_caminhopdf := M_ARQUIVOPDF;
  unfImpressao.ShowModal();
end;

procedure TfrmSEFAZNOTA.MontaXML(pcontrole: integer);
var
  M_ITENS                               : Integer;
  base0, base1, UFDestino               : Real;
  totpis,totcofins                      : Real;
  consumidor, estado, contribuinte, desc: string;
  Total_Imposto, Perc_Imposto           : Real;
begin
  TabelaMvmestre  (' select * from mvmestre where codigo      = ' + IntToStr(pcontrole));
  TabelaEmpresas  (' select * from empresas where codigo      = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('EMPRESA').AsInteger));
  TabelaPessoas   (' select * from pessoas  where codigo      = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('PESSOA').AsInteger));
  TabelaTransporte(' select * from transportes where codigo   = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('TRANSPORTADORA').AsInteger));
  TabelaOperacao  (' select * from operacoes where codigo     = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('OPERACAO').AsInteger));
  Tabelaescritas  (' select * from escritas where codigo      = ' + IntToStr(dm_rc.FDQryoperacoes.FindField('ESCRITA').AsInteger));
  TabelaTitulos   (' select * from                              ' + variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'receber','pagar')+
                   ' where numero                             = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger) +
                   ' and                         documento    = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger) +
                   ' and                         empresa      = ' + IntToStr(mm.varI_Code_Company)                                 +
                   ' order by sequencia                         ');
  TabelaMvitens   (' select * from mvitens  where numero      = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger)    +
                   ' and                         documento    = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger) +
                   ' and                         empresa      = ' + IntToStr(mm.varI_Code_Company)                                 +
                   ' order by sequencia                      ');

  //IMPOSTO
  Total_Imposto := 0;
  Perc_Imposto  := 31.45;
  Total_Imposto := MRound((dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat * Perc_Imposto) / 100,2);

  dm_rc.ACBrNFe.NotasFiscais.Clear;
  with dm_rc.ACBrNFe.NotasFiscais.Add.NFe do
    begin
        infRespTec.CNPJ     := '13308121000147';
        infRespTec.xContato := 'DIOGENES HENRIQUE DA FONSECA SILVA';
        infRespTec.email    := 'contato@sislite.com.br';
        infRespTec.fone     := '18996573931';

        Ide.natOp           := dm_rc.FDQryoperacoes.FindField('DESCRICAO').AsString;
        Ide.nNF             := dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger;
        Ide.cNF             := GerarCodigoDFe(Ide.nNF);
        Ide.serie           := 1;
        Ide.modelo          := 55;

        if dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Complementar' then
          begin
            Ide.finNFe           := fnComplementar;
            Ide.NFref.Add.refNFe := dm_rc.FDQryMvmestre.FindField('CODIGOBARRASCOMPLEMENTO').AsString;
          end
        else
        if dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Devolucao' then
          begin
            Ide.finNFe           := fnDevolucao;
            Ide.NFref.Add.refNFe := dm_rc.FDQryMvmestre.FindField('CODIGOBARRASCOMPLEMENTO').AsString;
          end
        else
          Ide.finNFe  := fnNormal;

        Ide.dEmi      := dm_rc.FDQryMvmestre.FindField('EMISSAO').AsDateTime;
        Ide.dSaiEnt   := dm_rc.FDQryMvmestre.FindField('RECEPCAODESPACHO').AsDateTime;
        Ide.hSaiEnt   := Now;

        if dm_rc.tbempresas.FindField('TIPO_AMBIENTE').AsString = 'Produção' then
          Ide.tpAmb     := taProducao
        else
          Ide.tpAmb     := taHomologacao;

        Ide.tpImp     := tiRetrato;
        Ide.verProc   := 'Sisgrãos 2.0.0';
        Ide.cUF       := StrToInt(Copy(dm_rc.tbempresas .FindField('IBGE').AsString,1,2));
        Ide.cMunFG    := StrToInt(dm_rc.tbempresas .FindField('IBGE').AsString);
        Ide.indFinal  := cfNao;

        if dm_rc.FDQryoperacoes.FindField('ENTRADA_SAIDA').AsInteger = 1 then
          Ide.tpNF      := tnSaida     else  Ide.tpNF      := tnEntrada;

      if StrContains('Devolucao#Complementar',dm_rc.FDQryoperacoes.FindField('TIPO').AsString) then
        Ide.indPag    := ipOutras
      else
        begin
          if dm_rc.FDQryMvmestre.FindField('CONDICAO').AsInteger < 3 then
             Ide.indPag    := ipVista
          else
          if dm_rc.FDQryMvmestre.FindField('CONDICAO').AsInteger > 9 then
            Ide.indPag    := ipPrazo   else  Ide.indPag    := ipOutras;
        end;

      if dm_rc.tbempresas.FindField('ESTADO').AsString = dm_rc.FDQryPessoas.FindField('ESTADO').AsString then
        Ide.idDest := doInterna
      else
        if dm_rc.tbempresas.FindField('ESTADO').AsString <> dm_rc.FDQryPessoas.FindField('ESTADO').AsString then
          Ide.idDest := doInterestadual
      else
        if dm_rc.FDQryPessoas.FindField('ESTADO').AsString = 'EX' then
          Ide.idDest := doExterior;

      //********************************************************************************************************************************
      // EMITENTE
      //********************************************************************************************************************************
      Emit.CNPJCPF            := StrAllTrim(dm_rc.tbempresas.FindField('CNPJ').AsString);
      Emit.IE                 := RemoverEspeciais(dm_rc.tbempresas.FindField('INSCRICAO').AsString);
      Emit.xNome              := RemoverEspeciais(dm_rc.tbempresas.FindField('NOME').AsString);
      Emit.xFant              := RemoverEspeciais(dm_rc.tbempresas.FindField('FANTASIA').AsString);
      Emit.EnderEmit.fone     := RemoverEspeciais(dm_rc.tbempresas.FindField('TELEFONE').AsString);
      Emit.EnderEmit.CEP      := StrToInt(dm_rc.tbempresas.FindField('CEP').AsString);
      Emit.EnderEmit.xLgr     := RemoverEspeciais(dm_rc.tbempresas.FindField('ENDERECO').AsString);
      Emit.EnderEmit.nro      := RemoverEspeciais(dm_rc.tbempresas.FindField('NUMERO').AsString);
      Emit.EnderEmit.xBairro  := RemoverEspeciais(dm_rc.tbempresas.FindField('BAIRRO').AsString);
      Emit.EnderEmit.cMun     := StrToInt(dm_rc.tbempresas.FindField('IBGE').AsString);
      Emit.EnderEmit.xMun     := RemoverEspeciais(dm_rc.tbempresas.FindField('CIDADE').AsString);
      Emit.EnderEmit.UF       := dm_rc.tbempresas.FindField('ESTADO').AsString;
      Emit.enderEmit.cPais    := 1058;
      Emit.enderEmit.xPais    := 'BRASIL';

      if dm_rc.tbempresas.FindField('TIPO').AsString = 'Lucro Real/Presumido' then
        Emit.CRT              := crtRegimeNormal
      else
        Emit.CRT              := crtSimplesNacional;

      Emit.CNAE               := '';
      Emit.IM                 := '';

      if dm_rc.FDQryPessoas.FindField('ESTADO').AsString = 'EX' then
        begin
          Dest.CNPJCPF                := StrAllTrim(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
          Dest.xNome                  := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('NOME').AsString);
          Dest.EnderDest.xLgr         := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('ENDERECO').AsString);
          Dest.EnderDest.nro          := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('NUMERO').AsString);
          Dest.EnderDest.CEP          := StrToInt(dm_rc.FDQryPessoas.FindField('CEP').AsString);
          Dest.EnderDest.cMun         := dm_rc.FDQryPessoas.FindField('IBGE').AsInteger;
          Dest.EnderDest.xMun         := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('CIDADE').AsString);
          Dest.EnderDest.UF           := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
          Dest.EnderDest.Fone         := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('TELEFONE').AsString);
          Dest.EnderDest.xBairro      := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('BAIRRO').AsString);
          Dest.EnderDest.cPais        := dm_rc.FDQryPessoas.FindField('IBGE').AsInteger;
          Dest.EnderDest.xPais        := dm_rc.FDQryPessoas.FindField('PAIS').AsString;

          //******************************************************************************************************************************//
          // DADOS PARA EXPORTAÇÃO
          //******************************************************************************************************************************//
          exporta.UFSaidaPais         := dm_rc.FDQryPessoas.FindField('ESTADOEXPORTACAO').AsString;
          exporta.xLocExporta         := dm_rc.FDQryPessoas.FindField('LOCALEXPORTACAO').AsString;
        end
      else
        begin
          Dest.CNPJCPF                := StrAllTrim(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
          Dest.xNome                  := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('NOME').AsString);
          Dest.EnderDest.xLgr         := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('ENDERECO').AsString);
          Dest.EnderDest.nro          := variif(dm_rc.FDQryPessoas.FindField('NUMERO').AsString = '','S/N',RemoverEspeciais(dm_rc.FDQryPessoas.FindField('NUMERO').AsString));
          Dest.EnderDest.CEP          := StrToInt(dm_rc.FDQryPessoas.FindField('CEP').AsString);
          Dest.EnderDest.cMun         := dm_rc.FDQryPessoas.FindField('CODIIBGE').AsInteger;
          Dest.EnderDest.xMun         := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('CIDADE').AsString);
          Dest.EnderDest.UF           := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
          Dest.EnderDest.Fone         := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('TELEFONE').AsString);
          Dest.ISUF                   := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('SUFRAMA').AsString);

          if not StrEmpty(dm_rc.FDQryPessoas.FindField('BAIRRO').AsString) then
            Dest.EnderDest.xBairro    := RemoverEspeciais(dm_rc.FDQryPessoas.FindField('BAIRRO').AsString)
          else
            Dest.EnderDest.xBairro    := 'RURAL';

          Dest.EnderDest.cPais        := 1058;
          Dest.EnderDest.xPais        := 'BRASIL';

          //****************************************************************//
          // ENDERECO DE ENTREGA
          //****************************************************************//
          if dm_rc.FDQryMvmestre.FindField('ENTREGA_CEP').AsString <> '' then
            begin
              Entrega.xNome   := StrAllTrim(dm_rc.FDQryPessoas.FindField('NOME').AsString);
              Entrega.IE      := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
              Entrega.CNPJCPF := StrAllTrim(dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString);
              Entrega.xLgr    := RemoverEspeciais(dm_rc.FDQryMvmestre.FindField('ENTREGA_ENDERECO').AsString);
              Entrega.nro     := variif(dm_rc.FDQryMvmestre.FindField('ENTREGA_NUMERO').AsString = '','S/N',RemoverEspeciais(dm_rc.FDQryMvmestre.FindField('ENTREGA_NUMERO').AsString));
              Entrega.xCpl    := dm_rc.FDQryMvmestre.FindField('ENTREGA_CEP').AsString;
              Entrega.xBairro := RemoverEspeciais(dm_rc.FDQryMvmestre.FindField('ENTREGA_BAIRRO').AsString);
              Entrega.cMun    := dm_rc.FDQryMvmestre.FindField('ENTREGA_IBGE').AsInteger;
              Entrega.xMun    := RemoverEspeciais(dm_rc.FDQryMvmestre.FindField('ENTREGA_CIDADE').AsString);
              Entrega.UF      := dm_rc.FDQryMvmestre.FindField('ENTREGA_ESTADO').AsString;
              Entrega.CEP     := StrToInt(dm_rc.FDQryMvmestre.FindField('ENTREGA_CEP').AsString);
              Entrega.fone    := dm_rc.FDQryPessoas.FindField('CELULAR').AsString;
            end;
          //****************************************************************//
        end;

      if StrContains('EX',dm_rc.FDQryPessoas.FindField('ESTADO').AsString) then
        Dest.indIEDest  := inNaoContribuinte
      else
        begin
          if dm_rc.FDQryPessoas.FindField('SITUACAO').AsString = 'Nao Contribuinte' then
            begin
              Dest.indIEDest  := inNaoContribuinte;
              Ide.indFinal    := cfConsumidorFinal;
            end;

          if dm_rc.FDQryPessoas.FindField('SITUACAO').AsString = 'Isento' then
            begin
              Dest.indIEDest  := inIsento;
              Ide.indFinal    := cfConsumidorFinal;
            end;

          if dm_rc.FDQryPessoas.FindField('SITUACAO').AsString = 'Consumidor' then
            begin
              Dest.IE         := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
              Dest.indIEDest  := inContribuinte;
              Ide.indFinal    := cfNao;
            end;

          if dm_rc.FDQryPessoas.FindField('SITUACAO').AsString = '' then
            begin
              Dest.IE         := dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString;
              Dest.indIEDest  := inContribuinte;
              Ide.indFinal    := cfNao;
            end;

          //******************************************************************************************************************************//
          //TRANSPORTADOR
          //******************************************************************************************************************************//
          with Transp do
            begin
              if  dm_rc.FDQryMvmestre.FindField('TRAFRETE').AsInteger = 1 then
                begin
                  Transp.modFrete         := mfContaEmitente;
                  Transporta.xNome        := RemoverEspeciais(dm_rc.FDQryTransportes.FindField('NOME').AsString);

                  if not StrEmpty(dm_rc.FDQryTransportes.FindField('CPFCNPJ').AsString) then
                    Transporta.CNPJCPF    := StrAllTrim(dm_rc.FDQryTransportes.FindField('CPFCNPJ').AsString);

                  Transporta.xEnder       := RemoverEspeciais(dm_rc.FDQryTransportes.FindField('ENDERECO').AsString);
                  Transporta.xMun         := RemoverEspeciais(dm_rc.FDQryTransportes.FindField('CIDADE').AsString);
                  Transporta.UF           := dm_rc.FDQryTransportes.FindField('ESTADO').AsString;


                  if not StrEmpty(dm_rc.FDQryTransportes.FindField('INSCRICAO').AsString) then
                    Transporta.IE         := RemoverEspeciais(dm_rc.FDQryTransportes.FindField('INSCRICAO').AsString)
                  else
                    Transporta.IE         := '';

                end
              else
                begin
                  Transp.modFrete         := mfContaDestinatario;
                  Transporta.xNome        := RemoverEspeciais(dm_rc.FDQryTransportes.FindField('NOME').AsString);

                  if not StrEmpty(dm_rc.FDQryTransportes.FindField('CPFCNPJ').AsString) then
                    Transporta.CNPJCPF    := StrAllTrim(dm_rc.FDQryTransportes.FindField('CPFCNPJ').AsString);

                  Transporta.xEnder       := RemoverEspeciais(dm_rc.FDQryTransportes.FindField('ENDERECO').AsString);
                  Transporta.xMun         := RemoverEspeciais(dm_rc.FDQryTransportes.FindField('CIDADE').AsString);
                  Transporta.UF           := dm_rc.FDQryTransportes.FindField('ESTADO').AsString;

                  if not StrEmpty(dm_rc.FDQryTransportes.FindField('INSCRICAO').AsString) then
                    Transporta.IE         := RemoverEspeciais(dm_rc.FDQryTransportes.FindField('INSCRICAO').AsString)
                  else
                    Transporta.IE         := '';
                end;

              with Vol.New do
                begin
                  qVol    := StrToInt(FloatToStr(dm_rc.FDQryMVmestre.FindField('TRAQUANTIDADE').AsInteger));
                  esp     := dm_rc.FDQryMVmestre.FindField('TRAESPECIE').AsString;
                  marca   := dm_rc.FDQryMVmestre.FindField('TRAMARCA').AsString;
                  nVol    := dm_rc.FDQryMVmestre.FindField('TRANUMERONOTA').AsString;
                  pesoL   := dm_rc.FDQryMVmestre.FindField('TRAPESOLIQUIDO').AsFloat;
                  pesoB   := dm_rc.FDQryMVmestre.FindField('TRAPESOBRUTO').AsFloat;
                end;
            end;
        end;

      dm_rc.tbmvitens.First;
      M_ITENS := 0;
      while not dm_rc.tbmvitens.Eof do
        begin
          if dm_rc.tbmvitens.FindField('PRODUTO').AsInteger > 0 then
            begin
              with Det.New do
                begin
                  Inc(M_ITENS);
                  Prod.nItem    := M_ITENS;

                  TabelaProdutos( ' SELECT * FROM PRODUTOS, SALDOS WHERE PRODUTOS.CODIGO = SALDOS.PRODUTO AND PRODUTOS.CODIGO   = ' + IntToStr(dm_rc.tbmvitens.FindField('PRODUTO').AsInteger) +
                                  ' AND SALDOS.EMPRESA                                                                          = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('EMPRESA').AsInteger));

                  if dm_rc.tbmvitens.FindField('LOTESEMENTE').AsString <> '' then
                    begin
                      TabelaSementes(' SELECT * FROM SEMENTES WHERE LOTE    = ' + QuotedStr(dm_rc.tbmvitens.FindField('LOTESEMENTE').AsString) +
                                     ' AND PRODUTO                          = ' + QuotedStr(dm_rc.tbmvitens.FindField('PRODUTO').AsString));

                      infAdProd    := variif(not StrEmpty(dm_rc.tbmvitens.FindField('LOTESEMENTE').AsString),      'LOTE : '     + dm_rc.tbmvitens.FindField('LOTESEMENTE').AsString,       '') + ' ' +
                                      variif(not StrEmpty(dm_rc.tbmvitens.FindField('TERMOSEMENTE').AsString),     'TERMO: '     + dm_rc.tbmvitens.FindField('TERMOSEMENTE').AsString,      '') + ' ' +
                                      variif(not StrEmpty(dm_rc.fdqrysementes.FindField('SAFRAVALIDA').AsString),  'SAFRA: '     + dm_rc.fdqrysementes.FindField('SAFRAVALIDA').AsString,   '') + ' ' +
                                      variif(not StrEmpty(dm_rc.FDQryProdutos.FindField('CATEGORIA').AsString),    'CATEGORIA: ' + dm_rc.FDQryProdutos.FindField('CATEGORIA').AsString,     '');

                      Prod.xProd  := variif(dm_rc.tbmvitens.FindField('DESCRICAO_NOTA').AsString <> '',
                                            dm_rc.tbmvitens.FindField('DESCRICAO_NOTA').AsString,
                                            dm_rc.tbmvitens.FindField('DESCRICAO').AsString);
                    end
                  else
                    Prod.xProd := RemoverEspeciais(dm_rc.tbmvitens.FindField('DESCRICAO').AsString);

                  Prod.CFOP     := copy(dm_rc.tbmvitens.FindField('OPERACAO').AsString,1,4);
                  Prod.cProd    := IntToStr(dm_rc.tbmvitens.FindField('PRODUTO').AsInteger);
                  Prod.NCM      := RemoverEspeciais(dm_rc.FDQryProdutos.FindField('NUMERONCM').AsString);
                  Prod.vFrete   := MRound(dm_rc.tbmvitens.FindField('FRETE').AsFloat,4);//4
                  Prod.vSeg     := MRound(dm_rc.tbmvitens.FindField('SEGURO').AsFloat,4);
                  Prod.vOutro   := MRound(dm_rc.tbmvitens.FindField('DESPESAS').AsFloat,4);
                  Prod.qCom     := dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat;
                  Prod.qTrib    := dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat;

                  if dm_rc.tbmvitens.FindField('DESCONTO').AsFloat > 0 then
                    begin
                      Prod.vDesc    := MRound(dm_rc.tbmvitens.FindField('DESCONTO').AsFloat,2);
                      Prod.vUnCom   := MRound(dm_rc.tbmvitens.FindField('PRECO').AsFloat,4); //4
                      Prod.vUnTrib  := MRound(dm_rc.tbmvitens.FindField('PRECO').AsFloat,4); //4
                      Prod.vProd    := MRound(dm_rc.tbmvitens.FindField('TOTAL').AsFloat,4); //4
                    end
                  else
                    begin
                      Prod.vUnCom   := MRound(dm_rc.tbmvitens.FindField('PRECO').AsFloat,4);
                      Prod.vUnTrib  := MRound(dm_rc.tbmvitens.FindField('PRECO').AsFloat,4);
                      Prod.vProd    := MRound(dm_rc.tbmvitens.FindField('TOTAL').AsFloat,4);
                    end;

                  Prod.cEAN     := 'SEM GTIN';
                  Prod.cEANTrib := 'SEM GTIN';

                  if StrEmpty(dm_rc.FDQryProdutos.FindField('UNIDADE').AsString) then
                    Prod.uCom   := 'KG'  else  Prod.uCom    := UpperCase(dm_rc.FDQryProdutos.FindField('UNIDADE').AsString);
                  if StrEmpty(dm_rc.FDQryProdutos.FindField('UNIDADE').AsString) then
                    Prod.uTrib   := 'KG' else  Prod.uTrib   := UpperCase(dm_rc.FDQryProdutos.FindField('UNIDADE').AsString);

                  with Imposto do
                    begin
                      vTotTrib := MRound((dm_rc.tbmvitens.FindField('TOTAL').AsFloat * Perc_Imposto) / 100,2);
                      with ICMS do
                        begin
                          if dm_rc.tbmvitens.FindField('CST').AsString = '000' then
                            begin
                              CST         := cst00;
                              ICMS.modBC  := dbiValorOperacao;
                              ICMS.pICMS  := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                              ICMS.vICMS  := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                              ICMS.vBC    := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                            end;

                          if dm_rc.tbmvitens.FindField('CST').AsString = '010' then
                            begin
                              CST         := cst10;
                              ICMS.modBC  := dbiValorOperacao;
                              ICMS.pICMS  := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                              ICMS.vICMS  := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                              ICMS.vBC    := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                            end;

                          if dm_rc.tbmvitens.FindField('CST').AsString = '020' then
                             begin
                               CST         := cst20;
                               ICMS.modBC  := dbiValorOperacao;
                               ICMS.pRedBC := dm_rc.tbmvitens.FindField('PERCREDUCAO').AsFloat;
                               ICMS.pICMS  := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                               ICMS.vICMS  := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                               ICMS.vBC    := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                             end;

                          if dm_rc.tbmvitens.FindField('CST').AsString = '030' then
                            begin
                              CST         := cst30;
                              ICMS.modBC  := dbiValorOperacao;
                              ICMS.pICMS  := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                              ICMS.vICMS  := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                              ICMS.vBC    := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                            end;

                          if dm_rc.tbmvitens.FindField('CST').AsString = '040' then
                            begin
                              CST              := cst40;
                              ICMS.modBC       := dbiValorOperacao;
                              ICMS.orig        := oeNacional;
                              ICMS.pICMS       := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                              ICMS.vICMS       := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                              ICMS.vBC         := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                            end;

                          if dm_rc.tbmvitens.FindField('CST').AsString = '041' then
                            begin
                              CST         := cst41;
                              ICMS.modBC  := dbiValorOperacao;
                              ICMS.orig   := oeNacional;
                              ICMS.pICMS  := 0;
                              ICMS.vICMS  := 0;
                              ICMS.vBC    := 0;
                            end;

                          if dm_rc.tbmvitens.FindField('CST').AsString = '050' then
                            begin
                              CST         := cst50;
                              ICMS.modBC  := dbiValorOperacao;
                              ICMS.orig   := oeNacional;
                              ICMS.pICMS  := 0;
                              ICMS.vICMS  := 0;
                              ICMS.vBC    := 0;
                            end;

                          if dm_rc.tbmvitens.FindField('CST').AsString = '051' then
                            begin
                              CST         := cst51;
                              ICMS.modBC  := dbiValorOperacao;
                              ICMS.pICMS  := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                              ICMS.vICMS  := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                              ICMS.vBC    := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                            end;

                          if dm_rc.tbmvitens.FindField('CST').AsString = '060' then
                            begin
                               CST         := cst60;
                               ICMS.modBC  := dbiValorOperacao;
                               ICMS.vBCST  := dm_rc.tbmvitens.FindField('TOTAL').AsFloat;

                              if dm_rc.tbempresas.FindField('ESTADO').AsString = DM_RC.FDQryPessoas.FindField('ESTADO').AsString then
                                begin
                                  ICMS.pICMSST := 18;
                                  ICMS.vICMSST := MRound((dm_rc.tbmvitens.FindField('TOTAL').AsFloat * 0.18),2);
                                end;

                             end;

                          if dm_rc.tbmvitens.FindField('CST').AsString = '070' then
                            begin
                              CST         := cst70;
                              ICMS.modBC  := dbiValorOperacao;
                              ICMS.pICMS  := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                              ICMS.vICMS  := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                              ICMS.vBC    := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                            end;

                          if dm_rc.tbmvitens.FindField('CST').AsString = '090' then
                            begin
                              CST         := cst90;
                              ICMS.modBC  := dbiValorOperacao;
                              ICMS.pICMS  := dm_rc.tbmvitens.FindField('PERCICMS').AsFloat;
                              ICMS.vICMS  := dm_rc.tbmvitens.FindField('VALORICMS').AsFloat;
                              ICMS.vBC    := dm_rc.tbmvitens.FindField('BASEICMS').AsFloat;
                            end;
                        end;

                      with PIS do
                        begin

                           case AnsiIndexStr(dm_rc.tbmvitens.FindField('PIS').AsString,['01','02','03','04','05','06','07','08','09','49']) of
                             0 : CST := pis01;    //01
                             1 : CST := pis02;    //02
                             2 : CST := pis03;    //03
                             3 : CST := pis04;    //04
                             4 : CST := pis05;    //05
                             5 : CST := pis06;    //06
                             6 : CST := pis07;    //07
                             7 : CST := pis08;    //08
                             8 : CST := pis09;    //09
                             9 : CST := pis49;    //49
                           end;

                          vBC       := 0;
                          pPIS      := 0;
                          vPIS      := 0;

                          vBC       := variif(dm_rc.FDQryProdutos.FindField('VLRPIS').AsFloat > 0,dm_rc.tbmvitens.FindField('TOTAL').AsFloat  ,0);
                          pPIS      := variif(dm_rc.FDQryProdutos.FindField('VLRPIS').AsFloat > 0,dm_rc.FDQryProdutos.FindField('VLRPIS').AsFloat,0);
                          vPIS      := variif(dm_rc.FDQryProdutos.FindField('VLRPIS').AsFloat > 0,MRound(dm_rc.tbmvitens.FindField('TOTAL').AsFloat * dm_rc.FDQryProdutos.FindField('VLRPIS').AsFloat / 100,2),0);

                          if dm_rc.FDQryProdutos.FindField('VLRPIS').AsFloat > 0 then
                            totpis  := totpis + MRound(dm_rc.tbmvitens.FindField('TOTAL').AsFloat * dm_rc.FDQryProdutos.FindField('VLRPIS').AsFloat /100,2)
                          else
                            totpis  := totpis;

                        end;

                      with COFINS do
                        begin

                           case AnsiIndexStr(dm_rc.tbmvitens.FindField('COFINS').AsString,['01','02','03','04','05','06','07','08','09','49','50','51','52','53','54','55','56','60','61','62','63','64','65','66','67','70','71','72','73','74','75','98','99']) of
                             0 : CST := cof01;    //01
                             1 : CST := cof02;    //02
                             2 : CST := cof03;    //03
                             3 : CST := cof04;    //04
                             4 : CST := cof05;    //05
                             5 : CST := cof06;    //06
                             6 : CST := cof07;    //07
                             7 : CST := cof08;    //08
                             8 : CST := cof09;    //09
                             9 : CST := cof49;    //49
                            10 : CST := cof50;    //50
                            11 : CST := cof51;    //51
                            12 : CST := cof52;    //52
                            13 : CST := cof53;    //53
                            14 : CST := cof54;    //54
                            15 : CST := cof55;    //55
                            16 : CST := cof56;    //56
                            17 : CST := cof60;    //60
                            18 : CST := cof61;    //61
                            19 : CST := cof62;    //62
                            20 : CST := cof63;    //63
                            21 : CST := cof64;    //64
                            22 : CST := cof65;    //65
                            23 : CST := cof66;    //66
                            24 : CST := cof67;    //67
                            25 : CST := cof70;    //70
                            26 : CST := cof71;    //71
                            27 : CST := cof72;    //72
                            28 : CST := cof73;    //73
                            29 : CST := cof74;    //74
                            30 : CST := cof75;    //75
                            31 : CST := cof98;    //98
                            32 : CST := cof99;    //99
                           end;

                          vBC        := 0;
                          pCOFINS    := 0;
                          vCOFINS    := 0;

                          if (dm_rc.FDQryProdutos.FindField('PIS').AsString = '06') or (dm_rc.FDQryProdutos.FindField('PIS').AsString = '01') then
                            begin
                              vBC        := variif(dm_rc.FDQryProdutos.FindField('VLRCOFINS').AsFloat > 0,dm_rc.tbmvitens.FindField('TOTAL').AsFloat     ,0);
                              pCOFINS    := variif(dm_rc.FDQryProdutos.FindField('VLRCOFINS').AsFloat > 0,dm_rc.FDQryProdutos.FindField('VLRCOFINS').AsFloat,0);
                              vCOFINS    := variif(dm_rc.FDQryProdutos.FindField('VLRCOFINS').AsFloat > 0,MRound(dm_rc.tbmvitens.FindField('TOTAL').AsFloat * dm_rc.FDQryProdutos.FindField('VLRCOFINS').AsFloat / 100,2),0);

                              if dm_rc.FDQryProdutos.FindField('VLRCOFINS').AsFloat > 0 then
                                totcofins  := totcofins + MRound(dm_rc.tbmvitens.FindField('TOTAL').AsFloat * dm_rc.FDQryProdutos.FindField('VLRCOFINS').AsFloat /100,2)
                              else
                                totcofins  := totcofins;
                            end;

                          if (dm_rc.FDQryPessoas.FindField('SITUACAO').AsString                          = 'Nao Contribuinte') and
                             (dm_rc.tbempresas.FindField('ESTADO').AsString                             <> dm_rc.FDQryPessoas.FindField('ESTADO').AsString)  and
                             (Length(RemoverEspeciais(DM_RC.FDQryPessoas.FindField('CPFCNPJ').AsString)) >= 11) then
                            begin
                              with ICMSUFDest do
                                begin
                                  vBCUFDest       := dm_rc.tbmvitens.FindField('TOTAL').AsFloat;
                                  vBCFCPUFDest    := dm_rc.tbmvitens.FindField('TOTAL').AsFloat;
                                  pFCPUFDest      := 2;
                                  pICMSInterPart  := 100;
                                  pICMSUFDest     := variif(StrContains('PR#SC#RJ#MG#RS',DM_RC.FDQryPessoas.FindField('ESTADO').AsString),12,7);
                                  pICMSInter      := variif(StrContains('PR#SC#RJ#MG#RS',DM_RC.FDQryPessoas.FindField('ESTADO').AsString),12,7);
                                  vICMSUFDest     := MRound((DM_RC.tbmvitens.FindField('BASEICMS').AsFloat * pICMSUFDest) / 100,2);
                                  vICMSUFRemet    := MRound((DM_RC.tbmvitens.FindField('BASEICMS').AsFloat * pICMSUFDest) / 100,2);
                                  vFCPUFDest      := MRound((DM_RC.tbmvitens.FindField('TOTAL').AsFloat * pFCPUFDest) / 100 ,2);
                                  base0           := base0 + vICMSUFDest;
                                  base1           := base1 + vICMSUFRemet;
                                  UFDestino       := UFDestino + vFCPUFDest;
                                end;
                            end
                          else
                            begin
                              with ICMSUFDest do
                                begin
                                  vBCUFDest      := 0.00;
                                  pFCPUFDest     := 0.00;
                                  pICMSUFDest    := 0.00;
                                  pICMSInter     := 0.00;
                                  pICMSInterPart := 0.00;
                                  vICMSUFDest    := 0.00;
                                  vICMSUFRemet   := 0.00;
                                  base0          := base0 + vICMSUFDest;
                                  base1          := base1 + vICMSUFRemet;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
          dm_rc.tbmvitens.Next;
        end;

      if (dm_rc.fdqrytitulos.RecordCount                          > 0) and
         (dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger <> 2) then
        begin
          with Cobr.Fat do
            begin
              if not StrContains('Devolucao#Complementar',dm_rc.FDQryoperacoes.FindField('TIPO').AsString) then
                begin
                  nFat  := dm_rc.FDQryMvmestre.FindField('NUMERO').AsString;   // NUMERO DA NOTA
                  vOrig := dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat;  // VALOR DA NOTA
                  vLiq  := dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat;  // VALOR DA NOTA
                  vDesc := 0.00;                                           // VALOR DESCONTO

                  //***********************************************************//
                  // INFORMANDO O FINANCEIRO NO XML
                  //***********************************************************//
                  if dm_rc.fdqrytitulos.RecordCount > 0 then
                    begin
                      dm_rc.fdqrytitulos.First;
                      while not dm_rc.fdqrytitulos.Eof  do
                        begin
                          with Cobr.Dup.Add do
                            begin
                              nFat  := dm_rc.fdqrytitulos.FindField('NUMERO').AsString;
                              nDup  := StrZeros(dm_rc.fdqrytitulos.FindField('SEQUENCIA').AsString,3);
                              dVenc := dm_rc.fdqrytitulos.FindField('VENCIMENTO').AsDateTime;
                              vDup  := dm_rc.fdqrytitulos.FindField('VALORATUAL').AsFloat;
                            end;
                          dm_rc.fdqrytitulos.Next;
                        end;
                    end;
                end;
              //***********************************************************//
              // INFORMANDO O TIPO DE PAGAMENTO
              //***********************************************************//
              with pag.new do
               begin
                 if dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 2 then
                   tPag := fpOutro
                 else
                   tPag := variif(StrContains('Devolucao#Complementar',dm_rc.FDQryoperacoes.FindField('TIPO').AsString),fpOutro,fpDuplicataMercantil);

                 vPag := variif(StrContains('Devolucao#Complementar',dm_rc.FDQryoperacoes.FindField('TIPO').AsString),fpSemPagamento,dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat);
               end;
            end;
        end
      else
        begin
          with pag.new do
           begin
             tPag := variif(StrContains('Devolucao#Complementar',dm_rc.FDQryoperacoes.FindField('TIPO').AsString),fpSemPagamento,fpOutro);
           end;
        end;

      InfAdic.infCpl := dm_rc.FDQryMvmestre.FindField('OBSERVACOES').AsString + ' ' + DM_RC.fdqryescritas.FindField('DESCRICAO').AsString +
      ' Valor aprox. Tributos R$.......... ' + FormatFloat('###,###,##0.00',Total_Imposto) +' Media(31,45%) FONTE IBPT.' +
      ' RENASEM Nº ' + dm_rc.tbempresas.FindField('RENASEM').AsString;


      Total.ICMSTot.vST         := dm_rc.FDQryMvmestre.FindField('VLRSUBSTITUICAO').AsFloat;
      Total.ICMSTot.vBCST       := dm_rc.FDQryMvmestre.FindField('VLRBASESUBSTITUICAO').AsFloat;

      Total.ICMSTot.vBC         := dm_rc.FDQryMvmestre.FindField('VLRBASEICMS').AsFloat;
      Total.ICMSTot.vICMS       := dm_rc.FDQryMvmestre.FindField('VLRICMS').AsFloat;

      Total.ICMSTot.vFrete      := dm_rc.FDQryMvmestre.FindField('VLRDSPTRIBUTADA').AsFloat;
      Total.ICMSTot.vSeg        := dm_rc.FDQryMvmestre.FindField('VLRDSPNTRIBUTADA').AsFloat;

      Total.ICMSTot.vDesc       := MRound(dm_rc.FDQryMvmestre.FindField('VLRDESCONTOS').AsFloat,2);
      Total.ICMSTot.vOutro      := MRound(dm_rc.FDQryMvmestre.FindField('VLRDESPESAS').AsFloat,2);
      Total.ICMSTot.vIPI        := dm_rc.FDQryMvmestre.FindField('VLRIPI').AsFloat;

      Total.ICMSTot.vProd       := variif(dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Complementar', dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat, dm_rc.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat);
      Total.ICMSTot.vNF         := variif(dm_rc.FDQryoperacoes.FindField('TIPO').AsString = 'Complementar', dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat,    dm_rc.FDQryMvmestre.FindField('VLRTOTAL').AsFloat);

      Total.ICMSTot.vICMSDeson  := 0;
      Total.ICMSTot.vFCPUFDest  := UFDestino;

      Total.ICMSTot.vICMSUFDest := base0;
      Total.ICMSTot.vICMSUFRemet:= base1;

      Total.ICMSTot.vPIS        := totpis;
      Total.ICMSTot.vCOFINS     := totcofins;
      Total.ICMSTot.vTotTrib    := Total_Imposto;
    end;
end;

procedure TfrmSEFAZNOTA.n6Click(Sender: TObject);
begin
  ConfiguraAcbr(mm.varI_Code_Company);
  DM_RC.ACBrNFe.WebServices.DistribuicaoDFe.retDistDFeInt.maxNSU := '99999';
  DM_RC.ACBrNFe.DistribuicaoDFePorUltNSU(35, '52070356000103', '0');
  UniMemorespostaTXT.Lines.Text := DM_RC.ACBrNFe.WebServices.DistribuicaoDFe.RetWS;
  UniMemorespostaXML.Lines.Text := DM_RC.ACBrNFe.WebServices.DistribuicaoDFe.RetornoWS;
end;

procedure TfrmSEFAZNOTA.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmSEFAZNOTA.UniBitBtn2Click(Sender: TObject);
begin
  UniPopupMenucartacorrecao.PopupBy( TUniButton( sender ) );
end;

procedure TfrmSEFAZNOTA.UniBitBtnimpressaoClick(Sender: TObject);
begin
  UniPopupMenumodoimpressao.PopupBy(TUniButton(Sender));
end;

procedure TfrmSEFAZNOTA.UniFormCreate(Sender: TObject);
var
   i : integer;
begin

  case mm.varLT_Lang of

       ltpt_BR : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Falha na seleção do registro( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := ' registro(s) localizado(s)';
                 end;
       lten_US   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                 end;
       ltes_ES   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION :='Falló la selección del registro de búsqueda (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' registro(s) encontrado ';
                 end;
       ltfr_FR   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'La sélection de l''enregistrement a échoué ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'enregistrement(s) trouvé(s)';
                 end;
       ltde_DE   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Datensatzauswahl fehlgeschlagen ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'Datensatz(e) gefunden';
                 end;
       ltit_IT   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Selezione record fallita ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'record(s) trovati';
                 end;
       lttr_TR    : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Kayıt seçimi başarısız( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'kayıt(lar) bulundu';
                 end;
       ltru_RU    : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Ошибка выбора записи поиска (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := 'найдены записи';
                 end;
       ltzn_CH : begin

                 end;
       ltin_ID : begin

                 end;
       ltth_TH : begin

                 end;
       lthi_IN : begin

                 end;
       ltar_SA    : begin

                 end;
  end;
  cFormModal   := mm.varC_Form_Modal;
end;

procedure TfrmSEFAZNOTA.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TfrmSEFAZNOTA.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;

procedure TfrmSEFAZNOTA.UniFormShow(Sender: TObject);
begin
  HabilitaBotoes();
  UniMemorespostaTXT.Clear;
  UniMemorespostaTXT.Lines.Add(' *** ATENÇÃO *** ');
  UniMemorespostaTXT.Lines.Add('SEMPRE CONFIRA OS DADOS DA "NOTA" ANTES DE ENVIAR-LA AO SEFAZ!');
end;

procedure TfrmSEFAZNOTA.ValidaErros;
var
  Msg, Tempo: String;
  Inicio: TDateTime;
  Ok: Boolean;
begin
    Inicio := Now;
    Ok     := dm_rc.ACBrNFe.NotasFiscais.ValidarRegrasdeNegocios(Msg);
    Tempo  := FormatDateTime('hh:nn:ss:zzz', Now - Inicio);

    if not Ok then
    begin
      UniMemorespostaTXT.Lines.Add('Erro: ' + Msg);
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'ERROS ENCONTRADOS' +
                                           sLineBreak         +
                                           ' Tempo: '         + Tempo, 'error');
    end
end;

end.
