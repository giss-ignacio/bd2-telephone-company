CREATE TABLE CLIENTES (
	NRO_DOC int not null,
	TIPO_DOC char(3) not null,
	NOMBRE char(30),
	APELLIDO char(30),
	EMAIL char(30),
	FECHA_NAC date,
	COD_ESTADO_CLI int,
	PRIMARY KEY (NRO_DOC, TIPO_DOC));

CREATE TABLE ESTADO_CLIENTE (
	COD_ESTADO_CLI int not null,
	NOMBRE char(30),
	PRIMARY KEY (COD_ESTADO_CLI));

CREATE TABLE SERVICIOS (
	NRO_SERVICIO int not null AUTO_INCREMENT,
	TELEFONO char(20),
	ID_DIRECCION int,
	FECHA_INICIO DATE,
	COD_ESTADO_SERV int,
	NRO_DOC_CLI int,
	TIPO_DOC_CLI char(3),
	ID_TIPO_SERVICIO int,
	PRIMARY KEY (NRO_SERVICIO));

CREATE TABLE DIRECCION (
	ID_DIRECCION int not null,
	CALLE char(30),
	NUMERO char(30),
	PISO INT,
	DEPTO CHAR(20),
	PRIMARY KEY (ID_DIRECCION));

CREATE TABLE ESTADO_SERVICIO (
	COD_ESTADO_SERV int not null,
	NOMBRE char(30),
	PRIMARY KEY (COD_ESTADO_SERV));

CREATE TABLE TIPO_SERVICIO (
	ID_TIPO_SERVICIO int not null,
	NOMBRE char(30),
	PRIMARY KEY (ID_TIPO_SERVICIO));

CREATE TABLE TIPOLOGIA (
	COD_TIPOLOGIA int not null,
	NOMBRE char(30),	
	PRIMARY KEY (COD_TIPOLOGIA));

CREATE TABLE TIPOLOGIA_SERVICIO (
	ID_TIPO_SERVICIO int not null,
	COD_TIPOLOGIA int not null,
	SLA int,
	PRIMARY KEY (ID_TIPO_SERVICIO, COD_TIPOLOGIA));

CREATE TABLE TICKET (
	NRO_TICKET int not null AUTO_INCREMENT,
	FECHA_APERTURA DATETIME not null,
	FECHA_RESOLUCION DATETIME,
	NRO_DOC_CLI int not null,
	TIPO_DOC_CLI char(3) not null,
	NRO_SERVICIO int,
	COD_TIPOLOGIA int not null,
	COD_ESTADO int not null,
	PRIMARY KEY (NRO_TICKET));

CREATE TABLE HISTORIAL (
	ID_HISTORIAL int not null AUTO_INCREMENT,
	FECHA_INICIO DATETIME,
	FECHA_FIN DATETIME,
	NRO_TICKET int not null,
	COD_ESTADO int not null,
	PRIMARY KEY (ID_HISTORIAL));

CREATE TABLE ACTIVIDADES (
	ID_ACTIVIDAD int not null,
	DESCRIPCION varchar,
	FECHA DATETIME,
	NRO_TICKET int,
	PRIMARY KEY (ID_ACTIVIDAD));

CREATE TABLE ESTADO (
	COD_ESTADO int not null,
	NOMBRE char(30),
	PRIMARY KEY (COD_ESTADO));

CREATE TABLE MAIL (
	ID_MAIL int not null,
	ORIGEN char(30),
	ASUNTO varchar,
	FUE_ENVIADO BIT,
	NRO_TICKET INT not null,
        FECHA DATETIME,
	DESTINATARIO int not null,
	PRIMARY KEY (ID_MAIL));


ALTER TABLE CLIENTES
	ADD CONSTRAINT FK_ESTADO_CLI
	FOREIGN KEY	(COD_ESTADO_CLI) REFERENCES ESTADO_CLIENTE(COD_ESTADO_CLI);

ALTER TABLE TICKET
	ADD CONSTRAINT FK_TICKET_CLIENTE
	FOREIGN KEY	(NRO_DOC_CLI, TIPO_DOC_CLI) REFERENCES CLIENTES(NRO_DOC, TIPO_DOC);

ALTER TABLE TICKET
	ADD CONSTRAINT FK_TICKET_SERVICIO
	FOREIGN KEY	(NRO_SERVICIO) REFERENCES SERVICIOS(NRO_SERVICIO);

ALTER TABLE TICKET
	ADD CONSTRAINT FK_TICKET_TIPOLOGIA
	FOREIGN KEY	(COD_TIPOLOGIA) REFERENCES TIPOLOGIA(COD_TIPOLOGIA);

ALTER TABLE TICKET
	ADD CONSTRAINT FK_TICKET_ESTADO
	FOREIGN KEY	(COD_ESTADO) REFERENCES ESTADO(COD_ESTADO);

ALTER TABLE HISTORIAL
	ADD CONSTRAINT FK_HISTORIAL_TICKET
	FOREIGN KEY	(NRO_TICKET) REFERENCES TICKET(NRO_TICKET);

ALTER TABLE HISTORIAL
	ADD CONSTRAINT FK_HISTORIAL_ESTADO
	FOREIGN KEY	(COD_ESTADO) REFERENCES ESTADO(COD_ESTADO);

ALTER TABLE ACTIVIDADES
	ADD CONSTRAINT FK_ACTIVIDADES_TICKET
	FOREIGN KEY	(NRO_TICKET) REFERENCES TICKET(NRO_TICKET);

ALTER TABLE TIPOLOGIA_SERVICIO
	ADD CONSTRAINT FK_TIPO_SERV_TIPOLOGIA
	FOREIGN KEY	(COD_TIPOLOGIA) REFERENCES TIPOLOGIA(COD_TIPOLOGIA);

ALTER TABLE TIPOLOGIA_SERVICIO
	ADD CONSTRAINT FK_TIPOLOGIA_TIPO_SERV
	FOREIGN KEY	(ID_TIPO_SERVICIO) REFERENCES TIPO_SERVICIO(ID_TIPO_SERVICIO);

ALTER TABLE SERVICIOS
	ADD CONSTRAINT FK_SERV_CLIENTES
	FOREIGN KEY	(NRO_DOC_CLI, TIPO_DOC_CLI) REFERENCES CLIENTES(NRO_DOC, TIPO_DOC);

ALTER TABLE SERVICIOS
	ADD CONSTRAINT FK_SERV_TIPO_SERV
	FOREIGN KEY	(ID_TIPO_SERVICIO) REFERENCES TIPO_SERVICIO(ID_TIPO_SERVICIO);

ALTER TABLE SERVICIOS
	ADD CONSTRAINT FK_ESTADO_SERV
	FOREIGN KEY	(COD_ESTADO_SERV) REFERENCES ESTADO_SERVICIO(COD_ESTADO_SERV);

ALTER TABLE SERVICIOS
	ADD CONSTRAINT FK_SERV_DIRECCION
	FOREIGN KEY	(ID_DIRECCION) REFERENCES DIRECCION(ID_DIRECCION);

ALTER TABLE MAIL
	ADD CONSTRAINT FK_MAIL_TICKET
	FOREIGN KEY	(NRO_TICKET) REFERENCES TICKET(NRO_TICKET);

ALTER TABLE MAIL
	ADD CONSTRAINT FK_MAIL_CLIENTES
	FOREIGN KEY	(DESTINATARIO) REFERENCES CLIENTES(NRO_DOC);

