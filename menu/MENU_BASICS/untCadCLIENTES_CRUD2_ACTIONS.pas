unit untCadCLIENTES_CRUD2_ACTIONS; // 7.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, uniGUIApplication,
  uniGUIClasses, uniGUIFrame, untFrmBaseCRUD_2, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, Vcl.Menus, uniMainMenu, uniGUIBaseClasses, uniSweetAlert, uniPanel, uniBasicGrid, uniDBGrid, uniEdit, uniMenuButton, uniButton,
  uniBitBtn, uniPageControl, uniScrollBox, uniLabel, uniMultiItem, uniComboBox, uniDBComboBox, uniDateTimePicker, uniDBDateTimePicker, uniDBEdit,
  uniHTMLFrame;

type
  TfrmCadCLIENTES_CRUD2_ACTIONS = class(TfrmBaseCRUD_2)
    edHiddenCompanyID: TUniDBEdit;
    rcBlock50: TUniContainerPanel;
    rcLabel420: TUniLabel;
    edSearchCNPJCPF: TUniEdit;
    rcBlock60: TUniContainerPanel;
    rcLabel430: TUniLabel;
    rcComboBox430: TUniComboBox;
    rcBlock70: TUniContainerPanel;
    rcLabel440: TUniLabel;
    edSearchDTCADASTRO: TUniDateTimePicker;
    rcBlock80: TUniContainerPanel;
    rcLabel450: TUniLabel;
    rcNumberEdit450: TUniNumberEdit;
    rcBlock90: TUniContainerPanel;
    rcLabel460: TUniLabel;
    edSearchVALOR_CONTRATO: TUniFormattedNumberEdit;
    rcBlock100: TUniContainerPanel;
    rcBlock1000: TUniContainerPanel;
    edCodigo: TUniDBEdit;
    UniLabel3Clone: TUniLabel;
    rcBlock1010: TUniContainerPanel;
    labDtCadClone: TUniLabel;
    edDtCad: TUniDBDateTimePicker;
    rcBlock1020: TUniContainerPanel;
    UniLabel5Clone: TUniLabel;
    UniDBDateTimePicker1: TUniDBDateTimePicker;
    rcBlock1060: TUniContainerPanel;
    labNome: TUniLabel;
    edCliName: TUniDBEdit;
    procedure UniFrameCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses MainModule, mkm_layout, uconsts, uconsts_cfg, mkm_func_web, untDM_RC;



procedure TfrmCadCLIENTES_CRUD2_ACTIONS.UniFrameCreate(Sender: TObject);
begin
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
  sqlMaster.close;
  sqlMaster.SQL.Text := ' SELECT [[fields]]   ' +
                        '   FROM [[table]] tab ' +
                        '  WHERE tab.[[pk]] = :table_pk ' +  //[PT] Apenas cadastro MESTRE é necessário o WHERE
                                                             //[EN] Only MASTER registration is necessary the WHERE
                        ' [grid] ' + //[PT] este 'coringa' indica ao RadCORE o início da query usada na pesquisa padrão
                                     //[EN] this 'wildcard' indicates to RadCORE the beginning of the query used in the standard search
                        ' SELECT ' +

                        //' [[firstshow:20]] ' +
                        '   tab.[[pk]] as "CÓDIGO", tab.nome, tab.cnpj_cpf ,' +
