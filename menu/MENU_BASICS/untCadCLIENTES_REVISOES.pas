unit untCadCLIENTES_REVISOES; // v.6.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, untfrmBaseCRUDDetail, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  uniGUIBaseClasses, uniTimer, FireDAC.Comp.Client, Vcl.Menus, uniMainMenu,
  Data.DB, FireDAC.Comp.DataSet, uniEdit, uniPanel, uniBasicGrid, uniDBGrid,
  uniPageControl, uniButton, uniBitBtn, uniLabel, uniScrollBox, uniDBEdit,
  uniSpeedButton, uniDateTimePicker, uniDBDateTimePicker;

type
  TfrmCadCLIENTES_REVISOES = class(TfrmBaseCRUDDetail)
    rcBlock10: TUniContainerPanel;
    rcLabel10: TUniLabel;
    edLkpCLIENTES_VEICULOS: TUniDBEdit;
    rcBlock15: TUniContainerPanel;
    rcBlock20: TUniContainerPanel;
    UniLabel5: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    rcBlock30: TUniContainerPanel;
    UniLabel7: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    rcBlock40: TUniContainerPanel;
    UniLabel6: TUniLabel;
    UniDBFormattedNumberEdit1: TUniDBFormattedNumberEdit;
    procedure UniFormCreate(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
    procedure edLkpCLIENTES_VEICULOSClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function frmCadCLIENTES_REVISOES: TfrmCadCLIENTES_REVISOES;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, untdm_rc, untCadCLIENTES, uconsts_cfg, mkm_func_web;

function frmCadCLIENTES_REVISOES: TfrmCadCLIENTES_REVISOES;
begin
  Result := TfrmCadCLIENTES_REVISOES(mm.GetFormInstance(TfrmCadCLIENTES_REVISOES));
end;

procedure TfrmCadCLIENTES_REVISOES.btnDeleteRegClick(Sender: TObject);
begin
  // criticas antes da exclusao
  inherited;
  if mm.varB_OperationProcessed then
  begin
       // procedimentos pós-exclusao
  end;
end;

procedure TfrmCadCLIENTES_REVISOES.edLkpCLIENTES_VEICULOSClick(Sender: TObject);
begin
  inherited;
  dm_rc.rc_LookUpSearchFilter( Sender, 'tab.codicli = ' + ed_CodMaster.Text , '' );// 6.0.0.0  //'placa' );

end;

procedure TfrmCadCLIENTES_REVISOES.UniFormCreate(Sender: TObject);
begin
  // tab.codigo por tab.[[pk]]
  //
  // O objetivo foi facilitar deixando o 'coringa' [[pk]]' ser substituido no frmBaseCRUD pela respectiva
  // chave primaria da tabela atual que foi vinculada no click do menu principal
  //
  // haverá situações que precisarão de alteraçao, mas seguindo a estrutura proposta, já ajuda
  sqlMaster.close;
  sqlMaster.SQL.Text := ' SELECT [[fields]] ' + //tab.codicli ' +
                        '   FROM [[table]] tab ' +   // o WHERE de acordo com as PK´s da tabela serão
                                                     // adicionados dinamicamente
                        ' [grid] ' +                 // este 'coringa' indica ao RadCORE o início da query usada na pesquisa padrão

                        ' SELECT ' +

                        // se você quiser concatenar conteúdo de campos e manter compatibilidade sem recorrer ao FireDac pode usar a função abaixo:
                        // if you want to concatenate field content and maintain compatibility without resorting to FireDac you can use the function below:
                        '   ( ' + dm_rc.rc_GetSQL( mm.CONFIG_DATABASE, 'cmd_concat',0,0,'v.placa,'' '',c.descricao:35' ) + ' ) as Veiculo , ' +

                        '   tab.km_revisao as Revisao, ' +
                        '   tab.data, ' +
                        '   tab.total ,' +
                        //'   [[allpks]] ' +  // <- inserir todas as PKs dinamicamente
                        '   [[allpks]], ' +  // <- inserir todas as PKs dinamicamente
                                            //    serão usadas no momento de uma ALTERACAO/EXCLUSAO pra montar o filtro corretamente
                        '        [[grid-btn:edit]] '    + // create default action button: EDIT
                        '        [[grid-btn:delete]] '  + // create default action button: DELETE
                        '        [[grid-btn:options]] ' + // create default action button: OPTIONS

                        ' FROM [[table]] tab ' +

                        ' LEFT JOIN ' + dm_rc.rc_DBSchema + 'clientes_veiculos v ' + //6.1.0.0
                        ' ON v.codigo = tab.codiveiculo ' +

                        ' LEFT JOIN ' + dm_rc.rc_DBSchema + 'carros c ' + //6.1.0.0
                        ' ON c.codigo = v.codicarro ' ;//+

                        //' WHERE tab.codicli = ' + mm.varC_Code_ID ; // <- filtro PRINCIPAL de um mestre/detalhe

  ed_Where_Search.Text := '';
  ed_Order_Search.Text := '';

  // pre-defined grid columns attributes
  dbgSearchCRUD.Hint :=
    '[[' +
    //'no-paged|' +
    'fieldmasks:' +
    'grid-resize|' +
    'grid-paginator:center|' +
    'model-crud:3|'+ // test with action buttons
   // 'total[[' +
   // '  mask:#,#0.00##]]; ' +

    // test with action buttons
    'veiculo[[' +
    '    align:c|' +
    '    width:40% mobile-h:12% mobile-v:15%|' +

    'Revisao[['+
    '    mask:###### km| ' +
    '    width:15% mobile-h:18% mobile-v:22%|' +
    '    visible:false mobile-v]];' +           // visible=false ON MOBILE

    'data[['+
    '    width:15% mobile-h:35% mobile-v:65%]];' +
    '    visible:false mobile-v]];' +           // visible=false ON MOBILE

    'total[[' +
    '    width:15% mobile-h:10% mobile-v:12%|' +
    '    visible:false mobile-v]];' +           // visible=false ON MOBILE

//    'Revisao[[' +
//    '  mask:###### km]]; ' +

    ']]' ;
  inherited;
end;

initialization
  RegisterClass(TfrmCadCLIENTES_REVISOES);

end.
