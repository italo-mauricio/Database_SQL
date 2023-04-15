#Desafio 2

/* 
    Foi pedido pelo marketing uma relação de todos os empregados (employees) que são casados(single = solteiro, maried = casado) e são assalariados (salaried)
*/

SELECT *
FROM HumanResources Employees
WHERE MaritalStatus = 'm' AND SalariedFlag = true;

/*  

    Ele vai retornar os funcionários casados e assalariados do banco de dados

*/