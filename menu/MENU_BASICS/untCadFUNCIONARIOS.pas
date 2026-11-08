unit untCadFUNCIONARIOS; // RadCore 8.0

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmCRUDproprio, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniGUIClasses, uniEdit,
  uniLabel, uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniCheckBox, uniDBCheckBox, uniDBEdit, uniDateTimePicker,
  uniDBDateTimePicker, uniMemo, uniDBComboBox, uniScreenMask,
  uniDBMemo, Vcl.Menus, uniMainMenu, uniSweetAlert;

type
  TfrmcadFUNCIONARIOS = class(TfrmCRUDPROPRIO)
    pgComplementData: TUniPageControl;
    tabGeral: TUniTabSheet;
    sboxGridBlockTab1: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    UniLabel7: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniLabel13: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    UniLabel4: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniLabel6: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel8: TUniLabel;
    rcBlock80: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    rcBlock100: TUniContainerPanel;
    UniDBEdit3: TUniDBEdit;
    UniLabel9: TUniLabel;
    UniDBEdit4: TUniDBEdit;
    UniLabel10: TUniLabel;
    UniDBFormattedNumberEditdescontos: TUniDBFormattedNumberEdit;
    UniLabel11: TUniLabel;
    UniDBComboBox1: TUniDBComboBox;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    rcBlock130: TUniContainerPanel;
    rcBlock140: TUniContainerPanel;
    edCep: TUniDBEdit;
    UniLabel15: TUniLabel;
    UniDBEdit7: TUniDBEdit;
    UniLabel16: TUniLabel;
    UniLabel17: TUniLabel;
    UniDBEdit8: TUniDBEdit;
    UniLabel18: TUniLabel;
    UniDBEdit9: TUniDBEdit;
    rcBlock150: TUniContainerPanel;
    rcBlock160: TUniContainerPanel;
    UniDBEdit10: TUniDBEdit;
    UniLabel19: TUniLabel;
    UniLabel20: TUniLabel;
    UniDBComboBoxestado: TUniDBComboBox;
    rcBlock170: TUniContainerPanel;
    rcBlock180: TUniContainerPanel;
    UniDBEdit6: TUniDBEdit;
    UniLabel12: TUniLabel;
    UniDBEdit11: TUniDBEdit;
    UniLabel14: TUniLabel;
    UniDBComboBox2: TUniDBComboBox;
    UniLabel21: TUniLabel;
    UniLabel22: TUniLabel;
    rcBlock210: TUniContainerPanel;
    UniDBMemo1: TUniDBMemo;
    L1: TUniMenuItem;
    procedure edCepExit(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure L1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadFUNCIONARIOS: TfrmcadFUNCIONARIOS;

implementation

{$R *.dfm}

uses MainModule, untDM_RC, mkm_impressao, ServerModule;

procedure TfrmcadFUNCIONARIOS.UniFrameCreate(Sender: TObject);
begin
  dbgSearchCRUD.Hint := '[[fieldmasks:grid-resize|' +
    'model-crud:0(btns-cls:colorful)|grid-paginator:center|]]';
  dm_rc.rc_FillSearchFieldsCRUD(Self, cbxSearchCRUDField1.Name, 'NOME', 'NOME');
  inherited;
end;

procedure TfrmcadFUNCIONARIOS.L1Click(Sender: TObject);
var
  PdfFile: string;
//  PdfForm: TfrmBasePDF;
begin
  inherited;
  if not sqlSearchMaster.Active or sqlSearchMaster.IsEmpty then
  begin
  //  dm_rc.rc_ShowSweetAlert('ALERTA', 'SEM REGISTROS PARA IMPRIMIR', 'error', false);
    Exit;
  end;

  mm.varC_caminhopdf := LISTAGEM_Funcionarios(mm.varI_Code_Company, sqlSearchMaster);
  PdfFile := IncludeTrailingPathDelimiter(mm.M_PATHIMPRESSAO) +
    ExtractFileName(mm.varC_caminhopdf);
//  PdfForm := frmBasePDF;
//  PdfForm.labTitleFrm.Caption := 'Listagem de Funcionarios';
//  PdfForm.btnPDF.Visible := False;
 // PdfForm.UniPDFFrame1.PdfURL := sm.FilesFolderURL + 'temp/' +
  //  ExtractFileName(mm.varC_caminhopdf);
 // PdfForm.ShowModal(
//    procedure(Sender: TComponent; AResult: Integer)
 //   begin
 //     DeleteFile(PdfFile);
 //   end);
end;

procedure TfrmcadFUNCIONARIOS.edCepExit(Sender: TObject);
begin
  inherited;
  if not (sqlMaster.State in [dsEdit, dsInsert]) then
    Exit;
  // Retorno do CEP para os campos existentes neste cadastro.
  dm_rc.rc_SearchPostalCodeCEP(sqlMaster.FieldByName('CEP').AsString,
    Self.Name, sqlMaster, UniDBComboBoxestado, UniDBEdit10,
    UniDBEdit9, UniDBEdit7);
end;

initialization
  RegisterClass(TfrmcadFUNCIONARIOS);
end.
