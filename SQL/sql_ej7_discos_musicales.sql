-- Ejercicio 7: Discos Musicales

CREATE TABLE genero_musical (
    id_genero VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE cantante (
    id_cantante VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(60) NOT NULL
);

CREATE TABLE cancion (
    id_cancion VARCHAR(15) PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL
);

CREATE TABLE disco (
    id_disco VARCHAR(15) PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    id_genero VARCHAR(15) NOT NULL,
    id_cantante VARCHAR(15) NOT NULL,
    FOREIGN KEY (id_genero) REFERENCES genero_musical(id_genero),
    FOREIGN KEY (id_cantante) REFERENCES cantante(id_cantante)
);

CREATE TABLE disco_cancion (
    id_disco VARCHAR(15) NOT NULL,
    id_cancion VARCHAR(15) NOT NULL,
    posicion INT NOT NULL,
    PRIMARY KEY (id_disco, id_cancion),
    FOREIGN KEY (id_disco) REFERENCES disco(id_disco),
    FOREIGN KEY (id_cancion) REFERENCES cancion(id_cancion)
);
