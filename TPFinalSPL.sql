
CREATE PROCEDURE CrearTicket 
	@nro_doc_cli int,
	@tipo_doc_cli char(3),
        @nro_servicio int,
        @cod_tipologia int not null,
        @cod_estado int not null,
        AS
	DECLARE @id_tipo_serv int
	DECLARE @cliente_existente bit
	DECLARE @servicio_existente bit
	DECLARE @tipologia_valida bit
	DECLARE db_cursor CURSOR FOR

	SELECT ID_TIPO_SERVICIO FROM SERVICIOS WHERE NRO_SERVICIO=@nro_servicio
	open db_cursor
	FETCH NEXT FROM db_cursor into @id_tipo_serv
	BEGIN
		EXEC @cliente_existente=validarClienteExistente @nro_doc_cli=@nro_doc_cli, @tipo_doc_cli=@tipo_doc_cli
		EXEC @servicio_existente=validarServicioExistente @nro_servicio=@nro_servicio
		EXEC @tipologia_valida=validarTipologiaHabilitadaParaServicio @cod_tipologia=@cod_tipologia, @id_tipo_servicio=@id_tipo_servicio

		IF @cliente_existente=0
		BEGIN
			PRINT 'El cliente con numero de documento ' + CAST(@nro_doc_cli AS VARCHAR) + ' tipo ' + @tipo_doc_cli + ' no existe'
		END
		ELSE IF @nro_servicio is null
		BEGIN
			EXEC @tipologia_valida=validarTipologiaHabilitadaNoAsociadaAServicio @cod_tipologia=@cod_tipologia
			IF @tipologia_valida=0
			BEGIN
				PRINT 'La tipologia no es valida'
				RETURN
			END
		END
		ELSE IF @servicio_existente=0
		BEGIN
			PRINT 'El servicio numero ' + CAST(@nro_servicio AS VARCHAR) + ' no existe'
		END
		ELSE IF @tipologia_valida=0
		BEGIN
			PRINT 'La tipologia no es valida para el serivicio indicado'
		END
		ELSE
		BEGIN

			BEGIN TRANSACTION
			INSERT [dbo].[TICKET] ([FECHA_APERTURA], [NRO_DOC_CLI], [TIPO_DOC_CLI], [NRO_SERVICIO], [COD_TIPOLOGIA], [COD_ESTADO]) 
			VALUES (GETDATE(), @nro_doc_cli, @tipo_doc_cli,  @nro_servicio, @cod_tipologia, @cod_estado)
			COMMIT
		END
	END

	close db_cursor

	deallocate db_cursor

CREATE PROCEDURE CrearServicio 
	@telefono char(20),
	@id_direccion int,
	@cod_estado_serv int,
	@nro_doc_cli int,
	@tipo_doc_cli char(3),
	@nombre_tipo_serv char(30)
        AS
	DECLARE @id_tipo_serv int
	DECLARE @cliente_existente bit
	DECLARE db_cursor CURSOR FOR

	SELECT ID_TIPO_SERVICIO FROM TIPO_SERVICIO WHERE NOMBRE=@nombre_tipo_serv
	open db_cursor
	FETCH NEXT FROM db_cursor into @id_tipo_serv
	IF @id_tipo_serv is null
	BEGIN
		PRINT 'El tipo de servicio es inexistente para el nombre ' + @nombre_tipo_serv
	END
	ELSE
	BEGIN
		EXEC @cliente_existente=validarClienteExistente @nro_doc_cli=@nro_doc_cli, @tipo_doc_cli=@tipo_doc_cli

		IF @cliente_existente=0
		BEGIN
			PRINT 'El cliente con numero de documento ' + CAST(@nro_doc_cli AS VARCHAR) + ' tipo ' + @tipo_doc_cli + ' no existe'
		END
		ELSE
		BEGIN
			BEGIN TRANSACTION
			INSERT [dbo].[SERVICIOS] ([ID_DIRECCION], [TELEFONO], [FECHA_INICIO], [COD_ESTADO_SERV], [NRO_DOC_CLI], [TIPO_DOC_CLI], [ID_TIPO_SERVICIO]) 
			VALUES (@id_direccion, @telefono, GETDATE(), @cod_estado_serv, @nro_doc_cli, @tipo_doc_cli,  @id_tipo_serv)
			COMMIT
		END
	END

	close db_cursor

	deallocate db_cursor

