CREATE DATABASE bdEscolaIdioma

USE bdEscolaIdioma

GO

CREATE TABLE tbAluno(
	codAluno INT PRIMARY KEY IDENTITY(1,1)
	,nomeAluno VARCHAR(40) NOT NULL
	,rgAluno VARCHAR(12) NOT NULL
	,cpfAluno CHAR(11) NOT NULL
	,logradouro VARCHAR(50) NOT NULL
	,numero INT NOT NULL
	,complemento VARCHAR(40) NOT NULL
	,cep CHAR(8) NOT NULL
	,bairro VARCHAR(40) NOT NULL
	,cidade VARCHAR(40) NOT NULL
	,dataNascimento DATE NOT NULL
)

CREATE TABLE tbNivel(
	codNivel INT PRIMARY KEY IDENTITY(1,1)
	,descricaoNivel VARCHAR(40) NOT NULL
)

CREATE TABLE tbPeriodo(
	codPeriodo INT PRIMARY KEY IDENTITY(1,1)
	,descricaoPeriodo VARCHAR(20) NOT NULL
)

CREATE TABLE tbCurso(
	codCurso INT PRIMARY KEY IDENTITY(1,1)
	,nomeCurso VARCHAR(40) NOT NULL
	,valorCurso MONEY NOT NULL
)

CREATE TABLE tbTelefoneAluno(
	codTelAluno INT PRIMARY KEY IDENTITY(1,1)
	,numTelAluno VARCHAR(14) NOT NULL
	,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno)
)

CREATE TABLE tbTurma(
	codTurma INT PRIMARY KEY IDENTITY(1,1)
	,descricaoTurma VARCHAR(40) NOT NULL
	,codCurso INT FOREIGN KEY REFERENCES tbCurso(codCurso)
	,codNivel INT FOREIGN KEY REFERENCES tbNivel(codNivel)
	,codPeriodo INT FOREIGN KEY REFERENCES tbPeriodo(codPeriodo)
	,horario TIME NOT NULL
	,diaDaSemana VARCHAR(20) NOT NULL
)

CREATE TABLE tbMatricula(
	codMatricula INT PRIMARY KEY IDENTITY(1,1)
	,dataMatricula DATE NOT NULL
	,codAluno INT FOREIGN KEY REFERENCES tbAluno(codAluno)
	,codTurma INT FOREIGN KEY REFERENCES tbTurma(codTurma)
)