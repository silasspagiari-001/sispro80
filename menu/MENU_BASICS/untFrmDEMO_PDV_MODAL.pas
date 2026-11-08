unit untFrmDEMO_PDV_MODAL;//8.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniBitBtn, uniMultiItem, uniComboBox, uniImage,
  uniDBComboBox, uniDateTimePicker, uniDBDateTimePicker, uniLabel, uniEdit,
  uniDBEdit, uniPanel, uniGUIBaseClasses, uniScrollBox, uniSpinEdit, uniDBText, uniBasicGrid, uniDBGrid, uniMemo, uniPageControl,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmDEMO_PDV_MODAL = class(TUniForm)
    sboxSale: TUniScrollBox;
    rcBlock105: TUniContainerPanel;
    labProduct: TUniLabel;
    rcBlock1050: TUniContainerPanel;
    labOperator: TUniLabel;
    labTerminal: TUniLabel;
    rcBlock1040: TUniContainerPanel;
    labStatus: TUniLabel;
    rcBlock290: TUniContainerPanel;
    rcBlock220: TUniContainerPanel;
    rcBlock270: TUniContainerPanel;
    UniLabel1: TUniLabel;
    rcBlock245: TUniContainerPanel;
    UniLabel2: TUniLabel;
    rcBlock250: TUniContainerPanel;
    UniLabel3: TUniLabel;
    rcBlock230: TUniContainerPanel;
    rcBlock235: TUniContainerPanel;
    rcBlock260: TUniContainerPanel;
    UniLabel6: TUniLabel;
    rcBlock1030: TUniContainerPanel;
    btnFinish: TUniBitBtn;
    rcBlock1000: TUniContainerPanel;
    rcBlock1010: TUniContainerPanel;
    btnCancel: TUniBitBtn;
    rcBlock1020: TUniContainerPanel;
    lbSairPDV: TUniLabel;
    rcBlock271: TUniContainerPanel;
    paUnityPrice: TUniContainerPanel;
    labUnityPrice: TUniLabel;
    paTotalPrice: TUniContainerPanel;
    labTotalPrice: TUniLabel;
    paItems: TUniContainerPanel;
    labItems: TUniLabel;
    paToPay: TUniContainerPanel;
    labToPay: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    rcBlock300: TUniContainerPanel;
    rcBlock1100: TUniContainerPanel;
    btnPreOrder: TUniBitBtn;
    btnSearch: TUniBitBtn;
    memPRODS: TFDMemTable;
    dsPRODS: TDataSource;
    memSALES: TFDMemTable;
    dsSALES: TDataSource;
    memITEMS: TFDMemTable;
    dsITEMS: TDataSource;
    UniLabel5: TUniLabel;
    UniLabel4: TUniLabel;
    edProdID: TUniNumberEdit;
    edQtd: TUniNumberEdit;
    gridItems: TUniDBGrid;
    procedure btnCancelClick(Sender: TObject);
    procedure UniFormReady(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniFormBeforeShow(Sender: TObject);
    procedure UniFormResize(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
    procedure lbSairPDVClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure btnPreOrderClick(Sender: TObject);
    procedure edProdIDExit(Sender: TObject);
  private
    { Private declarations }
    FTotalItems : Integer;
    FToPay      : Currency;
  public
    { Public declarations }
    ItemSeq : integer;

    procedure rc_RefreshListView;
    procedure rc_ListViewEdit( sender : TObject );
    procedure rc_ListViewDel( sender : TObject );

  end;

function frmDEMO_PDV_MODAL: TfrmDEMO_PDV_MODAL;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untdm_rc, mkm_layout, Main, uconsts, str_func,
  mkm_func_web, mkm_createcomponents;

function frmDEMO_PDV_MODAL: TfrmDEMO_PDV_MODAL;
begin
  Result := TfrmDEMO_PDV_MODAL(mm.GetFormInstance(TfrmDEMO_PDV_MODAL));
end;

procedure TfrmDEMO_PDV_MODAL.rc_ListViewDel(sender: TObject);
var
   cId : string;
   TotalItems : Integer;
   ToPay      : Currency;
begin
   cId := rc_GetHintAttr( 'item-id:', TUniControl(sender).Hint );
   if ( memITEMS.Locate( 'id' , cId, [] ) ) then
   begin
      try
        TotalItems := memITEMS.FieldByName('qtde').AsInteger;
        ToPay      := memITEMS.FieldByName('price').AsCurrency;
        memITEMS.Delete;
        memITEMS.Refresh;
      finally
        rc_RefreshListView;
      end;
   end;
end;

procedure TfrmDEMO_PDV_MODAL.rc_ListViewEdit(sender: TObject);
begin
//
end;

procedure TfrmDEMO_PDV_MODAL.rc_RefreshListView;
var
   w, i, c : integer;
   oImg : TUniImage;
   oBlock, oBlock2 : TUniContainerPanel;
   sboxHorizontalScroll : TUniScrollBox;
   oLabel : TUniLabel;
   oBtnEdit, oBtnDelete : TUniBitBtn;
   cId, cIdProd, cProdDescr : string;
begin
    try
       //rc_ClearBlocks( Self, nil, 301, 301 + memITEMS.RecordCount );
       i := 20;
       c := 0;
       w := 300;
       FTotalItems := 0;
       FToPay      := 0;
       sboxHorizontalScroll := rc_CreateScrollBox( Self, rcBlock300, 'sboxHorizontalScroll', rcBlock300.Width , rcBlock300.Height , 0 , 0, '[[scrollbar:show-v|scrollbar-color:#c0c0c0 #fff]]', true, true );//7.0.0.0
       sboxHorizontalScroll.ScrollDirection := sdBoth;
       sboxHorizontalScroll.Anchors := [ akLeft,akRight,akTop,akBottom ];
       memITEMS.First;
       while not memITEMS.Eof do
       begin
            Inc(c);
            Inc(w);

            cId := memITEMS.FieldByName('id').AsString;
            cIdProd := memITEMS.FieldByName('idprod').AsString;

            Inc( FTotalItems );
            FToPay := FToPay + ( memITEMS.FieldByName('qtde').AsInteger * memITEMS.FieldByName('price').AsCurrency );

            oBlock2 := rc_CreateBlock( Self, sboxHorizontalScroll, w, 90 , 60, '[[cols:12|cls:card-info-box-white]]', true );

              //item seq
              oLabel := rc_CreateLabel( Self, oBlock2, 'item_id' + w.ToString, 50, 30, 04, 02, '' , true);
              oLabel.TextConversion :=  txtHTML;
              oLabel.Font.Color     := clGray;
              oLabel.Font.Size      := 10;
              oLabel.Caption        := '#' + c.ToString;

              //prod photo
              oLabel := rc_CreateLabel( Self, oBlock2, 'item_photo' + w.ToString, 50, 30, 10, 08, '', true );
              oLabel.TextConversion :=  txtHTML;
              oLabel.Caption := '<img id="item-img' + w.ToString + '" class="pos-Item" src="files/images/food/' + cIdProd + '.png?timestamp=' + rc_GetUnixDateStr + '" alt="Item Img' + w.ToString + '">';

              //item name
              cProdDescr := memITEMS.FieldByName('description').AsString;
              oLabel := rc_CreateLabel( Self, oBlock2, 'item_name' + w.ToString, 100, 30, 100, 06, '[[caption-dots:mobile-v-15]]', true );
              oLabel.TextConversion :=  txtHTML;
              oLabel.Font.Size      := 12;
              oLabel.Caption        := cProdDescr;

              //item qtd
              oLabel := rc_CreateLabel( Self, oBlock2, 'item_qtde' + w.ToString, 50, 30, 100, 36, '' , true);
              oLabel.TextConversion :=  txtHTML;
              oLabel.Font.Color     := clGray;
              oLabel.Font.Size      := 10;
              oLabel.Caption        := memITEMS.FieldByName('qtde').AsString + ' x ' +
                                       memITEMS.FieldByName('price').AsString + ' = ' +
                                       FloatToStrF( memITEMS.FieldByName('qtde').AsInteger * memITEMS.FieldByName('price').AsCurrency, ffNumber, 10, 2 );

              //edit btn
              oBtnEdit := rc_CreateBitBtn( Self, oBlock2, 'btn_edit' + w.ToString, 30, 24, oBlock2.Width - 40, 4, '[[ico:fas-pencil-alt |cls:ButtonOutline ButtonOutlineBlue ButtonRound btn-font-blue |item-id:' + cId + ' ]]', true );
              oBtnEdit.Anchors := [akTop, akRight];
              oBtnEdit.OnClick := rc_ListViewEdit;

              //delete btn
              oBtnDelete := rc_CreateBitBtn( Self, oBlock2, 'btn_del' + w.ToString, 30, 24, oBlock2.Width - 40, 32, '[[ico:fas-trash-alt |cls:ButtonOutline ButtonOutlineRed ButtonRound btn-font-red | item-id:' + cId + ']]', true );
              oBtnDelete.Anchors := [akTop, akRight];
              oBtnDelete.OnClick := rc_ListViewDel;

            memITEMS.Next;

       end;
    finally
       labItems.Caption := FloatToStr( FTotalItems ) ;
       labToPay.Caption := FloatToStrF( FToPay, ffNumber, 10, 2 ) ;

       oBlock2 := rc_CreateBlock( Self, sboxHorizontalScroll, 10 + w + 1, 140 , 10, '[[cols:12]]', true );
       rc_RenderLayout( Self, false, true );
       dm_rc.rc_ResizeBlocks( Self, true, true );
    end;
end;

procedure TfrmDEMO_PDV_MODAL.btnCancelClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmDEMO_PDV_MODAL.btnPreOrderClick(Sender: TObject);
begin
  dm_rc.rc_RenderControls( TObject( frmDEMO_PDV_MODAL ) , btnFinish );
end;

procedure TfrmDEMO_PDV_MODAL.edProdIDExit(Sender: TObject);
begin
     if ( edProdID.Value > 0 ) then
     begin
        if ( memPRODS.Locate( 'id' , edProdID.Text, [] ) ) then
        begin
           Inc( ItemSeq );

           labProduct.Caption := memPRODS.FieldByName('description').AsString;

           //add items
           memITEMS.AppendRecord( [ ItemSeq ,
                                    edProdID.Text,
                                    memSALES.FieldByName('id').AsString,
                                    memPRODS.FieldByName('description').AsString,
                                    edQtd.Value,
                                    memPRODS.FieldByName('price').AsCurrency,
                                    edQtd.Value * memPRODS.FieldByName('price').AsCurrency ] );

           labUnityPrice.Caption := FloatToStrF( memPRODS.FieldByName('price').AsCurrency, ffNumber, 10, 2 ) ;
           labTotalPrice.Caption := FloatToStrF( memITEMS.FieldByName('total').AsCurrency, ffNumber, 10, 2 ) ;

           rc_RefreshListView;

           dm_rc.rc_ShowToaster( ttySuccess, 'Product Added', false, ttrPinItUp, 3500 );

           edProdID.SetFocus;
        end
        else
           dm_rc.rc_ShowSweetAlertWarning( 'Product not found !' ); //
     end;
     edProdID.Value := 0;
end;

procedure TfrmDEMO_PDV_MODAL.lbSairPDVClick(Sender: TObject);
begin
     dm_rc.rc_CloseQuerys( self );
     memSALES.Free;
     memITEMS.Free;
     memPRODS.Free;
     Close;
end;

procedure TfrmDEMO_PDV_MODAL.UniBitBtn1Click(Sender: TObject);
begin
     MainForm.rc_AddFormFrameInTab( nil, 'FORM B', '', 'DEMOWithFormMODAL2' , false, true, aftNone, 0, nil, false, false );
end;

procedure TfrmDEMO_PDV_MODAL.UniFormBeforeShow(Sender: TObject);
begin
     rc_RenderLayout( Self, true, true , false );
end;

procedure TfrmDEMO_PDV_MODAL.UniFormCreate(Sender: TObject);
begin
  rc_RenderLayout( Self, false, false, false, false );

    // SALES
  memPRODS.Close;
  memPRODS.LogChanges := false;
  memPRODS.FieldDefs.Add('id'          , ftInteger  ,   0 , False);
  memPRODS.FieldDefs.Add('price'       , ftCurrency ,   0 , False);
  memPRODS.FieldDefs.Add('description' , ftString   , 100 , False);
  memPRODS.CreateDataSet;
  // Append data
  memPRODS.Open;
  memPRODS.AppendRecord( [ 1 , 75.50, 'Pizza Margueritta' ] );
  memPRODS.AppendRecord( [ 2 , 45.50, 'Burger Tornado' ] );
  memPRODS.AppendRecord( [ 3 , 12.50, 'Pastel All in One' ] );
//  memPRODS.AppendRecord( [ 4 , 62.90, 'Prod 4' ] );
//  memPRODS.AppendRecord( [ 5 , 99.90, 'Prod 5' ] );

  // SALES
  memSALES.Close;
  memSALES.LogChanges := false;
  memSALES.FieldDefs.Add('id'        , ftInteger  ,   0 , False);
  memSALES.FieldDefs.Add('idcompany' , ftInteger  ,   0 , False);
  memSALES.FieldDefs.Add('idclient'  , ftInteger  ,   0 , False);
  memSALES.FieldDefs.Add('idpayment' , ftInteger  ,   0 , False);
  memSALES.FieldDefs.Add('total'     , ftCurrency ,   0 , False);
  memSALES.FieldDefs.Add('items'     , ftInteger  ,   0 , False);
  memSALES.FieldDefs.Add('notes'     , ftString   , 100 , False);
  memSALES.CreateDataSet;
  // Append data
  memSALES.Open;
  memSALES.AppendRecord( [ 1 , mm.varI_Code_Company , 0 , 0, 0, 0, '' ] );

  // SALES ITEMS
  memITEMS.Close;
  memITEMS.LogChanges := false;
  memITEMS.FieldDefs.Add('id'          , ftInteger  ,   0 , False);
  memITEMS.FieldDefs.Add('idprod'      , ftInteger  ,   0 , False);
  memITEMS.FieldDefs.Add('idsale'      , ftInteger  ,   0 , False);
  memITEMS.FieldDefs.Add('description' , ftString   , 100 , False);//just for sample
  memITEMS.FieldDefs.Add('qtde'        , ftFloat    ,   0 , False);
  memITEMS.FieldDefs.Add('price'       , ftCurrency ,   0 , False);
  memITEMS.FieldDefs.Add('total'       , ftCurrency ,   0 , False);
  memITEMS.CreateDataSet;
  // Append data
  memITEMS.Open;
  ItemSeq := 0;

  labItems.Caption := '000';
  edQtd.Value := 1;
  edProdID.SetFocus;

  //dm_rc.rc_ShowTour( Self, True );
end;

procedure TfrmDEMO_PDV_MODAL.UniFormDestroy(Sender: TObject);
begin
    // para quando um FORM MODAL estiver ativo, não executar o "dbGridUpdate" no
    // que estiver "abaixo" do MODAL
    mm.varC_Form_Modal := nil;

end;

procedure TfrmDEMO_PDV_MODAL.UniFormReady(Sender: TObject);
begin
    //Self.Top := ( UniSession.UniApplication.ScreenHeight  div 2 ) - ( self.Height div 2  );
    //rc_AddCssClass( self, 'drop_in' );
    rc_FormTransition( self );
end;
//[PT]
// se precisar usar o FORM com BorderStyle = bsSizeable você precisa mudar o
// AlignmentControl para uniAlignmentServer e descomentar a linha abaixo
//[EN]
// if you need to use the FORM with BorderStyle = bsSizeable you need to change the
// AlignmentControl to uniAlignmentServer and uncomment the line below
procedure TfrmDEMO_PDV_MODAL.UniFormResize(Sender: TObject);
begin
//   dm_rc.rc_ResizeBlocks( self );
end;

Initialization
   RegisterClass( TfrmDEMO_PDV_MODAL );

end.
