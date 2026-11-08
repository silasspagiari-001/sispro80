unit untCadBANCO_REMESSA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmCRUDproprio, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, uniGUIBaseClasses, uniGUIClasses, uniScreenMask, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, uniHTMLFrame, uniBasicGrid, uniDBGrid, uniMultiItem,
  uniComboBox, uniEdit, uniScrollBox, uniPanel, uniPageControl, uniButton,
  uniBitBtn, uniLabel, uniMemo;

type
  TfrmCADBANCO_REMESSA = class(TfrmCRUDPROPRIO)
    FDQryFiltroKEY: TStringField;
    FDQryFiltroCODIGO: TIntegerField;
    FDQryFiltroEMPRESA: TIntegerField;
    FDQryFiltroPORTADOR: TIntegerField;
    FDQryFiltroEMISSAO: TDateField;
    FDQryFiltroHORA: TTimeField;
    FDQryFiltroCONTEUDO: TStringField;
    procedure FDQryFiltroKEYGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure baixaarquivo();
  end;

var
  frmCADBANCO_REMESSA: TfrmCADBANCO_REMESSA;

implementation

{$R *.dfm}

uses ServerModule, untDM_RC, mkm_funcoes, str_func, mkm_procedures,
  uniGUIApplication;

procedure TfrmCADBANCO_REMESSA.baixaarquivo;
var
  caminhoret,
  caminho,
  nomearquivo : string;
begin

  caminhoret  := FDQryFiltroCONTEUDO.AsString;
  nomearquivo := ExtractFileName(caminhoret);

  Downloadremessa    (ExtractFilePath(caminhoret),ExtractFileName(caminhoret));
  UniSession.SendFile(sm.FilesFolderPath+nomearquivo);
  DeleteFile         (sm.FilesFolderPath+nomearquivo);

  gera_log('Downloadremessa..: ' + Downloadremessa(ExtractFilePath(caminhoret),ExtractFileName(caminhoret)));
  gera_log('ServerModule.....: ' + sm.FilesFolderPath+nomearquivo);
end;

procedure TfrmCADBANCO_REMESSA.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
begin
  if Column.FieldName = 'KEY' then
    begin
      try
        baixaarquivo();

        dm_rc.rc_ShowSweetAlert( 'Ok', 'ARQUIVO BAIXADO COM SUCESSO' , 'sucess' , false );
      except
        dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NÃO CONSEGUI BAIXAR O ARQUIVO' , 'error' , false );
      end;
    end;
end;

procedure TfrmCADBANCO_REMESSA.FDQryFiltroKEYGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text :=
    '<i title="detalhes" class="fa fa-lg fas fa-download fa-lg"; style="color:blue; cursor:pointer;"></i>';
end;
initialization
  RegisterClass(TfrmCADBANCO_REMESSA);
end.
