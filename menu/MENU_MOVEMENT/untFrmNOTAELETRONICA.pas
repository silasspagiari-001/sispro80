unit untFrmNOTAELETRONICA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, uniBasicGrid, uniDBGrid, uniMultiItem,
  uniComboBox, uniDateTimePicker, uniEdit, UniButtonEdit, uniLabel,
  uniScrollBox, uniPageControl, uniButton, uniBitBtn, uniDBDateTimePicker,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, uniDBEdit, UniButtonDbEdit, uniGUImJSForm, unimScrollBox,
  Vcl.Menus, uniMainMenu, uniMemo, uniDBMemo, uniDBComboBox, uniSweetAlert,untfrmBaseCRUD,
  uniCheckBox;

type
  TAcaoCrud = (tpIncluir, tpAlterar, tpExcluir, tpListaVazia,tpListacomRegistros, tpCalcular);
  TfrmNOTAELETRONICA = class(TfrmBaseCRUD)
    B2: TUniMenuItem;
    N10: TUniMenuItem;
    UniScrollBox2: TUniScrollBox;
    UniPageControlnota: TUniPageControl;
    UniTabSheetgeral: TUniTabSheet;
    UniScrollBox3: TUniScrollBox;
    sqlSearchMasterDOCUMENTO: TIntegerField;
    sqlSearchMasterEMPRESA: TIntegerField;
    sqlSearchMasterKEY: TStringField;
    FDQryFiltroCODIGO: TIntegerField;
    FDQryFiltroNUMERO: TIntegerField;
    FDQryFiltroSERIE: TStringField;
    FDQryFiltroCANCELADA: TStringField;
    FDQryFiltroPESSOA: TIntegerField;
    FDQryFiltroCIDADE: TStringField;
    FDQryFiltroESTADO: TStringField;
    FDQryFiltroNOME: TStringField;
    FDQryFiltroVLRTOTAL: TFMTBCDField;
    FDQryFiltrostatus: TStringField;
    FDQryFiltroopcoes: TStringField;
    dstitulos: TDataSource;
    tbtitulos: TFDMemTable;
    tbtitulosPARCELA: TIntegerField;
    tbtitulosVALOR: TFloatField;
    tbtitulosVENCIMENTO: TDateTimeField;
    memprodutos: TFDMemTable;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
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
    dsprodutos: TDataSource;
    rcBlock400: TUniContainerPanel;
    rcBlock242: TUniContainerPanel;
    UniPopupMenudetalhes: TUniPopupMenu;
    UniTabSheetfaturamento: TUniTabSheet;
    UniScrollBox5: TUniScrollBox;
    rcBlock430: TUniContainerPanel;
    UniLabel48: TUniLabel;
    rcBlock440: TUniContainerPanel;
    rcBlock450: TUniContainerPanel;
    UniLabel49: TUniLabel;
    UniLabel50: TUniLabel;
    rcBlock460: TUniContainerPanel;
    rcBlock470: TUniContainerPanel;
    rcBlock480: TUniContainerPanel;
    rcBlock490: TUniContainerPanel;
    rcBlock500: TUniContainerPanel;
    UniLabel51: TUniLabel;
    UniLabel52: TUniLabel;
    UniLabel53: TUniLabel;
    UniDBEdit10: TUniDBEdit;
    UniDBEdit11: TUniDBEdit;
    UniDBEdit12: TUniDBEdit;
    UniDBEditinscricao: TUniDBEdit;
    UniDBEdit14: TUniDBEdit;
    UniDBEdit15: TUniDBEdit;
    UniLabel54: TUniLabel;
    UniDBEdit16: TUniDBEdit;
    UniLabel55: TUniLabel;
    dspessoas: TDataSource;
    FDQrypessoas: TFDQuery;
    rcBlock510: TUniContainerPanel;
    rcBlock520: TUniContainerPanel;
    rcBlock530: TUniContainerPanel;
    rcBlock540: TUniContainerPanel;
    UniDBEdit17: TUniDBEdit;
    UniDBEdit18: TUniDBEdit;
    UniDBEdit19: TUniDBEdit;
    UniDBEdit20: TUniDBEdit;
    UniLabel56: TUniLabel;
    UniLabel57: TUniLabel;
    UniLabel58: TUniLabel;
    UniLabel59: TUniLabel;
    rcBlock550: TUniContainerPanel;
    rcBlock560: TUniContainerPanel;
    rcBlock570: TUniContainerPanel;
    UniDBEdit21: TUniDBEdit;
    UniLabel60: TUniLabel;
    UniDBEditestado: TUniDBEdit;
    UniLabel61: TUniLabel;
    UniDBEdit23: TUniDBEdit;
    UniLabel62: TUniLabel;
    rcBlock580: TUniContainerPanel;
    UniLabel63: TUniLabel;
    rcBlock590: TUniContainerPanel;
    rcBlock600: TUniContainerPanel;
    rcBlock610: TUniContainerPanel;
    rcBlock620: TUniContainerPanel;
    UniDBEdit24: TUniDBEdit;
    UniDBEdit25: TUniDBEdit;
    UniDBEdit26: TUniDBEdit;
    UniDBEdit27: TUniDBEdit;
    UniLabel64: TUniLabel;
    UniLabel65: TUniLabel;
    UniLabel66: TUniLabel;
    UniLabel67: TUniLabel;
    rcBlock630: TUniContainerPanel;
    rcBlock640: TUniContainerPanel;
    UniDBEdit28: TUniDBEdit;
    UniDBEdit29: TUniDBEdit;
    UniLabel68: TUniLabel;
    UniLabel69: TUniLabel;
    UniPopupMenuopcoes: TUniPopupMenu;
    I1: TUniMenuItem;
    N1Nota: TUniMenuItem;
    I2: TUniMenuItem;
    N2: TUniMenuItem;
    E1: TUniMenuItem;
    C1: TUniMenuItem;
    C2: TUniMenuItem;
    A1: TUniMenuItem;
    R1: TUniMenuItem;
    N4: TUniMenuItem;
    N5: TUniMenuItem;
    N7: TUniMenuItem;
    N8: TUniMenuItem;
    D1: TUniMenuItem;
    N9: TUniMenuItem;
    UniPopupMenudetalhesnota: TUniPopupMenu;
    UniMenuItem1: TUniMenuItem;
    UniMemolog: TUniMemo;
    memprodutosSEMENTENOME: TStringField;
    memprodutosPERCCOFINS: TFloatField;
    memprodutosPERCPIS: TFloatField;
    L1: TUniMenuItem;
    d2: TUniMenuItem;
    N3: TUniMenuItem;
    N6: TUniMenuItem;
    B1: TUniMenuItem;
    FDQryFiltroCODIGOBARRAS: TStringField;
    FDQryFiltroEMISSAO: TDateField;
    rcBlock107: TUniContainerPanel;
    rcBlock108: TUniContainerPanel;
    labRcCollapse01: TUniLabel;
    rcBlock111: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    UniLabel14: TUniLabel;
    edLkpPESSOAS: TUniDBEdit;
    rcBlock140: TUniContainerPanel;
    UniLabel11: TUniLabel;
    rcBlock125: TUniContainerPanel;
    UniEditcpfcnpj: TUniEdit;
    UniLabel16: TUniLabel;
    rcBlock1145: TUniContainerPanel;
    UniLabel9: TUniLabel;
    edLkpCONDICOES: TUniDBEdit;
    rcBlock130: TUniContainerPanel;
    UniEditinscricao: TUniEdit;
    UniLabel17: TUniLabel;
    rcBlock150: TUniContainerPanel;
    UniComboBoxparaop: TUniComboBox;
    UniLabel8: TUniLabel;
    rcBlock135: TUniContainerPanel;
    UniEditrenasem: TUniEdit;
    UniLabel19: TUniLabel;
    rcBlock112: TUniContainerPanel;
    rcBlock160: TUniContainerPanel;
    UniDBEdit9: TUniDBEdit;
    UniLabel76: TUniLabel;
    rcBlock165: TUniContainerPanel;
    UniDBDateTimePicker3: TUniDBDateTimePicker;
    UniLabel74: TUniLabel;
    rcBlock170: TUniContainerPanel;
    UniEdit3: TUniEdit;
    UniLabel18: TUniLabel;
    rcBlock175: TUniContainerPanel;
    UniDBDateTimePicker4: TUniDBDateTimePicker;
    UniLabel75: TUniLabel;
    rcBlock155: TUniContainerPanel;
    UniDBEdit1: TUniDBEdit;
    UniLabel2: TUniLabel;
    sqlMasterKEY: TStringField;
    sqlMasterCODIGO: TIntegerField;
    sqlMasterDOCUMENTO: TIntegerField;
    sqlMasterCANCELADA: TStringField;
    sqlMasterOPERACAO: TIntegerField;
    sqlMasterEMPRESA: TIntegerField;
    sqlMasterNUMERO: TIntegerField;
    sqlMasterSERIE: TStringField;
    sqlMasterPESSOA: TIntegerField;
    sqlMasterCPFCNPJ: TStringField;
    sqlMasterFUNCIONARIO: TIntegerField;
    sqlMasterEMISSAO: TDateField;
    sqlMasterRECEPCAODESPACHO: TDateField;
    sqlMasterOBSERVACOES: TMemoField;
    sqlMasterCODIGOBARRAS: TStringField;
    sqlMasterPROTOCOLO: TStringField;
    sqlMasterVLRDSPTRIBUTADA: TFMTBCDField;
    sqlMasterVLRDSPNTRIBUTADA: TFMTBCDField;
    sqlMasterVLRBASEICMS: TFMTBCDField;
    sqlMasterVLRICMS: TFMTBCDField;
    sqlMasterVLRBASESUBSTITUICAO: TFMTBCDField;
    sqlMasterVLRSUBSTITUICAO: TFMTBCDField;
    sqlMasterVLRIPI: TFMTBCDField;
    sqlMasterVLRSERVICOS: TFMTBCDField;
    sqlMasterVLRDESCONTOS: TFMTBCDField;
    sqlMasterVLRPRODUTOS: TFMTBCDField;
    sqlMasterVLRTOTAL: TFMTBCDField;
    sqlMasterVLRENTRADA: TFMTBCDField;
    sqlMasterVLRDESPESAS: TFMTBCDField;
    sqlMasterVLRIMPOSTO: TFMTBCDField;
    sqlMasterCONDICAO: TIntegerField;
    sqlMasterCOMISSAOFUNCIONARIO: TFMTBCDField;
    sqlMasterTRANSPORTADORA: TIntegerField;
    sqlMasterTRAFRETE: TStringField;
    sqlMasterTRAESPECIE: TStringField;
    sqlMasterTRAMARCA: TStringField;
    sqlMasterTRAPESOBRUTO: TFMTBCDField;
    sqlMasterTRAPESOLIQUIDO: TFMTBCDField;
    sqlMasterTRAQUANTIDADE: TFMTBCDField;
    sqlMasterNUMEROPEDIDO: TStringField;
    sqlMasterSIGLAPAIS: TStringField;
    sqlMasterPORTADOR: TIntegerField;
    sqlMasterAPLICACAO: TIntegerField;
    sqlMasterPLANOCONTAS: TIntegerField;
    sqlMasterLOGIN: TStringField;
    sqlMasterSAFRA: TIntegerField;
    sqlMasterCODIGOBARRASCOMPLEMENTO: TStringField;
    sqlMasterLOGINCLUSAO: TStringField;
    sqlMasterLOGALTERACAO: TStringField;
    sqlMasterLOGTITULOS: TStringField;
    sqlMasterLOGENVIO: TStringField;
    sqlMasterLOGCANCELA: TStringField;
    sqlMasterLOGCARTA: TStringField;
    sqlMasterCARTACORRECAO: TStringField;
    sqlMasterDATACARTA: TDateField;
    sqlMasterBARRASCORRECAO: TStringField;
    sqlMasterPROTOCOLOCORRECAO: TStringField;
    sqlMasterDATANOTA: TDateField;
    sqlMasterHORANOTA: TTimeField;
    sqlMasterIMPORTAR: TStringField;
    sqlMasterOBSPEDIDO: TStringField;
    sqlMasterPEDIDO: TStringField;
    sqlMasterPEDIDO_SERIE: TStringField;
    sqlMasterPEDIDO_DOCUMENTO: TStringField;
    sqlMasterPARAMETROOPERACAO: TStringField;
    sqlMasterENTREGA_IBGE: TStringField;
    sqlMasterENTREGA_ENDERECO: TStringField;
    sqlMasterENTREGA_NUMERO: TStringField;
    sqlMasterENTREGA_CEP: TStringField;
    sqlMasterENTREGA_BAIRRO: TStringField;
    sqlMasterENTREGA_CIDADE: TStringField;
    sqlMasterENTREGA_ESTADO: TStringField;
    sqlMasterCHAVEACESSO: TBlobField;
    sqlMasterFECHAMENTO_DATA: TDateField;
    sqlMasterFECHAMENTO_OBS: TStringField;
    sqlMasterFECHAMENTO_STATUS: TStringField;
    sqlMasterTIPOLOTE: TStringField;
    sqlMasterVLRICMSDESONERACAO: TFMTBCDField;
    edLkpFUNCIONARIOS: TUniDBEdit;
    rcBlock180: TUniContainerPanel;
    rcBlock181: TUniContainerPanel;
    UniLabel3: TUniLabel;
    rcBlock200: TUniContainerPanel;
    rcBlock190: TUniContainerPanel;
    rcBlock220: TUniContainerPanel;
    rcBlock210: TUniContainerPanel;
    rcBlock230: TUniContainerPanel;
    rcBlock240: TUniContainerPanel;
    UniLabel24: TUniLabel;
    UniDBFormattedNumberEditdescontos: TUniDBFormattedNumberEdit;
    UniLabel25: TUniLabel;
    UniDBFormattedNumberEditvlrprodutos: TUniDBFormattedNumberEdit;
    UniLabel27: TUniLabel;
    UniDBFormattedNumberEditvlrdespesas: TUniDBFormattedNumberEdit;
    rcBlock250: TUniContainerPanel;
    rcBlock265: TUniContainerPanel;
    rcBlock269: TUniContainerPanel;
    UniDBMemoobs: TUniDBMemo;
    rcBlock243: TUniContainerPanel;
    UniLabel1: TUniLabel;
    rcBlock254: TUniContainerPanel;
    rcBlock262: TUniContainerPanel;
    rcBlock272: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit;
    rcBlock282: TUniContainerPanel;
    UniLabel10: TUniLabel;
    UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit;
    rcBlock292: TUniContainerPanel;
    UniLabel12: TUniLabel;
    UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit;
    rcBlock302: TUniContainerPanel;
    rcBlock312: TUniContainerPanel;
    UniLabel21: TUniLabel;
    UniDBFormattedNumberEdit10: TUniDBFormattedNumberEdit;
    rcBlock322: TUniContainerPanel;
    rcBlock245: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniLabel26: TUniLabel;
    UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit;
    UniLabel15: TUniLabel;
    UniLabel4: TUniLabel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit;
    UniLabel5: TUniLabel;
    UniLabel23: TUniLabel;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;
    UniLabel30: TUniLabel;
    UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit;
    UniLabel13: TUniLabel;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    rcBlock335: TUniContainerPanel;
    UniDBEdit7: TUniDBEdit;
    UniLabel43: TUniLabel;
    UniPageControlprodutos: TUniPageControl;
    UniTabSheetProdutos: TUniTabSheet;
    UniDBGridprodutos: TUniDBGrid;
    UniTabSheettransporte: TUniTabSheet;
    rcBlock270: TUniContainerPanel;
    UniLabel20: TUniLabel;
    rcBlock890: TUniContainerPanel;
    UniLabel35: TUniLabel;
    edLkpTRANSPORTES: TUniDBEdit;
    rcBlock900: TUniContainerPanel;
    edLkpTRANSPORTES_SetDS_CPFCNPJ: TUniDBEdit;
    UniLabel37: TUniLabel;
    rcBlock910: TUniContainerPanel;
    UniDBEdit5: TUniDBEdit;
    UniLabel38: TUniLabel;
    rcBlock920: TUniContainerPanel;
    UniLabel47: TUniLabel;
    UniComboBoxtrafrete: TUniComboBox;
    rcBlock930: TUniContainerPanel;
    UniLabel28: TUniLabel;
    UniDBComboBoxESPECIE: TUniDBComboBox;
    rcBlock940: TUniContainerPanel;
    UniDBEdit2: TUniDBEdit;
    UniLabel29: TUniLabel;
    rcBlock950: TUniContainerPanel;
    UniDBFormattedNumberEditpesobruto: TUniDBFormattedNumberEdit;
    UniLabel33: TUniLabel;
    rcBlock960: TUniContainerPanel;
    UniDBFormattedNumberEditpesoliquido: TUniDBFormattedNumberEdit;
    UniLabel34: TUniLabel;
    rcBlock970: TUniContainerPanel;
    UniLabel72: TUniLabel;
    UniDBFormattedNumberEditQUANTIDADE: TUniDBFormattedNumberEdit;
    rcBlock965: TUniContainerPanel;
    rcBlock990: TUniContainerPanel;
    rcBlock1000: TUniContainerPanel;
    UniTabSheetreferencia: TUniTabSheet;
    rcBlock860: TUniContainerPanel;
    UniLabel45: TUniLabel;
    rcBlock870: TUniContainerPanel;
    UniDBEditdevolucao: TUniDBEdit;
    UniLabel46: TUniLabel;
    UniTabSheetdetalhesnota: TUniTabSheet;
    rcBlock370: TUniContainerPanel;
    UniLabel41: TUniLabel;
    rcBlock820: TUniContainerPanel;
    UniDBEdit8: TUniDBEdit;
    UniLabel44: TUniLabel;
    rcBlock830: TUniContainerPanel;
    UniDBEdit13: TUniDBEdit;
    UniLabel70: TUniLabel;
    rcBlock840: TUniContainerPanel;
    UniDBEdit22: TUniDBEdit;
    UniLabel71: TUniLabel;
    rcBlock850: TUniContainerPanel;
    UniTabSheet1: TUniTabSheet;
    rcBlock800: TUniContainerPanel;
    dbgTITULOS: TUniDBGrid;
    rcBlock255: TUniContainerPanel;
    UniLabel22: TUniLabel;
    UniDBFormattedNumberEdit11: TUniDBFormattedNumberEdit;
    edLkpOPERACOES: TUniDBEdit;
    rcBlock247: TUniContainerPanel;
    UniDBEdit3: TUniDBEdit;
    UniLabel31: TUniLabel;
    UniPopupMenuopcaoprodutos: TUniPopupMenu;
    D4: TUniMenuItem;
    N16: TUniMenuItem;
    V2: TUniMenuItem;
    t1: TUniMenuItem;
    N11: TUniMenuItem;
    EntregadosItenss1: TUniMenuItem;
    N12: TUniMenuItem;
    A2: TUniMenuItem;
    N13: TUniMenuItem;
    E2: TUniMenuItem;
    N14: TUniMenuItem;
    BoletoBancrio1: TUniMenuItem;
    N15: TUniMenuItem;
    RecibodeRetirada1: TUniMenuItem;
    N17: TUniMenuItem;
    UniLabel77: TUniLabel;
    UniComboBoxDesoneracao: TUniComboBox;
    UniDBFormattedNumberEditVLRICMSDESONERACAO: TUniDBFormattedNumberEdit;
    memprodutosVLRICMSDESONERACAO: TFloatField;
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
    memprodutosMARCA: TStringField;
    sqlMasterTRANUMERO: TStringField;
    UniLabel78: TUniLabel;
    UniDBComboBoxMARCA: TUniDBComboBox;

    procedure UniFrameCreate(Sender: TObject);
    procedure sqlMasterAfterOpen(DataSet: TDataSet);
    procedure dsMasterStateChange(Sender: TObject);
    procedure FDQryFiltrostatusGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure FDQryFiltroopcoesGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure memprodutosbuscaprodutoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure memprodutosexcluiGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure memprodutosAfterPost(DataSet: TDataSet);
    procedure memprodutosAfterDelete(DataSet: TDataSet);
    procedure memprodutosBeforeDelete(DataSet: TDataSet);
    procedure memprodutosBeforePost(DataSet: TDataSet);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnCalcReg2Click(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure UniDBGridprodutosCellClick(Column: TUniDBGridColumn);
    procedure UniButtonDbEditcodigocondicaomestreButtonClick(Sender: TObject);
    procedure UniButtonDbEditcodigocondicaomestreExit(Sender: TObject);
    procedure UniButtonDbEditcodigopessoasButtonClick(Sender: TObject);
    procedure UniButtonDbEditcodigopessoasExit(Sender: TObject);
    procedure UniButtonDbEditTRANSPORTADORAButtonClick(Sender: TObject);
    procedure UniDBFormattedNumberEditdescontosExit(Sender: TObject);
    procedure UniDBFormattedNumberEditvlrdespesasExit(Sender: TObject);
    procedure UniButtonDbEditcodigofuncionariomestreExit(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure C2Click(Sender: TObject);
    procedure memprodutosbuscaloteGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure D1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure UniMenuItem1Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure L1Click(Sender: TObject);
    procedure I2Click(Sender: TObject);
    procedure d2Click(Sender: TObject);

    procedure B1Click(Sender: TObject);
    procedure B2Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure memprodutosopcoesGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure btntransp2Click(Sender: TObject);
    procedure edLkpTRANSPORTESExit(Sender: TObject);
    procedure edLkpPESSOASClick(Sender: TObject);
    procedure edLkpPESSOASExit(Sender: TObject);
    procedure sqlMasterCANCELADAGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure edLkpOPERACOESClick(Sender: TObject);
    procedure edLkpPRODUTOSClick(Sender: TObject);
    procedure A2Click(Sender: TObject);
    procedure BoletoBancrio1Click(Sender: TObject);
    procedure D4Click(Sender: TObject);
    procedure E2Click(Sender: TObject);
    procedure EntregadosItenss1Click(Sender: TObject);
    procedure RecibodeRetirada1Click(Sender: TObject);
    procedure t1Click(Sender: TObject);
    procedure V2Click(Sender: TObject);
    procedure btnvendedorClick(Sender: TObject);
    procedure AjustaBtnVendedor;
    procedure UniFormResize(Sender: TObject);
    procedure UniComboBoxparaopChange(Sender: TObject);
    procedure UniDBFormattedNumberEditFRETEExit(Sender: TObject);
    procedure UniDBGridprodutosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FNotaPronta: Boolean;
    FCarregandoNota: Boolean;
    FPesquisaProdutoAberta: Boolean;
    { Private declarations }
  posicao_x, posicao_y    : Integer;
    procedure PesquisarProdutoGrid;
  public
    { Public declarations }
  varC_Documento_MvmestreNFE : Integer;
  procedure  SetBut(Acao:TAcaoCrud);

  procedure  carregadados();
  procedure  carregafinanceiro(cempresa,cdocumento,cnumero:integer);
  procedure  carregaitens(cempresa,cdocumento,cnumero:integer);
  procedure  LimpaVars();
  procedure  Calcula_Titulos();
  procedure  GravaMovimento();
  procedure  Calcula_Totais();
  function   CamposValidados :Boolean;
  procedure  gravamemoria();
  procedure  geradescricaonota();
  procedure  carregaprodutos(codigo:string);
  procedure  CarregaParametros();
  procedure  Exclui();
  procedure  Parametrocfoppessoa();
  procedure  Calculapiscofins();
  procedure  Calcula_Documento();

  function  Base_Icms(F_ESTADO, F_INSCRICAO :string; F_OPERACAO: Integer):real;
  function  Aliq_Icms(F_ESTADO, F_INSCRICAO :string; F_OPERACAO: Integer):real;
  procedure Calcula_Icms(F_TIPO:String);
  procedure HabilitaMenuAdiiconais(tipo:Boolean);

  procedure MemoGravaLog();
  procedure CarregaImportacao(const controle:integer);

  procedure ValidaInfoProdutoMemoria(foperacao:real;fproduto,fempresa:integer);
  procedure ReleituraProdutoscfop();

  procedure carregalote(lote:string;produto:integer);
  procedure AtualizaPedido(const Numero, Documento: Integer);

  procedure  carregaMovimento_comissao(const pnumero,pdocumento,pempresa:integer);
  procedure  EntregaFuturaCRUD(acao:string);
  procedure  carregaitensef(cempresa,cdocumento,cnumero,csequencia:integer);
  procedure  AnexarItensEntregaPN();
  procedure  ReanalisarItensEntregaPN();
  procedure  gravalotesementeorigem(const pacao:string);
  function   VerificaDataDocumentoOriginal(const cpedido,cdocumento:string):TDateTime;
  procedure  VerificaEdicao();
  procedure  HabilitaCombobox(status: boolean);
  procedure  CarregaMarca();
  procedure  FechaTabelas();

  end;

var
  frmNOTAELETRONICA: TfrmNOTAELETRONICA;
  state            : string;

implementation

{$R *.dfm}

uses mkm_validate, mkm_func_web, System.TypInfo, MainModule, System.DateUtils, untDM_RC,
  mkm_procedures, uniGUITypes, mkm_funcoes, Vcl.Grids, untFrmPesquisa,
  mkm_impressao, unReportImpressao, untFrmTELAGENERICA,
  untFrmTransfereImportacao, untfrmSEFAZNOTA, untfrmPesquisalote,
  untfrmDeclaracaoretirada, ServerModule, uconsts, Vcl.Clipbrd,
  untFrmDETALHESITENSNOTA, untFrmTRANSPORTADORAMOVIMENTO, untFrmLookUp,
  untFrmCADCHEQUEMOVIMENTO, untFrmTELAMOVIMENTOBOLETOS, untFrmMOVIMENTOVENDEDOR,
  untFrmENVIOEMAIL, untFrmDUPLICANOTA,untPesquisaGenerica,untFrmFINANCEIRONOTA;

type
  TNotaGridAccess = class(TUniDBGrid);

procedure TfrmNOTAELETRONICA.A1Click(Sender: TObject);
begin
  if sqlSearchMaster.FindField('CANCELADA').AsString <> 'A' then
    begin
      dm_rc.rc_ShowSweetAlert( 'Ok', 'NÃO FOI PERMITIDO FAZER A IMPRESSÃO' , 'error');
      abort
    end
  else
  dm_rc.rc_ShowYesNo( 'POSSO IMPRIMIR AS AUTORIZAÇÃO DE REEMBALO?' );
  if mm.varB_Yes then
    begin
      mm.varC_caminhopdf :=  IMPRESSAO_Autorizareembalo(mm.varI_Code_Company,
                                                        sqlSearchMaster.FindField('CODIGO').AsInteger);
      unfImpressao.ShowModal();
    end;
end;

function TfrmNOTAELETRONICA.Aliq_Icms(F_ESTADO, F_INSCRICAO: string;F_OPERACAO: Integer): real;
begin
  TabelaOperacao('SELECT * FROM OPERACOES WHERE CODIGO = ' + IntToStr(F_OPERACAO));
  TabelaEmpresas('SELECT *  FROM EMPRESAS WHERE CODIGO = ' + IntToStr(MM.varI_Code_Company));

  if (dm_rc.FDQryoperacoes.FindField('CALCULA_ICMS').AsString = '0') then
  result := 0
  else
  if FDQrypessoas.FindField('ESTADO').AsString = dm_rc.tbempresas.FindField('UF').AsString then
  result := memprodutos.FindField('Icm0').AsFloat
  else
  if StrContains('MT#MS#TO#PA#AM#AC#PB#RN#SE#PE#ES#RO#AP#AL#CE#BA#DF#GO#MA#NO#RS#PI#RR',F_ESTADO) then
  begin
  if StrEmpty(F_INSCRICAO) then
  result := memprodutos.FindField('Icm0').AsFloat
  else
  result := memprodutos.FindField('Icm1').AsFloat;
  end
  else
  if StrEmpty(F_INSCRICAO) then
  result := memprodutos.FindField('Icm0').AsFloat
  else
  result := memprodutos.FindField('Icm2').AsFloat;

  if (dm_rc.FDQryoperacoes.FindField('ENTRADA_SAIDA').AsString = '0') then
  begin
  if (dm_rc.FDQryoperacoes.FindField('ENTRADA_SAIDA').AsInteger = 0) and (StrContains('2',IntToStr(varC_Documento_MvmestreNFE))) then
  begin
  if not StrEmpty(F_INSCRICAO) then
  result := variif(StrContains('MT#MS#TO#PA#AM#PB#AC#RN#SE#PE#ES#RO#AP#AL#CE#BA#DF#GO#MA#NO#RS#PI#RR#PR',F_ESTADO),memprodutos.FindField('Icm2').AsFloat, memprodutos.FindField('Icm0').AsFloat)
  else
  result := memprodutos.FindField('Icm1').AsFloat;
  end
  else
  begin
  if StrEmpty(F_INSCRICAO) then
  result := memprodutos.FindField('Icm1').AsFloat
  else
  if FDQrypessoas.FindField('ESTADO').AsString = dm_rc.tbempresas.FindField('UF').AsString then
    result := memprodutos.FindField('Icm0').AsFloat
  else
    result := memprodutos.FindField('Icm2').AsFloat;
  end;
  end;

end;

procedure TfrmNOTAELETRONICA.AtualizaPedido(const Numero, Documento: Integer);
begin
  if (Numero <= 0) or (Documento <= 0) then
    Exit;

  if TabelaMvmestre('select * from MVMESTRE where NUMERO = ' + IntToStr(Numero) +
    ' and DOCUMENTO = ' + IntToStr(Documento) +
    ' and EMPRESA = ' + IntToStr(mm.varI_Code_Company)) then
  begin
    dm_rc.FDQryMvmestre.Edit;
    dm_rc.FDQryMvmestre.FindField('FECHAMENTO_DATA').AsDateTime :=
      sqlMaster.FindField('EMISSAO').AsDateTime;
    dm_rc.FDQryMvmestre.FindField('FECHAMENTO_OBS').AsString :=
      'Pedido faturado pela NF-e: ' + sqlMaster.FindField('NUMERO').AsString;
    dm_rc.FDQryMvmestre.FindField('FECHAMENTO_STATUS').AsString := 'Finalizado';
    dm_rc.FDQryMvmestre.Post;
  end;
end;


procedure TfrmNOTAELETRONICA.B1Click(Sender: TObject);
var
  M_ANO, M_PATH, M_ARQUIVO : string;
begin
  try
    M_ARQUIVO :=  FDQryFiltroCODIGOBARRAS.AsString + '-nfe.xml';
    M_ANO     :=  FormatDateTime('yyyy',FDQryFiltroEMISSAO.AsDateTime);
    M_PATH    :=  Validacaminho(mm.varI_Code_Company,
                                mm.M_PATHXML,
                                mm.varC_Doc_Customer,
                                'NFe',
                                FDQryFiltroEMISSAO.AsString,'') + FDQryFiltroCODIGOBARRAS.AsString + '-nfe.xml';
    if FDQryFiltroCODIGOBARRAS.AsString <> '' then
      begin
        Downloadremessa(ExtractFilePath(M_PATH),ExtractFileName(M_PATH));
        UniSession.SendFile(sm.FilesFolderPath+M_ARQUIVO);
        DeleteFile(sm.FilesFolderPath+M_ARQUIVO);
      end;
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não achei o ARQUIVO XML' , 'error');
  end;
end;

procedure TfrmNOTAELETRONICA.B2Click(Sender: TObject);
begin
  if sqlSearchMaster.IsEmpty then
  begin
    dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Selecione uma nota para consultar o financeiro.',
      'warning');
    Exit;
  end;

  mm.varI_Code_Numero_Documento := sqlSearchMaster.FindField('NUMERO').AsInteger;
  mm.varI_Code_documento_serie := sqlSearchMaster.FindField('SERIE').AsString;
  mm.VarC_Atelagenerica := 'FINANCEIRODOC';
  frmTELAGENERICA.ShowModal();
end;

procedure TfrmNOTAELETRONICA.R1Click(Sender: TObject);
begin
  if sqlSearchMaster.IsEmpty then
  begin
    dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Selecione uma nota para emitir o recibo.',
      'warning');
    Exit;
  end;

  if sqlSearchMaster.FindField('CANCELADA').AsString <> 'A' then
  begin
    dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'O recibo somente pode ser impresso para notas autorizadas.',
      'warning');
    Exit;
  end;

  dm_rc.rc_ShowYesNo('Posso imprimir o recibo de retirada?');
  if mm.varB_Yes then
  begin
    mm.varC_caminhopdf := IMPRESSAO_recibonota(mm.varI_Code_Company,
      sqlSearchMaster.FindField('CODIGO').AsInteger);
    unfImpressao.ShowModal();
  end;
