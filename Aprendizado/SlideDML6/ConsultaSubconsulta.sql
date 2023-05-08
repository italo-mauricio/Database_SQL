            Consultas Aninhadas (Subconsultas)


● Uma subconsulta é uma instrução SELECT adicionada
dentro de uma instrução SELECT, INSERT, DELETE,
ou UPDATE ou dentro de outra subconsulta.

● Precisamos de subconsultas, para resolver problemas
mais complexos, que não são atendidos pelos
mecanismos vistos até o momento.


                     Problema
●  Como obter os funcionários que recebem salário acima da média salarial dos funcionários?

É necessário duas consultas. Uma para calcular o salário
médio de todos os funcionários e outra para descobrir quem
recebe mais que o valor da primeira consulta.

Isto pode ser feito manualmente em duas execuções de consulta ao
SGBD.
● Ou em uma única consulta, que use subconsulta.

                    Comportamento

● A subconsulta é executada uma vez antes da consulta
principal
● O resultado da subconsulta é usado pela consulta
principal
● Pode existir subconsulta da subconsulta
● As subconsultas devem estar entre parênteses e estar
no lado direito do operador de comparação
● Subconsultas não podem possuir claúsula ORDER BY


                    Sintaxe

    SELECT * FROM tabela
    WHERE
    [ [NOT] EXISTS (subconsulta)]
    [ coluna OperadorUnicaLinhas (subconsulta)]
    [ coluna [NOT] OperadorVariasLinhas (subconsulta)];


                    Classes de Operadores em Subconsultas

● Operadores de comparação de uma única linha

        >,=,<,<>,>=,<=
    - Operadores de uma única linha devem ser usados com subconsultas que retornem uma única linha.


● Operadores de várias linhas

    IN, [>,=,<,<>,>=,<=] ANY, [>,=,<,<>,>=,<=] ALL

    - Operadores de várias linhas são usados com subconsultas que podem retornar mais de uma linha.
    - Podemos usar o operador NOT para inverter a operação.


                Subconsultas de Várias Linhas


        OPERADOR                                  SIGNIFICADO

            IN                         Igual a qualquer membro da lista
            ANY                     Compara o valor a cada valor retornado pela Subconsulta
            ALL                     Compara o valor a todo valor retornado pela Subconsulta



● Localize os funcionários que recebem o mesmo salário que o salário mínimo dos departamentos.


        SELECT f.cod,f.nome,f.salario
        FROM f.funcionario
        WHERE f.salario IN (SELECT MIN(salario)
        FROM funcionario
        GROUP BY coddepartamento);

Subconsultas de Várias Linhas:

● Quais os funcionários que possuem salário menor que o salário médio
de algum departamento?
● Quais os funcionários que possuem salário menor que o salário médio
de todos os departamentos?

SELECT f.cod,f.nome,f.salario,f.coddepartamento
FROM funcionario AS f
WHERE f.salario < ANY (SELECT AVG(salario)
FROM funcionario
GROUP BY coddepartamento);

ANY e ALL são usados em conjunto com:
>,=,<,<>,>=,<=

SELECT f.cod,f.nome,f.salario,f.coddepartamento
FROM funcionario AS f
WHERE f.salario < ALL (SELECT AVG(salario)
FROM funcionario
GROUP BY coddepartamento);