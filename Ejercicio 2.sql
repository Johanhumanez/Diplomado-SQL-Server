CREATE DATABASE LIBRERIA
USE LIBRERIA
GO

---CREAR ESQUEMAS
CREATE SCHEMA CATALOGO
GO
CREATE SCHEMA VENTAS
GO

---ESQUEMAS CATALOGO
CREATE TABLE CATALOGO.AUTORES
(
	AutorID INT Primary key,
	Nombre varchar(100),
	Apellido varchar (100)


)
CREATE TABLE CATALOGO.CATEGORIAS
(
	CategoriaID INT Primary key,
	Nombre varchar(100) UNIQUE

)

CREATE TABLE CATALOGO.LIBROS
(
	LibroID INT Primary key,
	Titulo varchar (200) NOT NULL UNIQUE,
	AutorID INT, 
	CategoriaID INT,
	Precio float,
	CONSTRAINT FK_AUTOR_ID_AUTORES_CON_AUTORID_LIBROS FOREIGN KEY (AutorID)
	REFERENCES CATALOGO.AUTORES(AutorID),
	CONSTRAINT FK_CATEGORIA_ID_CATEGORIAS_CON_CATEGORIA_ID FOREIGN KEY(CategoriaID)
	REFERENCES CATALOGO.CATEGORIAS(CategoriaID)
)

CREATE TABLE VENTAS.CLIENTES (
	ClienteID INT PRIMARY KEY,
	Nombre varchar (100),
	Apellido varchar (100),
	Correo Nvarchar(100) UNIQUE
)

CREATE TABLE VENTAS.VENTAS (
	VentaID INT Primary key,
	ClienteID INT, ---FOREING KEY PENDIENTE
	FechaVenta DATE
)

CREATE TABLE VENTAS.DetalleVentas(
	DetalleID INT Primary key,
	VentaID INT UNIQUE,
	LibroID INT, ---FOREIGN KEY PENDIENTE
	Cantidad INT,
	PrecioVenta FLOAT
)

---A�ADIR RESTRICCION A TABLA VENTAS
ALTER TABLE VENTAS.VENTAS
ADD CONSTRAINT FK_ClienteID_Ventas_con_Cliente_ID_Clientes FOREIGN KEY(ClienteID)
REFERENCES VENTAS.CLIENTES(ClienteID)

---A�ADIR RESTRICCION A LA TABLA DETALLE VENTAS
ALTER TABLE VENTAS.DetalleVentas
ADD CONSTRAINT FK



