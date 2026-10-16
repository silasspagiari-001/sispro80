unit mkm_menus; //8.0.0.0

interface

uses

    System.SysUtils, System.Math, uconsts, uconsts_cfg, IniFiles;

procedure rc_BuildHTMLMENU( pMenuList : array of string  ) ;

procedure rc_BuildMenuItem( var pMenuList     : array of string;
                            var pSeq          : integer ;
                            pLevel            : integer;
                            pItem             : string = '';
                            pTable            : string = '';
                            pRestrictionField : string = '';
                            pForm             : string = '';
                            pIcon             : string = '';
                            pBadge            : string = ''; //8.0.0.0
                            pModal            : boolean = false ;
                            pHidden           : boolean = false ;
                            pAskNewAfterPost  : boolean = false ;
                            pGenNextID_OnNew  : boolean = false ;
                            pCloseButton      : boolean = true  ;
                            pDoNotShow        : boolean = false ;
                            pMaster           : boolean = false ; // 6.0.0.0
                            pTag              : string = '';      // 6.0.0.0
                            pGetThisPK        : string = '';      // 6.0.0.0
                            pGenIdOFF         : boolean = false;  // 6.0.0.0
                            pPKZerosLeft      : boolean = false;  // 6.0.0.0
                            pHideMaskOff      : boolean = false   // 6.0.0.0 menu mask
                            ); overload;

procedure rc_BuildMenuItem( pMenuGroup        : string = '';
                            pLevel            : integer = 0;
                            pItem             : string = '';
                            pIsSubMenu        : boolean = true // 6.0.0.0
                            ); overload;

procedure rc_BuildMenuItemPermission( var pMenuList : array of string;
                                      var pSeq      : integer ;
                                      var pSeqPerm  : integer;
                                      pItem         : string ); overload;

procedure rc_BuildMenuItemPermission( pMenuGroup    : string = '';
                                      pItem         : string = '' ); overload;

implementation


uses mkm_func_web, MainModule, untdm_rc, ServerModule, str_func, mkm_layout;

procedure rc_BuildMenuItem( var pMenuList     : array of string;
                            var pSeq          : integer ;
                            pLevel            : integer;
                            pItem             : string ;
                            pTable            : string ;
                            pRestrictionField : string;
                            pForm             : string ;
                            pIcon             : string;
                            pBadge            : string; //8.0.0.0
                            pModal            : boolean ;
                            pHidden           : boolean ;
                            pAskNewAfterPost  : boolean ;
                            pGenNextID_OnNew  : boolean ;
                            pCloseButton      : boolean ;
                            pDoNotShow        : boolean ;
                            pMaster           : boolean ; // 6.0.0.0
                            pTag              : string  ; // 6.0.0.0
                            pGetThisPK        : string  ; // 6.0.0.0
                            pGenIdOFF         : boolean ; // 6.0.0.0
                            pPKZerosLeft      : boolean ; // 6.0.0.0
                            pHideMaskOff      : boolean   // 6.0.0.0  menu mask
                            );
begin
     try
        pItem := StringOfChar( ']', pLevel ) + pItem;

        if ( pRestrictionField = '' ) and ( pTable <> '' ) then
           pRestrictionField := pTable
        else
        if ( pRestrictionField = '' ) and ( pForm <> '' ) then
           pRestrictionField := pForm;

        //if pAskNewAfterPost then
        if pModal then //Pos( 'RC Racing', pItem ) > 0 then
           pSeq := pSeq;


        if pLevel = -1 then
           pItem := '-1'
        else
        if pLevel > 0 then
        begin
             pForm  := '';
             pTable := '';
        end;

        //[PT] para evitar erros se os parâmetros "tabela" e "nome do form" forem preenchidos com o mesmo conteúdo
        //[EN] To avoid errors if the "table" and "form name" parameters are filled with the same content
        if pForm = pTable  then
           pForm := '';
