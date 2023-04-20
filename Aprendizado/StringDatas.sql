                               String de Caracteres e Datas
●
●
●
        As strings de caracteres e valores de data devem aparecer entre aspas simples. Os valores de caracteres fazem distinção entre maiúsculas e minúsculas e os valores de data devem estar dentro dos formatos exigidos pelo SGBD.

        O formato default (padrão), varia de SGBD para SGBD, sendo que o DBA pode mudar o valor default do SGBD e o desenvolvedor pode mudar o valor default da sessão.

        Exemplo: 

        SELECT *
        FROM aluno
        WHERE dtnascimento > '2000-01-01 00:00:00';