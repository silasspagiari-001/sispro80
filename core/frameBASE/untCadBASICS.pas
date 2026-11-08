unit untCadBASICS; // 6.0.0.0

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, System.StrUtils, str_func,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, untfrmBaseCRUD, FireDAC.Stan.Intf, IniFiles, //6.0.0.0
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uniEdit,
  uniDateTimePicker, uniCheckBox, uniMultiItem, uniComboBox, uniBasicGrid,
  uniDBGrid, uniPanel, uniPageControl, uniButton, uniBitBtn, uniLabel,
  uniGUIBaseClasses, uniDBComboBox, uniDBDateTimePicker, uniDBEdit,
  uniDBCheckBox, uniSpeedButton, Vcl.Menus, uniMainMenu, uniScrollBox,
  uniHTMLFrame, uniSweetAlert;

type
  TfrmCadBASICS = class(TfrmBaseCRUD)
    rcBlock1: TUniContainerPanel;
    edID: TUniDBEdit;
    labID: TUniLabel;
    rcBlock4: TUniContainerPanel;
    edDescription: TUniDBEdit;
    labDescription: TUniLabel;
    procedure UniFrameCreate(Sender: TObject);
    procedure UniFrameDestroy(Sender: TObject);
    procedure btnDeleteRegClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure rc_ConfigTranslate ;//6.0.0.0
    procedure rc_LoadConfigData;
  end;

implementation

{$R *.dfm}

uses untdm_rc, MainModule, untFrmLookUp, Main, uconsts, uconsts_cfg, ServerModule, mkm_func_web;

procedure TfrmCadBASICS.btnDeleteRegClick(Sender: TObject);
begin

     // aqui você pode customizar a mensagem de exclusão de registro
     // use essa variável em qualquer form antes do inherited
     //
     // here you can customize the record deletion message
     // use this variable in any form before inherited

     // mm.varC_CustomMsg := 'Quer mesmo excluir o registro ?';

  inherited;

  // no frmBaseCRUD já tem a critica de MOVIMENTACAO pra o registro que
  // esta sendo deletado...
  //
  // dm_rc.rc_HasCodeRegistered
  //

  // criticas antes da exclusao
  //

  if mm.varB_OperationProcessed then
  begin

       // procedimentos pós-exclusao
       //

  end;
end;
//6.0.0.0
procedure TfrmCadBASICS.rc_ConfigTranslate;
begin
     rc_LoadConfigData;
end;

procedure TfrmCadBASICS.rc_LoadConfigData;
var
   inifile : Tinifile;
