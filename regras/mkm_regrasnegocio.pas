unit mkm_regrasnegocio;

interface

uses
  Data.DB, FireDAC.Comp.Client;

procedure PreencheTitulosBoleto();
procedure LerRetorno              (pempresa,pbanco:integer);

function caixadiario              (empresa:integer;dataini:TDateTime)                               : TDataSet;
function extratobancario          (empresa,portador:integer; dataini, datafin   : TDateTime)        : TDataSet;
function extratoplano             (empresa:integer;plano:string;dataini,datafin : TDateTime)        : TDataSet;
function planoanalitico           (empresa:integer;dataini,datafin:TDateTime)                       : TDataSet;
function planoresumo              (empresa:integer; mesini, mesfin, ano, planoini, planofin: string): TDataSet;
function bancoresumo              (empresa:integer;dataini: TDateTime)                              : TDataSet;
function extratofinanceiropessoa  (empresa,pessoa,controle:integer;dataini,datafin:TDateTime)       : TDataSet;

function GerarBoletoPDF           (pempresa,pnumero,pdocumento,pparcela,pbanco:integer)             : string;
function ConfirmarBoleto          (pempresa,pnumero,pdocumento,pparcela,pbanco:integer)             : boolean;
function GerarRemessar            (pempresa,pbanco:integer)                     : string;


//*****************************************************************************//
// LABORATORIO
//*****************************************************************************//
function AnalisaOS(const F_PRAGA : Integer; F_PESO :Real;TIPO_P,TIPO_D:Integer) :string;
function Perc_Peso(const tipo:string; pesoini,pesofin:Real): Real;
//*****************************************************************************//
function  AssinaturaResponsavel (pcodigo,prt,pempresa:integer;ptabela,pacao:string) : Boolean;
function  AssinaturaPendente    (pempresa,prt:integer)                              : Integer;
//*****************************************************************************//
procedure RELATORIO_ESTOQUE_MANUTENCAOLOTE(const elote:string;eproduto,eempresa:integer);

implementation

uses mkm_funcoes, System.SysUtils, mkm_func_web, untDM_RC, mkm_procedures,
  Vcl.Clipbrd, uniGUIDialogs, mkm_relatorios, MainModule, ACBrBoleto,
  ACBrBoletoConversao;

var
  SQL            : string;
  memoria        : TDataSet;
  DataSetTabelas,
  DataSetPortadores,
  DataSetPlano   : TDataSet;
  M_ENTRADA, M_SAIDA,M_SALDO, M_SALDOANT, M_PLANOANT, M_PROANT, CREDITO, DEBITO, SALDOANTERIOR : Real;
  Titulo         : TACBrTitulo;
  M_ARQUIVO      : string;

procedure RELATORIO_ESTOQUE_MANUTENCAOLOTE(const elote:string;eproduto,eempresa:integer);
var
  I                   : integer;
  ENTRADA,ENTRADAP,SAIDAP,SALDOP,SAIDA,SALDO : Real;
  escrita             : string;
begin
      escrita :=
                '  select                                                                                                          ' +
                '      rl.tipo,                                                                                                    ' +
                '      rl.emissao,                                                                                                 ' +
                '      rl.numero,                                                                                                  ' +
                '      rl.lote,                                                                                                    ' +
                '      rl.produto,                                                                                                 ' +
                '      rl.descricao,                                                                                               ' +
                '      rl.pureza,                                                                                                  ' +
                '      rl.totalpontos,                                                                                             ' +
                '      rl.quantidade                                                                                               ' +
                '  FROM manutencaolote_interno rl                                                                                  ' +
                '  where rl.empresa                                                                   =                            ' + IntToStr(eempresa) +
                '  and   rl.produto                                                                   =                            ' + IntToStr(eproduto) +
                '  and   rl.lote                                                                      =                            ' + QuotedStr(elote)   +
                '  order by rl.emissao,rl.numero, rl.sequencia                                                                     ';

  SqlPesquisa(escrita);

  I        := 0;
  ENTRADA  := 0;
  SAIDA    := 0;
  SALDO    := 0;

  ENTRADAP := 0;
  SAIDAP   := 0;
  SALDOP   := 0;

  dm_rc.tbkardexmanulote.close;
  dm_rc.tbkardexmanulote.open;

  dm_rc.sqlBuscas.DisableControls;
  dm_rc.sqlBuscas.First;
  while not dm_rc.sqlBuscas.Eof do
    begin
      Inc(I);

      dm_rc.tbkardexmanulote.Append;
      dm_rc.tbkardexmanulote.FindField('EMISSAO').AsDateTime := dm_rc.sqlBuscas.FindField('EMISSAO').AsDateTime;
      dm_rc.tbkardexmanulote.FindField('NUMERO').AsInteger   := dm_rc.sqlBuscas.FindField('NUMERO').AsInteger;
      dm_rc.tbkardexmanulote.FindField('LOTE').AsString      := dm_rc.sqlBuscas.FindField('LOTE').AsString;
      dm_rc.tbkardexmanulote.FindField('TIPO').AsString      := dm_rc.sqlBuscas.FindField('TIPO').AsString;
      dm_rc.tbkardexmanulote.FindField('DESCRICAO').AsString := dm_rc.sqlBuscas.FindField('DESCRICAO').AsString;
      dm_rc.tbkardexmanulote.FindField('PRODUTO').AsInteger  := dm_rc.sqlBuscas.FindField('PRODUTO').AsInteger;
      dm_rc.tbkardexmanulote.FindField('PUREZA').AsFloat     := dm_rc.sqlBuscas.FindField('PUREZA').AsFloat;

      if dm_rc.sqlBuscas.FindField('TIPO').AsString = 'ENTRADA' then
        begin
          dm_rc.tbkardexmanulote.FindField('ENTRADA').AsFloat     := dm_rc.sqlBuscas.FindField('QUANTIDADE').AsFloat;
          ENTRADA                                                 := ENTRADA  + dm_rc.tbkardexmanulote.FindField('ENTRADA').AsFloat;
          ENTRADAP                                                := ENTRADAp + dm_rc.sqlBuscas.FindField('TOTALPONTOS').AsFloat;
        end;

      if dm_rc.sqlBuscas.FindField('TIPO').AsString = 'SAIDA' then
        begin
          dm_rc.tbkardexmanulote.FindField('SAIDA').AsFloat     := dm_rc.sqlBuscas.FindField('QUANTIDADE').AsFloat;
          SAIDA                                                 := SAIDA  + dm_rc.tbkardexmanulote.FindField('SAIDA').AsFloat;
          SAIDAP                                                := SAIDAP + dm_rc.sqlBuscas.FindField('TOTALPONTOS').AsFloat;
        end;

      SALDO                                                     := SALDO  + dm_rc.tbkardexmanulote.FindField('ENTRADA').AsFloat - dm_rc.tbkardexmanulote.FindField('SAIDA').AsFloat;
      SALDOP                                                    := SALDOP + ENTRADAP - SAIDAP;

      dm_rc.tbkardexmanulote.FindField('SALDO').AsFloat         := SALDO;
      dm_rc.tbkardexmanulote.FindField('SALDOP').AsFloat        := SALDOP;

      dm_rc.tbkardexmanulote.Post;

      dm_rc.sqlBuscas.Next;
    end;
end;
function planoresumo    (empresa:integer; mesini, mesfin, ano, planoini, planofin: string): TDataSet;
var
  I: integer;
