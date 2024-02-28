DROP DATABASE IF EXISTS EduRicssrdoManage;

CREATE DATABASE EduRicssrdoManage;

USE EduRicssrdoManage;

CREATE TABLE tb_profesores(
id_profesor CHAR(15) PRIMARY KEY DEFAULT (UUID()),
nombre VARCHAR(100), 	 	
apellido VARCHAR(100),
correo_electronico VARCHAR(100) UNIQUE
);

DELIMITER $

CREATE PROCEDURE insertar_profesores (in nombre VARCHAR(100), IN apellido VARCHAR(100), correo_electronico VARCHAR(100))
BEGIN
INSERT INTO tb_profesores (nombre,apellido,correo_electronico) VALUES (nombre,apellido,correo_electronico);

END$

CALL insertar_profesores ('Ricardo','De_Leon', 'Ricardo@gmail.com')
CALL insertar_profesores('Luis', 'Ortega', 'luis.ortega@example.com')
CALL insertar_profesores('Mario', 'Castro', 'mario.castro@example.com')
CALL insertar_profesores('Isabel', 'Ortiz', 'isabel.ortiz@example.com')
CALL insertar_profesores('Antonio', 'Fernandez', 'antonio.fernandez@example.com')
CALL insertar_profesores('Raquel', 'Ramos', 'raquel.ramos@example.com')
CALL insertar_profesores('Pablo', 'Mendez', 'pablo.mendez@example.com')
CALL insertar_profesores('Silvia', 'Cabrera', 'silvia.cabrera@example.com')
CALL insertar_profesores('Adrian', 'Guerra', 'adrian.guerra@example.com')
CALL insertar_profesores('Natalia', 'Perez', 'natalia.perez@example.com')
CALL insertar_profesores('Julio', 'Gonzalez', 'julio.gonzalez@example.com')
CALL insertar_profesores('Carolina', 'Delgado', 'carolina.delgado@example.com')
CALL insertar_profesores('Daniel', 'Serrano', 'daniel.serrano@example.com')
CALL insertar_profesores('Marta', 'Luna', 'marta.luna@example.com')
CALL insertar_profesores('Roberto', 'Mora', 'roberto.mora@example.com')

SELECT*FROM tb_profesores


CREATE TABLE tb_materias(
id_materia CHAR(15) PRIMARY KEY DEFAULT (UUID()),
nombre_materia VARCHAR(100),
grupo_materia INT,
id_profesor CHAR(15),
cupos INT,
FOREIGN KEY (id_profesor) REFERENCES tb_profesores(id_profesor)
);

DELIMITER $

CREATE PROCEDURE insertar_materia (in nombre_materia VARCHAR(100), IN grupo_materia INT, cupos INT)
BEGIN
INSERT INTO tb_materias (nombre_materia,grupo_materia,cupos) VALUES (nombre_materia,grupo_materia,cupos);

END$

CALL insertar_materia ('Matemáticas', 1, 30)
CALL insertar_materia('Física', 2, 25)
CALL insertar_materia('Química', 1, 30)
CALL insertar_materia('Historia', 3, 20)
CALL insertar_materia('Literatura', 2,25)
CALL insertar_materia('Inglés', 1,0)
CALL insertar_materia('Biología', 3, 20)
CALL insertar_materia('Geografía', 2,25)
CALL insertar_materia('Arte', 1,30)
CALL insertar_materia('Música', 3, 10)
CALL insertar_materia('Educación Física', 2, 5)
CALL insertar_materia('Informática', 1, 30)
CALL insertar_materia('Economía', 3, 20)
CALL insertar_materia('Filosofía', 2, 25)
CALL insertar_materia('Ciencias Sociales', 1, 30);

SELECT*FROM tb_materias


CREATE TABLE tb_alumnos(
id_alumno CHAR(15) PRIMARY KEY DEFAULT (UUID()),
carnet_alumno VARCHAR(10) UNIQUE,
nombre_alumno VARCHAR(50),
apellido_alumno VARCHAR(50),
edad_alumno INT
);
DELIMITER $

CREATE PROCEDURE insertar_alumnos (in carnet_alumno VARCHAR(10), IN nombre_alumno VARCHAR(50), apellido_alumno VARCHAR(50) ,edad_alumno INT)
BEGIN
INSERT INTO tb_alumnos (carnet_alumno,nombre_alumno,apellido_alumno,edad_alumno) VALUES (carnet_alumno,nombre_alumno,apellido_alumno,edad_alumno);

END$

CALL insertar_alumnos('202300001', 'Juan', 'Perez', 18)
CALL insertar_alumnos('202300002', 'Maria', 'Garcia', 19)
CALL insertar_alumnos'202300003', 'Pedro', 'Lopez', 20)
CALL insertar_alumnos('202300004', 'Ana', 'Martinez', 21)
CALL insertar_alumnos('202300005', 'Carlos', 'Rodriguez', 22)
CALL insertar_alumnos('202300006', 'Laura', 'Sanchez', 23)
CALL insertar_alumnos('202300007', 'Diego', 'Hernandez', 24)
CALL insertar_alumnos('202300008', 'Sofia', 'Gomez', 25)
CALL insertar_alumnos('202300009', 'Alejandro', 'Torres', 26)
CALL insertar_alumnos('202300010', 'Lucia', 'Diaz', 27)
CALL insertar_alumnos('202300011', 'Javier', 'Ruiz', 28)
CALL insertar_alumnos('202300012', 'Elena', 'Jimenez', 29)
CALL insertar_alumnos('202300013', 'Manuel', 'Vargas', 30)
CALL insertar_alumnos('202300014', 'Carmen', 'Navarro', 31)
CALL insertar_alumnos('202300015', 'Raul', 'Molina', 32);

