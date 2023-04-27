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

4) Adicione a consulta anterior uma coluna que conterá o salário novo menos o salário antigo



