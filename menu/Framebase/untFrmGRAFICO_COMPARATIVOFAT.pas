unit untFrmGRAFICO_COMPARATIVOFAT; //8.0.0.0

// =====================================================================
// untFrmGRAFICO_COMPARATIVOFAT — conversão 3.0 -> 8.0 (tela de CONSULTA/gráfico)
// - Mantém class(TfrmBase): não é CRUD — §43i não se aplica.
// - SqlGraficos (mkm_procedures) + ESCRITA_GRAFICO_COMPARATIVOFAT (mkm_impressao)
//   + dm_rc.sqlgraficos: ganchos 3.0 vivos na base 8.0.
// - A unit de telas NOTAENTRADA citada no uses 3.0 foi REMOVIDA (não referenciada no
//   código; evita dependência de unit ainda não convertida). Única mudança de código.
// - UniChart/UniBarSeries preservados; UniFrameCreate próprio (defaults ano/mês).
// =====================================================================

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniChart, uniMultiItem,
  uniComboBox, uniEdit, UniButtonEdit, uniScrollBox, uniPageControl, uniButton,
  uniBitBtn, uniLabel, uniSweetAlert;

type
  TfrmGRAFICO_COMPARATIVOFAT = class(TfrmBase)
    UniContainerPanel1: TUniContainerPanel;
    paBaseButtons: TUniContainerPanel;
    paOF: TUniContainerPanel;
    btnCloseForm: TUniBitBtn;
    btnOptions: TUniBitBtn;
    paP: TUniContainerPanel;
    btnSearch: TUniBitBtn;
    paNAE: TUniContainerPanel;
    paGC: TUniContainerPanel;
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
    UniButtonEditpanoini: TUniButtonEdit;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniChartgrafico: TUniChart;
    dsfiltro: TDataSource;
    FDQryFiltro: TFDQuery;
    cbxSearchCRUDFieldmes: TUniComboBox;
    labExit: TUniLabel;
    labTitleForm: TUniLabel;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel2: TUniLabel;
    cbxdocumentos: TUniComboBox;
    UniBarSeries1: TUniBarSeries;
    procedure btnSearchClick(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGRAFICO_COMPARATIVOFAT: TfrmGRAFICO_COMPARATIVOFAT;

implementation

{$R *.dfm}

uses MainModule, mkm_func_web, mkm_graficos, untDM_RC, mkm_procedures,
  mkm_relatorios, mkm_impressao;

procedure TfrmGRAFICO_COMPARATIVOFAT.btnSearchClick(Sender: TObject);
begin
  inherited;
  if not ( dsfiltro.State in [dsEdit, dsInsert ] ) then
  begin
     pgBaseCadControl.ActivePage := tabSearch;

     if mm.varB_Mobile_Screen_Portrait then
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, UniChartgrafico.Width, 0 )
     else
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, 266, 0 );
  end;
end;

procedure TfrmGRAFICO_COMPARATIVOFAT.btnSearchCRUDClick(Sender: TObject);
var
  I         : Integer;
  Val       : Double;
  Head, ano : string;
begin
  inherited;

  UniBarSeries1.Clear;
  UniChartgrafico.Title.Text.Clear;
  UniBarSeries1.Title      := 'Faturamento Mensal';

  Val := 0;
  Head:= '';

  UniChartgrafico.Title.Text.Add('Gráfico de Comparativo Faturamento Mensal - ' + UniButtonEditpanoini.Text + '/' + cbxSearchCRUDFieldmes.Text);

  if SqlGraficos(ESCRITA_GRAFICO_COMPARATIVOFAT(mm.varI_Code_Company,
                                                UniButtonEditpanoini.Text,
                                                cbxSearchCRUDFieldmes.Text,
                                                cbxdocumentos.ItemIndex)) then
    begin
      dm_rc.sqlgraficos.First;
      while not dm_rc.sqlgraficos.Eof do
        begin
          val  := dm_rc.sqlgraficos.FindField('TOTAL').AsFloat;
          head := dm_rc.sqlgraficos.FindField('ANO').AsString;

          UniBarSeries1.Add(Val,Head);

          dm_rc.sqlgraficos.Next;
        end;
      btnSearch.OnClick(self);
    end;


end;
procedure TfrmGRAFICO_COMPARATIVOFAT.UniFrameCreate(Sender: TObject);
begin
  inherited;
  UniButtonEditpanoini.Text := FormatDateTime('yyyy',date);
  cbxdocumentos.ItemIndex   := 0;
end;

Initialization
   RegisterClass( TfrmGRAFICO_COMPARATIVOFAT );
end.
