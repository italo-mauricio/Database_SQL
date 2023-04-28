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
        
● O SGBD Relacional não tem entendimento, nem dá significado
para a utilizade desta tabela.
● Nós HUMANOS sabemos o porquê!
