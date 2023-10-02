CREATE TABLE books (
                       id BIGINT(20) NOT NULL AUTO_INCREMENT,
                       author VARCHAR(255) NOT NULL,
                       seller_id BIGINT(20) NOT NULL,
                       product_type VARCHAR(255) NOT NULL,
                       price DECIMAL(10,2) NOT NULL,
                       name VARCHAR(255) NOT NULL,
                       PRIMARY KEY (id)
);

CREATE TABLE clients (
                         id BIGINT(20) NOT NULL AUTO_INCREMENT,
                         name VARCHAR(255) NOT NULL,
                         email VARCHAR(255) NOT NULL,
                         login VARCHAR(255) NOT NULL,
                         password VARCHAR(255) NOT NULL,
                         PRIMARY KEY (id)
);

CREATE TABLE telephones (
                            id BIGINT(20) NOT NULL AUTO_INCREMENT,
                            manufacturer VARCHAR(255) NOT NULL,
                            battery_capacity INT(11) NOT NULL,
                            seller_id BIGINT(20) NOT NULL,
                            product_type VARCHAR(255) NOT NULL,
                            price DECIMAL(10,2) NOT NULL,
                            name VARCHAR(255) NOT NULL,
                            PRIMARY KEY (id)
);

CREATE TABLE washing_machines (
                                  id BIGINT(20) NOT NULL AUTO_INCREMENT,
                                  manufacturer VARCHAR(255) NOT NULL,
                                  tank_capacity INT(11) NOT NULL,
                                  seller_id BIGINT(20) NOT NULL,
                                  product_type VARCHAR(255) NOT NULL,
                                  price DECIMAL(10,2) NOT NULL,
                                  name VARCHAR(255) NOT NULL,
                                  PRIMARY KEY (id)
);