with cte_appointments AS (
    SELECT fio, date_of_appointment from appointments a JOIN patients p on a.patient_id = p.id
)

SELECT * FROM cte_appointments;