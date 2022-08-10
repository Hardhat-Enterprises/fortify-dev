--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2

-- Started on 2022-04-23 06:28:37 UTC

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF-8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 16531)
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- TOC entry 889 (class 1247 OID 16637)
-- Name: domain_email; Type: DOMAIN; Schema: public; Owner: postgres
--

CREATE DOMAIN public.domain_email AS public.citext
	CONSTRAINT domain_email_check CHECK ((VALUE OPERATOR(public.~) '^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$'::public.citext));


ALTER DOMAIN public.domain_email OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 16478)
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
    comp_name character varying(100) NOT NULL,
    comp_email character varying(100) NOT NULL,
    comp_address character varying(100) NOT NULL
);


ALTER TABLE public.company OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16516)
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
-- TOC entry 215 (class 1259 OID 16639)
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
-- TOC entry 214 (class 1259 OID 16521)
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    serv_type character varying(50) NOT NULL,
    serv_date date NOT NULL,
    comp_name character varying(50) NOT NULL
);


ALTER TABLE public.services OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16503)
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
-- TOC entry 211 (class 1259 OID 16502)
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
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 216 (class 1259 OID 16653)
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
-- TOC entry 3282 (class 2604 OID 16506)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 3284 (class 2606 OID 16482)
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (comp_name);


--
-- TOC entry 3288 (class 2606 OID 16520)
-- Name: helpers helpers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.helpers
    ADD CONSTRAINT helpers_pkey PRIMARY KEY (helper_id);


--
-- TOC entry 3292 (class 2606 OID 16645)
-- Name: organisations organisations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organisations
    ADD CONSTRAINT organisations_pkey PRIMARY KEY (org_name);


--
-- TOC entry 3290 (class 2606 OID 16525)
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (serv_type);


--
-- TOC entry 3286 (class 2606 OID 16510)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3294 (class 2606 OID 16659)
-- Name: volunteer volunteer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.volunteer
    ADD CONSTRAINT volunteer_pkey PRIMARY KEY (email);


--
-- TOC entry 3296 (class 2606 OID 16526)
-- Name: services services_comp_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_comp_name_fkey FOREIGN KEY (comp_name) REFERENCES public.company(comp_name);


--
-- TOC entry 3295 (class 2606 OID 16511)
-- Name: users users_comp_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_comp_name_fkey FOREIGN KEY (comp_name) REFERENCES public.company(comp_name);


-- Completed on 2022-04-23 06:28:38 UTC

--
-- PostgreSQL database dump complete
--

