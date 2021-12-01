-- Casos de Prueba
-- Stored Procedure CumpleSLA
DECLARE @tmp int
EXEC CumpleSLA 3, @tmp OUTPUT;
DECLARE @mensaje VARCHAR(255)
EXEC @mensaje=mensajeCumplimientoSLA @cumpleSLA=@tmp
PRINT @mensaje
GO

-- Transaccion de prueba
BEGIN TRANSACTION
  UPDATE TICKET SET COD_ESTADO=3 where NRO_TICKET=2;
  UPDATE MAIL SET FUE_ENVIADO=1 where NRO_TICKET=2;
COMMIT;

