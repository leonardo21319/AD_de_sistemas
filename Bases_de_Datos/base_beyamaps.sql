CREATE DATABASE AD_SISTEMAS
USE AD_SISTEMAS

----Tabla Persona---
CREATE TABLE Persona(
	Id_Persona INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Id_Contacto INT NOT NULL,
	Nombre VARCHAR(50) NOT NULL,
	A_Paterno VARCHAR(50) NOT NULL,
	A_Materno VARCHAR(50) NOT NULL
)
ALTER TABLE Persona ADD FOREIGN KEY (Id_Contacto) references Contacto(Id_Contacto) 
ON DELETE CASCADE ON UPDATE CASCADE

---Tabla Contacto---
CREATE TABLE Contacto(
		Id_Contacto INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
		Correo VARCHAR(50) NOT NULL, 
		Telefono VARCHAR(50) NOT NULL
)

---Tabla Usuario---
CREATE TABLE Turista(
	Id_Turista INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
	Id_Persona INT NOT NULL,
	Usuario VARCHAR(50) NOT NULL,
	Contraseña VARCHAR(50) NOT NULL,
	Id_Historial INT NOT NULL
)
ALTER TABLE Turista ADD FOREIGN KEY (Id_Persona) references Persona(Id_Persona) 
ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE Turista ADD FOREIGN KEY (Id_Historial) references Historial_busqueda(Id_Historial) 


--Tabla Preferencias---
CREATE TABLE Preferencias(
	Id_Preferencia INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL,
	Id_Turista INT NOT NULL

ALTER TABLE Preferencias ADD FOREIGN KEY (Id_Turista) references Turista(Id_Turista) 
ON DELETE CASCADE ON UPDATE CASCADE

---Tabla Itinerario---
CREATE TABLE Itinerario(
	Id_Itinerario INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Id_Lugar INT NOT NULL,
	Fecha_Itinerario DATETIME NOT NULL,
	Hora_Itinerario TIME NOT NULL,
	Id_Turista INT NOT NULL
)
ALTER TABLE Itinerario ADD FOREIGN KEY (Id_Turista) references Turista(Id_Turista) 
ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE Itinerario ADD FOREIGN KEY (Id_Lugar) references Lugar(Id_Lugar) 
ON DELETE CASCADE ON UPDATE CASCADE

----Tabla Favoritos---
CREATE TABLE Favoritos(
	Id_Favoritos INT IDENTITY(1,1) NOT NULL  PRIMARY KEY,
	Id_Lugar INT NOT NULL,
	Id_Turista INT NOT NULL
)
ALTER TABLE Favoritos ADD FOREIGN KEY (Id_Turista) references Turista(Id_Turista) 
ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE Favoritos ADD FOREIGN KEY (Id_Lugar) references Lugar(Id_Lugar) 
ON DELETE CASCADE ON UPDATE CASCADE

---Tabla Lugar---
CREATE TABLE Lugar(
	Id_Lugar INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL
)

---Historial de busqueda---
CREATE TABLE Historial_busqueda(
	Id_Historial INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Id_Lugar INT NOT NULL
)
ALTER TABLE Historial_busqueda ADD FOREIGN KEY (Id_Lugar) references Lugar(Id_Lugar) 
ON DELETE CASCADE ON UPDATE CASCADE


-------------------------------LLENADO DE TABLAS-----------------------------

INSERT INTO Persona (Id_Contacto, Nombre, A_Paterno, A_Materno)
VALUES 
    (4, 'Juan', 'Perez', 'Gomez'),
    (5, 'Maria', 'Lopez', 'Martinez'),
    (6, 'Carlos', 'Garcia', 'Rodriguez');

	DELETE FROM Persona

INSERT INTO Lugar (Nombre)
VALUES 
    ('Lugar1'),
    ('Lugar2'),
    ('Lugar3');


	INSERT INTO Historial_busqueda (Id_Lugar)
VALUES 
    (1),
    (2),
    (3);

	INSERT INTO Contacto (Correo, Telefono)
VALUES 
    ('correo1@gmail.com', '123456789'),
    ('correo2@outlook.com', '987654321'),
    ('correo3@hotmail.com', '555555555');


INSERT INTO Historial_busqueda (Id_Lugar,n)
VALUES 
    (1),
    (2),
    (3);

INSERT INTO Turista (Id_Persona, Usuario, Contraseña, Id_Historial)
VALUES 
    (6, 'usuario1', 'contraseña1', 3),
    (7, 'usuario2', 'contraseña2', 4),
    (8, 'usuario3', 'contraseña3', 5);

INSERT INTO Preferencias (Nombre, Id_Turista)
VALUES 
    ('Preferencia1', 14),
    ('Preferencia2', 15),
    ('Preferencia3', 16);

INSERT INTO Itinerario (Id_Lugar, Fecha_Itinerario, Hora_Itinerario, Id_Turista)
VALUES 
    (1, '2023-11-07 00:00:00', '14:30:00', 14),
    (2, '2023-11-08 00:00:00', '09:00:00', 15),
    (3, '2023-11-09 00:00:00', '16:45:00', 16);

	INSERT INTO Favoritos (Id_Lugar, Id_Turista)
VALUES 
    (1, 14),
    (2, 15),
    (3, 16);



SELECT * FROM Persona 
SELECT * FROM Contacto 
SELECT * FROM Turista
SELECT * FROM Historial_busqueda
SELECT * FROM Lugar

