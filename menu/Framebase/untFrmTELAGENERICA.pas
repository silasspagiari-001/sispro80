unit untFrmTELAGENERICA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn,
  uniPageControl, uniLabel, uniEdit, uniDBEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniBasicGrid, uniDBGrid, uniDateTimePicker,
  uniDBDateTimePicker, uniScrollBox, uniMultiItem, uniComboBox, uniDBComboBox,
  uniImage, Vcl.Imaging.pngimage, uniFileUpload, uniCheckBox, uniDBCheckBox,
  uniMemo, uniDBVerticalGrid, uniDBTreeGrid, uniHTMLMemo, uniScreenMask,
  Vcl.Menus, uniMainMenu, untFraSelecaoLote;

type

  TfrmTELAGENERICA = class(TUniForm)
    btnBusca_UniButtonDbEditcodigofuncionariomestre: TUniBitBtn;
    btnBusca_UniButtonEditcodbancos: TUniBitBtn;
    btnBusca_UniButtonEditcadplanocontas: TUniBitBtn;
    btnBusca_UniButtonEditcadpessoas: TUniBitBtn;
    btnBusca_btneditempresa: TUniBitBtn;
    btnBusca_btneditcopiafun: TUniBitBtn;
    btnBusca_UniButtonEditcooperante: TUniBitBtn;
    rcBlock10: TUniContainerPanel;
    btnLkpClear: TUniBitBtn;
    UniPageControltela: TUniPageControl;
    UniTabSheetcontrolepontos: TUniTabSheet;
    UniTabSheethistoriconotasfaturada: TUniTabSheet;
    rcBlock90: TUniContainerPanel;
    dbgSearchCRUD: TUniDBGrid;
    FDQryPesquisa: TFDQuery;
    UniTabSheethistprodutopessoa: TUniTabSheet;
    rcBlock100: TUniContainerPanel;
    UniDBGrid1: TUniDBGrid;
    UniTabSheethistlotespessoa: TUniTabSheet;
    rcBlock110: TUniContainerPanel;
    UniDBGrid2: TUniDBGrid;
    UniTabSheethistvendalote: TUniTabSheet;
    rcBlock120: TUniContainerPanel;
    UniDBGrid3: TUniDBGrid;
    UniTabSheettdetalhesemissor: TUniTabSheet;
    UniScrollBox1: TUniScrollBox;
    rcBlock130: TUniContainerPanel;
    UniLabel7: TUniLabel;
    edCodigo: TUniDBEdit;
    rcBlock170: TUniContainerPanel;
    UniLabel9: TUniLabel;
    UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit;
    rcBlock140: TUniContainerPanel;
    UniDBEdit1: TUniDBEdit;
    UniLabel8: TUniLabel;
    rcBlock180: TUniContainerPanel;
    UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit;
    UniLabel10: TUniLabel;
    rcBlock150: TUniContainerPanel;
    UniLabel13: TUniLabel;
    UniButtonDbEditlaboratorio: TUniDBEdit;
    rcBlock190: TUniContainerPanel;
    UniLabel11: TUniLabel;
    UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit;
    rcBlock160: TUniContainerPanel;
    UniLabel22: TUniLabel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    rcBlock200: TUniContainerPanel;
    UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit;
    UniLabel12: TUniLabel;
    rcBlock210: TUniContainerPanel;
    UniDBGrid4: TUniDBGrid;
    UniTabSheetalteranotaeletronica: TUniTabSheet;
    UniScrollBox2: TUniScrollBox;
    rcBlock220: TUniContainerPanel;
    rcBlock230: TUniContainerPanel;
    rcBlock240: TUniContainerPanel;
    UniLabel14: TUniLabel;
    UniButtonDbEditcodigofuncionariomestre: TUniDBEdit;
    UniLabel15: TUniLabel;
    UniEditnomevendedor: TUniEdit;
    UniLabel16: TUniLabel;
    UniDBFormattedNumberEditperccomissao: TUniDBFormattedNumberEdit;
    rcBlock250: TUniContainerPanel;
    rcBlock260: TUniContainerPanel;
    rcBlock270: TUniContainerPanel;
    UniLabel17: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    UniLabel18: TUniLabel;
    UniDBComboBoxtiponota: TUniDBComboBox;
    UniLabel26: TUniLabel;
    rcBlock280: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    UniDBEditnotaprotocolo: TUniDBEdit;
    UniTabSheetsenhaexclusaonota: TUniTabSheet;
    rcBlock290: TUniContainerPanel;
    UniImage1: TUniImage;
    rcBlock300: TUniContainerPanel;
    UniLabelexclusaonota: TUniLabel;
    rcBlock310: TUniContainerPanel;
    UniEditsenhaexcluinota: TUniEdit;
    UniLabel19: TUniLabel;
    rcBlock320: TUniContainerPanel;
    UniBitBtnvalidasenhanota: TUniBitBtn;
    UniTabSheetparcelaspgto: TUniTabSheet;
    UniContainerPanel1: TUniContainerPanel;
    rcBlock370: TUniContainerPanel;
    UniNumberEditnparcela: TUniNumberEdit;
    UniLabel20: TUniLabel;
    rcBlock360: TUniContainerPanel;
    btnNewReg: TUniBitBtn;
    UniBitBtn3: TUniBitBtn;
    rcBlock380: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchCRUDDtIni: TUniDateTimePicker;
    rcBlock390: TUniContainerPanel;
    UniFormattedNumberEditvalordocumento: TUniFormattedNumberEdit;
    UniLabel21: TUniLabel;
    rcBlock400: TUniContainerPanel;
    rcBlock410: TUniContainerPanel;
    UniDBGridtitulos: TUniDBGrid;
    UniFormattedNumberEdittotalduplicatas: TUniFormattedNumberEdit;
    UniLabel23: TUniLabel;
    UniBitBtn4: TUniBitBtn;
    UniTabSheetlognota: TUniTabSheet;
    rcBlock420: TUniContainerPanel;
    UniDBEdit12: TUniDBEdit;
    UniLabel24: TUniLabel;
    rcBlock430: TUniContainerPanel;
    UniDBEdit2: TUniDBEdit;
    UniLabel25: TUniLabel;
    rcBlock440: TUniContainerPanel;
    UniDBEdit3: TUniDBEdit;
    UniLabel27: TUniLabel;
    rcBlock450: TUniContainerPanel;
    UniDBEdit4: TUniDBEdit;
    UniLabel28: TUniLabel;
    rcBlock460: TUniContainerPanel;
    UniDBEdit6: TUniDBEdit;
    UniLabel29: TUniLabel;
    UniTabSheetConfiguranotaeletronica: TUniTabSheet;
    rcBlock465: TUniContainerPanel;
    rcBlock470: TUniContainerPanel;
    UniDBEdit7: TUniDBEdit;
    UniLabel30: TUniLabel;
    rcBlock480: TUniContainerPanel;
    UniLabel31: TUniLabel;
    UniDBEdit8: TUniDBEdit;
    rcBlock490: TUniContainerPanel;
    UniLabel32: TUniLabel;
    UniDBEdit9: TUniDBEdit;
    uniFileUp: TUniFileUpload;
    UniBitBtn2: TUniBitBtn;
    rcBlock500: TUniContainerPanel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniDBCheckBox2: TUniDBCheckBox;
    UniDBCheckBox3: TUniDBCheckBox;
    UniDBCheckBox4: TUniDBCheckBox;
    UniDBCheckBox5: TUniDBCheckBox;
    UniDBCheckBox6: TUniDBCheckBox;
    UniDBCheckBox7: TUniDBCheckBox;
    rcBlock510: TUniContainerPanel;
    rcBlock520: TUniContainerPanel;
    rcBlock530: TUniContainerPanel;
    rcBlock540: TUniContainerPanel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniLabel33: TUniLabel;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    UniLabel34: TUniLabel;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;
    UniLabel35: TUniLabel;
    UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit;
    UniLabel36: TUniLabel;
    rcBlock550: TUniContainerPanel;
    btnempgrava: TUniBitBtn;
    btnempinclui: TUniBitBtn;
    UniTabSheetcalculaicms: TUniTabSheet;
    rcBlock555: TUniContainerPanel;
    rcBlock560: TUniContainerPanel;
    rcBlock570: TUniContainerPanel;
    rcBlock580: TUniContainerPanel;
    rcBlock590: TUniContainerPanel;
    UniFormattedNumberpercreducao: TUniFormattedNumberEdit;
    UniLabel38: TUniLabel;
    UniFormattedNumberpercicms: TUniFormattedNumberEdit;
    UniFormattedNumberBASEICMS: TUniFormattedNumberEdit;
    UniFormattedNumberVALORICMS: TUniFormattedNumberEdit;
    rcBlock600: TUniContainerPanel;
    rcBlock610: TUniContainerPanel;
    UniBitBtn7: TUniBitBtn;
    UniBitBtn8: TUniBitBtn;
    UniLabel39: TUniLabel;
    UniLabel40: TUniLabel;
    UniLabel41: TUniLabel;
    UniDBGridprodutos: TUniDBGrid;
    UniTabSheetDetalhesempresa: TUniTabSheet;
    rcBlock625: TUniContainerPanel;
    rcBlock630: TUniContainerPanel;
    rcBlock640: TUniContainerPanel;
    rcBlock650: TUniContainerPanel;
    UniDBComboBox1: TUniDBComboBox;
    UniLabel37: TUniLabel;
    UniDBComboBox2: TUniDBComboBox;
    UniLabel43: TUniLabel;
    UniDBComboBox3: TUniDBComboBox;
    UniLabel44: TUniLabel;
    rcBlock660: TUniContainerPanel;
    rcBlock670: TUniContainerPanel;
    UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit;
    UniLabel45: TUniLabel;
    UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit;
    UniLabel46: TUniLabel;
    UniTabSheetparcelasfinanceiro: TUniTabSheet;
    rcBlock875: TUniContainerPanel;
    UniTabSheetreceitalote: TUniTabSheet;
    rcBlock795: TUniContainerPanel;
    rcBlock800: TUniContainerPanel;
    rcBlock810: TUniContainerPanel;
    rcBlock820: TUniContainerPanel;
    UniLabel56: TUniLabel;
    UniDBEdit10: TUniDBEdit;
    UniLabel57: TUniLabel;
    UniDBEdit11: TUniDBEdit;
    UniLabel58: TUniLabel;
    UniDBEdit13: TUniDBEdit;
    UniTabSheetlogmanifesto: TUniTabSheet;
    rcBlock830: TUniContainerPanel;
    UniLabel59: TUniLabel;
    UniDBEdit14: TUniDBEdit;
    rcBlock840: TUniContainerPanel;
    UniDBEdit15: TUniDBEdit;
    UniLabel60: TUniLabel;
    rcBlock850: TUniContainerPanel;
    UniLabel61: TUniLabel;
    UniDBEdit16: TUniDBEdit;
    rcBlock860: TUniContainerPanel;
    UniLabel62: TUniLabel;
    UniDBEdit17: TUniDBEdit;
    rcBlock870: TUniContainerPanel;
    UniDBEdit18: TUniDBEdit;
    UniLabel63: TUniLabel;
    UniTabSheettitulosnota: TUniTabSheet;
    rcBlock08: TUniContainerPanel;
    rcBlock06: TUniContainerPanel;
    UniDBGridtitulosnota: TUniDBGrid;
    UniBitBtn11: TUniBitBtn;
    UniLabel64: TUniLabel;
    UniFormattedNumberEditTOTALNOTA: TUniFormattedNumberEdit;
    UniLabel65: TUniLabel;
    UniFormattedNumberEdittotalcalculado: TUniFormattedNumberEdit;
    rcBlock880: TUniContainerPanel;
    rcBlock890: TUniContainerPanel;
    rcBlock900: TUniContainerPanel;
    rcBlock910: TUniContainerPanel;
    rcBlock920: TUniContainerPanel;
    rcBlock930: TUniContainerPanel;
    rcBlock940: TUniContainerPanel;
    rcBlock950: TUniContainerPanel;
    rcBlock960: TUniContainerPanel;
    rcBlock970: TUniContainerPanel;
    rcBlock980: TUniContainerPanel;
    rcBlock990: TUniContainerPanel;
    rcBlock1000: TUniContainerPanel;
    rcBlock1010: TUniContainerPanel;
    UniButtonEditcodbancos: TUniEdit;
    UniButtonEditcadplanocontas: TUniEdit;
    UniButtonEditcadpessoas: TUniEdit;
    UniEditdesbancos: TUniEdit;
    UniEditdesplanocontas: TUniEdit;
    UniDateemissao: TUniDateTimePicker;
    UniDateTimevencimento: TUniDateTimePicker;
    UniEditdesnomepessoa: TUniEdit;
    UniFormattedNumberEditvlrtitulos: TUniFormattedNumberEdit;
    UniEditnumerodocumento: TUniEdit;
    cbxserie: TUniComboBox;
    UniLabel42: TUniLabel;
    UniLabel47: TUniLabel;
    UniLabel48: TUniLabel;
    UniLabel49: TUniLabel;
    UniLabel50: TUniLabel;
    UniLabel51: TUniLabel;
    UniLabel52: TUniLabel;
    UniLabel53: TUniLabel;
    UniLabel54: TUniLabel;
    UniLabel55: TUniLabel;
    UniLabel66: TUniLabel;
    UniEditpgtoobs: TUniEdit;
    UniLabel67: TUniLabel;
    UniBitBtn9: TUniBitBtn;
    UniBitBtn10: TUniBitBtn;
    UniBitBtn12: TUniBitBtn;
    UniNumberEditparcelatitulos: TUniNumberEdit;
    UniLabel68: TUniLabel;
    UniDBGridparcelastitulos: TUniDBGrid;
    UniTabSheetlogtitulos: TUniTabSheet;
    rcBlock780: TUniContainerPanel;
    UniDBEdit19: TUniDBEdit;
    UniLabel69: TUniLabel;
    rcBlock790: TUniContainerPanel;
    UniDBEdit20: TUniDBEdit;
    UniLabel70: TUniLabel;
    rcBlock1500: TUniContainerPanel;
    UniDBEdit21: TUniDBEdit;
    UniLabel71: TUniLabel;
    rcBlock1510: TUniContainerPanel;
    UniDBEdit22: TUniDBEdit;
    UniLabel72: TUniLabel;
    UniTabSheetloglancamentobancario: TUniTabSheet;
    rcBlock1520: TUniContainerPanel;
    UniDBEdit23: TUniDBEdit;
    UniLabel73: TUniLabel;
    rcBlock1530: TUniContainerPanel;
    UniDBEdit24: TUniDBEdit;
    UniLabel74: TUniLabel;
    UniTabSheetexiberastreio: TUniTabSheet;
    UniContainerPanel15: TUniContainerPanel;
    UniDBVerticalGrid1: TUniDBVerticalGrid;
    UniTabSheetpermusuario: TUniTabSheet;
    rcBlock1550: TUniContainerPanel;
    btnaltera: TUniBitBtn;
    btngrava: TUniBitBtn;
    rcBlock1570: TUniContainerPanel;
    btneditempresa: TUniEdit;
    UniLabel76: TUniLabel;
    btneditcopiafun: TUniEdit;
    UniLabel77: TUniLabel;
    btncopia: TUniBitBtn;
    editnomeusuario: TUniEdit;
    rcBlock1030: TUniContainerPanel;
    UniDBTreeGridpermissao: TUniDBTreeGrid;
    btnpermitetudo: TUniBitBtn;
    btndesmarcatudo: TUniBitBtn;
    UniTabSheetcapturaXML: TUniTabSheet;
    rcBlock1580: TUniContainerPanel;
    UniBitBtn13: TUniBitBtn;
    UniBitBtn14: TUniBitBtn;
    rcBlock1600: TUniContainerPanel;
    UniLabel75: TUniLabel;
    UniTabSheetdadosxmlentrada: TUniTabSheet;
    rcBlock1050: TUniContainerPanel;
    rcBlock1060: TUniContainerPanel;
    rcBlock1070: TUniContainerPanel;
    rcBlock1080: TUniContainerPanel;
    UniFormattedNumberEditvlrbaseicms: TUniFormattedNumberEdit;
    UniFormattedNumberEditvlricms: TUniFormattedNumberEdit;
    UniFormattedNumberEditvlrprodutos: TUniFormattedNumberEdit;
    UniFormattedNumberEditvlrtotal: TUniFormattedNumberEdit;
    UniLabel78: TUniLabel;
    UniLabel79: TUniLabel;
    UniLabel80: TUniLabel;
    UniLabel81: TUniLabel;
    rcBlock1090: TUniContainerPanel;
    rcBlock1100: TUniContainerPanel;
    rcBlock1110: TUniContainerPanel;
    rcBlock1120: TUniContainerPanel;
    UniEditxmlpessoa: TUniEdit;
    UniLabel82: TUniLabel;
    UniEditxmlnomepessoa: TUniEdit;
    UniLabel83: TUniLabel;
    UniEditxmlcidadepessoa: TUniEdit;
    UniLabel84: TUniLabel;
    UniEditxmlufpessoa: TUniEdit;
    UniLabel85: TUniLabel;
    rcBlock1130: TUniContainerPanel;
    UniDBGridDADOSXML: TUniDBGrid;
    UniMemodadosxml: TUniMemo;
    rcBlock1140: TUniContainerPanel;
    rcBlock1150: TUniContainerPanel;
    rcBlock1160: TUniContainerPanel;
    UniEditxmlnumeronota: TUniEdit;
    UniLabel86: TUniLabel;
    UniDateTimePickerxmlemissao: TUniDateTimePicker;
    UniLabel87: TUniLabel;
    UniEditxmlchaveacesso: TUniEdit;
    UniLabel88: TUniLabel;
    UniBitBtn15: TUniBitBtn;
    UniTabSheetfinanceiroxml: TUniTabSheet;
    rcBlock1170: TUniContainerPanel;
    UniDBGrid5: TUniDBGrid;
    UniTabSheetentradasemente: TUniTabSheet;
    rcBlock1180: TUniContainerPanel;
    rcBlock1700: TUniContainerPanel;
    UniLabel90: TUniLabel;
    UniButtonEditcooperante: TUniEdit;
    rcBlock1710: TUniContainerPanel;
    UniLabel91: TUniLabel;
    UniEditsafracampocooperante: TUniEdit;
    rcBlock1720: TUniContainerPanel;
    UniLabel92: TUniLabel;
    UniEditcampocooperante: TUniEdit;
    rcBlock1730: TUniContainerPanel;
    UniLabel93: TUniLabel;
    UniEditloteentrada: TUniEdit;
    rcBlock1740: TUniContainerPanel;
    UniLabel89: TUniLabel;
    UniFormattedNumberEditpurezaentrada: TUniFormattedNumberEdit;
    rcBlock1760: TUniContainerPanel;
    UniLabel94: TUniLabel;
    UniFormattedNumberEditgerminacaoentrada: TUniFormattedNumberEdit;
    rcBlock1750: TUniContainerPanel;
    UniLabel95: TUniLabel;
    UniFormattedNumberEditvcentrada: TUniFormattedNumberEdit;
    btnentradatransf: TUniBitBtn;
    UniTabSheettermonota: TUniTabSheet;
    rcBlock1190: TUniContainerPanel;
    UniDBGrid6: TUniDBGrid;
    UniScreenMask: TUniScreenMask;
    UniTabSheetKARDEXPRODUTO: TUniTabSheet;
    rcBlock1200: TUniContainerPanel;
    rcBlock1210: TUniContainerPanel;
    UniDBGrid7: TUniDBGrid;
    UniLabel96: TUniLabel;
    UniLabel97: TUniLabel;
    UniBitBtnbuscakardexproduto: TUniBitBtn;
    UniDateTimePickerkarproini: TUniDateTimePicker;
    UniDateTimePickerkarprofin: TUniDateTimePicker;
    UniTabSheetHISTORICOLOTEPONTOBENE: TUniTabSheet;
    rcBlock1765: TUniContainerPanel;
    UniEditBENEPRO: TUniEdit;
    UniLabel98: TUniLabel;
    rcBlock1770: TUniContainerPanel;
    UniEditbenelotesemente: TUniEdit;
    UniLabel99: TUniLabel;
    rcBlock1780: TUniContainerPanel;
    UniEditbeneboletim: TUniEdit;
    UniLabel100: TUniLabel;
    rcBlock1790: TUniContainerPanel;
    UniLabel101: TUniLabel;
    rcBlock1870: TUniContainerPanel;
    UniLabel102: TUniLabel;
    rcBlock1810: TUniContainerPanel;
    UniLabel103: TUniLabel;
    UniFormattedNumberEditbenepureza: TUniFormattedNumberEdit;
    UniFormattedNumberEditbenegerminacao: TUniFormattedNumberEdit;
    UniFormattedNumberEditbenevc: TUniFormattedNumberEdit;
    rcBlock1230: TUniContainerPanel;
    UniDBGrid8: TUniDBGrid;
    rcBlock1240: TUniContainerPanel;
    rcBlock1250: TUniContainerPanel;
    UniDBEdit25: TUniDBEdit;
    UniLabel104: TUniLabel;
    UniDBEdit26: TUniDBEdit;
    UniLabel105: TUniLabel;
    UniLabel106: TUniLabel;
    UniTabSheetblocok200: TUniTabSheet;
    UniContainerPanel30: TUniContainerPanel;
    UniDBGridBLOCOK200: TUniDBGrid;
    UniTabSheetmedidassped: TUniTabSheet;
    UniDBGrid9: TUniDBGrid;
    UniTabSheetoperacaosped: TUniTabSheet;
    UniContainerPanel31: TUniContainerPanel;
    UniDBGrid10: TUniDBGrid;
    UniTabSheetpessoassped: TUniTabSheet;
    UniContainerPanel32: TUniContainerPanel;
    UniDBGrid11: TUniDBGrid;
    UniTabSheetcontroleentregas: TUniTabSheet;
    rcBlock1850: TUniContainerPanel;
    rcBlock1860: TUniContainerPanel;
    rcBlock1880: TUniContainerPanel;
    rcBlock1890: TUniContainerPanel;
    rcBlock2000: TUniContainerPanel;
    rcBlock1888: TUniContainerPanel;
    UniEditentreganpedido: TUniEdit;
    UniLabel107: TUniLabel;
    UniDateTimePickerentreganemissao: TUniDateTimePicker;
    UniLabel108: TUniLabel;
    UniEditentregapessoa: TUniEdit;
    UniLabel109: TUniLabel;
    UniFormattedNumberEditentregatotaldoc: TUniFormattedNumberEdit;
    UniLabel110: TUniLabel;
    UniDBGridEntrega: TUniDBGrid;
    UniPopupMenuopcoesentregas: TUniPopupMenu;
    L1: TUniMenuItem;
    UniTabSheetfinanceirodoc: TUniTabSheet;
    UniContainerPanel36: TUniContainerPanel;
    UniDBGridfinanceirodoc: TUniDBGrid;
    ubtnimpressao: TUniBitBtn;
    UniTabSheetfinanceiropedido: TUniTabSheet;
    UniContainerPanel39: TUniContainerPanel;
    UniDBGrid12: TUniDBGrid;
    rcBlock1270: TUniContainerPanel;
    rcBlock1280: TUniContainerPanel;
    rcBlock1290: TUniContainerPanel;
    UniBitBtn16: TUniBitBtn;
    UniBitBtn17: TUniBitBtn;
    UniTabSheetencerramanifesto: TUniTabSheet;
    rcBlock2010: TUniContainerPanel;
    UniMemorespostaTXT: TUniMemo;
    UniMemorespxml: TUniMemo;
    rcBlock2040: TUniContainerPanel;
    UniLabel111: TUniLabel;
    UniEditprotocoloacesso: TUniEdit;
    rcBlock2030: TUniContainerPanel;
    UniLabel112: TUniLabel;
    UniEditchaveacesso: TUniEdit;
    rcBlock2020: TUniContainerPanel;
    btnENVIA: TUniBitBtn;
    btnSTATUS: TUniBitBtn;
    UniTabSheetentregafutura: TUniTabSheet;
    rcBlock1300: TUniContainerPanel;
    UniDBGrid13: TUniDBGrid;
    rcBlock655: TUniContainerPanel;
    UniLabel113: TUniLabel;
    UniDBFormattedNumberEditSERIENOTA: TUniDBFormattedNumberEdit;
    UniTabSheetkardexmanulote: TUniTabSheet;
    UniDBGrid14: TUniDBGrid;
    UniDBCheckBox8: TUniDBCheckBox;
    rcBlock680: TUniContainerPanel;
    UniDBComboBoxPRODUTOR: TUniDBComboBox;
    UniLabel114: TUniLabel;
    rcBlock1255: TUniContainerPanel;
    UniDBComboBox4: TUniDBComboBox;
    UniLabel115: TUniLabel;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure tbhistpessoasimpGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniButtonDbEditcodigofuncionariomestreButtonClick(
      Sender: TObject);
    procedure UniButtonDbEditcodigofuncionariomestreExit(Sender: TObject);
    procedure btnLkpClearClick(Sender: TObject);
    procedure UniBitBtnvalidasenhanotaClick(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure UniBitBtn3Click(Sender: TObject);
    procedure UniBitBtn4Click(Sender: TObject);
    procedure UniDBGridtitulosCellClick(Column: TUniDBGridColumn);
    procedure UniBitBtn2Click(Sender: TObject);
    procedure uniFileUpCompleted(Sender: TObject; AStream: TFileStream);
    procedure btnempgravaClick(Sender: TObject);
    procedure btnempincluiClick(Sender: TObject);
    procedure UniBitBtn8Click(Sender: TObject);
    procedure UniBitBtn7Click(Sender: TObject);
    procedure UniDBGrid3DrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure UniBitBtn11Click(Sender: TObject);
    procedure UniButtonEditcodbancosButtonClick(Sender: TObject);
    procedure UniButtonEditcadplanocontasButtonClick(Sender: TObject);
    procedure UniButtonEditcadpessoasButtonClick(Sender: TObject);
    procedure UniButtonEditcodbancosExit(Sender: TObject);
    procedure UniButtonEditcadplanocontasExit(Sender: TObject);
    procedure UniButtonEditcadpessoasExit(Sender: TObject);
    procedure UniBitBtn9Click(Sender: TObject);
    procedure UniBitBtn10Click(Sender: TObject);
    procedure UniBitBtn12Click(Sender: TObject);
    procedure btnpermitetudoClick(Sender: TObject);
    procedure btndesmarcatudoClick(Sender: TObject);
    procedure btnalteraClick(Sender: TObject);
    procedure btngravaClick(Sender: TObject);
    procedure btneditempresaButtonClick(Sender: TObject);
    procedure btneditcopiafunButtonClick(Sender: TObject);
    procedure btncopiaClick(Sender: TObject);
    procedure UniBitBtn14Click(Sender: TObject);
    procedure UniBitBtn13Click(Sender: TObject);
    procedure UniDBGridDADOSXMLCellClick(Column: TUniDBGridColumn);
    procedure UniBitBtn15Click(Sender: TObject);
    procedure UniDBGrid5CellClick(Column: TUniDBGridColumn);
    procedure btnentradatransfClick(Sender: TObject);
    procedure UniDBGrid6CellClick(Column: TUniDBGridColumn);
    procedure UniButtonEditcooperanteButtonClick(Sender: TObject);
    procedure UniBitBtnbuscakardexprodutoClick(Sender: TObject);
    procedure UniDBGridEntregaCellClick(Column: TUniDBGridColumn);
    procedure L1Click(Sender: TObject);
    procedure UniDBGridEntregaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure UniDBGridfinanceirodocDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure ubtnimpressaoClick(Sender: TObject);
    procedure UniDBGrid12DrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure UniFormResize(Sender: TObject);
    procedure UniBitBtn17Click(Sender: TObject);
    procedure UniBitBtn16Click(Sender: TObject);
    procedure btnENVIAClick(Sender: TObject);
    procedure btnSTATUSClick(Sender: TObject);
    procedure UniDBGrid13DblClick(Sender: TObject);
    procedure UniDBGrid14DrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure FecharTela(Sender: TObject; var Action: TCloseAction);
  private
    FFrameLote: TfraSelecaoLote;
    FLoteOriginal: string;
    FLoteConfirmado: Boolean;
    FLarguraAnterior, FAlturaAnterior: Integer;
    r, i: Integer;
    { Private declarations }
  posicao_x_entrega,
  posicao_y_entrega    : Integer;
    procedure ConfirmarLote(Sender: TObject);
    procedure CancelarLote(Sender: TObject);
  public
    { Public declarations }
    cMSG_BUGERROR_RECORDS_SELECTION,
    cMSG_RECORDS_FOUND : string ;
    cFormModal         : TUniForm;

  procedure  CALCULA_ICMS(F_TIPO:String);
  function   ALIQ_ICMS():real;
  function   BASE_ICMS():real;
  procedure  Ativa_page(Const F_CADASTROS:String; F_PAGINAS:array of String);
  procedure  CRUD_permissao(acao:string);
  procedure  Permissao(acao:string);
  procedure  CopiaPermissao(pcodfunc:integer);
  procedure  Carrega_ItensXml();
  procedure  Cadastra_Pessoa(const F_CPFCNPJ:string);
  procedure  Produto_Fornecedor();
  procedure  CarregaProduto(const pcodigo:string);
  procedure  ConfiguraAcbr(aempresa:integer);
  end;

function frmTELAGENERICA: TfrmTELAGENERICA;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, uconsts, mkm_funcoes, untDM_RC, mkm_procedures,
  untFrmPesquisa, mkm_func_web, mkm_relatorios, untfrmPesquisalote,
  mkm_impressao, unReportImpressao, System.DateUtils, untFrmCADENTREGAS,
  mkm_regrasnegocio, untFrmIMPRESSAOENTREGAPARCIAL, pcnConversao, ACBrDFeSSL,
  blcksock, pmdfeConversaoMDFe;

function frmTELAGENERICA: TfrmTELAGENERICA;
begin
  Result := TfrmTELAGENERICA(mm.GetFormInstance(TfrmTELAGENERICA));
end;

function TfrmTELAGENERICA.ALIQ_ICMS: real;
begin
  result := UniFormattedNumberpercicms.value;
end;

procedure TfrmTELAGENERICA.Ativa_page(const F_CADASTROS: String;F_PAGINAS: array of String);
var
 x,R : Integer;
begin
  for R := 0 to ComponentCount - 1 do
    if (Components[R] is TUniTabSheet ) then
      begin
        if Busca_Array(Copy((Components[R] as TUniTabSheet).Name,11,12),F_PAGINAS) then
          begin
             if (Components[R] as TUniTabSheet).TabVisible = False then
               (Components[R] as TUniTabSheet).TabVisible := True;
          end
        else
          (Components[R] as TUniTabSheet).TabVisible := False;
      end;

  for R:=0 to High(F_PAGINAS) do
    begin
      if 'CONTROLEPONTOS'              = F_PAGINAS[R] then UniTabSheetcontrolepontos.TabVisible              := True;
      if 'HISTORICOFATURAMENTO'        = F_PAGINAS[R] then UniTabSheethistoriconotasfaturada.TabVisible      := True;
      if 'HISTORICOPRODUTOPESSOA'      = F_PAGINAS[R] then UniTabSheethistprodutopessoa.TabVisible           := True;
      if 'HISTORICOLOTEPESSOA'         = F_PAGINAS[R] then UniTabSheethistlotespessoa.TabVisible             := True;
      if 'HISTORICOVENDALOTE'          = F_PAGINAS[R] then UniTabSheethistvendalote.TabVisible               := True;
      if 'DETALHESEMISSORDOC'          = F_PAGINAS[R] then UniTabSheettdetalhesemissor.TabVisible            := True;
      if 'ALTERADETALHESNOTA'          = F_PAGINAS[R] then UniTabSheetalteranotaeletronica.TabVisible        := True;
      if 'SENHAEXCLUSAONOTA'           = F_PAGINAS[R] then UniTabSheetsenhaexclusaonota.TabVisible           := True;
      if 'PARCELAPGTOMOVIMENTO'        = F_PAGINAS[R] then UniTabSheetparcelaspgto.TabVisible                := True;
      if 'LOGNOTAELETRONICA'           = F_PAGINAS[R] then UniTabSheetlognota.TabVisible                     := True;
      if 'CONFIGURANOTAELETRONICA'     = F_PAGINAS[R] then UniTabSheetConfiguranotaeletronica.TabVisible     := True;
      if 'CALCULAICMS'                 = F_PAGINAS[R] then UniTabSheetcalculaicms.TabVisible                 := True;
      if 'EMPRESACONFIGURA'            = F_PAGINAS[R] then UniTabSheetDetalhesempresa.TabVisible             := True;
      if 'LOGBATIDAMESTRE'             = F_PAGINAS[R] then UniTabSheetreceitalote.TabVisible                 := True;
      if 'LOGMANIFESTO'                = F_PAGINAS[R] then UniTabSheetlogmanifesto.TabVisible                := True;
      if 'FINANCEIRONOTA'              = F_PAGINAS[R] then UniTabSheettitulosnota.TabVisible                 := True;
      if 'PARCELATITULOS'              = F_PAGINAS[R] then UniTabSheetparcelasfinanceiro.TabVisible          := True;
      if 'LOGTITULOS'                  = F_PAGINAS[R] then UniTabSheetlogtitulos.TabVisible                  := True;
      if 'LOGBANCOS'                   = F_PAGINAS[R] then UniTabSheetloglancamentobancario.TabVisible       := True;
      if 'EXIBEDADOS'                  = F_PAGINAS[R] then UniTabSheetexiberastreio.TabVisible               := True;
      if 'PERMISSAO'                   = F_PAGINAS[R] then UniTabSheetpermusuario.TabVisible                 := True;
      if 'ENTRADAXML'                  = F_PAGINAS[R] then UniTabSheetcapturaXML.TabVisible                  := True;
      if 'ENTRADAXMLDADOS'             = F_PAGINAS[R] then UniTabSheetdadosxmlentrada.TabVisible             := True;
      if 'ENTRADAXMLFINANCEIRO'        = F_PAGINAS[R] then UniTabSheetfinanceiroxml.TabVisible               := True;
      if 'LOTENOTAENTRADA'             = F_PAGINAS[R] then UniTabSheetentradasemente.TabVisible              := True;
      if 'TERMONOTA'                   = F_PAGINAS[R] then UniTabSheettermonota.TabVisible                   := True;
      if 'KARDEXPRODUTO'               = F_PAGINAS[R] then UniTabSheetKARDEXPRODUTO.TabVisible               := True;
      if 'HISTORICOBENEPONTO'          = F_PAGINAS[R] then UniTabSheetHISTORICOLOTEPONTOBENE.TabVisible      := True;
      if 'BLOCOK200'                   = F_PAGINAS[R] then UniTabSheetblocok200.TabVisible                   := True;
      if 'MEDIDAS'                     = F_PAGINAS[R] then UniTabSheetmedidassped.TabVisible                 := True;
      if 'OPERACAOSPED'                = F_PAGINAS[R] then UniTabSheetoperacaosped.TabVisible                := True;
      if 'PESSOASSPED'                 = F_PAGINAS[R] then UniTabSheetpessoassped.TabVisible                 := True;
      if 'LISTAENTREGA'                = F_PAGINAS[R] then UniTabSheetcontroleentregas.TabVisible            := True;
      if 'FINANCEIRODOC'               = F_PAGINAS[R] then UniTabSheetfinanceirodoc.TabVisible               := True;
      if 'PEDIDOFINANCEIRO'            = F_PAGINAS[R] then UniTabSheetfinanceiropedido.TabVisible            := True;
      if 'ENCERRAMANIFESTO'            = F_PAGINAS[R] then UniTabSheetencerramanifesto.TabVisible            := True;
      if 'ENTREGAFUTURA'               = F_PAGINAS[R] then UniTabSheetentregafutura.TabVisible               := True;
      if 'KARDEXMANULOTE'              = F_PAGINAS[R] then UniTabSheetkardexmanulote.TabVisible              := True;
    end;


  if F_CADASTROS = 'CONTROLEPONTOS'               then UniPageControltela.ActivePage := UniTabSheetcontrolepontos               else
  if F_CADASTROS = 'HISTORICOFATURAMENTO'         then UniPageControltela.ActivePage := UniTabSheethistoriconotasfaturada       else
  if F_CADASTROS = 'HISTORICOPRODUTOPESSOA'       then UniPageControltela.ActivePage := UniTabSheethistprodutopessoa            else
  if F_CADASTROS = 'HISTORICOLOTEPESSOA'          then UniPageControltela.ActivePage := UniTabSheethistlotespessoa              else
  if F_CADASTROS = 'HISTORICOVENDALOTE'           then UniPageControltela.ActivePage := UniTabSheethistvendalote                else
  if F_CADASTROS = 'DETALHESEMISSORDOC'           then UniPageControltela.ActivePage := UniTabSheettdetalhesemissor             else
  if F_CADASTROS = 'ALTERADETALHESNOTA'           then UniPageControltela.ActivePage := UniTabSheetalteranotaeletronica         else
  if F_CADASTROS = 'SENHAEXCLUSAONOTA'            then UniPageControltela.ActivePage := UniTabSheetsenhaexclusaonota            else
  if F_CADASTROS = 'PARCELAPGTOMOVIMENTO'         then UniPageControltela.ActivePage := UniTabSheetparcelaspgto                 else
  if F_CADASTROS = 'LOGNOTAELETRONICA'            then UniPageControltela.ActivePage := UniTabSheetlognota                      else
  if F_CADASTROS = 'CONFIGURANOTAELETRONICA'      then UniPageControltela.ActivePage := UniTabSheetConfiguranotaeletronica      else
  if F_CADASTROS = 'CALCULAICMS'                  then UniPageControltela.ActivePage := UniTabSheetcalculaicms                  else
  if F_CADASTROS = 'EMPRESACONFIGURA'             then UniPageControltela.ActivePage := UniTabSheetConfiguranotaeletronica      else
  if F_CADASTROS = 'LOGBATIDAMESTRE '             then UniPageControltela.ActivePage := UniTabSheetreceitalote                  else
  if F_CADASTROS = 'LOGMANIFESTO'                 then UniPageControltela.ActivePage := UniTabSheetlogmanifesto                 else
  if F_CADASTROS = 'FINANCEIRONOTA'               then UniPageControltela.ActivePage := UniTabSheettitulosnota                  else
  if F_CADASTROS = 'PARCELATITULOS'               then UniPageControltela.ActivePage := UniTabSheetparcelasfinanceiro           else
  if F_CADASTROS = 'LOGTITULOS'                   then UniPageControltela.ActivePage := UniTabSheetlogtitulos                   else
  if F_CADASTROS = 'LOGBANCOS'                    then UniPageControltela.ActivePage := UniTabSheetloglancamentobancario        else
  if F_CADASTROS = 'EXIBEDADOS'                   then UniPageControltela.ActivePage := UniTabSheetexiberastreio                else
  if F_CADASTROS = 'PERMISSAO'                    then UniPageControltela.ActivePage := UniTabSheetpermusuario                  else
  if F_CADASTROS = 'ENTRADAXML'                   then UniPageControltela.ActivePage := UniTabSheetcapturaXML                   else
  if F_CADASTROS = 'ENTRADAXMLDADOS'              then UniPageControltela.ActivePage := UniTabSheetdadosxmlentrada              else
  if F_CADASTROS = 'ENTRADAXMLFINANCEIRO'         then UniPageControltela.ActivePage := UniTabSheetfinanceiroxml                else
  if F_CADASTROS = 'LOTENOTAENTRADA'              then UniPageControltela.ActivePage := UniTabSheetentradasemente               else
  if F_CADASTROS = 'TERMONOTA'                    then UniPageControltela.ActivePage := UniTabSheettermonota                    else
  if F_CADASTROS = 'KARDEXPRODUTO'                then UniPageControltela.ActivePage := UniTabSheetKARDEXPRODUTO                else
  if F_CADASTROS = 'HISTORICOBENEPONTO'           then UniPageControltela.ActivePage := UniTabSheetHISTORICOLOTEPONTOBENE       else
  if F_CADASTROS = 'BLOCOK200'                    then UniPageControltela.ActivePage := UniTabSheetblocok200                    else
  if F_CADASTROS = 'MEDIDAS'                      then UniPageControltela.ActivePage := UniTabSheetmedidassped                  else
  if F_CADASTROS = 'OPERACAOSPED'                 then UniPageControltela.ActivePage := UniTabSheetoperacaosped                 else
  if F_CADASTROS = 'PESSOASSPED'                  then UniPageControltela.ActivePage := UniTabSheetpessoassped                  else
  if F_CADASTROS = 'LISTAENTREGA'                 then UniPageControltela.ActivePage := UniTabSheetcontroleentregas             else
  if F_CADASTROS = 'FINANCEIRODOC'                then UniPageControltela.ActivePage := UniTabSheetfinanceirodoc                else
  if F_CADASTROS = 'PEDIDOFINANCEIRO'             then UniPageControltela.ActivePage := UniTabSheetfinanceiropedido             else
  if F_CADASTROS = 'ENCERRAMANIFESTO'             then UniPageControltela.ActivePage := UniTabSheetencerramanifesto             else
  if F_CADASTROS = 'ENTREGAFUTURA'                then UniPageControltela.ActivePage := UniTabSheetentregafutura                else
  if F_CADASTROS = 'KARDEXMANULOTE'               then UniPageControltela.ActivePage := UniTabSheetkardexmanulote               else
end;

function TfrmTELAGENERICA.BASE_ICMS: real;
begin
  result := UniFormattedNumberpercreducao.value;
end;

procedure TfrmTELAGENERICA.btnEditRegClick(Sender: TObject);
begin
  dm_rc.tbtitulos.Edit;
end;

procedure TfrmTELAGENERICA.btnentradatransfClick(Sender: TObject);
begin
  mm.varS_LOTENOTAENTRADA       := UniEditloteentrada.Text;
  mm.varS_PUREZANOTAENTRADA     := UniFormattedNumberEditpurezaentrada.Value;
  mm.varS_VCNOTAENTRADA         := UniFormattedNumberEditvcentrada.Value;
  mm.varS_GERMINACAONOTAENTRADA := UniFormattedNumberEditgerminacaoentrada.Value;

  mm.varC_COOPERANTE            := StrToInt(UniButtonEditcooperante.Text);
  mm.varC_SAFRACAMPO            := UniEditsafracampocooperante.Text;
  mm.varC_CAMPO                 := UniEditcampocooperante.Text;

  ModalResult := mrOK;
end;

procedure TfrmTELAGENERICA.btnENVIAClick(Sender: TObject);
var
  NumeroLote : integer;
begin

  if UniEditchaveacesso.Text = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'INFORMAR CHAVE DE ACESSO' , 'error');
      Abort
    end;

  if UniEditprotocoloacesso.Text = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'INFORMAR PROTOCOLO DO MANIFESTO' , 'error');
      Abort
    end;

  ConfiguraAcbr(mm.varI_Code_Company);
  TabelaMfmestre('select * from mfmestre where codigo  = ' + IntToStr(mm.varI_Code_Documento_Controle));
  TabelaEmpresas('select * from empresas  where codigo = ' + IntToStr(mm.varI_Code_Company));

  UniMemorespostaTXT.Clear;
  UniMemorespxml.Clear;

  try
    dm_rc.ACBrMDFe.Manifestos.Clear;
    dm_rc.ACBrMDFe.EventoMDFe.idLote       := NumeroLote;
    dm_rc.ACBrMDFe.EventoMDFe.Evento.Clear;

    with dm_rc.ACBrMDFe.EventoMDFe.Evento.Add do
      begin
        infEvento.chMDFe          := StrAllTrim(UniEditchaveacesso.Text);
        infEvento.detEvento.nProt := StrAllTrim(UniEditprotocoloacesso.text);
        infEvento.CNPJCPF         := dm_rc.tbempresas.FindField('CNPJ').AsString;
        infEvento.dhEvento        := now;
        infEvento.tpEvento        := teEncerramento;
        infEvento.nSeqEvento      := 1;
        infEvento.detEvento.dtEnc := Date;
        infEvento.detEvento.cUF   := StrToInt(copy(dm_rc.tbempresas.findfield('IBGE').AsString,1,2));
        infEvento.detEvento.cMun  := dm_rc.tbempresas.FindField('IBGE').AsInteger;
      end;

    dm_rc.ACBrMDFe.EnviarEvento(NumeroLote);
    UniMemorespostaTXT.Lines.Add('Resposta: ' + dm_rc.ACBrMDFe.WebServices.EnvEvento.EventoRetorno.xMotivo);
    UniMemorespxml.Lines.Text            := UTF8Encode(dm_rc.ACBrMDFe.WebServices.EnvEvento.RetornoWS);
  except
    on e:exception do
      begin
        gera_log(e.Message);
        UniMemorespostaTXT.Lines.Add('Motivo.......: ' + dm_rc.ACBrMDFe.WebServices.EnvEvento.EventoRetorno.xMotivo);
        UniMemorespxml.Lines.Add('SEM CONEXÃO COM A SEFAZ - TENTE MAIS TARDE');
      end;
  end;
