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

