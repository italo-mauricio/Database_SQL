                                Limitando Linhas de um Seleção


Os selects até agora realizados buscam todas as linhas
da tabela solicitada.
● Restringimos as linhas acrescentado a cláusula WHERE
●

SELECT [DISTINCT] {*,nomeColuna [as apelido]}
FROM nomeTabela
WHERE condição(ções);

Após o SELECT especificamos as colunas
Após o FROM especificamos a tabela
Após o WHERE especificamos uma ou mais condições


                                     Condição (ções)
●
●
●
        Composta por nomes de colunas, expressões, constantes e operadores de comparação
    Fundamentalmente as condições resultam em um valor booleano (verdadeiro/falso).

        O SGBD avalia a condição solicitada, linha a linha na tabela.
    Todas as linhas, em que a condição resultar em verdadeiro serão devolvidas pelo SGBD.

    – As linhas, onde a condição resultar em falso, serão descartadas pelo SGBD, e não serão retornadas.