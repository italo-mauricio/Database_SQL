                        Apelido nas Tabelas


SELECT aluno.matricula, aluno.nome, telefone, disciplina.nome,cargahoraria
FROM aluno INNER JOIN aluno_disciplina ON aluno.matricula = aluno_disciplina.matricula
INNER JOIN disciplina ON aluno_disciplina.coddisciplina = disciplina.cod
WHERE aluno.telefone IS NOT NULL
ORDER BY disciplina.nome;

                |
                |
                V  

SELECT a.matricula, a.nome, a.telefone, d.nome,d.cargahoraria
FROM aluno AS a INNER JOIN aluno_disciplina AS ad ON a.matricula = ad.matricula
INNER JOIN disciplina AS d ON ad.coddisciplina = d.cod
WHERE a.telefone IS NOT NULL
ORDER BY d.nome;