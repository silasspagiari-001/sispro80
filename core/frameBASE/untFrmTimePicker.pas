unit untFrmTimePicker; //8.5.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniBasicGrid, uniSpeedButton, uniDBEdit,
  uniDBGrid, uniEdit, uniLabel, Data.DB,
  uniButton, uniBitBtn, uniTimer;

type
  TfrmTimePicker = class(TUniForm)
    paBackground: TUniContainerPanel;
    timerClose: TUniTimer;
    ed_Lkp: TUniEdit;
    paBGForm: TUniContainerPanel;
    paBG: TUniContainerPanel;
    edHour: TUniEdit;
    edMin: TUniEdit;
    labDot: TUniLabel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    btnConfirm: TUniBitBtn;
    btnCloseForm: TUniBitBtn;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    procedure UniFormShow(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCloseFormClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure timerCloseTimer(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure btnConfirmClick(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure paBGFormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure UniLabel1Click(Sender: TObject);
    procedure UniLabel3Click(Sender: TObject);
    procedure UniLabel4Click(Sender: TObject);
    procedure UniLabel2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    cMSG_BUGERROR_RECORDS_SELECTION,
    cMSG_RECORDS_FOUND : string ;

    cFormModal : TUniForm;

  end;


function frmTimePicker: TfrmTimePicker;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untdm_rc, str_func,
  uconsts, uconsts_cfg, mkm_layout, mkm_func_web, Main;

function frmTimePicker: TfrmTimePicker;
begin
  Result := TfrmTimePicker(mm.GetFormInstance(TfrmTimePicker));
end;
// para evitar conflito com "_onFocus"
// 6.0.0.0
procedure TfrmTimePicker.paBGFormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     if not ( ( ( x >= paBG.Left ) and ( x <= paBG.Left + paBG.Width ) ) and
          ( ( y >= paBG.Top ) and ( y <= paBG.Top + paBG.Height ) ) ) then
        btnCloseFormClick( self );
end;

procedure TfrmTimePicker.timerCloseTimer(Sender: TObject);
begin
     mm.varC_Form_Modal := cFormModal ;
     timerClose.Enabled := false;
     close;
end;

procedure TfrmTimePicker.btnCloseFormClick(Sender: TObject);
begin
     mm.varC_TempString := '';
     Close;
end;

procedure TfrmTimePicker.btnConfirmClick(Sender: TObject);
var
   oForm : TObject;
begin
     mm.varC_TempString := Zeros( edHour.Text, 2 ) + Zeros( edMin.Text, 2 );
     if mm.Active_Component <> nil then
     begin
        if mm.Active_Component is TUniEdit then
           TUniEdit(mm.Active_Component).Text := mm.varC_TempString
        else
        if mm.Active_Component is TUniDBEdit then
        begin
             if ( TUniDBEdit(mm.Active_Component).DataSource <> nil ) and
                ( TUniDBEdit(mm.Active_Component).DataSource.DataSet <> nil ) and
                ( TUniDBEdit(mm.Active_Component).DataSource.DataSet.State in [dsEdit, dsInsert] ) then
             begin
                if DataTypeIsString( TDataSet( TUniDBEdit(mm.Active_Component).DataSource.DataSet ).FieldByName( TUniDBEdit(mm.Active_Component).DataField ).DataType ) then
                   TDataSet( TUniDBEdit(mm.Active_Component).DataSource.DataSet ).FieldByName( TUniDBEdit(mm.Active_Component).DataField ).AsString := mm.varC_TempString
                else
                if DataTypeIsDateTime( TDataSet( TUniDBEdit(mm.Active_Component).DataSource.DataSet ).FieldByName( TUniDBEdit(mm.Active_Component).DataField ).DataType ) then
                   TDataSet( TUniDBEdit(mm.Active_Component).DataSource.DataSet ).FieldByName( TUniDBEdit(mm.Active_Component).DataField ).AsDateTime := StrToTimeDef( mm.varC_TempString, 0 );
             end;
        end;
        mm.Active_Component := nil;
     end;
     Close;
end;

procedure TfrmTimePicker.UniFormBeforeShow(Sender: TObject);
begin
     rc_RenderLayout( Self, true, true, true, false );
end;
//6.0.0.0
// para evitar conflito com "_onFocus"
procedure TfrmTimePicker.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
//        mm.Active_Component := nil; // 6.0.0.0
end;

procedure TfrmTimePicker.UniFormCreate(Sender: TObject);
begin
  {$IFDEF RELEASE}
  dm_rc.rc_ProtectForm( Self );
  {$ENDIF}

  self.Left := -3000;
  // 6.0.0.0
  //aplica uma sombra na mensagem
  //UniSession.AddJS( Self.Webform.JsName + '.addCls(''shadow-obj-tour'')')  ;
  UniSession.AddJS( paBG.JsName + '.addCls(''shadow-lookup'')')  ;
  UniSession.AddJS( Self.Webform.JsName + '.addCls(''transparent-form-bg'')')  ;
  if mm.CONFIG_LAYOUT_ROUND_FORM = 'ON' then
     rc_AddCssClass( Self, 'form-rounded' )
  else
     rc_AddCssClass( Self, 'form-noborder' );
  rc_AddCssClass( Self, 'form-noborder' );


  // translate messages
  case mm.varLT_Lang of

       ltpt_BR, ltpt_PT : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Falha na seleção do registro( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := ' registro(s) localizado(s)';
                 end;
       lten_US, lten_GB   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                 end;
       ltes_ES   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION :='Falló la selección del registro de búsqueda (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' registro(s) encontrado ';
                   //edSearchCRUD1.EmptyText         := 'buscar contenido';
                 end;
       ltfr_FR   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'La sélection de l''enregistrement a échoué ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'enregistrement(s) trouvé(s)';
                   //edSearchCRUD1.EmptyText         := 'rechercher le contenu';
                 end;
       ltde_DE   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Datensatzauswahl fehlgeschlagen ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'Datensatz(e) gefunden';
                   //edSearchCRUD1.EmptyText         := 'Forschungsinhalt';
                 end;
       ltit_IT   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Selezione record fallita ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'record(s) trovati';
                   //edSearchCRUD1.EmptyText         := 'contenuto della ricerca';
                 end;
       lttr_TR    : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Kayıt seçimi başarısız( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'kayıt(lar) bulundu';
                   //edSearchCRUD1.EmptyText         := 'search content';
                 end;
       ltru_RU    : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Ошибка выбора записи поиска (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := 'найдены записи';
                   //edSearchCRUD1.EmptyText         := 'search content';
                 end;
       ltzn_CH : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                   //edSearchCRUD1.EmptyText         := 'search content';
                 end;
       ltin_ID : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                   //edSearchCRUD1.EmptyText         := 'search content';
                 end;
       ltth_TH : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                   //edSearchCRUD1.EmptyText         := 'search content';
                 end;
       lthi_IN : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                   //edSearchCRUD1.EmptyText         := 'search content';
                 end;
       ltar_SA    : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'فشل اختيار سجل البحث (rc_LookUpSearchLite)';
                   cMSG_RECORDS_FOUND              := ' تم العثور على سجل (سجلات) ';
                   //edSearchCRUD1.EmptyText         := 'search content';
                 end;
  end;
end;

procedure TfrmTimePicker.UniFormDestroy(Sender: TObject);
begin
    // para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no
    // que estiver "abaixo" do MODAL
    mm.varC_Form_Modal := nil;
end;

procedure TfrmTimePicker.UniFormReady(Sender: TObject);
begin
     cFormModal := mm.varC_Form_Modal;
     // uma particularidade do LookUp_Lite
     // o RenderLayout deve ser no FormReady para não perder o FOCO
     //v. v.
     //rc_RenderLayout( Self, false, false, true );
     //dm_rc.rc_ResizeBlocks( Self, true, true );
     //dm_rc.rc_SetFocus( edHour );
end;

procedure TfrmTimePicker.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 27 then
     begin
          mm.varC_TempString := '';
          Close;
     end;
end;

procedure TfrmTimePicker.UniFormShow(Sender: TObject);
begin
  inherited;
     if Self.Tag = 0 then
     begin
         Self.Visible := True;
         paBG.Left := mm.varI_PosX - 2;
         if paBG.Left > mm.varI_ScreenWidth - paBG.Width then
            paBG.Left := mm.varI_ScreenWidth - paBG.Width - 4;
         paBG.Top  := mm.varI_PosY - 3 ;//+ mm.varI_PosH;
         if paBG.Top > mm.varI_ScreenHeight - paBG.Height then
            paBG.Top := mm.varI_ScreenHeight - paBG.Height - 4;
         if paBG.Width < mm.varI_PosW then
            paBG.Width := mm.varI_PosW;
     end
     else
     begin
       Self.Visible := False;
       Self.Top  := -1000;
     end;

     edHour.Text := Copy( TimeToStr( now ), 1, 2 );
     edMin.Text  := Copy( TimeToStr( now ), 4, 2 );

     Self.Visible := True;
end;
procedure TfrmTimePicker.UniLabel1Click(Sender: TObject);
var
   i : integer;
begin
     i := StrToIntDef( edHour.Text, 0 );
     rc_Inc( i , 1, 24 );
     edHour.Text := i.ToString;
end;

procedure TfrmTimePicker.UniLabel2Click(Sender: TObject);
var
   i : integer;
begin
     i := StrToIntDef( edHour.Text, 0 );
     rc_Dec( i , 1, 0 );
     edHour.Text := i.ToString;
end;

procedure TfrmTimePicker.UniLabel3Click(Sender: TObject);
var
   i : integer;
begin
     i := StrToIntDef( edMin.Text, 0 );
     rc_Inc( i , 1, 59 );
     edMin.Text := i.ToString;
end;

procedure TfrmTimePicker.UniLabel4Click(Sender: TObject);
var
   i : integer;
begin
     i := StrToIntDef( edMin.Text, 0 );
     rc_Dec( i , 1, 0 );
     edMin.Text := i.ToString;
end;

end.