(*
]Menu Principal ico:fas-sitemap
]]Menu Nivel 2
Buttons ico:fas-dot-circle fld:Demo_Buttons frm:Demo_Buttons
*)
        pItem := pItem + varIIf( pIcon <> ''            , ' ico:' + pIcon, '' ) +
                         varIIf( pBadge <> ''           , ' badge:' + pBadge, '' ) + //8.0.0.0
                         varIIf( pTable <> ''           , ' tbl:' + pTable, '' ) +
                         varIIf( pRestrictionField <> '', ' fld:' + pRestrictionField, '' ) +
                         varIIf( pHidden                , ' hide:' , '' ) +
                         varIIf( pDoNotShow             , ' notshow:' , '' ) +
                         varIIf( pMaster                , ' master:' , '' ) + // 6.0.0.0
                         varIIf( pAskNewAfterPost       , ' asknew:' , '' ) +
                         varIIf( pGenNextID_OnNew       , ' genid:' , '' ) +
                         varIIf( pGenIdOFF              , ' genid-off:' , '' ) + // 6.0.0.0
                         varIIf( pPKZerosLeft           , ' zerosleft:' , '' ) + // 6.0.0.0
                         varIIf( pHideMaskOff           , ' hidemaskoff:' , '' ) + // 6.0.0.0 menu mask
                         varIIf( not pCloseButton       , ' closebtn:' , '' ) +
                         varIIf( pForm <> ''            , ' frm:' + varIIF( pModal, 'modal_', '' ) + pForm, '' ) + // 6.0.0.0
                         varIIf( pTag <> ''             , ' tag-form:' + pTag, '' ) +                              // 6.0.0.0
                         varIIf( pGetThisPK <> ''       , ' getpk:' + pGetThisPK, '' ) ;                           // 6.0.0.0
         // future implementation...
        if strTokenCount( pItem, '[' ) <= 1  then
        begin
             //pItem :=
        end;

        pMenuList[ pSeq ] := pItem ;
        Inc( pSeq );
     except on e:exception do
            begin
                 dm_rc.rc_ShowSweetAlert( 'rc_BuildMenuItem' , 'Item: ' + pItem + '( ' + e.message + ' )', 'error' );
            end;
     end;
end;

procedure rc_BuildMenuItem( pMenuGroup        : string; // '' or B asic, M ovement, R eport, T ools, O thers
                            pLevel            : integer;
                            pItem             : string ;
                            pIsSubMenu        : boolean // 6.0.0.0  future implementation
                            );
var
   cTemp,cTmp,cMenuParams,cOption : string;
   pTable            : string ;
   pRestrictionField : string;
   pForm             : string ;
   pIcon             : string;
   pBadge            : string; //8.0.0.0
   pModal            : boolean ;
   pHidden           : boolean ;
   pAskNewAfterPost  : boolean ;
   pGenNextID_OnNew  : boolean ;
   pGenIdOFF         : boolean ; // 6.0.0.0
   pPKZerosLeft      : boolean ; // 6.0.0.0
   pHideMaskOff      : boolean ; // 6.0.0.0 menu mask
   pCloseButton      : boolean ;
   pDoNotShow        : boolean ;
   pMaster           : boolean ;
   pTag              : string ; // 6.0.0.0
   pGetThisPK        : string ; // 6.0.0.0
   pArray            : TArray<String>;
   IniFile           : TMemIniFile;
   cTempUtf8         : UTF8String;
   iSeq              : integer; //6.0.0.0
