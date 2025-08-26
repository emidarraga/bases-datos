# Restricciones
-- 
CREATE DATABASE programacion;
USE programacion;


CREATE TABLE lenguajes(
	lenguaje_id INT UNSIGNED AUTO_INCREMENT,
    lenguaje VARCHAR(30) NOT NULL,
    CONSTRAINT PK_lenguaje PRIMARY KEY(lenguaje_id)
);

INSERT INTO lenguajes(lenguaje) VALUES
('JavaScript'),
('Python'),
('Java'),
('PHP'),
('Ruby');


CREATE TABLE entornos(
	entorno_id INT UNSIGNED AUTO_INCREMENT,
    entorno VARCHAR(30) NOT NULL,
    CONSTRAINT PK_entorno PRIMARY KEY(entorno_id)
);

INSERT INTO entornos(entorno) VALUES
('Frontend'),
('Backend');


CREATE TABLE frameworks(
	framework_id INT UNSIGNED AUTO_INCREMENT,
    framework VARCHAR(30) NOT NULL,
    lenguaje_id INT UNSIGNED,
    entorno_id INT UNSIGNED,
    CONSTRAINT PK_framework PRIMARY KEY(framework_id),
    CONSTRAINT FK_framework_lenguaje FOREIGN KEY(lenguaje_id) REFERENCES lenguajes(lenguaje_id) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT FK_framework_entorno FOREIGN KEY(entorno_id) REFERENCES entornos(entorno_id) ON DELETE RESTRICT ON UPDATE CASCADE
    
    #CONSTRAINT FK_framework_lenguaje FOREIGN KEY(lenguaje_id) REFERENCES lenguajes(lenguaje_id) ON DELETE SET NULL ON UPDATE CASCADE
);

INSERT INTO frameworks(framework, lenguaje_id, entorno_id) VALUES
('React',1,1),
('Angular',1,1),
('Svelt',1,1),
('Laravel',4,2),
('Flask',2,2),
('Django',2,2),
('Symphony',4,2),
('On rails',5,2),
('Spring boot',3,2);



SELECT * FROM lenguajes;
SELECT * FROM frameworks;
DELETE FROM lenguajes WHERE lenguaje_id = 5;

UPDATE lenguajes SET lenguaje_id = 10 WHERE lenguaje_id=5;
DELETE FROM lenguajes WHERE lenguaje_id = 1;





DROP TABLE frameworks;
DROP TABLE lenguajes;
DROP TABLE entornos;

