SHOW DATABASES;
CREATE DATABASE curso_sql;
CREATE DATABASE IF NOT EXISTS curso_sql;

DROP DATABASE curso_sql;	
DROP DATABASE IF EXISTS curso_sql;

-- Crear un usuario en el sistema [esto desde el usuario root]
CREATE USER 'esteban'@'localhost' IDENTIFIED BY 'qwerty'; -- Password

-- Ver todos lo usuarios del sistema
SELECT * FROM mysql.user;

-- Asignando privelegios a un usuario
-- Permisos especificos
GRANT INSERT, UPDATE, DELETE ON curso_sql.* TO 'esteban'@'localhost'; 

-- El asterisco representa las tablas
-- Todos los permisos
GRANT ALL PRIVILEGES ON curso_sql.* TO 'esteban'@'localhost';

-- Para acutalizar los persmisos o la lista de privilegios
FLUSH PRIVILEGES;


-- Ver los permisos o privilegios de un usuario
SHOW GRANTS FOR 'esteban'@'localhost'; 


-- Eliminar permisos
REVOKE ALL, GRANT OPTION FROM 'esteban'@'localhost';

-- Eliminar usuario
DROP USER 'esteban'@'localhost';



-- ########################################################################
USE curso_sql; -- Selecciono la DB en la que voy a trabajar
SHOW TABLES;

-- TABLAS
-- Creacion
CREATE TABLE usuarios(
	usuario_id INT NOT NULL AUTO_INCREMENT primary KEY,
    nombre VARCHAR(50) NOT NULL,
    correo VARCHAR(50) NOT NULL
);

-- Describe la estructura de una tabla
DESCRIBE usuarios;

-- Modificando una tabla
-- Agregar un campo
ALTER TABLE usuarios ADD COLUMN apellido varchar(50) not null;
ALTER TABLE usuarios ADD COLUMN cumpleanios varchar(15);

-- Modificando un campo
ALTER TABLE usuarios MODIFY COLUMN cumpleanios DATE NOT NULL;
ALTER TABLE usuarios RENAME COLUMN cumpleanios TO nacimiento; -- Cambio el nombre del campo

-- Eliminar una column
ALTER TABLE usuarios DROP COLUMN nacimiento;


-- Eliminar una tabla
DROP TABLE usuarios;

CREATE TABLE usuarios(
	usuario_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    correo VARCHAR(50) NOT NULL UNIQUE,
    direccion VARCHAR(100) DEFAULT "SIN DIRECCION",
    edad INT DEFAULT 0
);

-- CURD
-- Crear
INSERT INTO usuarios(nombres, apellidos, correo, edad) VALUES ('naruto','usumaki','n.uzumaki@gmail.com', 25);
INSERT INTO usuarios(nombres, apellidos, correo, edad) VALUES 
('sasuke','uchiha', 'sasuke@hotmail.com', 24),
('sakura', 'haruno', 'sakuharuno@gmail.com', 25);


-- LEER
SELECT * FROM usuarios;
SELECT nombres, edad FROM usuarios;

SELECT COUNT(*) AS total_usuarios FROM usuarios; -- Alias(Nombre del campo resultado)
SELECT * FROM usuarios WHERE nombres = 'naruto'; -- Clausula where
SELECT * FROM usuarios WHERE usuario_id IN (1,2); -- Por un grupo de valores

-- Operador LIKE
SELECT * FROM usuarios WHERE nombres LIKE 's%'; -- Que inicie con algo especifico
SELECT * FROM usuarios WHERE correo LIKE '%@gmail.com'; -- Que termine con algo especifico
SELECT * FROM usuarios WHERE email LIKE '%a%'; -- Que en cualquier parte tenga

-- Operador NOT LIKE
SELECT * FROM usuarios WHERE nombres NOT LIKE 's%'; 
SELECT * FROM usuarios WHERE correo NOT LIKE '%@gmail.com'; 
SELECT * FROM usuarios WHERE email NOT LIKE '%a%';

-- Actualizar
UPDATE usuarios SET direccion = 'Aldea de la hoja #15-78' WHERE usuario_id = 1;
UPDATE usuarios SET direccion = 'Aldea del sonido #96-25' WHERE usuario_id = 2;

UPDATE usuarios SET direccion = 'Aldea de la hoja #36-98' WHERE usuario_id = 3;
UPDATE usuarios SET direccion = 'Aldea de la hoja #66-121', edad = 23 WHERE usuario_id = 13;

-- Eliminar
DELETE FROM usuarios WHERE usuario_id = 4;


-- Operadores relacionales
/*
>
<
>=
<=
<> / !=
*/
SELECT * FROM usuarios WHERE edad >= 25;
SELECT * FROM usuarios WHERE edad < 25;
SELECT * FROM usuarios WHERE nombres != 'sasuke';



-- Operadores Logicos
-- AND OR NOT
SELECT * FROM usuarios WHERE NOT direccion = 'SIN DIRECCION';
SELECT * FROM usuarios WHERE nombres = 'naruto' AND apellidos = 'usumaki';
SELECT * FROM usuarios WHERE nombres = 'sasuke' OR edad > 20;

-- Eliminar y reiniciar todos los registros de una tabla
-- El TRUNCATE tambien elimina el cache del auto_increment del id - Empiza a contar de nuevo desde 1
TRUNCATE TABLE usuarios;
