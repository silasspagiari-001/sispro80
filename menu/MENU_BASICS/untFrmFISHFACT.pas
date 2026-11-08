unit untFrmFISHFACT;//7.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniDBEdit, uniCheckBox, uniDBCheckBox, uniButton,
  uniBitBtn, uniSpeedButton, uniEdit, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDateTimePicker, uniDBDateTimePicker, uniLabel, uniPanel, uniScrollBox,
  uniPageControl, uniGUIBaseClasses, uniImageList, uniFileUpload, Vcl.Menus,
  uniMainMenu, Data.DB, uniRadioGroup, uniDBRadioGroup, uniMemo, uniDBMemo,
  uniDBText, uniBasicGrid, uniDBGrid, uniStatusBar, uniDBNavigator, uniImage,
  uniDBImage, Datasnap.DBClient;

type
  TExUniCustomDBGrid = class (TUniCustomDBGrid)
  end;

type
  TfrmFishFact = class(TUniFrame)
    DataSource1: TDataSource;
    UniFileUpload1: TUniFileUpload;
    UniNativeImageList1: TUniNativeImageList;
    ClientDataSet: TClientDataSet;
    sboxFishFact: TUniScrollBox;
    rcBlock450: TUniContainerPanel;
    stBar: TUniStatusBar;
    rcBlock400: TUniContainerPanel;
    UniDBEdit1: TUniDBEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel7: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniDBEdit4: TUniDBEdit;
    UniLabel3: TUniLabel;
    UniDBText1: TUniDBText;
    UniDBComboBox1: TUniDBComboBox;
    UniContainerPanel3: TUniContainerPanel;
    UniLabel8: TUniLabel;
    rcBlock410: TUniContainerPanel;
    UniDBNavigator1: TUniDBNavigator;
    UniBitBtn1: TUniBitBtn;
    UniBitBtn2: TUniBitBtn;
    UniContainerPanel2: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniDBImage1: TUniDBImage;
    rcBlock420: TUniContainerPanel;
    UniDBRadioGroup1: TUniDBRadioGroup;
    UniContainerPanel1: TUniContainerPanel;
    UniLabel4: TUniLabel;
    rcBlock430: TUniContainerPanel;
    UniContainerPanel4: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBMemo1: TUniDBHTMLMemo;
    rcBlock440: TUniContainerPanel;
    dbgFish: TUniDBGrid;
    procedure UniFrameCreate(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure UniFrameReady(Sender: TObject);
    procedure dbgFishDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure dbgFishCellClick(Column: TUniDBGridColumn);
    procedure UniFrameDestroy(Sender: TObject);
    procedure dbgFishColumnFilter(Sender: TUniDBGrid;
      const Column: TUniDBGridColumn; const Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

implementation

{$R *.dfm}

uses untdm_rc, mkm_layout, uconsts, uconsts_cfg, mkm_func_web, str_func, Main;

procedure TfrmFishFact.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  try
     stBar.Panels[0].Text:=DataSource1.DataSet.FieldByName('species no').AsString;
     stBar.Panels[1].Text:=DataSource1.DataSet.FieldByName('common_name').AsString;
  except
    on E: Exception do
    begin
      if Pos('midas.dll', LowerCase(E.Message)) > 0 then
        MessageDlgN('Required file "Midas.DLL" not found.<br>' +
                    'Please make sure this file is deployed with your application.<br>'+
                    E.Message,
                    mtError, [mbOK]
                    )
      else
        raise;
    end;
  end;
end;

procedure TfrmFishFact.dbgFishCellClick(Column: TUniDBGridColumn);
begin
// cria um CSS pra celula que foi clicada
//   unisession.addJS( 'Ext.util.CSS.createStyleSheet("'+
//      '#'+ UniDBGrid1.JSName+'_id .x-grid-cell-selected {' +
//      ' font-weight: bold;' +
//      ' background-color: yellow !important;' +
//      ' color:red;'+
//      '}")' );
end;

procedure TfrmFishFact.dbgFishColumnFilter(Sender: TUniDBGrid; const Column: TUniDBGridColumn; const Value: Variant);
var
  V : Variant;
  I : Integer;
  cFieldName, lvFilter : string;
  dDate : TDate;
begin
  inherited;
//  if TUniDBGrid(Sender).DataSet.Active then //  sqlSearchMaster.Active then
//  begin
//    for I := 0 to Sender.Columns.Count - 1  do
//    begin
//      if Sender.Columns[I].Filtering.Enabled then
//      begin
//        V := Trim(VarToStrDef(Sender.Columns[I].Filtering.VarValue, ''));
//        if V <> '' then
//        begin
//          //flavio 31/08/2022
//          cFieldName := lowercase( RemoveAccents( Sender.Columns[I].FieldName ) );
//          if DataTypeIsNumber( Sender.Columns[I].Field.DataType ) then
//          begin
//             If StrToIntDef( VarToStr( V ), -1 ) >= 0 then
//             begin
//                if lvFilter = '' then
//                  lvFilter := '(' + cFieldName + ' = ' + V + ')'
//                else
//                  lvFilter := lvFilter + ' and (' + cFieldName + ' = ' + V + ')'
//             end;
//          end
//          else
//          if DataTypeIsString( Sender.Columns[I].Field.DataType ) then
//          begin
//             if lvFilter = '' then
//               lvFilter := '(' + cFieldName + ' like ' + QuotedStr( '%' + V + '%' ) + ')'
//             else
//               lvFilter := lvFilter + ' and (' + cFieldName + ' like ' + QuotedStr( '%' + V + '%' ) + ')';
//
//             lvFilter := '( ' + lvFilter + ') or (' + cFieldName + ' like ' + QuotedStr( '%' + AnsiUpperCase ( V ) + '%' ) + ')'
//          end
//          else
//          if DataTypeIsDateTime( Sender.Columns[I].Field.DataType ) then
//          begin
//             try
//                if ( rc_IsValidDate( V ) ) then
//                begin
//                  try
//                    dDate := VarToDateTime( V );
//                  except
//                    dDate := 0;
//                  end;
//
//                  if ( YearOf( dDate ) > 1900 ) then
//                  begin
//                    if lvFilter = '' then
//                      lvFilter := '(' + cFieldName + ' = ' + QuotedStr( FormatDateTime( StringReplace( mm.APP_SQL_DATE_FORMAT, '.', '/', [rfReplaceAll] ), dDate ) + ' 00:00:00' ) + ')'
//                    else
//                      lvFilter := lvFilter + ' and (' + cFieldName + ' = ' + QuotedStr( FormatDateTime( StringReplace( mm.APP_SQL_DATE_FORMAT, '.', '/', [rfReplaceAll] ), dDate ) + ' 00:00:00' ) + ')'
//                  end;
//                end;
//             except
//             end;
//          end;
//        end;
//      end;
//    end;
//    sqlSearchMaster.Filtered := False;
//    if lvFilter <> '' then
//    begin
//      sqlSearchMaster.Filter := lvFilter;
//      sqlSearchMaster.Filtered := True;
//    end;
//  end;
end;

procedure TfrmFishFact.dbgFishDrawColumnCell(Sender: TObject; ACol, ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
     dm_rc.rc_GridDrawCell( TUniDBGrid( sender ) , ACol, ARow, Column, Attribs ) ;

end;
//8.0.0.0
procedure TfrmFishFact.UniFrameCreate(Sender: TObject);
var
   i : integer;
begin
  dbgFish.Hint := '[[' +
                  'fieldmasks:' +
                  'grid-resize|'+
                  'grid-paginator:center|' +

                  'species no[[' +
                  '     width:10% mobile-h:0% mobile-v:0%|' +
                  '     visible:false mobile]];' +

                  'category[[' +
                  '     width:10% mobile-h:0% mobile-v:0%|' +
                  '     visible:false mobile]];' +

                  'common_Name[[' +
                  '     width:10% mobile-h:70% mobile-v:70%]];' +

                  'notes[[' +
                  '     displaymemo|' +
                  '     visible:false mobile|' +
                  '     width:40% mobile-h:0% mobile-v:0%]];' +

                  'length (cm)[[' +
                  '     width:10% mobile-h:0% mobile-v:0%|' +
                  '     visible:false mobile]];' +

                  'length_in[[' +
                  '     width:10% mobile-h:0% mobile-v:0%|' +
                  '     visible:false mobile]];' +

                  'graphic[[' +
                  '     width:10% mobile-h:30% mobile-v:30%]];|' +

                  'anchor: |' +
                  'cls:rc-grid-column-height-22|' +
                  ']]' ;




     //7.3.0.0
    // rc_AddCssClass( dbNav, 'customNav' );

     // para frames, não precisa efetuar o ResizeBlocks | for frames, no need to perform ResizeBlocks
     rc_RenderLayout( Self, false, false, true, true, True, true );


   //for I := 0 to dbgFish.Columns.Count-1 do
//   begin
//       dbgFish.Columns[0].Title.Color := clNavy;
//       dbgFish.Columns[0].Title.Font.Color := clWhite;
//
//       dbgFish.Columns[1].Title.Color := clMaroon;
//       dbgFish.Columns[1].Title.Font.Color := clWhite;
//   end;

//   dbgFish.Columns[0].Title.Color := clNavy;
//   dbgFish.Columns[0].Title.Font.Color := clWhite;
//
//   dbgFish.Columns[1].Title.Color := clMaroon;
//   dbgFish.Columns[1].Title.Font.Color := clWhite;

   //TExUniCustomDBGrid(dbgFish).DoConfigureJSColumns(dbgFish.DataSource.DataSet);

end;

procedure TfrmFishFact.UniFrameDestroy(Sender: TObject);
begin
   UniDBEdit1.JSInterface.JSCallGlobal('Ext.util.CSS.removeStyleSheet', [ UniDBEdit1.JSName+'_css' ]);
end;

procedure TfrmFishFact.UniFrameReady(Sender: TObject);
begin
    dm_rc.rc_ResizeBlocks( Self, true, true );

    //[PT] para forms/frames que não herdam do frmBaseCRUD e contenham GRIDS
    //[EN] for forms/frames that do not inherit from frmBaseCRUD and contain GRIDS
    dm_rc.rc_DBGridUpdateAll( Self , false, false, true);

end;

initialization

  RegisterClass( TfrmFishFact );

end.
