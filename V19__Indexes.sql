EXPLAIN ANALYSE
SELECT MAX(cast(work_experience as INT)) as max_doctors_experience
FROM doctors;

EXPLAIN ANALYSE
SELECT MIN(cast(work_experience as INT)) as min_doctors_experience
FROM doctors;

EXPLAIN ANALYSE
SELECT COUNT(id)
FROM doctors;

EXPLAIN ANALYSE
SELECT AVG((current_date - birth_date) / 365) as avg_age
FROM doctors;

CREATE INDEX doctor_work_experience_idx on doctors (work_experience);

CREATE INDEX doctor_name ON doctors USING hash (fio);

EXPLAIN ANALYSE
SELECT AVG(cast(work_experience as INT)) as max_doctors_experience
FROM doctors;

EXPLAIN ANALYSE
SELECT id, fio, speciality
FROM doctors
WHERE fio = 'Совсемподхирургов Павел Григорьевич';