begin
     //[PT]
     // frmCadBASICS é usado apenas para tabelas que contenham a estrutura baseado em um
     //              código sequencial e uma descrição, onde vários formulários irão se
     //              basear nessa estrutura e economizar trabalho de desenvolvimento.
     //
     // Na tabelas que acompanham o RADCORE eu utilizo por padrão os campos
     // CODIGO( para chave primária ) e DESCRICAO( para descrever o conteúdo )
     // para formação do ARRAY para uso com "Cadastros Básicos" ( ARRAY_BASICS ),
     // você pode alterar de acordo com a sua estrutura como descrito no comentário ao lado
     // das duas variáveis logo abaixo( em cada idioma )
     //[EN]
     // frmCadBASICS is only used for tables that contain the structure based on a
     // sequential code and a description, where various forms will be
     // base on this structure and save development work.
     //
     // In the tables that come with RADCORE I use the fields by default
     // CODE (for primary key) and DESCRIPTION (to describe the content)
     // for forming the ARRAY for use with "Basic Records" ( ARRAY_BASICS ),
     // you can change it according to your structure as described in the comment next door
     // of the two variables below.( to each language )
     //
     //mm.ARRAY_BASICS_FLD_ID_NAME           := 'CODIGO';    // CODIGO, ID, SEQ...
     //mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := 'DESCRICAO'; // DESCRICAO, DESCRIPTION, TEXT...
     try
        IniFile := TiniFile.Create( sm.FilesFolderPath + StringReplace( StrTokenClear( APP_NAME ), ' ', '', [rfReplaceAll] ) + '_frmCadBASICS_cfg.ini' );
        mm.varLT_Lang := TRCLanguagesType( dm_rc.rc_GetIndexFromArray( mm.CONFIG_LANGUAGE, ARRAY_LANGUAGES ) );
        //MSG STRINGS
        case mm.varLT_Lang of
             ltpt_BR, ltpt_PT :  begin
                         mm.ARRAY_BASICS_FLD_ID_NAME           := IniFile.ReadString( 'config_BR' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
                         mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := IniFile.ReadString( 'config_BR' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
                         // aliases / grid columns
                         mm.ARRAY_BASICS_FLD_ID_ALIAS          := IniFile.ReadString( 'config_BR' , 'FLD_ID_ALIAS'             , 'CÓDIGO' );
                         mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := IniFile.ReadString( 'config_BR' , 'FLD_ID_DESCRIPTION_ALIAS' , 'DESCRIÇÃO' );
                         mm.ARRAY_BASICS_FLD_ID_LABEL          := IniFile.ReadString( 'config_BR' , 'FLD_ID_LABEL'             , 'CÓDIGO' );
                         mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := IniFile.ReadString( 'config_BR' , 'FLD_ID_DESCRIPTION_LABEL' , 'DESCRIÇÃO' );
                         mm.MSG_FIELD_NAME_CODE                := IniFile.ReadString( 'config_BR' , 'FLD_ID_LABEL'             , 'Código' );
                         mm.MSG_FIELD_NAME_DESCRIPTION         := IniFile.ReadString( 'config_BR' , 'FLD_ID_DESCRIPTION_LABEL' , 'Descrição' );
                       end;
             lten_US, lten_GB: begin
                      mm.ARRAY_BASICS_FLD_ID_NAME           := IniFile.ReadString( 'config_US' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
                      mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := IniFile.ReadString( 'config_US' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
                      // aliases / grid columns
                      mm.ARRAY_BASICS_FLD_ID_ALIAS          := IniFile.ReadString( 'config_US' , 'FLD_ID_ALIAS'             , 'ID' );
                      mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := IniFile.ReadString( 'config_US' , 'FLD_ID_DESCRIPTION_ALIAS' , 'DESCRIPTION' );
                      mm.ARRAY_BASICS_FLD_ID_LABEL          := IniFile.ReadString( 'config_US' , 'FLD_ID_LABEL'             , 'ID' );
                      mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := IniFile.ReadString( 'config_US' , 'FLD_ID_DESCRIPTION_LABEL' , 'DESCRIPTION' );
                      mm.MSG_FIELD_NAME_CODE                := IniFile.ReadString( 'config_US' , 'FLD_ID_LABEL'             , 'Id' );
                      mm.MSG_FIELD_NAME_DESCRIPTION         := IniFile.ReadString( 'config_US' , 'FLD_ID_DESCRIPTION_LABEL' , 'Description' );
                    end;
             ltes_ES: begin
                         mm.ARRAY_BASICS_FLD_ID_NAME           := IniFile.ReadString( 'config_ES' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
                         mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := IniFile.ReadString( 'config_ES' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
                         // aliases / grid columns
                         mm.ARRAY_BASICS_FLD_ID_ALIAS          := IniFile.ReadString( 'config_ES' , 'FLD_ID_ALIAS'             , 'CÓDIGO' );
                         mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := IniFile.ReadString( 'config_ES' , 'FLD_ID_DESCRIPTION_ALIAS' , 'DESCRIÇÃO' );
                         mm.ARRAY_BASICS_FLD_ID_LABEL          := IniFile.ReadString( 'config_ES' , 'FLD_ID_LABEL'             , 'CÓDIGO' );
                         mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := IniFile.ReadString( 'config_ES' , 'FLD_ID_DESCRIPTION_LABEL' , 'DESCRIÇÃO' );
                         mm.MSG_FIELD_NAME_CODE                := IniFile.ReadString( 'config_ES' , 'FLD_ID_LABEL'             , 'Código' );
                         mm.MSG_FIELD_NAME_DESCRIPTION         := IniFile.ReadString( 'config_ES' , 'FLD_ID_DESCRIPTION_LABEL' , 'Descrição' );
                    end;
           ltfr_FR: begin
                    mm.ARRAY_BASICS_FLD_ID_NAME           := IniFile.ReadString( 'config_FR' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
                    mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := IniFile.ReadString( 'config_FR' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
                    // aliases / grid columns
                    mm.ARRAY_BASICS_FLD_ID_ALIAS          := IniFile.ReadString( 'config_FR' , 'FLD_ID_ALIAS'             , 'CÓDIGO' );
                    mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := IniFile.ReadString( 'config_FR' , 'FLD_ID_DESCRIPTION_ALIAS' , 'DESCRIPCIÓN' );
                    mm.ARRAY_BASICS_FLD_ID_LABEL          := IniFile.ReadString( 'config_FR' , 'FLD_ID_LABEL'             , 'CÓDIGO' );
                    mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := IniFile.ReadString( 'config_FR' , 'FLD_ID_DESCRIPTION_LABEL' , 'DESCRIPCIÓN' );
                    mm.MSG_FIELD_NAME_CODE                := IniFile.ReadString( 'config_FR' , 'FLD_ID_LABEL'             , 'Código' );
                    mm.MSG_FIELD_NAME_DESCRIPTION         := IniFile.ReadString( 'config_FR' , 'FLD_ID_DESCRIPTION_LABEL' , 'Descripción' );

               end;
           ltde_DE: begin  // germany
                    mm.ARRAY_BASICS_FLD_ID_NAME           := IniFile.ReadString( 'config_DE' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
                    mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := IniFile.ReadString( 'config_DE' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
                    // aliases / grid columns
                    mm.ARRAY_BASICS_FLD_ID_ALIAS          := IniFile.ReadString( 'config_DE' , 'FLD_ID_ALIAS'             , 'CODE' );
                    mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := IniFile.ReadString( 'config_DE' , 'FLD_ID_DESCRIPTION_ALIAS' , 'BESCHREIBUNG' );
                    mm.ARRAY_BASICS_FLD_ID_LABEL          := IniFile.ReadString( 'config_DE' , 'FLD_ID_LABEL'             , 'CODE' );
                    mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := IniFile.ReadString( 'config_DE' , 'FLD_ID_DESCRIPTION_LABEL' , 'BESCHREIBUNG' );
                    mm.MSG_FIELD_NAME_CODE                := IniFile.ReadString( 'config_DE' , 'FLD_ID_LABEL'             , 'Code' );
                    mm.MSG_FIELD_NAME_DESCRIPTION         := IniFile.ReadString( 'config_DE' , 'FLD_ID_DESCRIPTION_LABEL' , 'Beschreibung' );
               end;
           // 6.0.0.0 ( thanks to ANDREA CAMBARAU )
           ltit_IT: begin  // Italian
                    mm.ARRAY_BASICS_FLD_ID_NAME           := IniFile.ReadString( 'config_IT' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
                    mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := IniFile.ReadString( 'config_IT' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
                    // aliases / grid columns
                    mm.ARRAY_BASICS_FLD_ID_ALIAS          := IniFile.ReadString( 'config_IT' , 'FLD_ID_ALIAS'             , 'CODICE' );
                    mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := IniFile.ReadString( 'config_IT' , 'FLD_ID_DESCRIPTION_ALIAS' , 'DESCRIZIONE' );
                    mm.ARRAY_BASICS_FLD_ID_LABEL          := IniFile.ReadString( 'config_IT' , 'FLD_ID_LABEL'             , 'CODICE' );
                    mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := IniFile.ReadString( 'config_IT' , 'FLD_ID_DESCRIPTION_LABEL' , 'DESCRIZIONE' );
                    mm.MSG_FIELD_NAME_CODE                := IniFile.ReadString( 'config_IT' , 'FLD_ID_LABEL'             , 'Codice' );
                    mm.MSG_FIELD_NAME_DESCRIPTION         := IniFile.ReadString( 'config_IT' , 'FLD_ID_DESCRIPTION_LABEL' , 'Descrizione' );

               end;
           lttr_TR : begin  // Turkish
                    mm.ARRAY_BASICS_FLD_ID_NAME           := IniFile.ReadString( 'config_TR' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
                    mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := IniFile.ReadString( 'config_TR' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
                    // aliases / grid columns
                    mm.ARRAY_BASICS_FLD_ID_ALIAS          := IniFile.ReadString( 'config_TR' , 'FLD_ID_ALIAS'             , 'KOD' );
                    mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := IniFile.ReadString( 'config_TR' , 'FLD_ID_DESCRIPTION_ALIAS' , 'TANIM' );
                    mm.ARRAY_BASICS_FLD_ID_LABEL          := IniFile.ReadString( 'config_TR' , 'FLD_ID_LABEL'             , 'KOD' );
                    mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := IniFile.ReadString( 'config_TR' , 'FLD_ID_DESCRIPTION_LABEL' , 'TANIM' );
                    mm.MSG_FIELD_NAME_CODE                := IniFile.ReadString( 'config_TR' , 'FLD_ID_LABEL'             , 'Kod' );
                    mm.MSG_FIELD_NAME_DESCRIPTION         := IniFile.ReadString( 'config_TR' , 'FLD_ID_DESCRIPTION_LABEL' , 'Tanim' );
               end;
           ltru_RU : begin  // Russian
                    mm.ARRAY_BASICS_FLD_ID_NAME           := IniFile.ReadString( 'config_RU' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
                    mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := IniFile.ReadString( 'config_RU' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
                    // aliases / grid columns
                    mm.ARRAY_BASICS_FLD_ID_ALIAS          := IniFile.ReadString( 'config_RU' , 'FLD_ID_ALIAS'             , 'КОД' );
                    mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := IniFile.ReadString( 'config_RU' , 'FLD_ID_DESCRIPTION_ALIAS' , 'ОПИСАНИЕ' );
                    mm.ARRAY_BASICS_FLD_ID_LABEL          := IniFile.ReadString( 'config_RU' , 'FLD_ID_LABEL'             , 'КОД' );
                    mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := IniFile.ReadString( 'config_RU' , 'FLD_ID_DESCRIPTION_LABEL' , 'ОПИСАНИЕ' );
                    mm.MSG_FIELD_NAME_CODE                := IniFile.ReadString( 'config_RU' , 'FLD_ID_LABEL'             , 'Код' );
                    mm.MSG_FIELD_NAME_DESCRIPTION         := IniFile.ReadString( 'config_RU' , 'FLD_ID_DESCRIPTION_LABEL' , 'Описание' );
               end;
          ltzn_CH : begin
                      mm.ARRAY_BASICS_FLD_ID_NAME           := IniFile.ReadString( 'config_CH' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
                      mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := IniFile.ReadString( 'config_CH' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
                      // aliases / grid columns
                      mm.ARRAY_BASICS_FLD_ID_ALIAS          := IniFile.ReadString( 'config_CH' , 'FLD_ID_ALIAS'             , 'ID' );
                      mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := IniFile.ReadString( 'config_CH' , 'FLD_ID_DESCRIPTION_ALIAS' , 'DESCRIPTION' );
                      mm.ARRAY_BASICS_FLD_ID_LABEL          := IniFile.ReadString( 'config_CH' , 'FLD_ID_LABEL'             , 'ID' );
                      mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := IniFile.ReadString( 'config_CH' , 'FLD_ID_DESCRIPTION_LABEL' , 'DESCRIPTION' );
                      mm.MSG_FIELD_NAME_CODE                := IniFile.ReadString( 'config_CH' , 'FLD_ID_LABEL'             , 'Id' );
                      mm.MSG_FIELD_NAME_DESCRIPTION         := IniFile.ReadString( 'config_CH' , 'FLD_ID_DESCRIPTION_LABEL' , 'Description' );
                    end;
          ltin_ID : begin
                      mm.ARRAY_BASICS_FLD_ID_NAME           := IniFile.ReadString( 'config_ID' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
                      mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := IniFile.ReadString( 'config_ID' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
                      // aliases / grid columns
                      mm.ARRAY_BASICS_FLD_ID_ALIAS          := IniFile.ReadString( 'config_ID' , 'FLD_ID_ALIAS'             , 'ID' );
                      mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := IniFile.ReadString( 'config_ID' , 'FLD_ID_DESCRIPTION_ALIAS' , 'DESCRIPTION' );
                      mm.ARRAY_BASICS_FLD_ID_LABEL          := IniFile.ReadString( 'config_ID' , 'FLD_ID_LABEL'             , 'ID' );
                      mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := IniFile.ReadString( 'config_ID' , 'FLD_ID_DESCRIPTION_LABEL' , 'DESCRIPTION' );
                      mm.MSG_FIELD_NAME_CODE                := IniFile.ReadString( 'config_ID' , 'FLD_ID_LABEL'             , 'Id' );
                      mm.MSG_FIELD_NAME_DESCRIPTION         := IniFile.ReadString( 'config_ID' , 'FLD_ID_DESCRIPTION_LABEL' , 'Description' );
                    end;
          ltth_TH : begin
                      mm.ARRAY_BASICS_FLD_ID_NAME           := IniFile.ReadString( 'config_TH' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
                      mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := IniFile.ReadString( 'config_TH' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
                      // aliases / grid columns
                      mm.ARRAY_BASICS_FLD_ID_ALIAS          := IniFile.ReadString( 'config_TH' , 'FLD_ID_ALIAS'             , 'ID' );
                      mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := IniFile.ReadString( 'config_TH' , 'FLD_ID_DESCRIPTION_ALIAS' , 'DESCRIPTION' );
                      mm.ARRAY_BASICS_FLD_ID_LABEL          := IniFile.ReadString( 'config_TH' , 'FLD_ID_LABEL'             , 'ID' );
                      mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := IniFile.ReadString( 'config_TH' , 'FLD_ID_DESCRIPTION_LABEL' , 'DESCRIPTION' );
                      mm.MSG_FIELD_NAME_CODE                := IniFile.ReadString( 'config_TH' , 'FLD_ID_LABEL'             , 'Id' );
                      mm.MSG_FIELD_NAME_DESCRIPTION         := IniFile.ReadString( 'config_TH' , 'FLD_ID_DESCRIPTION_LABEL' , 'Description' );
                    end;
          lthi_IN : begin
                      mm.ARRAY_BASICS_FLD_ID_NAME           := IniFile.ReadString( 'config_IN' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
                      mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := IniFile.ReadString( 'config_IN' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
                      // aliases / grid columns
                      mm.ARRAY_BASICS_FLD_ID_ALIAS          := IniFile.ReadString( 'config_IN' , 'FLD_ID_ALIAS'             , 'ID' );
                      mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := IniFile.ReadString( 'config_IN' , 'FLD_ID_DESCRIPTION_ALIAS' , 'DESCRIPTION' );
                      mm.ARRAY_BASICS_FLD_ID_LABEL          := IniFile.ReadString( 'config_IN' , 'FLD_ID_LABEL'             , 'ID' );
                      mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := IniFile.ReadString( 'config_IN' , 'FLD_ID_DESCRIPTION_LABEL' , 'DESCRIPTION' );
                      mm.MSG_FIELD_NAME_CODE                := IniFile.ReadString( 'config_IN' , 'FLD_ID_LABEL'             , 'Id' );
                      mm.MSG_FIELD_NAME_DESCRIPTION         := IniFile.ReadString( 'config_IN' , 'FLD_ID_DESCRIPTION_LABEL' , 'Description' );
                    end;
          ltar_SA    : begin
                      mm.ARRAY_BASICS_FLD_ID_NAME           := IniFile.ReadString( 'config_SA' , 'FLD_ID_NAME'              , 'CODIGO' );    // CODIGO, ID, SEQ...
                      mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME  := IniFile.ReadString( 'config_SA' , 'FLD_DESCRIPTION_NAME'     , 'DESCRICAO' ); // DESCRICAO, DESCRIPTION, TEXT...
                      // aliases / grid columns
                      mm.ARRAY_BASICS_FLD_ID_ALIAS          := IniFile.ReadString( 'config_SA' , 'FLD_ID_ALIAS'             , 'ID' );
                      mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS := IniFile.ReadString( 'config_SA' , 'FLD_ID_DESCRIPTION_ALIAS' , 'DESCRIPTION' );
                      mm.ARRAY_BASICS_FLD_ID_LABEL          := IniFile.ReadString( 'config_SA' , 'FLD_ID_LABEL'             , 'ID' );
                      mm.ARRAY_BASICS_FLD_DESCRIPTION_LABEL := IniFile.ReadString( 'config_SA' , 'FLD_ID_DESCRIPTION_LABEL' , 'DESCRIPTION' );
                      mm.MSG_FIELD_NAME_CODE                := IniFile.ReadString( 'config_SA' , 'FLD_ID_LABEL'             , 'Id' );
                      mm.MSG_FIELD_NAME_DESCRIPTION         := IniFile.ReadString( 'config_SA' , 'FLD_ID_DESCRIPTION_LABEL' , 'Description' );
                    end;
        end;
     finally
       IniFile.Free;
     end;
end;

//6.0.0.0
procedure TfrmCadBASICS.UniFrameCreate(Sender: TObject);
begin
  rc_ConfigTranslate;
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
  sqlMaster.SQL.Text := ' SELECT [[fields]]  ' +
                        '   FROM [[table]] tab ' +
                        '  WHERE tab.[[pk]] = :table_pk ' +  //[PT] Apenas cadastro MESTRE é necessário o WHERE
                                                             //[EN] Only MASTER registration is necessary the WHERE
                        '[grid]' + //[PT] este 'coringa' indica ao RadCORE o início da query usada na pesquisa padrão
                                   //[EN] this 'wildcard' indicates to RadCORE the beginning of the query used in the standard search
                        ' SELECT ' +

                        ' tab.[[pk]] as "' + mm.ARRAY_BASICS_FLD_ID_ALIAS + '" , ' +
                        ' tab.'            + mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME + ' as "' + mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS + '", ' +
                        ' [[allpks]] '     +   //[PT] só é necessário o [[allpks]] aqui se estiver usando ALIAS em um campo CHAVE PRIMARIA
                                               //[EN] you only need [[allpks]] here if you are using ALIAS in a PRIMARY KEY field
                        ' FROM [[table]] tab ';


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
  ed_Where_Search.Text   := '' ; // Ex: ed_Where_Search.Text := ' tab.' + ed_Table_Deleted_Field.Text + ' = ''N''';
  ed_GroupBy_Search.Text := '';
  ed_Having_Search.Text  := '';
  ed_Order_Search.Text   := 'tab.' + mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME;
  //6.0.0.0
  //edID.ReadOnly           := {not}AnsiMatchStr( ed_Table_ItemSel.Text , ARRAY_PK_NO_INC ) ;
  //edID.Color              := varIIF( edID.ReadOnly, clGray, clWhite );
  //LABELS
  labID.Caption           := mm.MSG_FIELD_NAME_CODE;
  labDescription.Caption  := mm.MSG_FIELD_NAME_DESCRIPTION;
  // BASIC CRUD field names
  edID.DataField          := mm.ARRAY_BASICS_FLD_ID_NAME;
  edDescription.DataField := mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME;

  //[PT] se a tabela atual permitir pesquisas por intervalo de datas...
  //     parametros de pesquisa especifica por datas( pesq. por periodo )  - ANTES DO INHERITED
  //     os periodos de pesq. de data só serão exibidos se houver algum campo adicionado
  //[EN] if the current table allows searches by date range...
  //     specific search parameters by dates (search by period) - BEFORE THE INHERITED
  //     the search periods. of date will only be displayed if there is any field added
  //
  // dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDFieldDate.name, 'tab.data' , 'DATA' );

  //6.1.0.0
  dbgSearchCRUD.Hint := '[[' +
                        'fieldmasks:'+
                        'grid-resize|'+
                        //'model-crud:0(btns-cls:colorful)|'+{model-crud}//6.1.0.0
                        'grid-paginator:center|' +{paginator}
                        ']]';
  inherited;

  //6.0.0.0 Theme Control
  edID.ReadOnly   := not AnsiMatchStr( ed_Table_ItemSel.Text , ARRAY_PK_NO_INC ) ;
  edID.Color      := varIIF( edID.ReadOnly, mm.CONFIG_LAYOUT_EDIT_COLOR_READONLY, mm.CONFIG_LAYOUT_EDIT_COLOR );
  edID.Font.Color := StringToColor( varIIF( edID.ReadOnly, mm.CONFIG_LAYOUT_EDIT_FONT_COLOR_READONLY, mm.CONFIG_LAYOUT_EDIT_FONT_COLOR ) );

  //[PT] parametros de pesquisa padrao - DEPOIS DO INHERITED | default search parameters - AFTER INHERITED
  //     caso no SELECT do GRID acima...vc use ALIAS e este campo for usado pra pesquisa, coloque o alias TAMBÉM abaixo
  //     sempre use o ' as ' pra definir o ALIAS Ex: tab.nome as CLIENTE -> NÃO use: (tab.nome)CLIENTE
  //[EN] standard search parameters - AFTER INHERITED
  //     if in the SELECT of the GRID above... you use ALIAS and this field is used for the search, place the alias ALSO below
  //     always use ' as ' to define the ALIAS Ex: tab.name as CUSTOMER -> DO NOT use: (tab.name)CLIENTE
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.' + ed_PK.Text + ' as "' + mm.ARRAY_BASICS_FLD_ID_ALIAS + '"' , mm.ARRAY_BASICS_FLD_ID_ALIAS  );
  dm_rc.rc_FillSearchFieldsCRUD( Self, cbxSearchCRUDField1.name   , 'tab.' + mm.ARRAY_BASICS_FLD_DESCRIPTION_NAME + ' as "' + mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS + '"' , mm.ARRAY_BASICS_FLD_DESCRIPTION_ALIAS );

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

procedure TfrmCadBASICS.UniFrameDestroy(Sender: TObject);
begin
  inherited;

//  dica cor da font dos botoes
//
// mas serve pra criar CSS dinamico herdado
//
(*
 with WebForm, JSInterface do
  begin
    JSCallGlobal('Ext.util.CSS.createStyleSheet',['#'+WebForm.JSName+'_id .x-css-shadow { box-shadow: none !important;}']);
  end;
*)
//  // on create
//  with btnSearch, JSInterface do
//  begin
//    JSCallGlobal('Ext.util.CSS.createStyleSheet',
//                  ['#' + JSId +'.x-btn .x-btn-inner { color: red !important;}',
//                  JSName + '_css1']);
//    JSCallGlobal('Ext.util.CSS.createStyleSheet',
//                  ['#' + JSId +'.x-btn-over .x-btn-inner { color: yellow !important;}',
//                  JSName + '_css2']);
//  end;
//
//  //on destroy
//  with btnSearch, JSInterface do
//  begin
//    JSCallGlobal( 'Ext.util.CSS.removeStyleSheet',[JSName + '_css1']);
//    JSCallGlobal( 'Ext.util.CSS.removeStyleSheet',[JSName + '_css2']);
//  end;

end;

initialization
  RegisterClass(TfrmCadBASICS);

end.
