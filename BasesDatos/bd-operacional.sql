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

INSERT INTO public.profesor (nif, nombre, apellidos, telefono, direccion, salario, estado) VALUES ('74924381B', 'Francisco', 'Corico', 975234187, 'Avenida 3 numero 4 A Coruna', 1500, 'I');
INSERT INTO public.profesor (nif, nombre, apellidos, telefono, direccion, salario, estado) VALUES ('23342942N', 'Rosana', 'Tural', 911827644, 'Avenida 1 numero 16 Pontevedra', 1600, 'I');
INSERT INTO public.profesor (nif, nombre, apellidos, telefono, direccion, salario, estado) VALUES ('79212312L', 'Manolo', 'Rodriguez', 655312321, 'Rua 3 numero 2 Moana Pontevedra', 1800, 'I');

INSERT INTO public.alumno (nif, nombre, apellidos, fecha_nacimiento, direccion, email, renta, estado) VALUES ('32543432W', 'Manuel', 'Ameal', '2000-01-05', 'Torre de Abaixo numero 2 A Coruna', 'manuel.ameal@correo.com', 30000 , 'I');
INSERT INTO public.alumno (nif, nombre, apellidos, fecha_nacimiento, direccion, email, renta, estado) VALUES ('45984511U', 'Ursula', 'Ozores', '1996-05-07', 'Rua 8 numero 6 A Coruna', 'ursula.ozores@correo.com', 22000, 'I');
INSERT INTO public.alumno (nif, nombre, apellidos, fecha_nacimiento, direccion, email, renta, estado) VALUES ('84214356X', 'Tania', 'Diz', '2002-09-03', 'Torre de Arriba numero 2 Pontevedra', 'tania.diz@correo.com', 12000,'I');
INSERT INTO public.alumno (nif, nombre, apellidos, fecha_nacimiento, direccion, email, renta, estado) VALUES ('92342123O', 'Mateo', 'Johnson', '1999-09-03', 'Torre de Abaixo numero 2 Lugo', 'mateo.johnson@correo.com', 100000, 'I');

INSERT INTO public.vehiculo (matricula, fecha_adquisicion, modelo, num_asientos) VALUES ('1343DFF', '2015-02-09', 'Audi Q7', 5);
INSERT INTO public.vehiculo (matricula, fecha_adquisicion, modelo, num_asientos) VALUES ('7654FGS', '2018-06-11', 'Kia Ceed', 5);
INSERT INTO public.vehiculo (matricula, fecha_adquisicion, modelo, num_asientos) VALUES ('2643LPS', '2020-10-12', 'RS 660 2020', 2);
INSERT INTO public.vehiculo (matricula, fecha_adquisicion, modelo, num_asientos) VALUES ('4522DFW', '2017-05-25', 'MAN Serie TGX', 3);

INSERT INTO public.registro_mecanico (cod_registro, taller, descripcion, precio, fecha_registro, matricula_vehiculo) VALUES ('1', 'Talleres Manolo', 'Cambio de aceite', 49.95, '2016-04-11', '1343DFF');
INSERT INTO public.registro_mecanico (cod_registro, taller, descripcion, precio, fecha_registro, matricula_vehiculo) VALUES ('2', 'Talleres Manolo', 'Cambio de frenos', 72.05, '2017-02-12', '1343DFF');
INSERT INTO public.registro_mecanico (cod_registro, taller, descripcion, precio, fecha_registro, matricula_vehiculo) VALUES ('3', 'Talleres Picado', 'Cambio de aceite', 49.50, '2019-01-11', '7654FGS');

INSERT INTO public.practica (cod_practica, fecha_practica, precio, tipo_pago, nif_alumno, nif_profesor, matricula_vehiculo, tiempo, tipo_permiso) VALUES ('1', '2016-02-10', 21.50, 'Metalico', '84214356X', '74924381B', '1343DFF', 45, 'B');
INSERT INTO public.practica (cod_practica, fecha_practica, precio, tipo_pago, nif_alumno, nif_profesor, matricula_vehiculo, tiempo, tipo_permiso) VALUES ('2', '2016-02-11', 48.00, 'Metalico', '84214356X', '74924381B', '1343DFF', 90, 'B');
INSERT INTO public.practica (cod_practica, fecha_practica, precio, tipo_pago, nif_alumno, nif_profesor, matricula_vehiculo, tiempo, tipo_permiso) VALUES ('3', '2016-02-12', 30.00, 'Metalico', '84214356X', '74924381B', '1343DFF', 60, 'B');
INSERT INTO public.practica (cod_practica, fecha_practica, precio, tipo_pago, nif_alumno, nif_profesor, matricula_vehiculo, tiempo, tipo_permiso) VALUES ('4', '2019-01-16', 50.00, 'Tarjeta', '45984511U', '74924381B', '7654FGS', 95, 'B');
INSERT INTO public.practica (cod_practica, fecha_practica, precio, tipo_pago, nif_alumno, nif_profesor, matricula_vehiculo, tiempo, tipo_permiso) VALUES ('5', '2021-03-12', 66.95, 'Metalico', '92342123O', '23342942N', '2643LPS', 120, 'A1');
INSERT INTO public.practica (cod_practica, fecha_practica, precio, tipo_pago, nif_alumno, nif_profesor, matricula_vehiculo, tiempo, tipo_permiso) VALUES ('6', '2021-01-28', 90.95, 'Tarjeta', '45984511U', '23342942N', '4522DFW', 90, 'C');


