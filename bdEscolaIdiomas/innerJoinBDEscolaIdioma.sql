USE bdEscolaIdioma

GO


--1 Apresentar os nomes dos alunos ao lado do nome dos cursos que eles fazem
SELECT nomeAluno, nomeCurso FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
		INNER JOIN tbTurma ON tbTurma.codTurma = tbMatricula.codTurma
			INNER JOIN tbCurso ON tbCurso.codCurso = tbTurma.codCurso

--2 Apresentar a quantidade de alunos matriculados por nome do curso;
SELECT COUNT(tbAluno.codAluno) AS 'QTD ALUNOS' , nomeCurso FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
		INNER JOIN tbTurma ON tbTurma.codTurma = tbMatricula.codTurma
			INNER JOIN tbCurso ON tbCurso.codCurso = tbTurma.codCurso
	GROUP BY nomeCurso

--3 Apresentar a quantidade de alunos matriculados por nome da turma;
SELECT COUNT(tbAluno.codAluno) AS 'QTD ALUNOS', nomeTurma FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
		INNER JOIN tbTurma ON tbTurma.codTurma = tbMatricula.codTurma
	GROUP BY nomeTurma

--4 Apresentar a quantidadede alunos que fizeram matricula em maio de 2016;
SELECT COUNT(tbAluno.codAluno) AS 'QTD ALUNOS', dataMatricula FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
	WHERE MONTH(dataMatricula)=5 AND YEAR(dataMatricula)=2016
	GROUP BY dataMatricula

--5 Apresentar o nome dos alunos em ordem alfabética ao lado do nome das turmas e os nomes dos cursos em que estão matriculados
SELECT nomeAluno, nomeTurma, nomeCurso FROM tbAluno	
	INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
		INNER JOIN tbTurma ON tbTurma.codTurma = tbMatricula.codTurma
			INNER JOIN tbCurso ON tbCurso.codCurso = tbTurma.codCurso
	ORDER BY nomeAluno

--6 Apresentar o nome dos cursos e os horários em que eles são oferecidos
SELECT nomeCurso, horarioTurma FROM tbCurso
	INNER JOIN tbTurma ON tbTurma.codCurso = tbCurso.codCurso
	
--7 Apresentar a quantidadede alunos nascidos por estado que estejam matriculados no curso de ingles
SELECT COUNT(DISTINCT tbAluno.codAluno) AS 'QTD ALUNOS', naturalidadeAluno FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
		INNER JOIN tbTurma ON tbTurma.codTurma = tbMatricula.codTurma
			INNER JOIN tbCurso ON tbCurso.codCurso = tbTurma.codCurso
	WHERE tbCurso.codCurso=1
	GROUP BY naturalidadeAluno

--8 Apresentar o nome dos alunos ao lado da data de matrícula no formato dd/mm/aaaa
SELECT nomeAluno, CONVERT(VARCHAR(10), dataMatricula, 101) AS [MM/DD/YYYY]  FROM tbAluno
	INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno

--9 Apresentar os alunos cujo nome comece com A e que estejam matriculados no curso de inglês
SELECT DISTINCT nomeAluno FROM tbAluno
INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
		INNER JOIN tbTurma ON tbTurma.codTurma = tbMatricula.codTurma
			INNER JOIN tbCurso ON tbCurso.codCurso = tbTurma.codCurso
	WHERE nomeCurso LIKE'Inglês' AND nomeAluno LIKE 'A%'
	
--10 Apresentar a quantidade de matriculas feitas no ano de 2016
SELECT COUNT(DISTINCT dataMatricula) AS 'QTD MATRICULAS 2016' FROM tbMatricula
	WHERE YEAR(dataMatricula)=2016

--11 Apresentar a quantidade de matriculas por nome do curso
SELECT COUNT(DISTINCT codMatricula) AS 'QTD MATRICULA', nomeCurso FROM tbMatricula
INNER JOIN tbTurma ON tbTurma.codTurma = tbMatricula.codTurma
			INNER JOIN tbCurso ON tbCurso.codCurso = tbTurma.codCurso
		GROUP BY nomeCurso

--12 Apresentar a quantidade de alunos que fazem os cursos que custam mais de R$300,00
SELECT COUNT(DISTINCT tbAluno.codAluno) AS 'QTD ALUNOS +R$300' FROM tbAluno
INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
		INNER JOIN tbTurma ON tbTurma.codTurma = tbMatricula.codTurma
			INNER JOIN tbCurso ON tbCurso.codCurso = tbTurma.codCurso
	WHERE valorCurso >300

--13 Apresentar os nomes dos alunos que fazem o curso de alemão
SELECT DISTINCT tbAluno.nomeAluno FROM tbAluno
INNER JOIN tbMatricula ON tbMatricula.codAluno = tbAluno.codAluno
		INNER JOIN tbTurma ON tbTurma.codTurma = tbMatricula.codTurma
			INNER JOIN tbCurso ON tbCurso.codCurso = tbTurma.codCurso
	WHERE tbCurso.codCurso = 2
	