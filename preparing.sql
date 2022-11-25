CREATE TABLE passenger
(
    id            BIGSERIAL primary key,
    surname       varchar(255),
    name          varchar(255),
    middle_name   varchar(255),
    birthday_date date
);

CREATE TABLE flight
(
    id                BIGSERIAL primary key,
    departure_airport int references airport (id),
    arrival_airport   int references airport (id),
    date_of_departure date,
    date_of_arrival   date,
    time_of_departure time,
    time_of_arrival   time,
    minutes_in_flight int,
    plane_id          int references plane (id),
    crew_id           int references crew (id)
);

create table plane
(
    id              BIGSERIAL primary key,
    model           varchar(255),
    on_board_number varchar(255)
);

CREATE TABLE ticket
(
    id BIGSERIAL primary key
);

CREATE TABLE airport
(
    id   BIGSERIAL primary key,
    name varchar(255),
    city varchar(255)
);

CREATE TABLE crew_member
(
    id          BIGSERIAL primary key,
    surname     varchar(255),
    name        varchar(255),
    middle_name varchar(255),
    gender      char
        constraint check_gender CHECK (gender IN ('M', 'F')),
    post        varchar(255)
);

CREATE TABLE crew
(
    id BIGSERIAL primary key
);

ALTER TABLE crew_member
    ADD crew_id BIGINT REFERENCES crew (id);
ALTER TABLE ticket
    ADD flight_id BIGINT REFERENCES flight (id);
ALTER TABLE ticket
    ADD passenger_id BIGINT REFERENCES passenger (id);

INSERT INTO airport(city, name)
VALUES ('Ulyanovsk', 'Barataevka'),
       ('Kazan', 'Kazan'),
       ('Moscow', 'Sheremetevo'),
       ('Saint-Petersburg', 'Pulkovo'),
       ('Antalya', 'Antalya');

INSERT INTO crew(id)
values (1),
       (2);

INSERT INTO crew_member(surname, name, middle_name, post, gender, crew_id)
values ('Dubinin', 'Stepan', 'Mihaylovich', 'Pilot', 'M', 1),
       ('Skvorcov', 'Alexandr', 'Mihaylovich', 'Pilot', 'M', 2),
       ('Sviridov', 'Kirill', 'Makarovich', 'Flight attendant', 'M', 1),
       ('Osipov', 'Kirill', 'Maksimovich', 'Flight attendant', 'M', 1),
       ('Zhukov', 'Daniil', 'Ruslanovich', 'Flight attendant', 'M', 1),
       ('Egorov', 'Alexander', 'Sergeevich', 'Flight attendant', 'M', 2),
       ('Eleseeva', 'Nina', 'Petrovna', 'Flight attendant', 'F', 2),
       ('Arhipova', 'Eva', 'Sergeevna', 'Flight attendant', 'F', 2);

INSERT INTO passenger(surname, name, middle_name, birthday_date)
values ('Chemaev', 'Daniil', 'Sergeevich', '08.01.2003'),
       ('Pavlov', 'Pavel', 'Pavlovich', '02.02.1992'),
       ('Nikitin', 'Nikita', 'Nikitovich', '01.09.1999'),
       ('Eremeev', 'Anton', 'Pavlovich', '10.11.1970'),
       ('Alekseev', 'Aleksey', 'Alekseevich', '02.24.1990');

INSERT INTO plane(model, on_board_number)
VALUES ('Airbus A330', 'BA170'),
       ('Boeing 737', 'AZ132'),
       ('Airbus A320', 'GG289'),
       ('Boeing 727', 'GH341'),
       ('Boeing 777', 'GJ154');

INSERT INTO flight(departure_airport, arrival_airport, date_of_departure, date_of_arrival, time_of_departure,
                   time_of_arrival, minutes_in_flight, plane_id, crew_id)
values (1, 2, '08.08.2022', '08.08.2022', '00:00', '01:00', 60, 1, 1),
       (2, 1, '08.10.2022', '08.10.2022', '08:00', '09:00', 60, 2, 1),
       (2, 3, '08.12.2022', '08.12.2022', '10:00', '12:00', 120, 3, 2),
       (4, 3, '08.20.2022', '08.20.2022', '12:00', '13:00', 60, 4, 2),
       (5, 1, '08.21.2022', '08.21.2022', '00:00', '05:00', 300, 5, 2);

INSERT INTO flight(departure_airport, arrival_airport, date_of_departure, date_of_arrival, time_of_departure,
                   time_of_arrival, minutes_in_flight, plane_id, crew_id)
values (1, 2, '08.08.2022', '08.08.2022', '00:00', '02:00', 120, 2, 2);

INSERT INTO flight(departure_airport, arrival_airport, date_of_departure, date_of_arrival, time_of_departure,
                   time_of_arrival, minutes_in_flight, plane_id, crew_id)
values (2, 1, '08.08.2022', '08.08.2022', '03:00', '05:00', 120, 2, 2);

INSERT INTO ticket(passenger_id, flight_id)
values (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (1, 5);

INSERT INTO ticket(passenger_id, flight_id)
values (2, 1),
       (3, 1);


-- 3
SELECT f.minutes_in_flight, a1.city, a2.city
FROM flight f
         JOIN airport a1 on a1.id = f.departure_airport
         JOIN airport a2 on a2.id = f.arrival_airport
GROUP BY f.minutes_in_flight, a1.city, a2.city
order by f.minutes_in_flight DESC
LIMIT 1;

-- 4
SELECT f.departure_airport, a.city, count(departure_airport) as flights_count
from flight f
         join airport a on a.id = f.departure_airport
where date_of_departure = '08.08.2022'
group by departure_airport, a.city;

-- 5

SELECT p.name, sum(f.minutes_in_flight) as sum_minutes
from ticket t
         join flight f on t.flight_id = f.id
         join passenger p on p.id = t.passenger_id
group by minutes_in_flight, p.id
order by sum_minutes desc
limit 1;

SELECT p.name, sum(f.minutes_in_flight) as sum_minutes
from ticket t
         join flight f on t.flight_id = f.id
         join passenger p on p.id = t.passenger_id
group by minutes_in_flight, p.id
order by sum_minutes
limit 1;

-- 6

CREATE VIEW departure_city AS
SELECT departure_airport.city as city, cm.surname, cm.name, cm.middle_name
FROM flight f
         JOIN crew_member cm ON f.crew_id = cm.crew_id
         JOIN airport departure_airport ON departure_airport.id = f.departure_airport
WHERE cm.post = 'Pilot';

CREATE VIEW arrival_city AS
SELECT arrival_airport.city as city, cm.surname, cm.name, cm.middle_name
FROM flight f
         JOIN crew_member cm ON f.crew_id = cm.crew_id
         JOIN airport arrival_airport ON arrival_airport.id = f.arrival_airport
WHERE cm.post = 'Pilot';

CREATE VIEW cities AS
select *
from arrival_city
union
select *
from departure_city;

select *
from cities;

-- with recursive cities_cte as
--                    (select city::text as all_cities, surname as sur
--                     from cities
--                     where surname = 'Dubinin'
--
--                     union all
--
--                     select cities_cte.all_cities || ', ' || city::text, surname
--                     from cities
--                              join cities_cte on cities.surname = cities_cte.sur and not (cities_cte.all_cities ~ cities.city))
-- select *
-- from cities_cte;