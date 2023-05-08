                          Exists

● Permite correlacionar linhas da subconsulta com linhas da
consulta principal.
● Em outras palavras, a consulta interna contém uma referência
para tabela da consulta externa.
● Se a subconsulta retornar uma ou mais linhas, a sentença
EXISTS é considerada verdadeira.
● Podemos inverter o resultado usando NOT EXISTS

                SELECT * FROM tabela
                WHERE
                [ [NOT] EXISTS (subconsulta)]


                        Como usar?

● Apresentar todos os gerentes que possuem subordinados.

SELECT cod,nome
FROM funcionario AS gerente
WHERE EXISTS (SELECT 0
FROM funcionario
WHERE funcionario.codgerente=gerente.cod);

output:

    cod         nome 
    2           Maria
    30          Bernardo