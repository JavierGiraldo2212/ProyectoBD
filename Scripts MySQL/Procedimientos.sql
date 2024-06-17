USE Proyecto_BD;

-- Interfaz empresa

-- -----------------------------------------------------
-- FUNCTION f_encontrar_NIT
-- Encontrar NIT de una empresa
-- -----------------------------------------------------

DROP FUNCTION IF EXISTS f_encontrar_NIT ;
DELIMITER $$
CREATE FUNCTION f_encontrar_NIT  (correo_buscar VARCHAR(50)) RETURNS BIGINT  DETERMINISTIC
BEGIN
	DECLARE correo_buscar_mod VARCHAR (50);
    SET correo_buscar_mod = LEFT (correo_buscar, LENGTH(correo_buscar) -2 );
    RETURN (SELECT empresa.Nit FROM Empresa JOIN representante_empresa ON representante_empresa.cedula =REPRESENTANTE_EMPRESA_Cedula
    WHERE representante_empresa.correo  LIKE CONCAT(correo_buscar_mod, '%')) ;

END $$	
DELIMITER ;

SELECT * FROM EMPRESA WHERE empresa.Nit = 900100100;
SELECT f_encontrar_NIT('laura.jimenez.E');

CALL sp_cambiar_nombre_empresa( f_encontrar_NIT('laura.jimenez.E'), 'IBM LTDA');

-- -----------------------------------------------------
-- PROCEDURE  sp_cambiar_descripcion_empresa
-- Procedimiento para cambiar la descripción de una empresa
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_cambiar_descripcion_empresa ;
DELIMITER $$
CREATE PROCEDURE sp_cambiar_descripcion_empresa  (NIT_cambio BIGINT, nueva_descripcion VARCHAR (50))
BEGIN
	UPDATE Proyecto_BD.Empresa SET Descripcion = nueva_descripcion
WHERE empresa.NIT = NIT_cambio;

	
END $$	
DELIMITER ;

SELECT * FROM Empresa WHERE Empresa.NIT = 900100100;
CALL sp_cambiar_descripcion_empresa(900100100, 'Fabricación de productos electrónicos y software');
SELECT * FROM Empresa WHERE Empresa.NIT = 900100100;

-- -----------------------------------------------------
-- PROCEDURE  sp_cambiar_campo_empresa
-- Procedimiento para cambiar el campo de una empresa
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_cambiar_campo_empresa ;
DELIMITER $$
CREATE PROCEDURE sp_cambiar_campo_empresa  (NIT_cambio BIGINT, nuevo_campo VARCHAR (20))
BEGIN
	UPDATE Proyecto_BD.Empresa SET Campo = nuevo_campo
WHERE empresa.NIT = NIT_cambio;

	
END $$	
DELIMITER ;

SELECT * FROM Empresa WHERE Empresa.NIT = 900100100;
CALL sp_cambiar_campo_empresa(900100100, 'software');
SELECT * FROM Empresa WHERE Empresa.NIT = 900100100;

-- -----------------------------------------------------
-- PROCEDURE  sp_cambiar_telefono_empresa
-- Procedimiento para cambiar el teléfono de una empresa
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_cambiar_telefono_empresa;
DELIMITER $$
CREATE PROCEDURE sp_cambiar_telefono_empresa (NIT_cambio BIGINT, nuevo_telefono VARCHAR(15))
BEGIN
    UPDATE Proyecto_BD.EMPRESA SET Telefono = nuevo_telefono
    WHERE NIT = NIT_cambio;
END $$
DELIMITER ;

-- -----------------------------------------------------
-- PROCEDURE  sp_cambiar_telefono_empresa
-- Procedimiento para cambiar el teléfono de una empresa
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_cambiar_telefono_empresa;
DELIMITER $$
CREATE PROCEDURE sp_cambiar_telefono_empresa (NIT_cambio BIGINT, nuevo_telefono VARCHAR(15))
BEGIN
    UPDATE Proyecto_BD.EMPRESA SET Telefono = nuevo_telefono
    WHERE NIT = NIT_cambio;
END $$
DELIMITER ;


