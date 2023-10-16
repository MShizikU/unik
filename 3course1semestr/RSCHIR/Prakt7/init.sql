CREATE DATABASE prakt6;

CREATE TABLE contact (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL
);

CREATE TABLE product (
    id BIGSERIAL PRIMARY KEY,
    price NUMERIC(10,2) NOT NULL,
    type VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    amount INT NOT NULL
);

CREATE TABLE books (
    id BIGSERIAL PRIMARY KEY,
    author VARCHAR(255) NOT NULL,
    seller_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    FOREIGN KEY (seller_id) REFERENCES contact(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE telephones (
    id BIGSERIAL PRIMARY KEY,
    manufacturer VARCHAR(255) NOT NULL,
    battery_capacity INT NOT NULL,
    seller_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    FOREIGN KEY (seller_id) REFERENCES contact(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE bucket(
    id BIGSERIAL PRIMARY KEY,
    contact_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    amount INT NOT NULL,
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

INSERT INTO contact (name, lastname, phone_number) VALUES
    ('John', 'Doe', '8 800 555 35 35'),
    ('Jane', 'Doe', '8 900 555 35 35'),
    ('Bob', 'Smith', '8 999 555 35 35');

-- Заполнение таблицы product
INSERT INTO product (price, type, name, amount) VALUES
    (19.99, 'Book', 'The Great Gatsby', 100),
    (9.99, 'Phone', 'Samsung Galaxy S21', 21),
    (499.99, 'Washing Machine', 'LG Front Load Washer', 32);

INSERT INTO books (author, seller_id, product_id) VALUES
    ('F. Scott Fitzgerald', 1, 1),
    ('Ernest Hemingway', 2, 1);

INSERT INTO telephones (manufacturer, battery_capacity, seller_id, product_id) VALUES
    ('Samsung', 3000, 1, 2),
    ('Samsung', 4000, 2, 2);
