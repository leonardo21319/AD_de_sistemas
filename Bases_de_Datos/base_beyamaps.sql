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
CREATE TABLE Usuario(
	Id_Usuario INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
	Id_Persona INT NOT NULL,
	Id_Preferencias INT NOT NULL,
	Usuario VARCHAR(50) NOT NULL,
	Contraseña VARCHAR(50) NOT NULL,
	Id_Itinerario INT NOT NULL,
	Id_Favorito INT NOT NULL,
	Id_Historial INT NOT NULL
)
ALTER TABLE Usuario ADD FOREIGN KEY (Id_Persona) references Persona(Id_Persona) 
ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE Usuario ADD FOREIGN KEY (Id_Preferencias) references Preferencias(Id_Preferencia) 
ON DELETE CASCADE ON UPDATE CASCADE 
ALTER TABLE Usuario ADD FOREIGN KEY (Id_Itinerario) references Itinerario(Id_Itinerario) 
ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE Usuario ADD FOREIGN KEY (Id_Favorito) references Favoritos(Id_Favoritos) 
ON DELETE CASCADE ON UPDATE CASCADE
ALTER TABLE Usuario ADD FOREIGN KEY (Id_Historial) references Historial_busqueda(Id_Historial) 
ON DELETE CASCADE ON UPDATE CASCADE 

---Tabla de Administrador-----
CREATE TABLE Administrador(
	Id_Admi INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Id_Pesona INT NOT NULL,
	Usuario VARCHAR(50) NOT NULL,
	Contraseña Varchar(50) NOT NULL
)
ALTER TABLE Administrador ADD FOREIGN KEY (Id_Pesona) references Persona(Id_Persona) 
ON DELETE CASCADE ON UPDATE CASCADE

--Tabla Preferencias---
CREATE TABLE Preferencias(
	Id_Preferencia INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL
)

---Tabla Itinerario---
CREATE TABLE Itinerario(
	Id_Itinerario INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Id_Usuario INT NOT NULL,
	Id_Lugar INT NOT NULL,
	Fecha_Itinerario DATETIME NOT NULL,
	Hora_Itinerario TIME NOT NULL
)
ALTER TABLE Itinerario ADD FOREIGN KEY (Id_Lugar) references Lugar(Id_Lugar) 
ON DELETE CASCADE ON UPDATE CASCADE

----Tabla Favoritos---
CREATE TABLE Favoritos(
	Id_Favoritos INT IDENTITY(1,1) NOT NULL  PRIMARY KEY,
	Id_Lugar INT NOT NULL
)
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