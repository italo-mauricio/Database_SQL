                                    Exercícios


1) Faça uma consulta que exiba o nome do funcionário e do departamento de todos os funcionários.


Resp:

    SELECT f.nome, d.descricao
    FROM funcionario f
    INNER JOIN departamento d ON f.cod = d.cod

    Nesta questão, usamos INNER JOIN para pegar da tabela departamento algo em comum que liga com a tabela funcionário, que no caso seria cod.

    output:
        nome                descrição 

        Fernanda            Departamento 8


2) Mostre todos os cargos dos funcionários lotados nos departamentos com sigla na CTB.


Resp:   

    SELECT f.cargo, d.sigla
    FROM funcionario f
    INNER JOIN departamento d ON f.cod = d.cod
    where d.sigla = 'DCT' or d.sigla = 'DCP';

    Aqui fiz basicamente a mesma coisa que o código anterior, porém com uma condição de busca no final


3) Mostre o número de alunos matriculados por disciplinas

Resp:

    SELECT disciplina.nome, COUNT(*) AS num_alunos_matriculados
    FROM aluno 
    INNER JOIN disciplina ON cod = disciplina.cod 
    GROUP BY disciplina.nome

    Usando o count eu consigo contar quantos alunos tem, que na minha tabela atual são 52 alunos ou 13 por disciplina.


4) Mostre o nome do funcionário e o nome do departamento dos funcionários que possuem um A em seus nomes.

Resp:

    select f.nome, d.descricao
    from funcionario f 
    inner join departamento d on f.cod = d.cod 
    where f.nome like '%A%'

    aqui eu vou usar novamente o inner join para pegar o nome e o departamento do funcionário, porém com os que tiverem A no nome. 

5) Faça uma consulta que retorne todos os funcionários que trabalham em departamentos situados no Rio de Janeiro e que o salario seja maior que R$ 1500,00.

Resp:

    SELECT funcionario.nome, departamento.descricao, funcionario.salarioatual
    FROM funcionario
    INNER JOIN departamento ON funcionario.cod = departamento.cod
    WHERE funcionario.cidade = 'Rio de Janeiro' AND funcionario.salarioatual > 1500

    usando inner join mais a cláusula where eu consigo condicionar a procurar um funcionário no rio de janeiro que ganhe mais de 1500.

6) Retorne o nome do aluno e a carga de horas total das disciplinas que ele esta matriculado. Ordene pelo nome do aluno.


Resp:

    SELECT aluno.nome, SUM(disciplina.cargahoraria) AS carga_horaria_total
    FROM aluno
    INNER JOIN aluno_disciplina ON aluno.matricula = aluno_disciplina.matricula
    INNER JOIN disciplina ON aluno_disciplina.coddisciplina = disciplina.cod
    GROUP BY aluno.nome
    ORDER BY aluno.nome

    Explicação:

        SELECT: especifica as colunas que devem ser exibidas na consulta. Aqui, estamos selecionando o nome do aluno e a soma da carga horária das disciplinas em que ele está matriculado. Usamos a função SUM() para somar as cargas horárias das disciplinas correspondentes.
        FROM: especifica as tabelas envolvidas na consulta. Aqui, estamos selecionando a tabela "aluno" e juntando-a com a tabela "aluno_disciplina" usando a cláusula INNER JOIN. Em seguida, estamos juntando a tabela "disciplina" com base no campo "cod_disciplina" presente na tabela "aluno_disciplina".
        INNER JOIN: junta as tabelas com base nas chaves primárias e estrangeiras correspondentes.
        GROUP BY: agrupa as linhas com base no nome do aluno, para que possamos calcular a soma da carga horária para cada aluno.
        ORDER BY: ordena o resultado com base no nome do aluno em ordem alfabética.


7) Crie uma consulta para exibir o nome do departamento, a sigla, o número de funcionários e o salário médio de todos os funcionários neste departamento.

Resp:

    SELECT departamento.descricao, departamento.sigla, COUNT(funcionario.cod) AS num_funcionarios, AVG(funcionario.salarioatual) AS salario_medio
    FROM departamento
    INNER JOIN funcionario ON departamento.cod = funcionario.cod
    GROUP BY departamento.descricao, departamento.sigla


    Aqui estamos utilizando o COUNT para contar os funcionários, e o AVG para tirar a média salarial, depois utilizamos os inner join para juntar as tabelas departamento e funcionário através deste caso da chave primária, e depois agrupamos por departamento e sigla.



8) Monte uma consulta que informe a faixa salarial dos funcionários, de acordo com a tabela do slide 4. Em seguida faça um select com o número de funcionários por faixa salarial

