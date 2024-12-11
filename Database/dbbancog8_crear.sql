drop database if exists SistemaBancario;
create database SistemaBancario;

use SistemaBancario;

drop table if exists provincia;
create table provincia (
	id_provincia int auto_increment,
	nombre varchar(50) not null,
	primary key (id_provincia),
	unique key (nombre)
);

drop table if exists usuario;
create table usuario (
  nombre_usuario varchar(30) not null,
  pass varchar(35) not null,
  tipo int not null,				-- 1: Administrador; 2: Cliente
  activo bit default 1,
  primary key (nombre_usuario)
);

drop table if exists cliente;
create table cliente (
  id_cliente int auto_increment,
  nombre_usuario varchar(20) not null,
  dni int not null,
  cuil varchar (20) not null,
  nombre varchar(60) not null,
  apellido varchar(60) not null,
  sexo int not null,				-- 1: masculino; 2: femenino; 3: otro
  nacionalidad varchar(60) not null,
  nacimiento date not null,
  domicilio varchar(60) not null,
  localidad varchar(60) not null,
  id_provincia int not null,
  email varchar(100) not null,
  telefono varchar(40) not null,
  activo bit not null default 1,
  primary key (id_cliente),
  unique key (nombre_usuario),
  unique key (dni),
  unique key (cuil),
  foreign key (id_provincia) references provincia (id_provincia),
  foreign key (nombre_usuario) references usuario (nombre_usuario)
);

drop table if exists cuenta;
create table cuenta (
  id_cuenta int auto_increment,
  id_cliente int not null,
  tipo int not null,
  creacion date not null,
  cbu varchar(100) not null unique,
  saldo float default 0,
  activa bit default 1,
  primary key (id_cuenta),
  unique key (cbu),
  foreign key (id_cliente) references cliente (id_cliente)
);

drop table if exists movimiento;
create table movimiento (
  id_movimiento int not null auto_increment,
  id_cuenta int not null,
  id_tipo_movimiento int not null,
  fecha date not null,
  detalle varchar(200) not null,
  importe float not null,
  id_destino int not null,
  primary key (id_movimiento),
  foreign key (id_cuenta) references cuenta (id_cuenta)
);

drop table if exists prestamo_solicitado;
create table prestamo_solicitado (
  id_prestamo_solicitado int not null auto_increment,
  id_cuenta int not null,
  monto_cuota float,
  interes float NOT NULL,
  importe_solicitado float not null,
  fecha date not null,
  importe_pagar float not null,
  plazo_cuotas int not null,
  estado int DEFAULT 3,		-- 1. Autorizado, 2. Denegado, 3. Pendiente
  primary key (id_prestamo_solicitado),
  foreign key (id_cuenta) references cuenta (id_cuenta)
);

drop table if exists prestamo;
create table prestamo (
  id_prestamo int not null auto_increment,
  id_prestamo_solicitado int not null,
  id_movimiento int null,
  monto_cuota float ,
  interes float NOT NULL,
  importe_solicitado float not null,
  fecha date not null,
  importe_pagar float not null,
  plazo_cuotas int not null,
  estado int DEFAULT 1,		-- 1. Pendiente de Pago , 2. Finalizado
  primary key (id_prestamo),
  foreign key (id_movimiento) references movimiento (id_movimiento),
  foreign key (id_prestamo_solicitado) references prestamo_solicitado (id_prestamo_solicitado)
);

drop table if exists cuota;
create table cuota (
  id_cuota int auto_increment,
  id_prestamo int not null,
  numero_cuota int not null,
  importe float not null,
  vencimiento date not null,
  estado int not null,
  primary key (id_cuota),
  unique (id_prestamo, id_cuota),
  foreign key (id_prestamo) references prestamo (id_prestamo)
);

drop table if exists pago;
create table pago (
  id_pago int not null auto_increment,
  id_prestamo int not null,
  id_cuota int not null,
  id_movimiento int not null,
  fecha date not null,
  primary key (id_pago),
  foreign key (id_prestamo, id_cuota) references cuota (id_prestamo, id_cuota),
  foreign key (id_movimiento) references movimiento (id_movimiento)
);

INSERT INTO provincia (nombre) VALUES 
('Buenos Aires'), 
('Córdoba'), 
('Santa Fe'), 
('Mendoza'), 
('Tucumán'),
('Salta'), 
('Chaco'), 
('Misiones'), 
('Corrientes'), 
('Entre Ríos'),
('San Juan'), 
('San Luis'), 
('Jujuy'), 
('Catamarca'), 
('La Rioja'),
('Santiago del Estero'),
('Río Negro'),
('Chubut'),
('Formosa'),
('Neuquén'),
('La Pampa'),
('Santa Cruz'),
('Tierra del Fuego'),
('Ciudad Autónoma de Buenos Aires');

