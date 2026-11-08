unit untDEMO_eSIGN;//7.4.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniButton, uniLabel, uniPanel, uniGUIBaseClasses,
  uniScrollBox, uniCanvas, uniImage, Data.DB, Datasnap.DBClient, DateUtils;

type
  TfrmDEMO_eSIGN = class(TUniFrame)
    UniScrollBox1: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    UniLabel1: TUniLabel;
    rcBlock30: TUniContainerPanel;
    paSign: TUniContainerPanel;
    UniCanvas: TUniCanvas;
    btnClear: TUniButton;
    btnSave: TUniButton;
    paImg: TUniContainerPanel;
    uniImg: TUniImage;
    cdsSign: TClientDataSet;
    cdsSignimg_date: TDateTimeField;
    cdsSignimg: TBlobField;
    dsSign: TDataSource;
    procedure UniFrameBeforeReady(Sender: TObject);
    procedure UniFrameReady(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure UniCanvasAfterSubmit(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
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
procedure TfrmDEMO_eSIGN.btnClearClick(Sender: TObject);
begin
     UniCanvas.Clear;
     UniCanvas.SubmitData;
end;

procedure TfrmDEMO_eSIGN.btnSaveClick(Sender: TObject);
begin
  UniCanvas.SubmitData;
end;

procedure TfrmDEMO_eSIGN.DrawImage;
var
  fname: string;
  blob: TStream;
  fs: TFileStream;
begin
  if cdsSign.RecordCount = 0 then Exit;
  fname := 'eSign.png';
  blob := cdsSign.CreateBlobStream( cdsSign.FieldByName('img'), bmRead);
  fs := TFileStream.Create( sm.LocalCachePath + fname, fmCreate);
  fs.CopyFrom( blob, blob.Size );
  blob.Free;
  fs.Free;
  UniImg.Url := sm.LocalCacheURL + fname + '?' + IntToStr( DateTimeToUnix( cdsSign.FieldByName('img_date').AsDateTime ) );
end;

procedure TfrmDEMO_eSIGN.UniCanvasAfterSubmit(Sender: TObject);
var
  blob: TStream;
begin
  cdsSign.Append;
  cdsSign.FieldByName('img_date').AsDateTime := Now;
  blob := cdsSign.CreateBlobStream( cdsSign.FieldByName('img'), bmWrite );
  UniCanvas.SaveToStream( blob, tiPNG);
  blob.Free;
  cdsSign.Post;
  DrawImage;
end;

procedure TfrmDEMO_eSIGN.UniFrameBeforeReady(Sender: TObject);
begin
   // dm_rc.rc_ResizeBlocks( Self, false, false );
end;
// RC_CORE
// Doc Link [PT] https://radcore.pro.br/web/help/pt/RenderizandooLayout.html
//          [EN] https://radcore.pro.br/web/help/en/LayoutRender.html
procedure TfrmDEMO_eSIGN.UniFrameCreate(Sender: TObject);
begin
   rc_RenderLayout( Self, false, false, true, false );

   cdsSign.CreateDataSet;
end;

procedure TfrmDEMO_eSIGN.UniFrameReady(Sender: TObject);
begin
   dm_rc.rc_ResizeBlocks( Self, true, true );
end;
// -------------------------------------------------------------------------
initialization
   RegisterClass( TfrmDEMO_eSIGN );

end.


