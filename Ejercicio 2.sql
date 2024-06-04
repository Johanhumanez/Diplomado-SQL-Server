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
	ADD CONSTRAINT FK_LibroID_Con_LibroID_Libros FOREIGN KEY(LibroID)
	REFERENCES CATALOGO.LIBROS(LibroID)


---A�ADIR RESTRICCION A LA TABLA DETALLE VENTAS
	ALTER TABLE VENTAS.Detalleventas
	ADD CONSTRAINT FK_VentaID_con_VentaID_VENTAS FOREIGN KEY (VentaID)
	REFERENCES VENTAS.VENTAS(VentaID)

----CAMBIAR NOMBRE DE COLUMNAS

EXEC sp_rename 'VENTAS.CLIENTES.Correo', 'Email', 'COLUMN';
	
	SELECT * FROM VENTAS.CLIENTES
	SELECT* FROM CATALOGO.LIBROS
	SELECT* FROM VENTAS.CLIENTES


----A�ADIR COLUMNA A TABLA EXISTENTE

	ALTER TABLE VENTAS.VENTAS
	ADD Metodo_pago VARCHAR CHECK (Metodo_pago='Efectivo' or Metodo_Pago= 'Tarjeta')
	SELECT* FROM VENTAS.VENTAS

	ALTER TABLE CATALOGO.LIBROS
	ADD CONSTRAINT IDENTITY_LIBROS_LibroID
	IDENTITY(1,5)(LibroID)

	ADD Genero VARCHAR(100)
	SELECT* FROM CATALOGO.LIBROS


	---AGRREGAR RESTRICCION A CATALOGO.CATEGORIAS

	ALTER TABLE CATALOGO.CATEGORIAS
	ALTER COLUMN CategoriaID IDENTITY (1,5)---preguntar

	---INSERTAR DATOS A LA TABLA CATALOGO.AUTORES
	SELECT* FROM CATALOGO.AUTORES
	INSERT INTO CATALOGO.AUTORES (AutorID,Nombre,Apellido)
	VALUES
	(1,'Juan','Hernandez'),
	(2,'Jose','Ruiz'),
	(3,'Paola','Rojas'),
	(4,'Esteban','Lopez'),
	(5,'Sandra','Alvarez'),
	(6,'Luisa','Hernandez'),
	(7,'Juan','Perez'),
	(8,'Ederson','Hernandez'),
	(9,'Luis','Jimenez'),
	(10,'Andrea','Rodriguez')

	SELECT* FROM CATALOGO.CATEGORIAS
	INSERT INTO CATALOGO.CATEGORIAS (CategoriaID,Nombre)
	VALUES
	(221,'Terror'),
	(222,'Suspenso'),
	(223,'Comedia'),
	(224,'Ciencia ficci�n'),
	(225,'Accion'),
	(226,'Deportes')

	SELECT* FROM CATALOGO.LIBROS
	INSERT INTO CATALOGO.LIBROS (LibroID,Titulo,AutorID,IDCategoria,Precio,Genero)
	VALUES
	(30,'Cien a�os de soledad',1,221,205.2,'ficcion'),
	(31,'Los vecinos mueren en las novelas',2,222,206.2,'suspenso')

	SELECT* FROM VENTAS.CLIENTES
	INSERT INTO VENTAS.CLIENTES (IDCliente,Nombre,Apellido,Email)
	VALUES
	(401,'JORGE','RODRIGUEZ','JORGE@GMAIL.COM'),
	(402,'ERNESTO','ZAPATA','ERNESTO@GMAIL.COM'),
	(403,'ANDRES','PEREZ','ANDRES@GMAIL.COM'),
	(404,'FRANCISCO','CASTRO','FRANCISCO@GMAIL.COM'),
	(405,'SERGIO','PEINADO','SERGIO@GMAIL.COM')

	ALTER TABLE VENTAS.VENTAS
	ALTER COLUMN Metodo_pago varchar(100)
	
	SELECT* FROM VENTAS.VENTAS
	INSERT INTO VENTAS.VENTAS (VentaID,ClienteID,FechaVenta,Metodo_pago)
	VALUES
	(50,401,'2023-05-10','Efectivo'),
	(51,402,'2023-05-10','Efectivo'),
	(52,403,'2024-06-10','Tarjeta'),
	(53,404,'2023-05-10','Efectivo'),
	(54,405,'2023-05-10','Efectivo')

	SELECT* FROM VENTAS.DetalleVentas
	INSERT INTO VENTAS.Detalleventas (DetalleID,VentaID,LibroID,Cantidad,PrecioVenta)
	VALUES
	(5030,50,30,10,4500),
	(5031,51,31,1,1000),
	(5032,52,31,8,3000)
	
