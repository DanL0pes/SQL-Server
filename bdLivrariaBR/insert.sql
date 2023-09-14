USE bdLivrariaBrasileira

GO

INSERT INTO tbGenero(nomeGenero)
	VALUES
		('Ficção')
		,('Romance')
		,('Tragédia')
	SELECT nomeGenero FROM tbGenero

INSERT INTO tbEditora(nomeEditora)
	VALUES
		('Melhoramentos')
		,('Globo')
		,('Àtica')
		,('Companhia das Lestras')
		,('Abril')
	SELECT nomeEditora FROM tbEditora

INSERT INTO tbAutor(nomeAutor)
	VALUES
		('Chico Buarque')
		,('Jorge Amado')
		,('J.K. Rowling')
		,('William Shakespeare')
		,('Monteiro Lobato')
		,('Cora Coralina')
		,('Clarice Lispector')
	SELECT nomeAutor FROM tbAutor

INSERT INTO tbLivro(nomeLivro, numPagina, codGenero, codEditora, codAutor)
	VALUES 
		('Budapeste', 176, 2, 4, 1)
		,('O Bicho-da-Seda', 453, 2, 5, 3)
		,('Gabriela, Cravo e Canela', 214, 1, 2, 2)
		,('Reinações de Narizinho', 143, 2, 2, 5)
		,('Romeu e Julieta', 421, 1, 3, 4)
		,('O Irmão Alemão', 478, 1, 4, 1)
		,('Terras do Sem-Fim', 125, 1, 3, 2)
		,('Animais Fantásticos e Onde Habitam', 267, 2, 4, 3)
	SELECT nomeLivro, numPagina, codGenero, codEditora, codAutor FROM tbLivro