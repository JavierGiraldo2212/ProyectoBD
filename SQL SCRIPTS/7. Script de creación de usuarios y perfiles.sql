USE proyecto_bd;
-- Creación de Roles --
DROP ROLE IF exists 'Coordinador de Sede'@'localhost','Personal de Apoyo'@'localhost','Conferencista'@'localhost','Egresado'@'localhost';
CREATE ROLE 'Coordinador de Sede'@'localhost';
CREATE ROLE 'Personal de Apoyo'@'localhost';
CREATE ROLE 'Conferencista'@'localhost';
CREATE ROLE 'Egresado'@'localhost';
----------------------------------------------------
-- Asignación de permisos de acuerdo a las vistas --
----------------------------------------------------
-- Asitencia a los diálogos --
GRANT SELECT, UPDATE ON proyecto_bd.vw_asistentes_dialogos TO 'Coordinador de Sede'@'localhost';
GRANT SELECT, UPDATE ON proyecto_bd.vw_asistentes_dialogos TO 'Personal de Apoyo'@'localhost';
-- Asitencia a las cátedras --
GRANT SELECT, UPDATE ON proyecto_bd.vw_asistentes_catedras TO 'Coordinador de Sede'@'localhost';
GRANT SELECT, UPDATE ON proyecto_bd.vw_asistentes_catedras TO 'Personal de Apoyo'@'localhost';
-- Experiencia laboral --
GRANT SELECT, UPDATE ON proyecto_bd.vw_experiencia_laboral TO 'Coordinador de Sede'@'localhost';
GRANT SELECT, UPDATE ON proyecto_bd.vw_experiencia_laboral TO 'Personal de Apoyo'@'localhost';
GRANT SELECT, UPDATE ON proyecto_bd.vw_experiencia_laboral TO 'Egresado'@'localhost';
-- Lista de contacto de egresados --
GRANT SELECT, UPDATE ON proyecto_bd.vw_info_contacto_egresados_Bogota TO 'Coordinador de Sede'@'localhost';
GRANT SELECT, UPDATE ON proyecto_bd.vw_info_contacto_egresados_Bogota TO 'Personal de Apoyo'@'localhost';
-- Lista del personal de apoyo de la facultad --
GRANT SELECT, UPDATE ON proyecto_bd.vw_personal_apoyo_Bogota TO 'Coordinador de Sede'@'localhost';
-- Número de asistentes a diálogos --
GRANT SELECT, UPDATE ON proyecto_bd.vw_cantidad_asisitentes_dialogos TO 'Coordinador de Sede'@'localhost';
GRANT SELECT, UPDATE ON proyecto_bd.vw_cantidad_asisitentes_dialogos TO 'Personal de Apoyo'@'localhost';
GRANT SELECT, UPDATE ON proyecto_bd.vw_cantidad_asisitentes_dialogos TO 'Conferencista'@'localhost';
-- Número de asistentes a cátedra --
GRANT SELECT, UPDATE ON proyecto_bd.vw_cantidad_asisitentes_catedra TO 'Coordinador de Sede'@'localhost';
GRANT SELECT, UPDATE ON proyecto_bd.vw_cantidad_asisitentes_catedra TO 'Personal de Apoyo'@'localhost';
GRANT SELECT, UPDATE ON proyecto_bd.vw_cantidad_asisitentes_catedra TO 'Egresado'@'localhost';
-- Lista de egresados de derecho --
GRANT SELECT, UPDATE ON proyecto_bd.vw_cantidad_asisitentes_catedra TO 'Coordinador de Sede'@'localhost';
GRANT SELECT, UPDATE ON proyecto_bd.vw_cantidad_asisitentes_catedra TO 'Personal de Apoyo'@'localhost';
-- Ofertas laborales -- 
GRANT SELECT, UPDATE ON proyecto_bd.vw_ofertas_laborales TO 'Egresado'@'localhost';
------------------------------------------
-- Permisos generales para cada Rol --
------------------------------------------
--               Director               --
GRANT SELECT ON proyecto_bd.catedra TO 'Coordinador de Sede'@'localhost';
GRANT SELECT ON proyecto_bd.conferencista TO 'Coordinador de Sede'@'localhost';
GRANT SELECT ON proyecto_bd.dialogos_egresados TO 'Coordinador de Sede'@'localhost';
GRANT SELECT ON proyecto_bd.egresado TO 'Coordinador de Sede'@'localhost';
GRANT SELECT ON proyecto_bd.egresado_habla_idioma TO 'Coordinador de Sede'@'localhost';
GRANT SELECT ON proyecto_bd.eventos TO 'Coordinador de Sede'@'localhost';
GRANT SELECT ON proyecto_bd.facultad TO 'Coordinador de Sede'@'localhost';
GRANT SELECT ON proyecto_bd.sede TO 'Coordinador de Sede'@'localhost';
GRANT SELECT ON proyecto_bd.torneo_deportivo TO 'Coordinador de Sede'@'localhost';
GRANT SELECT ON proyecto_bd.oferta_laboral TO 'Coordinador de Sede'@'localhost';
GRANT SELECT ON proyecto_bd.personal_apoyo TO 'Coordinador de Sede'@'localhost';
GRANT SELECT ON proyecto_bd.equipo TO 'Coordinador de Sede'@'localhost';
GRANT SELECT ON proyecto_bd.empresa TO 'Coordinador de Sede'@'localhost';