-- -----------------------------------------------------
-- PROCEDURE  sp_cambiar_direccion_empresa
-- Procedimiento para cambiar la dirección de una empresa
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_cambiar_direccion_empresa;
DELIMITER $$
CREATE PROCEDURE sp_cambiar_direccion_empresa (NIT_cambio BIGINT, nueva_direccion VARCHAR(45))
BEGIN
    UPDATE Proyecto_BD.EMPRESA SET Direccion = nueva_direccion
    WHERE NIT = NIT_cambio;
END $$
DELIMITER ;

-- -----------------------------------------------------
-- PROCEDURE  sp_cambiar_correo_empresa
-- Procedimiento para cambiar el correo electrónico de una empresa
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_cambiar_correo_empresa;
DELIMITER $$
CREATE PROCEDURE sp_cambiar_correo_empresa (NIT_cambio BIGINT, nuevo_correo VARCHAR(50))
BEGIN
    UPDATE Proyecto_BD.EMPRESA SET CorreoElectronico = nuevo_correo
    WHERE NIT = NIT_cambio;
END $$
DELIMITER ;

-- -----------------------------------------------------
-- PROCEDURE  sp_cambiar_pagina_web_empresa
-- Procedimiento para cambiar la página web de una empresa
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_cambiar_pagina_web_empresa;
DELIMITER $$
CREATE PROCEDURE sp_cambiar_pagina_web_empresa (NIT_cambio BIGINT, nueva_pagina_web VARCHAR(45))
BEGIN
    UPDATE Proyecto_BD.EMPRESA SET PaginaWeb = nueva_pagina_web
    WHERE NIT = NIT_cambio;
END $$
DELIMITER ;



-- -----------------------------------------------------
-- PROCEDURE  sp_ingresar_oferta
-- Procedimiento para ingresar oferta
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ingresar_oferta;
DELIMITER $$
CREATE PROCEDURE sp_ingresar_oferta (nueva_empresa_nit INT, Nuevo_estado VARCHAR(25), nuevo_salario INT, nueva_exp_requerida INT, nueva_area VARCHAR(40), nuevo_tipo_contrato VARCHAR(40))
BEGIN
    INSERT INTO Proyecto_BD.OFERTA_LABORAL (EMPRESA_NIT, Estado, Salario, ExpRequerida, Area, TipoContrato, FechaPublicacion) VALUES
    (nueva_empresa_nit, Nuevo_estado, nuevo_salario, nueva_exp_requerida, nueva_area, nuevo_tipo_contrato, CURDATE());
END $$
DELIMITER ;

CALL sp_ingresar_oferta (900100105, 'En definicion', 1000000, 16, 'direccion de proyecto', 'prestacion de servicios');

SELECT * FROM proyecto_bd.oferta_laboral;



-- -----------------------------------------------------
-- PROCEDURE  sp_cambiar_Estado_oferta_laboral
-- Procedimiento para cambiar el estado de una oferta laboral
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_cambiar_Estado_oferta_laboral;
DELIMITER $$
CREATE PROCEDURE sp_cambiar_Estado_oferta_laboral (no_oferta_cambio BIGINT, nuevo_estado VARCHAR(15))
BEGIN
    UPDATE Proyecto_BD.oferta_laboral SET Estado = nuevo_estado
    WHERE No_oferta = no_oferta_cambio;
END $$
DELIMITER ;

SELECT * FROM oferta_laboral WHERE oferta_laboral.No_oferta = 9;
CALL sp_cambiar_Estado_oferta_laboral(9, 'Finalizada');

-- -----------------------------------------------------
-- PROCEDURE sp_cambiar_Salario_oferta_laboral
-- Procedimiento para cambiar el salario de una oferta laboral
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_cambiar_Salario_oferta_laboral;
DELIMITER $$

CREATE PROCEDURE sp_cambiar_Salario_oferta_laboral (
    IN no_oferta_cambio BIGINT, 
    IN nuevo_salario INT
)
BEGIN
    UPDATE Proyecto_BD.OFERTA_LABORAL 
    SET Salario = nuevo_salario
    WHERE No_oferta = no_oferta_cambio;
END $$

DELIMITER ;

CALL sp_cambiar_Salario_oferta_laboral(9, 5000000);
SELECT * FROM oferta_laboral WHERE oferta_laboral.No_oferta = 9;

-- -----------------------------------------------------
-- PROCEDURE sp_cambiar_ExpRequerida_oferta_laboral
-- Procedimiento para cambiar la experiencia requerida de una oferta laboral
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_cambiar_ExpRequerida_oferta_laboral;
DELIMITER $$

