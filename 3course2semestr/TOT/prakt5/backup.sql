--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Debian 13.3-1.pgdg100+1)
-- Dumped by pg_dump version 15.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: shiz
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO shiz;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: shiz
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    name character varying(45),
    address character varying(40),
    city character varying(30),
    state character varying(2),
    zip_code character varying(9),
    area_code smallint,
    phone_number smallint,
    salesperson_id integer,
    credit_limit numeric(9,2),
    comments text
);


ALTER TABLE public.customer OWNER TO shiz;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: shiz
--

CREATE SEQUENCE public.customer_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_customer_id_seq OWNER TO shiz;

--
-- Name: customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shiz
--

ALTER SEQUENCE public.customer_customer_id_seq OWNED BY public.customer.customer_id;


--
-- Name: department; Type: TABLE; Schema: public; Owner: shiz
--

CREATE TABLE public.department (
    department_id integer NOT NULL,
    name character varying(14),
    location_id integer
);


ALTER TABLE public.department OWNER TO shiz;

--
-- Name: department_department_id_seq; Type: SEQUENCE; Schema: public; Owner: shiz
--

CREATE SEQUENCE public.department_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.department_department_id_seq OWNER TO shiz;

--
-- Name: department_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shiz
--

ALTER SEQUENCE public.department_department_id_seq OWNED BY public.department.department_id;


--
-- Name: employee; Type: TABLE; Schema: public; Owner: shiz
--

CREATE TABLE public.employee (
    employee_id integer NOT NULL,
    last_name character varying(15),
    first_name character varying(15),
    middle_initial character varying(1),
    manager_id integer,
    job_id integer,
    hire_date date,
    salary numeric(7,2),
    commission numeric(7,2),
    department_id integer
);


ALTER TABLE public.employee OWNER TO shiz;

--
-- Name: employee_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: shiz
--

CREATE SEQUENCE public.employee_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_employee_id_seq OWNER TO shiz;

--
-- Name: employee_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shiz
--

ALTER SEQUENCE public.employee_employee_id_seq OWNED BY public.employee.employee_id;


--
-- Name: item; Type: TABLE; Schema: public; Owner: shiz
--

CREATE TABLE public.item (
    item_id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer,
    actual_price numeric(8,2),
    quantity integer,
    total numeric(8,2)
);


ALTER TABLE public.item OWNER TO shiz;

--
-- Name: item_item_id_seq; Type: SEQUENCE; Schema: public; Owner: shiz
--

CREATE SEQUENCE public.item_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_item_id_seq OWNER TO shiz;

--
-- Name: item_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shiz
--

ALTER SEQUENCE public.item_item_id_seq OWNED BY public.item.item_id;


--
-- Name: job; Type: TABLE; Schema: public; Owner: shiz
--

CREATE TABLE public.job (
    job_id integer NOT NULL,
    function character varying(30)
);


ALTER TABLE public.job OWNER TO shiz;

--
-- Name: job_job_id_seq; Type: SEQUENCE; Schema: public; Owner: shiz
--

CREATE SEQUENCE public.job_job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_job_id_seq OWNER TO shiz;

--
-- Name: job_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shiz
--

ALTER SEQUENCE public.job_job_id_seq OWNED BY public.job.job_id;


--
-- Name: location; Type: TABLE; Schema: public; Owner: shiz
--

CREATE TABLE public.location (
    location_id integer NOT NULL,
    regional_group character varying(20)
);


ALTER TABLE public.location OWNER TO shiz;

--
-- Name: location_location_id_seq; Type: SEQUENCE; Schema: public; Owner: shiz
--

CREATE SEQUENCE public.location_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_location_id_seq OWNER TO shiz;

--
-- Name: location_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shiz
--

ALTER SEQUENCE public.location_location_id_seq OWNED BY public.location.location_id;


--
-- Name: price; Type: TABLE; Schema: public; Owner: shiz
--

