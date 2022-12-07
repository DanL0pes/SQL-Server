USE bdEscolaIdiomas

INSERT INTO tbCurso(nomeCurso)
VALUES
	('Inglês')
	,('Espanhol')
	,('Frances')

SELECT * FROM tbCurso

INSERT INTO tbPeriodo(descPeriodo)
VALUES
	('Manhã')
	,('Tarde')
	,('Noite')

SELECT * FROM tbPeriodo

INSERT INTO tbNivel(descNivel)
VALUES
	('Basic')
	,('Intermedium')
	,('Advanced')

SELECT * FROM tbNivel

INSERT INTO tbDiaSemana(diaSemana)
VALUES
	('Sábado')
	,('Segunda')
	,('Terça')
	,('Quarta')
	,('Quinta')
	,('Sexta')

SELECT * FROM tbDiaSemana

INSERT INTO tbTurma (horarioTurma, idCurso, idPeriodo, idNivel, idDiaSemana)
VALUES
	('08:00', 1, 1, 2, 1)
	,('08:00', 2, 1, 1, 2)
	,('14:00', 1, 2, 3, 2)
	,('14:00', 3, 2, 2, 3)
	,('19:30', 2, 3, 1, 3)
	,('14:00', 2, 2, 2, 4)
	,('14:00', 1, 2, 3, 5)
	,('19:30', 3, 3, 3, 6)

SELECT *FROM tbTurma

INSERT INTO tbAluno (nomeAluno, rgAluno, enderecoAluno, numEndAluno, compAluno, bairroAluno, cepAluno, cidadeAluno)
VALUES
	('Juan Fonseca Pereira', '12.345.678-90', 'Rua Orminda Pinto', '10', '7', 'Vila Curuça', '09252-260', 'São Paulo')
	,('Daniel Lopes Borges de Sousa', '12.345.678-90', 'Rua João Correia de Magalhães', '242', ' ', 'Vila Curuça', '08151-260', 'São Paulo')
	,('Gabrielle Rocha Freitas', '12.345.678-90', 'Rua Orminda Pinto', '13', '3', 'Vila Curuça', '04251-280', 'São Paulo')
	,('João Gomes Siva', '12.345.678-90', 'Rua Benedito Leite de Ávila', '23', '2', 'Lageado', '02756-280', 'São Paulo')
	,('Rosângela Freire', '12.345.678-90', 'Rua Feliciano de Mendonça', '290', '5', 'Guaianazes', '08460-365', 'São Paulo')
	,('Aline Mendoça', '12.345.678-90', 'Rua Feliciano de Mendonça', '360', '5', 'Guaianazes', '08461-365', 'São Paulo')
	
SELECT *FROM tbTurma

INSERT INTO tbFoneAluno (foneAluno, idAluno)
VALUES
	('11 12345-6789', 1)
	,('11 98765-4321', 1)
	,('11 12345-6789', 2)
	,('11 98765-4321', 2)
	,('11 12345-6789', 3)
	,('66 98765-4321', 3)
	,('11 12345-6789', 4)
	,('11 98765-4321', 4)
	,('22 12345-6789', 5)
	,('22 98765-4321', 5)
	,('55 12345-6789', 6)
	,('55 98765-4321', 6)

SELECT * FROM tbFoneAluno

INSERT INTO TbMatricula (dataMatricula, idAluno, idTurma)
VALUES	
	 ('23/09/2022', 1, 4)
	,('23/09/2022', 1, 6)
	,('23/09/2022', 2, 3)
	,('23/09/2022', 2, 1)
	,('23/09/2022', 3, 2)
	,('23/09/2022', 3, 7)
	,('23/09/2022', 4, 7)
	,('23/09/2022', 4, 3)
	,('23/09/2022', 5, 8)
	,('23/09/2022', 5, 1)
	,('23/09/2022', 6, 6)
	,('23/09/2022', 6, 4)

SELECT *FROM TbMatricula