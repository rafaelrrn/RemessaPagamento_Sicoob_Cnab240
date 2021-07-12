{------------------------------------------------------------------------------|
|               CLASSE DO LAYOUT DO BANCO SICOOB (EXPORTAÇÃO CNAB 240)         |
|                                                                              |
|               INF. DO LAYOUT Manual de Importação de Arquivos CNAB 240       |
|                                                                              |
|              |   Data      |  Versão   |        Descrição             |      |
|              |08/02/2019   |   1.2     |                              |      |
|                                                                              |
|------------------------------------------------------------------------------}

unit uLayout_Sicoob_Emp240;

interface

uses System.Generics.Collections, System.SysUtils,System.Classes;

Type

   TRegistros_Cabecalho_Detalhes    = class;
   TRegistro_Cabecalho_Detalhe_Item = class;

   {  Registro Detalhes Filho - SEGMENTO A e SEGMENTO B  }
   TRegistros_Cabecalho_Detalhes = class(TCollection)
   private
      function GetRegistroDetalhes(Index: Integer): TRegistro_Cabecalho_Detalhe_Item;
      procedure SetRegistroDetalhes(Index: Integer; const Value: TRegistro_Cabecalho_Detalhe_Item);
      function Add: TRegistro_Cabecalho_Detalhe_Item;

   public

      property RegistroDetalhe[Index: Integer]: TRegistro_Cabecalho_Detalhe_Item read GetRegistroDetalhes write SetRegistroDetalhes; default;
   end;

   //Configurações do Registro Detalhe - Segmentos A e B (tp 3)
   TRegistro_Cabecalho_Detalhe_Item = class(TCollectionItem)
   private

                                                          // ---------------------------------------Detalhe - Segmento A------------------------------
                                                          //                                                                                     | Posição  |
                                                          //                                                           CAMPO                     | de | até | nº Dig| nº Dec| Formato | Default | Descrição
    FSegmentoA_Cod_Banco_Compensacao           : string;  //           |                Banco      | Código do Banco na Compensação              |  1 |  3  |   3   |   -   |   Num   |         |
    FSegmentoA_Lote_Servico                    : string;  // CONTROLE  |                Lote       | Lote de Serviço                             |  4 |  7  |   4   |   -   |   Num   |         |
    FSegmentoA_tp_Registro                     : string;  //           |                Registro   | Tipo de Registro                            |  8 |  8  |   1   |   -   |   Num   |   '3'   |

    FSegmentoA_N_Sequencial_Reg_Lote           : string;  //           |            Nº Registro    | Nº Seqüencial do Registro no Lote           |  9 |  13 |   5   |   -   |   Num   |         |
    FSegmentoA_Cod_Seg_Reg_Detalhe             : string;  // SERVIÇO   |                Segmento   | Código de Segmento do Reg. Detalhe          | 14 |  14 |   1   |   -   |   Alfa  |   'A'   |
    FSegmentoA_Tp_Movimento                    : string;  //           | Movimento |    Tipo       | Tipo de Movimento                           | 15 |  15 |   1   |   -   |   Num   |         |
    FSegmentoA_Cod_Instrucao_Movimento         : string;  //           | Movimento |    Código     | Código da Instrução p/ Movimento            | 16 |  17 |   2   |   -   |   Num   |         |

    FSegmentoA_Cod_Camara_Cent                 : string;  //           |           |    Câmara     | Código da Câmara Centralizadora             | 18 |  20 |   3   |   -   |   Num   |         |
    FSegmentoA_Cod_Banco_Favorecido            : string;  //           |           |    Banco      | Código do Banco do Favorecido               | 21 |  23 |   3   |   -   |   Num   |         |
    FSegmentoA_Cod_Agen_Mant_Cta_Favorecido    : string;  //           |C.Corrente |Agência|Código | Código Ag. Mantenedora da Cta do Favor.     | 24 |  28 |   5   |   -   |   Num   |         |
    FSegmentoA_Dig_Verificador_Agencia         : string;  // FAVORECIDO|C.Corrente |Agência|DV     | Dígito Verificador da Agência               | 29 |  29 |   1   |   -   |   Alfa  |         |
    FSegmentoA_N_Conta_Corrente                : string;  //           |C.Corrente |Conta  |Número | Número da Conta Corrente                    | 30 |  41 |   12  |   -   |   Num   |         |
    FSegmentoA_Dig_Verificador_Conta           : string;  //           |C.Corrente |Conta  |DV     | Dígito Verificador da Conta                 | 42 |  42 |   1   |   -   |   Num   |         |
    FSegmentoA_Dig_Verificador_AG_Conta        : string;  //           |C.Corrente |DV             | Dígito Verificador da AG/Conta              | 43 |  43 |   1   |   -   |   Alfa  |         |
    FSegmentoA_Nome_Favorecido                 : string;  //           |                Nome       | Nome do Favorecido                          | 44 |  73 |   30  |   -   |   Alfa  |         |

    FSegmentoA_N_Docum_Empresa                 : string;  //           |       Seu Número          | Nº do Docum. Atribuído p/ Empresa           | 74 |  93 |   20  |   -   |   Alfa  |         |
    FSegmentoA_Dt_Pagamento                    : string;  //           |       Data Pagamento      | Data do Pagamento                           | 94 |  101|   8   |   -   |   Num   |         |
    FSegmentoA_Tp_Moeda                        : string;  //           |Moeda |Tipo                | Tipo da Moeda                               | 102|  104|   3   |   -   |   Alfa  |         |
    FSegmentoA_Qtde_Moeda                      : string;  // CRÉDITO   |Moeda |Quantidade          | Quantidade da Moeda                         | 105|  119|   10  |   5   |   Num   |         |
    FSegmentoA_Vr_Pagamento                    : string;  //           |       Valor Pagamento     | Valor do Pagamento                          | 120|  134|   13  |   2   |   Num   |         |
    FSegmentoA_N_Doc_Atribuido_Banco           : string;  //           |       Nosso Número        | Nº do Docum. Atribuído pelo Banco           | 135|  154|   20  |   -   |   Alfa  |         |
    FSegmentoA_Dt_Real_Efetivacao_Pagto        : string;  //           |       Data Real           | Data Real da Efetivação Pagto               | 155|  162|   8   |   -   |   Num   |         |
    FSegmentoA_Vr_Real_Efetivacao_Pagto        : string;  //           |       Valor Real          | Valor Real da Efetivação do Pagto           | 163|  177|   13  |   2   |   Num   |         |

    FSegmentoA_Informação                      : string;  //                                       | Outras Informações  Vide formatação em G031
                                                          //       Informação 2                    | para identificação de Deposito Judicial e   | 178|  217|   40  |   -   |   Alfa  |         |
                                                          //                                       | Pgto.Salários de servidores pelo SIAPE

    FSegmentoA_Cod_Finalidade_Doc              : string;  //       Código Finalidade Doc           | Compl. Tipo Serviço                         | 218|  219|   2   |   -   |   Alfa  |         |
    FSegmentoA_Cod_Finalidade_TED              : string;  //       Código Finalidade TED           | Codigo finalidade da TED                    | 220|  224|   5   |   -   |   Alfa  |         |
    FSegmentoA_Cod_Finalidade_Comp             : string;  //       Código Finalidade Complementar  | Complemento de finalidade pagto.            | 225|  226|   2   |   -   |   Alfa  |         |
    FSegmentoA_CNAB                            : string;  //       CNAB                            | Uso Exclusivo FEBRABAN/CNAB                 | 227|  229|   3   |   -   |   Alfa  | Brancos |
    FSegmentoA_Aviso                           : string;  //       Aviso                           | Aviso ao Favorecido                         | 230|  230|   1   |   -   |   Num   |         |
    FSegmentoA_Ocorrencias                     : string;  //       Ocorrências                     |Códigos das Ocorrências p/ Retorno           | 231|  240|   10  |   -   |   Alfa  |         |
                                                          //-----------------------------------------------------------------------------------------------------------------------------------------



                                                          // ---------------------------------------Detalhe - Segmento B------------------------------
                                                          //                                                                                     | Posição  |
                                                          //                                                           CAMPO                     | de | até | nº Dig| nº Dec| Formato | Default | Descrição
    FSegmentoB_Cod_Banco_Compensacao           : string;  //           |                Banco      | Código do Banco na Compensação              |  1 |  3  |   3   |   -   |   Num   |         |
    FSegmentoB_Lote_Servico                    : string;  // CONTROLE  |                Lote       | Lote de Serviço                             |  4 |  7  |   4   |   -   |   Num   |         |
    FSegmentoB_tp_Registro                     : string;  //           |                Registro   | Tipo de Registro                            |  8 |  8  |   1   |   -   |   Num   |   '3'   |

    FSegmentoB_N_Sequencial_Reg_Lote           : string;  //           |            Nº Registro    | Nº Seqüencial do Registro no Lote           |  9 |  13 |   5   |   -   |   Num   |         |
    FSegmentoB_Cod_Seg_Reg_Detalhe             : string;  // SERVIÇO   |                Segmento   | Código de Segmento do Reg. Detalhe          | 14 |  14 |   1   |   -   |   Alfa  |   'B'   |

    FSegmentoB_CNAB                            : string;  //       CNAB                            | Uso Exclusivo FEBRABAN/CNAB                 | 15 |  17 |   3   |   -   |   Alfa  | Brancos |

    FSegmentoB_Tp_inscricao_Favorecido         : string;  //           | Favorecido|Inscrição|Tipo | Tipo de Inscrição do Favorecido             | 18 |  18 |   1   |   -   |   Num   |         |
    FSegmentoB_N_Inscricao_Favorecido          : string;  //           | Favorecido|Inscrição|Núm  | Número de Inscrição do Favorecido           | 19 |  32 |   14  |   -   |   Num   |         |
    FSegmentoB_Logradouro                      : string;  //           | Favorecido|  Logradouro   | Nome da Rua, Av, Pça, Etc                   | 33 |  62 |   30  |   -   |   Alfa  |         |
    FSegmentoB_Numero                          : string;  //           | Favorecido|  Número       | Nº do Local                                 | 63 |  67 |   5   |   -   |   Num   |         |
    FSegmentoB_Complemento                     : string;  // DADOS     | Favorecido|  Complemento  | Casa, Apto, Etc                             | 68 |  82 |   15  |   -   |   Alfa  |         |
    FSegmentoB_Bairro                          : string;  // COMPLE -  | Favorecido|  Bairro       | Bairro                                      | 83 |  97 |   15  |   -   |   Alfa  |         |
    FSegmentoB_Cidade                          : string;  // MENTARES  | Favorecido|  Cidade       | Nome da Cidade                              | 98 |  117|   20  |   -   |   Alfa  |         |
    FSegmentoB_CEP                             : string;  //           | Favorecido|  CEP          | CEP                                         | 118|  122|   5   |   -   |   Num   |         |
    FSegmentoB_Complem_CEP                     : string;  //           | Favorecido|  Complem. CEP | Complemento do CEP                          | 123|  125|   3   |   -   |   Alfa  |         |
    FSegmentoB_Estado                          : string;  //           | Favorecido|  Estado       | Sigla do Estado                             | 126|  127|   2   |   -   |   Alfa  |         |
    FSegmentoB_Vencimento                      : string;  //           | Pagamento |  Vencimento   | Data do Vencimento (Nominal)                | 128|  135|   8   |   -   |   Num   |         |
    FSegmentoB_Vr_Doc                          : string;  //           | Pagamento |  Valor Docum. | Valor do Documento (Nominal)                | 136|  150|   13  |   2   |   Num   |         |
    FSegmentoB_Abatimento                      : string;  //           | Pagamento |  Abatimento   | Valor do Abatimento                         | 151|  165|   13  |   2   |   Num   |         |
    FSegmentoB_Desconto                        : string;  //           | Pagamento |  Desconto     | Valor do Desconto                           | 166|  180|   13  |   2   |   Num   |         |
    FSegmentoB_Mora                            : string;  //           | Pagamento |  Mora         | Valor da Mora                               | 181|  195|   13  |   2   |   Num   |         |
    FSegmentoB_Multa                           : string;  //           | Pagamento |  Multa        | Valor da Multa                              | 196|  210|   13  |   2   |   Num   |         |
    FSegmentoB_Cod_Doc_Favorecido              : string;  //           |    Cód/Doc. Favorec.      | Código/Documento do Favorecido              | 211|  225|   15  |   -   |   Alfa  |         |

    FSegmentoB_Aviso_Favorecido                : string;  //       Aviso                           | Aviso ao Favorecido                         | 226|  226|    1  |   -   |   Num   |         |
    FSegmentoB_Cod_UG_Cent                     : string;  //       Código UG Centralizadora        | Uso Exclusivo para o SIAPE                  | 227|  232|    6  |   -   |   Num   |         |
    FSegmentoB_CNAB_1                          : string;  //       CNAB                            | Uso Exclusivo FEBRABAN/CNAB                 | 233|  240|    8  |   -   |   Alfa  | Brancos |


    procedure SetSegmentoA_Aviso(const Value: string);
    procedure SetSegmentoA_CNAB(const Value: string);
    procedure SetSegmentoA_Cod_Agen_Mant_Cta_Favorecido(const Value: string);
    procedure SetSegmentoA_Cod_Banco_Compensacao(const Value: string);
    procedure SetSegmentoA_Cod_Banco_Favorecido(const Value: string);
    procedure SetSegmentoA_Cod_Camara_Cent(const Value: string);
    procedure SetSegmentoA_Cod_Finalidade_Comp(const Value: string);
    procedure SetSegmentoA_Cod_Finalidade_Doc(const Value: string);
    procedure SetSegmentoA_Cod_Finalidade_TED(const Value: string);
    procedure SetSegmentoA_Cod_Instrucao_Movimento(const Value: string);
    procedure SetSegmentoA_Cod_Seg_Reg_Detalhe(const Value: string);
    procedure SetSegmentoA_Dig_Verificador_AG_Conta(const Value: string);
    procedure SetSegmentoA_Dig_Verificador_Agencia(const Value: string);
    procedure SetSegmentoA_Dig_Verificador_Conta(const Value: string);
    procedure SetSegmentoA_Dt_Pagamento(const Value: string);
    procedure SetSegmentoA_Dt_Real_Efetivacao_Pagto(const Value: string);
    procedure SetSegmentoA_Informação(const Value: string);
    procedure SetSegmentoA_Lote_Servico(const Value: string);
    procedure SetSegmentoA_N_Conta_Corrente(const Value: string);
    procedure SetSegmentoA_N_Doc_Atribuido_Banco(const Value: string);
    procedure SetSegmentoA_N_Docum_Empresa(const Value: string);
    procedure SetSegmentoA_N_Sequencial_Reg_Lote(const Value: string);
    procedure SetSegmentoA_Nome_Favorecido(const Value: string);
    procedure SetSegmentoA_Ocorrencias(const Value: string);
    procedure SetSegmentoA_Qtde_Moeda(const Value: string);
    procedure SetSegmentoA_Tp_Moeda(const Value: string);
    procedure SetSegmentoA_Tp_Movimento(const Value: string);
    procedure SetSegmentoA_tp_Registro(const Value: string);
    procedure SetSegmentoA_Vr_Pagamento(const Value: string);
    procedure SetSegmentoA_Vr_Real_Efetivacao_Pagto(const Value: string);


    procedure SetSegmentoB_Cod_Banco_Compensacao(const Value: string);
    procedure SetSegmentoB_Lote_Servico(const Value: string);
    procedure SetSegmentoB_tp_Registro(const Value: string);
    procedure SetSegmentoB_N_Sequencial_Reg_Lote(const Value: string);
    procedure SetSegmentoB_Cod_Seg_Reg_Detalhe(const Value: string);
    procedure SetSegmentoB_CNAB(const Value: string);
    procedure SetSegmentoB_Tp_inscricao_Favorecido(const Value: string);
    procedure SetSegmentoB_N_Inscricao_Favorecido(const Value: string);
    procedure SetSegmentoB_Logradouro(const Value: string);
    procedure SetSegmentoB_Numero(const Value: string);
    procedure SetSegmentoB_Complemento(const Value: string);
    procedure SetSegmentoB_Bairro(const Value: string);
    procedure SetSegmentoB_Cidade(const Value: string);
    procedure SetSegmentoB_CEP(const Value: string);
    procedure SetSegmentoB_Complem_CEP(const Value: string);
    procedure SetSegmentoB_Estado(const Value: string);
    procedure SetSegmentoB_Vencimento(const Value: string);
    procedure SetSegmentoB_Vr_Doc(const Value: string);
    procedure SetSegmentoB_Abatimento(const Value: string);
    procedure SetSegmentoB_Desconto(const Value: string);
    procedure SetSegmentoB_Mora(const Value: string);
    procedure SetSegmentoB_Multa(const Value: string);
    procedure SetSegmentoB_Cod_Doc_Favorecido(const Value: string);
    procedure SetSegmentoB_Aviso_Favorecido(const Value: string);
    procedure SetSegmentoB_Cod_UG_Cent(const Value: string);
    procedure SetSegmentoB_CNAB_1(const Value: string);

   public
      property SegmentoA_Cod_Banco_Compensacao         : string read FSegmentoA_Cod_Banco_Compensacao        write SetSegmentoA_Cod_Banco_Compensacao;
      property SegmentoA_Lote_Servico                  : string read FSegmentoA_Lote_Servico                 write SetSegmentoA_Lote_Servico;
      property SegmentoA_tp_Registro                   : string read FSegmentoA_tp_Registro                  write SetSegmentoA_tp_Registro;
      property SegmentoA_N_Sequencial_Reg_Lote         : string read FSegmentoA_N_Sequencial_Reg_Lote        write SetSegmentoA_N_Sequencial_Reg_Lote;
      property SegmentoA_Cod_Seg_Reg_Detalhe           : string read FSegmentoA_Cod_Seg_Reg_Detalhe          write SetSegmentoA_Cod_Seg_Reg_Detalhe;
      property SegmentoA_Tp_Movimento                  : string read FSegmentoA_Tp_Movimento                 write SetSegmentoA_Tp_Movimento;
      property SegmentoA_Cod_Instrucao_Movimento       : string read FSegmentoA_Cod_Instrucao_Movimento      write SetSegmentoA_Cod_Instrucao_Movimento;
      property SegmentoA_Cod_Camara_Cent               : string read FSegmentoA_Cod_Camara_Cent              write SetSegmentoA_Cod_Camara_Cent;
      property SegmentoA_Cod_Banco_Favorecido          : string read FSegmentoA_Cod_Banco_Favorecido         write SetSegmentoA_Cod_Banco_Favorecido;
      property SegmentoA_Cod_Agen_Mant_Cta_Favorecido  : string read FSegmentoA_Cod_Agen_Mant_Cta_Favorecido write SetSegmentoA_Cod_Agen_Mant_Cta_Favorecido;
      property SegmentoA_Dig_Verificador_Agencia       : string read FSegmentoA_Dig_Verificador_Agencia      write SetSegmentoA_Dig_Verificador_Agencia;
      property SegmentoA_N_Conta_Corrente              : string read FSegmentoA_N_Conta_Corrente             write SetSegmentoA_N_Conta_Corrente;
      property SegmentoA_Dig_Verificador_Conta         : string read FSegmentoA_Dig_Verificador_Conta        write SetSegmentoA_Dig_Verificador_Conta;
      property SegmentoA_Dig_Verificador_AG_Conta      : string read FSegmentoA_Dig_Verificador_AG_Conta     write SetSegmentoA_Dig_Verificador_AG_Conta;
      property SegmentoA_Nome_Favorecido               : string read FSegmentoA_Nome_Favorecido              write SetSegmentoA_Nome_Favorecido;
      property SegmentoA_N_Docum_Empresa               : string read FSegmentoA_N_Docum_Empresa              write SetSegmentoA_N_Docum_Empresa;
      property SegmentoA_Dt_Pagamento                  : string read FSegmentoA_Dt_Pagamento                 write SetSegmentoA_Dt_Pagamento;
      property SegmentoA_Tp_Moeda                      : string read FSegmentoA_Tp_Moeda                     write SetSegmentoA_Tp_Moeda;
      property SegmentoA_Qtde_Moeda                    : string read FSegmentoA_Qtde_Moeda                   write SetSegmentoA_Qtde_Moeda;
      property SegmentoA_Vr_Pagamento                  : string read FSegmentoA_Vr_Pagamento                 write SetSegmentoA_Vr_Pagamento;
      property SegmentoA_N_Doc_Atribuido_Banco         : string read FSegmentoA_N_Doc_Atribuido_Banco        write SetSegmentoA_N_Doc_Atribuido_Banco;
      property SegmentoA_Dt_Real_Efetivacao_Pagto      : string read FSegmentoA_Dt_Real_Efetivacao_Pagto     write SetSegmentoA_Dt_Real_Efetivacao_Pagto;
      property SegmentoA_Vr_Real_Efetivacao_Pagto      : string read FSegmentoA_Vr_Real_Efetivacao_Pagto     write SetSegmentoA_Vr_Real_Efetivacao_Pagto;
      property SegmentoA_Informação                    : string read FSegmentoA_Informação                   write SetSegmentoA_Informação;
      property SegmentoA_Cod_Finalidade_Doc            : string read FSegmentoA_Cod_Finalidade_Doc           write SetSegmentoA_Cod_Finalidade_Doc;
      property SegmentoA_Cod_Finalidade_TED            : string read FSegmentoA_Cod_Finalidade_TED           write SetSegmentoA_Cod_Finalidade_TED;
      property SegmentoA_Cod_Finalidade_Comp           : string read FSegmentoA_Cod_Finalidade_Comp          write SetSegmentoA_Cod_Finalidade_Comp;
      property SegmentoA_CNAB                          : string read FSegmentoA_CNAB                         write SetSegmentoA_CNAB;
      property SegmentoA_Aviso                         : string read FSegmentoA_Aviso                        write SetSegmentoA_Aviso;
      property SegmentoA_Ocorrencias                   : string read FSegmentoA_Ocorrencias                  write SetSegmentoA_Ocorrencias;

      property SegmentoB_Cod_Banco_Compensacao         : string read FSegmentoB_Cod_Banco_Compensacao        write SetSegmentoB_Cod_Banco_Compensacao;
      property SegmentoB_Lote_Servico                  : string read FSegmentoB_Lote_Servico                 write SetSegmentoB_Lote_Servico;
      property SegmentoB_tp_Registro                   : string read FSegmentoB_tp_Registro                  write SetSegmentoB_tp_Registro;
      property SegmentoB_N_Sequencial_Reg_Lote         : string read FSegmentoB_N_Sequencial_Reg_Lote        write SetSegmentoB_N_Sequencial_Reg_Lote;
      property SegmentoB_Cod_Seg_Reg_Detalhe           : string read FSegmentoB_Cod_Seg_Reg_Detalhe          write SetSegmentoB_Cod_Seg_Reg_Detalhe;
      property SegmentoB_CNAB                          : string read FSegmentoB_CNAB                         write SetSegmentoB_CNAB;
      property SegmentoB_Tp_inscricao_Favorecido       : string read FSegmentoB_Tp_inscricao_Favorecido      write SetSegmentoB_Tp_inscricao_Favorecido;
      property SegmentoB_N_Inscricao_Favorecido        : string read FSegmentoB_N_Inscricao_Favorecido       write SetSegmentoB_N_Inscricao_Favorecido;
      property SegmentoB_Logradouro                    : string read FSegmentoB_Logradouro                   write SetSegmentoB_Logradouro;
      property SegmentoB_Numero                        : string read FSegmentoB_Numero                       write SetSegmentoB_Numero;
      property SegmentoB_Complemento                   : string read FSegmentoB_Complemento                  write SetSegmentoB_Complemento;
      property SegmentoB_Bairro                        : string read FSegmentoB_Bairro                       write SetSegmentoB_Bairro;
      property SegmentoB_Cidade                        : string read FSegmentoB_Cidade                       write SetSegmentoB_Cidade;
      property SegmentoB_CEP                           : string read FSegmentoB_CEP                          write SetSegmentoB_CEP;
      property SegmentoB_Complem_CEP                   : string read FSegmentoB_Complem_CEP                  write SetSegmentoB_Complem_CEP;
      property SegmentoB_Estado                        : string read FSegmentoB_Estado                       write SetSegmentoB_Estado;
      property SegmentoB_Vencimento                    : string read FSegmentoB_Vencimento                   write SetSegmentoB_Vencimento;
      property SegmentoB_Vr_Doc                        : string read FSegmentoB_Vr_Doc                       write SetSegmentoB_Vr_Doc;
      property SegmentoB_Abatimento                    : string read FSegmentoB_Abatimento                   write SetSegmentoB_Abatimento;
      property SegmentoB_Desconto                      : string read FSegmentoB_Desconto                     write SetSegmentoB_Desconto;
      property SegmentoB_Mora                          : string read FSegmentoB_Mora                         write SetSegmentoB_Mora;
      property SegmentoB_Multa                         : string read FSegmentoB_Multa                        write SetSegmentoB_Multa;
      property SegmentoB_Cod_Doc_Favorecido            : string read FSegmentoB_Cod_Doc_Favorecido           write SetSegmentoB_Cod_Doc_Favorecido;
      property SegmentoB_Aviso_Favorecido              : string read FSegmentoB_Aviso_Favorecido             write SetSegmentoB_Aviso_Favorecido;
      property SegmentoB_Cod_UG_Cent                   : string read FSegmentoB_Cod_UG_Cent                  write SetSegmentoB_Cod_UG_Cent;
      property SegmentoB_CNAB_1                        : string read FSegmentoB_CNAB_1                       write SetSegmentoB_CNAB_1;

   end;

   //Configurações do Registro HEADER DO ARQUIVO(tp 0)/LOTE(tp 1)  E TRAILER DO ARQUIVO(tp 9)/LOTE(tp 5)
   TSicoob_Header_Emp240 = class

   private
                                              // ---------------------------------------REGISTRO--HEADER DO LOTE------------------------------
                                              //                                                                                     | Posição  |
                                              //                                                            CAMPO                    | de | até | nº Dig| nº Dec| Formato | Default | Descrição
    FCod_Banco_Compensacao         : string;  //          |                    |Banco            | Código do Banco na Compensação    |  1 |  3  |   3   |   -   |   Num   |         |
    FLote_Servico                  : string;  // CONTROLE |                    |Lote             | Lote de Serviço                   |  4 |  7  |   4   |   -   |   Num   |         |
    FTp_Registro                   : string;  //          |                    |Registro         | Tipo de Registro                  |  8 |  8  |   1   |   -   |   Num   |    '1'  |

    FTp_Operacao                   : string;  //          |                    |Operação         | Tipo da Operação                  |  9 |  9  |   1   |   -   |   Alfa  |    'C'  |
    FTp_Servico                    : string;  // SERVIÇO  |                    |Serviço          | Tipo do Serviço                   | 10 |  11 |   2   |   -   |   Num   |     30  |
    FForma_Lançamento              : string;  //          |                    |Forma Lançamento | Forma de Lançamento               | 12 |  13 |   2   |   -   |   Num   |      1  |
    FN_Versao_Layout_Lote          : string;  //          |                    |Layout do Lote   | Nº da Versão do Layout do Lote    | 14 |  16 |   3   |   -   |   Num   |    '045'|

    FCNAB_1                        : string;  //  CNAB    |            CNAB                      | Uso Exclusivo da FEBRABAN/CNAB    | 17 |  17 |   1   |   -   |   Alfa  |  Brancos|

    FTp_Inscricao_Empresa          : string;  //          | INSCRIÇÃO |        |Tipo             | Tipo de Inscrição da Empresa      | 18 |  18 |   1   |   -   |   Num   |         |
    FN_Inscricao_Empresa           : string;  //          | INSCRIÇÃO |        |Número           | Número de Inscrição da Empresa    | 19 |  32 |  14   |   -   |   Num   |         |

    FCod_Convenio_Banco            : string;  //          |           |        |Convênio         | Código do Convênio no Banco       | 33 |  52 |  20   |   -   |   Alfa  |         |

    FCod_Agencia_Mantenedora_Conta : string;  //          | C.Corrente|Agência |Código           | Agência Mantenedora da Conta      | 53 |  57 |   5   |   -   |   Num   |         |
    FDig_Verificador_Agencia       : string;  // EMPRESA  | C.Corrente|Agência |  DV             | Dígito Verificador da Agência     | 58 |  58 |   1   |   -   |   Alfa  |         |

    FN_Conta_Corrente              : string;  //          | C.Corrente|Conta   |Número           | Número da Conta Corrente          | 59 |  70 |  12   |   -   |   Num   |         |
    FDig_Verificador_Conta         : string;  //          | C.Corrente|Conta   |  DV             | Dígito Verificador da Conta       | 71 |  71 |   1   |   -   |   Num   |         |
    FDig_Verificador_Ag_Conta      : string;  //          | C.Corrente|DV      |  DV             | Dígito Verificador da Ag/Conta    | 72 |  72 |   1   |   -   |   Alfa  |         |
    FNome_Empresa                  : string;  //          | C.Corrente|        |Nome             | Nome da Empresa                   | 73 | 102 |  30   |   -   |   Alfa  |         |

    FMensagem                      : string;  // Informação 1                                    |Mensagem                           | 103| 142 |  40   |   -   |   Alfa  |         |

    FLogradouro                    : string;  //          |                    |Logradouro       | Nome da Rua, Av, Pça, Etc         | 143| 172 |  30   |   -   |   Alfa  |         |
    FNumero                        : string;  //          |                    |Número           | Número do Local                   | 173| 177 |   5   |   -   |   Num   |         |
    FComplemento                   : string;  //          |                    |Complemento      | Casa, Apto, Sala, Etc             | 178| 192 |  15   |   -   |   Alfa  |         |
    FCidade                        : string;  // ENDEREÇO |                    |Cidade           | Nome da Cidade                    | 193| 212 |  20   |   -   |   Alfa  |         |
    FCEP                           : string;  //          |                    |CEP              | CEP                               | 213| 217 |   5   |   -   |   Num   |         |
    FComplemento_CEP               : string;  //          |                    |Complemento CEP  | Complemento do CEP                | 218| 220 |   3   |   -   |   Alfa  |         |
    FEstado                        : string;  //          |                    |Estado           | Sigla do Estado                   | 221| 222 |   2   |   -   |   Alfa  |         |

    FInd_Forma_Pagamento           : string;  // Indicativo Forma de Pagamento |Indicativo da Forma de Pagamento do Serviço          | 223| 224 |   2   |   -   |   Num   |         |

    FCNAB_2                        : string;  //  CNAB    |           CNAB                       | Uso Exclusivo da FEBRABAN/CNAB    | 225| 230 |   6   |   -   |   Alfa  | Brancos |

    FCodigos_Ocorrencias           : string;  // Ocorrências                   | Códigos das Ocorrências p/ Retorno                  | 231| 240 |   10  |   -   |   Alfa  |         |
                                              //------------------------------------------------------------------------------------------------------------------------------------------



                                              //----------------------------------------REGISTRO--TRAILER DO LOTE--------------------------------------
                                              //                                                                                     | Posição  |
                                              //                                                            CAMPO                    | de | até | nº Dig| nº Dec| Formato | Default | Descrição
    FBanco                         : string;  //          |        Banco       | Código do Banco na Compensação                      |  1 |  3  |   3   |   -   |   Num   |         |
    FLote                          : string;  // CONTROLE |        Lote        | Lote de Serviço                                     |  4 |  7  |   4   |   -   |   Num   |         |
    FRegistro                      : string;  //          |        Registro    | Tipo de Registro                                    |  8 |  8  |   1   |   -   |   Num   |   '5'   |

    FCNAB                          : string;  // CNAB     |                    | Uso Exclusivo FEBRABAN/CNAB                         |  9 |  17 |   9   |   -   |   Alfa  | Brancos |

    FQtde_Registros                : string;  //          |  Qtde de Registros | Quantidade de Registros do Lote                     | 18 |  23 |   6   |   -   |   Num   |         |
    FValor                         : string;  // TOTAIS   |        Valor       | Somatória dos Valores                               | 24 |  41 |  16   |   2   |   Num   |         |
    FQtde_Moeda                    : string;  //          |  Qtde de Moeda     | Somatória de Quantidade de Moedas                   | 42 |  59 |  13   |   5   |   Num   |         |

    FNumero_Aviso_Debito           : string;  // Número Aviso Débito           | Número Aviso de Débito                              | 60 |  65 |  6    |   -   |   Num   |         |
    FCNAB_3                        : string;  // CNAB     |                    | Uso Exclusivo FEBRABAN/CNAB                         | 66 | 230 |  165  |   -   |   Alfa  | Brancos |
    FOcorrencias                   : string;  // Ocorrências                   | Códigos das Ocorrências para Retorno                | 231| 240 |  10   |   -   |   Alfa  |         |
                                              //--------------------------------------------------------------------------------------------------------------------------------------------------------

    FRegistros_Cabecalho_Detalhes: TRegistros_Cabecalho_Detalhes;
                                              // ---------------------------------------REGISTRO--HEADER DO ARQUIVO------------------------------
    FArq_Cod_Banco_Compensacao          : string;
    FArq_Lote_Servico                   : string;
    FArq_Tipo_Registro                  : string;
    FArq_CNAB_1                         : string;
    FArq_Tp_Inscricao_Empresa           : string;
    FArq_N_Inscricao_Empresa            : string;
    FArq_Cod_Convenio_Banco             : string;
    FArq_Cod_Agencia_Mantenedora_Conta  : string;
    FArq_Dig_Verificador_Agencia        : string;
    FArq_N_Conta_Corrente               : string;
    FArq_Dig_Verificador_Conta          : string;
    FArq_Dig_Verificador_Ag_Conta       : string;
    FArq_Nome_Empresa                   : string;
    FArq_Nome_Banco                     : string;
    FArq_CNAB_2                         : string;
    FArq_Cod_Remessa_Retorno            : string;
    FArq_Data_Geracao                   : string;
    FArq_Hora_Geracao                   : string;
    FArq_N_Sequencial                   : string;
    FArq_N_Versao_Layout                : string;
    FArq_Densidade                      : string;
    FArq_Reservado_Banco                : string;
    FArq_Reservado_Empresa              : string;
    FArq_CNAB_3                         : string;
                                              //--------------------------------------------------------------------------------------------------------------------------------------------------------
                                              //----------------------------------------REGISTRO--TRAILER DO ARQUIVO--------------------------------------
    FTrailer_Arq_Banco                  : string;
    FTrailer_Arq_Lote                   : string;
    FTrailer_Arq_Registro               : string;
    FTrailer_Arq_CNAB_1                 : string;
    FTrailer_Arq_Qtde_Lotes             : string;
    FTrailer_Arq_Qtde_Registros         : string;
    FTrailer_Arq_Qtde_Contas_Conci      : string;
    FTrailer_Arq_CNAB_2                 : string;
                                              //--------------------------------------------------------------------------------------------------------------------------------------------------------

    procedure SetCod_Banco_Compensacao(const Value: string);
    procedure SetCEP(const Value: string);
    procedure SetCidade(const Value: string);
    procedure SetCNAB_1(const Value: string);
    procedure SetCNAB_2(const Value: string);
    procedure SetCod_Agencia_Mantenedora_Conta(const Value: string);
    procedure SetCod_Convenio_Banco(const Value: string);
    procedure SetCodigos_Ocorrencias(const Value: string);
    procedure SetComplemento(const Value: string);
    procedure SetComplemento_CEP(const Value: string);
    procedure SetDig_Verificador_Ag_Conta(const Value: string);
    procedure SetDig_Verificador_Agencia(const Value: string);
    procedure SetDig_Verificador_Conta(const Value: string);
    procedure SetEstado(const Value: string);
    procedure SetForma_Lançamento(const Value: string);
    procedure SetInd_Forma_Pagamento(const Value: string);
    procedure SetLogradouro(const Value: string);
    procedure SetLote_Servico(const Value: string);
    procedure SetMensagem(const Value: string);
    procedure SetN_Conta_Corrente(const Value: string);
    procedure SetN_Inscricao_Empresa(const Value: string);
    procedure SetN_Versao_Layout_Lote(const Value: string);
    procedure SetNome_Empresa(const Value: string);
    procedure SetNumero(const Value: string);
    procedure SetTp_Inscricao_Empresa(const Value: string);
    procedure SetTp_Operacao(const Value: string);
    procedure SetTp_Registro(const Value: string);
    procedure SetTp_Servico(const Value: string);
    procedure SetBanco(const Value: string);
    procedure SetCNAB(const Value: string);
    procedure SetCNAB_3(const Value: string);
    procedure SetLote(const Value: string);
    procedure SetNumero_Aviso_Debito(const Value: string);
    procedure SetOcorrencias(const Value: string);
    procedure SetQtde_Moeda(const Value: string);
    procedure SetQtde_Registros(const Value: string);
    procedure SetRegistro(const Value: string);
    procedure SetValor(const Value: string);
    procedure SetRegistros_Cabecalho_Detalhes(
      const Value: TRegistros_Cabecalho_Detalhes);
    procedure SetArq_Cod_Banco_Compensacao(const Value: string);
    procedure SetArq_Lote_Servico(const Value: string);
    procedure SetArq_Tipo_Registro(const Value: string);
    procedure SetArq_CNAB_1(const Value: string);
    procedure SetArq_Tp_Inscricao_Empresa(const Value: string);
    procedure SetArq_N_Inscricao_Empresa(const Value: string);
    procedure SetArq_Cod_Convenio_Banco(const Value: string);
    procedure SetArq_Cod_Agencia_Mantenedora_Conta(const Value: string);
    procedure SetArq_Dig_Verificador_Agencia(const Value: string);
    procedure SetArq_N_Conta_Corrente(const Value: string);
    procedure SetArq_Dig_Verificador_Conta(const Value: string);
    procedure SetArq_Dig_Verificador_Ag_Conta(const Value: string);
    procedure SetArq_Nome_Empresa(const Value: string);
    procedure SetArq_Nome_Banco(const Value: string);
    procedure SetArq_CNAB_2(const Value: string);
    procedure SetArq_Cod_Remessa_Retorno(const Value: string);
    procedure SetArq_Data_Geracao(const Value: string);
    procedure SetArq_Hora_Geracao(const Value: string);
    procedure SetArq_N_Sequencial(const Value: string);
    procedure SetArq_N_Versao_Layout(const Value: string);
    procedure SetArq_Densidade(const Value: string);
    procedure SetArq_Reservado_Banco(const Value: string);
    procedure SetArq_Reservado_Empresa(const Value: string);
    procedure SetArq_CNAB_3(const Value: string);
    procedure SetTrailer_Arq_Banco(const Value: string);
    procedure SetTrailer_Arq_Lote(const Value: string);
    procedure SetTrailer_Arq_Registro(const Value: string);
    procedure SetTrailer_Arq_CNAB_1(const Value: string);
    procedure SetTrailer_Arq_Qtde_Lotes(const Value: string);
    procedure SetTrailer_Arq_Qtde_Registros(const Value: string);
    procedure SetTrailer_Arq_Qtde_Contas_Conci(const Value: string);
    procedure SetTrailer_Arq_CNAB_2(const Value: string);

   public

      //Header do Arquivo   tipo 0
      property Arq_Cod_Banco_Compensacao:         string read FArq_Cod_Banco_Compensacao      write SetArq_Cod_Banco_Compensacao;
      property Arq_Lote_Servico:                  string read FArq_Lote_Servico               write SetArq_Lote_Servico;
      property Arq_Tipo_Registro:                 string read FArq_Tipo_Registro              write SetArq_Tipo_Registro;
      property Arq_CNAB_1:                        string read FArq_CNAB_1                     write SetArq_CNAB_1;
      property Arq_Tp_Inscricao_Empresa:          string read FArq_Tp_Inscricao_Empresa       write SetArq_Tp_Inscricao_Empresa;
      property Arq_N_Inscricao_Empresa:           string read FArq_N_Inscricao_Empresa        write SetArq_N_Inscricao_Empresa;
      property Arq_Cod_Convenio_Banco:            string read FArq_Cod_Convenio_Banco         write SetArq_Cod_Convenio_Banco;
      property Arq_Cod_Agencia_Mantenedora_Conta: string read FArq_Cod_Agencia_Mantenedora_Conta write SetArq_Cod_Agencia_Mantenedora_Conta;
      property Arq_Dig_Verificador_Agencia:       string read FArq_Dig_Verificador_Agencia    write SetArq_Dig_Verificador_Agencia;
      property Arq_N_Conta_Corrente:              string read FArq_N_Conta_Corrente           write SetArq_N_Conta_Corrente;
      property Arq_Dig_Verificador_Conta:         string read FArq_Dig_Verificador_Conta      write SetArq_Dig_Verificador_Conta;
      property Arq_Dig_Verificador_Ag_Conta:      string read FArq_Dig_Verificador_Ag_Conta   write SetArq_Dig_Verificador_Ag_Conta;
      property Arq_Nome_Empresa:                  string read FArq_Nome_Empresa               write SetArq_Nome_Empresa;
      property Arq_Nome_Banco:                    string read FArq_Nome_Banco                 write SetArq_Nome_Banco;
      property Arq_CNAB_2:                        string read FArq_CNAB_2                     write SetArq_CNAB_2;
      property Arq_Cod_Remessa_Retorno:           string read FArq_Cod_Remessa_Retorno        write SetArq_Cod_Remessa_Retorno;
      property Arq_Data_Geracao:                  string read FArq_Data_Geracao               write SetArq_Data_Geracao;
      property Arq_Hora_Geracao:                  string read FArq_Hora_Geracao               write SetArq_Hora_Geracao;
      property Arq_N_Sequencial:                  string read FArq_N_Sequencial               write SetArq_N_Sequencial;
      property Arq_N_Versao_Layout:               string read FArq_N_Versao_Layout            write SetArq_N_Versao_Layout;
      property Arq_Densidade:                     string read FArq_Densidade                  write SetArq_Densidade;
      property Arq_Reservado_Banco:               string read FArq_Reservado_Banco            write SetArq_Reservado_Banco;
      property Arq_Reservado_Empresa:             string read FArq_Reservado_Empresa          write SetArq_Reservado_Empresa;
      property Arq_CNAB_3:                        string read FArq_CNAB_3                     write SetArq_CNAB_3;


      //Header do Lote   tipo 1
      property Cod_Banco_Compensacao:             string read FCod_Banco_Compensacao          write SetCod_Banco_Compensacao;
      property Lote_Servico:                      string read FLote_Servico                   write SetLote_Servico;
      property Tp_Registro:                       string read FTp_Registro                    write SetTp_Registro;
      property Tp_Operacao:                       string read FTp_Operacao                    write SetTp_Operacao;
      property Tp_Servico:                        string read FTp_Servico                     write SetTp_Servico;
      property Forma_Lançamento:                  string read FForma_Lançamento               write SetForma_Lançamento;
      property N_Versao_Layout_Lote:              string read FN_Versao_Layout_Lote           write SetN_Versao_Layout_Lote;
      property CNAB_1:                            string read FCNAB_1                         write SetCNAB_1;
      property Tp_Inscricao_Empresa:              string read FTp_Inscricao_Empresa           write SetTp_Inscricao_Empresa;
      property N_Inscricao_Empresa:               string read FN_Inscricao_Empresa            write SetN_Inscricao_Empresa;
      property Cod_Convenio_Banco:                string read FCod_Convenio_Banco             write SetCod_Convenio_Banco;
      property Cod_Agencia_Mantenedora_Conta:     string read FCod_Agencia_Mantenedora_Conta  write SetCod_Agencia_Mantenedora_Conta;
      property Dig_Verificador_Agencia:           string read FDig_Verificador_Agencia        write SetDig_Verificador_Agencia;
      property N_Conta_Corrente:                  string read FN_Conta_Corrente               write SetN_Conta_Corrente;
      property Dig_Verificador_Conta:             string read FDig_Verificador_Conta          write SetDig_Verificador_Conta;
      property Dig_Verificador_Ag_Conta:          string read FDig_Verificador_Ag_Conta       write SetDig_Verificador_Ag_Conta;
      property Nome_Empresa:                      string read FNome_Empresa                   write SetNome_Empresa;
      property Mensagem:                          string read FMensagem                       write SetMensagem;
      property Logradouro:                        string read FLogradouro                     write SetLogradouro;
      property Numero:                            string read FNumero                         write SetNumero;
      property Complemento:                       string read FComplemento                    write SetComplemento;
      property Cidade:                            string read FCidade                         write SetCidade;
      property CEP:                               string read FCEP                            write SetCEP;
      property Complemento_CEP:                   string read FComplemento_CEP                write SetComplemento_CEP;
      property Estado:                            string read FEstado                         write SetEstado;
      property Ind_Forma_Pagamento:               string read FInd_Forma_Pagamento            write SetInd_Forma_Pagamento;
      property CNAB_2:                            string read FCNAB_2                         write SetCNAB_2;
      property Codigos_Ocorrencias:               string read FCodigos_Ocorrencias            write SetCodigos_Ocorrencias;

      //Trailer de Lote   tipo 5
      property Banco:                             string read FBanco                          write SetBanco;
      property Lote:                              string read FLote                           write SetLote;
      property Registro:                          string read FRegistro                       write SetRegistro;
      property CNAB:                              string read FCNAB                           write SetCNAB;
      property Qtde_Registros :                   string read FQtde_Registros                 write SetQtde_Registros;
      property Valor:                             string read FValor                          write SetValor;
      property Qtde_Moeda:                        string read FQtde_Moeda                     write SetQtde_Moeda;
      property Numero_Aviso_Debito:               string read FNumero_Aviso_Debito            write SetNumero_Aviso_Debito;
      property CNAB_3:                            string read FCNAB_3                         write SetCNAB_3;
      property Ocorrencias:                       string read FOcorrencias                    write SetOcorrencias;

      //Trailer do Arquivo   tipo 9
      property Trailer_Arq_Banco:                 string read FTrailer_Arq_Banco              write SetTrailer_Arq_Banco;
      property Trailer_Arq_Lote:                  string read FTrailer_Arq_Lote               write SetTrailer_Arq_Lote;
      property Trailer_Arq_Registro:              string read FTrailer_Arq_Registro           write SetTrailer_Arq_Registro;
      property Trailer_Arq_CNAB_1:                string read FTrailer_Arq_CNAB_1             write SetTrailer_Arq_CNAB_1;
      property Trailer_Arq_Qtde_Lotes:            string read FTrailer_Arq_Qtde_Lotes         write SetTrailer_Arq_Qtde_Lotes;
      property Trailer_Arq_Qtde_Registros:        string read FTrailer_Arq_Qtde_Registros     write SetTrailer_Arq_Qtde_Registros;
      property Trailer_Arq_Qtde_Contas_Conci:     string read FTrailer_Arq_Qtde_Contas_Conci  write SetTrailer_Arq_Qtde_Contas_Conci;
      property Trailer_Arq_CNAB_2:                string read FTrailer_Arq_CNAB_2             write SetTrailer_Arq_CNAB_2;

      property Registros_Cabecalho_Detalhes :TRegistros_Cabecalho_Detalhes read FRegistros_Cabecalho_Detalhes write SetRegistros_Cabecalho_Detalhes;
      function GerarArquivo(caminho:string):Boolean;

      constructor Create;
      destructor Destroy; override;
   end;

