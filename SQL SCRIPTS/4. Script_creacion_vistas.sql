USE Proyecto_BD;

-- -----------------------------------------------------
-- VIEW  vw_asistentes_dialogos  
-- Lista de asistentes a dialogos egresados
-- -----------------------------------------------------

DROP VIEW IF EXISTS vw_asistentes_dialogos ;

CREATE VIEW vw_asistentes_dialogos AS
SELECT egresado.cedula AS 'Cedula', egresado.Nombre As 'Nombre', egresado.PrimerApellido As 'Primer apellido', 
egresado.CorreoElectronico As 'Correo', eventos.Nombre As 'Evento', eventos.Fecha
FROM egresado JOIN egresado_asiste_dialogos_egresados ON EGRESADO_Cedula = egresado.cedula
JOIN dialogos_egresados ON DIALOGOS_EGRESADOS_EVENTO_ID = EVENTO_ID JOIN eventos ON ID =EVENTO_ID;

SELECT * FROM vw_asistentes_dialogos;

-
-- -----------------------------------------------------
-- VIEW vw_asistentes_catedras
-- Lista asistentes a Catedras de egresados
-- -----------------------------------------------------

DROP VIEW IF EXISTS vw_asistentes_catedras ;

CREATE VIEW vw_asistentes_catedras AS 
SELECT egresado.cedula AS 'Cedula', egresado.Nombre As 'Nombre', egresado.PrimerApellido As 'Primer apellido', 
egresado.CorreoElectronico As 'Correo', eventos.Nombre As 'Evento', eventos.Fecha
FROM egresado JOIN egresado_asiste_catedra ON EGRESADO_Cedula = egresado.cedula
JOIN catedra  ON CATEDRA_EVENTO_ID = EVENTO_ID JOIN eventos ON ID =EVENTO_ID;

SELECT * FROM vw_asistentes_catedras;



-- -----------------------------------------------------
-- VIEW vw_experiencia_laboral
-- Mostrar la experiencia laboral de una persona
-- -----------------------------------------------------

DROP VIEW IF EXISTS vw_experiencia_laboral ;

CREATE VIEW vw_experiencia_laboral AS 
SELECT egresado.cedula AS 'Cedula', egresado.Nombre As 'Nombre', egresado.PrimerApellido As 'Primer apellido',
Cargo, FechaInicio AS 'Fecha inicio', FechaFin AS 'Fecha fin', SituacionActual 'Situación actual' ,
empresa.Nombre AS 'Empresa'
FROM egresado JOIN experiencia_laboral ON EGRESADO_Cedula = Cedula 
JOIN empresa ON EMPRESA_NIT = NIT WHERE egresado.cedula = 1001003011;

SELECT * FROM vw_experiencia_laboral;


-- -----------------------------------------------------
-- VIEW vw_info_contacto_egresados_Bogota
-- Datos de contacto de los egresados de la sede Bogotá
-- -----------------------------------------------------

DROP VIEW IF EXISTS vw_info_contacto_egresados_Bogota ;

CREATE VIEW vw_info_contacto_egresados_Bogota AS 
SELECT egresado.cedula AS 'Cedula', egresado.Nombre As 'Nombre', egresado.PrimerApellido As 'Primer apellido',
egresado.SegundoApellido AS 'Segundo Apellido', Direccion, Ciudad, Pais, CorreoElectronico As 'Correo electronico',
Numero AS 'Telefono'
FROM egresado JOIN telefono ON EGRESADO_Cedula = Cedula;

SELECT * FROM vw_info_contacto_egresados_Bogota;


-- -----------------------------------------------------
-- VIEW vw_personal_apoyo_Bogota
-- Lista de personal de apoyo de la sede Bogotá
-- -----------------------------------------------------

DROP VIEW IF EXISTS vw_personal_apoyo_Bogota ;

CREATE VIEW vw_personal_apoyo_Bogota AS 

SELECT  Nombres, PrimerApellido AS 'Primer apellido', SegundoApellido 'Segundo Apellido',
Correo, Telefono, facultad.Nombre AS 'Facultad'
FROM personal_apoyo JOIN facultad ON PERSONAL_APOYO_Cedula = personal_apoyo.Cedula 
JOIN sede ON idSEDE = SEDE_idSEDE AND SEDE.Nombre = 'Universidad Nacional de Colombia - Bogotá';

SELECT * FROM vw_personal_apoyo_Bogota;



-- -----------------------------------------------------
-- VIEW  vw_cantidad_asisitentes_dialogos
-- Cantidad de asistentes a cada evento de dialogos egresados
-- -----------------------------------------------------

DROP VIEW IF EXISTS vw_cantidad_asisitentes_dialogos ;

CREATE VIEW vw_cantidad_asisitentes_dialogos AS 
SELECT eventos.ID AS 'ID', eventos.Nombre As 'Evento',  COUNT(DISTINCT egresado.cedula) AS asistentes
FROM egresado JOIN egresado_asiste_dialogos_egresados ON EGRESADO_Cedula = egresado.cedula
JOIN dialogos_egresados ON DIALOGOS_EGRESADOS_EVENTO_ID = EVENTO_ID JOIN eventos ON ID =EVENTO_ID
GROUP BY eventos.ID, eventos.Nombre;

