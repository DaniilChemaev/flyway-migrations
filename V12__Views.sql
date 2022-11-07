CREATE VIEW doctors_surname_starts_with_P
AS SELECT * FROM doctors
WHERE fio LIKE 'П%';

CREATE VIEW doctors_id
AS SELECT fio, id FROM doctors_surname_starts_with_P
WHERE id < 5
WITH LOCAL CHECK OPTION;

CREATE VIEW doctors_with_name_alexander
AS SELECT fio FROM doctors
WHERE fio LIKE '%Александр %'
WITH CASCADED CHECK OPTION;