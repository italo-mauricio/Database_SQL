                         Funções SQL

            ● Recurso avançado do SQL, serve para:
            – Executar cálculos usando dados
            – Modificar itens de dados individuais
            – Manipular saída para grupos de linha
            – Formatar datas e números para exibição
            – Converter tipos de dados de colunas

            ● Funções não são padronizadas pelo SQL.
            – Cada Versão/Produto de SGBD tem as suas
            ORACLE <> PostgreSQL <> JavaDB <> MySQL <> SQL Server <> ...

            ● http://developers.sun.com/docs/javadb/10.4.1.3/ref/ref-single.html
            ● http://www.postgresql.org/docs/9.3/interactive/index.html
            ● http://dev.mysql.com/doc/refman/5.0/en/functions.html
            ● http://www.oracle.com/technology/documentation/index.html


- Dois tipos de funções SQL 

1 - Funções de uma única linha: são funções que operam linha a linha 

2 - Funções de grupo: são funções que recebem várias entradas e devolvem um único resultado 

                    Onde é possível usar
    
    ● As funções de um modo geral podem ser utilizadas
    – Na projeção e na seleção do comando Select
        
        SELECT funcao2(coluna1) AS APELIDO
        FROM tabela
        WHERE funcao3(coluna2) = valor1;

    – Nas restrições dos comandos Update e ou Delete

        UPDATE tabela
        SET coluna4=valor1
        WHERE funcao6(coluna3)=valor2;
    
    – Nos novos valores do comando Update e Insert

        INSERT INTO tabela (coluna1,coluna2)
        VALUES (1,funcao7(valor));
        UPDATE tabela
        SET coluna4=funcao8(valor);

    
            Funções Mais Comuns

    
    ● Os SGBDs normalmente disponibilizam funções para
        
        Caracteres:

            – Colocar em maiúsculo/minúsculo, pedaço da string, tamanho, etc

        Numéricas:

            – Arredondamento, trigonometria, etc

        Datas:

            – Operações de extração e manipulação de datas/hora

        Conversão:

            – Converter de um tipo de dado em outro
        
        Gerais:

            – Funções diversas

        


                                        Função DATE no SQL


No SQL, existem várias funções para trabalhar com datas, incluindo a função GETDATE() que retorna a data e hora atuais do sistema, a função DATEPART() que extrai uma parte específica de uma data e a função DATEADD() que adiciona uma quantidade especificada de tempo a uma data.

A função de data completa, conhecida como CONVERT(), é usada para converter um valor de data ou hora em um formato específico. Ela pode ser usada para exibir a data no formato que você deseja ou para converter uma data de um tipo de dados para outro.

A sintaxe básica da função CONVERT() é a seguinte:

CONVERT(data_type, expression, [style])
"data_type" é o tipo de dados no qual você deseja converter a expressão
"expression" é a expressão que você deseja converter
"style" é o estilo de formato de data que você deseja usar (opcional)
Por exemplo, se você quiser converter a data atual em um formato de data completo que inclua dia, mês, ano e hora, poderá usar a seguinte expressão:


SELECT CONVERT(VARCHAR(25), GETDATE(), 120)
Neste exemplo, a função GETDATE() é usada para obter a data e hora atuais e a função CONVERT() é usada para convertê-la em uma string de caracteres VARCHAR(25) no formato 120, que representa a data e hora completa no formato "aaaa-mm-dd hh:mi:ss".

Note que o parâmetro "style" é opcional e você pode omiti-lo se desejar usar o formato padrão para o tipo de dados que você está convertendo. Além disso, existem vários estilos de formato de data disponíveis na função CONVERT(), que você pode usar para exibir a data no formato desejado.


                                 Funções de Conversão


No SQL, as funções de conversão são usadas para converter valores de um tipo de dados para outro tipo de dados. As funções de conversão podem ser úteis para alterar o tipo de dados de uma coluna em uma tabela ou para converter valores inseridos pelo usuário em um formato diferente para o formato necessário para armazenamento em um banco de dados.

As funções de conversão mais comuns no SQL incluem:

