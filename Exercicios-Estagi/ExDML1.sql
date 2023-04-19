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

5) Selecione a descricao e a sigla na tabela Departamento, sem repetir
registros iguais. Apelide a coluna descricao de “nomedepartamento” e sigla
de “codigoreduzido”:

Resp: SELECT DISTINCT descricao AS nomedepartamento, sigla AS codigoreduzido FROM Departamento;

Em resumo, eu retirei a redudância da tabela, pegando apenas a sigla e o nome do departamento sem repetições;

Output:    nomedepartamento              codigoreduzido

            Departamento 4                    DCA 
            Departamento 5                    DCU 
            Departamento 10                   DCO 
            Departamento 7                    DCI 
            Departamento 8                    DCT 
            Departamento 9                    DCB 
            Departamento 3                    DCP 
            Departamento 2                    DCM 
            Departamento 1                    DCN 

6) Selecione todas as idades dos alunos, sem repeti-las:

Resp: SELECT DISTINCT idade FROM aluno;

Desta forma ele mostrará todas as idades sem repetilás.

Output:      idade 

              NULL
              23
              27
              25
              28

7) Selecione a matricula, o nome, a idade e a idade + 2 apelidando esta ultima
coluna de “provavel_idade_formado”:

Resp: SELECT matricula, nome, idade, idade + 2 AS provavel_idade_formado FROM aluno;

Output:  matricula     nome       idade      provavel_idade_formado
        188.988        Italo       23                25
        193.948        Pedro       23                25
        198.962        Bianca      23                25
        123.444        Joaquin     23                25
        154.983        Carlos      23                25
        143.982        Amanda      23                25
        183.954        Anna        23                25
        138.943        Bruna       23                25

8) Faça retornar o seguinte texto oriundo da tabela Aluno
Aluno: xxxxxx nascido em: xxxxx estará com a idade aproximada de xx ao
se formar!




