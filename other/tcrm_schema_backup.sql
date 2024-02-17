--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Ubuntu 14.10-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.2

-- Started on 2023-12-21 14:45:33

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
-- TOC entry 4147 (class 0 OID 0)
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
-- TOC entry 4195 (class 0 OID 0)
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
-- TOC entry 4196 (class 0 OID 0)
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
-- TOC entry 4197 (class 0 OID 0)
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
-- TOC entry 4198 (class 0 OID 0)
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
-- TOC entry 4199 (class 0 OID 0)
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
-- TOC entry 4200 (class 0 OID 0)
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
-- TOC entry 4201 (class 0 OID 0)
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
-- TOC entry 4202 (class 0 OID 0)
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
-- TOC entry 4203 (class 0 OID 0)
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
-- TOC entry 4204 (class 0 OID 0)
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
-- TOC entry 4205 (class 0 OID 0)
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
-- TOC entry 4206 (class 0 OID 0)
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
-- TOC entry 4207 (class 0 OID 0)
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
-- TOC entry 4208 (class 0 OID 0)
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
-- TOC entry 4209 (class 0 OID 0)
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
-- TOC entry 4210 (class 0 OID 0)
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
-- TOC entry 4211 (class 0 OID 0)
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
-- TOC entry 4212 (class 0 OID 0)
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
-- TOC entry 4213 (class 0 OID 0)
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
-- TOC entry 4214 (class 0 OID 0)
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
-- TOC entry 4215 (class 0 OID 0)
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
-- TOC entry 4216 (class 0 OID 0)
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
-- TOC entry 4217 (class 0 OID 0)
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
-- TOC entry 4218 (class 0 OID 0)
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
-- TOC entry 4219 (class 0 OID 0)
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
-- TOC entry 4220 (class 0 OID 0)
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
-- TOC entry 4221 (class 0 OID 0)
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
-- TOC entry 4222 (class 0 OID 0)
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
-- TOC entry 4223 (class 0 OID 0)
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
-- TOC entry 4224 (class 0 OID 0)
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
-- TOC entry 4225 (class 0 OID 0)
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
-- TOC entry 4226 (class 0 OID 0)
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
-- TOC entry 4227 (class 0 OID 0)
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
-- TOC entry 4228 (class 0 OID 0)
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
-- TOC entry 4229 (class 0 OID 0)
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
-- TOC entry 4230 (class 0 OID 0)
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
-- TOC entry 4231 (class 0 OID 0)
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
-- TOC entry 4232 (class 0 OID 0)
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
-- TOC entry 4233 (class 0 OID 0)
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
-- TOC entry 4234 (class 0 OID 0)
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
-- TOC entry 4235 (class 0 OID 0)
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
-- TOC entry 4236 (class 0 OID 0)
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
-- TOC entry 4237 (class 0 OID 0)
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
-- TOC entry 4238 (class 0 OID 0)
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
-- TOC entry 4239 (class 0 OID 0)
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
-- TOC entry 4240 (class 0 OID 0)
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
-- TOC entry 4241 (class 0 OID 0)
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
-- TOC entry 4146 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 4148 (class 0 OID 0)
-- Dependencies: 317
-- Name: TABLE "AMO Дополнительные параметры компа"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Дополнительные параметры компа" TO "guest-gycqvgb";


--
-- TOC entry 4149 (class 0 OID 0)
-- Dependencies: 323
-- Name: TABLE "AMO Дополнительные параметры конта"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Дополнительные параметры конта" TO "guest-gycqvgb";


--
-- TOC entry 4150 (class 0 OID 0)
-- Dependencies: 329
-- Name: TABLE "AMO Дополнительные параметры покуп"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Дополнительные параметры покуп" TO "guest-gycqvgb";


--
-- TOC entry 4151 (class 0 OID 0)
-- Dependencies: 352
-- Name: TABLE "AMO Дополнительные параметры сдело"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Дополнительные параметры сдело" TO "guest-gycqvgb";


--
-- TOC entry 4152 (class 0 OID 0)
-- Dependencies: 335
-- Name: TABLE "AMO Дополнительные параметры элеме"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Дополнительные параметры элеме" TO "guest-gycqvgb";


