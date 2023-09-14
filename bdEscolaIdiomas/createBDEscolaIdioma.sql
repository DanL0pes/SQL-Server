CREATE DATABASE bdEscolaIdioma

GO 

USE bdEscolaIdioma

CREATE TABLE tbAluno(
	codAluno INT PRIMARY KEY IDENTITY(1,1)
	,nomeAluno VARCHAR(50) NOT NULL
	,dataNascAluno DATE NOT NULL
	,rgAluno VARCHAR(13) NOT NULL UNIQUE 
	,naturalidadeAluno CHAR(2) NOT NULL
)

CREATE TABLE tbCurso(
	codCurso INT PRIMARY KEY IDENTITY(1,1)
	,nomeCurso VARCHAR(20) NOT NULL
	,cargaHorariaCurso SMALLINT NOT NULL
	,valorCurso SMALLMONEY NOT NULL
)

CREATE TABLE tbTurma(
	codTurma INT PRIMARY KEY IDENTITY(1,1)
	,nomeTurma CHAR(3) NOT NULL
	,horarioTurma TIME NOT NULL
	,codCurso INT FOREIGN KEY REFERENCES tbCurso(codCurso)
)

CREATE TABLE tbMatricula(
	codMatricula INT PRIMARY KEY IDENTITY(1,1)
	,dataMatricula DATE NOT NULL
	,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno)
	,codTurma INT FOREIGN KEY REFERENCES tbTurma(codTurma)
)