INSERT INTO usuario (nombre_usuario, pass, tipo, activo) VALUES
('admin1', '123', 1, 1),
('admin2', '123', 1, 1),
('cliente1', 'pass123', 2, 1),
('cliente2', 'pass456', 2, 1),
('cliente3', 'pass789', 2, 1),
('cliente4', 'pass012', 2, 1),
('cliente5', 'pass345', 2, 1),
('cliente6', 'pass678', 2, 1),
('cliente7', 'pass890', 2, 1),
('cliente8', 'pass901', 2, 1),
('cliente9', 'pass234', 2, 1),
('cliente10', 'pass567', 2, 1),
('cliente11', 'pass891', 2, 1),
('cliente12', 'pass014', 2, 1),
('cliente13', 'pass234', 2, 1);

-- Clientes
INSERT INTO cliente (nombre_usuario, dni, cuil, nombre, apellido, sexo, nacionalidad, nacimiento, domicilio, localidad, id_provincia, email, telefono, activo) VALUES
('cliente1', 30123456, '20-30123456-7', 'Juan', 'Pérez', 1, 'Argentina', '1985-06-15', 'Av. Siempre Viva 123', 'La Plata', 1, 'juan.perez@gmail.com', '2211234567', 1),
('cliente2', 32234567, '20-32234567-8', 'María', 'Gómez', 2, 'Argentina', '1990-03-20', 'Calle Falsa 456', 'Córdoba', 2, 'maria.gomez@gmail.com', '3512345678', 1),
('cliente3', 29123456, '20-29123456-5', 'Carlos', 'Fernández', 1, 'Argentina', '1987-08-12', 'San Martín 789', 'Rosario', 3, 'carlos.fernandez@gmail.com', '3415678901', 1),
('cliente4', 33123456, '20-33123456-9', 'Ana', 'Martínez', 2, 'Argentina', '1995-11-10', 'Independencia 321', 'Mendoza', 4, 'ana.martinez@gmail.com', '2613456789', 1),
('cliente5', 34123456, '20-34123456-0', 'Laura', 'López', 2, 'Argentina', '2000-01-25', 'Belgrano 654', 'San Miguel', 5, 'laura.lopez@gmail.com', '3814567890', 1),
('cliente6', 35123456, '20-35123456-1', 'Pedro', 'Alvarez', 1, 'Argentina', '1992-07-14', 'Rivadavia 876', 'Salta', 6, 'pedro.alvarez@gmail.com', '3876543210', 1),
('cliente7', 36123456, '20-36123456-2', 'Sofía', 'Ramos', 2, 'Argentina', '1998-05-08', 'Italia 543', 'Corrientes', 9, 'sofia.ramos@gmail.com', '3794567890', 1),
('cliente8', 37123456, '20-37123456-3', 'Ignacio', 'Ortiz', 1, 'Argentina', '1993-02-19', 'España 321', 'San Juan', 10, 'ignacio.ortiz@gmail.com', '2643456789', 1),
('cliente9', 38123456, '20-38123456-4', 'Camila', 'Morales', 2, 'Argentina', '2001-09-11', 'Belgrano 789', 'Jujuy', 13, 'camila.morales@gmail.com', '3883456789', 1),
('cliente10', 39123456, '20-39123456-5', 'Guillermo', 'Torres', 1, 'Argentina', '1994-12-25', 'Mitre 432', 'San Luis', 12, 'guillermo.torres@gmail.com', '2663456789', 1),
('cliente11', 40123456, '20-40123456-6', 'Lucía', 'Vega', 2, 'Argentina', '1988-04-03', 'Av. Perón 987', 'Misiones', 8, 'lucia.vega@gmail.com', '3763456789', 1),
('cliente12', 41123456, '20-41123456-7', 'Jorge', 'Castro', 1, 'Argentina', '1999-03-18', 'Catamarca 111', 'La Rioja', 14, 'jorge.castro@gmail.com', '3803456789', 1),
('cliente13', 42123456, '20-42123456-8', 'Valentina', 'Luna', 2, 'Argentina', '1997-10-06', 'Belgrano 123', 'Catamarca', 14, 'valentina.luna@gmail.com', '3833456789', 1);

