-- Count

SELECT COUNT(DISTINCT coluna)
FROM TABELA 


Como funciona o COUNT no SQL?
Em SQL, COUNT é uma função agregada que é usada para contar o número de linhas em uma tabela ou em um grupo de resultados de uma consulta.

A sintaxe básica da função COUNT é a seguinte:


SELECT COUNT(column_name) FROM table_name;
Nessa sintaxe, column_name é o nome da coluna para a qual você deseja contar o número de linhas, e table_name é o nome da tabela que contém essa coluna.

A função COUNT também pode ser usada em combinação com outras cláusulas SQL, como WHERE, GROUP BY e HAVING, para contar o número de linhas que atendem a uma determinada condição ou que pertencem a um determinado grupo.

Por exemplo:

SELECT COUNT(*) FROM customers WHERE country = 'Brazil';
Nessa consulta, estamos contando o número de linhas na tabela "customers" que atendem à condição "country = 'Brazil'". O asterisco (*) significa que estamos contando todas as colunas da tabela, mas você também pode especificar uma coluna específica se desejar.

Em resumo, a função COUNT é usada para contar o número de linhas em uma tabela ou em um grupo de resultados de uma consulta, e pode ser usada em combinação com outras cláusulas SQL para filtrar ou agrupar os resultados.

