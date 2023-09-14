USE bdEscolaIdioma

--1. Criar uma stored procedure “Busca_Aluno
--que receba o código do aluno e retorne seu
--nome e data de nascimento.
CREATE PROCEDURE spBuscaAluno
	@codAluno INT
	AS
		SELECT nomeAluno, dataNascimento
			FROM tbAluno
			WHERE codAluno = @codAluno

EXEC spBuscaAluno 6

--2. Criar uma stored procedure “Insere_Aluno”
--que insira um registro na tabela de Alunos.
ALTER PROCEDURE spInserirAluno
	@nomeAluno	VARCHAR(50)
	,@rgAluno VARCHAR(12)
	,@cpfAluno CHAR(11)
	,@logradouro VARCHAR(50)
	,@numero INT
	,@complemento VARCHAR(40)
	,@cep CHAR(8)
	,@bairro VARCHAR(40) 
	,@cidade VARCHAR(40) 
	,@dataNascimento DATE
	AS
		BEGIN
			DECLARE @idAluno INT
			IF EXISTS(
				SELECT cpfAluno FROM tbAluno
				WHERE cpfAluno LIKE @cpfAluno)
				BEGIN
					PRINT('Não é possível cadastrar CPF!'
					+@cpfAluno+'CPF já existe!')
				END
				ELSE
				BEGIN
					INSERT tbAluno(nomeAluno, rgAluno, cpfAluno, logradouro, numero, complemento, cep, bairro, cidade, dataNascimento)
						VALUES
							(@nomeAluno, @rgAluno, @cpfAluno, @logradouro, @numero, @complemento, @cep, @bairro, @cidade, @dataNascimento)
					SET @idAluno = (SELECT MAX(codAluno) FROM tbAluno)
					PRINT('Aluno'+@nomeAluno+' cadastrado com sucesso com código '+CONVERT(VARCHAR(5), @idAluno))
				END
		END

EXEC spInserirAluno 'Daniel', '111111111', '54611338860', 'Rua José Fonseca', '242', 'Casa 3','08151260', 'Itaim Paulista', 'São Paulo', '06/11/2006'

--3. Criar uma stored procedure
--“Aumenta_Preco” que, dados o nome do
--curso e um percentual, aumente o valor do
--curso com a porcentagem informadaALTER PROCEDURE spAumentaPreco	@nomeCurs VARCHAR(40)	,@percentual SMALLINT	AS 		UPDATE tbCurso			SET valorCurso = valorCurso+(valorCurso*@percentual/100)			WHERE nomeCurso = @nomeCurs			DECLARE @valorCurs INT			SET @valorCurs = ( SELECT valorCurso FROM tbCurso WHERE nomeCurso=@nomeCurs)			PRINT('O curso '+@nomeCurs+ ' foi atualizado, e o valor atual é:'+ CONVERT(VARCHAR(10),@valorCurs))EXEC spAumentaPreco 'ESPANHOL', 10--4. Criar uma stored procedure “Exibe_Turma” que, dado o nome da turma exiba todas as informações dela.ALTER PROCEDURE spExibeTurma	@nomeTurma VARCHAR(40)	AS		SELECT codTurma, descricaoTurma, nomeCurso, descricaoNivel, descricaoPeriodo, horario, diaDaSemana			FROM tbTurma			INNER JOIN tbCurso ON codCurso.tbCurso = codCurso.tbTurma			WHERE descricaoTurma LIKE '%'+@nomeTurma+'%'EXEC spExibeTurma 'INGLÊS'