-- Cuentas
INSERT INTO cuenta (id_cliente, tipo, creacion, cbu, saldo, activa) VALUES 
(1, 1, '2022-01-15', '1234567890123456789012', 5015000, 1),
(2, 2, '2021-06-20', '2345678901234567890123', 30000, 1),
(3, 1, '2023-02-10', '3456789012345678901234', 5000, 1),
(4, 2, '2020-10-05', '4567890123456789012345', 30000, 1),
(5, 1, '2023-05-25', '5678901234567890123456', 10000, 1),
(6, 1, '2021-09-17', '6789012345678901234567', 23000, 1),
(7, 2, '2022-11-30', '7890123456789012345678', 11500, 1),
(8, 1, '2023-04-01', '8901234567890123456789', 2000, 1),
(9, 2, '2020-12-21', '9012345678901234567890', 18000, 1),
(10, 1, '2022-07-22', '0123456789012345678901', 9500, 1),
(11, 2, '2023-06-10', '1123456789012345678902', 15011000, 1),
(12, 1, '2021-03-15', '1223456789012345678903', 30000, 1),
(13, 2, '2023-01-30', '1323456789012345678904', 15000, 1),
(5, 1, '2020-01-22', '1423456789012345678905', 8000, 1),
(1,	1, '2024-12-09', '6179001701039202675035', 10000, 1),
(3,	2, '2024-12-09', '8316047970121703739079', 10000, 1),
(5, 1, '2024-06-01', '5642384690004526388497', 10000, 1);

INSERT INTO prestamo_solicitado (id_cuenta, monto_cuota, interes, importe_solicitado, fecha, importe_pagar, plazo_cuotas, estado) VALUES
(2,  1000, 5, 10000, '2023-01-10', 10500, 10, 2),
(2, 800, 4, 8000, '2023-02-15', 8320, 10, 3),
(3,  1200, 6, 12000, '2023-03-12', 12720, 10, 2),
(4, 500, 3, 5000, '2023-04-18', 5150, 10, 1),
(5,  900, 4.5, 9000, '2023-05-23', 9360, 10, 1),
(5,  1100, 4.2, 11000, '2024-01-01', 11462, 10, 3),
(14,  900, 4.5, 9000, '2023-05-05', 9360, 10, 3),
(17,  1500, 5, 15000, '2023-10-01', 15750, 10, 1),
(6,  1500, 5, 15000, '2023-06-21', 15750, 10, 1),
(7,  700, 3.5, 7000, '2023-07-01', 7245, 10, 1),
(8,  2000, 6, 20000, '2023-08-10', 21200, 10, 1),
(9, 1100, 4.2, 11000, '2023-09-14', 11462, 10, 1),
(10,  950, 3.8, 9500, '2023-10-25', 9861, 10, 1),
(11,  3000, 7, 30000, '2023-11-30', 32100, 10, 1),
(10,  750, 3.6, 7500, '2023-12-11', 7770, 10, 3),
(4, 500, 3, 5000, '2024-01-20', 5150, 10, 3),
(2,  1000, 5, 10000, '2024-02-15', 10500, 10, 3),
(3, 1800, 6.2, 18000, '2024-03-12', 19116, 10, 3),
(5,	346800,	2,	1000000, '2024-12-09',	1020000,	3,	3),
(1,	1734000, 2,	5000000, '2024-12-09',	5100000	,3,	1),
(11, 5100000, 2, 15000000,	'2024-12-09', 15300000,	3,	1);


INSERT INTO movimiento (id_cuenta, id_tipo_movimiento, fecha, detalle, importe, id_destino) VALUES
(15, 1, '2024-12-09', 'Alta cuenta', 10000, 15),
(16, 1, '2024-12-09', 'Alta cuenta', 10000, 16),
(14, 1, '2022-01-22', 'Alta cuenta', 10000, 14),
(5,  1, '2023-05-25', 'Alta cuenta', 10000, 5),
(17,  1, '2024-06-01', 'Alta cuenta', 10000, 17),
(14, 4, '2024-12-09', 'Transferencia familiar', -500, 5),
(5,  4, '2024-12-09', 'Transferencia familiar', 500, 14),
(5,  4, '2024-12-09', 'Otro', -9000, 14),
(14, 4, '2024-12-09', 'Otro', 9000, 5),
(4, 2, '2024-12-09', 'Prestamo Aceptado', 5150, 0),
(5,  2, '2023-05-23', 'Prestamo Aceptado', 9360, 0),
(17,  2, '2023-06-01', 'Prestamo Aceptado', 15750, 0),
(6,  2, '2024-12-09', 'Prestamo Aceptado', 15750, 0),
(7,  2, '2024-12-09', 'Prestamo Aceptado', 7245, 0),
(1,  2, '2023-05-23', 'Prestamo Aceptado', 5100000, 0),
(11,  2, '2023-05-23', 'Prestamo Aceptado', 15300000, 0),
(8,  2, '2023-05-23', 'Prestamo Aceptado', 21200, 0),
(9,  2, '2023-05-23', 'Prestamo Aceptado', 11462, 0),
(10,  2, '2023-05-23', 'Prestamo Aceptado', 9861, 0),
(11,  2, '2023-05-23', 'Prestamo Aceptado', 32100, 0),
(1,  1, '2024-12-09', 'Alta cuenta', 10000, 1),
(3,  1, '2024-12-09', 'Alta cuenta', 10000, 3),
(5,  3, '2023-06-23', 'Pago préstamo', 936, 5),
(5,  3, '2023-07-23', 'Pago préstamo', 936, 5),
(5,  3, '2023-08-23', 'Pago préstamo', 936, 5),
(17,  3, '2023-11-01', 'Pago préstamo', 1575, 17),
(17,  3, '2023-12-01', 'Pago préstamo', 1575, 17),
(17,  3, '2024-01-01', 'Pago préstamo', 1575, 17),
(17,  3, '2024-02-01', 'Pago préstamo', 1575, 17),
(17,  3, '2024-03-01', 'Pago préstamo', 1575, 17),
(17,  3, '2024-04-01', 'Pago préstamo', 1575, 17),
(17,  3, '2024-05-01', 'Pago préstamo', 1575, 17),
(17,  3, '2024-06-01', 'Pago préstamo', 1575, 17),
(17,  3, '2024-07-01', 'Pago préstamo', 1575, 17),
(17,  3, '2024-08-01', 'Pago préstamo', 1575, 17);



