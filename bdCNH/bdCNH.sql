CREATE DATABASE bdCNH
--DROP DATABASE bdCNH

GO

USE bdCNH

CREATE TABLE tbMotorista(
	codMotorista INT PRIMARY KEY IDENTITY(1,1)
	,nomeMotorista VARCHAR(50) NOT NULL
	,cpfMotorista CHAR(11) NOT NULL
	,pontuacaoAcumulada INT NOT NULL
	,situacao VARCHAR(50) NOT NULL
)

CREATE TABLE tbVeiculo(
	codVeiculo INT PRIMARY KEY IDENTITY(1,1)
	,placaVeiculo CHAR(7) NOT NULL
	,renavam VARCHAR(12) NOT NULL
	,anoFabricacao DATE NOT NULL
	,codMotorista INT FOREIGN KEY REFERENCES tbMotorista(codMotorista)
)

CREATE TABLE tbMulta(
	codMulta INT PRIMARY KEY IDENTITY(1,1)
	,dataMulta DATETIME NOT NULL
	,numPontos TINYINT NOT NULL
	,codVeiculo INT FOREIGN KEY REFERENCES tbVeiculo(codVeiculo)
)