                                Operadores Lógicos


OPERADOR                            SIGNIFICADO
  
    AND                Retorna TRUE se todas as condições forem verdadeiras
    OR                 Retorna TRUE se pelo menos uma das condições forem verdadeiras
    NOT                Retorna TRUE se a condição seguinte for FALSE ou FALSE se a condição seguinte for TRUE     

Exemplo:
        SELECT [DISTINCT] {*,nomeColuna [as apelido]}
        FROM nomeTabela
        WHERE condição(ções);


Condições = expr AND expr OR expr AND NOT expr ...

        O Operador NOT pode ser utilizado também com outros operadores SQL, como o
BETWEEN, LIKE e o IS:

... WHERE idade NOT IN (5,7,9,11)
... WHERE matricula NOT BETWEEN 1000 AND 2000
... WHERE nome NOT LIKE ('_A%')
... WHERE telefone IS NOT NULL


Exemplo de código: 

SELECT email,nome,matricula,idade
FROM aluno
WHERE nome LIKE 'MAR%'
AND idade >=18;

Output:       email              nome            matricula        idade 

        marcelo@gmail.com    MARCELO SOARES      201.510.501        25