INSERT INTO prestamo (id_prestamo_solicitado, id_movimiento, monto_cuota, interes, importe_solicitado, fecha, importe_pagar, plazo_cuotas, estado) VALUES
(4, 10, 500, 3, 5000, '2023-04-18', 5150, 10, 1),
(5, 11,  900, 4.5, 9000, '2023-05-23', 9360, 10, 1),
(8, 12,  1500, 5, 15000, '2023-10-01', 15750, 10, 2),
(9, 13,  1500, 5, 15000, '2023-06-21', 15750, 10, 1),
(10, 14,  700, 3.5, 7000, '2023-07-01', 7245, 10, 1),
(20, 15,	1734000, 2,	5000000, '2024-12-09',	5100000	,3,	1),
(21, 16, 5100000, 2, 15000000,	'2024-12-09', 15300000,	3,	1),
(11, 17,  2000, 6, 20000, '2023-08-10', 21200, 10, 1),
(12, 18, 1100, 4.2, 11000, '2023-09-14', 11462, 10, 1),
(13, 19,  950, 3.8, 9500, '2023-10-25', 9861, 10, 1),
(14, 20,  3000, 7, 30000, '2023-11-30', 32100, 10, 1);

INSERT INTO cuota (id_prestamo, numero_cuota, importe, vencimiento, estado) VALUES -- 1 - Pendiente, 2 - Pagado, 3 - Vencido
-- Préstamo 4: 5150 total, 10 cuotas
(1, 1, 515, DATE_ADD('2023-04-18', INTERVAL 1 MONTH), 1),
(1, 2, 515, DATE_ADD('2023-04-18', INTERVAL 2 MONTH), 1),
(1, 3, 515, DATE_ADD('2023-04-18', INTERVAL 3 MONTH), 1),
(1, 4, 515, DATE_ADD('2023-04-18', INTERVAL 4 MONTH), 1),
(1, 5, 515, DATE_ADD('2023-04-18', INTERVAL 5 MONTH), 1),
(1, 6, 515, DATE_ADD('2023-04-18', INTERVAL 6 MONTH), 1),
(1, 7, 515, DATE_ADD('2023-04-18', INTERVAL 7 MONTH), 1),
(1, 8, 515, DATE_ADD('2023-04-18', INTERVAL 8 MONTH), 1),
(1, 9, 515, DATE_ADD('2023-04-18', INTERVAL 9 MONTH), 1),
(1, 10, 515, DATE_ADD('2023-04-18', INTERVAL 10 MONTH), 1),

-- Préstamo 5: 9360 total, 10 cuotas
(2, 1, 936, DATE_ADD('2023-05-23', INTERVAL 1 MONTH), 2),
(2, 2, 936, DATE_ADD('2023-05-23', INTERVAL 2 MONTH), 2),
(2, 3, 936, DATE_ADD('2023-05-23', INTERVAL 3 MONTH), 2),
(2, 4, 936, DATE_ADD('2023-05-23', INTERVAL 4 MONTH), 3),
(2, 5, 936, DATE_ADD('2023-05-23', INTERVAL 5 MONTH), 3),
(2, 6, 936, DATE_ADD('2023-05-23', INTERVAL 6 MONTH), 3),
(2, 7, 936, DATE_ADD('2023-05-23', INTERVAL 7 MONTH), 1),
(2, 8, 936, DATE_ADD('2023-05-23', INTERVAL 8 MONTH), 1),
(2, 9, 936, DATE_ADD('2023-05-23', INTERVAL 9 MONTH), 1),
(2, 10, 936, DATE_ADD('2023-05-23', INTERVAL 10 MONTH), 1),

