unit untCadTB_COMPOUNDPK; // 6.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIApplication, uniGUIClasses, uniGUIFrame, untfrmBaseCRUD, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Menus, uniMainMenu, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uniHTMLFrame, uniDateTimePicker, uniCheckBox, uniEdit, uniMultiItem,
  uniComboBox, uniScrollBox, uniPanel, uniBasicGrid, uniDBGrid, uniPageControl,
  uniButton, uniBitBtn, uniLabel, uniGUIBaseClasses, uniDBEdit,
  uniDBDateTimePicker, uniSweetAlert;

type
  TfrmCadTB_COMPOUNDPK = class(TfrmBaseCRUD)
    rcBlock10: TUniContainerPanel;
    UniLabel5: TUniLabel;
    rcBlock20: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    rcBlock15: TUniContainerPanel;
    rcBlock5: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses MainModule, untdm_rc, mkm_func_web;

procedure TfrmCadTB_COMPOUNDPK.btnDeleteRegClick(Sender: TObject);
begin
  // no frmBaseCRUD já tem a critica de MOVIMENTACAO pra o registro que
  // esta sendo deletado...
  //
  // dm_rc.rc_HasCodeRegistered
  //

  // criticas antes da exclusao
  //

  inherited;

  if mm.varB_OperationProcessed then
  begin

       // procedimentos pós-exclusao
       //
       // como um ajuste de saldo...etc...

  end;
end;

procedure TfrmCadTB_COMPOUNDPK.UniFrameCreate(Sender: TObject);
begin
  // -----------------------------------------------------------------
  //
  //
  // tab.codigo por tab.[[pk]]
  //
  // O objetivo foi facilitar deixando o 'coringa' [[pk]]' ser substituido no frmBaseCRUD pela respectiva
  // chave primaria da tabela atual que foi vinculada no click do menu principal
  //
  // haverá situações que precisarão de alteraçao, mas seguindo a estrutura proposta, já ajuda
  //
  sqlMaster.close;
  sqlMaster.SQL.Text := ' SELECT [[fields]] ' +
                        ' FROM [[table]] tab ' +
                        ' WHERE tab.[[pk]] = :table_pk ' +  // Apenas cadastro MESTRE é necessário o WHERE( por enquanto )
                        //' AND   tab.[[pk2]] = [[fpk1:date]] ' +

                        ' [grid] ' + // este 'coringa' indica ao RadCORE o início da query usada na pesquisa padrão

                        ' SELECT ' +

                        '   tab.[[pk]] , ' +
                        //'   tab.[[pk2]], ' +
                        '   tab.ItemDate , ' +
                        '   tab.Description  ' +
                        //'        [[allpks]] ' +   // só é necessário o [[allpks]] aqui se estiver usando ALIAS em um campo CHAVE PRIMARIA

                        ' FROM  [[table]]  tab ' ;

  // parametros de pesquisa especifica por datas( pesq. por periodo )  - ANTES DO INHERITED
  //
  //dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDFieldDate.name, 'tab.data' , 'DATA' );

  // pre-defined grid columns attributes
  //8.2.0.0
  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:'+
                        'grid-resize|'+
                        'model-crud:0(btns-cls:ButtonWhite )' +
                        ' btns-ico-search:fas-search-dollar cls-ico:color-gray rc-font-crud-btn|'+
                        ' btns-ico-insert:fas-plus-circle cls-ico:color-gray rc-font-crud-btn|'+
                        varIIF( mm.CONFIG_LAYOUT_FONTAWS <> '5',
                                //' btns-ico-edit:fas-pen-circle cls-ico:color-gray rc-font-crud-btn|',//8.0.0.0 fas-pen-circle is PRO VERSION
                                ' btns-ico-edit:fas-pen-square cls-ico:color-gray rc-font-crud-btn|',//8.0.0.0
                                ' btns-ico-edit:fas-pen-square cls-ico:color-gray rc-font-crud-btn|' ) +
                        ' btns-ico-delete:fas-minus-circle cls-ico:color-gray rc-font-crud-btn|'+
                        ' btns-ico-cancel:fas-times-circle cls-ico:color-gray rc-font-crud-btn|'+
                        ' btns-ico-save:fas-check-circle cls-ico:color-gray rc-font-crud-btn|'+
                        ' btns-ico-options:fas-tasks cls-ico:color-gray rc-font-crud-btn|'+
                        ' info-state:off|' +
                        'grid-paginator:center|' +
                        ']]';

  inherited;
  // particularidades do form | form particularities
  //
end;

initialization

   RegisterClass( TfrmCadTB_COMPOUNDPK );

end.
