-- Ejercicio 9: Veterinaria

CREATE TABLE propietario (
    cedula VARCHAR(15) PRIMARY KEY,
    apellidos VARCHAR(100) NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    direccion VARCHAR(150) NOT NULL
);

CREATE TABLE telefono_propietario (
    cedula VARCHAR(15) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    PRIMARY KEY (cedula, telefono),
    FOREIGN KEY (cedula) REFERENCES propietario(cedula) ON DELETE CASCADE
);

CREATE TABLE familiar (
    cedula_propietario VARCHAR(15) PRIMARY KEY,
    cedula_familiar VARCHAR(15) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    FOREIGN KEY (cedula_propietario) REFERENCES propietario(cedula) ON DELETE CASCADE
);

CREATE TABLE mascota (
    id_mascota VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    cedula_propietario VARCHAR(15) NOT NULL,
    FOREIGN KEY (cedula_propietario) REFERENCES propietario(cedula)
);

CREATE TABLE personal (
    codigo VARCHAR(15) PRIMARY KEY,
    cedula VARCHAR(15) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE veterinario (
    codigo VARCHAR(15) PRIMARY KEY,
    fecha_alta DATE NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    FOREIGN KEY (codigo) REFERENCES personal(codigo)
);

CREATE TABLE auxiliar (
    codigo VARCHAR(15) PRIMARY KEY,
    base_cotizacion DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (codigo) REFERENCES personal(codigo)
);

CREATE TABLE consulta (
    id_mascota VARCHAR(15) NOT NULL,
    codigo_veterinario VARCHAR(15) NOT NULL,
    fecha DATE NOT NULL,
    diagnostico VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_mascota, codigo_veterinario, fecha),
    FOREIGN KEY (id_mascota) REFERENCES mascota(id_mascota),
    FOREIGN KEY (codigo_veterinario) REFERENCES veterinario(codigo)
);