-- Préstamo 8: 15750 total, 10 cuotas
(3, 1, 1575, DATE_ADD('2023-10-01', INTERVAL 1 MONTH), 2),
(3, 2, 1575, DATE_ADD('2023-10-01', INTERVAL 2 MONTH), 2),
(3, 3, 1575, DATE_ADD('2023-10-01', INTERVAL 3 MONTH), 2),
(3, 4, 1575, DATE_ADD('2023-10-01', INTERVAL 4 MONTH), 2),
(3, 5, 1575, DATE_ADD('2023-10-01', INTERVAL 5 MONTH), 2),
(3, 6, 1575, DATE_ADD('2023-10-01', INTERVAL 6 MONTH), 2),
(3, 7, 1575, DATE_ADD('2023-10-01', INTERVAL 7 MONTH), 2),
(3, 8, 1575, DATE_ADD('2023-10-01', INTERVAL 8 MONTH), 2),
(3, 9, 1575, DATE_ADD('2023-10-01', INTERVAL 9 MONTH), 2),
(3, 10, 1575, DATE_ADD('2023-10-01', INTERVAL 10 MONTH), 2),

-- Préstamo 9: 15750 total, 10 cuotas
(4, 1, 1575, DATE_ADD('2023-06-21', INTERVAL 1 MONTH), 1),
(4, 2, 1575, DATE_ADD('2023-06-21', INTERVAL 2 MONTH), 1),
(4, 3, 1575, DATE_ADD('2023-06-21', INTERVAL 3 MONTH), 1),
(4, 4, 1575, DATE_ADD('2023-06-21', INTERVAL 4 MONTH), 1),
(4, 5, 1575, DATE_ADD('2023-06-21', INTERVAL 5 MONTH), 1),
(4, 6, 1575, DATE_ADD('2023-06-21', INTERVAL 6 MONTH), 1),
(4, 7, 1575, DATE_ADD('2023-06-21', INTERVAL 7 MONTH), 1),
(4, 8, 1575, DATE_ADD('2023-06-21', INTERVAL 8 MONTH), 1),
(4, 9, 1575, DATE_ADD('2023-06-21', INTERVAL 9 MONTH), 1),
(4, 10, 1575, DATE_ADD('2023-06-21', INTERVAL 10 MONTH), 1),

-- Préstamo 10: 7245 total, 10 cuotas
(5, 1, 724.5, DATE_ADD('2023-07-01', INTERVAL 1 MONTH), 1),
(5, 2, 724.5, DATE_ADD('2023-07-01', INTERVAL 2 MONTH), 1),
(5, 3, 724.5, DATE_ADD('2023-07-01', INTERVAL 3 MONTH), 1),
(5, 4, 724.5, DATE_ADD('2023-07-01', INTERVAL 4 MONTH), 1),
(5, 5, 724.5, DATE_ADD('2023-07-01', INTERVAL 5 MONTH), 1),
(5, 6, 724.5, DATE_ADD('2023-07-01', INTERVAL 6 MONTH), 1),
(5, 7, 724.5, DATE_ADD('2023-07-01', INTERVAL 7 MONTH), 1),
(5, 8, 724.5, DATE_ADD('2023-07-01', INTERVAL 8 MONTH), 1),
(5, 9, 724.5, DATE_ADD('2023-07-01', INTERVAL 9 MONTH), 1),
(5, 10, 724.5, DATE_ADD('2023-07-01', INTERVAL 10 MONTH), 1),

-- Préstamo 20: 5100000 total, 3 cuotas
(6, 1, 1700000, DATE_ADD('2024-12-09', INTERVAL 1 MONTH), 1),
(6, 2, 1700000, DATE_ADD('2024-12-09', INTERVAL 2 MONTH), 1),
(6, 3, 1700000, DATE_ADD('2024-12-09', INTERVAL 3 MONTH), 1),

-- Préstamo 21: 15300000 total, 3 cuotas
(7, 1, 5100000, DATE_ADD('2024-12-09', INTERVAL 1 MONTH), 1),
(7, 2, 5100000, DATE_ADD('2024-12-09', INTERVAL 2 MONTH), 1),
(7, 3, 5100000, DATE_ADD('2024-12-09', INTERVAL 3 MONTH), 1),

-- Préstamo 11: 21200 total, 10 cuotas
(8, 1, 2120, DATE_ADD('2023-08-10', INTERVAL 1 MONTH), 1),
(8, 2, 2120, DATE_ADD('2023-08-10', INTERVAL 2 MONTH), 1),
(8, 3, 2120, DATE_ADD('2023-08-10', INTERVAL 3 MONTH), 1),
(8, 4, 2120, DATE_ADD('2023-08-10', INTERVAL 4 MONTH), 1),
(8, 5, 2120, DATE_ADD('2023-08-10', INTERVAL 5 MONTH), 1),
(8, 6, 2120, DATE_ADD('2023-08-10', INTERVAL 6 MONTH), 1),
(8, 7, 2120, DATE_ADD('2023-08-10', INTERVAL 7 MONTH), 1),
(8, 8, 2120, DATE_ADD('2023-08-10', INTERVAL 8 MONTH), 1),
(8, 9, 2120, DATE_ADD('2023-08-10', INTERVAL 9 MONTH), 1),
(8, 10, 2120, DATE_ADD('2023-08-10', INTERVAL 10 MONTH), 1),

