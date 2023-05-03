                                    Exercícios
Dica 1: No jargão da informática, atualizar significa modificar dados da tabela. Que comando utilizar?
Dica 2: Em cada questão, separe o que é PROJEÇÃO e o que é SELEÇÃO, para então montar o comando.


1) Selecione todos os alunos que não possuem telefone e coloque em alguns a informação do telefone:


Resp:   select * 
        from aluno
        where telefone is null;    verifico quais são null na tabela 

        update aluno
        set telefone = '213232312'
        where telefone is null;    caso eu queria colocar um telefone em todos que são null eu uso esta linha

        update aluno
        set telefone = '111111'
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

6) Exiba o nome e o salário de todos os funcionários cujos salários não estejam na faixa entre R$ 950,00 e R$ 2300,00.

Resp: 
        SELECT nome, salarioatual
        FROM funcionario
        WHERE salarioatual BETWEEN 950 AND 2500      ele vai me retornar só os funcionarios nesta faixa salarial

7) Exiba o nome do funcionário. o cargo e a data dos funcionários admitidos entre 20 de fevereiro de 2004 e 1 de maio de 2007.

Resp:   
        select f.nome, f.cargo, f.dtcontratacao
        from funcionario f 
        where dtcontratacao between '2004-01-20' and '2007-05-01'

8) Exiba o nome do funcionário e o número do departamento de todos os funcionários dos departamentos 10 e 30, por ordem alfabética de nome.

Resp:

        SELECT f.nome, d.cod AS numero_departamento
        FROM funcionario f
        INNER JOIN departamento d ON f.cod = d.cod
        WHERE d.descricao IN ('Departamento 10', 'Departamento 5', 'Departamento 2', 'Departamento 4')
        ORDER BY f.nome ASC;

        Explicação:

            Esse código é uma consulta SQL que retorna o nome dos funcionários e o número do departamento em que trabalham.

            A primeira linha SELECT especifica que você deseja recuperar duas colunas: o nome do funcionário (f.nome) e o número do departamento (d.cod).

            A partir da segunda linha, a consulta usa a cláusula FROM para especificar que a tabela funcionário (f) e a tabela departamento (d) devem ser combinadas usando a cláusula INNER JOIN. A condição de junção é que o código do funcionário (f.cod) deve ser igual ao código do departamento (d.cod).

            A cláusula WHERE é usada para filtrar os resultados da consulta. Neste caso, a condição é que a descrição do departamento (d.descricao) deve ser uma das seguintes: 'Departamento 10', 'Departamento 5' ou 'Departamento 2'.

            Finalmente, a consulta é ordenada em ordem crescente pelo nome do funcionário, usando a cláusula ORDER BY.

            Resumindo, esta consulta SQL retorna uma lista de funcionários que trabalham em um dos departamentos especificados ('Departamento 10', 'Departamento 5', 'Departamento 2'), juntamente com o número do departamento em que cada funcionário trabalha, ordenados por nome do funcionário.

9) Liste o nome e o salário dos funcionários que recebem mais de R$ 1500,00 e que estão nos departamentos 10 ou 30. Nomeie as colunas Nome e Salário, para Funcionário e Salário do Mês.

Resp: 

    SELECT f.nome as funcionario, f.salarioatual AS "Salário do Mês"
    FROM funcionario f 
    JOIN departamento d  ON f.cod = d.cod
    WHERE f.salarioatual > 1500
    AND d.cod BETWEEN 1 AND 30

    output:  funcionario        Salario do Mês

                joão                3.000
                italo               10.000
                pedro               5.000
                amanda              8.000

10) Exiba o nome e a data de admissão de cada funcionário admitido em 2004:

Resp: 
        SELECT nome, dtcontratacao
        FROM funcionarios
        WHERE EXTRACT(YEAR FROM dtcontratacao) = 2004;    Em algumas versões do PostGreSQL não suportam "WHERE YEAR()" por isso deve-se usar o EXTRACT nesse caso.

11) Exiba o nome e o cargo de cada funcionário que não possua gerente

Resp:
        SELECT nome, cargo
        FROM funcionario
        WHERE cargo IS NULL;     ele irá verificar se o código de gerente do funcionário existe ou não.

12) Exiba os nomes de todos os funcionários que possuem um A na segunda letra de seus nomes

Resp: 
        SELECT nome
        FROM funcionario
        WHERE LOWER(SUBSTRING(nome FROM 2 FOR 1)) = 'a';

13) Exiba todos os funcionários que possuem duas letras A em seus nomes e estão no departamento 30 ou seu gerente seja o 7529, ordenado pelo código do departamento de forma decrescente;

Resp:   
        SELECT f.*
        FROM funcionario f
        INNER JOIN departamento d ON f.cod = d.cod
        WHERE (f.nome LIKE '%a%a%' AND f.cod = 30) OR f.codgerente = '7529'
        ORDER BY d.cod DESC;

        Explicação:

        SELECT f.*: seleciona todas as colunas da tabela funcionarios.
        FROM funcionarios f: especifica a tabela funcionarios como a fonte dos dados e atribui o alias "f" a ela.
        INNER JOIN departamento d ON f.coddept = d.cod: junta a tabela funcionarios com a tabela departamento usando a coluna coddept da tabela funcionarios e a coluna cod da tabela departamento. Isso nos permite acessar a coluna cod na cláusula ORDER BY.
        WHERE (f.nome LIKE '%a%a%' AND d.cod = 30) OR f.codgerente = 7529: filtra os resultados para incluir apenas os funcionários que possuem duas letras "A" em seus nomes e estão no departamento 30 ou cujo código de gerente seja 7529.
        f.nome LIKE '%a%a%': a cláusula LIKE é usada para verificar se o nome contém duas letras "A".
        d.cod = 30: a condição para o departamento é aplicada à tabela departamento.
        f.codgerente = 7529: verifica se o código do gerente é 7529.
        ORDER BY d.cod DESC: ordena os resultados pelo código do departamento em ordem decrescente.

14) Premie, aumentando o salário em R$ 300,00, de todos os funcionários que ganham menos de R$ 700,00:

Resp:
        UPDATE funcionario
        SET salarioatual = salarioatual + 300.00
        WHERE salarioatual < 700.00;

        Explicação:

        Utilizando UPDATE estou falando para o SQL que irei atualizar algo na tabela funcionario, o SET eu irei fazer o cálculo, pegando salario atual = salario atual + 300.00, e WHERE irei fazer a condicional, caso o salario atual for menor que 700 reais.

15) De um aumento de 15% aos funcionários do departamento 20:

Resp:   
        UPDATE funcionario
        SET salarioatual = salarioatual * 1.15
        WHERE coddept = 20;



    
    