begin
     try
        Inc( mm.varI_Temp1 );// 6.0.0.0
        pItem := StringOfChar( ']', pLevel ) + pItem + ' ';
        pItem := varIIF( not pIsSubMenu, '<', '' ) + pItem; // 6.0.0.0
        If ( mm.CONFIG_RC_TRANSLATE = 'ON' ) then //and ( Pos( ' translate:' , pItem ) > 0 ) then
        begin
           // 6.0.0.0+menu translate
           cTemp := mm.CONFIG_LANGUAGE;
           cTemp := sm.FilesFolderPath + 'translate' + mm.BACKSLASH + cTemp + mm.BACKSLASH + 'menu.ini';
           if FileExists( cTemp ) then
           begin
              IniFile := TMemIniFile.Create( cTemp, TEncoding.UTF8 );
              //Linux compiler...thanks for EMILIO PEREZ from Spain.
              try
                 cTempUtf8 := AnsiToUtf8( pItem );

                 pItem := Trim( StringReplace( pItem, ' translate:', '', [rfReplaceAll] ) );
                 iSeq      := strTokenCount( pItem, ']' ) - 1;
                 cTmp := StringReplace( pItem, ']', '', [rfReplaceAll] ) + ' ';
                 if Pos ( ':', cTmp ) = 0 then
                    cMenuParams := rc_GetHintAttr( 'mitem:', 'mitem:' + cTmp )
                 else
                    cMenuParams := rc_GetHintAttr( 'mitem:', 'mitem:' + cTmp, true );

                 cMenuParams := Trim( StringReplace( 'mitem:' + cTmp, 'mitem:' + cMenuParams, '', [rfReplaceAll] ) );
                 if cMenuParams <> '' then
                    cMenuParams := ' ' + cMenuParams;

                 //cMenuParams := '';//8.5.0.0 menu

                 iSeq    := strTokenCount( pItem, ']' ) - 1;
                 cOption := dm_rc.rc_ClearMenuParams( cTmp );
                 cOption := stringReplace( rc_StripHtmlTags(cOption) , ' ', '_', [rfReplaceAll] );
                 cOption := RemoveAccents( cOption );
                 cTmp    := Replicate( ']', iSeq  );
                 //pItem   := IniFile.ReadString( 'caption' , 'option_' + mm.varI_Temp1.ToString , cTempUtf8 ) ;
                 pItem   := IniFile.ReadString( 'caption' , 'option_' + cOption , cTempUtf8 ) ;
                 if ( Pos( ']', pItem ) = 0 ) and ( cTmp <> '' ) then
                    pItem := cTmp + pItem;
                 pItem := pItem + cMenuParams;
              finally
                IniFile.Free;
              end;
           end;
        end;
(*
]Menu Principal ico:fas-sitemap
]]Menu Nivel 2
Buttons ico:fas-dot-circle tbl:Buttons fld:Demo_Buttons frm:Demo_Buttons
*)
        pTable            := rc_GetSubstr( pItem, 'tbl:', ' ' ) ;
        pRestrictionField := rc_GetSubstr( pItem, 'fld:', ' ' );
        pForm             := rc_GetSubstr( pItem, 'frm:', ' ' ) ;
        pIcon             := rc_GetSubstr( pItem, 'ico:', ' ' );
        pBadge            := rc_GetSubstr( pItem, 'badge:', ' ' ); //8.0.0.0
        pModal            := rc_GetSubstr( pItem, 'modal:', ' ' ) <> '';
        pHidden           := rc_GetSubstr( pItem, 'hide:', ' ' ) <> '';
        pAskNewAfterPost  := rc_GetSubstr( pItem, 'asknew:', ' ' ) <> '';
        pGenNextID_OnNew  := rc_GetSubstr( pItem, 'genid:', ' ' ) <> '';
        pGenIdOFF         := rc_GetSubstr( pItem, 'genid-off:', ' ' ) <> ''; // 6.0.0.0
        pPKZerosLeft      := rc_GetSubstr( pItem, 'zerosleft:', ' ' ) <> ''; // 6.0.0.0
        pHideMaskOff      := rc_GetSubstr( pItem, 'hidemaskoff:', ' ' ) <> ''; // 6.0.0.0 menu mask
        pCloseButton      := rc_GetSubstr( pItem, 'closebtn:', ' ' ) = '' ;
        pDoNotShow        := rc_GetSubstr( pItem, 'notshow:', ' ' ) <> '';
        pMaster           := rc_GetSubstr( pItem, 'master:', ' ' ) <> '';
        pTag              := rc_GetSubstr( pItem, 'tag-form:', ' ' ); // 6.0.0.0
        pGetThisPK        := rc_GetSubstr( pItem, 'getpk:', ' ' );    // 6.0.0.0

        if ( pRestrictionField = '' ) and ( pTable <> '' ) then
           pRestrictionField := pTable
        else
        if ( pRestrictionField = '' ) and ( pForm <> '' ) then
           pRestrictionField := pForm;

        if pLevel = -1 then
           pItem := '-1'
        else
        if pLevel > 0 then
        begin
             pForm  := '';
             pTable := '';
        end;

        //[PT] para evitar erros se os parâmetros "tabela" e "nome do form" forem preenchidos com o mesmo conteúdo
        //[EN] To avoid errors if the "table" and "form name" parameters are filled with the same content
        if pForm = pTable  then
           pForm := '';