end;

function TfrmNOTAELETRONICA.Base_Icms(F_ESTADO, F_INSCRICAO: string;F_OPERACAO: Integer): real;
begin
  TabelaOperacao('SELECT * FROM OPERACOES WHERE CODIGO = ' + IntToStr(F_OPERACAO));
  TabelaEmpresas('SELECT *  FROM EMPRESAS WHERE CODIGO = ' + IntToStr(MM.varI_Code_Company));

  if StrEmpty(F_ESTADO) then
  begin
//    msg('Estado Esta Vazio Verifique');
    abort;
  end;

  if (dm_rc.FDQryoperacoes.FindField('CALCULA_ICMS').AsInteger = 0) then
  result := 0
  else
  if FDQrypessoas.FindField('ESTADO').AsString = dm_rc.tbempresas.FindField('UF').AsString then
  result := memprodutos.FindField('Bas0').AsFloat
  else
  if StrContains('MT#MS#TO#PA#AM#AC#PB#RN#SE#PE#ES#RO#AP#AL#CE#BA#DF#GO#MA#NO#RS#PI#RR',F_ESTADO) then
  begin
  if StrEmpty(F_INSCRICAO) then
    result := memprodutos.FindField('Bas0').AsFloat
  else
    result := memprodutos.FindField('Bas1').AsFloat;
  end
  else
  if StrEmpty(F_INSCRICAO) then
  result := memprodutos.FindField('Bas0').AsFloat
  else
  result := memprodutos.FindField('Bas2').AsFloat;
end;

procedure TfrmNOTAELETRONICA.btnCalcReg2Click(Sender: TObject);
begin
  inherited;
  //************************************************************************//
  // VERIFICA OS ITENS
  //************************************************************************//
  if (Trim(sqlMaster.FindField('PESSOA').AsString) = '')  then
  begin
    dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Informe a pessoa antes de calcular a nota.',
      'warning');
    edLkpPESSOAS.SetFocus;
    Exit;
  end;

  Parametrocfoppessoa();
  ReleituraProdutoscfop();

  //************************************************************************//
  // DESONERACAO DE ICMS
  //************************************************************************//
  if UniComboBoxDesoneracao.Text = 'Sim' then
    mm.vari_calculodesonerado := 'T'
  else
    mm.vari_calculodesonerado := 'F';

  Calcula_Totais();
  Calcula_Icms('');

  //************************************************************************//
  dm_rc.rc_ShowYesNo( 'POSSO CALCULAR ESSE DOCUMENTO?' );
  if mm.varB_Yes then
    begin
      dbgTITULOS.Options                 := dbgTITULOS.Options + [dgEditing];

      if sqlMaster.FindField('PEDIDO').AsString = '' then
        Calcula_Titulos()
      else
        if (VerificaDataDocumentoOriginal(sqlMaster.FindField('PEDIDO').AsString,sqlMaster.FindField('PEDIDO_DOCUMENTO').AsString) <> sqlMaster.FindField('EMISSAO').AsDateTime) then
          Calcula_Titulos();
    end;

  Calcula_Documento();
  SetBut(tpCalcular);
end;

procedure TfrmNOTAELETRONICA.btnCancelRegClick(Sender: TObject);
begin
  sqlMaster.Cancel;
  sqlMaster.CancelUpdates;
  tbtitulos.Close;
  memprodutos.Close;
  FDQrypessoas.Close;
  LimpaVars;
  // The base may close a modal frame; do not access Self after inherited.
  inherited;
end;

procedure TfrmNOTAELETRONICA.btnDeleteRegClick(Sender: TObject);
begin
  if sqlSearchMaster.IsEmpty then Exit;
  dbgSearchCRUDDblClick(Sender);

  if StrContains('A#C',sqlSearchMaster.FindField('CANCELADA').AsString) then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NÃO FOI PERMITIDO FAZER A EXCLUSÃO' , 'error');
      abort
    end
  else
    begin
      mm.VarC_Atelagenerica            := 'SENHAEXCLUSAONOTA';
      frmTELAGENERICA.ShowModal();

      if mm.varS_SenhaExclusaoNota_permitido = 'T' then
        begin
          mm.varS_SenhaExclusaoNota_permitido := '';
          Exclui();
        end
      else
        begin
          dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Operação cancelada pelo USUÁRIO!' , 'warning' );
          Abort
        end;
    end;


end;

procedure TfrmNOTAELETRONICA.btnEditRegClick(Sender: TObject);
var
  S, R: Integer;
begin
  if sqlSearchMaster.IsEmpty then Exit;

  if sqlSearchMaster.FindField('CANCELADA').AsString <> '' then
    begin
      UniPopupMenudetalhesnota.PopupBy( TUniButton( sender ) );
      Abort;
    end;

  inherited;
  if not (sqlMaster.State in [dsEdit, dsInsert]) then Exit;

  CarregaParametros();

  UniComboBoxparaop.Enabled          := true;
  pgBaseCadControl.ActivePage        := tabRegister;
  UniPageControlprodutos.ActivePage  := UniTabSheetProdutos;

  SetBut(tpAlterar);


  Try
    UniDBGridprodutos.Options          := UniDBGridprodutos.Options - [dgRowSelect];
    UniDBGridprodutos.Options          := UniDBGridprodutos.Options + [dgEditing];

    if sqlMaster.State in [dsInsert] then
    begin
      S := 1;
      tbtitulos.Close;
      tbtitulos.Open;

      memprodutos.Close;
      memprodutos.Open;
    end
    else
      S := memprodutos.RecordCount + 10;

    memprodutos.DisableControls;
    memprodutos.AfterDelete  := nil;
    memprodutos.AfterPost    := nil;
    memprodutos.BeforePost   := nil;
    memprodutos.BeforeDelete := nil;

    for R := S to S + 25 do
    begin
      memprodutos.Append;
      memprodutos.Post;
    end;

    memprodutos.First;
    memprodutos.AfterDelete  := memprodutosAfterDelete;
    memprodutos.AfterPost    := memprodutosAfterPost;
    memprodutos.BeforeDelete := memprodutosBeforeDelete;
    memprodutos.BeforePost   := memprodutosBeforePost;
    memprodutos.EnableControls;
    memprodutos.First;

  Except
   Abort ;
  End ;

  I2.Enabled := True; //CALCULA ICMS

end;

procedure TfrmNOTAELETRONICA.btnNewRegClick(Sender: TObject);
var
  S, R: Integer;
begin
  inherited;
  if sqlMaster.State <> dsInsert then Exit;

  labTitleForm.Caption            := 'NOTA ELETRÔNICA';
  UniComboBoxparaop.Enabled       := True;

  FDQrypessoas.Close;
  pgBaseCadControl.ActivePage        := tabRegister;
  UniPageControlprodutos.ActivePage  := UniTabSheetProdutos;

  SetBut(tpIncluir);
  HabilitaMenuAdiiconais(False);


  LimpaVars;

  CarregaParametros();
  SqlPesquisa(' select operacao,serie, condicao from documentos where documento = ' + IntToStr(varC_Documento_MvmestreNFE) +
              ' and empresa                                                     = ' + IntToStr(mm.varI_Code_Company));


   sqlMaster.FindField('PESSOA').AsInteger               := 0;
   sqlMaster.FindField('EMPRESA').AsInteger              := mm.varI_Code_Company;
   sqlMaster.FindField('DOCUMENTO').AsInteger            := varC_Documento_MvmestreNFE;
   sqlMaster.FindField('NUMERO').AsInteger               := 0;
   sqlMaster.FindField('FUNCIONARIO').AsInteger          := 0;
   sqlMaster.FindField('SERIE').AsString                 := dm_rc.sqlBuscas.FindField('SERIE').AsString;
   sqlMaster.FindField('EMISSAO').AsDateTime             := Date;
   sqlMaster.FindField('RECEPCAODESPACHO').AsDateTime    := Date;
   sqlMaster.FindField('OPERACAO').AsInteger             := 0;
   sqlMaster.FindField('CONDICAO').AsInteger             := dm_rc.sqlBuscas.FindField('CONDICAO').AsInteger;

   sqlMaster.FindField('VLRDESCONTOS').AsFloat           := 0;
   sqlMaster.FindField('VLRPRODUTOS').AsFloat            := 0;
   sqlMaster.FindField('VLRDESPESAS').AsFloat            := 0;
   sqlMaster.FindField('VLRTOTAL').AsFloat               := 0;
   sqlMaster.FindField('VLRBASEICMS').AsFloat            := 0;
   sqlMaster.FindField('VLRICMS').AsFloat                := 0;

   UniComboBoxtrafrete.ItemIndex                        := 1;
   UniPageControlprodutos.ActivePage                    := UniTabSheetProdutos;

   if mm.M_TIPOPESO = 'Saco' then
     UniDBComboBoxESPECIE.ItemIndex                     := 0
   else
     UniDBComboBoxESPECIE.ItemIndex                     := 1;


  UniDBGridprodutos.Options          := UniDBGridprodutos.Options - [dgRowSelect];
  UniDBGridprodutos.Options          := UniDBGridprodutos.Options + [dgEditing];

  if sqlMaster.State in [dsInsert] then
  begin
    S := 1;
    tbtitulos.Close;
    tbtitulos.Open;

    memprodutos.Close;
    memprodutos.Open;
  end
  else
    S := memprodutos.RecordCount + 10;

  memprodutos.DisableControls;
  memprodutos.AfterDelete  := nil;
  memprodutos.AfterPost    := nil;
  memprodutos.BeforePost   := nil;
  memprodutos.BeforeDelete := nil;

  for R := S to S + 25 do
  begin
    memprodutos.Append;
    memprodutos.Post;
  end;

  memprodutos.First;
  memprodutos.AfterDelete  := memprodutosAfterDelete;
  memprodutos.AfterPost    := memprodutosAfterPost;
  memprodutos.BeforeDelete := memprodutosBeforeDelete;
  memprodutos.BeforePost   := memprodutosBeforePost;
  memprodutos.EnableControls;
  memprodutos.First;

//  UniButtonDbEditcodigopessoas.SetFocus;
//  UniButtonDbEditcodigopessoas.SelectAll;
  UniComboBoxparaop.SetFocus;
  UniDBComboBoxMARCA.ItemIndex     := 1;

end;

procedure TfrmNOTAELETRONICA.btnOptionsClick(Sender: TObject);
begin
  UniPopupMenuopcoes.PopupBy( TUniButton( sender ) );
end;

procedure TfrmNOTAELETRONICA.btnSaveRegClick(Sender: TObject);
var
  I: Integer;
  FoiInclusao: Boolean;
  ValoresAntes: array of Variant;
begin
  // Fiscal validation must precede Post/ApplyUpdates on the inherited dataset.
  if not (sqlMaster.State in [dsInsert, dsEdit]) then Exit;
  if not rc_FormValidate(Self) then Exit;
  if mm.varC_Locked = 'S' then
  begin
    dm_rc.rc_ShowSweetAlert(mm.MSG_INFO, mm.MSG_APP_LOCKED, 'warning');
    Exit;
  end;

  if (UniComboBoxparaop.Text = 'Devolucao') and (UniDBEditdevolucao.Text = '') then
  begin
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'FALTA COLOCAR A CHAVE DE REFERÊNCIA' , 'error' );
    UniPageControlprodutos.ActivePage := UniTabSheetreferencia;
    abort
  end
  else
    begin
      if (UniComboBoxparaop.Text = 'Devolucao') and (Length(UniDBEditdevolucao.Text) <> 45) then
      begin
        dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'CHAVE DE ACESSO COM DIFERENÇA' , 'error');
        UniPageControlprodutos.ActivePage := UniTabSheetreferencia;
        abort
      end;
    end;


  if not (CamposValidados) then
     Abort
  else
    if sqlMaster.State in [dsInsert,dsEdit] then
     Begin
       FoiInclusao := sqlMaster.State = dsInsert;
       SetLength(ValoresAntes, sqlMaster.FieldCount);
       for I := 0 to sqlMaster.FieldCount - 1 do
         ValoresAntes[I] := sqlMaster.Fields[I].Value;
       if not mm.FDTransaction.Active then
         mm.FDTransaction.StartTransaction;
       try
       if sqlMaster.State in [dsInsert] then
         begin
           sqlMaster.FindField('LOGINCLUSAO').AsString  := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);
           sqlMaster.FindField('KEY').AsString          := Gera_Guid;
           sqlMaster.FindField('CODIGO').AsInteger      := Ultimo_Codigo('MVMESTRE','CODIGO',False);
           sqlMaster.FindField('NUMERO').AsInteger      := Ultimo_Numero(mm.varI_Code_Company,1,'GRAVAR');

           //TABELA DE MEMORIA DE COMISSAO
           if (sqlMaster.FindField('FUNCIONARIO').AsInteger > 0) and
              not dm_rc.tb_movimentovendedor.Locate('FUNCIONARIO',sqlMaster.FindField('FUNCIONARIO').AsInteger,[]) then
             begin
               dm_rc.tb_movimentovendedor.Append;
               dm_rc.tb_movimentovendedor.FindField('FUNCIONARIO').AsInteger := sqlMaster.FindField('FUNCIONARIO').AsInteger;
               dm_rc.tb_movimentovendedor.FindField('NOME').AsString         := Acha_Item('FUNCIONARIOS',sqlMaster.FindField('FUNCIONARIO').AsString);
               dm_rc.tb_movimentovendedor.FindField('COMISSAO').AsFloat      := sqlMaster.FindField('COMISSAOFUNCIONARIO').AsFloat;
               dm_rc.tb_movimentovendedor.Post;
             end;
         end
       else
         begin
           sqlMaster.FindField('LOGALTERACAO').AsString  := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);
           if sqlMaster.FindField('NUMERO').AsInteger   = 0 then
             sqlMaster.FindField('NUMERO').AsInteger      := Ultimo_Numero(mm.varI_Code_Company,1,'GRAVAR');

         end;

       sqlMaster.FindField('PARAMETROOPERACAO').AsString := UniComboBoxparaop.Text;
       sqlMaster.FindField('TRAFRETE').AsInteger         := UniComboBoxtrafrete.ItemIndex;
       sqlMaster.FindField('DOCUMENTO').AsInteger        := 1;

       //grava tabelas principal
       state := Retornastatustable(sqlMaster);
       sqlMaster.Post;
       mm.varI_ApplyUpdateErrors := sqlMaster.ApplyUpdates(-1);
       if mm.varI_ApplyUpdateErrors > 0 then
         raise Exception.Create('Falha ao gravar o cabeçalho da nota.');


       // grava demais informações
       try
         GravaMovimento();
       finally
         memprodutos.EnableControls;
         tbtitulos.EnableControls;
       end;

         if sqlMaster.FindField('PEDIDO').AsString <> '' then
           AtualizaPedido(sqlMaster.FindField('PEDIDO').AsInteger,
             sqlMaster.FindField('PEDIDO_DOCUMENTO').AsInteger);

         MemoGravaLog();
         GravaLog(mm.varI_Code_Company,
                  mm.varI_User,
                  sqlMaster.FindField('CODIGO').AsInteger,
                  mm.vUserName,
                  state,
                  sqlMaster.UpdateOptions.UpdateTableName,
                  '',
                  UniMemolog.Text);

         UniPageControlnota.ActivePage := UniTabSheetgeral;

         //************************************************************************//
         // VERIFICA E PROCESSA ITENS DE ENTREGA FUTURA PENDENTES
         //************************************************************************//
         if sqlMaster.FindField('PEDIDO').AsString <> '' then
           AnexarItensEntregaPN();

         if mm.FDTransaction.Active then mm.FDTransaction.Commit;
         sqlMaster.CommitUpdates;
         FechaTabelas();
         dm_rc.rc_ShowSweetAlert('Ok', 'Dados Gravados com SUCESSO!', 'success');
       except
         on E: Exception do
         begin
           if mm.FDTransaction.Active then mm.FDTransaction.Rollback;
           sqlMaster.Cancel;
           sqlMaster.CancelUpdates;
           if FoiInclusao then sqlMaster.Insert else sqlMaster.Edit;
           for I := 0 to sqlMaster.FieldCount - 1 do
             if (sqlMaster.Fields[I].FieldKind = fkData) and
                not sqlMaster.Fields[I].ReadOnly then
               sqlMaster.Fields[I].Value := ValoresAntes[I];
           UniDBGridprodutos.Options := UniDBGridprodutos.Options + [dgEditing];
           dm_rc.rc_ShowSweetAlert('ATENÇÃO', 'Não foi possível gravar: ' + E.Message, 'error');
           Exit;
         end;
       end;
     End;

  if  sqlSearchMaster.Active then
    sqlSearchMaster.Refresh;

  if  sqlSearchMaster.IsEmpty then
   SetBut(tpListaVazia)
  Else
   SetBut(tpListacomRegistros);

  pgBaseCadControl.ActivePage := tabSearch;
  HabilitaMenuAdiiconais(True);
  HabilitaCombobox(False);

end;

procedure TfrmNOTAELETRONICA.btntransp2Click(Sender: TObject);
begin
  inherited;
  mm.varT_code_transportadora      := sqlMaster.FindField('TRANSPORTADORA').AsInteger;
  mm.varT_code_nome_transportadora := sqlMaster.FindField('TRANOME').AsString;
  mm.varT_code_tipo_transportadora := sqlMaster.FindField('TRAFRETE').AsString;
  mm.varT_code_cep_entrega         := sqlMaster.FindField('ENTREGA_CEP').AsString;
  mm.varT_code_ibge_entrega        := sqlMaster.FindField('ENTREGA_IBGE').AsString;
  mm.varT_code_endereco_entrega    := sqlMaster.FindField('ENTREGA_ENDERECO').AsString;
  mm.varT_code_numero_entrega      := sqlMaster.FindField('ENTREGA_NUMERO').AsString;
  mm.varT_code_bairro_entrega      := sqlMaster.FindField('ENTREGA_BAIRRO').AsString;
  mm.varT_code_cidade_entrega      := sqlMaster.FindField('ENTREGA_CIDADE').AsString;
  mm.varT_code_estado_entrega      := sqlMaster.FindField('ENTREGA_ESTADO').AsString;

  frmTRANPORTADORAMOVIMENTO.ShowModal();

  if sqlMaster.State in [dsInsert,dsEdit] then
    begin
      sqlMaster.FindField('TRANSPORTADORA').AsInteger  := mm.varT_code_transportadora;
      sqlMaster.FindField('TRANOME').AsString          := mm.varT_code_nome_transportadora;
      sqlMaster.FindField('TRAFRETE').AsInteger        := StrToInt(mm.varT_code_tipo_transportadora);
      sqlMaster.FindField('ENTREGA_CEP').AsString      := mm.varT_code_cep_entrega;
      sqlMaster.FindField('ENTREGA_IBGE').AsString     := mm.varT_code_ibge_entrega;
      sqlMaster.FindField('ENTREGA_ENDERECO').AsString := mm.varT_code_endereco_entrega;
      sqlMaster.FindField('ENTREGA_NUMERO').AsString   := mm.varT_code_numero_entrega;
      sqlMaster.FindField('ENTREGA_BAIRRO').AsString   := mm.varT_code_bairro_entrega;
      sqlMaster.FindField('ENTREGA_CIDADE').AsString   := mm.varT_code_cidade_entrega;
      sqlMaster.FindField('ENTREGA_ESTADO').AsString   := mm.varT_code_estado_entrega;
    end;
end;

procedure TfrmNOTAELETRONICA.C1Click(Sender: TObject);
begin
  if sqlSearchMaster.FindField('CANCELADA').AsString <> 'A' then
    begin
      dm_rc.rc_ShowSweetAlert( 'Ok', 'NÃO FOI PERMITIDO FAZER A IMPRESSÃO' , 'error');
      abort;
    end
  else
    mm.varC_caminhopdf :=  NOTA_ContratoTranporte(
                           MM.varI_Code_Company,
                           FDQryFiltroNUMERO.AsInteger,
                           1);

  unfImpressao.ShowModal();
end;

