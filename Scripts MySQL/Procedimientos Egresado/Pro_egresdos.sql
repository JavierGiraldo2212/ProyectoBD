-- VENTANA EGRESADO
-- VISTAS ----------------------------------------------
-- Crear la vista combinada
DROP VIEW IF EXISTS Combined_View;
CREATE VIEW Proyecto_BD.Combined_View AS
SELECT 
  e.ID AS EVENTO_ID,
  e.Nombre AS Evento_Nombre,
  e.Descripcion AS Evento_Descripcion,
  e.Fecha AS Evento_Fecha,
  e.Hora AS Evento_Hora,
  e.Lugar_plataforma AS Evento_Lugar,
  d.Tematica AS Tematica,
  'Dialogos egresados' AS 'Tipo_evento'
FROM 
  Proyecto_BD.EVENTOS e
  JOIN Proyecto_BD.DIALOGOS_EGRESADOS d ON e.ID = d.EVENTO_ID
UNION
SELECT 
  e.ID AS EVENTO_ID,
  e.Nombre AS Evento_Nombre,
  e.Descripcion AS Evento_Descripcion,
  e.Fecha AS Evento_Fecha,
  e.Hora AS Evento_Hora,
  e.Lugar_plataforma AS Evento_Lugar,
  c.Tematica AS Tematica,
  'Catedra' AS 'Tipo_evento'
FROM 
  Proyecto_BD.EVENTOS e
  JOIN Proyecto_BD.CATEDRA c ON e.ID = c.EVENTO_ID;

-- Verify the view
SELECT * FROM Proyecto_BD.Combined_View;
GRANT SELECT ON Proyecto_BD.Combined_View TO Egresado;


-- PROCEDIMIENTOS---------------------------------------
-- -----------------------------------------------------
-- PROCEDURE AplicarOfertaLaboral
-- Procedimiento para ver el personal de apoyo asignado a un egresado
-- -----------------------------------------------------
DROP PROCEDURE IF EXISTS AplicarOfertaLaboral ;
DELIMITER //

CREATE PROCEDURE Proyecto_BD.AplicarOfertaLaboral (
    IN p_correo_electronico VARCHAR(50),
    IN p_oferta_laboral_no INT
)
BEGIN
    DECLARE v_egresado_cedula BIGINT;
    DECLARE v_count INT;
    DECLARE v_estado VARCHAR(50);

    -- Encontrar la cédula del egresado usando la función
    SET v_egresado_cedula = f_encontrar_Cedula(p_correo_electronico);

    -- Verificar el estado de la oferta laboral
    SELECT estado
    INTO v_estado
    FROM Proyecto_BD.OFERTA_LABORAL
    WHERE No_oferta = p_oferta_laboral_no;

    -- Si el estado no es 'Convocatoria abierta', no permitir la aplicación
    IF v_estado <> 'Convocatoria abierta' THEN
        SELECT 'No se puede aplicar a esta oferta laboral porque la convocatoria no está abierta.';
    ELSE
        -- Verificar si el egresado ya ha aplicado a esta oferta laboral
        SELECT COUNT(*)
        INTO v_count
        FROM Proyecto_BD.EGRESADO_APLICA_OFERTA_LABORAL
        WHERE EGRESADO_Cedula = v_egresado_cedula
        AND OFERTA_LABORAL_No_oferta = p_oferta_laboral_no;

        -- Si ya ha aplicado, no hacer nada
        IF v_count > 0 THEN
            SELECT 'El egresado ya ha aplicado a esta oferta laboral.';
        ELSE
            -- Insertar el registro en la tabla de relación EGRESADO_APLICA_OFERTA_LABORAL
            INSERT INTO Proyecto_BD.EGRESADO_APLICA_OFERTA_LABORAL (EGRESADO_Cedula, OFERTA_LABORAL_No_oferta)
            VALUES (v_egresado_cedula, p_oferta_laboral_no);

            SELECT 'El egresado ha aplicado exitosamente a la oferta laboral.';
        END IF;
    END IF;
    
END //

DELIMITER ;

