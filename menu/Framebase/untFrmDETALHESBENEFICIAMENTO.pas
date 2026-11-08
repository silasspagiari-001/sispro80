unit untFrmDETALHESBENEFICIAMENTO;

// =====================================================================
// untFrmDETALHESBENEFICIAMENTO — conversão 3.0 -> 8.0 (TUniForm modal)
// - Receita do modal RC 8.0 (GUIA §26): singleton mm.GetFormInstance (já
//   existia), Hint=[[modal:]] no dfm, BorderStyle=bsSingle+BorderIcons,
//   rc_RenderLayout(Self,false,false,false,false) no OnCreate e
//   rc_RenderLayout(Self,true,true,true) no BeforeShow (mkm_layout no uses).
// - Operação sobre dm_rc.tbdetalhes (MemTable global de troca com o
//   untCadBENEFICIAMENTO) mantida verbatim.
// =====================================================================

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniDBEdit, uniEdit, UniButtonDbEdit, uniLabel,
  uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn;

type
  TfrmDETALHESBENEFICIAMENTO = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    UniLabel3: TUniLabel;
    UniButtonDbEditcodigopessoas: TUniButtonDbEdit;
    rcBlock20: TUniContainerPanel;
    UniDBEdit17: TUniDBEdit;
    UniLabel1: TUniLabel;
    UniContainerPanel2: TUniContainerPanel;
    UniDBEdit1: TUniDBEdit;
    UniLabel2: TUniLabel;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniButtonDbEdit1: TUniButtonDbEdit;
    UniContainerPanel4: TUniContainerPanel;
    UniDBEdit2: TUniDBEdit;
    UniLabel5: TUniLabel;
    UniContainerPanel5: TUniContainerPanel;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    UniLabel6: TUniLabel;
    UniContainerPanel6: TUniContainerPanel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniLabel7: TUniLabel;
    UniContainerPanel7: TUniContainerPanel;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;
    UniLabel8: TUniLabel;
    UniContainerPanel8: TUniContainerPanel;
    UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit;
    UniLabel9: TUniLabel;
    UniContainerPanel9: TUniContainerPanel;
    UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit;
    UniLabel10: TUniLabel;
    UniContainerPanel10: TUniContainerPanel;
    UniLabel11: TUniLabel;
    UniButtonDbEdit2: TUniButtonDbEdit;
    UniContainerPanel11: TUniContainerPanel;
    UniLabel12: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniContainerPanel12: TUniContainerPanel;
    UniDBFormattedNumberEdit6: TUniDBFormattedNumberEdit;
    UniLabel13: TUniLabel;
    UniContainerPanel13: TUniContainerPanel;
    UniDBFormattedNumberEdit7: TUniDBFormattedNumberEdit;
    UniLabel14: TUniLabel;
    UniContainerPanel14: TUniContainerPanel;
    UniDBFormattedNumberEdit8: TUniDBFormattedNumberEdit;
    UniLabel15: TUniLabel;
    UniContainerPanel15: TUniContainerPanel;
    UniDBFormattedNumberEdit9: TUniDBFormattedNumberEdit;
    UniLabel16: TUniLabel;
    UniContainerPanel16: TUniContainerPanel;
    UniDBFormattedNumberEdit10: TUniDBFormattedNumberEdit;
    UniLabel17: TUniLabel;
    rcBlock360: TUniContainerPanel;
    btnSaida: TUniBitBtn;
    btnEditReg: TUniBitBtn;
    btnsalvar: TUniBitBtn;
    procedure btnSaidaClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnsalvarClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniButtonDbEdit2ButtonClick(Sender: TObject);
    procedure UniDBFormattedNumberEdit9Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure Botoes(tipo:string);
  procedure carregalote(const fcodigo:integer);
  end;

function frmDETALHESBENEFICIAMENTO: TfrmDETALHESBENEFICIAMENTO;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, mkm_procedures, untfrmPesquisalote,
  Data.DB, mkm_layout;

function frmDETALHESBENEFICIAMENTO: TfrmDETALHESBENEFICIAMENTO;
begin
  Result := TfrmDETALHESBENEFICIAMENTO(mm.GetFormInstance(TfrmDETALHESBENEFICIAMENTO));
end;

