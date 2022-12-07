USE bdLojaDeRoupas

INSERT INTO tbFabricante(nomeFabricante)
VALUES
    ('Malwee')
    ,('Marisol')
    ,('Cia da Malha')

SELECT * FROM tbFabricante

INSERT INTO tbFuncionario(nomeFuncionario, idadeFuncionario, salarioFuncionario, dataAdmissaoFuncionario)
VALUES
    ('DANIEL LOPES BORGES DE SOUSA', 19, 5000, '06/11/2016')
    ,('JUAN FONSECA', 20, 4500, '04/06/2017')

SELECT * FROM tbFuncionario

INSERT INTO tbCliente(nomeCliente, idadeCliente)
VALUES
    ('Jubscleida Jacinto', 21)
    ,('Tobis Maguiaris', 25)
    ,('Gabrielle Rocha', 26)
    ,('Yuri Alberto', 35)
    ,('Rubi Torres', 19)

SELECT * FROM tbCliente

INSERT INTO tbVendedor(nomeVendedor)
VALUES
    ('João Santana')
    ,('Raquel Torres')
    
SELECT * FROM tbVendedor

INSERT INTO tbVenda(dataVenda,totalVenda,idCliente,idVendedor)
VALUES
    ('11/06/2020', 2000, 2, 1)
    ,('20/11/2021', 1500, 1, 1)
    ,('14/02/2019', 7500, 3, 2)
    ,('06/12/2022', 1250, 4, 2)
    ,('17/05/2019', 5000, 5, 1)

SELECT * FROM tbVenda

INSERT INTO tbProduto (nomeProduto,precoProduto,dataEntradaProduto,EstoqueProduto,idFuncionario,idFabricante)
VALUES
('Suporte para celular',60.00,'09/01/2022',1900,1,1)
,('AirMax Nike',1900.00,'14/12/2019',2550,2,1)
,('Rolex',1600.00,'12/04/2019',4000,1,1)
,('Jordan',900.00,'13/07/2020',1600,2,2)
,('Moletom HyperX',300.00,'16/05/2020',8000,1,2)
,('Yeezy',5000.00,'25/11/2019',28900,2,2)
,('Juliet',800.00,'17/12/2020',2220,1,3)
,('Fibonacci',1000.00,'11/09/2021',330,2,3)
,('Twix 20unit',49.00,'04/10/2021',10000,1,3)
SELECT * FROM tbProduto

INSERT INTO tbItensVenda (idVenda,idProduto,quantidadeItensVenda,subTotalItens)
VALUES
(1,2,350,2000.00)
,(1,3,500,8000.00)
,(2,1,400,9000.00)
,(2,5,620,7800.00)
,(3,6,180,50000.00)
,(3,7,230,350.00)
,(4,8,650,5000.00)
,(4,9,350,2000.00)
,(5,9,260,50.00)
,(5,4,290,805.00)
SELECT * FROM tbItensVenda