CAST() - Essa função é usada para converter um valor de um tipo de dados para outro tipo de dados. Por exemplo, se você tiver uma coluna que contém valores numéricos armazenados como texto, poderá usar a função CAST() para converter esses valores em valores numéricos.

    Exemplo do uso do Cast():

        SELECT AVG(CAST(preco AS NUMERIC(10,2))) AS media_precos FROM produtos

        Neste exemplo, a função CAST() é usada para converter a coluna "preco" em um tipo de dados numérico, com uma precisão de até 10 dígitos e 2 casas decimais. Em seguida, a função AVG() é usada para calcular a média dos preços convertidos. A média é atribuída a um alias chamado "media_precos".

        Note que, sem a conversão realizada pela função CAST(), a função AVG() não seria capaz de calcular a média dos preços armazenados como strings. A conversão é necessária para permitir a realização de cálculos numéricos sobre os valores armazenados na coluna "preco".

CONVERT() - Essa função é semelhante à função CAST(), mas oferece mais opções para formatar o resultado da conversão. A função CONVERT() pode ser usada para converter valores de um tipo de dados em outro tipo de dados, bem como para formatar valores de data e hora.

        Exemplo do uso do convert():

            SELECT *
            FROM pedidos
            WHERE CONVERT(DATE, data_pedido, 103) BETWEEN '2022-04-01' AND '2022-04-30';

            Neste exemplo, a função CONVERT() é usada para converter a coluna "data_pedido" para o tipo de dados DATE, que pode ser comparado diretamente com outras datas. O segundo argumento da função CONVERT() indica o nome da coluna que deve ser convertida, enquanto o terceiro argumento indica o código de formato 103, que indica que as datas são fornecidas no formato "dd/mm/aaaa".

            Em seguida, a cláusula WHERE é usada para filtrar apenas os registros que têm uma data de pedido entre o primeiro e o último dia do mês de abril de 2022, que foram convertidos para o formato DATE antes de realizar a comparação.

            Note que, sem a conversão realizada pela função CONVERT(), não seria possível comparar as datas armazenadas na coluna "data_pedido" com outras datas, pois elas estão armazenadas em um formato de string. A conversão é necessária para permitir a comparação de datas com precisão.


PARSE() - Essa função é usada para converter uma string em um valor de um tipo de dados específico. A função PARSE() é útil para converter valores inseridos pelo usuário em um formato diferente para o formato necessário para armazenamento em um banco de dados.

        Exemplo do uso do parse():

            SELECT PARSENAME(REPLACE(endereco,',','.'), 4) AS rua,
            PARSENAME(REPLACE(endereco,',','.'), 3) AS cidade,
            PARSENAME(REPLACE(endereco,',','.'), 2) AS estado,
            PARSENAME(REPLACE(endereco,',','.'), 1) AS cep
            FROM clientes;

            Neste exemplo, a função REPLACE() é usada para substituir as vírgulas na coluna "endereco" por pontos, pois a função PARSENAME() usa pontos como separadores padrão para obter informações de uma string. A função PARSENAME() é usada para separar as informações de endereço em quatro colunas diferentes, usando o ponto como separador. Cada chamada da função PARSENAME() tem dois argumentos: o primeiro é a string de origem (a coluna "endereco") e o segundo é um número inteiro que indica qual elemento da string deve ser retornado.


TRY_CONVERT() - Essa função é semelhante à função CONVERT(), mas retorna um valor nulo se a conversão falhar em vez de gerar um erro. A função TRY_CONVERT() é útil quando você deseja converter valores que podem ou não estar no formato correto.

            Exemplo do uso do try convert:

                SELECT *
                FROM funcionarios
                WHERE TRY_CONVERT(INT, idade) > 30;

            Neste exemplo, a função TRY_CONVERT() é usada para tentar converter a coluna "idade" em um tipo de dados INT, que representa valores inteiros. Se a conversão for bem sucedida, a função retorna o valor convertido. Caso contrário, a função retorna NULL. A cláusula WHERE é usada para filtrar apenas os registros cujas idades são maiores que 30, utilizando o valor convertido pela função TRY_CONVERT(), quando possível.

            Note que, ao utilizar a função TRY_CONVERT(), é possível lidar com situações em que alguns valores armazenados em uma coluna não possam ser convertidos em um determinado tipo de dados. Dessa forma, evita-se que erros ocorram durante a execução da consulta.


