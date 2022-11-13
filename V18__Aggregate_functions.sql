SELECT MAX(cast(work_experience as INT)) as max_doctors_experience
FROM doctors;

SELECT MIN(cast(work_experience as INT)) as min_doctors_experience
FROM doctors;

SELECT COUNT(id)
FROM doctors;

SELECT AVG((current_date - birth_date) / 365) as avg_age
FROM doctors;
