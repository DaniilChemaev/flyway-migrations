create materialized view head_doctors as
    select * from doctors where head_doctor_id IS NULL;

create materialized view first_floor_rooms as
    select * from rooms where room_number LIKE '1%';

select * from first_floor_rooms;
