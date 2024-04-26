DROP TABLE IF EXISTS public.fact_practicas;
DROP TABLE IF EXISTS public.dim_alumnos;
DROP TABLE IF EXISTS public.dim_profesores;
DROP TABLE IF EXISTS public.dim_dia;

CREATE TABLE public.dim_alumnos (
    id_alumno numeric(6) PRIMARY KEY,
    dni character varying(9) NOT NULL,
    nombre character varying(25),
    apellidos character varying(50),
    fecha_nacimiento date
);  

CREATE TABLE public.dim_profesores (
    id_profesor numeric(6) PRIMARY KEY,
    dni character varying(9) NOT NULL,
    nombre character varying(25),
    apellidos character varying(50),
    fecha_contratacion date
);

CREATE TABLE public.dim_dia (
    id_dia numeric(8) PRIMARY KEY,
    num_dia numeric(2) NOT NULL,
    nombre_dia character varying(9) NOT NULL,
    mes character varying(9) NOT NULL,
    num_mes numeric(2) NOT NULL,
    ano numeric(4) NOT NULL
);

CREATE TABLE public.fact_practicas (
    id_dia numeric(8) NOT NULL,
    id_alumno numeric(6) NOT NULL,
    id_profesor numeric(6) NOT NULL,
    tiempo_minutos numeric(3) NOT NULL,
    tipo_permiso character varying(3) NOT NULL
);

ALTER TABLE ONLY public.fact_practicas
    ADD CONSTRAINT practicas_pk  PRIMARY KEY(id_dia, id_alumno, id_profesor);

ALTER TABLE ONLY public.fact_practicas
    ADD CONSTRAINT practicas_alumnos_fk FOREIGN KEY (id_alumno) REFERENCES public.dim_alumnos(id_alumno);

ALTER TABLE ONLY public.fact_practicas
    ADD CONSTRAINT practicas_profesores_fk FOREIGN KEY (id_profesor) REFERENCES public.dim_profesores(id_profesor);

ALTER TABLE ONLY public.fact_practicas
    ADD CONSTRAINT practicas_dia_fk FOREIGN KEY (id_dia) REFERENCES public.dim_dia(id_dia);


INSERT INTO public.dim_dia (id_dia, num_dia, nombre_dia, mes, num_mes, ano) VALUES (10022016, 10, 'miercoles', 'febrero', 2, 2016);
INSERT INTO public.dim_dia (id_dia, num_dia, nombre_dia, mes, num_mes, ano) VALUES (11022016, 11, 'jueves', 'febrero', 2, 2016);
INSERT INTO public.dim_dia (id_dia, num_dia, nombre_dia, mes, num_mes, ano) VALUES (12022016, 12, 'viernes', 'febrero', 2, 2016);
INSERT INTO public.dim_dia (id_dia, num_dia, nombre_dia, mes, num_mes, ano) VALUES (16012019, 16, 'miercoles', 'enero', 1, 2019);
INSERT INTO public.dim_dia (id_dia, num_dia, nombre_dia, mes, num_mes, ano) VALUES (12032021, 12, 'viernes', 'marzo', 3, 2021);


