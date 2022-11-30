-- 1
CREATE TABLE person
(
    surname         varchar(255) NOT NULL,
    name            varchar(255) NOT NULL,
    middle_name     varchar(255),
    birthday_date   date         NOT NULL,
    document_type   varchar      NOT NULL CHECK ( document_type = 'Passport' or document_type = 'Driving License' ),
    document_series integer      NOT NULL CHECK ( 0000 <= document_series and document_series <= 9999),
    document_number integer      NOT NULL CHECK ( 000000 <= document_series and document_series <= 999999),
    address         varchar(255) NOT NULL,
    PRIMARY KEY (document_series, document_number)
);

CREATE TABLE office
(
    id      BIGSERIAL PRIMARY KEY,
    city    varchar(255) NOT NULL,
    address varchar(255) NOT NULL
);

CREATE TABLE dept
(
    sum                    integer               NOT NULL CHECK ( sum <= 150000 ),
    date_of_taking         date                  NOT NULL,
    date_of_return         date                  NOT NULL CHECK ( date_of_return - dept.date_of_taking <= 61 ),
    person_document_series integer               NOT NULL,
    person_document_number integer               NOT NULL,
    office_id              int REFERENCES office NOT NULL,
    isActive               boolean               NOT NULL,
    FOREIGN KEY (person_document_series, person_document_number) REFERENCES person (document_series, document_number)
);

-- 2

INSERT INTO person(surname, name, middle_name, document_type, birthday_date, document_series, document_number, address)
VALUES ('Dubinin', 'Stepan', 'Mihaylovich', 'Passport', '01.01.1999', 7377, 890987, 'Kazan, Kremlevskaya 27'),
       ('Skvorcov', 'Alexandr', 'Mihaylovich', 'Passport', '10.05.1970', 1678, 890987, 'Kazan, Kremlevskaya 5'),
       ('Sviridov', 'Kirill', 'Makarovich', 'Passport', '12.09.1990', 6788, 436785, 'Kazan, Kremlevskaya 12'),
       ('Osipov', 'Kirill', 'Maksimovich', 'Driving License', '09.06.1981', 2345, 345221, 'Kazan, Kremlevskaya 99'),
       ('Zhukov', 'Daniil', 'Ruslanovich', 'Passport', '10.12.1988', 1278, 765789, 'Kazan, Kremlevskaya 23');

INSERT INTO office(city, address)
VALUES ('Ulyanovsk', 'Repina 27'),
       ('Kazan', 'Kremlevskaya 20'),
       ('Ulyanovsk', 'Lenina 89'),
       ('Kazan', 'Adela Kutuya 3');

INSERT INTO dept(sum, date_of_taking, date_of_return, person_document_series, person_document_number, office_id,
                 isActive)
VALUES (20000, '11.30.2022', '12.30.2022', 7377, 890987, 1, true),
       (10000, '01.01.2018', '02.15.2018', 1678, 890987, 1, false),
       (10000, '01.10.2018', '03.05.2018', 1678, 890987, 2, false),
       (35000, '11.30.2022', '01.10.2023', 6788, 436785, 2, true),
       (12500, '11.15.2022', '12.30.2022', 2345, 345221, 3, true),
       (50000, '09.15.2022', '11.11.2022', 2345, 345221, 3, true),
       (11000, '09.30.2022', '11.20.2022', 1278, 765789, 2, true),
       (10000, '10.30.2022', '11.29.2022', 1278, 765789, 2, true);

-- 3
SELECT DISTINCT p.surname, p.name, p.middle_name
FROM dept d
         JOIN person p
              ON p.document_series = d.person_document_series AND p.document_number = d.person_document_number
WHERE d.isActive;

-- 4
SELECT sum(d.sum) AS total_sum, o.city
FROM dept d
         JOIN office o ON o.id = d.office_id
GROUP BY o.city
ORDER BY total_sum DESC
LIMIT 1;

-- 5
SELECT (sum(d.sum + d.sum * (cast(current_date - d.date_of_return as decimal) / 100))) as total_sum_of_dept,
       p.surname,
       p.name,
       p.middle_name,
       p.address
FROM dept d
         JOIN person p on p.document_series = d.person_document_series and p.document_number = d.person_document_number
WHERE current_date - d.date_of_return > 0
  AND isActive
group by p.surname, p.name, p.middle_name, p.address ORDER BY total_sum_of_dept DESC ;
