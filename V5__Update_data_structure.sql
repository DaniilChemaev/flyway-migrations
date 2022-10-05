ALTER TABLE appointment RENAME TO appointments;
ALTER TABLE doctor RENAME TO doctors;
ALTER TABLE patient RENAME TO patients;
ALTER TABLE room RENAME TO rooms;

ALTER TABLE appointments ADD COLUMN time_of_appointment time;
ALTER TABLE appointments RENAME COLUMN date_of_appointpent TO date_of_appointment;

UPDATE appointments SET time_of_appointment='8:00' WHERE id=1;
UPDATE appointments SET time_of_appointment='8:00' WHERE id=2;
UPDATE appointments SET time_of_appointment='8:00' WHERE id=3;
UPDATE appointments SET time_of_appointment='8:00' WHERE id=4;
UPDATE appointments SET time_of_appointment='8:00' WHERE id=5;
UPDATE appointments SET time_of_appointment='9:00' WHERE id=6;
UPDATE appointments SET time_of_appointment='9:00' WHERE id=7;
UPDATE appointments SET time_of_appointment='9:00' WHERE id=8;
UPDATE appointments SET time_of_appointment='9:00' WHERE id=9;
UPDATE appointments SET time_of_appointment='9:00' WHERE id=10;

ALTER TABLE doctors ADD COLUMN work_experience varchar(10);

UPDATE doctors SET work_experience='20 лет' WHERE id=1;
UPDATE doctors SET work_experience='3 года' WHERE id=2;
UPDATE doctors SET work_experience='30 лет' WHERE id=3;
UPDATE doctors SET work_experience='10 лет' WHERE id=4;
UPDATE doctors SET work_experience='2 года' WHERE id=5;