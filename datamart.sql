DROP TABLE IF EXISTS public.dim_alumnos;
DROP TABLE IF EXISTS public.dim_profesores;
DROP TABLE IF EXISTS public.dim_dia;
DROP TABLE IF EXISTS public.fact_practicas;


CREATE TABLE public.dim_alumnos (
    "idAlumno" numeric(6) PRIMARY KEY,
    dni character varying(9) NOT NULL,
    nombre character varying(25) NOT NULL,
    apellidos character varying(50) NOT NULL,
    "fechaNacimiento" date  NOT NULL
);  

CREATE TABLE public.dim_profesores (
    "idProfesor" numeric(6) PRIMARY KEY,
    dni character varying(9) NOT NULL,
    nombre character varying(25) NOT NULL,
    apellidos character varying(50) NOT NULL,
    "fechaContratacion" date NOT NULL
);

CREATE TABLE public.dim_dia (
    "idDia" numeric(6) PRIMARY KEY,
    "numDia" numeric(1) NOT NULL,
    "nombreDia" character varying(8) NOT NULL,
    mes character varying(9) NOT NULL,
    "numMes" numeric(2) NOT NULL,
    ano numeric(4) NOT NULL
);

CREATE TABLE public.fact_practicas (
    "idDia" numeric(6) NOT NULL,
    "idAlumno" numeric(6) NOT NULL,
    "idProfesor" numeric(6) NOT NULL,
    "tiempoMinutos" numeric(3) NOT NULL,
    "tipoPermiso" character varying(3) NOT NULL
);

ALTER TABLE ONLY public.fact_practicas
    ADD CONSTRAINT practicas_pk  PRIMARY KEY("idDia", "idAlumno", "idProfesor");

ALTER TABLE ONLY public.fact_practicas
    ADD CONSTRAINT practicas_alumnos_fk FOREIGN KEY ("idAlumno") REFERENCES public.dim_alumnos("idAlumno");

ALTER TABLE ONLY public.fact_practicas
    ADD CONSTRAINT practicas_profesores_fk FOREIGN KEY ("idProfesor") REFERENCES public.dim_profesores("idProfesor");

ALTER TABLE ONLY public.fact_practicas
    ADD CONSTRAINT practicas_dia_fk FOREIGN KEY ("idDia") REFERENCES public.dim_dia("idDia");


