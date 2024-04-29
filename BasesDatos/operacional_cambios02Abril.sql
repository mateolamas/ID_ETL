

-- Añadimos un nuevo profesor
INSERT INTO public.profesor (nif, nombre, apellidos, telefono, direccion, salario, estado) VALUES ('79212312L', 'Manolo', 'Rodriguez', 655312321, 'Rua 3 numero 2 Moana Pontevedra', 1800, 'I');

-- Actualizamos el apellido de un profesor para probar el 'punch through'
UPDATE public.profesor SET apellidos='APELLIDO NUEVO PROFESOR', estado = 'U' WHERE nif='23342942N';





-- Añadimos un nuevo alumno
INSERT INTO public.alumno (nif, nombre, apellidos, fecha_nacimiento, direccion, email, renta, estado) VALUES ('32543432W', 'Manuel', 'Ameal', '2000-01-05', 'Torre de Abaixo numero 2 A Coruna', 'manuel.ameal@correo.com', 30000 , 'I');


-- Actualizamos la direccion de un alumno para probar el 'punch through'
UPDATE public.alumno SET apellidos='APELLIDO NUEVO ALUMNO', estado = 'U' WHERE nif='84214356X';

-- Actualizamos la renta de un alumno para probar la actualizacion tipo 'insert'
UPDATE public.alumno SET renta=40000, estado = 'U' WHERE nif='92342123O';

-- Actualizamos direccion de un alumno (no influye en nada porque la direccion no se sube al datamart)
UPDATE public.alumno SET direccion='DIRECCION NUEVO ALUMNO', estado = 'U' WHERE nif='45984511U';

-- Actualizamos el nombre ('punch through') y actualizamos tambien la renta('insert')
-- de un mismo alumno a la vez
UPDATE public.alumno SET nombre='NOMBRE NUEVO ALUMNO', estado = 'U' WHERE nif='45984511U';
UPDATE public.alumno SET renta=30000, estado = 'U' WHERE nif='45984511U';



-- Añadimos las practicas del dia 2024-04-01
INSERT INTO public.practica (cod_practica, fecha_practica, precio, tipo_pago, nif_alumno, nif_profesor, matricula_vehiculo, tiempo, tipo_permiso) VALUES ('5', '2024-04-02', 80.45, 'Tarjeta', '32543432W', '23342942N', '4522DFW', 60, 'C');
INSERT INTO public.practica (cod_practica, fecha_practica, precio, tipo_pago, nif_alumno, nif_profesor, matricula_vehiculo, tiempo, tipo_permiso) VALUES ('6', '2024-04-02', 40.95, 'Metalico', '84214356X', '74924381B', '4522DFW', 450, 'B');
INSERT INTO public.practica (cod_practica, fecha_practica, precio, tipo_pago, nif_alumno, nif_profesor, matricula_vehiculo, tiempo, tipo_permiso) VALUES ('7', '2024-04-02', 90.95, 'Tarjeta', '92342123O', '23342942N', '4522DFW', 90, 'A1');