SELECT*FROM tb_alumnos

CREATE TABLE tb_inscripciones(
id_inscripcion CHAR(15) PRIMARY KEY DEFAULT (UUID()),
id_alumno CHAR(15),
id_materia CHAR (15),
fecha_inscripcion DATE,
estado ENUM ('Activo', 'Inactivo'),
FOREIGN KEY (id_alumno) REFERENCES tb_alumnos(id_alumno)
);

DELIMITER $

CREATE PROCEDURE insertar_inscripciones (in id_alumno  CHAR(15), IN id_materia CHAR(15), fecha_inscripcion DATE ,estado ENUM ('Activo', 'Inactivo'))
BEGIN
INSERT INTO tb_inscripciones (id_materia,fecha_inscripcion,estado) VALUES (id_materia,fecha_inscripcion,estado);

END$

CALL insertar_inscripciones ( 1, 1, '2024-02-28', 'Activo')
CALL insertar_inscripciones ( 2, 2, '2024-02-28', 'Activo')
CALL insertar_inscripciones( 3, 3, '2024-02-28', 'Inactivo')
CALL insertar_inscripciones( 4, 4, '2024-02-28', 'Activo')
CALL insertar_inscripciones( 5, 5, '2024-02-28', 'Inactivo')
CALL insertar_inscripciones( 6, 6, '2024-02-28', 'Activo')
CALL insertar_inscripciones( 7, 7, '2024-02-28', 'Activo')
CALL insertar_inscripciones( 8, 8, '2024-02-28', 'Inactivo')
CALL insertar_inscripciones( 9, 9, '2024-02-28', 'Activo')
CALL insertar_inscripciones( 10, 10, '2024-02-28', 'Activo')
CALL insertar_inscripciones( 11, 11, '2024-02-28', 'Inactivo')
CALL insertar_inscripciones( 12, 12, '2024-02-28', 'Activo')
CALL insertar_inscripciones( 13, 13, '2024-02-28', 'Activo')
CALL insertar_inscripciones( 14, 14, '2024-02-28', 'Inactivo')
CALL insertar_inscripciones( 15, 15, '2024-02-28', 'Activo');

SELECT*FROM tb_inscripciones



CREATE TABLE tb_calificaciones(
id_calificacion CHAR(15) PRIMARY KEY DEFAULT (UUID()),
id_inscripcion CHAR(15),
calificacion_final DECIMAL(5,2),
fecha_calificacion DATE,
FOREIGN KEY (id_inscripcion) REFERENCES tb_inscripciones(id_inscripcion)
);

DELIMITER $

CREATE PROCEDURE insertar_calificaciones (IN calificacion_final DECIMAL(5,2), fecha_calificacion DATE)
BEGIN
INSERT INTO tb_calificaciones (calificacion_final,fecha_calificacion) VALUES (calificacion_final,fecha_calificacion);

END$

CALL insertar_calificaciones (85.50, '2024-02-28')
CALL insertar_calificaciones(77.25, '2024-02-28')
CALL insertar_calificaciones(90.00, '2024-02-28')
CALL insertar_calificaciones(65.75, '2024-02-28')
CALL insertar_calificaciones(88.00, '2024-02-28')
CALL insertar_calificaciones(79.50, '2024-02-28')
CALL insertar_calificaciones(92.75, '2024-02-28')
CALL insertar_calificaciones(70.25, '2024-02-28')
CALL insertar_calificaciones(84.00, '2024-02-28')
CALL insertar_calificaciones(76.75, '2024-02-28')
CALL insertar_calificaciones(89.50, '2024-02-28')
CALL insertar_calificaciones(73.25, '2024-02-28')
CALL insertar_calificaciones(91.00, '2024-02-28')
CALL insertar_calificaciones(82.50, '2024-02-28')
CALL insertar_calificaciones(88.25, '2024-02-28')

SELECT*FROM tb_calificaciones


[11:49] REBECA PATRICIA MÓNICO ALFARO
DELIMITER //
 
CREATE TRIGGER actualizar_cupos_despues_inscripcion

AFTER INSERT ON tb_inscripciones

FOR EACH ROW

BEGIN

    DECLARE cupos_ocupados INT;

    -- Obtener la cantidad de cupos ocupados para la materia de la inscripción --

    SELECT COUNT(*) INTO cupos_ocupados FROM tb_inscripciones WHERE id_materia = NEW.id_materia AND estado = 'Activo';

    -- Actualizar los cupos disponibles en la tabla tb_materias --

    UPDATE tb_materias

    SET cupos = (SELECT cupos - cupos_ocupados FROM tb_materias WHERE id_materia = NEW.id_materia)

    WHERE id_materia = NEW.id_materia;

END;

//
 
DELIMITER ;


