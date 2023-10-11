-- Remove all records
TRUNCATE TABLE city CASCADE;
TRUNCATE TABLE country CASCADE;
ALTER SEQUENCE country_id_seq RESTART WITH 1;
ALTER SEQUENCE city_id_seq RESTART WITH 1;


INSERT INTO country(name, population, last_status_change) VALUES
  ('Germany', 83190556, '1990-10-03'),
  ('France', 67413000, '1958-10-04'),
  ('Namibia', 2550226, '1990-03-21'),
  ('Uruguay', 3518552, '1830-07-18'),
  ('Kazakhstan', 18711560, '1995-08-30')
;


INSERT INTO city(name, area, is_capital, country_id) VALUES
  ('Nur-Sultan', 810.2, true, 5),
  ('Montevideo', 201, true, 4),
  ('Florida', 8.2, false, 4),
  ('Windhoek', 5133, true, 3),
  ('Swakopmund', 196.3, false, 3),
  ('Marseille', 240.62, false, 2),
  ('Berlin', 891.7, true, 1),
  ('Salto', 14.2, false, 4),
  ('Rio Negro', 9.3, false, 4),
  ('Maldonado', 4.8, false, 4),
  ('Flores', 5.1, false, 4),
  ('Paris', 105.4, true, 2),
  ('Lyon', 47.87, false, 2),
  ('Toulouse', 118.3, false, 2),
  ('Nice', 71.92, false, 2),
  ('Hamburg', 755.22, false, 1),
  ('Munich', 310.71, false, 1),
  ('Frankfurt', 248.31, false, 1)
;
