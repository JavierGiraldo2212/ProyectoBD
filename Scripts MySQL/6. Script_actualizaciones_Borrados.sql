USE Proyecto_BD;

-- -----------------------------------------------------
-- Creación del historial para egresado
-- -----------------------------------------------------

-- Creacion de la tabla de historial
DROP TABLE IF EXISTS Proyecto_BD.historial_egresado;
CREATE TABLE Proyecto_BD.historial_egresado (
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50),
    id INT PRIMARY KEY AUTO_INCREMENT,
    cedula INT,
    facultad_id_eliminada INT DEFAULT NULL,
    facultad_id_insertada INT DEFAULT NULL,
    fecha_nacimiento_eliminada DATE DEFAULT NULL,
    fecha_nacimiento_insertada DATE DEFAULT NULL,
    nombre_eliminada VARCHAR(50)DEFAULT NULL,
    nombre_insertada VARCHAR(50) DEFAULT NULL,
    primer_apellido_eliminada VARCHAR(20) DEFAULT NULL,
    primer_apellido_insertada VARCHAR(20) DEFAULT NULL,
    segundo_apellido_eliminada VARCHAR(20) DEFAULT NULL,
    segundo_apellido_insertada VARCHAR(20) DEFAULT NULL,
    direccion_eliminada VARCHAR(50) DEFAULT NULL,
    direccion_insertada VARCHAR(50) DEFAULT NULL,
    ciudad_eliminada VARCHAR(30) DEFAULT NULL,
    ciudad_insertada VARCHAR(30)DEFAULT NULL,
    pais_eliminada VARCHAR(30) DEFAULT NULL,
    pais_insertada VARCHAR(30) DEFAULT NULL,
    correo_electronico_eliminada VARCHAR(50) DEFAULT NULL,
    correo_electronico_insertada VARCHAR(50) DEFAULT NULL,
    contrasenia_eliminada VARCHAR(20) DEFAULT NULL,
    contrasenia_insertada VARCHAR(20) DEFAULT NULL,
    genero_eliminada VARCHAR(2) DEFAULT NULL,
    genero_insertada VARCHAR(2) DEFAULT NULL,
    grupo_etnico_eliminada VARCHAR(50) DEFAULT NULL,
    grupo_etnico_insertada VARCHAR(50)  DEFAULT NULL,
    equipo_id_eliminada INT DEFAULT NULL,
    equipo_id_insertada INT DEFAULT NULL

);

-- Trigger Insert para egresado

DROP TRIGGER IF EXISTS egresado_insert;

DELIMITER $$

CREATE TRIGGER egresado_insert
AFTER INSERT ON Proyecto_BD.EGRESADO
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_egresado (
        fecha_cambio, accion, cedula, facultad_id_insertada, fecha_nacimiento_insertada, 
        nombre_insertada, primer_apellido_insertada, segundo_apellido_insertada, direccion_insertada,
        ciudad_insertada, pais_insertada, correo_electronico_insertada, contrasenia_insertada, genero_insertada, grupo_etnico_insertada, equipo_id_insertada
        
    )
    VALUES (
        NOW(), 'INSERT',NEW.Cedula, NEW.FACULTAD_idFACULTAD, NEW.FechaNacimiento, 
        NEW.Nombre, NEW.PrimerApellido, NEW.SegundoApellido, NEW.Direccion,
        NEW.Ciudad, NEW.Pais, NEW.CorreoElectronico, NEW.Contrasenia, NEW.Genero, NEW.GrupoEtnico, NEW.EQUIPO_ID
        
    );
END $$

DELIMITER ;

-- Trigger update para egresado

DROP TRIGGER IF EXISTS egresado_update;

DELIMITER $$

