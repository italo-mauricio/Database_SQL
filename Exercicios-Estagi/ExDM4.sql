                        Exercícios


1) Crie uma consulta para exibir a data atual:

Resp:

        select current_date 

output:

        2023-04-27

2) Crie uma consulta para informar o dia da semana atual (segunda, terça, quarta):

Resp:

    SELECT extract(day from CURRENT_DATE) as dia, extract(MONTH FROM CURRENT_DATE) as mes, EXTRACT(YEAR FROM CURRENT_DATE) as ano;

    Dessa forma eu consigo extrair o dia, mês e ano atuais.

output:

            dia      mês    ano 
            27         4    2023

3) Exiba o código do funcionário, o nome, o salário e o aumento salarial de 15% expresso como número inteiro:

Resp:

    SELECT cod, nome, salarioatual, CAST(salarioatual * 1.15 AS INTEGER) AS novo_salario
    FROM funcionario;

output:

    cod         nome        salarioatual        novosalario 

    1           joao            3000                3450
    2           italo           10000               11500
    3           pedro           5000                5750

4) Adicione a consulta anterior uma coluna que conterá o salário novo menos o salário antigo:

Resp:

    SELECT cod, nome, salarioatual, 
    CAST(salarioatual * 1.15 AS INTEGER) AS novo_salario,
    CAST(salarioatual * 0.15 AS INTEGER) AS aumento,
    CAST(salarioatual * 1.15 - salarioatual AS INTEGER) AS diferenca
    FROM funcionario;

output:

    cod       nome     salarioatual     novo_salario      aumento      diferença 
    
    1         João         3000             3450            450          450

5) Exiba o nome do funcionário, a data de admissão e a data de efetivação, que é seis meses após a admissão.

Resp:

    SELECT nome, dtcontratacao,
    DATE_TRUNC('month', dtcontratacao) + INTERVAL '6 month' 
        + (dtcontratacao - DATE_TRUNC('month', dtcontratacao)) AS data_efetivacao
    FROM funcionario;

output:

    nome                dtcontratacao           data_efetivacao

    joao                 2022-01-01                2022-07-01
    italo                2022-05-02                2022-11-02
    pedro                2021-10-03                2022-04-03

6) Para cada funcionário exiba o nome do mesmo e calcule o número de meses entre a hoje e a sua data de admissão. Ordene a consulta pelo número de meses. Arredonde para inteiro o número de meses. 

Resp:

    SELECT nome, 
       ROUND(DATE_PART('year', AGE(NOW(), dtcontratacao)) * 12 
             + DATE_PART('month', AGE(NOW(), dtcontratacao))) AS meses_trabalhados
    FROM funcionario
    ORDER BY meses_trabalhados;

output:

    nome                meses_trabalhados

    italo                   11
    pablo                   14
    amanda                  18

7) Crie uma consulta que produza a seguinte frase: O <nomefunc> recebe R$ <salario> mensalmente, mas deseja receber <salário * 4>. Coloque um label de “sonho” a coluna.

Resp:

    SELECT CONCAT('O ', nome, ' recebe R$ '	, salarioatual, ' mensalmente, mas tenho o sonho de receber ', salarioatual*4, '.00. ') AS sonho
    FROM funcionario;

output:

    O italo recebe R$ 10.000 mensalmente mas sonha em receber 40.000

8) Faça um select, que retorne o nome do funcionário com a primeira letra em maiúscula e o número de letras que o nome contem. Para todos os funcionários cujos os nomes começam com J ou M. Coloque em ordem decrescente pelo número de letras:

Resp:

    SELECT CONCAT(UPPER(LEFT(nome, 1)), LOWER(SUBSTRING(nome, 2))) AS nome_maiusculo, LENGTH(nome) AS numero_letras
    FROM funcionario
    WHERE nome LIKE 'J%' OR nome LIKE 'M%'
    ORDER BY numero_letras DESC;

    CONCAT(UPPER(LEFT(nome, 1)), LOWER(SUBSTRING(nome, 2))): essa função concatena a primeira letra do nome em maiúsculo com o restante em minúsculo, para que o nome fique com a primeira letra maiúscula e o restante minúsculo.
    LENGTH(nome): essa função retorna o número de caracteres do nome.
    WHERE nome LIKE 'J%' OR nome LIKE 'M%': essa cláusula filtra os nomes que começam com "J" ou "M".
    ORDER BY numero_letras DESC: essa cláusula ordena os resultados em ordem decrescente pelo número de letras do nome.


9) Exiba a admissão e o dia (segunda, terça, quarta, ...) em que o funcionário começou a trabalhar. Ordene pelo dia da semana.

