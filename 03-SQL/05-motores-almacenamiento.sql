# Aprendiendo sobre motores de almacenamiento
-- Esto solo se usa en versiones antiguas de mysql < 7.0 en versiones actuales no es necesario o en hostings compartidos
CREATE TABLE productos(
	producto_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    producto VARCHAR(20) NOT NULL,
    stock INT DEFAULT 0
) ENGINE=InnoDB;

# Codificacion de caracteres
CREATE TABLE productos(
	producto_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    producto VARCHAR(20) NOT NULL,
    stock INT DEFAULT 0
) DEFAULT CHARSET=utf8mb4; -- Mas utilizado es universal