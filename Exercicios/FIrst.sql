#Desafio 1

/* 
    A equipe de produção de produtos precisa do nome de todas as peças que pesam mais que 500kg mas não mais que 700kg para inspeção -- weight

*/

# Resposta 

SELECT Name 
FROM production.Product
WHERE weight > 500 and weight < 700;


/* 
    A saida vai me retorna no banco de dados todos os produtos com peso entre 500 e 700 kg.

*/