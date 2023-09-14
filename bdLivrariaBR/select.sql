USE bdLivrariaBrasileira

GO

--a) O total de livros que come�am com a letra P
SELECT COUNT(codLivro) AS 'Total de livros que come�am com P:' FROM tbLivro
	WHERE nomeLivro LIKE 'P%'
	
--b) O maior n�mero de p�ginas entre todos os livros
SELECT MAX(numPagina) AS 'Maior n�mero de p�ginas:' FROM tbLivro

--c) O menor n�mero de p�ginas entre todos os livros
SELECT MIN(numPagina) AS 'Menor n�mero de p�ginas:' FROM tbLivro

--d) A m�dia de p�ginas entre todos os livros
SELECT AVG(numPagina) AS 'M�dia de p�ginas:' FROM tbLivro

--e) A soma do n�mero de p�ginas dos livros de editora c�digo 01
SELECT SUM(numPagina) AS 'Soma de Paginas Melhoramentos' FROM tbLivro
	WHERE codEditora = 1