CREATE TABLE LOCATION (
    location_id SERIAL PRIMARY KEY,
    regional_group VARCHAR(20)
);

CREATE TABLE DEPARTMENT (
    department_id SERIAL PRIMARY KEY,
    name VARCHAR(14),
    location_id INTEGER,
    FOREIGN KEY (location_id) REFERENCES LOCATION (location_id)
);

CREATE TABLE JOB (
    job_id SERIAL PRIMARY KEY,
    function VARCHAR(30)
);

CREATE TABLE EMPLOYEE (
    employee_id SERIAL PRIMARY KEY,
    last_name VARCHAR(15),
    first_name VARCHAR(15),
    middle_initial VARCHAR(1),
    manager_id INTEGER,
    CONSTRAINT ref_emp_manager FOREIGN KEY (manager_id) REFERENCES EMPLOYEE(employee_id),
    job_id INTEGER,
    hire_date DATE,
    salary NUMERIC(7,2),
    commission NUMERIC(7,2),
    department_id INTEGER,
    FOREIGN KEY (job_id) REFERENCES JOB (job_id),
    FOREIGN KEY (department_id) REFERENCES DEPARTMENT (department_id)
);

CREATE TABLE CUSTOMER (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(45),
    address VARCHAR(40),
    city VARCHAR(30),
    state VARCHAR(2),
    zip_code VARCHAR(9),
    area_code SMALLINT,
    phone_number SMALLINT,
    salesperson_id INTEGER,
    credit_limit NUMERIC(9,2),
    comments TEXT,
    FOREIGN KEY (salesperson_id) REFERENCES EMPLOYEE (employee_id)
);

CREATE TABLE SALES_ORDER (
    order_id SERIAL PRIMARY KEY,
    order_date DATE,
    customer_id INTEGER,
    ship_date DATE,
    total NUMERIC(8,2),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMER (customer_id)
);

CREATE TABLE PRODUCT (
    product_id SERIAL PRIMARY KEY,
    description VARCHAR(30)
);

CREATE TABLE ITEM (
    item_id SERIAL,
    order_id INTEGER,
    product_id INTEGER,
    actual_price NUMERIC(8,2),
    quantity INTEGER,
    total NUMERIC(8,2),
    PRIMARY KEY (item_id, order_id),
    FOREIGN KEY (order_id) REFERENCES SALES_ORDER (order_id),
    FOREIGN KEY (product_id) REFERENCES PRODUCT (product_id)
);

CREATE TABLE PRICE (
    product_id INTEGER,
    start_date DATE,
    list_price NUMERIC(8,2),
    min_price NUMERIC(8,2),
    end_date DATE,
    PRIMARY KEY (product_id, start_date),
    FOREIGN KEY (product_id) REFERENCES PRODUCT (product_id)
);

INSERT INTO LOCATION (regional_group) VALUES 
('Area A'),
('Area B'),
('Area C'),
('Area D'),
('Area E');

INSERT INTO DEPARTMENT (name, location_id) VALUES 
('Department 1', 1),
('Department 2', 2),
('Department 3', 3),
('Department 4', 4),
('Department 5', 5);

INSERT INTO JOB (function) VALUES 
('Function 1'),
('Function 2'),
('Function 3'),
('Function 4'),
('Function 5');

INSERT INTO EMPLOYEE (last_name, first_name, middle_initial, manager_id, job_id, hire_date, salary, commission, department_id) VALUES
('Doe', 'John', 'A', NULL, 1, '2023-01-01', 50000.00, 2000.00, 1),
('Smith', 'Alice', 'B', 1, 2, '2023-02-01', 55000.00, 2500.00, 2),
('Johnson', 'Robert', 'C', 1, 3, '2023-03-01', 60000.00, 3000.00, 3),
('Brown', 'Emily', 'D', 2, 4, '2023-04-01', 65000.00, 3500.00, 4),
('Davis', 'Michael', 'E', 2, 5, '2023-05-01', 70000.00, 4000.00, 5);

INSERT INTO CUSTOMER (name, address, city, state, zip_code, area_code, phone_number, salesperson_id, credit_limit) VALUES
('Customer 1', '123 Main St', 'City A', 'CA', '12345', 123, 132, 1, 10000.00),
('Customer 2', '456 Elm St', 'City B', 'NY', '54321', 456, 465, 2, 15000.00),
('Customer 3', '789 Oak St', 'City C', 'TX', '67890', 789, 423, 3, 20000.00),
('Customer 4', '101 Pine St', 'City D', 'FL', '09876', 234, 123, 4, 25000.00),
('Customer 5', '202 Maple St', 'City E', 'WA', '56789', 345, 3641, 5, 30000.00);

INSERT INTO SALES_ORDER (order_date, customer_id, ship_date, total) VALUES
('2023-01-01', 1, '2023-01-05', 200.00),
('2023-02-01', 2, '2023-02-05', 150.00),
('2023-03-01', 3, '2023-03-05', 300.00),
('2023-04-01', 4, '2023-04-05', 400.00),
('2023-05-01', 5, '2023-05-05', 500.00);

WITH RandomDates AS (
    SELECT 
        DATE '2023-01-01' + INTERVAL '1 day' * ROUND(RANDOM() * (DATE '2023-12-31' - DATE '2023-01-01')) AS order_date,
        FLOOR(RANDOM() * 5) + 1 AS customer_id,
        DATE '2023-01-01' + INTERVAL '1 day' * ROUND(RANDOM() * 30) AS ship_date,
        ROUND(RANDOM() * 10000) AS total
    FROM generate_series(1, 100)
)
INSERT INTO SALES_ORDER (order_date, customer_id, ship_date, total)
SELECT order_date, customer_id, ship_date, total
FROM RandomDates;

INSERT INTO PRODUCT (description) VALUES
('Product 1'),
('Product 2'),
('Product 3'),
('Product 4'),
('Product 5');

INSERT INTO ITEM (order_id, product_id, actual_price, quantity, total) VALUES
(1, 1, 10.00, 1, 10.00),
(2, 2, 20.00, 2, 40.00),
(3, 3, 30.00, 3, 90.00),
(4, 4, 40.00, 4, 160.00),
(5, 5, 50.00, 5, 250.00);

INSERT INTO PRICE (product_id, start_date, list_price, min_price, end_date) VALUES
(1, '2024-01-01', 10.00, 8.00, '2024-12-31'),
(2, '2024-01-01', 20.00, 16.00, '2024-12-31'),
(3, '2024-01-01', 30.00, 24.00, '2024-12-31'),
(4, '2024-01-01', 40.00, 32.00, '2024-12-31'),
(5, '2024-01-01', 50.00, 40.00, '2024-12-31');