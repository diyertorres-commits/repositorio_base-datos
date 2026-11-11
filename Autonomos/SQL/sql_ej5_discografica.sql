-- Ejercicio 5: Empresa Discografica

CREATE TABLE manager (
    id_manager VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE artista (
    NIF VARCHAR(15) PRIMARY KEY,
    nombre_completo VARCHAR(150) NOT NULL,
    id_manager VARCHAR(15) NOT NULL,
    FOREIGN KEY (id_manager) REFERENCES manager(id_manager)
);

CREATE TABLE evento_promocion (
    id_evento VARCHAR(15) PRIMARY KEY,
    fecha DATE NOT NULL,
    n_asistentes INT NOT NULL
);

CREATE TABLE artista_evento (
    NIF VARCHAR(15) NOT NULL,
    id_evento VARCHAR(15) NOT NULL,
    PRIMARY KEY (NIF, id_evento),
    FOREIGN KEY (NIF) REFERENCES artista(NIF),
    FOREIGN KEY (id_evento) REFERENCES evento_promocion(id_evento)
);