--           Personal de Apoyo          --
GRANT SELECT ON proyecto_bd.catedra TO 'Personal de Apoyo'@'localhost';
GRANT SELECT ON proyecto_bd.conferencista TO 'Personal de Apoyo'@'localhost';
GRANT SELECT ON proyecto_bd.dialogos_egresados TO 'Personal de Apoyo'@'localhost';
GRANT SELECT ON proyecto_bd.egresado TO 'Personal de Apoyo'@'localhost';
GRANT SELECT ON proyecto_bd.egresado_habla_idioma TO 'Personal de Apoyo'@'localhost';
GRANT SELECT ON proyecto_bd.eventos TO 'Personal de Apoyo'@'localhost';
GRANT SELECT ON proyecto_bd.facultad TO 'Personal de Apoyo'@'localhost';
GRANT SELECT ON proyecto_bd.sede TO 'Personal de Apoyo'@'localhost';
GRANT SELECT ON proyecto_bd.torneo_deportivo TO 'Personal de Apoyo'@'localhost';
GRANT SELECT ON proyecto_bd.oferta_laboral TO 'Personal de Apoyo'@'localhost';
GRANT SELECT ON proyecto_bd.equipo TO 'Personal de Apoyo'@'localhost';
GRANT SELECT ON proyecto_bd.empresa TO 'Personal de Apoyo'@'localhost';

--                Egresado              --
GRANT SELECT ON proyecto_bd.sede TO 'Egresado'@'localhost';
GRANT SELECT ON proyecto_bd.facultad TO 'Egresado'@'localhost';
GRANT SELECT ON proyecto_bd.eventos TO 'Egresado'@'localhost';
GRANT SELECT ON proyecto_bd.torneo_deportivo TO 'Egresado'@'localhost';
GRANT SELECT ON proyecto_bd.equipo TO 'Egresado'@'localhost';
GRANT SELECT ON proyecto_bd.catedra TO 'Egresado'@'localhost';
GRANT SELECT ON proyecto_bd.dialogos_egresados TO 'Egresado'@'localhost';
GRANT SELECT ON proyecto_bd.oferta_laboral TO 'Egresado'@'localhost';

----------------------------------------------------
-- Asignación de permisos de acuerdo a las vistas --
----------------------------------------------------
GRANT EXECUTE ON PROCEDURE proyecto_bd.sp_ingresar_equipo TO 'Coordinador de Sede'@'localhost';
GRANT EXECUTE ON PROCEDURE proyecto_bd.sp_salir_equipo TO 'Coordinador de Sede'@'localhost';
GRANT EXECUTE ON FUNCTION proyecto_bd.f_promedio_edad_equipo TO 'Coordinador de Sede'@'localhost';
GRANT EXECUTE ON FUNCTION proyecto_bd.f_Tiempo_experiencia TO 'Coordinador de Sede'@'localhost';
GRANT EXECUTE ON FUNCTION proyecto_bd.f_Asistentes_catedra TO 'Coordinador de Sede'@'localhost';
GRANT EXECUTE ON FUNCTION proyecto_bd.f_Asistentes_dialogos TO 'Coordinador de Sede'@'localhost';

