/*/////////////////Manejo de Excepciones//////////////////////////////////////*/

/* Estructura Básica bloque con excepción*/
DECLARE
 -- Declaraciones
BEGIN
  -- Ejecucion
EXCEPTION
  -- Excepcion
END; 

/* Estructura con multiples bloques de excepción */ 

DECLARE
 -- Declaraciones
BEGIN
  -- Ejecucion
EXCEPTION
WHEN NO_DATA_FOUND THEN
  -- Se ejecuta cuando ocurre una excepcion de tipo NO_DATA_FOUND
WHEN ZERO_DIVIDE THEN
  -- Se ejecuta cuando ocurre una excepcion de tipo ZERO_DIVIDE

WHEN OTHERS THEN
  -- Se ejecuta cuando ocurre una excepcion de un tipo no tratado
  -- en los bloques anteriores

END;  

/* ver tipos específicos de excepciones http://www.devjoker.com/contenidos/articulos/48/Excepciones-en-PLSQL.aspx */ 

/*///////////////// Excepción creada en bloque declare///////////////////////*/
DECLARE
 -- Declaraciones

    MyExcepcion EXCEPTION;
BEGIN
  -- Ejecucion
EXCEPTION
  -- Excepcion
END; 

/*Implementación*/
SET SERVEROUTPUT ON [20000]; 
DECLARE
 -- Declaramos una excepcion identificada por VALOR_NEGATIVO
      VALOR_NEGATIVO EXCEPTION;

    valor NUMBER;
BEGIN
  -- Ejecucion

valor := -1;

	IF valor < 0 THEN

		RAISE VALOR_NEGATIVO;

	END IF;


EXCEPTION
  -- Excepcion

WHEN VALOR_NEGATIVO THEN
  
	dbms_output.put_line('El valor no puede ser negativo ' );
END; 

/*** Uso de WHEN OTHERS ****/   
DECLARE
 -- Declaraciones

    MyExcepcion EXCEPTION;
BEGIN
  -- Ejecucion
EXCEPTION
  -- Excepcion
END; 

/*Implementación*/
SET SERVEROUTPUT ON ; 
Declare
 valor number;
BEGIN
  -- Ejecucion

valor := -1;

	IF valor < 0 THEN

		RAISE_APPLICATION_ERROR(-20001,'Valor negativo');

	END IF;


EXCEPTION
  -- Excepcion

WHEN OThers THEN
  
	dbms_output.put_line('Error:'|| SQLCODE ||' Motivo:' || SQLERRM);
END; 





