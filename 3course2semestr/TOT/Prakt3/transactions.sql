psql -U shiz -d sidorov_tot_prakt -h localhost -p 5435

--Сессия 1--
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT COUNT(*) FROM sales_order WHERE total = 20000;

--Сессия 2--
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT COUNT(*) FROM sales_order WHERE total = 30000;

--Сессия 1--
INSERT INTO sales_order (order_date, customer_id, total) VALUES (CURRENT_DATE, 1, 30000);
SELECT COUNT(*) FROM sales_order where total = 20000;

--Сессия 2--
INSERT INTO sales_order (order_date, customer_id, total) VALUES (CURRENT_DATE, 1, 20000);
SELECT COUNT(*) FROM sales_order WHERE total = 30000;

--Сессия 1--
COMMIT;

--Сессия 2--
COMMIT;