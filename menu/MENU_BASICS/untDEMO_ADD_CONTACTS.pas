unit untDEMO_ADD_CONTACTS; // 6.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, untGenericModalForm, uniSweetAlert, uniGUIBaseClasses, uniTimer, uniEdit, uniDBEdit, uniLabel, uniPanel, uniScrollBox, uniButton, uniBitBtn, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniBasicGrid, uniDBGrid, uniPageControl, uniMultiItem, uniComboBox;

type
  TfrmDEMO_ADD_CONTACTS = class(TfrmGenericModalForm)
    UniScrollBox1: TUniScrollBox;
    rcBlock2: TUniContainerPanel;
    BlockTitle: TUniContainerPanel;
    btSair: TUniLabel;
    memContacts: TFDMemTable;
    dsMemContacts: TDataSource;
    rcBlock200: TUniContainerPanel;
    btnNewContact: TUniBitBtn;
    rcBlock220: TUniContainerPanel;
    UniLabel2: TUniLabel;
    rcBlock1: TUniContainerPanel;
    UniLabel3: TUniLabel;
    rcBlock230: TUniContainerPanel;
    UniLabel1: TUniLabel;
    procedure btSairClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure btnNewContactClick(Sender: TObject);
  private
    { Private declarations }
    iTotPage, iPage : integer;
  public
    { Public declarations }
    procedure rc_RefreshListView( pForm : TObject; pBlockParent : TUniControl; pDataSet : TDataset; pFieldID : string; pFirstBlock : integer = 5; pLaskBlock : integer = 199 );
    procedure rc_ContactDel( sender : TObject );
    procedure rc_ContactUpdate( sender : TObject );
  end;

function frmDEMO_ADD_CONTACTS: TfrmDEMO_ADD_CONTACTS;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, uconsts, uconsts_cfg, Main, untDM_RC, mkm_layout, mkm_dbfuncs, mkm_createcomponents, str_func, mkm_func_web, mkm_validate;

function frmDEMO_ADD_CONTACTS: TfrmDEMO_ADD_CONTACTS;
begin
  Result := TfrmDEMO_ADD_CONTACTS(mm.GetFormInstance(TfrmDEMO_ADD_CONTACTS));
end;

procedure TfrmDEMO_ADD_CONTACTS.btnNewContactClick(Sender: TObject);
begin
  inherited;
  memContacts.Last;
  memContacts.AppendRecord( [ memContacts.FieldByName( 'id' ).AsInteger + 1 , 'MIKE' , '85999998888' ] );
  rc_RefreshListView( Self, rcBlock2, memContacts, 'id' );
end;

procedure TfrmDEMO_ADD_CONTACTS.btSairClick(Sender: TObject);
begin
  inherited;
  dm_rc.rc_CloseQuerys( Self , False, False );
  Close;
end;

procedure TfrmDEMO_ADD_CONTACTS.rc_ContactDel( sender : TObject );
var
  oBlock : TUniControl;
  iSeq   : integer;
begin
     //[PT] pega a sequência do bloco parent onde está contindo o botão de remover contato
     //[EN] get the sequence of the parent block where the remove contact button is contained
     iSeq := StrToIntDef( ReturnNumbers( TuniBitBtn(sender).parent.Name ), 0 );
     //[PT] neste exemplo, foram criados 2 blocos, então, serão removidos da lista
     //[EN] in this example, 2 blocks were created, so they will be removed from the list
     oBlock := TUniControl( FindComponent( 'rcBlock' + iSeq.ToString ) );
     oBlock.Enabled := false;
     oBlock.Visible := false;
     oBlock := TUniControl( FindComponent( 'rcBlock' + ( iSeq-1).ToString ) );
     oBlock.Enabled := false;
     oBlock.Visible := false;
     if memContacts.Locate( 'id' , TuniBitBtn(sender).Tag , [loCaseInsensitive]) then
     begin
        memContacts.Delete;
        memContacts.Refresh;
        rc_RefreshListView( self, rcBlock2, memContacts, 'id' );// not memContacts.IsEmpty );
     end;
end;

procedure TfrmDEMO_ADD_CONTACTS.rc_ContactUpdate(sender: TObject);
var
   iId  : integer;
   oEdit : TUniControl;
begin
  if not rc_FormValidate( Self ) then
  begin
     Abort;
  end;
     iId := TuniControl(sender).tag; // StrToIntDef( ReturnNumbers( TuniControl(sender).parent.Name ), 0 );
     if memContacts.Locate( 'id' , iId , [loCaseInsensitive]) then
     begin
        memContacts.Edit;
        oEdit := TUniEdit( FindComponent( 'edName_' + iId.ToString ) );
        memContacts.FieldByName( 'name' ).AsString  := TUniEdit( oEdit ).Text;
        oEdit := TUniEdit( FindComponent( 'edPhone_' + iId.ToString ) );
        memContacts.FieldByName( 'phone' ).AsString := TuniEdit( oEdit ).Text;
        memContacts.Post;
     end;
end;

