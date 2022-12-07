/*DROP DATABASE bdEscolaIdiomas*/
 
 CREATE DATABASE bdEscolaIdiomas

 GO

 USE bdEscolaIdiomas

 CREATE TABLE tbCurso (
	idCurso INT PRIMARY KEY IDENTITY(1,1)
	,nomeCurso VARCHAR(40) NOT NULL
 )

 CREATE TABLE tbPeriodo (
	idPeriodo INT PRIMARY KEY IDENTITY(1,1)
	,descPeriodo VARCHAR(50) NOT NULL
)

CREATE TABLE tbAluno (
	idAluno INT PRIMARY KEY IDENTITY(1,1)
	,nomeAluno VARCHAR(50) NOT NULL
	,rgAluno VARCHAR(13) NOT NULL
	,enderecoAluno VARCHAR(70) NOT NULL
	,numEndAluno SMALLINT NOT NULL
	,compAluno VARCHAR(50)
	,bairroAluno VARCHAR(50) NOT NULL
	,cepAluno CHAR(9) NOT NULL
	,cidadeAluno VARCHAR(50) NOT NULL
)

CREATE TABLE tbFoneAluno (
	idFoneAluno INT PRIMARY KEY IDENTITY(1,1)
	,foneAluno VARCHAR(15) NOT NULL
	,idAluno INT FOREIGN KEY REFERENCES tbAluno(idAluno)
)

CREATE TABLE tbDiaSemana(
	idDiaSemana INT PRIMARY KEY IDENTITY(1,1)
	,diaSemana VARCHAR(30) NOT NULL
)

CREATE TABLE tbNivel(
	idNivel INT PRIMARY KEY IDENTITY(1,1)
	,descNivel VARCHAR(30) NOT NULL
)

CREATE TABLE tbTurma(
	idTurma INT PRIMARY KEY IDENTITY(1,1)
	,horarioTurma CHAR(5) NOT NULL
	,idCurso INT FOREIGN KEY REFERENCES tbCurso(idCurso)
	,idPeriodo INT FOREIGN KEY REFERENCES tbPeriodo(idPeriodo)
	,idNivel INT FOREIGN KEY REFERENCES tbNivel(idNivel)
	,idDiaSemana INT FOREIGN KEY REFERENCES tbDiaSemana(idDiaSemana)
)

CREATE TABLE TbMatricula(
	idMatricula INT PRIMARY KEY IDENTITY (1,1)
	,dataMatricula DATE NOT NULL
	,idAluno INT FOREIGN KEY REFERENCES tbAluno (idAluno)
	,idTurma INT FOREIGN KEY REFERENCES tbTurma (idTurma)
)