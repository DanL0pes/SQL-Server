USE bdEmpresa

GO

INSERT INTO tbDepto(nomeDepto)
VALUES 
	('Gestão')
	, ('BackEnd')
	, ('FrontEnd')

SELECT * FROM tbDepto

INSERT INTO tbProjeto (nomeProjeto, cargaHoraria)
VALUES
	('Site', 250)
	, ('App', 150)
	, ('Banco de Dados', 350)

SELECT * FROM tbProjeto

INSERT INTO tbFuncionario (nomeFunc, cpfFunc, rgFunc, idDepto)
VALUES
	('Juan Fonseca', '123.456.789-90', '12.345.678-9', 3)
	, ('Steve Jobs', '123.456.789-90', '12.345.678-9', 2)
	, ('Daniel Lopes', '123.456.789-90', '12.345.678-9', 1)

SELECT * FROM tbFuncionario

INSERT INTO tbFuncionarioProjeto (idFunc, idProjeto, qtdeHoras)
VALUES
	(1, 2, 125)
	,(3, 3, 200)
	,(2, 1, 250)

SELECT * FROM tbFuncionarioProjeto

INSERT INTO tbDependente (nomeDependente, dtNasctoDependente, idFunc)
VALUES
	('Romero Brito', '14/05/2007', 2)
	,('Kauane de Souza', '04/09/2006', 2)
	,('Julya Pouche', '18/12/2002', 3)

SELECT * FROM tbDependente

INSERT INTO tbConjuge (nomeConjuge, idFunc)
VALUES
	('Laurene Jobs', 2)
	,('Selena Gomez', 1)
	,('Sandra Oh', 3)

SELECT * FROM tbConjuge

INSERT INTO tbFoneFunc (numFoneFunc, idFunc)
VALUES
	('1194401-2536', 3)
	,('1112345-6789', 2)
	,('1198765-4321', 1)

SELECT * FROM tbFoneFunc