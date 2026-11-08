unit untCadRECEBER;

// =====================================================================
// untCadRECEBER — conversão 3.0 -> 8.0 (descendente de TfrmBaseTITULOS)
// - FDQryFiltro -> sqlSearchMaster (fields adicionais mantêm nome
//   FDQryFiltroXxx no dfm, filhos do inherited sqlSearchMaster)
// - L1Click sem inherited (sem ancestral); G1Click mantem inherited
//   (TfrmBaseTITULOS.G1Click = PARCELATITULOS)
// - dbgSearchCRUDCellClick/MouseDown mantem inherited (base 8.0 tem)
// =====================================================================

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniPanel, uniHTMLFrame,
  uniGUIClasses, uniEdit, uniDBEdit, uniLabel, uniGUIBaseClasses,
  UniButtonDbEdit, UniButtonEdit, uniBasicGrid, uniDBGrid, uniMultiItem,
  uniComboBox, uniDateTimePicker, uniScrollBox, uniPageControl, uniButton,
  uniBitBtn, Vcl.Menus, uniMainMenu, uniDBComboBox, uniDBDateTimePicker, uniMemo,
  uniDBMemo, uniScreenMask, uniSweetAlert, uniCheckBox,untFrmBaseTITULOS,untFrmBAIXATITULOS;

