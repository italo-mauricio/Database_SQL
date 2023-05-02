                        Segurança <> Integridade


● Segurança está relacionada a proteção dos dados contra o acesso
não autorizado
● Integridade está relacionada a proteção quanto a perda de
consistência.
● Garantia de segurança implica em Medidas de segurança que devem
ser tomadas em diversos níveis:

    – Físico
    – Humano
    – Sistema Operacional
    – SGBD


                        Restrições de Integridade
● Garantem que as mudanças feitas no banco de dados por usuários autorizados não
resultam em uma perda de consistência dos dados. Portanto as restrições protegem
contra danos acidentais no banco de dados.
● Chave Primária (PK) e Chave Estrangeira (FK)
● NOT NULL
● UNIQUE
● CHECK (CONDIÇÕES)

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