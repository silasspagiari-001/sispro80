unit untFrmBASEBAIXATITULOS;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, uniPanel, uniHTMLFrame,
  uniGUIBaseClasses, uniGUIClasses, uniBasicGrid, uniDBGrid, uniEdit,
  uniDateTimePicker, UniButtonEdit, uniLabel, uniScrollBox, uniPageControl,
  uniButton, uniBitBtn, uniMultiItem, uniComboBox, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus, uniMainMenu,
  uniGUITypes;

type
  TfrmBASEBAIXATITULOS = class(TfrmBase)
    paBaseButtons: TUniContainerPanel;
    paOF: TUniContainerPanel;
    btnCloseForm: TUniBitBtn;
    paP: TUniContainerPanel;
    btnSearch: TUniBitBtn;
    paNAE: TUniContainerPanel;
    paGC: TUniContainerPanel;
    pgBaseCadControl: TUniPageControl;
    tabSearch: TUniTabSheet;
    paBaseRegSearch: TUniContainerPanel;
    paSearchFilters: TUniPanel;
    UniScrollBox1: TUniScrollBox;
    paSearchFilter1: TUniContainerPanel;
    paSearchField1: TUniContainerPanel;
    UniLabelc1: TUniLabel;
    UniButtonEditpbancos: TUniButtonEdit;
    paSearchOp1: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniButtonEditppessoas: TUniButtonEdit;
    UniLabel1: TUniLabel;
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel5: TUniContainerPanel;
    UniButtonEditpnumero: TUniButtonEdit;
    UniLabel2: TUniLabel;
    labTitleSearch: TUniLabel;
    paSearchFilterPeriodSelect: TUniContainerPanel;
    paSearchFilterDtIni: TUniContainerPanel;
    UniLabelDtIni: TUniLabel;
    edSearchCRUDDtIni: TUniDateTimePicker;
    paSearchFilterDtEnd: TUniContainerPanel;
    UniLabelDtEnd: TUniLabel;
    edSearchCRUDDtEnd: TUniDateTimePicker;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel4: TUniLabel;
    cbxSearchCRUDField2: TUniComboBox;
    UniContainerPanel4: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniComboBoxSTATUS: TUniComboBox;
    paSearchBtn: TUniContainerPanel;
    btnSearchCRUD: TUniBitBtn;
    btnSearchMoreFilters: TUniBitBtn;
    labExit: TUniLabel;
    UniLabelTOTALTITULOS: TUniLabel;
    dbgSearchCRUD: TUniDBGrid;
    UniPopupMenuopcoes: TUniPopupMenu;
    L1: TUniMenuItem;
    T1: TUniMenuItem;
    I1: TUniMenuItem;
    N1: TUniMenuItem;
    N2: TUniMenuItem;
    FDQryFiltro: TFDQuery;
    FDQryFiltroNUMERO: TIntegerField;
    FDQryFiltroSERIE: TStringField;
    FDQryFiltroSEQUENCIA: TIntegerField;
    FDQryFiltroPESSOA: TIntegerField;
    FDQryFiltroNOME: TStringField;
    FDQryFiltroEMISSAO: TDateField;
    FDQryFiltroVENCIMENTO: TDateField;
    FDQryFiltroPAGAMENTO: TDateField;
    FDQryFiltroVALORATUAL: TFMTBCDField;
    FDQryFiltroSITUACAO: TStringField;
    FDQryFiltroCODIGO: TIntegerField;
    dsfiltro: TDataSource;
    btnOptions: TUniBitBtn;
    mempesquisa: TFDMemTable;
    dspesquisa: TDataSource;
    mempesquisaNUMERO: TIntegerField;
    mempesquisaSERIE: TStringField;
    mempesquisaPESSOA: TIntegerField;
    mempesquisaSEQUENCIA: TIntegerField;
    mempesquisaNOME: TStringField;
    mempesquisaEMISSAO: TDateTimeField;
    mempesquisaVENCIMENTO: TDateTimeField;
    mempesquisaPAGAMENTO: TDateTimeField;
    mempesquisaVALORATUAL: TFloatField;
    mempesquisaSITUACAO: TStringField;
    mempesquisaCODIGO: TIntegerField;
    mempesquisamarcador: TStringField;
    TB_MEMBAI: TFDMemTable;
    TB_MEMBAIBAITDC: TIntegerField;
    TB_MEMBAIBAINDC: TFloatField;
    TB_MEMBAIBAISDC: TStringField;
    TB_MEMBAIBAIODC: TIntegerField;
    TB_MEMBAIBAICLF: TIntegerField;
    TB_MEMBAIBAINOM: TStringField;
    TB_MEMBAIBAIAPL: TIntegerField;
    TB_MEMBAIBAIPOR: TIntegerField;
    TB_MEMBAIBAIBAN: TStringField;
    TB_MEMBAIBAIDTE: TDateField;
    TB_MEMBAIBAIVCT: TDateField;
    TB_MEMBAIBAIVLA: TFloatField;
    TB_MEMBAIBAICOM: TFloatField;
    TB_MEMBAIBAICAR: TIntegerField;
    TB_MEMBAIBAIVEN: TIntegerField;
    TB_MEMBAIBAIPED: TStringField;
    TB_MEMBAIBAIOB1: TStringField;
    TB_MEMBAIBAIPER: TFloatField;
    TB_MEMBAIBAICOMP: TDateField;
    TB_MEMBAIBAIJUR: TFloatField;
    TB_MEMBAIBAITAX: TFloatField;
    TB_MEMBAIBAIDSC: TFloatField;
    TB_MEMBAIBAIVLP: TFloatField;
    TB_MEMBAIBAIPAR: TFloatField;
    TB_MEMBAIBAICONT: TIntegerField;
    TB_MEMBAIBAIPRZ: TIntegerField;
    TB_MEMBAIBAIPLA: TStringField;
    TB_MEMBAIexclui: TStringField;
    TB_MEMBAIPES_PORTADOR: TStringField;
    TB_MEMBAIPES_PLANOCONTAS: TStringField;
    TB_MEMBAIBAIANEXO: TStringField;
    TB_MEMBAIdetalhesanexo: TStringField;
    DS_MEMBAI: TDataSource;
    FDQryTitulos: TFDQuery;
    TB_MEMBAITABELA: TStringField;
    UniPopupMenudetalhes: TUniPopupMenu;
    V1: TUniMenuItem;
    procedure UniButtonEditpbancosButtonClick(Sender: TObject);
    procedure UniButtonEditppessoasButtonClick(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnOptionsClick(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure mempesquisaSITUACAOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure dbgSearchCRUDDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure L1Click(Sender: TObject);
    procedure T1Click(Sender: TObject);
    procedure P1Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure TB_MEMBAIPES_PORTADORGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure TB_MEMBAIPES_PLANOCONTASGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure TB_MEMBAIexcluiGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure mempesquisamarcadorGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure dbgSearchCRUDMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure V1Click(Sender: TObject);
  private
    { Private declarations }
  posicao_x, posicao_y    : Integer;
  public
    { Public declarations }
  procedure ativabusca();
  procedure SomaTotal();
  procedure VoltarTitulo();
  end;

var
  frmBASEBAIXATITULOS: TfrmBASEBAIXATITULOS;

implementation

{$R *.dfm}

uses MainModule, untFrmPesquisa, mkm_func_web, untDM_RC, Winapi.Windows,
  untFrmBaixaTitulos, mkm_procedures, Vcl.Grids;

procedure TfrmBASEBAIXATITULOS.ativabusca;
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

procedure TfrmBASEBAIXATITULOS.btnOptionsClick(Sender: TObject);
begin
  inherited;
  UniPopupMenuopcoes.PopupBy( TUniButton( sender ) );
end;

procedure TfrmBASEBAIXATITULOS.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmBASEBAIXATITULOS.btnSearchCRUDClick(Sender: TObject);
var
  SQL,WHERE,SITUACAO,M_AND,M_ORDEM,M_SITUACAO,CAMPOS : string;
begin
  inherited;
  if UniButtonEditpbancos.Text = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'Atenção', 'Preencher o campo de Bancos ou deixa "0"', 'warning' ) ;
      UniButtonEditpbancos.SetFocus;
      abort
    end;

  if UniButtonEditppessoas.Text = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'Atenção', 'Preencher o campo de Pessoas ou deixa "0"', 'warning' ) ;
      UniButtonEditppessoas.SetFocus;
      abort;
    end;

  if UniButtonEditpnumero.Text = '' then
    begin
      dm_rc.rc_ShowSweetAlert( 'Atenção', 'Preencher o campo de Numero ou deixa "0"', 'warning' ) ;
      UniButtonEditpnumero.SetFocus;
      abort;
    end;


  CAMPOS := ' T.CODIGO, T.NUMERO,T.SERIE,T.SEQUENCIA,T.PESSOA,P.NOME,T.EMISSAO,T.VENCIMENTO,T.PAGAMENTO,T.VALORATUAL,T.SITUACAO ';

  case UniComboBoxSTATUS.ItemIndex of
    0 : M_SITUACAO := ' AND T.situacao = ' + QuotedStr('Aberto');
    1 : M_SITUACAO := ' AND T.situacao = ' + QuotedStr('Pago');
    2 : M_SITUACAO := '';
  end;


  case cbxSearchCRUDField2.ItemIndex of
    0: M_ORDEM := ' ORDER BY T.EMISSAO';
    1: M_ORDEM := ' ORDER BY T.VENCIMENTO';
    2: M_ORDEM := ' ORDER BY T.PAGAMENTO';
  end;


  case cbxSearchCRUDField2.ItemIndex of
    0: M_AND   := ' AND T.EMISSAO BETWEEN                ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
    1: M_AND   := ' AND T.VENCIMENTO BETWEEN             ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
    2: M_AND   := ' AND T.PAGAMENTO BETWEEN              ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text))        +
                  ' AND                                  ' + QuotedStr(DataPonto(edSearchCRUDDtEnd.Text));
  end;


  SQL :=    ' SELECT ' + CAMPOS +
            ' FROM   ' + sqlSearchMaster.UpdateOptions.UpdateTableName     +
            ' T INNER JOIN PESSOAS P ON (T.PESSOA = P.CODIGO)        ' +
            ' AND T.FINANCEIRO                            =          ' + varIIF(sqlSearchMaster.UpdateOptions.UpdateTableName = 'PAGAR',QuotedStr('0'),QuotedStr('1')) +
            variif(UniButtonEditppessoas.Text             = '0'    ,'','AND T.PESSOA      = ' + QuotedStr(UniButtonEditppessoas.Text))      +
            variif(UniButtonEditpbancos.Text              = '0'    ,'','AND T.PORTADOR    = ' + QuotedStr(UniButtonEditpbancos.Text))       +
            variif(UniButtonEditpnumero.Text              = '0'    ,'','AND T.NUMERO      = ' + QuotedStr(UniButtonEditpnumero.Text))       +
            ' AND T.EMPRESA                               = ' + IntToStr(mm.varI_Code_Company);

  sqlSearchMaster.Close;
  sqlSearchMaster.SQL.Clear;
  sqlSearchMaster.SQL.Text  := SQL + M_AND + M_SITUACAO + M_ORDEM;
  sqlSearchMaster.Open();

  mempesquisa.Close;
  mempesquisa.Open;

  mempesquisa.CopyDataSet(FDQryFiltro);

  SomaTotal();

