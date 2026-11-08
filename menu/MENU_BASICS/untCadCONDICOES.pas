unit untCadCONDICOES;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFrmCRUDproprio, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniHTMLFrame,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniGUIClasses, uniEdit,
  uniLabel, uniScrollBox, uniPanel, uniPageControl, uniButton, uniBitBtn,
  uniGUIBaseClasses, uniCheckBox, uniDBCheckBox, uniDBEdit, uniRadioGroup,
  uniDBRadioGroup, uniMemo, uniDBMemo, uniDBComboBox, uniScreenMask,
  Vcl.Menus, uniMainMenu, uniSweetAlert, uniDateTimePicker;

type
  TfrmCADCONDICOES = class(TfrmCRUDPROPRIO)
    rcBlock10: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    rcBlock30: TUniContainerPanel;
    rcBlock40: TUniContainerPanel;
    rcBlock50: TUniContainerPanel;
    UniLabel3: TUniLabel;
    edCodigo: TUniDBEdit;
    UniLabel4: TUniLabel;
    UniDBCheckBox1: TUniDBCheckBox;
    UniDBEdit1: TUniDBEdit;
    UniLabel5: TUniLabel;
    UniDBRadioGroup1: TUniDBRadioGroup;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    UniLabel6: TUniLabel;
    rcBlock60: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniDBMemo1: TUniDBMemo;
    rcBlock70: TUniContainerPanel;
    rcBlock80: TUniContainerPanel;
    UniDBComboBox4: TUniDBComboBox;
    UniLabel8: TUniLabel;
    UniDBFormattedNumberEditvlrtotal: TUniDBFormattedNumberEdit;
    UniLabel9: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCADCONDICOES: TfrmCADCONDICOES;

implementation

uses untdm_rc;

{$R *.dfm}
procedure TfrmCADCONDICOES.UniFrameCreate(Sender: TObject);
begin
  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:'+
                        'grid-resize|'+
                        'model-crud:0(btns-cls:colorful)|'+
                        'grid-paginator:center|' +
                        ']]';

  // Carrega o combo de medidas

  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'DESCRICAO' , 'DESCRICAO' );  //7.3.0.0
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'CODIGO' , 'CODIGO' );  //7.3.0.0

  inherited;

end;

initialization
  RegisterClass(TfrmCADCONDICOES);
end.
