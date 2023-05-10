Atomicidade:

    Ou todas as operações da transação são refletidas corretamente no banco de dados, ou nenhuma delas o será.

    Assegurar a atomicidade de uma transação é responsabilidade do SGBD, mais especificamente dos Componentes de gerenciamento de transações e de recuperação de falhas.

Consistência:

    A execução de uma transação preserva a consistência do banco de dados. Ela inicia a partir de um estado consistente do banco de dados e finaliza deixando o banco de dados novamente em um estado consistente. 

    O resultado deve também atender as expectativas do processo real sob implementação.
    Assegurar a CONSISTÊNCIA de uma transação é responsabilidade do programador.