GRANT EXECUTE ON PROCEDURE AplicarOfertaLaboral TO Egresado;

-- -----------------------------------------------------
-- PROCEDURE  p_verdatos_egresado
-- Procedimiento para ver los datos del egresado según su cédula
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS p_obtener_datos_egresado;
DELIMITER $$
CREATE PROCEDURE p_obtener_datos_egresado(IN correo VARCHAR(50))
BEGIN
    DECLARE cedula_egresado BIGINT;
    
    -- Obtener la cédula utilizando la función f_encontrar_Cedula
    SET cedula_egresado = f_encontrar_Cedula(correo);
    -- Obtener la información del egresado con la cédula encontrada
    SELECT Cedula, FACULTAD_idFACULTAD, Nombre, PrimerApellido, SegundoApellido, Direccion, Ciudad, Pais, CorreoElectronico, GrupoEtnico FROM egresado WHERE cedula = cedula_egresado;
END $$
DELIMITER ;

GRANT EXECUTE ON PROCEDURE p_obtener_datos_egresado TO Egresado;

CALL p_obtener_datos_egresado('diana.perez001');


-- -----------------------------------------------------
-- PROCEDURE  p_actualizar_datos_egresado
-- Procedimiento para Actuliazar datos del egresado según su cédula desde el rol egresado
-- -----------------------------------------------------
DROP PROCEDURE IF EXISTS p_actualizar_datos_egresado_from_egreesado;
DELIMITER $$
CREATE PROCEDURE p_actualizar_datos_egresado_from_egreesado (
	in correo varchar(50),
	in nombre_n VARCHAR(50),
	in primerApellido_n VARCHAR(50),
	in segundoApellido_n VARCHAR(50),
	in direccion_n VARCHAR(100),
	in ciudad_n VARCHAR(50),
	in pais_n VARCHAR(50)
)
BEGIN
	DECLARE cedula_egresado BIGINT;
    -- Obtener la cédula utilizando la función f_encontrar_Cedula
    SET cedula_egresado = f_encontrar_Cedula(correo);

	UPDATE egresado
	SET 
		Nombre = nombre_n,
		PrimerApellido = primerApellido_n,
		SegundoApellido = segundoApellido_n,
		Direccion = direccion_n,
		Ciudad = ciudad_n,
		Pais = pais_n
		WHERE cedula = cedula_egresado;
END;
$$
DELIMITER ;
GRANT EXECUTE ON PROCEDURE p_actualizar_datos_egresado_from_egreesado TO Egresado;


-- -----------------------------------------------------
-- PROCEDURE  Registrar_Asistencia_Egresado
-- Procedimiento registrar que un egresado asista a un evento
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS Registrar_Asistencia_Egresado;

DELIMITER //
CREATE PROCEDURE Registrar_Asistencia_Egresado (
    IN p_correo VARCHAR(50),
    IN p_evento_id INT,
    IN p_tipo_evento VARCHAR(50)
)
BEGIN
    DECLARE v_cedula BIGINT;
    DECLARE v_count INT;

    -- Encontrar la cédula del egresado usando la función f_encontrar_Cedula
    SET v_cedula = f_encontrar_Cedula(p_correo);

    -- Verificar si el egresado ya asiste a este evento
    IF p_tipo_evento = 'Catedra' THEN
        SELECT COUNT(*) INTO v_count
        FROM Proyecto_BD.EGRESADO_ASISTE_CATEDRA
        WHERE EGRESADO_Cedula = v_cedula AND CATEDRA_EVENTO_ID = p_evento_id;
    ELSEIF p_tipo_evento = 'Dialogos egresados' THEN
        SELECT COUNT(*) INTO v_count
        FROM Proyecto_BD.EGRESADO_ASISTE_DIALOGOS_EGRESADOS
        WHERE EGRESADO_Cedula = v_cedula AND DIALOGOS_EGRESADOS_EVENTO_ID = p_evento_id;
    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Tipo de evento no válido';
    END IF;

    -- Si no existe, insertar el registro de asistencia
    IF v_count = 0 THEN
        IF p_tipo_evento = 'Catedra' THEN
            INSERT INTO Proyecto_BD.EGRESADO_ASISTE_CATEDRA (CATEDRA_EVENTO_ID, EGRESADO_Cedula)
            VALUES (p_evento_id, v_cedula);
        ELSEIF p_tipo_evento = 'Dialogos egresados' THEN
            INSERT INTO Proyecto_BD.EGRESADO_ASISTE_DIALOGOS_EGRESADOS (EGRESADO_Cedula, DIALOGOS_EGRESADOS_EVENTO_ID)
            VALUES (v_cedula, p_evento_id);
        END IF;
        SELECT 'Asistencia registrada correctamente' AS Resultado;
    ELSE
        SELECT 'El egresado ya está registrado para este evento' AS Resultado;
    END IF;
