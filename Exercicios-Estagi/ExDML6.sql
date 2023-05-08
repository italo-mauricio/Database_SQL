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
