CREATE TABLE PRUEBABulk
(
  OWNER           VARCHAR2(30 BYTE)             NOT NULL,
  OBJECT_NAME     VARCHAR2(30 BYTE)             NOT NULL,
  SUBOBJECT_NAME  VARCHAR2(30 BYTE),
  OBJECT_ID       NUMBER                        NOT NULL,
  DATA_OBJECT_ID  NUMBER,
  OBJECT_TYPE     VARCHAR2(19 BYTE),
  CREATED         DATE                          NOT NULL,
  LAST_DDL_TIME   DATE                          NOT NULL,
  TIMESTAMP       VARCHAR2(19 BYTE),
  STATUS          VARCHAR2(7 BYTE),
  TEMPORARY       VARCHAR2(1 BYTE),
  GENERATED       VARCHAR2(1 BYTE),
  SECONDARY       VARCHAR2(1 BYTE),
  NAMESPACE       NUMBER                        NOT NULL,
  EDITION_NAME    VARCHAR2(30 BYTE)
)
LOGGING 
NOCOMPRESS 
NOCACHE
NOPARALLEL
MONITORING;

/***** FORALL solo soporta una instrucción update,insert o delete inmediata despúes de que aparece la orden *******/

/******* Insert múltiples registros con bulk y forall ***************/
declare
CURsOR C_OBJECTS  IS 
SELECT * FROM ALL_OBJECTS;

TYPE ojects  IS TABLE OF       ALL_OBJECTS%rOWTYPE;
Objetos  ojects;
c_limit number:=1000;
begin
OPEN C_OBJECTS;

   LOOP
      FETCH C_OBJECTS BULK COLLECT INTO Objetos  LIMIT c_limit;
      forall idx in 1..Objetos.COUNT insert into PRUEBABulk  values Objetos(idx);
      commit;

      EXIT WHEN Objetos.COUNT = 0;
   END LOOP;
   CLOSE C_OBJECTS;
end;
-------------------------------------------------------------------------------------------
select * from PRUEBABULK;
-------------------------------------------------------------------------------------------

/********** Borar múltiples registros con bulk y forall ***********/
Declare
CURsOR C_OBJECTS  IS 
SELECT ROWID REGISTRO  FROM  pruebaBulk;

TYPE ojects  IS TABLE OF       VARCHAR2(40);
Objetos  ojects;
c_limit number:=1000;
id NUMBER;
begin
OPEN C_OBJECTS;

   LOOP
      FETCH C_OBJECTS BULK COLLECT INTO Objetos  LIMIT c_limit;
       
      forall idx in 1..Objetos.COUNT DELETE  pruebabulk  WHERE ROWID=Objetos(idx);
      commit;

      EXIT WHEN Objetos.COUNT = 0;
   END LOOP;
   CLOSE C_OBJECTS;
end;

-------------------------------------------------------------------------------------------
select * from PRUEBABULK;
-------------------------------------------------------------------------------------------

/********* Insert combinado usando for all y for convencional **********/
Declare
CURsOR C_OBJECTS  IS 
SELECT * FROM ALL_OBJECTS;

TYPE ojects  IS TABLE OF       ALL_OBJECTS%rOWTYPE;
Objetos  ojects;
c_limit number:=1000;
id NUMBER;
begin
OPEN C_OBJECTS;

   LOOP
      FETCH C_OBJECTS BULK COLLECT INTO Objetos  LIMIT c_limit;
      
      
      for idx in 1..Objetos.COUNT  loop 
        ID:=Objetos(idx).OBJECT_ID;
           insert into prueba  values Objetos(idx);
      
      end loop;
      commit;
      forall idx in 1..Objetos.COUNT  insert into prueba  values Objetos(idx);
      commit;
      
       forall idx in 1..Objetos.COUNT    insert into tabobject  values ( Objetos(idx).OBJECT_ID);
      commit;
      

      EXIT WHEN Objetos.COUNT = 0;
   END LOOP;
   CLOSE C_OBJECTS;
end;
/
