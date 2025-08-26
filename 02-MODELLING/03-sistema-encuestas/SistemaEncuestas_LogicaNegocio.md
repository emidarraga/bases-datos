# Encuestas

## Listado de entidades

### encuestas **(ED)**
- encuesta_id **(PK)**
- nombre
- descripcion
- imagen
- fecha_creacion
- numero_encuestados

### preguntas **(ED)**
- pregunta_id **(PK)**
- encuesta_id **(FK)**
- pregunta

### respuestas **(ED)**
- respuesta_id **(PK)**
- pregunta_id **(FK)**
- respuesta
- es_correcta 

### encuestados **(ED)**
- encuestado_id **(PK)**
- nombres
- apellidos
- edad
- email

### encuestas_encuestados 
- encuesta_encuestado_id **(PK)**
- encuesta_id **(FK)**
- encuestado_id **(FK)**
- preguntas
- correctas


## Relaciones

- Una encuesta tiene muchas preguntas (1 a M)
- Una pregunta tiene muchas respuestas (1 a M)
- Una encuesta tiene muchos resultados (1 a M)
- Un encuestado tiene muchos resultados (1 a M)

<!-- 1:11:14 -->