                                    NOT NULL
● A coluna não aceita valores NULL

NOT NULL é uma restrição que pode ser aplicada a uma coluna em um banco de dados relacional. Essa restrição garante que a coluna não aceite valores nulos, ou seja, que toda inserção ou atualização de dados para aquela coluna contenha um valor válido.

A seguir, alguns exemplos de uso da restrição NOT NULL em um banco de dados:

    Em uma tabela de clientes, a coluna "Nome" pode ser definida como NOT NULL. Isso garante que todos os clientes tenham um nome válido registrado, evitando que registros inválidos sejam inseridos na tabela.

    Em uma tabela de pedidos, a coluna "Data do pedido" pode ser definida como NOT NULL. Isso garante que todos os pedidos tenham uma data válida registrada, evitando que registros inválidos sejam inseridos na tabela.

    Em uma tabela de funcionários, a coluna "Data de admissão" pode ser definida como NOT NULL. Isso garante que todos os funcionários tenham uma data de admissão válida registrada, evitando que registros inválidos sejam inseridos na tabela.

    Em uma tabela de notas de alunos, a coluna "Nota" pode ser definida como NOT NULL. Isso garante que todas as notas tenham um valor válido registrado, evitando que notas nulas ou vazias sejam inseridas na tabela.

    Em uma tabela de produtos, a coluna "Preço" pode ser definida como NOT NULL. Isso garante que todos os produtos tenham um preço válido registrado, evitando que registros inválidos sejam inseridos na tabela.

CREATE TABLE FUNCIONARIO (
    COD NUMERIC(8),
    NOME VARCHAR(200) NOT NULL,
    CARGO VARCHAR(200),
    DTCONTRATACAO TIMESTAMP,
    RG VARCHAR(10),
    ATIVO CHAR(1) NOT NULL DEFAULT 'S',
    CODGERENTE NUMERIC(8),
    SALARIO NUMERIC(12,2),
    CODDEPARTAMENTO NUMERIC (6),
    PRIMARY KEY (COD),
    FOREIGN KEY (CODDEPARTAMENTO) REFERENCES DEPARTAMENTO(COD),
    FOREIGN KEY (CODGERENTE) REFERENCES FUNCIONARIO(COD),
    UNIQUE (RG),
    CHECK ( ATIVO = 'S' OR ATIVO = 'N') );