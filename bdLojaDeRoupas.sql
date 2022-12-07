/*DROP DATABASE bdLojaDeRoupas*/

CREATE DATABASE bdLojaDeRoupas

GO
USE bdLojaDeRoupas

CREATE TABLE tbVendedor(
    idVendedor INT PRIMARY KEY IDENTITY(1,1)
    ,nomeVendedor VARCHAR (40) NOT NULL
)
CREATE TABLE tbCliente(
    idCliente INT PRIMARY KEY IDENTITY (1,1)
    ,nomeCliente VARCHAR (40) NOT NULL
    ,idadeCliente TINYINT NOT NULL
)
CREATE TABLE tbVenda(
    idVenda INT PRIMARY KEY IDENTITY (1,1)
    ,dataVenda DATETIME NOT  NULL
    ,totalVenda MONEY NOT NULL
    ,idCliente INT FOREIGN KEY REFERENCES tbCliente(idCliente)
    ,idVendedor INT FOREIGN KEY REFERENCES tbVendedor (idVendedor)
)
CREATE TABLE tbFuncionario(
    idFuncionario INT PRIMARY KEY IDENTITY (1,1)
    ,nomeFuncionario VARCHAR (40) NOT NULL
    ,idadeFuncionario TINYINT NOT NULL
    ,dataAdmissaoFuncionario DATE NOT NULL
    ,salarioFuncionario MONEY NOT NULL  
)
CREATE TABLE tbFabricante(
    idFabricante INT PRIMARY KEY IDENTITY (1,1)
    ,nomeFabricante VARCHAR (40) NOT NULL
)
CREATE TABLE tbProduto(
    idProduto INT PRIMARY KEY IDENTITY (1,1)
    ,nomeProduto VARCHAR (40) NOT NULL
    ,precoProduto MONEY NOT NULL
    ,dataEntradaProduto DATETIME NOT NULL
    ,estoqueProduto SMALLINT NOT NULL
    ,idFuncionario INT FOREIGN KEY REFERENCES tbFuncionario(idFuncionario)
    ,idFabricante INT FOREIGN KEY REFERENCES tbFabricante(idFabricante)
)
CREATE TABLE tbItensVenda(
    idItensVenda INT PRIMARY KEY IDENTITY (1,1)
    ,quantidadeItensVenda INT NOT NULL
    ,subTotalItens MONEY NOT NULL
    ,idVenda INT FOREIGN KEY REFERENCES tbVenda(idVenda)
    ,idProduto INT FOREIGN KEY REFERENCES tbProduto(idProduto)
)