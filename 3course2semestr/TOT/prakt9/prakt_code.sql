psql -U shiz -d exec_async -h localhost -p 5435

--Task 1

--Terminal 1
INSERT INTO msg_queue(payload) SELECT to_jsonb(id) FROM generate_series(1,100) id;
\timing on
CALL process_queue();

--Terminal 2
CALL process_queue();

--Terminal 1
\timing off
SELECT COUNT(id) = 100 AND MIN(id) = 1 AND MAX(id) = 100 AS result FROM msg_log;
SELECT * FROM msg_queue;


--Terminal 1
INSERT INTO msg_queue(payload) SELECT to_jsonb(id) FROM generate_series(1,200) id;
CALL process_queue();

--Terminal 2
CALL process_queue();

--Terminal 1
SELECT COUNT(id) = 200 AND MIN(id) = 1 AND MAX(id) = 200 AS result FROM msg_log;


--Task 2

--Terminal 1
INSERT INTO msg_queue(payload) SELECT to_jsonb(id) FROM generate_series(1,200) id;
CALL process_queue();

--Terminal 2
BEGIN; 
LOCK TABLE msg_log;
SELECT pg_terminate_backend(pid) FROM msg_log LIMIT 1;
COMMIT;

--Terminal 1
SELECT count(*), count(DISTINCT id) FROM msg_log;

CALL process_queue();

SELECT count(*), count(DISTINCT id) FROM msg_log;

--Task 3

--Terminal 1
INSERT INTO msg_queue(payload) SELECT to_jsonb(id) FROM generate_series(1,3000) id;
\timing on
CALL process_queue();

--Terminal 2
CALL process_queue();

--Terminal 1
\timing off
SELECT COUNT(id) = 3000 AND MIN(id) = 1 AND MAX(id) = 3000 AS result FROM msg_log;
SELECT * FROM msg_queue;


--Task 4
--Terminal 1
INSERT INTO msg_queue(payload) SELECT to_jsonb(id) FROM generate_series(1,3000) id;
\timing on
CALL process_queue();

--Terminal 2
CALL process_queue();

--Terminal 1
\timing off
SELECT COUNT(id) = 3000 AND MIN(id) = 1 AND MAX(id) = 3000 AS result FROM msg_log;
SELECT * FROM msg_queue;