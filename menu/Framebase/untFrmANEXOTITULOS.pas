unit untFrmANEXOTITULOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniPanel;

type
  TfrmCADANEXOTITULOS = class(TUniForm)
    rcBlock10: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniBitBtn1: TUniBitBtn;
    UniContainerPanel1: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    UniDBGridAnexo: TUniDBGrid;
    UniContainerPanel2: TUniContainerPanel;
    UniBitBtn2: TUniBitBtn;
    procedure UniBitBtn1Click(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniDBGridAnexoCellClick(Column: TUniDBGridColumn);
    procedure UniBitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  procedure carregaplano(rplano:string);
  end;

function frmCADANEXOTITULOS: TfrmCADANEXOTITULOS;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untDM_RC, mkm_func_web, mkm_procedures,
  untFrmPesquisa;

function frmCADANEXOTITULOS: TfrmCADANEXOTITULOS;
begin
  Result := TfrmCADANEXOTITULOS(mm.GetFormInstance(TfrmCADANEXOTITULOS));
end;

procedure TfrmCADANEXOTITULOS.carregaplano(rplano: string);
begin
  dm_rc.tbanexotitulos.FindField('PLANO').AsString     := rplano;
  dm_rc.tbanexotitulos.FindField('DESCRICAO').AsString := Acha_Item('PLANOCONTAS',rplano);
end;

procedure TfrmCADANEXOTITULOS.UniBitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmCADANEXOTITULOS.UniBitBtn2Click(Sender: TObject);
var
  msql:string;
begin
  msql :=
         ' SELECT * from  sub_planocontas spc ' +
         ' where spc.mestre_id =              ' + QuotedStr(mm.varcI_code_planosub) +
         ' order by spc.sequencia asc         ';

 if SqlPesquisa(msql) then
   begin
     dm_rc.sqlBuscas.First;
     while not dm_rc.sqlBuscas.eof do
       begin
         dm_rc.tbanexotitulos.insert;
         dm_rc.tbanexotitulosPLANO.AsString     := dm_rc.sqlBuscas.FindField('MESTRE_ID').AsString;
         dm_rc.tbanexotitulosSUBPLANO.AsString  := dm_rc.sqlBuscas.FindField('SEQUENCIA').AsString;
         dm_rc.tbanexotitulosDESCRICAO.AsString := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
         dm_rc.tbanexotitulos.Post;

         dm_rc.sqlBuscas.Next;
       end;
     dm_rc.sqlBuscas.First;
   end;
end;

procedure TfrmCADANEXOTITULOS.UniDBGridAnexoCellClick(Column: TUniDBGridColumn);
begin
  if Column.FieldName = 'busca' then
    begin
      MM.Seta_Busca('PLANOCONTAS');
      UniFfrmPesquisa.showmodal(
      procedure(Sender: TComponent; AResult: Integer)
       begin
         if AResult = mrOK then
         begin
           DM_RC.tbanexotitulos.Edit;
           carregaplano(MM.varC_codigo_busca);
         end;
       end);
    end;

  if Column.FieldName = 'exclui' then
    begin
      dm_rc.tbanexotitulos.Delete;
    end;
end;

procedure TfrmCADANEXOTITULOS.UniFormDestroy(Sender: TObject);
begin
  mm.varC_Form_Modal := nil;
end;

procedure TfrmCADANEXOTITULOS.UniFormReady(Sender: TObject);
begin
  Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
  dm_rc.rc_ResizeBlocks( Self, true, true );
end;

procedure TfrmCADANEXOTITULOS.UniFormResize(Sender: TObject);
begin
  frmCADANEXOTITULOS.Height   := 372;
  frmCADANEXOTITULOS.Width    := 563;

  with frmCADANEXOTITULOS.Constraints do
    begin
      MaxWidth  := 563;
      MinWidth  := 563;
      MaxHeight := 372;
      MinHeight := 372;
    end;

  frmCADANEXOTITULOS.Position := poScreenCenter;
end;

procedure TfrmCADANEXOTITULOS.UniFormShow(Sender: TObject);
var
  R, S : integer;
begin
  R := 1;

  for R := S to S + 50 do
  begin
    dm_rc.tbanexotitulos.Append;
    dm_rc.tbanexotitulos.Post;
  end;
  dm_rc.tbanexotitulos.First;

  UniDBGridAnexo.Options          := UniDBGridAnexo.Options - [dgRowSelect];
  UniDBGridAnexo.Options          := UniDBGridAnexo.Options + [dgEditing];
end;

end.
