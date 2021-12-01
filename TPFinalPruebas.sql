-- Casos de Prueba
-- Stored Procedure CumpleSLA
DECLARE @tmp int
EXEC CumpleSLA 3, @tmp OUTPUT;
iF @tmp=1
BEGIN
	PRINT 'Se cumple SLA'
END
ELSE
BEGIN 
	PRINT 'No se cumple SLA'
END
GO