end;

procedure TfrmTELAGENERICA.btngravaClick(Sender: TObject);
begin
  Permissao     ('grava');
  CRUD_permissao('grava');
end;

procedure TfrmTELAGENERICA.ConfirmarLote(Sender: TObject);
begin
  mm.varC_codigo_busca_lote := FFrameLote.LoteSelecionado;
  FLoteConfirmado := True;
  ModalResult := mrOK;
end;

procedure TfrmTELAGENERICA.CancelarLote(Sender: TObject);
begin
  mm.varC_codigo_busca_lote := FLoteOriginal;
  ModalResult := mrCancel;
end;

procedure TfrmTELAGENERICA.FecharTela(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FFrameLote) then
  begin
    if not FLoteConfirmado then mm.varC_codigo_busca_lote := FLoteOriginal;
    FreeAndNil(FFrameLote);
    ClientWidth := FLarguraAnterior;
    ClientHeight := FAlturaAnterior;
  end;
end;

procedure TfrmTELAGENERICA.btnLkpClearClick(Sender: TObject);
begin
  if mm.VarC_Atelagenerica = 'PARCELATITULOS' then
    dm_rc.tbtitulos.Close;

  ModalResult := mrOK;
end;

procedure TfrmTELAGENERICA.btnNewRegClick(Sender: TObject);
begin
  dm_rc.tbtitulos.Append;
  dm_rc.tbtitulos.FindField('PARCELA').AsInteger := dm_rc.tbtitulos.RecordCount + 1;
