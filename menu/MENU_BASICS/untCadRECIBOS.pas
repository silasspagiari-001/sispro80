unit untCadRECIBOS;

interface

uses untDM_RC, Vcl.Menus, uniMainMenu, uniSweetAlert, uniDateTimePicker,
 
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmCRUDproprio, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  uniGUIBaseClasses, uniGUIClasses, uniScreenMask, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, uniHTMLFrame, uniBasicGrid, uniDBGrid, uniMultiItem,
  uniComboBox, uniEdit, uniScrollBox, uniPanel, uniPageControl, uniButton,
  uniBitBtn, uniLabel, uniMemo, uniDBEdit, uniDateTimePicker,
  uniDBDateTimePicker, uniDBComboBox;

type
  TfrmCADRECIBOS = class(TfrmCRUDPROPRIO)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    UniDBEdit1: TUniDBEdit;
    UniLabel5: TUniLabel;
    UniLabel4: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniLabel6: TUniLabel;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniDBDateTimePickerPAGAMENTO: TUniDBDateTimePicker;
    UniDBEdit3: TUniDBEdit;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    rcBlock80: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    UniLabel10: TUniLabel;
    UniDBEdit4: TUniDBEdit;
    UniLabel11: TUniLabel;
    rcBlock100: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    UniLabel12: TUniLabel;
    UniDBEdit10: TUniDBEdit;
    UniDBComboBoxestado: TUniDBComboBox;
    UniLabel13: TUniLabel;
    UniLabel14: TUniLabel;
    rcBlock130: TUniContainerPanel;
    rcBlock140: TUniContainerPanel;
    rcBlock150: TUniContainerPanel;
    UniLabel15: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    UniDBEdit6: TUniDBEdit;
    UniLabel16: TUniLabel;
    UniLabel17: TUniLabel;
    FDQryFiltroKEY: TStringField;
    FDQryFiltroCODIGO: TIntegerField;
    FDQryFiltroEMPRESA: TIntegerField;
    FDQryFiltroPAGAMENTO: TDateField;
    FDQryFiltroVALOR: TFMTBCDField;
    FDQryFiltroRECEBI_DE: TStringField;
    FDQryFiltroNOME: TStringField;
    FDQryFiltroCPFCNPJ: TStringField;
    FDQryFiltroCIDADE: TStringField;
    FDQryFiltroESTADO: TStringField;
    FDQryFiltroNUMERO: TIntegerField;
    FDQryFiltroSEQUENCIA: TIntegerField;
    FDQryFiltroREFERENTE: TStringField;
    FDQryFiltroATIVO: TStringField;
    procedure FDQryFiltroKEYGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADRECIBOS: TfrmCADRECIBOS;

implementation

{$R *.dfm}

uses mkm_impressao, unReportImpressao, MainModule;
procedure TfrmCADRECIBOS.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
begin
  if Column.FieldName = 'KEY' then
    begin
      mm.varC_caminhopdf :=  IMPRESSAO_recibo(sqlSearchMaster.FindField('CODIGO').AsInteger);
      unfImpressao.ShowModal();
    end;
end;

procedure TfrmCADRECIBOS.FDQryFiltroKEYGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  inherited;
  Text :=
  '<i title="Opcoes" class="fa fa-lg fa-print" style="color:black; cursor:pointer;"></i>';
end;

initialization
  RegisterClass(TfrmCADRECIBOS);
end.
