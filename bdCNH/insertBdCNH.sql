USE bdCNH

INSERT tbMotorista(nomeMotorista, cpfMotorista, pontuacaoAcumulada, situacao)
	VALUES
	('Eduardo Rocha', '12345678900', 0, 'Habilitado')
SELECT nomeMotorista, cpfMotorista, pontuacaoAcumulada, situacao FROM tbMotorista

INSERT tbVeiculo(placaVeiculo, renavam, anoFabricacao, codMotorista)
	VALUES
	('ABC123V', '1234567890', '08/11/2006', 1)