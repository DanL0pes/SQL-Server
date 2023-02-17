---CRIAÇÃO BANCO DE DAODS---
CREATE DATABASE bdOng
GO
USE bdOng
-----------------------------
------CRIANDO TABELAS--------
CREATE TABLE tbStatus(
	idStatus INT PRIMARY KEY IDENTITY(1,1)
	,descStatus VARCHAR(25) NOT NULL
	)

CREATE TABLE tbSexo(
	idSexo INT PRIMARY KEY IDENTITY(1,1)
	,descSexo VARCHAR(25) NOT NULL
	)

CREATE TABLE tbCrianca(
	idCrianca INT PRIMARY KEY IDENTITY(1,1)
	,nomeCrianca VARCHAR(120) NOT NULL
	,idStatus INT FOREIGN KEY REFERENCES tbStatus(idStatus)
	,idSexo  INT FOREIGN KEY REFERENCES tbSexo(idSexo)
	)

CREATE TABLE tbHistorico(
	idHistorico INT PRIMARY KEY IDENTITY(1,1)
	,dtHistorico DATE NOT NULL
	,idCrianca INT FOREIGN KEY REFERENCES tbCrianca(idCrianca)
	)

CREATE TABLE tbResponsavel(
	idResponsavel INT PRIMARY KEY IDENTITY(1,1)
	,nomeResponsavel VARCHAR(120) NOT NULL
	,cpfResponsavel CHAR(11) NOT NULL
	)

CREATE TABLE tbFiliacao(
	idFiliacao INT PRIMARY KEY IDENTITY(1,1)
	,idResponsavel INT FOREIGN KEY REFERENCES tbResponsavel(idResponsavel)
	,idCrianca INT FOREIGN KEY REFERENCES tbCrianca(idCrianca)
	,dtFiliacao DATE NOT NULL
	)

CREATE TABLE tbDoenca(
	idDoenca INT PRIMARY KEY IDENTITY(1,1)
	,nomeDoenca VARCHAR(60) NOT NULL
	,cidDoenca VARCHAR(30) NOT NULL
	)

CREATE TABLE ttbRegistroProntuario(
	idRegistroProntuario INT PRIMARY KEY IDENTITY(1,1)
	,idCrianca INT FOREIGN KEY REFERENCES tbCrianca(idCrianca)
	,idDoenca INT FOREIGN KEY REFERENCES tbDoenca(idDoenca)
	,dtRegistro DATE NOT NULL
	)

CREATE TABLE tbPadrinho(
	idPadrinho INT PRIMARY KEY IDENTITY(1,1)
	,nomePadrinho VARCHAR(120) NOT NULL
	,cpfPadrinho CHAR(11)
	)

CREATE TABLE tbApadrinhamento(
	idApadrinhamento INT PRIMARY KEY IDENTITY(1,1)
	,idCrianca INT FOREIGN KEY REFERENCES tbCrianca(idCrianca)
	,idPadrinho INT FOREIGN KEY REFERENCES tbPadrinho(idPadrinho)
	,dtApadrinhamento DATE NOT NULL
	)