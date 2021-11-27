-- ESTADO
INSERT [dbo].[ESTADO] ([COD_ESTADO], [NOMBRE]) VALUES (1, N'Abierto')
GO
INSERT [dbo].[ESTADO] ([COD_ESTADO], [NOMBRE]) VALUES (2, N'En progreso')
GO
INSERT [dbo].[ESTADO] ([COD_ESTADO], [NOMBRE]) VALUES (3, N'Pendiente Cliente')
GO
INSERT [dbo].[ESTADO] ([COD_ESTADO], [NOMBRE]) VALUES (4, N'Resuelto')
GO
INSERT [dbo].[ESTADO] ([COD_ESTADO], [NOMBRE]) VALUES (5, N'Cerrado')
GO

-- ESTADO CLIENTE
INSERT [dbo].[ESTADO_CLIENTE] ([COD_ESTADO_CLI], [NOMBRE]) VALUES (1, N'Activo')
GO
INSERT [dbo].[ESTADO_CLIENTE] ([COD_ESTADO_CLI], [NOMBRE]) VALUES (2, N'Inactivo')
GO
INSERT [dbo].[ESTADO_CLIENTE] ([COD_ESTADO_CLI], [NOMBRE]) VALUES (3, N'Prospecto')
GO

-- ESTADO SERVICIO
INSERT [dbo].[ESTADO_SERVICIO] ([COD_ESTADO_SERV], [NOMBRE]) VALUES (1, N'Activo')
GO
INSERT [dbo].[ESTADO_SERVICIO] ([COD_ESTADO_SERV], [NOMBRE]) VALUES (2, N'Inactivo')
GO

-- TIPOLOGIA
INSERT [dbo].[TIPOLOGIA] ([COD_TIPOLOGIA], [NOMBRE]) VALUES (1, N'Pedido de instalacion de servicio')
GO
INSERT [dbo].[TIPOLOGIA] ([COD_TIPOLOGIA], [NOMBRE]) VALUES (2, N'Pedido de soporte tecnico de servicio')
GO
INSERT [dbo].[TIPOLOGIA] ([COD_TIPOLOGIA], [NOMBRE]) VALUES (3, N'Pedido de baja de servicio')
GO
INSERT [dbo].[TIPOLOGIA] ([COD_TIPOLOGIA], [NOMBRE]) VALUES (4, N'Pedido de aumento de velocidad')
GO
INSERT [dbo].[TIPOLOGIA] ([COD_TIPOLOGIA], [NOMBRE]) VALUES (5, N'Pedido de baja de velocidad')
GO
INSERT [dbo].[TIPOLOGIA] ([COD_TIPOLOGIA], [NOMBRE]) VALUES (5, N'Compra de pulsos')
GO
INSERT [dbo].[TIPOLOGIA] ([COD_TIPOLOGIA], [NOMBRE]) VALUES (6, N'Solicitud de servicios en promocion')
GO
INSERT [dbo].[TIPOLOGIA] ([COD_TIPOLOGIA], [NOMBRE]) VALUES (7, N'Solicitud de reintegro de instalcion (cancelada)')
GO

-- TIPO SERVICIO
INSERT [dbo].[TIPO_SERVICIO] ([ID_TIPO_SERVICIO], [NOMBRE]) VALUES (1, N'Telefonia')
GO
INSERT [dbo].[TIPO_SERVICIO] ([ID_TIPO_SERVICIO], [NOMBRE]) VALUES (2, N'Internet')
GO
INSERT [dbo].[TIPO_SERVICIO] ([ID_TIPO_SERVICIO], [NOMBRE]) VALUES (3, N'VOIP')
GO