procedure TfrmNOTAELETRONICA.C2Click(Sender: TObject);
begin
  if sqlSearchMaster.FindField('CANCELADA').AsString <> 'A' then
    begin
      dm_rc.rc_ShowSweetAlert( 'Ok', 'NÃO FOI PERMITIDO FAZER A IMPRESSÃO' , 'error');
      abort
    end
  else
  mm.varC_caminhopdf :=  NOTA_ControleEtiqueta(
                         MM.varI_Code_Company,
                         FDQryFiltroNUMERO.AsInteger,
                         1);

  unfImpressao.ShowModal();
end;

procedure TfrmNOTAELETRONICA.Calculapiscofins;
begin
  memprodutos.FindField('TOTALPIS').AsFloat    := memprodutos.FindField('PERCPIS').AsFloat   * memprodutos.FindField('TOTAL').AsFloat;
  memprodutos.FindField('TOTALCOFINS').AsFloat := memprodutos.FindField('VLRCOFINS').AsFloat * memprodutos.FindField('TOTAL').AsFloat;
end;

procedure TfrmNOTAELETRONICA.Calcula_Documento;
var
  Financeiro: TfrmFINANCEIRONOTA;
  CodigoNota: Integer;
begin
  if not (sqlMaster.State in [dsInsert, dsEdit]) then
  begin
    dm_rc.rc_ShowMessage('Clique em Novo ou Edita para alterar as parcelas.');
    Exit;
  end;
  if not tbtitulos.Active then tbtitulos.Open;
  if tbtitulos.State in dsEditModes then tbtitulos.Post;
  CodigoNota:=sqlMaster.FieldByName('CODIGO').AsInteger;
  Financeiro:=frmFINANCEIRONOTA;
  Financeiro.Preparar(tbtitulos,
    UniDBFormattedNumberEditvlrtotal.Value,
    'Nota '+sqlMaster.FieldByName('NUMERO').AsString);
  Financeiro.ShowModal(
    procedure(Sender: TComponent; AResult: Integer)
    var Backup: TFDMemTable;
    begin
      if AResult<>mrOK then Exit;
      if not (sqlMaster.State in [dsInsert, dsEdit]) or
         (sqlMaster.FieldByName('CODIGO').AsInteger<>CodigoNota) then
      begin
        dm_rc.rc_ShowMessage('A nota mudou durante a edicao. Abra o financeiro novamente.');
        Exit;
      end;
      Backup:=TFDMemTable.Create(nil);
      try
        Backup.CopyDataSet(tbtitulos,[coStructure,coRestart,coAppend]);
        tbtitulos.DisableControls;
        try
          try
            tbtitulos.Close;
            tbtitulos.Open;
            tbtitulos.CopyDataSet(Financeiro.memParcelas);
//            tbtitulos.EmptyDataSet;
//            tbtitulos.CopyDataSet(Financeiro.memParcelas,[coRestart,coAppend]);
//            tbtitulos.First;
          except
            tbtitulos.Cancel;
            tbtitulos.EmptyDataSet;
            tbtitulos.CopyDataSet(Backup,[coRestart,coAppend]);
            raise;
          end;
        finally tbtitulos.EnableControls; end;
      finally Backup.Free; end;
    end);
end;

{
procedure TfrmNOTAELETRONICA.Calcula_Documento;
begin
  //************************************************************************//
  mm.varV_Valor_Documento          := UniDBFormattedNumberEditvlrtotal.value;

  dm_rc.tbtitulos.Close;
  dm_rc.tbtitulos.CopyDataSet(tbtitulos);

  mm.VarC_Atelagenerica := 'FINANCEIRONOTA';
  frmTELAGENERICA.ShowModal();

  tbtitulos.Close;
  tbtitulos.Open;

  tbtitulos.CopyDataSet(dm_rc.tbtitulos);
  dm_rc.tbtitulos.Close;
  //************************************************************************//

end;
 }

procedure TfrmNOTAELETRONICA.Calcula_Icms(F_TIPO: String);
var
  M_MARCA  : TBookMark;
  M_SAIVLP : Real;
  M_SAIVLN : Real;
  M_SAIBIC : Real;
  M_SAIVIC : Real;
  M_SAITOT : Real;
  M_SAIVIP : Real;
  M_RESTOV : Real;
  M_SAIVFI : Real;
  M_VLRTOTAL : Real;
  M_VLRICMSDESONERACAO : Real;

begin


  TabelaOperacao('SELECT * FROM OPERACOES WHERE CODIGO = ' + QuotedStr(sqlMaster.FindField('OPERACAO').AsString));
  M_MARCA  := memprodutos.GetBookmark;
  M_SAITOT := 0;

  memprodutos.DisableControls;
  memprodutos.AfterDelete  := nil;
  memprodutos.AfterPost    := nil;
  memprodutos.BeforeDelete := nil;
  memprodutos.BeforePost   := nil;
  memprodutos.First;

  M_SAIVLP := 0;
  M_SAIVIP := 0;
  M_SAIBIC := 0;
  M_SAIVIC := 0;
  M_SAIVLN := 0;
  M_VLRTOTAL := 0;
  M_VLRICMSDESONERACAO := 0;

  while not memprodutos.eof do
    begin
      if memprodutos.FindField('Produto').AsInteger > 0 then  // Zera os campos da tabela para recáculo
        begin
          memprodutos.Edit;
          memprodutos.FindField('ValorIpi').AsFloat  :=0;
          memprodutos.FindField('Despesa').AsFloat   :=0;
          memprodutos.FindField('BaseIcms').AsFloat  :=0;
          memprodutos.FindField('PercIcms').AsFloat  :=0;
          memprodutos.FindField('ValorIcms').AsFloat :=0;
          memprodutos.FindField('ValorIpi').AsFloat  :=0;
          memprodutos.FindField('Desconto').AsFloat  :=0;
          memprodutos.Post;
        end;
      memprodutos.next;
    end;

  M_SAITOT := 0;
    memprodutos.First;
    while not memprodutos.eof do
      begin
        if memprodutos.FindField('Produto').AsInteger > 0 then
          begin
             M_SAITOT := M_SAITOT + memprodutos.FindField('Total').AsFloat;
//             memprodutos.FindField('LIQUIDO').AsFloat := memprodutos.FindField('Total').AsFloat - memprodutos.FindField('DESCONTO').AsFloat
          end;
        memprodutos.next;
        Application.ProcessMessages;
      end;

    if (dm_rc.FDQryoperacoes.FindField('CALCULA_IPI').AsString = '1')  then
      begin
        memprodutos.First;
        while not memprodutos.eof do
          begin
            if memprodutos.FindField('Produto').AsInteger > 0 then
              begin
                if memprodutos.FindField('PercIpi').Value > 0 then
                  begin
                    memprodutos.Edit;
                    memprodutos.FindField('ValorIpi').AsFloat:= MRound(((memprodutos.FindField('TOTAL').Value * 0.01) * memprodutos.FindField('PercIpi').Value), 2);
                    memprodutos.Post;
                  end;
              end;
            memprodutos.next;
            Application.ProcessMessages;
          end;
      end;

  // calcula rateio de despesas

    if (sqlMaster.findfield('VLRDSPTRIBUTADA').asfloat + sqlMaster.findfield('VLRDSPNTRIBUTADA').asfloat + sqlMaster.findfield('VLRDESPESAS').asfloat) > 0 then
      begin
        memprodutos.First;
        M_SAITOT := 0;
        while not memprodutos.eof do
          begin
            if memprodutos.FindField('Produto').AsInteger > 0 then
              M_SAITOT := M_SAITOT + memprodutos.FindField('TOTAL').Value;
            memprodutos.next;
          end;
        memprodutos.First;
        while not memprodutos.eof do
          begin
            if memprodutos.FindField('Produto').AsInteger > 0 then
              begin
                memprodutos.Edit;
                memprodutos.FindField('Despesa').AsFloat := MRound(((sqlMaster.findfield('VLRDSPTRIBUTADA').asfloat + sqlMaster.findfield('VLRDSPNTRIBUTADA').asfloat + sqlMaster.findfield('VLRDESPESAS').asfloat) / M_SAITOT) * memprodutos.FindField('TOTAL').Value,2);
                memprodutos.Post;
              end;
            memprodutos.next;
          end;
      end;

//verifica rateio de despesa

  if MRound((sqlMaster.findfield('VLRDSPTRIBUTADA').asfloat + sqlMaster.findfield('VLRDSPNTRIBUTADA').asfloat + sqlMaster.findfield('VLRDESPESAS').asfloat) , 2) > 0 then
    begin
      M_SAITOT := 0;
      memprodutos.First;
      while not memprodutos.eof do
        begin
          if memprodutos.FindField('Produto').AsInteger > 0 then
            begin
               M_SAITOT := M_SAITOT + MRound(memprodutos.FindField('Despesa').Value, 2);
            end;
          memprodutos.Next;
          Application.ProcessMessages;
        end;
        M_RESTOV := MRound(sqlMaster.findfield('VLRDSPTRIBUTADA').asfloat + sqlMaster.findfield('VLRDSPNTRIBUTADA').asfloat + sqlMaster.findfield('VLRDESPESAS').asfloat, 2) - MRound(M_SAITOT, 2);
        if M_RESTOV <> 0 then
          begin
            memprodutos.First;
            memprodutos.Edit;
            if M_RESTOV > 0 then
              memprodutos.FindField('Despesa').AsFloat :=  memprodutos.FindField('Despesa').AsFloat + M_RESTOV
            else
              memprodutos.FindField('Despesa').AsFloat :=  memprodutos.FindField('Despesa').AsFloat - Abs(M_RESTOV);
            memprodutos.Post;
           end;
    end;

// calcula valor do Icms
  if (dm_rc.FDQryoperacoes.FindField('CALCULA_ICMS').AsString = '1') then
    begin
      memprodutos.First;
      while not memprodutos.eof do
        begin
          if memprodutos.FindField('Produto').AsInteger > 0 then
            begin
              memprodutos.Edit;
              memprodutos.FindField('PercIcms').AsFloat:=Aliq_Icms(UniDBEditestado.text,UniDBEditinscricao.text,strtoint(sqlMaster.FindField('OPERACAO').AsString));
              if (dm_rc.FDQryoperacoes.FindField('CALCULA_ICMS_SOBRE_NOTA').AsString = '1') then
                begin
                  memprodutos.FindField('percreducao').AsFloat := MRound(Base_Icms(UniDBEditestado.text,UniDBEditinscricao.text,strtoint(sqlMaster.FindField('OPERACAO').AsString)),2);

                  if dm_rc.FDQryoperacoes.FindField('ENTRADA_SAIDA').AsInteger = 1 then
                    memprodutos.FindField('BaseIcms').AsFloat    := (memprodutos.FindField('Total').Value + memprodutos.FindField('Despesa').Value - memprodutos.FindField('Desconto').Value) // soma ipi + dsp na base icms
                  else
                    memprodutos.FindField('BaseIcms').AsFloat    := (memprodutos.FindField('Total').Value + memprodutos.FindField('ValorIpi').Value + memprodutos.FindField('Despesa').Value); // soma ipi + dsp na base icms

                  memprodutos.FindField('BaseIcms').AsFloat    := MRound((memprodutos.FindField('BaseIcms').Value / 100) * variif(Base_Icms(UniDBEditestado.text,UniDBEditinscricao.text,strtoint(sqlMaster.FindField('OPERACAO').AsString)) = 0, 100, Base_Icms(UniDBEditestado.text,UniDBEditinscricao.text,strtoint(sqlMaster.FindField('OPERACAO').AsString))), 2);
                  memprodutos.FindField('ValorIcms').AsFloat   := MRound((memprodutos.FindField('BaseIcms').Value / 100) * Aliq_Icms(UniDBEditestado.text,UniDBEditinscricao.text,strtoint(sqlMaster.FindField('OPERACAO').AsString)), 2);
                end
              else
                begin
                  memprodutos.FindField('percreducao').AsFloat := MRound(Base_Icms(UniDBEditestado.text,UniDBEditinscricao.text,strtoint(sqlMaster.FindField('OPERACAO').AsString)),2);
                  memprodutos.FindField('BaseIcms').AsFloat    := (memprodutos.FindField('Total').Value + memprodutos.FindField('ValorIpi').Value + memprodutos.FindField('Despesa').Value - memprodutos.FindField('Desconto').Value); // soma ipi + dsp na base icms
                  memprodutos.FindField('BaseIcms').AsFloat    := MRound((memprodutos.FindField('BaseIcms').Value / 100) * variif(Base_Icms(UniDBEditestado.text,UniDBEditinscricao.text,strtoint(sqlMaster.FindField('OPERACAO').AsString)) = 0, 100, Base_Icms(UniDBEditestado.text,UniDBEditinscricao.text,strtoint(sqlMaster.FindField('OPERACAO').AsString))), 2);
                  memprodutos.FindField('ValorIcms').AsFloat   := MRound((memprodutos.FindField('BaseIcms').Value / 100) * Aliq_Icms(UniDBEditestado.text,UniDBEditinscricao.text,strtoint(sqlMaster.FindField('OPERACAO').AsString)), 2);
                end;

              if memprodutos.FindField('ValorIcms').AsFloat = 0 then memprodutos.FindField('BaseIcms').AsFloat := 0;
              memprodutos.Post;
            end;
          memprodutos.next;
        end;

         // *********************************
         // CALCULA DESONERACAO LOCAL CORRETO
         // *********************************

   // ************************************
   // CALCULA DESONERACAO NAO DEVERIA FICAR AQUI, É PRECISO DAS BASES PARA CALCULAR A DIFERENCA
   // ************************************

   UniDBFormattedNumberEditVLRICMSDESONERACAO.Value  := 0;

   if mm.vari_calculodesonerado = 'T' then
     begin
      memprodutos.First;
      while not memprodutos.eof do
        begin
          if memprodutos.FindField('PRODUTO').AsInteger > 0 then
            begin
                memprodutos.Edit;
                memprodutos.FindField('VLRICMSDESONERACAO').AsFloat := MRound((memprodutos.FindField('TOTAL').AsFloat * 0.01) * variif(dm_rc.tbempresas.FindField('UF').AsString=FDQrypessoas.FindField('ESTADO').AsString,19.5,7.20),2);
                memprodutos.FindField('LIQUIDO').AsFloat            := Mround(memprodutos.FindField('LIQUIDO').AsFloat - memprodutos.FindField('VLRICMSDESONERACAO').AsFloat,2);
                memprodutos.Post;
            end;
          memprodutos.next;
          Application.ProcessMessages;
        end;
     end
  else
    begin
      memprodutos.First;
      while not memprodutos.eof do
        begin
          if memprodutos.FindField('PRODUTO').AsInteger > 0 then
            begin
              memprodutos.Edit;
              memprodutos.FindField('VLRICMSDESONERACAO').AsFloat := 0;
              memprodutos.FindField('LIQUIDO').AsFloat := memprodutos.FindField('Total').AsFloat - memprodutos.FindField('DESCONTO').AsFloat;
              memprodutos.Post;
            end;
          memprodutos.next;
          Application.ProcessMessages;
        end;
    end;

      // calcula totais da nota
        memprodutos.First;
        while not memprodutos.eof do
          begin
            if memprodutos.FindField('Produto').AsInteger > 0 then
              begin
                M_SAIVLP := M_SAIVLP + memprodutos.FindField('Total').AsFloat;
                M_SAIVIP := M_SAIVIP + memprodutos.FindField('ValorIpi').AsFloat;
                M_SAIBIC := M_SAIBIC + memprodutos.FindField('BaseIcms').AsFloat;
                M_SAIVIC := M_SAIVIC + memprodutos.FindField('ValorIcms').AsFloat;
                M_SAIVLN := M_SAIVLN + (memprodutos.FindField('Total').AsFloat + memprodutos.FindField('ValorIpi').AsFloat + memprodutos.FindField('Despesa').AsFloat);
                M_VLRTOTAL := M_VLRTOTAL               + memprodutos.FindField('LIQUIDO').AsFloat +
                                                         memprodutos.FindField('FRETE').AsFloat +
                                                         memprodutos.FindField('VALORIPI').AsFloat +
                                                         memprodutos.FindField('DESPESA').AsFloat +
                                                         memprodutos.FindField('SEGURO').AsFloat;
                M_VLRICMSDESONERACAO := M_VLRICMSDESONERACAO + memprodutos.FindField('VLRICMSDESONERACAO').AsFloat;
              end;
            memprodutos.next;
            Application.ProcessMessages;
          end;
    end;

  UniDBFormattedNumberEditvlrtotal.Value            := MRound(M_VLRTOTAL,2);
  UniDBFormattedNumberEditVLRICMSDESONERACAO.Value  := MRound(M_VLRICMSDESONERACAO,2);

  sqlMaster.edit;
  sqlMaster.findfield('VLRBASEICMS').asfloat := M_SAIBIC;
  sqlMaster.findfield('VLRICMS').asfloat     := M_SAIVIC;
  sqlMaster.findfield('VLRIPI').asfloat      := M_SAIVIP;

  memprodutos.AfterDelete        := memprodutosAfterDelete;
  memprodutos.AfterPost          := memprodutosAfterPost;
  memprodutos.BeforeDelete       := memprodutosBeforeDelete;
  memprodutos.BeforePost         := memprodutosBeforePost;

  memprodutos.EnableControls;
  memprodutos.GotoBookmark(M_MARCA);
  memprodutos.FreeBookmark(M_MARCA);
  memprodutos.Refresh;

end;

procedure TfrmNOTAELETRONICA.Calcula_Titulos;
var
  M_PARCELAS : TStringList;
  R          : Integer;
  M_RESTO    : Real;
  ORDEM,
  M_ITENS    : Integer;
begin
  tbtitulos.Close;
  tbtitulos.Open;

  if SqlPesquisa('SELECT * FROM CONDICOES WHERE CODIGO = ' + QuotedStr(sqlMaster.FindField('CONDICAO').AsString)) then

  ORDEM      := 0;
  M_PARCELAS := Explode(Trim(dm_rc.sqlBuscas.FindField('OBSERVACOES').AsString),',');
  M_RESTO    := UniDBFormattedNumberEditvlrtotal.Value;
  M_ITENS    := variif(dm_rc.sqlBuscas.FindField('PARCELAS').AsInteger=0,1,Valor(dm_rc.sqlBuscas.FindField('PARCELAS').AsString));

  if M_PARCELAS.Count <  M_ITENS then
    begin
      for R := M_PARCELAS.Count to M_ITENS -1 do
        begin
          M_PARCELAS.Add(IntToStr(R * 30));
        end;
    end;

  for R := 0 to M_PARCELAS.Count - 1 do
    begin
      inc(ORDEM);

      tbtitulos.Append;
      tbtitulos.FindField('VENCIMENTO').AsDateTime := date + Valor(M_PARCELAS[R]);
      tbtitulos.FindField('VALOR').AsFloat         := MRound(UniDBFormattedNumberEditvlrtotal.Value / M_ITENS,2);
      tbtitulos.FindField('PARCELA').AsInteger     := ORDEM;
      tbtitulos.Post;

      M_RESTO := M_RESTO - tbtitulos.FindField('VALOR').AsFloat;
    end;

  if M_RESTO > 0 then
    begin
      tbtitulos.Last;
      tbtitulos.Edit;
      tbtitulos.FindField('VALOR').AsFloat := tbtitulos.FindField('VALOR').AsFloat + Abs(M_RESTO);
      tbtitulos.Post;
    end
  else
    if M_RESTO < 0 then
      begin
        tbtitulos.First;
        tbtitulos.Edit;
        tbtitulos.FindField('VALOR').AsFloat := tbtitulos.FindField('VALOR').AsFloat - Abs(M_RESTO);
        tbtitulos.Post;
      end;

  tbtitulos.First;
end;

procedure TfrmNOTAELETRONICA.Calcula_Totais;
var
  M_VLRPRODUTOS, M_VLRDESCONTO, M_VLRLIQUIDO, M_VLRDESPESA, M_VLRTOTAL, M_VLRSERVICOS, M_VLRRESTO, M_FRETE, M_QUANTIDADE, M_VLRICMSDESONERACAO: Real;
  M_MARCA: TBookMark;
  M_PESO: Real;
  M_BRUTO: Real;
  M_BASE: Real;
  M_VICM: Real;
  M_BASU: Real;
  M_VSUB: Real;
  M_VIPI: Real;
  M_SACOS: Real;
  M_SEGURO: Real;
  M_VLRIMPOSTO: Real;
  M_TOTIPI: Real;
  M_VALORCICMSF: Real;
  R: Pointer;
