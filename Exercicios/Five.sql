-- DESAFIO 1
/* 

Obter o ProductId dos 10 produtos mais caros cadastrados no sistema, listando do mais caro para o mais barato;

*/

SELECT TOP 10 ProductId
FROM Production.product
ORDER BY ListPrice desc;


/* Aqui ele vai retornar o top 10 produtos por dia na ordem de preço decrescente. */


-- Desafio 2

/* Obter o nome e numero dos produtos que tem o ProductID entre 1 e 4 */

#Resposta

SELECT TOP 4 name, productnumber
FROM production.product 
ORDER BY ProductID asc;  

