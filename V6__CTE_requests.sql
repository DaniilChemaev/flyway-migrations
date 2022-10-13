WITH cte1 AS (
	SELECT fio,
		(CASE
			WHEN gender = 'Женский'
				THEN 'Подарок'
			ELSE '-'
		END) gift_status
	FROM doctors
)

SELECT fio, gift_status from cte1;


WITH cte_appointments AS(
	SELECT date_of_appointment,
	(CASE 
		WHEN room_id < 5
			THEN 'Первый этаж'
		ELSE 'Второй этаж'
	END) floor

	FROM appointments
)

SELECT * FROM cte_appointments;


WITH t AS (
	UPDATE appointments
	SET time_of_appointment = '10:00:00'
	WHERE time_of_appointment = '08:00:00'
	RETURNING *
)

SELECT * from appointments;


WITH t AS (
	UPDATE appointments
	SET time_of_appointment = '10:00:00'
	WHERE time_of_appointment = '08:00:00'
	RETURNING *
)

SELECT * from appointments;


INSERT INTO patients (fio, gender, birth_date, phone_number) VALUES ('Удаленнов Удален Удаленович', 'Мужской', '01.01.1991', '+79999999999');

WITH t AS (
	SELECT fio from patients
	WHERE fio = 'Удаленнов Удален Удаленович'
)

DELETE FROM patients WHERE fio in (SELECT * from t);