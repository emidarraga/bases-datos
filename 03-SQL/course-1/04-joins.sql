USE curso_sql;
DESCRIBE caballeros;

SELECT * FROM caballeros;
SELECT * FROM armaduras;
SELECT * FROM ejercitos;
SELECT * FROM pais;
SELECT * FROM rangos;
SELECT * FROM signos;


-- INNER JOIN
SELECT C.caballero_id, C.nombre, AR.armadura FROM caballeros C 
JOIN armaduras AR 
ON AR.armadura_id = C.armadura_id 
ORDER BY C.caballero_id;

-- LEFT JOIN
SELECT * FROM caballeros C 
LEFT JOIN signos SG
ON SG.signo_id = C.signo_id;

-- RIGHT JOIN
SELECT * FROM caballeros C 
RIGHT JOIN signos S 
ON C.signo_id = S.signo_id
ORDER BY C.caballero_id;


-- UNION ALL
-- mysql no soporta el full join asi que se simula con el left y el right join
SELECT * FROM caballeros C 
LEFT JOIN signos SG
ON SG.signo_id = C.signo_id
UNION 
SELECT * FROM caballeros C 
RIGHT JOIN signos SG
ON SG.signo_id = C.signo_id;

# Ejercicios
SELECT C.caballero_id, C.nombre, AR.armadura, RA.rango, SG.signo, EJ.ejercito, PA.pais FROM caballeros C
INNER JOIN armaduras AR
ON C.armadura_id = AR.armadura_id
INNER JOIN rangos RA
ON C.rango_id = RA.rango_id
INNER JOIN signos SG
ON C.signo_id = SG.signo_id
INNER JOIN ejercitos EJ
ON C.ejercito_id = EJ.ejercito_id
INNER JOIN pais PA
ON C.pais_id = PA.pais_id;



# Subconsultas
# Consulta dentro de otra

SELECT S.signo,
(
	SELECT COUNT(*) FROM caballeros C WHERE S.signo_id = C.signo_id
) AS conteo 
FROM signos S;


SELECT P.pais,
(
	SELECT COUNT(*) FROM caballeros C WHERE C.pais_id = P.pais_id
) AS conteo 
FROM pais P
ORDER BY conteo;


SELECT E.ejercito,
(
	SELECT COUNT(*) FROM caballeros C WHERE C.ejercito_id = E.ejercito_id
) as conteo
FROM ejercitos E;


# Vistas

-- Vista 1
CREATE VIEW vista_caballeros AS
SELECT C.caballero_id, C.nombre, AR.armadura, RA.rango, SG.signo, EJ.ejercito, PA.pais FROM caballeros C
INNER JOIN armaduras AR
ON C.armadura_id = AR.armadura_id
INNER JOIN rangos RA
ON C.rango_id = RA.rango_id
INNER JOIN signos SG
ON C.signo_id = SG.signo_id
INNER JOIN ejercitos EJ
ON C.ejercito_id = EJ.ejercito_id
INNER JOIN pais PA
ON C.pais_id = PA.pais_id;

-- Vista 2
CREATE VIEW vista_signos_caballeros AS
SELECT signo,
(
	SELECT COUNT(*) FROM caballeros C WHERE C.signo_id = S.signo_id
) as conteo
FROM signos S;


-- Llamarla 
SELECT * FROM vista_caballeros;

-- Eliminarla
DROP VIEW vista_caballeros;

-- Ver las vistas de la DB
SHOW FULL TABLES IN curso_sql WHERE TABLE_TYPE LIKE 'VIEW';
	




