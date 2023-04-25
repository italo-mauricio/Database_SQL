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


Exemplo: 

SELECT email,nome,matricula
FROM aluno
WHERE nome LIKE 'MAR%'
AND idade >=18
ORDER BY cidade ASC;

SELECT *
FROM aluno
WHERE (cidade = 'PELOTAS' OR cidade = 'CRISTAL')
AND idade > 20
ORDER BY idade;

SELECT nome
FROM aluno
WHERE nome LIKE '_A%'
ORDER BY matricula DESC;

Podemos usar o Apelido (ALIAS) da coluna como referência: 

    SELECT telefone,nome, dtnascimento AS quandoNasceu
    FROM aluno
    WHERE telefone IS NOT NULL
    ORDER BY quandoNasceu;

Podemos usar o número da coluna que será retornada como referência:

    SELECT cidade, telefone,nome,
    FROM aluno
    ORDER BY 2;

● A cláusula ORDER BY permite várias colunas:

    SELECT telefone,nome, dtnascimento, matricula
    FROM aluno
    ORDER BY nome,dtnascimento DESC;

    SELECT telefone,nome, dtnascimento, matricula
    FROM aluno
    ORDER BY nome,dtnascimento ASC;