END //
DELIMITER ;

-- CALL Registrar_Asistencia_Egresado('diana.perez001', 1001, 'Dialogos egresados');

GRANT EXECUTE ON PROCEDURE Registrar_Asistencia_Egresado TO Egresado;


-- -----------------------------------------------------
-- PROCEDURE  Eliminar_Asistencia_Egresado
-- Procedimiento eliminar registro de un egresado asista a un evento
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS Eliminar_Asistencia_Egresado;
DELIMITER //

CREATE PROCEDURE Eliminar_Asistencia_Egresado (
    IN p_correo VARCHAR(50),
    IN p_evento_id INT,
    IN p_tipo_evento VARCHAR(50)
)
BEGIN
    DECLARE v_cedula BIGINT;

    -- Encontrar la cédula del egresado usando la función f_encontrar_Cedula
    SET v_cedula = f_encontrar_Cedula(p_correo);

    -- Verificar el tipo de evento y eliminar el registro de asistencia correspondiente
    IF p_tipo_evento = 'Catedra' THEN
        DELETE FROM Proyecto_BD.EGRESADO_ASISTE_CATEDRA
        WHERE EGRESADO_Cedula = v_cedula AND CATEDRA_EVENTO_ID = p_evento_id;
        SELECT 'Asistencia eliminada correctamente' AS Resultado;
    ELSEIF p_tipo_evento = 'Dialogos egresados' THEN
        DELETE FROM Proyecto_BD.EGRESADO_ASISTE_DIALOGOS_EGRESADOS
        WHERE EGRESADO_Cedula = v_cedula AND DIALOGOS_EGRESADOS_EVENTO_ID = p_evento_id;
        SELECT 'Asistencia eliminada correctamente' AS Resultado;
    ELSE
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Tipo de evento no válido';
    END IF;
END //
DELIMITER ;

GRANT EXECUTE ON PROCEDURE Eliminar_Asistencia_Egresado TO Egresado;


-- -----------------------------------------------------
-- PROCEDURE  Ver_Eventos_Egresado
-- Procedimiento ver los eventos en los cuales está registrado un egresado
-- -----------------------------------------------------
DROP PROCEDURE IF EXISTS BuscarEventosPorEgresado;
DELIMITER //
CREATE PROCEDURE BuscarEventosPorEgresado(
    IN correo VARCHAR(100)
)
BEGIN
    DECLARE cedula BIGINT;

    -- Obtener la cédula utilizando la función f_encontrar_Cedula
    SELECT f_encontrar_Cedula(correo) INTO cedula;

    -- Consulta principal para obtener los eventos de cátedra a los que asiste el egresado
    SELECT 
        e.ID AS ID_Evento,
        e.Nombre AS Nombre,
        e.Descripcion AS Descripcion,
        e.Fecha AS Fecha,
        e.Hora AS Hora,
        e.Lugar_plataforma AS Lugar,
        c.Tematica AS Tematica,
        'Catedra' AS Tipo_evento
    FROM 
        Proyecto_BD.EGRESADO_ASISTE_CATEDRA ea
        JOIN Proyecto_BD.EVENTOS e ON ea.CATEDRA_EVENTO_ID = e.ID
        JOIN Proyecto_BD.CATEDRA c ON e.ID = c.EVENTO_ID
    WHERE 
        ea.EGRESADO_Cedula = cedula;

    -- Consulta para obtener los eventos de diálogos con egresados a los que asiste el egresado
    SELECT 
        e.ID AS ID_Evento,
        e.Nombre AS Nombre,
        e.Descripcion AS Descripcion,
        e.Fecha AS Fecha,
        e.Hora AS Hora,
        e.Lugar_plataforma AS Lugar,
        de.Tematica AS Tematica,
        'Dialogos egresados' AS Tipo_evento
    FROM 
        Proyecto_BD.EGRESADO_ASISTE_DIALOGOS_EGRESADOS ea
        JOIN Proyecto_BD.EVENTOS e ON ea.DIALOGOS_EGRESADOS_EVENTO_ID = e.ID
        JOIN Proyecto_BD.DIALOGOS_EGRESADOS de ON e.ID = de.EVENTO_ID
    WHERE 
        ea.EGRESADO_Cedula = cedula;

