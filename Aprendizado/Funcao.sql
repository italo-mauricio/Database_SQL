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
