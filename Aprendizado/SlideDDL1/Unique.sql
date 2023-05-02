                                UNIQUE
● A Coluna exige a existência de um valor único.

UNIQUE é uma restrição que pode ser aplicada a uma coluna ou conjunto de colunas em um banco de dados relacional. Essa restrição garante que cada valor na coluna ou conjunto de colunas seja único, ou seja, que nenhum registro na tabela contenha o mesmo valor para aquela coluna ou conjunto de colunas.

Aqui estão alguns exemplos de uso da restrição UNIQUE em um banco de dados:

    Em uma tabela de clientes, a coluna "E-mail" pode ser definida como UNIQUE. Isso garante que cada cliente tenha um e-mail único registrado na tabela, evitando que dois ou mais clientes tenham o mesmo e-mail.

    Em uma tabela de produtos, a coluna "Código de barras" pode ser definida como UNIQUE. Isso garante que cada produto tenha um código de barras único registrado na tabela, evitando que dois ou mais produtos tenham o mesmo código de barras.

    Em uma tabela de funcionários, o conjunto de colunas "CPF" e "RG" pode ser definido como UNIQUE. Isso garante que cada funcionário tenha um CPF e RG únicos registrados na tabela, evitando que dois ou mais funcionários tenham o mesmo CPF ou RG.

    Em uma tabela de pedidos, o conjunto de colunas "ID do cliente" e "Número do pedido" pode ser definido como UNIQUE. Isso garante que cada pedido tenha um número único para cada cliente registrado na tabela, evitando que dois ou mais pedidos tenham o mesmo número para um mesmo cliente.

    Em uma tabela de categorias de produtos, a coluna "Nome" pode ser definida como UNIQUE. Isso garante que cada categoria tenha um nome único registrado na tabela, evitando que duas ou mais categorias tenham o mesmo nome.

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
OU -> RG VARCHAR(10) UNIQUE,