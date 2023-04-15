-- DESAFIO 1
/* 

Obter o ProductId dos 10 produtos mais caros cadastrados no sistema, listando do mais caro para o mais barato;

*/

SELECT TOP 10 ProductId
FROM Production.product
ORDER BY ListPrice desc;


/* Aqui ele vai retornar o top 10 produtos por dia na ordem de preço decrescente. */