begin

  M_MARCA := memprodutos.GetBookmark;
  memprodutos.DisableControls;

  memprodutos.AfterDelete  := nil;
  memprodutos.AfterPost    := nil;
  memprodutos.BeforePost   := nil;
  memprodutos.BeforeDelete := nil;
  memprodutos.First;

  M_VLRPRODUTOS := 0;
  M_VLRTOTAL    := 0;
  M_VLRSERVICOS := 0;
  M_VLRDESCONTO := 0;
  M_QUANTIDADE  := 0;
  M_FRETE       := 0;
  M_BASE        := 0;
  M_VICM        := 0;
  M_BASU        := 0;
  M_VSUB        := 0;
  M_VIPI        := 0;
  M_VLRIMPOSTO  := 0;
  M_PESO        := 0;
  M_BRUTO       := 0;
  M_TOTIPI      := 0;
  M_VALORCICMSF := 0;
  M_SACOS       := 0;
  M_SEGURO      := 0;
  M_VLRICMSDESONERACAO := 0;

  if UniDBFormattedNumberEditdescontos.Value > 0 then
    begin
      M_VLRPRODUTOS := 0;
      memprodutos.First;
      while not memprodutos.eof do
        begin
          if memprodutos.FindField('PRODUTO').AsInteger > 0 then
            M_VLRPRODUTOS := M_VLRPRODUTOS + memprodutos.FindField('TOTAL').AsFloat;
          memprodutos.next;
          Application.ProcessMessages;
        end;
      M_VLRRESTO   := UniDBFormattedNumberEditdescontos.Value ;
      M_VLRLIQUIDO := (M_VLRPRODUTOS - UniDBFormattedNumberEditdescontos.Value);
      memprodutos.First;
      while not memprodutos.eof do
        begin
          if memprodutos.FindField('PRODUTO').AsInteger > 0 then
            begin
              memprodutos.Edit;
              memprodutos.FindField('LIQUIDO').AsFloat  := Mround(memprodutos.FindField('TOTAL').AsFloat - MRound(((UniDBFormattedNumberEditdescontos.Value / M_VLRPRODUTOS) * memprodutos.FindField('TOTAL').AsFloat),2),2);
              memprodutos.FindField('DESCONTO').AsFloat := memprodutos.FindField('TOTAL').AsFloat - memprodutos.FindField('LIQUIDO').AsFloat;
              memprodutos.Post;
              M_VLRRESTO   := M_VLRRESTO   - memprodutos.FindField('DESCONTO').AsFloat;
              M_VLRLIQUIDO := M_VLRLIQUIDO - memprodutos.FindField('LIQUIDO').AsFloat;
            end;
          memprodutos.next;
          Application.ProcessMessages;
        end;
      memprodutos.First;
      memprodutos.Edit;
      if M_VLRRESTO > 0 then
        memprodutos.FindField('DESCONTO').AsFloat := memprodutos.FindField('DESCONTO').AsFloat + Abs(M_VLRRESTO)
      else
        if M_VLRRESTO < 0 then
          memprodutos.FindField('DESCONTO').AsFloat := memprodutos.FindField('DESCONTO').AsFloat - Abs(M_VLRRESTO);
      if M_VLRLIQUIDO > 0 then
        memprodutos.FindField('LIQUIDO').AsFloat := memprodutos.FindField('LIQUIDO').AsFloat + Abs(M_VLRLIQUIDO)
      else
        if M_VLRLIQUIDO < 0 then
          memprodutos.FindField('LIQUIDO').AsFloat := memprodutos.FindField('LIQUIDO').AsFloat - Abs(M_VLRLIQUIDO);
      memprodutos.Post;
    end
  else
    begin
      memprodutos.First;
      while not memprodutos.eof do
        begin
          if memprodutos.FindField('PRODUTO').AsInteger > 0 then
            begin
              memprodutos.Edit;
              memprodutos.FindField('LIQUIDO').AsFloat  := memprodutos.FindField('TOTAL').AsFloat;
              memprodutos.FindField('DESCONTO').AsFloat := 0;
              memprodutos.Post;
            end;
          memprodutos.next;
          Application.ProcessMessages;
        end;
    end;

  memprodutos.First;
  while not memprodutos.eof do
  begin
    if memprodutos.FindField('PRODUTO').AsInteger > 0 then
    begin
      memprodutos.Edit;
      memprodutos.FindField('LIQUIDO').AsFloat := memprodutos.FindField('TOTAL').AsFloat;
      memprodutos.Post;
    end;
    memprodutos.next;
    Application.ProcessMessages;
  end;


  //**********************************************************************//
  // CALCULA DESCONTO UNITARIO
  //**********************************************************************//
  if UniDBFormattedNumberEditdescontos.Value > 0 then
  begin
    M_VLRPRODUTOS := 0;
    memprodutos.First;
    while not memprodutos.eof do
    begin
      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
        M_VLRPRODUTOS := M_VLRPRODUTOS + memprodutos.FindField('TOTAL').AsFloat;
      memprodutos.next;
      Application.ProcessMessages;
    end;
    M_VLRRESTO := UniDBFormattedNumberEditdescontos.Value;
    M_VLRLIQUIDO := (M_VLRPRODUTOS - UniDBFormattedNumberEditdescontos.Value);
    memprodutos.First;
    while not memprodutos.eof do
    begin
      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
      begin
        memprodutos.Edit;
        memprodutos.FindField('LIQUIDO').AsFloat  := Mround(memprodutos.FindField('TOTAL').AsFloat - MRound(((UniDBFormattedNumberEditdescontos.Value / M_VLRPRODUTOS) * memprodutos.FindField('TOTAL').AsFloat), 2), 2);
        memprodutos.FindField('DESCONTO').AsFloat := memprodutos.FindField('TOTAL').AsFloat - memprodutos.FindField('LIQUIDO').AsFloat;
        memprodutos.Post;
        M_VLRRESTO   := M_VLRRESTO   - memprodutos.FindField('DESCONTO').AsFloat;
        M_VLRLIQUIDO := M_VLRLIQUIDO - memprodutos.FindField('LIQUIDO').AsFloat;
      end;
      memprodutos.next;
      Application.ProcessMessages;
    end;
    memprodutos.First;
    memprodutos.Edit;
    if M_VLRRESTO > 0 then
      memprodutos.FindField('DESCONTO').AsFloat := memprodutos.FindField('DESCONTO').AsFloat + Abs(M_VLRRESTO)
    else if M_VLRRESTO < 0 then
      memprodutos.FindField('DESCONTO').AsFloat := memprodutos.FindField('DESCONTO').AsFloat - Abs(M_VLRRESTO);
    if M_VLRLIQUIDO > 0 then
      memprodutos.FindField('LIQUIDO').AsFloat := memprodutos.FindField('LIQUIDO').AsFloat + Abs(M_VLRLIQUIDO)
    else if M_VLRLIQUIDO < 0 then
      memprodutos.FindField('LIQUIDO').AsFloat := memprodutos.FindField('LIQUIDO').AsFloat - Abs(M_VLRLIQUIDO);
    memprodutos.Post;
  end
  else
  begin
    memprodutos.First;
    while not memprodutos.eof do
    begin
      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
      begin
        memprodutos.Edit;
        memprodutos.FindField('LIQUIDO').AsFloat := memprodutos.FindField('TOTAL').AsFloat;
        memprodutos.FindField('DESCONTO').AsFloat := 0;
        memprodutos.Post;
      end;
      memprodutos.next;
      Application.ProcessMessages;
    end;
  end;

  M_VLRDESPESA := (UniDBFormattedNumberEditvlrdespesas.Value);

  if M_VLRDESPESA >= 0 then
  begin
    memprodutos.First;
    M_VLRLIQUIDO := 0;
    while not memprodutos.eof do
    begin
      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
        M_VLRLIQUIDO := M_VLRLIQUIDO + memprodutos.FindField('LIQUIDO').Value;
      memprodutos.next;
    end;
    M_VLRRESTO := M_VLRDESPESA;
    memprodutos.First;
    while not memprodutos.eof do
    begin
      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
      begin
        memprodutos.Edit;
        memprodutos.FindField('DESPESA').AsFloat := MRound(((M_VLRDESPESA) / M_VLRLIQUIDO) * memprodutos.FindField('LIQUIDO').Value, 2);
        memprodutos.Post;
        M_VLRRESTO := M_VLRRESTO - memprodutos.FindField('DESPESA').AsFloat;
      end;
      memprodutos.next;
    end;
    memprodutos.First;
    memprodutos.Edit;
    if M_VLRRESTO > 0 then
      memprodutos.FindField('DESPESA').AsFloat := memprodutos.FindField('DESPESA').AsFloat + Abs(M_VLRRESTO)
    else if M_VLRRESTO < 0 then
      memprodutos.FindField('DESPESA').AsFloat := memprodutos.FindField('DESPESA').AsFloat - Abs(M_VLRRESTO);
    memprodutos.Post;
  end;

   // ************************************
   // CALCULA DESONERACAO NAO DEVERIA FICAR AQUI, É PRECISO DAS BASES PARA CALCULAR A DIFERENCA
   // ************************************

   UniDBFormattedNumberEditVLRICMSDESONERACAO.Value  := 0;

   if mm.vari_calculodesonerado = 'T' then
     begin
      memprodutos.First;
      while not memprodutos.eof do
        begin
          if memprodutos.FindField('PRODUTO').AsInteger > 0 then
            begin
                memprodutos.Edit;
                memprodutos.FindField('VLRICMSDESONERACAO').AsFloat := MRound((memprodutos.FindField('TOTAL').AsFloat * 0.01) * variif(dm_rc.tbempresas.FindField('UF').AsString=FDQrypessoas.FindField('ESTADO').AsString,19.5,7.20),2);
                memprodutos.FindField('LIQUIDO').AsFloat            := Mround(memprodutos.FindField('LIQUIDO').AsFloat - memprodutos.FindField('VLRICMSDESONERACAO').AsFloat,2);
                memprodutos.Post;
            end;
          memprodutos.next;
          Application.ProcessMessages;
        end;
     end
  else
    begin
      memprodutos.First;
      while not memprodutos.eof do
        begin
          if memprodutos.FindField('PRODUTO').AsInteger > 0 then
            begin
              memprodutos.Edit;
              memprodutos.FindField('VLRICMSDESONERACAO').AsFloat := 0;
              memprodutos.FindField('LIQUIDO').AsFloat := memprodutos.FindField('Total').AsFloat - memprodutos.FindField('DESCONTO').AsFloat;
              memprodutos.Post;
            end;
          memprodutos.next;
          Application.ProcessMessages;
        end;
    end;


  M_VLRPRODUTOS := 0;
  M_VLRTOTAL    := 0;

  memprodutos.First;
  while not memprodutos.eof do
  begin
    if memprodutos.FindField('PRODUTO').AsInteger > 0 then
    begin
      //*****************************************************************//
      // PESO LIQUIDO/BRUTO
      //*****************************************************************//
      if mm.M_TIPOPESO = 'Saco' then
        begin
          if memprodutos.FindField('PESOSACO').AsFloat > 0 then
            begin
              memprodutos.Edit;
              memprodutos.FindField('PESOLIQUIDO').AsFloat := (memprodutos.FindField('QUANTIDADE').AsFloat / memprodutos.FindField('PESOSACO').AsFloat) * memprodutos.FindField('PESOSACO').AsFloat;
              memprodutos.FindField('PESOBRUTO').AsFloat   := (memprodutos.FindField('QUANTIDADE').AsFloat / memprodutos.FindField('PESOSACO').AsFloat) * memprodutos.FindField('PESOSACO').AsFloat;
              memprodutos.Post;

              M_PESO        := M_PESO        + memprodutos.FindField('PESOLIQUIDO').AsFloat;
              M_BRUTO       := M_BRUTO       + memprodutos.FindField('PESOBRUTO').AsFloat;
              M_QUANTIDADE  := M_QUANTIDADE  + (memprodutos.FindField('QUANTIDADE').AsFloat / memprodutos.FindField('PESOSACO').AsFloat);

            end
          else
            begin
              M_PESO        := M_PESO        + memprodutos.FindField('QUANTIDADE').AsFloat;
              M_BRUTO       := M_BRUTO       + memprodutos.FindField('QUANTIDADE').AsFloat;
              M_QUANTIDADE  := M_QUANTIDADE  + memprodutos.FindField('QUANTIDADE').AsFloat;

              memprodutos.Edit;
              memprodutos.FindField('PESOLIQUIDO').AsFloat := memprodutos.FindField('QUANTIDADE').AsFloat;
              memprodutos.FindField('PESOBRUTO').AsFloat   := memprodutos.FindField('QUANTIDADE').AsFloat;
              memprodutos.Post;
            end;
        end
      else
        begin
          memprodutos.Edit;
          memprodutos.FindField('PESOLIQUIDO').AsFloat := memprodutos.FindField('QUANTIDADE').AsFloat;
          memprodutos.FindField('PESOBRUTO').AsFloat   := memprodutos.FindField('QUANTIDADE').AsFloat;
          memprodutos.Post;
        end;

      //*****************************************************************//

      //*****************************************************************//
      // VALORES
      //*****************************************************************//
      M_VLRPRODUTOS := M_VLRPRODUTOS + memprodutos.FindField('TOTAL').AsFloat;
      M_VLRDESCONTO := M_VLRDESCONTO + memprodutos.FindField('DESCONTO').AsFloat;
      M_FRETE       := M_FRETE       + memprodutos.FindField('FRETE').AsFloat;
      M_SEGURO      := M_SEGURO      + memprodutos.FindField('SEGURO').AsFloat;
      M_BASE        := M_BASE        + memprodutos.FindField('BASEICMS').AsFloat;
      M_VICM        := M_VICM        + memprodutos.FindField('VALORICMS').AsFloat;
      M_VLRICMSDESONERACAO := M_VLRICMSDESONERACAO + memprodutos.FindField('VLRICMSDESONERACAO').AsFloat;
      M_VLRTOTAL    := M_VLRTOTAL    + memprodutos.FindField('LIQUIDO').AsFloat + memprodutos.FindField('FRETE').AsFloat    +
                                                                                  memprodutos.FindField('VALORIPI').AsFloat +
                                                                                  memprodutos.FindField('DESPESA').AsFloat  +
                                                                                  memprodutos.FindField('SEGURO').AsFloat;

      //*****************************************************************//
    end;
    memprodutos.next;
  end;

  UniDBFormattedNumberEditvlrprodutos.Value     := MRound(M_VLRPRODUTOS,2);
  UniDBFormattedNumberEditvlrtotal.Value        := MRound(M_VLRTOTAL,2);
  UniDBFormattedNumberEditVLRICMSDESONERACAO.Value := MRound(M_VLRICMSDESONERACAO,2);
  UniDBFormattedNumberEditpesoliquido.Value     := MRound(M_PESO,2);
  UniDBFormattedNumberEditpesobruto.Value       := MRound(M_BRUTO,2);
  UniDBFormattedNumberEditQUANTIDADE.Value      := MRound(M_QUANTIDADE,2);

  memprodutos.AfterDelete  := memprodutosAfterDelete;
  memprodutos.AfterPost    := memprodutosAfterPost;
  memprodutos.BeforeDelete := memprodutosBeforeDelete;
  memprodutos.BeforePost   := memprodutosBeforePost;

  memprodutos.GotoBookmark(M_MARCA);
  memprodutos.FreeBookmark(M_MARCA);
  memprodutos.EnableControls;

end;

function TfrmNOTAELETRONICA.CamposValidados: Boolean;
var
  i: Integer;
  Campos: TStrings;
  PrimeiroObrigatorio: TUniDBEdit;
begin
  Campos := TStringList.Create;
  try
    PrimeiroObrigatorio := nil;

    for I := 0 to ComponentCount - 1 do
      if Components[I] is TUniDBEdit then
        if TUniDBEdit(Components[I]).Tag = 1 then
          if Trim(TUniDBEdit(Components[I]).Text) = '' then
          begin
            if Assigned(TUniDBEdit(Components[I]).Field) then
              Campos.Add('- ' + TUniDBEdit(Components[I]).Field.DisplayName)
            else
              Campos.Add('- ' + TUniDBEdit(Components[I]).Name);

            if not Assigned(PrimeiroObrigatorio) then
              PrimeiroObrigatorio := TUniDBEdit(Components[I]);
          end;

    Result := Campos.Count = 0;
    if not Result then
    begin
      Campos.Insert(0, 'Preencha os campos obrigatórios:');
      dm_rc.rc_ShowSweetAlert('ATENÇÃO', Campos.Text, 'warning');
      if Assigned(PrimeiroObrigatorio) then
        PrimeiroObrigatorio.SetFocus;
    end;
  finally
    Campos.Free;
  end;
end;

procedure TfrmNOTAELETRONICA.carregadados;
begin
  CarregaParametros();
  CarregaMarca();

  tbtitulos.Close;
  tbtitulos.Open;

  memprodutos.Close;
  memprodutos.Open;

//  UniEditdescricaocondicao.Text := Acha_Item('CONDICOES'   ,IntToStr(sqlMaster.FindField('CONDICAO').AsInteger));
//  UniEditnomevendedor.Text      := Acha_Item('FUNCIONARIOS',IntToStr(sqlMaster.FindField('FUNCIONARIO').AsInteger));

  if SqlPesquisa('SELECT CODIGO, CPFCNPJ, INSCRICAO, NOME, CIDADE, ESTADO, RENASEM FROM PESSOAS WHERE CODIGO = ' + IntToStr(sqlMaster.FindField('PESSOA').AsInteger)) then
    begin
    //  UniEditnome.Text        := dm_rc.sqlBuscas.FindField('NOME').AsString;
      UniEditcpfcnpj.Text     := dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString;
      UniEditinscricao.Text   := dm_rc.sqlBuscas.FindField('INSCRICAO').AsString;
      UniEditrenasem.Text     := dm_rc.sqlBuscas.FindField('RENASEM').AsString;
    end;

  carregafinanceiro(mm.varI_Code_Company,sqlMaster.FindField('DOCUMENTO').AsInteger,sqlMaster.FindField('NUMERO').AsInteger);
  carregaitens     (mm.varI_Code_Company,sqlMaster.FindField('DOCUMENTO').AsInteger,sqlMaster.FindField('NUMERO').AsInteger);
  carregaMovimento_comissao(sqlMaster.FindField('NUMERO').AsInteger,
                            sqlMaster.FindField('DOCUMENTO').AsInteger,
                            mm.varI_Code_Company);

  HabilitaMenuAdiiconais(True);
  UniComboBoxparaop.Text          := sqlMaster.FindField('PARAMETROOPERACAO').AsString;
  UniComboBoxtrafrete.ItemIndex   := sqlMaster.FindField('TRAFRETE').AsInteger;

  UniComboBoxparaop.Enabled       := False;

  if sqlMaster.FindField('CANCELADA').AsString = 'A' then
    labTitleForm.Caption := labTitleForm.Caption +  ' -  H O M O L O G A D A ';
  if sqlMaster.FindField('CANCELADA').AsString = 'C' then
    labTitleForm.Caption := labTitleForm.Caption +  ' -  C A N C E L A D A  '
  else
    labTitleForm.Caption := 'NOTA ELETRÔNICA';
end;

procedure TfrmNOTAELETRONICA.carregafinanceiro(cempresa,cdocumento,cnumero:integer);
begin
  TabelaOperacao('select financeiro from operacoes where codigo = ' + QuotedStr(sqlMaster.FindField('OPERACAO').AsString));

  if SqlPesquisa(' SELECT SEQUENCIA, VENCIMENTO, VALORORIGINAL FROM '+variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'RECEBER','PAGAR') +
                 ' WHERE NUMERO                                                          = ' + IntToStr(cnumero)   +
                 ' AND DOCUMENTO                                                         = ' + IntToStr(cdocumento)+
                 ' AND EMPRESA                                                           = ' + IntToStr(cempresa)                     +
                 ' ORDER BY SEQUENCIA') then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          tbtitulos.Append;
          tbtitulos.FindField('PARCELA').AsInteger     := dm_rc.sqlBuscas.FindField('SEQUENCIA').AsInteger;
          tbtitulos.FindField('VENCIMENTO').AsDateTime := dm_rc.sqlBuscas.FindField('VENCIMENTO').AsDateTime;
          tbtitulos.FindField('VALOR').AsFloat         := dm_rc.sqlBuscas.FindField('VALORORIGINAL').AsFloat;
          tbtitulos.Post;

          dm_rc.sqlBuscas.Next;
        end;

      tbtitulos.First;
    end;
end;

procedure TfrmNOTAELETRONICA.carregaitens(cempresa,cdocumento,cnumero:integer);
var
  M_MARCA: TBookMark;
begin
  M_MARCA := memprodutos.GetBookmark;
  memprodutos.First;
  memprodutos.DisableControls;
  memprodutos.AfterDelete  := nil;
  memprodutos.AfterPost    := nil;
  memprodutos.BeforePost   := nil;
  memprodutos.BeforeDelete := nil;
  memprodutos.First;

  if SqlPesquisa(' SELECT * FROM MVITENS WHERE NUMERO   = ' + IntToStr(cnumero)    +
                 ' AND DOCUMENTO                        = ' + IntToStr(cdocumento) +
                 ' AND EMPRESA                          = ' + IntToStr(cempresa)   +
                 ' ORDER BY SEQUENCIA') then
  begin
    memprodutos.First;
    dm_rc.sqlBuscas.First;
    while not dm_rc.sqlBuscas.Eof do
      begin
        memprodutos.Append;
        memprodutos.FindField('PRODUTO').AsInteger       :=  dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
        memprodutos.FindField('DESCRICAO').AsString      :=  dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
        memprodutos.FindField('NUMERONCM').AsString      :=  dm_rc.sqlBuscas.FindField('NUMERONCM').AsString;

        memprodutos.FindField('UNIDADE').AsString        :=  dm_rc.sqlBuscas.FindField('UNIDADE').AsString;
        memprodutos.FindField('OPERACAO').AsString       :=  dm_rc.sqlBuscas.FindField('OPERACAO').AsString;
        memprodutos.FindField('CST').AsString            :=  dm_rc.sqlBuscas.FindField('CST').AsString;
        memprodutos.FindField('PRECO').AsFloat           :=  dm_rc.sqlBuscas.FindField('PRECO').AsFloat;
        memprodutos.FindField('QUANTIDADE').AsFloat      :=  dm_rc.sqlBuscas.FindField('QUANTIDADE').AsFloat;
        memprodutos.FindField('TOTAL').AsFloat           :=  dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
        memprodutos.FindField('PESOBRUTO').AsFloat       :=  dm_rc.sqlBuscas.FindField('PESOBRUTO').AsFloat;
        memprodutos.FindField('PESOLIQUIDO').AsFloat     :=  dm_rc.sqlBuscas.FindField('PESOLIQUIDO').AsFloat;

        //********************************************************************//
        // IMPOSTOS
        //********************************************************************//
        memprodutos.FindField('PERCICMS').AsFloat        :=  dm_rc.sqlBuscas.FindField('PERCICMS').AsFloat;
        memprodutos.FindField('VALORICMS').AsFloat       :=  dm_rc.sqlBuscas.FindField('VALORICMS').AsFloat;
        memprodutos.FindField('BASEICMS').AsFloat        :=  dm_rc.sqlBuscas.FindField('BASEICMS').AsFloat;

        memprodutos.FindField('PIS').AsString             :=  dm_rc.sqlBuscas.FindField('PIS').AsString;
        memprodutos.FindField('COFINS').AsString          :=  dm_rc.sqlBuscas.FindField('COFINS').AsString;
        memprodutos.FindField('VLRPIS').AsString          :=  dm_rc.sqlBuscas.FindField('VLRPIS').AsString;
        memprodutos.FindField('VLRCOFINS').AsString       :=  dm_rc.sqlBuscas.FindField('VLRCOFINS').AsString;
        memprodutos.FindField('TOTALPIS').AsString        :=  dm_rc.sqlBuscas.FindField('TOTALPIS').AsString;
        memprodutos.FindField('TOTALCOFINS').AsString     :=  dm_rc.sqlBuscas.FindField('TOTALCOFINS').AsString;
        //********************************************************************//

        memprodutos.FindField('PEDIDOOR').AsString          :=  dm_rc.sqlBuscas.FindField('PEDIDOOR').AsString;
        memprodutos.FindField('PEDIDOITEMOR').AsString      :=  dm_rc.sqlBuscas.FindField('PEDIDOITEMOR').AsString;
        memprodutos.FindField('OBSPRODUTO').AsString        :=  dm_rc.sqlBuscas.FindField('OBSPRODUTO').AsString;
        memprodutos.FindField('CODVEF').AsInteger           :=  dm_rc.sqlBuscas.FindField('CODVEF').AsInteger;

        //********************************************************************//
        // BASE DOS IMPOSTOS
        //********************************************************************//
        if SqlProdutos  ('SELECT PRODUTOS.*,SALDOS.* FROM PRODUTOS JOIN SALDOS ON SALDOS.EMPRESA = ' + IntToStr(cempresa) +
                         'AND SALDOS.PRODUTO = PRODUTOS.CODIGO WHERE PRODUTOS.CODIGO             = ' + IntToStr(memprodutos.FindField('PRODUTO').AsInteger)) then
          begin
            memprodutos.FindField('ICM0').AsFloat       := dm_rc.tbprodutos.Findfield('ICMS0').AsFloat;
            memprodutos.FindField('ICM1').AsFloat       := dm_rc.tbprodutos.Findfield('ICMS1').AsFloat;
            memprodutos.FindField('ICM2').AsFloat       := dm_rc.tbprodutos.Findfield('ICMS2').AsFloat;
            memprodutos.FindField('BAS0').AsFloat       := dm_rc.tbprodutos.Findfield('BASE0').AsFloat;
            memprodutos.FindField('BAS1').AsFloat       := dm_rc.tbprodutos.Findfield('BASE1').AsFloat;
            memprodutos.FindField('BAS2').AsFloat       := dm_rc.tbprodutos.Findfield('BASE2').AsFloat;

            memprodutos.FindField('SEMENTENOME').AsString   := dm_rc.tbprodutos.FindField('SEMENTENOME').AsString;
            memprodutos.FindField('CULTIVAR').AsString      := dm_rc.tbprodutos.Findfield('CULTIVAR').AsString;

          end;
        //********************************************************************//

          if dm_rc.sqlBuscas.FindField('LOTESEMENTE').AsString <> '' then
            begin
              memprodutos.FindField('DESCRICAO_NOTA').AsString := dm_rc.sqlBuscas.Findfield('DESCRICAO_NOTA').AsString;
              memprodutos.FindField('LOTESEMENTE').AsString    := dm_rc.sqlBuscas.Findfield('LOTESEMENTE').AsString;
              memprodutos.FindField('BOLETIMSEMENTE').AsString := dm_rc.sqlBuscas.Findfield('BOLETIMSEMENTE').AsString;
              memprodutos.FindField('TERMOSEMENTE').AsString   := dm_rc.sqlBuscas.Findfield('TERMOSEMENTE').AsString;
              memprodutos.FindField('VALIDADE').AsString       := dm_rc.sqlBuscas.Findfield('VALIDADE').AsString;
              memprodutos.FindField('CATEGORIA').AsString      := dm_rc.sqlBuscas.Findfield('CATEGORIA').AsString;
              memprodutos.FindField('SAFRAVALIDA').AsString    := dm_rc.sqlBuscas.Findfield('SAFRAVALIDA').AsString;
              memprodutos.FindField('VALORCULTURAL').AsFloat   := dm_rc.sqlBuscas.Findfield('VALORCULTURAL').AsFloat;
              memprodutos.FindField('GERMINACAO').AsFloat      := dm_rc.sqlBuscas.Findfield('GERMINACAO').AsFloat;
              memprodutos.FindField('PUREZA').AsFloat          := dm_rc.sqlBuscas.Findfield('PUREZA').AsFloat;
              memprodutos.FindField('TOTALPONTO').AsFloat      := dm_rc.sqlBuscas.Findfield('TOTALPONTO').AsFloat;
              memprodutos.FindField('PESOSACO').AsFloat        := dm_rc.sqlBuscas.Findfield('PESOSACO').AsFloat;
            end;

        memprodutos.Post;

        dm_rc.sqlBuscas.Next;
      end;
  end;

  if mm.varI_Code_Documento_statusdup = 'S' then
    begin
      memprodutos.First;
      while not memprodutos.Eof do
        begin
          if SqlPesquisa(' select * from entrega_futura where numero = ' + IntToStr(cnumero)    +
                         ' and                             documento = ' + IntToStr(cdocumento) +
                         ' and                             produto   = ' + IntToStr(memprodutos.FindField('PRODUTO').AsInteger) +
                         ' and                             sequencia = ' + IntToStr(memprodutos.RecNo)) then
          begin
            mm.varI_Code_CODVEF := dm_rc.sqlBuscas.FindField('CODIGO').AsInteger;
          end;

          carregaitensef(mm.varI_Code_Company,
                         cdocumento,
                         cnumero,
                         memprodutos.RecNo);

          memprodutos.Next
        end;
    end;

  memprodutos.First;
  memprodutos.AfterDelete  := memprodutosAfterDelete;
  memprodutos.AfterPost    := memprodutosAfterPost;
  memprodutos.BeforeDelete := memprodutosBeforeDelete;
  memprodutos.BeforePost   := memprodutosBeforePost;
  memprodutos.EnableControls;
  memprodutos.first;

  memprodutos.GotoBookmark(M_MARCA);
  memprodutos.FreeBookmark(M_MARCA);
end;

procedure TfrmNOTAELETRONICA.carregalote(lote: string; produto: integer);
var
  sql:string;
begin
  if lote <> '' then
    begin
      if SqlPesquisa(' select * from sementes where produto = ' + IntToStr(produto) +
                     ' and lote                             = ' + QuotedStr(lote)) then
      begin
        memprodutosLOTESEMENTE.AsString    := lote;
        memprodutosTERMOSEMENTE.AsString   := dm_rc.sqlBuscas.FindField('TERMO').AsString;
        memprodutosCATEGORIA.AsString      := dm_rc.sqlBuscas.FindField('CATEGORIA').AsString;
        memprodutosBOLETIMSEMENTE.AsString := dm_rc.sqlBuscas.FindField('BOLETIM').AsString;
        memprodutosVALORCULTURAL.AsString  := dm_rc.sqlBuscas.FindField('VALORCULTURAL').AsString;
        memprodutosVALIDADE.AsString       := dm_rc.sqlBuscas.FindField('VALIDADE').AsString;
        memprodutosCULTIVAR.AsString       := dm_rc.sqlBuscas.FindField('CULTIVAR').AsString;
        memprodutosCATEGORIA.AsString      := dm_rc.sqlBuscas.FindField('CATEGORIA').AsString;
        memprodutosSAFRAVALIDA.AsString    := dm_rc.sqlBuscas.FindField('SAFRAVALIDA').AsString;
        memprodutosPESOSACO.AsFloat        := dm_rc.sqlBuscas.FindField('PESOEMBALAGEM').AsFloat;
      end;

      sql := ' select *                                         ' +
             ' from produtos P                                  ' +
             ' inner join saldos on (p.codigo = saldos.produto) ' +
             ' where P.codigo                                =  ' + IntToStr(produto) +
             ' and saldos.empresa                            =  ' + IntToStr(mm.varI_Code_Company);

      if SqlPesquisa(sql) then
      begin
        memprodutosSEMENTENOME.AsString   := dm_rc.sqlBuscas.FindField('SEMENTENOME').AsString;
      end;

      geradescricaonota();
    end;

end;

