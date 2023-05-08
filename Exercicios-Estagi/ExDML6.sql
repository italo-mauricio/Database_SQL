1) Crie uma consulta para exibir o nome e a data de admissão de todos os funcionários no mesmo departamento que Maria, excluindo Maria. (Faça de duas formas, uma usando o IN e outra usando EXISTS)

Resp:

    SELECT first_name, hire_date
    FROM employees
    WHERE department_id IN (
    SELECT department_id
    FROM employees
    WHERE first_name = 'Maria'
    ) AND first_name != 'Maria';

    Explicação: a subconsulta SELECT department_id FROM employees WHERE first_name = 'Maria' retorna o ID do departamento onde a funcionária Maria trabalha. Em seguida, a consulta principal seleciona os funcionários cujo ID do departamento é igual ao ID do departamento onde Maria trabalha, mas exclui Maria da lista.

    SELECT first_name, hire_date
    FROM employees AS e1
    WHERE EXISTS (
    SELECT 1
    FROM employees AS e2
    WHERE e2.department_id = e1.department_id
        AND e2.first_name = 'Maria'
    ) AND first_name != 'Maria';

    Explicação: a subconsulta SELECT 1 FROM employees AS e2 WHERE e2.department_id = e1.department_id AND e2.first_name = 'Maria' verifica se existe um funcionário chamado Maria no mesmo departamento que o funcionário selecionado pela consulta principal (representado por e1). A consulta principal seleciona os funcionários onde a subconsulta retornou verdadeiro (ou seja, onde há um funcionário Maria no mesmo departamento), mas exclui Maria da lista.


2) Crie uma consulta para exibir o código e o nome de todos os funcionários que recebem mais que o salário médio.

Resp:

    SELECT cod, nome, salarioatual 
    FROM funcionario f 
    WHERE salarioatual  > (SELECT AVG(salarioatual) FROM funcionario f);

3) Crie uma consulta que exiba o código e o nome de todos os funcionários que trabalhem em um departamento, onde exista um funcionário que possua a letra 'W' no nome.

Resp:

    SELECT f.cod, f.nome
    FROM funcionario f
    INNER JOIN departamento d ON f.cod = d.cod
    WHERE d.cod IN (
        SELECT cod
        FROM funcionario
        WHERE nome LIKE '%W%'
    );


4) Crie uma consulta para exibir o nome, a data de admissão e o salário de todos os funcionários que ganhem mais que a média de salário de todos os departamentos.

Resp:

    SELECT f.nome, f.dtcontratacao, f.salarioatual 
    FROM funcionario f
    WHERE f.salarioatual > (
        SELECT AVG(f.salarioatual)
        FROM departamento d
        INNER JOIN funcionario f ON f.cod = d.cod
    );

5) Selecione todos os gerentes que possuem efetivamente subordinados.

Resp:

    SELECT f.nome AS gerente, COUNT(*) AS num_subordinados
    FROM funcionario f
    INNER JOIN departamento d ON f.cod = d.cod_gerente
    INNER JOIN funcionario sub ON sub.cod_supervisor = f.cod
    GROUP BY f.nome
    HAVING COUNT(*) > 0;

6) Selecione todos os colegas de 'MARIA' em todas as disciplinas que ela esta matriculada, de acordo com a “matricula” realizada na tabela aluno_disciplina. (Faça de duas formas, uma usando o IN e outra usando EXISTS)

Resp:

    SELECT DISTINCT ad2.nome AS colega
    FROM aluno_disciplina ad1
    INNER JOIN aluno_disciplina ad2 ON ad1.cod_disciplina = ad2.cod_disciplina AND ad1.cod_aluno != ad2.cod_aluno
    WHERE ad1.nome = 'MARIA' AND ad2.cod_disciplina IN (
        SELECT cod_disciplina
        FROM aluno_disciplina
        WHERE nome = 'MARIA'
    )

    SELECT DISTINCT ad2.nome AS colega
    FROM aluno_disciplina ad1
    INNER JOIN aluno_disciplina ad2 ON ad1.cod_disciplina = ad2.cod_disciplina AND ad1.cod_aluno != ad2.cod_aluno
    WHERE ad1.nome = 'MARIA' AND EXISTS (
        SELECT *
        FROM aluno_disciplina ad3
        WHERE ad3.nome = 'MARIA' AND ad3.cod_disciplina = ad1.cod_disciplina
    )


