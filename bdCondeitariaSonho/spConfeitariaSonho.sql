USE bdConfeitariaSonho	

--a)Criar uma StoredProcedure para inserir as categorias de produto conforme abaixo:Ao inserir uma categoria de produto, confirmar pelo seu nome se o mesmo já existe no banco de dados. Nesse caso, enviar uma mensagem com essa situação ao usuário
CREATE PROCEDURE spInsereCategoriaProduto
@nomeCategoriaProduto VARCHAR(40)
AS
	IF EXISTS(SELECT nomeCategoriaProduto FROM tbCategoriaProduto WHERE nomeCategoriaProduto LIKE @nomeCategoriaProduto)
		BEGIN
			PRINT('Não é possível cadastrar! '+@nomeCategoriaProduto+' já existe no banco de dados.')
		END
		ELSE
		BEGIN
			INSERT tbCategoriaProduto(nomeCategoriaProduto) VALUES(@nomeCategoriaProduto)
			PRINT('Categoria '+@nomeCategoriaProduto+' cadastrada com sucesso!')
		END

EXEC spInsereCategoriaProduto 'Bolo Festa'
EXEC spInsereCategoriaProduto 'Bolo Simples'
EXEC spInsereCategoriaProduto 'Torta'
EXEC spInsereCategoriaProduto 'Salgado' 
SELECT codCategoriaProduto, nomeCategoriaProduto FROM tbCategoriaProduto


--b)Criar  uma  Stored Procedure  para  inserir os  produtos abaixo,  sendo  que,  a  procedure  deverá antes de inserir verificar se o nome do produto já existe, evitando assim que um produto seja duplicado:
CREATE PROCEDURE spInsereProduto
@nomeProduto VARCHAR(40)
,@precoKiloProduto SMALLMONEY
,@codCategoriaProduto INT
AS
	IF EXISTS(SELECT nomeProduto FROM tbProduto WHERE nomeProduto LIKE @nomeProduto)
		BEGIN
			PRINT('Não é possível cadastrar '+@nomeProduto+'. Já existente no banco de dados.')
		END
	ELSE IF EXISTS(SELECT codCategoriaProduto FROM tbCategoriaProduto WHERE codCategoriaProduto = @codCategoriaProduto)
		BEGIN		 
			INSERT tbProduto(nomeProduto, precoKiloProduto, codCategoriaProduto)
				VALUES(@nomeProduto, @precoKiloProduto, @codCategoriaProduto)
				PRINT('O Produto '+@nomeProduto+' de preço por kilo por '+CONVERT(VARCHAR(10),@precoKiloProduto)+' foi cadastrado com sucesso!')
		END
	ELSE 
		BEGIN
			PRINT('Categoria não existente!')
		END

EXEC spInsereProduto 'Bolo Floresta Negra', 42, 1
EXEC spInsereProduto 'Bolo Prestígio', 43, 1
EXEC spInsereProduto 'Bolo Nutella', 44, 1
EXEC spInsereProduto 'Bolo Formigueiro', 17, 2
EXEC spInsereProduto 'Bolo de cenouro', 19, 2
EXEC spInsereProduto 'Torta de palmito', 45, 3
EXEC spInsereProduto 'Torta de frango e catupiry', 47, 3
EXEC spInsereProduto 'Torta de escarola', 44, 3
EXEC spInsereProduto 'Coxinha frango', 25, 4
EXEC spInsereProduto 'Esfiha carne', 27, 4
EXEC spInsereProduto 'Folhado queijo', 31, 4
EXEC spInsereProduto 'Risoles misto', 29, 4
SELECT * FROM tbProduto


--c)Criar uma stored procedure para cadastrar os clientes abaixo relacionados, sendo que deverão ser feitas duas validações:
--Verificar pelo CPF se o cliente já existe. Caso já existaemitir a mensagem: “Cliente cpf XXXXX já cadastrado”
--Verificar  se  o  cliente  é  morador  de  Itaquera  ou  Guaianases,  pois  a  confeitaria  não  realiza entregas para clientes que residam fora desses bairros. Caso o cliente não seja morador desses bairros enviar a mensagem “Não foi possível cadastrar o cliente XXXX pois o bairro XXXX não é atendido pela confeitaria”
CREATE PROCEDURE spInsereCliente