//                        '   tab.[[pk-show]] , tab.nome, tab.cnpj_cpf ,' +
                        '   tab.Fone1 , ' +
                        // se você quiser concatenar conteúdo de campos e manter compatibilidade sem recorrer ao FireDac pode usar a função abaixo:
                        // if you want to concatenate field content and maintain compatibility without resorting to FireDac you can use the function below:
                        //'   ( ' + dm_rc.rc_GetSQL( mm.CONFIG_DATABASE, 'cmd_concat',0,0,'tab.ddd1,tab.fone1:15' ) + ' ) as Fone1 , tab.descrifone1 , ' +
                        //'   tab.email , ' +
                        '   tab.cep , ' +
                        '   tab.endereco , tab.numero , tab.complemento , ' +
                        '   cidades.descricao as cidade , ' +
                        '   ufs.descricao as uf , ' +
                        '   tab.valor_contrato, ' +  //,
                        '        [[allpks]] ' + //[PT] só é necessário o [[allpks]] aqui se estiver usando ALIAS em um campo CHAVE PRIMARIA
                                                //[EN] you only need [[allpks]] here if you are using ALIAS in a PRIMARY KEY field
                        ' , tab.dtcadastro ' +     // ( If need to search by date only not a period )
                        ' , tab.dtaniversario ,' + // ( If need to search by date only not a period )

                        // New Dynamic Actions COLUMNS
                        //
                        // Essas configurações são apenas para demonstrar o recurso do RadCORE
                        // E não somente para executar acções de CRUD..vc pode criar qualquer tipo de ACTION BUTTON
                        // apenas lembre de adicionar o EVENTO respectivo em [gridname]CellClick do seu formulário
                        //
                        // These settings are just to demonstrate the RadCORE feature
                        // And not only do CRUD..vc actions, you can create any type of ACTION BUTTON
                        // just remember to add the respective EVENT in [gridname] CellClick of your form
                        //
                        // Abaixo ( grid-btn:( new ) também é para demonstrar que podemos configurar a classe CSS e o ícone da action
                        // O recurso de action buttons poderá ainda ser melhorado
                        //
                        // Below (grid-btn :( new) is also to demonstrate that we can configure the CSS class and the action icon
                        // The action buttons feature can still be improved
                        //

//                      '        [[grid-btn:edo]] '    + // create default action buttons: EDIT DELETE OPTIONS
                        '        [[grid-btn:edit]] '    + // create default action button: EDIT
                        '        [[grid-btn:delete]] '  + // create default action button: DELETE
                        '        [[grid-btn:options]] ' + // create default action button: OPTIONS

                        ' FROM  [[table]] tab ' +

                        ' LEFT JOIN ' + dm_rc.rc_DBSchema + 'ufs ufs ON ufs.codigo = tab.codiuf ' + //6.1.0.0
                        ' LEFT JOIN ' + dm_rc.rc_DBSchema + 'cidades cidades ON cidades.codigo = tab.codicidade ' ; //6.1.0.0

  //[PT] se esta global estiver preenchida, ao clicar em EXCLUIR , o registro não será excluído fisicamente do banco de dados.
  //      o RadCORE já oferece alguma codificação para este recurso mas dependendo da sua aplicação poderá ser necessário a sua intervenção no código
  //      para adicionar mais controles.
  //[EN] if this global is filled, when clicking on DELETE , the record will not be physically deleted from the database
  //     RadCORE already offers some coding for this resource but depending on your application it may be necessary for you to intervene in the code
  //     to add more controls.
  ed_Table_Deleted_Field.Text := ''; // Ex: ed_Table_Deleted_Field.Text := 'rec_deleted';

  //[PT] as definições abaixo serão usadas na formação da query da pesquisa dinâmica do grid( sqlSearchMaster )
  //      você pode usar para criar filtros multiempresa, registro excluido logicamente etc.
  //[EN] definitions below will be used in the formation of the dynamic grid search query ( sqlSearchMaster )
  //      you can use to create multi-company filters, logically excluded record, etc.
  ed_Where_Search.Text   := ' tab.codiemp = ' + IntToStr( mm.varI_Code_Company ) ; // Ex: ed_Where_Search.Text := ' tab.' + ed_Table_Deleted_Field.Text + ' = ''N''';
  ed_GroupBy_Search.Text := '';
  ed_Having_Search.Text  := '';
  ed_Order_Search.Text   := '';

  // default QuickSearch
  edQuickSearch.Hint     := rc_AddHintAttr( 'search-field:nome', edQuickSearch.Hint , true );

  // pre-defined grid columns attributes
  //
  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:' +
                        //'no-paged|' +
                        //'grid-noforcefit|' +
                        'grid-forcefit:10 mobile-v-2 mobile-h-8|' +
                        //'model-crud:1|' +
                        'model-crud:3(btns:nobg)|'+   //only for model-crud-3
                        'grid-resize|' +
                        'firstshow:0|'+
                        'grid-paginator:center|' +
                        'código[[' +
                        //'   locked|' +
                        '   title:translate(codigo)|' +
                        '   titlealign:c|' +
                        '   align:c|' +
                        '   width:135 mobile:90]];' +

                        //[PT]
                        // alguns campos com strings muito grandes são interpretados pelo unigui como MEMO e não
                        // sao exibidos, este atributo força a exibição do texto
                        //[EN]
                        // some fields with very large strings are interpreted by unigui as MEMO and not
                        // are displayed, this attribute forces the text to be displayed
                        //'memotest[[' +
                        //'   displaymemo|]];' +

                        'nome[[' +
                        '   cls:{valor_contrato<130,color-red rc-font-bold,color-black rc-font-bold}|'+   // 6.0.0.0
                        '   title:translate(nome)]];' +

                        'email[[' +
                        '     visible:false mobile]];' +

                        'endereco[[' +
                        '     visible:false mobile]];' +

                        'numero[[' +
                        '   visible:false mobile|' +
                        '   align:r]];' +

                        'complemento[[' +
                        '     visible:false]];' +

                        'cidade[[' +
                        '     visible:false mobile]];' +

                        'uf[[' +
                        '     visible:false mobile]];' +

                        'fone1[[' +
                        '     visible:false mobile]];' +

                        'cnpj_cpf[[' +
                        '     visible:false mobile]];' +

                        'dtcadastro[[' +
                        '     visible:false]];' +
                        'dtaniversario[[' +
                        '     visible:false]];' +

                        'cep[['+
                        '   visible:false mobile|' +
                        '   align:c|'+
                        '   mask:' + mm.varC_Mask_cep + ']];' +

                        'valor_contrato[[' +
                        '   visible:false mobile|' +
                        '   cls:{<130,color-red rc-font-bold,color-black rc-font-bold}|'+
                        '   mask:' + PFmtSettings.CurrencyString + ' ' + mm.varC_Mask_float + ']]; ' +
                        ']]';

