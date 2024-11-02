SELECT nome, data_nascimento
FROM aluno
ORDER BY nome ASC, data_nascimento ASC;

SELECT nome, especialidade
FROM professor
ORDER BY nome DESC;

SELECT d.nome, c.carga_horaria
FROM disciplina d
JOIN curso c ON d.id_curso = c.id_curso
ORDER BY c.carga_horaria DESC;

SELECT status, COUNT(*) AS total_alunos
FROM matricula
GROUP BY status;

SELECT c.nome AS curso, SUM(d.carga_horaria) AS total_carga_horaria
FROM curso c
JOIN disciplina d ON c.id_curso = d.id_curso
GROUP BY c.nome;

SELECT p.nome
FROM professor p
JOIN turma t ON p.id_professor = t.id_professor
GROUP BY p.nome
HAVING COUNT(t.id_turma) > 3;

SELECT a.nome, COUNT(m.id_disciplina) AS total_disciplinas
FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
GROUP BY a.nome
HAVING COUNT(m.id_disciplina) > 1
ORDER BY total_disciplinas DESC;

SELECT c.nome, SUM(d.carga_horaria) AS total_carga_horaria
FROM curso c
JOIN disciplina d ON c.id_curso = d.id_curso
GROUP BY c.nome
HAVING SUM(d.carga_horaria) > 2000;

SELECT p.nome, COUNT(t.id_turma) AS total_turmas
FROM professor p
JOIN turma t ON p.id_professor = t.id_professor
GROUP BY p.nome
ORDER BY total_turmas DESC;

SELECT c.nome AS curso, AVG(d.carga_horaria) AS media_carga_horaria
FROM curso c
JOIN disciplina d ON c.id_curso = d.id_curso
GROUP BY c.nome;

SELECT a.nome, m.status, m.data_matricula
FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
ORDER BY m.status ASC, m.data_matricula DESC;

SELECT nome, FLOOR(MONTHS_BETWEEN(SYSDATE, data_nascimento) / 12) AS idade
FROM aluno
ORDER BY idade DESC;

SELECT d.nome AS disciplina, COUNT(m.id_aluno) AS total_alunos
FROM disciplina d
LEFT JOIN matricula m ON d.id_disciplina = m.id_disciplina
GROUP BY d.nome
ORDER BY total_alunos DESC;

SELECT p.nome AS professor, d.nome AS disciplina, t.horario
FROM turma t
JOIN professor p ON t.id_professor = p.id_professor
JOIN disciplina d ON t.id_disciplina = d.id_disciplina
ORDER BY t.horario;

SELECT COUNT(*) AS disciplinas_acima_de_80h
FROM disciplina
WHERE carga_horaria > 80;

SELECT c.nome AS curso, COUNT(d.id_disciplina) AS total_disciplinas
FROM curso c
JOIN disciplina d ON c.id_curso = d.id_curso
GROUP BY c.nome;

SELECT p.nome
FROM professor p
JOIN turma t ON p.id_professor = t.id_professor
JOIN disciplina d ON t.id_disciplina = d.id_disciplina
WHERE d.carga_horaria > 100
GROUP BY p.nome
HAVING COUNT(d.id_disciplina) > 2;

SELECT d.nome AS disciplina
FROM disciplina d
JOIN matricula m ON d.id_disciplina = m.id_disciplina
GROUP BY d.nome
HAVING COUNT(m.id_aluno) >= 5;

SELECT status, COUNT(*) AS total_alunos
FROM matricula
GROUP BY status
ORDER BY total_alunos DESC;

SELECT p.nome AS professor, SUM(d.carga_horaria) AS total_carga_horaria
FROM professor p
JOIN turma t ON p.id_professor = t.id_professor
JOIN disciplina d ON t.id_disciplina = d.id_disciplina
GROUP BY p.nome
ORDER BY total_carga_horaria DESC;