Resp:

    SELECT salarioatual, COUNT(*) as num_funcionarios, string_agg(nome, ', ') as funcionarios
    FROM (
    SELECT salarioatual,
        CASE
        WHEN salarioatual < 1000 THEN 'Até 1000'
        WHEN salarioatual BETWEEN 1000 AND 2000 THEN '1000-2000'
        WHEN salarioatual BETWEEN 2000 AND 3000 THEN '2000-3000'
        ELSE 'Acima de 3000'
        END as faixa_salarial,
        nome
    FROM funcionario
    ) as subquery
    GROUP BY salarioatual, faixa_salarial;

    Explicação:

    Esse código é uma consulta em SQL que utiliza uma subconsulta para agrupar os funcionários de uma tabela chamada "funcionario" de acordo com o salário atual e faixa salarial, e retorna o número de funcionários em cada faixa salarial e salário atual, juntamente com o nome dos funcionários correspondentes.

    O comando SELECT é usado para selecionar as colunas a serem exibidas na consulta. Nesse caso, a consulta retorna três colunas: "salarioatual", "num_funcionarios" e "funcionarios".

    A subconsulta é usada para agrupar os dados por faixa salarial e nome dos funcionários. Ela utiliza o comando CASE para classificar os funcionários em faixas salariais específicas e inclui a coluna "nome" para exibir os nomes dos funcionários correspondentes.

    O comando GROUP BY é usado para agrupar os resultados por "salarioatual" e "faixa_salarial", permitindo que a função COUNT() e string_agg() sejam aplicadas a cada grupo. O comando COUNT() retorna o número de funcionários em cada grupo, enquanto a função string_agg() concatena os nomes dos funcionários em uma string separada por vírgula


9) Crie uma tabela faixaNivel, onde os alunos com idade de 15 à 20 são nível A, 21 à 25 nível B, 25 à 30 nível C e acima nível D. Faça uma consulta informando o nome do aluno e o nível em que ele se encontra.

Resp:

    SELECT nome, 
       CASE 
           WHEN idade BETWEEN 15 AND 20 THEN 'Nível A'
           WHEN idade BETWEEN 21 AND 25 THEN 'Nível B'
           WHEN idade BETWEEN 26 AND 30 THEN 'Nível C'
           ELSE 'Nível D'
       END as faixa_nivel
    FROM aluno;



10) Faça uma consulta para retornar todos os nomes de disciplinas e o número de alunos matriculados. Lembrando que se a disciplina não possuir aluno, deve informar 0 (zero). 


Resp: 

    SELECT d.nome, COUNT(ad.matricula) AS num_alunos
    FROM disciplina d
    LEFT JOIN aluno_disciplina ad ON d.cod = ad.coddisciplina
    GROUP BY d.nome;

    SELECT d.nome AS disciplina, a.nome AS aluno
    FROM disciplina d
    LEFT JOIN aluno_disciplina ad ON d.cod = ad.coddisciplina
    LEFT JOIN aluno a ON ad.matricula = a.matricula
    ORDER BY d.nome;

    O primeiro código é uma consulta SQL que retorna o nome de cada disciplina e o número de alunos matriculados em cada uma delas. Para isso, é utilizado um JOIN entre as tabelas "disciplina" e "aluno_disciplina" para relacionar as disciplinas com as matrículas dos alunos matriculados, e a função COUNT é usada para contar o número de alunos matriculados em cada disciplina. A cláusula GROUP BY é utilizada para agrupar os resultados pelo nome da disciplina. O resultado dessa consulta é uma tabela com duas colunas: "nome" (nome da disciplina) e "num_alunos" (número de alunos matriculados).

    Já o segundo código é uma consulta SQL que retorna o nome de cada disciplina e o nome de cada aluno matriculado nessa disciplina. Para isso, é utilizado um JOIN entre as tabelas "disciplina", "aluno_disciplina" e "aluno" para relacionar as disciplinas com as matrículas dos alunos matriculados e seus respectivos nomes. A cláusula LEFT JOIN é utilizada para garantir que todas as disciplinas sejam exibidas, mesmo aquelas sem alunos matriculados. A cláusula ORDER BY é utilizada para ordenar os resultados pelo nome da disciplina. O resultado dessa consulta é uma tabela com duas colunas: "disciplina" (nome da disciplina) e "aluno" (nome do aluno matriculado nessa disciplina).

    Espero ter ajudado a entender melhor os códigos!

11) Faça uma consulta para retornar o nome do aluno e a disciplina matriculada. Todos os alunos devem aparecer, mesmo se não estiver matriculado em nenhuma disciplina.

