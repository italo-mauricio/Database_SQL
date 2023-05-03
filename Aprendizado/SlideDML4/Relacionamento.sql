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


    Este exemplo abaixo eu consigo pegar informações de duas tabelas que estão ligadas por um código:

    SELECT f.nome, f.salarioatual, d.descricao 
    FROM funcionario f 
    INNER JOIN departamento d ON f.cod = d.cod 
    WHERE f.cod = '8';


● Junção Não-Idêntica:

    - Quando nenhuma coluna da tabela X correspondem diretamente a uma coluna da tabela Y
    - Por exemplo, se quisermos categorizar os salários dos Funcionarios dentro de Categorias Salariais (Faixa).



● Junção Externa
● Autojunção




Junção de tabelas exemplo:

    Neste exemplo, eu fiz uma tabela aluno com matricula sendo a primary key, e fiz uma tabela com discilina sendo cod como chave primary. Pois bem, logo após criei uma terceira tabela chamda aluno_disciplina com matricula e coddisciplina sendo ambas primary keys. Segue abaixo a forma como eu vinculei ambas.

    insert into aluno_disciplina (matricula, coddisciplina)
    values('201510501', '124');  Aqui eu preencho a terceira tabela com a matricula que eu já sei da tablea aluno, e o código da disciplina.


    SELECT a.matricula, a.nome AS nome_aluno, d.cod, d.nome AS nome_disciplina
    FROM aluno a
    INNER JOIN aluno_disciplina ad ON a.matricula = ad.matricula
    INNER JOIN disciplina d ON ad.coddisciplina = d.cod;

    por fim, utilizando INNER JOIN eu consigo vincular as duas tabelas com a terceira, gerando esta saida:

    output:

    matricula           nome_aluno          cod             nome_disciplina

    201.618.361        KAREN REDIESS        123             Algoritmos
    201.510.531        ITALO MAURICIO       124             Matemática 


