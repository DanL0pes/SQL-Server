USE bdEtec

GO

MERGE tb3 dest
	USING tb2A ori 
		ON ori.rmAluno = dest.rmAluno
		WHEN NOT MATCHED AND ori.statusAluno = 'APROVADO' THEN
					INSERT VALUES (ori.rmAluno, ori.nomeAluno, ori.statusAluno);
		
--SELECT*FROM tb3
			
--DELETE FROM tb3

MERGE tb3 dest
	USING tb2b ori 
		ON ori.rmAluno = dest.rmAluno
		WHEN NOT MATCHED AND ori.statusAluno = 'APROVADO' THEN
					INSERT VALUES (ori.rmAluno, ori.nomeAluno, ori.statusAluno);
		