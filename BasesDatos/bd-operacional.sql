DROP TABLE IF EXISTS public.practica;
DROP TABLE IF EXISTS public.profesor;
DROP TABLE IF EXISTS public.alumno;
DROP TABLE IF EXISTS public.registro_mecanico;
DROP TABLE IF EXISTS public.vehiculo;
DROP TYPE IF EXISTS estado_cdc;

CREATE TYPE estado_cdc AS ENUM (
    'I',
    'U'
);

CREATE TABLE public.profesor (
    nif character varying(9) PRIMARY KEY,
    nombre character varying(25) NOT NULL,
    apellidos character varying(50) NOT NULL,
    telefono numeric(9) NOT NULL,
    direccion character varying(50) NOT NULL,
    salario numeric(5) NOT NULL,
    estado estado_cdc
);


CREATE TABLE public.alumno (
    nif character varying(9) PRIMARY KEY,
    nombre character varying(25) NOT NULL,
    apellidos character varying(50) NOT NULL,
    fecha_nacimiento date NOT NULL,
    direccion character varying(50) NOT NULL,
    email character varying(40) NOT NULL,
    renta numeric(7) NOT NULL,
    estado estado_cdc
);


CREATE TABLE public.practica (
    cod_practica character varying(10) PRIMARY KEY,
    fecha_practica date NOT NULL,
    precio numeric(4, 2) NOT NULL,
    tipo_pago character varying(15) NOT NULL,
    nif_alumno character varying(9) NOT NULL,
    nif_profesor character varying(9) NOT NULL,
    matricula_vehiculo character varying(7) NOT NULL,
    tiempo numeric(3) NOT NULL,
    tipo_permiso character varying(3) NOT NULL
);


CREATE TABLE public.vehiculo (
    matricula character varying(7) PRIMARY KEY,
    fecha_adquisicion date NOT NULL,
    modelo character varying(30) NOT NULL,
    num_asientos numeric(3) NOT NULL
);


CREATE TABLE public.registro_mecanico (
    cod_registro character varying(5) PRIMARY KEY ,
    taller character varying(15) NOT NULL,
    descripcion character varying(30) NOT NULL,
    precio numeric(5, 2) NOT NULL,
    fecha_registro date NOT NULL,
    matricula_vehiculo character varying(7) NOT NULL
);



ALTER TABLE ONLY public.registro_mecanico
    ADD CONSTRAINT vehiculo_registro_mecanico_fk FOREIGN KEY (matricula_vehiculo) REFERENCES public.vehiculo(matricula);

ALTER TABLE ONLY public.practica
    ADD CONSTRAINT practica_alumno_fk FOREIGN KEY (nif_alumno) REFERENCES public.alumno(nif);

ALTER TABLE ONLY public.practica
    ADD CONSTRAINT practica_profesor_fk FOREIGN KEY (nif_profesor) REFERENCES public.profesor(nif);

--
-- INSERT SECTION
--
INSERT INTO public.vehiculo (matricula, fecha_adquisicion, modelo, num_asientos) VALUES ('1343DFF', '2015-02-09', 'Audi Q7', 5);
INSERT INTO public.vehiculo (matricula, fecha_adquisicion, modelo, num_asientos) VALUES ('7654FGS', '2018-06-11', 'Kia Ceed', 5);
INSERT INTO public.vehiculo (matricula, fecha_adquisicion, modelo, num_asientos) VALUES ('2643LPS', '2020-10-12', 'RS 660 2020', 2);
INSERT INTO public.vehiculo (matricula, fecha_adquisicion, modelo, num_asientos) VALUES ('4522DFW', '2017-05-25', 'MAN Serie TGX', 3);

INSERT INTO public.registro_mecanico (cod_registro, taller, descripcion, precio, fecha_registro, matricula_vehiculo) VALUES ('1', 'Talleres Manolo', 'Cambio de aceite', 49.95, '2016-04-11', '1343DFF');
INSERT INTO public.registro_mecanico (cod_registro, taller, descripcion, precio, fecha_registro, matricula_vehiculo) VALUES ('2', 'Talleres Manolo', 'Cambio de frenos', 72.05, '2017-02-12', '1343DFF');
INSERT INTO public.registro_mecanico (cod_registro, taller, descripcion, precio, fecha_registro, matricula_vehiculo) VALUES ('3', 'Talleres Picado', 'Cambio de aceite', 49.50, '2019-01-11', '7654FGS');



