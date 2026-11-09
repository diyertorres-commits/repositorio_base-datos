-- Ejercicio 3: Clinica Medica

CREATE TABLE paciente (
    id_paciente VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE especialidad (
    id_especialidad VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE medico (
    id_medico VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_especialidad VARCHAR(15) NOT NULL,
    FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad)
);

CREATE TABLE medicamento (
    id_medicamento VARCHAR(15) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE cita (
    id_cita VARCHAR(15) PRIMARY KEY,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    consultorio VARCHAR(20) NOT NULL,
    id_paciente VARCHAR(15) NOT NULL,
    id_medico VARCHAR(15) NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
);

CREATE TABLE receta (
    id_receta VARCHAR(15) PRIMARY KEY,
    id_cita VARCHAR(15) NOT NULL UNIQUE,
    FOREIGN KEY (id_cita) REFERENCES cita(id_cita)
);

CREATE TABLE receta_medicamento (
    id_receta VARCHAR(15) NOT NULL,
    id_medicamento VARCHAR(15) NOT NULL,
    dosis VARCHAR(50) NOT NULL,
    duracion VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_receta, id_medicamento),
    FOREIGN KEY (id_receta) REFERENCES receta(id_receta),
    FOREIGN KEY (id_medicamento) REFERENCES medicamento(id_medicamento)
);