-- DROP PROCEDURE CumpleSLA
CREATE PROCEDURE CumpleSLA @ticket_id int, @seCumpleSLA BIT OUTPUT
AS
	DECLARE @tiempo_total int;
	DECLARE @fecha_cierre DATETIME
	DECLARE @fecha_inicio DATETIME
	DECLARE @tiempo_pendiente int
	DECLARE @id_tipo_servicio int
	DECLARE @nro_servicio int
	DECLARE @cod_tipologia int
	DECLARE @sla int
	DECLARE db_cursor CURSOR FOR

	select T.FECHA_APERTURA, T.FECHA_RESOLUCION, S.ID_TIPO_SERVICIO, T.COD_TIPOLOGIA, S.NRO_SERVICIO
		FROM TICKET T
		left join SERVICIOS S  
		on T.NRO_SERVICIO=S.NRO_SERVICIO
		where NRO_TICKET=@ticket_id;

	open db_cursor
	FETCH NEXT FROM db_cursor into @fecha_inicio, @fecha_cierre, @id_tipo_servicio, @cod_tipologia,  @nro_servicio
	IF @fecha_cierre is null
	BEGIN
		PRINT 'El ticket indicado todavia se encuentra abierto'
	END
	ELSE IF @nro_servicio is null
	BEGIN
		PRINT 'El ticket indicado no tiene servicio asociado'
	END	
	ELSE
	BEGIN
		SELECT @tiempo_pendiente=SUM(DATEDIFF(mi, FECHA_INICIO, FECHA_FIN)) FROM HISTORIAL WHERE NRO_TICKET=@ticket_id AND COD_ESTADO=3;
		SET @tiempo_total=DATEDIFF(mi, @fecha_inicio, @fecha_cierre)-@tiempo_pendiente;
		select @sla=SLA from TIPOLOGIA_SERVICIO where COD_TIPOLOGIA=@cod_tipologia AND ID_TIPO_SERVICIO=@id_tipo_servicio
		SET @seCumpleSLA=0
		IF @tiempo_total < @sla
			BEGIN
				SET @seCumpleSLA=1
			END
	END

	close db_cursor;

	deallocate db_cursor;

-- Funcion para tener el mensaje de cumplimiento de SLA
	CREATE FUNCTION mensajeCumplimientoSLA(@cumpleSLA BIT)	
	RETURNS VARCHAR(255)
	AS
	BEGIN
	DECLARE @mensaje VARCHAR(255)
	iF @cumpleSLA=1
	BEGIN
		SET @mensaje=N'Se cumple SLA'
	END
	ELSE
	BEGIN 
		SET @mensaje=N'No se cumple SLA'
	END
	RETURN @mensaje
	END

	CREATE FUNCTION validarClienteExistente(@nro_doc_cli INT, @tipo_doc_cli CHAR(3))	
	RETURNS BIT
	AS
	BEGIN
	    IF EXISTS (SELECT 1 FROM CLIENTES WHERE NRO_DOC=@nro_doc_cli AND TIPO_DOC=@tipo_doc_cli)
		RETURN 1
	RETURN 0
	END

	CREATE FUNCTION validarServicioExistente(@nro_servicio INT)	
	RETURNS BIT
	AS
	BEGIN
	    IF EXISTS (SELECT 1 FROM SERVICIOS WHERE NRO_SERVICIO=@nro_servicio)
		RETURN 1
	RETURN 0
	END

	CREATE FUNCTION validarTipologiaHabilitadaParaServicio(@cod_tipologia INT, @id_tipo_servicio INT)	
	RETURNS BIT
	AS
	BEGIN
	    IF EXISTS (SELECT 1 FROM TIPOLOGIA_SERVICIO WHERE ID_TIPO_SERVICIO=@id_tipo_servicio AND COD_TIPOLOGIA=@cod_tipologia)
		RETURN 1
	RETURN 0
	END

	CREATE FUNCTION validarTipologiaHabilitadaNoAsociadaAServicio(@cod_tipologia INT)	
	RETURNS BIT
	AS
	BEGIN
	    IF EXISTS (SELECT 1 FROM TIPOLOGIA T LEFT JOIN TIPOLOGIA_SERVICIO TS ON T.COD_TIPOLOGIA=TS.COD_TIPOLOGIA
		WHERE TS.ID_TIPO_SERVICIO IS NULL AND T.COD_TIPOLOGIA=@cod_tipologia)
		RETURN 1
	RETURN 0
	END
