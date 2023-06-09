                            Operações de Conjuntos



● As operações de conjunto podem ser aplicadas
sobre diversos selects!

● A única restrição é que as consultas devem ter a
mesma quantidade e mesmo tipo de campos como
retorno para efetuar esses comandos.


● As operações são:

    ● União – UNION
    ● Interseção – INTERSECT
    ● Diferença – EXCEPT ou MINUS



                    Union

● Retorna a união de dois ou mais conjuntos.

 - UNION – remove as linhas duplicadas
 - UNION ALL – não remove as linhas duplicadas

● Sintaxe

    SELEÇÃO1
    UNION [ALL]
    SELEÇÃO2;


conjunto1:
    cod         valor 
    1            a 
    3            b 

conjunto2: 
    código      descrição 
    12           a 
    1            c 
    5            d  


SELECT valor
FROM conjunto1
UNION
SELECT descricao
FROM conjunto2;   ->   valor
                        a
                        b 
                        c 
                        d 

SELECT valor
FROM conjunto1
UNION ALL
SELECT descricao
FROM conjunto2      ->  valor 
                        a 
                        b
                        a  
                        c 
                        d

SELECT cod,valor
FROM conjunto1
UNION
SELECT codigo,descricao
FROM conjunto2;     ->  cod  valor 
                         1     a 
                         1     c 
                         3     b 
                         5     d 
                         12    a
                        



                 INTERSECT

● Retorna apenas os elementos idênticos       


conjunto1:
    cod         valor 
    1            a 
    3            b 

conjunto2: 
    código      descrição 
    12           a 
    1            c 
    5            d  

SELECT valor
FROM conjunto1
INTERSECT
SELECT descricao
FROM conjunto2;   ->   valor 
                        a 

SELECT cod,valor
FROM conjunto1
INTERSECT
SELECT codigo,descricao
FROM conjunto2;   ->   vazio 


                Except

- Elimina do primeiro conjunto, os valores também existentes no
segundo conjunto.


conjunto1:
    cod         valor 
    1            a 
    3            b 
    6            d 
    8            c 
    9            e 


conjunto2: 
    código      descrição 
    12           a 
    1            c 
    5            d  

SELECT valor
FROM conjunto1
EXCEPT
SELECT descricao
FROM conjunto2;  ->  valor 
                       c 
                       e 

SELECT cod,valor
FROM conjunto1
EXCEPT
SELECT codigo,descricao
FROM conjunto2;  ->  cod     valor      
                      1       a  
                      3       b 
                      6       d 
                      8       c 
                      9       e 
                        



