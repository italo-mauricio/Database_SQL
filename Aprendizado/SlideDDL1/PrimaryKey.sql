                    Chave Primaria/Primary Key
● A restrição de CHAVE PRIMÁRIA ou PRIMARY KEY serve para
garantir a identificação única de um registro dentro de uma tabela.
● Uma Chave Primária Composta é uma Chave que contém mais de uma Coluna da mesma Tabela.

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

- Chaves Primárias não aceitam valores Null