implementation

{ TSicoob_Header_Emp240 }

constructor TSicoob_Header_Emp240.Create;
begin
   inherited;
   FRegistros_Cabecalho_Detalhes :=  TRegistros_Cabecalho_Detalhes.Create(TRegistro_Cabecalho_Detalhe_Item);
end;

destructor TSicoob_Header_Emp240.Destroy;
begin
   FRegistros_Cabecalho_Detalhes.Free;
   inherited;
end;

function TSicoob_Header_Emp240.GerarArquivo(caminho: string): Boolean;
var
   arq       : TextFile;
   val_campo : String;
   i         : integer;
begin
   try
      Result := false;

      if SetCurrentDir(caminho) then
      begin
         AssignFile(arq,'SICOOB - 240 - '+FNome_Empresa+' - '+FormatDateTime('ddmmyyyy',now)+'.txt');
         Rewrite(arq);

         val_campo :=              FArq_Cod_Banco_Compensacao;
         val_campo :=  val_campo + FArq_Lote_Servico;
         val_campo :=  val_campo + FArq_Tipo_Registro;
         val_campo :=  val_campo + FArq_CNAB_1;
         val_campo :=  val_campo + FArq_Tp_Inscricao_Empresa;
         val_campo :=  val_campo + FArq_N_Inscricao_Empresa;
         val_campo :=  val_campo + StringOfChar('0',20-length(FArq_Cod_Convenio_Banco)) + FArq_Cod_Convenio_Banco;
         val_campo :=  val_campo + StringOfChar('0',5-length(FArq_Cod_Agencia_Mantenedora_Conta)) + FArq_Cod_Agencia_Mantenedora_Conta;
         val_campo :=  val_campo + FArq_Dig_Verificador_Agencia + StringOfChar(' ',1-length(FArq_Dig_Verificador_Agencia));
         val_campo :=  val_campo + StringOfChar('0',12-length(FArq_N_Conta_Corrente)) + FArq_N_Conta_Corrente;
         val_campo :=  val_campo + StringOfChar('0',1-length(FArq_Dig_Verificador_Conta)) + FArq_Dig_Verificador_Conta;
         val_campo :=  val_campo + FArq_Dig_Verificador_Ag_Conta + StringOfChar(' ',1-length(FArq_Dig_Verificador_Ag_Conta));
         val_campo :=  val_campo + FArq_Nome_Empresa + StringOfChar(' ',30-length(FArq_Nome_Empresa));
         val_campo :=  val_campo + FArq_Nome_Banco + StringOfChar(' ',30-length(FArq_Nome_Banco));
         val_campo :=  val_campo + FArq_CNAB_2;
         val_campo :=  val_campo + FArq_Cod_Remessa_Retorno;
         val_campo :=  val_campo + FArq_Data_Geracao;
         val_campo :=  val_campo + FArq_Hora_Geracao;
         val_campo :=  val_campo + FArq_N_Sequencial;
         val_campo :=  val_campo + FArq_N_Versao_Layout;
         val_campo :=  val_campo + FArq_Densidade;
         val_campo :=  val_campo + FArq_Reservado_Banco;
         val_campo :=  val_campo + FArq_Reservado_Empresa;
         val_campo :=  val_campo + FArq_CNAB_3;

         Write(arq,val_campo);
         Writeln(Arq,'');

         val_campo :=              FCod_Banco_Compensacao;
         val_campo :=  val_campo + FLote_Servico;
         val_campo :=  val_campo + FTp_Registro;
         val_campo :=  val_campo + FTp_Operacao;
         val_campo :=  val_campo + FTp_Servico;
         val_campo :=  val_campo + FForma_Lançamento;
         val_campo :=  val_campo + FN_Versao_Layout_Lote;
         val_campo :=  val_campo + FCNAB_1;
         val_campo :=  val_campo + FTp_Inscricao_Empresa;
         val_campo :=  val_campo + FN_Inscricao_Empresa;
         val_campo :=  val_campo + StringOfChar('0',20-length(FCod_Convenio_Banco)) + FCod_Convenio_Banco;
         val_campo :=  val_campo + StringOfChar('0',5-length(FCod_Agencia_Mantenedora_Conta)) + FCod_Agencia_Mantenedora_Conta;
         val_campo :=  val_campo + FDig_Verificador_Agencia + StringOfChar(' ',1-length(FDig_Verificador_Agencia));
         val_campo :=  val_campo + StringOfChar('0',12-length(FN_Conta_Corrente)) + FN_Conta_Corrente;
         val_campo :=  val_campo + StringOfChar('0',1-length(FDig_Verificador_Conta)) + FDig_Verificador_Conta;
         val_campo :=  val_campo + FDig_Verificador_Ag_Conta + StringOfChar(' ',1-length(FDig_Verificador_Ag_Conta));
         val_campo :=  val_campo + FNome_Empresa + StringOfChar(' ',30-length(FNome_Empresa));
         val_campo :=  val_campo + FMensagem     + StringOfChar(' ',40-length(FMensagem));
         val_campo :=  val_campo + FLogradouro   + StringOfChar(' ',30-length(FLogradouro));
         val_campo :=  val_campo + FNumero       + StringOfChar(' ',5-length(FNumero));
         val_campo :=  val_campo + FComplemento  + StringOfChar(' ',15-length(FComplemento));
         val_campo :=  val_campo + FCidade       + StringOfChar(' ',20-length(FCidade));
         val_campo :=  val_campo + StringOfChar('0',5-length(FCEP)) + FCEP;
         val_campo :=  val_campo + FComplemento_CEP + StringOfChar(' ',3-length(FComplemento_CEP));
         val_campo :=  val_campo + FEstado;
         val_campo :=  val_campo + FInd_Forma_Pagamento;
         val_campo :=  val_campo + FCNAB_2;
         val_campo :=  val_campo + FCodigos_Ocorrencias + StringOfChar(' ',10-length(FCodigos_Ocorrencias));

         Write(arq,val_campo);
         Writeln(Arq,'');

         for I := 0 to Registros_Cabecalho_Detalhes.Count -1 do
         begin
            with Registros_Cabecalho_Detalhes.RegistroDetalhe[i] do
            begin
               val_campo :=              FSegmentoA_Cod_Banco_Compensacao;
               val_campo :=  val_campo + FSegmentoA_Lote_Servico;
               val_campo :=  val_campo + FSegmentoA_tp_Registro;
               val_campo :=  val_campo + FSegmentoA_N_Sequencial_Reg_Lote;
               val_campo :=  val_campo + FSegmentoA_Cod_Seg_Reg_Detalhe;
               val_campo :=  val_campo + FSegmentoA_Tp_Movimento;
               val_campo :=  val_campo + FSegmentoA_Cod_Instrucao_Movimento;
               val_campo :=  val_campo + FSegmentoA_Cod_Camara_Cent;
               val_campo :=  val_campo + FSegmentoA_Cod_Banco_Favorecido;
               val_campo :=  val_campo + StringOfChar('0',5-length(FSegmentoA_Cod_Agen_Mant_Cta_Favorecido)) + FSegmentoA_Cod_Agen_Mant_Cta_Favorecido;
               val_campo :=  val_campo + FSegmentoA_Dig_Verificador_Agencia + StringOfChar(' ',1-length(FSegmentoA_Dig_Verificador_Agencia));
               val_campo :=  val_campo + StringOfChar('0',12-length(FSegmentoA_N_Conta_Corrente)) + FSegmentoA_N_Conta_Corrente;
               val_campo :=  val_campo + StringOfChar('0',1-length(FSegmentoA_Dig_Verificador_Conta)) + FSegmentoA_Dig_Verificador_Conta;
               val_campo :=  val_campo + FSegmentoA_Dig_Verificador_AG_Conta + StringOfChar(' ',1-length(FSegmentoA_Dig_Verificador_AG_Conta));
               val_campo :=  val_campo + FSegmentoA_Nome_Favorecido + StringOfChar(' ',30-length(FSegmentoA_Nome_Favorecido));
               val_campo :=  val_campo + FSegmentoA_N_Docum_Empresa;
               val_campo :=  val_campo + FSegmentoA_Dt_Pagamento;
               val_campo :=  val_campo + FSegmentoA_Tp_Moeda;
               val_campo :=  val_campo + FSegmentoA_Qtde_Moeda;
               val_campo :=  val_campo + FSegmentoA_Vr_Pagamento;
               val_campo :=  val_campo + FSegmentoA_N_Doc_Atribuido_Banco;
               val_campo :=  val_campo + FSegmentoA_Dt_Real_Efetivacao_Pagto;
               val_campo :=  val_campo + FSegmentoA_Vr_Real_Efetivacao_Pagto;
               val_campo :=  val_campo + FSegmentoA_Informação;
               val_campo :=  val_campo + FSegmentoA_Cod_Finalidade_Doc;
               val_campo :=  val_campo + FSegmentoA_Cod_Finalidade_TED;
               val_campo :=  val_campo + FSegmentoA_Cod_Finalidade_Comp;
               val_campo :=  val_campo + FSegmentoA_CNAB;
               val_campo :=  val_campo + FSegmentoA_Aviso;
               val_campo :=  val_campo + FSegmentoA_Ocorrencias + StringOfChar(' ',10-length(FSegmentoA_Ocorrencias));

               Write(arq,val_campo);
               Writeln(Arq,'');

               val_campo :=              FSegmentoB_Cod_Banco_Compensacao;
               val_campo :=  val_campo + FSegmentoB_Lote_Servico;
               val_campo :=  val_campo + FSegmentoB_tp_Registro;
               val_campo :=  val_campo + FSegmentoB_N_Sequencial_Reg_Lote;
               val_campo :=  val_campo + FSegmentoB_Cod_Seg_Reg_Detalhe;
               val_campo :=  val_campo + FSegmentoB_CNAB;
               val_campo :=  val_campo + FSegmentoB_Tp_inscricao_Favorecido;
               val_campo :=  val_campo + StringOfChar('0',14-length(FSegmentoB_N_Inscricao_Favorecido)) + FSegmentoB_N_Inscricao_Favorecido;
               val_campo :=  val_campo + FSegmentoB_Logradouro + StringOfChar(' ',30-length(FSegmentoB_Logradouro));
               val_campo :=  val_campo + StringOfChar('0',5-length(FSegmentoB_Numero)) + FSegmentoB_Numero;
               val_campo :=  val_campo + FSegmentoB_Complemento + StringOfChar(' ',15-length(FSegmentoB_Complemento));
               val_campo :=  val_campo + FSegmentoB_Bairro +StringOfChar(' ',15-length(FSegmentoB_Bairro));
               val_campo :=  val_campo + FSegmentoB_Cidade + StringOfChar(' ',20-length(FSegmentoB_Cidade));
               val_campo :=  val_campo + StringOfChar('0',5-length(FSegmentoB_CEP)) + FSegmentoB_CEP;
               val_campo :=  val_campo + StringOfChar('0',3-length(FSegmentoB_Complem_CEP)) + FSegmentoB_Complem_CEP;
               val_campo :=  val_campo + FSegmentoB_Estado;
               val_campo :=  val_campo + FSegmentoB_Vencimento;
               val_campo :=  val_campo + FSegmentoB_Vr_Doc;
               val_campo :=  val_campo + FSegmentoB_Abatimento;
               val_campo :=  val_campo + FSegmentoB_Desconto;
               val_campo :=  val_campo + FSegmentoB_Mora;
               val_campo :=  val_campo + FSegmentoB_Multa;
               val_campo :=  val_campo + FSegmentoB_Cod_Doc_Favorecido + StringOfChar(' ',15-length(FSegmentoB_Cod_Doc_Favorecido));
               val_campo :=  val_campo + FSegmentoB_Aviso_Favorecido;
               val_campo :=  val_campo + FSegmentoB_Cod_UG_Cent;
               val_campo :=  val_campo + FSegmentoB_CNAB_1;

               Write(arq,val_campo);
               Writeln(Arq,'');
            end;
         end;

         val_campo :=              FBanco;
         val_campo :=  val_campo + FLote;
         val_campo :=  val_campo + FRegistro;
         val_campo :=  val_campo + FCNAB;
         val_campo :=  val_campo + FQtde_Registros;
         val_campo :=  val_campo + FValor;
         val_campo :=  val_campo + FQtde_Moeda;
         val_campo :=  val_campo + FNumero_Aviso_Debito;
         val_campo :=  val_campo + FCNAB_3;
         val_campo :=  val_campo + FOcorrencias + StringOfChar(' ',10-length(FOcorrencias));

         Write(arq,val_campo);
         Writeln(Arq,'');

         val_campo :=              FTrailer_Arq_Banco;
         val_campo :=  val_campo + FTrailer_Arq_Lote;
         val_campo :=  val_campo + FTrailer_Arq_Registro;
         val_campo :=  val_campo + FTrailer_Arq_CNAB_1;
         val_campo :=  val_campo + FTrailer_Arq_Qtde_Lotes;
         val_campo :=  val_campo + FTrailer_Arq_Qtde_Registros;
         val_campo :=  val_campo + FTrailer_Arq_Qtde_Contas_Conci;
         val_campo :=  val_campo + FTrailer_Arq_CNAB_2;

         Write(arq,val_campo);
      end;
   finally
      Writeln(Arq,'');
      CloseFile(arq);
      Result := True;
   end;

