unit untCadDOCUMENTOS; // 8.0.0.0
(*
[PT] Conversão RADCore 3.0 -> 8.0
     - UniButtonDbEditoperacao (busca 'OPERACOES' -> campo OPERACAO)
       -> lookup declarativo edLkpOPERACOES + edLkpOPERACOES_SetDS_OPERACAO
     - UniButtonDbEditpessoa (busca 'PESSOAS' -> campo PESSOA)
       -> lookup declarativo edLkpPESSOAS + edLkpPESSOAS_SetDS_PESSOA
     - UniButtonDbEditcondicao (busca 'CONDICOES' -> campo CONDICAO)
       -> lookup declarativo edLkpCONDICOES + edLkpCONDICOES_SetDS_CONDICAO
     - FDQryCad.Edit/FindField -> sqlMaster.FieldByName
     - estrutura final (card/collapse) fecha com a conversão do DFM
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
  TfrmCadDOCUMENTOS = class(TfrmCRUDproprio)
    pgComplementData: TUniPageControl;
    tabGeral: TUniTabSheet;
    sboxGridBlockTab1: TUniScrollBox;
    rcBlock515: TUniContainerPanel;
    rcBlock2: TUniContainerPanel;
    rcBlock3: TUniContainerPanel;
    labRcCollapseGeneral: TUniLabel;
    labTitleCardGeral: TUniLabel;
    rcBlock10: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    rcBlock20: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    rcBlock30: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock40: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    rcBlock50: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniDBNumberEdit1: TUniDBNumberEdit;
    rcBlock60: TUniContainerPanel;
    UniLabel8: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    rcBlock70: TUniContainerPanel;
    UniLabel9: TUniLabel;
    edLkpOPERACOES: TUniDBEdit;
    rcBlock90: TUniContainerPanel;
    UniLabel11: TUniLabel;
    edLkpCONDICOES: TUniDBEdit;
    UniDBEdit4: TUniDBEdit;
    procedure edLkpOPERACOESExit(Sender: TObject);
    procedure edLkpPESSOASExit(Sender: TObject);
    procedure edLkpCONDICOESExit(Sender: TObject);
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

procedure TfrmCadDOCUMENTOS.UniFrameCreate(Sender: TObject);
begin
  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:'+
                        'grid-resize|'+
                        'model-crud:0(btns-cls:colorful)|'+
                        'grid-paginator:center|' +
                        ']]';

  inherited;

end;

procedure TfrmCadDOCUMENTOS.dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  dm_rc.rc_GridDrawCell( dbgSearchCRUD , ACol, ARow, Column, Attribs ) ;
end;

//8.0.0.0
// 3.0: UniButtonDbEditoperacaoButtonClick fazia mm.Seta_Busca('OPERACOES')
//      e gravava FDQryCad.FindField('OPERACAO') com o codigo escolhido
// 8.0: lookup declarativo; no Exit gravamos o codigo selecionado em OPERACAO
procedure TfrmCadDOCUMENTOS.edLkpOPERACOESExit(Sender: TObject);
begin
  inherited;
  if sqlMaster.State in [dsEdit, dsInsert] then
     sqlMaster.FieldByName( 'OPERACAO' ).AsString := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'CODIGO' );
end;

//8.0.0.0
// 3.0: UniButtonDbEditpessoaButtonClick fazia mm.Seta_Busca('PESSOAS')
//      e gravava FDQryCad.FindField('PESSOA') com o codigo escolhido
// 8.0: lookup declarativo exibindo NOME; no Exit gravamos o codigo selecionado em PESSOA
procedure TfrmCadDOCUMENTOS.edLkpPESSOASExit(Sender: TObject);
begin
  inherited;
  if sqlMaster.State in [dsEdit, dsInsert] then
     sqlMaster.FieldByName( 'PESSOA' ).AsString := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'CODIGO' );
end;

//8.0.0.0
// 3.0: UniButtonDbEditcondicaoButtonClick fazia mm.Seta_Busca('CONDICOES')
//      e gravava FDQryCad.FindField('CONDICAO') com o codigo escolhido
// 8.0: lookup declarativo; no Exit gravamos o codigo selecionado em CONDICAO
procedure TfrmCadDOCUMENTOS.edLkpCONDICOESExit(Sender: TObject);
begin
  inherited;
  if sqlMaster.State in [dsEdit, dsInsert] then
     sqlMaster.FieldByName( 'CONDICAO' ).AsString := dm_rc.rc_GetLookUpField( Self, TUniDBEdit( Sender ), 'CODIGO' );
end;

initialization
  RegisterClass(TfrmCadDOCUMENTOS);

end.