-- TIPOLOGIA - SERVICIO
INSERT [dbo].[TIPOLOGIA_SERVICIO] ([ID_TIPO_SERVICIO], [COD_TIPOLOGIA], [SLA]) VALUES (1, 1, 90)
GO
INSERT [dbo].[TIPOLOGIA_SERVICIO] ([ID_TIPO_SERVICIO], [COD_TIPOLOGIA], [SLA]) VALUES (1, 2, 90)
GO
INSERT [dbo].[TIPOLOGIA_SERVICIO] ([ID_TIPO_SERVICIO], [COD_TIPOLOGIA], [SLA]) VALUES (1, 3, 90)
GO
INSERT [dbo].[TIPOLOGIA_SERVICIO] ([ID_TIPO_SERVICIO], [COD_TIPOLOGIA], [SLA]) VALUES (1, 5, 360)
GO
INSERT [dbo].[TIPOLOGIA_SERVICIO] ([ID_TIPO_SERVICIO], [COD_TIPOLOGIA], [SLA]) VALUES (2, 1, 60)
GO
INSERT [dbo].[TIPOLOGIA_SERVICIO] ([ID_TIPO_SERVICIO], [COD_TIPOLOGIA], [SLA]) VALUES (2, 2, 60)
GO
INSERT [dbo].[TIPOLOGIA_SERVICIO] ([ID_TIPO_SERVICIO], [COD_TIPOLOGIA], [SLA]) VALUES (2, 3, 60)
GO
INSERT [dbo].[TIPOLOGIA_SERVICIO] ([ID_TIPO_SERVICIO], [COD_TIPOLOGIA], [SLA]) VALUES (2, 3, 90)
GO
INSERT [dbo].[TIPOLOGIA_SERVICIO] ([ID_TIPO_SERVICIO], [COD_TIPOLOGIA], [SLA]) VALUES (2, 4, 90)
GO
INSERT [dbo].[TIPOLOGIA_SERVICIO] ([ID_TIPO_SERVICIO], [COD_TIPOLOGIA], [SLA]) VALUES (3, 1, 60)
GO
INSERT [dbo].[TIPOLOGIA_SERVICIO] ([ID_TIPO_SERVICIO], [COD_TIPOLOGIA], [SLA]) VALUES (3, 2, 60)
GO
INSERT [dbo].[TIPOLOGIA_SERVICIO] ([ID_TIPO_SERVICIO], [COD_TIPOLOGIA], [SLA]) VALUES (3, 3, 60)
GO

-- CLIENTES
INSERT [dbo].[CLIENTES] ([NRO_DOC], [NOMBRE], [APELLIDO], [EMAIL], [FECHA_NAC], [COD_ESTADO_CLI]) VALUES (13123456, N'Juan', N'Peres', N'jperes@gmail.com',  CAST(N'1959-07-01' AS Date), 1)
GO
INSERT [dbo].[CLIENTES] ([NRO_DOC], [NOMBRE], [APELLIDO], [EMAIL], [FECHA_NAC], [COD_ESTADO_CLI]) VALUES (23103456, N'Lucia', N'Gonzalez', N'lgonzalez@gmail.com',  CAST(N'1978-09-30' AS Date), 2)
GO
INSERT [dbo].[CLIENTES] ([NRO_DOC], [NOMBRE], [APELLIDO], [EMAIL], [FECHA_NAC], [COD_ESTADO_CLI]) VALUES (15123056, N'Maria', N'Diaz', N'mdiazs@hotmail.com',  CAST(N'1965-07-01' AS Date), 1)
GO
INSERT [dbo].[CLIENTES] ([NRO_DOC], [NOMBRE], [APELLIDO], [EMAIL], [FECHA_NAC], [COD_ESTADO_CLI]) VALUES (28101544, N'Alejandro', N'Zdanovics', N'azdanovics@gmail.com',  CAST(N'1984-07-11' AS Date), 1)
GO
INSERT [dbo].[CLIENTES] ([NRO_DOC], [NOMBRE], [APELLIDO], [EMAIL], [FECHA_NAC], [COD_ESTADO_CLI]) VALUES (22123456, N'Leandro', N'Curci', N'lcurci@outlook.com',  CAST(N'1979-03-07' AS Date), 2)
GO
INSERT [dbo].[CLIENTES] ([NRO_DOC], [NOMBRE], [APELLIDO], [EMAIL], [FECHA_NAC], [COD_ESTADO_CLI]) VALUES (39122353, N'Lucia', N'Mariotti', N'lucim@gmail.com',  CAST(N'1989-10-21' AS Date), 3)
GO

