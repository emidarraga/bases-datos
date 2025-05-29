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
  (0,"Seiya","Pegaso","Bronce","Sagitario","Athena","Japón"),
  (0,"Shiryu","Dragón","Bronce","Libra","Athena","Japón"),
  (0,"Hyoga","Cisne","Bronce","Acuario","Athena","Rusia"),
  (0,"Shun","Andromeda","Bronce","Virgo","Athena","Japón"),
  (0,"Ikki","Fénix","Bronce","Leo","Athena","Japón"),
  (0,"Kanon","Géminis","Oro","Géminis","Athena","Grecia"),
  (0,"Saga","Junini","Oro","Junini","Athena","Grecia"),
  (0,"Camus","Acuario","Oro","Acuario","Athena","Francia"),
  (0,"Rhadamanthys","Wyvern","Espectro","Escorpión","Hades","Inglaterra"),
  (0,"Kanon","Dragón Marino","Marino","Géminis","Poseidón","Grecia"),
  (0,"Kagaho","Bennu","Espectro","Leo","Hades","Rusia");
  
SELECT * FROM caballeros;
SHOW INDEX FROM caballeros;


# Esta consulta busca coincidencias es varios campos
SELECT * FROM caballeros WHERE 
	MATCH(armadura,rango, signo, ejercito, pais) 
    AGAINST('Oro' IN BOOLEAN MODE) ;
    
UPDATE caballeros set signo = 'Escorpion Oro', nombre = 'Espectro' WHERE caballero_id = 9;


