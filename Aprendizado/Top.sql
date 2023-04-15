-- TOP


SELECT TOP 10 *
FROM TABELA

/* 

O comando TOP é utilizado em consultas SQL para limitar o número de linhas que serão retornadas pelo resultado da consulta. Ele é comumente utilizado em combinação com a cláusula SELECT para especificar quantas linhas devem ser retornadas da consulta.

Por exemplo, para retornar apenas as 5 primeiras linhas de uma tabela, você pode utilizar o comando TOP da seguinte maneira:

SELECT TOP 5 * FROM nome_da_tabela;
Nesse exemplo, o asterisco (*) é utilizado para selecionar todas as colunas da tabela especificada, enquanto o número 5 é utilizado para limitar o número de linhas retornadas para 5.

Também é possível utilizar o comando TOP em conjunto com a cláusula ORDER BY para ordenar os resultados antes de limitar o número de linhas retornadas. Por exemplo, para retornar as 10 primeiras linhas de uma tabela ordenadas pelo campo "nome", você pode utilizar o comando TOP e ORDER BY da seguinte forma:

SELECT TOP 10 * FROM nome_da_tabela ORDER BY nome;
Nesse exemplo, o comando ORDER BY é utilizado para ordenar as linhas da tabela pelo campo "nome", antes de limitar o número de linhas retornadas para 10 com o comando TOP.

É importante observar que o uso do comando TOP pode variar de acordo com o SGBD (Sistema Gerenciador de Banco de Dados) utilizado. Em alguns SGBDs, o comando pode ser substituído por outras palavras-chave, como LIMIT ou FETCH FIRST. Portanto, é sempre importante verificar a documentação do SGBD para saber como utilizar corretamente esse comando.

*/