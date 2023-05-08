                                View 

● Tabela virtual criada sobre tabelas reais a partir de queries
● Finalidades:

– Permitem adaptar a aparência da base de dados considerando
diferentes usuários
– Restringem o acesso aos dados
– Simplificam o acesso aos dados
– Podem auxiliar a fornecer independência de dados lógica
● Sintaxe:

    CREATE VIEW nome-da-view
    AS expressão-query;


                                View

CREATE VIEW VFuncionario AS
SELECT f.cod AS codigo, f.nome AS nome, d.descricao AS descricao
FROM funcionario as f INNER JOIN departamento as d ON f.coddepartamento=d.cod
ORDER BY 2;
● Depois de criar uma view, podemos utiliza-la em qualquer seleção,
fazendo projeções e junções, similar ao uso com tabelas. Por exemplo:

SELECT nome,descricao
FROM vfuncionario;
SELECT vf.nome,vf.descricao,f.cargo
FROM funcionario AS f INNER JOIN vfuncionario AS vf ON f.cod=vf.codigo


● Uma view pode ser atualizável (depende do SGBD),
quando for construída:
● As atualizações nas tabelas refletem nas views
– sem DISTINCT
– sem group by, having, union 
– sem utilizar mais de uma tabela 
– sem expressões como sum, min ...
– contiver os campos necessários (por ex. chave primária)
● Se a tabela básica é destruída todas views são destruídas
● Views causam sobrecarga no processamento