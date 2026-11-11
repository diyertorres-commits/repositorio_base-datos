-- Ejercicio 8: Camiones

CREATE TABLE camionero (
    cedula VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    poblacion VARCHAR(80) NOT NULL
);

CREATE TABLE provincia (
    codigo_provincia VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE camion (
    matricula VARCHAR(15) PRIMARY KEY,
    modelo VARCHAR(50) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    potencia INT NOT NULL
);

CREATE TABLE paquete (
    codigo_paquete VARCHAR(15) PRIMARY KEY,
    descripcion VARCHAR(200) NOT NULL,
    destinatario VARCHAR(100) NOT NULL,
    direccion_destinatario VARCHAR(150) NOT NULL,
    cedula VARCHAR(15) NOT NULL,
    codigo_provincia VARCHAR(15) NOT NULL,
    FOREIGN KEY (cedula) REFERENCES camionero(cedula),
    FOREIGN KEY (codigo_provincia) REFERENCES provincia(codigo_provincia)
);

CREATE TABLE conduce (
    cedula VARCHAR(15) NOT NULL,
    matricula VARCHAR(15) NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY (cedula, matricula, fecha),
    FOREIGN KEY (cedula) REFERENCES camionero(cedula),
    FOREIGN KEY (matricula) REFERENCES camion(matricula)
);
