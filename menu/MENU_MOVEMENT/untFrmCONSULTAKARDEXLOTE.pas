unit untFrmCONSULTAKARDEXLOTE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, uniBasicGrid, uniDBGrid, uniEdit,
  uniDateTimePicker, UniButtonEdit, uniButton, uniBitBtn, uniLabel,
  uniScrollBox, uniPageControl, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmCONSULTAKARDEXLOTE = class(TfrmBase)
    pgBaseCadControl: TUniPageControl;
    tabSearch: TUniTabSheet;
    paBaseRegSearch: TUniContainerPanel;
    paSearchFilters: TUniPanel;
    UniScrollBox1: TUniScrollBox;
    labTitleSearch: TUniLabel;
    paSearchBtn: TUniContainerPanel;
    btnSearchCRUD: TUniBitBtn;
    btnSearchMoreFilters: TUniBitBtn;
    paSearchFilter1: TUniContainerPanel;
    paSearchField1: TUniContainerPanel;
    UniLabelc1: TUniLabel;
    UniButtonEditplote: TUniButtonEdit;
    paSearchOp1: TUniContainerPanel;
    UniEditboletim: TUniEdit;
    UniLabel1: TUniLabel;
    paSearchFilterPeriodSelect: TUniContainerPanel;
    paBaseButtons: TUniContainerPanel;
    paOF: TUniContainerPanel;
    btnCloseForm: TUniBitBtn;
    btnOptions: TUniBitBtn;
    paP: TUniContainerPanel;
    btnSearch: TUniBitBtn;
    paNAE: TUniContainerPanel;
    paGC: TUniContainerPanel;
    labExit: TUniLabel;
    labTitleForm: TUniLabel;
    dbgSearchCRUD: TUniDBGrid;
    FDQryPesquisa: TFDQuery;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel2: TUniLabel;
    UniButtonEditcodproduto: TUniButtonEdit;
    dsfiltro: TDataSource;
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure UniButtonEditploteButtonClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure ativabusca();
  procedure carregalote(const fcodigo:integer);
  end;

var
  frmCONSULTAKARDEXLOTE: TfrmCONSULTAKARDEXLOTE;

implementation

{$R *.dfm}

uses untDM_RC, mkm_procedures, MainModule, mkm_func_web, untFrmPesquisa,
  mkm_relatorios;

procedure TfrmCONSULTAKARDEXLOTE.ativabusca;
begin
  if not ( dsfiltro.State in [dsEdit, dsInsert ] ) then
  begin
     pgBaseCadControl.ActivePage := tabSearch;

     if mm.varB_Mobile_Screen_Portrait then
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, dbgSearchCRUD.Width, 0 )
     else
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, 266, 0 );
  end;
end;

procedure TfrmCONSULTAKARDEXLOTE.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmCONSULTAKARDEXLOTE.btnSearchCRUDClick(Sender: TObject);
begin
  inherited;
  if (UniButtonEditplote.Text  = '' ) or
     (UniButtonEditplote.Text  = '0') then
  begin
    dm_rc.rc_ShowSweetAlert( 'Ok', 'INFORME UM LOTE' , 'error' , false );
    abort
  end;
  dm_rc.tbistlotevenda.Close;
  dm_rc.tbistlotevenda.open;

  //************************************************************************//
  FDQryPesquisa.SQL.Clear;
  FDQryPesquisa.SQL.Text :=  RELATORIO_ESTOQUE_LOTE(mm.M_TIPOPESO,
                                                    mm.varI_Code_Lote_Lotesemente,
                                                    mm.varI_Code_Lote_Boletimsemente,
                                                    mm.varI_Code_Lote_Produto,
                                                    mm.varI_Code_Company);
  FDQryPesquisa.Open();

  dm_rc.tbistlotevenda.CopyDataSet(FDQryPesquisa);
  dm_rc.tbistlotevenda.Last;
  //************************************************************************//
end;

procedure TfrmCONSULTAKARDEXLOTE.carregalote(const fcodigo:integer);
begin
  SqlPesquisa('select * from sementes where codigo = ' + IntToStr(fcodigo));

  UniButtonEditplote.Text      := dm_rc.sqlBuscas.FindField('LOTE').AsString;
  UniEditboletim.Text          := dm_rc.sqlBuscas.FindField('BOLETIM').AsString;
  UniButtonEditcodproduto.Text := dm_rc.sqlBuscas.FindField('PRODUTO').AsString;
end;

procedure TfrmCONSULTAKARDEXLOTE.UniButtonEditploteButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('SEMENTES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
      UniButtonEditplote.Text      := mm.varI_Code_Lote_Lotesemente;
      UniEditboletim.Text          := mm.varI_Code_Lote_Boletimsemente;
      UniButtonEditcodproduto.Text := IntToStr(mm.varI_Code_Lote_Produto);
     end;
   end);
end;
initialization
  RegisterClass(TfrmCONSULTAKARDEXLOTE);
end.
