USE bdCNH

CREATE TRIGGER somaPontosMulta
ON tbMulta 
FOR INSERT
AS
BEGIN
	DECLARE @PONTOS TINYINT
	SET @PONTOS = (SELECT numPontos FROM inserted)
	UPDATE tbMotorista
		SET pontuacaoAcumulada = pontuacaoAcumulada+@PONTOS
		WHERE codMotorista = (SELECT codMotorista FROM tbVeiculo WHERE codVeiculo= (SELECT codVeiculo FROM inserted))
		PRINT('Multa Criada com Sucesso!')
		SELECT * FROM tbMulta WHERE codMulta = (SELECT codMulta FROM inserted)
END

INSERT tbMulta(dataMulta, numPontos,codVeiculo)
	VALUES
	('12:00:53 12/08/2013', 8, 1)