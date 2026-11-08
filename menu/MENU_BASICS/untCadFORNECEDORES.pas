unit untCadFORNECEDORES; // 6.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, untfrmBaseCRUD, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniEdit,
  uniDateTimePicker, uniCheckBox, uniMultiItem, uniComboBox, uniBasicGrid,
  uniDBGrid, uniPanel, uniPageControl, uniButton, uniBitBtn, uniLabel,
  uniGUIBaseClasses, uniDBComboBox, uniDBDateTimePicker, uniDBEdit,
  uniDBCheckBox, uniSpeedButton, uniScrollBox, Vcl.Menus, uniMainMenu,
  uniHTMLFrame, uniSweetAlert;

type
  TfrmCadFORNECEDORES = class(TfrmBaseCRUD)
    pgComplementData: TUniPageControl;
    tabGeral: TUniTabSheet;
    sboxTab1: TUniScrollBox;
    rcBlock10: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel1: TUniLabel;
    rcBlock80: TUniContainerPanel;
    UniLabel3: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    edHiddenCompanyID: TUniDBEdit;
    procedure UniFrameCreate(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, untFrmLookUp, //untDM_LOOKUPs,
  mkm_func_web, uconsts;


procedure TfrmCadFORNECEDORES.btnDeleteRegClick(Sender: TObject);
begin
  // no frmBaseCRUD já tem a critica de MOVIMENTACAO pra o registro que
  // esta sendo deletado...
  //
  // dm_rc.rc_HasCodeRegistered
  dm_rc.rc_AddBeforeDeleteItem( true, 'compras', 'codiforn' , 'codigo' ); //6.0.0.0

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


procedure TfrmCadFORNECEDORES.UniFrameCreate(Sender: TObject);
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
                        '   FROM [[table]] tab ' +
                        '  WHERE tab.[[pk]] = :table_pk ' +  // Apenas cadastro MESTRE é necessário o WHERE( por enquanto )

                        ' [grid] ' + // este 'coringa' indica ao RadCORE o início da query usada na pesquisa padrão

                        ' SELECT ' +

                        '   tab.[[pk]] as "CÓDIGO", tab.nome , ' +
                        '        [[allpks]] ' +   // só é necessário o [[allpks]] aqui se estiver usando ALIAS em um campo CHAVE PRIMARIA

                        ' FROM  [[table]] tab ' ;
  //
  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:'+
                        'grid-resize|'+
                        'model-crud:0(btns-cls:ButtonThemeCrud btns-cls-ico:font-white)' +
                        ' btns-ico-search:fas-search-dollar cls-ico:font-white|'+
                        ' btns-ico-insert:fas-plus-circle cls-ico:font-white|'+
                        ' btns-ico-edit:fas-pen-square cls-ico:font-white rc-pulse|'+
                        ' btns-ico-delete:fas-minus-circle cls-ico:font-white|'+
                        ' btns-ico-cancel:fas-times-circle cls-ico:font-white|'+
                        ' btns-ico-save:fas-check-circle cls-ico:font-white|'+
                        ' btns-ico-options:fas-tasks cls-ico:font-white|'+
                        ' info-state:off|' +
                        'grid-paginator:center|' +
                        ']]';

  inherited;

  // parametros de pesquisa padrao - DEPOIS DO INHERITED | default search parameters - AFTER INHERITED
  //
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.' + ed_PK.Text + ' as "CÓDIGO"', 'CÓDIGO' );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.nome'          , 'NOME ' );


  // particularidades do form | form particularities
  //

end;

initialization
  RegisterClass(TfrmCadFORNECEDORES);

end.
