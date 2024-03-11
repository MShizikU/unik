psql -U shiz -d sidorov_tot_prakt -h localhost -p 5435
psql -U postgres -h 192.168.178.135

#Task1

##Console 1
CREATE DATABASE locks_objects;

\c locks_objects;

CREATE TABLE accounts(acc_no integer PRIMARY KEY, amount numeric);

INSERT INTO accounts VALUES (1,1000.00),(2,2000.00),(3,3000.00);

##Console 2
\c locks_objects;
SELECT pg_backend_pid();

BEGIN;
SELECT * FROM accounts WHERE acc_no = 1;

##Console 1

SELECT locktype, relation::REGCLASS, virtualxid AS virtxid, transactionid AS xid, mode, granted
FROM pg_locks WHERE pid = 89;

##Console 2

SELECT locktype, relation::REGCLASS, virtualxid AS virtxid, transactionid AS xid, mode, granted
FROM pg_locks WHERE pid = 89;

COMMIT;


#Task 2

##Console 2
SELECT pg_backend_pid();
BEGIN ISOLATION LEVEL SERIALIZABLE;
SELECT * FROM accounts WHERE acc_no = 1;

##Console 1
SELECT locktype, relation::REGCLASS, page, tuple, virtualxid AS virtxid, transactionid AS xid, mode, granted
FROM pg_locks WHERE pid = 89;


##Console 2
Commit;


#Task 3

##Проводим настройку
ALTER SYSTEM SET log_lock_waits = on;

ALTER SYSTEM SET deadlock_timeout = '100ms';

SELECT pg_reload_conf();

##Воспроизводим блокировку

###Console 1
BEGIN;

UPDATE accounts SET amount = 10.00 WHERE acc_no = 1;

###Console 2

BEGIN;

UPDATE accounts SET amount = 100.00 WHERE acc_no = 1;

###Console 1

SELECT pg_sleep(1);

COMMIT;

###Console 2 

Commit;