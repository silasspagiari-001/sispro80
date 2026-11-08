unit untCadTB_TEST; // 6.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, untFrmBaseCRUD, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.Client, Vcl.Menus, uniMainMenu, Data.DB, FireDAC.Comp.DataSet, uniGUIBaseClasses, uniSweetAlert, uniHTMLFrame, uniDateTimePicker, uniCheckBox, uniMultiItem, uniComboBox,
  uniScrollBox, uniPanel, uniBasicGrid, uniDBGrid, uniPageControl, uniButton, uniBitBtn, uniEdit, uniLabel, uniDBEdit, uniDBDateTimePicker;

type
  TFrmCadTB_TEST = class(TfrmBaseCRUD)
    rcBlock10: TUniContainerPanel;
  rcLabel10: TUniLabel;
  edIDFILIAL: TUniDBNumberEdit;
  rcBlock20: TUniContainerPanel;
  rcLabel20: TUniLabel;
  edIDPROD: TUniDBNumberEdit;
  rcBlock30: TUniContainerPanel;
  rcLabel30: TUniLabel;
  edDESCRICAO: TUniDBEdit;

  procedure UniFrameCreate(Sender: TObject);
  procedure btnSaveRegClick(Sender: TObject);
  procedure btnDeleteRegClick(Sender: TObject);
    procedure btnNewRegClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses untDM_RC, MainModule, mkm_layout;

procedure TFrmCadTB_TEST.btnNewRegClick(Sender: TObject);
begin
  inherited;
  sqlMaster.FieldByName( 'idfilial' ).AsInteger := mm.varI_Code_Company;
end;

procedure TFrmCadTB_TEST.btnSaveRegClick(Sender: TObject);
begin
  //[PT] Caso precise validar algo que não foi possível fazer usando a validação dinâmica do RadCORE,
  //      você pode inserir seu código antes do inherited.
  //[EN] If you need to validate something that wasn't possible using RadCORE's dynamic validation,
  //      you can insert your code before the inherited.

  inherited;


  //[PT] Caso precise atualizar alguma informação após a gravação do registro,
  //      você pode inserir seu código após o inherited.
  //[EN] If you need to update any information after recording the record,
  //      you can insert your code after the inherited.
  if mm.varI_ApplyUpdateErrors = 0 then
  begin

  end;





  
  //[PT] para manter cadastrando...
  //      não tem como fazermos isso dentro no "frmBaseCRUD", por isso este trecho de código
  //      tem que ser replicado nos formulários que desejar ter esse recurso
  //
  //[EN] to keep registering ...
  //      there's no way we can do this inside "frmBaseCRUD", so this code snippet
  //      has to be replicated in the forms that want to have this feature
  // dm_rc.rc_ContinueRegistering( self );

end;

 
procedure TFrmCadTB_TEST.btnDeleteRegClick(Sender: TObject);
begin
  //[PT] condicionais antes da exclusao
  //[EN] conditionals before deletion

  inherited;
  
  //  if mm.varB_OperationProcessed then
  //  begin
  //       //[PT] procedimentos pós-exclusao
  //       //[EN] procedures after deletion
  //  end;
end;

procedure TFrmCadTB_TEST.UniFrameCreate(Sender: TObject);
var
   cTagForm : string;
begin
  //[PT] Exemplo de captura de "tag-form:" passada em "uMenu_BASICS" na formação do menu dinâmico.
  //[EN] Example of capturing "tag-form:" passed in "uMenu_BASICS" in dynamic menu formation.
  cTagForm := dm_rc.rc_GetTagFormAttr( Self, true );
  dm_rc.rc_ShowInfo( 'tag-form:' + cTagForm );
  //[PT]
  //
  // O 'coringa' [[fields]] será substituído pela sequência de todos os DATAFIELD existentes
  // no seu formulário. Os campos que não serão acessíveis/visíveis para o usuário devem ser
  // adicionados como um "HIDDNE FIELD" no form ou simplesmente, adicione após o coringa [[field]]
  //
  // Ex: SELECT [[fields]], tab.field1, tab.field2 etc como um select normal
  //
  // O 'coringa' [[table]] será substituido no frmBaseCRUD pela respectiva tabela que foi vinculada no click do menu principal
  //
  // O 'coringa' [[pk]] será substituido no frmBaseCRUD pela respectiva chave primaria da tabela
  // atual que foi vinculada no click do menu principal, por padrão ele não é exibido, para que a chave primária seja exibida
  // substitua [[pk]] por [[pk-show]]
  //
  // haverá situações que precisarão de alteraçao, adicionando JOINS etc.., mas seguindo a estrutura proposta,
  // a maioria dos forms terá pouquíssima mudança
  //
  //[EN]
  //
  // The 'wildcard' [[fields]] will be replaced by the string of all existing DATAFIELDs
  // in your form. Fields that will not be accessible/visible to the user must be
  // added as a "HIDDNE FIELD" in the form or simply add it after the wildcard [[field]]
  //
  // Ex: SELECT [[fields]], tab.field1, tab.field2 etc like a normal select
  //
  // The 'wildcard' [[table]] will be replaced in frmBaseCRUD by the respective table that was linked in the main menu click
  //
  // The 'wildcard' [[pk]] will be replaced in frmBaseCRUD by the respective primary key of the table
  // current one that was linked on the main menu click, by default it is not displayed, so the primary key is displayed
  // replace [[pk]] with [[pk-show]]
  //
  // there will be situations that will need to be changed, adding JOINS etc.., but following the proposed structure,
  // most forms will have very little change
  //8.4.0.0
  sqlMaster.close;
  sqlMaster.SQL.Text := ' SELECT [[fields]] ' +
                        '   FROM [[table]] tab ' +
                        '  WHERE tab.[[pk]] = :table_pk ' +  //[PT] Apenas cadastro MESTRE é necessário o WHERE
                                                             //[EN] Only MASTER registration is necessary the WHERE
                        ' [grid] ' + //[PT] este 'coringa' indica ao RadCORE o início da query usada na pesquisa padrão
                                     //[EN] this 'wildcard' indicates to RadCORE the beginning of the query used in the standard search
                        ' SELECT ' +
