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

DROP TABLE IF EXISTS public.visita;
DROP TABLE IF EXISTS public.vivenda;
DROP TABLE IF EXISTS public.localidade;
DROP TABLE IF EXISTS public.cliente;
DROP TABLE IF EXISTS public.axenteventas;

--
-- Name: axenteventas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.axenteventas (
    codaxente character varying(10) NOT NULL,
    nome character varying(25),
    apelidos character varying(50),
    datacontratacion date,
    categoria character varying(15),
    data_alta date NOT NULL,
    data_modificacion date
);


--
-- Name: cliente; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cliente (
    nif character varying(10) NOT NULL,
    nome character varying(15),
    apelidos character varying(15)
);


--
-- Name: localidade; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.localidade (
    codigo character varying(10) NOT NULL,
    nome character varying(35) NOT NULL,
    provincia character varying(25) NOT NULL,
    categoria character varying(15),
    data_alta date NOT NULL,
    data_modificacion date
);

--
-- Name: vivenda; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vivenda (
    refcatastral character varying(15) NOT NULL,
    enderezo character varying(50),
    cp character varying(5),
    codlocalidade character varying(10) NOT NULL,
    nifcliente character varying(10) NOT NULL
);

--
-- Name: visita; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.visita (
    codvisita character varying(10) NOT NULL,
    datahora timestamp without time zone,
    nifcliente character varying(10) NOT NULL,
    codaxente character varying(10) NOT NULL,
    refcatastral character varying(15) NOT NULL
);





--
-- Name: axenteventas axenteVentas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.axenteventas
    ADD CONSTRAINT "axenteVentas_pkey" PRIMARY KEY (codaxente);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (nif);


--
-- Name: localidade localidade_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.localidade
    ADD CONSTRAINT localidade_pkey PRIMARY KEY (codigo);


--
-- Name: visita visita_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_pkey PRIMARY KEY (codvisita);


--
-- Name: vivenda vivenda_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vivenda
    ADD CONSTRAINT vivenda_pkey PRIMARY KEY (refcatastral);


--
-- Name: visita visita_axenteventas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_axenteventas_fk FOREIGN KEY (codaxente) REFERENCES public.axenteventas(codaxente);


--
-- Name: visita visita_cliente_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_cliente_fk FOREIGN KEY (nifcliente) REFERENCES public.cliente(nif);


--
-- Name: visita visita_vivenda_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.visita
    ADD CONSTRAINT visita_vivenda_fk FOREIGN KEY (refcatastral) REFERENCES public.vivenda(refcatastral);


--
-- Name: vivenda vivenda_cliente_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vivenda
    ADD CONSTRAINT vivenda_cliente_fk FOREIGN KEY (nifcliente) REFERENCES public.cliente(nif);


--
-- Name: vivenda vivenda_localidade_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vivenda
    ADD CONSTRAINT vivenda_localidade_fk FOREIGN KEY (codlocalidade) REFERENCES public.localidade(codigo);


ALTER TABLE public.visita
    OWNER TO myuser;
ALTER TABLE public.vivenda
    OWNER TO myuser;
ALTER TABLE public.localidade
    OWNER TO myuser;
ALTER TABLE public.cliente
    OWNER TO myuser;
ALTER TABLE public.axenteventas
    OWNER TO myuser;


--
-- PostgreSQL database dump complete
--

