CREATE DATABASE bdEscola
GO
USE bdEscola

CREATE TABLE tbPeriodo(
	idPeriodo INT PRIMARY KEY IDENTITY(1,1)
	,nomePeriodo VARCHAR(10) NOT NULL
)

CREATE TABLE tbCurso(
	idCurso INT PRIMARY KEY IDENTITY(1,1)
	,nomeCurso VARCHAR(50) NOT NULL UNIQUE
	,cargaHorariaCurso SMALLINT NOT NULL
)

CREATE TABLE tbAluno(
	idAluno INT PRIMARY KEY IDENTITY(100,2)
	,nomeAluno VARCHAR(50) NOT NULL
	,dataNascAluno SMALLDATETIME NOT NULL CHECK (dataNascAluno<=getdate())
	,ruaAluno VARCHAR(60) NOT NULL
	,numCasaAluno SMALLINT NOT NULL
	,bairroAluno VARCHAR(40) NOT NULL
)

CREATE TABLE tbFoneAluno(
	idFoneAluno INT PRIMARY KEY IDENTITY(1,1)
	,nomeFoneAluno VARCHAR(12) NOT NULL
	,idAluno INT FOREIGN KEY REFERENCES tbAluno(idAluno)
)

CREATE TABLE tbMatricula(
	idMatricula INT PRIMARY KEY IDENTITY(1,1)
	,dataMatricula DATE NOT NULL
	,idAluno INT FOREIGN KEY REFERENCES tbAluno(idAluno)
	,idCurso INT FOREIGN KEY REFERENCES tbCurso(idCurso)
	,idPeriodo INT FOREIGN KEY REFERENCES tbPeriodo(idPeriodo)
)