-- 5.2 Insercion de Datos (DML): Tienda de aplicaciones y juegos
-- Se insertan en orden de dependencia (primero las tablas sin FK)

INSERT INTO desarrollador (id_desarrollador, nombre, correo_contacto, sitio_web, pais)
VALUES
    ('DEV01', 'Andes Studio', 'contacto@andesstudio.ec', 'www.andesstudio.ec', 'Ecuador'),
    ('DEV02', 'Loja Soft', 'info@lojasoft.ec', 'www.lojasoft.ec', 'Ecuador'),
    ('DEV03', 'Pixel Norte', 'hola@pixelnorte.co', 'www.pixelnorte.co', 'Colombia'),
    ('DEV04', 'Cóndor Labs', 'soporte@condorlabs.pe', 'www.condorlabs.pe', 'Perú'),
    ('DEV05', 'Iberia Apps', 'contacto@iberiaapps.es', 'www.iberiaapps.es', 'España');

INSERT INTO categoria (id_categoria, nombre, descripcion)
VALUES
    ('CAT01', 'Acción', 'Juegos de acción y reflejos'),
    ('CAT02', 'Aventura', 'Juegos narrativos y de exploración'),
    ('CAT03', 'Educación', 'Aplicaciones para aprender y estudiar'),
    ('CAT04', 'Productividad', 'Herramientas de organización y trabajo'),
    ('CAT05', 'Utilidades', 'Herramientas de uso diario');

INSERT INTO usuario (id_usuario, nombre, correo, contrasena_hash, pais, fecha_registro)
VALUES
    ('USR01', 'Ana Mora', 'ana.mora@correo.com', 'hash_a1f3c9', 'Ecuador', '2025-01-20'),
    ('USR02', 'Luis Pérez', 'luis.perez@correo.com', 'hash_b72e10', 'Ecuador', '2025-03-14'),
    ('USR03', 'María Gómez', 'maria.gomez@correo.com', 'hash_c58d44', 'Colombia', '2025-05-02'),
    ('USR04', 'Carlos Ruiz', 'carlos.ruiz@correo.com', 'hash_d90a17', 'Perú', '2025-08-19'),
    ('USR05', 'Sofía Vega', 'sofia.vega@correo.com', 'hash_e31b86', 'España', '2026-01-08'),
    ('USR06', 'Diego Salinas', 'diego.salinas@correo.com', 'hash_f46c52', 'Ecuador', '2026-03-25');

INSERT INTO aplicacion
    (id_app, nombre, descripcion, precio, tamano_mb, clasificacion_edad,
     fecha_publicacion, id_desarrollador, id_categoria)
VALUES
    ('APP01', 'Aventura Andina', 'Acertijos en los Andes', 4.99, 320.50, '+7', '2025-03-10', 'DEV01', 'CAT02'),
    ('APP02', 'Carrera Veloz', 'Carreras arcade', 0.00, 210.00, 'Todos', '2025-06-18', 'DEV03', 'CAT01'),
    ('APP03', 'Guerreros del Sol', 'Combate por turnos', 2.99, 480.75, '+12', '2025-09-02', 'DEV04', 'CAT01'),
    ('APP04', 'Misterio en Loja', 'Novela de detectives', 3.49, 150.20, '+12', '2026-01-15', 'DEV02', 'CAT02'),
    ('APP05', 'Cóndor Runner', 'Corredor de montaña', 0.00, 95.30, 'Todos', '2026-04-22', 'DEV01', 'CAT01'),
    ('APP06', 'Tareas Pro', 'Gestor de tareas', 1.99, 25.40, 'Todos', '2025-02-05', 'DEV02', 'CAT04'),
    ('APP07', 'Estudia Fácil', 'Tarjetas de estudio', 0.00, 38.10, 'Todos', '2025-08-20', 'DEV05', 'CAT03'),
    ('APP08', 'Calculadora Científica', 'Funciones avanzadas', 0.99, 12.60, 'Todos', '2025-11-11', 'DEV03', 'CAT05'),
    ('APP09', 'Notas Seguras', 'Notas con contraseña', 2.49, 18.90, 'Todos', '2026-02-28', 'DEV04', 'CAT04'),
    ('APP10', 'Idiomas Rápido', 'Inglés y quichua', 0.00, 64.00, 'Todos', '2026-05-30', 'DEV05', 'CAT03');

-- Especializacion de aplicacion: cada app va en juego O en herramienta
INSERT INTO juego (id_app, genero, modo_multijugador, requiere_internet)
VALUES
    ('APP01', 'Puzles', FALSE, FALSE),
    ('APP02', 'Carreras', TRUE, TRUE),
    ('APP03', 'Estrategia', TRUE, TRUE),
    ('APP04', 'Misterio', FALSE, FALSE),
    ('APP05', 'Corredor infinito', FALSE, FALSE);

INSERT INTO herramienta (id_app, requiere_cuenta)
VALUES
    ('APP06', FALSE),
    ('APP07', TRUE),
    ('APP08', FALSE),
    ('APP09', TRUE),
    ('APP10', TRUE);

