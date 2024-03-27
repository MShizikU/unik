psql -U shiz -d sidorov_tot_prakt -h localhost -p 5435


--Task 1

CREATE OR REPLACE FUNCTION tmprun(func text, params jsonb)
RETURNS text
TRANSFORM FOR TYPE jsonb
AS $python$
	p = plpy.prepare("SELECT * FROM " + plpy.quote_ident(func) + "($1)", ["jsonb"])
	r = p.execute([params])
	cols = r.colnames()
	collen = {col: len(col) for col in cols}
	for i in range(len(r)):
    	for col in cols:
        	if len( str(r[i][col]) ) > collen[col]:
            	collen[col] = len( str(r[i][col]) )
	res = ""
	res += " ".join( [col.center(collen[col]," ") for col in cols]) + "\n"
	res += " ".join( ["-"*collen[col] for col in cols]) + "\n"
	for i in range(len(r)):
    	res += " ".join( [str(r[i][col]).ljust(collen[col]," ") for col in cols]) + "\n"
	return res
$python$ LANGUAGE plpython3u VOLATILE;

CREATE OR REPLACE FUNCTION test_function(params jsonb)
RETURNS TABLE(id INT, value TEXT)
AS $$
DECLARE
    table_name text;
    query_text text;
BEGIN
    table_name := params ->> 'table_name';
    query_text := 'SELECT id, value::text FROM ' || quote_ident(table_name);
    RETURN QUERY EXECUTE query_text;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM tmprun('test_function', '{"table_name" : "example"}');

--Task2

CREATE OR REPLACE FUNCTION public.sendmail(from_addr text, to_addr text, subj text, msg text)
 RETURNS void
 LANGUAGE plpython3u
AS $function$
	import smtplib
	server = smtplib.SMTP('smtp.gmail.com', 587)
	server.starttls()
	server.login('sidorovstasd7@gmail.com', 'uxnyugwremstfqfy')
	server.sendmail(
    	from_addr,
    	to_addr,
        "\r\n".join([
        	"From: %s" % from_addr,
        	"To: %s" % to_addr,
            "Content-Type: text/plain; charset=\"UTF-8\"",
        	"Subject: %s" % subj,
            "\r\n%s" % msg
    	]).encode('utf-8')
	)
	server.quit()
$function$;

create table programs (program_id SERIAL PRIMARY KEY, name text, func text);

CREATE OR REPLACE FUNCTION public.register_program(name text, func text)
    	RETURNS bigint
    	LANGUAGE sql
   	   AS $function$
       	INSERT INTO programs(name, func) VALUES (name, func)
   	   RETURNING program_id;
    	$function$;

SELECT register_program('Send a mail', 'sendmail_task');

CREATE FUNCTION public.sendmail_task(params jsonb)
RETURNS text
AS $$
	SELECT sendmail(
    	from_addr => params->>'from_addr',
    	to_addr   => params->>'to_addr',
    	subj  	=> params->>'subj',
    	msg   	=> params->>'msg'
	);
	SELECT 'OK';
$$ LANGUAGE sql VOLATILE;

CREATE TABLE public.tasks (
	task_id SERIAL PRIMARY KEY ,
	program_id bigint NOT NULL,
	status text DEFAULT 'scheduled'::text NOT NULL,
	params jsonb,
	pid integer,
	started timestamp with time zone,
	finished timestamp with time zone,
	result text,
	host text,
	port text,
	CONSTRAINT tasks_check CHECK ((((host IS NOT NULL) AND (port IS NOT NULL)) OR ((host IS NULL) AND (port IS NULL)))),
	CONSTRAINT tasks_status_check CHECK ((status = ANY (ARRAY['scheduled'::text, 'running'::text, 'finished'::text, 'error'::text])))
);

CREATE FUNCTION public.run_program(program_id bigint, params jsonb DEFAULT NULL::jsonb, host text DEFAULT NULL::text, port text DEFAULT NULL::text) RETURNS bigint
	LANGUAGE sql SECURITY DEFINER
	AS $$
	INSERT INTO tasks(program_id, status, params, host, port)
	VALUES (program_id, 'scheduled', params, host, port)
	RETURNING task_id;
$$;

CREATE FUNCTION public.checkout(user_id bigint) returns void
AS $$
BEGIN
    PERFORM before_checkout(user_id);    
END;
$$ LANGUAGE plpgsql VOLATILE SECURITY DEFINER;

CREATE OR REPLACE FUNCTION public.before_checkout(user_id bigint)
RETURNS void
AS $$
DECLARE
    params jsonb;
BEGIN
    SELECT jsonb_build_object(
        'from_addr', 'sidorovstasd7@gmail.com',
        'to_addr', c.email,
        'subj', 'Order Confirmation for User ' || c.name,
        'msg', format(
                  E'Hello %s!\nThank you for your order.\nYour order total is $%s.',
                  c.name,
                  total
              )
    )
    INTO params
    FROM customer c
    JOIN (
        SELECT
            so.customer_id,
            SUM(i.total) AS total
        FROM sales_order so
        JOIN item i ON so.order_id = i.order_id
        WHERE so.customer_id = user_id
        GROUP BY so.customer_id
    ) AS order_totals ON order_totals.customer_id = c.customer_id;

    PERFORM public.run_program(
		1,
        params,
		NULL,
		NULL
    );
END;
$$ LANGUAGE plpgsql VOLATILE;

select checkout(1);

CREATE OR REPLACE FUNCTION tmprun(func text, params jsonb)
RETURNS text
TRANSFORM FOR TYPE jsonb
AS $python$
	p = plpy.prepare("SELECT * FROM " + plpy.quote_ident(func) + "($1)", ["jsonb"])
	r = p.execute([params])
	cols = r.colnames()
	collen = {col: len(col) for col in cols}
	for i in range(len(r)):
    	for col in cols:
        	if len( str(r[i][col]) ) > collen[col]:
            	collen[col] = len( str(r[i][col]) )
	res = ""
	res += " ".join( [col.center(collen[col]," ") for col in cols]) + "\n"
	res += " ".join( ["-"*collen[col] for col in cols]) + "\n"
	for i in range(len(r)):
    	res += " ".join( [str(r[i][col]).ljust(collen[col]," ") for col in cols]) + "\n"
	return res
$python$ LANGUAGE plpython3u VOLATILE;

CREATE OR REPLACE FUNCTION public.execute_tasks()
RETURNS VOID
AS $$
DECLARE
    task_record RECORD;
    program_name TEXT;
    task_params JSONB;
BEGIN
    FOR task_record IN SELECT * FROM tasks WHERE status = 'scheduled' LOOP
        SELECT func INTO program_name FROM programs WHERE program_id = task_record.program_id;
        task_params := task_record.params;
        PERFORM tmprun(program_name, task_params);
        UPDATE tasks SET status = 'finished', finished = current_timestamp WHERE task_id = task_record.task_id;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

select execute_tasks();