-- Préstamo 12: 11462 total, 10 cuotas
(9, 1, 1146.2, DATE_ADD('2023-09-14', INTERVAL 1 MONTH), 1),
(9, 2, 1146.2, DATE_ADD('2023-09-14', INTERVAL 2 MONTH), 1),
(9, 3, 1146.2, DATE_ADD('2023-09-14', INTERVAL 3 MONTH), 1),
(9, 4, 1146.2, DATE_ADD('2023-09-14', INTERVAL 4 MONTH), 1),
(9, 5, 1146.2, DATE_ADD('2023-09-14', INTERVAL 5 MONTH), 1),
(9, 6, 1146.2, DATE_ADD('2023-09-14', INTERVAL 6 MONTH), 1),
(9, 7, 1146.2, DATE_ADD('2023-09-14', INTERVAL 7 MONTH), 1),
(9, 8, 1146.2, DATE_ADD('2023-09-14', INTERVAL 8 MONTH), 1),
(9, 9, 1146.2, DATE_ADD('2023-09-14', INTERVAL 9 MONTH), 1),
(9, 10, 1146.2, DATE_ADD('2023-09-14', INTERVAL 10 MONTH), 1),

-- Préstamo 13: 9861 total, 10 cuotas
(10, 1, 986.1, DATE_ADD('2023-10-25', INTERVAL 1 MONTH), 1),
(10, 2, 986.1, DATE_ADD('2023-10-25', INTERVAL 2 MONTH), 1),
(10, 3, 986.1, DATE_ADD('2023-10-25', INTERVAL 3 MONTH), 1),
(10, 4, 986.1, DATE_ADD('2023-10-25', INTERVAL 4 MONTH), 1),
(10, 5, 986.1, DATE_ADD('2023-10-25', INTERVAL 5 MONTH), 1),
(10, 6, 986.1, DATE_ADD('2023-10-25', INTERVAL 6 MONTH), 1),
(10, 7, 986.1, DATE_ADD('2023-10-25', INTERVAL 7 MONTH), 1),
(10, 8, 986.1, DATE_ADD('2023-10-25', INTERVAL 8 MONTH), 1),
(10, 9, 986.1, DATE_ADD('2023-10-25', INTERVAL 9 MONTH), 1),
(10, 10, 986.1, DATE_ADD('2023-10-25', INTERVAL 10 MONTH), 1),

-- Préstamo 14: 32100 total, 10 cuotas
(11, 1, 3210, DATE_ADD('2023-11-30', INTERVAL 1 MONTH), 1),
(11, 2, 3210, DATE_ADD('2023-11-30', INTERVAL 2 MONTH), 1),
(11, 3, 3210, DATE_ADD('2023-11-30', INTERVAL 3 MONTH), 1),
(11, 4, 3210, DATE_ADD('2023-11-30', INTERVAL 4 MONTH), 1),
(11, 5, 3210, DATE_ADD('2023-11-30', INTERVAL 5 MONTH), 1),
(11, 6, 3210, DATE_ADD('2023-11-30', INTERVAL 6 MONTH), 1),
(11, 7, 3210, DATE_ADD('2023-11-30', INTERVAL 7 MONTH), 1),
(11, 8, 3210, DATE_ADD('2023-11-30', INTERVAL 8 MONTH), 1),
(11, 9, 3210, DATE_ADD('2023-11-30', INTERVAL 9 MONTH), 1),
(11, 10, 3210, DATE_ADD('2023-11-30', INTERVAL 10 MONTH), 1);


INSERT INTO pago (id_prestamo, id_cuota, id_movimiento, fecha) VALUES
(2, 11, 23, '2023-06-23'),
(2, 12, 24, '2023-07-23'),
(2, 13, 25, '2023-08-23'),
(3, 21, 26, '2023-11-01'),
(3, 22, 27, '2023-12-01'),
(3, 23, 28, '2024-01-01'),
(3, 24, 29, '2024-02-01'),
(3, 25, 30, '2024-03-01'),
(3, 26, 31, '2024-04-01'),
(3, 27, 32, '2024-05-01'),
(3, 28, 33, '2024-06-01'),
(3, 29, 34, '2024-07-01'),
(3, 30, 35, '2024-08-01');



-- Procedimientos almacenados

DELIMITER $$