(*
]Menu Principal ico:fas-sitemap
]]Menu Nivel 2
Buttons ico:fas-dot-circle fld:Demo_Buttons frm:Demo_Buttons
*)
        //8.5.0.0 menu
        if ( pForm <> '' ) and ( pModal ) then
        begin
           pItem := StringReplace( pItem, pForm, 'frm:' + 'modal_' + Copy( pForm, 5 ), [rfReplaceAll] ) ;
           pItem := StringReplace( pItem, ' modal:', '' , [rfReplaceAll] ) ;
        end;

        if ( pMenuGroup = '' ) or ( pMenuGroup = 'B' ) then
        begin
          pMenuGroup := 'B';//8.4.0.3
          SetLength( mm.varA_MenuBasics, Length( mm.varA_MenuBasics ) + 1 );
          mm.varA_MenuBasics[ Length( mm.varA_MenuBasics ) - 1] := pItem;
        end
        else
        if ( pMenuGroup = 'M' ) then
        begin
          SetLength( mm.varA_MenuMovement, Length( mm.varA_MenuMovement ) + 1 );
          mm.varA_MenuMovement[ Length( mm.varA_MenuMovement ) - 1] := pItem;
        end
        else
        if ( pMenuGroup = 'R' ) then
        begin
          SetLength( mm.varA_MenuReport, Length( mm.varA_MenuReport ) + 1 );
          mm.varA_MenuReport[ Length( mm.varA_MenuReport ) - 1] := pItem;
        end
        else
        if ( pMenuGroup = 'T' ) then
        begin
          SetLength( mm.varA_MenuTools, Length( mm.varA_MenuTools ) + 1 );
          mm.varA_MenuTools[ Length( mm.varA_MenuTools ) - 1] := pItem;
        end
        else
        if ( pMenuGroup = 'O' ) then
        begin
          SetLength( mm.varA_MenuOptions, Length( mm.varA_MenuOptions ) + 1 );
          mm.varA_MenuOptions[ Length( mm.varA_MenuOptions ) - 1] := pItem;
        end;
        mm.varC_MenuGroupID := pMenuGroup;//8.4.0.3

     except on e:exception do
            begin
                 dm_rc.rc_ShowSweetAlert( 'rc_BuildMenuItem' , 'Item: ' + pItem + '( ' + e.message + ' )', 'error' );
            end;
     end;
end;

procedure rc_BuildMenuItemPermission( var pMenuList : array of string; var pSeq : integer ; var pSeqPerm : integer; pItem : string );
var
   cAccess,
   cInsert,
   cEdit,
   cDelete,
   cHidden,
   cMaster : string;