begin
  SQL   := ' SELECT * FROM BANCOS                                         ' +
           ' WHERE extract(month from BANCOS.PAGAMENTO) between           ' + QuotedStr(mesini)       +
           ' AND                                                          ' + QuotedStr(mesfin)       +
           ' AND   extract(year  from BANCOS.PAGAMENTO) =                 ' + QuotedStr(ano)          +
           ' AND   PLANOCONTAS BETWEEN                                    ' + QuotedStr(planoini)     +
           ' AND                                                          ' + QuotedStr(planofin)     +
           ' AND    EMPRESA          =                                    ' + IntToStr(empresa)      +
           ' ORDER BY PLANOCONTAS                                         ';



  memoria            := CriaMemoria('BANCOS');
  DataSetTabelas     := SqlPesquisaGerais(SQL);

  if DataSetTabelas.RecordCount > 0 then
    begin
      CREDITO  := 0;
      DEBITO   := 0;
      M_PROANT := 0;

      memoria.Close;
      memoria.Open;
      DataSetTabelas.First;
      while not DataSetTabelas.Eof do
        begin

          Inc(I);
          SQL            := 'SELECT PLANO, DESCRICAO FROM PLANOCONTAS WHERE PLANO = ' + QuotedStr(DataSetTabelas.FindField('PLANOCONTAS').AsString);
          DataSetPlano   := SqlPesquisaGerais(SQL);


          if M_PROANT <> DataSetTabelas.FindField('PLANOCONTAS').AsInteger then
            begin
              M_PROANT := DataSetTabelas.FindField('PLANOCONTAS').AsInteger;
              CREDITO  := 0;
              DEBITO   := 0;
              memoria.append;
              memoria.FindField('PLANO').AsString      := (DataSetTabelas.FindField('PLANOCONTAS').AsString);
              memoria.FindField('HISTORICO').AsString  := DataSetPlano.FindField('DESCRICAO').AsString;

              if DataSetTabelas.FindField('TIPO').AsString = 'Entrada' then
                begin
                  memoria.FindField('CREDITO').AsFloat := memoria.FindField('CREDITO').AsFloat + DataSetTabelas.FindField('VALORPAGO').AsFloat;
                  memoria.FindField('TIPO').AsString   := 'C';
                end;

              if DataSetTabelas.FindField('TIPO').AsString = 'Saida' then
                begin
                  memoria.FindField('DEBITO').AsFloat  := memoria.FindField('DEBITO').AsFloat + DataSetTabelas.FindField('VALORPAGO').AsFloat;
                  memoria.FindField('TIPO').AsString   := 'D';
                end;

              memoria.FindField('SALDO').AsFloat       := memoria.FindField('CREDITO').AsFloat - memoria.FindField('DEBITO').AsFloat;

              memoria.Post;

              CREDITO := DataSetTabelas.FindField('VALORPAGO').AsFloat;
              DEBITO  := DataSetTabelas.FindField('VALORPAGO').AsFloat;
            end
          else
            begin
              memoria.Edit;
              memoria.FindField('PLANO').AsString      := (DataSetTabelas.FindField('PLANOCONTAS').AsString);
              memoria.FindField('HISTORICO').AsString  := DataSetPlano.FindField('DESCRICAO').AsString;

              if DataSetTabelas.FindField('TIPO').AsString = 'Entrada' then
                begin
                  memoria.FindField('TIPO').AsString   := 'C';
                  memoria.FindField('CREDITO').AsFloat := memoria.FindField('CREDITO').AsFloat + DataSetTabelas.FindField('VALORPAGO').AsFloat;
                end;

              if DataSetTabelas.FindField('TIPO').AsString = 'Saida' then
                begin
                  memoria.FindField('DEBITO').AsFloat  := memoria.FindField('DEBITO').AsFloat + DataSetTabelas.FindField('VALORPAGO').AsFloat;
                  memoria.FindField('TIPO').AsString   := 'D';
                end;

              memoria.FindField('SALDO').AsFloat       := memoria.FindField('CREDITO').AsFloat - memoria.FindField('DEBITO').AsFloat;
              memoria.Post;
            end;

           FreeAndNil(DataSetPlano);

           DataSetTabelas.Next;
        end;
    end;
  Result := memoria;
end;
function planoanalitico (empresa:integer;dataini,datafin:TDateTime)               : TDataSet;
var
  I :integer;
begin
  SQL   := ' SELECT * FROM BANCOS WHERE EMPRESA =                ' + IntToStr(empresa)             +
           ' AND EMISSAO BETWEEN                                 ' + QuotedStr(DataPonto(DateToStr(dataini)))  +
           ' AND                                                 ' + QuotedStr(DataPonto(DateToStr(datafin)))  +
           ' ORDER BY PLANOCONTAS , PORTADOR, EMISSAO, SEQUENCIA ';

  memoria            := CriaMemoria('BANCOS');
  DataSetTabelas     := SqlPesquisaGerais(SQL);

  if DataSetTabelas.RecordCount > 0 then
    begin
      M_ENTRADA := 0;
      M_SAIDA   := 0;
      M_SALDO   := 0;
      M_SALDOANT:= 0;
      M_PLANOANT:= 0;
      I         := 0;

      memoria.Close;
      memoria.Open;

      DataSetTabelas.First;
      while not DataSetTabelas.Eof do
        begin
          Inc(I);

         if memoria.RecNo = 0 then
           begin
             if M_PLANOANT <> DataSetTabelas.FindField('PLANOCONTAS').AsFloat then
               begin
                 DataSetPlano  := SqlPesquisaGerais('select plano, descricao, tipo from planocontas where plano = ' + QuotedStr(DataSetTabelas.FindField('PLANOCONTAS').AsString));
                 memoria.Append;
                 memoria.FindField('PLANO').AsInteger             := DataSetTabelas.FindField('PLANOCONTAS').AsInteger;
                 memoria.FindField('DESCRICAOAPLICACAO').AsString := DataSetTabelas.FindField('PLANODESCRICAO').AsString;
                 memoria.FindField('HISTORICO').AsString          := DataSetPlano.FindField('DESCRICAO').AsString;
                 memoria.Post;
               end;
           end
         else
           begin
             if M_PLANOANT <> DataSetTabelas.FindField('PLANOCONTAS').AsFloat then
               begin
                 memoria.Append;
                 memoria.Post;

                 DataSetPlano  := SqlPesquisaGerais('select plano, descricao, tipo from planocontas where plano = ' + QuotedStr(DataSetTabelas.FindField('PLANOCONTAS').AsString));
                 memoria.Append;
                 memoria.FindField('PLANO').AsInteger             := DataSetTabelas.FindField('PLANOCONTAS').AsInteger;
                 memoria.FindField('DESCRICAOAPLICACAO').AsString := DataSetTabelas.FindField('PLANODESCRICAO').AsString;
                 memoria.FindField('HISTORICO').AsString          := DataSetPlano.FindField('DESCRICAO').AsString;
                 memoria.Post;
               end;
           end;


          memoria.Append;


          M_PLANOANT                                       := DataSetTabelas.FindField('PLANOCONTAS').AsFloat;
          M_PROANT                                         := DataSetTabelas.FindField('PAGAMENTO').AsDateTime;

          memoria.FindField('SALDO').AsFloat               := DataSetTabelas.FindField('VALORPAGO').AsFloat;

          memoria.FindField('PORTADOR').AsInteger          := DataSetTabelas.FindField('PORTADOR').AsInteger;
          memoria.FindField('APLICACAO').AsInteger         := DataSetTabelas.FindField('APLICACAO').AsInteger;
          memoria.FindField('SEQUENCIA').AsInteger         := DataSetTabelas.FindField('SEQUENCIA').AsInteger;
          memoria.FindField('HISTORICO').AsString          := DataSetTabelas.FindField('HISTORICO').AsString;
          memoria.FindField('EMISSAO').AsDateTime          := DataSetTabelas.FindField('PAGAMENTO').AsDateTime;
          memoria.FindField('SERIE').AsString              := DataSetTabelas.FindField('SERIE').AsString;

          if DataSetTabelas.FindField('TIPO').AsString = 'Entrada' then
            begin
              memoria.FindField('TIPO').AsString   := 'C';
              memoria.FindField('CREDITO').AsFloat := DataSetTabelas.FindField('VALORPAGO').AsFloat;
              M_ENTRADA                            := DataSetTabelas.FindField('VALORPAGO').AsFloat + M_ENTRADA;
              memoria.FindField('SINAL').AsString  := '(+)';
            end;

          if DataSetTabelas.FindField('TIPO').AsString = 'Saida' then
            begin
              memoria.FindField('TIPO').AsString   := 'D';
              memoria.FindField('DEBITO').AsFloat  := DataSetTabelas.FindField('VALORPAGO').AsFloat;
              M_SAIDA                              := DataSetTabelas.FindField('VALORPAGO').AsFloat + M_SAIDA;
              memoria.FindField('SINAL').AsString  := '(-)';
            end;

          memoria.Post;

          FreeAndNil(DataSetPlano);

          DataSetTabelas.Next;
        end;
    end;
  Result := memoria;
end;
function extratobancario(empresa,portador :integer; dataini, datafin  : TDateTime): TDataSet;
var
  I : integer;
begin

  SQL   := ' SELECT CODIGO,PORTADOR,HISTORICO,PAGAMENTO,TIPO,VALORPAGO,SEQUENCIA,SERIE,EMPRESA'              +
           ' FROM BANCOS                                       ' +
           ' WHERE PAGAMENTO BETWEEN                           ' + QuotedStr(DataPonto(DateToStr(dataini)))  +
           ' AND                                               ' + QuotedStr(DataPonto(DateToStr(datafin)))  +
           ' AND   PORTADOR          =                         ' + IntToStr(portador)                        +
           variif(empresa = 0,'',' AND    EMPRESA          =   ' + IntToStr(empresa))                        +
           ' ORDER BY EMISSAO, SEQUENCIA                       ';

    memoria            := CriaMemoria('BANCOS');
    DataSetTabelas     := SqlPesquisaGerais(SQL);

  if DataSetTabelas.RecordCount > 0 then
    begin

      M_ENTRADA := 0;
      M_SAIDA   := 0;
      M_SALDO   := 0;
      M_SALDOANT:= 0;
      M_PLANOANT:= 0;
      I         := 0;

      try
        memoria.Close;
        memoria.Open;

        DataSetTabelas.First;
        while not DataSetTabelas.Eof do
          begin
            Inc(I);

           if memoria.RecNo = 0 then
             begin