end;

procedure TSicoob_Header_Emp240.SetArq_CNAB_1(const Value: string);
begin
  FArq_CNAB_1 := Value;
end;

procedure TSicoob_Header_Emp240.SetArq_CNAB_2(const Value: string);
begin
  FArq_CNAB_2 := Value;
end;

procedure TSicoob_Header_Emp240.SetArq_CNAB_3(const Value: string);
begin
  FArq_CNAB_3 := Value;
end;

procedure TSicoob_Header_Emp240.SetArq_Cod_Agencia_Mantenedora_Conta(
  const Value: string);
begin
  FArq_Cod_Agencia_Mantenedora_Conta := Value;
end;

procedure TSicoob_Header_Emp240.SetArq_Cod_Banco_Compensacao(
  const Value: string);
begin
  FArq_Cod_Banco_Compensacao := Value;
end;

procedure TSicoob_Header_Emp240.SetArq_Cod_Convenio_Banco(const Value: string);
begin
  FArq_Cod_Convenio_Banco := Value;
end;

procedure TSicoob_Header_Emp240.SetArq_Cod_Remessa_Retorno(const Value: string);
begin
  FArq_Cod_Remessa_Retorno := Value;
end;

procedure TSicoob_Header_Emp240.SetArq_Data_Geracao(const Value: string);
begin
  FArq_Data_Geracao := Value;
