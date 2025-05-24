# Modelado de Bases de Datos - Naruto

## Entidades

### Ninjas **ED**
- ninja_id **( PK )**
- nombre
- estado
- aldea_id **( FK )**
- clan_id **( FK )**
- naturaleza_chakra_id **( FK )**
- rango_id **( FK )**

### Rangos **EC**
- rango_id **( PK )**
- nombre
- descripcion

### Aldeas **EC**
- aldea_id **( PK )**
- pais_id **( FK )**
- nombre
- estado

### Paises **EC**
- pais_id **( PK )**
- nombre

### Armas **ED**
- arma_id **( PK )**
- nombre
- tipo
- descripcion

### Bijus **EC**
- biju_id **( PK )**
- nombre
- naturaleza_chakra_id **( FK )**

### kkekeigenkais **ED**
- kkekeigenkai_id **( PK )**
- nombre
- estado
- clan_id **( FK )**

### Clanes **ED**
- clan_id **( PK )**
- aldea_id **( FK )**
- nombre
- estado

### narutaleza_charkras **EC**
- narutaleza_charkra_id **( PK )**
- nombre
- descripcion

### Jutsus **ED**
- jutsu_id **( PK )**
- nombre
- descripcion

### Elementos **ED**
- elemento_id **( PK )**
- nombre
- descripcion

## Relaciones

### Ninjas

* Un ninja tiene un rango (1 a 1)
* Un ninja pertenece a una aldea (1 a 1)
* Un ninja pertenece a un clan (1 a 1)
* un nija posee una o varias naturalezas del chakra (1 a n)

### Aldeas

* Una aldea pertenece a un pais (1 a 1)

### Bijus

* Un biju tiene una o varias narutalezas de chakra (1 a n)

### kkekeigenkais

* Un kekkeigenkai pertenece a un clan (1 a 1)

### Clanes

* Un clan pertenece a una aldea (1 a 1)