end;

procedure TfrmBASEBAIXATITULOS.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
  var Linha, Coluna : Integer;
begin
  inherited;
   Linha  := TStringGrid(dbgSearchCRUD).Row;
   Coluna := dbgSearchCRUD.CurrCol;

   if mempesquisaSITUACAO.AsString = 'Pago' then
     begin
       if Column.FieldName = 'marcador' then
         begin
           UniPopupMenudetalhes.Popup(posicao_x-20,posicao_y, dbgSearchCRUD);
         end;
     end;
end;

procedure TfrmBASEBAIXATITULOS.dbgSearchCRUDDblClick(Sender: TObject);
begin
  inherited;

  mempesquisa.Edit;
  if mempesquisa.FindField('marcador').AsString = 'T' then mempesquisa.FindField('marcador').AsString := 'F'  else
    mempesquisa.FindField('marcador').AsString := 'T';
  mempesquisa.Post;

end;

procedure TfrmBASEBAIXATITULOS.dbgSearchCRUDDrawColumnCell(Sender: TObject;
  ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  inherited;
  if mempesquisamarcador.AsString = 'T' then
    Attribs.Color := $00D2AAF0;
end;

procedure TfrmBASEBAIXATITULOS.dbgSearchCRUDMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  posicao_x := X;
  posicao_y := Y;
end;

procedure TfrmBASEBAIXATITULOS.I1Click(Sender: TObject);
var
  SQL : string;
begin
  inherited;
  if mempesquisa.RecordCount > 0 then
    begin
      TB_MEMBAI.Close;
      TB_MEMBAI.Open;

      mempesquisa.First;
      while not mempesquisa.Eof do
        begin
          if mempesquisamarcador.AsString = 'T' then
            begin
              //**************************************************************//
              // buscar titulos unitarios
              //**************************************************************//
              SQL := ' SELECT * FROM  ' + sqlSearchMaster.UpdateOptions.UpdateTableName +
                     ' WHERE CODIGO = ' + IntToStr(mempesquisaCODIGO.AsInteger);

              FDQryTitulos.Close;
              FDQryTitulos.SQL.Clear;
              FDQryTitulos.SQL.Text  := SQL;
              FDQryTitulos.Open();
              //**************************************************************//


              TB_MEMBAI.Append;
              TB_MEMBAITABELA.AsString   := sqlSearchMaster.UpdateOptions.UpdateTableName;
              TB_MEMBAIBAICONT.AsInteger := FDQryTitulos.FindField('CODIGO').AsInteger;
              TB_MEMBAIBAITDC.AsInteger  := FDQryTitulos.FindField('DOCUMENTO').AsInteger;
              TB_MEMBAIBaiNdc.AsString   := FDQryTitulos.FindField('NUMERO').AsString;
              TB_MEMBAIBaiSdc.AsString   := FDQryTitulos.FindField('SERIE').AsString;
              TB_MEMBAIBaiClf.AsString   := FDQryTitulos.FindField('PESSOA').AsString;
              TB_MEMBAIBaiOdc.AsString   := FDQryTitulos.FindField('SEQUENCIA').AsString;
              TB_MEMBAIBaiNom.AsString   := Acha_Item('PESSOAS',FDQryTitulos.FindField('PESSOA').AsString);
              TB_MEMBAIBAIPOR.AsInteger  := FDQryTitulos.FindField('PORTADOR').AsInteger;

              TB_MEMBAIBaiDte.AsString   := FDQryTitulos.FindField('EMISSAO').AsString;
              TB_MEMBAIBaiVct.AsString   := FDQryTitulos.FindField('VENCIMENTO').AsString;
              TB_MEMBAIBAICOMP.AsDateTime:= FDQryTitulos.FindField('COMPETENCIA').AsDateTime;
              TB_MEMBAIBaiVla.AsFloat    := FDQryTitulos.FindField('VALORATUAL').AsFloat;
              TB_MEMBAIBaiCAR.AsInteger  := FDQryTitulos.FindField('CARTEIRA').AsInteger;
              TB_MEMBAIBAIVEN.AsInteger  := FDQryTitulos.FindField('FUNCIONARIO').AsInteger;
              TB_MEMBAIBAIPED.AsString   := FDQryTitulos.FindField('PEDIDO').AsString;
              TB_MEMBAIBAIPER.AsFloat    := FDQryTitulos.FindField('PERCCOMISSAO').AsFloat;
              TB_MEMBAIBaiCOM.AsFloat    := FDQryTitulos.FindField('COMISSAOFUNCIONARIO').AsFloat;
              TB_MEMBAIBAIPLA.AsString   := FDQryTitulos.FindField('PLANOCONTAS').AsString;
              TB_MEMBAIBAIOB1.AsString   := FDQryTitulos.FindField('OBSERVACOES').AsString;

              TB_MEMBAIBaiJur.AsFloat    := 0;
              TB_MEMBAIBaiTax.AsFloat    := 0;
              TB_MEMBAIBaiDsc.AsFloat    := 0;
              TB_MEMBAIBaiVlp.AsFloat := (TB_MEMBAIBaiVla.AsFloat  +
                                          TB_MEMBAIBaiJur.AsFloat  +
                                          TB_MEMBAIBaiTax.AsFloat) - TB_MEMBAIBaiDsc.AsFloat;
              TB_MEMBAI.Post;
            end;
          mempesquisa.Next;
        end;
      mempesquisa.First;

      frmBAIXATITULOS.TB_MEMBAI.Close;
      frmBAIXATITULOS.TB_MEMBAI.Open;

      frmBAIXATITULOS.TB_MEMBAI.CopyDataSet(TB_MEMBAI);
      frmBAIXATITULOS.ShowModal();
    end;
end;

procedure TfrmBASEBAIXATITULOS.L1Click(Sender: TObject);
begin
  inherited;
  if mempesquisa.RecordCount > 0 then
    begin
      mempesquisa.First;
      while not mempesquisa.Eof do
        begin
          mempesquisa.Edit;
          mempesquisa.FindField('marcador').AsString := 'F';
          mempesquisa.Post;

          mempesquisa.Next;
        end;
      mempesquisa.First;
    end;
end;

procedure TfrmBASEBAIXATITULOS.mempesquisamarcadorGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
      '<i title="detalhes" class="fa fa-lg fas fa-thumbtack fa-lg"; style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmBASEBAIXATITULOS.mempesquisaSITUACAOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if mempesquisaSITUACAO.AsString = 'Aberto' then
        Text := '<span class="badge badge-warning">Aberto</span>'
      else
      if mempesquisaSITUACAO.AsString = 'Pago' then
        Text := '<span class="badge badge-success">Pago</span>';

      if mempesquisaSITUACAO.AsString = 'Aberto' then
        begin
          if Date > mempesquisaVENCIMENTO.AsDateTime then
            Text := '<span class="badge badge-danger">Atrasado</span>';
        end;
    end;
end;

procedure TfrmBASEBAIXATITULOS.P1Click(Sender: TObject);
begin
  inherited;
  if mempesquisa.RecordCount > 0 then
    begin

    end;
end;

procedure TfrmBASEBAIXATITULOS.SomaTotal;
var
  sumvalue : Real;
begin
  sumvalue := 0;

  sqlSearchMaster.DisableControls;
  sqlSearchMaster.First;
  while not sqlSearchMaster.Eof do
    begin
      sumvalue := sumvalue + sqlSearchMaster.FindField('VALORATUAL').AsFloat;
      sqlSearchMaster.Next;
    end;
  sqlSearchMaster.First;
  sqlSearchMaster.EnableControls;

  UniLabelTOTALTITULOS.Text := FormatFloat('R$ #,0.00', sumvalue);
end;

procedure TfrmBASEBAIXATITULOS.T1Click(Sender: TObject);
begin
  inherited;
  if mempesquisa.RecordCount > 0 then
    begin
      mempesquisa.First;
      while not mempesquisa.Eof do
        begin
          mempesquisa.Edit;
          mempesquisa.FindField('marcador').AsString := 'T';
          mempesquisa.Post;

          mempesquisa.Next;
        end;

      mempesquisa.First;
    end;
end;

procedure TfrmBASEBAIXATITULOS.TB_MEMBAIexcluiGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Excluir" class="fa fa-lg fa-trash fa-lg" style="color:red; cursor:pointer;"></i>';
end;

procedure TfrmBASEBAIXATITULOS.TB_MEMBAIPES_PLANOCONTASGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Produtos" class="fa fa-lg fas fa-search-plus fa-lg" style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmBASEBAIXATITULOS.TB_MEMBAIPES_PORTADORGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
    Text :=
    '<i title="Produtos" class="fa fa-lg fas fa-search-plus fa-lg" style="color:blue; cursor:pointer;"></i>';
end;

procedure TfrmBASEBAIXATITULOS.UniButtonEditpbancosButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('PORTADORES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditpbancos.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmBASEBAIXATITULOS.UniButtonEditppessoasButtonClick(
  Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('PESSOAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       UniButtonEditppessoas.Text := MM.varC_codigo_busca;
     end;
   end);
end;

procedure TfrmBASEBAIXATITULOS.UniFrameCreate(Sender: TObject);
begin
  inherited;

  cbxSearchCRUDField2.ItemIndex := 1;
  UniComboBoxSTATUS.ItemIndex   := 0;

  edSearchCRUDDtIni.Text        := '01/01/2010';
  edSearchCRUDDtEnd.Text        := '31/12/2099';

  btnSearchCRUD.OnClick(Self);
  ativabusca();
end;

procedure TfrmBASEBAIXATITULOS.V1Click(Sender: TObject);
begin
  inherited;
  VoltarTitulo();
end;

procedure TfrmBASEBAIXATITULOS.VoltarTitulo;
var
  sql : string;
begin
  dm_rc.rc_ShowYesNo( 'DESEJA VOLTAR ESSE TITULO EM ABERTO?' );
  if mm.varB_Yes then
    begin
      try
        sql := ' UPDATE ' + sqlSearchMaster.UpdateOptions.UpdateTableName + ' SET             ' + 'PAGAMENTO =  NULL,'  +
                                                                        ' SITUACAO     =  ' + QuotedStr('Aberto')   +
                                                                        ' WHERE CODIGO =  ' + IntToStr(mempesquisaCODIGO.AsInteger);
        executasql(sql);
        executasql('DELETE FROM TITULOS_PLANOS WHERE MESTRE_ID = ' + IntToStr(mempesquisaCODIGO.AsInteger));
        dm_rc.rc_ShowSweetAlert( 'Ok', 'REGISTRO RECUPERADO COMO "ABERTO"!' , 'success' , false );
        btnSearchCRUD.OnClick(Self);
      except
        dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'NÃO CONSEGUI RECUPERAR O REGISTRO' , 'error' , false );
      end;
    end;
end;

end.
