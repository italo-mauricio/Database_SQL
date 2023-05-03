                  Valores Default nas Colunas das Tabelas


● Podemos definir valores nas colunas, para quando não colocarmos explicitamente algum valor, o próprio banco de dados irá colocar um valor default (padrão).

Exemplo: 

CREATE TABLE aluno (
    matricula NUMERIC(6),
    nome VARCHAR(200),
    email VARCHAR(100) DEFAULT 'NÃO POSSUI EMAIL',
    telefone NUMERIC(10),
    idade NUMERIC(3),
    dtnascimento timestamp,
    cidade VARCHAR(100),
    PRIMARY KEY (matricula));
    INSERT INTO aluno (matricula,nome)
    VALUES (5643,'DUNGA');

    INSERT INTO aluno (matricula,nome)
    VALUES (5643,'DUNGA');