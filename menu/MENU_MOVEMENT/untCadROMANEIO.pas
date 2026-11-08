unit untCadROMANEIO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmCRUDproprio, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  uniGUIBaseClasses, uniGUIClasses, uniScreenMask, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, uniHTMLFrame, uniBasicGrid, uniDBGrid, uniMultiItem,
  uniComboBox, uniEdit, uniLabel, uniScrollBox, uniPanel, uniPageControl,
  uniButton, uniBitBtn, uniMemo, uniDBEdit, UniButtonDbEdit, uniDateTimePicker,
  uniDBDateTimePicker, uniCheckBox, uniDBCheckBox, Vcl.Menus, uniMainMenu;

type
  TfrmcadROMANEIO = class(TfrmCRUDPROPRIO)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    UniLabel7: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniLabel6: TUniLabel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    UniLabel15: TUniLabel;
    UniButtonDbEditCEPP: TUniButtonDbEdit;
    UniDBEdit5: TUniDBEdit;
    UniLabel4: TUniLabel;
    rcBlock60: TUniContainerPanel;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    UniDBEdit1: TUniDBEdit;
    UniLabel5: TUniLabel;
    UniDBFormattedNumberEditvlrprodutos: TUniDBFormattedNumberEdit;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    rcBlock90: TUniContainerPanel;
    UniDBGridbeneficiamento: TUniDBGrid;
    tbdetalhesPESSOA: TIntegerField;
    tbdetalhesNOME: TStringField;
    tbdetalhesSEQUENCIA: TIntegerField;
    tbdetalhesPRODUTO: TIntegerField;
    tbdetalhesDESCRICAO: TStringField;
    tbdetalhesQUANTIDADE: TFloatField;
    tbdetalhesSACOS: TFloatField;
    tbdetalhesbusca: TStringField;
    tbdetalhesexclui: TStringField;
    tbdetalhesNUMERO: TIntegerField;
    tbdetalhesEMBALAGENS: TIntegerField;
    tbdetalhesDOCUMENTO: TIntegerField;
    tbdetalhesSERIE: TStringField;
    UniPopupMenu: TUniPopupMenu;
    R1: TUniMenuItem;
    N1: TUniMenuItem;
    F1: TUniMenuItem;
    FDQryFiltroKEY: TStringField;
    FDQryFiltroCODIGO: TIntegerField;
    FDQryFiltroMOTORISTA: TIntegerField;
    FDQryFiltroNOME: TStringField;
    FDQryFiltroPLACA: TStringField;
    FDQryFiltroEMISSAO: TDateField;
    FDQryFiltroEMPRESA: TIntegerField;
    FDQryFiltroVALORFRETE: TFMTBCDField;
    FDQryFiltroPAGO: TFMTBCDField;
    FDQryFiltroATIVO: TStringField;
    UniPopupMenuopcoes: TUniPopupMenu;
    UniMenuItem1: TUniMenuItem;
    procedure tbdetalhesbuscaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure tbdetalhesexcluiGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure UniDBGridbeneficiamentoCellClick(Column: TUniDBGridColumn);
    procedure UniButtonDbEditCEPPButtonClick(Sender: TObject);
    procedure UniButtonDbEditCEPPExit(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure F1Click(Sender: TObject);
    procedure FDQryFiltroKEYGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure UniMenuItem1Click(Sender: TObject);
  private
    { Private declarations }
  posicao_x, posicao_y    : Integer;
  public
    { Public declarations }
  procedure carreganota(const f_codigo:integer);
  end;

var
  frmcadROMANEIO: TfrmcadROMANEIO;
  Y             : integer;

implementation

{$R *.dfm}

uses untDM_RC, MainModule, untFrmPesquisaItensestoque, mkm_procedures,
  untFrmPesquisa, mkm_impressao, unReportImpressao, mkm_funcoes, mkm_func_web,
  Vcl.Grids, untFrmRECIBOTERMO;
procedure TfrmcadROMANEIO.btnOptionsClick(Sender: TObject);
begin
  inherited;
  UniPopupMenu.PopupBy( TUniButton( sender ) );
end;

procedure TfrmcadROMANEIO.carreganota(const f_codigo: integer);
begin
  if SqlPesquisa('select * from mvitens where codigo = ' + IntToStr(f_codigo)) then
    begin
      if tbdetalhes.State = dsBrowse then tbdetalhes.edit;
      tbdetalhes.FindField('NUMERO').AsInteger        := dm_rc.sqlBuscas.Findfield('NUMERO').AsInteger;
      tbdetalhes.FindField('PESSOA').AsInteger        := dm_rc.sqlBuscas.Findfield('PESSOA').AsInteger;
      tbdetalhes.FindField('PRODUTO').AsInteger       := dm_rc.sqlBuscas.Findfield('PRODUTO').AsInteger;
      tbdetalhes.FindField('DESCRICAO').AsString      := dm_rc.sqlBuscas.Findfield('DESCRICAO').AsString;
      tbdetalhes.FindField('SERIE').AsString          := dm_rc.sqlBuscas.Findfield('SERIE').AsString;
      tbdetalhes.FindField('SEQUENCIA').AsInteger     := dm_rc.sqlBuscas.Findfield('SEQUENCIA').AsInteger;
      tbdetalhes.FindField('DOCUMENTO').AsInteger     := dm_rc.sqlBuscas.Findfield('DOCUMENTO').AsInteger;
      tbdetalhes.FindField('SACOS').AsFloat           := dm_rc.sqlBuscas.Findfield('PESOSACO').AsFloat;
      tbdetalhes.FindField('QUANTIDADE').AsFloat      := dm_rc.sqlBuscas.Findfield('QUANTIDADE').AsFloat;
      tbdetalhes.FindField('NOME').AsString           := Acha_Item('PESSOAS',IntToStr(tbdetalhes.FindField('PESSOA').AsInteger));
      tbdetalhes.post;
    end;
end;

procedure TfrmcadROMANEIO.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
  var Linha, Coluna : Integer;
begin
   Linha  := TStringGrid(dbgSearchCRUD).Row;
   Coluna := dbgSearchCRUD.CurrCol;

  if Column.FieldName = 'KEY' then
    begin
      UniPopupMenuopcoes.Popup(posicao_x-25,posicao_y, dbgSearchCRUD);
    end;
end;

procedure TfrmcadROMANEIO.dbgSearchCRUDMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  posicao_x := X;
  posicao_y := Y;
end;

procedure TfrmcadROMANEIO.F1Click(Sender: TObject);
begin
  inherited;
  dm_rc.rc_ShowYesNo( 'POSSO IMPRIMIR O REQUERIMENTO?' );
  if mm.varB_Yes then
    begin
      mm.varC_caminhopdf :=  RELATORIO_ROMANEIO_REQUERIMENTO(mm.varI_Code_Company,
                                                             sqlMaster.FindField('CODIGO').AsInteger);
      unfImpressao.ShowModal();
    end;
end;

procedure TfrmcadROMANEIO.FDQryFiltroKEYGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
      '<i title="detalhes" class="fa fa-lg fas fa-cog fa-lg"; style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmcadROMANEIO.R1Click(Sender: TObject);
begin
  inherited;
  dm_rc.rc_ShowYesNo( 'POSSO IMPRIMIR O RECIBO?' );
  if mm.varB_Yes then
    begin
      mm.varC_caminhopdf :=  RELATORIO_ROMANEIO_RECIBO(mm.varI_Code_Company,
                                                       sqlMaster.FindField('CODIGO').AsInteger);
      unfImpressao.ShowModal();
    end;
end;

procedure TfrmcadROMANEIO.tbdetalhesbuscaGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Produtos" class="fa fa-lg fas fa-search-plus fa-lg" style="color:blue; cursor:pointer;"></i>';

end;

procedure TfrmcadROMANEIO.tbdetalhesexcluiGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Excluir" class="fa fa-lg fa-trash fa-lg" style="color:red; cursor:pointer;"></i>';

end;

procedure TfrmcadROMANEIO.UniButtonDbEditCEPPButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('TRANSPORTES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       sqlMaster.Edit;
       sqlMaster.FindField('MOTORISTA').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmcadROMANEIO.UniButtonDbEditCEPPExit(Sender: TObject);
begin
  inherited;
  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    begin
      if (UniButtonDbEditCEPP.Text <> '') and (UniButtonDbEditCEPP.Text <> '0') then
        begin
          if SqlPesquisa('SELECT * FROM TRANSPORTES WHERE CODIGO = ' + QuotedStr(UniButtonDbEditCEPP.Text)) then
            begin
              sqlMaster.FindField('NOME').AsString    := dm_rc.sqlBuscas.FindField('NOME').AsString;
              sqlMaster.FindField('PLACA').AsString   := dm_rc.sqlBuscas.FindField('PLACA').AsString;
            end;
        end
        else
          begin
            dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Coloque uma Transportadora!' , 'warning' , false );
          end;
    end;
end;

procedure TfrmcadROMANEIO.UniDBGridbeneficiamentoCellClick(
  Column: TUniDBGridColumn);
begin
  inherited;
  if sqlMaster.State in [dsInsert,dsEdit] then
    begin
      if Column.FieldName = 'exclui' then
        begin
          dm_rc.rc_ShowYesNo( 'DESEJA REALMENTE EXCLUIR ESSE REGISTRO?' );
          if mm.varB_Yes then
            begin
              tbdetalhes.Delete;
            end
        end;

      if Column.FieldName = 'busca' then
        begin
          mm.varT_notasromaneio := TStringList.Create;
          mm.VarC_Atelagenerica := 'CARREGANOTAROMANEIO';
          frmpesquisaitensestoque.showmodal(
          procedure(Sender: TComponent; AResult: Integer)
           begin
             if AResult = mrOK then
             begin
               if mm.varT_notasromaneio.Count > 0 then
                 begin
                   for Y := 0 to mm.varT_notasromaneio.Count - 1 do
                     begin
                       tbdetalhes.insert;
                       carreganota(StrToInt(mm.varT_notasromaneio[Y]));
                     end;
                 end;
               mm.varT_notasromaneio.Free;
             end;
           end);
        end;
    end;
end;

procedure TfrmcadROMANEIO.UniMenuItem1Click(Sender: TObject);
begin
  inherited;
  frmRECIBOTERMO.ShowModal();
end;

initialization
  RegisterClass(TfrmcadROMANEIO);
end.
