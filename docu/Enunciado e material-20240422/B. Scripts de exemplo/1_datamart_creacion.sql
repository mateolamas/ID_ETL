--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

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

SET default_table_access_method = heap;


DROP TABLE IF EXISTS public.fact_visitas;
DROP TABLE IF EXISTS public.dim_mes;
DROP TABLE IF EXISTS public.dim_localidade;
DROP TABLE IF EXISTS public.dim_axente;


--
-- Name: dim_axente; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dim_axente (
    idaxente numeric(6,0) NOT NULL,
    codaxente character varying(10),
    nome character varying(25),
    apelidos character varying(50),
    datacontratacion date,
    categoria character varying(15)
);


--
-- Name: dim_localidade; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dim_localidade (
    idlocalidade numeric(6,0) NOT NULL,
    codlocalidade character varying(10),
    nome character varying(35),
    provincia character varying(25),
    categoria character varying(15),
    habitantes numeric(7,0)
);


--
-- Name: dim_mes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dim_mes (
    idmes numeric(6,0) NOT NULL,
    mes numeric(2,0),
    nomemes character varying(15),
    ano numeric(4,0)
);


--
-- Name: fact_visitas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fact_visitas (
    idaxente numeric(6,0) NOT NULL,
    idlocalidade numeric(6,0) NOT NULL,
    idmes numeric(6,0) NOT NULL,
    numvisitas numeric(6,0) NOT NULL
);


--
-- Data for Name: dim_axente; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: dim_localidade; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Data for Name: dim_mes; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.dim_mes (idmes, mes, nomemes, ano) VALUES (1, 1, 'Xaneiro', 2020);
INSERT INTO public.dim_mes (idmes, mes, nomemes, ano) VALUES (2, 2, 'Febreiro', 2020);


--
-- Data for Name: fact_visitas; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Name: dim_axente dim_axente_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dim_axente
    ADD CONSTRAINT dim_axente_pkey PRIMARY KEY (idaxente);


--
-- Name: dim_mes dim_mes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dim_mes
    ADD CONSTRAINT dim_mes_pkey PRIMARY KEY (idmes);


--
-- Name: dim_localidade dim_zona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dim_localidade
    ADD CONSTRAINT dim_zona_pkey PRIMARY KEY (idlocalidade);


--
-- Name: fact_visitas fact_visitas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fact_visitas
    ADD CONSTRAINT fact_visitas_pkey PRIMARY KEY (idaxente, idlocalidade, idmes);


ALTER TABLE public.fact_visitas
    OWNER TO myuser;
ALTER TABLE public.dim_mes
    OWNER TO myuser;
ALTER TABLE public.dim_localidade
    OWNER TO myuser;
ALTER TABLE public.dim_axente
    OWNER TO myuser;


--
-- PostgreSQL database dump complete
--

