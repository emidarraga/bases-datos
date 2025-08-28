# FUNCIONES DE ENCRITADO

# MD5 - genera un hash de 128 bits (32 caracteres hexadecimales) a partir de una cadena de texto
SELECT MD5('contraseña123');

# SHA1 - Es mas seguro que MD5
SELECT SHA1('superpassword123');

# SHA2 - Le puedo indicar el numero de bits - Este es el mas seguro
SELECT SHA2('superpassword123', 256);

# ASE_ENCRYPT
# Encriptacion
SELECT AES_ENCRYPT('superpassword123','llave_secreta');

# Desencriptar
SELECT AES_DECRYPT(nombre_campo,'llave_secreta');


# Practica
CREATE TABLE pagos_recurrentes(
	cuenta_id VARCHAR(8) PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    tarjeta BLOB
);

INSERT INTO pagos_recurrentes(cuenta_id, nombre, tarjeta) VALUES
  ('12345678', 'Jon', AES_ENCRYPT('1234567890123488', '12345678')),
  ('12345677', 'Irma', AES_ENCRYPT('1234567890123477', '12345677')),
  ('12345676', 'Kenai', AES_ENCRYPT('1234567890123466', '12345676')),
  ('12345674', 'Kala', AES_ENCRYPT('1234567890123455', 'super_llave')),
  ('12345673', 'Miguel', AES_ENCRYPT('1234567890123444', 'super_llave'));


SELECT * FROM pagos_recurrentes;
SELECT *,CONVERT( AES_DECRYPT(tarjeta, '12345678') USING utf8mb4) as desencriptado FROM pagos_recurrentes WHERE cuenta_id = '12345678' ;