end;

procedure TfrmTELAGENERICA.Cadastra_Pessoa(const F_CPFCNPJ:string);
begin
  if not SqlPesquisa('SELECT * FROM PESSOAS WHERE CPFCNPJ = ' + QuotedStr(F_CPFCNPJ) + ' AND ATIVO = ' + QuotedStr('T')) then
    begin
      TabelaPessoas('SELECT * FROM PESSOAS WHERE CODIGO = 999999');

      dm_rc.FDQryPessoas.Append;
      dm_rc.FDQryPessoas.FindField('ATIVO').AsString        := 'T';
      dm_rc.FDQryPessoas.FindField('CADASTRO').AsDateTime   := Date;
      dm_rc.FDQryPessoas.FindField('TIPO').AsString         := 'Fornecedor';
      dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString      := RemoverEspeciais(dm_rc.AcbrNfe.NotasFiscais.Items[0].NFe.Emit.CNPJCPF);
      dm_rc.FDQryPessoas.FindField('INSCRICAO').AsString    := RemoverEspeciais(dm_rc.AcbrNfe.NotasFiscais.Items[0].NFe.Emit.IE);
      dm_rc.FDQryPessoas.FindField('NOME').AsString         := UpperCase(dm_rc.AcbrNfe.NotasFiscais.Items[0].NFe.Emit.xNome);
      dm_rc.FDQryPessoas.FindField('FANTASIA').AsString     := UpperCase(dm_rc.AcbrNfe.NotasFiscais.Items[0].NFe.Emit.xFant);
      dm_rc.FDQryPessoas.FindField('FUNCIONARIO').AsInteger := mm.varI_User;
      dm_rc.FDQryPessoas.FindField('CEP').AsInteger         := dm_rc.AcbrNfe.NotasFiscais.Items[0].NFe.Emit.EnderEmit.CEP;
      dm_rc.FDQryPessoas.FindField('ENDERECO').AsString     := UpperCase(RemoverEspeciais(dm_rc.AcbrNfe.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xLgr));
      dm_rc.FDQryPessoas.FindField('NUMERO').AsString       := RemoverEspeciais(dm_rc.AcbrNfe.NotasFiscais.Items[0].NFe.Emit.EnderEmit.nro);
      dm_rc.FDQryPessoas.FindField('BAIRRO').AsString       := UpperCase(RemoverEspeciais(dm_rc.AcbrNfe.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xBairro));
      dm_rc.FDQryPessoas.FindField('CIDADE').AsString       := UpperCase(RemoverEspeciais(dm_rc.AcbrNfe.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xMun));
      dm_rc.FDQryPessoas.FindField('ESTADO').AsString       := UpperCase(dm_rc.AcbrNfe.NotasFiscais.Items[0].NFe.Emit.EnderEmit.UF);
      dm_rc.FDQryPessoas.FindField('IBGEENTREGA').AsInteger := dm_rc.AcbrNfe.NotasFiscais.Items[0].NFe.Emit.EnderEmit.cPais;
      dm_rc.FDQryPessoas.FindField('PAIS').AsString         := UpperCase(dm_rc.AcbrNfe.NotasFiscais.Items[0].NFe.Emit.EnderEmit.xPais);
      dm_rc.FDQryPessoas.FindField('IBGE').AsInteger        := dm_rc.AcbrNfe.NotasFiscais.Items[0].NFe.Emit.EnderEmit.cMun;
      dm_rc.FDQryPessoas.FindField('TELEFONE').AsString     := dm_rc.AcbrNfe.NotasFiscais.Items[0].NFe.Emit.EnderEmit.fone;
      dm_rc.FDQryPessoas.FindField('CODIGO').AsInteger      := Ultimo_Codigo('PESSOAS','CODIGO',True);
      dm_rc.FDQryPessoas.FindField('KEY').AsString          := Gera_Guid();
      dm_rc.FDQryPessoas.Post;

      UniEditxmlpessoa.Text        := IntToStr(dm_rc.FDQryPessoas.Findfield('CODIGO').AsInteger);
      UniEditxmlnomepessoa.Text    := dm_rc.FDQryPessoas.Findfield('NOME').AsString;
      UniEditxmlcidadepessoa.Text  := dm_rc.FDQryPessoas.Findfield('CIDADE').AsString;
      UniEditxmlufpessoa.Text      := dm_rc.FDQryPessoas.Findfield('ESTADO').AsString;

      try
      except
        dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NÃO CONSEGUI GRAVAR O FORNECEDOR -> SUGESTÃO -> FAÇA O CADASTRO DESTE FORNECEDOR, DEPOIS VOLTE A DAR ENTRADA NA NOTA' , 'error' );
        abort;
      end;
      //****************************************************************************************************//

    end
  else
    begin
      UniEditxmlpessoa.Text       := IntToStr(dm_rc.sqlBuscas.Findfield('CODIGO').AsInteger);
      UniEditxmlnomepessoa.Text   := dm_rc.sqlBuscas.Findfield('NOME').AsString;
      UniEditxmlcidadepessoa.Text := dm_rc.sqlBuscas.Findfield('CIDADE').AsString;
      UniEditxmlufpessoa.Text     := dm_rc.sqlBuscas.Findfield('ESTADO').AsString;
    end;
