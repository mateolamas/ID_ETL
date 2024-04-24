DROP TABLE IF EXISTS public.practica;
DROP TABLE IF EXISTS public.profesor;
DROP TABLE IF EXISTS public.alumno;
DROP TABLE IF EXISTS public."registroMecanico";
DROP TABLE IF EXISTS public.vehiculo;


CREATE TABLE public.profesor (
    nif character varying(9) PRIMARY KEY,
    nombre character varying(25) NOT NULL,
    apellidos character varying(50) NOT NULL,
    telefono numeric(9) NOT NULL,
    direccion character varying(50) NOT NULL,
    salario numeric(5) NOT NULL
);



CREATE TABLE public.alumno (
    nif character varying(9) PRIMARY KEY,
    nombre character varying(25) NOT NULL,
    apellidos character varying(50) NOT NULL,
    "fechaNacimiento" date NOT NULL,
    direccion character varying(50) NOT NULL,
    email character varying(40) NOT NULL
);


CREATE TABLE public.practica (
    "codPractica" character varying(10) PRIMARY KEY,
    "fechaPractica" date NOT NULL,
    precio numeric(4, 2) NOT NULL,
    "tipoPago" character varying(15) NOT NULL,
    "nifAlumno" character varying(9) NOT NULL,
    "nifProfesor" character varying(9) NOT NULL,
    "matriculaVehiculo" character varying(7) NOT NULL,
    tiempo numeric(3) NOT NULL
);


CREATE TABLE public.vehiculo (
    matricula character varying(7) PRIMARY KEY,
    "fechaAdquisicion" date NOT NULL,
    modelo character varying(30) NOT NULL,
    "numAsientos" numeric(3) NOT NULL
);


CREATE TABLE public."registroMecanico" (
    "codRegistro" character varying(5) PRIMARY KEY ,
    taller character varying(15) NOT NULL,
    descripcion character varying(30) NOT NULL,
    precio numeric(5, 2) NOT NULL,
    "fechaRegistro" date NOT NULL,
    "matriculaVehiculo" character varying(7) NOT NULL
);



ALTER TABLE ONLY public."registroMecanico"
    ADD CONSTRAINT "vehiculo_registroMecanico_fk" FOREIGN KEY ("matriculaVehiculo") REFERENCES public.vehiculo(matricula);

ALTER TABLE ONLY public.practica
    ADD CONSTRAINT practica_alumno_fk FOREIGN KEY ("nifAlumno") REFERENCES public.alumno(nif);

ALTER TABLE ONLY public.practica
    ADD CONSTRAINT practica_profesor_fk FOREIGN KEY ("nifProfesor") REFERENCES public.profesor(nif);

--
-- INSERT SECTION
--

INSERT INTO public.profesor (nif, nombre, apellidos, telefono, direccion, salario) VALUES ('74924381B', 'Francisco', 'Corico', 975234187, 'Avenida 3 numero 4 A Coruna', 1500);
INSERT INTO public.profesor (nif, nombre, apellidos, telefono, direccion, salario) VALUES ('23342942N', 'Rosana', 'Tural', 911827644, 'Avenida 1 numero 16 Pontevedra', 1600);
INSERT INTO public.profesor (nif, nombre, apellidos, telefono, direccion, salario) VALUES ('79212312L', 'Manolo', 'Rodriguez', 655312321, 'Rua 3 numero 2 Moana Pontevedra', 1800);

INSERT INTO public.alumno (nif, nombre, apellidos, "fechaNacimiento", direccion, email) VALUES ('74924381B', 'Manuel', 'Ameal', '2000-01-05', 'Torre de Abaixo numero 2 A Coruna', 'manuel.ameal@correo.com');
INSERT INTO public.alumno (nif, nombre, apellidos, "fechaNacimiento", direccion, email) VALUES ('45984511U', 'Ursula', 'Ozores', '1996-05-07', 'Rua 8 numero 6 A Coruna', 'ursula.ozores@correo.com');
INSERT INTO public.alumno (nif, nombre, apellidos, "fechaNacimiento", direccion, email) VALUES ('84214356X', 'Tania', 'Diz', '2002-09-03', 'Torre de Arriba numero 2 Pontevedra', 'tania.diz@correo.com');
INSERT INTO public.alumno (nif, nombre, apellidos, "fechaNacimiento", direccion, email) VALUES ('92342123O', 'Mateo', 'Johnson', '1999-09-03', 'Torre de Abaixo numero 2 Lugo', 'mateo.johnson@correo.com');

INSERT INTO public.vehiculo (matricula, "fechaAdquisicion", modelo, "numAsientos") VALUES ('1343DFF', '2015-02-09', 'Audi Q7', 5);
INSERT INTO public.vehiculo (matricula, "fechaAdquisicion", modelo, "numAsientos") VALUES ('7654FGS', '2018-06-11', 'Kia Ceed', 5);
INSERT INTO public.vehiculo (matricula, "fechaAdquisicion", modelo, "numAsientos") VALUES ('2643LPS', '2020-10-12', 'RS 660 2020', 2);

INSERT INTO public."registroMecanico" ("codRegistro", taller, descripcion, precio, "fechaRegistro", "matriculaVehiculo") VALUES ('1', 'Talleres Manolo', 'Cambio de aceite', 49.95, '2016-04-11', '1343DFF');
INSERT INTO public."registroMecanico" ("codRegistro", taller, descripcion, precio, "fechaRegistro", "matriculaVehiculo") VALUES ('2', 'Talleres Manolo', 'Cambio de frenos', 72.05, '2017-02-12', '1343DFF');
INSERT INTO public."registroMecanico" ("codRegistro", taller, descripcion, precio, "fechaRegistro", "matriculaVehiculo") VALUES ('3', 'Talleres Picado', 'Cambio de aceite', 49.50, '2019-01-11', '7654FGS');

INSERT INTO public.practica ("codPractica", "fechaPractica", precio, "tipoPago", "nifAlumno", "nifProfesor", "matriculaVehiculo", tiempo) VALUES ('1', '2016-02-10', 21.50, 'Metalico', '84214356X', '74924381B', '1343DFF', 45);
INSERT INTO public.practica ("codPractica", "fechaPractica", precio, "tipoPago", "nifAlumno", "nifProfesor", "matriculaVehiculo", tiempo) VALUES ('2', '2016-02-11', 48.00, 'Metalico', '84214356X', '74924381B', '1343DFF', 90);
INSERT INTO public.practica ("codPractica", "fechaPractica", precio, "tipoPago", "nifAlumno", "nifProfesor", "matriculaVehiculo", tiempo) VALUES ('3', '2016-02-12', 30.00, 'Metalico', '84214356X', '74924381B', '1343DFF', 60);
INSERT INTO public.practica ("codPractica", "fechaPractica", precio, "tipoPago", "nifAlumno", "nifProfesor", "matriculaVehiculo", tiempo) VALUES ('4', '2019-01-16', 50.00, 'Tarjeta', '45984511U', '74924381B', '7654FGS', 95);
INSERT INTO public.practica ("codPractica", "fechaPractica", precio, "tipoPago", "nifAlumno", "nifProfesor", "matriculaVehiculo", tiempo) VALUES ('5', '2021-03-12', 66.95, 'Metalico', '92342123O', '23342942N', '2643LPS', 120);

