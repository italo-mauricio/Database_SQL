Atomicidade:

    Ou todas as operações da transação são refletidas corretamente no banco de dados, ou nenhuma delas o será.

    Assegurar a atomicidade de uma transação é responsabilidade do SGBD, mais especificamente dos Componentes de gerenciamento de transações e de recuperação de falhas.

Consistência:

    A execução de uma transação preserva a consistência do banco de dados. Ela inicia a partir de um estado consistente do banco de dados e finaliza deixando o banco de dados novamente em um estado consistente. 

    O resultado deve também atender as expectativas do processo real sob implementação.
    Assegurar a CONSISTÊNCIA de uma transação é responsabilidade do programador.

Isolamento:

    Embora diversas transações possam ser executadas de maneira concorrente, o isolamento garante que cada transação siga seu curso sem considerar ações/operações executadas por outras transações concorrentes. 

    read(A);                read(A);
    A := A – 50             A := A * 1.5;
    write(A)                write(A);
    read(B);
    B := B + 50
    write(B);

Durabilidade:

    Depois que a transação finaliza com sucesso, as mudanças que ela faz no banco de dados devem persistir, mesmo se houver falhas no sistema.

    Assegurar a durabilidade é responsabilidade do componente do SGBD chamado recuperador de falhas.