unit untfrmTelaproducaogenerica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniDateTimePicker,
  uniDBDateTimePicker, uniEdit, uniDBEdit, uniLabel, UniButtonDbEdit,
  uniMultiItem, uniComboBox, uniDBComboBox, uniButton, uniBitBtn;

type
  Tfrmtelaproducaogenerica = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniLabel6: TUniLabel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    UniLabel25: TUniLabel;
    UniDBFormattedNumberEditpureza: TUniDBFormattedNumberEdit;
    UniLabel5: TUniLabel;
    UniDBFormattedNumberEditquantidade: TUniDBFormattedNumberEdit;
    UniLabel26: TUniLabel;
    UniDBComboBoxsacos: TUniDBComboBox;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    rcBlock90: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniButtonDbEditLOTEDESTINO: TUniButtonDbEdit;
    UniLabel8: TUniLabel;
    UniDBEditboletim: TUniDBEdit;
    UniLabel9: TUniLabel;
    UniDBEdittermo: TUniDBEdit;
    UniDBEditsafra: TUniDBEdit;
    UniLabel1: TUniLabel;
    rcBlock100: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    btnLkpSearch: TUniBitBtn;
    UniBitBtn1: TUniBitBtn;
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure btnLkpSearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure GeraSaldo();
  end;

function frmtelaproducaogenerica: Tfrmtelaproducaogenerica;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, mkm_anim, untDM_RC, mkm_procedures,
  mkm_func_web, mkm_funcoes;

function frmtelaproducaogenerica: Tfrmtelaproducaogenerica;
begin
  Result := Tfrmtelaproducaogenerica(mm.GetFormInstance(Tfrmtelaproducaogenerica));
end;

procedure Tfrmtelaproducaogenerica.btnLkpSearchClick(Sender: TObject);
begin
  try
    dm_rc.fdqrybatidamestre.Edit;
    dm_rc.fdqrybatidamestre.FindField('FINALIZADO').AsString   := 'T';
    dm_rc.fdqrybatidamestre.FindField('LOGPRODUCAO').AsString  := mm.vUserName + ' - ' + DateToStr(date) + ' - ' + TimeToStr(Time);
    dm_rc.fdqrybatidamestre.Post;

    GeraSaldo();
    dm_rc.rc_ShowSweetAlert( 'Ok', 'Saldo Gerado com SUCESSO!' , 'success' , false );
  except
    dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'PROBLEMAS AO GERAR O SALDO' , 'error' , false );
  end;
end;

