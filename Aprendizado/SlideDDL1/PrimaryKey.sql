                    Chave Primaria/Primary Key
● A restrição de CHAVE PRIMÁRIA ou PRIMARY KEY serve para
garantir a identificação única de um registro dentro de uma tabela.
● Uma Chave Primária Composta é uma Chave que contém mais de uma Coluna da mesma Tabela.

A primary key é uma restrição de integridade de dados em um banco de dados que garante que cada registro na tabela tenha um valor exclusivo para a coluna designada como chave primária. Aqui estão alguns exemplos do uso de primary key em banco de dados:

    Em uma tabela de clientes, a coluna "ID do cliente" pode ser definida como chave primária. Isso garante que cada cliente tenha um ID exclusivo, que pode ser usado para acessar facilmente informações sobre o cliente em outras tabelas relacionadas.

    Em uma tabela de pedidos, a coluna "Número do pedido" pode ser definida como chave primária. Isso garante que cada pedido tenha um número exclusivo, permitindo que os usuários pesquisem e modifiquem facilmente informações sobre um pedido específico.

    Em uma tabela de produtos, a combinação das colunas "Código do produto" e "ID do fornecedor" pode ser definida como chave primária composta. Isso garante que cada produto tenha um código exclusivo dentro de um fornecedor específico, permitindo que os usuários pesquisem e modifiquem facilmente informações sobre um produto específico.

    Em uma tabela de funcionários, a coluna "ID do funcionário" pode ser definida como chave primária. Isso garante que cada funcionário tenha um ID exclusivo, permitindo que os usuários pesquisem e modifiquem facilmente informações sobre um funcionário específico.

    Em uma tabela de alunos, a combinação das colunas "Número de matrícula" e "ID do curso" pode ser definida como chave primária composta. Isso garante que cada aluno tenha um número de matrícula exclusivo em um curso específico, permitindo que os usuários pesquisem e modifiquem facilmente informações sobre um aluno específico em um curso específico.
    
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