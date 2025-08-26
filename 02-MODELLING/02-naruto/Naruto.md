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
- rango
- descripcion

### Aldeas **EC**
- aldea_id **( PK )**
- aldea
- estado
- pais_id **( FK )**

### Paises **EC**
- pais_id **( PK )**
- pais

### Armas **ED**
- arma_id **( PK )**
- arma
- tipo
- descripcion

### Bijus **EC**
- biju_id **( PK )**
- biju
- naturaleza_chakra_id **( FK )**

### kkekeigenkais **ED**
- kkekeigenkai_id **( PK )**
- kkekeigenkai
- estado
- clan_id **( FK )**

### Clanes **ED**
- clan_id **( PK )**
- clan
- estado
- aldea_id **( FK )**

### narutaleza_charkras **EC**
- narutaleza_charkra_id **( PK )**
- naturaleza
- descripcion

### Jutsus **ED**
- jutsu_id **( PK )**
- justu
- descripcion

### Elementos **ED**
- elemento_id **( PK )**
- elemento
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