--
-- TOC entry 4153 (class 0 OID 0)
-- Dependencies: 347
-- Name: TABLE "AMO Задачи"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Задачи" TO "guest-gycqvgb";


--
-- TOC entry 4154 (class 0 OID 0)
-- Dependencies: 315
-- Name: TABLE "AMO Звонки"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Звонки" TO "guest-gycqvgb";


--
-- TOC entry 4155 (class 0 OID 0)
-- Dependencies: 319
-- Name: TABLE "AMO Компании"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Компании" TO "guest-gycqvgb";


--
-- TOC entry 4156 (class 0 OID 0)
-- Dependencies: 325
-- Name: TABLE "AMO Контакты"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Контакты" TO "guest-gycqvgb";


--
-- TOC entry 4157 (class 0 OID 0)
-- Dependencies: 321
-- Name: TABLE "AMO Метки компаний"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Метки компаний" TO "guest-gycqvgb";


--
-- TOC entry 4158 (class 0 OID 0)
-- Dependencies: 327
-- Name: TABLE "AMO Метки контактов"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Метки контактов" TO "guest-gycqvgb";


--
-- TOC entry 4159 (class 0 OID 0)
-- Dependencies: 333
-- Name: TABLE "AMO Метки покупателей"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Метки покупателей" TO "guest-gycqvgb";


--
-- TOC entry 4160 (class 0 OID 0)
-- Dependencies: 342
-- Name: TABLE "AMO Метки сделок"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Метки сделок" TO "guest-gycqvgb";


--
-- TOC entry 4161 (class 0 OID 0)
-- Dependencies: 345
-- Name: TABLE "AMO Параметры задач"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Параметры задач" TO "guest-gycqvgb";


--
-- TOC entry 4162 (class 0 OID 0)
-- Dependencies: 314
-- Name: TABLE "AMO Параметры звонков"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Параметры звонков" TO "guest-gycqvgb";


--
-- TOC entry 4163 (class 0 OID 0)
-- Dependencies: 316
-- Name: TABLE "AMO Параметры компаний"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Параметры компаний" TO "guest-gycqvgb";


--
-- TOC entry 4164 (class 0 OID 0)
-- Dependencies: 322
-- Name: TABLE "AMO Параметры контактов"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Параметры контактов" TO "guest-gycqvgb";


--
-- TOC entry 4165 (class 0 OID 0)
-- Dependencies: 350
-- Name: TABLE "AMO Параметры неразобранного"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Параметры неразобранного" TO "guest-gycqvgb";


--
-- TOC entry 4166 (class 0 OID 0)
-- Dependencies: 328
-- Name: TABLE "AMO Параметры покупателей"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Параметры покупателей" TO "guest-gycqvgb";


--
-- TOC entry 4167 (class 0 OID 0)
-- Dependencies: 351
-- Name: TABLE "AMO Параметры пользователей"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Параметры пользователей" TO "guest-gycqvgb";


--
-- TOC entry 4168 (class 0 OID 0)
-- Dependencies: 337
-- Name: TABLE "AMO Параметры сделок"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Параметры сделок" TO "guest-gycqvgb";


--
-- TOC entry 4169 (class 0 OID 0)
-- Dependencies: 336
-- Name: TABLE "AMO Параметры товаров"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Параметры товаров" TO "guest-gycqvgb";


--
-- TOC entry 4170 (class 0 OID 0)
-- Dependencies: 348
-- Name: TABLE "AMO Параметры транзакций"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Параметры транзакций" TO "guest-gycqvgb";


--
-- TOC entry 4171 (class 0 OID 0)
-- Dependencies: 334
-- Name: TABLE "AMO Параметры элементов"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Параметры элементов" TO "guest-gycqvgb";


--
-- TOC entry 4172 (class 0 OID 0)
-- Dependencies: 331
-- Name: TABLE "AMO Покупатели"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Покупатели" TO "guest-gycqvgb";


