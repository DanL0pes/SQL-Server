USE bdEscola

SELECT nomeAluno, rgAluno, dataNascimentoAluno FROM tbAluno
WHERE naturalidadeAluno = 'SP'

SELECT nomeAluno, rgAluno FROM tbAluno
WHERE nomeAluno LIKE 'P%'

SELECT nomeCurso FROM tbCurso
WHERE cargahorarioCurso > 2000

SELECT nomeAluno, rgAluno FROM tbAluno 
WHERE nomeAluno LIKE '%Silva%'

SELECT nomeAluno, dataNascimentoAluno FROM tbAluno 
 WHERE MONTH (dataNascimentoAluno) = 3

SELECT idAluno, dataMatricula FROM tbMatricula 
WHERE MONTH (dataMatricula) = 5 AND YEAR (dataMatricula) = 2022

SELECT idAluno FROM tbAluno
WHERE idTurma = 1

SELECT idAluno FROM tbAluno
	WHERE nomeAluno = '1AA'

SELECT * FROM tbAluno
	
SELECT * FROM tbTurma