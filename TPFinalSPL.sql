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