CREATE PROCEDURE aceptar_prestamo (
    IN id_solicitud INT,
    IN monto_solicitado FLOAT,
    IN id_cuenta INT,
    IN fecha DATE,
    IN detalle VARCHAR(255)
)
BEGIN
    
    DECLARE v_monto_cuota FLOAT;
    DECLARE v_interes FLOAT;
    DECLARE v_plazo_cuotas INT;
    DECLARE v_importe_pagar FLOAT;
    DECLARE v_contador INT;
    DECLARE v_fecha_vencimiento DATE;

    -- LE DAMOS VALORES A LAS VARIABLES CREADAS
    
    SELECT 
        monto_cuota, 
        interes, 
        plazo_cuotas, 
        importe_pagar
    INTO 
        v_monto_cuota, 
        v_interes, 
        v_plazo_cuotas, 
        v_importe_pagar
    FROM prestamo_solicitado
    WHERE id_prestamo_solicitado = id_solicitud;

	-- CALCULO DEL MONTO DE LA CUOTA SUMANDOLE EL INTERES (CREO QUE SE PUEDE HACER MÁS FACIL EL CALCULO, PERO SOY PROGRAMADOR NO MATEMÁTICO)

	SET v_monto_cuota = v_monto_cuota + (v_monto_cuota / 100 * v_interes);

    -- PRESTAMO SOLICITADO PASA A ESTADO AUTORIZADO
    
    UPDATE prestamo_solicitado
    SET estado = 1 
    WHERE id_prestamo_solicitado = id_solicitud;

    -- INSERTA EL MOVIMIENTO
    
    INSERT INTO movimiento (
        id_cuenta, 
        id_tipo_movimiento, 
        fecha, 
        detalle, 
        importe, 
        id_destino
    ) VALUES (
        id_cuenta, 
        1, 
        fecha, 
        detalle, 
        monto_solicitado, 
        0
    );

    -- LEVANTA EL ID DEL MOVIMIENTO PARA INSERTARLO EN EL PRESTAMO
    
    SET @id_movimiento := LAST_INSERT_ID();

    -- INSERTA EL PRESTAMO
    
    INSERT INTO prestamo (
        id_prestamo_solicitado, 
        id_movimiento, 
        monto_cuota, 
        interes, 
        importe_solicitado, 
        fecha, 
        importe_pagar, 
        plazo_cuotas, 
        estado
    ) VALUES (
        id_solicitud,
        @id_movimiento,
        v_monto_cuota,
        v_interes,
        monto_solicitado,
        fecha,
        v_importe_pagar,
        v_plazo_cuotas,
        1 
    );

    -- LEVANTA EL ID DEL PRESTAMO PARA INSERTARLO EN LAS CUOTAS
    
    SET @id_prestamo := LAST_INSERT_ID();

    -- INSERT DE LAS CUOTAS DE A CUERDO A LAS CANTIDADES Y FECHAS ESTABLECIDAS
    
    SET v_contador = 1;
    SET v_fecha_vencimiento = DATE_ADD(fecha, INTERVAL 1 MONTH);

    WHILE v_contador <= v_plazo_cuotas DO
        INSERT INTO cuota (
            id_prestamo, 
            numero_cuota, 
            importe, 
            vencimiento,
            estado
        ) VALUES (
            @id_prestamo,
            v_contador,
            v_monto_cuota,
            v_fecha_vencimiento,
            1
        );

        SET v_contador = v_contador + 1;
        SET v_fecha_vencimiento = DATE_ADD(v_fecha_vencimiento, INTERVAL 1 MONTH);
    END WHILE;

    -- UPDATE DEL SALDO DE LA CUENTA
    
    UPDATE cuenta c
    SET c.saldo = c.saldo + monto_solicitado 
    WHERE c.id_cuenta = id_cuenta;

END $$

DELIMITER ;

DELIMITER //