end;

procedure TSicoob_Header_Emp240.SetArq_Densidade(const Value: string);
begin
  FArq_Densidade := Value;
end;

procedure TSicoob_Header_Emp240.SetArq_Dig_Verificador_Agencia(
  const Value: string);
begin
  FArq_Dig_Verificador_Agencia := Value;
end;

procedure TSicoob_Header_Emp240.SetArq_Dig_Verificador_Ag_Conta(
  const Value: string);
begin
  FArq_Dig_Verificador_Ag_Conta := Value;
end;

procedure TSicoob_Header_Emp240.SetArq_Dig_Verificador_Conta(
  const Value: string);
begin
  FArq_Dig_Verificador_Conta := Value;
end;

procedure TSicoob_Header_Emp240.SetArq_Hora_Geracao(const Value: string);
begin
  FArq_Hora_Geracao := Value;
end;

procedure TSicoob_Header_Emp240.SetArq_Lote_Servico(const Value: string);
begin
  FArq_Lote_Servico := Value;
end;

procedure TSicoob_Header_Emp240.SetArq_Nome_Banco(const Value: string);
begin
  FArq_Nome_Banco := Value;
end;

procedure TSicoob_Header_Emp240.SetArq_Nome_Empresa(const Value: string);
begin
  FArq_Nome_Empresa := Copy(Value,1,30);
