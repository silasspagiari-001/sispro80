unit untCadTOLERANCIA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmCRUDproprio, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniGUIClasses, uniEdit,
  uniLabel, uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniGUIBaseClasses, UniButtonDbEdit, uniCheckBox, uniDBCheckBox, uniDBEdit,
  uniMemo;

type
  TfrmCADTOLERANCIA = class(TfrmCRUDPROPRIO)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    UniDBCheckBox1: TUniDBCheckBox;
    UniLabel4: TUniLabel;
    UniButtonDbEditESPECIE: TUniButtonDbEdit;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniLabel6: TUniLabel;
    rcBlock50: TUniContainerPanel;
    UniLabel18: TUniLabel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniLabel7: TUniLabel;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    UniLabel8: TUniLabel;
    UniDBFormattedNumberEdit3: TUniDBFormattedNumberEdit;
    UniLabel9: TUniLabel;
    rcBlock90: TUniContainerPanel;
    UniLabel10: TUniLabel;
    rcBlock100: TUniContainerPanel;
    rcBlock110: TUniContainerPanel;
    rcBlock120: TUniContainerPanel;
    UniDBFormattedNumberEdit4: TUniDBFormattedNumberEdit;
    UniLabel11: TUniLabel;
    UniDBFormattedNumberEdit5: TUniDBFormattedNumberEdit;
    UniLabel12: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel13: TUniLabel;
    procedure UniButtonDbEditESPECIEButtonClick(Sender: TObject);
    procedure UniButtonDbEditESPECIEExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADTOLERANCIA: TfrmCADTOLERANCIA;

implementation

{$R *.dfm}

uses MainModule, untFrmPesquisa, untDM_RC, mkm_procedures;
procedure TfrmCADTOLERANCIA.UniButtonDbEditESPECIEButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('ESPECIE');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       sqlMaster.Edit;
       sqlMaster.FindField('ESPECIE').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmCADTOLERANCIA.UniButtonDbEditESPECIEExit(Sender: TObject);
begin
  inherited;
  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    begin
      if (UniButtonDbEditESPECIE.Text <> '') and (UniButtonDbEditESPECIE.Text <> '0') then
        begin
          SqlPesquisa('select sementenome from especie where codigo = ' + IntToStr(sqlMaster.FindField('ESPECIE').AsInteger));
            sqlMaster.FindField('ESPECIE_DESCRICAO').AsString := dm_rc.sqlBuscas.FindField('SEMENTENOME').AsString
        end;
    end;
end;

initialization
  RegisterClass(TfrmCADTOLERANCIA);
end.