--
-- TOC entry 4173 (class 0 OID 0)
-- Dependencies: 353
-- Name: TABLE "AMO Примечания задач"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Примечания задач" TO "guest-gycqvgb";


--
-- TOC entry 4174 (class 0 OID 0)
-- Dependencies: 320
-- Name: TABLE "AMO Примечания компаний"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Примечания компаний" TO "guest-gycqvgb";


--
-- TOC entry 4175 (class 0 OID 0)
-- Dependencies: 326
-- Name: TABLE "AMO Примечания контактов"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Примечания контактов" TO "guest-gycqvgb";


--
-- TOC entry 4176 (class 0 OID 0)
-- Dependencies: 332
-- Name: TABLE "AMO Примечания покупателей"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Примечания покупателей" TO "guest-gycqvgb";


--
-- TOC entry 4177 (class 0 OID 0)
-- Dependencies: 341
-- Name: TABLE "AMO Примечания сделок"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Примечания сделок" TO "guest-gycqvgb";


--
-- TOC entry 4178 (class 0 OID 0)
-- Dependencies: 340
-- Name: TABLE "AMO Сделки"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Сделки" TO "guest-gycqvgb";


--
-- TOC entry 4179 (class 0 OID 0)
-- Dependencies: 346
-- Name: TABLE "AMO События задач"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO События задач" TO "guest-gycqvgb";


--
-- TOC entry 4180 (class 0 OID 0)
-- Dependencies: 318
-- Name: TABLE "AMO События компаний"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO События компаний" TO "guest-gycqvgb";


--
-- TOC entry 4181 (class 0 OID 0)
-- Dependencies: 324
-- Name: TABLE "AMO События контактов"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO События контактов" TO "guest-gycqvgb";


--
-- TOC entry 4182 (class 0 OID 0)
-- Dependencies: 339
-- Name: TABLE "AMO События сделок"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO События сделок" TO "guest-gycqvgb";


--
-- TOC entry 4183 (class 0 OID 0)
-- Dependencies: 343
-- Name: TABLE "AMO Справочник воронок"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Справочник воронок" TO "guest-gycqvgb";


--
-- TOC entry 4184 (class 0 OID 0)
-- Dependencies: 344
-- Name: TABLE "AMO Справочник этапов продаж"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Справочник этапов продаж" TO "guest-gycqvgb";


--
-- TOC entry 4185 (class 0 OID 0)
-- Dependencies: 349
-- Name: TABLE "AMO Транзакции"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Транзакции" TO "guest-gycqvgb";


--
-- TOC entry 4186 (class 0 OID 0)
-- Dependencies: 330
-- Name: TABLE "AMO Элементы покупателей"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Элементы покупателей" TO "guest-gycqvgb";


--
-- TOC entry 4187 (class 0 OID 0)
-- Dependencies: 338
-- Name: TABLE "AMO Элементы сделок"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."AMO Элементы сделок" TO "guest-gycqvgb";


--
-- TOC entry 4188 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE "SHD Параметры дат"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."SHD Параметры дат" TO "guest-gycqvgb";


--
-- TOC entry 4189 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE "SHD Параметры источников данных"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."SHD Параметры источников данных" TO "guest-gycqvgb";


--
-- TOC entry 4190 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE "SHD Параметры местоположений"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."SHD Параметры местоположений" TO "guest-gycqvgb";


--
-- TOC entry 4191 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE "SHD Параметры посетителей"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."SHD Параметры посетителей" TO "guest-gycqvgb";


--
-- TOC entry 4192 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE "SHD Параметры сайтов"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."SHD Параметры сайтов" TO "guest-gycqvgb";


--
-- TOC entry 4193 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE "SHD Параметры трафика"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."SHD Параметры трафика" TO "guest-gycqvgb";


--
-- TOC entry 4194 (class 0 OID 0)
-- Dependencies: 229
-- Name: TABLE "SHD Статистика по расходам"; Type: ACL; Schema: public; Owner: owner-gycqvgb
--

GRANT SELECT ON TABLE public."SHD Статистика по расходам" TO "guest-gycqvgb";


-- Completed on 2023-12-21 14:45:36

--
-- PostgreSQL database dump complete
--