----------------------------------------------------
-- Creación de usuarios y asignación de roles --
----------------------------------------------------
CREATE USER 'johan.ramos'@'localhost' IDENTIFIED BY '11223300';
GRANT 'Personal de Apoyo'@'localhost' TO 'johan.ramos'@'localhost';
CREATE USER 'brian.perez'@'localhost' IDENTIFIED BY '11223311';
GRANT 'Personal de Apoyo'@'localhost' TO 'brian.perez'@'localhost';
CREATE USER 'gustavo.cortes'@'localhost' IDENTIFIED BY '11223322';
GRANT 'Personal de Apoyo'@'localhost' TO 'gustavo.cortes'@'localhost';
CREATE USER 'john.amaya'@'localhost' IDENTIFIED BY '11223333';
GRANT 'Personal de Apoyo'@'localhost' TO 'john.amaya'@'localhost';
CREATE USER 'lucho.flores'@'localhost' IDENTIFIED BY '11223344';
GRANT 'Personal de Apoyo'@'localhost' TO 'lucho.flores'@'localhost';
CREATE USER 'ximena.peña'@'localhost' IDENTIFIED BY '11223355';
GRANT 'Personal de Apoyo'@'localhost' TO 'ximena.peña'@'localhost';
CREATE USER 'eva.ospina'@'localhost' IDENTIFIED BY '11223366';
GRANT 'Personal de Apoyo'@'localhost' TO 'eva.ospina'@'localhost';
CREATE USER 'sara.samchez'@'localhost' IDENTIFIED BY '11223377';
GRANT 'Personal de Apoyo'@'localhost' TO 'sara.samchez'@'localhost';
CREATE USER 'alejandra.ramirez'@'localhost' IDENTIFIED BY '11223388';
GRANT 'Personal de Apoyo'@'localhost' TO 'alejandra.ramirez'@'localhost';
CREATE USER 'paul.gonzales'@'localhost' IDENTIFIED BY '11223399';
GRANT 'Personal de Apoyo'@'localhost' TO 'paul.gonzales'@'localhost';

CREATE USER 'diana.perez001'@'localhost' IDENTIFIED BY '11220011';
GRANT 'Egresado'@'localhost' TO 'diana.perez001'@'localhost';
CREATE USER 'maria.rodriguez001'@'localhost' IDENTIFIED BY '11220022';
GRANT 'Egresado'@'localhost' TO 'maria.rodriguez001'@'localhost';
CREATE USER 'fernanda.garcia001'@'localhost' IDENTIFIED BY '11220033';
GRANT 'Egresado'@'localhost' TO 'fernanda.garcia001'@'localhost';
CREATE USER 'luisa.garcia005'@'localhost' IDENTIFIED BY '11220014';
GRANT 'Egresado'@'localhost' TO 'luisa.garcia005'@'localhost';
CREATE USER 'isabel.mendoza005'@'localhost' IDENTIFIED BY '11220015';
GRANT 'Egresado'@'localhost' TO 'isabel.mendoza005'@'localhost';
CREATE USER 'andrea.gonzalez005'@'localhost' IDENTIFIED BY '11220016';
GRANT 'Egresado'@'localhost' TO 'andrea.gonzalez005'@'localhost';
CREATE USER 'camila.castro009'@'localhost' IDENTIFIED BY '11220025';
GRANT 'Egresado'@'localhost' TO 'camila.castro009'@'localhost';
CREATE USER 'lorena.paredes'@'localhost' IDENTIFIED BY '11220026';
GRANT 'Egresado'@'localhost' TO 'lorena.paredes'@'localhost';
CREATE USER 'jose.hernandez002'@'localhost' IDENTIFIED BY '11220004';
GRANT 'Egresado'@'localhost' TO 'jose.hernandez002'@'localhost';
CREATE USER 'luis.ramirez002'@'localhost' IDENTIFIED BY '11220005';
GRANT 'Egresado'@'localhost' TO 'luis.ramirez002'@'localhost';
CREATE USER 'lautaro.sanchez002'@'localhost' IDENTIFIED BY '11220006';
GRANT 'Egresado'@'localhost' TO 'lautaro.sanchez002'@'localhost';
CREATE USER 'martin.soto006'@'localhost' IDENTIFIED BY '11220016';
GRANT 'Egresado'@'localhost' TO 'martin.soto006'@'localhost';
CREATE USER 'alberto.moreno006'@'localhost' IDENTIFIED BY '11220017';
GRANT 'Egresado'@'localhost' TO 'alberto.moreno006'@'localhost';
CREATE USER 'patricio.ortiz006'@'localhost' IDENTIFIED BY '11220018';
GRANT 'Egresado'@'localhost' TO 'patricio.ortiz006'@'localhost';
CREATE USER 'miguel.lopez003'@'localhost' IDENTIFIED BY '11220007';
GRANT 'Egresado'@'localhost' TO 'miguel.lopez003'@'localhost';
CREATE USER 'lucia.diaz003'@'localhost' IDENTIFIED BY '11220008';
GRANT 'Egresado'@'localhost' TO 'lucia.diaz003'@'localhost';
CREATE USER 'jorge.martinez003'@'localhost' IDENTIFIED BY '11220009';
GRANT 'Egresado'@'localhost' TO 'jorge.martinez003'@'localhost';
CREATE USER 'fernando.cruz007'@'localhost' IDENTIFIED BY '11220019';
GRANT 'Egresado'@'localhost' TO 'fernando.cruz007'@'localhost';
CREATE USER 'claudia.pena007'@'localhost' IDENTIFIED BY '11220020';
GRANT 'Egresado'@'localhost' TO 'claudia.pena007'@'localhost';
CREATE USER 'ricardo.vargas007'@'localhost' IDENTIFIED BY '11220021';
GRANT 'Egresado'@'localhost' TO 'ricardo.vargas007'@'localhost';
CREATE USER 'sara.gomez004'@'localhost' IDENTIFIED BY '11220010';
GRANT 'Egresado'@'localhost' TO 'sara.gomez004'@'localhost';
CREATE USER 'pedro.ruiz004'@'localhost' IDENTIFIED BY '11220011';
GRANT 'Egresado'@'localhost' TO 'pedro.ruiz004'@'localhost';
CREATE USER 'elena.hernandez004'@'localhost' IDENTIFIED BY '11220012';
GRANT 'Egresado'@'localhost' TO 'elena.hernandez004'@'localhost';
CREATE USER 'beatriz.fernandez008'@'localhost' IDENTIFIED BY '11220022';
GRANT 'Egresado'@'localhost' TO 'beatriz.fernandez008'@'localhost';
CREATE USER 'gustavo.guerrero008'@'localhost' IDENTIFIED BY '11220023';
GRANT 'Egresado'@'localhost' TO 'gustavo.guerrero008'@'localhost';
CREATE USER 'nathalia.ruiz008'@'localhost' IDENTIFIED BY '11220024';
GRANT 'Egresado'@'localhost' TO 'nathalia.ruiz008'@'localhost';
CREATE USER 'raul.perez'@'localhost' IDENTIFIED BY '11220031';
GRANT 'Egresado'@'localhost' TO 'raul.perez'@'localhost';
CREATE USER 'maria.gomez'@'localhost' IDENTIFIED BY '11220032';
GRANT 'Egresado'@'localhost' TO 'maria.gomez'@'localhost';
CREATE USER 'carlos.rodriguez'@'localhost' IDENTIFIED BY '11220033';
GRANT 'Egresado'@'localhost' TO 'carlos.rodriguez'@'localhost';
CREATE USER 'laura.fernandez'@'localhost' IDENTIFIED BY '11220034';
GRANT 'Egresado'@'localhost' TO 'laura.fernandez'@'localhost';
CREATE USER 'andres.hernandez'@'localhost' IDENTIFIED BY '11220035';
GRANT 'Egresado'@'localhost' TO 'andres.hernandez'@'localhost';
CREATE USER 'paula.diaz'@'localhost' IDENTIFIED BY '11220036';
GRANT 'Egresado'@'localhost' TO 'paula.diaz'@'localhost';
CREATE USER 'santiago.morales'@'localhost' IDENTIFIED BY '11220037';
GRANT 'Egresado'@'localhost' TO 'santiago.morales'@'localhost';
CREATE USER 'angela.torres'@'localhost' IDENTIFIED BY '11220038';
GRANT 'Egresado'@'localhost' TO 'angela.torres'@'localhost';
CREATE USER 'javier.vega'@'localhost' IDENTIFIED BY '11220039';
GRANT 'Egresado'@'localhost' TO 'javier.vega'@'localhost';
CREATE USER 'isabel.mendoza'@'localhost' IDENTIFIED BY '11220040';
GRANT 'Egresado'@'localhost' TO 'isabel.mendoza'@'localhost';

