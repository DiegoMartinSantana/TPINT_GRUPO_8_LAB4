drop database if exists SistemBank;
create database SistemBank;

use SistemBank;

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

drop table if exists prestamo;
create table prestamo (
  id_prestamo int not null auto_increment,
  id_movimiento int not null,
  monto_cuota float ,
  interes float NOT NULL,
  importe_solicitado float not null,
  fecha date not null,
  importe_pagar float not null,
  plazo_cuotas int not null,
  estado int DEFAULT 3,		-- 1. Autorizado, 2. Denegado, 3. Pendiente
  primary key (id_prestamo),
  unique key (id_movimiento),
  foreign key (id_movimiento) references movimiento (id_movimiento)
);

drop table if exists cuota;
create table cuota (
  id_cuota int auto_increment,
  id_prestamo int not null,
  numero_cuota int not null,
  importe float not null,
  fecha_pago date default null,
  vencimiento date not null,
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
  estado int not null,		-- 1. Total, 2. Parcial
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
(1, 1, '2022-01-15', '1234567890123456789012', 15000, 1),
(2, 2, '2021-06-20', '2345678901234567890123', 30000, 1),
(3, 1, '2023-02-10', '3456789012345678901234', 5000, 1),
(4, 2, '2020-10-05', '4567890123456789012345', 25000, 1),
(5, 1, '2023-05-25', '5678901234567890123456', 10000, 1),
(6, 1, '2021-09-17', '6789012345678901234567', 8000, 1),
(7, 2, '2022-11-30', '7890123456789012345678', 4500, 1),
(8, 1, '2023-04-01', '8901234567890123456789', 2000, 1),
(9, 2, '2020-12-21', '9012345678901234567890', 18000, 1),
(10, 1, '2022-07-22', '0123456789012345678901', 9500, 1),
(11, 2, '2023-06-10', '1123456789012345678902', 11000, 1),
(12, 1, '2021-03-15', '1223456789012345678903', 30000, 1),
(13, 2, '2023-01-30', '1323456789012345678904', 15000, 1),
(5, 1, '2020-01-22', '1423456789012345678905', 8000, 1);

INSERT INTO movimiento (id_cuenta, id_tipo_movimiento, fecha, detalle, importe, id_destino) VALUES
(2, 2, '2023-02-15', 'Transferencia a cuenta 3', 5000, 3),
(3, 3, '2023-03-12', 'Pago de servicios', 1500, 0),
(4, 1, '2023-04-18', 'Depósito en efectivo', 2000, 0),
(5, 2, '2023-05-05', 'Transferencia a cuenta 6', 2500, 6),
(6, 3, '2023-06-21', 'Pago de tarjeta', 3000, 0),
(7, 1, '2023-07-01', 'Depósito inicial', 4500, 0),
(8, 3, '2023-08-10', 'Pago de alquiler', 2000, 0),
(9, 2, '2023-09-14', 'Transferencia a cuenta 2', 3500, 2),
(10, 1, '2023-10-25', 'Depósito por transferencia', 4000, 0),
(11, 2, '2023-11-30', 'Transferencia a cuenta 9', 2200, 9),
(12, 3, '2023-12-11', 'Pago de impuestos', 1700, 0),
(13, 1, '2024-01-20', 'Depósito inicial', 15000, 0),
(1, 2, '2024-02-15', 'Transferencia a cuenta 5', 3000, 5),
(5, 3, '2024-03-12', 'Pago de suscripción', 1200, 0),
(3, 1, '2024-04-05', 'Depósito adicional', 7000, 0);



INSERT INTO prestamo (id_movimiento, monto_cuota, interes, importe_solicitado, fecha, importe_pagar, plazo_cuotas, estado) VALUES
(1, 1000, 5, 10000, '2023-01-10', 10500, 10, 1),
(2, 800, 4, 8000, '2023-02-15', 8320, 10, 1),
(3, 1200, 6, 12000, '2023-03-12', 12720, 10, 1),
(4, 500, 3, 5000, '2023-04-18', 5150, 10, 1),
(5, 900, 4.5, 9000, '2023-05-05', 9360, 10, 1),
(6, 1500, 5, 15000, '2023-06-21', 15750, 10, 1),
(7, 700, 3.5, 7000, '2023-07-01', 7245, 10, 1),
(8, 2000, 6, 20000, '2023-08-10', 21200, 10, 1),
(9, 1100, 4.2, 11000, '2023-09-14', 11462, 10, 1),
(10, 950, 3.8, 9500, '2023-10-25', 9861, 10, 1),
(11, 3000, 7, 30000, '2023-11-30', 32100, 10, 1),
(12, 750, 3.6, 7500, '2023-12-11', 7770, 10, 1),
(13, 500, 3, 5000, '2024-01-20', 5150, 10, 1),
(14, 1000, 5, 10000, '2024-02-15', 10500, 10, 1),
(15, 1800, 6.2, 18000, '2024-03-12', 19116, 10, 1);

INSERT INTO cuota (id_prestamo, numero_cuota, importe, fecha_pago, vencimiento) VALUES
(1, 1, 1050, '2023-02-10', '2023-02-15'),
(1, 2, 1050, '2023-03-10', '2023-03-15'),
(2, 1, 832, '2023-04-10', '2023-04-15'),
(2, 2, 832, '2023-05-10', '2023-05-15'),
(3, 1, 1272, '2023-06-10', '2023-06-15'),
(3, 2, 1272, NULL, '2023-07-15'),
(4, 1, 515, '2023-08-10', '2023-08-15'),
(5, 1, 936, '2023-09-10', '2023-09-15'),
(6, 1, 1575, '2023-10-10', '2023-10-15'),
(7, 1, 724.5, NULL, '2023-11-15'),
(8, 1, 2120, '2023-12-10', '2023-12-15'),
(9, 1, 1146.2, NULL, '2024-01-15'),
(10, 1, 986.1, '2024-02-10', '2024-02-15'),
(11, 1, 3210, '2024-03-10', '2024-03-15'),
(12, 1, 777, NULL, '2024-04-15');


INSERT INTO pago (id_prestamo, id_cuota, id_movimiento, fecha, estado) VALUES
(1, 1, 1, '2023-02-10', 1),
(1, 2, 2, '2023-03-10', 1)