-- DIRECCION
INSERT [dbo].[DIRECCION] ([ID_DIRECCION], [CALLE], [NUMERO], [PISO], [DEPTO]) VALUES (1, N'Av. Juramento', 1971, NULL, NULL)
GO
INSERT [dbo].[DIRECCION] ([ID_DIRECCION], [CALLE], [NUMERO], [PISO], [DEPTO]) VALUES (2, N'La Pampa', 923, 6, N'B')
GO
INSERT [dbo].[DIRECCION] ([ID_DIRECCION], [CALLE], [NUMERO], [PISO], [DEPTO]) VALUES (3, N'Av. Monroe', 3113, 3, N'C')
GO
INSERT [dbo].[DIRECCION] ([ID_DIRECCION], [CALLE], [NUMERO], [PISO], [DEPTO]) VALUES (4, N'Arcos', 2504, 10, N'F')
GO
INSERT [dbo].[DIRECCION] ([ID_DIRECCION], [CALLE], [NUMERO], [PISO], [DEPTO]) VALUES (5, N'Amenabar', 1850, 2, NULL)
GO
INSERT [dbo].[DIRECCION] ([ID_DIRECCION], [CALLE], [NUMERO], [PISO], [DEPTO]) VALUES (6, N'Av. Cramer', 2371, 4, N'E')
GO
INSERT [dbo].[DIRECCION] ([ID_DIRECCION], [CALLE], [NUMERO], [PISO], [DEPTO]) VALUES (7, N'Av. Del Libertador', 5990, 9, N'904')
GO

-- SERVICIOS
INSERT [dbo].[SERVICIOS] ([ID_DIRECCION], [FECHA_INICIO], [COD_ESTADO_SERV], [NRO_DOC_CLI], [ID_TIPO_SERVICIO]) VALUES (1, NULL, 2, 39122353,  2)
GO
INSERT [dbo].[SERVICIOS] ([ID_DIRECCION], [FECHA_INICIO], [COD_ESTADO_SERV], [NRO_DOC_CLI], [ID_TIPO_SERVICIO]) VALUES (2, CAST(N'2012-07-02' AS Date), 2, 28101544,  2)
GO
INSERT [dbo].[SERVICIOS] ([ID_DIRECCION], [FECHA_INICIO], [COD_ESTADO_SERV], [NRO_DOC_CLI], [ID_TIPO_SERVICIO]) VALUES (6, CAST(N'2010-10-21' AS Date), 1, 13123456,  2)
GO
INSERT [dbo].[SERVICIOS] ([ID_DIRECCION], [FECHA_INICIO], [COD_ESTADO_SERV], [NRO_DOC_CLI], [ID_TIPO_SERVICIO]) VALUES (7, CAST(N'2008-10-01' AS Date), 1, 13123456,  2)
GO
INSERT [dbo].[SERVICIOS] ([ID_DIRECCION], [FECHA_INICIO], [COD_ESTADO_SERV], [NRO_DOC_CLI], [ID_TIPO_SERVICIO]) VALUES (5, CAST(N'2009-09-02' AS Date), 2, 23103456,  2)
GO
INSERT [dbo].[SERVICIOS] ([TELEFONO], [ID_DIRECCION], [FECHA_INICIO], [COD_ESTADO_SERV], [NRO_DOC_CLI], [ID_TIPO_SERVICIO]) VALUES (N'4123-1234', 6, CAST(N'2010-10-21' AS Date), 1, 13123456, 1)
GO
INSERT [dbo].[SERVICIOS] ([TELEFONO], [ID_DIRECCION], [FECHA_INICIO], [COD_ESTADO_SERV], [NRO_DOC_CLI], [ID_TIPO_SERVICIO]) VALUES (N'2069-3994', 3, CAST(N'2001-01-22' AS Date), 1, 23103456, 1)
GO
INSERT [dbo].[SERVICIOS] ([TELEFONO], [ID_DIRECCION], [FECHA_INICIO], [COD_ESTADO_SERV], [NRO_DOC_CLI], [ID_TIPO_SERVICIO]) VALUES (N'2069-3994', 4, CAST(N'2004-04-23' AS Date), 1, 15123056, 1)
GO
INSERT [dbo].[SERVICIOS] ([TELEFONO], [ID_DIRECCION], [FECHA_INICIO], [COD_ESTADO_SERV], [NRO_DOC_CLI], [ID_TIPO_SERVICIO]) VALUES (N'2069-3994', 2, CAST(N'2006-06-24' AS Date), 2, 28101544, 1)
GO
INSERT [dbo].[SERVICIOS] ([TELEFONO], [ID_DIRECCION], [FECHA_INICIO], [COD_ESTADO_SERV], [NRO_DOC_CLI], [ID_TIPO_SERVICIO]) VALUES (N'2069-3994', 1, NULL, 2, 39122353, 1)
GO
INSERT [dbo].[SERVICIOS] ([TELEFONO], [ID_DIRECCION], [FECHA_INICIO], [COD_ESTADO_SERV], [NRO_DOC_CLI], [ID_TIPO_SERVICIO]) VALUES (N'4123-1235', 7, CAST(N'2008-10-01' AS Date), 1, 13123456, 3)
GO
INSERT [dbo].[SERVICIOS] ([TELEFONO], [ID_DIRECCION], [FECHA_INICIO], [COD_ESTADO_SERV], [NRO_DOC_CLI], [ID_TIPO_SERVICIO]) VALUES (N'2069-3995', 5, CAST(N'2009-09-02' AS Date), 2, 23103456, 3)
GO