//              if M_PROANT <> DataSetTabelas.FindField('PAGAMENTO').AsDateTime then
                begin
                  memoria.Append;
                  memoria.FindField('EMISSAO').AsString      := DataSetTabelas.FindField('PAGAMENTO').AsString;
                  memoria.FindField('HISTORICO').AsString    := ' ********** SALDO INICIAL ********** ';
                  memoria.FindField('SALDO2').AsFloat        := Calcula_AntCaixa(empresa,DataSetTabelas.FindField('PORTADOR').AsInteger, DataSetTabelas.FindField('PAGAMENTO').AsDateTime);
                  M_SALDOANT                                 := memoria.FindField('SALDO2').AsFloat;
                  memoria.Post;
                end;
             end;



            memoria.Append;

            M_PROANT                                         := DataSetTabelas.FindField('PAGAMENTO').AsDateTime;

            memoria.FindField('PORTADOR').AsInteger          := DataSetTabelas.FindField('PORTADOR').AsInteger;
            memoria.FindField('EMPRESA').AsInteger           := DataSetTabelas.FindField('EMPRESA').AsInteger;
            memoria.FindField('CONTROLE').AsInteger          := DataSetTabelas.FindField('CODIGO').AsInteger;
            memoria.FindField('SEQUENCIA').AsInteger         := DataSetTabelas.FindField('SEQUENCIA').AsInteger;
            memoria.FindField('HISTORICO').AsString          := DataSetTabelas.FindField('HISTORICO').AsString;
            memoria.FindField('EMISSAO').AsString            := DataSetTabelas.FindField('PAGAMENTO').AsString;
            memoria.FindField('SERIE').AsString              := DataSetTabelas.FindField('SERIE').AsString;

            if DataSetTabelas.FindField('TIPO').AsString = 'Entrada' then
              begin
                memoria.FindField('TIPO').AsString   := 'C';
                memoria.FindField('CREDITO').AsFloat := DataSetTabelas.FindField('VALORPAGO').AsFloat;
                M_ENTRADA                            := DataSetTabelas.FindField('VALORPAGO').AsFloat + M_ENTRADA;
              end;

            if DataSetTabelas.FindField('TIPO').AsString = 'Saida' then
              begin
                memoria.FindField('TIPO').AsString  := 'D';
                memoria.FindField('DEBITO').AsFloat := DataSetTabelas.FindField('VALORPAGO').AsFloat;
                M_SAIDA                             := DataSetTabelas.FindField('VALORPAGO').AsFloat + M_SAIDA;
              end;

           if I = 1 then
             begin
               memoria.FindField('SALDO').AsFloat := M_SALDOANT + M_SALDO + memoria.FindField('CREDITO').AsFloat - memoria.FindField('DEBITO').AsFloat;
               M_SALDO                            := memoria.FindField('SALDO').AsFloat;
             end
           else
             begin
               memoria.FindField('SALDO').AsFloat := M_SALDO + memoria.FindField('CREDITO').AsFloat - memoria.FindField('DEBITO').AsFloat;
               M_SALDO                            := memoria.FindField('SALDO').AsFloat;
             end;

            memoria.Post;

            DataSetTabelas.Next;
          end;
      except
        on e: exception do
          begin
            gera_log('Retorno Extratobancario ... ' + e.message);
            FreeAndNil(DataSetTabelas);
          end;
      end;
    end;

  Result := memoria;
end;

function caixadiario (empresa:integer;dataini:TDateTime)  : TDataSet;
var
  I :integer;
begin
  SQL := ' SELECT * FROM BANCOS WHERE EMPRESA =              ' + inttostr(empresa )                        +
         ' AND EMISSAO =                                     ' + QuotedStr(DataPonto(DateToStr(dataini)))  +
         ' ORDER BY PAGAMENTO, PORTADOR, SEQUENCIA';

  memoria            := CriaMemoria('BANCOS');
  DataSetTabelas     := SqlPesquisaGerais(SQL);

  if DataSetTabelas.RecordCount > 0 then
    begin

      memoria.Close;
      memoria.Open;

      DataSetTabelas.First;
      while not DataSetTabelas.Eof do
        begin
          Inc(I);
          if memoria.RecNo = 0 then
            begin
              if M_PLANOANT <> DataSetTabelas.FindField('PORTADOR').AsFloat then
                begin
                  memoria.Append;
                  memoria.FindField('PORTADOR').AsInteger          := DataSetTabelas.FindField('PORTADOR').AsInteger;
                  memoria.FindField('DESCRICAOAPLICACAO').AsString := DataSetTabelas.FindField('DESCPORTADOR').AsString;
                  memoria.FindField('HISTORICO').AsString          := 'SALDO ANTERIOR';
                  memoria.FindField('SALDO2').AsFloat              := Calcula_AntCaixa(empresa,DataSetTabelas.FindField('PORTADOR').AsInteger, DataSetTabelas.FindField('PAGAMENTO').AsDateTime);
                  memoria.FindField('SALDOANTERIOR').AsFloat       := Calcula_AntCaixa(empresa,DataSetTabelas.FindField('PORTADOR').AsInteger, DataSetTabelas.FindField('PAGAMENTO').AsDateTime);
                  M_SALDOANT                                       := memoria.FindField('SALDO2').AsFloat;

                  memoria.Post;
                end;
            end
          else
            begin
              if M_PLANOANT <> DataSetTabelas.FindField('PORTADOR').AsFloat then
                begin
                  memoria.Append;
                  memoria.Post;

                  memoria.Append;
                  memoria.FindField('PORTADOR').AsInteger          := DataSetTabelas.FindField('PORTADOR').AsInteger;
                  memoria.FindField('DESCRICAOAPLICACAO').AsString := DataSetTabelas.FindField('DESCPORTADOR').AsString;
                  memoria.FindField('HISTORICO').AsString          := 'SALDO ANTERIOR';
                  memoria.FindField('SALDO2').AsFloat              := Calcula_AntCaixa(empresa,DataSetTabelas.FindField('PORTADOR').AsInteger, DataSetTabelas.FindField('PAGAMENTO').AsDateTime);
                  memoria.FindField('SALDOANTERIOR').AsFloat       := Calcula_AntCaixa(empresa,DataSetTabelas.FindField('PORTADOR').AsInteger, DataSetTabelas.FindField('PAGAMENTO').AsDateTime);

                  M_SALDOANT                                       := memoria.FindField('SALDO2').AsFloat;

                  M_SALDO                                          := 0;
                  M_ENTRADA                                        := 0;
                  M_SAIDA                                          := 0;

                  memoria.Post;
                end;
            end;


          memoria.Append;

          M_PLANOANT                                       := DataSetTabelas.FindField('PORTADOR').AsFloat;

          memoria.FindField('SEQUENCIA').AsInteger         := DataSetTabelas.FindField('SEQUENCIA').AsInteger;
          memoria.FindField('APLICACAO').AsInteger         := DataSetTabelas.FindField('APLICACAO').AsInteger;
          memoria.FindField('PLANO').AsString              := DataSetTabelas.FindField('PLANOCONTAS').AsString;
          memoria.FindField('SEQUENCIA').AsInteger         := DataSetTabelas.FindField('SEQUENCIA').AsInteger;
          memoria.FindField('HISTORICO').AsString          := DataSetTabelas.FindField('HISTORICO').AsString;
          memoria.FindField('EMISSAO').AsString            := DataSetTabelas.FindField('PAGAMENTO').AsString;
          memoria.FindField('SERIE').AsString              := DataSetTabelas.FindField('SERIE').AsString;

          if DataSetTabelas.FindField('TIPO').AsString = 'Entrada' then
            begin
              memoria.FindField('TIPO').AsString :='C';
              memoria.FindField('CREDITO').AsFloat := DataSetTabelas.FindField('VALORPAGO').AsFloat;
              M_ENTRADA := DataSetTabelas.FindField('VALORPAGO').AsFloat + M_ENTRADA;
            end;

          if DataSetTabelas.FindField('TIPO').AsString = 'Saida' then
            begin
              memoria.FindField('TIPO').AsString :='D';
              memoria.FindField('DEBITO').AsFloat := DataSetTabelas.FindField('VALORPAGO').AsFloat;
              M_SAIDA   := DataSetTabelas.FindField('VALORPAGO').AsFloat + M_SAIDA;
            end;


          if I = 1 then
             begin
               memoria.FindField('SALDO').AsFloat := M_SALDOANT + M_SALDO + memoria.FindField('CREDITO').AsFloat - memoria.FindField('DEBITO').AsFloat;
               M_SALDO    := memoria.FindField('SALDO').AsFloat;
               M_SALDOANT := 0;
             end
          else
            begin
              memoria.FindField('SALDO').AsFloat := M_SALDOANT + M_SALDO + memoria.FindField('CREDITO').AsFloat - memoria.FindField('DEBITO').AsFloat;
              M_SALDO   := memoria.FindField('SALDO').AsFloat;
              M_SALDOANT:= 0;
            end;
         //***************************************************************//
          memoria.Post;
          DataSetTabelas.Next;
        end;
    end;

  Result := memoria;
end;
function extratoplano(empresa:integer;plano:string;dataini,datafin : TDateTime): TDataSet;
var
  I :integer;
