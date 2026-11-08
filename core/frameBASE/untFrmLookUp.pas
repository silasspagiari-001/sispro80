unit untFrmLookUp; //6.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniBasicGrid,

  uniSpeedButton,

  uniDBGrid, uniEdit, uniLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniButton, uniBitBtn, uniTimer;

type
  TfrmLookUp = class(TUniForm)
    timerClose: TUniTimer;
    rcBlock10: TUniContainerPanel;
    edSearchCRUD1: TUniEdit;
    UniLabelv1: TUniLabel;
    rcBlock40: TUniContainerPanel;
    dbgSearchCRUDLookUp: TUniDBGrid;
    rcBlock20: TUniContainerPanel;
    btnLkpSearch: TUniBitBtn;
    ed_PK: TUniEdit;
    rcBlock30: TUniContainerPanel;
    btnLkpClear: TUniBitBtn;
    paTotreg: TUniContainerPanel;
    labTotReg: TUniLabel;
    ed_Lkp: TUniEdit;
    procedure dbgSearchCRUDLookUpDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure btnLkpSearchClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure dbgSearchCRUDLookUpDblClick(Sender: TObject);
    procedure edSearchCRUD1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnLkpClearClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure timerCloseTimer(Sender: TObject);
    procedure dbgSearchCRUDLookUpColumnSort(Column: TUniDBGridColumn;
      Direction: Boolean);
    procedure btnCloseFormClick(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure edSearchCRUD1Enter(Sender: TObject);
    procedure UniFormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    
    cCAPTION_btnLkpSearch,
    cCAPTION_btnLkpClear,
    cCAPTION_UniLabelv1,
    cMSG_BUGERROR_RECORDS_SELECTION,
    cMSG_RECORDS_FOUND : string ;
    C_Search_Fields : string;//8.0.0.0

    cFormModal : TUniForm;

    procedure SelectRecordInGrid;
  end;


function frmLookUp: TfrmLookUp;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untdm_rc, str_func, //untDM_LOOKUPs,
  uconsts, uconsts_cfg, Main, mkm_layout, mkm_func_web, mkm_anim;

function frmLookUp: TfrmLookUp;
begin
  Result := TfrmLookUp(mm.GetFormInstance(TfrmLookUp));
end;

procedure TfrmLookUp.btnLkpSearchClick(Sender: TObject);
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
                i := dbgSearchCRUDLookUp.DataSource.DataSet.FieldByName( cField ).Index
             else
                i := dbgSearchCRUDLookUp.DataSource.DataSet.FieldByName( cFieldAlias ).Index;

             if ( DataTypeIsNumber( dbgSearchCRUDLookUp.DataSource.DataSet.Fields[ i ].DataType ) ) and
                ( strtointdef( edSearchCRUD1.Text, -999999 ) <> -999999  ) then
                cSearchFieldListSQL := cSearchFieldListSQL + ' ( ' + cField + '=' + edSearchCRUD1.Text + ' ) OR '
             else
             if ( DataTypeIsDateTime( dbgSearchCRUDLookUp.DataSource.DataSet.Fields[ i ].DataType ) ) and
                ( StrToDateDef( edSearchCRUD1.Text, -999999 ) <> -999999  ) then
                cSearchFieldListSQL := cSearchFieldListSQL + ' ( ' + cField + '=' + QuotedStr( FormatDateTime( mm.APP_SQL_DATE_FORMAT, StrToDateTime( edSearchCRUD1.Text ) ) ) + ' ) OR '
             else
             //6.1.0.0
             if ( DataTypeIsString( dbgSearchCRUDLookUp.DataSource.DataSet.Fields[ i ].DataType ) ) then
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
     dbgSearchCRUDLookUp.Visible := iCount > 0;
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
   //     dbgSearchCRUDLookUp.ForceFit := ( dbgSearchCRUDLookUp.Columns.Count <= 5 );

     Self.Tag := 0;
end;

procedure TfrmLookUp.dbgSearchCRUDLookUpColumnSort(Column: TUniDBGridColumn;
  Direction: Boolean);
begin
  if Column.Sortable then
  begin
     mm.varC_Order := ' Order by ' + lowercase(Column.FieldName) + varIIf( Direction, ' ASC', ' DESC') ;
     btnLkpSearch.Click;
  end;
end;

procedure TfrmLookUp.dbgSearchCRUDLookUpDblClick(Sender: TObject);
begin
     SelectRecordInGrid;
end;

procedure TfrmLookUp.dbgSearchCRUDLookUpDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
   dm_rc.rc_GridDrawCell( dbgSearchCRUDLookUp , ACol, ARow, Column, Attribs ) ;
end;
//6.0.0.0
// para evitar conflito com "_onFocus"
procedure TfrmLookUp.edSearchCRUD1Enter(Sender: TObject);
begin
     mm.Active_Component := btnLkpClear; // 6.0.0.0
end;

procedure TfrmLookUp.edSearchCRUD1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if key = 13 then
     begin
          btnLkpSearchClick( self );
          dbgSearchCRUDLookUp.Parent.SetFocus;
          dbgSearchCRUDLookUp.SetFocus;
     end;
end;
//8.1.0.1
procedure TfrmLookUp.SelectRecordInGrid;
begin
     if not dbgSearchCRUDLookUp.DataSource.DataSet.IsEmpty then
     begin
        try
           mm.varC_Lookup_Code := dbgSearchCRUDLookUp.DataSource.DataSet.FieldByName( ed_PK.Text ).AsString;
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

          mm.varC_SelectedItem_LookUp := dbgSearchCRUDLookUp.DataSource.DataSet.FieldByName( mm.varC_SelectedItem_LookUp ).AsString;
        end;
     end;
     Close;
end;

procedure TfrmLookUp.timerCloseTimer(Sender: TObject);
begin
     mm.varC_Form_Modal := cFormModal ;
     timerClose.Enabled := false;
     close;
end;

procedure TfrmLookUp.btnCloseFormClick(Sender: TObject);
begin
     timerClose.Enabled := true;
     rc_MoveAnimationForm( self,
                           self.left,
                           self.left,
                           self.top,
                           -self.Height,
                           400,
                           0 ) ;
end;

procedure TfrmLookUp.btnLkpClearClick(Sender: TObject);
begin
     mm.varC_Lookup_Code := '';
     mm.varC_SelectedItem_LookUp := '';
     dm_rc.sqlLookUpSearch.Close;

     timerClose.Enabled := true;
     rc_MoveAnimationForm( self,
                           self.left,
                           self.left,
                           self.top,
                           -self.Height,
                           400,
                           0 ) ;
end;

procedure TfrmLookUp.UniFormBeforeShow(Sender: TObject);
begin
   rc_RenderLayout( Self, true, true, false, false );
end;
//6.0.0.0
// para evitar conflito com "_onFocus"
procedure TfrmLookUp.UniFormClose(Sender: TObject; var Action: TCloseAction);
begin
     mm.Active_Component := nil; // 6.0.0.0
end;

procedure TfrmLookUp.UniFormCreate(Sender: TObject);
begin
  C_Search_Fields := '';//8.0.0.0
  // sort
  dbgSearchCRUDLookUp.ClientEvents.UniEvents.Add( 
       'store.afterCreate=function store.afterCreate(sender)' +
       '{ sender.setRemoteSort(false);﻿ }'
  );
  
  // translate messages
  case mm.varLT_Lang of

       ltpt_BR, ltpt_PT : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Falha na seleção do registro( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := ' registro(s) localizado(s)';
                   edSearchCRUD1.EmptyText         := 'conteúdo da pesquisa';
                   cCAPTION_btnLkpSearch           := 'Pesquisa';
                   cCAPTION_btnLkpClear            := 'Limpa';
                   cCAPTION_UniLabelv1             := 'Conteúdo da Pesquisa';
                 end;
       lten_US, lten_GB   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                   edSearchCRUD1.EmptyText         := 'search content';
                   cCAPTION_btnLkpSearch           := 'Search';
                   cCAPTION_btnLkpClear            := 'Clear';
                   cCAPTION_UniLabelv1             := 'Survey Content';
                 end;
       ltes_ES   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION :='Falló la selección del registro de búsqueda (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' registro(s) encontrado ';
                   edSearchCRUD1.EmptyText         := 'buscar contenido';
                   cCAPTION_btnLkpSearch           := 'Buscar';
                   cCAPTION_btnLkpClear            := 'Borrar';
                   cCAPTION_UniLabelv1             := 'Contenido de la encuesta';
                 end;
       ltfr_FR   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'La sélection de l''enregistrement a échoué ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'enregistrement(s) trouvé(s)';
                   edSearchCRUD1.EmptyText         := 'rechercher le contenu';
                   cCAPTION_btnLkpSearch           := 'Rechercher';
                   cCAPTION_btnLkpClear            := 'Effacer';
                   cCAPTION_UniLabelv1             := 'Contenu de l''enquête';
                 end;
       ltde_DE   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Datensatzauswahl fehlgeschlagen ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'Datensatz(e) gefunden';
                   edSearchCRUD1.EmptyText         := 'Forschungsinhalt';
                   cCAPTION_btnLkpSearch           := 'Suchen';
                   cCAPTION_btnLkpClear            := 'Löschen';
                   cCAPTION_UniLabelv1             := 'Umfrageinhalt';
                 end;
       ltit_IT   : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Selezione record fallita ( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'record(s) trovati';
                   edSearchCRUD1.EmptyText         := 'contenuto della ricerca';
                   cCAPTION_btnLkpSearch           := 'Cerca';
                   cCAPTION_btnLkpClear            := 'Cancella';
                   cCAPTION_UniLabelv1             := 'Contenuto del sondaggio';
                 end;
       lttr_TR    : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Kayıt seçimi başarısız( rc_LookUpSearch )';
                   cMSG_RECORDS_FOUND              := 'kayıt(lar) bulundu';
                   edSearchCRUD1.EmptyText         := 'search content';
                   cCAPTION_btnLkpSearch           := 'Ara';
                   cCAPTION_btnLkpClear            := 'Temizle';
                   cCAPTION_UniLabelv1             := 'Anket İçeriği';
                 end;
       ltru_RU    : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Ошибка выбора записи поиска (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := 'найдены записи';
                   edSearchCRUD1.EmptyText         := 'search content';
                   cCAPTION_btnLkpSearch           := 'Search';
                   cCAPTION_btnLkpClear            := 'Clear';
                   cCAPTION_UniLabelv1             := 'Survey Content';
                 end;
       ltzn_CH : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                   edSearchCRUD1.EmptyText         := 'search content';
                   cCAPTION_btnLkpSearch           := 'Search';
                   cCAPTION_btnLkpClear            := 'Clear';
                   cCAPTION_UniLabelv1             := 'Survey Content';
                 end;
       ltin_ID : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                   edSearchCRUD1.EmptyText         := 'search content';
                   cCAPTION_btnLkpSearch           := 'Search';
                   cCAPTION_btnLkpClear            := 'Clear';
                   cCAPTION_UniLabelv1             := 'Survey Content';
                 end;
       ltth_TH : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                   edSearchCRUD1.EmptyText         := 'search content';
                   cCAPTION_btnLkpSearch           := 'Search';
                   cCAPTION_btnLkpClear            := 'Clear';
                   cCAPTION_UniLabelv1             := 'Survey Content';
                 end;
       lthi_IN : begin
                   cMSG_BUGERROR_RECORDS_SELECTION := 'Search record selection failed (rc_LookUpSearch)';
                   cMSG_RECORDS_FOUND              := ' record(s) found ';
                   edSearchCRUD1.EmptyText         := 'search content';
                   cCAPTION_btnLkpSearch           := 'Search';
                   cCAPTION_btnLkpClear            := 'Clear';
                   cCAPTION_UniLabelv1             := 'Survey Content';
                 end;
       ltar_SA    : begin 
                   cMSG_BUGERROR_RECORDS_SELECTION := 'فشل اختيار سجل البحث (rc_LookUpSearchLite)';
                   cMSG_RECORDS_FOUND              := ' تم العثور على سجل (سجلات) ';
                   edSearchCRUD1.EmptyText         := 'search content';
                   cCAPTION_btnLkpSearch           := 'Search';
                   cCAPTION_btnLkpClear            := 'Clear';
                   cCAPTION_UniLabelv1             := 'Survey Content';
                 end;
  end;
  // 
  btnLkpSearch.Caption := cCAPTION_btnLkpSearch;
  btnLkpClear.Caption  := cCAPTION_btnLkpClear;
  UniLabelv1.Caption   := cCAPTION_UniLabelv1;

  cFormModal := mm.varC_Form_Modal;

  // para formulários, deve-se efetuar o ResizeBlocks | For forms, resizeblocks should be made
  rc_RenderLayout( Self, true, true, true );
end;

procedure TfrmLookUp.UniFormDestroy(Sender: TObject);
begin
    // para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no
    // que estiver "abaixo" do MODAL
    mm.varC_Form_Modal := nil;
end;

procedure TfrmLookUp.UniFormReady(Sender: TObject);
begin
     Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
     //dm_rc.rc_ResizeBlocks( Self, true, true ); 
end;

procedure TfrmLookUp.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 27 then
     begin
          // para NAO atualizar o RETORNO
          mm.varC_Lookup_Code := '_ESC_';
          mm.varC_SelectedItem_LookUp := '';
          dm_rc.sqlLookUpSearch.Close;

          SelectRecordInGrid;
     end;
end;

procedure TfrmLookUp.UniFormShow(Sender: TObject);
begin
  inherited;
  ed_PK.text := mm.varC_Field_PK;
  Self.Tag   := mm.varI_FrmLookUpTag;

  dm_rc.memGridPK.Open;

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
  
  if mm.varC_TempLink <> '' then
  begin
     edSearchCRUD1.Text := mm.varC_TempLink;
     mm.varC_TempLink   := '';
  end
  else
     edSearchCRUD1.Clear;
  mm.varC_Lookup_Code := '';
  mm.varC_SelectedItem_LookUp := '';

  // para NAO atualizar o RETORNO
  //
  mm.varC_Lookup_Code := '_ESC_';

  btnLkpSearch.Click;

  edSearchCRUD1.SetFocus;

  Self.Visible := True;
end;
end.
