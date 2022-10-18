ALTER TABLE doctors ADD head_doctor varchar(100) DEFAULT null;

INSERT INTO doctor (fio, gender, speciality, birth_date, phone_number, head_doctor) VALUES ('Поддокторов Евгений Анатольевич', 'Мужской', 'Медбрат', '01.10.2000', '+79099099999', 1);
INSERT INTO doctor (fio, gender, speciality, birth_date, phone_number, head_doctor) VALUES ('Подхирургов Павел Григорьевич', 'Мужской', 'Медбрат', '01.03.1999', '+79543251567', 2);
INSERT INTO doctor (fio, gender, speciality, birth_date, phone_number, head_doctor) VALUES ('Подтерапевтов Юрий Максимович', 'Мужской', 'Медбрат', '10.05.1990', '+79987567878', 3);
INSERT INTO doctor (fio, gender, speciality, birth_date, phone_number, head_doctor) VALUES ('Подстоматологина Ивана Николевна', 'Женский', 'Медсестра', '11.06.1998', '+79025768345', 4);
INSERT INTO doctor (fio, gender, speciality, birth_date, phone_number, head_doctor) VALUES ('Подонкологов Александр Николаевич', 'Мужской', 'Медбрат', '10.01.2000', '+79058473829', 5);