CREATE PROCEDURE sp_transferir_fondos (
    IN p_id_cuenta_origen INT,
    IN p_id_cuenta_destino INT,
    IN p_importe FLOAT,
    IN p_detalle VARCHAR(200)
)
BEGIN
    DECLARE v_saldo_origen FLOAT;
    DECLARE v_error_message VARCHAR(255);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    -- Iniciar transacción
    START TRANSACTION;

    -- Verificar que las cuentas existen y están activas
    IF NOT EXISTS (SELECT 1 FROM cuenta WHERE id_cuenta = p_id_cuenta_origen AND activa = 1) THEN
        SET v_error_message = CONCAT('Cuenta de origen ', p_id_cuenta_origen, ' no existe o no está activa');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_error_message;
    END IF;

    IF NOT EXISTS (SELECT 1 FROM cuenta WHERE id_cuenta = p_id_cuenta_destino AND activa = 1) THEN
        SET v_error_message = CONCAT('Cuenta de destino ', p_id_cuenta_destino, ' no existe o no está activa');
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_error_message;
    END IF;

    -- Verificar saldo suficiente
    SELECT saldo INTO v_saldo_origen 
    FROM cuenta 
    WHERE id_cuenta = p_id_cuenta_origen;

    IF v_saldo_origen < p_importe THEN
        SET v_error_message = CONCAT('Saldo insuficiente. Saldo actual: ', v_saldo_origen);
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_error_message;
    END IF;

    -- Insertar movimiento de salida (negativo)
    INSERT INTO movimiento (
        id_cuenta, 
        id_tipo_movimiento, 
        fecha, 
        detalle, 
        importe, 
        id_destino
    ) VALUES (
        p_id_cuenta_origen, 
        2,  -- Tipo de movimiento: Transferencia
        CURRENT_DATE(), 
        p_detalle, 
        -p_importe, 
        p_id_cuenta_destino
    );

    -- Insertar movimiento de entrada (positivo)
    INSERT INTO movimiento (
        id_cuenta, 
        id_tipo_movimiento, 
        fecha, 
        detalle, 
        importe, 
        id_destino
    ) VALUES (
        p_id_cuenta_destino, 
        2,  -- Tipo de movimiento: Transferencia
        CURRENT_DATE(), 
        p_detalle, 
        p_importe, 
        p_id_cuenta_origen
    );

    -- Actualizar saldo de cuenta de origen
    UPDATE cuenta 
    SET saldo = saldo - p_importe 
    WHERE id_cuenta = p_id_cuenta_origen;

    -- Actualizar saldo de cuenta de destino
    UPDATE cuenta 
    SET saldo = saldo + p_importe 
    WHERE id_cuenta = p_id_cuenta_destino;

    -- Confirmar transacción
    COMMIT;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE PagarCuota(
    IN p_id_prestamo INT,
    IN p_id_cuota INT,
    IN p_id_cuenta INT
)
BEGIN
    DECLARE v_importe_cuota FLOAT;
    DECLARE v_saldo_cuenta FLOAT;
    DECLARE v_total_cuotas INT;
    DECLARE v_cuotas_pagadas INT;
    DECLARE v_id_movimiento INT;
    DECLARE v_estado_prestamo INT;

    START TRANSACTION;

    -- ASIGNA EL IMPORTE DE LA CUOTA
    SELECT importe INTO v_importe_cuota
    FROM cuota 
    WHERE id_prestamo = p_id_prestamo AND id_cuota = p_id_cuota;

    -- ASIGNA EL SALDO DE LA CUENTA
    SELECT saldo INTO v_saldo_cuenta
    FROM cuenta
    WHERE id_cuenta = p_id_cuenta FOR UPDATE;

    -- VERIFICA QUE EL SALDO SEA SUFICIENTE
    IF v_saldo_cuenta < v_importe_cuota THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Saldo insuficiente para pagar la cuota';
    END IF;

    -- INSERT DEL MOVIMIENTO
    INSERT INTO movimiento (
        id_cuenta, 
        id_tipo_movimiento, 
        fecha, 
        detalle, 
        importe, 
        id_destino
    ) VALUES (
        p_id_cuenta, 
        2, -- Tipo de movimiento de pago
        CURRENT_DATE, 
        CONCAT('Pago cuota ', p_id_cuota, ' de préstamo ', p_id_prestamo), 
        -v_importe_cuota, 
        0
    );

    -- LEVANTA EL ID DEL MOVIMIENTO
    SET v_id_movimiento = LAST_INSERT_ID();

    -- ACTUALIZA EL SALDO EN LA CUENTA
    UPDATE cuenta 
    SET saldo = saldo - v_importe_cuota
    WHERE id_cuenta = p_id_cuenta;

    -- CAMBIA A PAGADO EL ESTADO DE LA CUOTA
    UPDATE cuota
    SET estado = 2 
    WHERE id_prestamo = p_id_prestamo AND id_cuota = p_id_cuota;

    -- INSERTA EL PAGO
    INSERT INTO pago (
        id_prestamo, 
        id_cuota, 
        id_movimiento, 
        fecha
    ) VALUES (
        p_id_prestamo, 
        p_id_cuota, 
        v_id_movimiento, 
        CURRENT_DATE
    );

    -- VERIFICA SI ES LA ULTIMA CUOTA DEL PRESTAMO
    SELECT 
        COUNT(*) AS total_cuotas,
        SUM(CASE WHEN estado = 2 THEN 1 ELSE 0 END) AS cuotas_pagadas
    INTO v_total_cuotas, v_cuotas_pagadas
    FROM cuota
    WHERE id_prestamo = p_id_prestamo;

    -- SI SE ESTA PAGANDO LA ULTIMA CUOTA DEL PRESTAMO, LE PONE ESTADO FINALIZADO
    IF v_total_cuotas = v_cuotas_pagadas THEN
        UPDATE prestamo
        SET estado = 2
        WHERE id_prestamo = p_id_prestamo;
    END IF;

    COMMIT;
END //

DELIMITER ;