end;

procedure TfrmTELAGENERICA.CALCULA_ICMS(F_TIPO: String);
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

begin

  M_MARCA  := dm_rc.memprodutos.GetBookmark;
  M_SAITOT := 0;

  dm_rc.memprodutos.DisableControls;
  dm_rc.memprodutos.AfterDelete  := nil;
  dm_rc.memprodutos.AfterPost    := nil;
  dm_rc.memprodutos.BeforeDelete := nil;
  dm_rc.memprodutos.BeforePost   := nil;
  dm_rc.memprodutos.First;

  M_SAIVLP := 0;
  M_SAIVIP := 0;
  M_SAIBIC := 0;
  M_SAIVIC := 0;
  M_SAIVLN := 0;

  while not dm_rc.memprodutos.eof do
    begin
      if dm_rc.memprodutos.FindField('Produto').AsInteger > 0 then  // Zera os campos da tabela para recáculo
        begin
          dm_rc.memprodutos.Edit;
          dm_rc.memprodutos.FindField('ValorIpi').AsFloat  := 0;
          dm_rc.memprodutos.FindField('Despesa').AsFloat   := varIIF(dm_rc.memprodutos.FindField('Despesa').AsFloat  = 0,0,dm_rc.memprodutos.FindField('Despesa').AsFloat);
          dm_rc.memprodutos.FindField('Desconto').AsFloat  := vARIIF(dm_rc.memprodutos.FindField('Desconto').AsFloat = 0,0,dm_rc.memprodutos.FindField('Desconto').AsFloat);
          dm_rc.memprodutos.FindField('BaseIcms').AsFloat  := 0;
          dm_rc.memprodutos.FindField('PercIcms').AsFloat  := 0;
          dm_rc.memprodutos.FindField('ValorIcms').AsFloat := 0;
          dm_rc.memprodutos.FindField('ValorIpi').AsFloat  := 0;
          dm_rc.memprodutos.Post;
        end;
      dm_rc.memprodutos.next;
    end;

    M_SAITOT := 0;
    dm_rc.memprodutos.First;
    while not dm_rc.memprodutos.eof do
      begin
        if dm_rc.memprodutos.FindField('Produto').AsInteger > 0 then
          begin
             M_SAITOT := M_SAITOT + dm_rc.memprodutos.FindField('Total').AsFloat;
          end;
        dm_rc.memprodutos.next;
        Application.ProcessMessages;
      end;

  dm_rc.memprodutos.First;
  while not dm_rc.memprodutos.eof do
    begin
      if dm_rc.memprodutos.FindField('Produto').AsInteger > 0 then
        begin
          dm_rc.memprodutos.Edit;
          dm_rc.memprodutos.FindField('PercIcms').AsFloat    := Aliq_Icms();
          dm_rc.memprodutos.FindField('percreducao').AsFloat := MRound(Base_Icms(),2);
          dm_rc.memprodutos.FindField('BaseIcms').AsFloat    := (dm_rc.memprodutos.FindField('Total').Value + dm_rc.memprodutos.FindField('ValorIpi').Value + dm_rc.memprodutos.FindField('Despesa').Value - dm_rc.memprodutos.FindField('Desconto').Value); // soma ipi + dsp na base icms
          dm_rc.memprodutos.FindField('BaseIcms').AsFloat    := MRound((dm_rc.memprodutos.FindField('BaseIcms').Value / 100) * variif(Base_Icms() = 0,100,Base_Icms()), 2);
          dm_rc.memprodutos.FindField('ValorIcms').AsFloat   := MRound((dm_rc.memprodutos.FindField('BaseIcms').Value / 100) * Aliq_Icms(), 2);

          if dm_rc.memprodutos.FindField('ValorIcms').AsFloat = 0 then dm_rc.memprodutos.FindField('BaseIcms').AsFloat := 0;
          dm_rc.memprodutos.Post;
        end;
      dm_rc.memprodutos.next;
    end;

  // calcula totais da nota
    dm_rc.memprodutos.First;
    while not dm_rc.memprodutos.eof do
      begin
        if dm_rc.memprodutos.FindField('Produto').AsInteger > 0 then
          begin
            M_SAIVLP := M_SAIVLP + dm_rc.memprodutos.FindField('Total').AsFloat;
            M_SAIVIP := M_SAIVIP + dm_rc.memprodutos.FindField('ValorIpi').AsFloat;
            M_SAIBIC := M_SAIBIC + dm_rc.memprodutos.FindField('BaseIcms').AsFloat;
            M_SAIVIC := M_SAIVIC + dm_rc.memprodutos.FindField('ValorIcms').AsFloat;
            M_SAIVLN := M_SAIVLN + (dm_rc.memprodutos.FindField('Total').AsFloat + dm_rc.memprodutos.FindField('ValorIpi').AsFloat + dm_rc.memprodutos.FindField('Despesa').AsFloat);
          end;
        dm_rc.memprodutos.next;
        Application.ProcessMessages;
      end;


  UniFormattedNumberBASEICMS.value   := M_SAIBIC;
  UniFormattedNumberVALORICMS.value  := M_SAIVIC;

  dm_rc.memprodutos.EnableControls;
  dm_rc.memprodutos.GotoBookmark(M_MARCA);
  dm_rc.memprodutos.FreeBookmark(M_MARCA);

  dm_rc.memprodutos.Refresh;
end;

procedure TfrmTELAGENERICA.CarregaProduto(const pcodigo: string);
var
  sql:string;
begin
  sql := ' select *                                         ' +
         ' from produtos P                                  ' +
         ' inner join saldos on (p.codigo = saldos.produto) ' +
         ' where P.codigo                                =  ' + QuotedStr(pcodigo) +
         ' and saldos.empresa                            =  ' + IntToStr(mm.varI_Code_Company);

  if not SqlPesquisa(sql) then
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não encontrei esse Produto' , 'warning')
  else
    begin
      dm_rc.memprodutos.Edit;
      dm_rc.memprodutos.FindField('PRODUTO').AsInteger        := StrToInt(pcodigo);
      dm_rc.memprodutos.FindField('DESCRICAO').AsString       := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
      dm_rc.memprodutos.FindField('UNIDADE').AsString         := dm_rc.sqlBuscas.FindField('UNIDADE').AsString;

      dm_rc.memprodutos.FindField('NCM').AsString             := dm_rc.sqlBuscas.FindField('NUMERONCM').AsString;
      dm_rc.memprodutos.FindField('NUMERONCM').AsString       := dm_rc.sqlBuscas.FindField('NUMERONCM').AsString;
      dm_rc.memprodutos.FindField('UNIDADE').AsString         := dm_rc.sqlBuscas.FindField('UNIDADE').AsString;

      dm_rc.memprodutos.FindField('SITUACAOLOCAL').AsString   := dm_rc.sqlBuscas.FindField('SITUACAOLOCAL').AsString;
      dm_rc.memprodutos.FindField('SITUACAOOUTRAS').AsString  := dm_rc.sqlBuscas.FindField('SITUACAOOUTRAS').AsString;

      dm_rc.memprodutos.FindField('PIS').AsString             := dm_rc.sqlBuscas.FindField('PIS').AsString;
      dm_rc.memprodutos.FindField('COFINS').AsString          := dm_rc.sqlBuscas.FindField('COFINS').AsString;
    end;
end;

procedure TfrmTELAGENERICA.Carrega_ItensXml();
var
  parc : integer;
  i,f: integer;
begin
  dm_rc.memprodutos.Close;
  dm_rc.memprodutos.Open;

  dm_rc.tbmedida.Close;
  dm_rc.tbmedida.Open;

 i     := 0;
 parc  := 0;
 for i := 0 to dm_rc.ACBrNFe.NotasFiscais.Count - 1 do
   begin
      with dm_rc.ACBrNFe.NotasFiscais.Items[i].NFe do
      begin
        if SqlPesquisa('select emissao from mvmestre where codigobarras = ' + QuotedStr(Trim(Copy(dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID,4,44))) +
                       'and empresa                                     = ' + IntToStr(mm.varI_Code_Company)) then
          begin
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NOTA DE COMPRA LANÇADA NA DATA DE  ' + QuotedStr(dm_rc.sqlBuscas.FindField('EMISSAO').AsString)  , 'error');
            Abort;
          end;      
          
        Cadastra_Pessoa(dm_rc.ACBrNFe.NotasFiscais.Items[i].NFe.Emit.CNPJCPF);

        UniEditxmlnumeronota.Text                    := IntToStr(dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Ide.nNF);
        UniDateTimePickerxmlemissao.DateTime         := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Ide.dEmi;
        UniEditxmlchaveacesso.Text                   := Copy(dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID,4,44);

        UniFormattedNumberEditvlrprodutos.Value      := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Total.ICMSTot.vProd;
        UniFormattedNumberEditvlrtotal.Value         := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Total.ICMSTot.vNF;
        UniFormattedNumberEditvlrbaseicms.Value      := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Total.ICMSTot.vBC;
        UniFormattedNumberEditvlricms.Value          := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Total.ICMSTot.vICMS;

        for f := 0 to Cobr.Dup.count - 1 do
          begin
            with Cobr.Dup.Items[i] do
              begin
                Inc(parc);
                dm_rc.tbtitulos.Append;
                dm_rc.tbtitulos.FindField('PARCELA').AsInteger     := parc;
                dm_rc.tbtitulos.FindField('VALOR').AsFloat         := vDup;
                dm_rc.tbtitulos.FindField('VENCIMENTO').AsDateTime := dVenc;
                dm_rc.tbtitulos.Post;
              end;
          end;


         for f := 0 to Det.Count - 1 do
           begin
              with Det.Items[I] do
                begin
                  dm_rc.memprodutos.Append;
                  Produto_Fornecedor();

                  dm_rc.memprodutos.FindField('DESCRICAO').AsString        := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Prod.xProd;
                  dm_rc.memprodutos.FindField('FORNECEDORCODIGO').AsString := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Prod.cProd;
                  dm_rc.memprodutos.FindField('UNIDADE').AsString          := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Prod.uTrib;
                  dm_rc.memprodutos.FindField('QUANTIDADE').AsFloat        := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Prod.qCom;
                  dm_rc.memprodutos.FindField('PRECO').AsFloat             := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Prod.vUnCom;
                  dm_rc.memprodutos.FindField('TOTAL').AsFloat             := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Prod.vProd;
                  dm_rc.memprodutos.FindField('DESCONTO').AsFloat          := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Prod.vDesc;
                  dm_rc.memprodutos.FindField('CFOPENTRADA').AsString      := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Prod.CFOP;
                  dm_rc.memprodutos.FindField('DESCONTO').AsFloat          := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Prod.vDesc;
                  dm_rc.memprodutos.FindField('FRETE').AsFloat             := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Prod.vFrete;
                  dm_rc.memprodutos.FindField('NCM').AsString              := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Prod.NCM;
                  dm_rc.memprodutos.FindField('TOTAL').AsFloat             := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Prod.vProd;

                  //***********************************************************************************************************
                  //IMPOSTOS
                  //***********************************************************************************************************
                  dm_rc.memprodutos.FindField('BASEICMS').AsFloat      := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Imposto.ICMS.vBC;
                  dm_rc.memprodutos.FindField('VALORICMS').AsFloat     := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Imposto.ICMS.vICMS;
                  dm_rc.memprodutos.FindField('PERCICMS').AsFloat      := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Imposto.ICMS.pICMS;
                  dm_rc.memprodutos.FindField('VALORST').AsFloat       := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Imposto.ICMS.vICMSST;
                  dm_rc.memprodutos.FindField('BASEST').AsFloat        := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Imposto.ICMS.vBCST;
                  dm_rc.memprodutos.FindField('VALORIPI').AsFloat      := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Imposto.IPI.vIPI;
                  dm_rc.memprodutos.FindField('PERCIPI').AsFloat       := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Imposto.IPI.pIPI;
                  dm_rc.memprodutos.FindField('PERCREDUCAO').AsFloat   := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Imposto.ICMS.pRedBC;
                  // PIS/COFINS
                  dm_rc.memprodutos.FindField('PIS').AsString          := '01';
                  dm_rc.memprodutos.FindField('COFINS').AsString       := '01';
                  dm_rc.memprodutos.FindField('VLRPIS').AsFloat        := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Imposto.PIS.vPIS;
                  dm_rc.memprodutos.FindField('VLRCOFINS').AsFloat     := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Imposto.COFINS.vCOFINS;
                  dm_rc.memprodutos.FindField('PERCPIS').AsFloat       := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Imposto.PIS.pPIS;
                  dm_rc.memprodutos.FindField('PERCCOFINS').AsFloat    := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Imposto.COFINS.pCOFINS;

//                  dm_rc.memprodutos.FindField('STATUS').AsString       := variif(dm_rc.memprodutos.FindField('PRODUTO').AsInteger > 0,'T','F');
                  //***********************************************************************************************************


                  //***********************************************************************************************************
                  //MEDIDAS
                  //***********************************************************************************************************
                  if not SqlPesquisa('SELECT * FROM MEDIDAS WHERE SIGLA = ' + QuotedStr(dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Prod.uTrib)) then
                    begin
                      if not dm_rc.tbmedida.Locate('UNIDADE',dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[r].Prod.uTrib,[])  then
                        begin
                          dm_rc.tbmedida.Append;
                          dm_rc.tbmedida.FindField('UNIDADE').AsString := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Prod.uTrib;
                          dm_rc.tbmedida.Post;
                        end;
                    end;

                  dm_rc.memprodutos.Post;
                end;
           end;
        dm_rc.memprodutos.First;

        UniDBGridDADOSXML.Options := UniDBGridDADOSXML.Options - [dgRowSelect];
        UniDBGridDADOSXML.Options := UniDBGridDADOSXML.Options + [dgEditing];
        UniBitBtn14.Enabled       := True;
        UniBitBtn15.Enabled       := True;
      end;
   end;
end;

procedure TfrmTELAGENERICA.ConfiguraAcbr(aempresa: integer);
begin
  TabelaEmpresas('SELECT * FROM EMPRESAS WHERE CODIGO = ' + IntToStr(aempresa));

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
  dm_rc.ACBrMDFe.Configuracoes.Geral.ExibirErroSchema    := False;

  dm_rc.ACBrMDFe.Configuracoes.Certificados.NumeroSerie  := dm_rc.tbempresas.FindField('CERTIFICADO_CHAVE').AsString;
  dm_rc.ACBrMDFe.Configuracoes.Certificados.Senha        := dm_rc.tbempresas.FindField('CERTIFICADO_SENHA').AsString;

  //*************************************************************************
  //IMPRESSAO
  //*************************************************************************
  dm_rc.ACBrMDFeDAMDFeRL.Sistema                         := 'Sisgrãos - Sistema de gerenciamento de sementeiras - www.sisgraos.com.br';
  dm_rc.ACBrMDFeDAMDFeRL.Logo                            := dm_rc.tbempresas.FindField('caminho_logo').AsString;
  dm_rc.ACBrMDFeDAMDFeRL.PathPDF                         := dm_rc.tbempresas.FindField('caminho_impressao').AsString;

  dm_rc.ACBrMDFeDAMDFeRL.MostraPreview                   := False;
  dm_rc.ACBrMDFeDAMDFeRL.MostraSetup                     := False;
  dm_rc.ACBrMDFeDAMDFeRL.MostraStatus                    := False;
end;