CREATE TABLE public.price (
    product_id integer NOT NULL,
    start_date date NOT NULL,
    list_price numeric(8,2),
    min_price numeric(8,2),
    end_date date
);


ALTER TABLE public.price OWNER TO shiz;

--
-- Name: product; Type: TABLE; Schema: public; Owner: shiz
--

CREATE TABLE public.product (
    product_id integer NOT NULL,
    description character varying(30)
);


ALTER TABLE public.product OWNER TO shiz;

--
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: shiz
--

CREATE SEQUENCE public.product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_product_id_seq OWNER TO shiz;

--
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shiz
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;


--
-- Name: sales_order; Type: TABLE; Schema: public; Owner: shiz
--

CREATE TABLE public.sales_order (
    order_id integer NOT NULL,
    order_date date,
    customer_id integer,
    ship_date date,
    total numeric(8,2)
);


ALTER TABLE public.sales_order OWNER TO shiz;

--
-- Name: sales_order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: shiz
--

CREATE SEQUENCE public.sales_order_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_order_order_id_seq OWNER TO shiz;

--
-- Name: sales_order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shiz
--

ALTER SEQUENCE public.sales_order_order_id_seq OWNED BY public.sales_order.order_id;


--
-- Name: customer customer_id; Type: DEFAULT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.customer ALTER COLUMN customer_id SET DEFAULT nextval('public.customer_customer_id_seq'::regclass);


--
-- Name: department department_id; Type: DEFAULT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.department ALTER COLUMN department_id SET DEFAULT nextval('public.department_department_id_seq'::regclass);


--
-- Name: employee employee_id; Type: DEFAULT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.employee ALTER COLUMN employee_id SET DEFAULT nextval('public.employee_employee_id_seq'::regclass);


--
-- Name: item item_id; Type: DEFAULT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.item ALTER COLUMN item_id SET DEFAULT nextval('public.item_item_id_seq'::regclass);


--
-- Name: job job_id; Type: DEFAULT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.job ALTER COLUMN job_id SET DEFAULT nextval('public.job_job_id_seq'::regclass);


--
-- Name: location location_id; Type: DEFAULT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.location ALTER COLUMN location_id SET DEFAULT nextval('public.location_location_id_seq'::regclass);


--
-- Name: product product_id; Type: DEFAULT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- Name: sales_order order_id; Type: DEFAULT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.sales_order ALTER COLUMN order_id SET DEFAULT nextval('public.sales_order_order_id_seq'::regclass);


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: shiz
--

COPY public.customer (customer_id, name, address, city, state, zip_code, area_code, phone_number, salesperson_id, credit_limit, comments) FROM stdin;
1	Customer 1	123 Main St	City A	CA	12345	123	132	1	10000.00	\N
2	Customer 2	456 Elm St	City B	NY	54321	456	465	2	15000.00	\N
3	Customer 3	789 Oak St	City C	TX	67890	789	423	3	20000.00	\N
4	Customer 4	101 Pine St	City D	FL	09876	234	123	4	25000.00	\N
5	Customer 5	202 Maple St	City E	WA	56789	345	3641	5	30000.00	\N
\.


--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: shiz
--

COPY public.department (department_id, name, location_id) FROM stdin;
1	Department 1	1
2	Department 2	2
3	Department 3	3
4	Department 4	4
5	Department 5	5
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: shiz
--

COPY public.employee (employee_id, last_name, first_name, middle_initial, manager_id, job_id, hire_date, salary, commission, department_id) FROM stdin;
1	Doe	John	A	\N	1	2023-01-01	50000.00	2000.00	1
2	Smith	Alice	B	1	2	2023-02-01	55000.00	2500.00	2
3	Johnson	Robert	C	1	3	2023-03-01	60000.00	3000.00	3
4	Brown	Emily	D	2	4	2023-04-01	65000.00	3500.00	4
5	Davis	Michael	E	2	5	2023-05-01	70000.00	4000.00	5
\.


--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: shiz
--