CREATE PROCEDURE sp_cambiar_ExpRequerida_oferta_laboral (
    IN no_oferta_cambio BIGINT, 
    IN nueva_exp_requerida INT
)
BEGIN
    UPDATE Proyecto_BD.OFERTA_LABORAL 
    SET ExpRequerida = nueva_exp_requerida
    WHERE No_oferta = no_oferta_cambio;
END $$

DELIMITER ;


-- -----------------------------------------------------
-- PROCEDURE sp_cambiar_Area_oferta_laboral
-- Procedimiento para cambiar el área de una oferta laboral
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_cambiar_Area_oferta_laboral;
DELIMITER $$

CREATE PROCEDURE sp_cambiar_Area_oferta_laboral (
    IN no_oferta_cambio BIGINT, 
    IN nueva_area VARCHAR(40)
)
BEGIN
    UPDATE Proyecto_BD.OFERTA_LABORAL 
    SET Area = nueva_area
    WHERE No_oferta = no_oferta_cambio;
END $$

DELIMITER ;

-- -----------------------------------------------------
-- PROCEDURE sp_cambiar_TipoContrato_oferta_laboral
-- Procedimiento para cambiar el tipo de contrato de una oferta laboral
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_cambiar_TipoContrato_oferta_laboral;
DELIMITER $$

CREATE PROCEDURE sp_cambiar_TipoContrato_oferta_laboral (
    IN no_oferta_cambio BIGINT, 
    IN nuevo_tipo_contrato VARCHAR(40)
)
BEGIN
    UPDATE Proyecto_BD.OFERTA_LABORAL 
    SET TipoContrato = nuevo_tipo_contrato
    WHERE No_oferta = no_oferta_cambio;
END $$

DELIMITER ;


-- -----------------------------------------------------
-- PROCEDURE sp_ver_oferta_laboral_unica
-- Procedimiento para cambiar el tipo de contrato de una oferta laboral
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ver_oferta_laboral_unica;
DELIMITER $$

CREATE PROCEDURE sp_ver_oferta_laboral_unica (oferta_id BIGINT )
BEGIN
    SELECT No_oferta AS 'No Oferta', empresa.Nombre AS 'Empresa', Estado, Salario, 
	ExpRequerida AS 'Experiencia requerida', Area, TipoContrato AS 'Tipo contrato',
	empresa.Telefono AS 'Telefono contacto', empresa.CorreoElectronico AS 'Correo', 
	representante_empresa.Correo AS 'Correo responsable'
	FROM oferta_laboral JOIN empresa ON EMPRESA_NIT = NIT 
	JOIN representante_empresa ON REPRESENTANTE_EMPRESA_Cedula = representante_empresa.Cedula
    WHERE oferta_id = No_oferta;
END $$

DELIMITER ;

CALL sp_ver_oferta_laboral_unica(6);

-- --------EGRESADO-----------------------------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------
-- FUNCTION f_encontrar_Cedula
-- Encontrar cedula de un egresado por su usuario
-- -----------------------------------------------------

DROP FUNCTION IF EXISTS f_encontrar_Cedula ;
DELIMITER $$
CREATE FUNCTION f_encontrar_Cedula  (correo_buscar VARCHAR(50)) RETURNS BIGINT  DETERMINISTIC
BEGIN
	
    RETURN (SELECT egresado.cedula FROM egresado 
    WHERE egresado.CorreoElectronico  LIKE CONCAT(correo_buscar, '%')) ;

END $$	
DELIMITER ;

SELECT * FROM egresado WHERE egresado.cedula = 1009003019;
SELECT f_encontrar_Cedula('sara.gomez004');


-- -----------------------------------------------------
-- PROCEDURE  sp_ver_experiencia_laboral
-- Procedimiento para ver la experiencia laboral de un egresado
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ver_experiencia_laboral;
DELIMITER $$
CREATE PROCEDURE sp_ver_experiencia_laboral (Cedula_busqueda BIGINT)
BEGIN
    SELECT experiencia_laboral.Id AS ID, egresado.cedula AS 'Cedula', egresado.Nombre As 'Nombre', egresado.PrimerApellido As 'Primer apellido',
	Cargo, FechaInicio AS 'Fecha inicio', FechaFin AS 'Fecha fin', SectorLaboralActual AS 'Sector laboral',
    SituacionActual 'Situación actual' , empresa.Nombre AS 'Empresa'
	FROM egresado JOIN experiencia_laboral ON EGRESADO_Cedula = Cedula 
	JOIN empresa ON EMPRESA_NIT = NIT WHERE egresado.cedula = Cedula_busqueda;

