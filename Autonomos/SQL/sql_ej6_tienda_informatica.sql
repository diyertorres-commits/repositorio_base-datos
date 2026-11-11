-- Ejercicio 6: Tienda Informatica

CREATE TABLE cliente (
    codigo VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    telefono VARCHAR(15) NOT NULL
);

CREATE TABLE producto (
    codigo VARCHAR(15) PRIMARY KEY,
    descripcion VARCHAR(200) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    existencias INT NOT NULL
);

CREATE TABLE proveedor (
    codigo VARCHAR(15) PRIMARY KEY,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    provincia VARCHAR(60) NOT NULL,
    telefono VARCHAR(15) NOT NULL
);

CREATE TABLE compra (
    codigo_cliente VARCHAR(15) NOT NULL,
    codigo_producto VARCHAR(15) NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY (codigo_cliente, codigo_producto, fecha),
    FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo),
    FOREIGN KEY (codigo_producto) REFERENCES producto(codigo)
);

CREATE TABLE suministra (
    codigo_proveedor VARCHAR(15) NOT NULL,
    codigo_producto VARCHAR(15) NOT NULL,
    PRIMARY KEY (codigo_proveedor, codigo_producto),
    FOREIGN KEY (codigo_proveedor) REFERENCES proveedor(codigo),
    FOREIGN KEY (codigo_producto) REFERENCES producto(codigo)
);
