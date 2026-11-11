-- Ejercicio 4: Sistema de Aerolinea

CREATE TABLE avion (
    matricula VARCHAR(15) PRIMARY KEY,
    modelo VARCHAR(50) NOT NULL
);

CREATE TABLE pasajero (
    id_pasajero VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE vuelo (
    numero VARCHAR(15) PRIMARY KEY,
    fecha DATE NOT NULL,
    origen VARCHAR(60) NOT NULL,
    destino VARCHAR(60) NOT NULL,
    matricula VARCHAR(15) NOT NULL,
    FOREIGN KEY (matricula) REFERENCES avion(matricula)
);

CREATE TABLE reserva (
    id_reserva VARCHAR(15) PRIMARY KEY,
    asiento VARCHAR(5) NOT NULL,
    tarifa_pagada DECIMAL(10,2) NOT NULL,
    numero_vuelo VARCHAR(15) NOT NULL,
    id_pasajero VARCHAR(15) NOT NULL,
    FOREIGN KEY (numero_vuelo) REFERENCES vuelo(numero),
    FOREIGN KEY (id_pasajero) REFERENCES pasajero(id_pasajero)
);
