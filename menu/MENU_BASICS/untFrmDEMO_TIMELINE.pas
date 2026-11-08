unit untFrmDEMO_TIMELINE; // 7.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniDBEdit, uniCheckBox, uniDBCheckBox, uniButton,
  uniBitBtn, uniSpeedButton, uniEdit, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDateTimePicker, uniDBDateTimePicker, uniLabel, uniPanel, uniScrollBox,
  uniPageControl, uniGUIBaseClasses, uniBasicGrid, uniDBGrid, uniListBox, uniDBLookupComboBox, uniImage, Vcl.Imaging.pngimage, uniImageList, uniHTMLFrame, uniMemo,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmDEMO_TIMELINE = class(TUniFrame)
    memTimeLine: TFDMemTable;
    dsMemTimeLine: TDataSource;
    rcBlock5: TUniContainerPanel;
    btSair: TUniLabel;
    labFormName: TUniLabel;
    imgLogo: TUniImage;
    UniHTMLFrame1: TUniHTMLFrame;
    sboxGridBlock: TUniScrollBox;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure UniHTMLFrame1AjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
  private
    { Private declarations }
  public
    { Public declarations }
    bResized : boolean;
    procedure rc_CreateTimeLine( pDataSet : TDataSet );
    procedure rc_CreateTimeLineZigZag( pDataSet : TDataSet );
  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, Main, mkm_layout, mkm_func_web, mkm_createcomponents, uconsts;

procedure TfrmDEMO_TIMELINE.btnCancelClick(Sender: TObject);
begin
     if mm.oPgGeneral <> nil then
        mm.oPgGeneral.ActivePage.Close;
end;
//7.0.0.0
procedure TfrmDEMO_TIMELINE.btSairClick(Sender: TObject);
begin
    dm_rc.rc_CloseFrame( Self, true );
//  dm_rc.rc_CloseQuerys( Self , False, False );
//  if Pos( 'frame-as-modal', Self.Hint ) = 0 then
//  begin
//     if mm.oPgGeneral <> nil then
//        mm.oPgGeneral.ActivePage.Close;
//  end
//  else
//  begin
//    Self.OwnerForm.ModalResult := mrNone;
//    Self.OwnerForm.Close;
//  end;
end;

procedure TfrmDEMO_TIMELINE.rc_CreateTimeLine(pDataSet: TDataSet);
var
   w, i, c, l : integer;
   oPaTrackL, oPaTrackR, oPaIcon, oBlock, oBlock2, oBlock3, oBlock4 : TUniContainerPanel;
   oLabel : TUniLabel;
   cItemLabel, cVersion, cIcon, cType, cDotCls, cTxtTypeCls : string;
   bLabelPRE, bLastLabelDescriptionIsBig : boolean;
   function getType( pType : string ) : string;
   begin
      if memTimeLine.FieldByName('type').AsString = 'n' then
         Result := 'new'
      else
      if memTimeLine.FieldByName('type').AsString = 'b' then
         Result := 'bugfix'
      else
      if memTimeLine.FieldByName('type').AsString = 'i' then
         Result := 'improvement'
      else
      if memTimeLine.FieldByName('type').AsString = 'f' then
         Result := 'improvement';
   end;
   function getDescription( var cItemLabel : string ) : boolean;
   begin
      //label item MONOSPACED
      cItemLabel := memTimeLine.FieldByName('description').AsString;
      Result     := Copy( cItemLabel, 1, 2 ) = '<>';
      cItemLabel := StringReplace( cItemLabel, '<>', '', [rfReplaceAll] );
      if ( not bLastLabelDescriptionIsBig ) then
         bLastLabelDescriptionIsBig := ( Result ) and ( Length( cItemLabel ) >= 42 );
   end;
   procedure createLabelDash( var oLabel : TUniLabel; pSymbol : string = '-' );
   begin
      oLabel := rc_CreateLabel( Self, oBlock3, 'rctimeline_dash' + i.ToString , 140, 20, 6, l, '', true, true);
      if bLabelPRE then
      begin
         oLabel.Left := 26;
         oLabel.Caption := pSymbol;
         oLabel.Hint    := '[[theme-color:off|cls:rc-label-clear rc-pre color-silver|scale:parent w:95%-left]]';
      end;
      oLabel.Font.Size      := 10;
      oLabel.TextConversion := txtHTML;
   end;
   procedure createLabelDescription( var oLabel : TUniLabel );
   begin
      if not bLabelPRE then
      begin
         l := l + 5;
         oBlock3.Height := oBlock3.Height + 5;
         if ( bLastLabelDescriptionIsBig ) then
         begin
            l := l + 5;
            oBlock3.Height := oBlock3.Height + 5;
            bLastLabelDescriptionIsBig := false;
         end;
      end;

      oLabel := rc_CreateLabel( Self, oBlock3, 'rctimeline_descrip' + i.ToString , 140, 20, 6, l, '' , true, true);
      if bLabelPRE then
      begin
         oLabel.Left := 40;
         oLabel.Caption := cItemLabel;
         oLabel.Hint    := '[[theme-color:off|cls:rc-label-clear rc-pre color-silver|scale:parent w:95%-left]]';
      end
      else
      begin
         oLabel.Caption := rc_MakeListItem( cItemLabel , litDot, cDotCls );
         oLabel.Hint    := '[[cls:color-gray|scale:parent w:95%-left]]';
      end;
      oLabel.Font.Size      := 10;
      oLabel.TextConversion := txtHTML;
      i := i + 1;
   end;
