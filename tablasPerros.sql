CREATE DATABASE perros;
USE perros;

-- Tabla de Usuarios
CREATE TABLE usuarios (
    ID_USUARIO INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Telefono VARCHAR(15),
    Direccion VARCHAR(255),
    Rol ENUM('admin', 'usuario') NOT NULL, -- Añadir campo rol con valores posibles
    Fecha_Creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    Borrado_Logico BOOLEAN DEFAULT FALSE -- Añadir campo de borrado lógico
);

-- Tabla de Animales
CREATE TABLE animales (
    ID_PERRO INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Tipo ENUM('perro', 'gato', 'hamster', 'otro') NOT NULL, -- Añadir campo tipo o familia
    Raza VARCHAR(100),
    Edad INT,
    Peso DECIMAL(5, 2), -- Añadir campo peso
    Sexo ENUM('M', 'F'),
    Estado VARCHAR(50), -- Ej: disponible, adoptado, en acogida
    Fecha_Ingreso DATETIME DEFAULT CURRENT_TIMESTAMP,
    Borrado_Logico BOOLEAN DEFAULT FALSE -- Añadir campo de borrado lógico
);

-- Tabla de Solicitudes
CREATE TABLE solicitudes_formularios (
    SOLICITUD_ID INT PRIMARY KEY AUTO_INCREMENT,
    USUARIO_ID INT,
    ANIMAL_ID INT, -- Cambiado de PERRO_ID a ANIMAL_ID para incluir más tipos de animales
    Fecha_Solicitud DATETIME DEFAULT CURRENT_TIMESTAMP,
    Estado VARCHAR(50), -- Ej: pendiente, aprobada, rechazada
    Tipo ENUM('Adopción', 'Acogida') NOT NULL,
    FOREIGN KEY (USUARIO_ID) REFERENCES usuarios(ID_USUARIO),
    FOREIGN KEY (ANIMAL_ID) REFERENCES animales(ID_PERRO),
    Borrado_Logico BOOLEAN DEFAULT FALSE -- Añadir campo de borrado lógico
);

-- Tabla de Donaciones
CREATE TABLE donaciones (
    ID_DONACION INT PRIMARY KEY AUTO_INCREMENT,
    USUARIO_ID INT,
    Monto DECIMAL(10, 2) NOT NULL,
    Fecha_Donacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (USUARIO_ID) REFERENCES usuarios(ID_USUARIO)
);
