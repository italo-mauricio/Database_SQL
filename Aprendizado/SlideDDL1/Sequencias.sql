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