USE bdLojaDeRoupas

UPDATE tbFabricante
	SET nomeFabricante = 'Turma da Malha'
	WHERE nomeFabricante = 'Cia da Malha'
	SELECT * FROM tbFabricante

UPDATE tbVenda
	SET totalVenda = totalVenda-(totalVenda*0.10)
	WHERE idCliente = 1
	SELECT * FROM tbVenda

UPDATE tbProduto
	SET precoProduto = precoProduto+(precoProduto*0.20)
	WHERE idFabricante = 2
	SELECT * FROM tbProduto

UPDATE tbProduto
	SET estoqueProduto = estoqueProduto - 10
	WHERE idProduto = 3
	SELECT * FROM tbProduto

	DELETE FROM tbItensVenda
	WHERE idVenda = 2 AND idItensVenda = 4
	SELECT * FROM tbItensVenda

	DELETE FROM tbItensVenda
	WHERE idVenda = 3
	SELECT * FROM tbItensVenda
	

	DELETE FROM tbFabricante
	WHERE idFabricante = 1
	SELECT * FROM tbFabricante

/*O erro ocorreu de remoção do fabricante(idFabricante=1). Pois ele está como FOREIGN KEY(chave estrangeira) em tbProduto, a única possibilidade de remoção seria se o tbFabricante não houvesse valor.*/