-- TICKET
INSERT [dbo].[TICKET] ([FECHA_APERTURA], [FECHA_RESOLUCION], [NRO_DOC_CLI], [NRO_SERVICIO], [COD_TIPOLOGIA], [COD_ESTADO]) VALUES (CAST(N'2021-11-01 10:12:00.000' AS Datetime), CAST(N'2021-11-02 10:12:00.000' AS Datetime), 39122353, NULL, 1, 1)
GO
INSERT [dbo].[TICKET] ([FECHA_APERTURA], [FECHA_RESOLUCION], [NRO_DOC_CLI], [NRO_SERVICIO], [COD_TIPOLOGIA], [COD_ESTADO]) VALUES (CAST(N'2009-12-01 11:04:09.000' AS Datetime), CAST(N'2009-12-02 11:04:09.000' AS Datetime), 13123456, 59022356, 2, 5)
GO
INSERT [dbo].[TICKET] ([FECHA_APERTURA], [FECHA_RESOLUCION], [NRO_DOC_CLI], [NRO_SERVICIO], [COD_TIPOLOGIA], [COD_ESTADO]) VALUES (CAST(N'2010-11-11 13:14:19.000' AS Datetime), CAST(N'2010-11-12 13:14:19.000' AS Datetime), 23103456, 3, 5)
GO
INSERT [dbo].[TICKET] ([FECHA_APERTURA], [FECHA_RESOLUCION], [NRO_DOC_CLI], [NRO_SERVICIO], [COD_TIPOLOGIA], [COD_ESTADO]) VALUES (CAST(N'2011-11-01 16:45:29.000' AS Datetime), CAST(N'2011-11-02 16:45:29.000' AS Datetime), 23103456, 79122356, 2, 5)
GO
INSERT [dbo].[TICKET] ([FECHA_APERTURA], [FECHA_RESOLUCION], [NRO_DOC_CLI], [NRO_SERVICIO], [COD_TIPOLOGIA], [COD_ESTADO]) VALUES (CAST(N'2011-11-01 16:45:29.000' AS Datetime), CAST(N'2011-11-02 16:45:29.000' AS Datetime), 23103456, 59122357, 2, 5)
GO
INSERT [dbo].[TICKET] ([FECHA_APERTURA], [FECHA_RESOLUCION], [NRO_DOC_CLI], [NRO_SERVICIO], [COD_TIPOLOGIA], [COD_ESTADO]) VALUES (CAST(N'2021-11-01 13:34:00.000' AS Datetime), CAST(N'2021-11-02 13:34:00.000' AS Datetime), 39122353, 1, 1)
GO
INSERT [dbo].[TICKET] ([FECHA_APERTURA], [FECHA_RESOLUCION], [NRO_DOC_CLI], [NRO_SERVICIO], [COD_TIPOLOGIA], [COD_ESTADO]) VALUES (CAST(N'2021-11-01 12:24:00.000' AS Datetime), CAST(N'2021-11-02 12:24:00.000' AS Datetime), 39122353, 1, 1)
GO

