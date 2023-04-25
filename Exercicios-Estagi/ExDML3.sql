                                    Exercícios
Dica 1: No jargão da informática, atualizar significa modificar dados da tabela. Que comando utilizar?
Dica 2: Em cada questão, separe o que é PROJEÇÃO e o que é SELEÇÃO, para então montar o comando.


1) Selecione todos os alunos que não possuem telefone e coloque em alguns a informação do telefone:


Resp:   select * 
        from aluno
        where telefone is null;    verifico quais são null na tabela 

        update aluno set telefone = '213232312'
        where telefone is null;    caso eu queria colocar um telefone em todos que são null eu uso esta linha

        update aluno set telefone = '111111'
        where matricula = 188988   caso eu queira troar especificamente o numero de alguem 

2) Atualize os alunos, aumentando em um ano a idade de todos os alunos que nasceram depois de 01/01/1980.


Resp:   UPDATE aluno 
        SET idade = idade + 1 
        WHERE dtnascimento > '1980-01-01';     vai adicionar + 1 se você nasceu depois dessa data. 

        UPDATE aluno 
        SET idade = idade + 1
        WHERE cidade = 'Caicó';     vai adicionar + 1 se você nasceu em Caicó.


3) Atualize as disciplinas, deixando todas com carga horária igual a 60.

Resp:   UPDATE disciplina 
        SET cargahoraria = '60';  na tabela aluno irá trocar toda a carga horária para 60.
