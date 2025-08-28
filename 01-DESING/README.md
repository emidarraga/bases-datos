# Diseño de Bases de Datos
**¿Que es una Base de Datos?**

Una base de datos es un conjunto organizadado de infomracion o datos que se almancenan y gestionan de forma estructurada en un sistema. Su objetivo es acceder, conultar, modificar y administrar esa informacion de manera eficiente


## Bases de datos relacionales
Es un tipo de base de datos que organiza la informacion en tablas, donde cada tabla esta compuesta por columna(atributos) y filas(registros) estos pueden o no hacer referencia a otro campo de otra tabla.


## Entidades
Es la representacion de un objeto del mundo real


### Tipos de entidades
* Entidades de datos
* Entidades Catalogo
* Entidades Pivote / Asociacion / Enlace


## Reglas de negocio
Son normas que determinan como deben manejarse los datos y aseguran que el sistema respete la logica del mundo real. No son reglas tecnicas sino reglas funcionales que definen lo que es valido o no en un modelo de datos.

**Ejemplo: DB para una tienda en linea**
* Un cliente no puede hacer un pedido sino tiene una direccion registrada
* No se puede vender un producto si no hay suficiente inventario disponible
* El campo "correo electronico" de ser unico para cada usuario

**Se pueden aplicar en varios niveles:**

* Bases de datos:
    * Restricciones(check, unique, foreign key)

* Aplicacion:
    * Validacion en el codigo antes de enviar datos a la base de datos

* Interfaz de usuario
    * Formularios que no permitan dejar campos vacios, o que filtran opciones

**Son importantes por:**
* Mantienen la integridad de los datos
* Evitan errores logicos y problemas en los procesos de negocio
* Ayudan a que la base de datos refleje correctamente el modelo real del sistema

### Logica de Negocio
Conjunto de reglas, politicas y procedimientos que definen como se usan y manipulan los datos para cumplir con los objetivos de una aplicacion o sistema

* Reglas de validacion
* Restricciones
* Procedimientos de almacenado y triggers


## Normalizacion

### 1FN Primera forma normal
Cada atributo de una entidad debe contener un solo valor atomico, es decir los valores deben ser indivisibles no puden ser divididos en atributos mas pequeños


### 2FN Segunda forma normal
Ademas de cumplir la primer forma normal, cada atributo no dependiente funcionalemente de la llave principal debe estar en una entidad separada


### 3FN Tercer forma normal
Ademas de cumplir la primer y segunda forma normal, Todas las dependencias funcionales deben ser eliminadas, es decir no debe de existir dependencias funcionales transitorias


### 4FN Cuarta forma normal - Boyce Codd
Requiere que cada dependencia funcional sea una clave candidata unica


### 5FN Quinta forma normal - Dominio - Clave
Se garantiza que no haya dependencias multiples de conjuntos de entidades

## Modelado
Es el proceso de representar la informacion y sus relacioenes antes de ser implementada en en SGBD

### Modelo Conceptual (MER)
* Modelo entidad relacion
* Descripcion conceptual de las entidades, atributos y relaciones
* Es la parte mas abstracta: se definen las entidades, atributos y relaciones sin pensar todavia en motor de bases de datos

#### Diagrama Entidad Relacion
El DER es cuando grafico o dibujo apartir del modelo conceptual MER las entidades, atributos y relaciones 

### Modelo Logico (MR)
* Aqui se transforma el MER en un modelo relacional
* Se pasan las entidades y relaciones a tablas, columnas, llaves primarias y foraneas
* Aqui ya aparecen las dependencias funcionales y la normalizacion

### Modelo Fisico
* Es el diseño ya pensado para un SGBD especifico(MySQL, PostreSQL, SQL Server ...)
* Se crean los scripts que crean las tablas