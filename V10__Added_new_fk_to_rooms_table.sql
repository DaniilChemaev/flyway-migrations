ALTER TABLE rooms ADD responsible_doctor_id BIGINT REFERENCES doctors (id);

ALTER TABLE rooms DROP COLUMN responsible_person;

UPDATE rooms SET responsible_doctor_id = 1 WHERE id = 1;
UPDATE rooms SET responsible_doctor_id = 2 WHERE id = 2;
UPDATE rooms SET responsible_doctor_id = 3 WHERE id = 3;
UPDATE rooms SET responsible_doctor_id = 4 WHERE id = 4;
UPDATE rooms SET responsible_doctor_id = 5 WHERE id = 5;
