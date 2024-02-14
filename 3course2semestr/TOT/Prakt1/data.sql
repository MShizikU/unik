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
('Customer 1', '123 Main St', 'City A', 'CA', '12345', 123, 4567890, 1, 10000.00),
('Customer 2', '456 Elm St', 'City B', 'NY', '54321', 456, 7890123, 2, 15000.00),
('Customer 3', '789 Oak St', 'City C', 'TX', '67890', 789, 1234567, 3, 20000.00),
('Customer 4', '101 Pine St', 'City D', 'FL', '09876', 234, 5678901, 4, 25000.00),
('Customer 5', '202 Maple St', 'City E', 'WA', '56789', 345, 6789012, 5, 30000.00);

INSERT INTO SALES_ORDER (order_date, customer_id, ship_date, total) VALUES
('2023-01-01', 1, '2023-01-05', 1000.00),
('2023-02-01', 2, '2023-02-05', 1500.00),
('2023-03-01', 3, '2023-03-05', 2000.00),
('2023-04-01', 4, '2023-04-05', 2500.00),
('2023-05-01', 5, '2023-05-05', 3000.00);

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