END $$
DELIMITER ;

CALL sp_ver_experiencia_laboral (1001003011);

-- -----------------------------------------------------
-- PROCEDURE  sp_ver_experiencia_laboral_unica
-- Procedimiento para ver una entrada especifica experiencia laboral de un egresado
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ver_experiencia_laboral_unica;
DELIMITER $$
CREATE PROCEDURE sp_ver_experiencia_laboral_unica (exp_id BIGINT)
BEGIN
    SELECT experiencia_laboral.Id AS ID, egresado.cedula AS 'Cedula', egresado.Nombre As 'Nombre', egresado.PrimerApellido As 'Primer apellido',
	Cargo, FechaInicio AS 'Fecha inicio', FechaFin AS 'Fecha fin', SectorLaboralActual AS 'Sector laboral',
    SituacionActual 'Situación actual' , empresa.Nombre AS 'Empresa'
	FROM egresado JOIN experiencia_laboral ON EGRESADO_Cedula = Cedula 
	JOIN empresa ON EMPRESA_NIT = NIT  
    WHERE exp_id = experiencia_laboral.Id;

END $$
DELIMITER ;

CALL sp_ver_experiencia_laboral_unica (3000002);
-- -----------------------------------------------------
-- PROCEDURE  sp_crear_experiencia_laboral
-- Procedimiento para crear una entrada en la experiencia laboral de un egresado
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_crear_experiencia_laboral;
DELIMITER $$
CREATE PROCEDURE sp_crear_experiencia_laboral (nuevo_EGRESADO_Cedula BIGINT, nuevo_SituacionActual VARCHAR(20), nuevo_SectorLaboralActual VARCHAR(45), nuevo_Cargo VARCHAR (40), nuevo_FechaInicio DATE, nuevo_FechaFin DATE, nuevo_EMPRESA_NIT BIGINT)
BEGIN
    INSERT INTO Proyecto_BD.EXPERIENCIA_LABORAL (EGRESADO_Cedula, SituacionActual, SectorLaboralActual, Cargo, FechaInicio, FechaFin, EMPRESA_NIT)
VALUES 
(nuevo_EGRESADO_Cedula,nuevo_SituacionActual, nuevo_SectorLaboralActual, nuevo_Cargo, nuevo_FechaInicio, nuevo_FechaFin, nuevo_EMPRESA_NIT);

END $$
DELIMITER ;

CALL sp_crear_experiencia_laboral (1008003018, 'ExEmpleado', 'Consultoría de negocios', 'Asistente', '2020-09-18', '2021-09-17', 900100106);
CALL sp_ver_experiencia_laboral (1008003018);

-- -----------------------------------------------------
-- PROCEDURE  sp_cambiar_SituacionActual_experiencia_laboral
-- Procedimiento para cambiar la situacion en la experiencia laboral
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_cambiar_SituacionActual_experiencia_laboral;
DELIMITER $$
CREATE PROCEDURE sp_cambiar_SituacionActual_experiencia_laboral (exp_laboral_id BIGINT, nuevo_SituacionActual VARCHAR (20))
BEGIN
    UPDATE Proyecto_BD.experiencia_laboral SET SituacionActual = nuevo_SituacionActual
    WHERE experiencia_laboral.ID = exp_laboral_id;
END $$
DELIMITER ;

CALL sp_ver_experiencia_laboral_unica (3000002);
CALL sp_cambiar_SituacionActual_experiencia_laboral(3000002, 'Empleado');

-- -----------------------------------------------------
-- PROCEDURE sp_cambiar_SectorLaboralActual_experiencia_laboral
-- Procedimiento para cambiar el sector laboral actual en la experiencia laboral
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_cambiar_SectorLaboralActual_experiencia_laboral;
DELIMITER $$