@nomeCliente VARCHAR(40)
,@dataNascimentoCliente DATE
,@ruaCliente VARCHAR(40)
,@numCasaCliente INT
,@cepCliente CHAR(8)
,@bairroCliente VARCHAR(40)
,@cpfCliente CHAR(11)
,@sexoCliente CHAR(1)
AS
	IF EXISTS(SELECT cpfCliente FROM tbCliente WHERE cpfCliente = @cpfCliente)
		BEGIN
			PRINT('Cliente portador do CPF: '+@cpfCliente+' já cadastrado.')
		END
	ELSE IF @bairroCliente <> 'Itaquera' AND @bairroCliente <>'Guaianases'
		BEGIN
			PRINT('Não foi possível cadastrar o cliente '+@nomeCliente+' pois o bairro '+@bairroCliente+' não é atendido pela confeitaria')
		END
	ELSE 
		BEGIN
			INSERT tbCliente(nomeCliente, dataNascimentoCliente, ruaCliente, numCasaCliente, cepCliente, bairroCliente, cpfCliente, sexoCliente)
				VALUES (@nomeCliente, @dataNascimentoCliente, @ruaCliente, @numCasaCliente, @cepCliente, @bairroCliente, @cpfCliente, @sexoCliente)
			PRINT('Novo cliente cadastrado com sucesso!')
		END

EXEC spInsereCliente 'Samira Fatah', '05/05/1990', 'Rua Aguapeí', 1000, '08090000', 'Guaianases', '49290394870', 'F'
EXEC spInsereCliente 'Celia Nogueira', '06/06/1992', 'Rua Andes', 234, '08456090', 'Guaianases', '26106573824','F'
EXEC spInsereCliente 'Paulo Cesar Siqueira', '04/04/1984', 'Rua Castelo do Piauí', 232, '08109000', 'Itaquera', '26113812833', 'M'
EXEC spInsereCliente 'Rodrigo Favaroni', '09/04/1991', 'Rua Sansão Castelo Branco', 10, '08431090', 'Guaianases','96873514899' ,'M'
EXEC spInsereCliente 'Flávia Regina Brito', '22/04/1992', 'Rua Mariano Moro', 300, '08200123', 'Itaquera', '13548394876','F'
SELECT nomeCliente, dataNascimentoCliente, ruaCliente, numCasaCliente,cepCliente, bairroCliente,sexoCliente FROM tbCliente
--EXEC spInsereCliente 'Rhuan Batista', '03/01/2005', 'travessa alamanda cheirosa', 97, '08452710', 'Guaianases', 'São Paulo', 'São Paulo', '49290394870', 'M'
--EXEC spInsereCliente 'Ricardo Passos', '03/01/2005', 'travessa alamanda cheirosa', 97, '08452710', 'Artur Alvim', 'São Paulo', 'São Paulo', '26106573824', 'M'



--d)Criar via stored procedureas encomendas abaixo relacionadas, fazendo as verificações abaixo:
--No  momento  da  encomenda  o  cliente  irá  fornecer  o  seu  cpf.  Caso  ele  não  tenha  sido cadastrado enviar a mensagem “não foi possível efetivar a encomenda pois o cliente xxxx não está cadastrado”
--Caso tudo esteja correto, efetuar a encomenda e emitir a mensagem: “Encomenda XXX para  o cliente YYY efetuada com sucesso” sendo que no lugar de XXX deverá aparecer o número da encomenda e no YYY deverá aparecer o nome do cliente;
CREATE PROCEDURE spInsereEncomenda
@dataEncomenda DATE
,@codCliente INT
,@valorTotalEncomenda MONEY
,@dataEntregaEncomenda DATE
,@cpfCliente CHAR(11)
AS
	IF NOT EXISTS(SELECT codCliente FROM  tbCliente WHERE codCliente=@codCliente)
		BEGIN
			PRINT('Não foi possível efetivar a encomenda pois o cliente do código '+@codCliente+' não está cadastado.')
		END
	ELSE
	DECLARE @codEncomenda INT
	DECLARE @nomeCliente VARCHAR(40)
	IF NOT EXISTS(SELECT cpfCliente FROM tbCliente WHERE cpfCliente=@cpfCliente)
		BEGIN
			PRINT('Não foi possível efetivar a encomenda pois o cliente '+@cpfCliente+' não está cadastado.')
		END
	ELSE
		BEGIN
			SET @nomeCliente = (SELECT nomeCliente FROM tbCliente WHERE cpfCliente=@cpfCliente)
			INSERT tbEncomenda(dataEncomenda, codCliente, valorTotalEncomenda, dataEntregaEncomenda)
				VALUES(@dataEncomenda, @codCliente, @valorTotalEncomenda, @dataEntregaEncomenda)
			SET @codEncomenda = (SELECT MAX(codEncomenda) FROM tbEncomenda)
			PRINT('Encomenda '+CONVERT(VARCHAR(5), @codEncomenda)+' para o cliente '+@nomeCliente+' efetuada com sucesso')
		END

