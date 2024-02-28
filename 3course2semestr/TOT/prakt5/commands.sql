pg_dump -U shiz -d sidorov_tot_prakt -h localhost -p 5435 > backup.sql

createdb -U shiz -h localhost -p 5435 tmp_prakt_database

psql -U shiz -d tmp_prakt_database -h localhost -p 5435 < backup.sql

psql -U shiz -d tmp_prakt_database -h localhost -p 5435

BEGIN;
INSERT INTO SALES_ORDER (order_date, customer_id, ship_date, total) VALUES('2024-02-01', 2, '2024-02-05', 180.00);
COMMIT;

BEGIN;
INSERT INTO SALES_ORDER (order_date, customer_id, ship_date, total) VALUES('2024-02-03', 2, '2024-02-06', 200.00);
COMMIT;

SELECT * FROM sales_order;

dropdb -U shiz -h localhost -p 5435 tmp_prakt_database

createdb -U shiz -h localhost -p 5435 tmp_prakt_database
psql -U shiz -d tmp_prakt_database -h localhost -p 5435 < backup.sql

psql -U shiz -d tmp_prakt_database -h localhost -p 5435

SELECT * FROM sales_order;