procedure TfrmTELAGENERICA.CopiaPermissao(pcodfunc: integer);
begin
  dm_rc.tb_permissaousuario.First;
  while not dm_rc.tb_permissaousuario.Eof do
    begin

      dm_rc.tb_permissaousuario.Edit;
      dm_rc.tb_permissaousuario.FindField('ACESSAR').AsBoolean := False;
      dm_rc.tb_permissaousuario.FindField('INCLUIR').AsBoolean := False;
      dm_rc.tb_permissaousuario.FindField('ALTERAR').AsBoolean := False;
      dm_rc.tb_permissaousuario.FindField('EXCLUIR').AsBoolean := False;
      dm_rc.tb_permissaousuario.Post;

      dm_rc.tb_permissaousuario.Next;
    end;
  dm_rc.tb_permissaousuario.First;

  SqlPesquisa(' select * from permissao where funcionario = ' + IntToStr(pcodfunc)               +
              ' and empresa                               = ' + QuotedStr(btneditempresa.Text)   +
              ' order by menu                               ');

  if dm_rc.sqlBuscas.RecordCount > 0 then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          if dm_rc.tb_permissaousuario.Locate('MENU',VarArrayOf([StrAllTrim(dm_rc.sqlBuscas.Findfield('TABELA').AsString)]),[]) then
            begin
              dm_rc.tb_permissaousuario.edit;
              dm_rc.tb_permissaousuario.FindField('ACESSAR').AsBoolean := variif(dm_rc.sqlBuscas.Findfield('ACESSAR').AsString = 'T',True,False);
              dm_rc.tb_permissaousuario.FindField('INCLUIR').AsBoolean := variif(dm_rc.sqlBuscas.Findfield('INCLUIR').AsString = 'T',True,False);
              dm_rc.tb_permissaousuario.FindField('ALTERAR').AsBoolean := variif(dm_rc.sqlBuscas.Findfield('ALTERAR').AsString = 'T',True,False);
              dm_rc.tb_permissaousuario.FindField('EXCLUIR').AsBoolean := variif(dm_rc.sqlBuscas.Findfield('EXCLUIR').AsString = 'T',True,False);
              dm_rc.tb_permissaousuario.Post;
            end;
          dm_rc.sqlBuscas.Next;
        end;
    end;
end;

procedure TfrmTELAGENERICA.CRUD_permissao(acao: string);
begin
  if StrContains('carrega#grava',LowerCase(acao)) then
    begin
      btnaltera.Enabled        := True;
      btngrava.Enabled         := False;
      btnpermitetudo.Enabled   := False;
      btndesmarcatudo.Enabled  := False;
      btncopia.Enabled         := False;
      btneditcopiafun.ReadOnly := True;

      UniDBTreeGridpermissao.Options := UniDBTreeGridpermissao.Options - [dgEditing];
    end
  else
  if LowerCase(acao) = 'altera' then
    begin
      btnaltera.Enabled        := False;
      btngrava.Enabled         := True;
      btnpermitetudo.Enabled   := True;
      btndesmarcatudo.Enabled  := True;
      btncopia.Enabled         := True;
      btneditcopiafun.ReadOnly := False;
      btneditempresa.ReadOnly  := False;

      UniDBTreeGridpermissao.Options := UniDBTreeGridpermissao.Options + [dgEditing];
    end;
end;

procedure TfrmTELAGENERICA.L1Click(Sender: TObject);
begin
  mm.varI_Code_Lote_Lotesemente    := dm_rc.tbitensmoventrega.FindField('LOTESEMENTE').AsString;
  mm.varI_Code_Lote_Boletimsemente := dm_rc.tbitensmoventrega.FindField('BOLETIMSEMENTE').AsString;
  mm.varI_Code_Lote_Termosemente   := dm_rc.tbitensmoventrega.FindField('TERMOSEMENTE').AsString;

  mm.varE_produto_entrega          := dm_rc.tbitensmoventrega.FindField('PRODUTO').AsInteger;
  mm.varE_sequencia_entrega        := dm_rc.tbitensmoventrega.FindField('SEQUENCIA').AsInteger;

  frmCADENTREGAS.ShowModal();

  SqlPesquisa(ESCRITA_LISTAENTREGAITENS(mm.varI_Code_Company,mm.varE_numero_entrega,mm.varE_documento_entrega));

  dm_rc.tbitensmoventrega.Close;
  dm_rc.tbitensmoventrega.CopyDataSet(dm_rc.sqlBuscas);
  dm_rc.tbitensmoventrega.Open;

  dm_rc.tbitensmoventrega.Refresh;
end;

procedure TfrmTELAGENERICA.Permissao(acao:string);
begin
  if LowerCase(acao) = 'carrega' then
    begin
      SqlPesquisa(' select * from permissao where funcionario = ' + IntToStr(mm.varPermissao_codigo) +
                  ' and empresa                               = ' + QuotedStr(btneditempresa.Text)   +
                  ' order by menu                               ');

      if dm_rc.sqlBuscas.RecordCount > 0 then
        begin
          dm_rc.sqlBuscas.First;
          while not dm_rc.sqlBuscas.Eof do
            begin
              if dm_rc.tb_permissaousuario.Locate('MENU',VarArrayOf([StrAllTrim(dm_rc.sqlBuscas.Findfield('TABELA').AsString)]),[]) then
                begin
                  dm_rc.tb_permissaousuario.edit;
                  dm_rc.tb_permissaousuario.FindField('ACESSAR').AsBoolean := variif(dm_rc.sqlBuscas.Findfield('ACESSAR').AsString = 'T',True,False);
                  dm_rc.tb_permissaousuario.FindField('INCLUIR').AsBoolean := variif(dm_rc.sqlBuscas.Findfield('INCLUIR').AsString = 'T',True,False);
                  dm_rc.tb_permissaousuario.FindField('ALTERAR').AsBoolean := variif(dm_rc.sqlBuscas.Findfield('ALTERAR').AsString = 'T',True,False);
                  dm_rc.tb_permissaousuario.FindField('EXCLUIR').AsBoolean := variif(dm_rc.sqlBuscas.Findfield('EXCLUIR').AsString = 'T',True,False);
                  dm_rc.tb_permissaousuario.Post;
                end;
              dm_rc.sqlBuscas.Next;
            end;
        end;
    end;

  if LowerCase(acao) = 'grava' then
    begin
      mm.FDTransaction.StartTransaction;
      executasql(' delete from permissao where funcionario        = ' + IntToStr(mm.varPermissao_codigo) +
                 ' and empresa                                    = ' + QuotedStr(btneditempresa.Text));
      executasql(' delete from usuarios_empresa where CODIUSER    = ' + IntToStr(mm.varPermissao_codigo) +
                 ' and CODIEMP                                    = ' + QuotedStr(btneditempresa.Text));

      TabelaPermissao('select * from permissao where codigo          = 0' );
      TabelaUsuarios ('select * from USUARIOS_EMPRESA where CODIUSER = 0' );

      dm_rc.tb_permissaousuario.First;
      while not dm_rc.tb_permissaousuario.Eof do
        begin
          if dm_rc.tb_permissaousuario.findfield('TABELA').AsString <> '' then
            begin
              dm_rc.fdqrypermissao.Append;
              dm_rc.fdqrypermissao.FindField('CODIGO').AsInteger      := Ultimo_Codigo('PERMISSAO','CODIGO',True);
              dm_rc.fdqrypermissao.FindField('KEY').AsString          := Gera_Guid();
              dm_rc.fdqrypermissao.FindField('FUNCIONARIO').AsInteger := MM.varPermissao_codigo;
              dm_rc.fdqrypermissao.FindField('EMPRESA').AsInteger     := StrToInt(btneditempresa.Text);
              dm_rc.fdqrypermissao.FindField('TABELA').AsString       := dm_rc.tb_permissaousuario.FindField('TABELA').Asstring;
              dm_rc.fdqrypermissao.FindField('MENU').AsString         := dm_rc.tb_permissaousuario.FindField('MENU').Asstring;

              dm_rc.fdqrypermissao.FindField('ACESSAR').AsString      := variif(dm_rc.tb_permissaousuario.FindField('ACESSAR').AsBoolean = True,'T','F');
              dm_rc.fdqrypermissao.FindField('INCLUIR').AsString      := variif(dm_rc.tb_permissaousuario.FindField('INCLUIR').AsBoolean = True,'T','F');
              dm_rc.fdqrypermissao.FindField('ALTERAR').AsString      := variif(dm_rc.tb_permissaousuario.FindField('ALTERAR').AsBoolean = True,'T','F');
              dm_rc.fdqrypermissao.FindField('EXCLUIR').AsString      := variif(dm_rc.tb_permissaousuario.FindField('EXCLUIR').AsBoolean = True,'T','F');
              dm_rc.fdqrypermissao.Post;
            end;
          dm_rc.tb_permissaousuario.Next;
        end;

        try
          dm_rc.fdqryusuarios.Append;
          dm_rc.fdqryusuarios.FindField('CODIEMP').AsInteger  := StrToInt(btneditempresa.Text);
          dm_rc.fdqryusuarios.FindField('CODIUSER').AsInteger := mm.varPermissao_codigo;
          dm_rc.fdqryusuarios.Post;

          dm_rc.rc_ShowSweetAlert( 'Ok', 'PERMISSÕES LANÇADA COM SUCESSO!' , 'sucess');
        except
          dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NÃO CONSEGUI GERAR AS PERMISSÕES' , 'error');
        end;

      mm.FDTransaction.CommitRetaining;
      mm.FDTransaction.Commit;

      btneditcopiafun.Text := '0';
    end;
end;

procedure TfrmTELAGENERICA.Produto_Fornecedor;
begin
  if TabelaFonecedor( ' SELECT * FROM FORNECEDOR_PRODUTO WHERE PESSOA = ' + QuotedStr(UniEditxmlpessoa.Text) +
                      ' AND CODIGOFORNECEDOR                          = ' + QuotedStr(dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Prod.cProd)) then
    begin
      dm_rc.memprodutos.FindField('PRODUTO').AsInteger  := dm_rc.fdqryfornecedorproduto.FindField('CODIGOSISTEMA').AsInteger;
      dm_rc.memprodutos.FindField('DESCRICAO').AsString := Acha_item('PRODUTOS',dm_rc.fdqryfornecedorproduto.FindField('CODIGOSISTEMA').AsString);

      if TabelaProdutos('SELECT * FROM PRODUTOS, SALDOS WHERE SALDOS.PRODUTO = PRODUTOS.CODIGO AND PRODUTOS.CODIGO = ' + IntToStr(dm_rc.memprodutos.FindField('PRODUTO').AsInteger)) then
        dm_rc.memprodutos.FindField('CST').AsString       := dm_rc.FDQryProdutos.FindField('SITUACAOOUTRAS').AsString;

    end
  else
    dm_rc.memprodutos.FindField('DESCRICAO').AsString := dm_rc.ACBrNFe.NotasFiscais.Items[0].NFe.Det[i].Prod.xProd;
end;

procedure TfrmTELAGENERICA.tbhistpessoasimpGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text :=
  '<i title="Impressao" class="fa fa-lg fa-file-pdf fa-lg" style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmTELAGENERICA.ubtnimpressaoClick(Sender: TObject);
begin
  if dm_rc.tbextratomovimento.RecordCount > 0 then
    begin
      mm.varC_caminhopdf :=  RELATORIO_HISTORICODOCUMENTO(MM.varI_Code_Company,
                                                          mm.varI_Code_Numero_Documento,
                                                          mm.varI_Code_documento_serie,
                                                          DM_RC.tbextratomovimento);

      unfImpressao.ShowModal();
    end
  else
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Busque Alguma Informação antes de IMPRIMIR!' , 'warning');
end;

procedure TfrmTELAGENERICA.UniBitBtn10Click(Sender: TObject);
begin
  UniButtonEditcodbancos.Text            := '0';
  UniEditdesbancos.Text                  := '';
  UniButtonEditcadplanocontas.Text       := '0';
  UniEditdesplanocontas.Text             := '';
  UniButtonEditcadpessoas.Text           := '0';
  UniEditdesnomepessoa.Text              := '';
  UniDateemissao.DateTime                := Date;
  UniDateTimevencimento.DateTime         := Date;
  UniFormattedNumberEditvlrtitulos.Value := 0;
  UniNumberEditparcelatitulos.Value      := 0;
  UniEditnumerodocumento.Text            := '00000';
  UniEditpgtoobs.Text                    := '';
  DM_RC.tbtitulos.Close;
end;

procedure TfrmTELAGENERICA.UniBitBtn11Click(Sender: TObject);
var
  i        : integer;
  datavenc : TDateTime;
  M_RESTO  : Real;
  total    : Real;
begin
  total    := 0;
  dm_rc.tbtitulos.first;
  while not dm_rc.tbtitulos.Eof do
    begin
      total := total + dm_rc.tbtitulos.FindField('VALOR').AsFloat;
      dm_rc.tbtitulos.next;
    end;

  dm_rc.tbtitulos.First;

  dm_rc.tbtitulos.BeforePost                 := dm_rc.tbtitulosBeforePost;
  UniFormattedNumberEditTOTALNOTA.Value      := dm_rc.CalculaTitulos;
  UniFormattedNumberEdittotalcalculado.Value := total;
  btnLkpClear.Enabled                        := True;
end;

procedure TfrmTELAGENERICA.UniBitBtn12Click(Sender: TObject);
begin
  TabelaTitulos('select * from '+mm.varFP_id_parcela+' where codigo = 0');
  dm_rc.fdqrytitulos.UpdateOptions.UpdateTableName := mm.varFP_id_parcela;

  mm.FDTransaction.StartTransaction;
  dm_rc.tbtitulos.First;
  while not dm_rc.tbtitulos.Eof do
    begin
      dm_rc.fdqrytitulos.Append;
      dm_rc.fdqrytitulos.FindField('NUMERO').AsString        := UniEditnumerodocumento.Text;
      dm_rc.fdqrytitulos.FindField('DOCUMENTO').AsInteger    := 30;
      dm_rc.fdqrytitulos.FindField('SERIE').AsString         := cbxserie.Text;
      dm_rc.fdqrytitulos.FindField('PESSOA').AsInteger       := StrToInt(UniButtonEditcadpessoas.Text);
      dm_rc.fdqrytitulos.FindField('EMISSAO').AsDateTime     := UniDateemissao.DateTime;

      dm_rc.fdqrytitulos.FindField('SEQUENCIA').AsInteger    := dm_rc.tbtitulos.RecNo;
      dm_rc.fdqrytitulos.FindField('VENCIMENTO').AsDateTime  := dm_rc.tbtitulosVENCIMENTO.AsDateTime;
      dm_rc.fdqrytitulos.FindField('VALORATUAL').AsFloat     := dm_rc.tbtitulosVALOR.AsFloat;
      dm_rc.fdqrytitulos.FindField('VALORORIGINAL').AsFloat  := dm_rc.tbtitulosVALOR.AsFloat;
      dm_rc.fdqrytitulos.FindField('PORTADOR').AsInteger     := StrToInt(UniButtonEditcodbancos.Text);
      dm_rc.fdqrytitulos.FindField('OBSERVACOES').AsString   := UniEditpgtoobs.Text;

      dm_rc.fdqrytitulos.FindField('CONFIRMABOLETO').AsString:= 'F';
      dm_rc.fdqrytitulos.FindField('SITUACAO').AsString      := 'Aberto';

      dm_rc.fdqrytitulos.FindField('FINANCEIRO').AsInteger   := varIIF(mm.varFP_id_parcela = 'RECEBER',1,0);
      dm_rc.fdqrytitulos.FindField('FUNCIONARIO').AsInteger  := mm.varI_User;
      dm_rc.fdqrytitulos.FindField('EMPRESA').AsInteger      := mm.varI_Code_Company;
      dm_rc.fdqrytitulos.FindField('LOGINCLUSAO').AsString   := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);

      dm_rc.fdqrytitulos.FindField('APLICACAO').AsInteger    := 0;
      dm_rc.fdqrytitulos.FindField('PLANOCONTAS').AsString   := UniButtonEditcadplanocontas.Text;
      dm_rc.fdqrytitulos.FindField('CARTEIRA').AsInteger     := 00001;

      dm_rc.fdqrytitulos.FindField('VALORDESCONTOS').AsFloat := 0;
      dm_rc.fdqrytitulos.FindField('VALORJUROS').AsFloat     := 0;
      dm_rc.fdqrytitulos.FindField('VALORTAXAS').AsFloat     := 0;
      dm_rc.fdqrytitulos.FindField('VALORPAGO').AsFloat      := 0;
      dm_rc.fdqrytitulos.FindField('VALORDIVERSOS').AsFloat  := 0;

      dm_rc.fdqrytitulos.FindField('KEY').AsString           := Gera_Guid();
      dm_rc.fdqrytitulos.FindField('CODIGO').AsInteger       := Ultimo_Codigo(mm.varFP_id_parcela,'CODIGO',False);
      dm_rc.fdqrytitulos.Post;

      dm_rc.tbtitulos.Next;
    end;

  mm.FDTransaction.CommitRetaining;
  mm.FDTransaction.Commit;

  try
    dm_rc.tbtitulos.BeforePost   := dm_rc.tbtitulosBeforePost;
    dm_rc.tbtitulos.BeforeDelete := dm_rc.tbtitulosBeforeDelete;

    UniBitBtn10.OnClick(self);

    UniBitBtn10.Enabled := False;
    UniBitBtn12.Enabled := False;
    dm_rc.rc_ShowSweetAlert( 'Ok', 'Financeiro Lançado com Sucesso' , 'sucess');
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NÃO CONSEGUI GRAVAR - INFORMAR AO SUPORTE' , 'error');
  end;
end;

procedure TfrmTELAGENERICA.UniBitBtn13Click(Sender: TObject);
begin
  dm_rc.ACBrNFe.NotasFiscais.Clear;
  dm_rc.ACBrNFe.NotasFiscais.LoadFromString(UniMemodadosxml.Text);
  Carrega_ItensXml();
  UniPageControltela.ActivePage := UniTabSheetdadosxmlentrada;
end;