//
                        '   tab.idfilial,' +
                        '   tab.[[pk-show]], ' +
                        '   tab.Descricao ' +
                        //'   [[allpks]] ' +   //[PT] só é necessário o [[allpks]] aqui se estiver usando ALIAS em um campo CHAVE PRIMARIA
                                               //[EN] you only need [[allpks]] here if you are using ALIAS in a PRIMARY KEY field
                        ' FROM  [[table]]  tab ' ;

  //[PT] se esta global estiver preenchida, ao clicar em EXCLUIR , o registro não será excluído fisicamente do banco de dados.
  //      o RadCORE já oferece alguma codificação para este recurso mas dependendo da sua aplicação poderá ser necessário a sua intervenção no código
  //      para adicionar mais controles.
  //[EN] if this global is filled, when clicking on DELETE , the record will not be physically deleted from the database
  //      RadCORE already offers some coding for this resource but depending on your application it may be necessary for you to intervene in the code
  //      to add more controls.
  ed_Table_Deleted_Field.Text := ''; // Ex: ed_Table_Deleted_Field.Text := 'deleted';

  //[PT] as definições abaixo serão usadas na formação da query da pesquisa dinâmica do grid( sqlSearchMaster )
  //      você pode usar para criar filtros multiempresa, registro excluido logicamente etc.
  //[EN] definitions below will be used in the formation of the dynamic grid search query ( sqlSearchMaster )
  //      you can use to create multi-company filters, logically excluded record, etc.
  ed_Where_Search.Text   := ' tab.idfilial = ' + IntToStr( mm.varI_Code_Company ) ; // Ex: ed_Where_Search.Text := ' tab.' + ed_Table_Deleted_Field.Text + ' = ''N''';
  ed_GroupBy_Search.Text := '';
  ed_Having_Search.Text  := '';
  ed_Order_Search.Text   := ''; // 'tab.description';

  //[PT] se a tabela atual permitir pesquisas por intervalo de datas...
  //      parametros de pesquisa especifica por datas( pesq. por periodo )  - ANTES DO INHERITED
  //      os periodos de pesq. de data só serão exibidos se houver algum campo adicionado
  //[EN] if the current table allows searches by date range...
  //      specific search parameters by dates (search by period) - BEFORE THE INHERITED
  //      the search periods. of date will only be displayed if there is any field added
  //
  // dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDFieldDate.name, 'tab.data' , 'DATA' );

  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:'+
                        'grid-resize|'+
                        'model-crud:2(btns-cls:ButtonGray)|'+
                        //'model-crud:4(btns-cls:ButtonGray)|'+
                        //'model-crud:4|'+
                        'info-state:off|' +
                        //active RC PAGINATOR 
                        'grid-paginator:center|'+ 
                        // field definitions
                        //'codigo[[titlealign:c|align:c]];' +
                        ']]';
  inherited;
  //[PT] parametros de pesquisa padrao - DEPOIS DO INHERITED | default search parameters - AFTER INHERITED
  //      caso no SELECT do GRID acima...vc use ALIAS e este campo for usado pra pesquisa, coloque o alias TAMBÉM abaixo
  //      sempre use o ' as ' pra definir o ALIAS Ex: tab.nome as CLIENTE -> NÃO use: (tab.nome)CLIENTE
  //[EN] standard search parameters - AFTER INHERITED
  //      if in the SELECT of the GRID above... you use ALIAS and this field is used for the search, place the alias ALSO below
  //      always use ' as ' to define the ALIAS Ex: tab.name as CUSTOMER -> DO NOT use: (tab.name)CLIENTE  dm_rc.rc_FillSearchFieldsCRUD( Self,   cbxSearchCRUDField1.name   , 'tab.' + ed_PK.Text , 'CÓDIGO' );
  // dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.yoursearchfield'     , 'FIELDALIAS' );

  //[PT] parametros de pesquisa complementar( opcional )
  //[EN] additional search parameters (optional)
  //
  // dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField2.name   , '' , '' );
  //
  //
  //[PT] adicione aqui codificação específica para este form, caso seja necessário
  //[EN] add here specific coding for this form if needed
  //
end;

initialization
   RegisterClass( TFrmCadTB_TEST ) ;

end.
