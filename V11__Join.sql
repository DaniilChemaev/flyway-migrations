ALTER TABLE rooms DROP COLUMN phone_number;

SELECT * FROM appointments INNER JOIN patients on appointments.patient_id = patients.id;
SELECT * FROM appointments INNER JOIN doctors on appointments.doctor_id = doctors.id;

SELECT * FROM appointments LEFT JOIN doctors on appointments.doctor_id = doctors.id;

SELECT * FROM appointments RIGHT JOIN doctors on appointments.doctor_id = doctors.id;

SELECT d.id, d.fio, d.speciality, r.id, r.room_number FROM doctors d FULL JOIN rooms r on d.id = r.responsible_doctor_id;

SELECT * FROM patients CROSS JOIN appointments;

SELECT * FROM rooms NATURAL JOIN doctors;

SELECT
    head_doctor.id,
    head_doctor.fio,
    doctor.id,
    doctor.fio
FROM doctors head_doctor
JOIN doctors doctor
ON doctor.head_doctor_id = cast(head_doctor.id as varchar);