EXEC spInsereEncomenda '08/08/2015', 1, 450, '15/08/2015', '49290394870'
EXEC spInsereEncomenda '10/10/2015', 2, 200, '15/10/2015', '26106573824'
EXEC spInsereEncomenda '10/10/2015', 3, 150, '10/12/2015', '26113812833'
EXEC spInsereEncomenda '06/10/2015', 1, 250, '12/10/2015', '49290394870'
EXEC spInsereEncomenda '05/10/2015', 4, 150, '12/10/2015', '96873514899'
SELECT * FROM tbEncomenda
--EXEC spInsereEncomenda '24/08/23', 1, 490, '25/08/23', '49290394870'
--EXEC spInsereEncomenda '24/08/23', 1, 490, '25/08/23', '26406573824'
 

--e)Ao adicionar a encomenda, criar uma Storedprocedure, para que sejaminseridos os itens da encomenda conforme tabela a seguir. 
CREATE PROCEDURE spInsereItensEncomenda
@codEncomenda INT
,@codProduto INT
,@quantidadeKilos REAL
,@subTotal MONEY
AS
	IF NOT EXISTS(SELECT codEncomenda FROM tbEncomenda WHERE codEncomenda=@codEncomenda)
		BEGIN
			PRINT('Não foi possível efetivar a encomenda pois não existe essa encomenda.')
		END
	ELSE
	IF NOT EXISTS(SELECT codProduto FROM tbProduto WHERE codProduto=@codProduto)
		BEGIN
			PRINT('Não foi possível efetivar a encomenda pois não existe esse produto.')
		END
	ELSE
		BEGIN
			INSERT tbItensEncomenda(codEncomenda, codProduto, quantidadeKilos, subTotal)
				VALUES(@codEncomenda, @codProduto, @quantidadeKilos, @subTotal)
			DECLARE @nomeProduto VARCHAR(40)
			SET @nomeProduto = (SELECT nomeProduto FROM tbProduto WHERE codProduto=@codProduto)
			PRINT('O produto '+@nomeProduto+' foi adicionado a encomenda '+CONVERT(VARCHAR(10),@codEncomenda))
		END

EXEC spInsereItensEncomenda 1, 1, 2.5, 105
EXEC spInsereItensEncomenda 1, 10, 2.6, 70
EXEC spInsereItensEncomenda 1, 9, 6, 150
EXEC spInsereItensEncomenda 1, 12, 4.3, 125
EXEC spInsereItensEncomenda 2, 9, 8, 200
EXEC spInsereItensEncomenda 3, 11, 3.2, 100
EXEC spInsereItensEncomenda 3, 9, 2, 50
EXEC spInsereItensEncomenda 4, 2, 3.5, 150
EXEC spInsereItensEncomenda 4, 3, 2.2, 100
EXEC spInsereItensEncomenda 5, 6, 3.4, 150
SELECT * FROM tbItensEncomenda
--EXEC spInsereItensEncomenda 1, 1, 2.5, 105

