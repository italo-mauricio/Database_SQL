                                    Exercícios


1) Faça uma consulta que exiba o nome do funcionário e do departamento de todos os funcionários.


Resp:

    SELECT f.nome, d.descricao
    FROM funcionario f
    INNER JOIN departamento d ON f.cod = d.cod

    Nesta questão, usamos INNER JOIN para pegar da tabela departamento algo em comum que liga com a tabela funcionário, que no caso seria cod.

    output:
        nome                descrição 

        Fernanda            Departamento 8


2) Mostre todos os cargos dos funcionários lotados nos departamentos com sigla na CTB.


Resp:   

    SELECT f.cargo, d.sigla
    FROM funcionario f
    INNER JOIN departamento d ON f.cod = d.cod
    where d.sigla = 'DCT' or d.sigla = 'DCP';

    Aqui fiz basicamente a mesma coisa que o código anterior, porém com uma condição de busca no final


3) Mostre o número de alunos matriculados por disciplinas

Resp:

    SELECT disciplina.nome, COUNT(*) AS num_alunos_matriculados
    FROM aluno 
    INNER JOIN disciplina ON cod = disciplina.cod 
    GROUP BY disciplina.nome

    Usando o count eu consigo contar quantos alunos tem, que na minha tabela atual são 52 alunos ou 13 por disciplina.


4) Mostre o nome do funcionário e o nome do departamento dos funcionários que possuem um A em seus nomes.

Resp:

    select f.nome, d.descricao
    from funcionario f 
    inner join departamento d on f.cod = d.cod 
    where f.nome like '%A%'

    aqui eu vou usar novamente o inner join para pegar o nome e o departamento do funcionário, porém com os que tiverem A no nome. 

5) Faça uma consulta que retorne todos os funcionários que trabalham em departamentos situados no Rio de Janeiro e que o salario seja maior que R$ 1500,00.

Resp:

    

    