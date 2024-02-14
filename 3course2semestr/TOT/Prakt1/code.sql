CREATE DATABASE prakt1

SET schema 'prakt1';

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