--f)Após todos os cadastros, criar Storedprocedurespara alterar o que se pede:
--1-O preço dos produtos da categoria “Bolo festa” sofreram um aumento de 10%
CREATE PROCEDURE spAumentoCategoriaProduto
@percentualAumento DECIMAL
,@nomeCategoriaProduto VARCHAR(40)
AS
	
	UPDATE tbProduto 
		SET precoKiloProduto = precoKiloProduto+(precoKiloProduto*@percentualAumento/100)
		WHERE codCategoriaProduto = (SELECT codCategoriaProduto FROM tbCategoriaProduto WHERE nomeCategoriaProduto LIKE @nomeCategoriaProduto)
		PRINT('Categoria '+@nomeCategoriaProduto+' reajustada em '+CONVERT(VARCHAR(5), @percentualAumento)+'% com sucesso')

EXEC spAumentoCategoriaProduto '10', 'Bolo Festa'
SELECT * FROM tbProduto

--2-O preço dos produtos categoria “Bolo simples” estão em promoção e terão um desconto de 20%;
CREATE PROCEDURE spDescontoCategoriaProduto
@percentualDesconto DECIMAL
,@nomeCategoriaProduto VARCHAR(40)
AS
	UPDATE tbProduto 
		SET precoKiloProduto = precoKiloProduto-(precoKiloProduto*@percentualDesconto/100)
		WHERE codCategoriaProduto = (SELECT codCategoriaProduto FROM tbCategoriaProduto WHERE nomeCategoriaProduto LIKE @nomeCategoriaProduto)
		PRINT('Categoria '+@nomeCategoriaProduto+' reajustada em -'+CONVERT(VARCHAR(5), @percentualDesconto)+'% com sucesso.')

EXEC spDescontoCategoriaProduto '20', 'Bolo Simples'
SELECT * FROM tbProduto
--3-O preço dos produtos categoria “Torta” aumentaram 25%
EXEC spAumentoCategoriaProduto '25', 'Torta'
SELECT * FROM tbProduto

--4-O preço dos produtos categoria “Salgado”, com exceção da esfihade carne, sofreram um aumento de 20%
EXEC spAumentoCategoriaProduto 20, 'Salgado'
SELECT * FROM tbProduto

--g)Criar uma procedure para excluir clientes pelo CPF sendo que:
--1-Caso  o  cliente  possua  encomendas emitir a mensagem “Impossível  remover  esse  cliente  pois  o cliente XXXXX possui encomendas; onde XXXXX é o nome do cliente.
--2-Caso o cliente não possua encomendas realizar a remoção e emitir a mensagem “Cliente XXXX removido com sucesso”, onde XXXX é o nome do cliente;
CREATE PROCEDURE spExcluirCliente
@cpfCliente CHAR(11)
AS
	DECLARE @nomeCliente VARCHAR(40)
	SET @nomeCliente = (SELECT nomeCliente FROM tbCliente WHERE cpfCliente=@cpfCliente)
	IF EXISTS(SELECT codEncomenda FROM tbEncomenda
		INNER JOIN tbCliente ON tbCliente.codCliente = tbEncomenda.codCliente
		WHERE cpfCliente = @cpfCliente)
		BEGIN 
			PRINT('Impossível remover  esse  cliente  pois  o cliente '+@nomeCliente+' possui encomendas.')
		END
	ELSE
		BEGIN
			DELETE FROM tbCliente
				WHERE cpfCliente = @cpfCliente
			PRINT('Cliente '+@nomeCliente+' removido com sucesso')
		END

EXEC spExcluirCliente 49290394870
EXEC spExcluirCliente 13548394876


