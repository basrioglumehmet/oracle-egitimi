SET SERVEROUTPUT ON;

DECLARE
v_number number := 777;

BEGIN
IF v_number < 1000 THEN
DBMS_OUTPUT.put_line('binden küçüktür');
ELSIF v_number = 1000 THEN
DBMS_OUTPUT.put_line('bine eşit');
ELSE
DBMS_OUTPUT.put_line('binden büyük');
END IF;
END;