type
  TfrmcadRECEBER = class(TfrmBaseTITULOS)
    UniPopupMenuopcoes: TUniPopupMenu;
    H1: TUniMenuItem;
    N2: TUniMenuItem;
    D1: TUniMenuItem;
    N3: TUniMenuItem;
    L1: TUniMenuItem;
    sqlSearchMasterKEY: TStringField;
    sqlSearchMasterCODIGO: TIntegerField;
    sqlSearchMasterNUMERO: TIntegerField;
    sqlSearchMasterCARTEIRA: TIntegerField;
    sqlSearchMasterSERIE: TStringField;
    sqlSearchMasterSEQUENCIA: TIntegerField;
    sqlSearchMasterPESSOA: TIntegerField;
    sqlSearchMasterNOME: TStringField;
    sqlSearchMasterEMISSAO: TDateField;
    sqlSearchMasterVENCIMENTO: TDateField;
    sqlSearchMasterPAGAMENTO: TDateField;
    sqlSearchMasterVALORATUAL: TFMTBCDField;
    sqlSearchMasterVALORORIGINAL: TFMTBCDField;
    sqlSearchMasterVALORPAGO: TFMTBCDField;
    sqlSearchMasterOBSERVACOES: TStringField;
    sqlSearchMasterSITUACAO: TStringField;
    sqlMasterKEY: TStringField;
    sqlMasterCODIGO: TIntegerField;
    sqlMasterEMPRESA: TIntegerField;
    sqlMasterFINANCEIRO: TIntegerField;
    sqlMasterDOCUMENTO: TIntegerField;
    sqlMasterFUNCIONARIO: TIntegerField;
    sqlMasterPERCCOMISSAO: TCurrencyField;
    sqlMasterCOMISSAOFUNCIONARIO: TCurrencyField;
    sqlMasterPORTADOR: TIntegerField;
    sqlMasterCARTEIRA: TIntegerField;
    sqlMasterPLANOCONTAS: TStringField;
    sqlMasterAPLICACAO: TIntegerField;
    sqlMasterPEDIDO: TStringField;
    sqlMasterNUMERO: TIntegerField;
    sqlMasterSERIE: TStringField;
    sqlMasterSEQUENCIA: TIntegerField;
    sqlMasterPESSOA: TIntegerField;
    sqlMasterEMISSAO: TDateField;
    sqlMasterVENCIMENTO: TDateField;
    sqlMasterPAGAMENTO: TDateField;
    sqlMasterVALORORIGINAL: TFMTBCDField;
    sqlMasterVALORATUAL: TFMTBCDField;
    sqlMasterVALORDESCONTOS: TFMTBCDField;
    sqlMasterVALORJUROS: TFMTBCDField;
    sqlMasterVALORTAXAS: TFMTBCDField;
    sqlMasterVALORPAGO: TFMTBCDField;
    sqlMasterEMISSAOBOLETO: TDateField;
    sqlMasterDATABOLETO: TDateField;
    sqlMasterCONFIRMABOLETO: TStringField;
    sqlMasterCONFIRMAREMESSA: TStringField;
    sqlMasterCODIGOBARRAS: TStringField;
    sqlMasterSITUACAO: TStringField;
    sqlMasterVALORDIVERSOS: TFMTBCDField;
    sqlMasterOBSERVACOES: TStringField;
    sqlMasterNOSSONUMERO: TStringField;
    sqlMasterREMESSA: TIntegerField;
    sqlMasterEXPORTADO: TStringField;
    sqlMasterLOGINCLUSAO: TStringField;
    sqlMasterLOGALTERACAO: TStringField;
    sqlMasterLOGBAIXA: TStringField;
    sqlMasterLOGPARCIAL: TStringField;
    sqlMasterLOGREMESSA: TStringField;
    sqlMasterCOMPETENCIA: TDateField;
    sqlMasterFRETE: TFMTBCDField;
    sqlMasterSAFRA: TIntegerField;
    sqlMasterCAMINHOREMESSA: TStringField;
    sqlMasterNUMEROBOLETO: TIntegerField;
    sqlMasterHORABOLETO: TTimeField;
    sqlMasterANEXO: TStringField;
    sqlMasterNUMEROPEDIDO: TStringField;
    N4: TUniMenuItem;
    B1: TUniMenuItem;
    procedure dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure UniFrameCreate(Sender: TObject);
    procedure sqlSearchMasterSITUACAOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure sqlMasterSITUACAOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure B1Click(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
  private
    { Private declarations }
  posicao_x, posicao_y    : Integer;
  public
    { Public declarations }
  end;

var
  frmcadRECEBER: TfrmcadRECEBER;

implementation

uses
  Vcl.Grids, mkm_impressao, unReportImpressao, untDM_RC, MainModule,
  untFrmTELAGENERICA;

{$R *.dfm}
procedure TfrmcadRECEBER.B1Click(Sender: TObject);
var   Financeiro: TfrmBAIXATITULO;

begin
  if sqlSearchMaster.IsEmpty then
    Exit;

   Financeiro:=frmBAIXATITULO;
   financeiro.PreparaBaixa( sqlSearchMasterCODIGO.AsInteger,'RECEBER');
   Financeiro.ShowModal(


    procedure( Sender: TComponent; Result: Integer )
    begin
      if Result = mrOK then
        btnSearchCRUD.Click; // reabre o grid: atualiza SITUACAO/VALORPAGO/badges
    end );

end;

procedure TfrmcadRECEBER.btnOptionsClick(Sender: TObject);
begin
  inherited;
  UniPopupMenuopcoes.PopupBy( TUniButton( sender ) );
end;

procedure TfrmcadRECEBER.dbgSearchCRUDMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  posicao_x := X;
  posicao_y := Y;
end;

procedure TfrmcadRECEBER.sqlMasterSITUACAOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;

      if sqlSearchMasterSITUACAO.AsString = 'Aberto' then
        begin
          ContainerSituacao.Color := $0066A8EA;
          lbSituacao.Text := 'Aberto';
        end
      else
      if sqlSearchMasterSITUACAO.AsString = 'Pago' then
        begin
          ContainerSituacao.Color := $00808040;
          lbSituacao.Text := 'Pago';
        end;
      if sqlSearchMasterSITUACAO.AsString = 'Aberto' then
        begin
          if Date > sqlSearchMasterVENCIMENTO.AsDateTime then
            begin
              ContainerSituacao.Color := $004545D6;
              lbSituacao.Text := 'Atrasado';
            end;
        end;

end;

procedure TfrmcadRECEBER.sqlSearchMasterSITUACAOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if sqlSearchMasterSITUACAO.AsString = 'Aberto' then
        Text := '<span class="badge text-bg-warning">Aberto</span>'
      else
      if sqlSearchMasterSITUACAO.AsString = 'Pago' then
        Text := '<span class="badge text-bg-success">Pago</span>';
      if sqlSearchMasterSITUACAO.AsString = 'Aberto' then
        begin
          if Date > sqlSearchMasterVENCIMENTO.AsDateTime then
            Text := '<span class="badge text-bg-danger">Atrasado</span>';

        end;
    end;
end;

procedure TfrmcadRECEBER.UniFrameCreate(Sender: TObject);
begin

sqlMaster.SQL.Text := ' SELECT tab.* FROM RECEBER tab ' +
    ' WHERE tab.[[pk]] = :table_pk ' +
    ' AND tab.EMPRESA = ' + IntToStr(mm.varI_Code_Company) +
    ' AND tab.FINANCEIRO = 1 ' +
    ' [grid] SELECT  tab.KEY, tab.CODIGO, tab.NUMERO, tab.DOCUMENTO, tab.CARTEIRA, ' +
    ' tab.EMPRESA, tab.SERIE, tab.SEQUENCIA, tab.PESSOA, P.NOME, '+
    ' tab.EMISSAO, tab.VENCIMENTO, tab.PAGAMENTO, tab.VALORATUAL, '+
    ' tab.VALORORIGINAL, tab.VALORPAGO, tab.OBSERVACOES, tab.SITUACAO '+
    ' FROM  RECEBER tab INNER JOIN PESSOAS P ON (tab.PESSOA = P.CODIGO) ';


    dbgSearchCRUD.Hint := '[[' +
                    'fieldmasks:'+
                    'model-crud:2|'+
                    'info-state:off|' +
                    'grid-paginator:center|' +
                    'codigo[[titlealign:c|align:c]];' +
                    ']]';

  mm.varC_PK_MasterTable := 'CODIGO';

 dm_rc.rc_FillSearchFieldsCRUD(Self,
    cbxSearchCRUDFieldDate.Name, 'tab.VENCIMENTO', 'Vencimento');

  dm_rc.rc_FillSearchFieldsCRUD(Self,
    cbxSearchCRUDFieldDate.Name, 'tab.EMISSAO', 'Emissão');

  dm_rc.rc_FillSearchFieldsCRUD(Self,
    cbxSearchCRUDFieldDate.Name, 'tab.PAGAMENTO', 'Pagamento');
  inherited;
  ed_Where_Search.Text   := ''; // ' tab.codiemp = ' + IntToStr( mm.varI_Code_Company ) ; // Ex: ed_Where_Search.Text := ' tab.' + ed_Table_Deleted_Field.Text + ' = ''N''';
  ed_GroupBy_Search.Text := '';
  ed_Having_Search.Text  := '';
  ed_Order_Search.Text := 'tab.VENCIMENTO';

 dm_rc.rc_FillSearchFieldsCRUD(Self,
    cbxSearchCRUDField1.Name, 'tab.NUMERO', 'Número');

  dm_rc.rc_FillSearchFieldsCRUD(Self,
    cbxSearchCRUDField1.Name, 'tab.PESSOA', 'Código da pessoa');

  dm_rc.rc_FillSearchFieldsCRUD(Self,
    cbxSearchCRUDField1.Name, 'tab.SERIE', 'Série');
end;

initialization
  RegisterClass(TfrmcadRECEBER);

end.