CREATE PROCEDURE sp_cambiar_SectorLaboralActual_experiencia_laboral (
    IN exp_laboral_id BIGINT, 
    IN nuevo_SectorLaboralActual VARCHAR(45)
)
BEGIN
    UPDATE Proyecto_BD.EXPERIENCIA_LABORAL 
    SET SectorLaboralActual = nuevo_SectorLaboralActual
    WHERE ID = exp_laboral_id;
END $$

DELIMITER ;

-- -----------------------------------------------------
-- PROCEDURE sp_cambiar_Cargo_experiencia_laboral
-- Procedimiento para cambiar el cargo en la experiencia laboral
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_cambiar_Cargo_experiencia_laboral;
DELIMITER $$

CREATE PROCEDURE sp_cambiar_Cargo_experiencia_laboral (
    IN exp_laboral_id BIGINT, 
    IN nuevo_Cargo VARCHAR(40)
)
BEGIN
    UPDATE Proyecto_BD.EXPERIENCIA_LABORAL 
    SET Cargo = nuevo_Cargo
    WHERE ID = exp_laboral_id;
END $$

DELIMITER ;

-- -----------------------------------------------------
-- PROCEDURE sp_cambiar_FechaInicio_experiencia_laboral
-- Procedimiento para cambiar la fecha de inicio en la experiencia laboral
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_cambiar_FechaInicio_experiencia_laboral;
DELIMITER $$

CREATE PROCEDURE sp_cambiar_FechaInicio_experiencia_laboral (
    IN exp_laboral_id BIGINT, 
    IN nueva_FechaInicio DATE
)
BEGIN
    UPDATE Proyecto_BD.EXPERIENCIA_LABORAL 
    SET FechaInicio = nueva_FechaInicio
    WHERE ID = exp_laboral_id;
END $$

DELIMITER ;

-- -----------------------------------------------------
-- PROCEDURE sp_cambiar_FechaFin_experiencia_laboral
-- Procedimiento para cambiar la fecha de fin en la experiencia laboral
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_cambiar_FechaFin_experiencia_laboral;
DELIMITER $$

CREATE PROCEDURE sp_cambiar_FechaFin_experiencia_laboral (
    IN exp_laboral_id BIGINT, 
    IN nueva_FechaFin DATE
)
BEGIN
    UPDATE Proyecto_BD.EXPERIENCIA_LABORAL 
    SET FechaFin = nueva_FechaFin
    WHERE ID = exp_laboral_id;
END $$

DELIMITER ;

-- -----------------------------------------------------
-- PROCEDURE  sp_ver_formacion_academica
-- Procedimiento para ver la Formación academica de un egresado
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ver_formacion_academica;
DELIMITER $$
CREATE PROCEDURE sp_ver_formacion_academica (Cedula_busqueda BIGINT)
BEGIN
    SELECT formacion_academica.ActaGrado AS 'Acta de Grado', egresado.cedula AS 'Cedula', egresado.Nombre As 'Nombre', egresado.PrimerApellido As 'Primer apellido',
	Universidad, Facultad, Programa, NivelAcademico AS 'Nivel Academico',
    AñoGrado AS 'Año de grado' 
	FROM egresado JOIN formacion_academica ON EGRESADO_Cedula = Cedula 
	WHERE egresado.cedula = Cedula_busqueda;

END $$
DELIMITER ;

CALL sp_ver_formacion_academica (1001003011);

-- -----------------------------------------------------
-- PROCEDURE  sp_ver_formacion_academica
-- Procedimiento para ver la Formación academica de un egresado
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ver_formacion_academica;
DELIMITER $$
CREATE PROCEDURE sp_ver_formacion_academica (Cedula_busqueda BIGINT)
BEGIN
    SELECT formacion_academica.ActaGrado AS 'Acta de Grado', egresado.cedula AS 'Cedula', egresado.Nombre As 'Nombre', egresado.PrimerApellido As 'Primer apellido',
	Universidad, Facultad, Programa, NivelAcademico AS 'Nivel Academico',
    AñoGrado AS 'Año de grado' 
	FROM egresado JOIN formacion_academica ON EGRESADO_Cedula = Cedula 
	WHERE egresado.cedula = Cedula_busqueda;

END $$
DELIMITER ;

CALL sp_ver_formacion_academica (1001003011);

