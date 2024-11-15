use master 
go
CREATE TABLE #Exemplo (ID INT, nome VARCHAR(20) NOT NULL);
begin transaction
	BEGIN TRY
		INSERT INTO #Exemplo VALUES (1, 'Jose');
		INSERT INTO #Exemplo VALUES (2, null);
		INSERT INTO #Exemplo VALUES (3, 'Maria');
		commit tran;
	end try

	BEGIN CATCH
	    SELECT	ERROR_NUMBER() AS "ERROR_NUMBER",
				ERROR_SEVERITY() AS "ERROR_SEVERITY",
				ERROR_STATE() AS "ERROR_STATE",
				ERROR_PROCEDURE() AS "ERROR_PROCEDURE",
				ERROR_LINE() AS "ERROR_LINE",
				ERROR_MESSAGE() AS "ERROR_MESSAGE"
	    RAISERROR('Erro na transa��o', 14, 1)
	    ROLLBACK TRAN;
	END CATCH;

