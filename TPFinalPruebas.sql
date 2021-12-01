-- Casos de Prueba
-- Stored Procedure CumpleSLA
DECLARE @tmp int
EXEC CumpleSLA 3, @tmp OUTPUT;
DECLARE @mensaje VARCHAR(255)
EXEC @mensaje=mensajeCumplimientoSLA @cumpleSLA=@tmp
PRINT @mensaje
GO