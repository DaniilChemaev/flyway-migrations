ALTER TABLE doctors ADD CONSTRAINT check_gender CHECK (gender IN ('Мужской', 'Женский'));

ALTER TABLE doctors ADD CONSTRAINT check_phone_number CHECK (phone_number ~ '^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$');

ALTER TABLE patients ADD CONSTRAINT check_gender CHECK (gender IN ('Мужской', 'Женский'));

ALTER TABLE patients ADD CONSTRAINT check_phone_number CHECK (phone_number ~ '^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$');

ALTER TABLE rooms ADD CONSTRAINT check_room_number CHECK (room_number ~ '[1-5][0-9][0-9]');