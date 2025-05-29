-- Bind değişkeni tanımlanıyor
VARIABLE v_bind1 VARCHAR2(2555);

-- Başlangıç değeri atanıyor
EXEC :v_bind1 := 'MEHMET';

BEGIN
  -- PL/SQL içerisinde bind değişkenlere doğrudan atama yapılamaz.
  -- Bu nedenle önce yerel bir değişkene değer atanır, ardından EXECUTE IMMEDIATE ile bind değişkenine aktarılır.
  DECLARE
    v_temp VARCHAR2(2555) := 'MEHMET BASRIOĞLU';
  BEGIN
    EXECUTE IMMEDIATE 'BEGIN :v_bind1 := :1; END;' USING OUT :v_bind1, v_temp;
  END;
END;
/

-- Gerçek bir tabloya ihtiyaç duymadan değer veya ifade seçimi yapmaya yarayan özel bir tablo
SELECT :v_bind1 AS value FROM DUAL;
