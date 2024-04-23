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