//                        'limitecredito[[' +
//                        '   visible:false mobile|' +
//                        '   cls:color-blue]];' +
//                        '   mask:' + mm.varC_Mask_Integer + ']]; ' +
//                        ']]';

  //[PT] se a tabela atual permitir pesquisas por intervalo de datas...
  //      parametros de pesquisa especifica por datas( pesq. por periodo )  - ANTES DO INHERITED
  //      os periodos de pesq. de data só serão exibidos se houver algum campo adicionado
  //[EN] if the current table allows searches by date range...
  //      specific search parameters by dates (search by period) - BEFORE THE INHERITED
  //      the search periods. of date will only be displayed if there is any field added
  //dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDFieldDate.name, 'tab.dtcadastro'    , 'CADASTRO' );
  //dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDFieldDate.name, 'tab.dtaniversario' , 'NASCIMENTO' );

  //[PT] Ajusta detalhes do formulário
  //[EN] Adjust form details
//  labCrudIcon.Hint := '[[' +
//                      'cls:rc-label-clear|' +
//                      'ico:fas-user |' +
//                      'center:parent x' +
//                      ']]';
//  labCrudIcon.Hint := '[[' +
//                      'ico-stack:fas-users cls:color-silver size:1x|' +
//                      'center:parent x ' +
//                      ']]';
  //[PT] O Height do bloco que contém o "alerta" ( labCrudAlertDetails ) deve ser ajustado manualmente de acordo com o conteúdo
  //[EN] The Height of the block containing the "alert" ( labCrudAlertDetails ) must be adjusted manually according to the content
  rcBlock330.Hint             := rc_SetHintAttr( '55 off:0 mobile-v-60 mobile-h-55', 'hr:', rcBlock330.Hint, false );
  //[PT] Descreva aqui por quê esse formulário de cadastro é importante para a aplicação
  //[EN] Describe here why this registration form is important for the application
  labCrudAlertDetails.Caption := 'O cadastro de clientes é muito importante para seu negócio...';
  //[PT] O Height do bloco que contém a "lista de detalhes" ( labCrudAddingListDetails ) deve ser ajustado manualmente de acordo com o conteúdo
  //[EN] The Height of the block containing the "list of details" ( labCrudAddingListDetails ) must be adjusted manually according to the content
  rcBlock350.Hint := rc_SetHintAttr( '150 off:0 mobile-v-150 mobile-h-150', 'hr:', rcBlock350.Hint, false );
  //[PT] Os captions abaixo precisam ser ajustados manualmente
  //[EN] The captions below need to be adjusted manually
  labCrudTitleDetails.Caption       := 'Cadastro de Clientes';
  labCrudTitleAddingDetails.Caption := 'Adicionando Clientes, você poderá:';
  //[PT] Descreva aqui o que poderá ser feito na aplicação, se forem adicionados registros nesse formulário
  //[EN] Describe here what can be done in the application if records are added to this form
  labCrudAddingListDetails.Caption  :=
     rc_MakeListItem( 'Criar Orçamentos' , litDot, 'bg-themecrud' ) +
     rc_MakeListItem( 'Realizar Vendas'  , litSquare, 'bg-green' ) +
     rc_MakeListItem( 'Enviar Emails'    , litSquareRound, 'bg-orange' ) +
     rc_MakeListItem( 'Controlar Contas a Receber', litDiamond, 'bg-purple' ) +
     rc_MakeListItem( 'Emitir Notas Fiscais', litIconFAWS, 'color-themecrud', 'fas-chevron-circle-right' ) ;
  //[PT] Os captions etc serão traduzidos pelo frmBaseCRUD_2 mas abaixo vc poderá ver como ajustar para seu padrão se desejar
  //[EN] Captions etc will be translated by frmBaseCRUD_2 but below you can see how to adjust it to your default if you wish