procedure TfrmNOTAELETRONICA.CarregaImportacao(const controle: integer);
var i : integer; Cmp:String;
R,S   : Integer;
begin
  TabelaMvmestre('select * from mvmestre where codigo = ' + IntToStr(controle));

  sqlMaster.FindField('PESSOA').AsInteger            := DM_RC.FDQryMvmestre.FindField('PESSOA').AsInteger;
  sqlMaster.FindField('CONDICAO').AsInteger          := DM_RC.FDQryMvmestre.FindField('CONDICAO').AsInteger;
  sqlMaster.FindField('FUNCIONARIO').AsInteger       := DM_RC.FDQryMvmestre.FindField('FUNCIONARIO').AsInteger;

  sqlMaster.FindField('COMISSAOFUNCIONARIO').AsFloat := DM_RC.FDQryMvmestre.FindField('COMISSAOFUNCIONARIO').AsFloat;
  sqlMaster.FindField('EMISSAO').AsDateTime          := Date;
  sqlMaster.FindField('RECEPCAODESPACHO').AsDateTime := Date;

  sqlMaster.FindField('VLRDSPNTRIBUTADA').AsFloat    := DM_RC.FDQryMvmestre.FindField('VLRDSPNTRIBUTADA').AsFloat;
  sqlMaster.FindField('VLRDSPTRIBUTADA').AsFloat     := DM_RC.FDQryMvmestre.FindField('VLRDSPTRIBUTADA').AsFloat;
  sqlMaster.FindField('VLRBASEICMS').AsFloat         := DM_RC.FDQryMvmestre.FindField('VLRBASEICMS').AsFloat;
  sqlMaster.FindField('VLRICMS').AsFloat             := DM_RC.FDQryMvmestre.FindField('VLRICMS').AsFloat;
  sqlMaster.FindField('VLRDESCONTOS').AsFloat        := DM_RC.FDQryMvmestre.FindField('VLRDESCONTOS').AsFloat;
  sqlMaster.FindField('VLRDESPESAS').AsFloat         := DM_RC.FDQryMvmestre.FindField('VLRDESPESAS').AsFloat;
  sqlMaster.FindField('VLRPRODUTOS').AsFloat         := DM_RC.FDQryMvmestre.FindField('VLRPRODUTOS').AsFloat;
  sqlMaster.FindField('VLRTOTAL').AsFloat            := DM_RC.FDQryMvmestre.FindField('VLRTOTAL').AsFloat;

  //**************************************************************************//
  //OBSERVAÇÃO/REFERENCIA
  //**************************************************************************//
  sqlMaster.FindField('OBSERVACOES').AsString        := DM_RC.FDQryMvmestre.FindField('OBSERVACOES').AsString;
  if mm.varI_Code_Documento_statusdup = 'S' then
    begin
      UniDBMemoobs.Lines.Add('REFERENTE A NOTA Nº ' + IntToStr(DM_RC.FDQryMvmestre.FindField('NUMERO').AsInteger) +
                             ' CHAVE DE ACESSO..: ' + DM_RC.FDQryMvmestre.FindField('CODIGOBARRAS').AsString +
                             ' PROTOCOLO..: '       + DM_RC.FDQryMvmestre.FindField('PROTOCOLO').AsString);

      sqlMaster.FindField('CODIGOBARRASCOMPLEMENTO').AsString := DM_RC.FDQryMvmestre.FindField('CODIGOBARRAS').AsString;
    end;
  //**************************************************************************//
  if mm.varI_Code_Documento_statusdup = 'S' then
    begin
      sqlMaster.FindField('PEDIDO').AsString             := '';
      sqlMaster.FindField('PEDIDO_SERIE').AsString       := '';
      sqlMaster.FindField('PEDIDO_DOCUMENTO').AsInteger  := 0;
    end
  else
    begin
      sqlMaster.FindField('PEDIDO').AsString             := dm_rc.FDQryMvmestre.FindField('NUMERO').AsString;
      sqlMaster.FindField('PEDIDO_SERIE').AsString       := dm_rc.FDQryMvmestre.FindField('SERIE').AsString;
      sqlMaster.FindField('PEDIDO_DOCUMENTO').AsInteger  := dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger;
    end;

  sqlMaster.FindField('NUMERO').AsInteger            := 0;
  sqlMaster.FindField('SERIE').AsString              := 'NFE';
  sqlMaster.FindField('DOCUMENTO').AsInteger         := 1;
  sqlMaster.FindField('NUMEROPEDIDO').AsString       := dm_rc.FDQryMvmestre.FindField('NUMEROPEDIDO').AsString;

  sqlMaster.FindField('TRANSPORTADORA').AsInteger    :=  dm_rc.FDQryMvmestre.FindField('TRANSPORTADORA').AsInteger;
  sqlMaster.FindField('TRANOME').AsString            :=  dm_rc.FDQryMvmestre.FindField('TRANOME').AsString;
  sqlMaster.FindField('TRAMARCA').AsString           :=  dm_rc.FDQryMvmestre.FindField('TRAMARCA').AsString;
  UniComboBoxtrafrete.ItemIndex                     :=  dm_rc.FDQryMvmestre.FindField('TRAFRETE').AsInteger;

  if dm_rc.FDQryMvmestre.FindField('ENTREGA_IBGE').AsString <> '' then
    begin
      sqlMaster.FindField('TRAFRETE').AsString         := dm_rc.FDQryMvmestre.FindField('TRAFRETE').AsString;
      sqlMaster.FindField('ENTREGA_CEP').AsString      := dm_rc.FDQryMvmestre.FindField('ENTREGA_CEP').AsString;
      sqlMaster.FindField('ENTREGA_IBGE').AsString     := dm_rc.FDQryMvmestre.FindField('ENTREGA_IBGE').AsString;
      sqlMaster.FindField('ENTREGA_ENDERECO').AsString := dm_rc.FDQryMvmestre.FindField('ENTREGA_ENDERECO').AsString;
      sqlMaster.FindField('ENTREGA_NUMERO').AsString   := dm_rc.FDQryMvmestre.FindField('ENTREGA_NUMERO').AsString;
      sqlMaster.FindField('ENTREGA_BAIRRO').AsString   := dm_rc.FDQryMvmestre.FindField('ENTREGA_BAIRRO').AsString;
      sqlMaster.FindField('ENTREGA_CIDADE').AsString   := dm_rc.FDQryMvmestre.FindField('ENTREGA_CIDADE').AsString;
      sqlMaster.FindField('ENTREGA_ESTADO').AsString   := dm_rc.FDQryMvmestre.FindField('ENTREGA_ESTADO').AsString;
    end;

  varC_Documento_MvmestreNFE    := sqlMaster.FindField('DOCUMENTO').AsInteger;
  UniComboBoxparaop.Text        := dm_rc.FDQryMvmestre.FindField('PARAMETROOPERACAO').AsString;

//  UniEditdescricaocondicao.Text := Acha_Item('CONDICOES'   ,IntToStr(DM_RC.FDQryMvmestre.FindField('CONDICAO').AsInteger));
//  UniEditnomevendedor.Text      := Acha_Item('FUNCIONARIOS',IntToStr(DM_RC.FDQryMvmestre.FindField('FUNCIONARIO').AsInteger));

  if SqlPesquisa('SELECT CODIGO, CPFCNPJ, INSCRICAO, NOME, CIDADE, ESTADO, RENASEM FROM PESSOAS WHERE CODIGO = ' + IntToStr(DM_RC.FDQryMvmestre.FindField('PESSOA').AsInteger)) then
    begin
 //     UniEditnome.Text        := dm_rc.sqlBuscas.FindField('NOME').AsString;
      UniEditcpfcnpj.Text     := dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString;
      UniEditinscricao.Text   := dm_rc.sqlBuscas.FindField('INSCRICAO').AsString;
      UniEditrenasem.Text     := dm_rc.sqlBuscas.FindField('RENASEM').AsString;

      FDQrypessoas.Close ;
      for i := 0 to  FDQrypessoas.Params.Count - 1 do
      begin
        Cmp :=  FDQrypessoas.Params[i].Name;
         FDQrypessoas.Params[i].Value :=  dm_rc.FDQryMvmestre.FieldbyName(Cmp).Value;
      end;
       FDQrypessoas.Open;
    end;

  memprodutos.Close;
  memprodutos.Open;

  carregaitens     (mm.varI_Code_Company,dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger,dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger);

  if SqlPesquisa(' SELECT *                                    FROM PAGAR ' +
                 ' WHERE NUMERO                                         = ' + IntToStr(DM_RC.FDQryMvmestre.FindField('numero').AsInteger)   +
                 ' AND DOCUMENTO                                        = ' + IntToStr(DM_RC.FDQryMvmestre.FindField('documento').AsInteger)+
                 ' AND EMPRESA                                          = ' + IntToStr(DM_RC.FDQryMvmestre.FindField('empresa').AsInteger)  +
                 ' ORDER BY SEQUENCIA') then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          tbtitulos.Append;
          tbtitulos.FindField('PARCELA').AsInteger     := dm_rc.sqlBuscas.FindField('SEQUENCIA').AsInteger;
          tbtitulos.FindField('VENCIMENTO').AsDateTime := dm_rc.sqlBuscas.FindField('VENCIMENTO').AsDateTime;
          tbtitulos.FindField('VALOR').AsFloat         := dm_rc.sqlBuscas.FindField('VALORORIGINAL').AsFloat;
          tbtitulos.Post;

          dm_rc.sqlBuscas.Next;
        end;

      tbtitulos.First;
    end;

  //************************************************************************//
  // VERIFICA OS ITENS
  //************************************************************************//
  Parametrocfoppessoa();
  ReleituraProdutoscfop();
  Calcula_Icms('');
  //************************************************************************//
  dm_rc.FDQryMvmestre.Close;

  end;

