CREATE OR REPLACE FUNCTION take_message(OUT msg msg_queue) AS $$
BEGIN
	SELECT *
	INTO msg
	FROM msg_queue
	WHERE pid IS NULL OR pid NOT IN (SELECT pid FROM pg_stat_activity)
	ORDER BY id LIMIT 1
	FOR UPDATE SKIP LOCKED;
 
	UPDATE msg_queue
	SET pid = pg_backend_pid()
	WHERE id = msg.id;
END;
$$ LANGUAGE plpgsql VOLATILE;

CREATE FUNCTION complete_message(msg msg_queue) RETURNS void AS $$
DELETE FROM msg_queue
WHERE id = msg.id;
$$ LANGUAGE sql VOLATILE;

CREATE PROCEDURE process_queue() AS $$
DECLARE
	msg msg_queue;
BEGIN
	LOOP
    	SELECT * INTO msg FROM take_message();
    	EXIT WHEN msg.id IS NULL;
    	COMMIT;
 
    	-- обработка
		PERFORM pg_sleep(2);
    	INSERT INTO msg_log(id, pid) VALUES (msg.id, pg_backend_pid());
 
    	PERFORM complete_message(msg);
    	COMMIT;
	END LOOP;
END;
$$ LANGUAGE plpgsql;