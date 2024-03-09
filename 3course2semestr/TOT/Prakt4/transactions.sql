psql -U postgres -d prakt78 -h localhost -p 5435


--Задание 1--
--Сессия 1--
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT COUNT(*) FROM sales_order WHERE total = 20000;
INSERT INTO sales_order (order_date, customer_id, total) VALUES (CURRENT_DATE, 1, 30000);
SELECT pg_export_snapshot();

--Сессия 2--
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SET TRANSACTION SNAPSHOT '00000003-00000003-1';
SELECT COUNT(*) FROM sales_order WHERE total = 30000;

--Сессия 1--
SELECT COUNT(*) FROM sales_order where total = 20000;
SELECT COUNT(*) FROM sales_order WHERE total = 30000;

--Сессия 2--
INSERT INTO sales_order (order_date, customer_id, total) VALUES (CURRENT_DATE, 1, 20000);
SELECT COUNT(*) FROM sales_order WHERE total = 30000;
SELECT COUNT(*) FROM sales_order where total = 20000;

--Сессия 1--
COMMIT;

--Сессия 2--
COMMIT;
--Задание 1--


--Задание 2--
--Сессия 1--
BEGIN ISOLATION LEVEL REPEATABLE READ;
SELECT COUNT(*) FROM sales_order WHERE total = 20000;
INSERT INTO sales_order (order_date, customer_id, total) VALUES (CURRENT_DATE, 1, 30000);
SELECT pg_export_snapshot();

--Сессия 2--
BEGIN ISOLATION LEVEL REPEATABLE READ;
SET TRANSACTION SNAPSHOT '00000003-00000003-1';
SELECT COUNT(*) FROM sales_order WHERE total = 30000;

--Сессия 1--
SELECT COUNT(*) FROM sales_order where total = 20000;
SELECT COUNT(*) FROM sales_order WHERE total = 30000;

--Сессия 2--
INSERT INTO sales_order (order_date, customer_id, total) VALUES (CURRENT_DATE, 1, 20000);
SELECT COUNT(*) FROM sales_order WHERE total = 30000;
SELECT COUNT(*) FROM sales_order where total = 20000;

--Сессия 1--
COMMIT;

--Сессия 2--
COMMIT;
--Задание 2--