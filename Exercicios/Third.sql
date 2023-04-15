# Desafio 3

/*  
    Um usuário chamado Peter Krebs está devendo um pagamento, consiga o email dele para que possamos enviar uma cobrança (você vai ter que usar a tabela person.person e depois a tabela person.emailaddress)

*/

SELECT *
FROM Person.Person
WHERE FirstName = 'peter' and LastName = 'Krebs'

SELECT *
FROM person.EmailAddress
WHERE BusinessEntityID = 26

/* Ele vai retornar no banco de dados o nome dele com a localização do email para efetuar a cobrança. */