end;

procedure TSicoob_Header_Emp240.SetArq_N_Conta_Corrente(const Value: string);
begin
  FArq_N_Conta_Corrente := Value;
end;

procedure TSicoob_Header_Emp240.SetArq_N_Inscricao_Empresa(const Value: string);
begin
  FArq_N_Inscricao_Empresa := Value;
end;

procedure TSicoob_Header_Emp240.SetArq_N_Sequencial(const Value: string);
begin
  FArq_N_Sequencial := Value;
end;

procedure TSicoob_Header_Emp240.SetArq_N_Versao_Layout(const Value: string);
begin
  FArq_N_Versao_Layout := Value;
end;

procedure TSicoob_Header_Emp240.SetArq_Reservado_Banco(const Value: string);
begin
  FArq_Reservado_Banco := Value;
end;

procedure TSicoob_Header_Emp240.SetArq_Reservado_Empresa(const Value: string);
begin
  FArq_Reservado_Empresa := Value;
end;

procedure TSicoob_Header_Emp240.SetArq_Tipo_Registro(const Value: string);
begin
  FArq_Tipo_Registro := Value;
end;

procedure TSicoob_Header_Emp240.SetArq_Tp_Inscricao_Empresa(
  const Value: string);
begin
  FArq_Tp_Inscricao_Empresa := Value;
