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

DROP TABLE IF EXISTS public.practica;
DROP TABLE IF EXISTS public.profesor;
DROP TABLE IF EXISTS public.alumno;
DROP TABLE IF EXISTS public."registroMecanico";
DROP TABLE IF EXISTS public.vehiculo;



--
-- Name: profesor; Type: TABLE; Schema: public; Owner: -
--
CREATE TABLE public.profesor (
    nif character varying(9) PRIMARY KEY,
    nombre character varying(25),
    apellidos character varying(50),
    telefono numeric(9),
    direccion character varying(30),
    salario numeric(5, 2)
);


--
-- Name: alumno; Type: TABLE; Schema: public; Owner: -
--
CREATE TABLE public.alumno (
    nif character varying(9) PRIMARY KEY,
    nombre character varying(25),
    apellidos character varying(50),
    "fechaNacimiento" date,
    direccion character varying(30),
    email character varying(30)
);


--
-- Name: practica; Type: TABLE; Schema: public; Owner: -
--
CREATE TABLE public.practica (
    "codPractica" character varying(10) PRIMARY KEY,
    "fechaPractica" date,
    precio numeric(4, 2),
    "tipoPago" character varying(15),
    "nifAlumno" character varying(9),
    "nifProfesor" character varying(9),
    "matriculaVehiculo" character varying(7)
);


--
-- Name: vehiculo; Type: TABLE; Schema: public; Owner: -
--
CREATE TABLE public.vehiculo (
    matricula character varying(7) PRIMARY KEY,
    "fechaAdquisicion" date,
    modelo character varying(30),
    "numAsientos" numeric(3)
);


--
-- Name: registroMecanico; Type: TABLE; Schema: public; Owner: -
--
CREATE TABLE public."registroMecanico" (
    "codRegistro" character varying(5) PRIMARY KEY,
    taller character varying(15),
    descripcion character varying(30),
    precio numeric(6, 2),
    "fechaRegistro" date,
    "matriculaVehiculo" character varying(7)
);


--
-- Name: visita visita_axenteventas_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."registroMecanico"
    ADD CONSTRAINT "vehiculo_registroMecanico_fk" FOREIGN KEY ("matriculaVehiculo") REFERENCES public.vehiculo(matricula);

ALTER TABLE ONLY public.practica
    ADD CONSTRAINT practica_alumno_fk FOREIGN KEY ("nifAlumno") REFERENCES public.alumno(nif);

ALTER TABLE ONLY public.practica
    ADD CONSTRAINT practica_profesor_fk FOREIGN KEY ("nifProfesor") REFERENCES public.profesor(nif);

--
-- INSERT SECTION
--

--
-- Data for Name: profesor; Type: TABLE DATA; Schema: public; Owner: -
--
INSERT INTO public.profesor (nif, nombre, apellidos, telefono, direccion, salario) VALUES ('74924381B', 'Francisco', 'Corico', 975234187, 'Avenida 3 número 4 A Coruña', 1500);
INSERT INTO public.profesor (nif, nombre, apellidos, telefono, direccion, salario) VALUES ('23342942N', 'Rosana', 'Tural', 911827644, 'Avenida 1 número 16 Pontevedra', 1600);
INSERT INTO public.profesor (nif, nombre, apellidos, telefono, direccion, salario) VALUES ('79212312L', 'Manolo', 'Rodriguez', 655312321, 'Rúa 3 número 2 Moaña Pontevedra', 1800);


--
-- Data for Name: alumno; Type: TABLE DATA; Schema: public; Owner: -
--
INSERT INTO public.alumno (nif, nombre, apellidos, fechaNacimiento, direccion, email) VALUES ('74924381B', 'Manuel', 'Ameal', '2000-01-05', 'Torre de Abaixo número 2 A Coruña', "manuel.ameal@correo.com");
INSERT INTO public.alumno (nif, nombre, apellidos, fechaNacimiento, direccion, email) VALUES ('45984511U', 'Úrsula', 'Ozores', '1996-05-07', 'Rúa 8 número 6 A Coruña', "ursula.ozores@correo.com");
INSERT INTO public.alumno (nif, nombre, apellidos, fechaNacimiento, direccion, email) VALUES ('84214356X', 'Tania', 'Diz', '2002-09-03', 'Torre de Arriba número 2 Pontevedra', "tania.diz@correo.com");
INSERT INTO public.alumno (nif, nombre, apellidos, fechaNacimiento, direccion, email) VALUES ('92342123O', 'Mateo', 'Johnson', '1999-09-03', 'Torre de Abaixo número 2 Lugo', "mateo.johnson@correo.com");

--
-- Data for Name: vehiculo; Type: TABLE DATA; Schema: public; Owner: -
--
INSERT INTO public.vehiculo (matricula, fechaAdquisicion, modelo, numAsientos) VALUES ('COR12935', '2015-02-09', 'Audi Q7', 5);
INSERT INTO public.vehiculo (matricula, fechaAdquisicion, modelo, numAsientos) VALUES ('43439242', '2018-06-11', 'Kia Ceed', 5);
INSERT INTO public.vehiculo (matricula, fechaAdquisicion, modelo, numAsientos) VALUES ('29278301', '2020-10-12', 'RS 660 2020', 2);

--
-- Data for Name: registroMecanico; Type: TABLE DATA; Schema: public; Owner: -
--
INSERT INTO public.registroMecanico (codRegistro, taller, descripcion, precio, fechaRegistro, matriculaVehiculo) VALUES ('1', 'Talleres Manolo', 'Cambio de aceite', 49.99, '2016-04-11', 'COR12935');
INSERT INTO public.registroMecanico (codRegistro, taller, descripcion, precio, fechaRegistro, matriculaVehiculo) VALUES ('2', 'Talleres Manolo', 'Cambio de frenos', 72.99, '2017-02-12', 'COR12935');
INSERT INTO public.registroMecanico (codRegistro, taller, descripcion, precio, fechaRegistro, matriculaVehiculo) VALUES ('3', 'Talleres Picado', 'Cambio de aceite', 49.99, '2019-01-11', '43439242');

--
-- Data for Name: practica; Type: TABLE DATA; Schema: public; Owner: -
--
INSERT INTO public.practica (codPractica, fechaPractica, precio, tipoPago, nifAlumno, nifProfesor, matriculaVehiculo) VALUES ('1', '2016-02-10', 30.00, 'Metálico', '84214356X', '74924381B', 'COR12935');
INSERT INTO public.practica (codPractica, fechaPractica, precio, tipoPago, nifAlumno, nifProfesor, matriculaVehiculo) VALUES ('2', '2016-02-11', 30.00, 'Metálico', '84214356X', '74924381B', 'COR12935');
INSERT INTO public.practica (codPractica, fechaPractica, precio, tipoPago, nifAlumno, nifProfesor, matriculaVehiculo) VALUES ('3', '2016-02-12', 30.00, 'Metálico', '84214356X', '74924381B', 'COR12935');
INSERT INTO public.practica (codPractica, fechaPractica, precio, tipoPago, nifAlumno, nifProfesor, matriculaVehiculo) VALUES ('4', '2019-01-16', 35.00, 'Tarjeta', '45984511U', '74924381B', '43439242');
INSERT INTO public.practica (codPractica, fechaPractica, precio, tipoPago, nifAlumno, nifProfesor, matriculaVehiculo) VALUES ('5', '2021-03-12', 39.99, 'Metálico', '92342123O', '23342942N', '29278301');