-- -----------------------------------------------------
-- PROCEDURE  sp_ver_formacion_academica_unica
-- Procedimiento para ver una entrada a la Formación academica de un egresado
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ver_formacion_academica_unica;
DELIMITER $$
CREATE PROCEDURE sp_ver_formacion_academica_unica (acta_busqueda BIGINT)
BEGIN
    SELECT formacion_academica.ActaGrado AS 'Acta de Grado', egresado.cedula AS 'Cedula', egresado.Nombre As 'Nombre', egresado.PrimerApellido As 'Primer apellido',
	Universidad, Facultad, Programa, NivelAcademico AS 'Nivel Academico',
    AñoGrado AS 'Año de grado' 
	FROM egresado JOIN formacion_academica ON EGRESADO_Cedula = Cedula 
	WHERE ActaGrado = acta_busqueda;

END $$
DELIMITER ;

CALL sp_ver_formacion_academica_unica (112240);

-- -----------------------------------------------------
-- PROCEDURE  sp_crear_formacion_academica
-- Procedimiento para crear una entrada en la Formación academica de un egresado
-- -----------------------------------------------------


DROP PROCEDURE IF EXISTS sp_crear_formacion_academica;
DELIMITER $$
CREATE PROCEDURE sp_crear_formacion_academica (nuevo_ActaGrado BIGINT, nuevo_EGRESADO_Cedula BIGINT, nuevo_Universidad VARCHAR(100), nuevo_Facultad VARCHAR (45), nuevo_Programa VARCHAR (45), nuevo_NivelAcademico VARCHAR (45), nuevo_AñoGrado VARCHAR (45))
BEGIN
    INSERT INTO Proyecto_BD.FORMACION_ACADEMICA (ActaGrado, EGRESADO_Cedula, Universidad, Facultad, Programa, NivelAcademico, AñoGrado)
VALUES 
(nuevo_ActaGrado, nuevo_EGRESADO_Cedula, nuevo_Universidad, nuevo_Facultad, nuevo_Programa, nuevo_NivelAcademico, nuevo_AñoGrado);
END $$
DELIMITER ;

CALL sp_crear_formacion_academica (119999, 1001003011,  'Universidad Nacional de Colombia', 'Ingenieria', ' Maestria en Ingerniería química', 'Maestria', 2018);
CALL sp_ver_formacion_academica (1001003011);

-- -----------------------------------------------------
-- PROCEDURE  sp_cambiar_Universidad_formacion_academica
-- Procedimiento para cambiar la situacion en la experiencia laboral
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_cambiar_Universidad_formacion_academica;
DELIMITER $$
CREATE PROCEDURE sp_cambiar_Universidad_formacion_academica (for_academica_Id BIGINT, nuevo_universidad VARCHAR (100))
BEGIN
    UPDATE Proyecto_BD.formacion_academica SET universidad = nuevo_universidad
    WHERE formacion_academica.ActaGrado = for_academica_Id;
END $$
DELIMITER ;

CALL sp_ver_formacion_academica (1001003011);
CALL sp_cambiar_Universidad_formacion_academica(119999, 'Universidad Distrital');

-- -----------------------------------------------------
-- PROCEDURE sp_cambiar_Facultad_formacion_academica
-- Procedimiento para cambiar la facultad en la formación académica
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_cambiar_Facultad_formacion_academica;
DELIMITER $$

CREATE PROCEDURE sp_cambiar_Facultad_formacion_academica (
    IN for_academica_Id BIGINT, 
    IN nueva_Facultad VARCHAR(45)
)
BEGIN
    UPDATE Proyecto_BD.FORMACION_ACADEMICA 
    SET Facultad = nueva_Facultad
    WHERE ActaGrado = for_academica_Id;
END $$

DELIMITER ;


-- -----------------------------------------------------
-- PROCEDURE sp_cambiar_Programa_formacion_academica
-- Procedimiento para cambiar el programa en la formación académica
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_cambiar_Programa_formacion_academica;
DELIMITER $$

CREATE PROCEDURE sp_cambiar_Programa_formacion_academica (
    IN for_academica_Id BIGINT, 
    IN nuevo_Programa VARCHAR(45)
)
BEGIN
    UPDATE Proyecto_BD.FORMACION_ACADEMICA 
    SET Programa = nuevo_Programa
    WHERE ActaGrado = for_academica_Id;
END $$

DELIMITER ;