//  edQuickSearch.EmptyText           := 'Search for...';
//  btnAddRec.Caption                 := 'New';
//  btnEditRec.Caption                := 'Edit';
//  btnDelRec.Caption                 := 'Delete';
//  btnMenuOptions.Caption            := 'More';
//  btnSaveRec.Caption                := 'Save';
//  btnCancelRec.Caption              := 'Cancel';
//  btnSearchAdv.Caption              := 'Search';
//  btnClearSearchAdv.Caption         := 'Clear';
//  btnCrudImport.Caption             := 'Import';
//  btnCrudTutorial.Caption           := 'Tutorial';
//  btnCrudAddFirst.Caption           := 'Add First';

  inherited;

  //[PT] Exemplo de recurso exclusivo da sua software house, vinculado ao seu CNPJ( no. de registro da sua empresa )
  //[EN] Example of an exclusive feature of your software house, linked to your CNPJ ( your company registration number )
  //tabLicencas.TabVisible := ( mm.varC_Doc_Customer = SOFTWAREHOUSE_CNPJ );  //se o sistema rodando atual for da sua software house

  //[PT] parametros de pesquisa padrao - DEPOIS DO INHERITED | default search parameters - AFTER INHERITED
  //      caso no SELECT do GRID acima...vc use ALIAS e este campo for usado pra pesquisa, coloque o alias TAMBÉM abaixo
  //      sempre use o ' as ' pra definir o ALIAS Ex: tab.nome as CLIENTE -> NÃO use: (tab.nome)CLIENTE
  //[EN] standard search parameters - AFTER INHERITED
  //      if in the SELECT of the GRID above... you use ALIAS and this field is used for the search, place the alias ALSO below
  //      always use ' as ' to define the ALIAS Ex: tab.name as CUSTOMER -> DO NOT use: (tab.name)CLIENTE
  //dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.' + ed_PK.Text + ' as "CÓDIGO"', 'CÓDIGO' );
  //dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.nome'          , 'NOME ou FANTASIA' );
  //dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.razsoc as "RAZÃO SOCIAL"'        , 'RAZÃO SOCIAL' );
  //dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.cnpj_cpf'      , 'CNPJ ou CPF' );

  //dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.dtcadastro'    , 'DATA CADASTRO' );
  //dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.dtaniversario'    , 'DATA NASCIMENTO' );

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
  RegisterClass( TfrmCadCLIENTES_CRUD2_ACTIONS );

end.
