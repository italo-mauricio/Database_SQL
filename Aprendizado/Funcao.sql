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

        


    