END //
DELIMITER ;

GRANT EXECUTE ON PROCEDURE BuscarEventosPorEgresado TO Egresado;


-- -----------------------------------------------------
-- PROCEDURE  sp_buscar_ofertas_por_egresado
-- Procedimiento ver las ofertas a las que aplica un egresado
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_buscar_ofertas_por_egresado;
DELIMITER //

CREATE PROCEDURE sp_buscar_ofertas_por_egresado(IN correo VARCHAR(50))
BEGIN
    DECLARE cedula BIGINT;

    -- Buscamos la cédula del egresado basado en el correo
    SET cedula = f_encontrar_Cedula(correo);

    -- Consulta para obtener las ofertas laborales aplicadas por el egresado
    SELECT
        OL.No_oferta AS 'No Oferta',
        E.Nombre AS 'Empresa',
        OL.Estado,
        OL.Salario,
        OL.ExpRequerida AS 'Experiencia requerida',
        OL.Area,
        OL.TipoContrato AS 'Tipo contrato',
        E.Telefono AS 'Telefono contacto',
        E.CorreoElectronico AS 'Correo',
        RE.Correo AS 'Correo responsable'
    FROM
        Proyecto_BD.EGRESADO_APLICA_OFERTA_LABORAL EA
        INNER JOIN Proyecto_BD.OFERTA_LABORAL OL ON EA.OFERTA_LABORAL_No_oferta = OL.No_oferta
        INNER JOIN Proyecto_BD.EMPRESA E ON OL.EMPRESA_NIT = E.NIT
        INNER JOIN Proyecto_BD.REPRESENTANTE_EMPRESA RE ON E.REPRESENTANTE_EMPRESA_Cedula = RE.Cedula
    WHERE
        EA.EGRESADO_Cedula = cedula;
END//

DELIMITER ;

GRANT EXECUTE ON PROCEDURE sp_buscar_ofertas_por_egresado TO Egresado;
CALL sp_buscar_ofertas_por_egresado('diana.perez001');

-- -----------------------------------------------------
-- PROCEDURE  sp_eliminar_aplicacion_oferta
-- Procedimiento eliminar las ofertas a las que aplica un egresado
-- -----------------------------------------------------

DROP PROCEDURE IF EXISTS sp_eliminar_aplicacion_oferta;
DELIMITER //
CREATE PROCEDURE sp_eliminar_aplicacion_oferta(IN correo VARCHAR(100), IN id_oferta INT)
BEGIN
    DECLARE cedula BIGINT;

    -- Buscamos la cédula del egresado basado en el correo
    SET cedula = f_encontrar_Cedula(correo);

    -- Eliminamos la aplicación a la oferta laboral
    DELETE FROM Proyecto_BD.EGRESADO_APLICA_OFERTA_LABORAL
    WHERE EGRESADO_Cedula = cedula
    AND OFERTA_LABORAL_No_oferta = id_oferta;

END//
DELIMITER ;
GRANT EXECUTE ON PROCEDURE sp_eliminar_aplicacion_oferta TO Egresado;