-- HISTORIAL
INSERT [dbo].[HISTORIAL] ([ID_HISTORIAL], [FECHA_INICIO], [FECHA_FIN], [NRO_TICKET], [COD_ESTADO]) VALUES (CAST(N'2021-11-01 10:12:00.000' AS Datetime), CAST(N'2021-11-01 10:32:00.000' AS Datetime), 200, 1)
GO
INSERT [dbo].[HISTORIAL] ([ID_HISTORIAL], [FECHA_INICIO], [FECHA_FIN], [NRO_TICKET], [COD_ESTADO]) VALUES (CAST(N'2021-11-01 10:32:00.000' AS Datetime), CAST(N'2021-11-01 11:32:00.000' AS Datetime), 200, 2)
GO
INSERT [dbo].[HISTORIAL] ([ID_HISTORIAL], [FECHA_INICIO], [FECHA_FIN], [NRO_TICKET], [COD_ESTADO]) VALUES (CAST(N'2021-11-01 11:32:00.000' AS Datetime), CAST(N'2021-11-01 16:00:00.000' AS Datetime), 200, 3)
GO
INSERT [dbo].[HISTORIAL] ([ID_HISTORIAL], [FECHA_INICIO], [FECHA_FIN], [NRO_TICKET], [COD_ESTADO]) VALUES (CAST(N'2021-11-01 16:00:00.000' AS Datetime), CAST(N'2021-11-02 10:00:00.000' AS Datetime), 200, 2)
GO
INSERT [dbo].[HISTORIAL] ([ID_HISTORIAL], [FECHA_INICIO], [FECHA_FIN], [NRO_TICKET], [COD_ESTADO]) VALUES (CAST(N'2021-11-02 10:00:00.000' AS Datetime), CAST(N'2021-11-02 11:00:00.000' AS Datetime), 200, 4)
GO
INSERT [dbo].[HISTORIAL] ([ID_HISTORIAL], [FECHA_INICIO], [FECHA_FIN], [NRO_TICKET], [COD_ESTADO]) VALUES (CAST(N'2021-11-02 11:00:00.000' AS Datetime), CAST(N'2021-11-02 11:04:00.000' AS Datetime), 200, 5)
GO

-- TODO historial de otros tickets

-- ACTIVIDADES
INSERT [dbo].[ACTIVIDADES] ([ID_ACTIVIDAD], [DESCRIPCION], [FECHA], [NRO_TICKET]) VALUES (201, N'Inicio de tramite de pedido de servicio' , CAST(N'2021-11-01 10:12:00.000' AS Datetime), 200)
GO
INSERT [dbo].[ACTIVIDADES] ([ID_ACTIVIDAD], [DESCRIPCION], [FECHA], [NRO_TICKET]) VALUES (202, N'Envio de documentacion a departamento de gestion de clientes' , CAST(N'2021-11-01 10:35:00.000' AS Datetime), 200)
GO
INSERT [dbo].[ACTIVIDADES] ([ID_ACTIVIDAD], [DESCRIPCION], [FECHA], [NRO_TICKET]) VALUES (203, N'Recibida aprobacion para realizar el alta de cliente' , CAST(N'2021-11-01 10:45:00.000' AS Datetime), 200)
GO
INSERT [dbo].[ACTIVIDADES] ([ID_ACTIVIDAD], [DESCRIPCION], [FECHA], [NRO_TICKET]) VALUES (204, N'Envio de solicitud de instalacion a soporte tecnico' , CAST(N'2021-11-01 10:55:00.000' AS Datetime), 200)
GO
INSERT [dbo].[ACTIVIDADES] ([ID_ACTIVIDAD], [DESCRIPCION], [FECHA], [NRO_TICKET]) VALUES (205, N'Esperando confirmacion del cliente para instalacion' , CAST(N'2021-11-01 11:32:00.000' AS Datetime), 200)
GO
INSERT [dbo].[ACTIVIDADES] ([ID_ACTIVIDAD], [DESCRIPCION], [FECHA], [NRO_TICKET]) VALUES (206, N'El cliente confirma datos y fecha de instalacion' , CAST(N'2021-11-01 16:00:00.000' AS Datetime), 200)
GO
INSERT [dbo].[ACTIVIDADES] ([ID_ACTIVIDAD], [DESCRIPCION], [FECHA], [NRO_TICKET]) VALUES (207, N'Se envia confirmacion para instalacion a soporte tecnico' , CAST(N'2021-11-02 10:00:00.000' AS Datetime), 200)
GO
-- TODO agregar otras actividades

-- MAIL
INSERT [dbo].[MAIL] ([ID_MAIL], [ORIGEN], [ASUNTO], [FUE_ENVIADO], [NRO_TICKET], [FECHA], [DESTINATARIO]) VALUES (200, N'soporte@telefonia.com.ar', N'Solicitud de instalacion de servicio', 1, 200, CAST(N'2021-11-02 11:00:00.000' AS Datetime), 39122353)
GO
INSERT [dbo].[MAIL] ([ID_MAIL], [ORIGEN], [ASUNTO], [FUE_ENVIADO], [NRO_TICKET], [FECHA], [DESTINATARIO]) VALUES (200, N'baja@telefonia.com.ar', N'Solicitud de baja de servicio', 1, 200, CAST(N'2010-11-11 13:14:00.000' AS Datetime), 23103456)
GO
-- TODO otros mails
