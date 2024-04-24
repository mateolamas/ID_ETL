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

INSERT INTO public.axenteventas (codaxente, nome, apelidos, datacontratacion, categoria, data_alta, data_modificacion) VALUES ('A001', 'Francisco', 'Corico', '2020-01-01', 'Senior', '2020-01-02', NULL);
INSERT INTO public.axenteventas (codaxente, nome, apelidos, datacontratacion, categoria, data_alta, data_modificacion) VALUES ('A002', 'Rosana', 'Tural', '2020-01-01', 'Senior', '2020-01-02', NULL);


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.cliente (nif, nome, apelidos) VALUES ('C001', 'Perico', 'Bertizo');
INSERT INTO public.cliente (nif, nome, apelidos) VALUES ('C002', 'Santiago', 'Teron');
INSERT INTO public.cliente (nif, nome, apelidos) VALUES ('C004', 'Petula', 'Mentacion');
INSERT INTO public.cliente (nif, nome, apelidos) VALUES ('C005', 'Roberto', 'Cadiscos');
INSERT INTO public.cliente (nif, nome, apelidos) VALUES ('C006', 'Susana', 'Tacion');


--
-- Data for Name: localidade; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.localidade (codigo, nome, provincia, data_alta, data_modificacion, categoria) VALUES ('L001', 'A Coruña', 'A Coruña', '2020-01-05', NULL, 'Normal');
INSERT INTO public.localidade (codigo, nome, provincia, data_alta, data_modificacion, categoria) VALUES ('L002', 'Santiago de Compostela', 'A Coruña', '2020-01-05', NULL, 'Prioritaria');
INSERT INTO public.localidade (codigo, nome, provincia, data_alta, data_modificacion, categoria) VALUES ('L003', 'Lugo', 'Lugo', '2020-01-05', NULL, 'Normal');


--
-- Data for Name: vivenda; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.vivenda (refcatastral, enderezo, cp, codlocalidade, nifcliente) VALUES ('R0001', 'R/ Margarida, 1, 1A', '15001', 'L001', 'C001');
INSERT INTO public.vivenda (refcatastral, enderezo, cp, codlocalidade, nifcliente) VALUES ('R0002', 'R/ Gardenia, 3, 2C', '15005', 'L001', 'C002');


--
-- Data for Name: visita; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.visita (codvisita, datahora, nifcliente, codaxente, refcatastral) VALUES ('V0000', '2020-01-10 10:00:00', 'C004', 'A001', 'R0001');
INSERT INTO public.visita (codvisita, datahora, nifcliente, codaxente, refcatastral) VALUES ('V0001', '2020-01-01 11:00:00', 'C005', 'A001', 'R0001');
INSERT INTO public.visita (codvisita, datahora, nifcliente, codaxente, refcatastral) VALUES ('V0002', '2020-01-10 12:00:00', 'C006', 'A001', 'R0001');
INSERT INTO public.visita (codvisita, datahora, nifcliente, codaxente, refcatastral) VALUES ('V0003', '2020-01-15 17:00:00', 'C006', 'A002', 'R0002');





--
-- PostgreSQL database dump complete
--