begin

  SQL   := ' SELECT * FROM BANCOS WHERE EMPRESA = ' + IntToStr(empresa)                        +
           ' AND EMISSAO BETWEEN                  ' + QuotedStr(DataPonto(DateToStr(dataini))) +
           ' AND                                  ' + QuotedStr(DataPonto(DateToStr(datafin))) +
           ' AND PLANOCONTAS =                    ' + QuotedStr(plano)                         +
           ' ORDER BY EMISSAO, SEQUENCIA';

  memoria            := CriaMemoria('BANCOS');
  DataSetTabelas     := SqlPesquisaGerais(SQL);

  if DataSetTabelas.RecordCount > 0 then
    begin
      M_ENTRADA := 0;
      M_SAIDA   := 0;
      M_SALDO   := 0;
      M_SALDOANT:= 0;
      M_PLANOANT:= 0;
      I         := 0;

      memoria.Close;
      memoria.Open;

      DataSetTabelas.First;
      while not DataSetTabelas.Eof do
        begin
          Inc(I);
         if memoria.RecNo = 0 then
           begin
             if M_PLANOANT <> DataSetTabelas.FindField('PLANOCONTAS').AsFloat then
               begin
                 memoria.Append;
                 memoria.FindField('PLANO').AsInteger             := DataSetTabelas.FindField('PLANOCONTAS').AsInteger;
                 memoria.FindField('DESCRICAOAPLICACAO').AsString := DataSetTabelas.FindField('PLANODESCRICAO').AsString;
                 memoria.FindField('HISTORICO').AsString          := 'SALDO ANTERIOR';

                 memoria.FindField('SALDO2').AsFloat              := Calcula_AntPlano(empresa,DataSetTabelas.FindField('PLANOCONTAS').asstring, DataSetTabelas.FindField('PAGAMENTO').AsDateTime);
                 memoria.FindField('SALDOANTERIOR').AsFloat       := Calcula_AntPlano(empresa,DataSetTabelas.FindField('PLANOCONTAS').asstring, DataSetTabelas.FindField('PAGAMENTO').AsDateTime);


                 M_SALDOANT                                       := memoria.FindField('SALDO2').AsFloat;
                 memoria.Post;
               end;
           end
           else
             begin
               if M_PLANOANT <> DataSetTabelas.FindField('PLANOCONTAS').AsFloat then
                 begin
                   memoria.Append;
                   memoria.Post;

                   memoria.Append;
                   memoria.FindField('PLANO').AsInteger               := DataSetTabelas.FindField('PLANOCONTAS').AsInteger;
                   memoria.FindField('DESCRICAOAPLICACAO').AsString   := DataSetTabelas.FindField('PLANODESCRICAO').AsString;
                   memoria.FindField('HISTORICO').AsString            := 'SALDO ANTERIOR';

                   memoria.FindField('SALDO2').AsFloat                := Calcula_AntPlano(empresa,DataSetTabelas.FindField('PLANOCONTAS').asstring, DataSetTabelas.FindField('PAGAMENTO').AsDateTime);
                   memoria.FindField('SALDOANTERIOR').AsFloat         := Calcula_AntPlano(empresa,DataSetTabelas.FindField('PLANOCONTAS').asstring, DataSetTabelas.FindField('PAGAMENTO').AsDateTime);

                   M_SALDOANT                                         := memoria.FindField('SALDO2').AsFloat;
                   M_SALDO                                            := memoria.FindField('SALDOANTERIOR').AsFloat;

                   M_ENTRADA                                          := 0;
                   M_SAIDA                                            := 0;
                   memoria.Post;
                 end;
             end;

          memoria.Append;

          M_PLANOANT                                       := DataSetTabelas.FindField('PLANOCONTAS').AsFloat;
          M_PROANT                                         := DataSetTabelas.FindField('PAGAMENTO').AsDateTime;

          memoria.FindField('PORTADOR').AsInteger          := DataSetTabelas.FindField('PORTADOR').AsInteger;
          memoria.FindField('APLICACAO').AsInteger         := DataSetTabelas.FindField('APLICACAO').AsInteger;
          memoria.FindField('SEQUENCIA').AsInteger         := DataSetTabelas.FindField('SEQUENCIA').AsInteger;
          memoria.FindField('HISTORICO').AsString          := DataSetTabelas.FindField('HISTORICO').AsString;
          memoria.FindField('EMISSAO').AsDateTime          := DataSetTabelas.FindField('EMISSAO').AsDateTime;
          memoria.FindField('SERIE').AsString              := DataSetTabelas.FindField('SERIE').AsString;
          memoria.FindField('PAGAMENTO').AsDateTime        := DataSetTabelas.FindField('PAGAMENTO').AsDateTime;


          if DataSetTabelas.FindField('TIPO').AsString = 'Entrada' then
            begin
              memoria.FindField('CREDITO').AsFloat := DataSetTabelas.FindField('VALORPAGO').AsFloat;
              M_ENTRADA                            := DataSetTabelas.FindField('VALORPAGO').AsFloat + M_ENTRADA;
              memoria.FindField('TIPO').AsString   := 'C';
            end;

          if DataSetTabelas.FindField('TIPO').AsString = 'Saida' then
            begin
              memoria.FindField('DEBITO').AsFloat := DataSetTabelas.FindField('VALORPAGO').AsFloat;
              M_SAIDA                             := DataSetTabelas.FindField('VALORPAGO').AsFloat + M_SAIDA;
              memoria.FindField('TIPO').AsString  := 'D';
            end;

         if I = 1 then
           begin
            memoria.FindField('SALDO').AsFloat := M_SALDOANT + M_SALDO + memoria.FindField('CREDITO').AsFloat - memoria.FindField('DEBITO').AsFloat;
            M_SALDO   := memoria.FindField('SALDO').AsFloat;
           end
         else
           begin
            memoria.FindField('SALDO').AsFloat := M_SALDO + memoria.FindField('CREDITO').AsFloat - memoria.FindField('DEBITO').AsFloat;
            M_SALDO   := memoria.FindField('SALDO').AsFloat;
           end;
         //***************************************************************//
          memoria.Post;
          DataSetTabelas.Next;
        end;
    end;
  Result := memoria;
end;
function bancoresumo (empresa:integer;dataini: TDateTime)                                :TDataSet;
var
  I:Integer;
begin
  SQL := ' SELECT B.PORTADOR FROM BANCOS B ' +
         ' WHERE EMISSAO <                 ' + QuotedStr(DataPonto(DateToStr(dataini))) +
         ' AND    EMPRESA          =       ' + IntToStr(empresa)                  +
         ' GROUP BY PORTADOR               ' +
         ' ORDER BY B.PORTADOR             ';


  memoria            := CriaMemoria('BANCOS');
  DataSetTabelas     := SqlPesquisaGerais(SQL);

  I := 0;
  if DataSetTabelas.RecordCount > 0 then
    begin
      memoria.Close;
      memoria.Open;
      DataSetTabelas.First;
      while not DataSetTabelas.Eof do
        begin
          Inc(I);

          SQL                := 'SELECT DESCRICAO, LIMITE FROM PORTADORES WHERE CODIGO = ' + IntToStr(DataSetTabelas.findfield('PORTADOR').AsInteger);
          DataSetPortadores  := SqlPesquisaGerais(SQL);

          memoria.Append;
          memoria.Findfield('PORTADOR').AsInteger   := DataSetTabelas.findfield('PORTADOR').AsInteger;
          memoria.Findfield('HISTORICO').AsString   := DataSetPortadores.findfield('DESCRICAO').AsString;
          memoria.Findfield('SALDO2').AsFloat       := Calcula_AntCaixa(empresa,DataSetTabelas.findfield('PORTADOR').AsInteger,dataini);

          memoria.Findfield('LIMITE').AsFloat       := DataSetPortadores.findfield('LIMITE').ASfloat;
          memoria.Findfield('SALDO').AsFloat        := memoria.Findfield('SALDO2').AsFloat +  memoria.Findfield('LIMITE').AsFloat;

          if memoria.Findfield('SALDO').AsFloat > 0 then
            memoria.Findfield('TIPO').AsString := 'C'
          else
            memoria.Findfield('TIPO').AsString := 'D';

          memoria.Post;
          DataSetTabelas.Next;

          FreeAndNil(DataSetPortadores);
        end;
    end;
  Result := memoria;
end;
function extratofinanceiropessoa  (empresa,pessoa,controle:integer;dataini,datafin:TDateTime) : TDataSet;
var
  numerodoc:integer;
  anterior,
  saldof : Currency;
begin
  if controle <> 0 then
    begin
      TabelaMvmestre('SELECT * FROM MVMESTRE WHERE CODIGO = ' + IntToStr(controle));

      SQL :=
           ' select                                                                               ' +
           '     r.numero,                                                                        ' +
           '     r.serie,                                                                         ' +
           '     r.sequencia,                                                                     ' +
           '     r.emissao,                                                                       ' +
           '     r.vencimento,                                                                    ' +
           '     r.pagamento,                                                                     ' +
           '     case when r.situacao = ' + QuotedStr('Aberto') + ' then r.valoratual      else 0 end Aberto,          ' +
           '     case when r.situacao = ' + QuotedStr('Pago')   + ' then r.valorpago       else 0 end Pago             ' +
           ' from                                                                                 ' +
           '   receber r                                                                          ' +
           ' where                                                                                ' +
           ' r.numero                                                                           = ' + IntToStr (dm_rc.FDQryMvmestre.FindField('NUMERO').AsInteger) +
           ' and r.serie                                                                        = ' + QuotedStr(dm_rc.FDQryMvmestre.FindField('SERIE').AsString)   +
           ' and r.financeiro                                                                   = ' + IntToStr (1)      +
           ' order by r.numero                                                                    ';

      dm_rc.FDQryMvmestre.Close;
    end
  else
    begin
      SQL :=
           ' select                                                                               ' +
           '     r.numero,                                                                        ' +
           '     r.serie,                                                                         ' +
           '     r.sequencia,                                                                     ' +
           '     r.emissao,                                                                       ' +
           '     r.vencimento,                                                                    ' +
           '     r.pagamento,                                                                     ' +
           '     case when r.situacao = '+QuotedStr('Aberto')+' then r.valoratual      else 0 end Aberto,          ' +
           '     case when r.situacao = '+QuotedStr('Pago')  +' then r.valorpago       else 0 end Pago             ' +
           ' from                                                                                 ' +
           '   receber r                                                                          ' +
           ' where                                                                                ' +
           ' r.pessoa                                                                           = ' + IntToStr(pessoa) +
           ' and r.financeiro                                                                   = ' + IntToStr(1)      +
           ' order by r.numero                                                                    ';
