                    Produto Cartesiano
● Na Matemática, dados dois conjuntos X e Y, o produto cartesiano (ou
produto direto) dos dois conjuntos (escrito como X × Y) é o conjunto de todos
os pares ordenados cujo primeiro elemento pertence a X e o segundo, a Y.
● Ao adicionar tabelas na cláusula FROM estamos dizendo ao SGBD que
queremos o produto cartesiano!

SELECT [DISTINCT] {*,nomeColuna [as apelido]}
FROM nomeTabela1, nomeTabela2, nomeTabela3
[WHERE condição(ções)]
[GROUP BY {expr,expr, ...}]
[HAVING condições do grupo]
[ORDER BY {coluna, expr, ...} [ASC|DESC]];