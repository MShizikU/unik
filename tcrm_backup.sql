--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Ubuntu 14.10-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.2

-- Started on 2023-12-21 14:44:13

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
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2 (class 3079 OID 617897)
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- TOC entry 4242 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 261 (class 1259 OID 621197)
-- Name: amocrm_companies_attributes; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_companies_attributes (
    id integer NOT NULL,
    account_id integer NOT NULL,
    companies_id integer NOT NULL,
    attribute_id character varying(64) NOT NULL,
    name character varying(256) NOT NULL,
    value text
);


ALTER TABLE public.amocrm_companies_attributes OWNER TO "owner-gycqvgb";

--
-- TOC entry 317 (class 1259 OID 621887)
-- Name: AMO Дополнительные параметры компа; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Дополнительные параметры компа" AS
 SELECT amocrm_companies_attributes.id AS "Идентификатор записи",
    amocrm_companies_attributes.account_id AS "Идентификатор подключенного акка",
    amocrm_companies_attributes.companies_id AS "Идентификатор компании",
    amocrm_companies_attributes.attribute_id AS "Внутренний идентификатор парамет",
    amocrm_companies_attributes.name AS "Название",
    amocrm_companies_attributes.value AS "Значение"
   FROM public.amocrm_companies_attributes;


ALTER TABLE public."AMO Дополнительные параметры компа" OWNER TO "owner-gycqvgb";

--
-- TOC entry 271 (class 1259 OID 621288)
-- Name: amocrm_contacts_attributes; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_contacts_attributes (
    id integer NOT NULL,
    account_id integer NOT NULL,
    contacts_id integer NOT NULL,
    attribute_id character varying(64) NOT NULL,
    name character varying(256) NOT NULL,
    value text
);


ALTER TABLE public.amocrm_contacts_attributes OWNER TO "owner-gycqvgb";

--
-- TOC entry 323 (class 1259 OID 621911)
-- Name: AMO Дополнительные параметры конта; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Дополнительные параметры конта" AS
 SELECT amocrm_contacts_attributes.id AS "Идентификатор записи",
    amocrm_contacts_attributes.account_id AS "Идентификатор подключенного акка",
    amocrm_contacts_attributes.contacts_id AS "Идентификатор контакта",
    amocrm_contacts_attributes.attribute_id AS "Внутренний идентификатор парамет",
    amocrm_contacts_attributes.name AS "Название",
    amocrm_contacts_attributes.value AS "Значение"
   FROM public.amocrm_contacts_attributes;


ALTER TABLE public."AMO Дополнительные параметры конта" OWNER TO "owner-gycqvgb";

--
-- TOC entry 281 (class 1259 OID 621384)
-- Name: amocrm_customers_attributes; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_customers_attributes (
    id integer NOT NULL,
    account_id integer NOT NULL,
    customers_id integer NOT NULL,
    attribute_id character varying(64) NOT NULL,
    name character varying(256) NOT NULL,
    value text
);


ALTER TABLE public.amocrm_customers_attributes OWNER TO "owner-gycqvgb";

--
-- TOC entry 329 (class 1259 OID 621935)
-- Name: AMO Дополнительные параметры покуп; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Дополнительные параметры покуп" AS
 SELECT amocrm_customers_attributes.id AS "Идентификатор записи",
    amocrm_customers_attributes.account_id AS "Идентификатор подключенного акка",
    amocrm_customers_attributes.customers_id AS "Идентификатор покупателя",
    amocrm_customers_attributes.attribute_id AS "Внутренний идентификатор парамет",
    amocrm_customers_attributes.name AS "Название",
    amocrm_customers_attributes.value AS "Значение"
   FROM public.amocrm_customers_attributes;


ALTER TABLE public."AMO Дополнительные параметры покуп" OWNER TO "owner-gycqvgb";

--
-- TOC entry 295 (class 1259 OID 621546)
-- Name: amocrm_leads_attributes; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_leads_attributes (
    id integer NOT NULL,
    account_id integer NOT NULL,
    leads_id integer NOT NULL,
    attribute_id character varying(64) NOT NULL,
    name character varying(256) NOT NULL,
    value text
);


ALTER TABLE public.amocrm_leads_attributes OWNER TO "owner-gycqvgb";

--
-- TOC entry 352 (class 1259 OID 623729)
-- Name: AMO Дополнительные параметры сдело; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Дополнительные параметры сдело" AS
 SELECT amocrm_leads_attributes.id AS "Идентификатор записи",
    amocrm_leads_attributes.account_id AS "Идентификатор подключенного акка",
    amocrm_leads_attributes.leads_id AS "Идентификатор сделки",
    amocrm_leads_attributes.attribute_id AS "Внутренний идентификатор парамет",
    amocrm_leads_attributes.name AS "Название",
    amocrm_leads_attributes.value AS "Значение"
   FROM public.amocrm_leads_attributes;


ALTER TABLE public."AMO Дополнительные параметры сдело" OWNER TO "owner-gycqvgb";

--
-- TOC entry 291 (class 1259 OID 621516)
-- Name: amocrm_elements_attributes; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_elements_attributes (
    id integer NOT NULL,
    account_id integer NOT NULL,
    elements_id integer NOT NULL,
    attribute_id character varying(64) NOT NULL,
    name character varying(256) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.amocrm_elements_attributes OWNER TO "owner-gycqvgb";

--
-- TOC entry 335 (class 1259 OID 621959)
-- Name: AMO Дополнительные параметры элеме; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Дополнительные параметры элеме" AS
 SELECT amocrm_elements_attributes.id AS "Идентификатор записи",
    amocrm_elements_attributes.account_id AS "Идентификатор подключенного акка",
    amocrm_elements_attributes.elements_id AS "Идентификатор элемента",
    amocrm_elements_attributes.attribute_id AS "Внутренний идентификатор парамет",
    amocrm_elements_attributes.name AS "Название",
    amocrm_elements_attributes.value AS "Значение"
   FROM public.amocrm_elements_attributes;


ALTER TABLE public."AMO Дополнительные параметры элеме" OWNER TO "owner-gycqvgb";

--
-- TOC entry 309 (class 1259 OID 621737)
-- Name: amocrm_tasks_facts; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_tasks_facts (
    id integer NOT NULL,
    account_id integer NOT NULL,
    users_id integer NOT NULL,
    contacts_id integer NOT NULL,
    companies_id integer NOT NULL,
    leads_id integer NOT NULL,
    customers_id integer NOT NULL,
    tasks_id integer NOT NULL,
    created_id integer NOT NULL,
    modified_id integer NOT NULL,
    completed_id integer NOT NULL,
    duration integer NOT NULL
);


ALTER TABLE public.amocrm_tasks_facts OWNER TO "owner-gycqvgb";

--
-- TOC entry 347 (class 1259 OID 622011)
-- Name: AMO Задачи; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Задачи" AS
 SELECT amocrm_tasks_facts.account_id AS "Идентификатор подключенного акка",
    amocrm_tasks_facts.users_id AS "Идентификатор пользователя",
    amocrm_tasks_facts.contacts_id AS "Идентификатор контакта",
    amocrm_tasks_facts.companies_id AS "Идентификатор компании",
    amocrm_tasks_facts.leads_id AS "Идентификатор сделки",
    amocrm_tasks_facts.customers_id AS "Идентификатор покупателя",
    amocrm_tasks_facts.tasks_id AS "Идентификатор задачи",
    amocrm_tasks_facts.created_id AS "Идентификатор даты создания задач",
    amocrm_tasks_facts.modified_id AS "Идентификатор даты изменения зада",
    amocrm_tasks_facts.completed_id AS "Идентификатор даты завершения зад",
    amocrm_tasks_facts.duration AS "Длительность задачи"
   FROM public.amocrm_tasks_facts;


ALTER TABLE public."AMO Задачи" OWNER TO "owner-gycqvgb";

--
-- TOC entry 259 (class 1259 OID 621152)
-- Name: amocrm_calls_facts; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_calls_facts (
    id integer NOT NULL,
    account_id integer NOT NULL,
    dates_id integer NOT NULL,
    users_id integer NOT NULL,
    calls_id integer NOT NULL,
    contacts_id integer NOT NULL,
    companies_id integer NOT NULL,
    leads_id integer NOT NULL,
    customers_id integer NOT NULL,
    duration integer NOT NULL
);


ALTER TABLE public.amocrm_calls_facts OWNER TO "owner-gycqvgb";

--
-- TOC entry 218 (class 1259 OID 620913)
-- Name: general_dates; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.general_dates (
    id integer NOT NULL,
    full_date timestamp without time zone NOT NULL,
    year integer NOT NULL,
    quarter integer NOT NULL,
    quarter_label character varying(3) NOT NULL,
    month integer NOT NULL,
    month_label character varying(10) NOT NULL,
    week integer NOT NULL,
    weekday integer NOT NULL,
    weekday_label character varying(11) NOT NULL,
    day integer NOT NULL,
    hour integer NOT NULL,
    minute integer NOT NULL,
    date_hash character varying(32) NOT NULL,
    simple_date date NOT NULL,
    time_zone integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.general_dates OWNER TO "owner-gycqvgb";

--
-- TOC entry 315 (class 1259 OID 621879)
-- Name: AMO Звонки; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Звонки" AS
 SELECT amocrm_calls_facts.account_id AS "Идентификатор подключенного акка",
    amocrm_calls_facts.dates_id AS "Идентификатор даты",
    amocrm_calls_facts.users_id AS "Идентификатор пользователя",
    amocrm_calls_facts.calls_id AS "Идентификатор звонка",
    amocrm_calls_facts.contacts_id AS "Идентификатор контакта",
    amocrm_calls_facts.companies_id AS "Идентификатор компании",
    amocrm_calls_facts.leads_id AS "Идентификатор сделки",
    amocrm_calls_facts.customers_id AS "Идентификатор покупателя",
    amocrm_calls_facts.duration AS "Продолжительность звонка",
    general_dates.simple_date AS "Дата"
   FROM public.amocrm_calls_facts,
    public.general_dates
  WHERE (general_dates.id = amocrm_calls_facts.dates_id);


ALTER TABLE public."AMO Звонки" OWNER TO "owner-gycqvgb";

--
-- TOC entry 265 (class 1259 OID 621231)
-- Name: amocrm_companies_facts; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_companies_facts (
    id integer NOT NULL,
    account_id integer NOT NULL,
    users_id integer NOT NULL,
    companies_id integer NOT NULL,
    registered_id integer NOT NULL
);


ALTER TABLE public.amocrm_companies_facts OWNER TO "owner-gycqvgb";

--
-- TOC entry 319 (class 1259 OID 621895)
-- Name: AMO Компании; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Компании" AS
 SELECT amocrm_companies_facts.account_id AS "Идентификатор подключенного акка",
    amocrm_companies_facts.users_id AS "Идентификатор пользователя",
    amocrm_companies_facts.companies_id AS "Идентификатор компании",
    amocrm_companies_facts.registered_id AS "Идентификатор даты"
   FROM public.amocrm_companies_facts;


ALTER TABLE public."AMO Компании" OWNER TO "owner-gycqvgb";

--
-- TOC entry 275 (class 1259 OID 621322)
-- Name: amocrm_contacts_facts; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_contacts_facts (
    id integer NOT NULL,
    account_id integer NOT NULL,
    contacts_id integer NOT NULL,
    companies_id integer NOT NULL,
    users_id integer NOT NULL,
    registered_id integer NOT NULL
);


ALTER TABLE public.amocrm_contacts_facts OWNER TO "owner-gycqvgb";

--
-- TOC entry 325 (class 1259 OID 621919)
-- Name: AMO Контакты; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Контакты" AS
 SELECT amocrm_contacts_facts.account_id AS "Идентификатор подключенного акка",
    amocrm_contacts_facts.contacts_id AS "Идентификатор контакта",
    amocrm_contacts_facts.companies_id AS "Идентификатор компании",
    amocrm_contacts_facts.users_id AS "Идентификатор пользователя",
    amocrm_contacts_facts.registered_id AS "Идентификатор даты"
   FROM public.amocrm_contacts_facts;


ALTER TABLE public."AMO Контакты" OWNER TO "owner-gycqvgb";

--
-- TOC entry 269 (class 1259 OID 621274)
-- Name: amocrm_companies_tags; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_companies_tags (
    id integer NOT NULL,
    account_id integer NOT NULL,
    companies_id integer NOT NULL,
    tag_id integer NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE public.amocrm_companies_tags OWNER TO "owner-gycqvgb";

--
-- TOC entry 321 (class 1259 OID 621903)
-- Name: AMO Метки компаний; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Метки компаний" AS
 SELECT amocrm_companies_tags.id AS "Идентификатор записи",
    amocrm_companies_tags.account_id AS "Идентификатор подключенного акка",
    amocrm_companies_tags.companies_id AS "Идентификатор компании",
    amocrm_companies_tags.tag_id AS "Внутренний идентификатор метки",
    amocrm_companies_tags.name AS "Название"
   FROM public.amocrm_companies_tags;


ALTER TABLE public."AMO Метки компаний" OWNER TO "owner-gycqvgb";

--
-- TOC entry 279 (class 1259 OID 621370)
-- Name: amocrm_contacts_tags; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_contacts_tags (
    id integer NOT NULL,
    account_id integer NOT NULL,
    contacts_id integer NOT NULL,
    tag_id integer NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE public.amocrm_contacts_tags OWNER TO "owner-gycqvgb";

--
-- TOC entry 327 (class 1259 OID 621927)
-- Name: AMO Метки контактов; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Метки контактов" AS
 SELECT amocrm_contacts_tags.id AS "Идентификатор записи",
    amocrm_contacts_tags.account_id AS "Идентификатор подключенного акка",
    amocrm_contacts_tags.contacts_id AS "Идентификатор контакта",
    amocrm_contacts_tags.tag_id AS "Внутренний идентификатор метки",
    amocrm_contacts_tags.name AS "Название"
   FROM public.amocrm_contacts_tags;


ALTER TABLE public."AMO Метки контактов" OWNER TO "owner-gycqvgb";

--
-- TOC entry 289 (class 1259 OID 621502)
-- Name: amocrm_customers_tags; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_customers_tags (
    id integer NOT NULL,
    account_id integer NOT NULL,
    customers_id integer NOT NULL,
    tag_id integer NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE public.amocrm_customers_tags OWNER TO "owner-gycqvgb";

--
-- TOC entry 333 (class 1259 OID 621951)
-- Name: AMO Метки покупателей; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Метки покупателей" AS
 SELECT amocrm_customers_tags.id AS "Идентификатор записи",
    amocrm_customers_tags.account_id AS "Идентификатор подключенного акка",
    amocrm_customers_tags.customers_id AS "Идентификатор покупателя",
    amocrm_customers_tags.tag_id AS "Внутренний идентификатор метки",
    amocrm_customers_tags.name AS "Название"
   FROM public.amocrm_customers_tags;


ALTER TABLE public."AMO Метки покупателей" OWNER TO "owner-gycqvgb";

--
-- TOC entry 305 (class 1259 OID 621705)
-- Name: amocrm_leads_tags; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_leads_tags (
    id integer NOT NULL,
    account_id integer NOT NULL,
    leads_id integer NOT NULL,
    tag_id integer NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE public.amocrm_leads_tags OWNER TO "owner-gycqvgb";

--
-- TOC entry 342 (class 1259 OID 621991)
-- Name: AMO Метки сделок; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Метки сделок" AS
 SELECT amocrm_leads_tags.id AS "Идентификатор записи",
    amocrm_leads_tags.account_id AS "Идентификатор подключенного акка",
    amocrm_leads_tags.leads_id AS "Идентификатор сделки",
    amocrm_leads_tags.tag_id AS "Внутренний идентификатор метки",
    amocrm_leads_tags.name AS "Название"
   FROM public.amocrm_leads_tags;


ALTER TABLE public."AMO Метки сделок" OWNER TO "owner-gycqvgb";

--
-- TOC entry 251 (class 1259 OID 621113)
-- Name: amocrm_tasks; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_tasks (
    id integer NOT NULL,
    account_id integer NOT NULL,
    task_id integer NOT NULL,
    task_type character varying(32),
    text character varying(256),
    result character varying(512),
    status_code integer NOT NULL,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.amocrm_tasks OWNER TO "owner-gycqvgb";

--
-- TOC entry 345 (class 1259 OID 622003)
-- Name: AMO Параметры задач; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Параметры задач" AS
 SELECT amocrm_tasks.id AS "Идентификатор задачи",
    amocrm_tasks.account_id AS "Идентификатор подключенного акка",
    amocrm_tasks.task_id AS "Внутренний идентификатор задачи",
    amocrm_tasks.task_type AS "Тип задачи",
    amocrm_tasks.text AS "Текст",
    amocrm_tasks.result AS "Результат выполнения",
    amocrm_tasks.status_code AS "Статус",
    amocrm_tasks.is_deleted AS "Задача удалена"
   FROM public.amocrm_tasks;


ALTER TABLE public."AMO Параметры задач" OWNER TO "owner-gycqvgb";

--
-- TOC entry 235 (class 1259 OID 621033)
-- Name: amocrm_calls; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_calls (
    id integer NOT NULL,
    account_id integer NOT NULL,
    note_id integer NOT NULL,
    call_id character varying(64),
    call_type character varying(16),
    call_status character varying(32),
    call_result character varying(128),
    phone character varying(64),
    link character varying(512)
);


ALTER TABLE public.amocrm_calls OWNER TO "owner-gycqvgb";

--
-- TOC entry 314 (class 1259 OID 621875)
-- Name: AMO Параметры звонков; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Параметры звонков" AS
 SELECT amocrm_calls.id AS "Идентификатор звонка",
    amocrm_calls.account_id AS "Идентификатор подключенного акка",
    amocrm_calls.note_id AS "Внутренний идентификатор примеча",
    amocrm_calls.call_id AS "Внутренний идентификатор звонка",
    amocrm_calls.call_type AS "Тип звонка",
    amocrm_calls.call_status AS "Статус звонка",
    amocrm_calls.call_result AS "Результат звонка",
    amocrm_calls.phone AS "Номер телефона",
    amocrm_calls.link AS "Ссылка на запись звонка"
   FROM public.amocrm_calls;


ALTER TABLE public."AMO Параметры звонков" OWNER TO "owner-gycqvgb";

--
-- TOC entry 237 (class 1259 OID 621044)
-- Name: amocrm_companies; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_companies (
    id integer NOT NULL,
    account_id integer NOT NULL,
    company_id integer NOT NULL,
    name character varying(128),
    phone character varying(256),
    email character varying(256),
    site character varying(256),
    is_deleted boolean NOT NULL
);


ALTER TABLE public.amocrm_companies OWNER TO "owner-gycqvgb";

--
-- TOC entry 316 (class 1259 OID 621883)
-- Name: AMO Параметры компаний; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Параметры компаний" AS
 SELECT amocrm_companies.id AS "Идентификатор компании",
    amocrm_companies.account_id AS "Идентификатор подключенного акка",
    amocrm_companies.company_id AS "Внутренний идентификатор компани",
    amocrm_companies.name AS "Название компании",
    amocrm_companies.phone AS "Контактный телефон",
    amocrm_companies.email AS "Контактный email",
    amocrm_companies.site AS "Сайт компании",
    amocrm_companies.is_deleted AS "Компания удалена"
   FROM public.amocrm_companies;


ALTER TABLE public."AMO Параметры компаний" OWNER TO "owner-gycqvgb";

--
-- TOC entry 239 (class 1259 OID 621055)
-- Name: amocrm_contacts; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_contacts (
    id integer NOT NULL,
    account_id integer NOT NULL,
    contact_id integer NOT NULL,
    name character varying(64),
    company character varying(128),
    post character varying(256),
    phone character varying(256),
    email character varying(256),
    request_id character varying(64),
    is_deleted boolean NOT NULL
);


ALTER TABLE public.amocrm_contacts OWNER TO "owner-gycqvgb";

--
-- TOC entry 322 (class 1259 OID 621907)
-- Name: AMO Параметры контактов; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Параметры контактов" AS
 SELECT amocrm_contacts.id AS "Идентификатор контакта",
    amocrm_contacts.account_id AS "Идентификатор подключенного акка",
    amocrm_contacts.contact_id AS "Внутренний идентификатор контакт",
    amocrm_contacts.name AS "Имя контакта",
    amocrm_contacts.company AS "Компания",
    amocrm_contacts.post AS "Должность",
    amocrm_contacts.phone AS "Телефон",
    amocrm_contacts.email AS "e-mail",
    amocrm_contacts.request_id AS "Идентификатор заявки",
    amocrm_contacts.is_deleted AS "Контакт удален"
   FROM public.amocrm_contacts;


ALTER TABLE public."AMO Параметры контактов" OWNER TO "owner-gycqvgb";

--
-- TOC entry 255 (class 1259 OID 621133)
-- Name: amocrm_unsorted; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_unsorted (
    id integer NOT NULL,
    account_id integer NOT NULL,
    unsorted_id character varying(64) NOT NULL,
    source_uid character varying(64),
    source_name character varying(128),
    category character varying(16),
    unsorted_metadata text,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.amocrm_unsorted OWNER TO "owner-gycqvgb";

--
-- TOC entry 350 (class 1259 OID 622027)
-- Name: AMO Параметры неразобранного; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Параметры неразобранного" AS
 SELECT amocrm_unsorted.id AS "Идентификатор неразобранного",
    amocrm_unsorted.account_id AS "Идентификатор подключенного акка",
    amocrm_unsorted.unsorted_id AS "Внутренний идентификатор неразоб",
    amocrm_unsorted.source_uid AS "Внутренний идентификатор источни",
    amocrm_unsorted.source_name AS "Название источника заявки",
    amocrm_unsorted.category AS "Категория неразобранного",
    amocrm_unsorted.unsorted_metadata AS "Метаданные заявки",
    amocrm_unsorted.is_deleted AS "Неразобранное удалено"
   FROM public.amocrm_unsorted;


ALTER TABLE public."AMO Параметры неразобранного" OWNER TO "owner-gycqvgb";

--
-- TOC entry 241 (class 1259 OID 621066)
-- Name: amocrm_customers; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_customers (
    id integer NOT NULL,
    account_id integer NOT NULL,
    customer_id integer NOT NULL,
    name character varying(128),
    period character varying(64),
    period_order integer
);


ALTER TABLE public.amocrm_customers OWNER TO "owner-gycqvgb";

--
-- TOC entry 328 (class 1259 OID 621931)
-- Name: AMO Параметры покупателей; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Параметры покупателей" AS
 SELECT amocrm_customers.id AS "Идентификатор покупателя",
    amocrm_customers.account_id AS "Идентификатор подключенного акка",
    amocrm_customers.customer_id AS "Внутренний идентификатор покупат",
    amocrm_customers.name AS "Название покупателя",
    amocrm_customers.period AS "Период",
    amocrm_customers.period_order AS "Порядок периода"
   FROM public.amocrm_customers;


ALTER TABLE public."AMO Параметры покупателей" OWNER TO "owner-gycqvgb";

--
-- TOC entry 257 (class 1259 OID 621143)
-- Name: amocrm_users; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_users (
    id integer NOT NULL,
    account_id integer NOT NULL,
    user_id integer NOT NULL,
    login character varying(64),
    name character varying(64),
    phone character varying(64),
    group_name character varying(64),
    email character varying(64),
    is_admin boolean,
    is_active boolean,
    is_free boolean,
    mail_access boolean,
    catalog_access boolean,
    role_id integer,
    role_name character varying(64),
    group_id integer
);


ALTER TABLE public.amocrm_users OWNER TO "owner-gycqvgb";

--
-- TOC entry 351 (class 1259 OID 622031)
-- Name: AMO Параметры пользователей; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Параметры пользователей" AS
 SELECT amocrm_users.id AS "Идентификатор пользователя",
    amocrm_users.account_id AS "Идентификатор подключенного акка",
    amocrm_users.user_id AS "Внутренний идентификатор пользов",
    amocrm_users.login AS "Логин",
    amocrm_users.name AS "Имя",
    amocrm_users.phone AS "Телефон",
    amocrm_users.group_name AS "Группа пользователя",
    amocrm_users.email AS "Электронный адрес",
    amocrm_users.is_admin AS "Администратор",
    amocrm_users.is_active AS "Активный пользователь",
    amocrm_users.is_free AS "Бесплатный пользователь",
    amocrm_users.mail_access AS "Доступ к функционалу почты",
    amocrm_users.catalog_access AS "Доступ к функционалу списков",
    amocrm_users.role_id AS "Идентификатор роли",
    amocrm_users.role_name AS "Роль пользователя",
    amocrm_users.group_id AS "Идентификатор группы"
   FROM public.amocrm_users;


ALTER TABLE public."AMO Параметры пользователей" OWNER TO "owner-gycqvgb";

--
-- TOC entry 245 (class 1259 OID 621084)
-- Name: amocrm_leads; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_leads (
    id integer NOT NULL,
    account_id integer NOT NULL,
    lead_id integer NOT NULL,
    name character varying(128),
    pipeline character varying(64),
    pipeline_id integer,
    status character varying(128),
    status_id integer,
    status_order integer,
    request_id character varying(64),
    loss_reason character varying(128),
    loss_reason_id integer,
    is_deleted boolean NOT NULL
);


ALTER TABLE public.amocrm_leads OWNER TO "owner-gycqvgb";

--
-- TOC entry 337 (class 1259 OID 621967)
-- Name: AMO Параметры сделок; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Параметры сделок" AS
 SELECT amocrm_leads.id AS "Идентификатор сделки",
    amocrm_leads.account_id AS "Идентификатор подключенного акка",
    amocrm_leads.lead_id AS "Внутренний идентификатор сделки",
    amocrm_leads.name AS "Название сделки",
    amocrm_leads.pipeline AS "Название воронки",
    amocrm_leads.pipeline_id AS "Идентификатор воронки",
    amocrm_leads.status AS "Статус сделки",
    amocrm_leads.status_id AS "Идентификатор этапа",
    amocrm_leads.status_order AS "Очередность статуса сделки",
    amocrm_leads.request_id AS "Идентификатор заявки",
    amocrm_leads.loss_reason AS "Причина отказа",
    amocrm_leads.loss_reason_id AS "Идентификатор причины отказа",
    amocrm_leads.is_deleted AS "Сделка удалена"
   FROM public.amocrm_leads;


ALTER TABLE public."AMO Параметры сделок" OWNER TO "owner-gycqvgb";

--
-- TOC entry 293 (class 1259 OID 621532)
-- Name: amocrm_elements_products; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_elements_products (
    id integer NOT NULL,
    account_id integer NOT NULL,
    elements_id integer NOT NULL,
    sku character varying(32),
    description character varying(256),
    unit_price integer,
    quantity integer,
    unit_type character varying(16),
    discount_type character varying(16),
    discount_value integer,
    vat_rate_id integer,
    external_uid character varying(32)
);


ALTER TABLE public.amocrm_elements_products OWNER TO "owner-gycqvgb";

--
-- TOC entry 336 (class 1259 OID 621963)
-- Name: AMO Параметры товаров; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Параметры товаров" AS
 SELECT amocrm_elements_products.id AS "Идентификатор записи",
    amocrm_elements_products.account_id AS "Идентификатор подключенного акка",
    amocrm_elements_products.elements_id AS "Идентификатор элемента",
    amocrm_elements_products.sku AS "Внутренний идентификатор товара",
    amocrm_elements_products.description AS "Описание",
    amocrm_elements_products.unit_price AS "Цена за единицу",
    amocrm_elements_products.quantity AS "Количество",
    amocrm_elements_products.unit_type AS "Единица измерения",
    amocrm_elements_products.discount_type AS "Тип скидки",
    amocrm_elements_products.discount_value AS "Сумма скидки",
    amocrm_elements_products.vat_rate_id AS "Идентификатор налога",
    amocrm_elements_products.external_uid AS "Внешний идентификатор товара"
   FROM public.amocrm_elements_products;


ALTER TABLE public."AMO Параметры товаров" OWNER TO "owner-gycqvgb";

--
-- TOC entry 253 (class 1259 OID 621124)
-- Name: amocrm_transactions; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_transactions (
    id integer NOT NULL,
    account_id integer NOT NULL,
    transaction_id integer NOT NULL,
    comment character varying(256)
);


ALTER TABLE public.amocrm_transactions OWNER TO "owner-gycqvgb";

--
-- TOC entry 348 (class 1259 OID 622019)
-- Name: AMO Параметры транзакций; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Параметры транзакций" AS
 SELECT amocrm_transactions.id AS "Идентификатор транзакции",
    amocrm_transactions.account_id AS "Идентификатор подключенного акка",
    amocrm_transactions.transaction_id AS "Внутренний идентификатор транзак",
    amocrm_transactions.comment AS "Комментарий"
   FROM public.amocrm_transactions;


ALTER TABLE public."AMO Параметры транзакций" OWNER TO "owner-gycqvgb";

--
-- TOC entry 243 (class 1259 OID 621075)
-- Name: amocrm_elements; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_elements (
    id integer NOT NULL,
    account_id integer NOT NULL,
    element_id integer NOT NULL,
    name character varying(256),
    catalog character varying(128),
    catalog_order integer
);


ALTER TABLE public.amocrm_elements OWNER TO "owner-gycqvgb";

--
-- TOC entry 334 (class 1259 OID 621955)
-- Name: AMO Параметры элементов; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Параметры элементов" AS
 SELECT amocrm_elements.id AS "Идентификатор элемента",
    amocrm_elements.account_id AS "Идентификатор подключенного акка",
    amocrm_elements.element_id AS "Внутренний идентификатор элемент",
    amocrm_elements.name AS "Название",
    amocrm_elements.catalog AS "Список",
    amocrm_elements.catalog_order AS "Порядок списка"
   FROM public.amocrm_elements;


ALTER TABLE public."AMO Параметры элементов" OWNER TO "owner-gycqvgb";

--
-- TOC entry 285 (class 1259 OID 621445)
-- Name: amocrm_customers_facts; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_customers_facts (
    id integer NOT NULL,
    account_id integer NOT NULL,
    customers_id integer NOT NULL,
    created_id integer NOT NULL,
    expected_id integer NOT NULL,
    companies_id integer NOT NULL,
    contacts_id integer NOT NULL,
    users_id integer NOT NULL,
    periodicity integer NOT NULL,
    purchases integer NOT NULL,
    average_check numeric(18,2) NOT NULL,
    next_price numeric(18,2) NOT NULL,
    ltv numeric(18,2) NOT NULL
);


ALTER TABLE public.amocrm_customers_facts OWNER TO "owner-gycqvgb";

--
-- TOC entry 331 (class 1259 OID 621943)
-- Name: AMO Покупатели; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Покупатели" AS
 SELECT amocrm_customers_facts.account_id AS "Идентификатор подключенного акка",
    amocrm_customers_facts.customers_id AS "Идентификатор покупателя",
    amocrm_customers_facts.created_id AS "Идентификатор даты создания",
    amocrm_customers_facts.expected_id AS "Идентификатор даты следующей поку",
    amocrm_customers_facts.companies_id AS "Идентификатор компании",
    amocrm_customers_facts.contacts_id AS "Идентификатор контакта",
    amocrm_customers_facts.users_id AS "Идентификатор пользователя",
    amocrm_customers_facts.periodicity AS "Периодичность",
    amocrm_customers_facts.purchases AS "Покупки",
    amocrm_customers_facts.average_check AS "Средняя сумма",
    amocrm_customers_facts.next_price AS "Ожидаемая сумма",
    amocrm_customers_facts.ltv AS "LTV"
   FROM public.amocrm_customers_facts;


ALTER TABLE public."AMO Покупатели" OWNER TO "owner-gycqvgb";

--
-- TOC entry 311 (class 1259 OID 621792)
-- Name: amocrm_tasks_notes; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_tasks_notes (
    id integer NOT NULL,
    account_id integer NOT NULL,
    tasks_id integer NOT NULL,
    creator_id integer,
    responsible_id integer,
    note_id integer NOT NULL,
    note_type character varying(64),
    note_type_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    text text,
    params text
);


ALTER TABLE public.amocrm_tasks_notes OWNER TO "owner-gycqvgb";

--
-- TOC entry 353 (class 1259 OID 623733)
-- Name: AMO Примечания задач; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Примечания задач" AS
 SELECT amocrm_tasks_notes.id AS "Идентификатор записи",
    amocrm_tasks_notes.account_id AS "Идентификатор подключенного акка",
    amocrm_tasks_notes.tasks_id AS "Идентификатор задачи",
    amocrm_tasks_notes.creator_id AS "Внутренний идентификатор создавш",
    amocrm_tasks_notes.responsible_id AS "Внутренний идентификатор ответст",
    amocrm_tasks_notes.note_id AS "Внутренний идентификатор примеча",
    amocrm_tasks_notes.note_type AS "Тип примечания",
    amocrm_tasks_notes.note_type_id AS "Идентификатор типа примечания",
    amocrm_tasks_notes.created_at AS "Дата создания",
    amocrm_tasks_notes.updated_at AS "Дата изменения",
    amocrm_tasks_notes.text AS "Текст примечания",
    amocrm_tasks_notes.params AS "Дополнительные параметры"
   FROM public.amocrm_tasks_notes;


ALTER TABLE public."AMO Примечания задач" OWNER TO "owner-gycqvgb";

--
-- TOC entry 267 (class 1259 OID 621256)
-- Name: amocrm_companies_notes; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_companies_notes (
    id integer NOT NULL,
    account_id integer NOT NULL,
    companies_id integer NOT NULL,
    creator_id integer,
    responsible_id integer,
    note_id integer NOT NULL,
    note_type character varying(64),
    note_type_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    text text,
    params text
);


ALTER TABLE public.amocrm_companies_notes OWNER TO "owner-gycqvgb";

--
-- TOC entry 320 (class 1259 OID 621899)
-- Name: AMO Примечания компаний; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Примечания компаний" AS
 SELECT amocrm_companies_notes.id AS "Идентификатор записи",
    amocrm_companies_notes.account_id AS "Идентификатор подключенного акка",
    amocrm_companies_notes.companies_id AS "Идентификатор компании",
    amocrm_companies_notes.creator_id AS "Внутренний идентификатор создавш",
    amocrm_companies_notes.responsible_id AS "Внутренний идентификатор ответст",
    amocrm_companies_notes.note_id AS "Внутренний идентификатор примеча",
    amocrm_companies_notes.note_type AS "Тип примечания",
    amocrm_companies_notes.note_type_id AS "Идентификатор типа примечания",
    amocrm_companies_notes.created_at AS "Дата создания",
    amocrm_companies_notes.updated_at AS "Дата изменения",
    amocrm_companies_notes.text AS "Текст примечания",
    amocrm_companies_notes.params AS "Дополнительные параметры"
   FROM public.amocrm_companies_notes;


ALTER TABLE public."AMO Примечания компаний" OWNER TO "owner-gycqvgb";

--
-- TOC entry 277 (class 1259 OID 621352)
-- Name: amocrm_contacts_notes; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_contacts_notes (
    id integer NOT NULL,
    account_id integer NOT NULL,
    contacts_id integer NOT NULL,
    creator_id integer,
    responsible_id integer,
    note_id integer NOT NULL,
    note_type character varying(64),
    note_type_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    text text,
    params text
);


ALTER TABLE public.amocrm_contacts_notes OWNER TO "owner-gycqvgb";

--
-- TOC entry 326 (class 1259 OID 621923)
-- Name: AMO Примечания контактов; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Примечания контактов" AS
 SELECT amocrm_contacts_notes.id AS "Идентификатор записи",
    amocrm_contacts_notes.account_id AS "Идентификатор подключенного акка",
    amocrm_contacts_notes.contacts_id AS "Идентификатор контакта",
    amocrm_contacts_notes.creator_id AS "Внутренний идентификатор создавш",
    amocrm_contacts_notes.responsible_id AS "Внутренний идентификатор ответст",
    amocrm_contacts_notes.note_id AS "Внутренний идентификатор примеча",
    amocrm_contacts_notes.note_type AS "Тип примечания",
    amocrm_contacts_notes.note_type_id AS "Идентификатор типа примечания",
    amocrm_contacts_notes.created_at AS "Дата создания",
    amocrm_contacts_notes.updated_at AS "Дата изменения",
    amocrm_contacts_notes.text AS "Текст примечания",
    amocrm_contacts_notes.params AS "Дополнительные параметры"
   FROM public.amocrm_contacts_notes;


ALTER TABLE public."AMO Примечания контактов" OWNER TO "owner-gycqvgb";

--
-- TOC entry 287 (class 1259 OID 621485)
-- Name: amocrm_customers_notes; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_customers_notes (
    id integer NOT NULL,
    account_id integer NOT NULL,
    customers_id integer NOT NULL,
    creator_id integer,
    responsible_id integer,
    note_id integer NOT NULL,
    note_type character varying(64),
    note_type_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    text text,
    params text
);


ALTER TABLE public.amocrm_customers_notes OWNER TO "owner-gycqvgb";

--
-- TOC entry 332 (class 1259 OID 621947)
-- Name: AMO Примечания покупателей; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Примечания покупателей" AS
 SELECT amocrm_customers_notes.id AS "Идентификатор записи",
    amocrm_customers_notes.account_id AS "Идентификатор подключенного акка",
    amocrm_customers_notes.customers_id AS "Идентификатор покупателя",
    amocrm_customers_notes.creator_id AS "Внутренний идентификатор создавш",
    amocrm_customers_notes.responsible_id AS "Внутренний идентификатор ответст",
    amocrm_customers_notes.note_id AS "Внутренний идентификатор примеча",
    amocrm_customers_notes.note_type AS "Тип примечания",
    amocrm_customers_notes.note_type_id AS "Идентификатор типа примечания",
    amocrm_customers_notes.created_at AS "Дата создания",
    amocrm_customers_notes.updated_at AS "Дата изменения",
    amocrm_customers_notes.text AS "Текст примечания",
    amocrm_customers_notes.params AS "Дополнительные параметры"
   FROM public.amocrm_customers_notes;


ALTER TABLE public."AMO Примечания покупателей" OWNER TO "owner-gycqvgb";

--
-- TOC entry 303 (class 1259 OID 621687)
-- Name: amocrm_leads_notes; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_leads_notes (
    id integer NOT NULL,
    account_id integer NOT NULL,
    leads_id integer NOT NULL,
    creator_id integer,
    responsible_id integer,
    note_id integer NOT NULL,
    note_type character varying(64),
    note_type_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    text text,
    params text
);


ALTER TABLE public.amocrm_leads_notes OWNER TO "owner-gycqvgb";

--
-- TOC entry 341 (class 1259 OID 621987)
-- Name: AMO Примечания сделок; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Примечания сделок" AS
 SELECT amocrm_leads_notes.id AS "Идентификатор записи",
    amocrm_leads_notes.account_id AS "Идентификатор подключенного акка",
    amocrm_leads_notes.leads_id AS "Идентификатор сделки",
    amocrm_leads_notes.creator_id AS "Внутренний идентификатор создавш",
    amocrm_leads_notes.responsible_id AS "Внутренний идентификатор ответст",
    amocrm_leads_notes.note_id AS "Внутренний идентификатор примеча",
    amocrm_leads_notes.note_type AS "Тип примечания",
    amocrm_leads_notes.note_type_id AS "Идентификатор типа примечания",
    amocrm_leads_notes.created_at AS "Дата создания",
    amocrm_leads_notes.updated_at AS "Дата изменения",
    amocrm_leads_notes.text AS "Текст примечания",
    amocrm_leads_notes.params AS "Дополнительные параметры"
   FROM public.amocrm_leads_notes;


ALTER TABLE public."AMO Примечания сделок" OWNER TO "owner-gycqvgb";

--
-- TOC entry 301 (class 1259 OID 621630)
-- Name: amocrm_leads_facts; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_leads_facts (
    id integer NOT NULL,
    account_id integer NOT NULL,
    clientids_id integer NOT NULL,
    traffic_id integer NOT NULL,
    users_id integer NOT NULL,
    leads_id integer NOT NULL,
    contacts_id integer NOT NULL,
    companies_id integer NOT NULL,
    unsorteds_id integer NOT NULL,
    created_id integer NOT NULL,
    closed_id integer NOT NULL,
    price numeric(18,2) NOT NULL
);


ALTER TABLE public.amocrm_leads_facts OWNER TO "owner-gycqvgb";

--
-- TOC entry 340 (class 1259 OID 621983)
-- Name: AMO Сделки; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Сделки" AS
 SELECT amocrm_leads_facts.account_id AS "Идентификатор подключенного акка",
    amocrm_leads_facts.clientids_id AS "Идентификатор клиента",
    amocrm_leads_facts.traffic_id AS "Идентификатор источника трафика",
    amocrm_leads_facts.users_id AS "Идентификатор пользователя",
    amocrm_leads_facts.leads_id AS "Идентификатор сделки",
    amocrm_leads_facts.contacts_id AS "Идентификатор контакта",
    amocrm_leads_facts.companies_id AS "Идентификатор компании",
    amocrm_leads_facts.unsorteds_id AS "Идентификатор неразобранного",
    amocrm_leads_facts.created_id AS "Идентификатор даты открытия сделк",
    amocrm_leads_facts.closed_id AS "Идентификатор даты закрытия сделк",
    amocrm_leads_facts.price AS "Сумма"
   FROM public.amocrm_leads_facts;


ALTER TABLE public."AMO Сделки" OWNER TO "owner-gycqvgb";

--
-- TOC entry 307 (class 1259 OID 621719)
-- Name: amocrm_tasks_events; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_tasks_events (
    id integer NOT NULL,
    account_id integer NOT NULL,
    tasks_id integer NOT NULL,
    event_id character varying(32) NOT NULL,
    type character varying(64) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    value_after text NOT NULL,
    value_before text NOT NULL
);


ALTER TABLE public.amocrm_tasks_events OWNER TO "owner-gycqvgb";

--
-- TOC entry 346 (class 1259 OID 622007)
-- Name: AMO События задач; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO События задач" AS
 SELECT amocrm_tasks_events.id AS "Идентификатор записи",
    amocrm_tasks_events.account_id AS "Идентификатор подключенного акка",
    amocrm_tasks_events.tasks_id AS "Идентификатор задачи",
    amocrm_tasks_events.event_id AS "Внутренний идентификатор события",
    amocrm_tasks_events.type AS "Тип события",
    amocrm_tasks_events.created_by AS "Внутренний идентификатор создавш",
    amocrm_tasks_events.created_at AS "Дата создания",
    amocrm_tasks_events.value_after AS "Состояние после",
    amocrm_tasks_events.value_before AS "Состояние до"
   FROM public.amocrm_tasks_events;


ALTER TABLE public."AMO События задач" OWNER TO "owner-gycqvgb";

--
-- TOC entry 263 (class 1259 OID 621213)
-- Name: amocrm_companies_events; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_companies_events (
    id integer NOT NULL,
    account_id integer NOT NULL,
    companies_id integer NOT NULL,
    event_id character varying(32) NOT NULL,
    type character varying(64) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    value_after text NOT NULL,
    value_before text NOT NULL
);


ALTER TABLE public.amocrm_companies_events OWNER TO "owner-gycqvgb";

--
-- TOC entry 318 (class 1259 OID 621891)
-- Name: AMO События компаний; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO События компаний" AS
 SELECT amocrm_companies_events.id AS "Идентификатор записи",
    amocrm_companies_events.account_id AS "Идентификатор подключенного акка",
    amocrm_companies_events.companies_id AS "Идентификатор компании",
    amocrm_companies_events.event_id AS "Внутренний идентификатор события",
    amocrm_companies_events.type AS "Тип события",
    amocrm_companies_events.created_by AS "Внутренний идентификатор создавш",
    amocrm_companies_events.created_at AS "Дата создания",
    amocrm_companies_events.value_after AS "Состояние после",
    amocrm_companies_events.value_before AS "Состояние до"
   FROM public.amocrm_companies_events;


ALTER TABLE public."AMO События компаний" OWNER TO "owner-gycqvgb";

--
-- TOC entry 273 (class 1259 OID 621304)
-- Name: amocrm_contacts_events; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_contacts_events (
    id integer NOT NULL,
    account_id integer NOT NULL,
    contacts_id integer NOT NULL,
    event_id character varying(32) NOT NULL,
    type character varying(64) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    value_after text NOT NULL,
    value_before text NOT NULL
);


ALTER TABLE public.amocrm_contacts_events OWNER TO "owner-gycqvgb";

--
-- TOC entry 324 (class 1259 OID 621915)
-- Name: AMO События контактов; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO События контактов" AS
 SELECT amocrm_contacts_events.id AS "Идентификатор записи",
    amocrm_contacts_events.account_id AS "Идентификатор подключенного акка",
    amocrm_contacts_events.contacts_id AS "Идентификатор контакта",
    amocrm_contacts_events.event_id AS "Внутренний идентификатор события",
    amocrm_contacts_events.type AS "Тип события",
    amocrm_contacts_events.created_by AS "Внутренний идентификатор создавш",
    amocrm_contacts_events.created_at AS "Дата создания",
    amocrm_contacts_events.value_after AS "Состояние после",
    amocrm_contacts_events.value_before AS "Состояние до"
   FROM public.amocrm_contacts_events;


ALTER TABLE public."AMO События контактов" OWNER TO "owner-gycqvgb";

--
-- TOC entry 299 (class 1259 OID 621612)
-- Name: amocrm_leads_events; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_leads_events (
    id integer NOT NULL,
    account_id integer NOT NULL,
    leads_id integer NOT NULL,
    event_id character varying(32) NOT NULL,
    type character varying(64) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    value_after text NOT NULL,
    value_before text NOT NULL
);


ALTER TABLE public.amocrm_leads_events OWNER TO "owner-gycqvgb";

--
-- TOC entry 339 (class 1259 OID 621979)
-- Name: AMO События сделок; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO События сделок" AS
 SELECT amocrm_leads_events.id AS "Идентификатор записи",
    amocrm_leads_events.account_id AS "Идентификатор подключенного акка",
    amocrm_leads_events.leads_id AS "Идентификатор сделки",
    amocrm_leads_events.event_id AS "Внутренний идентификатор события",
    amocrm_leads_events.type AS "Тип события",
    amocrm_leads_events.created_by AS "Внутренний идентификатор создавш",
    amocrm_leads_events.created_at AS "Дата создания",
    amocrm_leads_events.value_after AS "Состояние после",
    amocrm_leads_events.value_before AS "Состояние до"
   FROM public.amocrm_leads_events;


ALTER TABLE public."AMO События сделок" OWNER TO "owner-gycqvgb";

--
-- TOC entry 247 (class 1259 OID 621095)
-- Name: amocrm_pipelines; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_pipelines (
    id integer NOT NULL,
    account_id integer NOT NULL,
    pipeline_id integer NOT NULL,
    name character varying(64) NOT NULL,
    sort integer NOT NULL,
    is_main boolean NOT NULL,
    is_unsorted_on boolean NOT NULL,
    is_archive boolean NOT NULL
);


ALTER TABLE public.amocrm_pipelines OWNER TO "owner-gycqvgb";

--
-- TOC entry 343 (class 1259 OID 621995)
-- Name: AMO Справочник воронок; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Справочник воронок" AS
 SELECT amocrm_pipelines.id AS "Идентификатор записи",
    amocrm_pipelines.account_id AS "Идентификатор подключенного акка",
    amocrm_pipelines.pipeline_id AS "Идентификатор воронки",
    amocrm_pipelines.name AS "Название воронки",
    amocrm_pipelines.sort AS "Порядковый номер воронки",
    amocrm_pipelines.is_main AS "Главная воронка",
    amocrm_pipelines.is_unsorted_on AS "Неразобранное в воронке включено",
    amocrm_pipelines.is_archive AS "Архивная воронка"
   FROM public.amocrm_pipelines;


ALTER TABLE public."AMO Справочник воронок" OWNER TO "owner-gycqvgb";

--
-- TOC entry 249 (class 1259 OID 621104)
-- Name: amocrm_statuses; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_statuses (
    id integer NOT NULL,
    account_id integer NOT NULL,
    pipeline_id integer NOT NULL,
    status_id integer NOT NULL,
    name character varying(128) NOT NULL,
    color character varying(8) NOT NULL,
    sort integer NOT NULL,
    is_editable boolean NOT NULL,
    type integer NOT NULL
);


ALTER TABLE public.amocrm_statuses OWNER TO "owner-gycqvgb";

--
-- TOC entry 344 (class 1259 OID 621999)
-- Name: AMO Справочник этапов продаж; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Справочник этапов продаж" AS
 SELECT amocrm_statuses.id AS "Идентификатор записи",
    amocrm_statuses.account_id AS "Идентификатор подключенного акка",
    amocrm_statuses.pipeline_id AS "Идентификатор воронки",
    amocrm_statuses.status_id AS "Идентификатор этапа",
    amocrm_statuses.name AS "Название этапа",
    amocrm_statuses.color AS "Цвет этапа",
    amocrm_statuses.sort AS "Порядковый номер этапа",
    amocrm_statuses.is_editable AS "Редактируемый этап",
    amocrm_statuses.type AS "Тип статуса"
   FROM public.amocrm_statuses;


ALTER TABLE public."AMO Справочник этапов продаж" OWNER TO "owner-gycqvgb";

--
-- TOC entry 313 (class 1259 OID 621810)
-- Name: amocrm_transactions_facts; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_transactions_facts (
    id integer NOT NULL,
    account_id integer NOT NULL,
    customers_id integer NOT NULL,
    transactions_id integer NOT NULL,
    dates_id integer NOT NULL,
    companies_id integer NOT NULL,
    contacts_id integer NOT NULL,
    users_id integer NOT NULL,
    price numeric(18,2) NOT NULL
);


ALTER TABLE public.amocrm_transactions_facts OWNER TO "owner-gycqvgb";

--
-- TOC entry 349 (class 1259 OID 622023)
-- Name: AMO Транзакции; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Транзакции" AS
 SELECT amocrm_transactions_facts.account_id AS "Идентификатор подключенного акка",
    amocrm_transactions_facts.customers_id AS "Идентификатор покупателя",
    amocrm_transactions_facts.transactions_id AS "Идентификатор транзакции",
    amocrm_transactions_facts.dates_id AS "Идентификатор даты",
    amocrm_transactions_facts.companies_id AS "Идентификатор компании",
    amocrm_transactions_facts.contacts_id AS "Идентификатор контакта",
    amocrm_transactions_facts.users_id AS "Идентификатор пользователя",
    amocrm_transactions_facts.price AS "Сумма",
    general_dates.simple_date AS "Дата"
   FROM public.amocrm_transactions_facts,
    public.general_dates
  WHERE (general_dates.id = amocrm_transactions_facts.dates_id);


ALTER TABLE public."AMO Транзакции" OWNER TO "owner-gycqvgb";

--
-- TOC entry 283 (class 1259 OID 621400)
-- Name: amocrm_customers_elements_facts; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_customers_elements_facts (
    id integer NOT NULL,
    account_id integer NOT NULL,
    elements_id integer NOT NULL,
    customers_id integer NOT NULL,
    created_id integer NOT NULL,
    expected_id integer NOT NULL,
    companies_id integer NOT NULL,
    contacts_id integer NOT NULL,
    users_id integer NOT NULL
);


ALTER TABLE public.amocrm_customers_elements_facts OWNER TO "owner-gycqvgb";

--
-- TOC entry 330 (class 1259 OID 621939)
-- Name: AMO Элементы покупателей; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Элементы покупателей" AS
 SELECT amocrm_customers_elements_facts.account_id AS "Идентификатор подключенного акка",
    amocrm_customers_elements_facts.elements_id AS "Идентификатор элемента",
    amocrm_customers_elements_facts.customers_id AS "Идентификатор покупателя",
    amocrm_customers_elements_facts.created_id AS "Идентификатор даты создания",
    amocrm_customers_elements_facts.expected_id AS "Идентификатор даты следующей поку",
    amocrm_customers_elements_facts.companies_id AS "Идентификатор компании",
    amocrm_customers_elements_facts.contacts_id AS "Идентификатор контакта",
    amocrm_customers_elements_facts.users_id AS "Идентификатор пользователя"
   FROM public.amocrm_customers_elements_facts;


ALTER TABLE public."AMO Элементы покупателей" OWNER TO "owner-gycqvgb";

--
-- TOC entry 297 (class 1259 OID 621562)
-- Name: amocrm_leads_elements_facts; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.amocrm_leads_elements_facts (
    id integer NOT NULL,
    account_id integer NOT NULL,
    clientids_id integer NOT NULL,
    users_id integer NOT NULL,
    elements_id integer NOT NULL,
    leads_id integer NOT NULL,
    contacts_id integer NOT NULL,
    companies_id integer NOT NULL,
    created_id integer NOT NULL,
    closed_id integer NOT NULL
);


ALTER TABLE public.amocrm_leads_elements_facts OWNER TO "owner-gycqvgb";

--
-- TOC entry 338 (class 1259 OID 621975)
-- Name: AMO Элементы сделок; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."AMO Элементы сделок" AS
 SELECT amocrm_leads_elements_facts.account_id AS "Идентификатор подключенного акка",
    amocrm_leads_elements_facts.clientids_id AS "Идентификатор клиента",
    amocrm_leads_elements_facts.users_id AS "Идентификатор пользователя",
    amocrm_leads_elements_facts.elements_id AS "Идентификатор элемента",
    amocrm_leads_elements_facts.leads_id AS "Идентификатор сделки",
    amocrm_leads_elements_facts.contacts_id AS "Идентификатор контакта",
    amocrm_leads_elements_facts.companies_id AS "Идентификатор компании",
    amocrm_leads_elements_facts.created_id AS "Идентификатор даты открытия сделк",
    amocrm_leads_elements_facts.closed_id AS "Идентификатор даты закрытия сделк"
   FROM public.amocrm_leads_elements_facts;


ALTER TABLE public."AMO Элементы сделок" OWNER TO "owner-gycqvgb";

--
-- TOC entry 230 (class 1259 OID 620987)
-- Name: SHD Параметры дат; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."SHD Параметры дат" AS
 SELECT general_dates.id AS "Идентификатор даты",
    general_dates.full_date AS "Дата и время",
    general_dates.year AS "Год",
    general_dates.quarter AS "Номер квартала",
    general_dates.quarter_label AS "Квартал",
    general_dates.month AS "Номер месяца",
    general_dates.month_label AS "Месяц",
    general_dates.week AS "Номер недели",
    general_dates.weekday AS "Номер дня недели",
    general_dates.weekday_label AS "День недели",
    general_dates.day AS "День",
    general_dates.hour AS "Час",
    general_dates.minute AS "Минута",
    general_dates.simple_date AS "Дата",
    general_dates.time_zone AS "Часовой пояс"
   FROM public.general_dates;


ALTER TABLE public."SHD Параметры дат" OWNER TO "owner-gycqvgb";

--
-- TOC entry 214 (class 1259 OID 620897)
-- Name: general_accounts; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.general_accounts (
    id integer NOT NULL,
    account_id integer NOT NULL,
    caption character varying(128) NOT NULL,
    service character varying(64) NOT NULL,
    enabled boolean NOT NULL,
    status character varying(32),
    interval_start date,
    interval_end date
);


ALTER TABLE public.general_accounts OWNER TO "owner-gycqvgb";

--
-- TOC entry 227 (class 1259 OID 620975)
-- Name: SHD Параметры источников данных; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."SHD Параметры источников данных" AS
 SELECT general_accounts.id AS "Идентификатор записи",
    general_accounts.account_id AS "Идентификатор подключенного акка",
    general_accounts.caption AS "Название источника",
    general_accounts.service AS "Сервис",
    general_accounts.enabled AS "Включен",
    general_accounts.status AS "Статус загрузки",
    general_accounts.interval_start AS "Дата начала интервала",
    general_accounts.interval_end AS "Дата окончания интервала"
   FROM public.general_accounts;


ALTER TABLE public."SHD Параметры источников данных" OWNER TO "owner-gycqvgb";

--
-- TOC entry 220 (class 1259 OID 620924)
-- Name: general_locations; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.general_locations (
    id integer NOT NULL,
    country_iso character varying(8),
    country character varying(64),
    region_iso character varying(8),
    region character varying(128),
    city character varying(64),
    latitude character varying(32),
    longitude character varying(32),
    location_hash character varying(32)
);


ALTER TABLE public.general_locations OWNER TO "owner-gycqvgb";

--
-- TOC entry 231 (class 1259 OID 620991)
-- Name: SHD Параметры местоположений; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."SHD Параметры местоположений" AS
 SELECT general_locations.id AS "Идентификатор местоположения",
    general_locations.country_iso AS "Код страны",
    general_locations.country AS "Страна",
    general_locations.region_iso AS "Код региона",
    general_locations.region AS "Регион",
    general_locations.city AS "Город",
    general_locations.latitude AS "Широта",
    general_locations.longitude AS "Долгота"
   FROM public.general_locations;


ALTER TABLE public."SHD Параметры местоположений" OWNER TO "owner-gycqvgb";

--
-- TOC entry 216 (class 1259 OID 620905)
-- Name: general_clientids; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.general_clientids (
    id integer NOT NULL,
    clientid character varying(64) NOT NULL,
    userid character varying(128),
    phone character varying(64),
    email character varying(128)
);


ALTER TABLE public.general_clientids OWNER TO "owner-gycqvgb";

--
-- TOC entry 228 (class 1259 OID 620979)
-- Name: SHD Параметры посетителей; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."SHD Параметры посетителей" AS
 SELECT general_clientids.id AS "Идентификатор клиента",
    general_clientids.clientid AS "Идентификатор посетителя сайта",
    general_clientids.userid AS "Идентификатор пользователя",
    general_clientids.phone AS "Телефон клиента",
    general_clientids.email AS "e-mail клиента"
   FROM public.general_clientids;


ALTER TABLE public."SHD Параметры посетителей" OWNER TO "owner-gycqvgb";

--
-- TOC entry 222 (class 1259 OID 620932)
-- Name: general_sites; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.general_sites (
    id integer NOT NULL,
    domain character varying(64),
    description character varying(256)
);


ALTER TABLE public.general_sites OWNER TO "owner-gycqvgb";

--
-- TOC entry 232 (class 1259 OID 620997)
-- Name: SHD Параметры сайтов; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."SHD Параметры сайтов" AS
 SELECT general_sites.id AS "Идентификатор сайта",
    general_sites.domain AS "Доменное имя",
    general_sites.description AS "Описание"
   FROM public.general_sites;


ALTER TABLE public."SHD Параметры сайтов" OWNER TO "owner-gycqvgb";

--
-- TOC entry 224 (class 1259 OID 620940)
-- Name: general_traffic; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.general_traffic (
    id integer NOT NULL,
    "grouping" character varying(128),
    source character varying(256),
    medium character varying(256),
    campaign character varying(256),
    content character varying(512),
    keyword character varying(256),
    landing_page character varying(256),
    traffic_hash character varying(32)
);


ALTER TABLE public.general_traffic OWNER TO "owner-gycqvgb";

--
-- TOC entry 233 (class 1259 OID 621001)
-- Name: SHD Параметры трафика; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."SHD Параметры трафика" AS
 SELECT general_traffic.id AS "Идентификатор источника трафика",
    general_traffic."grouping" AS "Название группы",
    general_traffic.source AS "Источник",
    general_traffic.medium AS "Канал",
    general_traffic.campaign AS "Кампания",
    general_traffic.content AS "Объявление",
    general_traffic.keyword AS "Ключевое слово",
    general_traffic.landing_page AS "Страница входа"
   FROM public.general_traffic;


ALTER TABLE public."SHD Параметры трафика" OWNER TO "owner-gycqvgb";

--
-- TOC entry 226 (class 1259 OID 620950)
-- Name: general_costs_facts; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.general_costs_facts (
    id integer NOT NULL,
    account_id integer NOT NULL,
    dates_id integer NOT NULL,
    sites_id integer NOT NULL,
    traffic_id integer NOT NULL,
    impressions integer NOT NULL,
    clicks integer NOT NULL,
    cost numeric(18,2) NOT NULL,
    vat_included boolean
);


ALTER TABLE public.general_costs_facts OWNER TO "owner-gycqvgb";

--
-- TOC entry 229 (class 1259 OID 620983)
-- Name: SHD Статистика по расходам; Type: VIEW; Schema: public; Owner: owner-gycqvgb
--

CREATE VIEW public."SHD Статистика по расходам" AS
 SELECT general_costs_facts.account_id AS "Идентификатор подключенного акка",
    general_costs_facts.dates_id AS "Идентификатор даты",
    general_costs_facts.sites_id AS "Идентификатор сайта",
    general_costs_facts.traffic_id AS "Идентификатор источника трафика",
    general_costs_facts.impressions AS "Показы",
    general_costs_facts.clicks AS "Клики",
    general_costs_facts.cost AS "Расходы",
    general_costs_facts.vat_included AS "С учетом НДС",
    general_dates.simple_date AS "Дата"
   FROM public.general_costs_facts,
    public.general_dates
  WHERE (general_dates.id = general_costs_facts.dates_id);


ALTER TABLE public."SHD Статистика по расходам" OWNER TO "owner-gycqvgb";

--
-- TOC entry 212 (class 1259 OID 620891)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: owner-gycqvgb
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO "owner-gycqvgb";

--
-- TOC entry 258 (class 1259 OID 621151)
-- Name: amocrm_calls_facts_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_calls_facts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_calls_facts_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4290 (class 0 OID 0)
-- Dependencies: 258
-- Name: amocrm_calls_facts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_calls_facts_id_seq OWNED BY public.amocrm_calls_facts.id;


--
-- TOC entry 234 (class 1259 OID 621032)
-- Name: amocrm_calls_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_calls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_calls_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4291 (class 0 OID 0)
-- Dependencies: 234
-- Name: amocrm_calls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_calls_id_seq OWNED BY public.amocrm_calls.id;


--
-- TOC entry 260 (class 1259 OID 621196)
-- Name: amocrm_companies_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_companies_attributes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_companies_attributes_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4292 (class 0 OID 0)
-- Dependencies: 260
-- Name: amocrm_companies_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_companies_attributes_id_seq OWNED BY public.amocrm_companies_attributes.id;


--
-- TOC entry 262 (class 1259 OID 621212)
-- Name: amocrm_companies_events_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_companies_events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_companies_events_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4293 (class 0 OID 0)
-- Dependencies: 262
-- Name: amocrm_companies_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_companies_events_id_seq OWNED BY public.amocrm_companies_events.id;


--
-- TOC entry 264 (class 1259 OID 621230)
-- Name: amocrm_companies_facts_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_companies_facts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_companies_facts_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4294 (class 0 OID 0)
-- Dependencies: 264
-- Name: amocrm_companies_facts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_companies_facts_id_seq OWNED BY public.amocrm_companies_facts.id;


--
-- TOC entry 236 (class 1259 OID 621043)
-- Name: amocrm_companies_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_companies_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4295 (class 0 OID 0)
-- Dependencies: 236
-- Name: amocrm_companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_companies_id_seq OWNED BY public.amocrm_companies.id;


--
-- TOC entry 266 (class 1259 OID 621255)
-- Name: amocrm_companies_notes_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_companies_notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_companies_notes_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4296 (class 0 OID 0)
-- Dependencies: 266
-- Name: amocrm_companies_notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_companies_notes_id_seq OWNED BY public.amocrm_companies_notes.id;


--
-- TOC entry 268 (class 1259 OID 621273)
-- Name: amocrm_companies_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_companies_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_companies_tags_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4297 (class 0 OID 0)
-- Dependencies: 268
-- Name: amocrm_companies_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_companies_tags_id_seq OWNED BY public.amocrm_companies_tags.id;


--
-- TOC entry 270 (class 1259 OID 621287)
-- Name: amocrm_contacts_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_contacts_attributes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_contacts_attributes_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4298 (class 0 OID 0)
-- Dependencies: 270
-- Name: amocrm_contacts_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_contacts_attributes_id_seq OWNED BY public.amocrm_contacts_attributes.id;


--
-- TOC entry 272 (class 1259 OID 621303)
-- Name: amocrm_contacts_events_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_contacts_events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_contacts_events_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4299 (class 0 OID 0)
-- Dependencies: 272
-- Name: amocrm_contacts_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_contacts_events_id_seq OWNED BY public.amocrm_contacts_events.id;


--
-- TOC entry 274 (class 1259 OID 621321)
-- Name: amocrm_contacts_facts_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_contacts_facts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_contacts_facts_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4300 (class 0 OID 0)
-- Dependencies: 274
-- Name: amocrm_contacts_facts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_contacts_facts_id_seq OWNED BY public.amocrm_contacts_facts.id;


--
-- TOC entry 238 (class 1259 OID 621054)
-- Name: amocrm_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_contacts_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4301 (class 0 OID 0)
-- Dependencies: 238
-- Name: amocrm_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_contacts_id_seq OWNED BY public.amocrm_contacts.id;


--
-- TOC entry 276 (class 1259 OID 621351)
-- Name: amocrm_contacts_notes_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_contacts_notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_contacts_notes_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4302 (class 0 OID 0)
-- Dependencies: 276
-- Name: amocrm_contacts_notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_contacts_notes_id_seq OWNED BY public.amocrm_contacts_notes.id;


--
-- TOC entry 278 (class 1259 OID 621369)
-- Name: amocrm_contacts_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_contacts_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_contacts_tags_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4303 (class 0 OID 0)
-- Dependencies: 278
-- Name: amocrm_contacts_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_contacts_tags_id_seq OWNED BY public.amocrm_contacts_tags.id;


--
-- TOC entry 280 (class 1259 OID 621383)
-- Name: amocrm_customers_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_customers_attributes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_customers_attributes_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4304 (class 0 OID 0)
-- Dependencies: 280
-- Name: amocrm_customers_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_customers_attributes_id_seq OWNED BY public.amocrm_customers_attributes.id;


--
-- TOC entry 282 (class 1259 OID 621399)
-- Name: amocrm_customers_elements_facts_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_customers_elements_facts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_customers_elements_facts_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4305 (class 0 OID 0)
-- Dependencies: 282
-- Name: amocrm_customers_elements_facts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_customers_elements_facts_id_seq OWNED BY public.amocrm_customers_elements_facts.id;


--
-- TOC entry 284 (class 1259 OID 621444)
-- Name: amocrm_customers_facts_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_customers_facts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_customers_facts_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4306 (class 0 OID 0)
-- Dependencies: 284
-- Name: amocrm_customers_facts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_customers_facts_id_seq OWNED BY public.amocrm_customers_facts.id;


--
-- TOC entry 240 (class 1259 OID 621065)
-- Name: amocrm_customers_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_customers_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4307 (class 0 OID 0)
-- Dependencies: 240
-- Name: amocrm_customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_customers_id_seq OWNED BY public.amocrm_customers.id;


--
-- TOC entry 286 (class 1259 OID 621484)
-- Name: amocrm_customers_notes_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_customers_notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_customers_notes_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4308 (class 0 OID 0)
-- Dependencies: 286
-- Name: amocrm_customers_notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_customers_notes_id_seq OWNED BY public.amocrm_customers_notes.id;


--
-- TOC entry 288 (class 1259 OID 621501)
-- Name: amocrm_customers_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_customers_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_customers_tags_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4309 (class 0 OID 0)
-- Dependencies: 288
-- Name: amocrm_customers_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_customers_tags_id_seq OWNED BY public.amocrm_customers_tags.id;


--
-- TOC entry 290 (class 1259 OID 621515)
-- Name: amocrm_elements_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_elements_attributes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_elements_attributes_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4310 (class 0 OID 0)
-- Dependencies: 290
-- Name: amocrm_elements_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_elements_attributes_id_seq OWNED BY public.amocrm_elements_attributes.id;


--
-- TOC entry 242 (class 1259 OID 621074)
-- Name: amocrm_elements_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_elements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_elements_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4311 (class 0 OID 0)
-- Dependencies: 242
-- Name: amocrm_elements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_elements_id_seq OWNED BY public.amocrm_elements.id;


--
-- TOC entry 292 (class 1259 OID 621531)
-- Name: amocrm_elements_products_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_elements_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_elements_products_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4312 (class 0 OID 0)
-- Dependencies: 292
-- Name: amocrm_elements_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_elements_products_id_seq OWNED BY public.amocrm_elements_products.id;


--
-- TOC entry 294 (class 1259 OID 621545)
-- Name: amocrm_leads_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_leads_attributes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_leads_attributes_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4313 (class 0 OID 0)
-- Dependencies: 294
-- Name: amocrm_leads_attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_leads_attributes_id_seq OWNED BY public.amocrm_leads_attributes.id;


--
-- TOC entry 296 (class 1259 OID 621561)
-- Name: amocrm_leads_elements_facts_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_leads_elements_facts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_leads_elements_facts_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4314 (class 0 OID 0)
-- Dependencies: 296
-- Name: amocrm_leads_elements_facts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_leads_elements_facts_id_seq OWNED BY public.amocrm_leads_elements_facts.id;


--
-- TOC entry 298 (class 1259 OID 621611)
-- Name: amocrm_leads_events_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_leads_events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_leads_events_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4315 (class 0 OID 0)
-- Dependencies: 298
-- Name: amocrm_leads_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_leads_events_id_seq OWNED BY public.amocrm_leads_events.id;


--
-- TOC entry 300 (class 1259 OID 621629)
-- Name: amocrm_leads_facts_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_leads_facts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_leads_facts_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4316 (class 0 OID 0)
-- Dependencies: 300
-- Name: amocrm_leads_facts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_leads_facts_id_seq OWNED BY public.amocrm_leads_facts.id;


--
-- TOC entry 244 (class 1259 OID 621083)
-- Name: amocrm_leads_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_leads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_leads_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4317 (class 0 OID 0)
-- Dependencies: 244
-- Name: amocrm_leads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_leads_id_seq OWNED BY public.amocrm_leads.id;


--
-- TOC entry 302 (class 1259 OID 621686)
-- Name: amocrm_leads_notes_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_leads_notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_leads_notes_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4318 (class 0 OID 0)
-- Dependencies: 302
-- Name: amocrm_leads_notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_leads_notes_id_seq OWNED BY public.amocrm_leads_notes.id;


--
-- TOC entry 304 (class 1259 OID 621704)
-- Name: amocrm_leads_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_leads_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_leads_tags_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4319 (class 0 OID 0)
-- Dependencies: 304
-- Name: amocrm_leads_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_leads_tags_id_seq OWNED BY public.amocrm_leads_tags.id;


--
-- TOC entry 246 (class 1259 OID 621094)
-- Name: amocrm_pipelines_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_pipelines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_pipelines_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4320 (class 0 OID 0)
-- Dependencies: 246
-- Name: amocrm_pipelines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_pipelines_id_seq OWNED BY public.amocrm_pipelines.id;


--
-- TOC entry 248 (class 1259 OID 621103)
-- Name: amocrm_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_statuses_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4321 (class 0 OID 0)
-- Dependencies: 248
-- Name: amocrm_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_statuses_id_seq OWNED BY public.amocrm_statuses.id;


--
-- TOC entry 306 (class 1259 OID 621718)
-- Name: amocrm_tasks_events_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_tasks_events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_tasks_events_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4322 (class 0 OID 0)
-- Dependencies: 306
-- Name: amocrm_tasks_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_tasks_events_id_seq OWNED BY public.amocrm_tasks_events.id;


--
-- TOC entry 308 (class 1259 OID 621736)
-- Name: amocrm_tasks_facts_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_tasks_facts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_tasks_facts_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4323 (class 0 OID 0)
-- Dependencies: 308
-- Name: amocrm_tasks_facts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_tasks_facts_id_seq OWNED BY public.amocrm_tasks_facts.id;


--
-- TOC entry 250 (class 1259 OID 621112)
-- Name: amocrm_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_tasks_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4324 (class 0 OID 0)
-- Dependencies: 250
-- Name: amocrm_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_tasks_id_seq OWNED BY public.amocrm_tasks.id;


--
-- TOC entry 310 (class 1259 OID 621791)
-- Name: amocrm_tasks_notes_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_tasks_notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_tasks_notes_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4325 (class 0 OID 0)
-- Dependencies: 310
-- Name: amocrm_tasks_notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_tasks_notes_id_seq OWNED BY public.amocrm_tasks_notes.id;


--
-- TOC entry 312 (class 1259 OID 621809)
-- Name: amocrm_transactions_facts_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_transactions_facts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_transactions_facts_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4326 (class 0 OID 0)
-- Dependencies: 312
-- Name: amocrm_transactions_facts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_transactions_facts_id_seq OWNED BY public.amocrm_transactions_facts.id;


--
-- TOC entry 252 (class 1259 OID 621123)
-- Name: amocrm_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_transactions_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4327 (class 0 OID 0)
-- Dependencies: 252
-- Name: amocrm_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_transactions_id_seq OWNED BY public.amocrm_transactions.id;


--
-- TOC entry 254 (class 1259 OID 621132)
-- Name: amocrm_unsorted_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_unsorted_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_unsorted_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4328 (class 0 OID 0)
-- Dependencies: 254
-- Name: amocrm_unsorted_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_unsorted_id_seq OWNED BY public.amocrm_unsorted.id;


--
-- TOC entry 256 (class 1259 OID 621142)
-- Name: amocrm_users_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.amocrm_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amocrm_users_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4329 (class 0 OID 0)
-- Dependencies: 256
-- Name: amocrm_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.amocrm_users_id_seq OWNED BY public.amocrm_users.id;


--
-- TOC entry 213 (class 1259 OID 620896)
-- Name: general_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.general_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.general_accounts_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4330 (class 0 OID 0)
-- Dependencies: 213
-- Name: general_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.general_accounts_id_seq OWNED BY public.general_accounts.id;


--
-- TOC entry 215 (class 1259 OID 620904)
-- Name: general_clientids_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.general_clientids_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.general_clientids_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4331 (class 0 OID 0)
-- Dependencies: 215
-- Name: general_clientids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.general_clientids_id_seq OWNED BY public.general_clientids.id;


--
-- TOC entry 225 (class 1259 OID 620949)
-- Name: general_costs_facts_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.general_costs_facts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.general_costs_facts_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4332 (class 0 OID 0)
-- Dependencies: 225
-- Name: general_costs_facts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.general_costs_facts_id_seq OWNED BY public.general_costs_facts.id;


--
-- TOC entry 217 (class 1259 OID 620912)
-- Name: general_dates_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.general_dates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.general_dates_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4333 (class 0 OID 0)
-- Dependencies: 217
-- Name: general_dates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.general_dates_id_seq OWNED BY public.general_dates.id;


--
-- TOC entry 219 (class 1259 OID 620923)
-- Name: general_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.general_locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.general_locations_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4334 (class 0 OID 0)
-- Dependencies: 219
-- Name: general_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.general_locations_id_seq OWNED BY public.general_locations.id;


--
-- TOC entry 221 (class 1259 OID 620931)
-- Name: general_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.general_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.general_sites_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4335 (class 0 OID 0)
-- Dependencies: 221
-- Name: general_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.general_sites_id_seq OWNED BY public.general_sites.id;


--
-- TOC entry 223 (class 1259 OID 620939)
-- Name: general_traffic_id_seq; Type: SEQUENCE; Schema: public; Owner: owner-gycqvgb
--

CREATE SEQUENCE public.general_traffic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.general_traffic_id_seq OWNER TO "owner-gycqvgb";

--
-- TOC entry 4336 (class 0 OID 0)
-- Dependencies: 223
-- Name: general_traffic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: owner-gycqvgb
--

ALTER SEQUENCE public.general_traffic_id_seq OWNED BY public.general_traffic.id;


--
-- TOC entry 3616 (class 2604 OID 621036)
-- Name: amocrm_calls id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_calls ALTER COLUMN id SET DEFAULT nextval('public.amocrm_calls_id_seq'::regclass);


--
-- TOC entry 3628 (class 2604 OID 621155)
-- Name: amocrm_calls_facts id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_calls_facts ALTER COLUMN id SET DEFAULT nextval('public.amocrm_calls_facts_id_seq'::regclass);


--
-- TOC entry 3617 (class 2604 OID 621047)
-- Name: amocrm_companies id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies ALTER COLUMN id SET DEFAULT nextval('public.amocrm_companies_id_seq'::regclass);


--
-- TOC entry 3629 (class 2604 OID 621200)
-- Name: amocrm_companies_attributes id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies_attributes ALTER COLUMN id SET DEFAULT nextval('public.amocrm_companies_attributes_id_seq'::regclass);


--
-- TOC entry 3630 (class 2604 OID 621216)
-- Name: amocrm_companies_events id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies_events ALTER COLUMN id SET DEFAULT nextval('public.amocrm_companies_events_id_seq'::regclass);


--
-- TOC entry 3631 (class 2604 OID 621234)
-- Name: amocrm_companies_facts id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies_facts ALTER COLUMN id SET DEFAULT nextval('public.amocrm_companies_facts_id_seq'::regclass);


--
-- TOC entry 3632 (class 2604 OID 621259)
-- Name: amocrm_companies_notes id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies_notes ALTER COLUMN id SET DEFAULT nextval('public.amocrm_companies_notes_id_seq'::regclass);


--
-- TOC entry 3633 (class 2604 OID 621277)
-- Name: amocrm_companies_tags id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies_tags ALTER COLUMN id SET DEFAULT nextval('public.amocrm_companies_tags_id_seq'::regclass);


--
-- TOC entry 3618 (class 2604 OID 621058)
-- Name: amocrm_contacts id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts ALTER COLUMN id SET DEFAULT nextval('public.amocrm_contacts_id_seq'::regclass);


--
-- TOC entry 3634 (class 2604 OID 621291)
-- Name: amocrm_contacts_attributes id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts_attributes ALTER COLUMN id SET DEFAULT nextval('public.amocrm_contacts_attributes_id_seq'::regclass);


--
-- TOC entry 3635 (class 2604 OID 621307)
-- Name: amocrm_contacts_events id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts_events ALTER COLUMN id SET DEFAULT nextval('public.amocrm_contacts_events_id_seq'::regclass);


--
-- TOC entry 3636 (class 2604 OID 621325)
-- Name: amocrm_contacts_facts id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts_facts ALTER COLUMN id SET DEFAULT nextval('public.amocrm_contacts_facts_id_seq'::regclass);


--
-- TOC entry 3637 (class 2604 OID 621355)
-- Name: amocrm_contacts_notes id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts_notes ALTER COLUMN id SET DEFAULT nextval('public.amocrm_contacts_notes_id_seq'::regclass);


--
-- TOC entry 3638 (class 2604 OID 621373)
-- Name: amocrm_contacts_tags id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts_tags ALTER COLUMN id SET DEFAULT nextval('public.amocrm_contacts_tags_id_seq'::regclass);


--
-- TOC entry 3619 (class 2604 OID 621069)
-- Name: amocrm_customers id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers ALTER COLUMN id SET DEFAULT nextval('public.amocrm_customers_id_seq'::regclass);


--
-- TOC entry 3639 (class 2604 OID 621387)
-- Name: amocrm_customers_attributes id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_attributes ALTER COLUMN id SET DEFAULT nextval('public.amocrm_customers_attributes_id_seq'::regclass);


--
-- TOC entry 3640 (class 2604 OID 621403)
-- Name: amocrm_customers_elements_facts id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_elements_facts ALTER COLUMN id SET DEFAULT nextval('public.amocrm_customers_elements_facts_id_seq'::regclass);


--
-- TOC entry 3641 (class 2604 OID 621448)
-- Name: amocrm_customers_facts id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_facts ALTER COLUMN id SET DEFAULT nextval('public.amocrm_customers_facts_id_seq'::regclass);


--
-- TOC entry 3642 (class 2604 OID 621488)
-- Name: amocrm_customers_notes id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_notes ALTER COLUMN id SET DEFAULT nextval('public.amocrm_customers_notes_id_seq'::regclass);


--
-- TOC entry 3643 (class 2604 OID 621505)
-- Name: amocrm_customers_tags id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_tags ALTER COLUMN id SET DEFAULT nextval('public.amocrm_customers_tags_id_seq'::regclass);


--
-- TOC entry 3620 (class 2604 OID 621078)
-- Name: amocrm_elements id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_elements ALTER COLUMN id SET DEFAULT nextval('public.amocrm_elements_id_seq'::regclass);


--
-- TOC entry 3644 (class 2604 OID 621519)
-- Name: amocrm_elements_attributes id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_elements_attributes ALTER COLUMN id SET DEFAULT nextval('public.amocrm_elements_attributes_id_seq'::regclass);


--
-- TOC entry 3645 (class 2604 OID 621535)
-- Name: amocrm_elements_products id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_elements_products ALTER COLUMN id SET DEFAULT nextval('public.amocrm_elements_products_id_seq'::regclass);


--
-- TOC entry 3621 (class 2604 OID 621087)
-- Name: amocrm_leads id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads ALTER COLUMN id SET DEFAULT nextval('public.amocrm_leads_id_seq'::regclass);


--
-- TOC entry 3646 (class 2604 OID 621549)
-- Name: amocrm_leads_attributes id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_attributes ALTER COLUMN id SET DEFAULT nextval('public.amocrm_leads_attributes_id_seq'::regclass);


--
-- TOC entry 3647 (class 2604 OID 621565)
-- Name: amocrm_leads_elements_facts id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_elements_facts ALTER COLUMN id SET DEFAULT nextval('public.amocrm_leads_elements_facts_id_seq'::regclass);


--
-- TOC entry 3648 (class 2604 OID 621615)
-- Name: amocrm_leads_events id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_events ALTER COLUMN id SET DEFAULT nextval('public.amocrm_leads_events_id_seq'::regclass);


--
-- TOC entry 3649 (class 2604 OID 621633)
-- Name: amocrm_leads_facts id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_facts ALTER COLUMN id SET DEFAULT nextval('public.amocrm_leads_facts_id_seq'::regclass);


--
-- TOC entry 3650 (class 2604 OID 621690)
-- Name: amocrm_leads_notes id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_notes ALTER COLUMN id SET DEFAULT nextval('public.amocrm_leads_notes_id_seq'::regclass);


--
-- TOC entry 3651 (class 2604 OID 621708)
-- Name: amocrm_leads_tags id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_tags ALTER COLUMN id SET DEFAULT nextval('public.amocrm_leads_tags_id_seq'::regclass);


--
-- TOC entry 3622 (class 2604 OID 621098)
-- Name: amocrm_pipelines id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_pipelines ALTER COLUMN id SET DEFAULT nextval('public.amocrm_pipelines_id_seq'::regclass);


--
-- TOC entry 3623 (class 2604 OID 621107)
-- Name: amocrm_statuses id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_statuses ALTER COLUMN id SET DEFAULT nextval('public.amocrm_statuses_id_seq'::regclass);


--
-- TOC entry 3624 (class 2604 OID 621116)
-- Name: amocrm_tasks id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_tasks ALTER COLUMN id SET DEFAULT nextval('public.amocrm_tasks_id_seq'::regclass);


--
-- TOC entry 3652 (class 2604 OID 621722)
-- Name: amocrm_tasks_events id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_tasks_events ALTER COLUMN id SET DEFAULT nextval('public.amocrm_tasks_events_id_seq'::regclass);


--
-- TOC entry 3653 (class 2604 OID 621740)
-- Name: amocrm_tasks_facts id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_tasks_facts ALTER COLUMN id SET DEFAULT nextval('public.amocrm_tasks_facts_id_seq'::regclass);


--
-- TOC entry 3654 (class 2604 OID 621795)
-- Name: amocrm_tasks_notes id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_tasks_notes ALTER COLUMN id SET DEFAULT nextval('public.amocrm_tasks_notes_id_seq'::regclass);


--
-- TOC entry 3625 (class 2604 OID 621127)
-- Name: amocrm_transactions id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_transactions ALTER COLUMN id SET DEFAULT nextval('public.amocrm_transactions_id_seq'::regclass);


--
-- TOC entry 3655 (class 2604 OID 621813)
-- Name: amocrm_transactions_facts id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_transactions_facts ALTER COLUMN id SET DEFAULT nextval('public.amocrm_transactions_facts_id_seq'::regclass);


--
-- TOC entry 3626 (class 2604 OID 621136)
-- Name: amocrm_unsorted id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_unsorted ALTER COLUMN id SET DEFAULT nextval('public.amocrm_unsorted_id_seq'::regclass);


--
-- TOC entry 3627 (class 2604 OID 621146)
-- Name: amocrm_users id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_users ALTER COLUMN id SET DEFAULT nextval('public.amocrm_users_id_seq'::regclass);


--
-- TOC entry 3608 (class 2604 OID 620900)
-- Name: general_accounts id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.general_accounts ALTER COLUMN id SET DEFAULT nextval('public.general_accounts_id_seq'::regclass);


--
-- TOC entry 3609 (class 2604 OID 620908)
-- Name: general_clientids id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.general_clientids ALTER COLUMN id SET DEFAULT nextval('public.general_clientids_id_seq'::regclass);


--
-- TOC entry 3615 (class 2604 OID 620953)
-- Name: general_costs_facts id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.general_costs_facts ALTER COLUMN id SET DEFAULT nextval('public.general_costs_facts_id_seq'::regclass);


--
-- TOC entry 3610 (class 2604 OID 620916)
-- Name: general_dates id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.general_dates ALTER COLUMN id SET DEFAULT nextval('public.general_dates_id_seq'::regclass);


--
-- TOC entry 3612 (class 2604 OID 620927)
-- Name: general_locations id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.general_locations ALTER COLUMN id SET DEFAULT nextval('public.general_locations_id_seq'::regclass);


--
-- TOC entry 3613 (class 2604 OID 620935)
-- Name: general_sites id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.general_sites ALTER COLUMN id SET DEFAULT nextval('public.general_sites_id_seq'::regclass);


--
-- TOC entry 3614 (class 2604 OID 620943)
-- Name: general_traffic id; Type: DEFAULT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.general_traffic ALTER COLUMN id SET DEFAULT nextval('public.general_traffic_id_seq'::regclass);


--
-- TOC entry 4141 (class 0 OID 620891)
-- Dependencies: 212
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.alembic_version (version_num) FROM stdin;
7e53eeda81fe
72c232ff8bb1
\.


--
-- TOC entry 4157 (class 0 OID 621033)
-- Dependencies: 235
-- Data for Name: amocrm_calls; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_calls (id, account_id, note_id, call_id, call_type, call_status, call_result, phone, link) FROM stdin;
1	54236	60610217	1701502738.1508915	Входящий	Разговор состоялся	\N	74951301255	https://sipuni.com/api/crm/record?id=1701502738.1508915&hash=b720ec7eb8a092ad1760b91b3bf012d9&user=056251
2	54236	60759457	1701695753.1558544	Входящий	\N	Пропущенный звонок	79090751195	https://sipuni.com/api/crm/record?id=1701695753.1558544&hash=b215e142455247efea6d6207bd9224a7&user=056251
3	54236	60767339	1701700037.1559006	Входящий	\N	Пропущенный звонок	79692100664	https://sipuni.com/api/crm/record?id=1701700037.1559006&hash=4c203d1724128cdabcb88b2c2c565a3c&user=056251
4	54236	60774327	1701705991.1559507	Входящий	Разговор состоялся	\N	79673773098	https://sipuni.com/api/crm/record?id=1701705991.1559507&hash=dbd0580da5a528e53107ed3ab08fe7b7&user=056251
5	54236	60775569	1701706911.1559548	Входящий	Разговор состоялся	\N	79090794024	https://sipuni.com/api/crm/record?id=1701706911.1559548&hash=ae78d1374f71036c36d54196620e207b&user=056251
6	54236	60846491	1701776528.1616988	Входящий	\N	Пропущенный звонок	79651630839	https://sipuni.com/api/crm/record?id=1701776528.1616988&hash=0fd4ed024e2b4dd4555069cdb64e4700&user=056251
7	54236	60931277	1701854873.1660084	Входящий	\N	Пропущенный звонок	79282799328	https://sipuni.com/api/crm/record?id=1701854873.1660084&hash=e8b9894e606ccabd6959e213c98ff651&user=056251
8	54236	61128251	1701965546.1678771	Входящий	\N	Пропущенный звонок	79993966902	https://sipuni.com/api/crm/record?id=1701965546.1678771&hash=d2015ed46cc69f50d911e2352ec54aa6&user=056251
9	54236	61209565	1702030059.1729314	Входящий	\N	Пропущенный звонок	79068661806	https://sipuni.com/api/crm/record?id=1702030059.1729314&hash=ad190dadcd7f0d9fe2dae1fffc5abab4&user=056251
10	54236	61222283	1702035168.1738989	Входящий	Разговор состоялся	\N	79068680103	https://sipuni.com/api/crm/record?id=1702035168.1738989&hash=207be38f2a988056acb807c06c00b8f8&user=056251
11	54236	61366861	1702275501.1756750	Входящий	\N	Пропущенный звонок	79391111249	https://sipuni.com/api/crm/record?id=1702275501.1756750&hash=8c8be8f4c82c4fe222ebae15a8d25ebc&user=056251
12	54236	61408737	1702292486.1799734	Входящий	Разговор состоялся	\N	79090782162	https://sipuni.com/api/crm/record?id=1702292486.1799734&hash=264b1ad22482560c25023d07c53b4978&user=056251
13	54236	61422955	1702297713.1800526	Входящий	Разговор состоялся	\N	79162322524	https://sipuni.com/api/crm/record?id=1702297713.1800526&hash=05d7306b3097baa10ff942c7e6b4e581&user=056251
14	54236	61427533	1702300025.1800853	Входящий	Разговор состоялся	\N	79655403744	https://sipuni.com/api/crm/record?id=1702300025.1800853&hash=72ddc6c58791b921e8803607057123ce&user=056251
15	54236	61430671	1702301194.1801062	Исходящий	Разговор состоялся	\N	not available	https://sipuni.com/api/crm/record?id=1702301194.1801062&hash=cda27889db7c54ddaa04199110c440b4&user=056251
16	54236	61431095	1702301338.1801096	Исходящий	Не дозвонился	Не дозвонились	not available	\N
17	54236	61452333	1702312039.1801971	Входящий	\N	Пропущенный звонок	79030921448	https://sipuni.com/api/crm/record?id=1702312039.1801971&hash=22437ccc1ad2bf46666120ca5c1c76c8&user=056251
18	54236	61524529	1702380463.1845073	Исходящий	Разговор состоялся	\N	not available	https://sipuni.com/api/crm/record?id=1702380463.1845073&hash=3838a41ce6cc5270f3476fba3dd65a23&user=056251
19	54236	61551279	1702389829.1846254	Входящий	Разговор состоялся	\N	79316450839	https://sipuni.com/api/crm/record?id=1702389829.1846254&hash=3b45080d5ab960a6b5f425d049530044&user=056251
20	54236	61551703	1702389970.1846263	Исходящий	Не дозвонился	Не дозвонились	not available	\N
21	54236	61553383	1702390002.1846269	Исходящий	Разговор состоялся	\N	not available	https://sipuni.com/api/crm/record?id=1702390002.1846269&hash=ccb8773703242f17a050a67c3ac8fe03&user=056251
22	54236	61905167	1702634433.1922308	Входящий	Разговор состоялся	\N	79068661358	https://sipuni.com/api/crm/record?id=1702634433.1922308&hash=229481b0f3336803dbedbccdffc4696f&user=056251
23	54236	61924429	1702640510.1940482	Входящий	Разговор состоялся	\N	79068665600	https://sipuni.com/api/crm/record?id=1702640510.1940482&hash=d0da721dd58e3afb27c1312b204069e4&user=056251
24	54236	62184902	1702885686.1969121	Входящий	Разговор состоялся	\N	79030799740	https://sipuni.com/api/crm/record?id=1702885686.1969121&hash=cc5fbc14b989a58215b82726d07d0777&user=056251
25	54236	62215462	1702897323.1988917	Входящий	Разговор состоялся	\N	79624619460	https://sipuni.com/api/crm/record?id=1702897323.1988917&hash=40df74a3e4b39a3394d5a7500cad78e8&user=056251
26	54236	62219748	1702898625.1989156	Входящий	\N	Пропущенный звонок	79052150669	https://sipuni.com/api/crm/record?id=1702898625.1989156&hash=8baed47f4401ab12c0d290538d8a67b9&user=056251
27	54236	62245315	1702906443.1998210	Входящий	Разговор состоялся	\N	79617960628	https://sipuni.com/api/crm/record?id=1702906443.1998210&hash=53cbd8ff9f5f7535d33b673bcdce6d4b&user=056251
28	54236	62341093	1702974682.2029507	Входящий	\N	Пропущенный звонок	79326980251	https://sipuni.com/api/crm/record?id=1702974682.2029507&hash=feecd94d0c65e61a80add1bf39d22f48&user=056251
29	54236	62341261	1702974719.2029655	Входящий	\N	Пропущенный звонок	79326980251	https://sipuni.com/api/crm/record?id=1702974719.2029655&hash=8ce88725d1567363d9d2a4e616884a50&user=056251
30	54236	62341331	1702974739.2029698	Входящий	Перезвонить позже	Пропущенный звонок	79326980251	\N
31	54236	62369381	1702983435.2038336	Входящий	\N	Пропущенный звонок	79774912420	https://sipuni.com/api/crm/record?id=1702983435.2038336&hash=5169ebf61c5b42bdced80c87b830ad68&user=056251
32	54236	62493613	1703060943.2067227	Входящий	\N	Пропущенный звонок	79676970342	https://sipuni.com/api/crm/record?id=1703060943.2067227&hash=8c7012aef60a0cf845b73cea5a069dea&user=056251
33	54236	62511207	1703066981.2076590	Исходящий	Разговор состоялся	\N	79676970342	https://sipuni.com/api/crm/record?id=1703066981.2076590&hash=4e84689a8a30edb5b427a5d59bee6b34&user=056251
34	54236	62511387	1703067004.2076615	Исходящий	Разговор состоялся	\N	79774912420	https://sipuni.com/api/crm/record?id=1703067004.2076615&hash=fae613860182e5ee43c70f8ba09e573d&user=056251
\.


--
-- TOC entry 4181 (class 0 OID 621152)
-- Dependencies: 259
-- Data for Name: amocrm_calls_facts; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_calls_facts (id, account_id, dates_id, users_id, calls_id, contacts_id, companies_id, leads_id, customers_id, duration) FROM stdin;
1	54236	1	2	1	20	1	1	1	100
2	54236	2	2	2	21	1	1	1	18
3	54236	3	2	3	22	1	1	1	14
4	54236	4	2	4	23	1	1	1	32
5	54236	5	2	5	24	1	1	1	19
6	54236	6	2	6	25	1	1	1	23
7	54236	7	2	7	27	1	1	1	24
8	54236	8	2	8	29	1	1	1	15
9	54236	120	2	9	30	1	1	1	18
10	54236	121	2	10	31	1	1	1	26
11	54236	142	2	11	36	1	1	1	28
12	54236	143	2	12	37	1	1	1	19
13	54236	144	2	13	38	1	1	1	169
14	54236	145	2	14	39	1	1	1	18
15	54236	146	2	15	2	1	1	1	77
16	54236	147	2	16	26	1	1	1	0
17	54236	148	2	17	41	1	1	1	23
18	54236	171	2	18	2	1	1	1	574
19	54236	172	2	19	45	1	1	1	26
20	54236	173	2	20	43	1	1	1	0
21	54236	174	2	21	44	1	1	1	348
22	54236	211	2	22	46	1	1	1	23
23	54236	212	2	23	47	1	1	1	24
24	54236	225	2	24	54	1	1	1	21
25	54236	226	2	25	55	1	1	1	57
26	54236	227	2	26	56	1	1	1	20
27	54236	228	2	27	57	1	1	1	21
28	54236	254	2	28	60	1	1	1	32
29	54236	255	2	29	60	1	1	1	15
30	54236	256	2	30	60	1	1	1	0
31	54236	257	2	31	61	1	1	1	31
32	54236	270	2	34	61	1	1	1	56
33	54236	268	2	32	62	1	1	1	19
34	54236	269	2	33	62	1	1	1	14
\.


--
-- TOC entry 4159 (class 0 OID 621044)
-- Dependencies: 237
-- Data for Name: amocrm_companies; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_companies (id, account_id, company_id, name, phone, email, site, is_deleted) FROM stdin;
1	54236	0	\N	\N	\N	\N	f
\.


--
-- TOC entry 4183 (class 0 OID 621197)
-- Dependencies: 261
-- Data for Name: amocrm_companies_attributes; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_companies_attributes (id, account_id, companies_id, attribute_id, name, value) FROM stdin;
\.


--
-- TOC entry 4185 (class 0 OID 621213)
-- Dependencies: 263
-- Data for Name: amocrm_companies_events; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_companies_events (id, account_id, companies_id, event_id, type, created_by, created_at, value_after, value_before) FROM stdin;
\.


--
-- TOC entry 4187 (class 0 OID 621231)
-- Dependencies: 265
-- Data for Name: amocrm_companies_facts; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_companies_facts (id, account_id, users_id, companies_id, registered_id) FROM stdin;
\.


--
-- TOC entry 4189 (class 0 OID 621256)
-- Dependencies: 267
-- Data for Name: amocrm_companies_notes; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_companies_notes (id, account_id, companies_id, creator_id, responsible_id, note_id, note_type, note_type_id, created_at, updated_at, text, params) FROM stdin;
\.


--
-- TOC entry 4191 (class 0 OID 621274)
-- Dependencies: 269
-- Data for Name: amocrm_companies_tags; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_companies_tags (id, account_id, companies_id, tag_id, name) FROM stdin;
\.


--
-- TOC entry 4161 (class 0 OID 621055)
-- Dependencies: 239
-- Data for Name: amocrm_contacts; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_contacts (id, account_id, contact_id, name, company, post, phone, email, request_id, is_deleted) FROM stdin;
1	54236	0	\N	\N	\N	\N	\N	\N	f
3	54236	19363141	Шевченко Милана ученик	\N	\N	\N	\N	\N	f
4	54236	19906033	Жовтая Юлия Сергеевна	\N	\N	79175904068	julka-anis@yandex.ru	\N	f
5	54236	20198233	Дарья Грициенко	\N	\N	79778131566	\N	\N	f
6	54236	20235497	Надежда мама 79269032830	\N	\N	79269032830	\N	\N	f
7	54236	20910449	Евгения Колеватых	\N	\N	79168105616	koleva.evg@gmail.com	\N	f
8	54236	23423975	Антропова Татьяна Юрьевна	\N	\N	79264302704	motata@bk.ru	\N	f
9	54236	23424023	Винтоняк Татьяна Сергеевна	\N	\N	79031242206	gidera.86@mail.ru	\N	f
10	54236	23424103	Ольга Гаврютченкова	\N	\N	79646354444	gavryutchenkova@mail.ru	\N	f
11	54236	23424155	Гиря Иван Александрович	\N	\N	79262457892	ivan.girya@gmail.com	\N	f
12	54236	23424489	Ивлев Владимир Леонидович	\N	\N	79166734107	ivlev.vl@gmail.com	\N	f
13	54236	23424509	Исаева Марина Юрьевна	\N	\N	79166789264	maris_07@mail.ru	\N	f
14	54236	23424545	Кириллова Ирина Александровна	\N	\N	79859930894	iriska101@yandex.ru	\N	f
15	54236	23424569	Кириллова Ирина Александровна	\N	\N	79859930894	iriska101@yandex.ru	\N	f
16	54236	23424613	Цыганкова Анна Павловна	\N	\N	79096925858	Cigankova.a@yandex.ru	\N	f
17	54236	23424687	Алина Кулеева	\N	\N	79629127107	Alina_zn@mail.ru	\N	f
18	54236	23425305	Слободская Галина Петровна	\N	\N	79161363015	gpetrslob@gmail.com	\N	f
19	54236	23446217	ева	\N	\N	79067576053	\N	\N	f
20	54236	23451421	Контакт 74951301255	\N	\N	74951301255	\N	\N	f
21	54236	23487419	Контакт 79090751195	\N	\N	79090751195	\N	\N	f
22	54236	23489271	Контакт 79692100664	\N	\N	79692100664	\N	\N	f
23	54236	23492857	Контакт 79673773098	\N	\N	79673773098	\N	\N	f
24	54236	23493301	Контакт 79090794024	\N	\N	79090794024	\N	\N	f
25	54236	23506241	Контакт 79651630839	\N	\N	79651630839	\N	\N	f
27	54236	23523359	Контакт 79282799328	\N	\N	79282799328	\N	\N	f
28	54236	23528601	NP	\N	\N	79222450057	\N	\N	f
29	54236	23559435	Контакт 79993966902	\N	\N	79993966902	\N	\N	f
30	54236	23572995	Контакт 79068661806	\N	\N	79068661806	\N	\N	f
31	54236	23574913	Контакт 79068680103	\N	\N	79068680103	\N	\N	f
32	54236	20884983	Данилина Оксана мама 79104122623	\N	\N	79104122623	brelliant@bk.ru	\N	f
33	54236	20885307	Данилин Саша ученик	\N	\N	\N	\N	\N	f
34	54236	20887557	Данилина Таисия ученик	\N	\N	\N	\N	\N	f
36	54236	23620023	Контакт 79391111249	\N	\N	79391111249	\N	\N	f
37	54236	23629301	Контакт 79090782162	\N	\N	79090782162	\N	\N	f
38	54236	23633373	Влад папа 79162322524	\N	\N	79162322524	\N	\N	f
39	54236	23634683	Контакт 79655403744	\N	\N	79655403744	\N	\N	f
40	54236	23635079	Федор ученик	\N	\N	\N	\N	\N	f
41	54236	23639317	Контакт 79030921448	\N	\N	79030921448	\N	\N	f
42	54236	3536037	Контакт 79166637854 Тест школа	\N	\N	79166637854	\N	\N	f
43	54236	19849487	Ева	\N	\N	79067576053	\N	\N	f
44	54236	23345405	Евгения	\N	\N	79295521822	\N	\N	f
45	54236	23675143	Контакт 79316450839	\N	\N	79316450839	\N	\N	f
2	54236	19272163	Прасковья	\N	\N	79262723696	2723696b@gmail.com	\N	f
26	54236	23507549	Артур ученик	\N	\N	\N	\N	\N	t
46	54236	23759759	Контакт 79068661358	\N	\N	79068661358	\N	\N	f
47	54236	23762931	Контакт 79068665600	\N	\N	79068665600	\N	\N	f
48	54236	23801832	Марина	\N	\N	79187065142	\N	\N	f
49	54236	23424113	Ольга Гаврютченкова	\N	\N	79646354444	gavryutchenkova@mail.ru	\N	f
50	54236	23424709	Меньшикова Елена Александровна	\N	\N	79774151480	Chygestranka@inbox.ru	\N	f
51	54236	23425027	Мизинова Ольга Михайловна	\N	\N	79057898729	Mizinov@bk.ru	\N	f
52	54236	23425403	Маркина Галина Владимировна	\N	\N	79265588880	alalmar@yandex.ru	\N	f
53	54236	23425417	Маркина Галина Владимировна	\N	\N	79265588880	alalmar@yandex.ru	\N	f
54	54236	23812508	Контакт 79030799740	\N	\N	79030799740	\N	\N	f
55	54236	23823476	Контакт 79624619460	\N	\N	79624619460	\N	\N	f
56	54236	23824716	Контакт 79052150669	\N	\N	79052150669	\N	\N	f
57	54236	23829691	Контакт 79617960628	\N	\N	79617960628	\N	\N	f
58	54236	23832811	Контакт Родителя	\N	\N	\N	\N	\N	f
59	54236	23832821	Контакт Ученика	\N	\N	\N	\N	\N	f
60	54236	23846769	Контакт 79326980251	\N	\N	79326980251	\N	\N	f
61	54236	23856667	Контакт 79774912420	\N	\N	79774912420	\N	\N	f
62	54236	23879737	Контакт 79676970342	\N	\N	79676970342	\N	\N	f
\.


--
-- TOC entry 4193 (class 0 OID 621288)
-- Dependencies: 271
-- Data for Name: amocrm_contacts_attributes; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_contacts_attributes (id, account_id, contacts_id, attribute_id, name, value) FROM stdin;
1	54236	19	64237	Телефон	79067576053
2	54236	20	64237	Телефон	74951301255
3	54236	7	64237	Телефон	79168105616
4	54236	7	64239	Email	koleva.evg@gmail.com
5	54236	21	64237	Телефон	79090751195
6	54236	22	64237	Телефон	79692100664
7	54236	23	64237	Телефон	79673773098
8	54236	24	64237	Телефон	79090794024
9	54236	25	64237	Телефон	79651630839
151	54236	60	64237	Телефон	79326980251
11	54236	27	64237	Телефон	79282799328
12	54236	28	64237	Телефон	79222450057
152	54236	61	64237	Телефон	79774912420
153	54236	59	630609	Ссылка на alfaCRM	https://excellentschool.s20.online/company/1/customer/view?id=357
154	54236	59	881409	CF_NAME_STUDENT	1
155	54236	62	64237	Телефон	79676970342
19	54236	5	64237	Телефон	79778131566
20	54236	6	64237	Телефон	79269032830
21	54236	8	64237	Телефон	79264302704
22	54236	8	64239	Email	motata@bk.ru
23	54236	9	64237	Телефон	79031242206
24	54236	9	64239	Email	gidera.86@mail.ru
27	54236	11	64237	Телефон	79262457892
28	54236	11	64239	Email	ivan.girya@gmail.com
29	54236	12	64237	Телефон	79166734107
30	54236	12	64239	Email	ivlev.vl@gmail.com
31	54236	13	64237	Телефон	79166789264
32	54236	13	64239	Email	maris_07@mail.ru
33	54236	14	64237	Телефон	79859930894
34	54236	14	64239	Email	iriska101@yandex.ru
35	54236	15	64237	Телефон	79859930894
36	54236	15	64239	Email	iriska101@yandex.ru
37	54236	16	64237	Телефон	79096925858
38	54236	16	64239	Email	Cigankova.a@yandex.ru
41	54236	18	64237	Телефон	79161363015
42	54236	18	64239	Email	gpetrslob@gmail.com
43	54236	3	630609	Ссылка на alfaCRM	https://excellentschool.s20.online/company/1/customer/view?id=273
44	54236	3	881409	CF_NAME_STUDENT	1
45	54236	29	64237	Телефон	79993966902
49	54236	30	64237	Телефон	79068661806
50	54236	31	64237	Телефон	79068680103
57	54236	33	630609	Ссылка на alfaCRM	https://excellentschool.s20.online/company/1/customer/view?id=329
58	54236	33	881409	CF_NAME_STUDENT	1
59	54236	34	630609	Ссылка на alfaCRM	https://excellentschool.s20.online/company/1/customer/view?id=323
60	54236	34	881409	CF_NAME_STUDENT	1
61	54236	32	64237	Телефон	79104122623
62	54236	32	64239	Email	brelliant@bk.ru
80	54236	36	64237	Телефон	79391111249
81	54236	37	64237	Телефон	79090782162
82	54236	39	64237	Телефон	79655403744
83	54236	38	64237	Телефон	79162322524
84	54236	41	64237	Телефон	79030921448
91	54236	26	881409	CF_NAME_STUDENT	1
92	54236	45	64237	Телефон	79316450839
95	54236	42	64237	Телефон	79166637854
96	54236	43	64237	Телефон	79067576053
99	54236	44	64237	Телефон	79295521822
101	54236	2	64237	Телефон	79262723696
102	54236	2	64239	Email	2723696b@gmail.com
103	54236	4	64237	Телефон	79175904068
104	54236	4	64239	Email	julka-anis@yandex.ru
107	54236	46	64237	Телефон	79068661358
108	54236	47	64237	Телефон	79068665600
110	54236	48	64237	Телефон	79187065142
129	54236	54	64237	Телефон	79030799740
130	54236	55	64237	Телефон	79624619460
131	54236	56	64237	Телефон	79052150669
132	54236	57	64237	Телефон	79617960628
137	54236	10	64237	Телефон	79646354444
138	54236	10	64239	Email	gavryutchenkova@mail.ru
139	54236	49	64237	Телефон	79646354444
140	54236	49	64239	Email	gavryutchenkova@mail.ru
141	54236	17	64237	Телефон	79629127107
142	54236	17	64239	Email	Alina_zn@mail.ru
143	54236	50	64237	Телефон	79774151480
144	54236	50	64239	Email	Chygestranka@inbox.ru
145	54236	51	64237	Телефон	79057898729
146	54236	51	64239	Email	Mizinov@bk.ru
147	54236	52	64237	Телефон	79265588880
148	54236	52	64239	Email	alalmar@yandex.ru
149	54236	53	64237	Телефон	79265588880
150	54236	53	64239	Email	alalmar@yandex.ru
\.


--
-- TOC entry 4195 (class 0 OID 621304)
-- Dependencies: 273
-- Data for Name: amocrm_contacts_events; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_contacts_events (id, account_id, contacts_id, event_id, type, created_by, created_at, value_after, value_before) FROM stdin;
\.


--
-- TOC entry 4197 (class 0 OID 621322)
-- Dependencies: 275
-- Data for Name: amocrm_contacts_facts; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_contacts_facts (id, account_id, contacts_id, companies_id, users_id, registered_id) FROM stdin;
1	54236	19	1	2	94
2	54236	20	1	2	95
3	54236	7	1	2	107
4	54236	21	1	2	96
5	54236	22	1	2	97
6	54236	23	1	2	98
7	54236	24	1	2	99
8	54236	25	1	2	100
9	54236	26	1	2	101
10	54236	27	1	2	102
11	54236	28	1	2	119
12	54236	3	1	2	105
13	54236	29	1	2	104
14	54236	2	1	2	85
15	54236	4	1	2	106
16	54236	5	1	2	87
17	54236	6	1	2	88
18	54236	8	1	2	108
19	54236	9	1	2	109
20	54236	10	1	2	110
21	54236	11	1	2	111
22	54236	12	1	2	112
23	54236	13	1	2	113
24	54236	14	1	2	114
25	54236	15	1	2	115
26	54236	16	1	2	116
27	54236	17	1	2	117
28	54236	18	1	2	118
29	54236	30	1	2	128
30	54236	31	1	2	129
31	54236	33	1	2	140
32	54236	34	1	2	141
33	54236	32	1	2	134
35	54236	36	1	2	164
36	54236	37	1	2	165
37	54236	39	1	2	167
38	54236	38	1	2	166
39	54236	40	1	2	170
40	54236	41	1	2	168
41	54236	45	1	2	187
42	54236	42	1	2	185
43	54236	43	1	2	186
44	54236	44	1	2	184
45	54236	46	1	2	219
46	54236	47	1	2	220
47	54236	48	1	2	224
48	54236	54	1	2	243
49	54236	55	1	2	244
50	54236	56	1	2	245
51	54236	57	1	2	246
52	54236	58	1	2	247
53	54236	59	1	2	253
54	54236	49	1	2	248
55	54236	50	1	2	249
56	54236	51	1	2	250
57	54236	52	1	2	251
58	54236	53	1	2	252
59	54236	60	1	2	266
60	54236	61	1	2	267
61	54236	62	1	2	275
\.


--
-- TOC entry 4199 (class 0 OID 621352)
-- Dependencies: 277
-- Data for Name: amocrm_contacts_notes; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_contacts_notes (id, account_id, contacts_id, creator_id, responsible_id, note_id, note_type, note_type_id, created_at, updated_at, text, params) FROM stdin;
\.


--
-- TOC entry 4201 (class 0 OID 621370)
-- Dependencies: 279
-- Data for Name: amocrm_contacts_tags; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_contacts_tags (id, account_id, contacts_id, tag_id, name) FROM stdin;
2	54236	5	37863	Яндекс Бизнес
3	54236	5	37865	Заявка с сайта
11	54236	43	37865	Заявка с сайта
12	54236	44	37865	Заявка с сайта
13	54236	2	37865	Заявка с сайта
\.


--
-- TOC entry 4163 (class 0 OID 621066)
-- Dependencies: 241
-- Data for Name: amocrm_customers; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_customers (id, account_id, customer_id, name, period, period_order) FROM stdin;
1	54236	0	\N	\N	\N
\.


--
-- TOC entry 4203 (class 0 OID 621384)
-- Dependencies: 281
-- Data for Name: amocrm_customers_attributes; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_customers_attributes (id, account_id, customers_id, attribute_id, name, value) FROM stdin;
\.


--
-- TOC entry 4205 (class 0 OID 621400)
-- Dependencies: 283
-- Data for Name: amocrm_customers_elements_facts; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_customers_elements_facts (id, account_id, elements_id, customers_id, created_id, expected_id, companies_id, contacts_id, users_id) FROM stdin;
\.


--
-- TOC entry 4207 (class 0 OID 621445)
-- Dependencies: 285
-- Data for Name: amocrm_customers_facts; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_customers_facts (id, account_id, customers_id, created_id, expected_id, companies_id, contacts_id, users_id, periodicity, purchases, average_check, next_price, ltv) FROM stdin;
\.


--
-- TOC entry 4209 (class 0 OID 621485)
-- Dependencies: 287
-- Data for Name: amocrm_customers_notes; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_customers_notes (id, account_id, customers_id, creator_id, responsible_id, note_id, note_type, note_type_id, created_at, updated_at, text, params) FROM stdin;
\.


--
-- TOC entry 4211 (class 0 OID 621502)
-- Dependencies: 289
-- Data for Name: amocrm_customers_tags; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_customers_tags (id, account_id, customers_id, tag_id, name) FROM stdin;
\.


--
-- TOC entry 4165 (class 0 OID 621075)
-- Dependencies: 243
-- Data for Name: amocrm_elements; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_elements (id, account_id, element_id, name, catalog, catalog_order) FROM stdin;
1	54236	2071977	Английский для детей 3х лет Panda 1	Товары	0
2	54236	2071979	Английский для детей 4-5 лет Ping&Pong 0	Товары	0
3	54236	2071981	Английский для детей 5-6 лет Ping&Pong 1	Товары	0
4	54236	2071983	Английский для детей 6-7 лет Ping&Pong 2	Товары	0
5	54236	2071985	Английский для детей 6-7 лет Fun with Little Fizz	Товары	0
6	54236	2071987	Английский для детей 7-8 лет Fun with Fizz 1 1-2 кл	Товары	0
7	54236	2071989	Английский для детей 8-9 лет Fun with Fizz 2 Pre-1	Товары	0
8	54236	2071991	Английский для детей 9-10 лет Fun with Fizz 3 A1	Товары	0
9	54236	2071993	Английский для детей 11-12 лет Amazing English 1 A1	Товары	0
10	54236	2071995	Английский для детей 12-13 лет Amazing English 2  А2	Товары	0
11	54236	2071997	Английский для детей 13-14 лет Amazing English 3 А2+	Товары	0
12	54236	2071999	Английский для детей 11-12 лет English Download Pre-A1	Товары	0
13	54236	2072001	Английский для детей 12-13 лет English Download А1	Товары	0
14	54236	2072003	Английский для детей 13-14 лет English Download А2	Товары	0
15	54236	2072005	Английский для детей 14-15 лет English Download B1	Товары	0
16	54236	2072007	Английский для детей 15-16 лет English Download B1+	Товары	0
17	54236	2072009	Английский для детей 16-17 лет English Download B2	Товары	0
18	54236	2072011	Английский для детей 17-18 лет English Download C1	Товары	0
19	54236	2072013	Английский Language Hub Beginner A1	Товары	0
20	54236	2072015	Английский Language Hub Elementary A2	Товары	0
21	54236	2072017	Английский Language Hub Pre-Intermediate B1	Товары	0
22	54236	2072019	Английский Language Hub Intermediate B1+	Товары	0
23	54236	2072021	Английский Language Hub Upper Intermediate B2	Товары	0
24	54236	2072023	Английский Language Hub Advanced C1	Товары	0
25	54236	2072025	ОГЭ по Английскому языку1 9кл	Товары	0
26	54236	2072027	ЕГЭ по Английскому языку1 11кл	Товары	0
27	54236	2072029	ЕГЭ по Английскому языку2 11кл	Товары	0
28	54236	2072031	ЕГЭ по Русскому языку 11 кл	Товары	0
29	54236	2117041	Английский для детей 16-17 лет English Download B2	Товары	0
30	54236	2117043	Английский для детей 5-6 лет Ping&Pong 1	Товары	0
31	54236	2117045	Английский для детей 7-8 лет Fun with Fizz 1 1-2 кл	Товары	0
32	54236	2118491	Английский для детей 8-9 лет Fun with Fizz 2 Pre-1	Товары	0
33	54236	2118493	Английский для детей 12-13 лет English Download А1	Товары	0
34	54236	2118495	Английский для детей 16-17 лет English Download B2	Товары	0
35	54236	2118507	Английский для детей 6-7 лет Fun with Little Fizz	Товары	0
\.


--
-- TOC entry 4213 (class 0 OID 621516)
-- Dependencies: 291
-- Data for Name: amocrm_elements_attributes; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_elements_attributes (id, account_id, elements_id, attribute_id, name, value) FROM stdin;
\.


--
-- TOC entry 4215 (class 0 OID 621532)
-- Dependencies: 293
-- Data for Name: amocrm_elements_products; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_elements_products (id, account_id, elements_id, sku, description, unit_price, quantity, unit_type, discount_type, discount_value, vat_rate_id, external_uid) FROM stdin;
\.


--
-- TOC entry 4167 (class 0 OID 621084)
-- Dependencies: 245
-- Data for Name: amocrm_leads; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_leads (id, account_id, lead_id, name, pipeline, pipeline_id, status, status_id, status_order, request_id, loss_reason, loss_reason_id, is_deleted) FROM stdin;
1	54236	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	f
4	54236	13571567	Сделка #13571567	Первичные продажи	6672930	Повторный звонок	59085426	70	\N	\N	0	f
5	54236	13588411	Сделка 79269032830	Первичные продажи	6672930	Оплата получена	56926894	160	\N	\N	0	f
7	54236	14171805	Сделка #14171805	Первичные продажи	6672930	Запрос данных для договора	57029974	130	\N	\N	0	f
9	54236	16060467	Антропова Вера Игоревна	Активные клиенты	7125654	В работе	59611714	20	\N	\N	0	f
10	54236	16060471	Винтоняк Даниил Сергеевич	Активные клиенты	7125654	В работе	59611714	20	\N	\N	0	f
11	54236	16060473	Гаврютченкова Александра Юрьевеа	Активные клиенты	7125654	В работе	59611714	20	\N	\N	0	f
12	54236	16060477	Гиря Анна Ивановна	Активные клиенты	7125654	В работе	59611714	20	\N	\N	0	f
13	54236	16060479	Джапарашвили Екатерина Зурабовна	Активные клиенты	7125654	В работе	59611714	20	\N	\N	0	f
14	54236	16060487	Ивлев Михаил Владимирович	Активные клиенты	7125654	В работе	59611714	20	\N	\N	0	f
15	54236	16060491	Исаева Ирина Витальевна	Активные клиенты	7125654	В работе	59611714	20	\N	\N	0	f
16	54236	16060497	Кириллов Александр Владимирович	Активные клиенты	7125654	В работе	59611714	20	\N	\N	0	f
17	54236	16060499	Кириллова Ксения Владимировна	Активные клиенты	7125654	В работе	59611714	20	\N	\N	0	f
18	54236	16060503	Кузнецова Таисия Антоновна	Активные клиенты	7125654	В работе	59611714	20	\N	\N	0	f
19	54236	16060505	Кулеев Иван Сергеевич	Активные клиенты	7125654	В работе	59611714	20	\N	\N	0	f
20	54236	16426039	Сделка #16426039	Первичные продажи	6672930	Не разобрано (заявки)	56564478	20	\N	\N	0	f
21	54236	16431805	Сделка 74951301255	Первичные продажи	6672930	Не разобрано (Sipuni)	58499938	40	\N	\N	0	f
22	54236	16478723	Сделка 79090751195	Первичные продажи	6672930	Не разобрано (Sipuni)	58499938	40	\N	\N	0	f
23	54236	16480169	Сделка 79692100664	Первичные продажи	6672930	Не разобрано (Sipuni)	58499938	40	\N	\N	0	f
24	54236	16482849	Сделка 79673773098	Первичные продажи	6672930	Не разобрано (Sipuni)	58499938	40	\N	\N	0	f
25	54236	16483369	Сделка 79090794024	Первичные продажи	6672930	Не разобрано (Sipuni)	58499938	40	\N	\N	0	f
26	54236	16497309	Сделка 79651630839	Первичные продажи	6672930	Не разобрано (Sipuni)	58499938	40	\N	\N	0	f
28	54236	16515757	Сделка 79282799328	Первичные продажи	6672930	Не разобрано (Sipuni)	58499938	40	\N	\N	0	f
29	54236	16520483	Сделка #16520483	Первичные продажи	6672930	Не разобрано (чаты)	59517698	30	\N	\N	0	f
30	54236	16551863	Сделка 79993966902	Первичные продажи	6672930	Не разобрано (Sipuni)	58499938	40	\N	\N	0	f
31	54236	16564731	Сделка 79068661806	Первичные продажи	6672930	Не разобрано (Sipuni)	58499938	40	\N	\N	0	f
32	54236	16566749	Сделка 79068680103	Первичные продажи	6672930	Не разобрано (Sipuni)	58499938	40	\N	\N	0	f
33	54236	14145955	Сделка 79104122623	Первичные продажи	6672930	Успешно реализовано	142	10000	\N	\N	0	f
34	54236	14146281	Второй реб Таисия	Первичные продажи	6672930	Успешно реализовано	142	10000	\N	\N	0	f
35	54236	16585543	Сделка 79104122623 (Активный)	Активные клиенты	7125654	В работе	59611714	20	\N	\N	0	f
36	54236	16585549	Второй реб Таисия (Активный)	Активные клиенты	7125654	В работе	59611714	20	\N	\N	0	f
3	54236	13302303	Сделка 2реб Жовтая Таисья	Первичные продажи	6672930	Успешно реализовано	142	10000	\N	\N	0	f
37	54236	16612511	Сделка 79391111249	Первичные продажи	6672930	Не разобрано (Sipuni)	58499938	40	\N	\N	0	f
38	54236	16621069	Сделка 79090782162	Первичные продажи	6672930	Не разобрано (Sipuni)	58499938	40	\N	\N	0	f
39	54236	16624767	Сделка 79162322524	Первичные продажи	6672930	Подбор времени	56926882	80	\N	\N	0	f
40	54236	16625807	Сделка 79655403744	Первичные продажи	6672930	Не разобрано (Sipuni)	58499938	40	\N	\N	0	f
41	54236	16630457	Сделка 79030921448	Первичные продажи	6672930	Не разобрано (Sipuni)	58499938	40	\N	\N	0	f
6	54236	13622547	Жовтый Михаил	Первичные продажи	6672930	Успешно реализовано	142	10000	\N	\N	0	f
42	54236	15145791	Сделка #15145791	Первичные продажи	6672930	Не разобрано (чаты)	59517698	30	\N	\N	0	f
43	54236	16329489	Сделка #16329489	Лист ожидания	6726822	В ожидании группы	56926902	20	\N	\N	0	f
2	54236	12649289	Сделка #12649289	Первичные продажи	6672930	Успешно реализовано	142	10000	\N	\N	0	f
49	54236	16679477	Жовтый Михаил (Активный)	Активные клиенты	7125654	В работе	59611714	20	\N	\N	0	f
50	54236	16679509	Сделка 2реб Жовтая Таисья (Активный)	Активные клиенты	7125654	В работе	59611714	20	\N	\N	0	f
51	54236	16681485	Сделка #12649289 (Активный)	Активные клиенты	7125654	В работе	59611714	20	\N	\N	0	f
53	54236	16723973	Сделка 79068661358	Первичные продажи	6672930	Не разобрано (Sipuni)	58499938	40	\N	\N	0	f
54	54236	16726621	Сделка 79068665600	Первичные продажи	6672930	Не разобрано (Sipuni)	58499938	40	\N	\N	0	f
55	54236	16766514	Сделка #16766514	Первичные продажи	6672930	Не разобрано (чаты)	59517698	30	\N	\N	0	f
56	54236	16060475	Гаврютченкова Мария Юрьевеа	Активные клиенты	7125654	В работе	59611714	20	\N	\N	0	f
57	54236	16060515	Маркин Алексей Алексеевич	Активные клиенты	7125654	В работе	59611714	20	\N	\N	0	f
58	54236	16060517	Маркина Дарья Алексеевна	Активные клиенты	7125654	В работе	59611714	20	\N	\N	0	f
59	54236	16060519	Меньшикова Анна Александровна	Активные клиенты	7125654	В работе	59611714	20	\N	\N	0	f
60	54236	16060521	Мизинова Елизавета Сергеевна	Активные клиенты	7125654	В работе	59611714	20	\N	\N	0	f
61	54236	16778016	Сделка 79030799740	Первичные продажи	6672930	Не разобрано (Sipuni)	58499938	40	\N	\N	0	f
62	54236	16788894	Сделка 79624619460	Первичные продажи	6672930	Не разобрано (Sipuni)	58499938	40	\N	\N	0	f
63	54236	16790470	Сделка 79052150669	Первичные продажи	6672930	Не разобрано (Sipuni)	58499938	40	\N	\N	0	f
64	54236	16796293	Сделка 79617960628	Первичные продажи	6672930	Не разобрано (Sipuni)	58499938	40	\N	\N	0	f
66	54236	16799751	Артур Тестовая сделка	Первичные продажи	6672930	Подбор времени	56926882	80	\N	\N	0	f
68	54236	16810823	Сделка 79326980251	Первичные продажи	6672930	Не разобрано (Sipuni)	58499938	40	\N	\N	0	f
69	54236	16815753	Сделка 79774912420	Первичные продажи	6672930	Не разобрано (Sipuni)	58499938	40	\N	\N	0	f
70	54236	16835731	Сделка 79676970342	Первичные продажи	6672930	Не разобрано (Sipuni)	58499938	40	\N	\N	0	f
\.


--
-- TOC entry 4217 (class 0 OID 621546)
-- Dependencies: 295
-- Data for Name: amocrm_leads_attributes; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_leads_attributes (id, account_id, leads_id, attribute_id, name, value) FROM stdin;
17	54236	20	64259	referrer	https://excellentsc.ru/?playlist=b6719d2&video=5a2961e
18	54236	20	64273	_ym_uid	1701448997635577976
19	54236	20	64275	_ym_counter	95313879
20	54236	20	622049	Счетчик НД	0
21	54236	21	622049	Счетчик НД	0
22	54236	9	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZK-U6FYknuJ35W9oZlkMOti
23	54236	9	621947	Договор ссылка	https://docs.google.com/document/d/13XpSYJ-4lmOQ2VnUczyNm86VThNWljnyUMNT6cNW91M/edit
24	54236	9	627831	ФИО ученика	Антропова Вера Игоревна
25	54236	9	627833	ФИО законного представителя	Антропова Татьяна Юрьевна
26	54236	9	627855	Дата договора	2023-12-01 00:00:00
27	54236	9	627857	Номер договора	23/24 - 2
28	54236	9	628669	Возраст на момент обращения	9 лет +11мес
29	54236	9	628671	День рождения ученика	2013-11-07 00:00:00
30	54236	9	628867	Интересующие продукты	Английский язык
31	54236	9	629659	Серия паспорта Представителя	4611
32	54236	9	629661	Номер паспорта Представителя	259755
33	54236	9	629663	Дата выдачи Представитель	2011-01-28 00:00:00
34	54236	9	629665	Кем выдан Представитель	ТП в г. Видное ОУФМС России по Московской обл. в Ленинском районе
35	54236	9	629667	Адрес места жительства Представитель	Школьная 51-54
36	54236	9	793377	Заявление ссылка	https://docs.google.com/document/d/1HId4ooJ_fXe3f3TcMErR_NWtSqhvNTRFOSNwJe-krko/edit
37	54236	9	816029	Категория студента	Ребенок
38	54236	9	816079	Формат обучения	Очно
39	54236	9	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=13XpSYJ-4lmOQ2VnUczyNm86VThNWljnyUMNT6cNW91M
40	54236	9	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=1uaX_otdSwaXC7OXsSncUTiXfgssBSTOdJxu7ESWA5W0
41	54236	9	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=1HId4ooJ_fXe3f3TcMErR_NWtSqhvNTRFOSNwJe-krko
42	54236	9	1276093	Допник ссылка	https://docs.google.com/document/d/1uaX_otdSwaXC7OXsSncUTiXfgssBSTOdJxu7ESWA5W0/edit
43	54236	9	1280973	Email	motata@bk.ru
44	54236	9	1280975	Телефон	79264302704
45	54236	9	1288635	Анкета	https://forms.amocrm.ru/rvdddwd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZK-U6FYknuJ35W9oZlkMOti
46	54236	10	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZJeK19vngyCl9xNDXu4t-Da
47	54236	10	621947	Договор ссылка	https://docs.google.com/document/d/1UF2v3dKIqOG0iESNHZmuL3sAKiKETUWnj7nkd5GYS34/edit
48	54236	10	627831	ФИО ученика	Винтоняк Даниил Сергеевич
49	54236	10	627833	ФИО законного представителя	Винтоняк Татьяна Сергеевна
50	54236	10	627855	Дата договора	2023-12-01 00:00:00
51	54236	10	627857	Номер договора	23/24 - 3
52	54236	10	628669	Возраст на момент обращения	9 лет +1мес
53	54236	10	628671	День рождения ученика	2014-08-29 00:00:00
54	54236	10	628867	Интересующие продукты	Английский язык
55	54236	10	629659	Серия паспорта Представителя	4515
56	54236	10	629661	Номер паспорта Представителя	309337
57	54236	10	629663	Дата выдачи Представитель	2015-09-10 00:00:00
58	54236	10	629665	Кем выдан Представитель	Отделением УФМС России по гор. Москве по району Братеево
59	54236	10	629667	Адрес места жительства Представитель	Московская обл, Ленинский р-н, мкр Купелинка (д Сапроново), кв-л Центральный, д 2, кв 378
60	54236	10	793377	Заявление ссылка	https://docs.google.com/document/d/108mnegLnAwlWzBxJBYjaG8j5BXP73A7jur-FWOBSjyc/edit
61	54236	10	816029	Категория студента	Ребенок
62	54236	10	816079	Формат обучения	Очно
63	54236	10	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=1UF2v3dKIqOG0iESNHZmuL3sAKiKETUWnj7nkd5GYS34
64	54236	10	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=1nD0_EirnUUNZCguQTYETtlJf439QwI0LsUQADBpjZqw
65	54236	10	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=108mnegLnAwlWzBxJBYjaG8j5BXP73A7jur-FWOBSjyc
66	54236	10	1276093	Допник ссылка	https://docs.google.com/document/d/1nD0_EirnUUNZCguQTYETtlJf439QwI0LsUQADBpjZqw/edit
67	54236	10	1280973	Email	gidera.86@mail.ru
68	54236	10	1280975	Телефон	79031242206
69	54236	10	1288635	Анкета	https://forms.amocrm.ru/rvdddwd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZJeK19vngyCl9xNDXu4t-Da
70	54236	12	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZK76Su3h0P5_R_qDIU_Gn-b
71	54236	12	621947	Договор ссылка	https://docs.google.com/document/d/1Kcf_wPbw1kunMatRcit9i04Ew1CXf3ZoZcT8O00VMrs/edit
72	54236	12	627831	ФИО ученика	Гиря Анна Ивановна
73	54236	12	627833	ФИО законного представителя	Гиря Иван Александрович
74	54236	12	627855	Дата договора	2023-12-01 00:00:00
75	54236	12	627857	Номер договора	23/24 - 4
76	54236	12	628669	Возраст на момент обращения	8 лет +1мес
77	54236	12	628671	День рождения ученика	2015-08-29 00:00:00
78	54236	12	628867	Интересующие продукты	Английский язык
79	54236	12	629659	Серия паспорта Представителя	4509
80	54236	12	629661	Номер паспорта Представителя	512099
81	54236	12	629663	Дата выдачи Представитель	2008-01-24 00:00:00
82	54236	12	629665	Кем выдан Представитель	Отд. по р-ну Восточное Дегунино
83	54236	12	629667	Адрес места жительства Представитель	г. Видное, Ольховая 6, кв. 155.
84	54236	12	793377	Заявление ссылка	https://docs.google.com/document/d/1v9eQA6ykxbzN0P4I2vQ-Ib-arMUsvXunkLi706HZmWg/edit
85	54236	12	816029	Категория студента	Ребенок
86	54236	12	816079	Формат обучения	Очно
87	54236	12	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=1Kcf_wPbw1kunMatRcit9i04Ew1CXf3ZoZcT8O00VMrs
88	54236	12	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=1FhkE6fCA8sg5oKPXJXP9RnlbdXSQOvz-DqFGWKGOOrk
89	54236	12	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=1v9eQA6ykxbzN0P4I2vQ-Ib-arMUsvXunkLi706HZmWg
90	54236	12	1276093	Допник ссылка	https://docs.google.com/document/d/1FhkE6fCA8sg5oKPXJXP9RnlbdXSQOvz-DqFGWKGOOrk/edit
91	54236	12	1280973	Email	ivan.girya@gmail.com
92	54236	12	1280975	Телефон	79262457892
93	54236	12	1288635	Анкета	https://forms.amocrm.ru/rvdddwd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZK76Su3h0P5_R_qDIU_Gn-b
94	54236	13	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZKraDoz1Mcc5B4-kP0x8S4K
95	54236	13	621947	Договор ссылка	https://docs.google.com/document/d/1i6pF6javk4hVpY8gcn1k8wKLUFCYM3xSRTIEjPvO4jU/edit
96	54236	13	627831	ФИО ученика	Джапарашвили Екатерина Зурабовна
97	54236	13	627833	ФИО законного представителя	Слободская Галина Петровна
98	54236	13	627855	Дата договора	2023-12-01 00:00:00
99	54236	13	627857	Номер договора	23/24 - 5
100	54236	13	628669	Возраст на момент обращения	13 лет +10мес
101	54236	13	628671	День рождения ученика	2009-12-07 00:00:00
102	54236	13	628867	Интересующие продукты	Английский язык
103	54236	13	629659	Серия паспорта Представителя	4519
104	54236	13	629661	Номер паспорта Представителя	081521
105	54236	13	629663	Дата выдачи Представитель	2019-03-01 00:00:00
106	54236	13	629665	Кем выдан Представитель	ГУ МВД РОССИИ ПО Г. МОСКВЕ
107	54236	13	629667	Адрес места жительства Представитель	Видное, Березовая ул., д.3, кв.286
108	54236	13	793377	Заявление ссылка	https://docs.google.com/document/d/1yHRMAUnICx3SxLabAlAv59KUZPD-F33uNPLoX4DmuFk/edit
109	54236	13	816029	Категория студента	Ребенок
110	54236	13	816079	Формат обучения	Очно
111	54236	13	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=1i6pF6javk4hVpY8gcn1k8wKLUFCYM3xSRTIEjPvO4jU
112	54236	13	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=1aDKYAL_ZwqcnHIfKV1ddyKA2qbaceX82tUVRatoHho8
113	54236	13	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=1yHRMAUnICx3SxLabAlAv59KUZPD-F33uNPLoX4DmuFk
114	54236	13	1276093	Допник ссылка	https://docs.google.com/document/d/1aDKYAL_ZwqcnHIfKV1ddyKA2qbaceX82tUVRatoHho8/edit
115	54236	13	1280973	Email	Gpetrslob@gmail.com
116	54236	13	1280975	Телефон	79161363015
117	54236	13	1288635	Анкета	https://forms.amocrm.ru/rvdddwd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZKraDoz1Mcc5B4-kP0x8S4K
1182	54236	53	622049	Счетчик НД	0
1183	54236	54	622049	Счетчик НД	0
1481	54236	58	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=1cJ0w_flKTojeKqPKVtVJ5DlMTTmmm45QeYCrxzorWr8
1482	54236	58	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=1XBkr7aTaeHblDy6Y7icNSVC8bldPMWDKNxRVWLOivwc
1548	54236	66	627831	ФИО ученика	Борисов Артур Андреевич
1185	54236	55	622049	Счетчик НД	0
180	54236	14	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZIMGGVSzMlXYmQPnNEC7teI
181	54236	14	621947	Договор ссылка	https://docs.google.com/document/d/1k60m7aP9kkaDcbgs91OoSHlyukBqfXXVZfZJewfcye8/edit
182	54236	14	627831	ФИО ученика	Ивлев Михаил Владимирович
183	54236	14	627833	ФИО законного представителя	Ивлев Владимир Леонидович
184	54236	14	627855	Дата договора	2023-12-01 00:00:00
185	54236	14	627857	Номер договора	23/24 - 8
186	54236	14	628669	Возраст на момент обращения	11 лет +1мес
187	54236	14	628671	День рождения ученика	2012-09-05 00:00:00
188	54236	14	628867	Интересующие продукты	Английский язык
189	54236	14	629659	Серия паспорта Представителя	4515
190	54236	14	629661	Номер паспорта Представителя	375421
191	54236	14	629663	Дата выдачи Представитель	2015-12-16 00:00:00
192	54236	14	629665	Кем выдан Представитель	ОТДЕЛЕНИЕМ УФМС РОССИИ ПО ГОР. МОСКВЕ ПО РАЙОНУ МАТУШКИНО
193	54236	14	629667	Адрес места жительства Представитель	115372, Москва г, ул Лебедянская, д. 28, корп. 1, кв. 257
194	54236	14	793377	Заявление ссылка	https://docs.google.com/document/d/1qXspho5EAL98pRp09mFVMgntDe-Q2gB9qYwh7Q06f_U/edit
195	54236	14	816029	Категория студента	Ребенок
196	54236	14	816079	Формат обучения	Очно
197	54236	14	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=1k60m7aP9kkaDcbgs91OoSHlyukBqfXXVZfZJewfcye8
198	54236	14	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=1uHHveATTNoiwivMjI-mGS6xmhqHaKQg8-B8h9UkCbp8
199	54236	14	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=1qXspho5EAL98pRp09mFVMgntDe-Q2gB9qYwh7Q06f_U
200	54236	14	1276093	Допник ссылка	https://docs.google.com/document/d/1uHHveATTNoiwivMjI-mGS6xmhqHaKQg8-B8h9UkCbp8/edit
201	54236	14	1280973	Email	ivlev.vl@gmail.com
202	54236	14	1280975	Телефон	79166734107
203	54236	14	1288635	Анкета	https://forms.amocrm.ru/rvdddwd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZIMGGVSzMlXYmQPnNEC7teI
204	54236	15	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZLWK-2dm5khCZKGOwpdkPCM
205	54236	15	621947	Договор ссылка	https://docs.google.com/document/d/1815XRtAc6qvcj8Bevr04Adn7RFLQc7Vz_NRycfJcJl0/edit
206	54236	15	627831	ФИО ученика	Исаева Ирина Витальевна
207	54236	15	627833	ФИО законного представителя	Исаева Марина Юрьевна
208	54236	15	627855	Дата договора	2023-12-01 00:00:00
209	54236	15	627857	Номер договора	23/24 - 9
210	54236	15	628669	Возраст на момент обращения	15 лет +1мес
211	54236	15	628671	День рождения ученика	2008-09-18 00:00:00
212	54236	15	628867	Интересующие продукты	Английский язык
213	54236	15	629659	Серия паспорта Представителя	4519
214	54236	15	629661	Номер паспорта Представителя	314984
215	54236	15	629663	Дата выдачи Представитель	2019-07-30 00:00:00
216	54236	15	629665	Кем выдан Представитель	ГУ МВД РОССИИ ПО Г. МОСКВЕ
217	54236	15	629667	Адрес места жительства Представитель	г.Видное ,ул.Ольховая, д.11 кв.103
218	54236	15	793377	Заявление ссылка	https://docs.google.com/document/d/11Pxa1jWcX7gJvTElx7LdB9affQltOKWT19UIXIOROcM/edit
219	54236	15	816029	Категория студента	Ребенок
220	54236	15	816079	Формат обучения	Очно
221	54236	15	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=1815XRtAc6qvcj8Bevr04Adn7RFLQc7Vz_NRycfJcJl0
222	54236	15	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=1DZQmWOTX7R3U1GpyndS7sma-QlaVVrrp3jTDnNWriX8
223	54236	15	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=11Pxa1jWcX7gJvTElx7LdB9affQltOKWT19UIXIOROcM
224	54236	15	1276093	Допник ссылка	https://docs.google.com/document/d/1DZQmWOTX7R3U1GpyndS7sma-QlaVVrrp3jTDnNWriX8/edit
225	54236	15	1280973	Email	maris_07@mail.ru
226	54236	15	1280975	Телефон	79166789264
227	54236	15	1288635	Анкета	https://forms.amocrm.ru/rvdddwd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZLWK-2dm5khCZKGOwpdkPCM
228	54236	16	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZLy51FuKuRmISBeJD4N8pbr
229	54236	16	621947	Договор ссылка	https://docs.google.com/document/d/17OMTZaq9XBp-8LSbzWMmRKpaKfa7Lh-_kr_vMdxYV8c/edit
230	54236	16	627831	ФИО ученика	Кириллов Александр Владимирович
231	54236	16	627833	ФИО законного представителя	Кириллова Ирина Александровна
232	54236	16	627855	Дата договора	2023-12-01 00:00:00
233	54236	16	627857	Номер договора	23/24 - 10
234	54236	16	628669	Возраст на момент обращения	13 лет +6мес
235	54236	16	628671	День рождения ученика	2010-04-08 00:00:00
236	54236	16	628867	Интересующие продукты	Английский язык
237	54236	16	629659	Серия паспорта Представителя	4610
238	54236	16	629661	Номер паспорта Представителя	926267
239	54236	16	629663	Дата выдачи Представитель	2010-05-25 00:00:00
240	54236	16	629665	Кем выдан Представитель	ТП в гор. Видное ОУФМС РФ по МО в Ленинском р-не
241	54236	16	629667	Адрес места жительства Представитель	142701 г. Видное МО ул. Ольховая д. 1, кв. 149
242	54236	16	793377	Заявление ссылка	https://docs.google.com/document/d/1nYSuPn0U-hkBiQ-8tqe5RTRFoDOkxXT0l65yULlGPbk/edit
243	54236	16	816029	Категория студента	Ребенок
244	54236	16	816079	Формат обучения	Очно
309	54236	7	1244533	Уровень владения	А2
245	54236	16	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=17OMTZaq9XBp-8LSbzWMmRKpaKfa7Lh-_kr_vMdxYV8c
246	54236	16	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=1WfqLM4_N7dwhhinhJHqOEmRpWGJONxobUUdlxn5BRMc
247	54236	16	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=1nYSuPn0U-hkBiQ-8tqe5RTRFoDOkxXT0l65yULlGPbk
248	54236	16	1276093	Допник ссылка	https://docs.google.com/document/d/1WfqLM4_N7dwhhinhJHqOEmRpWGJONxobUUdlxn5BRMc/edit
249	54236	16	1280973	Email	iriska101@yandex.ru
250	54236	16	1280975	Телефон	79859930894
251	54236	16	1288635	Анкета	https://forms.amocrm.ru/rvdddwd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZLy51FuKuRmISBeJD4N8pbr
252	54236	17	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZKW5prI0pG8fSCt8FDRprIj
253	54236	17	621947	Договор ссылка	https://docs.google.com/document/d/1y3bQGdZkuXbigzA6npplcotyk4jwOsh-iQlx9G6immo/edit
254	54236	17	627831	ФИО ученика	Кириллова Ксения Владимировна
255	54236	17	627833	ФИО законного представителя	Кириллова Ирина Александровна
256	54236	17	627855	Дата договора	2023-12-01 00:00:00
257	54236	17	627857	Номер договора	23/24 - 11
258	54236	17	628669	Возраст на момент обращения	8 лет +8мес
259	54236	17	628671	День рождения ученика	2015-02-03 00:00:00
260	54236	17	628867	Интересующие продукты	Английский язык
261	54236	17	629659	Серия паспорта Представителя	4610
262	54236	17	629661	Номер паспорта Представителя	926267
263	54236	17	629663	Дата выдачи Представитель	2010-05-25 00:00:00
264	54236	17	629665	Кем выдан Представитель	ТП в гор. Видное ОУФМС РФ по МО
265	54236	17	629667	Адрес места жительства Представитель	142701 г. Видное, МО,  ул. Ольховая 1, кв. 149
266	54236	17	793377	Заявление ссылка	https://docs.google.com/document/d/1QGkOBVQQjgd6TPqh3fNvtCOP4nAftmBjKmTgKJg4l0g/edit
267	54236	17	816029	Категория студента	Ребенок
268	54236	17	816079	Формат обучения	Очно
269	54236	17	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=1y3bQGdZkuXbigzA6npplcotyk4jwOsh-iQlx9G6immo
270	54236	17	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=1cnpJnMU2ysaInCOfRBQzTJD19GCpHjaZyP2T_fZPI2U
271	54236	17	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=1QGkOBVQQjgd6TPqh3fNvtCOP4nAftmBjKmTgKJg4l0g
272	54236	17	1276093	Допник ссылка	https://docs.google.com/document/d/1cnpJnMU2ysaInCOfRBQzTJD19GCpHjaZyP2T_fZPI2U/edit
273	54236	17	1280973	Email	iriska101@yandex.ru
274	54236	17	1280975	Телефон	79859930894
275	54236	17	1288635	Анкета	https://forms.amocrm.ru/rvdddwd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZKW5prI0pG8fSCt8FDRprIj
276	54236	4	604587	Источник	Яндекс бизнес заявка
277	54236	4	622049	Счетчик НД	0
278	54236	4	627831	ФИО ученика	Максимилиан
279	54236	4	628669	Возраст на момент обращения	3г,5 мес
280	54236	4	628671	День рождения ученика	2020-05-03 00:00:00
281	54236	4	628871	Филиал	Видное. Ольховая 4
282	54236	4	629593	Цель обучения	Раннее изучение языка
283	54236	4	752225	Дни занятий	Будни
284	54236	4	752227	Время занятий	Вечер
285	54236	4	816029	Категория студента	Ребенок
286	54236	4	816079	Формат обучения	Очно
287	54236	4	1244533	Уровень владения	Никогда не изучал
288	54236	4	1276589	Дата задачи	2023-12-04 00:00:00
289	54236	7	604587	Источник	Звонки по рекомендации наших клиентов
290	54236	7	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpVoQhUQL0A2fNUbgUBEqsv5ANUetF76HtUQ0GAxrW05U
291	54236	7	622049	Счетчик НД	0
292	54236	7	627831	ФИО ученика	Колеватых Ярослав Андреевич
293	54236	7	627833	ФИО законного представителя	Колеватых Евгения Владимировна
294	54236	7	627855	Дата договора	2023-12-01 00:00:00
295	54236	7	628669	Возраст на момент обращения	14, 8 кл 10 шк 1 смена
296	54236	7	628671	День рождения ученика	2009-01-16 00:00:00
297	54236	7	628867	Интересующие продукты	Английский язык
298	54236	7	628873	Комментарий	занимались ранее в E First
299	54236	7	629593	Цель обучения	Для улучшения успеваемости по школьному предмету
300	54236	7	629659	Серия паспорта Представителя	9801
301	54236	7	629661	Номер паспорта Представителя	280083
302	54236	7	629663	Дата выдачи Представитель	2002-04-24 00:00:00
303	54236	7	629665	Кем выдан Представитель	Мархинским отделением милиции гор. Якутска
304	54236	7	629667	Адрес места жительства Представитель	Московская область, г. Видное, ул. Завидная, д. 13, кв. 251
305	54236	7	752225	Дни занятий	Будни
306	54236	7	752227	Время занятий	Вечер
307	54236	7	816029	Категория студента	Ребенок
308	54236	7	816079	Формат обучения	Очно
310	54236	7	1276589	Дата задачи	2023-09-20 00:00:00
311	54236	7	1280973	Email	koleva.evg@gmail.com
312	54236	7	1280975	Телефон	79168105616
313	54236	22	622049	Счетчик НД	0
314	54236	23	622049	Счетчик НД	0
315	54236	24	622049	Счетчик НД	0
316	54236	25	622049	Счетчик НД	0
317	54236	18	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZJVDMepFFAHlfUxk50ygJuP
318	54236	18	621947	Договор ссылка	https://docs.google.com/document/d/1PLmwPdE5cyNm20Hwfjzmq0FwvBfbDs5nMYs21Yh_VUA/edit
319	54236	18	627831	ФИО ученика	Кузнецова Таисия Антоновна
320	54236	18	627833	ФИО законного представителя	Цыганкова Анна Павловна
321	54236	18	627855	Дата договора	2023-12-01 00:00:00
322	54236	18	627857	Номер договора	23/24 - 12
323	54236	18	628669	Возраст на момент обращения	5 лет +1мес
324	54236	18	628671	День рождения ученика	2018-08-30 00:00:00
325	54236	18	628867	Интересующие продукты	Английский язык
326	54236	18	629659	Серия паспорта Представителя	7802
327	54236	18	629661	Номер паспорта Представителя	698393
328	54236	18	629663	Дата выдачи Представитель	2002-08-22 00:00:00
329	54236	18	629665	Кем выдан Представитель	Ленинским РОВД г. Ярославля
330	54236	18	629667	Адрес места жительства Представитель	Г.Видное, ул. Ольховая, д.2, кВ.256
331	54236	18	793377	Заявление ссылка	https://docs.google.com/document/d/1mumhvXAszO9elgdAQCOQT-4Q3QMZOiSHD43ktR9X4Sg/edit
332	54236	18	816029	Категория студента	Ребенок
333	54236	18	816079	Формат обучения	Очно
334	54236	18	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=1PLmwPdE5cyNm20Hwfjzmq0FwvBfbDs5nMYs21Yh_VUA
335	54236	18	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=121ii3v9gq3p3ykV5H1vf6f6rDnYGLpQ90LhO2uXEGGA
336	54236	18	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=1mumhvXAszO9elgdAQCOQT-4Q3QMZOiSHD43ktR9X4Sg
337	54236	18	1276093	Допник ссылка	https://docs.google.com/document/d/121ii3v9gq3p3ykV5H1vf6f6rDnYGLpQ90LhO2uXEGGA/edit
338	54236	18	1280973	Email	Cigankova.a@yandex.ru
339	54236	18	1280975	Телефон	79096925858
340	54236	18	1288635	Анкета	https://forms.amocrm.ru/rvdddwd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZJVDMepFFAHlfUxk50ygJuP
357	54236	5	604587	Источник	Звонки IP СИПУНИ (с диджитал рекламы)
358	54236	5	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpUmhryMNqUuckLq7OAOjbz4il2kGu22uboWGvotNWiDM
359	54236	5	622049	Счетчик НД	0
360	54236	5	627831	ФИО ученика	Фокина Елизавета Ильинична
361	54236	5	627833	ФИО законного представителя	Фокин Илья Сергеевич
362	54236	5	628669	Возраст на момент обращения	4,6
363	54236	5	628671	День рождения ученика	2019-02-21 00:00:00
364	54236	5	628867	Интересующие продукты	Английский язык
365	54236	5	628871	Филиал	Видное. Ольховая 4
366	54236	5	628873	Комментарий	Из Бэби клуба подруги Вероники Дашиной
367	54236	5	629593	Цель обучения	Раннее изучение языка
368	54236	5	629659	Серия паспорта Представителя	4622
369	54236	5	629661	Номер паспорта Представителя	971278
370	54236	5	629663	Дата выдачи Представитель	2023-02-07 00:00:00
371	54236	5	629665	Кем выдан Представитель	ГУ МВД по Московской области
372	54236	5	629667	Адрес места жительства Представитель	Г Видное ул ольховая д 4 кВ 372
373	54236	5	752225	Дни занятий	Будни,Вторник,Четверг
374	54236	5	752227	Время занятий	Утро
375	54236	5	816029	Категория студента	Ребенок
376	54236	5	816079	Формат обучения	Очно
377	54236	5	1244533	Уровень владения	Никогда не изучал
378	54236	5	1280973	Email	glazkovans@mail.ru
379	54236	5	1280975	Телефон	79265960696
380	54236	26	622049	Счетчик НД	0
723	54236	37	622049	Счетчик НД	0
724	54236	38	622049	Счетчик НД	0
725	54236	40	622049	Счетчик НД	0
726	54236	39	604587	Источник	Звонки IP СИПУНИ (с диджитал рекламы)
385	54236	28	622049	Счетчик НД	0
386	54236	29	622049	Счетчик НД	0
727	54236	39	622049	Счетчик НД	0
728	54236	39	628669	Возраст на момент обращения	4 год
729	54236	39	628867	Интересующие продукты	Английский язык
730	54236	39	628871	Филиал	Видное. Ольховая 4
731	54236	39	628873	Комментарий	Ходит в сад
732	54236	39	629593	Цель обучения	Раннее изучение языка
733	54236	39	752225	Дни занятий	Будни
734	54236	39	752227	Время занятий	Вечер
735	54236	39	816029	Категория студента	Ребенок
736	54236	39	816079	Формат обучения	Очно
737	54236	39	1244533	Уровень владения	Изучал ранее
738	54236	39	1276589	Дата задачи	2023-12-25 00:00:00
739	54236	41	622049	Счетчик НД	0
412	54236	30	622049	Счетчик НД	0
415	54236	31	622049	Счетчик НД	0
416	54236	32	622049	Счетчик НД	0
785	54236	42	622049	Счетчик НД	0
786	54236	43	64259	referrer	https://languagestudio-vienna.ru/ispanskij/
787	54236	43	64273	_ym_uid	170110255287608922
788	54236	43	64275	_ym_counter	92140536
789	54236	43	502319	Причина отказа	Нет подходящей по уровню группы
790	54236	43	502321	Причина отказа подробнее	Хотят учитьииспанский дошкольник
791	54236	43	604587	Источник	Сайт заявка
792	54236	43	622049	Счетчик НД	0
793	54236	43	628669	Возраст на момент обращения	6,5 лет
794	54236	43	628867	Интересующие продукты	Испанский язык
795	54236	43	628871	Филиал	Видное. Ольховая 4
796	54236	43	629593	Цель обучения	Раннее изучение языка
797	54236	43	816029	Категория студента	Ребенок
798	54236	43	816079	Формат обучения	Очно
799	54236	43	1244533	Уровень владения	Никогда не изучал
545	54236	33	604587	Источник	Звонки по рекомендации наших клиентов
546	54236	33	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpVoQhUQL0A2fNUbgUBEqsv4tX5Im2lUY8dAaGzIHGwqc
547	54236	33	621947	Договор ссылка	https://docs.google.com/document/d/14Qv8ilD8CRct4KjCrRcIMNNqpDUDmTBqw1cS4XamPck/edit
548	54236	33	622049	Счетчик НД	0
549	54236	33	627831	ФИО ученика	Данилин Александр Иванович
550	54236	33	627833	ФИО законного представителя	Данилина Оксана Игоревна
551	54236	33	627855	Дата договора	2023-09-01 00:00:00
552	54236	33	627857	Номер договора	23/24 - 2
553	54236	33	628669	Возраст на момент обращения	10 лет, 5 кл
554	54236	33	628671	День рождения ученика	2012-08-26 00:00:00
555	54236	33	628867	Интересующие продукты	Английский язык
556	54236	33	628871	Филиал	Видное. Ольховая 4
557	54236	33	628873	Комментарий	Саня, сын Оксаны Монтессори
558	54236	33	629593	Цель обучения	Для углубленного изучения школьного предмета
559	54236	33	629659	Серия паспорта Представителя	4619
560	54236	33	629661	Номер паспорта Представителя	134107
561	54236	33	629663	Дата выдачи Представитель	2018-10-17 00:00:00
562	54236	33	629665	Кем выдан Представитель	ГУ МВД РОССИИ ПО МОСКОВСКОЙ ОБЛАСТИ
563	54236	33	629667	Адрес места жительства Представитель	Г. Видное Ул. Берёзовая 9 кВ 754
564	54236	33	752225	Дни занятий	Будни
565	54236	33	752227	Время занятий	День,Вечер
566	54236	33	793377	Заявление ссылка	https://docs.google.com/document/d/1JajW4083LmmY3G0ikZJREai_lTGLY6Nmb1h67UrYFNw/edit
567	54236	33	816029	Категория студента	Ребенок
568	54236	33	816079	Формат обучения	Очно
569	54236	33	1244533	Уровень владения	Pre-A1
570	54236	33	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=14Qv8ilD8CRct4KjCrRcIMNNqpDUDmTBqw1cS4XamPck
571	54236	33	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=1eAC0W4E_m4wkXcnfYBcONEae_0h8SFde_GAKkV0MeYw
572	54236	33	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=1JajW4083LmmY3G0ikZJREai_lTGLY6Nmb1h67UrYFNw
573	54236	33	1276093	Допник ссылка	https://docs.google.com/document/d/1eAC0W4E_m4wkXcnfYBcONEae_0h8SFde_GAKkV0MeYw/edit
574	54236	33	1276589	Дата задачи	2023-09-19 00:00:00
575	54236	33	1280973	Email	brelliant@bk.ru
576	54236	33	1280975	Телефон	79104122623
577	54236	35	604587	Источник	Звонки по рекомендации наших клиентов
578	54236	35	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpVoQhUQL0A2fNUbgUBEqsv4tX5Im2lUY8dAaGzIHGwqc
579	54236	35	621947	Договор ссылка	https://docs.google.com/document/d/14Qv8ilD8CRct4KjCrRcIMNNqpDUDmTBqw1cS4XamPck/edit
580	54236	35	622049	Счетчик НД	0
581	54236	35	627831	ФИО ученика	Данилин Александр Иванович
582	54236	35	627833	ФИО законного представителя	Данилина Оксана Игоревна
583	54236	35	627855	Дата договора	2023-09-01 00:00:00
584	54236	35	627857	Номер договора	23/24 - 2
585	54236	35	628669	Возраст на момент обращения	10 лет, 5 кл
586	54236	35	628671	День рождения ученика	2012-08-26 00:00:00
587	54236	35	628867	Интересующие продукты	Английский язык
588	54236	35	628871	Филиал	Видное. Ольховая 4
589	54236	35	628873	Комментарий	Саня, сын Оксаны Монтессори
590	54236	35	629593	Цель обучения	Для углубленного изучения школьного предмета
591	54236	35	629659	Серия паспорта Представителя	4619
592	54236	35	629661	Номер паспорта Представителя	134107
593	54236	35	629663	Дата выдачи Представитель	2018-10-17 00:00:00
594	54236	35	629665	Кем выдан Представитель	ГУ МВД РОССИИ ПО МОСКОВСКОЙ ОБЛАСТИ
595	54236	35	629667	Адрес места жительства Представитель	Г. Видное Ул. Берёзовая 9 кВ 754
596	54236	35	752225	Дни занятий	Будни
597	54236	35	752227	Время занятий	День,Вечер
598	54236	35	793377	Заявление ссылка	https://docs.google.com/document/d/1JajW4083LmmY3G0ikZJREai_lTGLY6Nmb1h67UrYFNw/edit
599	54236	35	816029	Категория студента	Ребенок
600	54236	35	816079	Формат обучения	Очно
601	54236	35	1244533	Уровень владения	Pre-A1
602	54236	35	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=14Qv8ilD8CRct4KjCrRcIMNNqpDUDmTBqw1cS4XamPck
603	54236	35	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=1eAC0W4E_m4wkXcnfYBcONEae_0h8SFde_GAKkV0MeYw
604	54236	35	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=1JajW4083LmmY3G0ikZJREai_lTGLY6Nmb1h67UrYFNw
605	54236	35	1276093	Допник ссылка	https://docs.google.com/document/d/1eAC0W4E_m4wkXcnfYBcONEae_0h8SFde_GAKkV0MeYw/edit
606	54236	35	1276589	Дата задачи	2023-09-19 00:00:00
607	54236	35	1280973	Email	brelliant@bk.ru
608	54236	35	1280975	Телефон	79104122623
609	54236	34	604587	Источник	Звонки по рекомендации наших клиентов
610	54236	34	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpVoQhUQL0A2fNUbgUBEqsv5BGmt32E-PP7quVpAppCNS
611	54236	34	621947	Договор ссылка	https://docs.google.com/document/d/15RShs9hxaLCSVJ1q5XSqFNOXEBtpggwJVb3BJ21BuTc/edit
612	54236	34	622049	Счетчик НД	0
613	54236	34	627831	ФИО ученика	Данилина Таисия Ивановна
614	54236	34	627833	ФИО законного представителя	Данилина Оксана Игоревна
615	54236	34	627855	Дата договора	2023-09-01 00:00:00
616	54236	34	627857	Номер договора	23/24 - 3
617	54236	34	628669	Возраст на момент обращения	6 лет
618	54236	34	628671	День рождения ученика	2017-05-31 00:00:00
619	54236	34	628867	Интересующие продукты	Английский язык
620	54236	34	628871	Филиал	Видное. Ольховая 4
621	54236	34	628873	Комментарий	могут  вт, чт
622	54236	34	629593	Цель обучения	Раннее изучение языка
623	54236	34	629659	Серия паспорта Представителя	4619
624	54236	34	629661	Номер паспорта Представителя	134107
625	54236	34	629663	Дата выдачи Представитель	2018-10-17 00:00:00
626	54236	34	629665	Кем выдан Представитель	ГУ МВД РОССИИ ПО МОСКОВСКОЙ ОБЛАСТИ
627	54236	34	629667	Адрес места жительства Представитель	Г. Видное Ул. Берёзовая 9 кВ 754
628	54236	34	752225	Дни занятий	Вторник,Четверг
629	54236	34	752227	Время занятий	Вечер
630	54236	34	793377	Заявление ссылка	https://docs.google.com/document/d/1NdC_CHKPfttm3AdrxSJUJrC6WAFoxetmiGbAL-6StBU/edit
631	54236	34	816029	Категория студента	Ребенок
632	54236	34	816079	Формат обучения	Очно
633	54236	34	1244533	Уровень владения	Никогда не изучал
634	54236	34	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=15RShs9hxaLCSVJ1q5XSqFNOXEBtpggwJVb3BJ21BuTc
635	54236	34	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=1OjsVALAZkZzQNVEa31qcFsdO2eEpmizWnvHPnicFSmU
636	54236	34	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=1NdC_CHKPfttm3AdrxSJUJrC6WAFoxetmiGbAL-6StBU
637	54236	34	1276093	Допник ссылка	https://docs.google.com/document/d/1OjsVALAZkZzQNVEa31qcFsdO2eEpmizWnvHPnicFSmU/edit
638	54236	34	1276589	Дата задачи	2023-09-22 00:00:00
639	54236	34	1280973	Email	brelliant@bk.ru
640	54236	34	1280975	Телефон	79104122623
641	54236	36	604587	Источник	Звонки по рекомендации наших клиентов
642	54236	36	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpVoQhUQL0A2fNUbgUBEqsv5BGmt32E-PP7quVpAppCNS
643	54236	36	621947	Договор ссылка	https://docs.google.com/document/d/15RShs9hxaLCSVJ1q5XSqFNOXEBtpggwJVb3BJ21BuTc/edit
644	54236	36	622049	Счетчик НД	0
645	54236	36	627831	ФИО ученика	Данилина Таисия Ивановна
646	54236	36	627833	ФИО законного представителя	Данилина Оксана Игоревна
647	54236	36	627855	Дата договора	2023-09-01 00:00:00
648	54236	36	627857	Номер договора	23/24 - 3
649	54236	36	628669	Возраст на момент обращения	6 лет
650	54236	36	628671	День рождения ученика	2017-05-31 00:00:00
651	54236	36	628867	Интересующие продукты	Английский язык
652	54236	36	628871	Филиал	Видное. Ольховая 4
653	54236	36	628873	Комментарий	могут  вт, чт
654	54236	36	629593	Цель обучения	Раннее изучение языка
655	54236	36	629659	Серия паспорта Представителя	4619
656	54236	36	629661	Номер паспорта Представителя	134107
657	54236	36	629663	Дата выдачи Представитель	2018-10-17 00:00:00
658	54236	36	629665	Кем выдан Представитель	ГУ МВД РОССИИ ПО МОСКОВСКОЙ ОБЛАСТИ
659	54236	36	629667	Адрес места жительства Представитель	Г. Видное Ул. Берёзовая 9 кВ 754
660	54236	36	752225	Дни занятий	Вторник,Четверг
661	54236	36	752227	Время занятий	Вечер
662	54236	36	793377	Заявление ссылка	https://docs.google.com/document/d/1NdC_CHKPfttm3AdrxSJUJrC6WAFoxetmiGbAL-6StBU/edit
663	54236	36	816029	Категория студента	Ребенок
664	54236	36	816079	Формат обучения	Очно
665	54236	36	1244533	Уровень владения	Никогда не изучал
666	54236	36	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=15RShs9hxaLCSVJ1q5XSqFNOXEBtpggwJVb3BJ21BuTc
667	54236	36	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=1OjsVALAZkZzQNVEa31qcFsdO2eEpmizWnvHPnicFSmU
668	54236	36	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=1NdC_CHKPfttm3AdrxSJUJrC6WAFoxetmiGbAL-6StBU
669	54236	36	1276093	Допник ссылка	https://docs.google.com/document/d/1OjsVALAZkZzQNVEa31qcFsdO2eEpmizWnvHPnicFSmU/edit
670	54236	36	1276589	Дата задачи	2023-09-22 00:00:00
671	54236	36	1280973	Email	brelliant@bk.ru
672	54236	36	1280975	Телефон	79104122623
1483	54236	58	1276093	Допник ссылка	https://docs.google.com/document/d/1cJ0w_flKTojeKqPKVtVJ5DlMTTmmm45QeYCrxzorWr8/edit
1484	54236	58	1280973	Email	alalmar@yandex.ru
1485	54236	58	1280975	Телефон	79265588880
1486	54236	58	1288635	Анкета	https://forms.amocrm.ru/rvdddwd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZK16fLeAeJvT1DoW08ULMXx
1487	54236	59	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZKtTpr7S9MBgHG_jM7rk6yq
1488	54236	59	621947	Договор ссылка	https://docs.google.com/document/d/1No0jixJhq3234oFwiaLmmeBylXAmyw3XUb2D8dUcp1M/edit
1489	54236	59	627831	ФИО ученика	Меньшикова Анна Александровна
1490	54236	59	627833	ФИО законного представителя	Меньшикова Елена Александровна
1491	54236	59	627855	Дата договора	2023-12-01 00:00:00
1492	54236	59	627857	Номер договора	23/24 - 18
1493	54236	59	628669	Возраст на момент обращения	8 лет +4мес
1494	54236	59	628671	День рождения ученика	2015-06-06 00:00:00
1495	54236	59	628867	Интересующие продукты	Английский язык
1496	54236	59	628871	Филиал	Видное. Ольховая 4
1497	54236	59	629593	Цель обучения	Для улучшения успеваемости по школьному предмету
1498	54236	59	629659	Серия паспорта Представителя	4146
1499	54236	59	629661	Номер паспорта Представителя	413936
1500	54236	59	629663	Дата выдачи Представитель	2017-01-02 00:00:00
1501	54236	59	629665	Кем выдан Представитель	ОУФМС России по московской области по озерскому муниципальному району
1502	54236	59	629667	Адрес места жительства Представитель	видное. Белокаменная ш. Жк тет видный. Д4, кв 22
1503	54236	59	793377	Заявление ссылка	https://docs.google.com/document/d/1zu8sP7Mw6fVDpwNaQ_PJp2FABBDw-G3B9FMl25yKAjo/edit
1504	54236	59	816029	Категория студента	Ребенок
1505	54236	59	816079	Формат обучения	Очно
1506	54236	59	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=1No0jixJhq3234oFwiaLmmeBylXAmyw3XUb2D8dUcp1M
1507	54236	59	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=1qYQV9Sq8tF5kVspbbvz_1xECCnJEHgtKvhtOnzRHm5A
1508	54236	59	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=1zu8sP7Mw6fVDpwNaQ_PJp2FABBDw-G3B9FMl25yKAjo
1509	54236	59	1276093	Допник ссылка	https://docs.google.com/document/d/1qYQV9Sq8tF5kVspbbvz_1xECCnJEHgtKvhtOnzRHm5A/edit
1510	54236	59	1280973	Email	Chygestranka@inbox.ru
1511	54236	59	1280975	Телефон	79774151480
1512	54236	59	1288635	Анкета	https://forms.amocrm.ru/rvdddwd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZKtTpr7S9MBgHG_jM7rk6yq
1362	54236	61	622049	Счетчик НД	0
1363	54236	62	622049	Счетчик НД	0
1364	54236	63	622049	Счетчик НД	0
1365	54236	11	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZJf9OLr7YywODtisWIskzPd
1366	54236	11	621947	Договор ссылка	https://docs.google.com/document/d/1dXwsKF2Q7Iq9DCOVZYbzeYuoIoW0OUjQ6qTzSyzXLgU/edit
1367	54236	11	627831	ФИО ученика	Гаврютченкова Александра Юрьевна
1368	54236	11	627833	ФИО законного представителя	Гаврютченкова Ольга Владимировна
1369	54236	11	627855	Дата договора	2023-12-01 00:00:00
1370	54236	11	627857	Номер договора	23/24 - 13
1371	54236	11	628669	Возраст на момент обращения	7 лет +6мес
1372	54236	11	628671	День рождения ученика	2016-04-06 00:00:00
1373	54236	11	628867	Интересующие продукты	Английский язык
1374	54236	11	629659	Серия паспорта Представителя	3810
1375	54236	11	629661	Номер паспорта Представителя	712926
1376	54236	11	629663	Дата выдачи Представитель	2010-11-12 00:00:00
1377	54236	11	629665	Кем выдан Представитель	ТП УФМС РОССИИ ПО КУРСКОЙ ОБЛАСТИ В СОВЕТСКОМ РАЙОНЕ
1378	54236	11	629667	Адрес места жительства Представитель	Видное., Ул. Ольховая, 1
1379	54236	11	793377	Заявление ссылка	https://docs.google.com/document/d/1DXX5lShpbd_MADI5iPd_cExHE1oPqe1uHU6m56RT1zw/edit
1380	54236	11	816029	Категория студента	Ребенок
1381	54236	11	816079	Формат обучения	Очно
1382	54236	11	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=1dXwsKF2Q7Iq9DCOVZYbzeYuoIoW0OUjQ6qTzSyzXLgU
1383	54236	11	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=1oyOhgOP-gAPtOiGk2aOxl8FCvW71T5B2je26RQ3hW40
1384	54236	11	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=1DXX5lShpbd_MADI5iPd_cExHE1oPqe1uHU6m56RT1zw
1385	54236	11	1276093	Допник ссылка	https://docs.google.com/document/d/1oyOhgOP-gAPtOiGk2aOxl8FCvW71T5B2je26RQ3hW40/edit
1386	54236	11	1280973	Email	Gavryutchenkova@mail.ru
1387	54236	11	1280975	Телефон	79646354444
1388	54236	11	1288635	Анкета	https://forms.amocrm.ru/rvdddwd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZJf9OLr7YywODtisWIskzPd
1389	54236	64	622049	Счетчик НД	0
1390	54236	56	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZIgIB9EXi4gCE6PkcV7yaXz
1391	54236	56	621947	Договор ссылка	https://docs.google.com/document/d/1aIiJv-eIocg0kZoHHGHZzFNaIACkQRVoXso0oBzw0ZE/edit
1392	54236	56	627831	ФИО ученика	Гаврютченкова Мария Юрьевеа
1393	54236	56	627833	ФИО законного представителя	Гаврютченкова Ольга
1394	54236	56	627855	Дата договора	2023-12-01 00:00:00
1395	54236	56	627857	Номер договора	23/24 - 14
1396	54236	56	628669	Возраст на момент обращения	9 лет
1397	54236	56	628671	День рождения ученика	2014-10-10 00:00:00
1398	54236	56	628867	Интересующие продукты	Английский язык
1399	54236	56	629593	Цель обучения	Для углубленного изучения школьного предмета
1400	54236	56	629659	Серия паспорта Представителя	3810
1401	54236	56	629661	Номер паспорта Представителя	712926
1402	54236	56	629663	Дата выдачи Представитель	2010-11-12 00:00:00
1403	54236	56	629665	Кем выдан Представитель	ТП УФМС РОССИИ ПО КУРСКОЙ ОБЛАСТИ В СОВЕТСКОМ РАЙОНЕ
1404	54236	56	629667	Адрес места жительства Представитель	Видное., Ул. Ольховая, 1
1405	54236	56	793377	Заявление ссылка	https://docs.google.com/document/d/1-lkdoIJKKREZ-1DVAGJDGOmv0hjCpqvGBtQTQXBwhY4/edit
1406	54236	56	816029	Категория студента	Ребенок
1407	54236	56	816079	Формат обучения	Очно
1408	54236	56	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=1aIiJv-eIocg0kZoHHGHZzFNaIACkQRVoXso0oBzw0ZE
1409	54236	56	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=14s2fmQ40IRKqOTa8TR1N2PdWN3bCIGwNi2A9KyK8uyc
1410	54236	56	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=1-lkdoIJKKREZ-1DVAGJDGOmv0hjCpqvGBtQTQXBwhY4
1411	54236	56	1276093	Допник ссылка	https://docs.google.com/document/d/14s2fmQ40IRKqOTa8TR1N2PdWN3bCIGwNi2A9KyK8uyc/edit
1412	54236	56	1280973	Email	gavryutchenkova@mail.ru
1413	54236	56	1280975	Телефон	79646354444
1414	54236	56	1288635	Анкета	https://forms.amocrm.ru/rvdddwd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZIgIB9EXi4gCE6PkcV7yaXz
1415	54236	19	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZJlZF9kIy42i-j97Yz0VbFc
1416	54236	19	621947	Договор ссылка	https://docs.google.com/document/d/1ohoeZNFXLXb2hBINUv3vb9Z_QNAKFVJKxXqmL9tT59c/edit
1417	54236	19	627831	ФИО ученика	Кулеев Иван Сергеевич
1418	54236	19	627833	ФИО законного представителя	Кулеев Сергей Владимирович
1419	54236	19	627855	Дата договора	2023-12-01 00:00:00
1420	54236	19	627857	Номер договора	23/24 - 15
1421	54236	19	628669	Возраст на момент обращения	14 лет +4мес
1422	54236	19	628671	День рождения ученика	2009-06-11 00:00:00
1545	54236	68	622049	Счетчик НД	0
1423	54236	19	628867	Интересующие продукты	Английский язык
1424	54236	19	629593	Цель обучения	Для углубленного изучения школьного предмета
1425	54236	19	629659	Серия паспорта Представителя	4618
1426	54236	19	629661	Номер паспорта Представителя	930996
1427	54236	19	629663	Дата выдачи Представитель	2018-05-18 00:00:00
1428	54236	19	629665	Кем выдан Представитель	ГУ МВД России по Московской области
1429	54236	19	629667	Адрес места жительства Представитель	Видное, ул. Ольховая, д.1, кв. 178
1430	54236	19	793377	Заявление ссылка	https://docs.google.com/document/d/1YCNJGfOqoX2p6AB8kanUUtMXJbPXfKaYQI9h6mtIJns/edit
1431	54236	19	816029	Категория студента	Ребенок
1432	54236	19	816079	Формат обучения	Очно
1433	54236	19	1244533	Уровень владения	В1
1434	54236	19	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=1ohoeZNFXLXb2hBINUv3vb9Z_QNAKFVJKxXqmL9tT59c
1435	54236	19	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=1eStK8FkYKDFGoaqTPtx7tyBIyvvOeXppTGrKm8WuW4Y
1436	54236	19	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=1YCNJGfOqoX2p6AB8kanUUtMXJbPXfKaYQI9h6mtIJns
1437	54236	19	1276093	Допник ссылка	https://docs.google.com/document/d/1eStK8FkYKDFGoaqTPtx7tyBIyvvOeXppTGrKm8WuW4Y/edit
1438	54236	19	1280973	Email	Ksvru@mail.ru
1439	54236	19	1280975	Телефон	79036786785
1440	54236	19	1288635	Анкета	https://forms.amocrm.ru/rvdddwd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZJlZF9kIy42i-j97Yz0VbFc
1441	54236	57	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZJSKQ7mJk428ZA3QVpZsGWP
1442	54236	57	621947	Договор ссылка	https://docs.google.com/document/d/1gSPAbSqO2kGFU7avxL1QLzXYByiwvlUvc0rITnxdDFY/edit
1443	54236	57	627831	ФИО ученика	Маркин Алексей Алексеевич
1444	54236	57	627833	ФИО законного представителя	Маркина Галина Владимировна
1445	54236	57	627855	Дата договора	2023-12-01 00:00:00
1446	54236	57	627857	Номер договора	23/24 - 16
1447	54236	57	628669	Возраст на момент обращения	15 лет
1448	54236	57	628671	День рождения ученика	2008-10-06 00:00:00
1449	54236	57	628867	Интересующие продукты	Английский язык
1450	54236	57	793377	Заявление ссылка	https://docs.google.com/document/d/12qOpx1WRKhiSmRKV1Vx2t6JGl8CS-iPRQUQncNHlf5g/edit
1451	54236	57	816029	Категория студента	Ребенок
1452	54236	57	816079	Формат обучения	Очно
1453	54236	57	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=1gSPAbSqO2kGFU7avxL1QLzXYByiwvlUvc0rITnxdDFY
1454	54236	57	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=11tGiAuzYzHuGX_CH5-7-AM_v5tZY3aKnBIHWBeaKFMo
1455	54236	57	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=12qOpx1WRKhiSmRKV1Vx2t6JGl8CS-iPRQUQncNHlf5g
1456	54236	57	1276093	Допник ссылка	https://docs.google.com/document/d/11tGiAuzYzHuGX_CH5-7-AM_v5tZY3aKnBIHWBeaKFMo/edit
1457	54236	57	1280973	Email	alalmar@yandex.ru
1458	54236	57	1280975	Телефон	79265588880
1459	54236	57	1288635	Анкета	https://forms.amocrm.ru/rvdddwd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZJSKQ7mJk428ZA3QVpZsGWP
1460	54236	58	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZK16fLeAeJvT1DoW08ULMXx
1461	54236	58	621947	Договор ссылка	https://docs.google.com/document/d/1xHNFBrdWQfREBeHOcovvVIoggzGcGW0zbtQpIW4HP8s/edit
1462	54236	58	627831	ФИО ученика	Маркина Дарья Алексеевна
1463	54236	58	627833	ФИО законного представителя	Маркина Галина Владимировна
1464	54236	58	627855	Дата договора	2023-12-01 00:00:00
1465	54236	58	627857	Номер договора	23/24 - 17
1466	54236	58	628669	Возраст на момент обращения	12 лет +3мес
1467	54236	58	628671	День рождения ученика	2011-07-11 00:00:00
994	54236	6	604587	Источник	Звонки по рекомендации наших клиентов
995	54236	6	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpdILkpeO8b13muBgDzux56CsEl2B8q3zqwO_cL9MRd3V
996	54236	6	621947	Договор ссылка	https://docs.google.com/document/d/11_dqprn1Ofsl_5eQLGJN4grwcvPMqrb6oG6xTwO0XTo/edit
997	54236	6	622049	Счетчик НД	0
998	54236	6	627831	ФИО ученика	Жовтый Михаил Сергеевич
999	54236	6	627833	ФИО законного представителя	Жовтая Юлия Сергеевна
1000	54236	6	627855	Дата договора	2023-12-01 00:00:00
1001	54236	6	627857	Номер договора	23/24 - 7
1002	54236	6	628669	Возраст на момент обращения	7
1003	54236	6	628671	День рождения ученика	2016-04-20 00:00:00
1004	54236	6	628867	Интересующие продукты	Английский язык
1005	54236	6	628871	Филиал	Видное. Ольховая 4
1006	54236	6	628873	Комментарий	Скидка 4% на второго реб
1007	54236	6	629593	Цель обучения	Раннее изучение языка,Для углубленного изучения школьного предмета,Для улучшения успеваемости по школьному предмету
1008	54236	6	629659	Серия паспорта Представителя	38 05
1009	54236	6	629661	Номер паспорта Представителя	391466
1010	54236	6	629663	Дата выдачи Представитель	2006-08-04 00:00:00
1011	54236	6	629665	Кем выдан Представитель	ОТДЕЛОМ МИЛИЦИИ N2 УВД ГОРОДА КУРСКА
1012	54236	6	629667	Адрес места жительства Представитель	Город Видное улица Ольховая, дом 3 , квартира 31
1013	54236	6	752225	Дни занятий	Будни,Вторник,Четверг
1014	54236	6	752227	Время занятий	День,Вечер
1015	54236	6	793377	Заявление ссылка	https://docs.google.com/document/d/1wbzedHvIh6QIFXLS5Ykctc_Q_5nkDk5RHXX6QpGYUs4/edit
1016	54236	6	816029	Категория студента	Ребенок
1017	54236	6	816079	Формат обучения	Очно
1018	54236	6	1244533	Уровень владения	Никогда не изучал
1019	54236	6	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=11_dqprn1Ofsl_5eQLGJN4grwcvPMqrb6oG6xTwO0XTo
1020	54236	6	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=1k5MeLJpOUm74YzUMnKkDxLv9HmHnQBowLp-jbycoGFg
1021	54236	6	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=1wbzedHvIh6QIFXLS5Ykctc_Q_5nkDk5RHXX6QpGYUs4
1022	54236	6	1276093	Допник ссылка	https://docs.google.com/document/d/1k5MeLJpOUm74YzUMnKkDxLv9HmHnQBowLp-jbycoGFg/edit
1023	54236	6	1280973	Email	julka-anis@yandex.ru
1024	54236	6	1280975	Телефон	79175904068
1025	54236	49	604587	Источник	Звонки по рекомендации наших клиентов
1026	54236	49	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpdILkpeO8b13muBgDzux56CsEl2B8q3zqwO_cL9MRd3V
1027	54236	49	621947	Договор ссылка	https://docs.google.com/document/d/11_dqprn1Ofsl_5eQLGJN4grwcvPMqrb6oG6xTwO0XTo/edit
1028	54236	49	622049	Счетчик НД	0
1029	54236	49	627831	ФИО ученика	Жовтый Михаил Сергеевич
1030	54236	49	627833	ФИО законного представителя	Жовтая Юлия Сергеевна
1031	54236	49	627855	Дата договора	2023-12-01 00:00:00
1032	54236	49	627857	Номер договора	23/24 - 7
1033	54236	49	628669	Возраст на момент обращения	7
1034	54236	49	628671	День рождения ученика	2016-04-20 00:00:00
1035	54236	49	628867	Интересующие продукты	Английский язык
1036	54236	49	628871	Филиал	Видное. Ольховая 4
1037	54236	49	628873	Комментарий	Скидка 4% на второго реб
1038	54236	49	629593	Цель обучения	Раннее изучение языка,Для углубленного изучения школьного предмета,Для улучшения успеваемости по школьному предмету
1039	54236	49	629659	Серия паспорта Представителя	38 05
1040	54236	49	629661	Номер паспорта Представителя	391466
1041	54236	49	629663	Дата выдачи Представитель	2006-08-04 00:00:00
1042	54236	49	629665	Кем выдан Представитель	ОТДЕЛОМ МИЛИЦИИ N2 УВД ГОРОДА КУРСКА
1043	54236	49	629667	Адрес места жительства Представитель	Город Видное улица Ольховая, дом 3 , квартира 31
1044	54236	49	752225	Дни занятий	Будни,Вторник,Четверг
1045	54236	49	752227	Время занятий	День,Вечер
1046	54236	49	793377	Заявление ссылка	https://docs.google.com/document/d/1wbzedHvIh6QIFXLS5Ykctc_Q_5nkDk5RHXX6QpGYUs4/edit
1047	54236	49	816029	Категория студента	Ребенок
1048	54236	49	816079	Формат обучения	Очно
1049	54236	49	1244533	Уровень владения	Никогда не изучал
1050	54236	49	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=11_dqprn1Ofsl_5eQLGJN4grwcvPMqrb6oG6xTwO0XTo
1051	54236	49	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=1k5MeLJpOUm74YzUMnKkDxLv9HmHnQBowLp-jbycoGFg
1052	54236	49	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=1wbzedHvIh6QIFXLS5Ykctc_Q_5nkDk5RHXX6QpGYUs4
1053	54236	49	1276093	Допник ссылка	https://docs.google.com/document/d/1k5MeLJpOUm74YzUMnKkDxLv9HmHnQBowLp-jbycoGFg/edit
1054	54236	49	1280973	Email	julka-anis@yandex.ru
1055	54236	49	1280975	Телефон	79175904068
1056	54236	3	604587	Источник	Звонки по рекомендации наших клиентов
1057	54236	3	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpbW0wubEAg5-fp9kMq33v5upt_ZY-r43HMghW9CtUzT6
1058	54236	3	621947	Договор ссылка	https://docs.google.com/document/d/1sfjBGON4eR4eKbgd4oVi0Uph4muUbpPmTL0q_SU0rZ8/edit
1059	54236	3	622049	Счетчик НД	0
1060	54236	3	627831	ФИО ученика	Жовтая Таисия Сергеевна
1061	54236	3	627833	ФИО законного представителя	Жовтая Юлия Сергеевна
1062	54236	3	627855	Дата договора	2023-12-01 00:00:00
1063	54236	3	627857	Номер договора	23/24 - 6
1064	54236	3	628669	Возраст на момент обращения	12
1065	54236	3	628671	День рождения ученика	2012-07-08 00:00:00
1066	54236	3	628867	Интересующие продукты	Английский язык
1067	54236	3	628871	Филиал	Видное. Ольховая 4
1068	54236	3	628873	Комментарий	Сестра Влада, планируем в DW A1, занималась Go Getter 2? Pearson
1069	54236	3	629593	Цель обучения	Для углубленного изучения школьного предмета,Для улучшения успеваемости по школьному предмету
1070	54236	3	629659	Серия паспорта Представителя	38 05
1071	54236	3	629661	Номер паспорта Представителя	391466
1072	54236	3	629663	Дата выдачи Представитель	2006-08-04 00:00:00
1073	54236	3	629665	Кем выдан Представитель	ОТДЕЛОМ МИЛИЦИИ N2 УВД ГОРОДА КУРСКА
1074	54236	3	629667	Адрес места жительства Представитель	Город Видное улица Ольховая , дом 3, квартира 31
1075	54236	3	752225	Дни занятий	Будни
1076	54236	3	752227	Время занятий	День,Вечер
1077	54236	3	793377	Заявление ссылка	https://docs.google.com/document/d/11hipC6jbijDa0w5ISRPqUiEYgLg7Gfr2p1j5ZrFax-8/edit
1078	54236	3	816029	Категория студента	Ребенок
1079	54236	3	816079	Формат обучения	Очно
1080	54236	3	1244533	Уровень владения	Pre-A1
1081	54236	3	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=1sfjBGON4eR4eKbgd4oVi0Uph4muUbpPmTL0q_SU0rZ8
1082	54236	3	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=1apU_onEUFnjIRGJ858IGYWD4kQ6nBd0jACRG8twCK9g
1083	54236	3	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=11hipC6jbijDa0w5ISRPqUiEYgLg7Gfr2p1j5ZrFax-8
1084	54236	3	1276093	Допник ссылка	https://docs.google.com/document/d/1apU_onEUFnjIRGJ858IGYWD4kQ6nBd0jACRG8twCK9g/edit
1085	54236	3	1280973	Email	julka-anis@yandex.ru
1086	54236	3	1280975	Телефон	79175904068
1087	54236	50	604587	Источник	Звонки по рекомендации наших клиентов
1088	54236	50	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpbW0wubEAg5-fp9kMq33v5upt_ZY-r43HMghW9CtUzT6
1089	54236	50	621947	Договор ссылка	https://docs.google.com/document/d/1sfjBGON4eR4eKbgd4oVi0Uph4muUbpPmTL0q_SU0rZ8/edit
1090	54236	50	622049	Счетчик НД	0
1091	54236	50	627831	ФИО ученика	Жовтая Таисия Сергеевна
1092	54236	50	627833	ФИО законного представителя	Жовтая Юлия Сергеевна
1093	54236	50	627855	Дата договора	2023-12-01 00:00:00
1094	54236	50	627857	Номер договора	23/24 - 6
1095	54236	50	628669	Возраст на момент обращения	12
1096	54236	50	628671	День рождения ученика	2012-07-08 00:00:00
1097	54236	50	628867	Интересующие продукты	Английский язык
1098	54236	50	628871	Филиал	Видное. Ольховая 4
1099	54236	50	628873	Комментарий	Сестра Влада, планируем в DW A1, занималась Go Getter 2? Pearson
1100	54236	50	629593	Цель обучения	Для углубленного изучения школьного предмета,Для улучшения успеваемости по школьному предмету
1101	54236	50	629659	Серия паспорта Представителя	38 05
1102	54236	50	629661	Номер паспорта Представителя	391466
1103	54236	50	629663	Дата выдачи Представитель	2006-08-04 00:00:00
1104	54236	50	629665	Кем выдан Представитель	ОТДЕЛОМ МИЛИЦИИ N2 УВД ГОРОДА КУРСКА
1105	54236	50	629667	Адрес места жительства Представитель	Город Видное улица Ольховая , дом 3, квартира 31
1106	54236	50	752225	Дни занятий	Будни
1107	54236	50	752227	Время занятий	День,Вечер
1108	54236	50	793377	Заявление ссылка	https://docs.google.com/document/d/11hipC6jbijDa0w5ISRPqUiEYgLg7Gfr2p1j5ZrFax-8/edit
1109	54236	50	816029	Категория студента	Ребенок
1110	54236	50	816079	Формат обучения	Очно
1111	54236	50	1244533	Уровень владения	Pre-A1
1112	54236	50	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=1sfjBGON4eR4eKbgd4oVi0Uph4muUbpPmTL0q_SU0rZ8
1113	54236	50	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=1apU_onEUFnjIRGJ858IGYWD4kQ6nBd0jACRG8twCK9g
1114	54236	50	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=11hipC6jbijDa0w5ISRPqUiEYgLg7Gfr2p1j5ZrFax-8
1115	54236	50	1276093	Допник ссылка	https://docs.google.com/document/d/1apU_onEUFnjIRGJ858IGYWD4kQ6nBd0jACRG8twCK9g/edit
1116	54236	50	1280973	Email	julka-anis@yandex.ru
1117	54236	50	1280975	Телефон	79175904068
1118	54236	2	64259	referrer	https://languagestudio-vienna.ru/anglijskij/
1119	54236	2	604587	Источник	Сайт заявка
1120	54236	2	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpW7Gj96pV8k6MzgJnwrZjqE1z34jm1tudMRMfL8wy_RE
1121	54236	2	621947	Договор ссылка	https://docs.google.com/document/d/1fMDe5cAfsKdPGbo9vn9ZuCRZyJG7mAr9oCuhIIr2Yds/edit
1122	54236	2	622049	Счетчик НД	0
1123	54236	2	627831	ФИО ученика	Шевченко Милана Сергеевна
1124	54236	2	627833	ФИО законного представителя	Белашова Прасковья Николаевна
1125	54236	2	627855	Дата договора	2023-12-01 00:00:00
1126	54236	2	627857	Номер договора	23/24 - 60
1127	54236	2	628669	Возраст на момент обращения	6лет и 8лет 3 кл
1128	54236	2	628671	День рождения ученика	2014-09-23 00:00:00
1129	54236	2	628867	Интересующие продукты	Английский язык
1130	54236	2	628871	Филиал	Видное. Ольховая 4
1131	54236	2	628873	Комментарий	2 ребенка 6 лет и 8 лет 3кл
1468	54236	58	628867	Интересующие продукты	Английский язык
1132	54236	2	629593	Цель обучения	Раннее изучение языка,Для улучшения успеваемости по школьному предмету
1133	54236	2	629659	Серия паспорта Представителя	4606
1134	54236	2	629661	Номер паспорта Представителя	845166
1135	54236	2	629663	Дата выдачи Представитель	2005-07-09 00:00:00
1136	54236	2	629665	Кем выдан Представитель	Красносельским ПОМ УВД г.Подольска и Подольского р-на Московской обл.
1137	54236	2	629667	Адрес места жительства Представитель	г.Видное, ул. Завидна, д.8, кв.33
1138	54236	2	752227	Время занятий	День,Вечер
1139	54236	2	793377	Заявление ссылка	https://docs.google.com/document/d/1DTof-hFFy3DH3p6AlTq437cG1N3ZgG2cmykuMSNngpk/edit
1140	54236	2	816029	Категория студента	Ребенок
1141	54236	2	816079	Формат обучения	Очно
1142	54236	2	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=1fMDe5cAfsKdPGbo9vn9ZuCRZyJG7mAr9oCuhIIr2Yds
1143	54236	2	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=1WVCr6ohDSigohGpJ5MRpvvyrQdS7xeDRXVXBgFqVK24
1144	54236	2	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=1DTof-hFFy3DH3p6AlTq437cG1N3ZgG2cmykuMSNngpk
1145	54236	2	1276093	Допник ссылка	https://docs.google.com/document/d/1WVCr6ohDSigohGpJ5MRpvvyrQdS7xeDRXVXBgFqVK24/edit
1146	54236	2	1276589	Дата задачи	2023-12-13 00:00:00
1147	54236	2	1280973	Email	2723696b@gmail.com
1148	54236	2	1280975	Телефон	79262723696
1149	54236	51	64259	referrer	https://languagestudio-vienna.ru/anglijskij/
1150	54236	51	604587	Источник	Сайт заявка
1151	54236	51	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpW7Gj96pV8k6MzgJnwrZjqE1z34jm1tudMRMfL8wy_RE
1152	54236	51	621947	Договор ссылка	https://docs.google.com/document/d/1fMDe5cAfsKdPGbo9vn9ZuCRZyJG7mAr9oCuhIIr2Yds/edit
1153	54236	51	622049	Счетчик НД	0
1154	54236	51	627831	ФИО ученика	Шевченко Милана Сергеевна
1155	54236	51	627833	ФИО законного представителя	Белашова Прасковья Николаевна
1156	54236	51	627855	Дата договора	2023-12-01 00:00:00
1157	54236	51	627857	Номер договора	23/24 - 60
1158	54236	51	628669	Возраст на момент обращения	6лет и 8лет 3 кл
1159	54236	51	628671	День рождения ученика	2014-09-23 00:00:00
1160	54236	51	628867	Интересующие продукты	Английский язык
1161	54236	51	628871	Филиал	Видное. Ольховая 4
1162	54236	51	628873	Комментарий	2 ребенка 6 лет и 8 лет 3кл
1163	54236	51	629593	Цель обучения	Раннее изучение языка,Для улучшения успеваемости по школьному предмету
1164	54236	51	629659	Серия паспорта Представителя	4606
1165	54236	51	629661	Номер паспорта Представителя	845166
1166	54236	51	629663	Дата выдачи Представитель	2005-07-09 00:00:00
1167	54236	51	629665	Кем выдан Представитель	Красносельским ПОМ УВД г.Подольска и Подольского р-на Московской обл.
1168	54236	51	629667	Адрес места жительства Представитель	г.Видное, ул. Завидна, д.8, кв.33
1169	54236	51	752227	Время занятий	День,Вечер
1170	54236	51	793377	Заявление ссылка	https://docs.google.com/document/d/1DTof-hFFy3DH3p6AlTq437cG1N3ZgG2cmykuMSNngpk/edit
1171	54236	51	816029	Категория студента	Ребенок
1172	54236	51	816079	Формат обучения	Очно
1173	54236	51	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=1fMDe5cAfsKdPGbo9vn9ZuCRZyJG7mAr9oCuhIIr2Yds
1174	54236	51	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=1WVCr6ohDSigohGpJ5MRpvvyrQdS7xeDRXVXBgFqVK24
1175	54236	51	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=1DTof-hFFy3DH3p6AlTq437cG1N3ZgG2cmykuMSNngpk
1176	54236	51	1276093	Допник ссылка	https://docs.google.com/document/d/1WVCr6ohDSigohGpJ5MRpvvyrQdS7xeDRXVXBgFqVK24/edit
1177	54236	51	1276589	Дата задачи	2023-12-13 00:00:00
1178	54236	51	1280973	Email	2723696b@gmail.com
1179	54236	51	1280975	Телефон	79262723696
1469	54236	58	628871	Филиал	Видное. Ольховая 4
1470	54236	58	629593	Цель обучения	Для углубленного изучения школьного предмета
1471	54236	58	629659	Серия паспорта Представителя	4508
1472	54236	58	629661	Номер паспорта Представителя	319426
1473	54236	58	629663	Дата выдачи Представитель	2006-01-25 00:00:00
1474	54236	58	629665	Кем выдан Представитель	ОВД Нагатино-Садовники г.Москвы
1475	54236	58	629667	Адрес места жительства Представитель	г.Видное, ул.Завидная, д.6, кв.89
1476	54236	58	793377	Заявление ссылка	https://docs.google.com/document/d/1XBkr7aTaeHblDy6Y7icNSVC8bldPMWDKNxRVWLOivwc/edit
1477	54236	58	816029	Категория студента	Ребенок
1478	54236	58	816079	Формат обучения	Очно
1479	54236	58	1244533	Уровень владения	А2
1480	54236	58	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=1xHNFBrdWQfREBeHOcovvVIoggzGcGW0zbtQpIW4HP8s
1546	54236	69	622049	Счетчик НД	0
1547	54236	66	622049	Счетчик НД	0
1513	54236	60	621945	Анкета ссылка	https://forms.amocrm.ru/rrvcvrd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZI9hmeyHpukZzx1Sf5-D76R
1514	54236	60	621947	Договор ссылка	https://docs.google.com/document/d/1d0y_8a2gEXUTawGEUFF4oMDMvqMFQPsd5WQ2XetIM5s/edit
1515	54236	60	627831	ФИО ученика	Мизинова Елизавета Сергеевна
1516	54236	60	627833	ФИО законного представителя	Мизинова Ольга Михайловна
1517	54236	60	627855	Дата договора	2023-12-01 00:00:00
1518	54236	60	627857	Номер договора	23/24 - 19
1519	54236	60	628669	Возраст на момент обращения	12 лет +8мес
1520	54236	60	628671	День рождения ученика	2011-02-20 00:00:00
1521	54236	60	628867	Интересующие продукты	Английский язык
1522	54236	60	629659	Серия паспорта Представителя	4621
1523	54236	60	629661	Номер паспорта Представителя	333709
1524	54236	60	629663	Дата выдачи Представитель	2021-09-30 00:00:00
1525	54236	60	629665	Кем выдан Представитель	ГУ МВД по московской области
1526	54236	60	629667	Адрес места жительства Представитель	Видное, ул. Ольховая, 11
1527	54236	60	793377	Заявление ссылка	https://docs.google.com/document/d/1ZovpHbBhmmKoYAW6tokMWDsey2_F0ffPfr3SpZ_AGv8/edit
1528	54236	60	816029	Категория студента	Ребенок
1529	54236	60	816079	Формат обучения	Очно
1530	54236	60	1275465	Ссылка на PDF договора	https://docs.google.com/document/export?format=pdf&id=1d0y_8a2gEXUTawGEUFF4oMDMvqMFQPsd5WQ2XetIM5s
1531	54236	60	1276089	Ссылка на PDF допника	https://docs.google.com/document/export?format=pdf&id=1JBGoSC9Tw5EUA02MYxliVmMaf2-ACPbmqunkPPOe2GE
1532	54236	60	1276091	Ссылка на PDF заявления	https://docs.google.com/document/export?format=pdf&id=1ZovpHbBhmmKoYAW6tokMWDsey2_F0ffPfr3SpZ_AGv8
1533	54236	60	1276093	Допник ссылка	https://docs.google.com/document/d/1JBGoSC9Tw5EUA02MYxliVmMaf2-ACPbmqunkPPOe2GE/edit
1534	54236	60	1280973	Email	Mizinov@bk.ru
1535	54236	60	1280975	Телефон	79057898729
1536	54236	60	1288635	Анкета	https://forms.amocrm.ru/rvdddwd?dp=Q1zaSQHqO-hHArUG1UMtpTQncxnrLhIE2_0Iv3-fkZI9hmeyHpukZzx1Sf5-D76R
1549	54236	66	628671	День рождения ученика	2010-10-10 00:00:00
1550	54236	66	1276589	Дата задачи	2023-12-19 00:00:00
1551	54236	66	1280973	Email	artur-borisov-85@mail.ru
1552	54236	66	1280975	Телефон	79266877459
1553	54236	70	622049	Счетчик НД	0
\.


--
-- TOC entry 4219 (class 0 OID 621562)
-- Dependencies: 297
-- Data for Name: amocrm_leads_elements_facts; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_leads_elements_facts (id, account_id, clientids_id, users_id, elements_id, leads_id, contacts_id, companies_id, created_id, closed_id) FROM stdin;
\.


--
-- TOC entry 4221 (class 0 OID 621612)
-- Dependencies: 299
-- Data for Name: amocrm_leads_events; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_leads_events (id, account_id, leads_id, event_id, type, created_by, created_at, value_after, value_before) FROM stdin;
3	54236	29	01hgzj6289s2fhgwd1xvtwrq57	lead_status_changed	0	2023-12-06 15:38:29	[{"lead_status": {"id": 59517698, "pipeline_id": 6672930}}]	[{"lead_status": {"id": 56564474, "pipeline_id": 6672930}}]
4	54236	29	01hgzj5qkrjcawk3cn0hfvt6qp	lead_added	0	2023-12-06 15:38:19	[]	[]
5	54236	28	01hgz792cgn7a35e7386nw8456	lead_added	9475262	2023-12-06 12:27:54	[]	[]
121	54236	54	01hhpmgs1gev09qk32ryazk3mg	lead_added	9475262	2023-12-15 14:41:50	[]	[]
122	54236	53	01hhpeqaf8rsqqwnxrmrxhrdg2	lead_added	9475262	2023-12-15 13:00:33	[]	[]
131	54236	55	01hhw2kzw8qjc8jf8deq4w6vcd	lead_status_changed	0	2023-12-17 17:24:27	[{"lead_status": {"id": 59517698, "pipeline_id": 6672930}}]	[{"lead_status": {"id": 56564474, "pipeline_id": 6672930}}]
132	54236	55	01hhw2k7xrvm0j05msfdv65j6n	lead_added	0	2023-12-17 17:24:03	[]	[]
134	54236	66	01hhyvqrcpe50hx5g34g4wv01f	lead_added	9475262	2023-12-18 19:21:54	[]	[]
138	54236	64	01hhyj4d7rt66s2j1prk27867y	lead_added	9475262	2023-12-18 16:34:03	[]	[]
139	54236	63	01hhyantf83wgwnp9ejke344q7	lead_added	9475262	2023-12-18 14:23:45	[]	[]
25	54236	26	01hgwwj4m0nyh3fzj8n4mbek03	lead_added	9475262	2023-12-05 14:42:08	[]	[]
26	54236	25	01hgtt5k8rcvtcjw0vr8q8z9bk	lead_added	9475262	2023-12-04 19:21:51	[]	[]
27	54236	24	01hgts9gtr4jb3pgbc90scph2q	lead_added	9475262	2023-12-04 19:06:31	[]	[]
28	54236	23	01hgtkktc8ctfd0g9549940bv9	lead_added	9475262	2023-12-04 17:27:17	[]	[]
29	54236	22	01hgtfh2s8fz4vy50v51eq2zgh	lead_added	9475262	2023-12-04 16:15:53	[]	[]
30	54236	21	01hgmqeqjgtn14n5qb838xmrkk	lead_added	9475262	2023-12-02 10:38:58	[]	[]
31	54236	20	01hgk4kg98p0k3ra161zjah9c6	lead_added	0	2023-12-01 19:50:17	[]	[]
140	54236	62	01hhy9e2zr4yngw06hardj8b7c	lead_added	9475262	2023-12-18 14:02:03	[]	[]
141	54236	61	01hhxyayqg69xwdx4wy1d94xaq	lead_added	9475262	2023-12-18 10:48:06	[]	[]
34	54236	30	01hh2gtgggf2tgcmvpzb20cx2h	lead_added	9475262	2023-12-07 19:12:26	[]	[]
35	54236	2	01hh23kebdw0gz8gfn4wg0b4e8	lead_status_changed	0	2023-12-07 15:21:22	[{"lead_status": {"id": 56926886, "pipeline_id": 6672930}}]	[{"lead_status": {"id": 56926882, "pipeline_id": 6672930}}]
142	54236	70	01hj35fc4rq9qdx9wnezfs9nxp	lead_added	9475262	2023-12-20 11:29:03	[]	[]
143	54236	66	01hj0x8d5fffyc5wxnq6afs61a	lead_status_changed	0	2023-12-19 14:26:57	[{"lead_status": {"id": 56926882, "pipeline_id": 6672930}}]	[{"lead_status": {"id": 56564478, "pipeline_id": 6672930}}]
144	54236	69	01hj0vj0qr00w9nsmfymxg4vyt	lead_added	9475262	2023-12-19 13:57:15	[]	[]
145	54236	68	01hj0k6wwg4vyree7yjjnr8w14	lead_added	9475262	2023-12-19 11:31:22	[]	[]
40	54236	32	01hh4k76r0pt84y4hcfr7j12fd	lead_added	9475262	2023-12-08 14:32:48	[]	[]
41	54236	31	01hh4eb9frb7m1bx5pva9n78zq	lead_added	9475262	2023-12-08 13:07:39	[]	[]
42	54236	36	01hh7cdas0ejbbaaxekbq9n2hw	lead_added	9475262	2023-12-09 16:31:32	[]	[]
43	54236	34	01hh7cd4w1eprdgs95rqha1gt1	lead_status_changed	9475262	2023-12-09 16:31:25	[{"lead_status": {"id": 142, "pipeline_id": 6672930}}]	[{"lead_status": {"id": 57029974, "pipeline_id": 6672930}}]
44	54236	35	01hh7cbsygy9jp7qnfzt28d2z8	lead_added	9475262	2023-12-09 16:30:42	[]	[]
45	54236	33	01hh7cbjedgt490e6cmkt73149	lead_status_changed	9475262	2023-12-09 16:30:34	[{"lead_status": {"id": 142, "pipeline_id": 6672930}}]	[{"lead_status": {"id": 57029974, "pipeline_id": 6672930}}]
68	54236	41	01hhcv8mjrn4mny9srhartnzr8	lead_added	9475262	2023-12-11 19:27:19	[]	[]
69	54236	39	01hhcgkt72njwsnx4t05xnzb26	lead_status_changed	9475262	2023-12-11 16:21:10	[{"lead_status": {"id": 56926882, "pipeline_id": 6672930}}]	[{"lead_status": {"id": 58499938, "pipeline_id": 6672930}}]
70	54236	39	01hhcdkeb8n1zjkrgf0ak1csk2	lead_added	9475262	2023-12-11 15:28:33	[]	[]
71	54236	40	01hhcft058s0mch42y7zqk6jy7	lead_added	9475262	2023-12-11 16:07:05	[]	[]
72	54236	38	01hhc8kxvg1e5ezk4evacvxssw	lead_added	9475262	2023-12-11 14:01:26	[]	[]
73	54236	37	01hhbrdjy8j6bdak7py7f7d0dy	lead_added	9475262	2023-12-11 09:18:21	[]	[]
79	54236	2	01hhex7p2nrhvzqrsyxvy4v1mn	lead_status_changed	0	2023-12-12 14:40:13	[{"lead_status": {"id": 57029974, "pipeline_id": 6672930}}]	[{"lead_status": {"id": 56564490, "pipeline_id": 6672930}}]
80	54236	2	01hhex773vdaccznm5xja58psp	lead_status_changed	9475262	2023-12-12 14:39:58	[{"lead_status": {"id": 56564490, "pipeline_id": 6672930}}]	[{"lead_status": {"id": 56564486, "pipeline_id": 6672930}}]
81	54236	2	01hhewbqc4rwggvhcthvkfkj12	lead_status_changed	0	2023-12-12 14:24:57	[{"lead_status": {"id": 56564486, "pipeline_id": 6672930}}]	[{"lead_status": {"id": 56926886, "pipeline_id": 6672930}}]
96	54236	43	01hhf6229g16qrd8s8pzf4batk	lead_status_changed	0	2023-12-12 17:14:26	[{"lead_status": {"id": 56926902, "pipeline_id": 6726822}}]	[{"lead_status": {"id": 143, "pipeline_id": 6672930}}]
97	54236	43	01hhf61jem52pmrp61z449as63	lead_status_changed	9475262	2023-12-12 17:14:10	[{"lead_status": {"id": 143, "pipeline_id": 6672930}}]	[{"lead_status": {"id": 56564478, "pipeline_id": 6672930}}]
100	54236	51	01hhhn1v38jv5za1y02skxamps	lead_added	0	2023-12-13 16:14:57	[]	[]
101	54236	2	01hhhn1rjeagkk460h0k9z4rkm	lead_status_changed	0	2023-12-13 16:14:54	[{"lead_status": {"id": 142, "pipeline_id": 6672930}}]	[{"lead_status": {"id": 56926894, "pipeline_id": 6672930}}]
102	54236	2	01hhhn1kqcd7nev6494x61ka28	lead_status_changed	0	2023-12-13 16:14:49	[{"lead_status": {"id": 56926894, "pipeline_id": 6672930}}]	[{"lead_status": {"id": 57029974, "pipeline_id": 6672930}}]
103	54236	2	01hhhkne6726kzpp48m4bybefy	lead_status_changed	0	2023-12-13 15:50:41	[{"lead_status": {"id": 57029974, "pipeline_id": 6672930}}]	[{"lead_status": {"id": 56564490, "pipeline_id": 6672930}}]
104	54236	2	01hhhkmyrqvsxwrb541xm60qn6	lead_status_changed	0	2023-12-13 15:50:26	[{"lead_status": {"id": 56564490, "pipeline_id": 6672930}}]	[{"lead_status": {"id": 57029974, "pipeline_id": 6672930}}]
105	54236	50	01hhhh85hgzyv7f3kw4fet90dh	lead_added	9475262	2023-12-13 15:08:30	[]	[]
106	54236	3	01hhhh835c3zs0x5h2vtvjyges	lead_status_changed	9475262	2023-12-13 15:08:27	[{"lead_status": {"id": 142, "pipeline_id": 6672930}}]	[{"lead_status": {"id": 57029974, "pipeline_id": 6672930}}]
107	54236	49	01hhhh5bpgbv6954kz0nk3n6sj	lead_added	9475262	2023-12-13 15:06:58	[]	[]
108	54236	6	01hhhh58eza9d0t3k5248mhztc	lead_status_changed	9475262	2023-12-13 15:06:54	[{"lead_status": {"id": 142, "pipeline_id": 6672930}}]	[{"lead_status": {"id": 57029974, "pipeline_id": 6672930}}]
\.


--
-- TOC entry 4223 (class 0 OID 621630)
-- Dependencies: 301
-- Data for Name: amocrm_leads_facts; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_leads_facts (id, account_id, clientids_id, traffic_id, users_id, leads_id, contacts_id, companies_id, unsorteds_id, created_id, closed_id, price) FROM stdin;
2	54236	1	1	2	20	19	1	1	94	9	0.00
3	54236	1	1	2	21	20	1	1	95	9	0.00
4	54236	1	1	2	9	8	1	1	91	9	38400.00
5	54236	1	1	2	10	9	1	1	91	9	38400.00
6	54236	1	1	2	12	11	1	1	92	9	43800.00
7	54236	1	1	2	13	18	1	1	92	9	52800.00
10	54236	1	1	2	14	12	1	1	92	9	38400.00
11	54236	1	1	2	15	13	1	1	92	9	50400.00
12	54236	1	1	2	16	14	1	1	92	9	52800.00
13	54236	1	1	2	17	15	1	1	93	9	41400.00
14	54236	1	1	2	4	5	1	1	87	9	0.00
15	54236	1	1	2	7	7	1	1	90	9	0.00
16	54236	1	1	2	22	21	1	1	96	9	0.00
17	54236	1	1	2	23	22	1	1	97	9	0.00
18	54236	1	1	2	24	23	1	1	98	9	0.00
19	54236	1	1	2	25	24	1	1	99	9	0.00
20	54236	1	1	2	18	16	1	1	93	9	38400.00
22	54236	1	1	2	5	6	1	1	88	9	7300.00
23	54236	1	1	2	26	25	1	1	100	9	0.00
25	54236	1	1	2	28	27	1	1	102	9	0.00
26	54236	1	1	2	29	28	1	1	103	9	0.00
28	54236	1	1	2	30	29	1	1	104	9	0.00
30	54236	1	1	2	31	30	1	1	128	9	0.00
31	54236	1	1	2	32	31	1	1	129	9	0.00
32	54236	1	1	2	33	32	1	1	134	138	0.00
33	54236	1	1	2	35	32	1	1	136	9	0.00
34	54236	1	1	2	34	32	1	1	135	139	0.00
35	54236	1	1	2	36	32	1	1	137	9	0.00
36	54236	1	1	2	37	36	1	1	164	9	0.00
37	54236	1	1	2	38	37	1	1	165	9	0.00
38	54236	1	1	2	40	39	1	1	167	9	0.00
39	54236	1	1	2	39	38	1	1	166	9	0.00
40	54236	1	1	2	41	41	1	1	168	9	0.00
41	54236	1	1	2	42	42	1	1	183	9	0.00
42	54236	1	1	2	43	44	1	1	184	9	0.00
9	54236	1	1	2	6	4	1	1	89	208	0.00
45	54236	1	1	2	49	4	1	1	205	9	0.00
8	54236	1	1	2	3	4	1	1	86	209	0.00
46	54236	1	1	2	50	4	1	1	206	9	0.00
27	54236	1	1	2	2	2	1	1	85	210	0.00
47	54236	1	1	2	51	2	1	1	207	9	0.00
52	54236	1	1	2	53	46	1	1	219	9	0.00
53	54236	1	1	2	54	47	1	1	220	9	0.00
54	54236	1	1	2	55	48	1	1	223	9	0.00
55	54236	1	1	2	61	54	1	1	243	9	0.00
56	54236	1	1	2	62	55	1	1	244	9	0.00
57	54236	1	1	2	63	56	1	1	245	9	0.00
21	54236	1	1	2	11	10	1	1	91	9	38400.00
58	54236	1	1	2	64	57	1	1	246	9	0.00
59	54236	1	1	2	56	49	1	1	92	9	38400.00
1	54236	1	1	2	19	17	1	1	93	9	52800.00
60	54236	1	1	2	57	52	1	1	93	9	52800.00
61	54236	1	1	2	66	58	1	1	247	9	0.00
62	54236	1	1	2	58	53	1	1	241	9	50100.00
63	54236	1	1	2	59	50	1	1	241	9	43800.00
64	54236	1	1	2	60	51	1	1	242	9	52800.00
66	54236	1	1	2	68	60	1	1	266	9	0.00
67	54236	1	1	2	69	61	1	1	267	9	0.00
69	54236	1	1	2	70	62	1	1	275	9	0.00
\.


--
-- TOC entry 4225 (class 0 OID 621687)
-- Dependencies: 303
-- Data for Name: amocrm_leads_notes; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_leads_notes (id, account_id, leads_id, creator_id, responsible_id, note_id, note_type, note_type_id, created_at, updated_at, text, params) FROM stdin;
\.


--
-- TOC entry 4227 (class 0 OID 621705)
-- Dependencies: 305
-- Data for Name: amocrm_leads_tags; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_leads_tags (id, account_id, leads_id, tag_id, name) FROM stdin;
3	54236	9	136595	Оформление договора
4	54236	9	167879	импорт_17112023_1852
5	54236	10	136595	Оформление договора
6	54236	10	167879	импорт_17112023_1852
7	54236	12	136595	Оформление договора
8	54236	12	167879	импорт_17112023_1852
9	54236	13	136595	Оформление договора
10	54236	13	167879	импорт_17112023_1852
18	54236	14	136595	Оформление договора
19	54236	14	167879	импорт_17112023_1852
20	54236	15	136595	Оформление договора
21	54236	15	167879	импорт_17112023_1852
22	54236	16	136595	Оформление договора
23	54236	16	167879	импорт_17112023_1852
24	54236	17	136595	Оформление договора
25	54236	17	167879	импорт_17112023_1852
26	54236	4	37175	Яндекс Бизнес
27	54236	4	37861	Заявка с сайта
28	54236	7	29115	ПУ проведен
29	54236	7	29125	ПУ назначен
30	54236	7	136591	На оплате
31	54236	7	136595	Оформление договора
32	54236	18	136595	Оформление договора
33	54236	18	167879	импорт_17112023_1852
36	54236	5	136591	На оплате
37	54236	5	136595	Оформление договора
38	54236	5	136599	Оплачено
185	54236	11	136595	Оформление договора
186	54236	11	167879	импорт_17112023_1852
187	54236	56	136595	Оформление договора
188	54236	56	167879	импорт_17112023_1852
189	54236	19	136595	Оформление договора
190	54236	19	167879	импорт_17112023_1852
191	54236	57	136595	Оформление договора
192	54236	57	167879	импорт_17112023_1852
193	54236	58	136595	Оформление договора
194	54236	58	167879	импорт_17112023_1852
195	54236	59	136595	Оформление договора
196	54236	59	167879	импорт_17112023_1852
197	54236	60	136595	Оформление договора
198	54236	60	167879	импорт_17112023_1852
200	54236	66	29113	Квалифицирован
66	54236	33	29113	Квалифицирован
67	54236	33	29125	ПУ назначен
68	54236	33	136591	На оплате
69	54236	33	136595	Оформление договора
70	54236	35	29113	Квалифицирован
71	54236	35	29125	ПУ назначен
72	54236	35	136591	На оплате
73	54236	35	136595	Оформление договора
74	54236	34	29115	ПУ проведен
75	54236	34	29125	ПУ назначен
76	54236	34	136591	На оплате
77	54236	34	136595	Оформление договора
78	54236	36	29115	ПУ проведен
79	54236	36	29125	ПУ назначен
80	54236	36	136591	На оплате
81	54236	36	136595	Оформление договора
94	54236	39	29113	Квалифицирован
108	54236	43	37861	Заявка с сайта
143	54236	6	29125	ПУ назначен
144	54236	6	136591	На оплате
145	54236	6	136595	Оформление договора
146	54236	49	29125	ПУ назначен
147	54236	49	136591	На оплате
148	54236	49	136595	Оформление договора
149	54236	3	29115	ПУ проведен
150	54236	3	29125	ПУ назначен
151	54236	3	136591	На оплате
152	54236	3	136595	Оформление договора
153	54236	50	29115	ПУ проведен
154	54236	50	29125	ПУ назначен
155	54236	50	136591	На оплате
156	54236	50	136595	Оформление договора
157	54236	2	29113	Квалифицирован
158	54236	2	29115	ПУ проведен
159	54236	2	29125	ПУ назначен
160	54236	2	37861	Заявка с сайта
161	54236	2	136591	На оплате
162	54236	2	136595	Оформление договора
163	54236	2	136599	Оплачено
164	54236	51	29113	Квалифицирован
165	54236	51	29115	ПУ проведен
166	54236	51	29125	ПУ назначен
167	54236	51	37861	Заявка с сайта
168	54236	51	136591	На оплате
169	54236	51	136595	Оформление договора
170	54236	51	136599	Оплачено
\.


--
-- TOC entry 4169 (class 0 OID 621095)
-- Dependencies: 247
-- Data for Name: amocrm_pipelines; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_pipelines (id, account_id, pipeline_id, name, sort, is_main, is_unsorted_on, is_archive) FROM stdin;
1	54236	6672930	Первичные продажи	1	t	t	f
2	54236	7125654	Активные клиенты	2	f	t	f
3	54236	6726822	Лист ожидания	3	f	t	f
4	54236	6726826	База отказов	4	f	t	f
5	54236	6960118	ТЕСТ	5	f	t	f
\.


--
-- TOC entry 4171 (class 0 OID 621104)
-- Dependencies: 249
-- Data for Name: amocrm_statuses; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_statuses (id, account_id, pipeline_id, status_id, name, color, sort, is_editable, type) FROM stdin;
2	54236	6672930	56564478	Не разобрано (заявки)	#98cbff	20	t	0
3	54236	6672930	59517698	Не разобрано (чаты)	#99ccff	30	t	0
4	54236	6672930	58499938	Не разобрано (Sipuni)	#98cbff	40	t	0
5	54236	6672930	56564482	Недозвон	#ff8f92	50	t	0
6	54236	6672930	58501026	На удаление/склейка	#c1e0ff	60	t	0
7	54236	6672930	59085426	Повторный звонок	#c1e0ff	70	t	0
8	54236	6672930	56926882	Подбор времени	#c1e0ff	80	t	0
9	54236	6672930	56926886	Записан на ПУ	#d6eaff	90	t	0
10	54236	6672930	56564486	ПУ проведен	#d6eaff	100	t	0
11	54236	6672930	56926890	На пу не пришел	#ffc8c8	110	t	0
12	54236	6672930	56564490	Абонемент согласован/Счет выставлен	#fffd7f	120	t	0
13	54236	6672930	57029974	Запрос данных для договора	#fff000	130	t	0
14	54236	6672930	57031990	Генерация договора/Lightdoc	#fff000	140	t	0
15	54236	6672930	57394410	Договор подписан	#deff81	150	t	0
16	54236	6672930	56926894	Оплата получена	#deff81	160	t	0
17	54236	6672930	142	Успешно реализовано	#CCFF66	10000	f	0
18	54236	6672930	143	Закрыто и не реализовано	#D5D8DB	11000	f	0
20	54236	7125654	59611714	В работе	#99ccff	20	t	0
21	54236	7125654	142	Успешно реализовано	#CCFF66	10000	f	0
22	54236	7125654	143	Закрыто и не реализовано	#D5D8DB	11000	f	0
24	54236	6726822	56926902	В ожидании группы	#99ccff	20	t	0
25	54236	6726822	58546510	На активацию	#99ccff	30	t	0
26	54236	6726822	142	Успешно реализовано	#CCFF66	10000	f	0
27	54236	6726822	143	Закрыто и не реализовано	#D5D8DB	11000	f	0
29	54236	6726826	56926918	Архив	#99ccff	20	t	0
30	54236	6726826	142	Успешно реализовано	#CCFF66	10000	f	0
31	54236	6726826	143	Закрыто и не реализовано	#D5D8DB	11000	f	0
33	54236	6960118	58497802	Первичный контакт	#99ccff	20	t	0
34	54236	6960118	58497806	Переговоры	#ffff99	30	t	0
35	54236	6960118	58497810	Принимают решение	#ffcc66	40	t	0
36	54236	6960118	142	Успешно реализовано	#CCFF66	10000	f	0
37	54236	6960118	143	Закрыто и не реализовано	#D5D8DB	11000	f	0
1	54236	6672930	56564474	Неразобранное	#c1c1c1	10	f	1
19	54236	7125654	59611710	Неразобранное	#c1c1c1	10	f	1
23	54236	6726822	56926898	Неразобранное	#c1c1c1	10	f	1
28	54236	6726826	56926914	Неразобранное	#c1c1c1	10	f	1
32	54236	6960118	58497798	Неразобранное	#c1c1c1	10	f	1
\.


--
-- TOC entry 4173 (class 0 OID 621113)
-- Dependencies: 251
-- Data for Name: amocrm_tasks; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_tasks (id, account_id, task_id, task_type, text, result, status_code, is_deleted) FROM stdin;
1	54236	0	\N	\N	\N	0	f
2	54236	11555459	Горячий лид	Взять лид в работу!	\N	0	f
3	54236	11560701	Горячий лид	Взять лид в работу!	\N	0	f
4	54236	11592941	Звонок	Созвониться с лидом, для повторной квалификации.	\N	0	f
5	54236	11613459	Горячий лид	Взять лид в работу!	\N	0	f
6	54236	11613471	Звонок	79090751195	\N	0	f
7	54236	11616107	Горячий лид	Взять лид в работу!	\N	0	f
8	54236	11616111	Звонок	79692100664	\N	0	f
9	54236	11618407	Горячий лид	Взять лид в работу!	\N	0	f
10	54236	11618765	Горячий лид	Взять лид в работу!	\N	0	f
11	54236	11641821	Горячий лид	Взять лид в работу!	\N	0	f
12	54236	11641839	Звонок	79651630839	\N	0	f
27	54236	11666277	Звонок	79282799328	\N	0	f
28	54236	11666299	Горячий лид	Взять лид в работу!	\N	0	f
29	54236	11676043	Горячий лид	Взять лид в работу!	\N	0	f
30	54236	11717049	Горячий лид	Взять лид в работу!	\N	0	f
31	54236	11717059	Звонок	79993966902	\N	0	f
32	54236	11733257	Горячий лид	Взять лид в работу!	\N	0	f
33	54236	11733269	Звонок	79068661806	\N	0	f
34	54236	11737011	Горячий лид	Взять лид в работу!	\N	0	f
35	54236	9164681	Звонок	Проверить заполнение анкеты клиентом.	\N	1	f
36	54236	9376861	Звонок	Проверить заполнение анкеты клиентом.	\N	1	f
37	54236	11784887	Горячий лид	Взять лид в работу!	\N	0	f
38	54236	11784903	Звонок	79391111249	\N	0	f
39	54236	11799259	Горячий лид	Взять лид в работу!	\N	0	f
40	54236	11803781	Горячий лид	Взять лид в работу!	\N	1	f
41	54236	11805491	Горячий лид	Взять лид в работу!	\N	0	f
42	54236	11812343	Горячий лид	Взять лид в работу!	\N	0	f
43	54236	11812349	Звонок	79030921448	\N	0	f
44	54236	11420129	Горячий лид	Взять лид в работу!	\N	1	f
45	54236	11835681	Звонок	Необходимо связаться с клиентом для обратной связи по проведенному пробному уроку и дальнейшему сотрудничеству.	\N	1	f
46	54236	11836461	Обработка лида	Проверить заполнение анкеты клиентом.	\N	1	f
52	54236	11871631	Обработка лида	Проверить заполнение анкеты клиентом.	\N	0	f
53	54236	11927573	Горячий лид	Взять лид в работу!	\N	0	f
54	54236	11932281	Горячий лид	Взять лид в работу!	\N	0	f
55	54236	11972104	Горячий лид	Взять лид в работу!	\N	0	f
56	54236	11982044	Горячий лид	Взять лид в работу!	\N	0	f
57	54236	11990920	Горячий лид	Взять лид в работу!	\N	0	f
58	54236	11991960	Горячий лид	Взять лид в работу!	\N	0	f
59	54236	11991982	Звонок	79052150669	\N	0	f
60	54236	11997625	Горячий лид	Взять лид в работу!	\N	0	f
61	54236	12015553	Горячий лид	Взять лид в работу!	\N	0	f
62	54236	12015579	Звонок	79326980251	\N	0	f
63	54236	12022419	Горячий лид	Взять лид в работу!	\N	0	f
64	54236	12022435	Звонок	79774912420	\N	0	f
65	54236	12047287	Горячий лид	Взять лид в работу!	\N	0	f
66	54236	12047291	Звонок	79676970342	\N	0	f
\.


--
-- TOC entry 4229 (class 0 OID 621719)
-- Dependencies: 307
-- Data for Name: amocrm_tasks_events; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_tasks_events (id, account_id, tasks_id, event_id, type, created_by, created_at, value_after, value_before) FROM stdin;
\.


--
-- TOC entry 4231 (class 0 OID 621737)
-- Dependencies: 309
-- Data for Name: amocrm_tasks_facts; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_tasks_facts (id, account_id, users_id, contacts_id, companies_id, leads_id, customers_id, tasks_id, created_id, modified_id, completed_id, duration) FROM stdin;
1	54236	2	1	1	20	1	2	10	10	55	0
2	54236	2	1	1	21	1	3	11	40	56	0
3	54236	2	1	1	4	1	4	12	12	63	0
4	54236	2	1	1	22	1	5	13	13	58	0
5	54236	2	1	1	23	1	7	15	15	60	0
6	54236	2	1	1	24	1	9	17	17	61	0
7	54236	2	1	1	25	1	10	18	18	62	0
8	54236	2	1	1	26	1	11	19	41	65	0
23	54236	2	1	1	28	1	28	36	36	70	0
24	54236	2	1	1	29	1	29	37	37	71	0
25	54236	2	1	1	30	1	30	38	38	83	0
26	54236	2	21	1	1	1	6	14	14	57	0
27	54236	2	22	1	1	1	8	16	16	59	0
28	54236	2	25	1	1	1	12	20	20	64	0
29	54236	2	27	1	1	1	27	35	35	69	0
30	54236	2	29	1	1	1	31	39	39	82	0
31	54236	2	1	1	31	1	32	122	122	126	0
32	54236	2	1	1	32	1	34	124	124	127	0
33	54236	2	30	1	1	1	33	123	123	125	0
34	54236	2	1	1	33	1	35	130	132	130	0
35	54236	2	1	1	34	1	36	131	133	131	0
36	54236	2	1	1	37	1	37	149	149	158	0
37	54236	2	1	1	38	1	39	151	151	159	0
38	54236	2	1	1	40	1	41	153	153	161	0
39	54236	2	1	1	39	1	40	152	156	160	0
40	54236	2	1	1	41	1	42	154	154	163	0
41	54236	2	36	1	1	1	38	150	150	157	0
42	54236	2	41	1	1	1	43	155	155	162	0
43	54236	2	1	1	2	1	45	176	178	181	0
45	54236	2	1	1	43	1	44	175	179	180	0
44	54236	2	1	1	2	1	46	177	198	182	0
46	54236	2	1	1	2	1	52	193	193	203	0
52	54236	2	1	1	53	1	53	213	215	217	0
53	54236	2	1	1	54	1	54	214	216	218	0
54	54236	2	1	1	55	1	55	221	221	222	0
55	54236	2	1	1	61	1	56	229	234	236	0
56	54236	2	1	1	62	1	57	230	230	238	0
57	54236	2	1	1	63	1	58	231	235	239	0
58	54236	2	1	1	64	1	60	233	233	240	0
59	54236	2	56	1	1	1	59	232	232	237	0
60	54236	2	1	1	68	1	61	258	258	263	0
61	54236	2	1	1	69	1	63	260	260	265	0
62	54236	2	60	1	1	1	62	259	259	262	0
63	54236	2	61	1	1	1	64	261	261	264	0
64	54236	2	1	1	70	1	65	271	271	274	0
65	54236	2	62	1	1	1	66	272	272	273	0
\.


--
-- TOC entry 4233 (class 0 OID 621792)
-- Dependencies: 311
-- Data for Name: amocrm_tasks_notes; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_tasks_notes (id, account_id, tasks_id, creator_id, responsible_id, note_id, note_type, note_type_id, created_at, updated_at, text, params) FROM stdin;
\.


--
-- TOC entry 4175 (class 0 OID 621124)
-- Dependencies: 253
-- Data for Name: amocrm_transactions; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_transactions (id, account_id, transaction_id, comment) FROM stdin;
\.


--
-- TOC entry 4235 (class 0 OID 621810)
-- Dependencies: 313
-- Data for Name: amocrm_transactions_facts; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_transactions_facts (id, account_id, customers_id, transactions_id, dates_id, companies_id, contacts_id, users_id, price) FROM stdin;
\.


--
-- TOC entry 4177 (class 0 OID 621133)
-- Dependencies: 255
-- Data for Name: amocrm_unsorted; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_unsorted (id, account_id, unsorted_id, source_uid, source_name, category, unsorted_metadata, is_deleted) FROM stdin;
1	54236	0	\N	\N	\N	\N	f
\.


--
-- TOC entry 4179 (class 0 OID 621143)
-- Dependencies: 257
-- Data for Name: amocrm_users; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.amocrm_users (id, account_id, user_id, login, name, phone, group_name, email, is_admin, is_active, is_free, mail_access, catalog_access, role_id, role_name, group_id) FROM stdin;
1	54236	0	\N	\N	\N	\N	\N	f	f	f	f	f	0	\N	0
2	54236	9475262	sahingiray.n@gmail.com	Надежда	\N	Отдел продаж	sahingiray.n@gmail.com	t	t	f	t	t	0	\N	0
\.


--
-- TOC entry 4143 (class 0 OID 620897)
-- Dependencies: 214
-- Data for Name: general_accounts; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.general_accounts (id, account_id, caption, service, enabled, status, interval_start, interval_end) FROM stdin;
1	54236	Excellent School	amoCRM	t	успешно	2023-12-01	2023-12-21
\.


--
-- TOC entry 4145 (class 0 OID 620905)
-- Dependencies: 216
-- Data for Name: general_clientids; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.general_clientids (id, clientid, userid, phone, email) FROM stdin;
1	not available	\N	\N	\N
\.


--
-- TOC entry 4155 (class 0 OID 620950)
-- Dependencies: 226
-- Data for Name: general_costs_facts; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.general_costs_facts (id, account_id, dates_id, sites_id, traffic_id, impressions, clicks, cost, vat_included) FROM stdin;
\.


--
-- TOC entry 4147 (class 0 OID 620913)
-- Dependencies: 218
-- Data for Name: general_dates; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.general_dates (id, full_date, year, quarter, quarter_label, month, month_label, week, weekday, weekday_label, day, hour, minute, date_hash, simple_date, time_zone) FROM stdin;
1	2023-12-02 10:40:40	2023	4	IV	12	Декабрь	48	6	Суббота	2	10	40	fa639626f9c0f41a2b72c0a1d0132aba	2023-12-02	0
2	2023-12-04 16:16:19	2023	4	IV	12	Декабрь	49	1	Понедельник	4	16	16	d0d77a5dcb7a3c218a5ba3a23105111a	2023-12-04	0
3	2023-12-04 17:27:33	2023	4	IV	12	Декабрь	49	1	Понедельник	4	17	27	ca7b05879965cc785ea295c6f288775a	2023-12-04	0
4	2023-12-04 19:07:06	2023	4	IV	12	Декабрь	49	1	Понедельник	4	19	7	1b99d1ebcdb57e2862e7e89004996fe0	2023-12-04	0
5	2023-12-04 19:22:14	2023	4	IV	12	Декабрь	49	1	Понедельник	4	19	22	db2c8929ed78410023df88b9e3e0964b	2023-12-04	0
6	2023-12-05 14:42:36	2023	4	IV	12	Декабрь	49	2	Вторник	5	14	42	9820908f530b288b0167877a9ee92364	2023-12-05	0
7	2023-12-06 12:28:53	2023	4	IV	12	Декабрь	49	3	Среда	6	12	28	a4a67d5e465864323e21be8417280cc0	2023-12-06	0
8	2023-12-07 19:12:43	2023	4	IV	12	Декабрь	49	4	Четверг	7	19	12	6a2e04f4b536da52d9aab5e4f34ef654	2023-12-07	0
9	9999-12-31 00:00:00	9999	4	IV	12	Декабрь	52	5	Пятница	31	0	0	5ed615200921dc1f05c946639c249ac1	9999-12-31	0
10	2023-12-01 19:50:21	2023	4	IV	12	Декабрь	48	5	Пятница	1	19	50	57deb9f68810fbf6f232f6b391dfddcc	2023-12-01	0
11	2023-12-02 10:39:05	2023	4	IV	12	Декабрь	48	6	Суббота	2	10	39	707856c073334129859dae6b5d1b0b75	2023-12-02	0
12	2023-12-04 10:00:12	2023	4	IV	12	Декабрь	49	1	Понедельник	4	10	0	871f4b06cd6bcbd0914616d8b6024fa8	2023-12-04	0
13	2023-12-04 16:16:03	2023	4	IV	12	Декабрь	49	1	Понедельник	4	16	16	24e8bf3dbfe2b7fe7bd24858c405e0d3	2023-12-04	0
14	2023-12-04 16:16:21	2023	4	IV	12	Декабрь	49	1	Понедельник	4	16	16	260ef374c73d434431997ea3a3362bcb	2023-12-04	0
15	2023-12-04 17:27:23	2023	4	IV	12	Декабрь	49	1	Понедельник	4	17	27	85f32ab2d8f965b6e4225b2fef1553b3	2023-12-04	0
16	2023-12-04 17:27:35	2023	4	IV	12	Декабрь	49	1	Понедельник	4	17	27	921f59b20258982e788f8b6d5675bbb5	2023-12-04	0
17	2023-12-04 19:06:36	2023	4	IV	12	Декабрь	49	1	Понедельник	4	19	6	fc7ec2cee442d8d9763d5a4393304eb8	2023-12-04	0
18	2023-12-04 19:21:54	2023	4	IV	12	Декабрь	49	1	Понедельник	4	19	21	1a2d0ab002203a038f35e3b7c473ebb0	2023-12-04	0
19	2023-12-05 14:42:25	2023	4	IV	12	Декабрь	49	2	Вторник	5	14	42	ad0f608518e2e76d9044da5cdfb7b550	2023-12-05	0
20	2023-12-05 14:42:45	2023	4	IV	12	Декабрь	49	2	Вторник	5	14	42	243d7c865770fa267d0e31484af85e5e	2023-12-05	0
21	2023-12-05 15:34:01	2023	4	IV	12	Декабрь	49	2	Вторник	5	15	34	9221767dc49828eab430c9ff55861a0e	2023-12-05	0
22	2023-12-05 19:25:10	2023	4	IV	12	Декабрь	49	2	Вторник	5	19	25	f93ba21bca2d0c077a31da32a2d7b5ab	2023-12-05	0
23	2023-12-05 19:25:29	2023	4	IV	12	Декабрь	49	2	Вторник	5	19	25	603ec6c72f33ef5293edbde4c265a572	2023-12-05	0
24	2023-12-05 19:26:24	2023	4	IV	12	Декабрь	49	2	Вторник	5	19	26	3bb0f6c8b64d8b20318c7b23457031df	2023-12-05	0
25	2023-12-05 19:28:20	2023	4	IV	12	Декабрь	49	2	Вторник	5	19	28	ea4d700c5e9030984103f7b2d988281c	2023-12-05	0
26	2023-12-05 20:35:13	2023	4	IV	12	Декабрь	49	2	Вторник	5	20	35	cdf5afd7803db0a4219745bf5f9cb7d4	2023-12-05	0
27	2023-12-05 23:20:43	2023	4	IV	12	Декабрь	49	2	Вторник	5	23	20	4dd50e20c797fdd363b6db22651009aa	2023-12-05	0
28	2023-12-05 23:30:22	2023	4	IV	12	Декабрь	49	2	Вторник	5	23	30	e905f04dacd706fb1ec953be4339a5fd	2023-12-05	0
29	2023-12-05 23:31:32	2023	4	IV	12	Декабрь	49	2	Вторник	5	23	31	d8a61fdf07ac38dd87641c704981e81d	2023-12-05	0
30	2023-12-06 00:16:14	2023	4	IV	12	Декабрь	49	3	Среда	6	0	16	3d0e8b0711948320c7690b7e9b4b38e0	2023-12-06	0
31	2023-12-06 00:33:21	2023	4	IV	12	Декабрь	49	3	Среда	6	0	33	feecb3d59f25b811664a2c63fb4aa97b	2023-12-06	0
32	2023-12-06 01:24:22	2023	4	IV	12	Декабрь	49	3	Среда	6	1	24	69fa373fcd8868be79b535b6b3560715	2023-12-06	0
33	2023-12-06 01:27:35	2023	4	IV	12	Декабрь	49	3	Среда	6	1	27	fb78a5bc41c021f0b42b39165b462e49	2023-12-06	0
34	2023-12-06 01:28:31	2023	4	IV	12	Декабрь	49	3	Среда	6	1	28	eaa7c397a2a83cb74db68d514be94e47	2023-12-06	0
35	2023-12-06 12:28:56	2023	4	IV	12	Декабрь	49	3	Среда	6	12	28	58329e319b062dee31c591329ce87b00	2023-12-06	0
36	2023-12-06 12:29:17	2023	4	IV	12	Декабрь	49	3	Среда	6	12	29	1b4c1cf38461d88729ee0278e42d7918	2023-12-06	0
37	2023-12-06 15:38:33	2023	4	IV	12	Декабрь	49	3	Среда	6	15	38	3c1a0795eef194647f095c5c54722a65	2023-12-06	0
38	2023-12-07 19:12:33	2023	4	IV	12	Декабрь	49	4	Четверг	7	19	12	56f57a282a5c5036e19ff1b5f5d7a3e3	2023-12-07	0
39	2023-12-07 19:12:45	2023	4	IV	12	Декабрь	49	4	Четверг	7	19	12	673cbf1820370ceb72b050695d3704e2	2023-12-07	0
40	2023-12-02 10:39:06	2023	4	IV	12	Декабрь	48	6	Суббота	2	10	39	d797350d5eb406e872e1b49df32567d9	2023-12-02	0
41	2023-12-05 14:42:27	2023	4	IV	12	Декабрь	49	2	Вторник	5	14	42	30e2b86e703e94779245e7e4067b1fb7	2023-12-05	0
42	2023-12-05 19:25:00	2023	4	IV	12	Декабрь	49	2	Вторник	5	19	25	60da4611f3f0ae9ec8ac0903ef02d60f	2023-12-05	0
43	2023-12-05 19:25:19	2023	4	IV	12	Декабрь	49	2	Вторник	5	19	25	b1c19f8637bb00c949217b8ac48e2412	2023-12-05	0
44	2023-12-05 19:26:20	2023	4	IV	12	Декабрь	49	2	Вторник	5	19	26	d2528f6823afc96a7eda87d9612597be	2023-12-05	0
45	2023-12-05 19:28:11	2023	4	IV	12	Декабрь	49	2	Вторник	5	19	28	f3803c3b316f111dbb0d3c7fed21ca02	2023-12-05	0
46	2023-12-05 19:29:52	2023	4	IV	12	Декабрь	49	2	Вторник	5	19	29	999f2975470fa2d467bffbd1e48f7ec7	2023-12-05	0
47	2023-12-05 23:15:29	2023	4	IV	12	Декабрь	49	2	Вторник	5	23	15	f01e856899d42042aaa86f2c42747883	2023-12-05	0
48	2023-12-05 23:30:03	2023	4	IV	12	Декабрь	49	2	Вторник	5	23	30	ade47fbf79d6904d3a00c321dc7062ce	2023-12-05	0
49	2023-12-05 23:31:19	2023	4	IV	12	Декабрь	49	2	Вторник	5	23	31	d4b5ba39d6d2741bb3cde134577d7a23	2023-12-05	0
50	2023-12-05 23:45:12	2023	4	IV	12	Декабрь	49	2	Вторник	5	23	45	50dd5f4ebc171bbd0a98f0a1ae46f6c1	2023-12-05	0
51	2023-12-06 00:33:17	2023	4	IV	12	Декабрь	49	3	Среда	6	0	33	9951c3c4490e3e92e0bc4dc5e98cda94	2023-12-06	0
52	2023-12-06 01:24:18	2023	4	IV	12	Декабрь	49	3	Среда	6	1	24	3aa6742757442b2dedd4fce8775f4c96	2023-12-06	0
53	2023-12-06 01:24:43	2023	4	IV	12	Декабрь	49	3	Среда	6	1	24	7abd8874c30b911cc2cd702a9622d224	2023-12-06	0
54	2023-12-06 01:27:40	2023	4	IV	12	Декабрь	49	3	Среда	6	1	27	420dfab19b000ba94f3173b8b624910f	2023-12-06	0
55	2023-12-01 21:50:21	2023	4	IV	12	Декабрь	48	5	Пятница	1	21	50	8ab4d93e1edb096880b3870a3984985b	2023-12-01	0
56	2023-12-02 12:39:05	2023	4	IV	12	Декабрь	48	6	Суббота	2	12	39	51de35905d0dc60cd00320f6d37b3daa	2023-12-02	0
57	2023-12-04 17:16:21	2023	4	IV	12	Декабрь	49	1	Понедельник	4	17	16	86b2d410f7b2b20d227f6fcf857c7193	2023-12-04	0
58	2023-12-04 18:16:02	2023	4	IV	12	Декабрь	49	1	Понедельник	4	18	16	5a01fa9f13239c76182a3fcda8ad03d4	2023-12-04	0
59	2023-12-04 18:27:35	2023	4	IV	12	Декабрь	49	1	Понедельник	4	18	27	406b177aff1d61961d549e24ee8dfdec	2023-12-04	0
60	2023-12-04 19:27:22	2023	4	IV	12	Декабрь	49	1	Понедельник	4	19	27	3db62485e6249983fc4d4cae1778b799	2023-12-04	0
61	2023-12-04 21:06:36	2023	4	IV	12	Декабрь	49	1	Понедельник	4	21	6	10fdfc7b74998ee8a1b414fa576c67a5	2023-12-04	0
62	2023-12-04 21:21:54	2023	4	IV	12	Декабрь	49	1	Понедельник	4	21	21	68f21e2e55e36a42256c0c33189f729e	2023-12-04	0
63	2023-12-05 10:00:11	2023	4	IV	12	Декабрь	49	2	Вторник	5	10	0	282dd4761eb85fd8272daba3adbe5222	2023-12-05	0
64	2023-12-05 15:42:45	2023	4	IV	12	Декабрь	49	2	Вторник	5	15	42	5e67ba10c6aadef0caf5440dcdfbdfec	2023-12-05	0
65	2023-12-05 16:42:25	2023	4	IV	12	Декабрь	49	2	Вторник	5	16	42	15a4742f0be671c533c2b71adbf15338	2023-12-05	0
66	2023-12-05 17:34:00	2023	4	IV	12	Декабрь	49	2	Вторник	5	17	34	4356a277863b1ea03c560134a3c41c45	2023-12-05	0
67	2023-12-05 21:25:10	2023	4	IV	12	Декабрь	49	2	Вторник	5	21	25	06791f2def90ab77e9b4234fccff4aab	2023-12-05	0
68	2023-12-05 21:26:24	2023	4	IV	12	Декабрь	49	2	Вторник	5	21	26	786fcf813088af62bf326209a7eb4934	2023-12-05	0
69	2023-12-06 13:28:55	2023	4	IV	12	Декабрь	49	3	Среда	6	13	28	e9b9763a92d54ff3d2f7c446e4fafcfc	2023-12-06	0
70	2023-12-06 14:29:16	2023	4	IV	12	Декабрь	49	3	Среда	6	14	29	fa433381dc217fb773bc9a81bb6e10c6	2023-12-06	0
71	2023-12-06 17:38:32	2023	4	IV	12	Декабрь	49	3	Среда	6	17	38	72aa1b9e3c9da0bae047ef9932736650	2023-12-06	0
72	2023-12-06 19:25:28	2023	4	IV	12	Декабрь	49	3	Среда	6	19	25	4e68418977c1cc181dc08bec1224d2dd	2023-12-06	0
73	2023-12-06 19:28:20	2023	4	IV	12	Декабрь	49	3	Среда	6	19	28	4517b7fa19e22a381982d0631834c709	2023-12-06	0
74	2023-12-06 20:35:13	2023	4	IV	12	Декабрь	49	3	Среда	6	20	35	5fabe9bbab04e2d00c4dfaa95c34e9b9	2023-12-06	0
75	2023-12-06 23:20:42	2023	4	IV	12	Декабрь	49	3	Среда	6	23	20	46b2bcc1dccd26fd038bcfe239915e92	2023-12-06	0
76	2023-12-06 23:30:21	2023	4	IV	12	Декабрь	49	3	Среда	6	23	30	726d3e95edb2c425b0a0244ee7bc5f81	2023-12-06	0
77	2023-12-06 23:31:32	2023	4	IV	12	Декабрь	49	3	Среда	6	23	31	ad9797a5487bebe3a6b4d9430797013b	2023-12-06	0
78	2023-12-07 00:16:14	2023	4	IV	12	Декабрь	49	4	Четверг	7	0	16	e9c95450faa004dc7c259389a96cb22f	2023-12-07	0
79	2023-12-07 01:24:22	2023	4	IV	12	Декабрь	49	4	Четверг	7	1	24	daa9dc65c517f4edcb71c88991336e51	2023-12-07	0
80	2023-12-07 01:27:35	2023	4	IV	12	Декабрь	49	4	Четверг	7	1	27	89a377016230155d838805d43021a87b	2023-12-07	0
81	2023-12-07 01:28:31	2023	4	IV	12	Декабрь	49	4	Четверг	7	1	28	425ad6c843f185e14cd596479b6643d5	2023-12-07	0
82	2023-12-07 20:12:45	2023	4	IV	12	Декабрь	49	4	Четверг	7	20	12	69f2d1eccf2f5c52b3b47989185b2b8d	2023-12-07	0
83	2023-12-07 21:12:33	2023	4	IV	12	Декабрь	49	4	Четверг	7	21	12	ce07a2e0914dfa111e4d7a3fb9d9cdc5	2023-12-07	0
84	2023-12-08 00:33:21	2023	4	IV	12	Декабрь	49	5	Пятница	8	0	33	45da468dd081844455fd586935cff44d	2023-12-08	0
85	2023-08-22 16:48:49	2023	3	III	8	Август	34	2	Вторник	22	16	48	cef3eff903aea832e9a4c68022c251b1	2023-08-22	0
86	2023-09-02 17:27:37	2023	3	III	9	Сентябрь	35	6	Суббота	2	17	27	de96117f68ab61409069c0a337a4bc24	2023-09-02	0
87	2023-09-06 23:28:30	2023	3	III	9	Сентябрь	36	3	Среда	6	23	28	fe74e1d1d6bd998e097ae7429dd1bf04	2023-09-06	0
88	2023-09-07 11:19:16	2023	3	III	9	Сентябрь	36	4	Четверг	7	11	19	0d81b733fc1018aefb934e5b8053bd44	2023-09-07	0
89	2023-09-07 19:38:31	2023	3	III	9	Сентябрь	36	4	Четверг	7	19	38	38ff35efe2898e897f4f6f6fe5ba55d7	2023-09-07	0
90	2023-09-16 10:30:56	2023	3	III	9	Сентябрь	37	6	Суббота	16	10	30	af21de6855ccbb81c55375c9dbc4f1df	2023-09-16	0
91	2023-11-17 18:55:56	2023	4	IV	11	Ноябрь	46	5	Пятница	17	18	55	24f3f280584490b348ac6c58acf7237a	2023-11-17	0
92	2023-11-17 18:55:57	2023	4	IV	11	Ноябрь	46	5	Пятница	17	18	55	d0389bf10229405f8a0ddb0d63298467	2023-11-17	0
93	2023-11-17 18:55:58	2023	4	IV	11	Ноябрь	46	5	Пятница	17	18	55	6cf824b39848538115cd194dfcaf9cfc	2023-11-17	0
94	2023-12-01 19:50:17	2023	4	IV	12	Декабрь	48	5	Пятница	1	19	50	01f3434973fe8b8e84680aa6fb109fc8	2023-12-01	0
95	2023-12-02 10:38:58	2023	4	IV	12	Декабрь	48	6	Суббота	2	10	38	eb609a55d4d597ac7cbffca4d61f3969	2023-12-02	0
96	2023-12-04 16:15:53	2023	4	IV	12	Декабрь	49	1	Понедельник	4	16	15	d520efabfe28b999da63a65f94d9c297	2023-12-04	0
97	2023-12-04 17:27:17	2023	4	IV	12	Декабрь	49	1	Понедельник	4	17	27	9cd564e6cbbe6de61c2376a497ea8277	2023-12-04	0
98	2023-12-04 19:06:31	2023	4	IV	12	Декабрь	49	1	Понедельник	4	19	6	2d13b56da426fe3b4c7ff70651d8404f	2023-12-04	0
99	2023-12-04 19:21:51	2023	4	IV	12	Декабрь	49	1	Понедельник	4	19	21	927301cbac3da3742dc32e910ba5f048	2023-12-04	0
100	2023-12-05 14:42:08	2023	4	IV	12	Декабрь	49	2	Вторник	5	14	42	6d781ac626cd345bd8115792e22cef06	2023-12-05	0
101	2023-12-05 15:33:57	2023	4	IV	12	Декабрь	49	2	Вторник	5	15	33	c192b20f0533c46633b36772cbec10b2	2023-12-05	0
102	2023-12-06 12:27:54	2023	4	IV	12	Декабрь	49	3	Среда	6	12	27	86753f609a1ccef96b22c058badd04ee	2023-12-06	0
103	2023-12-06 15:38:19	2023	4	IV	12	Декабрь	49	3	Среда	6	15	38	619377aa594818bf276a3ab0cc943502	2023-12-06	0
104	2023-12-07 19:12:26	2023	4	IV	12	Декабрь	49	4	Четверг	7	19	12	009b06c961b001e510105960245945d6	2023-12-07	0
105	2023-08-23 19:57:51	2023	3	III	8	Август	34	3	Среда	23	19	57	4133acb1712562db1aaea96fb481619b	2023-08-23	0
106	2023-09-02 17:27:36	2023	3	III	9	Сентябрь	35	6	Суббота	2	17	27	a689dbd8406a84de403e363159966ef7	2023-09-02	0
107	2023-09-16 10:30:58	2023	3	III	9	Сентябрь	37	6	Суббота	16	10	30	b811eb132e30ca02215df25d06e5f8a2	2023-09-16	0
108	2023-11-30 18:12:28	2023	4	IV	11	Ноябрь	48	4	Четверг	30	18	12	42a45f8193a78848045062e3fbca8b1e	2023-11-30	0
109	2023-11-30 18:14:59	2023	4	IV	11	Ноябрь	48	4	Четверг	30	18	14	4362b31b918bbe375d0b5552b0010ea5	2023-11-30	0
110	2023-11-30 18:21:06	2023	4	IV	11	Ноябрь	48	4	Четверг	30	18	21	4e7fb51c3abb9ee76687614cfcbf90ba	2023-11-30	0
111	2023-11-30 18:24:36	2023	4	IV	11	Ноябрь	48	4	Четверг	30	18	24	3e0799fda85342a5c7d9e34f69e54918	2023-11-30	0
112	2023-11-30 18:48:52	2023	4	IV	11	Ноябрь	48	4	Четверг	30	18	48	d5354958366f41cd733d9e174c0ef18d	2023-11-30	0
113	2023-11-30 18:50:40	2023	4	IV	11	Ноябрь	48	4	Четверг	30	18	50	60f9a5e8cfceab0c664391354ced0988	2023-11-30	0
114	2023-11-30 18:52:51	2023	4	IV	11	Ноябрь	48	4	Четверг	30	18	52	3e681916b94bc6d9afd63b932724a8d2	2023-11-30	0
115	2023-11-30 18:54:37	2023	4	IV	11	Ноябрь	48	4	Четверг	30	18	54	4fefd16e3c4c7331c79e71802aa44fa5	2023-11-30	0
116	2023-11-30 18:57:07	2023	4	IV	11	Ноябрь	48	4	Четверг	30	18	57	4b1fc797591724037a67bf0008032a2d	2023-11-30	0
117	2023-11-30 19:03:25	2023	4	IV	11	Ноябрь	48	4	Четверг	30	19	3	55452d3a8161296096a8306537d9af1b	2023-11-30	0
118	2023-11-30 19:30:24	2023	4	IV	11	Ноябрь	48	4	Четверг	30	19	30	e837103c88758641da0d4c260ee72169	2023-11-30	0
119	2023-12-06 15:38:24	2023	4	IV	12	Декабрь	49	3	Среда	6	15	38	e48ee0ef5747f7fec4a974998d5009df	2023-12-06	0
120	2023-12-08 13:08:01	2023	4	IV	12	Декабрь	49	5	Пятница	8	13	8	71170adafe6c6d94527fe705cb6cb942	2023-12-08	0
121	2023-12-08 14:33:18	2023	4	IV	12	Декабрь	49	5	Пятница	8	14	33	d63feecf9b80f6341482ffa725a5539c	2023-12-08	0
122	2023-12-08 13:07:48	2023	4	IV	12	Декабрь	49	5	Пятница	8	13	7	e10df1fd1797eb4b310a101f77380f17	2023-12-08	0
123	2023-12-08 13:08:07	2023	4	IV	12	Декабрь	49	5	Пятница	8	13	8	f6093f6cd061521fa946a4d08f7718a8	2023-12-08	0
124	2023-12-08 14:32:53	2023	4	IV	12	Декабрь	49	5	Пятница	8	14	32	e5f3f4faf8f27f972f7396a7b021fd94	2023-12-08	0
125	2023-12-08 14:08:06	2023	4	IV	12	Декабрь	49	5	Пятница	8	14	8	7c8234c0abbfbaf1269312eef0f27124	2023-12-08	0
126	2023-12-08 15:07:47	2023	4	IV	12	Декабрь	49	5	Пятница	8	15	7	c2eddeca8c7e87ffaa468a46fde97a41	2023-12-08	0
127	2023-12-08 16:32:53	2023	4	IV	12	Декабрь	49	5	Пятница	8	16	32	e67594b71cfc0f650367f4d6eb57bc11	2023-12-08	0
128	2023-12-08 13:07:39	2023	4	IV	12	Декабрь	49	5	Пятница	8	13	7	7fe8f2041bd85c687aacd6119a055e98	2023-12-08	0
129	2023-12-08 14:32:48	2023	4	IV	12	Декабрь	49	5	Пятница	8	14	32	918e2b2c01449dd5a3744d6437c6381d	2023-12-08	0
130	2023-09-19 13:55:47	2023	3	III	9	Сентябрь	38	2	Вторник	19	13	55	dd5b1bee84e1a1e66dbd8ff65a6371b8	2023-09-19	0
131	2023-09-22 16:34:06	2023	3	III	9	Сентябрь	38	5	Пятница	22	16	34	572f9657f5fdea3327f0cc9a5227a19a	2023-09-22	0
132	2023-12-09 16:30:36	2023	4	IV	12	Декабрь	49	6	Суббота	9	16	30	75f9f69a754e7431bfaf3f55ac0508c6	2023-12-09	0
133	2023-12-09 16:31:27	2023	4	IV	12	Декабрь	49	6	Суббота	9	16	31	9e94b9015484364c50312c75cda87e19	2023-12-09	0
134	2023-09-15 16:04:35	2023	3	III	9	Сентябрь	37	5	Пятница	15	16	4	02e8743c906a37595ce6703629c22c37	2023-09-15	0
135	2023-09-15 16:11:04	2023	3	III	9	Сентябрь	37	5	Пятница	15	16	11	ad8cd3a19167a3ee37a90a050942e1e1	2023-09-15	0
136	2023-12-09 16:30:42	2023	4	IV	12	Декабрь	49	6	Суббота	9	16	30	1d5d86083c38347b260c4fe85116d541	2023-12-09	0
137	2023-12-09 16:31:32	2023	4	IV	12	Декабрь	49	6	Суббота	9	16	31	ba683f5a3f45fde72baed7a087e2739a	2023-12-09	0
138	2023-12-09 16:30:34	2023	4	IV	12	Декабрь	49	6	Суббота	9	16	30	2cd3177351e804b90d001c7ff47f49bb	2023-12-09	0
139	2023-12-09 16:31:25	2023	4	IV	12	Декабрь	49	6	Суббота	9	16	31	1a1bdb7bf7722819f861d896c4082209	2023-12-09	0
140	2023-09-15 16:09:52	2023	3	III	9	Сентябрь	37	5	Пятница	15	16	9	9d6024d5bb10b3ac144cacb1e4485f00	2023-09-15	0
141	2023-09-15 16:54:39	2023	3	III	9	Сентябрь	37	5	Пятница	15	16	54	dcf0ca264aa02dbeeec68731e08b276e	2023-09-15	0
142	2023-12-11 09:18:51	2023	4	IV	12	Декабрь	50	1	Понедельник	11	9	18	4d1a9b6712daecb3e5884d4f6878aa53	2023-12-11	0
143	2023-12-11 14:02:34	2023	4	IV	12	Декабрь	50	1	Понедельник	11	14	2	dafbaeb92957c9fa92a8263f6b55bbbf	2023-12-11	0
144	2023-12-11 15:31:37	2023	4	IV	12	Декабрь	50	1	Понедельник	11	15	31	29d2712dcbea279f082e6fe8811e7052	2023-12-11	0
145	2023-12-11 16:07:25	2023	4	IV	12	Декабрь	50	1	Понедельник	11	16	7	aa5363cbcfff1b1af559a13cbc71953f	2023-12-11	0
146	2023-12-11 16:27:58	2023	4	IV	12	Декабрь	50	1	Понедельник	11	16	27	9743ea66fff29d1e719adc240e8cc1bc	2023-12-11	0
147	2023-12-11 16:29:23	2023	4	IV	12	Декабрь	50	1	Понедельник	11	16	29	1d7ead14c68bcfadf13d8a1c5010676f	2023-12-11	0
148	2023-12-11 19:27:45	2023	4	IV	12	Декабрь	50	1	Понедельник	11	19	27	1f972775eccaee5cfd4f5560a4221109	2023-12-11	0
149	2023-12-11 09:18:28	2023	4	IV	12	Декабрь	50	1	Понедельник	11	9	18	fbabcca87cf7d27b1156eefb920871c7	2023-12-11	0
150	2023-12-11 09:18:53	2023	4	IV	12	Декабрь	50	1	Понедельник	11	9	18	ea881c6f7dde34f3cbbae2f1c40e35d7	2023-12-11	0
151	2023-12-11 14:02:15	2023	4	IV	12	Декабрь	50	1	Понедельник	11	14	2	a612f2f0be3084e87740858aa7dd6b05	2023-12-11	0
152	2023-12-11 15:28:39	2023	4	IV	12	Декабрь	50	1	Понедельник	11	15	28	1097318055d8e0ac08fefaf694de6e77	2023-12-11	0
153	2023-12-11 16:07:15	2023	4	IV	12	Декабрь	50	1	Понедельник	11	16	7	31e097c72a6cff9d4af17b89cf172645	2023-12-11	0
154	2023-12-11 19:27:24	2023	4	IV	12	Декабрь	50	1	Понедельник	11	19	27	354a94a5aa68185f104353ad28832620	2023-12-11	0
155	2023-12-11 19:27:48	2023	4	IV	12	Декабрь	50	1	Понедельник	11	19	27	e52f50ee269fdd1f0a196d05798b0caf	2023-12-11	0
156	2023-12-11 16:21:17	2023	4	IV	12	Декабрь	50	1	Понедельник	11	16	21	435a51d91abd4a30da764fa50afcea0c	2023-12-11	0
157	2023-12-11 10:18:53	2023	4	IV	12	Декабрь	50	1	Понедельник	11	10	18	aeeb057cea717bdeececab5444b08bef	2023-12-11	0
158	2023-12-11 11:18:27	2023	4	IV	12	Декабрь	50	1	Понедельник	11	11	18	10de0d7fbbb557b9a8b0c693dfae30c8	2023-12-11	0
159	2023-12-11 16:02:13	2023	4	IV	12	Декабрь	50	1	Понедельник	11	16	2	d4f5978bbc31eae0ff7e61490005c2aa	2023-12-11	0
160	2023-12-11 17:28:39	2023	4	IV	12	Декабрь	50	1	Понедельник	11	17	28	89dcf2f60868252dd67dbf01f9b4db65	2023-12-11	0
161	2023-12-11 18:07:15	2023	4	IV	12	Декабрь	50	1	Понедельник	11	18	7	8cb57c8d6285ca80fd39448f3b91031c	2023-12-11	0
162	2023-12-11 20:27:48	2023	4	IV	12	Декабрь	50	1	Понедельник	11	20	27	4c7459e217ecf3a02388c1cffe2da43d	2023-12-11	0
163	2023-12-11 21:27:24	2023	4	IV	12	Декабрь	50	1	Понедельник	11	21	27	14edc46a601f4afea72a352826bcc324	2023-12-11	0
164	2023-12-11 09:18:21	2023	4	IV	12	Декабрь	50	1	Понедельник	11	9	18	18cc2d8367b48390cf2e0c4e33206e54	2023-12-11	0
165	2023-12-11 14:01:26	2023	4	IV	12	Декабрь	50	1	Понедельник	11	14	1	bdf91b095cc5493dc3f9f77308271cf1	2023-12-11	0
166	2023-12-11 15:28:33	2023	4	IV	12	Декабрь	50	1	Понедельник	11	15	28	6fbbba27dd1f3c8e7e6cd92d187c77fd	2023-12-11	0
167	2023-12-11 16:07:05	2023	4	IV	12	Декабрь	50	1	Понедельник	11	16	7	2ee88b7f7ce1c2738c46716d488c0fd2	2023-12-11	0
168	2023-12-11 19:27:19	2023	4	IV	12	Декабрь	50	1	Понедельник	11	19	27	efbc062c033143723a09065987f1a02e	2023-12-11	0
169	2023-12-11 01:29:08	2023	4	IV	12	Декабрь	50	1	Понедельник	11	1	29	3def0953c956d03b10b1d8a2143ee35d	2023-12-11	0
170	2023-12-11 16:20:46	2023	4	IV	12	Декабрь	50	1	Понедельник	11	16	20	4fc08bbdb270866764078b27f0e8c735	2023-12-11	0
171	2023-12-12 14:37:33	2023	4	IV	12	Декабрь	50	2	Вторник	12	14	37	d7ec96397be9fdd2ea8850c9494ec317	2023-12-12	0
172	2023-12-12 17:04:24	2023	4	IV	12	Декабрь	50	2	Вторник	12	17	4	8be38a0d3788144b5cf7c9bb2d6e8635	2023-12-12	0
173	2023-12-12 17:06:36	2023	4	IV	12	Декабрь	50	2	Вторник	12	17	6	a39100a1f86194ac84ca81c20127134e	2023-12-12	0
174	2023-12-12 17:12:41	2023	4	IV	12	Декабрь	50	2	Вторник	12	17	12	82e7374a0c23a296cf42cffdf0d0b4df	2023-12-12	0
175	2023-11-27 19:29:51	2023	4	IV	11	Ноябрь	48	1	Понедельник	27	19	29	5f85f34ade9ebba9315393164c383adf	2023-11-27	0
176	2023-12-12 14:25:07	2023	4	IV	12	Декабрь	50	2	Вторник	12	14	25	1116bdd2f7225de475565956522e2da1	2023-12-12	0
177	2023-12-12 14:40:46	2023	4	IV	12	Декабрь	50	2	Вторник	12	14	40	f77dc278adf9faaaafc3d1d5bc65c01b	2023-12-12	0
178	2023-12-12 14:40:21	2023	4	IV	12	Декабрь	50	2	Вторник	12	14	40	7c9db6f42ed9e8f7d36b13812e36fe12	2023-12-12	0
179	2023-12-12 17:14:13	2023	4	IV	12	Декабрь	50	2	Вторник	12	17	14	e8e9164dc8e659aadd38ec3d68fbc189	2023-12-12	0
180	2023-11-27 21:29:51	2023	4	IV	11	Ноябрь	48	1	Понедельник	27	21	29	391567c471c29c4e8e01868a22c3ec0a	2023-11-27	0
181	2023-12-13 14:25:06	2023	4	IV	12	Декабрь	50	3	Среда	13	14	25	7e513253f62bbb0d2a008a3ec9e25813	2023-12-13	0
182	2023-12-13 14:40:45	2023	4	IV	12	Декабрь	50	3	Среда	13	14	40	a8f12f93784a4ad96e604854e3fb0887	2023-12-13	0
183	2023-10-08 11:02:10	2023	4	IV	10	Октябрь	40	7	Воскресенье	8	11	2	d1a55b5dd12dd9af3569dc08cb6c576f	2023-10-08	0
184	2023-11-27 19:29:47	2023	4	IV	11	Ноябрь	48	1	Понедельник	27	19	29	1002581016f8b8d3bedbf873bb29c5e6	2023-11-27	0
185	2023-04-24 15:43:20	2023	2	II	4	Апрель	17	1	Понедельник	24	15	43	2dec548ed422d12562e3a38d96937d23	2023-04-24	0
186	2023-09-01 09:48:25	2023	3	III	9	Сентябрь	35	5	Пятница	1	9	48	2e24c93e219d0079d74709f18e9313c5	2023-09-01	0
187	2023-12-12 17:03:49	2023	4	IV	12	Декабрь	50	2	Вторник	12	17	3	fe9c284501ea106b74cd1bdacb7da6c4	2023-12-12	0
188	2023-12-13 01:27:34	2023	4	IV	12	Декабрь	50	3	Среда	13	1	27	063955e43717dfe25fd2f52a9053a461	2023-12-13	0
189	2023-12-13 01:29:13	2023	4	IV	12	Декабрь	50	3	Среда	13	1	29	554689698df378daf4fb9e32270b0f7a	2023-12-13	0
190	2023-12-13 01:30:56	2023	4	IV	12	Декабрь	50	3	Среда	13	1	30	aab417b879bb03a5bcecd4f1a0a012d3	2023-12-13	0
191	2023-12-13 01:41:02	2023	4	IV	12	Декабрь	50	3	Среда	13	1	41	e3bb85a13b3d04614f1310749a196933	2023-12-13	0
192	2023-12-13 01:53:34	2023	4	IV	12	Декабрь	50	3	Среда	13	1	53	3918a3dd9febdc6cbd5cf160e22df12d	2023-12-13	0
193	2023-12-13 15:51:03	2023	4	IV	12	Декабрь	50	3	Среда	13	15	51	5130dc730cd856cde388ee97b2a000b3	2023-12-13	0
194	2023-12-13 01:27:42	2023	4	IV	12	Декабрь	50	3	Среда	13	1	27	27dd1f908bd0aa909baf647ae0786c07	2023-12-13	0
195	2023-12-13 01:29:14	2023	4	IV	12	Декабрь	50	3	Среда	13	1	29	7db909d3d0dafc32b33d83dbebfd3daa	2023-12-13	0
196	2023-12-13 01:40:56	2023	4	IV	12	Декабрь	50	3	Среда	13	1	40	42061da757e3c22fb5ad3bc12f6e75d5	2023-12-13	0
197	2023-12-13 01:53:20	2023	4	IV	12	Декабрь	50	3	Среда	13	1	53	1828e300da90f3c0e109fbfa5e3f3b5f	2023-12-13	0
198	2023-12-13 15:50:46	2023	4	IV	12	Декабрь	50	3	Среда	13	15	50	63ed4dbd3ac7e4517c981e6b8b6137e9	2023-12-13	0
199	2023-12-14 01:29:13	2023	4	IV	12	Декабрь	50	4	Четверг	14	1	29	a0703fff46dde100a40008051dda16ff	2023-12-14	0
200	2023-12-14 01:30:55	2023	4	IV	12	Декабрь	50	4	Четверг	14	1	30	b7b1807f4e546e596428edb05e88776b	2023-12-14	0
201	2023-12-14 01:41:02	2023	4	IV	12	Декабрь	50	4	Четверг	14	1	41	8ebbc9e4c2d5842f23f8ab41f0cc46c7	2023-12-14	0
202	2023-12-14 01:53:34	2023	4	IV	12	Декабрь	50	4	Четверг	14	1	53	f31f63d0489735a316b21bcb81661521	2023-12-14	0
203	2023-12-14 15:51:02	2023	4	IV	12	Декабрь	50	4	Четверг	14	15	51	f2378fc13db1e4114722b99c211e1f87	2023-12-14	0
204	2023-12-15 01:27:34	2023	4	IV	12	Декабрь	50	5	Пятница	15	1	27	649b7d9bf99f94cbb76cef6b3f7bfe11	2023-12-15	0
205	2023-12-13 15:06:58	2023	4	IV	12	Декабрь	50	3	Среда	13	15	6	d353c33a4e9803e66c859e9571b13388	2023-12-13	0
206	2023-12-13 15:08:30	2023	4	IV	12	Декабрь	50	3	Среда	13	15	8	a80f134404d19357a3b9fd304adc1507	2023-12-13	0
207	2023-12-13 16:14:57	2023	4	IV	12	Декабрь	50	3	Среда	13	16	14	a9c8d6fcfa8b7ac71047701b4424624d	2023-12-13	0
208	2023-12-13 15:06:54	2023	4	IV	12	Декабрь	50	3	Среда	13	15	6	f9325dab4ef5e0fb46777a0962d9a0cf	2023-12-13	0
209	2023-12-13 15:08:27	2023	4	IV	12	Декабрь	50	3	Среда	13	15	8	bcfe49d5035b79c0fb79889105def6ba	2023-12-13	0
210	2023-12-13 16:14:54	2023	4	IV	12	Декабрь	50	3	Среда	13	16	14	36641317a73b3bf77f850e7cd484ce58	2023-12-13	0
211	2023-12-15 13:01:09	2023	4	IV	12	Декабрь	50	5	Пятница	15	13	1	b49421f42c8efa114b689a53f9a88aef	2023-12-15	0
212	2023-12-15 14:44:15	2023	4	IV	12	Декабрь	50	5	Пятница	15	14	44	eec4d26c722457fbe63cd0d3b6dc245c	2023-12-15	0
213	2023-12-15 13:00:56	2023	4	IV	12	Декабрь	50	5	Пятница	15	13	0	9ef7cdff56697e9d388bc33d3e9d418e	2023-12-15	0
214	2023-12-15 14:43:59	2023	4	IV	12	Декабрь	50	5	Пятница	15	14	43	7e90e4826d161077a6081331b88414ac	2023-12-15	0
215	2023-12-15 13:00:57	2023	4	IV	12	Декабрь	50	5	Пятница	15	13	0	67a771cdc3c2b68f44bb7f6f4fa839d6	2023-12-15	0
216	2023-12-15 14:44:00	2023	4	IV	12	Декабрь	50	5	Пятница	15	14	44	00b32d0a1c46324f39fc4fc6eb950cc4	2023-12-15	0
217	2023-12-15 15:00:56	2023	4	IV	12	Декабрь	50	5	Пятница	15	15	0	e7567cca7ab3442495c375ec903cb404	2023-12-15	0
218	2023-12-15 16:43:59	2023	4	IV	12	Декабрь	50	5	Пятница	15	16	43	ec7c3786de25b0f523713019e7a9606f	2023-12-15	0
219	2023-12-15 13:00:33	2023	4	IV	12	Декабрь	50	5	Пятница	15	13	0	8bd91d4fb1bb03ac084a3a1d2811dc2f	2023-12-15	0
220	2023-12-15 14:41:50	2023	4	IV	12	Декабрь	50	5	Пятница	15	14	41	2c9fa534e014bfe2e00f9a3c9a0cb307	2023-12-15	0
221	2023-12-17 17:24:31	2023	4	IV	12	Декабрь	50	7	Воскресенье	17	17	24	8c8761060e1d10011f85805e734cec07	2023-12-17	0
222	2023-12-17 19:24:30	2023	4	IV	12	Декабрь	50	7	Воскресенье	17	19	24	e6e92a5d02d9679814aaf63443496f34	2023-12-17	0
223	2023-12-17 17:24:03	2023	4	IV	12	Декабрь	50	7	Воскресенье	17	17	24	17aa328bfcad098c27170dbea5aafac3	2023-12-17	0
224	2023-12-17 17:24:09	2023	4	IV	12	Декабрь	50	7	Воскресенье	17	17	24	9df1478cc3e68f809acf48c2f7454afb	2023-12-17	0
225	2023-12-18 10:48:50	2023	4	IV	12	Декабрь	51	1	Понедельник	18	10	48	3c4cf05bf2534bcedb5b483508358251	2023-12-18	0
226	2023-12-18 14:03:21	2023	4	IV	12	Декабрь	51	1	Понедельник	18	14	3	cdbf56b10fd1d31deb09cdf2cfafe148	2023-12-18	0
227	2023-12-18 14:24:17	2023	4	IV	12	Декабрь	51	1	Понедельник	18	14	24	46328f13ca3fab0a3b310d577588d462	2023-12-18	0
228	2023-12-18 16:36:14	2023	4	IV	12	Декабрь	51	1	Понедельник	18	16	36	2f2bd949eb1f2b78cec2746a9be62df8	2023-12-18	0
229	2023-12-18 10:48:36	2023	4	IV	12	Декабрь	51	1	Понедельник	18	10	48	9b14503c5355f9ae284c52941e35cab5	2023-12-18	0
230	2023-12-18 14:02:36	2023	4	IV	12	Декабрь	51	1	Понедельник	18	14	2	cd25a9a23237dc27296fe7619c5e4e49	2023-12-18	0
231	2023-12-18 14:23:57	2023	4	IV	12	Декабрь	51	1	Понедельник	18	14	23	b50444ea0cc11ca64bd7c52640546fc3	2023-12-18	0
232	2023-12-18 14:24:28	2023	4	IV	12	Декабрь	51	1	Понедельник	18	14	24	68696136cca08bdb4db0610a009e72b9	2023-12-18	0
233	2023-12-18 16:36:17	2023	4	IV	12	Декабрь	51	1	Понедельник	18	16	36	4925e4e3b000fe15db6f28f6b7ab66aa	2023-12-18	0
234	2023-12-18 10:48:37	2023	4	IV	12	Декабрь	51	1	Понедельник	18	10	48	7eac3ca769fe97789da78c745210749c	2023-12-18	0
235	2023-12-18 14:23:58	2023	4	IV	12	Декабрь	51	1	Понедельник	18	14	23	7b6be23014aeb73fa028f5956e908d6a	2023-12-18	0
236	2023-12-18 12:48:35	2023	4	IV	12	Декабрь	51	1	Понедельник	18	12	48	215aa535f3e197c4854919aaa1e41b8b	2023-12-18	0
237	2023-12-18 15:24:27	2023	4	IV	12	Декабрь	51	1	Понедельник	18	15	24	9faa3dca5f38124175c58457ab8e9694	2023-12-18	0
238	2023-12-18 16:02:35	2023	4	IV	12	Декабрь	51	1	Понедельник	18	16	2	e1f23a8a1128310d4488a157c32c3369	2023-12-18	0
239	2023-12-18 16:23:57	2023	4	IV	12	Декабрь	51	1	Понедельник	18	16	23	65d6dfe43be9552e242fd99b19d10345	2023-12-18	0
240	2023-12-18 18:36:17	2023	4	IV	12	Декабрь	51	1	Понедельник	18	18	36	823baf07f14f5f8ec9976bec92380429	2023-12-18	0
241	2023-11-17 18:55:59	2023	4	IV	11	Ноябрь	46	5	Пятница	17	18	55	be1115ee2e4448e0d423b33432a239a8	2023-11-17	0
242	2023-11-17 18:56:00	2023	4	IV	11	Ноябрь	46	5	Пятница	17	18	56	5f70a9c9264e8081f1d6fef81ecd8ae7	2023-11-17	0
243	2023-12-18 10:48:06	2023	4	IV	12	Декабрь	51	1	Понедельник	18	10	48	d839ab5e79a47aba7e1929100529b05a	2023-12-18	0
244	2023-12-18 14:02:03	2023	4	IV	12	Декабрь	51	1	Понедельник	18	14	2	00eef273c3d0d6de80f91311215d1f74	2023-12-18	0
245	2023-12-18 14:23:45	2023	4	IV	12	Декабрь	51	1	Понедельник	18	14	23	59febbe6fcb42f3707190ff035b276a1	2023-12-18	0
246	2023-12-18 16:34:03	2023	4	IV	12	Декабрь	51	1	Понедельник	18	16	34	289217941cd127fc1ebcd45642191420	2023-12-18	0
247	2023-12-18 19:21:54	2023	4	IV	12	Декабрь	51	1	Понедельник	18	19	21	6dfdf6611c6491ef325ee4bea778d456	2023-12-18	0
248	2023-11-30 18:22:22	2023	4	IV	11	Ноябрь	48	4	Четверг	30	18	22	b4f0f21110756868423971a09a58f433	2023-11-30	0
249	2023-11-30 19:04:53	2023	4	IV	11	Ноябрь	48	4	Четверг	30	19	4	ca481aa81eeea5675a8b23e81766548a	2023-11-30	0
250	2023-11-30 19:12:32	2023	4	IV	11	Ноябрь	48	4	Четверг	30	19	12	6fb5ce2189bb9784e464950efa523cfd	2023-11-30	0
251	2023-11-30 19:37:43	2023	4	IV	11	Ноябрь	48	4	Четверг	30	19	37	74a2d28f9276ab0a84d9acf1553d3a46	2023-11-30	0
252	2023-11-30 19:38:59	2023	4	IV	11	Ноябрь	48	4	Четверг	30	19	38	ec5c6c2689a711c1fbe196e3e4837d1c	2023-11-30	0
253	2023-12-18 19:22:13	2023	4	IV	12	Декабрь	51	1	Понедельник	18	19	22	7464985a6670ccd2b616d653833f698a	2023-12-18	0
254	2023-12-19 11:31:56	2023	4	IV	12	Декабрь	51	2	Вторник	19	11	31	6190cb14e864ffda9459e35c2a6369b2	2023-12-19	0
255	2023-12-19 11:32:22	2023	4	IV	12	Декабрь	51	2	Вторник	19	11	32	ae865f87832839d0516a22c9de2c2bd3	2023-12-19	0
256	2023-12-19 11:32:39	2023	4	IV	12	Декабрь	51	2	Вторник	19	11	32	112a31269ab243f3ec863fa307b5bcd3	2023-12-19	0
257	2023-12-19 13:57:48	2023	4	IV	12	Декабрь	51	2	Вторник	19	13	57	fcc863e56cb04a26e4432687e30ef2b5	2023-12-19	0
258	2023-12-19 11:31:34	2023	4	IV	12	Декабрь	51	2	Вторник	19	11	31	a0dcee5774dabbf8c1a1f4cdae0395f7	2023-12-19	0
259	2023-12-19 11:31:59	2023	4	IV	12	Декабрь	51	2	Вторник	19	11	31	832437f856f5a31d2a7a8712147db36f	2023-12-19	0
260	2023-12-19 13:57:25	2023	4	IV	12	Декабрь	51	2	Вторник	19	13	57	6ccd46052fd2f3da71402b83a358e5de	2023-12-19	0
261	2023-12-19 13:57:50	2023	4	IV	12	Декабрь	51	2	Вторник	19	13	57	defa5bf785d5be37e4b87c0edf179fe2	2023-12-19	0
262	2023-12-19 12:31:58	2023	4	IV	12	Декабрь	51	2	Вторник	19	12	31	eed5c987eaeae714ebab52aa02a77a42	2023-12-19	0
263	2023-12-19 13:31:34	2023	4	IV	12	Декабрь	51	2	Вторник	19	13	31	ee62d07090ce994d1963eb34dd4bc0c1	2023-12-19	0
264	2023-12-19 14:57:50	2023	4	IV	12	Декабрь	51	2	Вторник	19	14	57	48166fb797ddbd4d518c82e6fce9f444	2023-12-19	0
265	2023-12-19 15:57:25	2023	4	IV	12	Декабрь	51	2	Вторник	19	15	57	76b2f55d037030b10b931e09c59a3494	2023-12-19	0
266	2023-12-19 11:31:22	2023	4	IV	12	Декабрь	51	2	Вторник	19	11	31	5b4fa8e6eda6534c51217bcab7c980f0	2023-12-19	0
267	2023-12-19 13:57:15	2023	4	IV	12	Декабрь	51	2	Вторник	19	13	57	12176bbbd23a07e5f431d6bf65ac297f	2023-12-19	0
268	2023-12-20 11:29:24	2023	4	IV	12	Декабрь	51	3	Среда	20	11	29	e14ceb78968951053e68d3ce5803d190	2023-12-20	0
269	2023-12-20 13:09:59	2023	4	IV	12	Декабрь	51	3	Среда	20	13	9	f52f8ad0a17e8ebae4327bd1547da2b5	2023-12-20	0
270	2023-12-20 13:11:07	2023	4	IV	12	Декабрь	51	3	Среда	20	13	11	61f3b23f5ae539af2a92c6f1b225f1cd	2023-12-20	0
271	2023-12-20 11:29:17	2023	4	IV	12	Декабрь	51	3	Среда	20	11	29	7ea4842e82888cd64fb02e11338d956c	2023-12-20	0
272	2023-12-20 11:29:26	2023	4	IV	12	Декабрь	51	3	Среда	20	11	29	ee778b37272c8fb4dae53d6897ac9f9d	2023-12-20	0
273	2023-12-20 12:29:26	2023	4	IV	12	Декабрь	51	3	Среда	20	12	29	3c29e5926d9fd26423fe166d3ff817ec	2023-12-20	0
274	2023-12-20 13:29:17	2023	4	IV	12	Декабрь	51	3	Среда	20	13	29	0754d44cb1c26747d0721a736bb6efc0	2023-12-20	0
275	2023-12-20 11:29:03	2023	4	IV	12	Декабрь	51	3	Среда	20	11	29	3df73c6a5bf164a6f603d91acbdbb4c6	2023-12-20	0
\.


--
-- TOC entry 4149 (class 0 OID 620924)
-- Dependencies: 220
-- Data for Name: general_locations; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.general_locations (id, country_iso, country, region_iso, region, city, latitude, longitude, location_hash) FROM stdin;
\.


--
-- TOC entry 4151 (class 0 OID 620932)
-- Dependencies: 222
-- Data for Name: general_sites; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.general_sites (id, domain, description) FROM stdin;
\.


--
-- TOC entry 4153 (class 0 OID 620940)
-- Dependencies: 224
-- Data for Name: general_traffic; Type: TABLE DATA; Schema: public; Owner: owner-gycqvgb
--

COPY public.general_traffic (id, "grouping", source, medium, campaign, content, keyword, landing_page, traffic_hash) FROM stdin;
1	\N	\N	\N	\N	\N	\N	\N	a641512c0f95fbc686d9561e12daf68d
\.


--
-- TOC entry 4337 (class 0 OID 0)
-- Dependencies: 258
-- Name: amocrm_calls_facts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_calls_facts_id_seq', 34, true);


--
-- TOC entry 4338 (class 0 OID 0)
-- Dependencies: 234
-- Name: amocrm_calls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_calls_id_seq', 34, true);


--
-- TOC entry 4339 (class 0 OID 0)
-- Dependencies: 260
-- Name: amocrm_companies_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_companies_attributes_id_seq', 1, false);


--
-- TOC entry 4340 (class 0 OID 0)
-- Dependencies: 262
-- Name: amocrm_companies_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_companies_events_id_seq', 1, false);


--
-- TOC entry 4341 (class 0 OID 0)
-- Dependencies: 264
-- Name: amocrm_companies_facts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_companies_facts_id_seq', 1, false);


--
-- TOC entry 4342 (class 0 OID 0)
-- Dependencies: 236
-- Name: amocrm_companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_companies_id_seq', 1, true);


--
-- TOC entry 4343 (class 0 OID 0)
-- Dependencies: 266
-- Name: amocrm_companies_notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_companies_notes_id_seq', 1, false);


--
-- TOC entry 4344 (class 0 OID 0)
-- Dependencies: 268
-- Name: amocrm_companies_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_companies_tags_id_seq', 1, false);


--
-- TOC entry 4345 (class 0 OID 0)
-- Dependencies: 270
-- Name: amocrm_contacts_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_contacts_attributes_id_seq', 155, true);


--
-- TOC entry 4346 (class 0 OID 0)
-- Dependencies: 272
-- Name: amocrm_contacts_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_contacts_events_id_seq', 1, false);


--
-- TOC entry 4347 (class 0 OID 0)
-- Dependencies: 274
-- Name: amocrm_contacts_facts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_contacts_facts_id_seq', 61, true);


--
-- TOC entry 4348 (class 0 OID 0)
-- Dependencies: 238
-- Name: amocrm_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_contacts_id_seq', 62, true);


--
-- TOC entry 4349 (class 0 OID 0)
-- Dependencies: 276
-- Name: amocrm_contacts_notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_contacts_notes_id_seq', 1, false);


--
-- TOC entry 4350 (class 0 OID 0)
-- Dependencies: 278
-- Name: amocrm_contacts_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_contacts_tags_id_seq', 13, true);


--
-- TOC entry 4351 (class 0 OID 0)
-- Dependencies: 280
-- Name: amocrm_customers_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_customers_attributes_id_seq', 1, false);


--
-- TOC entry 4352 (class 0 OID 0)
-- Dependencies: 282
-- Name: amocrm_customers_elements_facts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_customers_elements_facts_id_seq', 1, false);


--
-- TOC entry 4353 (class 0 OID 0)
-- Dependencies: 284
-- Name: amocrm_customers_facts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_customers_facts_id_seq', 1, false);


--
-- TOC entry 4354 (class 0 OID 0)
-- Dependencies: 240
-- Name: amocrm_customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_customers_id_seq', 1, true);


--
-- TOC entry 4355 (class 0 OID 0)
-- Dependencies: 286
-- Name: amocrm_customers_notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_customers_notes_id_seq', 1, false);


--
-- TOC entry 4356 (class 0 OID 0)
-- Dependencies: 288
-- Name: amocrm_customers_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_customers_tags_id_seq', 1, false);


--
-- TOC entry 4357 (class 0 OID 0)
-- Dependencies: 290
-- Name: amocrm_elements_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_elements_attributes_id_seq', 1, false);


--
-- TOC entry 4358 (class 0 OID 0)
-- Dependencies: 242
-- Name: amocrm_elements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_elements_id_seq', 35, true);


--
-- TOC entry 4359 (class 0 OID 0)
-- Dependencies: 292
-- Name: amocrm_elements_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_elements_products_id_seq', 1, false);


--
-- TOC entry 4360 (class 0 OID 0)
-- Dependencies: 294
-- Name: amocrm_leads_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_leads_attributes_id_seq', 1553, true);


--
-- TOC entry 4361 (class 0 OID 0)
-- Dependencies: 296
-- Name: amocrm_leads_elements_facts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_leads_elements_facts_id_seq', 1, false);


--
-- TOC entry 4362 (class 0 OID 0)
-- Dependencies: 298
-- Name: amocrm_leads_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_leads_events_id_seq', 145, true);


--
-- TOC entry 4363 (class 0 OID 0)
-- Dependencies: 300
-- Name: amocrm_leads_facts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_leads_facts_id_seq', 69, true);


--
-- TOC entry 4364 (class 0 OID 0)
-- Dependencies: 244
-- Name: amocrm_leads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_leads_id_seq', 70, true);


--
-- TOC entry 4365 (class 0 OID 0)
-- Dependencies: 302
-- Name: amocrm_leads_notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_leads_notes_id_seq', 1, false);


--
-- TOC entry 4366 (class 0 OID 0)
-- Dependencies: 304
-- Name: amocrm_leads_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_leads_tags_id_seq', 200, true);


--
-- TOC entry 4367 (class 0 OID 0)
-- Dependencies: 246
-- Name: amocrm_pipelines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_pipelines_id_seq', 5, true);


--
-- TOC entry 4368 (class 0 OID 0)
-- Dependencies: 248
-- Name: amocrm_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_statuses_id_seq', 37, true);


--
-- TOC entry 4369 (class 0 OID 0)
-- Dependencies: 306
-- Name: amocrm_tasks_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_tasks_events_id_seq', 1, false);


--
-- TOC entry 4370 (class 0 OID 0)
-- Dependencies: 308
-- Name: amocrm_tasks_facts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_tasks_facts_id_seq', 65, true);


--
-- TOC entry 4371 (class 0 OID 0)
-- Dependencies: 250
-- Name: amocrm_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_tasks_id_seq', 66, true);


--
-- TOC entry 4372 (class 0 OID 0)
-- Dependencies: 310
-- Name: amocrm_tasks_notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_tasks_notes_id_seq', 1, false);


--
-- TOC entry 4373 (class 0 OID 0)
-- Dependencies: 312
-- Name: amocrm_transactions_facts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_transactions_facts_id_seq', 1, false);


--
-- TOC entry 4374 (class 0 OID 0)
-- Dependencies: 252
-- Name: amocrm_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_transactions_id_seq', 1, false);


--
-- TOC entry 4375 (class 0 OID 0)
-- Dependencies: 254
-- Name: amocrm_unsorted_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_unsorted_id_seq', 1, true);


--
-- TOC entry 4376 (class 0 OID 0)
-- Dependencies: 256
-- Name: amocrm_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.amocrm_users_id_seq', 2, true);


--
-- TOC entry 4377 (class 0 OID 0)
-- Dependencies: 213
-- Name: general_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.general_accounts_id_seq', 1, true);


--
-- TOC entry 4378 (class 0 OID 0)
-- Dependencies: 215
-- Name: general_clientids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.general_clientids_id_seq', 1, true);


--
-- TOC entry 4379 (class 0 OID 0)
-- Dependencies: 225
-- Name: general_costs_facts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.general_costs_facts_id_seq', 1, false);


--
-- TOC entry 4380 (class 0 OID 0)
-- Dependencies: 217
-- Name: general_dates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.general_dates_id_seq', 275, true);


--
-- TOC entry 4381 (class 0 OID 0)
-- Dependencies: 219
-- Name: general_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.general_locations_id_seq', 1, false);


--
-- TOC entry 4382 (class 0 OID 0)
-- Dependencies: 221
-- Name: general_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.general_sites_id_seq', 1, false);


--
-- TOC entry 4383 (class 0 OID 0)
-- Dependencies: 223
-- Name: general_traffic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: owner-gycqvgb
--

SELECT pg_catalog.setval('public.general_traffic_id_seq', 1, true);


--
-- TOC entry 3657 (class 2606 OID 620895)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 3732 (class 2606 OID 621159)
-- Name: amocrm_calls_facts amocrm_calls_facts_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_calls_facts
    ADD CONSTRAINT amocrm_calls_facts_idx_1 UNIQUE (account_id, calls_id);


--
-- TOC entry 3735 (class 2606 OID 621157)
-- Name: amocrm_calls_facts amocrm_calls_facts_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_calls_facts
    ADD CONSTRAINT amocrm_calls_facts_pkey PRIMARY KEY (id);


--
-- TOC entry 3685 (class 2606 OID 621042)
-- Name: amocrm_calls amocrm_calls_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_calls
    ADD CONSTRAINT amocrm_calls_idx_1 UNIQUE (account_id, note_id);


--
-- TOC entry 3687 (class 2606 OID 621040)
-- Name: amocrm_calls amocrm_calls_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_calls
    ADD CONSTRAINT amocrm_calls_pkey PRIMARY KEY (id);


--
-- TOC entry 3737 (class 2606 OID 621206)
-- Name: amocrm_companies_attributes amocrm_companies_attributes_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies_attributes
    ADD CONSTRAINT amocrm_companies_attributes_idx_1 UNIQUE (account_id, companies_id, attribute_id);


--
-- TOC entry 3739 (class 2606 OID 621204)
-- Name: amocrm_companies_attributes amocrm_companies_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies_attributes
    ADD CONSTRAINT amocrm_companies_attributes_pkey PRIMARY KEY (id);


--
-- TOC entry 3741 (class 2606 OID 621222)
-- Name: amocrm_companies_events amocrm_companies_events_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies_events
    ADD CONSTRAINT amocrm_companies_events_idx_1 UNIQUE (account_id, event_id);


--
-- TOC entry 3745 (class 2606 OID 621220)
-- Name: amocrm_companies_events amocrm_companies_events_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies_events
    ADD CONSTRAINT amocrm_companies_events_pkey PRIMARY KEY (id);


--
-- TOC entry 3747 (class 2606 OID 621238)
-- Name: amocrm_companies_facts amocrm_companies_facts_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies_facts
    ADD CONSTRAINT amocrm_companies_facts_idx_1 UNIQUE (account_id, companies_id);


--
-- TOC entry 3750 (class 2606 OID 621236)
-- Name: amocrm_companies_facts amocrm_companies_facts_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies_facts
    ADD CONSTRAINT amocrm_companies_facts_pkey PRIMARY KEY (id);


--
-- TOC entry 3689 (class 2606 OID 621053)
-- Name: amocrm_companies amocrm_companies_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies
    ADD CONSTRAINT amocrm_companies_idx_1 UNIQUE (account_id, company_id);


--
-- TOC entry 3752 (class 2606 OID 621265)
-- Name: amocrm_companies_notes amocrm_companies_notes_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies_notes
    ADD CONSTRAINT amocrm_companies_notes_idx_1 UNIQUE (account_id, note_id);


--
-- TOC entry 3756 (class 2606 OID 621263)
-- Name: amocrm_companies_notes amocrm_companies_notes_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies_notes
    ADD CONSTRAINT amocrm_companies_notes_pkey PRIMARY KEY (id);


--
-- TOC entry 3691 (class 2606 OID 621051)
-- Name: amocrm_companies amocrm_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies
    ADD CONSTRAINT amocrm_companies_pkey PRIMARY KEY (id);


--
-- TOC entry 3758 (class 2606 OID 621281)
-- Name: amocrm_companies_tags amocrm_companies_tags_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies_tags
    ADD CONSTRAINT amocrm_companies_tags_idx_1 UNIQUE (account_id, companies_id, tag_id);


--
-- TOC entry 3760 (class 2606 OID 621279)
-- Name: amocrm_companies_tags amocrm_companies_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies_tags
    ADD CONSTRAINT amocrm_companies_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 3762 (class 2606 OID 621297)
-- Name: amocrm_contacts_attributes amocrm_contacts_attributes_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts_attributes
    ADD CONSTRAINT amocrm_contacts_attributes_idx_1 UNIQUE (account_id, contacts_id, attribute_id);


--
-- TOC entry 3764 (class 2606 OID 621295)
-- Name: amocrm_contacts_attributes amocrm_contacts_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts_attributes
    ADD CONSTRAINT amocrm_contacts_attributes_pkey PRIMARY KEY (id);


--
-- TOC entry 3766 (class 2606 OID 621313)
-- Name: amocrm_contacts_events amocrm_contacts_events_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts_events
    ADD CONSTRAINT amocrm_contacts_events_idx_1 UNIQUE (account_id, event_id);


--
-- TOC entry 3770 (class 2606 OID 621311)
-- Name: amocrm_contacts_events amocrm_contacts_events_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts_events
    ADD CONSTRAINT amocrm_contacts_events_pkey PRIMARY KEY (id);


--
-- TOC entry 3772 (class 2606 OID 621329)
-- Name: amocrm_contacts_facts amocrm_contacts_facts_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts_facts
    ADD CONSTRAINT amocrm_contacts_facts_idx_1 UNIQUE (account_id, contacts_id);


--
-- TOC entry 3775 (class 2606 OID 621327)
-- Name: amocrm_contacts_facts amocrm_contacts_facts_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts_facts
    ADD CONSTRAINT amocrm_contacts_facts_pkey PRIMARY KEY (id);


--
-- TOC entry 3693 (class 2606 OID 621064)
-- Name: amocrm_contacts amocrm_contacts_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts
    ADD CONSTRAINT amocrm_contacts_idx_1 UNIQUE (account_id, contact_id);


--
-- TOC entry 3777 (class 2606 OID 621361)
-- Name: amocrm_contacts_notes amocrm_contacts_notes_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts_notes
    ADD CONSTRAINT amocrm_contacts_notes_idx_1 UNIQUE (account_id, note_id);


--
-- TOC entry 3781 (class 2606 OID 621359)
-- Name: amocrm_contacts_notes amocrm_contacts_notes_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts_notes
    ADD CONSTRAINT amocrm_contacts_notes_pkey PRIMARY KEY (id);


--
-- TOC entry 3695 (class 2606 OID 621062)
-- Name: amocrm_contacts amocrm_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts
    ADD CONSTRAINT amocrm_contacts_pkey PRIMARY KEY (id);


--
-- TOC entry 3783 (class 2606 OID 621377)
-- Name: amocrm_contacts_tags amocrm_contacts_tags_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts_tags
    ADD CONSTRAINT amocrm_contacts_tags_idx_1 UNIQUE (account_id, contacts_id, tag_id);


--
-- TOC entry 3785 (class 2606 OID 621375)
-- Name: amocrm_contacts_tags amocrm_contacts_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts_tags
    ADD CONSTRAINT amocrm_contacts_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 3787 (class 2606 OID 621393)
-- Name: amocrm_customers_attributes amocrm_customers_attributes_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_attributes
    ADD CONSTRAINT amocrm_customers_attributes_idx_1 UNIQUE (account_id, customers_id, attribute_id);


--
-- TOC entry 3789 (class 2606 OID 621391)
-- Name: amocrm_customers_attributes amocrm_customers_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_attributes
    ADD CONSTRAINT amocrm_customers_attributes_pkey PRIMARY KEY (id);


--
-- TOC entry 3791 (class 2606 OID 621407)
-- Name: amocrm_customers_elements_facts amocrm_customers_elements_facts_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_elements_facts
    ADD CONSTRAINT amocrm_customers_elements_facts_idx_1 UNIQUE (account_id, elements_id, customers_id);


--
-- TOC entry 3794 (class 2606 OID 621405)
-- Name: amocrm_customers_elements_facts amocrm_customers_elements_facts_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_elements_facts
    ADD CONSTRAINT amocrm_customers_elements_facts_pkey PRIMARY KEY (id);


--
-- TOC entry 3796 (class 2606 OID 621452)
-- Name: amocrm_customers_facts amocrm_customers_facts_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_facts
    ADD CONSTRAINT amocrm_customers_facts_idx_1 UNIQUE (account_id, customers_id);


--
-- TOC entry 3799 (class 2606 OID 621450)
-- Name: amocrm_customers_facts amocrm_customers_facts_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_facts
    ADD CONSTRAINT amocrm_customers_facts_pkey PRIMARY KEY (id);


--
-- TOC entry 3697 (class 2606 OID 621073)
-- Name: amocrm_customers amocrm_customers_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers
    ADD CONSTRAINT amocrm_customers_idx_1 UNIQUE (account_id, customer_id);


--
-- TOC entry 3804 (class 2606 OID 621492)
-- Name: amocrm_customers_notes amocrm_customers_notes_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_notes
    ADD CONSTRAINT amocrm_customers_notes_pkey PRIMARY KEY (id);


--
-- TOC entry 3699 (class 2606 OID 621071)
-- Name: amocrm_customers amocrm_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers
    ADD CONSTRAINT amocrm_customers_pkey PRIMARY KEY (id);


--
-- TOC entry 3806 (class 2606 OID 621509)
-- Name: amocrm_customers_tags amocrm_customers_tags_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_tags
    ADD CONSTRAINT amocrm_customers_tags_idx_1 UNIQUE (account_id, customers_id, tag_id);


--
-- TOC entry 3808 (class 2606 OID 621507)
-- Name: amocrm_customers_tags amocrm_customers_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_tags
    ADD CONSTRAINT amocrm_customers_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 3810 (class 2606 OID 621525)
-- Name: amocrm_elements_attributes amocrm_elements_attributes_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_elements_attributes
    ADD CONSTRAINT amocrm_elements_attributes_idx_1 UNIQUE (account_id, elements_id, attribute_id);


--
-- TOC entry 3812 (class 2606 OID 621523)
-- Name: amocrm_elements_attributes amocrm_elements_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_elements_attributes
    ADD CONSTRAINT amocrm_elements_attributes_pkey PRIMARY KEY (id);


--
-- TOC entry 3701 (class 2606 OID 621082)
-- Name: amocrm_elements amocrm_elements_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_elements
    ADD CONSTRAINT amocrm_elements_idx_1 UNIQUE (account_id, element_id);


--
-- TOC entry 3703 (class 2606 OID 621080)
-- Name: amocrm_elements amocrm_elements_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_elements
    ADD CONSTRAINT amocrm_elements_pkey PRIMARY KEY (id);


--
-- TOC entry 3816 (class 2606 OID 621537)
-- Name: amocrm_elements_products amocrm_elements_products_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_elements_products
    ADD CONSTRAINT amocrm_elements_products_pkey PRIMARY KEY (id);


--
-- TOC entry 3818 (class 2606 OID 621555)
-- Name: amocrm_leads_attributes amocrm_leads_attributes_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_attributes
    ADD CONSTRAINT amocrm_leads_attributes_idx_1 UNIQUE (account_id, leads_id, attribute_id);


--
-- TOC entry 3820 (class 2606 OID 621553)
-- Name: amocrm_leads_attributes amocrm_leads_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_attributes
    ADD CONSTRAINT amocrm_leads_attributes_pkey PRIMARY KEY (id);


--
-- TOC entry 3822 (class 2606 OID 621569)
-- Name: amocrm_leads_elements_facts amocrm_leads_elements_facts_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_elements_facts
    ADD CONSTRAINT amocrm_leads_elements_facts_idx_1 UNIQUE (account_id, elements_id, leads_id);


--
-- TOC entry 3825 (class 2606 OID 621567)
-- Name: amocrm_leads_elements_facts amocrm_leads_elements_facts_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_elements_facts
    ADD CONSTRAINT amocrm_leads_elements_facts_pkey PRIMARY KEY (id);


--
-- TOC entry 3827 (class 2606 OID 621621)
-- Name: amocrm_leads_events amocrm_leads_events_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_events
    ADD CONSTRAINT amocrm_leads_events_idx_1 UNIQUE (account_id, event_id);


--
-- TOC entry 3831 (class 2606 OID 621619)
-- Name: amocrm_leads_events amocrm_leads_events_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_events
    ADD CONSTRAINT amocrm_leads_events_pkey PRIMARY KEY (id);


--
-- TOC entry 3833 (class 2606 OID 621637)
-- Name: amocrm_leads_facts amocrm_leads_facts_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_facts
    ADD CONSTRAINT amocrm_leads_facts_idx_1 UNIQUE (account_id, leads_id);


--
-- TOC entry 3838 (class 2606 OID 621635)
-- Name: amocrm_leads_facts amocrm_leads_facts_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_facts
    ADD CONSTRAINT amocrm_leads_facts_pkey PRIMARY KEY (id);


--
-- TOC entry 3705 (class 2606 OID 621093)
-- Name: amocrm_leads amocrm_leads_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads
    ADD CONSTRAINT amocrm_leads_idx_1 UNIQUE (account_id, lead_id);


--
-- TOC entry 3840 (class 2606 OID 621696)
-- Name: amocrm_leads_notes amocrm_leads_notes_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_notes
    ADD CONSTRAINT amocrm_leads_notes_idx_1 UNIQUE (account_id, note_id);


--
-- TOC entry 3844 (class 2606 OID 621694)
-- Name: amocrm_leads_notes amocrm_leads_notes_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_notes
    ADD CONSTRAINT amocrm_leads_notes_pkey PRIMARY KEY (id);


--
-- TOC entry 3707 (class 2606 OID 621091)
-- Name: amocrm_leads amocrm_leads_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads
    ADD CONSTRAINT amocrm_leads_pkey PRIMARY KEY (id);


--
-- TOC entry 3846 (class 2606 OID 621712)
-- Name: amocrm_leads_tags amocrm_leads_tags_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_tags
    ADD CONSTRAINT amocrm_leads_tags_idx_1 UNIQUE (account_id, leads_id, tag_id);


--
-- TOC entry 3848 (class 2606 OID 621710)
-- Name: amocrm_leads_tags amocrm_leads_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_tags
    ADD CONSTRAINT amocrm_leads_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 3709 (class 2606 OID 621102)
-- Name: amocrm_pipelines amocrm_pipelines_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_pipelines
    ADD CONSTRAINT amocrm_pipelines_idx_1 UNIQUE (account_id, pipeline_id);


--
-- TOC entry 3711 (class 2606 OID 621100)
-- Name: amocrm_pipelines amocrm_pipelines_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_pipelines
    ADD CONSTRAINT amocrm_pipelines_pkey PRIMARY KEY (id);


--
-- TOC entry 3713 (class 2606 OID 621111)
-- Name: amocrm_statuses amocrm_statuses_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_statuses
    ADD CONSTRAINT amocrm_statuses_idx_1 UNIQUE (account_id, pipeline_id, status_id);


--
-- TOC entry 3715 (class 2606 OID 621109)
-- Name: amocrm_statuses amocrm_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_statuses
    ADD CONSTRAINT amocrm_statuses_pkey PRIMARY KEY (id);


--
-- TOC entry 3850 (class 2606 OID 621728)
-- Name: amocrm_tasks_events amocrm_tasks_events_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_tasks_events
    ADD CONSTRAINT amocrm_tasks_events_idx_1 UNIQUE (account_id, event_id);


--
-- TOC entry 3854 (class 2606 OID 621726)
-- Name: amocrm_tasks_events amocrm_tasks_events_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_tasks_events
    ADD CONSTRAINT amocrm_tasks_events_pkey PRIMARY KEY (id);


--
-- TOC entry 3856 (class 2606 OID 621744)
-- Name: amocrm_tasks_facts amocrm_tasks_facts_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_tasks_facts
    ADD CONSTRAINT amocrm_tasks_facts_idx_1 UNIQUE (account_id, tasks_id);


--
-- TOC entry 3859 (class 2606 OID 621742)
-- Name: amocrm_tasks_facts amocrm_tasks_facts_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_tasks_facts
    ADD CONSTRAINT amocrm_tasks_facts_pkey PRIMARY KEY (id);


--
-- TOC entry 3717 (class 2606 OID 621122)
-- Name: amocrm_tasks amocrm_tasks_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_tasks
    ADD CONSTRAINT amocrm_tasks_idx_1 UNIQUE (account_id, task_id);


--
-- TOC entry 3861 (class 2606 OID 621801)
-- Name: amocrm_tasks_notes amocrm_tasks_notes_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_tasks_notes
    ADD CONSTRAINT amocrm_tasks_notes_idx_1 UNIQUE (account_id, note_id);


--
-- TOC entry 3865 (class 2606 OID 621799)
-- Name: amocrm_tasks_notes amocrm_tasks_notes_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_tasks_notes
    ADD CONSTRAINT amocrm_tasks_notes_pkey PRIMARY KEY (id);


--
-- TOC entry 3719 (class 2606 OID 621120)
-- Name: amocrm_tasks amocrm_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_tasks
    ADD CONSTRAINT amocrm_tasks_pkey PRIMARY KEY (id);


--
-- TOC entry 3867 (class 2606 OID 621817)
-- Name: amocrm_transactions_facts amocrm_transactions_facts_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_transactions_facts
    ADD CONSTRAINT amocrm_transactions_facts_idx_1 UNIQUE (account_id, transactions_id);


--
-- TOC entry 3871 (class 2606 OID 621815)
-- Name: amocrm_transactions_facts amocrm_transactions_facts_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_transactions_facts
    ADD CONSTRAINT amocrm_transactions_facts_pkey PRIMARY KEY (id);


--
-- TOC entry 3721 (class 2606 OID 621131)
-- Name: amocrm_transactions amocrm_transactions_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_transactions
    ADD CONSTRAINT amocrm_transactions_idx_1 UNIQUE (account_id, transaction_id);


--
-- TOC entry 3723 (class 2606 OID 621129)
-- Name: amocrm_transactions amocrm_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_transactions
    ADD CONSTRAINT amocrm_transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 3726 (class 2606 OID 621140)
-- Name: amocrm_unsorted amocrm_unsorted_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_unsorted
    ADD CONSTRAINT amocrm_unsorted_pkey PRIMARY KEY (id);


--
-- TOC entry 3728 (class 2606 OID 621150)
-- Name: amocrm_users amocrm_users_idx_1; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_users
    ADD CONSTRAINT amocrm_users_idx_1 UNIQUE (account_id, user_id);


--
-- TOC entry 3730 (class 2606 OID 621148)
-- Name: amocrm_users amocrm_users_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_users
    ADD CONSTRAINT amocrm_users_pkey PRIMARY KEY (id);


--
-- TOC entry 3660 (class 2606 OID 620902)
-- Name: general_accounts general_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.general_accounts
    ADD CONSTRAINT general_accounts_pkey PRIMARY KEY (id);


--
-- TOC entry 3663 (class 2606 OID 620910)
-- Name: general_clientids general_clientids_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.general_clientids
    ADD CONSTRAINT general_clientids_pkey PRIMARY KEY (id);


--
-- TOC entry 3683 (class 2606 OID 620955)
-- Name: general_costs_facts general_costs_facts_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.general_costs_facts
    ADD CONSTRAINT general_costs_facts_pkey PRIMARY KEY (id);


--
-- TOC entry 3666 (class 2606 OID 620920)
-- Name: general_dates general_dates_idx_2; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.general_dates
    ADD CONSTRAINT general_dates_idx_2 UNIQUE (full_date);


--
-- TOC entry 3669 (class 2606 OID 620918)
-- Name: general_dates general_dates_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.general_dates
    ADD CONSTRAINT general_dates_pkey PRIMARY KEY (id);


--
-- TOC entry 3672 (class 2606 OID 620929)
-- Name: general_locations general_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.general_locations
    ADD CONSTRAINT general_locations_pkey PRIMARY KEY (id);


--
-- TOC entry 3675 (class 2606 OID 620937)
-- Name: general_sites general_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.general_sites
    ADD CONSTRAINT general_sites_pkey PRIMARY KEY (id);


--
-- TOC entry 3678 (class 2606 OID 620947)
-- Name: general_traffic general_traffic_pkey; Type: CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.general_traffic
    ADD CONSTRAINT general_traffic_pkey PRIMARY KEY (id);


--
-- TOC entry 3733 (class 1259 OID 621195)
-- Name: amocrm_calls_facts_idx_2; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_calls_facts_idx_2 ON public.amocrm_calls_facts USING btree (dates_id);


--
-- TOC entry 3742 (class 1259 OID 621228)
-- Name: amocrm_companies_events_idx_2; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_companies_events_idx_2 ON public.amocrm_companies_events USING btree (companies_id);


--
-- TOC entry 3743 (class 1259 OID 621229)
-- Name: amocrm_companies_events_idx_3; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_companies_events_idx_3 ON public.amocrm_companies_events USING btree (created_at);


--
-- TOC entry 3748 (class 1259 OID 621254)
-- Name: amocrm_companies_facts_idx_2; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_companies_facts_idx_2 ON public.amocrm_companies_facts USING btree (registered_id);


--
-- TOC entry 3753 (class 1259 OID 621271)
-- Name: amocrm_companies_notes_idx_2; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_companies_notes_idx_2 ON public.amocrm_companies_notes USING btree (companies_id);


--
-- TOC entry 3754 (class 1259 OID 621272)
-- Name: amocrm_companies_notes_idx_3; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_companies_notes_idx_3 ON public.amocrm_companies_notes USING btree (created_at);


--
-- TOC entry 3767 (class 1259 OID 621319)
-- Name: amocrm_contacts_events_idx_2; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_contacts_events_idx_2 ON public.amocrm_contacts_events USING btree (contacts_id);


--
-- TOC entry 3768 (class 1259 OID 621320)
-- Name: amocrm_contacts_events_idx_3; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_contacts_events_idx_3 ON public.amocrm_contacts_events USING btree (created_at);


--
-- TOC entry 3773 (class 1259 OID 621350)
-- Name: amocrm_contacts_facts_idx_2; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_contacts_facts_idx_2 ON public.amocrm_contacts_facts USING btree (registered_id);


--
-- TOC entry 3778 (class 1259 OID 621367)
-- Name: amocrm_contacts_notes_idx_2; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_contacts_notes_idx_2 ON public.amocrm_contacts_notes USING btree (contacts_id);


--
-- TOC entry 3779 (class 1259 OID 621368)
-- Name: amocrm_contacts_notes_idx_3; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_contacts_notes_idx_3 ON public.amocrm_contacts_notes USING btree (created_at);


--
-- TOC entry 3792 (class 1259 OID 621443)
-- Name: amocrm_customers_elements_facts_idx_2; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_customers_elements_facts_idx_2 ON public.amocrm_customers_elements_facts USING btree (created_id);


--
-- TOC entry 3797 (class 1259 OID 621483)
-- Name: amocrm_customers_facts_idx_2; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_customers_facts_idx_2 ON public.amocrm_customers_facts USING btree (created_id);


--
-- TOC entry 3800 (class 1259 OID 621498)
-- Name: amocrm_customers_notes_idx_1; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_customers_notes_idx_1 ON public.amocrm_customers_notes USING btree (account_id, note_id);


--
-- TOC entry 3801 (class 1259 OID 621499)
-- Name: amocrm_customers_notes_idx_2; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_customers_notes_idx_2 ON public.amocrm_customers_notes USING btree (customers_id);


--
-- TOC entry 3802 (class 1259 OID 621500)
-- Name: amocrm_customers_notes_idx_3; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_customers_notes_idx_3 ON public.amocrm_customers_notes USING btree (created_at);


--
-- TOC entry 3813 (class 1259 OID 621543)
-- Name: amocrm_elements_products_idx_1; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_elements_products_idx_1 ON public.amocrm_elements_products USING btree (account_id);


--
-- TOC entry 3814 (class 1259 OID 621544)
-- Name: amocrm_elements_products_idx_2; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_elements_products_idx_2 ON public.amocrm_elements_products USING btree (elements_id);


--
-- TOC entry 3823 (class 1259 OID 621610)
-- Name: amocrm_leads_elements_facts_idx_2; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_leads_elements_facts_idx_2 ON public.amocrm_leads_elements_facts USING btree (created_id);


--
-- TOC entry 3828 (class 1259 OID 621627)
-- Name: amocrm_leads_events_idx_2; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_leads_events_idx_2 ON public.amocrm_leads_events USING btree (leads_id);


--
-- TOC entry 3829 (class 1259 OID 621628)
-- Name: amocrm_leads_events_idx_3; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_leads_events_idx_3 ON public.amocrm_leads_events USING btree (created_at);


--
-- TOC entry 3834 (class 1259 OID 621683)
-- Name: amocrm_leads_facts_idx_2; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_leads_facts_idx_2 ON public.amocrm_leads_facts USING btree (clientids_id);


--
-- TOC entry 3835 (class 1259 OID 621684)
-- Name: amocrm_leads_facts_idx_3; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_leads_facts_idx_3 ON public.amocrm_leads_facts USING btree (created_id);


--
-- TOC entry 3836 (class 1259 OID 621685)
-- Name: amocrm_leads_facts_idx_4; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_leads_facts_idx_4 ON public.amocrm_leads_facts USING btree (closed_id);


--
-- TOC entry 3841 (class 1259 OID 621702)
-- Name: amocrm_leads_notes_idx_2; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_leads_notes_idx_2 ON public.amocrm_leads_notes USING btree (leads_id);


--
-- TOC entry 3842 (class 1259 OID 621703)
-- Name: amocrm_leads_notes_idx_3; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_leads_notes_idx_3 ON public.amocrm_leads_notes USING btree (created_at);


--
-- TOC entry 3851 (class 1259 OID 621734)
-- Name: amocrm_tasks_events_idx_2; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_tasks_events_idx_2 ON public.amocrm_tasks_events USING btree (tasks_id);


--
-- TOC entry 3852 (class 1259 OID 621735)
-- Name: amocrm_tasks_events_idx_3; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_tasks_events_idx_3 ON public.amocrm_tasks_events USING btree (created_at);


--
-- TOC entry 3857 (class 1259 OID 621790)
-- Name: amocrm_tasks_facts_idx_2; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_tasks_facts_idx_2 ON public.amocrm_tasks_facts USING btree (created_id);


--
-- TOC entry 3862 (class 1259 OID 621807)
-- Name: amocrm_tasks_notes_idx_2; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_tasks_notes_idx_2 ON public.amocrm_tasks_notes USING btree (tasks_id);


--
-- TOC entry 3863 (class 1259 OID 621808)
-- Name: amocrm_tasks_notes_idx_3; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_tasks_notes_idx_3 ON public.amocrm_tasks_notes USING btree (created_at);


--
-- TOC entry 3868 (class 1259 OID 621848)
-- Name: amocrm_transactions_facts_idx_2; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_transactions_facts_idx_2 ON public.amocrm_transactions_facts USING btree (dates_id);


--
-- TOC entry 3869 (class 1259 OID 621849)
-- Name: amocrm_transactions_facts_idx_3; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_transactions_facts_idx_3 ON public.amocrm_transactions_facts USING btree (customers_id);


--
-- TOC entry 3724 (class 1259 OID 621141)
-- Name: amocrm_unsorted_idx_1; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX amocrm_unsorted_idx_1 ON public.amocrm_unsorted USING btree (account_id, unsorted_id);


--
-- TOC entry 3658 (class 1259 OID 620903)
-- Name: general_accounts_idx_1; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX general_accounts_idx_1 ON public.general_accounts USING btree (account_id);


--
-- TOC entry 3661 (class 1259 OID 620911)
-- Name: general_clientids_idx_1; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX general_clientids_idx_1 ON public.general_clientids USING btree (clientid);


--
-- TOC entry 3679 (class 1259 OID 620971)
-- Name: general_costs_facts_idx_1; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX general_costs_facts_idx_1 ON public.general_costs_facts USING btree (account_id);


--
-- TOC entry 3680 (class 1259 OID 620972)
-- Name: general_costs_facts_idx_2; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX general_costs_facts_idx_2 ON public.general_costs_facts USING btree (dates_id);


--
-- TOC entry 3681 (class 1259 OID 620973)
-- Name: general_costs_facts_idx_3; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX general_costs_facts_idx_3 ON public.general_costs_facts USING btree (traffic_id);


--
-- TOC entry 3664 (class 1259 OID 620921)
-- Name: general_dates_idx_1; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX general_dates_idx_1 ON public.general_dates USING btree (date_hash);


--
-- TOC entry 3667 (class 1259 OID 620922)
-- Name: general_dates_idx_3; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX general_dates_idx_3 ON public.general_dates USING btree (simple_date);


--
-- TOC entry 3670 (class 1259 OID 620930)
-- Name: general_locations_idx_1; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX general_locations_idx_1 ON public.general_locations USING btree (location_hash);


--
-- TOC entry 3673 (class 1259 OID 620938)
-- Name: general_sites_idx_1; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX general_sites_idx_1 ON public.general_sites USING btree (domain);


--
-- TOC entry 3676 (class 1259 OID 620948)
-- Name: general_traffic_idx_1; Type: INDEX; Schema: public; Owner: owner-gycqvgb
--

CREATE INDEX general_traffic_idx_1 ON public.general_traffic USING btree (traffic_hash);


--
-- TOC entry 3896 (class 2606 OID 621378)
-- Name: amocrm_contacts_tags Copy_of_amocrm_leads_tags_amocrm_contacts; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts_tags
    ADD CONSTRAINT "Copy_of_amocrm_leads_tags_amocrm_contacts" FOREIGN KEY (contacts_id) REFERENCES public.amocrm_contacts(id);


--
-- TOC entry 3875 (class 2606 OID 621160)
-- Name: amocrm_calls_facts amocrm_calls_facts_amocrm_calls; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_calls_facts
    ADD CONSTRAINT amocrm_calls_facts_amocrm_calls FOREIGN KEY (calls_id) REFERENCES public.amocrm_calls(id);


--
-- TOC entry 3876 (class 2606 OID 621165)
-- Name: amocrm_calls_facts amocrm_calls_facts_amocrm_companies; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_calls_facts
    ADD CONSTRAINT amocrm_calls_facts_amocrm_companies FOREIGN KEY (companies_id) REFERENCES public.amocrm_companies(id);


--
-- TOC entry 3877 (class 2606 OID 621170)
-- Name: amocrm_calls_facts amocrm_calls_facts_amocrm_contacts; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_calls_facts
    ADD CONSTRAINT amocrm_calls_facts_amocrm_contacts FOREIGN KEY (contacts_id) REFERENCES public.amocrm_contacts(id);


--
-- TOC entry 3878 (class 2606 OID 621175)
-- Name: amocrm_calls_facts amocrm_calls_facts_amocrm_customers; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_calls_facts
    ADD CONSTRAINT amocrm_calls_facts_amocrm_customers FOREIGN KEY (customers_id) REFERENCES public.amocrm_customers(id);


--
-- TOC entry 3879 (class 2606 OID 621185)
-- Name: amocrm_calls_facts amocrm_calls_facts_amocrm_leads; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_calls_facts
    ADD CONSTRAINT amocrm_calls_facts_amocrm_leads FOREIGN KEY (leads_id) REFERENCES public.amocrm_leads(id);


--
-- TOC entry 3880 (class 2606 OID 621190)
-- Name: amocrm_calls_facts amocrm_calls_facts_amocrm_users; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_calls_facts
    ADD CONSTRAINT amocrm_calls_facts_amocrm_users FOREIGN KEY (users_id) REFERENCES public.amocrm_users(id);


--
-- TOC entry 3881 (class 2606 OID 621180)
-- Name: amocrm_calls_facts amocrm_calls_facts_general_dates; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_calls_facts
    ADD CONSTRAINT amocrm_calls_facts_general_dates FOREIGN KEY (dates_id) REFERENCES public.general_dates(id);


--
-- TOC entry 3882 (class 2606 OID 621207)
-- Name: amocrm_companies_attributes amocrm_companies_attributes_amocrm_companies; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies_attributes
    ADD CONSTRAINT amocrm_companies_attributes_amocrm_companies FOREIGN KEY (companies_id) REFERENCES public.amocrm_companies(id);


--
-- TOC entry 3883 (class 2606 OID 621223)
-- Name: amocrm_companies_events amocrm_companies_events_amocrm_companies; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies_events
    ADD CONSTRAINT amocrm_companies_events_amocrm_companies FOREIGN KEY (companies_id) REFERENCES public.amocrm_companies(id);


--
-- TOC entry 3884 (class 2606 OID 621239)
-- Name: amocrm_companies_facts amocrm_companies_facts_amocrm_companies; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies_facts
    ADD CONSTRAINT amocrm_companies_facts_amocrm_companies FOREIGN KEY (companies_id) REFERENCES public.amocrm_companies(id);


--
-- TOC entry 3885 (class 2606 OID 621249)
-- Name: amocrm_companies_facts amocrm_companies_facts_amocrm_users; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies_facts
    ADD CONSTRAINT amocrm_companies_facts_amocrm_users FOREIGN KEY (users_id) REFERENCES public.amocrm_users(id);


--
-- TOC entry 3886 (class 2606 OID 621244)
-- Name: amocrm_companies_facts amocrm_companies_facts_general_dates_registered; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies_facts
    ADD CONSTRAINT amocrm_companies_facts_general_dates_registered FOREIGN KEY (registered_id) REFERENCES public.general_dates(id);


--
-- TOC entry 3887 (class 2606 OID 621266)
-- Name: amocrm_companies_notes amocrm_companies_notes_amocrm_companies; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies_notes
    ADD CONSTRAINT amocrm_companies_notes_amocrm_companies FOREIGN KEY (companies_id) REFERENCES public.amocrm_companies(id);


--
-- TOC entry 3888 (class 2606 OID 621282)
-- Name: amocrm_companies_tags amocrm_companies_tags_amocrm_companies; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_companies_tags
    ADD CONSTRAINT amocrm_companies_tags_amocrm_companies FOREIGN KEY (companies_id) REFERENCES public.amocrm_companies(id);


--
-- TOC entry 3889 (class 2606 OID 621298)
-- Name: amocrm_contacts_attributes amocrm_contacts_attributes_amocrm_contacts; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts_attributes
    ADD CONSTRAINT amocrm_contacts_attributes_amocrm_contacts FOREIGN KEY (contacts_id) REFERENCES public.amocrm_contacts(id);


--
-- TOC entry 3890 (class 2606 OID 621314)
-- Name: amocrm_contacts_events amocrm_contacts_events_amocrm_contacts; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts_events
    ADD CONSTRAINT amocrm_contacts_events_amocrm_contacts FOREIGN KEY (contacts_id) REFERENCES public.amocrm_contacts(id);


--
-- TOC entry 3891 (class 2606 OID 621330)
-- Name: amocrm_contacts_facts amocrm_contacts_facts_amocrm_companies; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts_facts
    ADD CONSTRAINT amocrm_contacts_facts_amocrm_companies FOREIGN KEY (companies_id) REFERENCES public.amocrm_companies(id);


--
-- TOC entry 3892 (class 2606 OID 621335)
-- Name: amocrm_contacts_facts amocrm_contacts_facts_amocrm_contacts; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts_facts
    ADD CONSTRAINT amocrm_contacts_facts_amocrm_contacts FOREIGN KEY (contacts_id) REFERENCES public.amocrm_contacts(id);


--
-- TOC entry 3893 (class 2606 OID 621345)
-- Name: amocrm_contacts_facts amocrm_contacts_facts_amocrm_users; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts_facts
    ADD CONSTRAINT amocrm_contacts_facts_amocrm_users FOREIGN KEY (users_id) REFERENCES public.amocrm_users(id);


--
-- TOC entry 3894 (class 2606 OID 621340)
-- Name: amocrm_contacts_facts amocrm_contacts_facts_general_dates; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts_facts
    ADD CONSTRAINT amocrm_contacts_facts_general_dates FOREIGN KEY (registered_id) REFERENCES public.general_dates(id);


--
-- TOC entry 3895 (class 2606 OID 621362)
-- Name: amocrm_contacts_notes amocrm_contacts_notes_amocrm_contacts; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_contacts_notes
    ADD CONSTRAINT amocrm_contacts_notes_amocrm_contacts FOREIGN KEY (contacts_id) REFERENCES public.amocrm_contacts(id);


--
-- TOC entry 3897 (class 2606 OID 621394)
-- Name: amocrm_customers_attributes amocrm_customers_attributes_amocrm_customers; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_attributes
    ADD CONSTRAINT amocrm_customers_attributes_amocrm_customers FOREIGN KEY (customers_id) REFERENCES public.amocrm_customers(id);


--
-- TOC entry 3898 (class 2606 OID 621408)
-- Name: amocrm_customers_elements_facts amocrm_customers_elements_facts_amocrm_companies; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_elements_facts
    ADD CONSTRAINT amocrm_customers_elements_facts_amocrm_companies FOREIGN KEY (companies_id) REFERENCES public.amocrm_companies(id);


--
-- TOC entry 3899 (class 2606 OID 621413)
-- Name: amocrm_customers_elements_facts amocrm_customers_elements_facts_amocrm_contacts; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_elements_facts
    ADD CONSTRAINT amocrm_customers_elements_facts_amocrm_contacts FOREIGN KEY (contacts_id) REFERENCES public.amocrm_contacts(id);


--
-- TOC entry 3900 (class 2606 OID 621423)
-- Name: amocrm_customers_elements_facts amocrm_customers_elements_facts_amocrm_customers; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_elements_facts
    ADD CONSTRAINT amocrm_customers_elements_facts_amocrm_customers FOREIGN KEY (customers_id) REFERENCES public.amocrm_customers(id);


--
-- TOC entry 3901 (class 2606 OID 621428)
-- Name: amocrm_customers_elements_facts amocrm_customers_elements_facts_amocrm_elements; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_elements_facts
    ADD CONSTRAINT amocrm_customers_elements_facts_amocrm_elements FOREIGN KEY (elements_id) REFERENCES public.amocrm_elements(id);


--
-- TOC entry 3902 (class 2606 OID 621438)
-- Name: amocrm_customers_elements_facts amocrm_customers_elements_facts_amocrm_users; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_elements_facts
    ADD CONSTRAINT amocrm_customers_elements_facts_amocrm_users FOREIGN KEY (users_id) REFERENCES public.amocrm_users(id);


--
-- TOC entry 3903 (class 2606 OID 621418)
-- Name: amocrm_customers_elements_facts amocrm_customers_elements_facts_general_dates_created; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_elements_facts
    ADD CONSTRAINT amocrm_customers_elements_facts_general_dates_created FOREIGN KEY (created_id) REFERENCES public.general_dates(id);


--
-- TOC entry 3904 (class 2606 OID 621433)
-- Name: amocrm_customers_elements_facts amocrm_customers_elements_facts_general_dates_expected; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_elements_facts
    ADD CONSTRAINT amocrm_customers_elements_facts_general_dates_expected FOREIGN KEY (expected_id) REFERENCES public.general_dates(id);


--
-- TOC entry 3905 (class 2606 OID 621453)
-- Name: amocrm_customers_facts amocrm_customers_facts_amocrm_companies; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_facts
    ADD CONSTRAINT amocrm_customers_facts_amocrm_companies FOREIGN KEY (companies_id) REFERENCES public.amocrm_companies(id);


--
-- TOC entry 3906 (class 2606 OID 621458)
-- Name: amocrm_customers_facts amocrm_customers_facts_amocrm_contacts; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_facts
    ADD CONSTRAINT amocrm_customers_facts_amocrm_contacts FOREIGN KEY (contacts_id) REFERENCES public.amocrm_contacts(id);


--
-- TOC entry 3907 (class 2606 OID 621468)
-- Name: amocrm_customers_facts amocrm_customers_facts_amocrm_customers; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_facts
    ADD CONSTRAINT amocrm_customers_facts_amocrm_customers FOREIGN KEY (customers_id) REFERENCES public.amocrm_customers(id);


--
-- TOC entry 3908 (class 2606 OID 621478)
-- Name: amocrm_customers_facts amocrm_customers_facts_amocrm_users; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_facts
    ADD CONSTRAINT amocrm_customers_facts_amocrm_users FOREIGN KEY (users_id) REFERENCES public.amocrm_users(id);


--
-- TOC entry 3909 (class 2606 OID 621463)
-- Name: amocrm_customers_facts amocrm_customers_facts_general_dates_created; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_facts
    ADD CONSTRAINT amocrm_customers_facts_general_dates_created FOREIGN KEY (created_id) REFERENCES public.general_dates(id);


--
-- TOC entry 3910 (class 2606 OID 621473)
-- Name: amocrm_customers_facts amocrm_customers_facts_general_dates_expected; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_facts
    ADD CONSTRAINT amocrm_customers_facts_general_dates_expected FOREIGN KEY (expected_id) REFERENCES public.general_dates(id);


--
-- TOC entry 3911 (class 2606 OID 621493)
-- Name: amocrm_customers_notes amocrm_customers_notes_amocrm_customers; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_notes
    ADD CONSTRAINT amocrm_customers_notes_amocrm_customers FOREIGN KEY (customers_id) REFERENCES public.amocrm_customers(id);


--
-- TOC entry 3912 (class 2606 OID 621510)
-- Name: amocrm_customers_tags amocrm_customers_tags_amocrm_customers; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_customers_tags
    ADD CONSTRAINT amocrm_customers_tags_amocrm_customers FOREIGN KEY (customers_id) REFERENCES public.amocrm_customers(id);


--
-- TOC entry 3913 (class 2606 OID 621526)
-- Name: amocrm_elements_attributes amocrm_elements_attributes_amocrm_elements; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_elements_attributes
    ADD CONSTRAINT amocrm_elements_attributes_amocrm_elements FOREIGN KEY (elements_id) REFERENCES public.amocrm_elements(id);


--
-- TOC entry 3914 (class 2606 OID 621538)
-- Name: amocrm_elements_products amocrm_elements_products_amocrm_elements; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_elements_products
    ADD CONSTRAINT amocrm_elements_products_amocrm_elements FOREIGN KEY (elements_id) REFERENCES public.amocrm_elements(id);


--
-- TOC entry 3915 (class 2606 OID 621556)
-- Name: amocrm_leads_attributes amocrm_leads_attributes_amocrm_leads; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_attributes
    ADD CONSTRAINT amocrm_leads_attributes_amocrm_leads FOREIGN KEY (leads_id) REFERENCES public.amocrm_leads(id);


--
-- TOC entry 3916 (class 2606 OID 621580)
-- Name: amocrm_leads_elements_facts amocrm_leads_elements_facts_amocrm_companies; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_elements_facts
    ADD CONSTRAINT amocrm_leads_elements_facts_amocrm_companies FOREIGN KEY (companies_id) REFERENCES public.amocrm_companies(id);


--
-- TOC entry 3917 (class 2606 OID 621585)
-- Name: amocrm_leads_elements_facts amocrm_leads_elements_facts_amocrm_contacts; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_elements_facts
    ADD CONSTRAINT amocrm_leads_elements_facts_amocrm_contacts FOREIGN KEY (contacts_id) REFERENCES public.amocrm_contacts(id);


--
-- TOC entry 3918 (class 2606 OID 621595)
-- Name: amocrm_leads_elements_facts amocrm_leads_elements_facts_amocrm_elements; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_elements_facts
    ADD CONSTRAINT amocrm_leads_elements_facts_amocrm_elements FOREIGN KEY (elements_id) REFERENCES public.amocrm_elements(id);


--
-- TOC entry 3919 (class 2606 OID 621600)
-- Name: amocrm_leads_elements_facts amocrm_leads_elements_facts_amocrm_leads; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_elements_facts
    ADD CONSTRAINT amocrm_leads_elements_facts_amocrm_leads FOREIGN KEY (leads_id) REFERENCES public.amocrm_leads(id);


--
-- TOC entry 3920 (class 2606 OID 621605)
-- Name: amocrm_leads_elements_facts amocrm_leads_elements_facts_amocrm_users; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_elements_facts
    ADD CONSTRAINT amocrm_leads_elements_facts_amocrm_users FOREIGN KEY (users_id) REFERENCES public.amocrm_users(id);


--
-- TOC entry 3921 (class 2606 OID 621570)
-- Name: amocrm_leads_elements_facts amocrm_leads_elements_facts_general_clientids; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_elements_facts
    ADD CONSTRAINT amocrm_leads_elements_facts_general_clientids FOREIGN KEY (clientids_id) REFERENCES public.general_clientids(id);


--
-- TOC entry 3922 (class 2606 OID 621575)
-- Name: amocrm_leads_elements_facts amocrm_leads_elements_facts_general_dates_closed; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_elements_facts
    ADD CONSTRAINT amocrm_leads_elements_facts_general_dates_closed FOREIGN KEY (closed_id) REFERENCES public.general_dates(id);


--
-- TOC entry 3923 (class 2606 OID 621590)
-- Name: amocrm_leads_elements_facts amocrm_leads_elements_facts_general_dates_created; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_elements_facts
    ADD CONSTRAINT amocrm_leads_elements_facts_general_dates_created FOREIGN KEY (created_id) REFERENCES public.general_dates(id);


--
-- TOC entry 3924 (class 2606 OID 621622)
-- Name: amocrm_leads_events amocrm_leads_events_amocrm_leads; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_events
    ADD CONSTRAINT amocrm_leads_events_amocrm_leads FOREIGN KEY (leads_id) REFERENCES public.amocrm_leads(id);


--
-- TOC entry 3925 (class 2606 OID 621648)
-- Name: amocrm_leads_facts amocrm_leads_facts_amocrm_companies; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_facts
    ADD CONSTRAINT amocrm_leads_facts_amocrm_companies FOREIGN KEY (companies_id) REFERENCES public.amocrm_companies(id);


--
-- TOC entry 3926 (class 2606 OID 621653)
-- Name: amocrm_leads_facts amocrm_leads_facts_amocrm_contacts; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_facts
    ADD CONSTRAINT amocrm_leads_facts_amocrm_contacts FOREIGN KEY (contacts_id) REFERENCES public.amocrm_contacts(id);


--
-- TOC entry 3927 (class 2606 OID 621663)
-- Name: amocrm_leads_facts amocrm_leads_facts_amocrm_leads; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_facts
    ADD CONSTRAINT amocrm_leads_facts_amocrm_leads FOREIGN KEY (leads_id) REFERENCES public.amocrm_leads(id);


--
-- TOC entry 3928 (class 2606 OID 621673)
-- Name: amocrm_leads_facts amocrm_leads_facts_amocrm_unsorted; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_facts
    ADD CONSTRAINT amocrm_leads_facts_amocrm_unsorted FOREIGN KEY (unsorteds_id) REFERENCES public.amocrm_unsorted(id);


--
-- TOC entry 3929 (class 2606 OID 621678)
-- Name: amocrm_leads_facts amocrm_leads_facts_amocrm_users; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_facts
    ADD CONSTRAINT amocrm_leads_facts_amocrm_users FOREIGN KEY (users_id) REFERENCES public.amocrm_users(id);


--
-- TOC entry 3930 (class 2606 OID 621638)
-- Name: amocrm_leads_facts amocrm_leads_facts_general_clientids; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_facts
    ADD CONSTRAINT amocrm_leads_facts_general_clientids FOREIGN KEY (clientids_id) REFERENCES public.general_clientids(id);


--
-- TOC entry 3931 (class 2606 OID 621658)
-- Name: amocrm_leads_facts amocrm_leads_facts_general_dates_created; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_facts
    ADD CONSTRAINT amocrm_leads_facts_general_dates_created FOREIGN KEY (created_id) REFERENCES public.general_dates(id);


--
-- TOC entry 3932 (class 2606 OID 621643)
-- Name: amocrm_leads_facts amocrm_leads_facts_general_dates_paid; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_facts
    ADD CONSTRAINT amocrm_leads_facts_general_dates_paid FOREIGN KEY (closed_id) REFERENCES public.general_dates(id);


--
-- TOC entry 3933 (class 2606 OID 621668)
-- Name: amocrm_leads_facts amocrm_leads_facts_general_traffic; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_facts
    ADD CONSTRAINT amocrm_leads_facts_general_traffic FOREIGN KEY (traffic_id) REFERENCES public.general_traffic(id);


--
-- TOC entry 3934 (class 2606 OID 621697)
-- Name: amocrm_leads_notes amocrm_leads_notes_amocrm_leads; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_notes
    ADD CONSTRAINT amocrm_leads_notes_amocrm_leads FOREIGN KEY (leads_id) REFERENCES public.amocrm_leads(id);


--
-- TOC entry 3935 (class 2606 OID 621713)
-- Name: amocrm_leads_tags amocrm_leads_tags_amocrm_leads; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_leads_tags
    ADD CONSTRAINT amocrm_leads_tags_amocrm_leads FOREIGN KEY (leads_id) REFERENCES public.amocrm_leads(id);


--
-- TOC entry 3936 (class 2606 OID 621729)
-- Name: amocrm_tasks_events amocrm_tasks_events_amocrm_tasks; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_tasks_events
    ADD CONSTRAINT amocrm_tasks_events_amocrm_tasks FOREIGN KEY (tasks_id) REFERENCES public.amocrm_tasks(id);


--
-- TOC entry 3937 (class 2606 OID 621745)
-- Name: amocrm_tasks_facts amocrm_tasks_facts_amocrm_companies; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_tasks_facts
    ADD CONSTRAINT amocrm_tasks_facts_amocrm_companies FOREIGN KEY (companies_id) REFERENCES public.amocrm_companies(id);


--
-- TOC entry 3938 (class 2606 OID 621755)
-- Name: amocrm_tasks_facts amocrm_tasks_facts_amocrm_contacts; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_tasks_facts
    ADD CONSTRAINT amocrm_tasks_facts_amocrm_contacts FOREIGN KEY (contacts_id) REFERENCES public.amocrm_contacts(id);


--
-- TOC entry 3939 (class 2606 OID 621765)
-- Name: amocrm_tasks_facts amocrm_tasks_facts_amocrm_customers; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_tasks_facts
    ADD CONSTRAINT amocrm_tasks_facts_amocrm_customers FOREIGN KEY (customers_id) REFERENCES public.amocrm_customers(id);


--
-- TOC entry 3940 (class 2606 OID 621770)
-- Name: amocrm_tasks_facts amocrm_tasks_facts_amocrm_leads; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_tasks_facts
    ADD CONSTRAINT amocrm_tasks_facts_amocrm_leads FOREIGN KEY (leads_id) REFERENCES public.amocrm_leads(id);


--
-- TOC entry 3941 (class 2606 OID 621780)
-- Name: amocrm_tasks_facts amocrm_tasks_facts_amocrm_tasks; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_tasks_facts
    ADD CONSTRAINT amocrm_tasks_facts_amocrm_tasks FOREIGN KEY (tasks_id) REFERENCES public.amocrm_tasks(id);


--
-- TOC entry 3942 (class 2606 OID 621785)
-- Name: amocrm_tasks_facts amocrm_tasks_facts_amocrm_users; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_tasks_facts
    ADD CONSTRAINT amocrm_tasks_facts_amocrm_users FOREIGN KEY (users_id) REFERENCES public.amocrm_users(id);


--
-- TOC entry 3943 (class 2606 OID 621775)
-- Name: amocrm_tasks_facts amocrm_tasks_facts_general_dates; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_tasks_facts
    ADD CONSTRAINT amocrm_tasks_facts_general_dates FOREIGN KEY (modified_id) REFERENCES public.general_dates(id);


--
-- TOC entry 3944 (class 2606 OID 621750)
-- Name: amocrm_tasks_facts amocrm_tasks_facts_general_dates_completed; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_tasks_facts
    ADD CONSTRAINT amocrm_tasks_facts_general_dates_completed FOREIGN KEY (completed_id) REFERENCES public.general_dates(id);


--
-- TOC entry 3945 (class 2606 OID 621760)
-- Name: amocrm_tasks_facts amocrm_tasks_facts_general_dates_created; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_tasks_facts
    ADD CONSTRAINT amocrm_tasks_facts_general_dates_created FOREIGN KEY (created_id) REFERENCES public.general_dates(id);


--
-- TOC entry 3946 (class 2606 OID 621802)
-- Name: amocrm_tasks_notes amocrm_tasks_notes_amocrm_tasks; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_tasks_notes
    ADD CONSTRAINT amocrm_tasks_notes_amocrm_tasks FOREIGN KEY (tasks_id) REFERENCES public.amocrm_tasks(id);


--
-- TOC entry 3947 (class 2606 OID 621818)
-- Name: amocrm_transactions_facts amocrm_transactions_facts_amocrm_companies; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_transactions_facts
    ADD CONSTRAINT amocrm_transactions_facts_amocrm_companies FOREIGN KEY (companies_id) REFERENCES public.amocrm_companies(id);


--
-- TOC entry 3948 (class 2606 OID 621823)
-- Name: amocrm_transactions_facts amocrm_transactions_facts_amocrm_contacts; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_transactions_facts
    ADD CONSTRAINT amocrm_transactions_facts_amocrm_contacts FOREIGN KEY (contacts_id) REFERENCES public.amocrm_contacts(id);


--
-- TOC entry 3949 (class 2606 OID 621828)
-- Name: amocrm_transactions_facts amocrm_transactions_facts_amocrm_customers; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_transactions_facts
    ADD CONSTRAINT amocrm_transactions_facts_amocrm_customers FOREIGN KEY (customers_id) REFERENCES public.amocrm_customers(id);


--
-- TOC entry 3950 (class 2606 OID 621838)
-- Name: amocrm_transactions_facts amocrm_transactions_facts_amocrm_transactions; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_transactions_facts
    ADD CONSTRAINT amocrm_transactions_facts_amocrm_transactions FOREIGN KEY (transactions_id) REFERENCES public.amocrm_transactions(id);


--
-- TOC entry 3951 (class 2606 OID 621843)
-- Name: amocrm_transactions_facts amocrm_transactions_facts_amocrm_users; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_transactions_facts
    ADD CONSTRAINT amocrm_transactions_facts_amocrm_users FOREIGN KEY (users_id) REFERENCES public.amocrm_users(id);


--
-- TOC entry 3952 (class 2606 OID 621833)
-- Name: amocrm_transactions_facts amocrm_transactions_facts_general_dates; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.amocrm_transactions_facts
    ADD CONSTRAINT amocrm_transactions_facts_general_dates FOREIGN KEY (dates_id) REFERENCES public.general_dates(id);


--
-- TOC entry 3872 (class 2606 OID 620956)
-- Name: general_costs_facts general_costs_facts_general_dates; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.general_costs_facts
    ADD CONSTRAINT general_costs_facts_general_dates FOREIGN KEY (dates_id) REFERENCES public.general_dates(id);


--
-- TOC entry 3873 (class 2606 OID 620961)
-- Name: general_costs_facts general_costs_facts_general_sites; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.general_costs_facts
    ADD CONSTRAINT general_costs_facts_general_sites FOREIGN KEY (sites_id) REFERENCES public.general_sites(id);


--
-- TOC entry 3874 (class 2606 OID 620966)
-- Name: general_costs_facts general_costs_facts_general_traffic; Type: FK CONSTRAINT; Schema: public; Owner: owner-gycqvgb
--

ALTER TABLE ONLY public.general_costs_facts
    ADD CONSTRAINT general_costs_facts_general_traffic FOREIGN KEY (traffic_id) REFERENCES public.general_traffic(id);


--
-- TOC entry 4241 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 4243 (class 0 OID 0)
-- Dependencies: 317
-- Name: TABLE "AMO Дополнительные параметры компа"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Дополнительные параметры компа" TO "guest-gycqvgb";


--
-- TOC entry 4244 (class 0 OID 0)
-- Dependencies: 323
-- Name: TABLE "AMO Дополнительные параметры конта"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Дополнительные параметры конта" TO "guest-gycqvgb";


--
-- TOC entry 4245 (class 0 OID 0)
-- Dependencies: 329
-- Name: TABLE "AMO Дополнительные параметры покуп"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Дополнительные параметры покуп" TO "guest-gycqvgb";


--
-- TOC entry 4246 (class 0 OID 0)
-- Dependencies: 352
-- Name: TABLE "AMO Дополнительные параметры сдело"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Дополнительные параметры сдело" TO "guest-gycqvgb";


--
-- TOC entry 4247 (class 0 OID 0)
-- Dependencies: 335
-- Name: TABLE "AMO Дополнительные параметры элеме"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Дополнительные параметры элеме" TO "guest-gycqvgb";


--
-- TOC entry 4248 (class 0 OID 0)
-- Dependencies: 347
-- Name: TABLE "AMO Задачи"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Задачи" TO "guest-gycqvgb";


--
-- TOC entry 4249 (class 0 OID 0)
-- Dependencies: 315
-- Name: TABLE "AMO Звонки"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Звонки" TO "guest-gycqvgb";


--
-- TOC entry 4250 (class 0 OID 0)
-- Dependencies: 319
-- Name: TABLE "AMO Компании"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Компании" TO "guest-gycqvgb";


--
-- TOC entry 4251 (class 0 OID 0)
-- Dependencies: 325
-- Name: TABLE "AMO Контакты"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Контакты" TO "guest-gycqvgb";


--
-- TOC entry 4252 (class 0 OID 0)
-- Dependencies: 321
-- Name: TABLE "AMO Метки компаний"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Метки компаний" TO "guest-gycqvgb";


--
-- TOC entry 4253 (class 0 OID 0)
-- Dependencies: 327
-- Name: TABLE "AMO Метки контактов"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Метки контактов" TO "guest-gycqvgb";


--
-- TOC entry 4254 (class 0 OID 0)
-- Dependencies: 333
-- Name: TABLE "AMO Метки покупателей"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Метки покупателей" TO "guest-gycqvgb";


--
-- TOC entry 4255 (class 0 OID 0)
-- Dependencies: 342
-- Name: TABLE "AMO Метки сделок"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Метки сделок" TO "guest-gycqvgb";


--
-- TOC entry 4256 (class 0 OID 0)
-- Dependencies: 345
-- Name: TABLE "AMO Параметры задач"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Параметры задач" TO "guest-gycqvgb";


--
-- TOC entry 4257 (class 0 OID 0)
-- Dependencies: 314
-- Name: TABLE "AMO Параметры звонков"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Параметры звонков" TO "guest-gycqvgb";


--
-- TOC entry 4258 (class 0 OID 0)
-- Dependencies: 316
-- Name: TABLE "AMO Параметры компаний"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Параметры компаний" TO "guest-gycqvgb";


--
-- TOC entry 4259 (class 0 OID 0)
-- Dependencies: 322
-- Name: TABLE "AMO Параметры контактов"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Параметры контактов" TO "guest-gycqvgb";


--
-- TOC entry 4260 (class 0 OID 0)
-- Dependencies: 350
-- Name: TABLE "AMO Параметры неразобранного"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Параметры неразобранного" TO "guest-gycqvgb";


--
-- TOC entry 4261 (class 0 OID 0)
-- Dependencies: 328
-- Name: TABLE "AMO Параметры покупателей"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Параметры покупателей" TO "guest-gycqvgb";


--
-- TOC entry 4262 (class 0 OID 0)
-- Dependencies: 351
-- Name: TABLE "AMO Параметры пользователей"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Параметры пользователей" TO "guest-gycqvgb";


--
-- TOC entry 4263 (class 0 OID 0)
-- Dependencies: 337
-- Name: TABLE "AMO Параметры сделок"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Параметры сделок" TO "guest-gycqvgb";


--
-- TOC entry 4264 (class 0 OID 0)
-- Dependencies: 336
-- Name: TABLE "AMO Параметры товаров"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Параметры товаров" TO "guest-gycqvgb";


--
-- TOC entry 4265 (class 0 OID 0)
-- Dependencies: 348
-- Name: TABLE "AMO Параметры транзакций"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Параметры транзакций" TO "guest-gycqvgb";


--
-- TOC entry 4266 (class 0 OID 0)
-- Dependencies: 334
-- Name: TABLE "AMO Параметры элементов"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Параметры элементов" TO "guest-gycqvgb";


--
-- TOC entry 4267 (class 0 OID 0)
-- Dependencies: 331
-- Name: TABLE "AMO Покупатели"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Покупатели" TO "guest-gycqvgb";


--
-- TOC entry 4268 (class 0 OID 0)
-- Dependencies: 353
-- Name: TABLE "AMO Примечания задач"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Примечания задач" TO "guest-gycqvgb";


--
-- TOC entry 4269 (class 0 OID 0)
-- Dependencies: 320
-- Name: TABLE "AMO Примечания компаний"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Примечания компаний" TO "guest-gycqvgb";


--
-- TOC entry 4270 (class 0 OID 0)
-- Dependencies: 326
-- Name: TABLE "AMO Примечания контактов"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Примечания контактов" TO "guest-gycqvgb";


--
-- TOC entry 4271 (class 0 OID 0)
-- Dependencies: 332
-- Name: TABLE "AMO Примечания покупателей"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Примечания покупателей" TO "guest-gycqvgb";


--
-- TOC entry 4272 (class 0 OID 0)
-- Dependencies: 341
-- Name: TABLE "AMO Примечания сделок"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Примечания сделок" TO "guest-gycqvgb";


--
-- TOC entry 4273 (class 0 OID 0)
-- Dependencies: 340
-- Name: TABLE "AMO Сделки"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Сделки" TO "guest-gycqvgb";


--
-- TOC entry 4274 (class 0 OID 0)
-- Dependencies: 346
-- Name: TABLE "AMO События задач"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO События задач" TO "guest-gycqvgb";


--
-- TOC entry 4275 (class 0 OID 0)
-- Dependencies: 318
-- Name: TABLE "AMO События компаний"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO События компаний" TO "guest-gycqvgb";


--
-- TOC entry 4276 (class 0 OID 0)
-- Dependencies: 324
-- Name: TABLE "AMO События контактов"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO События контактов" TO "guest-gycqvgb";


--
-- TOC entry 4277 (class 0 OID 0)
-- Dependencies: 339
-- Name: TABLE "AMO События сделок"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO События сделок" TO "guest-gycqvgb";


--
-- TOC entry 4278 (class 0 OID 0)
-- Dependencies: 343
-- Name: TABLE "AMO Справочник воронок"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Справочник воронок" TO "guest-gycqvgb";


--
-- TOC entry 4279 (class 0 OID 0)
-- Dependencies: 344
-- Name: TABLE "AMO Справочник этапов продаж"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Справочник этапов продаж" TO "guest-gycqvgb";


--
-- TOC entry 4280 (class 0 OID 0)
-- Dependencies: 349
-- Name: TABLE "AMO Транзакции"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Транзакции" TO "guest-gycqvgb";


--
-- TOC entry 4281 (class 0 OID 0)
-- Dependencies: 330
-- Name: TABLE "AMO Элементы покупателей"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Элементы покупателей" TO "guest-gycqvgb";


--
-- TOC entry 4282 (class 0 OID 0)
-- Dependencies: 338
-- Name: TABLE "AMO Элементы сделок"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Элементы сделок" TO "guest-gycqvgb";


--
-- TOC entry 4283 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE "SHD Параметры дат"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."SHD Параметры дат" TO "guest-gycqvgb";


--
-- TOC entry 4284 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE "SHD Параметры источников данных"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."SHD Параметры источников данных" TO "guest-gycqvgb";


--
-- TOC entry 4285 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE "SHD Параметры местоположений"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."SHD Параметры местоположений" TO "guest-gycqvgb";


--
-- TOC entry 4286 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE "SHD Параметры посетителей"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."SHD Параметры посетителей" TO "guest-gycqvgb";


--
-- TOC entry 4287 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE "SHD Параметры сайтов"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."SHD Параметры сайтов" TO "guest-gycqvgb";


--
-- TOC entry 4288 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE "SHD Параметры трафика"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."SHD Параметры трафика" TO "guest-gycqvgb";


--
-- TOC entry 4289 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE "SHD Статистика по расходам"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."SHD Статистика по расходам" TO "guest-gycqvgb";


-- Completed on 2023-12-21 14:44:18

--
-- PostgreSQL database dump complete
--

