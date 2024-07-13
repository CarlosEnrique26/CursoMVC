create database DBCARRITO

GO

USE DBCARRITO

GO

CREATE TABLE CATEGORIA(
IdCategoria int primary key identity,
Descripcion varchar(100),
Activo bit default 1,
FechaRegistro datetime default getdate()
)

go

CREATE TABLE MARCA(
IdMarca int primary key identity,
Descripcion varchar(100),
Activo bit default 1,
FechaRegistro datetime default getdate()
)

go

CREATE TABLE PRODUCTO(
IdProducto int primary key identity,
Nombre varchar(500),
Descripcion varchar(500),
IdMarca int references Marca(IdMarca),
IdCategoria int references Categoria(IdCategoria),
Precio decimal(10,2) default 0,
Stock int,
RutaImagen varchar(100),
NombreImagen varchar(100),
Activo bit default 1,
FechaRegistro datetime default getdate()
)

go 

CREATE TABLE CLIENTE(
IdCliente int primary key identity,
Nombres varchar(100),
Apellidos varchar(100),
Correo varchar(100),
Clave varchar(150),
Reestablecer bit default 0,
FechaRegistro datetime default getdate()
)

go

CREATE TABLE CARRITO(
IdCarrito int primary key identity,
IdCliente int references CLIENTE(IdCliente),
IdProducto int references PRODUCTO(IdProducto),
Cantidad int
)

go

CREATE TABLE VENTA(
IdVenta int primary key identity,
IdCliente int references CLIENTE(IdCliente),
TotalProducto int,
MontoTotal decimal(10,2),
Contacto varchar(50),
IdDistrito varchar(10),
Telefono varchar(50),
Direccion varchar(500),
IdTransaccion varchar(50),
FechaVenta datetime default getdate()
)

go

CREATE TABLE DETALLE_VENTA(
IdDetalleVenta int primary key identity,
IdVenta int references Venta(IdVenta),
IdProducto int references PRODUCTO(IdProducto),
Cantidad int,
Total decimal(10,2)
)

go

CREATE TABLE USUARIO(
IdUsuario int primary key identity,
Nombres varchar(100),
Apellidos varchar(100),
Correo varchar(100),
Clave varchar(150),
Reestablecer bit default 1,
Activo bit default 1,
FechaRegistro datetime default getdate()
)

go

CREATE TABLE DEPARTAMENTO(
IdDepartamento varchar(2) NOT NULL,
Descripcion varchar(45) NOT NULL,
)

go

CREATE TABLE PROVINCIA(
IdProvincia varchar(4) NOT NULL,
Descripcion varchar(45) NOT NULL,
IdDepartamento varchar(2) NOT NULL
)

go

CREATE TABLE DISTRITO(
IdDistrito varchar(6) NOT NULL,
Descripcion varchar(45) NOT NULL,
IdProvincia varchar(4) NOT NULL,
IdDepartamento varchar(2) NOT NULL
)

go

select * from USUARIO

insert into USUARIO(Nombres,Apellidos,Correo,Clave) values ('test nombre','test apellido','test@example.com','ecd71870d1963316a97e3ac3408c9835ad8cf0f3c1bc703527c30265534f75ae')

select * from CATEGORIA

insert into CATEGORIA(Descripcion) values
('Tecnologia'),
('Muebles'),
('Dormitorio'),
('Deportes')

select * from MARCA

insert into MARCA(Descripcion) values
('SONYTE'),
('HPTE'),
('LG'),
('HYUNDAITE'),
('CANONTE'),
('ROBERTA ALLENTE')

select * from DEPARTAMENTO

insert into DEPARTAMENTO(IdDepartamento,Descripcion)
values
('01','Madrid'),
('02','Valencia'),
('03','Barcelona')

select * from PROVINCIA

insert into PROVINCIA(IdProvincia,Descripcion,IdDepartamento)
values
('0101','Madrid','01'),

('0202','Valencia','02'),

('0303','Barcelona','03')

select * from DISTRITO

insert into DISTRITO(IdDistrito,Descripcion,IdProvincia,IdDepartamento)

values
('010101', 'Centro', '0101','01'),           -- Centro en la provincia de Madrid
('010102', 'Salamanca', '0101','01'),        -- Salamanca en la provincia de Madrid
('020201', 'Ciutat Vella', '0202','02'),     -- Ciutat Vella en la provincia de Valencia
('020202', 'Ruzafa', '0202','02'),           -- Ruzafa en la provincia de Valencia
('030301', 'Eixample', '0303','03'),         -- Eixample en la provincia de Barcelona
('030302', 'Gràcia', '0303','03')          -- Gràcia en la provincia de Barcelona


