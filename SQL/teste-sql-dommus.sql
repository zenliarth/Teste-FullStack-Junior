-- Com base no SQL do banco de dados Mysql 5.7 presente no repositório (bd_universidade.sql), elabore consultas SQL que busquem o que se pede baixo:
USE bd_universidade;

-- a) Encontre a MATRÍCULA(s) dos alunos com nota em BD12015-1 menor que 90;

SELECT
    h.matricula
FROM
    tb_turma t
    INNER JOIN tb_historico_academico h ON t.codigo_turma = h.codigo_turma
WHERE
    t.codigo_turma = 'BD12015-1'
    AND h.nota < 90;

-- b) Encontre a MATRÍCULA(s) e calcule a média das notas dos alunos na disciplina de POO2015-1.

SELECT
    h.matricula,
    avg(h.nota) as media
FROM
    tb_historico_academico h
    INNER JOIN tb_turma t ON t.codigo_turma = h.codigo_turma
WHERE
    t.codigo_turma = 'POO2015-1'
GROUP BY
    h.matricula;

-- c) Encontre o CODIGO do professor que ministra a turma WEB2015-1.

SELECT
    t.codigo_professor
FROM
    tb_turma t
WHERE
    t.codigo_turma = 'WEB2015-1';

-- d) Gere o histórico completo do aluno 2015010106 mostrando MATRICULA,CODIGO DA TURMA, CODIGO DA DISCIPLINA, CODIGO PROFESSOR, FREQUENCIA,NOTA.
SELECT
    a.matricula,
    h.codigo_turma,
    t.codigo_disciplina,
    t.codigo_professor,
    h.frequencia,
    h.nota
FROM
    tb_alunos a
    INNER JOIN tb_historico_academico h ON h.matricula = a.matricula
    INNER JOIN tb_turma t ON t.codigo_turma = h.codigo_turma
WHERE
    a.matricula = '2015010106';