-- -----------------------------------------------------
-- PROCEDURE sp_cambiar_NivelAcademico_formacion_academica
-- Procedimiento para cambiar el nivel académico en la formación académica
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_cambiar_NivelAcademico_formacion_academica;
DELIMITER $$

CREATE PROCEDURE sp_cambiar_NivelAcademico_formacion_academica (
    IN for_academica_Id BIGINT, 
    IN nuevo_NivelAcademico VARCHAR(45)
)
BEGIN
    UPDATE Proyecto_BD.FORMACION_ACADEMICA 
    SET NivelAcademico = nuevo_NivelAcademico
    WHERE ActaGrado = for_academica_Id;
END $$

DELIMITER ;


-- -----------------------------------------------------
-- PROCEDURE sp_cambiar_AñoGrado_formacion_academica
-- Procedimiento para cambiar el año de grado en la formación académica
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_cambiar_AñoGrado_formacion_academica;
DELIMITER $$

CREATE PROCEDURE sp_cambiar_AñoGrado_formacion_academica (
    IN for_academica_Id BIGINT, 
    IN nuevo_AñoGrado VARCHAR(45)
)
BEGIN
    UPDATE Proyecto_BD.FORMACION_ACADEMICA 
    SET AñoGrado = nuevo_AñoGrado
    WHERE ActaGrado = for_academica_Id;
END $$

DELIMITER ;


-- -----------------------------------------------------
-- PROCEDURE  sp_ingresar_equipo  
-- Procedimiento para ingreso de equipo de un egresado
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ingresar_equipo ;
DELIMITER $$
CREATE PROCEDURE sp_ingresar_equipo  (cedula BIGINT, Id_equipo_cambio INT)
BEGIN
	DECLARE pertenece_equipo INT;
    SET pertenece_equipo = (SELECT  EQUIPO_ID FROM egresado WHERE egresado.cedula = cedula);
    IF pertenece_equipo IS NULL THEN
		UPDATE egresado SET EQUIPO_ID = Id_equipo_cambio WHERE egresado.cedula = cedula;
	ELSE
		SELECT  pertenece_equipo;
	END IF;
END $$	
DELIMITER ;


SELECT * FROM egresado WHERE egresado.cedula = 1001003011;
CALL sp_ingresar_equipo(1001003011, 20004);
SELECT * FROM egresado WHERE egresado.cedula = 1001003011;





-- -----------------------------------------------------
-- PROCEDURE  sp_salir_equipo  
-- Procedimiento para Salir de equipo de un egresado
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_salir_equipo ;
DELIMITER $$
CREATE PROCEDURE sp_salir_equipo  (cedula BIGINT)
BEGIN
	DECLARE pertenece_equipo INT;
    SET pertenece_equipo = (SELECT  EQUIPO_ID FROM egresado WHERE egresado.cedula = cedula);
    IF pertenece_equipo IS NOT NULL THEN
		UPDATE egresado SET EQUIPO_ID = NULL WHERE egresado.cedula = cedula;
	END IF;
END $$	
DELIMITER ;

SELECT * FROM egresado WHERE egresado.cedula = 1001003011;
CALL sp_salir_equipo(1001003011);
SELECT * FROM egresado WHERE egresado.cedula = 1001003011;

-- -----------------------------------------------------
-- PROCEDURE  sp_ver_persona_de_apoyo
-- Procedimiento para ver el personal de apoyo asignado a un egresado
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_ver_persona_de_apoyo ;
DELIMITER $$
CREATE PROCEDURE sp_ver_persona_de_apoyo  (cedula_busqueda BIGINT)
BEGIN
	SELECT personal_apoyo.Nombres AS Nombres, CONCAT(personal_apoyo.PrimerApellido, ' ', personal_apoyo.SegundoApellido) AS apellidos,
    Facultad.CorreoAdministracion AS Correo, facultad.PBX As Telefono, facultad.Oficina AS oficina
    FROM egresado JOIN facultad ON idFACULTAD = FACULTAD_idFACULTAD JOIN personal_apoyo ON personal_apoyo.cedula =PERSONAL_APOYO_Cedula
    WHERE cedula_busqueda = egresado.cedula;
	
END $$	
DELIMITER ;

SELECT * FROM egresado WHERE egresado.cedula = 1001003011;
CALL sp_ver_persona_de_apoyo(1001003011);

