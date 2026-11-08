unit untDEMO_eSIGN_SMOOTH;//7.4.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniButton, uniLabel, uniPanel, uniGUIBaseClasses,
  uniScrollBox, uniCanvas, uniImage, Data.DB, Datasnap.DBClient, DateUtils,
  uniHTMLFrame;

type
  TfrmDEMO_eSIGN_SMOOTH = class(TUniFrame)
    UniScrollBox1: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    UniLabel1: TUniLabel;
    rcBlock30: TUniContainerPanel;
    paSign: TUniContainerPanel;
    UniCanvas: TUniCanvas;
    btnClear: TUniButton;
    btnSave: TUniButton;
    cdsSign: TClientDataSet;
    cdsSignimg_date: TDateTimeField;
    cdsSignimg: TBlobField;
    dsSign: TDataSource;
    htmlSign: TUniHTMLFrame;
    btnUndo: TUniButton;
    btnRedo: TUniButton;
    procedure UniFrameBeforeReady(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure UniCanvasAfterSubmit(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnUndoClick(Sender: TObject);
    procedure btnRedoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DrawImage;
  end;

implementation

{$R *.dfm}

uses untDM_RC, mkm_layout, MainModule, ServerModule;
// RC_CORE
// [PT] Descomente. O uso do "scale:" ou "hr:" em blocos responsivos "dentro de frames" precisa desse processo adicionar para renderizar corretamente
// [EN] Uncomment. The use of "scale:" or "hr:"  in responsive blocks "within frames" needs this process added to render correctly
procedure TfrmDEMO_eSIGN_SMOOTH.btnClearClick(Sender: TObject);
begin
   UniSession.AddJS( 'document.getElementById("btnclear").click();');
end;

procedure TfrmDEMO_eSIGN_SMOOTH.btnSaveClick(Sender: TObject);
begin
//  UniCanvas.SubmitData;
   UniSession.AddJS( 'document.getElementById("btnsavepng").click();');
end;

procedure TfrmDEMO_eSIGN_SMOOTH.DrawImage;
//var
//  fname: string;
//  blob: TStream;
//  fs: TFileStream;
begin
//  if cdsSign.RecordCount = 0 then Exit;
//  fname := 'eSign.png';
//  blob := cdsSign.CreateBlobStream( cdsSign.FieldByName('img'), bmRead);
//  fs := TFileStream.Create( sm.LocalCachePath + fname, fmCreate);
//  fs.CopyFrom( blob, blob.Size );
//  blob.Free;
//  fs.Free;
//  UniImg.Url := sm.LocalCacheURL + fname + '?' + IntToStr( DateTimeToUnix( cdsSign.FieldByName('img_date').AsDateTime ) );
end;

procedure TfrmDEMO_eSIGN_SMOOTH.btnUndoClick(Sender: TObject);
begin
   UniSession.AddJS( 'document.getElementById("btnundo").click();');
end;

procedure TfrmDEMO_eSIGN_SMOOTH.btnRedoClick(Sender: TObject);
begin
   UniSession.AddJS( 'document.getElementById("btnredo").click();');
end;

procedure TfrmDEMO_eSIGN_SMOOTH.UniCanvasAfterSubmit(Sender: TObject);
//var
//  blob: TStream;
begin
//  cdsSign.Append;
//  cdsSign.FieldByName('img_date').AsDateTime := Now;
//  blob := cdsSign.CreateBlobStream( cdsSign.FieldByName('img'), bmWrite );
//  UniCanvas.SaveToStream( blob, tiPNG);
//  blob.Free;
//  cdsSign.Post;
//  DrawImage;
end;

procedure TfrmDEMO_eSIGN_SMOOTH.UniFrameBeforeReady(Sender: TObject);
begin
   // dm_rc.rc_ResizeBlocks( Self, false, false );
end;
// RC_CORE
// Doc Link [PT] https://radcore.pro.br/web/help/pt/RenderizandooLayout.html
//          [EN] https://radcore.pro.br/web/help/en/LayoutRender.html
procedure TfrmDEMO_eSIGN_SMOOTH.UniFrameCreate(Sender: TObject);
begin
   rc_RenderLayout( Self, false, false, true, false );

   cdsSign.CreateDataSet;


  htmlSign.HTML.Clear;
  htmlSign.HTML.Add(
  '  <div id="signature-pad" class="signature-pad">' +
  '    <div id="canvas-wrapper" class="signature-pad--body">' +
  '      <canvas></canvas>' +
  '    </div>' +
  '    <div class="signature-pad--footer">' +
  '      <div class="signature-pad--actions">' +
  '        <div class="column">' +
  '          <button id="btnclear" type="button" class="button clear" data-action="clear">Clear</button>' +
  '          <button id="btnundo" type="button" class="button" data-action="undo" title="Ctrl-Z">Undo</button>' +
  '          <button id="btnredo" type="button" class="button" data-action="redo" title="Ctrl-Y">Redo</button>' +
  '          <button id="btnsavepng" type="button" class="button save" data-action="save-png">Save as PNG</button>' +
//  '          <!--' +
//  '          <br/>' +
//  '          <button type="button" class="button" data-action="change-color">Change color</button>' +
//  '          <button type="button" class="button" data-action="change-width">Change width</button>' +
//  '          <button type="button" class="button" data-action="change-background-color">Change background color</button>' +
//  '          -->' +
  '        </div>' +
//  '        <!--' +
//  '        <div class="column">' +
//  '          <button id="btnsavepng" type="button" class="button save" data-action="save-png">Save as PNG</button>          ' +
//  '          <button type="button" class="button save" data-action="save-jpg">Save as JPG</button>' +
//  '          <button type="button" class="button save" data-action="save-svg">Save as SVG</button>' +
//  '          <button type="button" class="button save" data-action="save-svg-with-background">Save as SVG with' +
//  '            background</button>          ' +
//  '        </div>' +
//  '        -->' +
  '      </div>' +
//  '      <!--' +
//  '      <div>' +
//  '        <button type="button" class="button" data-action="open-in-window">Open in Window</button>' +
//  '      </div>' +
//  '      -->' +
  '    </div>' +
  '  </div>' +
//  '  <script src="files/js/signature-pad/signature_pad.umd.min.js"></script>' +
  '  <script src="files/js/signature-pad/app.js"></script>'

  );

end;

procedure TfrmDEMO_eSIGN_SMOOTH.UniFrameReady(Sender: TObject);
begin
   dm_rc.rc_ResizeBlocks( Self, true, true );
end;
// -------------------------------------------------------------------------
initialization
   RegisterClass( TfrmDEMO_eSIGN_SMOOTH );

end.


