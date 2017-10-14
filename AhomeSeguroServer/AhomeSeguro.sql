/******************************************************************************/
/****     Generated by IBExpert 2015.12.21.1 13/10/2017 07:29:37 p. m.     ****/
/******************************************************************************/

SET SQL DIALECT 3;

SET NAMES UTF8;

CREATE DATABASE 'C:\AppData\delitos.fdb'
USER 'SYSDBA' PASSWORD 'masterkey'
PAGE_SIZE 4096
DEFAULT CHARACTER SET UTF8 COLLATION UTF8;



/******************************************************************************/
/****                               Domains                                ****/
/******************************************************************************/

CREATE DOMAIN BOOLEANO AS
SMALLINT
CHECK (VALUE = 0 OR VALUE = 1);

CREATE DOMAIN CADENA050 AS
VARCHAR(50);

CREATE DOMAIN FECHAHORA AS
TIMESTAMP;

CREATE DOMAIN GUID AS
VARCHAR(38);

CREATE DOMAIN IMAGEN AS
BLOB SUB_TYPE 0 SEGMENT SIZE 80;

CREATE DOMAIN "REAL" AS
DOUBLE PRECISION;



/******************************************************************************/
/****                                Tables                                ****/
/******************************************************************************/



CREATE TABLE DELITOS (
    ID      GUID NOT NULL,
    NOMBRE  CADENA050
);


CREATE TABLE INCIDENCIAS (
    ID         GUID NOT NULL,
    LATITUD    "REAL",
    LONGITUD   "REAL",
    FOTO       IMAGEN,
    ID_DELITO  GUID,
    FECHAHORA  FECHAHORA,
    PERSONA    BOOLEANO,
    REPORTE    BOOLEANO
);




/******************************************************************************/
/****                             Primary keys                             ****/
/******************************************************************************/

ALTER TABLE DELITOS ADD CONSTRAINT PK_DELITOS PRIMARY KEY (ID);
ALTER TABLE INCIDENCIAS ADD CONSTRAINT PK_INCIDENCIAS PRIMARY KEY (ID);


/******************************************************************************/
/****                             Foreign keys                             ****/
/******************************************************************************/

ALTER TABLE INCIDENCIAS ADD CONSTRAINT FK_INCIDENCIAS_1 FOREIGN KEY (ID_DELITO) REFERENCES DELITOS (ID) ON UPDATE CASCADE;
