unit untCadCIDADES; // 8.0.0.0
(*
[PT] Conversão RADCore 3.0 -> 8.0
     - TfrmcadCIDADES = class(TfrmCRUDPROPRIO) -> TfrmCadCIDADES = class(TfrmCRUDproprio)
     - var global removida; uses Vcl/Winapi/System/uniScreenMask/UniButtonDbEdit removidos
     - UniButtonDbEditCEPP -> edCep (TUniDBEdit + mask:cep no DFM)
     - UniDBComboBoxestado (campo UF) -> par edLkpUFS (lookup tabela UFS) +
       edLkpUFS_SetDS_UF (bound ao campo UF, exibe a sigla gravada)
     - labExit removido da classe (já é herdado da base 8.0 - top bar)
     - estrutura final dos componentes fecha com a conversão do DFM
[EN] RADCore 3.0 -> 8.0 conversion
*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, StrUtils,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIApplication, uniGUIClasses, uniGUIFrame, untFrmCRUDproprio, Data.DB, uniBasicGrid, uniDBGrid,
  uniPanel, uniPageControl, uniGUIBaseClasses, uniScrollBox, uniDBEdit,
  uniMultiItem, uniComboBox, uniEdit, uniLabel, uniButton, uniBitBtn,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniCheckBox, uniFieldSet,
  uniDBComboBox, uniDBLookupComboBox, uniSpeedButton, uniDBCheckBox,
  uniMainMenu, uniHTMLFrame, Data.FMTBcd, Data.SqlExpr, uniSpinEdit, uniMemo, Vcl.Menus, uniSweetAlert, uniDBNavigator,
  untFrmBaseCRUD, uniDateTimePicker;

type
  TfrmCadCIDADES = class(TfrmCRUDproprio)
    pgComplementData: TUniPageControl;
    tabGeral: TUniTabSheet;
    sboxGridBlockTab1: TUniScrollBox;
    rcBlock515: TUniContainerPanel;
    rcBlock2: TUniContainerPanel;
    rcBlock3: TUniContainerPanel;
    labRcCollapseGeneral: TUniLabel;
    labTitleCardGeral: TUniLabel;
    rcBlock10: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    rcBlock20: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    rcBlock30: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock40: TUniContainerPanel;
    UniLabel20: TUniLabel;
    edLkpUFS: TUniDBEdit;
    rcBlock50: TUniContainerPanel;
    UniLabel15: TUniLabel;
    edCep: TUniDBEdit;
    rcBlock60: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniDBEdit3: TUniDBEdit;
    procedure edLkpUFSExit(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, untFrmLookUp, Main,
  untFrmMessage, uconsts, uconsts_cfg,
  mkm_func_web, mkm_layout, mkm_restfuncs, mkm_crudfuncs; //8.0.0.0

procedure TfrmCadCIDADES.UniFrameCreate(Sender: TObject);
begin

  sqlMaster.SQL.Text := ' SELECT [[fields]]   ' +
                        '   FROM [[table]] tab ' +
                        '  WHERE tab.[[pk]] = :table_pk ' +  //[PT] Apenas cadastro MESTRE é necessário o WHERE
                        ' FROM  [[table]] tab ' ;


  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:'+
                        'grid-resize|'+
                        'model-crud:0(btns-cls:colorful)|'+
                        'grid-paginator:center|' +
                        ']]';

  inherited;

end;

//8.0.0.0
// 3.0: UniDBComboBoxestado (combo hardcoded de UFs gravando no campo UF)
// 8.0: lookup declarativo na tabela UFS; no Exit grava a sigla selecionada em UF
procedure TfrmCadCIDADES.edLkpUFSExit(Sender: TObject);
begin
  inherited;
  if sqlMaster.State in [dsEdit, dsInsert] then
     sqlMaster.FieldByName( 'UF' ).AsString := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'DESCRICAO' );
end;

procedure TfrmCadCIDADES.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  dm_rc.rc_GridDrawCell( dbgSearchCRUD , ACol, ARow, Column, Attribs ) ;
end;

initialization
  RegisterClass(TfrmCadCIDADES);

end.
