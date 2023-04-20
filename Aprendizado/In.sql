# SQL Aula 09 - IN

Nós usamos o operador IN junto com o WHERE, para verificar se um valor corresponde com qualquer valor passado na lista de valores.

valor IN (valor1, valor2)
color IN ('BLUE', 'RED')
valor IN (SELECT valor FROM nomeDaTabela) 

Exemplo com IN:

SELECT *
FROM Person.Person
WHERE BusinessEntityID IN (2, 7, 13);

Exemplo sem IN:

SELECT *
FROM Person.PErson
WHERE BusinessEntityID = 2 OR BusinessEntityID = 7 OR BusinessEntityID = 13;

Da primeira maneira, torna a busca muito mais eficiente e gastando menos linhas.