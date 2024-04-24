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


--
-- Data for Name: axenteventas; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.axenteventas (codaxente, nome, apelidos, datacontratacion, categoria, data_alta, data_modificacion) VALUES ('A003', 'Filemon', 'Tadito', '2020-02-01', 'Junior', '2020-02-02', NULL);

UPDATE public.axenteventas
SET categoria='SeniorPlus', data_modificacion='2020-02-01'
WHERE codaxente='A001';

--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cliente (nif, nome, apelidos) VALUES ('C003', 'Camila', 'Vadora');
INSERT INTO public.cliente (nif, nome, apelidos) VALUES ('C007', 'Peyo', 'Gurdefresa');


--
-- Data for Name: localidade; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.localidade (codigo, nome, provincia, data_alta, data_modificacion, categoria) VALUES ('L004', 'Ferrol', 'A Coruña', '2020-02-01', NULL, 'Normal');

UPDATE public.localidade
SET categoria='Prioritaria', data_modificacion='2020-02-02'
WHERE codigo='L003';


--
-- Data for Name: vivenda; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.vivenda (refcatastral, enderezo, cp, codlocalidade, nifcliente) VALUES ('R0003', 'R/ Amapola 4, 5A', '15007', 'L001', 'C001');
INSERT INTO public.vivenda (refcatastral, enderezo, cp, codlocalidade, nifcliente) VALUES ('R0004', 'R/ Ameixeiras 3, 4B', '27004', 'L003', 'C003');


--
-- Data for Name: visita; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.visita (codvisita, datahora, nifcliente, codaxente, refcatastral) VALUES ('V0004', '2020-02-15 11:00:00', 'C006', 'A001', 'R0001');
INSERT INTO public.visita (codvisita, datahora, nifcliente, codaxente, refcatastral) VALUES ('V0005', '2020-02-20 10:00:00', 'C007', 'A003', 'R0003');



