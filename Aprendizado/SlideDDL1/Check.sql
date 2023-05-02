                    CHECK
● Valida o campo de acordo com regras especificadas.
● Sempre que a coluna receber uma inserção ou alteração, o banco vai
antes testar a condição. Somente no caso da condição ser
VERDADEIRA é que a operação ira acontecer.

CHECK é uma restrição que pode ser aplicada a uma coluna em um banco de dados relacional. Essa restrição permite que você defina uma expressão booleana que deve ser verdadeira para cada registro que é inserido ou atualizado na tabela.

Aqui estão alguns exemplos de uso da restrição CHECK em um banco de dados:

    Em uma tabela de alunos, a coluna "Idade" pode ser definida como CHECK (Idade >= 18). Isso garante que todos os alunos registrados na tabela tenham 18 anos ou mais.

    Em uma tabela de produtos, a coluna "Preço" pode ser definida como CHECK (Preço > 0). Isso garante que todos os produtos registrados na tabela tenham um preço maior que zero.

    Em uma tabela de pedidos, a coluna "Data do pedido" pode ser definida como CHECK (Data do pedido >= '2023-01-01'). Isso garante que todos os pedidos registrados na tabela tenham uma data de pedido a partir de 2023.

    Em uma tabela de usuários, a coluna "Senha" pode ser definida como CHECK (LEN(Senha) >= 8). Isso garante que todas as senhas registradas na tabela tenham pelo menos 8 caracteres.

    Em uma tabela de produtos, a coluna "Categoria" pode ser definida como CHECK (Categoria IN ('Eletrônicos', 'Roupas', 'Acessórios')). Isso garante que todos os produtos registrados na tabela tenham uma categoria válida, que deve ser uma das três categorias especificadas.

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
    CHECK ( ATIVO = 'S' OR ATIVO = 'N'));