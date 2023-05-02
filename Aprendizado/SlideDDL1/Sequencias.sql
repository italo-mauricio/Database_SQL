                                Sequências

● Gera números exclusivos automaticamente
● Geralmente usado para criar um valor de chave primária.
● Bem mais flexível que o tipo Serial
● Objeto separado da Tabela
● Sintaxe básica:
– CREATE SEQUENCE nomeSequencia;

Como usar:
– nextval('nomeSequencia'); -- Retorna novo/próximo valor
– currval('nomeSequencia'); -- Retorna valor atual

● currval só pode ser chamado após o nextval ser invocado.

CREATE SEQUENCE seqAluno; -> seta1
INSERT INTO aluno (matricula,nome)
VALUES (NEXTVAL('seqAluno'),'BEBETO');

-> seta1 select NEXTVAL('seqAluno');

dblucianomertins=> CREATE SEQUENCE seqAluno;
CREATE SEQUENCE
dblucianomertins=> select NEXTVAL('seqAluno');      CREATE SEQUENCE seqDepartamento;
nextval
---------
1
(1 row)
dblucianomertins=> select NEXTVAL('seqAluno');      CREATE TABLE departamento(
                                                        cod numeric(6) default nextval('seqDepartamento'),
                                                        descricao varchar(200),
                                                        sigla varchar(100),
                                                        PRIMARY KEY (cod));
nextval
---------
2
(1 row)
dblucianomertins=> select NEXTVAL('seqAluno');      
nextval
---------                                           
3
(1 row)
dblucianomertins=>                                    

INSERT INTO departamento (descricao,sigla) VALUES ('VENDAS','VND');


