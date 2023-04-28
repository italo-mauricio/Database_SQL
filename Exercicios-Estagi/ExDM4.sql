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
    






