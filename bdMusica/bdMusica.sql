CREATE DATABASE bdAlbum

GO

USE bdAlbum

CREATE TABLE tbAutor(
	idAutor INT PRIMARY KEY IDENTITY(1,1)
	,nomeAutor VARCHAR(50) NOT NULL
)

CREATE TABLE tbMusica(
	idMusica INT PRIMARY KEY IDENTITY(1,1)
	,nomeMusica VARCHAR(40) NOT NULL
	,duracaoMusica TIME NOT NULL
	,dataComposicao DATE NOT NULL
	,valorDireitoAutoral MONEY NOT NULL
)

CREATE TABLE tbAutoria(
	idAutoria INT PRIMARY KEY IDENTITY(1,1)
	,idAutor INT FOREIGN KEY REFERENCES tbAutor(idAutor)
	,idMusica INT FOREIGN KEY REFERENCES tbMusica(idMusica)
)