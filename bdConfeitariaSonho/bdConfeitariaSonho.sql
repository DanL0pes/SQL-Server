CREATE DATABASE bdConfeitariaSonho
--DROP DATABASE bdConfeitariaSonho
GO
USE bdConfeitariaSonho

CREATE TABLE tbCategoriaProduto(
	codCategoriaProduto INT PRIMARY KEY IDENTITY(1,1)
	,nomeCategoriaProduto VARCHAR(40) NOT NULL
)

CREATE TABLE tbCliente(
	codCliente INT PRIMARY KEY IDENTITY(1,1)
	,nomeCliente VARCHAR(40) NOT NULL
	,dataNascimentoCliente DATE NOT NULL
	,ruaCliente VARCHAR(40) NOT NULL
	,numCasaCliente INT NOT NULL
	,cepCliente CHAR(8) NOT NULL
	,bairroCliente VARCHAR(40) NOT NULL
	,cidadeCliente VARCHAR(40) 
	,estadoCliente VARCHAR(40) 
	,cpfCliente CHAR(11)
	,sexoCliente CHAR(1)
)

CREATE TABLE tbProduto(
	codProduto INT PRIMARY KEY IDENTITY(1,1)
	,nomeProduto VARCHAR(40) NOT NULL
	,precoKiloProduto SMALLMONEY NOT NULL
	,codCategoriaProduto INT FOREIGN KEY REFERENCES tbCategoriaProduto(codCategoriaProduto)
)

CREATE TABLE tbEncomenda(
	codEncomenda INT PRIMARY KEY IDENTITY(1,1)
	,dataEncomenda DATE NOT NULL
	,codCliente INT FOREIGN KEY REFERENCES tbCliente(codCliente)
	,valorTotalEncomenda MONEY NOT NULL
	,dataEntregaEncomenda DATE NOT NULL
)

CREATE TABLE tbItensEncomenda(
	codItensEncomenda INT PRIMARY KEY IDENTITY(1,1)
	,codEncomenda INT FOREIGN KEY REFERENCES tbEncomenda(codEncomenda)
	,codProduto INT FOREIGN KEY REFERENCES tbProduto(codProduto)
	,quantidadeKilos REAL NOT NULL
	,subTotal MONEY NOT NULL
)