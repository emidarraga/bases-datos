# Biblioteca personal

## Listado de entidades

### libros **ED**
- libro_id **PK**
- titulo
- autor_id **FK**
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

### generos **EC**
- genero_id **PK**
- genero

### libros_generos **EP**
- libro_id **FK**
- genero_id **FK**

### editoriales **EC**
- editorial_id **PK**
- editorial

### paises **EC**
- pais_id **PK**
- pais

## Relaciones
* muchos libros fueron escritos por un autor
* un libro tiene uno o muchos generos
* un libro pertenece a una editorial
* un autor pertence a un pais