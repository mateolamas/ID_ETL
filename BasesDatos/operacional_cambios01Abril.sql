


INSERT INTO public.profesor (nif, nombre, apellidos, telefono, direccion, salario, estado) VALUES ('74924381B', 'Francisco', 'Corico', 975234187, 'Avenida 3 numero 4 A Coruna', 1500, 'I');
INSERT INTO public.profesor (nif, nombre, apellidos, telefono, direccion, salario, estado) VALUES ('23342942N', 'Rosana', 'Tural', 911827644, 'Avenida 1 numero 16 Pontevedra', 1600, 'I');


INSERT INTO public.alumno (nif, nombre, apellidos, fecha_nacimiento, direccion, email, renta, estado) VALUES ('45984511U', 'Ursula', 'Ozores', '1996-05-07', 'Rua 8 numero 6 A Coruna', 'ursula.ozores@correo.com', 22000, 'I');
INSERT INTO public.alumno (nif, nombre, apellidos, fecha_nacimiento, direccion, email, renta, estado) VALUES ('84214356X', 'Tania', 'Diz', '2002-09-03', 'Torre de Arriba numero 2 Pontevedra', 'tania.diz@correo.com', 12000,'I');
INSERT INTO public.alumno (nif, nombre, apellidos, fecha_nacimiento, direccion, email, renta, estado) VALUES ('92342123O', 'Mateo', 'Johnson', '1999-09-03', 'Torre de Abaixo numero 2 Lugo', 'mateo.johnson@correo.com', 100000, 'I');



-- Añadimos las practicas del dia 2024-04-01
INSERT INTO public.practica (cod_practica, fecha_practica, precio, tipo_pago, nif_alumno, nif_profesor, matricula_vehiculo, tiempo, tipo_permiso) VALUES ('1', '2024-04-01', 21.50, 'Metalico', '84214356X', '74924381B', '1343DFF', 45, 'B');
INSERT INTO public.practica (cod_practica, fecha_practica, precio, tipo_pago, nif_alumno, nif_profesor, matricula_vehiculo, tiempo, tipo_permiso) VALUES ('2', '2024-04-01', 50.00, 'Tarjeta', '45984511U', '74924381B', '7654FGS', 95, 'B');
INSERT INTO public.practica (cod_practica, fecha_practica, precio, tipo_pago, nif_alumno, nif_profesor, matricula_vehiculo, tiempo, tipo_permiso) VALUES ('3', '2024-04-01', 66.95, 'Metalico', '92342123O', '23342942N', '2643LPS', 120, 'A1');
INSERT INTO public.practica (cod_practica, fecha_practica, precio, tipo_pago, nif_alumno, nif_profesor, matricula_vehiculo, tiempo, tipo_permiso) VALUES ('4', '2024-04-01', 90.95, 'Tarjeta', '45984511U', '23342942N', '4522DFW', 90, 'C');
