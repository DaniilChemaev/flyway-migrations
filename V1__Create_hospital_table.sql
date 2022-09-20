CREATE TABLE patient (
    id BIGSERIAL,
    fio VARCHAR(255),
    gender VARCHAR(50),
    birth_date DATE,
    phone_number VARCHAR(20)
);

CREATE TABLE doctor (
    id BIGSERIAL PRIMARY KEY,
    fio VARCHAR(255) NOT NULL,
    gender VARCHAR(50) NOT NULL, speciality VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE room (
    id BIGSERIAL PRIMARY KEY,
    room_number VARCHAR(4) NOT NULL,
    responsible_person VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE appointment (
    id BIGSERIAL PRIMARY KEY,
    date_of_appointpent date NOT NULL
);

ALTER TABLE appointment ADD patient_id BIGINT REFERENCES patient (id);

ALTER TABLE appointment ADD doctor_id BIGINT REFERENCES doctor (id);

ALTER TABLE appointment ADD room_id BIGINT REFERENCES room (id);