//      clipboard.AsText := sql;
    end;

  numerodoc          := 0;
  anterior           := 0;
  saldof             := 0;

  memoria            := CriaMemoria('EXTRATOFINANCEIROPESSOA');
  DataSetTabelas     := SqlPesquisaGerais(SQL);

  if DataSetTabelas.RecordCount > 0 then
    begin
      memoria.Close;
      memoria.Open;
      DataSetTabelas.First;
      while not DataSetTabelas.Eof do
        begin

          if numerodoc <> DataSetTabelas.FindField('NUMERO').AsInteger  then
            begin
              SqlPesquisa(' SELECT * FROM MVMESTRE WHERE NUMERO = ' + IntToStr( DataSetTabelas.FindField('NUMERO').AsInteger) +
                          ' AND SERIE                           = ' + QuotedStr(DataSetTabelas.FindField('SERIE').AsString)   +
                          ' AND EMPRESA                         = ' + IntToStr(empresa));

              memoria.Append;
              memoria.FindField('NUMERO').AsInteger    := DataSetTabelas.FindField('NUMERO').AsInteger;
              memoria.FindField('SEQUENCIA').AsString  := '';
              memoria.FindField('SERIE').AsString      := DataSetTabelas.FindField('SERIE').AsString;
              memoria.FindField('EMISSAO').AsString    := DataSetTabelas.FindField('EMISSAO').AsString;
              memoria.FindField('TOTAL').AsString      := dm_rc.sqlBuscas.FindField('VLRTOTAL').AsString;
              memoria.FindField('ABERTO').AsString     := '';
              memoria.FindField('PAGO').AsString       := '';
              memoria.FindField('SALDO').AsString      := dm_rc.sqlBuscas.FindField('VLRTOTAL').AsString;
              memoria.Post;

              anterior                                 := dm_rc.sqlBuscas.FindField('VLRTOTAL').AsCurrency;
            end;

          saldof := anterior + (saldof - DataSetTabelas.FindField('PAGO').AsCurrency);

          memoria.Append;
          memoria.FindField('NUMERO').AsInteger    := DataSetTabelas.FindField('NUMERO').AsInteger;
          memoria.FindField('SEQUENCIA').AsInteger := DataSetTabelas.FindField('SEQUENCIA').AsInteger;
          memoria.FindField('SERIE').AsString      := DataSetTabelas.FindField('SERIE').AsString;
          memoria.FindField('EMISSAO').AsString    := DataSetTabelas.FindField('EMISSAO').AsString;
          memoria.FindField('VENCIMENTO').AsString := DataSetTabelas.FindField('VENCIMENTO').AsString;
          memoria.FindField('PAGAMENTO').AsString  := DataSetTabelas.FindField('PAGAMENTO').AsString;
          memoria.FindField('ABERTO').AsString     := DataSetTabelas.FindField('ABERTO').AsString;
          memoria.FindField('PAGO').AsString       := DataSetTabelas.FindField('PAGO').AsString;
          memoria.FindField('TOTAL').AsString      := '';
          memoria.FindField('SALDO').AsCurrency    := saldof;
          memoria.Post;

          numerodoc := DataSetTabelas.FindField('NUMERO').AsInteger;
          anterior  := 0;
          DataSetTabelas.Next;
        end;
    end;
  Result := memoria;
end;
function AnalisaOS(const F_PRAGA : Integer; F_PESO :Real;TIPO_P,TIPO_D:Integer) :string;
var
   menor,soma                      : Real;
   sempuras,matinerte,outrasemente : Real;
begin

  menor := 0.04;

  sempuras     := Perc_Peso('',dm_rc.FDQryAnalise.FindField('SEMENTES_PURAS_KG').AsFloat,
                               dm_rc.FDQryAnalise.FindField('PESO_FINAL_KG').AsFloat);

  matinerte    := Perc_Peso('',dm_rc.FDQryAnalise.FindField('MATERIAL_INERTE_KG').AsFloat,
                               dm_rc.FDQryAnalise.FindField('PESO_FINAL_KG').AsFloat);

  outrasemente := Perc_Peso('OS',dm_rc.FDQryAnalise.FindField('OUTRAS_SEMENTES_KG').AsFloat,
                                 dm_rc.FDQryAnalise.FindField('PESO_FINAL_KG').AsFloat);

  soma         := sempuras + matinerte + outrasemente;

  if (F_PRAGA = 0) then
    result := FormatFloat('##,#0.0',dm_rc.FDQryAnalise.FindField('OUTRAS_SEMENTES_PERC').AsFloat)
  else
  if (F_PRAGA >  0) and ( F_PESO = 0)  then
    Result := 'traço'
  else
  if (F_PRAGA >  0) and ( F_PESO < menor) then
    Result := 'traço'
  else
    result := FormatFloat('##,#0.0',dm_rc.FDQryAnalise.FindField('OUTRAS_SEMENTES_PERC').AsFloat);
end;
function Perc_Peso(const tipo:string; pesoini,pesofin:Real): Real;
var
  r : Real;
begin
  if (pesoini = 0) and (pesofin = 0) then
    Result := 0
  else
    begin
      if tipo = 'OS' then
        r      := MRound(((pesoini / pesofin) * 100),2)
      else
        r      := MRound(((pesoini / pesofin) * 100),1);

      Result := r;
    end;
end;
function AssinaturaResponsavel (pcodigo,prt,pempresa:integer;ptabela,pacao:string) : Boolean;
var
  i            : integer;
begin
  try
    if pacao = 'INCLUI' then
      begin
        dm_rc.fdqryresponsavelassinatura.Close;
        dm_rc.fdqryresponsavelassinatura.SQL.clear;
        dm_rc.fdqryresponsavelassinatura.SQL.Text := 'select * from RESPONSAVEL_ASSINATURA where codigo = 0';
        dm_rc.fdqryresponsavelassinatura.Open();

        mm.FDTransaction.StartTransaction;

        dm_rc.fdqryresponsavelassinatura.Append;
        dm_rc.fdqryresponsavelassinatura.FindField('KEY').AsString               := Gera_Guid();
        dm_rc.fdqryresponsavelassinatura.FindField('CODIGO').AsInteger           := Ultimo_Codigo('RESPONSAVEL_ASSINATURA','CODIGO',True);
        dm_rc.fdqryresponsavelassinatura.FindField('EMPRESA').AsInteger          := pempresa;
        dm_rc.fdqryresponsavelassinatura.FindField('ASSINADO').AsString          := 'N';
        dm_rc.fdqryresponsavelassinatura.FindField('ENTREGUE').AsString          := 'F';
        dm_rc.fdqryresponsavelassinatura.FindField('RT').AsInteger               := prt;
        dm_rc.fdqryresponsavelassinatura.FindField('DATA_SOLICITADA').AsDateTime := Date;
        dm_rc.fdqryresponsavelassinatura.FindField('HORA_SOLICITADA').AsDateTime := Time;
        dm_rc.fdqryresponsavelassinatura.FindField('SOLICITACAO').AsInteger      := varIIF(ptabela = 'SOLICITACAO',pcodigo,0);
        dm_rc.fdqryresponsavelassinatura.FindField('TERMO').AsInteger            := varIIF(ptabela = 'TERMO'      ,pcodigo,0);
        dm_rc.fdqryresponsavelassinatura.FindField('MENSAGEM').AsString          := 'Olá R.T.! - Estou solicitando sua assinatura neste  <br>documento por favor</br>.';
        dm_rc.fdqryresponsavelassinatura.Post;

        mm.FDTransaction.Commit;

      end;

    if pacao = 'DELETE' then
      begin
        if ptabela = 'SOLICITACAO' then
          begin
            dm_rc.fdqryresponsavelassinatura.Close;
            dm_rc.fdqryresponsavelassinatura.SQL.clear;
            dm_rc.fdqryresponsavelassinatura.SQL.Text := 'delete from responsavel_assinatura where solicitacao = ' + IntToStr(pcodigo);
            dm_rc.fdqryresponsavelassinatura.Execute();
          end;
      end;

    Result := True;
  except
    Result := False;
  end;
end;
function  AssinaturaPendente    (pempresa,prt:integer)                : Integer;
var
  protAnalise     : TFDQuery;
  escrita,ano,mes : string;
begin
  protAnalise            := TFDQuery.Create(nil);
  protAnalise.Connection := mm.SQLConn;
  escrita                :=
                            ' SELECT coalesce(count(codigo),0) as contagem FROM RESPONSAVEL_ASSINATURA ' +
                            ' WHERE EMPRESA                         =                                  ' + IntToStr(pempresa) +
                            ' AND ASSINADO                          =                                  ' + QuotedStr('N')     +
                            ' AND RT                                =                                  ' + IntToStr(prt);

  with protAnalise do
    begin
      Close;
      UnPrepare;
      Sql.Clear;
      sql.Text := escrita;
      Prepare;
      Open;
    end;

  result := protAnalise.FindField('contagem').AsInteger;
  protAnalise.Free;
