                            Bloqueio (Lock)
● Quando um registro esta sendo alterado por uma transação, o SGBD irá bloquear o seu acesso para uma segunda alteração.
– INSERT, UPDATE e DELETE exigem o controle por LOCK
– O bloqueio só será liberado após um commit ou rollback
– O bloqueio permitirá que outras transações leiam as informações
– O SGBD usa estratégias para controlar bloqueio de novas alterações:

Bloquear a tabela toda! (Primeiros SGBDs utilizavam este recurso)
● Bloquear um conjunto de linhas próximas (páginas)! (Melhorando desempenho)
● Bloquear apenas a linha afetada pelo comando! (Melhor desempenho e a Abordagem + usada hoje em dia)
● Bloquear as colunas afetadas! (útil apenas nos updates, poucos SGBDs implementam)