--h)Criar uma procedure que permita excluir qualquer item de uma encomenda que exista. Para tal o cliente deverá fornecer o código da encomenda e o código do produto que será excluído da encomenda. A procedure deverá remover o item e atualizar o valor total da encomenda, do qual deverá ser subtraído o valor do item a ser removido. A procedure poderá remover apenas um item da encomenda de cada vez.
CREATE PROCEDURE spExcluirItemEncomenda
@codEncomenda INT
,@codProduto INT
AS
	IF NOT EXISTS(SELECT codEncomenda FROM tbEncomenda WHERE codEncomenda=@codEncomenda)
		BEGIN
			PRINT('Não foi possível efetivar a encomenda pois não existe essa encomenda.')
		END
	ELSE
	IF NOT EXISTS(SELECT codProduto FROM tbProduto WHERE codProduto=@codProduto)
		BEGIN
			PRINT('Não foi possível efetivar a encomenda pois não existe esse produto.')
		END
	ELSE
		BEGIN
			UPDATE tbEncomenda	
				SET valorTotalEncomenda = valorTotalEncomenda-(SELECT subTotal FROM tbItensEncomenda WHERE codProduto = @codProduto AND codEncomenda = @codEncomenda)
				WHERE codEncomenda = @codEncomenda
			DELETE FROM tbItensEncomenda
				WHERE codEncomenda = @codEncomenda AND codProduto = @codProduto
				DECLARE @nomeProduto VARCHAR(40)
				SET @nomeProduto = (SELECT nomeProduto FROM tbProduto WHERE codProduto = @codProduto)
			PRINT('O item '+@nomeProduto+' foi removido da encomenda '+CONVERT(VARCHAR(10),@codEncomenda))
		END

EXEC spExcluirItemEncomenda 1, 12

SELECT * FROM tbEncomenda


	--INNER JOIN tbItensEncomenda ON tbItensEncomenda.codEncomenda = tbEncomenda.codEncomenda

--i)Criar  uma  stored  procedure  que  receba  o  cpf  de  um  cliente  e  a  data  de  entrega  de  uma encomenda e exclua essa encomenda feita para esse cliente. Para tal a stored procedure terá que:
--a.Verificar se o cliente existe no banco de dados
--b.Verificar se o cliente possui encomenda na data solicitada
--c.Em caso negativo (não existe cliente ou não existe encomenda) para ambos os casos enviar mensagem informando a situação
--d.Em caso positivo (existe cliente e existe encomenda) excluir a encomenda e todos os seus itens do banco de dados
CREATE PROCEDURE spExcluirEncomenda
@cpfCliente CHAR(11)
,@dataEntregaEncomenda DATE
AS
	IF NOT EXISTS(SELECT cpfCliente FROM tbCliente WHERE cpfCliente = @cpfCliente)
		BEGIN
			PRINT('Não existe algum cliente portador do CPF: '+@cpfCliente+' !!')
		END
	ELSE IF NOT EXISTS(SELECT dataEntregaEncomenda FROM tbEncomenda
		WHERE dataEntregaEncomenda = @dataEntregaEncomenda)
		BEGIN 
			PRINT('Não existe encomendas nessa data para esse cliente.')
		END
	ELSE
		BEGIN
			DECLARE @codEncomenda INT
				SET @codEncomenda = (SELECT codEncomenda FROM tbEncomenda
				INNER JOIN tbCliente ON tbCliente.codCliente = tbEncomenda.codCliente
					WHERE dataEntregaEncomenda = @dataEntregaEncomenda AND @cpfCliente = cpfCliente)
				DELETE FROM tbItensEncomenda
				WHERE codEncomenda = @codEncomenda
				DELETE FROM tbEncomenda
					WHERE dataEntregaEncomenda = @dataEntregaEncomenda AND
						codCliente = (SELECT codCliente FROM tbCliente
							WHERE cpfCliente = @cpfCliente)
		
				PRINT('A encomenda '+CONVERT(VARCHAR(10), @codEncomenda)+' foi excluída.')
		END

EXEC spExcluirEncomenda 49290394870, '12/10/2015'
SELECT * FROM tbEncomenda

--j)Criar uma stored procedure que receba uma data de entrega e que liste todas as encomendas e itens que deverão ser entregues na referida data
CREATE PROCEDURE spEncomendaData
@dataEntragaEncomenda DATE
AS
	SELECT tbEncomenda.codEncomenda, dataEntregaEncomenda, nomeProduto, quantidadeKilos FROM tbEncomenda
		INNER JOIN tbItensEncomenda ON tbItensEncomenda.codEncomenda = tbEncomenda.codEncomenda
		INNER JOIN tbProduto ON tbProduto.codProduto = tbItensEncomenda.codProduto
		WHERE dataEntregaEncomenda = @dataEntragaEncomenda

EXEC spEncomendaData '10/12/2015'