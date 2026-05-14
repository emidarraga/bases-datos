# Diseño de Bases de Datos

1. Modelo conceptual - MER Modelo entidad relacion y DER Diagrama Entidad Relacion
2. Modelo Logico - MR Modelo relacional
3. Corrida de datos - Data Run
4. Modelo Fisico - Scripts en el SGBD
   
## Pasos a seguir:

1. Identificar las entidades del sistema.

2. Identificar los atributos de las entidades.

3. Identificar las llaves primarias y foráneas.

4. Asignar una nomenclatura adeacuada a las entidades y sus atributos.

5. Identificar las entidades pivote del sistema.

6. Identificar los catálogos del sistema.

7. Identificar los tipos de relaciones del sistema.

8. Crear el Modelo Entidad-Relación del sistema.

9. Crear el Modelo Relacional de la base de datos del sistema.

10. Identificar los tipos de dato de los atributos de las entidades el sistema.

11. Identificar los atributos que puedan ser únicos en el sistema.

12. Identificar las reglas de negocio (Operaciones CRUD) del sistema.


Habitualmente los nombres de las entidades van en plural y el de los atributos en singular

## Glosario

* **PK**: _Primary Key_
* **FK**: _Foreign Key_
* **UQ**: _Unique Attribute_
* **ED**: _Entidada de datos_
* **EC**: _Entidada Catalogo_
* **EP**: _Entidada pivote_




Biblioteca
Sistema para organizar sus prestamos de libros

Libros **ED**
- libro_id INT PRIMARY_KEY NOT NULL AUTO_INCREMENT UNSIGNED
- titulo VARCHAR(20) NOT NULL
- autor VARCHAR(20) NOT NULL
- anio_publicacion INT NOT NULL UNSIGNED
- catidad_disponible INT NOT NULL UNSIGNED


Usuarios **ED**
- usurio_id INT PRIMARY_KEY NOT NULL AUTO_INCREMENT
- nombre VARCHAR(20)
- apellido VARCHAR(20)
- correo VARCHAR(20) UNIQUE
- fecha_registro DATE

Prestamos **EP**
- usuario_id INT FOREIGN_KEY NOT NULL UNSIGNED
- libro_id INT FOREIGN_KEY NOT NULL UNSIGNED
- fecha_prestamo DATE
- fecha_devolucion DATE

Relaciones:

- Un libro puede estar prestado a muchos usuarios
- Un usuario pude tener prestados muchos libros

