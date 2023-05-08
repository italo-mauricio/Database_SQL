1) Crie uma tabela faixaNivel, onde os alunos com idade de 15 à 20 são nível A, 21 à 25 nível B, 25 à 30 nível C e acima nível D. Crie uma View no qual a consulta informa a matricula do aluno, o nome do aluno e o nível em que ele se encontra.


Resp:

    CREATE TABLE faixaNivel1 (
    idade_min INT,
    idade_max INT,
    nivel CHAR(1)
    );

    Aqui estou criando a tabela faixa nivel.


    INSERT INTO faixaNivel1 (idade_min, idade_max, nivel) VALUES
    (15, 20, 'A'),
    (21, 25, 'B'),
    (26, 30, 'C'),
    (31, NULL, 'D');
    
    Aqui estou inserindo os dados na tablea, já com as descrições

    CREATE VIEW alunos_nivel AS
    SELECT a.matricula, a.nome, f.nivel
    FROM aluno a
    JOIN faixaNivel1 f ON a.idade BETWEEN f.idade_min AND COALESCE(f.idade_max, a.idade)

    Aqui estou criando a view baseado em outra tabela gerada anteriormente (aluno).

    select *
    from aluno_nivel 

    Aqui estou consultando o resultado.
