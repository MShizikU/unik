CREATE DATABASE IF NOT EXISTS appDB;
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'password';
GRANT SELECT,UPDATE,INSERT, DELETE ON appDB.* TO 'user'@'%';
FLUSH PRIVILEGES;

USE appDB;
CREATE TABLE IF NOT EXISTS users (
  id INT NOT NULL AUTO_INCREMENT,
  fullname VARCHAR(40) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS comments(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    title VARCHAR(50),
    content VARCHAR(256)
);

ALTER TABLE comments ADD FOREIGN KEY (id_user) REFERENCES users(id);

