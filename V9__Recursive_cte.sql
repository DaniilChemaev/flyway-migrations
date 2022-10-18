ALTER TABLE doctors RENAME COLUMN head_doctor TO head_doctor_id;

INSERT INTO doctors (fio, gender, speciality, birth_date, phone_number, head_doctor_id) VALUES ('Поддокторов Александр Анатольевич', 'Мужской', 'Медбрат', '01.10.2000', '+79099093999', 1);

WITH RECURSIVE find_all_head_doctors AS (
	SELECT id, fio, head_doctor_id, 1 AS level
	FROM doctors
	WHERE id = 1

	UNION

	SELECT doctors.id, doctors.fio, doctors.head_doctor_id, find_all_head_doctors.level + 1 as level
	FROM doctors
		JOIN find_all_head_doctors
			on cast(doctors.head_doctor_id as bigint) = find_all_head_doctors.id
)

SELECT * FROM find_all_head_doctors;