TRY_CAST() - Essa função é semelhante à função CAST(), mas retorna um valor nulo se a conversão falhar em vez de gerar um erro. A função TRY_CAST() é útil quando você deseja converter valores que podem ou não estar no formato correto.

        Exemplo do uso do try cast:

            SELECT AVG(TRY_CAST(preco AS DECIMAL(10,2))) AS media_precos
            FROM produtos;

        Neste exemplo, a função TRY_CAST() é usada para tentar converter a coluna "preco" em um tipo de dados DECIMAL(10,2), que representa valores numéricos com até 10 dígitos, sendo 2 deles após a vírgula. Se a conversão for bem sucedida, a função retorna o valor convertido. Caso contrário, a função retorna NULL. A função AVG() é usada para calcular a média dos valores convertidos e a média é atribuída a um alias chamado "media_precos".

        Note que, ao utilizar a função TRY_CAST(), é possível lidar com situações em que alguns valores armazenados em uma coluna não possam ser convertidos em um determinado tipo de dados. Dessa forma, evita-se que erros ocorram durante a execução da consulta. Além disso, ao utilizar a função AVG(), podemos realizar cálculos sobre os valores convertidos.


É importante lembrar que nem todas as conversões são possíveis ou permitidas no SQL, dependendo do tipo de dados envolvido e das regras de integridade do banco de dados. Portanto, é importante entender as limitações e possibilidades de cada função de conversão antes de usá-la em seu código SQL.



                        Funções de condições na projeção

COALESCE
    A função COALESCE é utilizada para retornar o primeiro valor não nulo em uma lista de valores. Por exemplo, considere a tabela "clientes" com as colunas "nome", "apelido" e "sobrenome":

Exemplo:

                            | nome      | apelido   | sobrenome |
                            |-----------|-----------|-----------|
                            | Ana       | NULL      | Silva     |
                            | NULL      | Carlos    | Souza     |
                            | João      | Santos    | Pereira   |
                            | Maria     | Oliveira | NULL       |
                        
            Podemos usar a função COALESCE para retornar o nome completo de cada cliente, dando prioridade para o apelido, caso exista:

            SELECT COALESCE(apelido, nome, '') || ' ' || COALESCE(sobrenome, '') AS nome_completo
            FROM clientes;

Este código irá retornar:

                            | nome_completo         |
                            |-----------------------|
                            | Ana Silva             |
                            | Carlos Souza          |
                            | João Santos Pereira   |
                            | Maria Oliveira        |

Observe que a função COALESCE retorna o primeiro valor não nulo da lista de valores, então se o apelido de um cliente for nulo, ela retorna o nome em seguida e, por fim, uma string vazia.



CASE WHEN

A função CASE WHEN é utilizada para avaliar uma ou mais expressões condicionais e retornar um valor correspondente quando a condição é verdadeira. Por exemplo, considere a tabela "pedidos" com as colunas "id_pedido", "data_pedido" e "valor":


                        | id_pedido | data_pedido  | valor |
                        |-----------|--------------|--------|
                        | 1         | 2022-01-01   | 100.00 |
                        | 2         | 2022-02-15   | 50.00  |
                        | 3         | 2022-03-05   | 200.00 |
                        | 4         | 2022-04-10   | 75.00  |
Podemos usar a função CASE WHEN para classificar os pedidos em "recentes" ou "antigos", com base na data do pedido:



                        SELECT id_pedido, data_pedido, valor,
                        CASE WHEN data_pedido >= '2022-03-01' THEN 'Recente'
                            ELSE 'Antigo'
                        END AS classificacao
                        FROM pedidos;

Este código irá retornar:

| id_pedido | data_pedido  | valor | classificacao |
|-----------|--------------|--------|------------------|
| 1         | 2022-01-01   | 100.00 | Antigo           |

       
Neste exemplo, a expressão "CASE WHEN" avalia a condição "preco > 100". Se essa condição for verdadeira, a expressão retornará "caro", caso contrário, ela retornará "barato". O resultado final será uma tabela que inclui o nome do produto, o preço e a classificação (caro ou barato) de cada produto.

