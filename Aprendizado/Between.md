# SQL Aula sobre - Between

O between é usado para encontrar o valor entre um valor mínimo e um valor máximo.

Valor BETWEEN min AND max;

é a mesma coisa que dizer;

valor >= min AND valor <= max;

Exemplo:

SELECT *
FROM Production.Product
WHERE ListPrice between 1000 and 1500;

Neste código em SQL ele vai listar os produtos entre 1000 e 1500 em valor.

Caso eu queria os produtos que NÃO estão entre 1000 e 1500, devo apenas adicionar o NOT na lógica, ficando assim: 

SELECT *
FROM Production.Product
WHERE ListPrice NOT between 1000 and 1500;