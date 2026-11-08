unit untFrmPROTOCOLO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmBase, untFrmBaseCRUD, uniEdit, uniBasicGrid,
  uniDBGrid, uniButton, uniBitBtn, uniGUIClasses, uniMultiItem, uniComboBox,
  uniLabel, uniScrollBox, uniPanel, uniPageControl, uniHTMLFrame,
  uniGUIBaseClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit,
  UniButtonDbEdit, uniDBComboBox, uniCheckBox, uniDBCheckBox, Vcl.Menus,
  uniMainMenu, uniSweetAlert;

type
  TAcaoCrud = (tpIncluir, tpAlterar, tpExcluir, tpListaVazia,tpListacomRegistros);

  TfrmCADprotocolo = class(TfrmBaseCRUD)
    sqlSearchMasterPLATAFORMA: TStringField;
    sqlSearchMasterDATAEMISSAO: TDateField;
    sqlSearchMasterAMOSTRA: TStringField;
    sqlSearchMasterBOLETIM: TStringField;
    sqlSearchMasterNUMEROIR: TStringField;
    sqlSearchMasterCATEGORIA: TStringField;
    sqlSearchMasterNOMEPESSOA: TStringField;
    sqlSearchMasterCULTIVAR: TStringField;
    sqlSearchMasterCODIGO: TIntegerField;
    sqlSearchMasterSITUACAO: TStringField;
    UniPageControlcadastros: TUniPageControl;
    UniTabSheetCRUD: TUniTabSheet;
    UniScrollBox2: TUniScrollBox;
    rcBlock350: TUniContainerPanel;
    rcBlock360: TUniContainerPanel;
    rcBlock370: TUniContainerPanel;
    rcBlock380: TUniContainerPanel;
    rcBlock390: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniLabel8: TUniLabel;
    UniDBDateTimePicker2: TUniDBDateTimePicker;
    UniLabel6: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    UniLabel7: TUniLabel;
    UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit;
    UniLabel9: TUniLabel;
    rcBlock400: TUniContainerPanel;
    rcBlock410: TUniContainerPanel;
    rcBlock420: TUniContainerPanel;
    rcBlock430: TUniContainerPanel;
    rcBlock440: TUniContainerPanel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniLabel10: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel11: TUniLabel;
    cbxdbpeneira: TUniDBComboBox;
    UniLabel12: TUniLabel;
    cbxdbcategoria: TUniDBComboBox;
    UniLabel13: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniLabel14: TUniLabel;
    rcBlock450: TUniContainerPanel;
    rcBlock460: TUniContainerPanel;
    rcBlock470: TUniContainerPanel;
    rcBlock480: TUniContainerPanel;
    rcBlock490: TUniContainerPanel;
    UniButtonDbEditCEPP: TUniButtonDbEdit;
    UniButtonDbEdit1: TUniButtonDbEdit;
    UniDBEdit4: TUniDBEdit;
    UniDBEdit5: TUniDBEdit;
    UniDBEdit6: TUniDBEdit;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    UniLabel17: TUniLabel;
    UniLabel18: TUniLabel;
    UniLabel19: TUniLabel;
    rcBlock500: TUniContainerPanel;
    UniLabel21: TUniLabel;
    rcBlock510: TUniContainerPanel;
    rcBlock520: TUniContainerPanel;
    rcBlock530: TUniContainerPanel;
    rcBlock540: TUniContainerPanel;
    UniLabel20: TUniLabel;
    UniButtonDbEdit2: TUniButtonDbEdit;
    UniDBEdit7: TUniDBEdit;
    UniLabel22: TUniLabel;
    UniDBEdit8: TUniDBEdit;
    UniLabel23: TUniLabel;
    UniDBEdit9: TUniDBEdit;
    UniLabel24: TUniLabel;
    rcBlock550: TUniContainerPanel;
    rcBlock560: TUniContainerPanel;
    rcBlock570: TUniContainerPanel;
    rcBlock580: TUniContainerPanel;
    UniButtonDbEdit3: TUniButtonDbEdit;
    UniLabel25: TUniLabel;
    UniDBEdit10: TUniDBEdit;
    UniLabel26: TUniLabel;
    UniDBEdit11: TUniDBEdit;
    UniLabel27: TUniLabel;
    UniButtonDbEdit4: TUniButtonDbEdit;
    UniLabel28: TUniLabel;
    rcBlock590: TUniContainerPanel;
    UniLabel29: TUniLabel;
    rcBlock600: TUniContainerPanel;
    rcBlock610: TUniContainerPanel;
    rcBlock620: TUniContainerPanel;
    rcBlock630: TUniContainerPanel;
    rcBlock640: TUniContainerPanel;
    UniDBDateTimePicker3: TUniDBDateTimePicker;
    UniLabel30: TUniLabel;
    UniButtonDbEdit5: TUniButtonDbEdit;
    UniLabel31: TUniLabel;
    UniButtonDbEdit6: TUniButtonDbEdit;
    UniLabel32: TUniLabel;
    UniButtonDbEdit7: TUniButtonDbEdit;
    UniLabel33: TUniLabel;
    UniDBEdit12: TUniDBEdit;
    UniLabel34: TUniLabel;
    rcBlock650: TUniContainerPanel;
    rcBlock660: TUniContainerPanel;
    rcBlock670: TUniContainerPanel;
    cbxdbtipoamostra: TUniDBComboBox;
    UniLabel35: TUniLabel;
    cbxdbsituacao: TUniDBComboBox;
    UniLabel36: TUniLabel;
    UniDBFormattedNumberEdit2: TUniDBFormattedNumberEdit;
    UniLabel37: TUniLabel;
    rcBlock680: TUniContainerPanel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniDBCheckBox2: TUniDBCheckBox;
    UniDBCheckBox3: TUniDBCheckBox;
    UniDBCheckBox4: TUniDBCheckBox;
    UniDBCheckBox5: TUniDBCheckBox;
    UniDBCheckBox6: TUniDBCheckBox;
    UniDBCheckBox7: TUniDBCheckBox;
    UniDBCheckBox8: TUniDBCheckBox;
    UniDBCheckBox9: TUniDBCheckBox;
    UniDBCheckBox10: TUniDBCheckBox;
    UniPopupMenuopcoes: TUniPopupMenu;
    GINFORMATIVO: TUniMenuItem;
    GBAS: TUniMenuItem;
    UniContainerPanel1: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniComboBoxCRUDordem: TUniComboBox;
    UniComboBoxCRUDstatus: TUniComboBox;
    UniLabel3: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnSearchCRUDClick(Sender: TObject);
    procedure sqlSearchMasterSITUACAOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgSearchCRUDDblClick(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
    procedure btnEditRegClick(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure btnSaveRegClick(Sender: TObject);
    procedure btnCancelRegClick(Sender: TObject);
    procedure sqlSearchMasterCODIGOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
    procedure btnOptionsClick(Sender: TObject);
    procedure UniButtonDbEditCEPPExit(Sender: TObject);
    procedure UniButtonDbEdit1Exit(Sender: TObject);
    procedure UniButtonDbEditCEPPButtonClick(Sender: TObject);
    procedure UniButtonDbEdit1ButtonClick(Sender: TObject);
    procedure UniButtonDbEdit2ButtonClick(Sender: TObject);
    procedure UniButtonDbEdit2Exit(Sender: TObject);
    procedure UniButtonDbEdit3ButtonClick(Sender: TObject);
    procedure UniButtonDbEdit3Exit(Sender: TObject);
    procedure UniButtonDbEdit4ButtonClick(Sender: TObject);
    procedure UniButtonDbEdit7ButtonClick(Sender: TObject);
    procedure UniButtonDbEdit7Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure ativabusca();
  procedure SetBut(Acao:TAcaoCrud);
  function  CamposValidados :Boolean;
  procedure CarregaCategoria;
  procedure Carregapeneira;
  procedure transfere();
  end;

var
  frmCADprotocolo: TfrmCADprotocolo;

implementation

{$R *.dfm}

uses MainModule, mkm_funcoes, mkm_procedures, mkm_func_web, untDM_RC,
  System.TypInfo, untFrmPesquisa, untFrmProtocoloopcoes;

procedure TfrmCADprotocolo.ativabusca;
begin
  if not ( dsSearchMaster.State in [dsEdit, dsInsert ] ) then
  begin
     pgBaseCadControl.ActivePage := tabSearch;

     if mm.varB_Mobile_Screen_Portrait then
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, dbgSearchCRUD.Width, 0 )
     else
        paSearchFilters.Width := varIIF( paSearchFilters.width = 0, 266, 0 );
  end;

end;

procedure TfrmCADprotocolo.btnCancelRegClick(Sender: TObject);
begin
  inherited;
  if  sqlSearchMaster.IsEmpty then
      SetBut(tpListaVazia)
  else
      SetBut(tpListacomRegistros);

   sqlMaster.Close ;
end;

procedure TfrmCADprotocolo.btnDeleteRegClick(Sender: TObject);
var i : integer; Cmp:String;
begin
  dm_rc.rc_ShowYesNo( 'DESEJA REALMENTE EXCLUIR ESSE REGISTRO?' );
  if mm.varB_Yes then
    begin
//      Exclui();
    end
  else
    begin
      dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Operação cancelada pelo USUÁRIO!' , 'warning' );
      Abort
    end;

    Try
       sqlMaster.Close;

      for i := 0 to  sqlMaster.Params.Count - 1 do
      begin
        Cmp :=  sqlMaster.Params[i].Name;
         sqlMaster.Params[i].Value :=  sqlSearchMaster.FieldByName(Cmp).Value ;
      end;
       sqlMaster.Open;
    Except
      abort;
    End;

end;

procedure TfrmCADprotocolo.btnEditRegClick(Sender: TObject);
var i : integer; Cmp:String;
begin
  inherited;

  pgBaseCadControl.ActivePage := tabRegister;

  CarregaCategoria();
  Carregapeneira();

  SetBut(tpAlterar);

  mm.FDTransaction.StartTransaction;

  Try
    CarregaCategoria;
    sqlMaster.Close;
   for i := 0 to  sqlMaster.Params.Count - 1 do
   begin
      Cmp :=  sqlMaster.Params[i].Name;
      sqlMaster.Params[i].Value :=  sqlSearchMaster.FieldbyName(Cmp).Value;
   end;
    sqlMaster.Open;

    sqlMaster.Edit;
  Except
   Abort ;
  End ;

end;

procedure TfrmCADprotocolo.btnNewRegClick(Sender: TObject);
  var i : integer; Cmp:String;
begin
  inherited;

  pgBaseCadControl.ActivePage := tabRegister;

  CarregaCategoria();
  Carregapeneira();

  SetBut(tpIncluir);

  mm.FDTransaction.StartTransaction;

  try
    sqlMaster.Close ;
    for i := 0 to  sqlMaster.Params.Count - 1 do
    begin
      Cmp :=  sqlMaster.Params[i].Name;
       sqlMaster.Params[i].Value :=  sqlSearchMaster.FieldbyName(Cmp).Value;
    end;
     sqlMaster.Open;
  Except
     sqlMaster.Params[0].AsInteger := -1 ;
     sqlMaster.Open;
  End;

  if not( sqlMaster.Active) then
      sqlMaster.Open;

  CarregaCategoria();
  sqlMaster.Insert;
  sqlMaster.FindField('CODIGO').AsInteger           := 0;
  sqlMaster.FindField('EMPRESA').AsInteger          := MM.varI_Code_Company;
  sqlMaster.FindField('DATARECEBIMENTO').AsDateTime := Date;
  sqlMaster.FindField('DATAAMOSTRAGEM').AsDateTime  := Date;
  sqlMaster.FindField('DATACRITICA').AsDateTime     := Date;

  sqlMaster.FindField('ANALISE_RE').AsString        := 'Analise';
  sqlMaster.FindField('SITUACAO').AsString          := 'Aberto';

  sqlMaster.FindField('VALOR').AsFloat              := 0;
  sqlMaster.FindField('REPRESENTATIVIDADE').AsFloat := 0;
  sqlMaster.FindField('PESO_RECEBIDA').AsFloat      := 0;

  cbxdbtipoamostra.ItemIndex                       := 0;
  cbxdbsituacao.ItemIndex                          := 0;
end;

procedure TfrmCADprotocolo.btnOptionsClick(Sender: TObject);
begin
  inherited;
  UniPopupMenuopcoes.PopupBy( TUniButton( sender ) );
end;

procedure TfrmCADprotocolo.btnSaveRegClick(Sender: TObject);
begin
  inherited;
  if not (CamposValidados) then
     Abort
  else
    if sqlMaster.State in [dsInsert,dsEdit] then
     Begin
       if sqlMaster.State in [dsInsert] then
         begin
           sqlMaster.FindField('AMOSTRA').AsString := Gera_Amostra(sqlMaster.Findfield('DATACRITICA').AsDateTime);
           sqlMaster.FindField('CODIGO').AsInteger := Ultimo_Codigo(sqlMaster.UpdateOptions.UpdateTableName,'CODIGO',True);
           sqlMaster.FindField('KEY').AsString     := Gera_Guid;
         end;

       sqlMaster.Post;
       mm.FDTransaction.CommitRetaining;
       mm.FDTransaction.Commit;

       try
         dm_rc.rc_ShowSweetAlert( 'Ok', 'Dados Gravados com SUCESSO!' , 'success');
         pgBaseCadControl.ActivePage := tabSearch;
       except
         dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', 'Não Consegui gravar, chame o SUPORTE!' , 'error');
       end;

     End;

  if  sqlSearchMaster.Active then
    sqlSearchMaster.Refresh;

  if  sqlSearchMaster.IsEmpty then
   SetBut(tpListaVazia)
  Else
   SetBut(tpListacomRegistros);
end;

PRocedure TfrmCADprotocolo.btnSearchClick(Sender: TObject);
begin
  inherited;
  ativabusca();
end;

procedure TfrmCADprotocolo.btnSearchCRUDClick(Sender: TObject);
var M_SQL       : string;
    M_STR       : TStringList;
    R           : Integer;
    M_ATIVO     : string;
    M_TIPOBUSCA : string;
begin
  inherited;

  M_STR:=Explode('LOTE;NOMEPESSOA;NUMEROIR;BOLETIM;AMOSTRA',';');

  case UniComboBoxCRUDstatus.ItemIndex of
    0 : M_TIPOBUSCA := ' AND SITUACAO = ' + QuotedStr('Aberto');
    1 : M_TIPOBUSCA := ' AND SITUACAO = ' + QuotedStr('Andamento');
    2 : M_TIPOBUSCA := ' AND SITUACAO = ' + QuotedStr('Fechada');
    3 : M_TIPOBUSCA := ' AND SITUACAO = ' + QuotedStr('Fechada') + ' AND BOLETIM IS NULL AND NUMEROIR IS NULL ';
    4 : M_TIPOBUSCA := '';
  end;

  // VOLTAR
  {
  if UniComboBoxCRUDstatus.ItemIndex = 2 then
    begin
      M_SQL := ' SELECT * FROM PROTOCOLO WHERE EMPRESA = ' + IntToStr(mm.varI_Code_Company) + M_TIPOBUSCA  +
               ' AND                                     ' + M_STR[UniComboBoxCRUDordem.ItemIndex] +
               ' LIKE                                    ' + QuotedStr('%'+cbxSearchCRUDField1.Text+'%') + M_TIPOBUSCA +
               ' AND extract(year from DATAEMISSAO   ) = ' + QuotedStr(UniComboBoxCRUDano.Text)       +
               ' AND extract(month from DATAEMISSAO  ) = ' + QuotedStr(cbxSearchCRUDmes.Text)       +
               ' ORDER BY                                ' + M_STR[UniComboBoxCRUDordem.ItemIndex]    + ', DATARECEBIMENTO desc';
    end
  else
  if UniComboBoxCRUDstatus.ItemIndex = 3 then
    begin
      M_SQL := ' SELECT * FROM PROTOCOLO WHERE EMPRESA = ' + IntToStr(mm.varI_Code_Company) + M_TIPOBUSCA  +
               ' ORDER BY                                ' + M_STR[UniComboBoxCRUDordem.ItemIndex]    + ', DATARECEBIMENTO desc';
    end
  else
    begin
      M_SQL:=' SELECT * FROM  PROTOCOLO                '                                                +
             ' WHERE                                   ' + M_STR[UniComboBoxCRUDordem.ItemIndex]        +
             ' LIKE                                    ' + QuotedStr('%'+edSearchCRUDconteudo.Text+'%') + M_TIPOBUSCA +
//             ' AND extract(year from DATAEMISSAO   ) = ' + QuotedStr(UniComboBoxCRUDano.Text)           +
//             ' AND extract(month from DATAEMISSAO  ) = ' + QuotedStr(cbxSearchCRUDmes.Text)             +
             ' ORDER BY      amostra desc';
    end;
  }

  sqlSearchMaster.Close;
  sqlSearchMaster.sql.Clear;
  sqlSearchMaster.SQL.Text := M_SQL;
  sqlSearchMaster.Open;

  if sqlSearchMaster.RecordCount > 0 then
    SetBut(tpListacomRegistros)
  else
    SetBut(tpListaVazia);
end;

function TfrmCADprotocolo.CamposValidados: Boolean;
var
  i,e :Integer;
  Campos :TStrings;
begin
  Try
    Campos := TStringList.Create;
    Campos.Clear ;
    e := 0 ;
    for I:= 0 to ComponentCount -1 do
       begin
         if ( Components[I] is TUniDBEdit )  then
            begin

               If ( TUniDBEdit(Components[i]).Tag = 1 ) then
                 Begin
                   if TUniDBEdit(Components[i]).Text = '' then
                      begin
                        Campos.Add('-' + TUniDBEdit(Components[i]).Field.DisplayName ) ;
                        inc(e) ;
                      end;
                 End;
            end;
       end;

     if e = 0  then
        result := true ;

     If e > 0 then
        Begin
           Campos.Insert(0,'Preencha os campos obrigatórios:');
           dm_rc.rc_ShowSweetAlert( 'ATENÇÃO', Campos.Text, 'warning');
           sqlMaster.Fields[e].FocusControl ;
           result := false ;
        end
     Else
       result := true;

  finally
    Campos.Free;
  end;

end;

procedure TfrmCADprotocolo.CarregaCategoria;
begin

  cbxdbcategoria.Clear;
  SqlPesquisa('select descricao from categoria where ativo = '+QuotedStr('T')+' order by codigo');
  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      cbxdbcategoria.Items.Add(dm_rc.sqlBuscas.FindField('DESCRICAO').AsString);
      dm_rc.sqlBuscas.Next;
    end;

end;

procedure TfrmCADprotocolo.Carregapeneira;
begin
  cbxdbpeneira.Clear;
  SqlPesquisa('select descricao from peneira where ativo = '+QuotedStr('T')+' order by codigo');
  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      cbxdbpeneira.Items.Add(dm_rc.sqlBuscas.FindField('DESCRICAO').AsString);
      dm_rc.sqlBuscas.Next;
    end;
end;

procedure TfrmCADprotocolo.dbgSearchCRUDCellClick(Column: TUniDBGridColumn);
begin
  inherited;
  if Column.FieldName = 'CODIGO' then
    begin
      transfere;
    end;
end;

procedure TfrmCADprotocolo.dbgSearchCRUDDblClick(Sender: TObject);
begin
  transfere;
end;

procedure TfrmCADprotocolo.sqlSearchMasterCODIGOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      Text := '<i title="detalhes" class="fa fa-lg fas fa fa-folder-open"; style="color:green; cursor:pointer;"></i>';;
    end;
end;

procedure TfrmCADprotocolo.sqlSearchMasterSITUACAOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  if DisplayText then
    begin
      if sqlSearchMasterSITUACAO.AsString = 'Aberto' then
        Text := '<span class="badge badge-warning">Aberto</span>'
      else
      if sqlSearchMasterSITUACAO.AsString = 'Fechada' then
        Text := '<span class="badge badge-success">Fechada</span>'
      else
      if sqlSearchMasterSITUACAO.AsString = 'Andamento' then
        Text := '<span class="badge badge-info">Andamento</span>'
      else
        Text := '<span class="badge badge-primary">Confirmação</span>';
    end;
end;

procedure TfrmCADprotocolo.SetBut(Acao: TAcaoCrud);
var s:string ;
begin
  s := GetEnumName(TypeInfo(TAcaoCrud),integer(Acao));

  // Controle dos botoes
  if acao in [tpIncluir,tpAlterar,tpExcluir] then
     begin
       btnNewReg.Visible     := false;
       btnEditReg.Visible    := false;
       btnDeleteReg.Visible  := false;
       btnCancelReg.Visible  := true;
       btnSaveReg.Visible    := true;
     end
   else if acao in [tpListaVazia] then
      begin
        btnNewReg.Visible     := true;
        btnEditReg.Visible    := false;
        btnDeleteReg.Visible  := false;
        btnCancelReg.Visible  := false;
        btnSaveReg.Visible    := false;
      end
    else if acao in [tpListacomRegistros] then
      begin
        btnNewReg.Visible     := true;
        btnEditReg.Visible    := true;
        btnDeleteReg.Visible  := true;
        btnCancelReg.Visible  := false;
        btnSaveReg.Visible    := false;
       end;
end;

procedure TfrmCADprotocolo.transfere;
  var i : integer; Cmp:String;
begin
  pgBaseCadControl.ActivePage := tabRegister;

  try
    CarregaCategoria();
    sqlMaster.Close ;
    for i := 0 to  sqlMaster.Params.Count - 1 do
    begin
      Cmp :=  sqlMaster.Params[i].Name;
       sqlMaster.Params[i].Value :=  sqlSearchMaster.FieldbyName(Cmp).Value;
    end;
     sqlMaster.Open;
  Except
     sqlMaster.Params[0].AsInteger := -1 ;
     sqlMaster.Open;
  End;

  if not( sqlMaster.Active) then
    begin
      sqlMaster.Open;
    end;

  pgBaseCadControl.ActivePage := tabRegister;

end;

procedure TfrmCADprotocolo.UniButtonDbEdit1ButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('CULTIVAR');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       sqlMaster.Edit;
       sqlMaster.FindField('CULTIVAR_CODIGO').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmCADprotocolo.UniButtonDbEdit1Exit(Sender: TObject);
begin
  inherited;
  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    begin
      sqlMaster.FindField('CULTIVAR').AsString := Acha_Item('CULTIVAR',IntToStr(sqlMaster.FindField('CULTIVAR_CODIGO').AsInteger));
    end;
end;

procedure TfrmCADprotocolo.UniButtonDbEdit2ButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('PESSOAS');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       sqlMaster.Edit;
       sqlMaster.FindField('PESSOA').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmCADprotocolo.UniButtonDbEdit2Exit(Sender: TObject);
begin
  inherited;
  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    begin
      SqlPesquisa('select nome, cpfcnpj, ibge, cidade, estado from pessoas where codigo = ' + IntToStr(sqlMaster.FindField('PESSOA').AsInteger));

      sqlMaster.Edit;
      sqlMaster.FindField('NOMEPESSOA').AsString         := dm_rc.sqlBuscas.FindField('nome').AsString;
      sqlMaster.FindField('CPFCNPJ').AsString            := dm_rc.sqlBuscas.FindField('cpfcnpj').AsString;
      sqlMaster.FindField('ESTADO').AsString             := dm_rc.sqlBuscas.FindField('estado').AsString;

      sqlMaster.FindField('SIGLA_PROCEDENCIA').AsString  := dm_rc.sqlBuscas.FindField('ibge').AsString;
      sqlMaster.FindField('CIDADE_PROCEDENCIA').AsString := dm_rc.sqlBuscas.FindField('cidade').AsString;
      sqlMaster.FindField('ESTADO_PROCEDENCIA').AsString := dm_rc.sqlBuscas.FindField('estado').AsString;
    end;
end;

procedure TfrmCADprotocolo.UniButtonDbEdit3ButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('CIDADES');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       sqlMaster.Edit;
       sqlMaster.FindField('SIGLA_PROCEDENCIA').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmCADprotocolo.UniButtonDbEdit3Exit(Sender: TObject);
begin
  inherited;
  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    begin
      SqlPesquisa('select descricao,uf, CODIIBGE from cidades where CODIIBGE = ' + IntToStr(sqlMaster.FindField('SIGLA_PROCEDENCIA').AsInteger));

      sqlMaster.Edit;
      sqlMaster.FindField('CIDADE_PROCEDENCIA').AsString := dm_rc.sqlBuscas.FindField('descricao').AsString;
      sqlMaster.FindField('ESTADO_PROCEDENCIA').AsString := dm_rc.sqlBuscas.FindField('uf').AsString;
    end;
end;

procedure TfrmCADprotocolo.UniButtonDbEdit4ButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('RESPONSAVEL');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       sqlMaster.Edit;
       sqlMaster.FindField('RESPONSAVEL').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmCADprotocolo.UniButtonDbEdit7ButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('RESPONSAVEL');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       sqlMaster.Edit;
       sqlMaster.FindField('RTEMPRESA').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmCADprotocolo.UniButtonDbEdit7Exit(Sender: TObject);
begin
  inherited;
  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    begin
      sqlMaster.Edit;
      sqlMaster.FindField('RTNOME').AsString         := Acha_Item('RESPONSAVEL',sqlMaster.FindField('RTEMPRESA').AsString);
    end;
end;

procedure TfrmCADprotocolo.UniButtonDbEditCEPPButtonClick(Sender: TObject);
begin
  inherited;
  mm.Seta_Busca('ESPECIE');
  UniFfrmPesquisa.ShowModal(
  procedure(Sender: TComponent; AResult: Integer)
   begin
     if AResult = mrOK then
     begin
       sqlMaster.Edit;
       sqlMaster.FindField('ESPECIE_CODIGO').AsInteger := StrToInt(MM.varC_codigo_busca);
     end;
   end);
end;

procedure TfrmCADprotocolo.UniButtonDbEditCEPPExit(Sender: TObject);
begin
  inherited;
  if ( dsMaster.State in [dsEdit, dsInsert ] ) then
    begin
      sqlMaster.FindField('ESPECIE').AsString := Acha_Item('ESPECIE',IntToStr(sqlMaster.FindField('ESPECIE_CODIGO').AsInteger));
    end;
end;

procedure TfrmCADprotocolo.UniFrameCreate(Sender: TObject);
var
  ano : string;
  mes : integer;
begin
  inherited;

  ano                             := FormatDateTime('YYYY',date);
  mes                             := StrToInt(FormatDateTime('MM',date));

  UniComboBoxCRUDordem.ItemIndex  := 4;
  UniComboBoxCRUDstatus.ItemIndex := 0;
// VOLTAR
//  UniComboBoxCRUDano.Text         := ano;
//  cbxSearchCRUDmes.ItemIndex      := mes-1;

  ativabusca();
  btnSearchCRUD.OnClick(Self);
end;

initialization
  RegisterClass(TfrmCADprotocolo);
end.