end;
function GerarBoletoPDF (pempresa,pnumero,pdocumento,pparcela,pbanco:integer)                      : string;
begin
  M_ARQUIVO              := Gera_Guid()+'.pdf';

  TabelaEmpresas('select * from empresas where codigo   = ' + IntToStr(pempresa));
  TabelaPortadores('select * from portadores where codigo = ' + IntToStr(pbanco));
  TabelaReceber ('select * from receber where empresa   = ' + IntToStr(pempresa)   +
                 'and                            numero = ' + IntToStr(pnumero)    +
                 'and                         documento = ' + IntToStr(pdocumento) +
                 variif(pparcela = 0,' order by sequencia asc',' and sequencia = ' + IntToStr(pparcela)));
  SqlPesquisa ('select * from mvmestre ' +
               'join condicoes on mvmestre.condicao = condicoes.codigo ' +
               'where empresa = ' + IntToStr(dm_rc.tbreceber.FindField('EMPRESA').AsInteger) + ' and ' +
                      'numero = ' + IntToStr(dm_rc.tbreceber.FindField('NUMERO').AsInteger)  + ' and ' +
                       'serie = ' + QuotedStr(dm_rc.tbreceber.FindField('SERIE').AsString));

  PreencheTitulosBoleto();
  dm_rc.ACBrBoleto.GerarPDF;

//  Result := dm_rc.ACBrBoletoFCFortes.NomeArquivo;
end;


procedure PreencheTitulosBoleto();
var M_ULTIMO : Integer;
begin
//  dm_rc.ACBrBoletoFCFortes.LayOut            := lPadraoEntrega;
//  dm_rc.ACBrBoletoFCFortes.DirLogo           := 'C:\Arquivos\Bancos\Logos\Colorido\';
//  dm_rc.ACBrBoletoFCFortes.SoftwareHouse     := 'Sisgrãos - Sistema de gestão de sementeiras e laboratorios';
//  dm_rc.ACBrBoletoFCFortes.NomeArquivo       := mm.M_PATHIMPRESSAO + M_ARQUIVO;

  if dm_rc.tbportadores.Findfield('BANCO').AsString = '033' then  // BANCO SANTANDER
    begin
      dm_rc.ACBrBoleto.Banco.TipoCobranca        := cobSantander;
      dm_rc.ACBrBoleto.Cedente.Modalidade        := '101';
      dm_rc.ACBrBoleto.Cedente.CodigoCedente     := dm_rc.tbportadores.Findfield('CONVENIO').AsString;
      dm_rc.ACBrBoleto.Cedente.Convenio          := dm_rc.tbportadores.Findfield('CONVENIO').AsString;
      dm_rc.ACBrBoleto.Cedente.CodigoTransmissao := dm_rc.tbportadores.Findfield('CODIGOTRANSMISSAO').AsString;
    end;
  if dm_rc.tbportadores.Findfield('BANCO').AsString = '341' then   // BANCO ITAU
    dm_rc.ACBrBoleto.Banco.TipoCobranca        := cobItau;

  dm_rc.ACBrBoleto.Cedente.Agencia           := dm_rc.tbportadores.Findfield('AGENCIA').AsString;
  dm_rc.ACBrBoleto.Cedente.AgenciaDigito     := dm_rc.tbportadores.Findfield('DIGITO').AsString;
  dm_rc.ACBrBoleto.Cedente.Conta             := dm_rc.tbportadores.Findfield('CONTA').AsString;
  dm_rc.ACBrBoleto.Cedente.ContaDigito       := dm_rc.tbportadores.Findfield('DIGITOCONTA').AsString;
  dm_rc.ACBrBoleto.Cedente.Nome              := dm_rc.tbempresas.Findfield('NOME').AsString;
  dm_rc.ACBrBoleto.Cedente.CNPJCPF           := dm_rc.tbempresas.Findfield('CPFCNPJ').AsString;
  dm_rc.ACBrBoleto.Cedente.Logradouro        := dm_rc.tbempresas.Findfield('ENDERECO').AsString + ' ' + dm_rc.tbempresas.Findfield('NUMERO').AsString;
  dm_rc.ACBrBoleto.Cedente.Bairro            := dm_rc.tbempresas.Findfield('BAIRRO').AsString;
  dm_rc.ACBrBoleto.Cedente.Cidade            := dm_rc.tbempresas.Findfield('CIDADE').AsString;
  dm_rc.ACBrBoleto.Cedente.CEP               := dm_rc.tbempresas.Findfield('CEP').AsString;
  dm_rc.ACBrBoleto.Cedente.UF                := dm_rc.tbempresas.Findfield('ESTADO').AsString;
  dm_rc.ACBrBoleto.Cedente.Telefone          := dm_rc.tbempresas.Findfield('TELEFONE').AsString;
  dm_rc.ACBrBoleto.Cedente.FantasiaCedente   := dm_rc.tbempresas.Findfield('FANTASIA').AsString;
  dm_rc.ACBrBoleto.DirArqRemessa             := '';
  dm_rc.ACBrBoleto.DirArqRetorno             := '';

  //*******************************************************************//
  dm_rc.ACBrBoleto.ListadeBoletos.Clear;

  dm_rc.tbreceber.First;
  while not dm_rc.tbreceber.Eof do
    begin
      M_ULTIMO := 0;
      Titulo   := dm_rc.ACBrBoleto.CriarTituloNaLista;
      with Titulo do
        begin
          TabelaPessoas ('SELECT * FROM PESSOAS WHERE CODIGO = ' + QuotedStr(dm_rc.tbreceber.FindField('PESSOA').AsString));

          if dm_rc.tbreceber.FindField('NUMEROBOLETO').AsInteger <= 0 then
            begin
              M_ULTIMO      := StrToInt(dm_rc.tbportadores.Findfield('NOSSONUMERO').AsString) + 1;
              dm_rc.tbportadores.Edit;
              dm_rc.tbportadores.FindField('NOSSONUMERO').AsInteger := M_ULTIMO;
              dm_rc.tbportadores.Post;
            end
          else
            M_ULTIMO    := dm_rc.tbreceber.FindField('NUMEROBOLETO').AsInteger;

          SeuNumero               := IntToStr(dm_rc.tbreceber.FindField('CODIGO').AsInteger);
          NumeroDocumento         := StrZero(dm_rc.tbreceber.FindField('EMPRESA').AsInteger,2,0) +
                                     StrZero(dm_rc.tbreceber.FindField('NUMERO').AsInteger,7,0)  +
                                     StrZero(dm_rc.tbreceber.FindField('SEQUENCIA').AsInteger,3,0) +
                                     dm_rc.tbreceber.FindField('SERIE').AsString;
          Carteira                := dm_rc.tbportadores.Findfield('CARTEIRA').AsString;
          if dm_rc.tbportadores.Findfield('BANCO').AsString = '033' then  // BANCO SANTANDER
            begin
              CaracTitulo         := tcSimplesRapComReg;
              NossoNumero         := StrZero(M_ULTIMO,6,0)
            end
          else
            NossoNumero           := IntToStr(M_ULTIMO);

          LocalPagamento          := dm_rc.tbportadores.Findfield('LOCALPAGAMENTO').AsString;
          TotalParcelas           := dm_rc.sqlBuscas.FindField('PARCELAS').AsInteger;
          Vencimento              := dm_rc.tbreceber.FindField('VENCIMENTO').AsDateTime;
          DataDocumento           := dm_rc.tbreceber.FindField('EMISSAO').AsDateTime;
          EspecieDoc              := 'DM';
          DataProcessamento       := Now;
          ValorDocumento          := dm_rc.tbreceber.FindField('VALORATUAL').AsFloat;
          Sacado.NomeSacado       := StrLeft(StrAllTrim(dm_rc.FDQryPessoas.FindField('NOME').AsString),30);
          Sacado.CNPJCPF          := dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString;
          Sacado.Logradouro       := dm_rc.FDQryPessoas.FindField('ENDERECO').AsString;
          Sacado.Numero           := dm_rc.FDQryPessoas.FindField('NUMERO').AsString;
          Sacado.Bairro           := dm_rc.FDQryPessoas.FindField('BAIRRO').AsString;
          Sacado.Cidade           := dm_rc.FDQryPessoas.FindField('CIDADE').AsString;
          Sacado.UF               := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
          Sacado.CEP              := dm_rc.FDQryPessoas.FindField('CEP').AsString;
          Sacado.Email            := dm_rc.FDQryPessoas.FindField('EMAIL').AsString;
          Sacado.Fone             := dm_rc.FDQryPessoas.FindField('TELEFONE').AsString;
          LocalPagamento          := dm_rc.tbportadores.Findfield('LOCALPAGAMENTO').AsString;
          if (Length(RemoverEspeciais(DM_RC.FDQryPessoas.FindField('CPFCNPJ').AsString)) > 11) then
            Sacado.Pessoa         := pJuridica
          else
            sacado.Pessoa         := pFisica;
          ValorDesconto           := 0;
          ValorAbatimento         := 0;
          if MRound(((dm_rc.tbreceber.FindField('VALORATUAL').AsFloat * 0.01) * (dm_rc.tbportadores.FindField('JUROS').AsFloat /30)),2) >= 0.01 then
            begin
              ValorMoraJuros      := MRound(((dm_rc.tbreceber.FindField('VALORATUAL').AsFloat * 0.01) * (dm_rc.tbportadores.FindField('JUROS').AsFloat /30)),2);
              DataMoraJuros       := dm_rc.tbreceber.FindField('VENCIMENTO').AsDateTime + 1;
              DataMulta           := dm_rc.tbreceber.FindField('VENCIMENTO').AsDateTime + 1;
              PercentualMulta     := dm_rc.tbportadores.FindField('TAXA').AsFloat;
            end;

          Mensagem.Text           := dm_rc.tbportadores.Findfield('INSTRUCAO').AsString;

          dm_rc.tbreceber.Edit;
          dm_rc.tbreceber.FindField('NOSSONUMERO').AsString   := NossoNumero;
          dm_rc.tbreceber.FindField('NUMEROBOLETO').AsInteger := M_ULTIMO;
          dm_rc.tbreceber.Post;

        end;


      dm_rc.tbreceber.Next;
    end;
