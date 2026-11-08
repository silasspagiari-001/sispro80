unit untFrmRELACAOLOTEINTERNO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniMultiItem, uniComboBox, uniLabel, uniEdit,
  UniButtonEdit, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel;

type
  TfrmRELACAOLOTEINTERNO = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    btnimpressao: TUniBitBtn;
    UniContainerPanel4: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    UniContainerPanel1: TUniContainerPanel;
    edSearchprodutoINI: TUniButtonEdit;
    UniLabelDtIni: TUniLabel;
    rcBlock20: TUniContainerPanel;
    edSearchprodutoFIN: TUniButtonEdit;
    UniLabel1: TUniLabel;
    rcBlock30: TUniContainerPanel;
    cbxsordem: TUniComboBox;
    UniLabel2: TUniLabel;
    rcBlock40: TUniContainerPanel;
    cbxtipo: TUniComboBox;
    UniLabel3: TUniLabel;
    UniContainerPanel2: TUniContainerPanel;
    UniButtonEditBARRACAO: TUniButtonEdit;
    UniLabel4: TUniLabel;
    UniContainerPanel5: TUniContainerPanel;
    UniComboBoxtipo: TUniComboBox;
    UniLabel5: TUniLabel;
    UniContainerPanel6: TUniContainerPanel;
    edSearchGrupoFIN: TUniButtonEdit;
    UniLabel6: TUniLabel;
    UniContainerPanel7: TUniContainerPanel;
    edSearchGrupoINI: TUniButtonEdit;
    UniLabel7: TUniLabel;
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure edSearchprodutoINIButtonClick(Sender: TObject);
    procedure edSearchprodutoFINButtonClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure btnimpressaoClick(Sender: TObject);
    procedure UniButtonEditBARRACAOButtonClick(Sender: TObject);
    procedure edSearchGrupoINIButtonClick(Sender: TObject);
    procedure edSearchGrupoFINButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmRELACAOLOTEINTERNO: TfrmRELACAOLOTEINTERNO;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untFrmPesquisa, mkm_impressao, mkm_relatorios,
  unReportImpressao, untDM_RC;

function frmRELACAOLOTEINTERNO: TfrmRELACAOLOTEINTERNO;
begin
  Result := TfrmRELACAOLOTEINTERNO(mm.GetFormInstance(TfrmRELACAOLOTEINTERNO));
end;

procedure TfrmRELACAOLOTEINTERNO.btnimpressaoClick(Sender: TObject);
var
  psql:string;
begin
  if UniButtonEditBARRACAO.Text = '' then
    begin
      dm_rc.rc_ShowToasterRT('error', 'Buscar barracão ou colocar 0!', True,'pinItUp');
      abort;
    end;



  psql := ESCRITA_RELACAOLOTEINTERNO(   mm.varI_Code_Company,
                                        strtoint(edSearchprodutoINI.Text),
                                        strtoint(edSearchprodutoFIN.Text),
                                        strtoint(edSearchgrupoINI.Text),
                                        strtoint(edSearchgrupoFIN.Text),
                                        IntToStr(cbxsordem.ItemIndex),
                                        IntToStr(cbxtipo.ItemIndex),
                                        UniButtonEditBARRACAO.Text,
                                        UniComboBoxtipo.Text);

  mm.varC_caminhopdf :=  RELATORIO_RELACAOLOTEINTERNO(
                                                      MM.varI_Code_Company,
                                                      IntToStr(cbxsordem.ItemIndex),
                                                      IntToStr(cbxtipo.ItemIndex),
                                                      psql);

  unfImpressao.ShowModal();
end;

procedure TfrmRELACAOLOTEINTERNO.edSearchGrupoFINButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('GRUPOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       edSearchGrupoFIN.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmRELACAOLOTEINTERNO.edSearchGrupoINIButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('GRUPOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       edSearchGrupoINI.Text := mm.varC_codigo_busca;
       edSearchGrupoFIN.Text := mm.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmRELACAOLOTEINTERNO.edSearchprodutoFINButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PRODUTOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       edSearchprodutofin.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmRELACAOLOTEINTERNO.edSearchprodutoINIButtonClick(Sender: TObject);
begin
  mm.Seta_Busca('PRODUTOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       edSearchprodutoini.Text := mm.varC_codigo_busca;
       edSearchprodutofin.Text := mm.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmRELACAOLOTEINTERNO.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmRELACAOLOTEINTERNO.UniButtonEditBARRACAOButtonClick(
  Sender: TObject);
begin
  mm.Seta_Busca('BARRACAO');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditBARRACAO.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmRELACAOLOTEINTERNO.UniFormDestroy(Sender: TObject);
begin
  mm.varA_relatorio  := '';
  mm.varC_Form_Modal := nil;
end;

procedure TfrmRELACAOLOTEINTERNO.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;

procedure TfrmRELACAOLOTEINTERNO.UniFormShow(Sender: TObject);
begin
  cbxsordem.ItemIndex       := 4;
  cbxtipo.ItemIndex         := 3;
  UniComboBoxtipo.ItemIndex := 4;
end;

Initialization
   RegisterClass( TfrmRELACAOLOTEINTERNO );
end.