procedure Tfrmtelaproducaogenerica.GeraSaldo;
begin
  TabelaPontos  (' select * from pontos where codigo    = 999999999');
  TabelaSementes(' select * from sementes where produto = ' + IntToStr(dm_rc.fdqrybatidamestre.FindField('PRODUTO').AsInteger) +
                 ' and                          lote    = ' + QuotedStr(dm_rc.fdqrybatidamestre.FindField('LOTE').AsString));

  executasql(' DELETE FROM PONTOS WHERE DOCUMENTO = ' + IntToStr(300)    +
             ' AND SERIE                          = ' + QuotedStr('PRD') +
             ' AND NUMERO                         = ' + IntToStr(DM_RC.fdqrybatidamestre.FindField('NUMERO').AsInteger));

  dm_rc.fdqrypontos.Append;
  dm_rc.fdqrypontos.FindField('EMPRESA').AsInteger    := mm.varI_Code_Company;
  dm_rc.fdqrypontos.FindField('CODIGO').AsInteger     := Ultimo_Codigo('PONTOS','CODIGO',True);
  dm_rc.fdqrypontos.FindField('KEY').AsString         := Gera_Guid();
  dm_rc.fdqrypontos.FindField('DOCUMENTO').AsInteger  := 300;
  dm_rc.fdqrypontos.FindField('OPERACAO').AsInteger   := 8888;
  dm_rc.fdqrypontos.FindField('PESSOA').AsInteger     := 99999;
  dm_rc.fdqrypontos.FindField('SEQUENCIA').AsInteger  := 1;
  dm_rc.fdqrypontos.FindField('TIPO').AsString        := 'ENTRADA';
  dm_rc.fdqrypontos.FindField('CANCELADA').AsString   := 'P';
  dm_rc.fdqrypontos.FindField('NUMERO').AsInteger     := DM_RC.fdqrybatidamestre.FindField('NUMERO').AsInteger;
  dm_rc.fdqrypontos.FindField('SERIE').AsString       := 'PRD';
  dm_rc.fdqrypontos.FindField('DATA').AsDateTime      := DM_RC.fdqrybatidamestre.FindField('EMISSAO').AsDateTime;
  dm_rc.fdqrypontos.FindField('PRODUTO').AsInteger    := DM_RC.fdqrysementes.FindField('PRODUTO').AsInteger;
  dm_rc.fdqrypontos.FindField('DESCRICAO').AsString   := DM_RC.fdqrysementes.FindField('NOME').AsString;
  dm_rc.fdqrypontos.FindField('CATEGORIA').AsString   := DM_RC.fdqrysementes.FindField('CATEGORIA').AsString;
  dm_rc.fdqrypontos.FindField('TERMO').AsString       := DM_RC.fdqrysementes.FindField('TERMO').AsString;
  dm_rc.fdqrypontos.FindField('BOLETIM').AsString     := DM_RC.fdqrysementes.FindField('BOLETIM').AsString;
  dm_rc.fdqrypontos.FindField('PESOSACO').AsString    := DM_RC.fdqrysementes.FindField('PESOEMBALAGEM').AsString;
  dm_rc.fdqrypontos.FindField('LOTESEMENTE').AsString := DM_RC.fdqrysementes.FindField('LOTE').AsString;
  dm_rc.fdqrypontos.FindField('QUANTIDADE').AsFloat   := DM_RC.fdqrybatidamestre.FindField('QUANTIDADE').AsFloat;
  dm_rc.fdqrypontos.FindField('PUREZA').AsFloat       := DM_RC.fdqrybatidamestre.FindField('PU').AsFloat;
  dm_rc.fdqrypontos.FindField('PONTOS').AsFloat       := DM_RC.fdqrybatidamestre.FindField('QUANTIDADE').AsFloat * DM_RC.fdqrybatidamestre.FindField('PU').AsFloat;
  dm_rc.fdqrypontos.Findfield('QTEPESO').AsFloat      := DM_RC.fdqrybatidamestre.FindField('QUANTIDADE').AsFloat * DM_RC.fdqrysementes.FindField('PESOSACO').AsFloat;
  dm_rc.fdqrypontos.Post;

  Calcula_Lote(mm.varI_Code_Company,DM_RC.fdqrysementes.FindField('PRODUTO').AsInteger,
               DM_RC.fdqrysementes.FindField('LOTE').AsString,
               DM_RC.fdqrysementes.FindField('BOLETIM').AsString,
               DM_RC.fdqrysementes.FindField('TERMO').AsString,
               mm.M_TIPOPESO);

end;

procedure Tfrmtelaproducaogenerica.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure Tfrmtelaproducaogenerica.UniFormDestroy(Sender: TObject);
begin
  dm_rc.fdqrybatidamestre.Close;
  mm.varC_Form_Modal := nil;
end;

procedure Tfrmtelaproducaogenerica.UniFormShow(Sender: TObject);
begin
  if Self.Tag = 0 then
  begin
      Self.Visible := True;
      Self.Top  := 0;

      rc_MoveAnimationForm( self,
                            self.left,
                            self.left,
                            self.top,
                            ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  ),
                            400,
                            1 ) ;
  end
  else
  begin
    Self.Visible := False;
    Self.Top  := -1000;
  end;
  Self.Visible := True;
end;

end.
