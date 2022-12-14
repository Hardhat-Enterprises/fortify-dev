--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2 (Debian 14.2-1.pgdg110+1)

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
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: domain_email; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.domain_email AS public.citext
	CONSTRAINT domain_email_check_new CHECK ((VALUE OPERATOR(public.~) '^\w+@[a-zA-Z]+?.[a-zA-Z]+?.[a-zA-Z]{2,3}$'::public.citext));


ALTER DOMAIN public.domain_email OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
    comp_name character varying(100) NOT NULL,
    comp_email character varying(100) NOT NULL,
    comp_address character varying(100) NOT NULL
);


ALTER TABLE public.company OWNER TO postgres;

--
-- Name: helpers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.helpers (
    helper_id integer NOT NULL,
    helper_username character varying(100) NOT NULL,
    helper_password character varying(100) NOT NULL,
    helper_email character varying(100) NOT NULL,
    date_created date NOT NULL,
    helper_phonenum character varying(100) NOT NULL
);


ALTER TABLE public.helpers OWNER TO postgres;

--
-- Name: organisations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organisations (
    org_name character varying(30) NOT NULL,
    contact_name character(30) NOT NULL,
    contact_number character varying(20),
    contact_email public.domain_email NOT NULL,
    phishing boolean NOT NULL,
    vulnerability_management boolean NOT NULL,
    cyber_awareness boolean NOT NULL
);


ALTER TABLE public.organisations OWNER TO postgres;

--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    serv_type character varying(50) NOT NULL,
    serv_date date NOT NULL,
    comp_name character varying(50) NOT NULL
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id bigint NOT NULL,
    user_username character varying(100) NOT NULL,
    user_password character varying(100) NOT NULL,
    user_email character varying(100) NOT NULL,
    date_created date NOT NULL,
    timzezone character varying(100) NOT NULL,
    city character varying(100) NOT NULL,
    user_phonenum character varying(100) NOT NULL,
    comp_name character varying(100) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: volunteer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.volunteer (
    name character varying(100) NOT NULL,
    email public.domain_email NOT NULL,
    contact_number character varying(100) NOT NULL,
    company character varying(100) NOT NULL
);


ALTER TABLE public.volunteer OWNER TO postgres;

--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company (comp_name, comp_email, comp_address) FROM stdin;
\.


--
-- Data for Name: helpers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.helpers (helper_id, helper_username, helper_password, helper_email, date_created, helper_phonenum) FROM stdin;
\.


--
-- Data for Name: organisations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.organisations (org_name, contact_name, contact_number, contact_email, phishing, vulnerability_management, cyber_awareness) FROM stdin;
Alpha Limited	Tim Riley                     	456456456	timriley@gmail.com	f	t	f
Bravo Pty. Ltd.	Matthew Brown                 	412498234	matthewbrown@outlook.com	f	f	t
Charlie University	Daniel Mills                  	412121212	danielmills@yahoo.com	t	t	f
Delta School	Bob Prendergast               	400000000	bobprendergast@deakin.edu.au	t	t	t
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (serv_type, serv_date, comp_name) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, user_username, user_password, user_email, date_created, timzezone, city, user_phonenum, comp_name) FROM stdin;
\.


--
-- Data for Name: volunteer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.volunteer (name, email, contact_number, company) FROM stdin;
Michael Smith	michaelsmith@gmail.com	488123456	Acme Enterprises
Janet Grey	janetgrey@outlook.com	400987654	Bravo Industries
Linda Breen	lindabreen@yahoo.com	409123789	Charlie Company
Sam Keibler	samuelkeibler@student.monash.edu	400345345	Delta
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (comp_name);


--
-- Name: helpers helpers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.helpers
    ADD CONSTRAINT helpers_pkey PRIMARY KEY (helper_id);


--
-- Name: organisations organisations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organisations
    ADD CONSTRAINT organisations_pkey PRIMARY KEY (org_name);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (serv_type);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: volunteer volunteer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteer
    ADD CONSTRAINT volunteer_pkey PRIMARY KEY (email);


--
-- Name: services services_comp_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_comp_name_fkey FOREIGN KEY (comp_name) REFERENCES public.company(comp_name);


--
-- Name: users users_comp_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_comp_name_fkey FOREIGN KEY (comp_name) REFERENCES public.company(comp_name);


--
-- PostgreSQL database dump complete
--

