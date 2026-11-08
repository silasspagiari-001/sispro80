unit untfrmPesquisalote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniLabel, uniGUIBaseClasses, uniPanel, uniEdit,
  uniMultiItem, uniComboBox, uniButton, uniBitBtn, uniBasicGrid, uniDBGrid,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniTimer;

type
  Tfrmpesquisalote = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    rcBlock60: TUniContainerPanel;
    labTotReg: TUniLabel;
    UniLabelv1: TUniLabel;
    edSearchCRUDconteudo: TUniEdit;
    cbxSearchCRUDFieldordem: TUniComboBox;
    UniComboBoxestoque: TUniComboBox;
    btnLkpSearch: TUniBitBtn;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    dbgSearchCRUD: TUniDBGrid;
    UniDBGridLOTE: TUniDBGrid;
    tblote: TFDMemTable;
    dslote: TDataSource;
    tblotePRODUTO: TIntegerField;
    tbloteNOME: TStringField;
    tbloteLOTE: TStringField;
    tbloteBOLETIM: TStringField;
    tbloteDISPONIVEL: TFloatField;
    tbloteSACOSQTE: TFloatField;
    tbloteTERMO: TStringField;
    timerClose: TUniTimer;
    tbloteCULTIVAR: TStringField;
    tblotePESOEMBALAGEM: TFloatField;
    tbloteCODIGO: TIntegerField;
    UniContainerPanel1: TUniContainerPanel;
    UniComboBoxstatus: TUniComboBox;
    UniLabel3: TUniLabel;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure btnLkpSearchClick(Sender: TObject);
    procedure UniDBGridLOTEDblClick(Sender: TObject);
    procedure timerCloseTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cMSG_BUGERROR_RECORDS_SELECTION,
    cMSG_RECORDS_FOUND : string ;
    cFormModal         : TUniForm;    { Public declarations }
  end;

function frmpesquisalote: Tfrmpesquisalote;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, mkm_anim, uconsts, mkm_funcoes,
  mkm_func_web, Vcl.Clipbrd;

var
  M_STR   : TStringList;

function frmpesquisalote: Tfrmpesquisalote;
begin
  Result := Tfrmpesquisalote(mm.GetFormInstance(Tfrmpesquisalote));
end;

procedure Tfrmpesquisalote.btnLkpSearchClick(Sender: TObject);
var
  M_SQL, M_ESTOQUE,M_ATIVO : string;
begin
  M_STR:= Explode('CODIGO;LOTE;BOLETIM;TERMO;PRODUTO',';');

  case UniComboBoxstatus.ItemIndex of
    0 : M_ATIVO := ' AND ATIVO = ' + QuotedStr('T');
    1 : M_ATIVO := ' AND ATIVO = ' + QuotedStr('F');
    2 : M_ATIVO := '';
  end;

  case UniComboBoxestoque.ItemIndex of
    0: M_ESTOQUE := ' AND DISPONIVEL > 0 ';  //positivo
    1: M_ESTOQUE := ' AND DISPONIVEL < 0 ';  //negativo
    2: M_ESTOQUE := ' AND DISPONIVEL = 0 ';  //zerado
    3: M_ESTOQUE := '';                      //todos
  end;

  if StrContains('BUSCALOTE#SEMENTES#BENEFICIAMENTO',MM.varC_referencia_busca) then
    begin
      M_SQL:=' SELECT                              ' +
             ' CODIGO,PRODUTO,CULTIVAR,LOTE,BOLETIM,TERMO,coalesce(PESOEMBALAGEM,0) AS PESOEMBALAGEM, coalesce(DISPONIVEL,0) AS DISPONIVEL ' +
             ' FROM                                ' + 'SEMENTES'                                 +
             ' WHERE                               ' + M_STR[cbxSearchCRUDFieldordem.ItemIndex]   +
             ' starting with                       ' + QuotedStr(edSearchCRUDconteudo.Text)       +  M_ESTOQUE + M_ATIVO +
             ' ORDER BY                            ' + M_STR[cbxSearchCRUDFieldordem.ItemIndex];
    end;

  dm_rc.sqlPesquisa.Close;
  dm_rc.sqlPesquisa.SQL.Clear;
  dm_rc.sqlPesquisa.sql.add(M_SQL);
  dm_rc.sqlPesquisa.Open;

  tblote.Close;
  tblote.Open;
  if dm_rc.sqlpesquisa.RecordCount > 0 then
    begin
      dm_rc.sqlpesquisa.First;
      while not dm_rc.sqlpesquisa.Eof do
        begin
          tblote.Append;
          tbloteCODIGO.AsInteger      := dm_rc.sqlpesquisa.FindField('CODIGO').AsInteger;
          tblotePRODUTO.AsInteger     := dm_rc.sqlpesquisa.FindField('PRODUTO').AsInteger;
          tbloteCULTIVAR.AsString     := dm_rc.sqlpesquisa.FindField('CULTIVAR').AsString;
          tbloteLOTE.AsString         := dm_rc.sqlpesquisa.FindField('LOTE').AsString;
          tbloteBOLETIM.AsString      := dm_rc.sqlpesquisa.FindField('BOLETIM').AsString;
          tbloteTERMO.AsString        := dm_rc.sqlpesquisa.FindField('TERMO').AsString;

          tblotePESOEMBALAGEM.AsFloat := dm_rc.sqlpesquisa.FindField('PESOEMBALAGEM').AsFloat;
          tbloteDISPONIVEL.AsFloat    := dm_rc.sqlpesquisa.FindField('DISPONIVEL').AsFloat;

          if tbloteDISPONIVEL.AsFloat > 0 then
            tbloteSACOSQTE.AsFloat :=  dm_rc.sqlpesquisa.FindField('DISPONIVEL').AsFloat / dm_rc.sqlpesquisa.FindField('PESOEMBALAGEM').AsFloat
          else
            tbloteSACOSQTE.AsFloat := 0;

          tblote.Post;

          dm_rc.sqlpesquisa.Next;
        end;
      tblote.First;
    end;

  labTotReg.Caption := IntToStr(dm_rc.sqlpesquisa.RecordCount) + ' Registro(s) Encontrado(s).'
