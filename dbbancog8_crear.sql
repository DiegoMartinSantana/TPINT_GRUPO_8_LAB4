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
  nombre_usuario varchar(20) not null,
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
  nacionalidad varchar(25) not null,
  nacimiento varchar(15) not null,
  domicilio varchar(60) not null,
  localidad varchar(60) not null,
  id_provincia int not null,
  email varchar(45) not null,
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
  cbu varchar(22) not null,
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
  primary key (id_movimiento),
  foreign key (id_cuenta) references cuenta (id_cuenta)
);

drop table if exists prestamo;
create table prestamo (
  id_prestamo int not null auto_increment,
  id_movimiento int not null,
  cuotas int DEFAULT 1,
  interes float NOT NULL,
  importe_pagar float not null,
  estado int DEFAULT 3,		-- 1. Autorizado, 2. Denegado, 3. Pendiente
  primary key (id_prestamo),
  unique key (id_movimiento),
  foreign key (id_movimiento) references movimiento (id_movimiento)
);

drop table if exists cuota;
create table cuota (
  id_prestamo int not null,
  numero_cuota int,
  importe float not null,
  vencimiento date not null,
  estado int DEFAULT 2,		-- 1. Pagada, 2. Pendiente, 3. Pago parcial
  primary key (id_prestamo, numero_cuota),
  foreign key (id_prestamo) references prestamo (id_prestamo)
);

drop table if exists pago;
create table pago (
  id_pago int not null auto_increment,
  id_prestamo int not null,
  numero_cuota int,
  id_movimiento int not null,
  estado int not null,		-- 1. Total, 2. Parcial
  primary key (id_pago),
  foreign key (id_prestamo, numero_cuota) references cuota (id_prestamo, numero_cuota),
  foreign key (id_movimiento) references movimiento (id_movimiento)
);

insert into usuario(nombre_usuario, pass, tipo) values
('admin1', '123', 1),
('admin2', '123', 1),
('cliente1', '123', 2),
('cliente2', '123', 2);

INSERT INTO provincia (nombre) VALUES
('Buenos Aires'),
('Córdoba'),
('Santa Fe'),
('Mendoza'),
('Salta');

-- Insert into usuario
INSERT INTO usuario (nombre_usuario, pass, tipo, activo) VALUES
('client1', '123', 2, 1),
('client2', '123', 2, 1),
('client3', '123', 2, 1),
('client4', '123', 2, 1),
('client5', '123', 2, 1);

-- Insert into cliente
INSERT INTO cliente (nombre_usuario, dni, cuil, nombre, apellido, sexo, nacionalidad, nacimiento, domicilio, localidad, id_provincia, email, telefono) VALUES
('client1', 12345678, '20-12345678-0', 'Juan', 'Pérez', 1, 'Argentino', '1990-05-15', 'Calle Falsa 123', 'Ciudad Autónoma de Buenos Aires', 1, 'juan.perez@example.com', '011-1234-5678'),
('client2', 23456789, '20-23456789-0', 'María', 'González', 2, 'Argentina', '1985-08-25', 'Avenida Siempreviva 742', 'Córdoba', 2, 'maria.gonzalez@example.com', '0351-234-5678'),
('client3', 34567890, '20-34567890-0', 'Carlos', 'López', 1, 'Argentino', '1992-11-10', 'Calle Segunda 456', 'Rosario', 3, 'carlos.lopez@example.com', '0341-678-1234'),
('client4', 45678901, '20-45678901-0', 'Ana', 'Martínez', 2, 'Argentina', '1988-03-05', 'Calle Tercera 789', 'Mendoza', 4, 'ana.martinez@example.com', '0261-123-4567'),
('client5', 56789012, '20-56789012-0', 'Diego', 'Fernández', 1, 'Argentino', '1995-09-12', 'Calle Cuarta 1011', 'Salta', 5, 'diego.fernandez@example.com', '0387-123-4567');
