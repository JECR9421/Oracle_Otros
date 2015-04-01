/***SELECT Decode es similar a un case o if***/
SELECT supplier_name,
DECODE(supplier_id, 10000, 'IBM',
                    10001, 'Microsoft',
                    10002, 'Hewlett Packard',
                    'Gateway') result
FROM suppliers;


/***RESULTADO***/
IF supplier_id = 10000 THEN
   result := 'IBM';

ELSIF supplier_id = 10001 THEN
   result := 'Microsoft';

ELSIF supplier_id = 10002 THEN
   result := 'Hewlett Packard';

ELSE
   result := 'Gateway';

END IF;