Resp:

    SELECT dtcontratacao, to_char(dtcontratacao, 'Day') AS dia_semana
    FROM funcionario,
    ORDER BY dia_semana;

    to_char(data_admissao, 'Day'): essa função formata a data de admissão como uma string que inclui o dia da semana (segunda-feira, terça-feira, etc.).
    ORDER BY dia_semana: essa cláusula ordena os resultados pelo dia da semana, em ordem crescente.

output:

    dtcontratacao               dia_semana

    2021-06-11                   Friday
    2021-01-11                   Monday

10) Faça uma consulta pelo nome do aluno e o telefone, informando “Sem telefone”, para os alunos em que o telefone é null.


Resp: 

    SELECT nome, CONCAT('Sem telefone', telefone) AS telefone
    FROM aluno
    WHERE telefone IS NULL;

    A cláusula SELECT seleciona as colunas "nome" e "telefone".
    A função CONCAT é usada para concatenar a string "Sem telefone" com o valor nulo da coluna "telefone". Isso irá resultar na exibição da mensagem "Sem telefone" para as linhas em que o telefone é nulo.
    A cláusula FROM especifica a tabela "alunos".
    A cláusula WHERE filtra apenas as linhas em que a coluna "telefone" é nula.

output:

    nome                telefone 

    PEDRO MENEZES       Sem telefone

11) Faça uma consulta que exiba o nome do funcionário e a quantia de salário através de asteriscos. Cada asterisco representa R$ 100,00. Coloque em ordem decrescente de salário.
    
Resp:

    SELECT nome, REPEAT('*', CAST(salarioatual/100 AS INTEGER)) as salario_asteriscos
    FROM funcionario
    ORDER BY salarioatual DESC;

    Nesta consulta, utilizamos a função CAST() para converter o resultado da divisão do salário por 100 (que é um valor numérico) em um valor inteiro. Em seguida, passamos esse valor para a função REPEAT() para repetir o caractere asterisco (*) a quantidade de vezes correspondente ao valor do salário dividido por 100. Os resultados são ordenados em ordem decrescente com base no salário.

output:

    nome                salario_asteriscos

    João                ******************************     João ganha 3 mil reais


12) Exiba o nome do aluno e a faixa de idade dele. De acordo com a seguinte especificação.
            0-18 = Categoria A
            19-30 = Categoria B
            31-61 = Categoria C
            Maior 61 = Categoria D

Resp: 

        select nome,
        case
            when idade <= 18 then 'Categoria A'
            when idade <= 30 then 'Categoria B'
            when idade <= 61 then 'Categoria C'
            else 'Categoria D'
        end as faixa_etaria
        from aluno;

13) Exiba o maior salário, o médio, o menor e a soma de todos os salários de todos os funcionários.

Resp:

    select max(salarioatual) as maior_salario, min(salarioatual) as menor_salario,
    avg(salarioatual) as medio_salario, sum(salarioatual) as soma_salario
    from funcionario f;

    Esta consulta irá selecionar as funções MAX, MIN, AVG e SUM da tabela "funcionarios" e renomeá-las para "maior_salario", "menor_salario", "media_salario" e "total_salario", respectivamente.

output:

    maior_salario    menor_salario   media_salario    soma_salario

    240.000             3.000           28.000          376.000

14) Arredonde os resultados da consulta anterior para números inteiros.

Resp:

    SELECT CAST(MAX(salarioatual) AS INTEGER) AS maior_salario, 
       CAST(MIN(salarioatual) AS INTEGER) AS menor_salario, 
       CAST(AVG(salarioatual) AS INTEGER) AS medio_salario, 
       CAST(SUM(salarioatual) AS INTEGER) AS soma_salario
    FROM funcionario f;

    outro método para versão mais recente do postgresql:

    SELECT MAX(salarioatual)::INTEGER AS maior_salario, 
       MIN(salarioatual)::INTEGER AS menor_salario, 
       AVG(salarioatual)::INTEGER AS medio_salario, 
       SUM(salarioatual)::INTEGER AS soma_salario
    FROM funcionario f;


15) Selecione o número de funcionários totais e o número de funcionários que possuem gerentes.

Resp:
        select 
            COUNT(*) as total_funcionarios,
            COUNT(distinct codgerente) as total_gerentes
        from funcionario f;

        Nesta consulta, a função COUNT(*) é utilizada para contar o número total de funcionários na tabela "funcionario", e a função COUNT(DISTINCT gerente) é utilizada para contar o número de funcionários que possuem um gerente. A cláusula DISTINCT é utilizada para evitar que um mesmo gerente seja contado mais de uma vez, caso tenha mais de um funcionário sob sua supervisão.

output:

    total_funcionarios           total_gerentes
        13                           11







