                            Introdução a Transações


● SGBDs são em geral multi-usuários
– processam simultaneamente operações disparadas por vários
usuários
    deseja-se alta disponibilidade e tempo de resposta pequeno

– execução intercalada de conjuntos de operações

exemplo: enquanto um processo X faz I/O, outro processo Y é
selecionado para execução

● Operações são chamadas transações

● Unidade lógica de processamento em um SGBD

● Composta de uma ou mais operações que incluem,
excluem ou alteram as informações das tabelas.
     – seus limites podem ser determinados em SQL

● De forma abstrata e simplificada, uma transação pode
ser encarada como um conjunto de operações de
leitura(read) e escrita(write) de dados

                read(A)
                A := A – 50
                write(A)
                read(B)
                B := B + 50
                write(B)


            Se não houvesse Transações nos SGBDs!!!

● Em uma única transação, pode-se efetuar apenas parte do processo.

– Queda do banco antes de write (B)

Ti:
            read(A)
            A := A – 50
            write(A)
            read(B)
            B := B + 50
            write(B)

- Mais de uma transação usando os mesmos dados quando:
– Troca de contexto/transação antes do write (A) de T1
– Queda do banco antes de write (B)


Uma transação forma uma única unidade lógica de trabalho. É essencial que todo o conjunto de operações da transação seja concluido, ou que, no caso de um problema (falha), nenhuma das operações do conjunto tenha efeito sobre os dados.

O processamento das transações, realizado pelo SGBD, deve garantir que:

    - a execução de uma transação seja completa.
    - seja possível executar várias transações de forma simultânea, sem que inconsistências de dados sejam geradas.