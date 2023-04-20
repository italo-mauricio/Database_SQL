                            Operadores de Comparação


OPERADOR:                      SIGNIFICADO:

                =               Igual a
                >               Maior que
                >=              Maior ou igual 
                <               Menor que 
                <=              Menor ou igual
                <>              Diferente de
        BETWEEN ... AND ...     Entre dois valores (inclusive)
        IN (lista)              Em uma lista de valores
        LIKE                    Um padrão de caracteres 
        IS NULL                  É um valor nulo
●
–
–
        WHERE expr operador valor
        Ex:
        ●
        WHERE dtnascimento = '2000-01-01 00:00:00';
        ou
        ●
        WHERE idade BETWEEN 18 AND 21
        ou
        ●
        WHERE idade IN (5,8,2)
        ou
        ●
        WHERE nome = 'PELÉ'