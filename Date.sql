SELECT now();

CREATE Table timeZones(ts TIMESTAMP without time zone ,tz TIMESTAMP with time zone);

INSERT into timezones VALUES('2025-1-12 10:45','2024-1-12 9:45');
SELECT * FROM timezones;

SELECT CURRENT_DATE;
SELECT current_time;
SELECT now():: date;
SELECT now() :: TIME;

SELECT to_char(now(),'dd-mm-yyyy');
SELECT to_char(now(),'Month');
SELECT to_char(now(),'ddd');

SELECT CURRENT_DATE - INTERVAL '2 year';
SELECT CURRENT_DATE - INTERVAL '1 year 1 month';
SELECT age('2017-04-16','2026-01-2');
SELECT *, age(CURRENT_DATE,dob) FROM students;
SELECT extract(MONTH FROM '2023-06-25'::date);
