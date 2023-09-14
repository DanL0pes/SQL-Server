CREATE DATABASE bdUni

GO

USE bdUni

CREATE TABLE tbAluno (
	idAluno INT PRIMARY KEY IDENTITY (1,1)
	,nomeAluno VARCHAR(80) NOT NULL
	,cpfAluno CHAR(11) NOT NULL
	,logradouroAluno VARCHAR(80) NOT NULL
	,numLogAluno VARCHAR(6) NOT NULL
	,complementoAluno VARCHAR(80) NOT NULL
	,cepAluno CHAR(8) NOT NULL
	,bairroAluno VARCHAR(50) NOT NULL
	,cidadeAluno VARCHAR(50) NOT NULL
	,estadoAluno VARCHAR(50) NOT NULL
	)

CREATE TABLE tbCurso (
	idCurso INT PRIMARY KEY IDENTITY (1,1)
	,descCurso VARCHAR(50) NOT NULL
	)

CREATE TABLE tbCampus (
	idCampus INT PRIMARY KEY IDENTITY (1,1)
	,nomeCampus VARCHAR(80) NOT NULL
	,logradouroCampus VARCHAR(80) NOT NULL
	,numLogCampus VARCHAR(6) NOT NULL
	,complementoCampus VARCHAR(80) NOT NULL
	,cepCampus CHAR(8) NOT NULL
	,bairroAluno VARCHAR(50) NOT NULL
	,cidadeAluno VARCHAR(50) NOT NULL
	,estadoAluno VARCHAR(50) NOT NULL
	)

CREATE TABLE tbTurma (
	idTurma INT PRIMARY KEY IDENTITY (1,1)
	,anoFormacaoTurma DATE NOT NULL
	,numSalaTurma TINYINT NOT NULL
	,idCampus INT FOREIGN KEY REFERENCES tbCampus(idCampus)
	,idCurso INT FOREIGN KEY REFERENCES tbCurso(idCurso)
	)

CREATE TABLE tbMatricula (
	idMatricula INT PRIMARY KEY IDENTITY (1,1)
	,descMatricula VARCHAR(60) NOT NULL
	,idAluno INT FOREIGN KEY REFERENCES tbAluno(idAluno)
	,idTurma INT FOREIGN KEY REFERENCES tbTurma(idTurma)
	)

CREATE TABLE tbDisciplina (
	idDisciplina INT PRIMARY KEY IDENTITY (1,1)
	,descDisciplina VARCHAR(60) NOT NULL
	,cargaHorariaDisciplina INT NOT NULL
	)

CREATE TABLE tbProfessor (
	idProfessor INT PRIMARY KEY IDENTITY (1,1)
	,nomeProfessor VARCHAR(80) NOT NULL
	,cpfProfessor CHAR(11) NOT NULL
	,logradouroProfessor VARCHAR(80) NOT NULL
	,numLogProfessor VARCHAR(6) NOT NULL
	,complementoProfessor VARCHAR(80) NOT NULL
	,cepProfessor CHAR(8) NOT NULL
	,bairroProfessor VARCHAR(50) NOT NULL
	,cidadeProfessor VARCHAR(50) NOT NULL
	,estadoProfessor VARCHAR(50) NOT NULL
	)