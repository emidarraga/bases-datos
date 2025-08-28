USE curso_sql;

DROP TABLE caballeros;
TRUNCATE TABLE caballeros;

CREATE TABLE caballeros (
  caballero_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30),
  armadura VARCHAR(30) UNIQUE,
  rango VARCHAR(30),
  signo VARCHAR(30),
  ejercito VARCHAR(30),
  pais VARCHAR(30),
  INDEX i_signo(signo),
  INDEX i_caballeros (ejercito, pais)
);

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

INSERT INTO caballeros VALUES
  (0,"Seiya","Pegaso",,"Sagitario","Athena","Japón"),
  (0,"Shiryu","Dragón",,"Libra","Athena","Japón"),
  (0,"Hyoga","Cisne",,"Acuario","Athena","Rusia"),
  (0,"Shun","Andromeda",,"Virgo","Athena","Japón"),
  (0,"Ikki","Fénix",,"Leo","Athena","Japón"),
  (0,"Kanon","Géminis",,"Géminis","Athena","Grecia"),
  (0,"Saga","Junini",,"Junini","Athena","Grecia"),
  (0,"Camus","Acuario",,"Acuario","Athena","Francia"),
  (0,"Rhadamanthys","Wyvern",,"Escorpión","Hades","Inglaterra"),
  (0,"Kanon","Dragón Marino","Marino","Géminis","Poseidón","Grecia"),
  (0,"Kagaho","Bennu",,"Leo","Hades","Rusia");
  
SELECT * FROM caballeros;
SHOW INDEX FROM caballeros;


# Esta consulta que busca coincidencias es varios campos
# Solo funciona en columnas que tengan indice fulltext 
SELECT * FROM caballeros WHERE 
	MATCH(armadura,rango, signo, ejercito, pais) 
    AGAINST('Oro' IN BOOLEAN MODE) ;
    
UPDATE caballeros SET signo = 'Escorpion Oro', nombre = 'Espectro' WHERE caballero_id = 9;

# ------------------------------------------------------------------------------------------------------------------------------------------------
# Agrendado indices a una tabla ya creada
/*
En esta seccion estoy usando el alter para agregar la pk, el auto_increment y indices es una tabla ya creada
*/
CREATE TABLE caballeros (
  caballero_id INT UNSIGNED,
  nombre VARCHAR(30),
  armadura VARCHAR(30),
  rango VARCHAR(30),
  signo VARCHAR(30),
  ejercito VARCHAR(30),
  pais VARCHAR(30)
);

INSERT INTO caballeros VALUES
  (0,"Seiya","Pegaso",,"Sagitario","Athena","Japón"),
  (0,"Shiryu","Dragón",,"Libra","Athena","Japón"),
  (0,"Hyoga","Cisne",,"Acuario","Athena","Rusia"),
  (0,"Shun","Andromeda",,"Virgo","Athena","Japón"),
  (0,"Ikki","Fénix",,"Leo","Athena","Japón"),
  (0,"Kanon","Géminis",,"Géminis","Athena","Grecia"),
  (0,"Saga","Junini",,"Junini","Athena","Grecia"),
  (0,"Camus","Acuario",,"Acuario","Athena","Francia"),
  (0,"Rhadamanthys","Wyvern",,"Escorpión","Hades","Inglaterra"),
  (0,"Kanon","Dragón Marino","Marino","Géminis","Poseidón","Grecia"),
  (0,"Kagaho","Bennu",,"Leo","Hades","Rusia");


DESCRIBE caballeros;

ALTER TABLE caballeros ADD CONSTRAINT pk_caballero_id PRIMARY KEY(caballero_id);
ALTER TABLE caballeros DROP CONSTRAINT pk_caballero_id; # No es buena practica eliminar la pk (no hacerlo NUNCA JAMAS)

ALTER TABLE caballeros ADD CONSTRAINT uq_armadura UNIQUE(armadura);
ALTER TABLE caballeros DROP CONSTRAINT uq_armadura;

ALTER TABLE caballeros MODIFY COLUMN caballero_id INT AUTO_INCREMENT;


-- Agregando un indice
ALTER TABLE caballeros ADD INDEX i_rango (rango);
ALTER TABLE caballeros ADD INDEX idx_ejercito_pais(ejercito, pais);

ALTER TABLE caballeros ADD FULLTEXT INDEX fi_search(nombre,signo);

-- Eliminar un indice
-- Forma 1
ALTER TABLE caballeros DROP INDEX fi_search;

-- Forma 2 Directa
DROP INDEX armadura ON caballeros;




SHOW INDEX FROM caballeros;
SELECT * FROM caballeros;