end;

procedure Tfrmpesquisalote.timerCloseTimer(Sender: TObject);
begin
  mm.varC_Form_Modal := cFormModal ;
  timerClose.Enabled := false;
  close;
end;

procedure Tfrmpesquisalote.UniDBGridLOTEDblClick(Sender: TObject);
begin
  if StrContains('BUSCALOTE#SEMENTES',MM.varC_referencia_busca) then
    begin
      if tblote.FindField('LOTE').AsString <> '' then
        begin
          mm.varC_codigo_busca_lote := tblote.FindField('LOTE').AsString;
        end;
    end
  else
  if StrContains('BENEFICIAMENTO',MM.varC_referencia_busca) then
    mm.varC_codigo_busca_lote := tblote.FindField('CODIGO').AsString;


  ModalResult := mrOK;

  dm_rc.sqlpesquisa.Close;
  timerClose.Enabled := true;
  rc_MoveAnimationForm( self,
                       self.left,
                       self.left,
                       self.top,
                       -self.Height,
                       400,
                       0 ) ;
end;

procedure Tfrmpesquisalote.UniFormCreate(Sender: TObject);
var
   i : integer;
begin
  // sort
  dbgSearchCRUD.ClientEvents.UniEvents.Add(
       'store.afterCreate=function store.afterCreate(sender)' +
       '{ sender.setRemoteSort(false);﻿ }'
  );
  // translate messages
  case mm.varLT_Lang of

       ltpt_BR : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Falha na seleção do registro( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := ' registro(s) localizado(s)';
                 end;
       lten_US   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                 end;
       ltes_ES   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION :='Falló la selección del registro de búsqueda (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' registro(s) encontrado ';
                 end;
       ltfr_FR   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'La sélection de l''enregistrement a échoué ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'enregistrement(s) trouvé(s)';
                 end;
       ltde_DE   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Datensatzauswahl fehlgeschlagen ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'Datensatz(e) gefunden';
                 end;
       ltit_IT   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Selezione record fallita ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'record(s) trovati';
                 end;
       lttr_TR    : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Kayıt seçimi başarısız( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'kayıt(lar) bulundu';
                 end;
       ltru_RU    : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Ошибка выбора записи поиска (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := 'найдены записи';
                 end;
       ltzn_CH : begin

                 end;
       ltin_ID : begin

                 end;
       ltth_TH : begin

                 end;
       lthi_IN : begin

                 end;
       ltar_SA    : begin

                 end;
  end;

  cFormModal := mm.varC_Form_Modal;
  dbgSearchCRUD.Columns.Clear;

  if StrContains('SEMENTES#BUSCALOTE#BENEFICIAMENTO',mm.varC_referencia_busca) then
  begin
    cbxSearchCRUDFieldordem.Clear;
    cbxSearchCRUDFieldordem.Items.Add('Codigo');
    cbxSearchCRUDFieldordem.Items.Add('Lote');
    cbxSearchCRUDFieldordem.Items.Add('Boletim');
    cbxSearchCRUDFieldordem.Items.Add('Termo');
    cbxSearchCRUDFieldordem.Items.Add('Produto');
    cbxSearchCRUDFieldordem.ItemIndex := 1;

    UniComboBoxestoque.Clear;
    UniComboBoxestoque.Items.Add('Positivo');
    UniComboBoxestoque.Items.Add('Negativo');
    UniComboBoxestoque.Items.Add('Zerado');
    UniComboBoxestoque.Items.Add('Todos');
    UniComboBoxestoque.ItemIndex := 0;

    UniComboBoxstatus.Clear;
    UniComboBoxstatus.Items.Add('Ativo');
    UniComboBoxstatus.Items.Add('Inativo');
    UniComboBoxstatus.Items.Add('Todos');
    UniComboBoxstatus.ItemIndex := 0;


    if MM.varC_referencia_busca = 'BUSCALOTE' then
      begin
        cbxSearchCRUDFieldordem.ItemIndex := 4;
        UniComboBoxestoque.ItemIndex      := 0;
        edSearchCRUDconteudo.Text         := MM.varC_referencia_produto;
      end;

    if MM.varC_referencia_busca = 'BENEFICIAMENTO' then
      begin
        cbxSearchCRUDFieldordem.ItemIndex := 4;
        UniComboBoxestoque.ItemIndex      := 2;
        edSearchCRUDconteudo.Text         := MM.varC_referencia_produto;
      end;
  end;

  if StrContains('BUSCALOTE#BENEFICIAMENTO',mm.varC_referencia_busca) then
    btnLkpSearch.OnClick(self);
end;

procedure Tfrmpesquisalote.UniFormDestroy(Sender: TObject);
begin
  dm_rc.sqlPesquisa.Close;
  mm.varC_Form_Modal := nil;
end;

procedure Tfrmpesquisalote.UniFormReady(Sender: TObject);
begin
     Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;

procedure Tfrmpesquisalote.UniFormShow(Sender: TObject);
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
