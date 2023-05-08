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
