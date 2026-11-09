# Portafolio de Base de Datos

Repositorio con los ejercicios de modelado de bases de datos desarrollados en la asignatura de **Base de Datos**: diagramas **Entidad-Relación** y sus **scripts SQL** correspondientes.

**Autor:** Diyer Arley Torres Troya
**Carrera:** Computación
**Universidad:** Universidad Nacional de Loja (UNL), Loja, Ecuador

---

## Contenido

| N.º | Ejercicio | Diagrama ER | Script SQL | Conceptos aplicados |
|----|-----------|-------------|------------|---------------------|
| 1 | Sistema de biblioteca | [ej1_biblioteca.drawio](drawio/ej1_biblioteca.drawio) | [sql_ej1_biblioteca.sql](SQL/sql_ej1_biblioteca.sql) | Relaciones N:M con atributos (préstamo) |
| 2 | Pedidos de restaurante | [ej2_restaurante.drawio](drawio/ej2_restaurante.drawio) | [sql_ej2_restaurante.sql](SQL/sql_ej2_restaurante.sql) | N:M con precio unitario y cantidad |
| 3 | Clínica médica | [ej3_clinica_medica.drawio](drawio/ej3_clinica_medica.drawio) | [sql_ej3_clinica_medica.sql](SQL/sql_ej3_clinica_medica.sql) | Cardinalidad 0,1 (receta), N:M con dosis y duración |
| 4 | Sistema de aerolínea | [ej4_aerolinea.drawio](drawio/ej4_aerolinea.drawio) | [sql_ej4_aerolinea.sql](SQL/sql_ej4_aerolinea.sql) | Relaciones 1:N encadenadas |
| 5 | Empresa discográfica | [ej5_discografica.drawio](drawio/ej5_discografica.drawio) | [sql_ej5_discografica.sql](SQL/sql_ej5_discografica.sql) | 1:N y N:M |
| 6 | Tienda informática | [ej6_tienda_informatica.drawio](drawio/ej6_tienda_informatica.drawio) | [sql_ej6_tienda_informatica.sql](SQL/sql_ej6_tienda_informatica.sql) | Dos relaciones N:M (compra y suministro) |
| 7 | Discos musicales | [ej7_discos_musicales.drawio](drawio/ej7_discos_musicales.drawio) | [sql_ej7_discos_musicales.sql](SQL/sql_ej7_discos_musicales.sql) | N:M con posición de la canción |
| 8 | Camiones | [ej8_camiones.drawio](drawio/ej8_camiones.drawio) | [sql_ej8_camiones.sql](SQL/sql_ej8_camiones.sql) | N:M con fecha (conduce) |
| 9 | Veterinaria | [ej9_veterinaria.drawio](drawio/ej9_veterinaria.drawio) | [sql_ej9_veterinaria.sql](SQL/sql_ej9_veterinaria.sql) | Especialización, entidad débil, atributo multivaluado |

---

## Estructura del repositorio

```
repositorio_base_datos/
├── drawio/    Diagramas Entidad-Relación (.drawio)
│   ├── ej1_biblioteca.drawio
│   ├── ...
│   └── ej9_veterinaria.drawio
├── SQL/       Scripts de creación de tablas (.sql)
│   ├── EJER1.sql
│   ├── sql_ej1_biblioteca.sql
│   ├── ...
│   └── sql_ej9_veterinaria.sql
└── README.md
```

---

## Notación utilizada

### Diagramas Entidad-Relación (notación de Chen)

- **Rectángulo:** entidad. El **doble rectángulo** indica una entidad débil.
- **Rombo:** relación. El **doble rombo** indica una relación identificadora.
- **Óvalo:** atributo. El **texto subrayado** indica la clave. El **doble óvalo** indica un atributo multivaluado.
- **Triángulo ISA:** especialización (generalización).
- **Cardinalidades:** el valor junto a una entidad indica cuántas instancias de esa entidad se asocian con una instancia de la otra (`1`, `N`, `M`, `0,1`, `1,N`, `0,N`).

### Scripts SQL

- Las claves primarias de una sola columna se declaran en la misma línea, por ejemplo `id_socio VARCHAR(15) PRIMARY KEY`.
- Las claves primarias compuestas se declaran al final de la tabla con `PRIMARY KEY (columna1, columna2)`.
- Las relaciones entre tablas se definen con `FOREIGN KEY (columna) REFERENCES tabla(clave)`.
- Los atributos son `NOT NULL`, salvo cuando el enunciado permite que no tengan valor.
- Las relaciones **N:M** se resuelven con una **tabla intermedia** que lleva las claves de ambas entidades y los atributos propios de la relación.

---

## Cómo usar los archivos

### Abrir los diagramas

1. Entra a [app.diagrams.net](https://app.diagrams.net/) (draw.io) o abre la aplicación de escritorio.
2. Selecciona **Abrir archivo existente** y elige un archivo `.drawio` de la carpeta `drawio/`.

### Ejecutar los scripts

1. Crea una base de datos para el ejercicio en tu gestor relacional.
2. Ejecuta el archivo `.sql` correspondiente de la carpeta `SQL/`.

> **Nota:** algunos nombres de tabla se repiten entre ejercicios (por ejemplo, `cliente`). Conviene ejecutar cada script en una base de datos distinta.
