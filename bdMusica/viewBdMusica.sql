GO

USE bdAlbum

--Criar uma view chamada vwMusica para mostrar a quantidade de m�sicas ao lado do nome de seu autor

CREATE VIEW vwMusica AS
	SELECT COUNT(idMusica) as quantidadeMusica, nomeAutor FROM tbAutoria
	 INNER JOIN tbAutor ON tbAutor.idAutor = tbAutoria.idAutor
	 GROUP BY nomeAutor

	
SELECT * FROM vwMusica

--Usando a view anterior, criar uma nova view chamada vwMaiorCompositor para mostrar o nome do compositor que comp�s a maior quantidade de m�sicas

CREATE VIEW vwMaiorCompositor AS
	SELECT nomeAutor FROM vwMusica
	WHERE quantidadeMusica = (SELECT MAX(quantidadeMusica) FROM vwMusica)

SELECT * FROM vwMaiorCompositor

--Criar uma view chamada vwAutoria que mostre o nome das m�sicas e o nome dos autores, somente das m�sicas compostas em maio de 2023

CREATE VIEW vwAutoria AS
	SELECT nomeMusica, nomeAutor FROM tbMusica
		INNER JOIN tbAutoria ON tbMusica.idMusica = tbAutoria.idMusica
			INNER JOIN tbAutor ON tbAutoria.idAutor = tbAutor.idAutor
	WHERE DATEPART(MONTH,dataComposicao)=5 AND DATEPART(YEAR, dataComposicao)=2023

SELECT * FROm vwAutoria

--Criar uma view chamada vwMusicaLonga que mostre o nome da m�sica de maior dura��o

CREATE VIEW vwMusicaLonga AS
	SELECT nomeMusica FROM tbMusica
	WHERE duracaoMusica = (SELECT MAX(duracaoMusica) FROM tbMusica)

SELECT * FROM vwMusicaLonga

--Criar uma view chamada vwGrana que mostre o nome do autor que mais faturou com direitos autorais devido � autoria de m�sicas (valorDireitoAutoral)


CREATE VIEW vwAutorGrana AS
	SELECT SUM(valorDireitoAutoral) as valorDireitoAutoral, nomeAutor FROM tbMusica
	INNER JOIN tbAutoria ON tbAutoria.idMusica = tbMusica.idMusica
		INNER JOIN tbAutor ON tbAutor.idAutor = tbAutoria.idAutor
	GROUP BY nomeAutor
	
SELECT*FROM vwAutorGrana

CREATE VIEW vwGrana AS
	SELECT nomeAutor FROM vwAutorGrana
	WHERE valorDireitoAutoral = (SELECT MAX(valorDireitoAutoral) FROM vwAutorGrana)

SELECT * FROM vwGrana