                    Atualizando Registros/Linhas/Tuplas




● UPDATE é a cláusula que consegue fazer atualizações
nos registros das tabelas.

    UPDATE nomeTabela
    SET coluna = valor [, coluna = valor, ...]
    [WHERE condição (ções)];

Quantos e quais registros serão atualizados?

    UPDATE aluno
    SET dtnascimento='1900-04-21 00:00:00', cidade= 'TURUÇU', telefone = 84104000

    UPDATE aluno
    SET idade=23
    WHERE matricula=123

    UPDATE aluno
    SET idade=86
    WHERE matricula=333