procedure TfrmTELAGENERICA.UniBitBtn14Click(Sender: TObject);
begin
  mm.varTXTXML_ENTRADA := UniMemodadosxml.Text;
end;

procedure TfrmTELAGENERICA.UniBitBtn15Click(Sender: TObject);
begin
  mm.varR_Value_BASEICMS           := UniFormattedNumberEditvlrbaseicms.Value;
  mm.varR_Value_VALORICMS          := UniFormattedNumberEditvlricms.Value;
  mm.varR_Value_VLRTOTAL           := UniFormattedNumberEditvlrtotal.Value;
  mm.varR_Value_VLRPRODUTOS        := UniFormattedNumberEditvlrprodutos.Value;
  mm.varR_Value_Pessoa             := StrToInt(UniEditxmlpessoa.Text);
  mm.varR_value_NUMERONOTAENTRADA  := UniEditxmlnumeronota.Text;
  mm.varR_value_EMISSAONOTAENTRADA := UniDateTimePickerxmlemissao.Text;
  mm.varR_value_CHAVEACESSOENTRADA := UniEditxmlchaveacesso.Text;
  mm.varTXTXML_ENTRADA             := UniMemodadosxml.Text;
  mm.varCONFIRMATXTXMLENTRADA      := True;

  ModalResult := mrOK;
end;

procedure TfrmTELAGENERICA.UniBitBtn16Click(Sender: TObject);
begin
  mm.varC_caminhopdf :=   RECIBOENTREGA_impressao(mm.varI_Code_Company,
                                                  mm.varE_numero_entrega,
                                                  mm.varE_documento_entrega,
                                                  dm_rc.tbrelacaoentrega.FindField('EMISSAO').AsString,'TOTAL');
  unfImpressao.ShowModal();

end;

procedure TfrmTELAGENERICA.UniBitBtn17Click(Sender: TObject);
begin
  FrmIMPRESSAOENTREGAPARCIAL.ShowModal();
end;

procedure TfrmTELAGENERICA.btnpermitetudoClick(Sender: TObject);
begin
  dm_rc.tb_permissaousuario.First;
  while not dm_rc.tb_permissaousuario.Eof do
    begin

      dm_rc.tb_permissaousuario.Edit;
      dm_rc.tb_permissaousuario.FindField('ACESSAR').AsBoolean := True;
      dm_rc.tb_permissaousuario.FindField('INCLUIR').AsBoolean := True;
      dm_rc.tb_permissaousuario.FindField('ALTERAR').AsBoolean := True;
      dm_rc.tb_permissaousuario.FindField('EXCLUIR').AsBoolean := True;
      dm_rc.tb_permissaousuario.Post;

      dm_rc.tb_permissaousuario.Next;
    end;
  dm_rc.tb_permissaousuario.First;
end;

procedure TfrmTELAGENERICA.btnSTATUSClick(Sender: TObject);
begin
  ConfiguraAcbr(mm.varI_Code_Company);
  UniMemorespostaTXT.Clear;
  try
    dm_rc.ACBrMDFe.WebServices.StatusServico.Executar;

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

procedure TfrmTELAGENERICA.btnalteraClick(Sender: TObject);
begin
  CRUD_permissao('altera');
end;

procedure TfrmTELAGENERICA.btncopiaClick(Sender: TObject);
begin
  if (btneditcopiafun.Text = '') or (btneditcopiafun.Text = '0') then
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'PREENCHER COM ALGUM USUARIO EXISTENTE' , 'error')
  else
    CopiaPermissao(StrToInt(btneditcopiafun.Text));
end;
procedure TfrmTELAGENERICA.btndesmarcatudoClick(Sender: TObject);
begin
  dm_rc.tb_permissaousuario.First;
  while not dm_rc.tb_permissaousuario.Eof do
    begin

      dm_rc.tb_permissaousuario.Edit;
      dm_rc.tb_permissaousuario.FindField('ACESSAR').AsBoolean := False;
      dm_rc.tb_permissaousuario.FindField('INCLUIR').AsBoolean := False;
      dm_rc.tb_permissaousuario.FindField('ALTERAR').AsBoolean := False;
      dm_rc.tb_permissaousuario.FindField('EXCLUIR').AsBoolean := False;
      dm_rc.tb_permissaousuario.Post;

      dm_rc.tb_permissaousuario.Next;
    end;
  dm_rc.tb_permissaousuario.First;
end;

procedure TfrmTELAGENERICA.btneditcopiafunButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('USUARIOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       btneditcopiafun.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmTELAGENERICA.btneditempresaButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('EMPRESAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       btneditempresa.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmTELAGENERICA.UniBitBtn1Click(Sender: TObject);
begin
  try
    dm_rc.FDQryMvmestre.Post;
    TabelaOperacao('SELECT * FROM OPERACOES WHERE CODIGO         = ' + IntToStr(DM_RC.FDQryMvmestre.FindField('OPERACAO').AsInteger));
    if dm_rc.FDQryoperacoes.FindField('FINANCEIRO').AsInteger = 1 then
      begin
        executasql(' update receber set receber.COMISSAOFUNCIONARIO   = ' + FloatToStr(dm_rc.FDQryMvmestre.FindField('COMISSAOFUNCIONARIO').AsFloat) +
                   ' where receber.empresa                            = ' + IntToStr(mm.varI_Code_Company) +
                   ' and numero                                       = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger) +
                   ' and documento                                    = ' + IntToStr(dm_rc.FDQryMvmestre.FindField('DOCUMENTO').AsInteger));
      end;
  finally
    mm.varI_Code_Documento_Controle := 0;
    dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Gravados com SUCESSO!' , 'success');
    btnLkpClear.OnClick(Self);
  end;
end;

procedure TfrmTELAGENERICA.UniBitBtn2Click(Sender: TObject);
begin
  uniFileUp.Filter       := '*.png';
  uniFileUp.TargetFolder := 'uploads';

  if dm_rc.rc_ForceDirectories( uniFileUp.TargetFolder ) then
     uniFileUp.Execute;
end;

procedure TfrmTELAGENERICA.UniBitBtn3Click(Sender: TObject);
var
  i        : integer;
  datavenc : TDateTime;
  M_RESTO  : Real;
begin
  dm_rc.tbtitulos.close;
  dm_rc.tbtitulos.Open;

  if UniNumberEditnparcela.Text = '0' then
    begin
      dm_rc.rc_ShowSweetAlert( 'Ok', 'NUMERO DE PARCELA(S) NÃO PODE SER 0!' , 'error');
      Abort
    end;


  M_RESTO := UniFormattedNumberEditvalordocumento.Value;
  I       := 0;
  while I <  strtoint(UniNumberEditnparcela.Text) do
    begin
      Inc(I);

      dm_rc.tbtitulos.append;
      if I = 1 then
        datavenc := edSearchCRUDDtIni.DateTime
      else
        datavenc := IncMonth(datavenc);

      dm_rc.tbtitulos.FindField('PARCELA').AsInteger     := I;
      dm_rc.tbtitulos.FindField('VENCIMENTO').AsDateTime := datavenc;
      dm_rc.tbtitulos.FindField('VALOR').AsFloat         := MRound(UniFormattedNumberEditvalordocumento.Value / UniNumberEditnparcela.Value,2);
      dm_rc.tbtitulos.post;

      M_RESTO := M_RESTO - dm_rc.tbtitulos.FindField('VALOR').AsFloat;
    end;

  if M_RESTO > 0 then
    begin
      dm_rc.tbtitulos.First;
      dm_rc.tbtitulos.Edit;
      dm_rc.tbtitulos.FindField('VALOR').AsFloat := dm_rc.tbtitulos.FindField('VALOR').AsFloat + Abs(M_RESTO);
      dm_rc.tbtitulos.Post;
    end
  else
    if M_RESTO < 0 then
      begin
        dm_rc.tbtitulos.First;
        dm_rc.tbtitulos.Edit;
        dm_rc.tbtitulos.FindField('VALOR').AsFloat := dm_rc.tbtitulos.FindField('VALOR').AsFloat - Abs(M_RESTO);
        dm_rc.tbtitulos.Post;
      end;

  dm_rc.tbtitulos.First;
  UniFormattedNumberEdittotalduplicatas.Value := dm_rc.CalculaTitulos;
end;

procedure TfrmTELAGENERICA.UniBitBtn4Click(Sender: TObject);
begin
  if UniFormattedNumberEditvalordocumento.Value <> UniFormattedNumberEdittotalduplicatas.Value then
    begin
      dm_rc.rc_ShowSweetAlert( 'FALHA', 'VALORES NÃO CONFEREM - VERIFICAR!' , 'error');
      Abort;
    end
  else
    begin
      dm_rc.tbtitulos.BeforePost   := dm_rc.tbtitulos.BeforePost;
      dm_rc.tbtitulos.BeforeDelete := dm_rc.tbtitulos.BeforeDelete;
      btnLkpClear.OnClick(self);
    end;
end;

procedure TfrmTELAGENERICA.btnempgravaClick(Sender: TObject);
begin
  try
    dm_rc.tbempresas.Post;
    dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Gravados com Sucesso' , 'success');

    mm.M_FASTREPORT    :=  dm_rc.tbempresas.FindField('CAMINHO_FASTREPORT').AsString;
    mm.M_PATHIMPRESSAO :=  dm_rc.tbempresas.FindField('CAMINHO_IMPRESSAO').AsString;
    mm.M_IMAGEM        :=  dm_rc.tbempresas.FindField('CAMINHO_LOGO').AsString;
    mm.M_TIPOPESO      :=  dm_rc.tbempresas.FindField('TRABALHOKGSC').AsString;

    btnempinclui.Enabled                    := True;
    btnempgrava.Enabled                     := False;
    dm_rc.tbempresas.UpdateOptions.ReadOnly := True;

  except
    dm_rc.rc_ShowSweetAlert( 'Atenção', 'Erro ao Gravar' , 'error');
  end;
end;

procedure TfrmTELAGENERICA.btnempincluiClick(Sender: TObject);
begin
  dm_rc.tbempresas.UpdateOptions.ReadOnly := False;

  dm_rc.tbempresas.Edit;
  btnempinclui.Enabled                    := False;
  btnempgrava.Enabled                     := True;
end;

procedure TfrmTELAGENERICA.UniBitBtn7Click(Sender: TObject);
begin
  mm.varR_Value_BASEICMS  := UniFormattedNumberBASEICMS.Value;
  mm.varR_Value_VALORICMS := UniFormattedNumberVALORICMS.Value;

  ModalResult := mrOK;
end;

procedure TfrmTELAGENERICA.UniBitBtn8Click(Sender: TObject);
begin
  CALCULA_ICMS('');
  mm.varR_Value_BASEICMS  := UniFormattedNumberBASEICMS.Value;
  mm.varR_Value_VALORICMS := UniFormattedNumberVALORICMS.Value;

  dm_rc.rc_ShowSweetAlert( 'Ok', 'ICMS DIFERENCIADO CALCULADO!' , 'success');
end;

procedure TfrmTELAGENERICA.UniBitBtn9Click(Sender: TObject);
var
  I,R       : integer;
  data_venc : TDateTime;
begin
  if UniEditnumerodocumento.Text = '00000' then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'INFORME UM NUMERO PARA O DOCUMENTO' , 'error');
      abort
    end;
  if UniFormattedNumberEditvlrtitulos.Value = 0 then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'INFORME UM VALOR PARA O TITULO' , 'error');
      abort
    end;
  if UniNumberEditparcelatitulos.Value = 0 then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'INFORME O NUMERO DE PARCELA(S) A SER GERADA(S)' , 'error');
      abort
    end;
  if (UniButtonEditcadplanocontas.Text = '0') or (UniButtonEditcadplanocontas.Text = '') then
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'INFORME UM PLANO DE CONTAS' , 'error');
      abort
    end;

  dm_rc.tbtitulos.Close;
  dm_rc.tbtitulos.Open;
  R := 0;

  dm_rc.tbtitulos.DisableControls;

  for I := 0 to StrToInt(UniNumberEditparcelatitulos.Text) -1 do
    begin
      Inc(R);
      if R = 1 then
        data_venc := UniDateTimevencimento.DateTime
      else
        data_venc := IncMonth(data_venc);

      dm_rc.tbtitulos.Append;
      dm_rc.tbtitulosPARCELA.AsInteger     := R;
      dm_rc.tbtitulosVALOR.Value           := UniFormattedNumberEditvlrtitulos.Value;
      dm_rc.tbtitulosVENCIMENTO.AsDateTime := data_venc;
      dm_rc.tbtitulos.Post;
    end;

  dm_rc.tbtitulos.First;
  dm_rc.tbtitulos.EnableControls;

  UniBitBtn10.Enabled := True;
  UniBitBtn12.Enabled := True;
end;

procedure TfrmTELAGENERICA.UniBitBtnbuscakardexprodutoClick(Sender: TObject);
var
  sql : string;
  SALDO,ENTRADA,SAIDA,SALDOANT :Real;
begin
  SALDO    := 0;
  ENTRADA  := 0;
  SAIDA    := 0;
  SALDOANT := 0;

  dm_rc.memkardexkproduto.Close;
  dm_rc.memkardexkproduto.Open;

  sql := ESCRITA_KARDEXPRODUTO(mm.varI_Code_Company,StrToInt(mm.varC_referencia_produto),
                              UniDateTimePickerkarproini.Text,
                              UniDateTimePickerkarprofin.Text);
  SqlPesquisa(sql);
  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin

      if dm_rc.sqlBuscas.RecNo = 1 then
        begin
          dm_rc.memkardexkproduto.append;
          dm_rc.memkardexkproduto.FindField('NOME').AsString := ' SALDO ANTERIOR -> ';
          dm_rc.memkardexkproduto.FindField('SALDO').AsFloat := SaldoProdutoKardex_Nota(MM.varI_Code_Company,strtoint(mm.varC_referencia_produto),UniDateTimePickerkarproini.DateTime);
          dm_rc.memkardexkproduto.Post;

          SALDO := dm_rc.memkardexkproduto.FindField('SALDO').AsFloat;
        end;

        begin
          ENTRADA := DM_RC.sqlBuscas.FindField('ENTRADA').AsFloat;
          SAIDA   := DM_RC.sqlBuscas.FindField('SAIDA').AsFloat;
          SALDO   := SALDO + (ENTRADA - SAIDA);

          dm_rc.memkardexkproduto.append;
          dm_rc.memkardexkproduto.FindField('NOME').AsString        := ' SALDO ANTERIOR -> ';
          dm_rc.memkardexkproduto.FindField('NUMERO').AsInteger     := DM_RC.sqlBuscas.FindField('NUMERO').AsInteger;
          dm_rc.memkardexkproduto.FindField('PESSOA').AsInteger     := DM_RC.sqlBuscas.FindField('PESSOA').AsInteger;
          dm_rc.memkardexkproduto.FindField('NOME').AsString        := DM_RC.sqlBuscas.FindField('NOME').AsString;
          dm_rc.memkardexkproduto.FindField('EMISSAO').AsDateTime   := DM_RC.sqlBuscas.FindField('DATA').AsDateTime;
          dm_rc.memkardexkproduto.FindField('SERIE').AsString       := DM_RC.sqlBuscas.FindField('SERIE').AsString;
          dm_rc.memkardexkproduto.FindField('OPERACAO_OP').AsString := DM_RC.sqlBuscas.FindField('OPERACAO_OP').AsString;

          dm_rc.memkardexkproduto.FindField('ENTRADA').AsFloat      := DM_RC.sqlBuscas.FindField('ENTRADA').AsFloat;
          dm_rc.memkardexkproduto.FindField('SAIDA').AsFloat        := DM_RC.sqlBuscas.FindField('SAIDA').AsFloat;
          dm_rc.memkardexkproduto.FindField('SALDO').AsFloat        := SALDO;
          dm_rc.memkardexkproduto.Post;
        end;

      dm_rc.sqlBuscas.Next;
    end;
end;

procedure TfrmTELAGENERICA.UniBitBtnvalidasenhanotaClick(Sender: TObject);
begin
  if ValidaSenha(mm.varTTIPO_SUP_SENHA,UniEditsenhaexcluinota.Text,UniLabelexclusaonota.Text) = False then
    begin
      mm.varS_SenhaExclusaoNota_permitido := 'F';
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'SENHA INCORRETA!' , 'error');
    end
  else
    begin
      mm.varS_SenhaExclusaoNota_permitido := 'T';
      ModalResult := mrOK;
    end;
end;

procedure TfrmTELAGENERICA.UniButtonDbEditcodigofuncionariomestreButtonClick(
  Sender: TObject);
