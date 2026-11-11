-- Ejercicio 2: Pedidos de Restaurante

CREATE TABLE cliente (
    id_cliente VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE mesero (
    id_mesero VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE categoria (
    id_categoria VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE plato (
    id_plato VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    id_categoria VARCHAR(15) NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

CREATE TABLE pedido (
    id_pedido VARCHAR(15) PRIMARY KEY,
    fecha DATE NOT NULL,
    id_cliente VARCHAR(15) NOT NULL,
    id_mesero VARCHAR(15) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_mesero) REFERENCES mesero(id_mesero)
);

CREATE TABLE detalle_pedido (
    id_pedido VARCHAR(15) NOT NULL,
    id_plato VARCHAR(15) NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_pedido, id_plato),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido),
    FOREIGN KEY (id_plato) REFERENCES plato(id_plato)
);
