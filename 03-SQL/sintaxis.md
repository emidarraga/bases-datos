# Sintaxis SQL

Comentarios: 

```sql
-- Este es un comentario de una linea

/*
Es es un comentario
de varias
lineas
*/

```

Buenas Practicas:

* Comandos y palabras reservadas de SQL van en MAYUSCULAS
* Nombres de objetos y datos van en minusculas con snake_case
* Para stings usar comillas simples
* Siempre poner el (;) al final de una sentencia

## Sentencias

1. `SHOW DATABASES;` Mostrar todas la bases de datos del gestor
1. `CREATE DATABASE curso_sql;` Crear una DB
1. `CREATE DATABASE IF NOT EXISTS curso_sql;` Crear una DB si no existe
1. `DROP DATABASE curso_sql;` Eliminar una DB
1. `DROP DATABASE IF EXISTS curso_sql;` Eliminar una DB si existe

## Usuarios y permisos

```SQL
-- Crear un usuario en el sistema [esto desde el usuario root]
CREATE USER 'esteban'@'localhost' IDENTIFIED BY 'qwerty';

-- Ver todos lo usuarios
SELECT * FROM mysql.user;

-- Asignando privelegios a un usuario
-- El asterisco representa las tablas
GRANT ALL PRIVILEGES ON curso_sql.* TO 'esteban'@'localhost';

-- Para acutalizar los persmisos o la lista de privilegios
FLUSH PRIVILEGES;


-- Ver los permisos o privilegios de un usuario
SHOW GRANTS FOR 'esteban'@'localhost'; 


-- Eliminar permisos
REVOKE ALL, GRANT OPTION FROM 'esteban'@'localhost';

-- Eliminar usuario
DROP USER 'esteban'@'localhost';

```


## Creacion de tablas

```sql
CREATE TABLE usuarios(
	usuario_id INT UNSIGNED AUTO_INCREMENT primary KEY,
    nombre VARCHAR(50) NOT NULL,
    correo VARCHAR(50) NOT NULL
);
```
UNSIGNED significa que no tenga simobolos + / -

---

Formas de declarar un campo como `PRIMARY KEY`:

* Directamente al crear el campo

```sql
CREATE TABLE usuarios(
	usuario_id INT NOT NULL AUTO_INCREMENT primary KEY,
    nombre VARCHAR(50) NOT NULL,
    correo VARCHAR(50) NOT NULL
);
```

* Despues de haber creado el campo

```sql
CREATE TABLE usuarios(
	usuario_id INT UNSIGNED AUTO_INCREMENT,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    CONSTRAINT pk_usuario PRIMARY KEY(usuario_id)
);
```

## Indices

Un índice es una estructura de datos que la base de datos usa para buscar información rápidamente, sin tener que recorrer toda la tabla

Hay 3 prinicpales tipos de indices:

1. Llaves primarias
1. Campos unicos UNIQUE
1. Indices que yo pueda crear

```sql
-- ver los indices de una tabla
SHOW INDEX FROM usuarios;
```

Agregando un indice al crear la tabla:

```sql
CREATE TABLE caballeros (
  caballero_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30),
  armadura VARCHAR(30) UNIQUE,
  rango VARCHAR(30),
  signo VARCHAR(30),
  ejercito VARCHAR(30),
  pais VARCHAR(30),
  INDEX i_rango (rango), # Por convencion debe iniciar con i_ seguido del campo al que hace referencia
  INDEX i_signo (signo)
);

```

Definiendo un indice de varios campos:

```sql
INDEX i_caballeros (ejercito, pais)
```

Indice de tipo full text consume mas recursos:

```sql
CREATE TABLE caballeros (
  caballero_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30),
  armadura VARCHAR(30),
  rango VARCHAR(30),
  signo VARCHAR(30),
  ejercito VARCHAR(30),
  pais VARCHAR(30),
  FULLTEXT INDEX fi_search(armadura, rango, signo, ejercito, pais)
);
```

## Joins

Un JOIN es una cláusula SQL que te permite combinar filas de dos o más tablas relacionadas entre sí, usando una columna en común (como una clave primaria y una clave foránea).

Principales :

1. INNER JOIN
1. LEFT JOIN
1. RIGHT JOIN
1. FULL OUTER

## Subconsultas

Consultas dentro de consultas

```sql
SELECT S.signo,
(
	SELECT COUNT(*) FROM caballeros C WHERE S.signo_id = C.signo_id
) AS conteo 
FROM signos S;

```

## Vistas

Es una consulta que gurada los datos de una consulta de manera virtual, para hacer consultas mas rapidas

```sql
CREATE VIEW vista_signos_caballeros AS
SELECT signo,
(
	SELECT COUNT(*) FROM caballeros C WHERE C.signo_id = S.signo_id
) as conteo
FROM signos S;


-- llamar la vista
SELECT * FROM vista_caballeros;
```

-- Elilminar la vista
DROP VIEW IF EXISTS vista_caballeros;


## Motores de Almacenamiento

Un motor de tablas o tambien conocido como motor de almacenamiento es el componente del SGDB que se encagan de como almacenar y manipular los datos de la DB, son los responsables de como se guardan los datos en el disco duro

### InnoDB
Es el motor de almacenamiento principal de MySQL, es el encargado de como se guardan y manejan los datos dentro de una tabla.

### MyISAM
Es otro de los motores de almacenamiento que usa MySQL. 


## Restricciones

Hay cuatro acciones que podemos realizar en el UPDATE y DELETE,

* CASCADE

Elimina y actualiza automaticamente los registros relacionados

* SET NULL

Actualiza el valor a un valor null

* SET DEFAULT

Actualiza el valor a un valor definido

* RESTRICT

Evita la eliminacion o actualizacion del registro en la tabla relacionada hasta que no se elimine el registro en la tabla principal


Estas restricciones se definen a la hora de crear la tabla y se hace en la tabla en la que se hace referencia, por ende simpre va donde se define la llave foranea.

```SQL
CREATE TABLE frameworks(
	framework_id INT UNSIGNED AUTO_INCREMENT,
    framework VARCHAR(30) NOT NULL,
    lenguaje_id INT UNSIGNED,
    CONSTRAINT PK_framework PRIMARY KEY(framework_id),
    CONSTRAINT FK_framework_lenguaje FOREIGN KEY(lenguaje_id) REFERENCES lenguajes(lenguaje_id) ON DELETE RESTRICT ON UPDATE CASCADE
);
```

## Transacciones

Son un conjunto de operaciones que se ejecutan como una unidad logica. Es decir, o se complentan todas correctamente, o no se ejecuta ninguna, esto garantiza la integridad de los datos, especialmente cuando se hace multiples cambios relacionados. 

```sql
START TRANSACTION;
	UPDATE frameworks SET framework="AngularJS" WHERE framework_id = 2;
	DELETE FROM frameworks;
	INSERT INTO frameworks(framework,lenguaje_id,entorno_id) VALUES('.NET',1,1);

ROLLBACK;
COMMIT;

```