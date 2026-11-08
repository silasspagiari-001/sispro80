unit untFrmPesquisaItensestoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniEdit, uniLabel, uniGUIBaseClasses, uniPanel,
  uniDateTimePicker, UniButtonEdit, uniButton, uniBitBtn, uniMultiItem,
  uniComboBox, uniBasicGrid, uniDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, uniTimer, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tfrmpesquisaitensestoque = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    UniLabelv1: TUniLabel;
    ednumero: TUniEdit;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel1: TUniLabel;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel2: TUniLabel;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel3: TUniLabel;
    UniContainerPanel4: TUniContainerPanel;
    UniLabel4: TUniLabel;
    UniContainerPanel5: TUniContainerPanel;
    edbproduto: TUniButtonEdit;
    edSearchCRUDDtIni: TUniDateTimePicker;
    edSearchCRUDDtfin: TUniDateTimePicker;
    cbxSearchCRUDFieldordem: TUniComboBox;
    btnLkpSearch: TUniBitBtn;
    rcBlock50: TUniContainerPanel;
    UniDBGrid: TUniDBGrid;
    labTotReg: TUniLabel;
    tbdisp: TFDMemTable;
    dsdisp: TDataSource;
    tbdispNUMERO: TStringField;
    tbdispSERIE: TStringField;
    tbdispEMISSAO: TDateField;
    tbdispPRODUTO: TIntegerField;
    tbdispSEQUENCIA: TIntegerField;
    tbdispDESCRICAO: TStringField;
    tbdispQUANTIDADE: TFloatField;
    tbdispDISPONIVEL: TFloatField;
    timerClose: TUniTimer;
    tbdispCODIGO: TIntegerField;
    tbdispmarcado: TStringField;
    UniContainerPanel6: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure timerCloseTimer(Sender: TObject);
    procedure btnLkpSearchClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure UniDBGridDblClick(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniDBGridDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure UniFormBeforeShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cFormModal         : TUniForm;
  end;

function frmpesquisaitensestoque: Tfrmpesquisaitensestoque;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, mkm_anim, mkm_funcoes, mkm_func_web,
  Vcl.Clipbrd,mkm_layout;

function frmpesquisaitensestoque: Tfrmpesquisaitensestoque;
begin
  Result := Tfrmpesquisaitensestoque(mm.GetFormInstance(Tfrmpesquisaitensestoque));
end;

procedure Tfrmpesquisaitensestoque.btnLkpSearchClick(Sender: TObject);
var
  M_SQL : string;
begin
  M_SQL :=
  ' select numero, serie, sequencia, emissao, produto, descricao, coalesce(quantidade,0) as quantidade, coalesce(disponivel,0) as disponivel, codigo from mvitens ' +
  ' where empresa                                                                                           = ' + IntToStr(mm.varI_Code_Company)          +
  ' and   serie                                                                                             = ' + QuotedStr(cbxSearchCRUDFieldordem.Text) +
  variif(ednumero.Text   <> ''  , ' and numero  = ' + QuotedStr(ednumero.Text)  ,'')   +
  variif(edbproduto.Text <> '0' , ' and produto = ' + QuotedStr(edbproduto.Text),'')   +
  ' and emissao between ' + QuotedStr(DataPonto(edSearchCRUDDtIni.Text)) +
  ' and                 ' + QuotedStr(DataPonto(edSearchCRUDDtfin.Text)) +
  ' order by numero desc,sequencia, emissao DESC';

  dm_rc.sqlBuscas.Close;
  dm_rc.sqlBuscas.SQL.Clear;
  dm_rc.sqlBuscas.sql.add(M_SQL);
  dm_rc.sqlBuscas.Open;

  tbdisp.Close;
  tbdisp.Open;
  if dm_rc.sqlBuscas.RecordCount > 0 then
    begin
      dm_rc.sqlBuscas.First;
      while not dm_rc.sqlBuscas.Eof do
        begin
          tbdisp.Append;
          tbdispNUMERO.AsInteger     := dm_rc.sqlBuscas.FindField('NUMERO').AsInteger;
          tbdispSEQUENCIA.AsInteger  := dm_rc.sqlBuscas.FindField('SEQUENCIA').AsInteger;
          tbdispcodigo.AsInteger     := dm_rc.sqlBuscas.FindField('CODIGO').AsInteger;
          tbdispSERIE.AsString       := dm_rc.sqlBuscas.FindField('SERIE').AsString;
          tbdispEMISSAO.AsDateTime   := dm_rc.sqlBuscas.FindField('EMISSAO').AsDateTime;
          tbdispPRODUTO.AsInteger    := dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
          tbdispDESCRICAO.AsString   := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
          tbdispQUANTIDADE.AsFloat   := dm_rc.sqlBuscas.FindField('QUANTIDADE').AsFloat;
          tbdispDISPONIVEL.AsFloat   := dm_rc.sqlBuscas.FindField('DISPONIVEL').AsFloat;
          tbdisp.Post;

          dm_rc.sqlBuscas.Next;
        end;
      tbdisp.First;
    end;

  labTotReg.Caption := IntToStr(dm_rc.sqlBuscas.RecordCount) + ' Registro(s) Encontrado(s).'
end;

procedure Tfrmpesquisaitensestoque.timerCloseTimer(Sender: TObject);
begin
  mm.varC_Form_Modal := cFormModal ;
  timerClose.Enabled := false;
  close;
end;

procedure Tfrmpesquisaitensestoque.UniBitBtn1Click(Sender: TObject);
begin
  if mm.VarC_Atelagenerica  = 'CARREGANOTAROMANEIO' then
    begin
      tbdisp.DisableControls;
      tbdisp.First;
      while not tbdisp.Eof do
        begin
          if tbdispmarcado.AsString = 'T' then
            mm.varT_notasromaneio.add(tbdispCODIGO.AsString);

          tbdisp.Next;
        end;

      tbdisp.First;
      tbdisp.EnableControls;
    end;

  ModalResult := mrOK;
end;

procedure Tfrmpesquisaitensestoque.UniDBGridDblClick(Sender: TObject);
begin
  if mm.VarC_Atelagenerica  = 'CARREGANOTAROMANEIO' then
    begin
      tbdisp.Edit;
      if tbdisp.FindField('marcado').AsString = 'T' then tbdisp.FindField('marcado').AsString := 'F'  else
        tbdisp.FindField('marcado').AsString := 'T';
      tbdisp.Post;
    end
  else
    begin
      mm.varC_codigo_busca := IntToStr(tbdisp.FindField('CODIGO').AsInteger);
      ModalResult := mrOK;

      dm_rc.sqlBuscas.Close;
      timerClose.Enabled := true;
      rc_MoveAnimationForm( self,
                           self.left,
                           self.left,
                           self.top,
                           -self.Height,
                           400,
                           0 ) ;
    end;

end;

procedure Tfrmpesquisaitensestoque.UniDBGridDrawColumnCell(Sender: TObject;
  ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
  if tbdispmarcado.AsString = 'T' then
    Attribs.Color := $00D2AAF0;
end;

procedure Tfrmpesquisaitensestoque.UniFormCreate(Sender: TObject);
begin
  cbxSearchCRUDFieldordem.ItemIndex := 0;
  edSearchCRUDDtfin.DateTime        := Date;
end;

procedure Tfrmpesquisaitensestoque.UniFormDestroy(Sender: TObject);
begin
  dm_rc.sqlBuscas.Close;
  mm.varC_Form_Modal := nil;
end;

procedure Tfrmpesquisaitensestoque.UniFormReady(Sender: TObject);
begin
     Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
end;

procedure Tfrmpesquisaitensestoque.UniFormBeforeShow(Sender: TObject);
begin
  rc_RenderLayout( Self, true, true, true );
end;

procedure Tfrmpesquisaitensestoque.UniFormShow(Sender: TObject);
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

//  mm.varT_notasromaneio.Clear;
end;

end.