begin
        if Pos( 'moviment', lowercase( pItem ) ) > 0 then
           pSeq := pSeq;
     //permissions
     if ( ( Pos( '<', pItem ) > 0 ) and ( Pos( '>', pItem ) > 0 ) ) and
        ( ( Pos( 'A', pItem ) > 0 ) or
          ( Pos( 'I', pItem ) > 0 ) or
          ( Pos( 'E', pItem ) > 0 ) or
          ( Pos( 'D', pItem ) > 0 ) or
          ( Pos( 'M', pItem ) > 0 ) ) then
     begin
        cAccess := '';
        cInsert := '';
        cEdit   := '';
        cDelete := '';
        cHidden := '';
        cMaster := '';
        // translate messages
        case mm.varLT_Lang of

             ltpt_BR, ltpt_PT : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Acessar'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Cadastrar' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Alterar'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Excluir' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             lten_US,
             lten_GB : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Access'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Insert' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Edit'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Delete' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltes_ES   : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Acessar'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Cadastrar' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Alterar'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Excluir' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltfr_FR   : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Accès'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Cadastre' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Éditer'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Supprimer' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltde_DE   : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Zugang'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Kataster' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Redigieren'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Löschen' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltit_IT   : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Accesso'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Catasto' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Redigere'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Cancellare' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             lttr_TR    : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Erişim'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Kadastro' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Düzenlemek'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Silmek' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltru_RU    : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Доступ'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Вставка' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Редактировать'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Удалить' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltzn_CH : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Access'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Insert' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Edit'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Delete' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltin_ID : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Access'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Insert' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Edit'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Delete' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltth_TH : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Access'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Insert' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Edit'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Delete' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             lthi_IN : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Access'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Insert' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Edit'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Delete' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
                       // feedback Mohamed Ammar
             ltar_SA : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'عرض'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'جديد' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'تعديل'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'حذف' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
        end;
        If cAccess <> '' then
        begin
          pMenuList[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cAccess  ;
          Inc( pSeqPerm );
        end;
        If cInsert <> '' then
        begin
          pMenuList[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cInsert ;
          Inc( pSeqPerm );
        end;
        If cEdit <> '' then
        begin
          pMenuList[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cEdit   ;
          Inc( pSeqPerm );
        end;
        If cDelete <> '' then
        begin
          pMenuList[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cDelete;
          Inc( pSeqPerm );
        end;
        If cMaster <> '' then
        begin
          pMenuList[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cMaster ;
        end;
     end
     else
     begin
       pMenuList[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + pItem ; Inc( pSeqPerm );
     end;
end;

procedure rc_BuildMenuItemPermission( pMenuGroup : string; pItem : string );
var
   iLength, pSeq, pSeqPerm : integer;
   cAccess,
   cInsert,
   cEdit,
   cDelete,
   cHidden,
   cMaster : string;
begin
   pMenuGroup := mm.varC_MenuGroupID;//8.4.0.3

   if Pos( 'moviment', lowercase( pItem ) ) > 0 then
      iLength := 0;
     //permissions
     iLength := 0;
     if ( ( Pos( '<', pItem ) > 0 ) and ( Pos( '>', pItem ) > 0 ) ) and
        ( ( Pos( 'A', pItem ) > 0 ) or
          ( Pos( 'I', pItem ) > 0 ) or
          ( Pos( 'E', pItem ) > 0 ) or
          ( Pos( 'D', pItem ) > 0 ) or
          ( Pos( 'M', pItem ) > 0 ) ) then
     begin
        cAccess := '';
        cInsert := '';
        cEdit   := '';
        cDelete := '';
        cHidden := '';
        cMaster := '';
        // translate messages
        case mm.varLT_Lang of

             ltpt_BR, ltpt_PT : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Acessar'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Cadastrar' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Alterar'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Excluir' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             lten_US,
             lten_GB : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Access'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Insert' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Edit'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Delete' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltes_ES   : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Acessar'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Cadastrar' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Alterar'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Excluir' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltfr_FR   : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Accès'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Cadastre' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Éditer'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Supprimer' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltde_DE   : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Zugang'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Kataster' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Redigieren'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Löschen' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltit_IT   : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Accesso'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Catasto' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Redigere'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Cancellare' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             lttr_TR    : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Erişim'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Kadastro' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Düzenlemek'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Silmek' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltru_RU    : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Доступ'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Вставка' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Редактировать'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Удалить' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltzn_CH : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Access'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Insert' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Edit'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Delete' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltin_ID : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Access'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Insert' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Edit'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Delete' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltth_TH : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Access'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Insert' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Edit'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Delete' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             lthi_IN : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'Access'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'Insert' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'Edit'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'Delete' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
             ltar_SA : begin
                          If ( Pos( 'A', pItem ) > 0 ) then cAccess := 'عرض'  ;
                          If ( Pos( 'I', pItem ) > 0 ) then cInsert := 'جديد' ;
                          If ( Pos( 'E', pItem ) > 0 ) then cEdit   := 'تعديل'   ;
                          If ( Pos( 'D', pItem ) > 0 ) then cDelete := 'حذف' ;
                          If ( Pos( 'M', pItem ) > 0 ) then cMaster := 'RCMaster' ;
                       end;
        end;

        If cAccess <> '' then Inc( iLength );
        If cInsert <> '' then Inc( iLength );
        If cEdit   <> '' then Inc( iLength );
        If cDelete <> '' then Inc( iLength );

        if ( pMenuGroup = '' ) or ( pMenuGroup = 'B' ) then
        begin
          SetLength( mm.varA_MenuBasicsPermissions, Length( mm.varA_MenuBasicsPermissions ) + iLength  );

          pSeq     := Length( mm.varA_MenuBasics ) ;
          pSeqPerm := Length( mm.varA_MenuBasicsPermissions ) - iLength ;
          if pSeqPerm = 0 then
             pSeqPerm := 1;

          If cAccess <> '' then
          begin
             mm.varA_MenuBasicsPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cAccess  ;
             Inc( pSeqPerm );
          end;
          If cInsert <> '' then
          begin
             mm.varA_MenuBasicsPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cInsert ;
             Inc( pSeqPerm );
          end;
          If cEdit <> '' then
          begin
             mm.varA_MenuBasicsPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cEdit   ;
             Inc( pSeqPerm );
          end;
          If cDelete <> '' then
          begin
             mm.varA_MenuBasicsPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cDelete;
             Inc( pSeqPerm );
          end;
          If cMaster <> '' then
             mm.varA_MenuBasicsPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cMaster ;
        end
        else
        if ( pMenuGroup = 'M' ) then
        begin
          SetLength( mm.varA_MenuMovementPermissions, Length( mm.varA_MenuMovementPermissions ) + iLength  );

          pSeq     := Length( mm.varA_MenuMovement ) ;
          pSeqPerm := Length( mm.varA_MenuMovementPermissions ) - iLength ;
          if pSeqPerm = 0 then
             pSeqPerm := 1;

          If cAccess <> '' then
          begin
             mm.varA_MenuMovementPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cAccess  ;
             Inc( pSeqPerm );
          end;
          If cInsert <> '' then
          begin
             mm.varA_MenuMovementPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cInsert ;
             Inc( pSeqPerm );
          end;
          If cEdit <> '' then
          begin
             mm.varA_MenuMovementPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cEdit   ;
             Inc( pSeqPerm );
          end;
          If cDelete <> '' then
          begin
             mm.varA_MenuMovementPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cDelete;
             Inc( pSeqPerm );
          end;
          If cMaster <> '' then
             mm.varA_MenuMovementPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cMaster ;
        end
        else
        if ( pMenuGroup = 'R' ) then
        begin
          SetLength( mm.varA_MenuReportPermissions, Length( mm.varA_MenuReportPermissions ) + iLength  );

          pSeq     := Length( mm.varA_MenuReport ) ;
          pSeqPerm := Length( mm.varA_MenuReportPermissions ) - iLength ;
          if pSeqPerm = 0 then
             pSeqPerm := 1;

          If cAccess <> '' then
          begin
             mm.varA_MenuReportPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cAccess  ;
             Inc( pSeqPerm );
          end;
          If cInsert <> '' then
          begin
             mm.varA_MenuReportPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cInsert ;
             Inc( pSeqPerm );
          end;
          If cEdit <> '' then
          begin
             mm.varA_MenuReportPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cEdit   ;
             Inc( pSeqPerm );
          end;
          If cDelete <> '' then
          begin
             mm.varA_MenuReportPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cDelete;
             Inc( pSeqPerm );
          end;
          If cMaster <> '' then
             mm.varA_MenuReportPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cMaster ;
        end
        else
        if ( pMenuGroup = 'T' ) then
        begin
          SetLength( mm.varA_MenuToolsPermissions, Length( mm.varA_MenuToolsPermissions ) + iLength  );

          pSeq     := Length( mm.varA_MenuTools ) ;
          pSeqPerm := Length( mm.varA_MenuToolsPermissions ) - iLength ;
          if pSeqPerm = 0 then
             pSeqPerm := 1;

          If cAccess <> '' then
          begin
             mm.varA_MenuToolsPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cAccess  ;
             Inc( pSeqPerm );
          end;
          If cInsert <> '' then
          begin
             mm.varA_MenuToolsPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cInsert ;
             Inc( pSeqPerm );
          end;
          If cEdit <> '' then
          begin
             mm.varA_MenuToolsPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cEdit   ;
             Inc( pSeqPerm );
          end;
          If cDelete <> '' then
          begin
             mm.varA_MenuToolsPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cDelete;
             Inc( pSeqPerm );
          end;
          If cMaster <> '' then
             mm.varA_MenuToolsPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cMaster ;
        end
        else
        if ( pMenuGroup = 'O' ) then
        begin
          SetLength( mm.varA_MenuOptionsPermissions, Length( mm.varA_MenuOptionsPermissions ) + iLength  );

          pSeq     := Length( mm.varA_MenuOptions ) ;
          pSeqPerm := Length( mm.varA_MenuOptionsPermissions ) - iLength ;
          if pSeqPerm = 0 then
             pSeqPerm := 1;

          If cAccess <> '' then
          begin
             mm.varA_MenuOptionsPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cAccess  ;
             Inc( pSeqPerm );
          end;
          If cInsert <> '' then
          begin
             mm.varA_MenuOptionsPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cInsert ;
             Inc( pSeqPerm );
          end;
          If cEdit <> '' then
          begin
             mm.varA_MenuOptionsPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cEdit   ;
             Inc( pSeqPerm );
          end;
          If cDelete <> '' then
          begin
             mm.varA_MenuOptionsPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cDelete;
             Inc( pSeqPerm );
          end;
          If cMaster <> '' then
             mm.varA_MenuOptionsPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + cMaster ;
        end;
     end
     else
     begin
        if ( pMenuGroup = '' ) or ( pMenuGroup = 'B' ) then
        begin
          SetLength( mm.varA_MenuBasicsPermissions, Length( mm.varA_MenuBasicsPermissions ) + 1 );
          pSeq     := Length( mm.varA_MenuBasics ) ;
          pSeqPerm := Length( mm.varA_MenuBasicsPermissions ) - 1 ;
          mm.varA_MenuBasicsPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + pItem ;
        end
        else
        if ( pMenuGroup = 'M' ) then
        begin
          SetLength( mm.varA_MenuMovementPermissions, Length( mm.varA_MenuMovementPermissions ) + 1 );
          pSeq     := Length( mm.varA_MenuMovement ) ;
          pSeqPerm := Length( mm.varA_MenuMovementPermissions ) - 1 ;
          mm.varA_MenuMovementPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + pItem ;
        end
        else
        if ( pMenuGroup = 'R' ) then
        begin
          SetLength( mm.varA_MenuReportPermissions, Length( mm.varA_MenuReportPermissions ) + 1 );
          pSeq     := Length( mm.varA_MenuReport ) ;
          pSeqPerm := Length( mm.varA_MenuReportPermissions ) - 1 ;
          mm.varA_MenuReportPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + pItem ;
        end
        else
        if ( pMenuGroup = 'T' ) then
        begin
          SetLength( mm.varA_MenuToolsPermissions, Length( mm.varA_MenuToolsPermissions ) + 1 );
          pSeq     := Length( mm.varA_MenuTools ) ;
          pSeqPerm := Length( mm.varA_MenuToolsPermissions ) - 1 ;
          mm.varA_MenuToolsPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + pItem ;
        end
        else
        if ( pMenuGroup = 'O' ) then
        begin
          SetLength( mm.varA_MenuOptionsPermissions, Length( mm.varA_MenuOptionsPermissions ) + 1 );
          pSeq     := Length( mm.varA_MenuOptions ) ;
          pSeqPerm := Length( mm.varA_MenuOptionsPermissions ) - 1 ;
          mm.varA_MenuOptionsPermissions[ pSeqPerm ] := IntToStr( pSeq - 1 ) + '.' + pItem ;
        end;
     end;
end;
// _pasta é pra SEPARAR os arquivos de cada categoria do MENU
procedure rc_BuildHTMLMENU( pMenuList : array of string ) ;
var
   I      : integer;
   vItem_prior,
   vItem : string;
begin
    vItem_prior := ' ';
    I := 1;

    //mm.varSL_HtmlMenu.Add( '          <ul class="treeview-menu">' );
    //mm.varSL_HtmlMenu.Add( '            <!-- <li><a href="#"><i class="fa fa-circle-o"></i> Opção avulsa</a></li> -->' );
    while ( I <= High( pMenuList ) ) do
    begin
         vItem_prior := pMenuList[ i - 1 ];
         vItem := pMenuList[ i ];

         // montar o Array com as informacoes do MENU e sua respectiva TABELA
         if Copy( vItem , 1, 1 ) = ']' then
         begin
              mm.varSL_HtmlMenu.Add( '             <li class="treeview">' );
              mm.varSL_HtmlMenu.Add( '                 <a href="#"><i class="fa fa-circle-o text-yellow"></i> ' + Copy( vItem , 2, 50 ) );
              mm.varSL_HtmlMenu.Add( '                    <span class="pull-right-container">' );
              mm.varSL_HtmlMenu.Add( '                     <i class="fa fa-angle-left pull-right"></i>' );
              mm.varSL_HtmlMenu.Add( '                    </span>' );
              mm.varSL_HtmlMenu.Add( '                 </a>' );

              mm.varSL_HtmlMenu.Add( '                 <ul class="treeview-menu">' );

              vItem_prior := pMenuList[ i ];
              // processa até o próximo SUBMENU
              Repeat
                    Inc( I );

                    if ( I <= High( pMenuList ) ) then
                    begin
                       vItem := pMenuList[ i ];

                       if Pos( '|', vItem ) > 0 then
                       begin
                            mm.varA_FSideMenu[ mm.varI_NumMenu ].option  := Trim( Copy( vItem , 1, Pos( '|', vItem ) - 1 ) );
                            mm.varA_FSideMenu[ mm.varI_NumMenu ].table := Trim( Copy( vItem , Pos( '|', vItem ) + 1, 100 ) );
                            mm.varA_FSideMenu[ mm.varI_NumMenu ].image := 'fas fa-circle-o'; // 6.0.0.0

                            // estou ASSUMINDO mainpage? pra tentar CENTRALIZAR tudo
                            if mm.varC_MenuGroup <> 'relatorios' then
                               mm.varSL_HtmlMenu.Add( '                    <li><a href="#" onclick="ajaxRequest( MainForm.hfMain , ''menuprincipal'' , [ page=' + mm.varA_FSideMenu[ mm.varI_NumMenu ].option + ', table=' + mm.varA_FSideMenu[ mm.varI_NumMenu ].table + ' ] )"><i class="' + mm.varA_FSideMenu[ mm.varI_NumMenu ].image + '"></i> ' + mm.varA_FSideMenu[ mm.varI_NumMenu ].option + '</a></li>' )
                            else
                               mm.varSL_HtmlMenu.Add( '                    <li><a href="#" onclick="ajaxRequest( MainForm.hfMain , ''relatorios'' , [ page=' + mm.varA_FSideMenu[ mm.varI_NumMenu ].option + ', table=' + mm.varA_FSideMenu[ mm.varI_NumMenu ].table + ' ] )"><i class="' + mm.varA_FSideMenu[ mm.varI_NumMenu ].image + '"></i> ' + mm.varA_FSideMenu[ mm.varI_NumMenu ].option + '</a></li>' );

                            Inc( mm.varI_NumMenu );
                       end;
                    end;
              Until ( Copy( vItem , 1, 1 ) = ']' ) or ( I > High( pMenuList ) );

              mm.varSL_HtmlMenu.Add( '                 </ul>' );
              mm.varSL_HtmlMenu.Add( '             </li>' );
         end;
    end;

    mm.varSL_HtmlMenu.Add( '            </li>' );
    mm.varSL_HtmlMenu.Add( '          </ul>');
end;
end.