Resp:

    SELECT aluno.nome, disciplina.nome AS disciplina_matriculada
    FROM aluno
    LEFT JOIN aluno_disciplina ON aluno.matricula = aluno_disciplina.matricula
    LEFT JOIN disciplina ON aluno_disciplina.coddisciplina = disciplina.cod;

    Explicação:

    Nesta consulta, a tabela "aluno" representa a lista de todos os alunos, a tabela "disciplina" representa a lista de todas as disciplinas disponíveis, e a tabela "aluno_disciplina" representa a lista de matrículas de alunos em disciplinas. A instrução LEFT JOIN é usada para juntar essas tabelas, garantindo que todos os alunos sejam exibidos, mesmo que não estejam matriculados em nenhuma disciplina.

    A consulta seleciona o nome do aluno e o nome da disciplina matriculada, e utiliza um alias ("disciplina_matriculada") para o nome da coluna da tabela "disciplina". O resultado da consulta será uma lista de todos os alunos e suas disciplinas matriculadas, ou uma linha em branco para aqueles que não estão matriculados em nenhuma disciplina.

12) Faça retornar o nome do gerente e o nome do funcionário O funcionario que não possuir gerente deve aparecer também.

Resp:

    SELECT gerente.nome AS nome_gerente, funcionario.nome AS nome_funcionario
    FROM funcionario
    LEFT JOIN funcionario AS gerente ON funcionario.codgerente = funcionario.nome;


    Aqui ele vai retornar a esquerda o nome do gerente, e a direita o nome do funcionário.

13) Reproduza os selects dos slides 23,24 e 25

Resp:

    INTERSECT:

    SELECT idade
    FROM aluno
    INTERSECT
    SELECT matricula 
    FROM aluno_disciplina ad;

    EXCEPT:

    SELECT nome
    FROM aluno a 
    EXCEPT
    SELECT nome
    FROM funcionario f ;

    UNION:

    SELECT nome
    FROM aluno a 
    union
    SELECT nome
    FROM funcionario f ;

14) Faça uma consulta que retorne os nomes dos funcionários e os nomes dos alunos, ordenados de forma decrescente. Os nomes duplicados devem aparecer.

Resp:

    SELECT nome
    FROM (
    SELECT nome FROM funcionario
    UNION ALL
    SELECT nome FROM aluno
    ) AS nomes
    ORDER BY nome DESC

    Essa consulta usa o comando UNION ALL para combinar os resultados das duas consultas que selecionam os nomes dos funcionários e dos alunos. Em seguida, ordenamos os resultados pelo nome em ordem decrescente usando ORDER BY nome DESC.

15) A mesma consulta acima, mas sem duplicar nomes.

Resp:

    SELECT DISTINCT nome
    FROM (
    SELECT TRIM(LOWER(nome)) AS nome FROM funcionario
    UNION
    SELECT TRIM(LOWER(nome)) AS nome FROM aluno
    ) AS nomes
    ORDER BY nome desc;

    Nessa consulta, a função TRIM é usada para remover quaisquer espaços em branco no início ou no final do nome, e a função LOWER é usada para tornar os nomes em minúsculas. Em seguida, a cláusula DISTINCT é adicionada para remover quaisquer resultados duplicados.


16) Faça retornar na mesma coluna o nome do aluno e o nome da disciplina sem repetições de nomes.

Resp:

    SELECT DISTINCT a.nome AS nome_aluno, d.nome AS nome_disciplina
    FROM aluno a
    INNER JOIN aluno_disciplina ad ON a.matricula = ad.matricula
    INNER JOIN disciplina d ON ad.coddisciplina = d.cod
    ORDER BY a.nome;

    Essa consulta seleciona o nome do aluno e o nome da disciplina da tabela "aluno" e "disciplina", respectivamente, e junta (join) as três tabelas pela tabela intermediária "aluno_disciplina", que relaciona as matrículas dos alunos aos códigos das disciplinas. A cláusula DISTINCT é adicionada para evitar linhas duplicadas, e os resultados são ordenados em ordem crescente pelo nome do aluno usando ORDER BY a.nome. Observe que neste caso precisamos utilizar os nomes dos campos das tabelas para evitar ambiguidades, já que ambas as tabelas "aluno" e "disciplina" possuem um campo "nome".

17) Faça um único select, que reproduzam os inserts existentes nas tabelas Funcionário e Aluno, gerando o resultado no formato de scripts para serem executados em outra base de dados.

Resp:

    -- Script para inserir os funcionários na nova base de dados
    SELECT 'INSERT INTO Funcionário (cargo, nome, salario) VALUES (''' || cargo || ''', ''' || nome || ''', ' || salarioatual || ');' AS script
    FROM funcionario f;

    -- Script para inserir os alunos na nova base de dados
    SELECT 'INSERT INTO Aluno (matricula, nome) VALUES (''' || matricula || ''', ''' || nome || ''');' AS script
    FROM aluno;

    output:

    INSERT INTO Funcionário (cargo, nome, salario) VALUES ('Analista', 'João', 3000)
    