procedure TfrmDETALHESBENEFICIAMENTO.Botoes(tipo: string);
begin
  if tipo = 'altera' then
    begin
      btnEditReg.Enabled := False;
      btnsalvar.Enabled  := True;
      btnSaida.Enabled   := True;

      UniButtonDbEdit2.ReadOnly           := False;
      UniDBEdit3.ReadOnly                 := True;
      UniDBFormattedNumberEdit6.ReadOnly  := False;
      UniDBFormattedNumberEdit7.ReadOnly  := False;
      UniDBFormattedNumberEdit8.ReadOnly  := False;
      UniDBFormattedNumberEdit9.ReadOnly  := False;
      UniDBFormattedNumberEdit10.ReadOnly := False;


    end
  else
    if tipo = 'salvar' then
      begin
        btnEditReg.Enabled := True;
        btnsalvar.Enabled  := False;
        btnSaida.Enabled   := True;

        UniButtonDbEdit2.ReadOnly           := True;
        UniDBEdit3.ReadOnly                 := True;
        UniDBFormattedNumberEdit6.ReadOnly  := True;
        UniDBFormattedNumberEdit7.ReadOnly  := True;
        UniDBFormattedNumberEdit8.ReadOnly  := True;
        UniDBFormattedNumberEdit9.ReadOnly  := True;
        UniDBFormattedNumberEdit10.ReadOnly := True;

      end;
end;

procedure TfrmDETALHESBENEFICIAMENTO.btnEditRegClick(Sender: TObject);
begin
  Botoes('altera');
  UniButtonDbEdit2.SetFocus;
  dm_rc.tbdetalhes.Edit;
end;

procedure TfrmDETALHESBENEFICIAMENTO.btnSaidaClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmDETALHESBENEFICIAMENTO.btnsalvarClick(Sender: TObject);
begin
  try
    dm_rc.tbdetalhes.Post;
    Botoes('salvar');
    dm_rc.rc_ShowSweetAlert( 'Ok', 'INFORMAÇÃO LANÇADA!' , 'sucess');
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NÃO CONSEGUI LANÇAR - INFORMAR AO SUPORTE' , 'error');
  end;
end;

procedure TfrmDETALHESBENEFICIAMENTO.carregalote(const fcodigo: integer);
begin
  if SqlPesquisa('select * from sementes where codigo = ' + IntToStr(fcodigo)) then
    begin
      dm_rc.tbdetalhes.FindField('LOTEDESTINO').AsString    := dm_rc.sqlBuscas.FindField('LOTE').AsString;
      dm_rc.tbdetalhes.FindField('BOLETIMDESTINO').AsString := dm_rc.sqlBuscas.FindField('BOLETIM').AsString;
      dm_rc.tbdetalhes.FindField('TERMO').AsString          := dm_rc.sqlBuscas.FindField('TERMO').AsString;
      dm_rc.tbdetalhes.FindField('CATEGORIA').AsString      := dm_rc.sqlBuscas.FindField('CATEGORIA').AsString;
      dm_rc.tbdetalhes.FindField('GERMINACAO').AsFloat      := dm_rc.sqlBuscas.FindField('GERNORMAIS').AsFloat;
      dm_rc.tbdetalhes.FindField('PUREZA').AsFloat          := dm_rc.sqlBuscas.FindField('ANALISEPURA').AsFloat;
      dm_rc.tbdetalhes.FindField('VALORCULTURAL').AsFloat   := dm_rc.sqlBuscas.FindField('VALORCULTURAL').AsFloat;
    end;
end;

procedure TfrmDETALHESBENEFICIAMENTO.UniButtonDbEdit2ButtonClick(
  Sender: TObject);
begin
  MM.varC_referencia_produto := UniButtonDbEdit1.Text;
  mm.Seta_Busca('BENEFICIAMENTO');
  frmpesquisalote.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       dm_rc.tbdetalhes.Edit;
       carregalote(StrToInt(mm.varC_codigo_busca_lote));
     end;
   end);
end;

procedure TfrmDETALHESBENEFICIAMENTO.UniDBFormattedNumberEdit9Exit(
  Sender: TObject);
begin
{
  if ( dm_rc.tbdetalhes.State in [dsEdit, dsInsert ] ) then
    begin
      if Saldo_Beneficiamento('CARREGA',dm_rc.tbdetalhes.FindField('SERIE').AsString,
                                        dm_rc.tbdetalhes.FindField('NOTA').AsInteger,
                                        dm_rc.tbdetalhes.FindField('PRODUTO').AsInteger,
                                        dm_rc.tbdetalhes.FindField('SEQITENS').AsInteger,
                                        mm.varI_Code_Company) < dm_rc.tbdetalhes.FindField('QUANTIDADE').AsFloat then
      begin
        dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'QUANTIDADE NÃO DISPONIVEL PARA BENEFICIAMENTO!' , 'error' , false );
        Abort;
      end;
    end;
    }
end;

procedure TfrmDETALHESBENEFICIAMENTO.UniFormCreate(Sender: TObject);
begin
  rc_RenderLayout( Self, false, false, false, false );
  Botoes('salvar');
end;

procedure TfrmDETALHESBENEFICIAMENTO.UniFormBeforeShow(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true, true );
end;

procedure TfrmDETALHESBENEFICIAMENTO.UniFormReady(Sender: TObject);
begin
  // reservado p/ ajuste fino de geometria (padrao modal RC — ver GUIA §26)
end;

procedure TfrmDETALHESBENEFICIAMENTO.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

end.
