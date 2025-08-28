# Biblioteca personal - Personal Library

## Listado de entidades

### libros **ED**
- libro_id **PK**
- titulo
- publicacion
- numero_paginas
- editorial_id **FK**
- portada
- leido

### autores **ED**
- autor_id **PK**
- nombres
- apellidos
- pais_id **FK**

### autores_paises
- autor_id **PK** **FK**
- pais_id **PK** **FK**

### libros_autores **EP**
- libro_id **PK** **FK**
- autor_id **PK** **FK**

### generos **EC**
- genero_id **PK**
- genero

### libros_generos **EP**
- libro_id **PK** **FK**
- genero_id **PK** **FK**

### editoriales **EC**
- editorial_id **PK**
- editorial

### paises **EC**
- pais_id **PK**
- pais

## Relaciones
* uno o muchos libros fueros escritor por uno o muchos autores
* un libro tiene uno o muchos generos
* un libro pertenece a una o muchas editoriale
* un autor pertence a un pais

### Reglas de negocio

#### Libros
- Un libro debe tener minimo un genero
- El campo leido debe ser 0 o 1
- Todo libro debe tener un titulo
- El numero de paginas debe ser mayor a 0

#### autores
- el autor debe pertinecer a un pais valido

#### libros_autores
- Un libro de tener al menos un autor
- Un autor puede haber escrito uno o mas libros
- Un mismo autor no puede estar repetido en el mismo libro

#### generos
- Los generos no pueden estar repetidos deben ser unicos

#### libros_generos
- Un libro debe al menos un genero  

#### editoriales
- Cada editorial debe ser unica

### paises
- Los pasise deben ser unicos
- Todo pais debe tener un codigo de 3 letras