Exercicio - Seleções (Projeção)


1) Selecione todos os registros das tabelas FUncionario:

Resp: SELECT * FROM FUncionario

2) Selecione somente a matricula e o nome dos registros da tabela Aluno:

Resp: SELECT matricula, nome FROM Aluno;

3) Na tabela Funcionario, selecione o código, o nome, o salario atual e o salário
atual + 10 %, colocando o apelido/alias nesta ultima coluna de “novosalario”:

Resp: INSERT INTO funcionario (cod, nome, cargo, dtcontratacao, codgerente, salarioatual)
VALUES (3, 'Pedro', 'Suporte de TI', '2022-05-02', 'G02', 10000);

SELECT cod, nome, cargo, dtcontratacao, codgerente, salarioatual, salarioatual * 1.1 AS novosalario
FROM funcionario;

INSERT INTO funcionario (cod, nome, cargo, dtcontratacao, codgerente, salarioatual)
VALUES (3, 'Italo', 'Analista de TI', '2022-11-03', 'G03', 5000);

Output:   cod    nome       cargo       dtcontratacao  codgerente  salarioatual  novosalario 
        |  3  |  Pedro | Suporte de TI  |   2022-05-02  |  G02     |    10000    |   11000

        cod    nome       cargo       dtcontratacao  codgerente  salarioatual  novosalario 
        |  4  |  Italo | Analista de TI |   2022-11-03  |  G03     |    5000     |   5500

4) Selecione a coluna sigla na tabela Departamento, sem repetir registros
iguais.


Resp: SELECT DISTINCT sigla FROM Departamento;  

Com o uso do DISTINCT eu consigo especificar o que eu quero na tabela

Output:   sigla
        DCQ
        DCE
        DCW
        DCT
        DCA 
        DCP
        DCI 
        DCY
        DCU 
        DCO                       