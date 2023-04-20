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



Podemos combinar PROJEÇÃO E SELEÇÃO, separar matricula, nome e email dos registros/linhas/tuplas que são da cidade de RECIFE (por exemplo):

código: 

SELECT matricula, nome, email
FROM aluno
WHERE cidade = 'Recife'


Output:     matricula            nome                email  
           201.610.253      ANGELO GAWLINSKI        angelo@gmail.com 
           201.618.375      CESAR AUGUSTO           cesar@gmail.com 

Não vai aparecer a cidade "RECIFE" pois não especificamos a cidade no SELECT porém se você pedir pra ele demonstrar, vai verificar que a busca foi realizada com sucesso e esses dois nomes estão no banco de dados na cidade de Recife. 