CREATE TRIGGER egresado_update
AFTER UPDATE ON Proyecto_BD.EGRESADO
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_egresado (
        fecha_cambio, accion, cedula, facultad_id_eliminada, facultad_id_insertada, 
        fecha_nacimiento_eliminada, fecha_nacimiento_insertada,  
        nombre_eliminada, nombre_insertada,
        primer_apellido_eliminada, primer_apellido_insertada,
        segundo_apellido_eliminada, segundo_apellido_insertada,
        direccion_eliminada, direccion_insertada,
        ciudad_eliminada, ciudad_insertada,
        pais_eliminada, pais_insertada,
        correo_electronico_eliminada, correo_electronico_insertada,
        contrasenia_eliminada, contrasenia_insertada,
        genero_eliminada, genero_insertada,
        grupo_etnico_eliminada, grupo_etnico_insertada,
        equipo_id_eliminada, equipo_id_insertada
        
    )
    VALUES (
        NOW(), 'UPDATE', OLD.Cedula, 
        OLD.FACULTAD_idFACULTAD, NEW.FACULTAD_idFACULTAD,
        OLD.FechaNacimiento, NEW.FechaNacimiento, 
        OLD.Nombre, NEW.Nombre,
        OLD.PrimerApellido, NEW.PrimerApellido,
        OLD.SegundoApellido, NEW.SegundoApellido,
        OLD.Direccion, NEW.Direccion,
        OLD.Ciudad, NEW.Ciudad,
        OLD.Pais, NEW.Pais,
        OLD.CorreoElectronico, NEW.CorreoElectronico,
        OLD.Contrasenia, NEW.Contrasenia,
        OLD.Genero, NEW.Genero,
        OLD.GrupoEtnico, NEW.GrupoEtnico,
        OLD.EQUIPO_ID, NEW.EQUIPO_ID
        
    );
END $$

DELIMITER ;

-- Trigger Delete para egresado

DROP TRIGGER IF EXISTS egresado_delete;

DELIMITER $$

CREATE TRIGGER egresado_delete
AFTER DELETE ON Proyecto_BD.EGRESADO
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_egresado (
        fecha_cambio, accion, cedula, facultad_id_eliminada, 
        fecha_nacimiento_eliminada, nombre_eliminada,
        primer_apellido_eliminada,
        segundo_apellido_eliminada,
        direccion_eliminada,
        ciudad_eliminada,
        pais_eliminada,
        correo_electronico_eliminada,
        contrasenia_eliminada,
        genero_eliminada,
        grupo_etnico_eliminada,
        equipo_id_eliminada
        
    )
    VALUES (
        NOW(), 'DELETE',
        OLD.Cedula, OLD.FACULTAD_idFACULTAD, 
        OLD.FechaNacimiento,
        OLD.Nombre,
        OLD.PrimerApellido,
        OLD.SegundoApellido,
        OLD.Direccion,
        OLD.Ciudad,
        OLD.Pais,
        OLD.CorreoElectronico,
        OLD.Contrasenia,
        OLD.Genero,
        OLD.GrupoEtnico,
        OLD.EQUIPO_ID
        
    );
END $$

DELIMITER ;





-- -----------------------------------------------------
-- Creación del historial para Experiencia laboral
-- 
-- -----------------------------------------------------

-- Creacion de la tabla de historial
 
DROP TABLE IF EXISTS Proyecto_BD.historial_experiencia_laboral;


CREATE TABLE Proyecto_BD.historial_experiencia_laboral (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(50)DEFAULT NULL,
    experiencia_id INT ,
    egresado_cedula INT DEFAULT NULL,
    situacion_actual_eliminada VARCHAR(50) DEFAULT NULL,
    situacion_actual_insertada VARCHAR(50) DEFAULT NULL,
    sector_laboral_actual_eliminada VARCHAR(50) DEFAULT NULL,
    sector_laboral_actual_insertada VARCHAR(50) DEFAULT NULL,
    cargo_eliminada VARCHAR(40) DEFAULT NULL,
    cargo_insertada VARCHAR(40) DEFAULT NULL,
    fecha_inicio_eliminada DATE DEFAULT NULL,
    fecha_inicio_insertada DATE DEFAULT NULL,
    fecha_fin_eliminada DATE DEFAULT NULL,
    fecha_fin_insertada DATE DEFAULT NULL,
    empresa_nit_eliminada INT DEFAULT NULL,
    empresa_nit_insertada INT DEFAULT NULL
);


-- Trigger Insert para Experiencia laboral
DROP TRIGGER IF EXISTS experiencia_laboral_insert;

DELIMITER $$

CREATE TRIGGER experiencia_laboral_insert
AFTER INSERT ON Proyecto_BD.EXPERIENCIA_LABORAL
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_experiencia_laboral (
        fecha_cambio, accion,
        experiencia_id, egresado_cedula, 
        situacion_actual_insertada, sector_laboral_actual_insertada, cargo_insertada, 
        fecha_inicio_insertada, fecha_fin_insertada, empresa_nit_insertada
    )
    VALUES (
        NOW(), 'INSERT',
        NEW.ID, NEW.EGRESADO_Cedula, 
        NEW.SituacionActual, NEW.SectorLaboralActual, NEW.Cargo, 
        NEW.FechaInicio, NEW.FechaFin, NEW.EMPRESA_NIT
    );
