--DROP DATABASE bdEmpresa

CREATE DATABASE bdEmpresa
GO

USE bdEmpresa

CREATE TABLE tbDepto(
	idDepto INT PRIMARY KEY IDENTITY(1,1)
	, nomeDepto VARCHAR(30) NOT NULL
)

CREATE TABLE tbFuncionario(
	idFunc INT PRIMARY KEY IDENTITY(1,1)
	, nomeFunc VARCHAR(50) NOT NULL
	, cpfFunc CHAR(14) NOT NULL
	, rgFunc VARCHAR(12) NOT NULL
	, idDepto INT FOREIGN KEY REFERENCES tbDepto(idDepto)
)

CREATE TABLE tbFoneFunc(
	idFoneFunc INT PRIMARY KEY IDENTITY(1,1)
	,numFoneFunc CHAR(12) NOT NULL
	,idFunc INT FOREIGN KEY REFERENCES tbFuncionario(idFunc)
)

CREATE TABLE tbConjuge(
	idConjuge INT PRIMARY KEY IDENTITY(1,1)
	, nomeConjuge VARCHAR(50) NOT NULL
	, idFunc INT FOREIGN KEY REFERENCES tbFuncionario(idFunc)
)

CREATE TABLE tbDependente(
	idDependente INT PRIMARY KEY IDENTITY(2,2)
	, nomeDependente VARCHAR(50) NOT NULL
	, dtNasctoDependente SMALLDATETIME NOT NULL
	, idFunc INT FOREIGN KEY REFERENCES tbFuncionario(idFunc)
)

CREATE TABLE tbProjeto(
	idProjeto INT PRIMARY KEY IDENTITY(1,1)
	,nomeProjeto VARCHAR(30) NOT NULL
	,cargaHoraria SMALLINT NOT NULL
)
CREATE TABLE tbFuncionarioProjeto(
	idFuncProjeto INT PRIMARY KEY IDENTITY(1,1)
	,qtdeHoras TINYINT NOT NULL
	,idFunc INT FOREIGN KEY REFERENCES tbFuncionario(idFunc)
	,idProjeto INT FOREIGN KEY REFERENCES tbProjeto(idProjeto)
)
