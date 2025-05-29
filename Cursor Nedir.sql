-- Cursor: Verileri tutar ancak bellekten okumaz. Ne zaman bellekten okur? Open ile çalıştırldığı zaman belleğe alır ve fetchle okunur.
-- Context Area memory deki bir pga alanıdır. önemli bilgiler burada tutulur.

-- Implicit Cursor: Otomatik olarak oracle server tarafından oluşturulur. Kullanıcılar kontrol etmez.
-- Explicit Cursor: Kullanıcı tanımlı cursorlardır. Declare -> Open ->Fetch -> Close ile cursor kapatılır.


SET SERVEROUTPUT ON;

DECLARE

    V_NAME varchar(255);
    
    -- Cursor
    CURSOR cur_example is SELECT emp_name from employees;
    
BEGIN

    open cur_example;
    
    LOOP
        FETCH cur_example INTO V_NAME;
        DBMS_OUTPUT.PUT_LINE('V_NAME:' || v_name);
        EXIT WHEN cur_example%NOTFOUND;
    END LOOP;
END;