INSERT INTO doctor (fio, gender, speciality, birth_date, phone_number) VALUES ('Докторов Анатолий Евгеньевич', 'Мужской', 'Терапевт', '01.01.1987', '89991234567');

INSERT INTO doctor (fio, gender, speciality, birth_date, phone_number) VALUES ('Хирургов Григорий Павлович', 'Мужской', 'Хирург', '01.10.1999', '88005553535');

INSERT INTO doctor (fio, gender, speciality, birth_date, phone_number) VALUES ('Терапевтов Максим Юрьевич', 'Мужской', 'Терапевт', '08.10.1970', '89008007766');

INSERT INTO doctor (fio, gender, speciality, birth_date, phone_number) VALUES ('Стоматологина Нина Ивановна', 'Женский', 'Стоматолог', '10.01.1987', '89998887766');

INSERT INTO doctor (fio, gender, speciality, birth_date, phone_number) VALUES ('Онкологов Николай Александрович', 'Мужской', 'Онколог', '08.01.2000', '899877896754');

INSERT INTO patient (fio, gender, birth_date, phone_number) VALUES ('Чемаев Даниил Сергеевич', 'Мужской', '01.08.2003', '+79969536241');

INSERT INTO patient (fio, gender, birth_date, phone_number) VALUES ('Павлов Павел Павлович', 'Мужской', '01.06.1999', '+79865434567');

INSERT INTO patient (fio, gender, birth_date, phone_number) VALUES ('Пациентов Михаил Николаевич', 'Мужской', '10.10.1978', '+79698757485');

INSERT INTO patient (fio, gender, birth_date, phone_number) VALUES ('Сергеев Сергей Сергеевич', 'Мужской', '01.01.2001', '+79678576565');

INSERT INTO patient (fio, gender, birth_date, phone_number) VALUES ('Довлатов Сергей Донатович', 'Мужской', '09.03.1941', '+79999999999');

INSERT INTO appointment (date_of_appointpent) VALUES ('09.20.2022');

INSERT INTO appointment (date_of_appointpent) VALUES ('09.22.2022');

INSERT INTO appointment (date_of_appointpent) VALUES ('10.22.2022');

INSERT INTO appointment (date_of_appointpent) VALUES ('08.21.2022');

INSERT INTO appointment (date_of_appointpent) VALUES ('01.01.2022');

INSERT INTO appointment (date_of_appointpent) VALUES ('09.20.2022');

INSERT INTO appointment (date_of_appointpent) VALUES ('09.22.2022');

INSERT INTO appointment (date_of_appointpent) VALUES ('10.22.2022');

INSERT INTO appointment (date_of_appointpent) VALUES ('08.21.2022');

INSERT INTO appointment (date_of_appointpent) VALUES ('01.01.2022');

INSERT INTO room (room_number, responsible_person, phone_number) VALUES ('104', 'Ответвственнова Людмила Григорьевна', '+71234567890');

INSERT INTO room (room_number, responsible_person, phone_number) VALUES ('105', 'Безответсвеннова Антонина Викторовна', '+79876543210');

INSERT INTO room (room_number, responsible_person, phone_number) VALUES ('106', 'Случайнов Николай Николаевич', '+79625676544');

INSERT INTO room (room_number, responsible_person, phone_number) VALUES ('107', 'Шомов Максим Максимович', '+79887656765');

INSERT INTO room (room_number, responsible_person, phone_number) VALUES ('108', 'Ничаев Павел Викторович', '+79996545443');

UPDATE appointment SET patient_id=1, doctor_id=1, room_id=1 WHERE id=1;

UPDATE appointment SET patient_id=2, doctor_id=2, room_id=2 WHERE id=2;

UPDATE appointment SET patient_id=3, doctor_id=2, room_id=3 WHERE id=3;

UPDATE appointment SET patient_id=4, doctor_id=3, room_id=4 WHERE id=4;

UPDATE appointment SET patient_id=5, doctor_id=4, room_id=5 WHERE id=5;

UPDATE appointment SET patient_id=1, doctor_id=5, room_id=5 WHERE id=6;

UPDATE appointment SET patient_id=2, doctor_id=4, room_id=4 WHERE id=7;

UPDATE appointment SET patient_id=3, doctor_id=3, room_id=3 WHERE id=8;

UPDATE appointment SET patient_id=4, doctor_id=2, room_id=2 WHERE id=9;

UPDATE appointment SET patient_id=5, doctor_id=1, room_id=1 WHERE id=10;
