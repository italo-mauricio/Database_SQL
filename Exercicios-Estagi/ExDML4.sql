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



8) Retorne o nome do aluno e a carga de horas total das disciplinas que ele esta matriculado. Ordene pelo nome do aluno.
    

    