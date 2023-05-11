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


start;
input(contaORIGEM, contaDESTINO, quantia);
temp ;= read(Saldo[contaORIGEM]);
if temp < quantia then 
    begin 
        output("Saldo insuficiente");
    end 
    else 
    begin 
        write(Saldo[contaORIGEM], temp - quantia);
        temp = read(Saldo[contaDESTINO]);
        write(Saldo[contaDESTINO], temp + quantia);
        output("Transferência realizada com sucesso!");
    end 
return;
end


Comandos:

    Begin-transaction = marca o inicio da transação 
    End-transaction = marca o final da transação 
    Commit-transaction = sinal de término com sucesso - as alterações realizadas pela transação podem ser "permanentemente" gravadas no banco de dados.
    Abort-transaction (rollback, i.e.reversão) = sinal que a transação não terminou com sucesso - as alterações já realizadas pela transação não devem ter efeito sobre os dados do banco de dados, i.e, devem ser desfeitas.
    Undo = desfaz operação 
    Redo = refaz operação
    


- Por default, todo comando individual é considerado uma transação

exemplo:
    DELETE FROM Pacientes
    - exclui todas ou não exclui nenhuma tupla de pacientes mantendo o BD consistente

● Os comandos realmente envolvidos na Transação são:
    – Update, Delete e Insert

● SQL Padrão (SQL-92):

– SET TRANSACTION
    inicia e configura características de uma transação
– COMMIT [WORK]
    encerra a transação (solicita efetivação das suas ações)
– ROLLBACK [WORK]
    solicita que as ações da transação sejam desfeitas


                Propriedades de uma Transação

● As transações devem ser executadas pelos SGBDs de
maneira a evitar que problemas ocorram.
- As ações que compões uma transação devem possuir
um conjunto de propriedades que são normalmente
referidas como propriedades ACID.

                        Atomicidade
                        Consistência
                        Isolamento
                        Durabilidade