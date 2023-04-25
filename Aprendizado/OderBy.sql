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

●Classifica as linhas em ordem crescente ou decrescente;

●Só pode haver um Order By por Select;

SELECT [DISTINCT] {*,nomeColuna [as apelido]}
FROM nomeTabela
[WHERE condição(ções)]
[ORDER BY {coluna, expr, ...} [ASC|DESC]];

ORDER BY- especifica a ordem em que as linhas recuperadas são exibidas
ASC
- ordena as linhas na ordem crescente (default)
DESC
- ordena as linhas na ordem decrescente