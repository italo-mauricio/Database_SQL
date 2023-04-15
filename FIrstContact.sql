// Exemplos

SELECT *
FROM person.Person;

SELECT Title
FROM person.Person;

SELECT *
FROM person.EmailAddress;

SELECT firstName, lastName
FROM Person.Person;


/*
Essas são consultas em SQL (Structured Query Language) que acessam informações armazenadas em um banco de dados.

A primeira consulta, "SELECT * FROM person.Person", seleciona todas as colunas da tabela "Person" no esquema "person". Isso significa que serão retornados todos os registros de pessoas presentes na tabela, incluindo informações como nome, endereço, data de nascimento, entre outros.

A segunda consulta, "SELECT Title FROM person.Person", seleciona apenas a coluna "Title" da tabela "Person". Nesse caso, apenas os títulos das pessoas serão retornados, como "Mr.", "Mrs.", "Miss.", entre outros.

A terceira consulta, "SELECT * FROM person.EmailAddress", seleciona todas as colunas da tabela "EmailAddress" no esquema "person". Essa tabela contém informações sobre os endereços de e-mail das pessoas presentes na tabela "Person". Portanto, serão retornados todos os registros de endereços de e-mail, incluindo informações como endereço de e-mail, tipo de endereço (pessoal ou profissional) e o ID da pessoa associada a cada endereço.

A quarta consulta, "SELECT firstName,middleName,lastName FROM Person.Person", seleciona apenas as colunas "firstName", "middleName" e "lastName" da tabela "Person". Nesse caso, apenas as informações de nome das pessoas serão retornadas, sem incluir outras informações como endereço ou data de nascimento.

Cada uma dessas consultas pode ser usada para obter informações específicas do banco de dados, de acordo com as necessidades de cada usuário.

*/