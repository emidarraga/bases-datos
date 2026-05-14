# Proyecto: Plataforma de Cursos Online


## Modelo entidad relacion

### usuarios - **ED**
- usuario_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
- nombre VARCHAR(50) NOT NULL
- apellido VARCHAR(50) NOT NULL
- email varchar(100) UNIQUE NOT NULL
- fecha_registro DATE NOT NULL

### cursos - **ED**
- curso_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
- titulo VARCHAR(50) NOT NULL
- descripcion TEXT NOT NULL
- nivel VARCHAR(20) NOT NULL
- precio DECIMAL(10,2)
- profesor_id FOREIGN KEY

### profesores - **ED**
- profesor_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
- nombre VARCHAR(50) NOT NULL
- apellido VARCHAR(50) NOT NULL
- email varchar(20) UNIQUE NOT NULL

### pagos - **ED**
- pago_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
- curso_id INT NOT NULL
- usuario_id INT NOT NULL
- fecha_pago DATETIME NOT NULL
- monto DECIMAL(10,2) NOT NULL

### usuarios_cursos - **EP**
- usuario_id INT NOT NULL 
- curso_id INT NOT NULL
