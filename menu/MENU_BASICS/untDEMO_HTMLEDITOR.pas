unit untDEMO_HTMLEDITOR;//7.4.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniButton, uniLabel, uniPanel, uniGUIBaseClasses,
  uniScrollBox, uniCanvas, uniImage, Data.DB, Datasnap.DBClient, DateUtils,
  uniHTMLFrame, uniMemo, uniHTMLMemo, uniBitBtn;

type
  TfrmDEMO_HTMLEDITOR = class(TUniFrame)
    UniScrollBox1: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    UniLabel1: TUniLabel;
    rcBlock30: TUniContainerPanel;
    htmlMemo: TUniHTMLMemo;
    UniBitBtn1: TUniBitBtn;
    procedure UniFrameReady(Sender: TObject);
    procedure UniFrameCreate(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses untDM_RC, mkm_layout, MainModule, ServerModule, mkm_printfuncs;
// RC_CORE
// [PT] Descomente. O uso do "scale:" ou "hr:" em blocos responsivos "dentro de frames" precisa desse processo adicionar para renderizar corretamente
// [EN] Uncomment. The use of "scale:" or "hr:"  in responsive blocks "within frames" needs this process added to render correctly
// RC_CORE
// Doc Link [PT] https://radcore.pro.br/web/help/pt/RenderizandooLayout.html
//          [EN] https://radcore.pro.br/web/help/en/LayoutRender.html
procedure TfrmDEMO_HTMLEDITOR.UniBitBtn1Click(Sender: TObject);
begin
     UniSession.AddJs( htmlMemo.jsname + '.iframeEl.dom.contentWindow.print();' );
end;

procedure TfrmDEMO_HTMLEDITOR.UniFrameCreate(Sender: TObject);
begin

   htmlMemo.Lines.Clear;
   htmlMemo.Lines.Add(
    '<p><center><strong>Unigui Power<strong></center></p>' +
    '<br>' +
    '<img src="files\images\nature\cinqueterre.jpg" class="img-rounded" alt="Cinque Terre" width="304" height="236">' +
    '<br>' +
    '<p>Cercado de mata atlântica nativa ...</p>'
   );

   rc_RenderLayout( Self, false, false, true, false );
end;

procedure TfrmDEMO_HTMLEDITOR.UniFrameReady(Sender: TObject);
begin
   dm_rc.rc_ResizeBlocks( Self, true, true );
end;
// -------------------------------------------------------------------------
initialization
   RegisterClass( TfrmDEMO_HTMLEDITOR );

end.


