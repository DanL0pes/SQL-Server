USE bdLivrariaBrasileira

GO

--a) O total de livros que começam com a letra P
SELECT COUNT(codLivro) AS 'Total de livros que começam com P:' FROM tbLivro
	WHERE nomeLivro LIKE 'P%'
	
--b) O maior número de páginas entre todos os livros
SELECT MAX(numPagina) AS 'Maior número de páginas:' FROM tbLivro

--c) O menor número de páginas entre todos os livros
SELECT MIN(numPagina) AS 'Menor número de páginas:' FROM tbLivro

--d) A média de páginas entre todos os livros
SELECT AVG(numPagina) AS 'Média de páginas:' FROM tbLivro

--e) A soma do número de páginas dos livros de editora código 01
SELECT SUM(numPagina) AS 'Soma de Paginas Melhoramentos' FROM tbLivro
	WHERE codEditora = 1