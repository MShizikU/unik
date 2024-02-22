psql -U shiz -d sidorov_tot_prakt -h localhost -p 5432


--Блок 1--


--Задание 1 / НАЧАЛО --

SELECT * FROM sales_order;

SELECT * FROM item;

BEGIN;
INSERT INTO sales_order (order_date, customer_id, total) VALUES (CURRENT_DATE, 1, 0);

INSERT INTO item (order_id, product_id, actual_price, quantity, total) VALUES (6, 1, 10.00, 2, 20.00);

INSERT INTO item (order_id, product_id, actual_price, quantity, total) VALUES (6, 2, 15.00, 3, 45.00);

SELECT * FROM sales_order;

SELECT * FROM item;

ROLLBACK;

SELECT * FROM sales_order;

SELECT * FROM item;

--Задание 1 / Конец --

--Задание 2 - 3 / НАЧАЛО -- 

BEGIN;

INSERT INTO sales_order (order_date, customer_id, total)
VALUES (CURRENT_DATE, 1, 0);

SAVEPOINT savepoint_item1;
INSERT INTO item (order_id, product_id, actual_price, quantity, total)
VALUES (1, 1, 10.00, 2, 20.00);

SAVEPOINT savepoint_item2;
INSERT INTO item (order_id, product_id, actual_price, quantity, total)
VALUES (1, 2, 15.00, 3, 45.00);

SELECT * FROM sales_order;

SELECT * FROM item;

ROLLBACK TO savepoint_item1;

SELECT * FROM sales_order;

SELECT * FROM item;

INSERT INTO item (order_id, product_id, actual_price, quantity, total)
VALUES (1, 3, 8.00, 4, 32.00);


COMMIT;

ROLLBACK TO savepoint_item1;

SELECT * FROM sales_order;

SELECT * FROM item;

--Задание 2 - 3 / Конец -- 

--Блок 1 / Конец -- 


-- Блок 2 / начало -- 

SELECT * FROM sales_order WHERE total = 1000;

-- Сессия 1 -- 
BEGIN;
UPDATE sales_order SET total = total * 2 WHERE total = 1000;

-- Сессия 2 -- 
BEGIN;
INSERT INTO sales_order (order_date, customer_id, total) VALUES (CURRENT_DATE, 1, 1000);
COMMIT;

-- Сессия 1 --
UPDATE sales_order SET total = total * 2 WHERE total = 1000;
COMMIT;

SELECT * FROM sales_order WHERE order_id = 6;

-- Блок 2 / Конец -- 

-- Блок 3 / Начало --

--Задание 1 / Начало -- 

-- Сессия 1 -- 
BEGIN ISOLATION LEVEL REPEATABLE READ;
UPDATE sales_order SET total = total * 2 WHERE total = 1000;

-- Сессия 2 -- 
BEGIN;
INSERT INTO sales_order (order_date, customer_id, total) VALUES (CURRENT_DATE, 1, 1000);
COMMIT;

-- Сессия 1 --
UPDATE sales_order SET total = total * 2 WHERE total = 1000;
COMMIT;

SELECT * FROM sales_order WHERE order_id = 6;

--Задание 1 / Конец -- 

--Задание 2 / Конец --

--Сессия 1--
BEGIN ISOLATION LEVEL REPEATABLE READ;
SELECT COUNT(*) FROM sales_order where total = 20000;

--Сессия 2--
BEGIN ISOLATION LEVEL REPEATABLE READ;
SELECT COUNT(*) FROM sales_order where total = 30000;

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

--Задание 2 / Конец --

-- Блок 3 / Конец --