end;



function ConfirmarBoleto (pempresa,pnumero,pdocumento,pparcela,pbanco:integer)  : boolean;
begin
  if TabelaReceber ('select * from receber where empresa   = ' + IntToStr(pempresa)   +
                    'and                            numero = ' + IntToStr(pnumero)    +
                    'and                         documento = ' + IntToStr(pdocumento) +
                    'and                         portador  = ' + IntToStr(pbanco)     +
                    'and                   confirmaboleto  = ' + QuotedStr('T')) then
  begin
    Result := False;
  end
  else
    begin
      try
        TabelaReceber ('select * from receber where empresa   = ' + IntToStr(pempresa)   +
                       'and                            numero = ' + IntToStr(pnumero)    +
                       'and                         documento = ' + IntToStr(pdocumento) +
                       'order by sequencia');

        dm_rc.tbreceber.First;
        while not dm_rc.tbreceber.Eof do
          begin
            dm_rc.tbreceber.Edit;
            dm_rc.tbreceber.FindField('PORTADOR').AsInteger       := pbanco;
            dm_rc.tbreceber.FindField('CONFIRMABOLETO').AsString  := 'T';
            dm_rc.tbreceber.FindField('CONFIRMAREMESSA').AsString := 'F';
            dm_rc.tbreceber.FindField('EMISSAOBOLETO').AsDateTime := Date;
            dm_rc.tbreceber.FindField('HORABOLETO').AsDateTime    := Time;
            dm_rc.tbreceber.FindField('NOSSONUMERO').AsString     := '';
            dm_rc.tbreceber.FindField('NUMEROBOLETO').AsInteger   := 0;
            dm_rc.tbreceber.Post;
            dm_rc.tbreceber.Next
          end;

        Result := True;
      except
        Result := False;
      end;
    end;
end;

function GerarRemessar(pempresa,pbanco:integer): string;
var
  diretorio,
  nomeremessa:string;
  tabelaBR   :TFDQuery;
  BancoNome          : String;
  NroRemessa         : Integer;

begin
  TabelaEmpresas   ('select * from empresas where codigo   = ' + IntToStr(pempresa));

  TabelaPortadores ('select * from portadores where codigo = ' + IntToStr(pbanco));

  NroRemessa                               := dm_rc.tbportadores.FindField('REMESSA').AsInteger + 1;

  dm_rc.ACBrBoleto.LayoutRemessa           := c240;
  dm_rc.ACBrBoleto.Cedente.ResponEmissao   := tbCliEmite;
  dm_rc.ACBrBoleto.Cedente.TipoCarteira    := tctRegistrada;

  if dm_rc.tbportadores.Findfield('BANCO').AsString = '033' then  // BANCO SANTANDER
    begin
      dm_rc.ACBrBoleto.Banco.TipoCobranca        := cobSantander;
      dm_rc.ACBrBoleto.Cedente.Modalidade        := '101';
      dm_rc.ACBrBoleto.Cedente.CodigoCedente     := dm_rc.tbportadores.Findfield('CONVENIO').AsString;
      dm_rc.ACBrBoleto.Cedente.Convenio          := dm_rc.tbportadores.Findfield('CONVENIO').AsString;
      dm_rc.ACBrBoleto.Cedente.CodigoTransmissao := dm_rc.tbportadores.Findfield('CODIGOTRANSMISSAO').AsString;
    end
  else
    if dm_rc.tbportadores.Findfield('BANCO').AsString = '341' then   // BANCO ITAU
      begin
        BancoNome                                  := 'BANCO ITAU';
        dm_rc.ACBrBoleto.Banco.TipoCobranca        := cobItau;
        dm_rc.ACBrBoleto.Cedente.CodigoCedente     := '';
        dm_rc.ACBrBoleto.Cedente.Convenio          := '';
      end;

  dm_rc.ACBrBoleto.Banco.Nome                := BancoNome;
  dm_rc.ACBrBoleto.Banco.Numero              := dm_rc.tbportadores.FindField('BANCO').AsInteger;
  dm_rc.ACBrBoleto.Cedente.Agencia           := dm_rc.tbportadores.Findfield('AGENCIA').AsString;
  dm_rc.ACBrBoleto.Cedente.AgenciaDigito     := dm_rc.tbportadores.Findfield('DIGITO').AsString;
  dm_rc.ACBrBoleto.Cedente.Conta             := dm_rc.tbportadores.Findfield('CONTA').AsString;
  dm_rc.ACBrBoleto.Cedente.ContaDigito       := dm_rc.tbportadores.Findfield('DIGITOCONTA').AsString;
  dm_rc.ACBrBoleto.Cedente.Nome              := dm_rc.tbempresas.Findfield('NOME').AsString;
  dm_rc.ACBrBoleto.Cedente.CNPJCPF           := dm_rc.tbempresas.Findfield('CPFCNPJ').AsString;
  dm_rc.ACBrBoleto.Cedente.Logradouro        := dm_rc.tbempresas.Findfield('ENDERECO').AsString + ' ' + dm_rc.tbempresas.Findfield('NUMERO').AsString;
  dm_rc.ACBrBoleto.Cedente.Bairro            := dm_rc.tbempresas.Findfield('BAIRRO').AsString;
  dm_rc.ACBrBoleto.Cedente.Cidade            := dm_rc.tbempresas.Findfield('CIDADE').AsString;
  dm_rc.ACBrBoleto.Cedente.CEP               := dm_rc.tbempresas.Findfield('CEP').AsString;
  dm_rc.ACBrBoleto.Cedente.UF                := dm_rc.tbempresas.Findfield('ESTADO').AsString;
  dm_rc.ACBrBoleto.Cedente.Telefone          := dm_rc.tbempresas.Findfield('TELEFONE').AsString;
  dm_rc.ACBrBoleto.Cedente.FantasiaCedente   := dm_rc.tbempresas.Findfield('FANTASIA').AsString;

  //*******************************************************************//
  dm_rc.ACBrBoleto.ListadeBoletos.Clear;

  dm_rc.tbremessa.DisableControls;
  dm_rc.tbremessa.First;
  while not dm_rc.tbremessa.Eof do
    begin
      if dm_rc.tbremessa.FindField('marcador').AsString = 'T' then
        begin
          Titulo   := dm_rc.ACBrBoleto.CriarTituloNaLista;
          with Titulo do
            begin
              TabelaPessoas ('SELECT * FROM PESSOAS    WHERE CODIGO = ' + QuotedStr(dm_rc.tbremessa.FindField('PESSOA').AsString));
              OcorrenciaOriginal.Tipo := toRemessaRegistrar;
              SeuNumero               := IntToStr(dm_rc.tbremessa.FindField('CODIGO').AsInteger);
              NumeroDocumento         := StrZero(dm_rc.tbremessa.FindField('EMPRESA').AsInteger,2,0) +
                                         StrZero(dm_rc.tbremessa.FindField('NUMERO').AsInteger,7,0)  +
                                         StrZero(dm_rc.tbremessa.FindField('SEQUENCIA').AsInteger,3,0) +
                                         dm_rc.tbremessa.FindField('SERIE').AsString;
              if dm_rc.tbportadores.Findfield('BANCO').AsString = '033' then  // BANCO SANTANDER
                begin
                  CaracTitulo         := tcSimplesRapComReg;
                  Carteira            := dm_rc.tbportadores.Findfield('CARTEIRA').AsString;
                  NossoNumero         := dm_rc.tbremessa.FindField('NOSSONUMERO').AsString;
                end
              else
                begin
                  Carteira            := dm_rc.tbportadores.Findfield('CARTEIRA').AsString;
                  NossoNumero         := dm_rc.tbremessa.FindField('NOSSONUMERO').AsString;
                end;
              LocalPagamento          := dm_rc.tbportadores.Findfield('LOCALPAGAMENTO').AsString;
              Vencimento              := dm_rc.tbremessa.FindField('VENCIMENTO').AsDateTime;
              DataBaixa               := dm_rc.tbremessa.FindField('VENCIMENTO').AsDateTime + 30;
              DataDocumento           := dm_rc.tbremessa.FindField('EMISSAO').AsDateTime;
              EspecieDoc              := 'DM';
              DataProcessamento       := Now;
              CarteiraEnvio           := tceCedente;
              ValorDocumento          := dm_rc.tbremessa.FindField('VALORATUAL').AsFloat;
              Sacado.NomeSacado       := StrLeft(StrAllTrim(dm_rc.FDQryPessoas.FindField('NOME').AsString),30);
              Sacado.CNPJCPF          := dm_rc.FDQryPessoas.FindField('CPFCNPJ').AsString;
              Sacado.Logradouro       := dm_rc.FDQryPessoas.FindField('ENDERECO').AsString;
              Sacado.Numero           := dm_rc.FDQryPessoas.FindField('NUMERO').AsString;
              Sacado.Bairro           := dm_rc.FDQryPessoas.FindField('BAIRRO').AsString;
              Sacado.Cidade           := dm_rc.FDQryPessoas.FindField('CIDADE').AsString;
              Sacado.UF               := dm_rc.FDQryPessoas.FindField('ESTADO').AsString;
              Sacado.CEP              := dm_rc.FDQryPessoas.FindField('CEP').AsString;
              Sacado.Email            := dm_rc.FDQryPessoas.FindField('EMAIL').AsString;
              Sacado.Fone             := dm_rc.FDQryPessoas.FindField('TELEFONE').AsString;
              LocalPagamento          := dm_rc.tbportadores.Findfield('LOCALPAGAMENTO').AsString;
              if (Length(RemoverEspeciais(DM_RC.FDQryPessoas.FindField('CPFCNPJ').AsString)) > 11) then
                Sacado.Pessoa         := pJuridica
              else
                sacado.Pessoa         := pFisica;
              ValorDesconto           := 0;
              ValorAbatimento         := 0;
              if MRound(((dm_rc.tbremessa.FindField('VALORATUAL').AsFloat * 0.01) * (dm_rc.tbportadores.FindField('JUROS').AsFloat /30)),2) >= 0.01 then
                begin
                  ValorMoraJuros      := MRound(((dm_rc.tbremessa.FindField('VALORATUAL').AsFloat * 0.01) * (dm_rc.tbportadores.FindField('JUROS').AsFloat /30)),2);
                  DataMoraJuros       := dm_rc.tbremessa.FindField('VENCIMENTO').AsDateTime + 1;
                  DataMulta           := dm_rc.tbremessa.FindField('VENCIMENTO').AsDateTime + 1;
                  PercentualMulta     := dm_rc.tbportadores.FindField('TAXA').AsFloat;
                end;

              Mensagem.Text           := dm_rc.tbportadores.Findfield('INSTRUCAO').AsString;

              if dm_rc.tbportadores.FindField('PROTESTO').AsString <> '' then
                begin
                  DataProtesto            := dm_rc.tbremessa.FindField('VENCIMENTO').AsDateTime + StrToInt(dm_rc.tbportadores.FindField('PROTESTO').AsString);
                  DiasDeProtesto          := StrToInt(dm_rc.tbportadores.FindField('PROTESTO').AsString);
                end;

              if dm_rc.tbportadores.FindField('BANCO').AsString = '033' then // BANCO SANTANDER
                begin
                  Instrucao1              := '0';
                  Instrucao2              := '1';
                end
              else
                begin
                  Instrucao1              := '00';
                  Instrucao2              := '00';
                end;
            end;

          executasql('update receber set confirmaremessa = ' + QuotedStr('T') +
                     'where codigo = ' + IntToStr(dm_rc.tbremessa.FindField('CODIGO').AsInteger));
        end;
      dm_rc.tbremessa.Next;
    end;
  dm_rc.tbremessa.First;
  dm_rc.tbremessa.EnableControls;

  diretorio := 'c:\arquivos\Bancos\'+dm_rc.tbempresas.FindField('CNPJ').AsString             +
                                     dm_rc.tbportadores.FindField('DIRREMESSA').AsString     + '\' +
                                     FormatDateTime('yyyy',DATE)                             + '\' +
                                     Sigla_Mes(DATE);

  if not IsDir(diretorio) then
    forceDirectories(diretorio);

  dm_rc.ACBrBoleto.DirArqRemessa  := diretorio;
  dm_rc.ACBrBoleto.NomeArqRemessa := 'B' + dm_rc.tbportadores.Findfield('BANCO').AsString + StrZero(NroRemessa + 1, 4, 0) + '.TXT';
  nomeremessa                     := dm_rc.ACBrBoleto.GerarRemessa(NroRemessa);

  dm_rc.tbportadores.Edit;
  dm_rc.tbportadores.FindField('REMESSA').AsInteger := NroRemessa;
  dm_rc.tbportadores.Post;

  tabelaBR                                       := TFDQuery.Create(nil);
  tabelaBR.Connection                            := mm.SQLConn;
  tabelaBR.UpdateOptions.UpdateTableName         := 'BANCO_REMESSA';

  tabelaBR.Close;
  tabelaBR.SQL.Text := 'select * from BANCO_REMESSA where codigo = 0';
  tabelaBR.Open();

  try
    tabelaBR.Append;
    tabelaBR.FindField('KEY').AsString             := Gera_Guid();
    tabelaBR.FindField('CODIGO').AsInteger         := Ultimo_Codigo('BANCO_REMESSA','CODIGO',True);
    tabelaBR.FindField('EMPRESA').AsInteger        := pempresa;
    tabelaBR.FindField('PORTADOR').AsInteger       := pbanco;
    tabelaBR.FindField('EMISSAO').AsDateTime       := Date;
    tabelaBR.FindField('HORA').AsDateTime          := Time;
    tabelaBR.FindField('CONTEUDO').AsString        := nomeremessa;
    tabelaBR.Post;
  finally
    FreeAndNil(tabelaBR);
  end;

  dm_rc.tbremessa.Close;

  Result := nomeremessa;
