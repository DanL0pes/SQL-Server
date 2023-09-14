GO

USE bdAlbum

INSERT INTO tbAutor(nomeAutor)
	VALUES
	('Rhuan')
	,('Daniel')
	SELECT nomeAutor FROM tbAutor

INSERT INTO tbMusica(nomeMusica, duracaoMusica, dataComposicao, valorDireitoAutoral)
	VALUES
		('Cedo ou Tarde', '3:15', '2023/06/15', 200)
		,('Cry baby', '3:55', '2020/12/10', 500)
		,('Prey', '00:04:42', '2018/02/12', 700)
		,('Space Song', '00:05:20', '2023/05/12', 900)
	SELECT * FROM tbMusica

INSERT INTO tbAutoria(idAutor, idMusica)
	VALUES
		(1, 2)
		,(2,1)
		,(2, 3)
		,(1,4)	
	SELECT * FROM tbAutoria