procedure TfrmNOTAELETRONICA.CarregaParametros;
begin

  UniComboBoxparaop.Clear;

  if SqlPesquisa(
    'SELECT DISTINCT TIPO ' +
    'FROM OPERACOES ' +
    'WHERE TIPO IS NOT NULL and TIPO <> ''''' +
    'ORDER BY TIPO'
  ) then
  begin
    dm_rc.sqlBuscas.First;

    while not dm_rc.sqlBuscas.Eof do
    begin
      UniComboBoxparaop.Items.Add(dm_rc.sqlBuscas.FieldByName('TIPO').AsString );

      dm_rc.sqlBuscas.Next;
    end;
  end;


{  if SqlPesquisa('SELECT DESCRICAO FROM PARAMETROSOPERACAO ORDER BY CODIGO') then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          UniComboBoxparaop.Items.Add(dm_rc.sqlBuscas.FindField('DESCRICAO').AsString);

          dm_rc.sqlBuscas.Next;
        end;
    end;
    }

end;

procedure TfrmNOTAELETRONICA.carregaprodutos(codigo: string);
var
  sql:string;
begin
  sql := ' select *                                         ' +
         ' from produtos P                                  ' +
         ' inner join saldos on (p.codigo = saldos.produto) ' +
         ' where P.codigo                                =  ' + QuotedStr(codigo) +
         ' and saldos.empresa                            =  ' + IntToStr(mm.varI_Code_Company);

  if not SqlPesquisa(sql) then
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não encontrei esse Produto' , 'warning')
  else
    begin
      memprodutos.Edit;
      memprodutos.FindField('PRODUTO').AsInteger        := StrToInt(codigo);
      memprodutos.FindField('DESCRICAO').AsString       := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
      memprodutos.FindField('PRECO').AsFloat            := dm_rc.sqlBuscas.FindField('VENDA').AsFloat;
      memprodutos.FindField('UNIDADE').AsString         := dm_rc.sqlBuscas.FindField('UNIDADE').AsString;

      memprodutos.FindField('SEMENTENOME').AsString     := dm_rc.sqlBuscas.FindField('SEMENTENOME').AsString;
      memprodutos.FindField('CULTIVAR').AsString        := dm_rc.sqlBuscas.FindField('CULTIVAR').AsString;

      memprodutos.FindField('NCM').AsString             := dm_rc.sqlBuscas.FindField('NUMERONCM').AsString;
      memprodutos.FindField('NUMERONCM').AsString       := dm_rc.sqlBuscas.FindField('NUMERONCM').AsString;
      memprodutos.FindField('UNIDADE').AsString         := dm_rc.sqlBuscas.FindField('UNIDADE').AsString;

      memprodutos.FindField('ICM0').AsFloat             := dm_rc.sqlBuscas.FindField('ICMS0').AsFloat;
      memprodutos.FindField('ICM1').AsFloat             := dm_rc.sqlBuscas.FindField('ICMS1').AsFloat;
      memprodutos.FindField('ICM2').AsFloat             := dm_rc.sqlBuscas.FindField('ICMS2').AsFloat;

      memprodutos.FindField('BAS0').AsFloat             := dm_rc.sqlBuscas.FindField('BASE0').AsFloat;
      memprodutos.FindField('BAS1').AsFloat             := dm_rc.sqlBuscas.FindField('BASE1').AsFloat;
      memprodutos.FindField('BAS2').AsFloat             := dm_rc.sqlBuscas.FindField('BASE2').AsFloat;

      memprodutos.FindField('SITUACAOLOCAL').AsString   := dm_rc.sqlBuscas.FindField('SITUACAOLOCAL').AsString;
      memprodutos.FindField('SITUACAOOUTRAS').AsString  := dm_rc.sqlBuscas.FindField('SITUACAOOUTRAS').AsString;

      memprodutos.FindField('PIS').AsString             := dm_rc.sqlBuscas.FindField('PIS').AsString;
      memprodutos.FindField('COFINS').AsString          := dm_rc.sqlBuscas.FindField('COFINS').AsString;
      memprodutos.FindField('VLRPIS').AsFloat           := dm_rc.sqlBuscas.FindField('VLRPIS').AsFloat;
      memprodutos.FindField('VLRCOFINS').AsFloat        := dm_rc.sqlBuscas.FindField('VLRCOFINS').AsFloat;
    end;

end;

procedure TfrmNOTAELETRONICA.D1Click(Sender: TObject);
begin
  dm_rc.rc_ShowYesNo( 'POSSO IMPRIMIR AS DUPLICATAS?' );
  if mm.varB_Yes then
    begin
      mm.varC_caminhopdf :=  IMPRESSAO_Duplicata(mm.varI_Code_Company,
                                                 sqlSearchMaster.FindField('CODIGO').AsInteger,
                                                 0);
      unfImpressao.ShowModal();
    end;
end;

procedure TfrmNOTAELETRONICA.d2Click(Sender: TObject);
begin
  inherited;
  if sqlSearchMaster.FindField('CANCELADA').AsString <> 'A' then
    begin
      dm_rc.rc_ShowSweetAlert( 'Ok', 'NÃO FOI PERMITIDO FAZER A IMPRESSÃO' , 'error');
      abort
    end;

  mm.varI_Code_Documento_Controle := sqlSearchMaster.FindField('CODIGO').AsInteger;
  frmdeclaracaoretirada.ShowModal();

  mm.varI_Code_Documento_Controle := 0;
end;

procedure TfrmNOTAELETRONICA.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
  var Linha, Coluna : Integer;
begin
  inherited;
   Linha  := TStringGrid(dbgSearchCRUD).Row;
   Coluna := dbgSearchCRUD.CurrCol;

  if Column.FieldName = 'opcoes' then
    begin
      UniPopupMenudetalhes.Popup(posicao_x-160,posicao_y, dbgSearchCRUD);
    end;
end;

procedure TfrmNOTAELETRONICA.dbgSearchCRUDDblClick(Sender: TObject);
begin
  if sqlSearchMaster.IsEmpty then Exit;
  inherited;
  btntransp.Visible := true;
  btncalcreg.Visible := true;

end;

procedure TfrmNOTAELETRONICA.dbgSearchCRUDMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  posicao_x := X;
  posicao_y := Y;
end;

procedure TfrmNOTAELETRONICA.E1Click(Sender: TObject);
begin
  mm.varI_Code_Documento_Controle := sqlMaster.FindField('CODIGO').AsInteger;
  frmSEFAZNOTA.ShowModal();

  sqlSearchMaster.Refresh;
  sqlMaster.Refresh;
end;

procedure TfrmNOTAELETRONICA.edLkpOPERACOESClick(Sender: TObject);
begin
  inherited;

  if UniComboBoxparaop.Text = '' then
    dm_rc.rc_ShowMessage('Selecione um tipo de operação')
  else
    dm_rc.rc_LookUpSearchFilter( Sender, 'TIPO = ' + quotedstr(UniComboBoxparaop.Text) , '', 'CODIGO;TIPO' );

end;

procedure TfrmNOTAELETRONICA.edLkpPESSOASClick(Sender: TObject);
begin
  inherited;
  dm_rc.rc_LookUpSearchFilter( Sender, '', '', 'CPFCNPJ;CIDADE;ESTADO' );
end;

procedure TfrmNOTAELETRONICA.edLkpPESSOASExit(Sender: TObject);
var
i:integer;
Cmp:String;
begin
  inherited;
if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    begin
      if (sqlMaster.FindField('PESSOA').AsString <> '') then
        begin
          if SqlPesquisa('SELECT * FROM PESSOAS WHERE CODIGO = ' + QuotedStr(sqlMaster.FindField('PESSOA').AsString)) then
            begin
//              UniEditnome.Text         := dm_rc.sqlBuscas.FindField('NOME').AsString;
              UniEditcpfcnpj.Text      := dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString;
              UniEditinscricao.Text    := dm_rc.sqlBuscas.FindField('INSCRICAO').AsString;
              UniEditrenasem.Text      := dm_rc.sqlBuscas.FindField('RENASEM').AsString;

              FDQrypessoas.Close ;
              for i := 0 to  FDQrypessoas.Params.Count - 1 do
              begin
                Cmp :=  FDQrypessoas.Params[i].Name;
                 FDQrypessoas.Params[i].Value :=  sqlMaster.FieldbyName(Cmp).Value;
              end;
               FDQrypessoas.Open;
            end;
        end
        else
          begin
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Coloque uma Pessoa!' , 'warning');
          end;
    end;
end;

procedure TfrmNOTAELETRONICA.edLkpPRODUTOSClick(Sender: TObject);
begin
  inherited;
  dm_rc.rc_LookUpSearchFilter( Sender, '', '', 'CODIGO' );
end;

procedure TfrmNOTAELETRONICA.edLkpTRANSPORTESExit(Sender: TObject);
begin
  inherited;

  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    begin
      if (edLkpTRANSPORTES.Text <> '') then
        begin
          if SqlPesquisa('SELECT NOME, CPFCNPJ FROM TRANSPORTES WHERE CODIGO = ' + QuotedStr(sqlMaster.FindField('TRANSPORTADORA').AsString)) then
            begin
//              sqlMaster.FindField('TRANOME').AsString      := dm_rc.sqlBuscas.FindField('NOME').AsString;
//              sqlMaster.FindField('TRACPFCNPJ').AsString   := dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString;
            end;
        end
        else
          begin
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Coloque uma Transportadora!' , 'warning');
          end;
    end;

end;

procedure TfrmNOTAELETRONICA.Exclui;
var
  codigotable : integer;
begin
  MemoGravaLog();
  codigotable := sqlMaster.FindField('CODIGO').AsInteger;

  TabelaOperacao('select financeiro from operacoes where codigo = ' + IntToStr(sqlMaster.FindField('OPERACAO').AsInteger));
  executasql    (' update mvitens set mvitens.empresa = 0         ' +
                 ' where numero                       =           ' + IntToStr(sqlMaster.FindField('NUMERO').AsInteger)   +
                 ' and documento                      =           ' + IntToStr(sqlMaster.FindField('DOCUMENTO').AsInteger)+
                 ' and empresa                        =           ' + IntToStr(mm.varI_Code_Company));

  executasql    (' update                               ' + variif(DM_RC.FDQryoperacoes.FindField('financeiro').AsInteger = 1,'receber','pagar')+' set empresa = 0' +
                 ' where numero                       = ' + IntToStr(sqlMaster.FindField('NUMERO').AsInteger)   +
                 ' and documento                      = ' + IntToStr(sqlMaster.FindField('DOCUMENTO').AsInteger)+
                 ' and empresa                        = ' + IntToStr(mm.varI_Code_Company));
  sqlMaster.Edit;
  sqlMaster.FindField('EMPRESA').AsInteger := 0;
  sqlMaster.Post;
  if sqlMaster.ApplyUpdates(-1) > 0 then
    raise Exception.Create('Falha ao excluir o cabeçalho da nota.');
  sqlMaster.CommitUpdates;

  try
    if  sqlSearchMaster.Active then
      sqlSearchMaster.Refresh;

   GravaLog(mm.varI_Code_Company,
            mm.varI_User,
            codigotable,
            mm.vUserName,
            'dsDelete',
            sqlMaster.UpdateOptions.UpdateTableName,
            '',
            UniMemolog.Text);

    LimpaVars;
    tbtitulos.Close;
    memprodutos.Close;
    dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Excluido com SUCESSO!' , 'success');
    pgBaseCadControl.ActivePage := tabSearch;
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui DELETAR, chame o SUPORTE!' , 'error' );
  end;
end;

procedure TfrmNOTAELETRONICA.FDQryFiltroopcoesGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
      '<i title="detalhes" class="fa fa-lg fas fa-cog fa-lg"; style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmNOTAELETRONICA.FDQryFiltrostatusGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
var
  Situacao: string;
begin
  if not DisplayText then
    Exit;

  Situacao := Sender.DataSet.FieldByName('CANCELADA').AsString;

  if Situacao = 'A' then
    Text := '<span class="badge text-bg-success">Homologada</span>'
  else if Situacao = 'D' then
    Text := '<span class="badge text-bg-danger">Denegada</span>'
  else if Situacao = 'C' then
    Text := '<span class="badge text-bg-danger">Cancelada</span>'
  else if Situacao = 'I' then
    Text := '<span class="badge text-bg-primary">Inutilizada</span>'
  else
    Text := '<span class="badge text-bg-warning">Aguarde</span>';
end;
procedure TfrmNOTAELETRONICA.geradescricaonota;
begin
  memprodutos.FindField('DESCRICAO_NOTA').AsString := 'Sementes de '  + StrAllTrim(memprodutos.FindField('SEMENTENOME').AsString)          +
                                                      ' CV '          + StrAllTrim(memprodutos.FindField('CULTIVAR').AsString)             + ' - '  +
                                                      'Termo  '       + memprodutos.FindField('TERMOSEMENTE').AsString                     + ' - '  +
                                                      'Lote:  '       + StrAllTrim(memprodutos.FindField('LOTESEMENTE').AsString)          + ' - ' +
                                                      'Categoria: '   + StrAllTrim(memprodutos.FindField('CATEGORIA').AsString);

  if memprodutos.FindField('PESOSACO').AsFloat > 0 then
    begin
      memprodutos.FindField('PESOBRUTO').AsFloat   := memprodutos.FindField('QUANTIDADE').AsFloat * memprodutos.FindField('PESOSACO').AsFloat;
      memprodutos.FindField('PESOLIQUIDO').AsFloat := memprodutos.FindField('QUANTIDADE').AsFloat * memprodutos.FindField('PESOSACO').AsFloat;
    end;
end;

procedure TfrmNOTAELETRONICA.gravamemoria;
begin
  if memprodutos.FindField('PRODUTO').AsInteger > 0 then
    begin
      memprodutos.Edit;

      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
        if memprodutos.FindField('QUANTIDADE').AsFloat = 0 then
          begin
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Coloque a QUANTIDADE!' , 'warning' );
            memprodutos.FindField('QUANTIDADE').FocusControl;
            Abort;
          end;

      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
        if memprodutos.FindField('PRECO').AsFloat = 0 then
          begin
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Coloque o PREÇO!' , 'warning' );
            memprodutos.FindField('PRECO').FocusControl;
            Abort;
          end;

      memprodutos.FindField('TOTAL').AsFloat  := memprodutos.FindField('PRECO').AsFloat *
                                                 memprodutos.FindField('QUANTIDADE').AsFloat;

      if memprodutos.FindField('LOTESEMENTE').AsString <> '' then
        begin
          memprodutos.FindField('TOTALPONTO').AsFloat := memprodutos.FindField('QUANTIDADE').AsFloat *
                                                         memprodutos.FindField('PUREZA').AsFloat;
          geradescricaonota();

        end;

      Calculapiscofins();

      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
        begin
          ValidaInfoProdutoMemoria(StrToInt(sqlMaster.FindField('OPERACAO').AsString),
                                            memprodutos.FindField('PRODUTO').AsInteger,
                                            mm.varI_Code_Company);
        end;
    end;
end;

procedure TfrmNOTAELETRONICA.GravaMovimento;
begin

  TabelaMvitens ('select * from mvitens where codigo            = 0');
  TabelaPontos  ('select * from pontos  where codigo            = 0');
  TabelaOperacao('select *          from operacoes where codigo =  ' + QuotedStr(sqlMaster.FindField('OPERACAO').AsString));
  TabelaTitulos ('select * from                                    ' + variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'RECEBER','PAGAR') + ' where codigo = 0');

  Exclui_Movimento('MVITENS',sqlMaster.FindField('SERIE').AsString,MM.varI_Code_Company,1,sqlMaster.FindField('NUMERO').AsInteger);
  Exclui_Movimento('PONTOS' ,sqlMaster.FindField('SERIE').AsString,MM.varI_Code_Company,1,sqlMaster.FindField('NUMERO').AsInteger);
  Exclui_Movimento(variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'RECEBER','PAGAR'),sqlMaster.FindField('SERIE').AsString,MM.varI_Code_Company,1,sqlMaster.FindField('NUMERO').AsInteger);

  //**********************************************************************//
  // EXCLUI ITENS DE VENDA FUTURA
  //**********************************************************************//
  if dm_rc.FDQryoperacoes.FindField('OPERACAO_OP').AsString = 'Venda EF' then
    EntregaFuturaCRUD('exclui');
  //**********************************************************************//

  memprodutos.DisableControls;
  memprodutos.First;
  while not memprodutos.Eof do
    begin
      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
        begin
          dm_rc.tbmvitens.Append;
          dm_rc.tbmvitens.FindField('SEQUENCIA').AsInteger      := memprodutos.RecNo;
          dm_rc.tbmvitens.FindField('EMPRESA').AsInteger        := mm.varI_Code_Company;
          dm_rc.tbmvitens.FindField('DOCUMENTO').AsInteger      := sqlMaster.FindField('DOCUMENTO').AsInteger;
          dm_rc.tbmvitens.FindField('NUMERO').AsInteger         := sqlMaster.FindField('NUMERO').AsInteger;
          dm_rc.tbmvitens.FindField('SERIE').AsString           := sqlMaster.FindField('SERIE').AsString;
          dm_rc.tbmvitens.FindField('UF').AsString              := UniDBEditestado.Text;
          dm_rc.tbmvitens.FindField('PESSOA').AsInteger         := sqlMaster.FindField('PESSOA').AsInteger;
          dm_rc.tbmvitens.FindField('EMISSAO').AsDateTime       := sqlMaster.FindField('EMISSAO').AsDateTime;
          dm_rc.tbmvitens.FindField('OPERACAO').AsFloat         := sqlMaster.FindField('OPERACAO').AsFloat;
          dm_rc.tbmvitens.FindField('PRODUTO').AsInteger        := memprodutos.FindField('PRODUTO').AsInteger;
          dm_rc.tbmvitens.FindField('DESCRICAO').AsString       := memprodutos.FindField('DESCRICAO').AsString;
          dm_rc.tbmvitens.FindField('NUMERONCM').AsString       := memprodutos.FindField('NUMERONCM').AsString;
          dm_rc.tbmvitens.FindField('UNIDADE').AsString         := memprodutos.FindField('UNIDADE').AsString;
          dm_rc.tbmvitens.FindField('PRECO').AsFloat            := memprodutos.FindField('PRECO').AsFloat;
          dm_rc.tbmvitens.FindField('DESCONTO').AsFloat         := memprodutos.FindField('DESCONTO').AsFloat;
          dm_rc.tbmvitens.FindField('DESPESAS').AsFloat         := memprodutos.FindField('DESPESA').AsFloat;
          dm_rc.tbmvitens.FindField('QUANTIDADE').AsFloat       := memprodutos.FindField('QUANTIDADE').AsFloat;
          dm_rc.tbmvitens.FindField('TOTAL').AsFloat            := memprodutos.FindField('TOTAL').AsFloat;
          dm_rc.tbmvitens.FindField('CST').AsString             := memprodutos.FindField('CST').AsString;
          dm_rc.tbmvitens.FindField('PERCICMS').AsFloat         := memprodutos.FindField('PERCICMS').AsFloat;
          dm_rc.tbmvitens.FindField('VALORICMS').AsFloat        := memprodutos.FindField('VALORICMS').AsFloat;
          dm_rc.tbmvitens.FindField('BASEICMS').AsFloat         := memprodutos.FindField('BASEICMS').AsFloat;
          dm_rc.tbmvitens.FindField('GRUPO').AsInteger          := memprodutos.FindField('GRUPO').AsInteger;
          dm_rc.tbmvitens.Findfield('CUSTO').AsFloat            := memprodutos.FindField('CUSTO').AsFloat;
          dm_rc.tbmvitens.Findfield('COMPRA').AsFloat           := memprodutos.FindField('COMPRA').AsFloat;
          dm_rc.tbmvitens.FindField('NUMERONCM').AsString       := memprodutos.FindField('NCM').AsString;
          dm_rc.tbmvitens.FindField('FRETE').AsFloat            := memprodutos.FindField('FRETE').AsFloat;
          dm_rc.tbmvitens.Findfield('SEGURO').AsFloat           := memprodutos.FindField('SEGURO').AsFloat;
          dm_rc.tbmvitens.Findfield('FRETE').AsFloat            := memprodutos.FindField('FRETE').AsFloat;
          dm_rc.tbmvitens.Findfield('PIS').AsString             := memprodutos.FindField('PIS').AsString;
          dm_rc.tbmvitens.Findfield('COFINS').AsString          := memprodutos.FindField('COFINS').AsString;
          dm_rc.tbmvitens.Findfield('VLRPIS').AsString          := memprodutos.FindField('VLRPIS').AsString;
          dm_rc.tbmvitens.Findfield('VLRCOFINS').AsString       := memprodutos.FindField('VLRCOFINS').AsString;
          dm_rc.tbmvitens.Findfield('TOTALPIS').AsString        := memprodutos.FindField('TOTALPIS').AsString;
          dm_rc.tbmvitens.Findfield('TOTALCOFINS').AsString     := memprodutos.FindField('TOTALCOFINS').AsString;

          dm_rc.tbmvitens.Findfield('PERCREDUCAO').AsFloat      := memprodutos.FindField('PERCREDUCAO').AsFloat;
          dm_rc.tbmvitens.Findfield('PESOBRUTO').AsFloat        := memprodutos.FindField('PESOBRUTO').AsFloat;
          dm_rc.tbmvitens.Findfield('PESOLIQUIDO').AsFloat      := memprodutos.FindField('PESOLIQUIDO').AsFloat;
          dm_rc.tbmvitens.FindField('PRODUTO').AsInteger        := memprodutos.FindField('PRODUTO').AsInteger;
          dm_rc.tbmvitens.FindField('DESCRICAO').AsString       := memprodutos.FindField('DESCRICAO').AsString;

          dm_rc.tbmvitens.FindField('VLRICMSDESONERACAO').AsFloat   := memprodutos.FindField('VLRICMSDESONERACAO').AsFloat;
          dm_rc.tbmvitens.FindField('PEDIDOOR').AsString            := memprodutos.FindField('PEDIDOOR').AsString;
          dm_rc.tbmvitens.FindField('PEDIDOITEMOR').AsString        := memprodutos.FindField('PEDIDOITEMOR').AsString;
          dm_rc.tbmvitens.FindField('OBSPRODUTO').AsString          := memprodutos.FindField('OBSPRODUTO').AsString;
          if memprodutos.FindField('CODVEF').AsInteger <> 0 then
            dm_rc.tbmvitens.FindField('CODVEF').AsInteger           := memprodutos.FindField('CODVEF').AsInteger;

          if memprodutos.FindField('LOTESEMENTE').AsString <> '' then
            begin
              dm_rc.tbmvitens.Findfield('DESCRICAO_NOTA').AsString  := memprodutos.FindField('DESCRICAO_NOTA').AsString;
              dm_rc.tbmvitens.Findfield('LOTESEMENTE').AsString     := memprodutos.FindField('LOTESEMENTE').AsString;
              dm_rc.tbmvitens.Findfield('BOLETIMSEMENTE').AsString  := memprodutos.FindField('BOLETIMSEMENTE').AsString;
              dm_rc.tbmvitens.Findfield('TERMOSEMENTE').AsString    := memprodutos.FindField('TERMOSEMENTE').AsString;
              dm_rc.tbmvitens.Findfield('VALIDADE').AsString        := memprodutos.FindField('VALIDADE').AsString;
              dm_rc.tbmvitens.Findfield('CATEGORIA').AsString       := memprodutos.FindField('CATEGORIA').AsString;
              dm_rc.tbmvitens.Findfield('SAFRAVALIDA').AsString     := memprodutos.FindField('SAFRAVALIDA').AsString;
              dm_rc.tbmvitens.Findfield('VALORCULTURAL').AsFloat    := memprodutos.FindField('VALORCULTURAL').AsFloat;
              dm_rc.tbmvitens.Findfield('GERMINACAO').AsFloat       := memprodutos.FindField('GERMINACAO').AsFloat;
              dm_rc.tbmvitens.Findfield('PUREZA').AsFloat           := memprodutos.FindField('PUREZA').AsFloat;
              dm_rc.tbmvitens.Findfield('TOTALPONTO').AsFloat       := memprodutos.FindField('QUANTIDADE').AsFloat * memprodutos.FindField('PUREZA').AsFloat;
              dm_rc.tbmvitens.Findfield('PESOSACO').AsFloat         := memprodutos.FindField('PESOSACO').AsFloat;
            end;

          dm_rc.tbmvitens.FindField('CANCELADA').AsString          := sqlMaster.FindField('CANCELADA').AsString;
          dm_rc.tbmvitens.FindField('KEY').AsString                := Gera_Guid();
          dm_rc.tbmvitens.FindField('CODIGO').AsInteger            := Ultimo_Codigo('MVITENS','CODIGO',False);

          dm_rc.tbmvitens.Post;

          //**********************************************************************//
          // GRAVA ITENS DE VENDA FUTURA
          //**********************************************************************//
          if dm_rc.FDQryoperacoes.FindField('OPERACAO_OP').AsString = 'Venda EF' then
            EntregaFuturaCRUD('inclui');
          //**********************************************************************//

          //**********************************************************************//
          // GRAVA TABELA SEMENTES - LOTE ENTRADA
          //**********************************************************************//
          gravalotesementeorigem('grava');

          //**********************************************************************//
          // PONTOS
          //**********************************************************************//
          TabelaOperacao('select estoque from operacoes where codigo = ' + IntToStr(memprodutos.FindField('OPERACAO').AsInteger));

          DM_RC.fdqrypontos.Append;
          DM_RC.fdqrypontos.FindField('EMPRESA').AsInteger     := MM.varI_Code_Company;
          DM_RC.fdqrypontos.FindField('DOCUMENTO').AsInteger   := sqlMaster.FindField('DOCUMENTO').AsInteger;
          DM_RC.fdqrypontos.FindField('SAFRA').AsInteger       := 0;
          DM_RC.fdqrypontos.FindField('SEQUENCIA').AsInteger   := memprodutos.RecNo;
          DM_RC.fdqrypontos.FindField('NUMERO').AsInteger      := sqlMaster.FindField('NUMERO').AsInteger;
          DM_RC.fdqrypontos.FindField('SERIE').AsString        := sqlMaster.FindField('SERIE').AsString;
          DM_RC.fdqrypontos.FindField('UF').AsString           := FDQrypessoas.FindField('ESTADO').AsString;
          DM_RC.fdqrypontos.FindField('PESSOA').AsInteger      := sqlMaster.FindField('PESSOA').AsInteger;
          DM_RC.fdqrypontos.FindField('DATA').AsDateTime       := sqlMaster.FindField('EMISSAO').AsDateTime;

          DM_RC.fdqrypontos.FindField('OPERACAO').AsInteger    := memprodutos.FindField('OPERACAO').AsInteger;
          DM_RC.fdqrypontos.FindField('PRODUTO').AsInteger     := memprodutos.FindField('PRODUTO').AsInteger;
          DM_RC.fdqrypontos.FindField('DESCRICAO').AsString    := memprodutos.FindField('DESCRICAO').AsString;
          DM_RC.fdqrypontos.FindField('CANCELADA').AsString    := memprodutos.FindField('CANCELADA').AsString;

          DM_RC.fdqrypontos.FindField('CATEGORIA').AsString    := memprodutos.FindField('CATEGORIA').AsString;
          DM_RC.fdqrypontos.FindField('CAMPO').AsString        := memprodutos.FindField('CAMPO').AsString;
          DM_RC.fdqrypontos.FindField('SAFRACAMPO').AsString   := memprodutos.FindField('SAFRACAMPO').AsString;
          DM_RC.fdqrypontos.FindField('BOLETIM').AsString      := memprodutos.FindField('BOLETIMSEMENTE').AsString;
          DM_RC.fdqrypontos.FindField('TERMO').AsString        := memprodutos.FindField('TERMOSEMENTE').AsString;
          DM_RC.fdqrypontos.FindField('COOPERANTE').AsInteger  := memprodutos.FindField('COOPERANTE').AsInteger;
          DM_RC.fdqrypontos.FindField('GERMINACAO').AsFloat    := memprodutos.FindField('GERMINACAO').AsFloat;
          DM_RC.fdqrypontos.FindField('LOTEENTRADA').AsString  := memprodutos.FindField('LOTEENTRADA').AsString;
          DM_RC.fdqrypontos.FindField('PESOSACO').AsFloat      := memprodutos.FindField('PESOSACO').AsFloat;
          DM_RC.fdqrypontos.FindField('VALORCULTURAL').AsFloat := memprodutos.FindField('VALORCULTURAL').AsFloat;

          DM_RC.fdqrypontos.FindField('QUANTIDADE').AsFloat    := memprodutos.FindField('QUANTIDADE').AsFloat;
          DM_RC.fdqrypontos.FindField('PUREZA').AsFloat        := memprodutos.FindField('PUREZA').AsFloat;
          DM_RC.fdqrypontos.FindField('PONTOS').AsFloat        := memprodutos.FindField('QUANTIDADE').AsFloat * memprodutos.FindField('PUREZA').AsFloat;
          DM_RC.fdqrypontos.FindField('TIPO').AsString         := variif(dm_rc.FDQryoperacoes.FindField('ESTOQUE').AsString = '2', 'NULO', variif(dm_rc.FDQryoperacoes.FindField('ESTOQUE').AsString = '1', 'SAIDA', 'ENTRADA'));
          DM_RC.fdqrypontos.FindField('SAFRAVALIDA').AsString  := memprodutos.FindField('SAFRAVALIDA').AsString;
          DM_RC.fdqrypontos.Findfield('QTEPESO').AsFloat       := memprodutos.FindField('QUANTIDADE').AsFloat * memprodutos.FindField('PESOSACO').AsFloat;

          DM_RC.fdqrypontos.FindField('LOTESEMENTE').AsString  := memprodutos.FindField('LOTESEMENTE').AsString;
          DM_RC.fdqrypontos.FindField('CODIGO').AsInteger      := Ultimo_Codigo('PONTOS','CODIGO',False);
          DM_RC.fdqrypontos.FindField('KEY').AsString          := Gera_Guid();
          DM_RC.fdqrypontos.Post;

          //**********************************************************************//
          if memprodutos.FindField('CODVEF').AsInteger <> 0 then
            CalculaSaldoEF(memprodutos.FindField('CODVEF').AsInteger);
          //**********************************************************************//

          if memprodutos.FindField('LOTESEMENTE').AsString <> '' then
            begin
              Calcula_Lote(mm.varI_Code_Company,memprodutos.FindField('PRODUTO').AsInteger,
                           memprodutos.FindField('LOTESEMENTE').AsString,
                           memprodutos.FindField('BOLETIMSEMENTE').AsString,
                           memprodutos.FindField('TERMOSEMENTE').AsString,
                           '');
            end;

          Saldo_Beneficiamento('GRAVA',sqlMaster.FindField('SERIE').AsString,
                                        sqlMaster.FindField('NUMERO').AsInteger,
                               DM_RC.fdqrypontos.FindField('PRODUTO').AsInteger,
                               DM_RC.fdqrypontos.FindField('SEQUENCIA').AsInteger,
                               mm.varI_Code_Company);

        end;
      memprodutos.Next;
    end;
  memprodutos.First;
  memprodutos.EnableControls;

  TabelaOperacao('select * from operacoes where codigo =  ' + QuotedStr(sqlMaster.FindField('OPERACAO').AsString));
  tbtitulos.DisableControls;
  tbtitulos.First;
  while not tbtitulos.Eof do
    begin
      dm_rc.fdqrytitulos.UpdateOptions.UpdateTableName := variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'RECEBER','PAGAR');

      dm_rc.fdqrytitulos.Append;
      dm_rc.fdqrytitulos.FindField('NUMERO').AsInteger       := sqlMaster.FindField('NUMERO').AsInteger;
      dm_rc.fdqrytitulos.FindField('DOCUMENTO').AsInteger    := sqlMaster.FindField('DOCUMENTO').AsInteger;
      dm_rc.fdqrytitulos.FindField('SERIE').AsString         := sqlMaster.FindField('SERIE').AsString;
      dm_rc.fdqrytitulos.FindField('PESSOA').AsInteger       := sqlMaster.FindField('PESSOA').AsInteger;
      dm_rc.fdqrytitulos.FindField('EMISSAO').AsDateTime     := sqlMaster.FindField('EMISSAO').AsDateTime;

      dm_rc.fdqrytitulos.FindField('SEQUENCIA').AsInteger    := tbtitulos.FindField('PARCELA').AsInteger;
      dm_rc.fdqrytitulos.FindField('VENCIMENTO').AsDateTime  := tbtitulos.FindField('VENCIMENTO').AsDateTime;
      dm_rc.fdqrytitulos.FindField('VALORATUAL').AsFloat     := tbtitulos.FindField('VALOR').AsFloat;
      dm_rc.fdqrytitulos.FindField('VALORORIGINAL').AsFloat  := tbtitulos.FindField('VALOR').AsFloat;
      dm_rc.fdqrytitulos.FindField('CONFIRMABOLETO').AsString:= 'F';
      dm_rc.fdqrytitulos.FindField('SITUACAO').AsString      := 'Aberto';

      dm_rc.fdqrytitulos.FindField('LOGINCLUSAO').AsString   := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);

      dm_rc.fdqrytitulos.FindField('FINANCEIRO').AsInteger   := dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger;
      dm_rc.fdqrytitulos.FindField('FUNCIONARIO').AsInteger  := sqlMaster.FindField('FUNCIONARIO').AsInteger;
      dm_rc.fdqrytitulos.FindField('EMPRESA').AsInteger      := mm.varI_Code_Company;

      dm_rc.fdqrytitulos.FindField('APLICACAO').AsInteger    := 0;
      dm_rc.fdqrytitulos.FindField('PLANOCONTAS').AsInteger  := 0;
      dm_rc.fdqrytitulos.FindField('CARTEIRA').AsInteger     := 00001;
      dm_rc.fdqrytitulos.FindField('PORTADOR').AsInteger     := 9999;


      if dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1 then
        begin
          dm_rc.fdqrytitulos.FindField('NUMEROPEDIDO').AsString  := sqlMaster.FindField('NUMEROPEDIDO').AsString;
          dm_rc.fdqrytitulos.FindField('PEDIDO').AsString      := sqlMaster.FindField('PEDIDO').AsString;
          dm_rc.fdqrytitulos.FindField('PERCCOMISSAO').AsFloat := sqlMaster.FindField('COMISSAOFUNCIONARIO').AsFloat;
        end;

      dm_rc.fdqrytitulos.FindField('VALORDESCONTOS').AsFloat := 0;
      dm_rc.fdqrytitulos.FindField('VALORJUROS').AsFloat     := 0;
      dm_rc.fdqrytitulos.FindField('VALORTAXAS').AsFloat     := 0;
      dm_rc.fdqrytitulos.FindField('VALORPAGO').AsFloat      := 0;
      dm_rc.fdqrytitulos.FindField('VALORDIVERSOS').AsFloat  := 0;

      dm_rc.fdqrytitulos.FindField('KEY').AsString           := Gera_Guid();
      dm_rc.fdqrytitulos.FindField('CODIGO').AsInteger       := Ultimo_Codigo(variif(dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1,'RECEBER','PAGAR'),'CODIGO',False);
      dm_rc.fdqrytitulos.Post;

      tbtitulos.Next;
    end;

  tbtitulos.First;
  tbtitulos.EnableControls;

  //**********************************************************************//
  // GRAVA VENDEDORES
  //**********************************************************************//
  if DM_RC.tb_movimentovendedor.RecordCount > 0 then
    begin
      executasql('delete from movimento_comissao where numero  = ' + IntToStr(sqlMaster.FindField('NUMERO').AsInteger)    +
                 '                               and documento = ' + IntToStr(sqlMaster.FindField('DOCUMENTO').AsInteger) +
                 '                               and empresa   = ' + IntToStr(mm.varI_Code_Company));

      TabelaMovimentoComissao('SELECT * FROM MOVIMENTO_COMISSAO WHERE CODIGO = 0');
      DM_RC.tb_movimentovendedor.First;
      while not DM_RC.tb_movimentovendedor.Eof do
        begin
          dm_rc.fdqrymovcomissao.Append;
          dm_rc.fdqrymovcomissao.FindField('KEY').AsString             := Gera_Guid();
          dm_rc.fdqrymovcomissao.FindField('CODIGO').AsInteger         := Ultimo_Codigo('MOVIMENTO_COMISSAO','CODIGO',True);
          dm_rc.fdqrymovcomissao.FindField('SEQUENCIA').AsInteger      := DM_RC.tb_movimentovendedor.RecNo;
          dm_rc.fdqrymovcomissao.FindField('EMPRESA').AsInteger        := mm.varI_Code_Company;
          dm_rc.fdqrymovcomissao.FindField('DOCUMENTO').AsInteger      := sqlMaster.FindField('DOCUMENTO').AsInteger;
          dm_rc.fdqrymovcomissao.FindField('NUMERO').AsInteger         := sqlMaster.FindField('NUMERO').AsInteger;
          dm_rc.fdqrymovcomissao.FindField('FUNCIONARIO').AsInteger    := DM_RC.tb_movimentovendedor.FindField('FUNCIONARIO').AsInteger;
          dm_rc.fdqrymovcomissao.FindField('PERCCOMISSAO').AsFloat     := DM_RC.tb_movimentovendedor.FindField('COMISSAO').AsFloat;
          dm_rc.fdqrymovcomissao.FindField('EMISSAO').AsDateTime       := sqlMaster.FindField('EMISSAO').AsDateTime;
          dm_rc.fdqrymovcomissao.Post;

          DM_RC.tb_movimentovendedor.Next;
        end;
    end;
  //**********************************************************************//

  UniDBGridprodutos.Options          := UniDBGridprodutos.Options - [dgEditing];

end;

procedure TfrmNOTAELETRONICA.HabilitaMenuAdiiconais(tipo: Boolean);
begin
  if tipo = False then
    begin
      I1.Enabled := True; //importar documento
      I2.Enabled := True; //imposto diferenciado
      E1.Enabled := False; //envio eletronico
    end;

  if tipo = True then
    begin
      I1.Enabled := False; //importar documento
      I2.Enabled := False; //imposto diferenciado
      E1.Enabled := True; //envio eletronico
    end;
end;

procedure TfrmNOTAELETRONICA.I1Click(Sender: TObject);
begin
  frmTransfereImportacao.ShowModal();
  if mm.varI_Code_Documento_Controle <> 0 then
    begin
      CarregaImportacao(mm.varI_Code_Documento_Controle);
      Calcula_Totais;
      Calcula_Icms('');
      SetBut(tpCalcular);
    end;
end;

procedure TfrmNOTAELETRONICA.I2Click(Sender: TObject);
begin
  dm_rc.memprodutos.Close;
  dm_rc.memprodutos.CopyDataSet(memprodutos);

  mm.VarC_Atelagenerica            := 'CALCULAICMS';
  frmTELAGENERICA.ShowModal();

  memprodutos.DisableControls;
  memprodutos.AfterDelete  := nil;
  memprodutos.AfterPost    := nil;
  memprodutos.BeforePost   := nil;
  memprodutos.BeforeDelete := nil;
  memprodutos.Close;
  memprodutos.Open;

  dm_rc.memprodutos.First;
  while not dm_rc.memprodutos.eof do
    begin
      if dm_rc.memprodutos.FindField('PRODUTO').AsInteger > 0 then
        begin
          memprodutos.Append;
          memprodutos.CopyRecord(dm_rc.memprodutos);
          memprodutos.Post;
        end;
      dm_rc.memprodutos.Next;
    end;

  dm_rc.memprodutos.Close;

  UniDBFormattedNumberEdit2.Value := mm.varR_Value_BASEICMS;
  UniDBFormattedNumberEdit3.Value := mm.varR_Value_VALORICMS;

  memprodutos.First;
  memprodutos.AfterDelete  := memprodutosAfterDelete;
  memprodutos.AfterPost    := memprodutosAfterPost;
  memprodutos.BeforeDelete := memprodutosBeforeDelete;
  memprodutos.BeforePost   := memprodutosBeforePost;
  memprodutos.EnableControls;
  memprodutos.First;
end;

procedure TfrmNOTAELETRONICA.L1Click(Sender: TObject);
begin
  mm.varI_Code_Documento_Controle := sqlSearchMaster.FindField('CODIGO').AsInteger;
  mm.VarC_Atelagenerica           := 'LOGNOTAELETRONICA';
  frmTELAGENERICA.ShowModal();
end;

procedure TfrmNOTAELETRONICA.LimpaVars;
begin
//  UniEditdescricaocondicao.Text := '';
//  UniEditnomevendedor.Text      := '';
 // UniEditnome.Text              := '';
  UniEditcpfcnpj.Text           := '';
  UniEditinscricao.Text         := '';
  UniEditrenasem.Text           := '';
  UniComboBoxparaop.Clear;
end;

procedure TfrmNOTAELETRONICA.MemoGravaLog;
var
  i         : integer;
begin
  UniMemolog.Clear;
  SqlPesquisa('select * from mvmestre, pessoas where mvmestre.codigo = ' + IntToStr(sqlMaster.FindField('CODIGO').AsInteger) +
              ' and mvmestre.pessoa = pessoas.codigo');

  UniMemolog.Lines.Add(DataSetToJsonTXT(dm_rc.sqlBuscas));

  SqlPesquisa('select * from mvitens where mvitens.numero = ' + IntToStr(sqlMaster.FindField('NUMERO').AsInteger)   +
              ' and mvitens.documento                     = ' + IntToStr(sqlMaster.FindField('DOCUMENTO').AsInteger)+
              ' and mvitens.empresa                       = ' + IntToStr(mm.varI_Code_Company)                     +
              ' order by mvitens.sequencia');

  UniMemolog.Lines.Add(DataSetToJsonTXT(dm_rc.sqlBuscas));

end;

procedure TfrmNOTAELETRONICA.memprodutosAfterDelete(DataSet: TDataSet);
begin
  inherited;
  Calcula_Totais();
end;

procedure TfrmNOTAELETRONICA.memprodutosAfterPost(DataSet: TDataSet);
begin
  inherited;
  Calcula_Totais();
end;

procedure TfrmNOTAELETRONICA.memprodutosBeforeDelete(DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TfrmNOTAELETRONICA.memprodutosBeforePost(DataSet: TDataSet);
begin
  inherited;
  gravamemoria();
end;

procedure TfrmNOTAELETRONICA.memprodutosbuscaloteGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
    Text :=
    '<i title="Lote" class="fa fa-lg fas fa-search-plus fa-lg" style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmNOTAELETRONICA.memprodutosbuscaprodutoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin

    Text :=
    '<i title="Produtos" class="fa fa-lg fas fa-search fa-lg" style="color:blue; cursor:pointer;"></i>';

//        '<i title="Produtos" class="fa fa-lg fas fa-search-plus fa-lg" style="color:blue; cursor:pointer;"></i>';

end;

procedure TfrmNOTAELETRONICA.memprodutosexcluiGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Excluir" class="fa fa-lg fa-trash fa-lg" style="color:red; cursor:pointer;"></i>';
end;

procedure TfrmNOTAELETRONICA.memprodutosopcoesGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin

  if DisplayText then
    Text :=
      '<i title="Produtos" class="fas fa-search-plus" ' +
      'style="color:blue; cursor:pointer;"></i>'
  else
    Text := '';

end;

procedure TfrmNOTAELETRONICA.Parametrocfoppessoa;
begin
{
  SqlPesquisa   ('select descricao, op_interna, op_externa from PARAMETROSOPERACAO where descricao = ' + QuotedStr(UniComboBoxparaop.Text));
  TabelaEmpresas('select *     from empresas where codigo                                          = ' + IntToStr(mm.varI_Code_Company));

  sqlMaster.Edit;
  if FDQrypessoas.FindField('ESTADO').AsString = dm_rc.tbempresas.FindField('UF').AsString then
    sqlMaster.FindField('OPERACAO').AsInteger := dm_rc.sqlBuscas.FindField('OP_INTERNA').AsInteger
  else
    if FDQrypessoas.FindField('ESTADO').AsString = 'EX' then
      sqlMaster.FindField('OPERACAO').AsInteger := 7102
    else
      sqlMaster.FindField('OPERACAO').AsInteger := dm_rc.sqlBuscas.FindField('OP_EXTERNA').AsInteger;
  }

end;

PROcedure TfrmNOTAELETRONICA.ReleituraProdutoscfop;
begin
  memprodutos.DisableControls;
  memprodutos.AfterDelete  := nil;
  memprodutos.AfterPost    := nil;
  memprodutos.BeforePost   := nil;
  memprodutos.BeforeDelete := nil;

  memprodutos.First;
  while not memprodutos.Eof do
    begin
      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
        begin
          memprodutos.Edit;
          ValidaInfoProdutoMemoria(sqlMaster.FindField('OPERACAO').AsFloat,
                                   memprodutos.FindField('PRODUTO').AsInteger,
                                   MM.varI_Code_Company);
          memprodutos.Post;
        end;

      memprodutos.Next;
    end;

  memprodutos.First;
  memprodutos.AfterDelete  := memprodutosAfterDelete;
  memprodutos.AfterPost    := memprodutosAfterPost;
  memprodutos.BeforeDelete := memprodutosBeforeDelete;
  memprodutos.BeforePost   := memprodutosBeforePost;
  memprodutos.EnableControls;
  memprodutos.First;
end;

procedure TfrmNOTAELETRONICA.SetBut(Acao: TAcaoCrud);
var
  Editando, TemNota: Boolean;
begin
  // The base datasource controls the standard CRUD buttons.
  Editando := sqlMaster.State in [dsInsert, dsEdit];
  TemNota := sqlMaster.Active and not sqlMaster.IsEmpty;

  btnCalcReg.Visible := Editando;
  btnCalcReg.Enabled := Editando;

  btntransp.Visible := Editando; // TemNota;
  btntransp.Enabled := Editando; // TemNota;

  btnOptions.Enabled := TemNota;

  btnvendedor.Visible := Acao in [tpIncluir, tpAlterar, tpExcluir, tpListacomRegistros];

//  AjustaBtnVendedor; //reancora o btnvendedor na barra a cada mudanca de estado
end;

procedure TfrmNOTAELETRONICA.UniButtonDbEditcodigocondicaomestreButtonClick(
  Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('CONDICOES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       Self.sqlMaster.Edit;
       Self.sqlMaster.FindField('CONDICAO').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmNOTAELETRONICA.UniButtonDbEditcodigocondicaomestreExit(
  Sender: TObject);
begin
  inherited;
  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
//    UniEditdescricaocondicao.Text      := Acha_Item('CONDICOES',sqlMaster.FindField('CONDICAO').AsString);
end;

procedure TfrmNOTAELETRONICA.UniButtonDbEditcodigofuncionariomestreExit(
  Sender: TObject);
begin
  inherited;
//ELIMINAR
  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    begin
    //  if SqlPesquisa('SELECT NOME, COMISSAO FROM FUNCIONARIOS WHERE CODIGO = ' + QuotedStr(UniButtonDbEditcodigofuncionariomestre.Text)) then
   //     begin
   //       sqlMaster.FindField('COMISSAOFUNCIONARIO').AsFloat := dm_rc.sqlBuscas.FindField('COMISSAO').AsFloat;
   //     end;
    end;
end;

procedure TfrmNOTAELETRONICA.UniButtonDbEditcodigopessoasButtonClick(
  Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('PESSOAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       Self.sqlMaster.Edit;
       Self.sqlMaster.FindField('PESSOA').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmNOTAELETRONICA.UniButtonDbEditcodigopessoasExit(Sender: TObject);
var
i:integer;
Cmp:String;
begin
  inherited;
  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    begin
      if (sqlMaster.FindField('PESSOA').AsString <> '') then
        begin
          if SqlPesquisa('SELECT * FROM PESSOAS WHERE CODIGO = ' + QuotedStr(sqlMaster.FindField('PESSOA').AsString)) then
            begin
//              UniEditnome.Text         := dm_rc.sqlBuscas.FindField('NOME').AsString;
              UniEditcpfcnpj.Text      := dm_rc.sqlBuscas.FindField('CPFCNPJ').AsString;
              UniEditinscricao.Text    := dm_rc.sqlBuscas.FindField('INSCRICAO').AsString;
              UniEditrenasem.Text      := dm_rc.sqlBuscas.FindField('RENASEM').AsString;

              FDQrypessoas.Close ;
              for i := 0 to  FDQrypessoas.Params.Count - 1 do
              begin
                Cmp :=  FDQrypessoas.Params[i].Name;
                 FDQrypessoas.Params[i].Value :=  sqlMaster.FieldbyName(Cmp).Value;
              end;
               FDQrypessoas.Open;
            end;
        end
        else
          begin
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Coloque uma Pessoa!' , 'warning');
          end;
    end;
end;

procedure TfrmNOTAELETRONICA.UniButtonDbEditTRANSPORTADORAButtonClick(
  Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('TRANSPORTES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       Self.sqlMaster.Edit;
       Self.sqlMaster.FindField('TRANSPORTADORA').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmNOTAELETRONICA.UniDBFormattedNumberEditdescontosExit(
  Sender: TObject);
begin
  inherited;
  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    Calcula_Totais;
end;

procedure TfrmNOTAELETRONICA.UniDBFormattedNumberEditvlrdespesasExit(
  Sender: TObject);
begin
  inherited;
  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    Calcula_Totais;
end;

procedure TfrmNOTAELETRONICA.PesquisarProdutoGrid;
var
  RegistroItem, LinhaGrid: Integer;
begin
  if FPesquisaProdutoAberta or
     not (sqlMaster.State in [dsInsert, dsEdit]) or
     not memprodutos.Active or memprodutos.IsEmpty then Exit;

  RegistroItem := memprodutos.RecNo;
  LinhaGrid := UniDBGridprodutos.CurrRow;
  FPesquisaProdutoAberta := True;
  try
    PesquisarCadastro('PRODUTOS',
      procedure(const Codigo: string; Selecionou: Boolean)
      var I: Integer;
      begin
        FPesquisaProdutoAberta := False;
        if not Selecionou then Exit;
        if not (sqlMaster.State in [dsInsert, dsEdit]) or
           not memprodutos.Active or memprodutos.IsEmpty then Exit;
        if memprodutos.RecNo <> RegistroItem then
        begin
          dm_rc.rc_ShowSweetAlert('ATENCAO',
            'O item mudou durante a pesquisa. Selecione o produto novamente.', 'warning');
          Exit;
        end;

        carregaprodutos(Codigo);
        UniDBGridprodutos.SetFocus;
        for I := 0 to UniDBGridprodutos.Columns.Count - 1 do
          if SameText(UniDBGridprodutos.Columns[I].FieldName, 'LOTESEMENTE') then
          begin
            UniDBGridprodutos.CurrRow := LinhaGrid;
            UniDBGridprodutos.CurrCol := I;
            TNotaGridAccess(UniDBGridprodutos).StartEditor(LinhaGrid, I);
            Break;
          end;
      end);
  except
    FPesquisaProdutoAberta := False;
    raise;
  end;
end;

{
procedure TfrmNOTAELETRONICA.PesquisarProdutoGrid;
var
  Pesquisa: TfrmLookUp;
  RegistroItem, LinhaGrid: Integer;
begin
  if FPesquisaProdutoAberta or
     not (sqlMaster.State in [dsInsert, dsEdit]) or
     not memprodutos.Active or memprodutos.IsEmpty then Exit;


  RegistroItem := memprodutos.RecNo;
  LinhaGrid := UniDBGridprodutos.CurrRow;
  FPesquisaProdutoAberta := True;
  try
    // Mesma janela padrao utilizada pelo lookup de Pessoas.
    // O retorno e aplicado a memprodutos pela rotina ja existente da nota.
    Pesquisa := frmLookUp;
    Pesquisa.Caption := 'Pesquisa de Produtos';
    Pesquisa.ed_Lkp.Hint := '[[ searchall ]]';
    Pesquisa.btnLkpSearch.Tag := 0;
    Pesquisa.dbgSearchCRUDLookUp.Tag := 0;
    Pesquisa.dbgSearchCRUDLookUp.Hint :=
      '[[fieldmasks:grid-resize|grid-paginator:center|]]';


    mm.varI_FrmLookUpTag := 0;
    mm.varC_Field_PK := 'CODIGO';
    mm.varC_Search_Fields := 'DESCRICAO;CODIGO';
    mm.varC_Lookup_Code := '_ESC_';
    mm.varC_SelectedItem_LookUp := '';
    mm.varC_TempLink := '';
    mm.varC_Where := '';
    mm.varC_WhereExtra := '';
    mm.varC_Order := ' ORDER BY tab.DESCRICAO';
    // Conserva o filtro da pesquisa antiga: saldo da empresa atual.
    // A consulta externa evita campos ambiguos ao pesquisar por codigo.
    mm.varC_SQL_Default_LookUps :=
      ' SELECT tab.DESCRICAO, tab.VENDA, tab.CODIGO FROM (' +
      ' SELECT P.DESCRICAO, S.VENDA, P.CODIGO FROM ' +
      dm_rc.rc_DBSchema + 'PRODUTOS P INNER JOIN ' +
      dm_rc.rc_DBSchema + 'SALDOS S ON S.PRODUTO = P.CODIGO' +
      ' WHERE S.EMPRESA = ' + IntToStr(mm.varI_Code_Company) + ') tab';

    Pesquisa.ShowModal(
      procedure(Sender: TComponent; AResult: Integer)
      var
        Codigo: string;
        I: Integer;
      begin
        Codigo := mm.varC_Lookup_Code;
        // frmLookUp usa Close e varC_Lookup_Code; nao retorna mrOK.
        FPesquisaProdutoAberta := False;
        mm.varC_Where := '';
        mm.varC_WhereExtra := '';
        mm.varC_Order := '';
        mm.varC_Search_Fields := '';
        mm.varC_Lookup_Code := '';
        mm.varC_SelectedItem_LookUp := '';
        if (Codigo = '') or (Codigo = '_ESC_') then Exit;
        if not (sqlMaster.State in [dsInsert, dsEdit]) or
           not memprodutos.Active or memprodutos.IsEmpty then Exit;
        if memprodutos.RecNo <> RegistroItem then
        begin
          dm_rc.rc_ShowSweetAlert('ATENCAO',
            'O item mudou durante a pesquisa. Selecione o produto novamente.', 'warning');
          Exit;
        end;

        carregaprodutos(Codigo);
        // Sincroniza linha, coluna e editor depois do fechamento da pesquisa.
        // SetFocus sozinho apenas seleciona a celula, sem iniciar a edicao.
        UniDBGridprodutos.SetFocus;
        for I := 0 to UniDBGridprodutos.Columns.Count - 1 do
          if SameText(UniDBGridprodutos.Columns[I].FieldName, 'LOTESEMENTE') then
          begin
            UniDBGridprodutos.CurrRow := LinhaGrid;
            UniDBGridprodutos.CurrCol := I;
            TNotaGridAccess(UniDBGridprodutos).StartEditor(LinhaGrid, I);
            Break;
          end;
      end);
  except
    FPesquisaProdutoAberta := False;
    mm.varC_Where := '';
    mm.varC_WhereExtra := '';
    mm.varC_Order := '';
    mm.varC_Search_Fields := '';
    mm.varC_Lookup_Code := '';
    raise;
  end;
end;

}

procedure TfrmNOTAELETRONICA.UniDBGridprodutosCellClick(
  Column: TUniDBGridColumn);
  var Linha, Coluna, RegistroLote, ProdutoLote: Integer;
begin
   Linha  := TStringGrid(UniDBGridprodutos).Row;
   Coluna := UniDBGridprodutos.CurrCol;

  if sqlMaster.State in [dsInsert,dsEdit] then
    begin
      if Column.FieldName = 'opcoes' then
        begin
          UniPopupMenuopcaoprodutos.Popup(posicao_x-12,posicao_y, UniDBGridprodutos);
        end;

      if Column.FieldName = 'exclui' then
        begin
          dm_rc.rc_ShowYesNo( 'DESEJA REALMENTE EXCLUIR ESSE REGISTRO?' );
          if mm.varB_Yes then
            begin
              memprodutos.Delete;
            end
        end;


      if Column.FieldName = 'buscaproduto' then
        PesquisarProdutoGrid;

      if Column.FieldName = 'buscalote' then
        begin
          RegistroLote := memprodutos.RecNo;
          ProdutoLote := memprodutos.FieldByName('PRODUTO').AsInteger;
          MM.varC_referencia_produto := IntToStr(ProdutoLote);
          mm.varC_codigo_busca_lote := memprodutos.FieldByName('LOTESEMENTE').AsString;
          mm.VarC_Atelagenerica := 'CONTROLEPONTOS';
          frmTELAGENERICA.ShowModal(
            procedure(Sender: TComponent; AResult: Integer)
            begin
              try
                if (AResult = mrOK) and memprodutos.Active and
                   (sqlMaster.State in [dsInsert, dsEdit]) then
                  if (memprodutos.RecNo = RegistroLote) and
                     (memprodutos.FieldByName('PRODUTO').AsInteger = ProdutoLote) then
                  begin
                    memprodutos.Edit;
                    carregalote(mm.varC_codigo_busca_lote, ProdutoLote);
                  end;
              finally
                mm.varC_referencia_produto := '';
              end;
            end);
        end;

    end;
end;

procedure TfrmNOTAELETRONICA.UniFrameCreate(Sender: TObject);
begin
  FNotaPronta := False;
  FCarregandoNota := False;
  varC_Documento_MvmestreNFE := 1;
  mm.varC_Table_Search := 'mvmestre';
  mm.varC_PK_MasterTable := 'CODIGO';
  sqlMaster.Close;

  sqlMaster.SQL.Text :=
    ' SELECT tab.* FROM MVMESTRE tab ' +
    ' WHERE tab.[[pk]] = :table_pk ' +
    ' AND tab.EMPRESA = ' + IntToStr(mm.varI_Code_Company) +
    ' AND tab.DOCUMENTO = 1 ' +
    ' [grid] SELECT '    +
    ' tab."KEY", tab.EMPRESA, tab.DOCUMENTO, tab.CODIGO, ' +
    ' tab.NUMERO, tab.EMISSAO, tab.SERIE, tab.CANCELADA, tab.PESSOA, ' +
    ' p.CIDADE, p.ESTADO, p.NOME, tab.CODIGOBARRAS, tab.VLRTOTAL ' +
    ' FROM MVMESTRE tab LEFT JOIN PESSOAS p ON p.CODIGO = tab.PESSOA ';


  ed_Where_Search.Text := 'tab.EMPRESA = ' + IntToStr(mm.varI_Code_Company) + ' AND tab.DOCUMENTO = 1';
  ed_Order_Search.Text := 'tab.NUMERO';

//  dbgSearchCRUD.Hint := '[[fieldmasks:grid-resize|grid-paginator:center|]]';

    dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:'+
                        'model-crud:2|'+
                        'info-state:off|' +
                        'grid-paginator:center|' +
                        'codigo[[titlealign:c|align:c]];' +
                        ']]';



                        //                        'model-crud:0(btns-cls:colorful)|'+
//                        'grid-paginator:center|' +
  //                      ']]';




  dm_rc.rc_FillSearchFieldsCRUD(Self, cbxSearchCRUDFieldDate.Name, 'tab.EMISSAO', 'EMISSAO');
  inherited;
  // Fiscal numbering remains in the existing save routine.
  ed_NoGenID.Text := 'true';
  ed_GenNextID_OnNew.Text := 'false';
  dm_rc.rc_FillSearchFieldsCRUD(Self, cbxSearchCRUDField1.Name,'tab.NUMERO', 'NUMERO');
  dm_rc.rc_FillSearchFieldsCRUD(Self, cbxSearchCRUDField1.Name,'p.NOME', 'PESSOA');
  dm_rc.rc_FillSearchFieldsCRUD(Self, cbxSearchCRUDField1.Name,'tab.PESSOA', 'CODIGO DA PESSOA');
  dm_rc.rc_FillSearchFieldsCRUD(Self, cbxSearchCRUDField1.Name,'tab.SERIE', 'SERIE');
  dm_rc.rc_FillSearchFieldsCRUD(Self, cbxSearchCRUDField1.Name,'tab.CANCELADA', 'SITUACAO (A/C)');

  UniPageControlnota.ActivePage := UniTabSheetgeral;
  UniPageControlprodutos.ActivePage := UniTabSheetProdutos;
  labTitleForm.Caption := 'NOTA ELETRÔNICA';
  FNotaPronta := True;
  btnSearchCRUDClick(Self);
  UniDBGridprodutos.Options :=   (UniDBGridprodutos.Options + [dgEditing]) - [dgRowSelect];
  UniDBGridprodutos.ClicksToEdit := 1;
  UniDBGridprodutos.TabKeyBehavior := tkNextColumn;
  btntransp.Visible := false;
  btnCalcReg.Visible := false;
  SetBut(tpListacomRegistros);
end;

procedure TfrmNOTAELETRONICA.sqlMasterAfterOpen(DataSet: TDataSet);
begin
  if not FNotaPronta or FCarregandoNota or DataSet.IsEmpty then Exit;
  FCarregandoNota := True;
  try
    FDQrypessoas.Close;
    FDQrypessoas.ParamByName('PESSOA').AsInteger :=
      sqlMaster.FieldByName('PESSOA').AsInteger;
    FDQrypessoas.Open;
    carregadados;
  finally
    FCarregandoNota := False;
  end;
end;

procedure TfrmNOTAELETRONICA.sqlMasterCANCELADAGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if FDQryFiltroCANCELADA.AsString = 'A' then
        Text := '<span class="badge badge-success">Homologada</span>'
      else
      if FDQryFiltroCANCELADA.AsString = 'D' then
        Text := '<span class="badge badge-danger">Denegada</span>'
      else
      if FDQryFiltroCANCELADA.AsString = 'C' then
        Text := '<span class="badge badge-danger">Cancelada</span>'
      else
      if FDQryFiltroCANCELADA.AsString = 'I' then
        Text := '<span class="badge badge-primary">Inutilizada</span>'
      else
        Text := '<span class="badge badge-warning">Aguarde</span>';
    end;

end;

procedure TfrmNOTAELETRONICA.dsMasterStateChange(Sender: TObject);
begin
  inherited;
  if FNotaPronta then SetBut(tpListacomRegistros);
end;

procedure TfrmNOTAELETRONICA.UniMenuItem1Click(Sender: TObject);
begin
  inherited;
  mm.varI_Code_Documento_Controle  := sqlSearchMaster.FindField('CODIGO').AsInteger;
  mm.VarC_Atelagenerica            := 'ALTERADETALHESNOTA';
  frmTELAGENERICA.ShowModal();
end;

procedure TfrmNOTAELETRONICA.ValidaInfoProdutoMemoria(foperacao:real; fproduto,fempresa: integer);
begin
  TabelaOperacao('SELECT SUBSTITUICAO,CODIGO,UNICA FROM OPERACOES WHERE CODIGO  = ' + QuotedStr(FloatToStr(foperacao)));
  TabelaEmpresas('SELECT * FROM EMPRESAS WHERE CODIGO                          = ' + IntToStr(fempresa));
  SqlProdutos   ('SELECT SITUACAOLOCAL,SITUACAOOUTRAS FROM SALDOS WHERE PRODUTO = ' + IntToStr(fproduto)+
                'AND EMPRESA                                                    = ' + IntToStr(fempresa));

  if UniDBEditestado.Text = dm_rc.tbempresas.FindField('UF').AsString then
   begin
     memprodutos.FindField('CST').AsString := dm_rc.tbprodutos.findfield('SITUACAOLOCAL').AsString;
     if memprodutos.FindField('CST').AsString = '060' then
       begin
         if  dm_rc.FDQryoperacoes.FindField('UNICA').AsFloat = 0 then
           begin
             if dm_rc.FDQryoperacoes.FindField('SUBSTITUICAO').AsInteger > 0 THEN
               memprodutos.FindField('OPERACAO').AsFloat  := dm_rc.FDQryoperacoes.FindField('SUBSTITUICAO').AsFloat
             else
               memprodutos.FindField('OPERACAO').AsFloat  := foperacao;
           end
         else
           memprodutos.FindField('OPERACAO').AsFloat  := foperacao;
       end
     else
       memprodutos.FindField('OPERACAO').AsFloat  := foperacao;
   end
  else
   begin
     memprodutos.FindField('CST').AsString := dm_rc.tbprodutos.findfield('SITUACAOOUTRAS').AsString;
     if memprodutos.FindField('CST').AsString = '060' then
       begin
         if  dm_rc.FDQryoperacoes.FindField('UNICA').AsInteger = 0 then
           begin
             if dm_rc.FDQryoperacoes.FindField('SUBSTITUICAO').AsInteger > 0 THEN
               memprodutos.FindField('OPERACAO').AsFloat  := dm_rc.FDQryoperacoes.FindField('SUBSTITUICAO').AsFloat
             else
               memprodutos.FindField('OPERACAO').AsFloat  := foperacao;
           end
         else
           memprodutos.FindField('OPERACAO').AsFloat  := foperacao;
       end
     else
       memprodutos.FindField('OPERACAO').AsFloat  := foperacao;

     if sqlMaster.FindField('OPERACAO').AsString = '7102' then
       begin
         memprodutos.FindField('CST').AsString := '041';
         if  dm_rc.FDQryoperacoes.FindField('UNICA').AsInteger = 0 then
           begin
             if dm_rc.FDQryoperacoes.FindField('SUBSTITUICAO').AsInteger > 0 THEN
               memprodutos.FindField('OPERACAO').AsFloat  := dm_rc.FDQryoperacoes.FindField('SUBSTITUICAO').AsFloat
             else
               memprodutos.FindField('OPERACAO').AsFloat  := foperacao;
           end
         else
           memprodutos.FindField('OPERACAO').AsFloat  := foperacao;
       end;
   end;

end;


//############################################################################//
// MÉTODOS RESTAURADOS DA VERSÃO 3.0 (preservação integral de recursos)
//############################################################################//

procedure TfrmNOTAELETRONICA.A2Click(Sender: TObject);
begin
  mm.varI_Code_Numero_Documento     :=  sqlSearchMaster.FindField('NUMERO').AsInteger;
  mm.varI_Code_Documento_Documento  :=  4;
  mm.varI_Code_documento_serie      :=  sqlSearchMaster.FindField('SERIE').AsString;
  mm.varI_Code_pessoa_cheque        :=  sqlSearchMaster.FindField('PESSOA').AsInteger;

  frmCADCHEQUESMOVIMENTO.ShowModal();
end;

procedure TfrmNOTAELETRONICA.AnexarItensEntregaPN;
begin
  ReanalisarItensEntregaPN();
  memprodutos.DisableControls;
  memprodutos.First;
  while not memprodutos.Eof do
    begin
      if memprodutos.FindField('PRODUTO').AsInteger > 0 then
        begin
          if TabelaMvitens(' select * from mvitens where empresa = ' + IntToStr(mm.varI_Code_Company)                       +
                           ' and produto                         = ' + IntToStr(memprodutos.FindField('PRODUTO').AsInteger) +
                           ' and sequencia                       = ' + IntToStr(memprodutos.RecNo)                          +
                           ' and numero                          = ' + IntToStr(sqlMaster.FindField('PEDIDO').AsInteger)    +
                           ' and documento                       = ' + IntToStr(sqlMaster.FindField('PEDIDO_DOCUMENTO').AsInteger)) then
          begin
            dm_rc.tbmvitens.Edit;
            dm_rc.tbmvitens.FindField('LOTESEMENTE').AsString    := memprodutos.FindField('LOTESEMENTE').AsString;
            dm_rc.tbmvitens.FindField('TERMOSEMENTE').AsString   := memprodutos.FindField('TERMOSEMENTE').AsString;
            dm_rc.tbmvitens.FindField('BOLETIMSEMENTE').AsString := memprodutos.FindField('BOLETIMSEMENTE').AsString;
            dm_rc.tbmvitens.FindField('PESOSACO').AsString       := memprodutos.FindField('PESOSACO').AsString;
            dm_rc.tbmvitens.Post;
          end;

          try
            TabelaEntregaProduto('select * from entrega_produto where codigo = 0');

            dm_rc.fdqryentregaproduto.Append;
            dm_rc.fdqryentregaproduto.FindField('KEY').AsString         := Gera_Guid;
            dm_rc.fdqryentregaproduto.FindField('CODIGO').AsInteger     := Ultimo_Codigo('ENTREGA_PRODUTO','CODIGO',True);
            dm_rc.fdqryentregaproduto.FindField('EMPRESA').AsInteger    := MM.varI_Code_Company;
            dm_rc.fdqryentregaproduto.FindField('SEQUENCIA').AsInteger  := memprodutos.RecNo;
            dm_rc.fdqryentregaproduto.FindField('NUMERO').AsInteger     := sqlMaster.FindField('PEDIDO').AsInteger;
            dm_rc.fdqryentregaproduto.FindField('DOCUMENTO').AsInteger  := sqlMaster.FindField('PEDIDO_DOCUMENTO').AsInteger;
            dm_rc.fdqryentregaproduto.FindField('PRODUTO').AsInteger    := memprodutos.FindField('PRODUTO').AsInteger;
            dm_rc.fdqryentregaproduto.FindField('DESCRICAO').AsString   := Acha_Item('PRODUTOS',IntToStr(memprodutos.FindField('PRODUTO').AsInteger));
            dm_rc.fdqryentregaproduto.FindField('EMISSAO').AsDateTime   := sqlMaster.FindField('EMISSAO').AsDateTime;
            dm_rc.fdqryentregaproduto.FindField('ENTREGUE').AsFloat     := memprodutos.FindField('QUANTIDADE').AsFloat;
            dm_rc.fdqryentregaproduto.FindField('LOTE').AsString        := memprodutos.FindField('LOTESEMENTE').AsString;
            dm_rc.fdqryentregaproduto.FindField('BOLETIM').AsString     := memprodutos.FindField('BOLETIMSEMENTE').AsString;
            dm_rc.fdqryentregaproduto.FindField('TERMO').AsString       := memprodutos.FindField('TERMOSEMENTE').AsString;
            dm_rc.fdqryentregaproduto.FindField('PESOSACO').AsString    := memprodutos.FindField('PESOSACO').AsString;
            dm_rc.fdqryentregaproduto.FindField('NOTA').AsString        := IntToStr(sqlMaster.FindField('NUMERO').AsInteger);
            dm_rc.fdqryentregaproduto.Post;

            CalculaEntregaItens(mm.varI_Code_Company,
                                sqlMaster.FindField('PEDIDO').AsInteger,
                                memprodutos.RecNo,
                                sqlMaster.FindField('PEDIDO_DOCUMENTO').AsInteger,
                                memprodutos.FindField('PRODUTO').AsInteger);

          except
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NÃO CONSEGUI GRAVAR A ENTREGA DOS ITENS ' , 'error' );
          end;
        end;
      memprodutos.Next;
    end;

  memprodutos.First;
  memprodutos.EnableControls;
end;

procedure TfrmNOTAELETRONICA.BoletoBancrio1Click(Sender: TObject);
begin
  mm.varI_Code_Numero_Documento    := sqlSearchMaster.FindField('NUMERO').AsInteger;
  mm.varI_Code_documento_serie     := sqlSearchMaster.FindField('SERIE').AsString;
  frmTELAMOVIMENTOBOLETOS.ShowModal();
end;

procedure TfrmNOTAELETRONICA.CarregaMarca;
begin
  UniDBComboBoxMARCA.Clear;
  if SqlPesquisa('SELECT DESCRICAO FROM MARCA ORDER BY CODIGO') then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          UniDBComboBoxMARCA.Items.Add(dm_rc.sqlBuscas.FindField('DESCRICAO').AsString);

          dm_rc.sqlBuscas.Next;
        end;
    end;
end;

procedure TfrmNOTAELETRONICA.carregaMovimento_comissao(const pnumero,pdocumento, pempresa: integer);
begin
  dm_rc.tb_movimentovendedor.Close;
  dm_rc.tb_movimentovendedor.Open;

  if SqlPesquisa(' SELECT * FROM MOVIMENTO_COMISSAO WHERE NUMERO   = ' + IntToStr(pnumero)   +
                 ' AND DOCUMENTO                                   = ' + IntToStr(pdocumento)+
                 ' AND EMPRESA                                     = ' + IntToStr(pempresa)  +
                 ' ORDER BY SEQUENCIA') then
  begin
    dm_rc.sqlBuscas.first;
    while not dm_rc.sqlBuscas.Eof do
      begin
       dm_rc.tb_movimentovendedor.Append;
       dm_rc.tb_movimentovendedor.FindField('FUNCIONARIO').AsInteger := dm_rc.sqlBuscas.FindField('FUNCIONARIO').AsInteger;
       dm_rc.tb_movimentovendedor.FindField('NOME').AsString         := dm_rc.sqlBuscas.FindField('NOME').AsString;
       dm_rc.tb_movimentovendedor.FindField('COMISSAO').AsFloat      := dm_rc.sqlBuscas.FindField('COMISSAO').AsFloat;
       dm_rc.tb_movimentovendedor.Post;

       dm_rc.sqlBuscas.Next;
      end;
  end;
end;

procedure TfrmNOTAELETRONICA.carregaitensef(cempresa, cdocumento, cnumero,csequencia: integer);
begin
  if SqlPesquisa(' SELECT * FROM MVITENS WHERE NUMERO   = ' + IntToStr(cnumero)    +
                 ' AND DOCUMENTO                        = ' + IntToStr(cdocumento) +
                 ' AND SEQUENCIA                        = ' + IntToStr(csequencia) +
                 ' AND EMPRESA                          = ' + IntToStr(cempresa)   +
                 ' ORDER BY SEQUENCIA') then
  begin
    dm_rc.sqlBuscas.First;
    while not dm_rc.sqlBuscas.Eof do
      begin
        memprodutos.edit;
        memprodutos.FindField('PRODUTO').AsInteger       :=  dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
        memprodutos.FindField('DESCRICAO').AsString      :=  dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
        memprodutos.FindField('NUMERONCM').AsString      :=  dm_rc.sqlBuscas.FindField('NUMERONCM').AsString;

        memprodutos.FindField('UNIDADE').AsString        :=  dm_rc.sqlBuscas.FindField('UNIDADE').AsString;
        memprodutos.FindField('CST').AsString            :=  dm_rc.sqlBuscas.FindField('CST').AsString;
        memprodutos.FindField('PRECO').AsFloat           :=  dm_rc.sqlBuscas.FindField('PRECO').AsFloat;
        memprodutos.FindField('DESCONTO').AsFloat        :=  dm_rc.sqlBuscas.FindField('DESCONTO').AsFloat;
        memprodutos.FindField('QUANTIDADE').AsFloat      :=  dm_rc.sqlBuscas.FindField('QUANTIDADE').AsFloat;
        memprodutos.FindField('TOTAL').AsFloat           :=  dm_rc.sqlBuscas.FindField('TOTAL').AsFloat;
        memprodutos.FindField('PESOBRUTO').AsFloat       :=  dm_rc.sqlBuscas.FindField('PESOBRUTO').AsFloat;
        memprodutos.FindField('PESOLIQUIDO').AsFloat     :=  dm_rc.sqlBuscas.FindField('PESOLIQUIDO').AsFloat;
        memprodutos.FindField('FRETE').AsFloat           :=  dm_rc.sqlBuscas.FindField('FRETE').AsFloat;

        //********************************************************************//
        // BASE DOS IMPOSTOS
        //********************************************************************//
        if SqlProdutos  ('SELECT PRODUTOS.*,SALDOS.* FROM PRODUTOS JOIN SALDOS ON SALDOS.EMPRESA = ' + IntToStr(cempresa) +
                         'AND SALDOS.PRODUTO = PRODUTOS.CODIGO WHERE PRODUTOS.CODIGO             = ' + IntToStr(memprodutos.FindField('PRODUTO').AsInteger)) then
          begin
            memprodutos.FindField('ICM0').AsFloat       := dm_rc.tbprodutos.Findfield('ICMS0').AsFloat;
            memprodutos.FindField('ICM1').AsFloat       := dm_rc.tbprodutos.Findfield('ICMS1').AsFloat;
            memprodutos.FindField('ICM2').AsFloat       := dm_rc.tbprodutos.Findfield('ICMS2').AsFloat;
            memprodutos.FindField('BAS0').AsFloat       := dm_rc.tbprodutos.Findfield('BASE0').AsFloat;
            memprodutos.FindField('BAS1').AsFloat       := dm_rc.tbprodutos.Findfield('BASE1').AsFloat;
            memprodutos.FindField('BAS2').AsFloat       := dm_rc.tbprodutos.Findfield('BASE2').AsFloat;

            memprodutos.FindField('SEMENTENOME').AsString   := dm_rc.tbprodutos.FindField('SEMENTENOME').AsString;
            memprodutos.FindField('CULTIVAR').AsString      := dm_rc.tbprodutos.Findfield('CULTIVAR').AsString;

          end;
        //********************************************************************//

        memprodutos.FindField('PEDIDOOR').AsString       :=  dm_rc.sqlBuscas.FindField('PEDIDOOR').AsString;
        memprodutos.FindField('PEDIDOITEMOR').AsString   :=  dm_rc.sqlBuscas.FindField('PEDIDOITEMOR').AsString;
        memprodutos.FindField('CODVEF').AsInteger        :=  mm.varI_Code_CODVEF;

        dm_rc.sqlBuscas.Next;
      end;
  end;
end;

procedure TfrmNOTAELETRONICA.D4Click(Sender: TObject);
begin
  dm_rc.memprodutos.Close;
  dm_rc.memprodutos.open;
  //********************************************//
  dm_rc.memprodutos.Append;
  dm_rc.memprodutos.CopyRecord(memprodutos);
  dm_rc.memprodutos.Post;
  //********************************************//
  frmDETALHESITENSNOTA.ShowModal();
  //********************************************//
  memprodutos.Edit;
  memprodutos.CopyRecord(dm_rc.memprodutos);
  memprodutos.Post;
  //********************************************//
end;

procedure TfrmNOTAELETRONICA.E2Click(Sender: TObject);
begin
  mm.varI_Code_Documento_Controle := sqlSearchMaster.FindField('CODIGO').AsInteger;
  FrmENVIOEMAIL.ShowModal();
end;

procedure TfrmNOTAELETRONICA.EntregaFuturaCRUD(acao: string);
begin
  if acao = 'inclui' then
    begin
      TabelaEntregaFutura('select * from entrega_futura where codigo = 0');

      dm_rc.fdqryentregafutura.Append;
      dm_rc.fdqryentregafutura.FindField('NUMERO').AsInteger    :=  sqlMaster.FindField('NUMERO').AsInteger;
      dm_rc.fdqryentregafutura.FindField('DOCUMENTO').AsInteger :=  sqlMaster.FindField('DOCUMENTO').AsInteger;
      dm_rc.fdqryentregafutura.FindField('PESSOA').AsInteger    :=  sqlMaster.FindField('PESSOA').AsInteger;
      dm_rc.fdqryentregafutura.FindField('EMISSAO').AsDateTime  :=  sqlMaster.FindField('EMISSAO').AsDateTime;
      dm_rc.fdqryentregafutura.FindField('SERIE').AsString      :=  sqlMaster.FindField('SERIE').AsString;
      dm_rc.fdqryentregafutura.FindField('PRODUTO').AsInteger   :=  memprodutos.FindField('PRODUTO').AsInteger;
      dm_rc.fdqryentregafutura.FindField('DESCRICAO').AsString  :=  memprodutos.FindField('DESCRICAO').AsString;
      dm_rc.fdqryentregafutura.FindField('QUANTIDADE').AsFloat  :=  memprodutos.FindField('QUANTIDADE').AsFloat;
      dm_rc.fdqryentregafutura.FindField('ENTREGUE').AsFloat    :=  0;
      dm_rc.fdqryentregafutura.FindField('SALDO').AsFloat       :=  memprodutos.FindField('QUANTIDADE').AsFloat;
      dm_rc.fdqryentregafutura.FindField('EMPRESA').AsInteger   :=  mm.varI_Code_Company;
      dm_rc.fdqryentregafutura.FindField('SEQUENCIA').AsInteger :=  memprodutos.RecNo;
      dm_rc.fdqryentregafutura.FindField('KEY').AsString        :=  Gera_Guid();
      dm_rc.fdqryentregafutura.FindField('CODIGO').AsInteger    :=  Ultimo_Codigo('ENTREGA_FUTURA','CODIGO',True);
      dm_rc.fdqryentregafutura.Post;
    end;

  if acao = 'exclui' then
    begin
      executasql('delete from entrega_futura where numero = ' + IntToStr(sqlMaster.FindField('NUMERO').AsInteger)    + ' and ' +
                 ' documento                              = ' + IntToStr(sqlMaster.FindField('DOCUMENTO').AsInteger) + ' and ' +
                 ' empresa                                = ' + IntToStr(mm.varI_Code_Company));
    end;

end;

procedure TfrmNOTAELETRONICA.EntregadosItenss1Click(Sender: TObject);
begin
  mm.var_ENTREGA_NUMERO        :=  sqlSearchMaster.FindField('NUMERO').AsInteger;
  mm.var_ENTREGA_EMISSAO       :=  sqlSearchMaster.FindField('EMISSAO').AsDateTime;
  mm.var_ENTREGA_NOMEFORNECEDOR:=  sqlSearchMaster.FindField('NOME').AsString;
  mm.var_ENTREGA_VALORTOTAL    :=  sqlSearchMaster.FindField('VLRTOTAL').AsFloat;

  if sqlSearchMaster.FindField('PEDIDO').AsString <> '' then
    begin
      mm.varE_numero_entrega       :=  sqlSearchMaster.FindField('PEDIDO').AsInteger;
      mm.varE_documento_entrega    :=  sqlSearchMaster.FindField('PEDIDO_DOCUMENTO').AsInteger;
    end
  else
    begin
      mm.varE_numero_entrega       :=  sqlSearchMaster.FindField('NUMERO').AsInteger;
      mm.varE_documento_entrega    :=  sqlSearchMaster.FindField('DOCUMENTO').AsInteger;
    end;

  mm.VarC_Atelagenerica        :=  'LISTAENTREGA';
  frmTELAGENERICA.ShowModal();
end;

procedure TfrmNOTAELETRONICA.FechaTabelas;
begin
  dm_rc.fdqrytitulos  .Close;
  dm_rc.FDQryMvmestre .Close;
  dm_rc.fdqrypontos   .Close;
  dm_rc.FDQryoperacoes.Close;
  dm_rc.sqlBuscas     .Close;
  dm_rc.tbtitulos     .Close;
  dm_rc.memprodutos   .Close;
end;

procedure TfrmNOTAELETRONICA.gravalotesementeorigem(const pacao: string);
begin
  if pacao = 'grava' then
    begin
      if (memprodutos.FindField('LOTESEMENTE').AsString <> '') and (memprodutos.FindField('LOTEENTRADA').AsString <> '') then
        begin
          if TabelaSementes(' select * from sementes where produto = ' + IntToStr(memprodutos.FindField('PRODUTO').AsInteger)   +
                            ' and lote                             = ' + QuotedStr(memprodutos.FindField('LOTESEMENTE').AsString)) then
          begin
            dm_rc.fdqrysementes.Edit;
            dm_rc.fdqrysementes.FindField('LOTEORIGEM').AsString       :=  memprodutos.FindField('LOTEENTRADA').AsString;
            dm_rc.fdqrysementes.FindField('PUREZAENTRADA').AsFloat     :=  memprodutos.FindField('PUREZAENTRADA').AsFloat;
            dm_rc.fdqrysementes.FindField('VCENTRADA').AsFloat         :=  memprodutos.FindField('VCENTRADA').AsFloat;
            dm_rc.fdqrysementes.FindField('GERMINACAOENTRADA').AsFloat :=  memprodutos.FindField('GERMINACAOENTRADA').AsFloat;

            dm_rc.fdqrysementes.FindField('NOTA').AsString             :=  sqlMaster.FindField('NUMERO').AsString;
            dm_rc.fdqrysementes.FindField('SERIE').AsString            :=  sqlMaster.FindField('SERIE').AsString;
            dm_rc.fdqrysementes.FindField('PESSOA').AsInteger          :=  sqlMaster.FindField('PESSOA').AsInteger;

            dm_rc.fdqrysementes.FindField('COOPERANTE').AsInteger      :=  sqlMaster.FindField('COOPERANTE').AsInteger;
            dm_rc.fdqrysementes.FindField('SAFRACAMPO').AsString       :=  sqlMaster.FindField('SAFRACAMPO').AsString;
            dm_rc.fdqrysementes.FindField('CAMPO').AsString            :=  sqlMaster.FindField('CAMPO').AsString;

            dm_rc.fdqrysementes.Post;
          end;
        end;
    end;

  if pacao = 'exclui' then
    begin
      if (memprodutos.FindField('LOTESEMENTE').AsString <> '') and (memprodutos.FindField('LOTEENTRADA').AsString <> '') then
        begin
          if TabelaSementes(' select * from sementes where produto = ' + IntToStr(memprodutos.FindField('PRODUTO').AsInteger)   +
                            ' and lote                             = ' + QuotedStr(memprodutos.FindField('LOTESEMENTE').AsString)) then
          begin
            dm_rc.fdqrysementes.Edit;
            dm_rc.fdqrysementes.FindField('LOTEORIGEM').AsString       :=  '';
            dm_rc.fdqrysementes.FindField('PUREZAENTRADA').AsFloat     :=  0;
            dm_rc.fdqrysementes.FindField('VCENTRADA').AsFloat         :=  0;
            dm_rc.fdqrysementes.FindField('GERMINACAOENTRADA').AsFloat :=  0;

            dm_rc.fdqrysementes.FindField('NOTA').AsString             :=  '';
            dm_rc.fdqrysementes.FindField('SERIE').AsString            :=  '';
            dm_rc.fdqrysementes.FindField('PESSOA').AsInteger          :=  0;
            dm_rc.fdqrysementes.Post;
          end;
        end;
    end;

end;

procedure TfrmNOTAELETRONICA.HabilitaCombobox(status: boolean);
var
  I:integer;
begin
  for I:= 0 to ComponentCount -1 do
     begin
       if ( Components[I] is TUniDBComboBox )  then
         begin
           TUniDBEdit(Components[I]).Enabled := status;
         end;
       if ( Components[I] is TUniComboBox )  then
         begin
           TUniEdit(Components[I]).Enabled := status;
         end;
     end;
end;

procedure TfrmNOTAELETRONICA.RecibodeRetirada1Click(Sender: TObject);
begin
  if sqlSearchMaster.FindField('CANCELADA').AsString <> 'A' then
    begin
      dm_rc.rc_ShowSweetAlert( 'Ok', 'NÃO FOI PERMITIDO FAZER A IMPRESSÃO' , 'error' );
      abort
    end
  else
  dm_rc.rc_ShowYesNo( 'POSSO IMPRIMIR O RECIBO DOS VOLUMES?' );
  if mm.varB_Yes then
    begin
      mm.varC_caminhopdf :=  IMPRESSAO_recibonotaVolume(mm.varI_Code_Company,
                                                        sqlSearchMaster.FindField('CODIGO').AsInteger);
      unfImpressao.ShowModal();
    end;
end;

procedure TfrmNOTAELETRONICA.ReanalisarItensEntregaPN;
begin
  TabelaEntregaProduto('select * from ENTREGA_PRODUTO where nota = ' + IntToStr(sqlMaster.FindField('NUMERO').AsInteger));
  executasql          ('delete   from ENTREGA_PRODUTO where nota = ' + IntToStr(sqlMaster.FindField('NUMERO').AsInteger));
  dm_rc.fdqryentregaproduto.First;
  while not dm_rc.fdqryentregaproduto.Eof do
    begin
      CalculaEntregaItens(mm.varI_Code_Company,
                          dm_rc.fdqryentregaproduto.FindField('NUMERO').AsInteger,
                          dm_rc.fdqryentregaproduto.FindField('SEQUENCIA').AsInteger,
                          dm_rc.fdqryentregaproduto.FindField('NUMERO').AsInteger,
                          dm_rc.fdqryentregaproduto.FindField('PRODUTO').AsInteger);

      dm_rc.fdqryentregaproduto.Next;
    end;
end;

procedure TfrmNOTAELETRONICA.t1Click(Sender: TObject);
begin
  mm.varI_Code_Numero_Documento    := sqlSearchMaster.FindField('NUMERO').AsInteger;
  mm.varI_Code_Documento_Documento := 1;

  mm.VarC_Atelagenerica         := 'TERMONOTA';
  frmTELAGENERICA.ShowModal();
end;

procedure TfrmNOTAELETRONICA.UniComboBoxparaopChange(Sender: TObject);
begin
  if SqlPesquisa('select * from PARAMETROSOPERACAO where DESCRICAO = ' + QuotedStr(UniComboBoxparaop.Text)) then
    begin
      if (StrContains('5117',dm_rc.sqlBuscas.FindField('OP_INTERNA').AsString)) or
         (StrContains('6117',dm_rc.sqlBuscas.FindField('OP_EXTERNA').AsString)) then
      begin
        FrmDUPLICANOTA.ShowModal();
        if mm.varI_Code_Documento_Controle <> 0 then
          begin
            mm.varI_Code_Documento_statusdup := 'S';

            CarregaImportacao(mm.varI_Code_Documento_Controle);
            Calcula_Totais();
            SetBut(tpCalcular);
          end;
      end;
    end;
end;

procedure TfrmNOTAELETRONICA.UniDBFormattedNumberEditFRETEExit(Sender: TObject);
begin
  if ( sqlMaster.State in [dsEdit, dsInsert ] ) then
    Calcula_Totais;
end;

procedure TfrmNOTAELETRONICA.UniDBGridprodutosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  posicao_x := X;
  posicao_y := Y;
end;

procedure TfrmNOTAELETRONICA.V2Click(Sender: TObject);
begin
  mm.varI_Code_CODVEF           := 0;
  mm.varI_Code_Pessoa_Documento := sqlMaster.FindField('PESSOA').AsInteger;
  mm.VarC_Atelagenerica         := 'ENTREGAFUTURA';
  frmTELAGENERICA.showmodal();

  if  mm.varI_Code_CODVEF <> 0 then
    begin
      SqlPesquisa('select * from entrega_futura where codigo = ' + IntToStr(mm.varI_Code_CODVEF));
      UniDBGridprodutos.SetFocus;
      carregaitensef(mm.varI_Code_Company,
                     dm_rc.sqlBuscas.FindField('documento').AsInteger,
                     dm_rc.sqlBuscas.FindField('numero').AsInteger,
                     dm_rc.sqlBuscas.FindField('sequencia').AsInteger);
    end;
end;

function TfrmNOTAELETRONICA.VerificaDataDocumentoOriginal(const cpedido,cdocumento: string):TDateTime;
begin
  Result := 0;
  if SqlPesquisa(' select emissao from mvmestre where numero = ' + QuotedStr(cpedido)    +
                 ' and documento                             = ' + QuotedStr(cdocumento) +
                 ' and empresa                               = ' + IntToStr(mm.varI_Code_Company)) then
  begin
    Result := dm_rc.sqlBuscas.FindField('EMISSAO').AsDateTime;
  end;
end;

procedure TfrmNOTAELETRONICA.VerificaEdicao;
begin
  if  sqlMaster.State in [dsEdit,dsInsert] then
     begin
       dm_rc.rc_ShowSweetAlert('ATENÇÃO',labTitleForm.Caption + ' - REGISTRO AINDA ESTA EM ABERTO - CANCELE OU SALVE', 'error' );
       pgBaseCadControl.ActivePage := tabRegister;
       abort ;
     end;
end;

//[PT] Ajuste runtime do btnvendedor na barra herdada: independe do algoritmo do
//     rc_ActionBtnsRender — ancora o botão ao lado de btntransp (posicao real de
//     runtime) e alarga o painel do grupo para nao haver clipping.
//[EN] Runtime adjust of btnvendedor on the inherited toolbar: independent of the
//     rc_ActionBtnsRender algorithm — anchors the button next to btntransp (real
//     runtime position) and widens the group panel to avoid clipping.


procedure TfrmNOTAELETRONICA.AjustaBtnVendedor;
var
  pa : TUniContainerPanel;
begin
  if not Assigned(btnvendedor) or not Assigned(btntransp) then Exit;

  pa := TUniContainerPanel(btntransp.Parent);

  btnvendedor.Align     := alNone;
  btnvendedor.Anchors   := [];
  btnvendedor.Left      := btntransp.Left + btntransp.Width + 2;
  btnvendedor.Top       := btntransp.Top;
  btnvendedor.Width     := btntransp.Width;
  btnvendedor.Height    := btntransp.Height;
  btnvendedor.Visible   := True;
  btnvendedor.BringToFront;

  if pa.Width < (btnvendedor.Left + btnvendedor.Width + 2) then
     pa.Width := btnvendedor.Left + btnvendedor.Width + 2;
end;


procedure TfrmNOTAELETRONICA.UniFormResize(Sender: TObject);
begin
  AjustaBtnVendedor;
end;

procedure TfrmNOTAELETRONICA.btnvendedorClick(Sender: TObject);
begin
  if sqlMaster.FindField('CANCELADA').AsString = 'A' then
    begin
      carregaMovimento_comissao(sqlMaster.FindField('NUMERO').AsInteger,
                                sqlMaster.FindField('DOCUMENTO').AsInteger,
                                mm.varI_Code_Company);
      mm.varC_vendedorstatus := 'S';

      FrmMOVIMENTOVENDEDOR.ShowModal();

      if DM_RC.tb_movimentovendedor.RecordCount > 0 then
        begin
          executasql('delete from movimento_comissao where numero  = ' + IntToStr(sqlMaster.FindField('NUMERO').AsInteger)    +
                     '                               and documento = ' + IntToStr(sqlMaster.FindField('DOCUMENTO').AsInteger) +
                     '                               and empresa   = ' + IntToStr(mm.varI_Code_Company));

          TabelaMovimentoComissao('SELECT * FROM MOVIMENTO_COMISSAO WHERE CODIGO = 0');
          DM_RC.tb_movimentovendedor.First;
          while not DM_RC.tb_movimentovendedor.Eof do
            begin
              dm_rc.fdqrymovcomissao.Append;
              dm_rc.fdqrymovcomissao.FindField('KEY').AsString             := Gera_Guid();
              dm_rc.fdqrymovcomissao.FindField('CODIGO').AsInteger         := Ultimo_Codigo('MOVIMENTO_COMISSAO','CODIGO',True);
              dm_rc.fdqrymovcomissao.FindField('SEQUENCIA').AsInteger      := DM_RC.tb_movimentovendedor.RecNo;
              dm_rc.fdqrymovcomissao.FindField('EMPRESA').AsInteger        := mm.varI_Code_Company;
              dm_rc.fdqrymovcomissao.FindField('DOCUMENTO').AsInteger      := sqlMaster.FindField('DOCUMENTO').AsInteger;
              dm_rc.fdqrymovcomissao.FindField('NUMERO').AsInteger         := sqlMaster.FindField('NUMERO').AsInteger;
              dm_rc.fdqrymovcomissao.FindField('FUNCIONARIO').AsInteger    := dm_rc.tb_movimentovendedor.FindField('FUNCIONARIO').AsInteger;
              dm_rc.fdqrymovcomissao.FindField('NOME').AsString            := dm_rc.tb_movimentovendedor.FindField('NOME').AsString;
              dm_rc.fdqrymovcomissao.FindField('COMISSAO').AsFloat         := dm_rc.tb_movimentovendedor.FindField('COMISSAO').AsFloat;
              dm_rc.fdqrymovcomissao.Post;

              dm_rc.tb_movimentovendedor.Next;
            end;
        end;

    end
  else
    begin
      if sqlMaster.State in [dsInsert,dsEdit] then
        mm.varC_vendedorstatus := 'S'
      else
        begin
          carregaMovimento_comissao(sqlMaster.FindField('NUMERO').AsInteger,
                                    sqlMaster.FindField('DOCUMENTO').AsInteger,
                                    mm.varI_Code_Company);
          mm.varC_vendedorstatus := '';
        end;

      FrmMOVIMENTOVENDEDOR.ShowModal();
    end;
end;

initialization
  RegisterClass(TfrmNOTAELETRONICA);
end.
