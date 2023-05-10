                                Teoria da serialização


O sistema de banco de dados deve controlar a execução concorrente de transações de forma a assegurar que:
    - O resultado obtido após a execução concorrente de duas ou mais transações seja equivalente ao resultado obtido em alguma execução serial destas transações.

    - Uma execução concorrente deve ser serializável. Ou seja, considerando o mesmo conjunto de transações, uma execução concorrente deve ser equivalente a execução serial.