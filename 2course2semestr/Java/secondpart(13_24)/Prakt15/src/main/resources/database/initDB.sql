CREATE TABLE IF NOT EXISTS users
(
    id    SERIAL NOT NULL PRIMARY KEY ,
    first_name  VARCHAR(256) NOT NULL ,
    last_name  VARCHAR(256) NOT NULL,
    middle_name  VARCHAR(256) NOT NULL,
    birth_date  VARCHAR(256) NOT NULL
    );

CREATE TABLE IF NOT EXISTS posts
(
    id    SERIAL NOT NULL PRIMARY KEY ,
    text  VARCHAR(256) NOT NULL,
    creation_date  VARCHAR(256) NOT NULL
);