SELECT * FROM vw_cantidad_asisitentes_dialogos;




-- -----------------------------------------------------
-- VIEW  vw_cantidad_asisitentes_catedra
-- Cantidad de asistentes a cada evento de catedra
-- -----------------------------------------------------

DROP VIEW IF EXISTS vw_cantidad_asisitentes_catedra ;

CREATE VIEW vw_cantidad_asisitentes_catedra AS 
SELECT eventos.ID AS 'ID', eventos.Nombre As 'Evento',  COUNT(DISTINCT egresado.cedula) AS asistentes
FROM egresado JOIN egresado_asiste_catedra ON EGRESADO_Cedula = egresado.cedula
JOIN catedra ON CATEDRA_EVENTO_ID = EVENTO_ID JOIN eventos ON ID =EVENTO_ID
GROUP BY eventos.ID, eventos.Nombre;

SELECT * FROM vw_cantidad_asisitentes_catedra;



-- -----------------------------------------------------
-- VIEW vw_lista_egresados_derecho_y_Ciencias_Politicas
-- Lista de Egresados de la facultad de derecho, ciencias politicas y sociales
-- -----------------------------------------------------

DROP VIEW IF EXISTS vw_lista_egresados_derecho_y_Ciencias_Politicas;

CREATE VIEW vw_lista_egresados_derecho_y_Ciencias_Politicas AS 
SELECT egresado.cedula AS 'Cedula', egresado.Nombre As 'Nombre', egresado.PrimerApellido As 'Primer apellido',
egresado.SegundoApellido AS 'Segundo Apellido', CorreoElectronico As 'Correo electronico', Numero AS 'Telefono',
facultad.Nombre AS 'Facultad'
FROM egresado JOIN telefono ON EGRESADO_Cedula = Cedula 
JOIN facultad ON FACULTAD_idFACULTAD = idFACULTAD AND idFACULTAD =010;

SELECT * FROM vw_lista_egresados_derecho_y_Ciencias_Politicas;



-- -----------------------------------------------------
-- VIEW vw_participantes_torneo_medellin
-- Lista de participantes en un torneo en la sede medellin con su correspondiente equipo
-- -----------------------------------------------------

DROP VIEW IF EXISTS vw_participantes_torneo_medellin;

CREATE VIEW vw_participantes_torneo_medellin AS 
SELECT egresado.cedula AS 'Cedula', egresado.Nombre As 'Nombre', egresado.PrimerApellido As 'Primer apellido',
egresado.SegundoApellido AS 'Segundo Apellido', CorreoElectronico As 'Correo electronico', Numero AS 'Telefono',
equipo.Nombre AS 'Equipo'
FROM egresado JOIN telefono ON EGRESADO_Cedula = Cedula 
JOIN equipo ON EQUIPO_ID = equipo.ID AND TORNEO_DEPORTIVO_EVENTO_ID = 1005 ;

SELECT * FROM vw_participantes_torneo_medellin;




-- -----------------------------------------------------
-- VIEW vw_ofertas_laborales
-- Lista de ofertas laboral con informacion de la empresa ofertante
-- -----------------------------------------------------

DROP VIEW IF EXISTS vw_ofertas_laborales ;

CREATE VIEW vw_ofertas_laborales AS 

SELECT No_oferta AS 'No Oferta', empresa.Nombre AS 'Empresa', Estado, Salario, 
ExpRequerida AS 'Experiencia requerida', Area, TipoContrato AS 'Tipo contrato',
empresa.Telefono AS 'Telefono contacto', empresa.CorreoElectronico AS 'Correo', 
representante_empresa.Correo AS 'Correo responsable'
FROM oferta_laboral JOIN empresa ON EMPRESA_NIT = NIT 
JOIN representante_empresa ON REPRESENTANTE_EMPRESA_Cedula = representante_empresa.Cedula;

SELECT * FROM vw_ofertas_laborales;

-- -----------------------------------------------------
-- VIEW vw_lista_egresados_Ingenieria
-- Lista de Egresados de la facultad de Ingenieria
-- -----------------------------------------------------

DROP VIEW IF EXISTS vw_lista_egresados_Ingenieria;

CREATE VIEW vw_lista_egresados_Ingenieria AS 
SELECT egresado.cedula AS 'Cedula', egresado.Nombre As 'Nombre', egresado.PrimerApellido As 'Primer apellido',
egresado.SegundoApellido AS 'Segundo Apellido', CorreoElectronico As 'Correo electronico', Numero AS 'Telefono',
facultad.Nombre AS 'Facultad'
FROM egresado JOIN telefono ON EGRESADO_Cedula = Cedula 
JOIN facultad ON FACULTAD_idFACULTAD = idFACULTAD AND idFACULTAD =001;

SELECT * FROM vw_lista_egresados_Ingenieria;