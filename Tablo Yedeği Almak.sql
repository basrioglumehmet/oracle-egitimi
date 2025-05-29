-- Tablo Yedeği Alma
--  where 1=2 konursa sadece tablo yedeği alır fakat konulmadığı taktirde tüm verilerle birlikte yedeklenir ama trigger ya da prosedürler oluşturulmaz.
DROP TABLE backup_employees;
DESC employees;
CREATE TABLE backup_employees as select * from employees;
