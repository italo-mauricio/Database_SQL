Usando o tipo "serial":

O tipo "serial" é um tipo de dados do PostgreSQL que pode ser usado para criar uma coluna de chave primária que gera automaticamente valores exclusivos e sequenciais. Quando uma nova linha é adicionada à tabela, o valor da coluna serial é gerado automaticamente pelo sistema.

Por exemplo:


CREATE TABLE Livro (
    cod SERIAL PRIMARY KEY,
    titulo VARCHAR(100),
    descricao VARCHAR(300),
    preco NUMERIC(10,2)
);


Ambas as opções são válidas e oferecem o mesmo resultado. O uso de sequências pode ser mais flexível, pois as sequências podem ser reutilizadas em outras tabelas, mas o uso do tipo "serial" é mais simples e prático.