procedure TfrmDEMO_ADD_CONTACTS.rc_RefreshListView( pForm : TObject; pBlockParent : TUniControl; pDataSet : TDataset; pFieldID : string; pFirstBlock : integer; pLaskBlock : integer );
var
   w, i, c : integer;
   oPg, oBlock, oBlock2 : TUniContainerPanel;
   sboxHorizontalScroll : TUniScrollBox;
   oLabel : TUniLabel;
   oEditName, oEditPhone : TUniEdit;
   oBtnDelete : TUniBitBtn;
begin
    try
       //[PT]
       // remover os blocos até o limite do bloco que contem o "New Contact".
       // No exemplo, poderão ser criados blocos de 5 até 199( rcBlock5 ... rcBlock199 ) pois o rcBlock200 contém o botão de adicionar contatos.
       //[EN]
       // remove blocks up to the limit of the block containing "New Contact".
       // In the example, blocks from 5 to 199 can be created ( rcBlock5 ... rcBlock199 ) because rcBlock200 contains the button to add contacts.
       rc_ClearBlocks( pForm, nil, pFirstBlock, pLaskBlock );

       i := 0;
       pDataSet.First;
       w := pFirstBlock;
       while not pDataSet.Eof do
       begin
            // start with rcBlock5...
            oBlock2 := rc_CreateBlock( pForm, pBlockParent, w , 100 , 40, '[[cols:xs-12 sm-12 md-6]]', true );
              oEditName := rc_CreateEdit( pForm, oBlock2, 'edName_' + pDataSet.FieldByName( pFieldID ).AsString , 98, 38, 0, 1, '[[valid:blank]]', true, true );
              oEditName.Font.Size  := 10;
              oEditName.EmptyText  := 'name';
              oEditName.Text       := memContacts.FieldByName( 'name' ).AsString ;//+ ' ' + oBlock2.Name;
              oEditName.Anchors    := [akLeft, akTop, akRight];
              oEditName.Tag        := pDataSet.FieldByName( pFieldID ).AsInteger;
              oEditName.OnExit     := rc_ContactUpdate;
              Inc( i ); // number of blocks created

            oBlock2 := rc_CreateBlock( pForm, pBlockParent, w + 1 , 100 , 40, '[[cols:xs-12 sm-12 md-6]]', true );
              oEditPhone := rc_CreateEdit( pForm, oBlock2, 'edPhone_' + pDataSet.FieldByName( pFieldID ).AsString, 62, 38, 0, 1, '' , true, true );
              oEditPhone.Font.Size := 10;
              oEditPhone.EmptyText := 'phone';
              oEditPhone.Text      := memContacts.FieldByName( 'phone' ).AsString ;//+ ' ' + oBlock2.Name;
              oEditPhone.Anchors   := [akLeft, akTop, akRight];
              oEditPhone.Tag       := pDataSet.FieldByName( pFieldID ).AsInteger;
              oEditPhone.OnExit    := rc_ContactUpdate;
              Inc( i ); // number of blocks created

              oBtnDelete := rc_CreateBitBtn( pForm, oBlock2, 'btnDel_' + pDataSet.FieldByName( pFieldID ).AsString, 33, 38, oEditPhone.Left + oEditPhone.Width + 2, oEditPhone.Top, '[[cls:ButtonCrud|ico:fas-times|]]' , true, true );
              oBtnDelete.Anchors   := [akTop, akRight];
              oBtnDelete.OnClick   := rc_ContactDel;
              oBtnDelete.Tag       := pDataSet.FieldByName( pFieldID ).AsInteger;

            w := w + i;
            pDataSet.Next;
       end;
    finally
       //pBlockParent.Hint := rc_AddHintAttr( '|rcnextblock:' + w.ToString , pBlockParent.Hint, true );
       rc_RenderLayout( pForm, false, true );
       dm_rc.rc_ResizeBlocks( pForm, true, true );
    end;
end;

procedure TfrmDEMO_ADD_CONTACTS.UniFormCreate(Sender: TObject);
begin

  memContacts.Close;
  memContacts.LogChanges := false;
  memContacts.FieldDefs.Add('id'    , ftInteger ,  0 , False);
  memContacts.FieldDefs.Add('name'  , ftString  , 50 , False);
  memContacts.FieldDefs.Add('phone' , ftString  , 20 , False);
  memContacts.CreateDataSet;

  // Append data
  memContacts.Open;
//  memContacts.AppendRecord( [ 1 , 'MIKE' , '85999991111' ] );
//  memContacts.AppendRecord( [ 2 , 'WILL' , '85999992222' ] );
//  memContacts.AppendRecord( [ 3 , 'JOBS' , '85999993333' ] );
//  memContacts.AppendRecord( [ 4 , 'DANY' , '85999994444' ] );
//  memContacts.AppendRecord( [ 5 , 'FRED' , '85999995555' ] );

  rc_RefreshListView( self, rcBlock2, memContacts, 'id' );

  inherited;


end;

initialization
   RegisterClass( TfrmDEMO_ADD_CONTACTS ) ;

end.