END $$

DELIMITER ;



-- Trigger update para Experiencia laboral


DROP TRIGGER IF EXISTS experiencia_laboral_update;


DELIMITER $$

CREATE TRIGGER experiencia_laboral_update
AFTER UPDATE ON Proyecto_BD.EXPERIENCIA_LABORAL
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_experiencia_laboral (
        fecha_cambio, accion,
        experiencia_id, egresado_cedula, 
        situacion_actual_eliminada, situacion_actual_insertada,
        sector_laboral_actual_eliminada, sector_laboral_actual_insertada,
        cargo_eliminada, cargo_insertada,
        fecha_inicio_eliminada, fecha_inicio_insertada,
        fecha_fin_eliminada, fecha_fin_insertada,
        empresa_nit_eliminada, empresa_nit_insertada
    )
    VALUES (
        NOW(), 'UPDATE',
        OLD.ID, OLD.EGRESADO_Cedula,
        OLD.SituacionActual, NEW.SituacionActual,
        OLD.SectorLaboralActual, NEW.SectorLaboralActual,
        OLD.Cargo, NEW.Cargo,
        OLD.FechaInicio, NEW.FechaInicio,
        OLD.FechaFin, NEW.FechaFin,
        OLD.EMPRESA_NIT, NEW.EMPRESA_NIT
    );
END $$

DELIMITER ;


-- Trigger Delete para Experiencia laboral

DROP TRIGGER IF EXISTS experiencia_laboral_delete;

DELIMITER $$

