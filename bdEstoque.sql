--DROP DATABASE bdEstoque

CREATE DATABASE bdEstoque

GO
USE bdEstoque

CREATE TABLE tbCliente(
	idCliente INT PRIMARY KEY IDENTITY(1,1)
	,nomeCliente VARCHAR(50) NOT NULL
	,cpfCliente CHAR(11) NOT NULL
	,emailCliente VARCHAR(50) NOT NULL
	,sexoCliente CHAR(1) NOT NULL
	,dataNascimentoCliente DATE NOT NULL
)

CREATE TABLE tbFornecedor(
	idFornecedor INT PRIMARY KEY IDENTITY(1,1)
	,nomeFornecedor VARCHAR(30) NOT NULL
	,contatoFornecedor VARCHAR(50) NOT NULL
)

CREATE TABLE tbFabricante(
	idFabricante INT PRIMARY KEY IDENTITY(1,1)
	,nomeFabricante VARCHAR(30) NOT NULL
)

CREATE TABLE tbVenda(
	idVenda INT PRIMARY KEY IDENTITY(1,1)
	,dataVenda DATE NOT NULL
	,valorTotalVenda SMALLMONEY NOT NULL
	,idCliente INT FOREIGN KEY REFERENCES tbCliente(idCliente)
)

CREATE TABLE tbProduto(
	idProduto INT PRIMARY KEY IDENTITY(1,1)
	,descProduto VARCHAR(50) NOT NULL
	,valorProduto SMALLMONEY NOT NULL
	,quantidadeProduto SMALLINT NOT NULL
	,idFabricante INT FOREIGN KEY REFERENCES tbFabricante(idFabricante)
	,idFornecedor INT FOREIGN KEY REFERENCES tbFornecedor(idFornecedor)
)

CREATE TABLE tbItensVenda(
	idItensVenda INT PRIMARY KEY IDENTITY(1,1)
	,idVenda INT FOREIGN KEY REFERENCES tbVenda(idVenda)
	,idProduto INT FOREIGN KEY REFERENCES tbProduto(idProduto)
	,quantidadeItensVenda SMALLINT NOT NULL
	,subTotalItensVenda SMALLMONEY NOT NULL
)