end;

procedure TSicoob_Header_Emp240.SetBanco(const Value: string);
begin
  FBanco := Value;
end;

procedure TSicoob_Header_Emp240.SetCEP(const Value: string);
begin
  FCEP := Value;
end;

procedure TSicoob_Header_Emp240.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TSicoob_Header_Emp240.SetCNAB(const Value: string);
begin
  FCNAB := Value;
end;

procedure TSicoob_Header_Emp240.SetCNAB_1(const Value: string);
begin
  FCNAB_1 := Value;
end;

procedure TSicoob_Header_Emp240.SetCNAB_2(const Value: string);
begin
  FCNAB_2 := Value;
end;

procedure TSicoob_Header_Emp240.SetCNAB_3(const Value: string);
begin
  FCNAB_3 := Value;
end;

procedure TSicoob_Header_Emp240.SetCodigos_Ocorrencias(const Value: string);
begin
  FCodigos_Ocorrencias := Value;
end;

procedure TSicoob_Header_Emp240.SetCod_Agencia_Mantenedora_Conta(
  const Value: string);
begin
  FCod_Agencia_Mantenedora_Conta := Value;
end;

procedure TSicoob_Header_Emp240.SetCod_Banco_Compensacao(const Value: string);
begin
  FCod_Banco_Compensacao := Value;
