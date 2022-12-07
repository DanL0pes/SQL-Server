CREATE DATABASE bdLoja

GO
USE bdLoja
CREATE TABLE tbFabricante(
	idFabricante INT PRIMARY KEY IDENTITY(1,1)
	,nomeFabricante VARCHAR(50) NOT NULL
)
CREATE TABLE tbFuncionario(
	idFuncionario INT PRIMARY KEY IDENTITY (1,1)
	,nomeFuncionario VARCHAR(50) NOT NULL
	,idadeFuncionario INT CHECK (idadeFuncionario>=18)
	,dataAdmissao SMALLDATETIME DEFAULT '13/01/2010'
	,salarioFuncionario SMALLMONEY NOT NULL CHECK (salarioFuncionario<=954.00)
)
CREATE TABLE tbProduto(
	idProduto INT PRIMARY KEY IDENTITY (200,2)
	,nomeProduto VARCHAR(40) NOT NULL UNIQUE
	,precoProduto SMALLMONEY NOT NULL
	,codFabricante INT FOREIGN KEY REFERENCES tbFabricante(idFabricante)
	,dataEntradaProduto SMALLDATETIME DEFAULT GETDATE()
	,codFuncionario INT FOREIGN KEY  REFERENCES tbFuncionario(idFuncionario)
)