begin
    try
       i := 20;
       l := 0;
       w := 10; //first timeline block
       c := 0;
       cVersion := '';
       cType    := '';
       memTimeLine.First;
       while not memTimeLine.Eof do
       begin
            //label item MONOSPACED
            bLabelPRE := getDescription( cItemLabel );

            if ( cVersion <> memTimeLine.FieldByName('version').AsString ) then
            begin
                 cVersion := memTimeLine.FieldByName('version').AsString;
                 cType    := memTimeLine.FieldByName('type').AsString;
                 //version and date
                 Inc( w );
                 oBlock := rc_CreateBlock( Self, sboxGridBlock, w, 140 , 10, {'[[cols-debug:|}'[[cols-offset:0|cols:12|hide:mobile disable]]', true );
                 //oBlock.Color := clSkyBlue;
                 Inc( w );
                 oBlock := rc_CreateBlock( Self, sboxGridBlock, w, 140 , 60, {'[[cols-debug:|}'[[cols-offset:0|cols:3|hide:mobile disable]]', true );
                 //oBlock.Color := clMaroon;
                 Inc( w );
                 oBlock := rc_CreateBlock( Self, sboxGridBlock, w, 140 , 60, {'[[cols-debug:|}'[[cols-offset:0|cols:xs-12 sm-12 md-6]]', true );//|noborder-left|noborder-right
                 //oBlock.Color := clMoneyGreen;
                    oLabel := rc_CreateLabel( Self, oBlock, 'rctimeline_version' + i.ToString, 200, 25, 0, 2, '[[center:parent x]]', true );// '[[cls:align-label-center-center]]' );
                    oLabel.Font.Color     := clBlack;
                    oLabel.Font.Size      := 14;
                    oLabel.Font.Style     := [fsBold];
                    oLabel.TextConversion := txtHTML;
                    oLabel.AutoSize       := false;
                    oLabel.Alignment      := taCenter;
                    oLabel.Caption        := 'version ' + memTimeLine.FieldByName('version').AsString;
                                                                                                               //cls:bg-silver|
                    oLabel := rc_CreateLabel( Self, oBlock, 'rctimeline_date' + i.ToString, 200, 20, 0, 26, '[[center:parent x]]', true, true);
                    oLabel.Font.Color     := clGray;
                    oLabel.Font.Size      := 12;
                    oLabel.Font.Style     := [fsBold];
                    oLabel.TextConversion := txtHTML;
                    oLabel.AutoSize       := false;
                    oLabel.Alignment      := taCenter;
                    oLabel.Caption        := 'date ' + memTimeLine.FieldByName('date').AsString;
                 Inc( w );
                 oBlock := rc_CreateBlock( Self, sboxGridBlock, w, 140 , 60, '[[cols-offset:0|cols:3|hide:mobile disable]]', true );
                 //oBlock.Color := clMoneyGreen;
            end;
            cType := getType( memTimeLine.FieldByName('type').AsString );
            if ctype = 'new' then
            begin
               cIcon       := 'fas-plus';
               cDotCls     := 'bg-green';
               cTxtTypeCls := 'color-green';
            end
            else
            if ctype = 'bugfix' then
            begin
               cIcon       := 'fas-bug-slash';
               cDotCls     := 'bg-red';
               cTxtTypeCls := 'color-red';
            end
            else
            if ctype = 'improvement' then
            begin
               cIcon       := 'fas-rotate';
               cDotCls     := 'bg-blue';
               cTxtTypeCls := 'color-blue';
            end;

            //icon
            Inc( w );
            oBlock2 := rc_CreateBlock( Self, sboxGridBlock, w, 44 , 50, {'[[cols-offset:0|'}'[[cols:xs-12 sm-12 md-2]]', true );
            //oBlock2.Color := clSkyBlue;
              oPaIcon := rc_CreateContainer( Self, oBlock2, 'rctimeline_type' + i.ToString, 40, 40, 0, 0, '[[center:parent xy|cls:rc-timeline-block rc-timeline-' + cType + ']]', true, true);
              oLabel  := rc_CreateLabel( Self, oPaIcon, 'rctimeline_typeicon' + i.ToString, 26, 26, 0, 0, '[[center:parent xy|ico:' + cIcon + ']]' , true, true);
              oLabel.TextConversion := txtHTML;
              oLabel.Font.Color := clWhite;
              oLabel.Font.Size := 14;
              oLabel.AutoSize := false;//true;
              oLabel.Alignment := taCenter;

              if c = 0 then
              begin
                 oPaTrackR := rc_CreateContainer( Self, oBlock2, 'rctimeline_trackR' + i.ToString, 40, 2, 0 , 0, '[[align:' + oPaIcon.Name + ' r:-20 |center:parent y|hide:mobile|cls:rc-wizard-track]]', true, true);
                 oPaTrackR.Color := clGray;
                 oPaTrackR.Anchors := [akLeft, akRight];
              end
              else
              begin
                 oPaTrackL := rc_CreateContainer( Self, oBlock2, 'rctimeline_trackL' + i.ToString, 40, 2, 0, 0, '[[scale:parent w:50% |center:parent y|hide:mobile|cls:rc-wizard-track]]' , true, true);
                 oPaTrackL.Color := clGray;
                 oPaTrackL.Anchors := [akLeft];
              end;

            //description
            l := 10;
            Inc( w );
            oBlock3 := rc_CreateBlock( Self, sboxGridBlock, w, 140 , 42, {'[[cols-offset:0|'}'[[noborder-left|round:all|cols:xs-12 sm-12 md-10|h-replicate:' + oBlock2.Name + ' mobile-off', true );
            oBlock3.Hint  := oBlock3.Hint + '|cls:card-info-box-white]]';
            //oBlock3.Color := clWhite;// clCream;
              createLabelDash( oLabel , '-' );
              createLabelDescription( oLabel );
              memTimeLine.next;
              //8.0.0.0 ( thanks for bug track Mr. EREMIM )
              //while ( memTimeLine.FieldByName('type').AsString = copy( cType, 1, 1 ) ) and ( not memTimeLine.Eof ) do
              while ( memTimeLine.FieldByName('version').AsString = cVersion ) and ( not memTimeLine.Eof ) do
              begin
                cType := getType( memTimeLine.FieldByName('type').AsString );
                l := l + 25;

                //label item MONOSPACED
                bLabelPRE := getDescription( cItemLabel );
                createLabelDash( oLabel , '-' );
                createLabelDescription( oLabel );

                memTimeLine.next;
                oBlock3.Height := oBlock3.Height + 25;
              end;

              Inc( w );
              if cVersion <> memTimeLine.FieldByName('version').AsString then
                 oBlock2 := rc_CreateBlock( Self, sboxGridBlock, w , 140 , 15, '[[cols:12]]', true )
              else
                 oBlock2 := rc_CreateBlock( Self, sboxGridBlock, w , 140 , 2, '[[cols:12]]', true );

              i := i + 1;
              cType := getType( memTimeLine.FieldByName('type').AsString );
       end;
    finally
       rc_RenderLayout( Self, false, true );
       dm_rc.rc_ResizeBlocks( Self, true, true );
    end;
end;

procedure TfrmDEMO_TIMELINE.rc_CreateTimeLineZigZag(pDataSet: TDataSet);
var
   w, i, c, l : integer;
   oPaTrackL, oPaTrackR, oPaIcon, oBlock, oBlock2, oBlock3, oBlock4 : TUniContainerPanel;
   oLabel : TUniLabel;
   cItemLabel, cVersion, cIcon, cType, cDotCls, cTxtTypeCls : string;
   bLabelPRE, bLastLabelDescriptionIsBig : boolean;
   function getType( pType : string ) : string;
   begin
      if memTimeLine.FieldByName('type').AsString = 'n' then
         Result := 'new'
      else
      if memTimeLine.FieldByName('type').AsString = 'b' then
         Result := 'bugfix'
      else
      if memTimeLine.FieldByName('type').AsString = 'i' then
         Result := 'improvement'
      else
      if memTimeLine.FieldByName('type').AsString = 'f' then
         Result := 'improvement';
   end;
   function getDescription( var cItemLabel : string ) : boolean;
   begin
      //label item MONOSPACED
      cItemLabel := memTimeLine.FieldByName('description').AsString;
      Result     := Copy( cItemLabel, 1, 2 ) = '<>';
      cItemLabel := StringReplace( cItemLabel, '<>', '', [rfReplaceAll] );
      if ( not bLastLabelDescriptionIsBig ) then
         bLastLabelDescriptionIsBig := ( Result ) and ( Length( cItemLabel ) >= 42 );
   end;
   procedure createLabelDash( var oLabel : TUniLabel; pSymbol : string = '-' );
   begin
      oLabel := rc_CreateLabel( Self, oBlock3, 'rctimeline_dash' + w.ToString , 140, 20, 6, l, '' ,true, true);
      if bLabelPRE then
      begin
         oLabel.Left := 26;
         oLabel.Caption := pSymbol;
         oLabel.Hint    := '[[theme-color:off|cls:rc-label-clear rc-pre color-silver|scale:parent w:95%-left]]';
      end;
      oLabel.Font.Size      := 10;
      oLabel.TextConversion := txtHTML;
   end;
   procedure createLabelDescription( var oLabel : TUniLabel );
   begin
      if not bLabelPRE then
      begin
         l := l + 5;
         oBlock3.Height := oBlock3.Height + 5;
         if ( bLastLabelDescriptionIsBig ) then
         begin
            l := l + 5;
            oBlock3.Height := oBlock3.Height + 5;
            bLastLabelDescriptionIsBig := false;
         end;
      end;

      oLabel := rc_CreateLabel( Self, oBlock3, 'rctimeline_descrip' + w.ToString , 140, 20, 6, l, '' ,true, true);
      if bLabelPRE then
      begin
         oLabel.Left := 40;
         oLabel.Caption := cItemLabel;//rc_MakeListItem( cItemLabel , litDot, 'bg-white' );
         oLabel.Hint    := '[[theme-color:off|cls:rc-label-clear rc-pre color-silver|scale:parent w:95%-left]]';
      end
      else
      begin
         oLabel.Caption := rc_MakeListItem( cItemLabel , litDot, cDotCls );
         oLabel.Hint    := '[[cls:color-gray|scale:parent w:95%-left]]';
      end;
      //oLabel.Font.Color     := clGray;
      oLabel.Font.Size      := 10;
      oLabel.TextConversion := txtHTML;

      //testar depois...
      //if ( Pos( 'h-auto:', oBlock.Hint ) > 0 ) then
//      begin
//         if oLabel.ClientEvents.ExtEvents.Values['resize'] = '' then
//         begin
//           oLabel.ClientEvents.ExtEvents.Values['resize'] :=
//             'function resize(sender, width, height, oldWidth, oldHeight, eOpts) ' +
//             '{   ' +
//             //'  console.log( "1.resize..." );' +
//             '  var oImg = ' + QuotedStr( 'bsimg' + oLabel.Name ) + ';' +
//             '  var oImg = document.getElementById( oImg );' +
//            // '  console.log( "2.resize..." ); ' +
//             '  iH = height;' +
//             //'  console.log( "3.resize(iH antes ):" + iH );  ' +
//             '  if(oImg){' +
////                                 '      var iH = Math.trunc( $(oImg).height() );' +
//             '      var iH = Math.trunc( oImg.offsetHeight );' +
//             '  }' +
////                                 '  console.log( "extjs imgOldH:" + Math.trunc( oldHeight ) );  ' +
////                                 '  console.log( "extjs imgOldW:" + Math.trunc( oldWidth ) );  ' +
////                                 '  console.log( "extjs width..:" + Math.trunc( width ) );  ' +
////                                 '  console.log( "extjs imgH...:" + iH );  ' +
////                                 '  console.log( "-----------------------");  ' +
//             '  ajaxRequest( MainForm.htmlFrame, "_resizeBlock" ,     ' +
//             '   ["pform=" + ' + QuotedStr( TUniControl( self ).Name ) + ', ' +
//             '    "pobj=" + ' + QuotedStr( oLabel.Name ) + ', ' +
//             '    "pImgObj=" + ' + QuotedStr( oBlock3.Name ) + ', ' +
//             '    "pOldH=" + Math.trunc(oldHeight),      ' +
//             '    "pOldW=" + Math.trunc(oldWidth),      ' +
//             '    "pHeight=" + Math.trunc(height),      ' +
//             '    "pWidth=" + Math.trunc(width),      ' +
//             '    "imgH=" + iH,      ' +
//             '    "imgW=" + Math.trunc(width) ]); ' +
//             '}';
//         end;
//      end;
   end;
begin
    try
       i := 20;
       l := 0;
       w := 10; //first timeline block
       c := 0;
       cVersion := '';
       cType    := '';
       memTimeLine.First;
       while not memTimeLine.Eof do
       begin
            //label item MONOSPACED
            bLabelPRE := getDescription( cItemLabel );

            if ( cVersion <> memTimeLine.FieldByName('version').AsString ) then
            begin
                 cVersion := memTimeLine.FieldByName('version').AsString;
                 cType    := memTimeLine.FieldByName('type').AsString;
                 //version and date
                 oBlock := rc_CreateBlock( Self, sboxGridBlock, 1 + w, 140 , 10, {'[[cols-debug:|}'[[cols-offset:0|cols:12|hide:mobile disable]]', true );
                 //oBlock.Color := clSkyBlue;
                 oBlock := rc_CreateBlock( Self, sboxGridBlock, 2 + w, 140 , 60, {'[[cols-debug:|}'[[cols-offset:0|cols:3|hide:mobile disable]]', true );
                 //oBlock.Color := clMaroon;
                 oBlock := rc_CreateBlock( Self, sboxGridBlock, 3 + w, 140 , 60, {'[[cols-debug:|}'[[cols-offset:0|cols:xs-12 sm-12 md-6]]', true );//|noborder-left|noborder-right
                 //oBlock.Color := clMoneyGreen;
                    oLabel := rc_CreateLabel( Self, oBlock, 'rctimeline_version' + i.ToString, 200, 25, 0, 2, '[[center:parent x]]' ,true, true);
                    oLabel.Font.Color     := clBlack;
                    oLabel.Font.Size      := 14;
                    oLabel.Font.Style     := [fsBold];
                    oLabel.TextConversion := txtHTML;
                    oLabel.AutoSize       := false;
                    oLabel.Alignment      := taCenter;
                    oLabel.Caption        := 'version ' + memTimeLine.FieldByName('version').AsString;
                                                                                                               //cls:bg-silver|
                    oLabel := rc_CreateLabel( Self, oBlock, 'rctimeline_date' + i.ToString, 200, 20, 0, 26, '[[center:parent x]]' ,true, true);
                    oLabel.Font.Color     := clGray;
                    oLabel.Font.Size      := 12;
                    oLabel.Font.Style     := [fsBold];
                    oLabel.TextConversion := txtHTML;
                    oLabel.AutoSize       := false;
                    oLabel.Alignment      := taCenter;
                    oLabel.Caption        := 'date ' + memTimeLine.FieldByName('date').AsString;
                 oBlock := rc_CreateBlock( Self, sboxGridBlock, 4 + w, 140 , 60, '[[cols-offset:0|cols:3|hide:mobile disable]]', true );
                 //oBlock.Color := clMoneyGreen;
                 w := w + 10;
            end;
            cType := getType( memTimeLine.FieldByName('type').AsString );
            if ctype = 'new' then
            begin
               cIcon       := 'fas-plus';
               cDotCls     := 'bg-green';
               cTxtTypeCls := 'color-green';
            end
            else
            if ctype = 'bugfix' then
            begin
               cIcon       := 'fas-bug-slash';
               cDotCls     := 'bg-red';
               cTxtTypeCls := 'color-red';
            end
            else
            if ctype = 'improvement' then
            begin
               cIcon       := 'fas-rotate';
               cDotCls     := 'bg-blue';
               cTxtTypeCls := 'color-blue';
            end;

           //block "invisble"
           if not mm.varB_Mobile_Screen then
              oBlock := rc_CreateBlock( Self, sboxGridBlock, varIIF( c = 0 , 10, 30 ) + w, 140 , 45, {'[[cols-offset:0|}'[[noborder-left|cols:xs-6 sm-6 md-5', true )
           else
              oBlock := rc_CreateBlock( Self, sboxGridBlock, 10 + w, 140 , 45, {'[[cols-offset:0|}'[[noborder-left|cols:xs-6 sm-6 md-5', true );
           oBlock.Hint := oBlock.Hint + '|hide:mobile disable]]';
           //oBlock.Color := clMoneyGreen;

            //icon
            oBlock2 := rc_CreateBlock( Self, sboxGridBlock, 20 + w, 44 , 50, {'[[cols-offset:0|}'[[noborder-left|cols:xs-12 sm-12 md-2]]', true );
            //oBlock2.Color := clSkyBlue;
              oPaIcon := rc_CreateContainer( Self, oBlock2, 'rctimeline_type' + i.ToString, 40, 40, 0, 0, '[[center:parent xy|cls:rc-timeline-block rc-timeline-' + cType + ']]' ,true, true);
              oLabel  := rc_CreateLabel( Self, oPaIcon, 'rctimeline_typeicon' + i.ToString, 26, 26, 0, 0, '[[center:parent xy|ico:' + cIcon + ']]' ,true, true);
              oLabel.TextConversion := txtHTML;
              oLabel.Font.Color := clWhite;
              oLabel.Font.Size := 14;
              oLabel.AutoSize := false;//true;
              oLabel.Alignment := taCenter;

              if c = 0 then
              begin
                 oPaTrackR := rc_CreateContainer( Self, oBlock2, 'rctimeline_trackR' + i.ToString, 40, 2, 0 , 0, '[[align:' + oPaIcon.Name + ' r:-20 |center:parent y|hide:mobile|cls:rc-wizard-track]]' ,true, true);
                 oPaTrackR.Color := clGray;
                 oPaTrackR.Anchors := [akLeft, akRight];
              end
              else
              begin
                 oPaTrackL := rc_CreateContainer( Self, oBlock2, 'rctimeline_trackL' + i.ToString, 40, 2, 0, 0, '[[scale:parent w:50% |center:parent y|hide:mobile|cls:rc-wizard-track]]' ,true, true);
                 oPaTrackL.Color := clGray;
                 oPaTrackL.Anchors := [akLeft];
              end;

            //description
            l := 10;
            if not mm.varB_Mobile_Screen then
               oBlock3 := rc_CreateBlock( Self, sboxGridBlock, varIIF( c = 0 , 30, 10 ) + w, 140 , 42, {'[[cols-offset:0|}'[[noborder-left|round:all|cols:xs-12 sm-12 md-5', true )
            else
               oBlock3 := rc_CreateBlock( Self, sboxGridBlock, 30 + w, 140 , 42, {'[[cols-offset:0|}'[[noborder-left|round:all|cols:xs-12 sm-12 md-5', true );

            oBlock3.Hint  := oBlock3.Hint + '|cls:card-info-box-white]]';
            //oBlock3.Color := clWhite;// clCream;
              createLabelDash( oLabel , '-' );
              createLabelDescription( oLabel );

              memTimeLine.next;
              //8.0.0.0 ( thanks for bug track Mr. EREMIM )
              //while ( memTimeLine.FieldByName('type').AsString = copy( cType, 1, 1 ) ) and ( not memTimeLine.Eof ) do
              while ( memTimeLine.FieldByName('version').AsString = cVersion ) and ( not memTimeLine.Eof ) do
              begin
                cType := getType( memTimeLine.FieldByName('type').AsString );
                Inc ( w );
                l := l + 25;

                //label item MONOSPACED
                bLabelPRE := getDescription( cItemLabel );
                createLabelDash( oLabel , '-' );
                createLabelDescription( oLabel );

                memTimeLine.next;
                oBlock3.Height := oBlock3.Height + 25;
              end;

              w := w + 40;
              if cVersion <> memTimeLine.FieldByName('version').AsString then
                 oBlock2 := rc_CreateBlock( Self, sboxGridBlock, w + 1, 140 , 15, '[[cols:12]]', true )
              else
                 oBlock2 := rc_CreateBlock( Self, sboxGridBlock, w + 1, 140 , 2, '[[cols:12]]', true );

              w := w + 1;
              i := i + 1;
              c := varIIF( c = 0 , 1, 0 );
              cType := getType( memTimeLine.FieldByName('type').AsString );
       end;
    finally
       rc_RenderLayout( Self, false, true );
       dm_rc.rc_ResizeBlocks( Self, true, true );
    end;
end;

procedure TfrmDEMO_TIMELINE.UniFrameCreate(Sender: TObject);
begin
  bResized := false;

  Self.Color             := StringToColor( mm.CONFIG_LAYOUT_BG_COLOR );

  // para frames, não precisa efetuar o ResizeBlocks | for frames, no need to perform ResizeBlocks
  rc_RenderLayout( Self, false, false );

  memTimeLine.Close;
  memTimeLine.LogChanges := false;
  memTimeLine.FieldDefs.Add('version'     , ftString , 11 , False);
  memTimeLine.FieldDefs.Add('date'        , ftString , 10 , False);
  memTimeLine.FieldDefs.Add('type'        , ftString ,  1 , False);  //'N'ew  'B'ugFix  'I'mprovement
  memTimeLine.FieldDefs.Add('description' , ftString , 100 , False);
  memTimeLine.FieldDefs.Add('item'        , ftString , 100 , False);
  memTimeLine.CreateDataSet;

  // Append data
  memTimeLine.Open;

  memTimeLine.AppendRecord( [ '07.00.00.00' , '2024/02/06' , 'i' , 'CSS padrão do RadCORE' ]);
  memTimeLine.AppendRecord( [ '07.00.00.00' , '2024/02/06' , 'i' , '<>servermodule_customcss.css' ]);

  memTimeLine.AppendRecord( [ '07.00.00.00' , '2024/02/06' , 'i' , 'RC WIZARD' , '' ]);
  memTimeLine.AppendRecord( [ '07.00.00.00' , '2024/02/06' , 'i' , '<>Ajuste de versão' ]);
  memTimeLine.AppendRecord( [ '07.00.00.00' , '2024/02/06' , 'i' , '<>Definição do caminho externo do banco de dados para FIREBIRD e SQLITE' ]);
  //memTimeLine.AppendRecord( [ '07.00.00.00' , '2024/02/06' , 'i' , '<>  para FIREBIRD e SQLITE' ]);

  memTimeLine.AppendRecord( [ '07.00.00.00' , '2024/02/06' , 'i' , 'improvement' , '' ]);

  memTimeLine.AppendRecord( [ '07.00.00.00' , '2024/02/06' , 'n' , 'NEW ATTRIBUTES' ]);
  memTimeLine.AppendRecord( [ '07.00.00.00' , '2024/02/06' , 'n' , '<>input-addon:' ]);
  memTimeLine.AppendRecord( [ '07.00.00.00' , '2024/02/06' , 'n' , '<>button-group:' ]);

  memTimeLine.AppendRecord( [ '07.00.00.00' , '2024/02/06' , 'b' , 'bug fix'     , '' ]);

  memTimeLine.AppendRecord( [ '06.01.00.05' , '2024/01/01' , 'n' , 'novo recurso 1' , '' ]);
  memTimeLine.AppendRecord( [ '06.01.00.05' , '2024/01/01' , 'n' , 'novo recurso 1' , '' ]);
  memTimeLine.AppendRecord( [ '06.01.00.05' , '2024/01/01' , 'b' , 'bug fix'        , '' ]);


 // rc_UrlImgNoCache( imgLogo, 'files/images/logo_login.png' );

//   Self.ClientEvents.ExtEvents.Values['resize'] :=
//     'function resize(sender, width, height, oldWidth, oldHeight, eOpts) ' +
//     '{   ' +
//     '  console.log("resize..."); ' +
//     '  ajaxRequest( frmDEMO_TIMELINE.UniHTMLFrame1, "_resizeFrm" ,     ' +
//     '   []); ' +
////     '   ["pform=" + ' + QuotedStr( TUniControl( self ).Name ) + ', ' +
////     '    "pobj=" + ' + QuotedStr( oBlock.Name ) + ', ' +
////     '    "pOldH=" + Math.trunc(oldHeight),      ' +
////     '    "pOldW=" + Math.trunc(oldWidth),      ' +
////     '    "pHeight=" + Math.trunc(height),      ' +
////     '    "pWidth=" + Math.trunc(width),      ' +
////     '    "imgH=" + iH,      ' +
////     '    "imgW=" + Math.trunc(width) ]); ' +
//     '}';
end;

procedure TfrmDEMO_TIMELINE.UniFrameReady(Sender: TObject);
var
   cTagString : string;
   cFrmName : string;//8.0.0.0 demonstrando "rcdynaddfrmname:"
begin
   cFrmName := rc_GetHintAttr( 'rcdynaddfrmname:', Self.OwnerForm.Hint );
   if cFrmName <> '' then
   begin
      if Self.FindComponent( 'labFormName' ) <> nil then
      begin
         labFormName.Caption := cFrmName;
         //rc_ObjectStatus( Self, rcBlock1, true );
      end;
   end;

   dm_rc.rc_ResizeBlocks( Self, true, true );

   // tag-form ?
   cTagString := dm_rc.rc_GetTagFormAttr( Self, false );
   if cTagString.ToUpper = '1' then
      rc_CreateTimeLine( memTimeLine )
   else
      rc_CreateTimeLineZigZag( memTimeLine );
end;

procedure TfrmDEMO_TIMELINE.UniHTMLFrame1AjaxEvent(Sender: TComponent; EventName: string; Params: TUniStrings);
begin
//  dm_rc.rc_ShowToaster( 'info', 'ajaxevent...', false, 'pinItUp' );
//  if ( EventName = '_resizeFrm' ) and ( not bResized ) then
//  begin
//     dm_rc.rc_ShowToaster( 'info', 'resized !', false, 'pinItUp' );
//     bResized := true;
//     rc_CreateTimeLine( memTimeLine );
//  end;
end;

initialization

  RegisterClass( TfrmDEMO_TIMELINE );

end.