begin
  mm.Seta_Busca('FUNCIONARIOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       DM_RC.FDQryMvmestre.Edit;
       DM_RC.FDQryMvmestre.FindField('FUNCIONARIO').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmTELAGENERICA.UniButtonDbEditcodigofuncionariomestreExit(
  Sender: TObject);
begin
  if SqlPesquisa('SELECT NOME, COMISSAO FROM FUNCIONARIOS WHERE CODIGO = ' + QuotedStr(UniButtonDbEditcodigofuncionariomestre.Text)) then
    begin
      UniEditnomevendedor.Text                                     := dm_rc.sqlBuscas.FindField('NOME').AsString;
      DM_RC.FDQryMvmestre.FindField('COMISSAOFUNCIONARIO').AsFloat := dm_rc.sqlBuscas.FindField('COMISSAO').AsFloat;
    end;
end;

procedure TfrmTELAGENERICA.UniButtonEditcadpessoasButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PESSOAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditcadpessoas.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmTELAGENERICA.UniButtonEditcadpessoasExit(Sender: TObject);
begin
  UniEditdesnomepessoa.Text := Acha_Item('PESSOAS',UniButtonEditcadpessoas.Text);
end;

procedure TfrmTELAGENERICA.UniButtonEditcadplanocontasButtonClick(
  Sender: TObject);
begin
  mm.Seta_Busca('PLANOCONTAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditcadplanocontas.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmTELAGENERICA.UniButtonEditcadplanocontasExit(Sender: TObject);
begin
  UniEditdesplanocontas.Text := Acha_Item('PLANOCONTAS',UniButtonEditcadplanocontas.Text);
end;

procedure TfrmTELAGENERICA.UniButtonEditcodbancosButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PORTADORES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditcodbancos.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmTELAGENERICA.UniButtonEditcodbancosExit(Sender: TObject);
begin
  UniEditdesbancos.Text := Acha_Item('PORTADORES',UniButtonEditcodbancos.Text);
end;

procedure TfrmTELAGENERICA.UniButtonEditcooperanteButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('CAMPO');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditcooperante.Text     := IntToStr(mm.varC_COOPERANTE);
       UniEditsafracampocooperante.Text := mm.varC_SAFRACAMPO;
       UniEditcampocooperante.Text      := mm.varC_CAMPO;
     end;
   end);
end;

procedure TfrmTELAGENERICA.UniDBGrid12DrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if dm_rc.tbhistoricofinanceirodocSITUACAO.AsString = 'Aberto' then
    Attribs.Font.Color := clBlack
  else
    Attribs.Font.Color := clBlue;
end;

procedure TfrmTELAGENERICA.UniDBGrid13DblClick(Sender: TObject);
begin
  if dm_rc.tbentregafutura.RecordCount > 0 then
    begin
      mm.varI_Code_CODVEF := dm_rc.tbentregafuturaCODIGO.AsInteger;
      btnLkpClear.OnClick(Self);
    end;
end;

procedure TfrmTELAGENERICA.UniDBGrid14DrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (dm_rc.tbkardexmanuloteSALDO.AsFloat  > 0 ) then
    attribs.Font.Color:= clBlue
  else
    attribs.Font.Color:= clRed;
end;

procedure TfrmTELAGENERICA.UniDBGrid3DrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if DM_RC.tbistlotevendaENTRADA.AsFloat > 0 then
    Column.Color := clBlue
  else
  if DM_RC.tbistlotevendaSALDO.AsFloat <= 0 then
    Column.Color := clRed;
end;

procedure TfrmTELAGENERICA.UniDBGrid5CellClick(Column: TUniDBGridColumn);
begin
  if Column.FieldName = 'exclui' then
    begin
      dm_rc.rc_ShowYesNo( 'DESEJA REALMENTE EXCLUIR ESSE REGISTRO?' );
      if mm.varB_Yes then
        begin
          dm_rc.tbtitulos.Delete;
        end
    end;
end;

procedure TfrmTELAGENERICA.UniDBGrid6CellClick(Column: TUniDBGridColumn);
begin
  if Column.FieldName = 'COMUM' then
    begin
      try
        mm.varC_caminhopdf :=  SEMENTES_Termo(mm.varI_Code_Company,
                                              dm_rc.memtermonota.FindField('CODIGO').AsInteger,
                                              0,'N',dm_rc.memtermonota.FindField('TERMO').AsString);

        unfImpressao.ShowModal();

      except
        on e: exception do
        begin
          gera_log(e.message);
          dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', e.message , 'error');
        end;
      end;
    end;

  if Column.FieldName = 'ASSINADA' then
    begin
      try
        mm.varC_caminhopdf :=  SEMENTES_Termo(mm.varI_Code_Company,
                                              dm_rc.memtermonota.FindField('CODIGO').AsInteger,
                                              1,'N',dm_rc.memtermonota.FindField('TERMO').AsString);

        unfImpressao.ShowModal();

      except
        on e: exception do
        begin
          gera_log(e.message);
          dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', e.message , 'error');
        end;
      end;
    end;

end;

procedure TfrmTELAGENERICA.UniDBGridDADOSXMLCellClick(Column: TUniDBGridColumn);
begin
  if Column.FieldName = 'buscaproduto' then
    begin
      MM.Seta_Busca('PRODUTOS');
      UniFfrmPesquisa.showmodal(
      procedure(Sender: TComponent; AResult: Integer)
       begin
         if AResult = mrOK then
         begin
           dm_rc.memprodutos.Edit;
           CarregaProduto(MM.varC_codigo_busca);
         end;
       end);
    end;
end;

procedure TfrmTELAGENERICA.UniDBGridEntregaCellClick(Column: TUniDBGridColumn);
begin
  if Column.FieldName = 'opcoes' then
    begin
      UniPopupMenuopcoesentregas.Popup(posicao_x_entrega-12,posicao_y_entrega, UniDBGridEntrega);
    end;
end;

procedure TfrmTELAGENERICA.UniDBGridEntregaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  posicao_x_entrega := X;
  posicao_y_entrega := Y;
end;

procedure TfrmTELAGENERICA.UniDBGridfinanceirodocDrawColumnCell(Sender: TObject;
  ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if (dm_rc.tbextratomovimentoTOTAL.AsFloat  > 0 ) then
    begin
      Attribs.Color := $00D2AAF0;
    end
  else
  if (dm_rc.tbextratomovimentoPAGO.AsFloat  > 0 ) then
    attribs.Font.Color:= clBlue
  else
    attribs.Font.Color:= clRed;
{
  if dm_rc.tbhistoricofinanceirodocSITUACAO.AsString = 'Aberto' then
    Attribs.Font.Color := clBlack
  else
    Attribs.Font.Color := clBlue;
}
end;

procedure TfrmTELAGENERICA.UniDBGridtitulosCellClick(Column: TUniDBGridColumn);
begin
  if Column.FieldName = 'exclui' then
    begin
      dm_rc.rc_ShowYesNo( 'DESEJA REALMENTE EXCLUIR ESSE REGISTRO?' );
      if mm.varB_Yes then
        begin
          dm_rc.tbtitulos.Delete;
        end
    end;
end;

procedure TfrmTELAGENERICA.uniFileUpCompleted(Sender: TObject;
  AStream: TFileStream);
begin
  dm_rc.tbempresas.FieldByName( 'CAMINHO_LOGO' ).AsString := AStream.FileName;
end;

procedure TfrmTELAGENERICA.UniFormCreate(Sender: TObject);
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

  cFormModal := mm.varC_Form_Modal;
  UniScreenMask.Enabled := True;
  dm_rc.rc_RenderControls(Self);
end;

procedure TfrmTELAGENERICA.UniFormDestroy(Sender: TObject);
begin
  mm.varFP_id_parcela:= '';
  mm.varC_Form_Modal := nil;
end;

procedure TfrmTELAGENERICA.UniFormReady(Sender: TObject);
begin
  Self.Top := (UniSession.UniApplication.ScreenHeight - Self.Height) div 2;
  if Self.Top < 0 then Self.Top := 0;
  dm_rc.rc_ResizeBlocks( Self, true, true );
end;

procedure TfrmTELAGENERICA.UniFormResize(Sender: TObject);
begin
{
  frmTELAGENERICA.Height   := 449;
  frmTELAGENERICA.Width    := 729;

  with frmTELAGENERICA.Constraints do
    begin
      MaxWidth  := 729;
      MinWidth  := 729;
      MaxHeight := 449;
      MinHeight := 449;
    end;

  frmTELAGENERICA.Position := poScreenCenter;
  }
end;

procedure TfrmTELAGENERICA.UniFormShow(Sender: TObject);
var
  totalboletim : real;
  R            : Integer;
  SubMenu      : Integer;
  Sequencial   : Integer;
  tabela       : string;
  sql          : string;
  datasettemp  : TDataSet;
begin
  rcBlock10.Visible := True;

  if mm.VarC_Atelagenerica = 'KARDEXMANULOTE' then
    begin
      Ativa_page('KARDEXMANULOTE',['KARDEXMANULOTE']);
      RELATORIO_ESTOQUE_MANUTENCAOLOTE(mm.varC_codigo_busca_lote,
                                       strtoint(mm.varC_referencia_produto),
                                       mm.varI_Code_Company
                                      );
    end;

  if mm.VarC_Atelagenerica = 'ENTREGAFUTURA' then
    begin
      Ativa_page('ENTREGAFUTURA',['ENTREGAFUTURA']);
      SqlPesquisa(ESCRITA_SALDOENTREGAFUTURA (mm.varI_Code_Company,
                                              mm.varI_Code_Pessoa_Documento));

      dm_rc.tbentregafutura.Close;
      dm_rc.tbentregafutura.CopyDataSet(dm_rc.sqlBuscas);
      dm_rc.tbentregafutura.Open;
    end;

  if mm.VarC_Atelagenerica = 'ENCERRAMANIFESTO' then
    begin
      Ativa_page('ENCERRAMANIFESTO',['ENCERRAMANIFESTO']);
      frmTELAGENERICA.Caption := 'Encerra Manifesto de Terceiros';
    end;

  if mm.VarC_Atelagenerica = 'PEDIDOFINANCEIRO' then
    begin
      Ativa_page('PEDIDOFINANCEIRO',['PEDIDOFINANCEIRO']);
      frmTELAGENERICA.Caption           := 'Financeiro do Pedido';


      SqlPesquisa(ESCRITA_FINANCEIRODOCUMENTO(mm.varI_Code_Company,
                                              mm.varI_Code_Numero_Documento,
                                              mm.varI_Code_documento_serie));

      dm_rc.tbhistoricofinanceirodoc.Close;
      dm_rc.tbhistoricofinanceirodoc.CopyDataSet(dm_rc.sqlBuscas);
      dm_rc.tbhistoricofinanceirodoc.Open;
    end;

  if mm.VarC_Atelagenerica = 'FINANCEIRODOC' then
    begin
      Ativa_page('FINANCEIRODOC',['FINANCEIRODOC']);
      frmTELAGENERICA.Caption    := 'Histórico do Financeiro do Documento';

      dm_rc.tbextratomovimento.close;
      dm_rc.tbextratomovimento.open;

      dm_rc.tbextratomovimento.CopyDataSet(extratofinanceiropessoa(mm.varI_Code_Company,
                                                              0,
                                                              mm.varI_Code_codigo_Documento,
                                                              date,
                                                              date));

      ubtnimpressao.Visible := True;
    end;

  if mm.VarC_Atelagenerica = 'LISTAENTREGA' then
    begin
      Ativa_page('LISTAENTREGA',['LISTAENTREGA']);
      frmTELAGENERICA.Caption           := 'Lista de Entrega de Itens';

      UniEditentreganpedido.Text                  :=  IntToStr(mm.var_ENTREGA_NUMERO);
      UniDateTimePickerentreganemissao.DateTime   :=  mm.var_ENTREGA_EMISSAO;
      UniEditentregapessoa.Text                   :=  mm.var_ENTREGA_NOMEFORNECEDOR;
      UniFormattedNumberEditentregatotaldoc.Value :=  mm.var_ENTREGA_VALORTOTAL;
      UniDBGridEntrega.Options                    :=  UniDBGridEntrega.Options - [dgEditing];

      SqlPesquisa(ESCRITA_LISTAENTREGAITENS(mm.varI_Code_Company,mm.varE_numero_entrega,mm.varE_documento_entrega));

      dm_rc.tbitensmoventrega.Close;
      dm_rc.tbitensmoventrega.CopyDataSet(dm_rc.sqlBuscas);
      dm_rc.tbitensmoventrega.Open;

    end;

  if mm.VarC_Atelagenerica = 'BLOCOK200' then
    begin
      Ativa_page('BLOCOK200',['BLOCOK200','MEDIDAS','OPERACAOSPED','PESSOASSPED']);
      frmTELAGENERICA.Caption           := 'Bloco K200';

      UniDBGridBLOCOK200.Options  := UniDBGridBLOCOK200.Options - [dgRowSelect];
      UniDBGridBLOCOK200.Options  := UniDBGridBLOCOK200.Options + [dgEditing];
    end;

  if mm.VarC_Atelagenerica = 'HISTORICOBENEPONTO' then
    begin
      Ativa_page('HISTORICOBENEPONTO',['HISTORICOBENEPONTO']);
      frmTELAGENERICA.Caption := 'Consulta Historico Beneficiamento Nota';

      UniEditBENEPRO.Text                        :=  mm.varB_BENEPRODUTO;
      UniEditbenelotesemente.Text                :=  mm.varB_BENELOTE;
      UniEditbeneboletim.Text                    :=  mm.varB_BENEBOLETIM;
      UniFormattedNumberEditbenepureza.Value     :=  mm.varB_BENEPUREZA;
      UniFormattedNumberEditbenegerminacao.Value :=  mm.varB_BENEGERMINACAO;
      UniFormattedNumberEditbenevc.Value         :=  mm.varB_BENEVC;

      SqlPesquisa(ESCRITA_HISTORICOBENENOTAPONTO(mm.varI_Code_Company,
                                                StrToInt(mm.varB_BENEPRODUTO),
                                                mm.varB_BENELOTE,
                                                mm.varB_BENEBOLETIM));

      dm_rc.tbbenepessoa.Close;
      dm_rc.tbbenepessoa.CopyDataSet(dm_rc.sqlBuscas);
      dm_rc.tbbenepessoa.Open;

    end;

  if mm.VarC_Atelagenerica = 'KARDEXPRODUTO' then
    begin
      Ativa_page('KARDEXPRODUTO',['KARDEXPRODUTO']);
      frmTELAGENERICA.Caption := 'Kardex do Produto';

      UniDateTimePickerkarproini.Text := '01/01/2018';
      UniDateTimePickerkarprofin.Text := DateToStr(EndOfTheYear(date));

      UniBitBtnbuscakardexproduto.OnClick(Self);
    end;

  if mm.VarC_Atelagenerica = 'TERMONOTA' then
    begin
      Ativa_page('TERMONOTA',['TERMONOTA']);
      frmTELAGENERICA.Caption := 'Termo de Conformidade';

      if SqlPesquisa(ESCRITA_TERMONOTA(mm.varI_Code_Company,mm.varI_Code_Numero_Documento,mm.varI_Code_Documento_Documento)) then
        begin
          dm_rc.memtermonota.Close;
          dm_rc.memtermonota.Open;
          dm_rc.sqlBuscas.First;
          while not dm_rc.sqlBuscas.Eof do
            begin

              dm_rc.memtermonota.Append;
              dm_rc.memtermonota.FindField('CODIGO').AsInteger        := dm_rc.sqlBuscas.FindField('CODIGO').AsInteger;
              dm_rc.memtermonota.FindField('PRODUTO').AsInteger       := dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
              dm_rc.memtermonota.FindField('DESCRICAO_NOTA').AsString := dm_rc.sqlBuscas.FindField('DESCRICAO_NOTA').AsString;
              dm_rc.memtermonota.FindField('LOTE').AsString           := dm_rc.sqlBuscas.FindField('LOTE').AsString;
              dm_rc.memtermonota.FindField('BOLETIM').AsString        := dm_rc.sqlBuscas.FindField('BOLETIM').AsString;
              dm_rc.memtermonota.FindField('TERMO').AsString          := dm_rc.sqlBuscas.FindField('TERMO').AsString;
              dm_rc.memtermonota.FindField('PUREZA').AsFloat          := dm_rc.sqlBuscas.FindField('PUREZA').AsFloat;
              dm_rc.memtermonota.Post;

              dm_rc.sqlBuscas.Next;
            end;
        end;
      dm_rc.sqlBuscas.Close;
    end;

  if mm.VarC_Atelagenerica = 'LOTENOTAENTRADA' then
    begin
      Ativa_page('LOTENOTAENTRADA',['LOTENOTAENTRADA']);
      frmTELAGENERICA.Caption := 'Lote de Entrada';

      UniEditloteentrada.Text                       := mm.varS_LOTENOTAENTRADA;
      UniFormattedNumberEditpurezaentrada.Value     := mm.varS_PUREZANOTAENTRADA;
      UniFormattedNumberEditvcentrada.Value         := mm.varS_VCNOTAENTRADA;
      UniFormattedNumberEditgerminacaoentrada.Value := mm.varS_GERMINACAONOTAENTRADA;

      UniButtonEditcooperante.Text                  := IntToStr(mm.varC_COOPERANTE);
      UniEditsafracampocooperante.Text              := mm.varC_SAFRACAMPO;
      UniEditcampocooperante.Text                   := mm.varC_CAMPO;
    end;

  if mm.VarC_Atelagenerica = 'ENTRADAXML' then
    begin
      Ativa_page('ENTRADAXML',['ENTRADAXML','ENTRADAXMLDADOS','ENTRADAXMLFINANCEIRO']);

      frmTELAGENERICA.Caption := 'Dados do txt XML';
      UniBitBtn14.Enabled     := False;
      UniBitBtn15.Enabled     := False;
      
      mm.varCONFIRMATXTXMLENTRADA := False;
      

      UniMemodadosxml.Clear;
      UniMemodadosxml.Text := mm.varTXTXML_ENTRADA;

      dm_rc.memprodutos.BeforePost   := nil;
      dm_rc.memprodutos.BeforeDelete := nil;

      DM_RC.tbtitulos.Close;
      DM_RC.tbtitulos.Open;

      if mm.varTXTXML_ENTRADA <> '' then
        UniBitBtn13.OnClick(Self);       
    end;

  if mm.VarC_Atelagenerica = 'PERMISSAO' then
    begin
      Ativa_page('PERMISSAO',['PERMISSAO']);

      frmTELAGENERICA.Caption := 'Gerar Permissão';

      CRUD_permissao('carrega');

      btneditempresa.Text            := IntToStr(mm.varI_Code_Company);
      editnomeusuario.Text           := mm.varPermissao_nome;

      SqlPesquisa(CARREGA_PERMISSAOZERADA());

      R            := 0;
      SubMenu      := 0;
      Sequencial   := 0;
      tabela       := '';

      dm_rc.tb_permissaousuario.Close;
      dm_rc.tb_permissaousuario.Open;

      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          //******************************************************************//
          //MENU
          //******************************************************************//
          if tabela <> dm_rc.sqlBuscas.FindField('MENU').AsString then
            begin
              Inc(Sequencial);
              Inc(R);

              dm_rc.tb_permissaousuario.Append;
              dm_rc.tb_permissaousuario.FindField('REGISTRO').AsInteger  := R;
              dm_rc.tb_permissaousuario.FindField('ID_MENU').AsInteger   := 0;
              dm_rc.tb_permissaousuario.FindField('MENU').AsString       := StrAllTrim(dm_rc.sqlBuscas.FindField('MENU').AsString);
              dm_rc.tb_permissaousuario.Post;

              tabela  := dm_rc.tb_permissaousuario.FindField('MENU').AsString;

              Inc(SubMenu);

              if R <> 1 then
                SubMenu := Sequencial;
            end;

          //******************************************************************//
          // SUB MENU
          //******************************************************************//
          Inc(R);
          Inc(Sequencial);

          dm_rc.tb_permissaousuario.Append;
          dm_rc.tb_permissaousuario.FindField('REGISTRO').AsInteger   := R;
          dm_rc.tb_permissaousuario.FindField('ID_MENU').AsInteger    := SubMenu;
          dm_rc.tb_permissaousuario.FindField('MENU').AsString        := StrAllTrim(dm_rc.sqlBuscas.FindField('TABELA').AsString);
          dm_rc.tb_permissaousuario.FindField('TABELA').AsString      := StrAllTrim(dm_rc.sqlBuscas.FindField('TABELA').AsString);

          dm_rc.tb_permissaousuario.FindField('ACESSAR').AsBoolean    := False;
          dm_rc.tb_permissaousuario.FindField('INCLUIR').AsBoolean    := False;
          dm_rc.tb_permissaousuario.FindField('ALTERAR').AsBoolean    := False;
          dm_rc.tb_permissaousuario.FindField('EXCLUIR').AsBoolean    := False;
          dm_rc.tb_permissaousuario.Post;

          dm_rc.sqlBuscas.Next;
        end;
      Permissao     ('carrega');
      UniDBTreeGridpermissao.Refresh;
    end;

  if mm.VarC_Atelagenerica = 'EXIBEDADOS' then
    begin
      frmTELAGENERICA.Caption := ' Exibe Dados';
      Ativa_page('EXIBEDADOS',['EXIBEDADOS']);
      TabelaMvitens('SELECT * FROM MVITENS');
    end;

  if mm.VarC_Atelagenerica = 'LOGBANCOS' then
    begin
      frmTELAGENERICA.Caption := ' LOG dos Bancos';
      Ativa_page('LOGBANCOS',['LOGBANCOS']);
      SqlPesquisa('SELECT * FROM BANCOS WHERE CODIGO = ' + QuotedStr(mm.varTTLOG_CODIGO));
    end;

  if mm.VarC_Atelagenerica = 'LOGTITULOS' then
    begin
      frmTELAGENERICA.Caption := ' LOG dos Titulos';
      Ativa_page('LOGTITULOS',['LOGTITULOS']);
      TabelaTitulos('SELECT * FROM ' + mm.varTTLOG_TABELA + ' WHERE CODIGO = ' + QuotedStr(mm.varTTLOG_CODIGO));
    end;

  if mm.VarC_Atelagenerica = 'PARCELATITULOS' then
    begin
      Ativa_page('PARCELATITULOS',['PARCELATITULOS']);
      UniDateemissao.DateTime           := Date;
      UniDateTimevencimento.DateTime    := Date;
      UniEditnumerodocumento.Text       := '00000';
      cbxserie.Text                     := 'DUP';
      UniNumberEditparcelatitulos.Value := 0;
      frmTELAGENERICA.Caption           := 'Parcelas Genéricas - CONTAS A '+ mm.varFP_id_parcela;

      UniDBGridparcelastitulos.Options  := UniDBGridparcelastitulos.Options - [dgRowSelect];
      UniDBGridparcelastitulos.Options  := UniDBGridparcelastitulos.Options + [dgEditing];

      dm_rc.tbtitulos.BeforePost   := nil;
      dm_rc.tbtitulos.BeforeDelete := nil;
    end;

  if mm.VarC_Atelagenerica = 'FINANCEIRONOTA' then
    begin
      Ativa_page('FINANCEIRONOTA',['FINANCEIRONOTA']);
      frmTELAGENERICA.Caption := 'Calcula Financeiro NOTA';

      btnLkpClear.Enabled                        := False;

      UniDBGridtitulosnota.Options               := UniDBGridtitulosnota.Options - [dgRowSelect];
      UniDBGridtitulosnota.Options               := UniDBGridtitulosnota.Options + [dgEditing];

      UniFormattedNumberEditTOTALNOTA.Value      := mm.varV_Valor_Documento;
      UniFormattedNumberEdittotalcalculado.Value := 0;

     dm_rc.tbtitulos.BeforePost   := nil;
    end;

  if mm.VarC_Atelagenerica = 'LOGBATIDAMESTRE' then
    begin
      frmTELAGENERICA.Caption := ' LOG de batida Mestre';
      Ativa_page('LOGBATIDAMESTRE',['LOGBATIDAMESTRE']);
    end;

  if mm.VarC_Atelagenerica = 'CALCULAICMS' then
    begin
      frmTELAGENERICA.Caption := ' Calcula I.C.M.S.';
      Ativa_page('CALCULAICMS',['CALCULAICMS']);

//      UniDBGridprodutos.Options          := UniDBGridprodutos.Options - [dgRowSelect];
//      UniDBGridprodutos.Options          := UniDBGridprodutos.Options + [dgEditing];
    end;

  if mm.VarC_Atelagenerica = 'CONFIGURANOTAELETRONICA' then
    begin
      frmTELAGENERICA.Caption := ' Configura Nota Eletrônica/Demais';
      Ativa_page('CONFIGURANOTAELETRONICA',['CONFIGURANOTAELETRONICA','EMPRESACONFIGURA']);

      TabelaEmpresas('select * from empresas where codigo = ' + IntToStr(mm.varI_Code_Empresa_Configuranota));

      dm_rc.tbempresas.UpdateOptions.ReadOnly := True;
      btnempinclui.Enabled                    := True;
      btnempgrava.Enabled                     := False;
    end;

  if mm.VarC_Atelagenerica = 'LOGMANIFESTO' then
    begin
      Ativa_page('LOGMANIFESTO',['LOGMANIFESTO']);
      TabelaMFmestre('select * from MFMESTRE where codigo = ' + IntToStr(mm.varI_Code_Documento_Controle));
    end;


  if mm.VarC_Atelagenerica = 'LOGNOTAELETRONICA' then
    begin
      Ativa_page('LOGNOTAELETRONICA',['LOGNOTAELETRONICA']);
      TabelaMvmestre('select * from mvmestre where codigo = ' + IntToStr(mm.varI_Code_Documento_Controle));
    end;

  if mm.VarC_Atelagenerica = 'PARCELAPGTOMOVIMENTO' then
    begin
      Ativa_page('PARCELAPGTOMOVIMENTO',['PARCELAPGTOMOVIMENTO']);
      edSearchCRUDDtIni.DateTime                 :=  Date;
      frmTELAGENERICA.Caption                    :=  'Gerar Pagamento Manual';
      UniFormattedNumberEditvalordocumento.Value :=  mm.varV_Valor_Documento;
      UniDBGridtitulos.Options                   :=  UniDBGridtitulos.Options + [dgEditing];

      if dm_rc.tbtitulos.RecordCount = 0 then
        begin
          dm_rc.tbtitulos.Close;
          dm_rc.tbtitulos.Open;
        end;

      UniFormattedNumberEdittotalduplicatas.Value := dm_rc.CalculaTitulos;

      dm_rc.tbtitulos.BeforePost   := nil;
      dm_rc.tbtitulos.BeforeDelete := nil;
    end;

  if mm.VarC_Atelagenerica = 'SENHAEXCLUSAONOTA' then
    begin
      Ativa_page('SENHAEXCLUSAONOTA',['SENHAEXCLUSAONOTA']);

      frmTELAGENERICA.Caption             := 'TOKEN DE LIBERAÇÃO';
      UniLabelexclusaonota.Caption        := RemoverEspeciais(Renovarsenha0(StrRight(TimeToStr(Time),4))+StrLeft(DateToStr(Date),2));
      mm.varS_SenhaExclusaoNota_permitido := 'F';
    end;

  if mm.VarC_Atelagenerica = 'ALTERADETALHESNOTA' then
    begin
      Ativa_page('ALTERADETALHESNOTA',['ALTERADETALHESNOTA']);

      frmTELAGENERICA.Caption := 'Alterar NOTA ELETRÔNICA';
      TabelaMvmestre('select * from mvmestre where codigo = ' + IntToStr(mm.varI_Code_Documento_Controle));
      UniEditnomevendedor.Text := Acha_Item('FUNCIONARIOS',DM_RC.FDQryMvmestre.FindField('FUNCIONARIO').AsString);

      dm_rc.FDQryMvmestre.Edit;
    end;

  if mm.VarC_Atelagenerica = 'DETALHESEMISSORDOC' then
    begin
      Ativa_page('DETALHESEMISSORDOC',['DETALHESEMISSORDOC']);
      frmTELAGENERICA.Caption := 'Detalhes do Documento Emissor';

      TabelaMvmestre(' SELECT * FROM MVMESTRE WHERE NUMERO    = ' + IntToStr(MM.varI_Code_Numero_Documento)    +
                     ' AND                          DOCUMENTO = ' + IntToStr(MM.varI_Code_Documento_Documento) +
                     ' AND                          EMPRESA   = ' + IntToStr(MM.varI_Code_Company));

      TabelaMvitens (' SELECT PRODUTO, DESCRICAO, QUANTIDADE, PRECO, TOTAL     ' +
                     ' FROM MVITENS  WHERE NUMERO                            = ' + IntToStr(MM.varI_Code_Numero_Documento)    +
                     ' AND                                         DOCUMENTO = ' + IntToStr(MM.varI_Code_Documento_Documento) +
                     ' AND                                         EMPRESA   = ' + IntToStr(MM.varI_Code_Company)             +
                     ' ORDER BY SEQUENCIA');
    end;

  if mm.VarC_Atelagenerica = 'HISTORICOVENDALOTE' then
    begin
      Ativa_page('HISTORICOVENDALOTE',['HISTORICOVENDALOTE']);
      frmTELAGENERICA.Caption := 'Histórico de Vendas com NOTA do LOTE\BOLETIM';

      dm_rc.tbistlotevenda.Close;
      dm_rc.tbistlotevenda.open;

      //************************************************************************//
      FDQryPesquisa.SQL.Clear;
      FDQryPesquisa.SQL.Text :=  RELATORIO_ESTOQUE_LOTE(mm.M_TIPOPESO,mm.varI_Code_Lote_Lotesemente,mm.varI_Code_Lote_Boletimsemente,mm.varI_Code_Lote_Produto,mm.varI_Code_Company);
      FDQryPesquisa.Open();
      dm_rc.tbistlotevenda.CopyDataSet(FDQryPesquisa);
      dm_rc.tbistlotevenda.Last;
      //************************************************************************//
      mm.varI_Code_Lote_Lotesemente    := '';
      mm.varI_Code_Lote_Boletimsemente := '';
      mm.varI_Code_Lote_Produto        := 0;
    end;
  if mm.VarC_Atelagenerica = 'CONTROLEPONTOS' then
  begin
    Ativa_page('CONTROLEPONTOS',['CONTROLEPONTOS']);
    Caption := 'Selecionar lote';
    FLarguraAnterior := ClientWidth;
    FAlturaAnterior := ClientHeight;
    ClientWidth := 740;
    ClientHeight := 460;
    rcBlock10.Visible := False;
    FLoteOriginal := mm.varC_codigo_busca_lote;
    FLoteConfirmado := False;
    FreeAndNil(FFrameLote);
    FFrameLote := TfraSelecaoLote.Create(Self);
    FFrameLote.Parent := UniTabSheetcontrolepontos;
    FFrameLote.Align := alClient;
    FFrameLote.OnConfirmar := ConfirmarLote;
    FFrameLote.OnCancelar := CancelarLote;
    FFrameLote.Configurar(mm.SQLConn, StrToIntDef(mm.varC_referencia_produto, 0), FLoteOriginal);
  end;

  if mm.VarC_Atelagenerica = 'HISTORICOFATURAMENTO' then
    begin
      Ativa_page('HISTORICOFATURAMENTO',['HISTORICOFATURAMENTO','HISTORICOPRODUTOPESSOA','HISTORICOLOTEPESSOA']);
      frmTELAGENERICA.Caption := 'Histórico da Movimentação por Cliente';

      dm_rc.tbhistpessoas.Close;
      dm_rc.tbhistpessoas.Open;

      dm_rc.tbhistprodutos.Close;
      dm_rc.tbhistprodutos.Open;

      dm_rc.tbhistlote.Close;
      dm_rc.tbhistlote.open;

      //************************************************************************//
      FDQryPesquisa.SQL.Clear;
      FDQryPesquisa.SQL.Text :=
        ' SELECT RM.operacao_op,RM.cancelada, RM.EMISSAO,                                             ' +
        ' RM.numero, RM.vlrbaseicms, RM.pedido, RM.vlricms, RM.vlrprodutos, RM.vlrtotal FROM relatorio_mestre rm ' +
        ' where rm.empresa =                         ' + IntToStr(mm.varI_Code_Company)          +
        ' and rm.pessoa    =                         ' + IntToStr(mm.varI_Code_Pessoa_historico) +
        ' and rm.documento = 1                       ' +
        ' and rm.cancelada =                         ' + QuotedStr('A')                          +
        ' ORDER BY RM.NUMERO                         ';
      FDQryPesquisa.Open();
      dm_rc.tbhistpessoas.CopyDataSet(FDQryPesquisa);
      //************************************************************************//
      FDQryPesquisa.SQL.Clear;
      FDQryPesquisa.SQL.Text :=
       ' select rm.operacao_op, rm.produto, rm.descricao, sum(rm.quantidade) as quantidade ' +
       ' FROM relatorio_mvitens rm                                                         ' +
       ' where rm.empresa =                                                                ' + IntToStr(mm.varI_Code_Company)          +
       ' and rm.pessoa =                                                                   ' + IntToStr(mm.varI_Code_Pessoa_historico) +
       ' and rm.cancelada =                                                                ' + QuotedStr('A')                +
       ' group by 1,2,3                                                                    ' +
       ' order by quantidade desc                                                          ';
      FDQryPesquisa.Open();
      dm_rc.tbhistprodutos.CopyDataSet(FDQryPesquisa);
      //************************************************************************//
      FDQryPesquisa.SQL.Clear;
      FDQryPesquisa.SQL.Text :=
       ' SELECT                                          ' +
       ' rm.operacao_op,rm.numero, rm.serie, rm.data   , ' +
       ' rm.produto,rm.descricao,rm.lotesemente,         ' +
       ' rm.termo       , rm.pureza, rm.quantidade       ' +
       ' FROM                                            ' +
       '   relatorio_lotes rm                            ' +
       ' WHERE rm.empresa  =                             ' + IntToStr(mm.varI_Code_Company)          +
       ' and   rm.pessoa   =                             ' + IntToStr(mm.varI_Code_Pessoa_historico) +
       ' and rm.cancelada  =                             ' + QuotedStr('A')                          +
       ' order by 4                                      ';
      FDQryPesquisa.Open();
      dm_rc.tbhistlote.CopyDataSet(FDQryPesquisa);
      //************************************************************************//
      mm.varI_Code_Pessoa_historico := 0;
    end;
end;
end.
