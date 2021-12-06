-- Casos de Prueba
-- Stored Procedure CumpleSLA
DECLARE @tmp int
EXEC CumpleSLA 3, @tmp OUTPUT;
DECLARE @mensaje VARCHAR(255)
EXEC @mensaje=mensajeCumplimientoSLA @cumpleSLA=@tmp
PRINT @mensaje
GO

-- trigger update genera  mail
BEGIN TRANSACTION
  UPDATE TICKET SET COD_ESTADO=3 where NRO_TICKET=2;
  SELECT * from MAIL where NRO_TICKET=2;
COMMIT;

-- trigger update con cod estado RESUELTO (4) actualiza fecha de resolucion
BEGIN TRANSACTION
  UPDATE TICKET SET COD_ESTADO=4 where NRO_TICKET=2;
  SELECT * from TICKET where NRO_TICKET=2;
COMMIT;


-- Esperado: El tipo de servicio es inexistente para el nombre Telefoni 
EXEC CrearServicio N'1234-1235', 1, 1, 28101544, N'DNI', N'Telefoni'
-- Esperado: El cliente con numero de documento 28101544 tipo LE  no existe
EXEC CrearServicio N'1234-1235', 1, 1, 28101544, N'LE', N'Telefonia'
-- Esperado: El cliente con numero de documento 11111111 tipo DNI no existe
EXEC CrearServicio N'1234-1235', 1, 1, 11111111, N'DNI', N'Telefonia'
-- Resultado OK
EXEC CrearServicio N'1234-1235', 1, 1, 28101544, N'DNI', N'Telefonia'