CREATE TRIGGER experiencia_laboral_delete
AFTER DELETE ON Proyecto_BD.EXPERIENCIA_LABORAL
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_experiencia_laboral (
        fecha_cambio, accion,
        experiencia_id, egresado_cedula,
        situacion_actual_eliminada, 
        sector_laboral_actual_eliminada, 
        cargo_eliminada, 
        fecha_inicio_eliminada, 
        fecha_fin_eliminada, 
        empresa_nit_eliminada
    )
    VALUES (
        NOW(), 'DELETE',
        OLD.ID, OLD.EGRESADO_Cedula,
        OLD.SituacionActual,
        OLD.SectorLaboralActual,
        OLD.Cargo,
        OLD.FechaInicio,
        OLD.FechaFin,
        OLD.EMPRESA_NIT
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Creación del historial para Formacion academica
-- 
-- -----------------------------------------------------

-- Creacion de la tabla de Formacion academica

DROP TABLE IF EXISTS Proyecto_BD.historial_formacion_academica;

CREATE TABLE Proyecto_BD.historial_formacion_academica (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_cambio DATETIME DEFAULT NULL,
    accion VARCHAR(20) DEFAULT NULL,
    acta_grado_eliminada INT DEFAULT NULL,
    acta_grado_insertada INT DEFAULT NULL,
    egresado_cedula_eliminada INT DEFAULT NULL,
    egresado_cedula_insertada INT DEFAULT NULL,
    conferencista_cedula_eliminada INT DEFAULT NULL,
    conferencista_cedula_insertada INT DEFAULT NULL,
    universidad_eliminada VARCHAR(50) DEFAULT NULL,
    universidad_insertada VARCHAR(50) DEFAULT NULL,
    facultad_eliminada VARCHAR(50) DEFAULT NULL,
    facultad_insertada VARCHAR(50) DEFAULT NULL,
    programa_eliminada VARCHAR(50) DEFAULT NULL,
    programa_insertada VARCHAR(50) DEFAULT NULL,
    nivel_academico_eliminada VARCHAR(50) DEFAULT NULL,
    nivel_academico_insertada VARCHAR(50) DEFAULT NULL,
    año_grado_eliminada VARCHAR(45) DEFAULT NULL,
    año_grado_insertada VARCHAR(45) DEFAULT NULL
);


-- Trigger Insert para Formacion academica

DROP TRIGGER IF EXISTS formacion_academica_insert;


DELIMITER $$

CREATE TRIGGER formacion_academica_insert
AFTER INSERT ON Proyecto_BD.FORMACION_ACADEMICA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_formacion_academica (
        fecha_cambio, accion,
        acta_grado_insertada, egresado_cedula_insertada, conferencista_cedula_insertada, 
        universidad_insertada, facultad_insertada, programa_insertada, 
        nivel_academico_insertada, año_grado_insertada
    )
    VALUES (
        NOW(), 'INSERT',
        NEW.ActaGrado, NEW.EGRESADO_Cedula, NEW.CONFERENCISTA_Cedula,
        NEW.Universidad, NEW.Facultad, NEW.Programa,
        NEW.NivelAcademico, NEW.AñoGrado
    );
END $$

DELIMITER ;


-- Trigger update para Formacion academica

DROP TRIGGER IF EXISTS formacion_academica_update;


DELIMITER $$

CREATE TRIGGER formacion_academica_update
AFTER UPDATE ON Proyecto_BD.FORMACION_ACADEMICA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_formacion_academica (
        fecha_cambio, accion,
        acta_grado_eliminada, acta_grado_insertada,
        egresado_cedula_eliminada, egresado_cedula_insertada,
        conferencista_cedula_eliminada, conferencista_cedula_insertada,
        universidad_eliminada, universidad_insertada,
        facultad_eliminada, facultad_insertada,
        programa_eliminada, programa_insertada,
        nivel_academico_eliminada, nivel_academico_insertada,
        año_grado_eliminada, año_grado_insertada
    )
    VALUES (
        NOW(), 'UPDATE',
        OLD.ActaGrado, NEW.ActaGrado,
        OLD.EGRESADO_Cedula, NEW.EGRESADO_Cedula,
        OLD.CONFERENCISTA_Cedula, NEW.CONFERENCISTA_Cedula,
        OLD.Universidad, NEW.Universidad,
        OLD.Facultad, NEW.Facultad,
        OLD.Programa, NEW.Programa,
        OLD.NivelAcademico, NEW.NivelAcademico,
        OLD.AñoGrado, NEW.AñoGrado
    );
END $$

DELIMITER ;


-- Trigger Delete para Formacion academica

DROP TRIGGER IF EXISTS formacion_academica_delete;

DELIMITER $$

CREATE TRIGGER formacion_academica_delete
AFTER DELETE ON Proyecto_BD.FORMACION_ACADEMICA
FOR EACH ROW
BEGIN
    INSERT INTO Proyecto_BD.historial_formacion_academica (
        fecha_cambio, accion,
        acta_grado_eliminada,
        egresado_cedula_eliminada,
        conferencista_cedula_eliminada,
        universidad_eliminada,
        facultad_eliminada,
        programa_eliminada,
        nivel_academico_eliminada,
        año_grado_eliminada
    )
    VALUES (
        NOW(), 'DELETE',
        OLD.ActaGrado,
        OLD.EGRESADO_Cedula,
        OLD.CONFERENCISTA_Cedula,
        OLD.Universidad,
        OLD.Facultad,
        OLD.Programa,
        OLD.NivelAcademico,
        OLD.AñoGrado
    );
END $$

DELIMITER ;

-- -----------------------------------------------------
-- Insert, update y dalete para los datos de egresado
-- 
-- -----------------------------------------------------

-- Insert

INSERT INTO Proyecto_BD.EGRESADO (Cedula, FACULTAD_idFACULTAD, FechaNacimiento, Nombre, PrimerApellido, SegundoApellido, Direccion, Ciudad, Pais, CorreoElectronico, Contrasenia, Genero, GrupoEtnico, EQUIPO_ID)
VALUES 
(1010004021, 002, '1995-05-15', 'Carlos', 'Gomez', 'Ramirez', 'CRA 8 N 45-12', 'Bogotá', 'Colombia', 'carlos.gomez@unal.edu.co', 'carlosgomez1505..', 'M', 'Afrodescendiente', NULL),
(1010005022, 001, '1994-03-10', 'Mariana', 'Lopez', 'Martinez', 'AV 19 N 34-56', 'Medellín', 'Colombia', 'mariana.lopez@unal.edu.co', 'marianalopez1003..', 'F', 'Indígena', NULL),
(1010006023, 002, '1997-07-28', 'Juan', 'Perez', 'Gonzalez', 'CLL 22 N 66-33', 'Cali', 'Colombia', 'juan.perez@unal.edu.co', 'juanperez2807..', 'M', 'Mestizo', NULL);

SELECT * FROM historial_egresado;

-- Update

UPDATE Proyecto_BD.EGRESADO SET Nombre = 'Marcos' WHERE Cedula = 1010004021;
UPDATE Proyecto_BD.EGRESADO SET Ciudad = 'Medellín'   WHERE Cedula = 1010005022;
UPDATE Proyecto_BD.EGRESADO SET CorreoElectronico = 'jp@unal.edu.co' WHERE Cedula = 1010006023;

SELECT * FROM historial_egresado;

-- Delete

DELETE FROM Proyecto_BD.EGRESADO WHERE Cedula = 1010004021;
DELETE FROM Proyecto_BD.EGRESADO WHERE Cedula = 1010005022;
DELETE FROM Proyecto_BD.EGRESADO WHERE Cedula = 1010006023;

SELECT * FROM historial_egresado;


-- -----------------------------------------------------
-- Insert, update y dalete para los datos de Experiencia laboral
-- 
-- -----------------------------------------------------

-- insert

INSERT INTO Proyecto_BD.EXPERIENCIA_LABORAL (ID, EGRESADO_Cedula, SituacionActual, SectorLaboralActual, Cargo, FechaInicio, FechaFin, EMPRESA_NIT)
VALUES (3010001, 1010004021, 'ExEmpleado', 'Desarrollo de software a medida', 'Analista de Datos', '2017-08-15', '2019-10-30', 900100103),
(3010002, 1010005022, 'ExEmpleado', 'Desarrollo de software a medida', 'Ingeniero de Calidad', '2016-06-20', '2020-09-25', 900100103),
(3010003, 1010006023, 'ExEmpleado', 'Desarrollo de software a medida', 'Consultor Técnico', '2018-03-01', '2021-07-15', 900100103);

SELECT * FROM historial_experiencia_laboral;

-- update

UPDATE Proyecto_BD.EXPERIENCIA_LABORAL SET Cargo = 'Desarrollador de Aplicaciones', FechaInicio = '2020-01-01', FechaFin = '2021-12-31'
WHERE ID = 3010001;

UPDATE Proyecto_BD.EXPERIENCIA_LABORAL SET Cargo = 'Analista de Sistemas II' WHERE ID = 3010003;

UPDATE Proyecto_BD.EXPERIENCIA_LABORAL SET Cargo = 'Ingeniera de Pruebas', SituacionActual = 'empleado', FechaFin = NULL 
WHERE ID = 3010002;

SELECT * FROM historial_experiencia_laboral;

-- DELETE

DELETE FROM Proyecto_BD.EXPERIENCIA_LABORAL WHERE ID = 3010001;
DELETE FROM Proyecto_BD.EXPERIENCIA_LABORAL WHERE ID = 3010002;
DELETE FROM Proyecto_BD.EXPERIENCIA_LABORAL WHERE ID = 3010003;

SELECT * FROM historial_experiencia_laboral;

-- -----------------------------------------------------
-- Insert, update y dalete para los datos de Experiencia laboral
-- 
-- -----------------------------------------------------

-- Insert
INSERT INTO Proyecto_BD.FORMACION_ACADEMICA (ActaGrado, EGRESADO_Cedula, CONFERENCISTA_Cedula, Universidad, Facultad, Programa, NivelAcademico, AñoGrado)
VALUES 
(987654, 1010004021, NULL, 'Universidad Nacional de Colombia', 'Facultad de Ingeniería', 'Ingeniería de Electronica', 'Pregrado', 2016),
(987655, 1010005022, NULL, 'Universidad Nacional de Colombia', 'Facultad de Ingeniería', 'Ingeniería de Quimica', 'Pregrado', 2015),
(987656, 1010005022, NULL, 'Universidad Nacional de Colombia', 'Facultad de Ingeniería', 'Ingeniería de Industrial', 'Pregrado', 2015);

SELECT * FROM historial_formacion_academica;

-- update

UPDATE Proyecto_BD.FORMACION_ACADEMICA
SET Programa = 'Ingeniería de Sistemas', AñoGrado = 2017 WHERE ActaGrado = 987654;
UPDATE Proyecto_BD.FORMACION_ACADEMICA
SET Programa = 'Ingeniería de Electrónica', AñoGrado = 2016 WHERE ActaGrado = 987655;
UPDATE Proyecto_BD.FORMACION_ACADEMICA
SET Programa = 'Ingeniería de Mecanica', AñoGrado = 2018 WHERE ActaGrado = 987656;

SELECT * FROM historial_formacion_academica;

-- Delete
DELETE FROM Proyecto_BD.FORMACION_ACADEMICA WHERE ActaGrado = 987654;
DELETE FROM Proyecto_BD.FORMACION_ACADEMICA WHERE ActaGrado = 987655;
DELETE FROM Proyecto_BD.FORMACION_ACADEMICA WHERE ActaGrado = 987656;

SELECT * FROM historial_formacion_academica;