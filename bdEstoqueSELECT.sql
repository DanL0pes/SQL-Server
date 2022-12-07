USE bdEstoque

SELECT SUM(quantidadeProduto) AS somaProdutosPg FROM tbProduto
WHERE idFabricante = 2

SELECT AVG(valorProduto) AS mediaValorProdutoPg FROM tbProduto
WHERE idFabricante = 2

SELECT SUM(valorProduto) AS somaValorProdutoUni FROM tbProduto
WHERE idFabricante = 1

SELECT    AVG (valorProduto) AS mediaValorProdutoBunge FROM tbProduto
WHERE idFabricante = 3

SELECT SUM (quantidadeProduto) AS somaProdutoBunge FROM tbProduto
WHERE idFabricante = 3

SELECT AVG (quantidadeProduto) AS mediaProdutoPg FROM tbProduto
WHERE idFabricante = 2

SELECT AVG (valorProduto) AS precoProduto200 FROM tbProduto
WHERE quantidadeProduto < 200

SELECT AVG (quantidadeProduto) AS mediaProdutoUni FROM tbProduto
WHERE idFabricante = 1

SELECT MIN (valorProduto) AS valorProdutoBarato FROM tbProduto

SELECT COUNT (quantidadeProduto) AS quantidadeProdutoUni FROM tbProduto
WHERE idFabricante = 1