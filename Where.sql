# definição

SELECT coluna1, coluna2, coluna_n
FROM tabela
WHERE condicao

# Exemplos

SELECT *
FROM person.person
WHERE LastName = 'Miller' and FirstName = 'anna';

SELECT *
FROM production.Product
WHERE color = 'blue' or color = 'black';

SELECT *
FROM production.Product
WHERE ListPrice > 1500 and ListPrice < 5000;

SELECT *
FROM production.Product
WHERE color <> 'red' and color <> 'yellow';

/*  
    Nestes exemplos eu faço comparações no banco de dados, fazendo com que a minha filtragem seja mais dinâmica e perfomática.
*/

/* 
OPERADOR                     DESCRIÇÃO

=                               igual
>                               maior que
<                               menor que
>=                              maior igual
<=                              menor igual
<>                              diferente de
AND                             operador lógico E
OR                              operador lógico OU

 */