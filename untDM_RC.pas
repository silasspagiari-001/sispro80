unit untDM_RC; //7.3.0.0

interface

uses
  SysUtils, Classes, Controls,  TypInfo, //Data.SqlTimSt, // 6.0.0.0
  uniGUIBaseClasses, uniGUIClasses, uniGUITypes, uniGUIJSUtils, RTTI, Vcl.forms, vcl.menus, // 6.0.0.0
  uniComboBox, uniDBComboBox,uniDBLookupComboBox, uniDateTimePicker, uniDBDateTimePicker,  uniListBox, uniDBListBox, //7.3.0.0 unidbtagfield
  uniBitBtn, uniButton, uniEdit, UniDBEdit, UniSpeedButton, uniGUIFrame, uniGUIForm,  uniGUIDialogs, Messages, MainModule,
  uniGUIAbstractClasses,  uniGUIApplication, uniPanel, IniFiles, UniImage, uniLabel,  Unipagecontrol,
  uniMemo, uniDBMemo, uniGUIRegClasses, uniDBNavigator, uniScrollBox,
  UniDBRadioGroup, uniDBCheckBox, uniDBImage, uniDBText, uniHTMLMemo,
   // feedback: Mesut from Turkey
  {$ifdef LINUX}
  IdHTTP, IdSSLOpenSSL,
  System.UIConsts, //feedback: Mesut from Turkey to Linux( 6.0.0.0 )
  {$endif}
  {$ifdef MSWINDOWS}
  Winapi.WinInet,
  {$endif}
  System.Types, System.Generics.Collections,
  Variants, pngimage, jpeg, vcl.stdctrls, uniCheckBox, uniTreeMenu,
  uconsts, uconsts_cfg,
  uniHTMLFrame, uniURLFrame,
  uMenu_BASICS, uMenu_TOOLS, uMenu_MOVEMENT, uMenu_OTHERS, uMenu_REPORTS, mkm_menus,
  IdHashMessageDigest, uniDBGrid, Graphics,StrUtils,
  MaskUtils, DateUtils,
  //7.3.0.0( before FIREDAC refs...issue with TRCMaskType )
  REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope ,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, uniFileUpload,
  uniSweetAlert, uniGridExporters, uniBasicGrid, ACBrConsultaCNPJ,
  ACBrValidador, ACBrNCMs, ACBrSocket, ACBrCEP, ACBrDFe, ACBrNFe, ACBrBase,
  ACBrSpedFiscal, ACBrBoleto, ACBrMail, uniImageList, ACBrMDFe, ACBrDFeReport,
  ACBrMDFeDAMDFeClass, ACBrMDFeDAMDFeRLClass, ACBrDFeDANFeReport,
  ACBrNFeDANFEClass, ACBrNFeDANFeRLClass;

type
  TExUniCustomDBGrid = class (TUniCustomDBGrid)
  end;

type
  tdm_rc = class(TDataModule)
    dsSqlGeneric: TDataSource;
    memRecords: TFDMemTable;
    memTemp: TFDMemTable;
    sqlGeneric: TFDQuery;
    sqlDelete: TFDQuery;
    sqlGetDataSet: TFDQuery;
    sqlNextID: TFDQuery;
    sqlSearchMaster: TFDQuery;
    sqlDS: TFDQuery;
    memStructure: TFDMemTable;
    sqlIns_Upd: TFDQuery;
    memUsers: TFDMemTable;
    memTotRecords: TFDMemTable;
    sqlGetRecords: TFDQuery;
    memUsersPermissions: TFDMemTable;
    memUsersPermissionsSecondary: TFDMemTable;
    memUsersPermissionsEdit: TFDMemTable;
    sqlCompanies: TFDQuery;
    dsSqlCompanies: TDataSource;
    memUsersSecondary : TFDMemTable;
    REGISTER_REQUEST: TFDQuery;
    memPK: TFDMemTable;
    memGridPK: TFDMemTable;
    dsMemPk: TDataSource;
    uniFileUp: TUniFileUpload;
    sqlLookUpSearch: TFDQuery;
    dsLookUpSearch: TDataSource;
    UniGridExcelExporter1: TUniGridExcelExporter;
    UniGridXMLExporter1: TUniGridXMLExporter;
    UniGridHTMLExporter1: TUniGridHTMLExporter;
    UniGridCSVExporter1: TUniGridCSVExporter;
    UniSweetAlert: TUniSweetAlert;
    RESTClientRC: TRESTClient;
    RESTRequestRC: TRESTRequest;
    RESTResponseRC: TRESTResponse;
    fdqryregiao: TFDQuery;
    executasql: TFDQuery;
    tbprodutos: TFDQuery;
    tbmvitens: TFDQuery;
    tbremessa: TFDMemTable;
    tbremessaNUMERO: TIntegerField;
    tbremessaVENCIMENTO: TDateField;
    tbremessaPESSOA: TIntegerField;
    tbremessaNOME: TStringField;
    tbremessaPORTADOR: TIntegerField;
    tbremessaSEQUENCIA: TIntegerField;
    tbremessaVALORATUAL: TFloatField;
    tbremessaSERIE: TStringField;
    tbremessaMARCADOR: TStringField;
    tbremessaNOSSONUMERO: TStringField;
    tbremessaEMISSAO: TDateField;
    tbremessaCODIGO: TIntegerField;
    tbremessaEMPRESA: TIntegerField;
    tbremessaPARCELAS: TIntegerField;
    dsremessa: TDataSource;
    tbretornobancario: TFDMemTable;
    tbretornobancarioNUMERO: TIntegerField;
    tbretornobancarioJUROS: TFloatField;
    tbretornobancarioDESCONTO: TFloatField;
    tbretornobancarioVALORDOCUMENTO: TFloatField;
    tbretornobancarioSITUACAO: TStringField;
    tbretornobancarioNOSSONUMERO: TStringField;
    tbretornobancarioSEQUENCIA: TIntegerField;
    tbretornobancarioPORTADOR: TIntegerField;
    tbretornobancarioPLANOCONTAS: TStringField;
    tbretornobancarioVENCIMENTO: TStringField;
    tbretornobancarioPAGAMENTO: TStringField;
    tbretornobancarioSTATUS: TStringField;
    tbretornobancarioSERIE: TStringField;
    tbretornobancarioNOME: TStringField;
    tbretornobancarioTAXAS: TFloatField;
    tbretornobancarioCODIGO: TIntegerField;
    tbretornobancarioPESSOA: TIntegerField;
    tbretornobancarioEMISSAO: TDateField;
    tbretornobancarioEMPRESA: TIntegerField;
    tbretornobancarioNOMEREMESSA: TStringField;
    dsretornobancario: TDataSource;
    tbversao: TFDQuery;
    dsSqlPesquisa: TDataSource;
    dssqlbuscas: TDataSource;
    sqlpesquisasecundaria: TFDQuery;
    sqlbuscasgerais: TFDQuery;
    sqlBuscas: TFDQuery;
    sqlpesquisa: TFDQuery;
    procSEQUENCIA_MENUSISTEMA: TFDStoredProc;
    sqlgraficos: TFDQuery;
    procVERIFICA_PERMISSAO: TFDStoredProc;
    procSALDO_BENEFICIAMENTO: TFDStoredProc;
    procSEQUENCIA_LOTE: TFDStoredProc;
    procCALCULA_LOTE: TFDStoredProc;
    sqlpesquisaprimaria: TFDQuery;
    tbportadores: TFDQuery;
    FDQryTransportes: TFDQuery;
    FDQryMvmestre: TFDQuery;
    FDQryEmpresas: TFDQuery;
    FDQryDocumentos: TFDQuery;
    FDQryPessoas: TFDQuery;
    FDQryProdutos: TFDQuery;
    FDQryoperacoes: TFDQuery;
    tbempresas: TFDQuery;
    tbreceber: TFDQuery;
    fdqryromaneioitens: TFDQuery;
    fdqrymovcomissao: TFDQuery;
    fdqryromaneio: TFDQuery;
    fdqrysementes_bas: TFDQuery;
    fdqryentregaproduto: TFDQuery;
    dsmemkardexkproduto: TDataSource;
    memkardexkproduto: TFDMemTable;
    memkardexkprodutoNUMERO: TIntegerField;
    memkardexkprodutoSERIE: TStringField;
    memkardexkprodutoPESSOA: TIntegerField;
    memkardexkprodutoNOME: TStringField;
    memkardexkprodutoUF: TStringField;
    memkardexkprodutoENTRADA: TFloatField;
    memkardexkprodutoSAIDA: TFloatField;
    memkardexkprodutoSALDO: TFloatField;
    memkardexkprodutoOPERACAO_OP: TStringField;
    memkardexkprodutoEMISSAO: TDateField;
    dstermonota: TDataSource;
    memtermonota: TFDMemTable;
    memtermonotaCODIGO: TIntegerField;
    memtermonotaPRODUTO: TIntegerField;
    memtermonotaDESCRICAO_NOTA: TStringField;
    memtermonotaLOTE: TStringField;
    memtermonotaBOLETIM: TStringField;
    memtermonotaTERMO: TStringField;
    memtermonotaPUREZA: TFloatField;
    memtermonotaVALIDADE: TStringField;
    memtermonotaPESOEMBALAGEM: TFloatField;
    memtermonotaCOMUM: TStringField;
    memtermonotaASSINADA: TStringField;
    tbmedida: TFDMemTable;
    tbmedidaUNIDADE: TStringField;
    tbdetalhes: TFDMemTable;
    tbdetalhesNOTA: TIntegerField;
    tbdetalhesPESSOA: TIntegerField;
    tbdetalhesSERIE: TStringField;
    tbdetalhesPRODUTO: TIntegerField;
    tbdetalhesSEQITENS: TIntegerField;
    tbdetalhesDESCRICAO: TStringField;
    tbdetalhesLOTE: TStringField;
    tbdetalhesQTENOTA: TFloatField;
    tbdetalhesGERNOTA: TFloatField;
    tbdetalhesPUREZANOTA: TFloatField;
    tbdetalhesQUANTIDADE: TFloatField;
    tbdetalhesVCNOTA: TFloatField;
    tbdetalhesVALORCULTURAL: TFloatField;
    tbdetalhesGERMINACAO: TFloatField;
    tbdetalhesPUREZA: TFloatField;
    tbdetalhesLOTEDESTINO: TStringField;
    tbdetalhesBOLETIMDESTINO: TStringField;
    tbdetalhesDESCARTE: TFloatField;
    tbdetalhesPONTOS: TFloatField;
    tbdetalhesDISPONIVEL: TFloatField;
    tbdetalhesTERMO: TStringField;
    tbdetalhesCOOPERANTE: TIntegerField;
    tbdetalhesCAMPO: TStringField;
    tbdetalhesSAFRACAMPO: TStringField;
    tbdetalhesbuscanota: TStringField;
    tbdetalhesdetalhesnota: TStringField;
    tbdetalhesbuscalote: TStringField;
    tbdetalhesexclui: TStringField;
    tbdetalhesMAQUINA: TIntegerField;
    tbdetalhesmontagem: TStringField;
    tbdetalhesCATEGORIA: TStringField;
    dsprodutos: TDataSource;
    memprodutos: TFDMemTable;
    IntegerField2: TIntegerField;
    StringField3: TStringField;
    memprodutosPRECO: TFloatField;
    memprodutosTOTAL: TFloatField;
    memprodutosQUANTIDADE: TFloatField;
    memprodutosBASEICMS: TFloatField;
    memprodutosVALORICMS: TFloatField;
    memprodutosPERCICMS: TFloatField;
    memprodutosCST: TStringField;
    memprodutosUNIDADE: TStringField;
    memprodutosPIS: TStringField;
    memprodutosCOFINS: TStringField;
    memprodutosICM0: TFloatField;
    memprodutosICM1: TFloatField;
    memprodutosICM2: TFloatField;
    memprodutosBAS0: TFloatField;
    memprodutosBAS1: TFloatField;
    memprodutosBAS2: TFloatField;
    memprodutosSITUACAOLOCAL: TStringField;
    memprodutosSITUACAOOUTRAS: TStringField;
    memprodutosDESCONTO: TFloatField;
    memprodutosDESPESAS: TFloatField;
    memprodutosNUMERONCM: TStringField;
    memprodutosSERIE: TStringField;
    memprodutosSAFRA: TIntegerField;
    memprodutosNUMERO: TIntegerField;
    memprodutosEMPRESA: TIntegerField;
    memprodutosSEQUENCIA: TIntegerField;
    memprodutosUF: TStringField;
    memprodutosPESSOA: TIntegerField;
    memprodutosMARGEM: TFloatField;
    memprodutosCOMPRA: TFloatField;
    memprodutosNCM: TStringField;
    memprodutosGRUPO: TIntegerField;
    memprodutosPERCIPI: TFloatField;
    memprodutosLIQUIDO: TFloatField;
    memprodutosVALORIPI: TFloatField;
    memprodutosOPERACAO: TIntegerField;
    memprodutosPUREZA: TFloatField;
    memprodutosSALDOPONTO: TFloatField;
    memprodutosTERMOSEMENTE: TStringField;
    memprodutosBOLETIMSEMENTE: TStringField;
    memprodutosVALORCULTURAL: TFloatField;
    memprodutosLOTESEMENTE: TStringField;
    memprodutosLOTEORIGEM: TStringField;
    memprodutosSAFRACAMPO: TStringField;
    memprodutosCAMPO: TStringField;
    memprodutosCOOPERANTE: TIntegerField;
    memprodutosGERMINACAO: TFloatField;
    memprodutosSAFRAVALIDA: TStringField;
    memprodutosLOTEENTRADA: TStringField;
    memprodutosCATEGORIA: TStringField;
    memprodutosCUSTOPONTO: TFloatField;
    memprodutosTOTALPONTO: TFloatField;
    memprodutosPERCREDUCAO: TFloatField;
    memprodutosexclui: TStringField;
    memprodutosbuscaproduto: TStringField;
    memprodutosbuscalote: TStringField;
    memprodutosDESCRICAO_NOTA: TStringField;
    memprodutosCULTIVAR: TStringField;
    memprodutosCANCELADA: TStringField;
    memprodutosESTADO: TStringField;
    memprodutosCONTRATO: TIntegerField;
    memprodutosDOCUMENTO: TIntegerField;
    memprodutosFRETE: TFloatField;
    memprodutosPESOLIQUIDO: TFloatField;
    memprodutosPESOBRUTO: TFloatField;
    memprodutosEMISSAO: TStringField;
    memprodutosCUSTO: TFloatField;
    memprodutosPESOSACO: TFloatField;
    memprodutosVALIDADE: TStringField;
    memprodutosTOTALPIS: TFloatField;
    memprodutosTOTALCOFINS: TFloatField;
    memprodutosVLRPIS: TFloatField;
    memprodutosVLRCOFINS: TFloatField;
    memprodutosPERCCOMISSAO: TFloatField;
    memprodutosSEGURO: TFloatField;
    memprodutosDESPESA: TFloatField;
    memprodutoserro: TStringField;
    memprodutosopcoes: TStringField;
    memprodutosENTREGUE: TFloatField;
    memprodutosSEMENTENOME: TStringField;
    memprodutosPERCCOFINS: TFloatField;
    memprodutosPERCPIS: TFloatField;
    memprodutosPEDIDOOR: TStringField;
    memprodutosPEDIDOITEMOR: TStringField;
    memprodutosFORNECEDORCODIGO: TStringField;
    memprodutosCFOPENTRADA: TStringField;
    memprodutosVALORST: TFloatField;
    memprodutosBASEST: TFloatField;
    memprodutosbuscaentrada: TStringField;
    memprodutosPUREZAENTRADA: TFloatField;
    memprodutosVCENTRADA: TFloatField;
    memprodutosGERMINACAOENTRADA: TFloatField;
    memprodutosTETRAZOLIO: TFloatField;
    memprodutosCODVEF: TIntegerField;
    memprodutosOBSPRODUTO: TStringField;
    fdqryescritas: TFDQuery;
    dstitulos: TDataSource;
    tbtitulos: TFDMemTable;
    tbtitulosPARCELA: TIntegerField;
    tbtitulosVALOR: TFloatField;
    tbtitulosVENCIMENTO: TDateTimeField;
    tbtitulosexclui: TStringField;
    fdqrytitulos: TFDQuery;
    fdqrylaboratorio: TFDQuery;
    fdqrysementes: TFDQuery;
    tbhistprodutos: TFDMemTable;
    tbhistprodutosQUANTIDADE: TFloatField;
    tbhistprodutosDESCRICAO: TStringField;
    tbhistprodutosPRODUTO: TIntegerField;
    tbhistprodutosOPERACAO_OP: TStringField;
    dshistoricoprodtos: TDataSource;
    dshistpessoas: TDataSource;
    tbhistpessoas: TFDMemTable;
    tbhistpessoasOPERACAO_OP: TStringField;
    tbhistpessoasEMISSAO: TDateField;
    tbhistpessoasNUMERO: TIntegerField;
    tbhistpessoasCANCELADA: TStringField;
    tbhistpessoasVLRPRODUTOS: TFloatField;
    tbhistpessoasVLRTOTAL: TFloatField;
    tbhistpessoasVLRBASEICMS: TFloatField;
    tbhistpessoasVLRICMS: TFloatField;
    tbhistpessoasPEDIDO: TStringField;
    tbhistpessoasimp: TStringField;
    tbhistpessoasDATA: TDateField;
    FDQryPragas: TFDQuery;
    FDQryAnaliseitens: TFDQuery;
    FDQryAnalise: TFDQuery;
    FDQryResponsavel: TFDQuery;
    FDQryGerminacao: TFDQuery;
    fdqryresponsavelassinatura: TFDQuery;
    fdqrytermocoleta: TFDQuery;
    fdqrysolicitacao: TFDQuery;
    fdqrysolicitacaoitens: TFDQuery;
    FDQuerymanutencaolote_interno: TFDQuery;
    fdqryproducaointernaitens: TFDQuery;
    fdqrycheques: TFDQuery;
    fdqrychequeshistorico: TFDQuery;
    fdqrypermissao: TFDQuery;
    fdqrybeneitens: TFDQuery;
    fdqrymfitens: TFDQuery;
    fdqrymfmestre: TFDQuery;
    fdqrybatidamestre: TFDQuery;
    fdqrybatidaitens: TFDQuery;
    fdqryeventoxml: TFDQuery;
    fdqrypontos: TFDQuery;
    fdqrymedidas: TFDQuery;
    fdqrypeneira: TFDQuery;
    FDQryCategoria: TFDQuery;
    FDQryRTCliente: TFDQuery;
    FDQryCultivar: TFDQuery;
    FDQryEspecie: TFDQuery;
    FDQryPMS: TFDQuery;
    FDQryProtocolo: TFDQuery;
    dsatrasados: TDataSource;
    dsgenerico: TDataSource;
    tbbenepessoa: TFDMemTable;
    tbbenepessoaDATA: TDateField;
    tbbenepessoaNUMERO: TStringField;
    tbbenepessoaSERIE: TStringField;
    tbbenepessoaPESSOA: TIntegerField;
    tbbenepessoaNOME: TStringField;
    tbbenepessoaQUANTIDADE: TFloatField;
    tbbenepessoaUF: TStringField;
    dsbenepessoa: TDataSource;
    tbatrasados: TFDMemTable;
    tbatrasadosNOME: TStringField;
    tbatrasadosVALOR: TFloatField;
    tbatrasadosPARCELA: TIntegerField;
    tbatrasadoslista: TStringField;
    tbatrasadosVENCIMENTO: TStringField;
    tbatrasadosDIAS: TIntegerField;
    tbatrasadosPESSOA: TIntegerField;
    dsvencendohoje: TDataSource;
    tbvencendohoje: TFDMemTable;
    tbvencendohojeNOME: TStringField;
    tbvencendohojeVALOR: TFloatField;
    tbvencendohojePARCELA: TIntegerField;
    tbvencendohojelista: TStringField;
    tbvencendohojeVENCIMENTO: TStringField;
    tbvencendohojePESSOA: TIntegerField;
    dspermissaousuario: TDataSource;
    tb_permissaousuario: TFDMemTable;
    tb_permissaousuarioMENU: TStringField;
    tb_permissaousuarioTABELA: TStringField;
    tb_permissaousuarioACESSAR: TBooleanField;
    tb_permissaousuarioINCLUIR: TBooleanField;
    tb_permissaousuarioALTERAR: TBooleanField;
    tb_permissaousuarioEXCLUIR: TBooleanField;
    tb_permissaousuarioREGISTRO: TIntegerField;
    tb_permissaousuarioID_MENU: TIntegerField;
    tbgenerico: TFDMemTable;
    dshistlotevenda: TDataSource;
    tbistlotevenda: TFDMemTable;
    FloatField2: TFloatField;
    tbistlotevendaNUMERO: TIntegerField;
    tbistlotevendaSERIE: TStringField;
    tbistlotevendaOPERACAO_OP: TStringField;
    tbistlotevendaPESSOA: TIntegerField;
    tbistlotevendaNOME: TStringField;
    tbistlotevendaEMISSAO: TDateField;
    tbistlotevendaESTADO: TStringField;
    tbistlotevendaENTRADA: TFloatField;
    tbistlotevendaSAIDA: TFloatField;
    tbistlotevendaSALDO: TFloatField;
    tbistlotevendaDATA: TDateField;
    tbistlotevendaSACOS: TFloatField;
    tbistlotevendaSALDO_PONTO: TFloatField;
    dshistlote: TDataSource;
    tbhistlote: TFDMemTable;
    FloatField1: TFloatField;
    StringField1: TStringField;
    IntegerField1: TIntegerField;
    StringField2: TStringField;
    tbhistloteNUMERO: TIntegerField;
    tbhistloteSERIE: TStringField;
    tbhistloteEMISSAO: TDateField;
    tbhistlotePUREZA: TFloatField;
    tbhistloteLOTESEMENTE: TStringField;
    tbhistloteTERMOSEMENTE: TStringField;
    tbhistloteDATA: TDateField;
    dsitensmoventrega: TDataSource;
    tbboletos: TFDMemTable;
    tbboletosNUMERO: TIntegerField;
    tbboletosSERIE: TStringField;
    tbboletosVENCIMENTO: TDateField;
    tbboletosVALOR: TFloatField;
    tbboletosNOME: TStringField;
    tbboletosSEQUENCIA: TIntegerField;
    dsboletos: TDataSource;
    dsentregafutura: TDataSource;
    tbentregafutura: TFDMemTable;
    tbentregafuturaCODIGO: TIntegerField;
    tbentregafuturaEMISSAO: TDateField;
    tbentregafuturaNUMERO: TIntegerField;
    tbentregafuturaDOCUMENTO: TIntegerField;
    tbentregafuturaSERIE: TStringField;
    tbentregafuturaPRODUTO: TIntegerField;
    tbentregafuturaSEQUENCIA: TIntegerField;
    tbentregafuturaDESCRICAO: TStringField;
    tbentregafuturaDISPONIVEL: TFloatField;
    tbentregafuturaSALDO: TFloatField;
    dsextratomovimento: TDataSource;
    tbextratomovimento: TFDMemTable;
    tbextratomovimentoNUMERO: TIntegerField;
    tbextratomovimentoSERIE: TStringField;
    tbextratomovimentoVENCIMENTO: TStringField;
    tbextratomovimentoPAGAMENTO: TStringField;
    tbextratomovimentoEMISSAO: TStringField;
    tbextratomovimentoTOTAL: TCurrencyField;
    tbextratomovimentoABERTO: TCurrencyField;
    tbextratomovimentoPAGO: TCurrencyField;
    tbextratomovimentoSALDO: TCurrencyField;
    tbextratomovimentoSEQUENCIA: TIntegerField;
    dshistoricofinanceirodoc: TDataSource;
    tbhistoricofinanceirodoc: TFDMemTable;
    tbhistoricofinanceirodocimg: TStringField;
    tbhistoricofinanceirodocNUMERO: TIntegerField;
    tbhistoricofinanceirodocSERIE: TStringField;
    tbhistoricofinanceirodocSEQUENCIA: TIntegerField;
    tbhistoricofinanceirodocPESSOA: TIntegerField;
    tbhistoricofinanceirodocNOME: TStringField;
    tbhistoricofinanceirodocVENCIMENTO: TDateField;
    tbhistoricofinanceirodocPAGAMENTO: TDateField;
    tbhistoricofinanceirodocVALORATUAL: TFloatField;
    tbhistoricofinanceirodocVALORPAGO: TFloatField;
    tbhistoricofinanceirodocEMPRESA: TIntegerField;
    tbhistoricofinanceirodocSITUACAO: TStringField;
    dsrelacaoentrega: TDataSource;
    tbrelacaoentrega: TFDMemTable;
    tbrelacaoentregaEMISSAO: TDateField;
    tbrelacaoentregaPRODUTO: TIntegerField;
    tbrelacaoentregaNUMERO: TIntegerField;
    tbrelacaoentregaDOCUMENTO: TIntegerField;
    tbrelacaoentregaENTREGUE: TFloatField;
    tbrelacaoentregaDESCRICAO: TStringField;
    tbrelacaoentregaexclui: TStringField;
    tbrelacaoentregaCODIGO: TIntegerField;
    tbrelacaoentregaPESOSACO: TFloatField;
    tbrelacaoentregaNOTA: TStringField;
    tbrelacaoentregaimpressao: TStringField;
    tbrelacaoentregaopcoes: TStringField;
    tbrelacaoentregaSEQUENCIA: TIntegerField;
    tbitensmoventrega: TFDMemTable;
    tbitensmoventregaSEQUENCIA: TIntegerField;
    tbitensmoventregaPRODUTO: TIntegerField;
    tbitensmoventregaDESCRICAO: TStringField;
    tbitensmoventregaENTREGUE: TFloatField;
    tbitensmoventregaDISPONIVEL: TFloatField;
    tbitensmoventregaQUANTIDADE: TFloatField;
    tbitensmoventregaMSG: TStringField;
    tbitensmoventregaopcoes: TStringField;
    tbitensmoventregaSALDOSACOS: TFloatField;
    tbitensmoventregaLOTESEMENTE: TStringField;
    tbitensmoventregaTERMOSEMENTE: TStringField;
    tbitensmoventregaBOLETIMSEMENTE: TStringField;
    tbitensmoventregaPESOSACO: TFloatField;
    tbitensmoventregaNUMERO: TStringField;
    ds_pessoasped: TDataSource;
    tb_pessoassped: TFDMemTable;
    tb_pessoasspedCODIGO: TStringField;
    tb_pessoasspedNOME: TStringField;
    tb_pessoasspedCONTROLE: TIntegerField;
    dsoperacaosped: TDataSource;
    TB_OPERACAOSPED: TFDMemTable;
    TB_OPERACAOSPEDCODIGO: TIntegerField;
    TB_OPERACAOSPEDDESCRICAO: TStringField;
    ds_medidas: TDataSource;
    TB_MEDIDAS: TFDMemTable;
    TB_MEDIDASUNIDADE: TStringField;
    TB_MEDIDASDESCRICAO: TStringField;
    ds_blocok200: TDataSource;
    TB_BLOCOK_0200: TFDMemTable;
    IntegerField3: TIntegerField;
    StringField4: TStringField;
    FloatField3: TFloatField;
    StringField5: TStringField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    StringField6: TStringField;
    TB_BLOCOK_0200T: TStringField;
    TB_BLOCOK_0200NUMERONCM: TStringField;
    TB_BLOCOK_0200ICMS0: TFloatField;
    TB_BLOCOK_0200TIPO: TStringField;
    TB_BLOCOK: TFDMemTable;
    TB_BLOCOKPRODUTO: TIntegerField;
    TB_BLOCOKDESCRICAO: TStringField;
    TB_BLOCOKQUANTIDADE: TFloatField;
    TB_BLOCOKUNIDADE: TStringField;
    TB_BLOCOKCUSTO: TFloatField;
    TB_BLOCOKCOMPRA: TFloatField;
    TB_BLOCOKATIVO: TStringField;
    TB_BLOCOKT: TStringField;
    fdqrytitulosplanos: TFDQuery;
    fdqrycbnef: TFDQuery;
    fdqrysubplanocontas: TFDQuery;
    fdqrycustoproducao: TFDQuery;
    fdqrycustoloteinternoitens: TFDQuery;
    fdqrycustoloteinterno: TFDQuery;
    fdqryentregafutura: TFDQuery;
    fdqryentregalote: TFDQuery;
    FDEventAlerter: TFDEventAlerter;
    fdqrycampoitens: TFDQuery;
    fdqryfornecedorproduto: TFDQuery;
    fdqryusuarios: TFDQuery;
    dssubplanocontas: TDataSource;
    tbsubplanocontas: TFDMemTable;
    tbsubplanocontasexclui: TStringField;
    tbsubplanocontasCODIGO: TIntegerField;
    tbsubplanocontasDESCRICAO: TStringField;
    tbsubplanocontasPESSOA: TIntegerField;
    tbsubplanocontasMESTRE_ID: TIntegerField;
    tbsubplanocontasSEQUENCIA: TIntegerField;
    tbsubplanocontasPLANO: TStringField;
    dskardexmanulote: TDataSource;
    tbkardexmanulote: TFDMemTable;
    tbkardexmanuloteTIPO: TStringField;
    tbkardexmanuloteEMISSAO: TDateField;
    tbkardexmanuloteNUMERO: TIntegerField;
    tbkardexmanulotePRODUTO: TIntegerField;
    tbkardexmanuloteLOTE: TStringField;
    tbkardexmanuloteDESCRICAO: TStringField;
    tbkardexmanulotePUREZA: TFloatField;
    tbkardexmanuloteENTRADA: TFloatField;
    tbkardexmanuloteSAIDA: TFloatField;
    tbkardexmanuloteSALDO: TFloatField;
    tbkardexmanuloteENTRADAP: TFloatField;
    tbkardexmanuloteSAIDAP: TFloatField;
    tbkardexmanuloteSALDOP: TFloatField;
    dslistamanifesto: TDataSource;
    tblistamanifestoaberto: TFDMemTable;
    tblistamanifestoabertoCODIGO: TIntegerField;
    tblistamanifestoabertoNOME: TStringField;
    tblistamanifestoabertoESTADOINI: TStringField;
    tblistamanifestoabertoESTADOFIN: TStringField;
    tblistamanifestoabertoopcao: TStringField;
    tblistamanifestoabertoDIAS: TIntegerField;
    tblistamanifestoabertoDESCARREGA: TStringField;
    tblistamanifestoabertoNUMERO: TIntegerField;
    tblistamanifestoabertoEMISSAO: TDateField;
    dsanexotitulos: TDataSource;
    tbanexotitulos: TFDMemTable;
    tbanexotitulosPLANO: TFloatField;
    tbanexotitulosDESCRICAO: TStringField;
    tbanexotitulosVALOR: TFloatField;
    tbanexotitulosexclui: TStringField;
    tbanexotitulosbusca: TStringField;
    tbanexotitulosMESTRE_ID: TIntegerField;
    tbanexotitulosSUBPLANO: TIntegerField;
    tbanexotitulosbuscasub: TStringField;
    tbanexotitulosOBSERVACAO: TStringField;
    dsfdqrytitulos: TDataSource;
    dsfdqrycheques: TDataSource;
    dsfdqrychequehistorico: TDataSource;
    dsdetalhes: TDataSource;
    dmqrypontos: TDataSource;
    dsmfitens: TDataSource;
    dsmfmestre: TDataSource;
    dsbatidamestre: TDataSource;
    dstbempresas: TDataSource;
    dsfdqrymvitens: TDataSource;
    dsfdqrymvmestre: TDataSource;
    tbhistoricocheque: TFDMemTable;
    StringField8: TStringField;
    tbhistoricochequeDATA: TDateField;
    tbhistoricochequeSTATUS: TStringField;
    tbhistoricochequeOBSERVACAO: TStringField;
    tbhistoricochequeCODIGO: TIntegerField;
    tbhistoricochequeSEQUENCIA: TIntegerField;
    tbhistoricochequeVALOR: TFloatField;
    dshistoricocheque: TDataSource;
    tbentregalote: TFDMemTable;
    DateField1: TDateField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField9: TStringField;
    IntegerField7: TIntegerField;
    FloatField7: TFloatField;
    tbentregaloteLOTE: TStringField;
    tbentregaloteTIPOLOTE: TStringField;
    tbentregaloteSEQUENCIA: TIntegerField;
    tbentregaloteQUANTIDADE: TFloatField;
    dsentregalote: TDataSource;
    tb_movimentovendedor: TFDMemTable;
    tb_movimentovendedorbusca: TStringField;
    tb_movimentovendedorFUNCIONARIO: TIntegerField;
    tb_movimentovendedorNOME: TStringField;
    tb_movimentovendedorCOMISSAO: TFloatField;
    tb_movimentovendedorexclui: TStringField;
    dsmovimentovendedor: TDataSource;
    tbimpressaoexcel: TFDMemTable;
    dsimpressaoexcel: TDataSource;
    tb_recibotermo: TFDMemTable;
    tb_recibotermoMOTORISTA: TIntegerField;
    tb_recibotermoNOME: TStringField;
    tb_recibotermoCPF: TStringField;
    tb_recibotermoexclui: TStringField;
    tb_recibotermoVALOR: TFloatField;
    tb_recibotermoOP: TStringField;
    ds_recibotermo: TDataSource;
    ACBrSPEDFiscal: TACBrSPEDFiscal;
    ACBrNFe: TACBrNFe;
    ACBrCEP: TACBrCEP;
    ACBrNCMs: TACBrNCMs;
    ACBrValidador: TACBrValidador;
    ACBrConsultaCNPJ: TACBrConsultaCNPJ;
    ACBrMail: TACBrMail;
    ACBrBoleto: TACBrBoleto;
    ACBrBoletoretorno: TACBrBoleto;
    imgl20: TUniNativeImageList;
    imglFA: TUniNativeImageList;
    imgl32: TUniNativeImageList;
    UniNativeImageList32x32: TUniNativeImageList;
    ACBrMDFe: TACBrMDFe;
    ACBrMDFeDAMDFeRL: TACBrMDFeDAMDFeRL;
    ACBrNFeDANFeRL: TACBrNFeDANFeRL;
    FDQuerypessoasTipo: TFDQuery;
    DSpessoasTipo: TDataSource;
    FDQuerypessoasTipoCODIGO: TIntegerField;
    FDQuerypessoasTipoDESCRICAO: TStringField;
    DSpessoasSituacao: TDataSource;
    fdPessoasSituacao: TFDQuery;
    fdPessoasSituacaoCODIGO: TIntegerField;
    fdPessoasSituacaoDESCRICAO: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure UniSweetAlertDismiss(Sender: TObject; const Reason: TDismissType);
    procedure UniSweetAlertConfirm(Sender: TObject);

  private
    { Private declarations }
    iSteps : integer; //6.0.0.0( for debug tests )
    C : TUniClientInfoRec;
    oSweetAlertFocus_Confirm, oSweetAlertFocus_Dismiss : TUniControl;
    oSweetAlert : TUniSweetAlert;
    cMSG_SEARCH_RECORD,
    cMSG_BUGERROR_DATABASE_CONN : string;
  public
    { Public declarations }
    //8.2.0.0
    bMobile_Screen_Old,
    bMobile_Screen,
    bMobile_Screen_Portrait,
    bMobile_Screen_Landscape : boolean;

    procedure tbtitulosBeforePost(DataSet: TDataSet);
    procedure rc_CloseQuerys( pRoot : TComponent; pCloseALL : boolean = true; pCloseConnections : boolean = false );//8.0.0.0
    function  rc_OpenQuery( pQry : TFDQuery; pSW : boolean = false ) : Boolean;
    //deleta o reg. clicado no GRID DE PESQUISA PADRAO | deletes the reg. clicked on the DEFAULT SEARCH GRID
    function  rc_DeleteActiveRecord( pTable : string; pQryMaster, pQrySearchMaster : TFDQuery; pId : integer; pShowMsgAfterDel : boolean = true; pDeletedControl:string = ''; pForm : TObject = nil ):boolean;
    function  rc_DeleteRecord( pTable : String = ''; pWhere : string = ''):boolean;
    function  rc_HasCodeRegistered( pId: string): string; //6.0.0.0

    function  rc_GetSQL( pDBType, pDefinition: string; pIniOrPage : integer = 0; pEndOrRecsPerPage : integer = 0 ; pS1 : string = ''): string; // 6.0.0.0
    function  rc_ConnectDB( pDBType: String; pConn: TFDConnection; pSW : boolean = false ) : Boolean;
    // retorna o conteudo de um campo qualquer | returns the content of any field
    function  rc_GetFIELD( pIsNotAPI: Boolean; pField, pTable : string; pWhere: string = '' ) : variant;
    // saber se o campo existe | know if the field exists
    function  rc_FieldExists( pIsNotAPI : Boolean; pField, pTable: string): Boolean;
    // criar um novo campo | create a new field
    function  rc_CreateField( pIsNotAPI : Boolean; pField, pTable, pType : string): Boolean;//8.0.0.0
    // saber se uma tabela existe no BD | know if a table exists in the DB
    function  rc_TableExists( pIsNotAPI : Boolean; pTable: string): Boolean;
    // retorna um REGISTRO/DATASET COMPLETO | // returns a COMPLETE RECORD/DATASET
    function  rc_GetRecord( pIsNotAPI: Boolean; pAll : boolean; pSql: String ) : TFDMemTable;
    // gerar prox. codigo sequencial | generate prox. sequential code
    function  rc_GetNextID( pIsNotAPI : Boolean; pTable : string; pField : string; pWhere : string = '' ) : Integer;
    procedure rc_ApplyUpdatesError( pQry : TFDQuery; pErrors : Integer; pMessage : string );
    // retorna o totalizador de registros de uma tabela | returns the total number of records from a table
    function  rc_GetTotRecords ( pIsNotAPI : Boolean; pTable : string; pWhere : string = '' ) : integer;
    function  rc_ExecuteQuery( pIsNotAPI : Boolean; pQry : string; pParams : array of Variant ): String;
    function  rc_GetMD5(const pText:string ):string;
    // controle de permissões | permission control
    function  rc_PermissionVerify( pFormName, pCaption: String; pPos: Integer ; pAdm : boolean = true; pShowMessage : boolean = true ): Boolean;
    //sweet alert and toast
    //7.4.0.0
    function  rc_ShowSweetAlert( pTitle, pText: String;
                                 pType: String = 'success';
                                 pFormSender : TObject = nil;
                                 pControlFocusConfirm : string = '';
                                 pControlFocusDismiss : string = '';
                                 pCallBackConfirm:TNotifyEvent = nil;
                                 pCallBackDismiss:TSweetAlertDismissEvent = nil;
                                 pConfirmBtnText : string = '';
                                 pCancelBtnText : string = '' ;
                                 pShowLoader : boolean = false ): Boolean; overload;
    //7.4.0.0
    function  rc_ShowSweetAlert( pTitle, pText: String;
                                 pType: TRCSwtAlertType = swtSuccess;
                                 pFormSender : TObject = nil;
                                 pControlFocusConfirm : string = '';
                                 pControlFocusDismiss : string = '';
                                 pCallBackConfirm:TNotifyEvent = nil;
                                 pCallBackDismiss:TSweetAlertDismissEvent = nil;
                                 pConfirmBtnText : string = '';
                                 pCancelBtnText : string = '' ;
                                 pShowLoader : boolean = false ): Boolean; overload;

    procedure rc_ShowSweetAlertQuestion( pMessage: string;
                                         pFormSender : TObject = nil;
                                         pCallBackConfirm:TNotifyEvent = nil;
                                         pCallBackDismiss:TSweetAlertDismissEvent = nil;
                                         pConfirmBtnText : string = '';
                                         pCancelBtnText : string = '' ;
                                         pShowLoader : boolean = false );

    procedure rc_ShowSweetAlertSimple( pMessage: string);
    procedure rc_ShowSweetAlertSuccess( pMessage: string );
    procedure rc_ShowSweetAlertWarning( pMessage: string );
    procedure rc_ShowSweetAlertInfo( pMessage: string );
    procedure rc_ShowSweetAlertError( pMessage: string );
    procedure rc_ShowToaster( pType, pMessage: string; pSound : boolean = false; pTransition: string = 'pinItUp'; pDuration : integer = 3500 ); overload; // 6.0.0.0
    procedure rc_ShowToaster( pType : TRCToastyType; pMessage: string; pSound : boolean = false; pTransition: TRCToastyTransition = ttrPinItUp; pDuration : integer = 3500  ; pDoNotShow : boolean = false ); overload; // 6.0.0.1
    procedure rc_ShowMessageCallBack(Sender: TComponent; AResult:Integer);
    procedure rc_ShowMessage( pMessage : string; pTipo : string = 'info'; pWidth : integer = 360; pHeight : integer = 360; pHint : string = '[[modal:]]'; pLottieFile : string = '');
    procedure rc_ShowSuccess( pMessage : string; pWidth : integer = 360; pHeight : integer = 360 ; pHint : string = '[[modal:]]' );
    procedure rc_ShowInfo( pMessage : string; pWidth : integer = 360; pHeight : integer = 360 ; pHint : string = '[[modal:]]' );
    procedure rc_ShowWarning( pMessage : string; pWidth : integer = 360; pHeight : integer = 360 ; pHint : string = '[[modal:]]' );
    procedure rc_ShowError( pMessage : string ; pWidth : integer = 360; pHeight : integer = 360 ; pHint : string = '[[modal:]]' );
    function  rc_ShowYesNo( pMessage : string ; pWidth : integer = 360; pHeight : integer = 360 ; pHint : string = '[[modal:]]'; pUseCallBack : boolean = false ) : boolean; // 6.0.0.0
    procedure rc_ShowInputBox( pTitle : string ; pLab1, pEd1 : string ; pLab2 : string = ''; pEd2 : string = ''; bIsPassword : boolean = false; bEd1IsDate : boolean = false; bEd2IsDate : boolean = false ; pHint : string = '[[modal:]]' );
    // 6.0.0.0
    // deprecated: use the new version below without "pComps" param
    procedure rc_ShowInputBoxCustom( pTitle : string ; pComps : Array of rgInputBoxCustom; pBtn1 : boolean = true; pBtn1Hint : string = ''; pBtn2Hint : string = ''; pBtn1Caption : string = ''; pBtn2Caption : string = '' );overload;
    //8.0.0.0
    procedure rc_ShowInputBoxCustom( pTitle : string ;
                                     pBtn1 : boolean = true;
                                     pBtn1Hint : string = ''; pBtn2Hint : string = '';
                                     pBtn1Caption : string = ''; pBtn2Caption : string = '';
                                     pContinueFromLastIdx : boolean = false;
                                     pNoPicture : boolean = false;
                                     pHint : string = '';
                                     pQuestionID : integer = 1
                                      );overload;
    //8.0.0.0
    procedure rc_AddToInputBoxCustom( pReset : boolean;
                                      pCompType : TRCIBCComponent;
                                      pCompTypeAttr : string ;
                                      pCompLabel : string ;
                                      pCompLabelAttr : string ;
                                      pCompValue : variant ;
                                      pCompDefaultValue : variant ;
                                      pCompLabelHeight : integer = 30;
                                      pQuestionID : integer = 0
                                      );

    function rc_GetInputBoxCustomValue( pValueIdx : integer = 0 ) : variant;
    function rc_GetInputBoxCustomAnswer( pGetItem : boolean = true; pQuestionID : integer = 0 ) : string;//8.0.0.0
    //[PT] devido a um 'erro' q nao descobri com SHOWMODAL, criei uma rotina exclusiva pra tratar a exclusão de registros( confirmação )
    //[EN] due to an 'error' that I didn't discover with SHOWMODAL, I created an exclusive routine to handle the deletion of records (confirmation)
    procedure rc_RecordDeleteCallBack(Sender: TComponent; AResult:Integer);
    procedure rc_GridDrawCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure rc_DrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);//8.2.0.0 model-search
    procedure rc_GridMenuOff( pGrid : TUniDBGrid ); //7.0.0.0 grid-menu:off
    procedure rc_GridColumnLock( pGrid : TUniDBGrid; pColumn : Integer );
    procedure rc_GridSortColumn( pGrid : TUniDBGrid; const FieldName: string; Dir: Boolean);
    procedure rc_ReportDateInterval( pPeriod: string );
    procedure rc_ResizeBlocks( pFrame : TObject; pRunBSRender : boolean = true; pRunAlignment : boolean = true; pScrollTop : boolean = true );
    procedure rc_BootStrapRender( pForm : TObject ; pUpdateDBFields : Boolean = False ; pOnlyThisObj : TObject = nil );
    procedure rc_AdjustEditColors( pForm : TObject );
    procedure rc_RenderControls(pForm: TObject; pOnlyThisObj : TUniControl = nil );
    procedure DynamicOnTriggerEvent( Sender: TUniFormControl; AButtonId: Integer); //8.0.0.0
    procedure DynamicNumPadClick( sender : TObject );//8.0.0.0
    procedure DynamicOnClickClipBoard( sender :TObject );
    procedure DynamicOnClickLink( sender :TObject );
    procedure DynamicOnClickDial( sender :TObject );
    procedure DynamicOnClickMail( sender :TObject ); //( in development )
    //[PT] funções relacionadas ao lookup dinâmico( em conjunto com frmLookUP e frmLookUpLite ). eventos dinamicos
    //[EN] functions related to dynamic lookup (together with frmLookUP and frmLookUpLite). dynamic events
    procedure DynamicBtnClick(Sender: TObject );
    procedure DynamicOnKeyPress(Sender: TObject; var Key: Char); //
    procedure DynamicOnKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState); //
    procedure DynamicOnDblClick(Sender: TObject);
    procedure DynamicOnExit( sender: TObject );
    procedure DynamicOnExitLkpExtra( sender: TObject );
    procedure DynamicOnChangeValueForSetDS( sender : TObject );
    procedure DynamicBtnClearClick(Sender: TObject ); // 6.0.0.0
    procedure DynamicOnChangeLkpID( Sender: TObject ); // 7.0.0.0
    procedure rc_LookUpSearchFilter(Sender: TObject ; pWhere: string = ''; pOrder : string = ''; pSearchFields : string = ''; pLookUpGridAttr : string = '' ); //
    procedure rc_RenderLookUpControls( pFrame: TObject );
    function  rc_LookUpSearch( pFrame : TObject ; pLkpbtnLkp: String ; pSender : TObject = nil; pLookUpGridAttr : string = '' ):Boolean;
    function  rc_LookUpSearchLite( pFrame : TObject; pLkpbtnLkp: String ; pSender : TObject = nil; pLookUpGridAttr : string = '' ):Boolean;
    procedure rc_UpdateLookupCalled( pFrame : TObject; pTemp , pExtraResponseField , pExtraSearchField : string; pIsExtraSearch : boolean; LkpDBPesqExtra, LkpDBCod, LkpDBEdit : TUniDBEdit; lkpQuery, pSQLMaster : TFDQuery; iTag : integer );
    function  rc_GetLookUpField( pFrame, pLkp : TObject; pField: string ): Variant;
    function  rc_GetLookUpDBEdit(pSender: TObject): TUniDBEdit;//7.4.0.0
    function  rc_GetLookUpTag( pLookup : TUniControl; pResultType : TRCLookupTagType = lktInteger ; pLkpStrTrim : boolean = true ) : Variant; // 6.0.0.0
    procedure rc_SetLookUpTag( pLookup : TUniControl; pContent : Variant; pContentType : TRCLookupTagType = lktInteger ) ; // 6.0.0.0
    // associa o btnLkp ao lkp_COD ou lkp_pesqextra | associate btnLkp with lkp_COD or lkp_pesqextra
    procedure rc_LookUpClickButton( pFrame : TObject ; pEdit : string ); //overload;
    // atualiza o conteúdo dos lookups na tela | updates the content of the lookups on the screen
    procedure rc_LookUpUpdateData( pFrame: TObject; pLkp : TUniControl = nil; pClearsearchonly : boolean = false; pBtnClearLkpLite2 : boolean = false ); // 6.0.0.0 onlysearch
    // clear / visible / enabled on / off lookup controls
    procedure rc_LookUpControlsEnabled( pFrame: TObject; pLkp : TUniControl; pState: Boolean );
    //procedure rc_ObjectEnabled( pFrame: TObject; pObj : TUniControl; pState: Boolean; pForce: boolean = false); // 7.0.0.0 moved to mkm_layout
    procedure rc_LookUpControlsVisible( pFrame: TObject; pLkp : TUniControl; pState: Boolean);
    procedure rc_LookUpControlsClear( pFrame: TObject; pLkp : TUniControl);
    // retorna se conectou com o BD | returns connected to the BD
    function  rc_ProcessFirstConnection ( pSW : boolean = false ): Boolean;
    procedure rc_ProcessLogin( pUser, pPassWord : string; pMobile : boolean );//login
    procedure rc_ProcessCompanySearch( pSearch : string ); //
    // pesquisa de CEP em QUALQUER FORM/FRAME via JQUERY e atualiza a QUERY com o resultado do JSON  ( only for Brazil )
    procedure rc_SearchPostalCodeCEP( pCep, pType, pFormFrame : string ; pQry : TFDQuery = nil ); overload; //7.3.0.0
    //7.3.0.0
    procedure rc_SearchPostalCodeCEP( pCep, pFormFrame : string ; pQry : TFDQuery = nil;
                                      pUF : tunicontrol = nil;
                                      pCidade : tunicontrol = nil;
                                      pBairro : tunicontrol = nil;
                                      pEnder : tunicontrol = nil;
                                      pIbge : tunicontrol = nil); overload;
    procedure rc_MaskAdjust( pDbEdit : TObject; pMaskType : TRCMaskType; pCustomMask : string = '' );
    // retorna o componente pai para retornar a posição absoluta ( x, y ) | returns the parent component to return the absolute position ( x, y )
    procedure rc_GetObjParent( pForm:TObject; pObj : TUniControl; out iLeft, iTop : integer; pParentComp : TComponent );
    function rc_BlockParentIsCollapsed( pForm:TObject; pObj : TUniControl  ) : TUniControl; // 6.0.0.0
    procedure rc_ShowTour( pForm:TObject ; pRecreate:boolean = true );
    procedure rc_CreateTourComponents( pForm:TObject ; pTheme : string = 'defined' );
    procedure rc_NextTour(Sender: TObject; pForm:TObject );
    function rc_GetPrimaryKey( pTable : string; pAllKeys : boolean = false; pGetThisPK : string = '' ) : string; // 6.0.0.0 pkcomposta
    procedure rc_FillSearchFieldsCRUD( pFrame: TObject; pName, pField, pDescription: String);
    // preenche um combobox | fill a combobox
    //8.4.0.3
    procedure rc_FillComboBox( pCbx: TUniComboBox; pTable, pField : string; pWhere : String = ''; pFiles : string = '' );overload;
    procedure rc_FillComboBox( pFrame : TObject; pCbx: TUniComboBox; pFromJS_API : string = ''; pAPIKey : string = '' );overload;
    // 7.0.0.0
    // BLOBs
    // salva uma string formatada BLOB | save a BLOB formatted string
    function  rc_SaveBlobStr( pObj : TComponent; pTable, pField , pWhere : string ) : Boolean;
    // Carrega uma string formatada BLOB | load a BLOB formatted string
    function  rc_LoadBlobStr( pObj : TComponent; pQuery : TFDQuery; pField : string): Boolean;
    // salva um BLOB | save a BLOB
    function  rc_SaveBlobImg( pImg : TUniImage; pPng : Boolean; pTable, pField , pWhere : string ) : Boolean;
    // Carrega um BLOB | load a BLOB
    function  rc_LoadBlobImg(pImg: TUniImage; pPng: Boolean; pQuery : TFDQuery; pField : string): Boolean;
    // centraliza um modal via JS( deprecated - do not use)
    function  rc_OnResize( pFormName : string ; pCenter : boolean = true ) : string;
    // abre um LINK | open a link
    procedure rc_OpenLink( pLink : string; pTarget : string = '_blank' );
    // set focus
    procedure rc_SetFocus( pObj : TObject );
    //8.0.0.0 SetCursor to End of the text
    procedure rc_SetCursorEndOfText;
    procedure rc_SetCursorBeginOfText( pControl : TUniControl ); //8.4.0.2


    function  rc_ObjectExists( pName: string): boolean;
    function  rc_PrepareDetailForm( pForm : TObject; pTable_Detail, pCode_ID_Field, pTitle : string ): integer;
    // Capturar informações sobre dispositivo que está acessando a aplicação
    // Capture information about device accessing the application
    function  rc_GetDeviceType : string;
    // Atualizar valores referentes a resolução para auxílio no controle de responsividade
    // Update resolution values to aid in responsiveness control
    function rc_ScreenUpdate( pMainMenuExists : boolean = true; pPlatformChanged : boolean = false ) : TObject; // 6.0.0.0
    procedure rc_SwtEnabled( pFrame : TObject; pObj : string; pState : Boolean; pRender : Boolean = false );
    procedure rc_ChkEnabled( pFrame : TObject; pObj : string; pState : Boolean; pRender : Boolean = false  );
    procedure rc_RgpEnabled( pFrame : TObject; pObj : string; pState : Boolean; pRender : Boolean = false  );
    procedure rc_SwtCheck( pFrame : TObject; pObj : string; pState : Boolean; pRender : Boolean = false );
    procedure rc_ChkCheck( pFrame : TObject; pObj : string; pState : Boolean; pRender : Boolean = false  );
    procedure rc_RgpCheck( pFrame : TObject; pObj : string; pState : Boolean; pRender : Boolean = false  );
    procedure rc_RgpInitialize( pFrame : TObject );
    function  rc_GetItemIndexFromRgp( pLabel : TUniLabel ) : Integer;
    function  rc_GetValueFromRgp( pLabel : TUniLabel ) : String;
    function  rc_GetTagFromChk( pLabel : TUniLabel ) : Integer;
    function rc_GetParamFromRGP( pName : string; pParam: TRCRGPParamType ): string;
    procedure rc_ApplyEditMasks( pForm : TObject; pOnlyThisObj : TUniControl = nil ); //7.0.0.0
    // gerar um LOG com o ultimo erro ocorrido
    // generate a LOG with the last error occurred
    procedure rc_ErrorLog( E: Exception; pExtraMsg : string = ''; pShowToaster : boolean = false; pShowMessage : boolean = false; pConsoleLog : boolean = false );//8.3.0.0
    function rc_LoadConfig : integer;
    procedure rc_LoadTheme( pName:String );
    procedure rc_SaveTheme( pName:String );
    procedure rc_BuildMainMenu( pSearch : string; pTreeMenu : TUniTreeMenu );
    function rc_IntToString( pInt : Integer ): String;
    function rc_ForceDirectories(pPath: string): boolean;
    function rc_GetIndexFromArray( pStr : string; pArray : Array of string) : integer;
    function rc_StripHtmlTags( pHtml : string ) : string;
    procedure rc_DBGridUpdate(pGrid: TUniDBGrid; pRefresh : boolean; pCheckForceFit : boolean = false );
    procedure rc_DBGridHidePaginationBar( pGrid : TUniDBGrid ) ; // thanks Eduardo Belo
    function rc_ExtractFieldNameFromSearchItem( pItem : string; pAlias : boolean = false ) : string;

    procedure rc_BitmapClear( pImgObj : TUniImage ); // windows and linux
    procedure rc_DBGridExport( pGrid : TUniDBGRID; pType : TRCExportType ); overload;                        //7.0.0.0 dbgexport
    procedure rc_DBGridExport( pGrid : TUniDBGRID; pGrid_Source : TUniDBGRID; pType: TRCExportType); overload; //7.0.0.0 dbgexport
    procedure rc_DBGridUpdateAll( pObj : TObject ; pRefresh : boolean = true; pRefreshPaginator : boolean = false; pCheckForceFit : boolean = false );
    procedure rc_ProtectForm( sender : TObject );

    function rc_DeleteFKTables( pTable : string; pPKField, pPKValue : string ):boolean;
    procedure rc_UpdateDetailField( pErrors : integer; pStatus : string; pQuery : TFDQuery; pField : string; pValue : integer );

    procedure rc_GridFieldGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    //8.0.0.0
    procedure rc_AddFieldsEditor( pDataSet : TDataSet );//in development

    function rc_CloseTab( pForm : TObject; pPgCtrlName, pTabName : string ) : boolean;

    function rc_GetJSName( pObj:TObject ):string;
    function rc_GetJSID( pObj:TObject ):string;
    function rc_ExtEvtKeyDownOnlyNumbers:string; // thanks Eduardo Belo

    procedure DynamicCollapse( Sender : TObject );

    procedure rc_ConsoleLog(pText: string; pForce : boolean = false ); //7.0.0.0
    procedure rc_UniguiLog(pText: string; pForce : boolean = false ); //7.0.0.0

    function rc_GetActiveFormFrameNameInMainTab( pTab : TUniTabSheet = NIL ) : string; // 6.0.0.0
    //rc_paginator
    procedure DynamicGridPaginatorSearch( Sender : TObject );
    procedure DynamicGridPaginatorRefresh( Sender : TObject );
    procedure DynamicGridPaginatorFirst( Sender : TObject );
    procedure DynamicGridPaginatorPrior( Sender : TObject );
    procedure DynamicGridPaginatorNext( Sender : TObject );
    procedure DynamicGridPaginatorLast( Sender : TObject );
    procedure DynamicGridPaginatorGoPageDown( Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DynamicGridPaginatorOnRecCount(Sender: TUniDBGrid; var RecCount: Integer);
    procedure DynamicGridPaginatorOnStateChange(Sender: TObject );
    procedure rc_GridPaginatorUpdatePages( pGrid : TUniDBGrid; pPageNumber : integer = 1 ); //7.0.0.0
    procedure rc_GridPaginatorSearch( pGrid : TUniDBGrid );
    procedure rc_GridPaginatorRefresh( pGrid : TUniDBGrid );
    procedure rc_GridPaginatorFirst( pGrid : TUniDBGrid );
    procedure rc_GridPaginatorPrior( pGrid : TUniDBGrid );
    procedure rc_GridPaginatorNext( pGrid : TUniDBGrid; pJustUpdate : boolean = false ); // 6.0.0.0
    procedure rc_GridPaginatorLast( pGrid : TUniDBGrid );
    procedure rc_GridPaginatorGoPageKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rc_GridPaginatorGoPage( pGrid : TUniDBGrid; pPage : TUniEdit; pTotPages : TUniLabel; bInit : Boolean = false );
    procedure rc_GridPaginatorUpdateControls( pGrid : TUniDBGrid; iPageNumber, iCurrPage : integer );
    //
    function rc_FindDataModule( pName : string ) : TDataModule;
    //8.0.0.0
    procedure rc_ShowHideObject( pSender : TObject;
                                 pPanelObj : TObject;
                                 pLeft, pTop : integer;
                                 pAnimType : Integer;
                                 pGetParent : boolean = false;
                                 pShowHide : boolean = true;
                                 pCenter : boolean = true;
                                 pTopDown : boolean = true;
                                 pModal : boolean = true;
                                 pSlide : boolean = true;
                                 pDuration : string = '0.4' );

    //[PT] pesquisa na lista de forms/frames abertos( pgGeneral )
    //[EN] Search on the open form/frame list( pgGeneral )
    //
    //[PT] função removida e criada uma nova ) ( rc_FindFormFrameIntoTab ) na unit mkm_layout
    //[EN] function removed and created a new one ) ( rc_FindFormFrameIntoTab ) in unit mkm_layout
    //function rc_GetFormFrameName( pName : string; pSeq : integer = 0 ) : TObject;
    //
    procedure rc_TranslatePeriodOptions( pCbx : TUniComboBox );
    procedure rcGuideTour_btnPriorClick(Sender: TObject);
    procedure rcGuideTour_btnNextClick(Sender: TObject);
    procedure rcGuideTour_btnCloseClick(Sender: TObject);
    procedure rc_CopyToClipBoard( Sender : TObject );
    procedure rc_ContinueRegistering( pForm : TObject );
    // 6.0.0.0
    function rc_ActionBtnsRender( pForm : TObject; pGrid : TUniDBGrid ) : boolean;
    procedure rc_ActionBtnCellClick( pForm : TObject; cColumn : String );
    function rc_FindMenuOption( pOption:string ) : integer;
    //[PT]
    // A formação do atributo "tag-form:" se dá após ele ser criado( o que dispara o evento CREATE antes dele ser preenchido )
    // Se for necessário capturar o "tag-form:" no evento on create, passe o parâmetro "pFromSelectedMenuOption" como true, em caso contrário,
    // será capturado o conteúdo de "tag-form:" direto da propriedade "hint" de "pForm".
    //[EN]
    // The formation of the "tag-form:" attribute takes place after it is created (which triggers the CREATE event before it is filled in)
    // If it is necessary to capture the "tag-form:" in the on create event, pass the "pFromSelectedMenuOption" parameter as true, otherwise,
    // the content of "tag-form:" will be captured directly from the "hint" property of "pForm".
    function rc_GetTagFormAttr( pForm : TObject = nil; pFromSelectedMenuOption : boolean = false ) : string;
    function rc_DataSetDatasourceIsNil( pGrid : TObject ) : boolean; overload; //7.2.0.0
    procedure rc_FormLabelClick( Sender : TObject );
    function rc_GetHomePath : string;
    function rc_GetFilesPath : string;
    function rc_GetFilesURL : string; //6.0.0.1
    function rc_GetFromFilesFolder( pPath : string; pGetFolderURL : boolean = false ) : string; // to add path on html statements // 6.0.0.1
    function rc_ClearMenuParams( pOption : string ) : string;
    procedure rc_AddBeforeDeleteItem( pReset : boolean; pTable : string; pWhereID : string ; pTablePK : string);
    //6.0.0.1
    procedure rc_DummyDelay;
    //6.1.0.0
    function rc_DBSchema: string;
    //7.0.0.0
    //procedure rc_SendZapMsg(pPhone, pMsg: string);//8.4.0.0
    procedure DynamicInputAddOnShowTimePicker(sender: TObject);
    procedure DynamicInputAddOnShowDatePicker(sender: TObject);
    procedure DynamicInputAddOnSpin(sender: TObject);
    procedure DynamicRcTabsClick(sender: TObject);
    procedure rc_CloseFrame( pFrame : TUniFrame; pCloseQueries : boolean = false );
    //7.0.0.3
    procedure rc_MarqueeToggle(sender: TObject);
    //8.3.0.0
    function rc_PrepareFrameAsModal( Sender : TObject; cForm : string; cFormName : string = ''; pTagString : string = ''; pGetThisPk : string = '' ): TUniForm;
    //8.0.0.0
    procedure rc_AjaxRequest( pObj : string = ''; pEventName : string = ''; pParams : string = '' );
    function CalculaTitulos() : Real;
    procedure tbtitulosBeforeDelete(DataSet: TDataSet);

  end;

function dm_rc: tdm_rc;

implementation

{$R *.dfm}

uses
  UniGUIVars, uniGUIMainModule, ServerModule,
  mkm_func_web,  str_func,
  Main, untFrmInputBox, untFrmMessage, untFrmLookUp,
  Login,
  mkm_dbfuncs,
  untFrmLookUp_Lite, mkm_layout, mkm_gridblock, mkm_login, mkm_anim, mkm_createcomponents, mkm_translate, untFrmInputBoxCustom, untFrmLookUp_Lite_model_2,
  untFrmTimePicker, untFrmDatePicker, mkm_layout_aux_collapse, untFrmNumPad, mkm_layout_aux,
  untFrmInputBoxCustom_Forms; //8.1.0.0

procedure tdm_rc.tbtitulosBeforeDelete(DataSet: TDataSet);
begin
  CalculaTitulos;
end;

procedure tdm_rc.tbtitulosBeforePost(DataSet: TDataSet);
begin
  CalculaTitulos;
end;

function tdm_rc.CalculaTitulos: Real;
var
  total : Real;
begin
  total := 0;
  tbtitulos.DisableControls;
  while not tbtitulos.Eof do
    begin
      total := total + tbtitulosVALOR.AsFloat;
      tbtitulos.Next;
    end;
  Result := total;
  tbtitulos.EnableControls;
end;

function dm_rc: tdm_rc;
begin
  Result := tdm_rc(mm.GetModuleInstance(tdm_rc));
end;
//8.0.0.0
procedure Tdm_rc.rc_AjaxRequest( pObj : string; pEventName : string; pParams : string );
begin
   UniSession.JSCode(
                     ' ajaxRequest( ' + pObj + ' , "' + pEventName + '", ' +
                     '              [' +
                                      pParams +
                     '              ]);'
                    );
end;
//8.3.0.0
function tdm_rc.rc_PrepareFrameAsModal( Sender : TObject; cForm: string; cFormName : string; pTagString : string; pGetThisPk : string ): TUniForm;
var
   cFrm,cTbl,cFrmName : string;
   FrmC : TUniFormClass;
   Frm  : TUniForm;
   oFrame : TUniFrame;
begin
   //[PT] passar o nome( cFrm ) com ou sem prefixo( frm/frmCad ) dependendo do uconst.
   //[EN] Pass the name( cFrm ) with or without prefix (FRM/FRMCAD) depending on UCONST.
   cFrm := cForm;
   cTbl := '';
   try
      FrmC := TUniFormClass( FindAnyClass( 'TfrmModalFrameForm' ) );
      Frm                 := FrmC.Create( uniSession.uniapplication );
      Frm.Name            := Frm.Name + '__' + TUniControl(sender).Name ;
      mm.varC_FormSource_Search    := frm.Name;
      if rc_GetHintAttr( 'modal:', Frm.Hint ) = '' then
      begin
         Frm.Hint := rc_SetHintAttr( ''    , 'modal:' , Frm.Hint, True );
         Frm.Hint := rc_SetHintAttr( cTbl  , 'rcdynaddfrmtbl:', Frm.Hint, True );//7.2.0.0
         Frm.Hint := rc_SetHintAttr( cFrm  , 'rcdynaddfrm:', Frm.Hint, True );
         if cFormName <> '' then
            Frm.Hint := rc_SetHintAttr( cFormName  , 'rcdynaddfrmname:', Frm.Hint, True ); //8.0.0.0
         //8.3.0.0
         if pTagString <> '' then
            Frm.Hint := rc_SetHintAttr( pTagString  , 'rcdynaddtagstring:', Frm.Hint, True );
         if pGetThisPk <> '' then
            Frm.Hint := rc_SetHintAttr( pGetThisPk  , 'rcdynaddgetthispk:', Frm.Hint, True );

         (*
           [PT] Caso você crie um frame padrão e usá-lo como modal.
                No UniFrameReady do seu frame que será aberto como MODAL, e para ter um título padrão,
                vc pode ter um bloco e/ou um label chamado "labFormName".
           [EN] If you create a standard frame and use it as a modal,
                in your frame's UniFrameReady, which will open as a MODAL, and to have a standard title,
                you must have a block and/or a label called "labFormName".

           procedure TFraCadPadrao.UniFrameReady(Sender: TObject);
           var
              cFrmName : string;
           begin
              cFrmName := rc_GetHintAttr( 'rcdynaddfrmname:', Self.OwnerForm.Hint );
              if cFrmName <> '' then
              begin
                 if Self.FindComponent( 'labFormName' ) <> nil then
                 begin
                    labFormName.Caption := cFrmName;
                    //rc_ObjectStatus( Self, rcBlock1, true );// optional
                 end;
              end;
           end;

         *)
      end;
      mm.varC_Form_Modal := Frm;
      Result := Frm;
   except
      raise Exception.Create( cForm + ' not found!' );
   end;
end;
//7.0.0.3
procedure tdm_rc.rc_MarqueeToggle(sender: TObject);
var
   cTemp3, cCaption : string;
   oControl : TUniControl;
   iPos     : integer;
begin
    oControl := TUniLabel( Sender );
    iPos := rc_PosHintAttr( 'caption:' , TUniControl( oControl ).Hint );
    if ( iPos = 0 ) then
    begin
       //rc_AddCssClass( TUniControl( oControl ) , 'marquee-righttoleft' );
       //UniSession.AddJS( '$(''.marquee-righttoleft'').Css3Marquee();');
       cCaption := TUniControl( oControl ).Caption;
       TUniControl( oControl ).Hint := rc_SetHintAttr( cCaption, 'caption:' ,  TUniControl( oControl ).Hint  ) ;
       //cHint := rc_NormalizeHintAttr( TUniControl( oControl ).Hint );
    end
    else
    if iPos > 0 then
    begin
       cCaption := rc_GetHintAttr( 'caption:' ,  TUniControl( oControl ).Hint  );
    end;
    If Pos( '<marquee>', TUniLabel( oControl ).Caption ) > 0 then
       TUniLabel( oControl ).Caption := cCaption
    else
    if ( Length( cCaption ) * 5.6 ) > ( TUniLabel( oControl ).Parent.Width - 2 - ( 6*2) ) then
    begin
        cTemp3 := rc_StripHtmlTags( TUniLabel( oControl ).Caption );
        TUniLabel( oControl ).AutoSize := false;
        TUniLabel( oControl ).Width := TUniLabel( oControl ).Parent.Width * 2;
        TUniLabel( oControl ).Caption := '<marquee>' + StringReplace( cCaption , '<br>', '', [rfReplaceAll] ) + '</marquee>';
    end;
end;
//8.4.0.0
//procedure tdm_rc.rc_SendZapMsg(pPhone, pMsg: string);
//begin
//  UniSession.AddJS( 'window.open("https://wa.me/' + pPhone + '?text=' + pMsg + '", "_blank");' );
//end;
//6.1.0.0
function tdm_rc.rc_DBSchema: string;
begin
     Result := varIIF( DB_SCHEMA <> '',DB_SCHEMA + '.', '' );
end;
//6.0.0.1
procedure tdm_rc.rc_DummyDelay;
begin
     dm_rc.rc_ShowToaster(ttySuccess, '',false,ttrFade,0,true );
end;
// 6.0.0.0
function tdm_rc.rc_GetFilesPath : string;
begin
   Result := sm.FilesFolderPath;
end;
// 6.0.0.1
function tdm_rc.rc_GetFilesURL : string;
begin
   Result := sm.FilesFolderURL;
   if Copy( Result, 1, 6 ) = '/files' then
      Result := Copy( Result, 2 );
end;
//6.0.0.1
function tdm_rc.rc_GetFromFilesFolder( pPath : string; pGetFolderURL : boolean ): string;
begin
     if not pGetFolderURL then
        Result := Copy( pPath, Pos( 'files', pPath ) )
     else
        Result := sm.FilesFolderURL + Copy( pPath, Pos( 'files', pPath ) + 6 );
end;
// 6.0.0.0
function tdm_rc.rc_GetHomePath : string;
begin
  {$ifdef MSWINDOWS}
  Result := ExtractFilePath(Application.ExeName) ;
  {$endif}
  {$ifdef LINUX}
  Result := TPath.GetHomePath() + TPath.DirectorySeparatorChar ;
  {$endif}
end;
// 6.0.0.0
procedure tdm_rc.DynamicBtnClearClick(Sender: TObject);
var
   LkpDBEdit : TUniDBEdit;

   iPos,iAdd : integer;
   bProceed : boolean;
   LkpDBEditFilter,
   LkpDBEditFilterCodID : TUniDBEdit;
   cFilter         ,
   cFilterField,
   cFilterFieldType,
   cFilterType     ,
   cFilterMsgEmpty ,
   cFilterSearchField,
   cFilterOrder,
   cFilterGridAttr,
   cTemp : string;
   pDs : TDataSource;

   pDM : TDataModule;
   bOnlySearch : boolean;
   oHfRequired : TUniHTMLFrame;
   oLabel      : TUniLabel;
begin
     try
        bProceed := true;
        if ( sender is TUniLabel ) then
        begin
           if lowercase( Copy( TUniLabel( sender ).Name, 1, 11 ) ) = 'btnlkpclear' then
           begin
                TUniLabel( sender ).Visible := False;
                cTemp  := StringReplace( lowercase( TUniLabel( sender ).Name ), 'btnlkpclear' , 'edLkp' , [rfReplaceAll] );
                LkpDBEdit := TUniDBEdit( TUniLabel( sender ).Owner.FindComponent( cTemp ) );
                if LkpDBEdit <> nil then
                begin
                     rc_LookUpUpdateData( TUniLabel( sender ).Owner, LkpDBEdit, false, true );
                     LkpDBEdit.SetFocus;
                end;
           end;
        end;
     finally

     end;
end;
// 6.0.0.0
procedure tdm_rc.DynamicBtnClick(Sender: TObject );
var
   LkpDBEdit : TUniDBEdit;

   iPos,iAdd : integer;
   bProceed : boolean;
   LkpDBEditFilter,
   LkpDBEditFilterCodID : TUniDBEdit;
   cFilter         ,
   cFilterField,
   cFilterFieldType,
   cFilterType     ,
   cFilterMsgEmpty ,
   cFilterSearchField,
   cFilterOrder,
   cFilterGridAttr,
   cTemp, cLkpAttr : string; // 6.0.0.0
   pDs : TDataSource;

   pDM : TDataModule;
   bOnlySearch : boolean;
   oHfRequired : TUniHTMLFrame;
   oLabel      : TUniLabel;
begin
     try
        bProceed := true;
        if ( sender is TUniSpeedButton ) then
        begin
           if lowercase( Copy( TUniSpeedButton( sender ).Name, 1, 6 ) ) = 'btnlkp' then
           begin
                TUniSpeedButton( sender ).Enabled := False;
                if rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

                // Quando o lookup precisar ser filtrado, informe aqui antes de
                // chamar a função
                mm.varC_Where := '';
                mm.varC_Order := '';
                // pode adicionar mais campos para serem pesquisados no lookup ou
                // deixe em branco pra montar o padrão
                mm.varC_Search_Fields := '';
                pDM := nil;
                cTemp := StringReplace( lowercase( TUniSpeedButton( sender ).Name ) , 'btnlkp' , 'edlkp' , [rfReplaceAll] );
                LkpDBEdit := TUniDBEdit( TUniSpeedButton( sender ).owner.FindComponent( cTemp ) );

                // to clean "valid:" red borders
                // para limpar as bordas vermelhas do "valid:"
                if Pos( 'invalidate:true', LkpDBEdit.Hint ) > 0 then
                begin
                   rc_RemoveCssClass( LkpDBEdit , 'rc-invalid' );
                   if ( pos( 'true imsg:', LkpDBEdit.hint ) > 0 ) then
                   begin
                      oLabel := TUniLabel( TComponent(TUniSpeedButton( sender ).owner).FindComponent('rcLabel__inv_lab_' + LkpDBEdit.Name) );
                      if ( oLabel <> nil ) then
                      begin
                         oLabel.Visible := False;
                         LkpDBEdit.Hint := rc_SetHintAttr( 'false' , 'invalidate:', LkpDBEdit.Hint ); //v.
                      end;
                   end;
                   if ( pos( 'valid-required:', LkpDBEdit.hint ) > 0 ) then
                   begin
                      oHfRequired := TUniHTMLFrame( TComponent(TUniSpeedButton( sender ).owner).FindComponent('rc__Required' + LkpDBEdit.Name) );
                      if oHfRequired <> nil then
                      begin
                           oHfRequired.Visible := False;
                      end;
                   end;
                end;
                (*
                lkpfilter:quoted(uf=edLkpUFS<text>)
                lkpfilter-empty:Selecione uma UF|
                lkpfilter-order: |
                lkpfilter-searchfields: |
                lkpfilter-gridattr: |
                lkpfilter-settext:ed_lkp_Email field:email |
                lkpfilter-settext:ed_lkp_fone  field:fone1 |
                lkpfilter-settext:ed_lkp_block field:bloqueado |
                *)
                cFilter            := rc_GetHintAttr( 'lkpfilter:' , LkpDBEdit.Hint , false, true);
                //7.0.0.0 thanks FABIO OLIVEIRA/MOISÉS ROTTMAN
                cFilterSearchField := rc_GetHintAttr( 'lkpfilter-searchfields:' , LkpDBEdit.Hint , false, true);
                if ( cFilter.IsEmpty ) and ( cFilterSearchField <> '' ) then
                   cFilter := '1=1';
                cFilterType        := '';
                cFilterMsgEmpty    := '';
                cFilterField       := '';
                cFilterFieldType   := '';
                cFilterSearchField := '';
                cFilterOrder       := '';
                cFilterGridAttr    := '';
                if not cFilter.IsEmpty then
                begin
                     cFilterSearchField := rc_GetHintAttr( 'lkpfilter-searchfields:' , LkpDBEdit.Hint , false, true);
                     cFilterOrder       := rc_GetHintAttr( 'lkpfilter-order:' , LkpDBEdit.Hint , false, true);
                     cFilterGridAttr    := rc_GetHintAttr( 'lkpfilter-gridattr:' , LkpDBEdit.Hint , false, true);
                     cFilterMsgEmpty    := rc_GetHintAttr( 'lkpfilter-empty:' , LkpDBEdit.Hint , false, true);
                     // <text>: edLkpAAAA.Text or <id>: edLkpAAAA_CodID.Text
                     if Pos( '<text>', cFilter ) > 0 then
                        cFilterType        := '<text>'
                     else
                     if Pos( '<id>', cFilter ) > 0 then
                        cFilterType        := '<id>'
                     else
                        cFilterType        := '<text>';
                     // 6.0.0.0
                     cFilter            := Trim( StringReplace( cFilter, cFilterType, '', [rfReplaceAll] ) ) + ' ';
                     if copy( cFilter, 1, 7 ) = 'quoted(' then
                     begin
                        cFilterFieldType := '<str>';
                        cFilter          := Trim( Copy( cFilter, 8 ));
                        cFilter          := Trim( Copy( cFilter, 1, Length( cFilter ) - 1 ) );
                     end
                     else           // '
                     if Pos( '''',  cFilter ) > 0 then
                     begin
                        cFilterFieldType := '<str>';
                        //cFilter          := Trim( Copy( cFilter, 8 ));
                        //cFilter          := Trim( Copy( cFilter, 1, Length( cFilter ) - 1 ) );
                     end
                     else
                     begin
                        cFilterFieldType := '<0>';
                        // 6.0.0.0
                        if Copy( cFilter, 1,1 ) = '(' then
                        begin
                           cFilter          := Trim( Copy( cFilter, 2 ));
                           cFilter          := Trim( Copy( cFilter, 1, Length( cFilter ) - 1 ) );
                        end;
                     end;
                     iAdd := 1;
                     iPos := Pos( '<>', cFilter );
                     if iPos = 0 then
                     begin
                        iPos := Pos( '>=', cFilter );
                        if iPos = 0 then
                        begin
                           iPos := Pos( '<=', cFilter );
                           if iPos = 0 then
                           begin
                              iPos := Pos( '=', cFilter );
                              iAdd := 0;
                           end;
                        end;
                     end;

                     if iPos > 0 then
                     begin
                        cFilterField     := Trim( Copy( cFilter, 1, iPos + iAdd  ) );
                        cFilter          := Trim( Copy( cFilter, iPos + 1 + iAdd ) );
                     end
                     else
                     begin
                        dm_rc.rc_ShowError('"lkpfilter:" missing operator.');
                        Abort;
                     end;
                     // 6.0.0.0
                     LkpDBEditFilter := TUniDBEdit( LkpDBEdit.owner.FindComponent( cFilter ) );
                     if LkpDBEditFilter <> nil then
                     begin
                        LkpDBEditFilterCodID := TUniDBEdit( LkpDBEdit.owner.FindComponent( cFilter + '_CodID' ) );
                        if cFilterType = '<text>' then
                        begin
                             if LkpDBEditFilter.Text = '' then
                             begin
                                bProceed := false;
                                dm_rc.rc_ShowWarning( cFilterMsgEmpty );
                                rc_SetFocus( LkpDBEditFilter );
                             end;
                        end;
                        if cFilterType = '<id>' then
                        begin
                             if LkpDBEditFilterCodID.Text = '' then
                             begin
                                bProceed := false;
                                dm_rc.rc_ShowSweetAlertWarning( cFilterMsgEmpty );
                                if LkpDBEditFilterCodID.Visible then
                                begin
                                   dm_rc.rc_ShowWarning( cFilterMsgEmpty );
                                   rc_SetFocus( LkpDBEditFilterCodID );
                                end;
                             end;
                        end;
                     end
                     else
                     begin

                     end;
                end;

                if bProceed then
                begin
                   cTemp := 'dsMaster';
                   // 6.0.0.0
                   cLkpAttr := rc_GetHintAttr( 'lkp:' , LkpDBEdit.Hint ) ;
                   if Pos( ' ds:' , cLkpAttr ) > 0  then
                   begin
                      // 6.0.0.0
                      cTemp := rc_GetHintAttr( 'ds:', cLkpAttr, true, false, true );
                   end;

                   If Pos( '.', cTemp ) > 0 then
                   begin
                       pDM := nil;
                       pDM := rc_FindDataModule( Copy( cTemp, 1, pos( '.', cTemp ) - 1 ) );
                       cTemp := Copy( cTemp, pos( '.', cTemp ) + 1 );
                   end;
                   if pDM <> nil then
                      pDS  := TDataSource( pDM.FindComponent( cTemp ) )
                   else
                      pDS  := TDataSource( TUniSpeedButton( sender ).owner.FindComponent( cTemp ) );
                   // 6.0.0.0 onlysearch
                   bOnlySearch := ( Pos( 'searchonly', cLkpAttr ) > 0 ) ;
                   if ( pDs <> nil ) or ( bOnlySearch ) then
                   begin
                      if ( bOnlySearch ) or ( pDs.State in [dsEdit, dsInsert] ) then
                      begin

                        if cFilterField.IsEmpty then
                        begin
                           // onlysearch
                           if TUniSpeedButton( sender ).Tag = 0 then
                              rc_LookUpSearch( TUniSpeedButton( sender ).owner, TUniSpeedButton( sender ).Name , Sender )
                           else
                           begin
                              TUniSpeedButton( sender ).Tag := 0;
                              rc_LookUpSearchLite( TUniSpeedButton( sender ).owner, TUniSpeedButton( sender ).Name , Sender );
                              TUniSpeedButton( sender ).Tag := 1;
                           end;
                        end
                        else
                        begin
                            // 6.0.0.0
                            if LkpDBEditFilter <> nil then
                            begin
                               if cFilterFieldType = '<str>' then
                                  rc_LookUpSearchFilter( TUniSpeedButton( sender ), cFilterField + QuotedStr( LkpDBEditFilter.Text ), cFilterOrder, cFilterSearchField, cFilterGridAttr )
                               else
                               if cFilterFieldType = '<0>' then
                                  rc_LookUpSearchFilter( TUniSpeedButton( sender ), cFilterField + LkpDBEditFilter.Text, cFilterOrder, cFilterSearchField, cFilterGridAttr );
                            end
                            else
                            begin
                               if cFilterFieldType = '<str>' then
                                  rc_LookUpSearchFilter( TUniSpeedButton( sender ), cFilterField + cFilter, cFilterOrder, cFilterSearchField, cFilterGridAttr )
                               else
                               if cFilterFieldType = '<0>' then
                                  rc_LookUpSearchFilter( TUniSpeedButton( sender ), cFilterField + cFilter, cFilterOrder, cFilterSearchField, cFilterGridAttr );
                            end;
                        end;
                      end;
                   end;
                end;
           end;
        end;
     finally
          TUniSpeedButton( sender ).Enabled := True;
     end;
end;

procedure tdm_rc.DynamicCollapse( Sender: TObject );
begin
     rc_Collapse( Sender, TComponent( Sender ).Owner, TUniControl( sender ) );
end;
// 6.0.0.0
procedure tdm_rc.DynamicOnKeyPress(Sender: TObject; var Key: Char);
var
   cTemp, cLkpAttr : string; // 6.0.0.0
   pDs : TDataSource;
   pDM : TDataModule;
   bOnlySearch : boolean;
begin
     if ( sender is TUniDBEdit ) then
        if lowercase( Copy( TUniDBEdit( sender ).Name, 1, 5 ) ) = 'edlkp' then
        begin
           if CharInSet( Key , [ ' ', '0'..'9', 'a'..'z', 'A'..'Z' ] ) then
           begin
               Key := #0;

               if rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

               pDM := nil;
               // o SUFIXO do campo lookup e do Button de pesquisa devem ser iguais
               //
               // Ex: edLkpCLIENTES e btnLkpCLIENTES
               cTemp := 'dsMaster';
               // 6.0.0.0
               cLkpAttr := rc_GetHintAttr( 'lkp:' , TUniDBEdit( sender ).Hint ) ;
               if Pos( ' ds:' , cLkpAttr ) > 0  then
               begin
                  // 6.0.0.0
                  cTemp := rc_GetHintAttr( 'ds:', cLkpAttr, true, false, true );
               end;

               If Pos( '.', cTemp ) > 0 then
               begin
                   pDM := nil;
                   pDM := rc_FindDataModule( Copy( cTemp, 1, pos( '.', cTemp ) - 1 ) );
                   cTemp := Copy( cTemp, pos( '.', cTemp ) + 1 );
               end;
               if pDM <> nil then
                  pDS  := TDataSource( pDM.FindComponent( cTemp ) )
               else
                  pDS  := TDataSource( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );
               // 6.0.0.0 onlysearch
               //bOnlySearch := Pos( 'searchonly', TUniDBEdit( sender ).Hint ) > 0 ;
               bOnlySearch := Pos( 'searchonly', cLkpAttr ) > 0 ;
               if ( pDs <> nil ) or ( bOnlySearch ) then
                  if ( bOnlySearch ) or ( pDs.State in [dsEdit, dsInsert] ) then
                     TUniSpeedButton( TUniDBEdit( sender ).owner.FindComponent( 'btnLkp' + Copy( TUniDBEdit( sender ).Name, 6, 100 ) ) ).Click;
           end;
        end;
end;
//7.0.0.0
procedure tdm_rc.DynamicRcTabsClick(sender: TObject);
var
   oForm : TObject;
   oPage : TUniPageControl;
   oTab  : TUniTabSheet;
   oPanel : TUniContainer;
   oLabel : TUniLabel;
   cForm, cPanel, cPage, cTab : string;
   f,p : integer;
begin
     if Pos( 'rctabdata:', TUniControl( sender ).Hint ) > 0 then
     begin
        cTab := StringReplace( Copy( TUniControl( sender ).Name, 11 ), 'Click', '', [rfReplaceAll] );
        cForm := rc_GetHintAttr( 'rctabdata:', TUniControl( sender ).Hint );
        cPage := Copy( cForm, Pos( ' ', cForm ) + 1 );
        cForm := Copy( cForm, 1, Pos( ' ', cForm ) - 1 );
        oForm := rc_FindControl( cForm );
        if oForm = nil then
           oForm := rc_FindFormFrameIntoTab( cForm );
        if oForm <> nil then
        begin
             oPage := TUniPageControl( rc_FindControl( cPage , oForm ) );
             oTab := TUniTabSheet( rc_FindControl( cTab , oForm ) );
        end;
        for f := 0 to Pred( oPage.PageCount ) do
        begin
             cPanel := oPage.Pages[f].Name;
             TUniContainerPanel( rc_FindControl( 'rcTabPanel' + cPanel + 'Active' , oForm ) ).Visible := false;
             TUniLabel( rc_FindControl( 'rcTabPanel' + cPanel + 'Label' , oForm ) ).Font.Color := $008F8F8F;
             cTab := cPanel;
             rc_RemoveCssClass( TUniTabSheet( rc_FindControl( cTab , oForm ) ) , 'rc-fade-in' );
        end;
        cTab := TUniContainerPanel( sender ).Name;
        cTab := StringReplace( cTab, 'Click', '', [rfReplaceAll] );
        cPanel := cTab;
        cTab := StringReplace( cTab, 'rcTabPanel', '', [rfReplaceAll] );
        rc_AddCssClass   ( oTab , 'rc-fade-in' );
        oPage.activepage := oTab;
        TUniContainerPanel( rc_FindControl( cPanel + 'Active' , oForm ) ).Visible := true;
        TUniLabel( rc_FindControl( cPanel + 'Label' , oForm ) ).Font.Color := clBlack;
     end
     else  //rcTabPanelRightpgSampleCarouselLabel
     if ( Pos( 'rctabdata-left:', TUniControl( sender ).Hint ) > 0 ) or ( Pos( 'rctabdata-right:', TUniControl( sender ).Hint ) > 0 )then
     begin
        if ( Pos( 'rctabdata-left:', TUniControl( sender ).Hint ) > 0 ) then
           cForm := rc_GetHintAttr( 'rctabdata-left:', TUniControl( sender ).Hint )
        else
           cForm := rc_GetHintAttr( 'rctabdata-right:', TUniControl( sender ).Hint );

        cPage := Copy( cForm, Pos( ' ', cForm ) + 1 );
        cForm := Copy( cForm, 1, Pos( ' ', cForm ) - 1 );
        oForm := rc_FindControl( cForm );
        if oForm = nil then
           oForm := rc_FindFormFrameIntoTab( cForm );
        if oForm <> nil then
        begin
             oPage := TUniPageControl( rc_FindControl( cPage , oForm ) );
             cPage := oPage.Name;
        end;
        p := oPage.ActivePageIndex;
        if ( Pos( 'rctabdata-left:', TUniControl( sender ).Hint ) > 0 ) then
        begin
             if oPage.ActivePageIndex > 0 then
             begin
             if ( Pos( 'transition:slide', TUniControl( sender ).Parent.Parent.Hint ) > 0 ) then
             begin
                rc_RemoveCssClass( TUniTabSheet( oPage.ActivePage ) , 'slide_in' );
                rc_RemoveCssClass( TUniTabSheet( oPage.ActivePage ) , 'slide_out' );
             end
             else
             if ( Pos( 'transition:drop', TUniControl( sender ).Parent.Parent.Hint ) > 0 ) then
             begin
                rc_RemoveCssClass( TUniTabSheet( oPage.ActivePage ) , 'drop_in_bottom' );
                rc_RemoveCssClass( TUniTabSheet( oPage.ActivePage ) , 'drop_in' );
             end
             else
                rc_RemoveCssClass( TUniTabSheet( oPage.ActivePage ) , 'rc-fade-in' );

             //if oPage.ActivePageIndex > 0 then
                oPage.ActivePageIndex := oPage.ActivePageIndex - 1;
             end;
        end
        else
        if ( Pos( 'rctabdata-right:', TUniControl( sender ).Hint ) > 0 ) then
        begin
             if oPage.ActivePageIndex < oPage.PageCount then
             begin
                if ( Pos( 'transition:slide', TUniControl( sender ).Parent.Parent.Hint ) > 0 ) then
                begin
                   rc_RemoveCssClass( TUniTabSheet( oPage.ActivePage ) , 'slide_in' );
                   rc_RemoveCssClass( TUniTabSheet( oPage.ActivePage ) , 'slide_out' );
                end
                else
                if ( Pos( 'transition:drop', TUniControl( sender ).Parent.Parent.Hint ) > 0 ) then
                begin
                   rc_RemoveCssClass( TUniTabSheet( oPage.ActivePage ) , 'drop_in_bottom' );
                   rc_RemoveCssClass( TUniTabSheet( oPage.ActivePage ) , 'drop_in' );
                end
                else
                   rc_RemoveCssClass( TUniTabSheet( oPage.ActivePage ) , 'rc-fade-in' );
                //if oPage.ActivePageIndex < oPage.PageCount then
                   oPage.ActivePageIndex := oPage.ActivePageIndex + 1;
             end;
        end;

        if p <> oPage.ActivePageIndex then
        begin
           TUniLabel( rc_FindControl( 'rcTabCaption' + cPage , oForm ) ).Caption := oPage.ActivePage.Caption;

           if ( Pos( 'transition:slide', TUniControl( sender ).Parent.Parent.Hint ) > 0 ) then
           begin
              if ( Pos( 'rctabdata-right:', TUniControl( sender ).Hint ) > 0 ) then
                 rc_AddCssClass   ( oPage.ActivePage , 'slide_out' )
              else
              if ( Pos( 'rctabdata-left:', TUniControl( sender ).Hint ) > 0 ) then
                 rc_AddCssClass   ( oPage.ActivePage , 'slide_in' );
           end
           else
           if ( Pos( 'transition:drop', TUniControl( sender ).Parent.Parent.Hint ) > 0 ) then
           begin
              if ( Pos( 'rctabdata-right:', TUniControl( sender ).Hint ) > 0 ) then
                 rc_AddCssClass   ( oPage.ActivePage , 'drop_in_bottom' )
              else
              if ( Pos( 'rctabdata-left:', TUniControl( sender ).Hint ) > 0 ) then
                 rc_AddCssClass   ( oPage.ActivePage , 'drop_in' );        end
           else
              rc_AddCssClass   ( oPage.ActivePage , 'rc-fade-in' );
        end;
     end;
end;
//7.0.0.0
procedure tdm_rc.DynamicInputAddOnShowTimePicker(sender: TObject);
var
   oForm : TObject;
   oEdit : TUniControl;
   cForm, cEdit : string;
begin
     cForm := rc_GetHintAttr( 'rc-tpicker:', TUniControl( sender ).Hint );
     cEdit := Copy( cForm, Pos( ' ', cForm ) + 1 );
     cForm := Copy( cForm, 1, Pos( ' ', cForm ) - 1 );
     oForm := rc_FindControl( cForm );
     if oForm = nil then
        oForm := rc_FindFormFrameIntoTab( cForm );
     if oForm <> nil then
     begin
          oEdit := TUniControl( rc_FindControl( cEdit , oForm ) );
          if oEdit <> nil then
          begin
               mm.Active_Component := oEdit;
          end;
     end;
     //8.5.0.0
     if ( oEdit.Enabled ) and ( not TUniEdit(oEdit).ReadOnly ) then
        frmTimePicker.Show( procedure(Sender: TComponent; Resrrult:Integer)
                         begin

                         end
                       );
end;
//7.0.0.0
procedure tdm_rc.DynamicInputAddOnShowDatePicker(sender: TObject);
var
   oForm : TObject;
   oEdit : TUniControl;
   cForm, cEdit : string;
begin
     cForm := rc_GetHintAttr( 'rc-tpicker:', TUniControl( sender ).Hint );
     cEdit := Copy( cForm, Pos( ' ', cForm ) + 1 );
     cForm := Copy( cForm, 1, Pos( ' ', cForm ) - 1 );
     oForm := rc_FindControl( cForm );
     if oForm = nil then
        oForm := rc_FindFormFrameIntoTab( cForm );
     if oForm <> nil then
     begin
          oEdit := TUniControl( rc_FindControl( cEdit , oForm ) );
          if oEdit <> nil then
          begin
               mm.Active_Component := oEdit;
          end;
     end;
     //8.5.0.0
     if ( oEdit.Enabled ) and ( not TUniEdit(oEdit).ReadOnly ) then
        frmDatePicker.Show( procedure(Sender: TComponent; Resrrult:Integer)
                            begin

                            end
                          );
end;
//7.0.0.0
procedure TDm_rc.DynamicInputAddOnSpin(sender: TObject);
var
   oForm : TObject;
   oEdit : TUniControl;
   cForm, cEdit, cHint : string;
   iSpinValue,iMin, iMax, iStep : Integer;
begin
     cForm := rc_GetHintAttr( 'rc-tpicker:', TUniControl( sender ).Hint );
     cEdit := Copy( cForm, Pos( ' ', cForm ) + 1 );
     cForm := Copy( cForm, 1, Pos( ' ', cForm ) - 1 );
     oForm := rc_FindControl( cForm );
     if oForm = nil then
        oForm := rc_FindFormFrameIntoTab( cForm );
     if oForm <> nil then
     begin
          oEdit := TUniControl( rc_FindControl( cEdit , oForm ) );
          if oEdit <> nil then
          begin
               mm.Active_Component := oEdit;
               if Pos( 'spin', oEdit.Hint ) > 0 then
               begin
                    cHint := rc_GetHintAttr( 'input-addon:' , oEdit.Hint );
                    iStep := StrToIntDef( rc_GetHintAttr( 'step:' , cHint, true ), 1 );
                    iMin  := StrToIntDef( rc_GetHintAttr( 'min:' , cHint, true ), 0 );
                    iMax  := StrToIntDef( rc_GetHintAttr( 'max:' , cHint, true ), 9999 );

                    iSpinValue := StrToIntDef( TUniEdit(oEdit).Text , 0 );
                    if Pos( 'Plus_' , TUniControl( sender ).Name ) > 0 then
                    begin
                         iSpinValue := iSpinValue + iStep;
                         if iSpinValue > iMax then
                            iSpinValue := iMax;
                    end
                    else
                    begin
                         iSpinValue := iSpinValue - iStep;
                         if iSpinValue < iMin then
                            iSpinValue := iMin;
                    end;
                    if ( oEdit is TUniEdit ) or ( oEdit is TUniNumberEdit ) then
                       TUniEdit(oEdit).Text := iSpinValue.ToString
                    else
                    //8.5.0.0
                    if ( oEdit.Enabled ) and ( not TUniEdit(oEdit).ReadOnly ) then
                    begin
                       if ( oEdit is TUniEdit ) or ( oEdit is TUniNumberEdit ) or ( oEdit is TUniFormattedNumberEdit ) then
                          TUniEdit(oEdit).Text := iSpinValue.ToString
                       else
                       if ( oEdit is TUniDBEdit ) or ( oEdit is TUniDBNumberEdit ) or ( oEdit is TUniDBFormattedNumberEdit ) then
                       begin
                            if ( TUniDBEdit(oEdit).DataSource <> nil ) and
                               ( TUniDBEdit(oEdit).DataSource.DataSet <> nil ) and
                               ( TUniDBEdit(oEdit).DataSource.DataSet.State in [dsEdit, dsInsert] ) then
                               TDataSet( TUniDBEdit(oEdit).DataSource.DataSet ).FieldByName( TUniDBEdit(oEdit).DataField ).AsInteger := iSpinValue;
                       end;
                    end;
               end;
          end;
     end;
end;
//8.0.0.0 lookup keydown
procedure tdm_rc.DynamicOnKeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
var
   cTemp : string;
   oMainMenu, oBtn : TUniControl;
   oParent : TComponent;
begin
   if ( sender is TUniDBEdit ) then
      if ( not TUniDBEdit( sender ).ReadOnly ) and ( lowercase( Copy( TUniDBEdit( sender ).Name, 1, 5 ) ) = 'edlkp' ) then // 6.0.0.0
      begin
         if ( ( Key >= 48 ) and ( Key <= 57 ) ) or ( ( Key >= 65 ) and ( Key <= 127 ) ) or ( ( Shift = [ssCtrl] ) and ( Key = 13 ) ) then // ENTER gera efeito indesejado
         begin
              if ( ( Key >= 48 ) and ( Key <= 57 ) ) or ( ( Key >= 65 ) and ( Key <= 127 ) ) then
                 mm.varC_TempLink := TUniDBEdit( sender ).Text + Chr( Key );
              key := 0;

              cTemp   := StringReplace( lowercase( TUniDBEdit( sender ).Name ) , 'edlkp' , 'btnlkp' , [rfReplaceAll] );
              cTemp   := StringReplace( cTemp , '_codid' , '' , [rfReplaceAll] );

              oBtn := TUniSpeedButton( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );
              //8.0.0.0
              if ( oBtn.Visible = false ) and
                 ( Pos( 'btntype:trigger', TUniDBEdit( sender ).Hint ) > 0 )  then //8.1.0.0
              begin
                 oBtn.Visible := true;
                 TUniControl( sender ).Hint := rc_AddHintAttr( '|btntrigger:' , TUniControl( sender ).Hint, true );
                 dm_rc.rc_AjaxRequest(
                    'MainForm.htmlFrame',
                    '_getXYLookup',
                      '"x=" + ' + TUniControl( sender ).JSName + '.getEl().getLeft(), ' +
                      '"y=" + ' + TUniControl( sender ).JSName + '.getEl().getTop() ,' +
                      '"h=" + ' + TUniControl( sender ).JSName + '.getEl().getHeight() ,' +
                      '"w=" + ' + TUniControl( sender ).JSName + '.getEl().getWidth()'
                 );
                 UniSession.Synchronize;
              end;
              //8.0.0.0 lkp trigger
              try
                 try
                   TUniSpeedButton(oBtn).Click
                 except
                   DynamicBtnClick( TUniSpeedButton(oBtn) );
                 end;
              finally
                 if ( Pos( 'btntype:trigger', TUniDBEdit( sender ).Hint ) > 0 )  then //8.1.0.0
                    oBtn.Visible := false;
              end;
         end;
      end;
end;
//8.0.0.0
procedure tdm_rc.DynamicOnDblClick(Sender: TObject);
var
   cTemp,
   cTableName,
   cFrm : string;
   FrmC : TUniFormClass;
   Frm  : TUniForm;
   LkpEDIT : TUniControl;
   iW, iH : integer;
   oLkpBtn : TUniSpeedButton; //8.0.0.0
begin
     if rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

     if ( sender is TUniDBEdit ) then
     begin
        if lowercase( Copy( TUniDBEdit( sender ).Name, 1, 5 ) ) = 'edlkp' then
        begin
            if ( Pos( 'btntrigger:', TUniDBEdit( sender ).Hint ) = 0 ) and
               ( Pos( 'btntrigger-add:', TUniDBEdit( sender ).Hint ) = 0 ) then
            begin
               // o SUFIXO do campo lookup e do Button de pesquisa devem ser iguais
               //
               // Ex: edLkpCLIENTES e btnLkpCLIENTES
               if UniApplication.FindComponent('MainForm' ) <> nil then
               begin
                  cTableName := rc_GetHintAttr( 'tbl:' , TUniDBEdit( sender ).Hint , true, true);
                  if cTableName = '' then
                     cTableName := Copy( TUniDBEdit( sender ).Name, 6, 100 );

                  MainForm.rc_AddFormFrameInTab( nil, '', cTableName , '' , false, false );
               end;
            end
            else
            if ( Pos( 'btntrigger:', TUniDBEdit( sender ).Hint ) > 0 ) then
            begin
               cTemp := StringReplace( lowercase( TUniDBEdit( sender ).Name ) , 'edlkp' , 'btnlkp' , [rfReplaceAll] );
               oLkpBtn := TUniSpeedButton( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );
               if oLkpBtn <> nil then
               begin
                  oLkpBtn.Top := TUniDBEdit( sender ).Top;
                  oLkpBtn.Visible := true;
                  oLkpBtn.Click;
                  oLkpBtn.Visible := false;
               end;
               TUniDBEdit( sender ).Hint := stringReplace( TUniDBEdit( sender ).Hint, 'btntrigger:', '', [rfReplaceAll] );
            end
            else
            if ( Pos( 'btntrigger-add:', TUniDBEdit( sender ).Hint ) > 0 ) then
            begin
               cTemp := StringReplace( lowercase( TUniDBEdit( sender ).Name ) , 'edlkp' , 'btnlkpAdd' , [rfReplaceAll] );
               oLkpBtn := TUniSpeedButton( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );
               if oLkpBtn <> nil then
               begin
                  oLkpBtn.Top := TUniDBEdit( sender ).Top;
                  oLkpBtn.Visible := true;
                  oLkpBtn.Click;
                  oLkpBtn.Visible := false;
               end;
               TUniDBEdit( sender ).Hint := stringReplace( TUniDBEdit( sender ).Hint, 'btntrigger-add:', '', [rfReplaceAll] );
            end;
        end;
     end
     else
     if ( sender is TUniSpeedButton ) then
        if lowercase( Copy( TUniSpeedButton( sender ).Name, 1, 9 ) ) = 'btnlkpadd' then
        begin
            // 6.0.0.0
            if Pos( '-rc-btn-lkp-2:' , TUniSpeedButton( sender ).Hint ) > 0 then
            begin
              cTemp   := rc_GetHintAttr( '-rc-btn-lkp-2:', TUniSpeedButton( sender ).Hint );
              cTemp   := StringReplace( lowercase(cTemp) , 'edlkp' , '' , [rfReplaceAll] );
              LkpEDIT := TUniControl( TUniSpeedButton( sender ).owner.FindComponent( 'ed_lkp' ) );
            end
            else
            begin
              cTemp   := lowercase( TUniSpeedButton( sender ).Name );
              cTemp   := StringReplace( cTemp , 'btnlkpadd' , '' , [rfReplaceAll] );
              LkpEDIT := TUniControl( TUniDBEdit( sender ).owner.FindComponent( 'edlkp' + cTemp ) );
            end;
            // o SUFIXO do campo lookup e do Button de pesquisa devem ser iguais
            // Ex: edLkpCLIENTES e btnLkpCLIENTES
            cFrm := '';
            if LkpEDIT <> nil then
               if Pos( '+:', LkpEDIT.Hint ) > 0 then
               begin
                  cFrm := Copy( LkpEDIT.hint , Pos( '+:', LkpEDIT.Hint ) + 2, 200 ) + '|';
                  cFrm := Trim( StringReplace( cFrm, ']]', '', [rfReplaceAll] ) );
                  cFrm := Trim( Copy( cFrm , 1, Pos( '|', cFrm )-1 ) );
               end;

            if UniApplication.FindComponent('MainForm' ) <> nil then
            begin
               // 6.0.0.0
               cTableName := rc_GetHintAttr( 'tbl:' , LkpEDIT.Hint , true, true);
               if cTableName = '' then
                  if Pos( '-rc-btn-lkp-2:' , TUniSpeedButton( sender ).Hint ) > 0 then
                     cTableName := cTemp
                  else
                     cTableName := Copy( TUniSpeedButton( sender ).Name, 10, 100 );

               if Pos( '+modal', LkpEDIT.Hint ) > 0 then
               begin
                   // para usar MODAL centralizado, adicione o atributo [[modal:]] no seu formulário.
                   // o evento OnCreate é chamado antes de atribuir dinamicamente( usando bModal )
                   //Frm := dm_rc.rc_PrepareFrameAsModal( Self, TUniSpeedButton( sender ).Owner.Name + '__' + LkpEDIT.Name );
                   FrmC := TUniFormClass( FindAnyClass( 'TfrmModalFrameForm' ) );
                   Frm                 := FrmC.Create( uniSession.uniapplication );
                   Frm.Name            := Frm.Name + '__' + LkpEDIT.Name ;
                   mm.varC_FormSource_Search := frm.Name;
                   //8.0.0.0
                   iW := 0;
                   iH := 0;
                   if Pos( '+modal(', LkpEDIT.Hint ) > 0 then
                   begin
                      //cTemp := rc_CopyPos( LkpEDIT.Hint, '+modal(', ')' );
                      cTemp := Copy( LkpEDIT.Hint, Pos('+modal(', LkpEDIT.Hint ) + 7 );
                      cTemp := Copy( cTemp, 1, Pos( ')', cTemp )-1 );
                      iW    := StrToIntDef( Copy( cTemp, 1, Pos( 'x', cTemp ) - 1 ) , 0 );
                      iH    := StrToIntDef( Copy( cTemp, Pos( 'x', cTemp ) + 1 ) , 0);
                   end;

                   if rc_GetHintAttr( 'modal:', Frm.Hint ) = '' then
                   begin
                      Frm.Hint := rc_SetHintAttr( '' , 'modal:', Frm.Hint, True );
                      Frm.Hint := rc_SetHintAttr( cTableName + '_ADD' , 'rcdynaddfrmtbl:', Frm.Hint, True );
                      Frm.Hint := rc_SetHintAttr( cFrm                , 'rcdynaddfrm:', Frm.Hint, True );
                      //8.0.0.0
                      If iW > 0 then
                         Frm.Hint := rc_SetHintAttr( iW.ToString , 'width:', Frm.Hint, True );
                      If iH > 0 then
                         Frm.Hint := rc_SetHintAttr( iH.ToString , 'height:', Frm.Hint, True );

                   end;
                   Frm.ShowModal( procedure(Sender: TComponent; Result:Integer)
                                  begin
                                     // para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no
                                     // que estiver "abaixo" do MODAL
                                     mm.varC_Form_Modal := nil;
                                  end
                                );
               end
               else
                  MainForm.rc_AddFormFrameInTab( nil, '', cTableName + '_ADD', cFrm , false, false );
            end;
        end;
end;
//8.4.0.1 lookup str
procedure tdm_rc.DynamicOnExit(sender: TObject );
var
   cTemp, cLkpAttr, cPkType : string;
   LkpEDIT : TUniControl;
   LkpBtn : TUniSpeedButton;
   pDs : TDataSource;
   oHfRequired : TUniHTMLFrame;
   oLabel      : TUniLabel;
   pDM : TDataModule;
   bOnlySearch : boolean;
begin
     if ( sender is TUniDBEdit ) then
        if  Pos( '_codid' , lowercase( TUniDBEdit( sender ).Name ) ) > 0 then
        begin
           if rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

           // Associar o conteudo do campo ATUAL pra montar a query de FILTRO
           //8.4.0.1 lookup str
           //mm.varC_WhereExtra := ' [[pk]] = ' + TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ).FieldByName( TUniDBEdit( sender ).DataField ).AsString ;
           cPkType := rc_GetLookupPKDataType( TUniDBEdit( sender ).Name );
           if DataTypeStrIsNumber( cPkType ) then
              mm.varC_WhereExtra := ' [[pk]] = ' + ( TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ).FieldByName( TUniDBEdit( sender ).DataField ).AsString )
           else
           if DataTypeStrIsDateTime( cPkType ) then
              mm.varC_WhereExtra := ' [[pk]] = ' + QuotedStr( FormatDateTime( 'dd.mm.yyyy', StrToDateDef( TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ).FieldByName( TUniDBEdit( sender ).DataField ).AsString, 0 ) ) )
           else
           if DataTypeStrIsString( cPkType ) then
              mm.varC_WhereExtra := ' [[pk]] = ' + QuotedStr( TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ).FieldByName( TUniDBEdit( sender ).DataField ).AsString );

           // Quando o lookup precisar ser filtrado, informe aqui antes de chamar a função
           mm.varC_Where := '';
           mm.varC_Order := '';
           pDM := nil;
           // pode adicionar mais campos para serem pesquisados no lookup ou deixe em branco pra montar o padrão
           mm.varC_Search_Fields := '';

           cTemp   := StringReplace( lowercase( TUniDBEdit( sender ).Name ) , 'edlkp' , 'btnlkp' , [rfReplaceAll] );
           cTemp   := StringReplace( cTemp , '_codid' , '' , [rfReplaceAll] );
           LkpBtn  := TUniSpeedButton( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );

           cTemp   := lowercase( TUniDBEdit( sender ).Name );
           cTemp   := StringReplace( cTemp , '_codid' , '' , [rfReplaceAll] );
           LkpEDIT := TUniControl( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );
           // to clean "valid:" red borders
           // para limpar as bordas vermelhas do "valid:"
           if Pos( 'invalidate:true', LkpEDIT.Hint ) > 0 then
           begin
              rc_RemoveCssClass( LkpEDIT , 'rc-invalid' );
              if ( pos( 'true imsg:', LkpEDIT.hint ) > 0 ) then
              begin
                 oLabel := TUniLabel( TComponent(TUniDBEdit( sender ).owner).FindComponent('rcLabel__inv_lab_' + LkpEDIT.Name) );
                 if ( oLabel <> nil ) then
                 begin
                    oLabel.Visible := False;
                    LkpEDIT.Hint := rc_SetHintAttr( 'false' , 'invalidate:', LkpEDIT.Hint ); //v.
                 end;
              end;
              if ( pos( 'valid-required:', LkpEDIT.hint ) > 0 ) then
              begin
                 oHfRequired := TUniHTMLFrame( TComponent(TUniDBEdit( sender ).owner).FindComponent('rc__Required' + LkpEDIT.Name) );
                 if oHfRequired <> nil then
                 begin
                      oHfRequired.Visible := False;
                 end;
              end;
           end;
           cTemp := 'dsMaster';
           // 6.0.0.0
           cLkpAttr := rc_GetHintAttr( 'lkp:' , TUniControl( LkpEDIT ).Hint ) ;
           if Pos( ' ds:' , cLkpAttr ) > 0  then
           begin
              // 6.0.0.0
              cTemp := rc_GetHintAttr( 'ds:', cLkpAttr, true, false, true );
           end;

           If Pos( '.', cTemp ) > 0 then
           begin
               pDM := nil;
               pDM := rc_FindDataModule( Copy( cTemp, 1, pos( '.', cTemp ) - 1 ) );
               cTemp := Copy( cTemp, pos( '.', cTemp ) + 1 );
           end;
           if pDM <> nil then
              pDS  := TDataSource( pDM.FindComponent( cTemp ) )
           else
              pDS  := TDataSource( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );
           //8.1.0.1 clear "description" if pk = ''
           if ( pDs.State in [dsEdit, dsInsert] ) and ( TUniDBEdit( sender ).Text = '' ) then
           begin
              TUniEdit( LkpEDIT ).Clear;
           end;
           // 7.1.0.0 onlysearch
           bOnlySearch := Pos( 'searchonly', cLkpAttr ) > 0 ;
           if ( TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ).FieldByName( TUniDBEdit( sender ).DataField ).AsString <> '' ) and ( pDs <> nil ) or ( bOnlySearch ) then
              if ( bOnlySearch ) or ( pDs.State in [dsEdit, dsInsert] ) then
              begin
                // indica q é uma pesquisa DIGITADA
                // a diferença é que CASO o resultado seja apenas 1 registro, não será exibido o LOOKUP PADRAO
                //LkpBtn.Tag := 1;  onlysearch

                // acionar o click para montar o WHERE...
                LkpBtn.Click;

                if LkpEDIT <> nil then
                begin
                   LkpEDIT.SetFocus;
                end;
              end;
        end;
end;
// 6.0.0.0
procedure tdm_rc.DynamicOnExitLkpExtra(sender: TObject );
var
   cTemp, cLkpAttr, cContentSearch : string;
   LkpEDIT : TUniControl;
   LkpBtn : TUniSpeedButton;
   pDs : TDataSource;
   pDM : TDataModule;
   bOnlySearch : boolean;
   oHfRequired : TUniHTMLFrame;
   oLabel      : TUniLabel;
begin
     if ( sender is TUniDBEdit ) then
        if  Pos( '_pesqextra' , lowercase( TUniDBEdit( sender ).Name ) ) > 0 then
        begin
           if rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;
           // 6.0.0.0
           cContentSearch := Trim( TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ).FieldByName( TUniDBEdit( sender ).DataField ).AsString );
           //if  <> '' then
           begin
              // #SEQCONTAPADRAO=SEQNIVEL
              //   pesquisa extra para o campo SEQCONTAPADRAO da tabela de destino
              //   mas que equivale ao campo SEQNIVEL da tabela ORIGEM a ser pesquisada
              if DataTypeIsNumber( TUniDBEdit( sender ).Field.DataType ) then
                 mm.varC_WhereExtra := ' tab.' + TUniDBEdit( sender ).Hint + ' = ' + ( TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ).FieldByName( TUniDBEdit( sender ).DataField ).AsString )
              else
              if DataTypeIsDateTime( TUniDBEdit( sender ).Field.DataType ) then
                 mm.varC_WhereExtra := ' tab.' + TUniDBEdit( sender ).Hint + ' = ' + QuotedStr( FormatDateTime( 'dd.mm.yyyy', StrToDateDef( TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ).FieldByName( TUniDBEdit( sender ).DataField ).AsString, 0 ) ) )
              else
              if DataTypeIsString( TUniDBEdit( sender ).Field.DataType ) then
                 mm.varC_WhereExtra := ' tab.' + TUniDBEdit( sender ).Hint + ' = ' + QuotedStr( TFDQuery( TUniDBEdit( sender ).DataSource.DataSet ).FieldByName( TUniDBEdit( sender ).DataField ).AsString );

              // Quando o lookup precisar ser filtrado, informe aqui antes de
              // chamar a função
              mm.varC_Where := '';
              mm.varC_Order := '';
              pDM := nil;
              // pode adicionar mais campos para serem pesquisados no lookup ou
              // deixe em branco pra montar o padrão

              mm.varC_Search_Fields := TUniDBEdit( sender ).Hint + ';';

              cTemp := StringReplace( lowercase( TUniDBEdit( sender ).Name ) , 'edlkp' , 'btnlkp' , [rfReplaceAll] );
              cTemp := StringReplace( cTemp , '_pesqextra' , '' , [rfReplaceAll] );
              LkpBtn := TUniSpeedButton( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );

              cTemp   := lowercase( TUniDBEdit( sender ).Name );
              cTemp   := StringReplace( cTemp , '_pesqextra' , '' , [rfReplaceAll] );
              LkpEDIT := TUniControl( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );
              //8.1.0.1
              if cContentSearch <> '' then
              begin
                 // to clean "valid:" red borders
                 // para limpar as bordas vermelhas do "valid:"
                 if Pos( 'invalidate:true', LkpEDIT.Hint ) > 0 then
                 begin
                    rc_RemoveCssClass( LkpEDIT , 'rc-invalid' );
                    if ( pos( 'true imsg:', LkpEDIT.hint ) > 0 ) then
                    begin
                       oLabel := TUniLabel( TComponent(TUniDBEdit( sender ).owner).FindComponent('rcLabel__inv_lab_' + LkpEDIT.Name) );
                       if ( oLabel <> nil ) then
                       begin
                          oLabel.Visible := False;
                          LkpEDIT.Hint := rc_SetHintAttr( 'false' , 'invalidate:', LkpEDIT.Hint ); //v.
                       end;
                    end;
                    if ( pos( 'valid-required:', LkpEDIT.hint ) > 0 ) then
                    begin
                       oHfRequired := TUniHTMLFrame( TComponent(TUniDBEdit( sender ).owner).FindComponent('rc__Required' + LkpEDIT.Name) );
                       if oHfRequired <> nil then
                       begin
                            oHfRequired.Visible := False;
                       end;
                    end;
                 end;

                 cTemp := 'dsMaster';
                 // 6.0.0.0
                 cLkpAttr := rc_GetHintAttr( 'lkp:' , TUniControl( LkpEDIT ).Hint ) ;
                 if Pos( ' ds:' , cLkpAttr ) > 0  then
                 begin
                    // 6.0.0.0
                    cTemp := rc_GetHintAttr( 'ds:', cLkpAttr, true, false, true );
                 end;

                 If Pos( '.', cTemp ) > 0 then
                 begin
                     pDM := nil;
                     pDM := rc_FindDataModule( Copy( cTemp, 1, pos( '.', cTemp ) - 1 ) );
                     cTemp := Copy( cTemp, pos( '.', cTemp ) + 1 );
                 end;
                 if pDM <> nil then
                    pDS  := TDataSource( pDM.FindComponent( cTemp ) )
                 else
                    pDS  := TDataSource( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );
                 // 6.0.0.0 onlysearch
                 bOnlySearch := Pos( 'searchonly', cLkpAttr ) > 0 ;
                 if ( pDs <> nil ) or ( bOnlySearch ) then
                    if ( bOnlySearch ) or ( pDs.State in [dsEdit, dsInsert] ) then
                    begin
                      // indica q é uma pesquisa DIGITADA
                      // a diferença é que CASO o resultado seja apenas 1 registro, não será exibido o LOOKUP PADRAO
                      //LkpBtn.Tag := 1;  onlysearch

                      // acionar o click para montar o WHERE...
                      LkpBtn.Click;

                      if LkpEDIT <> nil then
                      begin
                         LkpEDIT.SetFocus;
                      end;
                    end;
              end;
           end;
        end;
end;
//chamada do lookup com FILTROS
// 6.0.0.0
procedure tdm_rc.rc_LookUpSearchFilter(Sender: TObject ; pWhere, pOrder, pSearchFields : string; pLookUpGridAttr : string );
var
   LkpDBEditFilter,
   LkpDBEditFilterCodID,
   LkpDBEdit : TUniDBEdit;
   cTemp, cLkpAttr : string;
   pDs : TDataSource;
   pDM : TDataModule;
   bOnlySearch : boolean;
   oHfRequired : TUniHTMLFrame;
   oLabel      : TUniLabel;
begin
     if ( sender is TUniSpeedButton ) then
     begin
        if lowercase( Copy( TUniSpeedButton( sender ).Name, 1, 6 ) ) = 'btnlkp' then
        begin
             if rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

             if ( pWhere <> '' ) and ( Pos( 'where' , lowercase( pWhere ) ) = 0 ) then
                pWhere := ' WHERE ' + pWhere;

             cTemp := StringReplace( lowercase( TUniSpeedButton( sender ).Name ) , 'btnlkp' , 'edlkp' , [rfReplaceAll] );
             LkpDBEdit := TUniDBEdit( TUniSpeedButton( sender ).owner.FindComponent( cTemp ) );

             // to clean "valid:" red borders
             // para limpar as bordas vermelhas do "valid:"
             if Pos( 'invalidate:true', LkpDBEdit.Hint ) > 0 then
             begin
                rc_RemoveCssClass( LkpDBEdit , 'rc-invalid' );
                if ( pos( 'true imsg:', LkpDBEdit.hint ) > 0 ) then
                begin
                   oLabel := TUniLabel( TComponent(TUniSpeedButton( sender ).owner).FindComponent('rcLabel__inv_lab_' + LkpDBEdit.Name) );
                   if ( oLabel <> nil ) then
                   begin
                      oLabel.Visible := False;
                      LkpDBEdit.Hint := rc_SetHintAttr( 'false' , 'invalidate:', LkpDBEdit.Hint ); //v.
                   end;
                end;
                if ( pos( 'valid-required:', LkpDBEdit.hint ) > 0 ) then
                begin
                   oHfRequired := TUniHTMLFrame( TComponent(TUniSpeedButton( sender ).owner).FindComponent('rc__Required' + LkpDBEdit.Name) );
                   if oHfRequired <> nil then
                   begin
                        oHfRequired.Visible := False;
                   end;
                end;
             end;

             if ( pSearchFields <> '' ) and ( Copy( ReverseString( pSearchFields ), 1, 1 ) <> ';' ) then
                pSearchFields := pSearchFields + ';';
             pDM := nil;
             mm.varC_Where := pWhere;
             mm.varC_Order := pOrder;

             mm.varC_Search_Fields := pSearchFields;
             cTemp := 'dsMaster';
             // 6.0.0.0
             cLkpAttr := rc_GetHintAttr( 'lkp:' , LkpDBEdit.Hint ) ;
             if Pos( ' ds:' , cLkpAttr ) > 0  then
             begin
                // 6.0.0.0
                cTemp := rc_GetHintAttr( 'ds:', cLkpAttr, true, false, true );
             end;

             If Pos( '.', cTemp ) > 0 then
             begin
                 pDM := nil;
                 pDM := rc_FindDataModule( Copy( cTemp, 1, pos( '.', cTemp ) - 1 ) );
                 cTemp := Copy( cTemp, pos( '.', cTemp ) + 1 );
             end;
             if pDM <> nil then
                pDS  := TDataSource( pDM.FindComponent( cTemp ) )
             else
                pDS  := TDataSource( LkpDBEdit.owner.FindComponent( cTemp ) );
             // 6.0.0.0 onlysearch
             bOnlySearch := Pos( 'searchonly', cLkpAttr ) > 0 ;
             if ( pDs <> nil ) or ( bOnlySearch ) then
                if ( bOnlySearch ) or ( pDs.State in [dsEdit, dsInsert] ) then
                begin
                    // onlysearch
                    if TUniSpeedButton( sender ).tag = 0 then
                       rc_LookUpSearch( TUniSpeedButton( sender ).owner, TUniSpeedButton( sender ).Name , Sender, pLookUpGridAttr)
                    else
                    begin
                       TUniSpeedButton( sender ).tag :=0;
                       rc_LookUpSearchLite( TUniSpeedButton( sender ).owner, TUniSpeedButton( sender ).Name , Sender, pLookUpGridAttr );
                       TUniSpeedButton( sender ).tag := 1;
                    end;
                end;
             //7.3.0.0 thanks for bugtracker FABIO OLIVEIRA
             //mm.varC_Where := '';
             //mm.varC_Order := '';
             //18/06/2024 - adicionado no if o (not... antes era apenas a limpeza das variáveis mas isso fazia com que os filtros fossem ignorados .
             //07/08/2024 - adicionado no if o (not bOnlySearch) pois estava ignorando o where nos LookUps de filtro OnlySearch.
             //7.3.0.2
             if (pDs <> nil) and (not ( pDs.State in [dsEdit, dsInsert] )) and (not bOnlySearch) then
             begin
               mm.varC_Where := '';
               mm.varC_Order := '';
             end;
        end;
     end;
end;

procedure tdm_rc.rc_GridColumnLock(pGrid: TUniDBGrid; pColumn: Integer);
begin
   if not pGrid.Columns[ pColumn ].Locked then
   begin
      pGrid.Columns[ pColumn ].Locked  := True;
   end;
end;
//8.0.0.0
//procedure tdm_rc.rc_AddFieldsEditor(pDataSet: TDataSet; pFieldName : string; pFieldLabel : string; pSize : integer );
(*
    with uniDBGrid1 do
    begin
      Columns.Clear;
      with Columns.Add do
      begin
        FieldName := 'ID_NCM';
        Title.Caption := 'NCM';
        Width := 100;
        Alignment := taRightJustify;
      end;

      with Columns.Add do
      begin
        FieldName := 'ANTECIPADO_ESPECIAL';
        Title.Caption := 'Ant. Especial';
        Width := 120;
        Alignment := taCenter;
      end;
    end;
*)
procedure tdm_rc.rc_AddFieldsEditor(pDataSet: TDataSet );
var
  oField: TField;
  oDataSet : TDataSet;
  i, Size : Integer;
begin
  try
     oDataSet := pDataSet ;
     for i := 0 to pDataSet.FieldCount - 1 do
     begin
       oField := TStringField.Create(pDataSet);
       //oField.DataSet      := pDataSet;
       //oField.FieldName    := pDataSet.Fields[ i ].Name;// pFieldName;
       oField.FieldName    := pDataSet.Fields[ i ].FieldName;// pFieldName;
       oField.DisplayLabel := pDataSet.Fields[ i ].FieldName;//pFieldLabel;
       Size := pDataSet.Fields[ i ].Size;
       if pDataSet.Fields[ i ].Size > Length( pDataSet.Fields[ i ].FieldName ) then
          Size := pDataSet.Fields[ i ].Size
       else
          Size := Length( pDataSet.Fields[ i ].Name );
       oField.Size         := Size;
       oField.OnGetText    := rc_GridFieldGetText;
     end;
  except on e:exception do
    begin
       raise Exception.Create('rc_AddFieldsEditor Error: ' + e.Message);
    end;
  end;
end;
// future implementation
procedure tdm_rc.rc_GridFieldGetText(Sender: TField; var Text: string; DisplayText: Boolean);

var
  idecimalprecision : integer;
begin
  idecimalprecision := 2;
  if Sender.AsVariant = Null then
     Exit;

   Text := Sender.AsString;

   //if Sender.FieldName = 'CNPJ_CPF' then
   if ( pos( 'CEP', uppercase( Sender.FieldName ) ) > 0 ) then
   begin
        Text := FormatMaskText('00\.000\-00;0;', Sender.AsString);
   end
   else
   if ( pos( 'CPF', uppercase( Sender.FieldName ) ) > 0 ) or
      ( pos( 'CNPJ', uppercase( Sender.FieldName ) ) > 0 ) then
   begin
      case Length(Sender.AsString) of
        11: Text := FormatMaskText('000\.000\.000\-00;0;', Sender.AsString);
        14: Text := FormatMaskText('00\.000\.000\/0000\-00;0;', Sender.AsString);
      end;
   end
   else
   if ( pos( 'FONE', uppercase( Sender.FieldName ) ) > 0 ) then
   begin
      case Length(Sender.AsString) of
         8: Text := FormatMaskText('0000\-0009;0;', Sender.AsString);
         9: Text := FormatMaskText('00000\-0009;0;', Sender.AsString);
        10: Text := FormatMaskText('(00)0000\-0009;0;', Sender.AsString);
        11: Text := FormatMaskText('(00)00000\-0009;0;', Sender.AsString);
      end;
   end
   else
   if ( pos( 'SITE', uppercase( Sender.FieldName ) ) > 0 ) or
      ( pos( 'EMAIL', uppercase( Sender.FieldName ) ) > 0 ) then
   begin
      mm.varC_ContentField := LowerCase( mm.varC_ContentField );

      TStringField( Sender ).Alignment := taLeftJustify;

      Text := mm.varC_ContentField ;
   end
   else
   //7.0.0.0
   if DataTypeIsFloat( Sender.DataType ) then
//   if ( ( Sender.DataType  = ftFloat )   or
//        ( Sender.DataType  = ftBCD )     or
//        ( Sender.DataType  = ftSingle )  or
//        ( Sender.DataType  = ftFMTBcd )  or
//        ( Sender.DataType  = ftCurrency ) ) then
   begin
        //valores negativos: vermelhor e negrito
//        if Column.Field.AsExtended < 0 then
//        begin
//           Attribs.Font.Color  := clMaroon;
//           Attribs.Font.Style := [fsBold];
//        end
//        else
//        begin
//           Attribs.Font.Color  := $00dc3545;
//           Attribs.Font.Style := [];
//        end;

        if Sender.Size > 0 then
        begin
           if idecimalprecision = 0 then
              idecimalprecision := Sender.Size ;

           if ( pos( 'GEO_', uppercase( Sender.FieldName ) ) > 0 ) then
              mm.varC_ContentField := FloatToStrF( Sender.AsExtended, ffNumber, 11, 8 ) + '  '
           else
              mm.varC_ContentField := FloatToStrF( Sender.AsExtended, ffNumber, 15, idecimalprecision ) + '  ';

           TNumericField( Sender ).DisplayFormat := mm.varC_Mask_float;
        end
        else
           mm.varC_ContentField := FloatToStrF( Sender.AsExtended, ffNumber, 15, 0 ) + '  ';
   end;
end;
//7.0.0.0 grid-menu:off
procedure tdm_rc.rc_GridMenuOff(pGrid: TUniDBGrid);
var
   i : integer;
begin
   for I := 0 to pGrid.Columns.Count-1 do
   begin
       pGrid.Columns[I].Menu.MenuEnabled := False;
   end;

   TExUniCustomDBGrid(pGrid).DoConfigureJSColumns(pGrid.DataSource.DataSet);
end;

procedure tdm_rc.rc_GridPaginatorGoPageKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  pPage : TUniEdit;
begin
     if key = 13 then
     begin
          pPage := TUniEdit( TUniDBGrid( sender ).Owner.FindComponent('edPageNumber_' + TUniDBGrid( sender ).Name) ) ;
          pPage.Tag := 10;
          rc_GridPaginatorGoPage( TUniDBGrid( sender ), pPage, TUniLabel( TUniDBGrid( sender ).Owner.FindComponent('labPageCurrPage_' + TUniDBGrid( sender ).Name) ) );
     end;
end;

procedure tdm_rc.rc_GridPaginatorGoPage(pGrid: TUniDBGrid; pPage : TUniEdit; pTotPages : TUniLabel; bInit : Boolean = false );
var
   iTotalPages,
   iGoPage,
   iCurrPage : integer;
begin
  inherited;

  //if Key = 13 then
  begin
     iCurrPage := pGrid.DataSource.DataSet.RecNo div pGrid.WebOptions.PageSize + 1;
     iTotalPages := ( pGrid.DataSource.DataSet.RecordCount - 1 ) div pGrid.WebOptions.PageSize + 1;

     iGoPage := StrToIntDef( pPage.Text, 1 );

     if ( iGoPage > 0 ) and ( iGoPage <= iTotalPages ) then
        iCurrPage := iGoPage;

     pPage.Text := iCurrPage.ToString;
     pTotPages.Caption :=  ' - ' + iTotalPages.ToString  ;

     if ( pPage.Tag = 1 ) or ( pPage.Tag = 10 ) then
     begin
        UniSession.AddJS( pGrid.JSName+'.store.loadPage(' + iCurrPage.ToString + ');');
     end
     else
     begin
        pPage.Tag := 1;
     end;
  end;
end;
//8.4.0.0
procedure tdm_rc.rc_GridPaginatorUpdateControls( pGrid : TUniDBGrid; iPageNumber, iCurrPage : integer );
var
  oLabel : TUniLabel;
  cLabel : string;
  iTotalPages : integer;
begin
  if ( Pos( 'no-paged|', pGrid.Hint ) = 0 ) then
  begin
    if iPageNumber = -1 then
       iPageNumber := StrToIntDef( TUniEdit( pGrid.Owner.FindComponent( 'edPageNumber_' + pGrid.Name ) ).Text, 0 ) ;
    if iCurrPage = -1 then
    begin
       //iCurrPage   := StrToIntDef( TUniLabel( pGrid.Owner.FindComponent( 'labPageCurrPage_' + pGrid.Name ) ).Caption, 0 ) ;
       iTotalPages := ( pGrid.DataSource.DataSet.RecordCount - 1 ) div pGrid.WebOptions.PageSize + 1;
       iCurrPage   := iTotalPages;//StrToIntDef( TUniLabel( pGrid.Owner.FindComponent( 'labPageCurrPage_' + pGrid.Name ) ).Text, 0 ) ;
    end;

    //first
    cLabel := 'labPageFirst_' + pGrid.Name;
    oLabel := TUniLabel( pGrid.Owner.FindComponent( cLabel ) );
    oLabel.Enabled := iPageNumber > 1;//False;
    oLabel.Font.Color := varIIF( oLabel.Enabled, clBlack, clSilver );
    //prior
    cLabel := StringReplace( cLabel, 'labPageFirst_' , 'labPagePrior_', [rfReplaceAll] );
    oLabel := TUniLabel( pGrid.Owner.FindComponent( cLabel ) );
    oLabel.Enabled := iPageNumber > 1;//False;
    cLabel := oLabel.Name;
    oLabel.Font.Color := varIIF( oLabel.Enabled, clBlack, clSilver );
    //next
    cLabel := StringReplace( cLabel, 'labPagePrior_' , 'labPageNext_', [rfReplaceAll] );
    oLabel := TUniLabel( pGrid.Owner.FindComponent( cLabel ) );
    oLabel.Enabled := iPageNumber < iCurrPage;//True;
    cLabel := oLabel.Name;
    oLabel.Font.Color := varIIF( oLabel.Enabled, clBlack, clSilver );
    //last
    cLabel := StringReplace( cLabel, 'labPageNext_' , 'labPageLast_', [rfReplaceAll] );
    oLabel := TUniLabel( pGrid.Owner.FindComponent( cLabel ) );
    oLabel.Enabled := iPageNumber < iCurrPage;//True;
    cLabel := oLabel.Name;
    oLabel.Font.Color := varIIF( oLabel.Enabled, clBlack, clSilver );
  end;
end;
//8.4.0.0
procedure tdm_rc.rc_GridPaginatorUpdatePages( pGrid : TUniDBGrid; pPageNumber : integer );
var
   iTotalPages,
   iCurrPage : integer;
   oLabel : TUnilabel;
   pPage : TUniEdit;
begin
  inherited;
  if ( Pos( 'no-paged|', pGrid.Hint ) = 0 ) then
  begin
     iTotalPages := ( pGrid.DataSource.DataSet.RecordCount - 1 ) div pGrid.WebOptions.PageSize + 1;
     iCurrPage   := pPageNumber;//1;
     if ( TUniEdit( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Tag = 0 ) or
        ( TUniEdit( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Tag = 2 ) then
     begin
        TUniLabel( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Caption :=
                                   ' - ' +
                                   iTotalPages.ToString  ;

        pPage := TUniEdit( pGrid.Owner.FindComponent('edPageNumber_' + pGrid.Name ) );
        if pPage.Tag = 10 then
        begin
           iCurrPage := StrToIntDef( pPage.Text, 1 );
           pPage.Tag := 0;
        end;
        pPage.Text := iCurrPage.ToString;
        if ( Pos( 'firstshow:', pGrid.Hint ) > 0 ) and ( TUniEdit( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Tag = 0 ) then
           TUniEdit( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Tag  := 2
        else
           TUniEdit( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Tag  := 1;

        rc_GridPaginatorUpdateControls( pGrid, iCurrPage, iTotalPages );
     end;
     TUniEdit( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Tag  := 0;
  end;
end;
//8.4.0.0
procedure tdm_rc.rc_GridPaginatorLast(pGrid: TUniDBGrid);
var
   iTotalPages,
   iCurrPage : integer;
begin
  inherited;
  if ( Pos( 'no-paged|', pGrid.Hint ) = 0 ) then
  begin
     iTotalPages := ( pGrid.DataSource.DataSet.RecordCount - 1 ) div pGrid.WebOptions.PageSize + 1;
     iCurrPage   := iTotalPages;

     TUniLabel( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Caption :=
                                ' - ' +
                                iTotalPages.ToString  ;
     TUniEdit( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Tag  := 1;
     TUniEdit( pGrid.Owner.FindComponent('edPageNumber_' + pGrid.Name ) ).Text := iCurrPage.ToString;
     UniSession.AddJS( pGrid.JSName+'.store.loadPage(' + iCurrPage.ToString + ');');
     rc_GridPaginatorUpdateControls( pGrid, iCurrPage, iTotalPages );
  end;
end;
//8.4.0.0
procedure tdm_rc.rc_GridPaginatorNext(pGrid: TUniDBGrid ; pJustUpdate : boolean );
var
   iTotalPages,
   iCurrPage : integer;
begin
  inherited;
  if ( Pos( 'no-paged|', pGrid.Hint ) = 0 ) then
  begin
     iCurrPage := pGrid.DataSource.DataSet.RecNo div pGrid.WebOptions.PageSize + 1;
     iTotalPages := ( pGrid.DataSource.DataSet.RecordCount - 1 ) div pGrid.WebOptions.PageSize + 1;
     if not pJustUpdate then
     begin
        if iCurrPage < iTotalPages then
           Inc( iCurrPage )
        else
            iCurrPage := iTotalPages;
     end;
     TUniEdit( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Tag  := 1;
     TUniEdit( pGrid.Owner.FindComponent('edPageNumber_' + pGrid.Name) ).Text := iCurrPage.ToString;
     TUniLabel( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name) ).Caption :=
                                ' - ' +
                                iTotalPages.ToString  ;
     if not pJustUpdate then
        UniSession.AddJS( pGrid.JSName+'.store.loadPage(' + iCurrPage.ToString + ');');
     rc_GridPaginatorUpdateControls( pGrid, iCurrPage, iTotalPages );
  end;
end;
//8.4.0.0
procedure tdm_rc.rc_GridPaginatorFirst(pGrid: TUniDBGrid);
var
   iCurrPage, iTotalPages : integer;
begin
  inherited;
  if ( Pos( 'no-paged|', pGrid.Hint ) = 0 ) then
  begin
     iCurrPage := 1;

     TUniLabel( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name) ).Caption :=
                                ' - ' +
                                IntToStr( ( pGrid.DataSource.DataSet.RecordCount - 1 ) div pGrid.WebOptions.PageSize + 1 )  ;
     iTotalPages := ( pGrid.DataSource.DataSet.RecordCount - 1 ) div pGrid.WebOptions.PageSize + 1 ;
     TUniEdit( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Tag  := 1;
     TUniEdit( pGrid.Owner.FindComponent('edPageNumber_' + pGrid.Name) ).Text := iCurrPage.ToString;
     UniSession.AddJS( pGrid.JSName+'.store.loadPage(' + iCurrPage.ToString + ');');
     rc_GridPaginatorUpdateControls( pGrid, iCurrPage, iTotalPages );
  end;
end;
//8.4.0.0
procedure tdm_rc.rc_GridPaginatorPrior(pGrid: TUniDBGrid);
var
   iCurrPage, iTotalPages : integer;
begin
  inherited;
  if ( Pos( 'no-paged|', pGrid.Hint ) = 0 ) then
  begin
     iCurrPage := pGrid.DataSource.DataSet.RecNo div pGrid.WebOptions.PageSize + 1;
     if iCurrPage > 1 then
        Dec( iCurrPage );

     TUniEdit( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name ) ).Tag  := 1;
     TUniEdit( pGrid.Owner.FindComponent('edPageNumber_' + pGrid.Name) ).Text := iCurrPage.ToString;
     TUniLabel( pGrid.Owner.FindComponent('labPageCurrPage_' + pGrid.Name) ).Caption :=
                                ' - ' +
                                IntToStr( ( pGrid.DataSource.DataSet.RecordCount - 1 ) div pGrid.WebOptions.PageSize + 1 )  ;
     iTotalPages := ( pGrid.DataSource.DataSet.RecordCount - 1 ) div pGrid.WebOptions.PageSize + 1 ;
     UniSession.AddJS( pGrid.JSName+'.store.loadPage(' + iCurrPage.ToString + ');');
     rc_GridPaginatorUpdateControls( pGrid, iCurrPage, iTotalPages );
  end;
end;

procedure tdm_rc.rc_GridPaginatorRefresh(pGrid: TUniDBGrid);
begin
  if not ( pGrid.DataSource.State in [dsEdit, dsInsert ] ) then
  begin
     pGrid.DataSource.DataSet.Close;
     pGrid.DataSource.DataSet.Open;
  end;
end;
// 6.0.0.0
procedure tdm_rc.DynamicGridPaginatorFirst(Sender: TObject);
var
   cGrid : string;
   oGrid : TUniDBGrid;
   oLabel : TUniLabel;
   cLabel : string;
begin
     cGrid := Copy( TUniControl( sender ).Name , Pos( '_', TUniControl( sender ).Name ) + 1 );
     oGrid := TUniDBGrid( TUniControl( sender ).Owner.FindComponent( cGrid ) );
     if oGrid <> nil then
       If not dm_rc.rc_DataSetDatasourceIsNil( oGrid ) then
          rc_GridPaginatorFirst( oGrid );
end;
//7.0.0.0
procedure tdm_rc.DynamicGridPaginatorOnRecCount(Sender: TUniDBGrid; var RecCount: Integer);
var
   iPageNumber, iCurrPage : integer;
begin
  iPageNumber := StrToIntDef( TUniEdit( sender.Owner.FindComponent( 'edPageNumber_' + sender.Name ) ).Text, 0 ) ;
  iCurrPage   := StrToIntDef( TUniLabel( sender.Owner.FindComponent( 'labPageCurrPage_' + sender.Name ) ).Caption, 0 ) ;
  If iPageNumber <= 0 then
     iPageNumber := 1;
  dm_rc.rc_GridPaginatorUpdatePages( sender, iPageNumber );
  inherited;
end;

procedure tdm_rc.DynamicGridPaginatorOnStateChange(Sender: TObject);
begin
  if TDataSource( sender ).State in [ dsInsert, dsEdit, dsBrowse ] then
  begin
     rc_DSReactiveCheck( TDataSource( sender ).Owner , TDataSource( sender ) );
  end;
end;
// 6.0.0.0
procedure tdm_rc.DynamicGridPaginatorGoPageDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
   cGrid : string;
   oGrid : TUniDBGrid;
begin
     if Key = 13 then
     begin
        cGrid := Copy( TUniControl( sender ).Name , Pos( '_', TUniControl( sender ).Name ) + 1 );
        oGrid := TUniDBGrid( TUniControl( sender ).Owner.FindComponent( cGrid ) );
        if oGrid <> nil then
          If not dm_rc.rc_DataSetDatasourceIsNil( oGrid ) then
             rc_GridPaginatorGoPageKeyDown( oGrid, Key, Shift );
     end;
end;
// 6.0.0.0
procedure tdm_rc.DynamicGridPaginatorLast(Sender: TObject);
var
   cGrid : string;
   oGrid : TUniDBGrid;
begin
     cGrid := Copy( TUniControl( sender ).Name , Pos( '_', TUniControl( sender ).Name ) + 1 );
     oGrid := TUniDBGrid( TUniControl( sender ).Owner.FindComponent( cGrid ) );
     if oGrid <> nil then
       If not dm_rc.rc_DataSetDatasourceIsNil( oGrid ) then
          rc_GridPaginatorLast( oGrid );
end;
// 6.0.0.0
procedure tdm_rc.DynamicGridPaginatorNext(Sender: TObject);
var
   cGrid : string;
   oGrid : TUniDBGrid;
begin
     cGrid := Copy( TUniControl( sender ).Name , Pos( '_', TUniControl( sender ).Name ) + 1 );
     oGrid := TUniDBGrid( TUniControl( sender ).Owner.FindComponent( cGrid ) );
     if oGrid <> nil then
       If not dm_rc.rc_DataSetDatasourceIsNil( oGrid ) then
          rc_GridPaginatorNext( oGrid );
end;
// 6.0.0.0
procedure tdm_rc.DynamicGridPaginatorPrior(Sender: TObject);
var
   cGrid : string;
   oGrid : TUniDBGrid;
begin
     cGrid := Copy( TUniControl( sender ).Name , Pos( '_', TUniControl( sender ).Name ) + 1 );
     oGrid := TUniDBGrid( TUniControl( sender ).Owner.FindComponent( cGrid ) );
     if oGrid <> nil then
       If not dm_rc.rc_DataSetDatasourceIsNil( oGrid ) then
          rc_GridPaginatorPrior( oGrid );
end;
// 6.0.0.0
procedure tdm_rc.DynamicGridPaginatorRefresh(Sender: TObject);
var
   cGrid : string;
   oGrid : TUniDBGrid;
begin
     cGrid := Copy( TUniControl( sender ).Name , Pos( '_', TUniControl( sender ).Name ) + 1 );
     oGrid := TUniDBGrid( TUniControl( sender ).Owner.FindComponent( cGrid ) );
     if oGrid <> nil then
       If not dm_rc.rc_DataSetDatasourceIsNil( oGrid ) then
          rc_GridPaginatorRefresh( oGrid );
end;
// 6.0.0.0
procedure tdm_rc.DynamicGridPaginatorSearch(Sender: TObject);
var
   cGrid : string;
   oGrid : TUniDBGrid;
begin
     cGrid := Copy( TUniControl( sender ).Name , Pos( '_', TUniControl( sender ).Name ) + 1 );
     oGrid := TUniDBGrid( TUniControl( sender ).Owner.FindComponent( cGrid ) );
     if oGrid <> nil then
       If not dm_rc.rc_DataSetDatasourceIsNil( oGrid ) then
          rc_GridPaginatorSearch( oGrid );
end;

procedure tdm_rc.rc_GridPaginatorSearch(pGrid: TUniDBGrid);
begin
  {//6.0.0.0}//if dm_rc.rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

//  if not ( pGrid.DataSource.State in [dsEdit, dsInsert ] ) then
//  begin
//
//     tabSearch.Visible := ( btnNewReg.Enabled) and ( not bModelCrud1 );
//     pgBaseCadControl.ActivePage := tabSearch;
//
//     if mm.varB_Mobile_Screen_Portrait then
//        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, pGrid.Width, 0 )
//     else
//        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, 266, 0 );
//
//     if paSearchFilters.Width > 0 then
//        if ( StrToIntDef( ed_CodMaster.Hint, 0 ) > 0 ) then
//        begin
//            btnSearchCRUDClick( btnSearchCRUD );
//        end;
//  end;
end;
//8.4.0.0 align col
procedure tdm_rc.rc_GridDrawCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
var
   grid: TUniDBGrid;
   iWidthActionsPercent : double;// 6.0.0.0
   iWidthActions,// 6.0.0.0
   iNumCols,
   iPos, iPos2,
   iTag, iBigger,
   iLength, iAlign : integer;

   bShowPk, //8.0.0.0
   bTitleCol,
   bChanged,
   bRender,
   bResize,
   bSameTable : boolean;

   c, i, f,
   idecimalprecision,
   isize,
   ititleset,
   ilocked,
   iDisplayMemo,
   iCheckBox,
   idisplaywidth,
   ivisible : integer;

   cCheckBoxValues,
   cCheckBoxDisplayValues,
   ccolcolor,
   ctable,
   ccolumn,
   ccharcase,
   cfield,
   ctitle,
   cmask,
   calign,
   ctitlealign,
   cvisible,
   ccss,
   cpill,

   cTemp, cTemp2, cTemp3,
   cTrueValue, cFalseValue,
   cOperator, cValue,
   cStr1, cStr2 : string;
   //6.0.0.0
   vFieldCss : string;
   bCssAll : boolean;
begin

  inherited;

    idisplaywidth     := 0;
    idecimalprecision := 2;
    ilocked           := 0;
    ititleset         := 0;
    iTag              := 0;

    iCheckBox         := 0;
    cCheckBoxValues   := '';
    cCheckBoxDisplayValues := '';
    iDisplayMemo      := 0;
    bShowPk           := false;//8.0.0.0

    UniSession.SuspendLayouts;
    try
       //render rc_Draw ?
       bRender := false;
       bResize := ( Pos( 'grid-resize' , TUniDBGrid(Sender).Hint ) > 0 ) or
                  ( Pos( 'grid-fm-rs!' , TUniDBGrid(Sender).Hint ) > 0 );

       if ( Pos( 'fieldmasks:' , TUniDBGrid(Sender).Hint ) > 0 ) and
          ( ( Pos( 'grid-fm-ok!' , TUniDBGrid(Sender).Hint ) = 0 ) and ( Pos( 'grid-fm-rs!' , TUniDBGrid(Sender).Hint ) = 0 ) ) then
       begin
            if ( Pos( 'fieldmasks:' , TUniDBGrid(Sender).Hint ) > 0 ) and ( Pos( 'fieldmasks:table-' , TUniDBGrid(Sender).Hint ) = 0 ) then
            begin
                 iPos := Pos( 'fieldmasks:' , TUniDBGrid(Sender).Hint ) + 11;
                 cTemp := TUniDBGrid(Sender).Hint;

                 Insert( 'table-' + lowercase( TUniDBGrid(Sender).Name ) + ';', cTemp , iPos );
                 TUniDBGrid(Sender).Hint := cTemp;
            end;

            mm.varC_FieldMasks := rc_NormalizeHintAttr( TUniDBGrid(Sender).Hint + ']]' );

            if ( Pos( 'fieldmasks:table-' , TUniDBGrid(Sender).Hint ) > 0 ) and ( Pos( 'fieldmasks:table-;' , TUniDBGrid(Sender).Hint ) = 0 ) then
            begin
               mm.varC_Table_Search := Copy( TUniDBGrid(Sender).Hint, Pos( 'fieldmasks:table-' , TUniDBGrid(Sender).Hint ) + 17, 2000 );
               mm.varC_Table_Search := Copy( mm.varC_Table_Search , 1, Pos( ';' , mm.varC_Table_Search ) - 1 );
            end;

            mm.varC_FieldMasks := Trim( StringReplace( mm.varC_FieldMasks, 'fieldmasks:' , '', [rfReplaceAll] ) );
            mm.varC_FieldMasks := StringReplace( mm.varC_FieldMasks, '  ;', ';', [rfReplaceAll] );
            mm.varC_FieldMasks := StringReplace( mm.varC_FieldMasks, ' ;', ';', [rfReplaceAll] );
            mm.varC_FieldMasks := StringReplace( mm.varC_FieldMasks, ';  ', ';', [rfReplaceAll] );
            mm.varC_FieldMasks := StringReplace( mm.varC_FieldMasks, '; ', ';', [rfReplaceAll] );

            if ( Pos( '|', Copy( mm.varC_FieldMasks, 1, Pos( '[[', mm.varC_FieldMasks ) ) ) > 0 ) then
            repeat
               mm.varC_FieldMasks := ';' + Copy( mm.varC_FieldMasks, Pos( '|', mm.varC_FieldMasks ) + 1 );
            until ( Pos( '|', Copy( mm.varC_FieldMasks, 1, Pos( '[[', mm.varC_FieldMasks ) ) ) = 0 );

            //8.4.0.0 align col
            mm.varC_FieldMasks := StringReplace( mm.varC_FieldMasks, 'width:', 'width-col:', [rfReplaceAll] );
            mm.varC_FieldMasks := StringReplace( mm.varC_FieldMasks, 'title:', 'title-name:', [rfReplaceAll] );//8.4.0.0 align col
            mm.varC_FieldMasks := StringReplace( mm.varC_FieldMasks, 'titlealign:', 'align-title:', [rfReplaceAll] );//8.4.0.0 align col
            mm.varC_FieldMasks := StringReplace( mm.varC_FieldMasks, 'align:', 'col-align:', [rfReplaceAll] );//8.4.0.0 align col

            // para processar apenas uma vez o fieldmasks de cada grid
            if bResize then
            begin
               TUniDBGrid(Sender).Hint := 'grid-fm-rs!' + mm.varC_FieldMasks;
            end
            else
               TUniDBGrid(Sender).Hint := 'grid-fm-ok!' + mm.varC_FieldMasks;

            bRender := True;
       end
       else
       if ( Pos( 'grid-fm-ok!' , TUniDBGrid(Sender).Hint ) > 0 ) or ( Pos( 'grid-fm-rs!' , TUniDBGrid(Sender).Hint ) > 0 ) then
       begin
           mm.varC_FieldMasks := Copy( TUniDBGrid(Sender).Hint, 12, 2000 ) ;

           bRender := True;
       end;

       iBigger := 0;

       if ( lowercase( Column.Title.Caption ) = 'codigo' ) and ( Pos( 'dbgSearchCRUDLookUp', TUniDBGrid( sender ).name ) > 0 ) then
          iBigger := 0;
       //verficar se pode EXIBIR todas as colunas
       //8.2.0.0
       if ( Column.Visible ) and ( Column.Field <> nil ) then
       begin
          //verficar se pode EXIBIR todas as colunas
          Column.Visible := ( not AnsiMatchStr( ansilowercase( Column.FieldName ) , ARRAY_DO_NOT_SHOW_DBGRID ) ) ;

          // se nao usou ALLPKs, entao EXIBE todas as colunas / esconder a coluna PK
          //8.2.0.0
          if ( Column.Visible ) then //and ( Pos( '|allpks' , TUniDBGrid(Sender).Hint ) = 0 ) then
          begin
             bShowPk := Pos( '|showpk' , TUniDBGrid(Sender).Hint ) > 0;
             if ( Pos( '|showpk' , TUniDBGrid(Sender).Hint ) = 0 ) then
                Column.Visible := not memGridPK.Locate( 'field' , lowercase( Column.Title.Caption ) , [] );//7.5.0.3 lowercase

             TStringField( Column.Field ).Visible := Column.Visible ;
          end;
       end;
       //8.2.0.0 lookup thanks BugTracker Fabio Oliveira
       If ( bRender ) and ( ( Column.Visible ) or ( Pos( ';' + ansilowercase( Column.FieldName ) + '[[' , ansilowercase( mm.varC_FieldMasks ) ) > 0 ) ) then
       begin
           Column.Sortable := True;

           if ( trim( mm.varC_Table_Search ) <> '' ) and ( Column <> nil ) then
           begin
                 ccolcolor     := '';
                 cmask         := '';
                 idecimalprecision := 0;
                 cTitle        := '';
                 ctitlealign   := '';
                 cAlign        := '';
                 ccharcase     := '';
                 cVisible      := '';
                 cCss          := '';
                 bCssAll       := false; // 6.0.0.0
                 cPill         := '';
                 idisplaywidth := 0;
                 ivisible      := 1;
                 ilocked       := 0;

                 if Column.FieldName = 'UF' then
                    cAlign := cAlign;


                 iCheckBox       := 0;
                 cCheckBoxValues := '';
                 cCheckBoxDisplayValues := '';
                 iDisplayMemo    := 0;

                 bShowPk         := false;//8.0.0.0

                 ctable  := ansilowercase( trim(mm.varC_Table_Search ) );
                 ccolumn := ansilowercase( Column.Title.Caption );
                 isize   := iBigger;

                 // the field have a mask or some adjustment ?
                 // Ex.: código[[W:20|M:00000]]

                 iPos := Pos( ';' + ansilowercase( Column.FieldName ) + '[[' , ansilowercase( mm.varC_FieldMasks ) );

                 if ( iPos > 0 ) then
                 begin
                      cTemp  := Copy( mm.varC_FieldMasks, iPos, 10000 ) ;
                      cTemp  := Copy( cTemp, 1, Pos( ']]' , cTemp ) - 1 ) ; // pega os params da coluna
                      cTemp2 := Copy( cTemp, Pos( '[[', cTemp ), 1000 );
                      cTemp  := StringReplace( cTemp, cTemp2 , '', [rfReplaceAll] );
                      cTemp  := Trim( StringReplace( cTemp, cTemp2 , '', [rfReplaceAll] ) );

                      cField := Copy( cTemp, 2, 1000 ) ;

                      cTemp2 := StringReplace( cTemp2, '[[', '', [rfReplaceAll] );
                      cTemp2 := StringReplace( cTemp2, ']];', '', [rfReplaceAll] );
                      cTemp2 := StringReplace( cTemp2, ']]', '', [rfReplaceAll] );
                      cTemp2 := cTemp2 + '|';

                      iPos2 := Pos( '|' , cTemp2 );
                      While ( iPos2 > 0 ) do
                      begin
                           cTemp  := Copy( cTemp2, 1 , iPos2 );
                           cTemp2 := StringReplace( cTemp2, cTemp, '', [rfReplaceAll] );

                           cTemp  := StringReplace( cTemp, '|', '', [rfReplaceAll] );
                           cTemp  := Trim(StringReplace( cTemp, '|', '', [rfReplaceAll] ));
                           //8.1.0.0
                           if ( Pos( 'width-col:', cTemp ) > 0 ) then
                           begin
                              // verificar quantos botoes existem p calcular o width mais corretamente
                              if ( Pos( 'width-col:default', cTemp ) > 0 ) then
                              begin
                                 iWidthActionsPercent := Occurs( 'rc-actbtn-' , TFDQuery(TUniDBGrid(Sender).DataSource.DataSet).Sql.Text );
                                 iWidthActionsPercent := Trunc( ( ( 34 / ( TUniDBGrid(Sender).Width-6) ) * 100 ) * iWidthActionsPercent );
                                 iWidthActions := Trunc( ( TUniDBGrid(Sender).Width-6) * (iWidthActionsPercent / 100) );
                                 cTemp := 'width-col:' + iWidthActionsPercent.ToString + '% mobile-h:' + (iWidthActionsPercent).ToString + '% mobile-v:' + (iWidthActionsPercent+6).ToString + '%';
                              end;

                              cTemp := cTemp + ' ';
                              //8.0.0.0
                              if rc_IsMobile_V( cTemp ) then //8.0.0.0
                              begin
                                   cTemp3 := trim( Copy( cTemp, Pos( 'mobile-v:', cTemp ) + 9 ) ) + ' ';
                                   cTemp3 := trim( Copy( cTemp3, 1, Pos( ' ', cTemp3 ) ) );
                                   cTemp  := cTemp3;
                                   if Pos( 'off', cTemp3 ) > 0 then
                                   begin
                                      cTemp  := '1%';
                                      cTemp3 := '1';
                                      cvisible := 'false';
                                      ivisible := 0;
                                   end;
                                   cTemp3 := ReturnNumbers( cTemp3 );

                                 if Pos( '%', cTemp ) = 0 then
                                    idisplaywidth := StrToIntDef( cTemp3, 0 )
                                 else
                                    idisplaywidth := StrToIntDef( cTemp3, 0 ) * (-1); // percentual ( / 100 )

                                 if cTemp3 = '0' then
                                    idisplaywidth := 9999;
                              end
                              else
                              if rc_IsMobile_H( cTemp ) then //8.0.0.0
                              begin
                                   cTemp3 := trim( Copy( cTemp, Pos( 'mobile-h:', cTemp ) + 9, Pos( ' ', cTemp ) ) );
                                   cTemp  := cTemp3;
                                   cTemp3 := ReturnNumbers( cTemp3 );

                                 if Pos( '%', cTemp ) = 0 then
                                    idisplaywidth := StrToIntDef( cTemp3, 0 )
                                 else
                                    idisplaywidth := StrToIntDef( cTemp3, 0 ) * (-1); // percentual ( / 100 )

                                 if cTemp3 = '0' then
                                    idisplaywidth := 9999;
                              end
                              else
                              if rc_IsMobile( cTemp ) then //8.0.0.0
                              begin
                                   cTemp3 := trim( Copy( cTemp, Pos( 'mobile:', cTemp ) + 7, Pos( ' ', cTemp ) ) );
                                   cTemp  := cTemp3;
                                   cTemp3 := ReturnNumbers( cTemp3 );

                                 if Pos( '%', cTemp ) = 0 then
                                    idisplaywidth := StrToIntDef( cTemp3, 0 )
                                 else
                                    idisplaywidth := StrToIntDef( cTemp3, 0 ) * (-1); // percentual ( / 100 )

                                 if cTemp3 = '0' then
                                    idisplaywidth := 9999;
                              end
                              else
                              begin
                                 cTemp3 := trim( Copy( cTemp, 1, Pos( ' ', cTemp ) ) );
                                 cTemp  := cTemp3;
                                 cTemp3 := ReturnNumbers( cTemp3 );

                                 if Pos( '%', cTemp ) = 0 then
                                    idisplaywidth := StrToIntDef( cTemp3, 0 )
                                 else
                                    idisplaywidth := StrToIntDef( cTemp3, 0 ) * (-1); // percentual ( / 100 )

                                 if cTemp3 = '0' then
                                    idisplaywidth := 9999;
                              end;
                           end
                           else
                           if ( Pos( 'pill:' , cTemp ) > 0 ) then
                           begin

   //                              cTemp3 := Copy( cTemp, Pos( 'pill:' + trim( TField( Column.Field ).AsString ), cTemp ), 200 );
   //
   //                              if Pos( 'pill:', cTemp3) > 0 then
   //                              begin
   //                                 cTemp2 := Copy( cTemp3, 6, 100 );
   //                                 cTemp2 := Copy( cTemp2, 1, Pos( ' ', cTemp2 ) - 1 );
   //                                 cPill  := cTemp2 + '</span>';
   //                                 cTemp3 := Copy( cTemp3, Pos( ' ', cTemp3 ) + 1, 100 );
   //                                 cPill  := '<div style="color=red"><span class="badge badge-pill badge-' + cTemp3 + '">"' + cPill + '</div>';
   //                                 cPill := '';
   //                                 //Attribs.Style.cls := 'badge rc-grid-cell-badge bg-warning';//'badge badge-pill badge-' + cTemp3;
   //                                 Attribs.Style.cls := 'badge badge-pill badge-' + cTemp3;
   //
   //                                 with TUniDBGrid ( sender ) do
   //                                 begin
   //                                      TStringField( Column.Field ).Alignment := taCenter;
   //                                 end;
   //
   //                                 Column.AllowHTML := True;
   //                                 //ccolumn +
   //                              end;

                           end
                           else
                           if Pos( 'visible:', cTemp ) > 0 then
                           begin
                              cTemp := cTemp + ' ';

                              cvisible := 'true';
                              ivisible := 1;

                              if ( Pos( 'visible:false mobile-v ', cTemp ) > 0 ) and
                                 ( mm.varB_Mobile_Screen_Portrait ) then
                              begin
                                 cvisible := 'false';
                                 ivisible := 0;
                              end
                              else
                              if ( Pos( 'visible:false mobile-h ', cTemp ) > 0 ) and
                                 ( mm.varB_Mobile_Screen_Landscape ) then
                              begin
                                 cvisible := 'false';
                                 ivisible := 0;
                              end
                              else
                              if ( Pos( 'visible:false mobile ', cTemp ) > 0 ) and
                                 ( mm.varB_Mobile_Screen ) then
                              begin
                                 cvisible := 'false';
                                 ivisible := 0;
                              end
                              else
                              if ( ( Pos( 'visible:false ', cTemp ) > 0 ) or
                                 ( Pos( 'visible:true ', cTemp ) > 0 ) ) then
                              begin
                                 //visible:(NOT EMPTY)
                                 cvisible := Trim( Copy( cTemp, 9, 100 ) );
                                 ivisible := varIIF( cvisible = 'true', 1, 0 );
                              end;
                           end
                           //8.0.0.0
                           else
                           if Pos( 'showpk', cTemp ) > 0 then
                           begin
                              bShowPk := true;
                           end

                           else
                           //conditional css //cls:{>=0,color-red,color-black}
                           if Pos( 'cls:', cTemp ) > 0 then
                           begin
                              ccss  := Copy( cTemp, 5, 100 );
                              bCssAll := false;
                           end

                           else
                           //checked
                           if Pos( 'checkbox:', cTemp ) > 0 then
                           begin
                              iCheckBox := varIIF( Pos( 'checkbox:', cTemp ) > 0, 1, 0 );
                              cCheckBoxValues := Copy( cTemp, Pos( 'checkbox:', cTemp ) + 9 ) + ' ';
                              cCheckBoxValues := Copy( cCheckBoxValues, 1, Pos( ' ', cCheckBoxValues )) ;
                              if Pos( ' dv', cTemp ) > 0 then
                              begin
                                 if Pos( ' dv:', cTemp ) > 0 then
                                    cCheckBoxDisplayValues := Copy( cTemp, Pos( ' dv:', cTemp ) + 4 )
                                 else
                                    cCheckBoxDisplayValues := Copy( cTemp, Pos( ' dv', cTemp ) + 3 ) ;
                              end;
                           end
                           else

                           //displaymemo
                           if Pos( 'displaymemo', cTemp ) > 0 then
                           begin
                              iDisplayMemo := varIIF( Pos( 'displaymemo', cTemp ) > 0, 1, 0 );
                              Column.DisplayMemo := True;
                           end
                           else
                           //locked
                           if Pos( 'locked', cTemp ) > 0 then
                              ilocked := varIIF( Pos( 'locked', cTemp ) > 0, 1, 0 )
                           else
                           //ctitle
                           if Pos( 'title-name:', cTemp ) > 0 then //8.4.0.0 align col
                           begin
                              ctitle := Copy( cTemp, 12, 100 );
                              if ctitle = '' then
                                 ctitle := ' ';
                           end
                           else
                           //ctitlealign
                           if Pos( 'align-title:', cTemp ) > 0 then //8.4.0.0 align col
                              ctitlealign := Copy( cTemp, 13, 1 )
                           else
                           //calign
                           if Pos( 'col-align:', cTemp ) > 0 then//8.4.0.0 align col
                              calign := Copy( cTemp, 11, 1 )
                           else
                           //ccharcase
                           if Pos( 'charcase:', cTemp ) > 0 then
                              ccharcase := Copy( cTemp, 10, 1 )
                           else
                           //cmask
                           if Pos( 'mask:', cTemp ) > 0 then
                           begin
                              cmask := Copy( cTemp, 6, 100 );
                              if Pos( PFmtSettings.DecimalSeparator + '00', cmask ) > 0 then
                              begin
                                   cTemp := Copy( cmask, Pos( PFmtSettings.DecimalSeparator , cmask ) + 1, 100 );
                                   idecimalprecision := strTokenCount( ctemp, '0' );
                              end;
                           //6.0.0.0 start "image:"
                           end
                           else
                           //Thanks to <FABIO OLIVEIRA> - For show image fields on grid.
                           if Pos( 'image:', cTemp ) > 0 then
                           begin
                              cTemp := cTemp + ' ';
                              cTemp := trim( Copy( cTemp, Pos( 'image:', cTemp ) + 6, Pos( ' ', cTemp ) ) );
                              cTemp := ReturnNumbers( cTemp );
                              Column.ImageOptions.Height  := StrToIntDef(cTemp, 100);
                              Column.ImageOptions.Visible := True;
                              Column.ImageOptions.Width   := StrToIntDef(cTemp, 100);
                           end;
                           //6.0.0.0 end "image:"
                           iPos2 := Pos( '|' , cTemp2 );
                      end;
                 end;
           end;

           bSameTable := ( ctable <> '' ) and
                         ( trim( mm.varC_Table_Search ) = ctable ) ;

           // Ajustar os campos( alinhamento e espaçamento )
           if Column.Field <> nil then
           begin
               if ( bRender ) or
                  ( bResize ) or
                  ( trim( mm.varC_Table_Search ) = '' ) then
               begin
                    if bSameTable then
                    begin
                       if ( ctitle <> '' ) or ( ititleset = 0 ) then
                       begin
                          if ititleset = 0 then
                          begin
                             if ( bRender ) then
                                Column.Visible := ( cvisible <> 'false' );

                             if not Column.Visible then
                                Column.Width := 0;

                             if Column.Visible then
                             begin
                                if ( bRender ) then
                                begin
                                   // 6.0.0.0
                                   if ( ctitle <> '' )then
                                   begin
                                      Column.Title.Caption    := ctitle;
                                   end;

                                   // o CSS global não funcionou para "Capitalize"
                                   // the global CSS do not work for "capitalize"
                                   if mm.CONFIG_LAYOUT_GRID_TITLE_UPPER = 'OFF' then
                                      Column.Title.Caption := rc_CamelCase( Column.Title.Caption );
                                   // 6.0.0.0
                                   if trim(ctitlealign) <> '' then
                                   begin
                                      if ctitlealign = 'c' then
                                         Column.Title.Alignment := taCenter
                                      else
                                      if ctitlealign = 'r' then
                                         Column.Title.Alignment := taRightJustify
                                      else
                                      if ctitlealign = 'l' then
                                         Column.Title.Alignment := taLeftJustify;
                                   end;

                                   if ( ilocked = 1 ) then
                                   begin
                                        dm_rc.rc_GridColumnLock( TUniDBGrid( sender ), Column.Index );
                                   end;

                                   if ( iDisplayMemo = 1 ) then
                                   begin
                                        Column.DisplayMemo := True;
                                   end;

                                   if ( iCheckBox = 1 ) then
                                   begin
                                      Column.CheckBoxField.Enabled          := true;
                                      Column.CheckBoxField.BooleanFieldOnly := Pos( 'true', cCheckBoxValues ) > 0;
                                      Column.CheckBoxField.FieldValues      := cCheckBoxValues;
                                      if cCheckBoxDisplayValues = '' then
                                         Column.CheckBoxField.DisplayValues    := '&#160'
                                      else
                                         Column.CheckBoxField.DisplayValues    := cCheckBoxDisplayValues;
                                   end;
                                end;

                                if ( bResize ) or ( idisplaywidth = 9999 ) then
                                begin
                                  if idisplaywidth = 0 then
                                  begin
                                     idisplaywidth := TUniDBGrid(Sender).DataSource.DataSet.FieldByName( Column.FieldName ).DisplayWidth;
                                     iLength := Length( Column.Title.Caption ) + 2;

                                     if TStringField( Column.Field ).EditMask = '' then
                                        iTag     := Length( trim( TStringField( Column.Field ).Text ) )
                                     else
                                        iTag     := Length( trim( StringReplace( TStringField( Column.Field ).EditMask, '\' , '', [rfReplaceAll] ) ) );

                                     if iLength >= iTag then
                                        iBigger := iLength
                                     else
                                        iBigger := iTag;
                                  end
                                  else
                                  begin
                                       iBigger := iTag;
                                       iTag := iBigger ;
                                  end;

                                  if column.Visible then
                                  begin
                                     if idisplaywidth = 9999 then
                                     begin
                                          Column.MinWidth := 0;
                                          Column.Width    := 0;
                                          Column.Tag      := 0;
                                          Column.Flex     := 0;
                                          iBigger         := 0;
                                          iTag            := 0 ;
                                     end
                                     else
                                     if bResize then
                                     begin
                                         if Pos( 'grid-noforcefit|' , mm.varC_FieldMasks ) > 0 then
                                            Column.Flex     := 0
                                         else
                                         if Pos( 'locked|' , mm.varC_FieldMasks ) > 0 then
                                            Column.Flex     := 1;

                                         mm.varC_GridColName := lowercase( Column.FieldName);

                                         if Column.Tag < ( iBigger + 6 ) * 6 then
                                            Column.Tag := ( iBigger + 6 ) * 6;

                                         if idisplaywidth > Column.Tag then
                                         begin
                                            Column.Width := idisplaywidth;
                                         end
                                         else
                                         begin
                                            // 6.0.0.0 ( scroll bar = 6px )
                                            if idisplaywidth < 0 then
                                               Column.Tag := Trunc( ( TUniDBGrid(Sender).Width-6 ) * ( ( idisplaywidth * (-1 ) ) / 100 ) );

                                            Column.Width := Column.Tag;
                                         end;

                                         Column.MinWidth := Column.Width;

                                         iBigger := Column.MinWidth;
                                         iTag := iBigger ;
                                     end;
                                  end;
                                end;
                             end;
                          end;
                          ititleset := 1;
                       end;

                       if ( bRender ) and ( ccolcolor <> '' ) and ( Column.Visible ) then
                          column.Color := StringToColor( ccolcolor );

                       if ( bRender ) and ( ccss <> '' ) and ( Column.Visible ) then
                       begin
                          // have a condition ?
                          if Pos( '{' , ccss ) > 0 then
                          begin
                               cStr1 := ccss ;
                               cStr1 := StringReplace( cStr1 , 'cls:' , '', [rfReplaceAll] );
                               cStr1 := StringReplace( cStr1 , '{' , '', [rfReplaceAll] );
                               cStr1 := StringReplace( cStr1 , '}' , '', [rfReplaceAll] );

                               cStr2 := Copy( cStr1 , 1, Pos( ',', cStr1 ) - 1 );
                               cStr1 := StringReplace( cStr1 , cStr2 + ',' , '', [rfReplaceAll] );

                               if Pos( '>=' , cStr2 ) > 0 then
                                  cOperator := '>='
                               else
                               if Pos( '<=' , cStr2 ) > 0 then
                                  cOperator := '<='
                               else
                               if Pos( '<>' , cStr2 ) > 0 then
                                  cOperator := '<>'
                               else
                               if Pos( '<' , cStr2 ) > 0 then
                                  cOperator := '<'
                               else
                               if Pos( '>' , cStr2 ) > 0 then
                                  cOperator := '>'
                               else
                               if Pos( '=' , cStr2 ) > 0 then
                                  cOperator := '=';
                               // 6.0.0.0
                               ccss  := Copy( cStr2, 1, Pos( cOperator, cStr2 ) - 1 );
                               cStr2 := StringReplace( cStr2 , ccss + cOperator , '', [rfReplaceAll] );
                               cValue := cStr2;

                               cTrueValue  := Copy( cStr1, 1, Pos( ',', cStr1 ) - 1 );
                               cStr1 := StringReplace( cStr1 , cTrueValue + ',' , '', [rfReplaceAll] );
                               cFalseValue := cStr1;
                               // 6.0.0.0
                               if ccss <> '' then
                                   vFieldCss := ccss
                               else
                                   vFieldCss := Column.Field.FieldName;
                               //7.0.0.0 ( thanks for bugtracker GILBERTO LOSS )
                               if DataTypeIsDateTime( TUniDBGrid(Sender).DataSource.DataSet.FieldByName( vFieldCss ).DataType ) then
                               begin
                                  if cOperator = '=' then
                                     Attribs.Style.Cls := VarIIF( TUniDBGrid(Sender).DataSource.DataSet.FieldByName( vFieldCss ).Value = StrToDateTimeDef( cValue , 0 ) , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '>' then
                                     Attribs.Style.Cls := VarIIF( TUniDBGrid(Sender).DataSource.DataSet.FieldByName( vFieldCss ).Value > StrToDateTimeDef( cValue , 0 ) , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '<' then
                                     Attribs.Style.Cls := VarIIF( TUniDBGrid(Sender).DataSource.DataSet.FieldByName( vFieldCss ).Value < StrToDateTimeDef( cValue , 0 ) , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '>=' then
                                     Attribs.Style.Cls := VarIIF( TUniDBGrid(Sender).DataSource.DataSet.FieldByName( vFieldCss ).Value >= StrToDateTimeDef( cValue , 0 ) , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '<=' then
                                     Attribs.Style.Cls := VarIIF( TUniDBGrid(Sender).DataSource.DataSet.FieldByName( vFieldCss ).Value <= StrToDateTimeDef( cValue , 0 ) , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '<>' then
                                     Attribs.Style.Cls := VarIIF( TUniDBGrid(Sender).DataSource.DataSet.FieldByName( vFieldCss ).Value <> StrToDateTimeDef( cValue , 0 ) , cTrueValue , cFalseValue );
                               end
                               else
                               if DataTypeIsNumber( TUniDBGrid(Sender).DataSource.DataSet.FieldByName( vFieldCss ).DataType ) then
                               begin
                                  if cOperator = '=' then
                                     Attribs.Style.Cls := VarIIF( TUniDBGrid(Sender).DataSource.DataSet.FieldByName( vFieldCss ).Value = StrToIntDef( cValue , 0 ) , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '>' then
                                     Attribs.Style.Cls := VarIIF( TUniDBGrid(Sender).DataSource.DataSet.FieldByName( vFieldCss ).Value > StrToIntDef( cValue , 0 ) , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '<' then
                                     Attribs.Style.Cls := VarIIF( TUniDBGrid(Sender).DataSource.DataSet.FieldByName( vFieldCss ).Value < StrToIntDef( cValue , 0 ) , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '>=' then
                                     Attribs.Style.Cls := VarIIF( TUniDBGrid(Sender).DataSource.DataSet.FieldByName( vFieldCss ).Value >= StrToIntDef( cValue , 0 ) , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '<=' then
                                     Attribs.Style.Cls := VarIIF( TUniDBGrid(Sender).DataSource.DataSet.FieldByName( vFieldCss ).Value <= StrToIntDef( cValue , 0 ) , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '<>' then
                                     Attribs.Style.Cls := VarIIF( TUniDBGrid(Sender).DataSource.DataSet.FieldByName( vFieldCss ).Value <> StrToIntDef( cValue , 0 ) , cTrueValue , cFalseValue );
                               end
                               else
                               if DataTypeIsString( TUniDBGrid(Sender).DataSource.DataSet.FieldByName( vFieldCss ).DataType ) then
                               begin
                                  if cOperator = '=' then
                                     Attribs.Style.Cls := VarIIF( TUniDBGrid(Sender).DataSource.DataSet.FieldByName( vFieldCss ).Value = cValue , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '>' then
                                     Attribs.Style.Cls := VarIIF( TUniDBGrid(Sender).DataSource.DataSet.FieldByName( vFieldCss ).Value > cValue , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '<' then
                                     Attribs.Style.Cls := VarIIF( TUniDBGrid(Sender).DataSource.DataSet.FieldByName( vFieldCss ).Value < cValue , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '>=' then
                                     Attribs.Style.Cls := VarIIF( TUniDBGrid(Sender).DataSource.DataSet.FieldByName( vFieldCss ).Value >= cValue , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '<=' then
                                     Attribs.Style.Cls := VarIIF( TUniDBGrid(Sender).DataSource.DataSet.FieldByName( vFieldCss ).Value <= cValue , cTrueValue , cFalseValue )
                                  else
                                  if cOperator = '<>' then
                                     Attribs.Style.Cls := VarIIF( TUniDBGrid(Sender).DataSource.DataSet.FieldByName( vFieldCss ).Value <> cValue , cTrueValue , cFalseValue );
                               end;
                          end
                          else
                             Attribs.Style.Cls := ccss;
                       end;
                    end;
                    //Alinhar campos numericos a DIREITA
                    if ( bRender ) and ( Column.Visible ) then
                    begin
                       //7.0.0.0 align date
                       if DataTypeIsDateTime( Column.Field.DataType ) then
                       begin
                            with TUniDBGrid(Sender) do
                            begin
                               // apply pre-defined attributes
                               if bSameTable then
                               begin
                                   if ( calign <> '' ) then
                                   begin
                                      begin
                                         if calign = 'c' then
                                            TDateTimeField( Column.Field ).Alignment := taCenter
                                         else
                                         if calign = 'r' then
                                            TDateTimeField( Column.Field ).Alignment := taRightJustify
                                         else
                                         if calign = 'l' then
                                            TDateTimeField( Column.Field ).Alignment := taLeftJustify;
                                      end;
                                   end;
                               end;
                            end;
                       end
                       else
                       if DataTypeIsNumber( Column.Field.DataType ) then
                       begin
                            with TUniDBGrid(Sender) do
                            begin
                               // apply pre-defined attributes
                               if bSameTable then
                               begin
                                   if ( calign <> '' ) then
                                   begin
                                      begin
                                         if calign = 'c' then
                                            TNumericField( Column.Field ).Alignment := taCenter
                                         else
                                         if calign = 'r' then
                                            TNumericField( Column.Field ).Alignment := taRightJustify
                                         else
                                         if calign = 'l' then
                                            TNumericField( Column.Field ).Alignment := taLeftJustify;
                                      end;
                                   end;
                               end;

                               if ( bSameTable ) and ( cmask <> '' ) then
                               begin
                                  TNumericField( Column.Field ).DisplayFormat := cmask;
                               end
                               else
                               //7.0.0.0
                               if DataTypeIsFloat( Column.Field.DataType ) then
                               begin
                                    //valores negativos: vermelhor e negrito
                                    if Column.Field.AsExtended < 0 then
                                    begin
                                       Attribs.Font.Color  := clMaroon;
                                       Attribs.Font.Style := [fsBold];
                                    end
                                    else
                                    begin
                                       Attribs.Font.Color  := $00dc3545;
                                       Attribs.Font.Style := [];
                                    end;

                                    if Column.Field.Size > 0 then
                                    begin
                                       if idecimalprecision = 0 then
                                          idecimalprecision := Column.Field.Size ;

                                       if ( pos( 'GEO_', uppercase( Column.FieldName ) ) > 0 ) then
                                          mm.varC_ContentField := FloatToStrF( Column.Field.AsExtended, ffNumber, 11, 8 ) + '  '
                                       else
                                          mm.varC_ContentField := FloatToStrF( Column.Field.AsExtended, ffNumber, 15, idecimalprecision ) + '  ';

                                       TNumericField( Column.Field ).DisplayFormat := mm.varC_Mask_float;
                                    end
                                    else
                                       mm.varC_ContentField := FloatToStrF( Column.Field.AsExtended, ffNumber, 15, 0 ) + '  ';
                               end
                               else
                               begin
                                  mm.varC_ContentField := IntToStr( Column.Field.AsInteger ) + '  ';
                                  TNumericField( Column.Field ).DisplayFormat := '';
                               end;

                               if Trim( mm.varC_ContentField ) = '30/12/1899' then
                                  mm.varC_ContentField := '';

                               mm.varC_ContentField := mm.varC_ContentField ;


                               if ( calign <> '' ) then
                               begin
                                  // 6.0.0.0
                                  begin
                                     if calign = 'c' then
                                        Text := Middle( PChar( mm.varC_ContentField ), ( Length( mm.varC_ContentField ) div 2 ) , ' ' )
                                     else
                                     if calign = 'l' then
                                        Text := PadLeft( PChar( mm.varC_ContentField ), Length( mm.varC_ContentField ) , ' ' )
                                     else
                                        Text := PadRight( PChar( mm.varC_ContentField ), Length( mm.varC_ContentField ) , ' ' );
                                  end;
                               end
                               else
                                  Text := PadRight( PChar( mm.varC_ContentField ), Length( mm.varC_ContentField ) , ' ' );
                            end;
                       end
                       else
                       //Alinhar campos FONE a DIREITA e FORMATAR
                       if ( Column.Field.DataType  = ftString ) or (Column.Field.DataType = ftWideString) then
                       begin
                            with TUniDBGrid(Sender) do
                            begin
                               if cPill <> '' then
                                  mm.varC_ContentField := cPill
                               else
                                  mm.varC_ContentField := ' ' + Column.Field.AsString + ' ';
                               // apply pre-defined mask
                               if ( bSameTable ) then
                               begin
                                  if ccharcase = 'u' then
                                     Attribs.Style.Cls := 'toupper '
                                  else
                                  if ccharcase = 'l' then
                                     Attribs.Style.Cls := 'tolower ';

                                  if ( calign <> '' ) then
                                  begin
                                     // 6.0.0.0
                                     if ( Pos ( 'rcaction_' , lowercase( Column.Field.AsString  ) ) = 0 ) then
                                     begin
                                        if calign = 'c' then
                                           Column.Alignment := taCenter
                                        else
                                        if calign = 'r' then
                                           Column.Alignment := taRightJustify
                                        else
                                        if calign = 'l' then
                                           Column.Alignment := taLeftJustify;
                                     end;
                                  end;
                               end;

                               TEXT := mm.varC_ContentField;

                               if ( bSameTable ) and ( cmask <> '' ) then
                               begin
                                    TStringField( Column.Field ).EditMask := cmask;
                               end
                               else
                               if pos( 'FONE', uppercase( Column.FieldName ) ) > 0 then
                               begin
                                  mm.varC_ContentField := Trim ( ReturnNumbers( mm.varC_ContentField ) ) ;

                                  // se o registro já contém ( ) ou -..não aplicar mascara
                                  TStringField( Column.Field ).EditMask := '';

                                  if Pos( '(' , Column.Field.AsString ) = 0 then
                                  begin
                                     if Length( mm.varC_ContentField ) = 8 then
                                        TStringField( Column.Field ).EditMask := '0000\-0000;0;_'
                                     else
                                     if Length( mm.varC_ContentField ) = 9 then
                                        TStringField( Column.Field ).EditMask := '00000\-0000;0;_'
                                     else
                                     if Length( mm.varC_ContentField ) = 10 then
                                        TStringField( Column.Field ).EditMask := '\(00\)0000-0000;0;_'
                                     else
                                     if Length( mm.varC_ContentField ) = 11 then
                                        TStringField( Column.Field ).EditMask := '\(00\)00000\-0000;0;_';
                                  end;
                                  TStringField( Column.Field ).Alignment := taRightJustify;
                                  Text := mm.varC_ContentField;
                               end
                               else
                               if ( pos( 'SITE', uppercase( Column.FieldName ) ) > 0 ) or
                                  ( pos( 'EMAIL', uppercase( Column.FieldName ) ) > 0 ) then
                               begin
                                  mm.varC_ContentField := LowerCase( mm.varC_ContentField );

                                  TStringField( Column.Field ).Alignment := taLeftJustify;

                                  Text := mm.varC_ContentField ;
                               end
                               else
                               if ( pos( 'CPF', uppercase( Column.FieldName ) ) > 0 ) or
                                  ( pos( 'CNPJ', uppercase( Column.FieldName ) ) > 0 ) then
                               begin
                                  mm.varC_ContentField := Trim ( ReturnNumbers( mm.varC_ContentField ) ) ;

                                  TStringField( Column.Field ).EditMask := '';

                                  if Pos( '.' , Column.Field.AsString ) = 0 then
                                  begin
                                     if Length( mm.varC_ContentField ) = 11 then
                                        TStringField( Column.Field ).EditMask := mm.varC_Mask_cpf
                                     else
                                     if Length( mm.varC_ContentField ) = 14 then
                                        TStringField( Column.Field ).EditMask := mm.varC_Mask_cnpj ;
                                  end;

                                  TStringField( Column.Field ).Alignment := taRightJustify;
                                  Text := mm.varC_ContentField ;
                               end
                               else
                               begin
                                   // espaco no HTML &nbsp;
                                   // no plano de contas, seqnivel é a direita...( recurso especifico: Flavio )
                                   cStr1 := '';

                                   TStringField( Column.Field ).Alignment := taLeftJustify;

                                   if ( bSameTable ) then
                                      if ccharcase = 'u' then
                                         mm.varC_ContentField := AnsiUppercasE( mm.varC_ContentField )
                                      else
                                      if ccharcase = 'l' then
                                         mm.varC_ContentField := AnsiLowerCase( mm.varC_ContentField );

                                   TUniDBGrid(Sender).Text := ' ' + mm.varC_ContentField + ' ' ;
                               end;
                            end;
                       end;
                    end;
               end;
           end
           else
           if ( bRender ) and ( Column.Visible ) then
              TUniDBGrid(Sender).Text := '';
       end;
       mm.varC_FieldMasks   := '';
    finally
           UniSession.ResumeLayouts;
    end;
end;
// 7.2.0.0
function tdm_rc.rc_DataSetDatasourceIsNil(pGrid: TObject): boolean;
begin
     Result := True;
     If GetPropInfo( pGrid.ClassInfo, 'Datasource') <> nil then
     begin
          If pGrid is TUniDBGrid then
             Result := not ( ( TUniDBGrid(pGrid).DataSource <> nil ) and ( TUniDBGrid(pGrid).DataSource.DataSet <> nil ) )
          else
          If pGrid is TUniDBDateTimePicker then
             Result := not ( ( TUniDBDateTimePicker(pGrid).DataSource <> nil ) and ( TUniDBDateTimePicker(pGrid).DataSource.DataSet <> nil ) )
          else
          If pGrid is TUniDBComboBox then
             Result := not ( ( TUniDBComboBox(pGrid).DataSource <> nil ) and ( TUniDBComboBox(pGrid).DataSource.DataSet <> nil ) )
          else
             Result := not ( ( TUniDBEdit(pGrid).DataSource <> nil ) and ( TUniDBEdit(pGrid).DataSource.DataSet <> nil ) );
     end;
end;
//7.0.0.0 dbgexport
procedure tdm_rc.rc_DBGridExport(pGrid: TUniDBGRID; pType: TRCExportType);
begin
   if pGrid.DataSource <> nil then
   begin
      //pGrid.DataSource          := TDataset( pGrid.DataSource.DataSet ).DataSource; //7.2.0.1 dbgexport
      pGrid.WebOptions.PageSize := TDataset( pGrid.DataSource.DataSet ).RecordCount; //6.0.0.0
      pGrid.Exporter.Title      := APP_NAME + ' Dataexport';
      pGrid.Exporter.FileName   := 'DataExport-' + FormatDateTime('yyyymmdd_hhmmss', Now() );

      case pType of
        etExcel : pGrid.Exporter.Exporter := dm_rc.UniGridExcelExporter1;
        etHTML  : pGrid.Exporter.Exporter := dm_rc.UniGridHTMLExporter1;
        etXML   : pGrid.Exporter.Exporter := dm_rc.UniGridXMLExporter1;
        etCSV   : pGrid.Exporter.Exporter := dm_rc.UniGridCSVExporter1;
      end;
      pGrid.Exporter.IncludeGroups  := true;
      pGrid.Exporter.IncludeSummary := true;
      pGrid.Exporter.ExportGrid;
   end;
end;
//7.0.0.0 dbgexport
procedure tdm_rc.rc_DBGridExport( pGrid: TUniDBGRID; pGrid_Source : TUniDBGRID; pType: TRCExportType);
begin
   if pGrid_Source.DataSource <> nil then
   begin
      pGrid.DataSource          := TDataSource( pGrid_Source.DataSource ); //7.0.0.0 dbgexport
      pGrid.WebOptions.PageSize := TDataset( pGrid.DataSource.DataSet ).RecordCount; //6.0.0.0
      pGrid.Exporter.Title      := APP_NAME + ' Dataexport';
      pGrid.Exporter.FileName   := 'DataExport-' + FormatDateTime('yyyymmdd_hhmmss', Now() );

      case pType of
        etExcel : pGrid.Exporter.Exporter := dm_rc.UniGridExcelExporter1;
        etHTML  : pGrid.Exporter.Exporter := dm_rc.UniGridHTMLExporter1;
        etXML   : pGrid.Exporter.Exporter := dm_rc.UniGridXMLExporter1;
        etCSV   : pGrid.Exporter.Exporter := dm_rc.UniGridCSVExporter1;
      end;
      pGrid.Exporter.IncludeGroups  := true;
      pGrid.Exporter.IncludeSummary := true;
      pGrid.Exporter.ExportGrid;
   end;
end;
// 6.0.0.0
//[PT] para impedir que um registro seja deletado quando não há integridade referencial com outras tabelas
//     Ex: Tentar deletar um FORNECEDOR que está vinculado em registro do Cad. de COMPRAS.
//[EN] to prevent a record from being deleted when there is no referential integrity with other tables.
//     Ex: Attempt to delete a SUPPLIER that is linked to a record in the PURCHASE Catalog
function tdm_rc.rc_HasCodeRegistered( pId: string): string;
var
    aDependencies : array [ 1 .. 40 ] of string;
    cTable, cWhereID, cPK,  cTableDependency : string;
    f, I, iTotDependencies : Integer;
begin
    iTotDependencies   := 1;
    aDependencies[ 1 ] := '';
    cTable             := '';
    for f := 0 to Length( mm.varA_BeforeDelete ) - 1 do
    begin
       cTable   := lowercase( Copy( mm.varA_BeforeDelete[f], 1, Pos( ';', mm.varA_BeforeDelete[f] ) - 1 ) );
       cWhereID := Copy( mm.varA_BeforeDelete[f], Pos( ';', mm.varA_BeforeDelete[f] ) + 1 );
       cPK      := Copy( cWhereID, Pos( ';', cWhereID ) + 1 );
       cWhereID := Copy( cWhereID, 1, Pos( ';', cWhereID ) - 1 );
       If cPK = '' then
       begin
          cPK := rc_GetPrimaryKey( cTable );
       end;
       aDependencies[ iTotDependencies ] := ' From ' + dm_rc.rc_DBSchema + cTable + ' Where ' + cWhereID + ' = ' + pId;//6.1.0.0
       Inc( iTotDependencies );
    end;

    cTableDependency := '';

    if aDependencies[ 1 ] = '' then
    begin
      Result := '';
      exit;
    end;

    for I := 1 to High( aDependencies ) do
    begin
      if aDependencies[ I ] <> '' then
      begin
        sqlGeneric.Close;
        sqlGeneric.SQL.Text := ' Select coalesce( ' + cPK + ' , 0 ) as codigo  ' + aDependencies[ I ];

        if not rc_OpenQuery( sqlGeneric ) then
        begin
             Result := 'rc_HasCodeRegistered Failed !';
             Abort;
        end;

        if not sqlGeneric.IsEmpty then
        begin
          cTableDependency := Trim( copy( aDependencies[ I ], 6, pOs( 'Where', aDependencies[ I ] ) - 6 ) );
          Break;
        end;
      end;
    end;
    SetLength( mm.varA_BeforeDelete, 0);
    Result := cTableDependency;
end;

function tdm_rc.rc_ForceDirectories(pPath: string): boolean;
begin
  try
     ForceDirectories( pPath + mm.BACKSLASH );
     Result := True;
  except on e:exception do
         begin
              Result := False;
              dm_rc.rc_ShowError( 'Upload:' + mm.MSG_ERROR + '<br><br>' + e.Message );
         end;

  end;
end;
// 6.0.0.0
//[PT] label animado
//[EN] animated label
procedure tdm_rc.rc_FormLabelClick(Sender: TObject);
var
   oControl : TUniControl;
   cControl, cTmp     : string;
begin
    cTmp     := rc_GetHintAttr( 'float-label-ctrl:', TUniControl( sender ).Hint );
    cControl := Trim( Copy( cTmp, 1, Pos( ' ', cTmp ) ) );
    oControl := rc_FindControl( cControl, TUniControl( sender ).Owner );
    if oControl <> nil then
    begin
       oControl.SetFocus;
    end;
end;

function tdm_rc.rc_GetIndexFromArray(pStr: string; pArray: array of string): integer;
var
   i : integer;
begin
     Result := 0;
     for I := 1 to Length( pArray ) do
     begin
         If ( pStr <> '' ) and ( Copy( pArray[ i - 1 ], 1, Length( pStr ) ) = pStr ) then
         begin
              Result := i  ;
              Break;
         end;
     end;
end;

procedure tdm_rc.rc_RgpEnabled(pFrame: TObject; pObj: string; pState, pRender: Boolean);
  var
   cTemp : string;
   iBsTempVal,
   iPosIni,
   iPosEnd : integer;
   oObj2 : TUniLabel;
begin
   oObj2 := TUniLabel( TComponent( pFrame ).FindComponent( pObj ) );

   if oObj2 <> nil then
   begin
      iBsTempVal := oObj2.Tag;
      cTemp := oObj2.Caption;
      iPosIni := Pos( 'type="radio"' , cTemp );
      iPosEnd := Pos( 'onclick="ajaxRequest' , cTemp );
      cTemp := StringReplace( cTemp, 'checked=""', '',[rfReplaceAll] );
      cTemp := StringReplace( cTemp, 'disabled=""', '',[rfReplaceAll] );

      oObj2.Enabled := pState ;

      oObj2.Tag := varIIF( pState, 1, 0 );

      if pRender then
         dm_rc.rc_BootStrapRender( pFrame, true, oObj2 );
   end;
end;

procedure tdm_rc.rc_SwtEnabled(pFrame: TObject; pObj: string; pState, pRender: Boolean);
var
   cTemp : string;
   iBsTempVal,
   iPosIni,
   iPosEnd : integer;
   oObj2 : TUniLabel;
begin
   oObj2 := TUniLabel( TComponent( pFrame ).FindComponent( pObj ) );

   if oObj2 <> nil then
   begin
      iBsTempVal := oObj2.Tag;
      cTemp := oObj2.Caption;
      iPosIni := Pos( 'type="checkbox"' , cTemp );
      iPosEnd := Pos( 'class="custom-control-input"' , cTemp );
      cTemp := StringReplace( cTemp, 'checked=""', '',[rfReplaceAll] );
      cTemp := StringReplace( cTemp, 'disabled=""', '',[rfReplaceAll] );

      oObj2.Enabled := pState ;

      oObj2.Tag := varIIF( pState, 1, 0 );

      if pRender then
         dm_rc.rc_BootStrapRender( pFrame , true, oObj2 );
   end;
end;

procedure tdm_rc.rc_RgpCheck(pFrame: TObject; pObj: string; pState, pRender: Boolean);
  var
   cTemp : string;
   iBsTempVal,
   iPosIni,
   iPosEnd : integer;
   oObj2 : TUniLabel;
begin
   oObj2 := TUniLabel( TComponent( pFrame ).FindComponent( pObj ) );

   if oObj2 <> nil then
   begin
      cTemp := oObj2.Caption;
      iPosIni := Pos( 'type="radio"' , cTemp );
      iPosEnd := Pos( 'onclick="ajaxRequest' , cTemp );
      cTemp := StringReplace( cTemp, 'checked=""', '',[rfReplaceAll] );
      cTemp := StringReplace( cTemp, 'disabled=""', '',[rfReplaceAll] );

      iBsTempVal := oObj2.Tag;

      oObj2.Tag := varIIF( pState, 999, -999 );// para evitar conflito com rc_RgpInitialize

      if pRender then
         dm_rc.rc_BootStrapRender( pFrame , true, oObj2 );
   end;
end;

procedure tdm_rc.rc_SwtCheck(pFrame: TObject; pObj: string; pState, pRender: Boolean);
var
   cTemp : string;
   iBsTempVal,
   iPosIni,
   iPosEnd : integer;
   oObj2 : TUniLabel;
begin
   oObj2 := TUniLabel( TComponent( pFrame ).FindComponent( pObj ) );

   if oObj2 <> nil then
   begin
      cTemp := oObj2.Caption;
      iPosIni := Pos( 'type="checkbox"' , cTemp );
      iPosEnd := Pos( 'class="custom-control-input"' , cTemp );
      cTemp := StringReplace( cTemp, 'checked=""', '',[rfReplaceAll] );
      cTemp := StringReplace( cTemp, 'disabled=""', '',[rfReplaceAll] );

      oObj2.Tag := varIIF( pState, 1, 0 );
      iBsTempVal := oObj2.Tag;

      if pRender then
         dm_rc.rc_BootStrapRender( pFrame, true, oObj2 );
   end;
end;

procedure tdm_rc.rc_ChkCheck(pFrame: TObject; pObj: string; pState, pRender: Boolean);
var
   cTemp : string;
   iBsTempVal,
   iPosIni,
   iPosEnd : integer;
   oObj2 : TUniLabel;
begin
   oObj2 := TUniLabel( TComponent( pFrame ).FindComponent( pObj ) );

   if oObj2 <> nil then
   begin
      cTemp := oObj2.Caption;
      iPosIni := Pos( 'type="checkbox"' , cTemp );
      iPosEnd := Pos( 'class="custom-control-input"' , cTemp );
      cTemp := StringReplace( cTemp, 'checked=""', '',[rfReplaceAll] );
      cTemp := StringReplace( cTemp, 'disabled=""', '',[rfReplaceAll] );

      oObj2.Tag := varIIF( pState, 1, 0 );
      iBsTempVal := oObj2.Tag;

      if pRender then
         dm_rc.rc_BootStrapRender( pFrame, true, oObj2 );
   end;
end;

procedure tdm_rc.rc_ChkEnabled(pFrame: TObject; pObj: string; pState, pRender: Boolean);
var
   cTemp : string;
   iBsTempVal,
   iPosIni,
   iPosEnd : integer;
   oObj2 : TUniLabel;
begin
   oObj2 := TUniLabel( TComponent( pFrame ).FindComponent( pObj ) );

   if oObj2 <> nil then
   begin
      iBsTempVal := oObj2.Tag;
      cTemp := oObj2.Caption;
      iPosIni := Pos( 'type="checkbox"' , cTemp );
      iPosEnd := Pos( 'class="custom-control-input"' , cTemp );
      cTemp := StringReplace( cTemp, 'checked=""', '',[rfReplaceAll] );
      cTemp := StringReplace( cTemp, 'disabled=""', '',[rfReplaceAll] );

      oObj2.Enabled := pState ;

      oObj2.Tag := varIIF( pState, 1, 0 );

      if pRender then
         dm_rc.rc_BootStrapRender( pFrame, true, oObj2 );
   end;
end;

procedure tdm_rc.rc_RgpInitialize(pFrame: TObject);

var
   i : integer;
   cTemp : string;
begin
  // all itemn set tag = 0
  for I := 0 to TComponent(pFrame).ComponentCount - 1 do
  begin
      if TComponent(pFrame).Components[i] is TUniLabel then
      begin
          cTemp  := lowercase( TComponent(pFrame).Components[i].Name );

          if ( pos( '_db' , cTemp ) > 0 ) and ( Copy( cTemp, 1, 5 ) = 'bsrgp' ) then
          begin
                TUniLabel( TComponent(pFrame).Components[i] ).Tag := -1;
          end;
      end;
  end;
end;

function tdm_rc.rc_IntToString(pInt: Integer): String;
begin
  Result := IntToStr( StrToIntDef( pInt.ToString, 0 ) );
end;
//8.0.0.0
procedure tdm_rc.rc_MaskAdjust( pDbEdit : TObject; pMaskType : TRCMaskType ; pCustomMask : string );
begin
  if ( pDbEdit is TUniEdit ) then
     TUniEdit(pDbEdit).InputMask.Mask := '';

  if pCustomMask <> '' then
  begin
       //UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSName + '_id-inputEl").inputmask("' + pCustomMask + '");');
       UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSId + '-inputEl").inputmask("' + pCustomMask + '");');
       Exit;
  end
  else
  begin
    case pMaskType of

         mt_UNMASK   : UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSId + '-inputEl").inputmask("remove");');//UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSName + '_id-inputEl").inputmask("remove");');

         mt_CNPJ     : begin
                        UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSId + '-inputEl").inputmask("99.999.999/9999-99");');//UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSName + '_id-inputEl").inputmask("99.999.999/9999-99");');
                      end;

         mt_CPF      : begin
                        UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSId + '-inputEl").inputmask("999.999.999-99");') ;//UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSName + '_id-inputEl").inputmask("999.999.999-99");') ;
                      end;

         mt_CEP      : begin
                        UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSId + '-inputEl").inputmask("99.999-999");');//UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSName + '_id-inputEl").inputmask("99.999-999");');
                      end;

         mt_PHONE    : begin
                        UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSId + '-inputEl").inputmask("99999-9999");');//UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSName + '_id-inputEl").inputmask("99999-9999");');
                      end;

         mt_PHONEDDD : begin
                        UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSId + '-inputEl").inputmask("(99)99999-9999");');//UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSName + '_id-inputEl").inputmask("(99)99999-9999");');
                      end;

         // HOUVE ERRO NA COMPILAÇÃO ?   /   DO YOU HAVE A COMPILE ERROR ?
         //
         // in unigui old versions, maybe need to comment this lines below
         // em versões antigas do unigui, comente as linhas abaixo
         //7.4.0.0
         mt_CARPLATE : begin
                         UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSId + '-inputEl").inputmask("AAA-9999");');//UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSName + '_id-inputEl").inputmask("AAA-9999");');
                      end;
         //7.4.0.0
         mt_CARPLATE_BR : begin
                            UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSId + '-inputEl").inputmask("AAA-9*99");');//UniSession.JSCode('$("#' + TUniControl(pDbEdit).JSName + '_id-inputEl").inputmask("AAA-9*99");');
                          end;

         mt_DATE     : begin
                         if pDbEdit is TUniDateTimePicker then
                            UniSession.JSCode('$("#' + TUniDateTimePicker(pDbEdit).JSId + '-inputEl").inputmask("99/99/9999");')//UniSession.JSCode('$("#' + TUniDateTimePicker(pDbEdit).JSName + '_id-inputEl").inputmask("99/99/9999");')
                         else
                         if pDbEdit is TUniDBDateTimePicker then
                            UniSession.JSCode('$("#' + TUniDBDateTimePicker(pDbEdit).JSId + '-inputEl").inputmask("99/99/9999");')//UniSession.JSCode('$("#' + TUniDBDateTimePicker(pDbEdit).JSName + '_id-inputEl").inputmask("99/99/9999");')
                         else
                         if pDbEdit is TUniEdit then
                            TUniEdit(pDbEdit).InputMask.Mask :=  '99/99/9999';
                      end;
    end;
  end;
end;
//7.0.0.0
procedure tdm_rc.rc_ReportDateInterval( pPeriod: string);
begin
    DecodeDate( Date, mm.varW_Year, mm.varW_Month, mm.varW_Day );

    mm.varI_Day1 := DayOf( Date );
    mm.varI_Month1 := MonthOf( Date );
    mm.varI_Year1 := YearOf( Date );

    mm.varI_Day2 := DayOf( Date );
    mm.varI_Month2 := MonthOf( Date );
    mm.varI_Year2 := YearOf( Date );

    if pPeriod = mm.MSG_DATE_INTERVALS_ALL then
    begin
      mm.varD_DtIni := StrToDate( '01/01/1800' );
      mm.varD_DtEnd := StrToDate( '01/01/5000' );
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_ALL_UNTIL_TODAY then
    begin
      mm.varD_DtIni := StrToDate( '01/01/1800' );
      mm.varD_DtEnd := Date;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_TODAY then
    begin
      mm.varD_DtIni := Date;
      mm.varD_DtEnd := Date;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_YESTERDAY then
    begin
      mm.varD_DtIni := Date - 1;
      mm.varD_DtEnd := Date - 1;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_BEFORE_YESTERDAY then
    begin
      mm.varD_DtIni := Date - 2;
      mm.varD_DtEnd := Date - 2;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_TOMORROW then
    begin
      mm.varD_DtIni := Date + 1;
      mm.varD_DtEnd := Date + 1;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_AFTER_TOMORROW then
    begin
      mm.varD_DtIni := Date + 2;
      mm.varD_DtEnd := Date + 2;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_THIS_WEEK then
    begin
      // q dia é hj ?( 1-Dom...7..Sab )
      mm.varI_Temp1 := DayOfWeek( Date );

      case mm.varI_Temp1 of
        // Domingo
        1 :
          begin
            mm.varD_DtIni := Date;
            mm.varD_DtEnd := Date + 6;
          end;
        // Segunda
        2 :
          begin
            mm.varD_DtIni := Date - 1;
            mm.varD_DtEnd := Date + 5;
          end;
        // Terca
        3 :
          begin
            mm.varD_DtIni := Date - 2;
            mm.varD_DtEnd := Date + 4;
          end;
        // Quarta
        4 :
          begin
            mm.varD_DtIni := Date - 3;
            mm.varD_DtEnd := Date + 3;
          end;
        // Quinta
        5 :
          begin
            mm.varD_DtIni := Date - 4;
            mm.varD_DtEnd := Date + 2;
          end;
        // Sexta
        6 :
          begin
            mm.varD_DtIni := Date - 5;
            mm.varD_DtEnd := Date + 1;
          end;
        // SAbado
        7 :
          begin
            mm.varD_DtIni := Date - 7;
            mm.varD_DtEnd := Date;
          end;
      end;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_LAST_WEEK then
    begin
      // q dia é hj ?( 1-Dom...7..Sab )
      mm.varI_Temp1 := DayOfWeek( Date );

      case mm.varI_Temp1 of
        // Domingo
        1 :
          begin
            mm.varD_DtIni := Date - 7;
            mm.varD_DtEnd := Date + 6 - 7;
          end;
        // Segunda
        2 :
          begin
            mm.varD_DtIni := Date - 1 - 7;
            mm.varD_DtEnd := Date + 5 - 7;
          end;
        // Terca
        3 :
          begin
            mm.varD_DtIni := Date - 2 - 7;
            mm.varD_DtEnd := Date + 4 - 7;
          end;
        // Quarta
        4 :
          begin
            mm.varD_DtIni := Date - 3 - 7;
            mm.varD_DtEnd := Date + 3 - 7;
          end;
        // Quinta
        5 :
          begin
            mm.varD_DtIni := Date - 4 - 7;
            mm.varD_DtEnd := Date + 2 - 7;
          end;
        // Sexta
        6 :
          begin
            mm.varD_DtIni := Date - 5 - 7;
            mm.varD_DtEnd := Date + 1 - 7;
          end;
        // SAbado
        7 :
          begin
            mm.varD_DtIni := Date - 7 - 7;
            mm.varD_DtEnd := Date - 7;
          end;
      end;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_NEXT_WEEK then
    begin
      // q dia é hj ?( 1-Dom...7..Sab )
      mm.varI_Temp1 := DayOfWeek( Date );

      case mm.varI_Temp1 of
        // Domingo
        1 :
          begin
            mm.varD_DtIni := Date + 7;
            mm.varD_DtEnd := Date + 6 + 7;
          end;
        // Segunda
        2 :
          begin
            mm.varD_DtIni := Date - 1 + 7;
            mm.varD_DtEnd := Date + 5 + 7;
          end;
        // Terca
        3 :
          begin
            mm.varD_DtIni := Date - 2 + 7;
            mm.varD_DtEnd := Date + 4 + 7;
          end;
        // Quarta
        4 :
          begin
            mm.varD_DtIni := Date - 3 + 7;
            mm.varD_DtEnd := Date + 3 + 7;
          end;
        // Quinta
        5 :
          begin
            mm.varD_DtIni := Date - 4 + 7;
            mm.varD_DtEnd := Date + 2 + 7;
          end;
        // Sexta
        6 :
          begin
            mm.varD_DtIni := Date - 5 + 7;
            mm.varD_DtEnd := Date + 1 + 7;
          end;
        // SAbado
        7 :
          begin
            mm.varD_DtIni := Date + 1;
            mm.varD_DtEnd := Date + 7;
          end;

      end;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_THIS_FORTNIGHT then
    begin
      //7.0.0.0 thanks for bugtracker mr.GILBERTO LOSS
      case mm.varI_Day1 of //case mm.varI_Month1 of
        // até 15...primeira quinzena
        1 .. 15 :
          begin
            mm.varD_DtIni := StrToDate( '01/' + copy( DateToStr( Date ), 4, 7 ) );
            mm.varD_DtEnd := StrToDate( '15/' + copy( DateToStr( Date ), 4, 7 ) );
          end;
        // acima de 15...segunda quinzena
        16 .. 31 :
          begin
            mm.varD_DtIni := StrToDate( '16/' + copy( DateToStr( Date ), 4, 7 ) );
            mm.varD_DtEnd :=
              StrToDate( IntToStr( System.DateUtils.DaysInMonth( Date ) ) + '/' + copy( DateToStr( Date ), 4, 7 ) );
          end;
      end;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_LAST_FORTNIGHT then
    begin
      // saber se estamos em JANEIRO e na primeira quinzena( sim, diminui o ano pra quinzena passada
      if ( mm.varI_Month1 = 1 ) and ( mm.varI_Day1 < 16 ) then
      begin
        // Dec( mm.varI_Year1 );
        IncAMonth( mm.varI_Year1, mm.varI_Month1, mm.varI_Day1, - 1 );
        mm.varD_DtIni := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( mm.varI_Month1 ) + '/' + IntToStr( mm.varI_Year1 ) );
        //7.0.0.0
        mm.varI_Day1   := DayOf( mm.varD_DtIni );
        mm.varI_Month1 := MonthOf( mm.varD_DtIni );
        mm.varI_Year1  := YearOf( mm.varD_DtIni );
      end;
      //7.0.0.0 thanks for bugtracker mr.GILBERTO LOSS
      case mm.varI_Day1 of //case mm.varI_Month1 of
        // até 15...primeira quinzena
        1 .. 15 :
          begin
            mm.varD_DtIni := StrToDate( '16/' + copy( DateToStr( mm.varD_DtIni ), 4, 7 ) );
            mm.varD_DtEnd :=
              StrToDate( IntToStr( System.DateUtils.DaysInMonth( Date ) ) + '/' + copy( DateToStr( mm.varD_DtIni ), 4, 7 ) );
          end;
        // acima de 15...segunda quinzena
        16 .. 31 :
          begin
            mm.varD_DtIni := StrToDate( '01/' + copy( DateToStr( Date ), 4, 7 ) );
            mm.varD_DtEnd := StrToDate( '15/' + copy( DateToStr( Date ), 4, 7 ) );
          end;
      end;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_NEXT_FORTNIGHT then
    begin
      // saber se estamos em DEZEMBRO e na segunda quinzena( sim, aumenta o ano pra prox. quinzena
      //7.0.0.0
      if ( mm.varI_Month1 = 12 ) and ( mm.varI_Day1 > 15 ) then
      begin
        Inc( mm.varI_Year1 );
        mm.varD_DtIni := StrToDate( '01/01/' + IntToStr( mm.varI_Year1 ) );
      end
      else
      begin
        Inc( mm.varI_Month1 );
        mm.varD_DtIni := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( mm.varI_Month1 ) + '/' + IntToStr( mm.varI_Year1 ) );
      end;

      case mm.varI_Day1 of
        // até 15...primeira quinzena
        1 .. 15 :
          begin
            mm.varD_DtIni := StrToDate( '16/' + copy( DateToStr( mm.varD_DtIni ), 4, 7 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtIni ) ) + '/' +
                                                  copy( DateToStr( mm.varD_DtIni ), 4, 7 ) );
          end;
        // acima de 15...segunda quinzena
        16 .. 31 :
          begin
            if ( mm.varI_Month1 = 12 ) then
            begin
               //mm.varD_DtIni := StrToDate( '01/' + copy( DateToStr( mm.varD_DtIni ), 4, 7 ) );
               mm.varD_DtIni := StrToDate( '01/01/' + IntToStr( mm.varI_Year1 ) );
               mm.varD_DtEnd := StrToDate( '15/' + copy( DateToStr( mm.varD_DtIni ), 4, 7 ) );
            end
            else
            begin
               mm.varD_DtIni := StrToDate( '01/' + copy( DateToStr( mm.varD_DtIni ), 4, 7 ) );
               mm.varD_DtEnd := StrToDate( '15/' + copy( DateToStr( mm.varD_DtIni ), 4, 7 ) );
            end;
          end;
      end;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_THIS_MONTH then
    begin
      mm.varD_DtIni := StrToDate( '01/' + copy( DateToStr( Date ), 4, 7 ) );
      mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( Date ) ) + '/' + copy( DateToStr( Date ), 4, 7 ) );
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_LAST_MONTH then
    begin
      IncAMonth( mm.varI_Year1, mm.varI_Month1, mm.varI_Day1, - 1 );
      mm.varD_DtIni := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( mm.varI_Month1 ) + '/' + IntToStr( mm.varI_Year1 ) );

      mm.varD_DtIni := StrToDate( '01/' + copy( DateToStr( mm.varD_DtIni ), 4, 7 ) );
      mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtIni ) ) + '/' + copy( DateToStr( mm.varD_DtIni ), 4, 7 ) );
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_NEXT_MONTH then
    begin
      IncAMonth( mm.varI_Year1, mm.varI_Month1, mm.varI_Day1, 1 );
      mm.varD_DtIni := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( mm.varI_Month1 ) + '/' + IntToStr( mm.varI_Year1 ) );

      mm.varD_DtIni := StrToDate( '01/' + copy( DateToStr( mm.varD_DtIni ), 4, 7 ) );
      mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtIni ) ) + '/' + copy( DateToStr( mm.varD_DtIni ), 4, 7 ) );
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_THIS_BIMESTER then
    begin
      case mm.varI_Month1 of
        1 .. 2 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 01 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 02 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 02 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) );
          end;
        3 .. 4 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 03 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 04 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 04 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) );
          end;
        5 .. 6 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 05 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 06 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 06 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) )
          end;
        7 .. 8 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 07 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 08 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 08 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) )
          end;
        9 .. 10 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 09 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 10 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 10 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) )
          end;
        11 .. 12 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 11 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 12 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 12 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) )
          end;
      end;

      mm.varD_DtIni := mm.varD_DtIni;
      mm.varD_DtEnd := mm.varD_DtEnd;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_THIS_QUARTER then
    begin
      case mm.varI_Month1 of
        1 .. 3 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 01 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 03 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 03 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) );
          end;
        4 .. 6 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 04 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 06 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 06 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) );
          end;
        7 .. 9 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 07 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 09 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 09 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) )
          end;
        10 .. 12 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 10 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 12 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 12 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) )
          end;
      end;

      mm.varD_DtIni := mm.varD_DtIni;
      mm.varD_DtEnd := mm.varD_DtEnd;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_THIS_SEMESTER then
    begin
      case mm.varI_Month1 of
        1 .. 6 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 01 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 06 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 06 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) );
          end;
        7 .. 12 :
          begin
            mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 06 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( mm.varI_Day1 ) + '/' + IntToStr( 12 ) + '/' + IntToStr( mm.varI_Year1 ) );
            mm.varD_DtEnd := StrToDate( IntToStr( System.DateUtils.DaysInMonth( mm.varD_DtEnd ) ) + '/' + IntToStr( 12 ) + '/' +
                             copy( DateToStr( mm.varD_DtIni ), 7, 4 ) );
          end;
      end;

      mm.varD_DtIni := mm.varD_DtIni;
      mm.varD_DtEnd := mm.varD_DtEnd;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_THIS_YEAR then
    begin
      mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 01 ) + '/' + IntToStr( mm.varI_Year1 ) );
      mm.varD_DtEnd := StrToDate( '31/' + IntToStr( 12 ) + '/' + IntToStr( mm.varI_Year1 ) );

      mm.varD_DtIni := mm.varD_DtIni;
      mm.varD_DtEnd := mm.varD_DtEnd;
    end
    else
    if pPeriod = mm.MSG_DATE_INTERVALS_LAST_YEAR then
    begin
      Dec( mm.varI_Year1 );

      mm.varD_DtIni := StrToDate( IntToStr( 01 ) + '/' + IntToStr( 01 ) + '/' + IntToStr( mm.varI_Year1 ) );
      mm.varD_DtEnd := StrToDate( '31/' + IntToStr( 12 ) + '/' + IntToStr( mm.varI_Year1 ) );

      mm.varD_DtIni := mm.varD_DtIni;
      mm.varD_DtEnd := mm.varD_DtEnd;
    end;
end;
//8.5.0.0
function tdm_rc.rc_ActionBtnsRender(pForm: TObject; pGrid: TUniDBGrid): boolean;
var
  oGridDataSet : TFDQuery;
  cGridBtnAlign,
  cBtn, cTemp, cTemp2, cTemp3, cCaption, cCls, cIco, cActions : string;
  iMinWidth, iWidth, iHeight, iPos, iPos2, i , f: integer;
  bRun, bActions : boolean;
begin
    //7.0.0.0 no db and memtable( thanks for bugtracker Moises Rottman )
    bActions := false;
    if ( not rc_DataSetDatasourceIsNil( pGrid ) ) and  ( not ( pGrid.DataSource.DataSet is TFDMemTable ) )then //7.2.0.0
    begin
       bRun     := true;
       {$IFDEF DEBUG}
       if pGrid.DataSource = nil then
       begin
          dm_rc.rc_ShowError( 'rc_ActionBtnsRender: ' + mm.MSG_ERROR + '<br>' + pGrid.Name + ' without datasource.' );
          //Abort;
          bRun := false;
       end;
       {$ENDIF}
       {$IFDEF RELEASE}
       if pGrid.DataSource = nil then
       begin
          //dm_rc.rc_ShowError( 'rc_ActionBtnsRender: ' + mm.MSG_ERROR + '<br>' + pGrid.Name + ' without datasource.' );
          //Abort;
          bRun := false;
       end;
       {$ENDIF}
       If bRun then
       begin
          oGridDataSet := TFDQuery( pGrid.DataSource.DataSet );

          //8.5.0.0
          iPos := Pos( '[[grid-btn-align:' , oGridDataSet.Sql.Text ) + 17;
          if iPos > 17 then
          begin
             cGridBtnAlign := Copy( oGridDataSet.Sql.Text, iPos );
             cGridBtnAlign := Copy( cGridBtnAlign, 1, Pos( ']]', cGridBtnAlign )-1 );

             oGridDataSet.Sql.Text := StringReplace( oGridDataSet.Sql.Text, '[[grid-btn-align:' + cGridBtnAlign + ']]', '', [rfReplaceAll] ) ;
          end
          else
             cGridBtnAlign := '';

          // action buttons
          cTemp := '';
          cActions := '';
          iPos := Pos( '[[grid-btn:' , oGridDataSet.Sql.Text );
          iPos2 := iPos;
          i := 0;
          While iPos > 0 do
          begin
             cBtn   := '';
             cTemp  := oGridDataSet.Sql.Text;
             cTemp  := Copy( cTemp , iPos, 2000 );
             cTemp  := Copy( cTemp , 3, Pos( ']]', cTemp ) - 3 );
             cTemp2 := Copy( cTemp , 10, 2000 );
             cActions := cTemp2;
             iPos2 := Pos( '|', cActions );

             if iPos2 > 0 then
                cCaption := Trim( Copy( cActions, 1, iPos2 - 1 ) )
             else
                cCaption := Trim( cActions );

             cCls := rc_GetHintAttr( 'cls:' , cActions );
             cIco := rc_GetHintAttr( 'ico:' , cActions );
             //event name
             cTemp3 := StringReplace( cCaption, '(', '', [rfReplaceAll] );
             cTemp3 := StringReplace( cTemp3, ')', '', [rfReplaceAll] );

             bActions := False;

             if ( cCaption = 'new' ) and ( cCls = '' ) then
             begin
                  cBtn := 'btnNewReg';//btnNewReg.Name;
                  if cCls = '' then
                  begin
                     if Pos( '(btns:nobg)', pGrid.Hint ) > 0 then
                        cCls := 'ButtonBlueNoBg'
                     else
                        cCls := 'ButtonBlue';
                  end;
                  cCls := 'btn rc-btn-fa ' + cCls + ' btn-sm rc-btn-action-padding';
                  if cIco = '' then cIco := 'fas-plus';
                  cCaption := '';
                  bActions := True;
             end;

             if ( cCaption = 'edit' ) then
             begin
                  cBtn := 'btnEditReg';//.Name;
                  if cCls = '' then
                  begin
                     if Pos( '(btns:nobg)', pGrid.Hint ) > 0 then
                        cCls := 'ButtonGreenNoBg'
                     else
                        cCls := 'ButtonGreen';
                  end;
                  cCls := 'btn rc-btn-fa ' + cCls + ' btn-sm rc-btn-action-padding';
                  if cIco = '' then cIco := 'fas-pencil-alt';
                  cCaption := '';
                  bActions := True;
             end;

             if( cCaption = 'delete' ) then
             begin
                  cBtn := 'btnDeleteReg';//.Name;
                  if cCls = '' then
                  begin
                     if Pos( '(btns:nobg)', pGrid.Hint ) > 0 then
                        cCls := 'ButtonRedNoBg'
                     else
                        cCls := 'ButtonRed';
                  end;
                  cCls := 'btn rc-btn-fa ' + cCls + ' btn-sm rc-btn-action-padding';
                  if cIco = '' then cIco := 'fas-trash-alt';
                  cCaption := '';
                  bActions := True;
             end;
             //8.4.0.0( nao houve mudanca )
             if( cCaption = 'options' ) then
             begin
                  cBtn := 'popMenuOptions';//.Name;
                  if cCls = '' then
                  begin
                     if Pos( '(btns:nobg)', pGrid.Hint ) > 0 then
                        cCls := 'ButtonGrayNoBg'
                     else
                        cCls := 'ButtonGray';
                  end;
                  cCls := 'btn rc-btn-fa ' + cCls + ' btn-sm rc-btn-action-padding';
                  if cIco = '' then cIco := 'fas-bars';
                  cCaption := '';
                  bActions := True;
             end;
             //8.0.0.0 custom action btns
             if ( cBtn = '' ) and ( cCaption <> '' ) then
             begin
                 cBtn := cCaption;
                 if cCls = '' then
                 begin
                    if Pos( '(btns:nobg)', pGrid.Hint ) > 0 then
                       cCls := 'ButtonBlueNoBg'
                    else
                       cCls := 'ButtonBlue';
                 end
                 else
                 begin
                     if Pos( '(btns:nobg)', pGrid.Hint ) > 0 then
                        cCls := cCls + 'NoBg';
                 end;
                                  cCls := 'btn rc-btn-fa ' + cCls + ' btn-sm rc-btn-action-padding';
                 if cIco = '' then cIco := 'fas-bars';
                 cCaption := '';
                 bActions := True;
             end;

             iWidth  := StrToIntDef( rc_GetHintAttr( 'w:' , cActions ), 22 );
             iHeight := StrToIntDef( rc_GetHintAttr( 'h:' , cActions ), 22 );

             if cIco <> '' then
                cIco := Copy( cIco, 1, Pos( '-', cIco ) - 1 ) + ' fa-' + Copy( cIco, Pos( '-', cIco ) + 1 , 20 );

             Inc( i );
             //8.0.0.0
             cTemp2 :=
                       '   <button type="button" class="' + cCls + ' ' + cIco + '" ' +
                       '      onclick="ajaxRequest( MainForm.htmlFrame, ''''_actionCol'''' ,  [''''btn=' + cBtn + ''''',''''grid=' + pGrid.Name + ''''',''''form=' + TUniComponent(pForm).Name  + ''''' ] );" ' +
                       '      name="rc-actbtn-' + cBtn + i.ToString + '" ' +
                       '      id="rc-actbtnid-' + cBtn + i.ToString + '"> ' +
                       '    </button>';
      (*
                        LkpBtn.ClientEvents.ExtEvents.Values['click'] :=
                           'function click(sender, eOpts) ' +
                           '{ ' +
                           '  ajaxRequest( MainForm.htmlFrame, "_getXYLookup" , ' + // 6.0.0.0
                           '     "x=" + ' + LkpDBEdit.JSName + '.getEl().getLeft(), ' +
                           '     "y=" + ' + LkpDBEdit.JSName + '.getEl().getTop() ,' +
                           '     "h=" + ' + LkpDBEdit.JSName + '.getEl().getHeight() ,' +
                           '     "w=" + ' + LkpDBEdit.JSName + '.getEl().getWidth(), ' +
                           '} ';
      *)

             //[PT] deve haver uma largura mínima pra exibição dos actions buttons
             //[EN] there must be a minimum width for displaying action buttons
             //8.0.0.0
             //8.5.0.0 thanks GUILHERME ERZINGER
             f := iPos;
             if i = 1 then
             begin
                if ( cGridBtnAlign='' ) or ( cGridBtnAlign='right' ) then
                   cTemp2 := 'CAST(' +
                             '  ''<div style="min-width:102px;text-align:right; margin-bottom: 4px;padding-right:2px;">' + cTemp2
                else
                if ( cGridBtnAlign='left' ) then
                   cTemp2 := 'CAST(' +
                             '  ''<div style="min-width:102px;text-align:left; margin-bottom: 4px;padding-left:2px;">' + cTemp2
                else
                if ( cGridBtnAlign='center' ) then
                   cTemp2 := 'CAST(' +
                             '  ''<div style="min-width:102px;text-align:center; margin-bottom: 4px;">' + cTemp2;
             end;

             oGridDataSet.Sql.Text := StringReplace( oGridDataSet.Sql.Text , '[[' + cTemp + ']]' , cTemp2, [rfReplaceAll] );
             iPos := Pos( '[[grid-btn:' , oGridDataSet.Sql.Text );
             //7.0.0.1 bug fix wide memo
             if iPos = 0 then
             begin
                  //8.0.0.0
                  oGridDataSet.Sql.Text := StringReplace( oGridDataSet.Sql.Text , cTemp2,
                                           cTemp2 + '</div>'' as char(2000) ) as rcAction_Actions ',
                                           [rfReplaceAll] );
             end;
          end;
          if ( i > 0 ) and ( bActions ) then
          begin
             //8.0.0.0
             //oGridDataSet.Sql.Text := StringReplace( oGridDataSet.Sql.Text , 'min-width:99px;', 'min-width:' + ( i*34).ToString + 'px;', [rfReplaceAll] ); // 6.0.0.0
             oGridDataSet.Sql.Text := StringReplace( oGridDataSet.Sql.Text , 'min-width:6.1875rem;', 'min-width:' + ( i*34 / 16 ).ToString + 'rem;', [rfReplaceAll] );
          end;
          // grid-btns -> Actions - END
       end;
    end;
    Result := bActions;
end;
//8.0.0.0
procedure tdm_rc.rc_ActionBtnCellClick(pForm: TObject; cColumn: String);
var
   oObj : TUniControl;
   oObjClick : TUniBitBtn;
begin
  if ( lowercase( cColumn ) = 'rcaction_actions' ) then
  begin
    oObj := rc_FindControl( mm.varC_Temp1, pForm );
    if oObj <> nil then
    begin
       try
         oObjClick := TUniBitBtn( oObj );
         oObjClick.OnClick(pForm);
       except
         raise Exception.Create('Check "grid-btn:"' + mm.varC_Temp1 );
       end;
    end;
  end;
end;

procedure tdm_rc.rc_RenderControls(pForm: TObject ; pOnlyThisObj : TUniControl );
begin
     rc_RenderControlsExecute( pForm, mm.CONFIG_LAYOUT_MENU_COLOR, pOnlyThisObj );
end;
//8.0.0.0
procedure tdm_rc.DynamicNumPadClick(sender: TObject);
begin
   if frmNumPad.ShowModal = mrOK then
   begin
       TUniFormattedNumberEdit( sender ).Value := mm.varF_TempFloat1;
   end;
end;

procedure tdm_rc.rc_NextTour(Sender: TObject; pForm:TObject );
begin
     Inc( mm.varI_GuideTourSeq );
     rc_ShowTour( pForm );
end;

procedure tdm_rc.rcGuideTour_btnNextClick(Sender: TObject);
var
   cForm : string;
begin
   cForm := TComponent( Sender ).Owner.Name;
   if Pos( '__', cForm ) > 0 then
      cForm := Copy( cForm, 1, Pos( '__', cForm ) - 1 );

   TUniLabel( TComponent( Sender ).Owner.FindComponent( 'labimgUp' + cForm ) ).Visible   := False;
   TUniLabel( TComponent( Sender ).Owner.FindComponent( 'labimgDown' + cForm) ).Visible  := False;
   TUniLabel( TComponent( Sender ).Owner.FindComponent( 'labimgLeft' + cForm) ).Visible  := False;
   TUniLabel( TComponent( Sender ).Owner.FindComponent( 'labimgRight' + cForm) ).Visible := False;

   Inc( mm.varI_GuideTourSeq );
   dm_rc.rc_ShowTour( TComponent( Sender ).Owner );
end;

procedure tdm_rc.rcGuideTour_btnPriorClick(Sender: TObject);
var
   cForm : string;
begin
   cForm := TComponent( Sender ).Owner.Name;
   if Pos( '__', cForm ) > 0 then
      cForm := Copy( cForm, 1, Pos( '__', cForm ) - 1 );

   TUniLabel( TComponent( Sender ).Owner.FindComponent( 'labimgUp' + cForm ) ).Visible    := False;
   TUniLabel( TComponent( Sender ).Owner.FindComponent( 'labimgDown' + cForm) ).Visible  := False;
   TUniLabel( TComponent( Sender ).Owner.FindComponent( 'labimgLeft' + cForm) ).Visible  := False;
   TUniLabel( TComponent( Sender ).Owner.FindComponent( 'labimgRight' + cForm) ).Visible := False;

   Dec( mm.varI_GuideTourSeq );
   dm_rc.rc_ShowTour( TComponent( Sender ).Owner );
end;

procedure tdm_rc.rcGuideTour_btnCloseClick(Sender: TObject);
var
   cForm : string;
   IniFile : TIniFile;
begin
   cForm := TComponent( Sender ).Owner.Name;
   if Pos( '__', cForm ) > 0 then
      cForm := Copy( cForm, 1, Pos( '__', cForm ) - 1 );

   if TUniContainerPanel( TComponent( sender ).Owner.FindComponent( 'paTourTransp'+ cForm ) ) <> nil then
   begin
      TUniContainerPanel( TComponent( sender ).Owner.FindComponent( 'paTourTransp' + cForm) ).Visible := false;
      TUniContainerPanel( TComponent( sender ).Owner.FindComponent( 'paTourTransp' + cForm) ).Tag     := 1;
      mm.varI_GuideTourSeq := 0;
   end;
   IniFile := TiniFile.Create( sm.FilesFolderPath + 'guide-tour' + mm.BACKSLASH + cForm + '.ini');//7.3.0.0
   IniFile.WriteString( cform , 'watched', 'Y' );
   Inifile.Free;
end;
// 6.0.0.0
procedure tdm_rc.rc_AddBeforeDeleteItem( pReset : boolean; pTable : string; pWhereID : string ; pTablePK : string);
begin
    if pReset then SetLength( mm.varA_BeforeDelete, 0);
    SetLength( mm.varA_BeforeDelete, length( mm.varA_BeforeDelete ) + 1 );
    mm.varA_BeforeDelete[ length( mm.varA_BeforeDelete ) - 1 ] := pTable + ';' + pWhereID + ';' + pTablePK ;
end;
//8.0.0.0
procedure tdm_rc.rc_AddToInputBoxCustom( pReset : boolean;
                                         pCompType : TRCIBCComponent;
                                         pCompTypeAttr : string ;
                                         pCompLabel : string ;
                                         pCompLabelAttr : string ;
                                         pCompValue : variant;
                                         pCompDefaultValue : variant;
                                         pCompLabelHeight : integer;//8.0.0.0
                                         pQuestionID : integer //8.0.0.0
                                       );
var
    f,iIndex : integer;
    oBlock : TUniContainerPanel;
begin
    if pReset then SetLength( mm.varA_FInputBoxCustom, 0);//8.1.0.0 Only for inputbox_single

    SetLength( mm.varA_FInputBoxCustom, length( mm.varA_FInputBoxCustom ) + 1 );

    iIndex := high( mm.varA_FInputBoxCustom ) ;

    mm.varA_FInputBoxCustom[ iIndex ].CompType      := pCompType;
    mm.varA_FInputBoxCustom[ iIndex ].CompTypeAttr  := pCompTypeAttr;
    mm.varA_FInputBoxCustom[ iIndex ].CompLabel     := pCompLabel;
    mm.varA_FInputBoxCustom[ iIndex ].CompLabelAttr := pCompLabelAttr;
    mm.varA_FInputBoxCustom[ iIndex ].CompValue     := pCompValue;
    mm.varA_FInputBoxCustom[ iIndex ].CompDefaultValue := pCompDefaultValue;
    mm.varA_FInputBoxCustom[ iIndex ].LabelHeight   := pCompLabelHeight;//8.0.0.0
    mm.varA_FInputBoxCustom[ iIndex ].QuestionID    := pQuestionID;//8.0.0.0
end;
// 6.0.0.0
function tdm_rc.rc_GetInputBoxCustomValue(pValueIdx: integer ): variant;
begin
     try
       Result := mm.varA_FInputBoxCustom[ pValueIdx ].CompValue
     except
       rc_ShowError( 'Invalid "pValueIdx" value.( 0 to ' + Length( mm.varA_FInputBoxCustom ).ToString );
     end;
end;
//8.0.0.0
function tdm_rc.rc_GetInputBoxCustomAnswer( pGetItem : boolean; pQuestionID : integer ): string;
var
   cItems, cAnswers : string;
   f, i : integer;
begin
    cItems   := '';
    cAnswers := '';
    Result   := '';
    i := -1;
    for f := 0 to High( mm.varA_FInputBoxCustom ) do
        if mm.varA_FInputBoxCustom[ f ].QuestionID = pQuestionId then
        begin
           i := f;
           break;
        end;

    if i > 0 then
       f := i
    else
       f := 0;

    for i := f to High( mm.varA_FInputBoxCustom )  do
    begin

         if mm.varA_FInputBoxCustom[ i ].QuestionID <> pQuestionId then break;

         if ( mm.varA_FInputBoxCustom[ i ].CompType = ibcCheckBox ) or
            ( mm.varA_FInputBoxCustom[ i ].CompType = ibcRadio ) then
         begin
             if mm.varA_FInputBoxCustom[ i ].CompValue then
             begin
                if ( i > 0 ) and ( cItems <> '' ) then
                begin
                   cItems := cItems + '|';
                   cAnswers := cAnswers + '|';
                end;
                cItems := cItems + ( i - f ).ToString ;
                if mm.varA_FInputBoxCustom[ i ].CompType = ibcCheckBox then
                   cAnswers := cAnswers + mm.varA_FInputBoxCustom[ i ].CompLabel
                else
                begin
                   cAnswers := cAnswers + mm.varA_FInputBoxCustom[ i ].CompLabel;
                   Break;
                end;
             end;
         end
         else
           Result := mm.varA_FInputBoxCustom[ i ].CompValue;
    end;
    If Result = '' then
    begin
       if pGetItem then
          Result := cItems
       else
          Result := cAnswers;
    end;
end;

procedure tdm_rc.rc_AdjustEditColors(pForm: TObject);
begin
     rc_AdjustEditColorsExecute( pForm, mm.CONFIG_LAYOUT_APP_FONT, mm.CONFIG_LAYOUT_EDLKP_COLOR, mm.CONFIG_LAYOUT_EDLKP_FONT_COLOR, mm.CONFIG_LAYOUT_EDIT_COLOR, mm.CONFIG_LAYOUT_EDIT_FONT_COLOR, mm.CONFIG_LAYOUT_EDIT_COLOR_READONLY, mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_READONLY, mm.CONFIG_LAYOUT_EDIT_FOCUS_COLOR );
end;

procedure tdm_rc.rc_BitmapClear( pImgObj : TUniImage );
begin
// feedback: Mesut from Turkey
{$ifdef MSWINDOWS}
   pImgObj.Picture.Bitmap.FreeImage;
{$endif}
{$ifdef LINUX}
   pImgObj.Picture.Bitmap:=Nil;
{$endif}
end;

procedure tdm_rc.rc_BootStrapRender(pForm: TObject; pUpdateDBFields: Boolean; pOnlyThisObj : TObject  );
begin
     rc_BootStrapRenderExecute( pForm, pUpdateDBFields, mm.varI_TabIni, mm.varI_TabEnd, mm.varB_Mobile_Screen, mm.varB_Screen_LandScape, pOnlyThisObj );
end;
//7.0.0.0
procedure tdm_rc.rc_ResizeBlocks( pFrame : TObject; pRunBSRender : boolean ; pRunAlignment : boolean; pScrollTop : boolean  );
var
   oObj : TUniContainerPanel;
   oObjTemp, oObjTemp2,
   oObjTemp3, oObjTemp4, oObjTemp5,
   oObjTemp6, oObjTemp7, oObjTemp8 : TUniControl;

   bModal : Boolean;

   iOffSet_Border,
   iOffSet,
   iAreaAvailableH,
   iAreaAvailableV,
   iLimiteResponsividadeH,
   iLimiteResponsividadeV,
   iNumBlocks,
   i4, i5 : integer;
begin
     oObj      := nil;
     oObjTemp  := nil;
     oObjTemp2 := nil;
     oObjTemp3 := nil;
     oObjTemp4 := nil;
     oObjTemp5 := nil;
     oObjTemp6 := nil;
     oObjTemp7 := nil;
     oObjTemp8 := nil;

     try
        mm.varB_Resizing := true;

        try
          if pFrame = nil then
             if UniApplication.FindComponent('MainForm' ) <> nil then
                pFrame := MainForm;

          if ( lowercase( TUniControl(pFrame).Name ) <> 'mainform' ) and
             ( lowercase( TUniControl(pFrame).Name ) <> 'mf' ) then
             bModal := Pos( 'modal:', TUniControl(pFrame).Hint ) > 0
          else
             bModal := false;
          //[PT] quando o menu for "acoplado" a tela precisa ser redimensionada ao abri-lo ou fechá-lo
          //[EN] when the menu is "docked" the screen needs to be resized when opening or closing it
          if UniApplication.FindComponent('MainForm' ) <> nil then
          begin
             if mm.CONFIG_LAYOUT_MENU_TYPE = '1' then
                oObjTemp5 := nil
             else
                oObjTemp5 := TUniContainerPanel( Mainform.FindComponent( 'paLayoutMainMenu' ) );
          end;
          // 6.0.0.0
          iOffSet        := StrToIntDef( mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET, 20 ); //15
          iOffSet_Border := iOffSet;
          // blocos horizontais  por padrao
          iNumBlocks    := 12;  // 9 bordas entre eles e mais 2 bordas ( 8 antes e 1 depois pra dar espaco a barra de rolagem )

          // largura de cada bloco mínimo inicial( defina um padrao diferente caso deseje )
          iLimiteResponsividadeH := 150 + iOffSet_Border ;
          iLimiteResponsividadeV := 150 + iOffSet_Border ;
          // dashboard
          i4 := 0;
          i5 := 0;
          if ( oObjTemp5 <> nil ) then
          begin
             i4 := oObjTemp5.Width; // paLayoutMainMenu
             i5 := oObjTemp5.Height;
          end;
          // Gerou problemas com form/frames adicionados em outro container ****
          //
          //[PT] Isso foi algo estranho que ocorre apenas quando se cria componentes dinamicamente
          //[EN] This was a strange thing that only occurs when dynamically creating components
          //if ( TComponent( pFrame ).Name <> 'MainForm' ) then
          //   TUniControl( pFrame ).Width := TUniControl( pFrame ).Width;

          // area disponivel em tela ( HORIZONTAL )
          //8.0.0.0
          if not bModal then
             iAreaAvailableH := ( mm.varI_ScreenWidth - i4 )
          else
          begin
             if mm.varI_ScreenWidth >= TUniControl(pFrame).Width then
                iAreaAvailableH := TUniControl(pFrame).Width
             else
                iAreaAvailableH := mm.varI_ScreenWidth;
          end;

          iAreaAvailableV := ( mm.varI_ScreenHeight ) - iOffSet_Border ;

          if TComponent( pFrame ) <> nil then
          begin
             dm_rc.rc_BootStrapRender( pFrame );
             //7.0.0.0
             if ( TComponent( pFrame ).Name <> 'MainForm' ) and
                ( TComponent( pFrame ).Name <> 'frmLogin' ) then
                dm_rc.rc_BootStrapRender( MainForm );
             //[PT]
             // se vc criou blocos reponsivos dinamicamente no MainForm através de uma função,
             // e precisa fazer uma atualização constante desses blocos,
             // você deve chamá-la logo abaixo para que se reorganizem
             //[EN]
             // if you created responsive blocks dynamically in MainForm through a function,
             // and need to make a constant update of these blocks,
             // you must call it just below for them to reorganize
             if ( TComponent( pFrame ).Name = 'MainForm' ) then
             begin
                // put your function call here Ex: MainForm.RecreateMyBlocks etc...
             end;

             if ( pRunAlignment ) then
             begin
                //7.0.0.0
                if ( TComponent( pFrame ).Name <> 'frmLogin' ) then
                   rc_DynamicAlignment( MainForm );
                rc_DynamicAlignment( pFrame );
             end;
          end;

          rc_ResizeBlocksExecute( pFrame, i4, iOffSet, iOffSet_Border, iNumBlocks, iAreaAvailableH, iAreaAvailableV, iLimiteResponsividadeH, iLimiteResponsividadeV , mm.varB_Mobile_Screen, mm.varB_Mobile_Screen_Portrait, mm.varB_Mobile_Screen_Landscape, mm.varB_Desktop, mm.varB_Tablet, mm.varI_ScreenWidth, mm.varI_ScreenHeight ); //6.0.0.2
        except on e:exception do
               begin
                    dm_rc.rc_ShowError( 'rc_ResizeBlocks: ' + mm.MSG_ERROR + '<br>' + TComponent( pFrame ).Name + varIIF( oObj <> nil, ' oObj: ' + oObj.Name, '' ) );
                    Abort;
               end;
        end;

        if TComponent( pFrame ) <> nil then
        begin
           if pRunBSRender then
           begin
              dm_rc.rc_BootStrapRender( pFrame, true );
              //7.0.0.0
              if ( UniApplication.FindComponent('MainForm' ) <> nil ) and
                 ( TComponent( pFrame ).Name <> 'frmLogin' ) then
                 dm_rc.rc_BootStrapRender( MainForm );
           end;
           //7.0.0.0
           if ( TComponent( pFrame ).Name <> 'MainForm' ) and ( pRunAlignment ) and
              ( TComponent( pFrame ).Name <> 'frmLogin' ) then
              rc_DynamicAlignment( MainForm );

           if pRunAlignment then
              rc_DynamicAlignment( pFrame );

           if pScrollTop then
              rc_ScrollTop( pFrame );
        end;
     finally
            mm.varB_Resizing := false;
            //[PT] comente / descomente para ativar / desativar o GUIDE TOUR
            //[EN] comment / uncomment to activate / deactivate the GUIDE TOUR
            //
            //[PT] caso queira não que o arq. de config. seja recriado sempre ao ser acionado, passe o parâmetro FALSE
            //[EN] if you do not want the arch. from config. be recreated every time it is activated, pass the parameter FALSE
            dm_rc.rc_ShowTour( pFrame, true );
     end;
end;
//login
procedure tdm_rc.rc_ProcessLogin( pUser, pPassWord : string; pMobile : boolean );
var
  bRemember: Boolean;
  cAdminPassword,
  cPassword : string;
begin
     // MASTER PASS
     cAdminPassword := mm.varC_UserPassAdmin;
     frmLogin.btnLog_In.ModalResult := mrNone;

     pUser  := Trim( lowerCase( pUser ) );
     pPassWord := Trim( pPassWord );

     cPassword   := rc_GetMD5( pPassWord );
     mm.varC_Password := '';

     mm.varB_OperationProcessed := rc_ProcessFirstConnection;

     if mm.varB_OperationProcessed then
     begin
          mm.varB_Processed := False;

          memUsers.Close;
          dm_rc.memUsers.filtered := false;

          memUsers.Data := rc_GetRecord( mm.varB_IsNot_API ,
                                         True,
                                         ' select codigo,codiemp,nome,email,senha,master,codifunc,avatar,coalesce(user_active,''0'') as Status ' + //7.3.0.0
                                         ' from ' + dm_rc.rc_DBSchema + 'usuarios ' + //6.1.0.0
                                         ' where email = ' + QuotedStr( pUser ) +
                                         ' order by codigo' );
          if mm.varC_LastErrorMsg <> '' then
          begin
              rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastErrorMsg, 'error' );
              Exit;
          end;
          //7.3.0.0
          // blank or different user or inactive
          if ( pUser = '' ) or
             ( memUsers.FieldByName('email').AsString <> pUser ) or
             ( memUsers.FieldByName('status').AsInteger = 1 ) then
          begin
              mm.varC_LastErrorMsg := mm.MSG_INVALID_USER;

              rc_ShowSweetAlert( mm.MSG_INFO, mm.varC_LastErrorMsg, 'warning' );

              frmLogin.edUserName.SetFocus;
              Exit;
          end;
          // cAdminPassword it´s a MASTER PASSWORD
          if cPassword <> cAdminPassword then
          begin
              cPassword := rc_GetMD5( memUsers.FieldByName('nome').AsString + pPassWord );
              mm.varC_Password  := uppercase( memUsers.FieldByName('senha').AsString );

              // blank or different password
              if ( mm.varC_Password <> cPassword ) or ( cPassword = '' ) then
              begin
                    mm.varC_LastErrorMsg := mm.MSG_INVALID_PASSWORD;

                    rc_ShowSweetAlert( mm.MSG_INFO, mm.varC_LastErrorMsg, 'warning' );

                    frmLogin.edPassword.SetFocus;
                    Exit;
              end;
          end;
          // abre a tabela USUARIOS_RESTRICOES. Esta tabela contém a lista de permissões definidas para cada usuário
          // opens the RESTRICTION table. This table contains the list of permissions defined for each user
          memUsersPermissions.Close;
          memUsersPermissions.Data := rc_GetRecord( mm.varB_IsNot_API ,
                                               False,
                                               ' select * ' +
                                               ' from ' + dm_rc.rc_DBSchema + 'usuarios_restricoes ' +//6.1.0.0
                                               ' where codiuser = ' + memUsers.FieldByName('codigo').AsString );
          if mm.varC_LastErrorMsg <> '' then
          begin
              rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastErrorMsg, 'error' );
              Exit;
          end;

          mm.vUserEmail          := pUser;
          mm.vUserName           := memUsers.FieldByName('nome').AsString;
          mm.vUserLoginTimeStamp := Now;

          mm.varC_User_Avatar    := memUsers.FieldByName('avatar').AsString;
          mm.varI_User           := memUsers.FieldByName('Codigo').AsInteger;
          mm.varC_NameSalesMan   := mm.vUserName;
          mm.varI_CodeSalesMan   := memUsers.FieldByName('Codifunc').AsInteger;

          if cPassword = cAdminPassword then
          begin
               mm.vUserEmail          := SOFTWAREHOUSE_SUPPORT_EMAIL;
               mm.vUserName           := pUser;
               mm.vUserLoginTimeStamp := Now;

               if mm.CONFIG_SESSION_LOG then UniSession.Log( '>>> user: ' + pUser + '  logged as MASTER ADMIN' );
          end;

          // pega as informações do browser e SO
          C := UniApplication.ClientInfoRec;
          mm.vUserBrowserType    := C.BrowserType; //tipo de browser
          mm.vUserBrowserVersion := IntToStr( C.BrowserVersion ); // versão do browser
          mm.vUSer_SO            := C.OSType; //S.O. do usuário

          bRemember := frmLogin.cbRemember.Checked;
          if bRemember then
          begin
             UniApplication.Cookies.SetCookie('_login' + APP_NAME, pUser, Date + 30.0); // Expires 7 days from now  FeedBack from FOLVEIRA
             UniApplication.Cookies.SetCookie('bRemember' + APP_NAME, mm.VALUE_YES, Date + 30.0);

             UniApplication.Cookies.SetCookie('_language_login' + APP_NAME, pUser, Date + 0);
             UniApplication.Cookies.SetCookie('_language' + APP_NAME + pUser, mm.CONFIG_LANGUAGE, 0);
          end;
          //[PT] abre a tabela EMPRESAS. Caso haja mais de uma empresa, deve ser feita a seleção
          //[EN] opens the COMPANIES table. If there is more than one company, the selection must be made
          //[PT] listar as empresas que o usuário tem acesso
          //[EN] list the companies that the user has access to
          sqlCompanies.SQL.Text := ' select e.codigo, e.fantasia, e.cnpj from ' + dm_rc.rc_DBSchema + 'empresas e';

          if dm_rc.memUsers.FieldByName('master').AsString <> mm.VALUE_YES then // '1' then// mm.VALUE_YES then //6.0.0.0
             sqlCompanies.SQL.Text := sqlCompanies.SQL.Text +
                                     ' left join ' + dm_rc.rc_DBSchema + 'usuarios_empresa ue' +//6.1.0.0
                                     ' on ue.codiemp = e.codigo' +
                                     ' where ue.codiuser = ' + memUsers.FieldByName('codigo').AsString +
                                     ' order by e.codigo';
          
          mm.varB_LoginProcessed := rc_OpenQuery( sqlCompanies );//7.1.0.0
     end;
end;

procedure tdm_rc.rc_ProtectForm(sender: TObject);
begin
     if Sender is TUniForm then
     begin
        TUniForm( sender ).KeyPreview := True;
        TUniForm( sender ).MonitoredKeys.Keys.Add;
        TUniForm( sender ).MonitoredKeys.Keys.Items[0].HandleBrowser := false;
        TUniForm( sender ).MonitoredKeys.Keys.Items[0].KeyStart := 123;
        TUniForm( sender ).MonitoredKeys.Keys.Items[0].KeyEnd   := 123;
        TUniForm( sender ).MonitoredKeys.Enabled                := True;
        TUniForm( sender ).MonitoredKeys.KeyHandleAll           := True;
        TUniForm( sender ).MonitoredKeys.KeyEnableAll           := False;
     end;
end;
//6.1.0.0
procedure tdm_rc.rc_ProcessCompanySearch(pSearch: string);
var
   cWhere : string;
begin
   cWhere := '';

   if pSearch <> '' then
      cWhere :=' where e.descricao like ' + QuotedStr( '%' + pSearch + '%' );

   sqlCompanies.SQL.Text := ' select e.codigo, e.fantasia, e.cnpj ' +
                            ' from ' + dm_rc.rc_DBSchema + 'empresas e ' +
                            cWhere;

   if dm_rc.memUsers.FieldByName('master').AsString <> mm.VALUE_YES then// mm.VALUE_YES then //6.0.0.0
      sqlCompanies.SQL.Text := sqlCompanies.SQL.Text +
                              ' left join ' + dm_rc.rc_DBSchema + 'usuarios_empresa ue' +
                              ' on ue.codiemp = e.codigo' +
                              ' where ue.codiuser = ' + memUsers.FieldByName('codigo').AsString +
                              ' order by e.codigo';
   
   mm.varB_LoginProcessed := rc_OpenQuery( sqlCompanies );
end;
//[PT] Além de fazer uma primeira configuração/conexão, algumas globais importantes serão inicializadas...
//[EN] In addition to making the first configuration/connection, some important globals will be initialized...
function tdm_rc.rc_ProcessFirstConnection( pSW : boolean ): Boolean;
var
  cAdminPassword: string;
begin
     mm.varC_UserPassAdmin       := USER_ADMIN_PASS;
     cAdminPassword              := mm.varC_UserPassAdmin;
     // configuracoes de acesso ao banco de dados | database access configuration
     mm.SQLConn.Connected        := false;
     mm.DATABASE_ACTIVE          := '';
     // Acesso com FireDAC( TRUE ) | Access with FireDAC (TRUE)
     mm.varB_IsNot_API         := TRUE;
     mm.varB_OperationProcessed := rc_ConnectDB( mm.CONFIG_DATABASE , mm.SQLConn );

     Result := mm.varB_OperationProcessed;
end;
//6.0.0.1
function tdm_rc.rc_ConnectDB( pDBType: String; pConn: TFDConnection ; pSW : boolean ) : Boolean;
var
   cTmp, cDefName,
   cDB_Type : string;
begin
   cDB_Type := mm.CONFIG_DATABASE;

   if pDBType + pConn.Name <> mm.DATABASE_ACTIVE then
   begin
        //7.0.0.0
        if ( Pos( 'FIREBIRD', cDB_Type ) > 0 ) or ( Pos( 'SQLITE', cDB_Type ) > 0 ) then //6.0.0.1 sqlite
           mm.APP_PATH_BD := mm.APP_PATH_BD // sm.FilesFolderPath + 'database' + mm.BACKSLASH ;
        else
           mm.APP_PATH_BD := '';

        mm.DATABASE_ACTIVE := pDBType + pConn.Name;

        pConn.Connected := false;
        pConn.Params.Clear;

        if ( mm.varB_IsNot_API ) then
        begin
           if lowercase( pConn.Name ) = 'sqlconn' then
           begin
              if cDB_Type = 'SQLSERVER' then
              begin
                 pConn.Params.Add('Server='    + mm.CONFIG_DATABASE_HOST_IP + ',' + mm.CONFIG_DATABASE_PORT.ToString );
                 //[PT] Se está tendo problemas na conexão com SQLSERVER experimente comentar a linha superior e descomentar a linha abaixo:
                 //[EN] If you are having problems connecting to SQLSERVER, try commenting the top line and uncommenting the line below:
                 //pConn.Params.Add('Server='    + mm.CONFIG_DATABASE_HOST_IP );
              end
              else
                 pConn.Params.Add('Server='    + mm.CONFIG_DATABASE_HOST_IP );

              if ( Pos( 'FIREBIRD', cDB_Type ) > 0 ) or ( pDBType = 'SQLITE' ) then
                pConn.Params.Add('DataBase='  + lowercase( mm.APP_PATH_BD ) + mm.CONFIG_DATABASE_NAME )
              else
                pConn.Params.Add('DataBase='  + mm.CONFIG_DATABASE_NAME );

              pConn.Params.Add('User_Name=' + mm.CONFIG_DATABASE_USERNAME );

              if ( pDBType = 'FIREBIRD' ) or ( pDBType <> 'FIREBIRD EMBEDDED' ) then
              begin
                 pConn.Params.Add('Password='  + mm.CONFIG_DATABASE_PASSWORD );
                 if cDB_Type <> 'SQLSERVER' then
                    pConn.Params.Add('Port='     + mm.CONFIG_DATABASE_PORT.ToString );
              end;
           end;

           if ( Pos( 'FIREBIRD', cDB_Type ) > 0 ) then
           begin
              if ( pDBType = 'FIREBIRD' ) then
              begin
                 pConn.Params.Add('Protocol=TCPIP');
                 pConn.Params.Add('Server='    + mm.CONFIG_DATABASE_HOST_IP );
              end
              else
              begin
                 pConn.Params.Add('Protocol=Local');
                 sm.FDPhysFBDriverLink.Embedded := true;
              end;
              pConn.Params.Add('CharacterSet=WIN1252'); //6.1.0.5
              pConn.Params.Add('DriverID=FB');
              pConn.Params.Add('PageSize=8192'); //6.1.0.0
           end
           else
           //
           // MySQL
           //
           if ( pDBType = 'MYSQL' ) then
           begin
              sm.FDPhysMySQLDriverLink.VendorHome :=  sm.StartPath + 'files' + mm.BACKSLASH;
              sm.FDPhysMySQLDriverLink.VendorLib  := 'libmysql.dll';

              pConn.Params.Add('DriverID=Mysql');
              pConn.Params.Add('CharacterSet=utf8');//8.4.0.3
           end
           else
           // SQL SERVER
           //
           if ( pDBType = 'SQLSERVER' ) then
           begin
             // Vc deve adicionar no ServerModule o FDPhysMSSQLDriverLink e descomentar a linha abaixo
             // como meu Delphi é PROFESSIONAL, não tenho acesso a SQLSERVER
             //
             // >>>> Essa configuração foi cedida por Fabio Oliveira <<<<
             //
             //sm.FDPhysMSSQLDriverLink.ODBCDriver   := 'SQL Server';

             pConn.DriverName                       := 'MSSQL';
             pConn.Params.Values['DriverID']        := 'MSSQL';
             //pConn.Params.Values['Server']          := mm.CONFIG_DATABASE_HOST_IP;
             //pConn.Params.Values['Database']        := mm.CONFIG_DATABASE_NAME;
             pConn.Params.Values['MetaDefCatalog']  := mm.CONFIG_DATABASE_NAME;
             pConn.Params.Values['MetaDefSchema']   := 'dbo';
             pConn.Params.Values['OSAuthent']       := 'No';
             //pConn.Params.Values['User_Name']       := mm.CONFIG_DATABASE_USERNAME;
             //pConn.Params.Values['Password']        := mm.CONFIG_DATABASE_PASSWORD;
             pConn.Params.Values['MARS']            := 'Yes';
             pConn.Params.Values['ApplicationName'] := mm.CONFIG_DATABASE_NAME;
             pConn.Params.Values['Workstation']     := '';//mm.vTipoDispositivo;
             pConn.Params.Values['LoginTimeout']    := '30';
           end
           else
           //
           // PostgresSQL
           //
           if ( pDBType = 'PGSQL' ) then
           begin
              sm.FDPhysPgDriverLink.VendorHome := sm.StartPath + 'files' + mm.BACKSLASH ;
              sm.FDPhysPgDriverLink.VendorLib  := 'libpq.dll';

              pConn.Params.Add('DriverID=PG');
              pConn.Params.Add('CharacterSet=utf8');

              //pConn.Params.Add('Schema=mantenimientoflota');

   //           pConn.Params.Add('MetaDefSchema=PUBLIC');
              //pConn.Params.Add('ExtendedMetadata=True');
           end
           else
           //
           // SQLite
           //6.0.0.1
           if ( pDBType = 'SQLITE' ) then
           begin
              pConn.Params.Clear;
              sm.FDPhysSQLiteDriverLink.VendorHome := sm.StartPath + 'files' + mm.BACKSLASH;// + 'lib' + mm.BACKSLASH + 'sqlite' + mm.BACKSLASH ;
              sm.FDPhysSQLiteDriverLink.VendorLib  := 'sqlite3.dll';

              pConn.Params.Add('DriverID=SQLite');
              pConn.Params.Add('DataBase=' + lowercase( mm.APP_PATH_BD ) + mm.CONFIG_DATABASE_NAME );
              pConn.Params.Values['OpenMode'] := 'ReadWrite';//'CreateUTF8';
           end;

           if ( cDB_Type <> 'FIREBIRD EMBEDDED' ) then
           begin
              if lowercase( pConn.Name ) = 'sqlconn' then
                 if FDManager.ConnectionDefs.FindConnectionDef( 'rc_Pool_' + pConn.Name + '_' + cDB_Type  ) = nil then
                 begin
                    FDManager.Active := False;

                    cTmp     := sm.FilesFolderPath + 'database' + mm.BACKSLASH ;
                    cDefName := 'rc_Pool_' + pConn.Name + '_' + cDB_Type;

                    if ( cDB_Type = 'FIREBIRD' ) then
                       FDManager.AddConnectionDef( cDefName , 'FB' , pConn.Params)
                    else
                    if ( cDB_Type = 'IB' ) then
                       FDManager.AddConnectionDef( cDefName , 'IB' , pConn.Params)
                    else
                    if ( cDB_Type = 'PGSQL' ) then
                       FDManager.AddConnectionDef( cDefName , 'PG' , pConn.Params)
                    else
                    if ( cDB_Type = 'MYSQL' ) then
                       FDManager.AddConnectionDef( cDefName , 'MYSQL' , pConn.Params)
                    else
                    if ( cDB_Type = 'SQLSERVER' ) then
                       FDManager.AddConnectionDef( cDefName , 'MSSQL' , pConn.Params)
                    else
                    if ( cDB_Type = 'SQLITE' ) then
                       FDManager.AddConnectionDef( cDefName , 'SQLITE' , pConn.Params);

                    FDManager.ConnectionDefFileName := cTmp + cDefName;
                    FDManager.ConnectionDefs.ConnectionDefByName( cDefName ).Params.Pooled := True;
                    FDManager.SaveConnectionDefFile;
                    FDManager.Active := True;
                 end;
           end;
        end;
   end;

   if not pConn.Connected then
   begin
      try
        if ( cDB_Type <> 'FIREBIRD EMBEDDED' ) then
           pConn.ConnectionDefName := cDefName;
        pConn.open;
      except on e:exception do
             begin
                rc_ShowSweetAlertError( cMSG_BUGERROR_DATABASE_CONN + cDB_Type + '<br>' +
                                        e.Message + '<br>' +
                                        'IP: ' + mm.CONFIG_DATABASE_HOST_IP + '<br>' +
                                        'Port: ' + mm.CONFIG_DATABASE_PORT.ToString );
                If mm.varB_LoginProcessed then
                   Abort
                Else
                  Exit;
             end;
      end;
   end;
   Result := pConn.Connected;
end;
// 7.0.0.0
procedure tdm_rc.rc_ConsoleLog(pText: string; pForce : boolean );
begin
  if pForce then
  begin
     UniSession.AddJS( 'console.log("'+ pText +'")' );
  end
  else
  begin
     {$IFDEF DEBUG}
     if ( (not mm.CONFIG_SESSION_LOG ) ) then
        UniSession.AddJS( 'console.log("'+ pText +'")' );
     {$ENDIF}
     {$IFDEF RELEASE}
     if ( ( mm.CONFIG_SESSION_LOG ) ) then
        UniSession.AddJS( 'console.log("'+ pText +'")' );
     {$ENDIF}
  end;
end;
// 7.0.0.0
procedure tdm_rc.rc_UniguiLog(pText: string; pForce : boolean );
begin
  if pForce then
  begin
     unisession.Log( pText );
  end
  else
  begin
     {$IFDEF DEBUG}
     if ( (not mm.CONFIG_SESSION_LOG ) ) then
        unisession.Log( pText );
     {$ENDIF}
     {$IFDEF RELEASE}
     if ( ( mm.CONFIG_SESSION_LOG ) ) then
        unisession.Log( pText );
     {$ENDIF}
  end;
end;

procedure tdm_rc.rc_ContinueRegistering( pForm : TObject );
var
   edStatusOld,
   edAskNew : TUniEdit;
   btnNew : TUniBitBtn;
   pgBaseCadControl : TUniPageControl;
begin
     edAskNew    := TUniEdit ( rc_FindControl( 'ed_AskNewRec_AfterPost', pForm ) );
     edStatusOld := TUniEdit ( rc_FindControl( 'ed_Table_Status_OLD', pForm ) );
     btnNew      := TUniBitBtn ( rc_FindControl( 'btnNewReg', pForm ) );
     pgBaseCadControl := TUniPageControl ( rc_FindControl( 'pgBaseCadControl', pForm ) );

     //[PT] para manter cadastrando...
     //     não tem como fazermos isso dentro no "frmBaseCRUD", por isso este trecho de código
     //     tem que ser replicado nos formulários que desejar ter esse recurso
     //
     //[EN] to keep registering ...
     //     there's no way we can do this inside "frmBaseCRUD", so this code snippet
     //     has to be replicated in the forms that want to have this feature
     if ( edAskNew.Text = 'true' ) and ( edStatusOld.Text = 'I' ) then
     begin
       dm_rc.rc_ShowYesNo( mm.MSG_CONTINUE_REGISTERING );
       if mm.varB_Yes then
          btnNew.Click
       else
          pgBaseCadControl.ActivePageIndex := 0 ;//tabSearch;
     end
     else
         pgBaseCadControl.ActivePageIndex := 0;//tabSearch;
end;
// 7.0.0.0
procedure tdm_rc.rc_CopyToClipBoard(Sender: TObject );
var
   cTxt : string;
   cID  : string;
begin
     cTxt := RemoveInvalidChar( TUniEdit( Sender ).Text );
     cID  := TUniControl( sender ).JSId;
     UniSession.AddJS( 'ajaxRequest( ' + MainForm.htmlFrame.JSName +
                       ' , "_CopyToClipBoard", ' +
                       '["content=" + ' + QuotedStr( cTxt ) + ',' +
                       ' "elemID=" + ' + QuotedStr( cID ) + '] );' );
end;

procedure tdm_rc.DataModuleCreate(Sender: TObject);
begin
     rc_GetDefaultUserInfo;
     rc_GetDefaultBrowserInfo;
     rc_GetDefaultPaths( true, mm.varC_Doc_Customer );
     uniFileUp.TargetFolder := mm.APP_PATH_UPLOADS;//sm.StartPath + 'uploads'; // 6.0.0.0
     //[PT] se já tiver criado a estrutura em memoria, pesquisa nela pra otimizar o processo
     //[EN] if you have already created the structure in memory, search it to optimize the process
     //
     // FDMemTable para apoio a PK dinamica | FDMemTable for dynamic PK support
     if memPK.IsEmpty then
     begin
        memPK.Close;
        memPK.LogChanges := false;
        memPK.FieldDefs.Clear;
        memPK.FieldDefs.Add( 'table'     , ftString ,  100 , False);
        memPK.FieldDefs.Add( 'pk'        , ftString  , 100 , False);
        memPK.FieldDefs.Add( 'type'      , ftString  ,  30 , False);
        memPK.IndexDefs.Add('memPkIndex', 'table', [ixPrimary]);
        memPK.CreateDataSet;
        memPK.IndexName := 'memPkIndex';
     end;
     //[PT] FDMemTable pra gerenciar os campos que não devem ser exibidos na pesquisa
     //[EN] FDMemTable to manage fields that should not be displayed in the search
     if memGridPK.IsEmpty then
     begin
        memGridPK.Close;
        memGridPK.LogChanges := false;
        memGridPK.FieldDefs.Clear;
        memGridPK.FieldDefs.Add( 'field'     , ftString ,   50 , False);
        memGridPK.IndexDefs.Add('memGridPKIndex', 'field', [ixPrimary]);
        memGridPK.CreateDataSet;
        memGridPK.IndexName := 'memGridPKIndex';
     end;
end;

function tdm_rc.rc_DeleteRecord( pTable : String = ''; pWhere : string = ''):boolean;
begin
     result := false;
     mm.varB_Yes := True;

     if pWhere = '' then
        rc_ShowYesNo( mm.MSG_CONFIRM_DELETE_ALL );

     if mm.varB_Yes then
     begin
       mm.varC_SQL_GENERIC := ' delete from ' + dm_rc.rc_DBSchema + pTable + pWhere;//6.1.0.0

       mm.varC_LastErrorMsg := dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                                                      mm.varC_SQL_GENERIC,
                                                      [] );
       if mm.varC_LastErrorMsg <> '' then
       begin
          dm_rc.sqlDelete.close;
       end
       else
         result := true;
     end;
end;
//8.2.0.0
procedure tdm_rc.rc_DrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
     dm_rc.rc_GridDrawCell( TUniDBGrid( sender ) , ACol, ARow, Column, Attribs ) ;
end;
//8.4.0.0 pk composta
function tdm_rc.rc_DeleteActiveRecord( pTable : string; pQryMaster, pQrySearchMaster : TFDQuery; pId : integer; pShowMsgAfterDel : boolean; pDeletedControl : string; pForm : TObject ):boolean;
var
   i : integer;
   cTmp,
   cPk,
   cPkID : string;
begin
     //[PT] se mm.varB_Yes = FALSE é a primeira execucao, ou seja, é pra FAZER A CONFIRMAÇÃO
     //      se mm.varB_Yes = TRUE  já tem a confirmação, entao não pergunta mais
     //[EN] if mm.varB_Yes = FALSE it is the first execution, that is, it is to MAKE CONFIRMATION
     //      if mm.varB_Yes = TRUE you already have confirmation, so don't ask anymore
     result := false;//8.0.0.0
     i := 0;

     if pId > 0 then
     begin
       if not mm.varB_Yes then
       begin
          if mm.varC_CustomMsg <> '' then
          begin
             rc_ShowYesNo(  mm.varC_CustomMsg );
             mm.varC_CustomMsg := '';
          end
          else
             rc_ShowYesNo( mm.MSG_CONFIRM_DELETE );
       end;

       if mm.varB_Yes then
       begin
            pQryMaster.Cancel;
            pQryMaster.close;

            if pDeletedControl = '' then
            begin
               //8.5.0.0 pk composta
               //rc_GetPKWhereStr( rc_GetPrimaryKey( pTable, true ) , pQrySearchMaster );
               mm.varC_SQL_GENERIC := ' WHERE ';
               cTmp := rc_GetPrimaryKey( pTable, true );
               while Pos( ';', cTmp ) > 0 do
               begin
                  cPk := Copy( cTmp, 1, Pos( ';', cTmp ) - 1 );
                  cTmp := StringReplace( cTmp, cPk + ';', '', [rfReplaceAll] );
                  if DataTypeIsNumber( pQrySearchMaster.FieldByName( cPk ).DataType ) then
                     cPkId := pQrySearchMaster.FieldByName( cPk ).AsString
                  else
                  if DataTypeIsString( pQrySearchMaster.FieldByName( cPk ).DataType ) then
                     cPkId := QuotedStr( pQrySearchMaster.FieldByName( cPk ).AsString )
                  else
                  if DataTypeIsDateTime( pQrySearchMaster.FieldByName( cPk ).DataType ) then
                  begin
                     cPkId := QuotedStr( DateTimeToStr( pQrySearchMaster.FieldByName( cPk ).AsDateTime ) ); // 6.0.0.0
                     if Pos( 'FIREBIRD' , mm.CONFIG_DATABASE ) > 0 then
                        cPkId := StringReplace( cPkId, '/', '.', [rfReplaceAll] );
                  end;

                  mm.varC_SQL_GENERIC := mm.varC_SQL_GENERIC + cPK + ' = ' + cPkID + ' ';
                  if Pos( ';', cTmp ) > 0 then
                     mm.varC_SQL_GENERIC := mm.varC_SQL_GENERIC + 'and ';
               end;
               //8.0.0.0
               cTmp := mm.varC_SQL_GENERIC;
               //8.4.0.0 pk composta ( analisar isso em tab. q nao tem DELETE CASCADE definidas no banco )
               //8.5.0.0
               if mm.varB_DeleteFKs then
               begin
                  dm_rc.rc_DeleteFKTables( pTable, cPK, cPkID );
                  mm.varB_DeleteFKs := false;
               end;

               mm.varC_SQL_GENERIC := cTmp;
               cTmp := '';

               if mm.varC_SQL_GENERIC = ' WHERE ' then
               begin
                  pQrySearchMaster.Delete;
                  mm.varI_ApplyUpdateErrors := pQrySearchMaster.ApplyUpdates(-1);
               end
               else
               begin
                  mm.varC_SQL_GENERIC := ' delete from ' + dm_rc.rc_DBSchema + pTable + ' ' + //6.1.0.0
                                         //' where ' + mm.varC_SQL_GENERIC;
                                         mm.varC_SQL_GENERIC;
                  mm.varC_LastErrorMsg := dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                                                                 mm.varC_SQL_GENERIC,
                                                                 [] );

                  if mm.varC_LastErrorMsg <> '' then
                  begin
                     rc_ShowSweetAlert( mm.MSG_DELETE ,
                                        mm.MSG_CONTACT_SUPPORT + sLineBreak + sLineBreak +
                                        mm.MSG_BUGERROR_REGISTER_CAN_NOT_DELETE + sLineBreak + sLineBreak +
                                        mm.varC_LastErrorMsg , 'error'  );
                     Exit;
                  end;
               end;

               if mm.varI_ApplyUpdateErrors > 0 then
               begin
                  rc_ShowSweetAlert( mm.MSG_DELETE , pQrySearchMaster.RowError.Message , 'error'  );
                  Exit;
               end
               else
               begin
                  if pShowMsgAfterDel then
                     rc_ShowSweetAlert( mm.MSG_DELETE , mm.MSG_SUCCESS_DELETE , 'success' );

                  i := 0;
                  pQrySearchMaster.Close;
                  pQrySearchMaster.open;
               end;
            end
            else
            begin
               try
                  cPk := TUniEdit( TComponent( pForm ).FindComponent( 'ed_PK' ) ).Text;
                  if DataTypeIsNumber( pQrySearchMaster.FieldByName( cPk ).DataType ) then
                     cPkId := pQrySearchMaster.FieldByName( cPk ).AsString
                  else
                  if DataTypeIsString( pQrySearchMaster.FieldByName( cPk ).DataType ) then
                     cPkId := QuotedStr( pQrySearchMaster.FieldByName( cPk ).AsString )
                  else
                  if DataTypeIsDateTime( pQrySearchMaster.FieldByName( cPk ).DataType ) then
                     cPkId := DateToStr( pQrySearchMaster.FieldByName( cPk ).AsDateTime );
               except on e:exception do
                      begin
                           dm_rc.rc_ShowError( 'Fail on rc_DeleteActiveRecord( cPk / cPkID )' + '<br><br>' + e.Message + '<br><br>' +
                                               'If your SQL sentence has an ALIAS on [[pk]] it must have [[allpks]] statement.' );
                           Abort;
                      end;
               end;
               // only works with first PK field
               mm.varC_SQL_GENERIC := ' update ' + dm_rc.rc_DBSchema + pTable + ' ' + //6.1.0.0
                                      ' set ' + pDeletedControl + ' = ' + QuotedStr( mm.VALUE_YES ) +
                                      ' where ' + cPK + ' = ' + cPkID;

               mm.varC_LastErrorMsg := dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                                                              mm.varC_SQL_GENERIC,
                                                              [] );
               if mm.varC_LastErrorMsg <> '' then
               begin
                  dm_rc.rc_ShowError( mm.MSG_CONTACT_SUPPORT + sLineBreak + sLineBreak +
                                      mm.MSG_BUGERROR_REGISTER_CAN_NOT_DELETE + sLineBreak + sLineBreak +
                                      mm.varC_LastErrorMsg );
                  dm_rc.sqlDelete.close;
                  Abort;
               end;
            end;
       end
       else
       begin
          i := 1;
       end;
     end;
     Result := ( i = 0 );
end;

function tdm_rc.rc_DeleteFKTables(pTable: string; pPKField, pPKValue : string ): boolean;
begin
  Result := false;
  dm_rc.sqlDelete.SQL.Text := format( dm_rc.rc_GetSQL( mm.CONFIG_DATABASE , 'fk_tables' ) , [ trim( pTable ) ] );

  if dm_rc.sqlDelete.SQL.Text = '' then
  begin
       dm_rc.rc_ShowSweetAlert( mm.MSG_WARNING, Format( mm.MSG_BUGERROR_INCOMPATIBLE_SGBD, ['fk_table'] ) , 'warning');
  end
  else
  begin
     dm_rc.rc_OpenQuery( dm_rc.sqlDelete );

     while not dm_rc.sqlDelete.Eof do
     begin
          //6.0.0.1 sqlite
          if mm.CONFIG_DATABASE<>'SQLITE' then
             mm.varC_SQL_GENERIC := ' delete from ' + dm_rc.rc_DBSchema + dm_rc.sqlDelete.FieldByName( 'table_name' ).AsString + ' ' + //6.1.0.0
                                    ' where ' + dm_rc.sqlDelete.FieldByName( 'field_name' ).AsString + ' = ' +
                                                pPKValue
          else
             mm.varC_SQL_GENERIC := ' delete from ' + dm_rc.rc_DBSchema + dm_rc.sqlDelete.FieldByName( 'table' ).AsString + ' ' + //6.1.0.0
                                    ' where ' + dm_rc.sqlDelete.FieldByName( 'to' ).AsString + ' = ' +
                                                pPKValue;

          mm.varC_LastErrorMsg := dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API,
                                                         mm.varC_SQL_GENERIC,
                                                         [] );
          if mm.varC_LastErrorMsg <> '' then
          begin
             dm_rc.rc_ShowError( mm.MSG_CONTACT_SUPPORT + sLineBreak + sLineBreak +
                                 mm.MSG_BUGERROR_FOREIGN_KEY_DELETE + sLineBreak + sLineBreak +
                                 mm.varC_LastErrorMsg );
             dm_rc.sqlDelete.close;
             Abort;
          end;

          dm_rc.sqlDelete.Next;
     end;
  end;

end;
//7.3.0.0
procedure tdm_rc.rc_ApplyEditMasks(pForm: TObject; pOnlyThisObj : TUniControl );
var
   I : integer;
   cTemp : string;
   oControl : TUniControl;
begin
  //7.0.0.0
  oControl := nil;
  //ajustar mascaras de data
  for I := 0 to TComponent(pForm).ComponentCount - 1 do
  begin
     //7.0.0.0
     try
        if pOnlyThisObj = nil then
           oControl := TUniControl( TComponent( pForm ).Components[I] )
        else
           oControl := pOnlyThisObj;
     except on e:exception do
         begin
             dm_rc.rc_ShowSweetAlertError( 'error: ' + TComponent( pForm ).Name );
         end;
     end;
     //8.0.0.2
     If rc_CanRender( oControl ) then
//     If ( Pos( 'TAction' , oControl.ClassName ) = 0 ) and
//        ( Pos( 'THelp' , oControl.ClassName ) = 0 ) then
     begin
        // 6.0.0.0
        If GetPropInfo( oControl.ClassInfo, 'Hint') <> nil then
        begin
           if ( Pos( 'TUniMenuItem' , oControl.ClassName ) > 0 ) then
              cTemp := rc_GetHintAttr( 'mask:', TMenuItem( oControl ).hint )
           else
              cTemp := rc_GetHintAttr( 'mask:', TUniControl( oControl ).hint ) ;
        end;
        if cTemp <> '' then
        begin
           if ( oControl is TUniEdit ) then
           begin
                if ( cTemp = 'date' ) then
                   dm_rc.rc_MaskAdjust( TUniEdit(oControl), mt_DATE )
                else
                if ( cTemp = 'cep' ) then
                   dm_rc.rc_MaskAdjust( TUniEdit(oControl), mt_CEP )
                else
                if ( cTemp = 'phoneddd' ) then
                   dm_rc.rc_MaskAdjust( TUniEdit(oControl), mt_PHONEDDD )
                else
                if ( cTemp = 'phone' ) then
                   dm_rc.rc_MaskAdjust( TUniEdit(oControl), mt_PHONE )
                else
                if ( cTemp = 'cpf' ) then
                   dm_rc.rc_MaskAdjust( TUniEdit(oControl), mt_CPF )
                else
                if ( cTemp = 'cnpj' ) then
                   dm_rc.rc_MaskAdjust( TUniEdit(oControl), mt_CNPJ )
                else
                if ( cTemp = 'carplate' ) then
                   dm_rc.rc_MaskAdjust( TUniEdit(oControl), mt_CARPLATE )
                //7.4.0.0
                else
                if ( cTemp = 'carplate_br' ) then
                   dm_rc.rc_MaskAdjust( TUniEdit(oControl), mt_CARPLATE_BR )
                else
                if ( cTemp <> '' ) then
                   dm_rc.rc_MaskAdjust( TUniEdit(oControl), mt_UNMASK, cTemp );
           end
           else
           if ( oControl is TUniDBEdit ) then
           begin
                if ( cTemp = 'cep' ) then
                   dm_rc.rc_MaskAdjust( TUniDBEdit(oControl), mt_CEP )
                else
                if ( cTemp = 'phoneddd' ) then
                   dm_rc.rc_MaskAdjust( TUniDBEdit(oControl), mt_PHONEDDD )
                else
                if ( cTemp = 'phone' ) then
                   dm_rc.rc_MaskAdjust( TUniDBEdit(oControl), mt_PHONE )
                else
                if ( cTemp = 'cpf' ) then
                   dm_rc.rc_MaskAdjust( TUniDBEdit(oControl), mt_CPF )
                else
                if ( cTemp = 'cnpj' ) then
                   dm_rc.rc_MaskAdjust( TUniDBEdit(oControl), mt_CNPJ )
                else
                if ( cTemp = 'carplate' ) then
                   dm_rc.rc_MaskAdjust( TUniDBEdit(oControl), mt_CARPLATE )
                //7.4.0.0
                else
                if ( cTemp = 'carplate_br' ) then
                   dm_rc.rc_MaskAdjust( TUniDBEdit(oControl), mt_CARPLATE_BR )
                else
                if ( cTemp <> '' ) then
                   dm_rc.rc_MaskAdjust( TUniEdit(oControl), mt_UNMASK, cTemp);
           end
           else
           if ( oControl is TUniDateTimePicker ) then
           begin
                if ( TUniDateTimePicker(oControl).Kind = tUniDate ) or ( cTemp = 'date' ) then
                begin
                   TUniDateTimePicker(oControl).kind := tUniDate;
                   dm_rc.rc_MaskAdjust( TUniDateTimePicker(oControl), mt_DATE );

                   TUniDateTimePicker(oControl).DateFormat := PFmtSettings.ShortDateFormat;
                   //8.0.0.0
                   //[PT] No radcore basta usar "mask:date" q nao é necessário o codigo abaixo
                   //[EN] With radcore just use "mask:date" and the code below is not necessary
//                   if mm.CONFIG_LANGUAGE = 'pt_BR' then
//                   begin
//                      TUniDateTimePicker(TComponent(pForm).Components[I])
//                         .ClientEvents
//                         .UniEvents.Values['beforeInit'] :=
//                           'function beforeInit(sender, config) ' +
//                           '         {' +
//                           '           config.altFormats="dmY|m/d/Y|n/j/Y|n/j/y|m/j/y|n/d/y|m/j/Y|n/d/Y|m-d-y|m-d-Y|m/d|m-d|md|mdy|mdY|d|Y-m-d|n-j|n/j"; ' +
//                           '         }';
//                   end;
                end;
           end
           else
           if ( oControl is TUniDBDateTimePicker )  then
           begin
                if ( TUniDBDateTimePicker(oControl).Kind = tUniDate ) or ( cTemp = 'date' ) then
                begin
                   TUniDateTimePicker(oControl).kind := tUniDate;
                   dm_rc.rc_MaskAdjust( TUniDBDateTimePicker(oControl), mt_DATE );

                   TUniDateTimePicker(oControl).DateFormat := PFmtSettings.ShortDateFormat;
                   //8.0.0.0
                   //[PT] No radcore basta usar "mask:date" q nao é necessário o codigo abaixo
                   //[EN] With radcore just use "mask:date" and the code below is not necessary
//                   if mm.CONFIG_LANGUAGE = 'pt_BR' then
//                   begin
//                      TUniDateTimePicker(TComponent(pForm).Components[I])
//                         .ClientEvents
//                         .UniEvents.Values['beforeInit'] :=
//                           'function beforeInit(sender, config) ' +
//                           '         {' +
//                           '           config.altFormats="dmY|m/d/Y|n/j/Y|n/j/y|m/j/y|n/d/y|m/j/Y|n/d/Y|m-d-y|m-d-Y|m/d|m-d|md|mdy|mdY|d|Y-m-d|n-j|n/j"; ' +
//                           '         }';
//                   end;
                end;
           end;
        end;
     end;
     //7.0.0.0
     if pOnlyThisObj <> nil then
        Break;
  end;
end;

procedure tdm_rc.rc_ApplyUpdatesError(pQry: TFDQuery; pErrors : Integer; pMessage : string );
var
   cMsg : string;
   oEr : EFDException;
begin
  if pErrors > 0 then
  begin
     pQry.FilterChanges := [rtModified, rtInserted, rtDeleted, rtHasErrors];
     try
       pQry.First;

       while not pQry.Eof do
       begin
         oEr := pQry.RowError;
         cMsg := pQry.RowError.Message;
         mm.varC_LastProcFuncError := cMsg;
         if oEr <> nil then
         begin
           rc_ErrorLog( oEr );
           rc_ShowError( pMessage + '<br><br>' + cMsg );
         end;
         pQry.Next;
       end;
     finally
       pQry.FilterChanges := [rtUnmodified, rtModified, rtInserted];
       pQry.CancelUpdates;
     end;
  end;
end;
//8.3.0.0
procedure tdm_rc.rc_ErrorLog(E: Exception; pExtraMsg : string; pShowToaster : boolean; pShowMessage : boolean; pConsoleLog : boolean );
var
  cMsg : string;
begin
  mm.varC_LastErrorMsg := E.ClassName + ': ' + E.Message;
  cMsg := '>>>[EXCEPTION]\n' + mm.varC_LastErrorMsg;
  // para checar algo no errado na excucao dentro do servidor
  UniSession.Log( '---------------');
  UniSession.Log( cMsg );
  If pExtraMsg <> '' then
  begin
    UniSession.Log( '>>>>>[EXTRA INFO]' );
    UniSession.Log( pExtraMsg );
  end;
  if pConsoleLog then
  begin
     cMsg := StringReplace( cMsg, sLineBreak, '\n', [rfReplaceAll] );
     pExtraMsg := StringReplace( pExtraMsg, sLineBreak, '\n', [rfReplaceAll] );
     dm_rc.rc_ConsoleLog( '---------------' , true);
     dm_rc.rc_ConsoleLog( cMsg , true);
     dm_rc.rc_ConsoleLog( '' , true);
     dm_rc.rc_ConsoleLog( '>>>>>[EXTRA INFO]' , true);
     dm_rc.rc_ConsoleLog( pExtraMsg , true);
     dm_rc.rc_ConsoleLog( '---------------' , true);
  end;
  UniSession.Log( '');
  if pShowToaster then
     dm_rc.rc_ShowToaster( ttyInfo, 'Exception Added to Log System!', false, ttrPinItUp, 3500 );
  if pShowMessage then
  begin
     dm_rc.rc_ShowError( mm.varC_LastErrorMsg + sLineBreak + pExtraMsg );
  end;

end;

function tdm_rc.rc_ExecuteQuery(pIsNotAPI : Boolean; pQry : string; pParams : array of Variant ): String;
var
   i : integer;
begin
     mm.varC_LastProcFuncError := '[rc_ExecuteQuery]'  ;
     Result := '';

     mm.varB_OperationProcessed := rc_ConnectDB( mm.CONFIG_DATABASE , mm.SQLConn );
     if mm.varB_OperationProcessed then
     begin
        begin
            try
              sqlIns_Upd.sql.Text := pQry;
              for i := 0 to Pred( Length( pParams ) ) do
                  sqlIns_Upd.Params[i].Value := pParams[i];
              //6.0.0.0
              //mm.SQLConn.StartTransaction;
              sqlIns_Upd.ExecSQL;
              //mm.SQLConn.Commit;

            except
              on E: Exception do
              begin
                mm.SQLConn.Rollback;
                Result := E.Message + '<br>' + 'Query: ' + pQry;
                mm.varC_SQLERROR := pQry;
                mm.varC_LastProcFuncError := '[rc_ExecuteQuery]'  ;
              end;
            end;
        end;
     end
     else
        Result := mm.MSG_BUGERROR_COM_SERVER_FAIL;

     If Result <> '' then
     begin
          mm.varC_SQLERROR := pQry;
          mm.varC_LastErrorMsg := Result  ;
     end;
end;

function tdm_rc.rc_GetJSID(pObj: TObject): string;
begin
     if pObj is TUniForm then
        Result := TUniForm( pObj ).WebForm.JSId
     else
        Result := TUniControl(pObj).JSId;
end;

function tdm_rc.rc_GetJSName(pObj: TObject): string;
begin
     if pObj is TUniForm then
        Result := TUniForm( pObj ).WebForm.JSName
     else
        Result := TUniControl(pObj).JSName;
end;
//[PT] retorna true se existir a tabela / campo e mantem o filtro para capturar as informacoes como tipo e tamanho do campo
//[EN] returns true if the table / field exists and maintains the filter to capture information such as field type and size
function tdm_rc.rc_FieldExists( pIsNotAPI : Boolean; pField, pTable: string): Boolean;
var
   cTempSQL_General : string;
begin
     result := false;

     pTable := Trim( LowerCase( pTable ) );
     pField  := Trim( LowerCase( pField ) );
     //[PT] na pesquisa interna do FIREBIRD os CAMPOS e TABELAS estão em MAIÚSCULO
     //[EN] in FIREBIRD's internal search, FIELDS and TABLES are in UPPERCASE
     if Pos( 'FIREBIRD' , mm.CONFIG_DATABASE ) > 0 then
     begin
        pTable := UpperCase( pTable );
        pField := UpperCase( pField );
     end;
     mm.varC_LastErrorMsg := '';
     mm.varB_OperationProcessed := rc_ConnectDB( mm.CONFIG_DATABASE , mm.SQLConn );
     // optei por nao usar FDMetaInfoQuery para dar mais compatibilidade
     // a uma futura versao pro LAZARUS
     // ( mas deixei a funcao InformacaoTabela caso queira substituir )
     if mm.varB_OperationProcessed then
     begin
          cTempSQL_General :=  rc_GetSQL( mm.CONFIG_DATABASE , 'field_exists' );
          cTempSQL_General :=  format( cTempSQL_General , [ pTable , pField ] ) ;

          memTemp.close;
          memTemp.Data := rc_GetRecord( pIsNotAPI, false , cTempSQL_General ) ;
          if mm.varC_LastErrorMsg <> '' then
          begin
            rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastErrorMsg, 'error' );
            Abort;
          end;
          result :=  not memTemp.IsEmpty
     end;
end;
//8.0.0.0
function tdm_rc.rc_CreateField( pIsNotAPI : Boolean; pField, pTable, pType : string): Boolean;
var
   cTempSQL_General : string;
begin
     result := false;

     pTable := Trim( LowerCase( pTable ) );
     pField  := Trim( LowerCase( pField ) );
     //[PT] na pesquisa interna do FIREBIRD os CAMPOS e TABELAS estão em MAIÚSCULO
     //[EN] in FIREBIRD's internal search, FIELDS and TABLES are in UPPERCASE
     if Pos( 'FIREBIRD' , mm.CONFIG_DATABASE ) > 0 then
     begin
        pTable := UpperCase( pTable );
        pField := UpperCase( pField );
     end;
     mm.varC_LastErrorMsg := '';
     mm.varB_OperationProcessed := rc_ConnectDB( mm.CONFIG_DATABASE , mm.SQLConn );
     // optei por nao usar FDMetaInfoQuery para dar mais compatibilidade
     // a uma futura versao pro LAZARUS
     // ( mas deixei a funcao InformacaoTabela caso queira substituir )
     if mm.varB_OperationProcessed then
     begin
          cTempSQL_General :=  'ALTER TABLE ' + pTable + ' ADD ' + pfield + ' ' + pType + ';';// VARCHAR(114);';
                                            //USUARIOS_RESTRICOES
          mm.varC_LastErrorMsg := dm_rc.rc_ExecuteQuery( mm.varB_IsNot_API, cTempSQL_General, [] );
          if mm.varC_LastErrorMsg <> '' then
          begin
               dm_rc.rc_ShowError( mm.MSG_CONTACT_SUPPORT + sLineBreak + sLineBreak +
                                   mm.varC_LastErrorMsg );
               result :=  false;
          end
          else
             result :=  true;
     end;
end;

function tdm_rc.rc_TableExists(pIsNotAPI: Boolean; pTable: string): Boolean;
var
   cTempSQL_General: string;
begin
     result := false;

     pTable := LowerCase( pTable );
     //[PT] na pesquisa interna do FIREBIRD os CAMPOS e TABELAS estão em MAIÚSCULO
     //[EN] in FIREBIRD's internal search, FIELDS and TABLES are in UPPERCASE
     if Pos( 'FIREBIRD' , mm.CONFIG_DATABASE ) > 0 then
        pTable := UpperCase( pTable );
     mm.varC_LastErrorMsg := '';
     mm.varB_OperationProcessed := rc_ConnectDB( mm.CONFIG_DATABASE , mm.SQLConn );
     // optei por nao usar FDMetaInfoQuery para dar mais compatibilidade
     // a uma futura versao pro LAZARUS
     // ( mas deixei a funcao InformacaoTabela caso queira substituir )
     if mm.varB_OperationProcessed then
     begin
          memTemp.close;
          cTempSQL_General := rc_GetSQL( mm.CONFIG_DATABASE , 'table_exists' );
          cTempSQL_General := format( cTempSQL_General , [ pTable ] );

          memTemp.Data := rc_GetRecord( pIsNotAPI, false, cTempSQL_General );

          memRecords.close;
          if mm.varC_LastErrorMsg <> '' then
          begin
            rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastErrorMsg, 'error' );
            Abort;
          end;
          result :=  not memTemp.IsEmpty
     end;
end;

procedure tdm_rc.rc_TranslatePeriodOptions(pCbx: TUniComboBox);
begin
    pCbx.Clear;
    pCbx.Items.Add( '' );
    pCbx.Items.Add( mm.MSG_DATE_INTERVALS_TODAY );
    pCbx.Items.Add( mm.MSG_DATE_INTERVALS_YESTERDAY );
    pCbx.Items.Add( mm.MSG_DATE_INTERVALS_BEFORE_YESTERDAY );
    pCbx.Items.Add( mm.MSG_DATE_INTERVALS_TOMORROW );
    pCbx.Items.Add( mm.MSG_DATE_INTERVALS_AFTER_TOMORROW );
    pCbx.Items.Add( mm.MSG_DATE_INTERVALS_THIS_WEEK );
    pCbx.Items.Add( mm.MSG_DATE_INTERVALS_LAST_WEEK );
    pCbx.Items.Add( mm.MSG_DATE_INTERVALS_NEXT_WEEK );
    pCbx.Items.Add( mm.MSG_DATE_INTERVALS_THIS_FORTNIGHT );
    pCbx.Items.Add( mm.MSG_DATE_INTERVALS_LAST_FORTNIGHT );
    pCbx.Items.Add( mm.MSG_DATE_INTERVALS_NEXT_FORTNIGHT );
    pCbx.Items.Add( mm.MSG_DATE_INTERVALS_THIS_MONTH );
    pCbx.Items.Add( mm.MSG_DATE_INTERVALS_LAST_MONTH );
    pCbx.Items.Add( mm.MSG_DATE_INTERVALS_NEXT_MONTH );
    pCbx.Items.Add( mm.MSG_DATE_INTERVALS_THIS_BIMESTER );
    pCbx.Items.Add( mm.MSG_DATE_INTERVALS_THIS_QUARTER );
    pCbx.Items.Add( mm.MSG_DATE_INTERVALS_THIS_SEMESTER );
    pCbx.Items.Add( mm.MSG_DATE_INTERVALS_THIS_YEAR );
    pCbx.Items.Add( mm.MSG_DATE_INTERVALS_LAST_YEAR );
    pCbx.Items.Add( mm.MSG_DATE_INTERVALS_ALL );
    pCbx.Items.Add( mm.MSG_DATE_INTERVALS_ALL_UNTIL_TODAY );
end;
//8.0.0.0
function tdm_rc.rc_ClearMenuParams(pOption: string): string;
var
   cTemp,cTmp,cMenuParams : string;
   iSeq              : integer; //6.0.0.0
   cGetThisPk,cTagForm,cIco,cTbl,cFld,cFrm,cBadge : string;
begin
   if ( Pos( ' translate:', pOption ) > 0 ) then
   begin
      pOption := StringReplace( pOption , ' translate:' , '', [rfReplaceAll] );
   end;
   if ( Pos( ' closebtn:', pOption ) > 0 ) then
   begin
      pOption := StringReplace( pOption , ' closebtn:' , '', [rfReplaceAll] );
   end;
   if ( Pos( ' modal:', pOption ) > 0 ) then
   begin
      pOption := StringReplace( pOption , ' modal:' , '', [rfReplaceAll] );
   end;
   if ( Pos( ' expand:', pOption ) > 0 ) then
   begin
      pOption := StringReplace( pOption , ' expand:' , '', [rfReplaceAll] );
   end;

   //8.0.0.0
   cIco := '';
   cBadge := '';
   if ( Pos( ' ico:', pOption ) > 0 ) then
   begin
      cIco          := Copy( pOption , Pos( ' ico:', pOption ) + 5, 100 ) + ' ';
      cIco          := Trim( Copy( cIco , 1, Pos( ' ', cIco )) );
      pOption := StringReplace( pOption , ' ico:' + cIco, '', [rfReplaceAll] );
   end;
   //8.0.0.0
   if ( Pos( ' badge:', pOption ) > 0 ) then
   begin
      cBadge        := Copy( pOption , Pos( ' badge:', pOption ) + 7, 100 ) + ' ';
      cBadge        := Trim( Copy( cBadge , 1, Pos( ' ', cBadge )) );
      pOption := StringReplace( pOption , ' badge:' + cBadge, '', [rfReplaceAll] );
   end;
   //8.0.0.0
   if ( Pos( ' basic-crud:', pOption ) > 0 ) then
   begin
      pOption := StringReplace( pOption , ' basic-crud:' , '', [rfReplaceAll] );
   end;
   // 6.0.0.0
   cFrm := '';
   if ( Pos( ' frm:', pOption ) > 0 ) then
   begin
      cFrm          := Copy( pOption , Pos( ' frm:', pOption ) + 5, 100 ) + ' ';
      cFrm          := Trim( Copy( cFrm , 1, Pos( ' ', cFrm )) );
      pOption          := StringReplace( pOption , ' frm:' + cFrm, '', [rfReplaceAll] );
   end;
   // 6.0.0.0
   cTbl := '';
   if ( Pos( ' tbl:', pOption ) > 0 ) then
   begin
      cTbl          := Copy( pOption , Pos( ' tbl:', pOption ) + 5, 100 ) + ' ';
      cTbl          := Trim( Copy( cTbl , 1, Pos( ' ', cTbl ) ) );
      pOption := StringReplace( pOption, ' tbl:' + cTbl, '', [rfReplaceAll] );
      pOption          := StringReplace( pOption , ' tbl:' + cTbl, '', [rfReplaceAll] );
   end;
   // 6.0.0.0
   cFld := '';
   if ( Pos( ' fld:', pOption ) > 0 ) then
   begin
      cFld          := Copy( pOption , Pos( ' fld:', pOption ) + 5, 100 ) + ' ';
      cFld          := Trim( Copy( cFld , 1, Pos( ' ', cFld ) ) );
      pOption := StringReplace( pOption, ' fld:' + cFld, '', [rfReplaceAll] );
      pOption          := StringReplace( pOption , ' fld:' + cFld, '', [rfReplaceAll] );
   end;
   // 6.0.0.0
   if ( Pos( ' hide:', pOption ) > 0 ) then
   begin
      pOption          := StringReplace( pOption , ' hide:' , '', [rfReplaceAll] );
   end;
   // 6.0.0.0
   if ( Pos( ' notshow:', pOption ) > 0 ) then
   begin
      pOption          := StringReplace( pOption , ' notshow:' , '', [rfReplaceAll] );
   end;
   // 6.0.0.0
   if ( Pos( ' master:', pOption ) > 0 ) then
   begin
      pOption          := StringReplace( pOption , ' master:' , '', [rfReplaceAll] );
   end;
   // 6.0.0.0
   if ( Pos( ' asknew:', pOption ) > 0 ) then
   begin
      pOption          := StringReplace( pOption , ' asknew:' , '', [rfReplaceAll] );
   end;
   // 6.0.0.0
   if ( Pos( ' genid-off:', pOption ) > 0 ) then
   begin
      pOption          := StringReplace( pOption , ' genid-off:' , '', [rfReplaceAll] );
   end;
   // 6.0.0.0
   if ( Pos( ' zerosleft:', pOption ) > 0 ) then
   begin
      pOption          := StringReplace( pOption , ' zerosleft:' , '', [rfReplaceAll] );
   end;
   // 6.0.0.0
   if ( Pos( ' hidemaskoff:', pOption ) > 0 ) then
   begin
      pOption          := StringReplace( pOption , ' hidemaskoff:' , '', [rfReplaceAll] );
   end;
   // 6.0.0.0
   if ( Pos( ' genid:', pOption ) > 0 ) then
   begin
      pOption          := StringReplace( pOption , ' genid:' , '', [rfReplaceAll] );
   end;
   // 6.0.0.0
   cTagForm := '';
   if ( Pos( ' tag-form:', pOption ) > 0 ) then
   begin
      cTagForm      := Copy( pOption , Pos( ' tag-form:', pOption ) + 10, 100 ) + ' ';
      cTagForm      := Trim( Copy( cTagForm , 1, Pos( ' ', cTagForm ) ) );
      pOption          := StringReplace( pOption , ' tag-form:' + cTagForm, '', [rfReplaceAll] );
   end;
   // 6.0.0.0
   cGetThisPK := '';
   if ( Pos( ' getpk:', pOption ) > 0 ) then
   begin
      cGetThisPK    := Copy( pOption , Pos( ' getpk:', pOption ) + 7, 100 ) + ' ';
      cGetThisPK    := Trim( Copy( cGetThisPK , 1, Pos( ' ', cGetThisPK ) ) );
      pOption          := StringReplace( pOption , ' getpk:' + cGetThisPK, '', [rfReplaceAll] );
   end;
   Result := pOption;
end;
//7.0.0.0
procedure tdm_rc.rc_CloseFrame( pFrame: TUniFrame; pCloseQueries: boolean);
begin
  if pCloseQueries then
     dm_rc.rc_CloseQuerys( pFrame , False, False );
  if Pos( 'frame-as-modal', pFrame.Hint ) = 0 then
  begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
  end
  else
  begin
    mm.varC_FormsInParent := StringReplace( mm.varC_FormsInParent, ';' + pFrame.OwnerForm.name + '|' +  pFrame.Name + ' ', '', [rfReplaceAll] );
    mm.varB_Yes                  := False;
    mm.varB_No                   := True;
    pFrame.OwnerForm.ModalResult := mrNone;
    pFrame.OwnerForm.Close;
  end;
end;
//8.0.0.0
procedure tdm_rc.rc_CloseQuerys( pRoot : TComponent; pCloseALL : boolean; pCloseConnections : boolean );
var
   I: integer;
   oObj : TComponent;
begin
     if rc_ObjectExists('frmLookUp_Lite') then frmLookUp_Lite.Close;

     for I := 0 to pRoot.ComponentCount - 1 do
     begin
       oObj := pRoot.Components[I];

       if oObj is TFDQuery then
       begin
          if ( ( TFDQuery( oObj ).Name <> 'sqlSearchMaster' ) and ( not pCloseALL ) ) or ( pCloseALL ) then
          begin
             if TFDQuery(oObj).Connection <> nil then
                if TFDQuery(oObj).Connection.Connected then
                begin
                   TFDQuery(oObj).Cancel;
                   TFDQuery(oObj).Close;
                end;
          end;
       end
       else
       if oObj is TFDMemTable then
       begin
          TFDMemTable(oObj).Close;
       end
       else
       if oObj is TDataSource then
       begin
          try
            if TDataSource( oObj ).DataSet <> nil then
               if ( ( TDataSource( oObj ).DataSet.Name <> 'sqlSearchMaster' ) and ( not pCloseALL ) ) or ( pCloseALL ) then
               begin
                  if TFDQuery( TDataSource( oObj ).DataSet ).Connection <> nil then
                     if TFDQuery( TDataSource( oObj ).DataSet ).Connection.Connected then
                     begin
                        TDataSource(oObj).DataSet.Cancel;
                        TDataSource(oObj).DataSet.Close;
                     end;
               end;
          except on e:exception do
                 begin
                      dm_rc.rc_ShowError( 'rc_CloseQuerys:( ' + TDataSource( oObj ).DataSet.Name + ' )' + e.Message );
                 end;
          end;
       end;
     end;

     if pCloseConnections then
     begin
        for I := 0 to pRoot.ComponentCount - 1 do
        begin
          if pRoot.Components[I] is TFDConnection then
          begin
             TFDConnection(pRoot.Components[I]).Close;
          end;
        end;
     end;
end;
// 6.0.0.0
function tdm_rc.rc_CloseTab( pForm : TObject; pPgCtrlName, pTabName: string): boolean;
var
   pFrame : TObject;
   FClassName,cTabName      : string;
   pQryMaster      : TFDQuery;
   bAbort          : boolean;
begin
     bAbort := false;
     if ( TComponent( pForm ) <> nil ) then
     begin
       If TuniTabSheet( TComponent( pForm ).FindComponent( pTabName ) ) <> nil then
       begin
          // 6.0.0.0
          FClassName := rc_GetActiveFormFrameNameInMainTab;

          pFrame     := rc_FindControl( FClassName );
          if pFrame <> nil then
          begin
             pQryMaster := TFDQuery( TComponent( pFrame ).FindComponent( 'sqlMaster' ) );

             bAbort  := false;
             if pQryMaster <> nil then
             begin
                //[PT] no modelo de menu de relatorio..uso a tabela temporaria: tb_reports
                //      ela fica em edição enquanto estamos usando o menu de impressão
                //[EN] in the report menu model..I use the temporary table: tb_reports
                //      it is being edited while we are using the print menu
                if Pos( 'tb_reports', pQryMaster.SQL.Text ) = 0 then
                begin
                   if ( pQryMaster.State in [dsInsert, dsEdit ] ) then
                   begin
                        dm_rc.rc_ShowSweetAlertSimple( mm.MSG_BUGERROR_REGISTER_IN_USE );
                        bAbort := true;
                   end;
                end;
             end;

             if not bAbort then
             begin
                if pFrame is TUniForm then
                begin
                   TUniPageControl( TComponent( pForm ).FindComponent( pPgCtrlName ) ).ActivePage.RemoveControl( TUniForm( pFrame ) );
                   TUniForm( pFrame ).Close;
                end;
                TUniPageControl( TComponent( pForm ).FindComponent( pPgCtrlName ) ).ActivePage.Close;
                fClassName := TUniPageControl( TComponent( pForm ).FindComponent( pPgCtrlName ) ).ActivePage.Name;
                // closed !!!
                pFrame := nil;
             end;
          end
          else
          begin
              TUniPageControl( TComponent( pForm ).FindComponent( pPgCtrlName ) ).ActivePage.Close;
              // closed !!!
              pFrame := nil;
          end;
       end;
     end;
     Result := bAbort;
end;
//8.4.0.0 autoclose
function tdm_rc.rc_ScreenUpdate( pMainMenuExists : boolean; pPlatformChanged : boolean ) : TObject;
var
   oObj, oBtnMenu : TUniControl; //8.4.0.0
   cMenuModel : string;
   bOldMobileScreen : boolean;
begin
     oObj   := nil;
     Result := nil; // 6.0.0.0 last
     if pMainMenuExists then
     begin
        if UniApplication.FindComponent( 'MainForm' ) <> nil then
        begin
           oBtnMenu := TUniControl( MainForm.FindComponent( 'btnMenu' ) ); //8.4.0.0
           oObj     := TUniControl( MainForm.FindComponent( 'paLayoutMainMenu' ) );
           Result   := oObj; // 6.0.0.0 last
        end;
     end;

     bOldMobileScreen   := mm.varB_Mobile_Screen;

     dm_rc.rc_GetDeviceType;

     mm.varB_Screen_LandScape        := ( mm.varI_ScreenWidth > mm.varI_ScreenHeight );
     mm.varB_Mobile_Screen_Portrait  := ( mm.varB_Mobile_Screen ) and ( not mm.varB_Screen_LandScape );
     mm.varB_Mobile_Screen_Landscape := ( mm.varB_Mobile_Screen and mm.varB_Screen_LandScape );

     bMobile_Screen           := mm.varB_Mobile_Screen;
     bMobile_Screen_Portrait  := mm.varB_Mobile_Screen_Portrait;
     bMobile_Screen_Landscape := mm.varB_Mobile_Screen_Landscape;
     if ( oObj <> nil ) and ( ( bOldMobileScreen <> mm.varB_Mobile_Screen ) ) then
     begin
        cMenuModel := rc_GetHintAttr( 'rcmenumodel:', MainForm.Hint );
        if bMobile_Screen then
        begin
           if ( cMenuModel = '2' ) and ( oObj.Width <= MAIN_MENU_MICRO ) then
           begin
              MainForm.UniTreeMainMenu.Tag := 1;
              MainForm.rc_MainMenuClick( oBtnMenu ) //MainForm.rc_MainMenuClick( oObj ); //8.4.0.0
           end;
           mm.CONFIG_LAYOUT_MENU_TYPE := '1';
           Result := nil;
        end
        else
        begin
           if mm.MNU_STATE = '-1' then
           begin
              if cMenuModel <> '1' then
                 oObj.Width := 0;
              MainForm.rc_MainMenuClick( oObj );
           end;
           mm.CONFIG_LAYOUT_MENU_TYPE := cMenuModel;
           Result := oObj;
        end;
        mainForm.rc_UpdateMenuModel( true );
     end
     else
     if ( oObj <> nil ) and ( mm.CONFIG_LAYOUT_MENU_TYPE = '1' ) then //7.0.0.0 menumicro
     begin
         Result := nil;
         if ( mm.varI_ScreenWidth <= 1024 ) and ( oObj.tag = -1 ) then
            MainForm.rc_MainMenuClick( oBtnMenu ) //MainForm.rc_MainMenuClick( oObj ); //8.4.0.0
     end
     //7.0.0.0 menumicro
     else
     if ( oObj <> nil ) and ( mm.CONFIG_LAYOUT_MENU_TYPE = '2' ) then
     begin
         Result := nil;
         cMenuModel := MainForm.Hint ;
         cMenuModel := rc_GetHintAttr( 'rcmenumicro:', MainForm.Hint );
         if ( mm.varI_ScreenWidth <= 1024 ) and ( cMenuModel = 'opened' ) then// ( oObj.tag = -1 ) then
            MainForm.rc_MainMenuClick( oBtnMenu ) //MainForm.rc_MainMenuClick( oObj ); //8.4.0.0
     end
     else
     if ( oObj <> nil ) and ( mm.CONFIG_LAYOUT_MENU_TYPE = '3' ) then //7.0.0.0 menumicro
     begin
        if oObj <> nil then
        begin
            //8.4.0.0 autoclose
            //if ( mm.varI_ScreenWidth <= 1024 ) or ( ( oObj.Tag = 1 ) and ( mm.CONFIG_LAYOUT_MENU_TYPE_AUTOCLOSE = 'ON' ) ) then
            if ( mm.varI_ScreenWidth <= 1024 ) and ( ( oObj.Tag = 1 ) and ( mm.CONFIG_LAYOUT_MENU_TYPE_AUTOCLOSE = 'ON' ) ) then
               //oObj.Width := 0
               if ( oObj.Width > 0 ) then
                  MainForm.rc_MainMenuClick( oBtnMenu )
            else
               oObj.Width := StrToIntDef( mm.CONFIG_LAYOUT_MENU_WIDTH, MAIN_MENU_EXPANDED );

            MainForm.rc_UpdateMainControls;

            if MainForm.FindComponent( 'sboxMain') <> nil then
               TUniScrollBox( MainForm.FindComponent( 'sboxMain') ).DoAlignControls; // Feedback from Farshad
        end;
        Result := oObj;
     end;
     bMobile_Screen_Old := mm.varB_Mobile_Screen;//8.2.0.0
end;

procedure tdm_rc.rc_GridSortColumn(pGrid: TUniDBGrid; const FieldName: string; Dir: Boolean);
begin
  if Dir then
  begin
     TFDQuery( pGrid.DataSource.DataSet ).IndexFieldNames := FieldName + ':A' ;
     TFDQuery( pGrid.DataSource.DataSet ).First ;
     TFDQuery( pGrid.DataSource.DataSet ).Refresh ; // sem isso nao mostra na tela
  end
  else
  begin
     TFDQuery( pGrid.DataSource.DataSet ).IndexFieldNames := FieldName+ ':D' ;
     TFDQuery( pGrid.DataSource.DataSet ).Last ;
     TFDQuery( pGrid.DataSource.DataSet ).Refresh ; // sem isso nao mostra na tela
  end;
end;
// 6.0.0.0( thanks FABIO OLIVEIRA for bug track )
function tdm_rc.rc_GetActiveFormFrameNameInMainTab( pTab : TUniTabSheet ) : string;
var
   oFormFrame : TObject;
   cNameForm  : string;
begin
     Result := '';
     if mm.oPgGeneral <> nil then
     begin
        if pTab = nil then
           pTab := mm.oPgGeneral.ActivePage;
        Result := Copy( pTab.Name, 5, 100 ); // tabDashboard / tabTFRMFISHFACT__1
        oFormFrame := rc_FindControl( Result );
        If oFormFrame = nil then
        begin
           Result := ansilowercase( rc_GetHintAttr( 'name-form:', pTab.Hint ) );
           oFormFrame := rc_FindControl( Result );
           if oFormFrame = nil then
           begin
             Result := pTab.Name;
             oFormFrame := rc_FindControl( Result );
             if ( oFormFrame <> nil ) and ( ( oFormFrame.InheritsFrom( TUniForm ) ) or ( oFormFrame.InheritsFrom( TUniFrame ) ) ) then
                Result := pTab.Name
             else
                Result := '';
           end;
        end;
     end;
end;
// 6.0.0.0
function tdm_rc.rc_GetDeviceType: string;
var
   biOS_RCPlatform,
   bAndroid_RCPlatform,
   bTablet_RCPlatform,
   bDesktop_RCPlatform,
   bMobileScreen_RCPlatform : boolean;
begin
     //[PT] saber o tipo de dispositivo que está acessando o sistema
     //[EN] know the type of device that is accessing the system
     mm.uPlat        := UniSession.UniPlatform;
     mm.varB_iOS     := ( upiOS in mm.uPlat );
     mm.varB_Android := ( upAndroid in mm.uPlat );
     mm.varB_Tablet  := ( upTablet in mm.uPlat );
     mm.varB_Desktop := ( upDesktop in mm.uPlat );
     // 6.0.0.0
     //[PT] mm.varC_Platform é atribuida no AjaxEvent do MainForm por uma função JS mais precisa
     //[EN] mm.varC_Platform is assigned in the MainForm's AjaxEvent by a more precise JS function
     If ( mm.varB_Desktop ) and ( Pos( 'Android', mm.varC_Platform ) > 0 ) then
        mm.varC_Platform := 'Windows';
     biOS_RCPlatform     := Pos( 'iOS', mm.varC_Platform ) > 0;
     bAndroid_RCPlatform := Pos( 'Android', mm.varC_Platform ) > 0;
     bTablet_RCPlatform  := Pos( 'iPad', mm.varC_Platform ) > 0;
     bDesktop_RCPlatform := ( Pos( 'Windows', mm.varC_Platform ) > 0 ) or ( Pos( 'Linux', mm.varC_Platform ) > 0 ) or ( Pos( 'MacOs', mm.varC_Platform ) > 0 );
     bMobileScreen_RCPlatform := ( bAndroid_RCPlatform ) or
                                 ( biOS_RCPlatform ) or
                                 ( bTablet_RCPlatform ) or
                                 //( ( bDesktop_RCPlatform ) and ( ( mm.varI_ScreenWidth > 0 ) and ( mm.varI_ScreenWidth <= 740 ) ) );
                                 ( ( bDesktop_RCPlatform ) and ( ( mm.varI_ScreenWidth > 0 ) and ( mm.varI_ScreenWidth < 768 ) ) );
     //[PT] para forçar o reconhecimento como MOBILE e poder fazer testes de responsividade no browser
     //[EN] to force recognition as MOBILE and be able to perform responsiveness tests in the browser
     mm.varB_Mobile_Screen := ( upMobile in mm.uPlat ) or
                              ( upPhone  in mm.uPlat ) or
                              ( upAndroid in mm.uPlat ) or
                              ( upTablet in mm.uPlat ) or
                              //( ( mm.varB_Desktop ) and ( ( mm.varI_ScreenWidth > 0 ) and ( mm.varI_ScreenWidth <= 740 ) ) );
                              ( ( mm.varB_Desktop ) and ( ( mm.varI_ScreenWidth > 0 ) and ( mm.varI_ScreenWidth < 768 ) ) );
     // 6.0.0.0
     if ( mm.varC_Platform <> '' ) and ( bMobileScreen_RCPlatform <> mm.varB_Mobile_Screen ) then
     begin
          mm.varB_iOS     := biOS_RCPlatform;
          mm.varB_Android := bAndroid_RCPlatform;
          mm.varB_Tablet  := bTablet_RCPlatform;
          mm.varB_Desktop := bDesktop_RCPlatform;
          mm.varB_Mobile_Screen := bMobileScreen_RCPlatform;
     end;
     mm.varB_Desktop := ( not mm.varB_Mobile_Screen );
end;
//7.0.0.0
function tdm_rc.rc_GetFIELD( pIsNotAPI: Boolean; pField, pTable : string; pWhere: string ) : variant;
var
   cFieldAlias ,
   cExpression : string;
   iPos       : integer;
   cTempSQL_General : string;
begin
     //[PT] MySql LINUX é casesensitive, apesar de poder fazer configuração para evitar isso, assumimos por padrao minusculas
     //[EN] MySql LINUX is casesensitive, although you can configure it to avoid this, we assume lower case letters by default
     pTable := lowercase( pTable );

     pField  := Trim( LowerCase( pField ) );

     // na pesquisa interna do FIREBIRD os CAMPOS e TABELAS estão em MAIÚSCULO
     if Pos( 'FIREBIRD' , mm.CONFIG_DATABASE ) > 0 then
     begin
        pTable := UpperCase( pTable );
        pField := UpperCase( pField );
     end;

     iPos       := Pos( '#' , pField );
     cExpression := '';

     //[PT] se tiver um alias, pega só o nome do ALIAS que deve ser o nome do proprio campo. isso permite usar COUNT, COALESCE etc...
     //[EN] if you have an alias, just get the name of the ALIAS, which must be the name of the field itself. This allows you to use COUNT, COALESCE etc...
     if iPos > 0 then
     begin
         cFieldAlias := Trim( Copy( pField , iPos + 1 , 40 ) );
         cExpression  := Copy( pField , 1, iPos - 1 );
         pField       := ' as ' + Copy( cFieldAlias , iPos + 1 , 30 );
     end
     else
         cFieldAlias := pField;

     // pegar o primeiro
     if pWhere = '' then
        pWhere := '0';
     //6.1.0.0
     cTempSQL_General := ' select ' + cExpression + cFieldAlias + ' from ' + dm_rc.rc_DBSchema + pTable ;

     if pWhere <> '' then
     begin
        //pegar o primeiro registro
        if pWhere = '1' then
           cTempSQL_General := cTempSQL_General + ' ' +
                             'order by ' + cFieldAlias
        else
        //pegar o ultimo registro
        if pWhere = '0' then
           cTempSQL_General := cTempSQL_General + ' ' +
                               'order by ' + cFieldAlias + ' DESC '
        //pegar o registro da condicao
        else
           cTempSQL_General := cTempSQL_General + ' ' +
                               'where ' + pWhere + ' ' +
                               'order by ' + cFieldAlias ;
     end;
     mm.varB_OperationProcessed := rc_ConnectDB( mm.CONFIG_DATABASE , mm.SQLConn );
     if mm.varB_OperationProcessed then
     begin
          memTotRecords.Close;
          memTotRecords.Data := rc_GetRecord( pIsNotAPI , false, cTempSQL_General );

          if mm.varC_LastErrorMsg <> '' then
          begin
             mm.varC_SQLERROR := cTempSQL_General;
             mm.varC_LastProcFuncError := 'rc_GetFIELD: ' + UpperCase( cFieldAlias ) + '( Table: ' + UpperCase( pTable ) + ' )' ;
             rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastErrorMsg, 'error' );
          end
          else
          begin
              try
                  //7.0.0.0
                  if DataTypeIsString( memTotRecords.Fields[0].DataType ) then
                     Result := memTotRecords.Fields[0].AsString
                  else
                  if DataTypeIsFloat( memTotRecords.Fields[0].DataType ) then
                     Result := memTotRecords.Fields[0].AsExtended
                  else
                  if DataTypeIsBigInt( memTotRecords.Fields[0].DataType ) then
                     Result := memTotRecords.Fields[0].AsLargeInt
                  else
                  if DataTypeIsInt( memTotRecords.Fields[0].DataType ) then
                     Result := memTotRecords.Fields[0].AsExtended
                  else
                  if DataTypeIsBoolean( memTotRecords.Fields[0].DataType ) then
                     Result := memTotRecords.Fields[0].AsBoolean
                  else
                  if DataTypeIsDateTime( memTotRecords.Fields[0].DataType ) then
                     Result := memTotRecords.Fields[0].AsDateTime
                  else
                  begin
                     rc_ShowSweetAlert( mm.MSG_ERROR, 'Field type not recognized.', 'error' );
                     abort;
                  end;
              except
                on E: Exception do
                begin
                    mm.varC_SQLERROR := cTempSQL_General;
                    mm.varC_LastProcFuncError := 'rc_GetFIELD: ' + UpperCase( cFieldAlias ) + '( Table: ' + UpperCase( pTable ) + ' )' ;
                    rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastProcFuncError + '<br><br>' + E.Message, 'error' );
                end;
              end;
          end;
     end;
end;

function tdm_rc.rc_GetParamFromRGP( pName : string; pParam: TRCRGPParamType ): string;
var
   cTemp2, cTemp3, cValue, cSeq, cField : string;
   iPos : integer;
begin
    cTemp2   := pName;
    cTemp3   := ReverseStr( cTemp2 );

    if Pos( 'bd_' , cTemp3 ) > 0 then  // M_10odairef_od_opiTpgRsb
       cTemp3   := Copy( cTemp3, 4, 200 );

    iPos     := Pos( '_', cTemp3 );
    cValue   := ReverseStr( Copy( cTemp3, 1, iPos - 1 ) ); // M

    cTemp3   := Copy( cTemp3, iPos + 1, 200 ); // 10odairef_od_opiTpgRsb
    cSeq     := ReverseStr( Copy( cTemp3, 1, 2 ) ); // 10

    cTemp3   := Copy( cTemp3, 3, 200 ); // odairef_od_opiTpgRsb
    cField   := Copy( ReverseStr( cTemp3 ), 6, 200 );  // Tipo_do_feriado

    case pParam of
       rptSEQ  : Result   := cSeq;
       rptVALUE: Result   := cValue;
       rptFIELD: Result   := cField;
    end;
end;

function tdm_rc.rc_GetItemIndexFromRgp( pLabel: TUniLabel): Integer;
var
   i, f, c : integer;
   cLabDefault,
   cTemp, cTemp2 : string;
begin
     Result := 0;

     cLabDefault := lowercase( Copy( pLabel.Name, 1, Pos( '_', pLabel.Name ) - 3 ) );
     f           := StrToIntDef( dm_rc.rc_GetParamFromRGP( pLabel.Name, rptSEQ ), 0 );
     c           := 1;
     try
        for I := 0 to TComponent(pLabel.Owner).ComponentCount - 1 do
        begin
            if TComponent(pLabel.Owner).Components[i] is TUniLabel then
            begin
                cTemp  := lowercase( TComponent(pLabel.Owner).Components[i].Name ); // bsrgpTipo1_M
                if ( Copy( cTemp, 1, 5 ) = 'bsrgp' ) and ( Pos( cLabDefault, cTemp ) > 0 ) then
                begin
                   cTemp2 := cTemp ;
                   cTemp2 := 'bsrgp' + dm_rc.rc_GetParamFromRGP( cTemp, rptFIELD );
                   if ( Copy( cTemp, 1, Length( cTemp2 ) ) = cTemp2 ) and ( TUniLabel( TComponent(pLabel.Owner).Components[i] ).Tag = 1 ) then
                   begin
                      cTemp2 := cTemp ;
                      cTemp2 := dm_rc.rc_GetParamFromRGP( cTemp, rptSEQ );

                      Result := cTemp2.ToInteger;

                      if c = f then
                         Break;
                   end;
                   Inc( c );
                end;
            end;
        end;
     Except on e:exception do
            begin
                 if UniApplication.FindComponent('MainForm' ) <> nil then mainform.rc_HideMenuMask( self ); // 6.0.0.0 menu mask warning
                 rc_ShowSweetAlert( 'bsrgp( rc_GetItemIndexFromRgp )', 'Invalid / nonexistent item', 'error' );
                 Abort;
            end;
     End;
end;
// 6.0.0.0
function tdm_rc.rc_GetTagFormAttr(pForm: TObject; pFromSelectedMenuOption: boolean): string;
var
   iIndex : integer;
begin
     if pFromSelectedMenuOption then
     begin
        iIndex := dm_rc.rc_FindMenuOption( mm.varC_SelectedItem_FSideMenu );
        if iIndex >= 0 then
           Result := mm.varA_FSideMenu[ iIndex ].Tag;
     end
     else
        Result := rc_GetHintAttr( 'tag-form:', TUniControl( pForm ).Hint );
end;

function tdm_rc.rc_GetTagFromChk(pLabel: TUniLabel): Integer;
begin
     Result := pLabel.Tag;
end;

function tdm_rc.rc_GetValueFromRgp( pLabel: TUniLabel): String;
var
   i : integer;
   cTemp, cTemp2 , cTemp3 : string;
begin
     Result := '';
     try
         cTemp3 := StringReplace( pLabel.Name, '_db' , '', [rfReplaceAll] ) ;
         cTemp3 := 'bsrgp' + lowercase( dm_rc.rc_GetParamFromRGP( cTemp3, rptFIELD ) );

         for I := 0 to TComponent(pLabel.Owner).ComponentCount - 1 do
         begin
             if TComponent(pLabel.Owner).Components[i] is TUniLabel then
             begin
                 cTemp  := lowercase( TComponent(pLabel.Owner).Components[i].Name ); // bsrgpTipo1_M

                 if ( Copy( cTemp, 1, 5 ) = 'bsrgp' ) and ( Pos( cTemp3 , cTemp ) > 0 ) then
                 begin
                    cTemp2 := StringReplace( cTemp, '_db' , '', [rfReplaceAll] ) ;

                    if ( TUniLabel( TComponent(pLabel.Owner).Components[i] ).Tag = 1 )  then
                    begin
                       cTemp2 := dm_rc.rc_GetParamFromRGP( cTemp, rptVALUE );
                       Result := cTemp2;
                       Break;
                    end;
                 end;
             end;
         end;
     Except on e:exception do
            begin
                 if UniApplication.FindComponent('MainForm' ) <> nil then mainform.rc_HideMenuMask( self ); // 6.0.0.0 menu mask warning
                 rc_ShowSweetAlert( 'bsrgp( rc_GetValueFromRgp )', 'Invalid / nonexistent item', 'error' );
                 Abort;
            end;
     End;
end;
//7.4.0.0
function tdm_rc.rc_GetLookUpDBEdit(pSender: TObject): TUniDBEdit;
var
  cLookUp : string;
begin
   cLookUp := StringReplace( lowercase( TUniSpeedButton( pSender ).Name ) , 'btnlkp' , 'edlkp' , [rfReplaceAll] );
   Result  := TUniDBEdit( TUniSpeedButton( pSender ).owner.FindComponent( cLookUp ) );
end;

function tdm_rc.rc_GetLookUpField( pFrame, pLkp : TObject; pField: string ): Variant;
var
   cTable : string;
begin
     Result := '';

     if TObject(pLkp) is TUniDBEdit then
        cTable := StringReplace( lowercase( TComponent(pLkp).Name ) , 'edlkp' , '', [rfReplaceAll] )
     else
     if TObject(pLkp) is TUniSpeedButton then
        cTable := StringReplace( lowercase( TComponent(pLkp).Name ) , 'btnlkp' , '', [rfReplaceAll] )
     else
        rc_ShowError( 'rc_GetLookUpField: pLkp object must have TUniDBEdit or TUniSpeedButton' );

     if TFDQuery( TComponent(pFrame).FindComponent( 'LKP_' + cTable ) ) <> nil then
     begin
          if not TFDQuery( TComponent(pFrame).FindComponent( 'LKP_' + cTable ) ).FieldByName( pField ).IsNull then
             try
                Result := TFDQuery( TComponent(pFrame).FindComponent( 'LKP_' + cTable ) ).FieldByName( pField ).AsVariant;
             except
                   rc_ShowError( '<strong>rc_GetLookUpField<strong><br><br>Field' + pField + '<br>' + 'LookUP:' + TComponent(pLkp).Name + '<br>');
             end;
     end;
end;
// 6.0.0.0
function tdm_rc.rc_GetLookUpTag(pLookup: TUniControl; pResultType : TRCLookupTagType; pLkpStrTrim : boolean ) : Variant;
begin
     Result := rc_GetHintAttr( 'lkp-tag:', pLookup.Hint );
     case pResultType of

          lktString  : begin
                         if Result = '-1234567' then
                            Result := '';
                         if pLkpStrTrim then
                            Result := Trim( Result );
                       end;
          lktInteger : begin
                         if Result = '-1234567' then
                            Result := '0';
                         Result := StrToIntDef( Result, 0 );
                       end;
          lktInt64   : begin
                         if Result = '-1234567' then
                            Result := '0';
                         Result := StrToInt64Def( Result, 0 );
                       end;
          lktDateTime: begin
                         if Result = '-1234567' then
                            Result := '0';
                         Result := StrToDateTimeDef( Result, 0 );
                       end;
          lktDate    : begin
                         if Result = '-1234567' then
                            Result := '0';
                         Result := StrToDateDef( Result, 0 );
                       end;
     end;
end;
// 6.0.0.0+
procedure tdm_rc.rc_SetLookUpTag(pLookup: TUniControl; pContent: Variant; pContentType: TRCLookupTagType);
var
   cContent : string;
begin
     case pContentType of
          lktString  : begin
                         cContent := pContent;
                       end;
          lktInteger,
          lktInt64   : begin
                         cContent := IntToStr( pContent );
                         if pContentType = lktInteger then
                            pLookup.Tag := pContent;
                       end;
     end;
     pLookup.Hint := rc_AddHintAttr( '|lkp-tag:' + cContent , pLookup.Hint, true )
end;

function tdm_rc.rc_GetNextID(pIsNotAPI: Boolean; pTable , pField , pWhere : string ) : Integer;
begin
     mm.varC_LastProcFuncError := 'rc_GetNextID';

     pTable := Trim( pTable );
     //[PT] MySql LINUX é casesensitive, apesar de poder fazer configuração para evitar isso, assumimos por padrao minusculas
     //[EN] MySql LINUX is casesensitive, although you can configure it to avoid this, we assume lower case letters by default
     pTable := lowercase( pTable );

     pField  := Trim( pField );
     pWhere  := Trim( pWhere );

      if pWhere <> '' then
         pWhere := ' Where ' + pWhere;

      Result := 0;
      mm.varB_OperationProcessed := rc_ConnectDB( mm.CONFIG_DATABASE , mm.SQLConn );

      if mm.varB_OperationProcessed then
      begin
         sqlNextID.Active := False;

         //[PT] para melhor performance crie um índice em sua tabela pelo campo chave em ordem decrescente
         //[EN] for better performance create an index on your table by the key field in descending order
         sqlNextID.SQL.Text := ' Select Max( ' + pField + ')id ' + // alias padrão( codigo = id )
                               ' From ' + dm_rc.rc_DBSchema + pTable + //6.1.0.0
                               pWhere;
         Try
               sqlNextID.Active := True;
               //[PT] mantive 'id' pois é associado um ALIAS logo acima...
               //     qd o campo STRING é CHAR, vem com ESPACOS: Ex: Campo CHAR(6) -> retorna '1      '
               //     se for o primeiro registro retorna vazio, temos q tratar
               //[EN] I kept 'id' because an ALIAS is associated just above...
               //     when the STRING field is CHAR, it comes with SPACES: Ex: CHAR(6) field -> returns '1 '
               //     if it is the first record it returns empty, we have to deal with
               if sqlNextID.FieldByName( 'id' ).AsString = '' then
                  Result := 0
               else
                  Result := StrToIntDef( trim( sqlNextID.FieldByName( 'id' ).AsString ) , -1);

               sqlNextID.Active := False;
         except
               on e:Exception do
               begin
                       ShowMessagE( E.Message );
                       abort;
               end;
         End;

         // para replicacao( se nao for usar o sistema on line )
         // ou simplesmente para organizar os CODIGOS SEQUENCIAIS por EMPRESA
         //
         // Comente essas linhas se quiser usar SEQUENCIAL padrao mesmo
         //
         // adiciona o cod. da empresa como prefixo
         //
         //if Result = 0 then
         //   Result := StrToInt( ReverseString( StrZero( mm.varI_Code_Company, 12 ) ) ) + Result;

         Result := Result + 1;
      end;
end;
// 6.0.0.0
function tdm_rc.rc_BlockParentIsCollapsed(pForm: TObject; pObj: TUniControl) : TUniControl;
var
   bBlockWithCollapsed : boolean;
   pParentComp : TComponent;
begin
   Result := nil;
   if pObj.HasParent then
      pParentComp := pObj.GetParentComponent
   else
      pParentComp := nil;
   bBlockWithCollapsed := false;
   repeat
       if pObj <> NIL then
       begin
          if TUniControl( pParentComp ).HasParent then
             pParentComp := TUniControl( pParentComp ).GetParentComponent
          else
             pParentComp := nil;
       end;
       if ( pParentComp <> nil ) and ( Pos( 'rcBlock', pParentComp.Name ) > 0 ) then
       begin
          bBlockWithCollapsed := Pos( ' expanded-', TUniControl(pParentComp).hint ) > 0;
       end;
   until ( pParentComp = nil ) or not ( pObj.HasParent ) or ( bBlockWithCollapsed ) ;
   if bBlockWithCollapsed then
      Result := TUniControl(pParentComp)
   else
      Result := nil;
end;

procedure tdm_rc.rc_GetObjParent( pForm:TObject; pObj : TUniControl; out iLeft, iTop : integer; pParentComp : TComponent  );
var
   bBlockWithCollapsed : boolean;
begin
   iLeft := pObj.Left;
   iTop  := pObj.Top ;

   if pObj.HasParent then
      pParentComp := pObj.GetParentComponent
   else
      pParentComp := nil;

   repeat
       if pObj <> NIL then
       begin
          iLeft := iLeft + TUniControl( pParentComp ).Left;
          iTop  := iTop  + TUniControl( pParentComp ).Top;

          if TUniControl( pParentComp ).HasParent then
             pParentComp := TUniControl( pParentComp ).GetParentComponent
          else
             pParentComp := nil;
       end;
   until ( pParentComp = nil ) or not ( pObj.HasParent ) ;
end;
//8.4.0.1 lookup str
procedure tdm_rc.DynamicOnChangeLkpID(Sender: TObject);
var
   cLkp, cPkType : string;
   oLkp : TUniDBEdit;
begin
   cLkp := StringReplace( TUniDBEdit( Sender ).Name, '_CodID', '', [rfReplaceAll] );
   oLkp := TUniDBEdit( TUniDBEdit( Sender ).Owner.FindComponent( cLkp ) );
   if oLkp <> nil then
   begin
      if ( TUniDBEdit( Sender ).DataSource.DataSet.Active ) then
      begin
        cPkType := rc_GetLookupPKDataType( cLkp );
        if TUniDBEdit( Sender ).DataSource.DataSet.FieldByName( TUniDBEdit( Sender ).DataField ).Value <> null then
        begin
           if not DataTypeStrIsString( cPkType ) then
              dm_rc.rc_SetLookUpTag( oLkp , TUniDBEdit( Sender ).DataSource.DataSet.FieldByName( TUniDBEdit( Sender ).DataField ).Value )
           else
           begin
              //TUniDBEdit( Sender ).DataSource.DataSet.FieldByName( TUniDBEdit( Sender ).DataField ) ).
              dm_rc.rc_SetLookUpTag( oLkp , TUniDBEdit( Sender ).DataSource.DataSet.FieldByName( TUniDBEdit( Sender ).DataField ).AsString , lktString );
           end;
        end
        else
           dm_rc.rc_SetLookUpTag( oLkp , '-1234567' );
      end;
      dm_rc.rc_LookUpUpdateData( TUniDBEdit( Sender ).Owner, oLkp );
   end;
end;

procedure tdm_rc.DynamicOnChangeValueForSetDS(sender: TObject);
var
   cTemp, cTemp2, cSaveTo : string;
   LkpEDIT : TUniControl;
   LkpDs : TDataSource;
   pDM : TDataModule;
begin
     if ( sender is TUniDBEdit ) then
        if  Pos( '_setds_' , lowercase( TUniDBEdit( sender ).Name ) ) > 0 then
        begin
           cTemp   := lowercase( TUniDBEdit( sender ).Name );
           cTemp   := Copy( cTemp, 1, Pos( '_setds_', cTemp ) - 1 );
           LkpEDIT := TUniControl( TUniDBEdit( sender ).owner.FindComponent( cTemp ) );

           pDM := nil;
           //ds 6.0.0.0
           cTemp2 := TUniDBEdit( sender ).Hint;
           cTemp2 := rc_GetHintAttr( 'ds:', TUniControl( sender ).Hint, true, false, true ); // 6.0.0.0
           //saveto... [[saveto:codiibge_cli]]
           cSaveTo := rc_GetHintAttr( 'saveto:', TUniControl( sender ).Hint );
           if cSaveTo = '_default' then
              cSaveTo := TUniDBEdit( sender ).DataField;

           If Pos( '.', cTemp2 ) > 0 then
           begin
               pDM := nil;
               pDM := rc_FindDataModule( Copy( cTemp2, 1, pos( '.', cTemp2 ) - 1 ) );
               cTemp2 := Copy( cTemp2, pos( '.', cTemp2 ) + 1 );
           end;
           if pDM <> nil then
              LkpDS  := TDataSource( pDM.FindComponent( cTemp2 ) )
           else
              LkpDS  := TDataSource( TUniDBEdit( sender ).owner.FindComponent( cTemp2 ) );

           if ( LkpDs <> nil ) and ( cSaveTo <> '' ) then
           begin
              Try
                 if ( LkpDs.DataSet.State in [ dsEdit, dsInsert ] ) then
                 begin
                     cTemp := dm_rc.rc_GetLookUpField( TUniDBEdit( LkpEDIT ).Owner , TUniDBEdit( LkpEDIT ), TUniDBEdit( sender ).DataField );
                     if LkpDs.DataSet.FindField( cSaveTo ) <> nil then
                     begin
                        if DataTypeIsFloat( LkpDs.DataSet.FieldByName( cSaveTo ).DataType ) then
                           LkpDs.DataSet.FieldByName( cSaveTo ).AsFloat := StrToFloatDef( cTemp, 0 )
                        else
                        if DataTypeIsNumber( LkpDs.DataSet.FieldByName( cSaveTo ).DataType ) then
                           LkpDs.DataSet.FieldByName( cSaveTo ).AsInteger := StrToIntDef( cTemp, 0 )
                        else
                        if DataTypeIsDateTime( LkpDs.DataSet.FieldByName( cSaveTo ).DataType ) then
                           LkpDs.DataSet.FieldByName( cSaveTo ).AsDateTime := StrToDateDef( cTemp, 0 )
                        else
                        if DataTypeIsString( LkpDs.DataSet.FieldByName( cSaveTo ).DataType ) then
                           LkpDs.DataSet.FieldByName( cSaveTo ).AsString := cTemp;
                     end;
                 end;
              except on e:exception do
                     begin

                          cTemp := UTF8ToString( TUniDBEdit( LkpEDIT ).DataField );
                          dm_rc.rc_ShowSweetAlert( 'SetDS Error', 'Source / destination field not found: ' + cTemp , 'error' );
                          Abort;
                     end;
              End;
           end;
        end;
end;
//8.0.0.0
procedure tdm_rc.DynamicOnTriggerEvent( Sender: TUniFormControl; AButtonId: Integer);
var
  cHint, cBtn : string;
  oBtn  : TUniBitBtn;
begin
  cHint := TUniControl( sender ).Hint;   //clipboard: | btntype:trigger |
  case AButtonId of
     00,01 : begin
                if rc_AttrExists( 'lkp:' , cHint ) then
                begin
                   if AButtonId = 0 then
                   begin
                      TUniControl( sender ).Hint := rc_AddHintAttr( '|btntrigger:' , TUniControl( sender ).Hint, true );
                      dm_rc.rc_AjaxRequest(
                         'MainForm.htmlFrame',
                         '_getXYLookup',
                           '"x=" + ' + TUniControl( sender ).JSName + '.getEl().getLeft(), ' +
                           '"y=" + ' + TUniControl( sender ).JSName + '.getEl().getTop() ,' +
                           '"h=" + ' + TUniControl( sender ).JSName + '.getEl().getHeight() ,' +
                           '"w=" + ' + TUniControl( sender ).JSName + '.getEl().getWidth()'
                      );
                      UniSession.Synchronize;

                      DynamicOnDblClick( sender );
                   end
                   else
                   if AButtonId = 1 then //btnAdd
                   begin
                      TUniControl( sender ).Hint := rc_AddHintAttr( '|btntrigger-add:' , TUniControl( sender ).Hint, true );
//                      dm_rc.rc_AjaxRequest(
//                         'MainForm.htmlFrame',
//                         '_getXYLookup',
//                           '"x=" + ' + TUniControl( sender ).JSName + '.getEl().getLeft(), ' +
//                           '"y=" + ' + TUniControl( sender ).JSName + '.getEl().getTop() ,' +
//                           '"h=" + ' + TUniControl( sender ).JSName + '.getEl().getHeight() ,' +
//                           '"w=" + ' + TUniControl( sender ).JSName + '.getEl().getWidth()'
//                      );
//                      UniSession.Synchronize;

                      DynamicOnDblClick( sender );
                   end;
                end
                else
                if rc_AttrExists( 'clipboard:' , cHint ) then
                   rc_CopyToClipBoard( sender )
                else
                if rc_AttrExists( 'link:' , cHint ) then
                   DynamicOnClickLink( sender )
                else
                if rc_AttrExists( 'numpad:' , cHint ) then
                begin
                   DynamicNumPadClick( sender )
                end
                else
                if rc_AttrExists( 'dial:' , cHint ) then
                   DynamicOnClickDial( sender )
                else
                // in development
                if rc_AttrExists( 'mail:' , cHint ) then
                   DynamicOnClickMail( sender );
             end;
  end;
end;

procedure tdm_rc.DynamicOnClickClipBoard(sender: TObject );
var
   pLink, pName : string;
   oEdit : TUniControl;
   oOwner : TComponent;
begin
     pName  := StringReplace( TUniControl( sender ).Name, 'rcBtnClipboard_', '', [rfReplaceAll] );
     oOwner := TComponent( sender ).Owner;
     oEdit  :=  TUniControl( TUniEdit( TObject( oOwner ) ).FindComponent( pName ) );

     if ( oEdit <> nil ) then
     begin
        rc_CopyToClipBoard( oEdit );
     end;
end;

procedure tdm_rc.DynamicOnClickLink(sender: TObject );
var
   pLink, pName : string;
   oEdit : TUniControl;
   oOwner : TComponent;
begin
     pLink :=  rc_GetHintAttr( 'link:' , TUniControl( sender ).Hint ) ;

     if pLink = '' then
     begin
          pName  := StringReplace( TUniControl( sender ).Name, 'rcBtnLink_', '', [rfReplaceAll] );
          oEdit  := TUniEdit( TUniControl( sender ).FindComponent( pName ) );
          oOwner := TComponent( sender ).Owner;
          oEdit  :=  TUniControl( TUniEdit( TObject( oOwner ) ).FindComponent( pName ) );

          if oEdit <> nil then
          begin
               pLink :=  TUniEdit( oEdit ).Text ;
          end;
     end;

     if pLink <> '' then
     begin
        if Pos( 'http', lowercase( pLink ) ) = 0 then
           pLink := 'http://' + pLink;
     end;

     rc_OpenLink( pLink );
end;

procedure tdm_rc.DynamicOnClickDial(sender: TObject );
var
   pPhone, pName : string;
   oEdit : TUniControl;
   oOwner : TComponent;
begin
     pPhone :=  rc_GetHintAttr( 'dial:' , TUniControl( sender ).Hint ) ;

     if pPhone = '' then
     begin
          pName  := StringReplace( TUniControl( sender ).Name, 'rcBtnPhone_', '', [rfReplaceAll] );
          oEdit  := TUniEdit( TUniControl( sender ).FindComponent( pName ) );
          oOwner := TComponent( sender ).Owner;
          oEdit  :=  TUniControl( TUniEdit( TObject( oOwner ) ).FindComponent( pName ) );

          if oEdit <> nil then
          begin
               pPhone :=  TUniEdit( oEdit ).Text ;
          end;
     end;

     UniSession.AddJS( 'window.location.href="tel://' + pPhone + '"');
end;

procedure tdm_rc.DynamicOnClickMail(sender: TObject );
var
   pEmail, pName : string;
   oEdit : TUniControl;
   oOwner : TComponent;
begin
     pEmail :=  rc_GetHintAttr( 'mail:' , TUniControl( sender ).Hint ) ;

     if pEmail = '' then
     begin
          pName  := StringReplace( TUniControl( sender ).Name, 'rcBtnpEmail_', '', [rfReplaceAll] );
          oEdit  := TUniEdit( TUniControl( sender ).FindComponent( pName ) );
          oOwner := TComponent( sender ).Owner;
          oEdit  :=  TUniControl( TUniEdit( TObject( oOwner ) ).FindComponent( pName ) );

          if oEdit <> nil then
          begin
               pEmail :=  TUniEdit( oEdit ).Text ;
          end;
     end;
end;
// 6.0.0.0+ ( thanks Mr. Marino for Bug Tracker )
function tdm_rc.rc_GetRecord(pIsNotAPI: Boolean; pAll : boolean; pSql: String ) : TFDMemTable;
var
   cGetFields ,
   cTempSQL_General : string;
   oQuery : TFDQuery;
begin
  try
    if pAll then
       sqlGetRecords.FetchOptions.Mode := fmAll
    else
       sqlGetRecords.FetchOptions.Mode := fmOnDemand;
    //[PT] as mensagens de erro da GetRegistroS devem ser acionadas no codigo e nao dentro da função
    //[EN] GetRegistroS error messages must be triggered in the code and not within the function
    mm.varC_LastProcFuncError := 'GetRecord';
    // _todos S ou N pode serguir de '.' e a lista de campos que se deseja retornar na query
    if Pos( '.' , pSql ) > 0 then
       cGetFields := Copy( pSql , 2, 10000 )
    else
       cGetFields := '*';
    // [PT] se nao pôs o ORDER acrescenta para nao dar erro no ROWS / LIMIT
    //      mas só se não tiver o PRAGMA( pra trazer a estrutura LOCAL do SQLITE )
    //      ou nao vier do MySQL tb...
    // [EN] if you didn't put the ORDER, add it so as not to give an error in ROWS / LIMIT
    //      but only if you don't have PRAGMA (to bring the LOCAL SQLITE structure)
    //      or it doesn't come from MySQL either...
    if ( Pos( 'order by' , lowercase( pSql ) ) = 0 ) and
       ( Pos( 'pragma', lowercase( pSql ) ) = 0 ) and
       ( Pos( 'show columns' , lowercase( pSql ) ) = 0 ) and
       ( Pos( 'show keys' , lowercase( pSql ) ) = 0 ) and
       ( Pos( 'show tables' , lowercase( pSql ) ) = 0 ) then
    begin
         if Pos( 'noorder.' , pSql ) = 0 then
            pSql := pSql + ' order by 1'
         else
            pSql := Copy( pSql , 9, 10000 );
    end;

    cTempSQL_General := pSql;

    // Tratar o tipo de CONEXÃO usada
    begin
       // trazer só um registro | get just one record
       if ( not pAll ) and
          ( Pos( 'show columns' , lowercase( pSql ) ) = 0 ) and
          ( Pos( 'show tables' , lowercase( pSql ) ) = 0 ) then
       begin
            // Feedback by Fábio Oliveira and adapt to bug prevent by Flávio Motta - In SQL SERVER the TOP X, must be after the SELECT not in the final
            if mm.CONFIG_DATABASE = 'SQLSERVER' then
            begin
               cTempSQL_General := Trim (cTempSQL_General );
               cTempSQL_General := Copy( cTempSQL_General, Pos( ' ' , cTempSQL_General ) + 1, 5000 );
               cTempSQL_General := ' select TOP 1 ' + cTempSQL_General;
            end
            // 6.0.0.0
            else
            begin
               if ( mm.CONFIG_DATABASE = 'MYSQL' ) or ( mm.CONFIG_DATABASE = 'PGSQL' ) or ( mm.CONFIG_DATABASE = 'SQLITE' ) then
                  cTempSQL_General := cTempSQL_General + ' LIMIT 1 '
               else
               if ( mm.CONFIG_DATABASE = 'FIREBIRD' ) then
                  cTempSQL_General := cTempSQL_General + ' ROWS 1 ';
               cTempSQL_General := StringReplace( cTempSQL_General , ' order by 1', '', [rfReplaceAll] );
            end;
       end;
       sqlGetRecords.Active   := False;
       sqlGetRecords.SQL.Text := cTempSQL_General  ;
    end;
    mm.varC_LastErrorMsg := '';
    //[PT] senao foi inserido um dos campos padroes de lookup, a estrutura SQLITE ou a tab. origem tem que ser remodelada
    //[EN] if one of the standard lookup fields, the SQLITE structure or the tab was not inserted. origin has to be remodeled
    if Pos( 'semestrutura' , cTempSQL_General ) > 0 then
    begin
         mm.varC_LastErrorMsg := 'A tabela de pesquisa não foi definida ou a estrutura do BD( sqlite ) está desatualizada!';
    end;

    Result := nil;
    mm.varB_OperationProcessed := rc_ConnectDB( mm.CONFIG_DATABASE , mm.SQLConn );

    if mm.varB_OperationProcessed then
    begin
       begin
             try
                sqlGetRecords.Open;
             except
                   on e:Exception do
                   begin
                       mm.varC_LastProcFuncError := 'GetRegistroS( LOCAL )';
                       mm.varC_LastErrorMsg := mm.MSG_BUGERROR_COM_SERVER_FAIL + '<br><br>' + E.Message;
                   end;
             end;
       end;
       // se nao houve erro... | if not occurs errors...
       if mm.varC_LastErrorMsg = '' then
       begin
            memRecords.Close;
            memRecords.Data := sqlGetRecords.Data ;

            Result := memRecords;
       end
       else
           mm.varC_SQLERROR := cTempSQL_General;
    end
    else
       mm.varC_LastErrorMsg := mm.MSG_BUGERROR_COM_SERVER_FAIL ;
  finally
       sqlGetRecords.FetchOptions.Mode := fmOnDemand;
  end;
end;

function tdm_rc.rc_GetTotRecords( pIsNotAPI : Boolean;  pTable : string; pWhere : string  ) : integer;
begin
   //[PT] MySql LINUX é casesensitive, apesar de poder fazer configuração para evitar isso, assumimos por padrao minusculas
   //[EN] MySql LINUX is casesensitive, although you can configure it to avoid this, we assume lower case letters by default
   pTable := lowercase( pTable );

   memTotRecords.Close;
   Result := 0;
   if pTable <> '' then
   begin
      memTotRecords.Data := rc_GetRecord( pIsNotAPI,
                                         false,
                                         'Select count(*)TOT from ' + dm_rc.rc_DBSchema + Trim( pTable ) + //6.1.0.0
                                         varIIF( pWhere <> '' , ' Where ' , '' ) + pWhere );

      if mm.varC_LastErrorMsg <> '' then
      begin
        rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastErrorMsg, 'error' );
        abort;
      end;

      Result := memTotRecords.Fields[0].AsInteger;

      memTotRecords.Close;
   end
   else
      UniSession.Log( 'rc_GetTotRecords: Table is missing!!!' );
end;

procedure tdm_rc.rc_ShowInputBox( pTitle : string ; pLab1, pEd1 : string ; pLab2 : string ; pEd2 : string; bIsPassword : boolean; bEd1IsDate : boolean; bEd2IsDate : boolean ; pHint : string );
begin
     mm.varC_InputBox_Result1 := '';
     mm.varC_InputBox_Result2 := '';
     mm.varC_InputBox_Result3 := '';

     if pHint = '' then
        pHint := '[[modal:]]';
     if Pos( 'modal:', pHint ) = 0 then
        pHint := rc_SetHintAttr( pHint, '|modal:',pHint,true  );
     frmInputBox.Hint := pHint;

     frmInputBox.imgTipo.Picture.LoadFromFile( sm.FilesFolderPath + 'images' + mm.BACKSLASH + 'messages' + mm.BACKSLASH + 'question.png' );

     frmInputBox.labTitleForm.Text := pTitle;

     frmInputBox.lab1.Text     := pLab1;
     frmInputBox.Ed1.emptytext := pEd1;

     frmInputBox.ed1_dt.visible   := ( bEd1IsDate );
     frmInputBox.ed2_dt.visible   := ( bEd2IsDate );
     frmInputBox.ed1.visible   := ( not bEd1IsDate );
     //7.0.0.0 inputbox datedefault ( thanks for tip Mr. Gilberto Loss )
     if ( frmInputBox.ed1_dt.visible ) and ( StrToDateDef( pEd1 , 0 ) > 0 ) then
        frmInputBox.ed1_dt.Text := pEd1;
     if ( frmInputBox.ed2_dt.visible ) and ( StrToDateDef( pEd2 , 0 ) > 0 ) then
        frmInputBox.ed2_dt.Text := pEd2;

     frmInputBox.ed1_dt.Left   := varIIF( bEd1IsDate, frmInputBox.ed1.Left, 0 );
     frmInputBox.ed2_dt.Left   := varIIF( bEd2IsDate, frmInputBox.ed2.Left, 0 );

     frmInputBox.lab2.visible  := pLab2 <> '';
     frmInputBox.lab2.Text     := pLab2;
     frmInputBox.Ed2.emptytext := pEd2;
     frmInputBox.ed2.visible   := ( frmInputBox.lab2.visible ) and ( not bEd2IsDate );

     if ( frmInputBox.ed2.visible ) then
     begin
        if bIsPassword then
           frmInputBox.ed2.PasswordChar := '*'
        else
           frmInputBox.ed2.PasswordChar := #0;
     end
     else
     if ( frmInputBox.ed1.visible ) then
     begin
        if bIsPassword then
           frmInputBox.ed1.PasswordChar := '*'
        else
           frmInputBox.ed1.PasswordChar := #0;
     end;

     frmInputBox.btnOk.Caption := mm.MSG_OK;
     frmInputBox.btnNo.Caption := mm.MSG_NO;

     frmInputBox.btnNo.Hint    := '[[cls:ButtonRed|center:parent x:-95]]';
     frmInputBox.btnOk.Hint    := '[[cls:ButtonGreen|align:btnNo r:10]]';
     frmInputBox.ShowModal;
end;

procedure tdm_rc.rc_ShowInputBoxCustom(pTitle: string; pComps: Array of rgInputBoxCustom; pBtn1 : boolean; pBtn1Hint : string; pBtn2Hint : string; pBtn1Caption : string; pBtn2Caption : string  );
var
   pHint : string;
begin
     pHint := '[[modal:]]';
     if Pos( 'modal:', pHint ) = 0 then
        pHint := rc_SetHintAttr( pHint, '|modal:',pHint,true  );
     frmInputBoxCustom.Hint := pHint;

     frmInputBoxCustom.imgTipo.Picture.LoadFromFile( sm.FilesFolderPath + 'images' + mm.BACKSLASH + 'messages' + mm.BACKSLASH + 'question.png' );

     frmInputBoxCustom.labTitleForm.Text := pTitle;

     if pBtn1 then
     begin
        frmInputBoxCustom.btnNo.Visible := true;
        if pBtn1Hint = '' then
           frmInputBoxCustom.btnNo.Hint    := '[[cls:ButtonRed|center:parent x:-95]]'
        else
           frmInputBoxCustom.btnNo.Hint    := pBtn1Hint;
        if pBtn1Caption = '' then
           frmInputBoxCustom.btnNo.Caption := mm.MSG_NO
        else
           frmInputBoxCustom.btnNo.Caption := pBtn1Caption;
     end;

     if pBtn2Caption = '' then
        frmInputBoxCustom.btnOk.Caption := mm.MSG_OK
     else
        frmInputBoxCustom.btnOk.Caption := pBtn2Caption;
     if pBtn2Hint = '' then
        frmInputBoxCustom.btnOk.Hint    := '[[cls:ButtonGreen|align:btnNo r:10]]'
     else
        frmInputBoxCustom.btnOk.Hint    := pBtn2Hint;

     frmInputBoxCustom.ShowModal;
end;
//8.1.0.0
procedure tdm_rc.rc_ShowInputBoxCustom( pTitle: string;
                                        pBtn1 : boolean;
                                        pBtn1Hint : string; pBtn2Hint : string;
                                        pBtn1Caption : string; pBtn2Caption : string ;
                                        pContinueFromLastIdx : boolean;
                                        pNoPicture : boolean;
                                        pHint : string;
                                        pQuestionID : integer );
begin
     if pHint = '' then
        pHint := '[['
     else
        pHint := StringReplace( pHint, ']]', '', [rfReplaceAll] ) + '|';

     //8.1.0.0
     if Pos( 'questions:', pHint ) > 0 then
        pHint := pHint + 'questionid:' + pQuestionID.ToString + '|';

     if pContinueFromLastIdx then
        pHint := pHint + 'modal:|continue:' + ( Length(mm.varA_FInputBoxCustom)-1).ToString + ']]'
     else
        pHint := pHint + 'modal:|continue:0]]';

     //8.1.0.0
     if Pos( 'questions:', pHint ) > 0 then
     begin
        frmInputBoxCustom_Forms.Hint := pHint;

        if pNoPicture then
        begin
           frmInputBoxCustom_Forms.rcBlock2.Visible := false;
           frmInputBoxCustom_Forms.rcBlock2.Enabled := false;
        end
        else
           frmInputBoxCustom_Forms.imgTipo.Picture.LoadFromFile( sm.FilesFolderPath + 'images' + mm.BACKSLASH + 'messages' + mm.BACKSLASH + 'question.png' );

        frmInputBoxCustom_Forms.labTitleForm.Text := pTitle;

        frmInputBoxCustom_Forms.btnNo.Visible := pBtn1;
        if pBtn1Hint = '' then
           frmInputBoxCustom_Forms.btnNo.Hint    := '[[cls:ButtonRed|center:parent x:-95]]'
        else
           frmInputBoxCustom_Forms.btnNo.Hint    := pBtn1Hint;

        if pBtn1 then
        begin
           frmInputBoxCustom_Forms.btnNo.Visible := true;
           if pBtn1Hint = '' then
              frmInputBoxCustom_Forms.btnNo.Hint    := '[[cls:ButtonRed|center:parent x:-95]]'
           else
              frmInputBoxCustom_Forms.btnNo.Hint    := pBtn1Hint;
           if pBtn1Caption = '' then
              frmInputBoxCustom_Forms.btnNo.Caption := mm.MSG_CANCEL
           else
              frmInputBoxCustom_Forms.btnNo.Caption := pBtn1Caption;
        end;

        if pBtn2Caption = '' then
           frmInputBoxCustom_Forms.btnOk.Caption := mm.MSG_OK
        else
           frmInputBoxCustom_Forms.btnOk.Caption := pBtn2Caption;
        if pBtn2Hint = '' then
           frmInputBoxCustom_Forms.btnOk.Hint    := '[[cls:ButtonGreen|align:btnNo r:10]]'
        else
           frmInputBoxCustom_Forms.btnOk.Hint    := pBtn2Hint;

        frmInputBoxCustom_Forms.ShowModal;
     end
     else
     begin
        frmInputBoxCustom.Hint := pHint;

        if pNoPicture then
        begin
           frmInputBoxCustom.rcBlock2.Visible := false;
           frmInputBoxCustom.Height           := frmInputBoxCustom.Height - frmInputBoxCustom.rcBlock2.Height - 30;
           frmInputBoxCustom.rcBlock2.Height  := 30;
        end
        else
           frmInputBoxCustom.imgTipo.Picture.LoadFromFile( sm.FilesFolderPath + 'images' + mm.BACKSLASH + 'messages' + mm.BACKSLASH + 'question.png' );

        frmInputBoxCustom.labTitleForm.Text := pTitle;

        if pBtn1 then
        begin
           frmInputBoxCustom.btnNo.Visible := true;
           if pBtn1Hint = '' then
              frmInputBoxCustom.btnNo.Hint    := '[[cls:ButtonRed|center:parent x:-95]]'
           else
              frmInputBoxCustom.btnNo.Hint    := pBtn1Hint;
           if pBtn1Caption = '' then
              frmInputBoxCustom.btnNo.Caption := mm.MSG_CANCEL
           else
              frmInputBoxCustom.btnNo.Caption := pBtn1Caption;
        end;

        if pBtn2Caption = '' then
           frmInputBoxCustom.btnOk.Caption := mm.MSG_OK
        else
           frmInputBoxCustom.btnOk.Caption := pBtn2Caption;
        if pBtn2Hint = '' then
           frmInputBoxCustom.btnOk.Hint    := '[[cls:ButtonGreen|align:btnNo r:10]]'
        else
           frmInputBoxCustom.btnOk.Hint    := pBtn2Hint;

        frmInputBoxCustom.ShowModal;
     end;
end;
// 6.0.0.0
procedure tDM_RC.rc_ShowMessage( pMessage : string; pTipo : string ; pWidth : integer ; pHeight : integer ; pHint : string; pLottieFile : string );
var
   cMessageType : string;
begin
   if UniApplication.FindComponent('MainForm' ) <> nil then mainform.rc_HideMenuMask( self ); // 6.0.0.0 menu mask warning

   if pHint = '' then
      pHint := '[[modal:]]';
   if Pos( 'modal:', pHint ) = 0 then
      pHint := rc_SetHintAttr( '', '|modal:' , pHint,true  );

   if pTipo = 'warning' then
      cMessageType := mm.MSG_WARNING
   else
   if pTipo = 'info' then
      cMessageType := mm.MSG_INFO
   else
   if pTipo = 'success' then
      cMessageType := mm.MSG_SUCCESS
   else
   if pTipo = 'error' then
      cMessageType := 'Ops! ' + mm.MSG_ERROR + '...'
   else
   if pTipo = 'question' then
      cMessageType := mm.MSG_CONFIRM;
   //[PT] quando ocorre um erro no "frmLOGIN" há uma "anomalia" que não consegui resolver. Esta alternativa contorna o problema.
   //[EN] when an error occurs in "frmLOGIN" there is an "anomaly" that I could not solve. This workaround gets around the problem.
   if ( pTipo = 'error' ) and ( not mm.varB_LoginProcessed ) then
      rc_ShowSweetAlert( cMessageType , pMessage, pTipo )
   else
   begin
      frmMessage.imgTipo.Visible := true;
      frmMessage.paLottieBox.Visible := false;
      if pLottieFile <> '' then
      begin
           frmMessage.imgTipo.Visible := false;
           frmMessage.paLottieBox.Visible := true;
           if Pos( 'http', pLottieFile ) = 0 then
              pLottieFile := 'files/images/lotties/' + pLottieFile;
           frmMessage.paLottieBox.hint := '[[lottie:' + pLottieFile + ' autoplay |center:parent xy]]';
      end;
      frmMessage.Hint := pHint;

      pMessage := '<div class="centerTxt">' + pMessage + '</div>';
      pMessage := StringReplace( pMessage, #13#10 , '<br>' , [rfReplaceAll] );

      frmMessage.btnTicket.Caption := mm.MSG_OPEN_TICKET;
      frmMessage.btnOk.Caption := mm.MSG_OK;
      frmMessage.btnOk.Hint := '[[cls:ButtonBlueDark]]';
      frmMessage.btnNo.visible := ( pTipo = 'question' ) or ( pTipo = 'error' );
      frmMessage.btnTicket.visible := ( pTipo = 'error' );

      frmMessage.Width  := pWidth;
      frmMessage.Height := pHeight;

      if pTipo = 'error' then
      begin
         frmMessage.btnOk.Caption := mm.MSG_CONTINUE;
         frmMessage.btnNo.Caption := mm.MSG_CANCEL;
         frmMessage.btnOk.Hint    := '[[cls:ButtonBlue]]';
         frmMessage.btnNo.Hint    := '[[cls:ButtonRed]]';
      end
      else
      if pTipo = 'question' then
      begin
         frmMessage.btnOk.Caption := mm.MSG_YES ;
         frmMessage.btnNo.Caption := mm.MSG_NO ;
         frmMessage.btnNo.Hint    := '[[cls:ButtonRed|center:parent x:-95]]';
         frmMessage.btnOk.Hint    := '[[cls:ButtonGreen|align:btnNo r:10]]';
      end
      else
      begin
         frmMessage.btnOk.Hint    := '[[cls:ButtonGreen|center:parent x]]';
      end;

      frmMessage.labTitleForm.Caption := cMessageType;
      frmMessage.imgTipo.Picture.LoadFromFile( sm.FilesFolderPath + 'images' + mm.BACKSLASH + 'messages' + mm.BACKSLASH +pTipo + '.png' );

      frmMessage.memoMensagem.HTML.Clear;
      frmMessage.memoMensagem.HTML.Add( '<style>' );
      frmMessage.memoMensagem.HTML.Add( '.centerTxt{' );

      if frmMessage.memoMensagem.Alignment = taLeftJustify then
         frmMessage.memoMensagem.HTML.Add( '  text-align: center;' )
      else
      if frmMessage.memoMensagem.Alignment = taRightJustify then
         frmMessage.memoMensagem.HTML.Add( '  text-align: right;' )
      else
      if frmMessage.memoMensagem.Alignment = taCenter then
         frmMessage.memoMensagem.HTML.Add( '  text-align: center;' );

      frmMessage.memoMensagem.HTML.Add( '  font-size: 18px;' );
      frmMessage.memoMensagem.HTML.Add( '  color: black;' );
      frmMessage.memoMensagem.HTML.Add( '}' );
      frmMessage.memoMensagem.HTML.Add( '</style>' );

      frmMessage.memoMensagem.HTML.Add( pMessage );

      if pTipo = 'question' then
      begin
         frmMessage.ShowModal;
      end
      else
      begin
        frmMessage.ShowModal( procedure(Sender: TComponent; Result:Integer)
                               begin
                                 //callback....nesse caso, não é necessário tratar o retorno
                               end
                             );
      end;
   end;
end;
// 6.0.0.0
procedure tdm_rc.rc_ShowMessageCallBack(Sender: TComponent; AResult:Integer);
begin
  if mm.varB_No then
     Exit //Abort //7.0.0.0 thanks GUSTAVO GRSOFT for bug tracker
  else
  begin
    rc_AddCssClass( frmMessage, 'drop_out' );
    frmMessage.Hide;
    frmMessage.Close;
  end;
end;
// 6.0.0.0
function tdm_rc.rc_ShowYesNo(pMessage: string; pWidth : integer ; pHeight : integer ; pHint : string; pUseCallBack : boolean ) : boolean;
begin
     rc_ShowMessage( pMessage, 'question' , pWidth, pHeight, pHint );
     Result := mm.varB_Yes;
     if pUseCallBack then
        rc_ShowMessageCallBack( self, 0 );
end;

procedure tdm_rc.rc_ShowSuccess(pMessage: string; pWidth, pHeight: integer ; pHint : string );
begin
     rc_ShowMessage( pMessage, 'success' , pWidth, pHeight , pHint );
end;

procedure tdm_rc.rc_ShowInfo(pMessage: string; pWidth, pHeight: integer ; pHint : string );
begin
     rc_ShowMessage( pMessage, 'info' , pWidth, pHeight , pHint );
end;

procedure tdm_rc.rc_ShowWarning(pMessage: string; pWidth, pHeight: integer ; pHint : string );
begin
     rc_ShowMessage( pMessage, 'warning' , pWidth, pHeight , pHint );
end;
// 6.0.0.0
function tdm_rc.rc_StripHtmlTags(pHtml: string): string;
var
  TagBegin, TagEnd, TagLength: integer;
begin
  TagBegin := Pos( '<', pHtml );

  while (TagBegin > 0) do
  begin
    TagEnd    := Pos('>', pHtml );
    TagLength := TagEnd - TagBegin + 1;

    Delete(pHtml, TagBegin, TagLength);

    TagBegin  := Pos( '<', pHtml);
  end;
  Result := Trim( pHtml );
end;
//8.1.0.0
procedure tdm_rc.rc_ShowError( pMessage: string; pWidth : integer ; pHeight : integer ; pHint : string );
begin
     if ( not bMobile_Screen ) and ( ( pWidth=360 ) and ( pHeight=360 ) ) then
     begin
        pWidth  := 640;
        pHeight := 480;
     end;
     rc_ShowMessage( pMessage, 'error' , pWidth, pHeight , pHint );
end;
//8.0.0.0
procedure tdm_rc.rc_ShowHideObject( pSender : TObject;
                                    pPanelObj : TObject;
                                    pLeft, pTop : integer;
                                    pAnimType : Integer;
                                    pGetParent : boolean;
                                    pShowHide : Boolean;
                                    pCenter : Boolean ;
                                    pTopDown : Boolean;
                                    pModal : Boolean ;
                                    pSlide : Boolean ;
                                    pDuration : string  );
var
   oBlock : TUniContainer;
   oMenuTransp : TUniPanel;
   oParent, oPanelObj, oPanelObjOwner : TUniControl;
   cParent : string;
   iLeft, iTop,
   f, iZindex : integer;
   cTmp1, cTmp2 , cTmp3   : string;
begin
    oBlock         := nil;
    oMenuTransp    := nil;
    oParent        := nil;
    oPanelObj      := TUniControl( pPanelObj );
    oPanelObjOwner := TUniControl( oPanelObj.Owner );
    if pShowHide then
    begin
         rc_jQueryAnimate( oPanelObj, 'opacity' , '0', '20' );
         If not pslide then
            rc_Anim( oPanelObj, 'top', ( ( TUniControl( pSender ).Top  ) ).ToString, pDuration, gsEasePower1, '0.4', gsEaseTypeOut )
         else
         begin
            if pTopDown then
               rc_Anim( oPanelObj, 'top', '-' + ( ( oPanelObj.Height ) ).ToString, pDuration, gsEasePower1, '0.4', gsEaseTypeOut )
            else
               rc_Anim( oPanelObj, 'top', mm.varI_ScreenHeight.ToString, pDuration, gsEasePower1, '0.8', gsEaseTypeOut );
         end;
         cTmp1 := '';
         f := 0;
         // ja existe o panel em uma camada ? | Does the panel already exist on a layer?
         iZIndex := StrToIntDef( rc_GetHintAttr( 'sh-z-idx-' + oPanelObj.Name + ':', oPanelObjOwner.Hint ), 0 );
         case iZindex of
              0 : f := Occurs( ':1|', oPanelObjOwner.Hint );
              1 : f := Occurs( ':2|', oPanelObjOwner.Hint );
              2 : f := Occurs( ':3|', oPanelObjOwner.Hint );
         end;
         begin
              if iZindex = 0 then
              begin
                 iZIndex := 1 + f;
                 cTmp3 := rc_AddHintAttr( '|sh-z-idx-' + oPanelObj.Name + ':' + iZIndex.ToString + '|', oPanelObjOwner.Hint, true );
              end;

              if cTmp3 <> '' then
              begin
                 if oPanelObj.Owner is TUniFrame then
                    TUniFrame( oPanelObj.Owner ).Hint := cTmp3
                 else
                 if oPanelObj.Owner is TUniForm then
                    TUniForm( oPanelObj.Owner ).Hint := cTmp3;
              end;
         end;
         cTmp1   := 'bringtofront-lower-' + iZIndex.ToString;
         cTmp2   := 'bringtofront-higher-' + iZIndex.ToString;

         if pCenter then
         begin
            if Pos( 'center:parent xy', oPanelObj.Hint ) = 0 then
               oPanelObj.Hint := rc_AddHintAttr( '|center:parent xy' , oPanelObj.Hint, true );
         end;
         oPanelObj.Visible := True;
         oPanelObj.Tag     := 1;
         if pModal then
         begin
            if ( oMenuTransp <> nil ) then
            begin
               rc_RemoveCssClass( oMenuTransp, 'trans-obj');
               rc_RemoveCssClass( oMenuTransp , cTmp1 );
               rc_RemoveCssClass( oPanelObj , cTmp2 );
               rc_AddCssClass( oMenuTransp, cTmp1 + ' trans-obj');
               rc_AddCssClass( oPanelObj , cTmp2 );
            end
            else
            begin
               oMenuTransp := rc_CreatePanel( MainForm, TUniControl(MainForm), oPanelObj.Name + '_rc_paMenuTransp' ,mm.varI_ScreenWidth , mm.varI_ScreenHeight, 0, 0, '', true, true );
               oMenuTransp.Color := clBlack;
               oMenuTransp.Anchors := [akLeft,akRight, akTop, akBottom];
               oPanelObj.Parent := oMenuTransp.Parent;
               rc_AddCssClass( oMenuTransp, cTmp1 + ' trans-obj');
               rc_AddCssClass( oPanelObj , cTmp2 );
            end;
         end;
         if pGetParent then
            oPanelObj.Parent := TUniControl( psender ).Parent;
         if not pCenter then
         begin
            if not ( TUniControl( psender ).InheritsFrom( TUniFrame ) ) and not ( TUniControl( psender ).InheritsFrom( TUniFrame ) ) then
               rc_GetObjParent( TUniControl( pSender ).Owner, TUniControl( pSender ), iLeft, iTop, TUniControl( pSender ).Parent );

            if pSlide then
            begin
               if pTop = 9999 then
               begin
                  if pTopDown then
                     oPanelObj.top  := ( TUniControl( psender ).Top + TUniControl( psender ).Height + 20 ) * (-1)
                  else
                     oPanelObj.top  := mm.varI_ScreenHeight;
               end
               else
               if pTopDown then
                  oPanelObj.top  := pTop * (-1)
               else
                  oPanelObj.top  := pTop;
            end;

            if iLeft + oPanelObj.Width > mm.varI_ScreenWidth then
               oPanelObj.Left := ( mm.varI_ScreenWidth - oPanelObj.Width - 20)
            else
               oPanelObj.Left := iLeft;
         end
         else
         begin
            oPanelObj.Left := ( ( mm.varI_ScreenWidth div 2 ) - ( oPanelObj.Width div 2 ) ) ;
            if pTopDown then
            begin
               if pSlide then
               begin
                  if pTop = 9999 then
                     oPanelObj.top  := ( TUniControl( psender ).Top + oPanelObj.Height + 20 ) * (-1)
                  else
                     oPanelObj.top  := pTop;
               end;
            end
            else
            if pSlide then
               oPanelObj.Top  := ( mm.varI_ScreenHeight div 2 ) - ( oPanelObj.Height div 2 ) * (-1);
         end;

         rc_jQueryAnimate( oPanelObj, 'opacity' , '1', '200' );

         if pSlide then
         begin
            if ( pCenter )  then
               rc_Anim( oPanelObj, 'top', inttostr( ( ( mm.varI_ScreenHeight div 2 ) - ( oPanelObj.Height div 2 ) ) ), pDuration, gsEasePower1, '0.4', gsEaseTypeOut )
            else
            if ( pTopDown ) then
               rc_Anim( oPanelObj, 'top', (oPanelObj.top*(-1)).ToString, pDuration, gsEasePower1, '0.4', gsEaseTypeOut )
            else
               rc_Anim( oPanelObj, 'top', mm.varI_ScreenHeight.ToString, pDuration, gsEasePower1, '0.4', gsEaseTypeOut );
         end;
    end
    else
    begin
         rc_jQueryAnimate( oPanelObj, 'opacity' , '0', '200' );
         oPanelObj.Tag := 0;
         if pCenter then
         begin
            if pSlide then
            begin
               if pTopDown then
                  rc_Anim( oPanelObj, 'top', '-' + ( ( oPanelObj.Height ) ).ToString, pDuration, gsEasePower1, '0.4', gsEaseTypeOut )
               else
                  rc_Anim( oPanelObj, 'top', mm.varI_ScreenHeight.ToString, pDuration, gsEasePower1, '0.8', gsEaseTypeOut );
            end;
         end
         else
         if not pCenter then
         begin
            if pSlide then
            begin
               if pTopDown then
                  rc_Anim( oPanelObj, 'top', '-' + inttostr( oPanelObj.Height ), pDuration, gsEasePower1, '0.4', gsEaseTypeOut )
               else
                  rc_Anim( oPanelObj, 'top', mm.varI_ScreenHeight.ToString, pDuration, gsEasePower1, '0.4', gsEaseTypeOut );
            end;
         end;

         if pModal then
         begin
            oMenuTransp := TUniPanel( MainForm.FindComponent( oPanelObj.name + '_rc_paMenuTransp' ) );
            //8.4.0.3 thanks Mr. Thanner and Mr. Fabio for bug tracker
            if oMenuTransp <> nil then
            begin
               rc_ObjectVisible( oPanelObj, false, true);
               oMenuTransp.Free;
            end;
         end;

         if not pSlide then
            MainForm.rc_CloseNotifications;
    end;
end;

procedure tdm_rc.rc_RecordDeleteCallBack(Sender: TComponent;
  AResult: Integer);
begin
   UniSession.ShowAlert( 'callback: '  + Inttostr( AResult ) );
end;

function tdm_rc.rc_ExtEvtKeyDownOnlyNumbers: string;
begin
     Result := '  function keydown(sender, e, eOpts)' +
               '  {' +
               '    var ok =' +
               '          event.keyCode == 8 || ' +//backspace
               '          event.keyCode == 9 || ' +//tab
               '          event.keyCode == 13 || ' +//enter
               '          event.keyCode >= 35 && event.keyCode <= 37 || ' +//end, home, left arrow
               '          event.keyCode == 39 || ' +//right arrow, downd arrow, insert, delete
               '          event.keyCode == 45 || ' +//insert
               '          event.keyCode == 46 || ' +//delete
               '          event.keyCode >= 96 && event.keyCode <= 105 || ' +// 0-9 on keypad
               '          event.keyCode >= 48 && event.keyCode <= 57; ' +// 0-9
               '      if (!ok) {' +
               '          e.preventDefault();' +
               '      }' +
               '  }';
end;

function tdm_rc.rc_ExtractFieldNameFromSearchItem(pItem: string; pAlias : boolean ) : string;
var
   cAlias, cTabStructurecAlias,
   cField : string;
begin
     cField := pItem;

     if ( Pos( '.' , cField ) > 0 ) then
     begin
        if ( Pos( ' as ' , cField ) > 0 ) then
        begin
           cAlias := StringReplace( ansilowercase(trim(Copy ( cField , Pos( ' as ' , cField ) + 4, 40 ))), #34, '', [rfReplaceAll] ) ;
           cField := lowercase(trim(Copy ( cField , 1, Pos( ' as ' , cField ) - 1  )))
        end
        else
        begin
           mm.varC_FieldName := ansilowercase(trim(Copy ( cField , Pos( '.' , cField ) + 1, 40 )));
           cTabStructurecAlias  := Trim( Copy ( cField , 1, Pos( '.' , cField ) - 1 ) );
           cAlias         := ansilowercase(trim(mm.varC_FieldName));
        end;
     end
     else
     begin
         mm.varC_FieldName := ansilowercase(trim(cField));
         cTabStructurecAlias  := Trim( mm.varC_Table_Search );
         cAlias         := mm.varC_FieldName;
     end;

     if pAlias then
        Result := cAlias
     else
        Result := cField;
end;

procedure tdm_rc.rc_DBGridHidePaginationBar(pGrid: TUniDBGrid);
var
   cHidden : string;
begin
     cHidden := 'true';//varIIF( mm.varB_DefaulPageBar, 'false', 'true' );
     pGrid.ClientEvents.UniEvents.Values['pagingBar.beforeInit'] := 'function (sender, config) {config.hidden = ' + cHidden + ';}';
end;
//8.0.0.1 thanks Fabio Oliveira
procedure tdm_rc.rc_DBGridUpdateAll(pObj: TObject ; pRefresh : boolean; pRefreshPaginator : boolean; pCheckForceFit : boolean  );
var
   i : integer;
   oPaPageBar, oPaPageBtn : TUniContainerPanel;
   oDBGrid  : TUniDBGrid;
   pControl : TUniControl;
begin
      if ( TComponent( pObj ) is TUniForm ) or ( TComponent( pObj ) is TUniFrame ) then
      begin
           for i := 0 to TUniControl( pObj ).ComponentCount - 1 do
           begin
              //7.0.0.0 dbgexport
              if ( TUniControl( pObj ).Components[i] is TUniDBGrid ) and
                 ( ( TUniDBGrid( TUniControl( pObj ).Components[i] ).Name <> 'dbgExport' ) ) then
              begin
                 oDBGrid := TUniDBGrid( TUniControl( pObj ).Components[i] );
                 oDBGrid.LoadMask.Message := mm.MSG_LOADING_DATA;

                 if ( Pos( 'grid-fm-rs!' , oDBGrid.Hint ) > 0 ) or
                    ( Pos( 'grid-resize', oDBGrid.Hint ) > 0 ) then
                 begin
                    if not pRefreshPaginator then
                       dm_rc.rc_DBGridUpdate( oDBGrid, pRefresh, pCheckForceFit );
                 end;
                 //8.0.0.0 grid-menu:off
                 if Pos( 'grid-menu:off' , oDBGrid.Hint ) > 0 then
                 begin
                    dm_rc.rc_GridMenuOff( oDBGrid );
                 end;
              end;
           end;
      end;
end;
//8.4.0.0
//[PT] recarregar registros,  reajustar forcefit do grid padrão para reconfiguração de GRID BTN ACTIONS
//[EN] reload records, readjust default grid forcefit for reconfiguring GRID BTN ACTIONS
procedure tdm_rc.rc_DBGridUpdate(pGrid: TUniDBGrid; pRefresh : boolean; pCheckForceFit : boolean );
var
   bShowPk, //8.0.0.0
   bRcAction : boolean;
   iColumns , iPos, iPos2, iLastPos, f, i,
   iActions : integer;
   cGridColsVisible,
   cAction, cSql, cHint, cTmp, cTemp, cTemp2, cTemp3, cFieldMask, cField : string;
begin
     if ( pGrid <> nil ) then
     if ( pGrid.Name <> 'dbgExport' ) then
     begin
          bRcAction := false;
          iActions  := 0;
          if pGrid.DataSource <> nil then
             if pGrid.DataSource.DataSet <> nil then
                if lowercase( pGrid.DataSource.DataSet.ClassName ) = 'tfdquery' then
                begin
                  bRcAction := Pos( 'rcAction_' , TFDQuery( pGrid.DataSource.DataSet ).SQL.Text ) > 0;
                  iActions  := Occurs( 'rc-actbtn-' , TFDQuery( pGrid.DataSource.DataSet ).SQL.Text ) ; //iActions  := Occurs( 'rcAction_' , TFDQuery( pGrid.DataSource.DataSet ).SQL.Text ) ; // 6.0.0.0
                end;

          if bRcAction then
          begin
             iActions := iActions;

             // (re)constuir / (re)build  HINT
             //    'rcAction_Edit[[title:|width:4% mobile-h:8% mobile-v:12%]];' +
             (*
             [[fieldmasks:table-feriados;grid-resize|código[[visible:false mobile-v]];data[[visible:false mobile-v]];tipo[[visible:false mobile]];|state-visible:empty-false ds:dsSearchMaster]]'
             *)

             cHint := trim( RightStr( pGrid.Hint, 3 ) );
             if Pos( ';', cHint ) > 0 then
                cHint := Trim( Copy( pGrid.Hint , 1, Length( pGrid.Hint ) - 2 ) )
             else
             begin
                cTmp  := ReverseStr( pGrid.Hint );
                cTmp  := Copy( cTmp, 1, Pos( ';]]', cTmp )-1  );
                cTmp  := ReverseStr( cTmp );
                cHint := StringReplace( pGrid.Hint, cTmp, '', [rfReplaceAll] );
             end;
             //8.4.0.0 align col
             if Pos( 'width-col:default', cHint ) = 0 then //if Pos( 'width:default', cHint ) = 0 then
             begin
                iLastPos := 0;
                for f := 1 to iActions do
                begin
                     cSql := TFDQuery( pGrid.DataSource.DataSet ).SQL.Text;
                     cSql := Copy( cSql, iLastPos , 5000 );
                     iPos := Pos( 'as rcAction_' , cSql );
                     // 6.0.0.0
                     if iPos > 0 then
                     begin
                        cSql := Copy( cSql, iPos, 200 );
                        cSql := Copy( cSql, 1, 100 );
                        iLastPos := iLastPos + iPos + 12;

                        cAction := Trim( Copy( cSql, 1 + 12, 100 ) ) + ' ';
                        cAction := Trim( Copy( cAction, 1 ,Pos( ' ', cAction ) ) )  ;

                        if ( cAction <> '' ) and ( Pos( lowercase( 'rcAction_' + cAction ), lowercase( pGrid.Hint ) ) = 0 ) then
                        begin
                             if Pos( ',', cAction ) > 0 then
                                cAction := Trim( Copy( cAction, 1, Pos( ',', cAction ) - 1 ) )
                             else
                             if Pos( ' ', cAction ) > 0 then
                                cAction := Trim( Copy( cAction, 1, Pos( ' ', cAction ) - 1 ) );
                             //8.4.0.0 align col
                             //cHint := cHint + 'rcAction_' + cAction + '[[title:|width:default]];';
                             cHint := cHint + 'rcAction_' + cAction + '[[title-name:|width-col:default]];';
                        end;
                     end;
                end;
                pGrid.Hint := cHint + cTmp;
             end;
          end;
          if pGrid.DataSource <> nil then
             if pGrid.DataSource.DataSet <> nil then
             begin
               if Pos( 'grid-forcefit:', pGrid.Hint ) > 0 then
               begin
                    cHint := Copy( pGrid.Hint, Pos( 'grid-forcefit:', pGrid.Hint ) + 14 );
                    cHint := Copy( cHint, 1, Pos( '|', cHint ) - 1 ) + ' ' ;
               end;
               //8.0.0.0
               //if ( ( Pos( 'mobile-v-', cHint ) > 0 ) and ( mm.varB_Mobile_Screen_Portrait ) ) or ( mm.varB_Mobile_Screen_Portrait ) then
               if ( rc_IsMobile_V( cHint ) ) or ( mm.varB_Mobile_Screen_Portrait ) then
                  f := StrToIntDef( rc_GetHintAttr( 'mobile-v-', cHint, true ) , 5 )
               else
               if ( rc_IsMobile_H( cHint ) ) or ( mm.varB_Mobile_Screen_Landscape ) then
                  f := StrToIntDef( rc_GetHintAttr( 'mobile-h-', cHint, true ) , 8 )
               else
               //if ( ( Pos( 'mobile-', cHint ) > 0 ) and ( mm.varB_Mobile_Screen ) ) or ( mm.varB_Mobile_Screen ) then
               if ( rc_IsMobile( cHint ) ) or ( mm.varB_Mobile_Screen ) then
                  f := StrToIntDef( rc_GetHintAttr( 'mobile-', cHint, true ) , 5 )
               else
               begin
                  f := StrToIntDef( Copy( cHint, 1, Pos( ' ', cHint ) - 1 ), -2 );
               end;
               cFieldMask := ansilowercase( pGrid.Hint  );

               cGridColsVisible := '';
               cTemp2 := '';

               for I := 0 to pGrid.Columns.Count - 1 do
               begin
                    cTemp := ansilowercase(pGrid.Columns[i].FieldName) ;
                    cTemp2 := ctemp2 + cTemp + ' ';
                    if Pos( RemoveAccents( cTemp ) , cGridColsVisible ) = 0  then
                    begin
                         cGridColsVisible := cGridColsVisible + RemoveAccents( cTemp ) + ' ';
                         Inc( iColumns );
                    end;
               end;
               cTemp2 := RemoveAccents( cFieldMask );
               I := pGrid.Columns.Count -1;

               while I >= 0 do
               begin
                    cTemp := Trim( Copy( cGridColsVisible, 1, Pos( ' ', cGridColsVisible ) ) );
                    iPos := Pos( cTemp + '[[' , ansilowercase( cTemp2 ) );
                    if ( iPos > 0 ) then
                    begin
                         cTemp3 := Copy( cTemp2, iPos, 10000 );
                         cTemp3 := Copy( cTemp3, 1, Pos( ']];', cTemp3 ) + 2 );
                    end;
                    cTemp2 := StringReplace( cTemp2, cTemp3, '', [rfReplaceAll] );
                    cField := Copy( cTemp3, 1, pos( '[[', cTemp3 )-1 );
                    if ( Pos( cField + ' ', cGridColsVisible ) > 0 ) and ( Pos( 'visible:', cTemp3 ) > 0 ) then
                    begin
                       if ( Pos( 'visible:false mobile-v', cTemp3 ) > 0 ) and ( mm.varB_Mobile_Screen_Portrait ) then
                       begin
                          Dec( iColumns );
                       end
                       else
                       if ( Pos( 'visible:false mobile-h', cTemp3 ) > 0 ) and ( mm.varB_Mobile_Screen_Landscape ) then
                       begin
                          Dec( iColumns );
                       end
                       else
                       if ( Pos( 'visible:false mobile', cTemp3 ) > 0 ) and ( mm.varB_Mobile_Screen ) then
                       begin
                          Dec( iColumns );
                       end
                       else
                       if ( Pos( 'visible:false', cTemp3 ) > 0 ) then
                       begin
                          Dec( iColumns );
                       end;
                    end;
                    cGridColsVisible := StringReplace( cGridColsVisible, cField + ' ', '', [rfReplaceAll] );
                    Dec( i );
               end;
               if f = -2 then
                  f := iColumns;
               if ( Pos( 'grid-noforcefit', pGrid.Hint ) = 0 ) then
               begin
                     if ( pCheckForceFit ) and ( iColumns > 0 ) then
                        pGrid.ForceFit := ( iColumns <= f );
               end;

               if pRefresh then
               begin
                  if ( pGrid.DataSource.DataSet.State <> dsInactive ) and
                     ( not ( pGrid.DataSource.DataSet.State in [dsEdit, dsInsert] ) ) then
                  begin
                     // para reconfigurar o "width" dos campos "rcAction_"
                     // removido até uma solução mais otimizada
                     // removed until a more optimized solution
                     if ( ( ( Pos( 'grid-resize', pGrid.Hint ) > 0 ) or ( Pos( 'grid-fm-rs!' , pGrid.Hint ) > 0 ) ) and
                        ( ( Pos( 'width-col:', pGrid.Hint ) > 0 ) ) ) or // ( ( Pos( 'width:', pGrid.Hint ) > 0 ) ) ) or //8.4.0.0 align col
                        ( Pos( 'rcAction_', cHint ) > 0 ) then
                     begin

                       if lowercase( pGrid.DataSource.DataSet.ClassName ) = 'tfdquery' then
                          pGrid.DataSource.DataSet.Refresh;
                       if ( pGrid.WebOptions.Paged ) and
                          ( ( Pos( 'grid-paginator', pGrid.Hint ) > 0 ) or ( mm.CONFIG_LAYOUT_GRID_RC_PAGINATOR = 'ON' ) ) then
                          dm_rc.rc_GridPaginatorUpdatePages( pGrid );
                     end;
                  end;
               end;
             end;
     end;
end;
//7.0.0.0
function tdm_rc.rc_ShowSweetAlert( pTitle, pText: String; pType: String ; pFormSender : TObject; pControlFocusConfirm : string ; pControlFocusDismiss : string; pCallBackConfirm:TNotifyEvent; pCallBackDismiss:TSweetAlertDismissEvent; pConfirmBtnText : string; pCancelBtnText : string; pShowLoader : boolean ): Boolean;
var
   cTmp : string;
begin
   oSweetAlertFocus_Confirm := nil;
   oSweetAlertFocus_Dismiss := nil;
   if pFormSender <> nil then
   begin
      if not pControlFocusConfirm.IsEmpty then
         oSweetAlertFocus_Confirm := rc_FindControl( pControlFocusConfirm , pFormSender );

      if not pControlFocusDismiss.IsEmpty then
         oSweetAlertFocus_Dismiss := rc_FindControl( pControlFocusDismiss, pFormSender );

      oSweetAlert := TUniSweetAlert( rc_FindControl( 'rcSweetAlert', pFormSender ) );

      if oSweetAlert <> nil then
      begin
         oSweetAlert.OnConfirm := UniSweetAlertConfirm;
         oSweetAlert.OnDismiss := UniSweetAlertDismiss;
      end
      else
      begin
         if Pos( '__', TUnicontrol( pFormSender ).Name ) > 0 then
            cTmp := Copy( TUnicontrol( pFormSender ).Name, 1, Pos( '__', TUnicontrol( pFormSender ).Name )-1 )
         else
            cTmp := TUnicontrol( pFormSender ).Name;
         rc_ShowError( 'rc_ShowSweetAlert Param Error:<br> Put one uniSweetAlert component( named rcSweetAlert ) on ' + cTmp );
         Abort;
      end;
   end
   else
      oSweetAlert := uniSweetAlert;

   Result := true;

   oSweetAlert.Title     := pTitle;
   oSweetAlert.Html      := pText; //uniSweetAlert.Text      := pText;
   oSweetAlert.Width     := 360;

   oSweetAlert.AlertType := atSuccess;
   oSweetAlert.ShowCancelButton    := False;
   if pType = 'success' then
      oSweetAlert.AlertType := atSuccess
   else
   if pType = 'info' then
      oSweetAlert.AlertType := atInfo
   else
   if pType = 'warning' then
      oSweetAlert.AlertType := atWarning
   else
   if pType = 'error' then
      oSweetAlert.AlertType := atError
   else
   if pType = 'question' then
   begin
      oSweetAlert.AlertType := atQuestion;
      oSweetAlert.ShowCancelButton    := true;
   end;
   if pConfirmBtnText <> '' then
      oSweetAlert.ConfirmButtonText := pConfirmBtnText
   else
      oSweetAlert.ConfirmButtonText := mm.MSG_OK;
   if pCancelBtnText <> '' then
      oSweetAlert.CancelButtonText := pCancelBtnText
   else
      oSweetAlert.CancelButtonText := mm.MSG_CANCEL;
   oSweetAlert.AllowEscapeKey      := True;
   oSweetAlert.AllowOutsideClick   := False;
   oSweetAlert.ShowCloseButton     := True;
   oSweetAlert.ShowLoaderOnConfirm := pShowLoader;
   oSweetAlert.InputType           := ItNone;
   //7.0.0.0
   if oSweetAlertFocus_Confirm = nil then
      oSweetAlert.OnConfirm        := pCallBackConfirm;
   if oSweetAlertFocus_Dismiss = nil then
   oSweetAlert.OnDismiss           := pCallBackDismiss;

   oSweetAlert.Show();
end;
//7.4.0.0
function tdm_rc.rc_ShowSweetAlert( pTitle, pText: String; pType: TRCSwtAlertType ; pFormSender : TObject; pControlFocusConfirm : string ; pControlFocusDismiss : string; pCallBackConfirm:TNotifyEvent; pCallBackDismiss:TSweetAlertDismissEvent; pConfirmBtnText : string; pCancelBtnText : string; pShowLoader : boolean ): Boolean;
var
   cTmp : string;
begin
   oSweetAlertFocus_Confirm := nil;
   oSweetAlertFocus_Dismiss := nil;
   if pFormSender <> nil then
   begin
      if not pControlFocusConfirm.IsEmpty then
         oSweetAlertFocus_Confirm := rc_FindControl( pControlFocusConfirm , pFormSender );

      if not pControlFocusDismiss.IsEmpty then
         oSweetAlertFocus_Dismiss := rc_FindControl( pControlFocusDismiss, pFormSender );

      oSweetAlert := TUniSweetAlert( rc_FindControl( 'rcSweetAlert', pFormSender ) );

      if oSweetAlert <> nil then
      begin
         oSweetAlert.OnConfirm := UniSweetAlertConfirm;
         oSweetAlert.OnDismiss := UniSweetAlertDismiss;
      end
      else
      begin
         if Pos( '__', TUnicontrol( pFormSender ).Name ) > 0 then
            cTmp := Copy( TUnicontrol( pFormSender ).Name, 1, Pos( '__', TUnicontrol( pFormSender ).Name )-1 )
         else
            cTmp := TUnicontrol( pFormSender ).Name;
         rc_ShowError( 'rc_ShowSweetAlert Param Error:<br> Put one uniSweetAlert component( named rcSweetAlert ) on ' + cTmp );
         Abort;
      end;
   end
   else
      oSweetAlert := uniSweetAlert;

   Result := true;

   oSweetAlert.Title     := pTitle;
   oSweetAlert.Html      := pText; //uniSweetAlert.Text      := pText;
   oSweetAlert.Width     := 360;

   oSweetAlert.AlertType := atSuccess;
   oSweetAlert.ShowCancelButton    := False;
   case pType of
    swtSuccess : oSweetAlert.AlertType := atSuccess;
    swtInfo    : oSweetAlert.AlertType := atInfo;
    swtWarning : oSweetAlert.AlertType := atWarning;
    swtError   : oSweetAlert.AlertType := atError;
    swtQuestion: begin
                   oSweetAlert.AlertType := atQuestion;
                   oSweetAlert.ShowCancelButton    := true;
                 end;
   end;
   if pConfirmBtnText <> '' then
      oSweetAlert.ConfirmButtonText := pConfirmBtnText
   else
      oSweetAlert.ConfirmButtonText := mm.MSG_OK;
   if pCancelBtnText <> '' then
      oSweetAlert.CancelButtonText := pCancelBtnText
   else
      oSweetAlert.CancelButtonText := mm.MSG_CANCEL;
   oSweetAlert.AllowEscapeKey      := True;
   oSweetAlert.AllowOutsideClick   := False;
   oSweetAlert.ShowCloseButton     := True;
   oSweetAlert.ShowLoaderOnConfirm := pShowLoader;
   oSweetAlert.InputType           := ItNone;

   if oSweetAlertFocus_Confirm = nil then
      oSweetAlert.OnConfirm        := pCallBackConfirm;
   if oSweetAlertFocus_Dismiss = nil then
   oSweetAlert.OnDismiss           := pCallBackDismiss;

   oSweetAlert.Show();
end;

procedure tdm_rc.rc_ShowSweetAlertSuccess(pMessage: string );
begin
     rc_ShowSweetAlert( mm.MSG_SUCCESS, pMessage, 'success' );
end;
procedure tdm_rc.rc_ShowSweetAlertWarning(pMessage: string );
begin
     rc_ShowSweetAlert( mm.MSG_WARNING, pMessage, 'warning' );
end;
procedure tdm_rc.rc_ShowSweetAlertError(pMessage: string );
begin
     rc_ShowSweetAlert( mm.MSG_ERROR, pMessage, 'error' );
end;
procedure tdm_rc.rc_ShowSweetAlertInfo(pMessage: string );
begin
     rc_ShowSweetAlert( mm.MSG_INFO, pMessage, 'info' );
end;

procedure tdm_rc.rc_ShowSweetAlertQuestion(pMessage: string; pFormSender : TObject ; pCallBackConfirm:TNotifyEvent; pCallBackDismiss:TSweetAlertDismissEvent; pConfirmBtnText : string; pCancelBtnText : string ; pShowLoader : boolean);
begin
     rc_ShowSweetAlert( '', pMessage, 'question', pFormSender, '', '', pCallBackConfirm, pCallBackDismiss, pConfirmBtnText, pCancelBtnText , pShowLoader );
end;

procedure tdm_rc.rc_ShowSweetAlertSimple(pMessage: string);
begin
     // good    warning     danger     attention
     pMessage := StringReplace( pMessage, #13#10, '<br>', [rfReplaceAll] );
     rc_ShowSweetAlert( mm.MSG_INFO , pMessage, 'info' );
end;
// 6.0.0.0
procedure tdm_rc.rc_ShowToaster( pType, pMessage: string; pSound : boolean; pTransition: string; pDuration : integer );
var
   cIcon,
   cTemp : string;
const
     cDir = 'files/js/toasty/dist/sounds/';
begin
     // 6.0.0.0
     if pTransition = '' then
        pTransition := 'pinItUp';

     cTemp := 'var toast = new Toasty({ ' +
              '    progressBar: true, ' +
              '    duration: ' + pDuration.ToString + ', ';

     if pSound then
        cTemp := cTemp +
                 '    enableSounds: true, ' +
                 '    sounds: { ' +
                 '         ' + pType + ': "' + cDir + '/' + pType + '/1.mp3", ' +
                 '     } '
     else
        cTemp := cTemp +
                 '    enableSounds: false ' ;

     cTemp := cTemp +
              '   }); ' +
              'toast.transition("' + pTransition + '");' +

              'toast.' + pType + '("' + pMessage + '");' ;

     UniSession.AddJS( cTemp );
end;
// 6.0.0.1
procedure tdm_rc.rc_ShowToaster( pType : TRCToastyType; pMessage: string; pSound : boolean; pTransition: TRCToastyTransition; pDuration : integer  ; pDoNotShow : boolean ); // 6.0.0.0
var
   cTransition,
   cType,
   cIcon,
   cTemp : string;
const
     cDir = 'files/js/toasty/dist/sounds/';
begin
     cTransition := Copy( GetEnumName( typeInfo( TRCToastyTransition ), Ord(pTransition)) , 4 ) ;
     cTransition := lowercase( Copy( cTransition, 1, 1 ) ) + Copy( cTransition, 2 );
     cType       := lowercase( Copy( GetEnumName( typeInfo( TRCToastyType ), Ord(pType)) , 4 ) );
     cType       := lowercase( Copy( cType, 1, 1 ) ) + Copy( cType, 2 );

     cTemp := 'var toast = new Toasty({ ' +
              '    progressBar: true, ' +
              '    duration: ' + pDuration.ToString + ', ';

     if pSound then
        cTemp := cTemp +
                 '    enableSounds: true, ' +
                 '    sounds: { ' +
                 '         ' + cType + ': "' + cDir + '/' + cType + '/1.mp3", ' +
                 '     } '
     else
        cTemp := cTemp +
                 '    enableSounds: false ' ;

     cTemp := cTemp +
              '   }); ' +
              'toast.transition("' + cTransition + '");' +

              'toast.' + cType + '("' + pMessage + '");' ;
     if not pDoNotShow then
        UniSession.AddJS( cTemp );
end;

function tdm_rc.rc_OpenQuery( pQry: TFDQuery; pSW : boolean ): Boolean;
var
   cMsgErr,
   cMsgSQL : string;
begin
     mm.varC_LastErrorMsg := '';
     pQry.Close;

     Result := false;

     pQry.SQL.Text := RemoveLineBreaks( pQry.SQL.Text );

     mm.varB_OperationProcessed := rc_ConnectDB( mm.CONFIG_DATABASE , mm.SQLConn, pSW );

     if mm.varB_OperationProcessed then
     begin
        try
           pQry.Open();

           // não manter as conexões abertas
           //
           // mm.SQLConn.Offline;
           Result := true;
        except on e:exception do
               begin
                    if UniApplication.FindComponent('MainForm' ) <> nil then mainform.rc_HideMenuMask( self ); // 6.0.0.0 menu mask warning

                    if Pos( 'operation aborted', lowercase( e.Message ) ) = 0 then
                    begin
                       mm.varC_LastErrorMsg := e.Message;

                       // declare a variavel no topo da função
                       cMsgSQL := '';
                       {$IFDEF DEBUG}
                       cMsgSQL := '<br>Query: ' + pQry.SQL.Text;
                       {$ENDIF}

                       cMsgErr := 'Failed to open table !<br><strong>Table</strong>: ' + pQry.Name + '<br><br>' +
                                  ' <strong>Error</strong>: ' + mm.varC_LastErrorMsg ;

                       mm.varC_LastErrorMsg := cMsgErr + cMsgSQL;
                       rc_ShowError( mm.varC_LastErrorMsg );
                    end
                    else
                    begin
                       mm.varC_LastErrorMsg := e.Message;
                       rc_ShowSweetAlert( 'Open Query' , mm.varC_LastErrorMsg, 'error' );
                    end;
                    UniSession.Log( '>>> rc_OpenQuery( sql ):' + cMsgSQL );
                    UniSession.Log( '>>> rc_OpenQuery( err ):' + cMsgErr  );

                    if mm.varB_LoginProcessed then Abort;
               end;
        end;
     end;
end;

function tdm_rc.rc_GetMD5(const pText: string): string;
var
  idmd5 : TIdHashMessageDigest5;
begin
     mm.varC_LastProcFuncError := 'rc_GetMD5';

     idmd5 := TIdHashMessageDigest5.Create;
     try
        result := ( idmd5.HashStringAsHex(pText) );
     finally
            idmd5.Free;
     end;
end;
//8.0.0.0
procedure tdm_rc.rc_CreateTourComponents( pForm:TObject ; pTheme : string );
var
   cForm,
   oImgArrow,
   oObjNext,
   oObjCurrent : String;

   oLabelPaginate, oLabelPrior, oLabelNext, oLabelClose,
   oLabelUp, oLabelDown, oLabelLeft, oLabelRight,
   olabTourTit1,
   olabTour1,
   oImgObjArrow : TUniLabel;

   oMemoTour : TUniMemo;

   oBtnNext, oBtnPrior : TUniBitBtn;

   oBtnObjTour : TObject;

   oParentComp : TComponent;

   oObjTourTrans,
   oObjMessage,
   oObjDetails,
   oObjFeatured : TUniContainerPanel;
   oimgTourTransp : TUniImage;

   oObjTourTransParent : TUniControl;

begin
     cForm := TUniComponent(pForm).Name;
     if Pos( '__', cForm ) > 0 then
        cForm := Copy( cForm, 1, Pos( '__', cForm ) - 1 );

     oObjTourTrans := TUniContainerPanel( TComponent( pForm ).FindComponent( 'paTourTransp' + cForm ) );
     if oObjTourTrans = nil then
     begin
         UniSession.SuspendLayouts;
         //8.0.0.0
         //if TUniControl(pForm).Name = 'MainForm' then
         if (TUniControl(pForm).Name = 'MainForm' ) or ( pForm is TUniForm ) then
            oObjTourTransParent := TUniControl(pForm)
         else
            oObjTourTransParent := TUniControl(TUniControl(pForm).Owner);

         oObjTourTrans  := rc_CreateContainer( TComponent( pForm ), oObjTourTransParent, 'paTourTransp' + cForm ,425 , 260, 0, 0, '[[round:all]]', false, true );
         oObjTourTrans.Width := oObjTourTransParent.width;
         oObjTourTrans.Height := oObjTourTransParent.Height;
         oObjTourTrans.Anchors := [akLeft, akBottom, akRight, akTop ];
         oObjTourTrans.Hint := '[[cls:rc-overlay]]';  //8.0.0.0

           oLabelUp := rc_CreateLabel( TComponent( pForm ), TUniControl(oObjTourTrans), 'labImgUp' + cForm ,33 , 34, 10, 10, '', false, true );
           oLabelUp.Caption := '<i class="fas fa-play fa-2x "></i>';
           oLabelUp.TextConversion := txtHTML;
           oLabelUp.Font.Color := clWhite;//8.0.0.0 //clRed
           oLabelUp.Visible := false;
           oLabelUp.Transparent := true;
           rc_AddCssClass( oLabelUp, 'bringtofront rc-pulse shadow-text rc-rotate--90 rc-rotate-45' );

           oLabelDown := rc_CreateLabel( TComponent( pForm ), TUniControl(oObjTourTrans), 'labImgDown'+ cForm ,33 , 34, 10, 10, '', false, true );
           oLabelDown.Caption := '<i class="fas fa-play fa-2x "></i>';
           oLabelDown.TextConversion := txtHTML;
           oLabelDown.Font.Color := clWhite;//8.0.0.0 //clRed
           oLabelDown.Visible := false;
           oLabelDown.Transparent := true;
           rc_AddCssClass( oLabelDown, 'bringtofront rc-pulse shadow-text rc-rotate-45' );

           oLabelLeft := rc_CreateLabel( TComponent( pForm ), TUniControl(oObjTourTrans), 'labImgLeft' + cForm,33 , 34, 10, 10, '', false, true );
           oLabelLeft.Caption := '<i class="fas fa-play fa-2x "></i>';
           oLabelLeft.TextConversion := txtHTML;
           oLabelLeft.Font.Color := clWhite;//8.0.0.0 //clRed
           oLabelLeft.Visible := false;
           oLabelLeft.Transparent := true;
           rc_AddCssClass( oLabelLeft, 'bringtofront rc-pulse shadow-text rc-rotate-180' );

           oLabelRight := rc_CreateLabel( TComponent( pForm ), TUniControl(oObjTourTrans), 'labImgRight'+ cForm ,33 , 34, 10, 10, '', false, true );
           oLabelRight.Caption := '<i class="fas fa-play fa-2x "></i>';
           oLabelRight.TextConversion := txtHTML;
           oLabelRight.Font.Color := clWhite;//8.0.0.0 //clRed
           oLabelRight.Visible := false;
           oLabelRight.Transparent := true;
           rc_AddCssClass( oLabelRight, 'bringtofront rc-pulse shadow-text' );
                                                                                                                       //184
           oObjMessage := rc_CreateContainer( TComponent( pForm ), TUniControl(oObjTourTrans), 'paMessage'+ cForm ,320 , 200, 12, 29, '', false, true );
           oObjMessage.Color := clWhite;
           rc_AddCssClass( oObjMessage, 'shadow-obj-tour bringtofront');
                                                                                                                           //184
             oObjDetails := rc_CreateContainer( TComponent( pForm ), TUniControl(oObjMessage), 'paTourDetails' + cForm,320 , 200, 12, 29, '', false, true );
             oObjDetails.Margins.Left     := 2;
             oObjDetails.Margins.Right    := 2;
             oObjDetails.Margins.Top      := 2;
             oObjDetails.Margins.Bottom   := 2;
             oObjDetails.Align            := alClient;
             oObjDetails.AlignWithMargins := True;
             if pTheme = 'default' then
                oObjDetails.Color := $002a2a2a
             else
                oObjDetails.Color := StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD );

             oObjFeatured := rc_CreateContainer( TComponent( pForm ), TUniControl(oObjTourTrans), 'paObjFeatured' + cForm,149 , 45, 12, 198, '', false, true );
             oObjFeatured.Color := clBtnFace;


             oLabTourTit1 := rc_CreateLabel( TComponent( pForm ), TUniControl(oObjMessage), 'labTourTit1' + cForm,33 , 34, 14, 9, '', false, true );
             oLabTourTit1.Caption := '...';
             if pTheme = 'default' then
             begin
                oLabTourTit1.Color := $002a2a2a;
                oLabTourTit1.Font.Color := $000080FF;
             end
             else
             begin
                oLabTourTit1.Color := StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD );
                oLabTourTit1.Font.Color := clWhite;//StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD );
             end;
             oLabTourTit1.Font.Size := 14;
             oLabTourTit1.Font.Style := [fsBold];

             oLabTour1 := rc_CreateLabel( TComponent( pForm ), TUniControl(oObjMessage), 'labTour1'+ cForm ,33 , 34, 218, 25, '', false, true );
             oLabTour1.Caption := '...';
             if pTheme = 'default' then
             begin
                oLabTour1.Color := $002a2a2a;
                oLabTour1.Font.Color := $000080FF;
             end
             else
             begin
                oLabTour1.Color := StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD );
                oLabTour1.Font.Color := clWhite;//StringToColor( mm.CONFIG_LAYOUT_MENUFONT_COLOR );
             end;
             oLabTour1.Font.Size := 10;
             oLabTour1.Visible := false;
                                                                                                                                           //38
             oMemoTour := rc_CreateMemo( TComponent( pForm ), TUniControl(oObjMessage), 'MemoTour'+ cForm ,oObjDetails.Width - 20 , 101, 10, 50, '', false, true );
             oMemoTour.ReadOnly := true;
             //oMemoTour.Enabled := false;
             oMemoTour.BorderStyle := ubsNone;
             oMemoTour.Lines.Clear;
             oMemoTour.Font.Size := 10;
             if pTheme = 'default' then
             begin
                oMemoTour.Color := $002a2a2a;
                oMemoTour.Font.Color := clSilver;
             end
             else
             begin
                oMemoTour.Color := StringToColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD );
                oMemoTour.Font.Color := clWhite;//StringToColor( mm.CONFIG_LAYOUT_MENUFONT_COLOR );
             end;
             oMemoTour.Lines.Add( Utf8ToAnsi( '...' ) );
             oMemoTour.ScrollBars := ssNone;
             oMemoTour.SelectOnFocus := false;
             oMemoTour.TabStop := false;
             if pTheme = 'default' then
             begin
               rc_AddCssClass( oMemoTour, 'rc-memo-colors' );
             end
             else
             begin
               rc_AddCssClass( oMemoTour, 'rc-memo-colors-crud' );
             end;
                                                                                                                //374
             oLabelClose := rc_CreateLabel( TComponent( pForm ), TUniControl(oObjMessage), 'btnClose' + cForm,32 , 32, oObjDetails.Left + oObjDetails.Width - 36, 11, '', false, true );
             oLabelClose.Caption := '<i class="fas fa-times fa-1x "></i>';
             oLabelClose.Font.Size := 10;
             if pTheme = 'default' then
                oLabelClose.Font.Color := clWhite
             else
                oLabelClose.Font.Color := clWhite; //StringToColor( mm.CONFIG_LAYOUT_MENU_COLOR );
             oLabelClose.TextConversion := txtHTML;
             oLabelClose.Cursor := crHandPoint;
             oLabelClose.OnClick := rcGuideTour_btnCloseClick;
             rc_AddCssClass( oLabelClose, 'rc-hover-zoom-1-2');
                                                                                                                                                 //oObjDetails.Top + 125
             oLabelPaginate := rc_CreateLabel( TComponent( pForm ), TUniControl(oObjMessage), 'labPaginate'+ cForm ,32 , 32, oObjDetails.Left + 6, oObjDetails.Top + 142, '', false, true );
             oLabelPaginate.Caption := '1 - 5';
             oLabelPaginate.Font.Size := 10;
             if pTheme = 'default' then
                oLabelPaginate.Font.Color := $000080FF
             else
                oLabelPaginate.Font.Color := clWhite;// StringToColor( mm.CONFIG_LAYOUT_MENU_COLOR );
             oLabelPaginate.TextConversion := txtHTML;

                                                                                                              //340
             oLabelPrior := rc_CreateLabel( TComponent( pForm ), TUniControl(oObjMessage), 'btnPrior'+ cForm ,32 , 32, oObjDetails.Left + oObjDetails.Width - 66, oObjDetails.Top + 142, '', false, true );
             oLabelPrior.Caption := '<i class="fas fa-arrow-left fa-1x "></i>';
             oLabelPrior.Font.Size := 10;
             if pTheme = 'default' then
                oLabelPrior.Font.Color := $000080FF
             else
                oLabelPrior.Font.Color := clWhite;// StringToColor( mm.CONFIG_LAYOUT_MENU_COLOR );
             oLabelPrior.TextConversion := txtHTML;
             oLabelPrior.Cursor := crHandPoint;
             oLabelPrior.OnClick := rcGuideTour_btnPriorClick;
             rc_AddCssClass( oLabelPrior, 'rc-hover-zoom-1-2');

             oLabelNext := rc_CreateLabel( TComponent( pForm ), TUniControl(oObjMessage), 'btnNext' + cForm,32 , 32, oObjDetails.Left + oObjDetails.Width - 40, oObjDetails.Top + 142, '', false, true );
             oLabelNext.Caption := '<i class="fas fa-arrow-right fa-1x "></i>';
             oLabelNext.Font.Size := 10;
             if pTheme = 'default' then
                oLabelNext.Font.Color := $000080FF
             else
                oLabelNext.Font.Color := clWhite;//StringToColor( mm.CONFIG_LAYOUT_MENU_COLOR );
             oLabelNext.TextConversion := txtHTML;
             oLabelNext.Cursor := crHandPoint;
             oLabelNext.OnClick := rcGuideTour_btnNextClick;
             rc_AddCssClass( oLabelNext, 'rc-hover-zoom-1-2');

             UniSession.ResumeLayouts;
     end
     else
     begin
         oObjTourTrans.Visible := oObjTourTrans.Tag = 0;
         if TUniLabel( TComponent( pForm ).FindComponent( 'labimgUp' + cForm ) ) <> nil then
            TUniLabel( TComponent( pForm ).FindComponent( 'labimgUp' + cForm ) ).Visible   := False;
         if TUniLabel( TComponent( pForm ).FindComponent( 'labimgDown' + cForm ) ) <> nil then
            TUniLabel( TComponent( pForm ).FindComponent( 'labimgDown' + cForm) ).Visible  := False;
         if TUniLabel( TComponent( pForm ).FindComponent( 'labimgLeft' + cForm ) ) <> nil then
            TUniLabel( TComponent( pForm ).FindComponent( 'labimgLeft' + cForm) ).Visible  := False;
         if TUniLabel( TComponent( pForm ).FindComponent( 'labimgRight' + cForm ) ) <> nil then
            TUniLabel( TComponent( pForm ).FindComponent( 'labimgRight' + cForm) ).Visible := False;

     end;
     rc_BringToFront( oObjTourTrans );
end;
//8.0.0.0
procedure tdm_rc.rc_ShowTour(pForm: TObject ; pRecreate:boolean );
var
   cTemp, cSeqObject,
   cForm, cTheme,
   imgArrow,
   objNext,
   objCurrent : String;

   Inifile : TIniFile;

   imgObjArrow : TUniLabel;

   btnObjTour : TObject;

   pParentComp : TComponent;

   paObjTourTrans, paObjMessage,
   paObjFeatured : TUniContainerPanel;
   f,i, iSeq, iTot, iSeqObject,
   iLeft, iTop, iL, iT,
   iLeft_To, iTop_To,
   iOffset_X, iOffset_Y : integer;
   bWatched, bLastGuide : Boolean;
   oObjFeatured : TUniControl;//8.0.0.0
begin
     if mm.CONFIG_RC_GUIDETOUR = 'OFF' then Exit; //6.0.0.0
     IniFile     := nil;
     iLeft_To    := 0;
     iTop_To     := 0;
     objCurrent  := '';
     try
          cForm := lowercase( TComponent( pForm ).Name );
          if Pos( '__', cForm ) > 0 then
             cForm := Copy( cForm, 1, Pos( '__', cForm ) - 1 );
          // watched ?
          if Fileexists( sm.FilesFolderPath + 'guide-tour' + mm.BACKSLASH + cForm + '.ini' ) then
          begin
             IniFile := TiniFile.Create( sm.FilesFolderPath + 'guide-tour' + mm.BACKSLASH + cForm + '.ini');
             bWatched := IniFile.ReadString( cform , 'watched', '' ) = 'Y';
             Inifile.Free;
          end;
          if not bWatched then
          begin
             try
               //recreate
               if ( mm.varI_GuideTourSeq = 0 ) and ( pRecreate ) and ( Fileexists( sm.FilesFolderPath + 'guide-tour' + mm.BACKSLASH + cForm + '.ini' ) ) then
                  DeleteFile( sm.FilesFolderPath + 'guide-tour' + mm.BACKSLASH + cForm + '.ini' );

               if not Fileexists( sm.FilesFolderPath + 'guide-tour' + mm.BACKSLASH + cForm + '.ini' ) then
               begin
                  iSeq := mm.varI_GuideTourSeq ;
                  mm.varI_GuideTourSeq := -1;
                  IniFile := TiniFile.Create( sm.FilesFolderPath + 'guide-tour' + mm.BACKSLASH + cForm + '.ini');
                  for f := 0 to TComponent( pForm ).ComponentCount - 1 do
                  begin
                     // 7.0.0.0 render_exclusion
                     if TComponent( pForm ).Components[f].InheritsFrom(TUniControl) then
//                     If ( Pos( 'TAction' , TComponent( pForm ).Components[f].ClassName ) = 0 ) and
//                        ( Pos( 'THelp' , TComponent( pForm ).Components[f].ClassName ) = 0 ) and
//                        ( Pos( 'TUniMenuItem' , TComponent( pForm ).Components[f].ClassName ) = 0 ) then
                     begin
                        If GetPropInfo( TComponent(pForm).Components[f].ClassInfo, 'Hint') <> nil then
                        begin
                           cTemp := rc_GetHintAttr( 'guide-tour:', TUniControl( TComponent(pForm).Components[f] ).hint ) ;
                           cTemp := StringReplace( cTemp, '<translate>', '', [rfReplaceAll] );
                        end;

                        if cTemp <> '' then
                        begin
                             oObjFeatured := TUniControl( TComponent(pForm).Components[f] );//8.0.0.0
                             Inc( mm.varI_GuideTourSeq );
                             //tour sequence
                             cSeqObject := rc_GetHintAttr( 'guide-tour-seq:', oObjFeatured.hint ) ;//8.0.0.0
                             if cSeqObject = '' then
                                cSeqObject := mm.varI_GuideTourSeq.ToString ;

                             IniFile.WriteString( 'object' + cForm + cSeqObject , 'title', cTemp );
                             IniFile.WriteString( 'object' + cForm + cSeqObject , 'name', oObjFeatured.Name );
                             cTemp := rc_GetHintAttr( 'guide-tour-offset-x:', oObjFeatured.hint ) ;
                             IniFile.WriteInteger( 'object' + cForm + cSeqObject , 'Offset_x', StrToIntDef( cTemp, 0 ) );
                             cTemp := rc_GetHintAttr( 'guide-tour-offset-y:', oObjFeatured.hint ) ;
                             IniFile.WriteInteger( 'object' + cForm + cSeqObject , 'Offset_y', StrToIntDef( cTemp, 0 ) );
                             cTemp := rc_GetHintAttr( 'guide-tour-text:', oObjFeatured.hint ) ;
                             cTemp := StringReplace( cTemp, '<translate>', '', [rfReplaceAll] );
                             IniFile.WriteString( 'object' + cForm + cSeqObject , 'text', cTemp );
                             cTemp := rc_GetHintAttr( 'guide-tour-arrow:', oObjFeatured.hint ) ;
                             IniFile.WriteString( 'object' + cForm + cSeqObject , 'arrow', cTemp );
                             cTemp := rc_GetHintAttr( 'guide-tour-theme:', oObjFeatured.hint ) ;
                             IniFile.WriteString( 'object' + cForm + cSeqObject , 'theme', cTemp );
                        end;
                     end;
                  end;
                  IniFile.WriteString( 'object' , 'tot', mm.varI_GuideTourSeq.ToString );
                  if ( mm.varI_GuideTourSeq = -1 ) and ( Fileexists( sm.FilesFolderPath + 'guide-tour' + mm.BACKSLASH + cForm + '.ini' ) ) then
                     DeleteFile( sm.FilesFolderPath + 'guide-tour' + mm.BACKSLASH + cForm + '.ini' );
                  if ( mm.varI_GuideTourSeq <> -1 ) then
                     mm.varI_GuideTourSeq := iSeq;
               end
               else
                  IniFile := TiniFile.Create( sm.FilesFolderPath + 'guide-tour' + mm.BACKSLASH + cForm + '.ini');

               //watched
               If IniFile.ReadString( cform , 'watched', '' ) <> 'Y' then
               begin
                  if TUniLabel( TComponent( pForm ).Owner.FindComponent( 'labimgUp' + cForm ) ) <> nil then
                     TUniLabel( TComponent( pForm ).Owner.FindComponent( 'labimgUp' + cForm ) ).Visible   := False;
                  if TUniLabel( TComponent( pForm ).Owner.FindComponent( 'labimgDown' + cForm ) ) <> nil then
                     TUniLabel( TComponent( pForm ).Owner.FindComponent( 'labimgDown' + cForm) ).Visible  := False;
                  if TUniLabel( TComponent( pForm ).Owner.FindComponent( 'labimgLeft' + cForm ) ) <> nil then
                     TUniLabel( TComponent( pForm ).Owner.FindComponent( 'labimgLeft' + cForm) ).Visible  := False;
                  if TUniLabel( TComponent( pForm ).Owner.FindComponent( 'labimgRight' + cForm ) ) <> nil then
                     TUniLabel( TComponent( pForm ).Owner.FindComponent( 'labimgRight' + cForm) ).Visible := False;

                  if ( mm.varI_GuideTourSeq <> -1 ) then
                  begin
                     objCurrent := 'object' + cForm + mm.varI_GuideTourSeq.ToString;
                     objCurrent := IniFile.ReadString( objCurrent , 'name', '' );

                     cTheme     := IniFile.ReadString( objCurrent , 'theme', '' );
                     rc_CreateTourComponents( pForm , cTheme);

                     objNext := 'object' + cForm + intToStr( mm.varI_GuideTourSeq + 1);
                     objNext := IniFile.ReadString( objNext , 'name', '' );

                     bLastGuide := ( objNext = '' );

                     iOffset_X  := IniFile.ReadInteger( 'object' + cForm + mm.varI_GuideTourSeq.ToString , 'Offset_x', 0 );
                     iOffset_Y  := IniFile.ReadInteger( 'object' + cForm + mm.varI_GuideTourSeq.ToString , 'Offset_y', 0 );

                     imgArrow  := IniFile.ReadString( 'object' + cForm + mm.varI_GuideTourSeq.ToString , 'arrow', '' );

                     iTot  := IniFile.ReadInteger( 'object' , 'tot', 0 );

                     if TComponent( pForm ).FindComponent( 'labPaginate'+ cForm )  <> nil then
                        TuniLabel( TComponent( pForm ).FindComponent( 'labPaginate' + cForm) ).Caption := ( mm.varI_GuideTourSeq + 1 ).ToString + ' / ' + ( iTot + 1 ).ToString ;

                     if TComponent( pForm ).FindComponent( 'labTourTit1'+ cForm )  <> nil then
                        TuniLabel( TComponent( pForm ).FindComponent( 'labTourTit1' + cForm) ).Caption := IniFile.ReadString( 'object' + cForm + mm.varI_GuideTourSeq.ToString , 'title', '' ) ;


                     if TComponent( pForm ).FindComponent( 'memoTour'+ cForm )  <> nil then
                     begin
                         TUniMemo( TComponent( pForm ).FindComponent( 'memoTour' + cForm) ).Lines.Clear;
                         TUniMemo( TComponent( pForm ).FindComponent( 'memoTour' + cForm) ).Color := $002a2a2a;
                         TUniMemo( TComponent( pForm ).FindComponent( 'memoTour'+ cForm ) ).Font.Color := clSilver;
                         TUniMemo( TComponent( pForm ).FindComponent( 'memoTour'+ cForm ) ).Lines.Add( IniFile.ReadString( 'object' + cForm + mm.varI_GuideTourSeq.ToString , 'text', '' ) ) ;
                     end;

                  end;
               end;

             finally
               IniFile.Free;
             end;

             if objCurrent <> '' then
             begin
                 // qual objeto será exibido ?
                 btnObjTour := TUniControl( TComponent( pForm ).FindComponent( objCurrent ) );
                 if btnObjTour = nil then
                 begin
                      rc_ShowError( 'objCurrent:<strong>' + objCurrent + '</strong> not found. Check the file. of config. TOUR' );
                 end;

                 //tentar pegar o TOP e LEFT do componente | try to get the TOP and LEFT of the component
                 iLeft := TUniControl( btnObjTour ).Left;
                 iTop  := TUniControl( btnObjTour ).Top;
                 pParentComp := TUniControl( btnObjTour );
                 if pParentComp <> nil then
                    if pParentComp.HasParent then
                       pParentComp := pParentComp.GetParentComponent
                    else
                       pParentComp := nil;
                 repeat
                     if pParentComp <> NIL then
                     begin
                        iLeft := iLeft + TUniControl( pParentComp ).Left;
                        iTop  := iTop  + TUniControl( pParentComp ).Top;

                        pParentComp := TUniControl( pParentComp ).GetParentComponent;
                     end;
                 until ( pParentComp = nil ) or not ( TUniControl( btnObjTour ).HasParent );

                 //posicionar a mensagem
                 paObjMessage := TUniContainerPanel( TComponent( pForm ).FindComponent( 'paMessage' + cForm ) );
                 if paObjMessage <> nil then
                 begin
                    paObjMessage.SetFocus;
                 end;
                 //seta
                 imgObjArrow := TUniLabel( TComponent( pForm ).FindComponent( 'labImg' + imgArrow + cForm) );
                 if imgObjArrow <> nil then
                 begin
                     imgObjArrow.Visible := True;
                     if imgArrow = 'up' then
                     begin
                        //fica acima do paObjMensagem
                        iTop_To  := iTop + TUniControl( btnObjTour ).Height + iOffset_Y ;
                        iLeft_To := iLeft + iOffset_X;
                     end
                     else
                     if imgArrow = 'down' then
                     begin
                        //fica abaixo do paObjMensagem
                        iTop_To  := iTop + iOffset_Y;
                        iLeft_To := iLeft + iOffset_X;
                     end
                     else
                     if imgArrow = 'left' then
                     begin
                        //fica do lado esquerdo do objeto( com excecao se estourar os limites da tela )
                        iTop_To  := iTop + iOffset_Y;
                        iLeft_To := iLeft + TUniControl( btnObjTour ).Width + iOffset_X ;
                     end
                     else
                     if imgArrow = 'right' then
                     begin
                        //fica abaixo do paObjMensagem
                        iTop_To  := iTop + iOffset_Y;
                        iLeft_To := iLeft - TUniControl( btnObjTour ).Width + iOffset_X;
                     end;

                     imgObjArrow.Top     := iTop_To  ;
                     imgObjArrow.Left    := iLeft_To ;

                     //posicionar a mensagem
                     iTop  := imgObjArrow.Top ;
                     iLeft := imgObjArrow.Left ;

                     if iOffset_X = 9001009 then
                     begin
                        iOffset_X := ( mm.varI_ScreenWidth div 2 ) - ( imgObjArrow.Width div 2 ) ;

                        iLeft_To := iOffset_X;
                        iLeft := iLeft_To;
                        imgObjArrow.Left    := iLeft_To ;
                     end;
                     if iOffset_Y = 9001009 then
                     begin
                        iOffset_Y := ( mm.varI_ScreenHeight div 2 ) - ( TuniControl( paObjMessage ).Height div 2 ) ;
                        iTop_To := iOffset_Y;
                        iTop    := iTop_To;
                        imgObjArrow.Top     := iTop_To;
                     end;

                     if imgArrow = 'up' then
                     begin
                        //fica acima do paObjMensagem
                        iTop_To  := iTop + imgObjArrow.Height - 5;
                        iLeft_To := iLeft;
                     end
                     else
                     if imgArrow = 'down' then
                     begin
                        //fica acima do paObjMensagem
                        iTop_To  := iTop - paObjMessage.Height ;
                        iLeft_To := iLeft;
                     end
                     else
                     if imgArrow = 'left' then
                     begin
                        //fica acima do paObjMensagem
                        iTop_To  := iTop ;
                        iLeft_To := iLeft + imgObjArrow.Width - 5;
                     end
                     else
                     if imgArrow = 'right' then
                     begin
                        //fica acima do paObjMensagem
                        iTop_To  := iTop ;
                        iLeft_To := iLeft - paObjMessage.Width - 5;
                     end;

                     if ( iLeft_To + paObjMessage.width ) > mm.varI_ScreenWidth then
                        iLeft_To := mm.varI_ScreenWidth - paObjMessage.width - 10;

                     if ( iTop_To + paObjMessage.Height ) > mm.varI_ScreenHeight then
                        iTop_To := mm.varI_ScreenHeight - paObjMessage.Height - 10;

                     imgObjArrow.Visible := true;

                     //destacar o objeto que será alvo de explicacao
                     paObjFeatured := TUniContainerPanel( TComponent( pForm ).FindComponent( 'paObjFeatured' + cForm) );

                     if paObjFeatured <> nil then
                     begin
                         //paObjFeatured.Color  := clInfoBk;// clBtnFace;
                         paObjFeatured.Align  := alNone;
                         paObjFeatured.Top    := imgObjArrow.Top - iTop - 6;// TUniControl( btnObjTour ).Top - 6;// iTop;
                         paObjFeatured.Left   := imgObjArrow.Left - iLeft - 6;//TUniControl( btnObjTour ).Left- 6;// iLeft;
                         paObjFeatured.Width  := TUniControl( btnObjTour ).Width + 6;
                         paObjFeatured.Height := TUniControl( btnObjTour ).Height + 6;
                         paObjFeatured.Hint := '[[round:all|cls:rc-highlighted bringtofront-lower-3]]';//8.0.0.0
                         rc_AddCssClass( TUniControl( btnObjTour ), 'bringtofront-higher-3' );
                     end;

                     UniSession.AddJS( paObjMessage.JSName +
                                       '.animate({ duration: ' + inttostr( 400 ) +
                                       ', to: {      x:' + inttostr( iLeft_To  ) +
                                       ',            y:' + inttostr( iTop_To  ) +
                                       ',      opacity: ' + inttostr( 1  ) + ' } } );');
                 end;
             end
             else
             begin
                 paObjTourTrans := TUniContainerPanel( TComponent( pForm ).FindComponent( 'paTourTransp' + cForm ) );
                 if paObjTourTrans <> nil then
                 begin
                     paObjTourTrans.Visible := false;
                     paObjTourTrans.Tag := 1;
                 end;
                 mm.varI_GuideTourSeq := 0;
                 //watched
                 IniFile := TiniFile.Create( sm.FilesFolderPath + 'guide-tour' + mm.BACKSLASH + cForm + '.ini');
                 //if objCurrent <> '' then
                    IniFile.WriteString( cform , 'watched', 'Y' );
                 Inifile.Free;
             end;
          end;
     except on e:exception do
            begin
                 dm_rc.rc_ShowSweetAlert( mm.MSG_ERROR, 'rc_ShowTour Failed !', 'error' );
            end;
     end;
end;
//8.0.0.0
function tdm_rc.rc_PermissionVerify( pFormName, pCaption: String; pPos: Integer ; pAdm : boolean ; pShowMessage : boolean  ): Boolean;
var
   //8.0.0.0 same table...many forms
   pFormName_Form, pFormName_PermissionField : string;

   bSecundary : Boolean;
   iPos : integer;
   cUserID,
   cMessage : String;

   function HasAcess( pUser, pPermissionMsg : String; pPos : integer; pShowMessage : boolean  ) : Boolean;
   begin
         cMessage := pPermissionMsg;
         iPos     := pPos;
         //[PT] para cada tabela tem que criar o campo equivalente em RESTRICOES. se nao achou o campo, libera o acesso total
         //      a criptografia usa 3 chaves pra ser gerada, entao nao adianta abrir o BD e copiar um CAMPO de restricao pra outro
         //[EN] for each table you have to create the equivalent field in RESTRICOES. If you didn't find the field, give full access
         //      encryption uses 3 keys to be generated, so there is no point opening the DB and copying one restriction FIELD to another
         if pCaption = '' then
           pCaption := mm.varI_Tabela_Form;

         if mm.varC_User_Permissions = '' then
         begin
            mm.varC_User_Permissions := Replicate( '1' , 50 );
            mm.varC_User_Permissions := Crypta( mm.varC_User_Permissions, pUser + pCaption  );
            //
            // criptografia PADRÃO para acesso a USUÁRIOS pelo CODIUSER 1
            //
            // 090B49094FE161FB42007C9CA6A5B987CD90A5B9B8A9BE8C8DCCCE31173B192B2E36084A3656EC6CF2490F2E3B0366D76DFD1F
         end;

         Result := True;

         mm.varC_User_Permissions := DeCrypta( mm.varC_User_Permissions, pUser + pCaption );

         if ( Pos( ',', mm.varC_User_Permissions ) > 0 ) or
            ( Pos( '*', mm.varC_User_Permissions ) > 0 ) or
            ( Pos( '.', mm.varC_User_Permissions ) > 0 ) or
            ( Pos( 'e', mm.varC_User_Permissions ) > 0 ) then
            rc_ShowSweetAlert( mm.MSG_INFO, 'something it´s wrong with mm.varC_User_Permissions data!( ' + pUser + pCaption + ')'  , 'warning' );

         Result := True;

         iPos := pPos;

         If ( ( cMessage = mm.MSG_ACCESS_MOVE_TO ) and ( Copy( mm.varC_User_Permissions, iPos , 1 ) = '1' ) ) then
         begin
              if pFormName <> '' then
              begin
                 if ( cMessage = mm.MSG_ACCESS_MOVE_TO ) and ( pShowMessage ) then
                    rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_USER_DO_NOT_HAVE_ACCESS + AnsiUpperCase( cMessage ) + AnsiUpperCase( pFormName ) + '( apenas FRACIONAMENTO ) !' , 'warning' );
              end;

              Result := False;
         end
         else
         If ( cMessage <> mm.MSG_ACCESS_MOVE_TO ) and ( Copy( mm.varC_User_Permissions, iPos , 1 ) <> '1' ) then
         begin
              //                                        +-> opção criada a pedido do RAI DUARTE( grupo RadCORE )
         //                                            |
              if ( pFormName <> '' ) and ( pFormName <> 'showMenuOption' ) and ( pShowMessage ) then
              begin
                  rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_USER_DO_NOT_HAVE_ACCESS + AnsiUpperCase( cMessage ) + AnsiUpperCase( pFormName ) + ' !' , 'warning' );
              end;

              Result := False;
         end;

         if cMessage = mm.MSG_ACCESS_MOVE_TO then
         begin
              If Copy( mm.varC_User_Permissions, iPos , 1 ) = '1' then
              begin
                 Result := False;
              end;
         end
         else
         begin
              If Copy( mm.varC_User_Permissions, iPos , 1 ) <> '1' then
              begin
                 Result := False;
              end;
         end;
   end;
begin
       //7.4.0.0 run login
       if not mm.varB_RunLogin then
       begin
           pAdm := false;
           Result := true;
           Exit;
       end
       else
       begin

          //8.1.0.0
          if pAdm then pAdm := dm_rc.memUsers.FieldByName('master').AsString = '1';
       end;
       //pAdm := dm_rc.memUsers.FieldByName('master').AsString = '1'; // mm.VALUE_YES  //6.0.0.0

       if pCaption = '' then
         pCaption := mm.varI_Tabela_Form;

       pCaption := LowerCase( pCaption );
       iPos     := pPos;

       cMessage := pFormName;
       if Pos( '<span>', cMessage ) > 0 then
       begin
          cMessage := Copy( cMessage, Pos( '<span>', cMessage ) + 6 );
          cMessage := Trim( Copy( cMessage, 1, Pos( '<', cMessage ) -1 ) );
          //8.0.0.0 same table...many forms
          if Pos( '@@@@', pFormName ) > 0 then
          begin
             pFormName_Form            := Copy( pFormName, 1, Pos( '@@@@', pFormName ) - 1 ) ;
             pFormName_PermissionField := Copy( pFormName, Pos( '@@@@', pFormName ) + 4 ) ;
             pFormName                 := pFormName_Form;
             pCaption                  := lowercase( pFormName_PermissionField );

             if pCaption = '' then
               pCaption := mm.varI_Tabela_Form;

          end
          else
             pFormName := cMessage;
       end;


       bSecundary := ( Copy( pFormName , 1, 2 ) = '.2.' );

       if Copy( pFormName , 1, 2 ) = '.2.' then
          pFormName   := Copy( pFormName , 3, 50 );

         //opcoes gerais
         cMessage := 'a ';

         if ( Copy( uppercase( pCaption ), 1, 6 ) <> 'REPORT' ) and
            ( uppercase( pCaption ) <> 'RELATORIOS' )  and
            ( uppercase( pCaption ) <> 'MENUS' )  and
            ( uppercase( pCaption ) <> 'ACERTO_ESTOQUE' ) then //PQ ACERTO NAO TEM ALTERACAO, AI QUEBRA A REGRA
         begin

             Case iPos of
                  1 : cMessage := ' ' + mm.MSG_ACCESS_TO;
                  2 : cMessage := ' ' + mm.MSG_ACCESS_INSERT_TO;
                  3 : cMessage := ' ' + mm.MSG_ACCESS_EDIT_TO;
                  4 : cMessage := ' ' + mm.MSG_ACCESS_DELETE_TO;
                  //5 : cMessage := mm.MSG_ACCESS_SEARCH_TO;
             end;
         end;

         if ( ( uppercase( pCaption ) = 'VENDAS' ) ) and
            ( iPos > 5 ) then
         begin
             //opcoes extras
             Case iPos of
                   6 : cMessage := ' a EXCLUSÃO DE PRODUTOS ';
                   7 : cMessage := ' a FECHAMENTO DE ';
                   9 : cMessage := ' a ALTERAÇÃO DE PREÇOS EM ';
                  10 : cMessage := ' a DESCONTO EM ';
                  12 : cMessage := ' a LIBERAR DESCONTO EM ';
                  19 : cMessage := ' a ALTERAR ESTÁGIOS EM ';
                  20 : cMessage := ' a RESEQUENCIALIZAR EM ';
                  21 : cMessage := ' a SUSPENDER/LIBERAR EM ';
                  22 : cMessage := ' a MARCAR COMISSÃO PAGA EM ';
                  23 : cMessage := ' a ALTERAR FUNCIONÁRIO EM ';
             end;
         end
         else
         if ( uppercase( pCaption ) = 'ACERTO_ESTOQUE' ) then
         begin

             //opcoes extras
             Case iPos of
                   1 : cMessage := ' ' + mm.MSG_ACCESS_TO;
                   2 : cMessage := ' ' + mm.MSG_ACCESS_INSERT_TO;
                   3 : cMessage := ' ' + mm.MSG_ACCESS_DELETE_TO;
                   4 : cMessage := ' a SAÍDA EM ';
                   //5 : cMessage := 'a SAÍDA EM ';
                   6 : cMessage := ' a ENTRADA EM ';
                   7 : cMessage := ' ' + mm.MSG_ACCESS_MOVE_TO;
             end;
         end;

         //[PT] critica será de LOGIN principal ou secundario ?
         //     Login secundario é quando uma acao requer acesso SUPERIOR, entao o Form LOGIN_SECUNDARIO é acionado.
         //[PT] criticism will be primary or secondary LOGIN?
         //     Secondary login is when an action requires HIGHER access, then the LOGIN_SECUNDARIO Form is triggered.
         mm.varC_User_Permissions  := '';
         //8.0.0.0 same table...many forms
         //[PT] remoção da retrocompatibilidade( thanks for BugTracker Mr.Fabio Oliveira )
         //[EN] backwards compatibility removal (thanks for BugTracker Mr.Fabio Oliveira)
         if Copy( pCaption, 1, 2 ) = '__' then
            pCaption := Copy( pCaption, 3 );

         if not bSecundary then
         begin
              if memUsersPermissions.FieldList.IndexOf ( pCaption ) >= 0 then
                 mm.varC_User_Permissions  := memUsersPermissions.FieldByName( pCaption ).AsString;

              cUserID := memUsers.fieldbyname('codigo').AsString;
         end
         else
         begin
              if memUsersPermissionsSecondary.FieldList.IndexOf ( pCaption ) >= 0 then
                 mm.varC_User_Permissions  := memUsersPermissionsSecondary.FieldByName( pCaption ).AsString;

              cUserID := memUsersPermissionsSecondary.FieldByName( 'codiuser' ).AsString;
         end;
         Result := pAdm;
         if not Result then
            Result := HasAcess( cUserID, cMessage, iPos, pShowMessage );
         // só pede acesso superior quando for o caso         +-> opção criada a pedido do RAI DUARTE( grupo RadCORE )
         //                                                  |
         if ( not Result ) and ( not pAdm ) and ( pFormName <> 'showMenuOption' ) and ( pShowMessage )  then
         begin
              rc_ShowInputBox( mm.MSG_USER_SUPERIOR_PERMISSION , mm.MSG_USER, '', mm.MSG_USER_RELEASE_PASSWORD, '', True );

              // é email, pra prevenir erro de digitacao( maiuscula ) | it is email, to prevent typing errors (capital letters)
              mm.varC_InputBox_Result1 := lowercase( mm.varC_InputBox_Result1 );

              Result := ( rc_GetMD5( mm.varC_InputBox_Result2 ) = mm.varC_UserPassAdmin );

              if ( not Result ) and ( mm.varC_InputBox_Result1 <> '' ) then
              begin
                   mm.varC_User_Permissions := '';
                   //Verifica RESTRICAO | RESTRICTION verify
                   memUsersSecondary .Close;
                   memUsersSecondary .Data := rc_GetRecord( mm.varB_IsNot_API ,
                                                            false,
                                                            ' select codigo,nome,email,senha ' +
                                                            ' from ' + dm_rc.rc_DBSchema + 'usuarios ' + //6.1.0.0
                                                            ' where email = ' + QuotedStr( Trim( mm.varC_InputBox_Result1 )) +
                                                            varIIF( dm_rc.memUsers.FieldByName('master').AsString <> '1', //mm.VALUE_YES, //6.0.0.0
                                                                    ' and codiemp = ' + IntToStr( mm.varI_Code_Company ), '' ) );
                   if mm.varC_LastErrorMsg <> '' then
                   begin
                       rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastErrorMsg, 'warning' );
                       Exit;
                   end
                   else
                   begin
                       Result := True;
                       if ( mm.varC_InputBox_Result1 = '' ) or ( memUsersSecondary.FieldByName('email').AsString <> Trim( ( mm.varC_InputBox_Result1 ) )) then
                       begin
                             mm.varC_LastErrorMsg := mm.MSG_INVALID_USER;

                             rc_ShowSweetAlert( mm.MSG_INFO, mm.varC_LastErrorMsg, 'warning' );

                             Result := False;

                             Exit;
                       end;
                   end;
                   if Result then
                   begin
                       Result := False;
                       //[PT] dm_lkp.zQryLkpRestricao_principal ficará aberta durante TODO o projeto
                       //     para evitar o select CONSTANTE na funcao de VERIFICACAO DE RESTRICAO
                       //[EN] dm_lkp.zQryLkpRestricao_principal will remain open throughout the entire project
                       //     to avoid CONSTANT select in the RESTRICTION CHECK function
                       memUsersPermissionsSecondary.Close;
                       memUsersPermissionsSecondary.Data := rc_GetRecord( mm.varB_IsNot_API ,
                                                                      false,
                                                                      ' select * ' +
                                                                      ' from ' + dm_rc.rc_DBSchema + 'usuarios_restricoes ' + //6.1.0.0
                                                                      ' where codiuser = ' + memUsersSecondary .FieldByName('codigo').AsString );
                       if mm.varC_LastErrorMsg <> '' then
                       begin
                           rc_ShowSweetAlert( mm.MSG_ERROR, mm.varC_LastErrorMsg, 'warning' );
                           Exit;
                       end;

                       if memUsersPermissionsSecondary.FieldList.IndexOf ( pCaption ) >= 0 then
                          mm.varC_User_Permissions  := memUsersPermissionsSecondary.FieldByName( pCaption ).AsString;

                       cUserID := memUsersPermissionsSecondary.FieldByName( 'codiuser' ).AsString;
                       If rc_GetMD5( memUsersSecondary.FieldByName( 'nome' ).AsString + mm.varC_InputBox_Result2 ) = ( memUsersSecondary.FieldByName( 'senha' ).AsString ) then
                          Result := HasAcess( cUserID, '', 0, pShowMessage )
                       else
                          Result := HasAcess( '-999', '' , 0, pShowMessage );
                   end;
              end;
         end;
end;
// visible on / off lookup controls
// 6.0.0.0
procedure tdm_rc.rc_LookUpControlsVisible(pFrame: TObject; pLkp: TUniControl; pState: Boolean);
var
   LkpDBCod,
   LkpDBPesqExtra,
   LkpDBEdit : TUniDBEdit;

   LkpBtn : TUniSpeedButton;
begin
     LkpDBEdit      := TUniDBEdit( TComponent( pFrame ).FindComponent( pLkp.Name ) );
     LkpDBCod       := TUniDBEdit( TComponent( pFrame ).FindComponent( pLkp.Name + '_CodID' )  );
     LkpDBPesqExtra := TUniDBEdit( TComponent( pFrame ).FindComponent( pLkp.Name + '_PesqExtra' ) );
     LkpBtn         := TUniSpeedButton( TComponent( pFrame ).FindComponent( StringReplace( lowercase( pLkp.Name ) , 'edlkp' , 'btnlkp' , [rfReplaceAll] ) ) );

     if LkpDBEdit <> nil then
        LkpDBEdit.Visible := pState;

     if ( LkpDBCod <> nil ) and ( Pos( 'searchonly', pLkp.Hint ) = 0 ) then
        LkpDBCod.Visible := pState;

     if ( LkpDBPesqExtra <> nil ) and ( Pos( 'searchonly', pLkp.Hint ) = 0 ) then
        LkpDBPesqExtra.Visible := pState;

     if ( LkpBtn <> nil ) and ( Pos( ' *', pLkp.Hint ) = 0 ) then
        LkpBtn.Visible := pState;
end;
// v. 7.0.0.0
// enabled on / off lookup controls
procedure tdm_rc.rc_LookUpControlsEnabled( pFrame: TObject; pLkp : TUniControl; pState: Boolean);
var
   LkpDBCod,
   LkpDBPesqExtra,
   LkpDBEdit : TUniDBEdit;

   LkpBtn, LkpBtnAdd : TUniSpeedButton;
begin
     LkpDBEdit      := TUniDBEdit( TComponent( pFrame ).FindComponent( pLkp.Name ) );
     LkpDBCod       := TUniDBEdit( TComponent( pFrame ).FindComponent( pLkp.Name + '_CodID' )  );
     LkpDBPesqExtra := TUniDBEdit( TComponent( pFrame ).FindComponent( pLkp.Name + '_PesqExtra' ) );
     LkpBtn         := TUniSpeedButton( TComponent( pFrame ).FindComponent( StringReplace( lowercase( pLkp.Name ) , 'edlkp' , 'btnlkp' , [rfReplaceAll] ) ) );
     LkpBtnAdd      := TUniSpeedButton( TComponent( pFrame ).FindComponent( StringReplace( lowercase( pLkp.Name ) , 'edlkp' , 'btnlkpAdd' , [rfReplaceAll] ) ) );

     if LkpDBEdit <> nil then
        rc_ObjectEnabled( pFrame, LkpDBEdit, pState, true );

     if LkpDBCod <> nil then
        rc_ObjectEnabled( pFrame, LkpDBCod, pState, true );

     if LkpDBPesqExtra <> nil then
        rc_ObjectEnabled( pFrame, LkpDBPesqExtra, pState, true );

     if LkpBtn <> nil then
        rc_ObjectEnabled( pFrame, LkpBtn, pState, true );

     if LkpBtnAdd <> nil then
        rc_ObjectEnabled( pFrame, LkpBtnAdd, pState, true );
end;
// clear lookup controls
procedure tdm_rc.rc_LookUpControlsClear( pFrame: TObject; pLkp : TUniControl);
var
   LkpDBCod,
   LkpDBPesqExtra,
   LkpDBEdit : TUniDBEdit;

   LkpBtn, LkpBtnAdd : TUniSpeedButton;
begin
     LkpDBEdit      := TUniDBEdit( TComponent( pFrame ).FindComponent( pLkp.Name ) );
     LkpDBCod       := TUniDBEdit( TComponent( pFrame ).FindComponent( pLkp.Name + '_CodID' )  );
     LkpDBPesqExtra := TUniDBEdit( TComponent( pFrame ).FindComponent( pLkp.Name + '_PesqExtra' ) );
     LkpBtn         := TUniSpeedButton( TComponent( pFrame ).FindComponent( StringReplace( lowercase( pLkp.Name ) , 'edlkp' , 'btnlkp' , [rfReplaceAll] ) ) );
     LkpBtnAdd      := TUniSpeedButton( TComponent( pFrame ).FindComponent( StringReplace( lowercase( pLkp.Name ) , 'edlkp' , 'btnlkpAdd' , [rfReplaceAll] ) ) );

     if LkpDBEdit <> nil then
        LkpDBEdit.Clear;

     if LkpDBCod <> nil then
        LkpDBCod.Clear;

     if LkpDBPesqExtra <> nil then
        LkpDBPesqExtra.Clear;
end;

procedure tdm_rc.rc_LookUpClickButton( pFrame: TObject; pEdit: string);

var
   sTemp : string;
   pDBEdit : TUniDBEdit;

   LkpName,
   LkpName_DataField_CodID : string;

   iPos : integer;
begin
  // associar o Button de pesquisa ( saber se veio de lkp_COD ou lkp_PesqEXTRA
  sTemp := LowerCase( pEdit ) ;
  sTemp := Copy( sTemp, 6, 50 );

  // Tem CODID dinamico ?
  iPos := 0;
  if Pos( '_codid' , sTemp ) > 0 then
     iPos      := Pos ( '__' , sTemp );

  LkpName_DataField_CodID := '';
  LkpName   := '';
  if iPos > 0 then
  begin
     LkpName_DataField_CodID := Copy( sTemp, iPos + 2 , 50 );
     LkpName   := Copy( sTemp, 6, iPos - 1 );
     LkpName   := StringReplace( sTemp , '_codid' , '' , [rfReplaceAll] );
     sTemp     := Copy( LkpName, 6, 50 );
  end;

  pDBEdit := TUniDBEdit( TComponent( pFrame ).FindComponent( 'edlkp' + sTemp ) );
  if pDBEdit <> nil then
  begin
       if pDBEdit.Text <> '' then
       begin
          if Pos( '_pesqextra', sTemp ) > 0 then
             sTemp := StringReplace( sTemp, '_pesqextra' , '' , [rfReplaceAll] )
          else
          if Pos( '_codid', sTemp ) > 0 then
             sTemp := StringReplace( sTemp, '_codid' , '' , [rfReplaceAll] );

          if TUniSpeedButton( TComponent( pFrame ).FindComponent( 'btnLkp' + sTemp ) ) = nil then
             rc_ShowError( format( '<h2> Search LookUp Button Failed! </h2> <br>' +
                                   '<strong> MESSAGE </strong> <br> <hr>' + '<strong> btnLkp: </strong>' + '%s' + 'not declared!' + '<br> <br>' +
                                   '<strong> TIP </strong> <br> <hr> Button with non-standard nomenclature.' + '<br> <br>' +
                                   mm.MSG_CONTACT_SUPPORT, [ sTemp , 'edlkp' + sTemp ] ) )
          else
          begin
             // indica q é uma pesquisa DIGITADA
             //
             // a diferença é que CASO o resultado seja apenas 1 registro, não será exibido o LOOKUP PADRAO
             TUniSpeedButton( TComponent( pFrame ).FindComponent( 'btnLkp' + sTemp ) ).Tag := 1;
             TUniSpeedButton( TComponent( pFrame ).FindComponent( 'btnLkp' + sTemp ) ).Click;
          end;
       end;
  end;
end;
// 6.0.0.0
function tdm_rc.rc_LookUpSearch( pFrame : TObject ; pLkpbtnLkp: String ; pSender : TObject; pLookUpGridAttr : string ) : Boolean;
var
   LkpDBCod,
   LkpDBPesqExtra,
   LkpDBEdit : TUniDBEdit;
   pDSDetail : TDataSource;

   pDM : TDataModule;

   pSQLDetail,
   pSQLMaster,
   LkpQuery : TFDQuery;

   cGetThisPK, // 6.0.0.0
   sExtraSearchField,
   sExtraReturnField,
   cLkpAttr, // 6.0.0.0
   cTemp,
   sTemp,
   sSearchFields,
   LkpJoinTable,
   LkpJoinField,
   LkpTable : string;

   bIsExtraSearch : boolean;

   iPos,
   iTag : integer;
begin
  inherited;

  Result         := true;
  pSQLMaster     := nil;
  bIsExtraSearch := false;
  // configure your settings
  case mm.varLT_Lang of
       ltpt_BR, ltpt_PT : begin
                   cMSG_SEARCH_RECORD := 'Pesquisa de Registros';
                 end;
       lten_US, lten_GB: begin
                  cMSG_SEARCH_RECORD := 'Record Search';
                end;
       ltes_ES: begin
                  cMSG_SEARCH_RECORD := 'Búsqueda de registros';
                end;
       ltfr_FR: begin
                  cMSG_SEARCH_RECORD := 'Recherche d''enregistrement';
                end;
       ltde_DE: begin
                  cMSG_SEARCH_RECORD := 'Datensatzsuche';
                end;
       ltit_IT: begin
                  cMSG_SEARCH_RECORD := 'Ricerca record';
                end;
       lttr_TR : begin
                  cMSG_SEARCH_RECORD := 'Kayıt Arama';
                end;
       ltru_RU : begin
                  cMSG_SEARCH_RECORD := 'Поиск записи';
                end;
      ltzn_CH : begin
                   cMSG_SEARCH_RECORD := 'Record Search';
                end;
      ltin_ID : begin
                  cMSG_SEARCH_RECORD := 'Record Search';
                end;
      ltth_TH : begin
                   cMSG_SEARCH_RECORD := 'Record Search';
                end;
      lthi_IN : begin
                   cMSG_SEARCH_RECORD := 'Record Search';
                end;
      ltar_SA : begin
                cMSG_SEARCH_RECORD := 'سجل البحث';
                end;
  end;
  //[PT] nomenclatura padrao para capturar os dados necessários para otimizar a pesquisa lookup.
  //      Todo lookUp precisa ter um KEYFIELD( padrao CODIGO ) e LISTFIELD( padrao DESCRICAO ) uma QUERY e um DATASOURCE pra vincular a PESQUISA
  //[PT] standard nomenclature to capture the data necessary to optimize the lookup search.
  //      Every lookUp must have a KEYFIELD (CODE pattern) and LISTFIELD (DESCRIPTION pattern) a QUERY and a DATASOURCE to link to SEARCH
  sTemp  := Copy( pLkpbtnLkp, 7 , 50 );

  //[PT] checa se a nomenclatura do botão está no PADRÃO
  //[EN] checks if the button naming is in the STANDARD
  if TUniSpeedButton( TComponent( pFrame ).FindComponent( 'btnLkp' + sTemp ) ) = nil then
     rc_ShowError( format( '<h2> Search LookUp Button Failed! </h2> <br>' +
                           '<strong> MESSAGE </strong> <br> <hr>' + '<strong> btnLkp: </strong>' + '%s' + 'not declared!' + '<br> <br>' +
                           '<strong> TIP </strong> <br> <hr> Button with non-standard nomenclature.' + '<br> <br>' +
                           mm.MSG_CONTACT_SUPPORT, [ sTemp , '( ' + pLkpbtnLkp + ' ).' ] ) );

  LkpQuery  := TFDQuery( TComponent( pFrame ).FindComponent( sTemp ) );
  //[PT] foi criada dinamicamente ?  ( prefixo "LKP_" )
  //[EN] was it created dynamically? (prefix "LKP_")
  if LkpQuery = nil then
     LkpQuery  := TFDQuery( TComponent( pFrame ).FindComponent( 'LKP_' + uppercase(sTemp) ) );

  if LkpQuery = nil then
     rc_ShowError( format( '<h2>LookUps Preparation failed!</h2><br>' +
                           '<strong>MESSAGE</strong><br><hr>' + '<strong>LkpQuery: </strong>' + '%s ' + 'not declared!' + '<br><br>' +
                           '<strong>TIP</strong><br><hr>Query with non-standard nomenclature %s' + '<br><br>' +
                           mm.MSG_CONTACT_SUPPORT, [ sTemp , '( ' + pLkpbtnLkp + ' ).' ] ) );

  //[PT] separar o nome da tabela de um possivel COMPLEMENTO[ separado por '_' ]
  //      ( mesma tabela sendo acessada por mais de 1 query - ex: plano de contas( desp e receitas )
  //[EN] separate the table name from a possible COMPLEMENT [separated by '_' ]
  //      (same table being accessed by more than 1 query - e.g.: chart of accounts (expense and revenue)
  if Pos( '__' , LkpQuery.Name ) > 0 then
     LkpTable := Copy( LkpQuery.Name, 1, Pos( '__' , LkpQuery.Name ) -1 )
  else
     LkpTable := LkpQuery.Name;

  if Pos( 'LKP_' , LkpTable ) > 0 then
     LkpTable := Copy( LkpTable , 5, 100 );

  // DESCRICAO(carros|codicarro)__CODIVEICULO!#PLACA
  LkpDBCod  := TUniDBEdit( TComponent( pFrame ).FindComponent( 'edLkp' + sTemp + '_CodID' ) );
  LkpDBEdit := TUniDBEdit( TComponent( pFrame ).FindComponent( 'edLkp' + sTemp ) );
  // 6.0.0.0
  // Have a Join ?
  LkpJoinTable := '';
  // 6.0.0.0
  cTemp := rc_GetHintAttr( 'lkp:' , LkpDBEdit.Hint ) ;
  cLkpAttr := cTemp;

  iPos := Pos( '(' , cLkpAttr );
  if iPos > 0 then
  begin
      LkpJoinTable := Copy( cLkpAttr, iPos, Pos( ')' , cLkpAttr ) );
      LkpJoinTable := Copy( LkpJoinTable, 1, Pos( ')' , LkpJoinTable ) );
      LkpJoinField := Copy( LkpJoinTable, Pos( '/' , LkpJoinTable ) + 1 , Pos( ')' , LkpJoinTable ) );
      LkpJoinField := Copy( LkpJoinField, 1 , Pos( ')' , LkpJoinField ) - 1 );
      LkpJoinTable := Copy( LkpJoinTable, 2, Pos( '/' , LkpJoinTable ) - 2 );
  end;
  pDM := nil;
  pDSDetail  := nil;
  pSQLDetail := nil;
  // 6.0.0.0
  if Pos( ' ds:', cLkpAttr ) > 0 then
  begin
     // 6.0.0.0
     cTemp := rc_GetHintAttr( 'ds:', cLkpAttr, true, false, true );

     If Pos( '.', cTemp ) > 0 then
     begin
         pDM := nil;
         pDM := rc_FindDataModule( Copy( cTemp, 1, pos( '.', cTemp ) - 1 ) );
         cTemp := Copy( cTemp, pos( '.', cTemp ) + 1 );
     end;
     if pDM <> nil then
        pDSDetail  := TDataSource( pDM.FindComponent( cTemp ) )
     else
        pDSDetail  := TDataSource( TComponent(pFrame).FindComponent( cTemp ) );

     if pDSDetail <> nil then
     begin
        if pDM <> nil then
           pSQLDetail  := TFDQuery( pDM.FindComponent( pDSDetail.DataSet.Name ) )  //TDataSource( pDM.FindComponent( cTemp ) )
        else
           pSQLDetail  := TFDQuery( TComponent(pFrame).FindComponent( pDSDetail.DataSet.Name ) );
     end;
  end
  else
     pSQLMaster := TFDQuery( TComponent( pFrame ).FindComponent( 'sqlMaster' ) );

  //[PT] tem campo de Retorno ? pesquisa extra vinculado ao lookup padrão
  //[EN] does it have a Return field? extra search linked to the standard lookup
  sExtraReturnField := '';
  //[PT] se nao informou nada pra pesquisar no LOOKUP_PESQEXTRA e teclou ENTER,
  //      REMOVE o WHERE pra não ter problemas com a pesquisa, ou seja, é como
  //      se tivesse teclado no Button PESQUISA mesmo
  //[EN] if you didn't enter anything to search in LOOKUP_PESQEXTRA and press ENTER,
  //      REMOVE WHERE to avoid problems with the search, that is, it's like
  //      if there was a keyboard on the SEARCH Button
  LkpDBPesqExtra := TUniDBEdit( TComponent( pFrame ).FindComponent( 'edLkp' + sTemp + '_PesqExtra' ) );

  if ( LkpDBPesqExtra <> nil ) then
  begin
     sExtraSearchField := lowercasE( LkpDBPesqExtra.DataField );
     sExtraReturnField := sExtraSearchField;
     // 6.0.0.0
     If Pos( ' #', cLkpAttr ) > 0 then
     begin
        sExtraReturnField := Copy( cLkpAttr, Pos( ' #', cLkpAttr ) + 2 ) + '| ';
        sExtraReturnField := StringReplace( sExtraReturnField, ']]', '', [rfReplaceAll] );
        sExtraReturnField := Copy( sExtraReturnField, 1, Pos( '|', sExtraReturnField ) -1 );
        // another attribute after "#".."="
        if Pos( ' ', sExtraReturnField ) > 0 then
           sExtraReturnField := Copy( sExtraReturnField, 1, Pos( ' ', sExtraReturnField ) - 1 ) + '| ';
        mm.varC_Temp1 := sExtraReturnField; // remove..is test
        If Pos( '=', sExtraReturnField ) > 0 then
        begin
           sExtraReturnField := Copy( sExtraReturnField, Pos( '=', sExtraReturnField ) + 1 )+ '|';
           mm.varC_Temp1 := sExtraReturnField; // remove..is test
           sExtraReturnField := Copy( sExtraReturnField, 1, Pos( '|', sExtraReturnField ) - 1 );
        end
        else
            sExtraReturnField := sExtraSearchField;
     end;
     mm.varC_Temp1 := sExtraReturnField; // remove..is test

     if pSQLDetail = nil then
     begin
         if ( pSQLMaster.FieldByName( sExtraSearchField ).AsString = '' ) then //or
         begin
           if Pos( '[[pk]]' , mm.varC_WhereExtra ) = 0 then
           begin
               mm.varC_WhereExtra := '';
               pSQLMaster.FieldByName( lkpDBCod.DataField ).AsInteger      := 0;
           end;
           rc_LookUpUpdateData( pFrame , LkpDBEdit );
           Result := False;
         end;
     end
     else
     begin
         if ( pSQLDetail.FieldByName( sExtraSearchField ).AsString = '' ) then
         begin
           if Pos( '[[pk]]' , mm.varC_WhereExtra ) = 0 then
           begin
              mm.varC_WhereExtra := '';
              pSQLDetail.FieldByName( lkpDBCod.DataField ).AsInteger      := 0;
           end;
           rc_LookUpUpdateData( pFrame , LkpDBEdit );
           Result := False;
         end;
     end;
  end
  else
  begin
     sExtraSearchField := '';
     sExtraReturnField := '';
  end;
  //8.4.0.1 lookup
  // campo PK PADRÃO de PESQUISA | SEARCH DEFAULT PK field
  cGetThisPK          := '';
  if Pos ( ' getpk:' , cLkpAttr ) > 0 then
     //cGetThisPK     := rc_GetHintAttr( 'getpk:', cLkpAttr, true )
     cGetThisPK     := rc_GetHintAttr( 'getpk:', cLkpAttr, true, false, true ) //8.4.0.1 lookup
  else
     cGetThisPK     := rc_GetPrimaryKey( lowercase( lkpTable ) ); //7.5.0.3 lowercase
  mm.varC_Field_PK := cGetThisPK;

  mm.Active_Component := LkpDBEdit;
  if mm.varC_Search_Fields <> '' then
  begin
     sSearchFields := 'tab.' + Copy( mm.varC_Search_Fields, 1, Length( mm.varC_Search_Fields ) - 1 );
     sSearchFields := StringReplace( sSearchFields , ';' , ', tab.' , [rfReplaceAll] )  ;
     sSearchFields := sSearchFields + varIIF( sExtraReturnField <> '', ', tab.' + sExtraReturnField , '' );
     sSearchFields := StringReplace( sSearchFields, ',,', ',', [rfReplaceAll] );
  end
  else
     sSearchFields := varIIF( sExtraReturnField <> '', 'tab.' + sExtraReturnField, '' );
  // só adiciona se nao houver JOIN | only adds if there is no JOIN
  if LkpJoinTable = '' then
     if Pos( 'tab.' + lowercase( LkpDBEdit.DataField ), sSearchFields ) = 0 then
        sSearchFields := 'tab.' + lowercase( LkpDBEdit.DataField ) + varIIF( sSearchFields <> '', ', ' , '' ) + sSearchFields;
  //7.2.0.0
  if Pos( 'tab.' + mm.varC_Field_PK + ' ', sSearchFields ) = 0 then
     sSearchFields := sSearchFields + varIIF( sSearchFields <> '', ', ' , '' ) + 'tab.' + mm.varC_Field_PK + ' '
  else
  if Pos( 'tab.' + mm.varC_Field_PK + ' as ', sSearchFields ) > 0 then
     sSearchFields := sSearchFields + varIIF( sSearchFields <> '', ', ' , '' ) + 'tab.' + mm.varC_Field_PK + ' ';

  if Pos( 'FIREBIRD' , mm.CONFIG_DATABASE ) = 0 then
     lkpTable := lowercase( lkpTable );

  mm.varC_SQL_Default_LookUps := ' SELECT ' + sSearchFields + ' FROM  ' + dm_rc.rc_DBSchema + lkpTable + ' tab'; //6.1.0.0

  if LkpJoinTable <> '' then
  begin
       mm.varC_SQL_Default_LookUps := ' Select ' +

                                      sSearchFields + ', ' +

                                      ' tbJoin.' + lowercase( LkpDBEdit.DataField ) +

                                      ' from ' + dm_rc.rc_DBSchema + LkpTable + ' tab ' + //6.1.0.0

                                      ' left join ' + LkpJoinTable + ' tbJoin ' +
                                      ' on tbJoin.' + rc_GetPrimaryKey( lowercase( LkpJoinTable ) ) + ' = tab.' + LkpJoinField ; //7.5.0.3 lowercase
  end;

  //[PT] remove a vírgula( deixei apenas pra montar o select ACIMA )
  //[EN] remove the comma (I left it just to assemble the select ABOVE)
  sExtraReturnField := trim( StringReplace( sExtraReturnField , ',', '', [rfReplaceAll] ) );
  //[PT] o ORDER BY pode ser definido na chamada da função, se nao, assume um padrão
  //[EN] ORDER BY can be defined when calling the function, if not, it assumes a default
  if mm.varC_Order = '' then
     mm.varC_Order := ' Order by ' + varIIF( LkpJoinTable <> '' , 'tbJoin.' , 'tab.' ) + lowercase( LkpDBEdit.DataField )
  else
     mm.varC_Order := ' ' + Trim( mm.varC_Order );

  //[PT] pode adicionar vários campos antes da 'PK' que serão usados para pesquisa no form de lookup padrao.
  //      campos PADRÃO de PESQUISA e RETORNO( ult. campo sempre é a 'PK' )
  //[PT] can add several fields before 'PK' that will be used for searching in the standard lookup form.
  // PATTERN SEARCH and RETURN fields (last field is always 'PK')
  if Pos( lowercase( LkpDBEdit.DataField ) + ';' + mm.varC_Field_PK + ' ', mm.varC_Search_Fields ) = 0 then
     mm.varC_Search_Fields := ' ' + mm.varC_Search_Fields + lowercase( LkpDBEdit.DataField ) + ';' + mm.varC_Field_PK + ' ';

  //[PT] Essa variavel é preenchida no OnExit do campo EXTRA que se deseja pesquisar
  //[EN] This variable is filled in the OnExit of the EXTRA field you want to search
  if Trim( Copy( mm.varC_WhereExtra , Pos( '=' , mm.varC_WhereExtra ) + 1 , 100 ) )  = '' then
     mm.varC_WhereExtra := '';
  //[PT] para tratar RETORNO automatico de pesquisa direta
  //[EN] to handle automatic RETURN from direct search
  mm.varI_FrmLookUpTag := TUniSpeedButton( TComponent( pFrame ).FindComponent( 'btnLkp' + sTemp ) ).Tag;

  //[PT] pra saber se veio do ONEXIT do _CodID ou do CLICK do BtnLkp
  //[EN] to find out if it came from CovID's ONEXIT or BtnLkp's CLICK
  iTag := TUniSpeedButton( TComponent( pFrame ).FindComponent( 'btnLkp' + sTemp ) ).Tag;
  TUniSpeedButton( TComponent( pFrame ).FindComponent( 'btnLkp' + sTemp ) ).Tag := 0;

  if mm.varC_WhereExtra <> '' then
  begin
     if Pos( '[[pk]]' , mm.varC_WhereExtra ) > 0 then
        mm.varC_WhereExtra := StringReplace( mm.varC_WhereExtra , '[[pk]]', + varIIF( LkpJoinTable <> '' , 'tbJoin.' , 'tab.' ) + mm.varC_Field_PK, [rfReplaceAll] );

     if mm.varC_Where <> '' then
        mm.varC_Where := mm.varC_Where + ' AND ' + mm.varC_WhereExtra
     else
        mm.varC_Where := ' WHERE ' + mm.varC_WhereExtra;

     dm_rc.sqlLookUpSearch.close;
     dm_rc.sqlLookUpSearch.sql.Text := mm.varC_SQL_Default_LookUps + mm.varC_Where + mm.varC_Order;

     mm.varC_Lookup_Code := '';

     if rc_OpenQuery( dm_rc.sqlLookUpSearch ) then
     begin
        //[PT] se teclou ESC no LOOKUP, nao atualiza os dados
        //[EN] if you press ESC in LOOKUP, the data does not update
        if mm.varC_Lookup_Code <> '_ESC_' then
        begin
             mm.varC_Lookup_Code := dm_rc.sqlLookUpSearch.FieldByName( mm.varC_Field_PK ).AsString;
        end;
     end;
  end
  else
  begin
       if ( ( LkpDBCod.Text <> '' ) and ( iTag = 1 ) ) or ( iTag = 0 ) then
       begin
           frmLookUp.Caption := cMSG_SEARCH_RECORD;// + lkpTable;
           //[PT] coluna com a PK deve ficar invisivel por padrão
           //[EN] column with PK must be invisible by default
           frmLookUp.dbgSearchCRUDLookUp.Tag := 1;

           if pLookUpGridAttr = '' then
              pLookUpGridAttr := '[[fieldmasks:grid-resize|grid-paginator:center(' + LkpDBEdit.Width.ToString + ')|]]'
           else
           if Pos( 'grid-paginator' , pLookUpGridAttr ) = 0 then
              pLookUpGridAttr := StringReplace( pLookUpGridAttr, 'fieldmasks:','fieldmasks:grid-paginator:center(' + LkpDBEdit.Width.ToString + ')|', [rfReplaceAll] );

           frmLookUp.dbgSearchCRUDLookUp.Hint := pLookUpGridAttr;
           frmLookUp.ShowModal;
       end;
  end;
  if pSQLDetail = nil then
     rc_UpdateLookUpCalled( pFrame , sTemp , sExtraReturnField , sExtraSearchField , bIsExtraSearch , LkpDBPesqExtra, LkpDBCod, LkpDBEdit , lkpQuery, pSQLMaster , iTag  )
  else
     rc_UpdateLookUpCalled( pFrame , sTemp , sExtraReturnField , sExtraSearchField , bIsExtraSearch , LkpDBPesqExtra, LkpDBCod, LkpDBEdit , lkpQuery, pSQLDetail , iTag  );
  // 6.0.0.0
  //[PT] caso tenha vindo de um edLKP____PesqExtra
  //[EN] if it came from an edLKP____PesqExtra
  mm.varC_WhereExtra := '';
  //[PT] limpar globais para evitar conflito em outra pesq. lookup
  //[EN] clear globals to avoid conflict in another search. lookup
  mm.varC_Where := '';
  mm.varC_Order := '';
  mm.varC_Search_Fields := '';
end;
// 6.0.0.0
function tdm_rc.rc_LookUpSearchLite( pFrame: TObject; pLkpbtnLkp: String ; pSender : TObject; pLookUpGridAttr : string ): Boolean;
var
   LkpDBCod,
   LkpDBPesqExtra,
   LkpDBEdit : TUniDBEdit;

   pDsDetail : TDataSource;

   pDM : TDataModule;

   pSQLDetail,
   pSQLMaster,
   LkpQuery : TFDQuery;

   oFrmLookUp : TUniForm; // 6.0.0.0 blite2
   cGetThisPK, cLkp_Hint, // 6.0.0.0
   sExtraSearchField,
   sExtraReturnField,
   cLkpAttr, // 6.0.0.0
   cTemp,
   sTemp,
   cTmp,
   sSearchFields,
   LkpJoinTable,
   LkpJoinField,
   LkpTable : string;

   bIsExtraSearch : boolean;

   iPos,
   iTag : integer;
begin
  inherited;

  Result := True;
  //[PT] nomenclatura padrao para capturar os dados necessários para otimizar a pesquisa lookup.
  //      Todo lookUp precisa ter um KEYFIELD( padrao CODIGO ) e LISTFIELD( padrao DESCRICAO ) uma QUERY e um DATASOURCE pra vincular a PESQUISA
  //[PT] standard nomenclature to capture the data necessary to optimize the lookup search.
  //      Every lookUp must have a KEYFIELD (CODE pattern) and LISTFIELD (DESCRIPTION pattern) a QUERY and a DATASOURCE to link to SEARCH
  sTemp := Copy( pLkpbtnLkp, 7 , 50 );

  mm.varC_Temp1 := Copy( pLkpbtnLkp, 7 , 50 );
  mm.varC_Temp1 := sTemp;
  //[PT] checa se a nomenclatura do botão está no PADRÃO
  //[EN] checks if the button naming is in the STANDARD
  if TUniSpeedButton( TComponent( pFrame ).FindComponent( 'btnLkp' + sTemp ) ) = nil then
     rc_ShowError( format( '<h2> Search LookUp Button Failed! </h2> <br>' +
                           '<strong> MESSAGE </strong> <br> <hr>' + '<strong> btnLkp: </strong>' + '%s' + 'not declared!' + '<br> <br>' +
                           '<strong> TIP </strong> <br> <hr> Button with non-standard nomenclature.' + '<br> <br>' +
                           mm.MSG_CONTACT_SUPPORT, [ sTemp , '( ' + pLkpbtnLkp + ' ).' ] ) );

  LkpQuery  := TFDQuery( TComponent( pFrame ).FindComponent( sTemp ) );
  //[PT] foi criada dinamicamente ?  ( prefixo "LKP_" )
  //[EN] was it created dynamically? (prefix "LKP_")
  if LkpQuery = nil then
     LkpQuery  := TFDQuery( TComponent( pFrame ).FindComponent( 'LKP_' + sTemp ) );

  if LkpQuery = nil then
     rc_ShowError( format( '<h2>LookUps Preparation failed!</h2><br>' +
                           '<strong>MESSAGE</strong><br><hr>' + '<strong>LkpQuery: </strong>' + '%s ' + 'not declared!' + '<br><br>' +
                           '<strong>TIP</strong><br><hr>Query with non-standard nomenclature %s' + '<br><br>' +
                           mm.MSG_CONTACT_SUPPORT, [ sTemp , '( ' + pLkpbtnLkp + ' ).' ] ) );

  //[PT] separar o nome da tabela de um possivel COMPLEMENTO[ separado por '_' ]
  //      ( mesma tabela sendo acessada por mais de 1 query - ex: plano de contas( desp e receitas )
  //[EN] separate the table name from a possible COMPLEMENT [separated by '_' ]
  //      (same table being accessed by more than 1 query - e.g.: chart of accounts (expense and revenue)
  if Pos( '__' , LkpQuery.Name ) > 0 then
     LkpTable := Copy( LkpQuery.Name, 1, Pos( '__' , LkpQuery.Name ) -1 )
  else
     LkpTable := LkpQuery.Name;

  if Pos( 'LKP_' , LkpTable ) > 0 then
     LkpTable := Copy( LkpTable , 5, 100 );

  LkpDBCod  := TUniDBEdit( TComponent( pFrame ).FindComponent( 'edLkp' + sTemp + '_CodID' ) );
  LkpDBEdit := TUniDBEdit( TComponent( pFrame ).FindComponent( 'edLkp' + sTemp ) );
  // 6.0.0.0
  cLkp_Hint := rc_GetHintAttr( 'lkp:' , LkpDBEdit.Hint ) ;
  cLkpAttr  := cLkp_Hint;
  cTemp     := cLkpAttr;
  if Pos ( ' !!', cLkpAttr ) = 0 then
     oFrmLookUp := frmLookUp_Lite
  else
     oFrmLookUp := frmLookUp_Lite_Model_2;
  // 6.0.0.0
  // Have a Join ?
  LkpJoinTable := '';
  iPos := Pos( '(' , cLkpAttr );
  if iPos > 0 then
  begin
      LkpJoinTable := Copy( cLkpAttr, iPos, Pos( ')' , cLkpAttr ) );
      LkpJoinTable := Copy( LkpJoinTable, 1, Pos( ')' , LkpJoinTable ) );
      LkpJoinField := Copy( LkpJoinTable, Pos( '/' , LkpJoinTable ) + 1 , Pos( ')' , LkpJoinTable ) );
      LkpJoinField := Copy( LkpJoinField, 1 , Pos( ')' , LkpJoinField ) - 1 );
      LkpJoinTable := Copy( LkpJoinTable, 2, Pos( '/' , LkpJoinTable ) - 2 );
  end;
  pDM := nil;
  pDSDetail  := nil;
  pSQLDetail := nil;
  if Pos( ' ds:', cLkpAttr ) > 0 then
  begin
     // 6.0.0.0
     cTemp := rc_GetHintAttr( 'ds:', cLkpAttr, true, false, true );
     If Pos( '.', cTemp ) > 0 then
     begin
         pDM := nil;
         pDM := rc_FindDataModule( Copy( cTemp, 1, pos( '.', cTemp ) - 1 ) );
         cTemp := Copy( cTemp, pos( '.', cTemp ) + 1 );
     end;
     if pDM <> nil then
        pDSDetail  := TDataSource( pDM.FindComponent( cTemp ) )
     else
        pDSDetail  := TDataSource( TComponent(pFrame).FindComponent( cTemp ) );

     if pDSDetail <> nil then
     begin
        if pDM <> nil then
           pSQLDetail  := TFDQuery( pDM.FindComponent( pDSDetail.DataSet.Name ) )
        else
           pSQLDetail  := TFDQuery( TComponent(pFrame).FindComponent( pDSDetail.DataSet.Name ) );
     end;
  end
  else
     pSQLMaster := TFDQuery( TComponent( pFrame ).FindComponent( 'sqlMaster' ) );

  //[PT] tem campo de Retorno ? pesquisa extra vinculado ao lookup padrão
  //[EN] does it have a Return field? extra search linked to the standard lookup
  sExtraReturnField := '';
  //[PT] se nao informou nada pra pesquisar no LOOKUP_PESQEXTRA e teclou ENTER,
  //      REMOVE o WHERE pra não ter problemas com a pesquisa, ou seja, é como
  //      se tivesse teclado no Button PESQUISA mesmo
  //[EN] if you didn't enter anything to search in LOOKUP_PESQEXTRA and press ENTER,
  //      REMOVE WHERE to avoid problems with the search, that is, it's like
  //      if there was a keyboard on the SEARCH Button
  LkpDBPesqExtra := TUniDBEdit( TComponent( pFrame ).FindComponent( 'edLkp' + sTemp + '_PesqExtra' ) );

  if ( LkpDBPesqExtra <> nil ) then
  begin
     sExtraSearchField := lowercasE( LkpDBPesqExtra.DataField );
     sExtraReturnField := sExtraSearchField;
     // 6.0.0.0
     If Pos( ' #', cLkpAttr ) > 0 then
     begin
        sExtraReturnField := Copy( cLkpAttr, Pos( ' #', cLkpAttr ) + 2 ) + '| ';
        sExtraReturnField := StringReplace( sExtraReturnField, ']]', '', [rfReplaceAll] );
        sExtraReturnField := Copy( sExtraReturnField, 1, Pos( '|', sExtraReturnField ) -1 );
        // another attribute after "#".."="
        if Pos( ' ', sExtraReturnField ) > 0 then
           sExtraReturnField := Copy( sExtraReturnField, 1, Pos( ' ', sExtraReturnField ) - 1 ) + '| ';
        mm.varC_Temp1 := sExtraReturnField; // remove..is test
        If Pos( '=', sExtraReturnField ) > 0 then
        begin
           sExtraReturnField := Copy( sExtraReturnField, Pos( '=', sExtraReturnField ) + 1 )+ '|';
           mm.varC_Temp1 := sExtraReturnField; // remove..is test
           sExtraReturnField := Copy( sExtraReturnField, 1, Pos( '|', sExtraReturnField ) - 1 );
        end
        else
            sExtraReturnField := sExtraSearchField;
     end;
     mm.varC_Temp1 := sExtraReturnField; // remove..is test

     if pSQLDetail = nil then
     begin
         if ( pSQLMaster.FieldByName( sExtraSearchField ).AsString = '' ) then
         begin
           if Pos( '[[pk]]' , mm.varC_WhereExtra ) = 0 then
           begin
               mm.varC_WhereExtra := '';
               pSQLMaster.FieldByName( lkpDBCod.DataField ).AsInteger      := 0;
           end;
           rc_LookUpUpdateData( pFrame , LkpDBEdit );
           Result := False;
         end;
     end
     else
     begin
         if ( pSQLDetail.FieldByName( sExtraSearchField ).AsString = '' ) then
         begin
           if Pos( '[[pk]]' , mm.varC_WhereExtra ) = 0 then
           begin
               mm.varC_WhereExtra := '';
               pSQLDetail.FieldByName( lkpDBCod.DataField ).AsInteger      := 0;
           end;
           rc_LookUpUpdateData( pFrame , LkpDBEdit );
           Result := False;
         end;
     end;
  end
  else
  begin
     sExtraSearchField := '';
     sExtraReturnField := '';
     //8.5.0.0 Thanks Mr Josauro
     //[PT] caso tenha vindo de um edLKP____PesqExtra
     //[EN] if it came from an edLKP____PesqExtra
    if Pos( '[[pk]]' , mm.varC_WhereExtra ) = 0 then
     mm.varC_WhereExtra := '';
  end;
  //8.4.0.1 lookup
  // campo PK PADRÃO de PESQUISA | SEARCH DEFAULT PK field
  cGetThisPK          := '';
  if Pos ( ' getpk:' , cLkpAttr ) > 0 then
     cGetThisPK     := rc_GetHintAttr( 'getpk:', cLkpAttr, true, false, true ) //8.4.0.1 lookup
  else
     cGetThisPK     := rc_GetPrimaryKey( lowercase( lkpTable ) ); //7.5.0.3 lowercase
  mm.varC_Field_PK := cGetThisPK;

  mm.Active_Component := LkpDBEdit;

  if pLookUpGridAttr = '' then
     pLookUpGridAttr := '[[fieldmasks:grid-resize|grid-paginator:center(' + LkpDBEdit.Width.ToString + ')|]]'
  else
  if Pos( 'grid-paginator' , pLookUpGridAttr ) = 0 then
     pLookUpGridAttr := StringReplace( pLookUpGridAttr, 'fieldmasks:','fieldmasks:grid-paginator:center(' + LkpDBEdit.Width.ToString + ')|', [rfReplaceAll] );
  // 6.0.0.0 blite 2
  TUniDBGrid( oFrmLookUp.FindComponent( 'dbgSearchCRUDLookUpLite' ) ).Hint := pLookUpGridAttr;
  //identificar controle que chamou
  // 6.0.0.0 blite 2
  TUniEdit( oFrmLookUp.FindComponent( 'ed_PK' ) ).Text := mm.varC_Field_PK;
  if mm.varC_Search_Fields <> '' then
  begin
     sSearchFields := 'tab.' + Copy( mm.varC_Search_Fields, 1, Length( mm.varC_Search_Fields ) - 1 );
     sSearchFields := StringReplace( sSearchFields , ';' , ', tab.' , [rfReplaceAll] )  ;

     sSearchFields := sSearchFields + varIIF( sExtraReturnField <> '', ', tab.' + sExtraReturnField , '' );
     sSearchFields := StringReplace( sSearchFields, ',,', ',', [rfReplaceAll] );
  end
  else
     sSearchFields := varIIF( sExtraReturnField <> '', 'tab.' + sExtraReturnField, '' );

  // só adiciona se nao houver JOIN | only adds if there is no JOIN
  if LkpJoinTable = '' then
  begin
     if Pos( 'tab.' + lowercase( LkpDBEdit.DataField ), sSearchFields ) = 0 then
        sSearchFields := 'tab.' + lowercase( LkpDBEdit.DataField ) + varIIF( sSearchFields <> '', ', ' , '' ) + sSearchFields;
  end;
  //7.2.0.0
  if Pos( 'tab.' + mm.varC_Field_PK + ' ', sSearchFields ) = 0 then
     sSearchFields := sSearchFields + varIIF( sSearchFields <> '', ', ' , '' ) + 'tab.' + mm.varC_Field_PK + ' '
  else
  if Pos( 'tab.' + mm.varC_Field_PK + ' as ', sSearchFields ) > 0 then
     sSearchFields := sSearchFields + varIIF( sSearchFields <> '', ', ' , '' ) + 'tab.' + mm.varC_Field_PK + ' ';

  if Pos( 'FIREBIRD' , mm.CONFIG_DATABASE ) = 0 then
     lkpTable := lowercase( lkpTable );

  mm.varC_SQL_Default_LookUps := ' SELECT ' + sSearchFields + ' FROM ' + dm_rc.rc_DBSchema + lkpTable + ' tab'; //6.1.0.0

  if LkpJoinTable <> '' then
  begin
       mm.varC_SQL_Default_LookUps := ' Select ' +

                                      sSearchFields + ', ' +

                                      ' tbJoin.' + lowercase( LkpDBEdit.DataField ) +

                                      ' from ' + dm_rc.rc_DBSchema + LkpTable + ' tab ' + //6.1.0.0

                                      ' left join ' + dm_rc.rc_DBSchema + LkpJoinTable + ' tbJoin ' + //6.1.0.0
                                      ' on tbJoin.' + rc_GetPrimaryKey( lowercase( LkpJoinTable ) ) + ' = tab.' + LkpJoinField ; //7.5.0.3 lowercase
  end;

  //[PT] remove a vírgula( deixei apenas pra montar o select ACIMA )
  //[EN] remove the comma (I left it just to assemble the select ABOVE)
  sExtraReturnField := trim( StringReplace( sExtraReturnField , ',', '', [rfReplaceAll] ) );
  mm.varC_Temp1 := sExtraReturnField; // remove..is test
  //[PT] o ORDER BY pode ser definido na chamada da função, se nao, assume um padrão
  //[EN] ORDER BY can be defined when calling the function, if not, it assumes a default
  if mm.varC_Order = '' then
     mm.varC_Order := ' Order by ' + varIIF( LkpJoinTable <> '' , 'tbJoin.' , 'tab.' ) + lowercase( LkpDBEdit.DataField )
  else
     mm.varC_Order := ' ' + Trim( mm.varC_Order );

  //[PT] pode adicionar vários campos antes da 'PK' que serão usados para pesquisa no form de lookup padrao.
  //      campos PADRÃO de PESQUISA e RETORNO( ult. campo sempre é a 'PK' )
  //[PT] can add several fields before 'PK' that will be used for searching in the standard lookup form.
  // PATTERN SEARCH and RETURN fields (last field is always 'PK')
  if Pos( lowercase( LkpDBEdit.DataField ) + ';' + mm.varC_Field_PK + ' ', mm.varC_Search_Fields ) = 0 then
     mm.varC_Search_Fields := ' ' + mm.varC_Search_Fields + lowercase( LkpDBEdit.DataField ) + ';' + mm.varC_Field_PK + ' ';
  //[PT] Essa variavel é preenchida no OnExit do campo EXTRA que se deseja pesquisar
  //[EN] This variable is filled in the OnExit of the EXTRA field you want to search
  if Trim( Copy( mm.varC_WhereExtra , Pos( '=' , mm.varC_WhereExtra ) + 1 , 100 ) )  = '' then
     mm.varC_WhereExtra := '';
  // onlysearch
  // 6.0.0.0 blite2
  oFrmLookUp.tag   := TUniSpeedButton( TComponent( pFrame ).FindComponent( 'btnLkp' + sTemp ) ).Tag;
  if mm.varC_WhereExtra <> '' then
  begin
     // 6.0.0.0 blite2
     oFrmLookUp.tag := 1;
     // 6.0.0.0 blite2
     if Pos( '[[pk]]' , mm.varC_WhereExtra ) > 0 then
        mm.varC_WhereExtra := StringReplace( mm.varC_WhereExtra , '[[pk]]', + varIIF( LkpJoinTable <> '' , 'tbJoin.' , 'tab.' ) + TUniEdit( oFrmLookUp.FindComponent( 'ed_PK' ) ).Text, [rfReplaceAll] );

     if mm.varC_Where <> '' then
        mm.varC_Where := mm.varC_Where + ' AND ' + mm.varC_WhereExtra
     else
        mm.varC_Where := ' WHERE ' + mm.varC_WhereExtra;

     dm_rc.sqlLookUpSearch.close;
     dm_rc.sqlLookUpSearch.sql.Text := mm.varC_SQL_Default_LookUps + mm.varC_Where + mm.varC_Order;

     mm.varC_Lookup_Code := '';

     if rc_OpenQuery( dm_rc.sqlLookUpSearch ) then
     begin
        //[PT] se teclou ESC no LOOKUP, nao atualiza os dados
        //[EN] if you press ESC in LOOKUP, the data does not update
        if mm.varC_Lookup_Code <> '_ESC_' then
        begin
             mm.varC_Lookup_Code := dm_rc.sqlLookUpSearch.FieldByName( mm.varC_Field_PK ).AsString;
             mm.varC_Temp1 := sExtraReturnField; // remove..is test
             if pSQLDetail = nil then
                rc_UpdateLookUpCalled( pFrame , sTemp , sExtraReturnField , sExtraSearchField , bIsExtraSearch , LkpDBPesqExtra, LkpDBCod, LkpDBEdit , lkpQuery, pSQLMaster , iTag  )
             else
                rc_UpdateLookUpCalled( pFrame , sTemp , sExtraReturnField , sExtraSearchField , bIsExtraSearch , LkpDBPesqExtra, LkpDBCod, LkpDBEdit , lkpQuery, pSQLDetail , iTag  );
             // 6.0.0.0
             //[PT] caso tenha vindo de um edLKP____PesqExtra
             //[EN] if it came from an edLKP____PesqExtra
             mm.varC_WhereExtra := '';
             //[PT] limpar globais para evitar conflito em outra pesq. lookup
             //[EN] clear globals to avoid conflict in another search. lookup
             mm.varC_Where := '';
             mm.varC_Order := '';
             mm.varC_Search_Fields := '';
        end;
     end;
  end
  else
  begin
     //[PT] coluna com a PK deve ficar invisivel por padrão
     //[EN] column with PK must be invisible by default
     // 6.0.0.0 blite2
     TUniDBGrid( oFrmLookUp.FindComponent( 'dbgSearchCRUDLookUpLite' ) ).Tag := 1;
     TUniDBGrid( oFrmLookUp.FindComponent( 'dbgSearchCRUDLookUpLite' ) ).Hint := pLookUpGridAttr;
     // 6.0.0.0 blite2
     if ( oFrmLookUp.Name = 'frmLookUp_Lite_model_2' ) then
     begin
        if ( Pos ( ' !!', cLkp_Hint ) > 0 ) or ( Pos ( ' searchall', cLkp_Hint ) > 0 ) then
        begin
           frmLookUp_Lite_model_2.btnlkpaddnew.Hint := '[[cls:ButtonGreen |ico:fas-plus-circle|append|-rc-btn-lkp-2:' + LkpDBEdit.Name + ']]';
           frmLookUp_Lite_model_2.ed_Lkp.Hint       := cLkp_Hint;
        end
     end
     else
     if ( oFrmLookUp.Name = 'frmLookUp_Lite' ) or ( Pos ( ' searchall', cLkp_Hint ) > 0 ) then
     begin
        frmLookUp_Lite.ed_Lkp.Hint := cLkp_Hint;
     end;

     oFrmLookUp.Show( procedure(Sender: TComponent; Resrrult:Integer)
                      begin
                           if pSQLDetail = nil then
                              rc_UpdateLookUpCalled( pFrame , sTemp , sExtraReturnField , sExtraSearchField , bIsExtraSearch , LkpDBPesqExtra, LkpDBCod, LkpDBEdit , lkpQuery, pSQLMaster , iTag  )
                           else
                              rc_UpdateLookUpCalled( pFrame , sTemp , sExtraReturnField , sExtraSearchField , bIsExtraSearch , LkpDBPesqExtra, LkpDBCod, LkpDBEdit , lkpQuery, pSQLDetail , iTag  );
                           // 6.0.0.0
                           // caso tenha vindo de um edLKP____PesqExtra
                           mm.varC_WhereExtra := '';
                           // limpar globais para evitar conflito em outra pesq. lookup
                           mm.varC_Where := '';
                           mm.varC_Order := '';
                           mm.varC_Search_Fields := '';
                      end
                    );
     Result := True;
  end;
end;

procedure tdm_rc.rc_UpdateDetailField(pErrors : integer; pStatus : string; pQuery: TFDQuery; pField: string; pValue: integer);
begin
  // se ocorreu tudo bem, atualizar RESTRICOES
  //
  if pErrors = 0 then
  begin
     // ajustar o detail...
     if pStatus = 'I' then
     begin
          pQuery.First;
          while not pQuery.Eof do
          begin
               pQuery.Edit;
               pQuery.FieldByName( pField ).AsInteger := pValue;
               pQuery.Post;
               pQuery.next;
          end;
     end;

     mm.varI_ApplyUpdateErrors := pQuery.ApplyUpdates(-1);
     if mm.varI_ApplyUpdateErrors > 0 then
     begin
        dm_rc.rc_ApplyUpdatesError( pQuery, pErrors, mm.MSG_BUGERROR_POST );
        //mm.SQLConn.Rollback;
     end
     else
     begin
       pQuery.CommitUpdates;
       // mm.SQLConn.Commit;
     end;
  end;
end;
// 6.0.0.0 blite2
procedure tdm_rc.rc_UpdateLookupCalled( pFrame : TObject; pTemp , pExtraResponseField , pExtraSearchField : string; pIsExtraSearch : boolean; LkpDBPesqExtra, LkpDBCod, LkpDBEdit : TUniDBEdit; lkpQuery, pSQLMaster : TFDQuery; iTag : integer );
var
   bOnlySearch, bLite2 : boolean;
   cTemp,cPkType : string;
   LkpBtnClear : TUniLabel;
   LkpBtnClearCover : TUniContainerPanel;
begin
  bLite2      := Pos( '!!', LkpDBEdit.Hint ) > 0;
  bOnlySearch := Pos( 'searchonly', LkpDBEdit.Hint ) > 0;
  if ( bOnlySearch ) or ( pSQLMaster.State in [ dsEdit, dsInsert ] ) then
  begin
     try
        //[PT] se teclou ESC no LOOKUP, nao atualiza os dados
        //[EN] if you press ESC in LOOKUP, the data does not update
        if ( mm.varC_Lookup_Code <> '_ESC_' ) then
        begin
           pIsExtraSearch := false;
           if ( LkpDBPesqExtra <> nil ) then
              pIsExtraSearch := ( LkpDBPesqExtra.Text <> '' ) ;
           // 6.0.0.0
           cPkType := Copy( LkpDBEdit.Name , 6 ) + '__';
           cPkType := trim(lowercase( Copy( cPkType , 1, Pos( '__', cPkType ) - 1 ) ) );
           cPkType := rc_GetPrimaryKey( cPkType );
           cPkType := trim(lowercase( memPK.FieldByName( 'type' ).AsString ));
           if ( ( ( ( LkpDBCod.Text <> '' ) and ( LkpDBCod.Text <> '0' ) and ( iTag = 1 ) ) or ( iTag = 0 ) ) or
                ( ( ( pIsExtraSearch ) and ( iTag = 1 ) ) or ( iTag = 0 ) ) ) and ( mm.varC_Lookup_Code <> '' ) then
           begin
                // 6.0.0.0
                //[PT] parametro da query, nao é CAMPO é um PARAMETRO
                //[EN] query parameter, it is not a FIELD it is a PARAMETER
                if ( DataTypeStrIsString( cPkType ) ) then
                begin
                   lkpQuery.FormatOptions.StrsTrim2Len := true;
                   lkpQuery.ParamByName( 'table_pk' ).Value := mm.varC_Lookup_Code;
                end
                else
                if ( DataTypeStrIsDateTime( cPkType ) ) then
                begin
                   lkpQuery.ParamByName( 'table_pk' ).AsDateTime := StrToDateTimeDef( mm.varC_Lookup_Code, 0 );
                end
                else
                if DataTypeStrIsBigInt( cPkType ) then
                   lkpQuery.ParamByName( 'table_pk' ).AsLargeInt := StrToInt64Def( mm.varC_Lookup_Code , 0 )
                else
                   lkpQuery.ParamByName( 'table_pk' ).AsInteger := StrToIntDef( mm.varC_Lookup_Code , 0 );
                if rc_OpenQuery( lkpQuery ) then
                begin
                   //bigint 6.0.0.0
                   if not bOnlySearch then
                   begin
                      if ( DataTypeIsString( pSQLMaster.FieldByName( lkpDBCod.DataField ).DataType ) ) then
                      begin
                         pSQLMaster.FieldByName( lkpDBCod.DataField ).AsString := mm.varC_Lookup_Code;
                         if mm.varC_Lookup_Code = '' then
                            LkpDBEdit.Hint := rc_AddHintAttr( '|lkp-tag:' + '-1234567' , LkpDBEdit.Hint, True )
                         else
                            LkpDBEdit.Hint := rc_AddHintAttr( '|lkp-tag:' + mm.varC_Lookup_Code , LkpDBEdit.Hint, True );
                         LkpDBEdit.Tag  := 0;
                      end
                      else
                      if ( DataTypeIsDateTime( pSQLMaster.FieldByName( lkpDBCod.DataField ).DataType ) ) then
                      begin
                         If Pos( 'FIREBIRD' , mm.CONFIG_DATABASE ) > 0 then
                            pSQLMaster.FieldByName( lkpDBCod.DataField ).AsDateTime := StrToDateTimeDef( mm.varC_Lookup_Code, StrToDateTime( '30/12/1899 00:00:00' ) )
                         else
                            pSQLMaster.FieldByName( lkpDBCod.DataField ).AsDateTime := StrToDateTimeDef( mm.varC_Lookup_Code, StrToDateTime( '30/12/1899 00:00:00' ) );
                         if mm.varC_Lookup_Code = '' then
                            LkpDBEdit.Hint := rc_AddHintAttr( '|lkp-tag:' + '-1234567' , LkpDBEdit.Hint, True )
                         else
                            LkpDBEdit.Hint := rc_AddHintAttr( '|lkp-tag:' + mm.varC_Lookup_Code , LkpDBEdit.Hint, True );
                         LkpDBEdit.Tag  := 0;
                      end
                      else
                      if pSQLMaster.FieldByName( lkpDBCod.DataField ).DataType = ftLargeint then
                      begin
                         pSQLMaster.FieldByName( lkpDBCod.DataField ).AsLargeInt := StrToInt64Def( mm.varC_Lookup_Code , 0 );
                         LkpDBEdit.Hint := rc_AddHintAttr( '|lkp-tag:' + StrToInt64Def( mm.varC_Lookup_Code , 0 ).ToString , LkpDBEdit.Hint, True );
                         LkpDBEdit.Tag  := 0;
                      end
                      else
                      begin
                         pSQLMaster.FieldByName( lkpDBCod.DataField ).AsInteger := StrToIntDef( mm.varC_Lookup_Code , 0 );
                         LkpDBEdit.Hint := rc_AddHintAttr( '|lkp-tag:' + StrToIntDef( mm.varC_Lookup_Code , 0 ).ToString , LkpDBEdit.Hint, True );
                         LkpDBEdit.Tag  := StrToIntDef( mm.varC_Lookup_Code , -1234567 );
                      end;
                   end
                   else
                   begin
                     if ( DataTypeStrIsString( cPkType ) ) or
                        ( DataTypeStrIsDateTime( cPkType ) ) then
                      begin
                         if mm.varC_Lookup_Code = '' then
                            LkpDBEdit.Hint := rc_AddHintAttr( '|lkp-tag:' + '-1234567' , LkpDBEdit.Hint, True )
                         else
                            LkpDBEdit.Hint := rc_AddHintAttr( '|lkp-tag:' + mm.varC_Lookup_Code , LkpDBEdit.Hint, True );
                         LkpDBEdit.Tag  := 0;
                      end
                      else
                      if DataTypeStrIsBigInt( cPkType ) then
                      begin
                         LkpDBEdit.Hint := rc_AddHintAttr( '|lkp-tag:' + StrToInt64Def( mm.varC_Lookup_Code , 0 ).ToString , LkpDBEdit.Hint, True );
                         LkpDBEdit.Tag  := 0;
                      end
                      else
                      begin
                         LkpDBEdit.Hint := rc_AddHintAttr( '|lkp-tag:' + StrToIntDef( mm.varC_Lookup_Code , 0 ).ToString , LkpDBEdit.Hint, True );
                         LkpDBEdit.Tag  := StrToIntDef( mm.varC_Lookup_Code , -1234567 );
                      end;
                   end;
                   //[PT] campos adicionais que se deseja atribuir no resultado da pesquisa lookup
                   //[EN] additional fields that you want to assign to the lookup search result
                   if ( pExtraResponseField <> '' ) and ( pExtraSearchField <> '' ) and ( lkpQuery.ParamByName( 'table_pk' ).AsInteger >= 0 ) then
                      pSQLMaster.FieldByName( LkpDBPesqExtra.DataField ).AsString := dm_rc.sqlLookUpSearch.FieldByName( pExtraResponseField ).AsString;
                end;
           end
           else // CLEAR BUTTON
           if   ( ( ( LkpDBCod.Text <> '' ) and ( LkpDBCod.Text <> '0' ) and ( iTag = 1 ) ) or ( iTag = 0 ) ) or
                ( ( ( pIsExtraSearch ) and ( iTag = 1 ) ) or ( iTag = 0 ) ) then
           begin
                //bigint 6.0.0.0
                if ( DataTypeStrIsString( cPkType ) ) then
                begin
                   lkpQuery.FormatOptions.StrsTrim2Len := true;
                   lkpQuery.ParamByName( 'table_pk' ).Value := mm.varC_Lookup_Code;
                end
                else
                if ( DataTypeStrIsDateTime( cPkType ) ) then
                begin
                    lkpQuery.ParamByName( 'table_pk' ).AsDateTime := StrToDateTimeDef( mm.varC_Lookup_Code, 0 );
                end
                else
                if ( DataTypeStrIsBigInt( cPkType ) ) then
                   lkpQuery.ParamByName( 'table_pk' ).AsLargeInt := StrToInt64Def( mm.varC_Lookup_Code , 0 )
                else
                   lkpQuery.ParamByName( 'table_pk' ).AsInteger := StrToIntDef( mm.varC_Lookup_Code , 0 );
                if rc_OpenQuery( lkpQuery ) then
                begin
                   //bigint 6.0.0.0
                   if not bOnlySearch then
                   begin
                      if ( DataTypeIsDateTime( pSQLMaster.FieldByName( lkpDBCod.DataField ).DataType ) ) or
                         ( DataTypeIsString( pSQLMaster.FieldByName( lkpDBCod.DataField ).DataType ) ) then
                      begin
                         pSQLMaster.FieldByName( lkpDBCod.DataField ).Value := mm.varC_Lookup_Code;
                         if mm.varC_Lookup_Code = '' then
                            LkpDBEdit.Hint := rc_AddHintAttr( '|lkp-tag:' + '-1234567' , LkpDBEdit.Hint, True )
                         else
                            LkpDBEdit.Hint := rc_AddHintAttr( '|lkp-tag:' + mm.varC_Lookup_Code , LkpDBEdit.Hint, True );
                         LkpDBEdit.Tag := 0;
                      end
                      else
                      if pSQLMaster.FieldByName( lkpDBCod.DataField ).DataType = ftLargeint then
                      begin
                         pSQLMaster.FieldByName( lkpDBCod.DataField ).AsLargeInt := StrToInt64Def( mm.varC_Lookup_Code , 0 );
                         LkpDBEdit.Hint := rc_AddHintAttr( '|lkp-tag:' + StrToInt64Def( mm.varC_Lookup_Code , 0 ).ToString , LkpDBEdit.Hint, True );
                         LkpDBEdit.Tag := 0;
                      end
                      else
                      begin
                         pSQLMaster.FieldByName( lkpDBCod.DataField ).AsInteger := StrToIntDef( mm.varC_Lookup_Code , 0 );
                         LkpDBEdit.Hint := rc_AddHintAttr( '|lkp-tag:' + StrToIntDef( mm.varC_Lookup_Code , 0 ).ToString , LkpDBEdit.Hint, True );
                         LkpDBEdit.Tag := StrToIntDef( mm.varC_Lookup_Code , -1234567 );
                      end;
                   end
                   else
                   //bigint 6.0.0.0
                   begin
                      if ( DataTypeStrIsString( cPkType ) ) or
                         ( DataTypeStrIsDateTime( cPkType ) ) then
                      begin
                         if mm.varC_Lookup_Code = '' then
                            LkpDBEdit.Hint := rc_AddHintAttr( '|lkp-tag:' + '-1234567' , LkpDBEdit.Hint, True )
                         else
                            LkpDBEdit.Hint := rc_AddHintAttr( '|lkp-tag:' + mm.varC_Lookup_Code , LkpDBEdit.Hint, True );
                         LkpDBEdit.Tag := 0;
                      end
                      else
                      if ( DataTypeStrIsBigInt( cPkType ) ) then
                      begin
                         LkpDBEdit.Hint := rc_AddHintAttr( '|lkp-tag:' + StrToInt64Def( mm.varC_Lookup_Code , 0 ).ToString , LkpDBEdit.Hint, True );
                         LkpDBEdit.Tag := 0;
                      end
                      else
                      begin
                         LkpDBEdit.Hint := rc_AddHintAttr( '|lkp-tag:' + StrToIntDef( mm.varC_Lookup_Code , 0 ).ToString , LkpDBEdit.Hint, True );
                         LkpDBEdit.Tag  := StrToIntDef( mm.varC_Lookup_Code , -1234567 );
                      end;
                   end;
                end;
           end;
        end;
     finally
        // caso tenha vindo de um edLKP____PesqExtra
        mm.varC_WhereExtra := '';

        if ( mm.varC_Lookup_Code <> '_ESC_' ) and ( StrToIntDef( mm.varC_Lookup_Code , 0 ) = 0 ) and
           ( ( LkpDBCod.Text <> '' ) and ( LkpDBCod.Text <> '0' ) and ( iTag = 1 ) ) then
        begin
           if dm_rc.sqlLookUpSearch.IsEmpty then
              rc_ShowSweetAlert( mm.MSG_INFO, mm.MSG_RECORD_NOT_FOUND, 'warning' );
        end
        else
        begin
            // por o foco no campo que chamou... ( EM TESTES..dando conflitos )
//                if LkpDBPesqExtra <> nil then
//                   rc_SetFocus( LkpDBPesqExtra )
//                else
//                if ( LkpDBCod <> nil ) and ( LkpDBCod.Visible ) then
//                   rc_SetFocus( LkpDBCod );
        end;

        dm_rc.sqlLookUpSearch.Close;
        // atualizar todos os LOOKUPs dinamicamente | update all LOOKUPs dynamically
        rc_LookUpUpdateData( pFrame, LkpDBEdit );
        // 6.0.0.0
        LkpDBEdit.ReadOnly := false;
        dm_rc.rc_SetFocus( LkpDBEdit );
        // 6.0.0.0
        if ( bLite2 ) and ( LkpDBEdit.Text <> '' ) then
        begin
           cTemp  := StringReplace( lowercase( LkpDBEdit.Name ), 'edlkp' , 'btnLkpClear' , [rfReplaceAll] );
           LkpBtnClear := TUniLabel( TComponent(pFrame).FindComponent( cTemp ) );
           if LkpBtnClear = nil then
           begin
              LkpBtnClear              := TUniLabel.Create( TComponent(pFrame) );
              LkpBtnClear.Parent       := LkpDBEdit.Parent;
              LkpBtnClear.Name         := cTemp;
              LkpBtnClear.Hint         := '[[ico:fas-trash-alt]]';
              LkpBtnClear.Font.Size    := LkpDBEdit.Font.Size + 2 ;
              LkpBtnClear.Alignment    := taCenter;
              LkpBtnClear.Left         := LkpDBEdit.Left + LkpDBEdit.Width - 23;
              LkpBtnClear.Cursor       := crHandPoint;
              //LkpBtnClear.Top          := LkpDBEdit.Top + 6; // 6.0.0.0+
              LkpBtnClear.AutoSize     := false;
              LkpBtnClear.Width        := 19;
              LkpBtnClear.Height       := 16;
              LkpBtnClear.Top          := LkpDBEdit.Top + ( ( LkpDBEdit.Height div 2 ) - ( LkpBtnClear.Height div 2 ) ); // 6.0.0.0+
              LkpBtnClear.Transparent  := false;
              LkpBtnClear.Color        := LkpDBEdit.Color;
              LkpBtnClear.Anchors      := [akTop,akRight];
              LkpBtnClear.OnClick      := DynamicBtnClearClick;
              rc_RenderControls( pFrame, LkpBtnClear );
           end
           else
              LkpBtnClear.Visible := true;
        end;
        if ( ( bLite2 ) and ( LkpDBEdit.Text <> '' ) ) or
           ( ( Pos( ' readonly' ,  LkpDBEdit.Hint ) > 0 ) ) then
           LkpDBEdit.ReadOnly := true;
     end;
  end;
end;

procedure tdm_rc.UniSweetAlertConfirm(Sender: TObject);
begin
     if oSweetAlertFocus_Confirm <> nil then
     begin
         rc_SetFocus( oSweetAlertFocus_Confirm );
     end;
end;

procedure tdm_rc.UniSweetAlertDismiss(Sender: TObject; const Reason: TDismissType);
begin
     if oSweetAlertFocus_Dismiss <> nil then
     begin
         rc_SetFocus( oSweetAlertFocus_Dismiss );
     end;
end;
//8.0.0.0
//[PT] deve ser chamado no evento CREATE
//[EN] must be called in the CREATE event
procedure tdm_rc.rc_RenderLookUpControls(pFrame: TObject);
var
   iPos, iTabOrder,
   I, F : integer;
   // identifiers
   //           +     @        !      !!      #         *         &         >
   bTableName, bPlus, bSearch, bLite, bLite2, bExtra, bSearchOFF, bInsEdit, bDetail, bOnlySearch : Boolean; // 6.0.0.0  blite2
   cTableName,
   //[PT] para forçar a captura de outro campo diferente da função rc_GetPrimaryKey( quano há chave composta, ex: IDFILIAL, IDPRODUTO ) // 6.0.0.0
   //[EN] to force the capture of another field other than the rc_GetPrimaryKey function (when there is a composite key, e.g. IDFILIAL, IDPRODUTO ) // 6.0.0.0
   cGetThisPK,
   cFieldConcat, // Ex: NAME+SURNAME

   cDbCodWidth, cDbExtraWidth,

   cTmp, cTmp2, cLkpTblPK, cLkpAttr, // 6.0.0.0
   cTemp, cTemp2, cTemp3, cTemp4, cFields, cSaveTo,

   WhereAnd, sql, consulta,
   pTypeButton : string;

   slLkpSetDS : TStringList;
   LkpSetDS : TObject;
   oHtmlFrm : TUniHTMLFrame;
   LkpDBCod,
   LkpDBCodExtra,
   LkpDBEdit : TUniDBEdit;

   LkpBtn,
   LkpBtnAdd : TUniSpeedButton;

   pSQLMaster,
   pSQLDetail,
   LkpQuery : TFDQuery;

   pDSMaster,
   pDSDetail,
   pDSSetDS_Orig,
   LkpDataSource : TDataSource;

   pComponent : TComponent;

   cPkType, //8.4.0.1 lookup str
   AllPKs, cSql,
   cAllPKExists, cPk,
   LkpName,

   LkpSelectFields,

   LkpName_Query, // query <> sqlMaster
   LkpName_DataField_CodID,
   LkpName_DataField_Extra,
   LkpName_DataField_Extra_Source,

   BtnType,BtnTypeCls, BtnTypeClsIco, BtnTypeSearchIco, BtnTypePlusIco, //8.0.0.0

   LkpJoinTable,
   LkpJoinField,

   LkpTable : string;
   iBtnTypeOffSet : integer; //8.0.0.0

   pDM : TDataModule;
begin
    LkpDBCodExtra := nil;
    pDSDetail     := nil;
    pDM := nil;
    pSQLMaster := TFDQuery( TComponent(pFrame).FindComponent( 'sqlMaster' ) );
    pDSMaster  := TDataSource( TComponent(pFrame).FindComponent( 'dsMaster' ) );
    //[PT] ajustar as tabelas de lookup de acordo com o nome da query
    //[EN] adjust the lookup tables according to the query name
    for I := 0 to TComponent(pFrame).ComponentCount - 1 do
    begin
         pComponent := TComponent(pFrame).Components[I];

         if ( pComponent is TUniLabel ) Then
         begin
            if mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' then
               TUniLabel( pComponent ).Font.Name  := mm.CONFIG_LAYOUT_APP_FONT;
            // versao 1530 acima..traz FONTAWESOME 5
            cTemp := TUniLabel( pComponent ).Caption;
         end
         else
         if ( pComponent is TUniListBox ) Then
         begin
            if mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' then
               TUniListBox( pComponent ).Font.Name  := mm.CONFIG_LAYOUT_APP_FONT;

            TUniListBox( pComponent ).Font.Size  := 10;
         end
         else
         //btnLkp
         if ( pComponent is TUniSpeedButton ) or ( pComponent is TUniBitBtn ) then
         begin
            if ( pComponent is TUniSpeedButton ) then
               cTemp := TUniSpeedButton( pComponent ).Caption
            else
               cTemp := TUniBitBtn( pComponent ).Caption;

            if ( lowercase( Copy( TUniSpeedButton( pComponent ).Name , 1, 6 ) ) = 'btnlkp' ) then
            begin
               TUniSpeedButton( pComponent ).JSInterface.JSCall( 'addCls' , [ 'ButtonThemeCrud' ]);
            end;
         end
         else
         if pComponent is TUniDBEdit then
         begin
            //[PT] indicacao que esse uniDbEdit tem mascara...
            //[EN] indication that this uniDbEdit has a mask...
            cTemp := rc_GetHintAttr( 'mask:', TUniDBEdit( pComponent ).hint ) ;
            if ( TUniDBEdit( pComponent ).InputMask.Mask <> '' ) or ( cTemp <> '' ) then
            begin
                 TUniDBEdit( pComponent ).InputMask.Mask := '';
                 TUniDBEdit( pComponent ).tag := 9999;
            end;
            //[PT] ajustar cores dos campos lkp e adicionar EVENTO dinamico
            //[EN] adjust lkp field colors and add dynamic EVENT
            if ( lowercase( Copy( TUniDBEdit( pComponent ).Name , 1, 5 ) ) = 'edlkp' ) and
               ( ( Pos( '_setds' , lowercase( TUniDBEdit( pComponent ).Name ) ) = 0 ) and
                 ( Pos( '_pesqextra' , lowercase( TUniDBEdit( pComponent ).Name ) ) = 0 ) and
                 ( Pos( '_codid' , lowercase( TUniDBEdit( pComponent ).Name ) ) = 0 ) ) then
            begin
               //[PT] adicionar evento dinamico caso o usuario esteja usando somente teclado
               //      ao teclar algo, aciona a pesquisa lookup vinculada
               //[PT] add dynamic event if the user is only using the keyboard
               //      when typing something, triggers the linked lookup search
               TUniDBEdit( pComponent ).OnKeyDown := DynamicOnKeyDown;
               //[PT] nomenclatura padrao para capturar os dados necessários para otimizar a pesquisa lookup.
               //      Todo lookUp precisa ter um KEYFIELD( padrao CODIGO ) e LISTFIELD( padrao DESCRICAO )
               //      uma QUERY e um DATASOURCE pra vincular a PESQUISA e poderem ser acessiveis para alguma parte do projeto suas respectivas informações
               //[PT] standard nomenclature to capture the data necessary to optimize the lookup search.
               // Every lookUp must have a KEYFIELD (CODE pattern) and LISTFIELD (DESCRIPTION pattern)
               // a QUERY and a DATASOURCE to link the RESEARCH and make their respective information accessible to some part of the project
               LkpDBEdit           := TUniDBEdit( pComponent );
               LkpName             := LkpDBEdit.Name;
               cTemp               := LkpDBEdit.DataField;
               //8.0.0.0
               if LkpDBEdit.Align = alBottom then
               begin
                    LkpDBEdit.Align := alNone;
                    LkpDBEdit.Anchors := [akLeft, akTop, akRight];
               end;
               // 6.0.0.0
               if ( Pos( '[[' , LkpDBEdit.Hint ) > 0 ) or ( Pos( '[[ ' , LkpDBEdit.Hint ) > 0 )  then
               begin
                    //8.1.0.0 thanks for bugtracker FABIO OLIVEIRA
                    cTemp2         := rc_GetHintAttr( 'lkpfilter-gridattr:', LkpDBEdit.Hint, false, true);
                    cTemp          := StringReplace( cTemp2, 'width:', 'width-col:', [rfReplaceAll] );
                    LkpDBEdit.Hint := StringReplace( LkpDBEdit.Hint, cTemp2, cTemp, [rfReplaceAll] );
                    //8.4.0.0 align col
                    cTemp2         := rc_GetHintAttr( 'lkpfilter-gridattr:', LkpDBEdit.Hint, false, true);
                    cTemp          := StringReplace( cTemp2, 'title:', 'title-name:', [rfReplaceAll] );//8.4.0.0 align col
                    LkpDBEdit.Hint := StringReplace( LkpDBEdit.Hint, cTemp2, cTemp, [rfReplaceAll] );
                    //8.4.0.0 align col
                    cTemp2         := rc_GetHintAttr( 'lkpfilter-gridattr:', LkpDBEdit.Hint, false, true);
                    cTemp          := StringReplace( cTemp2, 'titlealign:', 'align-title:', [rfReplaceAll] );//8.4.0.0 align col
                    LkpDBEdit.Hint := StringReplace( LkpDBEdit.Hint, cTemp2, cTemp, [rfReplaceAll] );
                    //8.4.0.0 align col
                    cTemp2         := rc_GetHintAttr( 'lkpfilter-gridattr:', LkpDBEdit.Hint, false, true);
                    cTemp          := StringReplace( cTemp2, 'align:', 'col-align:', [rfReplaceAll] );//8.4.0.0 align col
                    LkpDBEdit.Hint := StringReplace( LkpDBEdit.Hint, cTemp2, cTemp, [rfReplaceAll] );

                    cTemp          := rc_NormalizeHintAttr( LkpDBEdit.Hint ) ;
                    cTemp          := ReverseStr( cTemp );
                    if Copy( cTemp, 1, 1 ) = '|' then
                       cTemp := Copy( cTemp, 2 ) ;
                    cTemp := ReverseStr( cTemp );

                    if Copy( cTemp, 1, 4 ) <> 'lkp:' then
                    begin
                         cTmp  := '';
                         cTemp := 'lkp:' + cTemp;
                         if Pos ( '|', cTemp ) > 0 then
                            cTmp  := Copy( cTemp, Pos( '|', cTemp ) );
                         cTemp  := rc_GetHintAttr( 'lkp:' , cTemp ) ;
                         cTemp2 := rc_GetHintAttr( 'ds:', cTemp, true, false, true ); // 6.0.0.0 unyilnextspace "ds:dslookup +modal" ..
                         if cTemp2 <> '' then
                            cTemp  := StringReplace( cTemp, ' ds:' + cTemp2, '', [rfReplaceAll] )  + ' ds:' + cTemp2 + ' ';
                         cTemp2 := '';
                         cTemp := 'lkp:' + cTemp + cTmp;

                         LkpDBEdit.Hint := '[[' + cTemp + ']]';
                         cTemp  := rc_GetHintAttr( 'lkp:' , cTemp ) ;
                         cLkpAttr := cTemp;
                    end;
               end;
               LkpDBEdit.ReadOnly  := ( Pos( ' readonly' , cLkpAttr ) > 0 ) ; // 6.0.0.0
               // DESCRICAO(carros|codicarro)__CODIVEICULO!#PLACA    <- previous version in DATAFIELD property
               // DESCRICAO(carros|codicarro) CODIVEICULO ! #PLACA   <- new version in HINT property
               bOnlySearch         := Pos ( ' searchonly' , cTemp ) > 0 ;
               bTableName          := Pos ( ' tbl:' , cTemp ) > 0 ;
               bPlus               := Pos ( ' +' , cTemp ) > 0 ;
               bSearch             := Pos ( ' @' , cTemp ) > 0 ;
               bExtra              := Pos ( ' #' , cTemp ) > 0 ; // EXTRA search
               bSearchOFF          := Pos ( ' *' , cTemp ) > 0 ; // search OFF
               //bInsEdit            := Pos ( '&' , cTemp ) > 0 ; // state in Insert or Edit ?
               bDetail             := Pos ( ' ds:' , cTemp  ) > 0 ; // query <> sqlMaster( Default ) to use with Detail
               // 6.0.0.0  blite2
               bLite               := false;
               bLite2              := Pos ( ' !!' , cTemp ) > 0 ;
               if not bLite2 then
                  bLite            := Pos ( ' !' , cTemp ) > 0
               else
               begin
                    bSearch        := false; // bLite2 do not have "@" search by ID
                    bSearchOFF     := true;
               end;
               //8.0.0.0
               iBtnTypeOffSet     := 0;
               BtnType            := rc_GetHintAttr( 'btntype:', LkpDBEdit.Hint );
               BtnTypeCls         := rc_GetHintAttr( 'btntypecls:', LkpDBEdit.Hint );
               BtnTypeClsIco      := rc_GetHintAttr( 'btntypeclsico:', LkpDBEdit.Hint );
               BtnTypeSearchIco   := rc_GetHintAttr( 'btntypeicosearch:', LkpDBEdit.Hint );
               BtnTypePlusIco     := rc_GetHintAttr( 'btntypeicoplus:', LkpDBEdit.Hint );
               If BtnTypeCls = '' then
                  BtnTypeCls := 'ButtonThemeCrud';
               If BtnType <> '' then
               begin
                  iBtnTypeOffSet := 2;
                  if Pos( 'outline', BtnType ) > 0 then //theme outline
                  begin
                     BtnTypeClsIco := 'color-themecrud';
                     iBtnTypeOffSet := 3;
                  end
                  else
                  If BtnType <> 'theme' then
                     BtnTypeClsIco := 'color-gray-light'
                  else
                     BtnTypeClsIco := 'color-white';
               end;
               If BtnTypeClsIco <> '' then
                  BtnTypeClsIco := '|cls-ico:' + BtnTypeClsIco;
               If BtnTypeSearchIco = '' then
                  BtnTypeSearchIco := 'ico:fas-search';
               If BtnTypePlusIco = '' then
                  BtnTypePlusIco := 'ico:fas-plus';
               // 6.0.0.0
               // future feature
               LkpSelectFields     := 'tab.*'; //LkpSelectFields     := '*';
               // 6.0.0.0
               cGetThisPK          := '';
               if Pos ( ' getpk:' , cTemp ) > 0 then
               begin
                    cGetThisPK     := rc_GetHintAttr( 'getpk:', cTemp, true, false, true );//8.4.0.1 lookup
                    cTemp          := StringReplace( cTemp, ' getpk:' + cGetThisPK, '', [rfReplaceAll]);
               end;
               //[PT] manter compatibilidade com versão anterior do lookup
               //[EN] maintain compatibility with the previous version of the lookup
               if ( Pos( '[[' , LkpDBEdit.Hint ) > 0 ) or ( Pos( '[[ ' , LkpDBEdit.Hint ) > 0 )  then
               begin
                    // 6.0.0.0
                    if bTableName then
                    begin
                       cTableName := rc_GetHintAttr( 'tbl:' , cTemp , true, true);
                       cTemp      := StringReplace( cTemp, 'tbl:' + cTableName, '', [rfReplaceAll] );
                    end;
                    // 6.0.0.0 joins
                    pDSDetail := nil;
                    if bDetail then
                    begin
                       // 6.0.0.0
                       cTemp2 := '';
                       begin
                         cTmp   := '';
                       end;
                       cTemp2     := Trim( Copy( cTemp, Pos( ' ds:', cTemp ) + 4, 200 ) );
                       If Pos( '.', cTemp2 ) > 0 then
                       begin
                           //for F := 0 to UniApplication.FormRegistered( ) - 1 do
                           pDM := nil;
                           pDM := rc_FindDataModule( Copy( cTemp2, 1, pos( '.', cTemp2 ) - 1 ) );
                           cTemp2 := Copy( cTemp2, pos( '.', cTemp2 ) + 1 );
                       end;
                       if pDM <> nil then
                          pDSDetail  := TDataSource( pDM.FindComponent( cTemp2 ) )
                       else
                          pDSDetail  := TDataSource( TComponent(pFrame).FindComponent( cTemp2 ) );
                    end;

                    LkpDBEdit.DataField := cTemp;

                    cTemp3 := '';
                    if bSearch then
                    begin
                      cTemp3 := Trim( Copy( LkpDBEdit.DataField, Pos( '@', LkpDBEdit.DataField ) , 100 ) );

                      if Pos( ' ', cTemp3) > 0 then
                         cTemp3 := Trim( Copy( cTemp3, 1, Pos( ' ', cTemp3 ) - 1 ) );
                    end;
                     // feedback by JOSAURO
                    cTemp2 := '';
                    if bExtra then
                    begin
                      cTemp2 := Trim( Copy( LkpDBEdit.DataField, Pos( '#', LkpDBEdit.DataField ) , 100 ) ) + ' ';
                      cTemp2 := Trim( Copy( cTemp2, 1, Pos( ' ', cTemp2 ) ) );
                    end;

                    cFieldConcat := '';
                    cTemp := Trim( Copy( cTemp, 1, Pos( ' ', cTemp ) ) );

                    if Pos( '+' , cTemp ) > 0 then
                       cFieldConcat  := Trim( Copy( cTemp, Pos( '+' , cTemp ), 100 ) );

                    cTemp := StringReplace( cTemp, cFieldConcat , '', [rfReplaceAll] );

                    if cFieldConcat <> '' then
                    begin
                       LkpDBEdit.DataField := Trim( StringReplace( LkpDBEdit.DataField, cTemp + cFieldConcat , '', [rfReplaceAll] ) ) + ' ';
                       cFieldConcat        := '||' + Copy( cFieldConcat, 2, 200 );
                    end
                    else
                    begin
                       cTmp := LkpDBEdit.DataField;
                       iPos := Pos( cTemp, cTmp );
                       LkpDBEdit.DataField := Trim( Copy( LkpDBEdit.DataField, iPos + Length( cTemp ), 200 ) ) + ' ' ;
                    end;

                    LkpDBEdit.DataField := Copy( LkpDBEdit.DataField , 1, Pos( ' ', LkpDBEdit.DataField ) - 1 );
                    //7.3.0.0
                    cTemp := cTemp + cFieldConcat + '__' + LkpDBEdit.DataField + varIIF( bPlus     , '+', '' ) +
                                                                                 varIIF( bSearch   , cTemp3, '' ) +
                                                                                 varIIF( bLite2    , '!!', '' ) +
                                                                                 varIIF( bLite     , '!', '' ) +
                                                                                 varIIF( bSearchOFF, '*', '' ) + cTemp2;

                    LkpDBEdit.DataField := cTemp;
               end;

               cDbCodWidth := '40';
               if bSearch then
               begin
                  cDbCodWidth := ReturnNumbers( Copy( cTemp3 + ' ', Pos ( '@' , cTemp3 + ' ' ) ) ); // 6.0.0.0
                  LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, '@' + cDbCodWidth , '', [rfReplaceAll] );
               end;

               LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, '+', '', [rfReplaceAll] );
               LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, '@', '', [rfReplaceAll] );
               LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, '!', '', [rfReplaceAll] );
               LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, '*', '', [rfReplaceAll] );

               LkpName_DataField_Extra := '';
               if bExtra then
               begin
                  cDbExtraWidth := '70';
                  if bExtra then
                  begin
                     cDbExtraWidth       := ReturnNumbers( Copy( LkpDBEdit.DataField, Pos( '#', LkpDBEdit.DataField ) + 1, 2 ) ) ;
                     LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, '#' + cDbExtraWidth , '#', [rfReplaceAll] );
                  end;
                  LkpName_DataField_Extra        := Copy( LkpDBEdit.DataField , Pos( '#', LkpDBEdit.DataField ) + 1, 100 );
                  LkpName_DataField_Extra_Source := Copy( LkpName_DataField_Extra, Pos( '=', LkpName_DataField_Extra ) + 1, 100 );
                  LkpName_DataField_Extra        := StringReplace( LkpName_DataField_Extra, '=' + LkpName_DataField_Extra_Source, '', [rfReplaceAll] );
               end;

               if Pos( '=' , LkpDBEdit.DataField ) > 0 then
                  LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, '#' + LkpName_DataField_Extra + '=' + LkpName_DataField_Extra_Source, '', [rfReplaceAll] )
               else
                  LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, '#' + LkpName_DataField_Extra , '', [rfReplaceAll] );

               // Have a Join ?
               LkpJoinTable := '';
               iPos := Pos( '(' , LkpDBEdit.DataField );
               if iPos > 0 then
               begin
                   LkpJoinTable        := Copy( LkpDBEdit.DataField, iPos, Pos( ')' , LkpDBEdit.DataField ) );
                   LkpJoinTable        := Copy( LkpJoinTable, 1, Pos( ')' , LkpJoinTable ) );
                   LkpDBEdit.DataField := StringReplace( LkpDBEdit.DataField, LkpJoinTable, '', [rfReplaceAll] );
                   //6.0.0.0
                   LkpJoinField        := Copy( LkpJoinTable, Pos( '/' , LkpJoinTable ) + 1 , Pos( ')' , LkpJoinTable ) );
                   LkpJoinField        := Copy( LkpJoinField, 1 , Pos( ')' , LkpJoinField ) - 1 );
                   LkpJoinTable        := Copy( LkpJoinTable, 2, Pos( '/' , LkpJoinTable ) - 2 );
               end;

               cTemp               := LkpDBEdit.DataField;
               // Criar _CodID dinamico ? | Create dynamic _CodID?
               iPos      := Pos ( '__' , cTemp  );

               LkpName_DataField_CodID := '';
               if iPos > 0 then
               begin
                  LkpName_DataField_CodID := Copy( cTemp , iPos + 2 , 50 );

                  //[PT] tem concatenacao de campos de resultado ?( field1||field2 )
                  //[EN] do you have concatenation of result fields? (field1||field2)
                  if Pos( '||' , cTemp ) > 0 then
                     LkpDBEdit.DataField  := Copy ( cTemp , 1, Pos( '||' , cTemp ) - 1 )
                  else
                      LkpDBEdit.DataField := Copy ( cTemp , 1, iPos - 1 );  //'NOME+FONE1'
               end;

               if bOnlySearch then
               begin
                    //bigint 6.0.0.0
                    LkpDBEdit.Tag := -1234567;
                    LkpDBEdit.Hint := rc_AddHintAttr( '|lkp-tag:' + '-1234567' , LkpDBEdit.Hint, True );
               end;

               LkpDBCod  := TUniDBEdit( TComponent(pFrame).FindComponent( LkpName + '_CodID' ) );
               //[PT] se nao encontrou já existente, cria _CodID dinamico...
               //[EN] if you don't find an existing one, create a dynamic _CodID...
               if LkpDBCod = nil then
               begin
                    LkpDBCod              := TUniDBEdit.Create( TComponent(pFrame) );
                    LkpDBCod.Parent       := LkpDBEdit.Parent;
                    LkpDBCod.Name         := lowercase( LkpDBEdit.Name ) + '_CodID';

                    if not bOnlySearch then
                    begin
                       if pDSDetail = nil then
                          LkpDBCod.DataSource   := pDSMaster
                       else
                          LkpDBCod.DataSource   := pDSDetail;

                       LkpDBCod.DataField    := LkpName_DataField_CodID;
                    end;
                    //LkpDBCod.InputType    := 'text'; //6.0.0.0 lookup
                    if mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' then
                       LkpDBCod.Font.Name    := mm.CONFIG_LAYOUT_APP_FONT;

                    LkpDBCod.Font.Size    := LkpDBEdit.Font.Size ;
                    LkpDBCod.Visible      := bSearch ;
                    LkpDBCod.Width        := StrToIntDef( cDbCodWidth, 40 );
                    LkpDBCod.Height       := LkpDBEdit.Height ;
                    LkpDBCod.Left         := LkpDBEdit.Left ;
                    LkpDBCod.Top          := LkpDBEdit.Top ;
                    LkpDBCod.TabOrder     := LkpDBEdit.TabOrder ;
                    LkpDBEdit.TabOrder    := LkpDBEdit.TabOrder + 1 ;
                    //7.0.0.0 lookup
                    if Pos( ' ds:' , cLkpAttr) > 0  then
                       LkpDBCod.OnChangeValue := DynamicOnChangeLkpID;

                    if LkpDBCod.Visible then
                    begin
                       LkpDBEdit.Width    := LkpDBEdit.Width - ( LkpDBCod.Width + 4 );
                       LkpDBEdit.Left     := LkpDBEdit.Left  + ( LkpDBCod.Width + 4 );
                       LkpDBCod.OnExit    := DynamicOnExit;

                       //rc_AddCssClass( LkpDBCod, 'rc-round-borders-edits' );//8.0.0.0
                       //LkpDBCod.InputType := 'number'; // this option work but show a "spin" in "edit"
                       //8.4.0.1 lookup str
                       cPkType := rc_GetLookupPKDataType( LkpDBEdit.Name );
                       if not DataTypeStrIsString( cPkType ) then
                          LkpDBCod.ClientEvents.ExtEvents.Values['keydown'] := rc_ExtEvtKeyDownOnlyNumbers;

                       rc_AddFocusBlur( pFrame, TUniControl( LkpDBCod ), mm.CONFIG_LAYOUT_EDIT_COLOR, mm.CONFIG_LAYOUT_EDIT_FOCUS_COLOR, mm.CONFIG_LAYOUT_EDIT_FONT_COLOR );
                    end;
               end;

               if not bOnlySearch then
               begin
                  // pesq. EXTRA
                  if bExtra then
                  begin
                     LkpDBCodExtra  := TUniDBEdit( TComponent(pFrame).FindComponent( LkpName + '_PesqEXTRA' ) );

                     // se nao encontrou já existente, cria _PesqEXTRA dinamico...
                     if LkpDBCodExtra = nil then
                     begin
                          LkpDBCodExtra              := TUniDBEdit.Create( TComponent(pFrame) );
                          LkpDBCodExtra.Parent       := LkpDBEdit.Parent;
                          LkpDBCodExtra.Name         := lowercase( LkpDBEdit.Name ) + '_PesqEXTRA';

                          if pDSDetail = nil then
                             LkpDBCodExtra.DataSource   := pDSMaster
                          else
                             LkpDBCodExtra.DataSource   := pDSDetail;

                          LkpDBCodExtra.DataField    := LkpName_DataField_Extra;
                          LkpDBCodExtra.CharCase     := ecUpperCase;
                          //LkpDBCodExtra.InputType    := 'text'; //6.0.0.0 lookup

                          if mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' then
                             LkpDBCodExtra.Font.Name    := mm.CONFIG_LAYOUT_APP_FONT;

                          LkpDBCodExtra.Font.Size    := LkpDBEdit.Font.Size ;
                          LkpDBCodExtra.Hint         := LkpName_DataField_Extra_Source;
                          LkpDBCodExtra.Width        := StrToIntDef( cDbExtraWidth, 70 );
                          LkpDBCodExtra.Left         := LkpDBEdit.Left ;
                          LkpDBCodExtra.Top          := LkpDBEdit.Top ;
                          LkpDBCodExtra.Height       := LkpDBEdit.Height ;

                          if LkpDBCodExtra.Visible then
                          begin
                             LkpDBEdit.Width         := LkpDBEdit.Width - ( LkpDBCodExtra.Width + 4 );
                             LkpDBEdit.Left          := LkpDBCodExtra.Left + LkpDBCodExtra.Width + 4;
                             //rc_AddCssClass( LkpDBCodExtra, 'rc-round-borders-edits' );//8.0.0.0
                          end;

                          LkpDBCodExtra.OnExit       := DynamicOnExitLkpExtra;

                          if LkpDBCod.Visible then
                          begin
                             LkpDBCodExtra.TabOrder  := LkpDBCod.TabOrder + 1 ;
                             LkpDBEdit.TabOrder      := LkpDBCodExtra.TabOrder + 1 ;
                             LkpDBCodExtra.Left      := LkpDBCod.Left + LkpDBCod.Width + 4;
                             //LkpDBEdit.Width         := LkpDBEdit.Width - ( LkpDBCod.Width + 4 );
                             LkpDBEdit.Left          := LkpDBCodExtra.Left + LkpDBCodExtra.Width + 4;

                             rc_AddFocusBlur( pFrame, TUniControl( LkpDBCod ), mm.CONFIG_LAYOUT_EDIT_COLOR, mm.CONFIG_LAYOUT_EDIT_FOCUS_COLOR, mm.CONFIG_LAYOUT_EDIT_FONT_COLOR );
                          end
                          else
                          begin
                             LkpDBCodExtra.TabOrder     := LkpDBEdit.TabOrder ;
                             LkpDBEdit.TabOrder         := LkpDBEdit.TabOrder + 1 ;
                          end;
                     end;
                  end;
               end;
               // se nao encontrou 'btnLkp', cria... | if you didn't find 'btnLkp', create...
               cTemp  := StringReplace( lowercase( LkpDBEdit.Name ), 'edlkp' , 'btnLkp' , [rfReplaceAll] );
               LkpBtn := TUniSpeedButton( TComponent(pFrame).FindComponent( cTemp ) );
               if LkpBtn = nil then
               begin
                    LkpBtn              := TUniSpeedButton.Create( TComponent(pFrame) );
                    LkpBtn.Parent       := LkpDBEdit.Parent;
                    LkpBtn.Name         := cTemp;
                    //8.0.0.0
                    if BtnType <> '' then
                    begin
                       if Pos( 'theme', BtnType ) > 0 then
                       begin
                          if Pos( 'outline', BtnType ) = 0 then
                             BtnTypeCls := 'ButtonCrudNoHover button-no-border-left'
                          else
                             BtnTypeCls := 'ButtonCrudOutlineNoHover button-no-border-radius-left';
                       end
                       else
                       if Pos( 'gray', BtnType ) > 0 then
                       begin
                          BtnTypeCls := 'ButtonGrayLightNoHover button-no-border-left';
                       end
                       else
                       if BtnType = 'white' then
                          BtnTypeCls := 'ButtonWhiteLightNoHover button-no-border-left';
                       //8.0.0.0
                       if ( Pos( 'btntype:trigger', LkpDBEdit.Hint ) = 0 ) then
                          rc_AddCssClass( LkpDBEdit, 'border-edit-right' );

                       rc_FocusBlur ( LkpBtn );
                    end;
                    LkpBtn.Hint      := '[[cls:' + BtnTypeCls + '|' + BtnTypeSearchIco + BtnTypeClsIco + ']]';

                    LkpBtn.Font.Size    := LkpDBEdit.Font.Size ;
                    LkpBtn.Alignment    := taCenter;
                    // 6.0.0.0
                    if mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' then
                       LkpBtn.Font.Name    := LkpBtn.Font.Name;
                    //[PT] se estiver dentro de um bloco 'responsivo'...
                    //[EN] if it is inside a 'responsive' block...
                    if Pos( 'rcblock', lowercase( LkpBtn.Parent.Name ) ) > 0 then
                       LkpBtn.Anchors   := [akTop,akRight];

                    LkpBtn.Tag          := varIIF( bLite or bLite2, 1, 0 ); // 6.0.0.0 blite2
                    LkpBtn.TabStop   := False;
                    //8.0.0.0
                    if ( not bSearchOFF ) and ( Pos( 'btntype:trigger', LkpDBEdit.Hint ) = 0 ) then
                    begin
                       if LkpDBEdit.Height <= 34 then
                          LkpDBEdit.Width := LkpDBEdit.Width - 27 + ( iBtnTypeOffSet  )  //8.0.0.0
                       else
                          LkpDBEdit.Width := LkpDBEdit.Width - 35 + ( iBtnTypeOffSet ); //8.0.0.0
                    end
                    else
                    begin
                         LkpBtn.Visible := false;
                         LkpBtn.Width   := 0;
                    end;

                    if not Assigned( LkpDBEdit.OnClick ) then
                       LkpBtn.OnClick      := DynamicBtnClick
                    else
                    begin
                       LkpBtn.OnClick      := LkpDBEdit.OnClick;
                       LkpDBEdit.OnClick   := nil;
                    end;
                    // 6.0.0.0 blite2
                    if bLite2 then
                    begin
                       TUniEdit( LkpDBEdit ).EmptyText := 'Digite algo...';  //translate
                    end;
               end;
               //8.0.0.0
               if ( LkpBtn <> nil ) and ( Pos( 'btntype:trigger', LkpDBEdit.Hint ) = 0 ) then
               begin
                  LkpBtn.Left   := LkpDBEdit.Left + LkpDBEdit.Width + 1 - ( iBtnTypeOffSet - 1 ) ;  //8.0.0.0
                  LkpBtn.Top    := LkpDBEdit.Top ;
                  LkpBtn.Height := varIIF( LkpDBEdit.Height < 24, 24, LkpDBEdit.Height ) ;
                  // 6.0.0.0
                  if not bSearchOFF then
                  begin
                     if LkpDBEdit.Height <= 34 then
                        LkpBtn.Width := 25
                     else
                        LkpBtn.Width := 33;
                  end
                  else
                  begin
                     LkpBtn.Width   := 0;
                     LkpBtn.Visible := false;
                  end;
                  LkpBtn.ClientEvents.ExtEvents.Values['click'] :=
                     'function click(sender, eOpts) ' +
                     '{ ' +
                     '  ajaxRequest( MainForm.htmlFrame, "_getXYLookup" , ' + // 6.0.0.0
                     '    ["x=" + ' + LkpDBEdit.JSName + '.getEl().getLeft(), ' +
                     '     "y=" + ' + LkpDBEdit.JSName + '.getEl().getTop() ,' +
                     '     "h=" + ' + LkpDBEdit.JSName + '.getEl().getHeight() ,' +
                     '     "w=" + ' + LkpDBEdit.JSName + '.getEl().getWidth() ]);' +
                     '} ';
                  //8.0.0.0 lookup keydown
                  LkpDBEdit.ClientEvents.ExtEvents.Values['keydown'] :=
                     'function click(sender, e, eOpts) ' +
                     '{ ' +
                     '  ajaxRequest( MainForm.htmlFrame, "_getXYLookup" , ' + // 6.0.0.0
                     '    ["x=" + ' + LkpDBEdit.JSName + '.getEl().getLeft(), ' +
                     '     "y=" + ' + LkpDBEdit.JSName + '.getEl().getTop() ,' +
                     '     "h=" + ' + LkpDBEdit.JSName + '.getEl().getHeight() ,' +
                     '     "w=" + ' + LkpDBEdit.JSName + '.getEl().getWidth() ]);' +
                     '} ';
               end;

               if not bOnlySearch then
               begin
                   // se nao encontrou 'btnLkpAdd', cria...
                   cTemp  := StringReplace( lowercase( LkpDBEdit.Name ), 'edlkp' , 'btnLkpAdd' , [rfReplaceAll] );
                   LkpBtnAdd := TUniSpeedButton( TComponent(pFrame).FindComponent( cTemp ) );

                   if LkpBtnAdd = nil then
                   begin
                        if bPlus and not bSearchOFF then
                        begin
                           LkpBtnAdd              := TUniSpeedButton.Create( TComponent(pFrame) );
                           LkpBtnAdd.Parent       := LkpDBEdit.Parent;
                           LkpBtnAdd.Name         := cTemp;
                           //8.0.0.0
                           if BtnType <> '' then
                           begin
                              rc_AddCssClass( LkpBtn, 'button-no-border-right' );
                              if Pos( 'theme', BtnType ) > 0 then
                              begin
                                 if Pos( 'outline', BtnType ) = 0 then
                                    BtnTypeCls := 'ButtonCrudNoHover button-no-border-left'
                                 else
                                    BtnTypeCls := 'ButtonCrudOutlineNoHover button-no-border-radius-left';
                              end
                              else
                              if Pos( 'gray', BtnType ) > 0 then
                              begin
                                 BtnTypeCls := 'ButtonGrayLightNoHover button-no-border-left';
                              end
                              else
                              if BtnType = 'white' then
                                 BtnTypeCls := 'ButtonWhiteLightNoHover button-no-border-left';
                              //8.0.0.0
                              if ( Pos( 'btntype:trigger', LkpDBEdit.Hint ) = 0 ) then
                                 rc_AddCssClass( LkpDBEdit, 'border-edit-right' );

                              rc_FocusBlur ( LkpBtnAdd );
                           end;
                           LkpBtnAdd.Hint := '[[cls:' + BtnTypeCls + '|' + BtnTypePlusIco + BtnTypeClsIco + ']]';

                           // 6.0.0.0
                           if mm.CONFIG_LAYOUT_APPLY_FONT_ALL = 'ON' then
                              LkpBtnAdd.Font.Name    := DEFAULT_FONT_NAME;
                           LkpBtnAdd.Font.Size    := DEAFULT_BTN_EDT_FONT_SIZE;
                           // se estiver dentro de um bloco 'responsivo'...
                           if Pos( 'rcblock', lowercase( LkpBtnAdd.Parent.Name ) ) > 0 then
                              LkpBtnAdd.Anchors   := [akTop,akRight];

                           LkpBtnAdd.Visible      := not bSearchOFF;
                           LkpBtnAdd.TabStop      := False;
                           //8.0.0.0
                           if ( LkpBtnAdd.Visible ) and ( Pos( 'btntype:trigger', LkpDBEdit.Hint ) = 0 ) then
                           begin
                              if LkpDBEdit.Height <= 34 then
                                 LkpDBEdit.Width := LkpDBEdit.Width - 27
                              else
                                 LkpDBEdit.Width := LkpDBEdit.Width - 35  ;
                              if not bSearchOFF then
                              begin
                                 if LkpDBEdit.Height <= 34 then
                                    LkpBtn.Left := LkpBtn.Left - 27
                                 else
                                    LkpBtn.Left := LkpBtn.Left - 35 ;
                              end;
                           end;
                           LkpBtnAdd.OnClick      := DynamicOnDblClick;
                        end;
                   end;
                   //8.0.0.0
                   if ( LkpBtnAdd <> nil ) and ( Pos( 'btntype:trigger', LkpDBEdit.Hint ) = 0 ) then
                   begin
                      if bSearchOFF then
                         LkpBtnAdd.Left   := LkpDBEdit.Left + LkpDBEdit.Width + 2 - iBtnTypeOffSet //8.0.0.0
                      else
                         LkpBtnAdd.Left   := LkpBtn.Left + LkpBtn.Width + 2 - iBtnTypeOffSet; //8.0.0.0
                      LkpBtnAdd.Top    := LkpDBEdit.Top ;
                      LkpBtnAdd.Height := LkpBtn.Height;
                      LkpBtnAdd.Width  := LkpBtn.Width;
                   end;
               end;
               //8.0.0.0 trigger
               If Pos( 'btntype:trigger', LkpDBEdit.Hint ) > 0 then
               begin
                    LkpDBEdit.Triggers.Clear;
                    if not bSearchOFF then
                    begin
                       LkpBtn.Visible := false;
                       //btnsearch lookup...
                       LkpDBEdit.ShowHint := false;
                       LkpDBEdit.Triggers.Add;
                       LkpDBEdit.Triggers.Items[0].IconCls := 'fas fa-search';
                       LkpDBEdit.Triggers.Items[0].HandleClicks := true;
                       //LkpDBEdit.Triggers.Items[0].Hint := LkpBtn.Name;
                       LkpDBEdit.OnTriggerEvent := dm_rc.DynamicOnTriggerEvent;
                       //rc_AddCssClass( LkpDBEdit, 'rc-form-trigger-faws' );
                       //btnadd lookup...
                       if LkpBtnAdd <> nil then
                       begin
                          LkpBtnAdd.Visible := false;

                          LkpDBEdit.Triggers.Add;
                          LkpDBEdit.Triggers.Items[1].IconCls := 'fas fa-plus';
                          LkpDBEdit.Triggers.Items[1].HandleClicks := true;
                          //LkpDBEdit.Triggers.Items[1].Hint := LkpBtnAdd.Name;
                          LkpDBEdit.OnTriggerEvent := dm_rc.DynamicOnTriggerEvent;
                          //rc_AddCssClass( LkpDBEdit, 'rc-form-trigger-faws' );
                       end;
                       rc_AddCssClass( LkpDBEdit, 'rc-form-trigger-faws' );
                    end;
               end;
               oHtmlFrm := TUniHTMLFrame( TComponent(pFrame).FindComponent('rc__Required' + LkpDBEdit.Name) );
               if oHtmlFrm <> nil then
               begin
                  oHtmlFrm.Left := LkpDBEdit.Left + LkpDBEdit.Width - 8;
                  oHtmlFrm.Top  := oHtmlFrm.Top - 1;
               end;
               oHtmlFrm := nil;
               // tentar ajustar o TabOrder... | try to adjust the TabOrder...
               iTabOrder := LkpDBEdit.TabOrder;

               if not bOnlySearch then
               begin
                  if ( bExtra ) and ( LkpDBCodExtra <> nil ) then
                  begin
                     LkpDBCodExtra.TabOrder := iTabOrder;
                     LkpDBEdit.TabOrder     := LkpDBCodExtra.TabOrder + 1;
                     LkpBtn.TabOrder        := LkpDBEdit.TabOrder + 1;

                     if LkpBtnAdd <> nil then
                     begin
                        LkpBtnAdd.TabOrder  := LkpBtn.TabOrder + 1;
                        LkpBtn.TabOrder     := LkpBtnAdd.TabOrder + 1;
                     end;
                  end
                  else
                  begin
                     LkpDBEdit.TabOrder     := iTabOrder ;
                     LkpBtn.TabOrder        := iTabOrder + 1;

                     if LkpBtnAdd <> nil then
                     begin
                        LkpBtnAdd.TabOrder  := LkpBtn.TabOrder ;
                        LkpBtn.TabOrder     := LkpBtnAdd.TabOrder + 1;
                     end;
                  end;
               end;
               // 6.0.0.0+lkp
               LkpTable  := lowercase( Copy( LkpName, 6, 50 ) );
               LkpQuery  := TFDQuery( TComponent(pFrame).FindComponent( lkpTable ) );
               //[PT] se nao encontou componente fisico, foi criada dinamicamente  ( prefixo "LKP_" )
               //[EN] if no physical component is found, it was created dynamically (prefix "LKP")
               if LkpQuery = nil then
                  LkpQuery  := TFDQuery( TComponent(pFrame).FindComponent( 'LKP_' + lkpTable ) );
               if LkpQuery = nil then
               begin
                    LkpQuery              := TFDQuery.Create( TComponent(pFrame) );
                    LkpQuery.Name         := 'LKP_' + uppercase( lkpTable );
                    LkpQuery.Connection   := mm.SQLConn;
               end;
               LkpDataSource  := TDataSource( TComponent(pFrame).FindComponent( 'dsLkp_' + lkpTable ) );
               if LkpDataSource = nil then
               begin
                    LkpDataSource         := TDataSource.Create( TComponent(pFrame) );
                    LkpDataSource.Name    := 'dsLkp_' + uppercase( lkpTable );
                    LkpDataSource.DataSet := LkpQuery;
               end;
               //if LkpDataSource = nil then
               begin
                    LkpDBEdit.DataSource     := LkpDataSource;
                    //[PT] verifica se tem campos de retorno do lookup ALEM do padrão( SetDS )
                    //[EN] checks if there are lookup return fields IN ADDITION to the default (SetDS)
                    if not bOnlySearch then
                    begin
                       slLkpSetDS := rc_FindAllComponents( pFrame, LkpName + '_SetDS_' );
                       if slLkpSetDS <> nil then
                       begin
                          for f := 0 to slLkpSetDS.Count - 1 do
                          begin
                             LkpSetDS := TUniDBEdit( TComponent(pFrame).FindComponent( slLkpSetDS.Strings[ f ] ) );
                             if LkpSetDS <> nil then
                             begin
                                TUniDBEdit( LkpSetDS ).DataSource := LkpDataSource;
                                TUniDBEdit( LkpSetDS ).DataField  := Trim( Copy ( TUniDBEdit( LkpSetDS ).Name, Pos( '_setds_', lowercase( TUniDBEdit( LkpSetDS ).Name ) ) + 7, 100 ) );

                                cTemp3 := TUniDBEdit( LkpSetDS ).Name;
                                cTemp3 := Copy( cTemp3, 1, Pos( '_setds_', lowercase( TUniDBEdit( LkpSetDS ).Name ) ) - 1 );

                                cTemp4 := '';
                                if TUniControl( TComponent(pFrame).FindComponent( cTemp3 )) <> nil then
                                begin
                                   // Lkp: DS <> dsMaster ?
                                   cTemp4 := rc_GetHintAttr( 'ds:', TUniControl( TComponent(pFrame).FindComponent( cTemp3 )).Hint ,true, false, true );

                                   if cTemp4 = '' then
                                      cTemp4 := 'dsMaster';

                                   if cTemp4 <> '' then
                                   begin
                                       TUniDBEdit( LkpSetDS ).Hint := rc_SetHintAttr( cTemp4, 'ds:', TUniDBEdit( LkpSetDS ).Hint );
                                       TUniDBEdit( LkpSetDS ).OnChangeValue := DynamicOnChangeValueForSetDS;
                                   end;
                                end;
                             end
                             else
                             begin
                                LkpSetDS := TUniDBFormattedNumberEdit( TComponent(pFrame).FindComponent( slLkpSetDS.Strings[ f ] ) );
                                if LkpSetDS <> nil then
                                begin
                                   TUniDBFormattedNumberEdit( LkpSetDS ).DataSource := LkpDataSource;
                                   TUniDBFormattedNumberEdit( LkpSetDS ).DataField  := Trim( Copy ( TUniDBFormattedNumberEdit( LkpSetDS ).Name, Pos( '_setds_', lowercase( TUniDBFormattedNumberEdit( LkpSetDS ).Name ) ) + 7, 100 ) );

                                   cTemp3 := TUniDBFormattedNumberEdit( LkpSetDS ).Name;
                                   cTemp3 := Copy( cTemp3, 1, Pos( '_', cTemp3 ) - 1 );
                                   cTemp4 := '';

                                   if TUniControl( TComponent(pFrame).FindComponent( cTemp3 )) <> nil then
                                   begin
                                       // Lkp: DS <> dsMaster ?
                                       cTemp4 := rc_GetHintAttr( 'ds:', TUniControl( TComponent(pFrame).FindComponent( cTemp3 )).Hint, true, false, true );

                                       if cTemp4 = '' then
                                          cTemp4 := 'dsMaster';

                                       if cTemp4 <> '' then
                                       begin
                                            TUniDBFormattedNumberEdit( LkpSetDS ).Hint := rc_SetHintAttr( cTemp4, 'ds:', TUniDBFormattedNumberEdit( LkpSetDS ).Hint );
                                            TUniDBFormattedNumberEdit( LkpSetDS ).OnChangeValue := DynamicOnChangeValueForSetDS;
                                       end;
                                   end;
                                end
                                else
                                begin
                                   LkpSetDS := TUniDBDateTimePicker( TComponent(pFrame).FindComponent( slLkpSetDS.Strings[ f ] ) );

                                   if LkpSetDS <> nil then
                                   begin
                                        TUniDBDateTimePicker( LkpSetDS ).DataSource := LkpDataSource;
                                        TUniDBDateTimePicker( LkpSetDS ).DataField  := Trim( Copy ( TUniDBDateTimePicker( LkpSetDS ).Name, Pos( '_setds_', lowercase( TUniDBDateTimePicker( LkpSetDS ).Name ) ) + 7, 100 ) );

                                        cTemp3 := TUniDBDateTimePicker( LkpSetDS ).Name;
                                        cTemp3 := Copy( cTemp3, 1, Pos( '_', cTemp3 ) - 1 );

                                        // Lkp: DS <> dsMaster ?
                                        cTemp4 := '';
                                        if TUniControl( TComponent(pFrame).FindComponent( cTemp3 )) <> nil then
                                        begin
                                           // Lkp: DS <> dsMaster ?
                                           cTemp4 := rc_GetHintAttr( 'ds:', TUniControl( TComponent(pFrame).FindComponent( cTemp3 )).Hint , true, false, true );

                                           if cTemp4 = '' then
                                              cTemp4 := 'dsMaster';

                                           if cTemp4 <> '' then
                                           begin
                                                TUniDBDateTimePicker( LkpSetDS ).Hint := rc_SetHintAttr( cTemp4, 'ds:', TUniDBDateTimePicker( LkpSetDS ).Hint );
                                                TUniDBDateTimePicker( LkpSetDS ).OnChangeValue := DynamicOnChangeValueForSetDS;
                                           end;
                                        end;
                                   end;
                                end;
                             end;
                          end;
                          slLkpSetDS.Free;
                       end;
                    end;
               end;

               if Pos( '__' , LkpTable ) > 0 then
                  LkpTable := Copy( LkpTable , 1, Pos( '__' , LkpTable ) -1 );
               //[PT]
               // Criar a QUERY padrão pra seleção do LOOKUP baseado nos padrões do RadCORE.
               // A Ideia é JÁ QUE O NOME DA QUERY é o NOME DA TABELA, e TODAS as tabelas do RadCORE tem CAMPO 'CODIGO'
               // ( mas será capturada a PK da tabela independente do nome )
               // o RadCORE vai criar dinamicamente e evitar um bom trabalho
               //
               // Pra maior parte dos CRUDs ganha-se tempo nao se preocupando em alterar o SQL da query
               // se estiver seguindo o padrão do RadCORE, claro.
               //
               //[EN]
               // Create the standard QUERY for LOOKUP selection based on RadCORE standards.
               // The idea is that the QUERY NAME is the TABLE NAME, and ALL RadCORE tables have a 'CODE' FIELD
               // (but the PK of the table will be captured regardless of the name)
               // RadCORE will create dynamically and avoid a good job
               //
               // For most CRUDs you save time by not worrying about changing the query's SQL
               // if you're following the RadCORE standard, of course.
               if LkpQuery = nil then
               begin
                   rc_ShowError( format( '<h2>LookUps Preparation failed!</h2><br>' +
                                         '<strong>MESSAGE</strong><br><hr>' + '<strong>LkpQuery: </strong>' + '%s ' + 'not declared!' + '<br><br>' +
                                         '<strong>TIP</strong><br><hr>Query with non-standard nomenclature %s' + '<br><br>' +
                                         mm.MSG_CONTACT_SUPPORT, [ '' , '( ' + LkpDBEdit.Name + ' ).' ] ) );

                   Abort;
               end
               else
               if Trim( LkpQuery.Sql.Text ) = '' then
               begin
                  LkpQuery.close;
                  // 6.0.0.0+lkp
                  LkpQuery.Sql.Text := rc_GetHintAttr( 'lkpquery:', LkpDBEdit.Hint );
                  if Trim( LkpQuery.Sql.Text ) = '' then
                  begin
                     if Pos( 'FIREBIRD' , mm.CONFIG_DATABASE ) > 0 then
                     begin
                        LkpTable     := Uppercase( LkpTable );
                        LkpJoinTable := Uppercase( LkpJoinTable );
                     end
                     else
                     begin
                        LkpTable     := Lowercase( LkpTable );
                        LkpJoinTable := Lowercase( LkpJoinTable );
                     end;
                     // 6.0.0.0
                     if cGetThisPK = '' then
                        cGetThisPK := rc_GetPrimaryKey( lowercase( lkpTable ) ); //7.5.0.3 lowercase
                     LkpQuery.Sql.Text := ' Select ' + LkpSelectFields + ' from ' + dm_rc.rc_DBSchema + LkpTable + ' tab ' + ' where tab.' + cGetThisPK + ' = :table_pk '; //6.1.0.0

                     if LkpJoinTable <> '' then
                     begin
                          LkpQuery.Sql.Text := ' Select tab.*,  tbJoin.' + LkpDBEdit.DataField +
                                               ' from ' + dm_rc.rc_DBSchema + LkpTable + ' tab ' + //6.1.0.0

                                               ' left join ' + dm_rc.rc_DBSchema + LkpJoinTable + ' tbJoin ' + //6.1.0.0
                                               ' on tbJoin.' + rc_GetPrimaryKey( lowercase( LkpJoinTable ) ) + ' = tab.' + LkpJoinField + //7.5.0.3 lowercase

                                               ' where tab.' + rc_GetPrimaryKey( lowercase( lkpTable ) ) + ' = :table_pk '; //7.5.0.3 lowercase
                     end;
                  end;
               end;
            end;
         end
         else
         if ( pComponent is TUniDateTimePicker ) or ( pComponent is TUniDBDateTimePicker )  then   // stand by....
         begin


         end;
    end;
    //[PT] preencher o SELECT do CRUD( q vai ser EDITADO/INSERIDO etc ) com os campos PRESENTES no FORM/FRAME atual
    //      caso tenha usado o CORINGA [[fields]], senao, assume o que vc escreveu manualmente
    //[PT] fill in the CRUD SELECT (which will be EDITED/INSERT etc.) with the fields PRESENT in the current FORM/FRAME
    //      if you used JOKER [[fields]], otherwise, assume what you wrote manually
    if( pSQLMaster <> nil ) and ( Pos( '[[fields]]' , pSQLMaster.Sql.Text ) > 0 ) then
    begin
        cFields := '';

        for I := 0 to TComponent(pFrame).ComponentCount - 1 do
        begin
           pComponent := TComponent(pFrame).Components[I];

           cTemp         := '';
           pDSSetDS_Orig := nil;
           LkpDataSource := nil;
           cSaveTo       := '';

           if not bOnlySearch then
           begin
              if ( Pos( '_setds', lowercase( TUniControl( pComponent ).Name ) ) > 0 ) then
              begin
                   cTemp3 := rc_GetHintAttr( 'ds:', TUniControl( pComponent ).Hint, true, false, true );

                   If cTemp3 <> '' then
                   begin
                        pDSSetDS_Orig := TDataSource( TComponent(pFrame).FindComponent( cTemp3 ));

                        if pDSSetDS_Orig <> nil then
                           if pDSSetDS_Orig = pDSMaster then
                           begin
                              cSaveTo := rc_GetHintAttr( 'saveto:', TUniControl( pComponent ).Hint );

                              if cSaveTo = '_default' then
                                 cSaveTo := TUniDBEdit( pComponent ).DataField;

                              if cSaveTo <> '' then
                              begin

                              end;
                           end;
                   end;
              end;
           end;

           if ( pComponent is TUniDBEdit ) then
           begin
              if TUniDBEdit( pComponent ).DataSource = nil then TUniDBEdit( pComponent ).DataSource := pDSMaster;

              if cSaveTo <> '' then
                 cTemp := cSaveTo
              else
              if TUniDBEdit( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBEdit( pComponent ).DataField;
           end
           else
           if ( pComponent is TUniDBDateTimePicker ) then
           begin
              if TUniDBDateTimePicker( pComponent ).DataSource = nil then TUniDBDateTimePicker( pComponent ).DataSource := pDSMaster;
              if cSaveTo <> '' then
                 cTemp := cSaveTo
              else
              if TUniDBDateTimePicker( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBDateTimePicker( pComponent ).DataField
           end
           else
           if ( pComponent is TUniDBNumberEdit ) then
           begin
              if TUniDBNumberEdit( pComponent ).DataSource = nil then TUniDBNumberEdit( pComponent ).DataSource := pDSMaster;
              if cSaveTo <> '' then
                 cTemp := cSaveTo
              else
              if TUniDBNumberEdit( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBNumberEdit( pComponent ).DataField
           end
           else
           if ( pComponent is TUniDBFormattedNumberEdit ) then
           begin
              if TUniDBFormattedNumberEdit( pComponent ).DataSource = nil then TUniDBFormattedNumberEdit( pComponent ).DataSource := pDSMaster;
              if cSaveTo <> '' then
                 cTemp := cSaveTo
              else
              if TUniDBFormattedNumberEdit( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBFormattedNumberEdit( pComponent ).DataField
           end
           else
           if ( pComponent is TUniDBImage ) then
           begin
              if TUniDBImage( pComponent ).DataSource = nil then TUniDBImage( pComponent ).DataSource := pDSMaster;
              if cSaveTo <> '' then
                 cTemp := cSaveTo
              else
              if TUniDBImage( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBImage( pComponent ).DataField
           end
           else
           if ( pComponent is TUniDBText ) then
           begin
              if TUniDBText( pComponent ).DataSource = nil then TUniDBText( pComponent ).DataSource := pDSMaster;
              if cSaveTo <> '' then
                 cTemp := cSaveTo
              else
              if TUniDBText( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBText( pComponent ).DataField
           end
           else
           if ( pComponent is TUniDBCheckBox ) then
           begin
              if TUniDBCheckBox( pComponent ).DataSource = nil then TUniDBCheckBox( pComponent ).DataSource := pDSMaster;
              if cSaveTo <> '' then
                 cTemp := cSaveTo
              else
              if TUniDBCheckBox( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBCheckBox( pComponent ).DataField
           end
           else
           if ( pComponent is TUniDBRadioGroup ) then
           begin
              if TUniDBRadioGroup( pComponent ).DataSource = nil then TUniDBRadioGroup( pComponent ).DataSource := pDSMaster;
              if cSaveTo <> '' then
                 cTemp := cSaveTo
              else
              if TUniDBRadioGroup( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBRadioGroup( pComponent ).DataField
           end
           else
           if ( pComponent is TUniDBHTMLMemo ) then
           begin
              if TUniDBHTMLMemo( pComponent ).DataSource = nil then TUniDBHTMLMemo( pComponent ).DataSource := pDSMaster;
              if cSaveTo <> '' then
                 cTemp := cSaveTo
              else
              if TUniDBHTMLMemo( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBHTMLMemo( pComponent ).DataField
           end
           //7.3.0.0 unidbtagfield
           else
           if ( pComponent is TUniDBTagField ) then
           begin
              if TUniDBTagField( pComponent ).DataSource = nil then TUniDBTagField( pComponent ).DataSource := pDSMaster;
              if cSaveTo <> '' then
                 cTemp := cSaveTo
              else
              if TUniDBTagField( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBTagField( pComponent ).DataField
           end
           else
           if ( pComponent is TUniDBMemo ) then
           begin
              if TUniDBMemo( pComponent ).DataSource = nil then TUniDBMemo( pComponent ).DataSource := pDSMaster;
              if cSaveTo <> '' then
                 cTemp := cSaveTo
              else
              if TUniDBMemo( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBMemo( pComponent ).DataField
           end
           else
           if ( pComponent is TUniDBComboBox ) then
           begin
              if TUniDBComboBox( pComponent ).DataSource = nil then TUniDBComboBox( pComponent ).DataSource := pDSMaster;
              if cSaveTo <> '' then
                 cTemp := cSaveTo
              else
              if TUniDBComboBox( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBComboBox( pComponent ).DataField;

              if ( Pos( 'cbbx:' , TUniDBComboBox( pComponent ).Hint ) = 0 ) and
                 ( Pos( '|' , TUniDBComboBox( pComponent ).Items.Text ) > 0 ) then
              begin
                   cTemp2 := '';
                   cTemp3 := '';
                   cTemp4 := '';
                   cTmp   := '';
                   cTmp2  := '';
                   for f := 0 to TUniDBComboBox( pComponent ).Count - 1 do
                   begin
                       cTemp2 := TUniDBComboBox( pComponent ).Items[f];
                       cTemp3 := Copy( cTemp2, 1, Pos( '|', cTemp2 ) - 1 ) ;
                       cTemp4 := Copy( cTemp2, Pos( '|', cTemp2 ) + 1, 10 ) ;
                       TUniDBComboBox( pComponent ).Items.Text := StringReplace( TUniDBComboBox( pComponent ).Items.Text, cTemp2, cTemp3 , [rfReplaceAll]);
                       cTmp  := cTmp + cTemp4 ;
                       cTmp2 := cTmp2+ cTemp3 + '=' + cTemp4 ;
                       if f+1 <= TUniDBComboBox( pComponent ).Count - 1 then
                       begin
                          cTmp  := cTmp  + ',' ;
                          cTmp2 := cTmp2 + ',' ;
                       end;
                   end;
                   if cTmp <> '' then
                   begin
                      TUniDBComboBox( pComponent ).Hint := rc_SetHintAttr( '{' + cTmp + '}', 'cbbx:', TUniDBComboBox( pComponent ).Hint, true );
                      TUniDBComboBox( pComponent ).Hint := rc_SetHintAttr( cTmp2 , 'cbbxdata:', TUniDBComboBox( pComponent ).Hint, true );
                   end;
              end;
           end
           else
           if ( pComponent is TUniDBLookupComboBox ) then
           begin
              if TUniDBLookupComboBox( pComponent ).DataSource = nil then TUniDBLookupComboBox( pComponent ).DataSource := pDSMaster;
              if cSaveTo <> '' then
                 cTemp := cSaveTo
              else
              if TUniDBLookupComboBox( pComponent ).DataSource = pDSMaster then
                 cTemp := TUniDBLookupComboBox( pComponent ).DataField;
           end
           else  // bs_render
           if ( pComponent is TUniLabel ) and
              ( ( Pos( 'bschk' , lowercase( TUniLabel( pComponent ).Hint ) ) > 0 ) or //7.5.0.3 lowercase
                ( Pos( 'bsswt' , lowercase( TUniLabel( pComponent ).Hint ) ) > 0 ) or //7.5.0.3 lowercase
                ( Pos( 'bsrgp' , lowercase( TUniLabel( pComponent ).Hint ) ) > 0 ) or //7.5.0.3 lowercase
                ( Copy( TUniLabel( pComponent ).Name , 1, 2 ) = 'bs' ) ) and
              ( ( Pos( '__' , TUniLabel( pComponent ).Hint ) > 0 ) or
                ( Pos( 'field:' , TUniLabel( pComponent ).Hint ) > 0 ) or
                ( Pos( '_db' , TUniLabel( pComponent ).Name ) > 1 ) ) then
           begin
               if ( Copy( TUniLabel( pComponent ).Name , 1, 2 ) = 'bs' ) and
                  ( Pos( '_db' , TUniLabel( pComponent ).Name ) > 0 ) then
               begin
                    if ( ( Pos( '[ds:' , TUniLabel( pComponent ).Hint ) > 0 ) or ( Pos( ' ds:' , TUniLabel( pComponent ).Hint ) > 0 ) ) and
                       ( Pos( ' ds:dsmaster' , TUniLabel( pComponent ).Hint ) = 0 ) then
                         cTemp := ''
                    else
                    begin
                      cTemp := rc_GetParamFromRGP( TUniLabel( pComponent ).Name, rptFIELD );
                    end;
               end
               else
               begin
                    cTemp := TUniLabel( pComponent ).Hint;

                    if Pos( 'field:' , TUniLabel( pComponent ).Hint ) > 0 then
                    begin
                       if ( Pos( ' ds:' , TUniLabel( pComponent ).Hint ) > 0 ) and
                          ( Pos( ' ds:dsmaster' , TUniLabel( pComponent ).Hint ) = 0 ) then
                            cTemp := ''
                       else
                       begin
                         // 6.0.0.0
                         cTemp := rc_GetHintAttr( 'field:', cTemp, true, false, true );
                       end;
                    end
                    else
                       cTemp := Copy( cTemp, Pos( '__' , cTemp ) + 2 , 100 );
               end;
           end;
           // quando o banco é FIREBIRD e o campo inicia com um número( Ex: 5_CARGO )
           // o FIREBIRD só aceita se estiver entre aspas e em maiúsculo.
           // Não sei se ocorre com outro SGBD
           //
           // when the bank is FIREBIRD and the field starts with a number (Ex: 5_CARGO)
           // FIREBIRD only accepts if it is enclosed in quotes and in capital letters.
           // I don't know if it occurs with another DBMS
           if ( cTemp <> '' ) and
              ( ( Pos( 'tab."' + uppercase( cTemp ) + '" ,', cFields ) = 0 ) and ( Pos( 'tab.' + lowercase( cTemp ) + ' ,', cFields ) = 0 ) ) then
           begin
              if ( Pos( 'FIREBIRD' , mm.CONFIG_DATABASE ) > 0 ) AND
                 ( ReturnNumbers( copy( cTemp, 1, 1) ) <> '' ) then
                 cFields := cFields + 'tab."' + uppercase( cTemp ) + '" ,'
              else
                 cFields := cFields + 'tab.' + lowercase( cTemp ) + ' ,';
           end;
        end;
        // ed_CodMASTER: frmBaseCRUDDetail
        if TUniEdit( TComponent(pFrame).FindComponent( 'ed_CodMaster' )) <> nil then
        begin
            cTemp := rc_GetHintAttr( '_codmaster:', TUniEdit( TComponent(pFrame).FindComponent( 'ed_CodMaster' )).Hint );//cTemp := TUniEdit( TComponent(pFrame).FindComponent( 'ed_CodMaster' )).Hint;//8.0.0.0
             // feedback by SAMET
            if ( cTemp <> '' ) and ( Pos( 'tab.' + lowercase( cTemp ) + ' ,', cFields ) = 0 ) then
               cFields := cFields + 'tab.' + lowercase( cTemp ) + ' ,';
        end;

        AllPKs := '';

        memPK.Filtered := false;
        memPK.Filter   := 'table=' + quotedStr(lowercase(trim( TUniEdit( TComponent(pFrame).FindComponent( 'ed_table_itemsel' )).text )) );
        memPK.Filtered := true;
        memPK.First;

        cSql := lowercase( sqlSearchMaster.sql.Text );
        cSql :=  Copy( cSql, 1, Pos( ' from ' , cSql ) );

        while not memPK.eof do
        begin
             memPK.tag := 0;
             cPk := trim(lowercase( memPK.FieldByName( 'pk' ).AsString ));
             //[PT] se alguma das PK´s ja estiver presente na query do on create do form( preenchida manualmente ) não adicionar...
             //[EN] if any of the PK's are already present in the form's on create query (completed manually) do not add...
             begin
                if ( Pos( 'tab.' + cPk + ' ,', cFields ) = 0 )then
                begin
                   AllPKs := AllPKs + 'tab.' + cPk + ' ,';
                end;
             end;
             memPK.Next;
        end;
        memPK.Filtered := false;

        if AllPKs <> '' then
        begin
             cFields := cFields + AllPKs;
        end;

        if cFields <> '' then
           cFields := Copy( cFields, 1, Length( cFields ) - 1 );

        pSQLMaster.Sql.Text := StringReplace( pSQLMaster.Sql.Text , '[[fields]]' , cFields, [rfReplaceAll] );
    end;
    // aplicar layout nos possiveis botoes criados no lookup
    // apply layout to possible buttons created in the lookup
    rc_RenderControls(pFrame);
end;
// 6.0.0.0
procedure tdm_rc.rc_LookUpUpdateData( pFrame: TObject; pLkp : TUniControl; pClearsearchonly : boolean; pBtnClearLkpLite2 : boolean );
var
   LkpDBCod,
   LkpDBEdit : TUniDBEdit;

   pDM : TDataModule;

   pSQLMaster,
   pSQLDetail,
   LkpQuery : TFDQuery;

   LkpBtn : TUniSpeedButton;

   pDSDetail,
   LkpDataSource : TDataSource;

   cTemp, cTemp2, cTemp3, cTemp4,
   LkpName, cPkType,
   LkpName_DataField_CodID,
   LkpName_DataField_Concat,
   LkpTable : string;
   bCondition,//8.4.0.1 lookup str
   biLkpPkValueCondition,
   bsearchonly : boolean;
   iLkpPkValue : Variant; //int64; // ajuste pra troca do tag por hint ( pk bigint or string ) 6.0.0.0
   iPos,
   I : integer;
   oObjTemp : TUniControl;
begin
  inherited;

    pSQLMaster := TFDQuery( TComponent(pFrame).FindComponent( 'sqlMaster' ) );
    pDM := nil;
    // ajustar cores de campos lookup e eventos pra pesquisa
    for I := 0 to TComponent(pFrame).ComponentCount - 1 do
    begin

      oObjTemp := TUniControl( TComponent(pFrame).Components[I] );
      // to clean "valid:" red borders
      // para limpar as bordas vermelhas do "valid:"
      if ( oObjTemp is TUniDBEdit ) and ( lowercase( Copy( oObjTemp.Name , 1, 5 ) ) = 'edlkp' ) then
      begin
         if Pos( 'invalidate:true', oObjTemp.Hint ) > 0 then
         begin
            rc_RemoveCssClass( oObjTemp, 'rc-invalid' );

            if ( pos( 'true imsg:', oObjTemp.hint ) > 0 ) then
            begin
               oObjTemp := TUniLabel( oObjTemp.FindComponent('rcLabel__inv_lab_' + oObjTemp.Name) );
               if ( oObjTemp <> nil ) then
               begin
                  oObjTemp.Visible := False;
               end;
            end;
         end;
      end;

      //cbx-fill:ufs descricao [where]
      //cbx-fill:ufs codigo+descricao save:descricao
      (*
        [[
        cbx-fill:ufs codigo;descricao|
        cbx-save:codigo<int>
        ]]
      *)
      if ( TComponent(pFrame).Components[I] is TUniComboBox ) or
         ( TComponent(pFrame).Components[I] is TUniDBComboBox ) then
      begin
         cTemp := rc_GetHintAttr( 'cbx-fill:', TUniComboBox( TComponent(pFrame).Components[I] ).Hint );
         if cTemp <> '' then
         begin
              if Pos( 'folder:', cTemp ) = 0 then
              begin

                 cTemp2 := trim( Copy( cTemp, 1, Pos( ' ', cTemp ) ) );
                 cTemp3 := trim( Copy( cTemp, Pos( ' ', cTemp ) + 1 ) ) + ' ';
                 cTemp4 := ' ' + trim( Copy( cTemp3, Pos( ' ', cTemp3 ) + 1 ) );
                 cTemp3 := Copy( cTemp3, 1, pos( ' ', cTemp3 ) - 1 );
                 cTemp4 := StringReplace( cTemp4, '|', '', [rfReplaceAll] ) ;
                 cTemp4 := StringReplace( cTemp4, ']', '', [rfReplaceAll] ) ;

                 if cTemp2 = '' then
                 begin
                    rc_ShowError( '<h2>cbx-fill Failed !</h2><br>' +
                                  '<strong>MESSAGE</strong><br><hr>' +
                                  '<strong>' + TComponent(pFrame).Components[I].Name + '</strong>' +
                                  ' "table" undeclared or with invalid nomenclature !' + '<br><br>' +
                                  mm.MSG_CONTACT_SUPPORT);
                    Abort;
                 end
                 else
                 if cTemp3 = '' then
                 begin
                    rc_ShowError( '<h2>cbx-fill Failed !</h2><br>' +
                                  '<strong>MESSAGE</strong><br><hr>' +
                                  '<strong>' + TComponent(pFrame).Components[I].Name + '</strong>' +
                                  ' "field" undeclared or with invalid nomenclature !' + '<br><br>' +
                                  mm.MSG_CONTACT_SUPPORT);
                    Abort;
                 end;
                 //8.4.0.3
                 dm_rc.rc_FillComboBox( TUniComboBox( TComponent(pFrame).Components[I] ) , cTemp2, cTemp3, cTemp4 );
              end
              else
              begin
                 cTemp4 := '';
                 cTemp := Copy( cTemp, Pos( 'folder:', cTemp ) + 7 ) + ' ';
                 if pos( 'filter:' , cTemp ) > 0 then
                 begin
                    cTemp4 := Copy( cTemp, Pos( 'filter:', cTemp ) + 7 );
                    cTemp4 := Trim( cTemp4 ) ;
                 end;
                 cTemp := Copy( cTemp, 1, Pos( ' ', cTemp ) -1 );
                 //8.4.0.3
                 dm_rc.rc_FillComboBox( TUniComboBox( TComponent(pFrame).Components[I] ) , cTemp2, cTemp3, cTemp4 );
              end;

         end;
      end;
      //8.4.0.0 thanks for bugtracker Cassia
      if ( TComponent(pFrame).Components[I] is TUniDBComboBox )  then
      begin
           if ( TUniControl( TComponent(pFrame).Components[I]  ).HasParent ) and
              ( TUniControl( TComponent(pFrame).Components[I]  ).Parent.ClassName <> 'TUniHiddenPanel' ) then
           begin
             TUniDBComboBox( TComponent(pFrame).Components[I] ).AutoEdit := false;
              // feedback by VITOR NATAN
             if TUniDBComboBox( TComponent(pFrame).Components[I]  ).DataSource <> nil then
                TUniDBComboBox( TComponent(pFrame).Components[I]  ).ReadOnly :=
                  not ( TUniDBComboBox( TComponent(pFrame).Components[I]  ).DataSource.State in [ dsEdit, dsInsert] );
           end;
      end;
      //8.4.0.0 thanks for bugtracker Cassia
      if ( TComponent(pFrame).Components[I] is TUniDBLookupComboBox )  then
      begin
           if ( TUniControl( TComponent(pFrame).Components[I]  ).HasParent ) and
              ( TUniControl( TComponent(pFrame).Components[I]  ).Parent.ClassName <> 'TUniHiddenPanel' ) then
           begin
             TUniDBLookupComboBox( TComponent(pFrame).Components[I]  ).AutoEdit := false;
              // feedback by VITOR NATAN
             if TUniDBComboBox( TComponent(pFrame).Components[I]  ).DataSource <> nil then
                TUniDBLookupComboBox( TComponent(pFrame).Components[I]  ).ReadOnly :=
                   not ( TUniDBLookupComboBox( TComponent(pFrame).Components[I]  ).DataSource.State in [ dsEdit, dsInsert] );
           end;
      end;

      if TComponent(pFrame).Components[I] is TUniDBEdit then
      begin
         if ( lowercase( Copy( TUniDBEdit( TComponent(pFrame).Components[I] ).Name , 1, 5 ) ) = 'edlkp' ) and
            ( Pos( '_setds' , lowercase( TUniDBEdit( TComponent(pFrame).Components[I] ).Name ) ) = 0 ) and
            ( Pos( '_pesqextra' , lowercase( TUniDBEdit( TComponent(pFrame).Components[I] ).Name ) ) = 0 ) and
            ( Pos( '_codid' , lowercase( TUniDBEdit( TComponent(pFrame).Components[I] ).Name ) ) = 0 )then
         begin
            // nomenclatura padrao para capturar os dados necessários
            // para otimizar a pesquisa lookup
            //
            // Todo lookUp precisa ter um KEYFIELD( capturado dinamicamente sua PK[ integer] ) e LISTFIELD( padrao DESCRICAO )
            // uma QUERY e um DATASOURCE ( serão criados dinamicamente ) pra vincular a PESQUISA e suas respectivas informaçõese
            // poderem ser acessiveis para alguma parte do projeto
            if pLkp = nil then
                LkpDBEdit := TUniDBEdit( TComponent(pFrame).Components[I] )
            else
                LkpDBEdit := TUniDBEdit( pLkp );

            LkpName   := LkpDBEdit.Name;
            cTemp     := LkpDBEdit.DataField;
            {$IFDEF DEBUG}
            If ( LkpName='edLkpCIDADES' ) or ( LkpName='edLkpPRODUTOS' )  then
            begin
               LkpName := LkpName;
            end;
            {$ENDIF}
            // Tem CODID dinamico ?
            LkpName_DataField_CodID := '';

            LkpTable  := lowercase( Copy( LkpName, 6, 50 ) );
            LkpDBCod  := TUniDBEdit( TComponent(pFrame).FindComponent( 'edLkp' + lkpTable + '_CodID' ) );
            LkpQuery  := TFDQuery( TComponent(pFrame).FindComponent( lkpTable ) );

            // se nao encontou componente fisico, foi criada dinamicamente
            if LkpQuery = nil then
               LkpQuery  := TFDQuery( TComponent(pFrame).FindComponent( 'LKP_' + lkpTable ) );

            if LkpDBCod = nil then
            begin
               rc_ShowError( '<h2>LookUps Update Failed !</h2><br>' +
                             '<strong>MESSAGE</strong><br><hr>' + '<strong>LkpDBCod: </strong>' + '"edLkp' + lkpTable + '_CodID" undeclared or with invalid nomenclature !' + '<br><br>' +
                             mm.MSG_CONTACT_SUPPORT);
               Abort;
            end;

            LkpBtn := TUniSpeedButton( TComponent(pFrame).FindComponent( StringReplace( lowercase(LkpDBEdit.Name), 'edlkp' , 'btnlkp' , [rfReplaceAll] ) ) );

            if LkpBtn = nil then
            begin
               rc_ShowError( '<h2>LookUps Creation Failure !</h2><br>' +
                             '<strong>MESSAGE</strong><br><hr>' +
                             '<strong>' + '"btnLkp' + lkpTable + '"</strong> undeclared or with invalid nomenclature!' + '<br><br>' +
                             mm.MSG_CONTACT_SUPPORT);
               Abort;
            end;

            try
               bsearchonly := Pos( 'searchonly', LkpDBEdit.Hint ) > 0 ;
               // se nao tiver declarado o DATASOURCE, o RADCORE procura pelo PADRAO e ASSOCIA dinamicamente
               LkpDataSource := TDataSource( TComponent(pFrame).FindComponent( 'dsLkp' + lkpTable ) );
               // se nao criou em tempo de projeto, foi criado pelo proprio RADCORE
               if LkpDataSource = nil then
                  LkpDBEdit.DataSource := TDataSource( TComponent(pFrame).FindComponent( 'dsLkp_' + lkpTable ) )
               else
                  LkpDBEdit.DataSource := TDataSource( TComponent(pFrame).FindComponent( 'dsLkp' + lkpTable ) );

               TFDQuery( LkpDBEdit.DataSource.DataSet ).close;
               // sqlMaster or Detail ?
               pDSDetail   := nil;
               pSQLDetail  := nil;
               // 6.0.0.0
               cTemp := rc_GetHintAttr( 'lkp:' , LkpDBEdit.Hint ) ;
               cTemp4      := ''; // 6.0.0.0
               if Pos( ' ds:', cTemp ) > 0 then
               begin
                  // 6.0.0.0
                  cTemp := rc_GetHintAttr( 'ds:', cTemp, true, false, true );

                  If Pos( '.', cTemp ) > 0 then
                  begin
                      pDM := nil;
                      pDM := rc_FindDataModule( Copy( cTemp, 1, pos( '.', cTemp ) - 1 ) );
                      cTemp := Copy( cTemp, pos( '.', cTemp ) + 1 );
                  end;
                  if pDM <> nil then
                     pDSDetail  := TDataSource( pDM.FindComponent( cTemp ) )
                  else
                     pDSDetail  := TDataSource( TComponent(pFrame).FindComponent( cTemp ) );
                  // 6.0.0.0
                  if pDSDetail <> nil then
                  begin
                     if pDM <> nil then
                        pSQLDetail  := TFDQuery( pDM.FindComponent( pDSDetail.DataSet.Name ) )
                     else
                        pSQLDetail  := TFDQuery( TComponent(pFrame).FindComponent( pDSDetail.DataSet.Name ) );
                  end
                  else
                  if ( cTemp <> '' ) then
                  begin
                      rc_ShowError( '<h2>LookUps Update Failed !</h2><br>' +
                                    '<strong>MESSAGE</strong><br><hr>' +
                                    '<strong>Msg: </strong>Datasource "' + cTemp +  '" not found!.<br><br>' +
                                    '<strong>LkpDBEdit: </strong>' + LkpDBEdit.name  + '<br><br>' +
                                    mm.MSG_CONTACT_SUPPORT);
                  end;
               end;
               // 6.0.0.0 onlysearch / lite2
               cPkType := Copy( LkpDBEdit.Name , 6 ) + '__';
               cPkType := trim(lowercase( Copy( cPkType , 1, Pos( '__', cPkType ) - 1 ) ) );
               cPkType := rc_GetPrimaryKey( cPkType );
               cPkType := trim(lowercase( memPK.FieldByName( 'type' ).AsString ));
               if ( bsearchonly ) and ( pClearsearchonly ) then
               begin
                  // ajuste pra troca do tag por hint ( pk bigint or string ) 6.0.0.0
                  LkpDBEdit.Tag := -1234567;
                  LkpDBEdit.Hint := rc_AddHintAttr( '|lkp-tag:' + '-1234567' , LkpDBEdit.Hint, True );
                  if ( ( Pos( ' !!' ,  LkpDBEdit.Hint ) > 0 ) and ( LkpDBEdit.Text <> '' ) ) or
                     ( ( Pos( ' readonly' ,  LkpDBEdit.Hint ) > 0 ) ) then
                     LkpDBEdit.ReadOnly := true
                  else
                     LkpDBEdit.ReadOnly := false;
                  LkpDBEdit.Text := '';
                  if LkpDBCod <> nil then
                     LkpDBCod.Text := '';
               end
               else
               if pBtnClearLkpLite2 then
               begin
                  // ajuste pra troca do tag por hint ( pk bigint or string ) 6.0.0.0
                  LkpDBEdit.Tag := -1234567;
                  LkpDBEdit.Hint := rc_AddHintAttr( '|lkp-tag:' + '-1234567' , LkpDBEdit.Hint, True );
                  if ( ( Pos( ' !!' ,  LkpDBEdit.Hint ) > 0 ) and ( LkpDBEdit.Text <> '' ) ) or
                     ( ( Pos( ' readonly' ,  LkpDBEdit.Hint ) > 0 ) ) then
                     LkpDBEdit.ReadOnly := true
                  else
                     LkpDBEdit.ReadOnly := false;
                  LkpDBEdit.Text := '';
                  if LkpDBCod <> nil then
                     LkpDBCod.Text := '';
               end;
               if ( pSQLDetail = nil ) then
               begin
                  if ( not bsearchonly ) and ( not pClearsearchonly )then
                  begin
                     if ( DataTypeIsDateTime( pSQLMaster.FieldByName( lkpDBCod.DataField ).DataType ) ) then
                     begin
                        iLkpPkValue := pSQLMaster.FieldByName( LkpDBCod.DataField ).AsDateTime ;
                        If Pos( 'FIREBIRD' , mm.CONFIG_DATABASE ) > 0 then
                           biLkpPkValueCondition := StrToDateTimeDef( iLkpPkValue, StrToDateTime( '30/12/1899 00:00:00' ) ) <= StrToDateTime( '30/12/1899 00:00:00' )
                        else
                           biLkpPkValueCondition := StrToDateTimeDef( iLkpPkValue, StrToDateTime( '30/12/1899 00:00:00' ) ) <= StrToDateTime( '30/12/1899 00:00:00' ) ;
                     end
                     else
                     if ( DataTypeIsString( pSQLMaster.FieldByName( lkpDBCod.DataField ).DataType ) ) then
                     begin
                        TFDQuery( LkpDBEdit.DataSource.DataSet ).FormatOptions.StrsTrim2Len := true;
                        iLkpPkValue := pSQLMaster.FieldByName( LkpDBCod.DataField ).AsString ;
                        biLkpPkValueCondition := ( iLkpPkValue = '' ) or ( iLkpPkValue = '-1234567' );
                     end
                     else
                     if ( pSQLMaster.FieldByName( LkpDBCod.DataField ).DataType = ftLargeint ) then
                     begin
                        iLkpPkValue := pSQLMaster.FieldByName( LkpDBCod.DataField ).AsLargeInt;
                        biLkpPkValueCondition := iLkpPkValue < 0;
                     end
                     else
                     begin
                        iLkpPkValue := pSQLMaster.FieldByName( LkpDBCod.DataField ).AsInteger;
                        biLkpPkValueCondition := iLkpPkValue < 0;
                     end;
                  end
                  else
                  begin
                     if ( DataTypeStrIsString( cPkType ) ) then
                     begin
                        iLkpPkValue := Trim( rc_GetHintAttr( 'lkp-tag:', LkpDBEdit.Hint ) );
                        biLkpPkValueCondition := ( iLkpPkValue = '' ) or ( iLkpPkValue = '-1234567' );
                     end
                     else
                     if ( DataTypeStrIsDateTime( cPkType ) ) then
                     begin
                        iLkpPkValue := rc_GetHintAttr( 'lkp-tag:', LkpDBEdit.Hint ) ;
                        mm.varD_DtIni := StrToDateTimeDef( iLkpPkValue, now );
                        iLkpPkValue := StrToDateTimeDef( iLkpPkValue, 0 );
                        biLkpPkValueCondition := StrToDateTimeDef( iLkpPkValue, 0 ) <= StrToDateTime( '30/12/1899' );
                     end
                     else
                     if ( DataTypeStrIsBigInt( cPkType ) ) then
                     begin
                        iLkpPkValue := StrToInt64Def( rc_GetHintAttr( 'lkp-tag:', LkpDBEdit.Hint ) , 0 );
                        biLkpPkValueCondition := iLkpPkValue < 0;
                     end
                     else
                     begin
                        iLkpPkValue := StrToIntDef( rc_GetHintAttr( 'lkp-tag:', LkpDBEdit.Hint ) , 0 );
                        biLkpPkValueCondition := iLkpPkValue < 0;
                     end;
                  end;
                  if ( DataTypeStrIsString( cPkType ) ) then
                  begin
                     TFDQuery( LkpDBEdit.DataSource.DataSet ).FormatOptions.StrsTrim2Len := true;
                     TFDQuery( LkpDBEdit.DataSource.DataSet ).ParamByName( 'table_pk' ).Value := iLkpPkValue ;
                  end
                  else
                  if ( DataTypeStrIsDateTime( cPkType ) ) then
                  begin
                     TFDQuery( LkpDBEdit.DataSource.DataSet ).ParamByName( 'table_pk' ).AsDateTime := StrToDateTimeDef( iLkpPkValue, 0 );
                  end
                  else
                  if ( DataTypeStrIsBigInt( cPkType ) ) then
                     TFDQuery( LkpDBEdit.DataSource.DataSet ).ParamByName( 'table_pk' ).AsLargeInt := iLkpPkValue
                  else
                     TFDQuery( LkpDBEdit.DataSource.DataSet ).ParamByName( 'table_pk' ).AsInteger := iLkpPkValue;
                  // 6.0.0.0 - aplicar WHERE/AND quando há "getpk:"
                  //8.4.0.1 lookup str
                  if Pos( 'getpk:', LkpDBEdit.Hint ) > 0 then
                  begin
                     cTemp4 := TFDQuery( LkpDBEdit.DataSource.DataSet ).SQL.Text;
                     //7.1.0.0
                     if mm.varC_Where <> '' then
                     begin
                         iPos := Pos( ' = :table_pk  AND', cTemp4 );
                         if iPos > 0 then
                            TFDQuery( LkpDBEdit.DataSource.DataSet ).SQL.Text := Copy( cTemp4, 1, iPos + 12 );
                         TFDQuery( LkpDBEdit.DataSource.DataSet ).SQL.Text := TFDQuery( LkpDBEdit.DataSource.DataSet ).SQL.Text + ' AND 33=33 AND ' + Copy( Trim( mm.varC_Where ), 6 );
                         iPos := -1;
                     end
                     else
                     begin
                        iPos := Pos ( 'AND 33=33 AND', TFDQuery( LkpDBEdit.DataSource.DataSet ).SQL.Text );
                        if iPos > 0 then
                           TFDQuery( LkpDBEdit.DataSource.DataSet ).SQL.Text :=
                               Trim( Copy( TFDQuery( LkpDBEdit.DataSource.DataSet ).SQL.Text, 1, iPos - 1 ) ) + ' ';

                        iPos := -1;
                     end;
                  end;
                  dm_rc.rc_OpenQuery( TFDQuery( LkpDBEdit.DataSource.DataSet ) );
                  // 6.0.0.0 onlysearch / lkp-tag
                  if biLkpPkValueCondition then
                  begin
                      // 6.0.0.0 onlysearch / lite2
                      if ( not bsearchonly ) and ( not pClearsearchonly )then
                      begin
                         if ( pSQLMaster.state in [ dsEdit, dsInsert] ) then
                            pSQLMaster.FieldByName( LkpDBCod.DataField ).Clear;
                      end
                      else
                      begin
                         // ajuste pra troca do tag por hint ( pk bigint or string ) 6.0.0.0
                         LkpDBEdit.Tag := -1234567;
                         LkpDBEdit.Hint := rc_AddHintAttr( '|lkp-tag:' + '-1234567' , LkpDBEdit.Hint, True );
                         LkpDBEdit.Text := '';
                      end;
                  end
                  else
                  begin
                      // getsearchfield
                      cTemp := rc_GetHintAttr( 'getsearchfield:', LkpDBEdit.Hint );
                      if ( cTemp <> '' ) then
                      begin
                           iPos := Pos( '+', cTemp);
                           if iPos > 0 then
                           begin
                              LkpName_DataField_Concat := Trim( Copy( cTemp, iPos + 1, 100 ) );
                              cTemp                    := Trim( Copy( cTemp, 1, iPos - 1 ) );
                              LkpDBEdit.Text :=
                                  VarToStrDef( TFDQuery( LkpDBEdit.DataSource.DataSet ).FieldByName( cTemp ).Value, '' ) + ' ' +
                                  VarToStrDef( TFDQuery( LkpDBEdit.DataSource.DataSet ).FieldByName( LkpName_DataField_Concat ).Value, '' );                           end
                           else
                           begin
                              LkpName_DataField_Concat := cTemp;
                              LkpDBEdit.Text :=
                                   VarToStrDef( TFDQuery( LkpDBEdit.DataSource.DataSet ).FieldByName( LkpName_DataField_Concat ).Value, '' );
                           end;
                      end
                      else

                      // concatenar campos
                      if ( strTokenCount( LkpDBEdit.Hint , '+' ) > 1 ) then
                      begin
                           iPos := strTokenCount( LkpDBEdit.Hint , '+' );
                           LkpName_DataField_Concat := LkpDBEdit.Hint;
                           // remover parcial se for o "+" para botão ADD
                           // remove partial if it is the "+" for ADD button
                           iPos := Pos( ' +', LkpName_DataField_Concat );
                           if iPos > 0 then
                           begin
                              LkpName_DataField_Concat := Trim( Copy( LkpName_DataField_Concat, 1, iPos-1 ) ) + ' ';
                           end;
                           iPos := Pos( '+', LkpName_DataField_Concat );
                           if iPos > 0 then
                           begin
                              LkpName_DataField_Concat := Trim( Copy( LkpName_DataField_Concat, iPos + 1, 100 ) );
                              LkpName_DataField_Concat := Trim( Copy( LkpName_DataField_Concat, 1, Pos( ' ', LkpName_DataField_Concat ) ) );

                              LkpDBEdit.Text :=
                                  VarToStrDef( TFDQuery( LkpDBEdit.DataSource.DataSet ).FieldByName( LkpDBEdit.DataField ).Value, '' ) + ' ' +
                                  VarToStrDef( TFDQuery( LkpDBEdit.DataSource.DataSet ).FieldByName( LkpName_DataField_Concat ).Value, '' );
                           end;
                      end;

                      if Pos( 'rcblock', lowercase( LkpDBEdit.Parent.Name ) ) = 0 then
                         LkpDBEdit.SetFocus;
                  end;
               end
               else
               begin
                  if (pBtnClearLkpLite2 )then
                  begin
                     iLkpPkValue := rc_GetHintAttr( 'lkp-tag:', LkpDBEdit.Hint );
                  end
                  else
                  begin
                     if ( DataTypeIsDateTime( pSQLDetail.FieldByName( lkpDBCod.DataField ).DataType ) ) or
                        ( DataTypeIsString( pSQLDetail.FieldByName( lkpDBCod.DataField ).DataType ) ) then
                        iLkpPkValue := rc_GetHintAttr( 'lkp-tag:', LkpDBEdit.Hint )
                     else
                     if ( pSQLDetail.FieldByName( LkpDBCod.DataField ).DataType = ftLargeint ) then
                        iLkpPkValue := StrToInt64Def( rc_GetHintAttr( 'lkp-tag:', LkpDBEdit.Hint ) , 0 )
                     else
                     if ( pSQLDetail.FieldByName( LkpDBCod.DataField ).DataType = ftInteger ) then
                        iLkpPkValue := StrToIntDef( rc_GetHintAttr( 'lkp-tag:', LkpDBEdit.Hint ) , 0 )
                  end;
                  if ( DataTypeStrIsString( cPkType ) ) then
                  begin
                     TFDQuery( LkpDBEdit.DataSource.DataSet ).FormatOptions.StrsTrim2Len := true;
                     TFDQuery( LkpDBEdit.DataSource.DataSet ).ParamByName( 'table_pk' ).Value := iLkpPkValue;
                  end
                  else
                  if ( DataTypeStrIsDateTime( cPkType ) ) then
                  begin
                     TFDQuery( LkpDBEdit.DataSource.DataSet ).ParamByName( 'table_pk' ).AsDateTime := StrToDateTimeDef( iLkpPkValue, StrToDateTime( '30/12/1899' ) );
                  end
                  else
                  if ( DataTypeStrIsBigInt( cPkType ) ) then
                     TFDQuery( LkpDBEdit.DataSource.DataSet ).ParamByName( 'table_pk' ).AsLargeInt := iLkpPkValue
                  else
                     TFDQuery( LkpDBEdit.DataSource.DataSet ).ParamByName( 'table_pk' ).AsInteger := iLkpPkValue;
                  // 6.0.0.0 - aplicar WHERE/AND quando há "getpk:"
                  cTemp4 := TFDQuery( LkpDBEdit.DataSource.DataSet ).SQL.Text;
                  //8.4.0.1 lookup str
                  if Pos( 'getpk:', LkpDBEdit.Hint ) > 0 then
                  begin
                     if mm.varC_Where <> '' then
                     begin
                         iPos := Pos( ' = :table_pk  AND', cTemp4 );
                         //iPos := Pos( ' AND 33=33 AND', cTemp4 );
                         if iPos > 0 then
                            TFDQuery( LkpDBEdit.DataSource.DataSet ).SQL.Text := Copy( cTemp4, 1, iPos + 12 );
                         TFDQuery( LkpDBEdit.DataSource.DataSet ).SQL.Text := TFDQuery( LkpDBEdit.DataSource.DataSet ).SQL.Text + ' AND 33=33 AND ' + Copy( Trim( mm.varC_Where ), 6 );
                         iPos := -1;
                     end
                     else
                     begin
                        iPos := Pos ( 'AND 33=33 AND', TFDQuery( LkpDBEdit.DataSource.DataSet ).SQL.Text );
                        if iPos > 0 then
                           TFDQuery( LkpDBEdit.DataSource.DataSet ).SQL.Text :=
                               Trim( Copy( TFDQuery( LkpDBEdit.DataSource.DataSet ).SQL.Text, 1, iPos - 1 ) ) + ' ';

                        iPos := -1;
                     end;
                  end;
                  dm_rc.rc_OpenQuery( TFDQuery( LkpDBEdit.DataSource.DataSet ) );

                  if LkpDBCod.Text = '' then TUniEdit( LkpDBEdit ).Text := ''; //7.3.0.0
                  //8.4.0.1 lookup str
//                  if ( pSQLDetail.FieldByName( LkpDBCod.DataField ).AsInteger < 0 ) and ( pSQLDetail.state in [ dsEdit, dsInsert] ) then
//                      pSQLDetail.FieldByName( LkpDBCod.DataField ).Clear
                  if  ( pSQLDetail.state in [ dsEdit, dsInsert] ) then
                  begin
                     if ( DataTypeStrIsString( cPkType ) ) then
                        bCondition := LkpDBCod.Text = ''
                     else
                        bCondition := ( pSQLDetail.FieldByName( LkpDBCod.DataField ).AsInteger < 0 );

                     if bCondition then
                         pSQLDetail.FieldByName( LkpDBCod.DataField ).Clear
                     else
                     begin
                         if Pos( 'rcblock', lowercase( LkpDBEdit.Parent.Name ) ) = 0 then
                            LkpDBEdit.SetFocus;
                     end;
                  end;
               end;
            except on e:exception do
                   begin
                      cTemp := e.Message;
                      // o erro ocorreu no rc_OpenQuery...
                      if cTemp = 'Operation aborted' then
                         cTemp := mm.varC_LastErrorMsg;

                      if LkpDBCod.DataField = '' then
                      begin
                         rc_ShowError( '<h2>LookUps Update Failed !</h2><br>' +
                                       '<strong>MESSAGE</strong><br><hr>' +
                                       '<strong>Msg: </strong>' + cTemp +  '<br><br>' +
                                       '<strong>LkpDBCod: </strong>' + LkpDBCod.name + ' DATAFIELD not declared( LISTFIELD__DATAFIELD )!' + '<br><br>' +
                                       mm.MSG_CONTACT_SUPPORT);
                      end
                      else
                      if pSQLMaster.FieldByName( LkpDBCod.DataField ).DataType <> ftInteger then
                      begin
                         rc_ShowError( '<h2>LookUps Update Failed !</h2><br>' +
                                       '<strong>MESSAGE</strong><br><hr>' +
                                       '<strong>Msg: </strong>' + cTemp +  '<br><br>' +
                                       '<strong>LkpDBCod: </strong>' + LkpDBCod.name + ' ( keyfield ) is not INTEGER!' + '<br><br>' +
                                       mm.MSG_CONTACT_SUPPORT);
                      end
                      else
                         rc_ShowError( '<h2>LookUps Update Failed !</h2><br>' +
                                       '<strong>MESSAGE</strong><br><hr>' +
                                       '<strong>Msg: </strong>' + cTemp +  '<br><br>' +
                                       '<strong>LkpDBEdit: </strong>' + LkpDBEdit.name + ' possibly without linked DATASOURCE or DATAFIELD!' + '<br><br>' +
                                       mm.MSG_CONTACT_SUPPORT);
                   end;
            end;
            if pLkp <> nil then
               Break;
         end;
      end ;
    end;
end;

procedure tdm_rc.rc_SearchPostalCodeCEP( pCep, pType, pFormFrame : string ; pQry : TFDQuery );
begin
  pCep := Trim( ReturnNumbers( pCep ) );
  if pCep <> '' then
  begin
     UniSession.JSCode( '$.getJSON("https://viacep.com.br/ws/' + pCep + '/json/?callback=?", ' +
                        '       function(dados) {' +
                        '       if (!("erro" in dados)) {' +
                        '          ajaxRequest( ' + MainForm.htmlFrame.JSName + ' , "_DadosCep", ' +
                        '                       ["rua=" + dados.logradouro, ' +
                        '                       "bairro=" + dados.bairro, ' +
                        '                       "cidade=" + dados.localidade, ' +
                        '                       "uf=" + dados.uf, ' +
                        '                       "ibge=" + dados.ibge, ' +
                        '                       "gia=" + dados.gia ,' +
                        '                       "form=" + ' + QuotedStr( pFormFrame ) + ', ' +
                        '                       "qry=" + ' + QuotedStr( pQry.Name ) + ', ' +
                        '                       "tipocep=" + ' + QuotedStr( pType ) +
                        '                       ]);' +
                        '       } ' +
                        '       else {' +
                        '           ajaxRequest( ' + MainForm.htmlFrame.JSName + ' , "_DadosCepErro", []);'+
                        '       }' +
                        '});' );
  end;
end;
//7.3.0.0
procedure tdm_rc.rc_SearchPostalCodeCEP(pCep, pFormFrame: string; pQry: TFDQuery; pUF, pCidade, pBairro, pEnder, pIbge: tunicontrol);
var
   cFuncCall : string;
begin
  pCep := Trim( ReturnNumbers( pCep ) );
  if pCep <> '' then
  begin
     cFuncCall := '$.getJSON("https://viacep.com.br/ws/' + pCep + '/json/?callback=?", ' +
                  '  function(dados) {' +
                  '       if (!("erro" in dados)) {' +
                  '          ajaxRequest( ' + MainForm.htmlFrame.JSName + ' , "_DadosCep", ' +
                  '                       ["rua=" + dados.logradouro, ' +
                  '                       "bairro=" + dados.bairro, ' +
                  '                       "cidade=" + dados.localidade, ' +
                  '                       "uf=" + dados.uf, ' +
                  '                       "ibge=" + dados.ibge, ' +
                  '                       "gia=" + dados.gia ,' +
                  '                       "form=" + ' + QuotedStr( pFormFrame ) + ', ' +
                  '                       "qry=" + ' + QuotedStr( pQry.Name ) + ', ' +
                  '                       "oUF=" + ' + QuotedStr( pUf.Name ) + ', ' +
                  '                       "oCIDADE=" + ' + QuotedStr( pCidade.Name ) + ', ' +
                  '                       "oBAIRRO=" + ' + QuotedStr( pBairro.Name ) + ', ' +
                  '                       "oENDERECO=" + ' + QuotedStr( pEnder.Name ) ;
     if pIbge <> nil then
        cFuncCall := cFuncCall + ', ' +
                     '       "oIBGE=" + ' + QuotedStr( pIbge.Name )  ;

        cFuncCall := cFuncCall +
                     '                       ]);' +
                     '       } ' +
                     '       else {' +
                     '           ajaxRequest( ' + MainForm.htmlFrame.JSName + ' , "_DadosCepErro", []);'+
                     '       }' +
                     '});';
     UniSession.JSCode( cFuncCall );
  end;
end;
//8.4.0.2
procedure tdm_rc.rc_SetCursorBeginOfText( pControl : TUniControl );
begin
    rc_Setfocus( pControl );
    //UniSession.AddJS( 'document.getSelection().modify("move", "backward", "documentboundary");' );
    UniSession.AddJS( 'setTimeout(function() {' +
                      '   document.getSelection().modify("move", "backward", "documentboundary");' +
                      '}, 100);' );

end;
//8.0.0.0
procedure tdm_rc.rc_SetCursorEndOfText;
begin
    UniSession.AddJS( 'document.getSelection().modify("move", "forward", "documentboundary");' );
end;
// se clicar no OK de uma mensagem..o retorno perde o foco
procedure tdm_rc.rc_SetFocus(pObj: TObject);
begin
     try
        UniSession.AddJS('setTimeout(function(){' + TuniControl( pObj ).JSName + '.focus()}, 100)');
     except on e:exception do
            begin
                 rc_ShowError('rc_SetFocus failed. <br> See which component was used.');
            end;
     end;
end;
// 6.0.0.0
function tdm_rc.rc_PrepareDetailForm(pForm: TObject; pTable_Detail, pCode_ID_Field, pTitle: string): integer;
var
   pGrid : TUniDBGrid;
   pQry : TFDQuery;
   cTitle : string;
begin
  if Pos( '(', pTitle ) > 0 then
  begin
       cTitle := Copy( pTitle, Pos( '(', pTitle ) + 1, 200 );
       cTitle := CopY( ctitle, 1, length( cTitle ) - 1 );
  end;

  If dm_rc.rc_PermissionVerify( cTitle ,
                                Trim( pTable_Detail ) ,
                                PT_ACCESS ) then
  begin
     pQry      := TFDQuery( TComponent(pForm).FindComponent( 'sqlMaster' ) );
     pGrid     := TUniDBGrid( TComponent(pForm) .FindComponent( 'dbgSearchCRUD' ) );
     // POSSIVELMENTE...ajuste pra troca do tag por hint ( pk bigint or string ) 6.0.0.0
     pGrid.Tag := StrToIntDef( pGrid.DataSource.DataSet.FieldByName( TUniEdit( TComponent(pForm).FindComponent( 'ed_PK' ) ).Text ).AsString , 0 ) ;
     Result    := pGrid.Tag;
     if Result > 0 then
     begin
         pQry.Cancel;
         pQry.close;
         // registro PAI( MESTRE )
         pQry.ParamByName( 'table_pk' ).AsInteger := pGrid.Tag;
         rc_OpenQuery( pQry );
         // para uso futuro do GERADOR de SELECTs..INSERTs...
         mm.varC_Table_Detail := pTable_Detail;
         // para uso no Form Filho ( ed_CodMASTER: frmBaseCRUDDetail )
         mm.varC_Code_ID      := pGrid.Tag.ToString;
         mm.varC_Code_ID_Field:= pCode_ID_Field;
         // para uso em: TfrmBaseCRUDDetail.UniFormCreate
         mm.varC_Frame_Master := TUniFrame(pForm);
         // preencher o titulo do form filho dinamicamente
         mm.varC_Selected_FormFrame_Detail := pTitle;
     end
     else
         rc_ShowMessage( mm.MSG_SELECT_VALID_RECORD );
  end
  else
      Result := 0;
end;
//8.4.0.3
//[PT] tentativa de listar multicolunas - em desenv.
//[EN] attempt to list multicolumns - in dev.
procedure tdm_rc.rc_FillComboBox( pCbx: TUniComboBox; pTable, pField: string; pWhere : String; pFiles : string );
var
   i, iIndex, iC, iCols : integer;
   cList,cText  : string;
   cTemp, cTemp2 : string;
   vSR: TSearchRec;
begin
    if pFiles = '' then
    begin
       cText := TUniComboBox( pCbx ).Text;

       cTemp := pField;
       iCols := strTokenCount( cTemp, ';' ) - 1;
       iC    := 0;
       //pField := StringReplace( pField, ';', '||'' ''||', [rfReplaceAll] );

       sqlGetDataSet.Close;
       sqlGetDataSet.sql.Text := ' select ' + StringReplace( pField, ';', ',', [rfReplaceAll] ) + ' from ' + dm_rc.rc_DBSchema + pTable + pWhere + ' order by ' + StringReplace( pField, ';', ',', [rfReplaceAll] ); //6.1.0.0
       rc_OpenQuery( sqlGetDataSet );

       i := 0;
       TUniComboBox( pCbx ).Clear;
       while not sqlGetDataSet.Eof do
       begin
             cTemp := pField;
             cList := '';
             for iC := 0 to iCols do
             begin
                  cTemp2 := Copy( cTemp, 1, Pos( ';' , cTemp ) -1 ) ;
                  cTemp  := StringReplace( cTemp, cTemp2 + ';', '', [rfReplaceAll] ) + ';';
                  cTemp  := StringReplace( cTemp, cTemp2, '', [rfReplaceAll] ) + ';';
                  if iCols > 0 then
                  begin
                     cList  := cList + sqlGetDataSet.FieldByName( cTemp2 ).AsString ;
                     if ic < icols then
                        cList  := cList + ' | ';
                  end
                  else
                     cList  := sqlGetDataSet.FieldByName( pField ).AsString;
             end;
             TUniComboBox( pCbx ).Items.Add( cList );

             if cText = cList then //sqlGetDataSet.FieldByName( cList ).AsString then
             begin
                iIndex := i;
             end;
             sqlGetDataSet.Next;
             Inc( i );
       end;
       sqlGetDataSet.close;
    end
    else
    begin
       cText := TUniComboBox( pCbx ).Text;
       cTemp := pFiles;// sm.FilesFolderPath + 'translate' + mm.BACKSLASH + cTemp ;

       TUniComboBox( pCbx ).Items.Clear;
       TUniComboBox( pCbx ).ItemIndex := -1;
       I := FindFirst( cTemp + mm.BACKSLASH + '*.gif' , faAnyFile, vSR );
       while I = 0 do
       begin
         TUniComboBox( pCbx ).Items.Add( vSR.Name ); //ChangeFileExt(vSR.Name, '' )
         I := FindNext( vSR );
       end;
       I := FindFirst( cTemp + mm.BACKSLASH + '*.svg' , faAnyFile, vSR );
       while I = 0 do
       begin
         TUniComboBox( pCbx ).Items.Add( vSR.Name );
         I := FindNext( vSR );
       end;
       FindClose(vSR);

       TUniComboBox( pCbx ).ItemIndex := 0;
    end;

    TUniComboBox( pCbx ).ItemIndex := iIndex;
end;
//8.4.0.3
procedure tdm_rc.rc_FillComboBox( pFrame : TObject; pCbx: TUniComboBox; pFromJS_API, pAPIKey: string);
var
   i, iIndex, iC, iCols : integer;
   cList,cText  : string;
   cTemp, cTemp2 : string;
   vSR: TSearchRec;
begin
    if pAPIKey <> '' then
    begin
    end
    else
    begin
       TUniComboBox( pCbx ).Items.Clear;
       TUniComboBox( pCbx ).ItemIndex := -1;
       cTemp := TUniControl( pFrame ).Name;

       UniSession.AddJS( 'var items = ' + pFromJS_API + ';' + //  responsiveVoice.getVoices();' +
                         'var code="";' +
                         'for (var i=0; i<items.length; i++) {' +
                         '     code += "<option>" + items[i].name + "</option>";' +
                         '}' +
                         'ajaxRequest( ' + MainForm.htmlFrame.JSName + ' , "_fillCbxFromJS", ' +
                         '  ["formName=" + ' + QuotedStr( cTemp ) + ',' +
                         '   "cbxName=" + '  + QuotedStr( TUniControl( pCbx ).Name ) + ' ,' +
                         '   "cbxItems=" + code  ' +
                         ']);'
        );
    end;
end;
//7.0.0.0
function tdm_rc.rc_LoadBlobStr(pObj : TComponent; pQuery: TFDQuery; pField: string): Boolean;
var
  BlobStream : TStream;
  oText : TUniHTMLMemo;
begin
     Result := True;

     oText := nil;
     try
        if not( pQuery.FieldByName( pField ).IsNull ) then
        begin
            BlobStream := pQuery.CreateBlobStream( pQuery.FieldByName( pField ), bmRead );

            if pObj is TUniMemo then
              TUniMemo(pObj).Lines.LoadFromStream(BlobStream)
            else
            if pObj is TUniHTMLMemo then
              TUniHTMLMemo(pObj).Lines.LoadFromStream(BlobStream)
            else
            if pObj is TUniDBHTMLMemo then
              TUniDBHTMLMemo(pObj).Lines.LoadFromStream(BlobStream)
            else
            if pObj is TUniDBMemo then
              TUniDBMemo(pObj).Lines.LoadFromStream(BlobStream);

            BlobStream.Free;
        end
        else
        begin
            if pObj is TUniMemo then
              TUniMemo(pObj).Lines.Clear
            else
            if pObj is TUniHTMLMemo then
              TUniHTMLMemo(pObj).Lines.Clear
            else
            if pObj is TUniDBHTMLMemo then
              TUniDBHTMLMemo(pObj).Lines.Clear
            else
            if pObj is TUniDBMemo then
              TUniDBMemo(pObj).Lines.Clear;
        end;
     except on e:exception do
            begin
                 Result := False;
                 rc_ShowError('Failed to Load BLOB:' + e.Message );
            end;
     end;
end;
//7.0.0.0
function tdm_rc.rc_SaveBlobStr(pObj : TComponent; pTable, pField, pWhere: string): Boolean;
var
   BlobStream: TStream;
   PngImage : TPngImage;
begin
   PngImage := nil;
   Result   := True;
   Try
      BlobStream := TMemoryStream.Create;
      Try
          if pObj is TUniMemo then
            TUniMemo(pObj).Lines.SaveToStream(BlobStream)
          else
          if pObj is TUniHTMLMemo then
            TUniHTMLMemo(pObj).Lines.SaveToStream(BlobStream)
          else
          if pObj is TUniDBHTMLMemo then
            TUniDBHTMLMemo(pObj).Lines.SaveToStream(BlobStream)
          else
          if pObj is TUniDBMemo then
            TUniDBMemo(pObj).Lines.SaveToStream(BlobStream);

          sqlDS.SQL.Text := ' Update ' + dm_rc.rc_DBSchema + pTable + //6.1.0.0
                            ' Set ' + pField + ' = :pblob ' +
                            pWhere;

          sqlDS.Connection.StartTransaction;
          try
            sqlDS.ParamByName('pblob').SetStream( BlobStream, ftBlob, false);

            sqlDS.ExecSQL;
            sqlDS.Connection.Commit;
          except
            on E: Exception do
            begin
              sqlDS.Connection.Rollback;
              rc_ShowError( 'Failed to save BLOB!' + sLineBreak + sLineBreak + E.Message  );
            end;
          end;
          sqlDS.close;
      Finally
             BlobStream.Free;
      End;
   Except On e:exception do
          begin
               Result := False;
               rc_ShowError('Failed to Save BLOB:' + e.Message);
          end;
   End;
end;
//7.5.0.3
function tdm_rc.rc_SaveBlobImg(pImg: TUniImage; pPng : Boolean; pTable, pField, pWhere: string): Boolean;
var
   BlobStream: TStream;
   PngImage : TPngImage;
   cFileName : string;
begin
   PngImage := nil;
   Result   := True;
   if Pos( 'tree/s.gif', pImg.CurrImgUrl ) = 0 then
   begin
      Try
         BlobStream := TMemoryStream.Create;
         Try
             if not pPng then
                //pImg.Picture.Savetostream( BlobStream )
                pImg.Picture.Graphic.SaveToStream( BlobStream )
             else
             begin
                PngImage := TPngImage.Create;
                PngImage.LoadFromFile( sm.CacheFolderPath + Copy( ExtractFileName( pImg.CurrImgUrl ), 2, 500 ) );//  Assign( pImg );
                PngImage.SaveToStream( BlobStream );
             end;

             sqlDS.SQL.Text := ' Update ' + dm_rc.rc_DBSchema + pTable + //6.1.0.0
                               ' Set ' + pField + ' = :pblob ' +
                               pWhere;

             sqlDS.Connection.StartTransaction;
             try
               sqlDS.ParamByName('pblob').SetStream( BlobStream, ftBlob, false);

               sqlDS.ExecSQL;
               sqlDS.Connection.Commit;
             except
               on E: Exception do
               begin
                 sqlDS.Connection.Rollback;
                 rc_ShowError( 'Failed to save image!' + sLineBreak + sLineBreak + E.Message  );
               end;
             end;
             sqlDS.close;
         Finally
                if pPng then
                   PngImage.Free;

                BlobStream.Free;
         End;
      Except On e:exception do
             begin
                  Result := False;
                  rc_ShowError('Failed to Save BLOB:' + e.Message);
             end;
      End;
   end;
end;

function tdm_rc.rc_LoadBlobImg(pImg: TUniImage; pPng: Boolean; pQuery : TFDQuery; pField : string): Boolean;
var
   JpegImage: TJPEGImage;
   PngImage: TPngImage;
   BlobStream: TStream;
begin
     Result := True;

     JpegImage := nil;
     PngImage  := nil;

     try
        if not( pQuery.FieldByName( pField ).IsNull ) then
        begin
            BlobStream := pQuery.CreateBlobStream( pQuery.FieldByName( pField ), bmRead );

            if not pPng then
            begin
               JpegImage := TJPEGImage.Create;
               try
                 JpegImage.LoadFromStream(BlobStream);
                 pImg.Picture.Assign( JpegImage );
               finally
                 JpegImage.Free;
               end;
            end
            else
            begin
               PngImage := TPngImage.Create;
               try
                 PngImage.LoadFromStream(BlobStream);
                 pImg.Picture.Assign( PngImage );
               finally
                 PngImage.Free;
               end;
            end;

            BlobStream.Free;
        end
        else
        begin
             pImg.Picture.Assign(nil);
        end;
     except on e:exception do
            begin
                 Result := False;
                 rc_ShowError('Failed to Load BLOB:' + e.Message );
            end;
     end;
end;
//6.0.0.0
function tdm_rc.rc_LoadConfig : integer;
var
   varDefault : Variant;
   Inifile : TIniFile;
   pNum : integer;
begin
      Inifile := nil;
      pNum    := 1;
      // Config FILE: "APP_NAME"_Cfg.ini   IniFile := TiniFile.Create( mm.APP_PATH_FILES_GLOBAL + StringReplace( StrTokenClear( APP_NAME ), ' ', '', [rfReplaceAll] ) + '_cfg.ini'  ); // renamed from '_lastaccess'
      try
        mm.varC_Temp1 := StringReplace( StrTokenClear( APP_NAME ), ' ', '', [rfReplaceAll] );
        mm.varC_Temp1 := sm.FilesFolderPath + mm.varC_Temp1 + '_cfg.ini';

        IniFile := TIniFile.Create( mm.varC_Temp1 );

        varDefault := IniFile.ReadString( 'App', 'session_log', '1' );
        // Generate LOG
        mm.CONFIG_SESSION_LOG     := ( varDefault = '1' );
        // 6.0.0.0
        mm.CONFIG_SESSION_TIMEOUT := IniFile.ReadInteger('App' , 'session_timeout' , 0 ) ; // 6.0.0.1
        mm.CONFIG_APP_DATA_FOLDER := IniFile.ReadString ('App' , 'app_data_folder' , 'OFF' ) ;
        // App
        mm.CONFIG_APP_TYPE        := lowercase( IniFile.ReadString( 'App', 'type', 'default') );
        mm.CONFIG_APP_SUBTYPE     := IniFile.ReadString( 'App', 'subtype', '');
        mm.CONFIG_LANGUAGE        := IniFile.ReadString( 'App', 'language', '');

        if ( mm.CONFIG_LANGUAGE = '' ) or ( mm.CONFIG_LANGUAGE = '[Auto]' ) or
           ( not AnsiMatchStr( mm.CONFIG_LANGUAGE , ARRAY_LANGUAGES ) ) then
        begin
           mm.CONFIG_LANGUAGE := sm.ExtLocale;
           if mm.CONFIG_LANGUAGE = '[Auto]' then
           begin
              mm.CONFIG_LANGUAGE := UniSession.Language;

              if mm.CONFIG_LANGUAGE = '' then
                 mm.CONFIG_LANGUAGE := 'pt_BR';
           end;
        end;

        mm.varLT_Lang := TRCLanguagesType( dm_rc.rc_GetIndexFromArray( mm.CONFIG_LANGUAGE, ARRAY_LANGUAGES ) );
        //( feedback mohamed ammar )
        mm.RTL := ( mm.varLT_Lang = ltar_SA );
        // Database
        {<*RC DB}
        mm.CONFIG_DATABASE           := IniFile.ReadString( 'DataBase', 'dbms', 'FIREBIRD');
        mm.CONFIG_DATABASE_HOST_IP   := IniFile.ReadString( 'DataBase', 'ip', '127.0.0.1');
        mm.CONFIG_DATABASE_PORT      := StrToIntDef( IniFile.ReadString( 'DataBase', 'port', '3050'), 3050);
        mm.CONFIG_DATABASE_USERNAME  := IniFile.ReadString( 'DataBase', 'user', 'sysdba');
        mm.CONFIG_DATABASE_PASSWORD  := IniFile.ReadString( 'DataBase', 'password', 'masterkey');
        mm.CONFIG_DATABASE_NAME      := IniFile.ReadString( 'DataBase', 'dbname', 'rc_db.fdb'); // sqlite must have ".db" extension
        //7.0.0.0
        mm.APP_PATH_BD               := IniFile.ReadString( 'DataBase', 'dbpath', '');
        if mm.APP_PATH_BD = '' then
           mm.APP_PATH_BD := sm.FilesFolderPath + 'database' + mm.BACKSLASH ;
        // mm.DATABASE_ACTIVE           := '';//8.0.0.0
        {RC DB*>}
        // Email
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER              := IniFile.ReadString ( 'Email', 'email'    , SOFTWAREHOUSE_SUPPORT_EMAIL );
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_HOST         := IniFile.ReadString ( 'Email', 'host'     , 'smtp.gmail.com' );
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SMTP_PORT    := IniFile.ReadString ( 'Email', 'smtpport' , '587' );
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_USER         := IniFile.ReadString ( 'Email', 'user'     , SOFTWAREHOUSE_SUPPORT_EMAIL );
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_PASS         := IniFile.ReadString ( 'Email', 'password' , '1234' );
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_CONFIRMATION := IniFile.ReadString ( 'Email', 'confirm'  , mm.VALUE_YES );
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_THREAD       := IniFile.ReadString ( 'Email', 'thread'   , mm.VALUE_NO );
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_TLS          := IniFile.ReadString ( 'Email', 'tls'      , '0' );
        mm.CONFIG_EMAIL_SOFTWAREHOUSE_SENDER_SSL          := IniFile.ReadString ( 'Email', 'ssl'      , '0' );
        // Layout
        mm.CONFIG_LAYOUT_ACTIVE_THEME                     := IniFile.ReadString( 'Layout', 'active', 'blue');

        pNum := StrToIntDef( IniFile.ReadString( 'App', 'loginBg', '1'), 1);
        Inc(pNum);
      finally
        IniFile.Free;
        Result := pNum;
      end;
end;
// 6.0.0.1
procedure tdm_rc.rc_LoadTheme(pName: String);
var
   Inifile : TIniFile;
   cGridLayout, cMenuExpandIcon,
   cTemp, cLabelColor : string;
begin
      Inifile := nil;
      try
        if pName = '' then
           pName := 'active';

        pName := lowercase( pName ); //7.5.0.3 lowercase

        IniFile := TiniFile.Create( sm.FilesFolderPath + 'themes' + mm.BACKSLASH + 'theme_' + lowercase(pName) + '.ini');
        //controle de cores
        mm.CONFIG_LAYOUT_MENU_COLOR              := IniFile.ReadString('Colors' , 'menu_color'       , '$00373737') ;
        mm.CONFIG_LAYOUT_MENUFONT_COLOR          := IniFile.ReadString('Colors' , 'menufont_color'   , '$00FDFFFF') ;
        mm.CONFIG_LAYOUT_MENUFONT_COLOR_GROUP    := IniFile.ReadString('Colors' , 'menufontgroup_color'   , '$00FDFFFF') ;

        if mm.CONFIG_LAYOUT_MENUFONT_COLOR = 'clWhite' then
           mm.CONFIG_LAYOUT_MENUFONT_COLOR := '$00FDFFFF';

        mm.CONFIG_LAYOUT_MENU_LOGO_BG_COLOR      := IniFile.ReadString('Colors' , 'menu_logo_color_bg'       , '$00373737') ;
        mm.CONFIG_LAYOUT_MENU_LOGO_FONT_COLOR    := IniFile.ReadString('Colors' , 'menu_logo_color_font'   , '$00ADB3B8') ;

        mm.CONFIG_LAYOUT_LOGIN_COLOR             := IniFile.ReadString('Colors' , 'login_color'      , '$00373737') ;

        mm.CONFIG_LAYOUT_LABEL_COLOR             := IniFile.ReadString('Colors' , 'label_color'      , '$00000000') ;

        mm.CONFIG_LAYOUT_BUTTON_COLOR            := IniFile.ReadString('Colors' , 'button_color'     , '$00363636') ;
        mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD       := IniFile.ReadString('Colors' , 'button_color_crud', '$00363636') ;

        mm.CONFIG_LAYOUT_BUTTON_COLOR_HOVER      := IniFile.ReadString('Colors' , 'button_color_hover'     , '$00303030') ;
        mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD_HOVER := IniFile.ReadString('Colors' , 'button_color_crud_hover', '$00303030') ;

        mm.CONFIG_LAYOUT_EDIT_FOCUS_COLOR        := IniFile.ReadString('Colors' , 'edit_focus_color' , '$00FFFFE0') ;
        mm.CONFIG_LAYOUT_EDIT_COLOR              := IniFile.ReadString('Colors' , 'edit_color'      , '$00FFFFFF') ;
        mm.CONFIG_LAYOUT_EDIT_BORDER_COLOR       := ColorToString( COLOR_SILVER );//IniFile.ReadString('Colors' , 'edit_border_color'      , ColorToString( COLOR_SILVER ) ) ; //7.0.0.0
        mm.CONFIG_LAYOUT_EDIT_FONT_COLOR         := IniFile.ReadString('Colors' , 'edit_font_color'      , '$00000000') ;
        mm.CONFIG_LAYOUT_EDIT_COLOR_READONLY     := IniFile.ReadString('Colors' , 'edit_color_readonly'      , '$00D0D0D0') ;
        mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_READONLY:= IniFile.ReadString('Colors' , 'edit_font_color_readonly'      , '$00000000') ;
        mm.CONFIG_LAYOUT_EDIT_COLOR_TRIGGER      := IniFile.ReadString('Colors' , 'edit_color_trigger'      , '$00FFFFFF') ;
        mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_TRIGGER := IniFile.ReadString('Colors' , 'edit_font_color_trigger' , '$00d0d0d0') ;

        mm.CONFIG_LAYOUT_GRID_SEL_COLOR          := IniFile.ReadString('Colors' , 'grid_sel_color' , '$00FFFFE0') ;

        mm.CONFIG_LAYOUT_GRID_TITLE_BG           := IniFile.ReadString('Colors' , 'grid_title_bg'  , '$00e8e3de' ) ;
        mm.CONFIG_LAYOUT_GRID_TITLE_COLOR        := IniFile.ReadString('Colors' , 'grid_title_color' ,'$00919191' ) ;
        mm.CONFIG_LAYOUT_GRID_TITLE_BG_OVER      := IniFile.ReadString('Colors' , 'grid_title_bg_over'  , '$00e8e3de' ) ;
        mm.CONFIG_LAYOUT_GRID_TITLE_COLOR_OVER   := IniFile.ReadString('Colors' , 'grid_title_color_over' ,'$00919191' ) ;//dee3e8
        mm.CONFIG_LAYOUT_GRID_TITLE_COLOR_ICON   := IniFile.ReadString('Colors' , 'grid_title_color_icon' ,'$00919191' ) ;

        mm.CONFIG_LAYOUT_EDLKP_COLOR             := IniFile.ReadString('Colors' , 'edlkp_color'      , '$00B5E4FF') ;
        mm.CONFIG_LAYOUT_EDLKP_FONT_COLOR        := IniFile.ReadString('Colors' , 'edlkp_font_color' , '$00000000') ;

        mm.CONFIG_LAYOUT_BG_COLOR                := IniFile.ReadString('Colors' , 'bg_color' , '$00EAEAEA') ;
        mm.CONFIG_LAYOUT_LINK_COLOR              := IniFile.ReadString('Colors' , 'link_color' , '$0051B5F7') ;
        mm.CONFIG_LAYOUT_LINKHOVER_COLOR         := IniFile.ReadString('Colors' , 'linkhover_color' , '$0051B5F7') ;

        mm.CONFIG_LAYOUT_TAB_COLOR_FOCUS         := IniFile.ReadString('Colors' , 'tab_color_focus' , 'OFF') ;
      finally
        IniFile.Free;
      end;

      mm.varC_Temp1 := StringReplace( StrTokenClear( APP_NAME ), ' ', '', [rfReplaceAll] );
      mm.varC_Temp1 := sm.FilesFolderPath + mm.varC_Temp1 + '_cfg.ini';
      IniFile := TIniFile.Create( mm.varC_Temp1 );
        mm.CONFIG_LAYOUT_ROUND_FORM              := IniFile.ReadString('Layout' , 'round_form' , 'ON') ;
        mm.CONFIG_LAYOUT_ROUND_EDIT              := IniFile.ReadString('Layout' , 'round_edit' , 'ON') ;
        mm.CONFIG_LAYOUT_ROUND_EDIT_FACTOR       := IniFile.ReadString('Layout' , 'round_edit_factor' , '4') ;
        mm.CONFIG_LAYOUT_ROUND_PANEL_FACTOR      := IniFile.ReadString('Layout' , 'round_panel_factor' , '4') ;
        mm.CONFIG_LAYOUT_ROUND_BTN_FACTOR        := IniFile.ReadString('Layout' , 'round_btn_factor' , '4') ;

        mm.CONFIG_LAYOUT_EDIT_FOCUS_ACTIVE       := IniFile.ReadString('Layout' , 'bg_focus_active' , 'ON') ; //8.0.0.0 focus active
        mm.CONFIG_LAYOUT_LOOKUP_THEMED           := IniFile.ReadString('Layout' , 'bg_themed_lookup' , 'ON') ; //8.0.0.0

        mm.CONFIG_LAYOUT_USER_BG                 := IniFile.ReadString('Layout' , 'user_bg' , 'OFF') ;
        mm.CONFIG_LAYOUT_LABEL_WRAP              := IniFile.ReadString('Layout' , 'label_wrap' , 'ON') ;
        mm.CONFIG_LAYOUT_LABEL_WEIGHT            := IniFile.ReadString('Layout' , 'label_weight' , '300') ;
        mm.CONFIG_LAYOUT_LABEL_FORMS_DEFAULT     := IniFile.ReadString('Layout' , 'label_forms_default' , 'ON') ;
        mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET        := IniFile.ReadString('Layout' , 'gridblock_offset' , '15') ;
        mm.CONFIG_LAYOUT_GRIDBLOCK_ANIM          := IniFile.ReadString('Layout' , 'gridblock_anim' , 'ON') ;
        mm.CONFIG_LAYOUT_MENUFONT_SIZE           := IniFile.ReadString('Layout' , 'menufont_size' , '12') ;
        mm.CONFIG_LAYOUT_MENU_WIDTH              := IniFile.ReadString('Layout' , 'menu_width' , MAIN_MENU_EXPANDED.ToString ) ; //8.0.0.0 menu
        mm.CONFIG_LAYOUT_MENU_TEXT_WIDTH         := IniFile.ReadString('Layout' , 'menutext_width' , MAIN_MENU_ITEM_MAXWIDTH.ToString) ; //8.0.0.0 menu
        mm.CONFIG_LAYOUT_MENU_LINE_HEIGHT        := IniFile.ReadString('Layout' , 'menuline_height' , '38') ; //7.5.0.0 menu
        // 6.0.0.0
        mm.CONFIG_LAYOUT_MENU_TYPE               := IniFile.ReadString('Layout' , 'menu_type' , '1') ;
        mm.CONFIG_LAYOUT_MENU_TYPE_AUTOCLOSE     := IniFile.ReadString('Layout' , 'menu_type_autoclose' , '1') ;//6.0.0.0+menu micro

        mm.CONFIG_LAYOUT_MENU_CALL_ANIM          := IniFile.ReadString('Layout' , 'menu_call_anim' , 'ON') ;//7.3.0.0
        mm.CONFIG_LAYOUT_ANIM_EFFECTS            := IniFile.ReadString('Layout' , 'anim_effects' , 'ON') ;//7.4.0.0 anim

        mm.CONFIG_LAYOUT_APP_FONT                := IniFile.ReadString('Font'   , 'app_font'   , 'Outfit' ) ;
        mm.CONFIG_LAYOUT_APPLY_FONT_ALL          := IniFile.ReadString('Font' , 'font_all' , 'ON') ;
        //8.2.0.0
        mm.CONFIG_LAYOUT_FONTAWS                 := IniFile.ReadString('Font' , 'font_aws' , '6') ;//8.4.0.0
        mm.CONFIG_LAYOUT_BSICONS                 := IniFile.ReadString('Font' , 'bsicons' , 'OFF') ;

        mm.CONFIG_LAYOUT_TAB_BACKGROUND_DEFAULT  := '$00373737';

        mm.CONFIG_LAYOUT_TAB_COLOR_HOVER         := '$00DDDDDD';
        mm.CONFIG_LAYOUT_TAB_MAX_OPENED          := IniFile.ReadString('Layout' , 'tabs_max_open' , '10') ;
        mm.CONFIG_LAYOUT_TAB_OFF                 := IniFile.ReadString('Layout' , 'tabs_off' , 'OFF') ;
        // 6.0.0.0
        mm.CONFIG_LAYOUT_TAB_BUTTONS             := IniFile.ReadString('Layout' , 'tabs_btn' , 'OFF') ;
        mm.CONFIG_LAYOUT_TAB_THEME_BORDER        := IniFile.ReadString('Layout' , 'tabs_theme_border' , 'OFF') ;
        mm.CONFIG_LAYOUT_TAB_BORDER_OFF          := IniFile.ReadString('Layout' , 'tabs_border_bottom' , 'OFF') ;

        mm.CONFIG_LAYOUT_HIDE_TABS_ON_MOBILE     := IniFile.ReadString('Layout' , 'hide_tabs' , 'OFF') ;
        mm.CONFIG_LAYOUT_HIDE_TOPPANEL_ON_MOBILE := IniFile.ReadString('Layout' , 'hide_toppanel' , 'OFF') ;

        mm.CONFIG_LAYOUT_KEYBOARD_VIRTUAL_ON_DESKTOP := IniFile.ReadString('Layout' , 'keyb_desk_virtual' , 'OFF') ; // 6.0.0.0
        mm.CONFIG_LAYOUT_KEYBOARD_VIRTUAL_ON_MOBILE  := IniFile.ReadString('Layout' , 'keyb_virtual' , 'OFF') ;
        mm.CONFIG_LAYOUT_KEYBOARD_SCROLL_ON_MOBILE   := 'OFF';//IniFile.ReadString('Layout' , 'keyb_scroll' , 'OFF') ;//8.0.0.0

        mm.CONFIG_LAYOUT_LOADMASK_IMG            := IniFile.ReadString('Layout' , 'loadmaskfile' , '10|dash-circle-2.svg') ;
        mm.CONFIG_LAYOUT_LOADMASK_TYPE           := IniFile.ReadString('Layout' , 'loadmasktype' , '') ;
        mm.CONFIG_LAYOUT_GRID_TITLE_BOLD         := IniFile.ReadString('Layout' , 'grids_title_bold' , 'ON') ;
        mm.CONFIG_LAYOUT_GRID_TITLE_UPPER        := IniFile.ReadString('Layout' , 'grids_title_upper' , 'OFF') ;
        mm.CONFIG_LAYOUT_SCROLLBAR_SIZE          := IniFile.ReadString('Layout' , 'scroll_bar_size' , '8') ;
        mm.CONFIG_LAYOUT_SCROLLBAR_MOBILE_OFF    := IniFile.ReadString('Layout' , 'scroll_bar_mobileoff' , 'OFF') ; // 6.0.0.0
        mm.CONFIG_LAYOUT_GRID_COLUMN_SEPARATOR   := IniFile.ReadString('Layout' , 'grid_column_separator' ,'OFF' ) ;
        mm.CONFIG_LAYOUT_GRID_ROW_HEIGHT         := IniFile.ReadString('Layout' , 'grid_row_height' ,'38' ) ;
        mm.CONFIG_LAYOUT_GRID_TITLE_HEIGHT       := IniFile.ReadString('Layout' , 'grid_title_height' ,'38' ) ;//7.5.0.0
        mm.CONFIG_LAYOUT_GRID_RC_PAGINATOR       := IniFile.ReadString('Layout' , 'grid_rc_paginator' ,'OFF' ) ;
        mm.CONFIG_LAYOUT_GRID_FONT_SIZE          := IniFile.ReadString('Layout' , 'grid_font_size' ,'11' ) ; // 6.0.0.0 //equivale a Calibri 15px
        mm.CONFIG_LAYOUT_GRID_TITLE_FONT_SIZE    := IniFile.ReadString('Layout' , 'grid_title_font_size' ,'11' ) ; // 6.0.0.0 //equivale a Calibri 15px

        // Currency
        mm.CONFIG_CURRENCY_SYMBOL      := IniFile.ReadString( 'App', 'currency_symbol', '');
        mm.CONFIG_CURRENCY_NAME        := IniFile.ReadString( 'App', 'currency_name', '');
        mm.CONFIG_CURRENCY_NAME_PLURAL := IniFile.ReadString( 'App', 'currency_name_plural', '');

        mm.CONFIG_LOGIN_MODEL          := IniFile.ReadString( 'App' , 'login_model'   , '1') ;
        mm.CONFIG_LOGIN_BG_IMAGE       := IniFile.ReadString( 'App' , 'login_bg'      , 'ON') ;
        mm.CONFIG_LOGIN_BG_VIDEO       := IniFile.ReadString( 'App' , 'login_bg_video', 'OFF') ;
        mm.CONFIG_LOGIN_BG_IMAGE_EXTRA := IniFile.ReadString( 'App' , 'login_bg_extra' , 'ON') ;
        mm.CONFIG_LOGIN_BG_FIXED       := IniFile.ReadString( 'App' , 'login_bg_fixed' , 'OFF') ;
        mm.CONFIG_LAYOUT_LOGIN_BG_SOLID:= IniFile.ReadString( 'App' , 'login_bg_solid' , 'OFF') ; //7.5.0.0 login
        mm.CONFIG_LOGIN_BG_IMAGE_INVERTED := IniFile.ReadString( 'App' , 'login_bg_inverted'      , 'OFF') ;
        mm.CONFIG_LOGIN_LANGUAGE       := IniFile.ReadString( 'App' , 'login_language', 'ON') ;
        mm.CONFIG_LOGIN_WELCOMEBOX     := IniFile.ReadString( 'App' , 'login_welcome' , 'ON') ;
        // 6.0.0.0
        mm.CONFIG_RC_TRANSLATE        := IniFile.ReadString( 'App' , 'translate' , 'ON') ;
        mm.CONFIG_RC_GUIDETOUR        := IniFile.ReadString( 'App' , 'guidetour' , 'OFF') ;
        mm.CONFIG_APP_BUTTON_NOFOCUS  := IniFile.ReadString( 'App' , 'app_button_nofocus' , 'OFF' ) ;//7.0.0.0 nofocus
      IniFile.Free;

      // configure your settings
      case mm.varLT_Lang of
           ltpt_BR, ltpt_PT : begin
                       sm.ConnectionFailureRecovery.ErrorMessage := 'Erro na Conexão';
                       sm.ConnectionFailureRecovery.RetryMessage := 'Tentando Novamente...';
                       mm.ServerMessages.InvalidSessionMessage   := 'Sessão Inválida ou tempo de sessão expirado';
                       //mm.ServerMessages.LoadingMessage          := 'Carregando...';
                       mm.ServerMessages.TerminateMessage        := 'Sessão Finalizada';
                       mm.ServerMessages.UnavailableErrMsg       := 'Erro de Comunicação';

                       PFmtSettings.DateSeparator                := '/';
                       PFmtSettings.CurrencyFormat               := 0;
                       PFmtSettings.CurrencyString               := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', PFmtSettings.CurrencyString, mm.CONFIG_CURRENCY_SYMBOL ); // 6.0.0.0                       PFmtSettings.CurrencyString               := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', 'R$', mm.CONFIG_CURRENCY_SYMBOL );
                       PFmtSettings.ShortDateFormat              := 'dd/MM/yyyy';//'dd/mm/yyyy';

                       PFmtSettings.ThousandSeparator            := '.';
                       PFmtSettings.DecimalSeparator             := ',';
                       mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '0##';
                    end;
           lten_US: begin
                    sm.ConnectionFailureRecovery.ErrorMessage := 'Connection error';
                    sm.ConnectionFailureRecovery.RetryMessage := 'Retrying ...';
                    mm.ServerMessages.InvalidSessionMessage   := 'Invalid session or session time expired';
                    //mm.ServerMessages.LoadingMessage          := 'Loading ...';
                    mm.ServerMessages.TerminateMessage        := 'Session Ended';
                    mm.ServerMessages.UnavailableErrMsg       := 'Communication Error';

                    PFmtSettings.CurrencyString               := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', PFmtSettings.CurrencyString, mm.CONFIG_CURRENCY_SYMBOL ); // 6.0.0.0                    PFmtSettings.CurrencyString            := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', 'US$', mm.CONFIG_CURRENCY_SYMBOL );
                    PFmtSettings.ShortDateFormat              := 'MM/dd/yyyy';

                    PFmtSettings.ThousandSeparator            := ',';
                    PFmtSettings.DecimalSeparator             := '.';
                    mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '00##';
                  end;

           lten_GB: begin
                    sm.ConnectionFailureRecovery.ErrorMessage := 'Connection error';
                    sm.ConnectionFailureRecovery.RetryMessage := 'Retrying ...';
                    mm.ServerMessages.InvalidSessionMessage   := 'Invalid session or session time expired';
                    //mm.ServerMessages.LoadingMessage          := 'Loading ...';
                    mm.ServerMessages.TerminateMessage        := 'Session Ended';
                    mm.ServerMessages.UnavailableErrMsg       := 'Communication Error';

                    PFmtSettings.CurrencyString               := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', PFmtSettings.CurrencyString, mm.CONFIG_CURRENCY_SYMBOL ); // 6.0.0.0                    PFmtSettings.CurrencyString               := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', '£', mm.CONFIG_CURRENCY_SYMBOL );
                    PFmtSettings.ShortDateFormat              := 'dd/MM/yyyy';//'dd/mm/yyyy';
                     PFmtSettings.ThousandSeparator            := '.';
                     PFmtSettings.DecimalSeparator             := ',';
                    mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '0##';
                  end;
           ltes_ES: begin
                    sm.ConnectionFailureRecovery.ErrorMessage := 'Error de conexión';
                    sm.ConnectionFailureRecovery.RetryMessage := 'Reintentando ...';
                    mm.ServerMessages.InvalidSessionMessage   := 'Sesión inválida o tiempo de sesión expirado';
                    //mm.ServerMessages.LoadingMessage          := 'Cargando ...';
                    mm.ServerMessages.TerminateMessage        := 'Sesión finalizada';
                    mm.ServerMessages.UnavailableErrMsg       := 'Error de comunicación';

                    PFmtSettings.CurrencyString               := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', PFmtSettings.CurrencyString, mm.CONFIG_CURRENCY_SYMBOL ); // 6.0.0.0                    PFmtSettings.CurrencyString            := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', '£', mm.CONFIG_CURRENCY_SYMBOL );
                    PFmtSettings.ShortDateFormat           := 'dd/MM/yyyy'; //'d/m/y'; // 6.0.0.0
                     PFmtSettings.ThousandSeparator            := '.';
                     PFmtSettings.DecimalSeparator             := ',';
                    mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '0##';
                  end;
           ltfr_FR: begin
                     sm.ConnectionFailureRecovery.ErrorMessage := 'Erreur de connexion';
                     sm.ConnectionFailureRecovery.RetryMessage := 'Réessayer...';
                     mm.ServerMessages.InvalidSessionMessage   := 'Session invalide pour la durée de session expirée';
                     //mm.ServerMessages.LoadingMessage          := 'Chargement...';
                     mm.ServerMessages.TerminateMessage        := 'Session terminée';
                     mm.ServerMessages.UnavailableErrMsg       := 'Erreur de communication';

                    PFmtSettings.CurrencyString               := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', PFmtSettings.CurrencyString, mm.CONFIG_CURRENCY_SYMBOL ); // 6.0.0.0                    PFmtSettings.CurrencyString            := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', '£', mm.CONFIG_CURRENCY_SYMBOL ); ;
                    PFmtSettings.ShortDateFormat           := 'dd/MM/yyyy'; //'d/m/y'; // 6.0.0.0
                     PFmtSettings.ThousandSeparator            := '.';
                     PFmtSettings.DecimalSeparator             := ',';
                    mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '0##';
                  end;
           ltde_DE: begin
                     sm.ConnectionFailureRecovery.ErrorMessage := 'Verbindungsfehler';
                     sm.ConnectionFailureRecovery.RetryMessage := 'Wiederholen ...';
                     mm.ServerMessages.InvalidSessionMessage   := 'Ungültige Sitzung für abgelaufene Sitzungszeit';
                     //mm.ServerMessages.LoadingMessage          := 'Wird geladen ...';
                     mm.ServerMessages.TerminateMessage        := 'Sitzung beendet';
                     mm.ServerMessages.UnavailableErrMsg       := 'Kommunikationsfehler';

                     PFmtSettings.CurrencyString               := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', PFmtSettings.CurrencyString, mm.CONFIG_CURRENCY_SYMBOL ); // 6.0.0.0                    PFmtSettings.CurrencyString            := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', '£', mm.CONFIG_CURRENCY_SYMBOL );
                     PFmtSettings.ShortDateFormat           := 'dd/MM/yyyy'; //'d/m/y'; // 6.0.0.0
                     PFmtSettings.ThousandSeparator            := '.';
                     PFmtSettings.DecimalSeparator             := ',';
                     mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '0##';
                  end;
           ltit_IT: begin
                     sm.ConnectionFailureRecovery.ErrorMessage := 'Errore di connessione';
                     sm.ConnectionFailureRecovery.RetryMessage := 'Riprova in corso...';
                     mm.ServerMessages.InvalidSessionMessage   := 'Sessione non valida per sessione scaduta';
                     //mm.ServerMessages.LoadingMessage          := 'Caricamento in corso...';
                     mm.ServerMessages.TerminateMessage        := 'Sessione terminata';
                     mm.ServerMessages.UnavailableErrMsg       := 'Errore di comunicazione';

                     PFmtSettings.CurrencyString               := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', PFmtSettings.CurrencyString, mm.CONFIG_CURRENCY_SYMBOL ); // 6.0.0.0                     PFmtSettings.CurrencyString            := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', '£', mm.CONFIG_CURRENCY_SYMBOL );
                     PFmtSettings.ShortDateFormat           := 'dd/MM/yyyy'; //'d/m/y'; // 6.0.0.0
                     PFmtSettings.ThousandSeparator            := '.';
                     PFmtSettings.DecimalSeparator             := ',';
                     mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '0##';
                  end;
           lttr_TR : begin
                     sm.ConnectionFailureRecovery.ErrorMessage := 'Bağlantı hatası';
                     sm.ConnectionFailureRecovery.RetryMessage := 'Yeniden deneniyor...';
                     mm.ServerMessages.InvalidSessionMessage   := 'Süresi dolmuş oturum süresi için geçersiz oturum';
                     //mm.ServerMessages.LoadingMessage          := 'Yükleniyor...';
                     mm.ServerMessages.TerminateMessage        := 'Oturum sonlandırıldı';
                     mm.ServerMessages.UnavailableErrMsg       := 'İletişim hatası';

                     PFmtSettings.CurrencyString               := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', PFmtSettings.CurrencyString, mm.CONFIG_CURRENCY_SYMBOL ); // 6.0.0.0                    PFmtSettings.CurrencyString            := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', 'TRY', mm.CONFIG_CURRENCY_SYMBOL );
                     PFmtSettings.ShortDateFormat           := 'dd/MM/yyyy'; //'d/m/y'; // 6.0.0.0
                     PFmtSettings.ThousandSeparator            := '.';
                     PFmtSettings.DecimalSeparator             := ',';
                     mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '0##';
                  end;
           ltru_RU : begin
                     sm.ConnectionFailureRecovery.ErrorMessage := 'Ошибка подключения';
                     sm.ConnectionFailureRecovery.RetryMessage := 'Повторная попытка ...';
                     mm.ServerMessages.InvalidSessionMessage   := 'Недействительный сеанс или время сеанса истекло';
                     //mm.ServerMessages.LoadingMessage          := 'Загрузка ...';
                     mm.ServerMessages.TerminateMessage        := 'Сеанс завершен';
                     mm.ServerMessages.UnavailableErrMsg       := 'Ошибка связи';

                     PFmtSettings.CurrencyString               := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', PFmtSettings.CurrencyString, mm.CONFIG_CURRENCY_SYMBOL ); // 6.0.0.0
                     PFmtSettings.ShortDateFormat           := 'dd/MM/yyyy'; //'d/m/y'; // 6.0.0.0
                     PFmtSettings.ThousandSeparator            := '.';
                     PFmtSettings.DecimalSeparator             := ',';
                     mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '0##';
                  end;
          ltzn_CH : begin
                    sm.ConnectionFailureRecovery.ErrorMessage := 'Connection error';
                    sm.ConnectionFailureRecovery.RetryMessage := 'Retrying ...';
                    mm.ServerMessages.InvalidSessionMessage   := 'Invalid session or session time expired';
                    //mm.ServerMessages.LoadingMessage          := 'Loading ...';
                    mm.ServerMessages.TerminateMessage        := 'Session Ended';
                    mm.ServerMessages.UnavailableErrMsg       := 'Communication Error';

                    PFmtSettings.CurrencyString               := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', PFmtSettings.CurrencyString, mm.CONFIG_CURRENCY_SYMBOL ); // 6.0.0.0                    PFmtSettings.CurrencyString            := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', '¥', mm.CONFIG_CURRENCY_SYMBOL ); ;
                    PFmtSettings.ShortDateFormat           := 'dd/MM/yyyy'; //'d/m/y'; // 6.0.0.0
                    PFmtSettings.ThousandSeparator            := '.';
                    PFmtSettings.DecimalSeparator             := ',';
                    mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '00##';
                  end;
          ltin_ID : begin
                    sm.ConnectionFailureRecovery.ErrorMessage := 'Connection error';
                    sm.ConnectionFailureRecovery.RetryMessage := 'Retrying ...';
                    mm.ServerMessages.InvalidSessionMessage   := 'Invalid session or session time expired';
                    //mm.ServerMessages.LoadingMessage          := 'Loading ...';
                    mm.ServerMessages.TerminateMessage        := 'Session Ended';
                    mm.ServerMessages.UnavailableErrMsg       := 'Communication Error';

                    PFmtSettings.CurrencyString               := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', PFmtSettings.CurrencyString, mm.CONFIG_CURRENCY_SYMBOL ); // 6.0.0.0                    PFmtSettings.CurrencyString            := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', 'Rp', mm.CONFIG_CURRENCY_SYMBOL ); ;
                    PFmtSettings.ShortDateFormat           := 'dd/MM/yyyy';
                    PFmtSettings.ThousandSeparator            := '.';
                    PFmtSettings.DecimalSeparator             := ',';
                    mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '00##';
                  end;
          ltth_TH : begin
                    sm.ConnectionFailureRecovery.ErrorMessage := 'Connection error';
                    sm.ConnectionFailureRecovery.RetryMessage := 'Retrying ...';
                    mm.ServerMessages.InvalidSessionMessage   := 'Invalid session or session time expired';
                    //mm.ServerMessages.LoadingMessage          := 'Loading ...';
                    mm.ServerMessages.TerminateMessage        := 'Session Ended';
                    mm.ServerMessages.UnavailableErrMsg       := 'Communication Error';

                    PFmtSettings.CurrencyString               := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', PFmtSettings.CurrencyString, mm.CONFIG_CURRENCY_SYMBOL ); // 6.0.0.0
                    PFmtSettings.ShortDateFormat              := 'dd/MM/yyyy'; //'d/m/y'; // 6.0.0.0
                    PFmtSettings.ThousandSeparator            := '.';
                    PFmtSettings.DecimalSeparator             := ',';
                    mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '00##';
                  end;
          lthi_IN : begin
                    sm.ConnectionFailureRecovery.ErrorMessage := 'Connection error';
                    sm.ConnectionFailureRecovery.RetryMessage := 'Retrying ...';
                    mm.ServerMessages.InvalidSessionMessage   := 'Invalid session or session time expired';
                    //mm.ServerMessages.LoadingMessage          := 'Loading ...';
                    mm.ServerMessages.TerminateMessage        := 'Session Ended';
                    mm.ServerMessages.UnavailableErrMsg       := 'Communication Error';

                    PFmtSettings.CurrencyString               := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', PFmtSettings.CurrencyString, mm.CONFIG_CURRENCY_SYMBOL ); // 6.0.0.0
                    PFmtSettings.ShortDateFormat              := 'dd/MM/yyyy'; //'d/m/y'; // 6.0.0.0
                    PFmtSettings.ThousandSeparator            := '.';
                    PFmtSettings.DecimalSeparator             := ',';
                    mm.varC_Mask_float                        := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '00##';
                  end;
          ltar_SA : begin
                     sm.ConnectionFailureRecovery.ErrorMessage := 'خطأ في الإتصال';
                     sm.ConnectionFailureRecovery.RetryMessage := 'حاول مجددا ...';
                     mm.ServerMessages.InvalidSessionMessage   := 'انتهت الجلسة أو وقت الجلسة غير صالح';
                     //mm.ServerMessages.LoadingMessage          := 'جار التحميل...';
                     mm.ServerMessages.TerminateMessage        := 'انتهت الجلسة';
                     mm.ServerMessages.UnavailableErrMsg       := 'خطأ في الاتصال';

                    PFmtSettings.CurrencyString                := varIIF( mm.CONFIG_CURRENCY_SYMBOL = '', PFmtSettings.CurrencyString, mm.CONFIG_CURRENCY_SYMBOL ); // 6.0.0.0
                    PFmtSettings.ShortDateFormat               := 'dd/MM/yyyy'; //'d/m/y'; // 6.0.0.0

                    PFmtSettings.ThousandSeparator             := ',';
                    PFmtSettings.DecimalSeparator              := '.';
                    mm.varC_Mask_float                         := PFmtSettings.ThousandSeparator + '0' + PFmtSettings.DecimalSeparator + '0##';
                  end;
      end;

      //RadCORE - Terminate Template
      with sm.ServerMessages do
      begin
        TerminateTemplate.Text := StringReplace( TerminateTemplate.Text, '[[MSGAPPSESSIONOVER]]', APP_NAME + '-' + TerminateMessage, [rfReplaceAll] );
        TerminateTemplate.Text := StringReplace( TerminateTemplate.Text, '[[MSGSESSIONOVER]]', TerminateMessage, [rfReplaceAll] );
        TerminateTemplate.Text := StringReplace( TerminateTemplate.Text, '[[WEBSITE]]', SOFTWAREHOUSE_SITE, [rfReplaceAll] );
      end;
      if Copy( lowercase( PFmtSettings.ShortDateFormat ), 1, 1 ) = 'm' then //7.5.0.3 lowercase
         mm.APP_SQL_DATE_FORMAT  := 'mm/dd/yyyy'
      else
         mm.APP_SQL_DATE_FORMAT  := 'dd/mm/yyyy';
      {<*RC DB}
      if Pos( 'FIREBIRD' , mm.CONFIG_DATABASE ) > 0  then
         mm.APP_SQL_DATE_FORMAT := StringReplace( mm.APP_SQL_DATE_FORMAT, '/', '.', [rfReplaceAll] );{RC DB*>}
      // 6.0.0.0
      sm.CustomFiles.Clear;
      //8.2.0.0
      if ( mm.CONFIG_LAYOUT_BSICONS = 'ON' ) then
      begin
         sm.CustomFiles.Add( '<link rel="stylesheet" href="files/css/bootstrap-icons/bootstrap-icons.css">');
      end;
      if ( mm.CONFIG_LAYOUT_FONTAWS = '6' ) then
      begin
         sm.CustomFiles.Add( '<link rel="stylesheet" href="files/css/font-awesome6/css/all.css">');
         //sm.CustomFiles.Add( '<link rel="stylesheet" href="files/css/font-awesome6-pro/css/all.css">');
      end
      else
      if ( mm.CONFIG_LAYOUT_FONTAWS = '7' ) then
      begin
         sm.CustomFiles.Add( '<link rel="stylesheet" href="files/css/font-awesome7/css/all.css">');
         //sm.CustomFiles.Add( '<link rel="stylesheet" href="files/css/font-awesome7-pro/css/all.css">');
      end;

      // CSS
      sm.CustomCSS.Clear;
      // don´t load radcore css if is acessing /server
      if sm.tag <> 1 then//8.0.0.0
      begin
         mm.varC_TempFile := '';
         if FileExists( sm.FilesFolderPath + 'css' + mm.BACKSLASH + 'servermodule_customcss_userdef.css' ) then
         begin
            sm.CustomCSS.LoadFromFile( sm.FilesFolderPath + 'css' + mm.BACKSLASH + 'servermodule_customcss_userdef.css' );
            mm.varC_TempFile := sm.CustomCSS.Text;
            sm.CustomCSS.Clear;
         end;
         //FontAwesomePRO não precisa | FontAwesomePRO do not need this
         //8.2.0.0
         if StrToIntDef( mm.CONFIG_LAYOUT_FONTAWS, 5 ) >= 6 then
         begin
            if ( FileExists( sm.FilesFolderPath + 'css' + mm.BACKSLASH + 'servermodule_customcss_fontaws' + mm.CONFIG_LAYOUT_FONTAWS + '.css' ) ) then
            begin
               sm.CustomCSS.LoadFromFile( sm.FilesFolderPath + 'css' + mm.BACKSLASH + 'servermodule_customcss_fontaws' + mm.CONFIG_LAYOUT_FONTAWS + '.css' );
               mm.varC_TempFile := mm.varC_TempFile + sm.CustomCSS.Text;
               sm.CustomCSS.Clear;
            end;
         end;

         if FileExists( sm.FilesFolderPath + 'css' + mm.BACKSLASH + 'servermodule_customcss.css' ) then
         begin
            sm.CustomCSS.LoadFromFile( sm.FilesFolderPath + 'css' + mm.BACKSLASH + 'servermodule_customcss.css' );

            if mm.varC_TempFile <> '' then
            begin
               sm.CustomCSS.Add( mm.varC_TempFile );
            end;
         end;

         sm.CustomMETA.Clear;
         sm.CustomMETA.Add( '<link rel="preconnect" href="https://fonts.googleapis.com">');
         sm.CustomMETA.Add( '<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>');                                                        //:ital.wght

         cTemp := rc_StripHtmlTags( mm.CONFIG_LAYOUT_APP_FONT ) ;
         cTemp := StringReplace( cTemp, ' ', '+', [rfReplaceAll] );
         if Pos( ':', cTemp ) > 0 then
         begin
            sm.CustomMETA.Add( '<link href="https://fonts.googleapis.com/css2?family=' + cTemp + '&display=swap" rel="stylesheet">' );
         end
         else
            sm.CustomMETA.Add( '<link href="https://fonts.googleapis.com/css2?family=' + cTemp + ':ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">' );
         //6.0.0.1
         // RTL TreeMenu
         //     This was (or is) an attempt to apply css for when RTL is active.
         //     I don't understand anything about RTL, but I wanted to make this small attempt.
         //     Maybe it can be an IDEA for someone in need...
         //     I have no way of supporting RTL as it is not natural for me,
         //     I am just trying to help so that everyone can apply the rules correctly.
         if ( not mm.RTL ) then  // You can create an option in THEME CONTROL to ON / OFF.
         begin
             //6.0.0.1
             cMenuExpandIcon := '\f105';
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[FLOAT-BTN-RTL]]' ,
                                                 'right:24px;' ,  //7.0.0.0 to ajust below "tawk.to" window
                                                 [rfReplaceAll] );
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[TREEMENU-PADD-RTL]]' ,
                                                 'padding: 2px 2px 0px 2px;' ,
                                                 [rfReplaceAll] );
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[TREEMENU-PADDCLONE-RTL]]' ,
                                                 'padding: 2px 2px 0px 2px;margin-left: -5px;' ,
                                                 [rfReplaceAll] );
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[TREEMENU-RTL]]' ,
                                                 '' ,
                                                 [rfReplaceAll] );
             //8.0.0.0
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[FORM_TRIGGER-DEFAULT]]' ,
                                                 'padding-right: 0.6em;' +
                                                 'border-top-left-radius: 0px !important;' +
                                                 'border-bottom-left-radius: 0px !important;' ,
                                                 [rfReplaceAll] );

             // Feedbak ammar add Feedbak From Raafat
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[RTL-TEXTALIGN]]' ,
                                                 '' ,
                                                 [rfReplaceAll] );
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[RTL-EXPANDER]]' ,
                                                 '' ,
                                                 [rfReplaceAll] );

             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[RTL-ALIGN-BTN-CAPTION]]' ,
                                                 'margin-left: 5px !important;' ,
                                                 [rfReplaceAll] );
         end
         else
         begin
             // Put your CSS here
             //6.0.0.1
             cMenuExpandIcon := '\f104';
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[FLOAT-BTN-RTL]]' ,
                                                 'left:80px;' ,
                                                 [rfReplaceAll] );
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[TREEMENU-PADD-RTL]]' ,
                                                 'padding: 2px 2px 0px 0px;' ,
                                                 [rfReplaceAll] );
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[TREEMENU-PADDCLONE-RTL]]' ,
                                                 'padding: 2px 2px 0px 0px;margin-right: -5px;' ,
                                                 [rfReplaceAll] );
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[TREEMENU-RTL]]' ,
                                                 '.x-treelist-nav .x-treelist-item-expander {' +
                                                 '    right: 230px;' + // 6.0.0.1
                                                 '}' +
                                                 '.x-treelist-nav {' +
                                                 '  text-align: right;' +
                                                 '}' ,
                                                 [rfReplaceAll] );
             //8.0.0.0 edit border
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[FORM_TRIGGER-DEFAULT]]' ,
                                                 'padding-right: 0.8em;' +
                                                 'border-top-left-radius: 0px !important;' +
                                                 'border-bottom-left-radius: 0px !important;' ,
                                                 [rfReplaceAll] );
            // Feedbak ammar add Feedbak From Raafat
            sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                '[[RTL-TEXTALIGN]]' ,
                                                'text-align: right;' ,
                                                [rfReplaceAll] );
            sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                '[[RTL-EXPANDER]]' ,
                                                'right: 245px;' , //6.0.0.1
                                                [rfReplaceAll] );

            sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                '[[RTL-ALIGN-BTN-CAPTION]]' ,
                                                'margin-right: 5px !important;' ,
                                                [rfReplaceAll] );
         end;
         //8.2.0.0
         if ( mm.CONFIG_LAYOUT_FONTAWS = '5' ) then
         begin
            //fontaws-5
            sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                '[[TREEMENU-FAW6-RTL]]' ,
                                                '' ,
                                                [rfReplaceAll] );
            sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                '[[TREEMENU-FAW5-RTL]]' ,

                                                '.x-treelist-item-expander:after {' +
                                                '    content: ''' + cMenuExpandIcon + ''';' +
                                                //'    content: ''\f0da'';' +
                                                //'    font: 16px/32px ''FontAwesome'' !important;' +
                                                '}' +
                                                '.x-treelist-item-expanded > * > * > .x-treelist-item-expander:after {' +
                                                '    content: ''\f107'';' +
                                                //'    content: ''\f0d7'';' +
                                                //'    font: 16px/32px ''FontAwesome'' !important;' +
                                                '}' +
                                                '.x-treelist-item-expanded > .x-treelist-item-expander:after {' +
                                                '    content: ''\f107'';' +
                                                //'    content: ''\f0d7'';' +
                                                //'    font: 16px/1 ''FontAwesome'' !important;' +
                                                '}' +
                                                '.x-treelist-item-collapsed > * > .x-treelist-item-expander:after {' +
                                                '    content: ''' + cMenuExpandIcon + ''';' +
                                                //'    content: ''\f0da'';' +
                                                //'    font: 16px/1 ''FontAwesome'' !important;' +
                                                '}' ,
                                                [rfReplaceAll] );
         end
         else
         begin
            sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                '[[TREEMENU-FAW5-RTL]]' ,
                                                '' ,
                                                [rfReplaceAll] );
            sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                '[[TREEMENU-FAW6-RTL]]' ,

                                                '.x-treelist-item-expander:after {' +
                                                '    content: ''' + cMenuExpandIcon + ''';' +
                                                //'    content: ''\f0da'';' +
                                                '    font: 16px/32px ''FontAwesome'' !important;' +
                                                '}' +
                                                '.x-treelist-item-expanded > * > * > .x-treelist-item-expander:after {' +
                                                '    content: ''\f107'';' +
                                                //'    content: ''\f0d7'';' +
                                                '    font: 16px/32px ''FontAwesome'' !important;' +
                                                '}' +
                                                '.x-treelist-item-expanded > .x-treelist-item-expander:after {' +
                                                '    content: ''\f107'';' +
                                                //'    content: ''\f0d7'';' +
                                                '    font: 16px/1 ''FontAwesome'' !important;' +
                                                '}' +
                                                '.x-treelist-item-collapsed > * > .x-treelist-item-expander:after {' +
                                                '    content: ''' + cMenuExpandIcon + ''';' +
                                                //'    content: ''\f0da'';' +
                                                '    font: 16px/1 ''FontAwesome'' !important;' +
                                                '}' ,
                                                [rfReplaceAll] );
         end;

         if ( mm.CONFIG_LAYOUT_LABEL_FORMS_DEFAULT = 'ON' ) then
         begin
             cLabelColor := GetWebColor( mm.CONFIG_LAYOUT_LABEL_COLOR );

             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[LABEL_FORMS_DEFAULT]]' ,
                                                 'label:not(.form-check-label):not(.custom-file-label):not(.rc-label-clear){ ' +
                                                 '     font-weight: ' + mm.CONFIG_LAYOUT_LABEL_WEIGHT + ' !important;' +
                                                 //'     font-size:14px !important; ' + //12px 6.0.0.0
                                                 '     color : ' + cLabelColor + ';' +

                                                 '   -moz-user-select: -moz-none;' +
                                                 '   -khtml-user-select: none;' +
                                                 '   -webkit-user-select: none;' +
                                                 '   -ms-user-select: none;' +
                                                 '   user-select: none;' +
                                                 //
                                                 '     [[LABEL_WRAP]]' +
                                                 ' }' ,
                                                 [rfReplaceAll] );
         end
         else
         begin
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[LABEL_FORMS_DEFAULT]]' ,
                                                 '' ,
                                                 [rfReplaceAll] );
         end;
         //8.0.0.0 grid
         if ( mm.CONFIG_LAYOUT_GRID_COLUMN_SEPARATOR = 'OFF' ) then
         begin
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                        '[[GRID-COLUMN-SEPARATOR]]' ,
                                        'border: 0px !important;',
                                        [rfReplaceAll] );
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                        '[[GRID-COLUMN-SEPARATOR-TITLE]]' ,
                                        '.x-column-header{ border-right: 0px !important; }',
                                        [rfReplaceAll] );
         end
         else
         begin
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[GRID-COLUMN-SEPARATOR]]' ,
                                                 '',
                                                 [rfReplaceAll] );
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                        '[[GRID-COLUMN-SEPARATOR-TITLE]]' ,
                                        '',
                                        [rfReplaceAll] );
         end;
         sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                             '[[GRID-ROW-HEIGHT]]' ,
                                             mm.CONFIG_LAYOUT_GRID_ROW_HEIGHT,
                                             [rfReplaceAll] );
         //7.5.0.0
         sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                             '[[GRID-TITLE-HEIGHT]]' ,
                                             mm.CONFIG_LAYOUT_GRID_TITLE_HEIGHT,
                                             [rfReplaceAll] );

         if ( mm.CONFIG_LAYOUT_LABEL_WRAP = 'OFF' ) then
         begin
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[LABEL_WRAP]]' ,
                                                 'white-space: nowrap;' ,
                                                 [rfReplaceAll] );
         end
         else
         begin
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[LABEL_WRAP]]' ,
                                                 '' ,
                                                 [rfReplaceAll] );
         end;
         //8.2.0.0
         if ( mm.CONFIG_LAYOUT_FONTAWS = '5' ) then
         begin
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[FONTAWS_VERSION]]' ,
                                                 '"Font Awesome 5 Free"',
                                                 [rfReplaceAll] );
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[INPUTICON_FONTAWS_PADDING]]' ,
                                                 'padding: 0.8em 0.5em ;',
                                                 [rfReplaceAll] );
         end
         else
         begin
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[FONTAWS_VERSION]]' ,
                                                 '"FontAwesome","Font Awesome ' + mm.CONFIG_LAYOUT_FONTAWS + ' Duotone"',
                                                 [rfReplaceAll] );
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[INPUTICON_FONTAWS_PADDING]]' ,
                                                 'padding: 1.2em 0.5em ;',
                                                 [rfReplaceAll] );
         end;
         // 6.0.0.0 hide scrollbars on mobile
         if ( mm.varB_Mobile_Screen ) and ( mm.CONFIG_LAYOUT_SCROLLBAR_MOBILE_OFF = 'ON' ) then
         begin
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[MOBILE-HIDE-SCROLLBARS]]' ,
                                                 'html, body  {' +
                                                 'overflow: scroll;' +
                                                 'overflow-x: hidden;' +
                                                 'overflow-y: hidden;' +
                                                 '}' +
                                                 '::-webkit-scrollbar {' +
                                                 'width: 0px !important; ' + // /* remove scrollbar space */' +
                                                 'height: 0px !important; ' + // /* remove scrollbar space */' +
                                                 'background: transparent; ' + // /* optional: just make scrollbar invisible */' +
                                                 '}' +
                                                 '/* optional: show position indicator in red */' +
                                                 '::-webkit-scrollbar-thumb {' +
                                                 //'/*background: #FF0000 !important;*/' +
                                                 '}',
                                                 [rfReplaceAll] );
         end
         else
         begin
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                 '[[MOBILE-HIDE-SCROLLBARS]]' ,
                                                 '' ,
                                                 [rfReplaceAll] );
         end;
         //7.0.0.0
         begin
              if ( mm.CONFIG_LAYOUT_ROUND_EDIT = 'ON' ) then
              begin
                 //7.5.0.0
                 sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                     '[[BORDER_CARD_ROUNDED]]' ,
//                                                     '.25rem', // mm.CONFIG_LAYOUT_ROUND_PANEL_FACTOR + 'px',
                                                     mm.CONFIG_LAYOUT_ROUND_PANEL_FACTOR + 'px',
                                                     [rfReplaceAll] );
                 sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                     '[[BORDER_ROUNDED]]' ,
                                                     mm.CONFIG_LAYOUT_ROUND_PANEL_FACTOR + 'px',
                                                     [rfReplaceAll] );
                 //8.0.0.0 [[EDIT_ROUNDED]] [[BTN_ROUNDED]]
                 sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                     '[[EDIT_ROUNDED]]' ,
                                                     mm.CONFIG_LAYOUT_ROUND_EDIT_FACTOR + 'px',
                                                     [rfReplaceAll] );
                 sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                     '[[BTN_ROUNDED]]' ,
                                                     mm.CONFIG_LAYOUT_ROUND_BTN_FACTOR + 'px',
                                                     [rfReplaceAll] );
                 //7.0.0.0
                 sm.CustomCSS.Text :=
                    StringReplace( sm.CustomCSS.Text ,
                                   '[[BTN_BORDER_ROUNDED]]' ,
                                   '-moz-border-radius: ' + mm.CONFIG_LAYOUT_ROUND_BTN_FACTOR + 'px;' +
                                   '-webkit-border-radius: ' + mm.CONFIG_LAYOUT_ROUND_BTN_FACTOR + 'px;' +
                                   '-ms-border-radius: ' + mm.CONFIG_LAYOUT_ROUND_BTN_FACTOR + 'px;' +
                                   '-o-border-radius: ' + mm.CONFIG_LAYOUT_ROUND_BTN_FACTOR + 'px;' +
                                   'border-radius: ' + mm.CONFIG_LAYOUT_ROUND_BTN_FACTOR + 'px;' ,
                                   [rfReplaceAll] );
                 //7.0.0.0
                 sm.CustomCSS.Text :=
                    StringReplace( sm.CustomCSS.Text ,
                                   '[[EDIT_BORDER_ROUNDED]]' ,
                                   '-moz-border-radius: ' + mm.CONFIG_LAYOUT_ROUND_EDIT_FACTOR + 'px;' +
                                   '-webkit-border-radius: ' + mm.CONFIG_LAYOUT_ROUND_EDIT_FACTOR + 'px;' +
                                   '-ms-border-radius: ' + mm.CONFIG_LAYOUT_ROUND_EDIT_FACTOR + 'px;' +
                                   '-o-border-radius: ' + mm.CONFIG_LAYOUT_ROUND_EDIT_FACTOR + 'px;' +
                                   'border-radius: ' + mm.CONFIG_LAYOUT_ROUND_EDIT_FACTOR + 'px;' ,
                                   [rfReplaceAll] );

                 sm.CustomCSS.Text :=
                    StringReplace( sm.CustomCSS.Text ,
                                   '[[INPUTICON_BORDER_ROUNDED]]' ,
                                   'border-radius: ' + mm.CONFIG_LAYOUT_ROUND_EDIT_FACTOR + 'px 0 0 ' + mm.CONFIG_LAYOUT_ROUND_EDIT_FACTOR + 'px;'  ,
                                   [rfReplaceAll] );
              end
              else
              begin
                 // 6.0.0.0
                 sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text ,
                                                     '[[BORDER_CARD_ROUNDED]]' ,
                                                     '0px', // mm.CONFIG_LAYOUT_ROUND_PANEL_FACTOR + 'px',
                                                     [rfReplaceAll] );

                 sm.CustomCSS.Text :=
                    StringReplace( sm.CustomCSS.Text ,
                                   '[[BORDER_ROUNDED]]' ,
                                   '0px' , //6.1.0.06
                                   [rfReplaceAll] );

                 sm.CustomCSS.Text :=
                    StringReplace( sm.CustomCSS.Text ,
                                   '[[BTN_BORDER_ROUNDED]]' ,
                                   '' ,
                                   [rfReplaceAll] );
                 sm.CustomCSS.Text :=
                    StringReplace( sm.CustomCSS.Text ,
                                   '[[EDIT_BORDER_ROUNDED]]' ,
                                   '' ,
                                   [rfReplaceAll] );


                 sm.CustomCSS.Text :=
                    StringReplace( sm.CustomCSS.Text ,
                                   '[[INPUTICON_BORDER_ROUNDED]]' ,
                                   ''  ,
                                   [rfReplaceAll] );
              end;
         end;

        if Pos( '[[LINK_COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[LINK_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_LINK_COLOR ) , [rfReplaceAll] );
        if Pos( '[[LINKHOVER_COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[LINKHOVER_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_LINKHOVER_COLOR ) , [rfReplaceAll] );

        if Pos( '[[APP_FONT]]' , sm.CustomCSS.Text ) > 0 then
        begin
           cTemp := rc_StripHtmlTags( mm.CONFIG_LAYOUT_APP_FONT );
           if Pos( ':', cTemp ) > 0 then
              cTemp := Copy( cTemp, 1, Pos( ':', cTemp ) -1 );
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[APP_FONT]]' , cTemp , [rfReplaceAll] );
        end;

        if Pos( '[[MENU_COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[MENU_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_MENU_COLOR ) , [rfReplaceAll] );

        //7.0.0.0 menuscrollbar-color
        if Pos( '[[MENUSCROLLBAR-COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[MENUSCROLLBAR-COLOR]]' , GetWebColor( ColorToString( COLOR_LIGHT ) ) + ' ' + GetWebColor( mm.CONFIG_LAYOUT_MENU_COLOR ) , [rfReplaceAll] );

        // 6.0.0.0 tree menu theme light
        if Copy( lowercase(mm.CONFIG_LAYOUT_ACTIVE_THEME), 1, 5 ) = 'light'  then
        begin
           if Pos( '[[MENUFONT_COLOR]]' , sm.CustomCSS.Text ) > 0 then
              sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[MENUFONT_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_MENUFONT_COLOR ) + ' !important' , [rfReplaceAll] );
           if Pos( '[[MENUFONT_COLOR_DARK_LIGHT]]' , sm.CustomCSS.Text ) > 0 then
              sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[MENUFONT_COLOR_DARK_LIGHT]]' , GetWebColor( ColorToString( COLOR_DARK ) ) + ' !important' , [rfReplaceAll] );
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[BG-MENU-OVER]]' ,  'rgba(233,236,239,.5)' , [rfReplaceAll] );
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[BG-MENU-SELECT]]' , 'rgba(233,236,239,.5)' , [rfReplaceAll] );
        end
        else
        begin
           if Pos( '[[MENUFONT_COLOR]]' , sm.CustomCSS.Text ) > 0 then
              sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[MENUFONT_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_MENUFONT_COLOR ) , [rfReplaceAll] );
           if Pos( '[[MENUFONT_COLOR_DARK_LIGHT]]' , sm.CustomCSS.Text ) > 0 then
              sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[MENUFONT_COLOR_DARK_LIGHT]]' , GetWebColor( ColorToString( COLOR_LIGHT ) ) + ' !important' , [rfReplaceAll] );
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[BG-MENU-OVER]]' , 'rgba(255,255,255,0.10)' , [rfReplaceAll] );
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[BG-MENU-SELECT]]' , 'rgba(255,255,255,0.10)' , [rfReplaceAll] );
        end;
        //7.5.0.0 menu
        if Pos( '[[MENUFONT_SIZE]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[MENUFONT_SIZE]]' , mm.CONFIG_LAYOUT_MENUFONT_SIZE , [rfReplaceAll] );
        if Pos( '[[MENULINE_HEIGHT]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[MENULINE_HEIGHT]]' , mm.CONFIG_LAYOUT_MENU_LINE_HEIGHT , [rfReplaceAll] );
        if Pos( '[[MENUTEXT_WIDTH]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[MENUTEXT_WIDTH]]' , mm.CONFIG_LAYOUT_MENU_TEXT_WIDTH , [rfReplaceAll] );
        //7.5.0.0 menu
        if Pos( '[[MENUITEM_MAXWIDTH]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[MENUITEM_MAXWIDTH]]' , mm.CONFIG_LAYOUT_MENU_WIDTH + 'px' , [rfReplaceAll] );
        //8.0.0.0
        sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[RTL-XTREELISTNAV]]' , IfThen( mm.RTL, '10', '0' ), [rfReplaceAll] );

        //8.0.0.0
        if Pos( '[[PADDING-BOTTOM]]' , sm.CustomCSS.Text ) > 0 then
        begin
            //sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[PADDING-BOTTOM]]' , 'padding-bottom: 4px !important;' , [rfReplaceAll] );
            sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[PADDING-BOTTOM]]' , 'padding: 0px 4px 2px 10px !important;' , [rfReplaceAll] );
        end;
        if Pos( '[[EDIT_COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[EDIT_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_EDIT_COLOR ) , [rfReplaceAll] );

        //8.0.0.0 edit border
        if Pos( '[[EDIT_LKP_COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[EDIT_LKP_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_EDLKP_COLOR ) , [rfReplaceAll] );
        if Pos( '[[EDIT_READONLY_COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[EDIT_READONLY_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_EDIT_COLOR_READONLY ) , [rfReplaceAll] );
        if Pos( '[[FONT_READONLY_COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[FONT_READONLY_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_READONLY ) , [rfReplaceAll] );

        if Pos( '[[EDIT_FONT_COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[EDIT_FONT_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_EDIT_FONT_COLOR ) , [rfReplaceAll] );

        if Pos( '[[EDIT_COLOR_TRIGGER]]' , sm.CustomCSS.Text ) > 0 then
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[EDIT_COLOR_TRIGGER]]' , GetWebColor( mm.CONFIG_LAYOUT_EDIT_COLOR_TRIGGER ) , [rfReplaceAll] );
        if Pos( '[[EDIT_FONT_COLOR_TRIGGER]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[EDIT_FONT_COLOR_TRIGGER]]' , GetWebColor( mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_TRIGGER ) , [rfReplaceAll] );

        if Pos( '[[GRID_SEL_COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[GRID_SEL_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_GRID_SEL_COLOR ) , [rfReplaceAll] );

        if Pos( '[[GRID-TITLE-BG]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[GRID-TITLE-BG]]' , GetWebColor( mm.CONFIG_LAYOUT_GRID_TITLE_BG ) , [rfReplaceAll] );
        if Pos( '[[GRID-TITLE-COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[GRID-TITLE-COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_GRID_TITLE_COLOR ) , [rfReplaceAll] );
        if Pos( '[[GRID-TITLE-BG-OVER]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[GRID-TITLE-BG-OVER]]' , GetWebColor( mm.CONFIG_LAYOUT_GRID_TITLE_BG_OVER ) , [rfReplaceAll] );
        if Pos( '[[GRID-TITLE-COLOR-OVER]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[GRID-TITLE-COLOR-OVER]]' , GetWebColor( mm.CONFIG_LAYOUT_GRID_TITLE_COLOR_OVER ) , [rfReplaceAll] );
        if Pos( '[[GRID-TITLE-COLOR-ICON]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[GRID-TITLE-COLOR-ICON]]' , GetWebColor( mm.CONFIG_LAYOUT_GRID_TITLE_COLOR_ICON ) , [rfReplaceAll] );

        if Pos( '[[EDIT_FOCUS_COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[EDIT_FOCUS_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_EDIT_FOCUS_COLOR ) , [rfReplaceAll] );
        // 6.0.0.0
        if mm.CONFIG_LAYOUT_TAB_BORDER_OFF = 'ON' then
        begin
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_BORDER_DEFAULT_HEIGHT_FOCUS]]' , '0' , [rfReplaceAll] );
           // THEME FULL - tabs da cor do tema
        end
        else
        begin
             if mm.CONFIG_LAYOUT_TAB_THEME_BORDER = 'ON' then
                sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_COLOR_BORDER_DEFAULT_FOCUS]]' ,GetWebColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD ) , [rfReplaceAll] )
             else
                sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_COLOR_BORDER_DEFAULT_FOCUS]]' ,'#ddd' , [rfReplaceAll] );
             sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_BORDER_DEFAULT_HEIGHT_FOCUS]]' , '1' , [rfReplaceAll] );
        end;
        if Pos( '[[TAB_COLOR_FOCUS]]' , sm.CustomCSS.Text ) > 0 then
        begin
           // THEME FULL - tabs da cor do tema
           if mm.CONFIG_LAYOUT_TAB_COLOR_FOCUS = 'ON' then
           begin
              sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_COLOR_FOCUS]]' , GetWebColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD ) , [rfReplaceAll] );

              sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_COLOR_FONT]]' , ( 'white' ) , [rfReplaceAll] );
              // 6.0.0.0
              sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_COLOR_BORDER_FOCUS]]' , GetWebColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD ) , [rfReplaceAll] );
              // 6.0.0.0 tab button
           end
           else
           begin
              sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_COLOR_FOCUS]]' , GetWebColor( '$00ffffff' ) , [rfReplaceAll] );
              // 6.0.0.0
              if mm.CONFIG_LAYOUT_TAB_THEME_BORDER = 'ON' then
              begin
                 sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_COLOR_BORDER_FOCUS]]' , GetWebColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD ) , [rfReplaceAll] );
                 sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_COLOR_FONT]]' , GetWebColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD ) , [rfReplaceAll] );
              end
              else
              begin
                 sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_COLOR_BORDER_FOCUS]]' , ( '#ddd' ) , [rfReplaceAll] );
                 sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_COLOR_FONT]]' , '#000' , [rfReplaceAll] );
              end;
           end;
           // 6.0.0.0 tabs or buttons
           if mm.CONFIG_LAYOUT_TAB_BUTTONS = 'OFF' then
           begin
              sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_TABS_OR_BTN_MARGIN_BOTTOM]]' , 'margin-bottom: -12px;' , [rfReplaceAll] );
              sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_TABS_OR_BTN_DEF_TOP_BDY]]' , '' , [rfReplaceAll] );
              sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_TABS_OR_BTN_DEF_TOP]]' , '' , [rfReplaceAll] );
              sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_BORDER_HEIGHT_FOCUS]]' , '1' , [rfReplaceAll] );
              sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_TABS_OR_BTN_DEF_TOP_BORD_RADIUS]]' , '-webkit-border-radius: 5px 5px 0px 0px !important;-moz-border-radius: 5px 5px 0px 0px !important;-ms-border-radius: 5px 5px 0px 0px !important;-o-border-radius: 5px 5px 0px 0px !important;border-radius: 5px 5px 0px 0px !important;' , [rfReplaceAll] );
              sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_TABS_OR_BTN_ACTV_DEF]]' , 'height: 40px !important;' , [rfReplaceAll] );
           end
           else
           begin
              sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_TABS_OR_BTN_MARGIN_BOTTOM]]' , 'margin-bottom: -4px;' , [rfReplaceAll] );
              sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_TABS_OR_BTN_DEF_TOP_BDY]]' , 'border-bottom-color: white transparent;border-radius: 5px 5px 5px 5px !important;padding: 6px 6px 5px 6px !important;height: 34px !important;' , [rfReplaceAll] );
              sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_TABS_OR_BTN_DEF_TOP]]' , 'height: 34px !important;padding: 6px 6px 5px 6px !important;' , [rfReplaceAll] );
              sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_BORDER_HEIGHT_FOCUS]]' , '1' , [rfReplaceAll] );
              sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_TABS_OR_BTN_DEF_TOP_BORD_RADIUS]]' , '-webkit-border-radius: 5px 5px 5px 5px !important;-moz-border-radius: 5px 5px 5px 5px !important;-ms-border-radius: 5px 5px 5px 5px !important;-o-border-radius: 5px 5px 5px 5px !important;border-radius: 5px 5px 5px 5px !important;' , [rfReplaceAll] );
              sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[TAB_TABS_OR_BTN_ACTV_DEF]]' , 'height: 34px !important;' , [rfReplaceAll] );
           end;
        end;

        if Pos( '[[LOGIN_COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[LOGIN_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_LOGIN_COLOR ) , [rfReplaceAll] );

        if Pos( '[[BUTTON_COLOR_HOVER]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[BUTTON_COLOR_HOVER]]' , GetWebColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_HOVER ) , [rfReplaceAll] );

        if Pos( '[[BUTTON_COLOR_CRUD_HOVER]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[BUTTON_COLOR_CRUD_HOVER]]' , GetWebColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD_HOVER ) , [rfReplaceAll] );

        if Pos( '[[BUTTON_COLOR_CRUD]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[BUTTON_COLOR_CRUD]]' , GetWebColor( mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD ) , [rfReplaceAll] );

        if Pos( '[[BUTTON_COLOR]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[BUTTON_COLOR]]' , GetWebColor( mm.CONFIG_LAYOUT_BUTTON_COLOR ) , [rfReplaceAll] );

        // novo seletor de MATIZES de cores padroes
        //8.0.0.0
        if Pos( '[[COLOR_BLUE_INDIGO]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_BLUE_INDIGO]]' , ColorToHtml( COLOR_BLUE_INDIGO ) , [rfReplaceAll] );

        if Pos( '[[COLOR_RED]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_RED]]' , ColorToHtml( COLOR_RED ) , [rfReplaceAll] );

        if Pos( '[[COLOR_BORDER_RED]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_BORDER_RED]]' , ColorToHtml( COLOR_BORDER_RED ) , [rfReplaceAll] );

        if Pos( '[[COLOR_HOVER_RED]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_HOVER_RED]]' , ColorToHtml( COLOR_HOVER_RED ) , [rfReplaceAll] );

        if Pos( '[[COLOR_GREEN]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_GREEN]]' , ColorToHtml( COLOR_GREEN ) , [rfReplaceAll] );

        if Pos( '[[COLOR_BORDER_GREEN]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_BORDER_GREEN]]' , ColorToHtml( COLOR_BORDER_GREEN ) , [rfReplaceAll] );

        if Pos( '[[COLOR_HOVER_GREEN]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_HOVER_GREEN]]' , ColorToHtml( COLOR_HOVER_GREEN ) , [rfReplaceAll] );

        if Pos( '[[COLOR_BLUE]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_BLUE]]' , ColorToHtml( COLOR_BLUE ) , [rfReplaceAll] );

        if Pos( '[[COLOR_BORDER_BLUE]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_BORDER_BLUE]]' , ColorToHtml( COLOR_BORDER_BLUE ) , [rfReplaceAll] );

        if Pos( '[[COLOR_HOVER_BLUE]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_HOVER_BLUE]]' , ColorToHtml( COLOR_HOVER_BLUE) , [rfReplaceAll] );

        if Pos( '[[COLOR_BLUEDARK]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_BLUEDARK]]' , ColorToHtml( COLOR_BLUEDARK ) , [rfReplaceAll] );

        if Pos( '[[COLOR_BORDER_BLUEDARK]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_BORDER_BLUEDARK]]' , ColorToHtml( COLOR_BORDER_BLUEDARK ) , [rfReplaceAll] );

        if Pos( '[[COLOR_HOVER_BLUEDARK]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_HOVER_BLUEDARK]]' , ColorToHtml( COLOR_HOVER_BLUEDARK ) , [rfReplaceAll] );

        if Pos( '[[COLOR_ORANGE]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_ORANGE]]' , ColorToHtml( COLOR_ORANGE ) , [rfReplaceAll] );

        if Pos( '[[COLOR_BORDER_ORANGE]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_BORDER_ORANGE]]' , ColorToHtml( COLOR_BORDER_ORANGE ) , [rfReplaceAll] );

        if Pos( '[[COLOR_HOVER_ORANGE]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_HOVER_ORANGE]]' , ColorToHtml( COLOR_HOVER_ORANGE ) , [rfReplaceAll] );

        if Pos( '[[COLOR_GRAY]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_GRAY]]' , ColorToHtml( COLOR_GRAY ) , [rfReplaceAll] );

        if Pos( '[[COLOR_BORDER_GRAY]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_BORDER_GRAY]]' , ColorToHtml( COLOR_BORDER_GRAY ) , [rfReplaceAll] );

        if Pos( '[[COLOR_HOVER_GRAY]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_HOVER_GRAY]]' , ColorToHtml( COLOR_HOVER_GRAY ) , [rfReplaceAll] );

        if Pos( '[[COLOR_DARK]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_DARK]]' , ColorToHtml( COLOR_DARK ) , [rfReplaceAll] );

        if Pos( '[[COLOR_BORDER_DARK]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_BORDER_DARK]]' , ColorToHtml( COLOR_BORDER_DARK ), [rfReplaceAll] );

        if Pos( '[[COLOR_HOVER_GRAY]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_HOVER_GRAY]]' , ColorToHtml( COLOR_HOVER_GRAY ) , [rfReplaceAll] );

        if Pos( '[[COLOR_SILVER]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_SILVER]]' , ColorToHtml( COLOR_SILVER ) , [rfReplaceAll] );

        if Pos( '[[COLOR_BORDER_SILVER]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_BORDER_SILVER]]' , ColorToHtml( COLOR_BORDER_SILVER ), [rfReplaceAll] );

        if Pos( '[[COLOR_HOVER_SILVER]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_HOVER_SILVER]]' , ColorToHtml( COLOR_HOVER_SILVER ) , [rfReplaceAll] );

        if Pos( '[[COLOR_PURPLE]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_PURPLE]]' , ColorToHtml( COLOR_PURPLE ) , [rfReplaceAll] );

        if Pos( '[[COLOR_BORDER_PURPLE]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_BORDER_PURPLE]]' , ColorToHtml( COLOR_BORDER_PURPLE ) , [rfReplaceAll] );

        if Pos( '[[COLOR_HOVER_PURPLE]]' , sm.CustomCSS.Text ) > 0 then
           sm.CustomCSS.Text := StringReplace( sm.CustomCSS.Text , '[[COLOR_HOVER_PURPLE]]' , ColorToHtml( COLOR_HOVER_PURPLE ) , [rfReplaceAll] );
        //7.2.0.0
        if mm.varB_Mobile_Screen then
           mm.CONFIG_LAYOUT_SCROLLBAR_SIZE       := '1';//'5';
        if mm.CONFIG_LAYOUT_SCROLLBAR_SIZE = '1' then
           sm.CustomCSS.Text :=
              StringReplace( sm.CustomCSS.Text , '[[SCROLLBAR-SIZE]]' ,
                                                 'thin',
                                                 [rfReplaceAll] )
        else
           sm.CustomCSS.Text :=
              StringReplace( sm.CustomCSS.Text , '[[SCROLLBAR-SIZE]]' ,
                                                 '8px',
                                                 [rfReplaceAll] );
        cGridLayout := '';
        if mm.CONFIG_LAYOUT_GRID_TITLE_BOLD = 'ON' then
           cGridLayout := 'font-weight: 500;';
        sm.CustomCSS.Text :=
           StringReplace( sm.CustomCSS.Text , '[[GRID-TITLE-BOLD]]' ,
                                              cGridLayout,
                                              [rfReplaceAll] );
        if mm.CONFIG_LAYOUT_GRID_TITLE_UPPER = 'ON' then
           cGridLayout := 'text-transform: uppercase;'
        else
           cGridLayout := 'text-transform: capitalize;';
        sm.CustomCSS.Text :=
           StringReplace( sm.CustomCSS.Text , '[[GRID-TITLE-UPPER]]' ,
                                              cGridLayout,
                                              [rfReplaceAll] );
        // 6.0.0.0 menu mask
        if mm.CONFIG_LAYOUT_LOADMASK_TYPE = '' then
        begin
           sm.CustomCSS.Text :=
              StringReplace( sm.CustomCSS.Text , '[[RC-LOADMASK]]' ,
                                                 '.x-mask{' +
                                                 '  z-index:10050;' +
                                                 '  background-color: rgba(0, 0, 0, 0.6);' +
                                                 '}' +
                                                 '.x-mask-overlay {' +
                                                 '  position: absolute;' +
                                                 '  left:     0;' +
                                                 '  top:      0;' +
                                                 '  width:    100%;' +
                                                 '  height:   100%;' +
                                                 '  background-image: url(files/images/loaders/' + Copy( mm.CONFIG_LAYOUT_LOADMASK_IMG, Pos( '|', mm.CONFIG_LAYOUT_LOADMASK_IMG ) + 1 ) + ') !important;' +
                                                 '  background-repeat: no-repeat !important;' +
                                                 '  background-position: center !important;' +
                                                 '  text-align: center;' +
                                                 '}' +
                                                 '.x-mask-msg{' +
                                                 '   background:none;' +
                                                 '   border-width:0px;' +
                                                 '   animation: showSweetAlert .3s !important;' +
                                                 '   -webkit-animation: showSweetAlert .3s !important;' +
                                                 '}' +
                                                 '.x-mask-msg-inner{' +
                                                 '   border-width:0px;' +
                                                 '   color:none;' +
                                                 '   padding:50px;' +
                                                 '   background: rgba(0, 0, 0, 0);' +
                                                 '   background-image:url(files/images/loaders/' + Copy( mm.CONFIG_LAYOUT_LOADMASK_IMG, Pos( '|', mm.CONFIG_LAYOUT_LOADMASK_IMG ) + 1 ) + ');' +
                                                 '   background-repeat:no-repeat;' +
                                                 '   background-size: contain;' +
                                                 '}' +
                                                 '.x-mask-msg-text{' +
                                                 '   display:none;' +
                                                 '   background-image:none;' +
                                                 '}' +
                                                 //----------
                                                 '#loading-mask {' +
                                                 '  position: absolute;' +
                                                 '  left:     0;' +
                                                 '  top:      0;' +
                                                 '  width:    100%;' +
                                                 '  height:   100%;' +
                                                 '  z-index:  90000;' +
                                                 '  background-color: white;' +
                                                 '}' +

                                                 '#loading {' +
                                                 '  position: absolute;' +
                                                 '  left:     50%;' +
                                                 '  top:      50%;' +
                                                 '  padding:  2px;' +
                                                 '  z-index:  20001;' +
                                                 '  height:   auto;' +
                                                 '}' +
                                                 '#loading .loading-indicator {' +
                                                 '   border-width:0px;' +
                                                 '   color:transparent;' + //'   color:white;' + //6.0.0.0
                                                 '   padding:50px;' +
                                                 '   background: rgba(0, 0, 0, 0);' +
                                                 '   background: url(files/images/loaders/' + Copy( mm.CONFIG_LAYOUT_LOADMASK_IMG, Pos( '|', mm.CONFIG_LAYOUT_LOADMASK_IMG ) + 1 ) + ') no-repeat;' +
                                                 '   background-repeat:no-repeat;' +
                                                 '   background-size: contain;' +
                                                 '}'
                              , [rfReplaceAll] );

           if Pos( '[[LOADMASKFILE]]' , sm.CustomCSS.Text ) > 0 then
              sm.CustomCSS.Text :=
                 StringReplace( sm.CustomCSS.Text , '[[LOADMASKFILE]]' ,
                                Copy( mm.CONFIG_LAYOUT_LOADMASK_IMG, Pos( '|', mm.CONFIG_LAYOUT_LOADMASK_IMG ) + 1 ) , [rfReplaceAll] );
        end
        else
        begin
           sm.CustomCSS.Text :=
              StringReplace( sm.CustomCSS.Text , '[[RC-LOADMASK]]' ,
                                                 '.x-mask{' +
                                                 '  z-index:10050;' +
                                                 '  background-color: rgba(0, 0, 0, 0.6);' +
                                                 '}' +
                                                 '.x-mask-overlay {' +
                                                 '  position: absolute;' +
                                                 '  left:     0;' +
                                                 '  top:      0;' +
                                                 '  width:    100%;' +
                                                 '  height:   100%;' +
                                                 '  background-image: url(files/images/loaders/' + Copy( mm.CONFIG_LAYOUT_LOADMASK_IMG, Pos( '|', mm.CONFIG_LAYOUT_LOADMASK_IMG ) + 1 ) + ') !important;' +
                                                 '  background-repeat: no-repeat !important;' +
                                                 '  background-position: center !important;' +
                                                 '  text-align: center;' +
                                                 '}' +
                                                 '.x-mask-msg {' +
                                                 '	position: fixed !important;' +
                                                 '	padding:10px !important;' +
                                                 '	-webkit-border-radius:5px !important;' +
                                                 '	-moz-border-radius:5px !important;' +
                                                 '	-ms-border-radius:5px !important;' +
                                                 '	-o-border-radius:5px !important;' +
                                                 '	border-radius:5px !important;' +
                                                 '	background:#fff !important;' +
                                                 '	animation: showSweetAlert .3s !important;' +
                                                 '	-webkit-animation: showSweetAlert .3s !important;' +
                                                 '}' +
                                                 '.x-mask-msg-inner {' +
                                                 '	font-weight: 600 !important;' +
                                                 '	color: #595959 !important;' +
                                                 '	font-size: 20px !important;' +
                                                 '	line-height: 35px !important;' +
                                                 '	font-family: ''Helvetica Neue'',Helvetica,Arial,sans-serif !important;' +
                                                 '}' +
                                                 '.x-mask-msg-text {' +
                                                 '	padding:100px 0 0 !important;' +
                                                 '  min-width:110px;' + // 6.0.0.0 menu mask
                                                 '  text-align:center;' + // 6.0.0.0 menu mask
                                                 '  background-image:url(files/images/loaders/' + Copy( mm.CONFIG_LAYOUT_LOADMASK_IMG, Pos( '|', mm.CONFIG_LAYOUT_LOADMASK_IMG ) + 1 ) + ');' +
                                                 '	background-size: 96px 96px !important;' +
                                                 '}' +
                                                 '#loading-mask {' +
                                                 '  position: absolute;' +
                                                 '  left:     0;' +
                                                 '  top:      0;' +
                                                 '  width:    100%;' +
                                                 '  height:   100%;' +
                                                 '  z-index:  20000;' +
                                                 '  background-color: white;' +
                                                 '}' +
                                                 '#loading {' +
                                                 '  position: absolute;' +
                                                 '  left:     50%;' +
                                                 '  top:      50%;' +
                                                 '  padding:  2px;' +
                                                 '  z-index:  20001;' +
                                                 '  height:   auto;' +
                                                 '}' +
                                                 '#loading .loading-indicator {' +
                                                 '   border-width:0px;' +
                                                 '   color:transparent;' + //'   color:white;' + //6.0.0.0
                                                 '   padding:50px;' +
                                                 '   background: rgba(0, 0, 0, 0);' +
                                                 '   background: url(files/images/loaders/' + Copy( mm.CONFIG_LAYOUT_LOADMASK_IMG, Pos( '|', mm.CONFIG_LAYOUT_LOADMASK_IMG ) + 1 ) + ') no-repeat;' +
                                                 '   background-repeat:no-repeat;' +
                                                 '	 background-size: 96px 96px !important;' +
                                                 '}'

                              , [rfReplaceAll] );
        end;
      end;
end;

procedure tdm_rc.rc_SaveTheme(pName: String);
var
   Inifile : TIniFile;
begin
      Inifile := nil;

      try
        if pName = '' then
           pName := 'default';

        pName := lowercase( pName ); //7.5.0.3 lowercase

        IniFile := TiniFile.Create( sm.FilesFolderPath + 'themes' + mm.BACKSLASH + 'theme_' + pName + '.ini');

        if mm.CONFIG_LAYOUT_MENUFONT_COLOR = 'clWhite' then
           mm.CONFIG_LAYOUT_MENUFONT_COLOR := '$00FDFFFF';
        //controle de cores
        IniFile.WriteString('Colors' , 'menu_color'                 , mm.CONFIG_LAYOUT_MENU_COLOR) ;
        IniFile.WriteString('Colors' , 'menufont_color'             , mm.CONFIG_LAYOUT_MENUFONT_COLOR) ;
        IniFile.WriteString('Colors' , 'menufontgroup_color'             , mm.CONFIG_LAYOUT_MENUFONT_COLOR_GROUP) ;

        IniFile.WriteString('Colors' , 'menu_logo_color_bg'         , mm.CONFIG_LAYOUT_MENU_LOGO_BG_COLOR) ;
        IniFile.WriteString('Colors' , 'menu_logo_color_font'       , mm.CONFIG_LAYOUT_MENU_LOGO_FONT_COLOR) ;

        IniFile.WriteString('Colors' , 'login_color'                , mm.CONFIG_LAYOUT_LOGIN_COLOR) ;

        IniFile.WriteString('Colors' , 'label_color'                , mm.CONFIG_LAYOUT_LABEL_COLOR) ;

        IniFile.WriteString('Colors' , 'button_color'               , mm.CONFIG_LAYOUT_BUTTON_COLOR ) ;
        IniFile.WriteString('Colors' , 'button_color_crud'          , mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD) ;

        IniFile.WriteString('Colors' , 'button_color_hover'         , mm.CONFIG_LAYOUT_BUTTON_COLOR_HOVER ) ;
        IniFile.WriteString('Colors' , 'button_color_crud_hover'    , mm.CONFIG_LAYOUT_BUTTON_COLOR_CRUD_HOVER ) ;

        IniFile.WriteString('Colors' , 'grid_sel_color'             , mm.CONFIG_LAYOUT_GRID_SEL_COLOR) ;

        IniFile.WriteString('Colors' , 'grid_title_bg'              , mm.CONFIG_LAYOUT_GRID_TITLE_BG) ;
        IniFile.WriteString('Colors' , 'grid_title_color'           , mm.CONFIG_LAYOUT_GRID_TITLE_COLOR) ;
        IniFile.WriteString('Colors' , 'grid_title_bg_over'         , mm.CONFIG_LAYOUT_GRID_TITLE_BG_OVER) ;
        IniFile.WriteString('Colors' , 'grid_title_color_over'      , mm.CONFIG_LAYOUT_GRID_TITLE_COLOR_OVER) ;
        IniFile.WriteString('Colors' , 'grid_title_color_icon'      , mm.CONFIG_LAYOUT_GRID_TITLE_COLOR_ICON) ;

        IniFile.WriteString('Colors' , 'edit_color'                 , mm.CONFIG_LAYOUT_EDIT_COLOR) ;
        IniFile.WriteString('Colors' , 'edit_font_color'            , mm.CONFIG_LAYOUT_EDIT_FONT_COLOR) ;
        IniFile.WriteString('Colors' , 'edit_color_readonly'        , mm.CONFIG_LAYOUT_EDIT_COLOR_READONLY) ;
        IniFile.WriteString('Colors' , 'edit_font_color_readonly'   , mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_READONLY) ;
        IniFile.WriteString('Colors' , 'edit_color_trigger'         , mm.CONFIG_LAYOUT_EDIT_COLOR_TRIGGER) ;
        IniFile.WriteString('Colors' , 'edit_font_color_trigger'    , mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_TRIGGER) ;
        IniFile.WriteString('Colors' , 'edit_focus_color'           , mm.CONFIG_LAYOUT_EDIT_FOCUS_COLOR) ;
        IniFile.WriteString('Colors' , 'edlkp_color'                , mm.CONFIG_LAYOUT_EDLKP_COLOR) ;
        IniFile.WriteString('Colors' , 'edlkp_font_color'           , mm.CONFIG_LAYOUT_EDLKP_FONT_COLOR) ;
        IniFile.WriteString('Colors' , 'bg_color'                   , mm.CONFIG_LAYOUT_BG_COLOR) ;
        IniFile.WriteString('Colors' , 'link_color'                 , mm.CONFIG_LAYOUT_LINK_COLOR) ;
        IniFile.WriteString('Colors' , 'linkhover_color'            , mm.CONFIG_LAYOUT_LINKHOVER_COLOR) ;
        IniFile.WriteString('Colors' , 'tab_color_focus'            , mm.CONFIG_LAYOUT_TAB_COLOR_FOCUS  ) ;
      finally
        IniFile.Free;
      end;

      mm.varC_Temp1 := StringReplace( StrTokenClear( APP_NAME ), ' ', '', [rfReplaceAll] );
      mm.varC_Temp1 := sm.FilesFolderPath + mm.varC_Temp1 + '_cfg.ini';
      try
      IniFile := TIniFile.Create( mm.varC_Temp1 );
        IniFile.WriteString('Layout' , 'round_form'                 ,  mm.CONFIG_LAYOUT_ROUND_FORM) ;
        IniFile.WriteString('Layout' , 'round_edit'                 ,  mm.CONFIG_LAYOUT_ROUND_EDIT) ;
        IniFile.WriteString('Layout' , 'round_edit_factor'          ,  mm.CONFIG_LAYOUT_ROUND_EDIT_FACTOR) ;
        IniFile.WriteString('Layout' , 'round_panel_factor'         ,  mm.CONFIG_LAYOUT_ROUND_PANEL_FACTOR) ;
        IniFile.WriteString('Layout' , 'round_btn_factor'           ,  mm.CONFIG_LAYOUT_ROUND_BTN_FACTOR) ;

        IniFile.WriteString('Layout' , 'user_bg'                    ,  mm.CONFIG_LAYOUT_USER_BG) ;

        IniFile.WriteString('Layout' , 'bg_focus_active'            , mm.CONFIG_LAYOUT_EDIT_FOCUS_ACTIVE) ; //8.0.0.0 focus active
        IniFile.WriteString('Layout' , 'bg_themed_lookup'           , mm.CONFIG_LAYOUT_LOOKUP_THEMED) ; //8.0.0.0

        IniFile.WriteString('Layout' , 'label_wrap'                 ,  mm.CONFIG_LAYOUT_LABEL_WRAP) ;
        IniFile.WriteString('Layout' , 'label_weight'               ,  mm.CONFIG_LAYOUT_LABEL_WEIGHT) ;
        IniFile.WriteString('Layout' , 'label_forms_default'        ,  mm.CONFIG_LAYOUT_LABEL_FORMS_DEFAULT) ;
        IniFile.WriteString('Layout' , 'gridblock_offset'           ,  mm.CONFIG_LAYOUT_GRIDBLOCK_OFFSET) ;
        IniFile.WriteString('Layout' , 'gridblock_anim'             ,  mm.CONFIG_LAYOUT_GRIDBLOCK_ANIM) ;
        IniFile.WriteString('Layout' , 'menufont_size'              ,  mm.CONFIG_LAYOUT_MENUFONT_SIZE) ;
        IniFile.WriteString('Layout' , 'menu_type'                  ,  mm.CONFIG_LAYOUT_MENU_TYPE) ;
        IniFile.WriteString('Layout' , 'menu_type_autoclose'        ,  mm.CONFIG_LAYOUT_MENU_TYPE_AUTOCLOSE) ; //6.0.0.0+menu micro
        IniFile.WriteString('Layout' , 'menu_call_anim'             ,  mm.CONFIG_LAYOUT_MENU_CALL_ANIM) ; //7.3.0.0
        //thanks for BugTracker Mr.Santiago from Argentina
        IniFile.WriteString('Layout' , 'menu_width'                 ,  mm.CONFIG_LAYOUT_MENU_WIDTH) ; //8.0.0.0
        IniFile.WriteString('Layout' , 'menutext_width'             ,  mm.CONFIG_LAYOUT_MENU_TEXT_WIDTH) ; //8.0.0.0
        IniFile.WriteString('Layout' , 'menuline_height'            ,  mm.CONFIG_LAYOUT_MENU_LINE_HEIGHT) ; //8.0.0.0

        IniFile.WriteString('Layout' , 'anim_effects'               ,  mm.CONFIG_LAYOUT_ANIM_EFFECTS) ; //7.4.0.0 anim
        IniFile.WriteString('Layout' , 'tabs_max_open'              ,  mm.CONFIG_LAYOUT_TAB_MAX_OPENED) ;
        IniFile.WriteString('Layout' , 'tabs_off'                   ,  mm.CONFIG_LAYOUT_TAB_OFF) ;
        IniFile.WriteString('Layout' , 'tabs_btn'                   ,  mm.CONFIG_LAYOUT_TAB_BUTTONS) ;  // 6.0.0.0
        IniFile.WriteString('Layout' , 'tabs_theme_border'          ,  mm.CONFIG_LAYOUT_TAB_THEME_BORDER) ;  // 6.0.0.0
        IniFile.WriteString('Layout' , 'tabs_border_bottom'         ,  mm.CONFIG_LAYOUT_TAB_BORDER_OFF) ;  // 6.0.0.0

        IniFile.WriteString('Layout' , 'loadmaskfile'               ,  mm.CONFIG_LAYOUT_LOADMASK_IMG);
        IniFile.WriteString('Layout' , 'loadmasktype'               ,  mm.CONFIG_LAYOUT_LOADMASK_TYPE) ;
        IniFile.WriteString('Layout' , 'grids_title_bold'           ,  mm.CONFIG_LAYOUT_GRID_TITLE_BOLD);
        IniFile.WriteString('Layout' , 'grids_title_upper'          ,  mm.CONFIG_LAYOUT_GRID_TITLE_UPPER) ;
        IniFile.WriteString('Layout' , 'scroll_bar_size'            ,  mm.CONFIG_LAYOUT_SCROLLBAR_SIZE) ;
        IniFile.WriteString('Layout' , 'scroll_bar_mobileoff'       ,  mm.CONFIG_LAYOUT_SCROLLBAR_MOBILE_OFF) ; // 6.0.0.0
        IniFile.WriteString('Layout' , 'grid_column_separator'      , mm.CONFIG_LAYOUT_GRID_COLUMN_SEPARATOR) ;
        IniFile.WriteString('Layout' , 'grid_row_height'            , mm.CONFIG_LAYOUT_GRID_ROW_HEIGHT) ;
        IniFile.WriteString('Layout' , 'grid_title_height'          , mm.CONFIG_LAYOUT_GRID_TITLE_HEIGHT) ;//7.5.0.0
        IniFile.WriteString('Layout' , 'grid_rc_paginator'          , mm.CONFIG_LAYOUT_GRID_RC_PAGINATOR) ;
        IniFile.WriteString('Layout' , 'grid_font_size'             , mm.CONFIG_LAYOUT_GRID_FONT_SIZE) ; // 6.0.0.0
        IniFile.WriteString('Layout' , 'grid_title_font_size'       , mm.CONFIG_LAYOUT_GRID_TITLE_FONT_SIZE) ; // 6.0.0.0

        IniFile.WriteString('Layout' , 'hide_tabs'                  , mm.CONFIG_LAYOUT_HIDE_TABS_ON_MOBILE) ;
        IniFile.WriteString('Layout' , 'hide_toppanel'              , mm.CONFIG_LAYOUT_HIDE_TOPPANEL_ON_MOBILE) ;

        IniFile.WriteString('Layout' , 'keyb_desk_virtual'          , mm.CONFIG_LAYOUT_KEYBOARD_VIRTUAL_ON_DESKTOP ); // 6.0.0.0
        IniFile.WriteString('Layout' , 'keyb_virtual'               , mm.CONFIG_LAYOUT_KEYBOARD_VIRTUAL_ON_MOBILE );
        IniFile.WriteString('Layout' , 'keyb_scroll'                , mm.CONFIG_LAYOUT_KEYBOARD_SCROLL_ON_MOBILE );

        IniFile.WriteString('Font'   , 'app_font'                   , mm.CONFIG_LAYOUT_APP_FONT) ;
        IniFile.WriteString('Font'   , 'font_all'                   , mm.CONFIG_LAYOUT_APPLY_FONT_ALL) ;
        IniFile.WriteString('Font'   , 'font_aws'                   , mm.CONFIG_LAYOUT_FONTAWS ) ; //8.2.0.0
        IniFile.WriteString('Font'   , 'bsicons'                    , mm.CONFIG_LAYOUT_BSICONS) ; //8.2.0.0
      finally
        IniFile.Free;
      end;
end;
// 7.0.0.0 moved to mkm_layout
//procedure trc_ObjectEnabled(pFrame: TObject; pObj: TUniControl; pState: boolean; pForce: boolean );
//var
//   pObj2: TUniControl;
//begin
//   pObj2 := nil;
//
//   if pObj <> nil then
//      pObj2 := TUniControl(TComponent(pFrame).FindComponent(pObj.Name));
//
//   if pObj2 <> nil then
//   begin
//      pObj2.Enabled := pState;
//
//      if pObj2.Enabled then
//      begin
//          if pForce then
//          begin
//            pObj2.Enabled := false;
//            pObj2.Enabled := true;
//          end;
//          rc_RemoveCssClass( pObj2, 'disabled', pForce );
//      end
//      else
//      begin
//           rc_AddCssClass( pObj2, 'disabled');
//      end;
//   end;
//end;

function tdm_rc.rc_ObjectExists(pName: string): boolean;
var
   i : integer;
begin
     Result := false;
     for i := 0 to uniapplication.ComponentCount - 1 do
         if lowercase(uniapplication.components[i].name) = lowercase(pName) then
         begin
            Result := true;
            break;
         end;
end;

//deprecated
function tdm_rc.rc_OnResize( pFormName : string ; pCenter : boolean ) : string;
var
   oObj : TUniControl;
begin
     oObj := rc_FindControl( pFormName );

     if oObj.InheritsFrom( TUniframe ) then
        Result := 'window.addEventListener( "resize", resizeFrame, true);' +
                  'function resizeFrame() {' +
                  '  if (typeof ' + pFormName + ' !== ''undefined'') { ' +
                  '     var getSize = Ext.getBody().getViewSize(); ' +
                  '     winWidth = getSize.width; ' +
                  '     winHeight = getSize.height; ' +
//                  '     ajaxRequest( ' + MainForm.htmlFrame.JSName + ' , "_OnResize", ' +
//                  '       ["form=" + ' + QuotedStr( pFormName ) + ',' +
//                  '        "width=" + winWidth ,' +
//                  '        "height=" + winHeight ' +
//                  '       ]);}' +
                  '}'
    else
    if oObj.InheritsFrom(TUniForm) then
    begin

//       if ( mm.varB_Mobile_Screen ) then
//          oObj.Height := mm.varI_ScreenHeight - 5;

       if pCenter then
          Result := 'window.onresize = function(){ ' +
                    'if (typeof ' + pFormName + ' !== ''undefined'') { ' +
                    '   var getSize = Ext.getBody().getViewSize(), ' +
                    '   winWidth = getSize.width, ' +
                    '   winHeight = getSize.height, ' +
                    '   left = (winWidth - ' + pFormName + '.window.width) / 2, ' +
                    '   top = (winHeight - ' + pFormName + '.window.height) / 2; ' +
                    '   ' + pFormName + '.window.setPosition(left, top);}' +
                    //'   ' + pFormName + '.window.setWidth(winWidth);     ' +
      //            '   ' + pFormName + '.window.setHeight(winHeight);}' +
                    '   ajaxRequest( ' + MainForm.htmlFrame.JSName + ' , "_OnResize", ' +
   //                 '     ["form=" + ' + QuotedStr( pFormName ) + ']);' + ',' +
                    '     ["form=" + ' + QuotedStr( pFormName ) + ',' +
                    '      "width=" + winWidth ,' +
                    '      "height=" + winHeight ]);' +
                    '}'
       else
          Result := 'window.onresize = function(){ ' +
                    'if (typeof ' + pFormName + ' !== ''undefined'') { ' +
                    '   var getSize = Ext.getBody().getViewSize(), ' +
                    '   winWidth = getSize.width, ' +
                    '   winHeight = getSize.height;}' +
//                    '   ajaxRequest( ' + MainForm.htmlFrame.JSName + ' , "_OnResize", ' +
//                    '     ["form=" + ' + QuotedStr( pFormName ) + ',' +
//                    '      "width=" + winWidth ,' +
//                    '      "height=" + winHeight ]);}' +
                    '}';
    end;
end;

procedure tdm_rc.rc_OpenLink(pLink, pTarget: string);
begin
     pLink := 'window.open(' + QuotedStr(pLink) + ', ' + QuotedStr(pTarget) + ');';

     UniSession.AddJS( pLink );
end;

procedure tdm_rc.rc_FillSearchFieldsCRUD( pFrame: TObject; pName, pField, pDescription: String);
var
   pComboBox2,
   pComboBox : TUniComboBox;
   i : integer;
begin

    pComboBox2 := nil;

    // veio de relatorio ou crud ?
    if lowercase(pName) = 'lbxreportoptions' then
    begin
        pComboBox := TUniComboBox( TComponent( pFrame ).FindComponent( pName ));
        if pField = '' then
        begin
            pComboBox.Clear;
            pComboBox.Items.Add( '' );
        end
        else
            pComboBox.Items.Add( pField );

        //fields...
        pComboBox := nil;
        pComboBox := TUniComboBox( TComponent( pFrame ).FindComponent( 'cbxModelReport_form' ));
        if pField = '' then
        begin
           pComboBox.Clear;
           pComboBox.Items.Add( '' );
        end
        else
            pComboBox.Items.Add( pDescription );
    end
    else
    begin
        pComboBox := TUniComboBox( TComponent( pFrame ).FindComponent( pName ));

        if pField = '' then
        begin
            pComboBox.Clear;
            pComboBox.Items.Add( '' );

            // limpar o 2o. combo de pesquisa
            if lowercase(pName) = 'cbxsearchcrudfield1' then
            begin
                 pComboBox2 := TUniComboBox( TComponent( pFrame ).FindComponent( 'cbxsearchcrudfield2' ));
                 pComboBox2.Clear;
                 pComboBox2.Items.Add( '' );

            end;
        end
        else
        begin
            pComboBox.Items.Add( pDescription );

            // limpar o 2o. combo de pesquisa
            if lowercase(pName) = 'cbxsearchcrudfield1' then
            begin
                 pComboBox2 := TUniComboBox( TComponent( pFrame ).FindComponent( 'cbxsearchcrudfield2' ));
                 pComboBox2.Items.Add( pDescription );
            end;
        end;

        // deixar padrao o 1o. item
        if lowercase(pName) = 'cbxsearchcrudfield1' then
        begin
           pComboBox.ItemIndex := varIIF( pComboBox.Items.Count > 1 , 1, 0 );
           i := pComboBox.ItemIndex;
           pComboBox := TUniComboBox( TComponent( pFrame ).FindComponent( 'cbxSearchCRUDField1_Fields' ));
           pComboBox.ItemIndex := i;

           // 2o. combo de pesquisa
           pComboBox2.ItemIndex := varIIF( pComboBox2.Items.Count > 1 , 1, 0 );
           i := pComboBox2.ItemIndex;
           pComboBox2 := TUniComboBox( TComponent( pFrame ).FindComponent( 'cbxSearchCRUDField2_Fields' ));
           pComboBox2.ItemIndex := i
        end;

        if TUniComboBox( TComponent( pFrame ).FindComponent( 'cbxsearchcrudopt1' )) <> nil then
        begin
           i := pComboBox.Items.Count;
           pComboBox := TUniComboBox( TComponent( pFrame ).FindComponent( 'cbxsearchcrudopt1' ));
           pComboBox.ItemIndex := 6;
        end;

        //fields...
        if lowercase(pName) = 'cbxsearchcrudfield1' then
        begin
          pComboBox := nil;
          pComboBox := TUniComboBox( TComponent( pFrame ).FindComponent( pName + '_fields' ));

          if pComboBox <> nil then
          begin
             if pField = '' then
             begin
                pComboBox.Clear;
                pComboBox.Items.Add( '' );
             end
             else
                 pComboBox.Items.Add( pField );
          end;

           pComboBox2 := nil;
           pComboBox2 := TUniComboBox( TComponent( pFrame ).FindComponent( 'cbxSearchCRUDField2_Fields' ));

           if pComboBox2 <> nil then
           begin
              if pField = '' then
              begin
                 pComboBox2.Clear;
                 pComboBox2.Items.Add( '' );
              end
              else
                  pComboBox2.Items.Add( pField );
           end;
        end
        else
        if lowercase(pName) = 'cbxsearchcrudfielddate' then
        begin
          pComboBox := nil;
          pComboBox := TUniComboBox( TComponent( pFrame ).FindComponent( pName + '_fields' ));

          if pComboBox <> nil then
          begin
             if pField = '' then
             begin
                pComboBox.Clear;
                pComboBox.Items.Add( '' );
             end
             else
                 pComboBox.Items.Add( pField );
          end;
        end;
    end;
end;

function tdm_rc.rc_FindDataModule(pName: string): TDataModule;
var
   f : integer;
begin
   Result := nil;
   for F := 0 to UniSession.DataModules.Count - 1 do
   begin
       if ( TDataModule(UniSession.DataModules[f]).Name = pName ) then
       begin
           Result := TDataModule( UniSession.DataModules[f] );
       end;
   end;
end;
// 6.0.0.0
function Tdm_rc.rc_FindMenuOption(pOption: string) : integer;
var
  I: Integer;
begin
  Result := -1;
  for I := Low( mm.varA_FSideMenu ) to High( mm.varA_FSideMenu ) do
    //if AnsiSameStr( pOption , mm.varA_FSideMenu[I].Option ) then
    if Pos( pOption , mm.varA_FSideMenu[I].Option ) > 0 then
    begin
      Result := I;
      Break;
    end;
end;
// 6.0.0.0
function tdm_rc.rc_GetSQL( pDBType, pDefinition: string; pIniOrPage : integer; pEndOrRecsPerPage : integer; pS1 : string ): string;
var
   cTmp, cTypes : string;
   i,t : integer;
begin
    if pDefinition = 'cmd_concat' then
    begin
         if Pos( ':', pS1 ) = 0 then
            t := 30
         else
         begin
              t := StrToIntDef( copy( ps1, pos( ':', ps1 ) + 1, 10 ), 30 );
              ps1 := copy( ps1, 1, pos( ':', ps1 ) - 1 );
         end;

         i := strTokenCount( pS1 , ',' );

         if ( pDBType = 'FIREBIRD' ) or ( pDBType = 'ORACLE' ) or ( pDBType = 'SQLITE' ) then
            Result := StringReplace( pS1, ',', '||', [rfReplaceAll] )
         else
         if ( pDBType = 'MYSQL' ) or ( pDBType = 'SQLSERVER' ) or ( pDBType = 'PGSQL' )then
         begin
            pS1 := pS1 + ',';
            Result := ' CAST( CONCAT(';
            repeat
                  cTmp   := Copy( pS1, 1, Pos( ',', pS1 ) - 1 );
                  pS1    := StringReplace( pS1, cTmp + ',', '', [rfReplaceAll] );
                  if i-1 > 0 then
                     Result := Result + cTmp + ','
                  else
                  begin
                     Result := Result + cTmp + ') as varchar(' + t.ToString + ') )' ;  //cast( concat( ddd1, fone1 ) as varchar(15) ) as fone1
                  end;

                  dec( i );
            until i = 0;
         end;
    end
    else
    // 6.0.0.0
    if pDefinition = 'cmd_paginate' then
    begin
         if pDBType = 'FIREBIRD' then
         begin
            // rows 1 to 10 ( prim. parametro nao permite 0 )
            if pIniOrPage <= 1 then
            begin
               pIniOrPage := 2;
               t          := pEndOrRecsPerPage;
               pEndOrRecsPerPage := 1;
            end
            else
            begin
               t          := ( pIniOrPage * pEndOrRecsPerPage ) + 1;
            end;
            i      := pIniOrPage;
            Result :=
               ' ROWS (' + i.ToString + ' - 1) * ' + pEndOrRecsPerPage.ToString + ' to ' + t.ToString + ' ';
         end
         else
         if pDBType = 'PGSQL' then
            Result :=
               ' LIMIT ' + pEndOrRecsPerPage.ToString + ' OFFSET(' + pIniOrPage.ToString + ' - 1) * ' + pEndOrRecsPerPage.ToString + ' '
//            LIMIT 10 OFFSET(1 - 1) * 10
//                            +--- 1 = página
         else
         if pDBType = 'MYSQL' then
            Result :=
               ' LIMIT ' + pEndOrRecsPerPage.ToString + ' OFFSET(' + pIniOrPage.ToString + ' - 1) * ' + pEndOrRecsPerPage.ToString + ' '
//            LIMIT 10 OFFSET(1 - 1) * 10
//                            +--- 1 = página

         else
         if pDBType = 'ORACLE' then
            Result :=
               ' offset ((' + pIniOrPage.ToString + '-1)*' + pIniOrPage.ToString + ') rows ' +
               ' fetch first ' + pEndOrRecsPerPage.ToString + ' rows only '
            //OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY
         else
         if pDBType = 'SQLSERVER' then
            Result :=
               ' offset ((' + pIniOrPage.ToString + '-1)*' + pIniOrPage.ToString + ') rows ' +
               ' fetch first ' + pEndOrRecsPerPage.ToString + ' rows only '
(*
  offset ((' + pIniOrPage.ToString + ' -1) * ' + pIniOrPage.ToString + ') rows
  fetch first ' + pEndOrRecsPerPage + ' rows only;
            Result := 'OFFSET  ' + pIni.ToString + ' ROWS ' +
                      'FETCH NEXT ' + pEnd.ToString + ' ROWS ONLY '
*)
         else
         if pDBType = 'SQLITE' then
            Result :=
               ' LIMIT 10 OFFSET(' + pIniOrPage.ToString + ' - 1) * ' + pEndOrRecsPerPage.ToString + ' '
    end
    else
    if pDefinition = 'defaultport' then
    begin
         if pDBType = 'FIREBIRD' then
            Result := '3050'
         else
         if pDBType = 'PGSQL' then
            Result := '5432'
         else
         if pDBType = 'MYSQL' then
            Result := '3306'
         else
         if pDBType = 'SQLSERVER' then
            Result := '1433'
         else
         if pDBType = 'ORACLE' then
            Result := '1521'
         else
         if pDBType = 'SQLITE' then
            Result := '0';
    end
    else
    if pDefinition = 'table_exists' then
    begin
         if pDBType = 'FIREBIRD' then
            Result := 'select rdb$relation_name from rdb$relations where rdb$relation_name = ''%s'' '
         else
         if pDBType = 'PGSQL' then
            Result := 'select table_name from information_schema.columns where table_name = ''%s'' limit 1'  //SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';
         else
         if pDBType = 'MYSQL' then
            Result := 'show tables like ''%s'' '
         else
         if pDBType = 'ORACLE' then
            Result := '''%s'' '
         else
         if pDBType = 'SQLSERVER' then
            Result := 'select TOP 1 * from sysobjects where xtype = ''U'' and name = ''%s'' ' // dica FOLIVEIRA
         else
         if pDBType = 'SQLITE' then
            Result := ' select * from sqlite_master where type = ''table'' and name = ''%s'' limit 1'
    end
    else
    if pDefinition = 'fk_tables' then
    begin
         if pDBType = 'FIREBIRD' then
            Result := ' select table_name, field_name, foreign_key, reference_table, field_key ' +
                      ' from VIEW_DB_STRUCTURE ' +
                      ' where reference_table = upper(''%s'') ' +
                      ' and foreign_key = ''Y'' '
         else
         if pDBType = 'PGSQL' then
            Result :=
                 ' select c.constraint_name' +
                 '        , x.table_schema as schema_name' +
                 '        , x.table_name' +
                 '        , x.column_name as field_name' +
                 '        , y.table_schema as foreign_schema_name' +
                 '        , y.table_name as reference_table' +
                 '        , y.column_name as field_key' +

                 ' from information_schema.referential_constraints c' +

                 ' join information_schema.key_column_usage x' +
                 '      on x.constraint_name = c.constraint_name' +

                 ' join information_schema.key_column_usage y' +
                 '      on y.ordinal_position = x.position_in_unique_constraint' +
                 '      and y.constraint_name = c.unique_constraint_name' +
                 '      and y.table_name = ''%s'' ' +

                 ' order by c.constraint_name, x.ordinal_position '
         else
         if pDBType = 'MYSQL' then
            Result :=
                ' select' +
                '   CONSTRAINT_NAME as ''foreign_name'',' +
                '   table_name, column_name as field_name,' +
                '   referenced_table_name as reference_table, referenced_column_name as field_key' +
                ' from' +
                '   information_schema.key_column_usage' +
                ' where' +
                '   referenced_table_name is not null ' +
                '  and ' +
                //8.2.0.0 thanks EBNEZER JR
                '   referenced_table_name = ''%s''' +
                varIIF( DB_SCHEMA <> '', ' and table_schema = ' + quotedstr( DB_SCHEMA ) , '' )
         else
         if pDBType = 'SQLSERVER' then // feedback by FABIO OLIVEIRA
             Result := ' select t.name as table_name, c.name as field_name ' +
                       ' from sys.foreign_key_columns as fk ' +
                       ' inner join sys.tables as t on fk.parent_object_id = t.object_id ' +
                       ' inner join sys.columns as c on fk.parent_object_id = c.object_id and fk.parent_column_id = c.column_id ' +
                       ' where fk.referenced_object_id = (select object_id from sys.tables where name = ''%s'' ) ' +
                       ' order by table_name '
         else
         if pDBType = 'ORACLE' then
            Result := ''
         else
         if pDBType = 'SQLITE' then
            Result := ''
    end
    else
    if pDefinition = 'field_exists' then
    begin
         if pDBType = 'FIREBIRD' then
            Result := 'select rdb$field_name from rdb$relation_fields where rdb$relation_fields.rdb$relation_name = ''%s'' and rdb$relation_fields.rdb$field_name = ''%s'' '
         else
         if pDBType = 'PGSQL' then
            Result := 'select table_name as tabela, column_name as campo from information_schema.columns where table_name = ''%s'' and column_name = ''%s'' '
         else
         if pDBType = 'MYSQL' then
            Result := 'show columns from %s where field = ''%s'' '
         else
         if pDBType = 'SQLSERVER' then
            Result := 'select column_name from information_schema.columns where table_name = ''%s'' and column_name = ''%s'' '   //select 1 from syscolumns where id = object_id('Tabela') and name = 'Coluna'
         else
         if pDBType = 'ORACLE' then
            Result := ''
         else
         if pDBType = 'SQLITE' then
            Result := 'SELECT COUNT(*) AS CNTREC FROM pragma_table_info( ''%s'' ) WHERE name=''%s'''; //6.0.0.1
    end
    else
    if pDefinition = 'keyfield' then
    begin
         // pode melhorar... claro... mas como o objetivo é adequar-se a todos os bancos usados
         // ficou simples de obter a informacao necessária
         //
         // o SQLITE fica em standby...
         cTypes := '      CASE  ' +
                   '      WHEN data_type  = ''varying''   THEN  ''ftString'' ' +
                   '      WHEN data_type  = ''character varying''   THEN  ''ftString'' ' +
                   '      WHEN data_type  = ''character'' THEN  ''ftString'' ' +
                   '      WHEN data_type  = ''varchar''   THEN  ''ftString'' ' +
                   '      WHEN data_type  = ''char''      THEN  ''ftString'' ' +
                   '      WHEN data_type  = ''text''      THEN  ''ftString'' ' +
                   '      WHEN data_type  = ''longtext''  THEN  ''ftString''      ' +
                   '      WHEN data_type  = ''int''       THEN  ''ftInteger'' ' +
                   '      WHEN data_type  = ''bigint''    THEN  ''ftLargeint'' ' +  // 6.0.0.0
                   '      WHEN data_type  = ''int64''     THEN  ''ftLargeint'' ' +  // 6.0.0.0
                   '      WHEN data_type  = ''smallint''  THEN  ''ftInteger'' ' +  // <- ajuda do RAI
                   '      WHEN data_type  = ''bytea''     THEN  ''ftInteger'' ' +
                   '      WHEN data_type  = ''integer''   THEN  ''ftInteger'' ' +
                   '      WHEN data_type  = ''decimal''   THEN  ''ftFloat'' ' +
                   '      WHEN data_type  = ''numeric''   THEN  ''ftFloat'' ' +
                   '      WHEN data_type  = ''double''    THEN  ''ftFloat'' ' +
                   '      WHEN data_type  = ''float''     THEN  ''ftFloat''  ' +
                   '      WHEN data_type  = ''date''      THEN  ''ftDate''  ' +
                   '      WHEN data_type  = ''time without time zone''   THEN  ''ftTime''  ' +
                   '      WHEN data_type  = ''time with time zone''      THEN  ''ftTime''  ' +
                   '      WHEN data_type  = ''time''      THEN  ''ftTime''  ' +
                   '      WHEN data_type  = ''timeestamp'' THEN  ''ftDateTime''   ' +
                   '      WHEN data_type  = ''timestamp without time zone'' THEN  ''ftDateTime''   ' +
                   '      WHEN data_type  = ''timestamp with time zone'' THEN  ''ftDateTime''   ' +
                   '      ELSE ''ftUnknown''  ' +
                   '      END AS type  ';

         if pDBType = 'FIREBIRD' then
            Result :=  ' select lower(field_name) as name, lower(field_type) as type ' +
                       ' from VIEW_DB_STRUCTURE ' + // ' from estrutura_view_basica '
                       ' where lower(table_name) = ''%s'' ' +
                       ' and primary_key = ''Y'' '
         else
         if pDBType = 'PGSQL' then
            Result := ' select ' +
                      '     c.column_name as name, ' + cTypes +
                      ' from ' +
                      '     information_schema.table_constraints tc' +
                      '     join information_schema.constraint_column_usage AS ccu USING (constraint_schema, constraint_name)' +
                      '     join information_schema.columns AS c ON c.table_schema = tc.constraint_schema' +
                      '          and tc.table_name = c.table_name AND ccu.column_name = c.column_name' +
                      ' where ' +
                      '     constraint_type = ''PRIMARY KEY'' and tc.table_name = ''%s'' '
         else
         if pDBType = 'MYSQL' then
            Result := ' select column_name as name, ' + cTypes +
                      ' from information_schema.columns ' +
                      ' where table_name = ''%s'' ' +
                      varIIF( DB_SCHEMA <> '', ' and table_schema = ' + quotedstr( DB_SCHEMA ) , '' ) +  //quotedstr( mm.CONFIG_DATABASE_NAME ) + // 7.0.0.0
                      ' and column_key = ''PRI'''
         else
         if pDBType = 'SQLSERVER' then  // dica FOLIVEIRA
            // FOLIVEIRA - Correção pois não estava retornando os campos corretos - 07-02-2020 17:14hs //WideView
            //8.0.0.0
            Result := ' Select ' +
                      ' KU.column_name as name, ' +
                      ' ISC.DATA_TYPE as data_type , ' + cTypes +
                      ' FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS       AS TC ' +
                      ' INNER JOIN  INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KU  ON TC.CONSTRAINT_TYPE = '+QuotedStr('PRIMARY KEY')+' AND ' +
                      ' TC.CONSTRAINT_NAME = KU.CONSTRAINT_NAME AND KU.table_name = ' + QuotedStr('%s') +
                      ' INNER JOIN INFORMATION_SCHEMA.COLUMNS           AS ISC ON ISC.TABLE_NAME = KU.TABLE_NAME AND ISC.COLUMN_NAME = KU.COLUMN_NAME '
         else
         if pDBType = 'ORACLE' then
            Result := ''
         else
         if pDBType = 'SQLITE' then
            Result := 'pragma table_info(''%s'')' // apos trazer o resultado, filtra0se pelo "pk = 1"
    end;
end;
// 6.0.0.0 pkcomposta
//[PT] retorna o primeiro campo PK da tabela, mas mantem em memoria o "memStructure" , caso mais de um campo forme a PK
//[EN] returns the first PK field in the table, but keeps the "memStructure" in memory, if more than one field forms the PK
function tdm_rc.rc_GetPrimaryKey(pTable: string; pAllKeys : boolean; pGetThisPK : string ) : string;
var
   cField_PK,
   cField_TYPE,
   cRDBMS,
   cSql : string;

   bEOF , bBOF : boolean;
begin
     Result := '';

     memStructure.Close;
     memPK.Filtered := false;
     memPK.First;
     //[PT] se já tiver criado a estrutura em memoria, pesquisa nela pra otimizar o processo
     //[EN] if you have already created the structure in memory, search it to optimize the process
     //
     // FDMemTable  para apoio a PK dinamica
     if not memPK.Locate( 'table' , trim(pTable) , [] ) then
     begin
        //[PT] por padrao, quando não é passado um order by, GetRegistro assume o primeiro campo ( q seria a PK padrão )
        //      o pseudo parametro 'noorder.' avisa para não adicionar um order by no caso do retorno da PK( REMOVIDO )
        //[EN] by default, when an order by is not passed, GetRegistro assumes the first field (which would be the default PK)
        //      the pseudo parameter 'noorder.' warns not to add an order by in case of PK return (REMOVED)
        if not mm.varB_IsNot_API then
           cRDBMS := mm.CONFIG_DATABASE_API
        else
           cRDBMS := mm.CONFIG_DATABASE;

        cSql := format( rc_GetSQL( cRDBMS , 'keyfield' ) , [ trim(pTable) ] );

        memStructure.Data := rc_GetRecord( mm.varB_IsNot_API , true,  'noorder.' + cSql );

        if mm.varC_LastErrorMsg <> '' then
        begin
          raise Exception.Create( mm.varC_LastErrorMsg );
        end;
        //[PT] se nao pos o ORDER acrescenta para nao dar erro no ROWS / LIMIT
        //     mas só se não tiver o PRAGMA( pra trazer a estrutura LOCAL do SQLITE )
        //     ou nao vier do MySQL tb...
        //[EN] if you don't put the ORDER, add it so as not to give an error in ROWS / LIMIT
        //     but only if you don't have PRAGMA (to bring the LOCAL SQLITE structure)
        //     or it doesn't come from MySQL either...
        if ( Pos( 'pragma', lowercase( cSql ) ) > 0 ) then
        begin
             memStructure.Filtered := false;
             memStructure.Filter := 'pk=1';
             memStructure.Filtered := true;
        end;

        //[PT] caso a tabela não tenha uma chave primária( PK ), vai assumir o campo padrão do RADCORE - "CODIGO"
        //[EN] if the table does not have a primary key (PK), will assume the default RADCORE field - "CODIGO"

        //if trim(pTable) = 'planocontas' then // <- essa é uma situação particular da tabela planocontas
        if AnsiMatchStr( trim(pTable) , ARRAY_PK_PRIOR ) then //( deprecated )
        begin
            memStructure.Last;
        end;
        // 6.0.0.0
        //[PT] caso a tabela tenha uma chave composta e a PK SEQUENCIAL não esteja na primeira posição( Ex: TB_TEST )
        //[EN] if the table has a composite key and the SEQUENTIAL PK is not in the first position (Ex: TB_TEST)
        cField_PK   := trim(lowercase( memStructure.FieldByName( 'name' ).AsString ));
        cField_TYPE := trim(lowercase( memStructure.FieldByName( 'type' ).AsString ));

        if cField_PK = '' then
        begin
           if not rc_FieldExists( mm.varB_IsNot_API , 'codigo' , trim(pTable) ) then
           begin
               rc_ShowSweetAlert( mm.MSG_ERROR, format( mm.MSG_TABLE_DO_NOT_EXIST, [ trim(pTable) ] )  , 'error' );
               Abort;
           end;
           cField_PK   := 'codigo';
           cField_TYPE := 'ftinteger';
        end;

        // Append data
        memPK.Filtered := false;
        memPK.Open;

        // montar lista de PK´s
        if AnsiMatchStr( trim(pTable) , ARRAY_PK_PRIOR ) then
        begin
            memStructure.Last;

            bBOF := false;
            while ( not bBOF ) or ( memPK.IsEmpty ) do
            begin
               memPK.AppendRecord( [  trim(pTable) ,
                                       cField_PK,
                                       cField_TYPE ] );

               memStructure.Prior;

               cField_PK   := trim(lowercase( memStructure.FieldByName( 'name' ).AsString ));
               cField_TYPE := trim(lowercase( memStructure.FieldByName( 'type' ).AsString ));

               bBOF := memStructure.bof;
            end;
        end
        else
        // 6.0.0.0
        begin
            memStructure.First;

            bEOF := false; // ao entrar... o EOF ja vem TRUE... e precisamos gravr o primeiro....
            while ( not bEOF ) do
            begin
               memPK.AppendRecord( [  trim(pTable) ,
                                      cField_PK,
                                      cField_TYPE ] );
               memStructure.Next;
               // 6.0.0.0
               If pGetThisPK = '' then
               begin
                 cField_PK := trim(lowercase( memStructure.FieldByName( 'name' ).AsString ));
                 cField_TYPE := trim(lowercase( memStructure.FieldByName( 'type' ).AsString ));
               end
               else
               If pGetThisPK = trim(lowercase( memStructure.FieldByName( 'name' ).AsString )) then
               begin
                 cField_PK := trim(lowercase( memStructure.FieldByName( 'name' ).AsString ));
                 cField_TYPE := trim(lowercase( memStructure.FieldByName( 'type' ).AsString ));
               end;

               bEOF := memStructure.eof;
            end;
        end;

        if not dm_rc.memGridPK.Locate( 'field' , cField_PK , [] ) then
           dm_rc.memGridPK.AppendRecord( [ cField_PK ] );

        memStructure.Filtered := false;
     end;

     memPK.Filtered := false;
     memPK.Filter   := 'table=' + QuotedStr( trim(pTable) );
     memPK.Filtered := true;
     memPK.First;
     // 6.0.0.0
     if not pAllKeys then
     begin
        If pGetThisPK = '' then
           Result := trim(lowercase( memPK.FieldByName( 'pk' ).AsString ) )
        else
        if cField_PK <> '' then
           Result := cField_PK
        else
           Result := pGetThisPK;
     end
     else
     begin
          //6.0.0.1 sqlite
          if mm.CONFIG_DATABASE = 'SQLITE' then
          begin
             memStructure.Filtered := false;
             memStructure.Filter := 'pk=1';
             memStructure.Filtered := true;
          end;

          Result := '';
          while not memPk.Eof do
          begin
             Result := Result + trim(lowercase( memPK.FieldByName( 'pk' ).AsString )) + ';';
             memPk.Next;
          end;

          //6.0.0.1 sqlite
          if mm.CONFIG_DATABASE = 'SQLITE' then
          begin
             memStructure.Filtered := false;
          end;
     end;
end;
//8.0.0.0 treemenu
procedure Tdm_rc.rc_BuildMainMenu( pSearch: string; pTreeMenu : TUniTreeMenu );
Var
  aMenuLevels : Array [1..5] of TUniTreeNode;

  MainItem,
  MainItemSub1,
  MainItemSub2,
  MainItemSub3,
  MainItemSub4: TUniTreeNode;

  Item, cTemp, cTemp2, cTemp3 : String; // 6.0.0.0

  iPerm,
  c, I ,f1, f2, f3, iItemMenu     : integer;


  bItemIsNotSubMenu : boolean; // 6.0.0.0
  vItem_prior_IsNotSubMenu : string; // 6.0.0.0

  bHasAccess,//8.0.0.1
  bAskNew,
  bGenID,
  bNoGenID, // 6.0.0.0
  bZerosLeft, // 6.0.0.0
  bHideMaskOff, // 6.0.0.0 menu mask
  bCloseBtn,  //closebtn
  bHidden,
  bMaster, bNotShow,
  bSubMenus,
  bShow : boolean;

  cTagForm, cGetThisPK, // 6.0.0.0
  cIco, cFrm, cTbl, cFld, cMenuListItem,
  cBadge,cBasic, //8.0.0.0
  s1, s2,
  vItem_next,
  vItem_prior,
  vItem_parent,//8.0.0.0 treemenu
  vItem : string;
  //6.0.0.0
  IniFile           : TMemIniFile;
  cTempUtf8         : UTF8String;
  iSeq              : integer; //6.0.0.0
  cTmp              : string;

    procedure rc_BuildMENUS( _pesquisa : string; pMenuList, pMenuListPermissions : array of string ) ;
    begin
      try
        vItem_prior := ' ';
        vItem_prior_IsNotSubMenu := ' ';
        I := 1;
        //feedback: Mesut from Turkey to Linux( 6.0.0.0 )
        iPerm     := 0;
        c         := 0;
        f1        := 0;
        f2        := 0;
        f3        := 0;
        iItemMenu := 0;

        MainItem     := nil; //7.2.0.1 64bit compatible
        MainItemSub1 := nil;
        MainItemSub2 := nil;
        MainItemSub3 := nil;
        MainItemSub4 := nil;

        //8.0.0.0 treemenu
        vItem_parent := '';

        while ( I <= High( pMenuList ) ) do
        begin
             vItem_prior := pMenuList[ i - 1 ];
             vItem := pMenuList[ i  ];

             if ( Pos( '@' , vItem_prior ) > 0 ) then
             begin
                vItem_prior := trim(Copy( vItem_prior , 1, Pos( '@' , vItem_prior ) -1 ));
             end
             else
             if ( Pos( 'ico:' , vItem_prior ) > 0 ) then
             begin
                vItem_prior := trim(Copy( vItem_prior , 1, Pos( 'ico:' , vItem_prior ) -1 ));
             end;

             f1 := strTokenCount( vItem , ']' ) - 1;
             //8.0.0.0 treemenu
             if ( Pos( ']', vItem ) > 0 ) then
             begin
                vItem_parent := Trim( rc_ClearMenuParams( vItem ));
                vItem_parent := StringReplace( vItem_parent, ']', '', [rfReplaceAll] );
             end;

             Item := vItem;

             {$IFDEF DEBUG}
             if Pos( 'button types', lowercase( pMenuList[ i  ] ) ) > 0 then //7.5.0.3 lowercase
                cTbl := cTbl;
             if Pos( 'exemplos diversos', lowercase( pMenuList[ i  ] ) ) > 0 then //7.5.0.3 lowercase
                cTbl := cTbl;
             {$ENDIF}

             if f1<=0 then
                f1 := 0;

             if Pos( '@' , vItem ) > 0 then
             begin
                Item := trim(Copy( vItem , Pos( '@' , vItem ) + 1, 100 ));
                vItem := StringReplace( vItem , '@' + Item, '', [rfReplaceAll] );

                if Pos( ']', vItem ) > 0 then
                   Item := '<i class="rc-tree-align-icon ' + 'fa ' + Item + '"></i><span> ' + StringReplace( Trim( Copy( vItem , f1 , 100 ) ) , ']' , '', [rfReplaceAll] ) + ' [badge]</span> '
                else
                   Item := '<i class="rc-tree-align-icon ' + 'fa ' + Item + '"></i><span> ' + vItem + ' [badge]</span> ';

                cTemp := Item;
             end
             else
             //8.0.0.0
             if Pos( 'ico:' , vItem ) > 0 then
             begin
                cTemp := '';
                Item := trim(Copy( vItem , Pos( 'ico:' , vItem ) + 4, 200 )) + ' ';//8.0.0.0
                Item := trim(Copy( Item , 1, Pos( ' ' , Item ) ) );//8.0.0.0
                vItem := Copy( vItem, 1, Pos( 'ico:', vItem ) - 1 );
                //8.2.0.0
                // substituir fa- fas- far- etc..
                //if Copy( Item , 1, 2 ) = 'fa' then
                begin
                   cTemp := pMenuList[ i  ];
                   Item := rc_GetHintAttr( 'ico:' , cTemp, true, true, true );
                   Item := rc_AdjustIconsNames( Item ) ;
                   cTemp := '';
                end;
                //8.0.0.0
                if Pos( ']', vItem ) > 0 then
                   Item := '<i class="rc-tree-align-icon ' + Item + '"></i><span> ' + StringReplace( Trim( Copy( vItem , f1 , 100 ) ) , ']' , '', [rfReplaceAll] ) + ' [badge]</span> '
                else
                   Item := '<i class="rc-tree-align-icon ' + Item + '"></i><span> ' + vItem + ' [badge]</span> ';
                cTemp := Item;
             end
             else
             begin
                  // SubMenus ...
                  if Pos( ']', vItem ) > 0 then
                  begin
                     if f1 = 99 then
                     begin
                        // 6.0.0.0
                        if Trim( StringReplace( Item, ']', '', [rfReplaceAll] ) ) <> '-' then
                           Item := '<i class="rc-disable-hover"></i><span class="rc-disable-hover"> ' + StringReplace( Trim( Copy( vItem , f1 , 100 ) ) , ']' , '', [rfReplaceAll] ) + ' [badge]</span> '
                        else
                           Item := '-';
                     end
                     else
                     if f1 > 0 then
                        Item := '<i class="rc-tree-align-icon"></i><span> ' + StringReplace( Trim( Copy( vItem , f1 , 100 ) ) , ']' , '', [rfReplaceAll] ) + ' [badge]</span> '
                     else
                        Item := StringReplace( Trim( Copy( vItem , f1 , 100 ) ) , ']' , '', [rfReplaceAll] );
                  end
                  else
                      Item := vItem;

                  cTemp := Item;
             end;
             //8.0.0.0
             cBasic := '';
             if Pos( 'basic-crud:' , vItem ) > 0 then
             begin
                vItem := Copy( vItem, 1, Pos( 'basic-crud:', vItem ) - 1 );
                cBasic := 'S';
             end;
             //8.0.0.0
             if Pos( 'badge:' , vItem ) > 0 then
             begin
                vItem := Copy( vItem, 1, Pos( 'badge:', vItem ) - 1 );
                cBadge := pMenuList[ i  ];
                cBadge := rc_GetHintAttr( 'badge:' , cBadge, true, true, true );
                cTemp := StringReplace( cTemp, 'badge:' + cBadge, '', [rfReplaceAll] );
                if Pos( ']', vItem ) > 0 then
                   Item := StringReplace( cTemp, '[badge]', '<span class="badge bg-danger rc-tree-sub-badge-align-right">' + cBadge + '</span>', [rfReplaceAll] )
                else
                   Item := StringReplace( cTemp, '[badge]', '<span class="badge bg-danger rc-tree-badge-align-right ">' + cBadge + '</span>', [rfReplaceAll] );

                cTemp := '';
             end;
             Item := StringReplace( Item, '[badge]', '', [rfReplaceAll] );
             // 6.0.0.0
             //[PT] montar o Array com as informacoes do MENU e sua respectiva TABELA
             //[EN] assemble the Array with the MENU information and its respective TABLE
             if ( Item = '-1' ) then
                Inc( i )
             else
             if ( f1 >= 0 ) then
             begin
                  // 6.0.0.0 RC MICRO MENU
                  cTemp2 := rc_GetHintAttr( 'rcmenumicro:', TUniControl( pTreeMenu.Owner ).Hint );
                  cTemp3 := rc_GetHintAttr( 'treemenu:', pTreeMenu.Hint, true  );
                  if ( mm.CONFIG_LAYOUT_MENU_TYPE = '2' ) then //
                  begin
                     if ( Pos( 'Clone', pTreeMenu.Name ) > 0 ) then //cTemp2 = 'closed' then
                     begin
                        cTemp := Item;

                        Item := ReverseStr( Item );
                        Item := Copy( Item, Pos( '>naps/<', Item ) + 8 );
                        Item := Copy( Item, 1, Pos( '>', Item ) -1 );
                        Item := ReverseStr( Item );
                        Item := StringReplace( cTemp, Item , '', [rfReplaceAll] );
                     end;
                  end;
                  // ( in dev )
                  if ( f1 > 0 ) then
                  begin
                     if Pos( 'item 3.4', lowercase(Item) ) > 0 then
                        cTbl := cTbl;
                     if Pos( 'sub menu 4', lowercase(Item) ) > 0 then
                        cTbl := cTbl;
                  end;
                  // 6.0.0.0+menu micro RC MICRO MENU
                  if ( Pos( 'Clone', pTreeMenu.Name ) = 0 ) and ( ( f1 = 4 ) and ( ( mm.CONFIG_LAYOUT_MENU_TYPE <> '2' ) or ( cTemp2 = 'opened' ) ) ) then
                  begin
                     MainItemSub3 := pTreeMenu.Items.AddChild( MainItemSub2, Item );
                     // 6.0.0.0
                     if ( Pos( ' expand:' , pMenuList[ i ] ) > 0 ) and ( cTemp3 <> 'runit' ) then
                     begin
                        MainItem.Expanded := true;
                     end;
                  end
                  else
                  if ( Pos( 'Clone', pTreeMenu.Name ) = 0 ) and ( ( f1 = 3 ) and ( ( mm.CONFIG_LAYOUT_MENU_TYPE <> '2' ) or ( cTemp2 = 'opened' ) ) ) then
                  begin
                     MainItemSub2 := pTreeMenu.Items.AddChild( MainItemSub1, Item );
                     // 6.0.0.0
                     if ( Pos( ' expand:' , pMenuList[ i ] ) > 0 ) and ( cTemp3 <> 'runit' ) then
                     begin
                        MainItem.Expanded := true;
                     end;
                  end
                  else
                  if ( Pos( 'Clone', pTreeMenu.Name ) = 0 ) and ( ( f1 = 2 ) and ( ( mm.CONFIG_LAYOUT_MENU_TYPE <> '2' ) or ( cTemp2 = 'opened' ) ) ) then
                  begin
                     MainItemSub1 := pTreeMenu.Items.AddChild( MainItem, Item );
                     // 6.0.0.0
                     if ( Pos( ' expand:' , pMenuList[ i ] ) > 0 ) and ( cTemp3 <> 'runit' ) then
                     begin
                        MainItem.Expanded := true;
                     end;
                  end
                  else
                  if ( f1 = 1 ) then
                  begin
                     // 6.0.0.0
                     if ( Pos( 'Clone', pTreeMenu.Name ) = 0 ) and ( ( Pos( ' expand:' , pMenuList[ i ] ) > 0 ) and ( cTemp3 <> 'runit' ) ) then
                     begin
                          MainItem := pTreeMenu.Items.AddChild( nil, Item );
                     end
                     else
                        MainItem := pTreeMenu.Items.AddChild( nil, Item );
                     // 6.0.0.0
                     if ( Pos( 'Clone', pTreeMenu.Name ) = 0 ) and ( ( Pos( ' expand:' , pMenuList[ i ] ) > 0 ) and ( cTemp3 <> 'runit' ) ) then
                     begin
                        MainItem.Expanded := false;
                        MainItem.Expanded := true;
                        MainItem.Selected := pTreeMenu.Width > MAIN_MENU_MICRO ;
                        //MainItem.Tag := 1000;
                     end;
                  end
                  else
                  if ( Pos( 'Clone', pTreeMenu.Name ) = 0 ) and ( ( f1 = 99 ) and ( ( mm.CONFIG_LAYOUT_MENU_TYPE <> '2' ) or ( cTemp2 = 'opened' ) ) ) then
                  begin
                     MainItem := pTreeMenu.Items.AddChild( nil, Item );
                     MainItem.Enabled := false;                                                                                                          //#888
                     MainItem.Tag := 99; // 6.0.0.0+menu micro
                     // 6.0.0.0
                     if Item = '-' then
                        MainItem.Text := '<div class="rc-treemenu-title unselectable" style="border-top:1px solid;height:1px !important;background-color: transparent !important;"></div>'
                     else
                     if Item <> '' then
                        MainItem.Text := '<div class="rc-treemenu-title-unselectable" style="font-size:11px; text-transform:uppercase; left:-10px;pointer-events: none !important; background-color: transparent !important;">' + Item + '</div>'
                     else
                        MainItem.Text := '<div class="rc-treemenu-title unselectable" style="height:1px;background-color: transparent !important;"></div>';
                  end;
                  // 6.0.0.0 RC MICRO MENU
                  //[PT] se foi um grupo de nivel...reinicia o processo e não processa mais nada em seguida...
                  //[EN] if it was a level group... restart the process and do not process anything else afterwards...
                  if ( f1 = 99 ) then
                  begin
                       Inc( I );
                  end
                  else
                  begin
                      vItem_prior := pMenuList[ i ];

                      bItemIsNotSubMenu := ( Copy( pMenuList[ i ], 1, 1 ) = '<' ); // 6.0.0.0
                      pMenuList[ i ] := varIIF( bItemIsNotSubMenu, Copy( pMenuList[ i ], 2 ), pMenuList[ i ] ); // 6.0.0.0
                      {$IFDEF DEBUG}
                      if Pos( 'item 3.4', lowercase(pMenuList[ i ]) ) > 0 then
                         cTbl := cTbl;
                      {$ENDIF}
                      // processa até o próximo SUBMENU ou até o fim | processes until the next SUBMENU or until the end
                      Repeat
                         if f1 > 0 then
                            Inc( I );

                         if ( I <= High( pMenuList ) ) and ( pMenuList[ i ] <> '-1' ) then
                         begin
                            bShow := true;

                            if ( Trim( _pesquisa ) <> '' ) then
                               if ( Pos( lowercase( _pesquisa ) , lowercase( vItem ) ) > 0 ) then
                                  bShow := True
                               else
                                  bShow := False;

                            bItemIsNotSubMenu := ( Copy( pMenuList[ i ], 1, 1 ) = '<' ); // 6.0.0.0
                            pMenuList[ i ] := varIIF( bItemIsNotSubMenu, Copy( pMenuList[ i ], 2 ), pMenuList[ i ] ); // 6.0.0.0

                            bSubMenus := ( Copy( pMenuList[ i ], 1, 1 ) = ']' );
                            {$IFDEF DEBUG}
                            if Pos( 'button types', lowercase(pMenuList[ i ]) ) > 0 then
                               cTbl := cTbl;
                            {$ENDIF}
                            if ( ( Pos( '|', pMenuList[ i ] ) > 0 ) or
                               ( Pos( 'frm:', pMenuList[ i ] ) > 0 ) or
                               ( Pos( 'tbl:', pMenuList[ i ] ) > 0 ) ) or
                               ( Pos( 'fld:', pMenuList[ i ] ) > 0 ) or //  ( in dev )
                               ( not bSubMenus ) then
                            begin
                                 // tests
                                 {$IFDEF DEBUG}
                                 if Pos( 'rcblock' ,lowercase( pMenuList[ i  ] ) ) > 0 then //7.5.0.3 lowercase
                                    f1 := f1;
                                 if Pos( 'ovimento de', lowercase( pMenuList[ i  ] ) ) > 0 then //7.5.0.3 lowercase
                                    cTbl := cTbl;
                                 if Pos( 'item 3.4', lowercase(item) ) > 0 then
                                    cTbl := cTbl;
                                 if Pos( 'button types', lowercase( pMenuList[ i  ] ) ) > 0 then //7.5.0.3 lowercase
                                    cTbl := cTbl;
                                 {$ENDIF}

                                 if ( Pos( '|', pMenuList[ i ] ) > 0 ) then
                                    vItem := Trim( Copy( pMenuList[ i ] , 1, Pos( '|', pMenuList[ i ] ) - 1 ) )
                                 else
                                    vItem := pMenuList[ i ];

                                 if Pos( '@' , vItem ) > 0 then
                                 begin
                                    Item := trim(Copy( vItem , Pos( '@' , vItem ) + 1, 100 ));
                                    vItem := StringReplace( vItem , '@' + Item, '', [rfReplaceAll] );

                                    if Pos( ']', vItem ) > 0 then
                                       Item := '<i class="rc-tree-align-icon ' + 'fa ' + Item + '"></i><span> ' + StringReplace( Trim( Copy( vItem , f1 , 100 ) ) , ']' , '', [rfReplaceAll] ) + ' [badge]</span> '
                                    else
                                       Item := '<i class="rc-tree-align-icon ' + 'fa ' + Item + '"></i><span> ' + vItem + ' [badge]</span> ' ;

                                    cTemp := Item;//8.0.0.0
                                    // versao 1530 acima..traz FONTAWESOME 5
                                    mm.varA_FSideMenu[ mm.varI_NumMenu ].image := 'fa ' + Item;
                                 end
                                 else
                                 //8.0.0.0
                                 if Pos( 'ico:' , vItem ) > 0 then
                                 begin
                                    cTemp := '';
                                    Item := trim(Copy( vItem , Pos( 'ico:' , vItem ) + 4, 200 )) + ' ';//8.0.0.0
                                    Item := trim(Copy( Item , 1, Pos( ' ' , Item ) ) );//8.0.0.0
                                    vItem := Copy( vItem, 1, Pos( 'ico:', vItem ) - 1 );
                                    // substituir fa- fas- far- etc..
                                    if Copy( Item , 1, 2 ) = 'fa' then
                                    begin
                                       cIco := Copy( Item , 1, pos( '-', Item ) - 1 );
                                       Item := Trim( Copy( Item , pos( '-', Item ) + 1 ) ) + ' ';
                                       Item := Trim( Copy( Item , 1, pos( ' ', Item ) ) ) + ' ';
                                       mm.varA_FSideMenu[ mm.varI_NumMenu ].Icon  := cIco + '-' + Copy( Item , 1, pos( ' ', Item ) - 1 );; // 6.0.0.0
                                       Item := cIco + ' fa-' + Copy( Item , 1, pos( ' ', Item ) - 1 );
                                    end;

                                    if Pos( ']', vItem ) > 0 then
                                       Item := '<i class="rc-tree-align-icon ' + Item + '"></i><span> ' + StringReplace( Trim( Copy( vItem , f1 , 100 ) ) , ']' , '', [rfReplaceAll] ) + ' [badge]</span> '
                                    else
                                       Item := '<i class="rc-tree-align-icon ' + Item + '"></i><span> ' + vItem + ' [badge]</span> ' ;

                                    cTemp := Item;//8.0.0.0

                                    // versao 1530 acima..traz FONTAWESOME 5
                                    mm.varA_FSideMenu[ mm.varI_NumMenu ].image := Item;
                                 end
                                 else
                                 begin
                                      if Pos( ']', vItem ) > 0 then
                                      begin
                                         if f1 > 0 then
                                            Item := '<i class="rc-tree-align-icon"></i><span> ' + StringReplace( Trim( Copy( vItem , f1 , 100 ) ) , ']' , '', [rfReplaceAll] ) + ' </span> '
                                         else
                                            Item := StringReplace( Trim( Copy( vItem , f1 , 100 ) ) , ']' , '', [rfReplaceAll] );
                                      end
                                      else
                                          Item := vItem;
                                      Item := '<i style="color:' + GetWebColor( mm.CONFIG_LAYOUT_MENUFONT_COLOR ) + '" class="rc-tree-align-icon far fa-dot-circle"></i><span> ' + vItem + ' [badge]</span> ';

                                      cTemp := Item;//8.0.0.0

                                      // versao 1530 acima..traz FONTAWESOME 5
                                      mm.varA_FSideMenu[ mm.varI_NumMenu ].image := 'far fa-dot-circle';
                                      mm.varA_FSideMenu[ mm.varI_NumMenu ].Icon  := 'far-dot-circle' ; // 6.0.0.0
                                 end;
                                 //8.0.0.0
                                 if Pos( 'badge:' , vItem ) > 0 then
                                 begin
                                    Item := trim(Copy( vItem , Pos( 'badge:' , vItem ) + 6, 200 )) ;
                                    vItem := Copy( vItem, 1, Pos( 'badge:', vItem ) - 1 );
                                    cBadge := pMenuList[ i  ];
                                    cBadge := rc_GetHintAttr( 'badge:' , cBadge, true, true, true );
                                    cTemp := StringReplace( cTemp, 'badge:' + cBadge, '', [rfReplaceAll] );
                                    if Pos( ']', vItem ) > 0 then
                                       Item := StringReplace( cTemp, '[badge]', '<span class="badge bg-danger rc-tree-sub-badge-align-right">' + cBadge + '</span>', [rfReplaceAll] )
                                    else
                                       Item := StringReplace( cTemp, '[badge]', '<span class="badge bg-danger rc-tree-badge-align-right ">' + cBadge + '</span>', [rfReplaceAll] );

                                    cTemp := '';
                                 end;
                                 Item := StringReplace( Item, '[badge]', '', [rfReplaceAll] );

                                 //if bShow then
                                 begin
                                     cMenuListItem := pMenuList[ i ] + ' ';
                                     {$IFDEF DEBUG}
                                     if Pos( 'transportadoras', lowercase(item) ) > 0 then
                                        cTbl := cTbl;
                                     {$ENDIF}
                                     // 6.0.0.0
                                     bCloseBtn := true;
                                     if ( Pos( ' closebtn:', cMenuListItem ) > 0 ) then
                                     begin
                                        bCloseBtn     := false;
                                        cMenuListItem := StringReplace( cMenuListItem, ' closebtn:' , '', [rfReplaceAll] );
                                        Item          := StringReplace( Item , ' closebtn:' , '', [rfReplaceAll] );
                                     end;
                                     // 6.0.0.0
                                     if ( Pos( ' ico:', cMenuListItem ) > 0 ) then
                                     begin
                                        cIco          := Copy( cMenuListItem , Pos( ' ico:', cMenuListItem ) + 5, 100 );
                                        cIco          := Trim( Copy( cIco , 1, Pos( ' ', cIco )) );
                                        cMenuListItem := StringReplace( cMenuListItem, ' ico:' + cIco, '', [rfReplaceAll] );
                                        Item          := StringReplace( Item , ' ico:' + cIco, '', [rfReplaceAll] );
                                     end;
                                     //8.0.0.0
                                     cBadge := '';
                                     if ( Pos( ' badge:', cMenuListItem ) > 0 ) then
                                     begin
                                        cBadge        := Copy( cMenuListItem , Pos( ' badge:', cMenuListItem ) + 7, 100 );
                                        cBadge        := Trim( Copy( cBadge , 1, Pos( ' ', cBadge )) );
                                        cMenuListItem := StringReplace( cMenuListItem, ' badge:' + cBadge, '', [rfReplaceAll] );
                                        Item          := StringReplace( Item , ' badge:' + cBadge, '', [rfReplaceAll] );
                                     end;
                                     //8.0.0.0
                                     cBasic := '';
                                     if ( Pos( ' basic-crud:', cMenuListItem ) > 0 ) then
                                     begin
                                        cBasic        := 'S';
                                        cMenuListItem := StringReplace( cMenuListItem, ' basic-crud:', '', [rfReplaceAll] );
                                        Item          := StringReplace( Item , ' basic-crud:' , '', [rfReplaceAll] );
                                     end;
                                     // 6.0.0.0
                                     cFrm := '';
                                     if ( Pos( ' frm:', cMenuListItem ) > 0 ) then
                                     begin
                                        cFrm          := Copy( cMenuListItem , Pos( ' frm:', cMenuListItem ) + 5, 100 );
                                        cFrm          := Trim( Copy( cFrm , 1, Pos( ' ', cFrm )) );
                                        cMenuListItem := StringReplace( cMenuListItem, ' frm:' + cFrm, '', [rfReplaceAll] );
                                        Item          := StringReplace( Item , ' frm:' + cFrm, '', [rfReplaceAll] );
                                     end;
                                     // 6.0.0.0
                                     cTbl := '';
                                     if ( Pos( ' tbl:', cMenuListItem ) > 0 ) then
                                     begin
                                        cTbl          := Copy( cMenuListItem , Pos( ' tbl:', cMenuListItem ) + 5, 100 );
                                        cTbl          := Trim( Copy( cTbl , 1, Pos( ' ', cTbl ) ) );
                                        cMenuListItem := StringReplace( cMenuListItem, ' tbl:' + cTbl, '', [rfReplaceAll] );
                                        Item          := StringReplace( Item , ' tbl:' + cTbl, '', [rfReplaceAll] );
                                        cTbl          := Lowercase( cTbl ); //8.0.0.0
                                     end;
                                     // 6.0.0.0
                                     cFld := '';
                                     if ( Pos( ' fld:', cMenuListItem ) > 0 ) then
                                     begin
                                        cFld          := Copy( cMenuListItem , Pos( ' fld:', cMenuListItem ) + 5, 100 );
                                        cFld          := Trim( Copy( cFld , 1, Pos( ' ', cFld ) ) );
                                        cMenuListItem := StringReplace( cMenuListItem, ' fld:' + cFld, '', [rfReplaceAll] );
                                        Item          := StringReplace( Item , ' fld:' + cFld, '', [rfReplaceAll] );
                                     end;
                                     // 6.0.0.0
                                     bHidden := false;
                                     if ( Pos( ' hide:', cMenuListItem ) > 0 ) then
                                     begin
                                        bHidden       := True;
                                        cMenuListItem := StringReplace( cMenuListItem, ' hide:' , '', [rfReplaceAll] );
                                        Item          := StringReplace( Item , ' hide:' , '', [rfReplaceAll] );
                                     end;
                                     //8.0.0.1
                                     bNotShow := False;
                                     if ( Pos( ' notshow:', cMenuListItem ) > 0 ) or ( bHidden ) then
                                     begin
                                        bNotShow      := True;
                                        cMenuListItem := StringReplace( cMenuListItem, ' notshow:' , '', [rfReplaceAll] );
                                        Item          := StringReplace( Item , ' notshow:' , '', [rfReplaceAll] );
                                     end;
                                     // 6.0.0.0
                                     bMaster := false;
                                     if ( Pos( ' master:', cMenuListItem ) > 0 ) then
                                     begin
                                        bMaster       := True;
                                        cMenuListItem := StringReplace( cMenuListItem, ' master:' , '', [rfReplaceAll] );
                                        Item          := StringReplace( Item , ' master:' , '', [rfReplaceAll] );
                                     end;
                                     // 6.0.0.0
                                     bAskNew := false;
                                     if ( Pos( ' asknew:', cMenuListItem ) > 0 ) then
                                     begin
                                        bAskNew       := True;
                                        cMenuListItem := StringReplace( cMenuListItem, ' asknew:' , '', [rfReplaceAll] );
                                        Item          := StringReplace( Item , ' asknew:' , '', [rfReplaceAll] );
                                     end;
                                     // 6.0.0.0
                                     bNoGenID := false;
                                     if ( Pos( ' genid-off:', cMenuListItem ) > 0 ) then
                                     begin
                                        bNoGenID      := True;
                                        cMenuListItem := StringReplace( cMenuListItem, ' genid-off:' , '', [rfReplaceAll] );
                                        Item          := StringReplace( Item , ' genid-off:' , '', [rfReplaceAll] );
                                     end;
                                     // 6.0.0.0
                                     bZerosLeft := false;
                                     if ( Pos( ' zerosleft:', cMenuListItem ) > 0 ) then
                                     begin
                                        bZerosLeft    := True;
                                        cMenuListItem := StringReplace( cMenuListItem, ' zerosleft:' , '', [rfReplaceAll] );
                                        Item          := StringReplace( Item , ' zerosleft:' , '', [rfReplaceAll] );
                                     end;
                                     // 6.0.0.0
                                     bHideMaskOff := false;
                                     if ( Pos( ' hidemaskoff:', cMenuListItem ) > 0 ) then
                                     begin
                                        bHideMaskOff  := True;
                                        cMenuListItem := StringReplace( cMenuListItem, ' hidemaskoff:' , '', [rfReplaceAll] );
                                        Item          := StringReplace( Item , ' hidemaskoff:' , '', [rfReplaceAll] );
                                     end;
                                     // 6.0.0.0
                                     bGenID := false;
                                     if ( Pos( ' genid:', cMenuListItem ) > 0 ) then
                                     begin
                                        bGenID        := True;
                                        cMenuListItem := StringReplace( cMenuListItem, ' genid:' , '', [rfReplaceAll] );
                                        Item          := StringReplace( Item , ' genid:' , '', [rfReplaceAll] );
                                     end;
                                     // 6.0.0.0
                                     cTagForm := '';
                                     if ( Pos( ' tag-form:', cMenuListItem ) > 0 ) then
                                     begin
                                        cTagForm      := Copy( cMenuListItem , Pos( ' tag-form:', cMenuListItem ) + 10, 100 );
                                        cTagForm      := Trim( Copy( cTagForm , 1, Pos( ' ', cTagForm ) ) );
                                        cMenuListItem := StringReplace( cMenuListItem, ' tag-form:' + cTagForm, '', [rfReplaceAll] );
                                        Item          := StringReplace( Item , ' tag-form:' + cTagForm, '', [rfReplaceAll] );
                                     end;
                                     // 6.0.0.0
                                     cGetThisPK := '';
                                     if ( Pos( ' getpk:', cMenuListItem ) > 0 ) then
                                     begin
                                        cGetThisPK    := Copy( cMenuListItem , Pos( ' getpk:', cMenuListItem ) + 7, 100 );
                                        cGetThisPK    := Trim( Copy( cGetThisPK , 1, Pos( ' ', cGetThisPK ) ) );
                                        cMenuListItem := StringReplace( cMenuListItem, ' getpk:' + cGetThisPK, '', [rfReplaceAll] );
                                        Item          := StringReplace( Item , ' getpk:' + cGetThisPK, '', [rfReplaceAll] );
                                     end;

                                     if ( cFrm <> '' ) and
                                        ( ( ( Pos( '|', cMenuListItem ) = 0 ) and ( cTbl = '' ) ) or
                                        ( ( Pos( '|', cMenuListItem ) = 0 ) and ( cTbl <> '' ) ) or
                                        ( Pos( 'reportmenu' , lowercase( pMenuList[ i ] ) ) > 0  ) ) then //7.5.0.3 lowercase
                                        cFrm := '__' + cFrm // retro-compatibilidade( FORM sem heraça )
                                     else
                                     if ( Pos( '|', cMenuListItem ) > 0 ) then
                                     begin
                                        cTbl := Trim( Copy( cMenuListItem , Pos( '|', cMenuListItem ) + 1, 100 ) );
                                        cMenuListItem := Copy( cMenuListItem, 1, Pos( '|', cMenuListItem ) - 1 );
                                     end;

                                     ctemp := '';
                                     if ( cFrm <> '' ) then
                                     begin
                                        cTbl := cTbl + cFrm;
                                     end;
                                     Inc( iItemMenu ); // 6.0.0.0

                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].Option           := Trim( item );
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].table            := cTbl;
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].Form             := vItem_parent;//cFrm;//8.0.0.0 menu
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].FormName         := cFrm;//8.5.0.0 menu
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].RestrictionField := cFld;
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].Hidden           := bHidden;
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].AskNew           := bAskNew;
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].GenIDOnInsert    := bGenID; // 6.0.0.0
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].NoGenID          := bNoGenID; // 6.0.0.0
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].PKZerosLeft      := bZerosLeft; // 6.0.0.0
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].HideMaskOff      := bHideMaskOff; // 6.0.0.0 menu mask
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].Modal            := Pos( '__modal_', cFrm ) > 0;
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].CloseBtn         := bCloseBtn;  //closebtn
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].NotShow          := bNotShow;
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].Master           := bMaster;
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].Tag              := cTagForm; // 6.0.0.0
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].GetThisPK        := cGetThisPK; // 6.0.0.0
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].permission       := '';
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].Badge            := cBadge; //8.0.0.0
                                     mm.varA_FSideMenu[ mm.varI_NumMenu ].BasicCrud        := cBasic; //8.0.0.0

                                     iPerm := dm_rc.rc_GetIndexFromArray ( i.ToString + '.' , pMenuListPermissions ) - 1;
                                     if iPerm > 0 then
                                     begin
                                        mm.varA_FSideMenu[ mm.varI_NumMenu ].permission := iPerm.ToString;

                                        while ( iPerm <= High( pMenuListPermissions ) ) and ( Pos( i.ToString + '.',  pMenuListPermissions[ iPerm ] ) > 0 ) do
                                        begin
                                           mm.varA_FSideMenuPermissions[ mm.varI_NumMenuPermissions ] :=
                                              mm.varC_MenuGroup + '<|>' +  //group
                                              Trim( item ) + '<|>' +                     //option
                                              Trim( cTbl ) + '<|>' +                     //table -
                                              Trim( cFld ) + '<|>' +                     //field -
                                              pMenuListPermissions[ iPerm ];             //permission item

                                           inc( iPerm );

                                           Inc( mm.varI_NumMenuPermissions );
                                        end;
                                     end;
                                     //==================================================================================
                                     //[PT]
                                     // verifica restricao do usuário ao parâmetros "HIDDEN" na função "rc_BuildMenuItem"
                                     // A opção só será exibida se nas permissões do cadastro desse usuário estiver marcado
                                     // que tem "ACESSO" ou se for ADMIN( MASTER USER )
                                     //[EN]
                                     // check user restriction to "HIDDEN" parameters in "rc_BuildMenuItem" function
                                     // The option only will be displayed if this user's registration permissions is checked
                                     // which has "ACCESS" or if it is ADMIN( MASTER USER )
                                     //==================================================================================
                                     mm.varB_Yes := false;
                                     if ( not mm.varA_FSideMenu[ mm.varI_NumMenu ].NotShow ) then
                                     begin
                                        mm.varB_Yes := ( mm.varB_RunLogin ) and ( memUsers.FieldByName('master').AsString = '1' );//8.1.0.1
                                        {<*RC DB}
                                        // permission to see HIDDEN options or if not MASTER
                                        if not mm.varB_Yes then
                                           mm.varB_Yes :=  ( dm_rc.rc_PermissionVerify( 'showMenuOption' ,
                                                                varIIF( mm.varA_FSideMenu[ mm.varI_NumMenu ].RestrictionField = '',
                                                                        mm.varA_FSideMenu[ mm.varI_NumMenu ].table ,
                                                                        mm.varA_FSideMenu[ mm.varI_NumMenu ].RestrictionField ),
                                                                PT_ACCESS ) ); {RC DB*>}

                                        mm.varB_Yes := ( not mm.varA_FSideMenu[ mm.varI_NumMenu ].Hidden ) or
                                                       ( ( mm.varA_FSideMenu[ mm.varI_NumMenu ].Hidden ) and ( mm.varB_Yes ) );
                                        // permission if only MASTER
                                        if ( mm.varA_FSideMenu[ mm.varI_NumMenu ].Master ) then
                                           mm.varB_Yes := ( mm.varB_RunLogin ) and ( memUsers.FieldByName('master').AsString = '1' );//8.1.0.1 run login

                                        //if ( not mm.varA_FSideMenu[ mm.varI_NumMenu ].Hidden ) or
                                        //   ( ( mm.varA_FSideMenu[ mm.varI_NumMenu ].Hidden ) and ( mm.varB_Yes ) ) then
                                        if mm.varB_Yes then
                                        begin
                                            // 6.0.0.0
                                            if ( ( mm.CONFIG_LAYOUT_MENU_TYPE <> '2' ) or ( cTemp2 = 'opened' ) ) then // 6.0.0.0 RC MICRO MENU
                                            begin
                                               if ( Pos( 'Clone', pTreeMenu.Name ) = 0 ) and ( f1 = 4 ) then
                                                  MainItemSub4 := pTreeMenu.Items.AddChild( MainItemSub3, mm.varA_FSideMenu[ mm.varI_NumMenu ].option )
                                               else
                                               if ( Pos( 'Clone', pTreeMenu.Name ) = 0 ) and ( f1 = 3 ) then
                                                  MainItemSub3 := pTreeMenu.Items.AddChild( MainItemSub2, mm.varA_FSideMenu[ mm.varI_NumMenu ].option )
                                               else
                                               if ( Pos( 'Clone', pTreeMenu.Name ) = 0 ) and ( f1 = 2 ) then
                                                  MainItemSub2 := pTreeMenu.Items.AddChild( MainItemSub1, mm.varA_FSideMenu[ mm.varI_NumMenu ].option )
                                               else
                                               if ( Pos( 'Clone', pTreeMenu.Name ) = 0 ) and ( f1 = 1 ) then
                                                  MainItemSub1 := pTreeMenu.Items.AddChild( MainItem, mm.varA_FSideMenu[ mm.varI_NumMenu ].option )
                                               else
                                               if f1 = 0  then
                                               begin
                                                  //7.3.0.0
                                                  if ( Pos( 'Clone', pTreeMenu.Name ) = 0 ) then
                                                     MainItem := pTreeMenu.Items.AddChild( Nil, mm.varA_FSideMenu[ mm.varI_NumMenu ].option )
                                                  else
                                                  begin
                                                     cTemp := rc_GetHtmlTagContent( mm.varA_FSideMenu[ mm.varI_NumMenu ].option, '<span>' , '</span>' );
                                                     cTemp := StringReplace( mm.varA_FSideMenu[ mm.varI_NumMenu ].option, cTemp, '' , [rfReplaceAll] );
                                                     MainItem := pTreeMenu.Items.AddChild( Nil, cTemp );
                                                  end;
                                               end
                                               else
                                               if ( Pos( 'Clone', pTreeMenu.Name ) = 0 ) and ( f1 = 99 ) then
                                               begin
                                                  MainItem := pTreeMenu.Items.AddChild( Nil, mm.varA_FSideMenu[ mm.varI_NumMenu ].option );
                                                  MainItem.Text := mm.varA_FSideMenu[ mm.varI_NumMenu ].option + 'fixo';
                                               end;
                                            end;

                                            Inc( mm.varI_NumMenu );
                                        end;
                                     end;
                                 end;
                            end;
                         end;

                         if f1 = 0 then
                            Inc( I );

                         if ( I <= High( pMenuList ) ) then
                            f3 := strTokenCount( pMenuList[ i ] , '>' ) ;
                      Until ( i > High(pMenuList ) ) or ( pMenuList[i] = '-1' ) or ( Copy( pMenuList[i], 1, 1) = ']' );
                  end;

             end;
        end;
      except on e:exception do
             begin
                 rc_ShowSweetAlertError( 'rcBuildMainMenu<br><br>' + e.Message );
             end;
      end;
    end;
begin
     //if Pos( '|treemenu:', pTreeMenu.Hint ) = 0 then
     begin
        //[PT]------------------------------------------------------------------------------------------------------------------------------
        // Variaveis de controle do menu lateral - PODEM MUDAR SE A ATUACAO FOR ALTERADA em TEMPO DE EXECUCAO
        // Montar a estrutura
        //[EN]------------------------------------------------------------------------------------------------------------------------------
        // Side menu control variables - MAY CHANGE IF ACTION IS CHANGED IN EXECUTION TIME
        // Assemble the structure
        //------------------------------------------------------------------------------------------------------------------------------

        SetLength( mm.varA_MenuBasics, 1 );
        SetLength( mm.varA_MenuMovement, 1 );
        SetLength( mm.varA_MenuReport, 1 );
        SetLength( mm.varA_MenuTools, 1 );
        SetLength( mm.varA_MenuOptions, 1 );
        SetLength( mm.varA_MenuBasicsPermissions, 1 );
        SetLength( mm.varA_MenuMovementPermissions, 1 );
        SetLength( mm.varA_MenuReportPermissions, 1 );
        SetLength( mm.varA_MenuToolsPermissions, 1 );
        SetLength( mm.varA_MenuOptionsPermissions, 1 );
        //[PT] Se quiser usar apenas um grupo de menu, você pode usar o BASICS e comentar o restante.
        //[EN] If you only want to use a menu group, you can use BASICS and comment out the rest.
        mm.varI_Temp1 := 0; // 6.0.0.0 para fazer a sequência dos ítens em "mkm_menus"
        rc_BuildMenu_BASICS;
        rc_BuildMenu_MOVEMENT;
        rc_BuildMenu_REPORTS;
        rc_BuildMenu_TOOLS;
        rc_BuildMenu_OTHERS;
        // para zerar o ARRAY de itens de menu a cada exibição do menu lateral
        mm.varI_Temp1 := Length( mm.varA_MenuBasicsPermissions ) +
                         Length( mm.varA_MenuMovementPermissions ) +
                         Length( mm.varA_MenuReportPermissions ) +
                         Length( mm.varA_MenuToolsPermissions ) +
                         Length( mm.varA_MenuOptionsPermissions ) ;

        SetLength( mm.varA_FSideMenuPermissions , mm.varI_Temp1 );

        mm.varI_Temp1 := Length( mm.varA_MenuBasics ) +
                         Length( mm.varA_MenuMovement ) +
                         Length( mm.varA_MenuReport ) +
                         Length( mm.varA_MenuTools ) +
                         Length( mm.varA_MenuOptions ) ;

        SetLength( mm.varA_FSideMenu , mm.varI_Temp1 );

        mm.varA_FSideMenu[ 0 ].option := '';
        mm.varA_FSideMenu[ 0 ].table  := '';
        mm.varA_FSideMenu[ 0 ].image  := '';
        mm.varA_FSideMenu[ 0 ].Icon   := ''; // 6.0.0.0
        mm.varA_FSideMenu[ 0 ].permission := '';

        mm.varI_NumMenu    := 1;
        mm.varI_NumMenuPermissions := 1;
        //_sideMenuOK := False;

       vItem_prior := ' ';
       I := 1;

       // para versoes antigas do uniGUI, descomente as linhas abaixo
       // caso sua pesquisa esteja duplicando os itens
       //for I := 0 to pTreeMenu.Items.Count - 1 do
       //begin
       //
       //  pTreeMenu.Items[I].Text := '';
       //
       //end;
       // 6.0.0.0
       pTreeMenu.BeginUpdate;
       pTreeMenu.Items.Clear;
       //pTreeMenu.ResetData;
       //pTreeMenu.SingleExpand := pSearch = '';//false; // 6.0.0.0
       pTreeMenu.SingleExpand := false; // 6.0.0.0
       // varC_MenuGroup it´s used to fill dynamic permissions in "frmCadUSUARIOS"( USERS )
       mm.varC_MenuGroup := lowercase( mm.MNU_BASICS );// 'basicos';
       rc_BuildMENUS ( pSearch, mm.varA_MenuBasics, mm.varA_MenuBasicsPermissions );

       mm.varC_MenuGroup := lowercase( mm.MNU_MOVEMENT );//'movimento';
       rc_BuildMENUS ( pSearch, mm.varA_MenuMovement, mm.varA_MenuMovementPermissions );

       mm.varC_MenuGroup := lowercase( mm.MNU_REPORT );//'relatorios';
       rc_BuildMENUS ( pSearch, mm.varA_MenuReport, mm.varA_MenuReportPermissions );

       mm.varC_MenuGroup := lowercase( mm.MNU_TOOLS );//'ferramentas';
       rc_BuildMENUS ( pSearch, mm.varA_MenuTools, mm.varA_MenuToolsPermissions );

       mm.varC_MenuGroup := lowercase( mm.MNU_OTHERS );//'outros';
       rc_BuildMENUS ( pSearch, mm.varA_MenuOptions, mm.varA_MenuOptionsPermissions );
       // 6.0.0.0
       if ( pSearch <> '' ) then
       begin
           for I := 0 to pTreeMenu.Items.Count - 1 do
           begin
             s1 := LowerCase( pTreeMenu.Items[I].Text);
             s2 := LowerCase( pSearch );

             if pSearch <> '' then
             begin
                pTreeMenu.Items[I].Visible := (Length(s2) = 0) or (Pos(s2, s1 )>0);
                if pTreeMenu.Items[I].Visible then
                begin
                   pTreeMenu.Items[I].Expanded := False;
                   pTreeMenu.Items[I].Expanded := True;
                   //pTreeMenu.Items[I].Selected := True;
                end;
             end;
           end;
       end;
       pTreeMenu.EndUpdate;
       if Pos( '|treemenu:', pTreeMenu.Hint ) = 0 then
          pTreeMenu.Hint := rc_AddHintAttr( '|treemenu:firstinit' , pTreeMenu.Hint, true  );
     end;
end;

initialization
  RegisterModuleClass(tdm_rc);

end.

