CREATE TABLE IF NOT EXISTS organizations (
  id_organization SERIAL PRIMARY KEY,
  ur_address VARCHAR(256),
  fis_address VARCHAR(256),
  tax_id VARCHAR(256),
  ceo INTEGER,
  org_phone VARCHAR(256),
  org_email VARCHAR(256)
);

CREATE TABLE IF NOT EXISTS person (
  id_person SERIAL PRIMARY KEY,
  username VARCHAR(256),
  password VARCHAR(256),
  role VARCHAR(256),
  last_name VARCHAR(256),
  first_name VARCHAR(256),
  middle_name VARCHAR(256),
  contact_email VARCHAR(256),
  contact_phone VARCHAR(256),
  birth_date DATE,
  gender VARCHAR(256),
  id_point INTEGER
);

CREATE TABLE IF NOT EXISTS sales_points (
  id_point SERIAL PRIMARY KEY,
  address VARCHAR(256),
  id_organization INTEGER,
  administrator INTEGER
);

CREATE TABLE IF NOT EXISTS scheduler (
  id_scheduler SERIAL PRIMARY KEY,
  date DATE,
  day_scheduler VARCHAR(256)[][]
);

CREATE TABLE IF NOT EXISTS barbers (
  id_barber SERIAL PRIMARY KEY,
  tax_id VARCHAR(256),
  id_person INTEGER
);

CREATE TABLE IF NOT EXISTS appointments (
  id_appointment SERIAL PRIMARY KEY,
  id_customer INTEGER,
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  id_barber INTEGER,
  service_list INTEGER[]
);

CREATE TABLE IF NOT EXISTS customers (
  id_customer SERIAL PRIMARY KEY,
  id_person INTEGER,
  features VARCHAR(256)
);

CREATE TABLE IF NOT EXISTS services (
  id_service SERIAL PRIMARY KEY,
  duration INTEGER,
  service_title VARCHAR(256),
  service_description VARCHAR(256),
  price INTEGER,
  id_barber INTEGER
);

ALTER TABLE organizations ADD CONSTRAINT fk_ceo
  FOREIGN KEY (ceo)
  REFERENCES person (id_person);

ALTER TABLE person ADD CONSTRAINT fk_id_point
  FOREIGN KEY (id_point)
  REFERENCES sales_points (id_point);

ALTER TABLE sales_points ADD CONSTRAINT fk_id_organization
  FOREIGN KEY (id_organization)
  REFERENCES organizations (id_organization);

ALTER TABLE sales_points ADD CONSTRAINT fk_administrator
  FOREIGN KEY (administrator)
  REFERENCES person (id_person);

ALTER TABLE barbers ADD CONSTRAINT fk_id_person
  FOREIGN KEY (id_person)
  REFERENCES person (id_person);

ALTER TABLE appointments ADD CONSTRAINT fk_id_customer
  FOREIGN KEY (id_customer)
  REFERENCES customers (id_customer);

ALTER TABLE appointments ADD CONSTRAINT fk_id_barber
  FOREIGN KEY (id_barber)
  REFERENCES barbers (id_barber);

ALTER TABLE customers ADD CONSTRAINT fk_id_person
  FOREIGN KEY (id_person)
  REFERENCES person (id_person);

ALTER TABLE services ADD CONSTRAINT fk_id_barber
  FOREIGN KEY (id_barber)
  REFERENCES barbers (id_person);


 