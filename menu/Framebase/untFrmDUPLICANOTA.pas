unit untFrmDUPLICANOTA; // 8.0.0.0
(*
[PT] Conversão RADCore 3.0 -> 8.0 — formulário modal auxiliar (seleção da nota a duplicar /
     transformar em venda de entrega futura; alimenta mm.varI_Code_Documento_Controle
     consumido pelo UniComboBoxparaopChange da nota - duplicata 5117/6117)
     - Form standalone (TUniForm) sem datasets próprios
     - rc_ShowSweetAlert 4 args -> 3 args
     - mantidos: SqlPesquisa/dm_rc.sqlBuscas, frmTransfereImportacao.ShowModal,
       UniBitBtn1.OnClick(Self) (fecha após confirmar), UniImage1 com Picture embutida
[EN] RADCore 3.0 -> 8.0 conversion
*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniGUIBaseClasses, uniPanel,
  uniEdit, UniButtonEdit, uniLabel, uniImage;

type
  TFrmDUPLICANOTA = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    rcBlock20: TUniContainerPanel;
    UniImage1: TUniImage;
    UniLabel106: TUniLabel;
    rcBlock30: TUniContainerPanel;
    UniButtonEditnota: TUniButtonEdit;
    UniButtonEditcontrole: TUniButtonEdit;
    rcBlock40: TUniContainerPanel;
    UniBitBtn2: TUniBitBtn;
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniButtonEditnotaButtonClick(Sender: TObject);
    procedure UniBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure verificanota(const pcontrole:integer);
  end;

function FrmDUPLICANOTA: TFrmDUPLICANOTA;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untFrmTransfereImportacao, mkm_procedures,
  untDM_RC;

function FrmDUPLICANOTA: TFrmDUPLICANOTA;
begin
  Result := TFrmDUPLICANOTA(mm.GetFormInstance(TFrmDUPLICANOTA));
end;

procedure TFrmDUPLICANOTA.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TFrmDUPLICANOTA.UniBitBtn2Click(Sender: TObject);
begin
  SqlPesquisa('select * from mvmestre where numero = ' + QuotedStr(UniButtonEditnota.Text) +
              ' AND DOCUMENTO                      = ' + IntToStr(1)                       +
              ' AND EMPRESA                        = ' + IntToStr(MM.varI_Code_Company));
  if dm_rc.sqlBuscas.findfield('SERIE').asstring <> 'NFE' then
    begin
      dm_rc.rc_ShowSweetAlert('ATENÇÃO','NÃO É UMA NOTA FISCAL', 'error' );
      abort;
    end
  else
    begin
      UniButtonEditnota.Text          := dm_rc.sqlBuscas.findfield('NUMERO').asstring;
      UniButtonEditcontrole.Text      := dm_rc.sqlBuscas.findfield('CODIGO').asstring;
      mm.varI_Code_Documento_Controle := StrToInt(UniButtonEditcontrole.Text);

      UniBitBtn1.OnClick(Self);
    end;
end;

procedure TFrmDUPLICANOTA.UniButtonEditnotaButtonClick(Sender: TObject);
begin
  frmTransfereImportacao.ShowModal();
  if mm.varI_Code_Documento_Controle <> 0 then
    begin
      verificanota(mm.varI_Code_Documento_Controle);
    end;
end;

procedure TFrmDUPLICANOTA.verificanota(const pcontrole: integer);
begin
  SqlPesquisa('select * from mvmestre where codigo = ' + IntToStr(mm.varI_Code_Documento_Controle));
  if dm_rc.sqlBuscas.findfield('SERIE').asstring <> 'NFE' then
    begin
      dm_rc.rc_ShowSweetAlert('ATENÇÃO','NÃO É UMA NOTA FISCAL', 'error' );
      abort;
    end
  else
    begin
      UniButtonEditnota.Text     := dm_rc.sqlBuscas.findfield('NUMERO').asstring;
      UniButtonEditcontrole.Text := IntToStr(mm.varI_Code_Documento_Controle);
    end;
end;

end.
