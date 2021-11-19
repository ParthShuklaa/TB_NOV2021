use db2021
--Custom Exception handling using RaiseError()
BEGIN
BEGIN TRY
DECLARE @OUTPUT varchar(200);
SELECT @OUTPUT = AGENTS.AGENT_NAME FROM AGENTS WHERE AGENTS.AGENT_NAME='CHRIS EVANS';
IF @OUTPUT IS NULL
BEGIN
	PRINT 'We Can Not find an Agent name like this in our Database'
	RAISERROR('Record not found',11,1)
END
ELSE
SELECT @OUTPUT AS AGENT
END TRY
BEGIN CATCH
PRINT 'Message from CATCH BLOCK';
THROW;
END CATCH
END