A cláusula "CASE WHEN" também pode ser usada com várias condições, utilizando várias instruções "WHEN" seguidas por uma instrução "ELSE". Além disso, a cláusula pode ser aninhada dentro de outras cláusulas "CASE WHEN" para permitir uma maior flexibilidade na construção de consultas SQL.


                Funções de grupo mais comuns 

● AVG(coluna) – valor médio
● COUNT(*)
● MAX(coluna) – valor máximo
● MIN(coluna) – valor mínimo
● STDDEV(coluna) – desvio padrão
● SUM(coluna) – soma de todos os valores
● VARIANCE(coluna) – variação da coluna


                     Valores Nulos nas Funções de Grupo


● As funções de Grupo descartam valores nulos (null).

                    SELECT COUNT(*)
                    FROM aluno;

                    SELECT COUNT(telefone)
                    FROM aluno;



                        Cuidado


● Não é possível solicitar na projeção da mesma consulta
informações de várias linhas misturadas com funções de
Grupo:

            SELECT matricula,nome,idade,MAX(idade)    X isso aqui é errado
            ROM aluno;

● Mas é permitido utilizar na projeção diversas funções de
grupo e funções de linha sobre funções de grupo.

            SELECT MAX(idade),MIN(idade),ROUND(AVG(idade))
            FROM aluno;


                            GROUP BY

        Usando GROUP BY dividimos as linhas retornadas na
        consulta/tabela em grupos menores ou subgrupos.
        
        ● Podemos utilizar as Funções de Grupo para retornar
        informações sumárias para cada subgrupo.

        ● É possível agrupar os resultados em vários subgrupos.
        
        ● Na tabela abaixo, queremos obter os maiores salários, por cargo dentro de cada departamento.

        Exemplo: 
                SELECT cargo,coddepartamento,MAX(salario)
                FROM funcionario
                GROUP BY coddepartamento,cargo
                ORDER BY 2;

        output:
                cargo         coddepartamento      max 

                gerente         10                4000
                supervisor      10                3400
                gerente         20                4500
                supervisor      20                1500


        
        ● SELECT [DISTINCT] {*,coluna, expr [as apelido]}
          FROM nomeTabela
          [WHERE condição(ções)]
          [GROUP BY {coluna, expr, ...}]
          [ORDER BY {coluna, expr, ...} [ASC|DESC]];


          Como obter a maior idade dos aluno agrupado por cidade?


                SELECT MAX(idade),cidade
                FROM aluno
                GROUP BY cidade;


            SELECT MAX(idade),upper(cidade)
            FROM aluno
            GROUP BY upper(cidade);

Internamente o SGBD

● agrupa primeiro
● aplica as funções de grupo
● entrega o resultado;



                            Cuidado

    ● Qualquer coluna ou expressão na lista SELECT que não seja
    uma função de grupo deve estar na cláusula GROUP BY.

        SELECT cidade,MIN(idade)
        FROM aluno;    X errado 

        SELECT cidade,MIN(idade)
        FROM aluno
        GROUP BY cidade;  V correto 


                Misturando

    SELECT UPPER(cidade) as Cidade,MAX(idade) as Idade
    FROM aluno
    WHERE telefone is NOT null
    GROUP BY UPPER(cidade);



Mas e se quisermos restringir os grupos??
Por exemplo, queremos só os grupos, onde a idade é maior ou igual à 18.

                        Cláusula HAVING

        SELECT [DISTINCT] {*,nomeColuna [as apelido]}
        FROM nomeTabela
        [WHERE condição(ções)]
        [GROUP BY {expr,expr, ...}]
        [HAVING condições do grupo]
        [ORDER BY {coluna, expr, ...} [ASC|DESC]];

● HAVING consegue restringir grupos
– As linhas são selecionadas
– A função de grupo é aplicada
– Os grupos que forem aprovados pela cláusula HAVING são exibidos.

Exemplo: 

    SELECT UPPER(cidade) as Cidade,MAX(idade) as Idade
    FROM aluno
    WHERE telefone is NOT null
    GROUP BY UPPER(cidade)
    HAVING MAX(idade)>=18
    ORDER BY 2 DESC;

    output:

        cidade              idade

        CRISTAL             65
        BEGÉ                33

