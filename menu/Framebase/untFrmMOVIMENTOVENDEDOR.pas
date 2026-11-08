unit untFrmMOVIMENTOVENDEDOR; // 8.0.0.0
(*
[PT] Conversão RADCore 3.0 -> 8.0 — formulário modal auxiliar (vendedores vinculados ao movimento)
     - Form standalone (TUniForm) sem datasets locais: opera diretamente sobre o
       memtable dm_rc.tb_movimentovendedor (o mesmo usado pelo btnvendedor da nota)
     - layout modal 8.0 (doc LayoutRender): rc_RenderLayout em OnBeforeShow + rc_ResizeBlocks em OnReady (3.0)
     - mantidos: mm.Seta_Busca + ShowModal com callback (untFrmPesquisa),
       Acha_Item, mm.varC_vendedorstatus, mm.varC_Form_Modal
     - carregavendedores() preservado com corpo vazio, fiel à 3.0
[EN] RADCore 3.0 -> 8.0 conversion
*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniPanel, uniEdit, uniLabel, UniButtonEdit;

type
  TFrmMOVIMENTOVENDEDOR = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    rcBlock20: TUniContainerPanel;
    UniDBGridEntrega: TUniDBGrid;
    rcBlock30: TUniContainerPanel;
    UniButtonEditfuncionarios: TUniButtonEdit;
    UniLabel1: TUniLabel;
    UniEditdescricaovendedor: TUniEdit;
    UniLabel2: TUniLabel;
    UniFormattedNumberEditcomissoa: TUniFormattedNumberEdit;
    UniLabel3: TUniLabel;
    UniBitBtn12: TUniBitBtn;
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniButtonEditfuncionariosButtonClick(Sender: TObject);
    procedure UniButtonEditfuncionariosExit(Sender: TObject);
    procedure UniBitBtn12Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniDBGridEntregaCellClick(Column: TUniDBGridColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure limpavars();
  procedure carregavendedores();
  end;

function FrmMOVIMENTOVENDEDOR: TFrmMOVIMENTOVENDEDOR;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, untFrmPesquisa, mkm_procedures, mkm_funcoes,mkm_layout;

function FrmMOVIMENTOVENDEDOR: TFrmMOVIMENTOVENDEDOR;
begin
  Result := TFrmMOVIMENTOVENDEDOR(mm.GetFormInstance(TFrmMOVIMENTOVENDEDOR));
end;

procedure TFrmMOVIMENTOVENDEDOR.carregavendedores;
begin

end;

procedure TFrmMOVIMENTOVENDEDOR.limpavars;
begin
  UniButtonEditfuncionarios.Text       := '0';
  UniEditdescricaovendedor.Text        := '';
  UniFormattedNumberEditcomissoa.Value := 0.00;
end;

procedure TFrmMOVIMENTOVENDEDOR.UniBitBtn12Click(Sender: TObject);
begin
  dm_rc.tb_movimentovendedor.Append;
  dm_rc.tb_movimentovendedor.FindField('FUNCIONARIO').AsInteger := StrToInt(UniButtonEditfuncionarios.Text);
  dm_rc.tb_movimentovendedor.FindField('NOME').AsString         := UniEditdescricaovendedor.Text;
  dm_rc.tb_movimentovendedor.FindField('COMISSAO').AsFloat      := UniFormattedNumberEditcomissoa.Value;
  dm_rc.tb_movimentovendedor.post;

  limpavars();
end;

procedure TFrmMOVIMENTOVENDEDOR.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
  FrmMOVIMENTOVENDEDOR.Close;
end;

procedure TFrmMOVIMENTOVENDEDOR.UniButtonEditfuncionariosButtonClick(
  Sender: TObject);
begin
  mm.Seta_Busca('FUNCIONARIOS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditfuncionarios.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TFrmMOVIMENTOVENDEDOR.UniButtonEditfuncionariosExit(Sender: TObject);
begin
  UniEditdescricaovendedor.Text := Acha_Item('FUNCIONARIOS',UniButtonEditfuncionarios.Text);
end;

procedure TFrmMOVIMENTOVENDEDOR.UniDBGridEntregaCellClick(
  Column: TUniDBGridColumn);
begin
  if Column.FieldName = 'exclui' then
    begin
      dm_rc.tb_movimentovendedor.Delete;
    end;
end;

procedure TFrmMOVIMENTOVENDEDOR.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TFrmMOVIMENTOVENDEDOR.UniFormBeforeShow(Sender: TObject);
begin
  //[PT] padrao oficial RADCore 8.0 p/ FORMS modais (doc LayoutRender): render no BEFORE SHOW
  rc_RenderLayout( Self, true, true, true );
end;

procedure TFrmMOVIMENTOVENDEDOR.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
  dm_rc.rc_ResizeBlocks( Self, true, true ); //fiel a 3.0
end;

procedure TFrmMOVIMENTOVENDEDOR.UniFormShow(Sender: TObject);
begin
 if mm.varC_vendedorstatus = 'S' then
   UniBitBtn12.Visible := True
 else
   UniBitBtn12.Visible := False;
  limpavars();
end;

end.