CREATE USER 'armando.arias'@'localhost' IDENTIFIED BY '11221100';
GRANT 'Conferencista'@'localhost' TO 'armando.arias'@'localhost';
CREATE USER 'Cecilia.Orosco'@'localhost' IDENTIFIED BY '11221101';
GRANT 'Conferencista'@'localhost' TO 'Cecilia.Orosco'@'localhost';
CREATE USER 'Ana.Obregon'@'localhost' IDENTIFIED BY '11221102';
GRANT 'Conferencista'@'localhost' TO 'Ana.Obregon'@'localhost';

CREATE USER 'alexander.contreras'@'localhost' IDENTIFIED BY '11224400';
GRANT 'Coordinador de Sede'@'localhost' TO 'alexander.contreras'@'localhost';
CREATE USER 'diego.amaya'@'localhost' IDENTIFIED BY '11224401';
GRANT 'Coordinador de Sede'@'localhost' TO 'diego.amaya'@'localhost';
CREATE USER 'laura.gonzalez'@'localhost' IDENTIFIED BY '11224402';
GRANT 'Coordinador de Sede'@'localhost' TO 'laura.gonzalez'@'localhost';
CREATE USER 'carlos.ramirez'@'localhost' IDENTIFIED BY '11224403';
GRANT 'Coordinador de Sede'@'localhost' TO 'carlos.ramirez'@'localhost';






