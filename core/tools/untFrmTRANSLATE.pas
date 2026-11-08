unit untFrmTRANSLATE; //8.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, System.TypInfo,

  // feedback: Mesut from Turkey
  {$ifdef LINUX}
  System.UIConsts,
  {$endif}

  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniBasicGrid,
  uniDBGrid, uniEdit, uniLabel, uniButton, uniBitBtn, uniMemo,

  IniFiles,

  uniHTMLFrame, uniImage, uniColorButton, uniColorPalette, Vcl.Imaging.jpeg,
  uniScrollBox, uniMultiItem, uniComboBox, uniCheckBox, uniSpinEdit,
  uniPropertyGrid, uniStringGrid, uniPageControl;

type
  TfrmTranslate = class(TUniForm)
    UniContainerPanel16: TUniContainerPanel;
    UniScrollBox1: TUniScrollBox;
    paGridB: TUniContainerPanel;
    UniContainerPanel22: TUniContainerPanel;
    mmContent: TUniMemo;
    cbForm: TUniComboBox;
    btnSave: TUniBitBtn;
    bntCancel: TUniBitBtn;
    btnDelForm: TUniBitBtn;
    cbLanguage: TUniComboBox;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    labTitleFrm: TUniLabel;
    btnExit: TUniBitBtn;
    paOptions: TUniContainerPanel;
    pgTranslateOptions: TUniPageControl;
    tabMenus: TUniTabSheet;
    sgMenus: TUniStringGrid;
    tabForms: TUniTabSheet;
    sgProps: TUniStringGrid;
    procedure UniFormShow(Sender: TObject);
    procedure UniFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UniFormCreate(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure sgPropsSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cbLanguageChange(Sender: TObject);
    procedure cbFormChange(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure bntCancelClick(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure btnDelFormClick(Sender: TObject);
    procedure pgTranslateOptionsChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    vOldContent : string;

    procedure rc_RefreshFormList;
    procedure rc_DeleteFormList( cForm : string );
    procedure rc_RefreshTranslateItems;
  end;

function frmTranslate: TfrmTranslate;

implementation

{$R *.dfm}

uses
  uniGUIApplication, ServerModule, MainModule, uconsts, uconsts_cfg,
  Main, mkm_func_web, untdm_rc, mkm_layout, mkm_anim, mkm_translate, str_func;

function frmTranslate: TfrmTranslate;
begin
  Result := TfrmTranslate(mm.GetFormInstance(TfrmTranslate));
end;

procedure TfrmTranslate.cbFormChange(Sender: TObject);
begin
     if ( cbForm.Text <> '' ) and ( cbLanguage.Text <> '' ) then
     begin
        pgTranslateOptions.ActivePageIndex := 1;
        rc_RefreshTranslateItems;
     end;
end;
// 6.0.0.0
procedure TfrmTranslate.cbLanguageChange(Sender: TObject);
var
   i : integer;
begin
     i := cbform.ItemIndex;
     if( cbLanguage.Text <> '' ) then
     begin
        cbLanguage.Text := dm_rc.rc_StripHtmlTags( cbLanguage.Text );
        rc_RefreshFormList;
        if i >= 0 then
        begin
           cbform.ItemIndex := i;
           rc_RefreshTranslateItems;
        end;
     end;
end;

procedure TfrmTranslate.pgTranslateOptionsChange(Sender: TObject);
begin
     if pgTranslateOptions.ActivePage = tabMenus then
        rc_RefreshTranslateItems;
end;

procedure TfrmTranslate.rc_RefreshFormList;
var
   i : integer;
   cTemp : string;
   vSR: TSearchRec;
begin
  cTemp := cbLanguage.Text;
  cTemp := sm.FilesFolderPath + 'translate' + mm.BACKSLASH + cTemp ;

  cbForm.Items.Clear;
  cbForm.ItemIndex := -1;
  I := FindFirst( cTemp + mm.BACKSLASH + '*.ini' , faAnyFile, vSR );
  while I = 0 do
  begin
    cbForm.Items.Add( ChangeFileExt(vSR.Name, '' ) );
    I := FindNext( vSR );
  end;

  FindClose(vSR);

  cbForm.ItemIndex := 0;
  rc_RefreshTranslateItems;

end;

procedure TfrmTranslate.rc_DeleteFormList( cForm : string );
var
   i : integer;
   cTemp : string;
begin
  for i := 0 to cbLanguage.Items.Count - 1 do
  begin
       cbLanguage.ItemIndex := i;
       cbLanguage.Text := dm_rc.rc_StripHtmlTags( cbLanguage.Text );
       cTemp := cbLanguage.Text;
       cTemp := sm.FilesFolderPath + 'translate' + mm.BACKSLASH + cTemp + mm.BACKSLASH + cForm + '.ini' ;

       if Fileexists( cTemp ) then
          DeleteFile( cTemp );
  end;
  cbForm.ItemIndex := 0;
  rc_RefreshFormList; // 6.0.0.0
  rc_RefreshTranslateItems;
end;

procedure TfrmTranslate.rc_RefreshTranslateItems;
var
   i, f, s, iBrackets, iSections:          integer;
   IniFile: TMemIniFile;
   sl : TStrings;

   cGroup, cOption,cOptionTranlated, cTmp,
   cTemp, cProp, cContent : string;

   aSections : Array [1..10] of String;
begin
  i := 0;
  iSections := 1;
  aSections[ 01 ] := 'caption';
  if pgTranslateOptions.ActivePage = tabForms then
  begin
    aSections[ 02 ] := 'screenmask.message';
    aSections[ 03 ] := 'emptytext';
    aSections[ 04 ] := 'text';
    aSections[ 05 ] := 'items';
    aSections[ 06 ] := 'grid-col-caption';
    aSections[ 07 ] := 'grid-header';
    aSections[ 08 ] := 'lkpfilter-empty';
    aSections[ 09 ] := 'guide-title';
    aSections[ 10 ] := 'guide-text';
    iSections := Length( aSections );
  end;

  cTemp := cbLanguage.Text;
  cTemp := sm.FilesFolderPath + 'translate' + mm.BACKSLASH + cTemp ;
  if pgTranslateOptions.ActivePage = tabForms then
     cTemp := cTemp + mm.BACKSLASH + lowercase( cbForm.Text ) + '.ini'
  else
     cTemp := cTemp + mm.BACKSLASH + 'menu' + '.ini';

  try
     IniFile := TMemIniFile.Create( cTemp, TEncoding.UTF8 );
     try
       if ( pgTranslateOptions.ActivePage = tabForms ) then
       begin
          sgProps.BeginUpdate;
          sgProps.RowCount := 1000;
       end
       else
       begin
          sgMenus.BeginUpdate;
          sgMenus.RowCount := 1000;
       end;
       try
         i := -1;
         f := 0;
         for s := 1 to iSections do
         begin
             sl := TstringList.Create;
             cGroup := aSections[ s ];
             IniFile.ReadSectionValues( cGroup , sl );
             //generate new menu.ini ?
             if ( pgTranslateOptions.ActivePage = tabMenus ) and ( not IniFile.SectionExists( cGroup ) ) then
             begin
                for I := 1 to Length( mm.varA_MenuBasics ) - 1 do
                begin
                     Inc( f );
                     cOption   := mm.varA_MenuBasics[i];
                     iBrackets := strTokenCount( cOption, ']' ) - 1;
                     cTmp      := Copy( cOption, 1, iBrackets );
                     cOption   := Trim(Copy( cOption, iBrackets + 1 ) );
                     cOption   := dm_rc.rc_ClearMenuParams( cOption );
                     cTmp      := stringReplace( rc_StripHtmlTags(cOption) , ' ', '_', [rfReplaceAll] );
                     cTmp      := RemoveAccents( cTmp );
                     sgMenus.Tag := f;
                     if ( ReturnNumbers( Copy( cOption, 1, 1 ) ) <> '' ) or ( ReturnLetters( Copy( cOption, 1, 1 ) ) <> '' ) then
                        IniFile.WriteString( cGroup , 'option_' + cTmp , cOption );
                        //IniFile.WriteString( cGroup , 'option_' + f.ToString , cOption );
                end;
                for I := 1 to Length( mm.varA_MenuMovement ) - 1 do
                begin
                     Inc( f );
                     cOption   := mm.varA_MenuMovement[i];
                     iBrackets := strTokenCount( cOption, ']' ) - 1;
                     cTmp      := Copy( cOption, 1, iBrackets );
                     cOption   := Trim(Copy( cOption, iBrackets + 1 ) );
                     cOption   := dm_rc.rc_ClearMenuParams( cOption );
                     cTmp      := stringReplace( rc_StripHtmlTags(cOption) , ' ', '_', [rfReplaceAll] );
                     cTmp      := RemoveAccents( cTmp );
                     sgMenus.Tag := f;
                     if ( ReturnNumbers( Copy( cOption, 1, 1 ) ) <> '' ) or ( ReturnLetters( Copy( cOption, 1, 1 ) ) <> '' ) then
                        IniFile.WriteString( cGroup , 'option_' + cTmp , cOption );
                        //IniFile.WriteString( cGroup , 'option_' + f.ToString , cOption );
                end;
                for I := 1 to Length( mm.varA_MenuReport ) - 1 do
                begin
                     Inc( f );
                     cOption   := mm.varA_MenuReport[i];
                     iBrackets := strTokenCount( cOption, ']' ) - 1;
                     cTmp      := Copy( cOption, 1, iBrackets );
                     cOption   := Trim(Copy( cOption, iBrackets + 1 ) );
                     cOption   := dm_rc.rc_ClearMenuParams( cOption );
                     cTmp      := stringReplace( rc_StripHtmlTags(cOption) , ' ', '_', [rfReplaceAll] );
                     cTmp      := RemoveAccents( cTmp );
                     sgMenus.Tag := f;
                     if ( ReturnNumbers( Copy( cOption, 1, 1 ) ) <> '' ) or ( ReturnLetters( Copy( cOption, 1, 1 ) ) <> '' ) then
                        IniFile.WriteString( cGroup , 'option_' + cTmp , cOption );
                        //IniFile.WriteString( cGroup , 'option_' + f.ToString , cOption );
                end;
                for I := 1 to Length( mm.varA_MenuTools ) - 1 do
                begin
                     Inc( f );
                     cOption   := mm.varA_MenuTools[i];
                     iBrackets := strTokenCount( cOption, ']' ) - 1;
                     cTmp      := Copy( cOption, 1, iBrackets );
                     cOption   := Trim(Copy( cOption, iBrackets + 1 ) );
                     cOption   := dm_rc.rc_ClearMenuParams( cOption );
                     cTmp      := stringReplace( rc_StripHtmlTags(cOption) , ' ', '_', [rfReplaceAll] );
                     cTmp      := RemoveAccents( cTmp );
                     sgMenus.Tag := f;
                     if ( ReturnNumbers( Copy( cOption, 1, 1 ) ) <> '' ) or ( ReturnLetters( Copy( cOption, 1, 1 ) ) <> '' ) then
                        IniFile.WriteString( cGroup , 'option_' + cTmp , cOption );
                        //IniFile.WriteString( cGroup , 'option_' + f.ToString , cOption );
                end;
                for I := 1 to Length( mm.varA_MenuOptions ) - 1 do
                begin
                     Inc( f );
                     cOption   := mm.varA_MenuOptions[i];
                     iBrackets := strTokenCount( cOption, ']' ) - 1;
                     cTmp      := Copy( cOption, 1, iBrackets );
                     cOption   := Trim(Copy( cOption, iBrackets + 1 ) );
                     cOption   := dm_rc.rc_ClearMenuParams( cOption );
                     cTmp      := stringReplace( rc_StripHtmlTags(cOption) , ' ', '_', [rfReplaceAll] );
                     cTmp      := RemoveAccents( cTmp );
                     sgMenus.Tag := f;
                     if ( ReturnNumbers( Copy( cOption, 1, 1 ) ) <> '' ) or ( ReturnLetters( Copy( cOption, 1, 1 ) ) <> '' ) then
                        IniFile.WriteString( cGroup , 'option_' + cTmp , cOption );
                        //IniFile.WriteString( cGroup , 'option_' + f.ToString , cOption );
                end;
                //[PT] o uso do TMemIniFile requer a gravação física em disco. Esse recurso foi usado para compatibilizar o uso de vários idiomas
                //      o uso de vários idiomas e seus respectivos caracteres. Após configurar suas traduções, você pode comentar o bloco "try" abaixo.
                //[EN] the use of TMemIniFile requires physical recording on disk. This feature was used to support the use of multiple languages
                // the use of multiple languages and their respective characters. After setting up your translations, you can comment out the "try" block below.
                try
                   IniFile.UpdateFile;
                except on e:exception do
                       begin
                            dm_rc.rc_ShowError( 'rc_Translate( Menu UpdateFile )' );
                       end;
                end;
                IniFile.Free;
                IniFile := TMemIniFile.Create( cTemp, TEncoding.UTF8 );
                i:= -1;
                IniFile.ReadSectionValues( cGroup , sl );
             end;

             if sl.Count > 0 then
             begin
               if i > 0 then
               begin
                  Inc( i );
                  if ( pgTranslateOptions.ActivePage = tabForms ) then
                  begin
                     sgProps.Cells[ 0, i ] := '';
                     sgProps.Cells[ 1, i ] := '';
                  end
                  else
                  begin
                     sgMenus.Cells[ 0, i ] := '';
                     sgMenus.Cells[ 1, i ] := '';
                  end;
               end;
               Inc( i );
               if ( pgTranslateOptions.ActivePage = tabForms ) then
               begin
                  sgProps.Cells[ 0, i ] := '<i class="fas fa-dot-circle fa-1x rc-translate-group">&nbsp;' + '<spam class="rc-font-theme">' + UpperCase( cGroup ) + '</span></i>';
                  sgProps.Cells[ 1, i ] := '';
               end
               else
               begin
                  sgMenus.Cells[ 0, i ] := '<i class="fas fa-dot-circle fa-1x rc-translate-group">&nbsp;' + '<spam class="rc-font-theme">' + UpperCase( cGroup ) + '</span></i>';
                  sgMenus.Cells[ 1, i ] := '';
               end;
               for f := 0 to sl.Count - 1   do
               begin
                  cProp    := Copy( sl.Strings[ f ] , 1, Pos( '=', sl.Strings[ f ] ) - 1);
                  cTemp     := cProp;
                  cProp    := StringReplace( Copy( cProp, Pos( '.', cProp ) + 1, 200 ), '.' + cGroup, '', [rfReplaceAll] );
                  cContent := Copy( sl.Strings[ f ] , Pos( '=', sl.Strings[ f ] ) + 1, 2000 );
                  Inc( i );
                  if ( pgTranslateOptions.ActivePage = tabForms ) then
                  begin
                     sgProps.Cells[ 0, i ] := cProp;
                     sgProps.Cells[ 1, i ] := cContent;
                     sgProps.Cells[ 2, i ] := cGroup;
                     sgProps.Cells[ 3, i ] := cTemp;
                  end
                  else
                  begin
                     sgMenus.Cells[ 0, i ] := cProp;    //option_grupo_de_opcoes
                     sgMenus.Cells[ 1, i ] := cContent; //grupo de opções
                     sgMenus.Cells[ 2, i ] := cGroup;   //'caption'
                     sgMenus.Cells[ 3, i ] := cTemp;    //option_grupo_de_opcoes
                  end;
               end;
             end;
             sl.Free;
         end;
       finally
         if ( pgTranslateOptions.ActivePage = tabForms ) then
         begin
            sgProps.RowCount := i + 1 ;
            sgProps.EndUpdate;
         end
         else
         begin
            sgMenus.RowCount := i + 1 ;
            sgMenus.EndUpdate;
         end;
       end;
     finally
       IniFile.Free;
     end;
  except on e:exception do
         begin
              dm_rc.rc_ShowError( e.Message );
         end;
  end;
end;

procedure TfrmTranslate.sgPropsSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
     mmContent.Lines.Clear;
     if pgTranslateOptions.ActivePage = tabForms then
        mmContent.Lines.Text := sgProps.Cells[ 1, aRow ]
     else
        mmContent.Lines.Text := sgMenus.Cells[ 1, aRow ];

     vOldContent          := mmContent.Lines.Text;

     if pgTranslateOptions.ActivePage = tabForms then
        sgProps.tag := aRow
     else
        sgMenus.tag := aRow;
end;

procedure TfrmTranslate.btnExitClick(Sender: TObject);
begin
     mm.varB_Yes := False;
     mm.varB_No := True;
     Self.ModalResult := mrNone;

     rc_jQueryAnimate( Self, 'left' , IntTostr( UniSession.UniApplication.ScreenWidth ), '200', '', '', '', '', '',
                             'ajaxRequest( ' + MainForm.htmlFrame.JSName + ' , "_CloseForm", ["form=" + ' + QuotedStr( Self.Name ) + '] );' );
end;

procedure TfrmTranslate.btnSaveClick(Sender: TObject);
var
   IniFile : TMemIniFile;
   cTemp,cTmp   : string;
begin
(*
  sgMenus.Cells[ 0, i ] := cProp;    //option_grupo_de_opcoes
  sgMenus.Cells[ 1, i ] := cContent; //grupo de opções
  sgMenus.Cells[ 2, i ] := cGroup;   //'caption'
  sgMenus.Cells[ 3, i ] := cTemp;    //option_grupo_de_opcoes
*)
  if pgTranslateOptions.ActivePage = tabForms then
     sgProps.Cells[ 1, sgProps.Tag ] := RemoveLineBreaks ( mmContent.Text )
  else
     sgMenus.Cells[ 1, sgMenus.Tag ] := RemoveLineBreaks ( mmContent.Text );

  cTemp := cbLanguage.Text;
  cTemp := sm.FilesFolderPath + 'translate' + mm.BACKSLASH + cTemp ;
  if pgTranslateOptions.ActivePage = tabForms then
     cTemp := cTemp + mm.BACKSLASH + lowercase( cbForm.Text ) + '.ini'
  else
     cTemp := cTemp + mm.BACKSLASH + 'menu' + '.ini';
                                                        //1
  IniFile := TMemIniFile.Create( cTemp, TEncoding.UTF8 );
  if pgTranslateOptions.ActivePage = tabForms then
     IniFile.WriteString( sgProps.Cells[ 2, sgProps.Tag ] , sgProps.Cells[ 3, sgProps.Tag ] , sgProps.Cells[ 1, sgProps.Tag ] )
  else
  begin
     cTmp := stringReplace( rc_StripHtmlTags(sgMenus.Cells[ 3, sgMenus.Tag ]) , ' ', '_', [rfReplaceAll] );
     cTmp := RemoveAccents( cTmp );
     //IniFile.WriteString( sgMenus.Cells[ 2, sgMenus.Tag ] , sgMenus.Cells[ 3, sgMenus.Tag ] , sgMenus.Cells[ 1, sgMenus.Tag ] );
     IniFile.WriteString( 'caption' , cTmp , sgMenus.Cells[ 1, sgMenus.Tag ] );
  end;

  IniFile.UpdateFile;
  IniFile.Free;

  mmContent.Clear;
end;

procedure TfrmTranslate.bntCancelClick(Sender: TObject);
begin
     mmContent.Clear;
end;
//6.0.0.0
procedure TfrmTranslate.btnDelFormClick(Sender: TObject);
var
   i : integer;
begin
     dm_rc.rc_ShowYesNo( 'Remove translate file(s) ? <br><br>Application will restart to recreate translate files.');
     if mm.varB_Yes then
     begin
        i := cbLanguage.ItemIndex;
        if pgTranslateOptions.ActivePage = tabForms then
           rc_DeleteFormList( cbForm.Text )
        else
           rc_DeleteFormList( 'menu' );
        //dm_rc.rc_ShowSweetAlertSimple( 'File Removed!<br>' + 'Restart the application to recreate translate files.'  );
        //dm_rc.rc_ShowSuccess( 'File Removed!<br>' + 'Restart the application to recreate translate files.' );
        cbLanguage.ItemIndex := 0;//i;
        cbLanguage.Text := dm_rc.rc_StripHtmlTags( cbLanguage.Text );
        UniApplication.Restart;
     end;
end;

procedure TfrmTranslate.UniFormCreate(Sender: TObject);
var
   i, f : integer;
begin
    f := 0;
    // para formulários, deve-se efetuar o ResizeBlocks | For forms, resizeblocks should be made
    rc_RenderLayout( Self, true, true, true );

    // in development
    rc_Translate( Self, nil , '' , mm.CONFIG_LANGUAGE );

    cbLanguage.Items.Clear;
    for I := 1 to High( ARRAY_LANGUAGES ) do
    begin
         cbLanguage.Items.Add( '<a><span class="flag-icon flag-icon-' + ARRAY_LANGUAGES_FLAGS[i] + '"></span>' + ' ' + ARRAY_LANGUAGES[i] + '</a>' );

         if ( ARRAY_LANGUAGES[i] = mm.CONFIG_LANGUAGE ) then
            f := i;
    end;
    cbLanguage.ItemIndex := f-1;
    cbLanguage.Text := dm_rc.rc_StripHtmlTags( cbLanguage.Text );

    rc_RefreshFormList;

    sgProps.ColWidths[2] := 0;
    sgProps.ColWidths[3] := 0;
    sgMenus.ColWidths[2] := 0;
    sgMenus.ColWidths[3] := 0;

    dm_rc.rc_RenderControls( Self );
    dm_rc.rc_BootStrapRender( self );
    dm_rc.rc_AdjustEditColors ( Self );

    Self.Left := mm.varI_ScreenWidth + 600;
End;

procedure TfrmTranslate.UniFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 27 then
     begin
          mm.varB_Yes := False;
          mm.varB_No := True;
          Self.ModalResult := mrNone;
          Close;
     end;
end;

procedure TfrmTranslate.UniFormReady(Sender: TObject);
begin
     dm_rc.rc_ResizeBlocks( Self, true, true );
end;

procedure TfrmTranslate.UniFormShow(Sender: TObject);
begin

  inherited;

   Self.Height := mm.varI_ScreenHeight;
   Self.Top    := 0;

   rc_jQueryAnimate( Self, 'right' , IntTostr( Self.Left + self.Width ), '200' );
end;

end.


