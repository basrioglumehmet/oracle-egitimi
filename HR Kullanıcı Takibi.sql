-- INSAN KAYNAKLARI SISTEME GİRİŞ ZAMANLARI KONTROL ETME

CREATE TABLE hr_evnt_audit(
    event_type varchar(255),
    logon_date date,
    logon_time varchar(255),
    logoff_date date,
    logoff_time varchar(255)
);

CREATE OR REPLACE TRIGGER blogon_hr
AFTER LOGON on SCHEMA
BEGIN
INSERT INTO hr_evnt_audit VALUES(
    ora_sysevent,
    sysdate,
    TO_CHAR(sysdate,'HH24:mi:ss'),
    NULL,
    NULL
    );
    COMMIT;
END;