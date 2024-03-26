CREATE EXTENSION plpython3u;
CREATE EXTENSION jsonb_plpython3u;

CREATE TABLE example (
    id SERIAL PRIMARY KEY,
    value VARCHAR(30)
);

INSERT INTO example (value) VALUES
('One'),
('Two'),
('Three');
