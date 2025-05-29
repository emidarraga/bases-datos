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
1. Campos unicos
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