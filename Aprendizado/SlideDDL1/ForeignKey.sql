                    Chave Estrangeira / Foreign Key


● A restrição de CHAVE ESTRANGEIRA ou FOREIGN KEY(FK) serve para garantir
que uma campo em uma tabela deve obrigatóriamente estar associado a um valor
existente em uma Chave Primária, (normalmente em outra tabela).

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


CREATE TABLE aluno_disciplina (
    matricula numeric(6),
    coddisciplina numeric(6),
    PRIMARY KEY (matricula, coddisciplina),
    FOREIGN KEY (matricula) REFERENCES aluno(matricula),
    FOREIGN KEY (coddisciplina) REFERENCES disciplina(cod)
)