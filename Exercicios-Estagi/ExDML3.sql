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


4) Crie uma consulta para exibir o nome e o salário dos funcionários que recebem mais de R$ 800,00.

Resp:   select *
        from funcionario 
        where salarioatual > '800'  Aqui só irá aparecer na tela os funcionários com salario maior que 800 reais.

5) Crie uma consulta para exibir o nome do funcionário e o número do departamento para o código do funcionário 459.

Resp:   SELECT f.cod, f.nome, f.cargo, f.dtcontratacao, f.codgerente, f.salarioatual, d.descricao, d.sigla
        FROM funcionario f
        JOIN departamento d ON f.cod = d.cod;    desta forma eu irei selecionar a tabela tanto de departamento quanto de funcionario, e vincular o código de ambos

        select *
        from funcionario 
        where cod = '459'    e aqui irei mostrar o cod do funcionário 459


        output:
        
          cod      nome        cargo        dtcontratacao  codgerente   salarioatual

          459     Pablo    Analista de TI     2022-02-03     G10            150000

