Como montar Relacionamentos?



● No slide anterior a cardinalidade era de 1 para n e vice-versa.
– Para cada departamento temos vários funcionários
Um funcionário tem um único departamento.
– Mas e no caso do Aluno com a Disciplina?
●
– Um aluno pode estar matriculado em várias disciplinas
– Uma disciplina pode ter vários alunos

Solução


● É necessário uma terceira tabela para montar o relacionamento

        create table aluno_disciplina (
        matricula numeric(6),
        coddisciplina numeric(6),
        primary key(matricula,coddisciplina));

            O SGBD Relacion Cardinalidade e Direcionalidade nos SGBDs Relacionais

                                    ● 1 para 1
                                    ● 1 para N
                                    ● N para N


Bidirecional sempre!
–
Ex.
● Dos alunos chegamos nas disciplinas
● Das disciplinas chegamos nos alunos



                        Tipos de Junção

● Junção Idêntica:

    Quando duas ou mais tabelas possuem colunas com valores que devem ser iguais.

    Junção Idêntica no SELECT

    SELECT [DISTINCT] {*,nomeColuna [as apelido]}
    FROM tabela1 INNER JOIN tabela2 ON tabela1.colunaX=tabela2.colunaY
    [WHERE condição(ções)]
    [GROUP BY {expr,expr, ...}]
    [HAVING condições do grupo]
    [ORDER BY {coluna, expr, ...} [ASC|DESC]];

    SELECT *
    FROM funcionario INNER JOIN departamento ON funcionario.coddepartamento = departamento.cod;

    Junção Idêntica no SQL em N tabelas 

    SELECT *
    FROM aluno INNER JOIN aluno_disciplina ON aluno.matricula = aluno_disciplina.matricula
    INNER JOIN disciplina ON aluno_disciplina.coddisciplina = disciplina.cod;

    Misturando

    SELECT *
    FROM aluno INNER JOIN aluno_disciplina ON aluno.matricula = aluno_disciplina.matricula
    INNER JOIN disciplina ON aluno_disciplina.coddisciplina = disciplina.cod
    WHERE disciplina.cargahoraria=60;

    Apelido nas Tabelas
    SELECT aluno.matricula, aluno.nome, telefone, disciplina.nome,cargahoraria
    FROM aluno INNER JOIN aluno_disciplina ON aluno.matricula = aluno_disciplina.matricula
    INNER JOIN disciplina ON aluno_disciplina.coddisciplina = disciplina.cod
    WHERE aluno.telefone IS NOT NULL
    ORDER BY disciplina.nome;

            ^
            ||    SETAS 
            v

    SELECT a.matricula, a.nome, a.telefone, d.nome,d.cargahoraria
    FROM aluno AS a INNER JOIN aluno_disciplina AS ad ON a.matricula = ad.matricula
    INNER JOIN disciplina AS d ON ad.coddisciplina = d.cod
    WHERE a.telefone IS NOT NULL
    ORDER BY d.nome;


● Junção Não-Idêntica:

    - Quando nenhuma coluna da tabela X correspondem diretamente a uma coluna da tabela Y
    - Por exemplo, se quisermos categorizar os salários dos Funcionarios dentro de Categorias Salariais (Faixa).



● Junção Externa
● Autojunção



