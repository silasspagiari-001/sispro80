unit untCadRESPONSAVEL; // RadCore 8.0

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmCRUDproprio, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniGUIClasses, uniEdit,
  uniLabel, uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniCheckBox, uniDBCheckBox, uniDBEdit,
  uniDBComboBox, uniImage, uniFileUpload, uniMemo, uniScreenMask, Vcl.Menus,
  uniMainMenu, uniSweetAlert, uniDateTimePicker;

type
  TfrmCADRESPONSAVEL = class(TfrmCRUDPROPRIO)
    pgComplementData: TUniPageControl;
    tabGeral: TUniTabSheet;
    sboxGridBlockTab1: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniLabel6: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel7: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    UniLabel8: TUniLabel;
    UniDBEdit4: TUniDBEdit;
    UniLabel9: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    UniLabel10: TUniLabel;
    UniDBEdit6: TUniDBEdit;
    UniLabel11: TUniLabel;
    UniDBEdit7: TUniDBEdit;
    rcBlock100: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    rcBlock130: TUniContainerPanel;
    rcBlock140: TUniContainerPanel;
    edCep: TUniDBEdit;
    UniLabel12: TUniLabel;
    UniDBEdit8: TUniDBEdit;
    UniLabel13: TUniLabel;
    UniDBEdit9: TUniDBEdit;
    UniLabel14: TUniLabel;
    UniLabel15: TUniLabel;
    UniDBEdit10: TUniDBEdit;
    UniLabel16: TUniLabel;
    UniDBEdit11: TUniDBEdit;
    UniLabel17: TUniLabel;
    UniDBComboBox4: TUniDBComboBox;
    rcBlock150: TUniContainerPanel;
    UniDBEdit12: TUniDBEdit;
    UniLabel18: TUniLabel;
    rcBlock160: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    imgUser: TUniImage;
    btnLoadImg: TUniBitBtn;
    uniFileUp: TUniFileUpload;
    procedure UniFrameCreate(Sender: TObject);
    procedure edCepExit(Sender: TObject);
    procedure btnLoadImgClick(Sender: TObject);
    procedure uniFileUpCompleted(Sender: TObject; AStream: TFileStream);
    procedure dsMasterDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure carregaimagem(f_caminho:string);
  end;

var
  frmCADRESPONSAVEL: TfrmCADRESPONSAVEL;

implementation

{$R *.dfm}

uses untDM_RC;

procedure TfrmCADRESPONSAVEL.UniFrameCreate(Sender: TObject);
begin
  dbgSearchCRUD.Hint := '[[fieldmasks:grid-resize|' +
    'model-crud:0(btns-cls:colorful)|grid-paginator:center|]]';
  dm_rc.rc_FillSearchFieldsCRUD(Self, cbxSearchCRUDField1.Name, 'NOME', 'NOME');
  inherited;
end;

procedure TfrmCADRESPONSAVEL.btnLoadImgClick(Sender: TObject);
begin
  if not (sqlMaster.State in [dsEdit, dsInsert]) then
    Exit;
  uniFileUp.Filter := '*.png';
  uniFileUp.TargetFolder := 'uploads';
  if dm_rc.rc_ForceDirectories(uniFileUp.TargetFolder) then
    uniFileUp.Execute;
end;

procedure TfrmCADRESPONSAVEL.carregaimagem(f_caminho: string);
begin
  imgUser.Picture.Assign(nil);
  if (Trim(f_caminho) = '') or not FileExists(f_caminho) then
    Exit;
  try
    imgUser.Picture.LoadFromFile(f_caminho);
  except
    on E: EInvalidGraphic do
      imgUser.Picture.Assign(nil);
    on E: EFOpenError do
      imgUser.Picture.Assign(nil);
  end;
end;

procedure TfrmCADRESPONSAVEL.dsMasterDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if Field <> nil then
    if not SameText(Field.FieldName, 'ASSINATURA') then
      Exit;
  if not sqlMaster.Active then
  begin
    imgUser.Picture.Assign(nil);
    Exit;
  end;
  if sqlMaster.IsEmpty then
    imgUser.Picture.Assign(nil)
  else
    carregaimagem(sqlMaster.FieldByName('ASSINATURA').AsString);
end;

procedure TfrmCADRESPONSAVEL.edCepExit(Sender: TObject);
begin
  inherited;
  if not (sqlMaster.State in [dsEdit, dsInsert]) then
    Exit;
  dm_rc.rc_SearchPostalCodeCEP(sqlMaster.FieldByName('CEP').AsString,
    Self.Name, sqlMaster, UniDBComboBox4, UniDBEdit11,
    UniDBEdit10, UniDBEdit8);
end;

procedure TfrmCADRESPONSAVEL.uniFileUpCompleted(Sender: TObject;
  AStream: TFileStream);
begin
  if not (sqlMaster.State in [dsEdit, dsInsert]) then
    Exit;
  imgUser.Picture.LoadFromFile(AStream.FileName);
  sqlMaster.FieldByName('ASSINATURA').AsString := AStream.FileName;
end;

initialization
  RegisterClass(TfrmCADRESPONSAVEL);
end.