-- Entidad debil: la PK es (id_app, numero_version)
INSERT INTO version (id_app, numero_version, fecha_lanzamiento, notas_cambios)
VALUES
    ('APP01', '1.0.0', '2025-03-10', 'Lanzamiento inicial'),
    ('APP01', '1.1.0', '2025-07-01', 'Nuevos niveles y corrección de errores'),
    ('APP02', '1.0.0', '2025-06-18', 'Lanzamiento inicial'),
    ('APP02', '1.2.0', '2025-12-05', 'Modo multijugador en línea'),
    ('APP03', '1.0.0', '2025-09-02', 'Lanzamiento inicial'),
    ('APP04', '1.0.0', '2026-01-15', 'Lanzamiento inicial'),
    ('APP06', '1.0.0', '2025-02-05', 'Lanzamiento inicial'),
    ('APP06', '2.0.0', '2025-10-14', 'Rediseño de la interfaz y recordatorios'),
    ('APP07', '1.0.0', '2025-08-20', 'Lanzamiento inicial'),
    ('APP09', '1.0.0', '2026-02-28', 'Lanzamiento inicial');

-- El total de cada compra es la suma de su detalle
INSERT INTO compra (id_compra, fecha, total, metodo_pago, id_usuario)
VALUES
    ('CMP01', '2025-04-02', 6.98, 'Tarjeta', 'USR01'),
    ('CMP02', '2025-09-20', 2.99, 'PayPal', 'USR02'),
    ('CMP03', '2026-02-02', 4.48, 'Tarjeta', 'USR03'),
    ('CMP04', '2026-03-10', 7.48, 'Transferencia', 'USR04'),
    ('CMP05', '2026-04-05', 3.98, 'Tarjeta', 'USR01'),
    ('CMP06', '2026-05-12', 5.98, 'PayPal', 'USR05');

INSERT INTO detalle_compra (id_compra, id_app, precio_pagado)
VALUES
    ('CMP01', 'APP01', 4.99),
    ('CMP01', 'APP06', 1.99),
    ('CMP02', 'APP03', 2.99),
    ('CMP03', 'APP04', 3.49),
    ('CMP03', 'APP08', 0.99),
    ('CMP04', 'APP01', 4.99),
    ('CMP04', 'APP09', 2.49),
    ('CMP05', 'APP03', 2.99),
    ('CMP05', 'APP08', 0.99),
    ('CMP06', 'APP04', 3.49),
    ('CMP06', 'APP09', 2.49);

INSERT INTO descarga (id_descarga, id_usuario, id_app, fecha_descarga, dispositivo)
VALUES
    ('DES01', 'USR01', 'APP01', '2025-04-02', 'Samsung Galaxy A54'),
    ('DES02', 'USR01', 'APP06', '2025-04-02', 'Samsung Galaxy A54'),
    ('DES03', 'USR02', 'APP03', '2025-09-20', 'Xiaomi Redmi Note 12'),
    ('DES04', 'USR02', 'APP02', '2025-10-01', 'Xiaomi Redmi Note 12'),
    ('DES05', 'USR03', 'APP04', '2026-02-02', 'Motorola Edge 30'),
    ('DES06', 'USR03', 'APP02', '2026-02-03', 'Motorola Edge 30'),
    ('DES07', 'USR04', 'APP07', '2025-08-25', 'Huawei P40'),
    ('DES08', 'USR04', 'APP01', '2026-03-10', 'Huawei P40'),
    ('DES09', 'USR05', 'APP04', '2026-05-12', 'iPhone 13'),
    ('DES10', 'USR05', 'APP07', '2026-06-02', 'iPhone 13'),
    ('DES11', 'USR05', 'APP10', '2026-06-02', 'iPhone 13'),
    ('DES12', 'USR06', 'APP05', '2026-04-25', 'Samsung Galaxy A14'),
    ('DES13', 'USR06', 'APP02', '2026-04-26', 'Samsung Galaxy A14');

-- Una sola reseña por usuario y app (UNIQUE)
INSERT INTO resena (id_resena, id_usuario, id_app, calificacion, comentario, fecha_resena)
VALUES
    ('RES01', 'USR01', 'APP01', 5, 'Muy buenos acertijos', '2025-05-10'),
    ('RES02', 'USR01', 'APP06', 4, 'Útil para organizar tareas', '2025-05-12'),
    ('RES03', 'USR02', 'APP03', 4, 'Buena estrategia, algo lenta', '2025-10-05'),
    ('RES04', 'USR02', 'APP02', 3, 'Divertido, pero con fallos', '2025-10-20'),
    ('RES05', 'USR03', 'APP04', 5, 'Historia muy atrapante', '2026-02-20'),
    ('RES06', 'USR04', 'APP01', 4, 'Falta más contenido', '2026-04-01'),
    ('RES07', 'USR05', 'APP04', 2, 'Se cierra en mi equipo', '2026-05-20'),
    ('RES08', 'USR06', 'APP05', 5, 'Adictivo y gratuito', '2026-05-02'),
    ('RES09', 'USR06', 'APP02', 4, 'Muy buenos gráficos', '2026-05-05');

-- Verificacion rapida de cantidades
SELECT 'desarrollador' AS tabla, COUNT(*) AS filas FROM desarrollador
UNION ALL SELECT 'categoria', COUNT(*) FROM categoria
UNION ALL SELECT 'usuario', COUNT(*) FROM usuario
UNION ALL SELECT 'aplicacion', COUNT(*) FROM aplicacion
UNION ALL SELECT 'juego', COUNT(*) FROM juego
UNION ALL SELECT 'herramienta', COUNT(*) FROM herramienta
UNION ALL SELECT 'version', COUNT(*) FROM version
UNION ALL SELECT 'compra', COUNT(*) FROM compra
UNION ALL SELECT 'detalle_compra', COUNT(*) FROM detalle_compra
UNION ALL SELECT 'descarga', COUNT(*) FROM descarga
UNION ALL SELECT 'resena', COUNT(*) FROM resena;
