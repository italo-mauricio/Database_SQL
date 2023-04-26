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

TRY_CONVERT() - Essa função é semelhante à função CONVERT(), mas retorna um valor nulo se a conversão falhar em vez de gerar um erro. A função TRY_CONVERT() é útil quando você deseja converter valores que podem ou não estar no formato correto.

TRY_CAST() - Essa função é semelhante à função CAST(), mas retorna um valor nulo se a conversão falhar em vez de gerar um erro. A função TRY_CAST() é útil quando você deseja converter valores que podem ou não estar no formato correto.

É importante lembrar que nem todas as conversões são possíveis ou permitidas no SQL, dependendo do tipo de dados envolvido e das regras de integridade do banco de dados. Portanto, é importante entender as limitações e possibilidades de cada função de conversão antes de usá-la em seu código SQL.