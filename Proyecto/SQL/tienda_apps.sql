-- Proyecto: Tienda de aplicaciones y juegos

CREATE TABLE desarrollador (
    id_desarrollador VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo_contacto VARCHAR(100) NOT NULL,
    sitio_web VARCHAR(150),
    pais VARCHAR(50) NOT NULL
);

CREATE TABLE categoria (
    id_categoria VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

CREATE TABLE usuario (
    id_usuario VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    contrasena_hash VARCHAR(255) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    fecha_registro DATE NOT NULL
);

CREATE TABLE aplicacion (
    id_app VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(500),
    precio DECIMAL(8,2) NOT NULL,
    tamano_mb DECIMAL(10,2) NOT NULL,
    clasificacion_edad VARCHAR(10) NOT NULL,
    fecha_publicacion DATE NOT NULL,
    id_desarrollador VARCHAR(15) NOT NULL,
    id_categoria VARCHAR(15) NOT NULL,
    FOREIGN KEY (id_desarrollador) REFERENCES desarrollador(id_desarrollador),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE juego (
    id_app VARCHAR(15) PRIMARY KEY,
    genero VARCHAR(50) NOT NULL,
    modo_multijugador BOOLEAN NOT NULL,
    requiere_internet BOOLEAN NOT NULL,
    FOREIGN KEY (id_app) REFERENCES aplicacion(id_app)
);

CREATE TABLE herramienta (
    id_app VARCHAR(15) PRIMARY KEY,
    requiere_cuenta BOOLEAN NOT NULL,
    FOREIGN KEY (id_app) REFERENCES aplicacion(id_app)
);

CREATE TABLE version (
    id_app VARCHAR(15),
    numero_version VARCHAR(20),
    fecha_lanzamiento DATE NOT NULL,
    notas_cambios VARCHAR(500),
    PRIMARY KEY (id_app, numero_version),
    FOREIGN KEY (id_app) REFERENCES aplicacion(id_app)
);

CREATE TABLE compra (
    id_compra VARCHAR(15) PRIMARY KEY,
    fecha DATE NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    metodo_pago VARCHAR(30) NOT NULL,
    id_usuario VARCHAR(15) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE detalle_compra (
    id_compra VARCHAR(15),
    id_app VARCHAR(15),
    precio_pagado DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (id_compra, id_app),
    FOREIGN KEY (id_compra) REFERENCES compra(id_compra),
    FOREIGN KEY (id_app) REFERENCES aplicacion(id_app)
);

CREATE TABLE descarga (
    id_descarga VARCHAR(15) PRIMARY KEY,
    id_usuario VARCHAR(15) NOT NULL,
    id_app VARCHAR(15) NOT NULL,
    fecha_descarga DATE NOT NULL,
    dispositivo VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_app) REFERENCES aplicacion(id_app)
);

CREATE TABLE resena (
    id_resena VARCHAR(15) PRIMARY KEY,
    id_usuario VARCHAR(15) NOT NULL,
    id_app VARCHAR(15) NOT NULL,
    calificacion INT NOT NULL CHECK (calificacion BETWEEN 1 AND 5),
    comentario VARCHAR(500),
    fecha_resena DATE NOT NULL,
    UNIQUE (id_usuario, id_app),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_app) REFERENCES aplicacion(id_app)
);
