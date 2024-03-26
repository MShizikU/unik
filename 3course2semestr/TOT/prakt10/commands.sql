psql -U shiz -d sidorov_tot_prakt -h localhost -p 5435


--Task1
\timing on

DO $$
BEGIN
  FOR i IN 1..1000 LOOP
	EXECUTE 'SELECT avg(total) FROM SALES_ORDER';
  END LOOP;
END;
$$ LANGUAGE plpgsql;
DO

DO $$
BEGIN
  FOR i IN 1..1000 LOOP
	PERFORM avg(total) FROM SALES_ORDER;
  END LOOP;
END;
$$ LANGUAGE plpgsql;
DO

\timing off

--Task2

UPDATE SALES_ORDER SET total = 131000.05 where order_id = 63;

\timing on

DO $$
BEGIN
  FOR i IN 1..100000 LOOP
	EXECUTE 'SELECT * FROM SALES_ORDER WHERE total = 131000.05';
  END LOOP;
END;
$$ LANGUAGE plpgsql;
DO

DO $$
BEGIN
  FOR i IN 1..100000 LOOP
	PERFORM * FROM SALES_ORDER WHERE total = 131000.05;
  END LOOP;
END;
$$ LANGUAGE plpgsql;
DO

\timing off