-- ODER BY


SELECT coluna1, coluna2
FROM tabela
ORDER BY coluna1 asc/desc;


#Exemplo só em ordem crescente

SELECT *
FROM person.Person
ORDER BY FirstName asc;

#Exemplo indo de ordem crescente para decrescente

SELECT *
FROM person.Person
ORDER BY FirstName asc ,LastName desc;

