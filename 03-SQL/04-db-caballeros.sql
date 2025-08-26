DROP TABLE IF EXISTS caballeros;
CREATE DATABASE IF NOT EXISTS caballeros;


CREATE TABLE armaduras(
	armadura_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    armadura VARCHAR(30) NOT NULL UNIQUE
);

INSERT INTO armaduras(armadura) VALUES
('Pegaso'),
('Dragón'),
('Cisne'),
('Andromeda'),
('Fénix'),
('Géminis'),
('Acuario'),
('Wyvern'),
('Dragón Marino'),
('Bennu');


CREATE TABLE rangos(
	rango_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    rango VARCHAR(30) NOT NULL UNIQUE
);

INSERT INTO rangos(rango) VALUES 
('Bronce'),
('Oro'),
('Espectro'),
('Marino');


CREATE TABLE signos(
	signo_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    signo VARCHAR(30) NOT NULL UNIQUE
);

INSERT INTO signos(signo) VALUES 
('Aries'),
('Taro'),
('Geminis'),
('Cancer'),
('Leo'),
('Virgo'),
('Libra'),
('Escorpion'),
('Sagitario'),
('Capricornio'),
('Acurario'),
('Piscis');


CREATE TABLE ejercitos(
	ejercito_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ejercito VARCHAR(30) NOT NULL UNIQUE
);

INSERT INTO ejercitos(ejercito) VALUES
('Athena'),
('Hades'),
('Poseidón');


CREATE TABLE pais(
	pais_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    pais VARCHAR(30) NOT NULL UNIQUE
);
INSERT INTO pais(pais) VALUES
('Japón'),
('Rusia'),
('Grecia'),
('Francia'),
('Inglaterra');


CREATE TABLE caballeros (
  caballero_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(30),
  armadura_id INT UNSIGNED,
  rango_id INT UNSIGNED,
  signo_id INT UNSIGNED,
  ejercito_id INT UNSIGNED,
  pais_id INT UNSIGNED,
  CONSTRAINT fk_caballeros_armadura_id FOREIGN KEY (armadura_id) REFERENCES armaduras(armadura_id),
  CONSTRAINT fk_caballeros_rango_id FOREIGN KEY (rango_id) REFERENCES rangos(rango_id),
  CONSTRAINT fk_caballeros_signo_id FOREIGN KEY (signo_id) REFERENCES signos(signo_id),
  CONSTRAINT fk_caballeros_ejercito_id FOREIGN KEY (ejercito_id) REFERENCES ejercitos(ejercito_id),
  CONSTRAINT fk_caballeros_pais FOREIGN KEY (pais_id) REFERENCES pais(pais_id)
);

INSERT INTO caballeros(nombre, armadura_id, rango_id, signo_id, ejercito_id, pais_id) VALUES
('Seiya',1,1,9,1,1),
('Shiryu',2,1,7,1,1),
('Hyoga',3,1,11,1,2),
('Shun',4,1,6,1,1),
('Ikki',5,1,5,1,1),
('Kanon',6,2,3,1,3),
('Saga',6,2,3,1,3),
('Camus',7,2,11,1,4),
('Rhadamanthys',8,3,8,2,5),
('Kanon',9,4,3,3,3),
('Kagaho',10,3,5,2,2);






