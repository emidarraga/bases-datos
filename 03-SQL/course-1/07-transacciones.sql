# TRANSACCIONES

USE programacion;
SELECT * FROM frameworks LIMIT 0,2;
SELECT * FROM entornos;


START TRANSACTION;
	UPDATE frameworks SET framework="AngularJS" WHERE framework_id = 2;
	DELETE FROM frameworks;
	INSERT INTO frameworks(framework,lenguaje_id,entorno_id) VALUES('.NET',1,1);

ROLLBACK;
COMMIT;
