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


2) Faça uma consulta utilizando a View acima, com as tabelas matricula e disciplina, informando o nome do aluno, o nome da disciplina que ele esta matriculado e o nível que ele se encontra.

Resp:

    SELECT a.nome AS nome_aluno, a.matricula, d.nome AS nome_disciplina, an.nivel 
    FROM aluno a 
    JOIN aluno_disciplina ad ON a.matricula = ad.matricula 
    JOIN disciplina d ON ad.coddisciplina  = d.cod 
    JOIN alunos_nivel2 an ON a.matricula = an.matricula 
    GROUP BY a.matricula, a.nome, d.nome, an.nivel
    ORDER BY nome_aluno;


3) Baseado nas consultas acima, faça uma nova consulta que informe o total de alunos
matriculados por disciplinas e agrupados por nível. Ordenado por disciplina e em seguida por
nível. Algo tipo:


Resp:

    SELECT d.nome AS Disciplina, COUNT(*) AS Numero_Alunos, an.nivel AS Nível
    FROM disciplina d 
    JOIN aluno_disciplina ad ON d.cod = ad.coddisciplina 
    JOIN alunos_nivel2 an ON ad.matricula = an.matricula
    GROUP BY d.nome, an.nivel
    ORDER BY d.nome, an.nivel;