end;


procedure LerRetorno              (pempresa,pbanco:integer);
begin
  TabelaEmpresas('select * from empresas where codigo   = ' + IntToStr(pempresa));
  TabelaPortadores('select * from portadores where codigo = ' + IntToStr(pbanco));

  dm_rc.ACBrBoleto.LayoutRemessa           := c240;
  dm_rc.ACBrBoleto.Cedente.ResponEmissao   := tbCliEmite;
  dm_rc.ACBrBoleto.Cedente.TipoCarteira    := tctRegistrada;
  dm_rc.ACBrBoleto.LeCedenteRetorno        := True;

  if dm_rc.tbportadores.Findfield('BANCO').AsString = '033' then  // BANCO SANTANDER
    begin
      dm_rc.ACBrBoleto.Banco.TipoCobranca        := cobSantander;
      dm_rc.ACBrBoleto.Cedente.Modalidade        := '101';
      dm_rc.ACBrBoleto.Cedente.CodigoCedente     := dm_rc.tbportadores.Findfield('CONVENIO').AsString;
      dm_rc.ACBrBoleto.Cedente.Convenio          := dm_rc.tbportadores.Findfield('CONVENIO').AsString;
      dm_rc.ACBrBoleto.Cedente.CodigoTransmissao := dm_rc.tbportadores.Findfield('CODIGOTRANSMISSAO').AsString;
    end
  else
    if dm_rc.tbportadores.Findfield('BANCO').AsString = '341' then   // BANCO ITAU
      begin
        dm_rc.ACBrBoleto.Banco.TipoCobranca        := cobItau;
        dm_rc.ACBrBoleto.Cedente.CodigoCedente     := '';
        dm_rc.ACBrBoleto.Cedente.Convenio          := '';
      end;

  dm_rc.ACBrBoleto.Banco.Numero              := dm_rc.tbportadores.FindField('BANCO').AsInteger;
  dm_rc.ACBrBoleto.Cedente.Agencia           := dm_rc.tbportadores.Findfield('AGENCIA').AsString;
  dm_rc.ACBrBoleto.Cedente.AgenciaDigito     := dm_rc.tbportadores.Findfield('DIGITO').AsString;
  dm_rc.ACBrBoleto.Cedente.Conta             := dm_rc.tbportadores.Findfield('CONTA').AsString;
  dm_rc.ACBrBoleto.Cedente.ContaDigito       := dm_rc.tbportadores.Findfield('DIGITOCONTA').AsString;
  dm_rc.ACBrBoleto.Cedente.Nome              := dm_rc.tbempresas.Findfield('NOME').AsString;
  dm_rc.ACBrBoleto.Cedente.CNPJCPF           := dm_rc.tbempresas.Findfield('CPFCNPJ').AsString;
  dm_rc.ACBrBoleto.Cedente.Logradouro        := dm_rc.tbempresas.Findfield('ENDERECO').AsString + ' ' + dm_rc.tbempresas.Findfield('NUMERO').AsString;
  dm_rc.ACBrBoleto.Cedente.Bairro            := dm_rc.tbempresas.Findfield('BAIRRO').AsString;
  dm_rc.ACBrBoleto.Cedente.Cidade            := dm_rc.tbempresas.Findfield('CIDADE').AsString;
  dm_rc.ACBrBoleto.Cedente.CEP               := dm_rc.tbempresas.Findfield('CEP').AsString;
  dm_rc.ACBrBoleto.Cedente.UF                := dm_rc.tbempresas.Findfield('ESTADO').AsString;
  dm_rc.ACBrBoleto.Cedente.Telefone          := dm_rc.tbempresas.Findfield('TELEFONE').AsString;
  dm_rc.ACBrBoleto.Cedente.FantasiaCedente   := dm_rc.tbempresas.Findfield('FANTASIA').AsString;
end;
end.
