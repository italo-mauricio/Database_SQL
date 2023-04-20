# SQL Aula 10 LIKE

Vamos dizer que você quer encontrar uma pessoa no banco de dados que você sabe que o nome dela era ovi... alguma coisa


SELECT *
FROM person.person
WHERE FirstName like 'ovi%'    caso você só lembra do inicio
WHERE FirstName like '%to'     caso você só lembra do final
WHERE FirstName like '%essa%'   caso você só lembra do nome do meio
WHERE FirstName like '%ro_'    caso você quer só a substituição de 1 caractere