COPY public.item (item_id, order_id, product_id, actual_price, quantity, total) FROM stdin;
1	1	1	10.00	1	10.00
2	2	2	20.00	2	40.00
3	3	3	30.00	3	90.00
4	4	4	40.00	4	160.00
5	5	5	50.00	5	250.00
\.


--
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: shiz
--

COPY public.job (job_id, function) FROM stdin;
1	Function 1
2	Function 2
3	Function 3
4	Function 4
5	Function 5
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: shiz
--

COPY public.location (location_id, regional_group) FROM stdin;
1	Area A
2	Area B
3	Area C
4	Area D
5	Area E
\.


--
-- Data for Name: price; Type: TABLE DATA; Schema: public; Owner: shiz
--

COPY public.price (product_id, start_date, list_price, min_price, end_date) FROM stdin;
1	2024-01-01	10.00	8.00	2024-12-31
2	2024-01-01	20.00	16.00	2024-12-31
3	2024-01-01	30.00	24.00	2024-12-31
4	2024-01-01	40.00	32.00	2024-12-31
5	2024-01-01	50.00	40.00	2024-12-31
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: shiz
--

COPY public.product (product_id, description) FROM stdin;
1	Product 1
2	Product 2
3	Product 3
4	Product 4
5	Product 5
\.


--
-- Data for Name: sales_order; Type: TABLE DATA; Schema: public; Owner: shiz
--

COPY public.sales_order (order_id, order_date, customer_id, ship_date, total) FROM stdin;
1	2023-01-01	1	2023-01-05	200.00
2	2023-02-01	2	2023-02-05	150.00
3	2023-03-01	3	2023-03-05	300.00
4	2023-04-01	4	2023-04-05	400.00
5	2023-05-01	5	2023-05-05	500.00
\.


--
-- Name: customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: shiz
--

SELECT pg_catalog.setval('public.customer_customer_id_seq', 5, true);


--
-- Name: department_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: shiz
--

SELECT pg_catalog.setval('public.department_department_id_seq', 5, true);


--
-- Name: employee_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: shiz
--

SELECT pg_catalog.setval('public.employee_employee_id_seq', 5, true);


--
-- Name: item_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: shiz
--

SELECT pg_catalog.setval('public.item_item_id_seq', 5, true);


--
-- Name: job_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: shiz
--

SELECT pg_catalog.setval('public.job_job_id_seq', 5, true);


--
-- Name: location_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: shiz
--

SELECT pg_catalog.setval('public.location_location_id_seq', 5, true);


--
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: shiz
--

SELECT pg_catalog.setval('public.product_product_id_seq', 5, true);


--
-- Name: sales_order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: shiz
--

SELECT pg_catalog.setval('public.sales_order_order_id_seq', 5, true);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (department_id);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_id);


--
-- Name: item item_pkey; Type: CONSTRAINT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (item_id, order_id);


--
-- Name: job job_pkey; Type: CONSTRAINT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.job
    ADD CONSTRAINT job_pkey PRIMARY KEY (job_id);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (location_id);


--
-- Name: price price_pkey; Type: CONSTRAINT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_pkey PRIMARY KEY (product_id, start_date);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- Name: sales_order sales_order_pkey; Type: CONSTRAINT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.sales_order
    ADD CONSTRAINT sales_order_pkey PRIMARY KEY (order_id);


--
-- Name: customer customer_salesperson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_salesperson_id_fkey FOREIGN KEY (salesperson_id) REFERENCES public.employee(employee_id);


--
-- Name: department department_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(location_id);


--
-- Name: employee employee_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(department_id);


--
-- Name: employee employee_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.job(job_id);


--
-- Name: item item_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.sales_order(order_id);


--
-- Name: item item_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- Name: price price_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- Name: employee ref_emp_manager; Type: FK CONSTRAINT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT ref_emp_manager FOREIGN KEY (manager_id) REFERENCES public.employee(employee_id);


--
-- Name: sales_order sales_order_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shiz
--

ALTER TABLE ONLY public.sales_order
    ADD CONSTRAINT sales_order_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: shiz
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

