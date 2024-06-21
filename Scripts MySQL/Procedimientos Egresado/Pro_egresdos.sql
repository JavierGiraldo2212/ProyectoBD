-- VENTANA EGRESADO

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


