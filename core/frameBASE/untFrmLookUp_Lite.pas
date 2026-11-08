unit untFrmLookUp_Lite; //8.2.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniBasicGrid, uniSpeedButton, uniDBEdit,
  uniDBGrid, uniEdit, uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniButton, uniBitBtn, uniTimer;

type
  TfrmLookUp_Lite = class(TUniForm)
    paBackground: TUniContainerPanel;
    paPesquisa: TUniContainerPanel;
    dbgSearchCRUDLookUpLite: TUniDBGrid;
    paSearchContent1: TUniContainerPanel;
    edSearchCRUD1: TUniEdit;
    labTotReg: TUniLabel;
    btnLkpSearch: TUniBitBtn;
    btnCloseForm: TUniBitBtn;
    timerClose: TUniTimer;
    ed_PK: TUniEdit;
    btnClearLookup: TUniBitBtn;
    ed_Lkp: TUniEdit;
    paBGFormLookUp: TUniContainerPanel;
    paBGLookUp: TUniContainerPanel;
    procedure dbgSearchCRUDLookUpLiteDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure btnLkpSearchClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure dbgSearchCRUDLookUpLiteDblClick(Sender: TObject);
    procedure edSearchCRUD1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCloseFormClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure timerCloseTimer(Sender: TObject);
    procedure dbgSearchCRUDLookUpLiteColumnSort(Column: TUniDBGridColumn;
      Direction: Boolean);
    procedure edSearchCRUD1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edSearchCRUD1Exit(Sender: TObject);
    procedure dbgSearchCRUDLookUpLiteCellClick(Column: TUniDBGridColumn);
    procedure dbgSearchCRUDLookUpLiteExit(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure btnClearLookupClick(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure edSearchCRUD1Enter(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
    procedure paBGFormLookUpMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }

    cMSG_BUGERROR_RECORDS_SELECTION,
    cMSG_RECORDS_FOUND : string ;

    cFormModal : TUniForm;

    procedure SelectRecordInGrid;
  end;


function frmLookUp_Lite: TfrmLookUp_Lite;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untdm_rc, str_func,
  uconsts, uconsts_cfg, mkm_layout, mkm_func_web, Main;

function frmLookUp_Lite: TfrmLookUp_Lite;
begin
  Result := TfrmLookUp_Lite(mm.GetFormInstance(TfrmLookUp_Lite));
end;
// 6.0.0.0 multi search
procedure TfrmLookUp_Lite.btnLkpSearchClick(Sender: TObject);
var
   cTemp,
   cWhereAnd,
   cSearchFieldList,
   cSearchFieldListSQL,
   cSqlWhere ,
   cSqlWherePesqExtra,
   cSqlOrder, cField, cFieldAlias : String;
   i, iCount : integer; 
begin
     // essas GLOBAIS sao informadas na chamada do LOOKUP
     // pois pode haver pesquisas com FILTROS pré-estabelecidos...
     cSqlWhere               := mm.varC_Where;
     cSqlOrder               := mm.varC_Order;
     cSqlWherePesqExtra      := mm.varC_WhereExtra ;
     // caso tenha vindo de um edLKP____PesqExtra, limpa a variavel
     mm.varC_WhereExtra := '';
     if Pos( ' searchall', ed_Lkp.Hint ) = 0 then
     begin
        cSearchFieldList    := ReverseStr( mm.varC_Search_Fields );
        cSearchFieldList    := Trim( Copy( cSearchFieldList , Pos( ';', cSearchFieldList ) , 2000 ) );
        cSearchFieldList    := ReverseStr( cSearchFieldList );
     end
     else
        cSearchFieldList    := Trim( mm.varC_Search_Fields ) + ';';

     cSearchFieldListSQL := '';
     // criar lista de pesquisa
     cSearchFieldListSQL := '';
     if edSearchCRUD1.Text <> '' then
     begin
        if btnLkpSearch.Tag = 0 then
        begin
           btnLkpSearch.Tag := 1;
           dm_rc.sqlLookUpSearch.Close;
           dm_rc.sqlLookUpSearch.sql.Text := mm.varC_SQL_Default_LookUps + ' Where 1<>1';
           // sugestão para evitar erro com caracteries especiais - Flavio / Osmar 24 05 21
           dm_rc.sqlLookUpSearch.sql.Text := StrTokenClearSql ( dm_rc.sqlLookUpSearch.sql.Text );
           dm_rc.rc_OpenQuery( dm_rc.sqlLookUpSearch );
        end;
        cSearchFieldListSQL := cSearchFieldListSQL + '( ' ;
        while Length( cSearchFieldList ) > 0 do
        begin
             cField := Copy( cSearchFieldList, 1, Pos( ';' , cSearchFieldList) - 1 );
             cFieldAlias := '';
             if pos( ' as ' , ansilowercase( cField ) ) > 0 then
             begin
                cFieldAlias := Copy( cField, Pos ( ' as ' , ansilowercase( cField ) ) + 4 );
                cField := Copy( cField, 1, Pos ( ' as ' , ansilowercase( cField ) ) - 1 );
             end;

             if cFieldAlias = '' then
                i := dbgSearchCRUDLookUpLite.DataSource.DataSet.FieldByName( cField ).Index
             else
                i := dbgSearchCRUDLookUpLite.DataSource.DataSet.FieldByName( cFieldAlias ).Index;

             if ( DataTypeIsNumber( dbgSearchCRUDLookUpLite.DataSource.DataSet.Fields[ i ].DataType ) ) and
                ( strtointdef( edSearchCRUD1.Text, -999999 ) <> -999999  ) then
                cSearchFieldListSQL := cSearchFieldListSQL + ' ( ' + cField + '=' + edSearchCRUD1.Text + ' ) OR '
             else
             if ( DataTypeIsDateTime( dbgSearchCRUDLookUpLite.DataSource.DataSet.Fields[ i ].DataType ) ) and
                ( StrToDateDef( edSearchCRUD1.Text, -999999 ) <> -999999  ) then
                cSearchFieldListSQL := cSearchFieldListSQL + ' ( ' + cField + '=' + QuotedStr( FormatDateTime( mm.APP_SQL_DATE_FORMAT, StrToDateTime( edSearchCRUD1.Text ) ) ) + ' ) OR '
             else
             //6.1.0.0
             if ( DataTypeIsString( dbgSearchCRUDLookUpLite.DataSource.DataSet.Fields[ i ].DataType ) ) then
             begin
                if ( mm.CONFIG_DATABASE = 'PGSQL' ) then
                   cSearchFieldListSQL := cSearchFieldListSQL + ' ( full_like(' + cField + ') ilike ' + QuotedStr( '%' + edSearchCRUD1.Text + '%' ) + ' ) OR '
                else
                   cSearchFieldListSQL := cSearchFieldListSQL + ' ( ' + cField + ' like ' + QuotedStr( '%' + edSearchCRUD1.Text + '%' ) + ' ) OR ';
             end;
             //remove o ultimo campo adicionado...
             cSearchFieldList    := Trim( Copy( cSearchFieldList , Pos( ';', cSearchFieldList ) + 1, 2000 ) ) ;

             //caso haja alguma má formação da string na chamada
             //tentar encerrar o processo...
             if Pos( ';' , cSearchFieldList ) = 0 then
                cSearchFieldList := '';
             //retira o ultimo ' OR '
             if cSearchFieldList = '' then
                cSearchFieldListSQL := Copy( cSearchFieldListSQL , 1 , Length( cSearchFieldListSQL ) - 3 );
        end;
        cSearchFieldListSQL := cSearchFieldListSQL + ' )' ;
     end;
     cWhereAnd               := '';

     dm_rc.sqlLookUpSearch.Close;
     dm_rc.sqlLookUpSearch.sql.Text := mm.varC_SQL_Default_LookUps;

     if cSqlWhere <> '' then
     begin
        if Copy( cSqlWhere, 1, 1 ) <> ' ' then
           cSqlWhere := ' ' + cSqlWhere;

        dm_rc.sqlLookUpSearch.sql.Text := dm_rc.sqlLookUpSearch.sql.Text + cSqlWhere ;
        cWhereAnd := ' AND '
     end
     else
     begin
        dm_rc.sqlLookUpSearch.sql.Text := dm_rc.sqlLookUpSearch.sql.Text ;
        cWhereAnd := ' WHERE '
     end;

     if edSearchCRUD1.Text <> '' then
     begin
        dm_rc.sqlLookUpSearch.sql.Text := dm_rc.sqlLookUpSearch.sql.Text + cWhereAnd + cSearchFieldListSQL;
     end;

     dm_rc.sqlLookUpSearch.sql.Text := dm_rc.sqlLookUpSearch.sql.Text + cSqlOrder;

     // sugestão para evitar erro com caracteries especiais - Flavio / Osmar 24 05 21
     dm_rc.sqlLookUpSearch.sql.Text := StrTokenClearSql ( dm_rc.sqlLookUpSearch.sql.Text );

     dm_rc.rc_OpenQuery( dm_rc.sqlLookUpSearch );
     
     iCount := dm_rc.sqlLookUpSearch.recordcount;
     labTotReg.Caption := iCount.ToString + cMSG_RECORDS_FOUND;
     dbgSearchCRUDLookUpLite.Visible := iCount > 0;
     if Self.Tag = 1 then
     begin
        if iCount = 1 then 
        begin
           SelectRecordInGrid;
        end;
     end
     else
        // contar quantos campos tem pra ativar ou nao o FORCEFIT
        // FORCEFIT fica melhor com poucos campos
        dbgSearchCRUDLookUpLite.ForceFit := ( dbgSearchCRUDLookUpLite.Columns.Count <= 3 ); 

     Self.Tag := 0;
end;

procedure TfrmLookUp_Lite.dbgSearchCRUDLookUpLiteCellClick(Column: TUniDBGridColumn);
begin
     SelectRecordInGrid;
end;

procedure TfrmLookUp_Lite.dbgSearchCRUDLookUpLiteColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  if Column.Sortable then
  begin
     mm.varC_Order := ' Order by ' + Column.FieldName + varIIf( Direction, ' ASC', ' DESC') ;
     btnLkpSearchClick(self);
  end;
end;

procedure TfrmLookUp_Lite.dbgSearchCRUDLookUpLiteDblClick(Sender: TObject);
begin
     SelectRecordInGrid;
end;

procedure TfrmLookUp_Lite.dbgSearchCRUDLookUpLiteDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
   dm_rc.rc_GridDrawCell( dbgSearchCRUDLookUpLite , ACol, ARow, Column, Attribs ) ; 
end;

procedure TfrmLookUp_Lite.dbgSearchCRUDLookUpLiteExit(Sender: TObject);
begin
//       para NAO atualizar o RETORNO
      mm.varC_Lookup_Code := '_ESC_';
      mm.varC_SelectedItem_LookUp := '';
      dm_rc.sqlLookUpSearch.Close;
//
      Close;
end;
// para evitar conflito com "_onFocus"
procedure TfrmLookUp_Lite.edSearchCRUD1Enter(Sender: TObject);
begin
     mm.Active_Component := btnClearLookup;
     dm_rc.rc_SetCursorEndOfText; //8.0.0.0
end;

procedure TfrmLookUp_Lite.edSearchCRUD1Exit(Sender: TObject);
begin
    dbgSearchCRUDLookUpLite.SetFocus; 
end;

procedure TfrmLookUp_Lite.edSearchCRUD1KeyDown(Sender: TObject; var Key: Word;  Shift: TShiftState);
begin
     if key = 13 then
     begin
          SelectRecordInGrid;
     end
     else
     if Key = VK_DOWN then
        dbgSearchCRUDLookUpLite.SetFocus; 
end;

procedure TfrmLookUp_Lite.edSearchCRUD1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     btnLkpSearchClick( self );
end;
// 6.0.0.0
procedure TfrmLookUp_Lite.paBGFormLookUpMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     if not ( ( ( x >= paBGLookUp.Left ) and ( x <= paBGLookUp.Left + paBGLookUp.Width ) ) and
            ( ( y >= paBGLookUp.Top ) and ( y <= paBGLookUp.Top + paBGLookUp.Height ) ) ) then
        btnCloseFormClick( self );
end;
//8.1.0.1
procedure TfrmLookUp_Lite.SelectRecordInGrid;
begin
     if not dbgSearchCRUDLookUpLite.DataSource.DataSet.IsEmpty then
     begin
        try
           mm.varC_Lookup_Code := dbgSearchCRUDLookUpLite.DataSource.DataSet.FieldByName( ed_PK.Text ).AsString;
        except
           dm_rc.rc_ShowError( cMSG_BUGERROR_RECORDS_SELECTION );
        end;
        // caso tenha mais de um campo de exibição, pegar somente o que tem a "descricao" que por padrao fica ANTES da "pk"( TAB_CODIGO_ID_PREFIXO )
        if ( mm.varC_Lookup_Code <> '' ) and ( strTokenCount( mm.varC_Search_Fields, ';' ) > 1 ) then
        begin
          mm.varC_SelectedItem_LookUp := ReverseStr( trim( Copy( mm.varC_Search_Fields, 1, Pos(';' + ed_PK.Text , mm.varC_Search_Fields) - 1 ) ) );

          if Pos( ';' , mm.varC_SelectedItem_LookUp ) > 0 then
             mm.varC_SelectedItem_LookUp := ReverseStr( Copy( mm.varC_SelectedItem_LookUp , 1, Pos( ';' , mm.varC_SelectedItem_LookUp ) - 1 ) )
          else
             mm.varC_SelectedItem_LookUp := ReverseStr( mm.varC_SelectedItem_LookUp );

          mm.varC_SelectedItem_LookUp := dbgSearchCRUDLookUpLite.DataSource.DataSet.FieldByName( mm.varC_SelectedItem_LookUp ).AsString;
        end;
     end;
     Close;
end;

procedure TfrmLookUp_Lite.timerCloseTimer(Sender: TObject);
begin
     mm.varC_Form_Modal := cFormModal ;
     timerClose.Enabled := false;
     close;
end;

procedure TfrmLookUp_Lite.btnCloseFormClick(Sender: TObject);
begin
     // para NAO atualizar o RETORNO
     mm.varC_Lookup_Code := '_ESC_';
     mm.varC_SelectedItem_LookUp := '';
     dm_rc.sqlLookUpSearch.Close;

     Close;
end;

procedure TfrmLookUp_Lite.btnClearLookupClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmLookUp_Lite.UniFormBeforeShow(Sender: TObject);
begin
     rc_RenderLayout( Self, true, true, true, false );
end;
//6.0.0.0
// para evitar conflito com "_onFocus"
procedure TfrmLookUp_Lite.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
     mm.Active_Component := nil; // 6.0.0.0
end;

procedure TfrmLookUp_Lite.UniFormCreate(Sender: TObject);
begin
  {$IFDEF RELEASE}
  dm_rc.rc_ProtectForm( Self );
  {$ENDIF}

  // to render HINTs
  //dm_rc.rc_RenderControls( Self ); 

  // uma particularidade do LookUp_Lite
  // o RenderLayout deve ser no FormReady para não perder o FOCO
  //rc_RenderLayout( Self, false, true, false, true, false );
//  dbgSearchCRUDLookUpLite.Hint := '[[' +
//                                  'fieldmasks:' +
//                                  'grid-resize|'+
//                                  'grid-paginator|'+
//                                  ']]';
  dm_rc.rc_DBGridUpdate( dbgSearchCRUDLookUpLite, false );//dm_rc.rc_DBGridUpdateAll( Self );//8.0.0.0

  // sort
  dbgSearchCRUDLookUpLite.ClientEvents.UniEvents.Add( 
       'store.afterCreate=function store.afterCreate(sender)' +
       '{ sender.setRemoteSort(false);﻿ }'
  );

  self.Left := -3000;
  // 6.0.0.0
  //aplica uma sombra na mensagem
  //UniSession.AddJS( Self.Webform.JsName + '.addCls(''shadow-obj-tour'')')  ;
  UniSession.AddJS( paBGLookUp.JsName + '.addCls(''shadow-lookup'')')  ;
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
                   edSearchCRUD1.EmptyText         := 'conteúdo da pesquisa';
                 end;
       lten_US, lten_GB   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                   edSearchCRUD1.EmptyText         := 'search content';
                 end;
       ltes_ES   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION :='Falló la selección del registro de búsqueda (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' registro(s) encontrado ';
                   edSearchCRUD1.EmptyText         := 'buscar contenido';
                 end;
       ltfr_FR   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'La sélection de l''enregistrement a échoué ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'enregistrement(s) trouvé(s)';
                   edSearchCRUD1.EmptyText         := 'rechercher le contenu';
                 end;
       ltde_DE   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Datensatzauswahl fehlgeschlagen ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'Datensatz(e) gefunden';
                   edSearchCRUD1.EmptyText         := 'Forschungsinhalt';
                 end;
       ltit_IT   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Selezione record fallita ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'record(s) trovati';
                   edSearchCRUD1.EmptyText         := 'contenuto della ricerca';
                 end;
       lttr_TR    : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Kayıt seçimi başarısız( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'kayıt(lar) bulundu';
                   edSearchCRUD1.EmptyText         := 'search content';
                 end;
       ltru_RU    : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Ошибка выбора записи поиска (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := 'найдены записи';
                   edSearchCRUD1.EmptyText         := 'search content';
                 end;
       ltzn_CH : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                   edSearchCRUD1.EmptyText         := 'search content';
                 end;
       ltin_ID : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                   edSearchCRUD1.EmptyText         := 'search content';
                 end;
       ltth_TH : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                   edSearchCRUD1.EmptyText         := 'search content';
                 end;
       lthi_IN : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                   edSearchCRUD1.EmptyText         := 'search content';
                 end;
       ltar_SA    : begin 
                   cMSG_BUGERROR_RECORDS_SELECTION := 'فشل اختيار سجل البحث (rc_LookUpSearchLite)';
                   cMSG_RECORDS_FOUND              := ' تم العثور على سجل (سجلات) ';
                   edSearchCRUD1.EmptyText         := 'search content';
                 end;
  end;
end;

procedure TfrmLookUp_Lite.UniFormDestroy(Sender: TObject);
begin
    // para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no
    // que estiver "abaixo" do MODAL
    mm.varC_Form_Modal := nil;
end;

procedure TfrmLookUp_Lite.UniFormReady(Sender: TObject);
begin
     cFormModal := mm.varC_Form_Modal;
     // uma particularidade do LookUp_Lite
     // o RenderLayout deve ser no FormReady para não perder o FOCO
     //v. v.
     //rc_RenderLayout( Self, false, false, true );
     //dm_rc.rc_ResizeBlocks( Self, true, true );
     dm_rc.rc_SetFocus( edSearchCRUD1 );
end;

procedure TfrmLookUp_Lite.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 27 then
     begin
          // para NAO atualizar o RETORNO
          mm.varC_Lookup_Code := '_ESC_';
          mm.varC_SelectedItem_LookUp := '';
          dm_rc.sqlLookUpSearch.Close;

          Close;
     end;
end;

procedure TfrmLookUp_Lite.UniFormShow(Sender: TObject);
begin
  inherited;
     if Self.Tag = 0 then
     begin
         Self.Visible := True;
         paBGLookUp.Left := mm.varI_PosX - 2;
         //8.2.0.0
         if paBGLookUp.Width < 350 then
            paBGLookUp.Width := 350;
         if paBGLookUp.Left > mm.varI_ScreenWidth - paBGLookUp.Width then
            paBGLookUp.Left := mm.varI_ScreenWidth - paBGLookUp.Width - 4;
         paBGLookUp.Top  := mm.varI_PosY - 3 ;//+ mm.varI_PosH;
         if paBGLookUp.Top > mm.varI_ScreenHeight - paBGLookUp.Height then
            paBGLookUp.Top := mm.varI_ScreenHeight - paBGLookUp.Height - 4;
//         if paBGLookUp.Width < mm.varI_PosW then
//            paBGLookUp.Width := mm.varI_PosW;
     end
     else
     begin
       Self.Visible := False;
       Self.Top  := -1000;
     end;
     
     if mm.varC_TempLink <> '' then
     begin
        edSearchCRUD1.Text := mm.varC_TempLink;
        mm.varC_TempLink   := '';
     end
     else
        edSearchCRUD1.Clear;
     mm.varC_Lookup_Code := '';
     mm.varC_SelectedItem_LookUp := '';

     btnLkpSearchClick( self );

     Self.Visible := True;
end;
end.