end;

procedure TSicoob_Header_Emp240.SetCod_Convenio_Banco(const Value: string);
begin
  FCod_Convenio_Banco := Value;
end;

procedure TSicoob_Header_Emp240.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TSicoob_Header_Emp240.SetComplemento_CEP(const Value: string);
begin
  FComplemento_CEP := Value;
end;

procedure TSicoob_Header_Emp240.SetDig_Verificador_Agencia(const Value: string);
begin
  FDig_Verificador_Agencia := Value;
end;

procedure TSicoob_Header_Emp240.SetDig_Verificador_Ag_Conta(
  const Value: string);
begin
  FDig_Verificador_Ag_Conta := Value;
end;

procedure TSicoob_Header_Emp240.SetDig_Verificador_Conta(const Value: string);
begin
  FDig_Verificador_Conta := Value;
end;

procedure TSicoob_Header_Emp240.SetEstado(const Value: string);
begin
  FEstado := Value;
end;

procedure TSicoob_Header_Emp240.SetForma_Lançamento(const Value: string);
begin
  FForma_Lançamento := Value;
end;

procedure TSicoob_Header_Emp240.SetInd_Forma_Pagamento(const Value: string);
begin
  FInd_Forma_Pagamento := Value;
end;

procedure TSicoob_Header_Emp240.SetLogradouro(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TSicoob_Header_Emp240.SetLote(const Value: string);
begin
  FLote := Value;
end;

procedure TSicoob_Header_Emp240.SetLote_Servico(const Value: string);
begin
  FLote_Servico := Value;
end;

procedure TSicoob_Header_Emp240.SetMensagem(const Value: string);
begin
  FMensagem := Value;
end;

procedure TSicoob_Header_Emp240.SetNome_Empresa(const Value: string);
begin
  FNome_Empresa := Copy(Value,1,30);
end;

procedure TSicoob_Header_Emp240.SetNumero(const Value: string);
begin
  FNumero := Value;
end;

procedure TSicoob_Header_Emp240.SetNumero_Aviso_Debito(const Value: string);
begin
  FNumero_Aviso_Debito := Value;
end;

procedure TSicoob_Header_Emp240.SetN_Conta_Corrente(const Value: string);
begin
  FN_Conta_Corrente := Value;
end;

procedure TSicoob_Header_Emp240.SetN_Inscricao_Empresa(const Value: string);
begin
  FN_Inscricao_Empresa := Value;
end;

procedure TSicoob_Header_Emp240.SetN_Versao_Layout_Lote(const Value: string);
begin
  FN_Versao_Layout_Lote := Value;
end;

procedure TSicoob_Header_Emp240.SetOcorrencias(const Value: string);
begin
  FOcorrencias := Value;
end;

procedure TSicoob_Header_Emp240.SetQtde_Moeda(const Value: string);
begin
  FQtde_Moeda := Value;
end;

procedure TSicoob_Header_Emp240.SetQtde_Registros(const Value: string);
begin
  FQtde_Registros := Value;
end;

procedure TSicoob_Header_Emp240.SetRegistro(const Value: string);
begin
  FRegistro := Value;
end;

procedure TSicoob_Header_Emp240.SetRegistros_Cabecalho_Detalhes(
  const Value: TRegistros_Cabecalho_Detalhes);
begin
  FRegistros_Cabecalho_Detalhes := Value;
end;

procedure TSicoob_Header_Emp240.SetTp_Inscricao_Empresa(const Value: string);
begin
  FTp_Inscricao_Empresa := Value;
end;

procedure TSicoob_Header_Emp240.SetTp_Operacao(const Value: string);
begin
  FTp_Operacao := Value;
end;

procedure TSicoob_Header_Emp240.SetTp_Registro(const Value: string);
begin
  FTp_Registro := Value;
end;

procedure TSicoob_Header_Emp240.SetTp_Servico(const Value: string);
begin
  FTp_Servico := Value;
end;

procedure TSicoob_Header_Emp240.SetTrailer_Arq_Banco(const Value: string);
begin
  FTrailer_Arq_Banco := Value;
end;

procedure TSicoob_Header_Emp240.SetTrailer_Arq_CNAB_1(const Value: string);
begin
  FTrailer_Arq_CNAB_1 := Value;
end;

procedure TSicoob_Header_Emp240.SetTrailer_Arq_CNAB_2(const Value: string);
begin
  FTrailer_Arq_CNAB_2 := Value;
end;

procedure TSicoob_Header_Emp240.SetTrailer_Arq_Lote(const Value: string);
begin
  FTrailer_Arq_Lote := Value;
end;

procedure TSicoob_Header_Emp240.SetTrailer_Arq_Qtde_Contas_Conci(
  const Value: string);
begin
  FTrailer_Arq_Qtde_Contas_Conci := Value;
end;

procedure TSicoob_Header_Emp240.SetTrailer_Arq_Qtde_Lotes(const Value: string);
begin
  FTrailer_Arq_Qtde_Lotes := Value;
end;

procedure TSicoob_Header_Emp240.SetTrailer_Arq_Qtde_Registros(
  const Value: string);
begin
  FTrailer_Arq_Qtde_Registros := Value;
end;

procedure TSicoob_Header_Emp240.SetTrailer_Arq_Registro(const Value: string);
begin
  FTrailer_Arq_Registro := Value;
end;

procedure TSicoob_Header_Emp240.SetValor(const Value: string);
begin
  FValor := Value;
end;

{ TRegistros_Cabecalho_Detalhes }

function TRegistros_Cabecalho_Detalhes.Add: TRegistro_Cabecalho_Detalhe_Item;
begin
   result := (inherited Add) as TRegistro_Cabecalho_Detalhe_Item;
end;

function TRegistros_Cabecalho_Detalhes.GetRegistroDetalhes(
  Index: Integer): TRegistro_Cabecalho_Detalhe_Item;
begin
   Result := TRegistro_Cabecalho_Detalhe_Item(inherited GetItem(Index));
end;

procedure TRegistros_Cabecalho_Detalhes.SetRegistroDetalhes(Index: Integer;
  const Value: TRegistro_Cabecalho_Detalhe_Item);
begin
   inherited SetItem(Index, Value);
end;

{ TRegistro_Cabecalho_Detalhe_Item }

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Aviso(
  const Value: string);
begin
  FSegmentoA_Aviso := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_CNAB(
  const Value: string);
begin
  FSegmentoA_CNAB := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Cod_Agen_Mant_Cta_Favorecido(
  const Value: string);
begin
  FSegmentoA_Cod_Agen_Mant_Cta_Favorecido := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Cod_Banco_Compensacao(
  const Value: string);
begin
  FSegmentoA_Cod_Banco_Compensacao := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Cod_Banco_Favorecido(
  const Value: string);
begin
  FSegmentoA_Cod_Banco_Favorecido := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Cod_Camara_Cent(
  const Value: string);
begin
  FSegmentoA_Cod_Camara_Cent := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Cod_Finalidade_Comp(
  const Value: string);
begin
  FSegmentoA_Cod_Finalidade_Comp := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Cod_Finalidade_Doc(
  const Value: string);
begin
  FSegmentoA_Cod_Finalidade_Doc := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Cod_Finalidade_TED(
  const Value: string);
begin
  FSegmentoA_Cod_Finalidade_TED := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Cod_Instrucao_Movimento(
  const Value: string);
begin
  FSegmentoA_Cod_Instrucao_Movimento := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Cod_Seg_Reg_Detalhe(
  const Value: string);
begin
  FSegmentoA_Cod_Seg_Reg_Detalhe := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Dig_Verificador_Agencia(
  const Value: string);
begin
  FSegmentoA_Dig_Verificador_Agencia := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Dig_Verificador_AG_Conta(
  const Value: string);
begin
  FSegmentoA_Dig_Verificador_AG_Conta := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Dig_Verificador_Conta(
  const Value: string);
begin
  FSegmentoA_Dig_Verificador_Conta := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Dt_Pagamento(
  const Value: string);
begin
  FSegmentoA_Dt_Pagamento := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Dt_Real_Efetivacao_Pagto(
  const Value: string);
begin
  FSegmentoA_Dt_Real_Efetivacao_Pagto := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Informação(
  const Value: string);
begin
  FSegmentoA_Informação := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Lote_Servico(
  const Value: string);
begin
  FSegmentoA_Lote_Servico := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Nome_Favorecido(
  const Value: string);
begin
  FSegmentoA_Nome_Favorecido := Copy(Value,1,30);
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_N_Conta_Corrente(
  const Value: string);
begin
  FSegmentoA_N_Conta_Corrente := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_N_Docum_Empresa(
  const Value: string);
begin
  FSegmentoA_N_Docum_Empresa := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_N_Doc_Atribuido_Banco(
  const Value: string);
begin
  FSegmentoA_N_Doc_Atribuido_Banco := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_N_Sequencial_Reg_Lote(
  const Value: string);
begin
  FSegmentoA_N_Sequencial_Reg_Lote := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Ocorrencias(
  const Value: string);
begin
  FSegmentoA_Ocorrencias := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Qtde_Moeda(
  const Value: string);
begin
  FSegmentoA_Qtde_Moeda := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Tp_Moeda(
  const Value: string);
begin
  FSegmentoA_Tp_Moeda := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Tp_Movimento(
  const Value: string);
begin
  FSegmentoA_Tp_Movimento := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_tp_Registro(
  const Value: string);
begin
  FSegmentoA_tp_Registro := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Vr_Pagamento(
  const Value: string);
begin
  FSegmentoA_Vr_Pagamento := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoA_Vr_Real_Efetivacao_Pagto(
  const Value: string);
begin
  FSegmentoA_Vr_Real_Efetivacao_Pagto := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_Abatimento(
  const Value: string);
begin
  FSegmentoB_Abatimento := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_Aviso_Favorecido(
  const Value: string);
begin
  FSegmentoB_Aviso_Favorecido := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_Bairro(
  const Value: string);
begin
  FSegmentoB_Bairro := Copy(Value,1,15);
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_CEP(
  const Value: string);
begin
  FSegmentoB_CEP := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_Cidade(
  const Value: string);
begin
  FSegmentoB_Cidade := Copy(Value,1,20);
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_CNAB(
  const Value: string);
begin
  FSegmentoB_CNAB := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_CNAB_1(
  const Value: string);
begin
  FSegmentoB_CNAB_1 := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_Cod_Banco_Compensacao(
  const Value: string);
begin
  FSegmentoB_Cod_Banco_Compensacao := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_Cod_Doc_Favorecido(
  const Value: string);
begin
  FSegmentoB_Cod_Doc_Favorecido := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_Cod_Seg_Reg_Detalhe(
  const Value: string);
begin
  FSegmentoB_Cod_Seg_Reg_Detalhe := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_Cod_UG_Cent(
  const Value: string);
begin
  FSegmentoB_Cod_UG_Cent := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_Complemento(
  const Value: string);
begin
  FSegmentoB_Complemento := Copy(Value,1,15);
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_Complem_CEP(
  const Value: string);
begin
  FSegmentoB_Complem_CEP := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_Desconto(
  const Value: string);
begin
  FSegmentoB_Desconto := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_Estado(
  const Value: string);
begin
  FSegmentoB_Estado := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_Logradouro(
  const Value: string);
begin
  FSegmentoB_Logradouro := Copy(Value,1,30);
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_Lote_Servico(
  const Value: string);
begin
  FSegmentoB_Lote_Servico := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_Mora(
  const Value: string);
begin
  FSegmentoB_Mora := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_Multa(
  const Value: string);
begin
  FSegmentoB_Multa := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_Numero(
  const Value: string);
begin
  FSegmentoB_Numero := Copy(Value,1,5);
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_N_Inscricao_Favorecido(
  const Value: string);
begin
  FSegmentoB_N_Inscricao_Favorecido := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_N_Sequencial_Reg_Lote(
  const Value: string);
begin
  FSegmentoB_N_Sequencial_Reg_Lote := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_Tp_inscricao_Favorecido(
  const Value: string);
begin
  FSegmentoB_Tp_inscricao_Favorecido := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_tp_Registro(
  const Value: string);
begin
  FSegmentoB_tp_Registro := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_Vencimento(
  const Value: string);
begin
  FSegmentoB_Vencimento := Value;
end;

procedure TRegistro_Cabecalho_Detalhe_Item.SetSegmentoB_Vr_Doc(
  const Value: string);
begin
  FSegmentoB_Vr_Doc := Value;
end;

end.
