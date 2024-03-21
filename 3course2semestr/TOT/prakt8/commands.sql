psql -U shiz -d sidorov_tot_prakt -h localhost -p 5435

-- Task 1 --
-- Session 1 --

-- Session 1 --

BEGIN;
UPDATE example SET value = 'New one' WHERE id = 1;

-- Session 2 --

BEGIN;
UPDATE example SET value = 'Another one' WHERE id = 1;

-- Session 3 --

BEGIN;
UPDATE example SET value = 'And another one' WHERE id = 1;

-- Session 4 --

SELECT * FROM pg_locks WHERE relation = 'example'::regclass;


-- Task 2 --

-- Session 1 --

BEGIN;
UPDATE example SET value = 'U1s1' WHERE id = 1;

-- Session 2 --

BEGIN;
UPDATE example SET value = 'u2s2' WHERE id = 2;

-- Session 3 --

BEGIN;
UPDATE example SET value = 'u3s3' WHERE id = 3;

-- Session 1 --

UPDATE example SET value = 'u2s1' WHERE id = 2;

-- Session 2 --

UPDATE example SET value = 'u3s2' WHERE id = 3;

-- Session 3 --

UPDATE example SET value = 'u1s3' WHERE id = 1;

-- Task 3 --
-- Session 1 --

BEGIN;
UPDATE example SET value = 'u12s1' WHERE id IN (1,2);

-- Session 2 --

BEGIN;
UPDATE example SET value = 'u12s2' WHERE id IN (1,2);