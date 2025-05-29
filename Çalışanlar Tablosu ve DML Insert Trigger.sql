-- Veri Manipülasyon Dili (DML) tetikleyicisi (trigger) oluşturma örneği

-- Tablo varsa temizleniyor
DROP TABLE employees;

-- Örnek tablo oluşturuluyor
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR2(255),
    created_by varchar(255),
    created_at DATE  -- Ekleme tarihi için alan
);

-- Sunucu çıktısı aktif hale getiriliyor
SET SERVEROUTPUT ON;

-- BEFORE INSERT tetikleyicisi oluşturuluyor
CREATE OR REPLACE TRIGGER bi_employee
BEFORE INSERT ON employees
FOR EACH ROW
ENABLE
DECLARE
    v_employee_name VARCHAR2(255);
BEGIN
    -- Yeni eklenecek satırdaki çalışan ismi alınarak bir değişkene atanıyor
    v_employee_name := :NEW.emp_name;

    -- Çalışan ismi ekrana yazdırılıyor
    DBMS_OUTPUT.PUT_LINE('Ekleme yapılacak çalışan ismi: ' || v_employee_name);
END;
/

-- AFTER INSERT tetikleyicisi oluşturuluyor
CREATE OR REPLACE TRIGGER ai_employee
AFTER INSERT ON employees
FOR EACH ROW
ENABLE
DECLARE
    v_employee_name VARCHAR2(255);
    v_created_at DATE;
    v_created_by varchar(255);
BEGIN
    -- Yeni eklenen satırdaki bilgiler değişkenlere atanıyor
    v_employee_name := :NEW.emp_name;
    v_created_at := sysdate;
    v_created_by := user;

    -- Çalışan ismi ve eklenme tarihi ekrana yazdırılıyor
    DBMS_OUTPUT.PUT_LINE('Başarıyla ekleme yapılan çalışan: ' || v_employee_name || ' | Tarih: ' || TO_CHAR(v_created_at, 'DD-MM-YYYY HH24:MI:SS') || 'Ekleyen Kullanıcı: ' || v_created_by);
END;
/
