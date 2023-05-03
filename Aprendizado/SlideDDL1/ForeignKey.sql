                    Chave Estrangeira / Foreign Key


● A restrição de CHAVE ESTRANGEIRA ou FOREIGN KEY(FK) serve para garantir
que uma campo em uma tabela deve obrigatóriamente estar associado a um valor
existente em uma Chave Primária, (normalmente em outra tabela).

A foreign key é uma restrição de integridade referencial em um banco de dados que estabelece uma relação entre duas tabelas, garantindo que as informações inseridas em uma tabela sejam consistentes com as informações de outra tabela. Aqui estão alguns exemplos do uso de foreign key em banco de dados:

    Em uma tabela de pedidos, a coluna "ID do cliente" pode ser definida como uma foreign key que referencia a chave primária da tabela de clientes. Isso garante que cada pedido seja associado a um cliente válido, evitando que pedidos sejam registrados para clientes que não existem na tabela de clientes.

    Em uma tabela de produtos, a coluna "ID do fornecedor" pode ser definida como uma foreign key que referencia a chave primária da tabela de fornecedores. Isso garante que cada produto seja associado a um fornecedor válido, evitando que produtos sejam registrados para fornecedores que não existem na tabela de fornecedores.

    Em uma tabela de notas de alunos, a coluna "ID do aluno" pode ser definida como uma foreign key que referencia a chave primária da tabela de alunos. Isso garante que cada nota seja associada a um aluno válido, evitando que notas sejam registradas para alunos que não existem na tabela de alunos.

    Em uma tabela de funcionários, a coluna "ID do gerente" pode ser definida como uma foreign key que referencia a chave primária da tabela de funcionários. Isso permite que a estrutura de gerenciamento seja definida em uma única tabela, garantindo que cada gerente seja um funcionário válido.

    Em uma tabela de produtos pedidos, as colunas "ID do pedido" e "ID do produto" podem ser definidas como foreign keys que referenciam as chaves primárias das tabelas de pedidos e produtos, respectivamente. Isso garante que cada produto pedido seja associado a um pedido válido e a um produto válido, evitando que produtos sejam registrados para pedidos ou produtos que não existem nas respectivas tabelas.

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