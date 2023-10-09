CREATE DATABASE IF NOT EXISTS prakt6;

USE prakt6;

CREATE TABLE contact (
    id BIGINT(20) NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
);

CREATE TABLE product (
    id BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    price DECIMAL(10,2) NOT NULL,
    type VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE books (
    id BIGINT(20) NOT NULL AUTO_INCREMENT,
    author VARCHAR(255) NOT NULL,
    seller_id BIGINT(20) NOT NULL,
    product_id BIGINT(20) NOT NULL
    PRIMARY KEY (id)
);

CREATE TABLE telephones (
    id BIGINT(20) NOT NULL AUTO_INCREMENT,
    manufacturer VARCHAR(255) NOT NULL,
    battery_capacity INT(11) NOT NULL,
    seller_id BIGINT(20) NOT NULL,
    product_id BIGINT(20) NOT NULL
    PRIMARY KEY (id)
);

CREATE TABLE washing_machines (
    id BIGINT(20) NOT NULL AUTO_INCREMENT,
    manufacturer VARCHAR(255) NOT NULL,
    tank_capacity INT(11) NOT NULL,
    seller_id BIGINT(20) NOT NULL,
    product_id BIGINT(20) NOT NULL
    PRIMARY KEY (id)
);

CREATE TABLE bucket(
    id BIGINT(20) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    contact_id BIGINT(20) NOT NULL,
    product_id BIGINT(20) NOT NULL,
    amount INT NOT NULL
)