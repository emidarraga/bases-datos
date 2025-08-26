USE curso_sql;

CREATE TABLE usuarios(
	  usuario_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombres VARCHAR(30) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    correo VARCHAR(50) UNIQUE,
    edad INT DEFAULT 0
);

INSERT INTO usuarios(nombres, apellidos, correo, edad) values
('naruto', 'usumaki','usumaki@gmail.com', 26),
('kakashi', 'hatake','khatake@hotmail.com', 35),
('sakura', 'haruno','saku@outlook.es', 25),
('sasuke', 'uchiha','clanuchiha@yahoo.com', 25),
('Jirayja', 'nosepunto','jiraya@gmail.com', 38);

CREATE TABLE productos(
    producto_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(50),
    precio DECIMAL(7,2) NOT NULL,
    cantidad INT UNSIGNED
);

INSERT INTO productos(nombre, descripcion, precio, cantidad) values 
("computadora", "macbook air m2", 29999.99, 5),
("celular", "nothing phone 1", 11999.99, 15),
("camara web", "logitech c920", 1500, 13),
("microfono", "blue yeti", 2500, 19),
("audífonos", "audífonos bose", 6500, 10);


SELECT * FROM usuarios;
SELECT * FROM productos;

# Funciones matematicas
-- Operaciones aritmeticas
# suma(+)  resta(-) multiplicacion(*)  divicion(/)  modulo(%) MOD(4,2)


SELECT 4 % 2;

-- Redondeo
-- Siempre hacia arriba
SELECT CEILING(18.2);

-- Siempre hacia abajo
SELECT FLOOR(15.9);

-- desde .5 hacia arriba
-- desde .4 hacia abajo
SELECT ROUND(3.5);

-- Potencia
SELECT POWER(4,3);

-- Raiz
SELECT SQRT(81);

SELECT nombre, precio, cantidad, (precio * cantidad) as ganancia FROM productos;



# Funciones de agregado
SELECT MAX(PRECIO) AS precio_maximo FROM productos;
SELECT MIN(PRECIO) AS precio_minimo FROM productos;

SELECT SUM(cantidad) AS stock_total FROM productos;

SELECT AVG(precio) AS precio_promedio FROM productos;

SELECT nombre, MAX(PRECIO) AS precio_maximo FROM productos GROUP BY nombre; 

CREATE TABLE caballeros (
  caballero_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30),
  armadura VARCHAR(30),
  rango VARCHAR(30),
  signo VARCHAR(30),
  ejercito VARCHAR(30),
  pais VARCHAR(30)
);

INSERT INTO caballeros VALUES
  (0,"Seiya","Pegaso","Bronce","Sagitario","Athena","Japón"),
  (0,"Shiryu","Dragón","Bronce","Libra","Athena","Japón"),
  (0,"Hyoga","Cisne","Bronce","Acuario","Athena","Rusia"),
  (0,"Shun","Andromeda","Bronce","Virgo","Athena","Japón"),
  (0,"Ikki","Fénix","Bronce","Leo","Athena","Japón"),
  (0,"Kanon","Géminis","Oro","Géminis","Athena","Grecia"),
  (0,"Saga","Géminis","Oro","Géminis","Athena","Grecia"),
  (0,"Camus","Acuario","Oro","Acuario","Athena","Francia"),
  (0,"Rhadamanthys","Wyvern","Espectro","Escorpión","Hades","Inglaterra"),
  (0,"Kanon","Dragón Marino","Marino","Géminis","Poseidón","Grecia"),
  (0,"Kagaho","Bennu","Espectro","Leo","Hades","Rusia");


SELECT * FROM caballeros;


# Practica GROUP BY
SELECT signo, COUNT(*) AS veces FROM caballeros GROUP BY signo;
SELECT pais, COUNT(*) AS veces FROM caballeros GROUP BY pais;
SELECT rango, COUNT(*) AS total FROM caballeros GROUP BY rango;
SELECT ejercito, COUNT(*) AS total FROM caballeros GROUP BY ejercito;

-- HAVING
-- Filtra los resultados de un group by. Funciona como un where pero para grupos en lugar de filas individuales
SELECT rango, COUNT(*) AS total FROM caballeros GROUP BY rango HAVING total > 3;

-- DISTINC
-- Elimina los valores repetidos en una consulta, devuelve solo valores unicos
SELECT DISTINCT signo FROM caballeros; 	
SELECT DISTINCT rango FROM caballeros;
SELECT DISTINCT pais FROM caballeros;

-- ORDER BY
-- Orderna los registros de una consulta
-- Siempre debe ir al final de la query
SELECT * FROM caballeros ORDER BY nombre;
SELECT * FROM caballeros ORDER BY nombre DESC;

SELECT * FROM caballeros ORDER BY nombre, signo ASC;


SELECT * FROM productos WHERE precio BETWEEN 5000 AND 15000;

SELECT * FROM productos WHERE nombre REGEXP "[a-z]";
SELECT * FROM productos WHERE precio REGEXP "[0-9]";


SELECT LOWER('Hola Mundo !!') AS TEST;
SELECT UPPER('Hola Mundo !!') AS TEST;

SELECT nombres, LEFT(nombres,1) as inicial FROM usuarios;
SELECT LEFT('Hola Mundoo',4);

SELECT LENGTH('hola mundo');
SELECT REPEAT('HOLA ',3);

SELECT REVERSE('esteban');

SELECT REPLACE('hola mundo', 'o', 'X');

SELECT LTRIM('    Hola mundo');
SELECT RTRIM('Hola mundo    ');
SELECT TRIM('  Hola mundo    ');

SELECT CONCAT('h', 'o', 'l','a');

-- primera va el seprador
SELECT CONCAT_WS('-','hola','mundo','desde','SQL');


# ---------------------------------------------
# Indices
# Los indices son  una estructura que se crea en una o mas columnas  de una tabla para acelerar las consultas
# Demaciados indices pueden afectar el rendmiento

-- Ver los indices de una tabla
SHOW INDEX FROM caballeros;
SHOW INDEX FROM usuarios;

