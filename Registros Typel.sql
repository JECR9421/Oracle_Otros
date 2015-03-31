CREATE TABLE PAISES_Prueba(
CO_PAIS          NUMBER,
DESCRIPCION      VARCHAR2(50),
CONTINENTE       VARCHAR2(20) );

/*es una estructura de datos en PL/SQL, almacenados en campos, cada uno de los cuales tiene su propio nombre y tipo y que se tratan 
como una sola unidad lógica.*/

/*TYPE <nombre> IS RECORD 
(
campo <tipo_datos> [NULL | NOT NULL] 
[,<tipo_datos>...]
); */
SET SERVEROUTPUT ON [20000]; 
DECLARE
	
  TYPE PAIS IS RECORD 
  (
    CO_PAIS     NUMBER  ,
    DESCRIPCION VARCHAR2(50),
    CONTINENTE  VARCHAR2(20)
  );  
/* Declara una variable identificada por miPAIS de tipo PAIS 
   Esto significa que la variable miPAIS tendrá los campos 
   ID, DESCRIPCION y CONTINENTE.

 */
  miPAIS PAIS;
BEGIN
/* Asignamos valores a los campos de la variable.

 */
  miPAIS.CO_PAIS := 27;
  miPAIS.DESCRIPCION := 'ITALIA';
  miPAIS.CONTINENTE  := 'EUROPA';
  DBMS_OUTPUT.PUT_LINE(miPAIS.CONTINENTE);

END;

/*Tipos de registros anidados*/
SET SERVEROUTPUT ON [20000];

DECLARE 
 TYPE PAIS IS RECORD 
 (CO_PAIS     NUMBER  ,
  DESCRIPCION VARCHAR2(50),
  CONTINENTE  VARCHAR2(20)
 );  
 TYPE MONEDA IS RECORD
 ( DESCRIPCION VARCHAR2(50),
   PAIS_MONEDA PAIS ); 
 
 miPAIS   PAIS; 
 miMONEDA MONEDA;
BEGIN
    miPAIS.CONTINENTE := 'AMERICA';
     miMONEDA.DESCRIPCION := 'COLON';
     miMONEDA.PAIS_MONEDA := miPAIS;
     DBMS_OUTPUT.PUT_LINE(miMONEDA.PAIS_MONEDA.CONTINENTE);
END;

/*--------------Manejo  de tipos de registros con selects--------------*/
insert into PAISES_Prueba values(1,'Costa Rica','America'); 
SET SERVEROUTPUT ON [20000];
DECLARE
	
  TYPE PAIS IS RECORD 
  (
    CO_PAIS     NUMBER  ,
    DESCRIPCION VARCHAR2(50),
    CONTINENTE  VARCHAR2(20)
  ); 
  
  miPais PAIS;
BEGIN

 SELECT  CO_PAIS, DESCRIPCION, CONTINENTE
    INTO miPAIS
    FROM PAISES_Prueba
    WHERE CO_PAIS = 1;

 DBMS_OUTPUT.PUT_LINE(miPAIS.CONTINENTE);

END;

/*///////////////////// ROWTYPE ///////////////////////////////////////////////////////////////////////////*/
SET SERVEROUTPUT ON [20000];
DECLARE
	
  miPAIS PAISES_Prueba%ROWTYPE;
  
BEGIN

 SELECT  CO_PAIS, DESCRIPCION, CONTINENTE
    INTO miPAIS
    FROM PAISES_Prueba
    WHERE CO_PAIS = 1;

 DBMS_OUTPUT.PUT_LINE(miPAIS.CONTINENTE);

END;



